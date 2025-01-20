unsigned __int8 *StringPool::cacheString@<X0>(uint64_t a1@<X0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X8>)
{
  unsigned __int8 *result;
  unsigned __int8 *v5;
  uint64_t v6;
  char v7;

  result = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string const&>(a1, a2, (uint64_t)a2);
  if (result)
  {
    if ((char)result[39] < 0)
    {
      v5 = (unsigned __int8 *)*((void *)result + 2);
      v6 = *((void *)result + 3);
    }
    else
    {
      v5 = result + 16;
      v6 = result[39];
    }
    *(void *)a3 = v5;
    *(void *)(a3 + 8) = v6;
    v7 = 1;
  }
  else
  {
    v7 = 0;
    *(unsigned char *)a3 = 0;
  }
  *(unsigned char *)(a3 + 16) = v7;
  return result;
}

unsigned __int8 *std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string const&>(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  v7 = (void *)(a1 + 24);
  unint64_t v8 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  unint64_t v9 = v8;
  unint64_t v10 = *(void *)(a1 + 8);
  if (v10)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    unint64_t v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v3 = v8;
      if (v8 >= v10) {
        unint64_t v3 = v8 % v10;
      }
    }
    else
    {
      unint64_t v3 = (v10 - 1) & v8;
    }
    v13 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v3);
    if (v13)
    {
      for (i = *v13; i; i = *(unsigned __int8 **)i)
      {
        unint64_t v15 = *((void *)i + 1);
        if (v15 == v9)
        {
          if (std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2)) {
            return i;
          }
        }
        else
        {
          if (v12 > 1)
          {
            if (v15 >= v10) {
              v15 %= v10;
            }
          }
          else
          {
            v15 &= v10 - 1;
          }
          if (v15 != v3) {
            break;
          }
        }
      }
    }
  }
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__construct_node_hash<std::string const&>(a1, v9, a3, (uint64_t)v25);
  float v16 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v17 = *(float *)(a1 + 32);
  if (!v10 || (float)(v17 * (float)v10) < v16)
  {
    BOOL v18 = 1;
    if (v10 >= 3) {
      BOOL v18 = (v10 & (v10 - 1)) != 0;
    }
    unint64_t v19 = v18 | (2 * v10);
    unint64_t v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20) {
      size_t v21 = v20;
    }
    else {
      size_t v21 = v19;
    }
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v21);
    unint64_t v10 = *(void *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10) {
        unint64_t v3 = v9 % v10;
      }
      else {
        unint64_t v3 = v9;
      }
    }
    else
    {
      unint64_t v3 = (v10 - 1) & v9;
    }
  }
  v22 = *(void **)(*(void *)a1 + 8 * v3);
  if (v22)
  {
    *(void *)v25[0] = *v22;
    void *v22 = v25[0];
  }
  else
  {
    *(void *)v25[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v25[0];
    *(void *)(*(void *)a1 + 8 * v3) = a1 + 16;
    if (*(void *)v25[0])
    {
      unint64_t v23 = *(void *)(*(void *)v25[0] + 8);
      if ((v10 & (v10 - 1)) != 0)
      {
        if (v23 >= v10) {
          v23 %= v10;
        }
      }
      else
      {
        v23 &= v10 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v23) = v25[0];
    }
  }
  i = (unsigned __int8 *)v25[0];
  ++*v7;
  return i;
}

void sub_2345B5F2C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::string,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

unint64_t std::__string_hash<char>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v3 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v3 = v2;
  }
  return std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)&v5, (uint64_t *)a2, v3);
}

uint64_t std::equal_to<std::string>::operator()[abi:ne180100](uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unint64_t v3 = a3;
  uint64_t v4 = a2[23];
  if ((v4 & 0x80u) == 0) {
    uint64_t v5 = a2[23];
  }
  else {
    uint64_t v5 = *((void *)a2 + 1);
  }
  uint64_t v6 = a3[23];
  int v7 = (char)v6;
  if ((v6 & 0x80u) != 0) {
    uint64_t v6 = *((void *)a3 + 1);
  }
  if (v5 != v6) {
    return 0;
  }
  if (v7 < 0) {
    unint64_t v3 = *(unsigned __int8 **)a3;
  }
  if ((v4 & 0x80) != 0) {
    return memcmp(*(const void **)a2, v3, *((void *)a2 + 1)) == 0;
  }
  if (!a2[23]) {
    return 1;
  }
  uint64_t v8 = v4 - 1;
  do
  {
    int v10 = *a2++;
    int v9 = v10;
    int v12 = *v3++;
    int v11 = v12;
    BOOL v14 = v8-- != 0;
    uint64_t result = v9 == v11;
  }
  while (v9 == v11 && v14);
  return result;
}

void std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__construct_node_hash<std::string const&>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  uint64_t v8 = operator new(0x28uLL);
  *(void *)(a4 + 8) = v7;
  *(void *)a4 = v8;
  *(unsigned char *)(a4 + 16) = 0;
  *uint64_t v8 = 0;
  v8[1] = a2;
  int v9 = (std::string *)(v8 + 2);
  if (*(char *)(a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = *(_OWORD *)a3;
    v9->__r_.__value_.__r.__words[2] = *(void *)(a3 + 16);
  }
  *(unsigned char *)(a4 + 16) = 1;
}

void sub_2345B60C0(_Unwind_Exception *a1)
{
  void *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::string,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100](uint64_t a1, uint64_t *a2, unint64_t a3)
{
  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      uint64_t v4 = *(uint64_t *)((char *)a2 + a3 - 48);
      uint64_t v5 = *(uint64_t *)((char *)a2 + a3 - 40);
      uint64_t v6 = *(uint64_t *)((char *)a2 + a3 - 24);
      uint64_t v8 = *(uint64_t *)((char *)a2 + a3 - 64);
      uint64_t v7 = *(uint64_t *)((char *)a2 + a3 - 56);
      uint64_t v9 = *(uint64_t *)((char *)a2 + a3 - 16);
      uint64_t v10 = *(uint64_t *)((char *)a2 + a3 - 8);
      unint64_t v11 = v7 + v9;
      unint64_t v12 = 0x9DDFEA08EB382D69
          * (v6 ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))) >> 47) ^ (0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))));
      unint64_t v13 = 0x9DDFEA08EB382D69 * (v12 ^ (v12 >> 47));
      unint64_t v14 = v8 + a3 + v7 + v4;
      uint64_t v15 = v14 + v5;
      unint64_t v16 = __ROR8__(v14, 44) + v8 + a3 + __ROR8__(v5 + v8 + a3 - 0x622015F714C7D297 * (v12 ^ (v12 >> 47)), 21);
      uint64_t v17 = v7 + v9 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      uint64_t v18 = v17 + v6 + v9;
      uint64_t v19 = __ROR8__(v18, 44);
      uint64_t v20 = v18 + v10;
      uint64_t v21 = v19 + v17 + __ROR8__(v17 + v5 + v10, 21);
      uint64_t v23 = *a2;
      v22 = a2 + 4;
      unint64_t v24 = v23 - 0x4B6D499041670D8DLL * v5;
      uint64_t v25 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        uint64_t v26 = *(v22 - 3);
        uint64_t v27 = v24 + v15 + v11 + v26;
        uint64_t v28 = v22[2];
        uint64_t v29 = v22[3];
        uint64_t v30 = v22[1];
        unint64_t v11 = v30 + v15 - 0x4B6D499041670D8DLL * __ROR8__(v11 + v16 + v28, 42);
        uint64_t v31 = v13 + v20;
        uint64_t v32 = *(v22 - 2);
        uint64_t v33 = *(v22 - 1);
        uint64_t v34 = *(v22 - 4) - 0x4B6D499041670D8DLL * v16;
        uint64_t v35 = v34 + v20 + v33;
        uint64_t v36 = v34 + v26 + v32;
        uint64_t v15 = v36 + v33;
        uint64_t v37 = __ROR8__(v36, 44) + v34;
        unint64_t v38 = (0xB492B66FBE98F273 * __ROR8__(v27, 37)) ^ v21;
        unint64_t v24 = 0xB492B66FBE98F273 * __ROR8__(v31, 33);
        unint64_t v16 = v37 + __ROR8__(v35 + v38, 21);
        unint64_t v39 = v24 + v21 + *v22;
        uint64_t v20 = v39 + v30 + v28 + v29;
        uint64_t v21 = __ROR8__(v39 + v30 + v28, 44) + v39 + __ROR8__(v11 + v32 + v39 + v29, 21);
        v22 += 8;
        unint64_t v13 = v38;
        v25 += 64;
      }
      while (v25);
      unint64_t v40 = v24
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) ^ ((0x9DDFEA08EB382D69 * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) >> 47));
      unint64_t v41 = 0x9DDFEA08EB382D69
          * (v40 ^ (v38
                  - 0x4B6D499041670D8DLL * (v11 ^ (v11 >> 47))
                  - 0x622015F714C7D297
                  * ((0x9DDFEA08EB382D69
                    * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) ^ ((0x9DDFEA08EB382D69 * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) >> 47))));
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) ^ ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) >> 47));
    }
    else
    {
      return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](a2, a3);
    }
  }
  else if (a3 > 0x10)
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](a2, a3);
  }
  else
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](a2, a3);
  }
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](_DWORD *a1, unint64_t a2)
{
  if (a2 < 9)
  {
    if (a2 < 4)
    {
      unint64_t result = 0x9AE16A3B2F90404FLL;
      if (a2)
      {
        unint64_t v8 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                      * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v8 ^ (v8 >> 47));
      }
    }
    else
    {
      uint64_t v6 = *(unsigned int *)((char *)a1 + a2 - 4);
      unint64_t v7 = 0x9DDFEA08EB382D69 * (((8 * *a1) + a2) ^ v6);
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) >> 47));
    }
  }
  else
  {
    uint64_t v3 = *(void *)((char *)a1 + a2 - 8);
    uint64_t v4 = __ROR8__(v3 + a2, a2);
    return (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)))) >> 47))) ^ v3;
  }
  return result;
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](void *a1, uint64_t a2)
{
  uint64_t v2 = a1[1];
  unint64_t v3 = 0xB492B66FBE98F273 * *a1;
  uint64_t v4 = __ROR8__(0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8), 30) + __ROR8__(v3 - v2, 43);
  unint64_t v5 = v3 + a2 + __ROR8__(v2 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8);
  unint64_t v6 = 0x9DDFEA08EB382D69 * (v5 ^ (v4 - 0x3C5A37A36834CED9 * *(void *)((char *)a1 + a2 - 16)));
  return 0x9DDFEA08EB382D69
       * ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) ^ ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) >> 47));
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)((char *)a1 + a2 - 16);
  uint64_t v3 = *a1 - 0x3C5A37A36834CED9 * (v2 + a2);
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = __ROR8__(v3 + v4, 52);
  uint64_t v7 = v3 + a1[1];
  uint64_t v8 = __ROR8__(v7, 7);
  uint64_t v9 = v7 + v5;
  uint64_t v10 = *(void *)((char *)a1 + a2 - 32) + v5;
  uint64_t v11 = v8 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v2 + a2), 37) + v6 + __ROR8__(v9, 31);
  uint64_t v12 = *(void *)((char *)a1 + a2 - 24) + v10 + v2;
  unint64_t v13 = 0xC3A5C85C97CB3127 * (v12 + *(void *)((char *)a1 + a2 - 8) + v4 + v11)
      - 0x651E95C4D06FBFB1
      * (v9
       + v4
       + __ROR8__(v10, 37)
       + __ROR8__(*(void *)((char *)a1 + a2 - 24) + v10, 7)
       + __ROR8__(*(void *)((char *)a1 + a2 - 8) + v4 + v10, 52)
       + __ROR8__(v12, 31));
  return 0x9AE16A3B2F90404FLL
       * ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) ^ ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) >> 47));
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
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
    uint64_t v8 = (std::string *)operator new(v6 + 1);
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
  __cxa_throw(exception, (struct type_info *)off_264BF40C0, MEMORY[0x263F8C060]);
}

void sub_2345B6690(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  unint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(uint64_t a1, size_t __n)
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
      std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__do_rehash<true>(a1, prime);
    }
  }
}

void std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
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
      uint64_t v11 = (void *)*v7;
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
            void *v7 = *v11;
            *uint64_t v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            uint64_t v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          uint64_t v11 = (void *)*v11;
          unint64_t v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    uint64_t v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::string,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
{
  if (*(unsigned char *)(a1 + 8))
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

void StackshotAotImageDescription::StackshotAotImageDescription(StackshotAotImageDescription *this, user64_dyld_aot_info *a2)
{
}

{
  AOTImageDescription::AOTImageDescription(this, a2->x86LoadAddress, a2->aotLoadAddress, a2->aotImageSize, a2->aotImageKey);
}

void AOTImageDescription::AOTImageDescription(AOTImageDescription *this)
{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
}

{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
}

void AOTImageDescription::AOTImageDescription(AOTImageDescription *this, uint64_t a2, uint64_t a3, uint64_t a4, const unsigned __int8 *a5)
{
  *(void *)this = a2;
  *((void *)this + 1) = a3;
  *((void *)this + 2) = a4;
  long long v5 = *(_OWORD *)a5;
  *(_OWORD *)((char *)this + 40) = *((_OWORD *)a5 + 1);
  *(_OWORD *)((char *)this + 24) = v5;
}

{
  long long v5;

  *(void *)this = a2;
  *((void *)this + 1) = a3;
  *((void *)this + 2) = a4;
  long long v5 = *(_OWORD *)a5;
  *(_OWORD *)((char *)this + 40) = *((_OWORD *)a5 + 1);
  *(_OWORD *)((char *)this + 24) = v5;
}

uint64_t AOTImageDescription::x86Address(AOTImageDescription *this)
{
  return *(void *)this;
}

uint64_t AOTImageDescription::aotAddress(AOTImageDescription *this)
{
  return *((void *)this + 1);
}

uint64_t AOTImageDescription::aotSize(AOTImageDescription *this)
{
  return *((void *)this + 2);
}

uint64_t AOTImageDescription::aotImageKeySize(AOTImageDescription *this)
{
  return 32;
}

uint64_t AOTImageDescription::aotImageKey(AOTImageDescription *this)
{
  return (uint64_t)this + 24;
}

void ats_create_symbolication_config()
{
}

uint64_t ats_destroy_symbolication_config(uint64_t result)
{
  if (result) {
    JUMPOUT(0x237DC1B90);
  }
  return result;
}

uint64_t AOTImage::AOTImage(uint64_t a1, long long *a2)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  uint64_t v3 = (AOTImageDescription *)(a1 + 16);
  long long v4 = *a2;
  long long v5 = a2[1];
  long long v6 = a2[2];
  *(void *)(a1 + 64) = *((void *)a2 + 6);
  *(_OWORD *)(a1 + 32) = v5;
  *(_OWORD *)(a1 + 48) = v6;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)a1 = AOTImageDescription::aotAddress((AOTImageDescription *)(a1 + 16));
  *(void *)(a1 + 8) = AOTImageDescription::aotSize(v3);
  return a1;
}

{
  AOTImageDescription *v3;
  long long v4;
  long long v5;
  long long v6;

  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  uint64_t v3 = (AOTImageDescription *)(a1 + 16);
  long long v4 = *a2;
  long long v5 = a2[1];
  long long v6 = a2[2];
  *(void *)(a1 + 64) = *((void *)a2 + 6);
  *(_OWORD *)(a1 + 32) = v5;
  *(_OWORD *)(a1 + 48) = v6;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)a1 = AOTImageDescription::aotAddress((AOTImageDescription *)(a1 + 16));
  *(void *)(a1 + 8) = AOTImageDescription::aotSize(v3);
  return a1;
}

uint64_t AOTImage::translateFromNativeAddress(AOTImage *this, void *a2)
{
  return 0;
}

__n128 AOTImage::aotImageInfo@<Q0>(AOTImage *this@<X0>, uint64_t a2@<X8>)
{
  long long v2 = *((_OWORD *)this + 2);
  *(_OWORD *)a2 = *((_OWORD *)this + 1);
  *(_OWORD *)(a2 + 16) = v2;
  __n128 result = *((__n128 *)this + 3);
  *(__n128 *)(a2 + 32) = result;
  *(void *)(a2 + 48) = *((void *)this + 8);
  return result;
}

uint64_t Process::Process(uint64_t a1, int a2, uint64_t a3)
{
  *(_DWORD *)a1 = a2;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 8) = 0;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)a3;
  *(void *)(a1 + 24) = *(void *)(a3 + 16);
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  long long v4 = *(long long **)(a1 + 8);
  unint64_t v5 = *(void *)(a1 + 16);
  unint64_t v6 = 126 - 2 * __clz((uint64_t)(v5 - (void)v4) >> 5);
  *(void *)(a1 + 32) = 0;
  *(unsigned char *)(a1 + 104) = 0;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  *(unsigned char *)(a1 + 56) = 0;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  if ((long long *)v5 == v4) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = v6;
  }
  std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *,false>(v4, v5, (uint64_t)v9, v7, 1);
  return a1;
}

void sub_2345B6BFC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  unint64_t v5 = *(std::__shared_weak_count **)(v2 + 136);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  Process::Process(v2, v3);
  std::vector<ProcessLibrary>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

void Process::setSharedCache(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v2 = a2[1];
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  long long v4 = *(std::__shared_weak_count **)(a1 + 136);
  *(void *)(a1 + 128) = v3;
  *(void *)(a1 + 136) = v2;
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
}

__n128 Process::setAOTSharedCache(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 104)) {
    *(unsigned char *)(a1 + 104) = 0;
  }
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 72) = v3;
  *(__n128 *)(a1 + 56) = result;
  *(unsigned char *)(a1 + 104) = 1;
  return result;
}

double Process::setAOTImages(uint64_t a1, __n128 *a2)
{
  uint64_t v4 = a2->n128_u64[0];
  unint64_t v5 = (long long *)a2->n128_u64[1];
  unint64_t v6 = 126 - 2 * __clz(0x8E38E38E38E38E39 * (((uint64_t)v5 - v4) >> 3));
  if (v5 == (long long *)v4) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = v6;
  }
  std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *,false>(v4, v5, (uint64_t)&v9, v7, 1);
  *(void *)&double result = std::vector<AOTImage>::__move_assign(a1 + 32, a2).n128_u64[0];
  return result;
}

void Process::setAOTSymbolicator(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v2 = a2[1];
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v4 = *(std::__shared_weak_count **)(a1 + 120);
  *(void *)(a1 + 112) = v3;
  *(void *)(a1 + 120) = v2;
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
}

uint64_t Process::libraries(Process *this)
{
  return (uint64_t)this + 8;
}

uint64_t Process::pid(Process *this)
{
  return *(unsigned int *)this;
}

uint64_t Process::aotImages(Process *this)
{
  return (uint64_t)this + 32;
}

__n128 Process::aotSharedCache@<Q0>(Process *this@<X0>, uint64_t a2@<X8>)
{
  long long v2 = *(_OWORD *)((char *)this + 72);
  *(_OWORD *)a2 = *(_OWORD *)((char *)this + 56);
  *(_OWORD *)(a2 + 16) = v2;
  __n128 result = *(__n128 *)((char *)this + 88);
  *(__n128 *)(a2 + 32) = result;
  *(void *)(a2 + 48) = *((void *)this + 13);
  return result;
}

uint64_t Process::sharedCache(Process *this)
{
  return (uint64_t)this + 128;
}

uint64_t Process::translateFromNativeAddress(Process *this)
{
  return 0;
}

ProcessLibrary *Process::addAddressAndTryTranslation(Process *this, unint64_t a2)
{
  __n128 result = (ProcessLibrary *)Process::findRangeEntryForAddress<std::vector<ProcessLibrary>>((uint64_t)this, (void *)this + 1, a2);
  if (*((ProcessLibrary **)this + 2) != result)
  {
    return ProcessLibrary::addAddress(result, a2);
  }
  return result;
}

void *Process::findLibraryForAddress(Process *this, unint64_t a2)
{
  return Process::findRangeEntryForAddress<std::vector<ProcessLibrary>>((uint64_t)this, (void *)this + 1, a2);
}

ProcessLibrary *Process::addAddresses(ProcessLibrary *this, unint64_t **a2)
{
  long long v2 = *a2;
  uint64_t v3 = a2[1];
  if (*a2 != v3)
  {
    uint64_t v4 = this;
    do
    {
      unint64_t v5 = *v2++;
      this = Process::addAddressAndTryTranslation(v4, v5);
    }
    while (v2 != v3);
  }
  return this;
}

ProcessLibrary *Process::addAddressesAndTryTranslation(ProcessLibrary *this, unint64_t **a2)
{
  long long v2 = *a2;
  uint64_t v3 = a2[1];
  if (*a2 != v3)
  {
    uint64_t v4 = this;
    do
    {
      unint64_t v5 = *v2++;
      this = Process::addAddressAndTryTranslation(v4, v5);
    }
    while (v2 != v3);
  }
  return this;
}

void Process::addAOTImages(uint64_t a1, char **a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v2 = *a2;
  uint64_t v3 = a2[1];
  if (v3 != *a2)
  {
    int v5 = 0;
    unint64_t v6 = (void **)(a1 + 32);
    do
    {
      memmove(__dst, v2, 0x48uLL);
      v5 |= Process::addRangeLibrary<std::vector<AOTImage>,AOTImage>(a1, v6, (uint64_t)__dst);
      v2 += 72;
    }
    while (v2 != v3);
    if (v5)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      unint64_t v8 = *(long long **)(a1 + 40);
      unint64_t v9 = 126 - 2 * __clz(0x8E38E38E38E38E39 * (((uint64_t)v8 - v7) >> 3));
      if (v8 == (long long *)v7) {
        uint64_t v10 = 0;
      }
      else {
        uint64_t v10 = v9;
      }
      std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *,false>(v7, v8, (uint64_t)&v11, v10, 1);
    }
  }
}

uint64_t Process::addRangeLibrary<std::vector<AOTImage>,AOTImage>(uint64_t a1, void **a2, uint64_t a3)
{
  int v5 = (char *)Process::findRangeEntryForAddress<std::vector<AOTImage>>(a1, a2, *(void *)a3);
  unint64_t v6 = v5;
  uint64_t v7 = (char *)a2[1];
  if (v7 == v5)
  {
    unint64_t v16 = (unint64_t)a2[2];
    if (v16 > (unint64_t)v5)
    {
      *(_OWORD *)int v5 = *(_OWORD *)a3;
      long long v17 = *(_OWORD *)(a3 + 16);
      long long v18 = *(_OWORD *)(a3 + 32);
      long long v19 = *(_OWORD *)(a3 + 48);
      *((void *)v5 + 8) = *(void *)(a3 + 64);
      *((_OWORD *)v5 + 2) = v18;
      *((_OWORD *)v5 + 3) = v19;
      *((_OWORD *)v5 + 1) = v17;
      uint64_t v15 = v5 + 72;
      goto LABEL_37;
    }
    unint64_t v25 = 0x8E38E38E38E38E39 * ((v7 - (unsigned char *)*a2) >> 3);
    unint64_t v26 = v25 + 1;
    if (v25 + 1 <= 0x38E38E38E38E38ELL)
    {
      unint64_t v27 = 0x8E38E38E38E38E39 * ((uint64_t)(v16 - (void)*a2) >> 3);
      if (2 * v27 > v26) {
        unint64_t v26 = 2 * v27;
      }
      if (v27 >= 0x1C71C71C71C71C7) {
        unint64_t v28 = 0x38E38E38E38E38ELL;
      }
      else {
        unint64_t v28 = v26;
      }
      if (v28) {
        uint64_t v29 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AOTImage>>((uint64_t)(a2 + 2), v28);
      }
      else {
        uint64_t v29 = 0;
      }
      uint64_t v30 = &v29[72 * v25];
      uint64_t v31 = &v29[72 * v28];
      *(_OWORD *)uint64_t v30 = *(_OWORD *)a3;
      long long v40 = *(_OWORD *)(a3 + 16);
      long long v41 = *(_OWORD *)(a3 + 32);
      long long v42 = *(_OWORD *)(a3 + 48);
      *((void *)v30 + 8) = *(void *)(a3 + 64);
      *((_OWORD *)v30 + 2) = v41;
      *((_OWORD *)v30 + 3) = v42;
      *((_OWORD *)v30 + 1) = v40;
      uint64_t v15 = v30 + 72;
      v43 = (char *)*a2;
      uint64_t v35 = (char *)a2[1];
      if (v35 == *a2) {
        goto LABEL_35;
      }
      do
      {
        *(_OWORD *)(v30 - 72) = *(_OWORD *)(v35 - 72);
        long long v44 = *(_OWORD *)(v35 - 56);
        long long v45 = *(_OWORD *)(v35 - 40);
        long long v46 = *(_OWORD *)(v35 - 24);
        *((void *)v30 - 1) = *((void *)v35 - 1);
        *(_OWORD *)(v30 - 24) = v46;
        *(_OWORD *)(v30 - 40) = v45;
        *(_OWORD *)(v30 - 56) = v44;
        v30 -= 72;
        v35 -= 72;
      }
      while (v35 != v43);
      goto LABEL_34;
    }
LABEL_38:
    std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
  }
  if (*(void *)v5 == *(void *)a3 && *((void *)v5 + 1) == *(void *)(a3 + 8)) {
    return 0;
  }
  int64_t v9 = v7 - (v5 + 72);
  if (v7 != v5 + 72) {
    memmove(v5, v5 + 72, v7 - (v5 + 72));
  }
  uint64_t v10 = (char *)v6 + v9;
  char v11 = a2[2];
  a2[1] = (char *)v6 + v9;
  if ((char *)v6 + v9 >= v11)
  {
    unint64_t v20 = 0x8E38E38E38E38E39 * ((v10 - (unsigned char *)*a2) >> 3);
    unint64_t v21 = v20 + 1;
    if (v20 + 1 <= 0x38E38E38E38E38ELL)
    {
      unint64_t v22 = 0x8E38E38E38E38E39 * ((v11 - (unsigned char *)*a2) >> 3);
      if (2 * v22 > v21) {
        unint64_t v21 = 2 * v22;
      }
      if (v22 >= 0x1C71C71C71C71C7) {
        unint64_t v23 = 0x38E38E38E38E38ELL;
      }
      else {
        unint64_t v23 = v21;
      }
      if (v23) {
        unint64_t v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AOTImage>>((uint64_t)(a2 + 2), v23);
      }
      else {
        unint64_t v24 = 0;
      }
      uint64_t v30 = &v24[72 * v20];
      uint64_t v31 = &v24[72 * v23];
      *(_OWORD *)uint64_t v30 = *(_OWORD *)a3;
      long long v32 = *(_OWORD *)(a3 + 16);
      long long v33 = *(_OWORD *)(a3 + 32);
      long long v34 = *(_OWORD *)(a3 + 48);
      *((void *)v30 + 8) = *(void *)(a3 + 64);
      *((_OWORD *)v30 + 2) = v33;
      *((_OWORD *)v30 + 3) = v34;
      *((_OWORD *)v30 + 1) = v32;
      uint64_t v15 = v30 + 72;
      uint64_t v36 = (char *)*a2;
      uint64_t v35 = (char *)a2[1];
      if (v35 == *a2) {
        goto LABEL_35;
      }
      do
      {
        *(_OWORD *)(v30 - 72) = *(_OWORD *)(v35 - 72);
        long long v37 = *(_OWORD *)(v35 - 56);
        long long v38 = *(_OWORD *)(v35 - 40);
        long long v39 = *(_OWORD *)(v35 - 24);
        *((void *)v30 - 1) = *((void *)v35 - 1);
        *(_OWORD *)(v30 - 24) = v39;
        *(_OWORD *)(v30 - 40) = v38;
        *(_OWORD *)(v30 - 56) = v37;
        v30 -= 72;
        v35 -= 72;
      }
      while (v35 != v36);
LABEL_34:
      uint64_t v35 = (char *)*a2;
LABEL_35:
      *a2 = v30;
      a2[1] = v15;
      a2[2] = v31;
      if (v35) {
        operator delete(v35);
      }
      goto LABEL_37;
    }
    goto LABEL_38;
  }
  *(_OWORD *)uint64_t v10 = *(_OWORD *)a3;
  long long v12 = *(_OWORD *)(a3 + 16);
  long long v13 = *(_OWORD *)(a3 + 32);
  long long v14 = *(_OWORD *)(a3 + 48);
  *((void *)v10 + 8) = *(void *)(a3 + 64);
  *((_OWORD *)v10 + 2) = v13;
  *((_OWORD *)v10 + 3) = v14;
  *((_OWORD *)v10 + 1) = v12;
  uint64_t v15 = v10 + 72;
LABEL_37:
  a2[1] = v15;
  return 1;
}

void Process::addLibraries(uint64_t a1, long long **a2)
{
  uint64_t v3 = *a2;
  long long v2 = a2[1];
  if (v2 != *a2)
  {
    char v5 = 0;
    unint64_t v6 = (uint64_t *)(a1 + 8);
    do
    {
      long long v17 = *v3;
      uint64_t v7 = *((void *)v3 + 2);
      unint64_t v8 = (std::__shared_weak_count *)*((void *)v3 + 3);
      if (v8)
      {
        atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
        long long v14 = v17;
        uint64_t v15 = v7;
        unint64_t v16 = v8;
        atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      else
      {
        long long v14 = *v3;
        uint64_t v15 = v7;
        unint64_t v16 = 0;
      }
      char v9 = Process::addRangeLibrary<std::vector<ProcessLibrary>,ProcessLibrary>(a1, v6, (unint64_t *)&v14);
      if (v16) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v16);
      }
      if (v8) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v8);
      }
      v5 |= v9;
      v3 += 2;
    }
    while (v3 != v2);
    if (v5)
    {
      uint64_t v10 = *(long long **)(a1 + 8);
      unint64_t v11 = *(void *)(a1 + 16);
      unint64_t v12 = 126 - 2 * __clz((uint64_t)(v11 - (void)v10) >> 5);
      if ((long long *)v11 == v10) {
        uint64_t v13 = 0;
      }
      else {
        uint64_t v13 = v12;
      }
      std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *,false>(v10, v11, (uint64_t)&v17, v13, 1);
    }
  }
}

void sub_2345B736C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12)
{
  if (a12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a12);
  }
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
  _Unwind_Resume(exception_object);
}

uint64_t Process::addRangeLibrary<std::vector<ProcessLibrary>,ProcessLibrary>(uint64_t a1, uint64_t *a2, unint64_t *a3)
{
  char v5 = Process::findRangeEntryForAddress<std::vector<ProcessLibrary>>(a1, a2, *a3);
  uint64_t v6 = a2[1];
  if ((void *)v6 != v5)
  {
    if (*v5 == *a3 && v5[1] == a3[1]) {
      return 0;
    }
    std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<ProcessLibrary *,ProcessLibrary *,ProcessLibrary *>((uint64_t)&v12, (uint64_t)(v5 + 4), v6, (uint64_t)v5);
    uint64_t v9 = v8;
    uint64_t v10 = a2[1];
    if (v10 != v8)
    {
      do
      {
        unint64_t v11 = *(std::__shared_weak_count **)(v10 - 8);
        if (v11) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v11);
        }
        v10 -= 32;
      }
      while (v10 != v9);
    }
    a2[1] = v9;
  }
  std::vector<ProcessLibrary>::push_back[abi:ne180100](a2, (uint64_t)a3);
  return 1;
}

void *Process::findRangeEntryForAddress<std::vector<ProcessLibrary>>(uint64_t a1, void *a2, unint64_t a3)
{
  __n128 result = (void *)a2[1];
  if (result != (void *)*a2)
  {
    unint64_t v4 = ((uint64_t)result - *a2) >> 5;
    char v5 = (void *)*a2;
    do
    {
      unint64_t v6 = v4 >> 1;
      uint64_t v7 = &v5[4 * (v4 >> 1)];
      unint64_t v9 = *v7;
      uint64_t v8 = v7 + 4;
      v4 += ~(v4 >> 1);
      if (v9 > a3) {
        unint64_t v4 = v6;
      }
      else {
        char v5 = v8;
      }
    }
    while (v4);
    if (v5 != (void *)*a2)
    {
      unint64_t v10 = *(v5 - 4);
      if (v10 <= a3 && *(v5 - 3) + v10 > a3) {
        return v5 - 4;
      }
    }
  }
  return result;
}

uint64_t Process::createTransientProcessSymbolicatorFromDescriptions(Process *this)
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  long long v2 = (SharedCache *)*((void *)this + 16);
  if (!v2) {
    return 0;
  }
  *(void *)uu = SharedCache::uuid(v2);
  uint64_t v52 = v3;
  if (uuid_is_null(uu)) {
    return 0;
  }
  v48 = 0;
  v49 = 0;
  v50 = 0;
  std::vector<_CSBinaryImageInformation>::reserve(&v48, 0x64uLL);
  memset(v47, 0, sizeof(v47));
  unint64_t v6 = (long long *)*((void *)this + 1);
  uint64_t v7 = (long long *)*((void *)this + 2);
  for (i = this; v6 != v7; v6 += 2)
  {
    long long v44 = *v6;
    uint64_t v8 = (std::__shared_weak_count *)*((void *)v6 + 3);
    long long v45 = (SharedLibrary *)*((void *)v6 + 2);
    long long v46 = v8;
    if (v8) {
      atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    if ((ProcessLibrary::isInSharedCacheCheckAfterPostprocessingDone((ProcessLibrary *)&v44) & 1) == 0)
    {
      ProcessLibrary::path((ProcessLibrary *)&v44, uu);
      if ((_BYTE)v53)
      {
        *(void *)v58 = ProcessLibrary::uuid((ProcessLibrary *)&v44);
        v59 = v9;
        if (!uuid_is_null(v58))
        {
          ProcessLibrary::slide((ProcessLibrary *)&v44);
          if (v10)
          {
            unint64_t v11 = ProcessLibrary::uuid((ProcessLibrary *)&v44);
            uint64_t v13 = v12;
            ProcessLibrary::path((ProcessLibrary *)&v44, uu);
            if (!(_BYTE)v53) {
              std::__throw_bad_optional_access[abi:ne180100]();
            }
            uint64_t v14 = *(void *)uu;
            uint64_t v15 = ProcessLibrary::architecture((ProcessLibrary *)&v44);
            if (ProcessLibrary::isPrimaryExecutableCheckAfterPostprocessingDone((ProcessLibrary *)&v44)) {
              int v16 = 16;
            }
            else {
              int v16 = 0;
            }
            long long v17 = ProcessLibrary::slide((ProcessLibrary *)&v44);
            if (!v18) {
              std::__throw_bad_optional_access[abi:ne180100]();
            }
            long long v19 = v17;
            __p = 0;
            long long v42 = 0;
            uint64_t v43 = 0;
            unint64_t v20 = ProcessLibrary::segmentCountCheckAfterPostprocessingDone((ProcessLibrary *)&v44);
            if (v21) {
              std::vector<_CSBinaryRelocationInformation>::reserve(&__p, (unint64_t)v20);
            }
            if (v45)
            {
              *(void *)v58 = 0;
              v59 = v58;
              uint64_t v60 = 0x2000000000;
              char v61 = 0;
              SharedLibrary::csSymbolOwner(v45);
              *(void *)uu = MEMORY[0x263EF8330];
              uint64_t v52 = 0x40000000;
              v53 = ___ZNK14ProcessLibrary14forEachSegmentIZN7Process50createTransientProcessSymbolicatorFromDescriptionsEvE3__0EEvT__block_invoke;
              v54 = &unk_264BF4108;
              v55 = v58;
              p_p = &__p;
              v57 = v19;
              CSSymbolOwnerForeachSegment();
              _Block_object_dispose(v58, 8);
            }
            unint64_t v23 = __p;
            unint64_t v22 = v42;
            std::vector<std::vector<_CSBinaryRelocationInformation>>::push_back[abi:ne180100](v47, (uint64_t)&__p);
            int v24 = -858993459 * ((unint64_t)(v22 - v23) >> 3);
            unint64_t v25 = v49;
            if (v49 >= v50)
            {
              uint64_t v27 = (v49 - (unsigned char *)v48) >> 6;
              unint64_t v28 = v27 + 1;
              if ((unint64_t)(v27 + 1) >> 58) {
                std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v29 = v50 - (unsigned char *)v48;
              if ((v50 - (unsigned char *)v48) >> 5 > v28) {
                unint64_t v28 = v29 >> 5;
              }
              if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFC0) {
                unint64_t v30 = 0x3FFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v30 = v28;
              }
              if (v30) {
                uint64_t v31 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_CSBinaryImageInformation>>((uint64_t)&v50, v30);
              }
              else {
                uint64_t v31 = 0;
              }
              long long v32 = &v31[64 * v27];
              *((void *)v32 + 2) = v11;
              *((void *)v32 + 3) = v13;
              *((void *)v32 + 4) = v15;
              *((void *)v32 + 5) = v14;
              *((void *)v32 + 6) = v23;
              *((_DWORD *)v32 + 14) = v24;
              *((_DWORD *)v32 + 15) = v16;
              long long v34 = (char *)v48;
              long long v33 = v49;
              uint64_t v35 = v32;
              if (v49 != v48)
              {
                do
                {
                  long long v36 = *((_OWORD *)v33 - 4);
                  long long v37 = *((_OWORD *)v33 - 3);
                  long long v38 = *((_OWORD *)v33 - 1);
                  *((_OWORD *)v35 - 2) = *((_OWORD *)v33 - 2);
                  *((_OWORD *)v35 - 1) = v38;
                  *((_OWORD *)v35 - 4) = v36;
                  *((_OWORD *)v35 - 3) = v37;
                  v35 -= 64;
                  v33 -= 64;
                }
                while (v33 != v34);
                long long v33 = v34;
              }
              unint64_t v26 = v32 + 64;
              v48 = v35;
              v49 = v32 + 64;
              v50 = &v31[64 * v30];
              if (v33) {
                operator delete(v33);
              }
            }
            else
            {
              *((void *)v49 + 2) = v11;
              *((void *)v25 + 3) = v13;
              *((void *)v25 + 4) = v15;
              *((void *)v25 + 5) = v14;
              *((void *)v25 + 6) = v23;
              unint64_t v26 = v25 + 64;
              *((_DWORD *)v25 + 14) = v24;
              *((_DWORD *)v25 + 15) = v16;
            }
            v49 = v26;
            if (__p)
            {
              long long v42 = __p;
              operator delete(__p);
            }
          }
        }
      }
    }
    if (v46) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v46);
    }
  }
  *(void *)uu = SharedCache::uuid(*((SharedCache **)i + 16));
  uint64_t v52 = v39;
  SharedCache::loadAddress(*((SharedCache **)i + 16));
  uint64_t v4 = CSSymbolicatorCreateWithBinaryImageListPidAndSharedCacheUUID();
  *(void *)uu = v47;
  std::vector<std::vector<_CSBinaryRelocationInformation>>::__destroy_vector::operator()[abi:ne180100]((void ***)uu);
  if (v48)
  {
    v49 = (char *)v48;
    operator delete(v48);
  }
  return v4;
}

void sub_2345B78C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, std::__shared_weak_count *a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24)
{
  if (__p) {
    operator delete(__p);
  }
  if (a18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a18);
  }
  *(void *)(v24 - 144) = &a20;
  std::vector<std::vector<_CSBinaryRelocationInformation>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v24 - 144));
  if (a23)
  {
    a24 = (uint64_t)a23;
    operator delete(a23);
  }
  _Unwind_Resume(a1);
}

void std::vector<_CSBinaryImageInformation>::reserve(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 6)
  {
    if (a2 >> 58) {
      std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    unint64_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_CSBinaryImageInformation>>(v3, a2);
    uint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFC0];
    unint64_t v9 = &v6[64 * v8];
    unint64_t v11 = (char *)*a1;
    char v10 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        long long v13 = *((_OWORD *)v10 - 4);
        long long v14 = *((_OWORD *)v10 - 3);
        long long v15 = *((_OWORD *)v10 - 1);
        *((_OWORD *)v12 - 2) = *((_OWORD *)v10 - 2);
        *((_OWORD *)v12 - 1) = v15;
        *((_OWORD *)v12 - 4) = v13;
        *((_OWORD *)v12 - 3) = v14;
        v12 -= 64;
        v10 -= 64;
      }
      while (v10 != v11);
      char v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

void std::vector<_CSBinaryRelocationInformation>::reserve(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (0xCCCCCCCCCCCCCCCDLL * ((v4 - (unsigned char *)*a1) >> 3) < a2)
  {
    if (a2 >= 0x666666666666667) {
      std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = ((unsigned char *)a1[1] - (unsigned char *)*a1) / 40;
    unint64_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_CSBinaryRelocationInformation>>(v3, a2);
    uint64_t v7 = &v6[40 * v5];
    unint64_t v9 = &v6[40 * v8];
    unint64_t v11 = (char *)*a1;
    char v10 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        long long v13 = *(_OWORD *)(v10 - 40);
        long long v14 = *(_OWORD *)(v10 - 24);
        *((void *)v12 - 1) = *((void *)v10 - 1);
        *(_OWORD *)(v12 - 24) = v14;
        *(_OWORD *)(v12 - 40) = v13;
        v12 -= 40;
        v10 -= 40;
      }
      while (v10 != v11);
      char v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

uint64_t std::vector<std::vector<_CSBinaryRelocationInformation>>::push_back[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  unint64_t v6 = a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  uint64_t v7 = *(void **)(result - 8);
  if ((unint64_t)v7 >= v6)
  {
    unint64_t v9 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v7 - *a1) >> 3);
    unint64_t v10 = v9 + 1;
    if (v9 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - *a1) >> 3);
    if (2 * v11 > v10) {
      unint64_t v10 = 2 * v11;
    }
    if (v11 >= 0x555555555555555) {
      unint64_t v12 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v12 = v10;
    }
    v16[4] = result;
    long long v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<_CSBinaryRelocationInformation>>>(result, v12);
    long long v14 = &v13[24 * v9];
    v16[0] = v13;
    v16[1] = v14;
    v16[3] = &v13[24 * v15];
    *((void *)v14 + 1) = 0;
    *((void *)v14 + 2) = 0;
    *(void *)long long v14 = 0;
    *(_OWORD *)long long v14 = *(_OWORD *)a2;
    *((void *)v14 + 2) = *(void *)(a2 + 16);
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(void *)(a2 + 16) = 0;
    v16[2] = v14 + 24;
    std::vector<std::vector<_CSBinaryRelocationInformation>>::__swap_out_circular_buffer(a1, v16);
    uint64_t v8 = (void *)a1[1];
    uint64_t result = std::__split_buffer<std::vector<_CSBinaryRelocationInformation>>::~__split_buffer((uint64_t)v16);
  }
  else
  {
    void *v7 = 0;
    v7[1] = 0;
    v7[2] = 0;
    *(_OWORD *)uint64_t v7 = *(_OWORD *)a2;
    v7[2] = *(void *)(a2 + 16);
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(void *)(a2 + 16) = 0;
    uint64_t v8 = v7 + 3;
    a1[1] = (uint64_t)(v7 + 3);
  }
  a1[1] = (uint64_t)v8;
  return result;
}

void sub_2345B7C30(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<std::vector<_CSBinaryRelocationInformation>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *,false>(long long *a1, unint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  unint64_t v9 = (unint64_t *)a2;
  unint64_t v10 = a1;
  unint64_t v24 = a2;
  unint64_t v25 = a1;
LABEL_2:
  for (uint64_t i = 1 - a4; ; ++i)
  {
    uint64_t v12 = (char *)v9 - (char *)v10;
    unint64_t v13 = ((char *)v9 - (char *)v10) >> 5;
    if (!(!v6 & v5))
    {
      switch(v13)
      {
        case 0uLL:
        case 1uLL:
          return;
        case 2uLL:
          unint64_t v22 = *(v9 - 4);
          unint64_t v24 = (unint64_t)(v9 - 4);
          if (v22 < *(void *)v10) {
            std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ProcessLibrary *&,ProcessLibrary *&>(&v25, (uint64_t *)&v24);
          }
          break;
        case 3uLL:
          unint64_t v24 = (unint64_t)(v9 - 4);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(v10, v10 + 2, v9 - 4);
          break;
        case 4uLL:
          unint64_t v24 = (unint64_t)(v9 - 4);
          std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(v10, v10 + 2, v10 + 4, v9 - 4);
          break;
        case 5uLL:
          unint64_t v24 = (unint64_t)(v9 - 4);
          std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(v10, v10 + 2, v10 + 4, v10 + 6, v9 - 4);
          break;
        default:
          JUMPOUT(0);
      }
      return;
    }
    if (v12 <= 767)
    {
      if (a5) {
        std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>((unint64_t *)v10, v9);
      }
      else {
        std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>((uint64_t)v10, (uint64_t)v9);
      }
      return;
    }
    if (i == 1) {
      break;
    }
    unint64_t v14 = v13 >> 1;
    uint64_t v15 = v9 - 4;
    if ((unint64_t)v12 > 0x1000)
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(v10, &v10[2 * (v13 >> 1)], v15);
      unint64_t v16 = v24;
      uint64_t v17 = 32 * v14 - 32;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(v25 + 2, (long long *)((char *)v25 + v17), (void *)(v24 - 64));
      uint64_t v18 = 32 * v14 + 32;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(v25 + 4, (long long *)((char *)v25 + v18), (void *)(v16 - 96));
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>((long long *)((char *)v25 + v17), &v25[2 * v14], (long long *)((char *)v25 + v18));
      unint64_t v23 = &v25[2 * v14];
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ProcessLibrary *&,ProcessLibrary *&>(&v25, (uint64_t *)&v23);
    }
    else
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(&v10[2 * (v13 >> 1)], v10, v15);
    }
    if (a5)
    {
      unint64_t v9 = (unint64_t *)v24;
    }
    else
    {
      unint64_t v9 = (unint64_t *)v24;
      if (*((void *)v25 - 4) >= *(void *)v25)
      {
        unint64_t v10 = std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,ProcessLibrary *,std::__less<void,void> &>((uint64_t)v25, v24);
        goto LABEL_22;
      }
    }
    long long v19 = std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,ProcessLibrary *,std::__less<void,void> &>((uint64_t)v25, (unint64_t)v9);
    if ((v20 & 1) == 0) {
      goto LABEL_20;
    }
    BOOL v21 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(v25, v19);
    unint64_t v10 = v19 + 2;
    if (std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(v19 + 2, (long long *)v9))
    {
      if (v21) {
        return;
      }
      unint64_t v24 = (unint64_t)v19;
      unint64_t v10 = v25;
      unint64_t v9 = (unint64_t *)v19;
    }
    else
    {
      if (!v21)
      {
LABEL_20:
        std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *,false>(v25, v19, a3, -i, a5 & 1);
        unint64_t v10 = v19 + 2;
LABEL_22:
        a5 = 0;
        unint64_t v25 = v10;
        a4 = -i;
        goto LABEL_2;
      }
      unint64_t v25 = v19 + 2;
    }
  }
  if (v10 != (long long *)v9) {
    std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *,ProcessLibrary *>((unint64_t *)v10, (long long *)v9, (long long *)v9, a3);
  }
}

void std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ProcessLibrary *&,ProcessLibrary *&>(long long **a1, uint64_t *a2)
{
  long long v2 = *a1;
  uint64_t v3 = *a2;
  long long v4 = (*a1)[1];
  long long v9 = **a1;
  *((void *)v2 + 2) = 0;
  *((void *)v2 + 3) = 0;
  *long long v2 = *(_OWORD *)v3;
  long long v5 = *(_OWORD *)(v3 + 16);
  *(void *)(v3 + 16) = 0;
  *(void *)(v3 + 24) = 0;
  char v6 = (std::__shared_weak_count *)*((void *)v2 + 3);
  v2[1] = v5;
  if (v6)
  {
    long long v8 = v4;
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    long long v4 = v8;
  }
  uint64_t v7 = *(std::__shared_weak_count **)(v3 + 24);
  *(_OWORD *)uint64_t v3 = v9;
  *(_OWORD *)(v3 + 16) = v4;
  if (v7)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
}

void std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(unint64_t *a1, unint64_t *a2)
{
  if (a1 != a2)
  {
    long long v4 = a1 + 4;
    if (a1 + 4 != a2)
    {
      uint64_t v5 = 0;
      char v6 = a1;
      do
      {
        uint64_t v7 = v6;
        char v6 = v4;
        unint64_t v8 = v7[4];
        if (v8 < *v7)
        {
          unint64_t v9 = v7[5];
          unint64_t v10 = v7[6];
          unint64_t v11 = v7[7];
          uint64_t v12 = v5;
          v7[6] = 0;
          v7[7] = 0;
          while (1)
          {
            uint64_t v13 = v12;
            unint64_t v14 = (char *)a1 + v12;
            long long v15 = *(_OWORD *)v14;
            long long v16 = *((_OWORD *)v14 + 1);
            *((void *)v14 + 2) = 0;
            *((void *)v14 + 3) = 0;
            uint64_t v17 = (std::__shared_weak_count *)*((void *)v14 + 7);
            *((_OWORD *)v14 + 2) = v15;
            *((_OWORD *)v14 + 3) = v16;
            if (v17) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v17);
            }
            if (!v13) {
              break;
            }
            uint64_t v12 = v13 - 32;
            if (v8 >= *(unint64_t *)((char *)a1 + v13 - 32))
            {
              uint64_t v18 = (unint64_t *)((char *)a1 + v13);
              goto LABEL_12;
            }
          }
          uint64_t v18 = a1;
LABEL_12:
          *uint64_t v18 = v8;
          v18[1] = v9;
          *(unint64_t *)((char *)a1 + v13 + 16) = v10;
          long long v19 = (std::__shared_weak_count *)v18[3];
          v18[3] = v11;
          if (v19) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v19);
          }
        }
        long long v4 = v6 + 4;
        v5 += 32;
      }
      while (v6 + 4 != a2);
    }
  }
}

void std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    uint64_t v3 = a1;
    uint64_t v4 = a1 + 32;
    if (a1 + 32 != a2)
    {
      uint64_t v5 = (std::__shared_weak_count **)(a1 + 56);
      do
      {
        uint64_t v6 = v3;
        uint64_t v3 = v4;
        uint64_t v7 = *(std::__shared_weak_count **)(v6 + 32);
        if ((unint64_t)v7 < *(void *)v6)
        {
          unint64_t v8 = *(std::__shared_weak_count **)(v6 + 40);
          long long v14 = *(_OWORD *)(v6 + 48);
          unint64_t v9 = v5;
          *(void *)(v6 + 48) = 0;
          *(void *)(v6 + 56) = 0;
          do
          {
            *(_OWORD *)(v9 - 3) = *(_OWORD *)(v9 - 7);
            long long v10 = *(_OWORD *)(v9 - 5);
            *(v9 - 5) = 0;
            *(v9 - 4) = 0;
            unint64_t v11 = *v9;
            *(_OWORD *)(v9 - 1) = v10;
            if (v11) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v11);
            }
            unint64_t v12 = (unint64_t)*(v9 - 11);
            v9 -= 4;
          }
          while ((unint64_t)v7 < v12);
          *(v9 - 3) = v7;
          *(v9 - 2) = v8;
          uint64_t v13 = *v9;
          *(_OWORD *)(v9 - 1) = v14;
          if (v13) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v13);
          }
        }
        uint64_t v4 = v3 + 32;
        v5 += 4;
      }
      while (v3 + 32 != a2);
    }
  }
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(long long *a1, long long *a2, void *a3)
{
  long long v10 = a1;
  unint64_t v8 = a3;
  unint64_t v9 = a2;
  unint64_t v3 = *(void *)a2;
  unint64_t v4 = *a3;
  if (*(void *)a2 < *(void *)a1)
  {
    if (v4 < v3)
    {
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ProcessLibrary *&,ProcessLibrary *&>(&v10, (uint64_t *)&v8);
      return 1;
    }
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ProcessLibrary *&,ProcessLibrary *&>(&v10, (uint64_t *)&v9);
    if (*v8 >= *(void *)v9) {
      return 1;
    }
    uint64_t v5 = &v9;
    uint64_t v6 = (uint64_t *)&v8;
LABEL_9:
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ProcessLibrary *&,ProcessLibrary *&>(v5, v6);
    return 2;
  }
  if (v4 < v3)
  {
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ProcessLibrary *&,ProcessLibrary *&>(&v9, (uint64_t *)&v8);
    if (*(void *)v9 >= *(void *)v10) {
      return 1;
    }
    uint64_t v5 = &v10;
    uint64_t v6 = (uint64_t *)&v9;
    goto LABEL_9;
  }
  return 0;
}

long long *std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,ProcessLibrary *,std::__less<void,void> &>(uint64_t a1, unint64_t a2)
{
  unint64_t v19 = a2;
  long long v4 = *(_OWORD *)a1;
  long long v3 = *(_OWORD *)(a1 + 16);
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  unint64_t v5 = v4;
  if ((unint64_t)v4 >= *(void *)(a2 - 32))
  {
    unint64_t v8 = (long long *)(a1 + 32);
    do
    {
      uint64_t v6 = v8;
      if ((unint64_t)v8 >= a2) {
        break;
      }
      v8 += 2;
    }
    while ((unint64_t)v4 >= *(void *)v6);
  }
  else
  {
    uint64_t v6 = (long long *)a1;
    do
    {
      unint64_t v7 = *((void *)v6 + 4);
      v6 += 2;
    }
    while ((unint64_t)v4 >= v7);
  }
  char v20 = v6;
  long long v17 = v4;
  long long v18 = v3;
  if ((unint64_t)v6 < a2)
  {
    do
    {
      unint64_t v9 = *(void *)(a2 - 32);
      a2 -= 32;
    }
    while ((unint64_t)v4 < v9);
    unint64_t v19 = a2;
  }
  if ((unint64_t)v6 < a2)
  {
    do
    {
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ProcessLibrary *&,ProcessLibrary *&>(&v20, (uint64_t *)&v19);
      uint64_t v6 = v20;
      do
      {
        unint64_t v10 = *((void *)v6 + 4);
        v6 += 2;
      }
      while (v5 >= v10);
      char v20 = v6;
      unint64_t v11 = v19;
      do
      {
        unint64_t v12 = *(void *)(v11 - 32);
        v11 -= 32;
      }
      while (v5 < v12);
      unint64_t v19 = v11;
    }
    while ((unint64_t)v6 < v11);
  }
  if (v6 - 2 != (long long *)a1)
  {
    *(_OWORD *)a1 = *(v6 - 2);
    long long v13 = *(v6 - 1);
    *((void *)v6 - 2) = 0;
    *((void *)v6 - 1) = 0;
    long long v14 = *(std::__shared_weak_count **)(a1 + 24);
    *(_OWORD *)(a1 + 16) = v13;
    if (v14) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v14);
    }
  }
  long long v15 = (std::__shared_weak_count *)*((void *)v6 - 1);
  *(v6 - 2) = v17;
  *(v6 - 1) = v18;
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
  return v20;
}

long long *std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,ProcessLibrary *,std::__less<void,void> &>(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = 0;
  long long v19 = *(_OWORD *)a1;
  long long v5 = *(_OWORD *)a1;
  long long v20 = *(_OWORD *)(a1 + 16);
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  unint64_t v6 = v5;
  do
  {
    unint64_t v7 = *(void *)(a1 + v4 + 32);
    v4 += 32;
  }
  while (v7 < (unint64_t)v5);
  unint64_t v8 = a1 + v4;
  unint64_t v22 = (long long *)(a1 + v4);
  if (v4 == 32)
  {
    do
    {
      if (v8 >= a2) {
        break;
      }
      unint64_t v10 = *(void *)(a2 - 32);
      a2 -= 32;
    }
    while (v10 >= (unint64_t)v5);
  }
  else
  {
    do
    {
      unint64_t v9 = *(void *)(a2 - 32);
      a2 -= 32;
    }
    while (v9 >= (unint64_t)v5);
  }
  unint64_t v21 = a2;
  unint64_t v11 = (long long *)(a1 + v4);
  if (v8 < a2)
  {
    do
    {
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ProcessLibrary *&,ProcessLibrary *&>(&v22, (uint64_t *)&v21);
      unint64_t v11 = v22;
      do
      {
        unint64_t v12 = *((void *)v11 + 4);
        v11 += 2;
      }
      while (v12 < v6);
      unint64_t v22 = v11;
      unint64_t v13 = v21;
      do
      {
        unint64_t v14 = *(void *)(v13 - 32);
        v13 -= 32;
      }
      while (v14 >= v6);
      unint64_t v21 = v13;
    }
    while ((unint64_t)v11 < v13);
  }
  if (v11 - 2 != (long long *)a1)
  {
    *(_OWORD *)a1 = *(v11 - 2);
    long long v15 = *(v11 - 1);
    *((void *)v11 - 2) = 0;
    *((void *)v11 - 1) = 0;
    long long v16 = *(std::__shared_weak_count **)(a1 + 24);
    *(_OWORD *)(a1 + 16) = v15;
    if (v16) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v16);
    }
  }
  long long v17 = (std::__shared_weak_count *)*((void *)v11 - 1);
  *(v11 - 2) = v19;
  *(v11 - 1) = v20;
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
  return v11 - 2;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(long long *a1, long long *a2)
{
  unint64_t v23 = a1;
  uint64_t v4 = ((char *)a2 - (char *)a1) >> 5;
  BOOL result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      unint64_t v6 = *((void *)a2 - 4);
      unint64_t v22 = a2 - 2;
      if (v6 < *(void *)a1)
      {
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ProcessLibrary *&,ProcessLibrary *&>(&v23, (uint64_t *)&v22);
        return 1;
      }
      return result;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(a1, a1 + 2, (void *)a2 - 4);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(a1, a1 + 2, a1 + 4, (void *)a2 - 4);
      return 1;
    case 5:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(a1, a1 + 2, a1 + 4, a1 + 6, (void *)a2 - 4);
      return 1;
    default:
      unint64_t v7 = a1 + 4;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(a1, a1 + 2, (void *)a1 + 8);
      unint64_t v8 = a1 + 6;
      if (a1 + 6 == a2) {
        return 1;
      }
      int v9 = 0;
      unint64_t v10 = (std::__shared_weak_count **)a1 + 15;
      break;
  }
  while (1)
  {
    unint64_t v11 = *(void *)v7;
    unint64_t v12 = *(void *)v8;
    if (*(void *)v8 < v11)
    {
      uint64_t v13 = *((void *)v8 + 1);
      unint64_t v14 = (std::__shared_weak_count *)*((void *)v8 + 2);
      uint64_t v15 = *((void *)v8 + 3);
      *((void *)v8 + 2) = 0;
      *((void *)v8 + 3) = 0;
      long long v16 = v10;
      long long v17 = v23;
      while (1)
      {
        long long v18 = v16;
        *(_OWORD *)(v16 - 3) = *(_OWORD *)(v16 - 7);
        long long v19 = *(_OWORD *)(v16 - 5);
        *(v16 - 5) = 0;
        *(v16 - 4) = 0;
        long long v20 = *v16;
        *(_OWORD *)(v16 - 1) = v19;
        if (v20) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v20);
        }
        if (v18 - 7 == (std::__shared_weak_count **)v17) {
          break;
        }
        long long v16 = v18 - 4;
        if (v12 >= (unint64_t)*(v18 - 11))
        {
          long long v17 = (long long *)(v18 - 7);
          break;
        }
      }
      *(void *)long long v17 = v12;
      *((void *)v17 + 1) = v13;
      *(v18 - 5) = v14;
      unint64_t v21 = (std::__shared_weak_count *)*((void *)v17 + 3);
      *((void *)v17 + 3) = v15;
      if (v21) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v21);
      }
      if (++v9 == 8) {
        return v8 + 2 == a2;
      }
    }
    unint64_t v7 = v8;
    v10 += 4;
    v8 += 2;
    if (v8 == a2) {
      return 1;
    }
  }
}

void std::__shared_weak_count::__release_shared[abi:ne180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(long long *a1, long long *a2, long long *a3, void *a4)
{
  unint64_t v10 = a2;
  unint64_t v11 = a1;
  unint64_t v8 = a4;
  int v9 = a3;
  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(a1, a2, a3);
  if (*a4 < *(void *)a3)
  {
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ProcessLibrary *&,ProcessLibrary *&>(&v9, (uint64_t *)&v8);
    if (*(void *)v9 < *(void *)a2)
    {
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ProcessLibrary *&,ProcessLibrary *&>(&v10, (uint64_t *)&v9);
      if (*(void *)v10 < *(void *)a1) {
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ProcessLibrary *&,ProcessLibrary *&>(&v11, (uint64_t *)&v10);
      }
    }
  }
}

void std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(long long *a1, long long *a2, long long *a3, long long *a4, void *a5)
{
  uint64_t v13 = a2;
  unint64_t v14 = a1;
  unint64_t v11 = a4;
  unint64_t v12 = a3;
  unint64_t v10 = a5;
  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(a1, a2, a3, a4);
  if (*a5 < *(void *)a4)
  {
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ProcessLibrary *&,ProcessLibrary *&>(&v11, (uint64_t *)&v10);
    if (*(void *)v11 < *(void *)a3)
    {
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ProcessLibrary *&,ProcessLibrary *&>(&v12, (uint64_t *)&v11);
      if (*(void *)v12 < *(void *)a2)
      {
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ProcessLibrary *&,ProcessLibrary *&>(&v13, (uint64_t *)&v12);
        if (*(void *)v13 < *(void *)a1) {
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ProcessLibrary *&,ProcessLibrary *&>(&v14, (uint64_t *)&v13);
        }
      }
    }
  }
}

long long *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *,ProcessLibrary *>(unint64_t *a1, long long *a2, long long *a3, uint64_t a4)
{
  long long v19 = a1;
  if (a1 != (unint64_t *)a2)
  {
    unint64_t v6 = a2;
    unint64_t v7 = a1;
    uint64_t v8 = (char *)a2 - (char *)a1;
    uint64_t v9 = ((char *)a2 - (char *)a1) >> 5;
    if ((char *)a2 - (char *)a1 >= 33)
    {
      unint64_t v10 = (unint64_t)(v9 - 2) >> 1;
      unint64_t v11 = v10 + 1;
      unint64_t v12 = &a1[4 * v10];
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>((uint64_t)v7, a4, v9, v12);
        v12 -= 4;
        --v11;
      }
      while (v11);
    }
    long long v18 = v6;
    if (v6 == a3)
    {
      a3 = v6;
    }
    else
    {
      uint64_t v13 = v6;
      do
      {
        if (*(void *)v13 < *v19)
        {
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<ProcessLibrary *&,ProcessLibrary *&>(&v18, (uint64_t *)&v19);
          std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>((uint64_t)v19, a4, v9, v19);
          uint64_t v13 = v18;
        }
        v13 += 2;
        long long v18 = v13;
      }
      while (v13 != a3);
      unint64_t v7 = v19;
      uint64_t v8 = (char *)v6 - (char *)v19;
    }
    if (v8 >= 33)
    {
      unint64_t v14 = (unint64_t)v8 >> 5;
      do
      {
        std::__pop_heap[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void>,ProcessLibrary *>((uint64_t)v7, (uint64_t)v6, a4, v14);
        v6 -= 2;
        BOOL v15 = v14 >= 2;
        BOOL v16 = v14-- == 2;
      }
      while (!v16 && v15);
      return v18;
    }
  }
  return a3;
}

void std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  unint64_t v4 = a3 - 2;
  if (a3 >= 2)
  {
    long long v5 = a4;
    uint64_t v7 = (uint64_t)a4 - a1;
    uint64_t v8 = v4 >> 1;
    if ((uint64_t)(v4 >> 1) >= ((uint64_t)a4 - a1) >> 5)
    {
      uint64_t v10 = v7 >> 4;
      uint64_t v11 = (v7 >> 4) + 1;
      unint64_t v12 = (unint64_t *)(a1 + 32 * v11);
      uint64_t v13 = v10 + 2;
      if (v10 + 2 >= a3)
      {
        unint64_t v14 = *v12;
      }
      else
      {
        unint64_t v14 = v12[4];
        BOOL v15 = *v12 >= v14;
        if (*v12 > v14) {
          unint64_t v14 = *v12;
        }
        if (!v15)
        {
          v12 += 4;
          uint64_t v11 = v13;
        }
      }
      unint64_t v16 = *a4;
      if (v14 >= *a4)
      {
        unint64_t v17 = a4[1];
        long long v24 = *((_OWORD *)a4 + 1);
        a4[2] = 0;
        a4[3] = 0;
        do
        {
          long long v18 = v5;
          long long v5 = v12;
          *(_OWORD *)long long v18 = *(_OWORD *)v12;
          long long v19 = *((_OWORD *)v12 + 1);
          v12[2] = 0;
          v12[3] = 0;
          long long v20 = (std::__shared_weak_count *)v18[3];
          *((_OWORD *)v18 + 1) = v19;
          if (v20) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v20);
          }
          if (v8 < v11) {
            break;
          }
          unint64_t v12 = (unint64_t *)(a1 + 32 * ((2 * v11) | 1));
          if (2 * v11 + 2 >= a3)
          {
            unint64_t v21 = *v12;
            uint64_t v11 = (2 * v11) | 1;
          }
          else
          {
            unint64_t v21 = v12[4];
            BOOL v22 = *v12 >= v21;
            if (*v12 > v21) {
              unint64_t v21 = *v12;
            }
            if (v22)
            {
              uint64_t v11 = (2 * v11) | 1;
            }
            else
            {
              v12 += 4;
              uint64_t v11 = 2 * v11 + 2;
            }
          }
        }
        while (v21 >= v16);
        *long long v5 = v16;
        v5[1] = v17;
        unint64_t v23 = (std::__shared_weak_count *)v5[3];
        *((_OWORD *)v5 + 1) = v24;
        if (v23)
        {
          std::__shared_weak_count::__release_shared[abi:ne180100](v23);
        }
      }
    }
  }
}

void std::__pop_heap[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void>,ProcessLibrary *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 >= 2)
  {
    long long v17 = *(_OWORD *)a1;
    uint64_t v8 = *(void *)(a1 + 16);
    uint64_t v7 = *(void *)(a1 + 24);
    *(void *)(a1 + 16) = 0;
    *(void *)(a1 + 24) = 0;
    uint64_t v9 = std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(a1, a3, a4);
    uint64_t v10 = v9;
    uint64_t v11 = (_OWORD *)(a2 - 32);
    if (v9 == a2 - 32)
    {
      *(_OWORD *)uint64_t v9 = v17;
      unint64_t v16 = *(std::__shared_weak_count **)(v9 + 24);
      *(void *)(v10 + 16) = v8;
      *(void *)(v10 + 24) = v7;
      if (v16) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v16);
      }
    }
    else
    {
      *(_OWORD *)uint64_t v9 = *v11;
      long long v12 = *(_OWORD *)(a2 - 16);
      *(void *)(a2 - 16) = 0;
      *(void *)(a2 - 8) = 0;
      uint64_t v13 = *(std::__shared_weak_count **)(v9 + 24);
      *(_OWORD *)(v10 + 16) = v12;
      if (v13) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v13);
      }
      uint64_t v14 = v10 + 32;
      *uint64_t v11 = v17;
      BOOL v15 = *(std::__shared_weak_count **)(a2 - 8);
      *(void *)(a2 - 16) = v8;
      *(void *)(a2 - 8) = v7;
      if (v15) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v15);
      }
      std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(a1, v14, a3, (v14 - a1) >> 5);
    }
  }
}

void sub_2345B8C34(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = 0;
  uint64_t v5 = a3 - 2;
  if (a3 < 2) {
    uint64_t v5 = a3 - 1;
  }
  uint64_t v6 = v5 >> 1;
  do
  {
    uint64_t v7 = a1 + 32 * v4 + 32;
    uint64_t v8 = 2 * v4;
    uint64_t v4 = (2 * v4) | 1;
    if (v8 + 2 < a3 && *(void *)v7 < *(void *)(v7 + 32))
    {
      v7 += 32;
      uint64_t v4 = v8 + 2;
    }
    *(_OWORD *)a1 = *(_OWORD *)v7;
    long long v9 = *(_OWORD *)(v7 + 16);
    *(void *)(v7 + 16) = 0;
    *(void *)(v7 + 24) = 0;
    uint64_t v10 = *(std::__shared_weak_count **)(a1 + 24);
    *(_OWORD *)(a1 + 16) = v9;
    if (v10) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v10);
    }
    a1 = v7;
  }
  while (v4 <= v6);
  return v7;
}

void std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ProcessLibrary *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4 - 2;
  if (a4 >= 2)
  {
    unint64_t v6 = v4 >> 1;
    uint64_t v7 = a1 + 32 * (v4 >> 1);
    uint64_t v8 = a2 - 32;
    unint64_t v9 = *(void *)(a2 - 32);
    if (*(void *)v7 < v9)
    {
      uint64_t v10 = *(void *)(a2 - 24);
      long long v15 = *(_OWORD *)(a2 - 16);
      *(void *)(a2 - 16) = 0;
      *(void *)(a2 - 8) = 0;
      do
      {
        uint64_t v11 = v8;
        uint64_t v8 = v7;
        *(_OWORD *)uint64_t v11 = *(_OWORD *)v7;
        long long v12 = *(_OWORD *)(v7 + 16);
        *(void *)(v7 + 16) = 0;
        *(void *)(v7 + 24) = 0;
        uint64_t v13 = *(std::__shared_weak_count **)(v11 + 24);
        *(_OWORD *)(v11 + 16) = v12;
        if (v13) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v13);
        }
        if (!v6) {
          break;
        }
        unint64_t v6 = (v6 - 1) >> 1;
        uint64_t v7 = a1 + 32 * v6;
      }
      while (*(void *)v7 < v9);
      *(void *)uint64_t v8 = v9;
      *(void *)(v8 + 8) = v10;
      uint64_t v14 = *(std::__shared_weak_count **)(v8 + 24);
      *(_OWORD *)(v8 + 16) = v15;
      if (v14)
      {
        std::__shared_weak_count::__release_shared[abi:ne180100](v14);
      }
    }
  }
}

void std::vector<ProcessLibrary>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  long long v2 = *a1;
  if (*v2)
  {
    std::vector<ProcessLibrary>::__clear[abi:ne180100]((uint64_t *)v2);
    long long v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<ProcessLibrary>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 32)
  {
    unint64_t v4 = *(std::__shared_weak_count **)(i - 8);
    if (v4) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
  }
  a1[1] = v2;
}

void std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *,false>(uint64_t a1, long long *a2, uint64_t a3, uint64_t a4, char a5)
{
LABEL_1:
  uint64_t v11 = (long long *)a1;
LABEL_2:
  uint64_t v12 = 1 - a4;
  while (1)
  {
    a1 = (uint64_t)v11;
    uint64_t v13 = v12;
    uint64_t v14 = (char *)a2 - (char *)v11;
    unint64_t v15 = 0x8E38E38E38E38E39 * (((char *)a2 - (char *)v11) >> 3);
    if (!(!v6 & v5))
    {
      switch(v15)
      {
        case 0uLL:
        case 1uLL:
          return;
        case 2uLL:
          unint64_t v29 = *((void *)a2 - 9);
          unint64_t v28 = (char *)a2 - 72;
          if (v29 < *(void *)v11)
          {
            long long v41 = *v11;
            uint64_t v53 = *((void *)v11 + 8);
            long long v47 = v11[2];
            long long v50 = v11[3];
            long long v44 = v11[1];
            long long v31 = *((_OWORD *)v28 + 2);
            long long v30 = *((_OWORD *)v28 + 3);
            long long v32 = *((_OWORD *)v28 + 1);
            *((void *)v11 + 8) = *((void *)v28 + 8);
            v11[2] = v31;
            v11[3] = v30;
            v11[1] = v32;
            *uint64_t v11 = *(_OWORD *)v28;
            *((_OWORD *)v28 + 2) = v47;
            *((_OWORD *)v28 + 3) = v50;
            *((void *)v28 + 8) = v53;
            *(_OWORD *)unint64_t v28 = v41;
            *((_OWORD *)v28 + 1) = v44;
          }
          break;
        case 3uLL:
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>(v11, (unint64_t *)v11 + 9, (unint64_t *)a2 - 9);
          break;
        case 4uLL:
          std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>((uint64_t)v11, (uint64_t)v11 + 72, (uint64_t)(v11 + 9), (uint64_t)a2 - 72);
          break;
        case 5uLL:
          std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>((uint64_t)v11, (uint64_t)v11 + 72, (uint64_t)(v11 + 9), (uint64_t)v11 + 216, (uint64_t)a2 - 72);
          break;
        default:
          JUMPOUT(0);
      }
      return;
    }
    if (v14 <= 1727) {
      break;
    }
    if (v13 == 1)
    {
      if (v11 != a2)
      {
        std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *,AOTImage *>((uint64_t)v11, a2, a2, a3);
      }
      return;
    }
    unint64_t v16 = v15 >> 1;
    long long v17 = (unint64_t *)v11 + 9 * (v15 >> 1);
    if ((unint64_t)v14 >= 0x2401)
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>(v11, (unint64_t *)v11 + 9 * (v15 >> 1), (unint64_t *)a2 - 9);
      uint64_t v18 = 9 * v16;
      long long v19 = (unint64_t *)v11 + 9 * v16 - 9;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>((long long *)((char *)v11 + 72), v19, (unint64_t *)a2 - 18);
      long long v20 = v11 + 9;
      unint64_t v21 = (unint64_t *)v11 + v18 + 9;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>(v20, v21, (unint64_t *)a2 - 27);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>((long long *)v19, v17, v21);
      long long v40 = *(_OWORD *)a1;
      unint64_t v52 = *(void *)(a1 + 64);
      long long v46 = *(_OWORD *)(a1 + 32);
      long long v49 = *(_OWORD *)(a1 + 48);
      long long v43 = *(_OWORD *)(a1 + 16);
      long long v23 = *((_OWORD *)v17 + 2);
      long long v22 = *((_OWORD *)v17 + 3);
      long long v24 = *((_OWORD *)v17 + 1);
      *(void *)(a1 + 64) = v17[8];
      *(_OWORD *)(a1 + 32) = v23;
      *(_OWORD *)(a1 + 48) = v22;
      *(_OWORD *)(a1 + 16) = v24;
      *(_OWORD *)a1 = *(_OWORD *)v17;
      v17[8] = v52;
      *((_OWORD *)v17 + 2) = v46;
      *((_OWORD *)v17 + 3) = v49;
      *((_OWORD *)v17 + 1) = v43;
      *(_OWORD *)long long v17 = v40;
      if (a5) {
        goto LABEL_13;
      }
    }
    else
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>((long long *)((char *)v11 + 72 * (v15 >> 1)), (unint64_t *)v11, (unint64_t *)a2 - 9);
      if (a5) {
        goto LABEL_13;
      }
    }
    if (*(void *)(a1 - 72) >= *(void *)a1)
    {
      uint64_t v11 = std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,AOTImage *,std::__less<void,void> &>((uint64_t *)a1, (unint64_t)a2);
      goto LABEL_18;
    }
LABEL_13:
    unint64_t v25 = std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,AOTImage *,std::__less<void,void> &>((uint64_t *)a1, (unint64_t)a2);
    if ((v26 & 1) == 0) {
      goto LABEL_16;
    }
    BOOL v27 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>(a1, (uint64_t)v25);
    uint64_t v11 = (long long *)(v25 + 9);
    if (std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>((uint64_t)(v25 + 9), (uint64_t)a2))
    {
      a4 = -v13;
      a2 = (long long *)v25;
      if (v27) {
        return;
      }
      goto LABEL_1;
    }
    uint64_t v12 = v13 + 1;
    if (!v27)
    {
LABEL_16:
      std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *,false>(a1, v25, a3, -v13, a5 & 1);
      uint64_t v11 = (long long *)(v25 + 9);
LABEL_18:
      a5 = 0;
      a4 = -v13;
      goto LABEL_2;
    }
  }
  if (a5)
  {
    std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>((uint64_t)v11, (uint64_t)a2);
  }
  else if (v11 != a2)
  {
    long long v33 = (long long *)((char *)v11 + 72);
    while (v33 != a2)
    {
      uint64_t v34 = (uint64_t)v33;
      unint64_t v35 = *(void *)(a1 + 72);
      if (v35 < *(void *)a1)
      {
        long long v42 = *(_OWORD *)(a1 + 80);
        long long v45 = *(_OWORD *)(a1 + 96);
        long long v48 = *(_OWORD *)(a1 + 112);
        long long v51 = *(_OWORD *)(a1 + 128);
        uint64_t v36 = v34;
        do
        {
          long long v37 = *(_OWORD *)(v36 - 56);
          long long v38 = *(_OWORD *)(v36 - 24);
          *(_OWORD *)(v36 + 32) = *(_OWORD *)(v36 - 40);
          *(_OWORD *)(v36 + 48) = v38;
          *(void *)(v36 + 64) = *(void *)(v36 - 8);
          *(_OWORD *)uint64_t v36 = *(_OWORD *)(v36 - 72);
          *(_OWORD *)(v36 + 16) = v37;
          unint64_t v39 = *(void *)(v36 - 144);
          v36 -= 72;
        }
        while (v35 < v39);
        *(void *)uint64_t v36 = v35;
        *(_OWORD *)(v36 + 56) = v51;
        *(_OWORD *)(v36 + 40) = v48;
        *(_OWORD *)(v36 + 24) = v45;
        *(_OWORD *)(v36 + 8) = v42;
      }
      long long v33 = (long long *)(v34 + 72);
      a1 = v34;
    }
  }
}

uint64_t std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>(uint64_t result, uint64_t a2)
{
  if (result != a2)
  {
    uint64_t v2 = result + 72;
    if (result + 72 != a2)
    {
      uint64_t v3 = 0;
      uint64_t v4 = result;
      do
      {
        uint64_t v5 = v2;
        unint64_t v6 = *(void *)(v4 + 72);
        if (v6 < *(void *)v4)
        {
          long long v12 = *(_OWORD *)(v4 + 80);
          long long v13 = *(_OWORD *)(v4 + 96);
          long long v14 = *(_OWORD *)(v4 + 112);
          long long v15 = *(_OWORD *)(v4 + 128);
          uint64_t v7 = v3;
          while (1)
          {
            uint64_t v8 = result + v7;
            long long v9 = *(_OWORD *)(result + v7);
            *(_OWORD *)(v8 + 88) = *(_OWORD *)(result + v7 + 16);
            long long v10 = *(_OWORD *)(result + v7 + 48);
            *(_OWORD *)(v8 + 104) = *(_OWORD *)(result + v7 + 32);
            *(_OWORD *)(v8 + 120) = v10;
            *(void *)(v8 + 136) = *(void *)(result + v7 + 64);
            *(_OWORD *)(v8 + 72) = v9;
            if (!v7) {
              break;
            }
            v7 -= 72;
            if (v6 >= *(void *)(v8 - 72))
            {
              uint64_t v11 = result + v7 + 72;
              goto LABEL_10;
            }
          }
          uint64_t v11 = result;
LABEL_10:
          *(void *)uint64_t v11 = v6;
          *(_OWORD *)(v11 + 8) = v12;
          *(_OWORD *)(v11 + 24) = v13;
          *(_OWORD *)(v11 + 40) = v14;
          *(_OWORD *)(v11 + 56) = v15;
        }
        uint64_t v2 = v5 + 72;
        v3 += 72;
        uint64_t v4 = v5;
      }
      while (v5 + 72 != a2);
    }
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>(long long *a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3 = *a2;
  unint64_t v4 = *a3;
  if (*a2 >= *(void *)a1)
  {
    if (v4 >= v3) {
      return 0;
    }
    long long v34 = *((_OWORD *)a2 + 2);
    long long v39 = *((_OWORD *)a2 + 3);
    unint64_t v44 = a2[8];
    long long v24 = *(_OWORD *)a2;
    long long v29 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a2 = *(_OWORD *)a3;
    long long v12 = *((_OWORD *)a3 + 2);
    long long v11 = *((_OWORD *)a3 + 3);
    long long v13 = *((_OWORD *)a3 + 1);
    a2[8] = a3[8];
    *((_OWORD *)a2 + 2) = v12;
    *((_OWORD *)a2 + 3) = v11;
    *((_OWORD *)a2 + 1) = v13;
    a3[8] = v44;
    *((_OWORD *)a3 + 2) = v34;
    *((_OWORD *)a3 + 3) = v39;
    *(_OWORD *)a3 = v24;
    *((_OWORD *)a3 + 1) = v29;
    if (*a2 < *(void *)a1)
    {
      long long v35 = a1[2];
      long long v40 = a1[3];
      unint64_t v45 = *((void *)a1 + 8);
      long long v25 = *a1;
      long long v30 = a1[1];
      *a1 = *(_OWORD *)a2;
      long long v15 = *((_OWORD *)a2 + 2);
      long long v14 = *((_OWORD *)a2 + 3);
      long long v16 = *((_OWORD *)a2 + 1);
      *((void *)a1 + 8) = a2[8];
      a1[2] = v15;
      a1[3] = v14;
      a1[1] = v16;
      a2[8] = v45;
      *((_OWORD *)a2 + 2) = v35;
      *((_OWORD *)a2 + 3) = v40;
      uint64_t result = 2;
      *(_OWORD *)a2 = v25;
      *((_OWORD *)a2 + 1) = v30;
      return result;
    }
  }
  else
  {
    if (v4 < v3)
    {
      long long v33 = a1[2];
      long long v38 = a1[3];
      unint64_t v43 = *((void *)a1 + 8);
      long long v23 = *a1;
      long long v28 = a1[1];
      *a1 = *(_OWORD *)a3;
      long long v6 = *((_OWORD *)a3 + 2);
      long long v5 = *((_OWORD *)a3 + 3);
      long long v7 = *((_OWORD *)a3 + 1);
      *((void *)a1 + 8) = a3[8];
      a1[2] = v6;
      a1[3] = v5;
      a1[1] = v7;
      a3[8] = v43;
      *((_OWORD *)a3 + 2) = v33;
      *((_OWORD *)a3 + 3) = v38;
      long long v8 = v23;
      long long v9 = v28;
      uint64_t result = 1;
LABEL_9:
      *(_OWORD *)a3 = v8;
      *((_OWORD *)a3 + 1) = v9;
      return result;
    }
    long long v36 = a1[2];
    long long v41 = a1[3];
    unint64_t v46 = *((void *)a1 + 8);
    long long v26 = *a1;
    long long v31 = a1[1];
    *a1 = *(_OWORD *)a2;
    long long v18 = *((_OWORD *)a2 + 2);
    long long v17 = *((_OWORD *)a2 + 3);
    long long v19 = *((_OWORD *)a2 + 1);
    *((void *)a1 + 8) = a2[8];
    a1[2] = v18;
    a1[3] = v17;
    a1[1] = v19;
    a2[8] = v46;
    *((_OWORD *)a2 + 2) = v36;
    *((_OWORD *)a2 + 3) = v41;
    *(_OWORD *)a2 = v26;
    *((_OWORD *)a2 + 1) = v31;
    if (*a3 < *a2)
    {
      long long v37 = *((_OWORD *)a2 + 2);
      long long v42 = *((_OWORD *)a2 + 3);
      unint64_t v47 = a2[8];
      long long v27 = *(_OWORD *)a2;
      long long v32 = *((_OWORD *)a2 + 1);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      long long v21 = *((_OWORD *)a3 + 2);
      long long v20 = *((_OWORD *)a3 + 3);
      long long v22 = *((_OWORD *)a3 + 1);
      a2[8] = a3[8];
      *((_OWORD *)a2 + 2) = v21;
      *((_OWORD *)a2 + 3) = v20;
      *((_OWORD *)a2 + 1) = v22;
      a3[8] = v47;
      *((_OWORD *)a3 + 2) = v37;
      *((_OWORD *)a3 + 3) = v42;
      long long v8 = v27;
      long long v9 = v32;
      uint64_t result = 2;
      goto LABEL_9;
    }
  }
  return 1;
}

long long *std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,AOTImage *,std::__less<void,void> &>(uint64_t *a1, unint64_t a2)
{
  unint64_t v2 = *a1;
  long long v16 = *(_OWORD *)(a1 + 1);
  long long v17 = *(_OWORD *)(a1 + 3);
  long long v18 = *(_OWORD *)(a1 + 5);
  long long v19 = *(_OWORD *)(a1 + 7);
  if ((unint64_t)*a1 >= *(void *)(a2 - 72))
  {
    long long v5 = (long long *)(a1 + 9);
    do
    {
      unint64_t v3 = v5;
      if ((unint64_t)v5 >= a2) {
        break;
      }
      long long v5 = (long long *)((char *)v5 + 72);
    }
    while (v2 >= *(void *)v3);
  }
  else
  {
    unint64_t v3 = (long long *)a1;
    do
    {
      unint64_t v4 = *((void *)v3 + 9);
      unint64_t v3 = (long long *)((char *)v3 + 72);
    }
    while (v2 >= v4);
  }
  if ((unint64_t)v3 < a2)
  {
    do
    {
      unint64_t v6 = *(void *)(a2 - 72);
      a2 -= 72;
    }
    while (v2 < v6);
  }
  while ((unint64_t)v3 < a2)
  {
    long long v20 = *v3;
    uint64_t v24 = *((void *)v3 + 8);
    long long v22 = v3[2];
    long long v23 = v3[3];
    long long v21 = v3[1];
    long long v8 = *(_OWORD *)(a2 + 32);
    long long v7 = *(_OWORD *)(a2 + 48);
    long long v9 = *(_OWORD *)(a2 + 16);
    *((void *)v3 + 8) = *(void *)(a2 + 64);
    v3[2] = v8;
    v3[3] = v7;
    v3[1] = v9;
    *unint64_t v3 = *(_OWORD *)a2;
    *(void *)(a2 + 64) = v24;
    *(_OWORD *)(a2 + 32) = v22;
    *(_OWORD *)(a2 + 48) = v23;
    *(_OWORD *)(a2 + 16) = v21;
    *(_OWORD *)a2 = v20;
    do
    {
      unint64_t v10 = *((void *)v3 + 9);
      unint64_t v3 = (long long *)((char *)v3 + 72);
    }
    while (v2 >= v10);
    do
    {
      unint64_t v11 = *(void *)(a2 - 72);
      a2 -= 72;
    }
    while (v2 < v11);
  }
  if ((uint64_t *)((char *)v3 - 72) != a1)
  {
    *(_OWORD *)a1 = *(long long *)((char *)v3 - 72);
    long long v12 = *(long long *)((char *)v3 - 56);
    long long v13 = *(long long *)((char *)v3 - 40);
    long long v14 = *(long long *)((char *)v3 - 24);
    a1[8] = *((void *)v3 - 1);
    *((_OWORD *)a1 + 2) = v13;
    *((_OWORD *)a1 + 3) = v14;
    *((_OWORD *)a1 + 1) = v12;
  }
  *((void *)v3 - 9) = v2;
  *(v3 - 2) = v18;
  *(v3 - 1) = v19;
  *(v3 - 4) = v16;
  *(v3 - 3) = v17;
  return v3;
}

uint64_t *std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,AOTImage *,std::__less<void,void> &>(uint64_t *a1, unint64_t a2)
{
  uint64_t v2 = 0;
  unint64_t v3 = *a1;
  long long v19 = *(_OWORD *)(a1 + 1);
  long long v20 = *(_OWORD *)(a1 + 3);
  long long v21 = *(_OWORD *)(a1 + 5);
  long long v22 = *(_OWORD *)(a1 + 7);
  do
  {
    unint64_t v4 = a1[v2 + 9];
    v2 += 9;
  }
  while (v4 < v3);
  unint64_t v5 = (unint64_t)&a1[v2];
  if (v2 == 9)
  {
    do
    {
      if (v5 >= a2) {
        break;
      }
      unint64_t v7 = *(void *)(a2 - 72);
      a2 -= 72;
    }
    while (v7 >= v3);
  }
  else
  {
    do
    {
      unint64_t v6 = *(void *)(a2 - 72);
      a2 -= 72;
    }
    while (v6 >= v3);
  }
  long long v8 = &a1[v2];
  if (v5 < a2)
  {
    unint64_t v9 = a2;
    do
    {
      long long v25 = *((_OWORD *)v8 + 2);
      long long v26 = *((_OWORD *)v8 + 3);
      uint64_t v27 = v8[8];
      long long v23 = *(_OWORD *)v8;
      long long v24 = *((_OWORD *)v8 + 1);
      long long v11 = *(_OWORD *)(v9 + 32);
      long long v10 = *(_OWORD *)(v9 + 48);
      long long v12 = *(_OWORD *)(v9 + 16);
      v8[8] = *(void *)(v9 + 64);
      *((_OWORD *)v8 + 2) = v11;
      *((_OWORD *)v8 + 3) = v10;
      *((_OWORD *)v8 + 1) = v12;
      *(_OWORD *)long long v8 = *(_OWORD *)v9;
      *(_OWORD *)unint64_t v9 = v23;
      *(void *)(v9 + 64) = v27;
      *(_OWORD *)(v9 + 32) = v25;
      *(_OWORD *)(v9 + 48) = v26;
      *(_OWORD *)(v9 + 16) = v24;
      do
      {
        unint64_t v13 = v8[9];
        v8 += 9;
      }
      while (v13 < v3);
      do
      {
        unint64_t v14 = *(void *)(v9 - 72);
        v9 -= 72;
      }
      while (v14 >= v3);
    }
    while ((unint64_t)v8 < v9);
  }
  if (v8 - 9 != a1)
  {
    *(_OWORD *)a1 = *(_OWORD *)(v8 - 9);
    long long v15 = *(_OWORD *)(v8 - 7);
    long long v16 = *(_OWORD *)(v8 - 5);
    long long v17 = *(_OWORD *)(v8 - 3);
    a1[8] = *(v8 - 1);
    *((_OWORD *)a1 + 2) = v16;
    *((_OWORD *)a1 + 3) = v17;
    *((_OWORD *)a1 + 1) = v15;
  }
  *(v8 - 9) = v3;
  *((_OWORD *)v8 - 2) = v21;
  *((_OWORD *)v8 - 1) = v22;
  *((_OWORD *)v8 - 4) = v19;
  *((_OWORD *)v8 - 3) = v20;
  return v8 - 9;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (a2 - a1) >> 3;
  BOOL result = 1;
  switch(0x8E38E38E38E38E39 * v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      unint64_t v6 = (long long *)(a2 - 72);
      if (*(void *)(a2 - 72) < *(void *)a1)
      {
        long long v24 = *(_OWORD *)(a1 + 32);
        long long v26 = *(_OWORD *)(a1 + 48);
        uint64_t v28 = *(void *)(a1 + 64);
        long long v20 = *(_OWORD *)a1;
        long long v22 = *(_OWORD *)(a1 + 16);
        *(_OWORD *)a1 = *v6;
        long long v8 = *(_OWORD *)(a2 - 40);
        long long v7 = *(_OWORD *)(a2 - 24);
        long long v9 = *(_OWORD *)(a2 - 56);
        *(void *)(a1 + 64) = *(void *)(a2 - 8);
        *(_OWORD *)(a1 + 32) = v8;
        *(_OWORD *)(a1 + 48) = v7;
        *(_OWORD *)(a1 + 16) = v9;
        *(void *)(a2 - 8) = v28;
        *(_OWORD *)(a2 - 40) = v24;
        *(_OWORD *)(a2 - 24) = v26;
        *unint64_t v6 = v20;
        *(_OWORD *)(a2 - 56) = v22;
      }
      return result;
    case 3uLL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>((long long *)a1, (unint64_t *)(a1 + 72), (unint64_t *)(a2 - 72));
      return 1;
    case 4uLL:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>(a1, a1 + 72, a1 + 144, a2 - 72);
      return 1;
    case 5uLL:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>(a1, a1 + 72, a1 + 144, a1 + 216, a2 - 72);
      return 1;
    default:
      long long v10 = (void *)(a1 + 144);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>((long long *)a1, (unint64_t *)(a1 + 72), (unint64_t *)(a1 + 144));
      uint64_t v11 = a1 + 216;
      if (a1 + 216 == a2) {
        return 1;
      }
      uint64_t v12 = 0;
      int v13 = 0;
      break;
  }
  while (1)
  {
    unint64_t v14 = *(void *)v11;
    if (*(void *)v11 < *v10)
    {
      long long v21 = *(_OWORD *)(v11 + 8);
      long long v23 = *(_OWORD *)(v11 + 24);
      long long v25 = *(_OWORD *)(v11 + 40);
      long long v27 = *(_OWORD *)(v11 + 56);
      uint64_t v15 = v12;
      while (1)
      {
        uint64_t v16 = a1 + v15;
        long long v17 = *(_OWORD *)(a1 + v15 + 144);
        *(_OWORD *)(v16 + 232) = *(_OWORD *)(a1 + v15 + 160);
        long long v18 = *(_OWORD *)(a1 + v15 + 192);
        *(_OWORD *)(v16 + 248) = *(_OWORD *)(a1 + v15 + 176);
        *(_OWORD *)(a1 + v15 + 264) = v18;
        *(void *)(v16 + 280) = *(void *)(a1 + v15 + 208);
        *(_OWORD *)(v16 + 216) = v17;
        if (v15 == -144) {
          break;
        }
        v15 -= 72;
        if (v14 >= *(void *)(v16 + 72))
        {
          uint64_t v19 = a1 + v15 + 216;
          goto LABEL_12;
        }
      }
      uint64_t v19 = a1;
LABEL_12:
      *(void *)uint64_t v19 = v14;
      *(_OWORD *)(v19 + 8) = v21;
      *(_OWORD *)(v19 + 24) = v23;
      *(_OWORD *)(v19 + 40) = v25;
      *(_OWORD *)(v19 + 56) = v27;
      if (++v13 == 8) {
        return v11 + 72 == a2;
      }
    }
    long long v10 = (void *)v11;
    v12 += 72;
    v11 += 72;
    if (v11 == a2) {
      return 1;
    }
  }
}

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>((long long *)a1, (unint64_t *)a2, (unint64_t *)a3);
  if (*(void *)a4 < *(void *)a3)
  {
    long long v24 = *(_OWORD *)(a3 + 32);
    long long v27 = *(_OWORD *)(a3 + 48);
    uint64_t v30 = *(void *)(a3 + 64);
    __n128 v18 = *(__n128 *)a3;
    long long v21 = *(_OWORD *)(a3 + 16);
    *(_OWORD *)a3 = *(_OWORD *)a4;
    long long v10 = *(_OWORD *)(a4 + 32);
    long long v9 = *(_OWORD *)(a4 + 48);
    long long v11 = *(_OWORD *)(a4 + 16);
    *(void *)(a3 + 64) = *(void *)(a4 + 64);
    *(_OWORD *)(a3 + 32) = v10;
    *(_OWORD *)(a3 + 48) = v9;
    *(_OWORD *)(a3 + 16) = v11;
    *(void *)(a4 + 64) = v30;
    *(_OWORD *)(a4 + 32) = v24;
    *(_OWORD *)(a4 + 48) = v27;
    __n128 result = v18;
    *(__n128 *)a4 = v18;
    *(_OWORD *)(a4 + 16) = v21;
    if (*(void *)a3 < *(void *)a2)
    {
      long long v25 = *(_OWORD *)(a2 + 32);
      long long v28 = *(_OWORD *)(a2 + 48);
      uint64_t v31 = *(void *)(a2 + 64);
      __n128 v19 = *(__n128 *)a2;
      long long v22 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      long long v13 = *(_OWORD *)(a3 + 32);
      long long v12 = *(_OWORD *)(a3 + 48);
      long long v14 = *(_OWORD *)(a3 + 16);
      *(void *)(a2 + 64) = *(void *)(a3 + 64);
      *(_OWORD *)(a2 + 32) = v13;
      *(_OWORD *)(a2 + 48) = v12;
      *(_OWORD *)(a2 + 16) = v14;
      *(void *)(a3 + 64) = v31;
      *(_OWORD *)(a3 + 32) = v25;
      *(_OWORD *)(a3 + 48) = v28;
      __n128 result = v19;
      *(__n128 *)a3 = v19;
      *(_OWORD *)(a3 + 16) = v22;
      if (*(void *)a2 < *(void *)a1)
      {
        long long v26 = *(_OWORD *)(a1 + 32);
        long long v29 = *(_OWORD *)(a1 + 48);
        uint64_t v32 = *(void *)(a1 + 64);
        __n128 v20 = *(__n128 *)a1;
        long long v23 = *(_OWORD *)(a1 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        long long v16 = *(_OWORD *)(a2 + 32);
        long long v15 = *(_OWORD *)(a2 + 48);
        long long v17 = *(_OWORD *)(a2 + 16);
        *(void *)(a1 + 64) = *(void *)(a2 + 64);
        *(_OWORD *)(a1 + 32) = v16;
        *(_OWORD *)(a1 + 48) = v15;
        *(_OWORD *)(a1 + 16) = v17;
        *(void *)(a2 + 64) = v32;
        *(_OWORD *)(a2 + 32) = v26;
        *(_OWORD *)(a2 + 48) = v29;
        __n128 result = v20;
        *(__n128 *)a2 = v20;
        *(_OWORD *)(a2 + 16) = v23;
      }
    }
  }
  return result;
}

__n128 std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  result.n128_u64[0] = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>(a1, a2, a3, a4).n128_u64[0];
  if (*(void *)a5 < *(void *)a4)
  {
    long long v31 = *(_OWORD *)(a4 + 32);
    long long v35 = *(_OWORD *)(a4 + 48);
    uint64_t v39 = *(void *)(a4 + 64);
    __n128 v23 = *(__n128 *)a4;
    long long v27 = *(_OWORD *)(a4 + 16);
    *(_OWORD *)a4 = *(_OWORD *)a5;
    long long v12 = *(_OWORD *)(a5 + 32);
    long long v11 = *(_OWORD *)(a5 + 48);
    long long v13 = *(_OWORD *)(a5 + 16);
    *(void *)(a4 + 64) = *(void *)(a5 + 64);
    *(_OWORD *)(a4 + 32) = v12;
    *(_OWORD *)(a4 + 48) = v11;
    *(_OWORD *)(a4 + 16) = v13;
    *(void *)(a5 + 64) = v39;
    *(_OWORD *)(a5 + 32) = v31;
    *(_OWORD *)(a5 + 48) = v35;
    __n128 result = v23;
    *(__n128 *)a5 = v23;
    *(_OWORD *)(a5 + 16) = v27;
    if (*(void *)a4 < *(void *)a3)
    {
      long long v32 = *(_OWORD *)(a3 + 32);
      long long v36 = *(_OWORD *)(a3 + 48);
      uint64_t v40 = *(void *)(a3 + 64);
      __n128 v24 = *(__n128 *)a3;
      long long v28 = *(_OWORD *)(a3 + 16);
      *(_OWORD *)a3 = *(_OWORD *)a4;
      long long v15 = *(_OWORD *)(a4 + 32);
      long long v14 = *(_OWORD *)(a4 + 48);
      long long v16 = *(_OWORD *)(a4 + 16);
      *(void *)(a3 + 64) = *(void *)(a4 + 64);
      *(_OWORD *)(a3 + 32) = v15;
      *(_OWORD *)(a3 + 48) = v14;
      *(_OWORD *)(a3 + 16) = v16;
      *(void *)(a4 + 64) = v40;
      *(_OWORD *)(a4 + 32) = v32;
      *(_OWORD *)(a4 + 48) = v36;
      __n128 result = v24;
      *(__n128 *)a4 = v24;
      *(_OWORD *)(a4 + 16) = v28;
      if (*(void *)a3 < *(void *)a2)
      {
        long long v33 = *(_OWORD *)(a2 + 32);
        long long v37 = *(_OWORD *)(a2 + 48);
        uint64_t v41 = *(void *)(a2 + 64);
        __n128 v25 = *(__n128 *)a2;
        long long v29 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)a2 = *(_OWORD *)a3;
        long long v18 = *(_OWORD *)(a3 + 32);
        long long v17 = *(_OWORD *)(a3 + 48);
        long long v19 = *(_OWORD *)(a3 + 16);
        *(void *)(a2 + 64) = *(void *)(a3 + 64);
        *(_OWORD *)(a2 + 32) = v18;
        *(_OWORD *)(a2 + 48) = v17;
        *(_OWORD *)(a2 + 16) = v19;
        *(void *)(a3 + 64) = v41;
        *(_OWORD *)(a3 + 32) = v33;
        *(_OWORD *)(a3 + 48) = v37;
        __n128 result = v25;
        *(__n128 *)a3 = v25;
        *(_OWORD *)(a3 + 16) = v29;
        if (*(void *)a2 < *(void *)a1)
        {
          long long v34 = *(_OWORD *)(a1 + 32);
          long long v38 = *(_OWORD *)(a1 + 48);
          uint64_t v42 = *(void *)(a1 + 64);
          __n128 v26 = *(__n128 *)a1;
          long long v30 = *(_OWORD *)(a1 + 16);
          *(_OWORD *)a1 = *(_OWORD *)a2;
          long long v21 = *(_OWORD *)(a2 + 32);
          long long v20 = *(_OWORD *)(a2 + 48);
          long long v22 = *(_OWORD *)(a2 + 16);
          *(void *)(a1 + 64) = *(void *)(a2 + 64);
          *(_OWORD *)(a1 + 32) = v21;
          *(_OWORD *)(a1 + 48) = v20;
          *(_OWORD *)(a1 + 16) = v22;
          *(void *)(a2 + 64) = v42;
          *(_OWORD *)(a2 + 32) = v34;
          *(_OWORD *)(a2 + 48) = v38;
          __n128 result = v26;
          *(__n128 *)a2 = v26;
          *(_OWORD *)(a2 + 16) = v30;
        }
      }
    }
  }
  return result;
}

long long *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *,AOTImage *>(uint64_t a1, long long *a2, long long *a3, uint64_t a4)
{
  if ((long long *)a1 != a2)
  {
    unint64_t v6 = a2;
    uint64_t v8 = (uint64_t)a2 - a1;
    uint64_t v9 = ((uint64_t)a2 - a1) / 72;
    if ((uint64_t)a2 - a1 >= 73)
    {
      unint64_t v10 = (unint64_t)(v9 - 2) >> 1;
      unint64_t v11 = v10 + 1;
      long long v12 = (unint64_t *)(a1 + 72 * v10);
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>(a1, a4, v9, v12);
        v12 -= 9;
        --v11;
      }
      while (v11);
    }
    long long v13 = v6;
    if (v6 != a3)
    {
      long long v14 = v6;
      do
      {
        if (*(void *)v14 < *(void *)a1)
        {
          long long v36 = v14[2];
          long long v38 = v14[3];
          uint64_t v40 = *((void *)v14 + 8);
          long long v32 = *v14;
          long long v34 = v14[1];
          *long long v14 = *(_OWORD *)a1;
          long long v16 = *(_OWORD *)(a1 + 32);
          long long v15 = *(_OWORD *)(a1 + 48);
          long long v17 = *(_OWORD *)(a1 + 16);
          *((void *)v14 + 8) = *(void *)(a1 + 64);
          v14[2] = v16;
          v14[3] = v15;
          v14[1] = v17;
          *(void *)(a1 + 64) = v40;
          *(_OWORD *)(a1 + 32) = v36;
          *(_OWORD *)(a1 + 48) = v38;
          *(_OWORD *)a1 = v32;
          *(_OWORD *)(a1 + 16) = v34;
          std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>(a1, a4, v9, (unint64_t *)a1);
        }
        long long v14 = (long long *)((char *)v14 + 72);
      }
      while (v14 != a3);
      long long v13 = a3;
    }
    if (v8 >= 73)
    {
      int64_t v18 = v8 / 0x48uLL;
      do
      {
        uint64_t v19 = 0;
        long long v37 = *(_OWORD *)(a1 + 32);
        long long v39 = *(_OWORD *)(a1 + 48);
        uint64_t v41 = *(void *)(a1 + 64);
        long long v33 = *(_OWORD *)a1;
        long long v35 = *(_OWORD *)(a1 + 16);
        uint64_t v20 = a1;
        do
        {
          uint64_t v21 = v20 + 72 * v19 + 72;
          uint64_t v22 = (2 * v19) | 1;
          uint64_t v23 = 2 * v19 + 2;
          if (v23 < v18 && *(void *)v21 < *(void *)(v21 + 72))
          {
            v21 += 72;
            uint64_t v22 = v23;
          }
          *(_OWORD *)uint64_t v20 = *(_OWORD *)v21;
          long long v24 = *(_OWORD *)(v21 + 16);
          long long v25 = *(_OWORD *)(v21 + 32);
          long long v26 = *(_OWORD *)(v21 + 48);
          *(void *)(v20 + 64) = *(void *)(v21 + 64);
          *(_OWORD *)(v20 + 32) = v25;
          *(_OWORD *)(v20 + 48) = v26;
          *(_OWORD *)(v20 + 16) = v24;
          uint64_t v20 = v21;
          uint64_t v19 = v22;
        }
        while (v22 <= (uint64_t)((unint64_t)(v18 - 2) >> 1));
        unint64_t v6 = (long long *)((char *)v6 - 72);
        if ((long long *)v21 == v6)
        {
          *(_OWORD *)uint64_t v21 = v33;
          *(void *)(v21 + 64) = v41;
          *(_OWORD *)(v21 + 32) = v37;
          *(_OWORD *)(v21 + 48) = v39;
          *(_OWORD *)(v21 + 16) = v35;
        }
        else
        {
          *(_OWORD *)uint64_t v21 = *v6;
          long long v27 = v6[1];
          long long v28 = v6[2];
          long long v29 = v6[3];
          *(void *)(v21 + 64) = *((void *)v6 + 8);
          *(_OWORD *)(v21 + 32) = v28;
          *(_OWORD *)(v21 + 48) = v29;
          *(_OWORD *)(v21 + 16) = v27;
          v6[2] = v37;
          v6[3] = v39;
          *((void *)v6 + 8) = v41;
          *unint64_t v6 = v33;
          v6[1] = v35;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>(a1, v21 + 72, a4, 0x8E38E38E38E38E39 * ((v21 + 72 - a1) >> 3));
        }
      }
      while (v18-- > 2);
    }
    return v13;
  }
  return a3;
}

__n128 std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  if (a3 >= 2)
  {
    int64_t v4 = (unint64_t)(a3 - 2) >> 1;
    if (v4 >= (uint64_t)(0x8E38E38E38E38E39 * (((uint64_t)a4 - a1) >> 3)))
    {
      uint64_t v5 = (0x1C71C71C71C71C72 * (((uint64_t)a4 - a1) >> 3)) | 1;
      unint64_t v6 = (unint64_t *)(a1 + 72 * v5);
      if (0x1C71C71C71C71C72 * (((uint64_t)a4 - a1) >> 3) + 2 >= a3)
      {
        unint64_t v7 = *v6;
      }
      else
      {
        unint64_t v7 = v6[9];
        BOOL v8 = *v6 >= v7;
        if (*v6 > v7) {
          unint64_t v7 = *v6;
        }
        if (!v8)
        {
          v6 += 9;
          uint64_t v5 = 0x1C71C71C71C71C72 * (((uint64_t)a4 - a1) >> 3) + 2;
        }
      }
      unint64_t v9 = *a4;
      if (v7 >= *a4)
      {
        __n128 v18 = *(__n128 *)(a4 + 1);
        long long v19 = *(_OWORD *)(a4 + 3);
        long long v20 = *(_OWORD *)(a4 + 5);
        long long v21 = *(_OWORD *)(a4 + 7);
        do
        {
          unint64_t v10 = a4;
          a4 = v6;
          *(_OWORD *)unint64_t v10 = *(_OWORD *)v6;
          long long v11 = *((_OWORD *)v6 + 1);
          long long v12 = *((_OWORD *)v6 + 2);
          long long v13 = *((_OWORD *)v6 + 3);
          v10[8] = v6[8];
          *((_OWORD *)v10 + 2) = v12;
          *((_OWORD *)v10 + 3) = v13;
          *((_OWORD *)v10 + 1) = v11;
          if (v4 < v5) {
            break;
          }
          uint64_t v14 = (2 * v5) | 1;
          unint64_t v6 = (unint64_t *)(a1 + 72 * v14);
          uint64_t v5 = 2 * v5 + 2;
          if (v5 >= a3)
          {
            unint64_t v15 = *v6;
            uint64_t v5 = v14;
          }
          else
          {
            unint64_t v15 = v6[9];
            BOOL v16 = *v6 >= v15;
            if (*v6 > v15) {
              unint64_t v15 = *v6;
            }
            if (v16) {
              uint64_t v5 = v14;
            }
            else {
              v6 += 9;
            }
          }
        }
        while (v15 >= v9);
        *a4 = v9;
        __n128 result = v18;
        *(_OWORD *)(a4 + 7) = v21;
        *(_OWORD *)(a4 + 5) = v20;
        *(_OWORD *)(a4 + 3) = v19;
        *(__n128 *)(a4 + 1) = v18;
      }
    }
  }
  return result;
}

__n128 std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,AOTImage *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4 - 2;
  if (a4 >= 2)
  {
    unint64_t v5 = v4 >> 1;
    uint64_t v6 = a1 + 72 * (v4 >> 1);
    uint64_t v7 = a2 - 72;
    unint64_t v8 = *(void *)(a2 - 72);
    if (*(void *)v6 < v8)
    {
      long long v14 = *(_OWORD *)(a2 - 64);
      long long v15 = *(_OWORD *)(a2 - 48);
      __n128 v16 = *(__n128 *)(a2 - 32);
      long long v17 = *(_OWORD *)(a2 - 16);
      do
      {
        uint64_t v9 = v7;
        uint64_t v7 = v6;
        *(_OWORD *)uint64_t v9 = *(_OWORD *)v6;
        long long v10 = *(_OWORD *)(v6 + 16);
        long long v11 = *(_OWORD *)(v6 + 32);
        long long v12 = *(_OWORD *)(v6 + 48);
        *(void *)(v9 + 64) = *(void *)(v6 + 64);
        *(_OWORD *)(v9 + 32) = v11;
        *(_OWORD *)(v9 + 48) = v12;
        *(_OWORD *)(v9 + 16) = v10;
        if (!v5) {
          break;
        }
        unint64_t v5 = (v5 - 1) >> 1;
        uint64_t v6 = a1 + 72 * v5;
      }
      while (*(void *)v6 < v8);
      *(void *)uint64_t v7 = v8;
      *(_OWORD *)(v7 + 8) = v14;
      *(_OWORD *)(v7 + 24) = v15;
      __n128 result = v16;
      *(__n128 *)(v7 + 40) = v16;
      *(_OWORD *)(v7 + 56) = v17;
    }
  }
  return result;
}

__n128 std::vector<AOTImage>::__move_assign(uint64_t a1, __n128 *a2)
{
  unint64_t v4 = *(void **)a1;
  if (v4)
  {
    *(void *)(a1 + 8) = v4;
    operator delete(v4);
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
  }
  __n128 result = *a2;
  *(__n128 *)a1 = *a2;
  *(void *)(a1 + 16) = a2[1].n128_u64[0];
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  a2[1].n128_u64[0] = 0;
  return result;
}

void std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<_CSBinaryImageInformation>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 58) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(a2 << 6);
}

void std::__throw_bad_optional_access[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = MEMORY[0x263F8C3B0] + 16;
  __cxa_throw(exception, MEMORY[0x263F8C200], MEMORY[0x263F8C088]);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<_CSBinaryRelocationInformation>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(40 * a2);
}

uint64_t std::vector<std::vector<_CSBinaryRelocationInformation>>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<_CSBinaryRelocationInformation>>,std::reverse_iterator<std::vector<_CSBinaryRelocationInformation>*>,std::reverse_iterator<std::vector<_CSBinaryRelocationInformation>*>,std::reverse_iterator<std::vector<_CSBinaryRelocationInformation>*>>((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<_CSBinaryRelocationInformation>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<_CSBinaryRelocationInformation>>,std::reverse_iterator<std::vector<_CSBinaryRelocationInformation>*>,std::reverse_iterator<std::vector<_CSBinaryRelocationInformation>*>,std::reverse_iterator<std::vector<_CSBinaryRelocationInformation>*>>(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v14 = a6;
  *((void *)&v14 + 1) = a7;
  long long v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    uint64_t v9 = a6;
  }
  else
  {
    do
    {
      *(void *)(v7 - 24) = 0;
      *(void *)(v7 - 16) = 0;
      *(void *)(v7 - 8) = 0;
      long long v8 = *(_OWORD *)(a3 - 3);
      a3 -= 3;
      *(_OWORD *)(v7 - 24) = v8;
      *(void *)(v7 - 8) = a3[2];
      *a3 = 0;
      a3[1] = 0;
      a3[2] = 0;
      uint64_t v7 = *((void *)&v14 + 1) - 24;
      *((void *)&v14 + 1) -= 24;
    }
    while (a3 != a5);
    uint64_t v9 = v14;
  }
  char v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<_CSBinaryRelocationInformation>>,std::reverse_iterator<std::vector<_CSBinaryRelocationInformation>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<_CSBinaryRelocationInformation>>,std::reverse_iterator<std::vector<_CSBinaryRelocationInformation>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<_CSBinaryRelocationInformation>>,std::reverse_iterator<std::vector<_CSBinaryRelocationInformation>*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<_CSBinaryRelocationInformation>>,std::reverse_iterator<std::vector<_CSBinaryRelocationInformation>*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    unint64_t v3 = *(void **)v1;
    if (*(void *)v1)
    {
      *(void *)(v1 + 8) = v3;
      operator delete(v3);
    }
    v1 += 24;
  }
}

uint64_t std::__split_buffer<std::vector<_CSBinaryRelocationInformation>>::~__split_buffer(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__split_buffer<std::vector<_CSBinaryRelocationInformation>>::__destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  while (v2 != a2)
  {
    uint64_t v5 = *(void **)(v2 - 24);
    *(void *)(a1 + 16) = v2 - 24;
    if (v5)
    {
      *(void *)(v2 - 16) = v5;
      operator delete(v5);
      uint64_t v2 = *(void *)(a1 + 16);
    }
    else
    {
      v2 -= 24;
    }
  }
}

void std::vector<std::vector<_CSBinaryRelocationInformation>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<std::vector<_CSBinaryRelocationInformation>>::__clear[abi:ne180100]((uint64_t *)v2);
    unint64_t v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<std::vector<_CSBinaryRelocationInformation>>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  if (v2 != *a1)
  {
    uint64_t v4 = a1[1];
    do
    {
      uint64_t v6 = *(void **)(v4 - 24);
      v4 -= 24;
      uint64_t v5 = v6;
      if (v6)
      {
        *(void *)(v2 - 16) = v5;
        operator delete(v5);
      }
      uint64_t v2 = v4;
    }
    while (v4 != v3);
  }
  a1[1] = v3;
}

void *Process::findRangeEntryForAddress<std::vector<AOTImage>>(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t result = (void *)a2[1];
  if (result != (void *)*a2)
  {
    unint64_t v4 = 0x8E38E38E38E38E39 * (((uint64_t)result - *a2) >> 3);
    uint64_t v5 = (void *)*a2;
    do
    {
      unint64_t v6 = v4 >> 1;
      uint64_t v7 = &v5[9 * (v4 >> 1)];
      unint64_t v9 = *v7;
      long long v8 = v7 + 9;
      v4 += ~(v4 >> 1);
      if (v9 > a3) {
        unint64_t v4 = v6;
      }
      else {
        uint64_t v5 = v8;
      }
    }
    while (v4);
    if (v5 != (void *)*a2)
    {
      unint64_t v10 = *(v5 - 9);
      if (v10 <= a3 && *(v5 - 8) + v10 > a3) {
        return v5 - 9;
      }
    }
  }
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<AOTImage>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x38E38E38E38E38FLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(72 * a2);
}

void **std::vector<ProcessLibrary>::push_back[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  unint64_t v6 = a1[2];
  uint64_t result = (void **)(a1 + 2);
  unint64_t v5 = v6;
  uint64_t v7 = *(result - 1);
  if ((unint64_t)v7 >= v6)
  {
    uint64_t v9 = ((uint64_t)v7 - *a1) >> 5;
    unint64_t v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 59) {
      std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v5 - *a1;
    if (v11 >> 4 > v10) {
      unint64_t v10 = v11 >> 4;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFE0) {
      unint64_t v12 = 0x7FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v10;
    }
    v16[4] = result;
    long long v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ProcessLibrary>>((uint64_t)result, v12);
    long long v14 = &v13[32 * v9];
    v16[0] = v13;
    v16[1] = v14;
    v16[3] = &v13[32 * v15];
    *(_OWORD *)long long v14 = *(_OWORD *)a2;
    *((_OWORD *)v14 + 1) = *(_OWORD *)(a2 + 16);
    *(void *)(a2 + 16) = 0;
    *(void *)(a2 + 24) = 0;
    v16[2] = v14 + 32;
    std::vector<ProcessLibrary>::__swap_out_circular_buffer(a1, v16);
    long long v8 = (_OWORD *)a1[1];
    uint64_t result = std::__split_buffer<ProcessLibrary>::~__split_buffer(v16);
  }
  else
  {
    _OWORD *v7 = *(_OWORD *)a2;
    v7[1] = *(_OWORD *)(a2 + 16);
    *(void *)(a2 + 16) = 0;
    *(void *)(a2 + 24) = 0;
    long long v8 = v7 + 2;
    a1[1] = (uint64_t)(v7 + 2);
  }
  a1[1] = (uint64_t)v8;
  return result;
}

void sub_2345BABA4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<ProcessLibrary>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<ProcessLibrary>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<ProcessLibrary>,std::reverse_iterator<ProcessLibrary*>,std::reverse_iterator<ProcessLibrary*>,std::reverse_iterator<ProcessLibrary*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ProcessLibrary>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(32 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<ProcessLibrary>,std::reverse_iterator<ProcessLibrary*>,std::reverse_iterator<ProcessLibrary*>,std::reverse_iterator<ProcessLibrary*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v13 = a6;
  *((void *)&v13 + 1) = a7;
  long long v12 = v13;
  v10[0] = a1;
  v10[1] = &v12;
  v10[2] = &v13;
  if (a3 == a5)
  {
    uint64_t v8 = a6;
  }
  else
  {
    do
    {
      *(_OWORD *)(v7 - 32) = *(_OWORD *)(a3 - 32);
      *(_OWORD *)(v7 - 16) = *(_OWORD *)(a3 - 16);
      *(void *)(a3 - 16) = 0;
      *(void *)(a3 - 8) = 0;
      uint64_t v7 = *((void *)&v13 + 1) - 32;
      *((void *)&v13 + 1) -= 32;
      a3 -= 32;
    }
    while (a3 != a5);
    uint64_t v8 = v13;
  }
  char v11 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<ProcessLibrary>,std::reverse_iterator<ProcessLibrary*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v10);
  return v8;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<ProcessLibrary>,std::reverse_iterator<ProcessLibrary*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<ProcessLibrary>,std::reverse_iterator<ProcessLibrary*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<ProcessLibrary>,std::reverse_iterator<ProcessLibrary*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    uint64_t v3 = *(std::__shared_weak_count **)(v1 + 24);
    if (v3) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v3);
    }
    v1 += 32;
  }
}

void **std::__split_buffer<ProcessLibrary>::~__split_buffer(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void std::__split_buffer<ProcessLibrary>::clear[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v1 = *(void *)(a1 + 16);
  while (v1 != v2)
  {
    *(void *)(a1 + 16) = v1 - 32;
    unint64_t v4 = *(std::__shared_weak_count **)(v1 - 8);
    if (v4)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
      uint64_t v1 = *(void *)(a1 + 16);
    }
    else
    {
      v1 -= 32;
    }
  }
}

uint64_t std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<ProcessLibrary *,ProcessLibrary *,ProcessLibrary *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a2;
  if (a2 == a3) {
    return a2;
  }
  uint64_t v6 = a3;
  do
  {
    *(_OWORD *)a4 = *(_OWORD *)v5;
    long long v7 = *(_OWORD *)(v5 + 16);
    *(void *)(v5 + 16) = 0;
    *(void *)(v5 + 24) = 0;
    uint64_t v8 = *(std::__shared_weak_count **)(a4 + 24);
    *(_OWORD *)(a4 + 16) = v7;
    if (v8) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
    }
    a4 += 32;
    v5 += 32;
  }
  while (v5 != v6);
  return v6;
}

void ___ZNK14ProcessLibrary14forEachSegmentIZN7Process50createTransientProcessSymbolicatorFromDescriptionsEvE3__0EEvT__block_invoke(void *a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(*(void *)(a1[4] + 8) + 24))
  {
    uint64_t Range = CSRegionGetRange();
    uint64_t v4 = v3;
    Name = (char *)CSRegionGetName();
    if (strncmp(Name, "__PAGEZERO", 0xAuLL)) {
      Range += a1[6];
    }
    *(void *)&long long v34 = Range;
    *((void *)&v34 + 1) = Range + v4;
    uint64_t v6 = &v33;
    std::string::basic_string[abi:ne180100]<0>(&v33, Name);
    int64_t size = HIBYTE(v33.__r_.__value_.__r.__words[2]);
    char v8 = HIBYTE(v33.__r_.__value_.__r.__words[2]);
    std::string::size_type v9 = v33.__r_.__value_.__r.__words[0];
    if ((v33.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    {
      int64_t size = v33.__r_.__value_.__l.__size_;
      uint64_t v6 = (std::string *)v33.__r_.__value_.__r.__words[0];
    }
    if (size >= 8)
    {
      unint64_t v10 = (char *)v6 + size;
      char v11 = v6;
      do
      {
        long long v12 = (char *)memchr(v11, 32, size - 7);
        if (!v12) {
          break;
        }
        if (*(void *)v12 == 0x544E454D47455320)
        {
          if (v12 != v10 && v12 - (char *)v6 != -1)
          {
            std::string::erase(&v33, v12 - (char *)v6, 8uLL);
            char v8 = HIBYTE(v33.__r_.__value_.__r.__words[2]);
            std::string::size_type v9 = v33.__r_.__value_.__r.__words[0];
          }
          break;
        }
        char v11 = (std::string *)(v12 + 1);
        int64_t size = v10 - (char *)v11;
      }
      while (v10 - (char *)v11 >= 8);
    }
    if (v8 >= 0) {
      long long v13 = &v33;
    }
    else {
      long long v13 = (std::string *)v9;
    }
    strncpy((char *)&v35, (const char *)v13, 0x11uLL);
    long long v14 = (void **)a1[5];
    uint64_t v15 = (char *)v14[1];
    __n128 v16 = (char *)v14[2];
    if (v15 >= v16)
    {
      unint64_t v20 = 0xCCCCCCCCCCCCCCCDLL * ((v15 - (unsigned char *)*v14) >> 3);
      unint64_t v21 = v20 + 1;
      if (v20 + 1 > 0x666666666666666) {
        std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v22 = 0xCCCCCCCCCCCCCCCDLL * ((v16 - (unsigned char *)*v14) >> 3);
      if (2 * v22 > v21) {
        unint64_t v21 = 2 * v22;
      }
      if (v22 >= 0x333333333333333) {
        unint64_t v23 = 0x666666666666666;
      }
      else {
        unint64_t v23 = v21;
      }
      if (v23) {
        long long v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_CSBinaryRelocationInformation>>((uint64_t)(v14 + 2), v23);
      }
      else {
        long long v24 = 0;
      }
      long long v25 = &v24[40 * v20];
      long long v26 = &v24[40 * v23];
      long long v27 = v34;
      long long v28 = v35;
      *((void *)v25 + 4) = v36;
      *(_OWORD *)long long v25 = v27;
      *((_OWORD *)v25 + 1) = v28;
      long long v19 = v25 + 40;
      long long v30 = (char *)*v14;
      long long v29 = (char *)v14[1];
      if (v29 != *v14)
      {
        do
        {
          long long v31 = *(_OWORD *)(v29 - 40);
          long long v32 = *(_OWORD *)(v29 - 24);
          *((void *)v25 - 1) = *((void *)v29 - 1);
          *(_OWORD *)(v25 - 24) = v32;
          *(_OWORD *)(v25 - 40) = v31;
          v25 -= 40;
          v29 -= 40;
        }
        while (v29 != v30);
        long long v29 = (char *)*v14;
      }
      *long long v14 = v25;
      v14[1] = v19;
      v14[2] = v26;
      if (v29) {
        operator delete(v29);
      }
    }
    else
    {
      long long v17 = v34;
      long long v18 = v35;
      *((void *)v15 + 4) = v36;
      *(_OWORD *)uint64_t v15 = v17;
      *((_OWORD *)v15 + 1) = v18;
      long long v19 = v15 + 40;
    }
    v14[1] = v19;
    if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v33.__r_.__value_.__l.__data_);
    }
  }
}

void sub_2345BB128(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
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
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

uint64_t ProcessLibrary::ProcessLibrary(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)uint64_t result = 0;
  *(void *)(result + 8) = 0;
  *(_OWORD *)(result + 16) = *(_OWORD *)a3;
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  *(void *)uint64_t result = a2;
  uint64_t v3 = *(void *)(result + 16);
  if (v3) {
    *(void *)(result + 8) = *(void *)(v3 + 8);
  }
  return result;
}

{
  uint64_t v3;

  *(void *)uint64_t result = 0;
  *(void *)(result + 8) = 0;
  *(_OWORD *)(result + 16) = *(_OWORD *)a3;
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  *(void *)uint64_t result = a2;
  uint64_t v3 = *(void *)(result + 16);
  if (v3) {
    *(void *)(result + 8) = *(void *)(v3 + 8);
  }
  return result;
}

SharedLibrary *ProcessLibrary::slide(ProcessLibrary *this)
{
  uint64_t result = (SharedLibrary *)*((void *)this + 2);
  if (result)
  {
    uint64_t v3 = *(void *)this;
    return (SharedLibrary *)(v3 - SharedLibrary::baseAddress(result));
  }
  return result;
}

uint64_t ProcessLibrary::loadAddress(ProcessLibrary *this)
{
  return *(void *)this;
}

SharedLibrary *ProcessLibrary::architecture(ProcessLibrary *this)
{
  uint64_t result = (SharedLibrary *)*((void *)this + 2);
  if (result) {
    return (SharedLibrary *)SharedLibrary::architecture(result);
  }
  return result;
}

SharedLibrary *ProcessLibrary::path@<X0>(ProcessLibrary *this@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (SharedLibrary *)*((void *)this + 2);
  if (result) {
    return (SharedLibrary *)SharedLibrary::path(result, (uint64_t)a2);
  }
  *a2 = 0;
  a2[16] = 0;
  return result;
}

SharedLibrary *ProcessLibrary::addAddress(ProcessLibrary *this, uint64_t a2)
{
  uint64_t result = (SharedLibrary *)*((void *)this + 2);
  if (result)
  {
    uint64_t v4 = *(void *)this;
    unint64_t v5 = a2 - v4 + SharedLibrary::baseAddress(result);
    uint64_t v6 = (SharedLibrary *)*((void *)this + 2);
    return (SharedLibrary *)SharedLibrary::addAddress(v6, v5);
  }
  return result;
}

SharedLibrary *ProcessLibrary::uuid(ProcessLibrary *this)
{
  uint64_t result = (SharedLibrary *)*((void *)this + 2);
  if (result) {
    return (SharedLibrary *)SharedLibrary::uuid(result);
  }
  return result;
}

SharedLibrary *ProcessLibrary::isInSharedCacheCheckAfterPostprocessingDone(ProcessLibrary *this)
{
  uint64_t result = (SharedLibrary *)*((void *)this + 2);
  if (result)
  {
    SharedLibrary::csSymbolOwner(result);
    return (SharedLibrary *)CSSymbolOwnerIsDyldSharedCache();
  }
  return result;
}

SharedLibrary *ProcessLibrary::isPrimaryExecutableCheckAfterPostprocessingDone(ProcessLibrary *this)
{
  uint64_t result = (SharedLibrary *)*((void *)this + 2);
  if (result)
  {
    SharedLibrary::csSymbolOwner(result);
    return (SharedLibrary *)CSSymbolOwnerIsAOut();
  }
  return result;
}

SharedLibrary *ProcessLibrary::segmentCountCheckAfterPostprocessingDone(ProcessLibrary *this)
{
  uint64_t result = (SharedLibrary *)*((void *)this + 2);
  if (result)
  {
    SharedLibrary::csSymbolOwner(result);
    return (SharedLibrary *)CSSymbolOwnerForeachSegment();
  }
  return result;
}

double MergedLibrary::mergeWith(MergedLibrary *this, const LibraryDescription *a2)
{
  unint64_t v4 = *((void *)this + 2);
  uint64_t v5 = *((unsigned __int8 *)this + 24);
  LibraryDescription::libraryRange(a2);
  if (!v5 || (v4 <= 1 ? (BOOL v7 = v6 >= 2) : (BOOL v7 = 0), v7))
  {
    *((void *)this + 2) = v6;
    *((unsigned char *)this + 24) = 1;
  }
  int v8 = *((unsigned __int8 *)this + 48);
  LibraryDescription::path((uint64_t)a2, (uint64_t)&v10);
  if (!v8)
  {
    if (v11)
    {
      double result = *(double *)&v10;
      *((_OWORD *)this + 2) = v10;
      *((unsigned char *)this + 48) = v11;
    }
  }
  return result;
}

uint64_t MergedLibrary::length(MergedLibrary *this)
{
  return *((void *)this + 2);
}

__n128 MergedLibrary::path@<Q0>(__n128 *this@<X0>, __n128 *a2@<X8>)
{
  __n128 result = this[2];
  *a2 = result;
  a2[1].n128_u64[0] = this[3].n128_u64[0];
  return result;
}

BOOL MergedLibrary::operator==(void *a1, void *a2)
{
  return *a1 == *a2 && a1[1] == a2[1];
}

uint64_t MergedLibrary::uuid(MergedLibrary *this)
{
  return *(void *)this;
}

uint64_t MergedLibrary::hash(MergedLibrary *this)
{
  return *((void *)this + 1) ^ *(void *)this;
}

uint64_t Segment::name(Segment *this)
{
  return *((void *)this + 2);
}

uint64_t Segment::sections(Segment *this)
{
  return (uint64_t)this + 32;
}

uint64_t Segment::symbols(Segment *this)
{
  return (uint64_t)this + 56;
}

uint64_t Segment::contents(Segment *this)
{
  return *((void *)this + 10);
}

uint64_t Segment::initializeWithCSSegment(uint64_t *a1)
{
  *a1 = CSRegionGetRange();
  a1[1] = v2;
  uint64_t Name = CSRegionGetName();
  if (Name) {
    unint64_t v4 = (const char *)Name;
  }
  else {
    unint64_t v4 = (const char *)&unk_2345D29A6;
  }
  size_t v5 = strlen(v4);
  a1[2] = (uint64_t)v4;
  a1[3] = v5;
  CSSegmentForeachSection();
  return CSRegionForeachSymbol();
}

uint64_t ___ZN7Segment23initializeWithCSSegmentE10_CSTypeRef_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(uint64_t **)(a1 + 32);
  unint64_t v2 = v1[5];
  if (v2 >= v1[6])
  {
    uint64_t result = std::vector<Section>::__emplace_back_slow_path<_CSTypeRef &>(v1 + 4);
  }
  else
  {
    Section::Section(v1[5]);
    uint64_t result = v2 + 48;
    v1[5] = v2 + 48;
  }
  v1[5] = result;
  return result;
}

void sub_2345BB6AC(_Unwind_Exception *a1)
{
  *(void *)(v2 + 40) = v1;
  _Unwind_Resume(a1);
}

uint64_t ___ZN7Segment23initializeWithCSSegmentE10_CSTypeRef_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v6[0] = a2;
  v6[1] = a3;
  uint64_t v3 = *(uint64_t **)(a1 + 32);
  unint64_t v4 = v3[8];
  if (v4 >= v3[9])
  {
    uint64_t result = std::vector<Symbol>::__emplace_back_slow_path<_CSTypeRef &>(v3 + 7, v6);
  }
  else
  {
    Symbol::Symbol(v3[8], a2, a3);
    uint64_t result = v4 + 128;
    v3[8] = v4 + 128;
  }
  v3[8] = result;
  return result;
}

void sub_2345BB710(_Unwind_Exception *a1)
{
  *(void *)(v2 + 64) = v1;
  _Unwind_Resume(a1);
}

uint64_t Segment::debug(Segment *this)
{
  printf("Segment @ 0x%llx - 0x%llx: ", *(void *)this, *((void *)this + 1) + *(void *)this);
  if (*((void *)this + 3)) {
    uint64_t v2 = (const char *)*((void *)this + 2);
  }
  else {
    uint64_t v2 = "<null>";
  }
  uint64_t result = puts(v2);
  unint64_t v4 = (Section *)*((void *)this + 4);
  size_t v5 = (Section *)*((void *)this + 5);
  while (v4 != v5)
  {
    uint64_t result = Section::debug(v4);
    unint64_t v4 = (Section *)((char *)v4 + 48);
  }
  BOOL v7 = (Symbol *)*((void *)this + 7);
  unint64_t v6 = (Symbol *)*((void *)this + 8);
  while (v7 != v6)
  {
    uint64_t result = Symbol::debug(v7);
    BOOL v7 = (Symbol *)((char *)v7 + 128);
  }
  return result;
}

uint64_t Segment::Segment(uint64_t a1)
{
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  Segment::initializeWithCSSegment((uint64_t *)a1);
  return a1;
}

void sub_2345BB7F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10)
{
  a10 = (void **)(v10 + 56);
  std::vector<Symbol>::__destroy_vector::operator()[abi:ne180100](&a10);
  long long v12 = *(void **)(v10 + 32);
  if (v12)
  {
    *(void *)(v10 + 40) = v12;
    operator delete(v12);
  }
  _Unwind_Resume(a1);
}

uint64_t std::vector<Section>::__emplace_back_slow_path<_CSTypeRef &>(uint64_t *a1)
{
  uint64_t v2 = (char *)*a1;
  unint64_t v3 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 4);
  unint64_t v4 = v3 + 1;
  if (v3 + 1 > 0x555555555555555) {
    std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v5 = (uint64_t)(a1 + 2);
  unint64_t v6 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - (uint64_t)v2) >> 4);
  if (2 * v6 > v4) {
    unint64_t v4 = 2 * v6;
  }
  if (v6 >= 0x2AAAAAAAAAAAAAALL) {
    unint64_t v7 = 0x555555555555555;
  }
  else {
    unint64_t v7 = v4;
  }
  if (v7)
  {
    int v8 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Section>>(v5, v7);
    uint64_t v10 = v9;
  }
  else
  {
    int v8 = 0;
    uint64_t v10 = 0;
  }
  uint64_t v11 = Section::Section((uint64_t)&v8[48 * v3]);
  uint64_t v12 = v11 + 48;
  long long v14 = (char *)*a1;
  long long v13 = (char *)a1[1];
  if (v13 != (char *)*a1)
  {
    do
    {
      long long v15 = *((_OWORD *)v13 - 3);
      long long v16 = *((_OWORD *)v13 - 1);
      *(_OWORD *)(v11 - 32) = *((_OWORD *)v13 - 2);
      *(_OWORD *)(v11 - 16) = v16;
      *(_OWORD *)(v11 - 48) = v15;
      v11 -= 48;
      v13 -= 48;
    }
    while (v13 != v14);
    long long v13 = (char *)*a1;
  }
  *a1 = v11;
  a1[1] = v12;
  a1[2] = (uint64_t)&v8[48 * v10];
  if (v13) {
    operator delete(v13);
  }
  return v12;
}

void sub_2345BB93C(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<Section>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(48 * a2);
}

uint64_t std::vector<Symbol>::__emplace_back_slow_path<_CSTypeRef &>(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = (a1[1] - *a1) >> 7;
  unint64_t v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) >> 57) {
    std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  uint64_t v8 = a1[2] - v3;
  if (v8 >> 6 > v5) {
    unint64_t v5 = v8 >> 6;
  }
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFF80) {
    unint64_t v9 = 0x1FFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v9 = v5;
  }
  long long v17 = a1 + 2;
  if (v9) {
    uint64_t v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Symbol>>(v7, v9);
  }
  else {
    uint64_t v10 = 0;
  }
  long long v13 = v10;
  long long v14 = &v10[128 * v4];
  long long v15 = v14;
  long long v16 = &v10[128 * v9];
  Symbol::Symbol(v14, *a2, a2[1]);
  long long v15 = v14 + 128;
  std::vector<Symbol>::__swap_out_circular_buffer(a1, &v13);
  uint64_t v11 = a1[1];
  std::__split_buffer<Symbol>::~__split_buffer((uint64_t)&v13);
  return v11;
}

void sub_2345BBA70(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<Symbol>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void std::vector<Symbol>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<Symbol>,std::reverse_iterator<Symbol*>,std::reverse_iterator<Symbol*>,std::reverse_iterator<Symbol*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v4;
  uint64_t v5 = *a1;
  *a1 = v4;
  a2[1] = v5;
  uint64_t v6 = a1[1];
  a1[1] = a2[2];
  a2[2] = v6;
  uint64_t v7 = a1[2];
  a1[2] = a2[3];
  a2[3] = v7;
  *a2 = a2[1];
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<Symbol>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 57) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(a2 << 7);
}

__n128 std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<Symbol>,std::reverse_iterator<Symbol*>,std::reverse_iterator<Symbol*>,std::reverse_iterator<Symbol*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  if (a3 != a5)
  {
    uint64_t v8 = (void *)(a7 - 48);
    do
    {
      *((_OWORD *)v8 - 5) = *(_OWORD *)(a3 - 128);
      long long v9 = *(_OWORD *)(a3 - 112);
      long long v10 = *(_OWORD *)(a3 - 96);
      long long v11 = *(_OWORD *)(a3 - 80);
      *(_OWORD *)((char *)v8 - 20) = *(_OWORD *)(a3 - 68);
      *((_OWORD *)v8 - 3) = v10;
      *((_OWORD *)v8 - 2) = v11;
      *((_OWORD *)v8 - 4) = v9;
      v8[1] = 0;
      v8[2] = 0;
      *uint64_t v8 = 0;
      *(_OWORD *)uint64_t v8 = *(_OWORD *)(a3 - 48);
      v8[2] = *(void *)(a3 - 32);
      *(void *)(a3 - 48) = 0;
      *(void *)(a3 - 40) = 0;
      *(void *)(a3 - 32) = 0;
      v8[3] = 0;
      v8[4] = 0;
      v8[5] = 0;
      __n128 result = *(__n128 *)(a3 - 24);
      *(__n128 *)(v8 + 3) = result;
      v8[5] = *(void *)(a3 - 8);
      *(void *)(a3 - 24) = 0;
      *(void *)(a3 - 16) = 0;
      *(void *)(a3 - 8) = 0;
      v8 -= 16;
      v7 -= 128;
      a3 -= 128;
    }
    while (a3 != a5);
  }
  return result;
}

void std::__destroy_at[abi:ne180100]<Symbol,0>(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 104);
  if (v2)
  {
    *(void *)(a1 + 112) = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void **)(a1 + 80);
  std::vector<InlineSymbol>::__destroy_vector::operator()[abi:ne180100](&v3);
}

void std::vector<InlineSymbol>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    uint64_t v4 = (char *)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        uint64_t v6 = v4 - 160;
        uint64_t v7 = v4 - 80;
        std::vector<InlineSymbol>::__destroy_vector::operator()[abi:ne180100](&v7);
        uint64_t v4 = v6;
      }
      while (v6 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t std::__split_buffer<Symbol>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 128;
    std::__destroy_at[abi:ne180100]<Symbol,0>(i - 128);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::vector<Symbol>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    uint64_t v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 128;
        std::__destroy_at[abi:ne180100]<Symbol,0>(v4);
      }
      while ((void *)v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t InlineSymbol::asmName@<X0>(uint64_t this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *(void *)(this + 40);
  if (v2)
  {
    *(_OWORD *)a2 = *(_OWORD *)(this + 32);
    LOBYTE(v2) = 1;
  }
  else
  {
    *(unsigned char *)a2 = 0;
  }
  *(unsigned char *)(a2 + 16) = v2;
  return this;
}

uint64_t InlineSymbol::name@<X0>(uint64_t this@<X0>, unsigned char *a2@<X8>)
{
  if (*(void *)(this + 24))
  {
    long long v2 = *(_OWORD *)(this + 16);
  }
  else
  {
    uint64_t v3 = *(void *)(this + 40);
    if (!v3)
    {
      *a2 = 0;
      goto LABEL_6;
    }
    long long v2 = *(_OWORD *)(this + 32);
  }
  *(_OWORD *)a2 = v2;
  LOBYTE(v3) = 1;
LABEL_6:
  a2[16] = v3;
  return this;
}

uint64_t InlineSymbol::symbolFlags(InlineSymbol *this)
{
  return *((void *)this + 8);
}

uint64_t InlineSymbol::symbolSourceType(InlineSymbol *this)
{
  return *((unsigned int *)this + 18);
}

uint64_t InlineSymbol::symbolContents(InlineSymbol *this)
{
  return *((void *)this + 6);
}

uint64_t InlineSymbol::initializeWithCSSymbolAndCSSourceInfo(uint64_t a1)
{
  *(void *)a1 = CSSymbolGetRange();
  *(void *)(a1 + 8) = v2;
  Mangleduint64_t Name = CSSymbolGetMangledName();
  if (MangledName) {
    uint64_t v4 = (const char *)MangledName;
  }
  else {
    uint64_t v4 = (const char *)&unk_2345D29A6;
  }
  size_t v5 = strlen(v4);
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  uint64_t Name = CSSymbolGetName();
  if (Name) {
    uint64_t v7 = (const char *)Name;
  }
  else {
    uint64_t v7 = (const char *)&unk_2345D29A6;
  }
  size_t v8 = strlen(v7);
  *(void *)(a1 + 16) = v7;
  *(void *)(a1 + 24) = v8;
  *(void *)(a1 + 64) = CSSymbolGetFlags();
  SourceInfo::SourceInfo(v11);
  long long v9 = v11[1];
  *(_OWORD *)(a1 + 104) = v11[0];
  *(_OWORD *)(a1 + 120) = v9;
  *(_OWORD *)(a1 + 136) = v11[2];
  *(void *)(a1 + 152) = v12;
  return CSSymbolForeachInlineRangeAtDepth();
}

uint64_t ___ZN12InlineSymbol37initializeWithCSSymbolAndCSSourceInfoE10_CSTypeRefS0__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a6)
  {
    uint64_t v6 = *(void *)(result + 32);
    uint64_t v7 = 16 * a6 - 16;
    long long v8 = *(_OWORD *)(a4 + v7);
    long long v10 = *(_OWORD *)(a5 + v7);
    long long v11 = v8;
    unint64_t v9 = *(void *)(v6 + 88);
    if (v9 >= *(void *)(v6 + 96))
    {
      __n128 result = std::vector<InlineSymbol>::__emplace_back_slow_path<_CSTypeRef &,_CSTypeRef &>(v6 + 80, &v11, &v10);
    }
    else
    {
      InlineSymbol::InlineSymbol(*(void *)(v6 + 88), v11, *((void *)&v11 + 1), v10, *((void *)&v10 + 1));
      __n128 result = v9 + 160;
      *(void *)(v6 + 88) = v9 + 160;
    }
    *(void *)(v6 + 88) = result;
  }
  return result;
}

void sub_2345BBF94(_Unwind_Exception *a1)
{
  *(void *)(v2 + 88) = v1;
  _Unwind_Resume(a1);
}

uint64_t InlineSymbol::debug(InlineSymbol *this)
{
  printf("\t\tInline Symbol @ 0x%llx - 0x%llx: ", *(void *)this, *((void *)this + 1) + *(void *)this);
  if (*((void *)this + 3))
  {
    uint64_t v2 = (const char *)*((void *)this + 2);
    if (!*((void *)this + 5)) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (*((void *)this + 5))
  {
    uint64_t v2 = (const char *)*((void *)this + 4);
LABEL_6:
    uint64_t v3 = (const char *)*((void *)this + 4);
    printf("%s | ", v2);
    uint64_t v2 = v3;
LABEL_7:
    printf("%s | ", v2);
  }
  putchar(10);
  uint64_t result = SourceInfo::debug((InlineSymbol *)((char *)this + 104));
  uint64_t v6 = (InlineSymbol *)*((void *)this + 10);
  size_t v5 = (InlineSymbol *)*((void *)this + 11);
  while (v6 != v5)
  {
    uint64_t result = InlineSymbol::debug(v6);
    uint64_t v6 = (InlineSymbol *)((char *)v6 + 160);
  }
  return result;
}

uint64_t InlineSymbol::InlineSymbol(uint64_t a1)
{
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(void *)(a1 + 144) = 0;
  InlineSymbol::initializeWithCSSymbolAndCSSourceInfo(a1);
  return a1;
}

void sub_2345BC0A4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::vector<InlineSymbol>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<InlineSymbol>::__emplace_back_slow_path<_CSTypeRef &,_CSTypeRef &>(uint64_t *a1)
{
  uint64_t v2 = *a1;
  unint64_t v3 = 0xCCCCCCCCCCCCCCCDLL * ((a1[1] - *a1) >> 5);
  unint64_t v4 = v3 + 1;
  if (v3 + 1 > 0x199999999999999) {
    std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v5 = (uint64_t)(a1 + 2);
  unint64_t v6 = 0xCCCCCCCCCCCCCCCDLL * ((a1[2] - v2) >> 5);
  if (2 * v6 > v4) {
    unint64_t v4 = 2 * v6;
  }
  if (v6 >= 0xCCCCCCCCCCCCCCLL) {
    unint64_t v7 = 0x199999999999999;
  }
  else {
    unint64_t v7 = v4;
  }
  long long v15 = a1 + 2;
  if (v7) {
    long long v8 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<InlineSymbol>>(v5, v7);
  }
  else {
    long long v8 = 0;
  }
  long long v11 = v8;
  uint64_t v12 = &v8[160 * v3];
  long long v14 = &v8[160 * v7];
  InlineSymbol::InlineSymbol((uint64_t)v12);
  long long v13 = v12 + 160;
  std::vector<InlineSymbol>::__swap_out_circular_buffer(a1, &v11);
  uint64_t v9 = a1[1];
  std::__split_buffer<InlineSymbol>::~__split_buffer(&v11);
  return v9;
}

void sub_2345BC1BC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<InlineSymbol>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<InlineSymbol>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<InlineSymbol>,std::reverse_iterator<InlineSymbol*>,std::reverse_iterator<InlineSymbol*>,std::reverse_iterator<InlineSymbol*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<InlineSymbol>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x19999999999999ALL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(160 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<InlineSymbol>,std::reverse_iterator<InlineSymbol*>,std::reverse_iterator<InlineSymbol*>,std::reverse_iterator<InlineSymbol*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v19 = a6;
  *((void *)&v19 + 1) = a7;
  long long v18 = v19;
  v16[0] = a1;
  v16[1] = &v18;
  v16[2] = &v19;
  if (a3 == a5)
  {
    uint64_t v14 = a6;
  }
  else
  {
    do
    {
      *(_OWORD *)(v7 - 160) = *(_OWORD *)(a3 - 160);
      long long v8 = *(_OWORD *)(a3 - 144);
      long long v9 = *(_OWORD *)(a3 - 128);
      long long v10 = *(_OWORD *)(a3 - 112);
      *(_OWORD *)(v7 - 100) = *(_OWORD *)(a3 - 100);
      *(_OWORD *)(v7 - 128) = v9;
      *(_OWORD *)(v7 - 112) = v10;
      *(_OWORD *)(v7 - 144) = v8;
      *(void *)(v7 - 72) = 0;
      *(void *)(v7 - 64) = 0;
      *(void *)(v7 - 80) = 0;
      *(_OWORD *)(v7 - 80) = *(_OWORD *)(a3 - 80);
      *(void *)(v7 - 64) = *(void *)(a3 - 64);
      *(void *)(a3 - 80) = 0;
      *(void *)(a3 - 72) = 0;
      *(void *)(a3 - 64) = 0;
      long long v11 = *(_OWORD *)(a3 - 40);
      long long v12 = *(_OWORD *)(a3 - 24);
      uint64_t v13 = *(void *)(a3 - 8);
      *(_OWORD *)(v7 - 56) = *(_OWORD *)(a3 - 56);
      *(void *)(v7 - 8) = v13;
      *(_OWORD *)(v7 - 24) = v12;
      *(_OWORD *)(v7 - 40) = v11;
      uint64_t v7 = *((void *)&v19 + 1) - 160;
      *((void *)&v19 + 1) -= 160;
      a3 -= 160;
    }
    while (a3 != a5);
    uint64_t v14 = v19;
  }
  char v17 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<InlineSymbol>,std::reverse_iterator<InlineSymbol*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v16);
  return v14;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<InlineSymbol>,std::reverse_iterator<InlineSymbol*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<InlineSymbol>,std::reverse_iterator<InlineSymbol*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<InlineSymbol>,std::reverse_iterator<InlineSymbol*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    unint64_t v3 = (void **)(v1 + 80);
    std::vector<InlineSymbol>::__destroy_vector::operator()[abi:ne180100](&v3);
    v1 += 160;
  }
}

void **std::__split_buffer<InlineSymbol>::~__split_buffer(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void std::__split_buffer<InlineSymbol>::clear[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v2; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 160;
    unint64_t v4 = (void **)(i - 80);
    std::vector<InlineSymbol>::__destroy_vector::operator()[abi:ne180100](&v4);
  }
}

__n128 DyldKdebugAOTImageDescription::consumeTracepointA(__n128 *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 8);
  *a1 = result;
  a1[1].n128_u64[0] = *(void *)(a2 + 24);
  return result;
}

void *DyldKdebugAOTImageDescription::consumeTracepointB(void *result, void *a2)
{
  result[3] = a2[1];
  result[4] = a2[2];
  result[5] = a2[3];
  result[6] = a2[4];
  return result;
}

uint64_t *KernelSymbolicator::kernelSymbolicatorPtr(KernelSymbolicator *this)
{
  {
    __cxa_atexit((void (*)(void *))std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::~unique_ptr[abi:ne180100], &KernelSymbolicator::kernelSymbolicatorPtr(void)::kernelPtr, &dword_2345B5000);
  }
  if (atomic_load_explicit((atomic_ullong *volatile)&KernelSymbolicator::kernelSymbolicatorPtr(void)::once, memory_order_acquire) != -1)
  {
    unint64_t v4 = &v2;
    unint64_t v3 = &v4;
    std::__call_once(&KernelSymbolicator::kernelSymbolicatorPtr(void)::once, &v3, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<KernelSymbolicator::kernelSymbolicatorPtr(void)::$_0 &&>>);
  }
  return &KernelSymbolicator::kernelSymbolicatorPtr(void)::kernelPtr;
}

uint64_t *std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::~unique_ptr[abi:ne180100](uint64_t *a1)
{
  return a1;
}

uint64_t KernelSymbolicator::sharedKernelSymbolicator(KernelSymbolicator *this)
{
  if (KernelSymbolicator::kernelSymbolicatorPtr(void)::kernelPtr) {
    return *(void *)KernelSymbolicator::kernelSymbolicatorPtr(void)::kernelPtr;
  }
  else {
    return 0;
  }
}

uint64_t std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::reset[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>::~ScopeGuard(result);
    JUMPOUT(0x237DC1B90);
  }
  return result;
}

uint64_t ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>::~ScopeGuard(uint64_t a1)
{
  if ((CSIsNull() & 1) == 0) {
    CSRelease();
  }
  return a1;
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<KernelSymbolicator::kernelSymbolicatorPtr(void)::$_0 &&>>()
{
}

uint64_t ats_will_start_tracing(SharedCacheSymbolicators *a1)
{
  uint64_t v1 = (KernelSymbolicator *)SharedCacheSymbolicators::initializeSharedCacheSymbolicators(a1);

  return KernelSymbolicator::initializeKernelSymbolicator(v1);
}

uint64_t ats_configure_postprocessing(uint64_t a1)
{
  return ats_configure_postprocessing_with_config(a1, 0);
}

uint64_t ats_configure_postprocessing_with_config(uint64_t result, uint64_t a2)
{
  if (result)
  {
    uint64_t v3 = result;
    if (a2 && *(_DWORD *)(a2 + 8) == 1) {
      ktrace_set_execnames_enabled();
    }
    get_symbolication_session(a2);
    uint64_t result = get_symbolication_session(ats_symbolication_config *)::session;
    if (get_symbolication_session(ats_symbolication_config *)::session)
    {
      SymbolicationSession::setKtraceSession(get_symbolication_session(ats_symbolication_config *)::session, v3);
      unint64_t v4 = (SymbolicationSession *)get_symbolication_session(ats_symbolication_config *)::session;
      return SymbolicationSession::registerKtraceCallbacks(v4);
    }
  }
  return result;
}

SymbolicationSession *ats_symbolication_enabled()
{
  get_symbolication_session(0);
  uint64_t result = (SymbolicationSession *)get_symbolication_session(ats_symbolication_config *)::session;
  if (get_symbolication_session(ats_symbolication_config *)::session)
  {
    return (SymbolicationSession *)SymbolicationSession::isConfiguredToSaveSymbols(result);
  }
  return result;
}

uint64_t *ats_configure_postprocessing_with_additional_address(int a1, unint64_t a2)
{
  get_symbolication_session(0);
  uint64_t result = (uint64_t *)get_symbolication_session(ats_symbolication_config *)::session;
  if (get_symbolication_session(ats_symbolication_config *)::session)
  {
    return SymbolicationSession::learnAddressForPid((SymbolicationSession *)result, a1, a2);
  }
  return result;
}

uint64_t get_symbolication_session(uint64_t a1)
{
  uint64_t result = get_symbolication_session(ats_symbolication_config *)::session;
  if (!get_symbolication_session(ats_symbolication_config *)::session) {
    operator new();
  }
  if (a1)
  {
    return SymbolicationSession::updateConfig(result, a1);
  }
  return result;
}

void sub_2345BC8B4(_Unwind_Exception *a1)
{
  MEMORY[0x237DC1B90](v1, 0x10A0C405ABB9D29);
  _Unwind_Resume(a1);
}

uint64_t ats_postprocessing_complete(uint64_t a1)
{
  get_symbolication_session(0);
  if (get_symbolication_session(ats_symbolication_config *)::session) {
    SymbolicationSession::writeSymbolDataToKtraceFile((const void **)get_symbolication_session(ats_symbolication_config *)::session, a1);
  }

  return destroy_symbolication_session();
}

uint64_t destroy_symbolication_session(void)
{
  get_symbolication_session(0);
  uint64_t result = get_symbolication_session(ats_symbolication_config *)::session;
  if (get_symbolication_session(ats_symbolication_config *)::session)
  {
    SymbolicationSession::~SymbolicationSession((SymbolicationSession *)get_symbolication_session(ats_symbolication_config *)::session);
    uint64_t result = MEMORY[0x237DC1B90]();
    get_symbolication_session(ats_symbolication_config *)::session = 0;
  }
  return result;
}

uint64_t ats_postprocessing_complete_write_processmaps()
{
  get_symbolication_session(0);
  uint64_t result = get_symbolication_session(ats_symbolication_config *)::session;
  if (get_symbolication_session(ats_symbolication_config *)::session)
  {
    SymbolicationSession::writeProcessMapsToKtraceFile((std::once_flag::_State_type *)get_symbolication_session(ats_symbolication_config *)::session);
    uint64_t result = SymbolicationSession::isConfiguredToSaveSymbols((SymbolicationSession *)get_symbolication_session(ats_symbolication_config *)::session);
    if ((result & 1) == 0)
    {
      return destroy_symbolication_session();
    }
  }
  return result;
}

uint64_t ats_should_amend_with_file(uint64_t a1, uint64_t a2)
{
  get_symbolication_session(a2);
  char v2 = (SymbolicationSession *)get_symbolication_session(ats_symbolication_config *)::session;
  if (!get_symbolication_session(ats_symbolication_config *)::session) {
    return 1;
  }

  return SymbolicationSession::extractSymbolicationChunksFromFile(v2);
}

uint64_t DyldKdebugSharedCacheDescription::consumeTracepointA(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 24);
  uint64_t v3 = *(void *)(a2 + 32);
  *(void *)(a1 + 16) = v4;
  DyldKdebugFilesystemInfo::setFsid((void *)(a1 + 40), v3);
  uint64_t result = SharedCacheDescription::baseAddressForSharedCacheWithUUID((SharedCacheDescription *)a1, *(uint8_t **)a1, *(uint8_t **)(a1 + 8));
  *(void *)(a1 + 24) = result;
  *(unsigned char *)(a1 + 32) = v6;
  return result;
}

int32x4_t DyldKdebugSharedCacheDescription::consumeTracepoint32A(int32x4_t *a1, uint64_t a2)
{
  int32x4_t result = vuzp1q_s32(*(int32x4_t *)(a2 + 8), *(int32x4_t *)(a2 + 24));
  *a1 = result;
  return result;
}

uint64_t DyldKdebugSharedCacheDescription::consumeTracepointB(uint64_t a1, uint64_t a2)
{
  return DyldKdebugFilesystemInfo::setFsobjId(a1 + 40, *(void *)(a2 + 8));
}

uint64_t DyldKdebugSharedCacheDescription::consumeTracepoint32B(uint64_t a1, void *a2)
{
  uint64_t v3 = a2[2];
  *(void *)(a1 + 16) = a2[1];
  uint64_t v4 = a1 + 40;
  DyldKdebugFilesystemInfo::setFsid((void *)(a1 + 40), v3 | (a2[3] << 32));
  uint64_t v5 = a2[4];

  return DyldKdebugFilesystemInfo::setFsobjId(v4, v5);
}

uint64_t DyldKdebugSharedCacheDescription::consumeTracepoint32C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)(a1 + 40);
  uint64_t v5 = DyldKdebugFilesystemInfo::fsobjId((DyldKdebugFilesystemInfo *)(a1 + 40));
  DyldKdebugFilesystemInfo::setFsid(v4, v5 | (*(void *)(a2 + 8) << 32));
  uint64_t result = SharedCacheDescription::baseAddressForSharedCacheWithUUID((SharedCacheDescription *)a1, *(uint8_t **)a1, *(uint8_t **)(a1 + 8));
  *(void *)(a1 + 24) = result;
  *(unsigned char *)(a1 + 32) = v7;
  return result;
}

uint64_t DyldKdebugSharedCacheDescription::fsInfo(DyldKdebugSharedCacheDescription *this)
{
  return (uint64_t)this + 40;
}

void *DyldKdebugLibraryDescription::consumeTracepointA(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 8);
  LibraryDescription::setLocation((void *)a1, *(void *)(a2 + 24));
  uint64_t v4 = *(void *)(a2 + 32);

  return DyldKdebugFilesystemInfo::setFsid((void *)(a1 + 48), v4);
}

int32x4_t DyldKdebugLibraryDescription::consumeTracepoint32A(int32x4_t *a1, uint64_t a2)
{
  int32x4_t result = vuzp1q_s32(*(int32x4_t *)(a2 + 8), *(int32x4_t *)(a2 + 24));
  a1[1] = result;
  return result;
}

uint64_t DyldKdebugLibraryDescription::consumeTracepointB(uint64_t a1, uint64_t a2)
{
  return DyldKdebugFilesystemInfo::setFsobjId(a1 + 48, *(void *)(a2 + 8));
}

uint64_t DyldKdebugLibraryDescription::consumeTracepoint32B(void *a1, uint64_t *a2)
{
  LibraryDescription::setLocation(a1, a2[1]);
  uint64_t v4 = a1 + 6;
  DyldKdebugFilesystemInfo::setFsid(v4, a2[2] | (a2[3] << 32));
  uint64_t v5 = a2[4];

  return DyldKdebugFilesystemInfo::setFsobjId((uint64_t)v4, v5);
}

uint64_t DyldKdebugLibraryDescription::consumeTracepoint32C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + 48;
  uint64_t v3 = DyldKdebugFilesystemInfo::fsobjId((DyldKdebugFilesystemInfo *)(a1 + 48)) | (*(void *)(a2 + 8) << 32);

  return DyldKdebugFilesystemInfo::setFsobjId(v2, v3);
}

uint64_t DyldKdebugLibraryDescription::fsInfo(DyldKdebugLibraryDescription *this)
{
  return (uint64_t)this + 48;
}

uint64_t Symbol::asmName@<X0>(uint64_t this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *(void *)(this + 40);
  if (v2)
  {
    *(_OWORD *)a2 = *(_OWORD *)(this + 32);
    LOBYTE(v2) = 1;
  }
  else
  {
    *(unsigned char *)a2 = 0;
  }
  *(unsigned char *)(a2 + 16) = v2;
  return this;
}

uint64_t Symbol::name@<X0>(uint64_t this@<X0>, unsigned char *a2@<X8>)
{
  if (*(void *)(this + 24))
  {
    long long v2 = *(_OWORD *)(this + 16);
  }
  else
  {
    uint64_t v3 = *(void *)(this + 40);
    if (!v3)
    {
      *a2 = 0;
      goto LABEL_6;
    }
    long long v2 = *(_OWORD *)(this + 32);
  }
  *(_OWORD *)a2 = v2;
  LOBYTE(v3) = 1;
LABEL_6:
  a2[16] = v3;
  return this;
}

uint64_t Symbol::symbolFlags(Symbol *this)
{
  return *((void *)this + 8);
}

uint64_t Symbol::symbolSourceType(Symbol *this)
{
  return *((unsigned int *)this + 18);
}

uint64_t Symbol::symbolContents(Symbol *this)
{
  return *((void *)this + 6);
}

uint64_t Symbol::initializeWithCSSymbol(uint64_t *a1)
{
  *a1 = CSSymbolGetRange();
  a1[1] = v2;
  Mangleduint64_t Name = CSSymbolGetMangledName();
  if (MangledName) {
    uint64_t v4 = (const char *)MangledName;
  }
  else {
    uint64_t v4 = (const char *)&unk_2345D29A6;
  }
  size_t v5 = strlen(v4);
  a1[4] = (uint64_t)v4;
  a1[5] = v5;
  uint64_t Name = CSSymbolGetName();
  if (Name) {
    char v7 = (const char *)Name;
  }
  else {
    char v7 = (const char *)&unk_2345D29A6;
  }
  size_t v8 = strlen(v7);
  a1[2] = (uint64_t)v7;
  a1[3] = v8;
  a1[8] = CSSymbolGetFlags();
  CSSymbolForeachSourceInfo();
  return CSSymbolForeachInlineRangeAtDepth();
}

char *___ZN6Symbol22initializeWithCSSymbolE10_CSTypeRef_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  unint64_t v2 = *(void *)(v1 + 112);
  if (v2 >= *(void *)(v1 + 120))
  {
    int32x4_t result = std::vector<SourceInfo>::__emplace_back_slow_path<_CSTypeRef &>((void **)(v1 + 104));
  }
  else
  {
    SourceInfo::SourceInfo(*(_OWORD **)(v1 + 112));
    int32x4_t result = (char *)(v2 + 56);
    *(void *)(v1 + 112) = v2 + 56;
  }
  *(void *)(v1 + 112) = result;
  return result;
}

void sub_2345BCE94(_Unwind_Exception *a1)
{
  *(void *)(v2 + 112) = v1;
  _Unwind_Resume(a1);
}

uint64_t ___ZN6Symbol22initializeWithCSSymbolE10_CSTypeRef_block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a6)
  {
    char v6 = *(uint64_t **)(result + 32);
    unint64_t v7 = v6[11];
    if (v7 >= v6[12])
    {
      int32x4_t result = std::vector<InlineSymbol>::__emplace_back_slow_path<_CSTypeRef &,_CSTypeRef &>(v6 + 10);
    }
    else
    {
      InlineSymbol::InlineSymbol(v6[11], *(void *)(a4 + 16 * a6 - 16), *(void *)(a4 + 16 * a6 - 16 + 8), *(void *)(a5 + 16 * a6 - 16), *(void *)(a5 + 16 * a6 - 16 + 8));
      int32x4_t result = v7 + 160;
      v6[11] = v7 + 160;
    }
    v6[11] = result;
  }
  return result;
}

void sub_2345BCF18(_Unwind_Exception *a1)
{
  *(void *)(v2 + 88) = v1;
  _Unwind_Resume(a1);
}

uint64_t Symbol::debug(Symbol *this)
{
  printf("\tSymbol @ 0x%llx - 0x%llx: ", *(void *)this, *((void *)this + 1) + *(void *)this);
  if (*((void *)this + 3))
  {
    uint64_t v2 = (const char *)*((void *)this + 2);
    if (!*((void *)this + 5)) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (*((void *)this + 5))
  {
    uint64_t v2 = (const char *)*((void *)this + 4);
LABEL_6:
    uint64_t v3 = (const char *)*((void *)this + 4);
    printf("%s | ", v2);
    uint64_t v2 = v3;
LABEL_7:
    printf("%s | ", v2);
  }
  uint64_t result = putchar(10);
  size_t v5 = (SourceInfo *)*((void *)this + 13);
  char v6 = (SourceInfo *)*((void *)this + 14);
  while (v5 != v6)
  {
    uint64_t result = SourceInfo::debug(v5);
    size_t v5 = (SourceInfo *)((char *)v5 + 56);
  }
  size_t v8 = (InlineSymbol *)*((void *)this + 10);
  unint64_t v7 = (InlineSymbol *)*((void *)this + 11);
  while (v8 != v7)
  {
    uint64_t result = InlineSymbol::debug(v8);
    size_t v8 = (InlineSymbol *)((char *)v8 + 160);
  }
  return result;
}

uint64_t Symbol::Symbol(uint64_t a1)
{
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  Symbol::initializeWithCSSymbol((uint64_t *)a1);
  return a1;
}

void sub_2345BD044(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  uint64_t v4 = *(void **)(v2 + 104);
  if (v4)
  {
    *(void *)(v2 + 112) = v4;
    operator delete(v4);
  }
  std::vector<InlineSymbol>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

char *std::vector<SourceInfo>::__emplace_back_slow_path<_CSTypeRef &>(void **a1)
{
  uint64_t v2 = (char *)*a1;
  uint64_t v3 = 0x6DB6DB6DB6DB6DB7 * (((unsigned char *)a1[1] - (unsigned char *)*a1) >> 3);
  unint64_t v4 = v3 + 1;
  if ((unint64_t)(v3 + 1) > 0x492492492492492) {
    std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v5 = (uint64_t)(a1 + 2);
  unint64_t v6 = 0x6DB6DB6DB6DB6DB7 * (((unsigned char *)a1[2] - v2) >> 3);
  if (2 * v6 > v4) {
    unint64_t v4 = 2 * v6;
  }
  if (v6 >= 0x249249249249249) {
    unint64_t v7 = 0x492492492492492;
  }
  else {
    unint64_t v7 = v4;
  }
  if (v7)
  {
    size_t v8 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SourceInfo>>(v5, v7);
    uint64_t v10 = v9;
  }
  else
  {
    size_t v8 = 0;
    uint64_t v10 = 0;
  }
  long long v11 = SourceInfo::SourceInfo(&v8[56 * v3]);
  long long v12 = (char *)v11 + 56;
  uint64_t v14 = (char *)*a1;
  uint64_t v13 = (char *)a1[1];
  if (v13 != *a1)
  {
    do
    {
      long long v15 = *(_OWORD *)(v13 - 56);
      long long v16 = *(_OWORD *)(v13 - 40);
      long long v17 = *(_OWORD *)(v13 - 24);
      *((void *)v11 - 1) = *((void *)v13 - 1);
      *(_OWORD *)((char *)v11 - 24) = v17;
      *(_OWORD *)((char *)v11 - 40) = v16;
      *(_OWORD *)((char *)v11 - 56) = v15;
      long long v11 = (_OWORD *)((char *)v11 - 56);
      v13 -= 56;
    }
    while (v13 != v14);
    uint64_t v13 = (char *)*a1;
  }
  *a1 = v11;
  a1[1] = v12;
  a1[2] = &v8[56 * v10];
  if (v13) {
    operator delete(v13);
  }
  return v12;
}

void sub_2345BD1B0(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<SourceInfo>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x492492492492493) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(56 * a2);
}

void StackshotLibraryDescription::StackshotLibraryDescription(LibraryDescription *a1, uint64_t a2)
{
}

{
  LibraryDescription::LibraryDescription(a1, *(void *)a2, *(uint8_t **)(a2 + 8), *(void *)(a2 + 16));
}

void StackshotLibraryDescription::StackshotLibraryDescription(LibraryDescription *a1, unsigned int *a2)
{
}

{
  LibraryDescription::LibraryDescription(a1, *a2, *(uint8_t **)(a2 + 1), *(void *)(a2 + 3));
}

BOOL Stackshot::isValidPidAndUniquePidPair(Stackshot *this, int a2, uint64_t a3)
{
  return a2 >= 0 && a3 != -1;
}

kcdata_item_t Stackshot::consumeTaskContainer(Stackshot *this, kcdata_iter a2)
{
  kcdata_item_t item = a2.item;
  uint64_t v155 = *MEMORY[0x263EF8340];
  if (a2.item->type != 19 || a2.item[1].type != 2307) {
    return item;
  }
  uint64_t v3 = this;
  uint64_t v4 = 0;
  uint64_t flags = a2.item->flags;
  uint32_t v143 = -1;
  v140 = 0;
  v141 = 0;
  unint64_t v142 = 0;
  v127 = (char *)this + 200;
  uint64_t v128 = flags;
  v125 = (char *)this + 160;
  v132 = (char *)this + 40;
  __p = 0;
  v138 = 0;
  v130 = (char *)this + 120;
  v131 = (char *)this + 80;
  v129 = (char *)this + 384;
  unint64_t v139 = 0;
  v134 = (char *)this + 344;
  LOBYTE(v149) = 0;
  uint64_t v135 = -1;
  char v152 = 0;
  LOBYTE(v145) = 0;
  char v148 = 0;
  while (1)
  {
    unint64_t v6 = (kcdata_item_t)((char *)item + item->size);
    int type = v6[1].type;
    kcdata_item_t item = v6 + 1;
    int v7 = type;
    int v9 = (type & 0xFFFFFFF0) == 0x20 ? 17 : v7;
    if (v9 <= 2308) {
      break;
    }
    if (v9 != 2309)
    {
      if (v9 == 2312)
      {
        uint32_t size = item->size;
        if (size != 32 || (item->flags & 0x8F) != 0)
        {
          uint32_t v17 = item->flags & 0xF;
          BOOL v18 = size >= v17;
          unsigned int v19 = size - v17;
          if (!v18) {
            unsigned int v19 = 0;
          }
          if (v19 >= 0x20)
          {
            if (v152) {
              char v152 = 0;
            }
            StackshotSharedCacheDescription::StackshotSharedCacheDescription((StackshotSharedCacheDescription *)&v149, (dyld_uuid_info_64_v2 *)&item[1]);
            char v152 = 1;
            *(void *)uu = SharedCacheDescription::uuid(v20);
            uint64_t v154 = v21;
            p_uint64_t Address = uu;
            unint64_t v22 = std::__hash_table<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID&&>,std::tuple<>>((uint64_t)v125, uu, (uint64_t)&std::piecewise_construct, (_OWORD **)&p_Address)+ 4;
            uint64_t Address = SharedCacheDescription::loadAddress((SharedCacheDescription *)&v149);
            p_uint64_t Address = (unsigned __int8 *)&Address;
            unint64_t v23 = std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)v22, &Address, (uint64_t)&std::piecewise_construct, (void **)&p_Address);
            uint64_t v24 = v151;
            long long v25 = v150;
            *(_OWORD *)(v23 + 3) = v149;
            *(_OWORD *)(v23 + 5) = v25;
            v23[7] = v24;
          }
        }
      }
      else if (v9 == 2351)
      {
        if (v148) {
          char v148 = 0;
        }
        StackshotAOTSharedCacheDescription::StackshotAOTSharedCacheDescription((StackshotAOTSharedCacheDescription *)&v145, (dyld_aot_cache_uuid_info *)&item[1]);
        char v148 = 1;
        *(void *)uu = AOTSharedCacheDescription::aotUuid((AOTSharedCacheDescription *)&v145);
        uint64_t v154 = v10;
        p_uint64_t Address = uu;
        long long v11 = std::__hash_table<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID&&>,std::tuple<>>((uint64_t)v127, uu, (uint64_t)&std::piecewise_construct, (_OWORD **)&p_Address)+ 4;
        uint64_t Address = AOTSharedCacheDescription::x86LoadAddress((AOTSharedCacheDescription *)&v145);
        p_uint64_t Address = (unsigned __int8 *)&Address;
        long long v12 = std::__hash_table<std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)v11, &Address, (uint64_t)&std::piecewise_construct, (void **)&p_Address);
        long long v13 = v147;
        long long v14 = v146;
        *(_OWORD *)(v12 + 3) = v145;
        *(_OWORD *)(v12 + 5) = v14;
        *(_OWORD *)(v12 + 7) = v13;
      }
      goto LABEL_89;
    }
    uint32_t v143 = item[6].size;
    if ((v143 & 0x80000000) == 0)
    {
      uint64_t v135 = *(void *)&item[1].type;
      if (v135 != -1)
      {
        uint64_t v4 = item[1].flags;
        goto LABEL_89;
      }
    }
    uint64_t v4 = 0;
    uint32_t v143 = -1;
    uint64_t v135 = -1;
LABEL_153:
    if (v9 == -242132755) {
      goto LABEL_154;
    }
  }
  if (v9 == 17)
  {
    uint64_t v133 = v4;
    uint64_t v26 = item->flags;
    if (!item->flags) {
      goto LABEL_88;
    }
    uint64_t v27 = 0;
    kcdata_item_t v28 = item + 1;
    uint64_t flags_high = HIDWORD(item->flags);
    while (flags_high != 48)
    {
      if (flags_high == 57)
      {
        long long v32 = v138;
        if ((unint64_t)v138 >= v139)
        {
          uint64_t v35 = 0x6DB6DB6DB6DB6DB7 * ((v138 - (StackshotAotImageDescription *)__p) >> 3);
          unint64_t v36 = v35 + 1;
          if ((unint64_t)(v35 + 1) > 0x492492492492492) {
            std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
          }
          if (0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(v139 - (void)__p) >> 3) > v36) {
            unint64_t v36 = 0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(v139 - (void)__p) >> 3);
          }
          if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v139 - (void)__p) >> 3)) >= 0x249249249249249) {
            unint64_t v37 = 0x492492492492492;
          }
          else {
            unint64_t v37 = v36;
          }
          if (v37)
          {
            long long v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SourceInfo>>((uint64_t)&v139, v37);
            uint64_t v40 = v39;
          }
          else
          {
            long long v38 = 0;
            uint64_t v40 = 0;
          }
          StackshotAotImageDescription::StackshotAotImageDescription((StackshotAotImageDescription *)&v38[56 * v35], (user64_dyld_aot_info *)v28 + v27);
          v55 = (StackshotAotImageDescription *)__p;
          v54 = v138;
          v56 = v53;
          if (v138 != __p)
          {
            do
            {
              long long v57 = *(_OWORD *)((char *)v54 - 56);
              long long v58 = *(_OWORD *)((char *)v54 - 40);
              long long v59 = *(_OWORD *)((char *)v54 - 24);
              *((void *)v56 - 1) = *((void *)v54 - 1);
              *(_OWORD *)(v56 - 24) = v59;
              *(_OWORD *)(v56 - 40) = v58;
              *(_OWORD *)(v56 - 56) = v57;
              v56 -= 56;
              v54 = (StackshotAotImageDescription *)((char *)v54 - 56);
            }
            while (v54 != v55);
            v54 = v55;
          }
          std::string v33 = (StackshotAotImageDescription *)(v53 + 56);
          __p = v56;
          v138 = (StackshotAotImageDescription *)(v53 + 56);
          unint64_t v139 = (unint64_t)&v38[56 * v40];
          if (v54) {
            operator delete(v54);
          }
        }
        else
        {
          StackshotAotImageDescription::StackshotAotImageDescription(v138, (user64_dyld_aot_info *)v28 + v27);
          std::string v33 = (StackshotAotImageDescription *)((char *)v32 + 56);
        }
        v138 = v33;
        goto LABEL_86;
      }
      if (flags_high == 49)
      {
        long long v30 = v141;
        if ((unint64_t)v141 < v142)
        {
          StackshotLibraryDescription::StackshotLibraryDescription(v141, (uint64_t)v28 + 24 * v27);
          long long v31 = (LibraryDescription *)((char *)v30 + 48);
LABEL_85:
          v141 = v31;
          goto LABEL_86;
        }
        unint64_t v47 = 0xAAAAAAAAAAAAAAABLL * ((v141 - (LibraryDescription *)v140) >> 4);
        unint64_t v48 = v47 + 1;
        if (v47 + 1 > 0x555555555555555) {
          std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
        }
        if (0x5555555555555556 * ((uint64_t)(v142 - (void)v140) >> 4) > v48) {
          unint64_t v48 = 0x5555555555555556 * ((uint64_t)(v142 - (void)v140) >> 4);
        }
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v142 - (void)v140) >> 4) >= 0x2AAAAAAAAAAAAAALL) {
          unint64_t v49 = 0x555555555555555;
        }
        else {
          unint64_t v49 = v48;
        }
        if (v49)
        {
          long long v50 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Section>>((uint64_t)&v142, v49);
          uint64_t v52 = v51;
        }
        else
        {
          long long v50 = 0;
          uint64_t v52 = 0;
        }
        StackshotLibraryDescription::StackshotLibraryDescription((LibraryDescription *)&v50[48 * v47], (uint64_t)v28 + 24 * v27);
        v67 = (LibraryDescription *)v140;
        char v61 = v141;
        v63 = v60;
        if (v141 != v140)
        {
          do
          {
            long long v68 = *((_OWORD *)v61 - 3);
            long long v69 = *((_OWORD *)v61 - 1);
            *((_OWORD *)v63 - 2) = *((_OWORD *)v61 - 2);
            *((_OWORD *)v63 - 1) = v69;
            *((_OWORD *)v63 - 3) = v68;
            v63 -= 48;
            char v61 = (LibraryDescription *)((char *)v61 - 48);
          }
          while (v61 != v67);
          char v61 = v67;
        }
        v66 = &v50[48 * v52];
        goto LABEL_83;
      }
LABEL_86:
      if (++v27 == v26)
      {
        uint64_t v3 = this;
LABEL_88:
        uint64_t v4 = v133;
LABEL_89:
        if (v135 != -1 && (v143 & 0x80000000) == 0)
        {
          v71 = (LibraryDescription *)v140;
          v70 = v141;
          if (v140 != v141)
          {
            v72 = v141;
            while (1)
            {
              *(void *)uu = LibraryDescription::uuid(v71);
              uint64_t v154 = v73;
              if (uuid_is_null(uu)) {
                break;
              }
              v71 = (LibraryDescription *)((char *)v71 + 48);
              if (v71 == v70) {
                goto LABEL_102;
              }
            }
            if (v71 != v70)
            {
              v74 = (LibraryDescription *)((char *)v71 + 48);
              v72 = v71;
              while (v74 != v70)
              {
                *(void *)uu = LibraryDescription::uuid(v74);
                uint64_t v154 = v75;
                if (!uuid_is_null(uu))
                {
                  long long v76 = *(_OWORD *)v74;
                  long long v77 = *((_OWORD *)v74 + 2);
                  *((_OWORD *)v72 + 1) = *((_OWORD *)v74 + 1);
                  *((_OWORD *)v72 + 2) = v77;
                  *(_OWORD *)v72 = v76;
                  v72 = (LibraryDescription *)((char *)v72 + 48);
                }
                v74 = (LibraryDescription *)((char *)v74 + 48);
              }
            }
LABEL_102:
            if (v72 != v141) {
              v141 = v72;
            }
            std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::__emplace_unique_key_args<int,int &,std::vector<StackshotLibraryDescription>>((uint64_t)v3, (int *)&v143, &v143, (uint64_t)&v140);
            v141 = (LibraryDescription *)v140;
          }
          if (__p != v138)
          {
            std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::__emplace_unique_key_args<int,int &,std::vector<StackshotLibraryDescription>>((uint64_t)v132, (int *)&v143, &v143, (uint64_t)&__p);
            v138 = (StackshotAotImageDescription *)__p;
          }
          if ((v4 & 0x80000000) != 0 && v152)
          {
            *(void *)uu = &v143;
            v78 = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t)v131, (int *)&v143, (uint64_t)&std::piecewise_construct, (_DWORD **)uu);
            if (!v152) {
              std::__throw_bad_optional_access[abi:ne180100]();
            }
            v79 = v78;
            unint64_t v82 = v78[5];
            uint64_t v80 = (uint64_t)(v78 + 5);
            unint64_t v81 = v82;
            unint64_t v83 = *(void *)(v80 - 8);
            if (v83 >= v82)
            {
              uint64_t v87 = v79[3];
              unint64_t v88 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v83 - v87) >> 3);
              unint64_t v89 = v88 + 1;
              if (v88 + 1 > 0x666666666666666) {
                std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
              }
              unint64_t v90 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v81 - v87) >> 3);
              if (2 * v90 > v89) {
                unint64_t v89 = 2 * v90;
              }
              if (v90 >= 0x333333333333333) {
                unint64_t v91 = 0x666666666666666;
              }
              else {
                unint64_t v91 = v89;
              }
              if (v91) {
                v92 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_CSBinaryRelocationInformation>>(v80, v91);
              }
              else {
                v92 = 0;
              }
              v93 = &v92[40 * v88];
              long long v94 = v149;
              long long v95 = v150;
              *((void *)v93 + 4) = v151;
              *(_OWORD *)v93 = v94;
              *((_OWORD *)v93 + 1) = v95;
              v97 = (char *)v79[3];
              v96 = (char *)v79[4];
              v98 = v93;
              if (v96 != v97)
              {
                do
                {
                  long long v99 = *(_OWORD *)(v96 - 40);
                  long long v100 = *(_OWORD *)(v96 - 24);
                  *((void *)v98 - 1) = *((void *)v96 - 1);
                  *(_OWORD *)(v98 - 24) = v100;
                  *(_OWORD *)(v98 - 40) = v99;
                  v98 -= 40;
                  v96 -= 40;
                }
                while (v96 != v97);
                v96 = (char *)v79[3];
              }
              v86 = v93 + 40;
              v79[3] = v98;
              v79[4] = v93 + 40;
              v79[5] = &v92[40 * v91];
              if (v96) {
                operator delete(v96);
              }
            }
            else
            {
              long long v84 = v149;
              long long v85 = v150;
              *(void *)(v83 + 32) = v151;
              *(_OWORD *)unint64_t v83 = v84;
              *(_OWORD *)(v83 + 16) = v85;
              v86 = (char *)(v83 + 40);
            }
            v79[4] = v86;
            if (v152) {
              char v152 = 0;
            }
          }
          if ((v4 & 0x10000000) != 0 && v148)
          {
            *(void *)uu = &v143;
            v101 = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t)v130, (int *)&v143, (uint64_t)&std::piecewise_construct, (_DWORD **)uu);
            if (!v148) {
              std::__throw_bad_optional_access[abi:ne180100]();
            }
            v102 = v101;
            unint64_t v105 = v101[5];
            uint64_t v103 = (uint64_t)(v101 + 5);
            unint64_t v104 = v105;
            v106 = *(_OWORD **)(v103 - 8);
            if ((unint64_t)v106 >= v105)
            {
              uint64_t v110 = v102[3];
              unint64_t v111 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v106 - v110) >> 4);
              unint64_t v112 = v111 + 1;
              if (v111 + 1 > 0x555555555555555) {
                std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
              }
              unint64_t v113 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v104 - v110) >> 4);
              if (2 * v113 > v112) {
                unint64_t v112 = 2 * v113;
              }
              if (v113 >= 0x2AAAAAAAAAAAAAALL) {
                unint64_t v114 = 0x555555555555555;
              }
              else {
                unint64_t v114 = v112;
              }
              if (v114) {
                v115 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Section>>(v103, v114);
              }
              else {
                v115 = 0;
              }
              v116 = &v115[48 * v111];
              long long v117 = v145;
              long long v118 = v147;
              *((_OWORD *)v116 + 1) = v146;
              *((_OWORD *)v116 + 2) = v118;
              *(_OWORD *)v116 = v117;
              v120 = (char *)v102[3];
              v119 = (char *)v102[4];
              v121 = v116;
              if (v119 != v120)
              {
                do
                {
                  long long v122 = *((_OWORD *)v119 - 3);
                  long long v123 = *((_OWORD *)v119 - 1);
                  *((_OWORD *)v121 - 2) = *((_OWORD *)v119 - 2);
                  *((_OWORD *)v121 - 1) = v123;
                  *((_OWORD *)v121 - 3) = v122;
                  v121 -= 48;
                  v119 -= 48;
                }
                while (v119 != v120);
                v119 = (char *)v102[3];
              }
              v109 = v116 + 48;
              v102[3] = v121;
              v102[4] = v116 + 48;
              v102[5] = &v115[48 * v114];
              if (v119) {
                operator delete(v119);
              }
            }
            else
            {
              long long v107 = v145;
              long long v108 = v147;
              v106[1] = v146;
              v106[2] = v108;
              _OWORD *v106 = v107;
              v109 = v106 + 3;
            }
            v102[4] = v109;
            if (v148) {
              char v148 = 0;
            }
          }
          if ((v4 & 0x40000000) != 0) {
            std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>((uint64_t)v129, (int *)&v143, &v143);
          }
          std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>((uint64_t)v134, (int *)&v143, &v143);
        }
        goto LABEL_153;
      }
    }
    long long v34 = v141;
    if ((unint64_t)v141 < v142)
    {
      StackshotLibraryDescription::StackshotLibraryDescription(v141, &v28->type + 5 * v27);
      long long v31 = (LibraryDescription *)((char *)v34 + 48);
      goto LABEL_85;
    }
    unint64_t v41 = 0xAAAAAAAAAAAAAAABLL * ((v141 - (LibraryDescription *)v140) >> 4);
    unint64_t v42 = v41 + 1;
    if (v41 + 1 > 0x555555555555555) {
      std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
    }
    if (0x5555555555555556 * ((uint64_t)(v142 - (void)v140) >> 4) > v42) {
      unint64_t v42 = 0x5555555555555556 * ((uint64_t)(v142 - (void)v140) >> 4);
    }
    if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v142 - (void)v140) >> 4) >= 0x2AAAAAAAAAAAAAALL) {
      unint64_t v43 = 0x555555555555555;
    }
    else {
      unint64_t v43 = v42;
    }
    if (v43)
    {
      unint64_t v44 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Section>>((uint64_t)&v142, v43);
      uint64_t v46 = v45;
    }
    else
    {
      unint64_t v44 = 0;
      uint64_t v46 = 0;
    }
    StackshotLibraryDescription::StackshotLibraryDescription((LibraryDescription *)&v44[48 * v41], &v28->type + 5 * v27);
    uint64_t v62 = (LibraryDescription *)v140;
    char v61 = v141;
    v63 = v60;
    if (v141 != v140)
    {
      do
      {
        long long v64 = *((_OWORD *)v61 - 3);
        long long v65 = *((_OWORD *)v61 - 1);
        *((_OWORD *)v63 - 2) = *((_OWORD *)v61 - 2);
        *((_OWORD *)v63 - 1) = v65;
        *((_OWORD *)v63 - 3) = v64;
        v63 -= 48;
        char v61 = (LibraryDescription *)((char *)v61 - 48);
      }
      while (v61 != v62);
      char v61 = v62;
    }
    v66 = &v44[48 * v46];
LABEL_83:
    long long v31 = (LibraryDescription *)(v60 + 48);
    v140 = v63;
    v141 = (LibraryDescription *)(v60 + 48);
    unint64_t v142 = (unint64_t)v66;
    if (v61) {
      operator delete(v61);
    }
    goto LABEL_85;
  }
  if (v9 != 20 || item->flags != v128) {
    goto LABEL_89;
  }
LABEL_154:
  if (__p)
  {
    v138 = (StackshotAotImageDescription *)__p;
    operator delete(__p);
  }
  if (v140)
  {
    v141 = (LibraryDescription *)v140;
    operator delete(v140);
  }
  return item;
}

void sub_2345BDD74(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,uint64_t a26,void *a27,uint64_t a28)
{
  if (__p) {
    operator delete(__p);
  }
  if (a27) {
    operator delete(a27);
  }
  _Unwind_Resume(exception_object);
}

uint64_t Stackshot::allPids(Stackshot *this)
{
  return (uint64_t)this + 344;
}

void Stackshot::consumeStackshot(Stackshot *this)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  kcdata_item_t v2 = (kcdata_item_t)*((void *)this + 30);
  uint64_t v3 = (void *)*((void *)this + 31);
  uint64_t v4 = (_OWORD *)((char *)this + 296);
  unint64_t v48 = (char *)this + 160;
  unint64_t v49 = (char *)this + 200;
  uint64_t v5 = (char *)this + 256;
  do
  {
    unint64_t v6 = (kcdata_item_t)((char *)v2 + v2->size);
    uint32_t type = v6[1].type;
    kcdata_item_t v2 = v6 + 1;
    int v7 = type;
    if ((type & 0xFFFFFFF0) == 0x20) {
      int v9 = 17;
    }
    else {
      int v9 = v7;
    }
    if (v9 == 2351)
    {
      StackshotAOTSharedCacheDescription::StackshotAOTSharedCacheDescription((StackshotAOTSharedCacheDescription *)&v52, (dyld_aot_cache_uuid_info *)&v2[1]);
      uint64_t v55 = AOTSharedCacheDescription::aotUuid((AOTSharedCacheDescription *)&v52);
      uint64_t v56 = v18;
      p_uint64_t Address = &v55;
      unsigned int v19 = std::__hash_table<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID&&>,std::tuple<>>((uint64_t)v49, &v55, (uint64_t)&std::piecewise_construct, (_OWORD **)&p_Address)+ 4;
      uint64_t Address = AOTSharedCacheDescription::aotLoadAddress((AOTSharedCacheDescription *)&v52);
      p_uint64_t Address = &Address;
      unint64_t v20 = std::__hash_table<std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)v19, &Address, (uint64_t)&std::piecewise_construct, &p_Address);
      long long v21 = v54;
      long long v22 = v53;
      long long v23 = v52;
      *(_OWORD *)(v20 + 3) = v52;
      *(_OWORD *)(v20 + 5) = v22;
      *(_OWORD *)(v20 + 7) = v21;
      long long v24 = v53;
      long long v25 = v54;
      *uint64_t v4 = v23;
      v4[1] = v24;
      v4[2] = v25;
    }
    else if (v9 == 2312)
    {
      StackshotSharedCacheDescription::StackshotSharedCacheDescription((StackshotSharedCacheDescription *)&v52, (dyld_uuid_info_64_v2 *)&v2[1]);
      uint64_t v55 = SharedCacheDescription::uuid((SharedCacheDescription *)&v52);
      uint64_t v56 = v11;
      p_uint64_t Address = &v55;
      long long v12 = std::__hash_table<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID&&>,std::tuple<>>((uint64_t)v48, &v55, (uint64_t)&std::piecewise_construct, (_OWORD **)&p_Address)+ 4;
      uint64_t Address = SharedCacheDescription::loadAddress((SharedCacheDescription *)&v52);
      p_uint64_t Address = &Address;
      long long v13 = std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)v12, &Address, (uint64_t)&std::piecewise_construct, &p_Address);
      uint64_t v14 = v54;
      long long v15 = v53;
      long long v16 = v52;
      *(_OWORD *)(v13 + 3) = v52;
      *(_OWORD *)(v13 + 5) = v15;
      v13[7] = v14;
      long long v17 = v53;
      *(_OWORD *)uint64_t v5 = v16;
      *((_OWORD *)v5 + 1) = v17;
      *((void *)v5 + 4) = v54;
    }
    else if (v9 == 19 && v2[1].type == 2307)
    {
      v58.kcdata_item_t item = v2;
      v58.end = v3;
      kcdata_item_t v2 = Stackshot::consumeTaskContainer(this, v58);
      uint64_t v3 = v10;
    }
  }
  while (v9 != -242132755);
  uint64_t v26 = (uint64_t *)*((void *)this + 50);
  if (v26)
  {
    uint64_t v27 = (char *)this + 80;
    do
    {
      LODWORD(v55) = *((_DWORD *)v26 + 4);
      *(void *)&long long v52 = &v55;
      kcdata_item_t v28 = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t)v27, (int *)&v55, (uint64_t)&std::piecewise_construct, (_DWORD **)&v52);
      unint64_t v29 = v28[4];
      unint64_t v30 = v28[5];
      if (v29 >= v30)
      {
        uint64_t v34 = v28[3];
        unint64_t v35 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v29 - v34) >> 3);
        unint64_t v36 = v35 + 1;
        if (v35 + 1 > 0x666666666666666) {
          std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v37 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v30 - v34) >> 3);
        if (2 * v37 > v36) {
          unint64_t v36 = 2 * v37;
        }
        if (v37 >= 0x333333333333333) {
          unint64_t v38 = 0x666666666666666;
        }
        else {
          unint64_t v38 = v36;
        }
        if (v38) {
          uint64_t v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_CSBinaryRelocationInformation>>((uint64_t)(v28 + 5), v38);
        }
        else {
          uint64_t v39 = 0;
        }
        uint64_t v40 = &v39[40 * v35];
        long long v41 = *(_OWORD *)v5;
        long long v42 = *((_OWORD *)v5 + 1);
        *((void *)v40 + 4) = *((void *)v5 + 4);
        *(_OWORD *)uint64_t v40 = v41;
        *((_OWORD *)v40 + 1) = v42;
        unint64_t v44 = (char *)v28[3];
        unint64_t v43 = (char *)v28[4];
        uint64_t v45 = v40;
        if (v43 != v44)
        {
          do
          {
            long long v46 = *(_OWORD *)(v43 - 40);
            long long v47 = *(_OWORD *)(v43 - 24);
            *((void *)v45 - 1) = *((void *)v43 - 1);
            *(_OWORD *)(v45 - 24) = v47;
            *(_OWORD *)(v45 - 40) = v46;
            v45 -= 40;
            v43 -= 40;
          }
          while (v43 != v44);
          unint64_t v43 = (char *)v28[3];
        }
        std::string v33 = v40 + 40;
        v28[3] = v45;
        v28[4] = v40 + 40;
        v28[5] = &v39[40 * v38];
        if (v43) {
          operator delete(v43);
        }
      }
      else
      {
        long long v31 = *(_OWORD *)v5;
        long long v32 = *((_OWORD *)v5 + 1);
        *(void *)(v29 + 32) = *((void *)v5 + 4);
        *(_OWORD *)unint64_t v29 = v31;
        *(_OWORD *)(v29 + 16) = v32;
        std::string v33 = (char *)(v29 + 40);
      }
      v28[4] = v33;
      uint64_t v26 = (uint64_t *)*v26;
    }
    while (v26);
  }
}

uint64_t *Stackshot::libraryDescriptionsForPid@<X0>(Stackshot *this@<X0>, int a2@<W1>, void *a3@<X8>)
{
  int v5 = a2;
  uint64_t result = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::find<int>(this, &v5);
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  if (result) {
    return std::vector<StackshotLibraryDescription>::__init_with_size[abi:ne180100]<StackshotLibraryDescription*,StackshotLibraryDescription*>(a3, (const void *)result[3], result[4], 0xAAAAAAAAAAAAAAABLL * ((result[4] - result[3]) >> 4));
  }
  return result;
}

uint64_t *Stackshot::aotImageDescriptionsForPid@<X0>(Stackshot *this@<X0>, int a2@<W1>, void *a3@<X8>)
{
  int v5 = a2;
  uint64_t result = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::find<int>((void *)this + 5, &v5);
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  if (result) {
    return std::vector<StackshotAotImageDescription>::__init_with_size[abi:ne180100]<StackshotAotImageDescription*,StackshotAotImageDescription*>(a3, (const void *)result[3], result[4], 0x6DB6DB6DB6DB6DB7 * ((result[4] - result[3]) >> 3));
  }
  return result;
}

uint64_t *Stackshot::sharedCacheDescriptionsForPid@<X0>(Stackshot *this@<X0>, int a2@<W1>, void *a3@<X8>)
{
  int v5 = a2;
  uint64_t result = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::find<int>((void *)this + 10, &v5);
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  if (result) {
    return std::vector<StackshotSharedCacheDescription>::__init_with_size[abi:ne180100]<StackshotSharedCacheDescription*,StackshotSharedCacheDescription*>(a3, (const void *)result[3], result[4], 0xCCCCCCCCCCCCCCCDLL * ((result[4] - result[3]) >> 3));
  }
  return result;
}

uint64_t *Stackshot::aotSharedCacheDescriptionsForPid@<X0>(Stackshot *this@<X0>, int a2@<W1>, void *a3@<X8>)
{
  int v5 = a2;
  uint64_t result = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::find<int>((void *)this + 15, &v5);
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  if (result) {
    return std::vector<StackshotAOTSharedCacheDescription>::__init_with_size[abi:ne180100]<StackshotAOTSharedCacheDescription*,StackshotAOTSharedCacheDescription*>(a3, (const void *)result[3], result[4], 0xAAAAAAAAAAAAAAABLL * ((result[4] - result[3]) >> 4));
  }
  return result;
}

uint64_t Stackshot::allSharedCacheDescriptions(Stackshot *this)
{
  return (uint64_t)this + 160;
}

uint64_t Stackshot::allAOTSharedCacheDescriptions(Stackshot *this)
{
  return (uint64_t)this + 200;
}

__n128 Stackshot::defaultAOTSharedCacheDescription@<Q0>(Stackshot *this@<X0>, uint64_t a2@<X8>)
{
  long long v2 = *(_OWORD *)((char *)this + 312);
  *(_OWORD *)a2 = *(_OWORD *)((char *)this + 296);
  *(_OWORD *)(a2 + 16) = v2;
  __n128 result = *(__n128 *)((char *)this + 328);
  *(__n128 *)(a2 + 32) = result;
  return result;
}

__n128 Stackshot::defaultSharedCacheDescription@<Q0>(__n128 *this@<X0>, __n128 *a2@<X8>)
{
  __n128 result = this[16];
  __n128 v3 = this[17];
  *a2 = result;
  a2[1] = v3;
  a2[2].n128_u64[0] = this[18].n128_u64[0];
  return result;
}

void Stackshot::Stackshot(Stackshot *this, kcdata_iter a2)
{
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_DWORD *)this + 8) = 1065353216;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *((_DWORD *)this + 18) = 1065353216;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_DWORD *)this + 28) = 1065353216;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *((_DWORD *)this + 38) = 1065353216;
  *((_OWORD *)this + 10) = 0u;
  *((_OWORD *)this + 11) = 0u;
  *(_OWORD *)((char *)this + 200) = 0u;
  *((_DWORD *)this + 48) = 1065353216;
  *(_OWORD *)((char *)this + 216) = 0u;
  *((_DWORD *)this + 58) = 1065353216;
  *((kcdata_iter *)this + 15) = a2;
  SharedCacheDescription::SharedCacheDescription((Stackshot *)((char *)this + 256));
  AOTSharedCacheDescription::AOTSharedCacheDescription((Stackshot *)((char *)this + 296));
  *(_OWORD *)((char *)this + 344) = 0u;
  *(_OWORD *)((char *)this + 360) = 0u;
  *((_DWORD *)this + 94) = 1065353216;
  *((_OWORD *)this + 24) = 0u;
  *((_OWORD *)this + 25) = 0u;
  *((_DWORD *)this + 104) = 1065353216;
}

void sub_2345BE49C(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>>>::~__hash_table(v6);
  std::__hash_table<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>>>::~__hash_table(v5);
  std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::~__hash_table(v4);
  std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::~__hash_table(v3);
  std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::~__hash_table(v2);
  std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

void *std::vector<StackshotLibraryDescription>::__init_with_size[abi:ne180100]<StackshotLibraryDescription*,StackshotLibraryDescription*>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    __n128 result = std::vector<StackshotLibraryDescription>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      __n128 result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_2345BE53C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<StackshotLibraryDescription>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556) {
    std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
  }
  __n128 result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Section>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[48 * v4];
  return result;
}

void *std::vector<StackshotAotImageDescription>::__init_with_size[abi:ne180100]<StackshotAotImageDescription*,StackshotAotImageDescription*>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    __n128 result = std::vector<StackshotAotImageDescription>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      __n128 result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_2345BE60C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<StackshotAotImageDescription>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0x492492492492493) {
    std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
  }
  __n128 result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SourceInfo>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[56 * v4];
  return result;
}

void *std::vector<StackshotSharedCacheDescription>::__init_with_size[abi:ne180100]<StackshotSharedCacheDescription*,StackshotSharedCacheDescription*>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    __n128 result = std::vector<StackshotSharedCacheDescription>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      __n128 result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_2345BE6E0(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<StackshotSharedCacheDescription>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667) {
    std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
  }
  __n128 result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_CSBinaryRelocationInformation>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[40 * v4];
  return result;
}

void *std::vector<StackshotAOTSharedCacheDescription>::__init_with_size[abi:ne180100]<StackshotAOTSharedCacheDescription*,StackshotAOTSharedCacheDescription*>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    __n128 result = std::vector<StackshotLibraryDescription>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      __n128 result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_2345BE7B0(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *std::__hash_table<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID&&>,std::tuple<>>(uint64_t a1, void *a2, uint64_t a3, _OWORD **a4)
{
  unint64_t v7 = a2[1] ^ *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = a2[1] ^ *a2;
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
    uint64_t v10 = *(void **)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      uint64_t v11 = (void *)*v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (v11[2] == *a2 && v11[3] == a2[1]) {
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
          uint64_t v11 = (void *)*v11;
        }
        while (v11);
      }
    }
  }
  uint64_t v14 = a1 + 16;
  long long v15 = operator new(0x48uLL);
  v25[0] = v15;
  v25[1] = a1 + 16;
  *long long v15 = 0;
  v15[1] = v7;
  *((_OWORD *)v15 + 1) = **a4;
  *((_OWORD *)v15 + 2) = 0u;
  *((_OWORD *)v15 + 3) = 0u;
  *((_DWORD *)v15 + 16) = 1065353216;
  char v26 = 1;
  float v16 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v17 = *(float *)(a1 + 32);
  if (!v8 || (float)(v17 * (float)v8) < v16)
  {
    BOOL v18 = 1;
    if (v8 >= 3) {
      BOOL v18 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v19 = v18 | (2 * v8);
    unint64_t v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20) {
      size_t v21 = v20;
    }
    else {
      size_t v21 = v19;
    }
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v21);
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
  long long v22 = *(void **)(*(void *)a1 + 8 * v4);
  if (v22)
  {
    *(void *)v25[0] = *v22;
    void *v22 = v25[0];
  }
  else
  {
    *(void *)v25[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v25[0];
    *(void *)(*(void *)a1 + 8 * v4) = v14;
    if (*(void *)v25[0])
    {
      unint64_t v23 = *(void *)(*(void *)v25[0] + 8);
      if ((v8 & (v8 - 1)) != 0)
      {
        if (v23 >= v8) {
          v23 %= v8;
        }
      }
      else
      {
        v23 &= v8 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v23) = v25[0];
    }
  }
  uint64_t v11 = (void *)v25[0];
  v25[0] = 0;
  ++*(void *)(a1 + 24);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,void *>>>>::reset[abi:ne180100]((uint64_t)v25, 0);
  return v11;
}

void sub_2345BEA2C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table((uint64_t)v2 + 32);
    }
    operator delete(v2);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      uint64_t v3 = (void *)*v2;
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

void *std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>(uint64_t a1, uint64_t *a2, uint64_t a3, void **a4)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v6 >= v7) {
        unint64_t v4 = v6 % v7;
      }
    }
    else
    {
      unint64_t v4 = (v7 - 1) & v6;
    }
    uint8x8_t v9 = *(void **)(*(void *)a1 + 8 * v4);
    if (v9)
    {
      __n128 result = (void *)*v9;
      if (*v9)
      {
        do
        {
          unint64_t v11 = result[1];
          if (v11 == v6)
          {
            if (result[2] == v6) {
              return result;
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
            if (v11 != v4) {
              break;
            }
          }
          __n128 result = (void *)*result;
        }
        while (result);
      }
    }
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>(a1, *a2, a4, (uint64_t)&v20);
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
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7) {
        unint64_t v4 = v6 % v7;
      }
      else {
        unint64_t v4 = v6;
      }
    }
    else
    {
      unint64_t v4 = (v7 - 1) & v6;
    }
  }
  BOOL v18 = *(void **)(*(void *)a1 + 8 * v4);
  if (v18)
  {
    *unint64_t v20 = *v18;
    *BOOL v18 = v20;
  }
  else
  {
    *unint64_t v20 = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v20;
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*v20)
    {
      unint64_t v19 = *(void *)(*v20 + 8);
      if ((v7 & (v7 - 1)) != 0)
      {
        if (v19 >= v7) {
          v19 %= v7;
        }
      }
      else
      {
        v19 &= v7 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v19) = v20;
    }
  }
  __n128 result = v20;
  ++*(void *)(a1 + 24);
  return result;
}

void sub_2345BECFC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>(uint64_t a1@<X0>, uint64_t a2@<X1>, void **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  uint8x8_t v8 = (char *)operator new(0x40uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  *(void *)uint8x8_t v8 = 0;
  *((void *)v8 + 1) = a2;
  *((void *)v8 + 2) = **a3;
  *((void *)v8 + 7) = 0;
  *(_OWORD *)(v8 + 40) = 0u;
  *(_OWORD *)(v8 + 24) = 0u;
  SharedCacheDescription::SharedCacheDescription((SharedCacheDescription *)(v8 + 24));
  *(unsigned char *)(a4 + 16) = 1;
}

void sub_2345BED94(_Unwind_Exception *a1)
{
  void *v1 = 0;
  operator delete(v2);
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>(uint64_t a1, uint64_t *a2, uint64_t a3, void **a4)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v6 >= v7) {
        unint64_t v4 = v6 % v7;
      }
    }
    else
    {
      unint64_t v4 = (v7 - 1) & v6;
    }
    uint8x8_t v9 = *(void **)(*(void *)a1 + 8 * v4);
    if (v9)
    {
      __n128 result = (void *)*v9;
      if (*v9)
      {
        do
        {
          unint64_t v11 = result[1];
          if (v11 == v6)
          {
            if (result[2] == v6) {
              return result;
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
            if (v11 != v4) {
              break;
            }
          }
          __n128 result = (void *)*result;
        }
        while (result);
      }
    }
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>(a1, *a2, a4, (uint64_t)&v20);
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
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7) {
        unint64_t v4 = v6 % v7;
      }
      else {
        unint64_t v4 = v6;
      }
    }
    else
    {
      unint64_t v4 = (v7 - 1) & v6;
    }
  }
  BOOL v18 = *(void **)(*(void *)a1 + 8 * v4);
  if (v18)
  {
    *unint64_t v20 = *v18;
    *BOOL v18 = v20;
  }
  else
  {
    *unint64_t v20 = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v20;
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*v20)
    {
      unint64_t v19 = *(void *)(*v20 + 8);
      if ((v7 & (v7 - 1)) != 0)
      {
        if (v19 >= v7) {
          v19 %= v7;
        }
      }
      else
      {
        v19 &= v7 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v19) = v20;
    }
  }
  __n128 result = v20;
  ++*(void *)(a1 + 24);
  return result;
}

void sub_2345BEFC0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>(uint64_t a1@<X0>, uint64_t a2@<X1>, void **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  uint8x8_t v8 = (char *)operator new(0x48uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  *(void *)uint8x8_t v8 = 0;
  *((void *)v8 + 1) = a2;
  *((void *)v8 + 2) = **a3;
  *(_OWORD *)(v8 + 56) = 0u;
  *(_OWORD *)(v8 + 40) = 0u;
  *(_OWORD *)(v8 + 24) = 0u;
  AOTSharedCacheDescription::AOTSharedCacheDescription((AOTSharedCacheDescription *)(v8 + 24));
  *(unsigned char *)(a4 + 16) = 1;
}

void sub_2345BF058(_Unwind_Exception *a1)
{
  void *v1 = 0;
  operator delete(v2);
  _Unwind_Resume(a1);
}

char *std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::__emplace_unique_key_args<int,int &,std::vector<StackshotLibraryDescription>>(uint64_t a1, int *a2, _DWORD *a3, uint64_t a4)
{
  unint64_t v8 = *a2;
  unint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v9 <= v8) {
        unint64_t v4 = v8 % v9;
      }
    }
    else
    {
      unint64_t v4 = (v9 - 1) & v8;
    }
    unint64_t v11 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v11)
    {
      float v12 = (char *)*v11;
      if (*v11)
      {
        do
        {
          unint64_t v13 = *((void *)v12 + 1);
          if (v13 == v8)
          {
            if (*((_DWORD *)v12 + 4) == v8) {
              return v12;
            }
          }
          else
          {
            if (v10.u32[0] > 1uLL)
            {
              if (v13 >= v9) {
                v13 %= v9;
              }
            }
            else
            {
              v13 &= v9 - 1;
            }
            if (v13 != v4) {
              break;
            }
          }
          float v12 = *(char **)v12;
        }
        while (v12);
      }
    }
  }
  BOOL v14 = (void *)(a1 + 16);
  float v12 = (char *)operator new(0x30uLL);
  *(void *)float v12 = 0;
  *((void *)v12 + 1) = v8;
  *((_DWORD *)v12 + 4) = *a3;
  *(_OWORD *)(v12 + 24) = *(_OWORD *)a4;
  *((void *)v12 + 5) = *(void *)(a4 + 16);
  *(void *)a4 = 0;
  *(void *)(a4 + 8) = 0;
  *(void *)(a4 + 16) = 0;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v16 = *(float *)(a1 + 32);
  if (!v9 || (float)(v16 * (float)v9) < v15)
  {
    BOOL v17 = 1;
    if (v9 >= 3) {
      BOOL v17 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v9);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v20);
    unint64_t v9 = *(void *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v9 <= v8) {
        unint64_t v4 = v8 % v9;
      }
      else {
        unint64_t v4 = v8;
      }
    }
    else
    {
      unint64_t v4 = (v9 - 1) & v8;
    }
  }
  uint64_t v21 = *(void *)a1;
  long long v22 = *(void **)(*(void *)a1 + 8 * v4);
  if (v22)
  {
    *(void *)float v12 = *v22;
LABEL_38:
    void *v22 = v12;
    goto LABEL_39;
  }
  *(void *)float v12 = *v14;
  *BOOL v14 = v12;
  *(void *)(v21 + 8 * v4) = v14;
  if (*(void *)v12)
  {
    unint64_t v23 = *(void *)(*(void *)v12 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v23 >= v9) {
        v23 %= v9;
      }
    }
    else
    {
      v23 &= v9 - 1;
    }
    long long v22 = (void *)(*(void *)a1 + 8 * v23);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v12;
}

void sub_2345BF2B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,void *>>>::operator()[abi:ne180100](v11, v10);
  _Unwind_Resume(a1);
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,void *>>>::operator()[abi:ne180100](uint64_t a1, void *__p)
{
  if (*(unsigned char *)(a1 + 8))
  {
    uint64_t v3 = (void *)__p[3];
    if (v3)
    {
      __p[4] = v3;
      operator delete(v3);
    }
  }
  else if (!__p)
  {
    return;
  }

  operator delete(__p);
}

void *std::__hash_table<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(uint64_t a1, int *a2, uint64_t a3, _DWORD **a4)
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
    uint8x8_t v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      uint64_t v11 = *v10;
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
          uint64_t v11 = (void *)*v11;
        }
        while (v11);
      }
    }
  }
  unint64_t v13 = (void *)(a1 + 16);
  uint64_t v11 = operator new(0x30uLL);
  *uint64_t v11 = 0;
  v11[1] = v7;
  *((_DWORD *)v11 + 4) = **a4;
  v11[4] = 0;
  v11[5] = 0;
  _OWORD v11[3] = 0;
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
      size_t v19 = v18;
    }
    else {
      size_t v19 = v17;
    }
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v19);
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
  uint64_t v20 = *(void *)a1;
  uint64_t v21 = *(void **)(*(void *)a1 + 8 * v4);
  if (v21)
  {
    *uint64_t v11 = *v21;
LABEL_38:
    *uint64_t v21 = v11;
    goto LABEL_39;
  }
  *uint64_t v11 = *v13;
  *unint64_t v13 = v11;
  *(void *)(v20 + 8 * v4) = v13;
  if (*v11)
  {
    unint64_t v22 = *(void *)(*v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v22 >= v8) {
        v22 %= v8;
      }
    }
    else
    {
      v22 &= v8 - 1;
    }
    uint64_t v21 = (void *)(*(void *)a1 + 8 * v22);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v11;
}

void sub_2345BF56C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,void *>>>::operator()[abi:ne180100](v11, v10);
  _Unwind_Resume(a1);
}

void *std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>(uint64_t a1, int *a2, _DWORD *a3)
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
    uint8x8_t v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      uint8x8_t v10 = *v9;
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
          uint8x8_t v10 = (void *)*v10;
        }
        while (v10);
      }
    }
  }
  uint8x8_t v10 = operator new(0x18uLL);
  *uint8x8_t v10 = 0;
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
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v17);
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
  size_t v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    *uint8x8_t v10 = *v19;
LABEL_38:
    *size_t v19 = v10;
    goto LABEL_39;
  }
  *uint8x8_t v10 = *(void *)(a1 + 16);
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
    size_t v19 = (void *)(*(void *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v10;
}

void sub_2345BF790(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t *std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::find<int>(void *a1, int *a2)
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
  unint64_t v6 = *(uint64_t ***)(*a1 + 8 * v5);
  if (!v6) {
    return 0;
  }
  for (__n128 result = *v6; result; __n128 result = (uint64_t *)*result)
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

uint64_t std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::__deallocate_node(a1, *(void **)(a1 + 16));
  int8x8_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::__deallocate_node(int a1, void *__p)
{
  if (__p)
  {
    int8x8_t v2 = __p;
    do
    {
      unint64_t v3 = (void *)*v2;
      uint8x8_t v4 = (void *)v2[3];
      if (v4)
      {
        v2[4] = v4;
        operator delete(v4);
      }
      operator delete(v2);
      int8x8_t v2 = v3;
    }
    while (v3);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>>>::__deallocate_node(a1, *(void **)(a1 + 16));
  int8x8_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>>>::__deallocate_node(uint64_t a1, void *a2)
{
  if (a2)
  {
    int8x8_t v2 = a2;
    do
    {
      unint64_t v3 = (void *)*v2;
      std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table((uint64_t)(v2 + 4));
      operator delete(v2);
      int8x8_t v2 = v3;
    }
    while (v3);
  }
}

uint64_t SymbolicationSession::processes(SymbolicationSession *this)
{
  return (uint64_t)this + 288;
}

uint64_t SymbolicationSession::updateConfig(uint64_t result, uint64_t a2)
{
  *(void *)(result + 13392) = a2;
  return result;
}

uint64_t SymbolicationSession::isConfiguredToSaveSymbols(SymbolicationSession *this)
{
  return *(unsigned __int8 *)(*((void *)this + 1674) + 24);
}

void *SymbolicationSession::learnPid(SymbolicationSession *this, int a2)
{
  int v3 = a2;
  return std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>((uint64_t)this + 352, &v3, &v3);
}

double SymbolicationSession::updateBestKnownLibraryDescriptions(SymbolicationSession *this, const LibraryDescription *a2)
{
  v8[2] = *MEMORY[0x263EF8340];
  v8[0] = LibraryDescription::uuid(a2);
  v8[1] = v4;
  unint64_t v7 = v8;
  unint64_t v5 = std::__hash_table<std::__hash_value_type<UUID,MergedLibrary>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,MergedLibrary>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,MergedLibrary>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,MergedLibrary>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID const&>,std::tuple<>>((uint64_t)this + 13400, v8, (uint64_t)&std::piecewise_construct, &v7);
  return MergedLibrary::mergeWith((MergedLibrary *)(v5 + 4), a2);
}

double SymbolicationSession::learnPidLibrary(SymbolicationSession *a1, int a2, LibraryDescription *this, uint64_t a4)
{
  std::__hash_table<LibraryDescription,std::hash<LibraryDescription>,std::equal_to<LibraryDescription>,std::allocator<LibraryDescription>>::__emplace_unique_key_args<LibraryDescription,LibraryDescription const&>(a4, this, this);

  return SymbolicationSession::updateBestKnownLibraryDescriptions(a1, this);
}

uint64_t *SymbolicationSession::learnAddressForPid(SymbolicationSession *this, int a2, unint64_t a3)
{
  int v5 = a2;
  __n128 result = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::find<int>((void *)this + 39, &v5);
  if (result)
  {
    __n128 result = (uint64_t *)result[3];
    if (result) {
      return (uint64_t *)Process::addAddress((Process *)result, a3);
    }
  }
  return result;
}

uint64_t *SymbolicationSession::processPointerForPid(SymbolicationSession *this, int a2)
{
  int v3 = a2;
  __n128 result = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::find<int>((void *)this + 39, &v3);
  if (result) {
    return (uint64_t *)result[3];
  }
  return result;
}

void SymbolicationSession::sharedCacheWithDescription(uint64_t a1@<X0>, SharedCacheDescription *a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = a1 + 16;
  unint64_t v6 = std::__hash_table<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::__unordered_map_hasher<SharedCacheDescription,std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::hash<SharedCacheDescription>,std::equal_to<SharedCacheDescription>,true>,std::__unordered_map_equal<SharedCacheDescription,std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::equal_to<SharedCacheDescription>,std::hash<SharedCacheDescription>,true>,std::allocator<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>>>::find<SharedCacheDescription>((void *)(a1 + 16), a2);
  if (v6)
  {
    uint64_t v8 = v6[7];
    uint64_t v7 = v6[8];
  }
  else
  {
    std::allocate_shared[abi:ne180100]<SharedCache,std::allocator<SharedCache>,SharedCacheDescription &,std::shared_ptr<StringPool> &,void>((uint64_t)a2, &v12);
    uint8x8_t v9 = std::__hash_table<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::__unordered_map_hasher<SharedCacheDescription,std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::hash<SharedCacheDescription>,std::equal_to<SharedCacheDescription>,true>,std::__unordered_map_equal<SharedCacheDescription,std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::equal_to<SharedCacheDescription>,std::hash<SharedCacheDescription>,true>,std::allocator<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>>>::__emplace_unique_key_args<SharedCacheDescription,SharedCacheDescription&,std::shared_ptr<SharedCache>>(v5, a2, (uint64_t)a2, (uint64_t)&v12);
    char v11 = v10;
    if (v13) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v13);
    }
    if (!v11)
    {
      *a3 = 0;
      a3[1] = 0;
      return;
    }
    SharedCache::symbolicator(*((SharedCache **)v9 + 7));
    CSSymbolicatorForeachSymbolOwnerAtTime();
    uint64_t v8 = *((void *)v9 + 7);
    uint64_t v7 = *((void *)v9 + 8);
  }
  *a3 = v8;
  a3[1] = v7;
  if (v7) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
  }
}

void sub_2345BFC1C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, std::__shared_weak_count *a15)
{
  if (a15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a15);
  }
  _Unwind_Resume(exception_object);
}

void ___ZN20SymbolicationSession26sharedCacheWithDescriptionE22SharedCacheDescription_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  SymbolicationSession::sharedLibraryWithCSSymbolOwner(*(void *)(a1 + 32), a2, a3, &v4);
  int v3 = v5;
  if (v5)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

void SymbolicationSession::sharedLibraryWithCSSymbolOwner(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v18[0] = a2;
  v18[1] = a3;
  CFUUIDBytes = (_OWORD *)CSSymbolOwnerGetCFUUIDBytes();
  if (!CFUUIDBytes)
  {
    *a4 = 0;
    a4[1] = 0;
    return;
  }
  *(_OWORD *)UUID v19 = *CFUUIDBytes;
  uint64_t v7 = std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::find<UUID>((void *)(a1 + 56), v19);
  if (v7)
  {
    uint64_t v9 = v7[4];
    uint64_t v8 = v7[5];
    goto LABEL_9;
  }
  std::allocate_shared[abi:ne180100]<SharedLibrary,std::allocator<SharedLibrary>,_CSTypeRef &,std::shared_ptr<StringPool> &,void>(v18, a1, __p);
  char v10 = std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::__emplace_unique_key_args<UUID,UUID&,std::shared_ptr<SharedLibrary>>(a1 + 56, v19, v19, (long long *)__p);
  char v12 = v11;
  if (__p[1]) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)__p[1]);
  }
  if (v12)
  {
    uint64_t v9 = v10[4];
    uint64_t v8 = v10[5];
LABEL_9:
    *a4 = v9;
    a4[1] = v8;
    if (v8) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
    }
    return;
  }
  UUID::uuidString((UUID *)v19, (uint64_t)__p);
  if (v15)
  {
    *(_OWORD *)unint64_t v16 = *(_OWORD *)__p;
    uint64_t v17 = v14;
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(v16, "<NULL_UUID>");
    if (v15 && SHIBYTE(v14) < 0) {
      operator delete(__p[0]);
    }
  }
  ats_symbolication_log_init();
  if (os_log_type_enabled((os_log_t)ats_symbolication_log, OS_LOG_TYPE_DEBUG)) {
    SymbolicationSession::sharedLibraryWithCSSymbolOwner();
  }
  *a4 = 0;
  a4[1] = 0;
  if (SHIBYTE(v17) < 0) {
    operator delete(v16[0]);
  }
}

void sub_2345BFE10(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15, uint64_t a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15)
  {
    if (a14 < 0) {
      operator delete(__p);
    }
  }
  _Unwind_Resume(exception_object);
}

void SymbolicationSession::sharedLibraryWithUUIDAndPath(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  *(void *)uu = a2;
  *(void *)&unsigned __int8 uu[8] = a3;
  v20[0] = a4;
  v20[1] = a5;
  if (uuid_is_null(uu) || !a5)
  {
    *a6 = 0;
    a6[1] = 0;
    return;
  }
  uint64_t v9 = std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::find<UUID>((void *)(a1 + 56), uu);
  if (v9)
  {
    uint64_t v11 = v9[4];
    uint64_t v10 = v9[5];
    goto LABEL_10;
  }
  std::allocate_shared[abi:ne180100]<SharedLibrary,std::allocator<SharedLibrary>,UUID &,std::string_view &,std::shared_ptr<StringPool> &,void>(uu, v20, a1, __p);
  char v12 = std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::__emplace_unique_key_args<UUID,UUID&,std::shared_ptr<SharedLibrary>>(a1 + 56, uu, uu, (long long *)__p);
  char v14 = v13;
  if (__p[1]) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)__p[1]);
  }
  if (v14)
  {
    uint64_t v11 = v12[4];
    uint64_t v10 = v12[5];
LABEL_10:
    *a6 = v11;
    a6[1] = v10;
    if (v10) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v10 + 8), 1uLL, memory_order_relaxed);
    }
    return;
  }
  UUID::uuidString((UUID *)uu, (uint64_t)__p);
  if (v17)
  {
    *(_OWORD *)uint64_t v18 = *(_OWORD *)__p;
    uint64_t v19 = v16;
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(v18, "<NULL UUID>");
    if (v17 && SHIBYTE(v16) < 0) {
      operator delete(__p[0]);
    }
  }
  ats_symbolication_log_init();
  if (os_log_type_enabled((os_log_t)ats_symbolication_log, OS_LOG_TYPE_DEBUG)) {
    SymbolicationSession::sharedLibraryWithUUIDAndPath();
  }
  *a6 = 0;
  a6[1] = 0;
  if (SHIBYTE(v19) < 0) {
    operator delete(v18[0]);
  }
}

void sub_2345C0000(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15)
  {
    if (a14 < 0) {
      operator delete(__p);
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t UUID::uuidString@<X0>(UUID *this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t result = uuid_is_null((const unsigned __int8 *)this);
  if (result)
  {
    char v5 = 0;
    *(unsigned char *)a2 = 0;
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    uuid_unparse((const unsigned __int8 *)this, v6);
    uint64_t result = (uint64_t)std::string::basic_string[abi:ne180100]<0>((void *)a2, v6);
    char v5 = 1;
  }
  *(unsigned char *)(a2 + 24) = v5;
  return result;
}

void sub_2345C0104(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void SymbolicationSession::aotSymbolicatorWithDescription(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

void SymbolicationSession::parseStackshot(SymbolicationSession *this, kcdata_iter a2)
{
  kcdata_iter v6 = a2;
  unint64_t v3 = *((void *)this + 34);
  if (v3 >= *((void *)this + 35))
  {
    uint64_t v4 = std::vector<Stackshot>::__emplace_back_slow_path<kcdata_iter &>((uint64_t *)this + 33, &v6);
  }
  else
  {
    Stackshot::Stackshot(*((Stackshot **)this + 34), a2);
    uint64_t v4 = v3 + 424;
    *((void *)this + 34) = v3 + 424;
  }
  *((void *)this + 34) = v4;
  char v5 = (Stackshot *)(v4 - 424);
  Stackshot::consumeStackshot((Stackshot *)(v4 - 424));
  SymbolicationSession::updateProcessView<Stackshot>((std::once_flag::_State_type *)this, v5);
}

void sub_2345C018C(_Unwind_Exception *a1)
{
  *(void *)(v1 + 272) = v2;
  _Unwind_Resume(a1);
}

void SymbolicationSession::updateProcessView<Stackshot>(std::once_flag::_State_type *a1, Stackshot *this)
{
  if (*(_DWORD *)(a1[1674] + 8) != 1)
  {
    for (uint64_t i = *(uint64_t **)(Stackshot::allPids(this) + 16); i; uint64_t i = (uint64_t *)*i)
    {
      int v5 = *((_DWORD *)i + 4);
      if (std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::find<int>(a1 + 44, &v5))
      {
        SymbolicationSession::updateProcessWithDataProvider<Stackshot>(a1, v5, this);
      }
      else
      {
        SymbolicationSession::addNewProcessWithDataProvider<Stackshot>(a1, v5, this);
      }
    }
  }
}

uint64_t SymbolicationSession::parseDyldKdebugEntries(std::once_flag::_State_type *this, __n128 **a2)
{
  unint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  if (*a2 != v4)
  {
    do
    {
      DyldKdebugHandler::consumeTracepoint((DyldKdebugHandler *)(this + 52), v3);
      v3 += 6;
    }
    while (v3 != v4);
  }

  return SymbolicationSession::updateKdebugLibraryView(this);
}

uint64_t SymbolicationSession::updateKdebugLibraryView(std::once_flag::_State_type *this)
{
  uint64_t v2 = (DyldKdebugHandler *)(this + 52);
  uint64_t result = DyldKdebugHandler::shouldResetLibraryState((DyldKdebugHandler *)(this + 52));
  if ((result & 1) == 0)
  {
    SymbolicationSession::updateProcessView<DyldKdebugHandler>(this, v2);
    return DyldKdebugHandler::toggleResetLibraryState((uint64_t)v2);
  }
  return result;
}

void SymbolicationSession::collectLiveLibraryDescriptionsForPid(std::once_flag::_State_type *a1, int a2)
{
  a1[1680] = KernelSymbolicator::sharedKernelSymbolicator((KernelSymbolicator *)a1);
  a1[1681] = v4;
  kcdata_iter v6 = a1;
  if (atomic_load_explicit((atomic_ullong *volatile)a1 + 17, memory_order_acquire) != -1)
  {
    uint64_t v8 = &v6;
    uint64_t v7 = &v8;
    std::__call_once(a1 + 17, &v7, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<SymbolicationSession::collectLiveLibraryDescriptionsForPid(int,std::unordered_set<LibraryDescription> &)::$_0 &&>>);
  }
  if (a2) {
    CSSymbolicatorCreateWithPid();
  }
  else {
    CSRetain();
  }
  if (CSIsNull())
  {
    ats_symbolication_log_init();
    int v5 = ats_symbolication_log;
    if (os_log_type_enabled((os_log_t)ats_symbolication_log, OS_LOG_TYPE_DEBUG)) {
      SymbolicationSession::collectLiveLibraryDescriptionsForPid(a2, v5);
    }
  }
  else
  {
    CSSymbolicatorIsKernelSymbolicator();
    CSSymbolicatorForeachSymbolOwnerAtTime();
    CSRelease();
  }
}

double ___ZN20SymbolicationSession36collectLiveLibraryDescriptionsForPidEiRNSt3__113unordered_setI18LibraryDescriptionNS0_4hashIS2_EENS0_8equal_toIS2_EENS0_9allocatorIS2_EEEE_block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(SymbolicationSession **)(a1 + 32);
  if ((CSSymbolOwnerIsDyldSharedCache() & 1) == 0)
  {
    Baseuint64_t Address = CSSymbolOwnerGetBaseAddress();
    if (*(unsigned char *)(a1 + 52))
    {
      KernelLibraryBaseuint64_t Address = findKernelLibraryBaseAddress();
      if (v6) {
        Baseuint64_t Address = KernelLibraryBaseAddress;
      }
    }
    uint64_t CFUUIDBytes = CSSymbolOwnerGetCFUUIDBytes();
    if (CFUUIDBytes)
    {
      LibraryDescription::LibraryDescription((LibraryDescription *)v14, BaseAddress, *(uint8_t **)CFUUIDBytes, *(void *)(CFUUIDBytes + 8));
      Path = (char *)CSSymbolOwnerGetPath();
      if (Path)
      {
        uint64_t v9 = *(void *)v2;
        std::string::basic_string[abi:ne180100]<0>(__p, Path);
        StringPool::cacheString(v9, (unsigned __int8 *)__p, (uint64_t)&v12);
        if (v11 < 0) {
          operator delete(__p[0]);
        }
        if (v13) {
          v14[2] = v12;
        }
      }
      std::__hash_table<LibraryDescription,std::hash<LibraryDescription>,std::equal_to<LibraryDescription>,std::allocator<LibraryDescription>>::__emplace_unique_key_args<LibraryDescription,LibraryDescription const&>(*(void *)(a1 + 40), (LibraryDescription *)v14, v14);
      return SymbolicationSession::updateBestKnownLibraryDescriptions(v2, (const LibraryDescription *)v14);
    }
  }
  return result;
}

void sub_2345C0584(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t findKernelLibraryBaseAddress()
{
  uint64_t v2 = 0;
  unint64_t v3 = &v2;
  uint64_t v4 = 0x3802000000;
  int v5 = __Block_byref_object_copy__40;
  char v6 = __Block_byref_object_dispose__41;
  char v7 = 0;
  char v8 = 0;
  CSSymbolOwnerForeachSegment();
  uint64_t v0 = v3[5];
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_2345C067C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SymbolicationSession::registerKtraceCallbacks(SymbolicationSession *this)
{
  uint64_t result = *((void *)this + 49);
  if (result)
  {
    unint64_t v3 = (char *)this + 13384;
    if (*((unsigned char *)this + 13384)
      || (ktrace_stackshot(), uint64_t result = ktrace_events_range(), *v3)
      || *(_DWORD *)(*((void *)this + 1674) + 8) == 1)
    {
      if (*(unsigned char *)(*((void *)this + 1674) + 24))
      {
        ktrace_events_single();
        ktrace_events_single();
        ktrace_events_single();
        ktrace_events_range();
        ktrace_events_single();
        uint64_t result = ktrace_events_single();
      }
    }
    *unint64_t v3 = 1;
  }
  return result;
}

void ___ZN20SymbolicationSession23registerKtraceCallbacksEv_block_invoke(uint64_t a1, kcdata_iter a2)
{
  kcdata_iter v6 = a2;
  uint64_t v2 = *(void **)(a1 + 32);
  unint64_t v3 = v2[34];
  if (v3 >= v2[35])
  {
    uint64_t v4 = std::vector<Stackshot>::__emplace_back_slow_path<kcdata_iter &>(v2 + 33, &v6);
  }
  else
  {
    Stackshot::Stackshot((Stackshot *)v2[34], a2);
    uint64_t v4 = v3 + 424;
    v2[34] = v3 + 424;
  }
  v2[34] = v4;
  int v5 = (Stackshot *)(v4 - 424);
  Stackshot::consumeStackshot((Stackshot *)(v4 - 424));
  SymbolicationSession::updateProcessView<Stackshot>(v2, v5);
}

void sub_2345C0A2C(_Unwind_Exception *a1)
{
  *(void *)(v1 + 272) = v2;
  _Unwind_Resume(a1);
}

void ___ZN20SymbolicationSession23registerKtraceCallbacksEv_block_invoke_2(uint64_t a1, __n128 *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_DWORD *)(*(void *)(v2 + 13392) + 8) != 1) {
    DyldKdebugHandler::consumeTracepoint((DyldKdebugHandler *)(v2 + 416), a2);
  }
}

uint64_t ___ZN20SymbolicationSession23registerKtraceCallbacksEv_block_invoke_3(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(std::once_flag::_State_type **)(a1 + 32);
  SymbolicationSession::updateKdebugLibraryView(v3);

  return SymbolicationSession::handleKernelStack((uint64_t)v3, a2);
}

uint64_t SymbolicationSession::handleKernelStack(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (Process *)SymbolicationSession::handleKernelStack(trace_point const*)::kernelProc;
  if (!SymbolicationSession::handleKernelStack(trace_point const*)::kernelProc)
  {
    int v7 = 0;
    int v5 = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::find<int>((void *)(a1 + 312), &v7);
    if (v5) {
      uint64_t v4 = (Process *)v5[3];
    }
    else {
      uint64_t v4 = 0;
    }
    SymbolicationSession::handleKernelStack(trace_point const*)::kernelProc = (uint64_t)v4;
  }
  return SymbolicationSession::handleKernelStack(a1, v4, a2);
}

uint64_t *___ZN20SymbolicationSession23registerKtraceCallbacksEv_block_invoke_4(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(std::once_flag::_State_type **)(a1 + 32);
  SymbolicationSession::updateKdebugLibraryView(v3);

  return SymbolicationSession::handleInterrupt((uint64_t)v3, a2);
}

uint64_t *SymbolicationSession::handleInterrupt(uint64_t a1, uint64_t a2)
{
  uint64_t result = (uint64_t *)SymbolicationSession::handleInterrupt(trace_point const*)::kernelProc;
  if (SymbolicationSession::handleInterrupt(trace_point const*)::kernelProc) {
    goto LABEL_10;
  }
  int v5 = 0;
  uint64_t result = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::find<int>((void *)(a1 + 312), &v5);
  if (!result)
  {
    SymbolicationSession::handleInterrupt(trace_point const*)::kernelProc = 0;
    return result;
  }
  uint64_t result = (uint64_t *)result[3];
  SymbolicationSession::handleInterrupt(trace_point const*)::kernelProc = (uint64_t)result;
  if (result)
  {
LABEL_10:
    if (*(unsigned char *)(*(void *)(a1 + 13392) + 24)) {
      return (uint64_t *)Process::addAddress((Process *)result, *(void *)(a2 + 16));
    }
  }
  return result;
}

uint64_t *___ZN20SymbolicationSession23registerKtraceCallbacksEv_block_invoke_5(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(std::once_flag::_State_type **)(a1 + 32);
  SymbolicationSession::updateKdebugLibraryView(v3);

  return SymbolicationSession::handleUserStack((uint64_t *)v3, a2);
}

uint64_t *SymbolicationSession::handleUserStack(uint64_t *result, uint64_t a2)
{
  if (*(unsigned char *)(result[1674] + 24))
  {
    int v7 = *(_DWORD *)(a2 + 88);
    uint64_t result = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::find<int>(result + 39, &v7);
    if (result)
    {
      unint64_t v3 = (Process *)result[3];
      if (v3)
      {
        uint64_t v4 = 0;
        uint64_t v5 = a2 + 8;
        do
        {
          unint64_t v6 = *(void *)(v5 + v4);
          if (v6) {
            uint64_t result = (uint64_t *)Process::addAddress(v3, v6);
          }
          v4 += 8;
        }
        while (v4 != 32);
      }
    }
  }
  return result;
}

uint64_t *___ZN20SymbolicationSession23registerKtraceCallbacksEv_block_invoke_6(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(std::once_flag::_State_type **)(a1 + 32);
  SymbolicationSession::updateKdebugLibraryView(v3);

  return SymbolicationSession::handleRealFault((uint64_t *)v3, a2);
}

uint64_t *SymbolicationSession::handleRealFault(uint64_t *result, uint64_t a2)
{
  if (*(unsigned char *)(result[1674] + 24))
  {
    HIDWORD(v2) = *(_DWORD *)(a2 + 48);
    LODWORD(v2) = HIDWORD(v2) - 20054024;
    if ((v2 >> 2) <= 3)
    {
      unint64_t v3 = *(void *)(a2 + 8);
      int v4 = *(_DWORD *)(a2 + 88);
      uint64_t result = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::find<int>(result + 39, &v4);
      if (result)
      {
        uint64_t result = (uint64_t *)result[3];
        if (result) {
          return (uint64_t *)Process::addAddress((Process *)result, v3);
        }
      }
    }
  }
  return result;
}

uint64_t *___ZN20SymbolicationSession23registerKtraceCallbacksEv_block_invoke_7(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(std::once_flag::_State_type **)(a1 + 32);
  SymbolicationSession::updateKdebugLibraryView(v3);

  return SymbolicationSession::handleKPCHandler((uint64_t *)v3, a2);
}

uint64_t *SymbolicationSession::handleKPCHandler(uint64_t *result, uint64_t a2)
{
  if (*(unsigned char *)(result[1674] + 24))
  {
    unint64_t v2 = *(void *)(a2 + 24);
    int v3 = *(_DWORD *)(a2 + 88);
    uint64_t result = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::find<int>(result + 39, &v3);
    if (result)
    {
      uint64_t result = (uint64_t *)result[3];
      if (result) {
        return (uint64_t *)Process::addAddress((Process *)result, v2);
      }
    }
  }
  return result;
}

uint64_t *___ZN20SymbolicationSession23registerKtraceCallbacksEv_block_invoke_8(uint64_t a1, uint64_t a2)
{
  int v3 = *(std::once_flag::_State_type **)(a1 + 32);
  SymbolicationSession::updateKdebugLibraryView(v3);

  return SymbolicationSession::handleDTraceProbe((uint64_t *)v3, a2);
}

uint64_t *SymbolicationSession::handleDTraceProbe(uint64_t *result, uint64_t a2)
{
  if (*(unsigned char *)(result[1674] + 24))
  {
    unint64_t v2 = *(void *)(a2 + 8);
    int v3 = *(void *)(a2 + 24);
    uint64_t result = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::find<int>(result + 39, &v3);
    if (result)
    {
      uint64_t result = (uint64_t *)result[3];
      if (result) {
        return (uint64_t *)Process::addAddress((Process *)result, v2);
      }
    }
  }
  return result;
}

void SymbolicationSession::updateProcessView<DyldKdebugHandler>(std::once_flag::_State_type *a1, DyldKdebugHandler *this)
{
  if (*(_DWORD *)(a1[1674] + 8) != 1)
  {
    for (uint64_t i = *(uint64_t **)(DyldKdebugHandler::allPids(this) + 16); i; uint64_t i = (uint64_t *)*i)
    {
      int v5 = *((_DWORD *)i + 4);
      if (std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::find<int>(a1 + 44, &v5))
      {
        SymbolicationSession::updateProcessWithDataProvider<DyldKdebugHandler>(a1, v5, this);
      }
      else
      {
        SymbolicationSession::addNewProcessWithDataProvider<DyldKdebugHandler>(a1, v5, this);
      }
    }
  }
}

uint64_t SymbolicationSession::handleKernelStack(uint64_t result, Process *this, uint64_t a3)
{
  if (this && *(unsigned char *)(*(void *)(result + 13392) + 24))
  {
    uint64_t v4 = 0;
    uint64_t v5 = a3 + 8;
    do
    {
      unint64_t v6 = *(void *)(v5 + v4);
      if (v6) {
        uint64_t result = Process::addAddress(this, v6);
      }
      v4 += 8;
    }
    while (v4 != 32);
  }
  return result;
}

uint64_t SymbolicationSession::handleInterrupt(uint64_t result, Process *this, uint64_t a3)
{
  if (this)
  {
    if (*(unsigned char *)(*(void *)(result + 13392) + 24)) {
      return Process::addAddress(this, *(void *)(a3 + 16));
    }
  }
  return result;
}

void SymbolicationSession::addNeededAddresses(std::once_flag::_State_type *a1, uint64_t *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v4 = (DyldKdebugHandler *)(a1 + 52);
  if ((DyldKdebugHandler::shouldResetLibraryState((DyldKdebugHandler *)(a1 + 52)) & 1) == 0)
  {
    SymbolicationSession::updateProcessView<DyldKdebugHandler>(a1, v4);
    DyldKdebugHandler::toggleResetLibraryState((uint64_t)v4);
  }
  *(_DWORD *)buf = 0;
  uint64_t v5 = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::find<int>(a1 + 39, (int *)buf);
  if (v5) {
    unint64_t v6 = (Process *)v5[3];
  }
  else {
    unint64_t v6 = 0;
  }
  uint64_t v7 = *a2;
  uint64_t v8 = a2[1];
  if (*a2 != v8)
  {
    do
    {
      int v9 = *(_DWORD *)(v7 + 48);
      if (v9 > 620888075)
      {
        if (v9 > 721486252)
        {
          if ((v9 - 721486253) >= 2) {
            goto LABEL_32;
          }
          SymbolicationSession::handleDTraceProbe((uint64_t *)a1, v7);
        }
        else
        {
          switch(v9)
          {
            case 620888076:
              if (v6 && *(unsigned char *)(a1[1674] + 24))
              {
                for (uint64_t i = 8; i != 40; i += 8)
                {
                  unint64_t v12 = *(void *)(v7 + i);
                  if (v12) {
                    Process::addAddress(v6, v12);
                  }
                }
              }
              break;
            case 620888080:
              SymbolicationSession::handleUserStack((uint64_t *)a1, v7);
              break;
            case 621150209:
              SymbolicationSession::handleKPCHandler((uint64_t *)a1, v7);
              break;
            default:
              goto LABEL_32;
          }
        }
      }
      else if ((v9 - 20054024) > 0xC || ((1 << (v9 - 8)) & 0x1111) == 0)
      {
        if (v9 != 83886085)
        {
LABEL_32:
          ats_symbolication_log_init();
          char v13 = ats_symbolication_log;
          if (os_log_type_enabled((os_log_t)ats_symbolication_log, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            int v15 = v9;
            _os_log_error_impl(&dword_2345B5000, v13, OS_LOG_TYPE_ERROR, "Unhandled tracepoint with debugid %u", buf, 8u);
          }
          goto LABEL_34;
        }
        if (v6)
        {
          if (*(unsigned char *)(a1[1674] + 24)) {
            Process::addAddress(v6, *(void *)(v7 + 16));
          }
        }
      }
      else
      {
        SymbolicationSession::handleRealFault((uint64_t *)a1, v7);
      }
LABEL_34:
      v7 += 96;
    }
    while (v7 != v8);
  }
}

const void **SymbolicationSession::forEachSymbolChunk(const void **result, uint64_t a2)
{
  unint64_t v2 = result[9];
  if (v2)
  {
    uint64_t v4 = result;
    do
    {
      uint64_t v5 = (int *)v4[1674];
      unint64_t v6 = (SharedLibrary *)v2[4];
      if (v5) {
        FBSSignatureWithConfig = (const void *)SharedLibrary::generateFBSSignatureWithConfig((uint64_t)v6, *v5);
      }
      else {
        FBSSignatureWithConfig = (const void *)SharedLibrary::generateFBSSignature(v6);
      }
      uint64_t v8 = FBSSignatureWithConfig;
      char v9 = 0;
      std::function<void ()(__CFData const*)>::operator()(a2, (uint64_t)FBSSignatureWithConfig);
      uint64_t result = ScopeGuard<void const*,ScopeGuardPolicy<void const*>>::~ScopeGuard(&v8);
      unint64_t v2 = (void *)*v2;
    }
    while (v2);
  }
  return result;
}

void sub_2345C1290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
}

uint64_t std::function<void ()(__CFData const*)>::operator()(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a2;
  uint64_t v2 = *(void *)(a1 + 24);
  if (!v2) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)v2 + 48))(v2, &v4);
}

uint64_t SymbolicationSession::forEachResymbolicatedSymbolChunk(uint64_t result, uint64_t a2)
{
  int v3 = (void *)result;
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(uint64_t (**)(const char *))(*(void *)(result + 13392) + 32);
  if (v4) {
    uint64_t result = v4("[Symbolication] Symbolicating");
  }
  for (uint64_t i = (uint64_t *)v3[9]; i; uint64_t i = (uint64_t *)*i)
  {
    int v6 = *(_DWORD *)(v3[1674] + 4);
    if (v6)
    {
      if (v6 == 2)
      {
        uint64_t result = (uint64_t)std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::find<UUID>(v3 + 1692, i + 2);
        if (result)
        {
          char v13 = (SharedLibrary *)i[4];
          *(void *)__str = i + 2;
          char v14 = std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID const&>,std::tuple<>>((uint64_t)(v3 + 1692), i + 2, (uint64_t)&std::piecewise_construct, (_OWORD **)__str);
          int v15 = (const char *)(v14 + 4);
          if (*((char *)v14 + 55) < 0) {
            int v15 = *(const char **)v15;
          }
          uint64_t result = SharedLibrary::prepareForResymbolicationWithDsymPath(v13, v15);
          if (result) {
            goto LABEL_39;
          }
          if (*(void *)(v3[1674] + 32))
          {
            UUID::uuidString((UUID *)((uint8_t *)i + 1), (uint64_t)__p);
            if (!v21) {
              std::__throw_bad_optional_access[abi:ne180100]();
            }
            if (v20 >= 0) {
              uint64_t v16 = __p;
            }
            else {
              uint64_t v16 = (void **)__p[0];
            }
            uint64_t v22 = i + 2;
            char v17 = std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID const&>,std::tuple<>>((uint64_t)(v3 + 1692), i + 2, (uint64_t)&std::piecewise_construct, &v22);
            uint64_t v18 = (const char *)(v17 + 4);
            if (*((char *)v17 + 55) < 0) {
              uint64_t v18 = *(const char **)v18;
            }
            snprintf(__str, 0x400uLL, "[Symbolication] failed to ingest dSYM: %s %s", (const char *)v16, v18);
            if (v21 && v20 < 0) {
              operator delete(__p[0]);
            }
            goto LABEL_22;
          }
        }
      }
      else
      {
        if (v6 != 1) {
          goto LABEL_39;
        }
        uint64_t result = (uint64_t)std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::find<UUID>(v3 + 1692, i + 2);
        if (!result) {
          continue;
        }
        uint64_t result = (uint64_t)std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::find<UUID>(v3 + 1687, i + 2);
        if (!result) {
          continue;
        }
        uint64_t v7 = (SharedLibrary *)i[4];
        *(void *)__str = i + 2;
        uint64_t v8 = std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID const&>,std::tuple<>>((uint64_t)(v3 + 1692), i + 2, (uint64_t)&std::piecewise_construct, (_OWORD **)__str);
        char v9 = (const char *)(v8 + 4);
        if (*((char *)v8 + 55) < 0) {
          char v9 = *(const char **)v9;
        }
        uint64_t result = SharedLibrary::prepareForResymbolicationWithDsymPath(v7, v9);
        if (result)
        {
LABEL_39:
          *(void *)__str = SharedLibrary::generateFBSSignature((SharedLibrary *)i[4]);
          char v24 = 0;
          std::function<void ()(__CFData const*)>::operator()(a2, *(uint64_t *)__str);
          uint64_t result = (uint64_t)ScopeGuard<void const*,ScopeGuardPolicy<void const*>>::~ScopeGuard((const void **)__str);
          continue;
        }
        if (*(void *)(v3[1674] + 32))
        {
          UUID::uuidString((UUID *)((uint8_t *)i + 1), (uint64_t)__p);
          if (!v21) {
            std::__throw_bad_optional_access[abi:ne180100]();
          }
          if (v20 >= 0) {
            uint64_t v10 = __p;
          }
          else {
            uint64_t v10 = (void **)__p[0];
          }
          uint64_t v22 = i + 2;
          char v11 = std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID const&>,std::tuple<>>((uint64_t)(v3 + 1692), i + 2, (uint64_t)&std::piecewise_construct, &v22);
          unint64_t v12 = (const char *)(v11 + 4);
          if (*((char *)v11 + 55) < 0) {
            unint64_t v12 = *(const char **)v12;
          }
          snprintf(__str, 0x400uLL, "[Symbolication] failed to ingest dSYM: %s %s", (const char *)v10, v12);
          if (v21)
          {
            if (v20 < 0) {
              operator delete(__p[0]);
            }
          }
LABEL_22:
          uint64_t result = (*(uint64_t (**)(char *))(v3[1674] + 32))(__str);
        }
      }
    }
    else
    {
      uint64_t result = (uint64_t)std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::find<UUID>(v3 + 1687, i + 2);
      if (result) {
        goto LABEL_39;
      }
    }
  }
  return result;
}

void sub_2345C1600(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17, uint64_t a18, uint64_t a19, char a20)
{
  if (a17)
  {
    if (a16 < 0) {
      operator delete(__p);
    }
  }
  _Unwind_Resume(exception_object);
}

void *SymbolicationSession::filterUUIDsNeedingSymbolicationWithFile(void *result)
{
  uint64_t v1 = (uint64_t *)result[9];
  if (v1)
  {
    uint64_t v2 = result;
    int v3 = result + 1682;
    uint64_t v4 = result + 1687;
    do
    {
      uint64_t result = (void *)SharedLibrary::hasAddressesToSymbolicate((SharedLibrary *)v1[4]);
      if (result)
      {
        if ((*(_DWORD *)(v2[1674] + 4) - 1) <= 1
          && v2[1685]
          && (uint64_t v5 = std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::find<UUID>(v3, v1 + 2)) != 0&& *((unsigned char *)v5 + 32))
        {
          uint64_t result = std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::find<UUID>(v4, v1 + 2);
          if (result) {
            uint64_t result = std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__erase_unique<UUID>(v4, v1 + 2);
          }
        }
        else
        {
          SharedLibrary::path((SharedLibrary *)v1[4], (uint64_t)v6);
          if (!v6[16]) {
            std::__throw_bad_optional_access[abi:ne180100]();
          }
          uint64_t result = std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__emplace_unique_key_args<UUID,UUID const&,std::string_view>((uint64_t)v4, v1 + 2, (_OWORD *)v1 + 1, (uint64_t)v6);
        }
      }
      uint64_t v1 = (uint64_t *)*v1;
    }
    while (v1);
  }
  return result;
}

void SymbolicationSession::collectAvailableDsymPaths(SymbolicationSession *this)
{
  uint64_t v1 = *((void *)this + 1674);
  if (*(_DWORD *)(v1 + 4) == 1)
  {
    unfold_dsym_path(*(char **)(v1 + 16), (uint64_t)&v24);
    uint64_t v3 = v24;
    uint64_t v4 = v25;
    if (v24 != v25)
    {
      uint64_t v5 = MEMORY[0x263EF8330];
      do
      {
        uint64_t v18 = v5;
        uint64_t v19 = 0x40000000;
        char v20 = ___ZN20SymbolicationSession25collectAvailableDsymPathsEv_block_invoke;
        char v21 = &__block_descriptor_tmp_16;
        uint64_t v22 = this;
        uint64_t v23 = v3;
        CSSymbolicatorForeachSymbolicatorWithPath();
        v3 += 24;
      }
      while (v3 != v4);
    }
    std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>(&v17.__pn_, (char **)(*((void *)this + 1674) + 16));
    std::__fs::filesystem::__status(&v17, 0);
    if (SHIBYTE(v17.__pn_.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v17.__pn_.__r_.__value_.__l.__data_);
    }
    if (!*((void *)this + 1695) && p.__r_.__value_.__s.__data_[0] == 2)
    {
      std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>((std::string *)&__p, (char **)(*((void *)this + 1674) + 16));
      MEMORY[0x237DC1B40](&v17, &__p, 0, 0);
      if (*(char *)(&__p.__rec_ + 7) < 0) {
        operator delete(__p.__imp_.__ptr_);
      }
      std::shared_ptr<std::__fs::filesystem::recursive_directory_iterator::__shared_imp> v6 = *(std::shared_ptr<std::__fs::filesystem::recursive_directory_iterator::__shared_imp> *)&v17.__pn_.__r_.__value_.__l.__data_;
      if (v17.__pn_.__r_.__value_.__l.__size_)
      {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v17.__pn_.__r_.__value_.__l.__size_ + 8), 1uLL, memory_order_relaxed);
        uint32_t size = (std::__shared_weak_count *)v17.__pn_.__r_.__value_.__l.__size_;
        __p.__imp_ = v6;
        __p.__rec_ = v17.__pn_.__r_.__value_.__s.__data_[16];
        if (v17.__pn_.__r_.__value_.__l.__size_)
        {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(v17.__pn_.__r_.__value_.__l.__size_ + 8), 1uLL, memory_order_relaxed);
          std::__shared_weak_count::__release_shared[abi:ne180100](size);
        }
      }
      else
      {
        __p.__imp_ = *(std::shared_ptr<std::__fs::filesystem::recursive_directory_iterator::__shared_imp> *)&v17.__pn_.__r_.__value_.__l.__data_;
        __p.__rec_ = v17.__pn_.__r_.__value_.__s.__data_[16];
      }
      while (1)
      {
        if (!__p.__imp_.__ptr_)
        {
          if (__p.__imp_.__cntrl_) {
            std::__shared_weak_count::__release_shared[abi:ne180100](__p.__imp_.__cntrl_);
          }
          if (v17.__pn_.__r_.__value_.__l.__size_) {
            std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v17.__pn_.__r_.__value_.__l.__size_);
          }
          break;
        }
        uint64_t v8 = std::__fs::filesystem::recursive_directory_iterator::__dereference(&__p);
        char v9 = (char *)v8;
        if (SHIBYTE(v8->__p_.__pn_.__r_.__value_.__r.__words[2]) < 0) {
          std::string::__init_copy_ctor_external(&p, v8->__p_.__pn_.__r_.__value_.__l.__data_, v8->__p_.__pn_.__r_.__value_.__l.__size_);
        }
        else {
          std::string p = (std::string)v8->__p_;
        }
        BOOL v10 = std::string::ends_with[abi:ne180100]((uint64_t *)&p, ".dSYM");
        BOOL v11 = v10;
        if (SHIBYTE(p.__r_.__value_.__r.__words[2]) < 0)
        {
          operator delete(p.__r_.__value_.__l.__data_);
          if (!v11) {
            goto LABEL_29;
          }
        }
        else if (!v10)
        {
          goto LABEL_29;
        }
        if (v9[23] >= 0) {
          unint64_t v12 = v9;
        }
        else {
          unint64_t v12 = *(char **)v9;
        }
        unfold_dsym_path(v12, (uint64_t)&p);
        std::string::size_type v14 = p.__r_.__value_.__l.__size_;
        for (std::string::size_type i = p.__r_.__value_.__r.__words[0]; i != v14; i += 24)
          CSSymbolicatorForeachSymbolicatorWithPath();
        p_std::string p = &p;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_p);
LABEL_29:
        std::__fs::filesystem::recursive_directory_iterator::__increment(&__p, 0);
      }
    }
    v17.__pn_.__r_.__value_.__r.__words[0] = (std::string::size_type)&v24;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v17);
  }
}

void sub_2345C1A30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (a23 < 0) {
    operator delete(__p);
  }
  __std::string p = (void *)(v29 - 136);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  _Unwind_Resume(a1);
}

void unfold_dsym_path(char *__s@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  std::string::basic_string[abi:ne180100]<0>(&v26, __s);
  if (std::string::ends_with[abi:ne180100]((uint64_t *)&v26, ".dSYM"))
  {
    uint64_t v3 = std::string::append(&v26, "/Contents/Resources/DWARF/", 0x1AuLL);
    if (SHIBYTE(v3->__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external(&v25, v3->__r_.__value_.__l.__data_, v3->__r_.__value_.__l.__size_);
    }
    else
    {
      long long v4 = *(_OWORD *)&v3->__r_.__value_.__l.__data_;
      v25.__r_.__value_.__r.__words[2] = v3->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v25.__r_.__value_.__l.__data_ = v4;
    }
    std::__fs::filesystem::path::path[abi:ne180100]<std::string,void>((std::string *)&__v, (char *)&v25);
    MEMORY[0x237DC1B20](&v23, &__v, 0, 0);
    if (SHIBYTE(__v.__end_) < 0) {
      operator delete(__v.__first_);
    }
    uint64_t v5 = v23;
    std::shared_ptr<std::__fs::filesystem::recursive_directory_iterator::__shared_imp> v6 = v24;
    if (v24)
    {
      atomic_fetch_add_explicit(&v24->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v7 = v24;
      v22.__imp_.__ptr_ = v5;
      v22.__imp_.__cntrl_ = v6;
      if (v24)
      {
        atomic_fetch_add_explicit(&v24->__shared_owners_, 1uLL, memory_order_relaxed);
        std::__shared_weak_count::__release_shared[abi:ne180100](v7);
      }
    }
    else
    {
      v22.__imp_.__ptr_ = v23;
      v22.__imp_.__cntrl_ = 0;
    }
    while (v22.__imp_.__ptr_)
    {
      uint64_t v8 = std::__fs::filesystem::directory_iterator::__dereference(&v22);
      if (SHIBYTE(v8->__p_.__pn_.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&__p.__pn_, v8->__p_.__pn_.__r_.__value_.__l.__data_, v8->__p_.__pn_.__r_.__value_.__l.__size_);
      }
      else {
        __p.__pn_ = (std::__fs::filesystem::path::string_type)v8->__p_;
      }
      unint64_t v10 = *(void *)(a2 + 8);
      unint64_t v9 = *(void *)(a2 + 16);
      if (v10 >= v9)
      {
        unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v10 - *(void *)a2) >> 3);
        unint64_t v13 = v12 + 1;
        if (v12 + 1 > 0xAAAAAAAAAAAAAAALL) {
          std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v9 - *(void *)a2) >> 3);
        if (2 * v14 > v13) {
          unint64_t v13 = 2 * v14;
        }
        if (v14 >= 0x555555555555555) {
          unint64_t v15 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v15 = v13;
        }
        __v.__end_cap_.__value_ = (std::allocator<std::string> *)(a2 + 16);
        if (v15) {
          uint64_t v16 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<_CSBinaryRelocationInformation>>>(a2 + 16, v15);
        }
        else {
          uint64_t v16 = 0;
        }
        std::__fs::filesystem::path v17 = v16 + v12;
        __v.__first_ = v16;
        __v.__begin_ = v17;
        __v.__end_cap_.__value_ = &v16[v15];
        long long v18 = *(_OWORD *)&__p.__pn_.__r_.__value_.__l.__data_;
        v17->__r_.__value_.__r.__words[2] = __p.__pn_.__r_.__value_.__r.__words[2];
        *(_OWORD *)&v17->__r_.__value_.__l.__data_ = v18;
        memset(&__p, 0, sizeof(__p));
        __v.__end_ = v17 + 1;
        std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)a2, &__v);
        uint64_t v19 = *(void *)(a2 + 8);
        std::__split_buffer<std::string>::~__split_buffer(&__v);
        int v20 = SHIBYTE(__p.__pn_.__r_.__value_.__r.__words[2]);
        *(void *)(a2 + 8) = v19;
        if (v20 < 0) {
          operator delete(__p.__pn_.__r_.__value_.__l.__data_);
        }
      }
      else
      {
        long long v11 = *(_OWORD *)&__p.__pn_.__r_.__value_.__l.__data_;
        *(void *)(v10 + 16) = *((void *)&__p.__pn_.__r_.__value_.__l + 2);
        *(_OWORD *)unint64_t v10 = v11;
        *(void *)(a2 + 8) = v10 + 24;
      }
      std::__fs::filesystem::directory_iterator::__increment(&v22, 0);
    }
    if (v22.__imp_.__cntrl_) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v22.__imp_.__cntrl_);
    }
    if (v24) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v24);
    }
    if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v25.__r_.__value_.__l.__data_);
    }
  }
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v26.__r_.__value_.__l.__data_);
  }
}

void sub_2345C1D54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  if (*(char *)(v32 - 81) < 0) {
    operator delete(*(void **)(v32 - 104));
  }
  if (a25 < 0) {
    operator delete(__p);
  }
  if (a32 < 0) {
    operator delete(a27);
  }
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a27);
  _Unwind_Resume(a1);
}

void *___ZN20SymbolicationSession25collectAvailableDsymPathsEv_block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  CSSymbolicatorGetSymbolOwner();
  uint64_t result = (void *)CSSymbolOwnerGetCFUUIDBytes();
  if (result)
  {
    long long v4 = *(_OWORD *)result;
    return std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__emplace_unique_key_args<UUID,UUID&,std::string&>(v2 + 13536, &v4, &v4, *(void *)(a1 + 40));
  }
  return result;
}

BOOL std::string::ends_with[abi:ne180100](uint64_t *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (*((char *)a1 + 23) < 0)
  {
    std::shared_ptr<std::__fs::filesystem::recursive_directory_iterator::__shared_imp> v6 = a1;
    a1 = (uint64_t *)*a1;
    uint64_t v5 = v6[1];
  }
  else
  {
    uint64_t v5 = *((unsigned __int8 *)a1 + 23);
  }
  v8[0] = a1;
  v8[1] = v5;
  return std::string_view::ends_with[abi:ne180100](v8, __s, v4);
}

void *___ZN20SymbolicationSession25collectAvailableDsymPathsEv_block_invoke_2(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  CSSymbolicatorGetSymbolOwner();
  uint64_t result = (void *)CSSymbolOwnerGetCFUUIDBytes();
  if (result)
  {
    long long v4 = *(_OWORD *)result;
    return std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__emplace_unique_key_args<UUID,UUID&,std::string&>(v2 + 13536, &v4, &v4, *(void *)(a1 + 40));
  }
  return result;
}

uint64_t SymbolicationSession::collectDsymPathsViaDownload(SymbolicationSession *this)
{
  return 10;
}

uint64_t SymbolicationSession::fillSharedCacheFromChunkSymbolicator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v11[0] = a2;
  v11[1] = a3;
  SharedCacheBaseuint64_t Address = CSSymbolicatorGetSharedCacheBaseAddress();
  uint64_t SharedCacheUUID = CSSymbolicatorGetSharedCacheUUID();
  if (!SharedCacheUUID) {
    return 5;
  }
  SharedCacheDescription::SharedCacheDescription((SharedCacheDescription *)v12, SharedCacheBaseAddress, 0, *(uint8_t **)SharedCacheUUID, *(void *)(SharedCacheUUID + 8));
  std::allocate_shared[abi:ne180100]<SharedCache,std::allocator<SharedCache>,_CSTypeRef &,std::shared_ptr<StringPool> &,void>(v11, a1, &v9);
  std::shared_ptr<std::__fs::filesystem::recursive_directory_iterator::__shared_imp> v6 = std::__hash_table<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::__unordered_map_hasher<SharedCacheDescription,std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::hash<SharedCacheDescription>,std::equal_to<SharedCacheDescription>,true>,std::__unordered_map_equal<SharedCacheDescription,std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::equal_to<SharedCacheDescription>,std::hash<SharedCacheDescription>,true>,std::allocator<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>>>::__emplace_unique_key_args<SharedCacheDescription,SharedCacheDescription&,std::shared_ptr<SharedCache>&>(a1 + 16, (SharedCacheDescription *)v12, (uint64_t)v12, &v9);
  if (v7)
  {
    SharedCache::symbolicator((SharedCache *)v6[7]);
    CSSymbolicatorForeachSymbolOwnerAtTime();
  }
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  return 0;
}

void sub_2345C20C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, std::__shared_weak_count *a15)
{
  if (a15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a15);
  }
  _Unwind_Resume(exception_object);
}

void ___ZN20SymbolicationSession36fillSharedCacheFromChunkSymbolicatorE10_CSTypeRef_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  SymbolicationSession::sharedLibraryWithCSSymbolOwner(*(void *)(a1 + 32), a2, a3, &v4);
  uint64_t v3 = v5;
  if (v5)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

uint64_t SymbolicationSession::addProcessFromChunkSymbolicator(uint64_t a1)
{
  v20[8] = *MEMORY[0x263EF8340];
  int IsKernelSymbolicator = CSSymbolicatorIsKernelSymbolicator();
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x4002000000;
  long long v18 = __Block_byref_object_copy_;
  uint64_t v19 = __Block_byref_object_dispose_;
  memset(v20, 0, 24);
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 0x40000000;
  unint64_t v10 = ___ZN20SymbolicationSession31addProcessFromChunkSymbolicatorE10_CSTypeRef_block_invoke;
  long long v11 = &unk_264BF4370;
  char v14 = IsKernelSymbolicator;
  unint64_t v12 = &v15;
  uint64_t v13 = a1;
  CSSymbolicatorForeachSymbolOwnerAtTime();
  if (v16[6] != v16[5])
  {
    if (IsKernelSymbolicator) {
      int Pid = 0;
    }
    else {
      int Pid = CSSymbolicatorGetPid();
    }
    int v7 = Pid;
    operator new();
  }
  if (IsKernelSymbolicator) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = 6;
  }
  _Block_object_dispose(&v15, 8);
  *(void *)&long long v6 = v20;
  std::vector<ProcessLibrary>::__destroy_vector::operator()[abi:ne180100]((void ***)&v6);
  return v4;
}

void sub_2345C25B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  *(void *)(v32 - 152) = v30;
  std::vector<ProcessLibrary>::__destroy_vector::operator()[abi:ne180100]((void ***)(v32 - 152));
  _Block_object_dispose(&a19, 8);
  *(void *)(v32 - 152) = v29;
  std::vector<ProcessLibrary>::__destroy_vector::operator()[abi:ne180100]((void ***)(v32 - 152));
  uint64_t v34 = a29;
  a29 = 0;
  if (v34) {
    std::default_delete<Process>::operator()[abi:ne180100]((uint64_t)&a29, v34);
  }
  _Block_object_dispose((const void *)(v32 - 216), 8);
  *(void *)(v32 - 128) = v31;
  std::vector<ProcessLibrary>::__destroy_vector::operator()[abi:ne180100]((void ***)(v32 - 128));
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy_(void *a1, uint64_t a2)
{
  a1[5] = 0;
  a1[6] = 0;
  a1[7] = 0;
  __n128 result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 5) = result;
  a1[7] = *(void *)(a2 + 56);
  *(void *)(a2 + 40) = 0;
  *(void *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  uint64_t v1 = (void **)(a1 + 40);
  std::vector<ProcessLibrary>::__destroy_vector::operator()[abi:ne180100](&v1);
}

void ___ZN20SymbolicationSession31addProcessFromChunkSymbolicatorE10_CSTypeRef_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a1 + 40);
  Baseuint64_t Address = CSSymbolOwnerGetBaseAddress();
  uint64_t v12 = BaseAddress;
  if ((CSSymbolOwnerIsKextBundle() & 1) != 0 || *(unsigned char *)(a1 + 48))
  {
    KernelLibraryBaseuint64_t Address = findKernelLibraryBaseAddress();
    if (v9) {
      uint64_t v10 = KernelLibraryBaseAddress;
    }
    else {
      uint64_t v10 = BaseAddress;
    }
    uint64_t v12 = v10;
  }
  SymbolicationSession::sharedLibraryWithCSSymbolOwner(v6, a2, a3, &v11);
  std::vector<ProcessLibrary>::emplace_back<unsigned long long &,std::shared_ptr<SharedLibrary>>((uint64_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), &v12, &v11);
  if (*((void *)&v11 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v11 + 1));
  }
}

void sub_2345C2784(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11)
{
  if (a11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a11);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::vector<ProcessLibrary>::emplace_back<unsigned long long &,std::shared_ptr<SharedLibrary>>(uint64_t *a1, uint64_t *a2, long long *a3)
{
  unint64_t v8 = a1[2];
  uint64_t v6 = (uint64_t)(a1 + 2);
  unint64_t v7 = v8;
  unint64_t v9 = *(void *)(v6 - 8);
  if (v9 >= v8)
  {
    uint64_t v11 = (uint64_t)(v9 - *a1) >> 5;
    if ((unint64_t)(v11 + 1) >> 59) {
      std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v12 = v7 - *a1;
    uint64_t v13 = v12 >> 4;
    if (v12 >> 4 <= (unint64_t)(v11 + 1)) {
      uint64_t v13 = v11 + 1;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFE0) {
      unint64_t v14 = 0x7FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v13;
    }
    uint64_t v21 = v6;
    if (v14) {
      uint64_t v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ProcessLibrary>>(v6, v14);
    }
    else {
      uint64_t v15 = 0;
    }
    uint64_t v17 = v15;
    long long v18 = &v15[32 * v11];
    int v20 = &v15[32 * v14];
    std::construct_at[abi:ne180100]<ProcessLibrary,unsigned long long &,std::shared_ptr<SharedLibrary>,ProcessLibrary*>((uint64_t)v18, a2, a3);
    uint64_t v19 = v18 + 32;
    std::vector<ProcessLibrary>::__swap_out_circular_buffer(a1, &v17);
    uint64_t v10 = a1[1];
    std::__split_buffer<ProcessLibrary>::~__split_buffer(&v17);
  }
  else
  {
    std::construct_at[abi:ne180100]<ProcessLibrary,unsigned long long &,std::shared_ptr<SharedLibrary>,ProcessLibrary*>(*(void *)(v6 - 8), a2, a3);
    uint64_t v10 = v9 + 32;
    a1[1] = v9 + 32;
  }
  a1[1] = v10;
  return v10 - 32;
}

void sub_2345C28A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  *(void *)(v10 + 8) = v11;
  _Unwind_Resume(exception_object);
}

void ___ZN20SymbolicationSession31addProcessFromChunkSymbolicatorE10_CSTypeRef_block_invoke_2(void *a1, uint64_t a2, uint64_t a3)
{
  SymbolicationSession::sharedLibraryWithCSSymbolOwner(a1[5], a2, a3, &v5);
  uint64_t v4 = a1[6] + CSSymbolOwnerGetBaseAddress();
  std::vector<ProcessLibrary>::emplace_back<unsigned long long &,std::shared_ptr<SharedLibrary>>((uint64_t *)(*(void *)(a1[4] + 8) + 40), &v4, &v5);
  if (*((void *)&v5 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v5 + 1));
  }
}

void sub_2345C2940(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12)
{
  if (a12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a12);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SymbolicationSession::verifyKernelFromFileAndSetupLiveKernel(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  CSSymbolicatorGetAOutSymbolOwner();
  uint64_t CFUUIDBytes = (KernelSymbolicator *)CSSymbolOwnerGetCFUUIDBytes();
  if (!CFUUIDBytes) {
    return 3;
  }
  long long v9 = *(_OWORD *)CFUUIDBytes;
  memset(v7, 0, sizeof(v7));
  KernelSymbolicator::sharedKernelSymbolicator(CFUUIDBytes);
  CSSymbolicatorGetAOutSymbolOwner();
  uint64_t v3 = (long long *)CSSymbolOwnerGetCFUUIDBytes();
  if (v3)
  {
    long long v8 = *v3;
    if ((void)v9 == (void)v8 && *((void *)&v9 + 1) == *((void *)&v8 + 1)) {
      uint64_t v5 = SymbolicationSession::addProcessFromChunkSymbolicator(a1);
    }
    else {
      uint64_t v5 = 7;
    }
  }
  else
  {
    uint64_t v5 = 4;
  }
  *(void *)&long long v8 = v7;
  std::vector<ProcessLibrary>::__destroy_vector::operator()[abi:ne180100]((void ***)&v8);
  return v5;
}

void sub_2345C2A4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, void **a13)
{
  a13 = (void **)&a10;
  std::vector<ProcessLibrary>::__destroy_vector::operator()[abi:ne180100](&a13);
  _Unwind_Resume(a1);
}

uint64_t SymbolicationSession::verifySharedCacheFromFileAndSetupLiveSharedCache(uint64_t a1)
{
  uint64_t v7 = a1;
  if (atomic_load_explicit((atomic_ullong *volatile)&SymbolicationSession::verifySharedCacheFromFileAndSetupLiveSharedCache(_CSTypeRef)::dscMapFlag, memory_order_acquire) != -1)
  {
    long long v9 = &v7;
    long long v8 = &v9;
    std::__call_once(&SymbolicationSession::verifySharedCacheFromFileAndSetupLiveSharedCache(_CSTypeRef)::dscMapFlag, &v8, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<SymbolicationSession::verifySharedCacheFromFileAndSetupLiveSharedCache(_CSTypeRef)::$_0 &&>>);
  }
  uint64_t SharedCacheUUID = CSSymbolicatorGetSharedCacheUUID();
  if (!SharedCacheUUID) {
    return 5;
  }
  uint64_t v3 = SharedCacheSymbolicators::cachedSharedCacheSymbolicatorByUUID(*(SharedCacheSymbolicators **)SharedCacheUUID, *(uint8_t **)(SharedCacheUUID + 8));
  uint64_t v5 = v4;
  if (CSIsNull()) {
    return 7;
  }
  else {
    return SymbolicationSession::fillSharedCacheFromChunkSymbolicator(a1, (uint64_t)v3, v5);
  }
}

uint64_t SymbolicationSession::addProcessFromModifiedNonFBSSymbolSource(uint64_t a1)
{
  uint64_t Signature = CSSymbolicatorCreateSignature();
  if (!Signature) {
    return 6;
  }
  uint64_t v3 = (const void *)Signature;
  CSSymbolicatorCreateWithSignature();
  if (CSIsNull())
  {
    CFRelease(v3);
    return 6;
  }
  uint64_t v5 = SymbolicationSession::addProcessFromChunkSymbolicator(a1);
  CFRelease(v3);
  CSRelease();
  return v5;
}

uint64_t SymbolicationSession::extractSymbolicationChunksFromFile(SymbolicationSession *a1)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void (**)(const char *))(*((void *)a1 + 1674) + 32);
  if (v2) {
    v2("[Symbolication] Extracting symbolication related info and events from file");
  }
  uint64_t v44 = 0;
  uint64_t v45 = &v44;
  uint64_t v46 = 0x2000000000;
  char v47 = 0;
  uint64_t v40 = 0;
  long long v41 = &v40;
  uint64_t v42 = 0x2000000000;
  char v43 = 0;
  uint64_t v36 = 0;
  unint64_t v37 = &v36;
  uint64_t v38 = 0x2000000000;
  char v39 = 0;
  uint64_t v32 = 0;
  std::string v33 = &v32;
  uint64_t v34 = 0x2000000000;
  int v35 = 0;
  uint64_t v24 = MEMORY[0x263EF8330];
  uint64_t v25 = 0x40000000;
  std::string v26 = ___ZN20SymbolicationSession34extractSymbolicationChunksFromFileEP11ktrace_file_block_invoke;
  uint64_t v27 = &unk_264BF43E8;
  kcdata_item_t v28 = &v44;
  uint64_t v29 = &v32;
  uint64_t v30 = &v40;
  uint64_t v31 = a1;
  ktrace_file_iterate();
  uint64_t v3 = *((unsigned int *)v33 + 6);
  if (!v3)
  {
    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 0x40000000;
    uint64_t v19 = ___ZN20SymbolicationSession34extractSymbolicationChunksFromFileEP11ktrace_file_block_invoke_3;
    int v20 = &unk_264BF4438;
    uint64_t v21 = &v36;
    std::__fs::filesystem::directory_iterator v22 = &v32;
    uint64_t v23 = a1;
    ktrace_file_iterate();
    uint64_t v3 = *((unsigned int *)v33 + 6);
    if (!v3)
    {
      if (!*((unsigned char *)v45 + 24) || !*((unsigned char *)v41 + 24) || !*((unsigned char *)v37 + 24))
      {
        uint64_t v3 = 2;
        goto LABEL_61;
      }
      if (*(_DWORD *)(*((void *)a1 + 1674) + 4) != 1) {
        goto LABEL_59;
      }
      SymbolicationSession::collectAvailableDsymPaths(a1);
      uint64_t v4 = (uint64_t *)*((void *)a1 + 1694);
      if (!v4) {
        goto LABEL_62;
      }
      uint64_t v5 = 0;
      while (1)
      {
        uint64_t v6 = std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::find<UUID>((void *)a1 + 7, v4 + 2);
        uint64_t v7 = std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::find<UUID>((void *)a1 + 1682, v4 + 2);
        long long v8 = (const char *)(v4 + 4);
        if (v6)
        {
          if (*((void *)a1 + 1685) && v7)
          {
            if (*((unsigned char *)v7 + 32))
            {
              if (*(void *)(*((void *)a1 + 1674) + 32))
              {
                UUID::uuidString((UUID *)((uint8_t *)v4 + 1), (uint64_t)__p);
                if (!v16) {
                  std::__throw_bad_optional_access[abi:ne180100]();
                }
                if (v15 >= 0) {
                  long long v9 = __p;
                }
                else {
                  long long v9 = (void **)__p[0];
                }
                snprintf(__str, 0x400uLL, "[Symbolication] Library with uuid: %s is fully symbolicated. No new symbols will be written for this library", (const char *)v9);
                if (v16 && v15 < 0) {
                  operator delete(__p[0]);
                }
LABEL_56:
                (*(void (**)(char *))(*((void *)a1 + 1674) + 32))(__str);
              }
            }
            else
            {
              ++v5;
              if (*(void *)(*((void *)a1 + 1674) + 32))
              {
                UUID::uuidString((UUID *)((uint8_t *)v4 + 1), (uint64_t)__p);
                if (!v16) {
                  std::__throw_bad_optional_access[abi:ne180100]();
                }
                if (v15 >= 0) {
                  uint64_t v12 = __p;
                }
                else {
                  uint64_t v12 = (void **)__p[0];
                }
                if (*((char *)v4 + 55) < 0) {
                  long long v8 = *(const char **)v8;
                }
                snprintf(__str, 0x400uLL, "[Symbolication] Current Apple Trace contains incomplete symbols for uuid: %s. New symbols will be written for this library based on %s", (const char *)v12, v8);
                if (v16 && v15 < 0) {
                  operator delete(__p[0]);
                }
                goto LABEL_56;
              }
            }
          }
          else
          {
            ++v5;
            if (*(void *)(*((void *)a1 + 1674) + 32))
            {
              UUID::uuidString((UUID *)((uint8_t *)v4 + 1), (uint64_t)__p);
              if (!v16) {
                std::__throw_bad_optional_access[abi:ne180100]();
              }
              if (v15 >= 0) {
                uint64_t v11 = __p;
              }
              else {
                uint64_t v11 = (void **)__p[0];
              }
              if (*((char *)v4 + 55) < 0) {
                long long v8 = *(const char **)v8;
              }
              snprintf(__str, 0x400uLL, "[Symbolication] Current Apple Trace does not contain symbols for uuid: %s. The uuid is relevant for the file, new symbols will be written for this library based on %s", (const char *)v11, v8);
              if (v16 && v15 < 0) {
                operator delete(__p[0]);
              }
              goto LABEL_56;
            }
          }
        }
        else if (*(void *)(*((void *)a1 + 1674) + 32))
        {
          UUID::uuidString((UUID *)((uint8_t *)v4 + 1), (uint64_t)__p);
          if (!v16) {
            std::__throw_bad_optional_access[abi:ne180100]();
          }
          if (v15 >= 0) {
            uint64_t v10 = __p;
          }
          else {
            uint64_t v10 = (void **)__p[0];
          }
          if (*((char *)v4 + 55) < 0) {
            long long v8 = *(const char **)v8;
          }
          snprintf(__str, 0x400uLL, "[Symbolication] UUID: %s in %s is not relevant to current Apple Trace, it does not match any library found in file ", (const char *)v10, v8);
          if (v16 && v15 < 0) {
            operator delete(__p[0]);
          }
          goto LABEL_56;
        }
        uint64_t v4 = (uint64_t *)*v4;
        if (!v4)
        {
          if (v5)
          {
LABEL_59:
            uint64_t v3 = 0;
            break;
          }
LABEL_62:
          uint64_t v3 = 8;
          break;
        }
      }
    }
  }
LABEL_61:
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);
  return v3;
}

void sub_2345C3084(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46)
{
  if (a18)
  {
    if (a17 < 0) {
      operator delete(__p);
    }
  }
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose(&a42, 8);
  _Block_object_dispose(&a46, 8);
  _Unwind_Resume(a1);
}

BOOL ___ZN20SymbolicationSession34extractSymbolicationChunksFromFileEP11ktrace_file_block_invoke(void *a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v2 = a1[7];
  if (ktrace_chunk_tag() == 20585)
  {
    *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 1;
    ktrace_chunk_size();
    uint64_t v3 = ktrace_chunk_copy_cfdata();
    if (v3)
    {
      uint64_t v4 = (const void *)v3;
      MEMORY[0x237DC18F0](v3, 0);
      if (CSIsNull()) {
        goto LABEL_24;
      }
      int v5 = *(_DWORD *)(*(void *)(v2 + 13392) + 4);
      if ((v5 - 1) >= 2)
      {
        if (v5) {
          goto LABEL_24;
        }
        int v6 = SymbolicationSession::verifyKernelFromFileAndSetupLiveKernel(v2);
      }
      else
      {
        int v6 = SymbolicationSession::addProcessFromChunkSymbolicator(v2);
      }
      *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = v6;
LABEL_24:
      CFRelease(v4);
      return !*(_DWORD *)(*(void *)(a1[5] + 8) + 24);
    }
    uint64_t v14 = *(void *)(a1[5] + 8);
    int v15 = 3;
LABEL_20:
    *(_DWORD *)(v14 + 24) = v15;
    return 0;
  }
  if (ktrace_chunk_tag() == 20584)
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    ktrace_chunk_size();
    uint64_t v7 = ktrace_chunk_copy_cfdata();
    if (!v7)
    {
      uint64_t v14 = *(void *)(a1[5] + 8);
      int v15 = 5;
      goto LABEL_20;
    }
    long long v8 = (const void *)v7;
    *(void *)&long long v19 = 0;
    *((void *)&v19 + 1) = &v19;
    uint64_t v20 = 0x2000000000;
    uint64_t v21 = 0;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 0x40000000;
    v17[2] = ___ZN20SymbolicationSession34extractSymbolicationChunksFromFileEP11ktrace_file_block_invoke_2;
    v17[3] = &unk_264BF43C0;
    v17[5] = &v19;
    v17[6] = v2;
    v17[4] = a1[5];
    MEMORY[0x237DC1960](v7, 0, v17);
    CFRelease(v8);
    uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 24);
    _Block_object_dispose(&v19, 8);
    if (!v9) {
      return 0;
    }
  }
  else if (ktrace_chunk_tag() == 20583)
  {
    if (!*(_DWORD *)(*(void *)(v2 + 13392) + 4))
    {
      BOOL result = 0;
      *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = 9;
      return result;
    }
    ktrace_chunk_size();
    uint64_t v10 = ktrace_chunk_copy_cfdata();
    if (v10)
    {
      uint64_t v11 = (const void *)v10;
      MEMORY[0x237DC18F0](v10, 0);
      if ((CSIsNull() & 1) == 0)
      {
        CSSymbolicatorGetSymbolOwner();
        if ((CSIsNull() & 1) == 0)
        {
          uint64_t CFUUIDBytes = (long long *)CSSymbolOwnerGetCFUUIDBytes();
          if (CFUUIDBytes)
          {
            long long v19 = *CFUUIDBytes;
            uint64_t v13 = (void *)(v2 + 13456);
            if (std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::find<UUID>(v13, &v19))
            {
              uint64_t v18 = &v19;
              *((unsigned char *)std::__hash_table<std::__hash_value_type<UUID,BOOL>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,BOOL>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,BOOL>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,BOOL>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID const&>,std::tuple<>>((uint64_t)v13, &v19, (uint64_t)&std::piecewise_construct, &v18)+ 32) = 1;
            }
            else
            {
              LOBYTE(v18) = CSSymbolOwnerGetSourceInfoCount() != 0;
              std::__hash_table<std::__hash_value_type<UUID,BOOL>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,BOOL>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,BOOL>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,BOOL>>>::__emplace_unique_key_args<UUID,UUID&,BOOL>((uint64_t)v13, &v19, &v19, &v18);
            }
          }
        }
      }
      CSRelease();
      CFRelease(v11);
    }
  }
  return 1;
}

void sub_2345C3474(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
}

uint64_t ___ZN20SymbolicationSession34extractSymbolicationChunksFromFileEP11ktrace_file_block_invoke_2(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = a1[6];
  int v5 = *(_DWORD *)(*(void *)(result + 13392) + 4);
  if ((v5 - 1) >= 2)
  {
    if (v5) {
      goto LABEL_6;
    }
    uint64_t result = SymbolicationSession::verifySharedCacheFromFileAndSetupLiveSharedCache(result);
  }
  else
  {
    uint64_t result = SymbolicationSession::fillSharedCacheFromChunkSymbolicator(result, a2, a3);
  }
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = result;
LABEL_6:
  if (!*(_DWORD *)(*(void *)(a1[4] + 8) + 24)) {
    ++*(void *)(*(void *)(a1[5] + 8) + 24);
  }
  return result;
}

uint64_t ___ZN20SymbolicationSession34extractSymbolicationChunksFromFileEP11ktrace_file_block_invoke_3(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t v3 = 1;
  if (ktrace_chunk_tag() == 20586)
  {
    ktrace_chunk_size();
    uint64_t v4 = ktrace_chunk_copy_cfdata();
    *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 1;
    if (v4)
    {
      int v5 = (const void *)v4;
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 0x40000000;
      v7[2] = ___ZN20SymbolicationSession34extractSymbolicationChunksFromFileEP11ktrace_file_block_invoke_4;
      void v7[3] = &unk_264BF4410;
      v7[4] = a1[5];
      v7[5] = v2;
      MEMORY[0x237DC1960](v4, 0, v7);
      CFRelease(v5);
      if (!*(_DWORD *)(*(void *)(a1[5] + 8) + 24)) {
        return v3;
      }
    }
    else
    {
      *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = 6;
    }
    return 0;
  }
  return v3;
}

uint64_t ___ZN20SymbolicationSession34extractSymbolicationChunksFromFileEP11ktrace_file_block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  int v3 = *(_DWORD *)(*(void *)(result + 13392) + 4);
  if ((v3 - 1) >= 2)
  {
    if (v3) {
      return result;
    }
    uint64_t result = SymbolicationSession::addProcessFromModifiedNonFBSSymbolSource(result);
  }
  else
  {
    uint64_t result = SymbolicationSession::addProcessFromChunkSymbolicator(result);
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void SymbolicationSession::writeSymbolDataToKtraceFile(const void **a1, uint64_t a2)
{
  v12[4] = *MEMORY[0x263EF8340];
  int v8 = 0;
  int v4 = *((_DWORD *)a1[1674] + 2);
  if (v4 == 1)
  {
    SymbolicationSession::filterUUIDsNeedingSymbolicationWithFile(a1);
    int v6 = a1[1674];
    if (*((_DWORD *)v6 + 1) == 2)
    {
      uint64_t v7 = (void (*)(const char *))v6[4];
      if (a1[1690])
      {
        if (v7)
        {
          snprintf((char *)buf, 0x400uLL, "Symbolication failed. No dSYMs were found by '%s'.", (const char *)v6[5]);
          (*((void (**)(uint8_t *))a1[1674] + 4))(buf);
        }
      }
      else if (v7)
      {
        v7("[Symbolication] All libraries are symbolicated.");
      }
    }
    else
    {
      v9[0] = &unk_26E7618B0;
      v9[1] = a2;
      v9[2] = &v8;
      v9[3] = v9;
      SymbolicationSession::forEachResymbolicatedSymbolChunk((uint64_t)a1, (uint64_t)v9);
      std::__function::__value_func<void ()(__CFData const*)>::~__value_func[abi:ne180100](v9);
      if (*((void *)a1[1674] + 4))
      {
        snprintf((char *)buf, 0x400uLL, "[Symbolication] Successfully symbolicated %u libraries", v8);
        (*((void (**)(uint8_t *))a1[1674] + 4))(buf);
      }
    }
  }
  else if (!v4)
  {
    if (a2)
    {
      v12[0] = &unk_26E761820;
      v12[1] = a2;
      v12[2] = &v8;
      v12[3] = v12;
      SymbolicationSession::forEachSymbolChunk(a1, (uint64_t)v12);
      std::__function::__value_func<void ()(__CFData const*)>::~__value_func[abi:ne180100](v12);
    }
    ats_symbolication_log_init();
    int v5 = ats_symbolication_log;
    if (os_log_type_enabled((os_log_t)ats_symbolication_log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v11 = v8;
      _os_log_impl(&dword_2345B5000, v5, OS_LOG_TYPE_INFO, "Wrote %u symbol chunks", buf, 8u);
    }
  }
}

void sub_2345C3894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::__function::__value_func<void ()(__CFData const*)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t SymbolicationSession::createProcessMapsChunk()
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2000000000;
  uint64_t v12 = 0;
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x2000000000;
  uint64_t v8 = 0;
  uint64_t FlatbufferSignatureForSymbolicatorsWithBlock = CSSymbolicatorCreateFlatbufferSignatureForSymbolicatorsWithBlock();
  ats_symbolication_log_init();
  uint64_t v1 = ats_symbolication_log;
  if (os_log_type_enabled((os_log_t)ats_symbolication_log, OS_LOG_TYPE_INFO))
  {
    uint64_t v2 = v10[3];
    uint64_t v3 = v6[3];
    *(_DWORD *)buf = 134218240;
    uint64_t v14 = v2;
    __int16 v15 = 2048;
    uint64_t v16 = v3;
    _os_log_impl(&dword_2345B5000, v1, OS_LOG_TYPE_INFO, "Created %zu process maps, %zu failures", buf, 0x16u);
  }
  _Block_object_dispose(&v5, 8);
  _Block_object_dispose(&v9, 8);
  return FlatbufferSignatureForSymbolicatorsWithBlock;
}

void sub_2345C3A20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZN20SymbolicationSession22createProcessMapsChunkEP11ktrace_file_block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 48);
  uint64_t v3 = *(Process ***)(v2 + 288);
  int v4 = *(Process ***)(v2 + 296);
  if (v3 != v4)
  {
    uint64_t v6 = result;
    do
    {
      uint64_t result = Process::pid(*v3);
      if (result)
      {
        uint64_t TransientProcessSymbolicatorFromDescriptions = Process::createTransientProcessSymbolicatorFromDescriptions(*v3);
        uint64_t v9 = v8;
        uint64_t result = CSIsNull();
        if (result)
        {
          ++*(void *)(*(void *)(*(void *)(v6 + 40) + 8) + 24);
        }
        else
        {
          ++*(void *)(*(void *)(*(void *)(v6 + 32) + 8) + 24);
          (*(void (**)(uint64_t, uint64_t, uint64_t))(a2 + 16))(a2, TransientProcessSymbolicatorFromDescriptions, v9);
          uint64_t result = CSRelease();
        }
      }
      ++v3;
    }
    while (v3 != v4);
  }
  return result;
}

void SymbolicationSession::writeProcessMapsToKtraceFile(std::once_flag::_State_type *this)
{
  if (!*(unsigned char *)(this[1674] + 24)) {
    SymbolicationSession::updateKdebugLibraryView(this);
  }
  CFDataRef ProcessMapsChunk = (const __CFData *)SymbolicationSession::createProcessMapsChunk();
  if (ProcessMapsChunk)
  {
    CFDataRef v2 = ProcessMapsChunk;
    CFDataGetBytePtr(ProcessMapsChunk);
    CFDataGetLength(v2);
    if (!ktrace_file_append_chunk())
    {
      ats_symbolication_log_init();
      uint64_t v3 = ats_symbolication_log;
      if (os_log_type_enabled((os_log_t)ats_symbolication_log, OS_LOG_TYPE_ERROR)) {
        SymbolicationSession::writeProcessMapsToKtraceFile(v3);
      }
    }
    CFRelease(v2);
  }
}

uint64_t SymbolicationSession::setKtraceSession(uint64_t result, uint64_t a2)
{
  *(void *)(result + 392) = a2;
  *(unsigned char *)(result + 408) = 0;
  return result;
}

uint64_t SymbolicationSession::SymbolicationSession(uint64_t a1, uint64_t a2)
{
  int v4 = (char *)operator new(0x40uLL);
  *((void *)v4 + 1) = 0;
  *((void *)v4 + 2) = 0;
  *(void *)int v4 = &unk_26E761930;
  *((void *)v4 + 7) = 0;
  *(_OWORD *)(v4 + 40) = 0u;
  *((_DWORD *)v4 + 14) = 1065353216;
  *(void *)(a1 + 8) = v4;
  *(_OWORD *)(v4 + 24) = 0u;
  *(void *)a1 = v4 + 24;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_DWORD *)(a1 + 48) = 1065353216;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_DWORD *)(a1 + 88) = 1065353216;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_DWORD *)(a1 + 128) = 1065353216;
  *(void *)(a1 + 168) = 0;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_DWORD *)(a1 + 176) = 1065353216;
  *(_OWORD *)(a1 + 184) = 0u;
  *(_OWORD *)(a1 + 200) = 0u;
  *(_DWORD *)(a1 + 216) = 1065353216;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_DWORD *)(a1 + 256) = 1065353216;
  *(_OWORD *)(a1 + 264) = 0u;
  *(_OWORD *)(a1 + 280) = 0u;
  *(_OWORD *)(a1 + 296) = 0u;
  *(_OWORD *)(a1 + 312) = 0u;
  *(_OWORD *)(a1 + 328) = 0u;
  *(_DWORD *)(a1 + 344) = 1065353216;
  *(_OWORD *)(a1 + 352) = 0u;
  *(_OWORD *)(a1 + 368) = 0u;
  *(_DWORD *)(a1 + 384) = 1065353216;
  *(void *)(a1 + 392) = 0;
  *(unsigned char *)(a1 + 408) = 0;
  DyldKdebugHandler::DyldKdebugHandler(a1 + 416, a1);
  *(unsigned char *)(a1 + 13384) = 0;
  *(void *)(a1 + 13392) = a2;
  *(_OWORD *)(a1 + 13400) = 0u;
  *(_OWORD *)(a1 + 13416) = 0u;
  *(_DWORD *)(a1 + 13432) = 1065353216;
  *(_OWORD *)(a1 + 13456) = 0u;
  *(_OWORD *)(a1 + 13472) = 0u;
  *(_DWORD *)(a1 + 13488) = 1065353216;
  *(_OWORD *)(a1 + 13496) = 0u;
  *(_OWORD *)(a1 + 13512) = 0u;
  *(_DWORD *)(a1 + 13528) = 1065353216;
  *(_OWORD *)(a1 + 13536) = 0u;
  *(_OWORD *)(a1 + 13552) = 0u;
  *(_DWORD *)(a1 + 13568) = 1065353216;
  *(void *)(a1 + 400) = dispatch_queue_create("com.apple.appletracingsupport.symbolication", 0);
  if (!*(void *)(a1 + 13392)) {
    ats_create_symbolication_config();
  }
  return a1;
}

void sub_2345C3D80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void **a12)
{
  uint64_t v23 = v18;
  std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::~__hash_table(v20);
  std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::~__hash_table(v13);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table(a10);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table(v23);
  DyldKdebugHandler::~DyldKdebugHandler(v19);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table(v12 + 352);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table(v12 + 312);
  a12 = (void **)(v12 + 288);
  std::vector<std::unique_ptr<Process>>::__destroy_vector::operator()[abi:ne180100](&a12);
  std::vector<Stackshot>::__destroy_vector::operator()[abi:ne180100](&a12);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table(v17);
  std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::~__hash_table(v16);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table(v12 + 144);
  std::__hash_table<std::__hash_value_type<AOTSharedCacheDescription,std::shared_ptr<void *>>,std::__unordered_map_hasher<AOTSharedCacheDescription,std::__hash_value_type<AOTSharedCacheDescription,std::shared_ptr<void *>>,std::hash<AOTSharedCacheDescription>,std::equal_to<AOTSharedCacheDescription>,true>,std::__unordered_map_equal<AOTSharedCacheDescription,std::__hash_value_type<AOTSharedCacheDescription,std::shared_ptr<void *>>,std::equal_to<AOTSharedCacheDescription>,std::hash<AOTSharedCacheDescription>,true>,std::allocator<std::__hash_value_type<AOTSharedCacheDescription,std::shared_ptr<void *>>>>::~__hash_table(v15);
  std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::~__hash_table(v14);
  std::__hash_table<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::__unordered_map_hasher<SharedCacheDescription,std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::hash<SharedCacheDescription>,std::equal_to<SharedCacheDescription>,true>,std::__unordered_map_equal<SharedCacheDescription,std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::equal_to<SharedCacheDescription>,std::hash<SharedCacheDescription>,true>,std::allocator<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>>>::~__hash_table(a11);
  uint64_t v22 = *(std::__shared_weak_count **)(v12 + 8);
  if (v22) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v22);
  }
  _Unwind_Resume(a1);
}

void SymbolicationSession::SymbolicationSession(SymbolicationSession *this)
{
}

{
  SymbolicationSession::SymbolicationSession((uint64_t)this, 0);
}

void SymbolicationSession::~SymbolicationSession(SymbolicationSession *this)
{
  if (*((void *)this + 49) && *((unsigned char *)this + 408)) {
    ktrace_session_destroy();
  }
  CFDataRef v2 = *((void *)this + 50);
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = *((void *)this + 1674);
  if (v3 && !*(unsigned char *)(v3 + 24)) {
    ats_destroy_symbolication_config(v3);
  }
  std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::~__hash_table((uint64_t)this + 13536);
  std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::~__hash_table((uint64_t)this + 13496);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table((uint64_t)this + 13456);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table((uint64_t)this + 13400);
  DyldKdebugHandler::~DyldKdebugHandler((SymbolicationSession *)((char *)this + 416));
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table((uint64_t)this + 352);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table((uint64_t)this + 312);
  uint64_t v5 = (void **)((char *)this + 288);
  std::vector<std::unique_ptr<Process>>::__destroy_vector::operator()[abi:ne180100](&v5);
  uint64_t v5 = (void **)((char *)this + 264);
  std::vector<Stackshot>::__destroy_vector::operator()[abi:ne180100](&v5);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table((uint64_t)this + 224);
  std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::~__hash_table((uint64_t)this + 184);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table((uint64_t)this + 144);
  std::__hash_table<std::__hash_value_type<AOTSharedCacheDescription,std::shared_ptr<void *>>,std::__unordered_map_hasher<AOTSharedCacheDescription,std::__hash_value_type<AOTSharedCacheDescription,std::shared_ptr<void *>>,std::hash<AOTSharedCacheDescription>,std::equal_to<AOTSharedCacheDescription>,true>,std::__unordered_map_equal<AOTSharedCacheDescription,std::__hash_value_type<AOTSharedCacheDescription,std::shared_ptr<void *>>,std::equal_to<AOTSharedCacheDescription>,std::hash<AOTSharedCacheDescription>,true>,std::allocator<std::__hash_value_type<AOTSharedCacheDescription,std::shared_ptr<void *>>>>::~__hash_table((uint64_t)this + 96);
  std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::~__hash_table((uint64_t)this + 56);
  std::__hash_table<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::__unordered_map_hasher<SharedCacheDescription,std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::hash<SharedCacheDescription>,std::equal_to<SharedCacheDescription>,true>,std::__unordered_map_equal<SharedCacheDescription,std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::equal_to<SharedCacheDescription>,std::hash<SharedCacheDescription>,true>,std::allocator<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>>>::~__hash_table((uint64_t)this + 16);
  int v4 = (std::__shared_weak_count *)*((void *)this + 1);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
}

uint64_t std::vector<Stackshot>::__emplace_back_slow_path<kcdata_iter &>(uint64_t *a1, kcdata_iter *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = 0x21CFB2B78C13521DLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) > 0x9A90E7D95BC609) {
    std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0x21CFB2B78C13521DLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x4D4873ECADE304) {
    unint64_t v9 = 0x9A90E7D95BC609;
  }
  else {
    unint64_t v9 = v5;
  }
  uint64_t v17 = a1 + 2;
  if (v9) {
    uint64_t v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Stackshot>>(v7, v9);
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v13 = v10;
  uint64_t v14 = (Stackshot *)&v10[424 * v4];
  uint64_t v15 = v14;
  uint64_t v16 = &v10[424 * v9];
  Stackshot::Stackshot(v14, *a2);
  uint64_t v15 = (Stackshot *)((char *)v14 + 424);
  std::vector<Stackshot>::__swap_out_circular_buffer(a1, &v13);
  uint64_t v11 = a1[1];
  std::__split_buffer<Stackshot>::~__split_buffer((uint64_t)&v13);
  return v11;
}

void sub_2345C405C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<Stackshot>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t *std::vector<Stackshot>::__swap_out_circular_buffer(uint64_t *result, void *a2)
{
  uint64_t v3 = result;
  uint64_t v5 = *result;
  uint64_t v4 = result[1];
  uint64_t v6 = a2[1];
  while (v4 != v5)
  {
    v6 -= 424;
    v4 -= 424;
    uint64_t result = (uint64_t *)std::construct_at[abi:ne180100]<Stackshot,Stackshot,Stackshot*>(v6, v4);
  }
  a2[1] = v6;
  uint64_t v7 = *v3;
  *uint64_t v3 = v6;
  a2[1] = v7;
  uint64_t v8 = v3[1];
  v3[1] = a2[2];
  a2[2] = v8;
  uint64_t v9 = v3[2];
  v3[2] = a2[3];
  a2[3] = v9;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<Stackshot>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x9A90E7D95BC60ALL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(424 * a2);
}

uint64_t std::construct_at[abi:ne180100]<Stackshot,Stackshot,Stackshot*>(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::__hash_table(a1, (uint64_t *)a2);
  std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::__hash_table(v4 + 40, (uint64_t *)(a2 + 40));
  std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::__hash_table(a1 + 80, (uint64_t *)(a2 + 80));
  std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::__hash_table(a1 + 120, (uint64_t *)(a2 + 120));
  std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::__hash_table(a1 + 160, (uint64_t *)(a2 + 160));
  std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::__hash_table(a1 + 200, (uint64_t *)(a2 + 200));
  long long v5 = *(_OWORD *)(a2 + 240);
  long long v6 = *(_OWORD *)(a2 + 272);
  *(_OWORD *)(a1 + 256) = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 272) = v6;
  *(_OWORD *)(a1 + 24SymbolicationSession::SymbolicationSession((uint64_t)this, 0) = v5;
  long long v7 = *(_OWORD *)(a2 + 288);
  long long v8 = *(_OWORD *)(a2 + 304);
  long long v9 = *(_OWORD *)(a2 + 320);
  *(void *)(a1 + 336) = *(void *)(a2 + 336);
  *(_OWORD *)(a1 + 304) = v8;
  *(_OWORD *)(a1 + 32SymbolicationSession::SymbolicationSession((uint64_t)this, 0) = v9;
  *(_OWORD *)(a1 + 288) = v7;
  std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::__hash_table(a1 + 344, (uint64_t *)(a2 + 344));
  std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::__hash_table(a1 + 384, (uint64_t *)(a2 + 384));
  return a1;
}

uint64_t std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::__hash_table(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a2 = 0;
  *(void *)uint64_t result = v2;
  *(void *)(result + 8) = a2[1];
  a2[1] = 0;
  uint64_t v5 = a2[2];
  uint64_t v3 = a2 + 2;
  uint64_t v4 = v5;
  *(void *)(result + 16) = v5;
  uint64_t v6 = v3[1];
  *(void *)(result + 24) = v6;
  *(_DWORD *)(result + 32) = *((_DWORD *)v3 + 4);
  if (v6)
  {
    unint64_t v7 = *(void *)(v4 + 8);
    unint64_t v8 = *(void *)(result + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        v7 %= v8;
      }
    }
    else
    {
      v7 &= v8 - 1;
    }
    *(void *)(v2 + 8 * v7) = result + 16;
    *uint64_t v3 = 0;
    v3[1] = 0;
  }
  return result;
}

uint64_t std::__destroy_at[abi:ne180100]<Stackshot,0>(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table(a1 + 384);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table(a1 + 344);
  std::__hash_table<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>>>::~__hash_table(a1 + 200);
  std::__hash_table<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>>>::~__hash_table(a1 + 160);
  std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::~__hash_table(a1 + 120);
  std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::~__hash_table(a1 + 80);
  std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::~__hash_table(a1 + 40);

  return std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::~__hash_table(a1);
}

uint64_t std::__split_buffer<Stackshot>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 424;
    std::__destroy_at[abi:ne180100]<Stackshot,0>(i - 424);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t __Block_byref_object_copy__40(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(unsigned char *)(result + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(result + 4SymbolicationSession::SymbolicationSession((uint64_t)this, 0) = v2;
  return result;
}

unint64_t ___ZL28findKernelLibraryBaseAddress10_CSTypeRef_block_invoke(uint64_t a1)
{
  uint64_t Name = (const char *)CSRegionGetName();
  if (Name) {
    BOOL v3 = strncmp(Name, "__TEXT_EXEC", 0xBuLL) == 0;
  }
  else {
    BOOL v3 = 0;
  }
  uint64_t v4 = (const char *)CSRegionGetName();
  if (v4) {
    BOOL v5 = strncmp(v4, "__PPLTEXT", 9uLL) == 0;
  }
  else {
    BOOL v5 = 0;
  }
  unint64_t result = CSRegionGetName();
  if (result)
  {
    unint64_t result = strncmp((const char *)result, "__PPLTRAMP", 0xAuLL);
    BOOL v7 = result == 0;
  }
  else
  {
    BOOL v7 = 0;
  }
  if (v3 || v5 || v7)
  {
    unint64_t result = CSRegionGetRange();
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    if (*(unsigned char *)(v8 + 48))
    {
      if (result >= *(void *)(v8 + 40)) {
        unint64_t result = *(void *)(v8 + 40);
      }
    }
    *(void *)(v8 + 4SymbolicationSession::SymbolicationSession((uint64_t)this, 0) = result;
    *(unsigned char *)(v8 + 48) = 1;
  }
  return result;
}

std::string *std::__fs::filesystem::path::path[abi:ne180100]<std::string,void>(std::string *a1, char *a2)
{
  a1->__r_.__value_.__r.__words[0] = 0;
  a1->__r_.__value_.__l.__size_ = 0;
  a1->__r_.__value_.__r.__words[2] = 0;
  LODWORD(v3) = a2[23];
  BOOL v4 = (int)v3 < 0;
  uint64_t v5 = *((void *)a2 + 1);
  if ((int)v3 < 0) {
    a2 = *(char **)a2;
  }
  uint64_t v3 = v3;
  if (v4) {
    uint64_t v3 = v5;
  }
  std::string::append[abi:ne180100]<char const*,0>(a1, a2, &a2[v3]);
  return a1;
}

void sub_2345C4490(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

std::string *std::string::append[abi:ne180100]<char const*,0>(std::string *this, char *a2, char *a3)
{
  BOOL v4 = a2;
  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  unint64_t v7 = a3 - a2;
  if ((v6 & 0x80000000) != 0)
  {
    if (a3 == a2) {
      return this;
    }
    std::string::size_type size = this->__r_.__value_.__l.__size_;
    unint64_t v11 = this->__r_.__value_.__r.__words[2];
    std::string::size_type v9 = (v11 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    uint64_t v10 = (std::string *)this->__r_.__value_.__r.__words[0];
    unint64_t v6 = HIBYTE(v11);
  }
  else
  {
    if (a3 == a2) {
      return this;
    }
    std::string::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    std::string::size_type v9 = 22;
    uint64_t v10 = this;
  }
  if (v10 > (std::string *)v4 || (char *)&v10->__r_.__value_.__l.__data_ + size + 1 <= v4)
  {
    if (v9 - size < v7)
    {
      std::string::__grow_by(this, v9, size - v9 + v7, size, size, 0, 0);
      this->__r_.__value_.__l.__size_ = size;
      LOBYTE(v6) = *((unsigned char *)&this->__r_.__value_.__s + 23);
    }
    uint64_t v14 = this;
    if ((v6 & 0x80) != 0) {
      uint64_t v14 = (std::string *)this->__r_.__value_.__r.__words[0];
    }
    for (uint64_t i = (char *)v14 + size; v4 != a3; ++i)
    {
      char v16 = *v4++;
      unsigned char *i = v16;
    }
    unsigned char *i = 0;
    std::string::size_type v17 = v7 + size;
    if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
      this->__r_.__value_.__l.__size_ = v17;
    }
    else {
      *((unsigned char *)&this->__r_.__value_.__s + 23) = v17 & 0x7F;
    }
  }
  else
  {
    std::string::__init_with_size[abi:ne180100]<char const*,char const*>(__p, v4, a3, v7);
    if ((v20 & 0x80u) == 0) {
      uint64_t v12 = __p;
    }
    else {
      uint64_t v12 = (void **)__p[0];
    }
    if ((v20 & 0x80u) == 0) {
      std::string::size_type v13 = v20;
    }
    else {
      std::string::size_type v13 = (std::string::size_type)__p[1];
    }
    std::string::append(this, (const std::string::value_type *)v12, v13);
    if ((char)v20 < 0) {
      operator delete(__p[0]);
    }
  }
  return this;
}

void sub_2345C4608(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::string::__init_with_size[abi:ne180100]<char const*,char const*>(void *result, char *a2, char *a3, unint64_t a4)
{
  BOOL v4 = result;
  if (a4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (a4 > 0x16)
  {
    uint64_t v8 = (a4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a4 | 7) != 0x17) {
      uint64_t v8 = a4 | 7;
    }
    uint64_t v9 = v8 + 1;
    unint64_t result = operator new(v8 + 1);
    v4[1] = a4;
    v4[2] = v9 | 0x8000000000000000;
    *BOOL v4 = result;
    BOOL v4 = result;
  }
  else
  {
    *((unsigned char *)result + 23) = a4;
  }
  while (a2 != a3)
  {
    char v10 = *a2++;
    *(unsigned char *)BOOL v4 = v10;
    BOOL v4 = (void *)((char *)v4 + 1);
  }
  *(unsigned char *)BOOL v4 = 0;
  return result;
}

void std::vector<std::string>::__swap_out_circular_buffer(std::vector<std::string> *this, std::__split_buffer<std::string> *__v)
{
  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>((uint64_t)&this->__end_cap_, (uint64_t)this->__end_, (uint64_t)this->__end_, (uint64_t)this->__begin_, (uint64_t)this->__begin_, (uint64_t)__v->__begin_, (uint64_t)__v->__begin_);
  __v->__begin_ = v4;
  begin = this->__begin_;
  this->__begin_ = v4;
  __v->__begin_ = begin;
  end = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = end;
  value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 != a5)
  {
    uint64_t v9 = a7;
    do
    {
      long long v10 = *(_OWORD *)(a3 - 24);
      *(void *)(v9 - 8) = *(void *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24;
      *(void *)(a3 - 16) = 0;
      *(void *)(a3 - 8) = 0;
      *(void *)(a3 - 24) = 0;
      v7 -= 24;
      a3 -= 24;
    }
    while (a3 != a5);
    *((void *)&v15 + 1) = v9;
  }
  char v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return a6;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
    v1 += 24;
  }
}

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  if (this->__first_) {
    operator delete(this->__first_);
  }
}

void std::__split_buffer<std::string>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      uint64_t v5 = v2 - 3;
      *(void *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        uint64_t v5 = *(void ***)(a1 + 16);
      }
      uint64_t v2 = v5;
    }
    while (v5 != a2);
  }
}

BOOL std::string_view::ends_with[abi:ne180100](void *a1, void *__s2, size_t a3)
{
  size_t v3 = a1[1];
  return v3 >= a3
      && std::string_view::compare[abi:ne180100](a1, v3 - a3, 0xFFFFFFFFFFFFFFFFLL, __s2, a3) == 0;
}

uint64_t std::string_view::compare[abi:ne180100](void *a1, unint64_t a2, size_t a3, void *__s2, size_t a5)
{
  unint64_t v5 = a1[1];
  BOOL v6 = v5 >= a2;
  size_t v7 = v5 - a2;
  if (!v6) {
    std::__throw_out_of_range[abi:ne180100]("string_view::substr");
  }
  uint64_t v9 = (const void *)(*a1 + a2);
  if (v7 >= a3) {
    size_t v10 = a3;
  }
  else {
    size_t v10 = v7;
  }
  if (a5 >= v10) {
    size_t v11 = v10;
  }
  else {
    size_t v11 = a5;
  }
  LODWORD(result) = memcmp(v9, __s2, v11);
  if (v10 < a5) {
    unsigned int v13 = -1;
  }
  else {
    unsigned int v13 = 1;
  }
  if (v10 == a5) {
    unsigned int v13 = 0;
  }
  if (result) {
    return result;
  }
  else {
    return v13;
  }
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_264BF40C8, MEMORY[0x263F8C068]);
}

void sub_2345C49F0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
  return result;
}

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)v2);
    size_t v3 = **a1;
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

uint64_t std::construct_at[abi:ne180100]<ProcessLibrary,unsigned long long &,std::shared_ptr<SharedLibrary>,ProcessLibrary*>(uint64_t a1, uint64_t *a2, long long *a3)
{
  uint64_t v4 = *a2;
  long long v6 = *a3;
  *(void *)a3 = 0;
  *((void *)a3 + 1) = 0;
  ProcessLibrary::ProcessLibrary(a1, v4, (uint64_t)&v6);
  if (*((void *)&v6 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v6 + 1));
  }
  return a1;
}

void sub_2345C4B2C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<ProcessLibrary>::__init_with_size[abi:ne180100]<ProcessLibrary*,ProcessLibrary*>(void *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    long long v6 = result;
    std::vector<ProcessLibrary>::__vallocate[abi:ne180100](result, a4);
    uint64_t result = (void *)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<ProcessLibrary>,ProcessLibrary*,ProcessLibrary*,ProcessLibrary*>((uint64_t)(v6 + 2), a2, a3, v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_2345C4BAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  std::vector<ProcessLibrary>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<ProcessLibrary>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 59) {
    std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ProcessLibrary>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[32 * v4];
  return result;
}

uint64_t std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<ProcessLibrary>,ProcessLibrary*,ProcessLibrary*,ProcessLibrary*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v10 = a4;
  uint64_t v9 = a4;
  v7[0] = a1;
  v7[1] = &v9;
  v7[2] = &v10;
  if (a2 != a3)
  {
    do
    {
      *(_OWORD *)uint64_t v4 = *(_OWORD *)a2;
      *(void *)(v4 + 16) = *(void *)(a2 + 16);
      uint64_t v5 = *(void *)(a2 + 24);
      *(void *)(v4 + 24) = v5;
      if (v5) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
      }
      v4 += 32;
      a2 += 32;
    }
    while (a2 != a3);
    uint64_t v10 = v4;
  }
  char v8 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<ProcessLibrary>,ProcessLibrary*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v7);
  return v4;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<ProcessLibrary>,ProcessLibrary*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<ProcessLibrary>,ProcessLibrary*>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<ProcessLibrary>,ProcessLibrary*>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 16);
  uint64_t v2 = **(void **)(a1 + 8);
  while (v1 != v2)
  {
    size_t v3 = *(std::__shared_weak_count **)(v1 - 8);
    if (v3) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v3);
    }
    v1 -= 32;
  }
}

uint64_t std::vector<std::unique_ptr<Process>>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::unique_ptr<Process>>,std::reverse_iterator<std::unique_ptr<Process>*>,std::reverse_iterator<std::unique_ptr<Process>*>,std::reverse_iterator<std::unique_ptr<Process>*>>((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<Process>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::unique_ptr<Process>>,std::reverse_iterator<std::unique_ptr<Process>*>,std::reverse_iterator<std::unique_ptr<Process>*>,std::reverse_iterator<std::unique_ptr<Process>*>>(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v16 = a6;
  *((void *)&v16 + 1) = a7;
  long long v15 = v16;
  v13[0] = a1;
  v13[1] = &v15;
  v13[2] = &v16;
  if (a3 == a5)
  {
    uint64_t v11 = a6;
  }
  else
  {
    uint64_t v8 = (void *)(a7 - 8);
    uint64_t v9 = (void *)(a7 - 8);
    do
    {
      uint64_t v10 = *--a3;
      *a3 = 0;
      *v9-- = v10;
      *((void *)&v16 + 1) = v8;
      v7 -= 8;
      uint64_t v8 = v9;
    }
    while (a3 != a5);
    uint64_t v11 = v16;
  }
  char v14 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::unique_ptr<Process>>,std::reverse_iterator<std::unique_ptr<Process>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v13);
  return v11;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::unique_ptr<Process>>,std::reverse_iterator<std::unique_ptr<Process>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::unique_ptr<Process>>,std::reverse_iterator<std::unique_ptr<Process>*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::unique_ptr<Process>>,std::reverse_iterator<std::unique_ptr<Process>*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(uint64_t **)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(uint64_t **)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    uint64_t v3 = *v1;
    uint64_t *v1 = 0;
    if (v3) {
      std::default_delete<Process>::operator()[abi:ne180100]((uint64_t)v1, v3);
    }
    ++v1;
  }
}

uint64_t std::__split_buffer<std::unique_ptr<Process>>::~__split_buffer(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__split_buffer<std::unique_ptr<Process>>::__destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
{
  for (uint64_t i = *(void *)(a1 + 16); i != a2; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 8;
    uint64_t v5 = *(void *)(i - 8);
    *(void *)(i - 8) = 0;
    if (v5) {
      std::default_delete<Process>::operator()[abi:ne180100](i - 8, v5);
    }
  }
}

void DyldKdebugHandler::~DyldKdebugHandler(DyldKdebugHandler *this)
{
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 1619);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table((uint64_t)this + 12904);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table((uint64_t)this + 12864);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table((uint64_t)this + 12824);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table((uint64_t)this + 12784);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table((uint64_t)this + 12744);
  std::__hash_table<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>>>::~__hash_table((uint64_t)this + 12704);
  std::__hash_table<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>>>::~__hash_table((uint64_t)this + 12664);
  std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::~__hash_table((uint64_t)this + 12624);
  std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::~__hash_table((uint64_t)this + 12584);
  std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::~__hash_table((uint64_t)this + 12544);
  std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::~__hash_table((uint64_t)this + 12504);
}

void std::vector<std::unique_ptr<Process>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = (uint64_t **)*a1;
  if (*v2)
  {
    std::vector<std::unique_ptr<Process>>::__base_destruct_at_end[abi:ne180100]((uint64_t)v2, *v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<std::unique_ptr<Process>>::__base_destruct_at_end[abi:ne180100](uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *(uint64_t **)(a1 + 8);
  if (v4 != a2)
  {
    uint64_t v5 = v4 - 1;
    do
    {
      uint64_t v6 = *v5;
      *uint64_t v5 = 0;
      if (v6) {
        std::default_delete<Process>::operator()[abi:ne180100]((uint64_t)v5, v6);
      }
    }
    while (v5-- != a2);
  }
  *(void *)(a1 + 8) = a2;
}

void std::vector<Stackshot>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    uint64_t v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 424;
        std::__destroy_at[abi:ne180100]<Stackshot,0>(v4);
      }
      while ((void *)v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void *std::__hash_table<std::__hash_value_type<UUID,MergedLibrary>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,MergedLibrary>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,MergedLibrary>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,MergedLibrary>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID const&>,std::tuple<>>(uint64_t a1, void *a2, uint64_t a3, _OWORD **a4)
{
  unint64_t v7 = a2[1] ^ *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = a2[1] ^ *a2;
      if (v7 >= v8) {
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
      uint64_t v11 = *v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (v11[2] == *a2 && v11[3] == a2[1]) {
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
          uint64_t v11 = (void *)*v11;
        }
        while (v11);
      }
    }
  }
  uint64_t v11 = operator new(0x58uLL);
  *uint64_t v11 = 0;
  v11[1] = v7;
  *((_OWORD *)v11 + 1) = **a4;
  *((_OWORD *)v11 + 2) = 0u;
  *((_OWORD *)v11 + 3) = 0u;
  *((_OWORD *)v11 + 4) = 0u;
  v11[10] = 0;
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
      size_t v19 = v18;
    }
    else {
      size_t v19 = v17;
    }
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v19);
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
  uint64_t v20 = *(void *)a1;
  uint64_t v21 = *(void **)(*(void *)a1 + 8 * v4);
  if (v21)
  {
    *uint64_t v11 = *v21;
LABEL_42:
    *uint64_t v21 = v11;
    goto LABEL_43;
  }
  *uint64_t v11 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v11;
  *(void *)(v20 + 8 * v4) = a1 + 16;
  if (*v11)
  {
    unint64_t v22 = *(void *)(*v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v22 >= v8) {
        v22 %= v8;
      }
    }
    else
    {
      v22 &= v8 - 1;
    }
    uint64_t v21 = (void *)(*(void *)a1 + 8 * v22);
    goto LABEL_42;
  }
LABEL_43:
  ++*(void *)(a1 + 24);
  return v11;
}

void sub_2345C5390(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__hash_table<LibraryDescription,std::hash<LibraryDescription>,std::equal_to<LibraryDescription>,std::allocator<LibraryDescription>>::__emplace_unique_key_args<LibraryDescription,LibraryDescription const&>(uint64_t a1, LibraryDescription *this, _OWORD *a3)
{
  unint64_t v7 = LibraryDescription::hash(this);
  unint64_t v8 = v7;
  unint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    unint64_t v11 = v10.u32[0];
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v3 = v7;
      if (v7 >= v9) {
        unint64_t v3 = v7 % v9;
      }
    }
    else
    {
      unint64_t v3 = (v9 - 1) & v7;
    }
    unint64_t v12 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v12)
    {
      unsigned int v13 = *v12;
      if (*v12)
      {
        do
        {
          unint64_t v14 = v13[1];
          if (v14 == v8)
          {
            if (LibraryDescription::operator==((uint64_t)(v13 + 2), (uint64_t)this)) {
              return v13;
            }
          }
          else
          {
            if (v11 > 1)
            {
              if (v14 >= v9) {
                v14 %= v9;
              }
            }
            else
            {
              v14 &= v9 - 1;
            }
            if (v14 != v3) {
              break;
            }
          }
          unsigned int v13 = (void *)*v13;
        }
        while (v13);
      }
    }
  }
  unsigned int v13 = operator new(0x40uLL);
  *unsigned int v13 = 0;
  v13[1] = v8;
  long long v15 = a3[1];
  *((_OWORD *)v13 + 1) = *a3;
  *((_OWORD *)v13 + 2) = v15;
  *((_OWORD *)v13 + 3) = a3[2];
  float v16 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v17 = *(float *)(a1 + 32);
  if (!v9 || (float)(v17 * (float)v9) < v16)
  {
    BOOL v18 = 1;
    if (v9 >= 3) {
      BOOL v18 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v19 = v18 | (2 * v9);
    unint64_t v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20) {
      size_t v21 = v20;
    }
    else {
      size_t v21 = v19;
    }
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v21);
    unint64_t v9 = *(void *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9) {
        unint64_t v3 = v8 % v9;
      }
      else {
        unint64_t v3 = v8;
      }
    }
    else
    {
      unint64_t v3 = (v9 - 1) & v8;
    }
  }
  uint64_t v22 = *(void *)a1;
  uint64_t v23 = *(void **)(*(void *)a1 + 8 * v3);
  if (v23)
  {
    *unsigned int v13 = *v23;
LABEL_38:
    *uint64_t v23 = v13;
    goto LABEL_39;
  }
  *unsigned int v13 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v13;
  *(void *)(v22 + 8 * v3) = a1 + 16;
  if (*v13)
  {
    unint64_t v24 = *(void *)(*v13 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v24 >= v9) {
        v24 %= v9;
      }
    }
    else
    {
      v24 &= v9 - 1;
    }
    uint64_t v23 = (void *)(*(void *)a1 + 8 * v24);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v13;
}

void sub_2345C55D4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::__unordered_map_hasher<SharedCacheDescription,std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::hash<SharedCacheDescription>,std::equal_to<SharedCacheDescription>,true>,std::__unordered_map_equal<SharedCacheDescription,std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::equal_to<SharedCacheDescription>,std::hash<SharedCacheDescription>,true>,std::allocator<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>>>::find<SharedCacheDescription>(void *a1, SharedCacheDescription *this)
{
  unint64_t v4 = SharedCacheDescription::hash(this);
  int8x8_t v5 = (int8x8_t)a1[1];
  if (!*(void *)&v5) {
    return 0;
  }
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
  uint8x8_t v10 = *(void **)(*a1 + 8 * v9);
  if (!v10) {
    return 0;
  }
  unint64_t v11 = (void *)*v10;
  if (*v10)
  {
    do
    {
      unint64_t v12 = v11[1];
      if (v12 == v6)
      {
        if (SharedCacheDescription::operator==(v11 + 2, this)) {
          return v11;
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
          return 0;
        }
      }
      unint64_t v11 = (void *)*v11;
    }
    while (v11);
  }
  return v11;
}

void *std::allocate_shared[abi:ne180100]<SharedCache,std::allocator<SharedCache>,SharedCacheDescription &,std::shared_ptr<StringPool> &,void>@<X0>(uint64_t a1@<X1>, void *a2@<X8>)
{
  unint64_t v4 = operator new(0xB8uLL);
  uint64_t result = std::__shared_ptr_emplace<SharedCache>::__shared_ptr_emplace[abi:ne180100]<SharedCacheDescription &,std::shared_ptr<StringPool> &,std::allocator<SharedCache>,0>(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_2345C5734(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__shared_ptr_emplace<SharedCache>::__shared_ptr_emplace[abi:ne180100]<SharedCacheDescription &,std::shared_ptr<StringPool> &,std::allocator<SharedCache>,0>(void *a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_26E761740;
  long long v3 = *(_OWORD *)(a2 + 16);
  v5[0] = *(_OWORD *)a2;
  v5[1] = v3;
  uint64_t v6 = *(void *)(a2 + 32);
  SharedCache::SharedCache(a1 + 3, v5);
  return a1;
}

void sub_2345C57D8(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<SharedCache>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E761740;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<SharedCache>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E761740;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x237DC1B90);
}

void std::__shared_ptr_emplace<SharedCache>::__on_zero_shared(uint64_t a1)
{
}

char *std::__hash_table<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::__unordered_map_hasher<SharedCacheDescription,std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::hash<SharedCacheDescription>,std::equal_to<SharedCacheDescription>,true>,std::__unordered_map_equal<SharedCacheDescription,std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::equal_to<SharedCacheDescription>,std::hash<SharedCacheDescription>,true>,std::allocator<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>>>::__emplace_unique_key_args<SharedCacheDescription,SharedCacheDescription&,std::shared_ptr<SharedCache>>(uint64_t a1, SharedCacheDescription *this, uint64_t a3, uint64_t a4)
{
  unint64_t v9 = SharedCacheDescription::hash(this);
  unint64_t v10 = v9;
  unint64_t v11 = *(void *)(a1 + 8);
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    unint64_t v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v4 = v9;
      if (v9 >= v11) {
        unint64_t v4 = v9 % v11;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v9;
    }
    unint64_t v14 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v14)
    {
      long long v15 = (char *)*v14;
      if (*v14)
      {
        do
        {
          unint64_t v16 = *((void *)v15 + 1);
          if (v16 == v10)
          {
            if (SharedCacheDescription::operator==((void *)v15 + 2, this)) {
              return v15;
            }
          }
          else
          {
            if (v13 > 1)
            {
              if (v16 >= v11) {
                v16 %= v11;
              }
            }
            else
            {
              v16 &= v11 - 1;
            }
            if (v16 != v4) {
              break;
            }
          }
          long long v15 = *(char **)v15;
        }
        while (v15);
      }
    }
  }
  float v17 = (void *)(a1 + 16);
  long long v15 = (char *)operator new(0x48uLL);
  *(void *)long long v15 = 0;
  *((void *)v15 + 1) = v10;
  long long v18 = *(_OWORD *)(a3 + 16);
  *((_OWORD *)v15 + 1) = *(_OWORD *)a3;
  *((_OWORD *)v15 + 2) = v18;
  *((void *)v15 + 6) = *(void *)(a3 + 32);
  *(_OWORD *)(v15 + 56) = *(_OWORD *)a4;
  *(void *)a4 = 0;
  *(void *)(a4 + 8) = 0;
  float v19 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v20 = *(float *)(a1 + 32);
  if (!v11 || (float)(v20 * (float)v11) < v19)
  {
    BOOL v21 = 1;
    if (v11 >= 3) {
      BOOL v21 = (v11 & (v11 - 1)) != 0;
    }
    unint64_t v22 = v21 | (2 * v11);
    unint64_t v23 = vcvtps_u32_f32(v19 / v20);
    if (v22 <= v23) {
      size_t v24 = v23;
    }
    else {
      size_t v24 = v22;
    }
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v24);
    unint64_t v11 = *(void *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11) {
        unint64_t v4 = v10 % v11;
      }
      else {
        unint64_t v4 = v10;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v10;
    }
  }
  uint64_t v25 = *(void *)a1;
  std::string v26 = *(void **)(*(void *)a1 + 8 * v4);
  if (v26)
  {
    *(void *)long long v15 = *v26;
LABEL_38:
    *std::string v26 = v15;
    goto LABEL_39;
  }
  *(void *)long long v15 = *v17;
  *float v17 = v15;
  *(void *)(v25 + 8 * v4) = v17;
  if (*(void *)v15)
  {
    unint64_t v27 = *(void *)(*(void *)v15 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v27 >= v11) {
        v27 %= v11;
      }
    }
    else
    {
      v27 &= v11 - 1;
    }
    std::string v26 = (void *)(*(void *)a1 + 8 * v27);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v15;
}

void sub_2345C5AC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,void *>>>::operator()[abi:ne180100](v11, v10);
  _Unwind_Resume(a1);
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,void *>>>::operator()[abi:ne180100](uint64_t a1, void *__p)
{
  if (*(unsigned char *)(a1 + 8))
  {
    long long v3 = (std::__shared_weak_count *)__p[8];
    if (v3) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v3);
    }
  }
  else if (!__p)
  {
    return;
  }

  operator delete(__p);
}

void *std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::find<UUID>(void *a1, void *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = a2[1] ^ *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = a2[1] ^ *a2;
    if (v3 >= *(void *)&v2) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v5 = (*(void *)&v2 - 1) & v3;
  }
  uint64_t v6 = *(void **)(*a1 + 8 * v5);
  if (!v6) {
    return 0;
  }
  uint64_t result = (void *)*v6;
  if (*v6)
  {
    do
    {
      unint64_t v8 = result[1];
      if (v8 == v3)
      {
        if (result[2] == *a2 && result[3] == a2[1]) {
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
      uint64_t result = (void *)*result;
    }
    while (result);
  }
  return result;
}

void *std::allocate_shared[abi:ne180100]<SharedLibrary,std::allocator<SharedLibrary>,UUID &,std::string_view &,std::shared_ptr<StringPool> &,void>@<X0>(void *a1@<X1>, void *a2@<X2>, uint64_t a3@<X3>, void *a4@<X8>)
{
  unint64_t v8 = operator new(0x128uLL);
  uint64_t result = std::__shared_ptr_emplace<SharedLibrary>::__shared_ptr_emplace[abi:ne180100]<UUID &,std::string_view &,std::shared_ptr<StringPool> &,std::allocator<SharedLibrary>,0>(v8, a1, a2, a3);
  *a4 = v8 + 3;
  a4[1] = v8;
  return result;
}

void sub_2345C5C60(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__shared_ptr_emplace<SharedLibrary>::__shared_ptr_emplace[abi:ne180100]<UUID &,std::string_view &,std::shared_ptr<StringPool> &,std::allocator<SharedLibrary>,0>(void *a1, void *a2, void *a3, uint64_t a4)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_26E761790;
  SharedLibrary::SharedLibrary(a1 + 3, *a2, a2[1], *a3, a3[1], a4);
  return a1;
}

void sub_2345C5CD0(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<SharedLibrary>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E761790;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<SharedLibrary>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E761790;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x237DC1B90);
}

void std::__shared_ptr_emplace<SharedLibrary>::__on_zero_shared(uint64_t a1)
{
}

void *std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::__emplace_unique_key_args<UUID,UUID&,std::shared_ptr<SharedLibrary>>(uint64_t a1, void *a2, _OWORD *a3, long long *a4)
{
  unint64_t v8 = a2[1] ^ *a2;
  unint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v4 = a2[1] ^ *a2;
      if (v8 >= v9) {
        unint64_t v4 = v8 % v9;
      }
    }
    else
    {
      unint64_t v4 = (v9 - 1) & v8;
    }
    uint64_t v11 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v11)
    {
      uint8x8_t v12 = *v11;
      if (*v11)
      {
        do
        {
          unint64_t v13 = v12[1];
          if (v13 == v8)
          {
            if (v12[2] == *a2 && v12[3] == a2[1]) {
              return v12;
            }
          }
          else
          {
            if (v10.u32[0] > 1uLL)
            {
              if (v13 >= v9) {
                v13 %= v9;
              }
            }
            else
            {
              v13 &= v9 - 1;
            }
            if (v13 != v4) {
              break;
            }
          }
          uint8x8_t v12 = (void *)*v12;
        }
        while (v12);
      }
    }
  }
  long long v15 = (void *)(a1 + 16);
  uint8x8_t v12 = operator new(0x30uLL);
  *uint8x8_t v12 = 0;
  v12[1] = v8;
  long long v16 = *a4;
  *((_OWORD *)v12 + 1) = *a3;
  *((_OWORD *)v12 + 2) = v16;
  *(void *)a4 = 0;
  *((void *)a4 + 1) = 0;
  float v17 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v18 = *(float *)(a1 + 32);
  if (!v9 || (float)(v18 * (float)v9) < v17)
  {
    BOOL v19 = 1;
    if (v9 >= 3) {
      BOOL v19 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v20 = v19 | (2 * v9);
    unint64_t v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21) {
      size_t v22 = v21;
    }
    else {
      size_t v22 = v20;
    }
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v22);
    unint64_t v9 = *(void *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9) {
        unint64_t v4 = v8 % v9;
      }
      else {
        unint64_t v4 = v8;
      }
    }
    else
    {
      unint64_t v4 = (v9 - 1) & v8;
    }
  }
  uint64_t v23 = *(void *)a1;
  size_t v24 = *(void **)(*(void *)a1 + 8 * v4);
  if (v24)
  {
    *uint8x8_t v12 = *v24;
LABEL_42:
    *size_t v24 = v12;
    goto LABEL_43;
  }
  *uint8x8_t v12 = *v15;
  *long long v15 = v12;
  *(void *)(v23 + 8 * v4) = v15;
  if (*v12)
  {
    unint64_t v25 = *(void *)(*v12 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v25 >= v9) {
        v25 %= v9;
      }
    }
    else
    {
      v25 &= v9 - 1;
    }
    size_t v24 = (void *)(*(void *)a1 + 8 * v25);
    goto LABEL_42;
  }
LABEL_43:
  ++*(void *)(a1 + 24);
  return v12;
}

void sub_2345C5FA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,void *>>>::operator()[abi:ne180100](v11, v10);
  _Unwind_Resume(a1);
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,void *>>>::operator()[abi:ne180100](uint64_t a1, void *__p)
{
  if (*(unsigned char *)(a1 + 8))
  {
    unint64_t v3 = (std::__shared_weak_count *)__p[5];
    if (v3) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v3);
    }
  }
  else if (!__p)
  {
    return;
  }

  operator delete(__p);
}

void *std::allocate_shared[abi:ne180100]<SharedLibrary,std::allocator<SharedLibrary>,_CSTypeRef &,std::shared_ptr<StringPool> &,void>@<X0>(void *a1@<X1>, uint64_t a2@<X2>, void *a3@<X8>)
{
  uint64_t v6 = operator new(0x128uLL);
  uint64_t result = std::__shared_ptr_emplace<SharedLibrary>::__shared_ptr_emplace[abi:ne180100]<_CSTypeRef &,std::shared_ptr<StringPool> &,std::allocator<SharedLibrary>,0>(v6, a1, a2);
  *a3 = v6 + 3;
  a3[1] = v6;
  return result;
}

void sub_2345C6070(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__shared_ptr_emplace<SharedLibrary>::__shared_ptr_emplace[abi:ne180100]<_CSTypeRef &,std::shared_ptr<StringPool> &,std::allocator<SharedLibrary>,0>(void *a1, void *a2, uint64_t a3)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_26E761790;
  SharedLibrary::SharedLibrary(a1 + 3, *a2, a2[1], a3);
  return a1;
}

void sub_2345C60D8(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

std::once_flag::_State_type *SymbolicationSession::addNewProcessWithDataProvider<Stackshot>(std::once_flag::_State_type *result, int a2, Stackshot *a3)
{
  if ((a2 & 0x80000000) == 0) {
    SymbolicationSession::createProcess<Stackshot>(result, a2, a3);
  }
  return result;
}

void SymbolicationSession::updateProcessWithDataProvider<Stackshot>(std::once_flag::_State_type *a1, int a2, Stackshot *a3)
{
  LODWORD(v16) = a2;
  uint64_t v6 = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::find<int>(a1 + 39, (int *)&v16);
  if (v6)
  {
    uint64_t v7 = v6[3];
    if (v7)
    {
      SymbolicationSession::createProcessLibrariesForPid<Stackshot>(a1, a2, a3, (uint64_t *)&v16);
      if (v17 != v16)
      {
        v15[0] = v16;
        v15[1] = v17;
        v15[2] = v18;
        long long v16 = 0;
        float v17 = 0;
        float v18 = 0;
        Process::addLibraries(v7, v15);
        uint8x8_t v12 = v15;
        std::vector<ProcessLibrary>::__destroy_vector::operator()[abi:ne180100]((void ***)&v12);
      }
      SymbolicationSession::aotImagesForPid<Stackshot>(a3, a2, (uint64_t *)&v12);
      unint64_t v8 = v12;
      if (v13 != v12)
      {
        __std::string p = v12;
        uint8x8_t v10 = v13;
        uint64_t v11 = v14;
        uint8x8_t v12 = 0;
        unint64_t v13 = 0;
        uint64_t v14 = 0;
        Process::addAOTImages(v7, (char **)&__p);
        if (__p)
        {
          uint8x8_t v10 = __p;
          operator delete(__p);
        }
        unint64_t v8 = v12;
      }
      if (v8)
      {
        unint64_t v13 = v8;
        operator delete(v8);
      }
      uint8x8_t v12 = &v16;
      std::vector<ProcessLibrary>::__destroy_vector::operator()[abi:ne180100]((void ***)&v12);
    }
  }
}

void sub_2345C6264(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, char *a12, char *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  if (__p) {
    operator delete(__p);
  }
  if (a12)
  {
    a13 = a12;
    operator delete(a12);
  }
  a12 = &a18;
  std::vector<ProcessLibrary>::__destroy_vector::operator()[abi:ne180100]((void ***)&a12);
  _Unwind_Resume(a1);
}

void SymbolicationSession::createProcess<Stackshot>(std::once_flag::_State_type *a1, int a2, Stackshot *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v7 = a2;
  LODWORD(v8) = a2;
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>((uint64_t)(a1 + 44), (int *)&v8, &v8);
  SymbolicationSession::createProcessLibrariesForPid<Stackshot>(a1, a2, a3, (uint64_t *)&v6);
  operator new();
}

void sub_2345C65C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  if (__p) {
    operator delete(__p);
  }
  if (a12) {
    operator delete(a12);
  }
  uint64_t v19 = a16;
  a16 = 0;
  if (v19) {
    std::default_delete<Process>::operator()[abi:ne180100]((uint64_t)&a16, v19);
  }
  *(void *)(v17 - 104) = &a17;
  std::vector<ProcessLibrary>::__destroy_vector::operator()[abi:ne180100]((void ***)(v17 - 104));
  _Unwind_Resume(a1);
}

uint64_t SymbolicationSession::createProcessLibrariesForPid<Stackshot>@<X0>(std::once_flag::_State_type *a1@<X0>, int a2@<W1>, Stackshot *a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  int pid = a2;
  uint64_t v7 = (uint64_t)(a1 + 18);
  if (!std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::find<int>(a1 + 18, &pid))
  {
    if (proc_pidpath(pid, buffer, 0x400u) >= 1)
    {
      uint64_t v45 = MEMORY[0x263EF8330];
      uint64_t v46 = 0x40000000;
      char v47 = ___ZN20SymbolicationSession28createProcessLibrariesForPidI9StackshotEENSt3__16vectorI14ProcessLibraryNS2_9allocatorIS4_EEEEiRT_b_block_invoke;
      unint64_t v48 = &__block_descriptor_tmp_56;
      uint64_t v49 = a1;
      CSSymbolicatorForeachSymbolicatorWithPath();
    }
    std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>(v7, &pid, &pid);
  }
  SymbolicationSession::collectAllLibraryDescriptionsForPid<Stackshot>(a3, a1, pid, (uint64_t)v43);
  *a4 = 0;
  a4[1] = 0;
  a4[2] = 0;
  long long v8 = v44;
  if (v44)
  {
    while (1)
    {
      uint64_t v9 = v8 + 2;
      uint64_t Address = 0;
      uint64_t Address = LibraryDescription::loadAddress((LibraryDescription *)(v8 + 2));
      *(void *)UUID v51 = LibraryDescription::uuid((LibraryDescription *)(v8 + 2));
      *(void *)&v51[8] = v10;
      if (!std::__hash_table<UUID,std::hash<UUID>,std::equal_to<UUID>,std::allocator<UUID>>::find<UUID>(a1 + 28, v51))
      {
        uint64_t v11 = (__n128 *)std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::find<UUID>(a1 + 1675, v51);
        if (v11) {
          break;
        }
      }
LABEL_7:
      long long v8 = (uint64_t *)*v8;
      if (!v8) {
        return std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table((uint64_t)v43);
      }
    }
    MergedLibrary::path(v11 + 2, &__s1);
    if (v41) {
      goto LABEL_27;
    }
    uint64_t v38 = 0;
    __s = 0;
    int v12 = OSLogLookupPathWithUUID();
    if (__s) {
      int v13 = v12;
    }
    else {
      int v13 = 0;
    }
    if (v13 == 1)
    {
      std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>((std::string *)buffer, &__s);
      std::__fs::filesystem::__status((const std::__fs::filesystem::path *)buffer, 0);
      int v14 = LOBYTE(__p[0]);
      if ((buffer[23] & 0x80000000) != 0) {
        operator delete(*(void **)buffer);
      }
      if (v14 == 2
        && std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::find<UUID>(a1 + 23, v51))
      {
        __p[0] = v51;
        long long v15 = std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID const&>,std::tuple<>>((uint64_t)(a1 + 23), v51, (uint64_t)&std::piecewise_construct, (_OWORD **)__p);
        long long v16 = (char *)(v15 + 4);
        if (*((char *)v15 + 55) < 0) {
          long long v16 = *(char **)v16;
        }
        __s = v16;
      }
      long long v17 = *((_OWORD *)v8 + 2);
      *(_OWORD *)buffer = *v9;
      *(_OWORD *)&buffer[16] = v17;
      long long v53 = *((_OWORD *)v8 + 3);
      size_t v18 = strlen(__s);
      *(void *)&long long v53 = __s;
      *((void *)&v53 + 1) = v18;
      SymbolicationSession::updateBestKnownLibraryDescriptions((SymbolicationSession *)a1, (const LibraryDescription *)buffer);
      if (v41) {
        char v41 = 0;
      }
      __s1.n128_u64[0] = (unint64_t)__s;
      __s1.n128_u64[1] = strlen(__s);
    }
    else
    {
      if (v41) {
        goto LABEL_27;
      }
      if (!std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::find<UUID>(a1 + 23, v51))
      {
        UUID::uuidString((UUID *)v51, (uint64_t)buffer);
        if (buffer[24])
        {
          *(_OWORD *)__std::string p = *(_OWORD *)buffer;
          uint64_t v37 = *(void *)&buffer[16];
        }
        else
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "<NULL_UUID>");
          if (buffer[24] && (buffer[23] & 0x80000000) != 0) {
            operator delete(*(void **)buffer);
          }
        }
        ats_symbolication_log_init();
        std::string v33 = ats_symbolication_log;
        if (os_log_type_enabled((os_log_t)ats_symbolication_log, OS_LOG_TYPE_INFO))
        {
          uint64_t v34 = __p;
          if (v37 < 0) {
            uint64_t v34 = (void **)__p[0];
          }
          *(_DWORD *)buffer = 136315650;
          *(void *)&buffer[4] = v34;
          *(_WORD *)&buffer[12] = 2048;
          *(void *)&buffer[14] = Address;
          *(_WORD *)&buffer[22] = 1024;
          *(_DWORD *)&buffer[24] = pid;
          _os_log_impl(&dword_2345B5000, v33, OS_LOG_TYPE_INFO, "Failed to find path for %s @ 0x%llx (pid=%d)", buffer, 0x1Cu);
        }
LABEL_43:
        std::__hash_table<UUID,std::hash<UUID>,std::equal_to<UUID>,std::allocator<UUID>>::__emplace_unique_key_args<UUID,UUID&>((uint64_t)(a1 + 28), v51, v51);
        if (SHIBYTE(v37) < 0) {
          operator delete(__p[0]);
        }
        goto LABEL_7;
      }
      long long v22 = *((_OWORD *)v8 + 2);
      *(_OWORD *)buffer = *v9;
      *(_OWORD *)&buffer[16] = v22;
      long long v53 = *((_OWORD *)v8 + 3);
      __p[0] = v51;
      uint64_t v23 = std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID const&>,std::tuple<>>((uint64_t)(a1 + 23), v51, (uint64_t)&std::piecewise_construct, (_OWORD **)__p);
      std::string v26 = (void *)v23[4];
      size_t v24 = v23 + 4;
      unint64_t v25 = v26;
      uint64_t v27 = *((unsigned __int8 *)v24 + 23);
      if ((v27 & 0x80u) != 0) {
        uint64_t v27 = v24[1];
      }
      else {
        unint64_t v25 = v24;
      }
      *(void *)&long long v53 = v25;
      *((void *)&v53 + 1) = v27;
      SymbolicationSession::updateBestKnownLibraryDescriptions((SymbolicationSession *)a1, (const LibraryDescription *)buffer);
      __p[0] = v51;
      kcdata_item_t v28 = std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID const&>,std::tuple<>>((uint64_t)(a1 + 23), v51, (uint64_t)&std::piecewise_construct, (_OWORD **)__p);
      unint64_t v31 = v28[4];
      uint64_t v29 = v28 + 4;
      unint64_t v30 = v31;
      unint64_t v32 = *((unsigned __int8 *)v29 + 23);
      if ((v32 & 0x80u) != 0) {
        unint64_t v32 = v29[1];
      }
      else {
        unint64_t v30 = (unint64_t)v29;
      }
      __s1.n128_u64[0] = v30;
      __s1.n128_u64[1] = v32;
    }
    char v41 = 1;
LABEL_27:
    if ((os_variant_has_internal_content() & 1) == 0)
    {
      uint64_t v19 = __s1.n128_u64[0];
LABEL_33:
      SymbolicationSession::sharedLibraryWithUUIDAndPath((uint64_t)a1, *(uint64_t *)v51, *(uint64_t *)&v51[8], v19, __s1.n128_i64[1], buffer);
      std::vector<ProcessLibrary>::emplace_back<unsigned long long &,std::shared_ptr<SharedLibrary>>(a4, &Address, (long long *)buffer);
      if (*(void *)&buffer[8]) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buffer[8]);
      }
      goto LABEL_7;
    }
    if (!v41) {
      std::__throw_bad_optional_access[abi:ne180100]();
    }
    uint64_t v19 = __s1.n128_u64[0];
    if (!deny_nfs_mount_lookup((char *)__s1.n128_u64[0])) {
      goto LABEL_33;
    }
    UUID::uuidString((UUID *)v51, (uint64_t)buffer);
    if (buffer[24])
    {
      *(_OWORD *)__std::string p = *(_OWORD *)buffer;
      uint64_t v37 = *(void *)&buffer[16];
    }
    else
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "<NULL_UUID>");
      if (buffer[24] && (buffer[23] & 0x80000000) != 0) {
        operator delete(*(void **)buffer);
      }
    }
    ats_symbolication_log_init();
    unint64_t v20 = ats_symbolication_log;
    if (os_log_type_enabled((os_log_t)ats_symbolication_log, OS_LOG_TYPE_INFO))
    {
      if (!v41) {
        std::__throw_bad_optional_access[abi:ne180100]();
      }
      unint64_t v21 = __p;
      if (v37 < 0) {
        unint64_t v21 = (void **)__p[0];
      }
      *(_DWORD *)buffer = 136315906;
      *(void *)&buffer[4] = __s1.n128_u64[0];
      *(_WORD *)&buffer[12] = 2080;
      *(void *)&buffer[14] = v21;
      *(_WORD *)&buffer[22] = 2048;
      *(void *)&buffer[24] = Address;
      LOWORD(v53) = 1024;
      *(_DWORD *)((char *)&v53 + 2) = pid;
      _os_log_impl(&dword_2345B5000, v20, OS_LOG_TYPE_INFO, "NFS paths may cause hangs. Denying to process NFS path %s for %s @ 0x%llx (pid=%d)", buffer, 0x26u);
    }
    goto LABEL_43;
  }
  return std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table((uint64_t)v43);
}

void sub_2345C6C90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,void *__p,uint64_t a39,int a40,__int16 a41,char a42,char a43,char a44)
{
  if (a44)
  {
    if (a43 < 0) {
      operator delete(__p);
    }
  }
  std::vector<ProcessLibrary>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table((uint64_t)&a25);
  _Unwind_Resume(a1);
}

void SymbolicationSession::sharedCacheDescriptionForPid<Stackshot>(Stackshot *this@<X2>, int a2@<W1>, uint64_t a3@<X8>)
{
  Stackshot::sharedCacheDescriptionsForPid(this, a2, &v6);
  unint64_t v4 = v6;
  if (v6 == v7)
  {
    *(unsigned char *)a3 = 0;
    *(unsigned char *)(a3 + 4SymbolicationSession::SymbolicationSession((uint64_t)this, 0) = 0;
    if (!v4) {
      return;
    }
  }
  else
  {
    long long v5 = v6[1];
    *(_OWORD *)a3 = *v6;
    *(_OWORD *)(a3 + 16) = v5;
    *(void *)(a3 + 32) = v4[4];
    *(unsigned char *)(a3 + 4SymbolicationSession::SymbolicationSession((uint64_t)this, 0) = 1;
  }
  uint64_t v7 = v4;
  operator delete(v4);
}

void SymbolicationSession::aotSharedCacheDescriptionForPid<Stackshot>(Stackshot *this@<X2>, int a2@<W1>, uint64_t a3@<X8>)
{
  Stackshot::aotSharedCacheDescriptionsForPid(this, a2, &v6);
  unint64_t v4 = v6;
  if (v6 == v7)
  {
    *(unsigned char *)a3 = 0;
    *(unsigned char *)(a3 + 48) = 0;
    if (!v4) {
      return;
    }
  }
  else
  {
    long long v5 = v6[1];
    *(_OWORD *)a3 = *v6;
    *(_OWORD *)(a3 + 16) = v5;
    *(_OWORD *)(a3 + 32) = v4[2];
    *(unsigned char *)(a3 + 48) = 1;
  }
  uint64_t v7 = v4;
  operator delete(v4);
}

void SymbolicationSession::aotImagesForPid<Stackshot>(Stackshot *this@<X2>, int a2@<W1>, uint64_t *a3@<X8>)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  Stackshot::aotImageDescriptionsForPid(this, a2, &v10);
  unint64_t v4 = v10;
  long long v5 = v11;
  if (v10 != v11)
  {
    unint64_t v6 = 0;
    do
    {
      long long v7 = *v4;
      long long v8 = v4[1];
      long long v9 = v4[2];
      uint64_t v15 = *((void *)v4 + 6);
      long long v13 = v8;
      long long v14 = v9;
      long long v12 = v7;
      if (v6 >= a3[2])
      {
        unint64_t v6 = std::vector<AOTImage>::__emplace_back_slow_path<AOTImageDescription &>(a3, (uint64_t)&v12);
      }
      else
      {
        v16[0] = v12;
        v16[1] = v13;
        v16[2] = v14;
        uint64_t v17 = v15;
        AOTImage::AOTImage(v6, v16);
        v6 += 72;
        a3[1] = v6;
      }
      a3[1] = v6;
      unint64_t v4 = (long long *)((char *)v4 + 56);
    }
    while (v4 != v5);
    unint64_t v4 = v10;
  }
  if (v4)
  {
    uint64_t v11 = v4;
    operator delete(v4);
  }
}

void sub_2345C6F2C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  long long v13 = *(void **)v11;
  if (*(void *)v11)
  {
    *(void *)(v11 + 8) = v13;
    operator delete(v13);
  }
  _Unwind_Resume(exception_object);
}

std::string *___ZN20SymbolicationSession28createProcessLibrariesForPidI9StackshotEENSt3__16vectorI14ProcessLibraryNS2_9allocatorIS4_EEEEiRT_b_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  CSSymbolicatorGetSymbolOwner();
  uint64_t result = (std::string *)CSSymbolOwnerGetCFUUIDBytes();
  if (result)
  {
    long long v6 = *(_OWORD *)&result->__r_.__value_.__l.__data_;
    Path = (const std::string::value_type *)CSSymbolOwnerGetPath();
    long long v5 = &v6;
    unint64_t v4 = std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID const&>,std::tuple<>>(v1 + 184, &v6, (uint64_t)&std::piecewise_construct, &v5);
    return std::string::__assign_external((std::string *)(v4 + 4), Path);
  }
  return result;
}

void SymbolicationSession::collectAllLibraryDescriptionsForPid<Stackshot>(Stackshot *this@<X2>, std::once_flag::_State_type *a2@<X0>, int a3@<W1>, uint64_t a4@<X8>)
{
  int v10 = a3;
  *(_OWORD *)a4 = 0u;
  *(_OWORD *)(a4 + 16) = 0u;
  *(_DWORD *)(a4 + 32) = 1065353216;
  if (!a3) {
    SymbolicationSession::collectLiveLibraryDescriptionsForPid(a2, 0);
  }
  SymbolicationSession::collectProviderLibraryDescriptionsForPid<Stackshot>((SymbolicationSession *)a2, a3, this, a4);
  long long v8 = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::find<int>(a2 + 39, &v10);
  if (!v8 || (long long v9 = (Process *)v8[3]) == 0 || v10 && !*(void *)Process::sharedCache(v9)) {
    SymbolicationSession::collectSharedCacheLibraryDescriptionsForPid<Stackshot>((SymbolicationSession *)a2, v10, this, a4);
  }
}

void sub_2345C70E4(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

BOOL deny_nfs_mount_lookup(char *__s1)
{
  uint64_t v2 = 0;
  while (strncmp(__s1, (&off_264BF44C8)[v2], (size_t)(&off_264BF44C8)[v2 + 1]))
  {
    v2 += 2;
    if (v2 == 8) {
      return strstr(__s1, "serve-xcode/mount") != 0;
    }
  }
  return 1;
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  if ((v6 & 0x80000000) != 0)
  {
    unint64_t v10 = this->__r_.__value_.__r.__words[2];
    unint64_t v9 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (v9 < __n)
    {
      std::string::size_type size = this->__r_.__value_.__l.__size_;
      goto LABEL_6;
    }
    unint64_t v6 = HIBYTE(v10);
    uint64_t v7 = (std::string *)this->__r_.__value_.__r.__words[0];
  }
  else
  {
    uint64_t v7 = this;
    if (__n > 0x16)
    {
      std::string::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
      unint64_t v9 = 22;
LABEL_6:
      std::string::__grow_by_and_replace(this, v9, __n - v9, size, 0, size, __n, __s);
      return this;
    }
  }
  if (__n)
  {
    memmove(v7, __s, __n);
    LOBYTE(v6) = *((unsigned char *)&this->__r_.__value_.__s + 23);
  }
  if ((v6 & 0x80) != 0) {
    this->__r_.__value_.__l.__size_ = __n;
  }
  else {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __n & 0x7F;
  }
  v7->__r_.__value_.__s.__data_[__n] = 0;
  return this;
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s)
{
  size_t v4 = strlen(__s);

  return std::string::__assign_external(this, __s, v4);
}

void SymbolicationSession::collectProviderLibraryDescriptionsForPid<Stackshot>(SymbolicationSession *a1, int a2, Stackshot *this, uint64_t a4)
{
  Stackshot::libraryDescriptionsForPid(this, a2, &v8);
  unint64_t v6 = v8;
  uint64_t v7 = v9;
  if (v8 != v9)
  {
    do
    {
      std::__hash_table<LibraryDescription,std::hash<LibraryDescription>,std::equal_to<LibraryDescription>,std::allocator<LibraryDescription>>::__emplace_unique_key_args<LibraryDescription,LibraryDescription const&>(a4, v6, v6);
      SymbolicationSession::updateBestKnownLibraryDescriptions(a1, v6);
      unint64_t v6 = (LibraryDescription *)((char *)v6 + 48);
    }
    while (v6 != v7);
    unint64_t v6 = v8;
  }
  if (v6)
  {
    unint64_t v9 = v6;
    operator delete(v6);
  }
}

void sub_2345C7300(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void SymbolicationSession::collectSharedCacheLibraryDescriptionsForPid<Stackshot>(SymbolicationSession *a1, int a2, Stackshot *a3, uint64_t a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  SymbolicationSession::sharedCacheDescriptionForPid<Stackshot>(a3, a2, (uint64_t)v14);
  if (v16)
  {
    v12[0] = v14[0];
    v12[1] = v14[1];
    uint64_t v13 = v15;
    SymbolicationSession::sharedCacheWithDescription((uint64_t)a1, (SharedCacheDescription *)v12, &v10);
    unint64_t v6 = v10;
    if (v11) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v11);
    }
    if (v6)
    {
      uint64_t v7 = SharedCache::libraryDescriptions(v6);
      long long v8 = *(LibraryDescription **)v7;
      unint64_t v9 = *(LibraryDescription **)(v7 + 8);
      while (v8 != v9)
      {
        std::__hash_table<LibraryDescription,std::hash<LibraryDescription>,std::equal_to<LibraryDescription>,std::allocator<LibraryDescription>>::__emplace_unique_key_args<LibraryDescription,LibraryDescription const&>(a4, v8, v8);
        SymbolicationSession::updateBestKnownLibraryDescriptions(a1, v8);
        long long v8 = (LibraryDescription *)((char *)v8 + 48);
      }
    }
  }
}

void *std::__hash_table<UUID,std::hash<UUID>,std::equal_to<UUID>,std::allocator<UUID>>::find<UUID>(void *a1, void *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = a2[1] ^ *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = a2[1] ^ *a2;
    if (v3 >= *(void *)&v2) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v5 = (*(void *)&v2 - 1) & v3;
  }
  unint64_t v6 = *(void **)(*a1 + 8 * v5);
  if (!v6) {
    return 0;
  }
  uint64_t result = (void *)*v6;
  if (*v6)
  {
    do
    {
      unint64_t v8 = result[1];
      if (v3 == v8)
      {
        if (result[2] == *a2 && result[3] == a2[1]) {
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
      uint64_t result = (void *)*result;
    }
    while (result);
  }
  return result;
}

void *std::__hash_table<UUID,std::hash<UUID>,std::equal_to<UUID>,std::allocator<UUID>>::__emplace_unique_key_args<UUID,UUID&>(uint64_t a1, void *a2, _OWORD *a3)
{
  unint64_t v6 = a2[1] ^ *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = a2[1] ^ *a2;
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
    unint64_t v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      for (uint64_t i = *v9; i; uint64_t i = (void *)*i)
      {
        unint64_t v11 = i[1];
        if (v11 == v6)
        {
          if (i[2] == *a2 && i[3] == a2[1]) {
            return i;
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
      }
    }
  }
  uint64_t i = operator new(0x20uLL);
  void *i = 0;
  i[1] = v6;
  *((_OWORD *)i + 1) = *a3;
  float v13 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v14 = *(float *)(a1 + 32);
  if (!v7 || (float)(v14 * (float)v7) < v13)
  {
    BOOL v15 = 1;
    if (v7 >= 3) {
      BOOL v15 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v16 = v15 | (2 * v7);
    unint64_t v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17) {
      size_t v18 = v17;
    }
    else {
      size_t v18 = v16;
    }
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v18);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7) {
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
  uint64_t v19 = *(void *)a1;
  unint64_t v20 = *(void **)(*(void *)a1 + 8 * v3);
  if (v20)
  {
    void *i = *v20;
LABEL_42:
    *unint64_t v20 = i;
    goto LABEL_43;
  }
  void *i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v19 + 8 * v3) = a1 + 16;
  if (*i)
  {
    unint64_t v21 = *(void *)(*i + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v21 >= v7) {
        v21 %= v7;
      }
    }
    else
    {
      v21 &= v7 - 1;
    }
    unint64_t v20 = (void *)(*(void *)a1 + 8 * v21);
    goto LABEL_42;
  }
LABEL_43:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_2345C76CC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t std::vector<AOTImage>::__emplace_back_slow_path<AOTImageDescription &>(uint64_t *a1, uint64_t a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  unint64_t v3 = (char *)*a1;
  unint64_t v4 = 0x8E38E38E38E38E39 * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0x38E38E38E38E38ELL) {
    std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0x8E38E38E38E38E39 * ((a1[2] - (uint64_t)v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x1C71C71C71C71C7) {
    unint64_t v9 = 0x38E38E38E38E38ELL;
  }
  else {
    unint64_t v9 = v5;
  }
  if (v9)
  {
    unint64_t v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AOTImage>>(v7, v9);
    uint64_t v12 = v11;
  }
  else
  {
    unint64_t v10 = 0;
    uint64_t v12 = 0;
  }
  long long v13 = *(_OWORD *)(a2 + 16);
  v22[0] = *(_OWORD *)a2;
  v22[1] = v13;
  v22[2] = *(_OWORD *)(a2 + 32);
  uint64_t v23 = *(void *)(a2 + 48);
  uint64_t v14 = AOTImage::AOTImage((uint64_t)&v10[72 * v4], v22);
  uint64_t v15 = v14 + 72;
  unint64_t v17 = (char *)*a1;
  unint64_t v16 = (char *)a1[1];
  if (v16 != (char *)*a1)
  {
    do
    {
      *(_OWORD *)(v14 - 72) = *(_OWORD *)(v16 - 72);
      long long v18 = *(_OWORD *)(v16 - 56);
      long long v19 = *(_OWORD *)(v16 - 40);
      long long v20 = *(_OWORD *)(v16 - 24);
      *(void *)(v14 - 8) = *((void *)v16 - 1);
      *(_OWORD *)(v14 - 24) = v20;
      *(_OWORD *)(v14 - 4SymbolicationSession::SymbolicationSession((uint64_t)this, 0) = v19;
      *(_OWORD *)(v14 - 56) = v18;
      v14 -= 72;
      v16 -= 72;
    }
    while (v16 != v17);
    unint64_t v16 = (char *)*a1;
  }
  *a1 = v14;
  a1[1] = v15;
  a1[2] = (uint64_t)&v10[72 * v12];
  if (v16) {
    operator delete(v16);
  }
  return v15;
}

void sub_2345C7874(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__call_once_proxy[abi:ne180100]<std::tuple<SymbolicationSession::collectLiveLibraryDescriptionsForPid(int,std::unordered_set<LibraryDescription> &)::$_0 &&>>()
{
  ats_symbolication_log_init();
  uint64_t v0 = ats_symbolication_log;
  if (os_log_type_enabled((os_log_t)ats_symbolication_log, OS_LOG_TYPE_DEBUG)) {
    std::__call_once_proxy[abi:ne180100]<std::tuple<SymbolicationSession::collectLiveLibraryDescriptionsForPid(int,std::unordered_set<LibraryDescription> &)::$_0 &&>>(v0);
  }
  return CSSymbolicatorForeachSymbolOwnerAtTime();
}

void ___ZZN20SymbolicationSession36collectLiveLibraryDescriptionsForPidEiRNSt3__113unordered_setI18LibraryDescriptionNS0_4hashIS2_EENS0_8equal_toIS2_EENS0_9allocatorIS2_EEEEENK3__0clEv_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  SymbolicationSession::sharedLibraryWithCSSymbolOwner(*(void *)(a1 + 32), a2, a3, &v4);
  unint64_t v3 = v5;
  if (v5)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

void std::default_delete<Process>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    unint64_t v3 = *(std::__shared_weak_count **)(a2 + 136);
    if (v3) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v3);
    }
    uint64_t v4 = *(std::__shared_weak_count **)(a2 + 120);
    if (v4) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
    unint64_t v5 = *(void **)(a2 + 32);
    if (v5)
    {
      *(void *)(a2 + 4SymbolicationSession::SymbolicationSession((uint64_t)this, 0) = v5;
      operator delete(v5);
    }
    unint64_t v6 = (void **)(a2 + 8);
    std::vector<ProcessLibrary>::__destroy_vector::operator()[abi:ne180100](&v6);
    MEMORY[0x237DC1B90](a2, 0x10A0C40DD46570ALL);
  }
}

std::once_flag::_State_type *SymbolicationSession::addNewProcessWithDataProvider<DyldKdebugHandler>(std::once_flag::_State_type *result, int a2, DyldKdebugHandler *a3)
{
  if ((a2 & 0x80000000) == 0) {
    SymbolicationSession::createProcess<DyldKdebugHandler>(result, a2, a3);
  }
  return result;
}

void SymbolicationSession::updateProcessWithDataProvider<DyldKdebugHandler>(std::once_flag::_State_type *a1, int a2, DyldKdebugHandler *a3)
{
  LODWORD(v16) = a2;
  unint64_t v6 = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::find<int>(a1 + 39, (int *)&v16);
  if (v6)
  {
    uint64_t v7 = v6[3];
    if (v7)
    {
      SymbolicationSession::createProcessLibrariesForPid<DyldKdebugHandler>(a1, a2, a3, (uint64_t *)&v16);
      if (v17 != v16)
      {
        v15[0] = v16;
        v15[1] = v17;
        v15[2] = v18;
        unint64_t v16 = 0;
        unint64_t v17 = 0;
        long long v18 = 0;
        Process::addLibraries(v7, v15);
        uint64_t v12 = v15;
        std::vector<ProcessLibrary>::__destroy_vector::operator()[abi:ne180100]((void ***)&v12);
      }
      SymbolicationSession::aotImagesForPid<DyldKdebugHandler>(a3, a2, (uint64_t *)&v12);
      unint64_t v8 = v12;
      if (v13 != v12)
      {
        __std::string p = v12;
        unint64_t v10 = v13;
        uint64_t v11 = v14;
        uint64_t v12 = 0;
        long long v13 = 0;
        uint64_t v14 = 0;
        Process::addAOTImages(v7, (char **)&__p);
        if (__p)
        {
          unint64_t v10 = __p;
          operator delete(__p);
        }
        unint64_t v8 = v12;
      }
      if (v8)
      {
        long long v13 = v8;
        operator delete(v8);
      }
      uint64_t v12 = &v16;
      std::vector<ProcessLibrary>::__destroy_vector::operator()[abi:ne180100]((void ***)&v12);
    }
  }
}

void sub_2345C7B88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, char *a12, char *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  if (__p) {
    operator delete(__p);
  }
  if (a12)
  {
    a13 = a12;
    operator delete(a12);
  }
  a12 = &a18;
  std::vector<ProcessLibrary>::__destroy_vector::operator()[abi:ne180100]((void ***)&a12);
  _Unwind_Resume(a1);
}

void SymbolicationSession::createProcess<DyldKdebugHandler>(std::once_flag::_State_type *a1, int a2, DyldKdebugHandler *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v7 = a2;
  LODWORD(v8) = a2;
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>((uint64_t)(a1 + 44), (int *)&v8, &v8);
  SymbolicationSession::createProcessLibrariesForPid<DyldKdebugHandler>(a1, a2, a3, (uint64_t *)&v6);
  operator new();
}

void sub_2345C7EEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  if (__p) {
    operator delete(__p);
  }
  if (a12) {
    operator delete(a12);
  }
  uint64_t v19 = a16;
  a16 = 0;
  if (v19) {
    std::default_delete<Process>::operator()[abi:ne180100]((uint64_t)&a16, v19);
  }
  *(void *)(v17 - 104) = &a17;
  std::vector<ProcessLibrary>::__destroy_vector::operator()[abi:ne180100]((void ***)(v17 - 104));
  _Unwind_Resume(a1);
}

uint64_t SymbolicationSession::createProcessLibrariesForPid<DyldKdebugHandler>@<X0>(std::once_flag::_State_type *a1@<X0>, int a2@<W1>, DyldKdebugHandler *a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  int pid = a2;
  uint64_t v7 = (uint64_t)(a1 + 18);
  if (!std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::find<int>(a1 + 18, &pid))
  {
    if (proc_pidpath(pid, buffer, 0x400u) >= 1)
    {
      uint64_t v45 = MEMORY[0x263EF8330];
      uint64_t v46 = 0x40000000;
      char v47 = ___ZN20SymbolicationSession28createProcessLibrariesForPidI17DyldKdebugHandlerEENSt3__16vectorI14ProcessLibraryNS2_9allocatorIS4_EEEEiRT_b_block_invoke;
      unint64_t v48 = &__block_descriptor_tmp_65;
      uint64_t v49 = a1;
      CSSymbolicatorForeachSymbolicatorWithPath();
    }
    std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>(v7, &pid, &pid);
  }
  SymbolicationSession::collectAllLibraryDescriptionsForPid<DyldKdebugHandler>(a3, a1, pid, (uint64_t)v43);
  *a4 = 0;
  a4[1] = 0;
  a4[2] = 0;
  long long v8 = v44;
  if (v44)
  {
    while (1)
    {
      uint64_t v9 = v8 + 2;
      uint64_t Address = 0;
      uint64_t Address = LibraryDescription::loadAddress((LibraryDescription *)(v8 + 2));
      *(void *)UUID v51 = LibraryDescription::uuid((LibraryDescription *)(v8 + 2));
      *(void *)&v51[8] = v10;
      if (!std::__hash_table<UUID,std::hash<UUID>,std::equal_to<UUID>,std::allocator<UUID>>::find<UUID>(a1 + 28, v51))
      {
        uint64_t v11 = (__n128 *)std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::find<UUID>(a1 + 1675, v51);
        if (v11) {
          break;
        }
      }
LABEL_7:
      long long v8 = (uint64_t *)*v8;
      if (!v8) {
        return std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table((uint64_t)v43);
      }
    }
    MergedLibrary::path(v11 + 2, &__s1);
    if (v41) {
      goto LABEL_27;
    }
    uint64_t v38 = 0;
    __s = 0;
    int v12 = OSLogLookupPathWithUUID();
    if (__s) {
      int v13 = v12;
    }
    else {
      int v13 = 0;
    }
    if (v13 == 1)
    {
      std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>((std::string *)buffer, &__s);
      std::__fs::filesystem::__status((const std::__fs::filesystem::path *)buffer, 0);
      int v14 = LOBYTE(__p[0]);
      if ((buffer[23] & 0x80000000) != 0) {
        operator delete(*(void **)buffer);
      }
      if (v14 == 2
        && std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::find<UUID>(a1 + 23, v51))
      {
        __p[0] = v51;
        uint64_t v15 = std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID const&>,std::tuple<>>((uint64_t)(a1 + 23), v51, (uint64_t)&std::piecewise_construct, (_OWORD **)__p);
        unint64_t v16 = (char *)(v15 + 4);
        if (*((char *)v15 + 55) < 0) {
          unint64_t v16 = *(char **)v16;
        }
        __s = v16;
      }
      long long v17 = *((_OWORD *)v8 + 2);
      *(_OWORD *)buffer = *v9;
      *(_OWORD *)&buffer[16] = v17;
      long long v53 = *((_OWORD *)v8 + 3);
      size_t v18 = strlen(__s);
      *(void *)&long long v53 = __s;
      *((void *)&v53 + 1) = v18;
      SymbolicationSession::updateBestKnownLibraryDescriptions((SymbolicationSession *)a1, (const LibraryDescription *)buffer);
      if (v41) {
        char v41 = 0;
      }
      __s1.n128_u64[0] = (unint64_t)__s;
      __s1.n128_u64[1] = strlen(__s);
    }
    else
    {
      if (v41) {
        goto LABEL_27;
      }
      if (!std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::find<UUID>(a1 + 23, v51))
      {
        UUID::uuidString((UUID *)v51, (uint64_t)buffer);
        if (buffer[24])
        {
          *(_OWORD *)__std::string p = *(_OWORD *)buffer;
          uint64_t v37 = *(void *)&buffer[16];
        }
        else
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "<NULL_UUID>");
          if (buffer[24] && (buffer[23] & 0x80000000) != 0) {
            operator delete(*(void **)buffer);
          }
        }
        ats_symbolication_log_init();
        std::string v33 = ats_symbolication_log;
        if (os_log_type_enabled((os_log_t)ats_symbolication_log, OS_LOG_TYPE_INFO))
        {
          uint64_t v34 = __p;
          if (v37 < 0) {
            uint64_t v34 = (void **)__p[0];
          }
          *(_DWORD *)buffer = 136315650;
          *(void *)&buffer[4] = v34;
          *(_WORD *)&buffer[12] = 2048;
          *(void *)&buffer[14] = Address;
          *(_WORD *)&buffer[22] = 1024;
          *(_DWORD *)&buffer[24] = pid;
          _os_log_impl(&dword_2345B5000, v33, OS_LOG_TYPE_INFO, "Failed to find path for %s @ 0x%llx (pid=%d)", buffer, 0x1Cu);
        }
LABEL_43:
        std::__hash_table<UUID,std::hash<UUID>,std::equal_to<UUID>,std::allocator<UUID>>::__emplace_unique_key_args<UUID,UUID&>((uint64_t)(a1 + 28), v51, v51);
        if (SHIBYTE(v37) < 0) {
          operator delete(__p[0]);
        }
        goto LABEL_7;
      }
      long long v22 = *((_OWORD *)v8 + 2);
      *(_OWORD *)buffer = *v9;
      *(_OWORD *)&buffer[16] = v22;
      long long v53 = *((_OWORD *)v8 + 3);
      __p[0] = v51;
      uint64_t v23 = std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID const&>,std::tuple<>>((uint64_t)(a1 + 23), v51, (uint64_t)&std::piecewise_construct, (_OWORD **)__p);
      std::string v26 = (void *)v23[4];
      uint64_t v24 = v23 + 4;
      unint64_t v25 = v26;
      uint64_t v27 = *((unsigned __int8 *)v24 + 23);
      if ((v27 & 0x80u) != 0) {
        uint64_t v27 = v24[1];
      }
      else {
        unint64_t v25 = v24;
      }
      *(void *)&long long v53 = v25;
      *((void *)&v53 + 1) = v27;
      SymbolicationSession::updateBestKnownLibraryDescriptions((SymbolicationSession *)a1, (const LibraryDescription *)buffer);
      __p[0] = v51;
      kcdata_item_t v28 = std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID const&>,std::tuple<>>((uint64_t)(a1 + 23), v51, (uint64_t)&std::piecewise_construct, (_OWORD **)__p);
      unint64_t v31 = v28[4];
      uint64_t v29 = v28 + 4;
      unint64_t v30 = v31;
      unint64_t v32 = *((unsigned __int8 *)v29 + 23);
      if ((v32 & 0x80u) != 0) {
        unint64_t v32 = v29[1];
      }
      else {
        unint64_t v30 = (unint64_t)v29;
      }
      __s1.n128_u64[0] = v30;
      __s1.n128_u64[1] = v32;
    }
    char v41 = 1;
LABEL_27:
    if ((os_variant_has_internal_content() & 1) == 0)
    {
      uint64_t v19 = __s1.n128_u64[0];
LABEL_33:
      SymbolicationSession::sharedLibraryWithUUIDAndPath((uint64_t)a1, *(uint64_t *)v51, *(uint64_t *)&v51[8], v19, __s1.n128_i64[1], buffer);
      std::vector<ProcessLibrary>::emplace_back<unsigned long long &,std::shared_ptr<SharedLibrary>>(a4, &Address, (long long *)buffer);
      if (*(void *)&buffer[8]) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buffer[8]);
      }
      goto LABEL_7;
    }
    if (!v41) {
      std::__throw_bad_optional_access[abi:ne180100]();
    }
    uint64_t v19 = __s1.n128_u64[0];
    if (!deny_nfs_mount_lookup((char *)__s1.n128_u64[0])) {
      goto LABEL_33;
    }
    UUID::uuidString((UUID *)v51, (uint64_t)buffer);
    if (buffer[24])
    {
      *(_OWORD *)__std::string p = *(_OWORD *)buffer;
      uint64_t v37 = *(void *)&buffer[16];
    }
    else
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "<NULL_UUID>");
      if (buffer[24] && (buffer[23] & 0x80000000) != 0) {
        operator delete(*(void **)buffer);
      }
    }
    ats_symbolication_log_init();
    long long v20 = ats_symbolication_log;
    if (os_log_type_enabled((os_log_t)ats_symbolication_log, OS_LOG_TYPE_INFO))
    {
      if (!v41) {
        std::__throw_bad_optional_access[abi:ne180100]();
      }
      unint64_t v21 = __p;
      if (v37 < 0) {
        unint64_t v21 = (void **)__p[0];
      }
      *(_DWORD *)buffer = 136315906;
      *(void *)&buffer[4] = __s1.n128_u64[0];
      *(_WORD *)&buffer[12] = 2080;
      *(void *)&buffer[14] = v21;
      *(_WORD *)&buffer[22] = 2048;
      *(void *)&buffer[24] = Address;
      LOWORD(v53) = 1024;
      *(_DWORD *)((char *)&v53 + 2) = pid;
      _os_log_impl(&dword_2345B5000, v20, OS_LOG_TYPE_INFO, "NFS paths may cause hangs. Denying to process NFS path %s for %s @ 0x%llx (pid=%d)", buffer, 0x26u);
    }
    goto LABEL_43;
  }
  return std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table((uint64_t)v43);
}

void sub_2345C85B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,void *__p,uint64_t a39,int a40,__int16 a41,char a42,char a43,char a44)
{
  if (a44)
  {
    if (a43 < 0) {
      operator delete(__p);
    }
  }
  std::vector<ProcessLibrary>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table((uint64_t)&a25);
  _Unwind_Resume(a1);
}

void SymbolicationSession::sharedCacheDescriptionForPid<DyldKdebugHandler>(DyldKdebugHandler *this@<X2>, int a2@<W1>, uint64_t a3@<X8>)
{
  DyldKdebugHandler::sharedCacheDescriptionsForPid(this, a2, &v6);
  uint64_t v4 = v6;
  if (v6 == v7)
  {
    *(unsigned char *)a3 = 0;
    *(unsigned char *)(a3 + 4SymbolicationSession::SymbolicationSession((uint64_t)this, 0) = 0;
    if (!v4) {
      return;
    }
  }
  else
  {
    long long v5 = v6[1];
    *(_OWORD *)a3 = *v6;
    *(_OWORD *)(a3 + 16) = v5;
    *(void *)(a3 + 32) = v4[4];
    *(unsigned char *)(a3 + 4SymbolicationSession::SymbolicationSession((uint64_t)this, 0) = 1;
  }
  uint64_t v7 = v4;
  operator delete(v4);
}

void SymbolicationSession::aotSharedCacheDescriptionForPid<DyldKdebugHandler>(DyldKdebugHandler *this@<X2>, int a2@<W1>, uint64_t a3@<X8>)
{
  DyldKdebugHandler::aotSharedCacheDescriptionsForPid(this, a2, &v6);
  uint64_t v4 = v6;
  if (v6 == v7)
  {
    *(unsigned char *)a3 = 0;
    *(unsigned char *)(a3 + 48) = 0;
    if (!v4) {
      return;
    }
  }
  else
  {
    long long v5 = v6[1];
    *(_OWORD *)a3 = *v6;
    *(_OWORD *)(a3 + 16) = v5;
    *(_OWORD *)(a3 + 32) = v4[2];
    *(unsigned char *)(a3 + 48) = 1;
  }
  uint64_t v7 = v4;
  operator delete(v4);
}

void SymbolicationSession::aotImagesForPid<DyldKdebugHandler>(DyldKdebugHandler *this@<X2>, int a2@<W1>, uint64_t *a3@<X8>)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  DyldKdebugHandler::aotImageDescriptionsForPid((uint64_t *)this, a2, &v10);
  uint64_t v4 = v10;
  long long v5 = v11;
  if (v10 != v11)
  {
    unint64_t v6 = 0;
    do
    {
      long long v7 = *v4;
      long long v8 = v4[1];
      long long v9 = v4[2];
      uint64_t v15 = *((void *)v4 + 6);
      long long v13 = v8;
      long long v14 = v9;
      long long v12 = v7;
      if (v6 >= a3[2])
      {
        unint64_t v6 = std::vector<AOTImage>::__emplace_back_slow_path<AOTImageDescription &>(a3, (uint64_t)&v12);
      }
      else
      {
        v16[0] = v12;
        v16[1] = v13;
        v16[2] = v14;
        uint64_t v17 = v15;
        AOTImage::AOTImage(v6, v16);
        v6 += 72;
        a3[1] = v6;
      }
      a3[1] = v6;
      uint64_t v4 = (long long *)((char *)v4 + 56);
    }
    while (v4 != v5);
    uint64_t v4 = v10;
  }
  if (v4)
  {
    uint64_t v11 = v4;
    operator delete(v4);
  }
}

void sub_2345C8850(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  long long v13 = *(void **)v11;
  if (*(void *)v11)
  {
    *(void *)(v11 + 8) = v13;
    operator delete(v13);
  }
  _Unwind_Resume(exception_object);
}

std::string *___ZN20SymbolicationSession28createProcessLibrariesForPidI17DyldKdebugHandlerEENSt3__16vectorI14ProcessLibraryNS2_9allocatorIS4_EEEEiRT_b_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  CSSymbolicatorGetSymbolOwner();
  uint64_t result = (std::string *)CSSymbolOwnerGetCFUUIDBytes();
  if (result)
  {
    long long v6 = *(_OWORD *)&result->__r_.__value_.__l.__data_;
    Path = (const std::string::value_type *)CSSymbolOwnerGetPath();
    long long v5 = &v6;
    uint64_t v4 = std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID const&>,std::tuple<>>(v1 + 184, &v6, (uint64_t)&std::piecewise_construct, &v5);
    return std::string::__assign_external((std::string *)(v4 + 4), Path);
  }
  return result;
}

void SymbolicationSession::collectAllLibraryDescriptionsForPid<DyldKdebugHandler>(DyldKdebugHandler *this@<X2>, std::once_flag::_State_type *a2@<X0>, unsigned int a3@<W1>, uint64_t a4@<X8>)
{
  unsigned int v10 = a3;
  *(_OWORD *)a4 = 0u;
  *(_OWORD *)(a4 + 16) = 0u;
  *(_DWORD *)(a4 + 32) = 1065353216;
  if (!a3) {
    SymbolicationSession::collectLiveLibraryDescriptionsForPid(a2, 0);
  }
  SymbolicationSession::collectProviderLibraryDescriptionsForPid<DyldKdebugHandler>((SymbolicationSession *)a2, a3, this, a4);
  long long v8 = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::find<int>(a2 + 39, (int *)&v10);
  if (!v8 || (long long v9 = (Process *)v8[3]) == 0 || v10 && !*(void *)Process::sharedCache(v9)) {
    SymbolicationSession::collectSharedCacheLibraryDescriptionsForPid<DyldKdebugHandler>((SymbolicationSession *)a2, v10, this, a4);
  }
}

void sub_2345C8A08(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

void SymbolicationSession::collectProviderLibraryDescriptionsForPid<DyldKdebugHandler>(SymbolicationSession *a1, unsigned int a2, DyldKdebugHandler *this, uint64_t a4)
{
  DyldKdebugHandler::libraryDescriptionsForPid(this, a2, &v8);
  long long v6 = v8;
  uint64_t v7 = v9;
  if (v8 != v9)
  {
    do
    {
      std::__hash_table<LibraryDescription,std::hash<LibraryDescription>,std::equal_to<LibraryDescription>,std::allocator<LibraryDescription>>::__emplace_unique_key_args<LibraryDescription,LibraryDescription const&>(a4, v6, v6);
      SymbolicationSession::updateBestKnownLibraryDescriptions(a1, v6);
      long long v6 = (LibraryDescription *)((char *)v6 + 64);
    }
    while (v6 != v7);
    long long v6 = v8;
  }
  if (v6)
  {
    long long v9 = v6;
    operator delete(v6);
  }
}

void sub_2345C8AA8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void SymbolicationSession::collectSharedCacheLibraryDescriptionsForPid<DyldKdebugHandler>(SymbolicationSession *a1, int a2, DyldKdebugHandler *a3, uint64_t a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  SymbolicationSession::sharedCacheDescriptionForPid<DyldKdebugHandler>(a3, a2, (uint64_t)v14);
  if (v16)
  {
    v12[0] = v14[0];
    v12[1] = v14[1];
    uint64_t v13 = v15;
    SymbolicationSession::sharedCacheWithDescription((uint64_t)a1, (SharedCacheDescription *)v12, &v10);
    long long v6 = v10;
    if (v11) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v11);
    }
    if (v6)
    {
      uint64_t v7 = SharedCache::libraryDescriptions(v6);
      long long v8 = *(LibraryDescription **)v7;
      long long v9 = *(LibraryDescription **)(v7 + 8);
      while (v8 != v9)
      {
        std::__hash_table<LibraryDescription,std::hash<LibraryDescription>,std::equal_to<LibraryDescription>,std::allocator<LibraryDescription>>::__emplace_unique_key_args<LibraryDescription,LibraryDescription const&>(a4, v8, v8);
        SymbolicationSession::updateBestKnownLibraryDescriptions(a1, v8);
        long long v8 = (LibraryDescription *)((char *)v8 + 48);
      }
    }
  }
}

const void **ScopeGuard<void const*,ScopeGuardPolicy<void const*>>::~ScopeGuard(const void **a1)
{
  int8x8_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);

  JUMPOUT(0x237DC1B90);
}

void *std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID const&>,std::tuple<>>(uint64_t a1, void *a2, uint64_t a3, _OWORD **a4)
{
  unint64_t v7 = a2[1] ^ *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = a2[1] ^ *a2;
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
    unsigned int v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      for (uint64_t i = *v10; i; uint64_t i = (void *)*i)
      {
        unint64_t v12 = i[1];
        if (v12 == v7)
        {
          if (i[2] == *a2 && i[3] == a2[1]) {
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
  long long v14 = (void *)(a1 + 16);
  uint64_t i = operator new(0x38uLL);
  void *i = 0;
  i[1] = v7;
  *((_OWORD *)i + 1) = **a4;
  i[5] = 0;
  i[6] = 0;
  i[4] = 0;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v16 = *(float *)(a1 + 32);
  if (!v8 || (float)(v16 * (float)v8) < v15)
  {
    BOOL v17 = 1;
    if (v8 >= 3) {
      BOOL v17 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v8);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v20);
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
  uint64_t v21 = *(void *)a1;
  long long v22 = *(void **)(*(void *)a1 + 8 * v4);
  if (v22)
  {
    void *i = *v22;
LABEL_42:
    void *v22 = i;
    goto LABEL_43;
  }
  void *i = *v14;
  *long long v14 = i;
  *(void *)(v21 + 8 * v4) = v14;
  if (*i)
  {
    unint64_t v23 = *(void *)(*i + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v23 >= v8) {
        v23 %= v8;
      }
    }
    else
    {
      v23 &= v8 - 1;
    }
    long long v22 = (void *)(*(void *)a1 + 8 * v23);
    goto LABEL_42;
  }
LABEL_43:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_2345C8EA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<UUID,std::string>,void *>>>::operator()[abi:ne180100](v11, v10);
  _Unwind_Resume(a1);
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<UUID,std::string>,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
{
  if (*(unsigned char *)(a1 + 8))
  {
    if (*((char *)__p + 55) < 0) {
      operator delete(__p[4]);
    }
  }
  else if (!__p)
  {
    return;
  }

  operator delete(__p);
}

void *std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__emplace_unique_key_args<UUID,UUID const&,std::string_view>(uint64_t a1, void *a2, _OWORD *a3, uint64_t a4)
{
  unint64_t v6 = a2[1] ^ *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v4 = a2[1] ^ *a2;
      if (v6 >= v7) {
        unint64_t v4 = v6 % v7;
      }
    }
    else
    {
      unint64_t v4 = (v7 - 1) & v6;
    }
    uint8x8_t v9 = *(void **)(*(void *)a1 + 8 * v4);
    if (v9)
    {
      uint64_t result = (void *)*v9;
      if (*v9)
      {
        do
        {
          unint64_t v11 = result[1];
          if (v11 == v6)
          {
            if (result[2] == *a2 && result[3] == a2[1]) {
              return result;
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
            if (v11 != v4) {
              break;
            }
          }
          uint64_t result = (void *)*result;
        }
        while (result);
      }
    }
  }
  std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__construct_node_hash<UUID const&,std::string_view>(a1, a2[1] ^ *a2, a3, a4, (uint64_t)&v21);
  float v13 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v14 = *(float *)(a1 + 32);
  if (!v7 || (float)(v14 * (float)v7) < v13)
  {
    BOOL v15 = 1;
    if (v7 >= 3) {
      BOOL v15 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v16 = v15 | (2 * v7);
    unint64_t v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17) {
      size_t v18 = v17;
    }
    else {
      size_t v18 = v16;
    }
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v18);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7) {
        unint64_t v4 = v6 % v7;
      }
      else {
        unint64_t v4 = v6;
      }
    }
    else
    {
      unint64_t v4 = (v7 - 1) & v6;
    }
  }
  unint64_t v19 = *(void **)(*(void *)a1 + 8 * v4);
  if (v19)
  {
    *uint64_t v21 = *v19;
    *unint64_t v19 = v21;
  }
  else
  {
    *uint64_t v21 = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v21;
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*v21)
    {
      unint64_t v20 = *(void *)(*v21 + 8);
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
      *(void *)(*(void *)a1 + 8 * v2SymbolicationSession::SymbolicationSession((uint64_t)this, 0) = v21;
    }
  }
  uint64_t result = v21;
  ++*(void *)(a1 + 24);
  return result;
}

void sub_2345C913C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<UUID,std::string>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__construct_node_hash<UUID const&,std::string_view>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9 = a1 + 16;
  unsigned int v10 = operator new(0x38uLL);
  *(void *)a5 = v10;
  *(void *)(a5 + 8) = v9;
  *(unsigned char *)(a5 + 16) = 0;
  *unsigned int v10 = 0;
  v10[1] = a2;
  uint64_t result = std::pair<UUID const,std::string>::pair[abi:ne180100]<UUID const&,std::string_view,0>((uint64_t)(v10 + 2), a3, a4);
  *(unsigned char *)(a5 + 16) = 1;
  return result;
}

void sub_2345C91E0(_Unwind_Exception *a1)
{
  void *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<UUID,std::string>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t std::pair<UUID const,std::string>::pair[abi:ne180100]<UUID const&,std::string_view,0>(uint64_t a1, _OWORD *a2, uint64_t a3)
{
  *(_OWORD *)a1 = *a2;
  uint64_t v3 = (void *)(a1 + 16);
  size_t v4 = *(void *)(a3 + 8);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  unint64_t v6 = *(const void **)a3;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v3 = operator new(v7 + 1);
    *(void *)(a1 + 24) = v4;
    *(void *)(a1 + 32) = v8 | 0x8000000000000000;
    *(void *)(a1 + 16) = v3;
  }
  else
  {
    *(unsigned char *)(a1 + 39) = v4;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v3, v6, v4);
LABEL_9:
  *((unsigned char *)v3 + v4) = 0;
  return a1;
}

uint64_t *std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__erase_unique<UUID>(void *a1, void *a2)
{
  uint64_t result = std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::find<UUID>(a1, a2);
  if (result)
  {
    std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::erase(a1, result);
    return (uint64_t *)1;
  }
  return result;
}

uint64_t std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::erase(void *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::remove(a1, a2, (uint64_t)&__p);
  uint64_t v3 = (void **)__p;
  __std::string p = 0;
  if (v3) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<UUID,std::string>,void *>>>::operator()[abi:ne180100]((uint64_t)&v6, v3);
  }
  return v2;
}

void *std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::remove@<X0>(void *result@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
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
  void *v7 = v10;
  *a2 = 0;
  --result[3];
  *(void *)a3 = a2;
  *(void *)(a3 + 8) = result + 2;
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

void *std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__emplace_unique_key_args<UUID,UUID&,std::string&>(uint64_t a1, void *a2, _OWORD *a3, uint64_t a4)
{
  unint64_t v6 = a2[1] ^ *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v4 = a2[1] ^ *a2;
      if (v6 >= v7) {
        unint64_t v4 = v6 % v7;
      }
    }
    else
    {
      unint64_t v4 = (v7 - 1) & v6;
    }
    unint64_t v9 = *(void **)(*(void *)a1 + 8 * v4);
    if (v9)
    {
      uint64_t result = (void *)*v9;
      if (*v9)
      {
        do
        {
          unint64_t v11 = result[1];
          if (v11 == v6)
          {
            if (result[2] == *a2 && result[3] == a2[1]) {
              return result;
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
            if (v11 != v4) {
              break;
            }
          }
          uint64_t result = (void *)*result;
        }
        while (result);
      }
    }
  }
  std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__construct_node_hash<UUID&,std::string&>(a1, a2[1] ^ *a2, a3, a4, (uint64_t)&v21);
  float v13 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v14 = *(float *)(a1 + 32);
  if (!v7 || (float)(v14 * (float)v7) < v13)
  {
    BOOL v15 = 1;
    if (v7 >= 3) {
      BOOL v15 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v16 = v15 | (2 * v7);
    unint64_t v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17) {
      size_t v18 = v17;
    }
    else {
      size_t v18 = v16;
    }
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v18);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7) {
        unint64_t v4 = v6 % v7;
      }
      else {
        unint64_t v4 = v6;
      }
    }
    else
    {
      unint64_t v4 = (v7 - 1) & v6;
    }
  }
  unint64_t v19 = *(void **)(*(void *)a1 + 8 * v4);
  if (v19)
  {
    *uint64_t v21 = *v19;
    *unint64_t v19 = v21;
  }
  else
  {
    *uint64_t v21 = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v21;
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*v21)
    {
      unint64_t v20 = *(void *)(*v21 + 8);
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
      *(void *)(*(void *)a1 + 8 * v2SymbolicationSession::SymbolicationSession((uint64_t)this, 0) = v21;
    }
  }
  uint64_t result = v21;
  ++*(void *)(a1 + 24);
  return result;
}

void sub_2345C9688(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<UUID,std::string>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__construct_node_hash<UUID&,std::string&>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9 = a1 + 16;
  uint64_t v10 = (char *)operator new(0x38uLL);
  *(void *)a5 = v10;
  *(void *)(a5 + 8) = v9;
  *(unsigned char *)(a5 + 16) = 0;
  *(void *)uint64_t v10 = 0;
  *((void *)v10 + 1) = a2;
  *((_OWORD *)v10 + 1) = *a3;
  unint64_t v11 = (std::string *)(v10 + 32);
  if (*(char *)(a4 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v11, *(const std::string::value_type **)a4, *(void *)(a4 + 8));
  }
  else
  {
    *(_OWORD *)&v11->__r_.__value_.__l.__data_ = *(_OWORD *)a4;
    v11->__r_.__value_.__r.__words[2] = *(void *)(a4 + 16);
  }
  *(unsigned char *)(a5 + 16) = 1;
}

void sub_2345C974C(_Unwind_Exception *a1)
{
  void *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<UUID,std::string>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

std::string *std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>(std::string *this, char **a2)
{
  *(_OWORD *)&this->__r_.__value_.__l.__data_ = 0uLL;
  this->__r_.__value_.__r.__words[2] = 0;
  uint64_t v3 = *a2;
  unint64_t v4 = v3 - 1;
  while (*++v4)
    ;
  std::string::append[abi:ne180100]<char const*,0>(this, v3, v4);
  return this;
}

void sub_2345C97AC(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void *std::allocate_shared[abi:ne180100]<SharedCache,std::allocator<SharedCache>,_CSTypeRef &,std::shared_ptr<StringPool> &,void>@<X0>(void *a1@<X1>, uint64_t a2@<X2>, void *a3@<X8>)
{
  unint64_t v6 = operator new(0xB8uLL);
  uint64_t result = std::__shared_ptr_emplace<SharedCache>::__shared_ptr_emplace[abi:ne180100]<_CSTypeRef &,std::shared_ptr<StringPool> &,std::allocator<SharedCache>,0>(v6, a1, a2);
  *a3 = v6 + 3;
  a3[1] = v6;
  return result;
}

void sub_2345C9818(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__shared_ptr_emplace<SharedCache>::__shared_ptr_emplace[abi:ne180100]<_CSTypeRef &,std::shared_ptr<StringPool> &,std::allocator<SharedCache>,0>(void *a1, void *a2, uint64_t a3)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_26E761740;
  SharedCache::SharedCache(a1 + 3, *a2, a2[1], a3);
  return a1;
}

void sub_2345C9880(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::__unordered_map_hasher<SharedCacheDescription,std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::hash<SharedCacheDescription>,std::equal_to<SharedCacheDescription>,true>,std::__unordered_map_equal<SharedCacheDescription,std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::equal_to<SharedCacheDescription>,std::hash<SharedCacheDescription>,true>,std::allocator<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>>>::__emplace_unique_key_args<SharedCacheDescription,SharedCacheDescription&,std::shared_ptr<SharedCache>&>(uint64_t a1, SharedCacheDescription *this, uint64_t a3, uint64_t *a4)
{
  unint64_t v9 = SharedCacheDescription::hash(this);
  unint64_t v10 = v9;
  unint64_t v11 = *(void *)(a1 + 8);
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    unint64_t v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v4 = v9;
      if (v9 >= v11) {
        unint64_t v4 = v9 % v11;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v9;
    }
    float v14 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v14)
    {
      BOOL v15 = *v14;
      if (*v14)
      {
        do
        {
          unint64_t v16 = v15[1];
          if (v16 == v10)
          {
            if (SharedCacheDescription::operator==(v15 + 2, this)) {
              return v15;
            }
          }
          else
          {
            if (v13 > 1)
            {
              if (v16 >= v11) {
                v16 %= v11;
              }
            }
            else
            {
              v16 &= v11 - 1;
            }
            if (v16 != v4) {
              break;
            }
          }
          BOOL v15 = (void *)*v15;
        }
        while (v15);
      }
    }
  }
  unint64_t v17 = (void *)(a1 + 16);
  BOOL v15 = operator new(0x48uLL);
  *BOOL v15 = 0;
  v15[1] = v10;
  long long v18 = *(_OWORD *)(a3 + 16);
  *((_OWORD *)v15 + 1) = *(_OWORD *)a3;
  *((_OWORD *)v15 + 2) = v18;
  uint64_t v20 = *a4;
  uint64_t v19 = a4[1];
  v15[6] = *(void *)(a3 + 32);
  v15[7] = v20;
  v15[8] = v19;
  if (v19) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v19 + 8), 1uLL, memory_order_relaxed);
  }
  float v21 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v22 = *(float *)(a1 + 32);
  if (!v11 || (float)(v22 * (float)v11) < v21)
  {
    BOOL v23 = 1;
    if (v11 >= 3) {
      BOOL v23 = (v11 & (v11 - 1)) != 0;
    }
    unint64_t v24 = v23 | (2 * v11);
    unint64_t v25 = vcvtps_u32_f32(v21 / v22);
    if (v24 <= v25) {
      size_t v26 = v25;
    }
    else {
      size_t v26 = v24;
    }
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v26);
    unint64_t v11 = *(void *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11) {
        unint64_t v4 = v10 % v11;
      }
      else {
        unint64_t v4 = v10;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v10;
    }
  }
  uint64_t v27 = *(void *)a1;
  kcdata_item_t v28 = *(void **)(*(void *)a1 + 8 * v4);
  if (v28)
  {
    *BOOL v15 = *v28;
LABEL_40:
    *kcdata_item_t v28 = v15;
    goto LABEL_41;
  }
  *BOOL v15 = *v17;
  *unint64_t v17 = v15;
  *(void *)(v27 + 8 * v4) = v17;
  if (*v15)
  {
    unint64_t v29 = *(void *)(*v15 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v29 >= v11) {
        v29 %= v11;
      }
    }
    else
    {
      v29 &= v11 - 1;
    }
    kcdata_item_t v28 = (void *)(*(void *)a1 + 8 * v29);
    goto LABEL_40;
  }
LABEL_41:
  ++*(void *)(a1 + 24);
  return v15;
}

void sub_2345C9AFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,void *>>>::operator()[abi:ne180100](v11, v10);
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<int,Process *>,std::__unordered_map_hasher<int,std::__hash_value_type<int,Process *>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,Process *>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,Process *>>>::__emplace_unique_key_args<int,int &,Process *&>(uint64_t a1, int *a2, _DWORD *a3, void *a4)
{
  unint64_t v8 = *a2;
  unint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v9 <= v8) {
        unint64_t v4 = v8 % v9;
      }
    }
    else
    {
      unint64_t v4 = (v9 - 1) & v8;
    }
    uint64_t v11 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v11)
    {
      uint8x8_t v12 = *v11;
      if (*v11)
      {
        do
        {
          unint64_t v13 = v12[1];
          if (v13 == v8)
          {
            if (*((_DWORD *)v12 + 4) == v8) {
              return v12;
            }
          }
          else
          {
            if (v10.u32[0] > 1uLL)
            {
              if (v13 >= v9) {
                v13 %= v9;
              }
            }
            else
            {
              v13 &= v9 - 1;
            }
            if (v13 != v4) {
              break;
            }
          }
          uint8x8_t v12 = (void *)*v12;
        }
        while (v12);
      }
    }
  }
  uint8x8_t v12 = operator new(0x20uLL);
  *uint8x8_t v12 = 0;
  v12[1] = v8;
  *((_DWORD *)v12 + 4) = *a3;
  void v12[3] = *a4;
  float v14 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v15 = *(float *)(a1 + 32);
  if (!v9 || (float)(v15 * (float)v9) < v14)
  {
    BOOL v16 = 1;
    if (v9 >= 3) {
      BOOL v16 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v17 = v16 | (2 * v9);
    unint64_t v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18) {
      size_t v19 = v18;
    }
    else {
      size_t v19 = v17;
    }
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v19);
    unint64_t v9 = *(void *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v9 <= v8) {
        unint64_t v4 = v8 % v9;
      }
      else {
        unint64_t v4 = v8;
      }
    }
    else
    {
      unint64_t v4 = (v9 - 1) & v8;
    }
  }
  uint64_t v20 = *(void *)a1;
  float v21 = *(void **)(*(void *)a1 + 8 * v4);
  if (v21)
  {
    *uint8x8_t v12 = *v21;
LABEL_38:
    *float v21 = v12;
    goto LABEL_39;
  }
  *uint8x8_t v12 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v12;
  *(void *)(v20 + 8 * v4) = a1 + 16;
  if (*v12)
  {
    unint64_t v22 = *(void *)(*v12 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v22 >= v9) {
        v22 %= v9;
      }
    }
    else
    {
      v22 &= v9 - 1;
    }
    float v21 = (void *)(*(void *)a1 + 8 * v22);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v12;
}

void sub_2345C9D34(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<UUID,BOOL>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,BOOL>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,BOOL>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,BOOL>>>::__emplace_unique_key_args<UUID,std::piecewise_construct_t const&,std::tuple<UUID const&>,std::tuple<>>(uint64_t a1, void *a2, uint64_t a3, _OWORD **a4)
{
  unint64_t v7 = a2[1] ^ *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = a2[1] ^ *a2;
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
    uint8x8_t v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      uint64_t v11 = *v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (v11[2] == *a2 && v11[3] == a2[1]) {
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
          uint64_t v11 = (void *)*v11;
        }
        while (v11);
      }
    }
  }
  uint64_t v11 = operator new(0x28uLL);
  *uint64_t v11 = 0;
  v11[1] = v7;
  *((_OWORD *)v11 + 1) = **a4;
  *((unsigned char *)v11 + 32) = 0;
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
      size_t v19 = v18;
    }
    else {
      size_t v19 = v17;
    }
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v19);
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
  uint64_t v20 = *(void *)a1;
  float v21 = *(void **)(*(void *)a1 + 8 * v4);
  if (v21)
  {
    *uint64_t v11 = *v21;
LABEL_42:
    *float v21 = v11;
    goto LABEL_43;
  }
  *uint64_t v11 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v11;
  *(void *)(v20 + 8 * v4) = a1 + 16;
  if (*v11)
  {
    unint64_t v22 = *(void *)(*v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v22 >= v8) {
        v22 %= v8;
      }
    }
    else
    {
      v22 &= v8 - 1;
    }
    float v21 = (void *)(*(void *)a1 + 8 * v22);
    goto LABEL_42;
  }
LABEL_43:
  ++*(void *)(a1 + 24);
  return v11;
}

void sub_2345C9F68(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<UUID,BOOL>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,BOOL>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,BOOL>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,BOOL>>>::__emplace_unique_key_args<UUID,UUID&,BOOL>(uint64_t a1, void *a2, _OWORD *a3, unsigned char *a4)
{
  unint64_t v8 = a2[1] ^ *a2;
  unint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v4 = a2[1] ^ *a2;
      if (v8 >= v9) {
        unint64_t v4 = v8 % v9;
      }
    }
    else
    {
      unint64_t v4 = (v9 - 1) & v8;
    }
    uint64_t v11 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v11)
    {
      unint64_t v12 = *v11;
      if (*v11)
      {
        do
        {
          unint64_t v13 = v12[1];
          if (v13 == v8)
          {
            if (v12[2] == *a2 && v12[3] == a2[1]) {
              return v12;
            }
          }
          else
          {
            if (v10.u32[0] > 1uLL)
            {
              if (v13 >= v9) {
                v13 %= v9;
              }
            }
            else
            {
              v13 &= v9 - 1;
            }
            if (v13 != v4) {
              break;
            }
          }
          unint64_t v12 = (void *)*v12;
        }
        while (v12);
      }
    }
  }
  unint64_t v12 = operator new(0x28uLL);
  *unint64_t v12 = 0;
  v12[1] = v8;
  *((_OWORD *)v12 + 1) = *a3;
  *((unsigned char *)v12 + 32) = *a4;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v16 = *(float *)(a1 + 32);
  if (!v9 || (float)(v16 * (float)v9) < v15)
  {
    BOOL v17 = 1;
    if (v9 >= 3) {
      BOOL v17 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v9);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v20);
    unint64_t v9 = *(void *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9) {
        unint64_t v4 = v8 % v9;
      }
      else {
        unint64_t v4 = v8;
      }
    }
    else
    {
      unint64_t v4 = (v9 - 1) & v8;
    }
  }
  uint64_t v21 = *(void *)a1;
  unint64_t v22 = *(void **)(*(void *)a1 + 8 * v4);
  if (v22)
  {
    *unint64_t v12 = *v22;
LABEL_42:
    void *v22 = v12;
    goto LABEL_43;
  }
  *unint64_t v12 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v12;
  *(void *)(v21 + 8 * v4) = a1 + 16;
  if (*v12)
  {
    unint64_t v23 = *(void *)(*v12 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v23 >= v9) {
        v23 %= v9;
      }
    }
    else
    {
      v23 &= v9 - 1;
    }
    unint64_t v22 = (void *)(*(void *)a1 + 8 * v23);
    goto LABEL_42;
  }
LABEL_43:
  ++*(void *)(a1 + 24);
  return v12;
}

void sub_2345CA1A4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__function::__func<SymbolicationSession::writeSymbolDataToKtraceFile(ktrace_file *)::$_0,std::allocator<SymbolicationSession::writeSymbolDataToKtraceFile(ktrace_file *)::$_0>,void ()(__CFData const*)>::~__func()
{
}

__n128 std::__function::__func<SymbolicationSession::writeSymbolDataToKtraceFile(ktrace_file *)::$_0,std::allocator<SymbolicationSession::writeSymbolDataToKtraceFile(ktrace_file *)::$_0>,void ()(__CFData const*)>::__clone(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26E761820;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<SymbolicationSession::writeSymbolDataToKtraceFile(ktrace_file *)::$_0,std::allocator<SymbolicationSession::writeSymbolDataToKtraceFile(ktrace_file *)::$_0>,void ()(__CFData const*)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26E761820;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<SymbolicationSession::writeSymbolDataToKtraceFile(ktrace_file *)::$_0,std::allocator<SymbolicationSession::writeSymbolDataToKtraceFile(ktrace_file *)::$_0>,void ()(__CFData const*)>::operator()(uint64_t result, CFDataRef *a2)
{
  CFDataRef v2 = *a2;
  if (*a2)
  {
    uint64_t v3 = result;
    CFDataGetBytePtr(*a2);
    CFDataGetLength(v2);
    __n128 result = ktrace_file_append_chunk();
    ++**(_DWORD **)(v3 + 16);
  }
  return result;
}

uint64_t std::__function::__func<SymbolicationSession::writeSymbolDataToKtraceFile(ktrace_file *)::$_0,std::allocator<SymbolicationSession::writeSymbolDataToKtraceFile(ktrace_file *)::$_0>,void ()(__CFData const*)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<SymbolicationSession::writeSymbolDataToKtraceFile(ktrace_file *)::$_0,std::allocator<SymbolicationSession::writeSymbolDataToKtraceFile(ktrace_file *)::$_0>,void ()(__CFData const*)>::target_type()
{
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return 1;
  }
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3)) {
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  return 0;
}

void *std::__function::__value_func<void ()(__CFData const*)>::~__value_func[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void std::__function::__func<SymbolicationSession::writeSymbolDataToKtraceFile(ktrace_file *)::$_1,std::allocator<SymbolicationSession::writeSymbolDataToKtraceFile(ktrace_file *)::$_1>,void ()(__CFData const*)>::~__func()
{
}

__n128 std::__function::__func<SymbolicationSession::writeSymbolDataToKtraceFile(ktrace_file *)::$_1,std::allocator<SymbolicationSession::writeSymbolDataToKtraceFile(ktrace_file *)::$_1>,void ()(__CFData const*)>::__clone(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26E7618B0;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<SymbolicationSession::writeSymbolDataToKtraceFile(ktrace_file *)::$_1,std::allocator<SymbolicationSession::writeSymbolDataToKtraceFile(ktrace_file *)::$_1>,void ()(__CFData const*)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26E7618B0;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<SymbolicationSession::writeSymbolDataToKtraceFile(ktrace_file *)::$_1,std::allocator<SymbolicationSession::writeSymbolDataToKtraceFile(ktrace_file *)::$_1>,void ()(__CFData const*)>::operator()(uint64_t result, CFDataRef *a2)
{
  CFDataRef v2 = *a2;
  if (*a2)
  {
    uint64_t v3 = result;
    CFDataGetBytePtr(*a2);
    CFDataGetLength(v2);
    __n128 result = ktrace_file_append_chunk();
    ++**(_DWORD **)(v3 + 16);
  }
  return result;
}

uint64_t std::__function::__func<SymbolicationSession::writeSymbolDataToKtraceFile(ktrace_file *)::$_1,std::allocator<SymbolicationSession::writeSymbolDataToKtraceFile(ktrace_file *)::$_1>,void ()(__CFData const*)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<SymbolicationSession::writeSymbolDataToKtraceFile(ktrace_file *)::$_1,std::allocator<SymbolicationSession::writeSymbolDataToKtraceFile(ktrace_file *)::$_1>,void ()(__CFData const*)>::target_type()
{
}

void std::__shared_ptr_emplace<StringPool>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E761930;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<StringPool>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E761930;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x237DC1B90);
}

uint64_t std::__shared_ptr_emplace<StringPool>::__on_zero_shared(uint64_t a1)
{
  return std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table(a1 + 24);
}

uint64_t std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__deallocate_node(a1, *(void ***)(a1 + 16));
  CFDataRef v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__deallocate_node(int a1, void **__p)
{
  if (__p)
  {
    CFDataRef v2 = __p;
    do
    {
      uint64_t v3 = (void **)*v2;
      if (*((char *)v2 + 39) < 0) {
        operator delete(v2[2]);
      }
      operator delete(v2);
      CFDataRef v2 = v3;
    }
    while (v3);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::__unordered_map_hasher<SharedCacheDescription,std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::hash<SharedCacheDescription>,std::equal_to<SharedCacheDescription>,true>,std::__unordered_map_equal<SharedCacheDescription,std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::equal_to<SharedCacheDescription>,std::hash<SharedCacheDescription>,true>,std::allocator<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::__unordered_map_hasher<SharedCacheDescription,std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::hash<SharedCacheDescription>,std::equal_to<SharedCacheDescription>,true>,std::__unordered_map_equal<SharedCacheDescription,std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::equal_to<SharedCacheDescription>,std::hash<SharedCacheDescription>,true>,std::allocator<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>>>::__deallocate_node(a1, *(void **)(a1 + 16));
  CFDataRef v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::__unordered_map_hasher<SharedCacheDescription,std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::hash<SharedCacheDescription>,std::equal_to<SharedCacheDescription>,true>,std::__unordered_map_equal<SharedCacheDescription,std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>,std::equal_to<SharedCacheDescription>,std::hash<SharedCacheDescription>,true>,std::allocator<std::__hash_value_type<SharedCacheDescription,std::shared_ptr<SharedCache>>>>::__deallocate_node(int a1, void *__p)
{
  if (__p)
  {
    CFDataRef v2 = __p;
    do
    {
      uint64_t v3 = (void *)*v2;
      unint64_t v4 = (std::__shared_weak_count *)v2[8];
      if (v4) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v4);
      }
      operator delete(v2);
      CFDataRef v2 = v3;
    }
    while (v3);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::__deallocate_node(a1, *(void **)(a1 + 16));
  CFDataRef v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::__deallocate_node(int a1, void *__p)
{
  if (__p)
  {
    CFDataRef v2 = __p;
    do
    {
      uint64_t v3 = (void *)*v2;
      unint64_t v4 = (std::__shared_weak_count *)v2[5];
      if (v4) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v4);
      }
      operator delete(v2);
      CFDataRef v2 = v3;
    }
    while (v3);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<AOTSharedCacheDescription,std::shared_ptr<void *>>,std::__unordered_map_hasher<AOTSharedCacheDescription,std::__hash_value_type<AOTSharedCacheDescription,std::shared_ptr<void *>>,std::hash<AOTSharedCacheDescription>,std::equal_to<AOTSharedCacheDescription>,true>,std::__unordered_map_equal<AOTSharedCacheDescription,std::__hash_value_type<AOTSharedCacheDescription,std::shared_ptr<void *>>,std::equal_to<AOTSharedCacheDescription>,std::hash<AOTSharedCacheDescription>,true>,std::allocator<std::__hash_value_type<AOTSharedCacheDescription,std::shared_ptr<void *>>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<AOTSharedCacheDescription,std::shared_ptr<void *>>,std::__unordered_map_hasher<AOTSharedCacheDescription,std::__hash_value_type<AOTSharedCacheDescription,std::shared_ptr<void *>>,std::hash<AOTSharedCacheDescription>,std::equal_to<AOTSharedCacheDescription>,true>,std::__unordered_map_equal<AOTSharedCacheDescription,std::__hash_value_type<AOTSharedCacheDescription,std::shared_ptr<void *>>,std::equal_to<AOTSharedCacheDescription>,std::hash<AOTSharedCacheDescription>,true>,std::allocator<std::__hash_value_type<AOTSharedCacheDescription,std::shared_ptr<void *>>>>::__deallocate_node(a1, *(void **)(a1 + 16));
  CFDataRef v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<AOTSharedCacheDescription,std::shared_ptr<void *>>,std::__unordered_map_hasher<AOTSharedCacheDescription,std::__hash_value_type<AOTSharedCacheDescription,std::shared_ptr<void *>>,std::hash<AOTSharedCacheDescription>,std::equal_to<AOTSharedCacheDescription>,true>,std::__unordered_map_equal<AOTSharedCacheDescription,std::__hash_value_type<AOTSharedCacheDescription,std::shared_ptr<void *>>,std::equal_to<AOTSharedCacheDescription>,std::hash<AOTSharedCacheDescription>,true>,std::allocator<std::__hash_value_type<AOTSharedCacheDescription,std::shared_ptr<void *>>>>::__deallocate_node(int a1, void *__p)
{
  if (__p)
  {
    CFDataRef v2 = __p;
    do
    {
      uint64_t v3 = (void *)*v2;
      unint64_t v4 = (std::__shared_weak_count *)v2[9];
      if (v4) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v4);
      }
      operator delete(v2);
      CFDataRef v2 = v3;
    }
    while (v3);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__deallocate_node(a1, *(void ***)(a1 + 16));
  CFDataRef v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::__deallocate_node(int a1, void **__p)
{
  if (__p)
  {
    CFDataRef v2 = __p;
    do
    {
      uint64_t v3 = (void **)*v2;
      if (*((char *)v2 + 55) < 0) {
        operator delete(v2[4]);
      }
      operator delete(v2);
      CFDataRef v2 = v3;
    }
    while (v3);
  }
}

void OUTLINED_FUNCTION_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

uint64_t Section::name(Section *this)
{
  return *((void *)this + 2);
}

uint64_t Section::contents(Section *this)
{
  return *((void *)this + 4);
}

size_t Section::initializeWithCSSection(uint64_t *a1)
{
  *a1 = CSRegionGetRange();
  a1[1] = v2;
  uint64_t Name = CSRegionGetName();
  if (Name) {
    unint64_t v4 = (const char *)Name;
  }
  else {
    unint64_t v4 = (const char *)&unk_2345D29A6;
  }
  size_t result = strlen(v4);
  a1[2] = (uint64_t)v4;
  a1[3] = result;
  return result;
}

uint64_t Section::debug(Section *this)
{
  printf("\tSection @ 0x%llx - 0x%llx: ", *(void *)this, *((void *)this + 1) + *(void *)this);
  if (*((void *)this + 3)) {
    uint64_t v2 = (const char *)*((void *)this + 2);
  }
  else {
    uint64_t v2 = "<null>";
  }

  return puts(v2);
}

uint64_t Section::Section(uint64_t a1)
{
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  Section::initializeWithCSSection((uint64_t *)a1);
  return a1;
}

{
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  Section::initializeWithCSSection((uint64_t *)a1);
  return a1;
}

__n128 DyldKdebugAOTSharedCacheDescription::consumeTracepointA(__n128 *a1, __n128 *a2)
{
  a1[2].n128_u64[0] = a2->n128_u64[1];
  __n128 result = a2[1];
  *a1 = result;
  return result;
}

__n128 DyldKdebugAOTSharedCacheDescription::consumeTracepointB(__n128 *a1, __n128 *a2)
{
  a1[2].n128_u64[1] = a2->n128_u64[1];
  __n128 result = a2[1];
  a1[1] = result;
  return result;
}

void AOTSharedCacheDescription::AOTSharedCacheDescription(AOTSharedCacheDescription *this)
{
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *(_OWORD *)this = 0u;
}

{
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *(_OWORD *)this = 0u;
}

void AOTSharedCacheDescription::AOTSharedCacheDescription(AOTSharedCacheDescription *this, UUID a2, UUID a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(void *)this = a2;
  *((void *)this + 1) = a3;
  *((void *)this + 2) = a4;
  *((void *)this + 3) = a5;
  *((void *)this + 4) = a6;
  *((void *)this + 5) = a7;
}

{
  *(void *)this = a2;
  *((void *)this + 1) = a3;
  *((void *)this + 2) = a4;
  *((void *)this + 3) = a5;
  *((void *)this + 4) = a6;
  *((void *)this + 5) = a7;
}

uint64_t AOTSharedCacheDescription::x86Uuid(AOTSharedCacheDescription *this)
{
  return *(void *)this;
}

uint64_t AOTSharedCacheDescription::aotUuid(AOTSharedCacheDescription *this)
{
  return *((void *)this + 2);
}

uint64_t AOTSharedCacheDescription::x86LoadAddress(AOTSharedCacheDescription *this)
{
  return *((void *)this + 4);
}

uint64_t AOTSharedCacheDescription::aotLoadAddress(AOTSharedCacheDescription *this)
{
  return *((void *)this + 5);
}

uint64_t AOTSharedCacheDescription::hash(AOTSharedCacheDescription *this)
{
  return *((void *)this + 3) ^ *((void *)this + 2) ^ *((void *)this + 4);
}

BOOL AOTSharedCacheDescription::operator==(void *a1, void *a2)
{
  return a1[2] == a2[2] && a1[3] == a2[3] && a1[5] == a2[5];
}

void SharedLibrary::SharedLibrary(SharedLibrary *this)
{
  *((unsigned char *)this + 8SymbolicationSession::SymbolicationSession((uint64_t)this, 0) = 0;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *(_OWORD *)((char *)this + 57) = 0u;
  uint64_t v2 = (char *)operator new(0x40uLL);
  *((void *)v2 + 2) = 0;
  *((void *)v2 + 1) = 0;
  *(void *)uint64_t v2 = &unk_26E761930;
  *((void *)v2 + 7) = 0;
  *(_OWORD *)(v2 + 4SymbolicationSession::SymbolicationSession((uint64_t)this, 0) = 0u;
  *(_OWORD *)(v2 + 24) = 0u;
  *((_DWORD *)v2 + 14) = 1065353216;
  *(_OWORD *)((char *)this + 104) = 0u;
  *((void *)this + 11) = v2 + 24;
  *((void *)this + 12) = v2;
  *(_OWORD *)((char *)this + 12SymbolicationSession::SymbolicationSession((uint64_t)this, 0) = 0u;
  *((_DWORD *)this + 34) = 1065353216;
  uint64_t v3 = v2 + 24;
  unint64_t v4 = (std::__shared_weak_count *)v2;
  atomic_fetch_add_explicit((atomic_ullong *volatile)v2 + 1, 1uLL, memory_order_relaxed);
  SharedLibraryMetadata::SharedLibraryMetadata((uint64_t)this + 144, (uint64_t)&v3);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
}

void sub_2345CAB5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11, void **a12)
{
  if (a11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a11);
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table(v13);
  float v15 = *(std::__shared_weak_count **)(v12 + 96);
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
  a12 = (void **)(v12 + 16);
  std::vector<Segment>::__destroy_vector::operator()[abi:ne180100](&a12);
  _Unwind_Resume(a1);
}

void SharedLibrary::initializeWithCSSymbolOwner(SharedLibrary *this)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  uint64_t v2 = *((void *)this + 12);
  *(void *)&long long v44 = *((void *)this + 11);
  *((void *)&v44 + 1) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  SharedLibraryMetadata::SharedLibraryMetadata((uint64_t)&v45, &v44);
  long long v3 = v45;
  long long v45 = 0uLL;
  unint64_t v4 = (std::__shared_weak_count *)*((void *)this + 19);
  *((_OWORD *)this + 9) = v3;
  if (v4)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    unint64_t v4 = (std::__shared_weak_count *)*((void *)&v45 + 1);
  }
  long long v5 = v47;
  *((_OWORD *)this + 1SymbolicationSession::SymbolicationSession((uint64_t)this, 0) = v46;
  *((_OWORD *)this + 11) = v5;
  long long v6 = v49;
  *((_OWORD *)this + 12) = v48;
  *((_OWORD *)this + 13) = v6;
  long long v7 = v51;
  *((_OWORD *)this + 14) = v50;
  *((_OWORD *)this + 15) = v7;
  *((_OWORD *)this + 16) = v52;
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  if (*((void *)&v44 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v44 + 1));
  }
  CSSymbolOwnerGetSymbolicator();
  CSSymbolicatorIsKernelSymbolicator();
  *(void *)&long long v45 = 0;
  *((void *)&v45 + 1) = &v45;
  *(void *)&long long v46 = 0x4002000000;
  *((void *)&v46 + 1) = __Block_byref_object_copy__0;
  *(void *)&long long v47 = __Block_byref_object_dispose__0;
  BYTE8(v47) = 0;
  BYTE8(v48) = 0;
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x4002000000;
  uint64_t v40 = __Block_byref_object_copy__0;
  char v41 = __Block_byref_object_dispose__0;
  char v42 = 0;
  char v43 = 0;
  uint64_t v30 = 0;
  unint64_t v31 = &v30;
  uint64_t v32 = 0x4002000000;
  std::string v33 = __Block_byref_object_copy__0;
  uint64_t v34 = __Block_byref_object_dispose__0;
  char v35 = 0;
  char v36 = 0;
  uint64_t v23 = 0;
  unint64_t v24 = &v23;
  uint64_t v25 = 0x4002000000;
  size_t v26 = __Block_byref_object_copy__0;
  uint64_t v27 = __Block_byref_object_dispose__0;
  char v28 = 0;
  char v29 = 0;
  CSSymbolOwnerForeachSegment();
  uint64_t v8 = *((void *)&v45 + 1);
  if (*(unsigned char *)(*((void *)&v45 + 1) + 56))
  {
    unint64_t v9 = *(void *)(*((void *)&v45 + 1) + 40);
    uint8x8_t v10 = v38;
    uint64_t v11 = v38 + 5;
    uint64_t v12 = v38 + 7;
    if (!*((unsigned char *)v38 + 56)) {
      goto LABEL_17;
    }
LABEL_14:
    unint64_t v13 = v10[5];
LABEL_18:
    float v14 = v31;
    if (*((unsigned char *)v31 + 56)) {
      unint64_t v15 = v31[5];
    }
    else {
      unint64_t v15 = -1;
    }
    if (v13 < v9) {
      unint64_t v9 = v13;
    }
    if (v15 < v9) {
      unint64_t v9 = v15;
    }
    *((void *)this + 9) = v9;
    *((unsigned char *)this + 8SymbolicationSession::SymbolicationSession((uint64_t)this, 0) = 1;
    if (*(unsigned char *)(v8 + 56)) {
      unint64_t v16 = *(void *)(v8 + 48) + *(void *)(v8 + 40);
    }
    else {
      unint64_t v16 = 0;
    }
    if (*v12) {
      unint64_t v17 = v10[6] + *v11;
    }
    else {
      unint64_t v17 = 0;
    }
    if (*((unsigned char *)v14 + 56)) {
      unint64_t v18 = v14[6] + v14[5];
    }
    else {
      unint64_t v18 = 0;
    }
    if (v16 > v17) {
      unint64_t v17 = v16;
    }
    if (v17 <= v18) {
      unint64_t v17 = v18;
    }
    goto LABEL_38;
  }
  uint8x8_t v10 = v38;
  uint64_t v12 = v38 + 7;
  if (*((unsigned char *)v38 + 56))
  {
    uint64_t v11 = v38 + 5;
    unint64_t v9 = -1;
    goto LABEL_14;
  }
  if (*((unsigned char *)v31 + 56))
  {
    uint64_t v11 = v38 + 5;
    unint64_t v9 = -1;
LABEL_17:
    unint64_t v13 = -1;
    goto LABEL_18;
  }
  unint64_t v22 = v24;
  if (*((unsigned char *)v24 + 56))
  {
    *((void *)this + 9) = v24[5];
    *((unsigned char *)this + 8SymbolicationSession::SymbolicationSession((uint64_t)this, 0) = 1;
    unint64_t v17 = v22[6] + v22[5];
  }
  else
  {
    if (!*((unsigned char *)this + 80)) {
      goto LABEL_39;
    }
    unint64_t v17 = 0;
  }
LABEL_38:
  unint64_t v19 = *((void *)this + 9);
  BOOL v20 = v17 >= v19;
  unint64_t v21 = v17 - v19;
  if (!v20)
  {
LABEL_39:
    unint64_t v21 = 0;
    unint64_t v19 = -1;
  }
  *(void *)this = v19;
  *((void *)this + 1) = v21;
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v45, 8);
}

void sub_2345CAF60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 176), 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 40);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(__n128 *)(a1 + 4SymbolicationSession::SymbolicationSession((uint64_t)this, 0) = result;
  return result;
}

uint64_t ___ZN13SharedLibrary27initializeWithCSSymbolOwnerEv_block_invoke(uint64_t a1)
{
  uint64_t Range = CSRegionGetRange();
  uint64_t v4 = v3;
  uint64_t result = CSRegionGetName();
  if (result)
  {
    uint64_t result = strncmp((const char *)result, "__TEXT", 6uLL);
    if (!result)
    {
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
      *(void *)(v6 + 4SymbolicationSession::SymbolicationSession((uint64_t)this, 0) = Range;
      *(void *)(v6 + 48) = v4;
      *(unsigned char *)(v6 + 56) = 1;
    }
  }
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t Name = (const char *)CSRegionGetName();
    if (Name) {
      BOOL v8 = strncmp(Name, "__TEXT_EXEC", 0xBuLL) == 0;
    }
    else {
      BOOL v8 = 0;
    }
    unint64_t v9 = (const char *)CSRegionGetName();
    if (v9) {
      BOOL v10 = strncmp(v9, "__PPLTEXT", 9uLL) == 0;
    }
    else {
      BOOL v10 = 0;
    }
    uint64_t result = CSRegionGetName();
    if (result)
    {
      uint64_t result = strncmp((const char *)result, "__PPLTRAMP", 0xAuLL);
      BOOL v11 = result == 0;
      if (v8)
      {
LABEL_13:
        uint64_t v12 = *(void *)(a1 + 40);
LABEL_19:
        uint64_t v13 = *(void *)(v12 + 8);
        *(void *)(v13 + 4SymbolicationSession::SymbolicationSession((uint64_t)this, 0) = Range;
        *(void *)(v13 + 48) = v4;
        *(unsigned char *)(v13 + 56) = 1;
        return result;
      }
    }
    else
    {
      BOOL v11 = 0;
      if (v8) {
        goto LABEL_13;
      }
    }
    if (v10)
    {
      uint64_t v12 = *(void *)(a1 + 48);
    }
    else
    {
      if (!v11) {
        return result;
      }
      uint64_t v12 = *(void *)(a1 + 56);
    }
    goto LABEL_19;
  }
  return result;
}

uint64_t SharedLibrary::csSymbolOwner(SharedLibrary *this)
{
  return *((void *)this + 7);
}

uint64_t SharedLibrary::SharedLibrary(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  *(void *)(a1 + 32) = 0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  CSSymbolOwnerGetSymbolicator();
  *(void *)(a1 + 4SymbolicationSession::SymbolicationSession((uint64_t)this, 0) = CSRetain();
  *(void *)(a1 + 48) = v8;
  *(void *)(a1 + 56) = a2;
  *(void *)(a1 + 64) = a3;
  *(unsigned char *)(a1 + 72) = 0;
  *(unsigned char *)(a1 + 8SymbolicationSession::SymbolicationSession((uint64_t)this, 0) = 0;
  uint64_t v9 = a4[1];
  *(void *)(a1 + 88) = *a4;
  *(void *)(a1 + 96) = v9;
  if (v9) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
  }
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 12SymbolicationSession::SymbolicationSession((uint64_t)this, 0) = 0u;
  *(_DWORD *)(a1 + 136) = 1065353216;
  *(unsigned char *)(a1 + 216) = 0;
  *(unsigned char *)(a1 + 22SymbolicationSession::SymbolicationSession((uint64_t)this, 0) = 0;
  *(unsigned char *)(a1 + 228) = 0;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 16SymbolicationSession::SymbolicationSession((uint64_t)this, 0) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(unsigned char *)(a1 + 208) = 0;
  *(_OWORD *)(a1 + 24SymbolicationSession::SymbolicationSession((uint64_t)this, 0) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  if ((CSIsNull() & 1) == 0) {
    SharedLibrary::initializeWithCSSymbolOwner((SharedLibrary *)a1);
  }
  return a1;
}

void sub_2345CB218(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10)
{
  uint64_t v13 = *(std::__shared_weak_count **)(v10 + 152);
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table(v11);
  float v14 = *(std::__shared_weak_count **)(v10 + 96);
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
  a10 = (void **)(v10 + 16);
  std::vector<Segment>::__destroy_vector::operator()[abi:ne180100](&a10);
  _Unwind_Resume(a1);
}

uint64_t SharedLibrary::SharedLibrary(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  *(void *)uu = a2;
  *(void *)&unsigned __int8 uu[8] = a3;
  *(unsigned char *)(a1 + 8SymbolicationSession::SymbolicationSession((uint64_t)this, 0) = 0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 57) = 0u;
  *(void *)(a1 + 88) = *a6;
  uint64_t v7 = a6[1];
  *(void *)(a1 + 96) = v7;
  if (v7) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
  }
  *(_OWORD *)(a1 + 104) = 0uLL;
  *(_OWORD *)(a1 + 12SymbolicationSession::SymbolicationSession((uint64_t)this, 0) = 0uLL;
  *(_DWORD *)(a1 + 136) = 1065353216;
  *(unsigned char *)(a1 + 216) = 0;
  *(unsigned char *)(a1 + 22SymbolicationSession::SymbolicationSession((uint64_t)this, 0) = 0;
  *(unsigned char *)(a1 + 228) = 0;
  *(_OWORD *)(a1 + 144) = 0uLL;
  *(_OWORD *)(a1 + 16SymbolicationSession::SymbolicationSession((uint64_t)this, 0) = 0uLL;
  *(_OWORD *)(a1 + 176) = 0uLL;
  *(_OWORD *)(a1 + 192) = 0uLL;
  *(unsigned char *)(a1 + 208) = 0;
  *(_OWORD *)(a1 + 24SymbolicationSession::SymbolicationSession((uint64_t)this, 0) = 0uLL;
  *(_OWORD *)(a1 + 256) = 0uLL;
  if (!uuid_is_null(uu))
  {
    CSSymbolicatorForeachSymbolicatorWithPath();
    if ((CSIsNull() & 1) == 0) {
      SharedLibrary::initializeWithCSSymbolOwner((SharedLibrary *)a1);
    }
  }
  return a1;
}

void sub_2345CB3B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10)
{
  uint64_t v13 = *(std::__shared_weak_count **)(v10 + 152);
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table(v11);
  float v14 = *(std::__shared_weak_count **)(v10 + 96);
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
  a10 = (void **)(v10 + 16);
  std::vector<Segment>::__destroy_vector::operator()[abi:ne180100](&a10);
  _Unwind_Resume(a1);
}

uint64_t ___ZN13SharedLibraryC2E4UUIDNSt3__117basic_string_viewIcNS1_11char_traitsIcEEEERKNS1_10shared_ptrI10StringPoolEE_block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t result = CSIsNull();
  if (result)
  {
    uint64_t SymbolOwner = CSSymbolicatorGetSymbolOwner();
    uint64_t v6 = v5;
    uint64_t result = CSIsNull();
    if ((result & 1) == 0)
    {
      uint64_t result = CSSymbolOwnerGetCFUUIDBytes();
      if (result)
      {
        if (*(void *)result == a1[5] && *(void *)(result + 8) == a1[6])
        {
          uint64_t result = CSRetain();
          v2[5] = result;
          v2[6] = v8;
          v2[7] = SymbolOwner;
          v2[8] = v6;
        }
      }
    }
  }
  return result;
}

uint64_t SharedLibrary::hash(SharedLibrary *this)
{
  uint64_t v1 = SharedLibraryMetadata::uuid((SharedLibrary *)((char *)this + 144));
  return v2 ^ v1;
}

BOOL SharedLibrary::operator==(void *a1, void *a2)
{
  uint64_t v8 = SharedLibraryMetadata::uuid((SharedLibraryMetadata *)(a1 + 18));
  uint64_t v9 = v4;
  BOOL v6 = v8 == SharedLibraryMetadata::uuid((SharedLibraryMetadata *)(a2 + 18)) && v9 == v5;
  return v6 && *a1 == *a2 && a1[1] == a2[1];
}

uint64_t SharedLibrary::architecture(SharedLibrary *this)
{
  return SharedLibraryMetadata::architecture((SharedLibrary *)((char *)this + 144));
}

uint64_t SharedLibrary::path@<X0>(SharedLibrary *this@<X0>, uint64_t a2@<X8>)
{
  return SharedLibraryMetadata::path((uint64_t)this + 144, a2);
}

uint64_t SharedLibrary::generateFBSSignature(SharedLibrary *this)
{
  return SharedLibrary::generateFBSSignatureWithConfig((uint64_t)this, 0);
}

uint64_t SharedLibrary::generateFBSSignatureWithConfig(uint64_t a1, int a2)
{
  if ((CSIsNull() & 1) != 0 || a2 != 2 && !*(void *)(a1 + 128)) {
    return 0;
  }
  CSAddressSetCreate();
  for (uint64_t i = *(void **)(a1 + 120); i; uint64_t i = (void *)*i)
  {
    CSSymbolOwnerGetSymbolWithAddress();
    if ((CSIsNull() & 1) == 0)
    {
      CSSymbolGetRange();
      CSAddressSetAddRange();
    }
  }
  uint64_t SparseSignatureWithFlags = CSSymbolOwnerCreateSparseSignatureWithFlags();
  CSRelease();
  if (!SparseSignatureWithFlags)
  {
    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x4002000000;
    uint64_t v27 = __Block_byref_object_copy__2;
    char v28 = __Block_byref_object_dispose__3;
    __std::string p = 0;
    uint64_t v30 = 0;
    uint64_t v31 = 0;
    std::vector<_CSTypeRef>::reserve(&__p, *(void *)(a1 + 128));
    for (j = *(void **)(a1 + 120); j; j = (void *)*j)
    {
      uint64_t v7 = v25;
      SymbolWithuint64_t Address = CSSymbolOwnerGetSymbolWithAddress();
      uint64_t v10 = SymbolWithAddress;
      uint64_t v11 = v9;
      unint64_t v12 = v7[7];
      uint64_t v13 = (uint64_t *)v7[6];
      if ((unint64_t)v13 >= v12)
      {
        unint64_t v15 = (uint64_t *)v7[5];
        uint64_t v16 = ((char *)v13 - (char *)v15) >> 4;
        unint64_t v17 = v16 + 1;
        if ((unint64_t)(v16 + 1) >> 60) {
          std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v18 = v12 - (void)v15;
        if (v18 >> 3 > v17) {
          unint64_t v17 = v18 >> 3;
        }
        if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v19 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v19 = v17;
        }
        if (v19)
        {
          BOOL v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_CSTypeRef>>((uint64_t)(v7 + 7), v19);
          unint64_t v15 = (uint64_t *)v7[5];
          uint64_t v13 = (uint64_t *)v7[6];
        }
        else
        {
          BOOL v20 = 0;
        }
        unint64_t v21 = (uint64_t *)&v20[16 * v16];
        *unint64_t v21 = v10;
        v21[1] = v11;
        unint64_t v22 = v21;
        if (v13 != v15)
        {
          do
          {
            *((_OWORD *)v22 - 1) = *((_OWORD *)v13 - 1);
            v22 -= 2;
            v13 -= 2;
          }
          while (v13 != v15);
          unint64_t v15 = (uint64_t *)v7[5];
        }
        float v14 = v21 + 2;
        v7[5] = (uint64_t)v22;
        void v7[6] = (uint64_t)(v21 + 2);
        v7[7] = (uint64_t)&v20[16 * v19];
        if (v15) {
          operator delete(v15);
        }
      }
      else
      {
        *uint64_t v13 = SymbolWithAddress;
        v13[1] = v9;
        float v14 = v13 + 2;
      }
      void v7[6] = (uint64_t)v14;
    }
    CSSymbolOwnerCreateSparseDataWithBlock();
    uint64_t SparseSignatureWithFlags = CSSymbolOwnerCreateSignature();
    _Block_object_dispose(&v24, 8);
    if (__p)
    {
      uint64_t v30 = __p;
      operator delete(__p);
    }
  }
  return SparseSignatureWithFlags;
}

void sub_2345CB8A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21)
{
  if (__p)
  {
    a21 = (uint64_t)__p;
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__2(void *a1, uint64_t a2)
{
  a1[5] = 0;
  a1[6] = 0;
  a1[7] = 0;
  __n128 result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 5) = result;
  a1[7] = *(void *)(a2 + 56);
  *(void *)(a2 + 4SymbolicationSession::SymbolicationSession((uint64_t)this, 0) = 0;
  *(void *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2)
  {
    *(void *)(a1 + 48) = v2;
    operator delete(v2);
  }
}

void std::vector<_CSTypeRef>::reserve(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 4)
  {
    if (a2 >> 60) {
      std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    BOOL v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_CSTypeRef>>(v3, a2);
    uint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF0];
    uint64_t v9 = &v6[16 * v8];
    uint64_t v11 = (char *)*a1;
    uint64_t v10 = (char *)a1[1];
    unint64_t v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        *((_OWORD *)v12 - 1) = *((_OWORD *)v10 - 1);
        v12 -= 16;
        v10 -= 16;
      }
      while (v10 != v11);
      uint64_t v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

BOOL ___ZN13SharedLibrary30generateFBSSignatureWithConfigE48ats_symbolication_instruction_fetching_options_t_block_invoke(uint64_t a1, unint64_t a2, _OWORD *a3)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  unint64_t v5 = (*(void *)(v3 + 48) - v4) >> 4;
  if (v5 > a2) {
    *a3 = *(_OWORD *)(v4 + 16 * a2);
  }
  return v5 <= a2;
}

BOOL SharedLibrary::hasAddressesToSymbolicate(SharedLibrary *this)
{
  return *((void *)this + 16) != 0;
}

uint64_t SharedLibrary::prepareForResymbolicationWithDsymPath(SharedLibrary *this, const char *a2)
{
  uint64_t v4 = 0;
  unint64_t v5 = &v4;
  uint64_t v6 = 0x2000000000;
  char v7 = 0;
  CSSymbolOwnerSetPathForSymbolication();
  CSSymbolicatorResymbolicateFromDebugSymbolsInfo();
  uint64_t v2 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

void sub_2345CBAC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___ZN13SharedLibrary37prepareForResymbolicationWithDsymPathEPKc_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t CFUUIDBytes = (_OWORD *)CSSymbolOwnerGetCFUUIDBytes();
  if (CFUUIDBytes)
  {
    *(_OWORD *)UUID v24 = *CFUUIDBytes;
    if (a4)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      ats_symbolication_log_init();
      uint64_t v7 = ats_symbolication_log;
      if (!os_log_type_enabled((os_log_t)ats_symbolication_log, OS_LOG_TYPE_INFO)) {
        return;
      }
      UUID::uuidString((UUID *)v24, (uint64_t)__p);
      if (v18 >= 0) {
        uint64_t v8 = __p;
      }
      else {
        uint64_t v8 = (void **)__p[0];
      }
      *(_DWORD *)buf = 136315138;
      unint64_t v21 = v8;
      uint64_t v9 = "Resymbolication: sucessfully ingested symbol data from dSYM for UUID: %s";
      uint64_t v10 = v7;
      uint32_t v11 = 12;
    }
    else
    {
      ats_symbolication_log_init();
      uint64_t v12 = ats_symbolication_log;
      if (!os_log_type_enabled((os_log_t)ats_symbolication_log, OS_LOG_TYPE_INFO)) {
        return;
      }
      UUID::uuidString((UUID *)v24, (uint64_t)__p);
      int v13 = v18;
      float v14 = (void **)__p[0];
      uint64_t Path = CSSymbolOwnerGetPath();
      uint64_t v16 = __p;
      if (v13 < 0) {
        uint64_t v16 = v14;
      }
      *(_DWORD *)buf = 136315394;
      unint64_t v21 = v16;
      __int16 v22 = 2080;
      uint64_t v23 = Path;
      uint64_t v9 = "Resymbolication: failed to ingest symbol data from dSYM for UUID: %s %s";
      uint64_t v10 = v12;
      uint32_t v11 = 22;
    }
    _os_log_impl(&dword_2345B5000, v10, OS_LOG_TYPE_INFO, v9, buf, v11);
    if (v19)
    {
      if (v18 < 0) {
        operator delete(__p[0]);
      }
    }
  }
}

void sub_2345CBC8C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  if (a15)
  {
    if (a14 < 0) {
      operator delete(__p);
    }
  }
  _Unwind_Resume(exception_object);
}

void *SharedLibrary::addAddress(SharedLibrary *this, unint64_t a2)
{
  unint64_t v3 = a2;
  return std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>((uint64_t)this + 104, &v3, &v3);
}

uint64_t SharedLibrary::uuid(SharedLibrary *this)
{
  return SharedLibraryMetadata::uuid((SharedLibrary *)((char *)this + 144));
}

uint64_t SharedLibrary::baseAddress(SharedLibrary *this)
{
  return *(void *)this;
}

void SharedLibrary::~SharedLibrary(SharedLibrary *this)
{
  CSRelease();
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 19);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table((uint64_t)this + 104);
  unint64_t v3 = (std::__shared_weak_count *)*((void *)this + 12);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  uint64_t v4 = (void **)((char *)this + 16);
  std::vector<Segment>::__destroy_vector::operator()[abi:ne180100](&v4);
}

void std::vector<Segment>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    unint64_t v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 96;
        std::__destroy_at[abi:ne180100]<Segment,0>(v4);
      }
      while ((void *)v4 != v2);
      unint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__destroy_at[abi:ne180100]<Segment,0>(uint64_t a1)
{
  unint64_t v3 = (void **)(a1 + 56);
  std::vector<Symbol>::__destroy_vector::operator()[abi:ne180100](&v3);
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    *(void *)(a1 + 4SymbolicationSession::SymbolicationSession((uint64_t)this, 0) = v2;
    operator delete(v2);
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<_CSTypeRef>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(16 * a2);
}

void *std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>(uint64_t a1, unint64_t *a2, void *a3)
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
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
    uint64_t v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      for (uint64_t i = *v9; i; uint64_t i = (void *)*i)
      {
        unint64_t v11 = i[1];
        if (v11 == v6)
        {
          if (i[2] == v6) {
            return i;
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
      }
    }
  }
  uint64_t i = operator new(0x18uLL);
  void *i = 0;
  i[1] = v6;
  i[2] = *a3;
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
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7) {
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
  char v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    void *i = *v19;
LABEL_38:
    *char v19 = i;
    goto LABEL_39;
  }
  void *i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v18 + 8 * v3) = a1 + 16;
  if (*i)
  {
    unint64_t v20 = *(void *)(*i + 8);
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
    char v19 = (void *)(*(void *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_2345CC074(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

long long *SharedCacheSymbolicators::sharedCacheSymbolicatorMap(SharedCacheSymbolicators *this)
{
  {
    SharedCacheSymbolicators::sharedCacheSymbolicatorMap(void)::symbolicatorMastd::string p = 0u;
    unk_2687AA3F8 = 0u;
    dword_2687AA408 = 1065353216;
    __cxa_atexit((void (*)(void *))std::unordered_map<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>::~unordered_map[abi:ne180100], &SharedCacheSymbolicators::sharedCacheSymbolicatorMap(void)::symbolicatorMap, &dword_2345B5000);
  }
  if (atomic_load_explicit((atomic_ullong *volatile)&SharedCacheSymbolicators::sharedCacheSymbolicatorMap(void)::once, memory_order_acquire) != -1)
  {
    uint64_t v4 = &v2;
    unint64_t v3 = &v4;
    std::__call_once(&SharedCacheSymbolicators::sharedCacheSymbolicatorMap(void)::once, &v3, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<SharedCacheSymbolicators::sharedCacheSymbolicatorMap(void)::$_0 &&>>);
  }
  return &SharedCacheSymbolicators::sharedCacheSymbolicatorMap(void)::symbolicatorMap;
}

void *SharedCacheSymbolicators::cachedSharedCacheSymbolicatorByUUID(SharedCacheSymbolicators *this, UUID a2)
{
  v3[2] = *MEMORY[0x263EF8340];
  v3[0] = this;
  v3[1] = a2;
  SharedCacheSymbolicators::sharedCacheSymbolicatorMap(this);
  __n128 result = std::__hash_table<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::shared_ptr<SharedLibrary>>>>::find<UUID>(&SharedCacheSymbolicators::sharedCacheSymbolicatorMap(void)::symbolicatorMap, v3);
  if (result) {
    return *(void **)result[4];
  }
  return result;
}

void SharedCacheSymbolicators::createSharedCacheSymbolicatorByUUID(SharedCacheSymbolicators *this, UUID a2)
{
}

uint64_t std::__hash_table<std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>>>::__deallocate_node(a1, *(void **)(a1 + 16));
  char v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>>>::__deallocate_node(uint64_t a1, void *a2)
{
  if (a2)
  {
    char v2 = a2;
    do
    {
      unint64_t v3 = (void *)*v2;
      std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::reset[abi:ne180100](v2 + 4, 0);
      operator delete(v2);
      char v2 = v3;
    }
    while (v3);
  }
}

uint64_t std::__call_once_proxy[abi:ne180100]<std::tuple<SharedCacheSymbolicators::sharedCacheSymbolicatorMap(void)::$_0 &&>>()
{
  return MEMORY[0x270F23858](&__block_literal_global);
}

uint64_t ___ZZN24SharedCacheSymbolicators26sharedCacheSymbolicatorMapEvENK3__0clEv_block_invoke()
{
  uint64_t result = CSSymbolicatorGetSharedCacheUUID();
  uint64_t v1 = result;
  if (result) {
    operator new();
  }
  return result;
}

void sub_2345CC3A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *std::__hash_table<std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>>>::__emplace_unique_impl<CFUUIDBytes const*&,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>(void *a1, _OWORD **a2, void *a3)
{
  unint64_t v6 = operator new(0x28uLL);
  *unint64_t v6 = 0;
  *((_OWORD *)v6 + 1) = **a2;
  v6[4] = *a3;
  *a3 = 0;
  v6[1] = v6[3] ^ v6[2];
  inserted = std::__hash_table<std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>>>::__node_insert_unique(a1, v6);
  if ((v8 & 1) == 0)
  {
    std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::reset[abi:ne180100](v6 + 4, 0);
    operator delete(v6);
  }
  return inserted;
}

void sub_2345CC4A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,void *>>>::operator()[abi:ne180100](v11, v10);
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>>>::__node_insert_unique(void *a1, void *a2)
{
  char v2 = a2;
  uint64_t v4 = a2 + 2;
  unint64_t v5 = a2[3] ^ a2[2];
  *(v4 - 1) = v5;
  unint64_t v6 = std::__hash_table<std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>>>::__node_insert_unique_prepare[abi:ne180100]((uint64_t)a1, v5, v4);
  if (v6) {
    return v6;
  }
  std::__hash_table<std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>>>::__node_insert_unique_perform[abi:ne180100](a1, v2);
  return v2;
}

void *std::__hash_table<std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>>>::__node_insert_unique_prepare[abi:ne180100](uint64_t a1, unint64_t a2, void *a3)
{
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3)
  {
    uint8x8_t v4 = (uint8x8_t)vcnt_s8((int8x8_t)v3);
    v4.i16[0] = vaddlv_u8(v4);
    if (v4.u32[0] > 1uLL) {
      uint64_t v5 = v3 <= a2 ? a2 % v3 : a2;
    }
    else {
      uint64_t v5 = (v3 - 1) & a2;
    }
    unint64_t v6 = *(void **)(*(void *)a1 + 8 * v5);
    if (v6)
    {
      for (uint64_t i = (void *)*v6; i; uint64_t i = (void *)*i)
      {
        unint64_t v8 = i[1];
        if (v8 == a2)
        {
          if (i[2] == *a3 && i[3] == a3[1]) {
            return i;
          }
        }
        else
        {
          if (v4.u32[0] > 1uLL)
          {
            if (v8 >= v3) {
              v8 %= v3;
            }
          }
          else
          {
            v8 &= v3 - 1;
          }
          if (v8 != v5) {
            break;
          }
        }
      }
    }
  }
  float v10 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v11 = *(float *)(a1 + 32);
  if (!v3 || (float)(v11 * (float)v3) < v10)
  {
    uint64_t v12 = 2 * v3;
    BOOL v13 = v3 < 3 || (v3 & (v3 - 1)) != 0;
    size_t v14 = v13 | v12;
    unint64_t v15 = vcvtps_u32_f32(v10 / v11);
    if (v14 <= v15) {
      size_t v16 = v15;
    }
    else {
      size_t v16 = v14;
    }
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v16);
  }
  return 0;
}

void *std::__hash_table<std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>>>::__node_insert_unique_perform[abi:ne180100](void *result, void *a2)
{
  int8x8_t v2 = (int8x8_t)result[1];
  unint64_t v3 = a2[1];
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    if (v3 >= *(void *)&v2) {
      v3 %= *(void *)&v2;
    }
  }
  else
  {
    v3 &= *(void *)&v2 - 1;
  }
  uint64_t v5 = *(void **)(*result + 8 * v3);
  if (v5)
  {
    *a2 = *v5;
LABEL_13:
    *uint64_t v5 = a2;
    goto LABEL_14;
  }
  *a2 = result[2];
  result[2] = a2;
  *(void *)(*result + 8 * v3) = result + 2;
  if (*a2)
  {
    unint64_t v6 = *(void *)(*a2 + 8);
    if (v4.u32[0] > 1uLL)
    {
      if (v6 >= *(void *)&v2) {
        v6 %= *(void *)&v2;
      }
    }
    else
    {
      v6 &= *(void *)&v2 - 1;
    }
    uint64_t v5 = (void *)(*result + 8 * v6);
    goto LABEL_13;
  }
LABEL_14:
  ++result[3];
  return result;
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<UUID,std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>>,void *>>>::operator()[abi:ne180100](uint64_t a1, uint64_t *__p)
{
  if (*(unsigned char *)(a1 + 8)) {
    std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::reset[abi:ne180100](__p + 4, 0);
  }
  if (__p)
  {
    operator delete(__p);
  }
}

uint64_t ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>::ScopeGuard(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = a2;
  *(void *)(a1 + 8) = a3;
  *(unsigned char *)(a1 + 16) = 0;
  if ((CSIsNull() & 1) == 0)
  {
    CSRetain();
    *(unsigned char *)(a1 + 16) = 1;
  }
  return a1;
}

void SharedCacheDescription::SharedCacheDescription(SharedCacheDescription *this)
{
  *((unsigned char *)this + 32) = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *(void *)this = 0;
  *((unsigned char *)this + 24) = 0;
}

{
  *((unsigned char *)this + 32) = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *(void *)this = 0;
  *((unsigned char *)this + 24) = 0;
}

void SharedCacheDescription::SharedCacheDescription(SharedCacheDescription *this, uint64_t a2, UUID a3, uint8_t *a4)
{
  *(void *)this = a3;
  *((void *)this + 1) = a4;
  *((void *)this + 2) = a2;
  *((unsigned char *)this + 24) = 0;
  *((unsigned char *)this + 32) = 0;
  *((void *)this + 3) = SharedCacheDescription::baseAddressForSharedCacheWithUUID(this, a3, a4);
  *((unsigned char *)this + 32) = v5;
}

{
  char v5;

  *(void *)this = a3;
  *((void *)this + 1) = a4;
  *((void *)this + 2) = a2;
  *((unsigned char *)this + 24) = 0;
  *((unsigned char *)this + 32) = 0;
  *((void *)this + 3) = SharedCacheDescription::baseAddressForSharedCacheWithUUID(this, a3, a4);
  *((unsigned char *)this + 32) = v5;
}

uint64_t SharedCacheDescription::baseAddressForSharedCacheWithUUID(SharedCacheDescription *this, UUID a2, uint8_t *a3)
{
  if (CSIsNull()) {
    return 0;
  }
  else {
    return CSSymbolicatorGetSharedCacheBaseAddress();
  }
}

void SharedCacheDescription::SharedCacheDescription(SharedCacheDescription *this, uint64_t a2, uint64_t a3, UUID a4, uint64_t a5)
{
  *(void *)this = a4;
  *((void *)this + 1) = a5;
  *((void *)this + 2) = a2;
  *((void *)this + 3) = a2 - a3;
  *((unsigned char *)this + 32) = 1;
}

{
  *(void *)this = a4;
  *((void *)this + 1) = a5;
  *((void *)this + 2) = a2;
  *((void *)this + 3) = a2 - a3;
  *((unsigned char *)this + 32) = 1;
}

uint64_t SharedCacheDescription::uuid(SharedCacheDescription *this)
{
  return *(void *)this;
}

uint64_t SharedCacheDescription::loadAddress(SharedCacheDescription *this)
{
  return *((void *)this + 2);
}

uint64_t SharedCacheDescription::slide(SharedCacheDescription *this)
{
  if (*((unsigned char *)this + 32)) {
    return *((void *)this + 2) - *((void *)this + 3);
  }
  else {
    return 0;
  }
}

uint64_t SharedCacheDescription::baseAddress(SharedCacheDescription *this)
{
  return *((void *)this + 3);
}

uint64_t SharedCacheDescription::hash(SharedCacheDescription *this)
{
  return *((void *)this + 1) ^ *(void *)this ^ *((void *)this + 2);
}

BOOL SharedCacheDescription::operator==(void *a1, void *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2];
}

uint64_t SharedCacheMetadata::SharedCacheMetadata(uint64_t a1)
{
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  SharedCacheMetadata::populateWithSharedCacheSymbolicator(a1);
  return a1;
}

void sub_2345CC9D0(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(std::__shared_weak_count **)(v1 + 56);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SharedCacheMetadata::populateWithSharedCacheSymbolicator(uint64_t a1)
{
  *(_OWORD *)a1 = *(_OWORD *)CSSymbolicatorGetSharedCacheUUID();
  *(void *)(a1 + 32) = CSSymbolicatorGetArchitecture();
  uint64_t result = CSSymbolicatorGetSharedCacheBaseAddress();
  *(void *)(a1 + 4std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::reset[abi:ne180100](&a9, 0) = result;
  return result;
}

uint64_t SharedCacheMetadata::SharedCacheMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  SharedCacheMetadata::SharedCacheMetadata(a1);
  uint64_t v7 = *a4;
  uint64_t v6 = a4[1];
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  unint64_t v8 = *(std::__shared_weak_count **)(a1 + 56);
  *(void *)(a1 + 48) = v7;
  *(void *)(a1 + 56) = v6;
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  return a1;
}

{
  uint64_t v6;
  uint64_t v7;
  std::__shared_weak_count *v8;

  SharedCacheMetadata::SharedCacheMetadata(a1);
  uint64_t v7 = *a4;
  uint64_t v6 = a4[1];
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  unint64_t v8 = *(std::__shared_weak_count **)(a1 + 56);
  *(void *)(a1 + 48) = v7;
  *(void *)(a1 + 56) = v6;
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  return a1;
}

uint64_t SharedCacheMetadata::baseAddress(SharedCacheMetadata *this)
{
  return *((void *)this + 5);
}

void SharedCacheMetadata::uuidString(SharedCacheMetadata *this@<X0>, uint64_t a2@<X8>)
{
  if (uuid_is_null((const unsigned __int8 *)this) || !*((void *)this + 6)) {
    goto LABEL_2;
  }
  uint8x8_t v4 = (_OWORD *)((char *)this + 16);
  if (*((void *)this + 3))
  {
    *(_OWORD *)a2 = *v4;
    *(unsigned char *)(a2 + 16) = 1;
    return;
  }
  UUID::uuidString((UUID *)this, (uint64_t)__p);
  if (!v11) {
    goto LABEL_2;
  }
  StringPool::cacheString(*((void *)this + 6), (unsigned __int8 *)__p, (uint64_t)&v7);
  int v5 = v8;
  if (v8)
  {
    long long v6 = v7;
    *uint8x8_t v4 = v7;
    *(_OWORD *)a2 = v6;
    *(unsigned char *)(a2 + 16) = 1;
  }
  if (v11)
  {
    if (v10 < 0) {
      operator delete(__p[0]);
    }
  }
  if (!v5)
  {
LABEL_2:
    *(unsigned char *)a2 = 0;
    *(unsigned char *)(a2 + 16) = 0;
  }
}

void sub_2345CCBC4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19)
{
  if (a19)
  {
    if (a18 < 0) {
      operator delete(__p);
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t SharedCacheMetadata::architecture(SharedCacheMetadata *this)
{
  return *((void *)this + 4);
}

uint64_t DyldKdebugHandler::shouldResetLibraryState(DyldKdebugHandler *this)
{
  return *((unsigned __int8 *)this + 12960);
}

uint64_t DyldKdebugHandler::toggleResetLibraryState(uint64_t this)
{
  *(unsigned char *)(this + 12960) ^= 1u;
  return this;
}

void DyldKdebugHandler::resetInternalLibraryState(DyldKdebugHandler *this)
{
  std::__hash_table<std::__hash_value_type<int,std::vector<DyldKdebugLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<DyldKdebugLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<DyldKdebugLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<DyldKdebugLibraryDescription>>>>::clear((uint64_t)this + 12504);
  int8x8_t v2 = this;
  int v3 = 0;
  std::__fill_n[abi:ne180100]<false,std::__bitset<1563ul,99999ul>>((uint64_t)&v2, 0x1869FuLL);
  std::__hash_table<std::__hash_value_type<int,std::vector<DyldKdebugLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<DyldKdebugLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<DyldKdebugLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<DyldKdebugLibraryDescription>>>>::clear((uint64_t)this + 12624);
  std::__hash_table<std::__hash_value_type<int,std::vector<DyldKdebugLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<DyldKdebugLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<DyldKdebugLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<DyldKdebugLibraryDescription>>>>::clear((uint64_t)this + 12584);
  std::__hash_table<std::__hash_value_type<int,std::vector<DyldKdebugLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<DyldKdebugLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<DyldKdebugLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<DyldKdebugLibraryDescription>>>>::clear((uint64_t)this + 12544);
}

void DyldKdebugHandler::handleLibraryCompletion(DyldKdebugHandler *this, DyldKdebugLibraryDescription *a2)
{
  uint8x8_t v4 = (fsid_t *)DyldKdebugLibraryDescription::fsInfo(a2);
  DyldKdebugFilesystemInfo::path(v4, (uint64_t)__p);
  if (v9)
  {
    StringPool::cacheString(*((void *)this + 1618), (unsigned __int8 *)__p, (uint64_t)&v5);
    if (v6) {
      *((_OWORD *)a2 + 2) = v5;
    }
    if (v9)
    {
      if (v8 < 0) {
        operator delete(__p[0]);
      }
    }
  }
}

void sub_2345CCD04(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19)
{
  if (a19)
  {
    if (a18 < 0) {
      operator delete(__p);
    }
  }
  _Unwind_Resume(exception_object);
}

void DyldKdebugHandler::consumeTracepoint(DyldKdebugHandler *this, __n128 *a2)
{
  uint8x8_t v4 = (char *)this + 12960;
  if (*((unsigned char *)this + 12960))
  {
    DyldKdebugHandler::resetInternalLibraryState(this);
    *v4 ^= 1u;
  }
  HIDWORD(v5) = a2[3].n128_u32[0];
  LODWORD(v5) = HIDWORD(v5) - 520421376;
  switch((v5 >> 2))
  {
    case 0u:
      DyldKdebugHandler::handleTracepointA<std::integral_constant<unsigned int,520421376u>>((uint64_t)this, (uint64_t)a2);
      break;
    case 1u:
      DyldKdebugHandler::handleTracepointB<std::integral_constant<unsigned int,520421380u>>(this, (uint64_t)a2);
      break;
    case 2u:
      DyldKdebugHandler::handleTracepoint32A<std::integral_constant<unsigned int,520421384u>>((uint64_t)this, (uint64_t)a2);
      break;
    case 3u:
      DyldKdebugHandler::handleTracepoint32B<std::integral_constant<unsigned int,520421388u>>((uint64_t)this, (uint64_t *)a2);
      break;
    case 4u:
      DyldKdebugHandler::handleTracepoint32C<std::integral_constant<unsigned int,520421392u>>(this, (uint64_t)a2);
      break;
    case 0xAu:
      DyldKdebugHandler::handleTracepointA<std::integral_constant<unsigned int,520421416u>>((uint64_t)this, (uint64_t)a2);
      break;
    case 0xBu:
      DyldKdebugHandler::handleTracepointB<std::integral_constant<unsigned int,520421420u>>((uint64_t)this, (uint64_t)a2);
      break;
    case 0xCu:
      DyldKdebugHandler::handleTracepoint32A<std::integral_constant<unsigned int,520421424u>>((uint64_t)this, (uint64_t)a2);
      break;
    case 0xDu:
      DyldKdebugHandler::handleTracepoint32B<std::integral_constant<unsigned int,520421428u>>((uint64_t)this, a2);
      break;
    case 0xEu:
      DyldKdebugHandler::handleTracepoint32C<std::integral_constant<unsigned int,520421432u>>((uint64_t)this, (uint64_t)a2);
      break;
    case 0xFu:
      DyldKdebugHandler::handleTracepointA<std::integral_constant<unsigned int,520421436u>>((uint64_t)this, (uint64_t)a2);
      break;
    case 0x10u:
      DyldKdebugHandler::handleTracepointB<std::integral_constant<unsigned int,520421440u>>((uint64_t)this, (uint64_t)a2);
      break;
    case 0x11u:
      DyldKdebugHandler::handleTracepointA<std::integral_constant<unsigned int,520421444u>>((uint64_t)this, a2);
      break;
    case 0x12u:
      DyldKdebugHandler::handleTracepointB<std::integral_constant<unsigned int,520421448u>>((uint64_t)this, a2);
      break;
    default:
      return;
  }
}

void *DyldKdebugHandler::handleTracepointA<std::integral_constant<unsigned int,520421376u>>(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(a2 + 40);
  char v6 = &v5;
  int v3 = std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(a1 + 12744, &v5, (uint64_t)&std::piecewise_construct, &v6);
  return DyldKdebugLibraryDescription::consumeTracepointA((uint64_t)(v3 + 3), a2);
}

uint64_t *DyldKdebugHandler::handleTracepointB<std::integral_constant<unsigned int,520421380u>>(DyldKdebugHandler *a1, uint64_t a2)
{
  unint64_t v30 = *(void *)(a2 + 40);
  unsigned int v29 = *(_DWORD *)(a2 + 88);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>((uint64_t)a1 + 12904, (int *)&v29, &v29);
  uint64_t v31 = (uint64_t *)&v30;
  uint8x8_t v4 = (DyldKdebugLibraryDescription *)(std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)a1 + 12744, (uint64_t *)&v30, (uint64_t)&std::piecewise_construct, &v31)+ 3);
  DyldKdebugLibraryDescription::consumeTracepointB((uint64_t)v4, a2);
  DyldKdebugHandler::handleLibraryCompletion(a1, v4);
  uint64_t v31 = (uint64_t *)&v29;
  uint64_t v5 = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t)a1 + 12504, (int *)&v29, (uint64_t)&std::piecewise_construct, (_DWORD **)&v31);
  char v6 = (_OWORD *)v5[4];
  unint64_t v7 = v5[5];
  if ((unint64_t)v6 >= v7)
  {
    uint64_t v12 = v5[3];
    uint64_t v13 = ((uint64_t)v6 - v12) >> 6;
    unint64_t v14 = v13 + 1;
    if ((unint64_t)(v13 + 1) >> 58) {
      std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v15 = v7 - v12;
    if (v15 >> 5 > v14) {
      unint64_t v14 = v15 >> 5;
    }
    if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFC0) {
      unint64_t v16 = 0x3FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v16 = v14;
    }
    if (v16) {
      size_t v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_CSBinaryImageInformation>>((uint64_t)(v5 + 5), v16);
    }
    else {
      size_t v17 = 0;
    }
    uint64_t v18 = &v17[64 * v13];
    char v19 = &v17[64 * v16];
    long long v20 = *(_OWORD *)v4;
    long long v21 = *((_OWORD *)v4 + 1);
    long long v22 = *((_OWORD *)v4 + 3);
    *((_OWORD *)v18 + 2) = *((_OWORD *)v4 + 2);
    *((_OWORD *)v18 + 3) = v22;
    *(_OWORD *)uint64_t v18 = v20;
    *((_OWORD *)v18 + 1) = v21;
    char v11 = v18 + 64;
    UUID v24 = (char *)v5[3];
    uint64_t v23 = (char *)v5[4];
    if (v23 != v24)
    {
      do
      {
        long long v25 = *((_OWORD *)v23 - 4);
        long long v26 = *((_OWORD *)v23 - 3);
        long long v27 = *((_OWORD *)v23 - 1);
        *((_OWORD *)v18 - 2) = *((_OWORD *)v23 - 2);
        *((_OWORD *)v18 - 1) = v27;
        *((_OWORD *)v18 - 4) = v25;
        *((_OWORD *)v18 - 3) = v26;
        v18 -= 64;
        v23 -= 64;
      }
      while (v23 != v24);
      uint64_t v23 = (char *)v5[3];
    }
    v5[3] = v18;
    v5[4] = v11;
    v5[5] = v19;
    if (v23) {
      operator delete(v23);
    }
  }
  else
  {
    long long v8 = *(_OWORD *)v4;
    long long v9 = *((_OWORD *)v4 + 1);
    long long v10 = *((_OWORD *)v4 + 3);
    void v6[2] = *((_OWORD *)v4 + 2);
    v6[3] = v10;
    *char v6 = v8;
    v6[1] = v9;
    char v11 = v6 + 4;
  }
  v5[4] = v11;
  uint64_t result = std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>>>::__erase_unique<unsigned long long>((void *)a1 + 1593, &v30);
  if (v29 >= 0x1869F) {
    std::__throw_out_of_range[abi:ne180100]("bitset set argument out of range");
  }
  *(void *)((char *)a1 + (((unint64_t)v29 >> 3) & 0x1FFFFFF8)) |= 1 << v29;
  return result;
}

double DyldKdebugHandler::handleTracepoint32A<std::integral_constant<unsigned int,520421384u>>(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(a2 + 40);
  char v6 = &v5;
  int v3 = std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(a1 + 12744, &v5, (uint64_t)&std::piecewise_construct, &v6);
  *(void *)&double result = DyldKdebugLibraryDescription::consumeTracepoint32A((int32x4_t *)(v3 + 3), a2).u64[0];
  return result;
}

uint64_t DyldKdebugHandler::handleTracepoint32B<std::integral_constant<unsigned int,520421388u>>(uint64_t a1, uint64_t *a2)
{
  uint64_t v5 = a2[5];
  char v6 = &v5;
  int v3 = std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(a1 + 12744, &v5, (uint64_t)&std::piecewise_construct, &v6);
  return DyldKdebugLibraryDescription::consumeTracepoint32B(v3 + 3, a2);
}

uint64_t *DyldKdebugHandler::handleTracepoint32C<std::integral_constant<unsigned int,520421392u>>(DyldKdebugHandler *a1, uint64_t a2)
{
  unint64_t v30 = *(void *)(a2 + 40);
  int v29 = *(_DWORD *)(a2 + 88);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>((uint64_t)a1 + 12904, &v29, &v29);
  uint64_t v31 = (uint64_t *)&v30;
  uint8x8_t v4 = (DyldKdebugLibraryDescription *)(std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)a1 + 12744, (uint64_t *)&v30, (uint64_t)&std::piecewise_construct, &v31)+ 3);
  DyldKdebugLibraryDescription::consumeTracepoint32C((uint64_t)v4, a2);
  DyldKdebugHandler::handleLibraryCompletion(a1, v4);
  uint64_t v31 = (uint64_t *)&v29;
  uint64_t v5 = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t)a1 + 12504, &v29, (uint64_t)&std::piecewise_construct, (_DWORD **)&v31);
  char v6 = (_OWORD *)v5[4];
  unint64_t v7 = v5[5];
  if ((unint64_t)v6 >= v7)
  {
    uint64_t v12 = v5[3];
    uint64_t v13 = ((uint64_t)v6 - v12) >> 6;
    unint64_t v14 = v13 + 1;
    if ((unint64_t)(v13 + 1) >> 58) {
      std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v15 = v7 - v12;
    if (v15 >> 5 > v14) {
      unint64_t v14 = v15 >> 5;
    }
    if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFC0) {
      unint64_t v16 = 0x3FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v16 = v14;
    }
    if (v16) {
      size_t v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_CSBinaryImageInformation>>((uint64_t)(v5 + 5), v16);
    }
    else {
      size_t v17 = 0;
    }
    uint64_t v18 = &v17[64 * v13];
    char v19 = &v17[64 * v16];
    long long v20 = *(_OWORD *)v4;
    long long v21 = *((_OWORD *)v4 + 1);
    long long v22 = *((_OWORD *)v4 + 3);
    *((_OWORD *)v18 + 2) = *((_OWORD *)v4 + 2);
    *((_OWORD *)v18 + 3) = v22;
    *(_OWORD *)uint64_t v18 = v20;
    *((_OWORD *)v18 + 1) = v21;
    char v11 = v18 + 64;
    UUID v24 = (char *)v5[3];
    uint64_t v23 = (char *)v5[4];
    if (v23 != v24)
    {
      do
      {
        long long v25 = *((_OWORD *)v23 - 4);
        long long v26 = *((_OWORD *)v23 - 3);
        long long v27 = *((_OWORD *)v23 - 1);
        *((_OWORD *)v18 - 2) = *((_OWORD *)v23 - 2);
        *((_OWORD *)v18 - 1) = v27;
        *((_OWORD *)v18 - 4) = v25;
        *((_OWORD *)v18 - 3) = v26;
        v18 -= 64;
        v23 -= 64;
      }
      while (v23 != v24);
      uint64_t v23 = (char *)v5[3];
    }
    v5[3] = v18;
    v5[4] = v11;
    v5[5] = v19;
    if (v23) {
      operator delete(v23);
    }
  }
  else
  {
    long long v8 = *(_OWORD *)v4;
    long long v9 = *((_OWORD *)v4 + 1);
    long long v10 = *((_OWORD *)v4 + 3);
    void v6[2] = *((_OWORD *)v4 + 2);
    v6[3] = v10;
    *char v6 = v8;
    v6[1] = v9;
    char v11 = v6 + 4;
  }
  v5[4] = v11;
  return std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>>>::__erase_unique<unsigned long long>((void *)a1 + 1593, &v30);
}

uint64_t DyldKdebugHandler::handleTracepointA<std::integral_constant<unsigned int,520421416u>>(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(a2 + 40);
  char v6 = &v5;
  int v3 = std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(a1 + 12824, &v5, (uint64_t)&std::piecewise_construct, &v6);
  return DyldKdebugSharedCacheDescription::consumeTracepointA((uint64_t)(v3 + 3), a2);
}

uint64_t *DyldKdebugHandler::handleTracepointB<std::integral_constant<unsigned int,520421420u>>(uint64_t a1, uint64_t a2)
{
  unint64_t v30 = *(void *)(a2 + 40);
  int v29 = *(_DWORD *)(a2 + 88);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>(a1 + 12904, &v29, &v29);
  uint64_t v31 = (uint64_t *)&v30;
  uint8x8_t v4 = std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(a1 + 12824, (uint64_t *)&v30, (uint64_t)&std::piecewise_construct, &v31)+ 3;
  DyldKdebugSharedCacheDescription::consumeTracepointB((uint64_t)v4, a2);
  uint64_t v31 = (uint64_t *)&v29;
  uint64_t v5 = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(a1 + 12584, &v29, (uint64_t)&std::piecewise_construct, (_DWORD **)&v31);
  unint64_t v6 = v5[4];
  unint64_t v7 = v5[5];
  if (v6 >= v7)
  {
    uint64_t v12 = v5[3];
    uint64_t v13 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v6 - v12) >> 3);
    unint64_t v14 = v13 + 1;
    if ((unint64_t)(v13 + 1) > 0x492492492492492) {
      std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v15 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v7 - v12) >> 3);
    if (2 * v15 > v14) {
      unint64_t v14 = 2 * v15;
    }
    if (v15 >= 0x249249249249249) {
      unint64_t v16 = 0x492492492492492;
    }
    else {
      unint64_t v16 = v14;
    }
    if (v16) {
      size_t v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SourceInfo>>((uint64_t)(v5 + 5), v16);
    }
    else {
      size_t v17 = 0;
    }
    uint64_t v18 = &v17[56 * v13];
    char v19 = &v17[56 * v16];
    long long v20 = *(_OWORD *)v4;
    long long v21 = *((_OWORD *)v4 + 1);
    long long v22 = *((_OWORD *)v4 + 2);
    *((void *)v18 + 6) = v4[6];
    *((_OWORD *)v18 + 1) = v21;
    *((_OWORD *)v18 + 2) = v22;
    *(_OWORD *)uint64_t v18 = v20;
    char v11 = v18 + 56;
    UUID v24 = (char *)v5[3];
    uint64_t v23 = (char *)v5[4];
    if (v23 != v24)
    {
      do
      {
        long long v25 = *(_OWORD *)(v23 - 56);
        long long v26 = *(_OWORD *)(v23 - 40);
        long long v27 = *(_OWORD *)(v23 - 24);
        *((void *)v18 - 1) = *((void *)v23 - 1);
        *(_OWORD *)(v18 - 24) = v27;
        *(_OWORD *)(v18 - 4std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::reset[abi:ne180100](&a9, 0) = v26;
        *(_OWORD *)(v18 - 56) = v25;
        v18 -= 56;
        v23 -= 56;
      }
      while (v23 != v24);
      uint64_t v23 = (char *)v5[3];
    }
    v5[3] = v18;
    v5[4] = v11;
    v5[5] = v19;
    if (v23) {
      operator delete(v23);
    }
  }
  else
  {
    long long v8 = *(_OWORD *)v4;
    long long v9 = *((_OWORD *)v4 + 1);
    long long v10 = *((_OWORD *)v4 + 2);
    *(void *)(v6 + 48) = v4[6];
    *(_OWORD *)(v6 + 16) = v9;
    *(_OWORD *)(v6 + 32) = v10;
    *(_OWORD *)unint64_t v6 = v8;
    char v11 = (char *)(v6 + 56);
  }
  v5[4] = v11;
  return std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>>>::__erase_unique<unsigned long long>((void *)(a1 + 12824), &v30);
}

double DyldKdebugHandler::handleTracepoint32A<std::integral_constant<unsigned int,520421424u>>(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(a2 + 40);
  unint64_t v6 = &v5;
  int v3 = std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(a1 + 12824, &v5, (uint64_t)&std::piecewise_construct, &v6);
  *(void *)&double result = DyldKdebugSharedCacheDescription::consumeTracepoint32A((int32x4_t *)(v3 + 3), a2).u64[0];
  return result;
}

uint64_t DyldKdebugHandler::handleTracepoint32B<std::integral_constant<unsigned int,520421428u>>(uint64_t a1, void *a2)
{
  uint64_t v5 = a2[5];
  unint64_t v6 = &v5;
  int v3 = std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(a1 + 12824, &v5, (uint64_t)&std::piecewise_construct, &v6);
  return DyldKdebugSharedCacheDescription::consumeTracepoint32B((uint64_t)(v3 + 3), a2);
}

uint64_t *DyldKdebugHandler::handleTracepoint32C<std::integral_constant<unsigned int,520421432u>>(uint64_t a1, uint64_t a2)
{
  unint64_t v30 = *(void *)(a2 + 40);
  int v29 = *(_DWORD *)(a2 + 88);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>(a1 + 12904, &v29, &v29);
  uint64_t v31 = (uint64_t *)&v30;
  uint8x8_t v4 = std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(a1 + 12824, (uint64_t *)&v30, (uint64_t)&std::piecewise_construct, &v31)+ 3;
  DyldKdebugSharedCacheDescription::consumeTracepoint32C((uint64_t)v4, a2);
  uint64_t v31 = (uint64_t *)&v29;
  uint64_t v5 = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(a1 + 12584, &v29, (uint64_t)&std::piecewise_construct, (_DWORD **)&v31);
  unint64_t v6 = v5[4];
  unint64_t v7 = v5[5];
  if (v6 >= v7)
  {
    uint64_t v12 = v5[3];
    uint64_t v13 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v6 - v12) >> 3);
    unint64_t v14 = v13 + 1;
    if ((unint64_t)(v13 + 1) > 0x492492492492492) {
      std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v15 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v7 - v12) >> 3);
    if (2 * v15 > v14) {
      unint64_t v14 = 2 * v15;
    }
    if (v15 >= 0x249249249249249) {
      unint64_t v16 = 0x492492492492492;
    }
    else {
      unint64_t v16 = v14;
    }
    if (v16) {
      size_t v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SourceInfo>>((uint64_t)(v5 + 5), v16);
    }
    else {
      size_t v17 = 0;
    }
    uint64_t v18 = &v17[56 * v13];
    char v19 = &v17[56 * v16];
    long long v20 = *(_OWORD *)v4;
    long long v21 = *((_OWORD *)v4 + 1);
    long long v22 = *((_OWORD *)v4 + 2);
    *((void *)v18 + 6) = v4[6];
    *((_OWORD *)v18 + 1) = v21;
    *((_OWORD *)v18 + 2) = v22;
    *(_OWORD *)uint64_t v18 = v20;
    char v11 = v18 + 56;
    UUID v24 = (char *)v5[3];
    uint64_t v23 = (char *)v5[4];
    if (v23 != v24)
    {
      do
      {
        long long v25 = *(_OWORD *)(v23 - 56);
        long long v26 = *(_OWORD *)(v23 - 40);
        long long v27 = *(_OWORD *)(v23 - 24);
        *((void *)v18 - 1) = *((void *)v23 - 1);
        *(_OWORD *)(v18 - 24) = v27;
        *(_OWORD *)(v18 - 4std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::reset[abi:ne180100](&a9, 0) = v26;
        *(_OWORD *)(v18 - 56) = v25;
        v18 -= 56;
        v23 -= 56;
      }
      while (v23 != v24);
      uint64_t v23 = (char *)v5[3];
    }
    v5[3] = v18;
    v5[4] = v11;
    v5[5] = v19;
    if (v23) {
      operator delete(v23);
    }
  }
  else
  {
    long long v8 = *(_OWORD *)v4;
    long long v9 = *((_OWORD *)v4 + 1);
    long long v10 = *((_OWORD *)v4 + 2);
    *(void *)(v6 + 48) = v4[6];
    *(_OWORD *)(v6 + 16) = v9;
    *(_OWORD *)(v6 + 32) = v10;
    *(_OWORD *)unint64_t v6 = v8;
    char v11 = (char *)(v6 + 56);
  }
  v5[4] = v11;
  return std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>>>::__erase_unique<unsigned long long>((void *)(a1 + 12824), &v30);
}

double DyldKdebugHandler::handleTracepointA<std::integral_constant<unsigned int,520421444u>>(uint64_t a1, __n128 *a2)
{
  uint64_t v5 = a2[2].n128_i64[1];
  unint64_t v6 = &v5;
  int v3 = std::__hash_table<std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>(a1 + 12864, &v5, (uint64_t)&std::piecewise_construct, &v6);
  *(void *)&double result = DyldKdebugAOTSharedCacheDescription::consumeTracepointA((__n128 *)(v3 + 3), a2).n128_u64[0];
  return result;
}

uint64_t *DyldKdebugHandler::handleTracepointB<std::integral_constant<unsigned int,520421448u>>(uint64_t a1, __n128 *a2)
{
  unint64_t v27 = a2[2].n128_u64[1];
  int v26 = a2[5].n128_i32[2];
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>(a1 + 12904, &v26, &v26);
  char v28 = (uint64_t *)&v27;
  uint8x8_t v4 = (__n128 *)(std::__hash_table<std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotAOTSharedCacheDescription>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>(a1 + 12864, (uint64_t *)&v27, (uint64_t)&std::piecewise_construct, &v28)+ 3);
  DyldKdebugAOTSharedCacheDescription::consumeTracepointB(v4, a2);
  char v28 = (uint64_t *)&v26;
  uint64_t v5 = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(a1 + 12624, &v26, (uint64_t)&std::piecewise_construct, (_DWORD **)&v28);
  unint64_t v6 = (__n128 *)v5[4];
  unint64_t v7 = v5[5];
  if ((unint64_t)v6 >= v7)
  {
    uint64_t v11 = v5[3];
    unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v6 - v11) >> 4);
    unint64_t v13 = v12 + 1;
    if (v12 + 1 > 0x555555555555555) {
      std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v7 - v11) >> 4);
    if (2 * v14 > v13) {
      unint64_t v13 = 2 * v14;
    }
    if (v14 >= 0x2AAAAAAAAAAAAAALL) {
      unint64_t v15 = 0x555555555555555;
    }
    else {
      unint64_t v15 = v13;
    }
    if (v15) {
      unint64_t v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Section>>((uint64_t)(v5 + 5), v15);
    }
    else {
      unint64_t v16 = 0;
    }
    size_t v17 = (__n128 *)&v16[48 * v12];
    uint64_t v18 = &v16[48 * v15];
    __n128 v19 = *v4;
    __n128 v20 = v4[2];
    v17[1] = v4[1];
    v17[2] = v20;
    *size_t v17 = v19;
    long long v10 = v17 + 3;
    long long v22 = (__n128 *)v5[3];
    long long v21 = (__n128 *)v5[4];
    if (v21 != v22)
    {
      do
      {
        __n128 v23 = v21[-3];
        __n128 v24 = v21[-1];
        v17[-2] = v21[-2];
        v17[-1] = v24;
        v17[-3] = v23;
        v17 -= 3;
        v21 -= 3;
      }
      while (v21 != v22);
      long long v21 = (__n128 *)v5[3];
    }
    v5[3] = v17;
    v5[4] = v10;
    v5[5] = v18;
    if (v21) {
      operator delete(v21);
    }
  }
  else
  {
    __n128 v8 = *v4;
    __n128 v9 = v4[2];
    v6[1] = v4[1];
    void v6[2] = v9;
    *unint64_t v6 = v8;
    long long v10 = v6 + 3;
  }
  v5[4] = v10;
  return std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>>>::__erase_unique<unsigned long long>((void *)(a1 + 12864), &v27);
}

double DyldKdebugHandler::handleTracepointA<std::integral_constant<unsigned int,520421436u>>(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(a2 + 40);
  unint64_t v6 = &v5;
  int v3 = std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugAOTImageDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugAOTImageDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugAOTImageDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugAOTImageDescription>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(a1 + 12784, &v5, (uint64_t)&std::piecewise_construct, &v6);
  *(void *)&double result = DyldKdebugAOTImageDescription::consumeTracepointA((__n128 *)(v3 + 3), a2).n128_u64[0];
  return result;
}

uint64_t *DyldKdebugHandler::handleTracepointB<std::integral_constant<unsigned int,520421440u>>(uint64_t a1, uint64_t a2)
{
  unint64_t v30 = *(void *)(a2 + 40);
  int v29 = *(_DWORD *)(a2 + 88);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>(a1 + 12904, &v29, &v29);
  uint64_t v31 = (uint64_t *)&v30;
  uint8x8_t v4 = std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugAOTImageDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugAOTImageDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugAOTImageDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugAOTImageDescription>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(a1 + 12784, (uint64_t *)&v30, (uint64_t)&std::piecewise_construct, &v31)+ 3;
  DyldKdebugAOTImageDescription::consumeTracepointB(v4, (void *)a2);
  uint64_t v31 = (uint64_t *)&v29;
  uint64_t v5 = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(a1 + 12544, &v29, (uint64_t)&std::piecewise_construct, (_DWORD **)&v31);
  unint64_t v6 = v5[4];
  unint64_t v7 = v5[5];
  if (v6 >= v7)
  {
    uint64_t v12 = v5[3];
    uint64_t v13 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v6 - v12) >> 3);
    unint64_t v14 = v13 + 1;
    if ((unint64_t)(v13 + 1) > 0x492492492492492) {
      std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v15 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v7 - v12) >> 3);
    if (2 * v15 > v14) {
      unint64_t v14 = 2 * v15;
    }
    if (v15 >= 0x249249249249249) {
      unint64_t v16 = 0x492492492492492;
    }
    else {
      unint64_t v16 = v14;
    }
    if (v16) {
      size_t v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SourceInfo>>((uint64_t)(v5 + 5), v16);
    }
    else {
      size_t v17 = 0;
    }
    uint64_t v18 = &v17[56 * v13];
    __n128 v19 = &v17[56 * v16];
    long long v20 = *(_OWORD *)v4;
    long long v21 = *((_OWORD *)v4 + 1);
    long long v22 = *((_OWORD *)v4 + 2);
    *((void *)v18 + 6) = v4[6];
    *((_OWORD *)v18 + 1) = v21;
    *((_OWORD *)v18 + 2) = v22;
    *(_OWORD *)uint64_t v18 = v20;
    uint64_t v11 = v18 + 56;
    __n128 v24 = (char *)v5[3];
    __n128 v23 = (char *)v5[4];
    if (v23 != v24)
    {
      do
      {
        long long v25 = *(_OWORD *)(v23 - 56);
        long long v26 = *(_OWORD *)(v23 - 40);
        long long v27 = *(_OWORD *)(v23 - 24);
        *((void *)v18 - 1) = *((void *)v23 - 1);
        *(_OWORD *)(v18 - 24) = v27;
        *(_OWORD *)(v18 - 4std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::reset[abi:ne180100](&a9, 0) = v26;
        *(_OWORD *)(v18 - 56) = v25;
        v18 -= 56;
        v23 -= 56;
      }
      while (v23 != v24);
      __n128 v23 = (char *)v5[3];
    }
    v5[3] = v18;
    v5[4] = v11;
    v5[5] = v19;
    if (v23) {
      operator delete(v23);
    }
  }
  else
  {
    long long v8 = *(_OWORD *)v4;
    long long v9 = *((_OWORD *)v4 + 1);
    long long v10 = *((_OWORD *)v4 + 2);
    *(void *)(v6 + 48) = v4[6];
    *(_OWORD *)(v6 + 16) = v9;
    *(_OWORD *)(v6 + 32) = v10;
    *(_OWORD *)unint64_t v6 = v8;
    uint64_t v11 = (char *)(v6 + 56);
  }
  v5[4] = v11;
  return std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>>>::__erase_unique<unsigned long long>((void *)(a1 + 12784), &v30);
}

void DyldKdebugHandler::DyldKdebugHandler(DyldKdebugHandler *this)
{
  bzero(this, 0x30F8uLL);
  *((_DWORD *)this + 3134) = 1065353216;
  *((_OWORD *)this + 784) = 0u;
  *((_OWORD *)this + 785) = 0u;
  *((_DWORD *)this + 3144) = 1065353216;
  *(_OWORD *)((char *)this + 12584) = 0u;
  *(_OWORD *)((char *)this + 1260std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::reset[abi:ne180100](&a9, 0) = 0u;
  *((_DWORD *)this + 3154) = 1065353216;
  *((_OWORD *)this + 789) = 0u;
  *((_OWORD *)this + 79std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::reset[abi:ne180100](&a9, 0) = 0u;
  *((_DWORD *)this + 3164) = 1065353216;
  *(_OWORD *)((char *)this + 12664) = 0u;
  *(_OWORD *)((char *)this + 1268std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::reset[abi:ne180100](&a9, 0) = 0u;
  *((_DWORD *)this + 3174) = 1065353216;
  *((_OWORD *)this + 794) = 0u;
  *((_OWORD *)this + 795) = 0u;
  *((_DWORD *)this + 3184) = 1065353216;
  *(_OWORD *)((char *)this + 12744) = 0u;
  *(_OWORD *)((char *)this + 1276std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::reset[abi:ne180100](&a9, 0) = 0u;
  *((_DWORD *)this + 3194) = 1065353216;
  *((_OWORD *)this + 799) = 0u;
  *((_OWORD *)this + 80std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::reset[abi:ne180100](&a9, 0) = 0u;
  *((_DWORD *)this + 3204) = 1065353216;
  *(_OWORD *)((char *)this + 12824) = 0u;
  *(_OWORD *)((char *)this + 1284std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::reset[abi:ne180100](&a9, 0) = 0u;
  *((_DWORD *)this + 3214) = 1065353216;
  *((_OWORD *)this + 804) = 0u;
  *((_OWORD *)this + 805) = 0u;
  *((_DWORD *)this + 3224) = 1065353216;
  *(_OWORD *)((char *)this + 12904) = 0u;
  *(_OWORD *)((char *)this + 1292std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::reset[abi:ne180100](&a9, 0) = 0u;
  *((_DWORD *)this + 3234) = 1065353216;
  int8x8_t v2 = (char *)operator new(0x40uLL);
  *((void *)v2 + 1) = 0;
  *((void *)v2 + 2) = 0;
  *(void *)int8x8_t v2 = &unk_26E761930;
  *((void *)v2 + 7) = 0;
  *(_OWORD *)(v2 + 4std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::reset[abi:ne180100](&a9, 0) = 0u;
  *(_OWORD *)(v2 + 24) = 0u;
  *((_DWORD *)v2 + 14) = 1065353216;
  *((void *)this + 1618) = v2 + 24;
  *((void *)this + 1619) = v2;
  *((unsigned char *)this + 1296std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::reset[abi:ne180100](&a9, 0) = 0;
}

void sub_2345CE080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table(v10);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table(v18);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table(v17);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table(v16);
  std::__hash_table<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,StackshotSharedCacheDescription>>>::~__hash_table(v15);
  std::__hash_table<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>>>::~__hash_table(v14);
  std::__hash_table<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::unordered_map<unsigned long long,StackshotSharedCacheDescription>>>>::~__hash_table(v13);
  std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::~__hash_table(a9);
  std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::~__hash_table(v12);
  std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::~__hash_table(a10);
  std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::~__hash_table(v11 + 12504);
  _Unwind_Resume(a1);
}

uint64_t DyldKdebugHandler::DyldKdebugHandler(uint64_t a1, void *a2)
{
  bzero((void *)a1, 0x30F8uLL);
  *(_DWORD *)(a1 + 12536) = 1065353216;
  *(_OWORD *)(a1 + 12544) = 0u;
  *(_OWORD *)(a1 + 1256std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::reset[abi:ne180100](&a9, 0) = 0u;
  *(_DWORD *)(a1 + 12576) = 1065353216;
  *(_OWORD *)(a1 + 12584) = 0u;
  *(_OWORD *)(a1 + 1260std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::reset[abi:ne180100](&a9, 0) = 0u;
  *(_DWORD *)(a1 + 12616) = 1065353216;
  *(_OWORD *)(a1 + 12624) = 0u;
  *(_OWORD *)(a1 + 1264std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::reset[abi:ne180100](&a9, 0) = 0u;
  *(_DWORD *)(a1 + 12656) = 1065353216;
  *(_OWORD *)(a1 + 12664) = 0u;
  *(_OWORD *)(a1 + 1268std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::reset[abi:ne180100](&a9, 0) = 0u;
  *(_DWORD *)(a1 + 12696) = 1065353216;
  *(_OWORD *)(a1 + 12704) = 0u;
  *(_OWORD *)(a1 + 1272std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::reset[abi:ne180100](&a9, 0) = 0u;
  *(_DWORD *)(a1 + 12736) = 1065353216;
  *(_OWORD *)(a1 + 12744) = 0u;
  *(_OWORD *)(a1 + 1276std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::reset[abi:ne180100](&a9, 0) = 0u;
  *(_DWORD *)(a1 + 12776) = 1065353216;
  *(_OWORD *)(a1 + 12784) = 0u;
  *(_OWORD *)(a1 + 1280std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::reset[abi:ne180100](&a9, 0) = 0u;
  *(_DWORD *)(a1 + 12816) = 1065353216;
  *(_OWORD *)(a1 + 12824) = 0u;
  *(_OWORD *)(a1 + 1284std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::reset[abi:ne180100](&a9, 0) = 0u;
  *(_DWORD *)(a1 + 12856) = 1065353216;
  *(_OWORD *)(a1 + 12864) = 0u;
  *(_OWORD *)(a1 + 1288std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::reset[abi:ne180100](&a9, 0) = 0u;
  *(_DWORD *)(a1 + 12896) = 1065353216;
  *(_OWORD *)(a1 + 12904) = 0u;
  *(_OWORD *)(a1 + 1292std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::reset[abi:ne180100](&a9, 0) = 0u;
  *(_DWORD *)(a1 + 12936) = 1065353216;
  uint64_t v4 = a2[1];
  *(void *)(a1 + 12944) = *a2;
  *(void *)(a1 + 12952) = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  *(unsigned char *)(a1 + 1296std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::reset[abi:ne180100](&a9, 0) = 0;
  return a1;
}

void *DyldKdebugHandler::libraryDescriptionsForPid@<X0>(void *this@<X0>, unsigned int a2@<W1>, void *a3@<X8>)
{
  unsigned int v5 = a2;
  if (a2 >= 0x1869F) {
    std::__throw_out_of_range[abi:ne180100]("bitset test argument out of range");
  }
  if ((*(void *)((char *)this + (((unint64_t)a2 >> 3) & 0x1FFFFFF8)) >> a2))
  {
    unint64_t v6 = (int *)&v5;
    uint64_t v4 = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t)(this + 1563), (int *)&v5, (uint64_t)&std::piecewise_construct, &v6);
    *a3 = 0;
    a3[1] = 0;
    a3[2] = 0;
    return std::vector<DyldKdebugLibraryDescription>::__init_with_size[abi:ne180100]<DyldKdebugLibraryDescription*,DyldKdebugLibraryDescription*>(a3, (const void *)v4[3], v4[4], (uint64_t)(v4[4] - v4[3]) >> 6);
  }
  else
  {
    *a3 = 0;
    a3[1] = 0;
    a3[2] = 0;
  }
  return this;
}

void *DyldKdebugHandler::sharedCacheDescriptionsForPid@<X0>(DyldKdebugHandler *this@<X0>, int a2@<W1>, void *a3@<X8>)
{
  int v6 = a2;
  unint64_t v7 = &v6;
  uint64_t v4 = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t)this + 12584, &v6, (uint64_t)&std::piecewise_construct, &v7);
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  return std::vector<DyldKdebugSharedCacheDescription>::__init_with_size[abi:ne180100]<DyldKdebugSharedCacheDescription*,DyldKdebugSharedCacheDescription*>(a3, (const void *)v4[3], v4[4], 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v4[4] - v4[3]) >> 3));
}

void *DyldKdebugHandler::aotSharedCacheDescriptionsForPid@<X0>(DyldKdebugHandler *this@<X0>, int a2@<W1>, void *a3@<X8>)
{
  int v6 = a2;
  unint64_t v7 = &v6;
  uint64_t v4 = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t)this + 12624, &v6, (uint64_t)&std::piecewise_construct, &v7);
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  return std::vector<DyldKdebugAOTSharedCacheDescription>::__init_with_size[abi:ne180100]<DyldKdebugAOTSharedCacheDescription*,DyldKdebugAOTSharedCacheDescription*>(a3, (const void *)v4[3], v4[4], 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v4[4] - v4[3]) >> 4));
}

uint64_t *DyldKdebugHandler::aotImageDescriptionsForPid@<X0>(uint64_t *this@<X0>, int a2@<W1>, void *a3@<X8>)
{
  int v6 = a2;
  if (this[1571]
    && (uint64_t v4 = (uint64_t)(this + 1568),
        (this = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::find<int>(this + 1568, &v6)) != 0))
  {
    unint64_t v7 = &v6;
    unsigned int v5 = std::__hash_table<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotSharedCacheDescription>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(v4, &v6, (uint64_t)&std::piecewise_construct, &v7);
    *a3 = 0;
    a3[1] = 0;
    a3[2] = 0;
    return std::vector<DyldKdebugAOTImageDescription>::__init_with_size[abi:ne180100]<DyldKdebugAOTImageDescription*,DyldKdebugAOTImageDescription*>(a3, (const void *)v5[3], v5[4], 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v5[4] - v5[3]) >> 3));
  }
  else
  {
    *a3 = 0;
    a3[1] = 0;
    a3[2] = 0;
  }
  return this;
}

uint64_t DyldKdebugHandler::allPids(DyldKdebugHandler *this)
{
  return (uint64_t)this + 12904;
}

void *std::vector<DyldKdebugLibraryDescription>::__init_with_size[abi:ne180100]<DyldKdebugLibraryDescription*,DyldKdebugLibraryDescription*>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    int v6 = result;
    double result = std::vector<DyldKdebugLibraryDescription>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      double result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_2345CE4C8(_Unwind_Exception *exception_object)
{
  int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<DyldKdebugLibraryDescription>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 58) {
    std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
  }
  double result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_CSBinaryImageInformation>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[64 * v4];
  return result;
}

void *std::vector<DyldKdebugSharedCacheDescription>::__init_with_size[abi:ne180100]<DyldKdebugSharedCacheDescription*,DyldKdebugSharedCacheDescription*>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    int v6 = result;
    double result = std::vector<StackshotAotImageDescription>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      double result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_2345CE588(_Unwind_Exception *exception_object)
{
  int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<DyldKdebugAOTSharedCacheDescription>::__init_with_size[abi:ne180100]<DyldKdebugAOTSharedCacheDescription*,DyldKdebugAOTSharedCacheDescription*>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    int v6 = result;
    double result = std::vector<StackshotLibraryDescription>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      double result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_2345CE604(_Unwind_Exception *exception_object)
{
  int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<DyldKdebugAOTImageDescription>::__init_with_size[abi:ne180100]<DyldKdebugAOTImageDescription*,DyldKdebugAOTImageDescription*>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    int v6 = result;
    double result = std::vector<StackshotAotImageDescription>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      double result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_2345CE680(_Unwind_Exception *exception_object)
{
  int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<int,std::vector<DyldKdebugLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<DyldKdebugLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<DyldKdebugLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<DyldKdebugLibraryDescription>>>>::clear(uint64_t a1)
{
  if (*(void *)(a1 + 24))
  {
    std::__hash_table<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<StackshotLibraryDescription>>>>::__deallocate_node(a1, *(void **)(a1 + 16));
    *(void *)(a1 + 16) = 0;
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2)
    {
      for (uint64_t i = 0; i != v2; ++i)
        *(void *)(*(void *)a1 + 8 * i) = 0;
    }
    *(void *)(a1 + 24) = 0;
  }
}

void std::__fill_n[abi:ne180100]<false,std::__bitset<1563ul,99999ul>>(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = a2;
  int v4 = *(_DWORD *)(a1 + 8);
  unsigned int v5 = *(void **)a1;
  if (v4)
  {
    if ((64 - v4) >= a2) {
      unint64_t v6 = a2;
    }
    else {
      unint64_t v6 = (64 - v4);
    }
    *v5++ &= ~((0xFFFFFFFFFFFFFFFFLL >> (64 - v4 - v6)) & (-1 << v4));
    unint64_t v2 = a2 - v6;
    *(void *)a1 = v5;
  }
  unint64_t v7 = v2 >> 6;
  if (v2 >= 0x40) {
    bzero(v5, 8 * v7);
  }
  if ((v2 & 0x3F) != 0)
  {
    size_t v8 = &v5[v7];
    *(void *)a1 = v8;
    *v8 &= ~(0xFFFFFFFFFFFFFFFFLL >> -(v2 & 0x3F));
  }
}

void *std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(uint64_t a1, uint64_t *a2, uint64_t a3, void **a4)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v6 >= v7) {
        unint64_t v4 = v6 % v7;
      }
    }
    else
    {
      unint64_t v4 = (v7 - 1) & v6;
    }
    long long v9 = *(void **)(*(void *)a1 + 8 * v4);
    if (v9)
    {
      double result = (void *)*v9;
      if (*v9)
      {
        do
        {
          unint64_t v11 = result[1];
          if (v11 == v6)
          {
            if (result[2] == v6) {
              return result;
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
            if (v11 != v4) {
              break;
            }
          }
          double result = (void *)*result;
        }
        while (result);
      }
    }
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(a1, *a2, a4, (uint64_t)&v20);
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
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7) {
        unint64_t v4 = v6 % v7;
      }
      else {
        unint64_t v4 = v6;
      }
    }
    else
    {
      unint64_t v4 = (v7 - 1) & v6;
    }
  }
  uint64_t v18 = *(void **)(*(void *)a1 + 8 * v4);
  if (v18)
  {
    *long long v20 = *v18;
    *uint64_t v18 = v20;
  }
  else
  {
    *long long v20 = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v20;
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*v20)
    {
      unint64_t v19 = *(void *)(*v20 + 8);
      if ((v7 & (v7 - 1)) != 0)
      {
        if (v19 >= v7) {
          v19 %= v7;
        }
      }
      else
      {
        v19 &= v7 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v19) = v20;
    }
  }
  double result = v20;
  ++*(void *)(a1 + 24);
  return result;
}

void sub_2345CE9B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(uint64_t a1@<X0>, uint64_t a2@<X1>, void **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  uint8x8_t v8 = (char *)operator new(0x58uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  *(void *)uint8x8_t v8 = 0;
  *((void *)v8 + 1) = a2;
  *((void *)v8 + 2) = **a3;
  *(_OWORD *)(v8 + 72) = 0u;
  *(_OWORD *)(v8 + 56) = 0u;
  *(_OWORD *)(v8 + 4std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::reset[abi:ne180100](&a9, 0) = 0u;
  *(_OWORD *)(v8 + 24) = 0u;
  LibraryDescription::LibraryDescription((LibraryDescription *)(v8 + 24));
  *(unsigned char *)(a4 + 16) = 1;
}

void sub_2345CEA54(_Unwind_Exception *a1)
{
  void *v1 = 0;
  operator delete(v2);
  _Unwind_Resume(a1);
}

uint64_t *std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>>>::__erase_unique<unsigned long long>(void *a1, unint64_t *a2)
{
  double result = std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>>>::find<unsigned long long>(a1, a2);
  if (result)
  {
    std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>>>::erase(a1, result);
    return (uint64_t *)1;
  }
  return result;
}

void *std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>>>::find<unsigned long long>(void *a1, unint64_t *a2)
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
    if (v3 >= *(void *)&v2) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v5 = (*(void *)&v2 - 1) & v3;
  }
  unint64_t v6 = *(void **)(*a1 + 8 * v5);
  if (!v6) {
    return 0;
  }
  double result = (void *)*v6;
  if (*v6)
  {
    do
    {
      unint64_t v8 = result[1];
      if (v8 == v3)
      {
        if (result[2] == v3) {
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
      double result = (void *)*result;
    }
    while (result);
  }
  return result;
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugLibraryDescription>>>::erase(void *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  std::__hash_table<std::__hash_value_type<UUID,std::string>,std::__unordered_map_hasher<UUID,std::__hash_value_type<UUID,std::string>,std::hash<UUID>,std::equal_to<UUID>,true>,std::__unordered_map_equal<UUID,std::__hash_value_type<UUID,std::string>,std::equal_to<UUID>,std::hash<UUID>,true>,std::allocator<std::__hash_value_type<UUID,std::string>>>::remove(a1, a2, (uint64_t)&__p);
  unint64_t v3 = __p;
  __std::string p = 0;
  if (v3) {
    operator delete(v3);
  }
  return v2;
}

void *std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(uint64_t a1, uint64_t *a2, uint64_t a3, void **a4)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v6 >= v7) {
        unint64_t v4 = v6 % v7;
      }
    }
    else
    {
      unint64_t v4 = (v7 - 1) & v6;
    }
    long long v9 = *(void **)(*(void *)a1 + 8 * v4);
    if (v9)
    {
      double result = (void *)*v9;
      if (*v9)
      {
        do
        {
          unint64_t v11 = result[1];
          if (v11 == v6)
          {
            if (result[2] == v6) {
              return result;
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
            if (v11 != v4) {
              break;
            }
          }
          double result = (void *)*result;
        }
        while (result);
      }
    }
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(a1, *a2, a4, (uint64_t)&v20);
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
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7) {
        unint64_t v4 = v6 % v7;
      }
      else {
        unint64_t v4 = v6;
      }
    }
    else
    {
      unint64_t v4 = (v7 - 1) & v6;
    }
  }
  uint64_t v18 = *(void **)(*(void *)a1 + 8 * v4);
  if (v18)
  {
    *long long v20 = *v18;
    *uint64_t v18 = v20;
  }
  else
  {
    *long long v20 = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v20;
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*v20)
    {
      unint64_t v19 = *(void *)(*v20 + 8);
      if ((v7 & (v7 - 1)) != 0)
      {
        if (v19 >= v7) {
          v19 %= v7;
        }
      }
      else
      {
        v19 &= v7 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v19) = v20;
    }
  }
  double result = v20;
  ++*(void *)(a1 + 24);
  return result;
}

void sub_2345CEDB0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugSharedCacheDescription>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(uint64_t a1@<X0>, uint64_t a2@<X1>, void **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  uint8x8_t v8 = (char *)operator new(0x50uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  *(void *)uint8x8_t v8 = 0;
  *((void *)v8 + 1) = a2;
  *((void *)v8 + 2) = **a3;
  *((void *)v8 + 9) = 0;
  *(_OWORD *)(v8 + 56) = 0u;
  *(_OWORD *)(v8 + 4std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::reset[abi:ne180100](&a9, 0) = 0u;
  *(_OWORD *)(v8 + 24) = 0u;
  SharedCacheDescription::SharedCacheDescription((SharedCacheDescription *)(v8 + 24));
  *(unsigned char *)(a4 + 16) = 1;
}

void sub_2345CEE4C(_Unwind_Exception *a1)
{
  void *v1 = 0;
  operator delete(v2);
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugAOTImageDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugAOTImageDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugAOTImageDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugAOTImageDescription>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(uint64_t a1, uint64_t *a2, uint64_t a3, void **a4)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v6 >= v7) {
        unint64_t v4 = v6 % v7;
      }
    }
    else
    {
      unint64_t v4 = (v7 - 1) & v6;
    }
    long long v9 = *(void **)(*(void *)a1 + 8 * v4);
    if (v9)
    {
      double result = (void *)*v9;
      if (*v9)
      {
        do
        {
          unint64_t v11 = result[1];
          if (v11 == v6)
          {
            if (result[2] == v6) {
              return result;
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
            if (v11 != v4) {
              break;
            }
          }
          double result = (void *)*result;
        }
        while (result);
      }
    }
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugAOTImageDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugAOTImageDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugAOTImageDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugAOTImageDescription>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(a1, *a2, a4, (uint64_t)&v20);
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
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7) {
        unint64_t v4 = v6 % v7;
      }
      else {
        unint64_t v4 = v6;
      }
    }
    else
    {
      unint64_t v4 = (v7 - 1) & v6;
    }
  }
  uint64_t v18 = *(void **)(*(void *)a1 + 8 * v4);
  if (v18)
  {
    *long long v20 = *v18;
    *uint64_t v18 = v20;
  }
  else
  {
    *long long v20 = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v20;
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*v20)
    {
      unint64_t v19 = *(void *)(*v20 + 8);
      if ((v7 & (v7 - 1)) != 0)
      {
        if (v19 >= v7) {
          v19 %= v7;
        }
      }
      else
      {
        v19 &= v7 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v19) = v20;
    }
  }
  double result = v20;
  ++*(void *)(a1 + 24);
  return result;
}

void sub_2345CF078(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<unsigned long long,DyldKdebugAOTImageDescription>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugAOTImageDescription>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,DyldKdebugAOTImageDescription>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,DyldKdebugAOTImageDescription>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(uint64_t a1@<X0>, uint64_t a2@<X1>, void **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  uint8x8_t v8 = (char *)operator new(0x50uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  *(void *)uint8x8_t v8 = 0;
  *((void *)v8 + 1) = a2;
  *((void *)v8 + 2) = **a3;
  *((void *)v8 + 9) = 0;
  *(_OWORD *)(v8 + 56) = 0u;
  *(_OWORD *)(v8 + 4std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::reset[abi:ne180100](&a9, 0) = 0u;
  *(_OWORD *)(v8 + 24) = 0u;
  AOTImageDescription::AOTImageDescription((AOTImageDescription *)(v8 + 24));
  *(unsigned char *)(a4 + 16) = 1;
}

void sub_2345CF114(_Unwind_Exception *a1)
{
  void *v1 = 0;
  operator delete(v2);
  _Unwind_Resume(a1);
}

void StackshotAOTSharedCacheDescription::StackshotAOTSharedCacheDescription(StackshotAOTSharedCacheDescription *this, dyld_aot_cache_uuid_info *a2)
{
}

{
  AOTSharedCacheDescription::AOTSharedCacheDescription(this, *(uint8_t **)a2->x86UUID, *(uint8_t **)&a2->x86UUID[8], *(void *)a2->aotUUID, *(void *)&a2->aotUUID[8], a2->x86SlidBaseAddress, a2->aotSlidBaseAddress);
}

void DyldKdebugFilesystemInfo::DyldKdebugFilesystemInfo(DyldKdebugFilesystemInfo *this, fsid a2, fsobj_id a3)
{
  *(fsid *)this = a2;
  *((fsobj_id *)this + 1) = a3;
}

{
  *(fsid *)this = a2;
  *((fsobj_id *)this + 1) = a3;
}

uint64_t DyldKdebugFilesystemInfo::path@<X0>(fsid_t *this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  unint64_t v6 = this;
  if (atomic_load_explicit((atomic_ullong *volatile)&DyldKdebugFilesystemInfo::path(void)::rootFsidOnce, memory_order_acquire) != -1)
  {
    *(void *)__s = &v6;
    uint64_t v7 = __s;
    std::__call_once(&DyldKdebugFilesystemInfo::path(void)::rootFsidOnce, &v7, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<DyldKdebugFilesystemInfo::path(void)::$_0 &&>>);
  }
  if (!this->val[0] && !this->val[1]) {
    *this = (fsid_t)DyldKdebugFilesystemInfo::path(void)::root_fsid;
  }
  uint64_t result = fsgetpath(__s, 0x401uLL, this, *(void *)&this[1]);
  if (result == -1)
  {
    char v5 = 0;
    *(unsigned char *)a2 = 0;
  }
  else
  {
    uint64_t result = (uint64_t)std::string::basic_string[abi:ne180100]<0>((void *)a2, __s);
    char v5 = 1;
  }
  *(unsigned char *)(a2 + 24) = v5;
  return result;
}

uint64_t DyldKdebugFilesystemInfo::fsid(DyldKdebugFilesystemInfo *this)
{
  return *(void *)this;
}

uint64_t DyldKdebugFilesystemInfo::fsobjId(DyldKdebugFilesystemInfo *this)
{
  return *((void *)this + 1);
}

fsid *DyldKdebugFilesystemInfo::setFsid(fsid *this, fsid a2)
{
  *this = a2;
  return this;
}

void *DyldKdebugFilesystemInfo::setFsid(void *this, uint64_t a2)
{
  *this = a2;
  return this;
}

fsobj_id *DyldKdebugFilesystemInfo::setFsobjId(fsobj_id *this, fsobj_id a2)
{
  this[1] = a2;
  return this;
}

uint64_t DyldKdebugFilesystemInfo::setFsobjId(uint64_t this, uint64_t a2)
{
  *(void *)(this + 8) = a2;
  return this;
}

uint64_t std::__call_once_proxy[abi:ne180100]<std::tuple<DyldKdebugFilesystemInfo::path(void)::$_0 &&>>()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  uint64_t result = statfs("/", &v1);
  DyldKdebugFilesystemInfo::path(void)::root_fsid = (uint64_t)v1.f_fsid;
  return result;
}

void LibraryDescription::LibraryDescription(LibraryDescription *this)
{
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *(_OWORD *)this = 0u;
}

{
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *(_OWORD *)this = 0u;
}

void LibraryDescription::LibraryDescription(LibraryDescription *this, uint64_t a2, UUID a3, uint64_t a4)
{
  *((void *)this + 2) = a3;
  *((void *)this + 3) = a4;
  *((void *)this + 4) = 0;
  *((void *)this + 5) = 0;
  *(void *)this = a2;
  *((void *)this + 1) = 0;
}

{
  *((void *)this + 2) = a3;
  *((void *)this + 3) = a4;
  *((void *)this + 4) = 0;
  *((void *)this + 5) = 0;
  *(void *)this = a2;
  *((void *)this + 1) = 0;
}

uint64_t LibraryDescription::loadAddress(LibraryDescription *this)
{
  return *(void *)this;
}

uint64_t LibraryDescription::uuid(LibraryDescription *this)
{
  return *((void *)this + 2);
}

uint64_t LibraryDescription::path@<X0>(uint64_t this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *(void *)(this + 40);
  if (v2)
  {
    *(_OWORD *)a2 = *(_OWORD *)(this + 32);
    LOBYTE(v2) = 1;
  }
  else
  {
    *(unsigned char *)a2 = 0;
  }
  *(unsigned char *)(a2 + 16) = v2;
  return this;
}

uint64_t LibraryDescription::libraryRange(LibraryDescription *this)
{
  return *(void *)this;
}

void *LibraryDescription::setLocation(void *this, uint64_t a2)
{
  *this = a2;
  return this;
}

uint64_t LibraryDescription::setLength(uint64_t this, uint64_t a2)
{
  *(void *)(this + 8) = a2;
  return this;
}

uint64_t LibraryDescription::hash(LibraryDescription *this)
{
  return *((void *)this + 3) ^ *((void *)this + 2);
}

BOOL LibraryDescription::operator==(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a1 + 16);
  long long v5 = *(_OWORD *)(a2 + 16);
  return (void)v2 == (void)v5 && *((void *)&v2 + 1) == *((void *)&v5 + 1);
}

void ats_symbolication_log_init(void)
{
  if (atomic_load_explicit((atomic_ullong *volatile)&ats_symbolication_log_init(void)::initOnce, memory_order_acquire) != -1)
  {
    long long v2 = &v0;
    statfs v1 = &v2;
    std::__call_once(&ats_symbolication_log_init(void)::initOnce, &v1, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<ats_symbolication_log_init(void)::$_0 &&>>);
  }
}

os_log_t std::__call_once_proxy[abi:ne180100]<std::tuple<ats_symbolication_log_init(void)::$_0 &&>>()
{
  os_log_t result = os_log_create("com.apple.appletracingsupport", "symbolication");
  ats_symbolication_log = (uint64_t)result;
  return result;
}

void StackshotSharedCacheDescription::StackshotSharedCacheDescription(StackshotSharedCacheDescription *this, dyld_uuid_info_64_v2 *a2)
{
}

{
  SharedCacheDescription::SharedCacheDescription(this, a2->imageSlidBaseAddress, a2->imageLoadAddress, *(uint8_t **)a2->imageUUID, *(void *)&a2->imageUUID[8]);
}

uint64_t SourceInfo::path@<X0>(uint64_t this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *(void *)(this + 24);
  if (v2)
  {
    *(_OWORD *)a2 = *(_OWORD *)(this + 16);
    LOBYTE(v2) = 1;
  }
  else
  {
    *(unsigned char *)a2 = 0;
  }
  *(unsigned char *)(a2 + 16) = v2;
  return this;
}

uint64_t SourceInfo::lineNumber(SourceInfo *this)
{
  return *((unsigned int *)this + 12);
}

uint64_t SourceInfo::columnNumber(SourceInfo *this)
{
  return *((unsigned int *)this + 13);
}

uint64_t SourceInfo::initializeWithCSSourceInfo(uint64_t a1)
{
  *(void *)a1 = CSSourceInfoGetRange();
  *(void *)(a1 + 8) = v2;
  uint64_t Path = CSSourceInfoGetPath();
  if (Path) {
    unint64_t v4 = (const char *)Path;
  }
  else {
    unint64_t v4 = (const char *)&unk_2345D29A6;
  }
  size_t v5 = strlen(v4);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  uint64_t Filename = CSSourceInfoGetFilename();
  if (Filename) {
    uint64_t v7 = (const char *)Filename;
  }
  else {
    uint64_t v7 = (const char *)&unk_2345D29A6;
  }
  size_t v8 = strlen(v7);
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 4std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::reset[abi:ne180100](&a9, 0) = v8;
  *(_DWORD *)(a1 + 48) = CSSourceInfoGetLineNumber();
  uint64_t result = CSSourceInfoGetColumn();
  *(_DWORD *)(a1 + 52) = result;
  return result;
}

uint64_t SourceInfo::debug(SourceInfo *this)
{
  if (*((void *)this + 3)) {
    printf("%s");
  }
  else {
    printf("<null>");
  }
  return printf(":%d\n", *((_DWORD *)this + 12));
}

_OWORD *SourceInfo::SourceInfo(_OWORD *a1)
{
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  if ((CSIsNull() & 1) == 0) {
    SourceInfo::initializeWithCSSourceInfo((uint64_t)a1);
  }
  return a1;
}

{
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  if ((CSIsNull() & 1) == 0) {
    SourceInfo::initializeWithCSSourceInfo((uint64_t)a1);
  }
  return a1;
}

__n128 AOTSharedCache::AOTSharedCache(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

{
  __n128 result;
  long long v3;

  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t AOTSharedCache::translateFromNativeAddress(AOTSharedCache *this, void *a2)
{
  return 0;
}

__n128 AOTSharedCache::aotSharedCacheInfo@<Q0>(AOTSharedCache *this@<X0>, uint64_t a2@<X8>)
{
  long long v2 = *((_OWORD *)this + 1);
  *(_OWORD *)a2 = *(_OWORD *)this;
  *(_OWORD *)(a2 + 16) = v2;
  __n128 result = *((__n128 *)this + 2);
  *(__n128 *)(a2 + 32) = result;
  return result;
}

uint64_t SharedCache::SharedCache(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  long long v3 = *(_OWORD *)(a2 + 16);
  v7[0] = *(_OWORD *)a2;
  v7[1] = v3;
  uint64_t v8 = *(void *)(a2 + 32);
  unint64_t v4 = (char *)operator new(0x40uLL);
  *((void *)v4 + 1) = 0;
  *((void *)v4 + 2) = 0;
  *(void *)unint64_t v4 = &unk_26E761930;
  *((void *)v4 + 7) = 0;
  *(_OWORD *)(v4 + 4std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::reset[abi:ne180100](&a9, 0) = 0u;
  *(_OWORD *)(v4 + 24) = 0u;
  *((_DWORD *)v4 + 14) = 1065353216;
  v6[0] = v4 + 24;
  v6[1] = v4;
  SharedCache::SharedCache(a1, (SharedCache *)v7, v6);
  std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v4);
  return a1;
}

{
  long long v3;
  char *v4;
  void v6[2];
  _OWORD v7[2];
  uint64_t v8;
  uint64_t v9;

  uint64_t v9 = *MEMORY[0x263EF8340];
  long long v3 = *(_OWORD *)(a2 + 16);
  v7[0] = *(_OWORD *)a2;
  v7[1] = v3;
  uint64_t v8 = *(void *)(a2 + 32);
  unint64_t v4 = (char *)operator new(0x40uLL);
  *((void *)v4 + 1) = 0;
  *((void *)v4 + 2) = 0;
  *(void *)unint64_t v4 = &unk_26E761930;
  *((void *)v4 + 7) = 0;
  *(_OWORD *)(v4 + 4std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::reset[abi:ne180100](&a9, 0) = 0u;
  *(_OWORD *)(v4 + 24) = 0u;
  *((_DWORD *)v4 + 14) = 1065353216;
  v6[0] = v4 + 24;
  v6[1] = v4;
  SharedCache::SharedCache(a1, (SharedCache *)v7, v6);
  std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v4);
  return a1;
}

void sub_2345CF7E0(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void SharedCache::SharedCache(uint64_t a1, SharedCache *this, void *a3)
{
  *(void *)a1 = *a3;
  uint64_t v4 = a3[1];
  *(void *)(a1 + 8) = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 8std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::reset[abi:ne180100](&a9, 0) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(void *)(a1 + 112) = 0;
  long long v5 = *(_OWORD *)this;
  long long v6 = *((_OWORD *)this + 1);
  *(void *)(a1 + 152) = *((void *)this + 4);
  *(_OWORD *)(a1 + 136) = v6;
  *(_OWORD *)(a1 + 12std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::reset[abi:ne180100](&a9, 0) = v5;
  uint64_t v7 = (SharedCacheSymbolicators *)SharedCacheDescription::uuid(this);
  uint64_t v9 = v8;
  *(void *)(a1 + 16) = SharedCacheSymbolicators::cachedSharedCacheSymbolicatorByUUID(v7, v8);
  *(void *)(a1 + 24) = v10;
  if (CSIsNull()) {
    SharedCacheSymbolicators::createSharedCacheSymbolicatorByUUID(v7, v9);
  }
  CSRetain();
  if ((CSIsNull() & 1) == 0)
  {
    SharedCacheMetadata::populateWithSharedCacheSymbolicator(a1 + 32);
    CSSymbolicatorForeachSymbolOwnerAtTime();
  }
}

void sub_2345CF99C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::reset[abi:ne180100](&a9, 0);
  unint64_t v11 = (void *)v9[12];
  if (v11)
  {
    v9[13] = v11;
    operator delete(v11);
  }
  float v12 = (std::__shared_weak_count *)v9[11];
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
  float v13 = (std::__shared_weak_count *)v9[1];
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
  _Unwind_Resume(a1);
}

void sub_2345CFAB8(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>::release(uint64_t *a1)
{
  if (*((unsigned char *)a1 + 16)) {
    CSRelease();
  }
  uint64_t result = *a1;
  *a1 = 0;
  a1[1] = 0;
  return result;
}

void ___ZN11SharedCacheC2E22SharedCacheDescriptionRKNSt3__110shared_ptrI10StringPoolEE_block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  long long v2 = *(uint64_t **)(a1 + 32);
  Baseuint64_t Address = CSSymbolOwnerGetBaseAddress();
  uint64_t CFUUIDBytes = CSSymbolOwnerGetCFUUIDBytes();
  if (CFUUIDBytes)
  {
    uint64_t v5 = CFUUIDBytes;
    uint64_t v6 = SharedCacheDescription::slide((SharedCacheDescription *)(a1 + 40));
    if (v7) {
      uint64_t v8 = v6;
    }
    else {
      uint64_t v8 = 0;
    }
    LibraryDescription::LibraryDescription((LibraryDescription *)&v43, v8 + BaseAddress, *(uint8_t **)v5, *(void *)(v5 + 8));
    uint64_t v39 = 0;
    uint64_t v40 = &v39;
    uint64_t v41 = 0x2000000000;
    uint64_t v42 = 0;
    uint64_t v34 = MEMORY[0x263EF8330];
    uint64_t v35 = 0x40000000;
    char v36 = ___ZN11SharedCacheC2E22SharedCacheDescriptionRKNSt3__110shared_ptrI10StringPoolEE_block_invoke_2;
    uint64_t v37 = &unk_264BF4608;
    uint64_t v38 = &v39;
    CSSymbolOwnerForeachSegment();
    LibraryDescription::setLength((uint64_t)&v43, v40[3] - BaseAddress);
    uint64_t Path = (char *)CSSymbolOwnerGetPath();
    if (Path)
    {
      uint64_t v10 = *v2;
      std::string::basic_string[abi:ne180100]<0>(__p, Path);
      StringPool::cacheString(v10, (unsigned __int8 *)__p, (uint64_t)&v32);
      if (v31 < 0) {
        operator delete(__p[0]);
      }
      if (v33) {
        long long v45 = v32;
      }
      unint64_t v11 = v2[14];
      float v12 = (_OWORD *)v2[13];
      if ((unint64_t)v12 >= v11)
      {
        uint64_t v16 = v2[12];
        unint64_t v17 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v12 - v16) >> 4);
        unint64_t v18 = v17 + 1;
        if (v17 + 1 > 0x555555555555555) {
          std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v19 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v11 - v16) >> 4);
        if (2 * v19 > v18) {
          unint64_t v18 = 2 * v19;
        }
        if (v19 >= 0x2AAAAAAAAAAAAAALL) {
          unint64_t v20 = 0x555555555555555;
        }
        else {
          unint64_t v20 = v18;
        }
        if (v20) {
          long long v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Section>>((uint64_t)(v2 + 14), v20);
        }
        else {
          long long v21 = 0;
        }
        long long v22 = &v21[48 * v17];
        __n128 v23 = &v21[48 * v20];
        long long v24 = v43;
        long long v25 = v45;
        *((_OWORD *)v22 + 1) = v44;
        *((_OWORD *)v22 + 2) = v25;
        *(_OWORD *)long long v22 = v24;
        unint64_t v15 = v22 + 48;
        long long v27 = (char *)v2[12];
        long long v26 = (char *)v2[13];
        if (v26 != v27)
        {
          do
          {
            long long v28 = *((_OWORD *)v26 - 3);
            long long v29 = *((_OWORD *)v26 - 1);
            *((_OWORD *)v22 - 2) = *((_OWORD *)v26 - 2);
            *((_OWORD *)v22 - 1) = v29;
            *((_OWORD *)v22 - 3) = v28;
            v22 -= 48;
            v26 -= 48;
          }
          while (v26 != v27);
          long long v26 = (char *)v2[12];
        }
        v2[12] = (uint64_t)v22;
        v2[13] = (uint64_t)v15;
        v2[14] = (uint64_t)v23;
        if (v26) {
          operator delete(v26);
        }
      }
      else
      {
        long long v13 = v43;
        long long v14 = v45;
        v12[1] = v44;
        _OWORD v12[2] = v14;
        *float v12 = v13;
        unint64_t v15 = v12 + 3;
      }
      v2[13] = (uint64_t)v15;
    }
    _Block_object_dispose(&v39, 8);
  }
}

void sub_2345CFDA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Block_object_dispose(&a23, 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZN11SharedCacheC2E22SharedCacheDescriptionRKNSt3__110shared_ptrI10StringPoolEE_block_invoke_2(uint64_t a1)
{
  uint64_t result = CSRegionGetRange();
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = result + v4;
  if (*(void *)(v3 + 24) > (unint64_t)(result + v4)) {
    uint64_t v5 = *(void *)(v3 + 24);
  }
  *(void *)(v3 + 24) = v5;
  return result;
}

uint64_t SharedCache::SharedCache(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)(a1 + 32) = 0u;
  uint64_t v6 = a1 + 32;
  *(void *)(a1 + 112) = 0;
  *(_OWORD *)(a1 + 8std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::reset[abi:ne180100](&a9, 0) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  SharedCacheDescription::SharedCacheDescription((SharedCacheDescription *)(a1 + 120));
  *(void *)(a1 + 16) = a2;
  *(void *)(a1 + 24) = a3;
  if ((CSIsNull() & 1) == 0)
  {
    CSRetain();
    SharedCacheMetadata::populateWithSharedCacheSymbolicator(v6);
  }
  return a1;
}

void sub_2345CFEB0(_Unwind_Exception *a1)
{
  uint64_t v3 = *(void **)(v1 + 96);
  if (v3)
  {
    *(void *)(v1 + 104) = v3;
    operator delete(v3);
  }
  SharedCache::SharedCache(v1);
  _Unwind_Resume(a1);
}

uint64_t SharedCache::SharedCache(uint64_t a1, __n128 *a2)
{
  *(void *)(a1 + 112) = 0;
  *(_OWORD *)(a1 + 8std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::reset[abi:ne180100](&a9, 0) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  SharedCacheDescription::SharedCacheDescription((SharedCacheDescription *)(a1 + 120));

  return SharedCache::operator=(a1, a2);
}

void sub_2345CFF30(_Unwind_Exception *a1)
{
  uint64_t v3 = *(void **)(v1 + 96);
  if (v3)
  {
    *(void *)(v1 + 104) = v3;
    operator delete(v3);
  }
  SharedCache::SharedCache(v1);
  _Unwind_Resume(a1);
}

uint64_t SharedCache::operator=(uint64_t a1, __n128 *a2)
{
  if ((__n128 *)a1 != a2)
  {
    SharedCacheMetadata::operator=(a1 + 32, (uint64_t)&a2[2]);
    std::vector<AOTImage>::__move_assign(a1 + 96, a2 + 6);
    *(__n128 *)(a1 + 16) = a2[1];
    __n128 v4 = *a2;
    a2->n128_u64[0] = 0;
    a2->n128_u64[1] = 0;
    uint64_t v5 = *(std::__shared_weak_count **)(a1 + 8);
    *(__n128 *)a1 = v4;
    if (v5) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    }
    a2[1].n128_u64[0] = 0;
    a2[1].n128_u64[1] = 0;
  }
  return a1;
}

void SharedCache::SharedCache(SharedCache *this, const SharedCache *a2)
{
  *((void *)this + 14) = 0;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  SharedCacheDescription::SharedCacheDescription((SharedCache *)((char *)this + 120));
  SharedCache::operator=((uint64_t)this, (long long *)a2);
}

void sub_2345D0020(_Unwind_Exception *a1)
{
  uint64_t v3 = *(void **)(v1 + 96);
  if (v3)
  {
    *(void *)(v1 + 104) = v3;
    operator delete(v3);
  }
  SharedCache::SharedCache(v1);
  _Unwind_Resume(a1);
}

uint64_t SharedCache::operator=(uint64_t a1, long long *a2)
{
  if ((long long *)a1 != a2)
  {
    SharedCacheMetadata::operator=(a1 + 32, a2 + 2);
    std::vector<LibraryDescription>::__assign_with_size[abi:ne180100]<LibraryDescription*,LibraryDescription*>((char *)(a1 + 96), *((char **)a2 + 12), *((void *)a2 + 13), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a2 + 13) - *((void *)a2 + 12)) >> 4));
    uint64_t v5 = *(void *)a2;
    uint64_t v4 = *((void *)a2 + 1);
    if (v4) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
    }
    uint64_t v6 = *(std::__shared_weak_count **)(a1 + 8);
    *(void *)a1 = v5;
    *(void *)(a1 + 8) = v4;
    if (v6) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    }
    *(void *)(a1 + 16) = CSRetain();
    *(void *)(a1 + 24) = v7;
  }
  return a1;
}

uint64_t SharedCacheMetadata::operator=(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  long long v3 = *(_OWORD *)(a2 + 48);
  *(void *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = 0;
  uint64_t v4 = *(std::__shared_weak_count **)(a1 + 56);
  *(_OWORD *)(a1 + 48) = v3;
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  return a1;
}

uint64_t SharedCacheMetadata::operator=(uint64_t a1, long long *a2)
{
  long long v3 = *a2;
  long long v4 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v4;
  *(_OWORD *)a1 = v3;
  uint64_t v6 = *((void *)a2 + 6);
  uint64_t v5 = *((void *)a2 + 7);
  if (v5) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v7 = *(std::__shared_weak_count **)(a1 + 56);
  *(void *)(a1 + 48) = v6;
  *(void *)(a1 + 56) = v5;
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  return a1;
}

uint64_t SharedCache::libraryDescriptions(SharedCache *this)
{
  return (uint64_t)this + 96;
}

uint64_t SharedCache::baseAddress(SharedCache *this)
{
  return SharedCacheDescription::baseAddress((SharedCache *)((char *)this + 120));
}

uint64_t SharedCache::loadAddress(SharedCache *this)
{
  return SharedCacheDescription::loadAddress((SharedCache *)((char *)this + 120));
}

uint64_t SharedCache::uuid(SharedCache *this)
{
  return SharedCacheDescription::uuid((SharedCache *)((char *)this + 120));
}

void SharedCache::~SharedCache(SharedCache *this)
{
  CSRelease();
  long long v2 = (void *)*((void *)this + 12);
  if (v2)
  {
    *((void *)this + 13) = v2;
    operator delete(v2);
  }
  long long v3 = (std::__shared_weak_count *)*((void *)this + 11);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  long long v4 = (std::__shared_weak_count *)*((void *)this + 1);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
}

uint64_t SharedCache::symbolicator(SharedCache *this)
{
  return *((void *)this + 2);
}

char *std::vector<LibraryDescription>::__assign_with_size[abi:ne180100]<LibraryDescription*,LibraryDescription*>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  uint64_t v7 = result;
  uint64_t v8 = *((void *)result + 2);
  uint64_t v9 = *(char **)result;
  if (0xAAAAAAAAAAAAAAABLL * ((v8 - *(void *)result) >> 4) < a4)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      uint64_t v8 = 0;
      void *v7 = 0;
      v7[1] = 0;
      _OWORD v7[2] = 0;
    }
    if (a4 > 0x555555555555555) {
      std::vector<_CSBinaryImageInformation>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (v8 >> 4);
    uint64_t v11 = 2 * v10;
    if (2 * v10 <= a4) {
      uint64_t v11 = a4;
    }
    if (v10 >= 0x2AAAAAAAAAAAAAALL) {
      unint64_t v12 = 0x555555555555555;
    }
    else {
      unint64_t v12 = v11;
    }
    uint64_t result = std::vector<StackshotLibraryDescription>::__vallocate[abi:ne180100](v7, v12);
    long long v14 = (char *)v7[1];
    long long v13 = (void **)(v7 + 1);
    uint64_t v9 = v14;
LABEL_16:
    size_t v17 = a3 - (void)__src;
    if (v17)
    {
      unint64_t v18 = v9;
      unint64_t v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  long long v13 = (void **)(result + 8);
  unint64_t v15 = (unsigned char *)*((void *)result + 1);
  if (0xAAAAAAAAAAAAAAABLL * ((v15 - v9) >> 4) >= a4) {
    goto LABEL_16;
  }
  uint64_t v16 = &__src[16 * ((v15 - v9) >> 4)];
  if (v15 != v9)
  {
    uint64_t result = (char *)memmove(*(void **)result, __src, v15 - v9);
    uint64_t v9 = (char *)*v13;
  }
  size_t v17 = a3 - (void)v16;
  if (v17)
  {
    unint64_t v18 = v9;
    unint64_t v19 = v16;
LABEL_18:
    uint64_t result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *long long v13 = &v9[v17];
  return result;
}

double SharedLibraryMetadata::SharedLibraryMetadata(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a1 + 72) = 0;
  *(unsigned char *)(a1 + 76) = 0;
  *(unsigned char *)(a1 + 84) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(unsigned char *)(a1 + 64) = 0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  return result;
}

{
  double result;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a1 + 72) = 0;
  *(unsigned char *)(a1 + 76) = 0;
  *(unsigned char *)(a1 + 84) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(unsigned char *)(a1 + 64) = 0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  return result;
}

uint64_t SharedLibraryMetadata::SharedLibraryMetadata(uint64_t a1, long long *a2)
{
  long long v3 = *a2;
  *(void *)a2 = 0;
  *((void *)a2 + 1) = 0;
  *(unsigned char *)(a1 + 72) = 0;
  *(unsigned char *)(a1 + 76) = 0;
  *(unsigned char *)(a1 + 84) = 0;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(unsigned char *)(a1 + 64) = 0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  SharedLibraryMetadata::initializeWithCSSymbolOwner(a1);
  return a1;
}

{
  long long v3;

  long long v3 = *a2;
  *(void *)a2 = 0;
  *((void *)a2 + 1) = 0;
  *(unsigned char *)(a1 + 72) = 0;
  *(unsigned char *)(a1 + 76) = 0;
  *(unsigned char *)(a1 + 84) = 0;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(unsigned char *)(a1 + 64) = 0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  SharedLibraryMetadata::initializeWithCSSymbolOwner(a1);
  return a1;
}

void sub_2345D0400(_Unwind_Exception *exception_object)
{
  long long v3 = *(std::__shared_weak_count **)(v1 + 8);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  _Unwind_Resume(exception_object);
}

size_t SharedLibraryMetadata::initializeWithCSSymbolOwner(uint64_t a1)
{
  uint64_t CFUUIDBytes = (_OWORD *)CSSymbolOwnerGetCFUUIDBytes();
  if (CFUUIDBytes) {
    *(_OWORD *)(a1 + 16) = *CFUUIDBytes;
  }
  *(void *)(a1 + 88) = CSSymbolOwnerGetArchitecture();
  uint64_t Path = CSSymbolOwnerGetPath();
  if (Path) {
    long long v4 = (const char *)Path;
  }
  else {
    long long v4 = (const char *)&unk_2345D29A6;
  }
  size_t result = strlen(v4);
  *(void *)(a1 + 48) = v4;
  *(void *)(a1 + 56) = result;
  return result;
}

void sub_2345D04F0(_Unwind_Exception *exception_object)
{
  long long v3 = *(std::__shared_weak_count **)(v1 + 8);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SharedLibraryMetadata::debug(SharedLibraryMetadata *this)
{
  puts("Shared Library Metadata:");
  uint64_t v2 = *((void *)this + 7);
  if (v2) {
    long long v3 = (const char *)*((void *)this + 6);
  }
  else {
    long long v3 = 0;
  }
  SharedLibraryMetadata::uuidString(this, (uint64_t)&v7);
  printf("\tPath: ");
  if (v2) {
    printf("%s", v3);
  }
  else {
    printf("%s", "<null>");
  }
  printf("\tUUID: ");
  if (v8) {
    long long v4 = v7;
  }
  else {
    long long v4 = "<null>";
  }
  printf("%s", v4);
  Familyuint64_t Name = (const char *)CSArchitectureGetFamilyName();
  return printf("\tArch: %s\n", FamilyName);
}

uint64_t SharedLibraryMetadata::path@<X0>(uint64_t this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *(void *)(this + 56);
  if (v2)
  {
    *(_OWORD *)a2 = *(_OWORD *)(this + 48);
    LOBYTE(v2) = 1;
  }
  else
  {
    *(unsigned char *)a2 = 0;
  }
  *(unsigned char *)(a2 + 16) = v2;
  return this;
}

void SharedLibraryMetadata::uuidString(SharedLibraryMetadata *this@<X0>, uint64_t a2@<X8>)
{
  long long v3 = (_OWORD *)((char *)this + 32);
  if (*((void *)this + 5))
  {
    *(_OWORD *)a2 = *v3;
    *(unsigned char *)(a2 + 16) = 1;
  }
  else
  {
    UUID::uuidString((UUID *)((uint8_t *)this + 1), (uint64_t)__p);
    if (!v11) {
      goto LABEL_10;
    }
    StringPool::cacheString(*(void *)this, (unsigned __int8 *)__p, (uint64_t)&v7);
    int v5 = v8;
    if (v8)
    {
      long long v6 = v7;
      *long long v3 = v7;
      *(_OWORD *)a2 = v6;
      *(unsigned char *)(a2 + 16) = 1;
    }
    if (v11)
    {
      if (v10 < 0) {
        operator delete(__p[0]);
      }
    }
    if (!v5)
    {
LABEL_10:
      *(unsigned char *)a2 = 0;
      *(unsigned char *)(a2 + 16) = 0;
    }
  }
}

void sub_2345D06C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19)
{
  if (a19)
  {
    if (a18 < 0) {
      operator delete(__p);
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t SharedLibraryMetadata::architecture(SharedLibraryMetadata *this)
{
  return *((void *)this + 11);
}

uint64_t SharedLibraryMetadata::uuid(SharedLibraryMetadata *this)
{
  return *((void *)this + 2);
}

uint64_t SharedLibraryMetadata::fsid(SharedLibraryMetadata *this)
{
  return *((void *)this + 8);
}

uint64_t SharedLibraryMetadata::fsobj_id(SharedLibraryMetadata *this)
{
  return *(void *)((char *)this + 76);
}

uint64_t SharedLibraryMetadata::bundleID@<X0>(uint64_t this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *(void *)(this + 104);
  if (v2)
  {
    *(_OWORD *)a2 = *(_OWORD *)(this + 96);
    LOBYTE(v2) = 1;
  }
  else
  {
    *(unsigned char *)a2 = 0;
  }
  *(unsigned char *)(a2 + 16) = v2;
  return this;
}

uint64_t SharedLibraryMetadata::dsymPath@<X0>(uint64_t this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *(void *)(this + 120);
  if (v2)
  {
    *(_OWORD *)a2 = *(_OWORD *)(this + 112);
    LOBYTE(v2) = 1;
  }
  else
  {
    *(unsigned char *)a2 = 0;
  }
  *(unsigned char *)(a2 + 16) = v2;
  return this;
}

void Process::Process(uint64_t a1, void **a2)
{
  long long v4 = *(std::__shared_weak_count **)(a1 + 120);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  int v5 = *a2;
  if (*a2)
  {
    *(void *)(a1 + 4std::unique_ptr<ScopeGuard<_CSTypeRef,ScopeGuardPolicy<_CSTypeRef>>>::reset[abi:ne180100](&a9, 0) = v5;
    operator delete(v5);
  }
}

void SymbolicationSession::sharedLibraryWithCSSymbolOwner()
{
  OUTLINED_FUNCTION_0(*MEMORY[0x263EF8340]);
  int v2 = 136315138;
  uint64_t v3 = v0;
  _os_log_debug_impl(&dword_2345B5000, v1, OS_LOG_TYPE_DEBUG, "Failed to store shared library with UUID %s", (uint8_t *)&v2, 0xCu);
}

void SymbolicationSession::sharedLibraryWithUUIDAndPath()
{
  OUTLINED_FUNCTION_0(*MEMORY[0x263EF8340]);
  int v3 = 136315394;
  uint64_t v4 = v0;
  __int16 v5 = 2080;
  uint64_t v6 = v1;
  _os_log_debug_impl(&dword_2345B5000, v2, OS_LOG_TYPE_DEBUG, "Failed to store shared library with UUID %s, path %s", (uint8_t *)&v3, 0x16u);
}

void SymbolicationSession::collectLiveLibraryDescriptionsForPid(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_2345B5000, a2, OS_LOG_TYPE_DEBUG, "Failed to acquire live library info for pid %d", (uint8_t *)v2, 8u);
}

void SymbolicationSession::writeProcessMapsToKtraceFile(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2345B5000, log, OS_LOG_TYPE_ERROR, "Failed to append process maps chunk", v1, 2u);
}

void SymbolicationSession::addNewProcessWithDataProvider<Stackshot>(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_2345B5000, a2, OS_LOG_TYPE_ERROR, "Failed to create Process representation for pid %d", (uint8_t *)v2, 8u);
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<SymbolicationSession::collectLiveLibraryDescriptionsForPid(int,std::unordered_set<LibraryDescription> &)::$_0 &&>>(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_2345B5000, log, OS_LOG_TYPE_DEBUG, "Preparing kernel mappings", v1, 2u);
}

void SharedCache::SharedCache(uint64_t a1)
{
  os_log_t v2 = *(std::__shared_weak_count **)(a1 + 88);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 8);
  if (v3)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t CSAddressSetAddRange()
{
  return MEMORY[0x270F23680]();
}

uint64_t CSAddressSetCreate()
{
  return MEMORY[0x270F23688]();
}

uint64_t CSArchitectureGetFamilyName()
{
  return MEMORY[0x270F236A0]();
}

uint64_t CSIsNull()
{
  return MEMORY[0x270F236B0]();
}

uint64_t CSRegionForeachSymbol()
{
  return MEMORY[0x270F236C0]();
}

uint64_t CSRegionGetName()
{
  return MEMORY[0x270F236C8]();
}

uint64_t CSRegionGetRange()
{
  return MEMORY[0x270F236D0]();
}

uint64_t CSRelease()
{
  return MEMORY[0x270F236D8]();
}

uint64_t CSRetain()
{
  return MEMORY[0x270F236E0]();
}

uint64_t CSSegmentForeachSection()
{
  return MEMORY[0x270F236E8]();
}

uint64_t CSSourceInfoGetColumn()
{
  return MEMORY[0x270F236F0]();
}

uint64_t CSSourceInfoGetFilename()
{
  return MEMORY[0x270F236F8]();
}

uint64_t CSSourceInfoGetLineNumber()
{
  return MEMORY[0x270F23700]();
}

uint64_t CSSourceInfoGetPath()
{
  return MEMORY[0x270F23708]();
}

uint64_t CSSourceInfoGetRange()
{
  return MEMORY[0x270F23710]();
}

uint64_t CSSymbolForeachInlineRangeAtDepth()
{
  return MEMORY[0x270F23718]();
}

uint64_t CSSymbolForeachSourceInfo()
{
  return MEMORY[0x270F23720]();
}

uint64_t CSSymbolGetFlags()
{
  return MEMORY[0x270F23728]();
}

uint64_t CSSymbolGetMangledName()
{
  return MEMORY[0x270F23730]();
}

uint64_t CSSymbolGetName()
{
  return MEMORY[0x270F23738]();
}

uint64_t CSSymbolGetRange()
{
  return MEMORY[0x270F23740]();
}

uint64_t CSSymbolOwnerCreateSignature()
{
  return MEMORY[0x270F23750]();
}

uint64_t CSSymbolOwnerCreateSparseDataWithBlock()
{
  return MEMORY[0x270F23758]();
}

uint64_t CSSymbolOwnerCreateSparseSignatureWithFlags()
{
  return MEMORY[0x270F23760]();
}

uint64_t CSSymbolOwnerForeachSegment()
{
  return MEMORY[0x270F23770]();
}

uint64_t CSSymbolOwnerGetArchitecture()
{
  return MEMORY[0x270F23788]();
}

uint64_t CSSymbolOwnerGetBaseAddress()
{
  return MEMORY[0x270F23790]();
}

uint64_t CSSymbolOwnerGetCFUUIDBytes()
{
  return MEMORY[0x270F23798]();
}

uint64_t CSSymbolOwnerGetPath()
{
  return MEMORY[0x270F237B0]();
}

uint64_t CSSymbolOwnerGetSourceInfoCount()
{
  return MEMORY[0x270F237B8]();
}

uint64_t CSSymbolOwnerGetSymbolWithAddress()
{
  return MEMORY[0x270F237C0]();
}

uint64_t CSSymbolOwnerGetSymbolicator()
{
  return MEMORY[0x270F237D0]();
}

uint64_t CSSymbolOwnerIsAOut()
{
  return MEMORY[0x270F237D8]();
}

uint64_t CSSymbolOwnerIsDyldSharedCache()
{
  return MEMORY[0x270F237E0]();
}

uint64_t CSSymbolOwnerIsKextBundle()
{
  return MEMORY[0x270F237E8]();
}

uint64_t CSSymbolOwnerSetPathForSymbolication()
{
  return MEMORY[0x270F237F0]();
}

uint64_t CSSymbolicatorCreateFlatbufferSignatureForSymbolicatorsWithBlock()
{
  return MEMORY[0x270F237F8]();
}

uint64_t CSSymbolicatorCreateNonFaultingWithSignatureAndGroupKey()
{
  return MEMORY[0x270F23800]();
}

uint64_t CSSymbolicatorCreateSignature()
{
  return MEMORY[0x270F23808]();
}

uint64_t CSSymbolicatorCreateWithBinaryImageListPidAndSharedCacheUUID()
{
  return MEMORY[0x270F23810]();
}

uint64_t CSSymbolicatorCreateWithMachKernelFlagsAndNotification()
{
  return MEMORY[0x270F23820]();
}

uint64_t CSSymbolicatorCreateWithPid()
{
  return MEMORY[0x270F23830]();
}

uint64_t CSSymbolicatorCreateWithSharedCacheUUID()
{
  return MEMORY[0x270F23838]();
}

uint64_t CSSymbolicatorCreateWithSignature()
{
  return MEMORY[0x270F23840]();
}

uint64_t CSSymbolicatorForeachFlatbufferSymbolicatorInSignature()
{
  return MEMORY[0x270F23850]();
}

uint64_t CSSymbolicatorForeachSymbolOwnerAtTime()
{
  return MEMORY[0x270F23860]();
}

uint64_t CSSymbolicatorForeachSymbolicatorWithPath()
{
  return MEMORY[0x270F23880]();
}

uint64_t CSSymbolicatorGetAOutSymbolOwner()
{
  return MEMORY[0x270F23890]();
}

uint64_t CSSymbolicatorGetArchitecture()
{
  return MEMORY[0x270F23898]();
}

uint64_t CSSymbolicatorGetPid()
{
  return MEMORY[0x270F238B0]();
}

uint64_t CSSymbolicatorGetSharedCacheBaseAddress()
{
  return MEMORY[0x270F238B8]();
}

uint64_t CSSymbolicatorGetSharedCacheUUID()
{
  return MEMORY[0x270F238C0]();
}

uint64_t CSSymbolicatorGetSymbolOwner()
{
  return MEMORY[0x270F238C8]();
}

uint64_t CSSymbolicatorIsKernelSymbolicator()
{
  return MEMORY[0x270F23900]();
}

uint64_t CSSymbolicatorResymbolicateFromDebugSymbolsInfo()
{
  return MEMORY[0x270F23908]();
}

uint64_t OSLogLookupPathWithUUID()
{
  return MEMORY[0x270F47B50]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

const std::__fs::filesystem::directory_entry *__cdecl std::__fs::filesystem::directory_iterator::__dereference(const std::__fs::filesystem::directory_iterator *this)
{
  return (const std::__fs::filesystem::directory_entry *)MEMORY[0x270F98278](this);
}

const std::__fs::filesystem::directory_entry *__cdecl std::__fs::filesystem::recursive_directory_iterator::__dereference(const std::__fs::filesystem::recursive_directory_iterator *this)
{
  return (const std::__fs::filesystem::directory_entry *)MEMORY[0x270F98280](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

void std::__call_once(std::once_flag::_State_type *a1, void *a2, void (__cdecl *a3)(void *))
{
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F98480](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

std::__fs::filesystem::directory_iterator *__cdecl std::__fs::filesystem::directory_iterator::__increment(std::__fs::filesystem::directory_iterator *this, std::error_code *__ec)
{
  return (std::__fs::filesystem::directory_iterator *)MEMORY[0x270F98AF8](this, __ec);
}

std::__fs::filesystem::directory_iterator *__cdecl std::__fs::filesystem::directory_iterator::directory_iterator(std::__fs::filesystem::directory_iterator *this, const std::__fs::filesystem::path *a2, std::error_code *a3, std::__fs::filesystem::directory_options a4)
{
  return (std::__fs::filesystem::directory_iterator *)MEMORY[0x270F98B00](this, a2, a3, a4);
}

std::__fs::filesystem::recursive_directory_iterator *__cdecl std::__fs::filesystem::recursive_directory_iterator::__increment(std::__fs::filesystem::recursive_directory_iterator *this, std::error_code *__ec)
{
  return (std::__fs::filesystem::recursive_directory_iterator *)MEMORY[0x270F98B20](this, __ec);
}

std::__fs::filesystem::recursive_directory_iterator *__cdecl std::__fs::filesystem::recursive_directory_iterator::recursive_directory_iterator(std::__fs::filesystem::recursive_directory_iterator *this, const std::__fs::filesystem::path *__p, std::__fs::filesystem::directory_options __opt, std::error_code *__ec)
{
  return (std::__fs::filesystem::recursive_directory_iterator *)MEMORY[0x270F98B28](this, __p, __opt, __ec);
}

std::__fs::filesystem::file_status std::__fs::filesystem::__status(const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return (std::__fs::filesystem::file_status)MEMORY[0x270F98B60](a1, __ec);
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

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

ssize_t fsgetpath(char *a1, size_t a2, fsid_t *a3, uint64_t a4)
{
  return MEMORY[0x270ED9AE8](a1, a2, a3, a4);
}

uint64_t ktrace_chunk_copy_cfdata()
{
  return MEMORY[0x270F8C498]();
}

uint64_t ktrace_chunk_size()
{
  return MEMORY[0x270F8C4A8]();
}

uint64_t ktrace_chunk_tag()
{
  return MEMORY[0x270F8C4B0]();
}

uint64_t ktrace_events_range()
{
  return MEMORY[0x270F8C4F8]();
}

uint64_t ktrace_events_single()
{
  return MEMORY[0x270F8C500]();
}

uint64_t ktrace_file_append_chunk()
{
  return MEMORY[0x270F8C508]();
}

uint64_t ktrace_file_iterate()
{
  return MEMORY[0x270F8C530]();
}

uint64_t ktrace_session_destroy()
{
  return MEMORY[0x270F8C550]();
}

uint64_t ktrace_set_execnames_enabled()
{
  return MEMORY[0x270F8C580]();
}

uint64_t ktrace_stackshot()
{
  return MEMORY[0x270F8C598]();
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x270EDAB30]();
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x270EDAD88](*(void *)&pid, buffer, *(void *)&buffersize);
}

int putchar(int a1)
{
  return MEMORY[0x270EDB090](*(void *)&a1);
}

int puts(const char *a1)
{
  return MEMORY[0x270EDB098](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x270EDB570](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x270EDB648](__dst, __src, __n);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x270EDB6A0](__s1, __s2);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x270EDBA28](uu);
}