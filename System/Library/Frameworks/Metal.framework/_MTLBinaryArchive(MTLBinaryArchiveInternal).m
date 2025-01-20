@interface _MTLBinaryArchive(MTLBinaryArchiveInternal)
+ (void)deserializeBinaryArchiveHeader:()MTLBinaryArchiveInternal fileData:device:;
@end

@implementation _MTLBinaryArchive(MTLBinaryArchiveInternal)

+ (void)deserializeBinaryArchiveHeader:()MTLBinaryArchiveInternal fileData:device:
{
  unint64_t v4 = *a2;
  unint64_t v5 = *((void *)a1 + 1);
  if (v5)
  {
    uint8x8_t v6 = (uint8x8_t)vcnt_s8((int8x8_t)v5);
    v6.i16[0] = vaddlv_u8(v6);
    if (v6.u32[0] > 1uLL)
    {
      unint64_t v2 = *a2;
      if (v4 >= v5) {
        unint64_t v2 = v4 % v5;
      }
    }
    else
    {
      unint64_t v2 = (v5 - 1) & v4;
    }
    v7 = *(void ***)(*(void *)a1 + 8 * v2);
    if (v7)
    {
      for (i = *v7; i; i = (void *)*i)
      {
        unint64_t v9 = i[1];
        if (v9 == v4)
        {
          if (i[2] == v4) {
            return i + 3;
          }
        }
        else
        {
          if (v6.u32[0] > 1uLL)
          {
            if (v9 >= v5) {
              v9 %= v5;
            }
          }
          else
          {
            v9 &= v5 - 1;
          }
          if (v9 != v2) {
            break;
          }
        }
      }
    }
  }
  i = operator new(0x28uLL);
  void *i = 0;
  i[1] = v4;
  i[3] = 0;
  i[4] = 0;
  i[2] = v4;
  float v10 = (float)(unint64_t)(*((void *)a1 + 3) + 1);
  float v11 = a1[8];
  if (!v5 || (float)(v11 * (float)v5) < v10)
  {
    BOOL v12 = (v5 & (v5 - 1)) == 0;
    if (v5 < 3) {
      BOOL v12 = 0;
    }
    unint64_t v13 = (2 * v5) | !v12;
    unint64_t v14 = vcvtps_u32_f32(v10 / v11);
    if (v13 <= v14) {
      int8x8_t prime = (int8x8_t)v14;
    }
    else {
      int8x8_t prime = (int8x8_t)v13;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v5 = *((void *)a1 + 1);
    }
    if (*(void *)&prime > v5) {
      goto LABEL_30;
    }
    if (*(void *)&prime < v5)
    {
      unint64_t v22 = vcvtps_u32_f32((float)*((unint64_t *)a1 + 3) / a1[8]);
      if (v5 < 3 || (uint8x8_t v23 = (uint8x8_t)vcnt_s8((int8x8_t)v5), v23.i16[0] = vaddlv_u8(v23), v23.u32[0] > 1uLL))
      {
        unint64_t v22 = std::__next_prime(v22);
      }
      else
      {
        uint64_t v24 = 1 << -(char)__clz(v22 - 1);
        if (v22 >= 2) {
          unint64_t v22 = v24;
        }
      }
      if (*(void *)&prime <= v22) {
        int8x8_t prime = (int8x8_t)v22;
      }
      if (*(void *)&prime >= v5)
      {
        unint64_t v5 = *((void *)a1 + 1);
      }
      else
      {
        if (prime)
        {
LABEL_30:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          v16 = operator new(8 * *(void *)&prime);
          v17 = *(void **)a1;
          *(void *)a1 = v16;
          if (v17) {
            operator delete(v17);
          }
          uint64_t v18 = 0;
          *((int8x8_t *)a1 + 1) = prime;
          do
            *(void *)(*(void *)a1 + 8 * v18++) = 0;
          while (*(void *)&prime != v18);
          v19 = (void *)*((void *)a1 + 2);
          if (v19)
          {
            unint64_t v20 = v19[1];
            uint8x8_t v21 = (uint8x8_t)vcnt_s8(prime);
            v21.i16[0] = vaddlv_u8(v21);
            if (v21.u32[0] > 1uLL)
            {
              if (v20 >= *(void *)&prime) {
                v20 %= *(void *)&prime;
              }
            }
            else
            {
              v20 &= *(void *)&prime - 1;
            }
            *(void *)(*(void *)a1 + 8 * v20) = a1 + 4;
            v25 = (void *)*v19;
            if (*v19)
            {
              do
              {
                unint64_t v26 = v25[1];
                if (v21.u32[0] > 1uLL)
                {
                  if (v26 >= *(void *)&prime) {
                    v26 %= *(void *)&prime;
                  }
                }
                else
                {
                  v26 &= *(void *)&prime - 1;
                }
                if (v26 != v20)
                {
                  if (!*(void *)(*(void *)a1 + 8 * v26))
                  {
                    *(void *)(*(void *)a1 + 8 * v26) = v19;
                    goto LABEL_55;
                  }
                  void *v19 = *v25;
                  void *v25 = **(void **)(*(void *)a1 + 8 * v26);
                  **(void **)(*(void *)a1 + 8 * v26) = v25;
                  v25 = v19;
                }
                unint64_t v26 = v20;
LABEL_55:
                v19 = v25;
                v25 = (void *)*v25;
                unint64_t v20 = v26;
              }
              while (v25);
            }
          }
          unint64_t v5 = (unint64_t)prime;
          goto LABEL_59;
        }
        v31 = *(void **)a1;
        *(void *)a1 = 0;
        if (v31) {
          operator delete(v31);
        }
        unint64_t v5 = 0;
        *((void *)a1 + 1) = 0;
      }
    }
LABEL_59:
    if ((v5 & (v5 - 1)) != 0)
    {
      if (v4 >= v5) {
        unint64_t v2 = v4 % v5;
      }
      else {
        unint64_t v2 = v4;
      }
    }
    else
    {
      unint64_t v2 = (v5 - 1) & v4;
    }
  }
  v27 = *(void **)a1;
  v28 = *(void **)(*(void *)a1 + 8 * v2);
  if (v28)
  {
    void *i = *v28;
LABEL_72:
    void *v28 = i;
    goto LABEL_73;
  }
  void *i = *((void *)a1 + 2);
  *((void *)a1 + 2) = i;
  v27[v2] = a1 + 4;
  if (*i)
  {
    unint64_t v29 = *(void *)(*i + 8);
    if ((v5 & (v5 - 1)) != 0)
    {
      if (v29 >= v5) {
        v29 %= v5;
      }
    }
    else
    {
      v29 &= v5 - 1;
    }
    v28 = (void *)(*(void *)a1 + 8 * v29);
    goto LABEL_72;
  }
LABEL_73:
  ++*((void *)a1 + 3);
  return i + 3;
}

@end