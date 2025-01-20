@interface LSEnumerateExtensionPoints
@end

@implementation LSEnumerateExtensionPoints

void ___LSEnumerateExtensionPoints_block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  _CSArrayEnumerateAllValues();
}

void ___LSEnumerateExtensionPoints_block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  v6 = (_DWORD *)_LSGetExtensionPointData(*(void *)(a1 + 32), a3);
  if (v6)
  {
    v7 = v6;
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    int v9 = v6[1];
    int v10 = v6[11];
    unsigned int v11 = v6[14];
    unint64_t v12 = v10 ^ v9 ^ v11;
    unint64_t v13 = *(void *)(v8 + 56);
    if (v13)
    {
      uint8x8_t v14 = (uint8x8_t)vcnt_s8((int8x8_t)v13);
      v14.i16[0] = vaddlv_u8(v14);
      if (v14.u32[0] > 1uLL)
      {
        unint64_t v15 = v10 ^ v9 ^ v11;
        if (v13 <= v12) {
          unint64_t v15 = v12 % v13;
        }
      }
      else
      {
        unint64_t v15 = (v13 - 1) & v12;
      }
      uint64_t v16 = *(void *)(v8 + 48);
      v17 = *(void **)(v16 + 8 * v15);
      if (v17)
      {
        for (i = (void *)*v17; i; i = (void *)*i)
        {
          unint64_t v19 = i[1];
          if (v19 == v12)
          {
            v20 = (_DWORD *)i[2];
            if (v20[1] == v9 && v20[11] == v10 && v20[14] == v11) {
              return;
            }
          }
          else
          {
            if (v14.u32[0] > 1uLL)
            {
              if (v19 >= v13) {
                v19 %= v13;
              }
            }
            else
            {
              v19 &= v13 - 1;
            }
            if (v19 != v15) {
              break;
            }
          }
        }
      }
      if (v14.u32[0] > 1uLL)
      {
        unint64_t v3 = v10 ^ v9 ^ v11;
        if (v13 <= v12) {
          unint64_t v3 = v12 % v13;
        }
      }
      else
      {
        unint64_t v3 = (v13 - 1) & v12;
      }
      v21 = *(void **)(v16 + 8 * v3);
      if (v21)
      {
        for (j = (void *)*v21; j; j = (void *)*j)
        {
          unint64_t v23 = j[1];
          if (v23 == v12)
          {
            v24 = (_DWORD *)j[2];
            if (v24[1] == v9 && v24[11] == v10 && v24[14] == v11) {
              return;
            }
          }
          else
          {
            if (v14.u32[0] > 1uLL)
            {
              if (v23 >= v13) {
                v23 %= v13;
              }
            }
            else
            {
              v23 &= v13 - 1;
            }
            if (v23 != v3) {
              break;
            }
          }
        }
      }
    }
    v25 = operator new(0x20uLL);
    void *v25 = 0;
    v25[1] = v12;
    v25[2] = v7;
    *((_DWORD *)v25 + 6) = a3;
    float v26 = (float)(unint64_t)(*(void *)(v8 + 72) + 1);
    float v27 = *(float *)(v8 + 80);
    if (v13 && (float)(v27 * (float)v13) >= v26)
    {
      unint64_t v12 = v3;
      goto LABEL_84;
    }
    BOOL v28 = (v13 & (v13 - 1)) == 0;
    if (v13 < 3) {
      BOOL v28 = 0;
    }
    unint64_t v29 = (2 * v13) | !v28;
    unint64_t v30 = vcvtps_u32_f32(v26 / v27);
    if (v29 <= v30) {
      int8x8_t prime = (int8x8_t)v30;
    }
    else {
      int8x8_t prime = (int8x8_t)v29;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v13 = *(void *)(v8 + 56);
    }
    if (*(void *)&prime <= v13)
    {
      if (*(void *)&prime >= v13) {
        goto LABEL_80;
      }
      unint64_t v38 = vcvtps_u32_f32((float)*(unint64_t *)(v8 + 72) / *(float *)(v8 + 80));
      if (v13 < 3 || (uint8x8_t v39 = (uint8x8_t)vcnt_s8((int8x8_t)v13), v39.i16[0] = vaddlv_u8(v39), v39.u32[0] > 1uLL))
      {
        unint64_t v38 = std::__next_prime(v38);
      }
      else
      {
        uint64_t v40 = 1 << -(char)__clz(v38 - 1);
        if (v38 >= 2) {
          unint64_t v38 = v40;
        }
      }
      if (*(void *)&prime <= v38) {
        int8x8_t prime = (int8x8_t)v38;
      }
      if (*(void *)&prime >= v13)
      {
        unint64_t v13 = *(void *)(v8 + 56);
        goto LABEL_80;
      }
      if (!*(void *)&prime)
      {
        v47 = *(void **)(v8 + 48);
        *(void *)(v8 + 48) = 0;
        if (v47) {
          operator delete(v47);
        }
        unint64_t v13 = 0;
        *(void *)(v8 + 56) = 0;
        goto LABEL_80;
      }
    }
    if (*(void *)&prime >> 61) {
      std::__throw_bad_array_new_length[abi:nn180100]();
    }
    v32 = operator new(8 * *(void *)&prime);
    v33 = *(void **)(v8 + 48);
    *(void *)(v8 + 48) = v32;
    if (v33) {
      operator delete(v33);
    }
    uint64_t v34 = 0;
    *(int8x8_t *)(v8 + 56) = prime;
    do
      *(void *)(*(void *)(v8 + 48) + 8 * v34++) = 0;
    while (*(void *)&prime != v34);
    v35 = *(void **)(v8 + 64);
    if (v35)
    {
      unint64_t v36 = v35[1];
      uint8x8_t v37 = (uint8x8_t)vcnt_s8(prime);
      v37.i16[0] = vaddlv_u8(v37);
      if (v37.u32[0] > 1uLL)
      {
        if (v36 >= *(void *)&prime) {
          v36 %= *(void *)&prime;
        }
      }
      else
      {
        v36 &= *(void *)&prime - 1;
      }
      *(void *)(*(void *)(v8 + 48) + 8 * v36) = v8 + 64;
      v41 = (void *)*v35;
      if (*v35)
      {
        do
        {
          unint64_t v42 = v41[1];
          if (v37.u32[0] > 1uLL)
          {
            if (v42 >= *(void *)&prime) {
              v42 %= *(void *)&prime;
            }
          }
          else
          {
            v42 &= *(void *)&prime - 1;
          }
          if (v42 != v36)
          {
            uint64_t v43 = *(void *)(v8 + 48);
            if (!*(void *)(v43 + 8 * v42))
            {
              *(void *)(v43 + 8 * v42) = v35;
              goto LABEL_76;
            }
            void *v35 = *v41;
            void *v41 = **(void **)(*(void *)(v8 + 48) + 8 * v42);
            **(void **)(*(void *)(v8 + 48) + 8 * v42) = v41;
            v41 = v35;
          }
          unint64_t v42 = v36;
LABEL_76:
          v35 = v41;
          v41 = (void *)*v41;
          unint64_t v36 = v42;
        }
        while (v41);
      }
    }
    unint64_t v13 = (unint64_t)prime;
LABEL_80:
    if ((v13 & (v13 - 1)) != 0)
    {
      if (v13 <= v12) {
        v12 %= v13;
      }
    }
    else
    {
      unint64_t v12 = (v13 - 1) & v12;
    }
LABEL_84:
    uint64_t v44 = *(void *)(v8 + 48);
    v45 = *(void **)(v44 + 8 * v12);
    if (v45)
    {
      void *v25 = *v45;
    }
    else
    {
      void *v25 = *(void *)(v8 + 64);
      *(void *)(v8 + 64) = v25;
      *(void *)(v44 + 8 * v12) = v8 + 64;
      if (!*v25)
      {
LABEL_93:
        ++*(void *)(v8 + 72);
        return;
      }
      unint64_t v46 = *(void *)(*v25 + 8);
      if ((v13 & (v13 - 1)) != 0)
      {
        if (v46 >= v13) {
          v46 %= v13;
        }
      }
      else
      {
        v46 &= v13 - 1;
      }
      v45 = (void *)(*(void *)(v8 + 48) + 8 * v46);
    }
    void *v45 = v25;
    goto LABEL_93;
  }
}

@end