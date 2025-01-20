void GPUTools::Playback::GL::ContextInfo::~ContextInfo(id *this)
{
  *this = &unk_2700DB730;

  std::deque<std::unique_ptr<GPUTools::VMBuffer>>::~deque[abi:ne180100]((uint64_t)(this + 1));
}

{
  *this = &unk_2700DB730;

  std::deque<std::unique_ptr<GPUTools::VMBuffer>>::~deque[abi:ne180100]((uint64_t)(this + 1));
}

{
  uint64_t vars8;

  *this = &unk_2700DB730;

  std::deque<std::unique_ptr<GPUTools::VMBuffer>>::~deque[abi:ne180100]((uint64_t)(this + 1));
  JUMPOUT(0x25335F280);
}

void sub_24F5A0F54(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  if (a11) {
    -[DYGLFunctionPlayer updateCurrentStateWithNewContext:contextID:sharegroupID:](a11);
  }
  _Unwind_Resume(exception_object);
}

void sub_24F5A1B90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  std::unique_ptr<GPUTools::VMBuffer>::~unique_ptr[abi:ne180100]((GPUTools::VMBuffer **)va);
  _Unwind_Resume(a1);
}

void sub_24F5A1BA8(_Unwind_Exception *a1)
{
  MEMORY[0x25335F280](v1, 0x1000C40EED21634);
  _Unwind_Resume(a1);
}

void sub_24F5A1BD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::unique_ptr<GPUTools::VMBuffer>::~unique_ptr[abi:ne180100]((GPUTools::VMBuffer **)va);
  _Unwind_Resume(a1);
}

GPUTools::VMBuffer **std::unique_ptr<GPUTools::VMBuffer>::~unique_ptr[abi:ne180100](GPUTools::VMBuffer **a1)
{
  v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    GPUTools::VMBuffer::~VMBuffer(v2);
    MEMORY[0x25335F280]();
  }
  return a1;
}

uint64_t std::deque<std::unique_ptr<GPUTools::VMBuffer>>::~deque[abi:ne180100](uint64_t a1)
{
  v2 = *(void ***)(a1 + 8);
  v3 = *(void ***)(a1 + 16);
  if (v3 == v2)
  {
    v3 = *(void ***)(a1 + 8);
    *(void *)(a1 + 40) = 0;
    unint64_t v10 = 0;
  }
  else
  {
    unint64_t v4 = *(void *)(a1 + 32);
    v5 = &v2[v4 >> 9];
    v6 = (GPUTools::VMBuffer **)((char *)*v5 + 8 * (v4 & 0x1FF));
    uint64_t v7 = *(uint64_t *)((char *)v2 + (((*(void *)(a1 + 40) + v4) >> 6) & 0x3FFFFFFFFFFFFF8))
       + 8 * ((*(void *)(a1 + 40) + v4) & 0x1FF);
    if (v6 != (GPUTools::VMBuffer **)v7)
    {
      do
      {
        v8 = *v6;
        *v6 = 0;
        if (v8)
        {
          GPUTools::VMBuffer::~VMBuffer(v8);
          MEMORY[0x25335F280]();
        }
        if ((char *)++v6 - (unsigned char *)*v5 == 4096)
        {
          v9 = (GPUTools::VMBuffer **)v5[1];
          ++v5;
          v6 = v9;
        }
      }
      while (v6 != (GPUTools::VMBuffer **)v7);
      v2 = *(void ***)(a1 + 8);
      v3 = *(void ***)(a1 + 16);
    }
    *(void *)(a1 + 40) = 0;
    unint64_t v10 = (char *)v3 - (char *)v2;
    if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
    {
      do
      {
        operator delete(*v2);
        v3 = *(void ***)(a1 + 16);
        v2 = (void **)(*(void *)(a1 + 8) + 8);
        *(void *)(a1 + 8) = v2;
        unint64_t v10 = (char *)v3 - (char *)v2;
      }
      while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
    }
  }
  unint64_t v11 = v10 >> 3;
  if (v11 == 1)
  {
    uint64_t v12 = 256;
    goto LABEL_17;
  }
  if (v11 == 2)
  {
    uint64_t v12 = 512;
LABEL_17:
    *(void *)(a1 + 32) = v12;
  }
  if (v2 != v3)
  {
    do
    {
      v13 = *v2++;
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

void __clang_call_terminate(void *a1)
{
}

void *std::__hash_table<std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>>>::__emplace_unique_key_args<unsigned long long,unsigned long long &,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>(uint64_t a1, unint64_t *a2, uint64_t *a3, uint64_t *a4)
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
      if (v8 >= v9) {
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
      uint64_t v12 = *v11;
      if (*v11)
      {
        if (v10.u32[0] < 2uLL)
        {
          while (1)
          {
            uint64_t v14 = v12[1];
            if (v14 == v8)
            {
              if (v12[2] == v8) {
                return v12;
              }
            }
            else if ((v14 & (v9 - 1)) != v4)
            {
              goto LABEL_23;
            }
            uint64_t v12 = (void *)*v12;
            if (!v12) {
              goto LABEL_23;
            }
          }
        }
        do
        {
          unint64_t v13 = v12[1];
          if (v13 == v8)
          {
            if (v12[2] == v8) {
              return v12;
            }
          }
          else
          {
            if (v13 >= v9) {
              v13 %= v9;
            }
            if (v13 != v4) {
              break;
            }
          }
          uint64_t v12 = (void *)*v12;
        }
        while (v12);
      }
    }
  }
LABEL_23:
  uint64_t v15 = (void *)(a1 + 16);
  uint64_t v12 = operator new(0x20uLL);
  uint64_t v16 = *a3;
  uint64_t v17 = *a4;
  *a4 = 0;
  *uint64_t v12 = 0;
  v12[1] = v8;
  v12[2] = v16;
  v12[3] = v17;
  float v18 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v19 = *(float *)(a1 + 32);
  if (v9 && (float)(v19 * (float)v9) >= v18)
  {
    uint64_t v20 = *(void *)a1;
    v21 = *(void **)(*(void *)a1 + 8 * v4);
    if (v21)
    {
LABEL_26:
      *uint64_t v12 = *v21;
LABEL_61:
      void *v21 = v12;
      goto LABEL_62;
    }
  }
  else
  {
    BOOL v22 = 1;
    if (v9 >= 3) {
      BOOL v22 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v23 = v22 | (2 * v9);
    unint64_t v24 = vcvtps_u32_f32(v18 / v19);
    if (v23 <= v24) {
      size_t prime = v24;
    }
    else {
      size_t prime = v23;
    }
    if (prime == 1)
    {
      size_t prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      size_t prime = std::__next_prime(prime);
      unint64_t v9 = *(void *)(a1 + 8);
    }
    if (prime > v9) {
      goto LABEL_37;
    }
    if (prime < v9)
    {
      unint64_t v26 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (v9 < 3 || (uint8x8_t v27 = (uint8x8_t)vcnt_s8((int8x8_t)v9), v27.i16[0] = vaddlv_u8(v27), v27.u32[0] > 1uLL))
      {
        unint64_t v26 = std::__next_prime(v26);
      }
      else
      {
        uint64_t v28 = 1 << -(char)__clz(v26 - 1);
        if (v26 >= 2) {
          unint64_t v26 = v28;
        }
      }
      if (prime <= v26) {
        size_t prime = v26;
      }
      if (prime < v9) {
LABEL_37:
      }
        std::__hash_table<std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>>>::__do_rehash<true>(a1, prime);
    }
    unint64_t v9 = *(void *)(a1 + 8);
    unint64_t v29 = v9 - 1;
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9)
      {
        unint64_t v4 = v8 % v9;
        uint64_t v20 = *(void *)a1;
        v21 = *(void **)(*(void *)a1 + 8 * (v8 % v9));
        if (v21) {
          goto LABEL_26;
        }
      }
      else
      {
        unint64_t v4 = v8;
        uint64_t v20 = *(void *)a1;
        v21 = *(void **)(*(void *)a1 + 8 * v8);
        if (v21) {
          goto LABEL_26;
        }
      }
    }
    else
    {
      unint64_t v4 = v29 & v8;
      uint64_t v20 = *(void *)a1;
      v21 = *(void **)(*(void *)a1 + 8 * (v29 & v8));
      if (v21) {
        goto LABEL_26;
      }
    }
  }
  *uint64_t v12 = *v15;
  *uint64_t v15 = v12;
  *(void *)(v20 + 8 * v4) = v15;
  if (*v12)
  {
    unint64_t v30 = *(void *)(*v12 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v30 >= v9) {
        v30 %= v9;
      }
    }
    else
    {
      v30 &= v9 - 1;
    }
    v21 = (void *)(*(void *)a1 + 8 * v30);
    goto LABEL_61;
  }
