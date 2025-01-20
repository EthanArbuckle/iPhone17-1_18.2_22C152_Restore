void ___ZN8CSStore26GetLogEv_block_invoke()
{
  os_log_t v0;
  void *v1;
  uint64_t vars8;

  v0 = os_log_create("com.apple.coreservicesstore", "default");
  v1 = (void *)CSStore2::GetLog(void)::result;
  CSStore2::GetLog(void)::result = (uint64_t)v0;
}

void ___ZN8CSStore25Store32_GetDispatchDataDeallocatorQueueEv_block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);

  dispatch_queue_t v1 = dispatch_queue_create("CSStore2 dispatch data deallocation", attr);
  v2 = (void *)CSStore2::Store::_GetDispatchDataDeallocatorQueue(void)::result;
  CSStore2::Store::_GetDispatchDataDeallocatorQueue(void)::result = (uint64_t)v1;
}

uint64_t CSStoreCreateMutableCopy(void *a1, void *a2)
{
  v4 = (void *)MEMORY[0x1AD0DB160]();
  id v9 = 0;
  uint64_t v5 = [a1 mutableCopyWithZone:0 error:&v9];
  id v6 = v9;
  v7 = v6;
  if (a2 && !v5) {
    *a2 = v6;
  }

  return v5;
}

_CSStore *_CSStoreCreateWithURL(uint64_t a1, void *a2)
{
  v4 = (void *)MEMORY[0x1AD0DB160]();
  id v9 = 0;
  uint64_t v5 = [[_CSStore alloc] initWithContentsOfURL:a1 error:&v9];
  id v6 = v9;
  v7 = v6;
  if (a2 && !v5) {
    *a2 = v6;
  }

  return v5;
}

id _CSStoreCreateXPCRepresentation(uint64_t a1, void *a2)
{
  v4 = (void *)MEMORY[0x1AD0DB160]();
  if (performConstantAssertions)
  {
    uint64_t v5 = *(void *)(a1 + 344);
    if (v5) {
      (*(void (**)(void))(**(void **)(v5 + 8) + 8))(*(void *)(v5 + 8));
    }
  }
  id v10 = 0;
  id v6 = CSStore2::Store::encodeAsXPCObject(*(void *)(a1 + 8), &v10);
  id v7 = v10;
  v8 = v7;
  if (a2 && !v6) {
    *a2 = v7;
  }

  return v6;
}

void sub_1A7DB32E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7DB341C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A7DB3504(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _CSStringBindingEnumerateAllBindings(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a1 && a2 && v5)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = ___CSStringBindingEnumerateAllBindings_block_invoke;
    v7[3] = &unk_1E5D2A558;
    id v8 = v5;
    _CSMapEnumerateKeysAndValues(a1, a2, v7);
  }
}

void sub_1A7DB35C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void _CSStoreEnumerateUnits(uint64_t a1, unsigned int a2, void *a3)
{
  id v5 = a3;
  if (performConstantAssertions)
  {
    uint64_t v6 = *(void *)(a1 + 344);
    if (v6) {
      (*(void (**)(void))(**(void **)(v6 + 8) + 8))(*(void *)(v6 + 8));
    }
  }
  if (a2)
  {
    if (v5)
    {
      id v7 = (CSStore2::Store *)(a1 + 8);
      Table = CSStore2::Store::getTable(v7, a2);
      if (Table)
      {
        id v9 = (unsigned int *)Table;
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = ___CSStoreEnumerateUnits_block_invoke;
        v10[3] = &unk_1E5D2A708;
        id v11 = v5;
        CSStore2::Store::enumerateUnits((atomic_ullong *)v7, v9, v10);
      }
    }
  }
}

void sub_1A7DB36E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void _CSStoreAccessContextAccessForRead(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = GetContextLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v12 = a1;
    _os_log_debug_impl(&dword_1A7DB2000, v4, OS_LOG_TYPE_DEBUG, "accessing for read: %@", buf, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 8);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = ___CSStoreAccessContextAccessForRead_block_invoke;
  v8[3] = &unk_1E5D2A8F0;
  id v9 = v3;
  uint64_t v10 = a1;
  uint64_t v6 = *(void (**)(uint64_t, void *))(*(void *)v5 + 16);
  id v7 = v3;
  v6(v5, v8);
}

void sub_1A7DB384C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void CSStore2::CSStoreSharedReadingAccessContext::accessForReading(uint64_t a1, void *a2)
{
  v47 = a2;
  unint64_t v4 = (unint64_t)pthread_self();
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
  uint64_t v5 = (void **)(a1 + 16);
  if (std::__hash_table<_opaque_pthread_t *,std::hash<_opaque_pthread_t *>,std::equal_to<_opaque_pthread_t *>,std::allocator<_opaque_pthread_t *>>::find<_opaque_pthread_t *>((void *)(a1 + 16), v4))
  {
    v46 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v2 = [NSString stringWithUTF8String:"virtual void CSStore2::CSStoreSharedReadingAccessContext::accessForReading(void (^ _Nonnull __strong)())"];
    [v46 handleFailureInFunction:v2 file:@"CSStoreAccessContextPrivInternal.h" lineNumber:204 description:@"context already held for reading"];
  }
  unint64_t v6 = 0x9DDFEA08EB382D69 * (((8 * v4) + 8) ^ HIDWORD(v4));
  unint64_t v7 = 0x9DDFEA08EB382D69 * (HIDWORD(v4) ^ (v6 >> 47) ^ v6);
  unint64_t v8 = 0x9DDFEA08EB382D69 * (v7 ^ (v7 >> 47));
  unint64_t v9 = *(void *)(a1 + 24);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      uint64_t v2 = 0x9DDFEA08EB382D69 * (v7 ^ (v7 >> 47));
      if (v8 >= v9) {
        uint64_t v2 = v8 % v9;
      }
    }
    else
    {
      uint64_t v2 = v8 & (v9 - 1);
    }
    id v11 = (void *)*((void *)*v5 + v2);
    if (v11)
    {
      for (i = (void *)*v11; i; i = (void *)*i)
      {
        unint64_t v13 = i[1];
        if (v13 == v8)
        {
          if (i[2] == v4) {
            goto LABEL_76;
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
          if (v13 != v2) {
            break;
          }
        }
      }
    }
  }
  v14 = operator new(0x18uLL);
  void *v14 = 0;
  v14[1] = v8;
  v14[2] = v4;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 40) + 1);
  float v16 = *(float *)(a1 + 48);
  if (!v9 || (float)(v16 * (float)v9) < v15)
  {
    BOOL v17 = 1;
    if (v9 >= 3) {
      BOOL v17 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v9);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      int8x8_t prime = (int8x8_t)v19;
    }
    else {
      int8x8_t prime = (int8x8_t)v18;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v9 = *(void *)(a1 + 24);
    }
    if (*(void *)&prime > v9) {
      goto LABEL_32;
    }
    if (*(void *)&prime < v9)
    {
      unint64_t v27 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 40) / *(float *)(a1 + 48));
      if (v9 < 3 || (uint8x8_t v28 = (uint8x8_t)vcnt_s8((int8x8_t)v9), v28.i16[0] = vaddlv_u8(v28), v28.u32[0] > 1uLL))
      {
        unint64_t v27 = std::__next_prime(v27);
      }
      else
      {
        uint64_t v29 = 1 << -(char)__clz(v27 - 1);
        if (v27 >= 2) {
          unint64_t v27 = v29;
        }
      }
      if (*(void *)&prime <= v27) {
        int8x8_t prime = (int8x8_t)v27;
      }
      if (*(void *)&prime >= v9)
      {
        unint64_t v9 = *(void *)(a1 + 24);
      }
      else
      {
        if (prime)
        {
LABEL_32:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:nn180100]();
          }
          v21 = operator new(8 * *(void *)&prime);
          v22 = *v5;
          *uint64_t v5 = v21;
          if (v22) {
            operator delete(v22);
          }
          uint64_t v23 = 0;
          *(int8x8_t *)(a1 + 24) = prime;
          do
            *((void *)*v5 + v23++) = 0;
          while (*(void *)&prime != v23);
          v24 = *(void **)(a1 + 32);
          if (v24)
          {
            unint64_t v25 = v24[1];
            uint8x8_t v26 = (uint8x8_t)vcnt_s8(prime);
            v26.i16[0] = vaddlv_u8(v26);
            if (v26.u32[0] > 1uLL)
            {
              if (v25 >= *(void *)&prime) {
                v25 %= *(void *)&prime;
              }
            }
            else
            {
              v25 &= *(void *)&prime - 1;
            }
            *((void *)*v5 + v25) = a1 + 32;
            v30 = (void *)*v24;
            if (*v24)
            {
              do
              {
                unint64_t v31 = v30[1];
                if (v26.u32[0] > 1uLL)
                {
                  if (v31 >= *(void *)&prime) {
                    v31 %= *(void *)&prime;
                  }
                }
                else
                {
                  v31 &= *(void *)&prime - 1;
                }
                if (v31 != v25)
                {
                  if (!*((void *)*v5 + v31))
                  {
                    *((void *)*v5 + v31) = v24;
                    goto LABEL_57;
                  }
                  void *v24 = *v30;
                  void *v30 = **((void **)*v5 + v31);
                  **((void **)*v5 + v31) = v30;
                  v30 = v24;
                }
                unint64_t v31 = v25;
LABEL_57:
                v24 = v30;
                v30 = (void *)*v30;
                unint64_t v25 = v31;
              }
              while (v30);
            }
          }
          unint64_t v9 = (unint64_t)prime;
          goto LABEL_61;
        }
        v45 = *v5;
        *uint64_t v5 = 0;
        if (v45) {
          operator delete(v45);
        }
        unint64_t v9 = 0;
        *(void *)(a1 + 24) = 0;
      }
    }
LABEL_61:
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9) {
        uint64_t v2 = v8 % v9;
      }
      else {
        uint64_t v2 = v8;
      }
    }
    else
    {
      uint64_t v2 = (v9 - 1) & v8;
    }
  }
  v32 = *v5;
  v33 = (void *)*((void *)*v5 + v2);
  if (v33)
  {
    void *v14 = *v33;
LABEL_74:
    void *v33 = v14;
    goto LABEL_75;
  }
  void *v14 = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = v14;
  v32[v2] = a1 + 32;
  if (*v14)
  {
    unint64_t v34 = *(void *)(*v14 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v34 >= v9) {
        v34 %= v9;
      }
    }
    else
    {
      v34 &= v9 - 1;
    }
    v33 = (char *)*v5 + 8 * v34;
    goto LABEL_74;
  }
LABEL_75:
  ++*(void *)(a1 + 40);
LABEL_76:
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  v47[2]();
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
  v35 = std::__hash_table<_opaque_pthread_t *,std::hash<_opaque_pthread_t *>,std::equal_to<_opaque_pthread_t *>,std::allocator<_opaque_pthread_t *>>::find<_opaque_pthread_t *>((void *)(a1 + 16), v4);
  if (v35)
  {
    int8x8_t v36 = *(int8x8_t *)(a1 + 24);
    unint64_t v37 = v35[1];
    uint8x8_t v38 = (uint8x8_t)vcnt_s8(v36);
    v38.i16[0] = vaddlv_u8(v38);
    if (v38.u32[0] > 1uLL)
    {
      if (v37 >= *(void *)&v36) {
        v37 %= *(void *)&v36;
      }
    }
    else
    {
      v37 &= *(void *)&v36 - 1;
    }
    v39 = (void *)*((void *)*v5 + v37);
    do
    {
      v40 = v39;
      v39 = (void *)*v39;
    }
    while (v39 != v35);
    if (v40 == (void *)(a1 + 32)) {
      goto LABEL_94;
    }
    unint64_t v41 = v40[1];
    if (v38.u32[0] > 1uLL)
    {
      if (v41 >= *(void *)&v36) {
        v41 %= *(void *)&v36;
      }
    }
    else
    {
      v41 &= *(void *)&v36 - 1;
    }
    if (v41 != v37)
    {
LABEL_94:
      if (!*v35) {
        goto LABEL_95;
      }
      unint64_t v42 = *(void *)(*v35 + 8);
      if (v38.u32[0] > 1uLL)
      {
        if (v42 >= *(void *)&v36) {
          v42 %= *(void *)&v36;
        }
      }
      else
      {
        v42 &= *(void *)&v36 - 1;
      }
      if (v42 != v37) {
LABEL_95:
      }
        *((void *)*v5 + v37) = 0;
    }
    uint64_t v43 = *v35;
    if (*v35)
    {
      unint64_t v44 = *(void *)(v43 + 8);
      if (v38.u32[0] > 1uLL)
      {
        if (v44 >= *(void *)&v36) {
          v44 %= *(void *)&v36;
        }
      }
      else
      {
        v44 &= *(void *)&v36 - 1;
      }
      if (v44 != v37)
      {
        *((void *)*v5 + v44) = v40;
        uint64_t v43 = *v35;
      }
    }
    void *v40 = v43;
    void *v35 = 0;
    --*(void *)(a1 + 40);
    operator delete(v35);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
}

void sub_1A7DB3E7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void *std::__hash_table<_opaque_pthread_t *,std::hash<_opaque_pthread_t *>,std::equal_to<_opaque_pthread_t *>,std::allocator<_opaque_pthread_t *>>::find<_opaque_pthread_t *>(void *a1, unint64_t a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = 0x9DDFEA08EB382D69 * (((8 * a2) + 8) ^ HIDWORD(a2));
  unint64_t v4 = 0x9DDFEA08EB382D69 * (HIDWORD(a2) ^ (v3 >> 47) ^ v3);
  unint64_t v5 = 0x9DDFEA08EB382D69 * (v4 ^ (v4 >> 47));
  uint8x8_t v6 = (uint8x8_t)vcnt_s8(v2);
  v6.i16[0] = vaddlv_u8(v6);
  if (v6.u32[0] > 1uLL)
  {
    unint64_t v7 = v5;
    if (v5 >= *(void *)&v2) {
      unint64_t v7 = v5 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v7 = v5 & (*(void *)&v2 - 1);
  }
  unint64_t v8 = *(void **)(*a1 + 8 * v7);
  if (!v8) {
    return 0;
  }
  result = (void *)*v8;
  if (*v8)
  {
    do
    {
      unint64_t v10 = result[1];
      if (v10 == v5)
      {
        if (result[2] == a2) {
          return result;
        }
      }
      else
      {
        if (v6.u32[0] > 1uLL)
        {
          if (v10 >= *(void *)&v2) {
            v10 %= *(void *)&v2;
          }
        }
        else
        {
          v10 &= *(void *)&v2 - 1;
        }
        if (v10 != v7) {
          return 0;
        }
      }
      result = (void *)*result;
    }
    while (result);
  }
  return result;
}

id GetContextLog(void)
{
  if (GetContextLog(void)::once != -1) {
    dispatch_once(&GetContextLog(void)::once, &__block_literal_global_521);
  }
  v0 = (void *)GetContextLog(void)::result;

  return v0;
}

unint64_t _CSArrayGetValueAtIndex(uint64_t a1, unsigned int a2, unsigned int a3)
{
  unint64_t result = 0;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a1 && a2)
  {
    if (performConstantAssertions)
    {
      uint64_t v7 = *(void *)(a1 + 344);
      if (v7) {
        (*(void (**)(void))(**(void **)(v7 + 8) + 8))(*(void *)(v7 + 8));
      }
    }
    CSStore2::Array::Get((CSStore2::Array *)&v17, (CSStore2::Store *)(a1 + 8), a2);
    if (v19)
    {
      unsigned int v9 = **(_DWORD **)&v18[4] & 0x1FFFFFFF;
      if (v9 >= *(_DWORD *)&v18[12]) {
        uint64_t v10 = *(unsigned int *)&v18[12];
      }
      else {
        uint64_t v10 = v9;
      }
      if (v10 <= a3)
      {
        v14 = CSStore2::GetLog(v8);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          int v17 = 134218240;
          *(void *)unint64_t v18 = a3;
          *(_WORD *)&v18[8] = 2048;
          *(void *)&v18[10] = v10;
          _os_log_error_impl(&dword_1A7DB2000, v14, OS_LOG_TYPE_ERROR, "Out-of-bounds array read: %llu >= %llu", (uint8_t *)&v17, 0x16u);
        }

        LOBYTE(v12) = 0;
        uint64_t v15 = 0;
        unsigned int v13 = 0;
      }
      else
      {
        uint64_t v11 = *(void *)&v18[4] + 4;
        if ((**(_DWORD **)&v18[4] & 0x20000000) != 0)
        {
          LOWORD(v12) = *(_WORD *)(v11 + 2 * a3);
          unsigned int v13 = v12 & 0xFF00;
        }
        else
        {
          int v12 = *(_DWORD *)(v11 + 4 * a3);
          unsigned int v13 = v12 & 0xFFFFFF00;
        }
        uint64_t v15 = 0x100000000;
      }
      unint64_t v16 = v15 | v13 | v12;
      if (v16 <= 0x100000000) {
        return 0x100000000;
      }
      else {
        return v16;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t _CSArrayGetCount(uint64_t a1, unsigned int a2)
{
  if (!a1 || !a2) {
    return 0;
  }
  if (performConstantAssertions)
  {
    uint64_t v4 = *(void *)(a1 + 344);
    if (v4) {
      (*(void (**)(void))(**(void **)(v4 + 8) + 8))(*(void *)(v4 + 8));
    }
  }
  CSStore2::Array::Get((CSStore2::Array *)v7, (CSStore2::Store *)(a1 + 8), a2);
  if (!v9) {
    return 0;
  }
  unsigned int v5 = *(_DWORD *)v7[1] & 0x1FFFFFFF;
  if (v5 >= v8) {
    return v8;
  }
  else {
    return v5;
  }
}

UInt8 *_CSStoreCreateDataWithUnitNoCopy(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint8x8_t v6 = (void *)MEMORY[0x1AD0DB160]();
  if (performConstantAssertions)
  {
    uint64_t v7 = *(void *)(a1 + 344);
    if (v7) {
      (*(void (**)(void))(**(void **)(v7 + 8) + 8))(*(void *)(v7 + 8));
    }
  }
  unsigned int length = 0;
  Unit = CSStoreGetUnit(a1, a2, a3, &length);
  char v9 = (UInt8 *)Unit;
  if (Unit)
  {
    uint64_t v10 = *(void *)(a1 + 8);
    if (v10)
    {
      uint64_t v11 = *(void *)(v10 + 8);
      int v12 = v11;
    }
    else
    {
      int v12 = 0;
      uint64_t v11 = MEMORY[8];
    }
    unsigned int v13 = Unit - v12;
    uint64_t v14 = length;
    if (__CFADD__(v13, length) || v13 + length > *(_DWORD *)(v11 + 12))
    {
LABEL_15:
      CFDataRef v19 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v9, v14);
      if (!v19)
      {
        char v9 = 0;
        goto LABEL_18;
      }
      goto LABEL_16;
    }
    uint64_t v15 = v11 + v13;
    if ((uint64_t)atomic_fetch_add((atomic_ullong *volatile)(a1 + 304), 1uLL) < 15)
    {
      CFDataRef v19 = (CFDataRef)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v15 length:v14];
      if (!v19)
      {
LABEL_14:
        LODWORD(v14) = length;
        goto LABEL_15;
      }
    }
    else
    {
      id v16 = *(id *)(a1 + 8);
      length_4[0] = MEMORY[0x1E4F143A8];
      length_4[1] = 3221225472;
      length_4[2] = ___ZNK8CSStore25Store9getNSDataEjj_block_invoke;
      length_4[3] = &unk_1E5D2A5F0;
      id v17 = v16;
      id v23 = v17;
      unint64_t v18 = (void *)MEMORY[0x1AD0DB340](length_4);
      CFDataRef v19 = (CFDataRef)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v15 length:v14 deallocator:v18];

      if (!v19) {
        goto LABEL_14;
      }
    }
LABEL_16:
    char v9 = v19;
  }
LABEL_18:
  return v9;
}

void sub_1A7DB4444(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t CSStringBindingFindStringAndBindings(uint64_t a1, void *a2, CSStore2::_StringFunctions *a3, const char *a4, _DWORD *a5, _DWORD *a6)
{
  uint64_t v10 = _CSGetStringForCharacters(a1, a3, a4);
  if (!v10) {
    return 4294957797;
  }
  if (a5) {
    *a5 = v10;
  }
  int Bindings = _CSStringBindingGetBindings(a1, a2, v10);
  if (!Bindings) {
    return 4294957797;
  }
  if (!a6) {
    return 0;
  }
  int v12 = Bindings;
  uint64_t result = 0;
  *a6 = v12;
  return result;
}

uint64_t _CSGetStringForCharacters(uint64_t a1, CSStore2::_StringFunctions *a2, const char *a3)
{
  if (performConstantAssertions)
  {
    uint64_t v6 = *(void *)(a1 + 344);
    if (v6) {
      (*(void (**)(void))(**(void **)(v6 + 8) + 8))(*(void *)(v6 + 8));
    }
  }
  CSStore2::String::Find((CSStore2::String *)v8, (CSStore2::Store *)(a1 + 8), a2, a3);
  if (v10) {
    return v9;
  }
  else {
    return 0;
  }
}

void CSStore2::String::Find(CSStore2::String *this, CSStore2::Store *a2, CSStore2::_StringFunctions *a3, const char *a4)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v42 = 0;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x5812000000;
  v45 = __Block_byref_object_copy__300;
  v46 = __Block_byref_object_dispose__301;
  uint64_t v47 = 0;
  char v48 = 0;
  char v49 = 0;
  char v52 = 0;
  if (a4 > 5)
  {
LABEL_15:
    StringCache = (_DWORD *)CSStore2::getStringCache(a2, a2);
    if (StringCache)
    {
      unsigned int HashCode = CSStore2::_StringFunctions::getHashCode(a3, a4);
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      int8x8_t v36 = ___ZN8CSStore26String4FindERNS_5StoreEPKcj_block_invoke;
      unint64_t v37 = &unk_1E5D2A810;
      v39 = a2;
      v40 = a3;
      int v41 = (int)a4;
      uint8x8_t v38 = &v42;
      id v17 = v35;
      char v50 = 0;
      if (*StringCache)
      {
        uint64_t v18 = HashCode % *StringCache;
        CFDataRef v19 = &StringCache[2 * v18];
        int v22 = v19[1];
        v21 = v19 + 1;
        int v20 = v22;
        if ((v22 - 0x20000000) >= 0xE0000001)
        {
          uint64_t v23 = StringCache[2 * v18 + 2];
          unsigned int v24 = v23 + 8 * v20;
          if (!__CFADD__(v23, 8 * v20))
          {
            uint64_t v25 = *(void *)(*(void *)a2 + 8);
            unsigned int v26 = *(_DWORD *)(v25 + 12);
            if (v24 <= v26 && v26 > v23)
            {
              uint8x8_t v28 = (unsigned int *)(v25 + v23);
              unint64_t v29 = 1;
              do
              {
                v36((uint64_t)v17, v28, (uint64_t)(v28 + 1), &v50);
                BOOL v30 = v29++ >= *v21;
                v28 += 2;
              }
              while (!v30 && v50 == 0);
            }
          }
        }
      }
    }
    goto LABEL_33;
  }
  if (a4)
  {
    uint64_t v8 = 0;
    unsigned int v9 = 0;
    uint64_t v10 = MEMORY[0x1E4F14390];
    while (1)
    {
      unsigned int v11 = *((char *)a3 + v8);
      if (!((v11 & 0x80000000) != 0
           ? __maskrune(*((char *)a3 + v8), 0x40000uLL)
           : *(_DWORD *)(v10 + 4 * v11 + 60) & 0x40000))
        goto LABEL_15;
      unsigned int v13 = memchr(CSStore2::String::kPackedAlphabet, v11, 0x40uLL);
      if (v13) {
        unsigned int v9 = (v13 - CSStore2::String::kPackedAlphabet) | (v9 << 6);
      }
      if (++v8 >= (unint64_t)a4 || !v13)
      {
        if (!v13) {
          goto LABEL_15;
        }
        int v14 = (4 * v9) | 1;
        *(void *)&long long __dst = 0;
        char v52 = 1;
        if (!a4) {
          goto LABEL_31;
        }
        memcpy(&__dst, a3, a4);
        DWORD2(__dst) = a4;
        if (v52) {
          goto LABEL_32;
        }
        goto LABEL_15;
      }
    }
  }
  *(void *)&long long __dst = 0;
  int v14 = 1;
  char v52 = 1;
LABEL_31:
  DWORD2(__dst) = a4;
LABEL_32:
  v32 = v43;
  v43[6] = 0;
  *((_DWORD *)v32 + 14) = v14;
  *((unsigned char *)v32 + 60) = 1;
  *((_OWORD *)v32 + 4) = __dst;
  *((unsigned char *)v32 + 80) = v52;
LABEL_33:
  v33 = v43;
  long long v34 = *((_OWORD *)v43 + 4);
  *(_OWORD *)this = *((_OWORD *)v43 + 3);
  *((_OWORD *)this + 1) = v34;
  *((void *)this + 4) = v33[10];
  _Block_object_dispose(&v42, 8);
}

void sub_1A7DB4864(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CSStore2::_StringFunctions::getHashCode(CSStore2::_StringFunctions *this, const char *a2)
{
  __int16 v2 = (__int16)a2;
  if (a2 < 0x81)
  {
    if (a2)
    {
      uint64_t v5 = a2;
      do
      {
        __int16 v6 = *(unsigned __int8 *)this;
        this = (CSStore2::_StringFunctions *)((char *)this + 1);
        __int16 v2 = 17 * v2 + v6;
        --v5;
      }
      while (v5);
    }
    else
    {
      __int16 v2 = 0;
    }
  }
  else
  {
    for (uint64_t i = 0; i != 64; ++i)
      __int16 v2 = 17 * v2 + *((unsigned __int8 *)this + i);
    for (uint64_t j = 0; j != 64; ++j)
      __int16 v2 = 17 * v2 + *((unsigned __int8 *)this + (a2 - 64) + j);
  }
  return (unsigned __int16)((v2 << (a2 & 7)) + v2);
}

atomic_ullong CSStore2::getStringCache(CSStore2 *this, const CSStore2::Store *a2)
{
  atomic_ullong result = *((void *)this + 34);
  if (result || (atomic_ullong result = CSStore2::Store::getTable((atomic_ullong *)this, &cfstr_String_0.isa)) != 0)
  {
    uint64_t v4 = *(unsigned int *)(result + 80);
    if (v4 == -1)
    {
      return 0;
    }
    else
    {
      atomic_ullong result = 0;
      uint64_t v5 = *(void *)(*(void *)this + 8);
      unsigned int v6 = *(_DWORD *)(v5 + 12);
      if (v6 > v4 && v4 < 0xFFFFFFFC && (int)v4 + 4 <= v6) {
        return v5 + v4;
      }
    }
  }
  return result;
}

uint64_t _CSStringBindingGetBindings(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = 0;
  unsigned int v5 = 0;
  if (a1 && a2)
  {
    if (a3)
    {
      CSMapGetValue(a1, a2, a3, &v5);
      return v5;
    }
  }
  return result;
}

uint64_t CSStringBindingStoreInit(uint64_t a1, NSString *a2, int a3, char a4, uint64_t a5)
{
  uint64_t v5 = 4294967246;
  if (a1 && a2 && a5)
  {
    v7[0] = xmmword_1EFE40E28;
    v7[1] = unk_1EFE40E38;
    void v7[2] = xmmword_1EFE40E48;
    *(_DWORD *)(a5 + 96) = a3;
    *(unsigned char *)(a5 + 100) = a4;
    return CSMapInit(a1, a2, v7, 0, a5);
  }
  return v5;
}

uint64_t CSMapInit(uint64_t a1, NSString *a2, long long *a3, uint64_t a4, uint64_t a5)
{
  unsigned int TableWithName = _CSStoreGetTableWithName(a1, a2);
  *(_DWORD *)a5 = TableWithName;
  if (!TableWithName) {
    return 4294957797;
  }
  if (a3)
  {
    long long v10 = *a3;
    long long v11 = a3[2];
    *(_OWORD *)(a5 + 24) = a3[1];
    *(_OWORD *)(a5 + 40) = v11;
  }
  else
  {
    long long v10 = 0uLL;
    *(_OWORD *)(a5 + 24) = 0u;
    *(_OWORD *)(a5 + 40) = 0u;
  }
  *(_OWORD *)(a5 + 8) = v10;
  *(void *)(a5 + 56) = a4;
  *(_OWORD *)(a5 + 64) = 0u;
  *(_OWORD *)(a5 + 80) = 0u;
  CSMapSync(a1, a5);
  return 0;
}

void _CSStringBindingEnumerate(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (v7)
        {
          unsigned int v8 = 0;
          CSMapGetValue(a1, a2, a3, &v8);
          if (v8) {
            _CSArrayEnumerateAllValues(a1, v8, v7);
          }
        }
      }
    }
  }
}

void sub_1A7DB4B60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  _Unwind_Resume(a1);
}

uint64_t CSMapGetValue(uint64_t a1, void *a2, uint64_t a3, _DWORD *a4)
{
  uint64_t result = CSMapSync(a1, (uint64_t)a2);
  if (!result)
  {
    unsigned int v9 = 0;
    uint64_t result = _CSMapFindBucketForKey(a1, a2, a3, (int *)&v9, 0);
    if (!result) {
      *a4 = *(_DWORD *)(a2[11] + 4 * v9);
    }
  }
  return result;
}

uint64_t CSMapSync(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (os_unfair_lock_s *)(a2 + 64);
  os_unfair_lock_lock((os_unfair_lock_t)(a2 + 64));
  uint64_t v5 = 4294967246;
  if (a1 && a2)
  {
    int v6 = *(_DWORD *)(a2 + 68);
    if (v6 == CSStoreGetGeneration(a1))
    {
      uint64_t v5 = 0;
    }
    else
    {
      *(_DWORD *)(a2 + 68) = CSStoreGetGeneration(a1);
      Header = CSStoreGetHeader(a1, *(_DWORD *)a2, 0);
      *(void *)(a2 + 72) = Header;
      if (Header
        && (Unit = CSStoreGetUnit(a1, *(_DWORD *)a2, *((_DWORD *)Header + 1), 0), (*(void *)(a2 + 80) = Unit) != 0))
      {
        uint64_t v5 = 0;
        *(void *)(a2 + 88) = &Unit[4 * *(unsigned int *)(*(void *)(a2 + 72) + 8)];
      }
      else
      {
        uint64_t v5 = 4294957800;
      }
    }
  }
  os_unfair_lock_unlock(v4);
  return v5;
}

char *CSStoreGetHeader(uint64_t a1, unsigned int a2, _DWORD *a3)
{
  if (performConstantAssertions)
  {
    uint64_t v6 = *(void *)(a1 + 344);
    if (v6) {
      (*(void (**)(void))(**(void **)(v6 + 8) + 8))(*(void *)(v6 + 8));
    }
  }
  uint64_t result = CSStore2::Store::getTable((CSStore2::Store *)(a1 + 8), a2);
  if (result)
  {
    uint64_t v8 = (uint64_t)result;
    result += 80;
    if (a3) {
      *a3 = *(_DWORD *)(v8 + 4) - 72;
    }
  }
  return result;
}

uint64_t CSStoreGetGeneration(uint64_t a1)
{
  if (performConstantAssertions)
  {
    uint64_t v2 = *(void *)(a1 + 344);
    if (v2) {
      (*(void (**)(void))(**(void **)(v2 + 8) + 8))(*(void *)(v2 + 8));
    }
  }
  return *(unsigned int *)(*(void *)(*(void *)(a1 + 8) + 8) + 8);
}

uint64_t _CSMapFindBucketForKey(uint64_t a1, void *a2, uint64_t a3, int *a4, int *a5)
{
  int v7 = a3;
  *a4 = -1;
  if (a5) {
    *a5 = -1;
  }
  long long v10 = (uint64_t (*)(uint64_t, void *, uint64_t))a2[3];
  unsigned int v11 = a3;
  if (v10) {
    unsigned int v11 = v10(a1, a2, a3);
  }
  unsigned int v13 = (unsigned int *)a2[9];
  uint64_t v12 = a2[10];
  unint64_t v14 = v13[2];
  unint64_t v15 = v11 % v14;
  unsigned int v16 = v13[5];
  unsigned int v17 = v13[6];
  unint64_t v18 = v15;
  if (a5)
  {
    while (1)
    {
      int v19 = *(_DWORD *)(v12 + 4 * v18);
      if (v19 == v16)
      {
        if (*a5 == -1) {
          *a5 = v18;
        }
LABEL_56:
        if (*a4 == -1) {
          return 4294957797;
        }
        else {
          return 0;
        }
      }
      if (v19 == v17) {
        break;
      }
      if (v19 == v7 && *a4 == -1)
      {
        *a4 = v18;
        int v20 = *a5;
        goto LABEL_11;
      }
LABEL_15:
      if (++v18 >= v14)
      {
        if (v15)
        {
          uint64_t v23 = 0;
          while (1)
          {
            int v24 = *(_DWORD *)(v12 + 4 * v23);
            if (v24 == v16)
            {
              if (*a5 == -1) {
                *a5 = v23;
              }
              goto LABEL_56;
            }
            if (v24 == v17) {
              break;
            }
            if (v24 == v7 && *a4 == -1)
            {
              *a4 = v23;
              int v25 = *a5;
              goto LABEL_35;
            }
LABEL_39:
            if (++v23 >= v15) {
              return 4294957797;
            }
          }
          if (*a5 == -1) {
            *a5 = v23;
          }
          int v25 = *a4;
LABEL_35:
          if (v25 != -1) {
            return 0;
          }
          goto LABEL_39;
        }
        return 4294957797;
      }
    }
    if (*a5 == -1) {
      *a5 = v18;
    }
    int v20 = *a4;
LABEL_11:
    if (v20 != -1) {
      return 0;
    }
    goto LABEL_15;
  }
  while (1)
  {
    int v22 = *(_DWORD *)(v12 + 4 * v18);
    if (v22 == v16) {
      break;
    }
    if (v22 == v7 && v22 != v17)
    {
      uint64_t result = 0;
      *a4 = v18;
      return result;
    }
    if (++v18 >= v14)
    {
      if (v15)
      {
        uint64_t v27 = 0;
        uint64_t result = 4294957797;
        while (1)
        {
          int v28 = *(_DWORD *)(v12 + 4 * v27);
          if (v28 == v16) {
            break;
          }
          if (v28 == v7 && v28 != v17)
          {
            uint64_t result = 0;
            *a4 = v27;
            return result;
          }
          if (++v27 >= v15) {
            return result;
          }
        }
      }
      return 4294957797;
    }
  }
  return 4294957797;
}

NSString *_CSStoreGetTableWithName(uint64_t a1, NSString *a2)
{
  uint64_t v4 = (void *)MEMORY[0x1AD0DB160]();
  if (performConstantAssertions)
  {
    uint64_t v5 = *(void *)(a1 + 344);
    if (v5) {
      (*(void (**)(void))(**(void **)(v5 + 8) + 8))(*(void *)(v5 + 8));
    }
  }
  if (a2)
  {
    Table = (_DWORD *)CSStore2::Store::getTable((atomic_ullong *)(a1 + 8), a2);
    if (Table) {
      a2 = (NSString *)(4 * *Table);
    }
    else {
      a2 = 0;
    }
  }
  return a2;
}

atomic_ullong CSStore2::Store::getTable(atomic_ullong *this, NSString *a2)
{
  unint64_t v3 = a2;
  uint64_t v10 = 0;
  unsigned int v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  if ([(NSString *)v3 isEqualToString:@"<catalog>"])
  {
    atomic_ullong v4 = *this;
    if (*this) {
      atomic_ullong v4 = *(void *)(v4 + 8);
    }
    atomic_ullong v5 = v4 + 20;
    v11[3] = v4 + 20;
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = ___ZNK8CSStore25Store8getTableEP8NSString_block_invoke;
    long long v7[3] = &unk_1E5D2A618;
    uint64_t v8 = v3;
    unsigned int v9 = &v10;
    CSStore2::Store::enumerateTables(this, v7);

    atomic_ullong v5 = v11[3];
  }
  _Block_object_dispose(&v10, 8);

  return v5;
}

void sub_1A7DB5148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void CSStore2::Store::enumerateTables(atomic_ullong *a1, void *a2)
{
  id v3 = a2;
  atomic_ullong v4 = v3;
  if (v3)
  {
    atomic_ullong v5 = *a1;
    if (*a1) {
      atomic_ullong v5 = *(void *)(v5 + 8);
    }
    uint64_t v6 = (unsigned int *)(v5 + 20);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = ___ZNK8CSStore25Store15enumerateTablesEU13block_pointerFvPKNS_5TableEPbE_block_invoke;
    long long v7[3] = &unk_1E5D2A708;
    id v8 = v3;
    CSStore2::Store::enumerateUnits(a1, v6, v7);
  }
}

void sub_1A7DB522C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void CSStore2::Store::enumerateUnits(atomic_ullong *a1, unsigned int *a2, void *a3)
{
  atomic_ullong v5 = a3;
  if (v5)
  {
    atomic_fetch_add(a1 + 36, 1uLL);
    uint64_t v6 = a2[19];
    if (v6 != -1)
    {
      uint64_t v7 = *(void *)(*a1 + 8);
      if (*(_DWORD *)(v7 + 12) > v6)
      {
        id v8 = (unsigned int *)(v7 + v6);
        unsigned __int8 v27 = 0;
        unint64_t v9 = *(unsigned int *)(v7 + v6);
        if (v9)
        {
          unint64_t v10 = 0;
          do
          {
            unsigned int v11 = &v8[2 * v10];
            unsigned int v14 = v11[1];
            uint64_t v13 = v11 + 1;
            unsigned int v12 = v14;
            if (v14 && (unsigned int v15 = v12 >> 29) == 0)
            {
              uint64_t v16 = v8[2 * v10 + 2];
              uint64_t v17 = *(void *)(*a1 + 8);
              unsigned int v18 = *(_DWORD *)(v17 + 12);
              BOOL v19 = __CFADD__(v16, 8 * v12);
              unsigned int v20 = v16 + 8 * v12;
              char v21 = v19;
              if (v18 > v16 && (v21 & 1) == 0 && v20 <= v18)
              {
                int v22 = (unsigned int *)(v17 + v16);
                unint64_t v23 = 1;
                do
                {
                  unsigned int v24 = *v22;
                  v22 += 2;
                  Unit = CSStore2::Store::getUnit((CSStore2 **)a1, (const CSStore2::Table *)a2, v24);
                  if (Unit) {
                    v5[2](v5, Unit, &v27);
                  }
                  unsigned int v15 = v27;
                  BOOL v19 = v23++ >= *v13;
                }
                while (!v19 && v27 == 0);
                unint64_t v9 = *v8;
              }
            }
            else
            {
              unsigned int v15 = 0;
            }
            ++v10;
          }
          while (v10 < v9 && !v15);
        }
      }
    }
    atomic_fetch_add(a1 + 36, 0xFFFFFFFFFFFFFFFFLL);
  }
}

void sub_1A7DB5398(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZNK8CSStore25Store15enumerateTablesEU13block_pointerFvPKNS_5TableEPbE_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void ___ZNK8CSStore25Store8getTableEP8NSString_block_invoke(uint64_t a1, CSStore2::Table *this, unsigned char *a3)
{
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = (__CFString *)CSStore2::Table::copyCFName(this);
  LODWORD(v6) = [v6 isEqualToString:v7];

  if (v6)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = this;
    *a3 = 1;
  }
}

void sub_1A7DB548C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

CFStringRef CSStore2::Table::copyCFName(CSStore2::Table *this)
{
  dispatch_queue_t v1 = (const UInt8 *)this + 8;
  CFIndex v2 = strnlen((const char *)this + 8, 0x30uLL);
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CFA0];

  return CFStringCreateWithBytesNoCopy(v3, v1, v2, 0x8000100u, 0, v4);
}

uint64_t ___ZN8CSStore25Store12_dataDidMoveEv_block_invoke(uint64_t result, _DWORD *a2)
{
  uint64_t v2 = *a2 & 0x3FFFFFFF;
  if (v2 <= 0x3F)
  {
    CFAllocatorRef v3 = *(uint64_t **)(result + 32);
    uint64_t v4 = *v3;
    if (*v3) {
      unint64_t v5 = *(void *)(v4 + 8);
    }
    else {
      unint64_t v5 = 0;
    }
    uint64_t v6 = v3 + 1;
    int v7 = -1;
    BOOL v8 = (unint64_t)a2 >= v5;
    unint64_t v9 = (unint64_t)a2 - v5;
    if (v8 && !HIDWORD(v9))
    {
      if ((v9 + 1) > *(_DWORD *)(*(void *)(v4 + 8) + 12) || v9 == -1) {
        int v7 = -1;
      }
      else {
        int v7 = v9;
      }
    }
    *((_DWORD *)v6 + v2) = v7;
  }
  return result;
}

void ___ZNK8CSStore25Store4copyEPU15__autoreleasingP7NSError_block_invoke(uint64_t a1, CSStore2::Table *this, unsigned char *a3)
{
  if (*((_DWORD *)this + 18) == 0x3FFFFFFF)
  {
    unint64_t v5 = (__CFString *)CSStore2::Table::copyCFName(this);
    uint64_t v6 = [(__CFString *)v5 copy];
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    BOOL v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    *a3 = 1;
  }
}

void sub_1A7DB55D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _CSMapEnumerateKeysAndValues(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  uint64_t v7 = (void (**)(void, void, void, void))v6;
  if (!a1 || !a2 || !v6 || CSMapSync(a1, (uint64_t)a2)) {
    goto LABEL_52;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  float v31 = 1.0;
  BOOL v8 = (_DWORD *)a2[9];
  if (!v8[2]) {
    goto LABEL_51;
  }
  uint64_t v9 = 0;
  unint64_t v10 = 0;
  unint64_t v11 = 0;
  do
  {
    unint64_t v12 = *(unsigned int *)(a2[10] + 4 * v11);
    if (v8[5] != v12 && v8[6] != v12)
    {
      int v13 = *(_DWORD *)(a2[11] + 4 * v11);
      if (v10)
      {
        uint8x8_t v14 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
        v14.i16[0] = vaddlv_u8(v14);
        if (v14.u32[0] > 1uLL)
        {
          unint64_t v3 = *(unsigned int *)(a2[10] + 4 * v11);
          if (v10 <= v12) {
            unint64_t v3 = v12 % v10;
          }
        }
        else
        {
          unint64_t v3 = (v10 - 1) & v12;
        }
        unsigned int v15 = *(uint64_t ***)(v29 + 8 * v3);
        if (v15)
        {
          for (uint64_t i = *v15; i; uint64_t i = (uint64_t *)*i)
          {
            unint64_t v17 = i[1];
            if (v17 == v12)
            {
              if (*((_DWORD *)i + 4) == v12) {
                goto LABEL_47;
              }
            }
            else
            {
              if (v14.u32[0] > 1uLL)
              {
                if (v17 >= v10) {
                  v17 %= v10;
                }
              }
              else
              {
                v17 &= v10 - 1;
              }
              if (v17 != v3) {
                break;
              }
            }
          }
        }
      }
      unsigned int v18 = operator new(0x18uLL);
      *unsigned int v18 = 0;
      v18[1] = v12;
      *((_DWORD *)v18 + 4) = v12;
      *((_DWORD *)v18 + 5) = v13;
      float v19 = (float)(unint64_t)(v9 + 1);
      if (!v10 || (float)(v31 * (float)v10) < v19)
      {
        BOOL v20 = (v10 & (v10 - 1)) != 0;
        if (v10 < 3) {
          BOOL v20 = 1;
        }
        unint64_t v21 = v20 | (2 * v10);
        unint64_t v22 = vcvtps_u32_f32(v19 / v31);
        if (v21 <= v22) {
          size_t v23 = v22;
        }
        else {
          size_t v23 = v21;
        }
        std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__rehash<true>((uint64_t)&v29, v23);
        unint64_t v10 = *((void *)&v29 + 1);
        if ((*((void *)&v29 + 1) & (*((void *)&v29 + 1) - 1)) != 0)
        {
          if (*((void *)&v29 + 1) <= v12) {
            unint64_t v3 = v12 % *((void *)&v29 + 1);
          }
          else {
            unint64_t v3 = v12;
          }
        }
        else
        {
          unint64_t v3 = (DWORD2(v29) - 1) & v12;
        }
      }
      uint64_t v24 = v29;
      int v25 = *(void **)(v29 + 8 * v3);
      if (v25)
      {
        *unsigned int v18 = *v25;
      }
      else
      {
        *unsigned int v18 = v30;
        *(void *)&long long v30 = v18;
        *(void *)(v24 + 8 * v3) = &v30;
        if (!*v18)
        {
LABEL_46:
          uint64_t v9 = ++*((void *)&v30 + 1);
          BOOL v8 = (_DWORD *)a2[9];
          goto LABEL_47;
        }
        unint64_t v26 = *(void *)(*v18 + 8);
        if ((v10 & (v10 - 1)) != 0)
        {
          if (v26 >= v10) {
            v26 %= v10;
          }
        }
        else
        {
          v26 &= v10 - 1;
        }
        int v25 = (void *)(v29 + 8 * v26);
      }
      *int v25 = v18;
      goto LABEL_46;
    }
LABEL_47:
    ++v11;
  }
  while (v11 < v8[2]);
  unsigned __int8 v27 = (uint64_t **)v30;
  for (j = 0; v27; unsigned __int8 v27 = (uint64_t **)*v27)
  {
    ((void (**)(void, void, void, char *))v7)[2](v7, *((unsigned int *)v27 + 4), *((unsigned int *)v27 + 5), &j);
    if (j) {
      break;
    }
  }
LABEL_51:
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)&v29);
LABEL_52:
}

void sub_1A7DB58B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  operator delete(v12);
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)&a11);

  _Unwind_Resume(a1);
}

void _CSArrayEnumerateAllValues(uint64_t a1, unsigned int a2, void *a3)
{
  id v5 = a3;
  if (performConstantAssertions)
  {
    uint64_t v6 = *(void *)(a1 + 344);
    if (v6) {
      (*(void (**)(void))(**(void **)(v6 + 8) + 8))(*(void *)(v6 + 8));
    }
  }
  CSStore2::Array::Get((CSStore2::Array *)&v12, (CSStore2::Store *)(a1 + 8), a2);
  if (v14)
  {
    long long v9 = v12;
    uint64_t v10 = v13;
    char v11 = 1;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = ___CSArrayEnumerateAllValues_block_invoke;
    long long v7[3] = &unk_1E5D2AC58;
    id v8 = v5;
    CSStore2::Array::enumerateValues((uint64_t)&v9, v7);
  }
}

void sub_1A7DB59F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void CSStore2::Array::Get(CSStore2::Array *this, CSStore2::Store *a2, unsigned int a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)this = 0;
  *((unsigned char *)this + 24) = 0;
  Table = (const CSStore2::Table *)*((void *)a2 + 33);
  if (Table
    || (Table = (const CSStore2::Table *)CSStore2::Store::getTable((atomic_ullong *)a2, &cfstr_Array.isa)) != 0)
  {
    Unit = (unsigned int *)CSStore2::Store::getUnit((CSStore2 **)a2, Table, a3);
    if (Unit)
    {
      *((unsigned char *)this + 24) = 1;
      *(void *)this = a2;
      *((void *)this + 1) = Unit + 2;
      *((void *)this + 2) = 0;
      *((_DWORD *)this + 5) = a3;
      uint64_t v8 = Unit[1];
      if (v8 <= 3)
      {
        uint64_t v10 = CSStore2::GetLog((CSStore2 *)Unit);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          int v13 = 134217984;
          uint64_t v14 = v8;
          _os_log_error_impl(&dword_1A7DB2000, v10, OS_LOG_TYPE_ERROR, "Underflow getting array capacity (%llu)", (uint8_t *)&v13, 0xCu);
        }

        long long v12 = CSStore2::GetLog(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v13) = 0;
          _os_log_error_impl(&dword_1A7DB2000, v12, OS_LOG_TYPE_ERROR, "Size of array unit was invalid for a CSArray; discarding",
            (uint8_t *)&v13,
            2u);
        }

        *(unsigned char *)this = 0;
        *((unsigned char *)this + 24) = 0;
      }
      else
      {
        char v9 = 1;
        if ((Unit[2] & 0x20000000) == 0) {
          char v9 = 2;
        }
        *((_DWORD *)this + 4) = (unint64_t)(v8 - 4) >> v9;
      }
    }
  }
}

void CSStore2::Array::enumerateValues(uint64_t a1, void *a2)
{
  unint64_t v3 = a2;
  uint64_t v4 = *(_DWORD **)(a1 + 8);
  unsigned int v5 = *v4 & 0x1FFFFFFF;
  unsigned int v6 = *(_DWORD *)(a1 + 16);
  if (v5 >= v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = v5;
  }
  if (v7 > 0xFF)
  {
    CSStore2::Array::getAllValues(&v21, a1);
    std::vector<unsigned int>::pointer begin = v21.__begin_;
    LOBYTE(v21.__begin_) = 0;
    std::vector<unsigned int>::pointer v13 = begin;
  }
  else
  {
    if ((*v4 & 0x20000000) != 0)
    {
      if (!v7) {
        goto LABEL_23;
      }
      uint64_t v14 = (unsigned __int16 *)(v4 + 1);
      uint64_t v15 = v22;
      int v16 = v7;
      do
      {
        int v17 = *v14++;
        *v15++ = v17;
        --v16;
      }
      while (v16);
    }
    else
    {
      if (!v7) {
        goto LABEL_23;
      }
      uint64_t v8 = v4 + 1;
      char v9 = v22;
      int v10 = v7;
      do
      {
        int v11 = *v8++;
        *v9++ = v11;
        --v10;
      }
      while (v10);
    }
    LOBYTE(v21.__begin_) = 0;
    std::vector<unsigned int>::pointer v13 = 0;
    std::vector<unsigned int>::pointer begin = (std::vector<unsigned int>::pointer)v22;
  }
  uint64_t v18 = 0;
  uint64_t v19 = v7 - 1;
  do
  {
    v3[2](v3, v18, begin, &v21);
    if (LOBYTE(v21.__begin_)) {
      BOOL v20 = 1;
    }
    else {
      BOOL v20 = v19 == v18;
    }
    ++v18;
    ++begin;
  }
  while (!v20);
  if (v13) {
    operator delete(v13);
  }
LABEL_23:
}

void sub_1A7DB5CC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double ___ZN8CSStore26String4FindERNS_5StoreEPKcj_block_invoke(uint64_t a1, unsigned int *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = *(const void **)(a1 + 48);
  size_t v8 = *(unsigned int *)(a1 + 56);
  CSStore2::String::Get(&v15, *(CSStore2::Store **)(a1 + 40), *a2);
  if (v17)
  {
    double result = *(double *)&v16;
    long long v13 = v16;
    char v14 = 1;
    if (DWORD2(v16) == v8)
    {
      if (BYTE12(v15)) {
        int v10 = &v13;
      }
      else {
        int v10 = (long long *)v13;
      }
      if (!memcmp(v10, v7, v8))
      {
        CSStore2::String::Get(&v15, *(CSStore2::Store **)(a1 + 40), *a2);
        uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
        double result = *(double *)&v15;
        long long v12 = v16;
        *(_OWORD *)(v11 + 48) = v15;
        *(_OWORD *)(v11 + 64) = v12;
        *(unsigned char *)(v11 + 80) = v17;
        *a4 = 1;
      }
    }
  }
  return result;
}

id CSStore2::String::getNSStringNoCopy(CSStore2::String *this)
{
  id v2 = [NSString alloc];
  unint64_t v3 = (void *)((char *)this + 16);
  if (!*((unsigned char *)this + 12)) {
    unint64_t v3 = (void *)*v3;
  }
  uint64_t v4 = (void *)[v2 initWithBytesNoCopy:v3 length:*((unsigned int *)this + 6) encoding:4 freeWhenDone:0];

  return v4;
}

uint64_t _CSStringCopyCFString(uint64_t a1, unsigned int a2)
{
  if (performConstantAssertions)
  {
    uint64_t v4 = *(void *)(a1 + 344);
    if (v4) {
      (*(void (**)(void))(**(void **)(v4 + 8) + 8))(*(void *)(v4 + 8));
    }
  }
  CSStore2::String::Get(v10, (CSStore2::Store *)(a1 + 8), a2);
  if (v11)
  {
    v8[0] = v10[0];
    v8[1] = v10[1];
    char v9 = 1;
    unsigned int v5 = CSStore2::String::getNSStringNoCopy((CSStore2::String *)v8);
    uint64_t v6 = [v5 copy];
  }
  else
  {
    uint64_t v6 = 0;
    LOBYTE(v8[0]) = 0;
    char v9 = 0;
  }
  return v6;
}

void sub_1A7DB5F34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

_DWORD *CSStore2::String::Get(_DWORD *this, CSStore2::Store *a2, unsigned int a3)
{
  unsigned int v5 = this;
  LOBYTE(v18) = 0;
  char v20 = 0;
  if (a3)
  {
    uint64_t v6 = 0;
    *(void *)&long long v18 = 0;
    *(void *)&long long v19 = 0;
    DWORD2(v19) = 0;
    char v20 = 1;
    DWORD2(v18) = a3;
    BYTE12(v18) = 1;
    unsigned int v7 = a3 >> 2;
    do
    {
      uint64_t v8 = v7 & 0x3F;
      if ((v7 & 0x3F) == 0) {
        break;
      }
      v7 >>= 6;
      *((unsigned char *)&v19 + v6++) = CSStore2::String::kPackedAlphabet[v8];
    }
    while (v6 != 5);
    this = (_DWORD *)strlen((const char *)&v19);
    if (this >= 2uLL)
    {
      char v9 = (char *)&v18 + this + 15;
      int v10 = (char *)&v19 + 1;
      do
      {
        char v11 = *(v10 - 1);
        *(v10 - 1) = *v9;
        *v9-- = v11;
      }
      while (v10++ < v9);
    }
    DWORD2(v19) = this;
  }
  long long v13 = v19;
  *(_OWORD *)unsigned int v5 = v18;
  *((_OWORD *)v5 + 1) = v13;
  char v14 = v20;
  *((unsigned char *)v5 + 32) = v20;
  if (!v14)
  {
    long long v15 = (const CSStore2::Table *)*((void *)a2 + 34);
    if (v15
      || (this = (_DWORD *)CSStore2::Store::getTable((atomic_ullong *)a2, &cfstr_String_0.isa),
          (long long v15 = (const CSStore2::Table *)this) != 0))
    {
      this = CSStore2::Store::getUnit((CSStore2 **)a2, v15, a3);
      if (this)
      {
        int v16 = this[1];
        int v17 = 4 * *this;
        *(void *)unsigned int v5 = a2;
        v5[2] = v17;
        *((unsigned char *)v5 + 12) = 0;
        *((void *)v5 + 2) = this + 2;
        v5[6] = v16;
        *((unsigned char *)v5 + 32) = 1;
      }
    }
  }
  return this;
}

char *CSStoreGetUnit(uint64_t a1, unsigned int a2, unsigned int a3, _DWORD *a4)
{
  if (!a3) {
    return 0;
  }
  if (performConstantAssertions)
  {
    uint64_t v8 = *(void *)(a1 + 344);
    if (v8) {
      (*(void (**)(void))(**(void **)(v8 + 8) + 8))(*(void *)(v8 + 8));
    }
  }
  char v9 = (CSStore2::Store *)(a1 + 8);
  double result = CSStore2::Store::getTable(v9, a2);
  if (result)
  {
    double result = CSStore2::Store::getUnit((CSStore2 **)v9, (const CSStore2::Table *)result, a3);
    if (result)
    {
      char v11 = result;
      result += 8;
      if (a4) {
        *a4 = *((_DWORD *)v11 + 1);
      }
    }
  }
  return result;
}

char *CSStore2::Store::getUnit(CSStore2 **this, const CSStore2::Table *a2, unsigned int a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  uint64_t v4 = *((unsigned int *)a2 + 19);
  if (v4 == -1) {
    return 0;
  }
  uint64_t v6 = *this;
  uint64_t v7 = *((void *)v6 + 1);
  if (!v7 || *(_DWORD *)(v7 + 12) <= v4) {
    return 0;
  }
  int v10 = (CSStore2 *)CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::Find(v6, (int *)(v7 + v4), a3);
  if (!v10) {
    return 0;
  }
  uint64_t v11 = *(unsigned int *)v10;
  if (v11 == -1) {
    return 0;
  }
  unint64_t v12 = *((void *)*this + 1);
  unsigned int v13 = *(_DWORD *)(v12 + 12);
  if (!v12 || v13 <= v11) {
    return 0;
  }
  long long v15 = (char *)(v12 + v11);
  BOOL v16 = (int)v11 + 1 > v13 || v11 == -1;
  if (v12 + v11 < v12 || v16) {
    LODWORD(v11) = -1;
  }
  if (v11 >= 0xFFFFFFF8 || (int)v11 + 8 > v13)
  {
    size_t v23 = CSStore2::GetLog(v10);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      uint64_t v27 = (4 * *(_DWORD *)a2);
      int v28 = *this;
      if (*this) {
        int v28 = (CSStore2 *)*((void *)v28 + 1);
      }
      int v34 = 134218496;
      uint64_t v35 = v27;
      __int16 v36 = 2048;
      uint64_t v37 = a3;
      __int16 v38 = 2048;
      unint64_t v39 = v15 - (char *)v28;
      unint64_t v26 = "*** CSStore corruption detected (1). %llx %llx %llx";
      long long v29 = v23;
      uint32_t v30 = 32;
      goto LABEL_44;
    }
    goto LABEL_39;
  }
  int v17 = *((_DWORD *)v15 + 1) + 8;
  BOOL v18 = __CFADD__(v11, v17);
  unsigned int v19 = v11 + v17;
  if (v18 || v19 > v13)
  {
    size_t v23 = CSStore2::GetLog(v10);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      uint64_t v32 = (4 * *(_DWORD *)a2);
      unint64_t v33 = *(unsigned int *)v15;
      int v34 = 134218752;
      uint64_t v35 = v32;
      __int16 v36 = 2048;
      uint64_t v37 = a3;
      __int16 v38 = 2048;
      unint64_t v39 = (4 * v33);
      __int16 v40 = 2048;
      unint64_t v41 = v33 >> 30;
      unint64_t v26 = "*** CSStore corruption detected (2). %llx %llx %llx %llx";
      goto LABEL_43;
    }
LABEL_39:

    return 0;
  }
  BOOL v20 = (*(_DWORD *)v15 & 0xC0000000) != 0x40000000;
  if ((const CSStore2::Table *)(v12 + 20) == a2)
  {
    BOOL v20 = 1;
    BOOL v21 = (*(_DWORD *)v15 & 0xC0000000) == 0x40000000;
  }
  else
  {
    BOOL v21 = 1;
  }
  BOOL v22 = a3 != 4 * *(_DWORD *)v15 || !v20;
  if (v22 || !v21)
  {
    size_t v23 = CSStore2::GetLog(v10);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      uint64_t v24 = (4 * *(_DWORD *)a2);
      unint64_t v25 = *(unsigned int *)v15;
      int v34 = 134218752;
      uint64_t v35 = v24;
      __int16 v36 = 2048;
      uint64_t v37 = a3;
      __int16 v38 = 2048;
      unint64_t v39 = (4 * v25);
      __int16 v40 = 2048;
      unint64_t v41 = v25 >> 30;
      unint64_t v26 = "*** CSStore corruption detected (3). %llx %llx %llx %llx";
LABEL_43:
      long long v29 = v23;
      uint32_t v30 = 42;
LABEL_44:
      _os_log_fault_impl(&dword_1A7DB2000, v29, OS_LOG_TYPE_FAULT, v26, (uint8_t *)&v34, v30);
      goto LABEL_39;
    }
    goto LABEL_39;
  }
  return v15;
}

_DWORD *CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::Find(CSStore2 *a1, int *a2, unsigned int a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (*a2) {
    BOOL v3 = a3 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3) {
    return 0;
  }
  if (*a2 > 0x2000)
  {
    uint64_t v11 = CSStore2::GetLog(a1);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v19 = *a2;
      v20[0] = 67109376;
      v20[1] = v19;
      __int16 v21 = 1024;
      int v22 = 0x2000;
      _os_log_error_impl(&dword_1A7DB2000, v11, OS_LOG_TYPE_ERROR, "Impossible bucket count %u when %u is the maximum.", (uint8_t *)v20, 0xEu);
    }

    return 0;
  }
  uint64_t v5 = (unsigned __int16)(a3 >> 2) % (unsigned __int16)*a2;
  uint64_t v6 = a2[2 * v5 + 1];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = &a2[2 * v5];
  if (v6 == 1)
  {
    uint64_t v8 = v7[2];
    if (v8 != -1)
    {
      uint64_t v9 = 0;
      uint64_t v10 = *((void *)a1 + 1);
      if (v10)
      {
        if (*(_DWORD *)(v10 + 12) > v8)
        {
          uint64_t v9 = v10 + v8 + 4;
          if (*(_DWORD *)(v10 + v8) != a3) {
            return 0;
          }
        }
      }
      return (_DWORD *)v9;
    }
    return 0;
  }
  uint64_t v13 = v7[2];
  if (v13 == -1)
  {
    BOOL v16 = 0;
  }
  else
  {
    uint64_t v14 = *((void *)a1 + 1);
    BOOL v15 = *(_DWORD *)(v14 + 12) > v13;
    BOOL v16 = (_DWORD *)(v14 + v13);
    if (!v15) {
      BOOL v16 = 0;
    }
  }
  uint64_t v17 = 8 * v6;
  BOOL v18 = &v16[2 * v6];
  while (*v16 != a3)
  {
    v16 += 2;
    v17 -= 8;
    if (!v17)
    {
      BOOL v16 = v18;
      break;
    }
  }
  if (v16 == v18) {
    return 0;
  }
  else {
    return v16 + 1;
  }
}

char *CSStore2::Store::getTable(CSStore2::Store *this, unsigned int a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a2 != -37516)
  {
    if (a2 > 0xFF)
    {
      uint64_t v8 = CSStore2::GetLog(this);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        int v11 = 134218240;
        uint64_t v12 = a2;
        __int16 v13 = 2048;
        uint64_t v14 = a2 >> 2;
        _os_log_debug_impl(&dword_1A7DB2000, v8, OS_LOG_TYPE_DEBUG, "Table %llu (shifted %llu) cannot fit in the in-memory table offset list. Consider lengthening the tableOffsets field.", (uint8_t *)&v11, 0x16u);
      }
    }
    else
    {
      uint64_t v4 = *((unsigned int *)this + (a2 >> 2) + 2);
      if (v4 != -1)
      {
        uint64_t v5 = *(void *)(*(void *)this + 8);
        if (v5 && *(_DWORD *)(v5 + 12) > v4) {
          return (char *)(v5 + v4);
        }
      }
    }
  }
  uint64_t v9 = *(void *)this;
  if (*(void *)this) {
    uint64_t v9 = *(void *)(v9 + 8);
  }
  uint64_t v7 = (const CSStore2::Table *)(v9 + 20);
  if (a2 != -37516) {
    return CSStore2::Store::getUnit((CSStore2 **)this, v7, a2);
  }
  return (char *)v7;
}

void std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__rehash<true>(uint64_t a1, size_t __n)
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
  if (prime <= *(void *)&v4)
  {
    if (prime >= *(void *)&v4) {
      return;
    }
    unint64_t v11 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v12 = (uint8x8_t)vcnt_s8(v4), v12.i16[0] = vaddlv_u8(v12), v12.u32[0] > 1uLL))
    {
      unint64_t v11 = std::__next_prime(v11);
    }
    else
    {
      uint64_t v13 = 1 << -(char)__clz(v11 - 1);
      if (v11 >= 2) {
        unint64_t v11 = v13;
      }
    }
    if (prime <= v11) {
      size_t prime = v11;
    }
    if (prime >= *(void *)&v4) {
      return;
    }
    if (!prime)
    {
      BOOL v16 = *(void **)a1;
      *(void *)a1 = 0;
      if (v16) {
        operator delete(v16);
      }
      *(void *)(a1 + 8) = 0;
      return;
    }
  }
  if (prime >> 61) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  uint64_t v5 = operator new(8 * prime);
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = v5;
  if (v6) {
    operator delete(v6);
  }
  uint64_t v7 = 0;
  *(void *)(a1 + 8) = prime;
  do
    *(void *)(*(void *)a1 + 8 * v7++) = 0;
  while (prime != v7);
  uint64_t v8 = *(void **)(a1 + 16);
  if (v8)
  {
    size_t v9 = v8[1];
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)prime);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      if (v9 >= prime) {
        v9 %= prime;
      }
    }
    else
    {
      v9 &= prime - 1;
    }
    *(void *)(*(void *)a1 + 8 * v9) = a1 + 16;
    uint64_t v14 = (void *)*v8;
    if (*v8)
    {
      do
      {
        size_t v15 = v14[1];
        if (v10.u32[0] > 1uLL)
        {
          if (v15 >= prime) {
            v15 %= prime;
          }
        }
        else
        {
          v15 &= prime - 1;
        }
        if (v15 != v9)
        {
          if (!*(void *)(*(void *)a1 + 8 * v15))
          {
            *(void *)(*(void *)a1 + 8 * v15) = v8;
            goto LABEL_31;
          }
          void *v8 = *v14;
          void *v14 = **(void **)(*(void *)a1 + 8 * v15);
          **(void **)(*(void *)a1 + 8 * v15) = v14;
          uint64_t v14 = v8;
        }
        size_t v15 = v9;
LABEL_31:
        uint64_t v8 = v14;
        uint64_t v14 = (void *)*v14;
        size_t v9 = v15;
      }
      while (v14);
    }
  }
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table(uint64_t a1)
{
  id v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      BOOL v3 = (void *)*v2;
      operator delete(v2);
      id v2 = v3;
    }
    while (v3);
  }
  int8x8_t v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

uint64_t _CSStoreGetXPCClass()
{
  return objc_opt_class();
}

uint64_t _CSStoreIsMutable(void *a1)
{
  return [a1 isReadOnly] ^ 1;
}

uint64_t _CSStoreSetMutable(void *a1, const char *a2)
{
  return [a1 setReadOnly:a2 == 0];
}

uint64_t _CSStoreSetUnitIdentifierExhaustionHandler(void *a1, const char *a2)
{
  return [a1 setUnitIdentifierExhaustionHandler:a2];
}

uint64_t _CSStoreGetCatalogTable(uint64_t a1)
{
  if (a1) {
    return 4294929780;
  }
  else {
    return 0;
  }
}

id _CSStoreCreateWithXPCRepresentation(void *a1, void *a2)
{
  int8x8_t v4 = (void *)MEMORY[0x1AD0DB160]();
  id v9 = 0;
  CSStore2::Store::CreateWithXPCObject(&v10, a1, &v9);
  id v5 = v9;
  uint64_t v6 = v10;
  if (v10)
  {
    id v7 = [[_CSStore alloc] initByMovingStore:v10];

    MEMORY[0x1AD0DACB0](v6, 0x10A0C40D11E5446);
    if (!a2) {
      goto LABEL_7;
    }
  }
  else
  {
    id v7 = 0;
    if (!a2) {
      goto LABEL_7;
    }
  }
  if (!v7) {
    *a2 = v5;
  }
LABEL_7:

  return v7;
}

void sub_1A7DB6BCC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<CSStore2::Store>::reset[abi:nn180100]((id **)va);

  _Unwind_Resume(a1);
}

void sub_1A7DB74D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29)
{
  std::default_delete<CSStore2::Store>::operator()[abi:nn180100](v33);
  _Unwind_Resume(a1);
}

void sub_1A7DB78EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id a21)
{
  _Block_object_dispose(&a16, 8);
  std::default_delete<CSStore2::Store>::operator()[abi:nn180100](v21);
  _Unwind_Resume(a1);
}

void sub_1A7DB7BDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7DB7D50(_Unwind_Exception *exception_object)
{
}

void sub_1A7DB7F44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11)
{
  uint64_t v13 = v12;

  _Unwind_Resume(a1);
}

id CSStore2::Store::encodeAsXPCObject(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (a1) {
    int v3 = *(_DWORD *)(a1 + 16);
  }
  else {
    int v3 = 0;
  }
  unsigned int v4 = *MEMORY[0x1E4F14B00];
  unsigned int v5 = v3 + *MEMORY[0x1E4F14B00] - 1;
  if (v5 == v5 % *MEMORY[0x1E4F14B00]) {
    size_t v6 = v4;
  }
  else {
    size_t v6 = v5 / v4 * v4;
  }
  if (a1) {
    a1 = *(void *)(a1 + 8);
  }
  Copy = (CSStore2 *)CSStore2::VM::AllocateCopy((CSStore2::VM *)a1, (const void *)v6, (CSStore2::VM *)v6);
  uint64_t v8 = CSStore2::GetLog(Copy);
  id v9 = v8;
  if (Copy)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      size_t v30 = v6;
      _os_log_debug_impl(&dword_1A7DB2000, v9, OS_LOG_TYPE_DEBUG, "Creating dispatch_data for XPC coder with length %llu", buf, 0xCu);
    }

    if (CSStore2::Store::_GetDispatchDataDeallocatorQueue(void)::once != -1) {
      dispatch_once(&CSStore2::Store::_GetDispatchDataDeallocatorQueue(void)::once, &__block_literal_global_86);
    }
    uint8x8_t v10 = (id)CSStore2::Store::_GetDispatchDataDeallocatorQueue(void)::result;
    unint64_t v11 = dispatch_data_create(Copy, v6, v10, (dispatch_block_t)*MEMORY[0x1E4F14408]);

    if (v11)
    {
      xpc_object_t v13 = xpc_data_create_with_dispatch_data(v11);
      if (v13)
      {

        id v14 = 0;
        goto LABEL_30;
      }
      BOOL v20 = CSStore2::GetLog(0);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A7DB2000, v20, OS_LOG_TYPE_ERROR, "Could not create XPC data from dispatch data while encoding store.", buf, 2u);
      }

      __int16 v21 = (void *)MEMORY[0x1E4F28C58];
      v27[0] = *MEMORY[0x1E4F28228];
      v27[1] = @"Line";
      v28[0] = @"kCSStoreAllocFailedErr";
      v28[1] = &unk_1EFE43590;
      BOOL v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
      uint64_t v19 = [v21 errorWithDomain:*MEMORY[0x1E4F28760] code:-9493 userInfo:v18];
    }
    else
    {
      BOOL v16 = CSStore2::GetLog(v12);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A7DB2000, v16, OS_LOG_TYPE_ERROR, "could not create dispatch data from store mapping while encoding store.", buf, 2u);
      }

      CSStore2::VM::Deallocate(Copy, (void *)v6);
      uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
      v25[0] = *MEMORY[0x1E4F28228];
      v25[1] = @"Line";
      v26[0] = @"kCSStoreAllocFailedErr";
      v26[1] = &unk_1EFE435A8;
      BOOL v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
      uint64_t v19 = [v17 errorWithDomain:*MEMORY[0x1E4F28760] code:-9493 userInfo:v18];
    }
    id v14 = (id)v19;
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A7DB2000, v9, OS_LOG_TYPE_ERROR, "could not create a copy of the store mapping while encoding store.", buf, 2u);
    }

    size_t v15 = (void *)MEMORY[0x1E4F28C58];
    v23[0] = *MEMORY[0x1E4F28228];
    v23[1] = @"Line";
    v24[0] = @"kCSStoreAllocFailedErr";
    v24[1] = &unk_1EFE435C0;
    unint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
    id v14 = [v15 errorWithDomain:*MEMORY[0x1E4F28760] code:-9493 userInfo:v11];
  }

  if (a2)
  {
    id v14 = v14;
    xpc_object_t v13 = 0;
    *a2 = v14;
  }
  else
  {
    xpc_object_t v13 = 0;
  }
LABEL_30:

  return v13;
}

void sub_1A7DB83A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void CSStore2::Store::CreateWithXPCObject(void *a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  size_t v6 = v5;
  *a1 = 0;
  if (!v5 || MEMORY[0x1AD0DB620](v5) != MEMORY[0x1E4F14580])
  {
    id v7 = (void *)MEMORY[0x1E4F28C58];
    v19[0] = *MEMORY[0x1E4F28228];
    v19[1] = @"Line";
    v20[0] = @"paramErr";
    v20[1] = &unk_1EFE43578;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
    id v9 = [v7 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v8];

    goto LABEL_4;
  }
  size_t length = xpc_data_get_length(v6);
  bytes_ptr = (CSStore2 *)xpc_data_get_bytes_ptr(v6);
  xpc_object_t v13 = (Bytef *)bytes_ptr;
  if (!bytes_ptr || HIDWORD(length))
  {
    BOOL v16 = (void *)MEMORY[0x1E4F28C58];
    v21[0] = *MEMORY[0x1E4F28228];
    v21[1] = @"Line";
    v22[0] = @"kCSStoreBadDataErr";
    v22[1] = &unk_1EFE43560;
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
    id v9 = [v16 errorWithDomain:*MEMORY[0x1E4F28760] code:-9496 userInfo:v17];

LABEL_4:
    BOOL v10 = 0;
    if (!a3) {
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  id v14 = CSStore2::GetLog(bytes_ptr);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = length;
    _os_log_debug_impl(&dword_1A7DB2000, v14, OS_LOG_TYPE_DEBUG, "Creating CSStore from XPC coder with length %llu", buf, 0xCu);
  }

  id v18 = 0;
  CSStore2::Store::CreateWithBytes(buf, v13, (void *)length, &v18);
  id v9 = v18;
  uint64_t v15 = *(void *)buf;
  *a1 = *(void *)buf;
  BOOL v10 = v15 != 0;
  if (a3)
  {
LABEL_5:
    if (!v10) {
      *a3 = v9;
    }
  }
LABEL_7:
}

void sub_1A7DB863C(_Unwind_Exception *a1)
{
  void *v2 = 0;
  _Unwind_Resume(a1);
}

void CSStore2::Store::CreateWithBytes(void *a1, Bytef *a2, void *a3, void *a4)
{
  v14[2] = *MEMORY[0x1E4F143B8];
  *a1 = 0;
  if (a2 && a3)
  {
    id v11 = 0;
    CSStore2::Store::_Create((CSStore2 *)&v12, a2, a3, 1, 0, &v11);
    id v6 = v11;
    uint64_t v7 = v12;
    *a1 = v12;
    BOOL v8 = v7 != 0;
    if (!a4) {
      goto LABEL_8;
    }
  }
  else
  {
    id v9 = (void *)MEMORY[0x1E4F28C58];
    v13[0] = *MEMORY[0x1E4F28228];
    v13[1] = @"Line";
    v14[0] = @"paramErr";
    v14[1] = &unk_1EFE43518;
    BOOL v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
    id v6 = [v9 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v10];

    BOOL v8 = 0;
    if (!a4) {
      goto LABEL_8;
    }
  }
  if (!v8) {
    *a4 = v6;
  }
LABEL_8:
}

void sub_1A7DB87BC(_Unwind_Exception *a1)
{
  *dispatch_queue_t v1 = 0;
  _Unwind_Resume(a1);
}

void CSStore2::Store::_Create(CSStore2 *a1, Bytef *a2, void *a3, int a4, uint64_t a5, void *a6)
{
  id v9 = a1;
  v103[2] = *MEMORY[0x1E4F143B8];
  *(void *)a1 = 0;
  if (a4)
  {
    Copy = (CSStore2::VM *)CSStore2::VM::AllocateCopy((CSStore2::VM *)a2, a3, (CSStore2::VM *)a3);
    if (!Copy)
    {
      uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
      v102[0] = *MEMORY[0x1E4F28228];
      v102[1] = @"Line";
      v103[0] = @"kCSStoreAllocFailedErr";
      v103[1] = &unk_1EFE43488;
      BOOL v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v103 forKeys:v102 count:2];
      id v11 = [v17 errorWithDomain:*MEMORY[0x1E4F28760] code:-9493 userInfo:v16];
      goto LABEL_106;
    }
    id v86 = 0;
    CSStore2::Store::_Create(buf, Copy, a3, 0, a5, &v86);
    id v11 = v86;
    uint64_t v12 = *(void *)buf;
    *(void *)id v9 = *(void *)buf;
    if (!v12)
    {
      CSStore2::VM::Deallocate(Copy, a3);
      uint64_t v13 = 0;
      goto LABEL_107;
    }
    goto LABEL_110;
  }
  if (!a2)
  {
LABEL_30:
    int v28 = 2;
    goto LABEL_31;
  }
  if (a3 < 0x64)
  {
LABEL_7:
    id v14 = (void *)MEMORY[0x1E4F28C58];
    v91[0] = *MEMORY[0x1E4F28228];
    v91[1] = @"Line";
    v92[0] = @"kCSStoreBadDataErr";
    v92[1] = &unk_1EFE434D0;
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v92 forKeys:v91 count:2];
    id v11 = [v14 errorWithDomain:*MEMORY[0x1E4F28760] code:-9496 userInfo:v15];
    BOOL v16 = 0;
    id v9 = a1;
    goto LABEL_105;
  }
  int v18 = *(_DWORD *)a2;
  if (*(_DWORD *)a2 == -788868902 || v18 == -623838512)
  {
    BOOL v20 = CSStore2::GetLog(a1);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7DB2000, v20, OS_LOG_TYPE_DEFAULT, "Encountered CSStore1 file, can't read it.", buf, 2u);
    }

    BOOL v16 = 0;
    goto LABEL_17;
  }
  if (v18 != 1819501666) {
    goto LABEL_7;
  }
  int v28 = a2[4];
  if (v28 == 2)
  {
    unsigned int v29 = *((_DWORD *)a2 + 3);
    if (*((_DWORD *)a2 + 4) > v29 || v29 > a3) {
      goto LABEL_7;
    }
    size_t v30 = CSStore2::GetLog(a1);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v75 = *((unsigned int *)a2 + 3);
      uint64_t v74 = *((unsigned int *)a2 + 4);
      *(_DWORD *)buf = 134218496;
      *(void *)&uint8_t buf[4] = a3;
      __int16 v98 = 2048;
      uint64_t v99 = v74;
      __int16 v100 = 2048;
      uint64_t v101 = v75;
      _os_log_debug_impl(&dword_1A7DB2000, v30, OS_LOG_TYPE_DEBUG, "Checked CSStore data with lengths %llu/%llu/%llu", buf, 0x20u);
    }

    goto LABEL_30;
  }
LABEL_31:
  if (!a5) {
    goto LABEL_86;
  }
  if (a3 <= 0x63)
  {
    v76 = [MEMORY[0x1E4F28B00] currentHandler];
    v77 = objc_msgSend(NSString, "stringWithUTF8String:", "static std::unique_ptr<Store> CSStore2::Store::_Create(void *, _CSStoreSize, BOOL, BOOL, NSError *__autoreleasing *)");
    [v76 handleFailureInFunction:v77 file:@"CSStore+Store.mm" lineNumber:126 description:@"Somehow thought CSStore header was OK when it's too short."];

    id v9 = a1;
  }
  unsigned int v31 = *((_DWORD *)a2 + 3);
  unsigned int v79 = *((_DWORD *)a2 + 4);
  unint64_t v32 = *((unsigned __int16 *)a2 + 3);
  if (v32 > 2)
  {
    unint64_t v82 = *((unsigned __int16 *)a2 + 3);
    unsigned int v81 = v28;
    unsigned int v78 = *((_DWORD *)a2 + 3);
    uLong v33 = crc32(0x6E797267uLL, a2 + 100, v31 - 100);
    if ((unsigned __int16)v33 >= 3uLL) {
      unsigned __int16 v34 = v33;
    }
    else {
      unsigned __int16 v34 = v33 | 0xE000;
    }
    uint64_t v35 = CSStore2::GetLog((CSStore2 *)v33);
    __int16 v36 = v35;
    if (v82 != v34)
    {
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)&uint8_t buf[4] = v82;
        __int16 v98 = 2048;
        uint64_t v99 = v34;
        _os_log_error_impl(&dword_1A7DB2000, v36, OS_LOG_TYPE_ERROR, "CSStore checksum expected to be %llx, was %llx.", buf, 0x16u);
      }
      BOOL v16 = 0;
      goto LABEL_101;
    }
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v82;
      _os_log_debug_impl(&dword_1A7DB2000, v36, OS_LOG_TYPE_DEBUG, "CSStore checksum matches: %llx", buf, 0xCu);
    }

LABEL_86:
    operator new();
  }
  NSUInteger v37 = (2 * *MEMORY[0x1E4F14B00]);
  vm_address_t v38 = CSStore2::VM::Allocate((CSStore2::VM *)v37);
  if (!v38)
  {
    v61 = CSStore2::GetLog(0);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A7DB2000, v61, OS_LOG_TYPE_ERROR, "CSStore zero-page check could not allocate memory. Skipping check.", buf, 2u);
    }

    goto LABEL_86;
  }
  unint64_t v82 = v32;
  __s2 = (void *)v38;
  unsigned int v78 = v31;
  unsigned int v81 = v28;
  if (v37 >= a3)
  {
    unint64_t v39 = 0;
    goto LABEL_90;
  }
  unint64_t v39 = 0;
  __int16 v40 = 0;
  v80 = 0;
  int v41 = 0;
  unsigned int v42 = 0;
  unsigned int v43 = v37;
  while ((unint64_t)(v40 - v39) < 0x400)
  {
    unsigned int v44 = v43;
    if (!memcmp(&a2[v42], __s2, v37))
    {
      uint64_t v45 = (v40 - v39) >> 4;
      if (v39 == v40)
      {
        if (v39 >= v80)
        {
          uint64_t v47 = v80 - v39;
          if ((v80 - v39) >> 3 <= (unint64_t)(v45 + 1)) {
            uint64_t v48 = v45 + 1;
          }
          else {
            uint64_t v48 = v47 >> 3;
          }
          if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v49 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v49 = v48;
          }
          char v50 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<NSString *,objc_object *>>>(v49);
          v51 = &v50[16 * v45];
          v80 = &v50[16 * v52];
          *(void *)v51 = v42;
          *((void *)v51 + 1) = v37;
          __int16 v40 = v51 + 16;
          if (v39) {
            operator delete(v39);
          }
          unint64_t v39 = v51;
        }
        else
        {
          *(void *)unint64_t v39 = v42;
          *((void *)v39 + 1) = v37;
          __int16 v40 = v39 + 16;
        }
      }
      else
      {
        NSRange v46 = (NSRange)*((_OWORD *)v40 - 1);
        if (v46.length + v46.location == v42)
        {
          v104.location = v42;
          v104.size_t length = v37;
          id v9 = a1;
          *((NSRange *)v40 - 1) = NSUnionRange(v46, v104);
LABEL_76:
          ++v41;
          goto LABEL_77;
        }
        id v9 = a1;
        if (v40 < v80)
        {
          *(void *)__int16 v40 = v42;
          *((void *)v40 + 1) = v37;
          v40 += 16;
          goto LABEL_76;
        }
        uint64_t v53 = v80 - v39;
        if ((v80 - v39) >> 3 <= (unint64_t)(v45 + 1)) {
          uint64_t v54 = v45 + 1;
        }
        else {
          uint64_t v54 = v53 >> 3;
        }
        if ((unint64_t)v53 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v55 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v55 = v54;
        }
        v56 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<NSString *,objc_object *>>>(v55);
        v57 = &v56[16 * v45];
        v80 = &v56[16 * v58];
        *(void *)v57 = v42;
        *((void *)v57 + 1) = v37;
        v59 = v57 + 16;
        do
        {
          *((_OWORD *)v57 - 1) = *((_OWORD *)v40 - 1);
          v57 -= 16;
          v40 -= 16;
        }
        while (v40 != v39);
        if (v39) {
          operator delete(v39);
        }
        unint64_t v39 = v57;
        __int16 v40 = v59;
      }
      id v9 = a1;
      goto LABEL_76;
    }
    id v9 = a1;
LABEL_77:
    unsigned int v43 = v44 + v37;
    unsigned int v42 = v44;
    if (v44 + v37 >= a3) {
      goto LABEL_89;
    }
  }
  id v9 = a1;
LABEL_89:
  if (v41 >= 8)
  {
    v64 = [MEMORY[0x1E4F1CA48] array];
    id v65 = objc_alloc_init(MEMORY[0x1E4F28B68]);
    if (v39 != v40)
    {
      v66 = v39;
      do
      {
        v67 = [v65 stringFromByteCount:*((void *)v66 + 1)];
        v68 = [NSString stringWithFormat:@"0x%llX-0x%llX (%@)", *(void *)v66, *(void *)v66 + *((void *)v66 + 1) - 1, v67];
        [v64 addObject:v68];

        v66 += 16;
      }
      while (v66 != v40);
    }
    id v62 = v64;

    char v63 = 0;
  }
  else
  {
LABEL_90:
    id v62 = 0;
    char v63 = 1;
  }
  CSStore2::VM::Deallocate((CSStore2::VM *)__s2, (void *)*MEMORY[0x1E4F14B00]);
  if (v39) {
    operator delete(v39);
  }
  v69 = (CSStore2 *)v62;
  BOOL v16 = v69;
  if (v63) {
    goto LABEL_86;
  }
  __int16 v36 = CSStore2::GetLog(v69);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v16;
    _os_log_error_impl(&dword_1A7DB2000, v36, OS_LOG_TYPE_ERROR, "CSStore file has zeroed pages and has been corrupted at a low level. Offsets: %{public}@", buf, 0xCu);
  }
  unsigned __int16 v34 = 0;
LABEL_101:

  uint64_t v60 = v81;
  if (v81 == 2)
  {
    v71 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v72 = *MEMORY[0x1E4F28760];
    if (v82 > 2)
    {
      v87[0] = *MEMORY[0x1E4F28228];
      v87[1] = @"Line";
      v88[0] = @"kCSStoreBadChecksumErr";
      v88[1] = &unk_1EFE43500;
      v87[2] = @"Checksum";
      uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedShort:");
      v88[2] = v15;
      v87[3] = @"CalculatedChecksum";
      int v22 = [NSNumber numberWithUnsignedShort:v34];
      v88[3] = v22;
      uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v88 forKeys:v87 count:4];
      id v9 = a1;
      id v11 = [v71 errorWithDomain:v72 code:-9489 userInfo:v24];
      goto LABEL_22;
    }
    v89[0] = *MEMORY[0x1E4F28228];
    v89[1] = @"Line";
    v90[0] = @"kCSStoreBadDataErr";
    v90[1] = &unk_1EFE434E8;
    v90[2] = v16;
    v89[2] = @"ZeroedRanges";
    v89[3] = @"Length";
    uint64_t v15 = [NSNumber numberWithUnsignedInt:a3];
    v90[3] = v15;
    v89[4] = @"UsedLength";
    int v22 = [NSNumber numberWithUnsignedInt:v79];
    v90[4] = v22;
    v89[5] = @"ConsumedLength";
    uint64_t v24 = [NSNumber numberWithUnsignedInt:v78];
    v90[5] = v24;
    v89[6] = @"Checksum";
    uint64_t v27 = [NSNumber numberWithUnsignedShort:v82];
    v90[6] = v27;
    id v9 = a1;
    v73 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v90 forKeys:v89 count:7];
    id v11 = [v71 errorWithDomain:v72 code:-9496 userInfo:v73];

LABEL_21:
LABEL_22:

    goto LABEL_104;
  }
  if (v81 == 1)
  {
LABEL_17:
    if (CSStore2::IsAppleInternal(void)::once != -1) {
      dispatch_once(&CSStore2::IsAppleInternal(void)::once, &__block_literal_global_202);
    }
    if (!CSStore2::IsAppleInternal(void)::result)
    {
      uint64_t v60 = 1;
      goto LABEL_103;
    }
    BundleWithIdentifier = CFBundleGetBundleWithIdentifier(@"com.apple.CSStore");
    uint64_t v15 = (void *)CFBundleCopyLocalizedString(BundleWithIdentifier, @"This file is in the CSStore1 format.", 0, @"Localized");
    int v22 = (void *)CFBundleCopyLocalizedString(BundleWithIdentifier, @"The system can only read CSStore2 files, which first shipped with iOS 9 and OS X El Capitan.", 0, @"Localized");
    uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
    v95[0] = *MEMORY[0x1E4F28228];
    v95[1] = @"Line";
    v96[0] = @"kCSStoreOldVersionErr";
    v96[1] = &unk_1EFE434A0;
    v95[2] = @"Version";
    uint64_t v24 = [NSNumber numberWithUnsignedChar:1];
    uint64_t v25 = *MEMORY[0x1E4F28588];
    v96[2] = v24;
    v96[3] = v15;
    uint64_t v26 = *MEMORY[0x1E4F285A0];
    v95[3] = v25;
    v95[4] = v26;
    v96[4] = v22;
    uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v96 forKeys:v95 count:5];
    id v11 = [v23 errorWithDomain:*MEMORY[0x1E4F28760] code:-9488 userInfo:v27];
    goto LABEL_21;
  }
LABEL_103:
  v70 = (void *)MEMORY[0x1E4F28C58];
  v93[0] = *MEMORY[0x1E4F28228];
  v93[1] = @"Line";
  v94[0] = @"kCSStoreOldVersionErr";
  v94[1] = &unk_1EFE434B8;
  v93[2] = @"Version";
  uint64_t v15 = [NSNumber numberWithUnsignedChar:v60];
  v94[2] = v15;
  int v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v94 forKeys:v93 count:3];
  id v11 = [v70 errorWithDomain:*MEMORY[0x1E4F28760] code:-9488 userInfo:v22];
  id v9 = a1;
LABEL_104:

LABEL_105:
LABEL_106:

  uint64_t v13 = *(void *)v9;
LABEL_107:
  if (a6 && !v13)
  {
    id v11 = v11;
    *a6 = v11;
  }
LABEL_110:
}

void sub_1A7DB94F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id **a17)
{
  BOOL v20 = *a17;
  *a17 = 0;
  if (v20) {
    std::default_delete<CSStore2::Store>::operator()[abi:nn180100](v20);
  }
  _Unwind_Resume(a1);
}

id CSStore2::GetLog(CSStore2 *this)
{
  if (CSStore2::GetLog(void)::once != -1) {
    dispatch_once(&CSStore2::GetLog(void)::once, &__block_literal_global_745);
  }
  dispatch_queue_t v1 = (void *)CSStore2::GetLog(void)::result;

  return v1;
}

vm_address_t CSStore2::VM::AllocateCopy(CSStore2::VM *this, const void *a2, CSStore2::VM *a3)
{
  unsigned int v3 = a3;
  unsigned int v4 = a2;
  vm_address_t v6 = CSStore2::VM::Allocate(a3);
  vm_address_t v7 = v6;
  if (v6)
  {
    if (v3 >= v4) {
      unint64_t v8 = v4;
    }
    else {
      unint64_t v8 = v3;
    }
    CSStore2::VM::Copy(v6, (NSUInteger)this, (const void *)v8);
  }
  return v7;
}

vm_address_t CSStore2::VM::Allocate(CSStore2::VM *this)
{
  kern_return_t v4;
  vm_address_t result;
  BOOL v6;
  NSObject *v7;
  vm_address_t address;
  uint8_t buf[4];
  vm_size_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  uint64_t v13 = *MEMORY[0x1E4F143B8];
  address = 0;
  unsigned int v1 = *MEMORY[0x1E4F14B00];
  unsigned int v2 = this + *MEMORY[0x1E4F14B00] - 1;
  if (v2 == v2 % *MEMORY[0x1E4F14B00]) {
    vm_size_t v3 = v1;
  }
  else {
    vm_size_t v3 = v2 / v1 * v1;
  }
  unsigned int v4 = vm_allocate(*MEMORY[0x1E4F14960], &address, v3, 721420289);
  double result = address;
  if (v4) {
    vm_address_t v6 = 1;
  }
  else {
    vm_address_t v6 = address == 0;
  }
  if (v6)
  {
    vm_address_t v7 = CSStore2::GetLog((CSStore2 *)address);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      BOOL v10 = v3;
      id v11 = 2048;
      uint64_t v12 = v4;
      _os_log_error_impl(&dword_1A7DB2000, v7, OS_LOG_TYPE_ERROR, "Failed to allocate %llu bytes with kernel error %llx.", buf, 0x16u);
    }

    return 0;
  }
  return result;
}

void CSStore2::VM::Copy(NSUInteger this, NSUInteger a2, const void *a3)
{
  unsigned int v3 = a3;
  NSUInteger v4 = a2;
  NSUInteger v6 = a3;
  v9.location = a2;
  v9.size_t length = v6;
  v10.location = this;
  v10.size_t length = v6;
  if (!NSIntersectionRange(v9, v10).length)
  {
    if (v3 < 0x80000) {
      goto LABEL_5;
    }
    if (((NSPageSize() - 1) & (v4 | this)) == 0)
    {
      NSUInteger v7 = NSRoundDownToMultipleOfPageSize(v6);
      NSCopyMemoryPages((const void *)v4, (void *)this, v7);
      v4 += v7;
      this += v7;
      v6 -= v7;
LABEL_5:
      if (!v6) {
        return;
      }
    }
  }

  memmove((void *)this, (const void *)v4, v6);
}

void CSStore2::Store::setBytesNoCopy(CSStore2::Store *this, void *a2, uint64_t a3)
{
  CSStore2::Store::assertNotEnumeratingUnits((uint64_t)this);
  if (a2)
  {
    NSUInteger v6 = *(void **)this;
    *(void *)this = 0;

    NSUInteger v7 = [[_CSStore2DataContainer alloc] initWithBytesNoCopy:a2 length:a3];
    unint64_t v8 = *(void **)this;
    *(void *)this = v7;

    CSStore2::Store::_dataDidMove(this);
    atomic_store(0, (unint64_t *)this + 37);
  }
  else
  {
    if (a3 <= 0x40000) {
      a3 = 0x40000;
    }
    else {
      a3 = a3;
    }
    vm_address_t v9 = CSStore2::VM::Allocate((CSStore2::VM *)a3);
    if (v9)
    {
      NSRange v10 = (void *)v9;
      *(_OWORD *)(v9 + 4) = 0u;
      *(void *)(v9 + 84) = 0;
      *(_OWORD *)(v9 + 68) = 0u;
      *(_OWORD *)(v9 + 52) = 0u;
      *(_OWORD *)(v9 + 36) = 0u;
      *(_OWORD *)(v9 + 20) = 0u;
      *(_DWORD *)vm_address_t v9 = 1819501666;
      *(unsigned char *)(v9 + 4) = 2;
      *(void *)(v9 + 92) = 0xFFFFFFFF00000000;
      *(_OWORD *)(v9 + 12) = xmmword_1A7DE45B0;
      CSStore2::Table::setName((CSStore2::Table *)(v9 + 20), &cfstr_Catalog.isa);
      CSStore2::Store::setBytesNoCopy(this, v10, a3);
      uint64_t v11 = *(void *)this;
      if (*(void *)this)
      {
        unint64_t v12 = *(void *)(v11 + 8);
        unint64_t v13 = v12 + 20;
      }
      else
      {
        unint64_t v12 = 0;
        unint64_t v13 = 20;
      }
      unsigned int v14 = -1;
      BOOL v15 = v13 >= v12;
      unint64_t v16 = v13 - v12;
      if (v15 && !HIDWORD(v16))
      {
        if ((v16 + 1) > *(_DWORD *)(*(void *)(v11 + 8) + 12) || v16 == -1) {
          unsigned int v14 = -1;
        }
        else {
          unsigned int v14 = v16;
        }
      }
      memset(v24, 0, sizeof(v24));
      int v25 = 1065353216;
      NSUInteger v18 = CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::Create(this, (uint64_t)v24);
      if (!v18
        || ((uint64_t v19 = *(void *)this) == 0 ? (v20 = 0) : (v20 = *(void *)(v19 + 8)),
            (NSUInteger v21 = v18 - v20, v18 < v20)
         || HIDWORD(v21)
         || v21 == -1
         || (v21 + 1) > *(_DWORD *)(*(void *)(v19 + 8) + 12)))
      {
        std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)v24);
      }
      else
      {
        std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)v24);
        *(_DWORD *)(*(void *)(*(void *)this + 8) + v14 + 76) = v21;
      }
    }
    else
    {
      id v23 = [MEMORY[0x1E4F28B00] currentHandler];
      int v22 = objc_msgSend(NSString, "stringWithUTF8String:", "void CSStore2::Store::setBytesNoCopy(void *, _CSStoreSize)");
      [v23 handleFailureInFunction:v22 file:@"CSStore+Store.mm" lineNumber:827 description:@"Failed to create data for empty bytes argument!"];
    }
  }
}

void sub_1A7DB9B7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, char a11)
{
  _Unwind_Resume(a1);
}

uint64_t CSStore2::Store::assertNotEnumeratingUnits(uint64_t this)
{
  if (atomic_load((unint64_t *)(this + 288))) {
    abort();
  }
  return this;
}

atomic_ullong CSStore2::Store::_dataDidMove(CSStore2::Store *this)
{
  *(void *)&long long v2 = -1;
  *((void *)&v2 + 1) = -1;
  *(_OWORD *)((char *)this + 248) = v2;
  *(_OWORD *)((char *)this + 232) = v2;
  *(_OWORD *)((char *)this + 216) = v2;
  *(_OWORD *)((char *)this + 200) = v2;
  *(_OWORD *)((char *)this + 184) = v2;
  *(_OWORD *)((char *)this + 168) = v2;
  *(_OWORD *)((char *)this + 152) = v2;
  *(_OWORD *)((char *)this + 136) = v2;
  *(_OWORD *)((char *)this + 120) = v2;
  *(_OWORD *)((char *)this + 104) = v2;
  *(_OWORD *)((char *)this + 88) = v2;
  *(_OWORD *)((char *)this + 72) = v2;
  *(_OWORD *)((char *)this + 56) = v2;
  *(_OWORD *)((char *)this + 40) = v2;
  *(_OWORD *)((char *)this + 24) = v2;
  *(_OWORD *)((char *)this + 8) = v2;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = ___ZN8CSStore25Store12_dataDidMoveEv_block_invoke;
  v4[3] = &__block_descriptor_40_e47_v24__0r__Table__Unit_b30b2I_0c___48c_QQII_8_B16l;
  v4[4] = this;
  CSStore2::Store::enumerateTables((atomic_ullong *)this, v4);
  *((void *)this + 33) = CSStore2::Store::getTable((atomic_ullong *)this, &cfstr_Array.isa);
  *((void *)this + 34) = CSStore2::Store::getTable((atomic_ullong *)this, &cfstr_String_0.isa);
  atomic_ullong result = CSStore2::Store::getTable((atomic_ullong *)this, &cfstr_Dictionary.isa);
  *((void *)this + 35) = result;
  return result;
}

void sub_1A7DB9D98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)_CSStore2DataContainer;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void CSStore2::VM::Deallocate(CSStore2::VM *this, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  unsigned int v2 = *MEMORY[0x1E4F14B00];
  unsigned int v3 = a2 + *MEMORY[0x1E4F14B00] - 1;
  if (v3 == v3 % *MEMORY[0x1E4F14B00]) {
    uint64_t v4 = v2;
  }
  else {
    uint64_t v4 = v3 / v2 * v2;
  }
  id v5 = (CSStore2 *)MEMORY[0x1AD0DB5D0](*MEMORY[0x1E4F14960], this, v4);
  if (v5)
  {
    int v6 = (int)v5;
    NSUInteger v7 = CSStore2::GetLog(v5);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 134218240;
      uint64_t v9 = v4;
      __int16 v10 = 2048;
      uint64_t v11 = v6;
      _os_log_error_impl(&dword_1A7DB2000, v7, OS_LOG_TYPE_ERROR, "Failed to deallocate %llu bytes with kernel error %llx.", (uint8_t *)&v8, 0x16u);
    }
  }
}

uint64_t _CSDictionaryCreateWithKeysAndValues(atomic_ullong *a1, char a2, int a3, uint64_t a4, uint64_t a5, unsigned int a6, void *a7)
{
  v79[2] = *MEMORY[0x1E4F143B8];
  if ((a3 & 4) == 0 || (a3 & 3) == 0)
  {
    if (a1) {
      goto LABEL_4;
    }
LABEL_92:
    id v65 = (void *)MEMORY[0x1E4F28C58];
    v76[0] = *MEMORY[0x1E4F28228];
    v76[1] = @"Line";
    v77[0] = @"paramErr";
    v77[1] = &unk_1EFE43350;
    v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v77 forKeys:v76 count:2];
    uint64_t v62 = [v65 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v61];
LABEL_93:
    v59 = (void *)v62;

    uint64_t v58 = 0;
    if (!a7) {
      goto LABEL_96;
    }
    goto LABEL_94;
  }
  char v63 = [MEMORY[0x1E4F28B00] currentHandler];
  v64 = objc_msgSend(NSString, "stringWithUTF8String:", "CSDictionaryID _CSDictionaryCreateWithKeysAndValues(CSMutableStoreRef _Nonnull, CSDictionaryKeyOptions, CSDictionaryValueOptions, const CSDictionaryKey * _Nonnull, const CSDictionaryValue * _Nonnull, _CSStoreUnitCount, CFErrorRef * _Nullable)");
  [v63 handleFailureInFunction:v64, @"CSDictionary.mm", 23, @"Invalid parameter not satisfying: %@", @"!( inValueOptions &(kCSDictionaryValueOptionsStringPersonality | kCSDictionaryValueOptionsArrayPersonality))" file lineNumber description];

  if (!a1) {
    goto LABEL_92;
  }
LABEL_4:
  if (performMutatingAssertions)
  {
    atomic_ullong v14 = a1[43];
    if (v14) {
      (***(void (****)(void))(v14 + 8))(*(void *)(v14 + 8));
    }
  }
  BOOL v15 = (CSStore2::Table **)(a1 + 1);
  atomic_ullong Table = a1[36];
  if (!Table)
  {
    atomic_ullong Table = CSStore2::Store::getTable(a1 + 1, &cfstr_Dictionary.isa);
    if (!Table)
    {
      atomic_ullong Table = (atomic_ullong)CSStore2::Store::allocateTable((CSStore2::Store *)(a1 + 1), &cfstr_Dictionary.isa, 0, 0);
      if (!Table) {
        goto LABEL_90;
      }
    }
  }
  v67 = a7;
  v68 = (int *)Table;
  long long v73 = 0u;
  long long v74 = 0u;
  float v75 = 1.0;
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__rehash<true>((uint64_t)&v73, (unint64_t)(float)a6);
  if (a6)
  {
    uint64_t v17 = 0;
    uint64_t v18 = a6;
    while (1)
    {
      CSStore2::Dictionary::_CopyCanonicalKey((CSStore2::Dictionary *)&v70, v15, *(_DWORD *)(a4 + 4 * v17), a2);
      if (v72) {
        break;
      }
LABEL_51:
      if (++v17 == v18) {
        goto LABEL_52;
      }
    }
    CSStore2::Dictionary::_TakeOwnershipOfValue((unsigned int *)v15, (CSStore2::Store *)*(unsigned int *)(a5 + 4 * v17), a3);
    unint64_t v19 = v71;
    unint64_t v20 = *((void *)&v73 + 1);
    if (*((void *)&v73 + 1))
    {
      uint8x8_t v21 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v73 + 8));
      v21.i16[0] = vaddlv_u8(v21);
      if (v21.u32[0] > 1uLL)
      {
        unint64_t v7 = v71;
        if (*((void *)&v73 + 1) <= (unint64_t)v71) {
          unint64_t v7 = (unint64_t)v71 % *((void *)&v73 + 1);
        }
      }
      else
      {
        unint64_t v7 = (DWORD2(v73) - 1) & v71;
      }
      int v22 = *(uint64_t ***)(v73 + 8 * v7);
      if (v22)
      {
        for (uint64_t i = *v22; i; uint64_t i = (uint64_t *)*i)
        {
          unint64_t v24 = i[1];
          if (v24 == v71)
          {
            if (*((_DWORD *)i + 4) == v71) {
              goto LABEL_51;
            }
          }
          else
          {
            if (v21.u32[0] > 1uLL)
            {
              if (v24 >= *((void *)&v73 + 1)) {
                v24 %= *((void *)&v73 + 1);
              }
            }
            else
            {
              v24 &= *((void *)&v73 + 1) - 1;
            }
            if (v24 != v7) {
              break;
            }
          }
        }
      }
    }
    int v25 = operator new(0x18uLL);
    *int v25 = 0;
    v25[1] = v19;
    int v26 = *(_DWORD *)(a5 + 4 * v17);
    *((_DWORD *)v25 + 4) = v19;
    *((_DWORD *)v25 + 5) = v26;
    float v27 = (float)(unint64_t)(*((void *)&v74 + 1) + 1);
    if (!v20 || (float)(v75 * (float)v20) < v27)
    {
      BOOL v28 = (v20 & (v20 - 1)) != 0;
      if (v20 < 3) {
        BOOL v28 = 1;
      }
      unint64_t v29 = v28 | (2 * v20);
      unint64_t v30 = vcvtps_u32_f32(v27 / v75);
      if (v29 <= v30) {
        size_t v31 = v30;
      }
      else {
        size_t v31 = v29;
      }
      std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__rehash<true>((uint64_t)&v73, v31);
      unint64_t v20 = *((void *)&v73 + 1);
      if ((*((void *)&v73 + 1) & (*((void *)&v73 + 1) - 1)) != 0)
      {
        if (*((void *)&v73 + 1) <= v19) {
          unint64_t v7 = v19 % *((void *)&v73 + 1);
        }
        else {
          unint64_t v7 = v19;
        }
      }
      else
      {
        unint64_t v7 = (DWORD2(v73) - 1) & v19;
      }
    }
    uint64_t v32 = v73;
    uLong v33 = *(void **)(v73 + 8 * v7);
    if (v33)
    {
      *int v25 = *v33;
    }
    else
    {
      *int v25 = v74;
      *(void *)&long long v74 = v25;
      *(void *)(v32 + 8 * v7) = &v74;
      if (!*v25)
      {
LABEL_50:
        ++*((void *)&v74 + 1);
        goto LABEL_51;
      }
      unint64_t v34 = *(void *)(*v25 + 8);
      if ((v20 & (v20 - 1)) != 0)
      {
        if (v34 >= v20) {
          v34 %= v20;
        }
      }
      else
      {
        v34 &= v20 - 1;
      }
      uLong v33 = (void *)(v73 + 8 * v34);
    }
    void *v33 = v25;
    goto LABEL_50;
  }
LABEL_52:
  int v35 = *v68;
  if ((DWORD2(v74) + 1024) >= 0x2000) {
    unsigned int v36 = 0x2000;
  }
  else {
    unsigned int v36 = DWORD2(v74) + 1024;
  }
  if (v36 <= 0x10) {
    unsigned int v36 = 16;
  }
  int v37 = 8 * v36 + 8 * (DWORD2(v74) + 1024);
  vm_address_t v38 = (const void *)(v37 | 4u);
  unint64_t v39 = CSStore2::Store::extend((CSStore2::Store *)v15, v37 | 4u);
  NSUInteger v40 = v39;
  if (!v39) {
    goto LABEL_89;
  }
  int v41 = *v15;
  if (*v15) {
    unint64_t v42 = *((void *)v41 + 1);
  }
  else {
    unint64_t v42 = 0;
  }
  int v43 = -1;
  BOOL v44 = v39 >= v42;
  unint64_t v45 = v39 - v42;
  if (v44 && !HIDWORD(v45))
  {
    if ((v45 + 1) > *(_DWORD *)(*((void *)v41 + 1) + 12) || v45 == -1) {
      int v43 = -1;
    }
    else {
      int v43 = v45;
    }
  }
  CSStore2::HashMap<unsigned int,unsigned int,CSStore2::Dictionary::_Functions,0ull>::Create((_DWORD **)&v70, (uint64_t)&v73, v43, 0x400u, 0);
  uint64_t v47 = v70;
  if (!v70)
  {
    CSStore2::Store::assertNotEnumeratingUnits((uint64_t)v15);
    uint64_t v51 = *((void *)*v15 + 1);
    unsigned int v52 = *(_DWORD *)(v51 + 16);
    BOOL v44 = v52 >= v38;
    unsigned int v53 = v52 - v38;
    if (!v44) {
      unsigned int v53 = 0;
    }
    *(_DWORD *)(v51 + 16) = v53;
    ++*(_DWORD *)(v51 + 8);
    goto LABEL_89;
  }
  CSStore2::VM::Copy(v40, (NSUInteger)v70, v38);
  v70 = 0;
  v71(v47);
  uint64_t v48 = CSStore2::Store::getTable((CSStore2::Store *)v15, 4 * v35);
  unint64_t v49 = *v15;
  if (*v15) {
    NSUInteger v50 = *((void *)v49 + 1);
  }
  else {
    NSUInteger v50 = 0;
  }
  int v54 = -1;
  BOOL v44 = v40 >= v50;
  NSUInteger v55 = v40 - v50;
  if (v44 && !HIDWORD(v55))
  {
    if ((v55 + 1) > *(_DWORD *)(*((void *)v49 + 1) + 12) || v55 == -1) {
      int v54 = -1;
    }
    else {
      int v54 = v55;
    }
  }
  Unit = CSStore2::Store::allocateUnit((CSStore2::Store *)v15, (CSStore2::Table *)v48, 8, 0);
  if (!Unit)
  {
LABEL_89:
    std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)&v73);
    a7 = v67;
LABEL_90:
    uint64_t v60 = (void *)MEMORY[0x1E4F28C58];
    v78[0] = *MEMORY[0x1E4F28228];
    v78[1] = @"Line";
    v79[0] = @"kCSStoreAllocFailedErr";
    v79[1] = &unk_1EFE43338;
    v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:v78 count:2];
    uint64_t v62 = [v60 errorWithDomain:*MEMORY[0x1E4F28760] code:-9493 userInfo:v61];
    goto LABEL_93;
  }
  Unit->var3[0] = a2;
  Unit->var3[1] = a3;
  *(_WORD *)&Unit->var3[2] = 0;
  *(_DWORD *)&Unit->var3[4] = v54;
  uint64_t v58 = (4 * *(_DWORD *)Unit);
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)&v73);
  v59 = 0;
  a7 = v67;
  if (!v67) {
    goto LABEL_96;
  }
LABEL_94:
  if (!v58) {
    *a7 = v59;
  }
LABEL_96:

  return v58;
}

void sub_1A7DBA70C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _CSDictionaryCreate(atomic_ullong *a1, char a2, int a3, void *a4)
{
  return _CSDictionaryCreateWithKeysAndValues(a1, a2, a3, 0, 0, 0, a4);
}

Unit *_CSDictionaryDispose(Unit *result, CSStore2::Store *a2)
{
  if (result && a2)
  {
    unsigned int v3 = result;
    if (performMutatingAssertions)
    {
      uint64_t v4 = *(void *)&result->var3[336];
      if (v4) {
        (***(void (****)(void))(v4 + 8))(*(void *)(v4 + 8));
      }
    }
    return CSStore2::Dictionary::Dispose((const CSStore2::Table **)v3->var3, a2);
  }
  return result;
}

uint64_t _CSDictionaryGetCount(uint64_t a1, unsigned int a2)
{
  if (performConstantAssertions)
  {
    uint64_t v4 = *(void *)(a1 + 344);
    if (v4) {
      (*(void (**)(void))(**(void **)(v4 + 8) + 8))(*(void *)(v4 + 8));
    }
  }
  CSStore2::Dictionary::Get((CSStore2::Dictionary *)v8, (CSStore2::Store *)(a1 + 8), a2);
  if (!v9) {
    return 0;
  }
  id v5 = (CSStore2::Dictionary *)v8[0];
  unsigned int v6 = *(_DWORD *)(v8[1] + 4);

  return CSStore2::Dictionary::getCount(v5, v6);
}

uint64_t _CSDictionaryGetKeyOptions(uint64_t a1, unsigned int a2)
{
  if (performConstantAssertions)
  {
    uint64_t v4 = *(void *)(a1 + 344);
    if (v4) {
      (*(void (**)(void))(**(void **)(v4 + 8) + 8))(*(void *)(v4 + 8));
    }
  }
  CSStore2::Dictionary::Get((CSStore2::Dictionary *)v6, (CSStore2::Store *)(a1 + 8), a2);
  if (v7) {
    return *(unsigned __int8 *)v6[1];
  }
  else {
    return 0;
  }
}

uint64_t _CSDictionaryGetValueOptions(uint64_t a1, unsigned int a2)
{
  if (performConstantAssertions)
  {
    uint64_t v4 = *(void *)(a1 + 344);
    if (v4) {
      (*(void (**)(void))(**(void **)(v4 + 8) + 8))(*(void *)(v4 + 8));
    }
  }
  CSStore2::Dictionary::Get((CSStore2::Dictionary *)v6, (CSStore2::Store *)(a1 + 8), a2);
  if (v7) {
    return *(unsigned __int8 *)(v6[1] + 1);
  }
  else {
    return 0;
  }
}

_DWORD *_CSDictionaryGetValue(uint64_t a1, unsigned int a2, unsigned int a3)
{
  if (performConstantAssertions)
  {
    uint64_t v6 = *(void *)(a1 + 344);
    if (v6) {
      (*(void (**)(void))(**(void **)(v6 + 8) + 8))(*(void *)(v6 + 8));
    }
  }
  CSStore2::Dictionary::Get((CSStore2::Dictionary *)&v11, (CSStore2::Store *)(a1 + 8), a2);
  if (!v13) {
    return 0;
  }
  uint64_t v7 = *(unsigned int *)(v12 + 4);
  if (v7 == -1) {
    return 0;
  }
  int v8 = (CSStore2 **)v11;
  uint64_t v9 = *(void *)(*(void *)v11 + 8);
  if (*(_DWORD *)(v9 + 12) <= v7) {
    return 0;
  }
  if (*(unsigned char *)v12) {
    CSStore2::getOrCopyStringFrom4CC((CSStore2 *)&v11, (CSStore2::Table **)v11, a3, 0);
  }
  else {
    CSStore2::String::Get(&v11, v11, a3);
  }
  if (!v14) {
    return 0;
  }
  atomic_ullong result = CSStore2::HashMap<unsigned int,unsigned int,CSStore2::Dictionary::_Functions,0ull>::Find(*v8, (int *)(v9 + v7), v12);
  if (result) {
    return (_DWORD *)*result;
  }
  return result;
}

void _CSDictionarySetValue(uint64_t a1, unsigned int a2, unsigned int a3, CSStore2::Store *a4)
{
  if (performMutatingAssertions)
  {
    uint64_t v8 = *(void *)(a1 + 344);
    if (v8) {
      (***(void (****)(void))(v8 + 8))(*(void *)(v8 + 8));
    }
  }
  CSStore2::Dictionary::Get((CSStore2::Dictionary *)&v48, (CSStore2::Store *)(a1 + 8), a2);
  if (v51)
  {
    uint64_t v9 = v49;
    uint64_t v10 = *(unsigned int *)(v49 + 4);
    if (v10 != -1)
    {
      uint64_t v11 = (CSStore2 **)v48;
      uint64_t v12 = *(void *)(*(void *)v48 + 8);
      if (*(_DWORD *)(v12 + 12) > v10)
      {
        CSStore2::Dictionary::_CopyCanonicalKey((CSStore2::Dictionary *)&v53, (CSStore2::Table **)v48, a3, *(unsigned char *)v49);
        if (v55)
        {
          char v13 = (int *)(v12 + v10);
          int v14 = v54;
          BOOL v15 = CSStore2::HashMap<unsigned int,unsigned int,CSStore2::Dictionary::_Functions,0ull>::Find(*v11, v13, v54);
          if (v15) {
            BOOL v16 = 1;
          }
          else {
            BOOL v16 = a4 == 0;
          }
          if (!v16)
          {
            CSStore2::String::retain((unsigned int *)&v53);
            CSStore2::Dictionary::_TakeOwnershipOfValue((unsigned int *)v11, a4, *(unsigned __int8 *)(v9 + 1));
            goto LABEL_21;
          }
          uint64_t v17 = v15;
          if (v15) {
            BOOL v18 = a4 == 0;
          }
          else {
            BOOL v18 = 0;
          }
          if (v18)
          {
            CSStore2::String::release(&v53);
            CSStore2::Dictionary::_RelinquishOwnershipOfValue((CSStore2::Store *)v11, (CSStore2::Store *)*v17, *(unsigned __int8 *)(v9 + 1));
          }
          else
          {
            if (v15 && *v15 != a4)
            {
              CSStore2::Dictionary::_TakeOwnershipOfValue((unsigned int *)v11, a4, *(unsigned __int8 *)(v9 + 1));
              CSStore2::Dictionary::_RelinquishOwnershipOfValue((CSStore2::Store *)v11, (CSStore2::Store *)*v17, *(unsigned __int8 *)(v9 + 1));
            }
            if (a4)
            {
LABEL_21:
              if (!v14)
              {
LABEL_70:
                CSStore2::Store::collectGarbage((CSStore2::Store *)v11, 0);
                CSStore2::Dictionary::Get((CSStore2::Dictionary *)v52, (CSStore2::Store *)v11, v50);
LABEL_71:
                CSStore2::String::release(&v53);
                return;
              }
              unint64_t v19 = CSStore2::HashMap<unsigned int,unsigned int,CSStore2::Dictionary::_Functions,0ull>::Find(*v11, v13, v14);
              if (v19)
              {
                *unint64_t v19 = a4;
                goto LABEL_70;
              }
              uint8x8_t v21 = &v13[2 * ((unsigned __int16)v14 % *v13)];
              unint64_t v22 = (unint64_t)(v21 + 1);
              uint64_t v23 = v21[2];
              if (v23 == -1)
              {
                float v27 = 0;
              }
              else
              {
                uint64_t v24 = *((void *)*v11 + 1);
                BOOL v25 = *(_DWORD *)(v24 + 12) > v23;
                int v26 = (char *)(v24 + v23);
                if (v25) {
                  float v27 = v26;
                }
                else {
                  float v27 = 0;
                }
              }
              uint64_t v28 = *(unsigned int *)v22;
              if (v28)
              {
                uint64_t v29 = 0;
                unint64_t v30 = v27 + 4;
                while (*(v30 - 1) && *v30)
                {
                  ++v29;
                  v30 += 2;
                  if (v28 == v29) {
                    goto LABEL_38;
                  }
                }
                unsigned int v36 = (int *)&v27[8 * v29];
                *unsigned int v36 = v14;
                v36[1] = (int)a4;
                goto LABEL_70;
              }
LABEL_38:
              unsigned int v31 = v28 + 8;
              uint64_t v32 = *v11;
              if (*v11)
              {
                unint64_t v33 = *((void *)v32 + 1);
                unsigned int v34 = -1;
                BOOL v35 = v22 >= v33;
                v22 -= v33;
                if (!v35)
                {
LABEL_50:
                  vm_address_t v38 = CSStore2::Store::embraceAndExtend((CSStore2::Store *)v11, v27, (const void *)(8 * v28), 8 * v31);
                  if (v34 == -1 || (uint64_t v39 = *((void *)*v11 + 1), *(_DWORD *)(v39 + 12) <= v34)) {
                    NSUInteger v40 = 0;
                  }
                  else {
                    NSUInteger v40 = (_DWORD *)(v39 + v34);
                  }
                  if (!v38)
                  {
                    v40[1] = -1;
                    abort();
                  }
                  int v41 = *v11;
                  if (*v11) {
                    unint64_t v42 = *((void *)v41 + 1);
                  }
                  else {
                    unint64_t v42 = 0;
                  }
                  int v43 = -1;
                  BOOL v35 = (unint64_t)v38 >= v42;
                  unint64_t v44 = (unint64_t)&v38[-v42];
                  if (v35 && !HIDWORD(v44))
                  {
                    if ((v44 + 1) > *(_DWORD *)(*((void *)v41 + 1) + 12) || v44 == -1) {
                      int v43 = -1;
                    }
                    else {
                      int v43 = v44;
                    }
                  }
                  v40[1] = v43;
                  NSRange v46 = (int *)&v38[8 * v28];
                  int *v46 = v14;
                  v46[1] = (int)a4;
                  if ((int)v28 + 1 < v31)
                  {
                    uint64_t v47 = &v38[8 * (v28 + 1)];
                    *((void *)v47 + 6) = 0;
                    *((_OWORD *)v47 + 1) = 0u;
                    *((_OWORD *)v47 + 2) = 0u;
                    *(_OWORD *)uint64_t v47 = 0u;
                  }
                  *v40 += 8;
                  goto LABEL_70;
                }
              }
              else
              {
                unsigned int v34 = -1;
              }
              if (!HIDWORD(v22))
              {
                if ((v22 + 1) > *(_DWORD *)(*((void *)v32 + 1) + 12) || v22 == -1) {
                  unsigned int v34 = -1;
                }
                else {
                  unsigned int v34 = v22;
                }
              }
              goto LABEL_50;
            }
          }
          if (v14)
          {
            unint64_t v20 = CSStore2::HashMap<unsigned int,unsigned int,CSStore2::Dictionary::_Functions,0ull>::Find(*v11, v13, v14);
            if (v20) {
              *unint64_t v20 = 0;
            }
          }
          goto LABEL_71;
        }
      }
    }
  }
}

const CSStore2::Table *_CSDictionaryRemoveAllValues(uint64_t a1, unsigned int a2)
{
  if (performMutatingAssertions)
  {
    uint64_t v4 = *(void *)(a1 + 344);
    if (v4) {
      (***(void (****)(void))(v4 + 8))(*(void *)(v4 + 8));
    }
  }
  atomic_ullong result = CSStore2::Dictionary::Get((CSStore2::Dictionary *)v6, (CSStore2::Store *)(a1 + 8), a2);
  if (v7) {
    return (const CSStore2::Table *)CSStore2::Dictionary::removeAllValues(v6);
  }
  return result;
}

void _CSDictionaryEnumerateAllValues(uint64_t a1, unsigned int a2, void *a3)
{
  id v5 = a3;
  if (performConstantAssertions)
  {
    uint64_t v6 = *(void *)(a1 + 344);
    if (v6) {
      (*(void (**)(void))(**(void **)(v6 + 8) + 8))(*(void *)(v6 + 8));
    }
  }
  CSStore2::Dictionary::Get((CSStore2::Dictionary *)&v12, (CSStore2::Store *)(a1 + 8), a2);
  if (v14)
  {
    long long v9 = v12;
    uint64_t v10 = v13;
    char v11 = 1;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = ___CSDictionaryEnumerateAllValues_block_invoke;
    long long v7[3] = &unk_1E5D2A2B8;
    id v8 = v5;
    CSStore2::Dictionary::enumerateKeysAndValues((unint64_t)&v9, 0, v7);
  }
  else
  {
    LOBYTE(v9) = 0;
    char v11 = 0;
  }
}

void sub_1A7DBB020(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A7DBB1E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7DBB36C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7DBB670(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _CSWriteUnitState *a13)
{
  _Unwind_Resume(a1);
}

void _CSWriteUnitState::~_CSWriteUnitState(_CSWriteUnitState *this)
{
}

__n128 __copy_helper_block_ea8_32c68_ZTSKZ55___CSVisualizationArchiver_writeAllUnitsInTable_block__E3__1(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 32);
  long long v3 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v3;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t __copy_helper_block_ea8_32c68_ZTSKZ55___CSVisualizationArchiver_writeAllUnitsInTable_block__E3__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 32) = *(void *)(a2 + 32);
  return result;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>(unint64_t a1)
{
  if (a1 >> 62) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(4 * a1);
}

void std::__throw_bad_array_new_length[abi:nn180100]()
{
}

void sub_1A7DBB984(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_1A7DBBBD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7DBBD9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1A7DBBE64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7DBBF08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7DBC1F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7DBC4AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7DBC73C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7DBD158(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7DBD464(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7DBD668(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t initlockdown_checkin_xpc(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (lockdownLibrary(void)::sOnce != -1) {
    dispatch_once(&lockdownLibrary(void)::sOnce, &__block_literal_global);
  }
  softLinklockdown_checkin_xpc = (uint64_t (*)())dlsym((void *)lockdownLibrary(void)::sLib, "lockdown_checkin_xpc");
  uint64_t v9 = ((uint64_t (*)(uint64_t, uint64_t, id, id))softLinklockdown_checkin_xpc)(a1, a2, v7, v8);

  return v9;
}

void sub_1A7DBD73C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t initlockdown_disconnect(uint64_t a1)
{
  if (lockdownLibrary(void)::sOnce != -1) {
    dispatch_once(&lockdownLibrary(void)::sOnce, &__block_literal_global);
  }
  unsigned int v2 = (uint64_t (*)())dlsym((void *)lockdownLibrary(void)::sLib, "lockdown_disconnect");
  softLinklockdown_disconnect = v2;

  return ((uint64_t (*)(uint64_t))v2)(a1);
}

uint64_t CSStore2::writeToLockdownConnection(CSStore2 *this, uint64_t a2, const char *a3)
{
  return softLinklockdown_send((uint64_t)this, a2, (int)a3);
}

uint64_t initlockdown_send(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (lockdownLibrary(void)::sOnce != -1) {
    dispatch_once(&lockdownLibrary(void)::sOnce, &__block_literal_global);
  }
  uint64_t v6 = (uint64_t (*)())dlsym((void *)lockdownLibrary(void)::sLib, "lockdown_send");
  softLinklockdown_send = v6;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v6)(a1, a2, a3);
}

uint64_t CSStore2::readFromLockdownConnection(CSStore2 *this, uint64_t a2, char *a3)
{
  return softLinklockdown_recv((uint64_t)this, a2, (int)a3);
}

uint64_t initlockdown_recv(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (lockdownLibrary(void)::sOnce != -1) {
    dispatch_once(&lockdownLibrary(void)::sOnce, &__block_literal_global);
  }
  uint64_t v6 = (uint64_t (*)())dlsym((void *)lockdownLibrary(void)::sLib, "lockdown_recv");
  softLinklockdown_recv = v6;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v6)(a1, a2, a3);
}

void *___ZL15lockdownLibraryv_block_invoke()
{
  __n128 result = dlopen("/usr/lib//liblockdown.dylib", 2);
  lockdownLibrary(void)::sLib = (uint64_t)result;
  return result;
}

void sub_1A7DBDA28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A7DBDBBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7DBDD44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void CSStore2::AttributedStringWriter::~AttributedStringWriter(CSStore2::AttributedStringWriter *this)
{
  CSStore2::AttributedStringWriter::~AttributedStringWriter(this);

  JUMPOUT(0x1AD0DACB0);
}

{
  id *v2;

  *(void *)this = &unk_1EFE40808;
  unsigned int v2 = (id *)*((void *)this + 31);
  if (v2 == (id *)((char *)this + 8))
  {
    CSStore2::AttributedStringWriter::Impl::~Impl(v2);
  }
  else if (v2)
  {
    CSStore2::AttributedStringWriter::Impl::~Impl(v2);
    MEMORY[0x1AD0DACB0]();
  }
}

void CSStore2::AttributedStringWriter::Impl::~Impl(id *this)
{
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)(this + 14));
  std::__hash_table<std::__hash_value_type<unsigned long,NSString * {__strong}>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,NSString * {__strong}>>>::~__hash_table((uint64_t)(this + 9));

  id v2 = this[4];
  if (v2)
  {
    this[5] = v2;
    operator delete(v2);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned long,NSString * {__strong}>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,NSString * {__strong}>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<unsigned long,NSString * {__strong}>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,NSString * {__strong}>>>::__deallocate_node(*(id **)(a1 + 16));
  id v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<unsigned long,NSString * {__strong}>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,NSString * {__strong}>>>::__deallocate_node(id *a1)
{
  if (a1)
  {
    unsigned int v1 = a1;
    do
    {
      id v2 = (id *)*v1;

      operator delete(v1);
      unsigned int v1 = v2;
    }
    while (v2);
  }
}

CSStore2::AttributedStringWriter::Impl *CSStore2::AttributedStringWriter::Impl::Impl(CSStore2::AttributedStringWriter::Impl *this, __CSStore *a2, NSMutableAttributedString *a3)
{
  *(void *)this = 0;
  *((void *)this + 1) = a3;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((void *)this + 12) = 0;
  *((_DWORD *)this + 26) = 1065353216;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = 0u;
  *((_DWORD *)this + 36) = 1065353216;
  *((_WORD *)this + 76) = 0;
  *((void *)this + 20) = 0;
  *((_WORD *)this + 84) = 257;
  *((unsigned char *)this + 170) = 0;
  if (a2) {
    objc_storeStrong((id *)this, a2);
  }
  return this;
}

uint64_t CSStore2::AttributedStringWriter::Impl::getStore(CSStore2::AttributedStringWriter::Impl *this)
{
  return *(void *)this;
}

void CSStore2::AttributedStringWriter::Impl::attributedString(id *this, NSAttributedString *a2)
{
  if (a2)
  {
    [this[1] appendAttributedString:a2];
    if (*((unsigned char *)this + 169))
    {
      id v6 = [(NSAttributedString *)a2 string];
      char v4 = [v6 hasSuffix:@"\n"];

      if ((v4 & 1) == 0)
      {
        id v5 = this[1];
        CSStore2::getAttributedStringWithCharacter((CSStore2 *)0xA);
        id v7 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendAttributedString:");
      }
    }
  }
}

void sub_1A7DBE03C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

id CSStore2::getAttributedStringWithCharacter(CSStore2 *this)
{
  unsigned __int8 v1 = this;
  char v5 = (char)this;
  if (CSStore2::getAttributedStringWithCharacter(char)::once != -1) {
    dispatch_once(&CSStore2::getAttributedStringWithCharacter(char)::once, &__block_literal_global_12);
  }
  id v2 = (id)CSStore2::getAttributedStringWithCharacter(char)::attributedStrings[v1];
  if (!v2)
  {
    long long v3 = (void *)[[NSString alloc] initWithBytes:&v5 length:1 encoding:1];
    if (v3) {
      id v2 = (id)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v3];
    }
    else {
      id v2 = 0;
    }
  }

  return v2;
}

void sub_1A7DBE120(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN8CSStore2L32getAttributedStringWithCharacterEc_block_invoke()
{
  uint64_t v0 = 0;
  uint64_t v1 = MEMORY[0x1E4F14390];
  do
  {
    char v6 = v0;
    if (v0 - 9 < 2 || (*(_DWORD *)(v1 + 4 * v0 + 60) & 0x40000) != 0)
    {
      long long v3 = (void *)[[NSString alloc] initWithBytes:&v6 length:1 encoding:1];
      if (v3)
      {
        uint64_t v4 = [objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v3];
        char v5 = (void *)CSStore2::getAttributedStringWithCharacter(char)::attributedStrings[v0];
        CSStore2::getAttributedStringWithCharacter(char)::attributedStrings[v0] = v4;
      }
    }
    ++v0;
  }
  while (v0 != 127);
}

void sub_1A7DBE1F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t CSStore2::AttributedStringWriter::Impl::createMarker(CSStore2::AttributedStringWriter::Impl *this, NSAttributedString *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  *(void *)uu = 0;
  uint64_t v11 = 0;
  MEMORY[0x1AD0DB5A0](uu);
  memset(v9, 0, sizeof(v9));
  uuid_unparse(uu, v9);
  v9[36] = 0;
  uint64_t v4 = [NSString stringWithUTF8String:v9];
  if (!*((void *)this + 2))
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    char v6 = (void *)*((void *)this + 2);
    *((void *)this + 2) = v5;
  }
  id v7 = (void *)[(NSAttributedString *)a2 copy];
  [*((id *)this + 2) setObject:v7 forKeyedSubscript:v4];

  return v4;
}

void sub_1A7DBE2EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NSAttributedString *CSStore2::AttributedStringWriter::Impl::applyAttributesToAttributedString(CSStore2::AttributedStringWriter::Impl *this, NSAttributedString *a2, char a3)
{
  if (!a2) {
    goto LABEL_17;
  }
  if (*((void *)this + 4) == *((void *)this + 5))
  {
    id v11 = 0;
  }
  else
  {
    char v6 = (void *)[(NSAttributedString *)a2 mutableCopy];
    uint64_t v7 = [v6 length];
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:(uint64_t)(*((void *)this + 5) - *((void *)this + 4)) >> 4];
    uint64_t v9 = (void *)*((void *)this + 4);
    uint64_t v10 = (void *)*((void *)this + 5);
    while (v9 != v10)
    {
      if (*v9)
      {
        if (v9[1]) {
          objc_msgSend(v8, "setObject:forKeyedSubscript:");
        }
      }
      v9 += 2;
    }
    objc_msgSend(v6, "addAttributes:range:", v8, 0, v7);

    id v11 = v6;
  }
  if ([*((id *)this + 2) count] && -[NSAttributedString length](a2, "length") >= 0x24)
  {
    if (!v11) {
      id v11 = (id)[(NSAttributedString *)a2 mutableCopy];
    }
    uint64_t v12 = (void *)[*((id *)this + 2) copy];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = ___ZN8CSStore222AttributedStringWriter4Impl33applyAttributesToAttributedStringEP18NSAttributedStringb_block_invoke;
    v15[3] = &unk_1E5D2A358;
    uint64_t v17 = this;
    id v11 = v11;
    id v16 = v11;
    char v18 = a3;
    [v12 enumerateKeysAndObjectsUsingBlock:v15];
  }
  uint64_t v13 = (NSAttributedString *)[v11 copy];

  if (!v13) {
LABEL_17:
  }
    uint64_t v13 = a2;

  return v13;
}

void sub_1A7DBE4C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void ___ZN8CSStore222AttributedStringWriter4Impl33applyAttributesToAttributedStringEP18NSAttributedStringb_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) length];
  uint64_t v7 = 0;
  for (char i = 0; ; char i = 1)
  {
    uint64_t v9 = [*(id *)(a1 + 32) string];
    uint64_t v7 = objc_msgSend(v9, "rangeOfString:options:range:", a2, 0, v7, objc_msgSend(*(id *)(a1 + 32), "length") - v7);
    uint64_t v11 = v10;

    if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    objc_msgSend(*(id *)(a1 + 32), "replaceCharactersInRange:withAttributedString:", v7, v11, a3);
  }
  if ((i & 1) != 0 && *(unsigned char *)(a1 + 48))
  {
    uint64_t v12 = *(void **)(v6 + 16);
    [v12 setObject:0 forKeyedSubscript:a2];
  }
}

void sub_1A7DBE60C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id CSStore2::AttributedStringWriter::Impl::getDateFormatter(CSStore2::AttributedStringWriter::Impl *this)
{
  if (*((void *)this + 3))
  {
    id v2 = CSStore2::AttributedStringWriter::Impl::getDateFormatter(void)const::$_0::operator()();
    [v2 setLocale:*((void *)this + 3)];
    return v2;
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___ZNK8CSStore222AttributedStringWriter4Impl16getDateFormatterEv_block_invoke;
    block[3] = &__block_descriptor_33_e5_v8__0l;
    if (CSStore2::AttributedStringWriter::Impl::getDateFormatter(void)const::once != -1) {
      dispatch_once(&CSStore2::AttributedStringWriter::Impl::getDateFormatter(void)const::once, block);
    }
    uint64_t v4 = (void *)CSStore2::AttributedStringWriter::Impl::getDateFormatter(void)const::df;
    return v4;
  }
}

void sub_1A7DBE708(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id CSStore2::AttributedStringWriter::Impl::getDateFormatter(void)const::$_0::operator()()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v0 setDateStyle:1];
  [v0 setTimeStyle:1];
  uint64_t v1 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
  [v0 setTimeZone:v1];

  id v2 = [MEMORY[0x1E4F1CA20] systemLocale];
  [v0 setLocale:v2];

  return v0;
}

void sub_1A7DBE7B4(_Unwind_Exception *a1)
{
  long long v3 = v2;

  _Unwind_Resume(a1);
}

void ___ZNK8CSStore222AttributedStringWriter4Impl16getDateFormatterEv_block_invoke()
{
  uint64_t v0 = CSStore2::AttributedStringWriter::Impl::getDateFormatter(void)const::$_0::operator()();
  uint64_t v1 = (void *)CSStore2::AttributedStringWriter::Impl::getDateFormatter(void)const::df;
  CSStore2::AttributedStringWriter::Impl::getDateFormatter(void)const::df = v0;
}

id CSStore2::AttributedStringWriter::Impl::getDateComponentsFormatter(id *this)
{
  if (this[3])
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F28C00]);
    [v2 setAllowsFractionalUnits:1];
    [v2 setUnitsStyle:5];
    [v2 setCollapsesLargestUnit:1];
    long long v3 = (void *)MEMORY[0x1E4F1C9A8];
    uint64_t v4 = [this[3] calendarIdentifier];
    id v5 = [v3 calendarWithIdentifier:v4];

    if (v5)
    {
      [v5 setLocale:this[3]];
      [v2 setCalendar:v5];
    }

    return v2;
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___ZNK8CSStore222AttributedStringWriter4Impl26getDateComponentsFormatterEv_block_invoke;
    block[3] = &__block_descriptor_33_e5_v8__0l;
    if (CSStore2::AttributedStringWriter::Impl::getDateComponentsFormatter(void)const::once != -1) {
      dispatch_once(&CSStore2::AttributedStringWriter::Impl::getDateComponentsFormatter(void)const::once, block);
    }
    uint64_t v7 = (void *)CSStore2::AttributedStringWriter::Impl::getDateComponentsFormatter(void)const::dcf;
    return v7;
  }
}

void sub_1A7DBE960(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZNK8CSStore222AttributedStringWriter4Impl26getDateComponentsFormatterEv_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C00]);
  [v0 setAllowsFractionalUnits:1];
  [v0 setUnitsStyle:5];
  [v0 setCollapsesLargestUnit:1];
  uint64_t v1 = (void *)CSStore2::AttributedStringWriter::Impl::getDateComponentsFormatter(void)const::dcf;
  CSStore2::AttributedStringWriter::Impl::getDateComponentsFormatter(void)const::dcf = (uint64_t)v0;
}

void sub_1A7DBE9F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

CSStore2::AttributedStringWriter *CSStore2::AttributedStringWriter::AttributedStringWriter(CSStore2::AttributedStringWriter *this, __CSStore *a2, NSMutableAttributedString *a3)
{
  *(void *)this = &unk_1EFE40808;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *(_OWORD *)((char *)this + 184) = 0u;
  *(_OWORD *)((char *)this + 200) = 0u;
  *(_OWORD *)((char *)this + 216) = 0u;
  *(_OWORD *)((char *)this + 232) = 0u;
  *(_OWORD *)((char *)this + 8) = 0u;
  *((void *)this + 31) = CSStore2::AttributedStringWriter::Impl::Impl((CSStore2::AttributedStringWriter *)((char *)this + 8), a2, a3);
  return this;
}

{
  *(void *)this = &unk_1EFE40808;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *(_OWORD *)((char *)this + 184) = 0u;
  *(_OWORD *)((char *)this + 200) = 0u;
  *(_OWORD *)((char *)this + 216) = 0u;
  *(_OWORD *)((char *)this + 232) = 0u;
  *(_OWORD *)((char *)this + 8) = 0u;
  *((void *)this + 31) = CSStore2::AttributedStringWriter::Impl::Impl((CSStore2::AttributedStringWriter *)((char *)this + 8), a2, a3);
  return this;
}

CSStore2::AttributedStringWriter *CSStore2::AttributedStringWriter::AttributedStringWriter(CSStore2::AttributedStringWriter *this, const CSStore2::AttributedStringWriter *a2)
{
  *(void *)this = &unk_1EFE40808;
  *(_OWORD *)((char *)this + 8) = 0u;
  id v5 = (char *)this + 8;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *(_OWORD *)((char *)this + 184) = 0u;
  *(_OWORD *)((char *)this + 200) = 0u;
  *(_OWORD *)((char *)this + 216) = 0u;
  *(_OWORD *)((char *)this + 232) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  uint64_t v6 = (void *)((char *)this + 40);
  unint64_t v7 = *((void *)a2 + 31);
  *((void *)this + 1) = *(id *)v7;
  *((void *)this + 2) = *(id *)(v7 + 8);
  *((void *)this + 3) = *(id *)(v7 + 16);
  *((void *)this + 4) = *(id *)(v7 + 24);
  *uint64_t v6 = 0;
  *((void *)this + 6) = 0;
  *((void *)this + 7) = 0;
  id v8 = *(long long **)(v7 + 32);
  uint64_t v9 = *(long long **)(v7 + 40);
  if (v9 != v8)
  {
    _ZNSt3__16vectorINS_4pairIP8NSStringP11objc_objectEENS_9allocatorIS8_EEE11__vallocateB8nn180100Em(v6, v9 - v8);
    uint64_t v10 = (_OWORD *)*((void *)this + 6);
    do
    {
      long long v11 = *v8++;
      *v10++ = v11;
    }
    while (v8 != v9);
    *((void *)this + 6) = v10;
  }
  id v12 = *(id *)(v7 + 56);
  uint64_t v13 = *(void *)(v7 + 64);
  *((_OWORD *)this + 5) = 0u;
  char v14 = (uint64_t *)((char *)this + 80);
  *((void *)this + 8) = v12;
  *((void *)this + 9) = v13;
  *((_OWORD *)this + 6) = 0u;
  *((_DWORD *)this + 28) = *(_DWORD *)(v7 + 104);
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__rehash<true>((uint64_t)this + 80, *(void *)(v7 + 80));
  char v55 = v5;
  unint64_t v56 = v7;
  BOOL v15 = *(void **)(v7 + 88);
  if (v15)
  {
    id v16 = (void *)((char *)this + 96);
    do
    {
      unint64_t v2 = v15[2];
      unint64_t v17 = *((void *)this + 11);
      if (v17)
      {
        uint8x8_t v18 = (uint8x8_t)vcnt_s8((int8x8_t)v17);
        v18.i16[0] = vaddlv_u8(v18);
        if (v18.u32[0] > 1uLL)
        {
          unint64_t v7 = v15[2];
          if (v2 >= v17) {
            unint64_t v7 = v2 % v17;
          }
        }
        else
        {
          unint64_t v7 = (v17 - 1) & v2;
        }
        unint64_t v19 = *(void **)(*v14 + 8 * v7);
        if (v19)
        {
          for (char i = (void *)*v19; i; char i = (void *)*i)
          {
            unint64_t v21 = i[1];
            if (v21 == v2)
            {
              if (i[2] == v2) {
                goto LABEL_45;
              }
            }
            else
            {
              if (v18.u32[0] > 1uLL)
              {
                if (v21 >= v17) {
                  v21 %= v17;
                }
              }
              else
              {
                v21 &= v17 - 1;
              }
              if (v21 != v7) {
                break;
              }
            }
          }
        }
      }
      unint64_t v22 = operator new(0x20uLL);
      void *v22 = 0;
      v22[1] = v2;
      uint64_t v23 = (void *)v15[3];
      void v22[2] = v15[2];
      v22[3] = v23;
      float v24 = (float)(unint64_t)(*((void *)this + 13) + 1);
      float v25 = *((float *)this + 28);
      if (!v17 || (float)(v25 * (float)v17) < v24)
      {
        BOOL v26 = (v17 & (v17 - 1)) != 0;
        if (v17 < 3) {
          BOOL v26 = 1;
        }
        unint64_t v27 = v26 | (2 * v17);
        unint64_t v28 = vcvtps_u32_f32(v24 / v25);
        if (v27 <= v28) {
          size_t v29 = v28;
        }
        else {
          size_t v29 = v27;
        }
        std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__rehash<true>((uint64_t)this + 80, v29);
        unint64_t v17 = *((void *)this + 11);
        if ((v17 & (v17 - 1)) != 0)
        {
          if (v2 >= v17) {
            unint64_t v7 = v2 % v17;
          }
          else {
            unint64_t v7 = v2;
          }
        }
        else
        {
          unint64_t v7 = (v17 - 1) & v2;
        }
      }
      uint64_t v30 = *v14;
      unsigned int v31 = *(void **)(*v14 + 8 * v7);
      if (v31)
      {
        void *v22 = *v31;
      }
      else
      {
        void *v22 = *v16;
        *id v16 = v22;
        *(void *)(v30 + 8 * v7) = v16;
        if (!*v22) {
          goto LABEL_44;
        }
        unint64_t v32 = *(void *)(*v22 + 8);
        if ((v17 & (v17 - 1)) != 0)
        {
          if (v32 >= v17) {
            v32 %= v17;
          }
        }
        else
        {
          v32 &= v17 - 1;
        }
        unsigned int v31 = (void *)(*v14 + 8 * v32);
      }
      *unsigned int v31 = v22;
LABEL_44:
      ++*((void *)this + 13);
LABEL_45:
      BOOL v15 = (void *)*v15;
    }
    while (v15);
  }
  int v54 = a2;
  *(_OWORD *)((char *)this + 120) = 0u;
  unint64_t v33 = (uint64_t *)((char *)this + 120);
  *(_OWORD *)((char *)this + 136) = 0u;
  *((_DWORD *)this + 38) = *(_DWORD *)(v56 + 144);
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__rehash<true>((uint64_t)this + 120, *(void *)(v56 + 120));
  unsigned int v34 = *(void **)(v56 + 128);
  if (v34)
  {
    BOOL v35 = (void *)((char *)this + 136);
    unint64_t v36 = *((void *)this + 16);
    do
    {
      unint64_t v37 = v34[2];
      if (v36)
      {
        uint8x8_t v38 = (uint8x8_t)vcnt_s8((int8x8_t)v36);
        v38.i16[0] = vaddlv_u8(v38);
        if (v38.u32[0] > 1uLL)
        {
          unint64_t v2 = v34[2];
          if (v37 >= v36) {
            unint64_t v2 = v37 % v36;
          }
        }
        else
        {
          unint64_t v2 = (v36 - 1) & v37;
        }
        uint64_t v39 = *(void **)(*v33 + 8 * v2);
        if (v39)
        {
          for (char j = (void *)*v39; j; char j = (void *)*j)
          {
            unint64_t v41 = j[1];
            if (v41 == v37)
            {
              if (j[2] == v37) {
                goto LABEL_86;
              }
            }
            else
            {
              if (v38.u32[0] > 1uLL)
              {
                if (v41 >= v36) {
                  v41 %= v36;
                }
              }
              else
              {
                v41 &= v36 - 1;
              }
              if (v41 != v2) {
                break;
              }
            }
          }
        }
      }
      unint64_t v42 = operator new(0x20uLL);
      *unint64_t v42 = 0;
      v42[1] = v37;
      *((_OWORD *)v42 + 1) = *((_OWORD *)v34 + 1);
      float v43 = (float)(unint64_t)(*((void *)this + 18) + 1);
      float v44 = *((float *)this + 38);
      if (!v36 || (float)(v44 * (float)v36) < v43)
      {
        BOOL v45 = (v36 & (v36 - 1)) != 0;
        if (v36 < 3) {
          BOOL v45 = 1;
        }
        unint64_t v46 = v45 | (2 * v36);
        unint64_t v47 = vcvtps_u32_f32(v43 / v44);
        if (v46 <= v47) {
          size_t v48 = v47;
        }
        else {
          size_t v48 = v46;
        }
        std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__rehash<true>((uint64_t)this + 120, v48);
        unint64_t v36 = *((void *)this + 16);
        if ((v36 & (v36 - 1)) != 0)
        {
          if (v37 >= v36) {
            unint64_t v2 = v37 % v36;
          }
          else {
            unint64_t v2 = v37;
          }
        }
        else
        {
          unint64_t v2 = (v36 - 1) & v37;
        }
      }
      uint64_t v49 = *v33;
      unsigned int v50 = *(void **)(*v33 + 8 * v2);
      if (v50)
      {
        *unint64_t v42 = *v50;
      }
      else
      {
        *unint64_t v42 = *v35;
        void *v35 = v42;
        *(void *)(v49 + 8 * v2) = v35;
        if (!*v42) {
          goto LABEL_85;
        }
        unint64_t v51 = *(void *)(*v42 + 8);
        if ((v36 & (v36 - 1)) != 0)
        {
          if (v51 >= v36) {
            v51 %= v36;
          }
        }
        else
        {
          v51 &= v36 - 1;
        }
        unsigned int v50 = (void *)(*v33 + 8 * v51);
      }
      *unsigned int v50 = v42;
LABEL_85:
      ++*((void *)this + 18);
LABEL_86:
      unsigned int v34 = (void *)*v34;
    }
    while (v34);
  }
  *((_WORD *)this + 80) = *(_WORD *)(v56 + 152);
  *((void *)this + 21) = *(id *)(v56 + 160);
  char v52 = *(unsigned char *)(v56 + 170);
  *((_WORD *)this + 88) = *(_WORD *)(v56 + 168);
  *((unsigned char *)this + 178) = v52;
  *((void *)this + 31) = v55;
  if (this == v54) {
    __assert_rtn("AttributedStringWriter", "CSAttributedStringWriter.mm", 389, "this != &other");
  }
  return this;
}

void sub_1A7DBF0A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long,NSString * {__strong}>,void *>>>::operator()[abi:nn180100](char a1, id *a2)
{
  if (a1)
  {
  }
  else if (!a2)
  {
    return;
  }

  operator delete(a2);
}

char *_ZNSt3__16vectorINS_4pairIP8NSStringP11objc_objectEENS_9allocatorIS8_EEE11__vallocateB8nn180100Em(void *a1, unint64_t a2)
{
  if (a2 >> 60) {
    abort();
  }
  __n128 result = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<NSString *,objc_object *>>>(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<NSString *,objc_object *>>>(unint64_t a1)
{
  if (a1 >> 60) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(16 * a1);
}

uint64_t CSStore2::AttributedStringWriter::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    uint64_t v3 = *(void *)(a2 + 248);
    uint64_t v4 = *(void *)(a1 + 248);
    objc_storeStrong((id *)v4, *(id *)v3);
    objc_storeStrong((id *)(v4 + 8), *(id *)(v3 + 8));
    objc_storeStrong((id *)(v4 + 16), *(id *)(v3 + 16));
    objc_storeStrong((id *)(v4 + 24), *(id *)(v3 + 24));
    if (v4 == v3)
    {
      objc_storeStrong((id *)(v4 + 56), *(id *)(v3 + 56));
      *(void *)(v4 + 64) = *(void *)(v3 + 64);
    }
    else
    {
      id v5 = *(char **)(v4 + 32);
      unint64_t v7 = *(char **)(v3 + 32);
      uint64_t v6 = *(char **)(v3 + 40);
      unint64_t v8 = (v6 - v7) >> 4;
      uint64_t v9 = *(void *)(v4 + 48);
      if (v8 <= (v9 - (uint64_t)v5) >> 4)
      {
        id v12 = *(char **)(v4 + 40);
        unint64_t v16 = (v12 - v5) >> 4;
        if (v16 >= v8)
        {
          unint64_t v22 = *(char **)(v4 + 32);
          while (v7 != v6)
          {
            long long v23 = *(_OWORD *)v7;
            v7 += 16;
            *(_OWORD *)unint64_t v22 = v23;
            v22 += 16;
          }
          BOOL v15 = (char *)(v22 - v5);
          id v12 = v5;
        }
        else
        {
          unint64_t v17 = &v7[16 * v16];
          if (v12 != v5)
          {
            uint64_t v18 = 16 * v16;
            do
            {
              long long v19 = *(_OWORD *)v7;
              v7 += 16;
              *(_OWORD *)id v5 = v19;
              v5 += 16;
              v18 -= 16;
            }
            while (v18);
          }
          unint64_t v20 = v12;
          while (v17 != v6)
          {
            long long v21 = *(_OWORD *)v17;
            v17 += 16;
            *(_OWORD *)unint64_t v20 = v21;
            v20 += 16;
          }
          BOOL v15 = (char *)(v20 - v12);
        }
      }
      else
      {
        if (v5)
        {
          *(void *)(v4 + 40) = v5;
          operator delete(v5);
          uint64_t v9 = 0;
          *(void *)(v4 + 32) = 0;
          *(void *)(v4 + 40) = 0;
          *(void *)(v4 + 48) = 0;
        }
        if (v6 - v7 < 0) {
          abort();
        }
        uint64_t v10 = v9 >> 3;
        if (v9 >> 3 <= v8) {
          uint64_t v10 = (v6 - v7) >> 4;
        }
        if ((unint64_t)v9 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v11 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v11 = v10;
        }
        _ZNSt3__16vectorINS_4pairIP8NSStringP11objc_objectEENS_9allocatorIS8_EEE11__vallocateB8nn180100Em((void *)(v4 + 32), v11);
        id v12 = *(char **)(v4 + 40);
        uint64_t v13 = v12;
        if (v7 != v6)
        {
          uint64_t v13 = *(char **)(v4 + 40);
          do
          {
            long long v14 = *(_OWORD *)v7;
            v7 += 16;
            *(_OWORD *)uint64_t v13 = v14;
            v13 += 16;
          }
          while (v7 != v6);
        }
        BOOL v15 = (char *)(v13 - v12);
      }
      *(void *)(v4 + 40) = &v15[(void)v12];
      objc_storeStrong((id *)(v4 + 56), *(id *)(v3 + 56));
      *(void *)(v4 + 64) = *(void *)(v3 + 64);
      if (v4 != v3)
      {
        *(_DWORD *)(v4 + 104) = *(_DWORD *)(v3 + 104);
        float v24 = *(void **)(v3 + 88);
        uint64_t v25 = *(void *)(v4 + 80);
        if (v25)
        {
          for (uint64_t i = 0; i != v25; ++i)
            *(void *)(*(void *)(v4 + 72) + 8 * i) = 0;
          unint64_t v27 = *(id **)(v4 + 88);
          *(void *)(v4 + 88) = 0;
          *(void *)(v4 + 96) = 0;
          if (v27) {
            BOOL v28 = v24 == 0;
          }
          else {
            BOOL v28 = 1;
          }
          if (v28)
          {
            size_t v29 = v27;
          }
          else
          {
            do
            {
              uint64_t v30 = (void *)v24[3];
              void v27[2] = (id)v24[2];
              objc_storeStrong(v27 + 3, v30);
              size_t v29 = (id *)*v27;
              unint64_t v31 = (unint64_t)v27[2];
              v27[1] = (id)v31;
              inserted = std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__node_insert_multi_prepare(v4 + 72, v31, v27 + 2);
              std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__node_insert_multi_perform((void *)(v4 + 72), v27, inserted);
              float v24 = (void *)*v24;
              if (v29) {
                BOOL v33 = v24 == 0;
              }
              else {
                BOOL v33 = 1;
              }
              unint64_t v27 = v29;
            }
            while (!v33);
          }
          std::__hash_table<std::__hash_value_type<unsigned long,NSString * {__strong}>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,NSString * {__strong}>>>::__deallocate_node(v29);
        }
        for (; v24; float v24 = (void *)*v24)
        {
          unsigned int v34 = operator new(0x20uLL);
          *unsigned int v34 = 0;
          BOOL v35 = (void *)v24[3];
          v34[2] = v24[2];
          v34[3] = v35;
          unint64_t v36 = v34[2];
          v34[1] = v36;
          unint64_t v37 = std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__node_insert_multi_prepare(v4 + 72, v36, v34 + 2);
          std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__node_insert_multi_perform((void *)(v4 + 72), v34, v37);
        }
        *(_DWORD *)(v4 + 144) = *(_DWORD *)(v3 + 144);
        uint8x8_t v38 = *(uint64_t **)(v3 + 128);
        uint64_t v39 = *(void *)(v4 + 120);
        if (!v39) {
          goto LABEL_55;
        }
        for (uint64_t j = 0; j != v39; *(void *)(*(void *)(v4 + 112) + 8 * j++) = 0)
          ;
        unint64_t v41 = *(uint64_t **)(v4 + 128);
        *(void *)(v4 + 128) = 0;
        *(void *)(v4 + 136) = 0;
        if (v41)
        {
          while (v38)
          {
            unint64_t v42 = v38[2];
            v41[2] = v42;
            *((_DWORD *)v41 + 6) = *((_DWORD *)v38 + 6);
            float v43 = (uint64_t *)*v41;
            v41[1] = v42;
            float v44 = std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__node_insert_multi_prepare(v4 + 112, v42, v41 + 2);
            std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__node_insert_multi_perform((void *)(v4 + 112), v41, v44);
            uint8x8_t v38 = (uint64_t *)*v38;
            unint64_t v41 = v43;
            if (!v43) {
              goto LABEL_55;
            }
          }
          do
          {
            unsigned int v50 = (uint64_t *)*v41;
            operator delete(v41);
            unint64_t v41 = v50;
          }
          while (v50);
        }
        else
        {
LABEL_55:
          while (v38)
          {
            BOOL v45 = operator new(0x20uLL);
            void *v45 = 0;
            *((_OWORD *)v45 + 1) = *((_OWORD *)v38 + 1);
            unint64_t v46 = v45[2];
            v45[1] = v46;
            unint64_t v47 = std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__node_insert_multi_prepare(v4 + 112, v46, v45 + 2);
            std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__node_insert_multi_perform((void *)(v4 + 112), v45, v47);
            uint8x8_t v38 = (uint64_t *)*v38;
          }
        }
      }
    }
    *(_WORD *)(v4 + 152) = *(_WORD *)(v3 + 152);
    objc_storeStrong((id *)(v4 + 160), *(id *)(v3 + 160));
    __int16 v48 = *(_WORD *)(v3 + 168);
    *(unsigned char *)(v4 + 170) = *(unsigned char *)(v3 + 170);
    *(_WORD *)(v4 + 168) = v48;
  }
  return a1;
}

void sub_1A7DBF5C8(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__node_insert_multi_prepare(uint64_t a1, unint64_t a2, void *a3)
{
  unint64_t v6 = *(void *)(a1 + 8);
  float v7 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v8 = *(float *)(a1 + 32);
  if (!v6 || (float)(v8 * (float)v6) < v7)
  {
    BOOL v9 = 1;
    if (v6 >= 3) {
      BOOL v9 = (v6 & (v6 - 1)) != 0;
    }
    unint64_t v10 = v9 | (2 * v6);
    unint64_t v11 = vcvtps_u32_f32(v7 / v8);
    if (v10 <= v11) {
      int8x8_t prime = (int8x8_t)v11;
    }
    else {
      int8x8_t prime = (int8x8_t)v10;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v6 = *(void *)(a1 + 8);
    }
    if (*(void *)&prime > v6) {
      goto LABEL_74;
    }
    if (*(void *)&prime >= v6) {
      goto LABEL_43;
    }
    unint64_t v19 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (v6 < 3 || (uint8x8_t v20 = (uint8x8_t)vcnt_s8((int8x8_t)v6), v20.i16[0] = vaddlv_u8(v20), v20.u32[0] > 1uLL))
    {
      unint64_t v19 = std::__next_prime(v19);
    }
    else
    {
      uint64_t v21 = 1 << -(char)__clz(v19 - 1);
      if (v19 >= 2) {
        unint64_t v19 = v21;
      }
    }
    if (*(void *)&prime <= v19) {
      int8x8_t prime = (int8x8_t)v19;
    }
    if (*(void *)&prime >= v6)
    {
      unint64_t v6 = *(void *)(a1 + 8);
      goto LABEL_43;
    }
    if (prime)
    {
LABEL_74:
      if (*(void *)&prime >> 61) {
        std::__throw_bad_array_new_length[abi:nn180100]();
      }
      uint64_t v13 = operator new(8 * *(void *)&prime);
      long long v14 = *(void **)a1;
      *(void *)a1 = v13;
      if (v14) {
        operator delete(v14);
      }
      uint64_t v15 = 0;
      *(int8x8_t *)(a1 + 8) = prime;
      do
        *(void *)(*(void *)a1 + 8 * v15++) = 0;
      while (*(void *)&prime != v15);
      unint64_t v16 = *(void **)(a1 + 16);
      if (v16)
      {
        unint64_t v17 = v16[1];
        uint8x8_t v18 = (uint8x8_t)vcnt_s8(prime);
        v18.i16[0] = vaddlv_u8(v18);
        if (v18.u32[0] > 1uLL)
        {
          if (v17 >= *(void *)&prime) {
            v17 %= *(void *)&prime;
          }
        }
        else
        {
          v17 &= *(void *)&prime - 1;
        }
        *(void *)(*(void *)a1 + 8 * v17) = a1 + 16;
        for (uint64_t i = (void *)*v16; *v16; uint64_t i = (void *)*v16)
        {
          unint64_t v23 = i[1];
          if (v18.u32[0] > 1uLL)
          {
            if (v23 >= *(void *)&prime) {
              v23 %= *(void *)&prime;
            }
          }
          else
          {
            v23 &= *(void *)&prime - 1;
          }
          if (v23 == v17)
          {
            unint64_t v16 = i;
          }
          else
          {
            float v24 = i;
            if (*(void *)(*(void *)a1 + 8 * v23))
            {
              do
              {
                uint64_t v25 = v24;
                float v24 = (void *)*v24;
              }
              while (v24 && i[2] == v24[2]);
              *unint64_t v16 = v24;
              *uint64_t v25 = **(void **)(*(void *)a1 + 8 * v23);
              **(void **)(*(void *)a1 + 8 * v23) = i;
            }
            else
            {
              *(void *)(*(void *)a1 + 8 * v23) = v16;
              unint64_t v16 = i;
              unint64_t v17 = v23;
            }
          }
        }
      }
      unint64_t v6 = (unint64_t)prime;
    }
    else
    {
      BOOL v35 = *(void **)a1;
      *(void *)a1 = 0;
      if (v35) {
        operator delete(v35);
      }
      unint64_t v6 = 0;
      *(void *)(a1 + 8) = 0;
    }
  }
LABEL_43:
  uint8x8_t v26 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
  v26.i16[0] = vaddlv_u8(v26);
  if (v26.u32[0] > 1uLL)
  {
    unint64_t v27 = a2;
    if (v6 <= a2) {
      unint64_t v27 = a2 % v6;
    }
  }
  else
  {
    unint64_t v27 = (v6 - 1) & a2;
  }
  BOOL v28 = *(void **)(*(void *)a1 + 8 * v27);
  if (!v28) {
    return 0;
  }
  int v29 = 0;
  do
  {
    __n128 result = v28;
    BOOL v28 = (void *)*v28;
    if (!v28) {
      break;
    }
    unint64_t v31 = v28[1];
    if (v26.u32[0] > 1uLL)
    {
      unint64_t v32 = v28[1];
      if (v31 >= v6) {
        unint64_t v32 = v31 % v6;
      }
    }
    else
    {
      unint64_t v32 = v31 & (v6 - 1);
    }
    if (v32 != v27) {
      break;
    }
    BOOL v33 = v31 == a2 && v28[2] == *a3;
    int v34 = v29 & !v33;
    v29 |= v33;
  }
  while (v34 != 1);
  return result;
}

void *std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__node_insert_multi_perform(void *result, void *a2, void *a3)
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
  if (!a3)
  {
    *a2 = result[2];
    result[2] = a2;
    *(void *)(*result + 8 * v4) = result + 2;
    if (!*a2) {
      goto LABEL_19;
    }
    unint64_t v6 = *(void *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(void *)&v3) {
        v6 %= *(void *)&v3;
      }
    }
    else
    {
      v6 &= *(void *)&v3 - 1;
    }
LABEL_18:
    *(void *)(*result + 8 * v6) = a2;
    goto LABEL_19;
  }
  *a2 = *a3;
  *a3 = a2;
  if (*a2)
  {
    unint64_t v6 = *(void *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(void *)&v3) {
        v6 %= *(void *)&v3;
      }
    }
    else
    {
      v6 &= *(void *)&v3 - 1;
    }
    if (v6 != v4) {
      goto LABEL_18;
    }
  }
LABEL_19:
  ++result[3];
  return result;
}

void CSStore2::AttributedStringWriter::attributedString(CSStore2::AttributedStringWriter::Impl **this, NSAttributedString *a2)
{
  int8x8_t v3 = a2;
  unint64_t v4 = (void *)MEMORY[0x1AD0DB160]();
  CSStore2::AttributedStringWriter::Impl::applyAttributesToAttributedString(this[31], v3, 1);
  uint8x8_t v5 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();

  CSStore2::AttributedStringWriter::Impl::attributedString((id *)this[31], v5);
}

void sub_1A7DBFAB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void CSStore2::AttributedStringWriter::attributedString(CSStore2::AttributedStringWriter *this, NSAttributedString *a2, NSAttributedString *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint8x8_t v5 = a2;
  unint64_t v6 = a3;
  float v7 = (void *)MEMORY[0x1AD0DB160]();
  if (*(unsigned char *)(*((void *)this + 31) + 168))
  {
    if (![(NSAttributedString *)v6 length])
    {
      CSStore2::getLog(0);
      float v8 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v8->super, OS_LOG_TYPE_DEBUG))
      {
        BOOL v9 = [(NSAttributedString *)v6 string];
        unint64_t v10 = [(NSAttributedString *)v5 string];
        *(_DWORD *)buf = 138478083;
        unint64_t v36 = v9;
        __int16 v37 = 2114;
        uint8x8_t v38 = v10;
        _os_log_debug_impl(&dword_1A7DB2000, &v8->super, OS_LOG_TYPE_DEBUG, "Eliding value \"%{private}@\" for title \"%{public}@\"", buf, 0x16u);
      }
      goto LABEL_29;
    }
  }
  else if (![(NSAttributedString *)v6 length])
  {
    uint64_t v11 = CSStore2::getAttributedStringWithCharacter((CSStore2 *)0x23);

    unint64_t v6 = (NSAttributedString *)v11;
  }
  id v12 = (CSStore2 *)*((void *)this + 31);
  if (v5 && *((unsigned char *)v12 + 170))
  {
    CSStore2::getLog(v12);
    float v8 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v8->super, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = [(NSAttributedString *)v6 string];
      long long v14 = [(NSAttributedString *)v5 string];
      *(_DWORD *)buf = 138478083;
      unint64_t v36 = v13;
      __int16 v37 = 2114;
      uint8x8_t v38 = v14;
      _os_log_debug_impl(&dword_1A7DB2000, &v8->super, OS_LOG_TYPE_DEBUG, "Writing child unit with title -- eliding value \"%{private}@\" for title \"%{public}@\"", buf, 0x16u);
    }
  }
  else
  {
    CSStore2::AttributedStringWriter::Impl::applyAttributesToAttributedString(v12, v5, 0);
    uint64_t v15 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();

    CSStore2::AttributedStringWriter::Impl::applyAttributesToAttributedString(*((CSStore2::AttributedStringWriter::Impl **)this + 31), v6, 1);
    unint64_t v16 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();

    if ([(NSAttributedString *)v15 length])
    {
      id v17 = objc_alloc(MEMORY[0x1E4F28B18]);
      uint8x8_t v18 = [(NSAttributedString *)v15 string];
      BOOL v33 = @"_CSVOutputType";
      int v34 = &unk_1EFE43410;
      unint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      uint8x8_t v5 = (NSAttributedString *)[v17 initWithString:v18 attributes:v19];
    }
    else
    {
      uint8x8_t v5 = v15;
    }
    uint8x8_t v20 = (void *)[(NSAttributedString *)v16 mutableCopy];
    uint64_t v21 = v20;
    if (v20)
    {
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = ___ZN8CSStore222AttributedStringWriter16attributedStringEP18NSAttributedStringS2__block_invoke;
      v31[3] = &unk_1E5D2A3A0;
      id v22 = v20;
      id v32 = v22;
      unint64_t v23 = (void *)MEMORY[0x1AD0DB340](v31);
      float v24 = (void *)MEMORY[0x1AD0DB160]();
      [(NSAttributedString *)v16 enumerateAttribute:@"_CSVOutputType", 0, [(NSAttributedString *)v16 length], 0x100000, v23 inRange options usingBlock];
      unint64_t v6 = (NSAttributedString *)v22;
    }
    else
    {
      unint64_t v6 = v16;
    }

    uint64_t v25 = (NSAttributedString *)objc_alloc_init(MEMORY[0x1E4F28E48]);
    float v8 = v25;
    if (v25)
    {
      if (v5) {
        [(NSAttributedString *)v25 appendAttributedString:v5];
      }
      if ([(NSAttributedString *)v5 length])
      {
        uint8x8_t v26 = CSStore2::getAttributedStringWithCharacter((CSStore2 *)0x3A);
        [(NSAttributedString *)v8 appendAttributedString:v26];
      }
      id v27 = objc_alloc_init(MEMORY[0x1E4F28E48]);
      if (v27)
      {
        if ([(NSAttributedString *)v5 length])
        {
          BOOL v28 = CSStore2::getAttributedStringWithCharacter((CSStore2 *)0x20);
          [v27 appendAttributedString:v28];
        }
        uint64_t v29 = [(NSAttributedString *)v8 length];
        if ((unint64_t)([v27 length] + v29) <= 0x1B)
        {
          CSStore2::getAttributedStringWithRepeatedCharacter((CSStore2 *)(28
                                                                        - ([(NSAttributedString *)v8 length]
          uint64_t v30 = + [v27 length])));
          [v27 appendAttributedString:v30];
        }
        objc_msgSend(v27, "addAttribute:value:range:", @"_CSVOutputType", &unk_1EFE43458, 0, objc_msgSend(v27, "length"));
        [(NSAttributedString *)v8 appendAttributedString:v27];
      }

      [(NSAttributedString *)v8 appendAttributedString:v6];
      CSStore2::AttributedStringWriter::Impl::attributedString(*((id **)this + 31), v8);
    }
  }
LABEL_29:
}

{
  NSAttributedString *v4;
  NSString *p_isa;
  uint64_t vars8;

  unint64_t v4 = a2;
  if (a2) {
    a2 = (NSAttributedString *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:a2];
  }
  p_isa = (NSString *)&a2->super.isa;
  CSStore2::AttributedStringWriter::attributedString(this, a2, a3);
  if (v4)
  {
  }
}

void sub_1A7DBFF88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id CSStore2::getLog(CSStore2 *this)
{
  if (CSStore2::getLog(void)::once != -1) {
    dispatch_once(&CSStore2::getLog(void)::once, &__block_literal_global_83);
  }
  uint64_t v1 = (void *)CSStore2::getLog(void)::result;

  return v1;
}

uint64_t ___ZN8CSStore222AttributedStringWriter16attributedStringEP18NSAttributedStringS2__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  if (!a2
    || ([a2 isEqual:&unk_1EFE43410] & 1) != 0
    || (uint64_t result = [a2 isEqual:&unk_1EFE43428], result))
  {
    BOOL v9 = *(void **)(a1 + 32);
    return objc_msgSend(v9, "addAttribute:value:range:", @"_CSVOutputType", &unk_1EFE43440, a3, a4);
  }
  return result;
}

id CSStore2::getAttributedStringWithRepeatedCharacter(CSStore2 *this)
{
  memset(&v8, 0, sizeof(v8));
  std::string::resize(&v8, (std::string::size_type)this + 1, 0);
  if (this)
  {
    if ((v8.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      unint64_t v2 = &v8;
    }
    else {
      unint64_t v2 = (std::string *)v8.__r_.__value_.__r.__words[0];
    }
    memset(v2, 32, (size_t)this);
  }
  id v3 = objc_alloc(MEMORY[0x1E4F28B18]);
  if ((v8.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    unint64_t v4 = &v8;
  }
  else {
    unint64_t v4 = (std::string *)v8.__r_.__value_.__r.__words[0];
  }
  uint8x8_t v5 = [NSString stringWithUTF8String:v4];
  unint64_t v6 = (void *)[v3 initWithString:v5];

  if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v8.__r_.__value_.__l.__data_);
  }

  return v6;
}

void sub_1A7DC0214(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void ___ZN8CSStore2L6getLogEv_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.coreservicesstore", "attrstrwriter");
  uint64_t v1 = (void *)CSStore2::getLog(void)::result;
  CSStore2::getLog(void)::uint64_t result = (uint64_t)v0;
}

uint64_t CSStore2::AttributedStringWriter::elidesEmptyValues(CSStore2::AttributedStringWriter *this)
{
  return *(unsigned __int8 *)(*((void *)this + 31) + 168);
}

void sub_1A7DC031C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  if (v10) {

  }
  _Unwind_Resume(exception_object);
}

void CSStore2::AttributedStringWriter::string(CSStore2::AttributedStringWriter *this, NSString *a2, NSString *a3)
{
  if (a2)
  {
    float v7 = (NSAttributedString *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:a2];
    if (a3)
    {
LABEL_3:
      unint64_t v6 = (NSAttributedString *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:a3];
      goto LABEL_6;
    }
  }
  else
  {
    float v7 = 0;
    if (a3) {
      goto LABEL_3;
    }
  }
  unint64_t v6 = 0;
LABEL_6:
  CSStore2::AttributedStringWriter::attributedString(this, v7, v6);
  if (a3) {

  }
  if (a2)
  {
  }
}

void sub_1A7DC03F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  if (v11) {

  }
  if (v10) {
  _Unwind_Resume(exception_object);
  }
}

void CSStore2::AttributedStringWriter::string(CSStore2::AttributedStringWriter::Impl **this, NSAttributedString *a2)
{
  unint64_t v2 = a2;
  if (a2) {
    a2 = (NSAttributedString *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:a2];
  }
  p_isa = (NSString *)&a2->super.isa;
  CSStore2::AttributedStringWriter::attributedString(this, a2);
  if (v2)
  {
  }
}

void sub_1A7DC0498(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  if (v10) {

  }
  _Unwind_Resume(exception_object);
}

void CSStore2::AttributedStringWriter::string(CSStore2::AttributedStringWriter *this, NSString *a2, unsigned int a3)
{
  id v3 = (uint64_t *)*((void *)this + 31);
  unint64_t v4 = (atomic_ullong *)*v3;
  if (*v3)
  {
    uint64_t v8 = _CSStringCopyCFString(*v3, a3);
    BOOL v9 = (void *)v8;
    if (!a3 || v8)
    {
      uint64_t UnitFromID = _CSStringGetUnitFromID((uint64_t)v4, a3);
      Stringatomic_ullong Table = _CSStoreGetStringTable(v4);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = ___ZN8CSStore222AttributedStringWriter6stringEP8NSStringj_block_invoke_2;
      v12[3] = &unk_1E5D2A3F0;
      long long v14 = this;
      v12[4] = a2;
      id v13 = v9;
      CSStore2::AttributedStringWriter::withReferenceToUnit((uint64_t)this, (uint64_t)StringTable, UnitFromID, (uint64_t)v12);
    }
    else
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = ___ZN8CSStore222AttributedStringWriter6stringEP8NSStringj_block_invoke;
      v15[3] = &unk_1E5D2A3C8;
      unsigned int v16 = a3;
      void v15[4] = a2;
      v15[5] = this;
      CSStore2::AttributedStringWriter::withWarningColors((uint64_t)this, (uint64_t)v15);
    }
  }
}

void sub_1A7DC0600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void ___ZN8CSStore222AttributedStringWriter6stringEP8NSStringj_block_invoke(uint64_t a1)
{
  unint64_t v2 = *(CSStore2::AttributedStringWriter **)(a1 + 40);
  id v3 = (NSString *)objc_msgSend([NSString alloc], "initWithFormat:", @"Could not find string unit %llx!", *(unsigned int *)(a1 + 48));
  CSStore2::AttributedStringWriter::string(v2, *(NSString **)(a1 + 32), v3);
}

void sub_1A7DC0698(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t CSStore2::AttributedStringWriter::withWarningColors(uint64_t a1, uint64_t a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = ___ZN8CSStore222AttributedStringWriter17withWarningColorsEU13block_pointerFvvE_block_invoke;
  v3[3] = &unk_1E5D2A8F0;
  v3[4] = a2;
  v3[5] = a1;
  return CSStore2::AttributedStringWriter::withAppliedAttribute(a1, @"_LSWarning", MEMORY[0x1E4F1CC38], (uint64_t)v3);
}

void ___ZN8CSStore222AttributedStringWriter6stringEP8NSStringj_block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 40)) {
    uint64_t v1 = *(__CFString **)(a1 + 40);
  }
  else {
    uint64_t v1 = &stru_1EFE413F8;
  }
  CSStore2::AttributedStringWriter::string(*(CSStore2::AttributedStringWriter **)(a1 + 48), *(NSString **)(a1 + 32), &v1->isa);
}

void CSStore2::AttributedStringWriter::withReferenceToUnit(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t add = atomic_fetch_add(CSStore2::currentBackrefDepth, 1u);
  id v10 = (id)objc_msgSend([NSString alloc], "initWithFormat:", @"_CSbr%u", add);
  BOOL v9 = +[_CSVisualizer URLForUnit:a3 inTable:a2];
  CSStore2::AttributedStringWriter::withAppliedAttribute(a1, (uint64_t)v10, (uint64_t)v9, a4);
  atomic_fetch_add(CSStore2::currentBackrefDepth, 0xFFFFFFFF);
}

void sub_1A7DC0810(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t CSStore2::AttributedStringWriter::withAppliedAttribute(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *(void **)(a1 + 248);
  id v10 = (void *)v8[5];
  unint64_t v9 = v8[6];
  if ((unint64_t)v10 >= v9)
  {
    uint64_t v12 = v8[4];
    uint64_t v13 = ((uint64_t)v10 - v12) >> 4;
    unint64_t v14 = v13 + 1;
    if ((unint64_t)(v13 + 1) >> 60) {
      abort();
    }
    uint64_t v15 = v9 - v12;
    if (v15 >> 3 > v14) {
      unint64_t v14 = v15 >> 3;
    }
    if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v16 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v16 = v14;
    }
    id v17 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<NSString *,objc_object *>>>(v16);
    uint8x8_t v18 = &v17[16 * v13];
    uint8x8_t v20 = &v17[16 * v19];
    *(void *)uint8x8_t v18 = a2;
    *((void *)v18 + 1) = a3;
    uint64_t v11 = v18 + 16;
    id v22 = (char *)v8[4];
    uint64_t v21 = (char *)v8[5];
    if (v21 != v22)
    {
      do
      {
        *((_OWORD *)v18 - 1) = *((_OWORD *)v21 - 1);
        v18 -= 16;
        v21 -= 16;
      }
      while (v21 != v22);
      uint64_t v21 = (char *)v8[4];
    }
    void v8[4] = v18;
    v8[5] = v11;
    v8[6] = v20;
    if (v21) {
      operator delete(v21);
    }
  }
  else
  {
    *id v10 = a2;
    v10[1] = a3;
    uint64_t v11 = v10 + 2;
  }
  v8[5] = v11;
  uint64_t result = (*(uint64_t (**)(uint64_t))(a4 + 16))(a4);
  *(void *)(*(void *)(a1 + 248) + 40) -= 16;
  return result;
}

void ___ZN8CSStore222AttributedStringWriter17withWarningColorsEU13block_pointerFvvE_block_invoke(uint64_t a1)
{
}

void CSStore2::AttributedStringWriter::withTextAndBackgroundColor(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  float v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  _OWORD v8[2] = ___ZN8CSStore222AttributedStringWriter26withTextAndBackgroundColorEjjU13block_pointerFvvE_block_invoke;
  void v8[3] = &unk_1E5D2A508;
  int v9 = a2;
  void v8[4] = a4;
  v8[5] = a1;
  CSStore2::AttributedStringWriter::withAppliedAttribute(a1, @"_CSVBGColor", (uint64_t)v7, (uint64_t)v8);
}

void sub_1A7DC0A00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN8CSStore222AttributedStringWriter26withTextAndBackgroundColorEjjU13block_pointerFvvE_block_invoke(uint64_t a1)
{
}

void CSStore2::AttributedStringWriter::withTextColor(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [NSNumber numberWithUnsignedInt:a2];
  CSStore2::AttributedStringWriter::withAppliedAttribute(a1, @"_CSVFGColor", (uint64_t)v5, a3);
}

void sub_1A7DC0A90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void CSStore2::AttributedStringWriter::string(CSStore2::AttributedStringWriter *this, unsigned int a2)
{
}

void CSStore2::AttributedStringWriter::array(CSStore2::AttributedStringWriter *this, NSString *a2, NSArray *a3)
{
  uint64_t v21 = this;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (!a3 || (this = [(NSArray *)a3 count]) == 0)
  {
    if (*(unsigned char *)(*((void *)v21 + 31) + 168))
    {
      CSStore2::getLog(this);
      uint64_t v19 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v19->super, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        BOOL v28 = a2;
        _os_log_debug_impl(&dword_1A7DB2000, &v19->super, OS_LOG_TYPE_DEBUG, "Eliding empty array value for title \"%{public}@\"", buf, 0xCu);
      }
      unint64_t v4 = 0;
LABEL_31:

      goto LABEL_32;
    }
    CSStore2::getAttributedStringWithCharacter((CSStore2 *)0x23);
    unint64_t v4 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
    if (!v4) {
      goto LABEL_32;
    }
LABEL_29:
    if (!a2)
    {
      CSStore2::AttributedStringWriter::attributedString((CSStore2::AttributedStringWriter::Impl **)v21, v4);
      goto LABEL_32;
    }
    uint64_t v19 = (NSAttributedString *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:a2];
    CSStore2::AttributedStringWriter::attributedString(v21, v19, v4);
    goto LABEL_31;
  }
  unint64_t v4 = (NSAttributedString *)objc_alloc_init(MEMORY[0x1E4F28E48]);
  if (!v4) {
    goto LABEL_22;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = a3;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v6) {
    goto LABEL_21;
  }
  uint64_t v7 = *(void *)v23;
  char v8 = 1;
  do
  {
    uint64_t v9 = 0;
    do
    {
      if (*(void *)v23 != v7) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v22 + 1) + 8 * v9);
      if ((v8 & 1) == 0)
      {
        uint64_t v11 = CSStore2::getAttributedStringWithCharacter((CSStore2 *)0x2C);
        [(NSAttributedString *)v4 appendAttributedString:v11];

        uint64_t v12 = CSStore2::getAttributedStringWithCharacter((CSStore2 *)0x20);
        [(NSAttributedString *)v4 appendAttributedString:v12];
      }
      if (_NSIsNSString())
      {
        uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v10];
        [(NSAttributedString *)v4 appendAttributedString:v13];
      }
      else if (_NSIsNSNumber())
      {
        id v14 = objc_alloc(MEMORY[0x1E4F28E48]);
        uint64_t v15 = [v10 description];
        uint64_t v13 = (void *)[v14 initWithString:v15];

        objc_msgSend(v13, "addAttribute:value:range:", @"_CSVNum", v10, 0, objc_msgSend(v13, "length"));
        [(NSAttributedString *)v4 appendAttributedString:v13];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(NSAttributedString *)v4 appendAttributedString:v10];
          goto LABEL_19;
        }
        id v16 = objc_alloc(MEMORY[0x1E4F28B18]);
        uint64_t v13 = [v10 description];
        id v17 = (void *)[v16 initWithString:v13];
        [(NSAttributedString *)v4 appendAttributedString:v17];
      }
LABEL_19:
      char v8 = 0;
      ++v9;
    }
    while (v6 != v9);
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    char v8 = 0;
  }
  while (v6);
LABEL_21:

  uint8x8_t v18 = v4;
LABEL_22:

  if (v4) {
    goto LABEL_29;
  }
LABEL_32:
}

void sub_1A7DC0E14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void CSStore2::AttributedStringWriter::stringArray(CSStore2::AttributedStringWriter *this, NSString *a2, unsigned int a3)
{
  uint64_t v4 = **((void **)this + 31);
  if (v4)
  {
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x4812000000;
    uint64_t v13 = __Block_byref_object_copy_;
    id v14 = __Block_byref_object_dispose_;
    uint64_t v15 = "";
    id v17 = 0;
    uint64_t v18 = 0;
    __p = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = ___ZN8CSStore222AttributedStringWriter11stringArrayEP8NSStringj_block_invoke;
    v9[3] = &unk_1E5D2A418;
    v9[4] = &v10;
    _CSArrayEnumerateAllValues(v4, a3, v9);
    uint64_t v6 = (unsigned int *)v11[6];
    uint64_t v7 = (unsigned int *)v11[7];
    if (v7 == v6)
    {
      unsigned int v8 = 0;
      CSStore2::AttributedStringWriter::stringArray(this, a2, &v8, 0);
    }
    else
    {
      CSStore2::AttributedStringWriter::stringArray(this, a2, v6, (unint64_t)((char *)v7 - (char *)v6) >> 2);
    }
    _Block_object_dispose(&v10, 8);
    if (__p)
    {
      id v17 = __p;
      operator delete(__p);
    }
  }
}

void sub_1A7DC0FD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23)
{
  if (__p)
  {
    a23 = (uint64_t)__p;
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy_(__n128 *a1, __n128 *a2)
{
  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  __n128 result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

void ___ZN8CSStore222AttributedStringWriter11stringArrayEP8NSStringj_block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = (char *)v4[7];
  unint64_t v5 = v4[8];
  if ((unint64_t)v6 >= v5)
  {
    unsigned int v8 = (char *)v4[6];
    uint64_t v9 = (v6 - v8) >> 2;
    unint64_t v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 62) {
      abort();
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
      unint64_t v13 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>(v13);
      unsigned int v8 = (char *)v4[6];
      uint64_t v6 = (char *)v4[7];
    }
    else
    {
      uint64_t v14 = 0;
    }
    uint64_t v15 = (_DWORD *)(v13 + 4 * v9);
    unint64_t v16 = v13 + 4 * v14;
    _DWORD *v15 = a3;
    uint64_t v7 = v15 + 1;
    while (v6 != v8)
    {
      int v17 = *((_DWORD *)v6 - 1);
      v6 -= 4;
      *--uint64_t v15 = v17;
    }
    v4[6] = v15;
    v4[7] = v7;
    v4[8] = v16;
    if (v8) {
      operator delete(v8);
    }
  }
  else
  {
    *(_DWORD *)uint64_t v6 = a3;
    uint64_t v7 = v6 + 4;
  }
  v4[7] = v7;
}

void CSStore2::AttributedStringWriter::stringArray(CSStore2::AttributedStringWriter *this, NSString *a2, unsigned int *a3, unsigned int a4)
{
  int v17 = 0;
  if (a3 && a4)
  {
    uint64_t v6 = (atomic_ullong *)**((void **)this + 31);
    if (v6)
    {
      uint64_t v7 = a3;
      uint64_t v8 = a4;
      int v17 = (NSArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a4];
      do
      {
        unsigned int v10 = *v7++;
        unsigned int v9 = v10;
        uint64_t v11 = (void *)_CSStringCopyCFString((uint64_t)v6, v10);
        if (v11)
        {
          uint64_t UnitFromID = _CSStringGetUnitFromID((uint64_t)v6, v9);
          if (UnitFromID)
          {
            Stringatomic_ullong Table = (NSAttributedString *)_CSStoreGetStringTable(v6);
            uint64_t v14 = (CSStore2 *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v11];
            uint64_t v15 = CSStore2::addBackrefToAttributedString(v14, StringTable, UnitFromID);

            [(NSArray *)v17 addObject:v15];
          }
          else
          {
            [(NSArray *)v17 addObject:v11];
          }
        }

        --v8;
      }
      while (v8);
    }
    else
    {
      int v17 = 0;
    }
  }
  if (v17) {
    unint64_t v16 = v17;
  }
  else {
    unint64_t v16 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  CSStore2::AttributedStringWriter::array(this, a2, v16);
}

void sub_1A7DC1274(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

CSStore2 *CSStore2::addBackrefToAttributedString(CSStore2 *this, NSAttributedString *a2, uint64_t a3)
{
  unint64_t v5 = this;
  uint64_t v6 = +[_CSVisualizer URLForUnit:a3 inTable:a2];
  if (v6)
  {
    uint64_t v7 = (CSStore2 *)[(CSStore2 *)v5 mutableCopy];
    [(CSStore2 *)v7 addAttribute:@"_CSdwbr", v6, 0, [(CSStore2 *)v7 length] value range];
  }
  else
  {
    uint64_t v7 = v5;
  }

  return v7;
}

void sub_1A7DC1358(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void CSStore2::AttributedStringWriter::array(CSStore2::AttributedStringWriter *this, NSArray *a2)
{
}

void CSStore2::AttributedStringWriter::stringArray(CSStore2::AttributedStringWriter *this, unsigned int a2)
{
}

void CSStore2::AttributedStringWriter::stringArray(CSStore2::AttributedStringWriter *this, unsigned int *a2, unsigned int a3)
{
}

uint64_t CSStore2::AttributedStringWriter::number(CSStore2::AttributedStringWriter *this, NSString *a2, NSNumber *a3)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = ___ZN8CSStore222AttributedStringWriter6numberEP8NSStringP8NSNumber_block_invoke;
  v4[3] = &unk_1E5D2A3F0;
  void v4[5] = a2;
  v4[6] = this;
  v4[4] = a3;
  return CSStore2::AttributedStringWriter::withAppliedAttribute((uint64_t)this, @"_CSVNum", (uint64_t)a3, (uint64_t)v4);
}

void ___ZN8CSStore222AttributedStringWriter6numberEP8NSStringP8NSNumber_block_invoke(uint64_t a1)
{
  unint64_t v2 = *(CSStore2::AttributedStringWriter **)(a1 + 48);
  if (*(void *)(a1 + 32))
  {
    CFTypeID TypeID = CFBooleanGetTypeID();
    CFTypeID v4 = CFGetTypeID(*(CFTypeRef *)(a1 + 32));
    unint64_t v5 = *(void **)(a1 + 32);
    if (TypeID == v4)
    {
      uint64_t v6 = *(NSString **)(a1 + 40);
      if ([v5 BOOLValue]) {
        uint64_t v7 = @"true";
      }
      else {
        uint64_t v7 = @"false";
      }
      CSStore2::AttributedStringWriter::string(v2, v6, &v7->isa);
      return;
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  [v5 doubleValue];
  if (v8 != 0.0 || !*(unsigned char *)(*((void *)v2 + 31) + 168))
  {
    unsigned int v9 = *(NSString **)(a1 + 40);
    unsigned int v10 = [*(id *)(a1 + 32) description];
    CSStore2::AttributedStringWriter::string(v2, v9, v10);
  }
}

void sub_1A7DC1530(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void CSStore2::AttributedStringWriter::formatWithArguments(CSStore2::AttributedStringWriter *this, NSString *a2, NSString *a3, char *a4)
{
  uint64_t v8 = *(void *)(*((void *)this + 31) + 24);
  id v9 = [NSString alloc];
  if (v8) {
    unsigned int v10 = (NSString *)[v9 initWithFormat:a3 locale:v8 arguments:a4];
  }
  else {
    unsigned int v10 = (NSString *)[v9 initWithFormat:a3 arguments:a4];
  }
  uint64_t v11 = v10;
  CSStore2::AttributedStringWriter::string(this, a2, v10);
}

void sub_1A7DC15E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void CSStore2::AttributedStringWriter::formatWithArguments(CSStore2::AttributedStringWriter *this, NSString *a2, char *a3)
{
  uint64_t v6 = *(void *)(*((void *)this + 31) + 24);
  id v7 = [NSString alloc];
  if (v6) {
    uint64_t v8 = (NSAttributedString *)[v7 initWithFormat:a2 locale:v6 arguments:a3];
  }
  else {
    uint64_t v8 = (NSAttributedString *)[v7 initWithFormat:a2 arguments:a3];
  }
  id v9 = v8;
  CSStore2::AttributedStringWriter::string((CSStore2::AttributedStringWriter::Impl **)this, v8);
}

void sub_1A7DC1688(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void CSStore2::AttributedStringWriter::format(CSStore2::AttributedStringWriter *this, NSString *a2, NSString *a3, ...)
{
  va_start(va, a3);
  if (a2) {
    CSStore2::AttributedStringWriter::formatWithArguments(this, a2, a3, va);
  }
  else {
    CSStore2::AttributedStringWriter::formatWithArguments(this, a3, va);
  }
}

id CSStore2::AttributedStringWriter::Separator(CSStore2::AttributedStringWriter *this, void *a2, NSString *a3)
{
  if (this != 45 || a2)
  {
    CSStore2::AttributedStringWriter::Separator(char,NSString *)::$_0::operator()(this, a2);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = ___ZN8CSStore222AttributedStringWriter9SeparatorEcP8NSString_block_invoke;
    v5[3] = &unk_1E5D2A440;
    char v6 = 45;
    v5[4] = 0;
    if (CSStore2::AttributedStringWriter::Separator(char,NSString *)::once != -1) {
      dispatch_once(&CSStore2::AttributedStringWriter::Separator(char,NSString *)::once, v5);
    }
    id v3 = (id)CSStore2::AttributedStringWriter::Separator(char,NSString *)::standardSeparator;
  }

  return v3;
}

id CSStore2::AttributedStringWriter::Separator(char,NSString *)::$_0::operator()(unsigned int a1, id a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int8x16_t v15 = vdupq_n_s8(a1);
  int8x16_t v16 = v15;
  int8x16_t v13 = v15;
  int8x16_t v14 = v15;
  *(int8x16_t *)long long __dst = v15;
  if (a2)
  {
    unint64_t v2 = (const char *)[a2 UTF8String];
    size_t v3 = strlen(v2);
    if (v3 >= 0x50)
    {
      strlcpy(__dst, v2, 0x51uLL);
    }
    else
    {
      size_t v4 = v3;
      if (v3 <= 0x46)
      {
        unint64_t v5 = &__dst[(80 - v3) >> 1];
        *(v5 - 1) = 32;
        __dst[v4 + ((80 - v4) >> 1)] = 32;
        memcpy(v5, v2, v4);
      }
    }
  }
  char v6 = (void *)[[NSString alloc] initWithBytesNoCopy:__dst length:80 encoding:1 freeWhenDone:0];
  unsigned int v10 = @"_CSVOutputType";
  uint64_t v11 = &unk_1EFE43470;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v6 attributes:v7];

  return v8;
}

void sub_1A7DC1908(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN8CSStore222AttributedStringWriter9SeparatorEcP8NSString_block_invoke(uint64_t a1)
{
  uint64_t v1 = CSStore2::AttributedStringWriter::Separator(char,NSString *)::$_0::operator()(*(char *)(a1 + 41), *(id *)(a1 + 32));
  unint64_t v2 = (void *)CSStore2::AttributedStringWriter::Separator(char,NSString *)::standardSeparator;
  CSStore2::AttributedStringWriter::Separator(char,NSString *)::standardSeparator = v1;
}

void CSStore2::AttributedStringWriter::separator(CSStore2::AttributedStringWriter::Impl **this, CSStore2::AttributedStringWriter *a2, NSString *a3)
{
  CSStore2::AttributedStringWriter::Separator(a2, a3, a3);
  size_t v4 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
  CSStore2::AttributedStringWriter::attributedString(this, v4);
}

void sub_1A7DC19CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void CSStore2::AttributedStringWriter::timestamp(CSStore2::AttributedStringWriter::Impl **this, NSString *a2, double a3)
{
  char v6 = (void *)MEMORY[0x1AD0DB160]();
  id DateFormatter = CSStore2::AttributedStringWriter::Impl::getDateFormatter(this[31]);
  uint64_t v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a3];
  id v9 = [DateFormatter stringFromDate:v8];
  [v8 timeIntervalSinceNow];
  double v11 = v10;
  BOOL v12 = &stru_1EFE413F8;
  if (v10 != 0.0)
  {
    id DateComponentsFormatter = CSStore2::AttributedStringWriter::Impl::getDateComponentsFormatter((id *)this[31]);
    id v14 = [NSString alloc];
    int8x16_t v15 = [DateComponentsFormatter stringFromTimeInterval:-v11];
    BOOL v12 = (__CFString *)[v14 initWithFormat:@", 𝛥 %@", v15];
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  void v19[2] = ___ZN8CSStore222AttributedStringWriter9timestampEP8NSStringd_block_invoke;
  v19[3] = &unk_1E5D2A4B8;
  long long v24 = this;
  double v25 = a3;
  id v16 = v8;
  id v20 = v16;
  uint64_t v21 = a2;
  id v17 = v9;
  id v22 = v17;
  uint64_t v18 = v12;
  long long v23 = v18;
  double v26 = v11;
  CSStore2::AttributedStringWriter::withAppliedAttribute((uint64_t)this, @"_CSVTime", (uint64_t)v16, (uint64_t)v19);
}

void sub_1A7DC1BA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN8CSStore222AttributedStringWriter9timestampEP8NSStringd_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  size_t v3 = [NSNumber numberWithDouble:*(double *)(a1 + 72)];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = ___ZN8CSStore222AttributedStringWriter9timestampEP8NSStringd_block_invoke_2;
  long long v7[3] = &unk_1E5D2A490;
  uint64_t v12 = v2;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  char v6 = *(void **)(a1 + 48);
  id v8 = v4;
  uint64_t v9 = v5;
  id v10 = v6;
  id v11 = *(id *)(a1 + 56);
  uint64_t v13 = *(void *)(a1 + 80);
  CSStore2::AttributedStringWriter::withAppliedAttribute(v2, @"_CSVNum", (uint64_t)v3, (uint64_t)v7);
}

void sub_1A7DC1D0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void ___ZN8CSStore222AttributedStringWriter9timestampEP8NSStringd_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = ___ZN8CSStore222AttributedStringWriter9timestampEP8NSStringd_block_invoke_3;
  v9[3] = &unk_1E5D2A468;
  uint64_t v14 = v2;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void **)(a1 + 48);
  id v10 = v3;
  uint64_t v11 = v4;
  id v12 = v5;
  id v13 = *(id *)(a1 + 56);
  uint64_t v6 = MEMORY[0x1AD0DB340](v9);
  id v7 = (void *)v6;
  if (*(double *)(a1 + 72) == 0.0)
  {
    (*(void (**)(uint64_t))(v6 + 16))(v6);
  }
  else
  {
    id v8 = objc_msgSend(NSNumber, "numberWithDouble:");
    CSStore2::AttributedStringWriter::withAppliedAttribute(v2, @"_CSVTDlt", (uint64_t)v8, (uint64_t)v7);
  }
}

void sub_1A7DC1E50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

void ___ZN8CSStore222AttributedStringWriter9timestampEP8NSStringd_block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(CSStore2::AttributedStringWriter **)(a1 + 64);
  [*(id *)(a1 + 32) timeIntervalSince1970];
  double v4 = v3;
  long double v5 = fmod(v3, 1.0);
  uint64_t v6 = *(NSString **)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  if (v5 == 0.0) {
    CSStore2::AttributedStringWriter::format(v2, v6, &cfstr_PosixLld.isa, v7, (uint64_t)v4, *(void *)(a1 + 56));
  }
  else {
    CSStore2::AttributedStringWriter::format(v2, v6, &cfstr_Posix3f.isa, v7, *(void *)&v4, *(void *)(a1 + 56));
  }
}

void CSStore2::AttributedStringWriter::beginFlags(CSStore2::AttributedStringWriter *this, NSString *a2, uint64_t a3)
{
  uint64_t v5 = *((void *)this + 31);
  if (*(unsigned char *)(v5 + 152))
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    id v10 = objc_msgSend(NSString, "stringWithUTF8String:", "void CSStore2::AttributedStringWriter::beginFlags(NSString *const __strong _Nonnull, uintmax_t)");
    [v9 handleFailureInFunction:v10 file:@"CSAttributedStringWriter.mm" lineNumber:826 description:@"Nesting flag lists is not supported. Possible missing call to endFlags()?"];
  }
  uint64_t v6 = [(NSString *)a2 copy];
  uint64_t v7 = (void *)v6;
  if (v6) {
    id v8 = (__CFString *)v6;
  }
  else {
    id v8 = &stru_1EFE413F8;
  }
  objc_storeStrong((id *)(v5 + 56), v8);

  *(void *)(v5 + 64) = a3;
  *(_WORD *)(v5 + 152) = 1;
}

void sub_1A7DC1FEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void CSStore2::AttributedStringWriter::beginBitfieldFlags(CSStore2::AttributedStringWriter *this, NSString *a2)
{
  uint64_t v3 = *((void *)this + 31);
  if (*(unsigned char *)(v3 + 152))
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    id v8 = [NSString stringWithUTF8String:"void CSStore2::AttributedStringWriter::beginBitfieldFlags(NSString *const __strong _Nonnull)"];
    [v7 handleFailureInFunction:v8 file:@"CSAttributedStringWriter.mm" lineNumber:838 description:@"Nesting flag lists is not supported. Possible missing call to endFlags()?"];
  }
  uint64_t v4 = [(NSString *)a2 copy];
  uint64_t v5 = (void *)v4;
  if (v4) {
    uint64_t v6 = (__CFString *)v4;
  }
  else {
    uint64_t v6 = &stru_1EFE413F8;
  }
  objc_storeStrong((id *)(v3 + 56), v6);

  *(_WORD *)(v3 + 152) = 257;
}

void sub_1A7DC20CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void CSStore2::AttributedStringWriter::flag(uint64_t a1, unint64_t a2, void *a3, int *a4)
{
  uint64_t v7 = *(void *)(a1 + 248);
  if (!*(unsigned char *)(v7 + 152))
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    int8x16_t v15 = objc_msgSend(NSString, "stringWithUTF8String:", "void CSStore2::AttributedStringWriter::flag(uintmax_t, NSString *const __strong _Nonnull, const std::optional<RGBColor> &)");
    [v14 handleFailureInFunction:v15 file:@"CSAttributedStringWriter.mm" lineNumber:851 description:@"Called flag() without calling beginFlags() first."];
  }
  uint64_t v8 = *(void *)(v7 + 64);
  if (*(unsigned char *)(v7 + 153))
  {
    *(void *)(v7 + 64) = v8 + 1;
    BOOL v9 = a2 != 0;
    a2 = v8;
    uint64_t v8 = -1;
  }
  else
  {
    BOOL v9 = a2;
  }
  unint64_t v16 = a2;
  if ((v9 & v8) != 0)
  {
    uint64_t v10 = [a3 copy];
    uint64_t v11 = std::__hash_table<std::__hash_value_type<unsigned long,NSString * {__strong}>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,NSString * {__strong}>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>(v7 + 72, a2, &v16);
    id v12 = (void *)v11[3];
    v11[3] = v10;

    if (*((unsigned char *)a4 + 4))
    {
      int v13 = *a4;
      *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>(v7 + 112, a2, &v16)+ 6) = v13;
    }
    else
    {
      std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__erase_unique<unsigned long>((void *)(v7 + 112), a2);
    }
  }
}

void sub_1A7DC2220(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<unsigned long,NSString * {__strong}>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,NSString * {__strong}>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>(uint64_t a1, unint64_t a2, void *a3)
{
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = a2;
      if (v7 <= a2) {
        unint64_t v3 = a2 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & a2;
    }
    BOOL v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      for (uint64_t i = *v9; i; uint64_t i = (void *)*i)
      {
        unint64_t v11 = i[1];
        if (v11 == a2)
        {
          if (i[2] == a2) {
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
  i[1] = a2;
  i[2] = *a3;
  i[3] = 0;
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
    std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__rehash<true>(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= a2) {
        unint64_t v3 = a2 % v7;
      }
      else {
        unint64_t v3 = a2;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & a2;
    }
  }
  uint64_t v18 = *(void *)a1;
  uint64_t v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    void *i = *v19;
LABEL_38:
    *uint64_t v19 = i;
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
    uint64_t v19 = (void *)(*(void *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_1A7DC2438(_Unwind_Exception *a1)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long,NSString * {__strong}>,void *>>>::operator()[abi:nn180100](1, v1);
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>(uint64_t a1, unint64_t a2, void *a3)
{
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = a2;
      if (v7 <= a2) {
        unint64_t v3 = a2 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & a2;
    }
    BOOL v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      uint64_t v10 = *v9;
      if (*v9)
      {
        do
        {
          unint64_t v11 = v10[1];
          if (v11 == a2)
          {
            if (v10[2] == a2) {
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
          uint64_t v10 = (void *)*v10;
        }
        while (v10);
      }
    }
  }
  uint64_t v10 = operator new(0x20uLL);
  *uint64_t v10 = 0;
  v10[1] = a2;
  _OWORD v10[2] = *a3;
  *((_DWORD *)v10 + 6) = 0;
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
    std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__rehash<true>(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= a2) {
        unint64_t v3 = a2 % v7;
      }
      else {
        unint64_t v3 = a2;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & a2;
    }
  }
  uint64_t v18 = *(void *)a1;
  uint64_t v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    *uint64_t v10 = *v19;
LABEL_38:
    *uint64_t v19 = v10;
    goto LABEL_39;
  }
  *uint64_t v10 = *(void *)(a1 + 16);
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
    uint64_t v19 = (void *)(*(void *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v10;
}

void sub_1A7DC2650(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__erase_unique<unsigned long>(void *a1, unint64_t a2)
{
  unint64_t v3 = std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::find<unsigned long>(a1, a2);
  if (v3)
  {
    int8x8_t v4 = (int8x8_t)a1[1];
    unint64_t v5 = v3[1];
    uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4);
    v6.i16[0] = vaddlv_u8(v6);
    if (v6.u32[0] > 1uLL)
    {
      if (v5 >= *(void *)&v4) {
        v5 %= *(void *)&v4;
      }
    }
    else
    {
      v5 &= *(void *)&v4 - 1;
    }
    unint64_t v7 = *(void **)(*a1 + 8 * v5);
    do
    {
      uint8x8_t v8 = v7;
      unint64_t v7 = (void *)*v7;
    }
    while (v7 != v3);
    if (v8 == a1 + 2) {
      goto LABEL_20;
    }
    unint64_t v9 = v8[1];
    if (v6.u32[0] > 1uLL)
    {
      if (v9 >= *(void *)&v4) {
        v9 %= *(void *)&v4;
      }
    }
    else
    {
      v9 &= *(void *)&v4 - 1;
    }
    if (v9 != v5)
    {
LABEL_20:
      if (!*v3) {
        goto LABEL_21;
      }
      unint64_t v10 = *(void *)(*v3 + 8);
      if (v6.u32[0] > 1uLL)
      {
        if (v10 >= *(void *)&v4) {
          v10 %= *(void *)&v4;
        }
      }
      else
      {
        v10 &= *(void *)&v4 - 1;
      }
      if (v10 != v5) {
LABEL_21:
      }
        *(void *)(*a1 + 8 * v5) = 0;
    }
    uint64_t v11 = *v3;
    if (*v3)
    {
      unint64_t v12 = *(void *)(v11 + 8);
      if (v6.u32[0] > 1uLL)
      {
        if (v12 >= *(void *)&v4) {
          v12 %= *(void *)&v4;
        }
      }
      else
      {
        v12 &= *(void *)&v4 - 1;
      }
      if (v12 != v5)
      {
        *(void *)(*a1 + 8 * v12) = v8;
        uint64_t v11 = *v3;
      }
    }
    void *v8 = v11;
    *unint64_t v3 = 0;
    --a1[3];
    operator delete(v3);
  }
}

void *std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::find<unsigned long>(void *a1, unint64_t a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  uint8x8_t v3 = (uint8x8_t)vcnt_s8(v2);
  v3.i16[0] = vaddlv_u8(v3);
  if (v3.u32[0] > 1uLL)
  {
    unint64_t v4 = a2;
    if (*(void *)&v2 <= a2) {
      unint64_t v4 = a2 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v4 = (*(void *)&v2 - 1) & a2;
  }
  unint64_t v5 = *(void **)(*a1 + 8 * v4);
  if (!v5) {
    return 0;
  }
  __n128 result = (void *)*v5;
  if (*v5)
  {
    do
    {
      unint64_t v7 = result[1];
      if (v7 == a2)
      {
        if (result[2] == a2) {
          return result;
        }
      }
      else
      {
        if (v3.u32[0] > 1uLL)
        {
          if (v7 >= *(void *)&v2) {
            v7 %= *(void *)&v2;
          }
        }
        else
        {
          v7 &= *(void *)&v2 - 1;
        }
        if (v7 != v4) {
          return 0;
        }
      }
      __n128 result = (void *)*result;
    }
    while (result);
  }
  return result;
}

void CSStore2::AttributedStringWriter::missingFlag(uint64_t a1, unint64_t a2, void *a3, int *a4)
{
  uint64_t v7 = *(void *)(a1 + 248);
  if (!*(unsigned char *)(v7 + 152))
  {
    BOOL v14 = [MEMORY[0x1E4F28B00] currentHandler];
    unint64_t v15 = objc_msgSend(NSString, "stringWithUTF8String:", "void CSStore2::AttributedStringWriter::missingFlag(uintmax_t, NSString *const __strong _Nonnull, const std::optional<RGBColor> &)");
    [v14 handleFailureInFunction:v15 file:@"CSAttributedStringWriter.mm" lineNumber:892 description:@"Called missingFlag() without calling beginFlags() first."];
  }
  uint64_t v8 = *(void *)(v7 + 64);
  if (*(unsigned char *)(v7 + 153))
  {
    *(void *)(v7 + 64) = v8 + 1;
    BOOL v9 = a2 != 0;
    a2 = v8;
    uint64_t v8 = -1;
  }
  else
  {
    BOOL v9 = a2;
  }
  unint64_t v16 = a2;
  if ((v9 & v8) == 0)
  {
    uint64_t v10 = [a3 copy];
    uint64_t v11 = std::__hash_table<std::__hash_value_type<unsigned long,NSString * {__strong}>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,NSString * {__strong}>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>(v7 + 72, a2, &v16);
    unint64_t v12 = (void *)v11[3];
    v11[3] = v10;

    if (*((unsigned char *)a4 + 4))
    {
      int v13 = *a4;
      *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>(v7 + 112, a2, &v16)+ 6) = v13;
    }
    else
    {
      std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__erase_unique<unsigned long>((void *)(v7 + 112), a2);
    }
  }
}

void sub_1A7DC29B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void CSStore2::AttributedStringWriter::endFlags(CSStore2::AttributedStringWriter *this)
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *((void *)this + 31);
  if (!*(unsigned char *)(v1 + 152))
  {
    Unit v53 = [MEMORY[0x1E4F28B00] currentHandler];
    int v54 = [NSString stringWithUTF8String:"void CSStore2::AttributedStringWriter::endFlags()"];
    [v53 handleFailureInFunction:v54 file:@"CSAttributedStringWriter.mm" lineNumber:923 description:@"Called endFlags() without calling beginFlags() first."];
  }
  int8x8_t v2 = (CSStore2 *)MEMORY[0x1AD0DB160]();
  context = v2;
  if (*(void *)(v1 + 56))
  {
    int8x8_t v2 = (CSStore2 *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:*(void *)(v1 + 56)];
    v57 = (NSAttributedString *)v2;
  }
  else
  {
    v57 = 0;
  }
  unint64_t v3 = *(void *)(v1 + 96);
  if (!v3 && *(unsigned char *)(*((void *)this + 31) + 168)) {
    goto LABEL_73;
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v3)
  {
    if (v3 >> 61) {
      abort();
    }
    unint64_t v5 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(v3);
    uint64_t v7 = &v5[8 * v6];
    uint64_t v8 = v5;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v7 = 0;
  }
  BOOL v9 = *(void **)(v1 + 88);
  if (v9)
  {
    uint64_t v10 = v8;
    do
    {
      if (v10 >= v7)
      {
        uint64_t v12 = (v10 - v8) >> 3;
        unint64_t v13 = v12 + 1;
        if ((unint64_t)(v12 + 1) >> 61) {
          abort();
        }
        if ((v7 - v8) >> 2 > v13) {
          unint64_t v13 = (v7 - v8) >> 2;
        }
        if ((unint64_t)(v7 - v8) >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v14 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v14 = v13;
        }
        if (v14) {
          unint64_t v14 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(v14);
        }
        else {
          uint64_t v15 = 0;
        }
        unint64_t v16 = (char *)(v14 + 8 * v12);
        *(void *)unint64_t v16 = v9[2];
        uint64_t v11 = v16 + 8;
        while (v10 != v8)
        {
          uint64_t v17 = *((void *)v10 - 1);
          v10 -= 8;
          *((void *)v16 - 1) = v17;
          v16 -= 8;
        }
        uint64_t v7 = (char *)(v14 + 8 * v15);
        if (v8) {
          operator delete(v8);
        }
        uint64_t v8 = v16;
      }
      else
      {
        *(void *)uint64_t v10 = v9[2];
        uint64_t v11 = v10 + 8;
      }
      BOOL v9 = (void *)*v9;
      uint64_t v10 = v11;
    }
    while (v9);
  }
  else
  {
    uint64_t v11 = v8;
  }
  int8x8_t v2 = (CSStore2 *)std::__sort<std::__less<unsigned long,unsigned long> &,unsigned long *>();
  if (v8 != v11)
  {
    uint64_t v18 = (unint64_t *)v8;
    do
    {
      int8x8_t v19 = *(int8x8_t *)(v1 + 80);
      if (v19)
      {
        unint64_t v20 = *v18;
        uint8x8_t v21 = (uint8x8_t)vcnt_s8(v19);
        v21.i16[0] = vaddlv_u8(v21);
        if (v21.u32[0] > 1uLL)
        {
          unint64_t v22 = *v18;
          if (v20 >= *(void *)&v19) {
            unint64_t v22 = v20 % *(void *)&v19;
          }
        }
        else
        {
          unint64_t v22 = (*(void *)&v19 - 1) & v20;
        }
        long long v23 = *(void **)(*(void *)(v1 + 72) + 8 * v22);
        if (v23)
        {
          long long v24 = (void *)*v23;
          if (*v23)
          {
            do
            {
              unint64_t v25 = v24[1];
              if (v25 == v20)
              {
                if (v24[2] == v20)
                {
                  double v26 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v24[3]];
                  id v27 = std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::find<unsigned long>((void *)(v1 + 112), *v18);
                  if (v27)
                  {
                    BOOL v28 = [NSNumber numberWithUnsignedInt:*((unsigned int *)v27 + 6)];
                    objc_msgSend(v26, "addAttribute:value:range:", @"_CSVFGColor", v28, 0, objc_msgSend(v26, "length"));
                  }
                  [v4 addObject:v26];

                  break;
                }
              }
              else
              {
                if (v21.u32[0] > 1uLL)
                {
                  if (v25 >= *(void *)&v19) {
                    v25 %= *(void *)&v19;
                  }
                }
                else
                {
                  v25 &= *(void *)&v19 - 1;
                }
                if (v25 != v22) {
                  break;
                }
              }
              long long v24 = (void *)*v24;
            }
            while (v24);
          }
        }
      }
      ++v18;
    }
    while (v18 != (unint64_t *)v11);
  }
  if (v8) {
    operator delete(v8);
  }
  if (v4)
  {
    int8x8_t v2 = (CSStore2 *)[v4 count];
    if (v2)
    {
      uint64_t v29 = (NSAttributedString *)objc_alloc_init(MEMORY[0x1E4F28E48]);
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v30 = v4;
      uint64_t v31 = [v30 countByEnumeratingWithState:&v62 objects:v73 count:16];
      if (v31)
      {
        uint64_t v32 = *(void *)v63;
        do
        {
          for (uint64_t i = 0; i != v31; ++i)
          {
            if (*(void *)v63 != v32) {
              objc_enumerationMutation(v30);
            }
            uint64_t v34 = *(void *)(*((void *)&v62 + 1) + 8 * i);
            if ([(NSAttributedString *)v29 length])
            {
              BOOL v35 = CSStore2::getAttributedStringWithCharacter((CSStore2 *)0x20);
              [(NSAttributedString *)v29 appendAttributedString:v35];

              unint64_t v36 = CSStore2::getAttributedStringWithCharacter((CSStore2 *)0x20);
              [(NSAttributedString *)v29 appendAttributedString:v36];
            }
            [(NSAttributedString *)v29 appendAttributedString:v34];
          }
          uint64_t v31 = [v30 countByEnumeratingWithState:&v62 objects:v73 count:16];
        }
        while (v31);
      }

      if (*(unsigned char *)(v1 + 153)) {
        goto LABEL_80;
      }
      id v37 = objc_alloc(MEMORY[0x1E4F28B18]);
      uint8x8_t v38 = objc_msgSend(NSString, "stringWithFormat:", @" (%016llx)", *(void *)(v1 + 64));
      uint64_t v39 = (void *)[v37 initWithString:v38];
      [(NSAttributedString *)v29 appendAttributedString:v39];

LABEL_79:
LABEL_80:
      NSUInteger v40 = v30;
      goto LABEL_82;
    }
    NSUInteger v40 = v4;
  }
  else
  {
LABEL_73:
    NSUInteger v40 = 0;
  }
  if (*(unsigned char *)(*((void *)this + 31) + 168))
  {
    uint8x8_t v38 = CSStore2::getLog(v2);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v52 = *(void *)(v1 + 64);
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v52;
      *(_WORD *)&unsigned char buf[12] = 2114;
      *(void *)&buf[14] = v57;
      _os_log_debug_impl(&dword_1A7DB2000, v38, OS_LOG_TYPE_DEBUG, "Eliding empty flags value (%016llx) for title \"%{public}@\"", buf, 0x16u);
    }
    uint64_t v29 = 0;
    id v30 = v40;
    goto LABEL_79;
  }
  CSStore2::getAttributedStringWithCharacter((CSStore2 *)0x23);
  uint64_t v29 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
LABEL_82:

  if (v29)
  {
    if (*(unsigned char *)(v1 + 153))
    {
      CSStore2::AttributedStringWriter::attributedString(this, v57, v29);
    }
    else
    {
      unint64_t v41 = [NSNumber numberWithUnsignedLong:*(void *)(v1 + 64)];
      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = ___ZN8CSStore222AttributedStringWriter8endFlagsEv_block_invoke;
      v58[3] = &unk_1E5D2A3F0;
      v61 = this;
      v59 = v57;
      uint64_t v60 = v29;
      CSStore2::AttributedStringWriter::withAppliedAttribute((uint64_t)this, @"_CSVNum", (uint64_t)v41, (uint64_t)v58);
    }
  }
  long long v67 = 0u;
  memset(v70, 0, sizeof(v70));
  int v69 = 1065353216;
  int v71 = 1065353216;
  __int16 v72 = 0;
  uint64_t v68 = 0;
  memset(buf, 0, sizeof(buf));
  unint64_t v42 = *(void **)(v1 + 56);
  *(void *)(v1 + 56) = 0;

  *(void *)(v1 + 64) = 0;
  if (*(void *)(v1 + 96))
  {
    std::__hash_table<std::__hash_value_type<unsigned long,NSString * {__strong}>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,NSString * {__strong}>>>::__deallocate_node(*(id **)(v1 + 88));
    *(void *)(v1 + 88) = 0;
    uint64_t v43 = *(void *)(v1 + 80);
    if (v43)
    {
      for (uint64_t j = 0; j != v43; ++j)
        *(void *)(*(void *)(v1 + 72) + 8 * j) = 0;
    }
    *(void *)(v1 + 96) = 0;
  }
  *(void *)&buf[16] = 0;
  BOOL v45 = *(void **)(v1 + 72);
  *(void *)(v1 + 72) = 0;
  if (v45) {
    operator delete(v45);
  }
  *(void *)(v1 + 80) = 0;
  *(void *)(v1 + 88) = 0;
  *(void *)&long long v67 = 0;
  *(void *)(v1 + 96) = 0;
  *(_DWORD *)(v1 + 104) = 1065353216;
  if (*(void *)(v1 + 136))
  {
    unint64_t v46 = *(void **)(v1 + 128);
    if (v46)
    {
      do
      {
        unint64_t v47 = (void *)*v46;
        operator delete(v46);
        unint64_t v46 = v47;
      }
      while (v47);
    }
    *(void *)(v1 + 128) = 0;
    uint64_t v48 = *(void *)(v1 + 120);
    if (v48)
    {
      for (uint64_t k = 0; k != v48; ++k)
        *(void *)(*(void *)(v1 + 112) + 8 * k) = 0;
    }
    *(void *)(v1 + 136) = 0;
  }
  v70[0] = 0;
  unsigned int v50 = *(void **)(v1 + 112);
  *(void *)(v1 + 112) = 0;
  if (v50) {
    operator delete(v50);
  }
  *(void *)(v1 + 120) = 0;
  *(void *)(v1 + 128) = 0;
  v70[1] = 0;
  *(void *)(v1 + 136) = 0;
  *(_DWORD *)(v1 + 144) = 1065353216;
  *(_WORD *)(v1 + 152) = v72;
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)v70);
  std::__hash_table<std::__hash_value_type<unsigned long,NSString * {__strong}>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,NSString * {__strong}>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,NSString * {__strong}>>>::__deallocate_node(*((id **)&v67 + 1));
  unint64_t v51 = *(void **)&buf[16];
  *(void *)&buf[16] = 0;
  if (v51) {
    operator delete(v51);
  }
}

void sub_1A7DC3198(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(unint64_t a1)
{
  if (a1 >> 61) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(8 * a1);
}

void ___ZN8CSStore222AttributedStringWriter8endFlagsEv_block_invoke(uint64_t a1)
{
}

id CSStore2::AttributedStringWriter::link(CSStore2::AttributedStringWriter *this, uint64_t a2, uint64_t a3, NSString *a4)
{
  if (a4) {
    uint64_t v8 = (NSAttributedString *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:a4];
  }
  else {
    uint64_t v8 = 0;
  }
  BOOL v9 = CSStore2::AttributedStringWriter::link(this, a2, a3, v8);
  if (a4) {

  }
  return v9;
}

void sub_1A7DC3370(_Unwind_Exception *exception_object)
{
  if (v1) {

  }
  _Unwind_Resume(exception_object);
}

id CSStore2::AttributedStringWriter::link(CSStore2::AttributedStringWriter *this, uint64_t a2, uint64_t a3, NSAttributedString *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = a4;
  uint64_t v8 = v7;
  if (!a3 && *(unsigned char *)(*((void *)this + 31) + 168))
  {
    unint64_t v14 = 0;
    if (!v7) {
      goto LABEL_19;
    }
    goto LABEL_13;
  }
  if (!v7)
  {
    id v9 = *(id *)(*((void *)this + 31) + 160);
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = [v9 summaryOfUnit:a3 inTable:a2];

      if (v11) {
        goto LABEL_6;
      }
    }
    uint64_t v12 = [NSNumber numberWithUnsignedInt:a3];
    uint64_t v11 = [v12 description];

    if (v11)
    {
LABEL_6:
      unint64_t v13 = objc_msgSend(v11, "stringByAppendingFormat:", @" (0x%llx)", a3);
    }
    else
    {
      unint64_t v13 = 0;
    }
    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v13];

    uint64_t v8 = (NSAttributedString *)v15;
  }
  unint64_t v14 = [(NSAttributedString *)v8 string];
  if (v8)
  {
LABEL_13:
    unint64_t v16 = +[_CSVisualizer URLForUnit:a3 inTable:a2];
    if (v16)
    {
      uint64_t v17 = CSStore2::AttributedStringWriter::link((CSStore2::AttributedStringWriter::Impl **)this, v16, v8);

      unint64_t v14 = (void *)v17;
    }
    else
    {
      uint64_t v18 = CSStore2::getLog(0);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v21 = a2;
        __int16 v22 = 2048;
        uint64_t v23 = a3;
        _os_log_error_impl(&dword_1A7DB2000, v18, OS_LOG_TYPE_ERROR, "Failed to construct URL for table/unit %llx %llx", buf, 0x16u);
      }
    }
  }
LABEL_19:

  return v14;
}

void sub_1A7DC35A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id CSStore2::AttributedStringWriter::link(CSStore2::AttributedStringWriter::Impl **this, NSURL *a2, NSAttributedString *a3)
{
  unint64_t v5 = a3;
  if (!v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v7 = [(NSURL *)a2 absoluteString];
    unint64_t v5 = (NSAttributedString *)[v6 initWithString:v7];
  }
  uint64_t v8 = [(NSAttributedString *)v5 string];
  if (a2)
  {
    id v9 = (NSAttributedString *)[(NSAttributedString *)v5 mutableCopy];
    [(NSAttributedString *)v9 addAttribute:@"_CSVLink", a2, 0, [(NSAttributedString *)v9 length] value range];
    Marker = (void *)CSStore2::AttributedStringWriter::Impl::createMarker(this[31], v9);
    uint64_t v11 = Marker;
    if (Marker)
    {
      id v12 = Marker;

      uint64_t v8 = v12;
    }
  }

  return v8;
}

void sub_1A7DC36E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id CSStore2::AttributedStringWriter::link(CSStore2::AttributedStringWriter::Impl **this, NSURL *a2, NSString *a3)
{
  if (a3) {
    id v6 = (NSAttributedString *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:a3];
  }
  else {
    id v6 = 0;
  }
  uint64_t v7 = CSStore2::AttributedStringWriter::link(this, a2, v6);
  if (a3) {

  }
  return v7;
}

void sub_1A7DC37A4(_Unwind_Exception *exception_object)
{
  if (v1) {

  }
  _Unwind_Resume(exception_object);
}

void CSStore2::AttributedStringWriter::childUnit(CSStore2::AttributedStringWriter *this, NSString *a2, NSAttributedString *a3, uint64_t a4)
{
  uint64_t v8 = (void *)MEMORY[0x1AD0DB160]();
  id v9 = *(id *)(*((void *)this + 31) + 160);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = (void *)[v9 copy];

    id v12 = [NSNumber numberWithBool:a2 != 0];
    unint64_t v13 = [v11 userInfo];
    [v13 setObject:v12 forKeyedSubscript:@"_CSAttributedStringWriterIsChildUnitWithTitle"];

    unint64_t v14 = [v11 descriptionOfUnit:a4 inTable:a3];
    uint64_t v15 = (void *)[v14 mutableCopy];

    if (!a4) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v15 = 0;
    if (!a4) {
      goto LABEL_7;
    }
  }
  if (!v15)
  {
    unint64_t v16 = CSStore2::getAttributedStringWithCharacter((CSStore2 *)0x23);
    uint64_t v15 = (void *)[v16 mutableCopy];
  }
LABEL_7:
  while (1)
  {
    uint64_t v17 = [v15 string];
    int v18 = [v17 hasSuffix:@"\n"];

    if (!v18) {
      break;
    }
    objc_msgSend(v15, "deleteCharactersInRange:", objc_msgSend(v15, "length") - 1, 1);
  }
  if (a2)
  {
    if (v15)
    {
      unint64_t v20 = [v15 string];
      CFStringRef theString = v20;
      uint64_t v50 = 0;
      uint64_t v51 = [v15 length];
      CharactersPtr = CFStringGetCharactersPtr(v20);
      if (CharactersPtr) {
        CStringPtr = 0;
      }
      else {
        CStringPtr = CFStringGetCStringPtr(v20, 0x600u);
      }
      int64_t v52 = 0;
      int64_t v53 = 0;
      uint64_t v49 = CStringPtr;

      uint64_t v25 = v51;
      if (v51 < 1)
      {
        __int16 v22 = 0;
        a3 = (NSAttributedString *)a3;
      }
      else
      {
        uint64_t v26 = 0;
        __int16 v22 = 0;
        int64_t v27 = 0;
        uint64_t v28 = 64;
        do
        {
          if ((unint64_t)v27 >= 4) {
            uint64_t v29 = 4;
          }
          else {
            uint64_t v29 = v27;
          }
          if (CharactersPtr)
          {
            UniChar v30 = CharactersPtr[v27 + v50];
          }
          else if (v49)
          {
            UniChar v30 = v49[v50 + v27];
          }
          else
          {
            int64_t v31 = v52;
            if (v53 <= v27 || v52 > v27)
            {
              uint64_t v33 = v29 + v26;
              uint64_t v34 = v28 - v29;
              int64_t v35 = v27 - v29;
              int64_t v36 = v35 + 64;
              if (v35 + 64 >= v25) {
                int64_t v36 = v25;
              }
              int64_t v52 = v35;
              int64_t v53 = v36;
              if (v25 >= v34) {
                uint64_t v25 = v34;
              }
              v54.size_t length = v25 + v33;
              v54.location = v35 + v50;
              CFStringGetCharacters(theString, v54, buffer);
              int64_t v31 = v52;
            }
            UniChar v30 = buffer[v27 - v31];
          }
          if (v30 == 10)
          {
            if (!v22)
            {
              __int16 v22 = [MEMORY[0x1E4F28E60] indexSet];
            }
            [v22 addIndex:v27];
          }
          ++v27;
          uint64_t v25 = v51;
          --v26;
          ++v28;
        }
        while (v27 < v51);
        a3 = (NSAttributedString *)a3;
        if (v22 && [v22 count])
        {
          id v37 = CSStore2::getAttributedStringWithRepeatedCharacter((CSStore2 *)0x1C);
          uint8x8_t v38 = (void *)[v37 mutableCopy];

          objc_msgSend(v38, "addAttribute:value:range:", @"_CSVOutputType", &unk_1EFE43458, 1, objc_msgSend(v38, "length") - 1);
          v43[0] = MEMORY[0x1E4F143A8];
          v43[1] = 3221225472;
          v43[2] = ___ZN8CSStore222AttributedStringWriter9childUnitEP8NSStringjj_block_invoke;
          v43[3] = &unk_1E5D2A4E0;
          id v44 = v15;
          id v39 = v38;
          id v45 = v39;
          [v22 enumerateIndexesWithOptions:2 usingBlock:v43];
        }
      }
    }
    else
    {
      __int16 v22 = 0;
    }
  }
  else
  {
    __int16 v22 = CSStore2::AttributedStringWriter::Separator((CSStore2::AttributedStringWriter *)0x2D, 0, v19);
    [v15 insertAttributedString:v22 atIndex:0];
    if (*(unsigned char *)(*((void *)this + 31) + 169))
    {
      uint64_t v23 = CSStore2::getAttributedStringWithCharacter((CSStore2 *)0xA);
      objc_msgSend(v15, "insertAttributedString:atIndex:", v23, objc_msgSend(v22, "length"));
    }
    uint64_t v24 = [v15 length];
    objc_msgSend(v15, "addAttribute:value:range:", @"_CSVIsRelated", MEMORY[0x1E4F1CC38], 0, v24);
  }

  NSUInteger v40 = CSStore2::addBackrefToAttributedString((CSStore2 *)v15, a3, a4);
  unint64_t v41 = (NSAttributedString *)[v40 mutableCopy];

  if (a2)
  {
    unint64_t v42 = (NSAttributedString *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:a2];
    CSStore2::AttributedStringWriter::attributedString(this, v42, v41);
  }
  else
  {
    CSStore2::AttributedStringWriter::attributedString((CSStore2::AttributedStringWriter::Impl **)this, v41);
  }
}

void sub_1A7DC3C80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZN8CSStore222AttributedStringWriter9childUnitEP8NSStringjj_block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) insertAttributedString:*(void *)(a1 + 40) atIndex:a2 + 1];
}

id CSStore2::AttributedStringWriter::getVisualizer(CSStore2::AttributedStringWriter *this)
{
  return *(id *)(*((void *)this + 31) + 160);
}

uint64_t CSStore2::AttributedStringWriter::insertsNewlines(CSStore2::AttributedStringWriter *this)
{
  return *(unsigned __int8 *)(*((void *)this + 31) + 169);
}

void CSStore2::AttributedStringWriter::childUnit(CSStore2::AttributedStringWriter *this, NSAttributedString *a2, uint64_t a3)
{
}

void CSStore2::AttributedStringWriter::setVisualizer(CSStore2::AttributedStringWriter *this, _CSVisualizer *a2)
{
  objc_storeStrong((id *)(*((void *)this + 31) + 160), a2);
  id v5 = [(_CSVisualizer *)a2 userInfo];
  id v4 = [v5 objectForKeyedSubscript:@"_CSAttributedStringWriterIsChildUnitWithTitle"];
  *(unsigned char *)(*((void *)this + 31) + 170) = [v4 BOOLValue];
}

void sub_1A7DC3E18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t CSStore2::AttributedStringWriter::setElidesEmptyValues(uint64_t this, char a2)
{
  *(unsigned char *)(*(void *)(this + 248) + 168) = a2;
  return this;
}

uint64_t CSStore2::AttributedStringWriter::setInsertsNewlines(uint64_t this, char a2)
{
  *(unsigned char *)(*(void *)(this + 248) + 169) = a2;
  return this;
}

id CSStore2::AttributedStringWriter::getLocale(CSStore2::AttributedStringWriter *this)
{
  return *(id *)(*((void *)this + 31) + 24);
}

void CSStore2::AttributedStringWriter::setLocale(CSStore2::AttributedStringWriter *this, NSLocale *a2)
{
  uint64_t v3 = [(NSLocale *)a2 copy];
  uint64_t v4 = *((void *)this + 31);
  id v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v3;
}

uint64_t CSStringBindingStoreAddTable(__CSStore *a1, void *a2)
{
  return CSMapAddMapTable(a1, a2, 0);
}

Unit *_CSStringBindingReleaseString(uint64_t a1, uint64_t a2, unsigned int a3)
{
  return _CSStringRelease(a1, a3);
}

unsigned int *_CSStringBindingRetainString(uint64_t a1, int a2, unsigned int a3)
{
  return _CSStringRetain(a1, a3);
}

uint64_t CSStringBindingCopyCFStrings(uint64_t a1, void *a2)
{
  uint64_t v2 = 0;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  if (a1 && a2)
  {
    CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
    v9[3] = (uint64_t)Mutable;
    if (Mutable)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      void v7[2] = __CSStringBindingCopyCFStrings_block_invoke;
      long long v7[3] = &unk_1E5D2A530;
      void v7[4] = &v8;
      v7[5] = a1;
      _CSStringBindingEnumerateAllBindings(a1, a2, v7);
      uint64_t v2 = v9[3];
    }
    else
    {
      uint64_t v2 = 0;
    }
  }
  _Block_object_dispose(&v8, 8);
  return v2;
}

void sub_1A7DC3FBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __CSStringBindingCopyCFStrings_block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t v3 = (const void *)_CSStringCopyCFString(*(void *)(a1 + 40), a2);
  if (v3)
  {
    uint64_t v4 = v3;
    CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), v3);
    CFRelease(v4);
  }
}

void __clang_call_terminate(void *a1)
{
}

void sub_1A7DC4068(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::default_delete<CSStore2::Store>::operator()[abi:nn180100](id *a1)
{
  JUMPOUT(0x1AD0DACB0);
}

uint64_t ___ZN8CSStore2L15IsAppleInternalEv_block_invoke()
{
  uint64_t result = os_variant_has_internal_diagnostics();
  CSStore2::IsAppleInternal(void)::uint64_t result = result;
  return result;
}

void CSStore2::Table::setName(CSStore2::Table *this, NSString *a2)
{
  uint64_t v3 = a2;
  strlcpy((char *)this + 8, [(NSString *)v3 UTF8String], 0x30uLL);
}

void sub_1A7DC4160(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

NSUInteger CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::Create(CSStore2::Store *a1, uint64_t a2)
{
  unsigned int v4 = *(_DWORD *)(a2 + 24) + 1024;
  if (v4 >= 0x2000) {
    unsigned int v5 = 0x2000;
  }
  else {
    unsigned int v5 = *(_DWORD *)(a2 + 24) + 1024;
  }
  if (v5 <= 0x10) {
    unsigned int v5 = 16;
  }
  int v6 = 8 * v5 + 8 * v4;
  uint64_t v7 = (const void *)(v6 | 4u);
  unint64_t v8 = CSStore2::Store::extend(a1, v6 | 4u);
  NSUInteger v9 = v8;
  if (v8)
  {
    uint64_t v10 = *(void *)a1;
    if (*(void *)a1) {
      unint64_t v11 = *(void *)(v10 + 8);
    }
    else {
      unint64_t v11 = 0;
    }
    int v12 = -1;
    BOOL v13 = v8 >= v11;
    unint64_t v14 = v8 - v11;
    if (v13 && !HIDWORD(v14))
    {
      if ((v14 + 1) > *(_DWORD *)(*(void *)(v10 + 8) + 12) || v14 == -1) {
        int v12 = -1;
      }
      else {
        int v12 = v14;
      }
    }
    CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::Create((_DWORD **)v21, a2, v12, 0x400u, 0);
    unint64_t v16 = v21[0];
    if (v21[0])
    {
      CSStore2::VM::Copy(v9, (NSUInteger)v21[0], v7);
      ((void (*)(void *))v21[1])(v16);
    }
    else
    {
      CSStore2::Store::assertNotEnumeratingUnits((uint64_t)a1);
      NSUInteger v9 = 0;
      uint64_t v17 = *(void *)(*(void *)a1 + 8);
      unsigned int v18 = *(_DWORD *)(v17 + 16);
      BOOL v13 = v18 >= v7;
      unsigned int v19 = v18 - v7;
      if (!v13) {
        unsigned int v19 = 0;
      }
      *(_DWORD *)(v17 + 16) = v19;
      ++*(_DWORD *)(v17 + 8);
    }
  }
  return v9;
}

void sub_1A7DC429C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void (*a10)(uint64_t))
{
  a10(v10);
  _Unwind_Resume(a1);
}

uint64_t CSStore2::Store::extend(CSStore2::Store *this, unsigned int a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  unsigned int v4 = (CSStore2 *)CSStore2::Store::assertNotEnumeratingUnits((uint64_t)this);
  unsigned int v5 = CSStore2::GetLog(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v32 = 134217984;
    uint64_t v33 = a2;
    _os_log_debug_impl(&dword_1A7DB2000, v5, OS_LOG_TYPE_DEBUG, "Attempting to lengthen store by %llu bytes", (uint8_t *)&v32, 0xCu);
  }

  if (a2 + 3 >= 4) {
    uint64_t v7 = (a2 + 3) & 0xFFFFFFFC;
  }
  else {
    uint64_t v7 = 4;
  }
  uint64_t v8 = *(void *)this;
  if (!*(void *)this
    || (uint64_t v9 = *(void *)(v8 + 8),
        unsigned int v10 = *(_DWORD *)(v9 + 12),
        unsigned int v11 = v10 + v7,
        v10 + v7 >= *(_DWORD *)(v8 + 16)))
  {
    CSStore2::Store::assertNotEnumeratingUnits((uint64_t)this);
    uint64_t v12 = *(void *)this;
    if (*(void *)this)
    {
      unsigned int v10 = *(_DWORD *)(v12 + 16);
      unsigned int v13 = v7 + 0x3FFFF + v10;
      if (v13 >= 0x40000) {
        uint64_t v14 = v13 & 0xFFFC0000;
      }
      else {
        uint64_t v14 = 0x40000;
      }
      if (v14 >= v10) {
        goto LABEL_13;
      }
      uint64_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
      int64_t v27 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL CSStore2::Store::reserve(_CSStoreSize, _CSStoreSize *)");
      [v26 handleFailureInFunction:v27 file:@"CSStore+Store.mm" lineNumber:863 description:@"New CSStore size is smaller than the old size!"];

      uint64_t v12 = *(void *)this;
      if (*(void *)this) {
LABEL_13:
      }
        uint64_t v15 = *(CSStore2::VM **)(v12 + 8);
      else {
        uint64_t v15 = 0;
      }
    }
    else
    {
      unsigned int v10 = 0;
      uint64_t v15 = 0;
      if ((v7 + 0x3FFFF) >= 0x40000) {
        uint64_t v14 = (v7 + 0x3FFFF) & 0xFFFC0000;
      }
      else {
        uint64_t v14 = 0x40000;
      }
    }
    unsigned int v16 = *MEMORY[0x1E4F14B00];
    unsigned int v17 = v10 + *MEMORY[0x1E4F14B00] - 1;
    if (v17 == v17 % *MEMORY[0x1E4F14B00]) {
      unint64_t v18 = v16;
    }
    else {
      unint64_t v18 = v17 / v16 * v16;
    }
    Copy = (void *)CSStore2::VM::AllocateCopy(v15, (const void *)v18, (CSStore2::VM *)v14);
    if (!Copy)
    {
      uint64_t v28 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v29 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL CSStore2::Store::reserve(_CSStoreSize, _CSStoreSize *)");
      [v28 handleFailureInFunction:v29 file:@"CSStore+Store.mm" lineNumber:868 description:@"Failed to create data for store extension!"];

      int64_t v31 = CSStore2::GetLog(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        int v32 = 134217984;
        uint64_t v33 = v7;
        _os_log_error_impl(&dword_1A7DB2000, v31, OS_LOG_TYPE_ERROR, "Failed to reserve %llu bytes of virtual memory", (uint8_t *)&v32, 0xCu);
      }

      abort();
    }
    int v6 = (CSStore2 *)CSStore2::Store::setBytesNoCopy(this, Copy, v14);
    uint64_t v9 = *(void *)(*(void *)this + 8);
    unsigned int v11 = v10 + v7;
  }
  int v20 = *(_DWORD *)(v9 + 16) + v7;
  *(_DWORD *)(v9 + 12) = v11;
  *(_DWORD *)(v9 + 16) = v20;
  uint64_t v21 = v9 + v10;
  if (v11 <= v10) {
    uint64_t v22 = 0;
  }
  else {
    uint64_t v22 = v21;
  }
  uint64_t v23 = CSStore2::GetLog(v6);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v25 = *(unsigned int *)(*(void *)(*(void *)this + 8) + 16);
    int v32 = 134217984;
    uint64_t v33 = v25;
    _os_log_debug_impl(&dword_1A7DB2000, v23, OS_LOG_TYPE_DEBUG, "New length of store is %llu bytes", (uint8_t *)&v32, 0xCu);
  }

  if (v22) {
    ++*(_DWORD *)(*(void *)(*(void *)this + 8) + 8);
  }
  return v22;
}

void sub_1A7DC4608(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::Create(_DWORD **a1, uint64_t a2, int a3, unsigned int a4, _DWORD *a5)
{
  unsigned int v9 = *(void *)(a2 + 24) + a4;
  if (v9 >= 0x2000) {
    unsigned int v10 = 0x2000;
  }
  else {
    unsigned int v10 = *(void *)(a2 + 24) + a4;
  }
  if (v10 <= 0x10) {
    uint64_t v11 = 16;
  }
  else {
    uint64_t v11 = v10;
  }
  size_t v12 = (8 * v11 + 8 * v9) | 4;
  unsigned int v13 = malloc_type_malloc(v12, 0x16D4E321uLL);
  uint64_t v14 = (_DWORD *)MEMORY[0x1E4F14838];
  *a1 = v13;
  a1[1] = v14;
  if (v13)
  {
    uint64_t v15 = v13;
    int v74 = a3;
    bzero(v13, v12);
    _DWORD *v15 = v11;
    unsigned int v16 = (void **)operator new(24 * v11);
    long long v73 = a5;
    int v72 = v12;
    v77 = v16;
    unsigned int v79 = &v16[3 * v11];
    size_t v17 = 24 * ((24 * (unint64_t)v11 - 24) / 0x18) + 24;
    bzero(v16, v17);
    unint64_t v18 = (void **)((char *)v16 + v17);
    unsigned int v78 = v18;
    unsigned int v19 = *(uint64_t ***)(a2 + 16);
    float v75 = a1;
    if (v19)
    {
      uint64_t v20 = v11;
      do
      {
        unsigned int v21 = **a1;
        uint64_t v23 = *((unsigned int *)v19 + 4);
        uint64_t v22 = *((unsigned int *)v19 + 5);
        uint64_t v24 = &v77[3 * ((unsigned __int16)(v23 >> 2) % v21)];
        uint64_t v26 = v24 + 1;
        uint64_t v25 = (uint64_t *)v24[1];
        unint64_t v27 = (unint64_t)v24[2];
        if ((unint64_t)v25 >= v27)
        {
          uint64_t v29 = ((char *)v25 - (unsigned char *)*v24) >> 3;
          if ((unint64_t)(v29 + 1) >> 61) {
            abort();
          }
          uint64_t v30 = v27 - (void)*v24;
          uint64_t v31 = v30 >> 2;
          if (v30 >> 2 <= (unint64_t)(v29 + 1)) {
            uint64_t v31 = v29 + 1;
          }
          if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v32 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v32 = v31;
          }
          if (v32) {
            unint64_t v32 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(v32);
          }
          else {
            uint64_t v33 = 0;
          }
          uint64_t v34 = (uint64_t *)(v32 + 8 * v29);
          *uint64_t v34 = v23 | (v22 << 32);
          uint64_t v28 = v34 + 1;
          int64_t v35 = (char *)*v26;
          int64_t v36 = (char *)*v24;
          if (*v26 == *v24)
          {
            a1 = (_DWORD **)v75;
          }
          else
          {
            a1 = (_DWORD **)v75;
            do
            {
              uint64_t v37 = *((void *)v35 - 1);
              v35 -= 8;
              *--uint64_t v34 = v37;
            }
            while (v35 != v36);
            int64_t v35 = (char *)*v24;
          }
          void *v24 = v34;
          *uint64_t v26 = v28;
          _OWORD v24[2] = (void *)(v32 + 8 * v33);
          if (v35) {
            operator delete(v35);
          }
        }
        else
        {
          *uint64_t v25 = v23 | (v22 << 32);
          uint64_t v28 = v25 + 1;
          a1 = (_DWORD **)v75;
        }
        *uint64_t v26 = v28;
        unsigned int v19 = (uint64_t **)*v19;
      }
      while (v19);
      unsigned int v16 = v77;
      unint64_t v18 = v78;
      uint64_t v11 = v20;
    }
    if (v16 != v18)
    {
      unsigned int v38 = a4 % v11;
      if (a4 / v11 <= 1) {
        unsigned int v39 = 1;
      }
      else {
        unsigned int v39 = a4 / v11;
      }
      do
      {
        uint64_t v40 = v11;
        if (v11 <= a4)
        {
          int v41 = 0;
          unint64_t v42 = (char *)v16[1];
          do
          {
            unint64_t v43 = (unint64_t)v16[2];
            if ((unint64_t)v42 >= v43)
            {
              uint64_t v44 = (v42 - (unsigned char *)*v16) >> 3;
              if ((unint64_t)(v44 + 1) >> 61) {
                abort();
              }
              uint64_t v45 = v43 - (void)*v16;
              uint64_t v46 = v45 >> 2;
              if (v45 >> 2 <= (unint64_t)(v44 + 1)) {
                uint64_t v46 = v44 + 1;
              }
              if ((unint64_t)v45 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v47 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v47 = v46;
              }
              if (v47) {
                unint64_t v47 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(v47);
              }
              else {
                uint64_t v48 = 0;
              }
              uint64_t v49 = (char *)(v47 + 8 * v44);
              *(void *)uint64_t v49 = 0xFFFFFFFF00000000;
              unint64_t v42 = v49 + 8;
              uint64_t v51 = (char *)*v16;
              uint64_t v50 = (char *)v16[1];
              if (v50 != *v16)
              {
                do
                {
                  uint64_t v52 = *((void *)v50 - 1);
                  v50 -= 8;
                  *((void *)v49 - 1) = v52;
                  v49 -= 8;
                }
                while (v50 != v51);
                uint64_t v50 = (char *)*v16;
              }
              *unsigned int v16 = v49;
              v16[1] = v42;
              v16[2] = (void *)(v47 + 8 * v48);
              if (v50) {
                operator delete(v50);
              }
            }
            else
            {
              *(void *)unint64_t v42 = 0xFFFFFFFF00000000;
              v42 += 8;
            }
            v16[1] = v42;
            ++v41;
          }
          while (v41 != v39);
        }
        if (v38)
        {
          CFRange v54 = v16[1];
          unint64_t v53 = (unint64_t)v16[2];
          if ((unint64_t)v54 >= v53)
          {
            uint64_t v56 = ((char *)v54 - (unsigned char *)*v16) >> 3;
            if ((unint64_t)(v56 + 1) >> 61) {
              abort();
            }
            uint64_t v57 = v53 - (void)*v16;
            uint64_t v58 = v57 >> 2;
            if (v57 >> 2 <= (unint64_t)(v56 + 1)) {
              uint64_t v58 = v56 + 1;
            }
            if ((unint64_t)v57 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v59 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v59 = v58;
            }
            uint64_t v11 = v40;
            if (v59) {
              unint64_t v59 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(v59);
            }
            else {
              uint64_t v60 = 0;
            }
            v61 = (void *)(v59 + 8 * v56);
            void *v61 = 0xFFFFFFFF00000000;
            char v55 = v61 + 1;
            long long v63 = (char *)*v16;
            long long v62 = (char *)v16[1];
            if (v62 != *v16)
            {
              do
              {
                uint64_t v64 = *((void *)v62 - 1);
                v62 -= 8;
                *--v61 = v64;
              }
              while (v62 != v63);
              long long v62 = (char *)*v16;
            }
            *unsigned int v16 = v61;
            v16[1] = v55;
            v16[2] = (void *)(v59 + 8 * v60);
            if (v62) {
              operator delete(v62);
            }
          }
          else
          {
            *CFRange v54 = 0xFFFFFFFF00000000;
            char v55 = v54 + 1;
            uint64_t v11 = v40;
          }
          v16[1] = v55;
          --v38;
        }
        else
        {
          uint64_t v11 = v40;
        }
        v16 += 3;
      }
      while (v16 != v18);
    }
    unint64_t v65 = 0;
    NSUInteger v66 = (NSUInteger)&v15[2 * v11 + 1];
    long long v67 = (_DWORD *)*v75;
    uint64_t v68 = 24 * v11;
    int v69 = (_DWORD *)(*v75 + 8);
    do
    {
      NSUInteger v70 = (NSUInteger)v77[v65 / 8];
      NSUInteger v71 = (NSUInteger)v77[v65 / 8 + 1] - v70;
      *(v69 - 1) = v71 >> 3;
      _DWORD *v69 = v66 - v67 + v74;
      if ((v71 >> 3)) {
        CSStore2::VM::Copy(v66, v70, (const void *)(8 * (v71 >> 3)));
      }
      v66 += v71 & 0x7FFFFFFF8;
      v65 += 24;
      v69 += 2;
    }
    while (v68 != v65);
    v80 = &v77;
    std::vector<std::vector<CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::KeyValuePair,std::allocator<CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::KeyValuePair>>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v80);
    LODWORD(v12) = v72;
    a5 = v73;
  }
  if (a5) {
    *a5 = v12;
  }
}

void sub_1A7DC4AB0(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0;
  MEMORY[0x1E4F14838](v2);
  _Unwind_Resume(a1);
}

void std::vector<std::vector<CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::KeyValuePair,std::allocator<CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::KeyValuePair>>>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    unsigned int v4 = (char *)v1[1];
    unsigned int v5 = **a1;
    if (v4 != v2)
    {
      int v6 = (char *)v1[1];
      do
      {
        uint64_t v8 = (void *)*((void *)v6 - 3);
        v6 -= 24;
        uint64_t v7 = v8;
        if (v8)
        {
          *((void *)v4 - 2) = v7;
          operator delete(v7);
        }
        unsigned int v4 = v6;
      }
      while (v6 != v2);
      unsigned int v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t __Block_byref_object_copy__81(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__82(uint64_t a1)
{
}

void ___ZN8CSStore25Store23CreateWithContentsOfURLEP5NSURLPU15__autoreleasingP7NSError_block_invoke(uint64_t a1, CSStore2::Table *this)
{
  if (this)
  {
    uint64_t v3 = **(void **)(a1 + 40);
    if (v3) {
      unint64_t v4 = *(void *)(v3 + 8);
    }
    else {
      unint64_t v4 = 0;
    }
    uint64_t v5 = 0xFFFFFFFFLL;
    BOOL v6 = (unint64_t)this >= v4;
    unint64_t v7 = (unint64_t)this - v4;
    if (v6 && !HIDWORD(v7))
    {
      if ((v7 + 1) > *(_DWORD *)(*(void *)(v3 + 8) + 12) || v7 == -1) {
        uint64_t v5 = 0xFFFFFFFFLL;
      }
      else {
        uint64_t v5 = v7;
      }
    }
  }
  else
  {
    uint64_t v5 = 0xFFFFFFFFLL;
  }
  uint64_t v9 = *((unsigned int *)this + 19);
  size_t v12 = (__CFString *)CSStore2::Table::copyCFName(this);
  unsigned int v10 = [NSString stringWithFormat:@"%@ offs", v12];
  uint64_t v11 = [NSString stringWithFormat:@"@0x%llX, $@0x%llX", v5, v9];
  [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:v10];
}

void sub_1A7DC4CD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

uint64_t CSStore2::GarbageCollection::Collect(CSStore2::GarbageCollection *this, FILE **a2, CSStore2::Store *a3, void *a4)
{
  char v5 = (char)a3;
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  if (*(void *)this) {
    uint64_t v8 = *(long long **)(*(void *)this + 8);
  }
  else {
    uint64_t v8 = 0;
  }
  BOOL IsNeeded = CSStore2::GarbageCollection::IsNeeded(this, a3);
  BOOL v10 = IsNeeded;
  uint64_t v11 = CSStore2::GarbageCollection::GetGCLog((CSStore2::GarbageCollection *)IsNeeded);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = this;
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(void *)&buf[14] = a2;
      _os_log_impl(&dword_1A7DB2000, v11, OS_LOG_TYPE_DEFAULT, "GCing and writing store %p with writer %p", buf, 0x16u);
    }

    if (CSStore2::IsAppleInternal(void)::once != -1) {
      dispatch_once(&CSStore2::IsAppleInternal(void)::once, &__block_literal_global_202);
    }
    int v14 = CSStore2::IsAppleInternal(void)::result;
    if (CSStore2::IsAppleInternal(void)::result)
    {
      unsigned int v15 = *((_DWORD *)v8 + 3);
      int v16 = *((_DWORD *)v8 + 4);
      size_t v17 = CSStore2::GarbageCollection::GetGCLog(v13);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(double *)&uint8_t buf[4] = (double)(v15 - v16) * 0.0009765625;
        *(_WORD *)&unsigned char buf[12] = 2048;
        *(double *)&buf[14] = (double)v15 * 0.0009765625;
        _os_log_impl(&dword_1A7DB2000, v17, OS_LOG_TYPE_DEFAULT, "Performing garbage collection to try to recover %.3f KB of %.3f KB.", buf, 0x16u);
      }
    }
    long long v18 = *v8;
    long long v19 = v8[2];
    *(_OWORD *)&buf[16] = v8[1];
    long long v68 = v19;
    *(_OWORD *)buf = v18;
    long long v20 = v8[3];
    long long v21 = v8[4];
    long long v22 = v8[5];
    int v72 = *((_DWORD *)v8 + 24);
    long long v70 = v21;
    long long v71 = v22;
    long long v69 = v20;
    id v62 = 0;
    BOOL v23 = CSStore2::Writer::seek(*a2, 100, 0, &v62);
    id v24 = v62;
    id v25 = v24;
    if (!v23) {
      goto LABEL_37;
    }
    id v61 = v24;
    uint64_t v26 = *(void *)this;
    if (*(void *)this) {
      uint64_t v26 = *(void *)(v26 + 8);
    }
    int v27 = CSStore2::GarbageCollection::WriteTableCommon(this, (unsigned int *)(v26 + 20), (uint64_t)&buf[20], a2, v5, (uint64_t)&v61);
    id v28 = v61;

    if (!v27)
    {
      id v25 = v28;
LABEL_37:
      uint64_t v43 = 0;
      goto LABEL_38;
    }
    if (!*a2 || (CSStore2::Writer::IO<int,__sFILE *>(MEMORY[0x1E4F14820], *a2) & 0x80000000) != 0) {
      __int16 v29 = 1;
    }
    else {
      __int16 v29 = 2;
    }
    *(_WORD *)&buf[6] = v29;
    ++*(_DWORD *)&buf[8];
    id v60 = v28;
    unint64_t v45 = CSStore2::Writer::tell(*a2, &v60);
    id v46 = v60;

    if (!HIDWORD(v45))
    {
      id v25 = v46;
      goto LABEL_37;
    }
    *(_DWORD *)&unsigned char buf[12] = v45;
    *(_DWORD *)&buf[16] = v45;
    id v59 = v46;
    BOOL v48 = CSStore2::Writer::pwrite(a2, buf, 0x64uLL, 0, &v59);
    id v25 = v59;

    if (v14 == 0 || !v48)
    {
      if (!v48) {
        goto LABEL_37;
      }
      goto LABEL_31;
    }
    if (!CSStore2::Writer::IO<int,__sFILE *,long long,int>(*a2, 0, 2))
    {
      id v58 = 0;
      unint64_t v49 = CSStore2::Writer::tell(*a2, &v58);
      uint64_t v50 = (CSStore2::GarbageCollection *)v58;
      uint64_t v52 = v50;
      if (HIDWORD(v49))
      {
        LODWORD(v51) = *((_DWORD *)v8 + 3);
        double v55 = ((double)v51 - (double)v49) * 0.0009765625;
        uint64_t v56 = CSStore2::GarbageCollection::GetGCLog(v50);
        unint64_t v53 = v56;
        if (v55 >= 0.0)
        {
          if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)unint64_t v65 = 134217984;
            double v66 = v55;
            _os_log_impl(&dword_1A7DB2000, v53, OS_LOG_TYPE_INFO, "Saved %.3f KB.", v65, 0xCu);
          }
          goto LABEL_55;
        }
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)unint64_t v65 = 134217984;
          double v66 = v55;
          CFRange v54 = "Failed to save space, to the order of %.3f KB.";
          goto LABEL_52;
        }
      }
      else
      {
        unint64_t v53 = CSStore2::GarbageCollection::GetGCLog(v50);
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)unint64_t v65 = 138412290;
          double v66 = *(double *)&v52;
          CFRange v54 = "Failed to get file offset after GC: %@";
LABEL_52:
          _os_log_error_impl(&dword_1A7DB2000, v53, OS_LOG_TYPE_ERROR, v54, v65, 0xCu);
        }
      }
LABEL_55:
    }
  }
  else
  {
    if (v12)
    {
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = this;
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(void *)&buf[14] = a2;
      _os_log_impl(&dword_1A7DB2000, v11, OS_LOG_TYPE_DEFAULT, "Writing store (no GC) %p with writer %p", buf, 0x16u);
    }

    long long v30 = *v8;
    long long v31 = v8[2];
    *(_OWORD *)&buf[16] = v8[1];
    long long v68 = v31;
    *(_OWORD *)buf = v30;
    long long v32 = v8[3];
    long long v33 = v8[4];
    long long v34 = v8[5];
    int v72 = *((_DWORD *)v8 + 24);
    long long v70 = v33;
    long long v71 = v34;
    long long v69 = v32;
    unsigned __int16 v35 = crc32(0x6E797267uLL, (const Bytef *)v8 + 100, *((_DWORD *)v8 + 3) - 100);
    if (v35 >= 3uLL) {
      __int16 v36 = v35;
    }
    else {
      __int16 v36 = v35 | 0xE000;
    }
    *(_WORD *)&buf[6] = v36;
    id v64 = 0;
    BOOL v37 = CSStore2::Writer::pwrite(a2, buf, 0x64uLL, 0, &v64);
    id v38 = v64;
    id v25 = v38;
    if (!v37) {
      goto LABEL_37;
    }
    unsigned int v39 = *((_DWORD *)v8 + 3) + *MEMORY[0x1E4F14B00] - 1;
    if (v39 == v39 % *MEMORY[0x1E4F14B00]) {
      int v40 = *MEMORY[0x1E4F14B00];
    }
    else {
      int v40 = v39 / *MEMORY[0x1E4F14B00] * *MEMORY[0x1E4F14B00];
    }
    id v63 = v38;
    BOOL v41 = CSStore2::Writer::pwrite(a2, (char *)v8 + 100, (v40 - 100), 100, &v63);
    id v42 = v63;

    if (!v41)
    {
      uint64_t v43 = 0;
      id v25 = v42;
      goto LABEL_38;
    }
    id v25 = v42;
  }
LABEL_31:
  id v57 = v25;
  uint64_t v43 = CSStore2::Writer::sync((void **)a2, &v57);
  id v44 = v57;

  id v25 = v44;
LABEL_38:
  if (a4 && (v43 & 1) == 0) {
    *a4 = v25;
  }

  return v43;
}

void sub_1A7DC52F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void CSStore2::Writer::~Writer(void **this)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (*((unsigned char *)this + 8) && *this)
  {
    if (*((unsigned char *)this + 9))
    {
      int v2 = CSStore2::Writer::IO<int,__sFILE *>(MEMORY[0x1E4F14820], *this);
      if ((v2 & 0x80000000) == 0)
      {
        int v3 = v2;
        bzero(v9, 0x400uLL);
        if (CSStore2::Writer::IO<int,char *>(v3, v9) != -1) {
          CSStore2::Writer::IO<int,char const*>((const char *)v9);
        }
      }
    }
    unint64_t v4 = (CSStore2 *)CSStore2::Writer::IO<int,__sFILE *>(MEMORY[0x1E4F14800], *this);
    if (v4)
    {
      char v5 = CSStore2::GetLog(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v6 = *__error();
        unint64_t v7 = __error();
        uint64_t v8 = strerror(*v7);
        v9[0] = 67109378;
        v9[1] = v6;
        __int16 v10 = 2082;
        uint64_t v11 = v8;
        _os_log_error_impl(&dword_1A7DB2000, v5, OS_LOG_TYPE_ERROR, "Failed to close file handle for store writer: %i (%{public}s).", (uint8_t *)v9, 0x12u);
      }
    }
  }
}

void sub_1A7DC5478(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t CSStore2::Writer::IO<int,__sFILE *>(CSStore2 *a1, void *a2)
{
  uint64_t v5 = ((uint64_t (*)(void *))a1)(a2);
  int v11 = v5;
  if (CSStore2::Writer::logIO == 1)
  {
    __p = a2;
    CSStore2::Writer::toString<__sFILE *>();
    CSStore2::Writer::toString<int>();
    CSStore2::Writer::logFunctionCall(*(CSStore2 **)(vars0 + 8), v2, a1, (uint64_t)&v9, 1, (uint64_t)&__p);
    if (v8 < 0) {
      operator delete(__p);
    }
    if (v10 < 0) {
      operator delete(v9);
    }
  }
  return v5;
}

void sub_1A7DC5554(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t CSStore2::Writer::IO<int,char *>(int a1, void *a2)
{
  uint64_t v5 = fcntl(a1, 50, a2);
  v11[7] = v5;
  if (CSStore2::Writer::logIO == 1)
  {
    v11[8] = 50;
    v11[9] = a1;
    __p[0] = a2;
    CSStore2::Writer::toString<int>();
    CSStore2::Writer::toString<int>();
    CSStore2::Writer::toString<char *>((uint64_t)v11, (const char **)__p);
    CSStore2::Writer::toString<int>();
    CSStore2::Writer::logFunctionCall(*(CSStore2 **)(vars0 + 8), v2, MEMORY[0x1E4F14808], (uint64_t)v10, 3, (uint64_t)__p);
    if (v9 < 0) {
      operator delete(__p[0]);
    }
    for (uint64_t i = 0; i != -18; i -= 6)
    {
      if (SHIBYTE(v11[i + 5]) < 0) {
        operator delete(*(void **)&v10[i * 4 + 48]);
      }
    }
  }
  return v5;
}

void sub_1A7DC56A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  uint64_t v18 = 0;
  while (1)
  {
    if (*(&a17 + v18 + 71) < 0) {
      operator delete(*(void **)(&a17 + v18 + 48));
    }
    v18 -= 24;
    if (v18 == -72) {
      _Unwind_Resume(exception_object);
    }
  }
}

void CSStore2::Writer::IO<int,char const*>(const char *a1)
{
  int v7 = unlink(a1);
  if (CSStore2::Writer::logIO == 1)
  {
    __p[0] = (void *)a1;
    CSStore2::Writer::toString<char const*>((uint64_t)v5, (const char **)__p);
    CSStore2::Writer::toString<int>();
    CSStore2::Writer::logFunctionCall(*(CSStore2 **)(vars0 + 8), v1, MEMORY[0x1E4F14AD8], (uint64_t)v5, 1, (uint64_t)__p);
    if (v4 < 0) {
      operator delete(__p[0]);
    }
    if (v6 < 0) {
      operator delete(v5[0]);
    }
  }
}

void sub_1A7DC57D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t CSStore2::Writer::toString<char const*>(uint64_t a1, const char **a2)
{
  std::ostringstream::basic_ostringstream[abi:nn180100]((uint64_t)v6);
  int v3 = *a2;
  size_t v4 = strlen(v3);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v6, (uint64_t)v3, v4);
  std::stringbuf::str();
  v6[0] = *MEMORY[0x1E4FBA418];
  *(void *)((char *)v6 + *(void *)(v6[0] - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
  v6[1] = MEMORY[0x1E4FBA470] + 16;
  if (v7 < 0) {
    operator delete((void *)v6[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1AD0DAC80](&v8);
}

void sub_1A7DC5948(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t CSStore2::Writer::toString<int>()
{
  std::ostringstream::basic_ostringstream[abi:nn180100]((uint64_t)v1);
  std::ostream::operator<<();
  std::stringbuf::str();
  v1[0] = *MEMORY[0x1E4FBA418];
  *(void *)((char *)v1 + *(void *)(v1[0] - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
  v1[1] = MEMORY[0x1E4FBA470] + 16;
  if (v2 < 0) {
    operator delete((void *)v1[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1AD0DAC80](&v3);
}

void sub_1A7DC5A90(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::ostringstream::basic_ostringstream[abi:nn180100](uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1E4FBA498] + 64;
  *(void *)(a1 + 112) = MEMORY[0x1E4FBA498] + 64;
  uint64_t v3 = *(void *)(MEMORY[0x1E4FBA418] + 16);
  uint64_t v4 = *(void *)(MEMORY[0x1E4FBA418] + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + *(void *)(v4 - 24)) = v3;
  uint64_t v5 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v5, (void *)(a1 + 8));
  uint64_t v6 = MEMORY[0x1E4FBA498] + 24;
  v5[1].__vftable = 0;
  v5[1].__fmtflags_ = -1;
  *(void *)a1 = v6;
  *(void *)(a1 + 112) = v2;
  std::streambuf::basic_streambuf();
  *(void *)(a1 + 8) = MEMORY[0x1E4FBA470] + 16;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 16;
  return a1;
}

void sub_1A7DC5C14(_Unwind_Exception *a1)
{
  std::ostream::~ostream();
  MEMORY[0x1AD0DAC80](v1);
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
  MEMORY[0x1AD0DAC80](a1 + 112);
  return a1;
}

void *std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x1AD0DAB80](v23, a1);
  if (v23[0])
  {
    uint64_t v6 = (char *)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *((void *)v6 + 5);
    int v8 = *((_DWORD *)v6 + 2);
    int v9 = *((_DWORD *)v6 + 36);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      char v10 = std::locale::use_facet(&__b, MEMORY[0x1E4FBA258]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&__b);
      *((_DWORD *)v6 + 36) = v9;
    }
    uint64_t v11 = a2 + a3;
    if ((v8 & 0xB0) == 0x20) {
      uint64_t v12 = a2 + a3;
    }
    else {
      uint64_t v12 = a2;
    }
    if (!v7) {
      goto LABEL_29;
    }
    uint64_t v13 = *((void *)v6 + 3);
    BOOL v14 = v13 <= a3;
    uint64_t v15 = v13 - a3;
    size_t v16 = v14 ? 0 : v15;
    if (v12 - a2 >= 1
      && (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v7 + 96))(v7, a2, v12 - a2) != v12 - a2)
    {
      goto LABEL_29;
    }
    if ((uint64_t)v16 >= 1)
    {
      if (v16 >= 0x7FFFFFFFFFFFFFF8) {
        abort();
      }
      if (v16 >= 0x17)
      {
        uint64_t v18 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v16 | 7) != 0x17) {
          uint64_t v18 = v16 | 7;
        }
        uint64_t v19 = v18 + 1;
        p_b = (std::locale::__imp *)operator new(v18 + 1);
        size_t v25 = v16;
        int64_t v26 = v19 | 0x8000000000000000;
        __b.__locale_ = p_b;
      }
      else
      {
        HIBYTE(v26) = v16;
        p_b = (std::locale::__imp *)&__b;
      }
      memset(p_b, v9, v16);
      *((unsigned char *)p_b + v16) = 0;
      long long v20 = v26 >= 0 ? &__b : (std::locale *)__b.__locale_;
      uint64_t v21 = (*(uint64_t (**)(uint64_t, std::locale *, size_t))(*(void *)v7 + 96))(v7, v20, v16);
      if (SHIBYTE(v26) < 0) {
        operator delete(__b.__locale_);
      }
      if (v21 != v16) {
        goto LABEL_29;
      }
    }
    if (v11 - v12 < 1
      || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v7 + 96))(v7, v12, v11 - v12) == v11 - v12)
    {
      *((void *)v6 + 3) = 0;
    }
    else
    {
LABEL_29:
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x1AD0DAB90](v23);
  return a1;
}

void sub_1A7DC5FDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  MEMORY[0x1AD0DAB90](&a10);
  _Unwind_Resume(a1);
}

uint64_t CSStore2::Writer::toString<char *>(uint64_t a1, const char **a2)
{
  std::ostringstream::basic_ostringstream[abi:nn180100]((uint64_t)v6);
  uint64_t v3 = *a2;
  size_t v4 = strlen(v3);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v6, (uint64_t)v3, v4);
  std::stringbuf::str();
  v6[0] = *MEMORY[0x1E4FBA418];
  *(void *)((char *)v6 + *(void *)(v6[0] - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
  v6[1] = MEMORY[0x1E4FBA470] + 16;
  if (v7 < 0) {
    operator delete((void *)v6[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1AD0DAC80](&v8);
}

void sub_1A7DC6160(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t CSStore2::Writer::toString<__sFILE *>()
{
  std::ostringstream::basic_ostringstream[abi:nn180100]((uint64_t)v1);
  std::ostream::operator<<();
  std::stringbuf::str();
  v1[0] = *MEMORY[0x1E4FBA418];
  *(void *)((char *)v1 + *(void *)(v1[0] - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
  v1[1] = MEMORY[0x1E4FBA470] + 16;
  if (v2 < 0) {
    operator delete((void *)v1[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1AD0DAC80](&v3);
}

void sub_1A7DC62A8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL CSStore2::GarbageCollection::IsNeeded(CSStore2::GarbageCollection *this, const CSStore2::Store *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  if (a2)
  {
    uint64_t v5 = CSStore2::GarbageCollection::GetGCLog(this);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7DB2000, v5, OS_LOG_TYPE_INFO, "Forced. Will collect.", buf, 2u);
    }
  }
  else
  {
    if (!*(void *)this
      || (uint64_t v2 = *(void *)(*(void *)this + 8),
          unsigned int v3 = *(_DWORD *)(v2 + 12),
          LODWORD(v2) = *(_DWORD *)(v2 + 16),
          uint64_t v4 = v3 - v2,
          v3 <= v2)
      || v4 <= 0x80000)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      _OWORD v8[2] = ___ZN8CSStore217GarbageCollection8IsNeededERKNS_5StoreEh_block_invoke;
      void v8[3] = &unk_1E5D2A690;
      char v9 = (char)a2;
      void v8[4] = &v10;
      v8[5] = this;
      CSStore2::Store::enumerateTables((atomic_ullong *)this, v8);
      BOOL v6 = *((unsigned char *)v11 + 24) != 0;
      goto LABEL_12;
    }
    uint64_t v5 = CSStore2::GarbageCollection::GetGCLog(this);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v15 = v4;
      _os_log_impl(&dword_1A7DB2000, v5, OS_LOG_TYPE_INFO, "Store wastes %llu bytes. Will collect.", buf, 0xCu);
    }
  }

  BOOL v6 = 1;
  *((unsigned char *)v11 + 24) = 1;
LABEL_12:
  _Block_object_dispose(&v10, 8);
  return v6;
}

void sub_1A7DC6468(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id CSStore2::GarbageCollection::GetGCLog(CSStore2::GarbageCollection *this)
{
  if (CSStore2::GarbageCollection::GetGCLog(void)::once != -1) {
    dispatch_once(&CSStore2::GarbageCollection::GetGCLog(void)::once, &__block_literal_global_206);
  }
  uint64_t v1 = (void *)CSStore2::GarbageCollection::GetGCLog(void)::result;

  return v1;
}

BOOL CSStore2::Writer::pwrite(FILE **a1, const void *a2, size_t a3, off_t a4, void *a5)
{
  id v22 = 0;
  unint64_t v10 = CSStore2::Writer::tell(*a1, &v22);
  id v11 = v22;
  id v12 = v11;
  if (HIDWORD(v10))
  {
    if (v10 != a4)
    {
      id v21 = v11;
      BOOL v14 = CSStore2::Writer::seek(*a1, a4, 0, &v21);
      id v15 = v21;

      if (!v14) {
        goto LABEL_9;
      }
      id v12 = v15;
    }
    id v20 = v12;
    BOOL v16 = CSStore2::Writer::write(*a1, a2, a3, &v20);
    id v15 = v20;

    if (v16)
    {
      id v19 = v15;
      BOOL v13 = CSStore2::Writer::seek(*a1, v10, 0, &v19);
      id v17 = v19;

      id v15 = v17;
      if (!a5) {
        goto LABEL_12;
      }
LABEL_10:
      if (!v13)
      {
        id v12 = v15;
        BOOL v13 = 0;
        *a5 = v12;
        goto LABEL_13;
      }
LABEL_12:
      id v12 = v15;
      goto LABEL_13;
    }
LABEL_9:
    BOOL v13 = 0;
    if (!a5) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  BOOL v13 = 1;
LABEL_13:

  return v13;
}

void sub_1A7DC663C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL CSStore2::Writer::seek(FILE *a1, off_t a2, int a3, void *a4)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  int v5 = CSStore2::Writer::IO<int,__sFILE *,long long,int>(a1, a2, a3);
  int v6 = v5;
  if (a4 && v5)
  {
    char v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = *__error();
    v11[0] = *MEMORY[0x1E4F28228];
    v11[1] = @"Line";
    v12[0] = @"errno";
    v12[1] = &unk_1EFE43740;
    char v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
    *a4 = [v7 errorWithDomain:*MEMORY[0x1E4F28798] code:v8 userInfo:v9];
  }
  return v6 == 0;
}

void sub_1A7DC6750(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t CSStore2::GarbageCollection::WriteTableCommon(CSStore2::Store *this, unsigned int *a2, uint64_t a3, FILE **a4, char a5, uint64_t a6)
{
  v55[2] = *MEMORY[0x1E4F143B8];
  uint64_t v46 = 0;
  unint64_t v47 = &v46;
  uint64_t v48 = 0x2020000000;
  char v49 = 1;
  uint64_t v40 = 0;
  BOOL v41 = &v40;
  uint64_t v42 = 0x3032000000;
  uint64_t v43 = __Block_byref_object_copy__81;
  id v44 = __Block_byref_object_dispose__82;
  id v45 = 0;
  uint64_t v32 = 0;
  long long v33 = &v32;
  uint64_t v34 = 0x5812000000;
  unsigned __int16 v35 = __Block_byref_object_copy__213;
  memset(v37, 0, sizeof(v37));
  __int16 v36 = __Block_byref_object_dispose__214;
  uint64_t v38 = 0;
  int v39 = 1065353216;
  atomic_ullong Table = *((void *)this + 35);
  if (!Table) {
    atomic_ullong Table = CSStore2::Store::getTable((atomic_ullong *)this, &cfstr_Dictionary.isa);
  }
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = ___ZN8CSStore217GarbageCollection16WriteTableCommonERKNS_5StoreEPKNS_5TableEPS4_RNS_6WriterEhPU15__autoreleasingP7NSError_block_invoke;
  v29[3] = &unk_1E5D2A668;
  BOOL v30 = Table == (void)a2;
  v29[7] = a4;
  v29[8] = this;
  v29[4] = &v40;
  v29[5] = &v46;
  char v31 = a5;
  v29[6] = &v32;
  CSStore2::Store::enumerateUnits((atomic_ullong *)this, a2, v29);
  if (*((unsigned char *)v47 + 24))
  {
    BOOL v13 = (id *)(v41 + 5);
    obuint64_t j = (id)v41[5];
    unint64_t v14 = CSStore2::Writer::tell(*a4, &obj);
    objc_storeStrong(v13, obj);
    if (HIDWORD(v14))
    {
      id v15 = v33;
      BOOL v16 = (id *)(v41 + 5);
      id v17 = (void *)v41[5];
      id v53 = 0;
      unint64_t v18 = CSStore2::Writer::tell(*a4, &v53);
      id v19 = v53;
      if (HIDWORD(v18))
      {
        unsigned int v52 = 0;
        CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::Create(v51, (uint64_t)(v15 + 6), v18, 0, &v52);
        id v20 = v51[0];
        if (v51[0])
        {
          id v50 = v19;
          BOOL v21 = CSStore2::Writer::write(*a4, v51[0], v52, &v50);
          id v22 = v50;

          ((void (*)(_DWORD *))v51[1])(v20);
          if (v21)
          {

            objc_storeStrong(v16, v17);
            a6 = 1;
            *((unsigned char *)v47 + 24) = 1;
            *(_DWORD *)(a3 + 76) = v14;
            goto LABEL_15;
          }
          id v19 = v22;
        }
        else
        {
          BOOL v23 = (void *)MEMORY[0x1E4F28C58];
          v54[0] = *MEMORY[0x1E4F28228];
          v54[1] = @"Line";
          v55[0] = @"kCSStoreAllocFailedErr";
          v55[1] = &unk_1EFE43770;
          id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:2];
          uint64_t v25 = [v23 errorWithDomain:*MEMORY[0x1E4F28760] code:-9493 userInfo:v24];

          id v19 = (id)v25;
        }
      }
      id v26 = v19;

      objc_storeStrong(v16, v26);
    }
    *((unsigned char *)v47 + 24) = 0;
  }
  if (a6)
  {
    *(void *)a6 = (id) v41[5];
    a6 = *((unsigned char *)v47 + 24) != 0;
  }
LABEL_15:
  _Block_object_dispose(&v32, 8);
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)&v37[8]);
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);
  return a6;
}

void sub_1A7DC6B28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,id a37)
{
  _Block_object_dispose(&a21, 8);
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table(v37);
  _Block_object_dispose(&a32, 8);

  _Block_object_dispose((const void *)(v40 - 200), 8);
  _Unwind_Resume(a1);
}

uint64_t CSStore2::Writer::tell(FILE *a1, void *a2)
{
  v17[2] = *MEMORY[0x1E4F143B8];
  off_t v3 = CSStore2::Writer::IO<long long,__sFILE *>(a1);
  if (v3 < 0x100000000)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      id v7 = 0;
      uint64_t v8 = v3 & 0xFFFFFF00;
      uint64_t v9 = v3;
      uint64_t v10 = 0x100000000;
      goto LABEL_9;
    }
    id v11 = (void *)MEMORY[0x1E4F28C58];
    int v12 = *__error();
    v14[0] = *MEMORY[0x1E4F28228];
    v14[1] = @"Line";
    v15[0] = @"errno";
    v15[1] = &unk_1EFE437A0;
    int v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
    uint64_t v6 = [v11 errorWithDomain:*MEMORY[0x1E4F28798] code:v12 userInfo:v5];
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F28C58];
    v16[0] = *MEMORY[0x1E4F28228];
    v16[1] = @"Line";
    v17[0] = @"ERANGE";
    v17[1] = &unk_1EFE43788;
    int v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
    uint64_t v6 = [v4 errorWithDomain:*MEMORY[0x1E4F28798] code:34 userInfo:v5];
  }
  id v7 = (id)v6;

  if (a2)
  {
    id v7 = v7;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    *a2 = v7;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
LABEL_9:

  return v9 | v8 | v10;
}

void sub_1A7DC6D68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t CSStore2::Writer::IO<int,__sFILE *,long long,int>(FILE *a1, off_t a2, int a3)
{
  uint64_t v7 = fseeko(a1, a2, a3);
  int v13 = v7;
  if (CSStore2::Writer::logIO == 1)
  {
    __p = a1;
    off_t v15 = a2;
    int v14 = a3;
    CSStore2::Writer::toString<__sFILE *>();
    CSStore2::Writer::toString<long long>();
    CSStore2::Writer::toString<int>();
    CSStore2::Writer::toString<int>();
    CSStore2::Writer::logFunctionCall(*(CSStore2 **)(vars0 + 8), v3, MEMORY[0x1E4F14840], (uint64_t)v12, 3, (uint64_t)&__p);
    if (v11 < 0) {
      operator delete(__p);
    }
    for (uint64_t i = 0; i != -72; i -= 24)
    {
      if ((char)v12[i + 71] < 0) {
        operator delete(*(void **)&v12[i + 48]);
      }
    }
  }
  return v7;
}

void sub_1A7DC6EA0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  uint64_t v16 = 0;
  while (1)
  {
    if (*(&a15 + v16 + 71) < 0) {
      operator delete(*(void **)(&a15 + v16 + 48));
    }
    v16 -= 24;
    if (v16 == -72) {
      _Unwind_Resume(exception_object);
    }
  }
}

uint64_t CSStore2::Writer::sync(void **a1, void *a2)
{
  v53[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (CSStore2 *)CSStore2::Writer::IO<int,__sFILE *>(MEMORY[0x1E4F14818], *a1);
  int v5 = (int)v4;
  uint64_t v6 = CSStore2::GetLog(v4);
  uint64_t v7 = v6;
  if (!v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      unsigned __int16 v35 = *a1;
      *(_DWORD *)buf = 134217984;
      *(void *)uint64_t v48 = v35;
      _os_log_debug_impl(&dword_1A7DB2000, v7, OS_LOG_TYPE_DEBUG, "Successfully called fflush(%p)", buf, 0xCu);
    }

    uint64_t v14 = CSStore2::Writer::IO<int,__sFILE *>(MEMORY[0x1E4F14820], *a1);
    uint64_t v15 = v14;
    if ((v14 & 0x80000000) == 0)
    {
      uint64_t v16 = (CSStore2 *)CSStore2::Writer::IO<int,int>(v14);
      if (v16)
      {
        id v17 = (CSStore2 *)__error();
        int v18 = *(_DWORD *)v17;
        id v19 = CSStore2::GetLog(v17);
        BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
        if (v18 == 28)
        {
          if (v20)
          {
            int v36 = *__error();
            uint64_t v37 = __error();
            uint64_t v38 = strerror(*v37);
            *(_DWORD *)buf = 67109634;
            *(_DWORD *)uint64_t v48 = v15;
            *(_WORD *)&v48[4] = 1024;
            *(_DWORD *)&v48[6] = v36;
            LOWORD(v49[0]) = 2082;
            *(void *)((char *)v49 + 2) = v38;
            _os_log_error_impl(&dword_1A7DB2000, v19, OS_LOG_TYPE_ERROR, "Error calling fcntl(%i, F_FULLFSYNC): %i (%{public}s).", buf, 0x18u);
          }

          BOOL v21 = (void *)MEMORY[0x1E4F28C58];
          int v22 = *__error();
          v52[0] = *MEMORY[0x1E4F28228];
          v52[1] = @"Line";
          v53[0] = @"errno";
          v53[1] = &unk_1EFE437B8;
          uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:2];
          uint64_t v11 = [v21 errorWithDomain:*MEMORY[0x1E4F28798] code:v22 userInfo:v10];
          goto LABEL_5;
        }
        if (v20)
        {
          int v39 = *__error();
          uint64_t v40 = __error();
          BOOL v41 = strerror(*v40);
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)uint64_t v48 = v15;
          *(_WORD *)&v48[4] = 1024;
          *(_DWORD *)&v48[6] = v39;
          LOWORD(v49[0]) = 2082;
          *(void *)((char *)v49 + 2) = v41;
          _os_log_error_impl(&dword_1A7DB2000, v19, OS_LOG_TYPE_ERROR, "Error calling fcntl(%i, F_FULLFSYNC), trying fsync(): %i (%{public}s).", buf, 0x18u);
        }

        id v24 = (CSStore2 *)CSStore2::Writer::IO<int,int>(MEMORY[0x1E4F14850], v15);
        int v25 = (int)v24;
        id v26 = CSStore2::GetLog(v24);
        int v27 = v26;
        if (v25)
        {
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            int v42 = *__error();
            uint64_t v43 = __error();
            id v44 = strerror(*v43);
            *(_DWORD *)buf = 67109634;
            *(_DWORD *)uint64_t v48 = v15;
            *(_WORD *)&v48[4] = 1024;
            *(_DWORD *)&v48[6] = v42;
            LOWORD(v49[0]) = 2082;
            *(void *)((char *)v49 + 2) = v44;
            _os_log_error_impl(&dword_1A7DB2000, v27, OS_LOG_TYPE_ERROR, "Error calling fsync(%i): %i (%{public}s).", buf, 0x18u);
          }

          id v28 = (void *)MEMORY[0x1E4F28C58];
          int v29 = *__error();
          v50[0] = *MEMORY[0x1E4F28228];
          v50[1] = @"Line";
          v51[0] = @"errno";
          v51[1] = &unk_1EFE437D0;
          uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:2];
          uint64_t v11 = [v28 errorWithDomain:*MEMORY[0x1E4F28798] code:v29 userInfo:v10];
          goto LABEL_5;
        }
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)uint64_t v48 = v15;
          _os_log_debug_impl(&dword_1A7DB2000, v27, OS_LOG_TYPE_DEBUG, "Successfully called fsync(%i)", buf, 8u);
        }
      }
      else
      {
        BOOL v23 = CSStore2::GetLog(v16);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)uint64_t v48 = v15;
          _os_log_debug_impl(&dword_1A7DB2000, v23, OS_LOG_TYPE_DEBUG, "Successfully called fcntl(%i, F_FULLFSYNC)", buf, 8u);
        }
      }
    }
    id v12 = 0;
    uint64_t v13 = 1;
    goto LABEL_29;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    BOOL v30 = *a1;
    int v31 = *__error();
    uint64_t v32 = __error();
    long long v33 = strerror(*v32);
    *(_DWORD *)buf = 134218498;
    *(void *)uint64_t v48 = v30;
    *(_WORD *)&v48[8] = 1024;
    v49[0] = v31;
    LOWORD(v49[1]) = 2082;
    *(void *)((char *)&v49[1] + 2) = v33;
    _os_log_error_impl(&dword_1A7DB2000, v7, OS_LOG_TYPE_ERROR, "Error calling fflush(%p): %i (%{public}s).", buf, 0x1Cu);
  }

  uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
  int v9 = *__error();
  v45[0] = *MEMORY[0x1E4F28228];
  v45[1] = @"Line";
  v46[0] = @"errno";
  v46[1] = &unk_1EFE437E8;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:2];
  uint64_t v11 = [v8 errorWithDomain:*MEMORY[0x1E4F28798] code:v9 userInfo:v10];
LABEL_5:
  id v12 = (id)v11;

  if (a2)
  {
    id v12 = v12;
    uint64_t v13 = 0;
    *a2 = v12;
  }
  else
  {
    uint64_t v13 = 0;
  }
LABEL_29:

  return v13;
}

void sub_1A7DC7480(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t CSStore2::Writer::IO<int,int>(int a1)
{
  uint64_t v3 = fcntl(a1, 51, 1);
  int v9 = v3;
  if (CSStore2::Writer::logIO == 1)
  {
    LODWORD(__p) = a1;
    int v10 = 1;
    int v11 = 51;
    CSStore2::Writer::toString<int>();
    CSStore2::Writer::toString<int>();
    CSStore2::Writer::toString<int>();
    CSStore2::Writer::toString<int>();
    CSStore2::Writer::logFunctionCall(*(CSStore2 **)(vars0 + 8), v1, MEMORY[0x1E4F14808], (uint64_t)v8, 3, (uint64_t)&__p);
    if (v7 < 0) {
      operator delete(__p);
    }
    for (uint64_t i = 0; i != -72; i -= 24)
    {
      if ((char)v8[i + 71] < 0) {
        operator delete(*(void **)&v8[i + 48]);
      }
    }
  }
  return v3;
}

void sub_1A7DC7600(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  uint64_t v18 = 0;
  while (1)
  {
    if (*(&a17 + v18 + 71) < 0) {
      operator delete(*(void **)(&a17 + v18 + 48));
    }
    v18 -= 24;
    if (v18 == -72) {
      _Unwind_Resume(exception_object);
    }
  }
}

uint64_t CSStore2::Writer::IO<int,int>(CSStore2 *a1, uint64_t a2)
{
  int v3 = a2;
  uint64_t v5 = ((uint64_t (*)(uint64_t))a1)(a2);
  int v11 = v5;
  if (CSStore2::Writer::logIO == 1)
  {
    LODWORD(__p) = v3;
    CSStore2::Writer::toString<int>();
    CSStore2::Writer::toString<int>();
    CSStore2::Writer::logFunctionCall(*(CSStore2 **)(vars0 + 8), v2, a1, (uint64_t)&v9, 1, (uint64_t)&__p);
    if (v8 < 0) {
      operator delete(__p);
    }
    if (v10 < 0) {
      operator delete(v9);
    }
  }
  return v5;
}

void sub_1A7DC7734(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t CSStore2::Writer::toString<long long>()
{
  std::ostringstream::basic_ostringstream[abi:nn180100]((uint64_t)v1);
  std::ostream::operator<<();
  std::stringbuf::str();
  v1[0] = *MEMORY[0x1E4FBA418];
  *(void *)((char *)v1 + *(void *)(v1[0] - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
  v1[1] = MEMORY[0x1E4FBA470] + 16;
  if (v2 < 0) {
    operator delete((void *)v1[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1AD0DAC80](&v3);
}

void sub_1A7DC789C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

off_t CSStore2::Writer::IO<long long,__sFILE *>(FILE *a1)
{
  off_t v3 = ftello(a1);
  off_t v9 = v3;
  if (CSStore2::Writer::logIO == 1)
  {
    __p = a1;
    CSStore2::Writer::toString<__sFILE *>();
    CSStore2::Writer::toString<long long>();
    CSStore2::Writer::logFunctionCall(*(CSStore2 **)(vars0 + 8), v1, MEMORY[0x1E4F14858], (uint64_t)&v7, 1, (uint64_t)&__p);
    if (v6 < 0) {
      operator delete(__p);
    }
    if (v8 < 0) {
      operator delete(v7);
    }
  }
  return v3;
}

void sub_1A7DC7978(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t __Block_byref_object_copy__213(uint64_t result, void *a2)
{
  uint64_t v2 = a2[6];
  a2[6] = 0;
  *(void *)(result + 48) = v2;
  *(void *)(result + 56) = a2[7];
  a2[7] = 0;
  uint64_t v5 = a2[8];
  off_t v3 = a2 + 8;
  uint64_t v4 = v5;
  *(void *)(result + 64) = v5;
  uint64_t v6 = v3[1];
  *(void *)(result + 72) = v6;
  *(_DWORD *)(result + 80) = *((_DWORD *)v3 + 4);
  if (v6)
  {
    unint64_t v7 = *(void *)(v4 + 8);
    unint64_t v8 = *(void *)(result + 56);
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
    *(void *)(v2 + 8 * v7) = result + 64;
    *off_t v3 = 0;
    v3[1] = 0;
  }
  return result;
}

uint64_t __Block_byref_object_dispose__214(uint64_t a1)
{
  return std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table(a1 + 48);
}

void ___ZN8CSStore217GarbageCollection16WriteTableCommonERKNS_5StoreEPKNS_5TableEPS4_RNS_6WriterEhPU15__autoreleasingP7NSError_block_invoke(uint64_t a1, _DWORD *a2, unsigned char *a3)
{
  uint64_t v187 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(FILE ***)(a1 + 56);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  obuint64_t j = *(id *)(v6 + 40);
  unint64_t v167 = CSStore2::Writer::tell(*v5, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  if (!HIDWORD(v167))
  {
    uint64_t v7 = a1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    goto LABEL_242;
  }
  if (*(unsigned char *)(a1 + 72))
  {
    CSStore2::Dictionary::Get((CSStore2::Dictionary *)&v184, *(CSStore2::Store **)(a1 + 64), 4 * *a2);
    if (!BYTE8(v185))
    {
      uint64_t v7 = a1;
      goto LABEL_202;
    }
    unint64_t v8 = v184;
    unsigned int v9 = v185;
    char v10 = *(FILE ***)(a1 + 56);
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v13 = *(void **)(v11 + 40);
    id v12 = (id *)(v11 + 40);
    id v172 = v13;
    atomic_ullong Table = *(const CSStore2::Table **)(v184 + 280);
    if (!Table) {
      atomic_ullong Table = (const CSStore2::Table *)CSStore2::Store::getTable((atomic_ullong *)v184, &cfstr_Dictionary.isa);
    }
    Unit = CSStore2::Store::getUnit((CSStore2 **)v8, Table, v9);
    if (Unit)
    {
      *(void *)&v177[1] = *((void *)Unit + 1);
      if (v177[2] != -1)
      {
        uint64_t v16 = *(void *)(*(void *)v8 + 8);
        if (*(_DWORD *)(v16 + 12) > v177[2])
        {
          v154 = Unit;
          v156 = v12;
          v158 = a2;
          v160 = v10;
          id v17 = (unsigned int *)(v16 + v177[2]);
          long long v184 = 0u;
          long long v185 = 0u;
          float v186 = 1.0;
          unint64_t v18 = *v17;
          if (v18)
          {
            uint64_t v19 = 0;
            unint64_t v20 = 0;
            uint64_t v21 = 0;
            v163 = (CSStore2 **)v8;
            v161 = (unsigned int *)(v16 + v177[2]);
            while (1)
            {
              int v22 = &v17[2 * v21];
              unsigned int v23 = v22[1];
              v169 = v22 + 1;
              if (v23 - 0x20000000 >= 0xE0000001)
              {
                uint64_t v24 = v17[2 * v21 + 2];
                if (!__CFADD__(v24, 8 * v23))
                {
                  uint64_t v25 = *(void *)(*(void *)v8 + 8);
                  unsigned int v26 = *(_DWORD *)(v25 + 12);
                  if (v24 + 8 * v23 <= v26 && v26 > v24) {
                    break;
                  }
                }
              }
LABEL_63:
              if (++v21 >= v18) {
                goto LABEL_64;
              }
            }
            uint64_t v28 = 0;
            uint64_t v29 = v25 + v24;
            while (1)
            {
              BOOL v30 = (unsigned int *)(v29 + 8 * v28);
              unint64_t v31 = *v30;
              if (v31)
              {
                unint64_t v3 = v30[1];
                if (v3) {
                  break;
                }
              }
LABEL_61:
              if (++v28 >= (unint64_t)v23)
              {
                id v17 = v161;
                unint64_t v8 = (unint64_t)v163;
                unint64_t v18 = *v161;
                goto LABEL_63;
              }
            }
            if (v20)
            {
              uint8x8_t v32 = (uint8x8_t)vcnt_s8((int8x8_t)v20);
              v32.i16[0] = vaddlv_u8(v32);
              if (v32.u32[0] > 1uLL)
              {
                unint64_t v8 = *v30;
                if (v20 <= v31) {
                  unint64_t v8 = v31 % v20;
                }
              }
              else
              {
                unint64_t v8 = (v20 - 1) & v31;
              }
              long long v33 = *(void ***)(v184 + 8 * v8);
              if (v33)
              {
                uint64_t v34 = *v33;
                if (*v33)
                {
                  do
                  {
                    unint64_t v35 = v34[1];
                    if (v35 == v31)
                    {
                      if (*((_DWORD *)v34 + 4) == v31) {
                        goto LABEL_60;
                      }
                    }
                    else
                    {
                      if (v32.u32[0] > 1uLL)
                      {
                        if (v35 >= v20) {
                          v35 %= v20;
                        }
                      }
                      else
                      {
                        v35 &= v20 - 1;
                      }
                      if (v35 != v8) {
                        break;
                      }
                    }
                    uint64_t v34 = (void *)*v34;
                  }
                  while (v34);
                }
              }
            }
            uint64_t v34 = operator new(0x18uLL);
            *uint64_t v34 = 0;
            v34[1] = v31;
            *((_DWORD *)v34 + 4) = *v30;
            *((_DWORD *)v34 + 5) = 0;
            float v36 = (float)(unint64_t)(v19 + 1);
            if (!v20 || (float)(v186 * (float)v20) < v36)
            {
              BOOL v37 = (v20 & (v20 - 1)) != 0;
              if (v20 < 3) {
                BOOL v37 = 1;
              }
              unint64_t v38 = v37 | (2 * v20);
              unint64_t v39 = vcvtps_u32_f32(v36 / v186);
              if (v38 <= v39) {
                size_t v40 = v39;
              }
              else {
                size_t v40 = v38;
              }
              std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__rehash<true>((uint64_t)&v184, v40);
              unint64_t v20 = *((void *)&v184 + 1);
              if ((v20 & (v20 - 1)) != 0)
              {
                if (*((void *)&v184 + 1) <= v31) {
                  unint64_t v8 = v31 % *((void *)&v184 + 1);
                }
                else {
                  unint64_t v8 = v31;
                }
              }
              else
              {
                unint64_t v8 = (DWORD2(v184) - 1) & v31;
              }
            }
            uint64_t v41 = v184;
            int v42 = *(void **)(v184 + 8 * v8);
            if (v42)
            {
              *uint64_t v34 = *v42;
            }
            else
            {
              *uint64_t v34 = v185;
              *(void *)&long long v185 = v34;
              *(void *)(v41 + 8 * v8) = &v185;
              if (!*v34) {
                goto LABEL_59;
              }
              unint64_t v43 = *(void *)(*v34 + 8);
              if ((v20 & (v20 - 1)) != 0)
              {
                if (v43 >= v20) {
                  v43 %= v20;
                }
              }
              else
              {
                v43 &= v20 - 1;
              }
              int v42 = (void *)(v184 + 8 * v43);
            }
            *int v42 = v34;
LABEL_59:
            uint64_t v19 = ++*((void *)&v185 + 1);
LABEL_60:
            *((_DWORD *)v34 + 5) = v3;
            unsigned int v23 = *v169;
            goto LABEL_61;
          }
LABEL_64:
          unint64_t v44 = CSStore2::Writer::tell(*v160, &v172);
          int v45 = v44;
          id v12 = v156;
          a2 = v158;
          if (HIDWORD(v44))
          {
            LODWORD(__nitems) = 0;
            CSStore2::HashMap<unsigned int,unsigned int,CSStore2::Dictionary::_Functions,0ull>::Create(&v182, (uint64_t)&v184, v44, 0, &__nitems);
            unint64_t v3 = (unint64_t)v182;
            if (v182)
            {
              v177[2] = v45;
              if (CSStore2::Writer::write(*v160, v182, __nitems, &v172)
                && (v46 = CSStore2::Writer::tell(*v160, &v172), int v47 = v46, HIDWORD(v46))
                && CSStore2::Writer::write(*v160, v154, 8uLL, &v172)
                && CSStore2::Writer::write(*v160, &v177[1], 8uLL, &v172))
              {
                unsigned int v48 = v47 & 0xFFFFFF00;
                uint64_t v49 = 0x100000000;
              }
              else
              {
                uint64_t v49 = 0;
                LOBYTE(v47) = 0;
                unsigned int v48 = 0;
              }
              ((void (*)(unint64_t))v183)(v3);
              goto LABEL_247;
            }
            unint64_t v3 = MEMORY[0x1E4F28C58];
            uint64_t v178 = *MEMORY[0x1E4F28228];
            v179 = @"Line";
            v180 = @"kCSStoreAllocFailedErr";
            v181 = &unk_1EFE43A10;
            v141 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v180 forKeys:&v178 count:2];
            id v172 = [(id)v3 errorWithDomain:*MEMORY[0x1E4F28760] code:-9493 userInfo:v141];
          }
          uint64_t v49 = 0;
          LOBYTE(v47) = 0;
          unsigned int v48 = 0;
LABEL_247:
          std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)&v184);
          goto LABEL_191;
        }
      }
      unint64_t v3 = MEMORY[0x1E4F28C58];
      v182 = (_DWORD *)*MEMORY[0x1E4F28228];
      v183 = @"Line";
      *(void *)&long long v184 = @"kCSStoreNotFoundErr";
      *((void *)&v184 + 1) = &unk_1EFE43A28;
      v117 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v184 forKeys:&v182 count:2];
      id v172 = [(id)v3 errorWithDomain:*MEMORY[0x1E4F28760] code:-9499 userInfo:v117];
    }
    else
    {
      unint64_t v3 = MEMORY[0x1E4F28C58];
      v182 = (_DWORD *)*MEMORY[0x1E4F28228];
      v183 = @"Line";
      *(void *)&long long v184 = @"kCSStoreNotFoundErr";
      *((void *)&v184 + 1) = &unk_1EFE43A40;
      v118 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v184 forKeys:&v182 count:2];
      id v172 = [(id)v3 errorWithDomain:*MEMORY[0x1E4F28760] code:-9499 userInfo:v118];
    }
    uint64_t v49 = 0;
    LOBYTE(v47) = 0;
    unsigned int v48 = 0;
LABEL_191:
    objc_storeStrong(v12, v172);
    uint64_t v7 = a1;
    if ((v49 & 0x100000000) != 0) {
      unsigned int v119 = v48 & 0xFFFFFF00 | v47;
    }
    else {
      unsigned int v119 = v167;
    }
    LODWORD(v167) = v119;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (v49 & 0x100000000) != 0;
    goto LABEL_202;
  }
  if (*a2 >> 30 == 1)
  {
    id v50 = *(FILE ***)(a1 + 56);
    v165 = *(CSStore2::Store **)(a1 + 64);
    uint64_t v51 = *(void *)(*(void *)(a1 + 32) + 8);
    CFRange v54 = *(_DWORD **)(v51 + 40);
    unsigned int v52 = (id *)(v51 + 40);
    id v53 = v54;
    size_t __nitems = 0;
    unint64_t v170 = CSStore2::Writer::tell(*v50, &__nitems);
    id v55 = (id)__nitems;
    if (!HIDWORD(v170)) {
      goto LABEL_200;
    }
    unsigned int v56 = a2[1] + 11;
    if (v56 >= 4) {
      size_t v57 = v56 & 0xFFFFFFFC;
    }
    else {
      size_t v57 = 4;
    }
    id v58 = malloc_type_malloc(v57, 0x29349731uLL);
    id v59 = v58;
    if (!v58)
    {
      v120 = (void *)MEMORY[0x1E4F28C58];
      v182 = (_DWORD *)*MEMORY[0x1E4F28228];
      v183 = @"Line";
      *(void *)&long long v184 = @"kCSStoreAllocFailedErr";
      *((void *)&v184 + 1) = &unk_1EFE43758;
      v121 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v184 forKeys:&v182 count:2];
      uint64_t v122 = [v120 errorWithDomain:*MEMORY[0x1E4F28760] code:-9493 userInfo:v121];

      id v55 = (id)v122;
      goto LABEL_200;
    }
    memcpy(v58, a2, v57);
    id v175 = v55;
    size_t v157 = v57;
    BOOL v60 = CSStore2::Writer::seek(*v50, v57, 1, &v175);
    id v61 = (__CFString *)v175;

    if (!v60) {
      goto LABEL_199;
    }
    v174 = v61;
    int v62 = CSStore2::GarbageCollection::WriteTableCommon(v165);
    id v63 = v174;

    if (!v62)
    {
      id v61 = v63;
      goto LABEL_199;
    }
    atomic_ullong v65 = *((void *)v165 + 34);
    if (!v65) {
      atomic_ullong v65 = CSStore2::Store::getTable((atomic_ullong *)v165, &cfstr_String_0.isa);
    }
    if ((_DWORD *)v65 != a2) {
      goto LABEL_256;
    }
    StringCache = (unsigned int *)CSStore2::getStringCache(v165, v64);
    if (StringCache)
    {
      v150 = v52;
      v151 = v59;
      long long v184 = 0u;
      long long v185 = 0u;
      float v186 = 1.0;
      unint64_t v67 = *StringCache;
      *(void *)v155 = v63;
      if (v67)
      {
        unint64_t v68 = 0;
        unint64_t v69 = 0;
        v159 = StringCache;
        unint64_t v162 = 0;
        long long v70 = StringCache;
        v152 = v50;
        v153 = v53;
        do
        {
          long long v71 = &v70[2 * v69];
          unsigned int v72 = v71[1];
          v164 = v71 + 1;
          if (v72 - 0x20000000 < 0xE0000001
            || (uint64_t v73 = v71[2], __CFADD__(v73, 8 * v72))
            || ((uint64_t v74 = *(void *)(*(void *)v165 + 8),
                 unsigned int v75 = *(_DWORD *)(v74 + 12),
                 v73 + 8 * v72 <= v75)
              ? (BOOL v76 = v75 > v73)
              : (BOOL v76 = 0),
                !v76))
          {
            long long v70 = v159;
            goto LABEL_180;
          }
          unint64_t v77 = 0;
          uint64_t v78 = v74 + v73;
          do
          {
            unsigned int v79 = (unsigned int *)(v78 + 8 * v77);
            v80 = v79 + 1;
            size_t v81 = *v79;
            if (!*v79 || (*((unsigned char *)v79 + 5) & 1) == 0) {
              goto LABEL_168;
            }
            if (v68)
            {
              uint8x8_t v82 = (uint8x8_t)vcnt_s8((int8x8_t)v68);
              v82.i16[0] = vaddlv_u8(v82);
              if (v82.u32[0] > 1uLL)
              {
                size_t v57 = *v79;
                if (v68 <= v81) {
                  size_t v57 = v81 % v68;
                }
              }
              else
              {
                size_t v57 = (v68 - 1) & v81;
              }
              v83 = *(void ***)(v184 + 8 * v57);
              if (v83)
              {
                v84 = *v83;
                if (*v83)
                {
                  do
                  {
                    unint64_t v85 = v84[1];
                    if (v85 == v81)
                    {
                      if (*((_DWORD *)v84 + 4) == v81) {
                        goto LABEL_167;
                      }
                    }
                    else
                    {
                      if (v82.u32[0] > 1uLL)
                      {
                        if (v85 >= v68) {
                          v85 %= v68;
                        }
                      }
                      else
                      {
                        v85 &= v68 - 1;
                      }
                      if (v85 != v57) {
                        break;
                      }
                    }
                    v84 = (void *)*v84;
                  }
                  while (v84);
                }
              }
            }
            v84 = operator new(0x18uLL);
            void *v84 = 0;
            v84[1] = v81;
            *((_DWORD *)v84 + 4) = *v79;
            *((_DWORD *)v84 + 5) = 0;
            float v86 = (float)(unint64_t)(*((void *)&v185 + 1) + 1);
            if (!v68 || (float)(v186 * (float)v68) < v86)
            {
              unint64_t v87 = v69;
              BOOL v88 = (v68 & (v68 - 1)) != 0;
              if (v68 < 3) {
                BOOL v88 = 1;
              }
              unint64_t v89 = v88 | (2 * v68);
              unint64_t v90 = vcvtps_u32_f32(v86 / v186);
              if (v89 <= v90) {
                int8x8_t prime = (int8x8_t)v90;
              }
              else {
                int8x8_t prime = (int8x8_t)v89;
              }
              if (*(void *)&prime == 1)
              {
                int8x8_t prime = (int8x8_t)2;
                unint64_t v92 = v162;
              }
              else
              {
                unint64_t v92 = v162;
                if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
                {
                  int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
                  unint64_t v92 = *((void *)&v184 + 1);
                  unint64_t v68 = *((void *)&v184 + 1);
                }
              }
              if (*(void *)&prime <= v68)
              {
                if (*(void *)&prime < v68)
                {
                  unint64_t v99 = vcvtps_u32_f32((float)*((unint64_t *)&v185 + 1) / v186);
                  if (v68 < 3
                    || (uint8x8_t v100 = (uint8x8_t)vcnt_s8((int8x8_t)v68), v100.i16[0] = vaddlv_u8(v100), v100.u32[0] > 1uLL))
                  {
                    unint64_t v99 = std::__next_prime(v99);
                  }
                  else
                  {
                    uint64_t v101 = 1 << -(char)__clz(v99 - 1);
                    if (v99 >= 2) {
                      unint64_t v99 = v101;
                    }
                  }
                  if (*(void *)&prime <= v99) {
                    int8x8_t prime = (int8x8_t)v99;
                  }
                  if (*(void *)&prime >= v68)
                  {
                    unint64_t v92 = *((void *)&v184 + 1);
                  }
                  else
                  {
                    if (prime) {
                      goto LABEL_123;
                    }
                    v107 = (void *)v184;
                    *(void *)&long long v184 = 0;
                    if (v107) {
                      operator delete(v107);
                    }
                    unint64_t v92 = 0;
                    *((void *)&v184 + 1) = 0;
                  }
                }
              }
              else
              {
LABEL_123:
                if (*(void *)&prime >> 61) {
                  std::__throw_bad_array_new_length[abi:nn180100]();
                }
                v93 = operator new(8 * *(void *)&prime);
                v94 = (void *)v184;
                *(void *)&long long v184 = v93;
                if (v94) {
                  operator delete(v94);
                }
                uint64_t v95 = 0;
                *((int8x8_t *)&v184 + 1) = prime;
                do
                  *(void *)(v184 + 8 * v95++) = 0;
                while (*(void *)&prime != v95);
                v96 = (void **)v185;
                if ((void)v185)
                {
                  unint64_t v97 = *(void *)(v185 + 8);
                  uint8x8_t v98 = (uint8x8_t)vcnt_s8(prime);
                  v98.i16[0] = vaddlv_u8(v98);
                  if (v98.u32[0] > 1uLL)
                  {
                    if (v97 >= *(void *)&prime) {
                      v97 %= *(void *)&prime;
                    }
                  }
                  else
                  {
                    v97 &= *(void *)&prime - 1;
                  }
                  *(void *)(v184 + 8 * v97) = &v185;
                  for (uint64_t i = *v96; i; v97 = v103)
                  {
                    unint64_t v103 = i[1];
                    if (v98.u32[0] > 1uLL)
                    {
                      if (v103 >= *(void *)&prime) {
                        v103 %= *(void *)&prime;
                      }
                    }
                    else
                    {
                      v103 &= *(void *)&prime - 1;
                    }
                    if (v103 != v97)
                    {
                      if (!*(void *)(v184 + 8 * v103))
                      {
                        *(void *)(v184 + 8 * v103) = v96;
                        goto LABEL_148;
                      }
                      *v96 = (void *)*i;
                      void *i = **(void **)(v184 + 8 * v103);
                      **(void **)(v184 + 8 * v103) = i;
                      uint64_t i = v96;
                    }
                    unint64_t v103 = v97;
LABEL_148:
                    v96 = (void **)i;
                    uint64_t i = (void *)*i;
                  }
                }
                unint64_t v92 = (unint64_t)prime;
              }
              unint64_t v162 = v92;
              if ((v92 & (v92 - 1)) != 0)
              {
                unint64_t v69 = v87;
                if (v92 <= v81)
                {
                  size_t v57 = v81 % v92;
                  unint64_t v68 = v92;
                }
                else
                {
                  unint64_t v68 = v92;
                  size_t v57 = v81;
                }
              }
              else
              {
                size_t v57 = (v92 - 1) & v81;
                unint64_t v68 = v92;
                unint64_t v69 = v87;
              }
            }
            uint64_t v104 = v184;
            v105 = *(void **)(v184 + 8 * v57);
            if (v105)
            {
              void *v84 = *v105;
            }
            else
            {
              void *v84 = v185;
              *(void *)&long long v185 = v84;
              *(void *)(v104 + 8 * v57) = &v185;
              if (!*v84) {
                goto LABEL_166;
              }
              unint64_t v106 = *(void *)(*v84 + 8);
              if ((v68 & (v68 - 1)) != 0)
              {
                if (v106 >= v68) {
                  v106 %= v68;
                }
              }
              else
              {
                v106 &= v68 - 1;
              }
              v105 = (void *)(v184 + 8 * v106);
            }
            void *v105 = v84;
LABEL_166:
            ++*((void *)&v185 + 1);
LABEL_167:
            *((_DWORD *)v84 + 5) = *v80;
            unsigned int v72 = *v164;
LABEL_168:
            ++v77;
          }
          while (v77 < v72);
          long long v70 = v159;
          unint64_t v67 = *v159;
          id v50 = v152;
          id v53 = v153;
          id v63 = *(__CFString **)v155;
LABEL_180:
          ++v69;
        }
        while (v69 < v67);
      }
      *(void *)&v177[1] = 0;
      unint64_t v108 = CSStore2::Writer::tell(*v50, &v177[1]);
      v109 = (__CFString *)*(id *)&v177[1];
      unsigned int v52 = v150;
      if (!HIDWORD(v108))
      {
        std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)&v184);
        id v59 = v151;
LABEL_254:
        v146 = v109;
        int v145 = 0;
        v142 = v146;
LABEL_255:

        id v61 = v146;
        id v63 = v61;
        if (v145)
        {
LABEL_256:
          *(void *)&long long v184 = v63;
          BOOL v149 = CSStore2::Writer::pwrite(v50, v59, v157, v170, &v184);
          unint64_t v3 = (unint64_t)(id)v184;

          free(v59);
          if (v149)
          {
            char v123 = 1;
            goto LABEL_201;
          }
          id v55 = (id)v3;
LABEL_200:
          id v53 = v55;
          char v123 = 0;
          unint64_t v3 = (unint64_t)v53;
LABEL_201:

          objc_storeStrong(v52, v53);
          uint64_t v7 = a1;
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v123;
          goto LABEL_202;
        }
LABEL_199:
        free(v59);
        id v55 = v61;
        goto LABEL_200;
      }
      v177[0] = 0;
      id v59 = v151;
      CSStore2::HashMap<unsigned int,CSStore2::_StringCacheEntry,CSStore2::_StringFunctions,0ull>::Create(&v182, v165, (uint64_t)&v184, v108, v177);
      v143 = v182;
      if (v182)
      {
        v151[20] = v108;
        v180 = v109;
        BOOL v144 = CSStore2::Writer::write(*v50, v143, v177[0], &v180);
        v142 = v180;

        ((void (*)(_DWORD *))v183)(v143);
        std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)&v184);
        if (v144) {
          goto LABEL_251;
        }
      }
      else
      {
        v147 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v178 = *MEMORY[0x1E4F28228];
        v179 = @"Line";
        v180 = @"kCSStoreAllocFailedErr";
        v181 = &unk_1EFE439F8;
        v148 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v180 forKeys:&v178 count:2];
        v142 = [v147 errorWithDomain:*MEMORY[0x1E4F28760] code:-9493 userInfo:v148];

        std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)&v184);
      }
      v109 = v142;
      goto LABEL_254;
    }
    v142 = 0;
    v59[20] = -1;
LABEL_251:
    int v145 = 1;
    v146 = v63;
    goto LABEL_255;
  }
  v110 = *(FILE ***)(a1 + 56);
  uint64_t v111 = *(void *)(*(void *)(a1 + 32) + 8);
  v113 = *(void **)(v111 + 40);
  v112 = (id *)(v111 + 40);
  id v171 = v113;
  unsigned int v114 = a2[1] + 11;
  if (v114 >= 4) {
    size_t v115 = v114 & 0xFFFFFFFC;
  }
  else {
    size_t v115 = 4;
  }
  BOOL v116 = CSStore2::Writer::write(*v110, a2, v115, &v171);
  objc_storeStrong(v112, v171);
  uint64_t v7 = a1;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v116;
LABEL_202:
  if (!*(unsigned char *)(*(void *)(*(void *)(v7 + 40) + 8) + 24)) {
    goto LABEL_242;
  }
  uint64_t v124 = *(void *)(*(void *)(v7 + 48) + 8);
  v125 = (uint64_t *)(v124 + 48);
  unint64_t v126 = (4 * *a2);
  unint64_t v127 = *(void *)(v124 + 56);
  if (v127)
  {
    uint8x8_t v128 = (uint8x8_t)vcnt_s8((int8x8_t)v127);
    v128.i16[0] = vaddlv_u8(v128);
    if (v128.u32[0] > 1uLL)
    {
      unint64_t v3 = v126;
      if (v127 <= v126) {
        unint64_t v3 = v126 % v127;
      }
    }
    else
    {
      unint64_t v3 = (v127 - 1) & v126;
    }
    v129 = *(void ***)(*v125 + 8 * v3);
    if (v129)
    {
      v130 = *v129;
      if (*v129)
      {
        do
        {
          unint64_t v131 = v130[1];
          if (v131 == v126)
          {
            if (*((_DWORD *)v130 + 4) == v126)
            {
              uint64_t v7 = a1;
              goto LABEL_241;
            }
          }
          else
          {
            if (v128.u32[0] > 1uLL)
            {
              if (v131 >= v127) {
                v131 %= v127;
              }
            }
            else
            {
              v131 &= v127 - 1;
            }
            if (v131 != v3) {
              break;
            }
          }
          v130 = (void *)*v130;
        }
        while (v130);
      }
    }
  }
  v130 = operator new(0x18uLL);
  void *v130 = 0;
  v130[1] = v126;
  *((_DWORD *)v130 + 4) = v126;
  *((_DWORD *)v130 + 5) = 0;
  float v132 = (float)(unint64_t)(*(void *)(v124 + 72) + 1);
  float v133 = *(float *)(v124 + 80);
  if ((((float)(v133 * (float)v127) >= v132) & ~(v127 == 0)) == 0)
  {
    BOOL v134 = 1;
    if (v127 >= 3) {
      BOOL v134 = (v127 & (v127 - 1)) != 0;
    }
    unint64_t v135 = v134 | (2 * v127);
    unint64_t v136 = vcvtps_u32_f32(v132 / v133);
    if (v135 <= v136) {
      size_t v137 = v136;
    }
    else {
      size_t v137 = v135;
    }
    std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__rehash<true>(v124 + 48, v137);
    unint64_t v127 = *(void *)(v124 + 56);
    if ((v127 & (v127 - 1)) != 0)
    {
      if (v127 <= v126) {
        unint64_t v3 = v126 % v127;
      }
      else {
        unint64_t v3 = v126;
      }
    }
    else
    {
      unint64_t v3 = (v127 - 1) & v126;
    }
  }
  uint64_t v138 = *v125;
  v139 = *(void **)(*v125 + 8 * v3);
  uint64_t v7 = a1;
  if (v139)
  {
    void *v130 = *v139;
  }
  else
  {
    void *v130 = *(void *)(v124 + 64);
    *(void *)(v124 + 64) = v130;
    *(void *)(v138 + 8 * v3) = v124 + 64;
    if (!*v130) {
      goto LABEL_240;
    }
    unint64_t v140 = *(void *)(*v130 + 8);
    if ((v127 & (v127 - 1)) != 0)
    {
      if (v140 >= v127) {
        v140 %= v127;
      }
    }
    else
    {
      v140 &= v127 - 1;
    }
    v139 = (void *)(*v125 + 8 * v140);
  }
  void *v139 = v130;
LABEL_240:
  ++*(void *)(v124 + 72);
LABEL_241:
  *((_DWORD *)v130 + 5) = v167;
LABEL_242:
  if (!*(unsigned char *)(*(void *)(*(void *)(v7 + 40) + 8) + 24)) {
    *a3 = 1;
  }
}

void sub_1A7DC8BD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, void *a14)
{
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table(v16 - 144);
  free(a11);

  _Unwind_Resume(a1);
}

BOOL CSStore2::Writer::write(FILE *__stream, const void *a2, size_t __nitems, void *a4)
{
  void v13[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = __nitems;
  size_t v6 = CSStore2::Writer::IO<unsigned long,void const*,unsigned long,unsigned long,__sFILE *>(a2, __nitems, __stream);
  size_t v7 = v6;
  if (a4 && v6 != v5)
  {
    unint64_t v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *__error();
    v12[0] = *MEMORY[0x1E4F28228];
    v12[1] = @"Line";
    v13[0] = @"errno";
    v13[1] = &unk_1EFE43728;
    char v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
    *a4 = [v8 errorWithDomain:*MEMORY[0x1E4F28798] code:v9 userInfo:v10];
  }
  return v7 == v5;
}

void sub_1A7DC8E0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

size_t CSStore2::Writer::IO<unsigned long,void const*,unsigned long,unsigned long,__sFILE *>(const void *a1, size_t __nitems, FILE *__stream)
{
  size_t v6 = fwrite(a1, 1uLL, __nitems, __stream);
  size_t v10 = v6;
  if (CSStore2::Writer::logIO == 1)
  {
    size_t v12 = __nitems;
    uint64_t v13 = 1;
    uint64_t v11 = __stream;
    std::ostringstream::basic_ostringstream[abi:nn180100]((uint64_t)v14);
    std::ostream::operator<<();
    std::stringbuf::str();
    v14[0] = *(void **)MEMORY[0x1E4FBA418];
    *(void **)((char *)v14 + *((void *)v14[0] - 3)) = *(void **)(MEMORY[0x1E4FBA418] + 24);
    v14[1] = (void *)(MEMORY[0x1E4FBA470] + 16);
    if (v17 < 0) {
      operator delete(__p);
    }
    std::streambuf::~streambuf();
    std::ostream::~ostream();
    MEMORY[0x1AD0DAC80](_F8);
    CSStore2::Writer::toString<unsigned long>();
    CSStore2::Writer::toString<unsigned long>();
    CSStore2::Writer::toString<__sFILE *>();
    CSStore2::Writer::toString<unsigned long>();
    CSStore2::Writer::logFunctionCall(*(CSStore2 **)(_F8[25] + 8), v3, MEMORY[0x1E4F14860], (uint64_t)v9, 4, (uint64_t)v14);
    if (v15 < 0) {
      operator delete(v14[0]);
    }
    for (uint64_t i = 0; i != -96; i -= 24)
    {
      if ((char)v9[i + 95] < 0) {
        operator delete(*(void **)&v9[i + 72]);
      }
    }
  }
  return v6;
}

void sub_1A7DC9054(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *__p,uint64_t a27,int a28,__int16 a29,char a30,char a31)
{
  if (a31 < 0) {
    operator delete(__p);
  }
  uint64_t v32 = 0;
  while (1)
  {
    if (*((char *)&a21 + v32 + 7) < 0) {
      operator delete(*(void **)((char *)&a19 + v32));
    }
    v32 -= 24;
    if (v32 == -96) {
      _Unwind_Resume(exception_object);
    }
  }
}

uint64_t CSStore2::Writer::toString<unsigned long>()
{
  std::ostringstream::basic_ostringstream[abi:nn180100]((uint64_t)v1);
  std::ostream::operator<<();
  std::stringbuf::str();
  v1[0] = *MEMORY[0x1E4FBA418];
  *(void *)((char *)v1 + *(void *)(v1[0] - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
  v1[1] = MEMORY[0x1E4FBA470] + 16;
  if (v2 < 0) {
    operator delete((void *)v1[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1AD0DAC80](&v3);
}

void sub_1A7DC9208(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

void ___ZN8CSStore217GarbageCollection8GetGCLogEv_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.coreservicesstore", "GC");
  uint64_t v1 = (void *)CSStore2::GarbageCollection::GetGCLog(void)::result;
  CSStore2::GarbageCollection::GetGCLog(void)::uint64_t result = (uint64_t)v0;
}

void ___ZN8CSStore217GarbageCollection8IsNeededERKNS_5StoreEh_block_invoke(uint64_t a1, unsigned int *a2, unsigned char *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2[19];
  if (v3 != -1)
  {
    uint64_t v5 = *(void *)(**(void **)(a1 + 40) + 8);
    if (*(_DWORD *)(v5 + 12) > v3 && (*(_DWORD *)(v5 + v3) - 1) <= 0x1FFE)
    {
      char v8 = *(unsigned char *)(a1 + 48);
      Statistics = (CSStore2::GarbageCollection *)CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::GetStatistics((unsigned int *)(v5 + v3));
      unsigned int v10 = (v8 & 4) != 0 ? 50 : 5;
      if (Statistics / HIDWORD(Statistics) > v10)
      {
        uint64_t v11 = CSStore2::GarbageCollection::GetGCLog(Statistics);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          size_t v12 = (id) CSStore2::Table::copyCFName((CSStore2::Table *)a2);
          int v13 = 136446210;
          uint64_t v14 = [(__CFString *)v12 UTF8String];
          _os_log_impl(&dword_1A7DB2000, v11, OS_LOG_TYPE_INFO, "Identifier cache on table '%{public}s' is unbalanced. Will collect.", (uint8_t *)&v13, 0xCu);
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
        *a3 = 1;
      }
    }
  }
}

void sub_1A7DC93A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::GetStatistics(unsigned int *a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = (unint64_t)((8 * v1) | 4u) << 32;
  if (!v1) {
    return 0;
  }
  LODWORD(v3) = 0;
  uint64_t v4 = a1 + 1;
  uint64_t v5 = *a1;
  do
  {
    unsigned int v7 = *v4;
    v4 += 2;
    unsigned int v6 = v7;
    uint64_t v3 = v7 + v3;
    if (v7 <= v2) {
      uint64_t v8 = v2;
    }
    else {
      uint64_t v8 = v6;
    }
    unint64_t v2 = v8 | ((unint64_t)(HIDWORD(v2) + 8 * v6) << 32);
    --v5;
  }
  while (v5);
  return v3 | (v1 << 32);
}

uint64_t CSStore2::Store::collectGarbage(CSStore2::Store *this, CSStore2::Store *a2)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  if (CSStore2::GarbageCollection::IsNeeded(this, a2))
  {
    uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v5 = [v4 temporaryDirectory];
    unsigned int v6 = [v5 URLByAppendingPathComponent:@"ls-XXXXXXXXXXXXXXXX" isDirectory:0];

    if (!v6) {
      goto LABEL_26;
    }
    bzero(buf, 0x400uLL);
    uint64_t v8 = CSStore2::GetLog((CSStore2 *)[v6 getFileSystemRepresentation:buf maxLength:1024]);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)id v55 = 136380675;
      *(void *)unsigned int v56 = buf;
      _os_log_debug_impl(&dword_1A7DB2000, v8, OS_LOG_TYPE_DEBUG, "Creating temporary file for store writer at %{private}s", v55, 0xCu);
    }

    if ((int)softLinkMKBDeviceUnlockedSinceBoot() < 1) {
      uint64_t v9 = CSStore2::Writer::IO<int,char *>((char *)buf);
    }
    else {
      uint64_t v9 = CSStore2::Writer::IO<int,char *,int,int>((char *)buf);
    }
    uint64_t v11 = v9;
    if ((v9 & 0x80000000) != 0)
    {
      uint64_t v25 = CSStore2::GetLog((CSStore2 *)v9);
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
      int v26 = *__error();
      int v27 = __error();
      uint64_t v28 = strerror(*v27);
      *(_DWORD *)id v55 = 67109378;
      *(_DWORD *)unsigned int v56 = v26;
      *(_WORD *)&v56[4] = 2082;
      *(void *)&v56[6] = v28;
      uint64_t v29 = "Failed to create file descriptor for store writer: %i (%{public}s).";
    }
    else
    {
      size_t v12 = CSStore2::Writer::IO<__sFILE *,int,char const*>(v9);
      if (v12)
      {

        id v51 = 0;
        unsigned int v52 = v12;
        __int16 v53 = 257;
        int v13 = CSStore2::GarbageCollection::Collect(this, &v52, a2, &v51);
        uint64_t v14 = (CSStore2 *)v51;
        uint64_t v15 = v14;
        if (!v13)
        {
          uint64_t v32 = CSStore2::GetLog(v14);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            buf[0].st_dev = 138543362;
            *(void *)&buf[0].st_mode = v15;
            _os_log_error_impl(&dword_1A7DB2000, v32, OS_LOG_TYPE_ERROR, "Error running garbage collection: %{public}@", (uint8_t *)buf, 0xCu);
          }
          goto LABEL_51;
        }
        CSStore2::Writer::sync((void **)&v52, 0);
        uint64_t v16 = CSStore2::Writer::IO<int,__sFILE *>(MEMORY[0x1E4F14820], v52);
        int v17 = v16;
        if ((v16 & 0x80000000) != 0)
        {
          unint64_t v20 = CSStore2::GetLog((CSStore2 *)v16);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            buf[0].st_dev = 134217984;
            *(void *)&buf[0].st_mode = v52;
            _os_log_error_impl(&dword_1A7DB2000, v20, OS_LOG_TYPE_ERROR, "Unsupported: file handle %p had neither an underlying buffer nor a file descriptor.", (uint8_t *)buf, 0xCu);
          }
          goto LABEL_48;
        }
        if (CSStore2::Writer::IO<int,int,stat *>(v16, buf))
        {
          unint64_t v18 = (CSStore2 *)__error();
          int v19 = *(_DWORD *)v18;
          unint64_t v20 = CSStore2::GetLog(v18);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            uint64_t v21 = strerror(v19);
            *(_DWORD *)id v55 = 67109634;
            *(_DWORD *)unsigned int v56 = v17;
            *(_WORD *)&v56[4] = 1024;
            *(_DWORD *)&v56[6] = v19;
            *(_WORD *)&v56[10] = 2082;
            *(void *)&v56[12] = v21;
            int v22 = "Failed to stat fd %i: error %i %{public}s.";
LABEL_17:
            unsigned int v23 = v20;
            uint32_t v24 = 24;
LABEL_42:
            _os_log_error_impl(&dword_1A7DB2000, v23, OS_LOG_TYPE_ERROR, v22, v55, v24);
          }
        }
        else
        {
          if ((unint64_t)(buf[0].st_size - 1) <= 0x7FFFFFFFFFFFFFFDLL)
          {
            long long v33 = CSStore2::Writer::IO<void *,void *,unsigned long,int,int,int,long long>(buf[0].st_size, v17);
            if (v33 != (void *)-1)
            {
              id v34 = objc_alloc(MEMORY[0x1E4F1C9B8]);
              unint64_t v35 = (void *)[v34 initWithBytesNoCopy:v33 length:buf[0].st_size deallocator:*MEMORY[0x1E4F28210]];
              if (v35)
              {
                uint64_t v32 = v35;
                float v36 = (CSStore2::VM *)[v32 bytes];
                BOOL v37 = (void *)[v32 length];
                Copy = (void *)CSStore2::VM::AllocateCopy(v36, v37, (CSStore2::VM *)v37);
                if (Copy) {
                  CSStore2::Store::setBytesNoCopy(this, Copy, [v32 length]);
                }
                uint64_t v10 = 1;
                goto LABEL_52;
              }
              unint64_t v20 = CSStore2::GetLog(0);
              if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
                goto LABEL_48;
              }
              *(_DWORD *)id v55 = 67109120;
              *(_DWORD *)unsigned int v56 = v17;
              int v22 = "Failed to create NSData for mapped file %i.";
              unsigned int v23 = v20;
              uint32_t v24 = 8;
              goto LABEL_42;
            }
            int v45 = (CSStore2 *)__error();
            int v46 = *(_DWORD *)v45;
            unint64_t v20 = CSStore2::GetLog(v45);
            if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
              goto LABEL_48;
            }
            int v47 = strerror(v46);
            *(_DWORD *)id v55 = 67109634;
            *(_DWORD *)unsigned int v56 = v17;
            *(_WORD *)&v56[4] = 1024;
            *(_DWORD *)&v56[6] = v46;
            *(_WORD *)&v56[10] = 2082;
            *(void *)&v56[12] = v47;
            int v22 = "Failed to map fd %i: error %i %{public}s.";
            goto LABEL_17;
          }
          unint64_t v20 = CSStore2::GetLog((CSStore2 *)buf[0].st_size);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)id v55 = 134217984;
            *(void *)unsigned int v56 = buf[0].st_size;
            int v22 = "Wrote a ludicrously long stream (%lli bytes) that cannot fit back in an NSData.";
            unsigned int v23 = v20;
            uint32_t v24 = 12;
            goto LABEL_42;
          }
        }
LABEL_48:

        uint64_t v49 = CSStore2::GetLog(v48);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf[0].st_dev) = 0;
          _os_log_impl(&dword_1A7DB2000, v49, OS_LOG_TYPE_DEFAULT, "Unexpected: garbage collection succeeded, but did not get an NSData object.", (uint8_t *)buf, 2u);
        }

        uint64_t v32 = 0;
LABEL_51:
        uint64_t v10 = 0;
LABEL_52:

LABEL_53:
        CSStore2::Writer::~Writer((void **)&v52);
        return v10;
      }
      BOOL v30 = CSStore2::GetLog(0);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        int v39 = *__error();
        size_t v40 = __error();
        uint64_t v41 = strerror(*v40);
        *(_DWORD *)id v55 = 67109378;
        *(_DWORD *)unsigned int v56 = v39;
        *(_WORD *)&v56[4] = 2082;
        *(void *)&v56[6] = v41;
        _os_log_error_impl(&dword_1A7DB2000, v30, OS_LOG_TYPE_ERROR, "Failed to create file handle from file descriptor for store writer: %i (%{public}s).", v55, 0x12u);
      }

      unint64_t v31 = (CSStore2 *)CSStore2::Writer::IO<int,int>(MEMORY[0x1E4F14738], v11);
      if (!v31) {
        goto LABEL_25;
      }
      uint64_t v25 = CSStore2::GetLog(v31);
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
LABEL_24:

LABEL_25:
LABEL_26:
        unsigned int v52 = 0;
        __int16 v53 = 257;
        uint64_t v15 = CSStore2::GetLog(v7);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf[0].st_dev) = 0;
          _os_log_error_impl(&dword_1A7DB2000, v15, OS_LOG_TYPE_ERROR, "Error running garbage collection: failed to create temporary file handle", (uint8_t *)buf, 2u);
        }
        uint64_t v10 = 0;
        goto LABEL_53;
      }
      int v42 = *__error();
      unint64_t v43 = __error();
      unint64_t v44 = strerror(*v43);
      *(_DWORD *)id v55 = 67109378;
      *(_DWORD *)unsigned int v56 = v42;
      *(_WORD *)&v56[4] = 2082;
      *(void *)&v56[6] = v44;
      uint64_t v29 = "Failed to close file descriptor for store writer: %i (%{public}s).";
    }
    _os_log_error_impl(&dword_1A7DB2000, v25, OS_LOG_TYPE_ERROR, v29, v55, 0x12u);
    goto LABEL_24;
  }
  return 1;
}

void sub_1A7DC9AF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);

  CSStore2::Writer::~Writer((void **)va);
  _Unwind_Resume(a1);
}

uint64_t CSStore2::Writer::IO<int,int,stat *>(int a1, stat *a2)
{
  uint64_t v4 = fstat(a1, a2);
  int v8 = v4;
  if (CSStore2::Writer::logIO == 1)
  {
    int v9 = a1;
    CSStore2::Writer::toString<int>();
    std::ostringstream::basic_ostringstream[abi:nn180100]((uint64_t)v10);
    std::ostream::operator<<();
    std::stringbuf::str();
    v10[0] = *(void **)MEMORY[0x1E4FBA418];
    *(void **)((char *)v10 + *((void *)v10[0] - 3)) = *(void **)(MEMORY[0x1E4FBA418] + 24);
    v10[1] = (void *)(MEMORY[0x1E4FBA470] + 16);
    if (v13 < 0) {
      operator delete(__p);
    }
    std::streambuf::~streambuf();
    std::ostream::~ostream();
    MEMORY[0x1AD0DAC80](_A8);
    CSStore2::Writer::toString<int>();
    CSStore2::Writer::logFunctionCall(*(CSStore2 **)(_A8[25] + 8), v2, MEMORY[0x1E4F14848], (uint64_t)v7, 2, (uint64_t)v10);
    if (v11 < 0) {
      operator delete(v10[0]);
    }
    for (uint64_t i = 0; i != -48; i -= 24)
    {
      if ((char)v7[i + 47] < 0) {
        operator delete(*(void **)&v7[i + 24]);
      }
    }
  }
  return v4;
}

void sub_1A7DC9D80(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0) {
    operator delete(__p);
  }
  uint64_t v25 = 0;
  while (1)
  {
    if (*((char *)&a17 + v25 + 7) < 0) {
      operator delete(*(void **)((char *)&a15 + v25));
    }
    v25 -= 24;
    if (v25 == -48) {
      _Unwind_Resume(exception_object);
    }
  }
}

void *CSStore2::Writer::IO<void *,void *,unsigned long,int,int,int,long long>(size_t a1, int a2)
{
  uint64_t v5 = mmap(0, a1, 1, 2, a2, 0);
  char v11 = v5;
  if (CSStore2::Writer::logIO == 1)
  {
    __p = 0;
    size_t v16 = a1;
    int v14 = 2;
    int v15 = 1;
    int v13 = a2;
    uint64_t v12 = 0;
    CSStore2::Writer::toString<void *>();
    CSStore2::Writer::toString<unsigned long>();
    CSStore2::Writer::toString<int>();
    CSStore2::Writer::toString<int>();
    CSStore2::Writer::toString<int>();
    CSStore2::Writer::toString<long long>();
    CSStore2::Writer::toString<void *>();
    CSStore2::Writer::logFunctionCall(*(CSStore2 **)(vars0 + 8), v2, MEMORY[0x1E4F149C8], (uint64_t)v10, 6, (uint64_t)&__p);
    if (v9 < 0) {
      operator delete(__p);
    }
    for (uint64_t i = 0; i != -144; i -= 24)
    {
      if ((char)v10[i + 143] < 0) {
        operator delete(*(void **)&v10[i + 120]);
      }
    }
  }
  return v5;
}

void sub_1A7DC9F74(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  uint64_t v16 = 0;
  while (1)
  {
    if (*(&a15 + v16 + 143) < 0) {
      operator delete(*(void **)(&a15 + v16 + 120));
    }
    v16 -= 24;
    if (v16 == -144) {
      _Unwind_Resume(exception_object);
    }
  }
}

uint64_t CSStore2::Writer::toString<void *>()
{
  std::ostringstream::basic_ostringstream[abi:nn180100]((uint64_t)v1);
  std::ostream::operator<<();
  std::stringbuf::str();
  v1[0] = *MEMORY[0x1E4FBA418];
  *(void *)((char *)v1 + *(void *)(v1[0] - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
  v1[1] = MEMORY[0x1E4FBA470] + 16;
  if (v2 < 0) {
    operator delete((void *)v1[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1AD0DAC80](&v3);
}

void sub_1A7DCA118(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

FILE *CSStore2::Writer::IO<__sFILE *,int,char const*>(int a1)
{
  uint64_t v3 = fdopen(a1, "w");
  v9[3] = v3;
  if (CSStore2::Writer::logIO == 1)
  {
    int v10 = a1;
    __p[0] = "w";
    CSStore2::Writer::toString<int>();
    CSStore2::Writer::toString<char const*>((uint64_t)v9, (const char **)__p);
    CSStore2::Writer::toString<__sFILE *>();
    CSStore2::Writer::logFunctionCall(*(CSStore2 **)(vars0 + 8), v1, MEMORY[0x1E4F14810], (uint64_t)v8, 2, (uint64_t)__p);
    if (v7 < 0) {
      operator delete(__p[0]);
    }
    for (uint64_t i = 0; i != -6; i -= 3)
    {
      if (SHIBYTE(v9[i + 2]) < 0) {
        operator delete(*(void **)&v8[i * 8 + 24]);
      }
    }
  }
  return v3;
}

void sub_1A7DCA22C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  uint64_t v28 = 0;
  while (1)
  {
    if (*(&a27 + v28) < 0) {
      operator delete(*(void **)((char *)&a22 + v28));
    }
    v28 -= 24;
    if (v28 == -48) {
      _Unwind_Resume(exception_object);
    }
  }
}

uint64_t CSStore2::Writer::IO<int,char *,int,int>(char *a1)
{
  uint64_t v3 = mkstemp_dprotected_np(a1, 3, 0);
  int v9 = v3;
  if (CSStore2::Writer::logIO == 1)
  {
    __p[0] = a1;
    int v10 = 0;
    int v11 = 3;
    CSStore2::Writer::toString<char *>((uint64_t)v8, (const char **)__p);
    CSStore2::Writer::toString<int>();
    CSStore2::Writer::toString<int>();
    CSStore2::Writer::toString<int>();
    CSStore2::Writer::logFunctionCall(*(CSStore2 **)(vars0 + 8), v1, MEMORY[0x1E4F149C0], (uint64_t)v8, 3, (uint64_t)__p);
    if (v7 < 0) {
      operator delete(__p[0]);
    }
    for (uint64_t i = 0; i != -72; i -= 24)
    {
      if ((char)v8[i + 71] < 0) {
        operator delete(*(void **)&v8[i + 48]);
      }
    }
  }
  return v3;
}

void sub_1A7DCA3A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  uint64_t v16 = 0;
  while (1)
  {
    if (*(&a15 + v16 + 71) < 0) {
      operator delete(*(void **)(&a15 + v16 + 48));
    }
    v16 -= 24;
    if (v16 == -72) {
      _Unwind_Resume(exception_object);
    }
  }
}

uint64_t CSStore2::Writer::IO<int,char *>(char *a1)
{
  uint64_t v3 = mkstemp(a1);
  int v9 = v3;
  if (CSStore2::Writer::logIO == 1)
  {
    __p[0] = a1;
    CSStore2::Writer::toString<char *>((uint64_t)v7, (const char **)__p);
    CSStore2::Writer::toString<int>();
    CSStore2::Writer::logFunctionCall(*(CSStore2 **)(vars0 + 8), v1, MEMORY[0x1E4F149B8], (uint64_t)v7, 1, (uint64_t)__p);
    if (v6 < 0) {
      operator delete(__p[0]);
    }
    if (v8 < 0) {
      operator delete(v7[0]);
    }
  }
  return v3;
}

void sub_1A7DCA4DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t initMKBDeviceUnlockedSinceBoot(void)
{
  if (MobileKeyBagLibrary(void)::sOnce != -1) {
    dispatch_once(&MobileKeyBagLibrary(void)::sOnce, &__block_literal_global_246);
  }
  os_log_t v0 = (uint64_t (*)(void))dlsym((void *)MobileKeyBagLibrary(void)::sLib, "MKBDeviceUnlockedSinceBoot");
  softLinkMKBDeviceUnlockedSinceBoot = v0;

  return v0();
}

void *___ZL19MobileKeyBagLibraryv_block_invoke()
{
  uint64_t result = dlopen("/System/Library/PrivateFrameworks/MobileKeyBag.framework/MobileKeyBag", 2);
  MobileKeyBagLibrary(void)::sLib = (uint64_t)result;
  return result;
}

char *CSStore2::Store::embraceAndExtend(CSStore2::Store *this, char *a2, const void *a3, unsigned int a4)
{
  uint64_t v4 = a2;
  if (a3 >= a4)
  {
    LODWORD(v6) = a3 - a4;
LABEL_6:
    CSStore2::Store::assertNotEnumeratingUnits((uint64_t)this);
    if ((v6 + 3) >= 4) {
      unsigned int v9 = (v6 + 3) & 0xFFFFFFFC;
    }
    else {
      unsigned int v9 = 4;
    }
    uint64_t v10 = *(void *)(*(void *)this + 8);
    unsigned int v11 = *(_DWORD *)(v10 + 16);
    BOOL v12 = v11 >= v9;
    unsigned int v13 = v11 - v9;
    if (!v12) {
      unsigned int v13 = 0;
    }
    *(_DWORD *)(v10 + 16) = v13;
    ++*(_DWORD *)(v10 + 8);
    return v4;
  }
  char v6 = a3;
  if (a2)
  {
    uint64_t v7 = *(void *)this;
    if (*(void *)this) {
      unint64_t v8 = *(void *)(v7 + 8);
    }
    else {
      unint64_t v8 = 0;
    }
    unsigned int v15 = -1;
    BOOL v12 = (unint64_t)a2 >= v8;
    unint64_t v16 = (unint64_t)&a2[-v8];
    if (v12 && !HIDWORD(v16))
    {
      if ((v16 + 1) > *(_DWORD *)(*(void *)(v7 + 8) + 12) || v16 == -1) {
        unsigned int v15 = -1;
      }
      else {
        unsigned int v15 = v16;
      }
    }
  }
  else
  {
    unsigned int v15 = -1;
  }
  NSUInteger v18 = CSStore2::Store::extend(this, a4);
  uint64_t v4 = (char *)v18;
  if (v18)
  {
    if (v15 != -1)
    {
      uint64_t v19 = *(void *)(*(void *)this + 8);
      if (v19 && *(_DWORD *)(v19 + 12) > v15) {
        CSStore2::VM::Copy(v18, v19 + v15, v6);
      }
    }
    goto LABEL_6;
  }
  return v4;
}

Unit *CSStore2::Store::allocateTable(CSStore2::Store *this, NSString *a2, int a3, NSString *a4)
{
  uint64_t v7 = a2;
  unint64_t v8 = v7;
  if (v7 && CSStore2::Table::IsNameAllowed((CSStore2::Table *)v7, a4))
  {
    uint64_t v9 = *(void *)this;
    if (*(void *)this) {
      uint64_t v9 = *(void *)(v9 + 8);
    }
    Unit = CSStore2::Store::allocateUnit(this, (CSStore2::Table *)(v9 + 20), a3 + 72, 0);
    unsigned int v11 = Unit;
    if (Unit)
    {
      uint64_t v12 = *(void *)this;
      if (*(void *)this) {
        unint64_t v13 = *(void *)(v12 + 8);
      }
      else {
        unint64_t v13 = 0;
      }
      unsigned int v15 = -1;
      BOOL v16 = (unint64_t)Unit >= v13;
      unint64_t v17 = (unint64_t)Unit - v13;
      if (v16 && !HIDWORD(v17))
      {
        if ((v17 + 1) > *(_DWORD *)(*(void *)(v12 + 8) + 12) || v17 == -1) {
          unsigned int v15 = -1;
        }
        else {
          unsigned int v15 = v17;
        }
      }
      memset(v25, 0, sizeof(v25));
      int v26 = 1065353216;
      NSUInteger v19 = CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::Create(this, (uint64_t)v25);
      std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)v25);
      if (v19)
      {
        uint64_t v20 = *(void *)this;
        if (v15 == -1)
        {
          unsigned int v11 = 0;
          if (v20) {
            NSUInteger v21 = *(void *)(v20 + 8);
          }
          else {
            NSUInteger v21 = 0;
          }
        }
        else
        {
          NSUInteger v21 = *(void *)(v20 + 8);
          if (*(_DWORD *)(v21 + 12) <= v15) {
            unsigned int v11 = 0;
          }
          else {
            unsigned int v11 = (Unit *)(v21 + v15);
          }
        }
        int v22 = -1;
        BOOL v16 = v19 >= v21;
        NSUInteger v23 = v19 - v21;
        if (v16 && !HIDWORD(v23))
        {
          if ((v23 + 1) > *(_DWORD *)(*(void *)(v20 + 8) + 12) || v23 == -1) {
            int v22 = -1;
          }
          else {
            int v22 = v23;
          }
        }
        *(_DWORD *)&v11->var3[68] = v22;
        CSStore2::Table::setName((CSStore2::Table *)v11, v8);
        CSStore2::Store::_dataDidMove(this);
      }
    }
  }
  else
  {
    unsigned int v11 = 0;
  }

  return v11;
}

void sub_1A7DCA84C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)&a9);

  _Unwind_Resume(a1);
}

BOOL CSStore2::Table::IsNameAllowed(CSStore2::Table *this, NSString *a2)
{
  int v2 = (int)a2;
  uint64_t v3 = this;
  if ([(CSStore2::Table *)v3 length]) {
    BOOL v4 = (!v2 || [(CSStore2::Table *)v3 characterAtIndex:0] != 60)
  }
      && strlen((const char *)[(CSStore2::Table *)v3 UTF8String]) < 0x31;
  else {
    BOOL v4 = 1;
  }

  return v4;
}

void sub_1A7DCA8E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

Unit *CSStore2::Store::allocateUnit(CSStore2::Store *this, CSStore2::Table *a2, int a3, unsigned int a4)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v7 = *(void *)this;
    if (*(void *)this) {
      unint64_t v8 = *(void *)(v7 + 8);
    }
    else {
      unint64_t v8 = 0;
    }
    unsigned int v9 = -1;
    BOOL v10 = (unint64_t)a2 >= v8;
    unint64_t v11 = (unint64_t)a2 - v8;
    if (v10 && !HIDWORD(v11))
    {
      if ((v11 + 1) > *(_DWORD *)(*(void *)(v7 + 8) + 12) || v11 == -1) {
        unsigned int v9 = -1;
      }
      else {
        unsigned int v9 = v11;
      }
    }
  }
  else
  {
    unsigned int v9 = -1;
  }
  uint64_t v13 = CSStore2::Store::extend(this, a3 + 8);
  if (!v13) {
    return 0;
  }
  if (v9 == -1 || (uint64_t v14 = *(void *)(*(void *)this + 8), *(_DWORD *)(v14 + 12) <= v9))
  {
    unsigned int v15 = 0;
    if (!a4)
    {
LABEL_21:
      int v16 = *((_DWORD *)v15 + 18);
      if (v16 == 0x3FFFFFFF)
      {
        NSUInteger v21 = CSStore2::GetLog((CSStore2 *)v13);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        {
          CSStore2::Table::getName(v15);
          id v22 = objc_claimAutoreleasedReturnValue();
          uint64_t v23 = [v22 UTF8String];
          uint64_t v24 = (4 * *(_DWORD *)v15);
          int v26 = 136446466;
          uint64_t v27 = v23;
          __int16 v28 = 2048;
          uint64_t v29 = v24;
          _os_log_fault_impl(&dword_1A7DB2000, v21, OS_LOG_TYPE_FAULT, "Ran out of unit IDs for table %{public}s (%llx): process will terminate.", (uint8_t *)&v26, 0x16u);
        }
        uint64_t v25 = *((void *)this + 40);
        if (v25) {
          (*(void (**)(uint64_t, void))(v25 + 16))(v25, (4 * *(_DWORD *)v15));
        }
        abort();
      }
      int v17 = v16 + 1;
      *((_DWORD *)v15 + 18) = v17;
      a4 = 4 * v17;
    }
  }
  else
  {
    unsigned int v15 = (CSStore2::Table *)(v14 + v9);
    if (!a4) {
      goto LABEL_21;
    }
  }
  uint64_t v18 = *(void *)this;
  if (*(void *)this) {
    uint64_t v18 = *(void *)(v18 + 8);
  }
  if (v15 == (CSStore2::Table *)(v18 + 20))
  {
    *(unsigned char *)(v13 + 8) = 0;
    *(void *)(v13 + 72) = 0xFFFFFFFF00000000;
    int v19 = 0x40000000;
  }
  else
  {
    int v19 = 0;
  }
  *(_DWORD *)uint64_t v13 = v19 | (a4 >> 2);
  *(_DWORD *)(v13 + 4) = a3;

  return CSStore2::Store::setUnitAddress((CSStore2 **)this, v15, a4 & 0xFFFFFFFC, (Unit *)v13);
}

void sub_1A7DCAB3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *CSStore2::Table::getName(CSStore2::Table *this)
{
  uint64_t v1 = (__CFString *)CSStore2::Table::copyCFName(this);

  return v1;
}

Unit *CSStore2::Store::setUnitAddress(CSStore2 **this, CSStore2::Table *a2, unsigned int a3, Unit *a4)
{
  if (a4)
  {
    char v6 = *this;
    if (*this) {
      unint64_t v7 = *((void *)v6 + 1);
    }
    else {
      unint64_t v7 = 0;
    }
    unsigned int v8 = -1;
    BOOL v9 = (unint64_t)a4 >= v7;
    unint64_t v10 = (unint64_t)a4 - v7;
    if (v9 && !HIDWORD(v10))
    {
      if ((v10 + 1) > *(_DWORD *)(*((void *)v6 + 1) + 12) || v10 == -1) {
        unsigned int v8 = -1;
      }
      else {
        unsigned int v8 = v10;
      }
    }
  }
  else
  {
    unsigned int v8 = -1;
  }
  uint64_t v12 = *((unsigned int *)a2 + 19);
  if (v12 != -1)
  {
    uint64_t v13 = *this;
    uint64_t v14 = *((void *)*this + 1);
    if (*(_DWORD *)(v14 + 12) > v12)
    {
      unsigned int v15 = (_DWORD *)(v14 + v12);
      if (a4)
      {
        if (a3)
        {
          int v16 = CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::Find(v13, (int *)(v14 + v12), a3);
          unsigned int v17 = a3;
          if (v16)
          {
            *int v16 = v8;
            goto LABEL_72;
          }
        }
        else
        {
          if (v8 != -1)
          {
LABEL_73:
            uint64_t v44 = *((void *)*this + 1);
            if (*(_DWORD *)(v44 + 12) > v8) {
              return (Unit *)(v44 + v8);
            }
            return 0;
          }
          unsigned int v17 = 0;
        }
        int v19 = &v15[2 * ((unsigned __int16)(v17 >> 2) % *v15)];
        unint64_t v20 = (unint64_t)(v19 + 1);
        uint64_t v21 = v19[2];
        if (v21 == -1)
        {
          uint64_t v25 = 0;
        }
        else
        {
          uint64_t v22 = *((void *)*this + 1);
          BOOL v23 = *(_DWORD *)(v22 + 12) > v21;
          uint64_t v24 = (char *)(v22 + v21);
          if (v23) {
            uint64_t v25 = v24;
          }
          else {
            uint64_t v25 = 0;
          }
        }
        uint64_t v26 = *(unsigned int *)v20;
        if (v26)
        {
          uint64_t v27 = 0;
          __int16 v28 = v25 + 4;
          while (*(v28 - 1) && *v28 != -1)
          {
            ++v27;
            v28 += 2;
            if (v26 == v27) {
              goto LABEL_36;
            }
          }
          uint64_t v32 = &v25[8 * v27];
          *(_DWORD *)uint64_t v32 = v17;
          *((_DWORD *)v32 + 1) = v8;
LABEL_72:
          if (v8 == -1) {
            return 0;
          }
          goto LABEL_73;
        }
LABEL_36:
        unsigned int v29 = v26 + 8;
        if (*this)
        {
          unint64_t v30 = *((void *)*this + 1);
          unsigned int v31 = -1;
          BOOL v9 = v20 >= v30;
          v20 -= v30;
          if (!v9 || HIDWORD(v20)) {
            goto LABEL_51;
          }
        }
        else
        {
          if (HIDWORD(v20))
          {
            unsigned int v31 = -1;
            goto LABEL_51;
          }
          unint64_t v30 = MEMORY[8];
        }
        if ((v20 + 1) > *(_DWORD *)(v30 + 12) || v20 == -1) {
          unsigned int v31 = -1;
        }
        else {
          unsigned int v31 = v20;
        }
LABEL_51:
        id v34 = CSStore2::Store::embraceAndExtend((CSStore2::Store *)this, v25, (const void *)(8 * v26), 8 * v29);
        if (v31 == -1 || (uint64_t v35 = *((void *)*this + 1), *(_DWORD *)(v35 + 12) <= v31)) {
          float v36 = 0;
        }
        else {
          float v36 = (_DWORD *)(v35 + v31);
        }
        if (!v34)
        {
          v36[1] = -1;
          abort();
        }
        BOOL v37 = *this;
        if (*this) {
          unint64_t v38 = *((void *)v37 + 1);
        }
        else {
          unint64_t v38 = 0;
        }
        int v39 = -1;
        BOOL v9 = (unint64_t)v34 >= v38;
        unint64_t v40 = (unint64_t)&v34[-v38];
        if (v9 && !HIDWORD(v40))
        {
          if ((v40 + 1) > *(_DWORD *)(*((void *)v37 + 1) + 12) || v40 == -1) {
            int v39 = -1;
          }
          else {
            int v39 = v40;
          }
        }
        v36[1] = v39;
        int v42 = (unsigned int *)&v34[8 * v26];
        *int v42 = a3;
        v42[1] = v8;
        if ((int)v26 + 1 < v29)
        {
          uint64_t v43 = 0;
          do
          {
            *(void *)&v34[8 * (v26 + 1) + v43] = 0xFFFFFFFF00000000;
            v43 += 8;
          }
          while (v43 != 56);
        }
        *v36 += 8;
        goto LABEL_72;
      }
      if (!a3) {
        return 0;
      }
      uint64_t v18 = CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::Find(v13, (int *)(v14 + v12), a3);
      if (!v18) {
        return 0;
      }
      a4 = 0;
      *uint64_t v18 = -1;
    }
  }
  return a4;
}

uint64_t CSStore2::Store::getUnitCount(atomic_ullong *this, const CSStore2::Table *a2)
{
  uint64_t v5 = 0;
  char v6 = &v5;
  uint64_t v7 = 0x2020000000;
  int v8 = 0;
  if (a2)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = ___ZNK8CSStore25Store12getUnitCountEPKNS_5TableE_block_invoke;
    v4[3] = &unk_1E5D2A640;
    v4[4] = &v5;
    CSStore2::Store::enumerateUnits(this, (unsigned int *)a2, v4);
    uint64_t v2 = *((unsigned int *)v6 + 6);
  }
  else
  {
    uint64_t v2 = 0;
  }
  _Block_object_dispose(&v5, 8);
  return v2;
}

void sub_1A7DCAF14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZNK8CSStore25Store12getUnitCountEPKNS_5TableE_block_invoke(uint64_t result)
{
  return result;
}

Unit *CSStore2::Store::reallocateUnit(CSStore2 **this, CSStore2::Table *a2, Unit *a3, CSStore2::VM *a4)
{
  uint64_t v5 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  var2 = (const void *)a3->var2;
  int v8 = var2 - a4;
  if (var2 >= a4)
  {
    CSStore2::Store::assertNotEnumeratingUnits((uint64_t)this);
    if ((v8 + 3) >= 4) {
      unsigned int v13 = (v8 + 3) & 0xFFFFFFFC;
    }
    else {
      unsigned int v13 = 4;
    }
    uint64_t v14 = *((void *)*this + 1);
    unsigned int v15 = *(_DWORD *)(v14 + 16);
    BOOL v16 = v15 >= v13;
    unsigned int v17 = v15 - v13;
    if (!v16) {
      unsigned int v17 = 0;
    }
    *(_DWORD *)(v14 + 16) = v17;
    ++*(_DWORD *)(v14 + 8);
    v5->var2 = a4;
  }
  else
  {
    unint64_t v10 = (CSStore2::VM *)v19;
    bzero(v19, 0x800uLL);
    if (a4 >= 0x801 && (unint64_t v10 = (CSStore2::VM *)CSStore2::VM::Allocate(a4)) == 0
      || (CSStore2::VM::Copy((NSUInteger)v10, (NSUInteger)v5->var3, var2),
          unsigned int v11 = 4 * *(_DWORD *)v5,
          CSStore2::Store::freeUnit(this, a2, v5),
          (Unit = CSStore2::Store::allocateUnit((CSStore2::Store *)this, a2, (int)a4, v11)) == 0))
    {
      abort();
    }
    uint64_t v5 = Unit;
    CSStore2::VM::Copy((NSUInteger)Unit->var3, (NSUInteger)v10, var2);
    if (v10 != (CSStore2::VM *)v19) {
      CSStore2::VM::Deallocate(v10, a4);
    }
  }
  return v5;
}

Unit *CSStore2::Store::freeUnit(CSStore2 **this, CSStore2::Table *a2, Unit *a3)
{
  unsigned int var2 = a3->var2;
  CSStore2::Store::assertNotEnumeratingUnits((uint64_t)this);
  if (var2 + 11 >= 4) {
    unsigned int v7 = (var2 + 11) & 0xFFFFFFFC;
  }
  else {
    unsigned int v7 = 4;
  }
  uint64_t v8 = *((void *)*this + 1);
  unsigned int v9 = *(_DWORD *)(v8 + 16);
  BOOL v10 = v9 >= v7;
  unsigned int v11 = v9 - v7;
  if (!v10) {
    unsigned int v11 = 0;
  }
  *(_DWORD *)(v8 + 16) = v11;
  ++*(_DWORD *)(v8 + 8);
  int v12 = *(_DWORD *)a3;
  uint64_t result = CSStore2::Store::setUnitAddress(this, a2, 4 * v12, 0);
  uint64_t v14 = *this;
  if (*this) {
    uint64_t v14 = (CSStore2 *)*((void *)v14 + 1);
  }
  if ((CSStore2 *)((char *)v14 + 20) == a2 && (v12 & 0x3FFFFFFFu) <= 0x3F) {
    *((_DWORD *)this + (v12 & 0x3FFFFFFF) + 2) = -1;
  }
  return result;
}

id **std::unique_ptr<CSStore2::Store>::reset[abi:nn180100](id **result)
{
  uint64_t v1 = *result;
  Unit *result = 0;
  if (v1)
  {

    JUMPOUT(0x1AD0DACB0);
  }
  return result;
}

void sub_1A7DCB2A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7DCB378(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A7DCB474(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZN8CSStore2L15IsAppleInternalEv_block_invoke_121()
{
  uint64_t result = os_variant_has_internal_diagnostics();
  CSStore2::IsAppleInternal(void)::uint64_t result = result;
  return result;
}

void sub_1A7DCB580(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<CSStore2::Store>::reset[abi:nn180100]((id **)va);

  _Unwind_Resume(a1);
}

void sub_1A7DCB5C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

_CSStore *CSStoreCreateMutable(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x1AD0DB160]();
  id v7 = 0;
  uint64_t v3 = [[_CSStore alloc] initWithError:&v7];
  id v4 = v7;
  uint64_t v5 = v4;
  if (a1 && !v3) {
    *a1 = v4;
  }

  return v3;
}

uint64_t _CSStoreCommit(void *a1, void *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  char v6 = (void *)MEMORY[0x1AD0DB160]();
  if (performMutatingAssertions)
  {
    uint64_t v7 = a1[43];
    if (v7) {
      (***(void (****)(void))(v7 + 8))(*(void *)(v7 + 8));
    }
  }
  if (performConstantAssertions)
  {
    uint64_t v8 = a2[43];
    if (v8) {
      (*(void (**)(void))(**(void **)(v8 + 8) + 8))(*(void *)(v8 + 8));
    }
  }
  if (a1[39] != a2[39])
  {
    unsigned int v15 = (void *)MEMORY[0x1E4F28C58];
    v32[0] = *MEMORY[0x1E4F28228];
    v32[1] = @"Line";
    v33[0] = @"paramErr";
    v33[1] = &unk_1EFE436E0;
    BOOL v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
    uint64_t v17 = [v15 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v16];
LABEL_15:
    uint64_t v20 = (void *)v17;

    id v21 = v20;
    id v22 = v21;
LABEL_16:
    id v23 = v22;
    uint64_t v24 = 0;
    goto LABEL_17;
  }
  uint64_t v9 = a2[40];
  if ((v9 & 0xFF00000000) == 0)
  {
    uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
    v34[0] = *MEMORY[0x1E4F28228];
    v34[1] = @"Line";
    v35[0] = @"paramErr";
    v35[1] = &unk_1EFE436C8;
    BOOL v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
    uint64_t v17 = [v18 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v16];
    goto LABEL_15;
  }
  uint64_t v11 = a1[1];
  BOOL v10 = (CSStore2::Store *)(a1 + 1);
  if (*(_DWORD *)(*(void *)(v11 + 8) + 8) != v9)
  {
    int v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v36 = *MEMORY[0x1E4F28228];
    BOOL v37 = @"Line";
    unint64_t v38 = @"kCSStoreConflictErr";
    int v39 = &unk_1EFE436B0;
    BOOL v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v36 count:2];
    uint64_t v17 = [v19 errorWithDomain:*MEMORY[0x1E4F28760] code:-9487 userInfo:v16];
    goto LABEL_15;
  }
  uint64_t v12 = a2[1];
  if (v12)
  {
    uint64_t v13 = *(unsigned int *)(v12 + 16);
    uint64_t v14 = *(CSStore2::VM **)(v12 + 8);
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v14 = 0;
  }
  Copy = (void *)CSStore2::VM::AllocateCopy(v14, (const void *)v13, (CSStore2::VM *)v13);
  if (!Copy)
  {
    unint64_t v30 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v36 = *MEMORY[0x1E4F28228];
    BOOL v37 = @"Line";
    unint64_t v38 = @"kCSStoreAllocFailedErr";
    int v39 = &unk_1EFE436F8;
    unsigned int v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v36 count:2];
    id v22 = [v30 errorWithDomain:*MEMORY[0x1E4F28760] code:-9493 userInfo:v31];

    goto LABEL_16;
  }
  CSStore2::Store::setBytesNoCopy(v10, Copy, v13);
  id v23 = 0;
  uint64_t v24 = 1;
LABEL_17:

  id v25 = v23;
  uint64_t v26 = v25;
  if (a3) {
    char v27 = v24;
  }
  else {
    char v27 = 1;
  }
  if ((v27 & 1) == 0) {
    *a3 = v25;
  }

  return v24;
}

void sub_1A7DCBA00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _CSStoreWriteToURL(uint64_t a1, void *a2, void *a3, CSStore2::Store *a4, void *a5)
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1AD0DB160]();
  if (performConstantAssertions)
  {
    uint64_t v10 = *(void *)(a1 + 344);
    if (v10) {
      (*(void (**)(void))(**(void **)(v10 + 8) + 8))(*(void *)(v10 + 8));
    }
  }
  id v11 = a2;
  id v75 = a3;
  if (!v11 || ![v11 isFileURL])
  {
    uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
    *(void *)&long long v78 = *MEMORY[0x1E4F28228];
    *((void *)&v78 + 1) = @"Line";
    *(void *)buf = @"paramErr";
    *(void *)&buf[8] = &unk_1EFE43698;
    id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v78 count:2];
    id v22 = [v20 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v21];
LABEL_47:

    uint64_t v57 = v22;
    uint64_t v58 = 0;
    id v59 = v57;
    goto LABEL_48;
  }
  id v70 = v11;
  id v71 = v70;
  if ((a4 & 2) != 0)
  {
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v70 resolvingAgainstBaseURL:1];
    uint64_t v13 = [v12 path];
    uint64_t v14 = v13;
    if (v13)
    {
      unsigned int v15 = [v13 pathExtension];
      if (v15)
      {
        uint64_t v16 = [v14 stringByDeletingPathExtension];

        uint64_t v14 = (void *)v16;
      }
      uint64_t v17 = objc_msgSend(v14, "stringByAppendingFormat:", @"(%llx~)", arc4random());

      if (v15)
      {
        uint64_t v18 = [v17 stringByAppendingPathExtension:v15];

        int v19 = (void *)v18;
      }
      else
      {
        int v19 = v17;
      }
      [v12 setPath:v19];
    }
    id v71 = [v12 URL];

    uint64_t v24 = CSStore2::GetLog(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      *(void *)&uint8_t buf[4] = v71;
      _os_log_impl(&dword_1A7DB2000, v24, OS_LOG_TYPE_INFO, "Writing to temporary CSStore file %{private}@", buf, 0xCu);
    }
  }
  id v25 = (void *)[v75 mutableCopy];
  uint64_t v26 = v25;
  if (v25)
  {
    id v72 = v25;
  }
  else
  {
    id v72 = [MEMORY[0x1E4F1CA60] dictionary];
  }

  char v27 = [v72 objectForKeyedSubscript:*MEMORY[0x1E4F1C5E8]];

  if (v27)
  {
    *(_WORD *)buf = 0;
    if (CFFileSecurityGetMode((CFFileSecurityRef)v27, (mode_t *)buf)) {
      unsigned __int16 v28 = *(_WORD *)buf;
    }
    else {
      unsigned __int16 v28 = 384;
    }
  }
  else
  {
    unsigned __int16 v28 = 384;
  }
  id v29 = v72;
  uint64_t v30 = *MEMORY[0x1E4F1C590];
  id v73 = v29;
  unsigned int v31 = [v29 objectForKeyedSubscript:*MEMORY[0x1E4F1C590]];
  if (v31)
  {
    uint64_t v32 = *MEMORY[0x1E4F1C570];
    *(void *)&long long v78 = *MEMORY[0x1E4F1C598];
    *((void *)&v78 + 1) = v32;
    *(void *)buf = &unk_1EFE43608;
    *(void *)&buf[8] = &unk_1EFE43620;
    uint64_t v33 = *MEMORY[0x1E4F1C580];
    uint64_t v79 = *MEMORY[0x1E4F1C578];
    uint64_t v80 = v33;
    *(void *)&buf[16] = &unk_1EFE43638;
    uint8x8_t v82 = (CSStore2 *)&unk_1EFE43650;
    id v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v78 count:4];
    uint64_t v35 = [v34 objectForKeyedSubscript:v31];
    int v36 = [v35 intValue];

    [v73 removeObjectForKey:v30];
  }
  else
  {
    int v36 = -1;
  }

  id v21 = v71;
  int v37 = open_dprotected_np((const char *)[v21 fileSystemRepresentation], 2562, v36, 0, v28);
  int v38 = v37;
  if (v37 < 0)
  {
    int v46 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v47 = *__error();
    *(void *)&long long v78 = *MEMORY[0x1E4F28228];
    *((void *)&v78 + 1) = @"Line";
    *(void *)buf = @"errno";
    *(void *)&buf[8] = &unk_1EFE43680;
    unsigned int v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v78 count:2];
    id v22 = [v46 errorWithDomain:*MEMORY[0x1E4F28798] code:v47 userInfo:v48];

    id v50 = CSStore2::GetLog(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)unint64_t v77 = 138543362;
      *(void *)&v77[4] = v22;
      _os_log_error_impl(&dword_1A7DB2000, v50, OS_LOG_TYPE_ERROR, "Failed to open file descriptor for writing store file: %{public}@", v77, 0xCu);
    }

    goto LABEL_46;
  }
  int v39 = fdopen(v37, "w+");
  if (!v39)
  {
    id v51 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v52 = *__error();
    *(void *)&long long v78 = *MEMORY[0x1E4F28228];
    *((void *)&v78 + 1) = @"Line";
    *(void *)buf = @"errno";
    *(void *)&buf[8] = &unk_1EFE43668;
    __int16 v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v78 count:2];
    id v22 = [v51 errorWithDomain:*MEMORY[0x1E4F28798] code:v52 userInfo:v53];

    id v55 = CSStore2::GetLog(v54);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)unint64_t v77 = 138543362;
      *(void *)&v77[4] = v22;
      _os_log_error_impl(&dword_1A7DB2000, v55, OS_LOG_TYPE_ERROR, "Failed to create file handle from file descriptor for writing store file: %{public}@", v77, 0xCu);
    }

    close(v38);
    goto LABEL_46;
  }
  *(void *)buf = v39;
  *(_WORD *)&buf[8] = 1;
  *(void *)unint64_t v77 = 0;
  char v40 = CSStore2::GarbageCollection::Collect((CSStore2::GarbageCollection *)(a1 + 8), (FILE **)buf, a4, v77);
  uint64_t v41 = (CSStore2 *)*(id *)v77;
  id v22 = v41;
  if ((v40 & 1) == 0)
  {
    unsigned int v56 = CSStore2::GetLog(v41);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v78) = 138543362;
      *(void *)((char *)&v78 + 4) = v22;
      _os_log_error_impl(&dword_1A7DB2000, v56, OS_LOG_TYPE_ERROR, "Failed to collect-and-write store file: %{public}@", (uint8_t *)&v78, 0xCu);
    }

    unlink((const char *)[v21 fileSystemRepresentation]);
    CSStore2::Writer::~Writer((void **)buf);
LABEL_46:

    goto LABEL_47;
  }
  CSStore2::Writer::~Writer((void **)buf);
  if (v75)
  {
    *(void *)&long long v78 = 0;
    char v42 = [v21 setResourceValues:v73 error:&v78];
    uint64_t v43 = (CSStore2 *)(id)v78;
    uint64_t v44 = v43;
    if ((v42 & 1) == 0)
    {
      int v45 = CSStore2::GetLog(v43);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        unint64_t v69 = [v70 path];
        *(_DWORD *)buf = 138478339;
        *(void *)&uint8_t buf[4] = v69;
        *(_WORD *)&unsigned char buf[12] = 2114;
        *(void *)&buf[14] = v75;
        *(_WORD *)&buf[22] = 2114;
        uint8x8_t v82 = v44;
        _os_log_error_impl(&dword_1A7DB2000, v45, OS_LOG_TYPE_ERROR, "Failed to set resource values at %{private}@ to %{public}@ (non-fatal error): %{public}@", buf, 0x20u);
      }
    }
  }
  else
  {
    uint64_t v44 = 0;
  }

  if ((a4 & 2) != 0)
  {
    id v64 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v76 = v22;
    int v65 = [v64 replaceItemAtURL:v70 withItemAtURL:v21 backupItemName:0 options:0 resultingItemURL:0 error:&v76];
    id v59 = (CSStore2 *)v76;

    unint64_t v67 = CSStore2::GetLog(v66);
    unint64_t v68 = v67;
    if (v65)
    {
      if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138478083;
        *(void *)&uint8_t buf[4] = v21;
        *(_WORD *)&unsigned char buf[12] = 2113;
        *(void *)&buf[14] = v70;
        _os_log_impl(&dword_1A7DB2000, v68, OS_LOG_TYPE_INFO, "Moved temporary CSStore file %{private}@ to %{private}@", buf, 0x16u);
      }

      goto LABEL_61;
    }
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138478339;
      *(void *)&uint8_t buf[4] = v21;
      *(_WORD *)&unsigned char buf[12] = 2113;
      *(void *)&buf[14] = v70;
      *(_WORD *)&buf[22] = 2112;
      uint8x8_t v82 = v59;
      _os_log_error_impl(&dword_1A7DB2000, v68, OS_LOG_TYPE_ERROR, "Failed atomic move of temporary CSStore file %{private}@ to %{private}@: %@", buf, 0x20u);
    }

    id v22 = v59;
    goto LABEL_46;
  }
  id v59 = (CSStore2 *)v22;
LABEL_61:

  uint64_t v57 = 0;
  uint64_t v58 = 1;
LABEL_48:

  BOOL v60 = v57;
  id v61 = v60;
  if (a5) {
    char v62 = v58;
  }
  else {
    char v62 = 1;
  }
  if ((v62 & 1) == 0) {
    *a5 = v60;
  }

  return v58;
}

void sub_1A7DCC378(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

id _CSStoreCreateByReadingFromFileHandle(FILE *a1, int a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  char v6 = (void *)MEMORY[0x1AD0DB160]();
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  while (!feof(a1) && !ferror(a1))
  {
    int64_t v8 = fread(__ptr, 1uLL, 0x400uLL, a1);
    if (v8 >= 1) {
      [v7 appendBytes:__ptr length:v8];
    }
  }
  if (ferror(a1))
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
    v22[0] = *MEMORY[0x1E4F28228];
    v22[1] = @"Line";
    v23[0] = @"EIO";
    v23[1] = &unk_1EFE43800;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
    id v11 = [v9 errorWithDomain:*MEMORY[0x1E4F28798] code:5 userInfo:v10];
  }
  else if ((unint64_t)[v7 length] >> 32)
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
    v20[0] = *MEMORY[0x1E4F28228];
    v20[1] = @"Line";
    v21[0] = @"ERANGE";
    v21[1] = &unk_1EFE43818;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
    id v11 = [v12 errorWithDomain:*MEMORY[0x1E4F28798] code:34 userInfo:v13];
  }
  else
  {
    id v14 = v7;
    id v18 = 0;
    CSStore2::Store::CreateWithBytes(&v19, (Bytef *)[v14 bytes], objc_msgSend(v14, "length"), &v18);
    id v11 = v18;
    unsigned int v15 = v19;
    if (v19)
    {
      id v16 = [[_CSStore alloc] initByMovingStore:v19];

      MEMORY[0x1AD0DACB0](v15, 0x10A0C40D11E5446);
      if (!a3) {
        goto LABEL_16;
      }
      goto LABEL_14;
    }
  }
  id v16 = 0;
  if (!a3) {
    goto LABEL_16;
  }
LABEL_14:
  if (!v16) {
    *a3 = v11;
  }
LABEL_16:

  if (a2) {
    fclose(a1);
  }
  return v16;
}

void sub_1A7DCC754(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _CSStoreGarbageCollect(uint64_t a1, CSStore2::Store *a2)
{
  id v4 = (void *)MEMORY[0x1AD0DB160]();
  if (performMutatingAssertions)
  {
    uint64_t v5 = *(void *)(a1 + 344);
    if (v5) {
      (***(void (****)(void))(v5 + 8))(*(void *)(v5 + 8));
    }
  }
  uint64_t v6 = CSStore2::Store::collectGarbage((CSStore2::Store *)(a1 + 8), a2);
  return v6;
}

void _CSStoreEnumerateTables(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1 && v3)
  {
    if (performConstantAssertions)
    {
      uint64_t v5 = *(void *)(a1 + 344);
      if (v5) {
        (*(void (**)(void))(**(void **)(v5 + 8) + 8))(*(void *)(v5 + 8));
      }
    }
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = ___CSStoreEnumerateTables_block_invoke;
    void v6[3] = &unk_1E5D2A6E0;
    id v7 = v4;
    CSStore2::Store::enumerateTables((atomic_ullong *)(a1 + 8), v6);
  }
}

void sub_1A7DCC908(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

_DWORD *_CSStoreGetArrayTable(atomic_ullong *a1)
{
  if (performConstantAssertions)
  {
    atomic_ullong v2 = a1[43];
    if (v2) {
      (*(void (**)(void))(**(void **)(v2 + 8) + 8))(*(void *)(v2 + 8));
    }
  }
  uint64_t result = (_DWORD *)a1[34];
  if (result) {
    return (_DWORD *)(4 * *result);
  }
  uint64_t result = (_DWORD *)CSStore2::Store::getTable(a1 + 1, &cfstr_Array.isa);
  if (result) {
    return (_DWORD *)(4 * *result);
  }
  return result;
}

_DWORD *_CSStoreGetStringTable(atomic_ullong *a1)
{
  if (performConstantAssertions)
  {
    atomic_ullong v2 = a1[43];
    if (v2) {
      (*(void (**)(void))(**(void **)(v2 + 8) + 8))(*(void *)(v2 + 8));
    }
  }
  uint64_t result = (_DWORD *)a1[35];
  if (result) {
    return (_DWORD *)(4 * *result);
  }
  uint64_t result = (_DWORD *)CSStore2::Store::getTable(a1 + 1, &cfstr_String_0.isa);
  if (result) {
    return (_DWORD *)(4 * *result);
  }
  return result;
}

_DWORD *_CSStoreGetDictionaryTable(atomic_ullong *a1)
{
  if (performConstantAssertions)
  {
    atomic_ullong v2 = a1[43];
    if (v2) {
      (*(void (**)(void))(**(void **)(v2 + 8) + 8))(*(void *)(v2 + 8));
    }
  }
  uint64_t result = (_DWORD *)a1[36];
  if (result) {
    return (_DWORD *)(4 * *result);
  }
  uint64_t result = (_DWORD *)CSStore2::Store::getTable(a1 + 1, &cfstr_Dictionary.isa);
  if (result) {
    return (_DWORD *)(4 * *result);
  }
  return result;
}

CFStringRef _CSStoreCopyTableName(uint64_t a1, unsigned int a2)
{
  id v4 = (void *)MEMORY[0x1AD0DB160]();
  if (performConstantAssertions)
  {
    uint64_t v5 = *(void *)(a1 + 344);
    if (v5) {
      (*(void (**)(void))(**(void **)(v5 + 8) + 8))(*(void *)(v5 + 8));
    }
  }
  if (a2 && (atomic_ullong Table = CSStore2::Store::getTable((CSStore2::Store *)(a1 + 8), a2)) != 0)
  {
    CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFStringRef v8 = (id)CSStore2::Table::copyCFName((CSStore2::Table *)Table);
    CFStringRef Copy = CFStringCreateCopy(v7, v8);
  }
  else
  {
    CFStringRef Copy = 0;
  }
  return Copy;
}

uint64_t _CSStoreAddTable(uint64_t a1, void *a2, int a3, void *a4)
{
  v31[2] = *MEMORY[0x1E4F143B8];
  CFStringRef v8 = (void *)MEMORY[0x1AD0DB160]();
  if (performMutatingAssertions)
  {
    uint64_t v9 = *(void *)(a1 + 344);
    if (v9) {
      (***(void (****)(void))(v9 + 8))(*(void *)(v9 + 8));
    }
  }
  if (a2)
  {
    uint64_t v10 = (CSStore2::Store *)(a1 + 8);
    id v11 = a2;
    if (CSStore2::Store::getTable((atomic_ullong *)v10, v11))
    {
      uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
      v30[0] = *MEMORY[0x1E4F28228];
      v30[1] = @"Line";
      v31[0] = @"kCSStoreNameAlreadyInUseErr";
      v31[1] = &unk_1EFE43830;
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
      id v14 = [v12 errorWithDomain:*MEMORY[0x1E4F28760] code:-9494 userInfo:v13];
    }
    else
    {
      atomic_ullong Table = CSStore2::Store::allocateTable(v10, v11, a3, (NSString *)1);
      if (Table)
      {
        id v14 = 0;
        uint64_t v16 = (4 * *(_DWORD *)Table);
        goto LABEL_9;
      }
      BOOL IsNameAllowed = CSStore2::Table::IsNameAllowed((CSStore2::Table *)v11, (NSString *)1);
      uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v21 = *MEMORY[0x1E4F28760];
      if (IsNameAllowed)
      {
        v28[0] = *MEMORY[0x1E4F28228];
        v28[1] = @"Line";
        v29[0] = @"kCSStoreAllocFailedErr";
        v29[1] = &unk_1EFE43848;
        id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
        id v14 = [v20 errorWithDomain:v21 code:-9493 userInfo:v22];
      }
      else
      {
        v26[0] = *MEMORY[0x1E4F28228];
        v26[1] = @"Line";
        v27[0] = @"kCSStoreNameInvalidErr";
        v27[1] = &unk_1EFE43860;
        id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
        id v14 = [v20 errorWithDomain:v21 code:-9490 userInfo:v23];
      }
    }
  }
  else
  {
    unsigned int v15 = (void *)MEMORY[0x1E4F28C58];
    v24[0] = *MEMORY[0x1E4F28228];
    v24[1] = @"Line";
    v25[0] = @"paramErr";
    v25[1] = &unk_1EFE43878;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
    id v14 = [v15 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v11];
  }
  uint64_t v16 = 0;
LABEL_9:

  if (a4 && !v16) {
    *a4 = v14;
  }

  return v16;
}

void sub_1A7DCCF04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _CSStoreRemoveTable(uint64_t a1, unsigned int a2)
{
  id v4 = (void *)MEMORY[0x1AD0DB160]();
  if (performMutatingAssertions)
  {
    uint64_t v5 = *(void *)(a1 + 344);
    if (v5) {
      (***(void (****)(void))(v5 + 8))(*(void *)(v5 + 8));
    }
  }
  if (a2 != -37516)
  {
    if (a2)
    {
      uint64_t v6 = (CSStore2::Store *)(a1 + 8);
      atomic_ullong Table = CSStore2::Store::getTable(v6, a2);
      if (Table)
      {
        if (Table[8] != 60)
        {
          uint64_t v8 = *(void *)v6;
          if (*(void *)v6) {
            uint64_t v8 = *(void *)(v8 + 8);
          }
          CSStore2::Store::freeUnit((CSStore2 **)v6, (CSStore2::Table *)(v8 + 20), (Unit *)Table);
        }
      }
    }
  }
}

uint64_t CSStoreGetUnitCount(uint64_t a1, unsigned int a2)
{
  id v4 = (void *)MEMORY[0x1AD0DB160]();
  if (performConstantAssertions)
  {
    uint64_t v5 = *(void *)(a1 + 344);
    if (v5) {
      (*(void (**)(void))(**(void **)(v5 + 8) + 8))(*(void *)(v5 + 8));
    }
  }
  uint64_t v6 = (CSStore2::Store *)(a1 + 8);
  atomic_ullong Table = CSStore2::Store::getTable(v6, a2);
  if (Table) {
    uint64_t UnitCount = CSStore2::Store::getUnitCount((atomic_ullong *)v6, (const CSStore2::Table *)Table);
  }
  else {
    uint64_t UnitCount = 0;
  }
  return UnitCount;
}

Unit *CSStoreAllocUnit(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (performMutatingAssertions)
  {
    uint64_t v6 = *(void *)(a1 + 344);
    if (v6) {
      (***(void (****)(void))(v6 + 8))(*(void *)(v6 + 8));
    }
  }
  CFAllocatorRef v7 = (CSStore2::Store *)(a1 + 8);
  atomic_ullong Table = CSStore2::Store::getTable(v7, a2);
  if (Table)
  {
    uint64_t result = CSStore2::Store::allocateUnit(v7, (CSStore2::Table *)Table, a3, 0);
    if (result) {
      return (Unit *)(4 * *(_DWORD *)result);
    }
  }
  else
  {
    uint64_t v10 = CSStore2::GetLog(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = 136446210;
      uint64_t v12 = "CSStoreUnitID CSStoreAllocUnit(CSMutableStoreRef _Nonnull, CSStoreTableID, _CSStoreSize)";
      _os_log_impl(&dword_1A7DB2000, v10, OS_LOG_TYPE_INFO, "%{public}s: no table ID supplied", (uint8_t *)&v11, 0xCu);
    }

    return 0;
  }
  return result;
}

Unit *CSStoreAllocUnitWithData(uint64_t a1, unsigned int a2, const void *a3, const void *a4)
{
  uint64_t v8 = CSStoreAllocUnit(a1, a2, (int)a3);
  uint64_t v9 = v8;
  if (a4 && v8) {
    _CSStoreWriteToUnit(a1, a2, v8, 0, a3, a4, 0);
  }
  return v9;
}

uint64_t _CSStoreWriteToUnit(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4, const void *a5, const void *a6, void *a7)
{
  v53[2] = *MEMORY[0x1E4F143B8];
  if (performMutatingAssertions)
  {
    uint64_t v14 = *(void *)(a1 + 344);
    if (v14) {
      (***(void (****)(void))(v14 + 8))(*(void *)(v14 + 8));
    }
  }
  if (!a2)
  {
    uint64_t v32 = (void *)MEMORY[0x1E4F28C58];
    v46[0] = *MEMORY[0x1E4F28228];
    v46[1] = @"Line";
    v47[0] = @"paramErr";
    v47[1] = &unk_1EFE438C0;
    uint64_t v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:2];
    id v34 = [v32 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v33];

    goto LABEL_40;
  }
  unsigned int v15 = (CSStore2::Store *)(a1 + 8);
  atomic_ullong Table = CSStore2::Store::getTable(v15, a2);
  if (!Table)
  {
    uint64_t v35 = (void *)MEMORY[0x1E4F28C58];
    v48[0] = *MEMORY[0x1E4F28228];
    v48[1] = @"Line";
    v49[0] = @"kCSStoreNotFoundErr";
    v49[1] = &unk_1EFE438A8;
    int v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:2];
    id v34 = [v35 errorWithDomain:*MEMORY[0x1E4F28760] code:-9499 userInfo:v36];

    goto LABEL_40;
  }
  Unit = CSStore2::Store::getUnit((CSStore2 **)v15, (const CSStore2::Table *)Table, a3);
  if (!Unit)
  {
    uint64_t v43 = (void *)MEMORY[0x1E4F28C58];
    v50[0] = *MEMORY[0x1E4F28228];
    v50[1] = @"Line";
    v51[0] = @"kCSStoreNotFoundErr";
    v51[1] = &unk_1EFE43890;
    uint64_t v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:2];
    id v34 = [v43 errorWithDomain:*MEMORY[0x1E4F28760] code:-9499 userInfo:v44];

LABEL_40:
    uint64_t v31 = 0;
    if (!a7) {
      goto LABEL_43;
    }
    goto LABEL_41;
  }
  unsigned int v18 = *(_DWORD *)Unit & 0xC0000000;
  BOOL v19 = v18 == 0x40000000;
  if (v18 == 0x40000000) {
    uint64_t v20 = Unit + 80;
  }
  else {
    uint64_t v20 = Unit + 8;
  }
  if (v19) {
    unsigned int v21 = *((_DWORD *)Unit + 1) - 72;
  }
  else {
    unsigned int v21 = *((_DWORD *)Unit + 1);
  }
  unint64_t v22 = *(void *)(*(void *)v15 + 8);
  unsigned int v23 = *(_DWORD *)(v22 + 12);
  if (v21 > v23 || __CFADD__(a4, a5) || a4 + a5 > v21) {
    goto LABEL_30;
  }
  int v24 = v20 - v22;
  BOOL v25 = (unint64_t)v20 < v22;
  if ((unint64_t)&v20[-v22] >> 32) {
    BOOL v25 = 1;
  }
  BOOL v26 = v24 + 1 > v23 || v24 == -1;
  if (v25 || v26) {
    int v24 = -1;
  }
  BOOL v27 = __CFADD__(v24, v21);
  unsigned int v28 = v24 + v21;
  if (v27 || v28 > v23)
  {
LABEL_30:
    BOOL v37 = v23 <= a4;
    int v38 = (void *)MEMORY[0x1E4F28C58];
    v52[0] = *MEMORY[0x1E4F28228];
    v52[1] = @"Line";
    v53[0] = @"code";
    v53[1] = &unk_1EFE43710;
    int v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:2];
    if (v22) {
      int v40 = v37;
    }
    else {
      int v40 = 1;
    }
    if (v40) {
      uint64_t v41 = -9492;
    }
    else {
      uint64_t v41 = -9497;
    }
    char v42 = [v38 errorWithDomain:*MEMORY[0x1E4F28760] code:v41 userInfo:v39];

    id v30 = v42;
    uint64_t v31 = 0;
  }
  else
  {
    id v29 = &v20[a4];
    if (memcmp(v29, a6, a5))
    {
      CSStore2::VM::Copy((NSUInteger)v29, (NSUInteger)a6, a5);
      unint64_t v22 = *(void *)(*(void *)v15 + 8);
    }
    id v30 = 0;
    ++*(_DWORD *)(v22 + 8);
    uint64_t v31 = 1;
  }

  id v34 = v30;
  if (a7)
  {
LABEL_41:
    if ((v31 & 1) == 0) {
      *a7 = v34;
    }
  }
LABEL_43:

  return v31;
}

void sub_1A7DCD680(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

char *CSStoreReallocUnit(uint64_t a1, unsigned int a2, unsigned int a3, CSStore2::VM *a4)
{
  if (!a4) {
    return 0;
  }
  if (performMutatingAssertions)
  {
    uint64_t v8 = *(void *)(a1 + 344);
    if (v8) {
      (***(void (****)(void))(v8 + 8))(*(void *)(v8 + 8));
    }
  }
  uint64_t v9 = (CSStore2::Store *)(a1 + 8);
  uint64_t result = CSStore2::Store::getTable(v9, a2);
  if (result)
  {
    int v11 = (CSStore2::Table *)result;
    uint64_t result = CSStore2::Store::getUnit((CSStore2 **)v9, (const CSStore2::Table *)result, a3);
    if (result) {
      return (char *)(4
    }
                                  * *(_DWORD *)CSStore2::Store::reallocateUnit((CSStore2 **)v9, v11, (Unit *)result, a4));
  }
  return result;
}

char *CSStoreFreeUnit(uint64_t a1, unsigned int a2, unsigned int a3)
{
  if (performMutatingAssertions)
  {
    uint64_t v6 = *(void *)(a1 + 344);
    if (v6) {
      (***(void (****)(void))(v6 + 8))(*(void *)(v6 + 8));
    }
  }
  CFAllocatorRef v7 = (CSStore2::Store *)(a1 + 8);
  uint64_t result = CSStore2::Store::getTable(v7, a2);
  if (result)
  {
    uint64_t v9 = (CSStore2::Table *)result;
    uint64_t result = CSStore2::Store::getUnit((CSStore2 **)v7, (const CSStore2::Table *)result, a3);
    if (result)
    {
      return (char *)CSStore2::Store::freeUnit((CSStore2 **)v7, v9, (Unit *)result);
    }
  }
  return result;
}

uint64_t _CSStoreWriteToHeader(uint64_t a1, unsigned int a2, unsigned int a3, const void *a4, const void *a5, void *a6)
{
  if (a1) {
    unsigned int v11 = -37516;
  }
  else {
    unsigned int v11 = 0;
  }
  return _CSStoreWriteToUnit(a1, v11, a2, a3, a4, a5, a6);
}

uint64_t _CSStoreSetExpectedAccessContext(void *a1, const char *a2)
{
  return [a1 setAccessContext:a2];
}

void _CSStoreSetExpectedAccessQueue(void *a1, void *a2)
{
  id v3 = a2;
  id v5 = v3;
  if (v3) {
    id v4 = _CSStoreAccessContextCreateWithQueue(v3);
  }
  else {
    id v4 = 0;
  }
  [a1 setAccessContext:v4];
}

void sub_1A7DCD8C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t _CSStoreValidate(uint64_t a1, char a2)
{
  if (a2) {
    id v4 = &__block_literal_global_119;
  }
  else {
    id v4 = &__block_literal_global_117;
  }
  if (performConstantAssertions)
  {
    uint64_t v5 = *(void *)(a1 + 344);
    if (v5) {
      (*(void (**)(void))(**(void **)(v5 + 8) + 8))(*(void *)(v5 + 8));
    }
  }
  uint64_t v6 = (atomic_ullong *)(a1 + 8);
  uint64_t v23 = 0;
  int v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 1;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = ___CSStoreValidate_block_invoke_3;
  v16[3] = &unk_1E5D2A750;
  id v17 = v4;
  unsigned int v18 = &v19;
  CSStore2::Store::enumerateTables(v6, v16);
  if ((a2 & 2) != 0)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = ___CSStoreValidate_block_invoke_4;
    void v12[3] = &unk_1E5D2A778;
    id v13 = v4;
    uint64_t v14 = &v23;
    unsigned int v15 = v6;
    CSStore2::Store::enumerateTables(v6, v12);
    BOOL v7 = *((unsigned char *)v20 + 24) != 0;
    if (!*((unsigned char *)v20 + 24))
    {
      if (a2) {
        uint64_t v8 = (void (**)(void *, const char *))&__block_literal_global_119;
      }
      else {
        uint64_t v8 = (void (**)(void *, const char *))&__block_literal_global_117;
      }
      v8[2](v4, "Ran out of unit identifiers.");
    }
    if (!*((unsigned char *)v24 + 24))
    {
      if (a2) {
        uint64_t v9 = (void (**)(void *, const char *))&__block_literal_global_119;
      }
      else {
        uint64_t v9 = (void (**)(void *, const char *))&__block_literal_global_117;
      }
      v9[2](v4, "Unit identifier cache entry invalid.");
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 1;
  }
  if (*((unsigned char *)v24 + 24)) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = v7;
  }

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  return v10;
}

void sub_1A7DCDB10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, ...)
{
  va_start(va, a15);

  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A7DCDBE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7DCE288(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,char a24)
{
  _Unwind_Resume(a1);
}

void sub_1A7DCE38C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _CSStoreShow(CSStore2::Store *this, int a2, FILE *a3)
{
  if (performConstantAssertions)
  {
    uint64_t v6 = *((void *)this + 43);
    if (v6) {
      (*(void (**)(void))(**(void **)(v6 + 8) + 8))(*(void *)(v6 + 8));
    }
  }
  uint64_t v9 = *((void *)this + 1);
  uint64_t v8 = (atomic_ullong *)((char *)this + 8);
  uint64_t v7 = v9;
  if (v9)
  {
    uint64_t v7 = *(void *)(v7 + 8);
    uint64_t v10 = v7 + 12;
  }
  else
  {
    uint64_t v10 = 12;
  }
  uint64_t v11 = *(unsigned int *)v10;
  unsigned int UnitCount = CSStore2::Store::getUnitCount(v8, (const CSStore2::Table *)(v7 + 20));
  id v13 = (void *)*v8;
  if (*v8) {
    id v13 = (void *)v13[1];
  }
  fprintf(a3, "\n******************************************************************************\nstore:       %p\nbytes:       %p\nlength:      %llu\ntable count: %llu\n", v8, v13, v11, UnitCount);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = ___ZN8CSStore24Show13StoreContentsERKNS_5StoreEbP7__sFILE_block_invoke;
  void v14[3] = &__block_descriptor_49_e47_v24__0r__Table__Unit_b30b2I_0c___48c_QQII_8_B16l;
  v14[4] = a3;
  v14[5] = v8;
  BOOL v15 = a2 != 0;
  CSStore2::Store::enumerateTables(v8, v14);
}

void ___ZN8CSStore24Show13StoreContentsERKNS_5StoreEbP7__sFILE_block_invoke(uint64_t a1, const CSStore2::Store *a2)
{
  uint64_t v4 = fputs("==============================================================================\n", *(FILE **)(a1 + 32));
  uint64_t v5 = (void *)MEMORY[0x1AD0DB160](v4);
  uint64_t v6 = CSStore2::Show::TableContents(*(atomic_ullong **)(a1 + 40), a2, (const CSStore2::Table *)*(unsigned __int8 *)(a1 + 48));
  id v7 = [v6 string];
  fputs((const char *)[v7 UTF8String], *(FILE **)(a1 + 32));
}

void sub_1A7DCE55C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id CSStore2::Show::TableContents(atomic_ullong *this, const CSStore2::Store *a2, const CSStore2::Table *a3)
{
  int v3 = (int)a3;
  uint64_t v6 = (void *)MEMORY[0x1AD0DB160]();
  char v42 = (CSStore2::AttributedStringWriter::Impl *)&unk_1EFE40808;
  v43[0] = 0;
  long long v49 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  v43[1] = v7;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  *(void *)&long long v49 = 0;
  long long v50 = 0u;
  long long v51 = 0u;
  DWORD2(v49) = 1065353216;
  LODWORD(v52) = 1065353216;
  WORD4(v52) = 0;
  *(void *)&long long v53 = 0;
  WORD4(v53) = 257;
  BYTE10(v53) = 0;
  uint64_t v58 = v43;
  uint64_t v8 = [NSNumber numberWithUnsignedInt:(4 * *(_DWORD *)a2)];
  CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)&v42, &cfstr_TableId.isa, v8);

  uint64_t v9 = (__CFString *)CSStore2::Table::copyCFName(a2);
  CSStore2::AttributedStringWriter::string((CSStore2::AttributedStringWriter *)&v42, &cfstr_Name.isa, &v9->isa);

  uint64_t v10 = (char *)a2 + 8;
  atomic_ullong v11 = *this;
  if (*this) {
    unint64_t v12 = *(void *)(v11 + 8);
  }
  else {
    unint64_t v12 = 0;
  }
  int v13 = -1;
  BOOL v14 = (unint64_t)v10 >= v12;
  unint64_t v15 = (unint64_t)&v10[-v12];
  if (v14 && !HIDWORD(v15))
  {
    if ((v15 + 1) > *(_DWORD *)(*(void *)(v11 + 8) + 12) || v15 == -1) {
      int v13 = -1;
    }
    else {
      int v13 = v15;
    }
  }
  int v41 = v13;
  id v17 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3321888768;
  v40[2] = ___ZN8CSStore24Show13TableContentsERKNS_5StoreEPKNS_5TableEb_block_invoke;
  v40[3] = &__block_descriptor_48_ea8_32c68_ZTSKZN8CSStore24Show13TableContentsERKNS_5StoreEPKNS_5TableEbEUlvE__e5_v8__0l;
  v40[4] = &v42;
  v40[5] = &v41;
  CSStore2::AttributedStringWriter::withAppliedAttribute((uint64_t)&v42, @"_CSVNum", (uint64_t)v17, (uint64_t)v40);

  unsigned int v18 = [NSNumber numberWithUnsignedInt:*((unsigned int *)a2 + 1)];
  CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)&v42, &cfstr_Length_0.isa, v18);

  objc_msgSend(NSNumber, "numberWithUnsignedInt:", CSStore2::Store::getUnitCount(this, a2));
  uint64_t v19 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)&v42, &cfstr_UnitCount.isa, v19);

  uint64_t v20 = [NSNumber numberWithUnsignedInt:(*((_DWORD *)a2 + 1) - 72)];
  CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)&v42, &cfstr_HeaderLength.isa, v20);

  atomic_ullong Table = (const CSStore2::Store *)this[34];
  if (!Table) {
    atomic_ullong Table = (const CSStore2::Store *)CSStore2::Store::getTable(this, &cfstr_String_0.isa);
  }
  if (Table == a2)
  {
    CSStore2::String::GetDebugDescriptionOfCache((CSStore2::String *)this, v21);
    uint64_t v23 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v23) {
      CSStore2::AttributedStringWriter::string((CSStore2::AttributedStringWriter *)&v42, &cfstr_Stringcache.isa, v23);
    }
  }
  uint64_t v24 = *((unsigned int *)a2 + 19);
  if (v24 != -1)
  {
    uint64_t v25 = *(void *)(*this + 8);
    if (*(_DWORD *)(v25 + 12) > v24)
    {
      id v26 = objc_alloc_init(MEMORY[0x1E4F28E78]);
      if (CSStore2::NameOfType<CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>>(void)::once != -1) {
        dispatch_once(&CSStore2::NameOfType<CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>>(void)::once, &__block_literal_global_174);
      }
      BOOL v27 = (unsigned int *)(v25 + v24);
      id v28 = (id)CSStore2::NameOfType<CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>>(void)::result;
      id v29 = v28;
      atomic_ullong v30 = *this;
      if (*this) {
        unint64_t v31 = *(void *)(v30 + 8);
      }
      else {
        unint64_t v31 = 0;
      }
      uint64_t v32 = 0xFFFFFFFFLL;
      BOOL v14 = (unint64_t)v27 >= v31;
      unint64_t v33 = (unint64_t)v27 - v31;
      if (v14 && !HIDWORD(v33))
      {
        BOOL v34 = (v33 + 1) > *(_DWORD *)(*(void *)(v30 + 8) + 12) || v33 == -1;
        uint64_t v32 = v33;
        if (v34) {
          uint64_t v32 = 0xFFFFFFFFLL;
        }
      }
      [v26 appendFormat:@"%@ @ 0x%llx", v28, v32];

      unint64_t Statistics = CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::GetStatistics(v27);
      [v26 appendFormat:@" { buckets = %llu, count = %llu }", HIDWORD(Statistics), Statistics];
      if (v26) {
        CSStore2::AttributedStringWriter::string((CSStore2::AttributedStringWriter *)&v42, &cfstr_Identifiercach.isa, (NSString *)v26);
      }
    }
  }
  if (v3)
  {
    CSStore2::AttributedStringWriter::separator(&v42, (CSStore2::AttributedStringWriter *)0x2B, 0);
    if (*this) {
      int v36 = *(CSStore2::Show **)(*this + 8);
    }
    else {
      int v36 = 0;
    }
    CSStore2::Show::ShowBytes(v36, (char *)a2, (const void *)(*((_DWORD *)a2 + 1) + 8));
    BOOL v37 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
    CSStore2::AttributedStringWriter::attributedString(&v42, v37);
  }
  int v38 = (void *)[v7 copy];
  CSStore2::AttributedStringWriter::~AttributedStringWriter((CSStore2::AttributedStringWriter *)&v42);

  return v38;
}

void sub_1A7DCEA30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);

  CSStore2::AttributedStringWriter::~AttributedStringWriter((CSStore2::AttributedStringWriter *)va);
  _Unwind_Resume(a1);
}

void ___ZN8CSStore24Show13TableContentsERKNS_5StoreEPKNS_5TableEb_block_invoke(uint64_t a1)
{
}

id CSStore2::Show::ShowBytes(CSStore2::Show *this, char *a2, const void *a3)
{
  unsigned int v3 = a3;
  int v5 = (int)this;
  context = (void *)MEMORY[0x1AD0DB160]();
  id v13 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  unsigned int v34 = 0;
  for (int i = a2 - v5; v34 < v3; v34 += 16)
  {
    uint64_t v6 = (void *)MEMORY[0x1AD0DB160]();
    id v7 = objc_alloc_init(MEMORY[0x1E4F28E48]);
    id v17 = &unk_1EFE40808;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v8 = v7;
    *((void *)&v18 + 1) = v8;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    *(void *)&long long v24 = 0;
    long long v25 = 0u;
    long long v26 = 0u;
    DWORD2(v++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1065353216;
    LODWORD(v27) = 1065353216;
    WORD4(v27) = 0;
    *(void *)&long long v28 = 0;
    WORD4(v28) = 1;
    BYTE10(v28) = 0;
    unint64_t v33 = &v18;
    int v9 = v3 - v34;
    if (v3 - v34 >= 0x10) {
      int v9 = 16;
    }
    int v16 = v9;
    unint64_t v15 = &a2[v34];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3321888768;
    void v14[2] = ___ZN8CSStore24Show9ShowBytesEPKvS2_j_block_invoke;
    void v14[3] = &__block_descriptor_72_ea8_32c45_ZTSKZN8CSStore24Show9ShowBytesEPKvS2_jEUlvE__e5_v8__0l;
    v14[4] = &v17;
    v14[5] = &i;
    void v14[6] = &v34;
    v14[7] = &v16;
    v14[8] = &v15;
    CSStore2::AttributedStringWriter::withAppliedAttribute((uint64_t)&v17, @"_CSVFixed", MEMORY[0x1E4F1CC38], (uint64_t)v14);
    [v13 appendAttributedString:v8];
    CSStore2::AttributedStringWriter::~AttributedStringWriter((CSStore2::AttributedStringWriter *)&v17);
  }
  uint64_t v10 = (void *)[v13 copy];

  return v10;
}

void sub_1A7DCED28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN8CSStore24Show9ShowBytesEPKvS2_j_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3321888768;
  void v32[2] = ___ZZN8CSStore24Show9ShowBytesEPKvS2_jENKUlvE_clEv_block_invoke;
  v32[3] = &__block_descriptor_56_ea8_32c58_ZTSKZZN8CSStore24Show9ShowBytesEPKvS2_jENKUlvE_clEvEUlvE__e5_v8__0l;
  long long v33 = *(_OWORD *)(a1 + 40);
  uint64_t v34 = v2;
  CSStore2::AttributedStringWriter::withAppliedAttribute(v2, @"_CSVFWeight", (uint64_t)&unk_1EFE43AB8, (uint64_t)v32);
  uint64_t v3 = *(void *)(a1 + 32);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3321888768;
  v31[2] = ___ZZN8CSStore24Show9ShowBytesEPKvS2_jENKUlvE_clEv_block_invoke_183;
  void v31[3] = &__block_descriptor_40_ea8_32c59_ZTSKZZN8CSStore24Show9ShowBytesEPKvS2_jENKUlvE_clEvEUlvE0__e5_v8__0l;
  void v31[4] = v3;
  CSStore2::AttributedStringWriter::withAppliedAttribute(v3, @"_CSVOutputType", (uint64_t)&unk_1EFE438D8, (uint64_t)v31);
  uint64_t v4 = (NSAttributedString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
  for (unint64_t i = 0; i != 16; ++i)
  {
    if (i && (i & 3) == 0) {
      [(NSAttributedString *)v4 appendString:@" "];
    }
    if (i >= **(unsigned int **)(a1 + 56)) {
      [(NSAttributedString *)v4 appendString:@"  "];
    }
    else {
      [(NSAttributedString *)v4 appendFormat:@"%02x", *(unsigned __int8 *)(**(void **)(a1 + 64) + i)];
    }
  }
  CSStore2::AttributedStringWriter::string(*(CSStore2::AttributedStringWriter::Impl ***)(a1 + 32), v4);
  CSStore2::AttributedStringWriter::string(*(CSStore2::AttributedStringWriter::Impl ***)(a1 + 32), (NSAttributedString *)@"    ");
  uint64_t v6 = **(unsigned int **)(a1 + 56);
  if (v6)
  {
    id v7 = **(char ***)(a1 + 64);
    id v8 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned short>>(v6);
    uint64_t v10 = v8;
    uint64_t v11 = 0;
    do
    {
      __int16 v12 = *v7++;
      *(_WORD *)&v8[v11] = v12;
      v11 += 2;
    }
    while (2 * v6 != v11);
    id v13 = &v8[v11];
    BOOL v14 = &v8[2 * v9];
    BOOL v15 = v13 == v8;
    if (v13 != v8)
    {
      uint64_t v16 = 0;
      uint64_t v17 = MEMORY[0x1E4F14390];
      do
      {
        unint64_t v18 = *(unsigned __int16 *)&v8[v16];
        if (v18 > 0x7F || (*(_DWORD *)(v17 + 4 * v18 + 60) & 0x40000) == 0) {
          *(_WORD *)&v8[v16] = 183;
        }
        v16 += 2;
      }
      while (2 * ((v13 - v8) >> 1) != v16);
    }
  }
  else
  {
    uint64_t v10 = 0;
    BOOL v14 = 0;
    id v13 = 0;
    BOOL v15 = 1;
  }
  uint64_t v19 = v13 - v10;
  if ((unint64_t)(v13 - v10) > 0x1F)
  {
    if (v19 == 32) {
      long long v27 = v13;
    }
    else {
      long long v27 = v10 + 32;
    }
    goto LABEL_38;
  }
  uint64_t v20 = v19 >> 1;
  unint64_t v21 = 16 - (v19 >> 1);
  if (v21 <= (v14 - v13) >> 1)
  {
    long long v27 = &v13[2 * v21];
    uint64_t v29 = 32 - 2 * v20;
    do
    {
      *(_WORD *)id v13 = 32;
      v13 += 2;
      v29 -= 2;
    }
    while (v29);
LABEL_38:
    long long v26 = v10;
    goto LABEL_39;
  }
  unint64_t v22 = v14 - v10;
  uint64_t v23 = 16;
  if (v22 > 0x10) {
    uint64_t v23 = v22;
  }
  if (v22 >= 0x7FFFFFFFFFFFFFFELL) {
    uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v24 = v23;
  }
  long long v25 = std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned short>>(v24);
  long long v26 = (char *)&v25[v20];
  long long v27 = (char *)(v25 + 16);
  do
    v25[v20++] = 32;
  while (v20 != 16);
  if (!v15)
  {
    do
    {
      __int16 v28 = *((_WORD *)v13 - 1);
      v13 -= 2;
      *((_WORD *)v26 - 1) = v28;
      v26 -= 2;
    }
    while (v13 != v10);
  }
  if (v10) {
    operator delete(v10);
  }
LABEL_39:
  long long v30 = (NSAttributedString *)[[NSString alloc] initWithCharactersNoCopy:v26 length:(v27 - v26) >> 1 freeWhenDone:0];
  CSStore2::AttributedStringWriter::string(*(CSStore2::AttributedStringWriter::Impl ***)(a1 + 32), v30);
  CSStore2::AttributedStringWriter::string(*(CSStore2::AttributedStringWriter::Impl ***)(a1 + 32), (NSAttributedString *)@"\n");

  if (v26) {
    operator delete(v26);
  }
}

void sub_1A7DCF0CC(_Unwind_Exception *a1)
{
  if (v2) {
    operator delete(v2);
  }

  _Unwind_Resume(a1);
}

__n128 __copy_helper_block_ea8_32c45_ZTSKZN8CSStore24Show9ShowBytesEPKvS2_jEUlvE_(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 32);
  long long v3 = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v3;
  return result;
}

void ___ZZN8CSStore24Show9ShowBytesEPKvS2_jENKUlvE_clEv_block_invoke(uint64_t a1)
{
  uint64_t v5 = (**(_DWORD **)(a1 + 40) + **(_DWORD **)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 48);
  long long v3 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3321888768;
  v4[2] = ___ZZZN8CSStore24Show9ShowBytesEPKvS2_jENKUlvE_clEvENKUlvE_clEv_block_invoke;
  v4[3] = &__block_descriptor_48_ea8_32c71_ZTSKZZZN8CSStore24Show9ShowBytesEPKvS2_jENKUlvE_clEvENKUlvE_clEvEUlvE__e5_v8__0l;
  v4[4] = *(void *)(a1 + 48);
  void v4[5] = &v5;
  CSStore2::AttributedStringWriter::withAppliedAttribute(v2, @"_CSVNum", (uint64_t)v3, (uint64_t)v4);
}

void sub_1A7DCF1F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZZN8CSStore24Show9ShowBytesEPKvS2_jENKUlvE_clEv_block_invoke_183(uint64_t a1)
{
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned short>>(uint64_t a1)
{
  if (a1 < 0) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(2 * a1);
}

uint64_t __copy_helper_block_ea8_32c59_ZTSKZZN8CSStore24Show9ShowBytesEPKvS2_jENKUlvE_clEvEUlvE0_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 32) = *(void *)(a2 + 32);
  return result;
}

__n128 __copy_helper_block_ea8_32c58_ZTSKZZN8CSStore24Show9ShowBytesEPKvS2_jENKUlvE_clEvEUlvE_(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[2];
  a1[3].n128_u64[0] = a2[3].n128_u64[0];
  a1[2] = result;
  return result;
}

void ___ZZZN8CSStore24Show9ShowBytesEPKvS2_jENKUlvE_clEvENKUlvE_clEv_block_invoke(uint64_t a1)
{
}

__n128 __copy_helper_block_ea8_32c71_ZTSKZZZN8CSStore24Show9ShowBytesEPKvS2_jENKUlvE_clEvENKUlvE_clEvEUlvE_(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[2];
  a1[2] = result;
  return result;
}

void ___ZN8CSStore2L10NameOfTypeINS_7HashMapIjjNS_20_IdentifierFunctionsELy1EEEEEP8NSStringv_block_invoke()
{
  std::string::basic_string[abi:nn180100]<0>(&__p, "NSString *CSStore2::NameOfType() [T = CSStore2::HashMap<unsigned int, unsigned int, CSStore2::_IdentifierFunctions, 1>]_block_invoke");
  uint64_t v0 = CSStore2::_CopyNameOfTypeImpl(&__p);
  uint64_t v1 = (void *)CSStore2::NameOfType<CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>>(void)::result;
  CSStore2::NameOfType<CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>>(void)::__n128 result = v0;

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_1A7DCF314(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::string::basic_string[abi:nn180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    abort();
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

__n128 __copy_helper_block_ea8_32c68_ZTSKZN8CSStore24Show13TableContentsERKNS_5StoreEPKNS_5TableEbEUlvE_(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[2];
  a1[2] = result;
  return result;
}

char *_CSStoreCopyDebugDescriptionOfTable(uint64_t a1, unsigned int a2, int a3)
{
  if (performConstantAssertions)
  {
    uint64_t v6 = *(void *)(a1 + 344);
    if (v6) {
      (*(void (**)(void))(**(void **)(v6 + 8) + 8))(*(void *)(v6 + 8));
    }
  }
  uint64_t v7 = (CSStore2::Store *)(a1 + 8);
  __n128 result = CSStore2::Store::getTable(v7, a2);
  if (result)
  {
    CSStore2::Show::TableContents((atomic_ullong *)v7, (const CSStore2::Store *)result, (const CSStore2::Table *)(a3 != 0));
    return (char *)objc_claimAutoreleasedReturnValue();
  }
  return result;
}

char *_CSStoreCopyDebugDescriptionOfUnit(uint64_t a1, unsigned int a2, unsigned int a3, int a4)
{
  if (a1) {
    int v7 = -37516;
  }
  else {
    int v7 = 0;
  }
  if (v7 == a2)
  {
    return _CSStoreCopyDebugDescriptionOfTable(a1, a3, a4);
  }
  else
  {
    if (performConstantAssertions)
    {
      uint64_t v10 = *(void *)(a1 + 344);
      if (v10) {
        (*(void (**)(void))(**(void **)(v10 + 8) + 8))(*(void *)(v10 + 8));
      }
    }
    uint64_t v11 = a1 + 8;
    atomic_ullong Table = CSStore2::Store::getTable((CSStore2::Store *)(a1 + 8), a2);
    if (!Table) {
      return 0;
    }
    Unit = CSStore2::Store::getUnit((CSStore2 **)(a1 + 8), (const CSStore2::Table *)Table, a3);
    if (!Unit) {
      return 0;
    }
    BOOL v14 = Unit;
    BOOL v15 = (void *)MEMORY[0x1AD0DB160]();
    uint64_t v34 = (CSStore2::AttributedStringWriter::Impl *)&unk_1EFE40808;
    v35[0] = 0;
    long long v41 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v16 = objc_alloc_init(MEMORY[0x1E4F28E48]);
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v35[1] = v16;
    *(void *)&long long v41 = 0;
    long long v42 = 0u;
    long long v43 = 0u;
    DWORD2(v41) = 1065353216;
    LODWORD(v44) = 1065353216;
    WORD4(v44) = 0;
    *(void *)&long long v45 = 0;
    WORD4(v45) = 257;
    BYTE10(v45) = 0;
    long long v50 = v35;
    int v33 = 4 * *(_DWORD *)v14;
    uint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3321888768;
    void v32[2] = ___ZN8CSStore24Show12UnitContentsERKNS_5StoreEPKNS_4UnitEb_block_invoke;
    v32[3] = &__block_descriptor_48_ea8_32c66_ZTSKZN8CSStore24Show12UnitContentsERKNS_5StoreEPKNS_4UnitEbEUlvE__e5_v8__0l;
    void v32[4] = &v34;
    v32[5] = &v33;
    CSStore2::AttributedStringWriter::withAppliedAttribute((uint64_t)&v34, @"_CSVNum", (uint64_t)v17, (uint64_t)v32);

    unint64_t v18 = [NSNumber numberWithUnsignedLong:*((unsigned int *)v14 + 1) + 8];
    CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)&v34, &cfstr_Length_0.isa, v18);

    uint64_t v19 = v14 + 8;
    uint64_t v20 = *(void *)v11;
    if (*(void *)v11) {
      unint64_t v21 = *(void *)(v20 + 8);
    }
    else {
      unint64_t v21 = 0;
    }
    int v23 = -1;
    BOOL v24 = (unint64_t)v19 >= v21;
    unint64_t v25 = (unint64_t)&v19[-v21];
    if (v24 && !HIDWORD(v25))
    {
      if ((v25 + 1) > *(_DWORD *)(*(void *)(v20 + 8) + 12) || v25 == -1) {
        int v23 = -1;
      }
      else {
        int v23 = v25;
      }
    }
    int v31 = v23;
    long long v27 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3321888768;
    void v30[2] = ___ZN8CSStore24Show12UnitContentsERKNS_5StoreEPKNS_4UnitEb_block_invoke_212;
    v30[3] = &__block_descriptor_48_ea8_32c67_ZTSKZN8CSStore24Show12UnitContentsERKNS_5StoreEPKNS_4UnitEbEUlvE0__e5_v8__0l;
    v30[4] = &v34;
    v30[5] = &v31;
    CSStore2::AttributedStringWriter::withAppliedAttribute((uint64_t)&v34, @"_CSVNum", (uint64_t)v27, (uint64_t)v30);

    if (a4)
    {
      CSStore2::AttributedStringWriter::separator(&v34, (CSStore2::AttributedStringWriter *)0x2B, 0);
      if (*(void *)v11) {
        __int16 v28 = *(CSStore2::Show **)(*(void *)v11 + 8);
      }
      else {
        __int16 v28 = 0;
      }
      CSStore2::Show::ShowBytes(v28, v14, (const void *)(*((_DWORD *)v14 + 1) + 8));
      uint64_t v29 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
      CSStore2::AttributedStringWriter::attributedString(&v34, v29);
    }
    uint64_t v22 = [v16 copy];
    CSStore2::AttributedStringWriter::~AttributedStringWriter((CSStore2::AttributedStringWriter *)&v34);

    return (char *)v22;
  }
}

void sub_1A7DCF864(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);

  CSStore2::AttributedStringWriter::~AttributedStringWriter((CSStore2::AttributedStringWriter *)va);
  _Unwind_Resume(a1);
}

void ___ZN8CSStore24Show12UnitContentsERKNS_5StoreEPKNS_4UnitEb_block_invoke(uint64_t a1)
{
}

void ___ZN8CSStore24Show12UnitContentsERKNS_5StoreEPKNS_4UnitEb_block_invoke_212(uint64_t a1)
{
}

__n128 __copy_helper_block_ea8_32c67_ZTSKZN8CSStore24Show12UnitContentsERKNS_5StoreEPKNS_4UnitEbEUlvE0_(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[2];
  a1[2] = result;
  return result;
}

__n128 __copy_helper_block_ea8_32c66_ZTSKZN8CSStore24Show12UnitContentsERKNS_5StoreEPKNS_4UnitEbEUlvE_(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[2];
  a1[2] = result;
  return result;
}

uint64_t _CSStoreCopyDebugDescriptionOfBytesInRange(uint64_t a1, unsigned int a2, void *a3)
{
  if (performConstantAssertions)
  {
    uint64_t v6 = *(void *)(a1 + 344);
    if (v6) {
      (*(void (**)(void))(**(void **)(v6 + 8) + 8))(*(void *)(v6 + 8));
    }
  }
  uint64_t result = 0;
  if (!__CFADD__(a2, a3))
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 8) + 8);
    if (a2 + a3 <= *(_DWORD *)(v8 + 12))
    {
      CSStore2::Show::ShowBytes((CSStore2::Show *)(v8 + 100 * a2), (char *)(v8 + 100 * a2), a3);
      return objc_claimAutoreleasedReturnValue();
    }
  }
  return result;
}

uint64_t _CSStoreCopyMemoryStatistics(uint64_t a1)
{
  if (performConstantAssertions)
  {
    uint64_t v2 = *(void *)(a1 + 344);
    if (v2) {
      (*(void (**)(void))(**(void **)(v2 + 8) + 8))(*(void *)(v2 + 8));
    }
  }
  long long v3 = (atomic_ullong *)(a1 + 8);
  size_t v4 = (void *)MEMORY[0x1AD0DB160]();
  uint64_t v73 = 0;
  uint64_t v74 = &v73;
  uint64_t v75 = 0x2020000000;
  uint64_t v76 = 0;
  uint64_t v69 = 0;
  id v70 = &v69;
  uint64_t v71 = 0x2020000000;
  uint64_t v72 = 0;
  uint64_t v61 = 0;
  char v62 = &v61;
  uint64_t v63 = 0x4812000000;
  id v64 = __Block_byref_object_copy__193;
  int v65 = __Block_byref_object_dispose__194;
  double v66 = "";
  v68[0] = 0;
  v68[1] = 0;
  unint64_t v67 = v68;
  uint64_t v53 = 0;
  long long v54 = &v53;
  uint64_t v55 = 0x4812000000;
  long long v56 = __Block_byref_object_copy__193;
  long long v57 = __Block_byref_object_dispose__194;
  uint64_t v58 = "";
  v60[0] = 0;
  v60[1] = 0;
  id v59 = v60;
  uint64_t v49 = 0;
  long long v50 = &v49;
  uint64_t v51 = 0x2020000000;
  uint64_t v52 = 0;
  uint64_t v45 = 0;
  long long v46 = &v45;
  uint64_t v47 = 0x2020000000;
  uint64_t v48 = 0;
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = ___ZN8CSStore24Show16MemoryStatisticsERKNS_5StoreE_block_invoke;
  v44[3] = &unk_1E5D2A7E8;
  v44[4] = &v73;
  v44[5] = &v61;
  v44[9] = &v49;
  v44[10] = v3;
  v44[6] = &v53;
  v44[7] = &v45;
  v44[8] = &v69;
  CSStore2::Store::enumerateTables(v3, v44);
  StringCache = (unsigned int *)CSStore2::getStringCache((CSStore2 *)v3, v5);
  if (StringCache)
  {
    CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::GetStatistics(StringCache);
    unint64_t v8 = HIDWORD(v7);
  }
  else
  {
    unint64_t v8 = 0;
  }
  unint64_t v26 = v8;
  long long v27 = (CSStore2::AttributedStringWriter::Impl *)&unk_1EFE40808;
  v28[0] = 0;
  long long v34 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v9 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  v28[1] = v9;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  *(void *)&long long v34 = 0;
  DWORD2(v34) = 1065353216;
  long long v35 = 0u;
  long long v36 = 0u;
  LODWORD(v37) = 1065353216;
  WORD4(v37) = 0;
  *(void *)&long long v38 = 0;
  WORD4(v38) = 257;
  BYTE10(v38) = 0;
  long long v43 = v28;
  CSStore2::AttributedStringWriter::separator(&v27, (CSStore2::AttributedStringWriter *)0x2B, &cfstr_StructureSizes.isa);
  CSStore2::Show::ShowSize((CSStore2::Show *)&v27, (CSStore2::AttributedStringWriter *)@"sizeof(Data)", (NSString *)0xFFFFFFFFFFFFFFFFLL, 100);
  CSStore2::Show::ShowSize((CSStore2::Show *)&v27, (CSStore2::AttributedStringWriter *)@"sizeof(Table)", (NSString *)0xFFFFFFFFFFFFFFFFLL, 80);
  CSStore2::Show::ShowSize((CSStore2::Show *)&v27, (CSStore2::AttributedStringWriter *)@"sizeof(Unit)", (NSString *)0xFFFFFFFFFFFFFFFFLL, 8);
  CSStore2::Show::ShowSize((CSStore2::Show *)&v27, (CSStore2::AttributedStringWriter *)@"sizeof(IdentifierCache)", (NSString *)0xFFFFFFFFFFFFFFFFLL, 4);
  CSStore2::AttributedStringWriter::separator(&v27, (CSStore2::AttributedStringWriter *)0x2B, &cfstr_MemoryByTable.isa);
  uint64_t v10 = (uint64_t *)v62[6];
  uint64_t v11 = v62 + 7;
  if (v10 != v62 + 7)
  {
    do
    {
      __int16 v12 = v10 + 4;
      id v13 = v10 + 4;
      if (*((char *)v10 + 55) < 0) {
        id v13 = (void *)*v12;
      }
      BOOL v14 = [NSString stringWithUTF8String:v13];
      BOOL v15 = (uint64_t **)(v54 + 6);
      id v16 = (void **)std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::__find_equal<std::string>((uint64_t)(v54 + 6), &v77, v10 + 4);
      uint64_t v17 = (char *)*v16;
      if (!*v16)
      {
        unint64_t v18 = (uint64_t **)v16;
        uint64_t v17 = (char *)operator new(0x40uLL);
        uint64_t v19 = (std::string *)(v17 + 32);
        if (*((char *)v10 + 55) < 0)
        {
          std::string::__init_copy_ctor_external(v19, (const std::string::value_type *)v10[4], v10[5]);
        }
        else
        {
          long long v20 = *(_OWORD *)v12;
          *((void *)v17 + 6) = v10[6];
          *(_OWORD *)&v19->__r_.__value_.__l.__data_ = v20;
        }
        *((void *)v17 + 7) = 0;
        std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::__insert_node_at(v15, v77, v18, (uint64_t *)v17);
      }
      CSStore2::Show::ShowSize((CSStore2::Show *)&v27, v14, *((NSString **)v17 + 7), v10[7]);

      unint64_t v21 = (uint64_t *)v10[1];
      if (v21)
      {
        do
        {
          uint64_t v22 = v21;
          unint64_t v21 = (uint64_t *)*v21;
        }
        while (v21);
      }
      else
      {
        do
        {
          uint64_t v22 = (uint64_t *)v10[2];
          BOOL v23 = *v22 == (void)v10;
          uint64_t v10 = v22;
        }
        while (!v23);
      }
      uint64_t v10 = v22;
    }
    while (v22 != v11);
  }
  CSStore2::AttributedStringWriter::separator(&v27, (CSStore2::AttributedStringWriter *)0x2B, &cfstr_MemorySummary.isa);
  CSStore2::Show::ShowSize((CSStore2::Show *)&v27, (CSStore2::AttributedStringWriter *)@"Tables", (NSString *)0xFFFFFFFFFFFFFFFFLL, v74[3]);
  CSStore2::Show::ShowSize((CSStore2::Show *)&v27, (CSStore2::AttributedStringWriter *)@"Identifier caches", (NSString *)0xFFFFFFFFFFFFFFFFLL, v50[3]);
  CSStore2::Show::ShowSize((CSStore2::Show *)&v27, (CSStore2::AttributedStringWriter *)@"String caches", (NSString *)0xFFFFFFFFFFFFFFFFLL, v26);
  CSStore2::Show::ShowSize((CSStore2::Show *)&v27, (CSStore2::AttributedStringWriter *)@"All units", (NSString *)v70[3], v46[3]);
  CSStore2::Show::ShowSize((CSStore2::Show *)&v27, (CSStore2::AttributedStringWriter *)@"Collectable", (NSString *)0xFFFFFFFFFFFFFFFFLL, (*(_DWORD *)(*(void *)(*v3 + 8) + 12) - *(_DWORD *)(*(void *)(*v3 + 8) + 16)));
  CSStore2::Show::ShowSize((CSStore2::Show *)&v27, (CSStore2::AttributedStringWriter *)@"Total bytes used", (NSString *)0xFFFFFFFFFFFFFFFFLL, *(unsigned int *)(*(void *)(*v3 + 8) + 16));
  uint64_t v24 = [v9 copy];
  CSStore2::AttributedStringWriter::~AttributedStringWriter((CSStore2::AttributedStringWriter *)&v27);

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);
  std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::destroy(v60[0]);
  _Block_object_dispose(&v61, 8);
  std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::destroy(v68[0]);
  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(&v73, 8);
  return v24;
}

void sub_1A7DCFF58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *__Block_byref_object_copy__193(void *result, void *a2)
{
  result[6] = a2[6];
  uint64_t v2 = a2 + 7;
  uint64_t v3 = a2[7];
  result[7] = v3;
  size_t v4 = result + 7;
  uint64_t v5 = a2[8];
  result[8] = v5;
  if (v5)
  {
    *(void *)(v3 + 16) = v4;
    a2[6] = v2;
    void *v2 = 0;
    a2[8] = 0;
  }
  else
  {
    result[6] = v4;
  }
  return result;
}

void __Block_byref_object_dispose__194(uint64_t a1)
{
}

void ___ZN8CSStore24Show16MemoryStatisticsERKNS_5StoreE_block_invoke(uint64_t a1, CSStore2::Table *this)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += (*((_DWORD *)this + 1) - 72) + 80;
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = (id) CSStore2::Table::copyCFName(this);
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)[(__CFString *)v5 UTF8String]);
  uint64_t v22 = __p;
  uint64_t v6 = std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)(v4 + 48), __p, (_OWORD **)&v22);
  if (v21 < 0) {
    operator delete(__p[0]);
  }

  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  unint64_t v8 = (id) CSStore2::Table::copyCFName(this);
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)[(__CFString *)v8 UTF8String]);
  uint64_t v22 = __p;
  id v9 = (char *)v6 + 56;
  uint64_t v10 = (char *)std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)(v7 + 48), __p, (_OWORD **)&v22)+ 56;
  if (v21 < 0) {
    operator delete(__p[0]);
  }

  uint64_t v11 = *(atomic_ullong **)(a1 + 80);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = ___ZN8CSStore24Show16MemoryStatisticsERKNS_5StoreE_block_invoke_2;
  v16[3] = &unk_1E5D2A7C0;
  unint64_t v18 = v9;
  uint64_t v19 = v10;
  long long v17 = *(_OWORD *)(a1 + 56);
  CSStore2::Store::enumerateUnits(v11, (unsigned int *)this, v16);
  uint64_t v12 = *((unsigned int *)this + 19);
  if (v12 != -1)
  {
    uint64_t v13 = *(void *)(**(void **)(a1 + 80) + 8);
    if (*(_DWORD *)(v13 + 12) > v12 && v13 != 0)
    {
      CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::GetStatistics((unsigned int *)(v13 + v12));
      *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) += HIDWORD(v15);
    }
  }
}

void sub_1A7DD01FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a22 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void CSStore2::Show::ShowSize(CSStore2::Show *this, CSStore2::AttributedStringWriter *a2, NSString *a3, uint64_t a4)
{
  uint64_t v7 = a2;
  uint64_t v30 = a4;
  long long v31 = a3;
  unint64_t v8 = (void *)MEMORY[0x1AD0DB160]();
  if (CSStore2::Show::ShowSize(CSStore2::AttributedStringWriter &,NSString *,unsigned long long,unsigned long long)::once != -1) {
    dispatch_once(&CSStore2::Show::ShowSize(CSStore2::AttributedStringWriter &,NSString *,unsigned long long,unsigned long long)::once, &__block_literal_global_263);
  }
  uint64_t v13 = &unk_1EFE40808;
  v14[0] = 0;
  long long v20 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v9 = (NSAttributedString *)objc_alloc_init(MEMORY[0x1E4F28E48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v14[1] = v9;
  *(void *)&long long v20 = 0;
  long long v21 = 0u;
  long long v22 = 0u;
  DWORD2(v20) = 1065353216;
  LODWORD(v23) = 1065353216;
  WORD4(v23) = 0;
  *(void *)&long long v24 = 0;
  WORD4(v++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  BYTE10(v++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  long long v29 = v14;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3321888768;
  void v12[2] = ___ZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyy_block_invoke_2;
  void v12[3] = &__block_descriptor_48_ea8_32c78_ZTSKZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyyEUlvE__e5_v8__0l;
  void v12[4] = &v13;
  void v12[5] = &v30;
  CSStore2::AttributedStringWriter::withAppliedAttribute((uint64_t)&v13, @"_CSVFixed", MEMORY[0x1E4F1CC38], (uint64_t)v12);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3321888768;
  void v11[2] = ___ZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyy_block_invoke_267;
  v11[3] = &__block_descriptor_40_ea8_32c79_ZTSKZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyyEUlvE0__e5_v8__0l;
  v11[4] = &v13;
  CSStore2::AttributedStringWriter::withAppliedAttribute((uint64_t)&v13, @"_CSVOutputType", (uint64_t)&unk_1EFE438D8, (uint64_t)v11);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3321888768;
  _OWORD v10[2] = ___ZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyy_block_invoke_270;
  v10[3] = &__block_descriptor_56_ea8_32c79_ZTSKZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyyEUlvE1__e5_v8__0l;
  void v10[4] = &v31;
  v10[5] = &v13;
  v10[6] = &v30;
  CSStore2::AttributedStringWriter::withAppliedAttribute((uint64_t)&v13, @"_CSVFixed", MEMORY[0x1E4F1CC38], (uint64_t)v10);
  CSStore2::AttributedStringWriter::attributedString(this, (NSAttributedString *)v7, v9);
  CSStore2::AttributedStringWriter::~AttributedStringWriter((CSStore2::AttributedStringWriter *)&v13);
}

void sub_1A7DD04D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::destroy(char *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::destroy(*(void *)a1);
    std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::destroy(*((void *)a1 + 1));
    if (a1[55] < 0) {
      operator delete(*((void **)a1 + 4));
    }
    operator delete(a1);
  }
}

void *std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::__find_equal<std::string>(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void **)(a1 + 8);
  if (v4)
  {
    do
    {
      while (1)
      {
        uint64_t v7 = v4;
        unint64_t v8 = v4 + 4;
        if (!std::less<std::string>::operator()[abi:nn180100](a3, v4 + 4)) {
          break;
        }
        uint64_t v4 = (void *)*v7;
        uint64_t v5 = v7;
        if (!*v7) {
          goto LABEL_9;
        }
      }
      if (!std::less<std::string>::operator()[abi:nn180100](v8, a3)) {
        break;
      }
      uint64_t v5 = v7 + 1;
      uint64_t v4 = (void *)v7[1];
    }
    while (v4);
  }
  else
  {
    uint64_t v7 = (void *)(a1 + 8);
  }
LABEL_9:
  *a2 = v7;
  return v5;
}

uint64_t **std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::__insert_node_at(uint64_t **result, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  uint64_t v4 = (uint64_t *)**result;
  if (v4)
  {
    char *result = v4;
    a4 = *a3;
  }
  uint64_t v5 = result[1];
  *((unsigned char *)a4 + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a4 == v5;
  if (a4 != v5)
  {
    do
    {
      uint64_t v6 = (uint64_t *)a4[2];
      if (*((unsigned char *)v6 + 24)) {
        break;
      }
      uint64_t v7 = (uint64_t *)v6[2];
      unint64_t v8 = (uint64_t *)*v7;
      if ((uint64_t *)*v7 == v6)
      {
        uint64_t v11 = v7[1];
        if (!v11 || (v12 = *(unsigned __int8 *)(v11 + 24), id v9 = (unsigned char *)(v11 + 24), v12))
        {
          if ((uint64_t *)*v6 == a4)
          {
            uint64_t v13 = (uint64_t **)a4[2];
          }
          else
          {
            uint64_t v13 = (uint64_t **)v6[1];
            BOOL v14 = *v13;
            v6[1] = (uint64_t)*v13;
            if (v14)
            {
              void v14[2] = (uint64_t)v6;
              uint64_t v7 = (uint64_t *)v6[2];
            }
            void v13[2] = v7;
            *(void *)(v6[2] + 8 * (*(void *)v6[2] != (void)v6)) = v13;
            *uint64_t v13 = v6;
            v6[2] = (uint64_t)v13;
            uint64_t v7 = v13[2];
            uint64_t v6 = (uint64_t *)*v7;
          }
          *((unsigned char *)v13 + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
          *((unsigned char *)v7 + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
          uint64_t v17 = v6[1];
          uint64_t *v7 = v17;
          if (v17) {
            *(void *)(v17 + 16) = v7;
          }
          v6[2] = v7[2];
          *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v6;
          v6[1] = (uint64_t)v7;
          goto LABEL_29;
        }
      }
      else if (!v8 || (v10 = *((unsigned __int8 *)v8 + 24), id v9 = v8 + 3, v10))
      {
        if ((uint64_t *)*v6 == a4)
        {
          uint64_t v15 = a4[1];
          *uint64_t v6 = v15;
          if (v15)
          {
            *(void *)(v15 + 16) = v6;
            uint64_t v7 = (uint64_t *)v6[2];
          }
          a4[2] = (uint64_t)v7;
          *(void *)(v6[2] + 8 * (*(void *)v6[2] != (void)v6)) = a4;
          a4[1] = (uint64_t)v6;
          v6[2] = (uint64_t)a4;
          uint64_t v7 = (uint64_t *)a4[2];
        }
        else
        {
          a4 = (uint64_t *)a4[2];
        }
        *((unsigned char *)a4 + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
        *((unsigned char *)v7 + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
        uint64_t v6 = (uint64_t *)v7[1];
        uint64_t v16 = *v6;
        v7[1] = *v6;
        if (v16) {
          *(void *)(v16 + 16) = v7;
        }
        v6[2] = v7[2];
        *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v6;
        *uint64_t v6 = (uint64_t)v7;
LABEL_29:
        void v7[2] = (uint64_t)v6;
        break;
      }
      *((unsigned char *)v6 + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
      a4 = v7;
      *((unsigned char *)v7 + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v7 == v5;
      *id v9 = 1;
    }
    while (v7 != v5);
  }
  result[2] = (uint64_t *)((char *)result[2] + 1);
  return result;
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  uint64_t v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8) {
      abort();
    }
    std::string::size_type v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17) {
      std::string::size_type v6 = __sz | 7;
    }
    std::string::size_type v7 = v6 + 1;
    unint64_t v8 = (std::string *)operator new(v6 + 1);
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

BOOL std::less<std::string>::operator()[abi:nn180100](void *a1, void *a2)
{
  int v2 = *((char *)a2 + 23);
  int v3 = *((char *)a1 + 23);
  if (v3 >= 0) {
    size_t v4 = *((unsigned __int8 *)a1 + 23);
  }
  else {
    size_t v4 = a1[1];
  }
  if (v3 < 0) {
    a1 = (void *)*a1;
  }
  if (v2 >= 0) {
    size_t v5 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v5 = a2[1];
  }
  if (v2 < 0) {
    a2 = (void *)*a2;
  }
  if (v5 >= v4) {
    size_t v6 = v4;
  }
  else {
    size_t v6 = v5;
  }
  int v7 = memcmp(a1, a2, v6);
  if (v7) {
    return v7 < 0;
  }
  else {
    return v4 < v5;
  }
}

void ___ZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyy_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = [NSNumber numberWithUnsignedLongLong:**(void **)(a1 + 40)];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3321888768;
  v4[2] = ___ZZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyyENKUlvE_clEv_block_invoke;
  v4[3] = &__block_descriptor_48_ea8_32c91_ZTSKZZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyyENKUlvE_clEvEUlvE__e5_v8__0l;
  long long v5 = *(_OWORD *)(a1 + 32);
  CSStore2::AttributedStringWriter::withAppliedAttribute(v2, @"_CSVNum", (uint64_t)v3, (uint64_t)v4);
}

void sub_1A7DD0980(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyy_block_invoke_267(uint64_t a1)
{
}

void ___ZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyy_block_invoke_270(int8x16_t *a1)
{
  uint64_t v1 = a1[2].i64[1];
  if (*(void *)a1[2].i64[0] == -1)
  {
    long long v5 = (CSStore2::AttributedStringWriter::Impl **)a1[2].i64[1];
    CSStore2::AttributedStringWriter::string(v5, (NSAttributedString *)@"-----");
  }
  else
  {
    int v3 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3321888768;
    v6[2] = ___ZZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyyENKUlvE1_clEv_block_invoke;
    void v6[3] = &__block_descriptor_56_ea8_32c92_ZTSKZZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyyENKUlvE1_clEvEUlvE__e5_v8__0l;
    uint64_t v4 = a1[3].i64[0];
    int8x16_t v7 = vextq_s8(a1[2], a1[2], 8uLL);
    uint64_t v8 = v4;
    CSStore2::AttributedStringWriter::withAppliedAttribute(v1, @"_CSVNum", (uint64_t)v3, (uint64_t)v6);
  }
}

void sub_1A7DD0A98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__n128 __copy_helper_block_ea8_32c79_ZTSKZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyyEUlvE1_(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[2];
  a1[3].n128_u64[0] = a2[3].n128_u64[0];
  a1[2] = result;
  return result;
}

void ___ZZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyyENKUlvE1_clEv_block_invoke(uint64_t a1)
{
  CSStore2::AttributedStringWriter::format(*(CSStore2::AttributedStringWriter **)(a1 + 32), 0, &cfstr_LluUnits.isa, **(void **)(a1 + 40));
  unint64_t v2 = **(void **)(a1 + 40);
  if (v2 >= 2)
  {
    int v3 = *(CSStore2::AttributedStringWriter **)(a1 + 32);
    id v4 = [(id)CSStore2::Show::ShowSize(CSStore2::AttributedStringWriter &,NSString *,unsigned long long,unsigned long long)::bf stringFromByteCount:**(void **)(a1 + 48) / v2];
    CSStore2::AttributedStringWriter::format(v3, 0, &cfstr_Unit_0.isa, v4);
  }
}

void sub_1A7DD0B70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

__n128 __copy_helper_block_ea8_32c92_ZTSKZZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyyENKUlvE1_clEvEUlvE_(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[2];
  a1[3].n128_u64[0] = a2[3].n128_u64[0];
  a1[2] = result;
  return result;
}

uint64_t __copy_helper_block_ea8_32c79_ZTSKZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyyEUlvE0_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 32) = *(void *)(a2 + 32);
  return result;
}

__n128 __copy_helper_block_ea8_32c78_ZTSKZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyyEUlvE_(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[2];
  a1[2] = result;
  return result;
}

void ___ZZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyyENKUlvE_clEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(CSStore2::AttributedStringWriter **)(a1 + 32);
  uint64_t v2 = **(void **)(a1 + 40);
  id v3 = [(id)CSStore2::Show::ShowSize(CSStore2::AttributedStringWriter &,NSString *,unsigned long long,unsigned long long)::bf stringFromByteCount:v2];
  CSStore2::AttributedStringWriter::format(v1, 0, &cfstr_10llu10s.isa, v2, [v3 UTF8String]);
}

void sub_1A7DD0C28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

__n128 __copy_helper_block_ea8_32c91_ZTSKZZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyyENKUlvE_clEvEUlvE_(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[2];
  a1[2] = result;
  return result;
}

void ___ZN8CSStore24Show8ShowSizeERNS_22AttributedStringWriterEP8NSStringyy_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28B68]);
  uint64_t v1 = (void *)CSStore2::Show::ShowSize(CSStore2::AttributedStringWriter &,NSString *,unsigned long long,unsigned long long)::bf;
  CSStore2::Show::ShowSize(CSStore2::AttributedStringWriter &,NSString *,unsigned long long,unsigned long long)::bf = (uint64_t)v0;
}

_OWORD *std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t **a1, void *a2, _OWORD **a3)
{
  long long v5 = (void **)std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::__find_equal<std::string>((uint64_t)a1, &v11, a2);
  size_t v6 = *v5;
  if (!*v5)
  {
    int8x16_t v7 = (uint64_t **)v5;
    size_t v6 = operator new(0x40uLL);
    uint64_t v8 = *a3;
    uint64_t v9 = *((void *)*a3 + 2);
    v6[2] = **a3;
    *((void *)v6 + 6) = v9;
    void *v8 = 0;
    v8[1] = 0;
    _OWORD v8[2] = 0;
    *((void *)v6 + 7) = 0;
    std::__tree<std::__value_type<std::string,unsigned long>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned long>>>::__insert_node_at(a1, v11, v7, (uint64_t *)v6);
  }
  return v6;
}

uint64_t ___ZN8CSStore24Show16MemoryStatisticsERKNS_5StoreE_block_invoke_2(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned int *)(a2 + 4) + 8;
  id v3 = *(void **)(result + 56);
  **(void **)(result + 48) += v2;
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += v2;
  ++*v3;
  ++*(void *)(*(void *)(*(void *)(result + 40) + 8) + 24);
  return result;
}

void sub_1A7DD0E54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7DD0F50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7DD11C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_1A7DD16F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7DD19FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7DD1ED4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7DD1FEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7DD2264(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7DD24D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, __CFString *a12, uint64_t a13, __CFString *a14, __CFString *a15, void *a16, __CFString *a17, CSStore2 *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,int buf)
{
  if (a2 == 1)
  {
    long long v34 = (CSStore2 *)objc_begin_catch(a1);
    long long v35 = v34;
    if (!v28)
    {
      long long v36 = (void *)MEMORY[0x1E4F28C58];
      a11 = *MEMORY[0x1E4F28228];
      a12 = @"Line";
      a15 = @"kCSStorePredicateErr";
      a16 = &unk_1EFE43980;
      a13 = *MEMORY[0x1E4F28588];
      a14 = @"Exception";
      a17 = @"An exception was thrown while parsing the predicate string (interpreting as an expression because predicate parsing already failed.)";
      a18 = v34;
      long long v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&a15 forKeys:&a11 count:4];
      [v36 errorWithDomain:*MEMORY[0x1E4F28760] code:-9495 userInfo:v37];
      objc_claimAutoreleasedReturnValue();
    }
    long long v38 = CSStore2::GetLog(v34);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      buf = 138477827;
      *(void *)(v31 + 4) = v35;
      _os_log_impl(&dword_1A7DB2000, v38, OS_LOG_TYPE_DEFAULT, "Suppressing exception during expression parsing: %{private}@", (uint8_t *)&buf, 0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x1A7DD2460);
  }

  _Unwind_Resume(a1);
}

void sub_1A7DD2EA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1A7DD3100(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__300(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 48);
  long long v3 = *(_OWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v3;
  return result;
}

unsigned int *CSStore2::String::Create(CSStore2::String *this, CSStore2::Table **a2, CSStore2::_StringFunctions *a3, const char *a4)
{
  unsigned int v4 = a4;
  *(unsigned char *)this = 0;
  *((unsigned char *)this + 32) = 0;
  CSStore2::String::Find((CSStore2::String *)&v71, (CSStore2::Store *)a2, a3, a4);
  long long v8 = v72;
  *(_OWORD *)this = v71;
  *((_OWORD *)this + 1) = v8;
  char v9 = v73;
  *((unsigned char *)this + 32) = v73;
  if (v9)
  {
    return CSStore2::String::retain((unsigned int *)this);
  }
  atomic_ullong Table = a2[34];
  if (!Table)
  {
    atomic_ullong Table = (CSStore2::Table *)CSStore2::Store::getTable((atomic_ullong *)a2, &cfstr_String_0.isa);
    if (!Table)
    {
      __n128 result = (unsigned int *)CSStore2::Store::allocateTable((CSStore2::Store *)a2, &cfstr_String_0.isa, 4, 0);
      if (!result) {
        return result;
      }
      int v12 = *a2;
      if (*a2) {
        unint64_t v13 = *((void *)v12 + 1);
      }
      else {
        unint64_t v13 = 0;
      }
      unsigned int v14 = -1;
      BOOL v15 = (unint64_t)result >= v13;
      unint64_t v16 = (unint64_t)result - v13;
      if (v15 && !HIDWORD(v16))
      {
        if ((v16 + 1) > *(_DWORD *)(*((void *)v12 + 1) + 12) || v16 == -1) {
          unsigned int v14 = -1;
        }
        else {
          unsigned int v14 = v16;
        }
      }
      if (a2[34] || CSStore2::Store::getTable((atomic_ullong *)a2, &cfstr_String_0.isa))
      {
        long long v71 = 0u;
        long long v72 = 0u;
        int v73 = 1065353216;
        unint64_t v18 = CSStore2::Store::extend((CSStore2::Store *)a2, 0x23884u);
        NSUInteger v19 = v18;
        if (v18)
        {
          long long v20 = *a2;
          if (*a2) {
            unint64_t v21 = *((void *)v20 + 1);
          }
          else {
            unint64_t v21 = 0;
          }
          int v22 = -1;
          BOOL v15 = v18 >= v21;
          unint64_t v23 = v18 - v21;
          if (v15 && !HIDWORD(v23))
          {
            if ((v23 + 1) > *(_DWORD *)(*((void *)v20 + 1) + 12) || v23 == -1) {
              int v22 = -1;
            }
            else {
              int v22 = v23;
            }
          }
          CSStore2::HashMap<unsigned int,CSStore2::_StringCacheEntry,CSStore2::_StringFunctions,0ull>::Create(v74, (CSStore2::_StringFunctions *)a2, (uint64_t)&v71, v22, 0);
          long long v25 = v74[0];
          if (v74[0])
          {
            CSStore2::VM::Copy(v19, (NSUInteger)v74[0], (const void *)0x23884);
            ((void (*)(void *))v74[1])(v25);
          }
          else
          {
            CSStore2::Store::assertNotEnumeratingUnits((uint64_t)a2);
            NSUInteger v19 = 0;
            uint64_t v26 = *((void *)*a2 + 1);
            unsigned int v27 = *(_DWORD *)(v26 + 16);
            BOOL v15 = v27 >= 0x23884;
            unsigned int v28 = v27 - 145540;
            if (!v15) {
              unsigned int v28 = 0;
            }
            *(_DWORD *)(v26 + 16) = v28;
            ++*(_DWORD *)(v26 + 8);
          }
        }
        std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)&v71);
      }
      else
      {
        NSUInteger v19 = 0;
      }
      if (v14 == -1 || (uint64_t v29 = *((void *)*a2 + 1), *(_DWORD *)(v29 + 12) <= v14)) {
        atomic_ullong Table = 0;
      }
      else {
        atomic_ullong Table = (CSStore2::Table *)(v29 + v14);
      }
      if (v19)
      {
        uint64_t v30 = *a2;
        if (*a2) {
          NSUInteger v31 = *((void *)v30 + 1);
        }
        else {
          NSUInteger v31 = 0;
        }
        int v32 = -1;
        BOOL v15 = v19 >= v31;
        NSUInteger v33 = v19 - v31;
        if (v15 && !HIDWORD(v33))
        {
          if ((v33 + 1) > *(_DWORD *)(*((void *)v30 + 1) + 12) || v33 == -1) {
            int v32 = -1;
          }
          else {
            int v32 = v33;
          }
        }
      }
      else
      {
        int v32 = -1;
      }
      *((_DWORD *)Table + 20) = v32;
    }
  }
  __n128 result = (unsigned int *)CSStore2::Store::allocateUnit((CSStore2::Store *)a2, Table, v4, 0);
  if (result)
  {
    long long v36 = result;
    if (v4) {
      memmove(result + 2, a3, v4);
    }
    __n128 result = (unsigned int *)CSStore2::getStringCache((CSStore2 *)a2, v35);
    if (!result) {
      goto LABEL_122;
    }
    long long v37 = result;
    long long v38 = *a2;
    if (*a2) {
      unint64_t v39 = *((void *)v38 + 1);
    }
    else {
      unint64_t v39 = 0;
    }
    unsigned int v40 = -1;
    BOOL v15 = (unint64_t)v36 >= v39;
    unint64_t v41 = (unint64_t)v36 - v39;
    if (v15 && !HIDWORD(v41))
    {
      if ((v41 + 1) > *(_DWORD *)(*((void *)v38 + 1) + 12) || v41 == -1) {
        unsigned int v40 = -1;
      }
      else {
        unsigned int v40 = v41;
      }
    }
    long long v43 = (const CSStore2::Store *)(4 * *v36);
    LODWORD(v71) = v43;
    if (!v43)
    {
LABEL_121:
      long long v36 = (unsigned int *)(*((void *)*a2 + 1) + v40);
LABEL_122:
      unsigned int v69 = v36[1];
      int v70 = 4 * *v36;
      *(void *)this = a2;
      *((_DWORD *)this + 2) = v70;
      *((unsigned char *)this + 12) = 0;
      *((void *)this + 2) = v36 + 2;
      *((_DWORD *)this + 6) = v69;
      *((unsigned char *)this + 32) = 1;
      return result;
    }
    __n128 result = CSStore2::HashMap<unsigned int,CSStore2::_StringCacheEntry,CSStore2::_StringFunctions,0ull>::Find((CSStore2 *)a2, result, &v71);
    if (result)
    {
      unsigned int *result = 257;
      goto LABEL_121;
    }
    __n128 result = (unsigned int *)CSStore2::_StringFunctions::getHashCode((CSStore2::_StringFunctions *)a2, v43);
    long long v44 = &v37[2 * (result % *v37)];
    unint64_t v45 = (unint64_t)(v44 + 1);
    uint64_t v46 = v44[2];
    if (v46 == -1)
    {
      long long v50 = 0;
    }
    else
    {
      uint64_t v47 = *((void *)*a2 + 1);
      BOOL v48 = *(_DWORD *)(v47 + 12) > v46;
      uint64_t v49 = (char *)(v47 + v46);
      if (v48) {
        long long v50 = v49;
      }
      else {
        long long v50 = 0;
      }
    }
    uint64_t v51 = *(unsigned int *)v45;
    if (v51)
    {
      uint64_t v52 = 0;
      uint64_t v53 = v50 + 4;
      while (*(v53 - 1) && *v53)
      {
        ++v52;
        v53 += 2;
        if (v51 == v52) {
          goto LABEL_89;
        }
      }
      uint64_t v58 = &v50[8 * v52];
      *(_DWORD *)uint64_t v58 = v43;
      *((_DWORD *)v58 + 1) = 257;
      goto LABEL_121;
    }
LABEL_89:
    unsigned int v54 = v51 + 8;
    uint64_t v55 = *a2;
    if (*a2)
    {
      unint64_t v56 = *((void *)v55 + 1);
      unsigned int v57 = -1;
      BOOL v15 = v45 >= v56;
      v45 -= v56;
      if (!v15)
      {
LABEL_101:
        __n128 result = (unsigned int *)CSStore2::Store::embraceAndExtend((CSStore2::Store *)a2, v50, (const void *)(8 * v51), 8 * v54);
        if (v57 == -1 || (uint64_t v60 = *((void *)*a2 + 1), *(_DWORD *)(v60 + 12) <= v57)) {
          uint64_t v61 = 0;
        }
        else {
          uint64_t v61 = (_DWORD *)(v60 + v57);
        }
        if (!result)
        {
          v61[1] = -1;
          abort();
        }
        char v62 = *a2;
        if (*a2) {
          unint64_t v63 = *((void *)v62 + 1);
        }
        else {
          unint64_t v63 = 0;
        }
        int v64 = -1;
        BOOL v15 = (unint64_t)result >= v63;
        unint64_t v65 = (unint64_t)result - v63;
        if (v15 && !HIDWORD(v65))
        {
          if ((v65 + 1) > *(_DWORD *)(*((void *)v62 + 1) + 12) || v65 == -1) {
            int v64 = -1;
          }
          else {
            int v64 = v65;
          }
        }
        v61[1] = v64;
        unint64_t v67 = &result[2 * v51];
        unsigned int *v67 = v43;
        v67[1] = 257;
        if ((int)v51 + 1 < v54)
        {
          unint64_t v68 = &result[2 * (v51 + 1)];
          *((void *)v68 + 6) = 0;
          *((_OWORD *)v68 + 1) = 0u;
          *((_OWORD *)v68 + 2) = 0u;
          *(_OWORD *)unint64_t v68 = 0u;
        }
        *v61 += 8;
        goto LABEL_121;
      }
    }
    else
    {
      unsigned int v57 = -1;
    }
    if (!HIDWORD(v45))
    {
      if ((v45 + 1) > *(_DWORD *)(*((void *)v55 + 1) + 12) || v45 == -1) {
        unsigned int v57 = -1;
      }
      else {
        unsigned int v57 = v45;
      }
    }
    goto LABEL_101;
  }
  return result;
}

void sub_1A7DD3678(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

unsigned int *CSStore2::String::retain(unsigned int *this)
{
  if (*(void *)this)
  {
    uint64_t v1 = this;
    uint64_t v2 = 0;
    this = CSStore2::String::getRetainCount((uint64_t)this, (unsigned int **)&v2);
    if (this) {
      return (unsigned int *)CSStore2::String::setRetainCount((uint64_t)v1, (const CSStore2::Store *)((_BYTE)this + 1), v2);
    }
  }
  return this;
}

_DWORD *CSStore2::HashMap<unsigned int,CSStore2::_StringCacheEntry,CSStore2::_StringFunctions,0ull>::Find(CSStore2 *a1, unsigned int *a2, _DWORD *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = *a2;
  if (!*a2) {
    return 0;
  }
  size_t v6 = (const CSStore2::Store *)*a3;
  if (!v6) {
    return 0;
  }
  if (v3 > 0x2000)
  {
    uint64_t v17 = CSStore2::GetLog(a1);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      unsigned int v25 = *a2;
      v26[0] = 67109376;
      v26[1] = v25;
      __int16 v27 = 1024;
      int v28 = 0x2000;
      _os_log_error_impl(&dword_1A7DB2000, v17, OS_LOG_TYPE_ERROR, "Impossible bucket count %u when %u is the maximum.", (uint8_t *)v26, 0xEu);
    }

    return 0;
  }
  uint64_t v8 = CSStore2::_StringFunctions::getHashCode(a1, v6) % *a2;
  uint64_t v9 = a2[2 * v8 + 1];
  if (!v9) {
    return 0;
  }
  if (v9 == 1)
  {
    uint64_t v10 = a2[2 * v8 + 2];
    if (v10 != -1)
    {
      uint64_t v11 = *(void *)(*(void *)a1 + 8);
      if (*(_DWORD *)(v11 + 12) > v10 && v11 != 0)
      {
        unint64_t v13 = (int *)(v11 + v10);
        int v15 = *v13;
        unsigned int v14 = v13 + 1;
        if (v15 == *a3) {
          return v14;
        }
        else {
          return 0;
        }
      }
    }
    return 0;
  }
  uint64_t v18 = a2[2 * v8 + 2];
  if (v18 == -1)
  {
    int v22 = 0;
  }
  else
  {
    uint64_t v19 = *(void *)(*(void *)a1 + 8);
    unsigned int v20 = *(_DWORD *)(v19 + 12);
    unint64_t v21 = (_DWORD *)(v19 + v18);
    if (v20 <= v18) {
      int v22 = 0;
    }
    else {
      int v22 = v21;
    }
  }
  uint64_t v23 = 8 * v9;
  long long v24 = &v22[2 * v9];
  while (*v22 != *a3)
  {
    v22 += 2;
    v23 -= 8;
    if (!v23)
    {
      int v22 = v24;
      break;
    }
  }
  if (v22 == v24) {
    return 0;
  }
  else {
    return v22 + 1;
  }
}

uint64_t CSStore2::_StringFunctions::getHashCode(CSStore2::_StringFunctions *this, const CSStore2::Store *a2)
{
  CSStore2::String::Get(&v6, this, a2);
  if (!v8) {
    return 0;
  }
  *(_OWORD *)unsigned int v4 = v7;
  char v5 = 1;
  if (BYTE12(v6)) {
    uint64_t v2 = v4;
  }
  else {
    uint64_t v2 = (char **)v7;
  }
  return CSStore2::_StringFunctions::getHashCode((CSStore2::_StringFunctions *)v2, (const char *)LODWORD(v4[1]));
}

void CSStore2::HashMap<unsigned int,CSStore2::_StringCacheEntry,CSStore2::_StringFunctions,0ull>::Create(void *a1, CSStore2::_StringFunctions *a2, uint64_t a3, int a4, _DWORD *a5)
{
  unsigned int v10 = *(void *)(a3 + 24) + 10000;
  if (v10 >= 0x2000) {
    unsigned int v11 = 0x2000;
  }
  else {
    unsigned int v11 = *(void *)(a3 + 24) + 10000;
  }
  if (v11 <= 0x10) {
    uint64_t v12 = 16;
  }
  else {
    uint64_t v12 = v11;
  }
  size_t v13 = (8 * v12 + 8 * v10) | 4;
  unsigned int v14 = malloc_type_malloc(v13, 0x16D4E321uLL);
  uint64_t v15 = MEMORY[0x1E4F14838];
  uint64_t v76 = (_DWORD **)a1;
  *a1 = v14;
  a1[1] = v15;
  if (v14)
  {
    unint64_t v16 = v14;
    bzero(v14, v13);
    *unint64_t v16 = v12;
    size_t v17 = 24 * v12;
    uint64_t v18 = (void **)operator new(v17);
    uint64_t v19 = v12;
    unsigned int v20 = v18;
    int v72 = v13;
    int v73 = a5;
    uint64_t v75 = v19;
    uint64_t v77 = v18;
    uint64_t v79 = &v18[3 * v19];
    size_t v21 = 24 * ((v17 - 24) / 0x18) + 24;
    bzero(v18, v21);
    int v22 = (void **)((char *)v20 + v21);
    long long v78 = v22;
    uint64_t v23 = *(uint64_t ***)(a3 + 16);
    uint64_t v74 = v16;
    if (v23)
    {
      do
      {
        long long v24 = *v76;
        unsigned int v25 = &v77[3
                 * (CSStore2::_StringFunctions::getHashCode(a2, (const CSStore2::Store *)*((unsigned int *)v23 + 4))% *v24)];
        uint64_t v27 = *((unsigned int *)v23 + 4);
        uint64_t v26 = *((unsigned int *)v23 + 5);
        uint64_t v29 = v25 + 1;
        int v28 = (uint64_t *)v25[1];
        unint64_t v30 = (unint64_t)v25[2];
        if ((unint64_t)v28 >= v30)
        {
          uint64_t v32 = ((char *)v28 - (unsigned char *)*v25) >> 3;
          if ((unint64_t)(v32 + 1) >> 61) {
            abort();
          }
          uint64_t v33 = v30 - (void)*v25;
          uint64_t v34 = v33 >> 2;
          if (v33 >> 2 <= (unint64_t)(v32 + 1)) {
            uint64_t v34 = v32 + 1;
          }
          if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v35 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v35 = v34;
          }
          if (v35) {
            unint64_t v35 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(v35);
          }
          else {
            uint64_t v36 = 0;
          }
          long long v37 = (uint64_t *)(v35 + 8 * v32);
          *long long v37 = v27 | (v26 << 32);
          NSUInteger v31 = v37 + 1;
          long long v38 = (char *)*v29;
          unint64_t v39 = (char *)*v25;
          if (*v29 != *v25)
          {
            do
            {
              uint64_t v40 = *((void *)v38 - 1);
              v38 -= 8;
              *--long long v37 = v40;
            }
            while (v38 != v39);
            long long v38 = (char *)*v25;
          }
          *unsigned int v25 = v37;
          *uint64_t v29 = v31;
          void v25[2] = (void *)(v35 + 8 * v36);
          if (v38) {
            operator delete(v38);
          }
        }
        else
        {
          *int v28 = v27 | (v26 << 32);
          NSUInteger v31 = v28 + 1;
        }
        *uint64_t v29 = v31;
        uint64_t v23 = (uint64_t **)*v23;
      }
      while (v23);
      unsigned int v20 = v77;
      int v22 = v78;
    }
    if (v20 != v22)
    {
      unsigned int v41 = 0x2710 % v75;
      if (0x2710 / v75 <= 1) {
        unsigned int v42 = 1;
      }
      else {
        unsigned int v42 = 0x2710 / v75;
      }
      do
      {
        int v43 = 0;
        long long v44 = v20[1];
        do
        {
          unint64_t v45 = (unint64_t)v20[2];
          if ((unint64_t)v44 >= v45)
          {
            uint64_t v46 = ((char *)v44 - (unsigned char *)*v20) >> 3;
            if ((unint64_t)(v46 + 1) >> 61) {
              abort();
            }
            uint64_t v47 = v45 - (void)*v20;
            uint64_t v48 = v47 >> 2;
            if (v47 >> 2 <= (unint64_t)(v46 + 1)) {
              uint64_t v48 = v46 + 1;
            }
            if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v49 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v49 = v48;
            }
            if (v49) {
              unint64_t v49 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(v49);
            }
            else {
              uint64_t v50 = 0;
            }
            uint64_t v51 = (void *)(v49 + 8 * v46);
            void *v51 = 0;
            long long v44 = v51 + 1;
            uint64_t v53 = (char *)*v20;
            uint64_t v52 = (char *)v20[1];
            if (v52 != *v20)
            {
              do
              {
                uint64_t v54 = *((void *)v52 - 1);
                v52 -= 8;
                *--uint64_t v51 = v54;
              }
              while (v52 != v53);
              uint64_t v52 = (char *)*v20;
            }
            *unsigned int v20 = v51;
            v20[1] = v44;
            void v20[2] = (void *)(v49 + 8 * v50);
            if (v52) {
              operator delete(v52);
            }
          }
          else
          {
            *v44++ = 0;
          }
          v20[1] = v44;
          ++v43;
        }
        while (v43 != v42);
        if (v41)
        {
          unint64_t v55 = (unint64_t)v20[2];
          if ((unint64_t)v44 >= v55)
          {
            uint64_t v57 = ((char *)v44 - (unsigned char *)*v20) >> 3;
            if ((unint64_t)(v57 + 1) >> 61) {
              abort();
            }
            uint64_t v58 = v55 - (void)*v20;
            uint64_t v59 = v58 >> 2;
            if (v58 >> 2 <= (unint64_t)(v57 + 1)) {
              uint64_t v59 = v57 + 1;
            }
            if ((unint64_t)v58 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v60 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v60 = v59;
            }
            if (v60) {
              unint64_t v60 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(v60);
            }
            else {
              uint64_t v61 = 0;
            }
            char v62 = (void *)(v60 + 8 * v57);
            *char v62 = 0;
            unint64_t v56 = v62 + 1;
            int v64 = (char *)*v20;
            unint64_t v63 = (char *)v20[1];
            if (v63 != *v20)
            {
              do
              {
                uint64_t v65 = *((void *)v63 - 1);
                v63 -= 8;
                *--char v62 = v65;
              }
              while (v63 != v64);
              unint64_t v63 = (char *)*v20;
            }
            *unsigned int v20 = v62;
            v20[1] = v56;
            void v20[2] = (void *)(v60 + 8 * v61);
            if (v63) {
              operator delete(v63);
            }
          }
          else
          {
            *long long v44 = 0;
            unint64_t v56 = v44 + 1;
          }
          v20[1] = v56;
          --v41;
        }
        v20 += 3;
      }
      while (v20 != v22);
    }
    uint64_t v66 = 0;
    NSUInteger v67 = (NSUInteger)&v74[2 * v75 + 1];
    unint64_t v68 = *v76;
    unsigned int v69 = *v76 + 2;
    do
    {
      NSUInteger v70 = (NSUInteger)v77[v66];
      NSUInteger v71 = (NSUInteger)v77[v66 + 1] - v70;
      *(v69 - 1) = v71 >> 3;
      _DWORD *v69 = v67 - v68 + a4;
      if ((v71 >> 3)) {
        CSStore2::VM::Copy(v67, v70, (const void *)(8 * (v71 >> 3)));
      }
      v67 += v71 & 0x7FFFFFFF8;
      v66 += 3;
      v69 += 2;
    }
    while (3 * v75 != v66);
    uint64_t v80 = &v77;
    std::vector<std::vector<CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::KeyValuePair,std::allocator<CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::KeyValuePair>>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v80);
    LODWORD(v13) = v72;
    a5 = v73;
  }
  if (a5) {
    *a5 = v13;
  }
}

void sub_1A7DD3D68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  *a14 = 0;
  MEMORY[0x1E4F14838](v14);
  _Unwind_Resume(a1);
}

unsigned int *CSStore2::String::getRetainCount(uint64_t a1, unsigned int **a2)
{
  if (a2) {
    *a2 = 0;
  }
  if (!*(void *)a1 || *(unsigned char *)(a1 + 12)) {
    return 0;
  }
  __n128 result = CSStore2::getStringCacheEntry(*(CSStore2 **)a1, (const CSStore2::Store *)*(unsigned int *)(a1 + 8));
  if (result)
  {
    unsigned int v4 = result;
    __n128 result = (unsigned int *)*(unsigned __int8 *)result;
    if (a2) {
      *a2 = v4;
    }
  }
  return result;
}

CSStore2 *CSStore2::String::setRetainCount(uint64_t a1, const CSStore2::Store *a2, CSStore2 *a3)
{
  __n128 result = *(CSStore2 **)a1;
  if (result)
  {
    if (!*(unsigned char *)(a1 + 12))
    {
      int v5 = (int)a2;
      if (a3
        || (__n128 result = (CSStore2 *)CSStore2::getStringCacheEntry(result, (const CSStore2::Store *)*(unsigned int *)(a1 + 8)), (a3 = result) != 0))
      {
        if (*(unsigned __int8 *)a3 != v5)
        {
          int v6 = *(_DWORD *)a3;
          __n128 result = (CSStore2 *)CSStore2::getStringCache(*(CSStore2 **)a1, a2);
          if (result)
          {
            long long v7 = (unsigned int *)result;
            __n128 result = *(CSStore2 **)a1;
            int v8 = *(_DWORD *)(a1 + 8);
            if (v8)
            {
              __n128 result = (CSStore2 *)CSStore2::HashMap<unsigned int,CSStore2::_StringCacheEntry,CSStore2::_StringFunctions,0ull>::Find(result, v7, &v8);
              if (result) {
                *(_DWORD *)__n128 result = v6 & 0xFFFFFF00 | v5;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

unsigned int *CSStore2::getStringCacheEntry(CSStore2 *this, const CSStore2::Store *a2)
{
  int v4 = (int)a2;
  __n128 result = (unsigned int *)CSStore2::getStringCache(this, a2);
  if (result) {
    return CSStore2::HashMap<unsigned int,CSStore2::_StringCacheEntry,CSStore2::_StringFunctions,0ull>::Find(this, result, &v4);
  }
  return result;
}

void ___ZNK8CSStore26String19getDebugDescriptionEv_block_invoke(uint64_t a1)
{
}

uint64_t __copy_helper_block_ea8_32c52_ZTSKZNK8CSStore26String19getDebugDescriptionEvE3__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 32) = *(void *)(a2 + 32);
  return result;
}

uint64_t CSStore2::String::GetUTF8BufferFromNSString(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (([v3 getCString:a2 maxLength:1024 encoding:4] & 1) == 0) {
    a2 = [v3 UTF8String];
  }

  return a2;
}

void sub_1A7DD3FA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

Unit *CSStore2::String::release(Unit *this)
{
  if (*this)
  {
    uint64_t v1 = (unsigned int *)this;
    unsigned int v10 = 0;
    this = (Unit *)CSStore2::String::getRetainCount((uint64_t)this, (unsigned int **)&v10);
    if (this)
    {
      if (this == 1)
      {
        uint64_t v2 = *(atomic_ullong **)v1;
        id v3 = *(const CSStore2::Table **)(*(void *)v1 + 272);
        if (!v3)
        {
          this = (Unit *)CSStore2::Store::getTable(v2, &cfstr_String_0.isa);
          if (!this) {
            return this;
          }
          id v3 = (const CSStore2::Table *)this;
          uint64_t v2 = *(atomic_ullong **)v1;
        }
        this = (Unit *)CSStore2::Store::getUnit((CSStore2 **)v2, v3, v1[2]);
        if (this)
        {
          int v5 = this;
          int v6 = *(CSStore2 **)v1;
          unsigned int v11 = v1[2];
          unsigned int v7 = v11;
          StringCache = (unsigned int *)CSStore2::getStringCache(v6, v4);
          if (v7 && StringCache)
          {
            uint64_t v9 = CSStore2::HashMap<unsigned int,CSStore2::_StringCacheEntry,CSStore2::_StringFunctions,0ull>::Find(v6, StringCache, &v11);
            if (v9) {
              *uint64_t v9 = 0;
            }
          }
          return CSStore2::Store::freeUnit(*(CSStore2 ***)v1, v3, v5);
        }
      }
      else
      {
        return (Unit *)CSStore2::String::setRetainCount((uint64_t)v1, (const CSStore2::Store *)((_BYTE)this - 1), v10);
      }
    }
  }
  return this;
}

id CSStore2::String::GetDebugDescriptionOfCache(CSStore2::String *this, const CSStore2::Store *a2)
{
  atomic_ullong StringCache = CSStore2::getStringCache(this, a2);
  if (StringCache)
  {
    int v4 = (unsigned int *)StringCache;
    id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    if (CSStore2::NameOfType<CSStore2::HashMap<unsigned int,CSStore2::_StringCacheEntry,CSStore2::_StringFunctions,0ull>>(void)::once != -1) {
      dispatch_once(&CSStore2::NameOfType<CSStore2::HashMap<unsigned int,CSStore2::_StringCacheEntry,CSStore2::_StringFunctions,0ull>>(void)::once, &__block_literal_global_336);
    }
    id v6 = (id)CSStore2::NameOfType<CSStore2::HashMap<unsigned int,CSStore2::_StringCacheEntry,CSStore2::_StringFunctions,0ull>>(void)::result;
    unsigned int v7 = v6;
    uint64_t v8 = *(void *)this;
    if (*(void *)this) {
      unint64_t v9 = *(void *)(v8 + 8);
    }
    else {
      unint64_t v9 = 0;
    }
    uint64_t v10 = 0xFFFFFFFFLL;
    BOOL v11 = (unint64_t)v4 >= v9;
    unint64_t v12 = (unint64_t)v4 - v9;
    if (v11 && !HIDWORD(v12))
    {
      BOOL v13 = (v12 + 1) > *(_DWORD *)(*(void *)(v8 + 8) + 12) || v12 == -1;
      uint64_t v10 = v12;
      if (v13) {
        uint64_t v10 = 0xFFFFFFFFLL;
      }
    }
    [v5 appendFormat:@"%@ @ 0x%llx", v6, v10];

    unint64_t Statistics = CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::GetStatistics(v4);
    [v5 appendFormat:@" { buckets = %llu, count = %llu }", HIDWORD(Statistics), Statistics];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void sub_1A7DD41CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN8CSStore2L10NameOfTypeINS_7HashMapIjNS_17_StringCacheEntryENS_16_StringFunctionsELy0EEEEEP8NSStringv_block_invoke()
{
  std::string::basic_string[abi:nn180100]<0>(&__p, "NSString *CSStore2::NameOfType() [T = CSStore2::HashMap<unsigned int, CSStore2::_StringCacheEntry, CSStore2::_StringFunctions>]_block_invoke");
  uint64_t v0 = CSStore2::_CopyNameOfTypeImpl(&__p);
  uint64_t v1 = (void *)CSStore2::NameOfType<CSStore2::HashMap<unsigned int,CSStore2::_StringCacheEntry,CSStore2::_StringFunctions,0ull>>(void)::result;
  CSStore2::NameOfType<CSStore2::HashMap<unsigned int,CSStore2::_StringCacheEntry,CSStore2::_StringFunctions,0ull>>(void)::__n128 result = v0;

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_1A7DD4248(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *___ZN8CSStore27HashMapIjNS_17_StringCacheEntryENS_16_StringFunctionsELy0EE14WriteBreakdownERKNS_5StoreEPKS3_hPh_block_invoke(uint64_t a1, unsigned int a2, size_t __len, int a4, int a5)
{
  if (a4) {
    int v5 = 64;
  }
  else {
    int v5 = -128;
  }
  return memset((void *)(*(void *)(a1 + 32) + a2), (v5 | a5 ^ 1) & 0xFFFFFFC1 | (2 * (*(unsigned char *)(a1 + 40) & 0x1F)), __len);
}

double CSStore2::getOrCopyStringFrom4CC(CSStore2 *this, CSStore2::Table **a2, unsigned int a3, int a4)
{
  *(_DWORD *)unint64_t v9 = bswap32(a3);
  char v10 = 0;
  if (a4) {
    CSStore2::String::Create((CSStore2::String *)v7, a2, (CSStore2::_StringFunctions *)v9, (const char *)4);
  }
  else {
    CSStore2::String::Find((CSStore2::String *)v7, (CSStore2::Store *)a2, (CSStore2::_StringFunctions *)v9, (const char *)4);
  }
  *(unsigned char *)this = 0;
  *((unsigned char *)this + 32) = 0;
  if (v8)
  {
    double result = *(double *)v7;
    long long v6 = v7[1];
    *(_OWORD *)this = v7[0];
    *((_OWORD *)this + 1) = v6;
    *((unsigned char *)this + 32) = 1;
  }
  return result;
}

double CSStore2::Dictionary::_CopyCanonicalKey(CSStore2::Dictionary *this, CSStore2::Table **a2, unsigned int a3, char a4)
{
  *(unsigned char *)this = 0;
  *((unsigned char *)this + 32) = 0;
  if (a4)
  {
    double result = CSStore2::getOrCopyStringFrom4CC((CSStore2 *)&v9, a2, a3, 1);
    if (v11)
    {
      double result = *(double *)&v9;
      long long v8 = v10;
      *(_OWORD *)this = v9;
      *((_OWORD *)this + 1) = v8;
      *((unsigned char *)this + 32) = 1;
    }
  }
  else
  {
    CSStore2::String::Get(&v9, (CSStore2::Store *)a2, a3);
    double result = *(double *)&v9;
    long long v6 = v10;
    *(_OWORD *)this = v9;
    *((_OWORD *)this + 1) = v6;
    char v7 = v11;
    *((unsigned char *)this + 32) = v11;
    if (v7)
    {
      CSStore2::String::retain((unsigned int *)this);
    }
  }
  return result;
}

unsigned int *CSStore2::Dictionary::_TakeOwnershipOfValue(unsigned int *this, CSStore2::Store *a2, int a3)
{
  if (a3 == 1)
  {
    uint64_t v7 = v3;
    uint64_t v8 = v4;
    this = CSStore2::String::Get(v5, (CSStore2::Store *)this, a2);
    if (v6) {
      return CSStore2::String::retain(v5);
    }
  }
  return this;
}

CSStore2::Store *CSStore2::Dictionary::_RelinquishOwnershipOfValue(CSStore2::Store *this, CSStore2::Store *a2, unsigned int a3)
{
  uint64_t v4 = this;
  switch(a3)
  {
    case 1u:
      this = (CSStore2::Store *)CSStore2::String::Get(v6, this, a2);
      if (v8) {
        this = (CSStore2::Store *)CSStore2::String::release(v6);
      }
      break;
    case 2u:
      goto LABEL_6;
    case 3u:
      CSStore2::Array::Get((CSStore2::Array *)v6, this, a2);
      if (v7)
      {
        v5[0] = MEMORY[0x1E4F143A8];
        v5[1] = 3221225472;
        v5[2] = ___ZN8CSStore210Dictionary27_RelinquishOwnershipOfValueERNS_5StoreEjh_block_invoke;
        v5[3] = &__block_descriptor_40_e17_v28__0I8r_I12_B20l;
        v5[4] = v4;
        CSStore2::Array::enumerateValues((uint64_t)v6, v5);
      }
LABEL_6:
      this = (CSStore2::Store *)CSStore2::Array::Dispose(v4, a2);
      break;
    case 4u:
      this = (CSStore2::Store *)CSStore2::Dictionary::Dispose(this, a2, a3);
      break;
    default:
      return this;
  }
  return this;
}

Unit *___ZN8CSStore210Dictionary27_RelinquishOwnershipOfValueERNS_5StoreEjh_block_invoke(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  double result = (Unit *)CSStore2::String::Get(v4, *(CSStore2::Store **)(a1 + 32), *a3);
  if (v5) {
    return CSStore2::String::release(v4);
  }
  return result;
}

Unit *CSStore2::Array::Dispose(CSStore2::Array *this, CSStore2::Store *a2)
{
  unsigned int v2 = a2;
  uint64_t v4 = (const CSStore2::Table *)*((void *)this + 33);
  if (v4
    || (double result = (Unit *)CSStore2::Store::getTable((atomic_ullong *)this, &cfstr_Array.isa),
        (uint64_t v4 = (const CSStore2::Table *)result) != 0))
  {
    double result = (Unit *)CSStore2::Store::getUnit((CSStore2 **)this, v4, v2);
    if (result)
    {
      return CSStore2::Store::freeUnit((CSStore2 **)this, v4, result);
    }
  }
  return result;
}

Unit *CSStore2::Dictionary::Dispose(const CSStore2::Table **this, CSStore2::Store *a2)
{
  unsigned int v2 = a2;
  CSStore2::Dictionary::Get((CSStore2::Dictionary *)v6, (CSStore2::Store *)this, a2);
  if (v7 && *((unsigned char *)v6[1] + 1)) {
    CSStore2::Dictionary::removeAllValues(v6);
  }
  uint64_t v4 = this[35];
  if (v4
    || (double result = (Unit *)CSStore2::Store::getTable((atomic_ullong *)this, &cfstr_Dictionary.isa),
        (uint64_t v4 = (const CSStore2::Table *)result) != 0))
  {
    double result = (Unit *)CSStore2::Store::getUnit(this, v4, v2);
    if (result) {
      return CSStore2::Store::freeUnit(this, v4, result);
    }
  }
  return result;
}

const CSStore2::Table *CSStore2::Dictionary::Get(CSStore2::Dictionary *this, CSStore2::Store *a2, unsigned int a3)
{
  *(unsigned char *)this = 0;
  *((unsigned char *)this + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  char v6 = (const CSStore2::Table *)*((void *)a2 + 35);
  if (v6
    || (double result = (const CSStore2::Table *)CSStore2::Store::getTable((atomic_ullong *)a2, &cfstr_Dictionary.isa),
        (char v6 = result) != 0))
  {
    double result = (const CSStore2::Table *)CSStore2::Store::getUnit((CSStore2 **)a2, v6, a3);
    if (result)
    {
      *((unsigned char *)this + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
      *(void *)this = a2;
      *((void *)this + 1) = (char *)result + 8;
      *((void *)this + 2) = 0;
      *((_DWORD *)this + 4) = a3;
    }
  }
  return result;
}

uint64_t CSStore2::Dictionary::removeAllValues(CSStore2::Store **this)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  _OWORD v8[2] = ___ZN8CSStore210Dictionary15removeAllValuesEv_block_invoke;
  void v8[3] = &__block_descriptor_40_e15_v24__0I8I12_B16l;
  void v8[4] = this;
  CSStore2::Dictionary::enumerateKeysAndValues((unint64_t)this, 1, v8);
  unsigned int v2 = *this;
  uint64_t v3 = *((unsigned int *)this[1] + 1);
  if (v3 != -1)
  {
    uint64_t v4 = *(void *)(*(void *)v2 + 8);
    if (*(_DWORD *)(v4 + 12) > v3)
    {
      uint64_t v5 = *(unsigned int *)(v4 + v3);
      if (v5)
      {
        char v6 = (void *)(v3 + v4 + 4);
        do
        {
          *v6++ = 0xFFFFFFFF00000000;
          --v5;
        }
        while (v5);
      }
    }
  }
  return CSStore2::Store::collectGarbage(v2, 0);
}

CSStore2::Store *___ZN8CSStore210Dictionary15removeAllValuesEv_block_invoke(uint64_t a1, unsigned int a2, CSStore2::Store *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  CSStore2::String::Get(v8, *(CSStore2::Store **)v4, a2);
  if (v9) {
    CSStore2::String::release(v8);
  }
  uint64_t v5 = *(CSStore2::Store **)v4;
  unsigned int v6 = *(unsigned __int8 *)(*(void *)(v4 + 8) + 1);

  return CSStore2::Dictionary::_RelinquishOwnershipOfValue(v5, a3, v6);
}

void CSStore2::Dictionary::enumerateKeysAndValues(unint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t k = v5;
  char v7 = *(char **)(a1 + 8);
  uint64_t v8 = *((unsigned int *)v7 + 1);
  if (v8 == -1) {
    goto LABEL_94;
  }
  unint64_t v56 = *(CSStore2::Store **)a1;
  uint64_t v9 = *(void *)(**(void **)a1 + 8);
  if (*(_DWORD *)(v9 + 12) <= v8) {
    goto LABEL_94;
  }
  long long v10 = (unsigned int *)(v9 + v8);
  char v11 = *v7;
  long long v58 = 0u;
  long long v59 = 0u;
  float v60 = 1.0;
  unint64_t v12 = *v10;
  if (!v12) {
    goto LABEL_93;
  }
  id v54 = v5;
  unint64_t v55 = v10;
  unint64_t v13 = 0;
  if (v11) {
    char v14 = a2;
  }
  else {
    char v14 = 1;
  }
  char v57 = v14;
  do
  {
    uint64_t v15 = &v10[2 * v13];
    unsigned int v18 = v15[1];
    size_t v17 = v15 + 1;
    unsigned int v16 = v18;
    if (v18 - 0x20000000 >= 0xE0000001)
    {
      uint64_t v19 = v10[2 * v13 + 2];
      unsigned int v20 = v19 + 8 * v16;
      if (!__CFADD__(v19, 8 * v16))
      {
        uint64_t v21 = *(void *)(*(void *)v56 + 8);
        unsigned int v22 = *(_DWORD *)(v21 + 12);
        if (v20 <= v22 && v22 > v19)
        {
          uint64_t v24 = 0;
          uint64_t v25 = v21 + v19;
          while (1)
          {
            uint64_t v26 = (unsigned int *)(v25 + 8 * v24);
            uint64_t v27 = v26 + 1;
            if (v26[1])
            {
              if (v57)
              {
                unint64_t v28 = *v26;
                unint64_t v29 = *((void *)&v58 + 1);
                if (*((void *)&v58 + 1))
                {
                  uint8x8_t v30 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v58 + 8));
                  v30.i16[0] = vaddlv_u8(v30);
                  if (v30.u32[0] > 1uLL)
                  {
                    a1 = *v26;
                    if (*((void *)&v58 + 1) <= v28) {
                      a1 = v28 % *((void *)&v58 + 1);
                    }
                  }
                  else
                  {
                    a1 = (DWORD2(v58) - 1) & v28;
                  }
                  uint64_t v34 = *(uint64_t ***)(v58 + 8 * a1);
                  if (v34)
                  {
                    for (unint64_t i = *v34; i; unint64_t i = (uint64_t *)*i)
                    {
                      unint64_t v36 = i[1];
                      if (v36 == v28)
                      {
                        if (*((_DWORD *)i + 4) == v28) {
                          goto LABEL_87;
                        }
                      }
                      else
                      {
                        if (v30.u32[0] > 1uLL)
                        {
                          if (v36 >= *((void *)&v58 + 1)) {
                            v36 %= *((void *)&v58 + 1);
                          }
                        }
                        else
                        {
                          v36 &= *((void *)&v58 + 1) - 1;
                        }
                        if (v36 != a1) {
                          break;
                        }
                      }
                    }
                  }
                }
                long long v37 = operator new(0x18uLL);
                *long long v37 = 0;
                v37[1] = v28;
                *((_DWORD *)v37 + 4) = *v26;
                *((_DWORD *)v37 + 5) = *v27;
                float v38 = (float)(unint64_t)(*((void *)&v59 + 1) + 1);
                if (!v29 || (float)(v60 * (float)v29) < v38)
                {
                  BOOL v39 = (v29 & (v29 - 1)) != 0;
                  if (v29 < 3) {
                    BOOL v39 = 1;
                  }
                  unint64_t v40 = v39 | (2 * v29);
                  unint64_t v41 = vcvtps_u32_f32(v38 / v60);
                  if (v40 <= v41) {
                    size_t v42 = v41;
                  }
                  else {
                    size_t v42 = v40;
                  }
                  goto LABEL_72;
                }
                goto LABEL_77;
              }
              CSStore2::String::Get(__dst, v56, *v26);
              if (v65)
              {
                long long v61 = __dst[0];
                long long v62 = __dst[1];
                char v63 = 1;
                LODWORD(__dst[0]) = 0;
                if (BYTE12(v61)) {
                  NSUInteger v31 = &v62;
                }
                else {
                  NSUInteger v31 = (long long *)v62;
                }
                if (DWORD2(v62) >= 4) {
                  size_t v32 = 4;
                }
                else {
                  size_t v32 = DWORD2(v62);
                }
                memcpy(__dst, v31, v32);
                unint64_t v28 = bswap32(__dst[0]);
                unint64_t v29 = *((void *)&v58 + 1);
                if (*((void *)&v58 + 1))
                {
                  uint8x8_t v33 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v58 + 8));
                  v33.i16[0] = vaddlv_u8(v33);
                  if (v33.u32[0] > 1uLL)
                  {
                    a1 = v28;
                    if (*((void *)&v58 + 1) <= v28) {
                      a1 = v28 % *((void *)&v58 + 1);
                    }
                  }
                  else
                  {
                    a1 = (DWORD2(v58) - 1) & v28;
                  }
                  int v43 = *(uint64_t ***)(v58 + 8 * a1);
                  if (v43)
                  {
                    for (uint64_t j = *v43; j; uint64_t j = (uint64_t *)*j)
                    {
                      unint64_t v45 = j[1];
                      if (v45 == v28)
                      {
                        if (*((_DWORD *)j + 4) == v28) {
                          goto LABEL_87;
                        }
                      }
                      else
                      {
                        if (v33.u32[0] > 1uLL)
                        {
                          if (v45 >= *((void *)&v58 + 1)) {
                            v45 %= *((void *)&v58 + 1);
                          }
                        }
                        else
                        {
                          v45 &= *((void *)&v58 + 1) - 1;
                        }
                        if (v45 != a1) {
                          break;
                        }
                      }
                    }
                  }
                }
                long long v37 = operator new(0x18uLL);
                *long long v37 = 0;
                v37[1] = v28;
                *((_DWORD *)v37 + 4) = v28;
                *((_DWORD *)v37 + 5) = *v27;
                float v46 = (float)(unint64_t)(*((void *)&v59 + 1) + 1);
                if (!v29 || (float)(v60 * (float)v29) < v46)
                {
                  BOOL v47 = (v29 & (v29 - 1)) != 0;
                  if (v29 < 3) {
                    BOOL v47 = 1;
                  }
                  unint64_t v48 = v47 | (2 * v29);
                  unint64_t v49 = vcvtps_u32_f32(v46 / v60);
                  if (v48 <= v49) {
                    size_t v42 = v49;
                  }
                  else {
                    size_t v42 = v48;
                  }
LABEL_72:
                  std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::__rehash<true>((uint64_t)&v58, v42);
                  unint64_t v29 = *((void *)&v58 + 1);
                  if ((*((void *)&v58 + 1) & (*((void *)&v58 + 1) - 1)) != 0)
                  {
                    if (*((void *)&v58 + 1) <= v28) {
                      a1 = v28 % *((void *)&v58 + 1);
                    }
                    else {
                      a1 = v28;
                    }
                  }
                  else
                  {
                    a1 = (DWORD2(v58) - 1) & v28;
                  }
                }
LABEL_77:
                uint64_t v50 = v58;
                uint64_t v51 = *(void **)(v58 + 8 * a1);
                if (v51)
                {
                  *long long v37 = *v51;
                  goto LABEL_85;
                }
                *long long v37 = v59;
                *(void *)&long long v59 = v37;
                *(void *)(v50 + 8 * a1) = &v59;
                if (*v37)
                {
                  unint64_t v52 = *(void *)(*v37 + 8);
                  if ((v29 & (v29 - 1)) != 0)
                  {
                    if (v52 >= v29) {
                      v52 %= v29;
                    }
                  }
                  else
                  {
                    v52 &= v29 - 1;
                  }
                  uint64_t v51 = (void *)(v58 + 8 * v52);
LABEL_85:
                  void *v51 = v37;
                }
                ++*((void *)&v59 + 1);
                goto LABEL_87;
              }
              LOBYTE(v61) = 0;
              char v63 = 0;
            }
LABEL_87:
            if (++v24 >= (unint64_t)*v17)
            {
              long long v10 = v55;
              unint64_t v12 = *v55;
              break;
            }
          }
        }
      }
    }
    ++v13;
  }
  while (v13 < v12);
  uint64_t v53 = (uint64_t **)v59;
  LOBYTE(__dst[0]) = 0;
  for (k = v54; v53; uint64_t v53 = (uint64_t **)*v53)
  {
    (*((void (**)(id, void, void, _OWORD *))v54 + 2))(v54, *((unsigned int *)v53 + 4), *((unsigned int *)v53 + 5), __dst);
    if (LOBYTE(__dst[0])) {
      break;
    }
  }
LABEL_93:
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)&v58);
LABEL_94:
}

void sub_1A7DD4D3C(_Unwind_Exception *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)va);

  _Unwind_Resume(a1);
}

void CSStore2::Array::getAllValues(std::vector<unsigned int> *this, uint64_t a2)
{
  this->__begin_ = 0;
  this->__end_ = 0;
  this->__end_cap_.__value_ = 0;
  p_end_cap = (std::allocator<unsigned int> *)&this->__end_cap_;
  unsigned int v5 = **(_DWORD **)(a2 + 8) & 0x1FFFFFFF;
  unsigned int v6 = *(_DWORD *)(a2 + 16);
  if (v5 >= v6) {
    int64_t v7 = v6;
  }
  else {
    int64_t v7 = v5;
  }
  if (v7)
  {
    uint64_t v9 = (unsigned int *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>(v7);
    std::vector<unsigned int>::pointer begin = this->__begin_;
    std::vector<unsigned int>::pointer end = this->__end_;
    unint64_t v12 = v9;
    while (end != begin)
    {
      unsigned int v13 = *--end;
      *--unint64_t v12 = v13;
    }
    this->__begin_ = v12;
    this->__end_ = v9;
    this->__end_cap_.__value_ = &v9[v8];
    if (begin)
    {
      operator delete(begin);
      uint64_t v9 = this->__end_;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v14 = *(void *)(a2 + 8);
  uint64_t v15 = (unsigned __int16 *)(v14 + 4);
  std::vector<unsigned int>::pointer v16 = this->__begin_;
  uint64_t v17 = v9 - this->__begin_;
  if ((*(unsigned char *)(v14 + 3) & 0x20) == 0)
  {
    if (!v7) {
      return;
    }
    if (v7 <= (uint64_t)(*(void *)p_end_cap - (void)v9) >> 2)
    {
      memmove(v9, v15, 4 * v7);
      this->__end_ = &v9[v7];
      return;
    }
    if (!((unint64_t)(v17 + v7) >> 62))
    {
      uint64_t v18 = *(void *)p_end_cap - (void)v16;
      uint64_t v19 = v18 >> 1;
      if (v18 >> 1 <= (unint64_t)(v17 + v7)) {
        uint64_t v19 = v17 + v7;
      }
      if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v20 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v20 = v19;
      }
      __v.__end_cap_.__value_ = p_end_cap;
      if (v20) {
        unint64_t v20 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>(v20);
      }
      else {
        uint64_t v21 = 0;
      }
      uint8x8_t v30 = (unsigned int *)(v20 + 4 * v17);
      __v.__first_ = (std::__split_buffer<unsigned int>::pointer)v20;
      __v.__begin_ = v30;
      __v.__end_cap_.__value_ = (unsigned int *)(v20 + 4 * v21);
      uint64_t v31 = 4 * v7;
      size_t v32 = &v30[v7];
      do
      {
        unsigned int v33 = *(_DWORD *)v15;
        v15 += 2;
        *v30++ = v33;
        v31 -= 4;
      }
      while (v31);
LABEL_43:
      __v.__end_ = v32;
      std::vector<unsigned int>::__swap_out_circular_buffer(this, &__v, v9);
      if (__v.__first_) {
        operator delete(__v.__first_);
      }
      return;
    }
    goto LABEL_46;
  }
  if (!v7) {
    return;
  }
  if (v7 > (uint64_t)(*(void *)p_end_cap - (void)v9) >> 2)
  {
    if (!((unint64_t)(v17 + v7) >> 62))
    {
      uint64_t v22 = *(void *)p_end_cap - (void)v16;
      uint64_t v23 = v22 >> 1;
      if (v22 >> 1 <= (unint64_t)(v17 + v7)) {
        uint64_t v23 = v17 + v7;
      }
      if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v24 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v24 = v23;
      }
      __v.__end_cap_.__value_ = p_end_cap;
      if (v24) {
        unint64_t v24 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>(v24);
      }
      else {
        uint64_t v25 = 0;
      }
      uint64_t v34 = (unsigned int *)(v24 + 4 * v17);
      __v.__first_ = (std::__split_buffer<unsigned int>::pointer)v24;
      __v.__begin_ = v34;
      __v.__end_cap_.__value_ = (unsigned int *)(v24 + 4 * v25);
      uint64_t v35 = 4 * v7;
      size_t v32 = &v34[v7];
      do
      {
        unsigned int v36 = *v15++;
        *v34++ = v36;
        v35 -= 4;
      }
      while (v35);
      goto LABEL_43;
    }
LABEL_46:
    abort();
  }
  uint64_t v26 = 2 * v7;
  uint64_t v27 = (unsigned __int16 *)(v14 + 4);
  unint64_t v28 = v9;
  do
  {
    unsigned int v29 = *v27++;
    *v28++ = v29;
    v26 -= 2;
  }
  while (v26);
  this->__end_ = v28;
}

void sub_1A7DD50E0(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

std::vector<unsigned int>::pointer std::vector<unsigned int>::__swap_out_circular_buffer(std::vector<unsigned int> *this, std::__split_buffer<unsigned int> *__v, std::vector<unsigned int>::pointer __p)
{
  std::vector<unsigned int>::pointer begin = __v->__begin_;
  std::vector<unsigned int>::pointer v6 = this->__begin_;
  int64_t v7 = begin;
  if (this->__begin_ != __p)
  {
    std::vector<unsigned int>::pointer v8 = __p;
    int64_t v7 = __v->__begin_;
    do
    {
      unsigned int v9 = *--v8;
      *--int64_t v7 = v9;
    }
    while (v8 != v6);
  }
  __v->__begin_ = v7;
  std::vector<unsigned int>::pointer end = this->__end_;
  std::__split_buffer<unsigned int>::pointer v11 = __v->__end_;
  int64_t v12 = (char *)end - (char *)__p;
  if (end != __p)
  {
    memmove(__v->__end_, __p, (char *)end - (char *)__p);
    int64_t v7 = __v->__begin_;
  }
  __v->__end_ = (std::__split_buffer<unsigned int>::pointer)((char *)v11 + v12);
  unsigned int v13 = this->__begin_;
  this->__begin_ = v7;
  __v->__begin_ = v13;
  uint64_t v14 = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = v14;
  value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
  return begin;
}

void CSStore2::HashMap<unsigned int,unsigned int,CSStore2::Dictionary::_Functions,0ull>::Create(_DWORD **a1, uint64_t a2, int a3, unsigned int a4, _DWORD *a5)
{
  unsigned int v9 = *(void *)(a2 + 24) + a4;
  if (v9 >= 0x2000) {
    unsigned int v10 = 0x2000;
  }
  else {
    unsigned int v10 = *(void *)(a2 + 24) + a4;
  }
  if (v10 <= 0x10) {
    uint64_t v11 = 16;
  }
  else {
    uint64_t v11 = v10;
  }
  size_t v12 = (8 * v11 + 8 * v9) | 4;
  unsigned int v13 = malloc_type_malloc(v12, 0x16D4E321uLL);
  uint64_t v14 = (_DWORD *)MEMORY[0x1E4F14838];
  *a1 = v13;
  a1[1] = v14;
  if (v13)
  {
    uint64_t v15 = v13;
    int v72 = a3;
    bzero(v13, v12);
    int v73 = v15;
    _DWORD *v15 = v11;
    std::vector<unsigned int>::pointer v16 = (void **)operator new(24 * v11);
    int v70 = v12;
    NSUInteger v71 = a5;
    uint64_t v75 = v16;
    uint64_t v77 = &v16[3 * v11];
    size_t v17 = 24 * ((24 * (unint64_t)v11 - 24) / 0x18) + 24;
    bzero(v16, v17);
    uint64_t v18 = (void **)((char *)v16 + v17);
    uint64_t v76 = v18;
    uint64_t v19 = *(uint64_t **)(a2 + 16);
    if (v19)
    {
      do
      {
        unint64_t v20 = a1;
        unsigned int v21 = **a1;
        uint64_t v22 = *((unsigned int *)v19 + 4);
        uint64_t v23 = *((unsigned int *)v19 + 5);
        unint64_t v24 = &v75[3 * ((unsigned __int16)*((_DWORD *)v19 + 4) % v21)];
        uint64_t v25 = v24 + 1;
        uint64_t v26 = (uint64_t *)v24[1];
        unint64_t v27 = (unint64_t)v24[2];
        if ((unint64_t)v26 >= v27)
        {
          uint64_t v29 = ((char *)v26 - (unsigned char *)*v24) >> 3;
          if ((unint64_t)(v29 + 1) >> 61) {
            abort();
          }
          uint64_t v30 = v27 - (void)*v24;
          uint64_t v31 = v30 >> 2;
          if (v30 >> 2 <= (unint64_t)(v29 + 1)) {
            uint64_t v31 = v29 + 1;
          }
          if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v32 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v32 = v31;
          }
          if (v32) {
            unint64_t v32 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(v32);
          }
          else {
            uint64_t v33 = 0;
          }
          uint64_t v34 = (uint64_t *)(v32 + 8 * v29);
          *uint64_t v34 = v22 | (v23 << 32);
          unint64_t v28 = v34 + 1;
          uint64_t v35 = (char *)*v25;
          unsigned int v36 = (char *)*v24;
          a1 = (_DWORD **)v20;
          if (*v25 != *v24)
          {
            do
            {
              uint64_t v37 = *((void *)v35 - 1);
              v35 -= 8;
              *--uint64_t v34 = v37;
            }
            while (v35 != v36);
            uint64_t v35 = (char *)*v24;
          }
          _DWORD *v24 = v34;
          *uint64_t v25 = v28;
          void v24[2] = (void *)(v32 + 8 * v33);
          if (v35) {
            operator delete(v35);
          }
        }
        else
        {
          *uint64_t v26 = v22 | (v23 << 32);
          unint64_t v28 = v26 + 1;
          a1 = (_DWORD **)v20;
        }
        *uint64_t v25 = v28;
        uint64_t v19 = (uint64_t *)*v19;
      }
      while (v19);
      std::vector<unsigned int>::pointer v16 = v75;
      uint64_t v18 = v76;
    }
    else
    {
      unint64_t v20 = a1;
    }
    if (v16 != v18)
    {
      unsigned int v38 = a4 % v11;
      if (a4 / v11 <= 1) {
        unsigned int v39 = 1;
      }
      else {
        unsigned int v39 = a4 / v11;
      }
      do
      {
        if (v11 <= a4)
        {
          int v40 = 0;
          unint64_t v41 = (char *)v16[1];
          do
          {
            unint64_t v42 = (unint64_t)v16[2];
            if ((unint64_t)v41 >= v42)
            {
              uint64_t v43 = (v41 - (unsigned char *)*v16) >> 3;
              if ((unint64_t)(v43 + 1) >> 61) {
                abort();
              }
              uint64_t v44 = v42 - (void)*v16;
              uint64_t v45 = v44 >> 2;
              if (v44 >> 2 <= (unint64_t)(v43 + 1)) {
                uint64_t v45 = v43 + 1;
              }
              if ((unint64_t)v44 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v46 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v46 = v45;
              }
              if (v46) {
                unint64_t v46 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(v46);
              }
              else {
                uint64_t v47 = 0;
              }
              unint64_t v48 = (char *)(v46 + 8 * v43);
              *(void *)unint64_t v48 = 0;
              unint64_t v41 = v48 + 8;
              uint64_t v50 = (char *)*v16;
              unint64_t v49 = (char *)v16[1];
              if (v49 != *v16)
              {
                do
                {
                  uint64_t v51 = *((void *)v49 - 1);
                  v49 -= 8;
                  *((void *)v48 - 1) = v51;
                  v48 -= 8;
                }
                while (v49 != v50);
                unint64_t v49 = (char *)*v16;
              }
              *std::vector<unsigned int>::pointer v16 = v48;
              v16[1] = v41;
              void v16[2] = (void *)(v46 + 8 * v47);
              if (v49) {
                operator delete(v49);
              }
            }
            else
            {
              *(void *)unint64_t v41 = 0;
              v41 += 8;
            }
            v16[1] = v41;
            ++v40;
          }
          while (v40 != v39);
        }
        if (v38)
        {
          uint64_t v53 = v16[1];
          unint64_t v52 = (unint64_t)v16[2];
          if ((unint64_t)v53 >= v52)
          {
            uint64_t v55 = ((char *)v53 - (unsigned char *)*v16) >> 3;
            if ((unint64_t)(v55 + 1) >> 61) {
              abort();
            }
            uint64_t v56 = v52 - (void)*v16;
            uint64_t v57 = v56 >> 2;
            if (v56 >> 2 <= (unint64_t)(v55 + 1)) {
              uint64_t v57 = v55 + 1;
            }
            if ((unint64_t)v56 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v58 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v58 = v57;
            }
            if (v58) {
              unint64_t v58 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(v58);
            }
            else {
              uint64_t v59 = 0;
            }
            float v60 = (void *)(v58 + 8 * v55);
            *float v60 = 0;
            id v54 = v60 + 1;
            long long v62 = (char *)*v16;
            long long v61 = (char *)v16[1];
            if (v61 != *v16)
            {
              do
              {
                uint64_t v63 = *((void *)v61 - 1);
                v61 -= 8;
                *--float v60 = v63;
              }
              while (v61 != v62);
              long long v61 = (char *)*v16;
            }
            *std::vector<unsigned int>::pointer v16 = v60;
            v16[1] = v54;
            void v16[2] = (void *)(v58 + 8 * v59);
            if (v61) {
              operator delete(v61);
            }
          }
          else
          {
            *uint64_t v53 = 0;
            id v54 = v53 + 1;
          }
          v16[1] = v54;
          --v38;
        }
        v16 += 3;
      }
      while (v16 != v18);
    }
    uint64_t v64 = 0;
    NSUInteger v65 = (NSUInteger)&v73[2 * v11 + 1];
    uint64_t v66 = (_DWORD *)*v20;
    NSUInteger v67 = (_DWORD *)(*v20 + 8);
    do
    {
      NSUInteger v68 = (NSUInteger)v75[v64];
      NSUInteger v69 = (NSUInteger)v75[v64 + 1] - v68;
      *(v67 - 1) = v69 >> 3;
      _DWORD *v67 = v65 - v66 + v72;
      if ((v69 >> 3)) {
        CSStore2::VM::Copy(v65, v68, (const void *)(8 * (v69 >> 3)));
      }
      v65 += v69 & 0x7FFFFFFF8;
      v64 += 3;
      v67 += 2;
    }
    while (3 * v11 != v64);
    long long v78 = &v75;
    std::vector<std::vector<CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::KeyValuePair,std::allocator<CSStore2::HashMap<unsigned int,unsigned int,CSStore2::_IdentifierFunctions,1ull>::KeyValuePair>>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v78);
    LODWORD(v12) = v70;
    a5 = v71;
  }
  if (a5) {
    *a5 = v12;
  }
}

void sub_1A7DD5618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  *unsigned int v13 = 0;
  MEMORY[0x1E4F14838](a13);
  _Unwind_Resume(a1);
}

uint64_t CSStore2::Dictionary::getCount(CSStore2::Dictionary *this, unsigned int a2)
{
  if (a2 == -1) {
    return 0;
  }
  uint64_t v2 = *(void *)this;
  uint64_t v3 = *(void *)(*(void *)this + 8);
  unsigned int v4 = *(_DWORD *)(v3 + 12);
  if (v4 <= a2) {
    return 0;
  }
  unsigned int v5 = (unsigned int *)(v3 + a2);
  uint64_t v6 = *v5;
  if (!v6) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v8 = 0;
  uint64_t v9 = v3 + 4;
  do
  {
    unsigned int v10 = &v5[2 * v8];
    unsigned int v11 = v10[1];
    if (v11 - 0x20000000 >= 0xE0000001)
    {
      uint64_t v12 = v10[2];
      BOOL v13 = __CFADD__(v12, 8 * v11) || v12 + 8 * v11 > *(_DWORD *)(*(void *)(v2 + 8) + 12);
      BOOL v14 = v13 || v12 == -1;
      if (!v14 && v4 > v12)
      {
        unint64_t v16 = 0;
        size_t v17 = (int *)(v9 + v12);
        LODWORD(v18) = v11;
        do
        {
          int v19 = *v17;
          v17 += 2;
          BOOL v20 = v19 == 0;
          if (v19) {
            uint64_t result = (result + 1);
          }
          else {
            uint64_t result = result;
          }
          if (v20) {
            unint64_t v18 = v18;
          }
          else {
            unint64_t v18 = v11;
          }
          ++v16;
        }
        while (v16 < v18);
      }
    }
    ++v8;
  }
  while (v8 != v6);
  return result;
}

id CSStore2::Dictionary::getDescriptionOfContents(CSStore2::Dictionary *this, unint64_t a2)
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  if (v4)
  {
    char v5 = *(unsigned char *)(*((void *)this + 1) + 1);
    if (a2 >= 7) {
      uint64_t v6 = 7;
    }
    else {
      uint64_t v6 = a2;
    }
    memset_pattern16(__b, asc_1A7DE45D0, 2 * v6 + 2);
    uint64_t v23 = (void *)[[NSString alloc] initWithCharacters:__b length:v6 + 1];
    unint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"{"];
    id v7 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v8 = (void *)[[NSString alloc] initWithFormat:@"\n%@}", v23];
    uint64_t v22 = (void *)[v7 initWithString:v8];

    unsigned int v21 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n"];
    id v9 = objc_alloc(MEMORY[0x1E4F28E48]);
    unsigned int v10 = [@"\t" stringByAppendingString:v23];
    unsigned int v11 = (void *)[v9 initWithString:v10];

    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@", "];
    uint64_t v35 = 0;
    unsigned int v36 = &v35;
    uint64_t v37 = 0x2020000000;
    int v38 = 0;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    void v25[2] = ___ZNK8CSStore210Dictionary24getDescriptionOfContentsEm_block_invoke;
    v25[3] = &unk_1E5D2A8A8;
    uint64_t v31 = &v35;
    unint64_t v32 = this;
    id v13 = v4;
    id v26 = v13;
    id v14 = v24;
    id v27 = v14;
    id v15 = v12;
    char v34 = v5;
    id v28 = v15;
    uint64_t v33 = v6;
    id v16 = v21;
    id v29 = v16;
    id v17 = v11;
    id v30 = v17;
    CSStore2::Dictionary::enumerateKeysAndValues((unint64_t)this, 1, v25);
    if (*((_DWORD *)v36 + 6))
    {
      [v13 appendAttributedString:v22];
    }
    else
    {
      int v19 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"{ }"];
      [v13 appendAttributedString:v19];
    }
    unint64_t v18 = (void *)[v13 copy];

    _Block_object_dispose(&v35, 8);
  }
  else
  {
    unint64_t v18 = 0;
  }

  return v18;
}

void sub_1A7DD5A20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20,void *a21,void *a22,void *a23)
{
  _Block_object_dispose((const void *)(v27 - 136), 8);
  _Unwind_Resume(a1);
}

void ___ZNK8CSStore210Dictionary24getDescriptionOfContentsEm_block_invoke(uint64_t a1, unsigned int a2, unsigned int a3)
{
  v39[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *(CSStore2::Store ***)(a1 + 80);
  id v7 = (void *)MEMORY[0x1AD0DB160]();
  uint64_t v8 = 48;
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) {
    uint64_t v8 = 40;
  }
  [*(id *)(a1 + 32) appendAttributedString:*(void *)(a1 + v8)];
  CSStore2::String::Get(v36, *v6, a2);
  if (v37)
  {
    id v9 = CSStore2::String::getNSStringNoCopy((CSStore2::String *)v36);
    switch(*(unsigned char *)(a1 + 96))
    {
      case 1:
        CSStore2::String::Get(v33, *v6, a3);
        if (!v35) {
          goto LABEL_14;
        }
        id v10 = [NSString alloc];
        unsigned int v11 = CSStore2::String::getNSStringNoCopy((CSStore2::String *)v33);
        uint64_t v12 = (void *)[v10 initWithFormat:@"\"%@\"", v11];

        break;
      case 2:
        CSStore2::Array::Get((CSStore2::Array *)v33, *v6, a3);
        if (!v34) {
          goto LABEL_14;
        }
        id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        void v28[2] = ___ZNK8CSStore210Dictionary24getDescriptionOfContentsEm_block_invoke_3;
        v28[3] = &unk_1E5D2A880;
        id v14 = v13;
        id v29 = v14;
        CSStore2::Array::enumerateValues((uint64_t)v33, v28);
        id v15 = [NSString alloc];
        id v16 = [v14 componentsJoinedByString:@", "];
        uint64_t v12 = (void *)[v15 initWithFormat:@"[ %@ ]", v16];

        break;
      case 3:
        CSStore2::Array::Get((CSStore2::Array *)v33, *v6, a3);
        if (!v34) {
          goto LABEL_14;
        }
        id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        void v30[2] = ___ZNK8CSStore210Dictionary24getDescriptionOfContentsEm_block_invoke_2;
        v30[3] = &unk_1E5D2A858;
        unint64_t v32 = v6;
        id v18 = v17;
        id v31 = v18;
        CSStore2::Array::enumerateValues((uint64_t)v33, v30);
        id v19 = [NSString alloc];
        BOOL v20 = [v18 componentsJoinedByString:@", "];
        uint64_t v12 = (void *)[v19 initWithFormat:@"[ %@ ]", v20];

        break;
      case 4:
        CSStore2::Dictionary::Get((CSStore2::Dictionary *)v33, *v6, a3);
        if (!v34) {
          goto LABEL_14;
        }
        unsigned int v21 = CSStore2::Dictionary::getDescriptionOfContents((CSStore2::Dictionary *)v33, *(void *)(a1 + 88) + 1);
        uint64_t v12 = [v21 string];

        break;
      default:
        goto LABEL_14;
    }
    if (!v12) {
LABEL_14:
    }
      uint64_t v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"0x%llx", a3);
    [*(id *)(a1 + 32) appendAttributedString:*(void *)(a1 + 56)];
    [*(id *)(a1 + 32) appendAttributedString:*(void *)(a1 + 64)];
    uint64_t v22 = (void *)[[NSString alloc] initWithFormat:@"\"%@\"", v9];

    id v23 = objc_alloc(MEMORY[0x1E4F28B18]);
    int v38 = @"_CSVFWeight";
    v39[0] = &unk_1EFE43AC8;
    unint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
    uint64_t v25 = (void *)[v23 initWithString:v22 attributes:v24];

    [*(id *)(a1 + 32) appendAttributedString:v25];
    id v26 = (void *)[[NSString alloc] initWithFormat:@":%C%@", 160, v12];

    uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v26];
    [*(id *)(a1 + 32) appendAttributedString:v27];
  }
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
}

void sub_1A7DD5F70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZNK8CSStore210Dictionary24getDescriptionOfContentsEm_block_invoke_2(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  CSStore2::String::Get(v8, **(CSStore2::Store ***)(a1 + 40), *a3);
  if (v9)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [NSString alloc];
    uint64_t v6 = CSStore2::String::getNSStringNoCopy((CSStore2::String *)v8);
    id v7 = (void *)[v5 initWithFormat:@"\"%@\"", v6];
    [v4 addObject:v7];
  }
}

void sub_1A7DD6100(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZNK8CSStore210Dictionary24getDescriptionOfContentsEm_block_invoke_3(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = (id)objc_msgSend([NSString alloc], "initWithFormat:", @"0x%llx", *a3);
  objc_msgSend(v3, "addObject:");
}

void sub_1A7DD618C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void *___ZN8CSStore27HashMapIjjNS_10Dictionary10_FunctionsELy0EE14WriteBreakdownERKNS_5StoreEPKS3_hPh_block_invoke(uint64_t a1, unsigned int a2, size_t __len, int a4, int a5)
{
  if (a4) {
    int v5 = 64;
  }
  else {
    int v5 = -128;
  }
  return memset((void *)(*(void *)(a1 + 32) + a2), (v5 | a5 ^ 1) & 0xFFFFFFC1 | (2 * (*(unsigned char *)(a1 + 40) & 0x1F)), __len);
}

_DWORD *CSStore2::HashMap<unsigned int,unsigned int,CSStore2::Dictionary::_Functions,0ull>::Find(CSStore2 *a1, int *a2, int a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (*a2) {
    BOOL v3 = a3 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3) {
    return 0;
  }
  if (*a2 > 0x2000)
  {
    id v15 = CSStore2::GetLog(a1);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v23 = *a2;
      v24[0] = 67109376;
      v24[1] = v23;
      __int16 v25 = 1024;
      int v26 = 0x2000;
      _os_log_error_impl(&dword_1A7DB2000, v15, OS_LOG_TYPE_ERROR, "Impossible bucket count %u when %u is the maximum.", (uint8_t *)v24, 0xEu);
    }

    return 0;
  }
  uint64_t v5 = (unsigned __int16)a3 % (unsigned __int16)*a2;
  uint64_t v6 = a2[2 * v5 + 1];
  if (!v6) {
    return 0;
  }
  id v7 = &a2[2 * v5];
  if (v6 == 1)
  {
    uint64_t v8 = v7[2];
    if (v8 != -1)
    {
      uint64_t v9 = *((void *)a1 + 1);
      if (*(_DWORD *)(v9 + 12) > v8 && v9 != 0)
      {
        unsigned int v11 = (int *)(v9 + v8);
        int v13 = *v11;
        uint64_t v12 = v11 + 1;
        if (v13 == a3) {
          return v12;
        }
        else {
          return 0;
        }
      }
    }
    return 0;
  }
  uint64_t v16 = v7[2];
  if (v16 == -1)
  {
    BOOL v20 = 0;
  }
  else
  {
    uint64_t v17 = *((void *)a1 + 1);
    unsigned int v18 = *(_DWORD *)(v17 + 12);
    id v19 = (_DWORD *)(v17 + v16);
    if (v18 <= v16) {
      BOOL v20 = 0;
    }
    else {
      BOOL v20 = v19;
    }
  }
  uint64_t v21 = 8 * v6;
  uint64_t v22 = &v20[2 * v6];
  while (*v20 != a3)
  {
    v20 += 2;
    v21 -= 8;
    if (!v21)
    {
      BOOL v20 = v22;
      break;
    }
  }
  if (v20 == v22) {
    return 0;
  }
  else {
    return v20 + 1;
  }
}

unsigned int *_CSStringRetain(uint64_t a1, unsigned int a2)
{
  if (performMutatingAssertions)
  {
    uint64_t v4 = *(void *)(a1 + 344);
    if (v4) {
      (***(void (****)(void))(v4 + 8))(*(void *)(v4 + 8));
    }
  }
  uint64_t result = CSStore2::String::Get(v6, (CSStore2::Store *)(a1 + 8), a2);
  if (v7) {
    return CSStore2::String::retain(v6);
  }
  return result;
}

Unit *_CSStringRelease(uint64_t a1, unsigned int a2)
{
  if (performMutatingAssertions)
  {
    uint64_t v4 = *(void *)(a1 + 344);
    if (v4) {
      (***(void (****)(void))(v4 + 8))(*(void *)(v4 + 8));
    }
  }
  uint64_t result = (Unit *)CSStore2::String::Get(v6, (CSStore2::Store *)(a1 + 8), a2);
  if (v7) {
    return CSStore2::String::release(v6);
  }
  return result;
}

uint64_t _CSStringIsValid(uint64_t a1, unsigned int a2)
{
  if (performConstantAssertions)
  {
    uint64_t v4 = *(void *)(a1 + 344);
    if (v4) {
      (*(void (**)(void))(**(void **)(v4 + 8) + 8))(*(void *)(v4 + 8));
    }
  }
  CSStore2::String::Get(v6, (CSStore2::Store *)(a1 + 8), a2);
  return v7;
}

CSStore2 *_CSStringMakeConst(uint64_t a1, unsigned int a2)
{
  if (performMutatingAssertions)
  {
    uint64_t v4 = *(void *)(a1 + 344);
    if (v4) {
      (***(void (****)(void))(v4 + 8))(*(void *)(v4 + 8));
    }
  }
  uint64_t result = (CSStore2 *)CSStore2::String::Get(v6, (CSStore2::Store *)(a1 + 8), a2);
  if (v7) {
    return CSStore2::String::setRetainCount((uint64_t)v6, 0, 0);
  }
  return result;
}

uint64_t _CSStringCopyLowercase(uint64_t a1, unsigned int a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (performMutatingAssertions)
  {
    uint64_t v4 = *(void *)(a1 + 344);
    if (v4) {
      (***(void (****)(void))(v4 + 8))(*(void *)(v4 + 8));
    }
  }
  uint64_t v5 = CSStore2::String::Get(v14, (CSStore2::Store *)(a1 + 8), a2);
  if (!v15) {
    return 0;
  }
  uint64_t v6 = (void *)MEMORY[0x1AD0DB160](v5);
  char v7 = CSStore2::String::getNSStringNoCopy((CSStore2::String *)v14);
  uint64_t v8 = [v7 lowercaseString];

  UTF8BufferFromNSString = (char *)CSStore2::String::GetUTF8BufferFromNSString(v8, (uint64_t)v16);
  id v10 = (const char *)strlen(UTF8BufferFromNSString);
  CSStore2::String::Create((CSStore2::String *)v12, *(CSStore2::Table ***)&v14[0], (CSStore2::_StringFunctions *)UTF8BufferFromNSString, v10);

  char v15 = v13;
  v14[0] = v12[0];
  v14[1] = v12[1];
  if (v13) {
    return DWORD2(v14[0]);
  }
  else {
    return 0;
  }
}

void sub_1A7DD66C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _CSStringGetLowercase(uint64_t a1, unsigned int a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (performConstantAssertions)
  {
    uint64_t v4 = *(void *)(a1 + 344);
    if (v4) {
      (*(void (**)(void))(**(void **)(v4 + 8) + 8))(*(void *)(v4 + 8));
    }
  }
  uint64_t v5 = CSStore2::String::Get(v19, (CSStore2::Store *)(a1 + 8), a2);
  if (!v20) {
    return 0;
  }
  v14[0] = v19[0];
  v14[1] = v19[1];
  char v15 = 1;
  uint64_t v6 = (void *)MEMORY[0x1AD0DB160](v5);
  char v7 = CSStore2::String::getNSStringNoCopy((CSStore2::String *)v14);
  uint64_t v8 = [v7 lowercaseString];

  UTF8BufferFromNSString = (char *)CSStore2::String::GetUTF8BufferFromNSString(v8, (uint64_t)v19);
  id v10 = (const char *)strlen(UTF8BufferFromNSString);
  CSStore2::String::Find((CSStore2::String *)v16, *(CSStore2::Store **)&v14[0], (CSStore2::_StringFunctions *)UTF8BufferFromNSString, v10);
  BOOL v11 = v18 == 0;
  unsigned int v12 = v17;

  if (v11) {
    return 0;
  }
  else {
    return v12;
  }
}

void sub_1A7DD683C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _CSStringCopyUppercase(uint64_t a1, unsigned int a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (performMutatingAssertions)
  {
    uint64_t v4 = *(void *)(a1 + 344);
    if (v4) {
      (***(void (****)(void))(v4 + 8))(*(void *)(v4 + 8));
    }
  }
  uint64_t v5 = CSStore2::String::Get(v14, (CSStore2::Store *)(a1 + 8), a2);
  if (!v15) {
    return 0;
  }
  uint64_t v6 = (void *)MEMORY[0x1AD0DB160](v5);
  char v7 = CSStore2::String::getNSStringNoCopy((CSStore2::String *)v14);
  uint64_t v8 = [v7 uppercaseString];

  UTF8BufferFromNSString = (char *)CSStore2::String::GetUTF8BufferFromNSString(v8, (uint64_t)v16);
  id v10 = (const char *)strlen(UTF8BufferFromNSString);
  CSStore2::String::Create((CSStore2::String *)v12, *(CSStore2::Table ***)&v14[0], (CSStore2::_StringFunctions *)UTF8BufferFromNSString, v10);

  char v15 = v13;
  v14[0] = v12[0];
  v14[1] = v12[1];
  if (v13) {
    return DWORD2(v14[0]);
  }
  else {
    return 0;
  }
}

void sub_1A7DD69A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _CSStringGetUppercase(uint64_t a1, unsigned int a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (performConstantAssertions)
  {
    uint64_t v4 = *(void *)(a1 + 344);
    if (v4) {
      (*(void (**)(void))(**(void **)(v4 + 8) + 8))(*(void *)(v4 + 8));
    }
  }
  uint64_t v5 = CSStore2::String::Get(v15, (CSStore2::Store *)(a1 + 8), a2);
  if (!v16) {
    return 0;
  }
  v12[0] = v15[0];
  v12[1] = v15[1];
  char v13 = 1;
  uint64_t v6 = (void *)MEMORY[0x1AD0DB160](v5);
  char v7 = CSStore2::String::getNSStringNoCopy((CSStore2::String *)v12);
  uint64_t v8 = [v7 uppercaseString];

  UTF8BufferFromNSString = (char *)CSStore2::String::GetUTF8BufferFromNSString(v8, (uint64_t)v15);
  id v10 = (const char *)strlen(UTF8BufferFromNSString);
  CSStore2::String::Find((CSStore2::String *)v14, *(CSStore2::Store **)&v12[0], (CSStore2::_StringFunctions *)UTF8BufferFromNSString, v10);
  LODWORD(UTF8BufferFromNSString) = v14[32] == 0;

  if (UTF8BufferFromNSString) {
    return 0;
  }
  else {
    return DWORD2(v12[0]);
  }
}

void sub_1A7DD6B20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _CSGetConstStringForCharacters(uint64_t a1, CSStore2::_StringFunctions *a2, const char *a3)
{
  if (performMutatingAssertions)
  {
    uint64_t v6 = *(void *)(a1 + 344);
    if (v6) {
      (***(void (****)(void))(v6 + 8))(*(void *)(v6 + 8));
    }
  }
  CSStore2::String::Create((CSStore2::String *)v8, (CSStore2::Table **)(a1 + 8), a2, a3);
  if (!v10) {
    return 0;
  }
  CSStore2::String::setRetainCount((uint64_t)v8, 0, 0);
  return v9;
}

uint64_t _CSGetStringForCFString(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  UTF8BufferFromNSString = (char *)CSStore2::String::GetUTF8BufferFromNSString(a2, (uint64_t)v6);
  uint64_t v4 = (const char *)strlen(UTF8BufferFromNSString);
  return _CSGetStringForCharacters(a1, (CSStore2::_StringFunctions *)UTF8BufferFromNSString, v4);
}

uint64_t _CSCopyStringForCharacters(uint64_t a1, CSStore2::_StringFunctions *a2, const char *a3)
{
  if (performMutatingAssertions)
  {
    uint64_t v6 = *(void *)(a1 + 344);
    if (v6) {
      (***(void (****)(void))(v6 + 8))(*(void *)(v6 + 8));
    }
  }
  CSStore2::String::Create((CSStore2::String *)v8, (CSStore2::Table **)(a1 + 8), a2, a3);
  if (v10) {
    return v9;
  }
  else {
    return 0;
  }
}

uint64_t _CSStringGetUnitFromID(uint64_t a1, unsigned int a2)
{
  if (performConstantAssertions)
  {
    uint64_t v4 = *(void *)(a1 + 344);
    if (v4) {
      (*(void (**)(void))(**(void **)(v4 + 8) + 8))(*(void *)(v4 + 8));
    }
  }
  CSStore2::String::Get(v6, (CSStore2::Store *)(a1 + 8), a2);
  if (!v8) {
    return 0;
  }
  if (v7) {
    return 0;
  }
  return v6[2];
}

void CSStore2::Writer::logFunctionCall(CSStore2 *a1, CSStore2 *a2, CSStore2 *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (CSStore2::getLog(void)::once != -1) {
    dispatch_once(&CSStore2::getLog(void)::once, &__block_literal_global_455);
  }
  unsigned int v12 = (FILE *)CSStore2::getLog(void)::result;
  os_unfair_lock_lock(&CSStore2::logLock);
  CSStore2::getFunctionName(a1, v13);
  id v14 = objc_claimAutoreleasedReturnValue();
  fprintf(v12, "%s\n", (const char *)[v14 UTF8String]);
  CSStore2::getFunctionName(a2, v15);
  id v16 = objc_claimAutoreleasedReturnValue();
  fprintf(v12, "\t%s\n", (const char *)[v16 UTF8String]);
  CSStore2::getFunctionName(a3, v17);
  id v18 = objc_claimAutoreleasedReturnValue();
  fprintf(v12, "\t\t%s(", (const char *)[v18 UTF8String]);
  uint64_t v19 = 0;
  do
  {
    if (v19) {
      fputs(", ", v12);
    }
    char v20 = (const char *)a4;
    if (*(char *)(a4 + 23) < 0) {
      char v20 = *(const char **)a4;
    }
    fputs(v20, v12);
    ++v19;
    a4 += 24;
  }
  while (a5 != v19);
  fputs(")\n", v12);
  if (*(char *)(a6 + 23) >= 0) {
    uint64_t v21 = (const char *)a6;
  }
  else {
    uint64_t v21 = *(const char **)a6;
  }
  fprintf(v12, "\t\t\t%s\n", v21);
  fflush(v12);

  os_unfair_lock_unlock(&CSStore2::logLock);
}

void sub_1A7DD6F68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id CSStore2::getFunctionName(CSStore2 *this, const void *a2)
{
  if (CSStore2::getFunctionName(void const*)::once != -1) {
    dispatch_once(&CSStore2::getFunctionName(void const*)::once, &__block_literal_global_13);
  }
  if (CSStore2::getFunctionName(void const*)::symbolicate)
  {
    BOOL v3 = CSStore2::NameOfSymbol(this, a2);
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

void ___ZN8CSStore2L15getFunctionNameEPKv_block_invoke()
{
  CSStore2::getFunctionName(void const*)::symbolicate = 1;
  uint64_t v0 = getenv("CS_SYMBOLICATE_IO_CALLERS");
  if (v0)
  {
    id v1 = [NSString stringWithUTF8String:v0];
    CSStore2::getFunctionName(void const*)::symbolicate = [v1 BOOLValue];
  }
}

void sub_1A7DD7098(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZN8CSStore2L6getLogEv_block_invoke_465()
{
  if (!CSStore2::getLog(void)::result)
  {
    uint64_t v0 = NSTemporaryDirectory();
    id v1 = NSString;
    pid_t v2 = getpid();
    BOOL v3 = objc_msgSend(v1, "stringWithFormat:", @"csstore-writer-%llu-%llu.log", v2, _CFGetEUID());
    id v4 = [v0 stringByAppendingPathComponent:v3];
    uint64_t v5 = (const char *)[v4 fileSystemRepresentation];

    CSStore2::getLog(void)::uint64_t result = (uint64_t)fopen(v5, "wb+");
  }
}

void sub_1A7DD7170(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::__shared_weak_count::__release_shared[abi:nn180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void sub_1A7DD72B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7DD7388(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void CSStore2::CSStoreSharedReadingAccessContext::~CSStoreSharedReadingAccessContext(CSStore2::CSStoreSharedReadingAccessContext *this)
{
  CSStore2::CSStoreSharedReadingAccessContext::~CSStoreSharedReadingAccessContext(this);

  JUMPOUT(0x1AD0DACB0);
}

{
  char *v1;
  void *v2;
  void *v3;

  *(void *)this = &unk_1EFE40918;
  id v1 = (char *)this + 16;
  if (*((void *)this + 5))
  {
    pid_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    BOOL v3 = [NSString stringWithUTF8String:"virtual CSStore2::CSStoreSharedReadingAccessContext::~CSStoreSharedReadingAccessContext()"];
    [v2 handleFailureInFunction:v3 file:@"CSStoreAccessContextPrivInternal.h" lineNumber:226 description:@"Destroying shared reading access context with active readers!"];
  }
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table((uint64_t)v1);
}

void sub_1A7DD7488(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned int>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned int>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned int>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

uint64_t CSStore2::CSStoreAccessContextInterface::active(CSStore2::CSStoreAccessContextInterface *this)
{
  return 1;
}

uint64_t CSStore2::CSStoreSharedReadingAccessContext::copyDescription(CSStore2::CSStoreSharedReadingAccessContext *this)
{
  return objc_msgSend([NSString alloc], "initWithFormat:", @"<CSStoreSharedReadingAccessContext: %p>", this);
}

void CSStore2::CSStoreSharedReadingAccessContext::accessForWriting()
{
  id v1 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v0 = [NSString stringWithUTF8String:"virtual void CSStore2::CSStoreSharedReadingAccessContext::accessForWriting(void (^ _Nonnull __strong)())"];
  [v1 handleFailureInFunction:v0 file:@"CSStoreAccessContextPrivInternal.h" lineNumber:216 description:@"context cannot be held for writing"];
}

void sub_1A7DD7590(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void CSStore2::CSStoreSharedReadingAccessContext::assertHeldForReading(os_unfair_lock_s *this)
{
  pid_t v2 = this + 2;
  os_unfair_lock_lock(this + 2);
  pthread_t v3 = pthread_self();
  int8x8_t v4 = *(int8x8_t *)&this[6]._os_unfair_lock_opaque;
  if (v4)
  {
    unint64_t v5 = 0x9DDFEA08EB382D69 * (((8 * v3) + 8) ^ ((unint64_t)v3 >> 32));
    unint64_t v6 = 0x9DDFEA08EB382D69 * (((unint64_t)v3 >> 32) ^ (v5 >> 47) ^ v5);
    unint64_t v7 = 0x9DDFEA08EB382D69 * (v6 ^ (v6 >> 47));
    uint8x8_t v8 = (uint8x8_t)vcnt_s8(v4);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v9 = v7;
      if (v7 >= *(void *)&v4) {
        unint64_t v9 = v7 % *(void *)&v4;
      }
    }
    else
    {
      unint64_t v9 = v7 & (*(void *)&v4 - 1);
    }
    char v10 = *(void **)(*(void *)&this[4]._os_unfair_lock_opaque + 8 * v9);
    if (v10)
    {
      for (unint64_t i = (void *)*v10; i; unint64_t i = (void *)*i)
      {
        unint64_t v12 = i[1];
        if (v7 == v12)
        {
          if ((pthread_t)i[2] == v3) {
            goto LABEL_18;
          }
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v12 >= *(void *)&v4) {
              v12 %= *(void *)&v4;
            }
          }
          else
          {
            v12 &= *(void *)&v4 - 1;
          }
          if (v12 != v9) {
            break;
          }
        }
      }
    }
  }
  char v13 = [MEMORY[0x1E4F28B00] currentHandler];
  id v14 = [NSString stringWithUTF8String:"virtual void CSStore2::CSStoreSharedReadingAccessContext::assertHeldForReading() const"];
  [v13 handleFailureInFunction:v14 file:@"CSStoreAccessContextPrivInternal.h" lineNumber:191 description:@"context not held for reading"];

LABEL_18:

  os_unfair_lock_unlock(v2);
}

void sub_1A7DD7730(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void CSStore2::CSStoreSharedReadingAccessContext::assertHeldForWriting(CSStore2::CSStoreSharedReadingAccessContext *this)
{
  id v2 = [MEMORY[0x1E4F28B00] currentHandler];
  id v1 = [NSString stringWithUTF8String:"virtual void CSStore2::CSStoreSharedReadingAccessContext::assertHeldForWriting() const"];
  [v2 handleFailureInFunction:v1 file:@"CSStoreAccessContextPrivInternal.h" lineNumber:196 description:@"context cannot be held for writing"];
}

void sub_1A7DD77D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t std::__shared_ptr_emplace<CSStore2::CSStoreSharedReadingAccessContext>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 24) + 48))();
}

void std::__shared_ptr_emplace<CSStore2::CSStoreSharedReadingAccessContext>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EFE40A10;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1AD0DACB0);
}

void std::__shared_ptr_emplace<CSStore2::CSStoreSharedReadingAccessContext>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EFE40A10;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void CSStore2::CSStoreQueueAccessContext::~CSStoreQueueAccessContext(id *this)
{
  JUMPOUT(0x1AD0DACB0);
}

{
}

uint64_t CSStore2::CSStoreQueueAccessContext::copyDescription(CSStore2::CSStoreQueueAccessContext *this)
{
  return [[NSString alloc] initWithFormat:@"<CSStoreQueueAccessContext: %@>", *((void *)this + 1)];
}

void CSStore2::CSStoreQueueAccessContext::accessForWriting(uint64_t a1, void *a2)
{
}

void CSStore2::CSStoreQueueAccessContext::accessForReading(uint64_t a1, void *a2)
{
}

void CSStore2::CSStoreQueueAccessContext::assertHeldForReading(dispatch_queue_t *this)
{
}

void CSStore2::CSStoreQueueAccessContext::assertHeldForWriting(dispatch_queue_t *this)
{
}

uint64_t std::__shared_ptr_emplace<CSStore2::CSStoreQueueAccessContext>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 24) + 48))();
}

void std::__shared_ptr_emplace<CSStore2::CSStoreQueueAccessContext>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EFE40968;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1AD0DACB0);
}

void std::__shared_ptr_emplace<CSStore2::CSStoreQueueAccessContext>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EFE40968;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void CSStore2::CSStoreDebugQueueAccessContext::~CSStoreDebugQueueAccessContext(id *this)
{
  JUMPOUT(0x1AD0DACB0);
}

{
}

uint64_t CSStore2::CSStoreDebugQueueAccessContext::copyDescription(CSStore2::CSStoreDebugQueueAccessContext *this)
{
  return [[NSString alloc] initWithFormat:@"<CSStoreDebugQueueAccessContext: %@, queueAssert: %p, queueAssertBarrier: %p>", *((void *)this + 1), *((void *)this + 2), *((void *)this + 3)];
}

uint64_t CSStore2::CSStoreDebugQueueAccessContext::assertHeldForReading(CSStore2::CSStoreDebugQueueAccessContext *this)
{
  return (*((uint64_t (**)(void))this + 2))(*((void *)this + 1));
}

uint64_t CSStore2::CSStoreDebugQueueAccessContext::assertHeldForWriting(CSStore2::CSStoreDebugQueueAccessContext *this)
{
  return (*((uint64_t (**)(void))this + 3))(*((void *)this + 1));
}

uint64_t std::__shared_ptr_emplace<CSStore2::CSStoreDebugQueueAccessContext>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 24) + 48))();
}

void std::__shared_ptr_emplace<CSStore2::CSStoreDebugQueueAccessContext>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EFE409A0;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1AD0DACB0);
}

void std::__shared_ptr_emplace<CSStore2::CSStoreDebugQueueAccessContext>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EFE409A0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void CSStore2::CSStoreUnfairLockAccessContext::~CSStoreUnfairLockAccessContext(CSStore2::CSStoreUnfairLockAccessContext *this)
{
}

uint64_t CSStore2::CSStoreUnfairLockAccessContext::copyDescription(CSStore2::CSStoreUnfairLockAccessContext *this)
{
  return objc_msgSend([NSString alloc], "initWithFormat:", @"<CSStoreUnfairLockAccessContext: %p writeOK: %d>", *((void *)this + 1), *((unsigned __int8 *)this + 16));
}

void CSStore2::CSStoreUnfairLockAccessContext::accessForWriting(uint64_t a1, void *a2)
{
  unint64_t v5 = a2;
  if (!*(unsigned char *)(a1 + 16))
  {
    pthread_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    int8x8_t v4 = [NSString stringWithUTF8String:"virtual void CSStore2::CSStoreUnfairLockAccessContext::accessForWriting(void (^ _Nonnull __strong)())"];
    [v3 handleFailureInFunction:v4 file:@"CSStoreAccessContextPrivInternal.h" lineNumber:159 description:@"context cannot be held for writing"];
  }
  os_unfair_lock_assert_not_owner(*(const os_unfair_lock **)(a1 + 8));
  os_unfair_lock_lock(*(os_unfair_lock_t *)(a1 + 8));
  v5[2]();
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(a1 + 8));
}

void sub_1A7DD7CC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void CSStore2::CSStoreUnfairLockAccessContext::accessForReading(uint64_t a1, void *a2)
{
  pthread_t v3 = a2;
  os_unfair_lock_assert_not_owner(*(const os_unfair_lock **)(a1 + 8));
  os_unfair_lock_lock(*(os_unfair_lock_t *)(a1 + 8));
  v3[2]();
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(a1 + 8));
}

void sub_1A7DD7D5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void CSStore2::CSStoreUnfairLockAccessContext::assertHeldForReading(const os_unfair_lock **this)
{
}

void CSStore2::CSStoreUnfairLockAccessContext::assertHeldForWriting(CSStore2::CSStoreUnfairLockAccessContext *this)
{
  if (!*((unsigned char *)this + 16))
  {
    pthread_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    int8x8_t v4 = [NSString stringWithUTF8String:"virtual void CSStore2::CSStoreUnfairLockAccessContext::assertHeldForWriting() const"];
    [v3 handleFailureInFunction:v4 file:@"CSStoreAccessContextPrivInternal.h" lineNumber:146 description:@"context cannot be held for writing"];
  }
  id v2 = (const os_unfair_lock *)*((void *)this + 1);

  os_unfair_lock_assert_owner(v2);
}

void sub_1A7DD7E18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t std::__shared_ptr_emplace<CSStore2::CSStoreUnfairLockAccessContext>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 24) + 48))();
}

void std::__shared_ptr_emplace<CSStore2::CSStoreUnfairLockAccessContext>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EFE409D8;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1AD0DACB0);
}

void std::__shared_ptr_emplace<CSStore2::CSStoreUnfairLockAccessContext>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EFE409D8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

_CSStoreAccessContext *_CSStoreAccessContextCreateWithQueue(void *a1)
{
  id v1 = a1;
  id v2 = [_CSStoreAccessContext alloc];
  id v3 = v1;
  if (v2)
  {
    v8.receiver = v2;
    v8.super_class = (Class)_CSStoreAccessContext;
    id v2 = (_CSStoreAccessContext *)objc_msgSendSuper2(&v8, sel_init);
    if (v2)
    {
      int8x8_t v4 = operator new(0x28uLL);
      v4[1] = 0;
      v4[2] = 0;
      void *v4 = &unk_1EFE40968;
      id v5 = v3;
      v4[3] = &unk_1EFE40828;
      Unit v4[4] = v5;
      cntrl = (std::__shared_weak_count *)v2->_impl.__cntrl_;
      v2->_impl.__ptr_ = (CSStoreAccessContextInterface *)(v4 + 3);
      v2->_impl.__cntrl_ = (__shared_weak_count *)v4;
      if (cntrl) {
        std::__shared_weak_count::__release_shared[abi:nn180100](cntrl);
      }
    }
  }

  return v2;
}

void sub_1A7DD7FB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

_CSStoreAccessContext *_CSStoreAccessContextCreateWithQueueAndAssertionFunctions(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  unint64_t v6 = [_CSStoreAccessContext alloc];
  id v7 = v5;
  if (v6)
  {
    v12.receiver = v6;
    v12.super_class = (Class)_CSStoreAccessContext;
    unint64_t v6 = (_CSStoreAccessContext *)objc_msgSendSuper2(&v12, sel_init);
    if (v6)
    {
      objc_super v8 = operator new(0x38uLL);
      v8[1] = 0;
      _OWORD v8[2] = 0;
      void *v8 = &unk_1EFE409A0;
      id v9 = v7;
      void v8[3] = &unk_1EFE40878;
      Unit v8[4] = v9;
      void v8[5] = a2;
      void v8[6] = a3;
      cntrl = (std::__shared_weak_count *)v6->_impl.__cntrl_;
      v6->_impl.__ptr_ = (CSStoreAccessContextInterface *)(v8 + 3);
      v6->_impl.__cntrl_ = (__shared_weak_count *)v8;
      if (cntrl) {
        std::__shared_weak_count::__release_shared[abi:nn180100](cntrl);
      }
    }
  }

  return v6;
}

void sub_1A7DD80CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _CSStoreAccessContextCreateWithLock(uint64_t a1, int a2)
{
  int8x8_t v4 = [_CSStoreAccessContext alloc];
  BOOL v5 = a2 != 0;
  if (!v4) {
    return 0;
  }
  v10.receiver = v4;
  v10.super_class = (Class)_CSStoreAccessContext;
  id v6 = objc_msgSendSuper2(&v10, sel_init);
  if (v6)
  {
    id v7 = operator new(0x30uLL);
    v7[1] = 0;
    _OWORD v7[2] = 0;
    void *v7 = &unk_1EFE409D8;
    long long v7[3] = &unk_1EFE408C8;
    void v7[4] = a1;
    *((unsigned char *)v7 + 40) = v5;
    objc_super v8 = (std::__shared_weak_count *)*((void *)v6 + 2);
    *((void *)v6 + 1) = v7 + 3;
    *((void *)v6 + 2) = v7;
    if (v8) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v8);
    }
  }
  return v6;
}

void sub_1A7DD81D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _CSStoreAccessContextCreateSharedReadingContext()
{
  uint64_t v0 = [_CSStoreAccessContext alloc];

  return (uint64_t)[(_CSStoreAccessContext *)v0 initForSharedReading];
}

uint64_t _CSStoreAccessContextAssertReading(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 8) + 8))();
}

uint64_t _CSStoreAccessContextAssertWriting(uint64_t a1)
{
  return (***(uint64_t (****)(void))(a1 + 8))(*(void *)(a1 + 8));
}

void ___ZL13GetContextLogv_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.coreservicesstore", "access_context");
  id v1 = (void *)GetContextLog(void)::result;
  GetContextLog(void)::uint64_t result = (uint64_t)v0;
}

void _CSStoreAccessContextAccessForWrite(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int8x8_t v4 = GetContextLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v12 = a1;
    _os_log_debug_impl(&dword_1A7DB2000, v4, OS_LOG_TYPE_DEBUG, "accessing for write: %@", buf, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 8);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  _OWORD v8[2] = ___CSStoreAccessContextAccessForWrite_block_invoke;
  void v8[3] = &unk_1E5D2A8F0;
  id v9 = v3;
  uint64_t v10 = a1;
  id v6 = *(void (**)(uint64_t, void *))(*(void *)v5 + 24);
  id v7 = v3;
  v6(v5, v8);
}

void sub_1A7DD83F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

uint64_t CSMapAddMapTable(__CSStore *a1, void *a2, int a3)
{
  long long v22 = 0u;
  long long v23 = 0u;
  memset(v21, 0, sizeof(v21));
  size_t v5 = (a3 + 28);
  id v6 = malloc_type_malloc(v5, 0x7BEB9A07uLL);
  bzero(v6, v5);
  id v7 = (void *)MEMORY[0x1AD0DB160]();
  id v20 = 0;
  unsigned int v8 = _CSStoreAddTable((uint64_t)a1, a2, v5, &v20);
  if (v8)
  {

    v6[2] = 511;
    id v9 = v6 + 2;
    unsigned int v10 = CSStoreAllocUnit((uint64_t)a1, v8, 4088);
    uint64_t v11 = (uint64_t)a1;
    unsigned int v12 = v8;
    goto LABEL_3;
  }
  uint64_t v17 = [v20 domain];
  char v18 = [v17 isEqual:*MEMORY[0x1E4F28760]];

  if ((v18 & 1) == 0)
  {

    uint64_t v16 = 4294957803;
LABEL_12:
    if (!v6) {
      return v16;
    }
    goto LABEL_13;
  }
  uint64_t v16 = [v20 code];

  if (v16) {
    goto LABEL_12;
  }
  v6[2] = 511;
  id v9 = v6 + 2;
  unsigned int v10 = CSStoreAllocUnit((uint64_t)a1, 0, 4088);
  uint64_t v11 = (uint64_t)a1;
  unsigned int v12 = 0;
LABEL_3:
  Unit = CSStoreGetUnit(v11, v12, v10, 0);
  v6[1] = v10;
  if (!Unit)
  {
    uint64_t v16 = 4294957803;
    goto LABEL_17;
  }
  *id v6 = 0;
  unsigned int v14 = v6[2];
  _DWORD v6[3] = v14;
  Unit v6[4] = v14 >> 1;
  *(void *)(v6 + 5) = 0xDDDDDDD2EEEEEEE1;
  uint64_t v15 = _CSMapWriteToHeader(a1, v8, 0, (const void *)v5, v6);
  if (v15
    || (LODWORD(v21[0]) = v8,
        *((void *)&v22 + 1) = v6,
        uint64_t v15 = _CSMapSetBucketRange((uint64_t)a1, (uint64_t)v21, 0, 0, v6[2], v6[5]),
        v15))
  {
    uint64_t v16 = v15;
    goto LABEL_17;
  }
  uint64_t v16 = _CSMapSetBucketRange((uint64_t)a1, (uint64_t)v21, *v9, 0, *v9, 233893374);
  if (!v16)
  {
LABEL_13:
    free(v6);
    return v16;
  }
LABEL_17:
  free(v6);
  if (v8) {
    _CSStoreRemoveTable((uint64_t)a1, v8);
  }
  return v16;
}

void sub_1A7DD8654(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t _CSMapWriteToHeader(__CSStore *a1, unsigned int a2, unsigned int a3, const void *a4, const void *a5)
{
  id v14 = 0;
  if (a1) {
    unsigned int v9 = -37516;
  }
  else {
    unsigned int v9 = 0;
  }
  if (_CSStoreWriteToUnit((uint64_t)a1, v9, a2, a3, a4, a5, &v14))
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v11 = [v14 domain];
    int v12 = [v11 isEqual:*MEMORY[0x1E4F28760]];

    if (v12) {
      uint64_t v10 = [v14 code];
    }
    else {
      uint64_t v10 = 4294962336;
    }
  }

  return v10;
}

void sub_1A7DD8718(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t _CSMapSetBucketRange(uint64_t a1, uint64_t a2, int a3, unsigned int a4, unsigned int a5, int a6)
{
  int v27 = a6;
  unsigned int v6 = *(_DWORD *)(*(void *)(a2 + 72) + 8);
  if (v6 < a4) {
    return 4294957804;
  }
  if (a5 + a4 > v6) {
    return 4294957799;
  }
  if (!a5) {
    return 4294957804;
  }
  if (a5 == 1)
  {
    uint64_t v13 = (void *)MEMORY[0x1AD0DB160]();
    unsigned int v14 = *(_DWORD *)(*(void *)(a2 + 72) + 4);
    id v26 = 0;
    if (_CSStoreWriteToUnit(a1, *(_DWORD *)a2, v14, 4 * (a4 + a3), (const void *)4, &v27, &v26))
    {
      uint64_t v7 = 0;
    }
    else
    {
      uint64_t v21 = [v26 domain];
      int v22 = [v21 isEqual:*MEMORY[0x1E4F28760]];

      if (v22) {
        uint64_t v7 = [v26 code];
      }
      else {
        uint64_t v7 = 4294962336;
      }
    }
  }
  else
  {
    uint64_t v16 = malloc_type_malloc(4 * a5, 0x100004052888210uLL);
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = 0;
      do
        *((_DWORD *)v16 + v18++) = a6;
      while (a5 != v18);
      uint64_t v19 = (void *)MEMORY[0x1AD0DB160]();
      unsigned int v20 = *(_DWORD *)(*(void *)(a2 + 72) + 4);
      id v26 = 0;
      if (_CSStoreWriteToUnit(a1, *(_DWORD *)a2, v20, 4 * (a4 + a3), (const void *)(4 * a5), v17, &v26))
      {
        uint64_t v7 = 0;
      }
      else
      {
        long long v23 = [v26 domain];
        int v24 = [v23 isEqual:*MEMORY[0x1E4F28760]];

        if (v24) {
          uint64_t v7 = [v26 code];
        }
        else {
          uint64_t v7 = 4294962336;
        }
      }

      free(v17);
    }
    else
    {
      return 4294967255;
    }
  }
  return v7;
}

void sub_1A7DD893C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

char *CSMapGetHeader(uint64_t a1, unsigned int *a2, unsigned int *a3)
{
  unsigned int v9 = 0;
  Header = CSStoreGetHeader(a1, *a2, &v9);
  if (Header) {
    BOOL v5 = v9 > 0x1C;
  }
  else {
    BOOL v5 = 0;
  }
  int v6 = v5;
  if (a3)
  {
    unsigned int v7 = v9 - 28;
    if (!v6) {
      unsigned int v7 = 0;
    }
    *a3 = v7;
  }
  if (v6) {
    return Header + 28;
  }
  else {
    return 0;
  }
}

uint64_t CSMapWriteToHeader(__CSStore *a1, unsigned int *a2, int a3, const void *a4, const void *a5)
{
  return _CSMapWriteToHeader(a1, *a2, a3 + 28, a4, a5);
}

uint64_t CSMapGetKeyAndValueForKeyData(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, _DWORD *a6, _DWORD *a7)
{
  uint64_t result = CSMapSync(a1, a2);
  if (!result)
  {
    int v24 = a6;
    uint64_t v15 = a7;
    uint64_t v16 = *(unsigned int **)(a2 + 72);
    unint64_t v17 = v16[2];
    unint64_t v18 = a5 % v17;
    unsigned int v19 = v16[5];
    unsigned int v20 = v16[6];
    unint64_t i = v18;
    while (1)
    {
      uint64_t v22 = *(unsigned int *)(*(void *)(a2 + 80) + 4 * i);
      if (v22 == v19) {
        return 4294957797;
      }
      if (v22 != v20
        && (*(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a2 + 32))(a1, a2, v22, a3, a4))
      {
        break;
      }
      if (++i >= v17)
      {
        if (v18)
        {
          for (unint64_t i = 0; i < v18; ++i)
          {
            uint64_t v23 = *(unsigned int *)(*(void *)(a2 + 80) + 4 * i);
            if (v23 == v19) {
              break;
            }
            if (v23 != v20
              && (*(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a2 + 32))(a1, a2, v23, a3, a4))
            {
              goto LABEL_15;
            }
          }
        }
        return 4294957797;
      }
    }
LABEL_15:
    if (v24) {
      _DWORD *v24 = *(_DWORD *)(*(void *)(a2 + 80) + 4 * i);
    }
    uint64_t result = 0;
    if (v15) {
      _DWORD *v15 = *(_DWORD *)(*(void *)(a2 + 88) + 4 * i);
    }
  }
  return result;
}

uint64_t CSMapSetValue(__CSStore *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = CSMapSync((uint64_t)a1, a2);
  if (result) {
    return result;
  }
  uint64_t v49 = 0;
  if (*(_DWORD *)(*(void *)(a2 + 72) + 12) == *(_DWORD *)(*(void *)(a2 + 72) + 16)
    && *(void *)(a2 + 80)
    && *(void *)(a2 + 88))
  {
    LODWORD(__n) = 0;
    Header = CSStoreGetHeader((uint64_t)a1, *(_DWORD *)a2, &__n);
    uint64_t v10 = malloc_type_calloc(1uLL, (__n + 1), 0x57EA7455uLL);
    memcpy(v10, Header, __n);
    uint64_t v11 = v10[2];
    int v12 = (char *)malloc_type_calloc((8 * v11) | 1u, 1uLL, 0xEBDD3AEBuLL);
    if (v12)
    {
      uint64_t v13 = v12;
      memcpy(v12, *(const void **)(a2 + 80), (8 * v11));
      CSStoreFreeUnit((uint64_t)a1, *(_DWORD *)a2, v10[1]);
      int v14 = 2 * v11 - 1;
      _OWORD v10[2] = v14;
      unsigned int v15 = CSStoreAllocUnit((uint64_t)a1, *(_DWORD *)a2, 8 * v14);
      Unit = CSStoreGetUnit((uint64_t)a1, *(_DWORD *)a2, v15, 0);
      *(void *)(a2 + 80) = Unit;
      v10[1] = v15;
      *(void *)(a2 + 88) = &Unit[4 * v10[2]];
      *(void *)(a2 + 72) = CSStoreGetHeader((uint64_t)a1, *(_DWORD *)a2, 0);
      *(_DWORD *)(a2 + 68) = CSStoreGetGeneration((uint64_t)a1);
      unsigned int v17 = v10[2];
      v10[3] = v17;
      void v10[4] = v17 >> 1;
      if (_CSMapWriteToHeader(a1, *(_DWORD *)a2, 0, (const void *)__n, v10)) {
        goto LABEL_18;
      }
      if (_CSMapSetBucketRange((uint64_t)a1, a2, 0, 0, v10[2], v10[5])) {
        goto LABEL_18;
      }
      int v18 = _CSMapSetBucketRange((uint64_t)a1, a2, *(_DWORD *)(*(void *)(a2 + 72) + 8), 0, v10[2], 233893374);
      if (!v11 || v18) {
        goto LABEL_18;
      }
      uint64_t v19 = 0;
      uint64_t v20 = 4 * v11;
      uint64_t v21 = &v13[4 * v11];
      do
      {
        uint64_t v22 = *(void *)(a2 + 72);
        uint64_t v23 = *(unsigned int *)&v13[v19];
        if (*(_DWORD *)(v22 + 20) != v23 && *(_DWORD *)(v22 + 24) != v23)
        {
          unsigned int v51 = 0;
          uint64_t v50 = 0;
          _CSMapFindBucketForKey((uint64_t)a1, (void *)a2, v23, (int *)&v51, (int *)&v50 + 1);
          if (_CSMapSetBucketRange((uint64_t)a1, a2, 0, HIDWORD(v50), 1u, *(_DWORD *)&v13[v19])) {
            break;
          }
          if (_CSMapSetBucketRange((uint64_t)a1, a2, *(_DWORD *)(*(void *)(a2 + 72) + 8), HIDWORD(v50), 1u, *(_DWORD *)&v21[v19]))break; {
          int v24 = v10[3] - 1;
          }
          v10[3] = v24;
          LODWORD(v50) = v24;
          if (_CSMapWriteToHeader(a1, *(_DWORD *)a2, 0xCu, (const void *)4, &v50)) {
            break;
          }
        }
        v19 += 4;
      }
      while (v20 != v19);
      if (v10) {
LABEL_18:
      }
        free(v10);
    }
    else
    {
      uint64_t v13 = (char *)v10;
    }
    free(v13);
  }
  unsigned int v51 = 0;
  _CSMapFindBucketForKey((uint64_t)a1, (void *)a2, a3, (int *)&v51, (int *)&v49 + 1);
  if (v51 != -1)
  {
    uint64_t v25 = *(unsigned int *)(*(void *)(a2 + 88) + 4 * v51);
    if (v25 == a4) {
      return 0;
    }
    uint64_t result = _CSMapSetBucketRange((uint64_t)a1, a2, *(_DWORD *)(*(void *)(a2 + 72) + 8), v51, 1u, a4);
    if (result) {
      return result;
    }
    id v26 = *(void (**)(__CSStore *, uint64_t, uint64_t))(a2 + 40);
    if (v26) {
      v26(a1, a2, a4);
    }
    int v27 = *(void (**)(__CSStore *, uint64_t, uint64_t))(a2 + 48);
    if (!v27) {
      return 0;
    }
    id v28 = a1;
    uint64_t v29 = a2;
    uint64_t v30 = v25;
    goto LABEL_64;
  }
  uint64_t v31 = *(void *)(a2 + 72);
  if (*(_DWORD *)(v31 + 20) == a3)
  {
    uint64_t v32 = *(unsigned int *)(v31 + 8);
    int v33 = a3 + 2;
    LODWORD(__n) = a3 + 2;
    if (v32)
    {
      char v34 = *(int **)(a2 + 80);
LABEL_30:
      uint64_t v35 = v32;
      unsigned int v36 = v34;
      do
      {
        int v37 = *v36++;
        if (v37 == v33)
        {
          v33 += 2;
          LODWORD(__n) = v33;
          goto LABEL_30;
        }
        --v35;
      }
      while (v35);
      uint64_t result = _CSMapWriteToHeader(a1, *(_DWORD *)a2, 0x14u, (const void *)4, &__n);
      if (!result)
      {
        uint64_t v38 = 0;
        while (1)
        {
          if (*(_DWORD *)(*(void *)(a2 + 80) + 4 * v38) == a3)
          {
            uint64_t result = _CSMapSetBucketRange((uint64_t)a1, a2, 0, v38, 1u, __n);
            if (result) {
              break;
            }
          }
          if (v32 == ++v38) {
            goto LABEL_42;
          }
        }
      }
      return result;
    }
    uint64_t result = _CSMapWriteToHeader(a1, *(_DWORD *)a2, 0x14u, (const void *)4, &__n);
    if (result) {
      return result;
    }
  }
LABEL_42:
  uint64_t v39 = *(void *)(a2 + 72);
  if (*(_DWORD *)(v39 + 24) == a3)
  {
    uint64_t v40 = *(unsigned int *)(v39 + 8);
    int v41 = a3 + 2;
    LODWORD(__n) = a3 + 2;
    if (v40)
    {
      unint64_t v42 = *(int **)(a2 + 80);
LABEL_45:
      uint64_t v43 = v40;
      uint64_t v44 = v42;
      do
      {
        int v45 = *v44++;
        if (v45 == v41)
        {
          v41 += 2;
          LODWORD(__n) = v41;
          goto LABEL_45;
        }
        --v43;
      }
      while (v43);
      uint64_t result = _CSMapWriteToHeader(a1, *(_DWORD *)a2, 0x18u, (const void *)4, &__n);
      if (!result)
      {
        uint64_t v46 = 0;
        while (1)
        {
          if (*(_DWORD *)(*(void *)(a2 + 80) + 4 * v46) == a3)
          {
            uint64_t result = _CSMapSetBucketRange((uint64_t)a1, a2, 0, v46, 1u, __n);
            if (result) {
              break;
            }
          }
          if (v40 == ++v46) {
            goto LABEL_57;
          }
        }
      }
      return result;
    }
    uint64_t result = _CSMapWriteToHeader(a1, *(_DWORD *)a2, 0x18u, (const void *)4, &__n);
    if (result) {
      return result;
    }
  }
LABEL_57:
  unsigned int v47 = HIDWORD(v49);
  uint64_t result = _CSMapSetBucketRange((uint64_t)a1, a2, 0, HIDWORD(v49), 1u, a3);
  if (!result)
  {
    LODWORD(v49) = *(_DWORD *)(*(void *)(a2 + 72) + 12) - 1;
    uint64_t result = _CSMapWriteToHeader(a1, *(_DWORD *)a2, 0xCu, (const void *)4, &v49);
    if (!result)
    {
      uint64_t result = _CSMapSetBucketRange((uint64_t)a1, a2, *(_DWORD *)(*(void *)(a2 + 72) + 8), v47, 1u, a4);
      if (!result)
      {
        unint64_t v48 = *(void (**)(__CSStore *, uint64_t, uint64_t))(a2 + 8);
        if (v48) {
          v48(a1, a2, a3);
        }
        int v27 = *(void (**)(__CSStore *, uint64_t, uint64_t))(a2 + 40);
        if (!v27) {
          return 0;
        }
        id v28 = a1;
        uint64_t v29 = a2;
        uint64_t v30 = a4;
LABEL_64:
        v27(v28, v29, v30);
        return 0;
      }
    }
  }
  return result;
}

uint64_t CSMapRemoveValue(__CSStore *a1, void *a2, uint64_t a3)
{
  uint64_t result = CSMapSync((uint64_t)a1, (uint64_t)a2);
  if (!result)
  {
    unsigned int v16 = 0;
    uint64_t result = _CSMapFindBucketForKey((uint64_t)a1, a2, a3, (int *)&v16, 0);
    if (!result)
    {
      uint64_t v7 = v16;
      uint64_t v8 = *(unsigned int *)(a2[11] + 4 * v16);
      uint64_t result = _CSMapSetBucketRange((uint64_t)a1, (uint64_t)a2, 0, v16, 1u, *(_DWORD *)(a2[9] + 24));
      if (!result)
      {
        int v15 = *(_DWORD *)(a2[9] + 12) + 1;
        uint64_t result = _CSMapWriteToHeader(a1, *(_DWORD *)a2, 0xCu, (const void *)4, &v15);
        if (!result)
        {
          unsigned int v9 = (_DWORD *)a2[9];
          uint64_t v10 = a2[10];
          if (v9[5] == *(_DWORD *)(v10 + 4 * ((v7 + 1) % v9[2])))
          {
            int v11 = v9[6];
            for (int i = *(_DWORD *)(v10 + 4 * v7); v11 == i; int i = *(_DWORD *)(a2[10] + 4 * v7))
            {
              uint64_t result = _CSMapSetBucketRange((uint64_t)a1, (uint64_t)a2, 0, v7, 1u, v9[5]);
              if (result) {
                return result;
              }
              unsigned int v9 = (_DWORD *)a2[9];
              LODWORD(v7) = (v7 + v9[2] - 1) % v9[2];
              int v11 = v9[6];
            }
          }
          uint64_t v13 = (void (*)(__CSStore *, void *, uint64_t))a2[2];
          if (v13) {
            v13(a1, a2, a3);
          }
          int v14 = (void (*)(__CSStore *, void *, uint64_t))a2[6];
          if (v14) {
            v14(a1, a2, v8);
          }
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t _CSMapCopyDebugDescription(uint64_t a1, unsigned int *a2)
{
  if (CSMapSync(a1, (uint64_t)a2)) {
    return 0;
  }
  int8x8_t v4 = (void *)MEMORY[0x1AD0DB160]();
  int v24 = &unk_1EFE40808;
  v25[0] = 0;
  long long v31 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v25[1] = v5;
  *(void *)&long long v31 = 0;
  long long v32 = 0u;
  long long v33 = 0u;
  DWORD2(v31) = 1065353216;
  LODWORD(v34) = 1065353216;
  WORD4(v34) = 0;
  *(void *)&long long v35 = 0;
  WORD4(v35) = 257;
  BYTE10(v35) = 0;
  uint64_t v40 = v25;
  CSStore2::AttributedStringWriter::format((CSStore2::AttributedStringWriter *)&v24, &cfstr_Table.isa, &cfstr_Llu0xLlx.isa, *a2, *a2);
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v8 = (CSStore2 **)(a2 + 2);
  do
  {
    unsigned int v9 = CSStore2::NameOfSymbol(*v8, v6);
    if (v9) {
      [v7 addObject:v9];
    }

    ++v8;
  }
  while (v8 < (CSStore2 **)a2 + 7);
  uint64_t v10 = [v7 componentsJoinedByString:@", "];
  CSStore2::AttributedStringWriter::string((CSStore2::AttributedStringWriter *)&v24, &cfstr_Callbacks.isa, v10);

  int v11 = (unsigned int *)*((void *)a2 + 9);
  if (v11)
  {
    int v12 = [NSNumber numberWithUnsignedInt:*v11];
    CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)&v24, &cfstr_Version_0.isa, v12);

    uint64_t v13 = [NSNumber numberWithUnsignedInt:v11[1]];
    CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)&v24, &cfstr_Unit.isa, v13);

    int v14 = [NSNumber numberWithUnsignedInt:v11[2]];
    CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)&v24, &cfstr_BucketCount.isa, v14);

    int v15 = [NSNumber numberWithUnsignedInt:v11[3]];
    CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)&v24, &cfstr_EmptyCount.isa, v15);

    unsigned int v16 = [NSNumber numberWithUnsignedInt:v11[4]];
    CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)&v24, &cfstr_Threshold.isa, v16);

    unsigned int v23 = v11[5];
    unsigned int v17 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3321888768;
    void v22[2] = ___CSMapCopyDebugDescription_block_invoke;
    v22[3] = &__block_descriptor_48_ea8_32c39_ZTSKZ26_CSMapCopyDebugDescriptionE3__0_e5_v8__0l;
    v22[4] = &v24;
    v22[5] = &v23;
    CSStore2::AttributedStringWriter::withAppliedAttribute((uint64_t)&v24, @"_CSVNum", (uint64_t)v17, (uint64_t)v22);

    unsigned int v21 = v11[6];
    int v18 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3321888768;
    void v20[2] = ___CSMapCopyDebugDescription_block_invoke_31;
    v20[3] = &__block_descriptor_48_ea8_32c39_ZTSKZ26_CSMapCopyDebugDescriptionE3__1_e5_v8__0l;
    v20[4] = &v24;
    v20[5] = &v21;
    CSStore2::AttributedStringWriter::withAppliedAttribute((uint64_t)&v24, @"_CSVNum", (uint64_t)v18, (uint64_t)v20);
  }
  uint64_t v3 = [v5 copy];

  CSStore2::AttributedStringWriter::~AttributedStringWriter((CSStore2::AttributedStringWriter *)&v24);
  return v3;
}

void sub_1A7DD95E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);

  CSStore2::AttributedStringWriter::~AttributedStringWriter((CSStore2::AttributedStringWriter *)va);
  _Unwind_Resume(a1);
}

__n128 __copy_helper_block_ea8_32c39_ZTSKZ26_CSMapCopyDebugDescriptionE3__1(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[2];
  a1[2] = result;
  return result;
}

__n128 __copy_helper_block_ea8_32c39_ZTSKZ26_CSMapCopyDebugDescriptionE3__0(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[2];
  a1[2] = result;
  return result;
}

void sub_1A7DD97E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7DD9904(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1A7DD99E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A7DD9ACC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7DD9D2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7DD9E3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7DD9F5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7DDA208(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7DDA564(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7DDA668(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7DDA964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);

  CSStore2::AttributedStringWriter::~AttributedStringWriter((CSStore2::AttributedStringWriter *)va);
  _Unwind_Resume(a1);
}

void sub_1A7DDAB94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);

  CSStore2::AttributedStringWriter::~AttributedStringWriter((CSStore2::AttributedStringWriter *)va);
  _Unwind_Resume(a1);
}

void sub_1A7DDAD44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A7DDADB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7DDAE54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7DDAEBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  uint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)_CSVisualizer;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1A7DDAFBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7DDAFF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7DDB244(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va1, a12);
  va_start(va, a12);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  uint64_t v20 = va_arg(va1, void);

  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);

  _Unwind_Resume(a1);
}

void sub_1A7DDB3F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A7DDB4A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7DDB558(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7DDB67C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A7DDB72C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1A7DDB7F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7DDBE90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7DDC254(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *___ZN8CSStore27HashMapIjjNS_20_IdentifierFunctionsELy1EE14WriteBreakdownERKNS_5StoreEPKS2_hPh_block_invoke(uint64_t a1, unsigned int a2, size_t __len, int a4, int a5)
{
  if (a4) {
    int v5 = 64;
  }
  else {
    int v5 = -128;
  }
  return memset((void *)(*(void *)(a1 + 32) + a2), (v5 | a5 ^ 1) & 0xFFFFFFC1 | (2 * (*(unsigned char *)(a1 + 40) & 0x1F)), __len);
}

void sub_1A7DDC780(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *a35)
{
  if (v35) {
    operator delete(v35);
  }

  _Block_object_dispose((const void *)(v36 - 176), 8);
  long long v38 = *(void **)(v36 - 128);
  if (v38)
  {
    *(void *)(v36 - 120) = v38;
    operator delete(v38);
  }

  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__44(__n128 *a1, __n128 *a2)
{
  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  __n128 result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void __Block_byref_object_dispose__45(uint64_t a1)
{
  id v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

void sub_1A7DDCA7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__692(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[3];
  a1[3] = result;
  return result;
}

void sub_1A7DDCB98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A7DDCCC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7DDCE94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1A7DDCF38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A7DDCFB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A7DDD190(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A7DDD2B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  _Unwind_Resume(a1);
}

void sub_1A7DDD404(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A7DDD66C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t CSStore2::ansiColorCodeFromNSNumber(CSStore2 *this, NSNumber *a2)
{
  id v2 = this;
  unsigned int v3 = _NSIsNSNumber();
  if (v3) {
    unsigned int v3 = [(CSStore2 *)v2 unsignedIntegerValue];
  }
  unsigned int v4 = BYTE2(v3);
  unsigned int v5 = v3 >> 8;
  unsigned int v6 = v3;
  unsigned int v7 = BYTE1(v3);

  if (v4 == v5 && v7 == v6)
  {
    if (v4 <= 0xF5) {
      uint64_t v8 = ((197400 * v4) >> 21) + 232;
    }
    else {
      uint64_t v8 = 15;
    }
  }
  else
  {
    uint64_t v8 = (((84215046 * (unint64_t)v6) >> 32)
                      + 36 * ((84215046 * (unint64_t)v4) >> 32)
                      + 6 * ((84215046 * (unint64_t)v7) >> 32)
                      + 16);
  }

  return v8;
}

void sub_1A7DDD78C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _CSArrayCreate(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  _DWORD v9[2] = ___CSArrayCreate_block_invoke;
  v9[3] = &__block_descriptor_44_e68__optional_CSStore2::Array_____c_Array___Store____Data_II__B_16__0_v8l;
  char v9[4] = a2;
  int v10 = a3;
  unsigned int v6 = (void *)MEMORY[0x1AD0DB340](v9);
  uint64_t Common = _CSArrayCreateCommon(a1, v6, a4);

  return Common;
}

void sub_1A7DDD908(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _CSArrayCreateCommon(uint64_t a1, void *a2, void *a3)
{
  void (**v5)(void *__return_ptr, id, uint64_t);
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  unsigned int v15;
  char v16;
  void v17[2];
  void v18[2];
  void v19[2];
  void v20[3];

  void v20[2] = *MEMORY[0x1E4F143B8];
  unsigned int v5 = a2;
  if (!a1)
  {
    unsigned int v9 = (void *)MEMORY[0x1E4F28C58];
    v17[0] = *MEMORY[0x1E4F28228];
    v17[1] = @"Line";
    v18[0] = @"paramErr";
    v18[1] = &unk_1EFE43AA0;
    int v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
    unsigned int v7 = [v9 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v10];

    goto LABEL_10;
  }
  if (performMutatingAssertions)
  {
    unsigned int v6 = *(void *)(a1 + 344);
    if (v6) {
      (***(void (****)(void))(v6 + 8))(*(void *)(v6 + 8));
    }
  }
  v5[2](&v14, v5, a1 + 8);
  if (!v16)
  {
    int v11 = (void *)MEMORY[0x1E4F28C58];
    v19[0] = *MEMORY[0x1E4F28228];
    v19[1] = @"Line";
    v20[0] = @"kCSStoreAllocFailedErr";
    v20[1] = &unk_1EFE43A88;
    int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
    unsigned int v7 = [v11 errorWithDomain:*MEMORY[0x1E4F28760] code:-9493 userInfo:v12];

LABEL_10:
    uint64_t v8 = 0;
    if (!a3) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  unsigned int v7 = 0;
  uint64_t v8 = v15;
  if (!a3) {
    goto LABEL_13;
  }
LABEL_11:
  if (!v8) {
    *a3 = v7;
  }
LABEL_13:

  return v8;
}

void sub_1A7DDDB20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

unint64_t CSStore2::Array::_Create(CSStore2::Array *this, CSStore2::Store *a2, unsigned int a3, const unsigned int *a4, unsigned int a5)
{
  unsigned int v5 = a5;
  *(unsigned char *)this = 0;
  *((unsigned char *)this + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  if (a5 <= a3) {
    unint64_t v9 = a3;
  }
  else {
    unint64_t v9 = a5;
  }
  atomic_ullong Table = (CSStore2::Table *)*((void *)a2 + 33);
  if (Table
    || (atomic_ullong Table = (CSStore2::Table *)CSStore2::Store::getTable((atomic_ullong *)a2, &cfstr_Array.isa)) != 0
    || (unint64_t result = (unint64_t)CSStore2::Store::allocateTable(a2, &cfstr_Array.isa, 0, 0),
        (atomic_ullong Table = (CSStore2::Table *)result) != 0))
  {
    if (v5)
    {
      if (*((_WORD *)a4 + 1))
      {
        BOOL v14 = 0;
      }
      else
      {
        unint64_t v12 = 0;
        while (v5 - 1 != v12)
        {
          unsigned int v13 = a4[++v12];
          if (v13 >= 0x10000) {
            goto LABEL_16;
          }
        }
        unint64_t v12 = v5;
LABEL_16:
        BOOL v14 = v12 >= v5;
      }
    }
    else
    {
      BOOL v14 = 1;
    }
    unint64_t result = CSStore2::Array::_GetDataSizeWithCapacity((CSStore2::Array *)v9, v14);
    if (HIDWORD(result))
    {
      unint64_t result = (unint64_t)CSStore2::Store::allocateUnit(a2, Table, result, 0);
      if (result)
      {
        int v15 = (int *)(result + 8);
        if (v14) {
          int v16 = 0x20000000;
        }
        else {
          int v16 = 0;
        }
        if (a4 && v5)
        {
          *(_DWORD *)(result + 8) = v16 | v5 & 0x1FFFFFFF;
          unsigned int v17 = (_WORD *)(result + 12);
          if (v14)
          {
            do
            {
              int v18 = *a4++;
              *v17++ = v18;
              --v5;
            }
            while (v5);
          }
          else
          {
            do
            {
              int v19 = *a4++;
              *(_DWORD *)unsigned int v17 = v19;
              v17 += 2;
              --v5;
            }
            while (v5);
          }
        }
        else
        {
          int *v15 = v16;
        }
        *((unsigned char *)this + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
        *(void *)this = a2;
        *((void *)this + 1) = v15;
        int v20 = 4 * *(_DWORD *)result;
        *((_DWORD *)this + 4) = v9;
        *((_DWORD *)this + 5) = v20;
      }
    }
  }
  return result;
}

uint64_t CSStore2::Array::_GetDataSizeWithCapacity(CSStore2::Array *this, int a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a2) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = 4;
  }
  uint64_t v3 = this;
  char v4 = 1;
  if (!a2) {
    char v4 = 2;
  }
  unint64_t v5 = (unint64_t)this << v4;
  if (v5 == (v5 & 0xFFFFFFFE) && (v5 & 0xFFFFFFFE) <= 0xFFFFFFFB) {
    return (v5 + 4) & 0xFFFFFFFE | 0x100000000;
  }
  unsigned int v7 = CSStore2::GetLog(this);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v9 = 134218496;
    uint64_t v10 = v3;
    __int16 v11 = 2048;
    uint64_t v12 = v2;
    __int16 v13 = 2048;
    uint64_t v14 = 4;
    _os_log_error_impl(&dword_1A7DB2000, v7, OS_LOG_TYPE_ERROR, "Overflow sizing array (%llu * %llu + %llu)", (uint8_t *)&v9, 0x20u);
  }

  return 0;
}

uint64_t _CSArrayCreateWithCapacity(uint64_t a1, int a2, void *a3)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  _OWORD v8[2] = ___CSArrayCreateWithCapacity_block_invoke;
  void v8[3] = &__block_descriptor_36_e68__optional_CSStore2::Array_____c_Array___Store____Data_II__B_16__0_v8l;
  int v9 = a2;
  unint64_t v5 = (void *)MEMORY[0x1AD0DB340](v8);
  uint64_t Common = _CSArrayCreateCommon(a1, v5, a3);

  return Common;
}

void sub_1A7DDDE8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

Unit *_CSArrayDispose(Unit *result, CSStore2::Store *a2)
{
  if (result && a2)
  {
    uint64_t v3 = (uint64_t)result;
    if (performMutatingAssertions)
    {
      uint64_t v4 = *(void *)&result->var3[336];
      if (v4) {
        (***(void (****)(void))(v4 + 8))(*(void *)(v4 + 8));
      }
    }
    return CSStore2::Array::Dispose((CSStore2::Array *)(v3 + 8), a2);
  }
  return result;
}

uint64_t _CSArrayGetCapacity(uint64_t a1, unsigned int a2)
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    if (performConstantAssertions)
    {
      uint64_t v5 = *(void *)(a1 + 344);
      if (v5) {
        (*(void (**)(void))(**(void **)(v5 + 8) + 8))(*(void *)(v5 + 8));
      }
    }
    CSStore2::Array::Get((CSStore2::Array *)v6, (CSStore2::Store *)(a1 + 8), a2);
    if (v7) {
      return v6[4];
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t _CSArrayReserveCapacity(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    if (performMutatingAssertions)
    {
      uint64_t v7 = *(void *)(a1 + 344);
      if (v7) {
        (***(void (****)(void))(v7 + 8))(*(void *)(v7 + 8));
      }
    }
    CSStore2::Array::Get((CSStore2::Array *)v8, (CSStore2::Store *)(a1 + 8), a2);
    if (v8[24]) {
      return CSStore2::Array::reserveCapacity((CSStore2::Array *)v8, a3);
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t CSStore2::Array::reserveCapacity(CSStore2::Array *this, unsigned int a2)
{
  uint64_t v3 = this;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unsigned int v4 = **((_DWORD **)this + 1) & 0x1FFFFFFF;
  unsigned int v5 = *((_DWORD *)this + 4);
  if (v4 >= v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = v4;
  }
  BOOL v7 = __CFADD__(v6, a2);
  uint64_t v8 = (CSStore2::Array *)(v6 + a2);
  if (!v7)
  {
    this = (CSStore2::Array *)CSStore2::Array::_setCapacity((unint64_t)this, v8, 0);
    if (this) {
      return 1;
    }
  }
  uint64_t v10 = CSStore2::GetLog(this);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = *((unsigned int *)v3 + 4);
    int v12 = 134218496;
    uint64_t v13 = v11;
    __int16 v14 = 2048;
    uint64_t v15 = v6;
    __int16 v16 = 2048;
    uint64_t v17 = a2;
    _os_log_error_impl(&dword_1A7DB2000, v10, OS_LOG_TYPE_ERROR, "Unable to reserve array capacity! Current capacity was %llu, count was %llu, wanted %llu more", (uint8_t *)&v12, 0x20u);
  }

  return 0;
}

uint64_t CSStore2::Array::_setCapacity(unint64_t this, CSStore2::Array *a2, int a3)
{
  unint64_t v3 = (unint64_t)a2;
  unint64_t v4 = this;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a2 >> 29)
  {
LABEL_10:
    int v9 = CSStore2::GetLog((CSStore2 *)this);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(unsigned int *)(v4 + 16);
      int v11 = 134218240;
      uint64_t v12 = v10;
      __int16 v13 = 2048;
      uint64_t v14 = v3;
      _os_log_error_impl(&dword_1A7DB2000, v9, OS_LOG_TYPE_ERROR, "Unable to set array capacity! Current capacity was %llu, wanted %llu", (uint8_t *)&v11, 0x16u);
    }

    return 0;
  }
  unsigned int v5 = *(_DWORD *)(this + 16);
  if (v5 < a2)
  {
    unsigned int v6 = v5 + 4;
    if (v6 <= a2) {
      unint64_t v3 = a2;
    }
    else {
      unint64_t v3 = v6;
    }
    unsigned int v7 = **(_DWORD **)(this + 8);
    goto LABEL_7;
  }
  uint64_t result = 1;
  if (a3 && v5 > a2)
  {
    unsigned int v7 = **(_DWORD **)(v4 + 8);
    if ((v7 & 0x1FFFFFFF) < v5) {
      unsigned int v5 = v7 & 0x1FFFFFFF;
    }
    if (v5 <= a2)
    {
LABEL_7:
      this = CSStore2::Array::_GetDataSizeWithCapacity((CSStore2::Array *)v3, (v7 >> 29) & 1);
      if (HIDWORD(this))
      {
        this = CSStore2::Array::_reallocate((CSStore2::Array *)v4, (CSStore2::VM *)this);
        if (this)
        {
          *(_DWORD *)(v4 + 16) = v3;
          return 1;
        }
      }
      goto LABEL_10;
    }
  }
  return result;
}

uint64_t CSStore2::Array::_reallocate(CSStore2::Array *this, CSStore2::VM *a2)
{
  unint64_t v4 = *(atomic_ullong **)this;
  unsigned int v5 = (const CSStore2::Table *)v4[33];
  if (!v5)
  {
    uint64_t result = CSStore2::Store::getTable(v4, &cfstr_Array.isa);
    if (!result) {
      return result;
    }
    unsigned int v5 = (const CSStore2::Table *)result;
    unint64_t v4 = *(atomic_ullong **)this;
  }
  uint64_t result = (uint64_t)CSStore2::Store::getUnit((CSStore2 **)v4, v5, *((_DWORD *)this + 5));
  if (result)
  {
    unsigned int v7 = CSStore2::Store::reallocateUnit(*(CSStore2 ***)this, v5, (Unit *)result, a2);
    *((void *)this + 1) = v7->var3;
    *((_DWORD *)this + 5) = 4 * *(_DWORD *)v7;
    return 1;
  }
  return result;
}

void _CSArraySetValueAtIndex(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a1 && a2)
  {
    if (performMutatingAssertions)
    {
      uint64_t v8 = *(void *)(a1 + 344);
      if (v8) {
        (***(void (****)(void))(v8 + 8))(*(void *)(v8 + 8));
      }
    }
    CSStore2::Array::Get((CSStore2::Array *)&v17, (CSStore2::Store *)(a1 + 8), a2);
    if (v20)
    {
      unsigned int v10 = *(_DWORD *)v18 & 0x1FFFFFFF;
      if (v10 >= v19) {
        uint64_t v11 = v19;
      }
      else {
        uint64_t v11 = v10;
      }
      if (v11 > a3)
      {
        if ((*(_DWORD *)v18 & 0x20000000) == 0 || HIWORD(a4))
        {
          uint64_t v15 = (CSStore2 *)CSStore2::Array::_unpack((CSStore2::Array *)&v17);
          if (!v15) {
            goto LABEL_21;
          }
          uint64_t v12 = CSStore2::GetLog(v15);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            __int16 v13 = "Unpacking array (or already unpacked) for value replacement";
            goto LABEL_26;
          }
        }
        else
        {
          uint64_t v12 = CSStore2::GetLog(v9);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            __int16 v13 = "Keeping array packed for value replacement";
LABEL_26:
            _os_log_debug_impl(&dword_1A7DB2000, v12, OS_LOG_TYPE_DEBUG, v13, buf, 2u);
          }
        }

LABEL_21:
        uint64_t v16 = v18 + 4;
        if ((*(unsigned char *)(v18 + 3) & 0x20) != 0) {
          *(_WORD *)(v16 + 2 * a3) = a4;
        }
        else {
          *(_DWORD *)(v16 + 4 * a3) = a4;
        }
        return;
      }
      uint64_t v14 = CSStore2::GetLog(v9);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v22 = a3;
        __int16 v23 = 2048;
        uint64_t v24 = v11;
        _os_log_error_impl(&dword_1A7DB2000, v14, OS_LOG_TYPE_ERROR, "Out-of-bounds array write: %llu >= %llu", buf, 0x16u);
      }
    }
  }
}

uint64_t CSStore2::Array::_unpack(CSStore2::Array *this)
{
  if ((*(unsigned char *)(*((void *)this + 1) + 3) & 0x20) != 0)
  {
    CSStore2::Array::getAllValues(&__p, (uint64_t)this);
    unint64_t DataSizeWithCapacity = CSStore2::Array::_GetDataSizeWithCapacity((CSStore2::Array *)*((unsigned int *)this + 4), 0);
    uint64_t v1 = 0;
    if (!HIDWORD(DataSizeWithCapacity)) {
      goto LABEL_15;
    }
    if (!CSStore2::Array::_reallocate(this, (CSStore2::VM *)DataSizeWithCapacity))
    {
      uint64_t v1 = 0;
      goto LABEL_15;
    }
    **((_DWORD **)this + 1) &= ~0x20000000u;
    uint64_t v4 = *((void *)this + 1);
    std::vector<unsigned int>::pointer begin = __p.__begin_;
    if ((*(unsigned char *)(v4 + 3) & 0x20) != 0)
    {
      if (__p.__end_ != __p.__begin_)
      {
        int v9 = (_WORD *)(v4 + 4);
        int64_t v10 = __p.__end_ - __p.__begin_;
        do
        {
          unsigned int v11 = *begin++;
          *v9++ = v11;
          --v10;
        }
        while (v10);
        goto LABEL_14;
      }
    }
    else if (__p.__end_ != __p.__begin_)
    {
      unsigned int v6 = (_DWORD *)(v4 + 4);
      int64_t v7 = __p.__end_ - __p.__begin_;
      do
      {
        int v8 = *begin++;
        *v6++ = v8;
        --v7;
      }
      while (v7);
LABEL_14:
      uint64_t v1 = 1;
LABEL_15:
      std::vector<unsigned int>::pointer begin = __p.__begin_;
      if (!__p.__begin_) {
        return v1;
      }
LABEL_16:
      __p.__end_ = begin;
      operator delete(begin);
      return v1;
    }
    uint64_t v1 = 1;
    if (!__p.__begin_) {
      return v1;
    }
    goto LABEL_16;
  }
  return 1;
}

void sub_1A7DDE668(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void _CSArrayInsertValueAtIndex(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4)
{
  unsigned int v9 = a4;
  if (a1 && a2)
  {
    if (performMutatingAssertions)
    {
      uint64_t v7 = *(void *)(a1 + 344);
      if (v7) {
        (***(void (****)(void))(v7 + 8))(*(void *)(v7 + 8));
      }
    }
    CSStore2::Array::Get((CSStore2::Array *)v8, (CSStore2::Store *)(a1 + 8), a2);
    if (v8[24]) {
      CSStore2::Array::insertValueAtIndex((CSStore2::Array *)v8, a3, &v9);
    }
  }
}

void CSStore2::Array::insertValueAtIndex(CSStore2::Array *this, unsigned int a2, const unsigned int *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unsigned int v4 = **((_DWORD **)this + 1) & 0x1FFFFFFF;
  unsigned int v5 = *((_DWORD *)this + 4);
  if (v4 >= v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = v4;
  }
  if (v6 < a2)
  {
    uint64_t v7 = CSStore2::GetLog(this);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v21 = 134218240;
      uint64_t v22 = a2;
      __int16 v23 = 2048;
      uint64_t v24 = v6;
      int v8 = "Out-of-bounds array insertion: %llu > %llu";
      unsigned int v9 = v7;
      uint32_t v10 = 22;
LABEL_28:
      _os_log_error_impl(&dword_1A7DB2000, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v21, v10);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  __int16 v13 = (CSStore2 *)CSStore2::Array::reserveCapacity(this, 1u);
  if ((v13 & 1) == 0)
  {
    uint64_t v7 = CSStore2::GetLog(v13);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v21 = 134217984;
      uint64_t v22 = v6;
      int v8 = "Failed to reserve array capacity when preparing for new value (old count = %llu)";
      unsigned int v9 = v7;
      uint32_t v10 = 12;
      goto LABEL_28;
    }
LABEL_13:

    return;
  }
  if ((*(unsigned char *)(*((void *)this + 1) + 3) & 0x20) != 0 && !HIWORD(*a3))
  {
    uint64_t v14 = CSStore2::GetLog(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v21) = 0;
      uint64_t v15 = "Array was packed and can remain packed with new values";
LABEL_30:
      _os_log_debug_impl(&dword_1A7DB2000, v14, OS_LOG_TYPE_DEBUG, v15, (uint8_t *)&v21, 2u);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  uint64_t v16 = (CSStore2 *)CSStore2::Array::_unpack(this);
  int v17 = (int)v16;
  uint64_t v18 = CSStore2::GetLog(v16);
  uint64_t v14 = v18;
  if (v17)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v21) = 0;
      uint64_t v15 = "Array was unpacked or needed to be unpacked to take new values";
      goto LABEL_30;
    }
LABEL_16:

    uint64_t v19 = *((void *)this + 1);
    uint64_t v20 = v19 + 4;
    if ((*(unsigned char *)(v19 + 3) & 0x20) != 0)
    {
      if (v6 > a2) {
        memmove((void *)(v20 + 2 * a2 + 2), (const void *)(v20 + 2 * a2), 2 * v6 - 2 * a2);
      }
      *(_WORD *)(v20 + 2 * a2) = *(_WORD *)a3;
    }
    else
    {
      if (v6 > a2) {
        memmove((void *)(v20 + 4 * a2 + 4), (const void *)(v20 + 4 * a2), 4 * v6 - 4 * a2);
      }
      *(_DWORD *)(v20 + 4 * a2) = *a3;
    }
    **((_DWORD **)this + 1) = **((_DWORD **)this + 1) & 0xE0000000 | (v6 + 1) & 0x1FFFFFFF;
    return;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    int v21 = 134217984;
    uint64_t v22 = v6;
    _os_log_error_impl(&dword_1A7DB2000, v14, OS_LOG_TYPE_ERROR, "Failed to unpack array when preparing for new value (old count = %llu)", (uint8_t *)&v21, 0xCu);
  }
}

void _CSArrayAppendValue(uint64_t a1, unsigned int a2, unsigned int a3)
{
  unsigned int v11 = a3;
  if (a1 && a2)
  {
    if (performMutatingAssertions)
    {
      uint64_t v5 = *(void *)(a1 + 344);
      if (v5) {
        (***(void (****)(void))(v5 + 8))(*(void *)(v5 + 8));
      }
    }
    CSStore2::Array::Get((CSStore2::Array *)v7, (CSStore2::Store *)(a1 + 8), a2);
    if (v10)
    {
      if ((*v8 & 0x1FFFFFFFu) >= v9) {
        unsigned int v6 = v9;
      }
      else {
        unsigned int v6 = *v8 & 0x1FFFFFFF;
      }
      CSStore2::Array::insertValueAtIndex((CSStore2::Array *)v7, v6, &v11);
    }
  }
}

void _CSArrayRemoveValueAtIndex(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a1 && a2)
  {
    if (performMutatingAssertions)
    {
      uint64_t v6 = *(void *)(a1 + 344);
      if (v6) {
        (***(void (****)(void))(v6 + 8))(*(void *)(v6 + 8));
      }
    }
    CSStore2::Array::Get((CSStore2::Array *)&v19, (CSStore2::Store *)(a1 + 8), a2);
    if (v22)
    {
      int v8 = v20;
      unsigned int v9 = *v20;
      unsigned int v10 = *v20 & 0x1FFFFFFF;
      if (v10 >= v21) {
        uint64_t v11 = v21;
      }
      else {
        uint64_t v11 = v10;
      }
      if (v11 <= a3)
      {
        uint64_t v14 = CSStore2::GetLog(v7);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          uint64_t v24 = a3;
          __int16 v25 = 2048;
          uint64_t v26 = v11;
          _os_log_error_impl(&dword_1A7DB2000, v14, OS_LOG_TYPE_ERROR, "Out-of-bounds array erasure: %llu >= %llu", buf, 0x16u);
        }
      }
      else
      {
        unsigned int v12 = v11 - 1;
        if (v11 == 1)
        {
          unsigned int v13 = v9 & 0xE0000000;
        }
        else
        {
          if (v12 > a3)
          {
            uint64_t v15 = v20 + 1;
            if ((v9 & 0x20000000) != 0)
            {
              uint64_t v16 = (char *)v15 + 2 * a3;
              int v17 = v16 + 2;
              uint64_t v18 = (char *)v15 + 2 * v11;
            }
            else
            {
              uint64_t v16 = (char *)&v15[a3];
              int v17 = v16 + 4;
              uint64_t v18 = &v15[v11];
            }
            if (v18 != v17) {
              memmove(v16, v17, v18 - v17);
            }
          }
          unsigned int v13 = *v8 & 0xE0000000 | v12;
        }
        unsigned int *v8 = v13;
        CSStore2::Array::_shrinkCapacityIfNeeded((unint64_t)&v19);
      }
    }
  }
}

unint64_t CSStore2::Array::_shrinkCapacityIfNeeded(unint64_t this)
{
  unsigned int v1 = *(_DWORD *)(this + 16);
  unsigned int v2 = **(_DWORD **)(this + 8) & 0x1FFFFFFF;
  if (v2 >= v1) {
    unint64_t v3 = v1;
  }
  else {
    unint64_t v3 = v2;
  }
  if (v1 > v2 && v1 - v3 >= 5) {
    return CSStore2::Array::_setCapacity(this, (CSStore2::Array *)v3, 1);
  }
  return this;
}

void _CSArrayRemoveAllValues(uint64_t a1, unsigned int a2)
{
  if (a1 && a2)
  {
    if (performMutatingAssertions)
    {
      uint64_t v4 = *(void *)(a1 + 344);
      if (v4) {
        (***(void (****)(void))(v4 + 8))(*(void *)(v4 + 8));
      }
    }
    CSStore2::Array::Get((CSStore2::Array *)&v5, (CSStore2::Store *)(a1 + 8), a2);
    if (v7)
    {
      *v6 &= 0xE0000000;
      CSStore2::Array::_shrinkCapacityIfNeeded((unint64_t)&v5);
    }
  }
}

id CSStore2::_CopyNameOfTypeImpl(std::string *this)
{
  unsigned int v1 = this;
  uint64_t v2 = HIBYTE(this->__r_.__value_.__r.__words[2]);
  std::string::size_type v3 = this->__r_.__value_.__r.__words[0];
  std::string::size_type size = this->__r_.__value_.__l.__size_;
  if ((v2 & 0x80u) == 0) {
    uint64_t v5 = this;
  }
  else {
    uint64_t v5 = (std::string *)this->__r_.__value_.__r.__words[0];
  }
  if ((v2 & 0x80u) == 0) {
    std::string::size_type v6 = HIBYTE(this->__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v6 = this->__r_.__value_.__l.__size_;
  }
  if (v6)
  {
    char v7 = (unsigned __int8 *)v5 + v6;
    int v8 = v5;
    unsigned int v9 = (std::string *)v7;
    do
    {
      unsigned int v10 = v8;
      uint64_t v11 = (unsigned __int8 *)v8;
      while (1)
      {
        int v12 = *v11++;
        if (v12 == 93) {
          break;
        }
        unsigned int v10 = (std::string *)v11;
        if (v11 == v7)
        {
          unsigned int v10 = v9;
          goto LABEL_14;
        }
      }
      int v8 = (std::string *)((char *)&v10->__r_.__value_.__l.__data_ + 1);
      unsigned int v9 = v10;
    }
    while (v11 != v7);
LABEL_14:
    if (v10 != (std::string *)v7 && (char *)v10 - (char *)v5 != -1)
    {
      int v13 = (char)v2;
      std::string::size_type v14 = v3 + size;
      uint64_t v15 = (char *)v1 + v2;
      if (v13 < 0) {
        uint64_t v15 = (char *)v14;
      }
      std::string::erase(v1, (char *)v10 - (char *)v5, v15 - (char *)v10);
    }
  }
  std::string::basic_string[abi:nn180100]<0>(__p, "[T = ");
  int64_t v16 = HIBYTE(v1->__r_.__value_.__r.__words[2]);
  if ((v16 & 0x80u) == 0) {
    int v17 = v1;
  }
  else {
    int v17 = (std::string *)v1->__r_.__value_.__r.__words[0];
  }
  if ((v42 & 0x80u) == 0) {
    uint64_t v18 = __p;
  }
  else {
    uint64_t v18 = (void **)__p[0];
  }
  if ((v42 & 0x80u) == 0) {
    int64_t v19 = v42;
  }
  else {
    int64_t v19 = (int64_t)__p[1];
  }
  if (v19)
  {
    if ((v16 & 0x80u) != 0) {
      int64_t v16 = v1->__r_.__value_.__l.__size_;
    }
    if (v16 >= v19)
    {
      uint64_t v20 = (char *)v17 + v16;
      int v21 = *(char *)v18;
      char v22 = v17;
      while (1)
      {
        int64_t v23 = v16 - v19;
        if (v23 == -1) {
          break;
        }
        uint64_t v24 = (char *)memchr(v22, v21, v23 + 1);
        if (!v24) {
          break;
        }
        __int16 v25 = v24;
        if (!memcmp(v24, v18, v19))
        {
          int64_t v26 = v25 - (char *)v17;
          if (v25 == v20 || v26 == -1) {
            goto LABEL_49;
          }
          goto LABEL_39;
        }
        char v22 = (std::string *)(v25 + 1);
        int64_t v16 = v20 - (v25 + 1);
        if (v16 < v19) {
          goto LABEL_49;
        }
      }
    }
  }
  else
  {
    int64_t v26 = 0;
LABEL_39:
    std::string::erase(v1, 0, v26 + v19);
  }
  while (1)
  {
LABEL_49:
    uint64_t v30 = MEMORY[0x1E4F14390];
    if (SHIBYTE(v1->__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::size_type v31 = v1->__r_.__value_.__l.__size_;
      if (!v31) {
        goto LABEL_58;
      }
      long long v32 = (std::string *)v1->__r_.__value_.__r.__words[0];
    }
    else
    {
      std::string::size_type v31 = HIBYTE(v1->__r_.__value_.__r.__words[2]);
      if (!*((unsigned char *)&v1->__r_.__value_.__s + 23)) {
        goto LABEL_58;
      }
      long long v32 = v1;
    }
    unsigned int v33 = v32->__r_.__value_.__s.__data_[v31 - 1];
    if (!((v33 & 0x80000000) != 0
         ? __maskrune(v33, 0x4000uLL)
         : *(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v33 + 60) & 0x4000))
      break;
    if (SHIBYTE(v1->__r_.__value_.__r.__words[2]) < 0)
    {
      long long v29 = (std::string *)v1->__r_.__value_.__r.__words[0];
      uint64_t v28 = v1->__r_.__value_.__l.__size_ - 1;
      v1->__r_.__value_.__l.__size_ = v28;
    }
    else
    {
      uint64_t v28 = HIBYTE(v1->__r_.__value_.__r.__words[2]) - 1;
      *((unsigned char *)&v1->__r_.__value_.__s + 23) = v28 & 0x7F;
      long long v29 = v1;
    }
    v29->__r_.__value_.__s.__data_[v28] = 0;
  }
  while (1)
  {
LABEL_58:
    int v35 = SHIBYTE(v1->__r_.__value_.__r.__words[2]);
    if (v35 < 0)
    {
      uint64_t v36 = (std::string *)v1->__r_.__value_.__r.__words[0];
      if (!v1->__r_.__value_.__l.__size_) {
        goto LABEL_68;
      }
    }
    else
    {
      uint64_t v36 = v1;
      if (!*((unsigned char *)&v1->__r_.__value_.__s + 23)) {
        goto LABEL_70;
      }
    }
    unsigned int v37 = v36->__r_.__value_.__s.__data_[0];
    if ((v37 & 0x80000000) != 0) {
      break;
    }
    if ((*(_DWORD *)(v30 + 4 * v37 + 60) & 0x4000) == 0) {
      goto LABEL_67;
    }
LABEL_66:
    std::string::erase(v1, 0, 1uLL);
  }
  int v38 = __maskrune(v37, 0x4000uLL);
  LOBYTE(v35) = *((unsigned char *)&v1->__r_.__value_.__s + 23);
  if (v38) {
    goto LABEL_66;
  }
LABEL_67:
  uint64_t v36 = (std::string *)v1->__r_.__value_.__r.__words[0];
LABEL_68:
  if ((v35 & 0x80u) != 0) {
    unsigned int v1 = v36;
  }
LABEL_70:
  long long v39 = [NSString stringWithUTF8String:v1];
  if ((char)v42 < 0) {
    operator delete(__p[0]);
  }

  return v39;
}

void sub_1A7DDEFF0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

id CSStore2::NameOfSymbol(CSStore2 *this, const void *a2)
{
  os_unfair_lock_lock((os_unfair_lock_t)&CSStore2::NameOfSymbol(void const*)::lock);
  if (!CSStore2::NameOfSymbol(void const*)::functionNames) {
    operator new();
  }
  unint64_t v4 = 0x9DDFEA08EB382D69 * (((8 * this) + 8) ^ ((unint64_t)this >> 32));
  unint64_t v5 = 0x9DDFEA08EB382D69 * (((unint64_t)this >> 32) ^ (v4 >> 47) ^ v4);
  unint64_t v6 = 0x9DDFEA08EB382D69 * (v5 ^ (v5 >> 47));
  int8x8_t v7 = *(int8x8_t *)(CSStore2::NameOfSymbol(void const*)::functionNames + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8(v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v9 = v6;
      if (v6 >= *(void *)&v7) {
        unint64_t v9 = v6 % *(void *)&v7;
      }
    }
    else
    {
      unint64_t v9 = v6 & (*(void *)&v7 - 1);
    }
    unsigned int v10 = *(uint64_t ****)(*(void *)CSStore2::NameOfSymbol(void const*)::functionNames + 8 * v9);
    if (v10)
    {
      for (int i = *v10; i; int i = (uint64_t **)*i)
      {
        unint64_t v12 = (unint64_t)i[1];
        if (v12 == v6)
        {
          if (i[2] == (uint64_t *)this)
          {
            unsigned int v51 = i[3];
            uint64_t v18 = v51;
            if (!v51) {
              break;
            }
            goto LABEL_28;
          }
        }
        else
        {
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
            break;
          }
        }
      }
    }
  }
  memset(&v54, 0, sizeof(v54));
  if (dladdr(this, &v54))
  {
    dli_sname = v54.dli_sname;
    if (v54.dli_sname)
    {
      int status = 0;
      std::string::size_type v14 = __cxa_demangle(v54.dli_sname, 0, 0, &status);
      uint64_t v15 = v14;
      if (v14)
      {
        if (!strncmp(v14, "invocation function for block in ", 0x21uLL))
        {
          unsigned __int8 v42 = (void *)[@"^() in " mutableCopy];
          uint64_t v43 = [NSString stringWithUTF8String:v15 + 33];
          [v42 appendString:v43];

          uint64_t v18 = (void *)[v42 copy];
          free(v15);

          goto LABEL_28;
        }
        uint64_t v16 = [[NSString alloc] initWithBytesNoCopy:v15 length:strlen(v15) encoding:4 freeWhenDone:1];
      }
      else
      {
        uint64_t v16 = [NSString stringWithUTF8String:dli_sname];
      }
    }
    else
    {
      id v17 = [NSString alloc];
      uint64_t v16 = objc_msgSend(v17, "initWithFormat:", @"0x%llx", v54.dli_saddr);
    }
  }
  else
  {
    uint64_t v16 = objc_msgSend([NSString alloc], "initWithFormat:", @"0x%llx?", this);
  }
  uint64_t v18 = (void *)v16;
LABEL_28:
  uint64_t v19 = CSStore2::NameOfSymbol(void const*)::functionNames;
  unint64_t v20 = *(void *)(CSStore2::NameOfSymbol(void const*)::functionNames + 8);
  if (v20)
  {
    uint8x8_t v21 = (uint8x8_t)vcnt_s8((int8x8_t)v20);
    v21.i16[0] = vaddlv_u8(v21);
    if (v21.u32[0] > 1uLL)
    {
      unint64_t v2 = v6;
      if (v6 >= v20) {
        unint64_t v2 = v6 % v20;
      }
    }
    else
    {
      unint64_t v2 = v6 & (v20 - 1);
    }
    char v22 = *(uint64_t ****)(*(void *)CSStore2::NameOfSymbol(void const*)::functionNames + 8 * v2);
    if (v22)
    {
      for (uint64_t j = *v22; j; uint64_t j = (uint64_t **)*j)
      {
        unint64_t v24 = (unint64_t)j[1];
        if (v24 == v6)
        {
          if (j[2] == (uint64_t *)this) {
            goto LABEL_102;
          }
        }
        else
        {
          if (v21.u32[0] > 1uLL)
          {
            if (v24 >= v20) {
              v24 %= v20;
            }
          }
          else
          {
            v24 &= v20 - 1;
          }
          if (v24 != v2) {
            break;
          }
        }
      }
    }
  }
  __int16 v25 = operator new(0x20uLL);
  int64_t v26 = (void *)(v19 + 16);
  *__int16 v25 = 0;
  v25[1] = v6;
  void v25[2] = this;
  v25[3] = v18;
  float v27 = (float)(unint64_t)(*(void *)(v19 + 24) + 1);
  float v28 = *(float *)(v19 + 32);
  if (!v20 || (float)(v28 * (float)v20) < v27)
  {
    BOOL v29 = 1;
    if (v20 >= 3) {
      BOOL v29 = (v20 & (v20 - 1)) != 0;
    }
    unint64_t v30 = v29 | (2 * v20);
    unint64_t v31 = vcvtps_u32_f32(v27 / v28);
    if (v30 <= v31) {
      int8x8_t prime = (int8x8_t)v31;
    }
    else {
      int8x8_t prime = (int8x8_t)v30;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    }
    unint64_t v20 = *(void *)(v19 + 8);
    if (*(void *)&prime > v20) {
      goto LABEL_57;
    }
    if (*(void *)&prime < v20)
    {
      unint64_t v39 = vcvtps_u32_f32((float)*(unint64_t *)(v19 + 24) / *(float *)(v19 + 32));
      if (v20 < 3 || (uint8x8_t v40 = (uint8x8_t)vcnt_s8((int8x8_t)v20), v40.i16[0] = vaddlv_u8(v40), v40.u32[0] > 1uLL))
      {
        unint64_t v39 = std::__next_prime(v39);
      }
      else
      {
        uint64_t v41 = 1 << -(char)__clz(v39 - 1);
        if (v39 >= 2) {
          unint64_t v39 = v41;
        }
      }
      if (*(void *)&prime <= v39) {
        int8x8_t prime = (int8x8_t)v39;
      }
      if (*(void *)&prime >= v20)
      {
        unint64_t v20 = *(void *)(v19 + 8);
      }
      else
      {
        if (prime)
        {
LABEL_57:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:nn180100]();
          }
          unsigned int v33 = operator new(8 * *(void *)&prime);
          long long v34 = *(void **)v19;
          *(void *)uint64_t v19 = v33;
          if (v34) {
            operator delete(v34);
          }
          uint64_t v35 = 0;
          *(int8x8_t *)(v19 + 8) = prime;
          do
            *(void *)(*(void *)v19 + 8 * v35++) = 0;
          while (*(void *)&prime != v35);
          uint64_t v36 = (void *)*v26;
          if (*v26)
          {
            unint64_t v37 = v36[1];
            uint8x8_t v38 = (uint8x8_t)vcnt_s8(prime);
            v38.i16[0] = vaddlv_u8(v38);
            if (v38.u32[0] > 1uLL)
            {
              if (v37 >= *(void *)&prime) {
                v37 %= *(void *)&prime;
              }
            }
            else
            {
              v37 &= *(void *)&prime - 1;
            }
            *(void *)(*(void *)v19 + 8 * v37) = v26;
            uint64_t v44 = (void *)*v36;
            if (*v36)
            {
              do
              {
                unint64_t v45 = v44[1];
                if (v38.u32[0] > 1uLL)
                {
                  if (v45 >= *(void *)&prime) {
                    v45 %= *(void *)&prime;
                  }
                }
                else
                {
                  v45 &= *(void *)&prime - 1;
                }
                if (v45 != v37)
                {
                  if (!*(void *)(*(void *)v19 + 8 * v45))
                  {
                    *(void *)(*(void *)v19 + 8 * v45) = v36;
                    goto LABEL_83;
                  }
                  *uint64_t v36 = *v44;
                  *uint64_t v44 = **(void **)(*(void *)v19 + 8 * v45);
                  **(void **)(*(void *)v19 + 8 * v45) = v44;
                  uint64_t v44 = v36;
                }
                unint64_t v45 = v37;
LABEL_83:
                uint64_t v36 = v44;
                uint64_t v44 = (void *)*v44;
                unint64_t v37 = v45;
              }
              while (v44);
            }
          }
          unint64_t v20 = (unint64_t)prime;
          goto LABEL_87;
        }
        unint64_t v52 = *(void **)v19;
        *(void *)uint64_t v19 = 0;
        if (v52) {
          operator delete(v52);
        }
        unint64_t v20 = 0;
        *(void *)(v19 + 8) = 0;
      }
    }
LABEL_87:
    if ((v20 & (v20 - 1)) != 0)
    {
      if (v6 >= v20) {
        unint64_t v2 = v6 % v20;
      }
      else {
        unint64_t v2 = v6;
      }
    }
    else
    {
      unint64_t v2 = (v20 - 1) & v6;
    }
  }
  uint64_t v46 = *(void **)v19;
  unsigned int v47 = *(void **)(*(void *)v19 + 8 * v2);
  if (v47)
  {
    *__int16 v25 = *v47;
LABEL_100:
    *unsigned int v47 = v25;
    goto LABEL_101;
  }
  *__int16 v25 = *v26;
  *int64_t v26 = v25;
  v46[v2] = v26;
  if (*v25)
  {
    unint64_t v48 = *(void *)(*v25 + 8);
    if ((v20 & (v20 - 1)) != 0)
    {
      if (v48 >= v20) {
        v48 %= v20;
      }
    }
    else
    {
      v48 &= v20 - 1;
    }
    unsigned int v47 = (void *)(*(void *)v19 + 8 * v48);
    goto LABEL_100;
  }
LABEL_101:
  ++*(void *)(v19 + 24);
LABEL_102:
  os_unfair_lock_unlock((os_unfair_lock_t)&CSStore2::NameOfSymbol(void const*)::lock);
  id v49 = v18;

  return v49;
}

void sub_1A7DDF68C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return (CFStringRef)MEMORY[0x1F40D74A8](bundle, key, value, tableName);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x1F40D7538](bundleID);
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1F40D75D0](bundle, key);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

Boolean CFFileSecurityGetMode(CFFileSecurityRef fileSec, mode_t *mode)
{
  return MEMORY[0x1F40D7B30](fileSec, mode);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1F40D83F0](alloc, theString);
}

CFStringRef CFStringCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1F40D8440](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation, contentsDeallocator);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1F40D8540](theString);
}

void NSCopyMemoryPages(const void *source, void *dest, NSUInteger bytes)
{
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E7140](range1.location, range1.length, range2.location, range2.length);
  result.size_t length = v3;
  result.location = v2;
  return result;
}

NSUInteger NSPageSize(void)
{
  return MEMORY[0x1F40E71C8]();
}

NSUInteger NSRoundDownToMultipleOfPageSize(NSUInteger bytes)
{
  return MEMORY[0x1F40E7238](bytes);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1F40E72A0](range.location, range.length);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E72E0](range1.location, range1.length, range2.location, range2.length);
  result.size_t length = v3;
  result.location = v2;
  return result;
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1F40D8D10]();
}

uint64_t _CFGetEUID()
{
  return MEMORY[0x1F40D8DE0]();
}

uint64_t _NSIsNSNumber()
{
  return MEMORY[0x1F40D94C0]();
}

uint64_t _NSIsNSString()
{
  return MEMORY[0x1F40D94E0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x1F417E3A8]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1F417E408](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1F417E418](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1F417E588](__n);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E5A0](this, __pos, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
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
  return MEMORY[0x1F417E868]();
}

{
  return MEMORY[0x1F417E898]();
}

{
  return MEMORY[0x1F417E8A0]();
}

{
  return MEMORY[0x1F417E8B0]();
}

{
  return MEMORY[0x1F417E8C8]();
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

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

uint64_t std::__sort<std::__less<unsigned long,unsigned long> &,unsigned long *>()
{
  return MEMORY[0x1F417EC68]();
}

void std::locale::~locale(std::locale *this)
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

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

char *__cxa_demangle(const char *lpmangled, char *lpout, size_t *lpoutlen, int *lpstatus)
{
  return (char *)MEMORY[0x1F417EF58](lpmangled, lpout, lpoutlen, lpstatus);
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1F40C9C18](*(void *)&a1, a2);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return MEMORY[0x1F4182BC0](crc, buf, *(void *)&len);
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_barrier(dispatch_queue_t queue)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C8](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1F40CBA10](buffer, size, queue, destructor);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x1F40CBDA0](a1, a2);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

int dup(int a1)
{
  return MEMORY[0x1F40CBDF8](*(void *)&a1);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x1F40CC070](*(void *)&a1, a2);
}

int feof(FILE *a1)
{
  return MEMORY[0x1F40CC098](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x1F40CC0A0](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1F40CC0C8](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x1F40CC110](a1);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC1C0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1F40CC1F0](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC200](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseeko(FILE *__stream, off_t a2, int __whence)
{
  return MEMORY[0x1F40CC298](__stream, a2, *(void *)&__whence);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

off_t ftello(FILE *__stream)
{
  return MEMORY[0x1F40CC2E8](__stream);
}

FILE *__cdecl funopen(const void *a1, int (__cdecl *a2)(void *, char *, int), int (__cdecl *a3)(void *, const char *, int), fpos_t (__cdecl *a4)(void *, fpos_t, int), int (__cdecl *a5)(void *))
{
  return (FILE *)MEMORY[0x1F40CC320](a1, a2, a3, a4, a5);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1F40CC3B0](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

int gzclose(gzFile file)
{
  return MEMORY[0x1F4182C20](file);
}

gzFile gzdopen(int fd, const char *mode)
{
  return (gzFile)MEMORY[0x1F4182C30](*(void *)&fd, mode);
}

const char *__cdecl gzerror(gzFile file, int *errnum)
{
  return (const char *)MEMORY[0x1F4182C48](file, errnum);
}

int gzread(gzFile file, voidp buf, unsigned int len)
{
  return MEMORY[0x1F4182C78](file, buf, *(void *)&len);
}

int gzwrite(gzFile file, voidpc buf, unsigned int len)
{
  return MEMORY[0x1F4182CA0](file, buf, *(void *)&len);
}

int isatty(int a1)
{
  return MEMORY[0x1F40CC6B0](*(void *)&a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBA8](ptr, size, type_id);
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

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

int mkstemp(char *a1)
{
  return MEMORY[0x1F40CCE08](a1);
}

int mkstemp_dprotected_np(char *path, int dpclass, int dpflags)
{
  return MEMORY[0x1F40CCE10](path, *(void *)&dpclass, *(void *)&dpflags);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40CCE40](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1F40CD0F0](a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1F40CD650]();
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1F40CDB30]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0D0](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1F40CE1B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1F40CE208](__s1, __n);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2A0](__str, __endptr, *(void *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2E0](__str, __endptr, *(void *)&__base);
}

int unlink(const char *a1)
{
  return MEMORY[0x1F40CE5E0](a1);
}

void uuid_generate(uuid_t out)
{
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x1F40CE6A8](*(void *)&target_task, address, size, *(void *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1F40CE6C0](*(void *)&target_task, address, size);
}

kern_return_t vm_protect(vm_map_t target_task, vm_address_t address, vm_size_t size, BOOLean_t set_maximum, vm_prot_t new_protection)
{
  return MEMORY[0x1F40CE6D8](*(void *)&target_task, address, size, *(void *)&set_maximum, *(void *)&new_protection);
}

xpc_object_t xpc_data_create_with_dispatch_data(dispatch_data_t ddata)
{
  return (xpc_object_t)MEMORY[0x1F40CEDA0](ddata);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1F40CEDB0](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1F40CEDC0](xdata);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}