LABEL_62:
  ++*(void *)(a1 + 24);
  return v12;
}

void sub_24F5A2250(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>,void *>>>>::~unique_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::unique_ptr<std::__hash_node<std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>,void *>>>>::~unique_ptr[abi:ne180100](uint64_t a1)
{
  v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16))
    {
      uint64_t v3 = v2[3];
      v2[3] = 0;
      if (v3) {
        (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
      }
    }
    operator delete(v2);
  }
  return a1;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void std::__hash_table<std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  if (!a2)
  {
    uint64_t v15 = *(void **)a1;
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
        uint64_t v12 = (void *)*v7;
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
          *uint64_t v12 = **(void **)(*(void *)a1 + v14);
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
    uint64_t v16 = (void *)*v7;
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
          *uint64_t v16 = **(void **)(*(void *)a1 + v17);
          **(void **)(*(void *)a1 + v17) = v16;
          uint64_t v16 = v7;
LABEL_25:
          uint64_t v7 = v16;
          uint64_t v16 = (void *)*v16;
          if (!v16) {
            return;
          }
        }
        else
        {
          *(void *)(*(void *)a1 + 8 * v18) = v7;
          uint64_t v7 = v16;
          uint64_t v16 = (void *)*v16;
          unint64_t v9 = v18;
          if (!v16) {
            return;
          }
        }
      }
    }
  }
}

void *std::__hash_table<std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>>>::remove@<X0>(void *result@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
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

void std::deque<std::unique_ptr<GPUTools::VMBuffer>>::__add_back_capacity(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = v2 >= 0x200;
  unint64_t v4 = v2 - 512;
  if (v3)
  {
    *(void *)(a1 + 32) = v4;
    uint64_t v6 = *(void **)(a1 + 8);
    uint8x8_t v5 = *(char **)(a1 + 16);
    uint64_t v7 = (char *)(v6 + 1);
    uint64_t v8 = *v6;
    *(void *)(a1 + 8) = v6 + 1;
    if (v5 != *(char **)(a1 + 24))
    {
LABEL_80:
      *(void *)uint8x8_t v5 = v8;
      *(void *)(a1 + 16) += 8;
      return;
    }
    unint64_t v9 = *(char **)a1;
    uint64_t v10 = (uint64_t)&v7[-*(void *)a1];
    if ((unint64_t)v7 <= *(void *)a1)
    {
      unint64_t v31 = (v5 - v9) >> 2;
      if (v5 == v9) {
        unint64_t v31 = 1;
      }
      if (!(v31 >> 61))
      {
        unint64_t v32 = v31 >> 2;
        uint64_t v33 = 8 * v31;
        v34 = (char *)operator new(8 * v31);
        v35 = &v34[8 * v32];
        v36 = &v34[v33];
        int64_t v38 = v5 - v7;
        BOOL v37 = v5 == v7;
        uint8x8_t v5 = v35;
        if (!v37)
        {
          uint8x8_t v5 = &v35[v38 & 0xFFFFFFFFFFFFFFF8];
          unint64_t v39 = v38 - 8;
          if ((unint64_t)(v38 - 8) >= 0x38)
          {
            v74 = &v34[8 * v32];
            v40 = v74;
            if ((unint64_t)(v74 - v7) >= 0x20)
            {
              uint64_t v75 = (v39 >> 3) + 1;
              uint64_t v76 = 8 * (v75 & 0x3FFFFFFFFFFFFFFCLL);
              v40 = &v35[v76];
              v7 += v76;
              v77 = (long long *)(v6 + 3);
              v78 = v74 + 16;
              uint64_t v79 = v75 & 0x3FFFFFFFFFFFFFFCLL;
              do
              {
                long long v80 = *v77;
                *(v78 - 1) = *(v77 - 1);
                _OWORD *v78 = v80;
                v77 += 2;
                v78 += 2;
                v79 -= 4;
              }
              while (v79);
              if (v75 == (v75 & 0x3FFFFFFFFFFFFFFCLL)) {
                goto LABEL_78;
              }
            }
          }
          else
          {
            v40 = &v34[8 * v32];
          }
          do
          {
            uint64_t v81 = *(void *)v7;
            v7 += 8;
            *(void *)v40 = v81;
            v40 += 8;
          }
          while (v40 != v5);
        }
        goto LABEL_78;
      }
LABEL_89:
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
LABEL_5:
    uint64_t v11 = v10 >> 3;
    if (v11 >= -1) {
      uint64_t v12 = v11 + 1;
    }
    else {
      uint64_t v12 = v11 + 2;
    }
    uint64_t v13 = v12 >> 1;
    uint64_t v14 = -v13;
    uint64_t v15 = &v7[-8 * v13];
    int64_t v16 = v5 - v7;
    if (v5 != v7)
    {
      memmove(&v7[-8 * v13], v7, v5 - v7);
      uint64_t v7 = *(char **)(a1 + 8);
    }
    uint8x8_t v5 = &v15[v16];
    *(void *)(a1 + 8) = &v7[8 * v14];
    *(void *)(a1 + 16) = &v15[v16];
    goto LABEL_80;
  }
  uint64_t v18 = *(void *)(a1 + 16);
  uint64_t v17 = *(void *)(a1 + 24);
  uint64_t v19 = *(void *)(a1 + 8);
  uint64_t v20 = v18 - v19;
  uint64_t v21 = (v18 - v19) >> 3;
  uint64_t v22 = v17 - *(void *)a1;
  if (v21 < (unint64_t)(v22 >> 3))
  {
    if (v17 != v18)
    {
      v91 = operator new(0x1000uLL);
      std::__split_buffer<std::unique_ptr<GPUTools::VMBuffer> *,std::allocator<std::unique_ptr<GPUTools::VMBuffer> *>>::push_back((char **)a1, &v91);
      return;
    }
    v91 = operator new(0x1000uLL);
    std::__split_buffer<std::unique_ptr<GPUTools::VMBuffer> *,std::allocator<std::unique_ptr<GPUTools::VMBuffer> *>>::push_front((void **)a1, &v91);
    v41 = *(void **)(a1 + 8);
    uint8x8_t v5 = *(char **)(a1 + 16);
    uint64_t v7 = (char *)(v41 + 1);
    uint64_t v8 = *v41;
    *(void *)(a1 + 8) = v41 + 1;
    if (v5 != *(char **)(a1 + 24)) {
      goto LABEL_80;
    }
    unint64_t v9 = *(char **)a1;
    uint64_t v10 = (uint64_t)&v7[-*(void *)a1];
    if ((unint64_t)v7 <= *(void *)a1)
    {
      unint64_t v42 = (v5 - v9) >> 2;
      if (v5 == v9) {
        unint64_t v42 = 1;
      }
      if (!(v42 >> 61))
      {
        unint64_t v43 = v42 >> 2;
        uint64_t v44 = 8 * v42;
        v34 = (char *)operator new(8 * v42);
        v35 = &v34[8 * v43];
        v36 = &v34[v44];
        int64_t v45 = v5 - v7;
        BOOL v37 = v5 == v7;
        uint8x8_t v5 = v35;
        if (!v37)
        {
          uint8x8_t v5 = &v35[v45 & 0xFFFFFFFFFFFFFFF8];
          unint64_t v46 = v45 - 8;
          if ((unint64_t)(v45 - 8) >= 0x38)
          {
            v82 = &v34[8 * v43];
            v47 = v82;
            if ((unint64_t)(v82 - v7) >= 0x20)
            {
              uint64_t v83 = (v46 >> 3) + 1;
              uint64_t v84 = 8 * (v83 & 0x3FFFFFFFFFFFFFFCLL);
              v47 = &v35[v84];
              v7 += v84;
              v85 = (long long *)(v41 + 3);
              v86 = v82 + 16;
              uint64_t v87 = v83 & 0x3FFFFFFFFFFFFFFCLL;
              do
              {
                long long v88 = *v85;
                *(v86 - 1) = *(v85 - 1);
                _OWORD *v86 = v88;
                v85 += 2;
                v86 += 2;
                v87 -= 4;
              }
              while (v87);
              if (v83 == (v83 & 0x3FFFFFFFFFFFFFFCLL)) {
                goto LABEL_78;
              }
            }
          }
          else
          {
            v47 = &v34[8 * v43];
          }
          do
          {
            uint64_t v89 = *(void *)v7;
            v7 += 8;
            *(void *)v47 = v89;
            v47 += 8;
          }
          while (v47 != v5);
        }
LABEL_78:
        *(void *)a1 = v34;
        *(void *)(a1 + 8) = v35;
        *(void *)(a1 + 16) = v5;
        *(void *)(a1 + 24) = v36;
        if (v9)
        {
          operator delete(v9);
          uint8x8_t v5 = *(char **)(a1 + 16);
        }
        goto LABEL_80;
      }
      goto LABEL_89;
    }
    goto LABEL_5;
  }
  uint64_t v23 = v22 >> 2;
  if (v17 == *(void *)a1) {
    unint64_t v24 = 1;
  }
  else {
    unint64_t v24 = v23;
  }
  if (v24 >> 61) {
    goto LABEL_89;
  }
  v25 = (char *)operator new(8 * v24);
  unint64_t v26 = operator new(0x1000uLL);
  uint8x8_t v27 = &v25[8 * v21];
  uint64_t v28 = &v25[8 * v24];
  if (v21 == v24)
  {
    v90 = v26;
    if (v20 < 1)
    {
      if (v18 == v19) {
        unint64_t v48 = 1;
      }
      else {
        unint64_t v48 = v20 >> 2;
      }
      if (v48 >> 61) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      v49 = (char *)operator new(8 * v48);
      uint8x8_t v27 = &v49[8 * (v48 >> 2)];
      uint64_t v28 = &v49[8 * v48];
      operator delete(v25);
      uint64_t v50 = *(void *)(a1 + 8);
      uint64_t v18 = *(void *)(a1 + 16);
      v25 = v49;
      *(void *)uint8x8_t v27 = v90;
      unint64_t v29 = v27 + 8;
      if (v18 == v50) {
        goto LABEL_45;
      }
    }
    else
    {
      unint64_t v30 = v21 + 2;
      if (v21 >= -1) {
        unint64_t v30 = v21 + 1;
      }
      v27 -= 8 * (v30 >> 1);
      *(void *)uint8x8_t v27 = v26;
      unint64_t v29 = v27 + 8;
      if (v18 == v19) {
        goto LABEL_45;
      }
    }
    do
    {
LABEL_52:
      if (v27 == v25)
      {
        if (v29 >= v28)
        {
          if (v28 == v27) {
            unint64_t v59 = 1;
          }
          else {
            unint64_t v59 = (v28 - v27) >> 2;
          }
          if (v59 >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          v60 = (char *)operator new(8 * v59);
          v25 = v60;
          unint64_t v61 = (v59 + 3) >> 2;
          v53 = &v60[8 * v61];
          int64_t v62 = v29 - v27;
          BOOL v37 = v29 == v27;
          unint64_t v29 = v53;
          if (!v37)
          {
            unint64_t v29 = &v53[v62 & 0xFFFFFFFFFFFFFFF8];
            unint64_t v63 = v62 - 8;
            v64 = &v60[8 * v61];
            v65 = v27;
            if (v63 < 0x38) {
              goto LABEL_93;
            }
            uint64_t v66 = 8 * v61;
            v64 = &v60[8 * v61];
            v65 = v27;
            if ((unint64_t)(v64 - v27) < 0x20) {
              goto LABEL_93;
            }
            uint64_t v67 = (v63 >> 3) + 1;
            uint64_t v68 = 8 * (v67 & 0x3FFFFFFFFFFFFFFCLL);
            v64 = &v53[v68];
            v65 = &v27[v68];
            v69 = (long long *)(v27 + 16);
            v70 = &v60[v66 + 16];
            uint64_t v71 = v67 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              long long v72 = *v69;
              *((_OWORD *)v70 - 1) = *(v69 - 1);
              *(_OWORD *)v70 = v72;
              v69 += 2;
              v70 += 32;
              v71 -= 4;
            }
            while (v71);
            if (v67 != (v67 & 0x3FFFFFFFFFFFFFFCLL))
            {
LABEL_93:
              do
              {
                uint64_t v73 = *(void *)v65;
                v65 += 8;
                *(void *)v64 = v73;
                v64 += 8;
              }
              while (v64 != v29);
            }
          }
          uint64_t v28 = &v60[8 * v59];
          operator delete(v27);
        }
        else
        {
          uint64_t v55 = (v28 - v29) >> 3;
          if (v55 >= -1) {
            unint64_t v56 = v55 + 1;
          }
          else {
            unint64_t v56 = v55 + 2;
          }
          v57 = &v29[8 * (v56 >> 1)];
          v53 = &v57[-(v29 - v27)];
          size_t v58 = v29 - v27;
          BOOL v37 = v29 == v27;
          unint64_t v29 = v57;
          if (!v37) {
            memmove(v53, v27, v58);
          }
          v25 = v27;
        }
      }
      else
      {
        v53 = v27;
      }
      uint64_t v54 = *(void *)(v18 - 8);
      v18 -= 8;
      *((void *)v53 - 1) = v54;
      v51 = v53 - 8;
      uint8x8_t v27 = v51;
    }
    while (v18 != *(void *)(a1 + 8));
    goto LABEL_46;
  }
  *(void *)uint8x8_t v27 = v26;
  unint64_t v29 = v27 + 8;
  if (v18 != v19) {
    goto LABEL_52;
  }
LABEL_45:
  v51 = v27;
LABEL_46:
  v52 = *(char **)a1;
  *(void *)a1 = v25;
  *(void *)(a1 + 8) = v51;
  *(void *)(a1 + 16) = v29;
  *(void *)(a1 + 24) = v28;
  if (v52)
  {
    operator delete(v52);
  }
}

void sub_24F5A2B5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p)
{
  operator delete(__p);
  operator delete(v9);
  _Unwind_Resume(a1);
}

void sub_24F5A2B78(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_24F5A2B8C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_24F5A2BA4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__split_buffer<std::unique_ptr<GPUTools::VMBuffer> *,std::allocator<std::unique_ptr<GPUTools::VMBuffer> *>>::push_back(char **a1, void *a2)
{
  unint64_t v4 = a1[2];
  if (v4 != a1[3]) {
    goto LABEL_22;
  }
  uint8x8_t v5 = *a1;
  uint64_t v6 = a1[1];
  if (v6 > *a1)
  {
    uint64_t v7 = (v6 - *a1) >> 3;
    if (v7 >= -1) {
      uint64_t v8 = v7 + 1;
    }
    else {
      uint64_t v8 = v7 + 2;
    }
    uint64_t v9 = v8 >> 1;
    uint64_t v10 = -v9;
    uint64_t v11 = &v6[-8 * v9];
    int64_t v12 = v4 - v6;
    if (v4 != v6)
    {
      memmove(&v6[-8 * v9], a1[1], v4 - v6);
      unint64_t v4 = a1[1];
    }
    uint64_t v13 = &v4[8 * v10];
    unint64_t v4 = &v11[v12];
    a1[1] = v13;
    a1[2] = &v11[v12];
    goto LABEL_22;
  }
  unint64_t v14 = (v4 - v5) >> 2;
  if (v4 == v5) {
    unint64_t v14 = 1;
  }
  if (v14 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  unint64_t v15 = v14 >> 2;
  uint64_t v16 = 8 * v14;
  uint64_t v17 = (char *)operator new(8 * v14);
  uint64_t v18 = &v17[8 * v15];
  int64_t v20 = v4 - v6;
  BOOL v19 = v4 == v6;
  unint64_t v4 = v18;
  if (!v19)
  {
    unint64_t v4 = &v18[v20 & 0xFFFFFFFFFFFFFFF8];
    unint64_t v21 = v20 - 8;
    if ((unint64_t)(v20 - 8) < 0x38)
    {
      uint64_t v22 = &v17[8 * v15];
      do
      {
LABEL_19:
        uint64_t v31 = *(void *)v6;
        v6 += 8;
        *(void *)uint64_t v22 = v31;
        v22 += 8;
      }
      while (v22 != v4);
      goto LABEL_20;
    }
    uint64_t v23 = &v17[8 * v15];
    uint64_t v22 = v23;
    if ((unint64_t)(v23 - v6) < 0x20) {
      goto LABEL_19;
    }
    uint64_t v24 = (v21 >> 3) + 1;
    uint64_t v25 = 8 * (v24 & 0x3FFFFFFFFFFFFFFCLL);
    uint64_t v22 = &v18[v25];
    unint64_t v26 = &v6[v25];
    uint8x8_t v27 = (long long *)(v6 + 16);
    uint64_t v28 = v23 + 16;
    uint64_t v29 = v24 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      long long v30 = *v27;
      *(v28 - 1) = *(v27 - 1);
      *uint64_t v28 = v30;
      v27 += 2;
      v28 += 2;
      v29 -= 4;
    }
    while (v29);
    uint64_t v6 = v26;
    if (v24 != (v24 & 0x3FFFFFFFFFFFFFFCLL)) {
      goto LABEL_19;
    }
  }
LABEL_20:
  *a1 = v17;
  a1[1] = v18;
  a1[2] = v4;
  a1[3] = &v17[v16];
  if (v5)
  {
    operator delete(v5);
    unint64_t v4 = a1[2];
  }
LABEL_22:
  *(void *)unint64_t v4 = *a2;
  a1[2] += 8;
}

void std::__split_buffer<std::unique_ptr<GPUTools::VMBuffer> *,std::allocator<std::unique_ptr<GPUTools::VMBuffer> *>>::push_front(void **a1, void *a2)
{
  unint64_t v4 = (char *)a1[1];
  if (v4 == *a1)
  {
    uint64_t v7 = a1[2];
    uint64_t v6 = a1[3];
    if (v7 >= v6)
    {
      uint64_t v13 = v6 - v4;
      BOOL v12 = v13 == 0;
      unint64_t v14 = v13 >> 2;
      if (v12) {
        unint64_t v14 = 1;
      }
      if (v14 >> 61) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      unint64_t v15 = (v14 + 3) >> 2;
      uint64_t v16 = 8 * v14;
      uint64_t v17 = (char *)operator new(8 * v14);
      uint8x8_t v5 = &v17[8 * v15];
      uint64_t v18 = v5;
      uint64_t v19 = v7 - v4;
      if (v7 != v4)
      {
        uint64_t v18 = &v5[v19 & 0xFFFFFFFFFFFFFFF8];
        unint64_t v20 = v19 - 8;
        unint64_t v21 = &v17[8 * v15];
        uint64_t v22 = v4;
        if (v20 < 0x38) {
          goto LABEL_27;
        }
        uint64_t v23 = &v17[8 * v15];
        unint64_t v21 = v23;
        uint64_t v22 = v4;
        if ((unint64_t)(v23 - v4) < 0x20) {
          goto LABEL_27;
        }
        uint64_t v24 = (v20 >> 3) + 1;
        uint64_t v25 = 8 * (v24 & 0x3FFFFFFFFFFFFFFCLL);
        unint64_t v21 = &v5[v25];
        uint64_t v22 = &v4[v25];
        unint64_t v26 = (long long *)(v4 + 16);
        uint8x8_t v27 = v23 + 16;
        uint64_t v28 = v24 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          long long v29 = *v26;
          *(v27 - 1) = *(v26 - 1);
          *uint8x8_t v27 = v29;
          v26 += 2;
          v27 += 2;
          v28 -= 4;
        }
        while (v28);
        if (v24 != (v24 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_27:
          do
          {
            uint64_t v30 = *(void *)v22;
            v22 += 8;
            *(void *)unint64_t v21 = v30;
            v21 += 8;
          }
          while (v21 != v18);
        }
      }
      *a1 = v17;
      a1[1] = v5;
      a1[2] = v18;
      a1[3] = &v17[v16];
      if (v4)
      {
        operator delete(v4);
        uint8x8_t v5 = (char *)a1[1];
      }
    }
    else
    {
      uint64_t v8 = (v6 - v7) >> 3;
      if (v8 >= -1) {
        uint64_t v9 = v8 + 1;
      }
      else {
        uint64_t v9 = v8 + 2;
      }
      uint64_t v10 = v9 >> 1;
      uint64_t v11 = &v7[8 * (v9 >> 1)];
      uint8x8_t v5 = &v11[-(v7 - v4)];
      if (v7 != v4)
      {
        memmove(&v11[-(v7 - v4)], v4, v7 - v4);
        unint64_t v4 = (char *)a1[2];
      }
      a1[1] = v5;
      a1[2] = &v4[8 * v10];
    }
  }
  else
  {
    uint8x8_t v5 = (char *)a1[1];
  }
  *((void *)v5 - 1) = *a2;
  a1[1] = (char *)a1[1] - 8;
}

double std::deque<std::unique_ptr<GPUTools::VMBuffer>>::__move_assign(void *a1, uint64_t a2)
{
  unint64_t v4 = (void **)a1[1];
  uint8x8_t v5 = (void **)a1[2];
  if (v5 == v4)
  {
    a1[5] = 0;
    unint64_t v12 = 0;
  }
  else
  {
    unint64_t v6 = a1[4];
    uint64_t v7 = &v4[v6 >> 9];
    uint64_t v8 = (GPUTools::VMBuffer **)((char *)*v7 + 8 * (v6 & 0x1FF));
    uint64_t v9 = *(uint64_t *)((char *)v4 + (((a1[5] + v6) >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * ((a1[5] + v6) & 0x1FF);
    if (v8 != (GPUTools::VMBuffer **)v9)
    {
      do
      {
        uint64_t v10 = *v8;
        GPUTools::VMBuffer *v8 = 0;
        if (v10)
        {
          GPUTools::VMBuffer::~VMBuffer(v10);
          MEMORY[0x25335F280]();
        }
        if ((char *)++v8 - (unsigned char *)*v7 == 4096)
        {
          uint64_t v11 = (GPUTools::VMBuffer **)v7[1];
          ++v7;
          uint64_t v8 = v11;
        }
      }
      while (v8 != (GPUTools::VMBuffer **)v9);
      unint64_t v4 = (void **)a1[1];
      uint8x8_t v5 = (void **)a1[2];
    }
    a1[5] = 0;
    unint64_t v12 = (char *)v5 - (char *)v4;
    if (v12 >= 0x11)
    {
      do
      {
        operator delete(*v4);
        uint64_t v13 = a1[2];
        unint64_t v4 = (void **)(a1[1] + 8);
        a1[1] = v4;
        unint64_t v12 = v13 - (void)v4;
      }
      while (v12 > 0x10);
    }
  }
  if (v12 >> 3 == 1)
  {
    uint64_t v14 = 256;
  }
  else
  {
    if (v12 >> 3 != 2) {
      goto LABEL_18;
    }
    uint64_t v14 = 512;
  }
  a1[4] = v14;
LABEL_18:
  std::deque<std::unique_ptr<GPUTools::VMBuffer>>::shrink_to_fit(a1);
  uint64_t v16 = a1[1];
  uint64_t v15 = a1[2];
  if (v15 != v16) {
    a1[2] = v15 + ((v16 - v15 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  std::__split_buffer<std::unique_ptr<GPUTools::VMBuffer> *,std::allocator<std::unique_ptr<GPUTools::VMBuffer> *>>::shrink_to_fit((uint64_t)a1);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  a1[2] = *(void *)(a2 + 16);
  uint64_t v17 = *(void *)(a2 + 32);
  a1[3] = *(void *)(a2 + 24);
  double result = 0.0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  a1[4] = v17;
  a1[5] = *(void *)(a2 + 40);
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  return result;
}

void std::deque<std::unique_ptr<GPUTools::VMBuffer>>::shrink_to_fit(void *a1)
{
  uint64_t v2 = a1[5];
  if (v2)
  {
    unint64_t v3 = a1[4];
    unint64_t v4 = (void **)a1[1];
    if (v3 >= 0x200)
    {
      operator delete(*v4);
      unint64_t v4 = (void **)(a1[1] + 8);
      a1[1] = v4;
      uint64_t v2 = a1[5];
      unint64_t v3 = a1[4] - 512;
      a1[4] = v3;
    }
    uint8x8_t v5 = (void **)a1[2];
    if (v5 == v4) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = (((char *)v5 - (char *)v4) << 6) - 1;
    }
    if (v6 - (v2 + v3) >= 0x200)
    {
      operator delete(*(v5 - 1));
      a1[2] -= 8;
    }
    uint64_t v7 = (uint64_t)a1;
  }
  else
  {
    uint64_t v8 = a1[2];
    if (v8 != a1[1])
    {
      do
      {
        operator delete(*(void **)(v8 - 8));
        uint64_t v9 = a1[1];
        uint64_t v8 = a1[2] - 8;
        a1[2] = v8;
      }
      while (v8 != v9);
    }
    a1[4] = 0;
    uint64_t v7 = (uint64_t)a1;
  }
  std::__split_buffer<std::unique_ptr<GPUTools::VMBuffer> *,std::allocator<std::unique_ptr<GPUTools::VMBuffer> *>>::shrink_to_fit(v7);
}

void std::__split_buffer<std::unique_ptr<GPUTools::VMBuffer> *,std::allocator<std::unique_ptr<GPUTools::VMBuffer> *>>::shrink_to_fit(uint64_t a1)
{
  uint64_t v1 = *(char **)(a1 + 16);
  uint64_t v2 = *(void **)a1;
  unint64_t v3 = *(char **)(a1 + 8);
  int64_t v4 = v1 - v3;
  unint64_t v5 = (v1 - v3) >> 3;
  if (v5 >= (uint64_t)(*(void *)(a1 + 24) - *(void *)a1) >> 3) {
    return;
  }
  if (v1 == v3)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 8 * v5;
    goto LABEL_13;
  }
  if (v4 < 0) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  uint64_t v7 = operator new(v1 - v3);
  uint64_t v8 = (uint64_t)&v7[v5];
  if ((unint64_t)(v4 - 8) < 0x18)
  {
    uint64_t v9 = v7;
    do
    {
LABEL_12:
      uint64_t v17 = *(void *)v3;
      v3 += 8;
      *v9++ = v17;
    }
    while (v9 != (void *)v8);
    goto LABEL_13;
  }
  uint64_t v9 = v7;
  if ((unint64_t)((char *)v7 - v3) < 0x20) {
    goto LABEL_12;
  }
  uint64_t v10 = 0;
  unint64_t v11 = ((unint64_t)(v4 - 8) >> 3) + 1;
  uint64_t v12 = v11 & 0x3FFFFFFFFFFFFFFCLL;
  uint64_t v9 = &v7[v12];
  uint64_t v13 = &v3[v12 * 8];
  uint64_t v14 = v11 & 0x3FFFFFFFFFFFFFFCLL;
  do
  {
    uint64_t v15 = &v7[v10];
    long long v16 = *(_OWORD *)&v3[v10 * 8 + 16];
    *uint64_t v15 = *(_OWORD *)&v3[v10 * 8];
    v15[1] = v16;
    v10 += 4;
    v14 -= 4;
  }
  while (v14);
  unint64_t v3 = v13;
  if (v11 != (v11 & 0x3FFFFFFFFFFFFFFCLL)) {
    goto LABEL_12;
  }
LABEL_13:
  *(void *)a1 = v7;
  *(void *)(a1 + 8) = v7;
  *(void *)(a1 + 16) = v8;
  *(void *)(a1 + 24) = v8;
  if (v2)
  {
    operator delete(v2);
  }
}

uint64_t GPUTools::GL::WireframeRenderer::IsBadDrawCall(GPUTools::GL::WireframeRenderer *this, int a2, int a3)
{
  if (a3 < 1) {
    return 0;
  }
  if ((this - 1) < 3)
  {
    return a2 < 2;
  }
  else if ((this - 4) >= 3)
  {
    if (this)
    {
      unint64_t v5 = (GPUTools::GL::WireframeRenderer *)dy_abort();
      return GPUTools::GL::WireframeRenderer::CreateLineListFromIndexedTriList(v5, v6, v7, v8, v9, v10);
    }
    return a2 < 1;
  }
  else
  {
    return a2 < 3;
  }
}

uint64_t GPUTools::GL::WireframeRenderer::CreateLineListFromIndexedTriList(GPUTools::GL::WireframeRenderer *this, void *a2, void **a3, int a4, int a5)
{
  unsigned int v7 = a3;
  BOOL v10 = malloc_type_malloc(6 * a3 / 3 * a4, 0x57DC6B47uLL);
  *a2 = v10;
  switch(a4)
  {
    case 4:
      int v11 = GPUTools::GL::CopyTriIndicesToLineList<unsigned int>(v7, v10, (int *)this, a5, (uint64_t)&__block_literal_global_13);
      return (2 * v11);
    case 2:
      int v11 = GPUTools::GL::CopyTriIndicesToLineList<unsigned short>(v7, v10, (unsigned __int16 *)this, a5, (uint64_t)&__block_literal_global_10);
      return (2 * v11);
    case 1:
      int v11 = GPUTools::GL::CopyTriIndicesToLineList<unsigned char>(v7, v10, (unsigned __int8 *)this, a5, (uint64_t)&__block_literal_global);
      return (2 * v11);
  }
  uint64_t v13 = (GPUTools::GL::WireframeRenderer *)dy_abort();
  return GPUTools::GL::WireframeRenderer::CreateLineListFromTriList(v13, v14, v15, v16, v17);
}

uint64_t GPUTools::GL::WireframeRenderer::CreateLineListFromTriList(GPUTools::GL::WireframeRenderer *this, void **a2, unsigned int a3, int a4)
{
  unsigned int v6 = a2;
  unsigned int v8 = a3 / 3;
  uint64_t v9 = 6 * (a3 / 3);
  BOOL v10 = (char *)malloc_type_malloc((v9 * a4), 0xB6FA883FuLL);
  *(void *)this = v10;
  switch(a4)
  {
    case 4:
      if (a3 >= 3)
      {
        do
        {
          *(_DWORD *)BOOL v10 = v6;
          v20.val[0] = (float32x2_t)vadd_s32(vdup_n_s32(v6), (int32x2_t)0x200000001);
          v20.val[1] = v20.val[0];
          int v11 = (float *)(v10 + 4);
          vst2_f32(v11, v20);
          *((_DWORD *)v10 + 5) = v6;
          v6 += 3;
          v10 += 24;
          --v8;
        }
        while (v8);
      }
      return v9;
    case 2:
      if (a3 >= 3)
      {
        do
        {
          *(_WORD *)BOOL v10 = v6;
          int16x4_t v12 = vuzp1_s16((int16x4_t)vadd_s32(vdup_n_s32(v6), (int32x2_t)0x200000001), (int16x4_t)0x200000001);
          *(int16x4_t *)(v10 + 2) = vzip1_s16(v12, v12);
          *((_WORD *)v10 + 5) = v6;
          v6 += 3;
          v10 += 12;
          --v8;
        }
        while (v8);
      }
      return v9;
    case 1:
      if (a3 >= 3)
      {
        do
        {
          *BOOL v10 = v6;
          v10[1] = v6 + 1;
          v10[2] = v6 + 1;
          v10[3] = v6 + 2;
          v10[4] = v6 + 2;
          v10[5] = v6;
          v10 += 6;
          v6 += 3;
          --v8;
        }
        while (v8);
      }
      return v9;
  }
  uint64_t v14 = (GPUTools::GL::WireframeRenderer *)dy_abort();
  return GPUTools::GL::WireframeRenderer::CreateLineListFromIndexedTriStrip(v14, v15, v16, v17, v18, v19);
}

uint64_t GPUTools::GL::WireframeRenderer::CreateLineListFromIndexedTriStrip(GPUTools::GL::WireframeRenderer *this, void *a2, void **a3, int a4, int a5)
{
  unsigned int v7 = a3;
  BOOL v10 = malloc_type_malloc(((6 * a3 - 12) * a4), 0xAC94DE10uLL);
  *a2 = v10;
  switch(a4)
  {
    case 4:
      int v11 = GPUTools::GL::CopyTriIndicesToLineList<unsigned int>(v7, v10, (int *)this, a5, (uint64_t)&__block_literal_global_19);
      return (2 * v11);
    case 2:
      int v11 = GPUTools::GL::CopyTriIndicesToLineList<unsigned short>(v7, v10, (unsigned __int16 *)this, a5, (uint64_t)&__block_literal_global_17);
      return (2 * v11);
    case 1:
      int v11 = GPUTools::GL::CopyTriIndicesToLineList<unsigned char>(v7, v10, (unsigned __int8 *)this, a5, (uint64_t)&__block_literal_global_15);
      return (2 * v11);
  }
  uint64_t v13 = (GPUTools::GL::WireframeRenderer *)dy_abort();
  return GPUTools::GL::WireframeRenderer::CreateLineListFromTriStrip(v13, v14, v15, v16, v17);
}

uint64_t GPUTools::GL::WireframeRenderer::CreateLineListFromTriStrip(GPUTools::GL::WireframeRenderer *this, void **a2, int a3, int a4)
{
  unsigned int v5 = a2;
  int v7 = a3 - 2;
  uint64_t v8 = (6 * (a3 - 2));
  uint64_t v9 = (char *)malloc_type_malloc((v8 * a4), 0x4371EEFuLL);
  *(void *)this = v9;
  switch(a4)
  {
    case 4:
      for (; v7; --v7)
      {
        *(_DWORD *)uint64_t v9 = v5;
        *((_DWORD *)v9 + 5) = v5;
        v21.val[0] = (float32x2_t)vadd_s32(vdup_n_s32(v5), (int32x2_t)0x200000001);
        v21.val[1] = v21.val[0];
        int v11 = (float *)(v9 + 4);
        vst2_f32(v11, v21);
        unsigned int v5 = v21.val[0].i32[0];
        v9 += 24;
      }
      return v8;
    case 2:
      for (; v7; --v7)
      {
        *(_WORD *)uint64_t v9 = v5;
        int16x4_t v12 = (int16x4_t)vadd_s32(vdup_n_s32(v5), (int32x2_t)0x200000001);
        int16x4_t v13 = vuzp1_s16(v12, (int16x4_t)0x200000001);
        *((_WORD *)v9 + 5) = v5;
        unsigned int v5 = v12.i32[0];
        *(int16x4_t *)(v9 + 2) = vzip1_s16(v13, v13);
        v9 += 12;
      }
      return v8;
    case 1:
      for (; v7; --v7)
      {
        *uint64_t v9 = v5;
        char v10 = v5 + 2;
        v9[5] = v5++;
        v9[1] = v5;
        v9[2] = v5;
        v9[3] = v10;
        v9[4] = v10;
        v9 += 6;
      }
      return v8;
  }
  unsigned int v15 = (GPUTools::GL::WireframeRenderer *)dy_abort();
  return GPUTools::GL::WireframeRenderer::CreateLineListFromIndexedTriFan(v15, v16, v17, v18, v19, v20);
}

uint64_t GPUTools::GL::WireframeRenderer::CreateLineListFromIndexedTriFan(GPUTools::GL::WireframeRenderer *this, void *a2, void **a3, int a4, int a5)
{
  unsigned int v7 = a3;
  char v10 = malloc_type_malloc(((6 * a3 - 12) * a4), 0x2AB1B6D9uLL);
  *a2 = v10;
  switch(a4)
  {
    case 4:
      int v11 = GPUTools::GL::CopyTriIndicesToLineList<unsigned int>(v7, v10, (int *)this, a5, (uint64_t)&__block_literal_global_25);
      return (2 * v11);
    case 2:
      int v11 = GPUTools::GL::CopyTriIndicesToLineList<unsigned short>(v7, v10, (unsigned __int16 *)this, a5, (uint64_t)&__block_literal_global_23);
      return (2 * v11);
    case 1:
      int v11 = GPUTools::GL::CopyTriIndicesToLineList<unsigned char>(v7, v10, (unsigned __int8 *)this, a5, (uint64_t)&__block_literal_global_21);
      return (2 * v11);
  }
  int16x4_t v13 = (GPUTools::GL::WireframeRenderer *)dy_abort();
  return GPUTools::GL::WireframeRenderer::CreateLineListFromTriFan(v13, v14, v15, v16, v17);
}

uint64_t GPUTools::GL::WireframeRenderer::CreateLineListFromTriFan(GPUTools::GL::WireframeRenderer *this, void **a2, int a3, int a4)
{
  unsigned int v5 = a2;
  int v7 = a3 - 2;
  uint64_t v8 = (6 * (a3 - 2));
  uint64_t v9 = (char *)malloc_type_malloc((v8 * a4), 0x4E2DA168uLL);
  *(void *)this = v9;
  switch(a4)
  {
    case 4:
      if (v7)
      {
        unsigned int v12 = v5;
        do
        {
          *(_DWORD *)uint64_t v9 = v5;
          v23.val[0] = (float32x2_t)vadd_s32(vdup_n_s32(v12), (int32x2_t)0x200000001);
          v23.val[1] = v23.val[0];
          int16x4_t v13 = (float *)(v9 + 4);
          vst2_f32(v13, v23);
          *((_DWORD *)v9 + 5) = v5;
          unsigned int v12 = v23.val[0].i32[0];
          v9 += 24;
          --v7;
        }
        while (v7);
      }
      return v8;
    case 2:
      if (v7)
      {
        unsigned int v14 = v5;
        do
        {
          *(_WORD *)uint64_t v9 = v5;
          int16x4_t v15 = (int16x4_t)vadd_s32(vdup_n_s32(v14), (int32x2_t)0x200000001);
          int16x4_t v16 = vuzp1_s16(v15, (int16x4_t)0x200000001);
          unsigned int v14 = v15.i32[0];
          *(int16x4_t *)(v9 + 2) = vzip1_s16(v16, v16);
          *((_WORD *)v9 + 5) = v5;
          v9 += 12;
          --v7;
        }
        while (v7);
      }
      return v8;
    case 1:
      if (v7)
      {
        unsigned int v10 = v5;
        do
        {
          *uint64_t v9 = v5;
          char v11 = v10++ + 2;
          v9[1] = v10;
          v9[2] = v10;
          v9[3] = v11;
          v9[4] = v11;
          v9[5] = v5;
          v9 += 6;
          --v7;
        }
        while (v7);
      }
      return v8;
  }
  unsigned int v18 = dy_abort();
  return GPUTools::GL::CopyTriIndicesToLineList<unsigned char>(v18, v19, v20, v21, v22);
}

uint64_t GPUTools::GL::CopyTriIndicesToLineList<unsigned char>(unsigned int a1, unsigned char *a2, unsigned __int8 *a3, int a4, uint64_t a5)
{
  unsigned int v17 = 0;
  if (!a1) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t v10 = a1;
  do
  {
    int v12 = *a3++;
    int v11 = v12;
    unsigned int v13 = v17;
    *(&v18 + v17) = v12;
    if (a4 && v11 == 255)
    {
      unsigned int v17 = 0;
    }
    else if (v13 == 2)
    {
      if (v18 != v19 && v18 != v20 && v19 != v20)
      {
        *a2 = v18;
        a2[1] = v19;
        a2[2] = v19;
        char v15 = v20;
        a2[3] = v20;
        a2[4] = v15;
        a2[5] = v18;
        a2 += 6;
        uint64_t v9 = (v9 + 3);
      }
      (*(void (**)(uint64_t, char *, unsigned int *))(a5 + 16))(a5, &v18, &v17);
    }
    else
    {
      unsigned int v17 = v13 + 1;
    }
    --v10;
  }
  while (v10);
  return v9;
}

void ___ZN8GPUTools2GL28CopyTriListIndicesToLineListIhEEjjPT_S3_b_block_invoke(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  *a3 = 0;
}

uint64_t GPUTools::GL::CopyTriIndicesToLineList<unsigned short>(unsigned int a1, _WORD *a2, unsigned __int16 *a3, int a4, uint64_t a5)
{
  unsigned int v17 = 0;
  if (!a1) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t v10 = 2 * a1;
  do
  {
    int v12 = *a3++;
    int v11 = v12;
    unsigned int v13 = v17;
    *(&v18 + v17) = v12;
    if (a4 && v11 == 0xFFFF)
    {
      unsigned int v17 = 0;
    }
    else if (v13 == 2)
    {
      if (v18 != v19 && v18 != v20 && v19 != v20)
      {
        *a2 = v18;
        a2[1] = v19;
        a2[2] = v19;
        __int16 v15 = v20;
        a2[3] = v20;
        a2[4] = v15;
        a2[5] = v18;
        a2 += 6;
        uint64_t v9 = (v9 + 3);
      }
      (*(void (**)(uint64_t, __int16 *, unsigned int *))(a5 + 16))(a5, &v18, &v17);
    }
    else
    {
      unsigned int v17 = v13 + 1;
    }
    v10 -= 2;
  }
  while (v10);
  return v9;
}

void ___ZN8GPUTools2GL28CopyTriListIndicesToLineListItEEjjPT_S3_b_block_invoke(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  *a3 = 0;
}

uint64_t GPUTools::GL::CopyTriIndicesToLineList<unsigned int>(unsigned int a1, _DWORD *a2, int *a3, int a4, uint64_t a5)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  unsigned int v18 = 0;
  if (!a1) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t v10 = 4 * a1;
  do
  {
    int v12 = *a3++;
    int v11 = v12;
    unsigned int v13 = v18;
    *(&v19 + v18) = v12;
    if (a4 && v11 == -1)
    {
      unsigned int v18 = 0;
    }
    else if (v13 == 2)
    {
      if (v19 != v20 && v19 != v21 && v20 != v21)
      {
        *a2 = v19;
        int v15 = v19;
        a2[1] = v20;
        a2[2] = v20;
        int v16 = v21;
        a2[3] = v21;
        a2[4] = v16;
        a2[5] = v15;
        a2 += 6;
        uint64_t v9 = (v9 + 3);
      }
      (*(void (**)(uint64_t, int *, unsigned int *))(a5 + 16))(a5, &v19, &v18);
    }
    else
    {
      unsigned int v18 = v13 + 1;
    }
    v10 -= 4;
  }
  while (v10);
  return v9;
}

void ___ZN8GPUTools2GL28CopyTriListIndicesToLineListIjEEjjPT_S3_b_block_invoke(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  *a3 = 0;
}

void ___ZN8GPUTools2GL29CopyTriStripIndicesToLineListIhEEjjPT_S3_b_block_invoke(uint64_t a1, _WORD *a2)
{
  *a2 = *(_WORD *)((char *)a2 + 1);
}

void ___ZN8GPUTools2GL29CopyTriStripIndicesToLineListItEEjjPT_S3_b_block_invoke(uint64_t a1, _DWORD *a2)
{
  *a2 = *(_DWORD *)((char *)a2 + 2);
}

double ___ZN8GPUTools2GL29CopyTriStripIndicesToLineListIjEEjjPT_S3_b_block_invoke(uint64_t a1, double *a2)
{
  double result = *(double *)((char *)a2 + 4);
  *a2 = result;
  return result;
}

void ___ZN8GPUTools2GL27CopyTriFanIndicesToLineListIhEEjjPT_S3_b_block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a2 + 1) = *(unsigned char *)(a2 + 2);
}

void ___ZN8GPUTools2GL27CopyTriFanIndicesToLineListItEEjjPT_S3_b_block_invoke(uint64_t a1, uint64_t a2)
{
  *(_WORD *)(a2 + 2) = *(_WORD *)(a2 + 4);
}

void ___ZN8GPUTools2GL27CopyTriFanIndicesToLineListIjEEjjPT_S3_b_block_invoke(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a2 + 4) = *(_DWORD *)(a2 + 8);
}

uint64_t GLCFrontDispatch()
{
  return MEMORY[0x270EF9798]();
}

uint64_t GLIContextFromEAGLContext()
{
  return MEMORY[0x270EF97A0]();
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
}

uint64_t _DYOLog()
{
  return MEMORY[0x270F2DC70]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t GPUTools::VMBuffer::VMBuffer(GPUTools::VMBuffer *this)
{
  return MEMORY[0x270F2DD20](this);
}

void GPUTools::VMBuffer::~VMBuffer(GPUTools::VMBuffer *this)
{
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
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

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

uint64_t dy_abort()
{
  return MEMORY[0x270F2DD48]();
}

uint64_t dy_dispatch()
{
  return MEMORY[0x270F2DD58]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}