uint64_t ktxHashList_DeleteEntry(uint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  result = 11;
  if (!a1 || !a2) {
    return result;
  }
  v4 = *(void *)(a2 + 40);
  if (!v4 && !*(void *)(a2 + 48))
  {
    free(**(void ***)(*a1 + 32));
    free(*(void **)(*a1 + 32));
    result = 0;
    *a1 = 0;
    return result;
  }
  v5 = *(void *)(*a1 + 32);
  v6 = *(void *)(v5 + 32);
  if (*(void *)(v5 + 24) - v6 != a2)
  {
    v7 = *(void *)(a2 + 48);
    if (v4) {
      goto LABEL_7;
    }
LABEL_18:
    *a1 = v7;
    v8 = a2 + 32;
    v9 = *(void *)(a2 + 48);
    if (!v9) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  *(void *)(v5 + 24) = v4 + v6;
  v7 = *(void *)(a2 + 48);
  if (!v4) {
    goto LABEL_18;
  }
LABEL_7:
  *(void *)(v4 + *(void *)(*(void *)(*a1 + 32) + 32) + 16) = v7;
  v7 = *a1;
  v8 = a2 + 32;
  v9 = *(void *)(a2 + 48);
  if (v9)
  {
LABEL_8:
    *(void *)(v9 + *(void *)(*(void *)(v7 + 32) + 32) + 8) = *(void *)(a2 + 40);
    v7 = *a1;
  }
LABEL_9:
  v10 = **(void **)(v7 + 32)
      + 16 * ((*(_DWORD *)(*(void *)(v7 + 32) + 8) - 1) & *(_DWORD *)(a2 + 84));
  --*(_DWORD *)(v10 + 8);
  if (*(void *)v10 == v8) {
    *(void *)v10 = *(void *)(a2 + 64);
  }
  v11 = *(void *)(a2 + 56);
  if (v11) {
    *(void *)(v11 + 32) = *(void *)(a2 + 64);
  }
  v12 = *(void *)(a2 + 64);
  if (v12) {
    *(void *)(v12 + 24) = v11;
  }
  result = 0;
  --*(_DWORD *)(*(void *)(*a1 + 32) + 16);
  return result;
}

uint64_t ktxHashList_FindEntry(uint64_t *a1, char *__s, void *a3)
{
  uint64_t result = 11;
  if (a1 && __s)
  {
    uint64_t v6 = *a1;
    if (*a1)
    {
      int v8 = -17973521;
      unsigned int v9 = -1640531527;
      unsigned int v10 = strlen(__s);
      unsigned int v11 = v10;
      if (v10 < 0xC)
      {
        int v14 = -1640531527;
        unsigned int v13 = v10;
        v12 = __s;
      }
      else
      {
        v12 = __s;
        unsigned int v13 = v10;
        int v14 = -1640531527;
        do
        {
          int v15 = v9 + v12[4] + (v12[5] << 8) + (v12[6] << 16) + (v12[7] << 24);
          unsigned int v16 = v8 + v12[8] + (v12[9] << 8) + (v12[10] << 16) + (v12[11] << 24);
          int v17 = (v14 + *v12 + (v12[1] << 8) + (v12[2] << 16) + (v12[3] << 24) - (v15 + v16)) ^ (v16 >> 13);
          unsigned int v18 = (v15 - v16 - v17) ^ (v17 << 8);
          unsigned int v19 = (v16 - v17 - v18) ^ (v18 >> 13);
          int v20 = (v17 - v18 - v19) ^ (v19 >> 12);
          unsigned int v21 = (v18 - v19 - v20) ^ (v20 << 16);
          unsigned int v22 = (v19 - v20 - v21) ^ (v21 >> 5);
          int v14 = (v20 - v21 - v22) ^ (v22 >> 3);
          unsigned int v9 = (v21 - v22 - v14) ^ (v14 << 10);
          int v8 = (v22 - v14 - v9) ^ (v9 >> 15);
          v12 += 12;
          v13 -= 12;
        }
        while (v13 > 0xB);
      }
      unsigned int v23 = v8 + v10;
      switch(v13)
      {
        case 1u:
          goto LABEL_20;
        case 2u:
          goto LABEL_19;
        case 3u:
          goto LABEL_18;
        case 4u:
          goto LABEL_17;
        case 5u:
          goto LABEL_16;
        case 6u:
          goto LABEL_15;
        case 7u:
          goto LABEL_14;
        case 8u:
          goto LABEL_13;
        case 9u:
          goto LABEL_12;
        case 0xAu:
          goto LABEL_11;
        case 0xBu:
          v23 += v12[10] << 24;
LABEL_11:
          v23 += v12[9] << 16;
LABEL_12:
          v23 += v12[8] << 8;
LABEL_13:
          v9 += v12[7] << 24;
LABEL_14:
          v9 += v12[6] << 16;
LABEL_15:
          v9 += v12[5] << 8;
LABEL_16:
          v9 += v12[4];
LABEL_17:
          v14 += v12[3] << 24;
LABEL_18:
          v14 += v12[2] << 16;
LABEL_19:
          v14 += v12[1] << 8;
LABEL_20:
          v14 += *v12;
          break;
        default:
          break;
      }
      int v24 = (v14 - v23 - v9) ^ (v23 >> 13);
      unsigned int v25 = (v9 - v23 - v24) ^ (v24 << 8);
      unsigned int v26 = (v23 - v24 - v25) ^ (v25 >> 13);
      int v27 = (v24 - v25 - v26) ^ (v26 >> 12);
      unsigned int v28 = (v25 - v26 - v27) ^ (v27 << 16);
      unsigned int v29 = (v26 - v27 - v28) ^ (v28 >> 5);
      int v30 = (v27 - v28 - v29) ^ (v29 >> 3);
      uint64_t v31 = *(void *)(v6 + 32);
      uint64_t v32 = *(void *)(*(void *)v31
                      + 16
                      * (((v29 - v30 - ((v28 - v29 - v30) ^ (v30 << 10))) ^ (((v28 - v29 - v30) ^ (v30 << 10)) >> 15)) & (*(_DWORD *)(v31 + 8) - 1)));
      if (v32)
      {
        uint64_t v33 = v32 - *(void *)(v31 + 32);
        if (*(_DWORD *)(v33 + 80) != v10) {
          goto LABEL_26;
        }
LABEL_25:
        uint64_t result = memcmp(*(const void **)(v33 + 72), __s, v11);
        if (!result)
        {
          *a3 = v33;
          return result;
        }
LABEL_26:
        while (1)
        {
          uint64_t v34 = *(void *)(v33 + 64);
          if (!v34) {
            break;
          }
          uint64_t v33 = v34 - *(void *)(v31 + 32);
          if (*(_DWORD *)(v33 + 80) == v11) {
            goto LABEL_25;
          }
        }
      }
    }
    return 12;
  }
  return result;
}

uint64_t ktxHashList_FindValue(uint64_t *a1, char *a2, _DWORD *a3, void *a4)
{
  uint64_t result = 11;
  if (a3)
  {
    if (a4)
    {
      uint64_t v10 = 0;
      uint64_t result = ktxHashList_FindEntry(a1, a2, &v10);
      if (!result)
      {
        uint64_t v8 = v10;
        *a3 = *(_DWORD *)(v10 + 16);
        if (*(_DWORD *)(v8 + 16)) {
          uint64_t v9 = *(void *)(v8 + 24);
        }
        else {
          uint64_t v9 = 0;
        }
        *a4 = v9;
      }
    }
  }
  return result;
}

uint64_t ktxHashListEntry_GetValue(uint64_t a1, _DWORD *a2, void *a3)
{
  uint64_t result = 11;
  if (a2 && a3)
  {
    *a2 = *(_DWORD *)(a1 + 16);
    if (*(_DWORD *)(a1 + 16)) {
      uint64_t v5 = *(void *)(a1 + 24);
    }
    else {
      uint64_t v5 = 0;
    }
    uint64_t result = 0;
    *a3 = v5;
  }
  return result;
}

uint64_t ktxHashList_Serialize(unsigned int **a1, _DWORD *a2, unsigned int **a3)
{
  uint64_t result = 11;
  if (a1 && a2 && a3)
  {
    int __src = 0;
    v7 = *a1;
    if (!*a1) {
      goto LABEL_15;
    }
    LODWORD(v8) = 0;
    do
    {
      size_t v8 = v8 + vcvts_n_u32_f32(ceilf((float)(*v7 + v7[4] + 4) * 0.25), 2uLL);
      v7 = (unsigned int *)*((void *)v7 + 6);
    }
    while (v7);
    if (v8)
    {
      uint64_t v9 = (unsigned int *)malloc_type_malloc(v8, 0x9EDD8534uLL);
      if (v9)
      {
        uint64_t v10 = v9;
        *a2 = v8;
        *a3 = v9;
        for (i = *a1; i; i = (unsigned int *)*((void *)i + 6))
        {
          unsigned int v15 = i[4] + *i;
          *uint64_t v10 = v15;
          unsigned int v16 = (char *)(v10 + 1);
          memcpy(v16, *((const void **)i + 1), *i);
          uint64_t v17 = *i;
          unsigned int v18 = &v16[v17];
          size_t v19 = i[4];
          if (v19)
          {
            memcpy(&v16[v17], *((const void **)i + 3), v19);
            uint64_t v12 = i[4];
          }
          else
          {
            uint64_t v12 = 0;
          }
          unsigned int v13 = &v18[v12];
          size_t v14 = (int)(float)-(float)((float)v15 - (float)(ceilf((float)v15 * 0.25) * 4.0));
          memcpy(v13, &__src, v14);
          uint64_t v10 = (unsigned int *)&v13[v14];
        }
        return 0;
      }
      else
      {
        return 13;
      }
    }
    else
    {
LABEL_15:
      uint64_t result = 0;
      *a2 = 0;
      *a3 = 0;
    }
  }
  return result;
}

uint64_t sort_by_key_codepoint(uint64_t a1, uint64_t a2)
{
  return strcmp(*(const char **)(a1 + 8), *(const char **)(a2 + 8));
}

uint64_t ktxHashList_Sort(uint64_t a1)
{
  if (!a1) {
    return 11;
  }
  if (*(void *)a1)
  {
    uint64_t v2 = *(void *)a1 + 32;
    for (int i = 1; ; i *= 2)
    {
      uint64_t v4 = 0;
      unsigned int v5 = 0;
      uint64_t v6 = v2;
      uint64_t v2 = 0;
      do
      {
        int v7 = 0;
        uint64_t v8 = v6;
        if (i)
        {
          while (1)
          {
            ++v7;
            uint64_t v9 = *(void *)(v8 + 16);
            if (!v9) {
              break;
            }
            uint64_t v8 = v9 + *(void *)(*(void *)(*(void *)a1 + 32) + 32);
            if (i == v7)
            {
              int v7 = i;
              goto LABEL_12;
            }
          }
          uint64_t v8 = 0;
        }
LABEL_12:
        ++v5;
        int v10 = i;
        while (1)
        {
          BOOL v12 = !v10 || v8 == 0;
          BOOL v13 = !v12;
          if (!v7) {
            break;
          }
          if (!v13)
          {
            uint64_t v19 = *(void *)(v6 + 16);
            if (v19) {
              uint64_t v16 = v19 + *(void *)(*(void *)(*(void *)a1 + 32) + 32);
            }
            else {
              uint64_t v16 = 0;
            }
LABEL_40:
            --v7;
            uint64_t v17 = v8;
            uint64_t v18 = v6;
            if (v4) {
              goto LABEL_13;
            }
            goto LABEL_41;
          }
          uint64_t v14 = *(void *)(*(void *)(*(void *)a1 + 32) + 32);
          if (strcmp(*(const char **)(v6 - v14 + 8), *(const char **)(v8 - v14 + 8)) <= 0)
          {
            uint64_t v15 = *(void *)(v6 + 16);
            uint64_t v16 = v15 + v14;
            if (!v15) {
              uint64_t v16 = 0;
            }
            goto LABEL_40;
          }
          uint64_t v20 = *(void *)(v8 + 16);
          if (v20) {
            uint64_t v17 = v20 + v14;
          }
          else {
            uint64_t v17 = 0;
          }
          --v10;
          uint64_t v16 = v6;
          uint64_t v18 = v8;
          if (v4) {
            goto LABEL_13;
          }
LABEL_41:
          uint64_t v11 = 0;
          uint64_t v2 = v18;
LABEL_14:
          *(void *)(v18 + 8) = v11;
          uint64_t v6 = v16;
          uint64_t v8 = v17;
          uint64_t v4 = v18;
        }
        if (v13)
        {
          uint64_t v17 = *(void *)(v8 + 16);
          if (v17) {
            v17 += *(void *)(*(void *)(*(void *)a1 + 32) + 32);
          }
          int v7 = 0;
          --v10;
          uint64_t v16 = v6;
          uint64_t v18 = v8;
          if (v4)
          {
LABEL_13:
            *(void *)(v4 + 16) = v18 - *(void *)(*(void *)(*(void *)a1 + 32) + 32);
            uint64_t v11 = v4 - *(void *)(*(void *)(*(void *)a1 + 32) + 32);
            goto LABEL_14;
          }
          goto LABEL_41;
        }
        uint64_t v6 = v8;
      }
      while (v8);
      *(void *)(v4 + 16) = 0;
      if (v5 <= 1)
      {
        uint64_t result = 0;
        *(void *)(*(void *)(*(void *)a1 + 32) + 24) = v4;
        *(void *)a1 = v2 - *(void *)(*(void *)(*(void *)a1 + 32) + 32);
        return result;
      }
    }
  }
  return 0;
}

uint64_t ktxHashList_Deserialize(void *a1, int a2, char *a3)
{
  uint64_t result = 11;
  if (a1)
  {
    if (a2)
    {
      int v6 = (int)a3;
      if (a3)
      {
        if (*a1)
        {
          return 10;
        }
        else
        {
          unint64_t v7 = (unint64_t)&a3[a2];
          uint64_t v8 = a3;
          while ((v6 - v8 + a2) >= 4)
          {
            unsigned int v9 = *(_DWORD *)v8;
            if (*(_DWORD *)v8 < 2u) {
              break;
            }
            int v10 = v8 + 4;
            int v11 = v6 - (v8 + 4);
            unsigned int v12 = v11 + a2;
            if (v9 > v11 + a2) {
              break;
            }
            unsigned int v13 = strnlen(v10, (v11 + a2)) + 1;
            if (v13 >= v12 || v9 <= v13) {
              break;
            }
            uint64_t result = ktxHashList_AddKVPair((uint64_t)a1, v10, v9 - v13, &v10[v13]);
            if (result) {
              return result;
            }
            LODWORD(v15) = vcvts_n_u32_f32(ceilf((float)v9 * 0.25), 2uLL);
            uint64_t v8 = &v10[v15];
            if ((unint64_t)v8 >= v7) {
              return 0;
            }
          }
          return 11;
        }
      }
    }
  }
  return result;
}

uint64_t ktxHashListEntry_GetKey(uint64_t a1, _DWORD *a2, void *a3)
{
  uint64_t result = 11;
  if (a2)
  {
    if (a3)
    {
      uint64_t result = 0;
      *a2 = *(_DWORD *)a1;
      *a3 = *(void *)(a1 + 8);
    }
  }
  return result;
}

uint64_t ktxMemStream_getdata(uint64_t a1, void *a2)
{
  uint64_t result = 11;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      *a2 = *(void *)(*(void *)(a1 + 64) + 8);
    }
  }
  return result;
}

uint64_t ktxMemStream_setup(uint64_t result)
{
  *(_DWORD *)(result + 56) = 2;
  *(void *)uint64_t result = ktxMemStream_read;
  *(void *)(result + 8) = ktxMemStream_skip;
  *(void *)(result + 16) = ktxMemStream_write;
  *(void *)(result + 24) = ktxMemStream_getpos;
  *(void *)(result + 32) = ktxMemStream_setpos;
  *(void *)(result + 40) = ktxMemStream_getsize;
  *(void *)(result + 48) = ktxMemStream_destruct;
  return result;
}

uint64_t ktxMemStream_read(uint64_t a1, void *__dst, size_t a3)
{
  if (!a1) {
    return 11;
  }
  v3 = *(uint64_t **)(a1 + 64);
  if (!v3) {
    return 11;
  }
  int64_t v4 = v3[4];
  size_t v5 = v4 + a3;
  if ((uint64_t)(v4 + a3) < v4) {
    return 7;
  }
  if (v3[3] < (unint64_t)v5) {
    return 7;
  }
  uint64_t v7 = *v3;
  if (!*v3) {
    uint64_t v7 = v3[1];
  }
  memcpy(__dst, (const void *)(v7 + v4), a3);
  uint64_t result = 0;
  v3[4] = v5;
  return result;
}

uint64_t ktxMemStream_skip(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return 11;
  }
  uint64_t v2 = *(void *)(a1 + 64);
  if (!v2) {
    return 11;
  }
  uint64_t v3 = *(void *)(v2 + 32);
  uint64_t v4 = v3 + a2;
  if (v3 + a2 < v3) {
    return 7;
  }
  if (*(void *)(v2 + 24) < (unint64_t)v4) {
    return 7;
  }
  uint64_t result = 0;
  *(void *)(v2 + 32) = v4;
  return result;
}

uint64_t ktxMemStream_write(uint64_t a1, void *__src, uint64_t a3, uint64_t a4)
{
  if (!a1) {
    return 11;
  }
  uint64_t v4 = *(void **)(a1 + 64);
  if (!v4) {
    return 11;
  }
  if (*v4) {
    return 10;
  }
  int64_t v6 = v4[4];
  size_t v7 = a4 * a3;
  unint64_t v8 = v6 + a4 * a3;
  if ((uint64_t)v8 < v6) {
    return 4;
  }
  unint64_t v10 = v4[2];
  if (v10 < v8)
  {
    if (v10) {
      int64_t v11 = v4[2];
    }
    else {
      int64_t v11 = 256;
    }
    if (v11 < v8)
    {
      do
      {
        BOOL v12 = v11 < 0;
        v11 *= 2;
        if (v12) {
          unint64_t v13 = -1;
        }
        else {
          unint64_t v13 = v11;
        }
      }
      while (v13 < v8);
      int64_t v11 = v13;
    }
    if (v11 != v10)
    {
      uint64_t v14 = (void *)v4[1];
      if (v14) {
        uint64_t v15 = malloc_type_realloc(v14, v11, 0xA652DA65uLL);
      }
      else {
        uint64_t v15 = malloc_type_malloc(v11, 0x96CBAE37uLL);
      }
      v4[1] = v15;
      if (!v15)
      {
        v4[2] = 0;
        v4[3] = 0;
        return 13;
      }
      v4[2] = v11;
      int64_t v6 = v4[4];
    }
  }
  memcpy((void *)(v4[1] + v6), __src, v7);
  int64_t v16 = v4[3];
  int64_t v17 = v4[4] + v7;
  v4[4] = v17;
  uint64_t result = 0;
  if (v17 > v16) {
    v4[3] = v17;
  }
  return result;
}

uint64_t ktxMemStream_getpos(uint64_t a1, void *a2)
{
  uint64_t result = 11;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      *a2 = *(void *)(*(void *)(a1 + 64) + 32);
    }
  }
  return result;
}

uint64_t ktxMemStream_setpos(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return 11;
  }
  uint64_t v2 = *(void *)(a1 + 64);
  if (*(void *)(v2 + 16) < a2) {
    return 10;
  }
  uint64_t result = 0;
  *(void *)(v2 + 32) = a2;
  return result;
}

uint64_t ktxMemStream_getsize(uint64_t a1, void *a2)
{
  uint64_t result = 11;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      *a2 = *(void *)(*(void *)(a1 + 64) + 24);
    }
  }
  return result;
}

void ktxMemStream_destruct(uint64_t a1)
{
  uint64_t v2 = *(void ***)(a1 + 64);
  if (*(unsigned char *)(a1 + 96)) {
    free(v2[1]);
  }
  free(v2);
  *(void *)(a1 + 64) = 0;
}

uint64_t ktxMemStream_construct(uint64_t a1, char a2)
{
  if (!a1) {
    return 11;
  }
  uint64_t v4 = (char *)malloc_type_malloc(0x28uLL, 0x105004059AC37B4uLL);
  if (!v4) {
    return 13;
  }
  size_t v5 = v4;
  *((_OWORD *)v4 + 1) = 0u;
  int64_t v6 = v4 + 16;
  *((void *)v4 + 4) = 0;
  *(_OWORD *)uint64_t v4 = 0u;
  size_t v7 = malloc_type_malloc(0x100uLL, 0x96CBAE37uLL);
  *((void *)v5 + 1) = v7;
  if (v7)
  {
    uint64_t result = 0;
    *((void *)v5 + 2) = 256;
    *(void *)(a1 + 64) = v5;
    *(_DWORD *)(a1 + 56) = 2;
    *(void *)a1 = ktxMemStream_read;
    *(void *)(a1 + 8) = ktxMemStream_skip;
    *(void *)(a1 + 16) = ktxMemStream_write;
    *(void *)(a1 + 24) = ktxMemStream_getpos;
    *(void *)(a1 + 32) = ktxMemStream_setpos;
    *(void *)(a1 + 40) = ktxMemStream_getsize;
    *(void *)(a1 + 48) = ktxMemStream_destruct;
    *(unsigned char *)(a1 + 96) = a2;
  }
  else
  {
    *int64_t v6 = 0;
    v6[1] = 0;
    return 13;
  }
  return result;
}

uint64_t ktxMemStream_construct_ro(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = 11;
  if (a1 && a2 && a3)
  {
    size_t v7 = malloc_type_malloc(0x28uLL, 0x105004059AC37B4uLL);
    if (v7)
    {
      unint64_t v8 = v7;
      uint64_t result = 0;
      v8[3] = a3;
      v8[4] = 0;
      *unint64_t v8 = a2;
      v8[1] = 0;
      v8[2] = a3;
      *(void *)(a1 + 64) = v8;
      *(_DWORD *)(a1 + 56) = 2;
      *(void *)a1 = ktxMemStream_read;
      *(void *)(a1 + 8) = ktxMemStream_skip;
      *(void *)(a1 + 16) = ktxMemStream_write;
      *(void *)(a1 + 24) = ktxMemStream_getpos;
      *(void *)(a1 + 32) = ktxMemStream_setpos;
      *(void *)(a1 + 40) = ktxMemStream_getsize;
      *(void *)(a1 + 48) = ktxMemStream_destruct;
      *(unsigned char *)(a1 + 96) = 0;
    }
    else
    {
      return 13;
    }
  }
  return result;
}

int8x16_t *_ktxSwapEndian16(int8x16_t *result, unint64_t a2)
{
  if (a2)
  {
    if (a2 < 0x10)
    {
      unint64_t v2 = 0;
      uint64_t v3 = result;
LABEL_7:
      unint64_t v7 = a2 - v2;
      do
      {
        v3->i16[0] = bswap32(v3->u16[0]) >> 16;
        uint64_t v3 = (int8x16_t *)((char *)v3 + 2);
        --v7;
      }
      while (v7);
      return result;
    }
    unint64_t v2 = a2 & 0xFFFFFFFFFFFFFFF0;
    uint64_t v3 = (int8x16_t *)((char *)result + 2 * (a2 & 0xFFFFFFFFFFFFFFF0));
    uint64_t v4 = result + 1;
    unint64_t v5 = a2 & 0xFFFFFFFFFFFFFFF0;
    do
    {
      int8x16_t v6 = vrev16q_s8(*v4);
      v4[-1] = vrev16q_s8(v4[-1]);
      *uint64_t v4 = v6;
      v4 += 2;
      v5 -= 16;
    }
    while (v5);
    if (v2 != a2) {
      goto LABEL_7;
    }
  }
  return result;
}

int8x16_t *_ktxSwapEndian32(int8x16_t *result, unint64_t a2)
{
  if (a2)
  {
    if (a2 < 8)
    {
      unint64_t v2 = 0;
      uint64_t v3 = (unsigned int *)result;
LABEL_7:
      unint64_t v7 = a2 - v2;
      do
      {
        unsigned int *v3 = bswap32(*v3);
        ++v3;
        --v7;
      }
      while (v7);
      return result;
    }
    unint64_t v2 = a2 & 0xFFFFFFFFFFFFFFF8;
    uint64_t v3 = (unsigned int *)result + (a2 & 0xFFFFFFFFFFFFFFF8);
    uint64_t v4 = result + 1;
    unint64_t v5 = a2 & 0xFFFFFFFFFFFFFFF8;
    do
    {
      int8x16_t v6 = vrev32q_s8(*v4);
      v4[-1] = vrev32q_s8(v4[-1]);
      *uint64_t v4 = v6;
      v4 += 2;
      v5 -= 8;
    }
    while (v5);
    if (v2 != a2) {
      goto LABEL_7;
    }
  }
  return result;
}

int8x16_t *_ktxSwapEndian64(int8x16_t *result, unint64_t a2)
{
  if (a2)
  {
    if (a2 < 4)
    {
      unint64_t v2 = 0;
      uint64_t v3 = (uint64_t *)result;
LABEL_7:
      unint64_t v8 = a2 - v2;
      do
      {
        uint64_t *v3 = bswap64(*v3 & 0xFF00FFFFFFFFFFFFLL);
        ++v3;
        --v8;
      }
      while (v8);
      return result;
    }
    unint64_t v2 = a2 & 0xFFFFFFFFFFFFFFFCLL;
    uint64_t v3 = &result->i64[a2 & 0xFFFFFFFFFFFFFFFCLL];
    uint64_t v4 = result + 1;
    v5.i64[0] = 0xFF00FFFFFFFFFFFFLL;
    v5.i64[1] = 0xFF00FFFFFFFFFFFFLL;
    unint64_t v6 = a2 & 0xFFFFFFFFFFFFFFFCLL;
    do
    {
      int8x16_t v7 = vrev64q_s8(vandq_s8(*v4, v5));
      v4[-1] = vrev64q_s8(vandq_s8(v4[-1], v5));
      *uint64_t v4 = v7;
      v4 += 2;
      v6 -= 4;
    }
    while (v6);
    if (v2 != a2) {
      goto LABEL_7;
    }
  }
  return result;
}

uint64_t ktxTexture_construct(uint64_t a1, uint64_t a2, long long *a3)
{
  *(void *)(a1 + 112) = 0;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  unint64_t v6 = (char *)malloc_type_malloc(0xA8uLL, 0x10A2040785DE303uLL);
  *(void *)(a1 + 24) = v6;
  if (!v6) {
    return 13;
  }
  *((void *)v6 + 20) = 0;
  *((_OWORD *)v6 + 8) = 0u;
  *((_OWORD *)v6 + 9) = 0u;
  *((_OWORD *)v6 + 6) = 0u;
  *((_OWORD *)v6 + 7) = 0u;
  *((_OWORD *)v6 + 4) = 0u;
  *((_OWORD *)v6 + 5) = 0u;
  *((_OWORD *)v6 + 2) = 0u;
  *((_OWORD *)v6 + 3) = 0u;
  *(_OWORD *)unint64_t v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  long long v7 = *a3;
  *(_OWORD *)(v6 + 40) = a3[1];
  *(_OWORD *)(v6 + 24) = v7;
  *(unsigned char *)(a1 + 34) = (*(unsigned char *)a3 & 2) != 0;
  *(void *)(a1 + 64) = 0x6400000072;
  *(_DWORD *)(a1 + 72) = 111;
  int v8 = *(_DWORD *)(a2 + 28);
  if ((v8 - 4) < 0xFFFFFFFD) {
    return 11;
  }
  unsigned int v10 = *(_DWORD *)(a2 + 16);
  if (!v10) {
    return 11;
  }
  unsigned int v11 = *(_DWORD *)(a2 + 20);
  if (!v11) {
    return 11;
  }
  unsigned int v12 = *(_DWORD *)(a2 + 24);
  if (!v12) {
    return 11;
  }
  if (v8 == 3)
  {
    if (*(unsigned char *)(a2 + 44) || *(_DWORD *)(a2 + 40) != 1 || *(_DWORD *)(a2 + 36) != 1) {
      return 10;
    }
  }
  else if (v8 == 2)
  {
    if (v12 > 1) {
      return 10;
    }
  }
  else if (v8 == 1 && (v12 | v11) >= 2)
  {
    return 10;
  }
  *(_DWORD *)(a1 + 44) = v12;
  *(_DWORD *)(a1 + 48) = v8;
  *(_DWORD *)(a1 + 36) = v10;
  *(_DWORD *)(a1 + 40) = v11;
  int v13 = *(_DWORD *)(a2 + 36);
  if (!v13) {
    return 11;
  }
  *(_DWORD *)(a1 + 56) = v13;
  int v14 = *(_DWORD *)(a2 + 40);
  if (v14 == 1)
  {
LABEL_26:
    *(_DWORD *)(a1 + 60) = v14;
    int v15 = *(_DWORD *)(a2 + 32);
    if (v15)
    {
      *(_DWORD *)(a1 + 52) = v15;
      *(unsigned char *)(a1 + 35) = *(unsigned char *)(a2 + 45);
      int v16 = v15 - 1;
      if (!v16) {
        goto LABEL_33;
      }
      if (v10 <= v11) {
        unsigned int v10 = v11;
      }
      if (v10 <= v12) {
        unsigned int v10 = v12;
      }
      if (v10 >> v16)
      {
LABEL_33:
        *(_DWORD *)(a1 + 56) = v13;
        *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 44);
        ktxHashList_Construct((void *)(a1 + 80));
        return 0;
      }
      return 10;
    }
    return 11;
  }
  if (v14 != 6) {
    return 11;
  }
  uint64_t result = 10;
  if (v8 == 2 && v10 == v11)
  {
    *(unsigned char *)(a1 + 33) = 1;
    goto LABEL_26;
  }
  return result;
}

uint64_t ktxTexture_constructFromStream(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = malloc_type_malloc(0xA8uLL, 0x10A2040785DE303uLL);
  *(void *)(a1 + 24) = v4;
  long long v6 = *(_OWORD *)(a2 + 16);
  long long v5 = *(_OWORD *)(a2 + 32);
  v4[4] = *(_OWORD *)a2;
  v4[5] = v6;
  v4[6] = v5;
  long long v8 = *(_OWORD *)(a2 + 64);
  long long v7 = *(_OWORD *)(a2 + 80);
  long long v9 = *(_OWORD *)(a2 + 48);
  *((void *)v4 + 20) = *(void *)(a2 + 96);
  v4[8] = v8;
  v4[9] = v7;
  v4[7] = v9;
  *(void *)(a1 + 64) = 0x6400000072;
  *(_DWORD *)(a1 + 72) = 111;
  return 0;
}

void ktxTexture_destruct(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  long long v3 = *(_OWORD *)(v2 + 144);
  long long v10 = *(_OWORD *)(v2 + 128);
  long long v11 = v3;
  uint64_t v12 = *(void *)(v2 + 160);
  long long v4 = *(_OWORD *)(v2 + 80);
  v8[0] = *(_OWORD *)(v2 + 64);
  v8[1] = v4;
  long long v5 = *(_OWORD *)(v2 + 112);
  v8[2] = *(_OWORD *)(v2 + 96);
  long long v9 = v5;
  if ((void)v10) {
    ((void (*)(_OWORD *))v9)(v8);
  }
  if (*(void *)(a1 + 80)) {
    ktxHashList_Destruct((uint64_t *)(a1 + 80));
  }
  long long v6 = *(void **)(a1 + 96);
  if (v6) {
    free(v6);
  }
  long long v7 = *(void **)(a1 + 112);
  if (v7) {
    free(v7);
  }
  free(*(void **)(a1 + 24));
}

uint64_t ktxTexture_CreateFromStream(uint64_t (**a1)(void, int8x16_t *, uint64_t), char a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  memset(&v13, 0, 80);
  uint64_t v6 = (*a1)(a1, &v13, 12);
  if (!v6)
  {
    if (v13.i64[0] == 0xBB31312058544BABLL && v13.i32[2] == 169478669)
    {
      uint64_t v6 = (*a1)(a1, (int8x16_t *)((unint64_t)&v13 | 0xC), 52);
      if (v6) {
        return v6;
      }
      long long v10 = malloc_type_malloc(0x90uLL, 0x10300406A34F8ACuLL);
      if (v10)
      {
        long long v11 = v10;
        v10[7] = 0u;
        v10[8] = 0u;
        v10[5] = 0u;
        v10[6] = 0u;
        v10[3] = 0u;
        v10[4] = 0u;
        v10[1] = 0u;
        v10[2] = 0u;
        *long long v10 = 0u;
        uint64_t v6 = ktxTexture1_constructFromStreamAndHeader((uint64_t)v10, (uint64_t)a1, &v13, a2);
        if (!v6)
        {
LABEL_16:
          *a3 = v11;
          return v6;
        }
LABEL_15:
        free(v11);
        long long v11 = 0;
        goto LABEL_16;
      }
    }
    else
    {
      if (v13.i64[0] != 0xBB30322058544BABLL || v13.u32[2] != 169478669) {
        return 15;
      }
      uint64_t v6 = (*a1)(a1, (int8x16_t *)((unint64_t)&v13 | 0xC), 68);
      if (v6) {
        return v6;
      }
      uint64_t v12 = malloc_type_malloc(0xA8uLL, 0x1030040B443E594uLL);
      if (v12)
      {
        long long v11 = v12;
        *((void *)v12 + 20) = 0;
        v12[8] = 0u;
        v12[9] = 0u;
        v12[6] = 0u;
        v12[7] = 0u;
        v12[4] = 0u;
        v12[5] = 0u;
        v12[2] = 0u;
        v12[3] = 0u;
        _OWORD *v12 = 0u;
        v12[1] = 0u;
        uint64_t v6 = ktxTexture2_constructFromStreamAndHeader((uint64_t)v12, (uint64_t)a1, (uint64_t)&v13, a2);
        if (!v6) {
          goto LABEL_16;
        }
        goto LABEL_15;
      }
    }
    return 13;
  }
  return v6;
}

uint64_t ktxTexture_CreateFromStdioStream(uint64_t a1, char a2, void *a3)
{
  uint64_t result = 11;
  if (a1 && a3)
  {
    uint64_t v8 = 0;
    memset(v7, 0, sizeof(v7));
    uint64_t result = ktxFileStream_construct((uint64_t)v7, a1, 0);
    if (!result) {
      return ktxTexture_CreateFromStream((uint64_t (**)(void, int8x16_t *, uint64_t))v7, a2, a3);
    }
  }
  return result;
}

uint64_t ktxTexture_CreateFromNamedFile(char *__filename, char a2, void *a3)
{
  uint64_t result = 11;
  if (__filename && a3)
  {
    long long v7 = fopen(__filename, "rb");
    if (v7)
    {
      uint64_t v9 = 0;
      memset(v8, 0, sizeof(v8));
      uint64_t result = ktxFileStream_construct((uint64_t)v8, (uint64_t)v7, 1);
      if (!result) {
        return ktxTexture_CreateFromStream((uint64_t (**)(void, int8x16_t *, uint64_t))v8, a2, a3);
      }
    }
    else
    {
      return 3;
    }
  }
  return result;
}

uint64_t ktxTexture_CreateFromMemory(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  uint64_t result = 11;
  if (a2 && a1 && a4)
  {
    uint64_t v10 = 0;
    memset(v9, 0, sizeof(v9));
    uint64_t result = ktxMemStream_construct_ro((uint64_t)v9, a1, a2);
    if (!result) {
      return ktxTexture_CreateFromStream((uint64_t (**)(void, int8x16_t *, uint64_t))v9, a3, a4);
    }
  }
  return result;
}

uint64_t ktxTexture_GetData(uint64_t a1)
{
  return *(void *)(a1 + 112);
}

uint64_t ktxTexture_GetDataSize(uint64_t a1)
{
  return *(void *)(a1 + 104);
}

uint64_t ktxTexture_GetElementSize(uint64_t a1)
{
  return *(_DWORD *)(*(void *)(a1 + 24) + 32) >> 3;
}

uint64_t ktxTexture_calcImageSize(uint64_t a1, char a2, int a3)
{
  uint64_t v3 = *(void *)(a1 + 24);
  unsigned int v4 = vcvtps_u32_f32((float)(*(_DWORD *)(a1 + 36) >> a2) / (float)*(unsigned int *)(v3 + 36));
  unsigned int v5 = *(_DWORD *)(v3 + 48);
  if (v5 > v4) {
    unsigned int v4 = *(_DWORD *)(v3 + 48);
  }
  unsigned int v6 = v4 * (*(_DWORD *)(v3 + 32) >> 3);
  if ((*(unsigned char *)(v3 + 24) & 2) == 0 && a3 == 1) {
    v6 += (float)-(float)((float)v6 - (float)(ceilf((float)v6 * 0.25) * 4.0));
  }
  unsigned int v7 = vcvtps_u32_f32((float)(*(_DWORD *)(a1 + 40) >> a2) / (float)*(unsigned int *)(v3 + 40));
  if (v5 > v7) {
    unsigned int v7 = *(_DWORD *)(v3 + 48);
  }
  return v6 * v7;
}

uint64_t ktxTexture_IterateLevelFaces(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), uint64_t a3)
{
  uint64_t v3 = 11;
  if (a1 && a2)
  {
    if (*(_DWORD *)(a1 + 52))
    {
      uint64_t v3 = 0;
      uint64_t v6 = 0;
      while (1)
      {
        unsigned int v7 = *(_DWORD *)(a1 + 40);
        unsigned int v8 = *(_DWORD *)(a1 + 36) >> v6;
        uint64_t v9 = v8 <= 1 ? 1 : v8;
        uint64_t v10 = v7 >> v6 <= 1 ? 1 : v7 >> v6;
        unsigned int v11 = *(_DWORD *)(a1 + 44) >> v6;
        uint64_t v12 = v11 <= 1 ? 1 : v11;
        unsigned int v13 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 + 24) + 8))(a1, v6);
        if (!*(unsigned char *)(a1 + 33) || *(unsigned char *)(a1 + 32)) {
          break;
        }
        int v14 = *(_DWORD *)(a1 + 60);
        if (v14) {
          goto LABEL_19;
        }
LABEL_6:
        uint64_t v6 = (v6 + 1);
        if (v6 >= *(_DWORD *)(a1 + 52)) {
          return v3;
        }
      }
      int v14 = 1;
LABEL_19:
      uint64_t v15 = 0;
      uint64_t v16 = v13;
      do
      {
        uint64_t v20 = 0;
        (*(void (**)(uint64_t, uint64_t, void, uint64_t, uint64_t *))(*(void *)(a1 + 8) + 8))(a1, v6, 0, v15, &v20);
        uint64_t v17 = a2(v6, v15, v9, v10, v12, v16, *(void *)(a1 + 112) + v20, a3);
        if (v17)
        {
          uint64_t v3 = v17;
          goto LABEL_6;
        }
        uint64_t v15 = (v15 + 1);
      }
      while (v14 != v15);
      uint64_t v3 = 0;
      goto LABEL_6;
    }
    return 0;
  }
  return v3;
}

unint64_t ktxTexture_layerSize(uint64_t a1, char a2, int a3)
{
  uint64_t v3 = *(_DWORD **)(a1 + 24);
  unsigned int v4 = vcvtps_u32_f32((float)(*(_DWORD *)(a1 + 36) >> a2) / (float)v3[9]);
  unsigned int v5 = v3[12];
  if (v5 > v4) {
    unsigned int v4 = v3[12];
  }
  unsigned int v6 = v4 * (v3[8] >> 3);
  if (a3 == 1 && (v3[6] & 2) == 0) {
    v6 += (float)-(float)((float)v6 - (float)(ceilf((float)v6 * 0.25) * 4.0));
  }
  LODWORD(v7) = (*(_DWORD *)(a1 + 44) / v3[11]) >> a2;
  if (v7 <= 1) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = v7;
  }
  unsigned int v8 = vcvtps_u32_f32((float)(*(_DWORD *)(a1 + 40) >> a2) / (float)v3[10]);
  if (v5 > v8) {
    unsigned int v8 = v3[12];
  }
  return *(unsigned int *)(a1 + 60) * (unint64_t)(v6 * v8) * v7;
}

unint64_t ktxTexture_calcLevelSize(uint64_t a1, char a2, int a3)
{
  uint64_t v3 = *(_DWORD **)(a1 + 24);
  unsigned int v4 = vcvtps_u32_f32((float)(*(_DWORD *)(a1 + 36) >> a2) / (float)v3[9]);
  unsigned int v5 = v3[12];
  if (v5 > v4) {
    unsigned int v4 = v3[12];
  }
  unsigned int v6 = v4 * (v3[8] >> 3);
  if (a3 == 1 && (v3[6] & 2) == 0) {
    v6 += (float)-(float)((float)v6 - (float)(ceilf((float)v6 * 0.25) * 4.0));
  }
  LODWORD(v7) = (*(_DWORD *)(a1 + 44) / v3[11]) >> a2;
  if (v7 <= 1) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = v7;
  }
  unsigned int v8 = vcvtps_u32_f32((float)(*(_DWORD *)(a1 + 40) >> a2) / (float)v3[10]);
  if (v5 > v8) {
    unsigned int v8 = v3[12];
  }
  return *(unsigned int *)(a1 + 60) * (unint64_t)(v6 * v8) * v7 * *(unsigned int *)(a1 + 56);
}

unint64_t ktxTexture_doCalcFaceLodSize(uint64_t a1, char a2, int a3)
{
  if (*(unsigned char *)(a1 + 33) && !*(unsigned char *)(a1 + 32))
  {
    uint64_t v10 = *(_DWORD **)(a1 + 24);
    unsigned int v11 = vcvtps_u32_f32((float)(*(_DWORD *)(a1 + 36) >> a2) / (float)v10[9]);
    unsigned int v12 = v10[12];
    if (v12 > v11) {
      unsigned int v11 = v10[12];
    }
    unsigned int v13 = v11 * (v10[8] >> 3);
    if (a3 == 1 && (v10[6] & 2) == 0) {
      v13 += (float)-(float)((float)v13 - (float)(ceilf((float)v13 * 0.25) * 4.0));
    }
    unsigned int v14 = vcvtps_u32_f32((float)(*(_DWORD *)(a1 + 40) >> a2) / (float)v10[10]);
    if (v12 > v14) {
      unsigned int v14 = v10[12];
    }
    return v13 * v14;
  }
  else
  {
    uint64_t v3 = *(_DWORD **)(a1 + 24);
    unsigned int v4 = vcvtps_u32_f32((float)(*(_DWORD *)(a1 + 36) >> a2) / (float)v3[9]);
    unsigned int v5 = v3[12];
    if (v5 > v4) {
      unsigned int v4 = v3[12];
    }
    unsigned int v6 = v4 * (v3[8] >> 3);
    if (a3 == 1 && (v3[6] & 2) == 0) {
      v6 += (float)-(float)((float)v6 - (float)(ceilf((float)v6 * 0.25) * 4.0));
    }
    LODWORD(v7) = (*(_DWORD *)(a1 + 44) / v3[11]) >> a2;
    if (v7 <= 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = v7;
    }
    unsigned int v8 = vcvtps_u32_f32((float)(*(_DWORD *)(a1 + 40) >> a2) / (float)v3[10]);
    if (v5 > v8) {
      unsigned int v8 = v3[12];
    }
    return *(unsigned int *)(a1 + 60) * (unint64_t)(v6 * v8) * v7 * *(unsigned int *)(a1 + 56);
  }
}

uint64_t ktxTexture_calcDataSizeTexture(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t, void))(a1 + 24))(a1, *(unsigned int *)(a1 + 52));
}

float ktxTexture_rowInfo(uint64_t a1, char a2, unsigned int *a3, _DWORD *a4, _DWORD *a5)
{
  unsigned int v5 = *(_DWORD **)(a1 + 24);
  unsigned int v6 = (*(_DWORD *)(a1 + 36) / v5[9]) >> a2;
  if (v6 <= 1) {
    unsigned int v6 = 1;
  }
  unsigned int v7 = (*(_DWORD *)(a1 + 40) / v5[10]) >> a2;
  if (v7 <= 1) {
    unsigned int v7 = 1;
  }
  *a3 = v7;
  unsigned int v8 = (v5[8] * v6) >> 3;
  float result = -(float)((float)v8 - (float)(ceilf((float)v8 * 0.25) * 4.0));
  *a4 = v8 + result;
  *a5 = result;
  return result;
}

uint64_t ktxTexture_GetRowPitch(uint64_t a1, char a2)
{
  unsigned int v2 = (*(_DWORD *)(a1 + 36) / *(_DWORD *)(*(void *)(a1 + 24) + 36)) >> a2;
  if (v2 <= 1) {
    unsigned int v2 = 1;
  }
  return ((v2 * *(_DWORD *)(*(void *)(a1 + 24) + 32)) >> 3)
       + (float)-(float)((float)((v2 * *(_DWORD *)(*(void *)(a1 + 24) + 32)) >> 3)
                                     - (float)(ceilf((float)((v2 * *(_DWORD *)(*(void *)(a1 + 24) + 32)) >> 3) * 0.25)
                                             * 4.0));
}

BOOL ktxTexture_isActiveStream(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 24) + 128) != 0;
}

uint64_t ktxTexture1_constructFromStreamAndHeader(uint64_t a1, uint64_t a2, int8x16_t *a3, char a4)
{
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  uint64_t ImageData = ktxTexture_constructFromStream(a1, a2);
  if (ImageData) {
    return ImageData;
  }
  *(_DWORD *)a1 = 1;
  *(void *)(a1 + 8) = ktxTexture1_vtbl;
  uint64_t v8 = *(void *)(a1 + 24);
  long long v9 = ktxTexture1_vtblInt;
  *(uint64_t (**)())(v8 + 16) = off_1EC1279D0[0];
  *(_OWORD *)uint64_t v8 = v9;
  uint64_t v10 = malloc_type_malloc(1uLL, 0x100004077774924uLL);
  *(void *)(a1 + 136) = v10;
  if (!v10)
  {
    ktxTexture_destruct(a1);
    return 13;
  }
  int v36 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = 0;
  long long v32 = 0u;
  long long v33 = 0u;
  *uint64_t v10 = 0;
  unsigned int v11 = *(unsigned char **)(a1 + 136);
  uint64_t v12 = *(void *)(a1 + 24);
  uint64_t ImageData = ktxCheckHeader1_(a3, (uint64_t)&v36);
  if (ImageData) {
    goto LABEL_4;
  }
  *(_DWORD *)(a1 + 120) = a3[1].i32[2];
  int v15 = a3[1].i32[3];
  *(_DWORD *)(a1 + 124) = v15;
  *(_DWORD *)(a1 + 132) = a3[1].i32[0];
  glGetFormatSize(v15, (uint64_t)&v32);
  if (!DWORD2(v32))
  {
    uint64_t ImageData = 16;
    goto LABEL_4;
  }
  uint64_t v16 = *(void *)(a1 + 24);
  long long v17 = v33;
  *(_OWORD *)(v16 + 24) = v32;
  *(_OWORD *)(v16 + 40) = v17;
  *(_DWORD *)(a1 + 128) = a3[2].i32[0];
  int v18 = HIWORD(v36);
  *(_DWORD *)(a1 + 48) = HIWORD(v36);
  *(_DWORD *)(a1 + 36) = a3[2].i32[1];
  if (v18 == 3)
  {
    uint64_t v19 = a3[2].i64[1];
LABEL_16:
    *(void *)(a1 + 40) = v19;
    goto LABEL_18;
  }
  if (v18 != 2)
  {
    if (v18 != 1) {
      goto LABEL_18;
    }
    uint64_t v19 = 0x100000001;
    goto LABEL_16;
  }
  *(_DWORD *)(a1 + 40) = a3[2].i32[2];
  *(_DWORD *)(a1 + 44) = 1;
LABEL_18:
  unsigned int v20 = a3[3].u32[0];
  BOOL v21 = v20 != 0;
  if (v20 <= 1) {
    unsigned int v20 = 1;
  }
  *(_DWORD *)(a1 + 56) = v20;
  *(unsigned char *)(a1 + 32) = v21;
  __int32 v22 = a3[3].i32[1];
  *(_DWORD *)(a1 + 60) = v22;
  *(unsigned char *)(a1 + 33) = v22 == 6;
  *(_DWORD *)(a1 + 52) = a3[3].i32[2];
  *(unsigned char *)(a1 + 34) = (_BYTE)v36 != 0;
  *(unsigned char *)(a1 + 35) = BYTE1(v36) != 0;
  if (a3->i32[3] == 16909060) {
    *unsigned int v11 = 1;
  }
  *(_DWORD *)(*(void *)(a1 + 24) + 56) = a3[1].i32[1];
  ktxHashList_Construct((void *)(a1 + 80));
  size_t v23 = a3[3].u32[3];
  if (!v23) {
    goto LABEL_40;
  }
  if ((a4 & 4) != 0)
  {
    (*(void (**)(uint64_t, size_t))(v12 + 72))(v12 + 64, v23);
    goto LABEL_40;
  }
  int v24 = (char *)malloc_type_malloc(v23, 0x61F0112CuLL);
  if (!v24)
  {
    uint64_t ImageData = 13;
    goto LABEL_4;
  }
  unsigned int v25 = v24;
  uint64_t ImageData = (*(uint64_t (**)(uint64_t, char *, size_t))(v12 + 64))(v12 + 64, v24, v23);
  if (!ImageData)
  {
    if (*v11)
    {
      unsigned int v26 = (int8x16_t *)v25;
      do
      {
        _ktxSwapEndian32(v26, 1uLL);
        LODWORD(v27) = vcvts_n_u32_f32(ceilf((float)v26->u32[0] * 0.25), 2uLL);
        unsigned int v26 = (int8x16_t *)((char *)v26 + v27);
      }
      while (v26 < (int8x16_t *)&v25[v23]);
    }
    if ((a4 & 2) != 0)
    {
      *(_DWORD *)(a1 + 88) = v23;
      *(void *)(a1 + 96) = v25;
      uint64_t ImageData = (*(uint64_t (**)(uint64_t, uint64_t *))(v12 + 104))(v12 + 64, &v34);
      if (ImageData) {
        goto LABEL_4;
      }
      goto LABEL_41;
    }
    uint64_t v31 = 0;
    int v30 = 0;
    uint64_t ImageData = ktxHashList_Deserialize((void *)(a1 + 80), v23, v25);
    free(v25);
    if (ImageData) {
      goto LABEL_4;
    }
    if (!ktxHashList_FindValue((uint64_t *)(a1 + 80), "KTXorientation", &v30, &v31))
    {
      int v29 = 0;
      sscanf(v31, "S=%c,T=%c,R=%c", &v29, (char *)&v29 + 1, (char *)&v29 + 2);
      int v28 = *(_DWORD *)(a1 + 48);
      switch(v28)
      {
        case 1:
          goto LABEL_37;
        case 2:
LABEL_36:
          *(_DWORD *)(a1 + 68) = SBYTE1(v29);
LABEL_37:
          *(_DWORD *)(a1 + 64) = (char)v29;
          uint64_t ImageData = (*(uint64_t (**)(uint64_t, uint64_t *))(v12 + 104))(v12 + 64, &v34);
          if (ImageData) {
            goto LABEL_4;
          }
LABEL_41:
          uint64_t ImageData = (*(uint64_t (**)(uint64_t, uint64_t *))(v12 + 88))(v12 + 64, &v35);
          if (!ImageData)
          {
            *(void *)(a1 + 104) = v34 - (v35 + 4 * *(unsigned int *)(a1 + 52));
            if ((a4 & 1) == 0) {
              return 0;
            }
            uint64_t ImageData = ktxTexture1_LoadImageData(a1, 0, 0);
            if (!ImageData) {
              return ImageData;
            }
          }
          goto LABEL_4;
        case 3:
          *(_DWORD *)(a1 + 72) = SBYTE2(v29);
          goto LABEL_36;
      }
    }
LABEL_40:
    uint64_t ImageData = (*(uint64_t (**)(uint64_t, uint64_t *))(v12 + 104))(v12 + 64, &v34);
    if (ImageData) {
      goto LABEL_4;
    }
    goto LABEL_41;
  }
LABEL_4:
  unsigned int v13 = *(void **)(a1 + 136);
  if (v13) {
    free(v13);
  }
  ktxTexture_destruct(a1);
  return ImageData;
}

double glGetFormatSize(int a1, uint64_t a2)
{
  *(void *)(a2 + 24) = 0x100000001;
  if (a1 <= 36165)
  {
    if (a1 > 34797)
    {
      if (a1 <= 35727)
      {
        switch(a1)
        {
          case 34798:
LABEL_33:
            *(_OWORD *)a2 = xmmword_1889BCFE0;
            *(void *)&double result = 0x100000004;
            *(void *)(a2 + 16) = 0x100000004;
            break;
          case 34799:
          case 34800:
          case 34801:
          case 34802:
          case 34803:
          case 34804:
          case 34805:
          case 34806:
          case 34807:
          case 34808:
          case 34809:
          case 34810:
          case 34811:
          case 34812:
          case 34813:
          case 34814:
          case 34815:
          case 34816:
          case 34817:
          case 34818:
          case 34819:
          case 34820:
          case 34821:
          case 34822:
          case 34823:
          case 34824:
          case 34825:
          case 34826:
          case 34827:
          case 34828:
          case 34829:
          case 34830:
          case 34831:
          case 34832:
          case 34833:
          case 34834:
          case 34835:
          case 34838:
          case 34839:
          case 34840:
          case 34841:
LABEL_77:
            *(_OWORD *)a2 = xmmword_18898E7B0;
            *(void *)&double result = 0x100000001;
            *(void *)(a2 + 16) = 0x100000001;
            break;
          case 34836:
LABEL_28:
            *(_OWORD *)a2 = xmmword_1889BD0E0;
            *(void *)&double result = 0x100000001;
            *(void *)(a2 + 16) = 0x100000001;
            break;
          case 34837:
LABEL_36:
            *(_OWORD *)a2 = xmmword_1889BD0F0;
            *(void *)&double result = 0x100000001;
            *(void *)(a2 + 16) = 0x100000001;
            break;
          case 34842:
LABEL_29:
            *(_OWORD *)a2 = xmmword_1889BD100;
            *(void *)&double result = 0x100000001;
            *(void *)(a2 + 16) = 0x100000001;
            break;
          case 34843:
LABEL_30:
            *(_OWORD *)a2 = xmmword_1889BD120;
            *(void *)&double result = 0x100000001;
            *(void *)(a2 + 16) = 0x100000001;
            break;
          default:
            JUMPOUT(0);
        }
      }
      else
      {
        switch(a1)
        {
          case 35728:
            *(_OWORD *)a2 = xmmword_1889BCFD0;
            *(void *)&double result = 0x100000001;
            *(void *)(a2 + 16) = 0x100000001;
            break;
          case 35729:
            *(_OWORD *)a2 = xmmword_1889BCFC0;
            *(void *)&double result = 0x100000001;
            *(void *)(a2 + 16) = 0x100000001;
            break;
          case 35730:
          case 35731:
          case 35732:
            *(_OWORD *)a2 = xmmword_1889BCFB0;
            *(void *)&double result = 0x100000001;
            *(void *)(a2 + 16) = 0x100000001;
            break;
          case 35733:
            *(_OWORD *)a2 = xmmword_1889BCFA0;
            *(void *)&double result = 0x100000001;
            *(void *)(a2 + 16) = 0x100000001;
            break;
          case 35734:
            *(_OWORD *)a2 = xmmword_1889BCF90;
            *(void *)&double result = 0x100000001;
            *(void *)(a2 + 16) = 0x100000001;
            break;
          case 35735:
          case 35736:
          case 35737:
            *(_OWORD *)a2 = xmmword_1889BCF80;
            *(void *)&double result = 0x100000001;
            *(void *)(a2 + 16) = 0x100000001;
            break;
          case 35840:
          case 35842:
            *(void *)&double result = 2;
            *(_OWORD *)a2 = xmmword_1889BCFF0;
            *(_OWORD *)(a2 + 16) = xmmword_1889BD070;
            break;
          case 35841:
          case 35843:
            *(void *)&double result = 2;
            *(_OWORD *)a2 = xmmword_1889BD060;
            *(_OWORD *)(a2 + 16) = xmmword_1889BD070;
            break;
          case 35898:
          case 35901:
LABEL_24:
            *(_OWORD *)a2 = xmmword_1889BD080;
            *(void *)&double result = 0x100000001;
            *(void *)(a2 + 16) = 0x100000001;
            break;
          case 35905:
LABEL_25:
            *(_OWORD *)a2 = xmmword_1889BD140;
            *(void *)&double result = 0x100000001;
            *(void *)(a2 + 16) = 0x100000001;
            break;
          case 35907:
LABEL_19:
            *(_OWORD *)a2 = xmmword_1889BD110;
            *(void *)&double result = 0x100000001;
            *(void *)(a2 + 16) = 0x100000001;
            break;
          case 35916:
          case 35917:
          case 35952:
          case 35953:
          case 35986:
            goto LABEL_40;
          case 35918:
          case 35919:
          case 35954:
          case 35955:
          case 35987:
            goto LABEL_33;
          case 36012:
LABEL_34:
            *(_OWORD *)a2 = xmmword_1889BCF60;
            *(void *)&double result = 0x100000001;
            *(void *)(a2 + 16) = 0x100000001;
            break;
          case 36013:
LABEL_41:
            *(_OWORD *)a2 = xmmword_1889BCF00;
            *(void *)&double result = 0x100000001;
            *(void *)(a2 + 16) = 0x100000001;
            break;
          default:
            goto LABEL_77;
        }
      }
    }
    else
    {
      if (a1 > 33188)
      {
        switch(a1)
        {
          case 33189:
            *(_OWORD *)a2 = xmmword_1889BCF70;
            *(void *)&double result = 0x100000001;
            *(void *)(a2 + 16) = 0x100000001;
            return result;
          case 33190:
          case 33191:
            goto LABEL_34;
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
            goto LABEL_77;
          case 33321:
          case 33329:
          case 33330:
LABEL_26:
            *(_OWORD *)a2 = xmmword_1889BD150;
            *(void *)&double result = 0x100000001;
            *(void *)(a2 + 16) = 0x100000001;
            return result;
          case 33322:
          case 33323:
          case 33325:
          case 33331:
          case 33332:
          case 33335:
          case 33336:
LABEL_16:
            *(_OWORD *)a2 = xmmword_1889BD130;
            *(void *)&double result = 0x100000001;
            *(void *)(a2 + 16) = 0x100000001;
            return result;
          case 33324:
          case 33326:
          case 33327:
          case 33333:
          case 33334:
          case 33337:
          case 33338:
            goto LABEL_19;
          case 33328:
          case 33339:
          case 33340:
            goto LABEL_29;
          default:
            if ((a1 - 33776) < 2) {
              goto LABEL_40;
            }
            if ((a1 - 33778) < 2) {
              goto LABEL_33;
            }
            goto LABEL_77;
        }
      }
      switch(a1)
      {
        case 32847:
          *(_OWORD *)a2 = xmmword_1889BD0D0;
          *(void *)&double result = 0x100000001;
          *(void *)(a2 + 16) = 0x100000001;
          return result;
        case 32848:
        case 32854:
LABEL_18:
          *(_OWORD *)a2 = xmmword_1889BD0A0;
          *(void *)&double result = 0x100000001;
          *(void *)(a2 + 16) = 0x100000001;
          return result;
        case 32849:
          goto LABEL_25;
        case 32850:
        case 32855:
        case 32857:
          goto LABEL_24;
        case 32851:
          *(_OWORD *)a2 = xmmword_1889BD0C0;
          *(void *)&double result = 0x100000001;
          *(void *)(a2 + 16) = 0x100000001;
          return result;
        case 32852:
          goto LABEL_30;
        case 32853:
          goto LABEL_69;
        case 32856:
          goto LABEL_19;
        case 32858:
          *(_OWORD *)a2 = xmmword_1889BD090;
          *(void *)&double result = 0x100000001;
          *(void *)(a2 + 16) = 0x100000001;
          return result;
        case 32859:
          goto LABEL_29;
        default:
          if (a1 != 10768) {
            goto LABEL_77;
          }
LABEL_69:
          *(_OWORD *)a2 = xmmword_1889BD0B0;
          *(void *)&double result = 0x100000001;
          *(void *)(a2 + 16) = 0x100000001;
          break;
      }
    }
  }
  else if (a1 <= 37174)
  {
    if (a1 > 36491)
    {
      switch(a1)
      {
        case 36756:
        case 36797:
          goto LABEL_26;
        case 36757:
        case 36760:
        case 36798:
          goto LABEL_16;
        case 36758:
          goto LABEL_25;
        case 36759:
        case 36761:
          goto LABEL_19;
        case 36762:
          goto LABEL_30;
        case 36763:
          goto LABEL_29;
        case 36764:
        case 36765:
        case 36766:
        case 36767:
        case 36768:
        case 36769:
        case 36770:
        case 36771:
        case 36772:
        case 36773:
        case 36774:
        case 36775:
        case 36776:
        case 36777:
        case 36778:
        case 36779:
        case 36780:
        case 36781:
        case 36782:
        case 36783:
        case 36784:
        case 36785:
        case 36786:
        case 36787:
        case 36788:
        case 36789:
        case 36790:
        case 36791:
        case 36792:
        case 36793:
        case 36794:
        case 36795:
        case 36796:
          goto LABEL_77;
        default:
          if ((a1 - 36492) < 4) {
            goto LABEL_33;
          }
          if (a1 == 36975) {
            goto LABEL_24;
          }
          goto LABEL_77;
      }
    }
    switch(a1)
    {
      case 36166:
        *(_OWORD *)a2 = xmmword_1889BCF50;
        *(void *)&double result = 0x100000001;
        *(void *)(a2 + 16) = 0x100000001;
        break;
      case 36167:
        *(_OWORD *)a2 = xmmword_1889BCF40;
        *(void *)&double result = 0x100000001;
        *(void *)(a2 + 16) = 0x100000001;
        break;
      case 36168:
        *(_OWORD *)a2 = xmmword_1889BCF30;
        *(void *)&double result = 0x100000001;
        *(void *)(a2 + 16) = 0x100000001;
        break;
      case 36169:
        *(_OWORD *)a2 = xmmword_1889BCF20;
        *(void *)&double result = 0x100000001;
        *(void *)(a2 + 16) = 0x100000001;
        break;
      case 36194:
        goto LABEL_18;
      case 36196:
      case 36283:
      case 36284:
        goto LABEL_40;
      case 36208:
      case 36226:
        goto LABEL_28;
      case 36209:
      case 36227:
        goto LABEL_36;
      case 36214:
      case 36232:
        goto LABEL_29;
      case 36215:
      case 36233:
        goto LABEL_30;
      case 36220:
      case 36238:
        goto LABEL_19;
      case 36221:
      case 36239:
        goto LABEL_25;
      case 36267:
        goto LABEL_34;
      case 36268:
        goto LABEL_41;
      case 36285:
      case 36286:
        goto LABEL_33;
      default:
        goto LABEL_77;
    }
  }
  else
  {
    switch(a1)
    {
      case 37488:
      case 37489:
      case 37492:
      case 37493:
      case 37494:
      case 37495:
      case 37873:
        break;
      case 37490:
      case 37491:
      case 37496:
      case 37497:
      case 37808:
      case 37840:
        goto LABEL_33;
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
      case 37834:
      case 37835:
      case 37836:
      case 37837:
      case 37838:
      case 37839:
      case 37854:
      case 37855:
      case 37866:
      case 37867:
      case 37868:
      case 37869:
      case 37870:
      case 37871:
        goto LABEL_77;
      case 37809:
      case 37841:
        *(_OWORD *)a2 = xmmword_1889BD010;
        *(void *)&double result = 0x100000004;
        *(void *)(a2 + 16) = 0x100000004;
        return result;
      case 37810:
      case 37842:
        *(_OWORD *)a2 = xmmword_1889BD010;
        *(void *)&double result = 0x100000005;
        *(void *)(a2 + 16) = 0x100000005;
        return result;
      case 37811:
      case 37843:
        *(_OWORD *)a2 = xmmword_1889BD000;
        *(void *)&double result = 0x100000005;
        *(void *)(a2 + 16) = 0x100000005;
        return result;
      case 37812:
      case 37844:
        *(_OWORD *)a2 = xmmword_1889BD000;
        *(void *)&double result = 0x100000006;
        *(void *)(a2 + 16) = 0x100000006;
        return result;
      case 37813:
      case 37845:
        *(_OWORD *)a2 = xmmword_1889BD050;
        *(void *)&double result = 0x100000005;
        *(void *)(a2 + 16) = 0x100000005;
        return result;
      case 37814:
      case 37846:
        *(_OWORD *)a2 = xmmword_1889BD050;
        *(void *)&double result = 0x100000006;
        *(void *)(a2 + 16) = 0x100000006;
        return result;
      case 37815:
      case 37847:
        *(_OWORD *)a2 = xmmword_1889BD050;
        *(void *)&double result = 0x100000008;
        *(void *)(a2 + 16) = 0x100000008;
        return result;
      case 37816:
      case 37848:
        *(_OWORD *)a2 = xmmword_1889BD040;
        *(void *)&double result = 0x100000005;
        *(void *)(a2 + 16) = 0x100000005;
        return result;
      case 37817:
      case 37849:
        *(_OWORD *)a2 = xmmword_1889BD040;
        *(void *)&double result = 0x100000006;
        *(void *)(a2 + 16) = 0x100000006;
        return result;
      case 37818:
      case 37850:
        *(_OWORD *)a2 = xmmword_1889BD040;
        *(void *)&double result = 0x100000008;
        *(void *)(a2 + 16) = 0x100000008;
        return result;
      case 37819:
      case 37851:
        *(_OWORD *)a2 = xmmword_1889BD040;
        *(void *)&double result = 0x10000000ALL;
        *(void *)(a2 + 16) = 0x10000000ALL;
        return result;
      case 37820:
      case 37852:
        *(_OWORD *)a2 = xmmword_1889BD030;
        *(void *)&double result = 0x10000000ALL;
        *(void *)(a2 + 16) = 0x10000000ALL;
        return result;
      case 37821:
      case 37853:
        *(_OWORD *)a2 = xmmword_1889BD030;
        *(void *)&double result = 0x10000000CLL;
        *(void *)(a2 + 16) = 0x10000000CLL;
        return result;
      case 37824:
      case 37856:
        *(_OWORD *)a2 = xmmword_1889BD020;
        *(void *)&double result = 0x300000003;
        *(void *)(a2 + 16) = 0x300000003;
        return result;
      case 37825:
      case 37857:
        *(_OWORD *)a2 = xmmword_1889BCFE0;
        *(void *)&double result = 0x300000003;
        *(void *)(a2 + 16) = 0x300000003;
        return result;
      case 37826:
      case 37858:
        *(_OWORD *)a2 = xmmword_1889BCFE0;
        *(void *)&double result = 0x300000004;
        *(void *)(a2 + 16) = 0x300000004;
        return result;
      case 37827:
      case 37859:
        *(_OWORD *)a2 = xmmword_1889BCFE0;
        *(void *)&double result = 0x400000004;
        *(void *)(a2 + 16) = 0x400000004;
        return result;
      case 37828:
      case 37860:
        *(_OWORD *)a2 = xmmword_1889BD010;
        *(void *)&double result = 0x400000004;
        *(void *)(a2 + 16) = 0x400000004;
        return result;
      case 37829:
      case 37861:
        *(_OWORD *)a2 = xmmword_1889BD010;
        *(void *)&double result = 0x400000005;
        *(void *)(a2 + 16) = 0x400000005;
        return result;
      case 37830:
      case 37862:
        *(_OWORD *)a2 = xmmword_1889BD010;
        *(void *)&double result = 0x500000005;
        *(void *)(a2 + 16) = 0x500000005;
        return result;
      case 37831:
      case 37863:
        *(_OWORD *)a2 = xmmword_1889BD000;
        *(void *)&double result = 0x500000005;
        *(void *)(a2 + 16) = 0x500000005;
        return result;
      case 37832:
      case 37864:
        *(_OWORD *)a2 = xmmword_1889BD000;
        *(void *)&double result = 0x500000006;
        *(void *)(a2 + 16) = 0x500000006;
        return result;
      case 37833:
      case 37865:
        *(_OWORD *)a2 = xmmword_1889BD000;
        *(void *)&double result = 0x600000006;
        *(void *)(a2 + 16) = 0x600000006;
        return result;
      case 37872:
        goto LABEL_64;
      default:
        if (a1 == 37175)
        {
LABEL_64:
          *(_OWORD *)a2 = xmmword_1889BD060;
          *(void *)&double result = 0x100000004;
          *(void *)(a2 + 16) = 0x100000004;
          return result;
        }
        if (a1 != 37176) {
          goto LABEL_77;
        }
        break;
    }
LABEL_40:
    *(_OWORD *)a2 = xmmword_1889BCFF0;
    *(void *)&double result = 0x100000004;
    *(void *)(a2 + 16) = 0x100000004;
  }
  return result;
}

uint64_t ktxTexture1_LoadImageData(uint64_t a1, int8x16_t *a2, size_t a3)
{
  uint64_t v3 = *(void *)(a1 + 24);
  if (!*(void *)(v3 + 128)) {
    return 10;
  }
  unsigned int v4 = a2;
  unsigned int v6 = *(unsigned char **)(a1 + 136);
  size_t v7 = *(void *)(a1 + 104);
  if (a2)
  {
    if (v7 > a3) {
      return 11;
    }
  }
  else
  {
    unsigned int v4 = (int8x16_t *)malloc_type_malloc(v7, 0xEC4D5731uLL);
    *(void *)(a1 + 112) = v4;
    if (!v4) {
      return 13;
    }
  }
  long long v9 = (uint64_t (**)(uint64_t, int8x16_t *, uint64_t))(v3 + 64);
  if (*(_DWORD *)(a1 + 52))
  {
    int v10 = 0;
    while (1)
    {
      v16.i32[0] = 0;
      uint64_t v11 = (*v9)(v3 + 64, &v16, 4);
      if (v11) {
        break;
      }
      if (*v6) {
        _ktxSwapEndian32(&v16, 1uLL);
      }
      uint64_t v12 = v16.u32[0];
      if (!*(unsigned char *)(a1 + 33))
      {
        int v13 = 1;
        goto LABEL_21;
      }
      if (*(unsigned char *)(a1 + 32))
      {
        int v13 = 1;
        goto LABEL_21;
      }
      int v13 = *(_DWORD *)(a1 + 60);
      if (v13)
      {
LABEL_21:
        do
        {
          uint64_t v11 = (*v9)(v3 + 64, v4, v12);
          if (v11) {
            goto LABEL_26;
          }
          if (*v6)
          {
            int v14 = *(_DWORD *)(v3 + 56);
            if (v14 == 4)
            {
              _ktxSwapEndian32(v4, (unint64_t)v16.u32[0] >> 2);
            }
            else if (v14 == 2)
            {
              _ktxSwapEndian16(v4, (unint64_t)v16.u32[0] >> 1);
            }
          }
          unsigned int v4 = (int8x16_t *)((char *)v4 + v12);
        }
        while (--v13);
      }
      if (++v10 >= *(_DWORD *)(a1 + 52)) {
        goto LABEL_27;
      }
    }
LABEL_26:
    uint64_t v8 = v11;
  }
  else
  {
LABEL_27:
    uint64_t v8 = 0;
  }
  (*(void (**)(uint64_t))(v3 + 112))(v3 + 64);
  return v8;
}

void ktxTexture1_destruct(uint64_t a1)
{
  unsigned int v2 = *(void **)(a1 + 136);
  if (v2) {
    free(v2);
  }

  ktxTexture_destruct(a1);
}

uint64_t ktxTexture1_Create(int *a1, int a2, void *a3)
{
  if (!a3) {
    return 11;
  }
  unsigned int v6 = malloc_type_malloc(0x90uLL, 0x10300406A34F8ACuLL);
  if (!v6) {
    return 13;
  }
  size_t v7 = v6;
  memset(v24, 0, sizeof(v24));
  *unsigned int v6 = 0u;
  v6[1] = 0u;
  v6[2] = 0u;
  v6[3] = 0u;
  v6[4] = 0u;
  v6[5] = 0u;
  v6[7] = 0u;
  v6[8] = 0u;
  v6[6] = 0u;
  int v8 = *a1;
  *((_DWORD *)v6 + 31) = *a1;
  glGetFormatSize(v8, (uint64_t)v24);
  if (DWORD2(v24[0]))
  {
    int v9 = 6403;
    uint64_t v10 = 11;
    if (v8 > 36165)
    {
      if (v8 > 37174)
      {
        switch(v8)
        {
          case 37488:
          case 37489:
            goto LABEL_38;
          case 37490:
          case 37491:
            goto LABEL_24;
          case 37492:
          case 37493:
            goto LABEL_37;
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
          case 37872:
          case 37873:
            goto LABEL_7;
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
          case 37834:
          case 37835:
          case 37836:
          case 37837:
          case 37838:
          case 37839:
          case 37854:
          case 37855:
          case 37866:
          case 37867:
          case 37868:
          case 37869:
          case 37870:
          case 37871:
            goto LABEL_39;
          default:
            if (v8 != 37175 && v8 != 37176) {
              goto LABEL_39;
            }
            goto LABEL_7;
        }
      }
      if (v8 <= 36491)
      {
        switch(v8)
        {
          case 36166:
          case 36167:
          case 36168:
          case 36169:
            int v9 = 6401;
            uint64_t v10 = ktxTexture_construct((uint64_t)v7, (uint64_t)a1, v24);
            if (!v10) {
              goto LABEL_42;
            }
            goto LABEL_39;
          case 36194:
          case 36196:
          case 36209:
          case 36215:
          case 36221:
          case 36227:
          case 36233:
          case 36239:
            goto LABEL_37;
          case 36208:
          case 36214:
          case 36220:
          case 36226:
          case 36232:
          case 36238:
            goto LABEL_7;
          case 36267:
            goto LABEL_21;
          case 36268:
            goto LABEL_41;
          case 36283:
          case 36284:
            goto LABEL_38;
          case 36285:
          case 36286:
            goto LABEL_24;
          default:
            goto LABEL_39;
        }
      }
      switch(v8)
      {
        case 36756:
        case 36760:
        case 36797:
          goto LABEL_38;
        case 36757:
        case 36761:
        case 36798:
          goto LABEL_24;
        case 36758:
        case 36762:
          goto LABEL_37;
        case 36759:
        case 36763:
          goto LABEL_7;
        case 36764:
        case 36765:
        case 36766:
        case 36767:
        case 36768:
        case 36769:
        case 36770:
        case 36771:
        case 36772:
        case 36773:
        case 36774:
        case 36775:
        case 36776:
        case 36777:
        case 36778:
        case 36779:
        case 36780:
        case 36781:
        case 36782:
        case 36783:
        case 36784:
        case 36785:
        case 36786:
        case 36787:
        case 36788:
        case 36789:
        case 36790:
        case 36791:
        case 36792:
        case 36793:
        case 36794:
        case 36795:
        case 36796:
          goto LABEL_39;
        default:
          switch(v8)
          {
            case 36492:
            case 36493:
              goto LABEL_7;
            case 36494:
            case 36495:
              goto LABEL_37;
            default:
              if (v8 != 36975) {
                goto LABEL_39;
              }
              goto LABEL_7;
          }
      }
    }
    if (v8 <= 34797)
    {
      if (v8 > 33188)
      {
        switch(v8)
        {
          case 33189:
          case 33190:
          case 33191:
            goto LABEL_21;
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
            goto LABEL_39;
          case 33321:
          case 33322:
          case 33325:
          case 33326:
          case 33329:
          case 33330:
          case 33331:
          case 33332:
          case 33333:
          case 33334:
            goto LABEL_38;
          case 33323:
          case 33324:
          case 33327:
          case 33328:
          case 33335:
          case 33336:
          case 33337:
          case 33338:
          case 33339:
          case 33340:
            goto LABEL_24;
          default:
            switch(v8)
            {
              case 33776:
                goto LABEL_37;
              case 33777:
              case 33778:
              case 33779:
                goto LABEL_7;
              default:
                goto LABEL_39;
            }
        }
      }
      switch(v8)
      {
        case 32847:
        case 32848:
        case 32849:
        case 32850:
        case 32851:
        case 32852:
          goto LABEL_37;
        case 32853:
        case 32854:
        case 32855:
        case 32856:
        case 32857:
        case 32858:
        case 32859:
          goto LABEL_7;
        default:
          if (v8 == 10768) {
            goto LABEL_37;
          }
          goto LABEL_39;
      }
    }
    if (v8 > 35727)
    {
      switch(v8)
      {
        case 35728:
        case 35730:
        case 35733:
        case 35735:
        case 35840:
        case 35841:
        case 35898:
        case 35901:
        case 35905:
        case 35916:
        case 35986:
          goto LABEL_37;
        case 35729:
        case 35731:
        case 35732:
        case 35734:
        case 35736:
        case 35737:
        case 35842:
        case 35843:
        case 35907:
        case 35917:
        case 35918:
        case 35919:
        case 35987:
          goto LABEL_7;
        case 35952:
        case 35953:
          goto LABEL_38;
        case 35954:
        case 35955:
LABEL_24:
          int v9 = 33319;
          uint64_t v10 = ktxTexture_construct((uint64_t)v7, (uint64_t)a1, v24);
          if (!v10) {
            goto LABEL_42;
          }
          goto LABEL_39;
        case 36012:
LABEL_21:
          int v9 = 6402;
          uint64_t v10 = ktxTexture_construct((uint64_t)v7, (uint64_t)a1, v24);
          if (!v10) {
            goto LABEL_42;
          }
          goto LABEL_39;
        case 36013:
LABEL_41:
          int v9 = 34041;
          uint64_t v10 = ktxTexture_construct((uint64_t)v7, (uint64_t)a1, v24);
          if (!v10) {
            goto LABEL_42;
          }
          goto LABEL_39;
        default:
          goto LABEL_39;
      }
    }
    switch(v8)
    {
      case 34798:
      case 34836:
      case 34842:
LABEL_7:
        int v9 = 6408;
        uint64_t v10 = ktxTexture_construct((uint64_t)v7, (uint64_t)a1, v24);
        if (!v10) {
          goto LABEL_42;
        }
        break;
      case 34799:
      case 34800:
      case 34801:
      case 34802:
      case 34803:
      case 34804:
      case 34805:
      case 34806:
      case 34807:
      case 34808:
      case 34809:
      case 34810:
      case 34811:
      case 34812:
      case 34813:
      case 34814:
      case 34815:
      case 34816:
      case 34817:
      case 34818:
      case 34819:
      case 34820:
      case 34821:
      case 34822:
      case 34823:
      case 34824:
      case 34825:
      case 34826:
      case 34827:
      case 34828:
      case 34829:
      case 34830:
      case 34831:
      case 34832:
      case 34833:
      case 34834:
      case 34835:
      case 34838:
      case 34839:
      case 34840:
      case 34841:
        break;
      case 34837:
      case 34843:
LABEL_37:
        int v9 = 6407;
LABEL_38:
        uint64_t v10 = ktxTexture_construct((uint64_t)v7, (uint64_t)a1, v24);
        if (v10) {
          break;
        }
LABEL_42:
        *(_DWORD *)size_t v7 = 1;
        v7[1] = ktxTexture1_vtbl;
        uint64_t v12 = v7[3];
        long long v13 = ktxTexture1_vtblInt;
        *(uint64_t (**)())(v12 + 16) = off_1EC1279D0[0];
        *(_OWORD *)uint64_t v12 = v13;
        int v14 = malloc_type_malloc(1uLL, 0x100004077774924uLL);
        v7[17] = v14;
        if (!v14)
        {
          uint64_t v10 = 13;
          break;
        }
        *int v14 = 0;
        uint64_t v15 = v7[3];
        char v16 = v24[0];
        *((unsigned char *)v7 + 34) = (v24[0] & 2) != 0;
        if ((v16 & 2) != 0)
        {
          int v21 = 0;
          *((_DWORD *)v7 + 30) = 0;
          *((_DWORD *)v7 + 32) = v9;
          int v20 = 1;
        }
        else
        {
          *((_DWORD *)v7 + 30) = v9;
          *((_DWORD *)v7 + 32) = v9;
          int v17 = *a1;
          int v18 = 5125;
          int v19 = 5123;
          int v20 = 1;
          int v21 = 5121;
          if (*a1 > 36165)
          {
            if (v17 > 36974)
            {
              switch(v17)
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
                case 37872:
                case 37873:
                  goto LABEL_49;
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
                case 37834:
                case 37835:
                case 37836:
                case 37837:
                case 37838:
                case 37839:
                case 37854:
                case 37855:
                case 37866:
                case 37867:
                case 37868:
                case 37869:
                case 37870:
                case 37871:
                  goto LABEL_91;
                default:
                  if ((v17 - 37175) < 2) {
                    goto LABEL_49;
                  }
                  if (v17 == 36975) {
                    goto LABEL_78;
                  }
                  goto LABEL_91;
              }
            }
            if (v17 <= 36493)
            {
              switch(v17)
              {
                case 36166:
                case 36167:
                case 36168:
                case 36196:
                case 36220:
                case 36221:
                case 36283:
                case 36284:
                case 36285:
                case 36286:
                  goto LABEL_49;
                case 36169:
                case 36214:
                case 36215:
                  goto LABEL_75;
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
                case 36240:
                case 36241:
                case 36242:
                case 36243:
                case 36244:
                case 36245:
                case 36246:
                case 36247:
                case 36248:
                case 36249:
                case 36250:
                case 36251:
                case 36252:
                case 36253:
                case 36254:
                case 36255:
                case 36256:
                case 36257:
                case 36258:
                case 36259:
                case 36260:
                case 36261:
                case 36262:
                case 36263:
                case 36264:
                case 36265:
                case 36266:
                case 36269:
                case 36270:
                case 36271:
                case 36272:
                case 36273:
                case 36274:
                case 36275:
                case 36276:
                case 36277:
                case 36278:
                case 36279:
                case 36280:
                case 36281:
                case 36282:
                  goto LABEL_91;
                case 36194:
                  goto LABEL_62;
                case 36208:
                case 36209:
                  goto LABEL_82;
                case 36226:
                case 36227:
                  goto LABEL_59;
                case 36232:
                case 36233:
                  goto LABEL_69;
                case 36238:
                case 36239:
                  goto LABEL_64;
                case 36267:
                  goto LABEL_81;
                case 36268:
                  goto LABEL_85;
                default:
                  if ((v17 - 36492) >= 2) {
                    goto LABEL_91;
                  }
                  goto LABEL_49;
              }
            }
            switch(v17)
            {
              case 36756:
              case 36757:
              case 36758:
              case 36759:
                goto LABEL_64;
              case 36760:
              case 36761:
              case 36762:
              case 36763:
                goto LABEL_69;
              case 36764:
              case 36765:
              case 36766:
              case 36767:
              case 36768:
              case 36769:
              case 36770:
              case 36771:
              case 36772:
              case 36773:
              case 36774:
              case 36775:
              case 36776:
              case 36777:
              case 36778:
              case 36779:
              case 36780:
              case 36781:
              case 36782:
              case 36783:
              case 36784:
              case 36785:
              case 36786:
              case 36787:
              case 36788:
              case 36789:
              case 36790:
              case 36791:
              case 36792:
              case 36793:
              case 36794:
              case 36795:
              case 36796:
                goto LABEL_91;
              case 36797:
              case 36798:
                goto LABEL_49;
              default:
                if (v17 == 36494 || v17 == 36495) {
                  goto LABEL_81;
                }
                goto LABEL_91;
            }
          }
          if (v17 > 34797)
          {
            if (v17 > 35727)
            {
              switch(v17)
              {
                case 35728:
                case 35729:
                case 35733:
                case 35734:
                case 35840:
                case 35841:
                case 35842:
                case 35843:
                case 35905:
                case 35907:
                case 35916:
                case 35917:
                case 35918:
                case 35919:
                case 35952:
                case 35953:
                case 35954:
                case 35955:
                case 35986:
                case 35987:
                  goto LABEL_49;
                case 35730:
                case 35735:
LABEL_62:
                  int v19 = 33635;
                  goto LABEL_75;
                case 35731:
                case 35736:
LABEL_66:
                  int v19 = 32819;
                  goto LABEL_75;
                case 35732:
                case 35737:
LABEL_74:
                  int v19 = 32820;
                  goto LABEL_75;
                case 35898:
                  int v18 = 35899;
                  goto LABEL_82;
                case 35901:
                  int v18 = 35902;
                  goto LABEL_82;
                case 36012:
                  goto LABEL_81;
                case 36013:
LABEL_85:
                  int v18 = 36269;
                  goto LABEL_82;
                default:
                  goto LABEL_91;
              }
            }
            switch(v17)
            {
              case 34798:
                goto LABEL_49;
              case 34799:
              case 34800:
              case 34801:
              case 34802:
              case 34803:
              case 34804:
              case 34805:
              case 34806:
              case 34807:
              case 34808:
              case 34809:
              case 34810:
              case 34811:
              case 34812:
              case 34813:
              case 34814:
              case 34815:
              case 34816:
              case 34817:
              case 34818:
              case 34819:
              case 34820:
              case 34821:
              case 34822:
              case 34823:
              case 34824:
              case 34825:
              case 34826:
              case 34827:
              case 34828:
              case 34829:
              case 34830:
              case 34831:
              case 34832:
              case 34833:
              case 34834:
              case 34835:
              case 34838:
              case 34839:
              case 34840:
              case 34841:
LABEL_91:
                *((_DWORD *)v7 + 33) = 1281;
                uint64_t v10 = 11;
                goto LABEL_56;
              case 34836:
              case 34837:
LABEL_81:
                int v18 = 5126;
LABEL_82:
                int v20 = 4;
                int v21 = v18;
                goto LABEL_49;
              case 34842:
              case 34843:
LABEL_71:
                int v19 = 5131;
LABEL_75:
                int v20 = 2;
                int v21 = v19;
                goto LABEL_49;
              default:
                goto LABEL_92;
            }
          }
          if (v17 > 33188)
          {
            switch(v17)
            {
              case 33189:
              case 33322:
              case 33324:
              case 33332:
              case 33338:
                goto LABEL_75;
              case 33190:
                int v18 = 34042;
                goto LABEL_82;
              case 33191:
              case 33334:
              case 33340:
                goto LABEL_82;
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
                goto LABEL_91;
              case 33321:
              case 33323:
              case 33330:
              case 33336:
                goto LABEL_49;
              case 33325:
              case 33327:
                goto LABEL_71;
              case 33326:
              case 33328:
                goto LABEL_81;
              case 33329:
              case 33335:
LABEL_64:
                int v21 = 5120;
                goto LABEL_49;
              case 33331:
              case 33337:
LABEL_69:
                int v19 = 5122;
                goto LABEL_75;
              case 33333:
              case 33339:
LABEL_59:
                int v18 = 5124;
                goto LABEL_82;
              default:
                if ((v17 - 33776) >= 4) {
                  goto LABEL_91;
                }
                goto LABEL_49;
            }
          }
          switch(v17)
          {
            case 32847:
            case 32854:
              goto LABEL_66;
            case 32848:
            case 32855:
              goto LABEL_74;
            case 32849:
            case 32853:
            case 32856:
              break;
            case 32850:
              int v18 = 32822;
              goto LABEL_82;
            case 32851:
            case 32852:
            case 32858:
            case 32859:
              goto LABEL_75;
            case 32857:
LABEL_78:
              int v18 = 33640;
              goto LABEL_82;
            default:
              if (v17 != 10768) {
                goto LABEL_91;
              }
              int v20 = 1;
              int v21 = 33634;
              break;
          }
        }
LABEL_49:
        *((_DWORD *)v7 + 33) = v21;
        *(_DWORD *)(v15 + 56) = v20;
        if (a2 != 1
          || (size_t v22 = ktxTexture_calcDataSizeTexture((uint64_t)v7),
              v7[13] = v22,
              size_t v23 = malloc_type_malloc(v22, 0xB70F38C9uLL),
              (v7[14] = v23) != 0))
        {
          uint64_t v10 = 0;
          *a3 = v7;
          return v10;
        }
        uint64_t v10 = 13;
LABEL_56:
        ktxTexture1_destruct((uint64_t)v7);
        ktxTexture_destruct((uint64_t)v7);
        break;
      default:
LABEL_92:
        JUMPOUT(0);
    }
  }
  else
  {
    uint64_t v10 = 16;
  }
LABEL_39:
  free(v7);
  return v10;
}

uint64_t ktxTexture1_CreateFromStdioStream(uint64_t a1, char a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 11;
  }
  unsigned int v6 = malloc_type_malloc(0x90uLL, 0x10300406A34F8ACuLL);
  if (v6)
  {
    size_t v7 = v6;
    if (a1)
    {
      uint64_t v12 = 0;
      memset(v11, 0, sizeof(v11));
      uint64_t v8 = ktxFileStream_construct((uint64_t)v11, a1, 0);
      if (!v8)
      {
        memset(v13, 0, sizeof(v13));
        uint64_t v9 = (*(uint64_t (**)(_OWORD *, int8x16_t *, uint64_t))&v11[0])(v11, v13, 64);
        if (v9)
        {
          uint64_t v8 = v9;
        }
        else
        {
          uint64_t v8 = ktxTexture1_constructFromStreamAndHeader((uint64_t)v7, (uint64_t)v11, v13, a2);
          if (!v8) {
            goto LABEL_11;
          }
        }
      }
    }
    else
    {
      uint64_t v8 = 11;
    }
    free(v7);
    size_t v7 = 0;
LABEL_11:
    *a3 = v7;
    return v8;
  }
  return 13;
}

uint64_t ktxTexture1_CreateFromNamedFile(const char *a1, char a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 11;
  }
  unsigned int v6 = malloc_type_malloc(0x90uLL, 0x10300406A34F8ACuLL);
  if (v6)
  {
    size_t v7 = v6;
    if (a1)
    {
      uint64_t v8 = fopen(a1, "rb");
      if (v8)
      {
        uint64_t v13 = 0;
        memset(v12, 0, sizeof(v12));
        uint64_t v9 = ktxFileStream_construct((uint64_t)v12, (uint64_t)v8, 1);
        if (!v9)
        {
          memset(v14, 0, sizeof(v14));
          uint64_t v10 = (*(uint64_t (**)(_OWORD *, int8x16_t *, uint64_t))&v12[0])(v12, v14, 64);
          if (v10)
          {
            uint64_t v9 = v10;
          }
          else
          {
            uint64_t v9 = ktxTexture1_constructFromStreamAndHeader((uint64_t)v7, (uint64_t)v12, v14, a2);
            if (!v9) {
              goto LABEL_13;
            }
          }
        }
      }
      else
      {
        uint64_t v9 = 3;
      }
    }
    else
    {
      uint64_t v9 = 11;
    }
    free(v7);
    size_t v7 = 0;
LABEL_13:
    *a3 = v7;
    return v9;
  }
  return 13;
}

uint64_t ktxTexture1_CreateFromMemory(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!a4) {
    return 11;
  }
  uint64_t v8 = malloc_type_malloc(0x90uLL, 0x10300406A34F8ACuLL);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 11;
    if (a1)
    {
      if (a2)
      {
        uint64_t v14 = 0;
        memset(v13, 0, sizeof(v13));
        uint64_t v10 = ktxMemStream_construct_ro((uint64_t)v13, a1, a2);
        if (!v10)
        {
          memset(v15, 0, sizeof(v15));
          uint64_t v11 = (*(uint64_t (**)(_OWORD *, int8x16_t *, uint64_t))&v13[0])(v13, v15, 64);
          if (v11)
          {
            uint64_t v10 = v11;
          }
          else
          {
            uint64_t v10 = ktxTexture1_constructFromStreamAndHeader((uint64_t)v9, (uint64_t)v13, v15, a3);
            if (!v10)
            {
LABEL_12:
              *a4 = v9;
              return v10;
            }
          }
        }
      }
    }
    free(v9);
    uint64_t v9 = 0;
    goto LABEL_12;
  }
  return 13;
}

uint64_t ktxTexture1_CreateFromStream(uint64_t (**a1)(void, int8x16_t *, uint64_t), char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 11;
  }
  unsigned int v6 = malloc_type_malloc(0x90uLL, 0x10300406A34F8ACuLL);
  if (v6)
  {
    size_t v7 = v6;
    memset(v11, 0, sizeof(v11));
    uint64_t v8 = (*a1)(a1, v11, 64);
    if (v8)
    {
      uint64_t v9 = v8;
    }
    else
    {
      uint64_t v9 = ktxTexture1_constructFromStreamAndHeader((uint64_t)v7, (uint64_t)a1, v11, a2);
      if (!v9)
      {
LABEL_9:
        *a3 = v7;
        return v9;
      }
    }
    free(v7);
    size_t v7 = 0;
    goto LABEL_9;
  }
  return 13;
}

void ktxTexture1_Destroy(void *a1)
{
  unsigned int v2 = (void *)a1[17];
  if (v2) {
    free(v2);
  }
  ktxTexture_destruct((uint64_t)a1);

  free(a1);
}

uint64_t ktxTexture1_calcDataSizeLevels(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  int v4 = 0;
  uint64_t v5 = 0;
  do
    v5 += ktxTexture_calcLevelSize(a1, v4++, 1);
  while (a2 != v4);
  return v5;
}

unint64_t ktxTexture1_calcFaceLodSize(uint64_t a1, char a2)
{
  return ktxTexture_doCalcFaceLodSize(a1, a2, 1);
}

uint64_t ktxTexture1_calcLevelOffset(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  int v4 = 0;
  uint64_t v5 = 0;
  do
    v5 += ktxTexture_calcLevelSize(a1, v4++, 1);
  while (a2 != v4);
  return v5;
}

uint64_t ktxTexture1_GetImageOffset(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, void *a5)
{
  if (!a1) {
    return 11;
  }
  if (*(_DWORD *)(a1 + 52) <= a2 || *(_DWORD *)(a1 + 56) <= a3) {
    return 10;
  }
  if (!*(unsigned char *)(a1 + 33))
  {
    unsigned int v12 = *(_DWORD *)(a1 + 44) >> a2;
    if (v12 <= 1) {
      unsigned int v12 = 1;
    }
    if (v12 > a4) {
      goto LABEL_6;
    }
    return 10;
  }
  if (*(_DWORD *)(a1 + 60) <= a4) {
    return 10;
  }
LABEL_6:
  *a5 = (**(uint64_t (***)(uint64_t, uint64_t))(a1 + 24))(a1, a2);
  if (a3) {
    *a5 += ktxTexture_layerSize(a1, a2, 1) * a3;
  }
  if (!a4) {
    return 0;
  }
  uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 + 8) + 24))(a1, a2);
  uint64_t result = 0;
  *a5 += v10 * a4;
  return result;
}

uint64_t ktxTexture1_GetDataSizeUncompressed(uint64_t a1)
{
  return *(void *)(a1 + 104);
}

uint64_t ktxTexture1_GetImageSize(uint64_t a1, char a2)
{
  return ktxTexture_calcImageSize(a1, a2, 1);
}

uint64_t ktxTexture1_glTypeSize(uint64_t a1)
{
  return *(unsigned int *)(*(void *)(a1 + 24) + 56);
}

uint64_t ktxTexture1_IterateLevels(uint64_t a1, uint64_t (*a2)(uint64_t, void, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t), uint64_t a3)
{
  uint64_t result = 11;
  if (a1 && a2)
  {
    if (*(_DWORD *)(a1 + 52))
    {
      uint64_t v7 = 0;
      while (1)
      {
        uint64_t v15 = 0;
        unsigned int v8 = *(_DWORD *)(a1 + 40);
        unsigned int v9 = *(_DWORD *)(a1 + 36) >> v7;
        uint64_t v10 = v9 <= 1 ? 1 : v9;
        uint64_t v11 = v8 >> v7 <= 1 ? 1 : v8 >> v7;
        unsigned int v12 = *(_DWORD *)(a1 + 44) >> v7;
        uint64_t v13 = v12 <= 1 ? 1 : v12;
        unsigned int v14 = ktxTexture_calcLevelSize(a1, v7, 1);
        (*(void (**)(uint64_t, uint64_t, void, void, uint64_t *))(*(void *)(a1 + 8) + 8))(a1, v7, 0, 0, &v15);
        uint64_t result = a2(v7, 0, v10, v11, v13, v14, *(void *)(a1 + 112) + v15, a3);
        if (result) {
          break;
        }
        uint64_t v7 = (v7 + 1);
        if (v7 >= *(_DWORD *)(a1 + 52)) {
          return 0;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t ktxTexture1_IterateLoadLevelFaces(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, int8x16_t *, uint64_t), uint64_t a3)
{
  if (*(_DWORD *)a1 != 1) {
    return 10;
  }
  if (!a2) {
    return 11;
  }
  uint64_t v3 = a1;
  uint64_t v4 = *(void *)(a1 + 24);
  if (!*(void *)(v4 + 128)) {
    return 10;
  }
  uint64_t v5 = (uint64_t (**)(void, int8x16_t *, uint64_t))(v4 + 64);
  uint64_t v25 = *(void *)(a1 + 24);
  if (!*(_DWORD *)(a1 + 52))
  {
    uint64_t v21 = 0;
    unsigned int v6 = 0;
    goto LABEL_43;
  }
  unsigned int v6 = 0;
  uint64_t v7 = 0;
  unsigned __int32 v8 = 0;
  int v28 = *(unsigned char **)(a1 + 136);
  while (1)
  {
LABEL_6:
    size.i32[0] = 0;
    unsigned int v9 = *(_DWORD *)(v3 + 40);
    unsigned int v10 = *(_DWORD *)(v3 + 36) >> v7;
    if (v10 <= 1) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = v10;
    }
    if (v9 >> v7 <= 1) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = v9 >> v7;
    }
    unsigned int v13 = *(_DWORD *)(v3 + 44) >> v7;
    if (v13 <= 1) {
      uint64_t v14 = 1;
    }
    else {
      uint64_t v14 = v13;
    }
    uint64_t v15 = (*v5)(v5, &size, 4);
    if (v15) {
      goto LABEL_41;
    }
    if (*v28) {
      _ktxSwapEndian32(&size, 1uLL);
    }
    uint64_t v16 = size.u32[0];
    if (!v6) {
      break;
    }
    if (v8 < size.i32[0])
    {
      uint64_t v21 = 1;
      goto LABEL_43;
    }
    unsigned __int32 v24 = v8;
    if (!*(unsigned char *)(v3 + 33)) {
      goto LABEL_25;
    }
LABEL_24:
    if (*(unsigned char *)(v3 + 32))
    {
LABEL_25:
      int v17 = 1;
LABEL_26:
      uint64_t v18 = 0;
      while (1)
      {
        uint64_t v15 = (*v5)(v5, v6, v16);
        if (v15) {
          break;
        }
        if (*v28)
        {
          int v20 = *(_DWORD *)(v25 + 56);
          if (v20 == 4)
          {
            _ktxSwapEndian32(v6, (unint64_t)size.u32[0] >> 2);
          }
          else if (v20 == 2)
          {
            _ktxSwapEndian16(v6, (unint64_t)size.u32[0] >> 1);
          }
        }
        uint64_t v19 = a2(v7, v18, v11, v12, v14, size.u32[0], v6, a3);
        uint64_t v18 = (v18 + 1);
        if (v17 == v18)
        {
          uint64_t v21 = v19;
          uint64_t v3 = a1;
          uint64_t v7 = (v7 + 1);
          unsigned __int32 v8 = v24;
          if (v7 < *(_DWORD *)(a1 + 52)) {
            goto LABEL_6;
          }
          goto LABEL_43;
        }
      }
LABEL_41:
      uint64_t v21 = v15;
      goto LABEL_43;
    }
    int v17 = *(_DWORD *)(v3 + 60);
    if (v17) {
      goto LABEL_26;
    }
    uint64_t v21 = 0;
    uint64_t v7 = (v7 + 1);
    unsigned __int32 v8 = v24;
    if (v7 >= *(_DWORD *)(v3 + 52)) {
      goto LABEL_43;
    }
  }
  unsigned int v6 = (int8x16_t *)malloc_type_malloc(size.u32[0], 0xBADBAB7FuLL);
  if (v6)
  {
    unsigned __int32 v24 = v16;
    if (!*(unsigned char *)(v3 + 33)) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  uint64_t v21 = 13;
LABEL_43:
  free(v6);
  (*(void (**)(uint64_t (**)(void, int8x16_t *, uint64_t)))(v25 + 112))(v5);
  return v21;
}

uint64_t ktxTexture1_NeedsTranscoding()
{
  return 0;
}

uint64_t ktxFormatSize_initFromDfd(uint64_t a1, unsigned int *a2)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a2;
  if (v2 < 0x2C || v2 - 4 != (unint64_t)a2[2] >> 16) {
    return 0;
  }
  if ((unsigned __int16)a2[2] != 2 || a2[1] != 0) {
    return 0;
  }
  uint64_t v7 = a2 + 4;
  *(_DWORD *)(a1 + 12) = *((unsigned __int8 *)a2 + 16) + 1;
  *(_DWORD *)(a1 + 16) = *((unsigned __int8 *)a2 + 17) + 1;
  *(_DWORD *)(a1 + 20) = *((unsigned __int8 *)a2 + 18) + 1;
  int v8 = 8 * a2[5];
  *(_DWORD *)(a1 + 8) = v8;
  *(void *)a1 = 0;
  *(void *)(a1 + 24) = 0x100000001;
  if ((a2[3] & 0x80) != 0)
  {
    *(_DWORD *)a1 = 2;
    if (*((unsigned __int8 *)a2 + 12) == 164) {
      *(void *)(a1 + 24) = 0x200000002;
    }
    goto LABEL_28;
  }
  int v9 = *((unsigned char *)a2 + 31) & 0xF;
  if (v9 == 13)
  {
    int v11 = 16;
    goto LABEL_27;
  }
  if (v9 != 14)
  {
    unsigned int v12 = a2[2];
    if ((v12 & 0xFFFF0000) == 0x780000
      && (((v12 >> 18) - 6) & 0xFFFFFFFC) == 0x18
      && !memcmp(&unk_1E90FF3BC, v7, 0x6CuLL))
    {
      int v11 = 1;
      goto LABEL_27;
    }
    unsigned int v14 = 0;
    unsigned int v13 = interpretDFD(a2, &v15, &v16, &v17, v18, &v14);
    if (v13 <= 0x3F)
    {
      if ((v13 & 2) != 0) {
        *(_DWORD *)a1 |= 1u;
      }
      int v8 = *(_DWORD *)(a1 + 8);
      goto LABEL_28;
    }
    return 0;
  }
  unsigned int v10 = ((a2[2] >> 18) - 6) >> 2;
  if (v10 == 2)
  {
    int v11 = 25;
    goto LABEL_27;
  }
  if (v10 != 1) {
    return 0;
  }
  int v11 = 8;
LABEL_27:
  *(_DWORD *)a1 = v11;
LABEL_28:
  if (v8) {
    return 1;
  }
  LODWORD(v15) = 0;
  uint64_t result = recreateBytesPlane0FromSampleInfo(a2, (unsigned int *)&v15);
  if (result)
  {
    *(_DWORD *)(a1 + 8) = 8 * v15;
    return 1;
  }
  return result;
}

uint64_t ktxTexture2_constructFromStreamAndHeader(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  *(void *)(a1 + 160) = 0;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  uint64_t ImageData = ktxTexture_constructFromStream(a1, a2);
  if (ImageData) {
    return ImageData;
  }
  int v46 = 0;
  uint64_t ImageData = ktxCheckHeader2_(a3, (uint64_t)&v46);
  if (!ImageData)
  {
    int v8 = *(_DWORD *)(a3 + 40);
    *(_DWORD *)a1 = 2;
    *(void *)(a1 + 8) = ktxTexture2_vtbl;
    uint64_t v9 = *(void *)(a1 + 24);
    long long v10 = ktxTexture2_vtblInt;
    *(void *)(v9 + 16) = off_1EC127A58;
    *(_OWORD *)uint64_t v9 = v10;
    size_t v11 = 24 * (v8 - 1) + 56;
    unsigned int v12 = malloc_type_malloc(v11, 0x9D79ECDCuLL);
    *(void *)(a1 + 160) = v12;
    if (!v12) {
      goto LABEL_44;
    }
    bzero(v12, v11);
    unsigned int v13 = *(void **)(a1 + 160);
    uint64_t v14 = *(void *)(a1 + 24);
    uint64_t v15 = (uint64_t (**)(uint64_t, void *))(v14 + 64);
    *(_DWORD *)(a1 + 120) = *(_DWORD *)(a3 + 12);
    *(_DWORD *)(a1 + 136) = *(_DWORD *)(a3 + 44);
    *(_DWORD *)(v14 + 56) = *(_DWORD *)(a3 + 16);
    int v16 = HIWORD(v46);
    *(_DWORD *)(a1 + 48) = HIWORD(v46);
    *(_DWORD *)(a1 + 36) = *(_DWORD *)(a3 + 20);
    switch(v16)
    {
      case 3:
        uint64_t v17 = *(void *)(a3 + 24);
        break;
      case 2:
        *(_DWORD *)(a1 + 40) = *(_DWORD *)(a3 + 24);
        *(_DWORD *)(a1 + 44) = 1;
LABEL_11:
        unsigned int v18 = *(_DWORD *)(a3 + 32);
        BOOL v19 = v18 != 0;
        if (v18 <= 1) {
          unsigned int v18 = 1;
        }
        *(_DWORD *)(a1 + 56) = v18;
        *(unsigned char *)(a1 + 32) = v19;
        int v20 = *(_DWORD *)(a3 + 36);
        *(_DWORD *)(a1 + 60) = v20;
        *(unsigned char *)(a1 + 33) = v20 == 6;
        uint64_t v21 = *(unsigned int *)(a3 + 40);
        *(_DWORD *)(a1 + 52) = v21;
        *(unsigned char *)(a1 + 35) = BYTE1(v46) != 0;
        uint64_t ImageData = ((uint64_t (*)(uint64_t, void *, uint64_t))*v15)(v14 + 64, v13 + 4, 24 * v21);
        if (ImageData) {
          goto LABEL_45;
        }
        uint64_t v22 = *(unsigned int *)(a1 + 52);
        uint64_t v23 = v13[3 * (v22 - 1) + 4];
        v13[3] = v23;
        if (v22)
        {
          if (v22 == 1)
          {
            uint64_t v24 = 0;
LABEL_20:
            int v28 = &v13[3 * v24 + 4];
            uint64_t v29 = v22 - v24;
            do
            {
              *v28 -= v23;
              v28 += 3;
              --v29;
            }
            while (v29);
            goto LABEL_22;
          }
          uint64_t v24 = v22 & 0xFFFFFFFE;
          uint64_t v25 = v13 + 7;
          uint64_t v26 = v24;
          do
          {
            uint64_t v27 = *v25 - v23;
            *(v25 - 3) -= v23;
            *uint64_t v25 = v27;
            v25 += 6;
            v26 -= 2;
          }
          while (v26);
          if (v24 != v22) {
            goto LABEL_20;
          }
        }
LABEL_22:
        size_t v30 = *(unsigned int *)(a3 + 52);
        if (v30 < 4)
        {
LABEL_23:
          uint64_t ImageData = 16;
          goto LABEL_45;
        }
        uint64_t v31 = malloc_type_malloc(v30, 0x9CBB65DAuLL);
        *(void *)(a1 + 128) = v31;
        if (!v31) {
          goto LABEL_44;
        }
        uint64_t ImageData = ((uint64_t (*)(uint64_t, void *, void))*v15)(v14 + 64, v31, *(unsigned int *)(a3 + 52));
        if (ImageData) {
          goto LABEL_45;
        }
        long long v32 = *(unsigned int **)(a1 + 128);
        if (*v32 != *(_DWORD *)(a3 + 52) || !ktxFormatSize_initFromDfd(*(void *)(a1 + 24) + 24, v32)) {
          goto LABEL_23;
        }
        *(unsigned char *)(a1 + 34) = (*(unsigned char *)(*(void *)(a1 + 24) + 24) & 2) != 0;
        *(_DWORD *)(*(void *)(a1 + 160) + 8) = ktxTexture2_calcRequiredLevelAlignment(a1);
        ktxHashList_Construct((void *)(a1 + 80));
        uint64_t v34 = *(unsigned int *)(a3 + 60);
        if (v34)
        {
          if ((a4 & 4) == 0)
          {
            uint64_t v35 = (char *)malloc_type_malloc(*(unsigned int *)(a3 + 60), 0x45A6E3C4uLL);
            if (!v35) {
              goto LABEL_44;
            }
            v42 = v35;
            int v43 = v34;
            uint64_t ImageData = ((uint64_t (*)(uint64_t, char *, uint64_t))*v15)(v14 + 64, v35, v34);
            if (ImageData) {
              goto LABEL_45;
            }
            if ((a4 & 2) != 0)
            {
              *(_DWORD *)(a1 + 88) = v43;
              *(void *)(a1 + 96) = v42;
              if (!*(void *)(a3 + 72)) {
                goto LABEL_42;
              }
              goto LABEL_40;
            }
            uint64_t v44 = 0;
            v45 = 0;
            uint64_t ImageData = ktxHashList_Deserialize((void *)(a1 + 80), v43, v42);
            free(v42);
            if (ImageData) {
              goto LABEL_45;
            }
            if (ktxHashList_FindValue((uint64_t *)(a1 + 80), "KTXorientation", (_DWORD *)&v44 + 1, &v45))
            {
LABEL_35:
              if (ktxHashList_FindValue((uint64_t *)(a1 + 80), "KTXanimData", &v44, &v47))
              {
                if (!*(void *)(a3 + 72)) {
                  goto LABEL_42;
                }
                goto LABEL_40;
              }
              if (v44 == 12)
              {
                uint64_t ImageData = 1;
                if (!*(unsigned char *)(a1 + 32)) {
                  goto LABEL_45;
                }
                *(unsigned char *)(a1 + 140) = 1;
                double v33 = v47;
                *(double *)(a1 + 144) = v47;
                *(_DWORD *)(a1 + 152) = v48;
                if (!*(void *)(a3 + 72)) {
                  goto LABEL_42;
                }
LABEL_40:
                (*(void (**)(uint64_t, void))(v14 + 96))(v14 + 64, *(void *)(a3 + 64));
                int v36 = malloc_type_malloc(*(void *)(a3 + 72), 0x5B457448uLL);
                *unsigned int v13 = v36;
                if (v36)
                {
                  v13[2] = *(void *)(a3 + 72);
                  uint64_t ImageData = (*v15)(v14 + 64, v36);
                  if (ImageData) {
                    goto LABEL_45;
                  }
LABEL_42:
                  *(void *)(a1 + 104) = v13[5] + v13[4];
                  if ((a4 & 1) == 0) {
                    return 0;
                  }
                  uint64_t ImageData = ktxTexture2_LoadImageData(a1, 0, 0, v33);
                  if (!ImageData) {
                    return ImageData;
                  }
                  goto LABEL_45;
                }
LABEL_44:
                uint64_t ImageData = 13;
                goto LABEL_45;
              }
LABEL_66:
              uint64_t ImageData = 1;
              goto LABEL_45;
            }
            int v40 = *(_DWORD *)(a1 + 48);
            if (HIDWORD(v44) != v40 + 1) {
              goto LABEL_66;
            }
            switch(v40)
            {
              case 3:
                v41 = v45;
                *(_DWORD *)(a1 + 72) = v45[2];
                break;
              case 2:
                v41 = v45;
                break;
              case 1:
                v41 = v45;
                goto LABEL_70;
              default:
                goto LABEL_35;
            }
            *(_DWORD *)(a1 + 68) = v41[1];
LABEL_70:
            *(_DWORD *)(a1 + 64) = *v41;
            goto LABEL_35;
          }
          (*(void (**)(uint64_t, void))(v14 + 72))(v14 + 64, *(unsigned int *)(a3 + 60));
        }
        if (!*(void *)(a3 + 72)) {
          goto LABEL_42;
        }
        goto LABEL_40;
      case 1:
        uint64_t v17 = 0x100000001;
        break;
      default:
        goto LABEL_11;
    }
    *(void *)(a1 + 40) = v17;
    goto LABEL_11;
  }
LABEL_45:
  v37 = *(void **)(a1 + 128);
  if (v37) {
    free(v37);
  }
  v38 = *(void ***)(a1 + 160);
  if (v38)
  {
    if (*v38)
    {
      free(*v38);
      v38 = *(void ***)(a1 + 160);
    }
    free(v38);
  }
  ktxTexture_destruct(a1);
  return ImageData;
}

uint64_t ktxTexture2_calcRequiredLevelAlignment(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 136)) {
    return 1;
  }
  if (!*(_DWORD *)(a1 + 120)) {
    return 16;
  }
  unsigned int v2 = *(_DWORD *)(*(void *)(a1 + 24) + 32);
  uint64_t result = v2 >> 3;
  if ((v2 & 0x18) != 0)
  {
    unsigned int v3 = 4;
    unsigned int v4 = result;
    do
    {
      unsigned int v5 = v4;
      unsigned int v4 = v3 % v4;
      unsigned int v3 = v5;
    }
    while (v4);
    return 4 * (int)result / v5;
  }
  return result;
}

uint64_t ktxTexture2_LoadImageData(uint64_t a1, uint64_t a2, size_t a3, double a4)
{
  uint64_t v6 = *(void *)(a1 + 24);
  uint64_t v7 = *(void *)(a1 + 160);
  unsigned int v8 = *(_DWORD *)(a1 + 136);
  if (v8 < 2)
  {
    size_t v9 = *(void *)(a1 + 104);
    if (!*(void *)(a1 + 112)) {
      goto LABEL_25;
    }
    return 10;
  }
  if (v8 != 2)
  {
    size_t v9 = 0;
    if (*(void *)(a1 + 112)) {
      return 10;
    }
    goto LABEL_25;
  }
  if (!*(_DWORD *)(a1 + 120))
  {
    unsigned int v11 = 16;
    uint64_t v15 = (*(_DWORD *)(a1 + 52) - 1);
    if (*(_DWORD *)(a1 + 52) - 1 > 0) {
      goto LABEL_11;
    }
LABEL_16:
    size_t v9 = *(void *)(v7 + 48);
    if (*(void *)(a1 + 112)) {
      return 10;
    }
    goto LABEL_25;
  }
  unsigned int v10 = *(_DWORD *)(v6 + 32);
  unsigned int v11 = v10 >> 3;
  if ((v10 & 0x18) != 0)
  {
    unsigned int v12 = 4;
    unsigned int v13 = v11;
    do
    {
      unsigned int v14 = v13;
      unsigned int v13 = v12 % v13;
      unsigned int v12 = v14;
    }
    while (v13);
    unsigned int v11 = 4 * v11 / v14;
  }
  uint64_t v15 = (*(_DWORD *)(a1 + 52) - 1);
  if (*(_DWORD *)(a1 + 52) - 1 <= 0) {
    goto LABEL_16;
  }
LABEL_11:
  *(float *)&a4 = (float)v11;
  if (v15 < 4)
  {
    uint64_t v16 = 0;
    int v17 = v15;
LABEL_21:
    uint64_t v27 = (unint64_t *)(v7 + 24 * v17 + 48);
    do
    {
      unint64_t v28 = *v27;
      v27 -= 3;
      v16 += (float)(ceilf((float)v28 / *(float *)&a4) * *(float *)&a4);
      --v17;
    }
    while (v17 > 0);
    goto LABEL_23;
  }
  float32x2_t v18 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a4, 0);
  int v17 = v15 & 3;
  BOOL v19 = (uint64_t *)(v7 + 24 * v15);
  int64x2_t v20 = 0uLL;
  uint64_t v21 = v15 & 0xFFFFFFFC;
  int64x2_t v22 = 0uLL;
  do
  {
    uint64_t v23 = v19 - 3;
    v24.i64[0] = v19[6];
    v24.i64[1] = v19[3];
    uint64_t v25 = *v19;
    v19 -= 12;
    v26.i64[0] = v25;
    v26.i64[1] = *v23;
    int64x2_t v20 = (int64x2_t)vaddw_u32((uint64x2_t)v20, vcvt_u32_f32(vmul_n_f32(vrndp_f32(vdiv_f32(vcvt_f32_f64(vcvtq_f64_u64(v24)), v18)), *(float *)&a4)));
    int64x2_t v22 = (int64x2_t)vaddw_u32((uint64x2_t)v22, vcvt_u32_f32(vmul_n_f32(vrndp_f32(vdiv_f32(vcvt_f32_f64(vcvtq_f64_u64(v26)), v18)), *(float *)&a4)));
    v21 -= 4;
  }
  while (v21);
  uint64_t v16 = vaddvq_s64(vaddq_s64(v22, v20));
  if ((v15 & 0xFFFFFFFC) != v15) {
    goto LABEL_21;
  }
LABEL_23:
  if (!a1) {
    return 11;
  }
  size_t v9 = *(void *)(v7 + 48) + v16;
  if (*(void *)(a1 + 112)) {
    return 10;
  }
LABEL_25:
  if (!*(void *)(v6 + 128)) {
    return 10;
  }
  if (a2)
  {
    uint64_t v29 = a2;
    if (v9 > a3) {
      return 11;
    }
  }
  else
  {
    long long v32 = malloc_type_malloc(v9, 0x7DF1A372uLL);
    *(void *)(a1 + 112) = v32;
    if (!v32) {
      return 13;
    }
    uint64_t v29 = (uint64_t)v32;
    unsigned int v8 = *(_DWORD *)(a1 + 136);
  }
  if (v8 == 2)
  {
    double v33 = malloc_type_malloc(*(void *)(a1 + 104), 0x7332993EuLL);
    uint64_t v34 = v33;
    if (!v33) {
      return 13;
    }
  }
  else
  {
    double v33 = 0;
    uint64_t v34 = (void *)v29;
  }
  uint64_t v30 = (*(uint64_t (**)(uint64_t, void))(v6 + 96))(v6 + 64, *(void *)(v7 + 24));
  if (!v30)
  {
    uint64_t v30 = (*(uint64_t (**)(uint64_t, void *, void))(v6 + 64))(v6 + 64, v34, *(void *)(a1 + 104));
    if (!v30)
    {
      if (*(_DWORD *)(a1 + 136) == 2
        && (uint64_t v30 = ktxTexture2_inflateZstdInt(a1, (uint64_t)v33, v29, v9), free(v33), v30))
      {
        if (!a2)
        {
          free(*(void **)(a1 + 112));
          *(void *)(a1 + 112) = 0;
        }
      }
      else
      {
        (*(void (**)(uint64_t))(v6 + 112))(v6 + 64);
        uint64_t v30 = 0;
        *(void *)(v7 + 24) = 0;
      }
    }
  }
  return v30;
}

void ktxTexture2_destruct(uint64_t a1)
{
  unsigned int v2 = *(void **)(a1 + 128);
  if (v2) {
    free(v2);
  }
  unsigned int v3 = *(void ***)(a1 + 160);
  if (v3)
  {
    if (*v3)
    {
      free(*v3);
      unsigned int v3 = *(void ***)(a1 + 160);
    }
    free(v3);
  }

  ktxTexture_destruct(a1);
}

uint64_t ktxTexture2_Create(uint64_t a1, int a2, unsigned int **a3)
{
  if (!a3) {
    return 11;
  }
  uint64_t v6 = (unsigned int *)malloc_type_malloc(0xA8uLL, 0x1030040B443E594uLL);
  if (v6)
  {
    uint64_t v7 = v6;
    memset(v34, 0, sizeof(v34));
    *(_OWORD *)uint64_t v6 = 0u;
    *((_OWORD *)v6 + 1) = 0u;
    *((_OWORD *)v6 + 2) = 0u;
    *((_OWORD *)v6 + 3) = 0u;
    *((_OWORD *)v6 + 4) = 0u;
    *((_OWORD *)v6 + 5) = 0u;
    *((_OWORD *)v6 + 6) = 0u;
    *((_OWORD *)v6 + 7) = 0u;
    *((_OWORD *)v6 + 8) = 0u;
    *((_OWORD *)v6 + 9) = 0u;
    *((void *)v6 + 20) = 0;
    int v8 = *(_DWORD *)(a1 + 4);
    if (v8)
    {
      size_t v9 = (unsigned int *)vk2dfd(v8);
      *((void *)v7 + 16) = v9;
      if (!v9)
      {
        uint64_t v10 = 11;
        goto LABEL_24;
      }
      ktxFormatSize_initFromDfd((uint64_t)v34, v9);
    }
    else
    {
      unsigned int v11 = malloc_type_malloc(**(unsigned int **)(a1 + 8), 0xB0BCEB7AuLL);
      *((void *)v7 + 16) = v11;
      if (!v11)
      {
        uint64_t v10 = 13;
        goto LABEL_24;
      }
      memcpy(v11, *(const void **)(a1 + 8), **(unsigned int **)(a1 + 8));
      if (ktxFormatSize_initFromDfd((uint64_t)v34, *((unsigned int **)v7 + 16)))
      {
        uint64_t v10 = 16;
        unsigned int v12 = (void *)*((void *)v7 + 16);
        if (!v12)
        {
LABEL_12:
          unsigned int v13 = (void **)*((void *)v7 + 20);
          if (v13)
          {
            if (*v13)
            {
              free(*v13);
              unsigned int v13 = (void **)*((void *)v7 + 20);
            }
            free(v13);
          }
          ktxTexture_destruct((uint64_t)v7);
          goto LABEL_24;
        }
LABEL_11:
        free(v12);
        goto LABEL_12;
      }
    }
    uint64_t v10 = ktxTexture_construct((uint64_t)v7, a1, v34);
    if (!v10)
    {
      int v14 = *(_DWORD *)(a1 + 32);
      unsigned int *v7 = 2;
      *((void *)v7 + 1) = ktxTexture2_vtbl;
      uint64_t v15 = *((void *)v7 + 3);
      long long v16 = ktxTexture2_vtblInt;
      *(void *)(v15 + 16) = off_1EC127A58;
      *(_OWORD *)uint64_t v15 = v16;
      size_t v17 = 24 * (v14 - 1) + 56;
      float32x2_t v18 = malloc_type_malloc(v17, 0x9D79ECDCuLL);
      *((void *)v7 + 20) = v18;
      if (!v18) {
        goto LABEL_45;
      }
      bzero(v18, v17);
      unsigned int v19 = *(_DWORD *)(a1 + 4);
      v7[30] = v19;
      if (*((unsigned char *)v7 + 34))
      {
        uint64_t v20 = *((void *)v7 + 3);
        int v21 = 1;
      }
      else
      {
        if (v34[0])
        {
          *(_DWORD *)(*((void *)v7 + 3) + 56) = DWORD2(v34[0]) >> 3;
          goto LABEL_32;
        }
        if ((v34[0] & 0x18) == 0)
        {
          int v33 = 0;
          getDFDComponentInfoUnpacked(*((void *)v7 + 16), &v33, (unsigned int *)(*((void *)v7 + 3) + 56));
          unsigned int v19 = v7[30];
          goto LABEL_32;
        }
        uint64_t v20 = *((void *)v7 + 3);
        if (v19 == 128)
        {
          *(_DWORD *)(v20 + 56) = 2;
          v7[34] = 0;
          goto LABEL_34;
        }
        int v21 = 4;
      }
      *(_DWORD *)(v20 + 56) = v21;
LABEL_32:
      v7[34] = 0;
      if (!v19)
      {
        int v24 = 16;
        goto LABEL_39;
      }
      uint64_t v20 = *((void *)v7 + 3);
LABEL_34:
      unsigned int v23 = *(_DWORD *)(v20 + 32);
      int v24 = v23 >> 3;
      if ((v23 & 0x18) != 0)
      {
        unsigned int v25 = 4;
        unsigned int v26 = v24;
        do
        {
          unsigned int v27 = v26;
          unsigned int v26 = v25 % v26;
          unsigned int v25 = v27;
        }
        while (v26);
        int v24 = 4 * v24 / v27;
      }
LABEL_39:
      uint64_t v28 = *((void *)v7 + 20);
      *(_DWORD *)(v28 + 8) = v24;
      *(void *)(v28 + 24) = 0;
      if (v7[13])
      {
        unint64_t v29 = 0;
        uint64_t v30 = (int64x2_t *)(v28 + 40);
        do
        {
          *uint64_t v30 = vdupq_n_s64(ktxTexture_calcLevelSize((uint64_t)v7, v29, 2));
          v30[-1].i64[1] = (*(uint64_t (**)(unsigned int *, unint64_t))(*((void *)v7 + 3) + 16))(v7, v29++);
          uint64_t v30 = (int64x2_t *)((char *)v30 + 24);
        }
        while (v29 < v7[13]);
      }
      if (a2 != 1
        || (size_t v31 = ktxTexture_calcDataSizeTexture((uint64_t)v7),
            *((void *)v7 + 13) = v31,
            long long v32 = malloc_type_malloc(v31, 0xBF91D186uLL),
            (*((void *)v7 + 14) = v32) != 0))
      {
        uint64_t v10 = 0;
        *a3 = v7;
        return v10;
      }
LABEL_45:
      uint64_t v10 = 13;
      unsigned int v12 = (void *)*((void *)v7 + 16);
      if (!v12) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
LABEL_24:
    free(v7);
    return v10;
  }
  return 13;
}

uint64_t ktxTexture2_CreateCopy(uint64_t a1, uint64_t **a2)
{
  if (!a2) {
    return 11;
  }
  unsigned int v4 = (uint64_t *)malloc_type_malloc(0xA8uLL, 0x1030040B443E594uLL);
  if (!v4) {
    return 13;
  }
  unsigned int v5 = v4;
  long long v6 = *(_OWORD *)a1;
  *((_OWORD *)v4 + 1) = *(_OWORD *)(a1 + 16);
  long long v8 = *(_OWORD *)(a1 + 96);
  long long v7 = *(_OWORD *)(a1 + 112);
  long long v9 = *(_OWORD *)(a1 + 144);
  *((_OWORD *)v4 + 8) = *(_OWORD *)(a1 + 128);
  *((_OWORD *)v4 + 6) = v8;
  long long v10 = *(_OWORD *)(a1 + 32);
  long long v11 = *(_OWORD *)(a1 + 48);
  long long v12 = *(_OWORD *)(a1 + 64);
  long long v13 = *(_OWORD *)(a1 + 80);
  *((_OWORD *)v4 + 7) = v7;
  *(_OWORD *)unsigned int v4 = v6;
  *((_OWORD *)v4 + 4) = v12;
  *((_OWORD *)v4 + 5) = v13;
  *((_OWORD *)v4 + 2) = v10;
  *((_OWORD *)v4 + 3) = v11;
  *((_OWORD *)v4 + 9) = v9;
  v4[3] = 0;
  v4[20] = 0;
  v4[16] = 0;
  v4[12] = 0;
  v4[10] = 0;
  v4[14] = 0;
  int v14 = malloc_type_malloc(0xA8uLL, 0x10A2040785DE303uLL);
  v5[3] = (uint64_t)v14;
  if (v14)
  {
    if (!*(void *)(a1 + 112) && ktxTexture_isActiveStream(a1)) {
      ktxTexture2_LoadImageData(a1, 0, 0, v15);
    }
    uint64_t v16 = v5[3];
    size_t v17 = *(long long **)(a1 + 24);
    long long v18 = v17[6];
    long long v20 = v17[3];
    long long v19 = v17[4];
    *(_OWORD *)(v16 + 80) = v17[5];
    *(_OWORD *)(v16 + 96) = v18;
    *(_OWORD *)(v16 + 48) = v20;
    *(_OWORD *)(v16 + 64) = v19;
    long long v22 = v17[8];
    long long v21 = v17[9];
    long long v23 = v17[7];
    *(void *)(v16 + 160) = *((void *)v17 + 20);
    *(_OWORD *)(v16 + 128) = v22;
    *(_OWORD *)(v16 + 144) = v21;
    *(_OWORD *)(v16 + 112) = v23;
    long long v24 = *v17;
    long long v25 = v17[2];
    *(_OWORD *)(v16 + 16) = v17[1];
    *(_OWORD *)(v16 + 32) = v25;
    *(_OWORD *)uint64_t v16 = v24;
    size_t v26 = 24 * (*(_DWORD *)(a1 + 52) - 1) + 56;
    unsigned int v27 = malloc_type_malloc(v26, 0xACFD6261uLL);
    v5[20] = (uint64_t)v27;
    if (!v27) {
      goto LABEL_20;
    }
    memcpy(v27, *(const void **)(a1 + 160), v26);
    size_t v28 = *(void *)(*(void *)(a1 + 160) + 16);
    if (v28)
    {
      unint64_t v29 = malloc_type_malloc(v28, 0xE6CFAFC2uLL);
      *(void *)v5[20] = v29;
      if (!v29) {
        goto LABEL_20;
      }
      memcpy(v29, **(const void ***)(a1 + 160), *(void *)(*(void *)(a1 + 160) + 16));
    }
    uint64_t v30 = malloc_type_malloc(**(unsigned int **)(a1 + 128), 0xC856DEE6uLL);
    v5[16] = (uint64_t)v30;
    if (v30)
    {
      memcpy(v30, *(const void **)(a1 + 128), **(unsigned int **)(a1 + 128));
      uint64_t v31 = *(void *)(a1 + 80);
      if (v31)
      {
        ktxHashList_ConstructCopy(v5 + 10, v31);
        goto LABEL_18;
      }
      if (!*(void *)(a1 + 96))
      {
LABEL_18:
        uint64_t v34 = malloc_type_malloc(v5[13], 0x2F87B695uLL);
        v5[14] = (uint64_t)v34;
        if (v34)
        {
          memcpy(v34, *(const void **)(a1 + 112), *(void *)(a1 + 104));
          uint64_t result = 0;
          *a2 = v5;
          return result;
        }
        goto LABEL_20;
      }
      int v33 = malloc_type_malloc(*(unsigned int *)(a1 + 88), 0xBDCD7058uLL);
      v5[12] = (uint64_t)v33;
      if (v33)
      {
        memcpy(v33, *(const void **)(a1 + 96), *(unsigned int *)(a1 + 88));
        goto LABEL_18;
      }
    }
LABEL_20:
    uint64_t v35 = (void *)v5[3];
    if (v35) {
      free(v35);
    }
    int v36 = (void **)v5[20];
    if (v36)
    {
      if (*v36)
      {
        free(*v36);
        int v36 = (void **)v5[20];
      }
      free(v36);
    }
    v37 = (void *)v5[16];
    if (v37) {
      free(v37);
    }
    if (v5[10]) {
      ktxHashList_Destruct(v5 + 10);
    }
  }
  free(v5);
  return 13;
}

uint64_t ktxTexture2_CreateFromStdioStream(uint64_t a1, char a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 11;
  }
  long long v6 = malloc_type_malloc(0xA8uLL, 0x1030040B443E594uLL);
  if (v6)
  {
    long long v7 = v6;
    if (a1)
    {
      uint64_t v12 = 0;
      memset(v11, 0, sizeof(v11));
      uint64_t v8 = ktxFileStream_construct((uint64_t)v11, a1, 0);
      if (!v8)
      {
        memset(v13, 0, sizeof(v13));
        uint64_t v9 = (*(uint64_t (**)(_OWORD *, _OWORD *, uint64_t))&v11[0])(v11, v13, 80);
        if (v9)
        {
          uint64_t v8 = v9;
        }
        else
        {
          uint64_t v8 = ktxTexture2_constructFromStreamAndHeader((uint64_t)v7, (uint64_t)v11, (uint64_t)v13, a2);
          if (!v8) {
            goto LABEL_11;
          }
        }
      }
    }
    else
    {
      uint64_t v8 = 11;
    }
    free(v7);
    long long v7 = 0;
LABEL_11:
    *a3 = v7;
    return v8;
  }
  return 13;
}

uint64_t ktxTexture2_CreateFromNamedFile(const char *a1, char a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 11;
  }
  long long v6 = malloc_type_malloc(0xA8uLL, 0x1030040B443E594uLL);
  if (v6)
  {
    long long v7 = v6;
    if (a1)
    {
      uint64_t v8 = fopen(a1, "rb");
      if (v8)
      {
        uint64_t v13 = 0;
        memset(v12, 0, sizeof(v12));
        uint64_t v9 = ktxFileStream_construct((uint64_t)v12, (uint64_t)v8, 1);
        if (!v9)
        {
          memset(v14, 0, sizeof(v14));
          uint64_t v10 = (*(uint64_t (**)(_OWORD *, _OWORD *, uint64_t))&v12[0])(v12, v14, 80);
          if (v10)
          {
            uint64_t v9 = v10;
          }
          else
          {
            uint64_t v9 = ktxTexture2_constructFromStreamAndHeader((uint64_t)v7, (uint64_t)v12, (uint64_t)v14, a2);
            if (!v9) {
              goto LABEL_13;
            }
          }
        }
      }
      else
      {
        uint64_t v9 = 3;
      }
    }
    else
    {
      uint64_t v9 = 11;
    }
    free(v7);
    long long v7 = 0;
LABEL_13:
    *a3 = v7;
    return v9;
  }
  return 13;
}

uint64_t ktxTexture2_CreateFromMemory(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!a4) {
    return 11;
  }
  uint64_t v8 = malloc_type_malloc(0xA8uLL, 0x1030040B443E594uLL);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 11;
    if (a1)
    {
      if (a2)
      {
        uint64_t v14 = 0;
        memset(v13, 0, sizeof(v13));
        uint64_t v10 = ktxMemStream_construct_ro((uint64_t)v13, a1, a2);
        if (!v10)
        {
          memset(v15, 0, sizeof(v15));
          uint64_t v11 = (*(uint64_t (**)(_OWORD *, _OWORD *, uint64_t))&v13[0])(v13, v15, 80);
          if (v11)
          {
            uint64_t v10 = v11;
          }
          else
          {
            uint64_t v10 = ktxTexture2_constructFromStreamAndHeader((uint64_t)v9, (uint64_t)v13, (uint64_t)v15, a3);
            if (!v10)
            {
LABEL_12:
              *a4 = v9;
              return v10;
            }
          }
        }
      }
    }
    free(v9);
    uint64_t v9 = 0;
    goto LABEL_12;
  }
  return 13;
}

uint64_t ktxTexture2_CreateFromStream(uint64_t (**a1)(void, _OWORD *, uint64_t), char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 11;
  }
  long long v6 = malloc_type_malloc(0xA8uLL, 0x1030040B443E594uLL);
  if (v6)
  {
    long long v7 = v6;
    memset(v11, 0, sizeof(v11));
    uint64_t v8 = (*a1)(a1, v11, 80);
    if (v8)
    {
      uint64_t v9 = v8;
    }
    else
    {
      uint64_t v9 = ktxTexture2_constructFromStreamAndHeader((uint64_t)v7, (uint64_t)a1, (uint64_t)v11, a2);
      if (!v9)
      {
LABEL_9:
        *a3 = v7;
        return v9;
      }
    }
    free(v7);
    long long v7 = 0;
    goto LABEL_9;
  }
  return 13;
}

void ktxTexture2_Destroy(void *a1)
{
  unsigned int v2 = (void *)a1[16];
  if (v2) {
    free(v2);
  }
  unsigned int v3 = (void **)a1[20];
  if (v3)
  {
    if (*v3)
    {
      free(*v3);
      unsigned int v3 = (void **)a1[20];
    }
    free(v3);
  }
  ktxTexture_destruct((uint64_t)a1);

  free(a1);
}

uint64_t ktxTexture2_calcDataSizeLevels(uint64_t a1, int a2)
{
  uint64_t v3 = 0;
  int v4 = a2 - 1;
  if (a2 != 1)
  {
    do
    {
      unint64_t v5 = ktxTexture_calcLevelSize(a1, v4, 2);
      float v6 = (float)*(unsigned int *)(*(void *)(a1 + 160) + 8);
      v3 += (float)(ceilf((float)v5 / v6) * v6);
      --v4;
    }
    while (v4);
  }
  return ktxTexture_calcLevelSize(a1, 0, 2) + v3;
}

uint64_t ktxTexture2_calcFaceLodSize(uint64_t a1, unsigned int a2)
{
  if (*(unsigned char *)(a1 + 33) && !*(unsigned char *)(a1 + 32)) {
    return ktxTexture_calcImageSize(a1, a2, 2);
  }
  else {
    return *(void *)(*(void *)(a1 + 160) + 24 * a2 + 48);
  }
}

uint64_t ktxTexture2_calcLevelOffset(uint64_t a1, unsigned int a2)
{
  unsigned int v2 = *(_DWORD *)(a1 + 52) - 1;
  if (v2 <= a2) {
    return 0;
  }
  uint64_t v5 = 0;
  do
  {
    unint64_t v6 = ktxTexture_calcLevelSize(a1, v2, 2);
    float v7 = (float)*(unsigned int *)(*(void *)(a1 + 160) + 8);
    v5 += (float)(ceilf((float)v6 / v7) * v7);
    --v2;
  }
  while (v2 > a2);
  return v5;
}

uint64_t ktxTexture2_levelFileOffset(uint64_t a1, unsigned int a2)
{
  return *(void *)(*(void *)(a1 + 160) + 24) + *(void *)(*(void *)(a1 + 160) + 24 * a2 + 32);
}

uint64_t lcm4(uint64_t result)
{
  if ((result & 3) != 0)
  {
    unsigned int v1 = 4;
    unsigned int v2 = result;
    do
    {
      unsigned int v3 = v2;
      unsigned int v2 = v1 % v2;
      unsigned int v1 = v3;
    }
    while (v2);
    return 4 * (int)result / v3;
  }
  return result;
}

uint64_t ktxTexture2_calcPostInflationLevelAlignment(uint64_t a1)
{
  if (!*(_DWORD *)(a1 + 120)) {
    return 16;
  }
  unsigned int v1 = *(_DWORD *)(*(void *)(a1 + 24) + 32);
  uint64_t result = v1 >> 3;
  if ((v1 & 0x18) != 0)
  {
    unsigned int v3 = 4;
    unsigned int v4 = result;
    do
    {
      unsigned int v5 = v4;
      unsigned int v4 = v3 % v4;
      unsigned int v3 = v5;
    }
    while (v4);
    return 4 * (int)result / v5;
  }
  return result;
}

uint64_t ktxTexture2_GetComponentInfo(uint64_t a1, _DWORD *a2, unsigned int *a3)
{
  return getDFDComponentInfoUnpacked(*(void *)(a1 + 128), a2, a3);
}

uint64_t ktxTexture2_GetNumComponents(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 128);
  uint64_t result = getDFDNumComponents(v1);
  if ((*(_DWORD *)(v1 + 12) & 0x80) != 0)
  {
    int v3 = *(_DWORD *)(v1 + 12);
    if (v3 == 166)
    {
      uint64_t v4 = *(unsigned char *)(v1 + 31) & 0xF;
      if (v4 > 5) {
        return 1;
      }
      else {
        return dword_1889BD1A8[v4];
      }
    }
    else if (v3 == 163)
    {
      if (result == 1)
      {
        if ((*(unsigned char *)(v1 + 31) & 0xF) != 0) {
          return 1;
        }
        else {
          return 3;
        }
      }
      else if (*(unsigned char *)(v1 + 31) & 0xF | ~*(_DWORD *)(v1 + 44) & 0xF000000)
      {
        return 2;
      }
      else
      {
        return 4;
      }
    }
  }
  return result;
}

uint64_t ktxTexture2_GetImageOffset(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4, void *a5)
{
  if (!a1) {
    return 11;
  }
  char v5 = a2;
  if (*(_DWORD *)(a1 + 52) <= a2 || *(_DWORD *)(a1 + 56) <= a3 || *(_DWORD *)(a1 + 136)) {
    return 10;
  }
  if (*(unsigned char *)(a1 + 33))
  {
    if (*(_DWORD *)(a1 + 60) <= a4) {
      return 10;
    }
  }
  else
  {
    unsigned int v10 = *(_DWORD *)(a1 + 44) >> a2;
    if (v10 <= 1) {
      unsigned int v10 = 1;
    }
    if (v10 <= a4) {
      return 10;
    }
  }
  *a5 = *(void *)(*(void *)(a1 + 160) + 24 * a2 + 32);
  if (a3) {
    *a5 += ktxTexture_layerSize(a1, a2, 2) * a3;
  }
  if (!a4) {
    return 0;
  }
  uint64_t v11 = ktxTexture_calcImageSize(a1, v5, 2);
  uint64_t result = 0;
  *a5 += v11 * a4;
  return result;
}

uint64_t ktxTexture2_levelDataOffset(uint64_t a1, unsigned int a2)
{
  return *(void *)(*(void *)(a1 + 160) + 24 * a2 + 32);
}

uint64_t ktxTexture2_GetImageSize(uint64_t a1, char a2)
{
  return ktxTexture_calcImageSize(a1, a2, 2);
}

uint64_t ktxTexture2_GetOETF(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 128) + 14);
}

uint64_t ktxTexture2_GetPremultipliedAlpha(uint64_t a1)
{
  return *(unsigned char *)(*(void *)(a1 + 128) + 15) & 1;
}

BOOL ktxTexture2_NeedsTranscoding(uint64_t a1)
{
  return *(_DWORD *)(a1 + 136) == 1 || *(unsigned __int8 *)(*(void *)(a1 + 128) + 12) == 166;
}

uint64_t ktxTexture2_GetDataSizeUncompressed(uint64_t a1, double a2)
{
  unsigned int v2 = *(_DWORD *)(a1 + 136);
  if (v2 < 2) {
    return *(void *)(a1 + 104);
  }
  if (v2 != 2) {
    return 0;
  }
  uint64_t v4 = *(void *)(a1 + 160);
  if (!*(_DWORD *)(a1 + 120))
  {
    unsigned int v6 = 16;
    uint64_t v10 = (*(_DWORD *)(a1 + 52) - 1);
    if ((int)v10 >= 1) {
      goto LABEL_11;
    }
    return *(void *)(v4 + 48);
  }
  unsigned int v5 = *(_DWORD *)(*(void *)(a1 + 24) + 32);
  unsigned int v6 = v5 >> 3;
  if ((v5 & 0x18) != 0)
  {
    unsigned int v7 = 4;
    unsigned int v8 = v6;
    do
    {
      unsigned int v9 = v8;
      unsigned int v8 = v7 % v8;
      unsigned int v7 = v9;
    }
    while (v8);
    unsigned int v6 = 4 * v6 / v9;
  }
  uint64_t v10 = (*(_DWORD *)(a1 + 52) - 1);
  if ((int)v10 < 1) {
    return *(void *)(v4 + 48);
  }
LABEL_11:
  *(float *)&a2 = (float)v6;
  if (v10 >= 4)
  {
    float32x2_t v13 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a2, 0);
    int v12 = v10 & 3;
    uint64_t v14 = (uint64_t *)(v4 + 24 * v10);
    int64x2_t v15 = 0uLL;
    uint64_t v16 = v10 & 0xFFFFFFFC;
    int64x2_t v17 = 0uLL;
    do
    {
      long long v18 = v14 - 3;
      v19.i64[0] = v14[6];
      v19.i64[1] = v14[3];
      uint64_t v20 = *v14;
      v14 -= 12;
      v21.i64[0] = v20;
      v21.i64[1] = *v18;
      int64x2_t v15 = (int64x2_t)vaddw_u32((uint64x2_t)v15, vcvt_u32_f32(vmul_n_f32(vrndp_f32(vdiv_f32(vcvt_f32_f64(vcvtq_f64_u64(v19)), v13)), *(float *)&a2)));
      int64x2_t v17 = (int64x2_t)vaddw_u32((uint64x2_t)v17, vcvt_u32_f32(vmul_n_f32(vrndp_f32(vdiv_f32(vcvt_f32_f64(vcvtq_f64_u64(v21)), v13)), *(float *)&a2)));
      v16 -= 4;
    }
    while (v16);
    uint64_t v11 = vaddvq_s64(vaddq_s64(v17, v15));
    if ((v10 & 0x7FFFFFFC) == v10) {
      return *(void *)(v4 + 48) + v11;
    }
  }
  else
  {
    uint64_t v11 = 0;
    int v12 = v10;
  }
  long long v22 = (unint64_t *)(v4 + 24 * v12 + 48);
  do
  {
    unint64_t v23 = *v22;
    v22 -= 3;
    v11 += (float)(ceilf((float)v23 / *(float *)&a2) * *(float *)&a2);
    --v12;
  }
  while (v12 > 0);
  return *(void *)(v4 + 48) + v11;
}

uint64_t ktxTexture2_IterateLevels(uint64_t a1, uint64_t (*a2)(uint64_t, void, uint64_t, uint64_t, uint64_t, void, void, uint64_t), uint64_t a3)
{
  uint64_t result = 11;
  if (a1 && a2)
  {
    if (*(_DWORD *)(a1 + 136))
    {
      return 10;
    }
    else
    {
      uint64_t v7 = *(void *)(a1 + 160) + 32;
      uint64_t v8 = (*(_DWORD *)(a1 + 52) - 1);
      while ((v8 & 0x80000000) == 0)
      {
        unsigned int v9 = *(_DWORD *)(a1 + 40);
        unsigned int v10 = *(_DWORD *)(a1 + 36) >> v8;
        if (v10 <= 1) {
          uint64_t v11 = 1;
        }
        else {
          uint64_t v11 = v10;
        }
        if (v9 >> v8 <= 1) {
          uint64_t v12 = 1;
        }
        else {
          uint64_t v12 = v9 >> v8;
        }
        unsigned int v13 = *(_DWORD *)(a1 + 44) >> v8;
        if (v13 <= 1) {
          uint64_t v14 = 1;
        }
        else {
          uint64_t v14 = v13;
        }
        uint64_t result = a2(v8, 0, v11, v12, v14, *(void *)(v7 + 24 * v8 + 16), *(void *)(a1 + 112) + *(void *)(*(void *)(a1 + 160) + 24 * v8 + 32), a3);
        uint64_t v8 = (v8 - 1);
        if (result) {
          return result;
        }
      }
      return 0;
    }
  }
  return result;
}

uint64_t ktxTexture2_IterateLoadLevelFaces(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, void, void, void, uint64_t, char *, uint64_t), uint64_t a3)
{
  if (*(_DWORD *)a1 != 2 || (*(_DWORD *)(a1 + 136) | 2) != 2) {
    return 10;
  }
  if (!a2) {
    return 11;
  }
  uint64_t v5 = *(void *)(a1 + 24);
  if (!*(void *)(v5 + 128)) {
    return 10;
  }
  uint64_t v6 = *(void *)(a1 + 160);
  unint64_t v7 = *(void *)(v6 + 40);
  if (!v7)
  {
    uint64_t v11 = 0;
    uint64_t v15 = 1;
LABEL_14:
    free(v11);
    return v15;
  }
  unsigned int v9 = malloc_type_malloc(*(void *)(v6 + 40), 0x643E3636uLL);
  if (!v9) {
    return 13;
  }
  uint64_t v11 = v9;
  if (*(_DWORD *)(a1 + 136) != 2)
  {
    uint64_t v43 = 0;
    uint64_t v44 = 0;
    unint64_t v41 = v7;
    v45 = (char *)v9;
    goto LABEL_17;
  }
  unint64_t v41 = *(void *)(v6 + 48);
  uint64_t v12 = (char *)malloc_type_malloc(v41, 0x3215A52EuLL);
  if (!v12)
  {
    uint64_t v15 = 13;
    goto LABEL_14;
  }
  unsigned int v13 = v12;
  v10.n128_f64[0] = ZSTD_createDCtx();
  uint64_t v43 = v14;
  uint64_t v44 = v13;
  v45 = v13;
LABEL_17:
  int64x2_t v17 = (uint64_t (**)(void, void *, unint64_t))(v5 + 64);
  unsigned int v18 = *(_DWORD *)(a1 + 52) - 1;
  if ((v18 & 0x80000000) == 0)
  {
    v42 = v11;
    int v40 = (uint64_t (**)(void, void *, unint64_t))(v5 + 64);
    do
    {
      unsigned int v19 = *(_DWORD *)(a1 + 40);
      unsigned int v20 = *(_DWORD *)(a1 + 36) >> v18;
      if (v20 <= 1) {
        unsigned int v20 = 1;
      }
      unsigned int v48 = v20;
      if (v19 >> v18 <= 1) {
        int v21 = 1;
      }
      else {
        int v21 = v19 >> v18;
      }
      unsigned int v22 = *(_DWORD *)(a1 + 44) >> v18;
      if (v22 <= 1) {
        unsigned int v22 = 1;
      }
      unsigned int v46 = v22;
      unsigned int v47 = v21;
      unint64_t v23 = *(void *)(v6 + 32 + 24 * v18 + 8);
      if (v23 - 1 >= v7)
      {
        uint64_t v15 = 1;
        uint64_t v37 = v43;
        int v36 = v44;
        free(v11);
        if (v44) {
          goto LABEL_47;
        }
        goto LABEL_48;
      }
      uint64_t v24 = v18;
      uint64_t v25 = (*(uint64_t (**)(uint64_t (**)(void, void *, unint64_t), void, __n128))(v5 + 96))(v17, *(void *)(*(void *)(a1 + 160) + 24) + *(void *)(*(void *)(a1 + 160) + 24 * v18 + 32), v10);
      if (v25 || (uint64_t v25 = (*v17)(v17, v11, v23), v25))
      {
        uint64_t v15 = v25;
        uint64_t v37 = v43;
        int v36 = v44;
        free(v11);
        if (v44) {
          goto LABEL_47;
        }
        goto LABEL_48;
      }
      if (*(_DWORD *)(a1 + 136) == 2)
      {
        unint64_t v23 = ZSTD_decompressDCtx(v43, v44, v41, (unsigned __int8 *)v11, v23);
        if (ZSTD_isError(v23))
        {
          int ErrorCode = ZSTD_getErrorCode(v23);
          if (ErrorCode == 64) {
            unsigned int v39 = 13;
          }
          else {
            unsigned int v39 = 1;
          }
          if (ErrorCode == 70) {
            return 11;
          }
          else {
            return v39;
          }
        }
      }
      if (*(unsigned char *)(a1 + 33) && !*(unsigned char *)(a1 + 32))
      {
        unsigned int v29 = vcvtps_u32_f32((float)(int)v48 / (float)*(unsigned int *)(v5 + 36));
        v10.n128_f32[0] = (float)(int)v47 / (float)*(unsigned int *)(v5 + 40);
        unsigned int v30 = vcvtps_u32_f32(v10.n128_f32[0]);
        unsigned int v31 = *(_DWORD *)(v5 + 48);
        if (v31 > v29) {
          unsigned int v29 = *(_DWORD *)(v5 + 48);
        }
        if (v31 > v30) {
          unsigned int v30 = *(_DWORD *)(v5 + 48);
        }
        uint64_t v32 = (v29 * *(_DWORD *)(v5 + 32) * v30) >> 3;
        unsigned int v33 = *(_DWORD *)(a1 + 60);
        if (v33 * (unint64_t)v32 > v41)
        {
          uint64_t v15 = 7;
          uint64_t v37 = v43;
          int v36 = v44;
          free(v11);
          if (v44) {
            goto LABEL_47;
          }
          goto LABEL_48;
        }
        unint64_t v26 = v7;
        uint64_t v27 = v5;
        if (v33)
        {
          uint64_t v34 = 0;
          uint64_t v35 = v45;
          while (1)
          {
            uint64_t v28 = a2(v24, v34, v48, v47, v46, v32, v35, a3);
            if (v28) {
              break;
            }
            v35 += v32;
            uint64_t v34 = (v34 + 1);
            if (v34 >= *(_DWORD *)(a1 + 60)) {
              goto LABEL_34;
            }
          }
LABEL_50:
          uint64_t v15 = v28;
          uint64_t v37 = v43;
          int v36 = v44;
          free(v42);
          if (v44) {
            goto LABEL_47;
          }
          goto LABEL_48;
        }
      }
      else
      {
        unint64_t v26 = v7;
        uint64_t v27 = v5;
        uint64_t v28 = a2(v24, 0, v48, v47, v46, v23, v45, a3);
        if (v28) {
          goto LABEL_50;
        }
      }
LABEL_34:
      unsigned int v18 = v24 - 1;
      uint64_t v11 = v42;
      uint64_t v5 = v27;
      unint64_t v7 = v26;
      int64x2_t v17 = v40;
    }
    while ((int)v24 > 0);
  }
  (*(void (**)(uint64_t (**)(void, void *, unint64_t)))(v5 + 112))(v17);
  uint64_t v15 = 0;
  *(void *)(*(void *)(a1 + 160) + 24) = 0;
  uint64_t v37 = v43;
  int v36 = v44;
  free(v11);
  if (v44) {
LABEL_47:
  }
    free(v36);
LABEL_48:
  if (v37) {
    ZSTD_freeDCtx(v37);
  }
  return v15;
}

uint64_t ktxTexture2_inflateZstdInt(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = 11;
  if (!a2 || !a3) {
    return result;
  }
  if (*(_DWORD *)(a1 + 136) != 2) {
    return 10;
  }
  uint64_t v9 = *(void *)(a1 + 24);
  size_t v10 = (24 * *(_DWORD *)(a1 + 52));
  uint64_t v11 = *(void *)(a1 + 160);
  uint64_t v12 = (char *)malloc_type_malloc(v10, 0x2DAE7CB1uLL);
  if (!v12) {
    return 13;
  }
  unsigned int v13 = v12;
  size_t v33 = v10;
  uint64_t v34 = v9;
  uint64_t v37 = v11;
  if (!*(_DWORD *)(a1 + 120))
  {
    unsigned int v19 = 16;
LABEL_13:
    unsigned int v36 = v19;
    goto LABEL_15;
  }
  unsigned int v14 = *(_DWORD *)(*(void *)(a1 + 24) + 32);
  unsigned int v15 = v14 >> 3;
  if ((v14 & 0x18) != 0)
  {
    unsigned int v16 = 4;
    unsigned int v17 = v15;
    do
    {
      unsigned int v18 = v17;
      unsigned int v17 = v16 % v17;
      unsigned int v16 = v18;
    }
    while (v17);
    unsigned int v19 = 4 * v15 / v18;
    goto LABEL_13;
  }
  unsigned int v36 = v14 >> 3;
LABEL_15:
  ZSTD_createDCtx();
  uint64_t v21 = v20;
  int v22 = *(_DWORD *)(a1 + 52);
  unsigned int v23 = v22 - 1;
  uint64_t v35 = a1;
  uint64_t v32 = v13;
  uint64_t v24 = 0;
  if (v22 - 1 < 0)
  {
LABEL_19:
    ZSTD_freeDCtx(v21);
    *(void *)(v35 + 104) = v24;
    *(_DWORD *)(v35 + 136) = 0;
    memcpy((void *)(v37 + 32), v32, v33);
    free(v32);
    uint64_t result = 0;
    *(_DWORD *)(*(void *)(v35 + 160) + 8) = v36;
    *(_DWORD *)(*(void *)(v35 + 128) + 20) = *(_DWORD *)(v34 + 32) >> 3;
  }
  else
  {
    unsigned int v25 = 0;
    unint64_t v26 = (int64x2_t *)&v13[24 * v23 + 8];
    uint64_t v27 = (unint64_t *)(v37 + 24 * v23 + 40);
    while (1)
    {
      uint64_t v28 = v25;
      unint64_t v29 = ZSTD_decompressDCtx(v21, (char *)(a3 + v25), a4, (unsigned __int8 *)(a2 + *(v27 - 1)), *v27);
      if (ZSTD_isError(v29)) {
        break;
      }
      v27 -= 3;
      *unint64_t v26 = vdupq_n_s64(v29);
      v26[-1].i64[1] = v28;
      v24 += v29;
      unsigned int v25 = v28 + (float)(ceilf((float)v29 / (float)v36) * (float)v36);
      a4 -= v29;
      --v22;
      unint64_t v26 = (int64x2_t *)((char *)v26 - 24);
      if (v22 < 1) {
        goto LABEL_19;
      }
    }
    int ErrorCode = ZSTD_getErrorCode(v29);
    if (ErrorCode == 64) {
      unsigned int v31 = 13;
    }
    else {
      unsigned int v31 = 1;
    }
    if (ErrorCode == 70) {
      return 11;
    }
    else {
      return v31;
    }
  }
  return result;
}

uint64_t ktxTexture1_setImageFromStream(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (**a5)(void, uint64_t, uint64_t), uint64_t a6)
{
  unsigned int v20 = 0;
  uint64_t result = 11;
  if (a1 && a5)
  {
    if (*(void *)(a1 + 112))
    {
      size_t __n = 0;
      uint64_t v19 = 0;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t *))(*(void *)(a1 + 8) + 8))(a1, a2, a3, a4, &v19);
      if (*(unsigned char *)(a1 + 34))
      {
        uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 + 8) + 24))(a1, a2);
        size_t __n = 0;
        if (v11 == a6)
        {
LABEL_6:
          (*a5)(a5, *(void *)(a1 + 112) + v19, a6);
          return 0;
        }
      }
      else
      {
        v12.n128_f32[0] = ktxTexture_rowInfo(a1, a2, &v20, (_DWORD *)&__n + 1, &__n);
        if (__n)
        {
          uint64_t v13 = (HIDWORD(__n) - __n);
          if (v13 * v20 == a6)
          {
            uint64_t v14 = *(void *)(a1 + 112);
            int __src = 0;
            if (v20)
            {
              unsigned int v15 = 0;
              uint64_t v16 = v14 + v19;
              do
              {
                uint64_t v17 = v16 + HIDWORD(__n) * v15;
                ((void (*)(void (**)(void, uint64_t, uint64_t), uint64_t, uint64_t, __n128))*a5)(a5, v17, v13, v12);
                memcpy((void *)(v17 + v13), &__src, __n);
                ++v15;
              }
              while (v15 < v20);
            }
            return 0;
          }
        }
        else if (v20 * HIDWORD(__n) == a6)
        {
          goto LABEL_6;
        }
      }
    }
    return 10;
  }
  return result;
}

uint64_t ktxTexture1_SetImageFromStdioStream(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v14 = 0;
  memset(v13, 0, sizeof(v13));
  uint64_t v11 = ktxFileStream_construct((uint64_t)v13, a5, 0);
  if (!v11)
  {
    uint64_t v11 = ktxTexture1_setImageFromStream(a1, a2, a3, a4, (void (**)(void, uint64_t, uint64_t))v13, a6);
    ktxFileStream_destruct((uint64_t)v13);
  }
  return v11;
}

uint64_t ktxTexture1_SetImageFromMemory(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v14 = 0;
  memset(v13, 0, sizeof(v13));
  uint64_t v11 = ktxMemStream_construct_ro((uint64_t)v13, a5, a6);
  if (!v11)
  {
    uint64_t v11 = ktxTexture1_setImageFromStream(a1, a2, a3, a4, (void (**)(void, uint64_t, uint64_t))v13, a6);
    ktxMemStream_destruct((uint64_t)v13);
  }
  return v11;
}

uint64_t ktxTexture1_WriteToStream(uint64_t a1, uint64_t a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v22 = xmmword_1889BD1C0;
  long long v23 = *(_OWORD *)algn_1889BD1D0;
  long long v24 = xmmword_1889BD1E0;
  long long v25 = unk_1889BD1F0;
  uint64_t v21 = 0;
  if (!a2) {
    return 11;
  }
  if (!*(void *)(a1 + 112)) {
    return 10;
  }
  uint64_t v4 = (void *)(a1 + 80);
  if (*(void *)(a1 + 80))
  {
    if (*(void *)(a1 + 96)) {
      return 10;
    }
  }
  *((void *)&v23 + 1) = *(void *)(a1 + 120);
  int v6 = *(_DWORD *)(a1 + 132);
  LODWORD(v24) = *(_DWORD *)(a1 + 128);
  HIDWORD(v22) = 67305985;
  LODWORD(v23) = v6;
  int v7 = ktxTexture1_glTypeSize(a1);
  int v8 = *(_DWORD *)(a1 + 36);
  DWORD1(v23) = v7;
  DWORD1(v24) = v8;
  unsigned int v9 = *(_DWORD *)(a1 + 48);
  if (v9 <= 1)
  {
    *((void *)&v24 + 1) = 0;
    unsigned int v10 = *(unsigned __int8 *)(a1 + 32);
    if (!*(unsigned char *)(a1 + 32)) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  DWORD2(v24) = *(_DWORD *)(a1 + 40);
  if (v9 == 2)
  {
    HIDWORD(v24) = 0;
    unsigned int v10 = *(unsigned __int8 *)(a1 + 32);
    if (!*(unsigned char *)(a1 + 32)) {
      goto LABEL_13;
    }
LABEL_12:
    unsigned int v10 = *(_DWORD *)(a1 + 56);
    goto LABEL_13;
  }
  HIDWORD(v24) = *(_DWORD *)(a1 + 44);
  unsigned int v10 = *(unsigned __int8 *)(a1 + 32);
  if (*(unsigned char *)(a1 + 32)) {
    goto LABEL_12;
  }
LABEL_13:
  *(void *)&long long v25 = __PAIR64__(*(_DWORD *)(a1 + 60), v10);
  if (!*(unsigned char *)(a1 + 35))
  {
    DWORD2(v25) = *(_DWORD *)(a1 + 52);
    if (*v4) {
      goto LABEL_15;
    }
LABEL_17:
    if (*(void *)(a1 + 96))
    {
      uint64_t v21 = *(void **)(a1 + 96);
      HIDWORD(v25) = *(_DWORD *)(a1 + 88);
    }
    else
    {
      HIDWORD(v25) = 0;
    }
    goto LABEL_22;
  }
  DWORD2(v25) = 0;
  if (!*v4) {
    goto LABEL_17;
  }
LABEL_15:
  ktxHashList_Serialize((unsigned int **)(a1 + 80), (_DWORD *)&v25 + 3, (unsigned int **)&v21);
LABEL_22:
  uint64_t v5 = (*(uint64_t (**)(uint64_t, long long *, uint64_t, uint64_t))(a2 + 16))(a2, &v22, 64, 1);
  if (!v5)
  {
    if (!HIDWORD(v25)) {
      goto LABEL_49;
    }
    uint64_t v5 = (*(uint64_t (**)(uint64_t, void *, uint64_t))(a2 + 16))(a2, v21, 1);
    if (*v4) {
      free(v21);
    }
    if (!v5)
    {
LABEL_49:
      if (*(_DWORD *)(a1 + 52))
      {
        unsigned int v12 = 0;
        uint64_t v13 = 0;
        while (1)
        {
          int v20 = 0;
          int v20 = ktxTexture_doCalcFaceLodSize(a1, v13, 1);
          uint64_t v14 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 + 8) + 24))(a1, v13);
          if (*(_DWORD *)(a1 + 44) >> v13 <= 1u) {
            int v15 = 1;
          }
          else {
            int v15 = *(_DWORD *)(a1 + 44) >> v13;
          }
          if (*(unsigned char *)(a1 + 33)) {
            int v15 = *(_DWORD *)(a1 + 60);
          }
          uint64_t v16 = (*(uint64_t (**)(uint64_t, int *, uint64_t, uint64_t))(a2 + 16))(a2, &v20, 4, 1);
          if (v16) {
            break;
          }
          if (*(_DWORD *)(a1 + 56) && v15)
          {
            unsigned int v17 = 0;
            do
            {
              int v18 = v15;
              do
              {
                uint64_t v19 = (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(a2 + 16))(a2, *(void *)(a1 + 112) + v12, v14, 1);
                v12 += v14;
                --v18;
              }
              while (v18);
              ++v17;
            }
            while (v17 < *(_DWORD *)(a1 + 56));
            uint64_t v5 = v19;
            uint64_t v13 = (v13 + 1);
            if (v13 >= *(_DWORD *)(a1 + 52)) {
              return v5;
            }
          }
          else
          {
            uint64_t v5 = 0;
            uint64_t v13 = (v13 + 1);
            if (v13 >= *(_DWORD *)(a1 + 52)) {
              return v5;
            }
          }
        }
        return v16;
      }
      else
      {
        return 0;
      }
    }
  }
  return v5;
}

uint64_t ktxTexture1_WriteToStdioStream(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return 11;
  }
  uint64_t v5 = 0;
  memset(v4, 0, sizeof(v4));
  uint64_t result = ktxFileStream_construct((uint64_t)v4, a2, 0);
  if (!result) {
    return ktxTexture1_WriteToStream(a1, (uint64_t)v4);
  }
  return result;
}

uint64_t ktxTexture1_WriteToNamedFile(uint64_t a1, char *__filename)
{
  if (!a1) {
    return 11;
  }
  int v3 = fopen(__filename, "wb");
  if (!v3) {
    return 3;
  }
  uint64_t v4 = v3;
  uint64_t v8 = 0;
  memset(v7, 0, sizeof(v7));
  uint64_t v5 = ktxFileStream_construct((uint64_t)v7, (uint64_t)v3, 0);
  if (!v5) {
    uint64_t v5 = ktxTexture1_WriteToStream(a1, (uint64_t)v7);
  }
  fclose(v4);
  return v5;
}

uint64_t ktxTexture1_WriteToMemory(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = 11;
  if (!a1) {
    return v3;
  }
  if (!a2) {
    return v3;
  }
  if (!a3) {
    return v3;
  }
  uint64_t v15 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  memset(v10, 0, sizeof(v10));
  uint64_t v9 = 0;
  *a2 = 0;
  uint64_t v3 = ktxMemStream_construct((uint64_t)v10, 0);
  if (v3) {
    return v3;
  }
  uint64_t v8 = ktxTexture1_WriteToStream(a1, (uint64_t)v10);
  if (!v8)
  {
    ktxMemStream_getdata((uint64_t)v10, a2);
    (*((void (**)(_OWORD *, uint64_t *))&v11 + 1))(v10, &v9);
    *a3 = (int)v9;
  }
  ktxMemStream_destruct((uint64_t)v10);
  return v8;
}

uint64_t ktxTexture1_WriteKTX2ToStream(uint64_t a1, uint64_t a2)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  long long v61 = xmmword_1889BD220;
  long long v62 = unk_1889BD230;
  long long v63 = xmmword_1889BD240;
  long long v59 = xmmword_1889BD200;
  long long v60 = *(_OWORD *)algn_1889BD210;
  if (!a2) {
    return 11;
  }
  if (!*(void *)(a1 + 112)) {
    return 10;
  }
  int v4 = *(_DWORD *)(a1 + 124);
  uint64_t appended = 16;
  if (v4 <= 36167)
  {
    if (v4 <= 33775)
    {
      int v6 = 9;
      switch(v4)
      {
        case 33189:
          int v6 = 124;
          goto LABEL_145;
        case 33190:
          int v6 = 125;
          goto LABEL_145;
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
          return appended;
        case 33321:
          goto LABEL_145;
        case 33322:
          int v6 = 70;
          goto LABEL_145;
        case 33323:
          int v6 = 16;
          goto LABEL_145;
        case 33324:
          int v6 = 77;
          goto LABEL_145;
        case 33325:
          int v6 = 76;
          goto LABEL_145;
        case 33326:
          int v6 = 100;
          goto LABEL_145;
        case 33327:
          int v6 = 83;
          goto LABEL_145;
        case 33328:
          int v6 = 103;
          goto LABEL_145;
        case 33329:
          int v6 = 14;
          goto LABEL_145;
        case 33330:
          int v6 = 13;
          goto LABEL_145;
        case 33331:
          int v6 = 75;
          goto LABEL_145;
        case 33332:
          int v6 = 74;
          goto LABEL_145;
        case 33333:
          int v6 = 99;
          goto LABEL_145;
        case 33334:
          int v6 = 98;
          goto LABEL_145;
        case 33335:
          int v6 = 21;
          goto LABEL_145;
        case 33336:
          int v6 = 20;
          goto LABEL_145;
        case 33337:
          int v6 = 82;
          goto LABEL_145;
        case 33338:
          int v6 = 81;
          goto LABEL_145;
        case 33339:
          int v6 = 102;
          goto LABEL_145;
        case 33340:
          int v6 = 101;
          goto LABEL_145;
        default:
          switch(v4)
          {
            case 32848:
              int v6 = 6;
              goto LABEL_145;
            case 32849:
              int v6 = 23;
              goto LABEL_145;
            case 32850:
            case 32857:
              int v6 = 58;
              goto LABEL_145;
            case 32852:
              int v6 = 84;
              goto LABEL_145;
            case 32854:
              int v6 = 2;
              goto LABEL_145;
            case 32855:
              int v6 = 8;
              goto LABEL_145;
            case 32856:
              int v6 = 37;
              goto LABEL_145;
            case 32859:
              int v6 = 91;
              goto LABEL_145;
            default:
              return appended;
          }
      }
      return appended;
    }
    if (v4 > 35411)
    {
      switch(v4)
      {
        case 35840:
        case 35842:
          int v6 = 1000054001;
          goto LABEL_145;
        case 35841:
        case 35843:
          int v6 = 1000054000;
          goto LABEL_145;
        case 35844:
        case 35845:
        case 35846:
        case 35847:
        case 35848:
        case 35849:
        case 35850:
        case 35851:
        case 35852:
        case 35853:
        case 35854:
        case 35855:
        case 35856:
        case 35857:
        case 35858:
        case 35859:
        case 35860:
        case 35861:
        case 35862:
        case 35863:
        case 35864:
        case 35865:
        case 35866:
        case 35867:
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
        case 35882:
        case 35883:
        case 35884:
        case 35885:
        case 35886:
        case 35887:
        case 35888:
        case 35889:
        case 35890:
        case 35891:
        case 35892:
        case 35893:
        case 35894:
        case 35895:
        case 35896:
        case 35897:
        case 35899:
        case 35900:
        case 35902:
        case 35903:
        case 35904:
        case 35906:
        case 35908:
        case 35909:
        case 35910:
        case 35911:
        case 35912:
        case 35913:
        case 35914:
        case 35915:
        case 35920:
        case 35921:
        case 35922:
        case 35923:
        case 35924:
        case 35925:
        case 35926:
        case 35927:
        case 35928:
        case 35929:
        case 35930:
        case 35931:
        case 35932:
        case 35933:
        case 35934:
        case 35935:
        case 35936:
        case 35937:
        case 35938:
        case 35939:
        case 35940:
        case 35941:
        case 35942:
        case 35943:
        case 35944:
        case 35945:
        case 35946:
        case 35947:
        case 35948:
        case 35949:
        case 35950:
        case 35951:
        case 35956:
        case 35957:
        case 35958:
        case 35959:
        case 35960:
        case 35961:
        case 35962:
        case 35963:
        case 35964:
        case 35965:
        case 35966:
        case 35967:
        case 35968:
        case 35969:
        case 35970:
        case 35971:
        case 35972:
        case 35973:
        case 35974:
        case 35975:
        case 35976:
        case 35977:
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
          return appended;
        case 35898:
          int v6 = 122;
          goto LABEL_145;
        case 35901:
          int v6 = 123;
          goto LABEL_145;
        case 35905:
          int v6 = 29;
          goto LABEL_145;
        case 35907:
          int v6 = 43;
          goto LABEL_145;
        case 35916:
          int v6 = 132;
          goto LABEL_145;
        case 35917:
          int v6 = 134;
          goto LABEL_145;
        case 35918:
          int v6 = 136;
          goto LABEL_145;
        case 35919:
          int v6 = 138;
          goto LABEL_145;
        case 35952:
LABEL_33:
          int v6 = 139;
          goto LABEL_145;
        case 35953:
LABEL_34:
          int v6 = 140;
          goto LABEL_145;
        case 35954:
LABEL_35:
          int v6 = 141;
          goto LABEL_145;
        case 35955:
LABEL_36:
          int v6 = 142;
          goto LABEL_145;
        case 36012:
LABEL_37:
          int v6 = 126;
          goto LABEL_145;
        case 36013:
LABEL_38:
          int v6 = 130;
          goto LABEL_145;
        default:
          switch(v4)
          {
            case 35412:
            case 35414:
              int v6 = 1000054004;
              goto LABEL_145;
            case 35413:
            case 35415:
              int v6 = 1000054005;
              goto LABEL_145;
            default:
              return appended;
          }
      }
      return appended;
    }
    switch(v4)
    {
      case 33776:
        int v6 = 131;
        break;
      case 33777:
        int v6 = 133;
        break;
      case 33778:
        int v6 = 135;
        break;
      case 33779:
        int v6 = 137;
        break;
      default:
        JUMPOUT(0);
    }
  }
  else
  {
    if (v4 <= 37174)
    {
      if (v4 > 36491)
      {
        switch(v4)
        {
          case 36756:
            int v6 = 10;
            goto LABEL_145;
          case 36757:
            int v6 = 17;
            goto LABEL_145;
          case 36758:
            int v6 = 24;
            goto LABEL_145;
          case 36759:
            int v6 = 38;
            goto LABEL_145;
          case 36760:
            int v6 = 71;
            goto LABEL_145;
          case 36761:
            int v6 = 78;
            goto LABEL_145;
          case 36762:
            int v6 = 85;
            goto LABEL_145;
          case 36763:
            int v6 = 92;
            goto LABEL_145;
          case 36764:
          case 36765:
          case 36766:
          case 36767:
          case 36768:
          case 36769:
          case 36770:
          case 36771:
          case 36772:
          case 36773:
          case 36774:
          case 36775:
          case 36776:
          case 36777:
          case 36778:
          case 36779:
          case 36780:
          case 36781:
          case 36782:
          case 36783:
          case 36784:
          case 36785:
          case 36786:
          case 36787:
          case 36788:
          case 36789:
          case 36790:
          case 36791:
          case 36792:
          case 36793:
          case 36794:
          case 36795:
          case 36796:
            return appended;
          case 36797:
            int v6 = 15;
            goto LABEL_145;
          case 36798:
            int v6 = 22;
            goto LABEL_145;
          default:
            switch(v4)
            {
              case 36492:
                int v6 = 145;
                goto LABEL_145;
              case 36493:
                int v6 = 146;
                goto LABEL_145;
              case 36494:
                int v6 = 144;
                goto LABEL_145;
              case 36495:
                int v6 = 143;
                goto LABEL_145;
              default:
                if (v4 != 36975) {
                  return appended;
                }
                int v6 = 62;
                break;
            }
            goto LABEL_145;
        }
      }
      else
      {
        switch(v4)
        {
          case 36168:
            int v6 = 127;
            goto LABEL_145;
          case 36194:
            int v6 = 4;
            goto LABEL_145;
          case 36196:
LABEL_32:
            int v6 = 147;
            goto LABEL_145;
          case 36208:
            int v6 = 107;
            goto LABEL_145;
          case 36209:
            int v6 = 104;
            goto LABEL_145;
          case 36214:
            int v6 = 95;
            goto LABEL_145;
          case 36215:
            int v6 = 88;
            goto LABEL_145;
          case 36220:
            int v6 = 41;
            goto LABEL_145;
          case 36221:
            int v6 = 27;
            goto LABEL_145;
          case 36226:
            int v6 = 108;
            goto LABEL_145;
          case 36227:
            int v6 = 105;
            goto LABEL_145;
          case 36232:
            int v6 = 96;
            goto LABEL_145;
          case 36233:
            int v6 = 89;
            goto LABEL_145;
          case 36238:
            int v6 = 42;
            goto LABEL_145;
          case 36239:
            int v6 = 28;
            goto LABEL_145;
          case 36267:
            goto LABEL_37;
          case 36268:
            goto LABEL_38;
          case 36283:
            goto LABEL_33;
          case 36284:
            goto LABEL_34;
          case 36285:
            goto LABEL_35;
          case 36286:
            goto LABEL_36;
          default:
            return appended;
        }
      }
      return appended;
    }
    switch(v4)
    {
      case 37488:
        int v6 = 153;
        break;
      case 37489:
        int v6 = 154;
        break;
      case 37490:
        int v6 = 155;
        break;
      case 37491:
        int v6 = 156;
        break;
      case 37492:
        goto LABEL_32;
      case 37493:
        int v6 = 148;
        break;
      case 37494:
        int v6 = 149;
        break;
      case 37495:
        int v6 = 150;
        break;
      case 37496:
        int v6 = 151;
        break;
      case 37497:
        int v6 = 152;
        break;
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
        return appended;
      case 37808:
        int v6 = 157;
        break;
      case 37809:
        int v6 = 159;
        break;
      case 37810:
        int v6 = 161;
        break;
      case 37811:
        int v6 = 163;
        break;
      case 37812:
        int v6 = 165;
        break;
      case 37813:
        int v6 = 167;
        break;
      case 37814:
        int v6 = 169;
        break;
      case 37815:
        int v6 = 171;
        break;
      case 37816:
        int v6 = 173;
        break;
      case 37817:
        int v6 = 175;
        break;
      case 37818:
        int v6 = 177;
        break;
      case 37819:
        int v6 = 179;
        break;
      case 37820:
        int v6 = 181;
        break;
      case 37821:
        int v6 = 183;
        break;
      case 37840:
        int v6 = 158;
        break;
      case 37841:
        int v6 = 160;
        break;
      case 37842:
        int v6 = 162;
        break;
      case 37843:
        int v6 = 164;
        break;
      case 37844:
        int v6 = 166;
        break;
      case 37845:
        int v6 = 168;
        break;
      case 37846:
        int v6 = 170;
        break;
      case 37847:
        int v6 = 172;
        break;
      case 37848:
        int v6 = 174;
        break;
      case 37849:
        int v6 = 176;
        break;
      case 37850:
        int v6 = 178;
        break;
      case 37851:
        int v6 = 180;
        break;
      case 37852:
        int v6 = 182;
        break;
      case 37853:
        int v6 = 184;
        break;
      case 37872:
        int v6 = 1000054006;
        break;
      case 37873:
        int v6 = 1000054007;
        break;
      default:
        if (v4 == 37175)
        {
          int v6 = 1000054002;
        }
        else
        {
          if (v4 != 37176) {
            return appended;
          }
          int v6 = 1000054003;
        }
        break;
    }
  }
LABEL_145:
  HIDWORD(v59) = v6;
  *(void *)&long long v60 = __PAIR64__(*(_DWORD *)(a1 + 36), ktxTexture1_glTypeSize(a1));
  unsigned int v7 = *(_DWORD *)(a1 + 48);
  if (v7 <= 1)
  {
    *((void *)&v60 + 1) = 0;
    unsigned int v8 = *(unsigned __int8 *)(a1 + 32);
    if (!*(unsigned char *)(a1 + 32)) {
      goto LABEL_151;
    }
    goto LABEL_150;
  }
  DWORD2(v60) = *(_DWORD *)(a1 + 40);
  if (v7 == 2)
  {
    HIDWORD(v60) = 0;
    unsigned int v8 = *(unsigned __int8 *)(a1 + 32);
    if (!*(unsigned char *)(a1 + 32)) {
      goto LABEL_151;
    }
LABEL_150:
    unsigned int v8 = *(_DWORD *)(a1 + 56);
    goto LABEL_151;
  }
  HIDWORD(v60) = *(_DWORD *)(a1 + 44);
  unsigned int v8 = *(unsigned __int8 *)(a1 + 32);
  if (*(unsigned char *)(a1 + 32)) {
    goto LABEL_150;
  }
LABEL_151:
  *(void *)&long long v61 = __PAIR64__(*(_DWORD *)(a1 + 60), v8);
  int v9 = *(_DWORD *)(a1 + 52);
  if (*(unsigned char *)(a1 + 35)) {
    int v10 = 0;
  }
  else {
    int v10 = *(_DWORD *)(a1 + 52);
  }
  DWORD2(v61) = v10;
  size_t v11 = (24 * v9);
  long long v12 = (char *)malloc_type_malloc(v11, 0x3F73FD7FuLL);
  long long v13 = vk2dfd(v6);
  if (v13)
  {
    unsigned int v48 = v13;
    uint64_t v49 = v12;
    unsigned int v57 = 0;
    v56 = 0;
    LODWORD(v62) = v11 + 80;
    int v14 = *(_DWORD *)v13;
    DWORD1(v62) = *(_DWORD *)v13;
    uint64_t v51 = a1;
    uint64_t v17 = *(void *)(a1 + 80);
    uint64_t v16 = (uint64_t *)(a1 + 80);
    uint64_t v15 = v17;
    uint64_t v55 = v17;
    if (v17)
    {
      while (1)
      {
        int v54 = 0;
        v53 = 0;
        ktxHashListEntry_GetKey(v15, &v54, &v53);
        int v18 = v53;
        if (!strncasecmp(v53, "KTX", 3uLL) && strcmp(v18, "KTXorientation") && strcmp(v18, "KTXwriter")) {
          break;
        }
        uint64_t v15 = ktxHashList_Next(v55);
        uint64_t v55 = v15;
        if (!v15) {
          goto LABEL_162;
        }
      }
      uint64_t appended = 10;
      goto LABEL_171;
    }
LABEL_162:
    uint64_t v19 = v51;
    if (!ktxHashList_FindEntry(v16, "KTXorientation", &v55))
    {
      v53 = 0;
      int v54 = 0;
      int v52 = 0;
      ktxHashListEntry_GetValue(v55, &v54, &v53);
      unsigned int v20 = sscanf(v53, "S=%c,T=%c,R=%c", &v52, (char *)&v52 + 1, (char *)&v52 + 2);
      uint64_t v21 = *(unsigned int *)(v51 + 48);
      if (v20 < v21)
      {
        uint64_t appended = 1;
LABEL_171:
        free(v48);
        free(v49);
        return appended;
      }
      unsigned int v22 = v20;
      if (v20 > v21)
      {
        *((unsigned char *)&v52 + v21) = 0;
        unsigned int v22 = v21;
      }
      ktxHashList_DeleteEntry(v16, v55);
      ktxHashList_AddKVPair((uint64_t)v16, "KTXorientation", v22 + 1, &v52);
    }
    uint64_t v55 = 0;
    ktxHashList_FindEntry(v16, "KTXwriter", &v55);
    uint64_t appended = appendLibId(v16, v55);
    if (appended) {
      goto LABEL_171;
    }
    ktxHashList_Sort((uint64_t)v16);
    ktxHashList_Serialize((unsigned int **)v16, &v57, (unsigned int **)&v56);
    if (v57) {
      unsigned int v24 = v14 + v11 + 80;
    }
    else {
      unsigned int v24 = 0;
    }
    *((void *)&v62 + 1) = __PAIR64__(v57, v24);
    unsigned int v25 = v57 + v14 + v11 + 80;
    long long v63 = 0uLL;
    float v26 = (float)lcm4(*(_DWORD *)(*(void *)(v51 + 24) + 32) >> 3);
    uint64_t v27 = (float)-(float)((float)v25 - (float)(v26 * ceilf((float)v25 / v26)));
    int v28 = *(_DWORD *)(v51 + 52) - 1;
    if (v28 >= 0)
    {
      unsigned int v29 = v25 + v27;
      unsigned int v30 = (int64x2_t *)&v49[24 * v28 + 8];
      do
      {
        unint64_t v31 = ktxTexture_calcLevelSize(v51, v28, 2);
        *unsigned int v30 = vdupq_n_s64(v31);
        v30[-1].i64[1] = v29;
        v29 += (float)(ceilf((float)v31 / v26) * v26);
        --v28;
        unsigned int v30 = (int64x2_t *)((char *)v30 - 24);
      }
      while (v28 != -1);
    }
    uint64_t appended = (*(uint64_t (**)(uint64_t, long long *, uint64_t, uint64_t))(a2 + 16))(a2, &v59, 80, 1);
    if (!appended)
    {
      uint64_t appended = (*(uint64_t (**)(uint64_t, char *, size_t, uint64_t))(a2 + 16))(a2, v49, v11, 1);
      if (!appended)
      {
        uint64_t v32 = (*(uint64_t (**)(uint64_t, char *, uint64_t, void))(a2 + 16))(a2, v48, 1, *(unsigned int *)v48);
        if (v57)
        {
          uint64_t appended = (*(uint64_t (**)(uint64_t, void *, uint64_t))(a2 + 16))(a2, v56, 1);
          free(v56);
          if (appended) {
            return appended;
          }
        }
        else
        {
          uint64_t appended = v32;
        }
        memset(v58, 0, sizeof(v58));
        if (!v27
          || (uint64_t appended = (*(uint64_t (**)(uint64_t, _OWORD *, uint64_t, uint64_t))(a2 + 16))(a2, v58, 1, v27),
              !appended))
        {
          int v33 = *(_DWORD *)(v51 + 52);
          uint64_t v34 = (v33 - 1);
          if (v33 - 1 >= 0 && !appended)
          {
            do
            {
              uint64_t v35 = ktxTexture_calcImageSize(v19, v34, 2);
              if (*(_DWORD *)(v19 + 44) >> v34 <= 1u) {
                int v37 = 1;
              }
              else {
                int v37 = *(_DWORD *)(v19 + 44) >> v34;
              }
              if (*(unsigned char *)(v19 + 33)) {
                int v37 = *(_DWORD *)(v19 + 60);
              }
              int v52 = 0;
              LODWORD(v53) = 0;
              int v54 = 0;
              if (!*(unsigned char *)(v19 + 34)) {
                v36.n128_f32[0] = ktxTexture_rowInfo(v19, v34, (unsigned int *)&v53, &v54, &v52);
              }
              unsigned int v38 = (*(uint64_t (**)(uint64_t, uint64_t, __n128))(*(void *)(v19 + 24) + 16))(v19, v34, v36);
              int v47 = v34;
              if (*(_DWORD *)(v19 + 56) && v37)
              {
                unsigned int v39 = v38;
                unint64_t v40 = 0;
                int v41 = 0;
                uint64_t appended = 0;
                do
                {
                  int v50 = v41;
                  for (int i = 0; i != v37; ++i)
                  {
                    if (v52)
                    {
                      if (v53)
                      {
                        unsigned int v43 = 0;
                        uint64_t v44 = *(void *)(v19 + 112) + v39;
                        uint64_t v45 = (v54 - v52);
                        do
                        {
                          uint64_t v46 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a2 + 16))(a2, v44 + v54 * v43, v45, 1);
                          v40 += v45;
                          ++v43;
                        }
                        while (v43 < v53);
                        uint64_t appended = v46;
                        uint64_t v19 = v51;
                      }
                    }
                    else
                    {
                      uint64_t appended = (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(a2 + 16))(a2, *(void *)(v19 + 112) + v39, v35, 1);
                      v40 += v35;
                    }
                    v39 += v35;
                  }
                  int v41 = v50 + 1;
                }
                while ((v50 + 1) < *(_DWORD *)(v19 + 56));
              }
              else
              {
                uint64_t appended = 0;
                unint64_t v40 = 0;
              }
              if (v47 && !appended)
              {
                if ((float)-(float)((float)v40 - (float)(v26 * ceilf((float)v40 / v26)))) {
                  uint64_t appended = (*(uint64_t (**)(uint64_t, _OWORD *, uint64_t))(a2 + 16))(a2, v58, 1);
                }
                else {
                  uint64_t appended = 0;
                }
              }
              if (v47 < 1) {
                break;
              }
              uint64_t v34 = (v47 - 1);
            }
            while (!appended);
          }
          goto LABEL_171;
        }
      }
    }
  }
  return appended;
}

uint64_t ktxTexture1_WriteKTX2ToStdioStream(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return 11;
  }
  uint64_t v5 = 0;
  memset(v4, 0, sizeof(v4));
  uint64_t result = ktxFileStream_construct((uint64_t)v4, a2, 0);
  if (!result) {
    return ktxTexture1_WriteKTX2ToStream(a1, (uint64_t)v4);
  }
  return result;
}

uint64_t ktxTexture1_WriteKTX2ToNamedFile(uint64_t a1, char *__filename)
{
  if (!a1) {
    return 11;
  }
  uint64_t v3 = fopen(__filename, "wb");
  if (!v3) {
    return 3;
  }
  int v4 = v3;
  uint64_t v8 = 0;
  memset(v7, 0, sizeof(v7));
  uint64_t v5 = ktxFileStream_construct((uint64_t)v7, (uint64_t)v3, 0);
  if (!v5) {
    uint64_t v5 = ktxTexture1_WriteKTX2ToStream(a1, (uint64_t)v7);
  }
  fclose(v4);
  return v5;
}

uint64_t ktxTexture1_WriteKTX2ToMemory(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = 11;
  if (!a1) {
    return v3;
  }
  if (!a2) {
    return v3;
  }
  if (!a3) {
    return v3;
  }
  uint64_t v15 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  memset(v10, 0, sizeof(v10));
  uint64_t v9 = 0;
  *a2 = 0;
  uint64_t v3 = ktxMemStream_construct((uint64_t)v10, 0);
  if (v3) {
    return v3;
  }
  uint64_t v8 = ktxTexture1_WriteKTX2ToStream(a1, (uint64_t)v10);
  if (!v8)
  {
    ktxMemStream_getdata((uint64_t)v10, a2);
    (*((void (**)(_OWORD *, uint64_t *))&v11 + 1))(v10, &v9);
    *a3 = (int)v9;
  }
  ktxMemStream_destruct((uint64_t)v10);
  return v8;
}

uint64_t appendLibId(uint64_t *a1, uint64_t a2)
{
  memset(__n, 0, sizeof(__n));
  if (a2)
  {
    ktxHashListEntry_GetValue(a2, __n, &__n[1]);
    int v4 = *(char **)&__n[1];
    int v5 = __n[0];
  }
  else
  {
    int v4 = "Unidentified app";
    *(void *)&__n[1] = "Unidentified app";
    int v5 = 17;
    __n[0] = 17;
  }
  int v6 = strstr(v4, "__default__");
  uint64_t v7 = (v5 - 1);
  if (v4[v7]) {
    LODWORD(v7) = v5;
  }
  else {
    __n[0] = v5 - 1;
  }
  if (v6) {
    uint64_t v8 = "v4.0.__default__";
  }
  else {
    uint64_t v8 = "v4.0.0-76-g16d3b6b4-dirty";
  }
  int v9 = 27;
  if (!v6) {
    int v9 = 36;
  }
  unsigned int v10 = v9 + v7;
  long long v11 = (char *)malloc_type_malloc((v9 + v7), 0x213DE4D8uLL);
  long long v12 = strncpy(v11, *(const char **)&__n[1], __n[0]);
  long long v13 = &v12[__n[0]];
  strcpy(v13, " / libktx ");
  strcpy(v13 + 10, v8);
  ktxHashList_DeleteEntry(a1, a2);
  uint64_t v14 = ktxHashList_AddKVPair((uint64_t)a1, "KTXwriter", v10, v11);
  free(v11);
  return v14;
}

uint64_t ktxTexture2_setImageFromStream(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (**a5)(void, uint64_t, uint64_t), uint64_t a6)
{
  uint64_t result = 11;
  if (a1 && a5)
  {
    if (*(void *)(a1 + 112))
    {
      uint64_t v11 = 0;
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t *))(*(void *)(a1 + 8) + 8))(a1, a2, a3, a4, &v11);
      if (result) {
        return result;
      }
      if ((*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 + 8) + 24))(a1, a2) == a6)
      {
        (*a5)(a5, *(void *)(a1 + 112) + v11, a6);
        return 0;
      }
    }
    return 10;
  }
  return result;
}

uint64_t ktxTexture2_SetImageFromStdioStream(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v14 = 0;
  memset(v13, 0, sizeof(v13));
  uint64_t v11 = ktxFileStream_construct((uint64_t)v13, a5, 0);
  if (!v11)
  {
    if (!a1)
    {
      uint64_t v11 = 11;
      goto LABEL_9;
    }
    if (*(void *)(a1 + 112))
    {
      uint64_t v15 = 0;
      uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t *))(*(void *)(a1 + 8) + 8))(a1, a2, a3, a4, &v15);
      if (v11)
      {
LABEL_9:
        ktxFileStream_destruct((uint64_t)v13);
        return v11;
      }
      if ((*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 + 8) + 24))(a1, a2) == a6)
      {
        (*(void (**)(_OWORD *, uint64_t, uint64_t))&v13[0])(v13, *(void *)(a1 + 112) + v15, a6);
        uint64_t v11 = 0;
        goto LABEL_9;
      }
    }
    uint64_t v11 = 10;
    goto LABEL_9;
  }
  return v11;
}

uint64_t ktxTexture2_SetImageFromMemory(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v14 = 0;
  memset(v13, 0, sizeof(v13));
  uint64_t v11 = ktxMemStream_construct_ro((uint64_t)v13, a5, a6);
  if (!v11)
  {
    if (!a1)
    {
      uint64_t v11 = 11;
      goto LABEL_9;
    }
    if (*(void *)(a1 + 112))
    {
      uint64_t v15 = 0;
      uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t *))(*(void *)(a1 + 8) + 8))(a1, a2, a3, a4, &v15);
      if (v11)
      {
LABEL_9:
        ktxMemStream_destruct((uint64_t)v13);
        return v11;
      }
      if ((*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 + 8) + 24))(a1, a2) == a6)
      {
        (*(void (**)(_OWORD *, uint64_t, uint64_t))&v13[0])(v13, *(void *)(a1 + 112) + v15, a6);
        uint64_t v11 = 0;
        goto LABEL_9;
      }
    }
    uint64_t v11 = 10;
    goto LABEL_9;
  }
  return v11;
}

uint64_t ktxTexture2_WriteToStream(uint64_t a1, uint64_t a2)
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  unsigned int v2 = *(void **)(a1 + 160);
  long long v68 = xmmword_1889BD270;
  long long v69 = unk_1889BD280;
  long long v70 = xmmword_1889BD290;
  long long v66 = xmmword_1889BD250;
  long long v67 = unk_1889BD260;
  if (!a2) {
    return 11;
  }
  if (!*(void *)(a1 + 112)) {
    return 10;
  }
  int v4 = *(_DWORD *)(*(void *)(a1 + 24) + 56);
  HIDWORD(v66) = *(_DWORD *)(a1 + 120);
  LODWORD(v67) = v4;
  DWORD1(v67) = *(_DWORD *)(a1 + 36);
  unsigned int v5 = *(_DWORD *)(a1 + 48);
  if (v5 <= 1)
  {
    *((void *)&v67 + 1) = 0;
    unsigned int v6 = *(unsigned __int8 *)(a1 + 32);
    long long v59 = v2;
    uint64_t v60 = a2;
    if (!*(unsigned char *)(a1 + 32)) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  DWORD2(v67) = *(_DWORD *)(a1 + 40);
  if (v5 == 2)
  {
    HIDWORD(v67) = 0;
    unsigned int v6 = *(unsigned __int8 *)(a1 + 32);
    long long v59 = v2;
    uint64_t v60 = a2;
    if (!*(unsigned char *)(a1 + 32)) {
      goto LABEL_10;
    }
LABEL_9:
    unsigned int v6 = *(_DWORD *)(a1 + 56);
    goto LABEL_10;
  }
  HIDWORD(v67) = *(_DWORD *)(a1 + 44);
  unsigned int v6 = *(unsigned __int8 *)(a1 + 32);
  long long v59 = v2;
  uint64_t v60 = a2;
  if (*(unsigned char *)(a1 + 32)) {
    goto LABEL_9;
  }
LABEL_10:
  *(void *)&long long v68 = __PAIR64__(*(_DWORD *)(a1 + 60), v6);
  int v8 = *(_DWORD *)(a1 + 52);
  if (*(unsigned char *)(a1 + 35)) {
    unsigned int v9 = 0;
  }
  else {
    unsigned int v9 = *(_DWORD *)(a1 + 52);
  }
  unsigned int v63 = 0;
  long long v62 = 0;
  *((void *)&v68 + 1) = __PAIR64__(*(_DWORD *)(a1 + 136), v9);
  size_t size = (24 * v8);
  LODWORD(v69) = size + 80;
  unsigned int v10 = *(_DWORD **)(a1 + 128);
  uint64_t v11 = *v10;
  DWORD1(v69) = *v10;
  for (uint64_t i = *(void *)(a1 + 80); i; uint64_t i = ktxHashList_Next(i))
  {
    LODWORD(v61) = 0;
    v64[0] = 0;
    ktxHashListEntry_GetKey(i, &v61, v64);
    long long v13 = v64[0];
    if (!strncasecmp(v64[0], "KTX", 3uLL)
      && (!strncmp(v13, "ktx", 3uLL)
       || strcmp(v13, "KTXcubemapIncomplete")
       && strcmp(v13, "KTXorientation")
       && strcmp(v13, "KTXglFormat")
       && strcmp(v13, "KTXdxgiFormat__")
       && strcmp(v13, "KTXmetalPixelFormat")
       && strcmp(v13, "KTXswizzle")
       && strcmp(v13, "KTXwriter")
       && strcmp(v13, "KTXwriterScParams")
       && strcmp(v13, "KTXastcDecodeMode")
       && strcmp(v13, "KTXanimData")))
    {
      return 10;
    }
  }
  uint64_t v61 = 0;
  ktxHashList_FindEntry((uint64_t *)(a1 + 80), "KTXwriter", &v61);
  uint64_t appended = appendLibId((uint64_t *)(a1 + 80), v61);
  if (!appended)
  {
    ktxHashList_Sort(a1 + 80);
    ktxHashList_Serialize((unsigned int **)(a1 + 80), &v63, (unsigned int **)&v62);
    unsigned int v14 = v63 ? size + 80 + v11 : 0;
    *((void *)&v69 + 1) = __PAIR64__(v63, v14);
    uint64_t v15 = size + 80 + v11 + v63;
    uint64_t v16 = v59[2];
    if (v16)
    {
      uint64_t v17 = (float)-(float)((float)(unint64_t)v15
                                        - (float)(ceilf((float)(unint64_t)v15 * 0.125) * 8.0));
      uint64_t v18 = v15 + v17;
      v15 += v17;
    }
    else
    {
      uint64_t v18 = 0;
      LODWORD(v17) = 0;
    }
    *(void *)&long long v70 = v18;
    *((void *)&v70 + 1) = v16;
    unsigned int v19 = *(_DWORD *)(*(void *)(a1 + 160) + 8);
    uint64_t appended = (*(uint64_t (**)(uint64_t, long long *, uint64_t, uint64_t))(v60 + 16))(v60, &v66, 80, 1);
    if (!appended)
    {
      uint64_t v21 = (char *)malloc_type_malloc(size, 0x6498B1EFuLL);
      if (!v21) {
        return 13;
      }
      unsigned int v22 = v21;
      uint64_t v23 = v15 + v16;
      uint64_t v24 = (float)-(float)((float)(unint64_t)(v15 + v16)
                                        - (float)((float)v19 * ceilf((float)(unint64_t)(v15 + v16) / (float)v19)));
      uint64_t v25 = *(unsigned int *)(a1 + 52);
      if (v25)
      {
        unint64_t v26 = v23 + v24;
        if (v25 < 0xC)
        {
          uint64_t v27 = 0;
LABEL_44:
          int v28 = &v21[24 * v27 + 8];
          unsigned int v29 = &v59[3 * v27 + 5];
          uint64_t v30 = v25 - v27;
          do
          {
            *(_OWORD *)int v28 = *v29;
            *((void *)v28 - 1) = v26 + *((void *)v29 - 1);
            v28 += 24;
            unsigned int v29 = (_OWORD *)((char *)v29 + 24);
            --v30;
          }
          while (v30);
          goto LABEL_46;
        }
        uint64_t v27 = 0;
        unint64_t v33 = (unint64_t)&v21[24 * v25];
        unint64_t v34 = v33 - 8;
        uint64_t v35 = (char *)&v59[3 * v25];
        unint64_t v36 = (unint64_t)(v35 + 24);
        unint64_t v37 = (unint64_t)(v35 + 16);
        BOOL v38 = v21 + 16 >= v35 + 32 || (unint64_t)(v59 + 6) >= v33;
        char v39 = !v38;
        BOOL v41 = (unint64_t)v21 < v37 && (unint64_t)(v59 + 4) < v33 - 16;
        if ((unint64_t)(v59 + 5) < v34 && (unint64_t)(v21 + 8) < v36) {
          goto LABEL_44;
        }
        if (v39) {
          goto LABEL_44;
        }
        if (v41) {
          goto LABEL_44;
        }
        uint64_t v27 = v25 & 0xFFFFFFFC;
        int64x2_t v43 = vdupq_n_s64(v26);
        uint64_t v44 = (const double *)(v59 + 10);
        uint64_t v45 = v27;
        uint64_t v46 = (double *)v21;
        do
        {
          int v47 = v44 - 6;
          float64x2x3_t v72 = vld3q_f64(v47);
          float64x2x3_t v73 = vld3q_f64(v44);
          v72.val[0] = (float64x2_t)vaddq_s64(v43, (int64x2_t)v72.val[0]);
          v73.val[0] = (float64x2_t)vaddq_s64(v43, (int64x2_t)v73.val[0]);
          unsigned int v48 = v46 + 12;
          vst3q_f64(v46, v72);
          uint64_t v49 = v46 + 6;
          vst3q_f64(v49, v73);
          v44 += 12;
          uint64_t v46 = v48;
          v45 -= 4;
        }
        while (v45);
        if (v27 != v25) {
          goto LABEL_44;
        }
      }
LABEL_46:
      uint64_t appended = (*(uint64_t (**)(uint64_t, char *, size_t, uint64_t, void *))(v60 + 16))(v60, v21, size, 1, v59);
      free(v22);
      if (!appended)
      {
        uint64_t v31 = v60;
        uint64_t v32 = (*(uint64_t (**)(uint64_t, void, uint64_t, void))(v60 + 16))(v60, *(void *)(a1 + 128), 1, **(unsigned int **)(a1 + 128));
        if (v63)
        {
          uint64_t appended = (*(uint64_t (**)(uint64_t, void *, uint64_t))(v60 + 16))(v60, v62, 1);
          free(v62);
          if (appended) {
            return appended;
          }
          uint64_t v31 = v60;
        }
        else
        {
          uint64_t appended = v32;
        }
        *(_OWORD *)uint64_t v64 = 0u;
        long long v65 = 0u;
        uint64_t v50 = v59[2];
        if (v50)
        {
          if (v17)
          {
            uint64_t appended = (*(uint64_t (**)(uint64_t, char **, uint64_t, void))(v31 + 16))(v31, v64, 1, v17);
            if (appended) {
              return appended;
            }
            uint64_t v50 = v59[2];
          }
          uint64_t appended = (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v31 + 16))(v31, *v59, 1, v50);
          if (appended) {
            return appended;
          }
        }
        if (!v24
          || (uint64_t appended = (*(uint64_t (**)(uint64_t, char **, uint64_t, uint64_t))(v31 + 16))(v31, v64, 1, v24),
              !appended))
        {
          signed int v51 = *(_DWORD *)(a1 + 52) - 1;
          if (v51 >= 0 && !appended)
          {
            int v52 = &v59[3 * v51 + 5];
            do
            {
              uint64_t v53 = ktxTexture2_levelDataOffset(a1, v51);
              unint64_t v55 = *v52;
              v52 -= 3;
              unint64_t v54 = v55;
              uint64_t v56 = (*(uint64_t (**)(uint64_t, uint64_t, unint64_t, uint64_t))(v31 + 16))(v31, *(void *)(a1 + 112) + v53, v55, 1);
              uint64_t appended = v56;
              if (v51 && !v56)
              {
                float v57 = (float)*(unsigned int *)(*(void *)(a1 + 160) + 8);
                if ((float)-(float)((float)v54 - (float)(v57 * ceilf((float)v54 / v57)))) {
                  uint64_t appended = (*(uint64_t (**)(uint64_t, char **, uint64_t))(v31 + 16))(v31, v64, 1);
                }
                else {
                  uint64_t appended = 0;
                }
              }
              BOOL v38 = v51-- != 0;
            }
            while (v38 && !appended);
          }
        }
      }
    }
  }
  return appended;
}

uint64_t ktxTexture2_WriteToStdioStream(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return 11;
  }
  uint64_t v5 = 0;
  memset(v4, 0, sizeof(v4));
  uint64_t result = ktxFileStream_construct((uint64_t)v4, a2, 0);
  if (!result) {
    return ktxTexture2_WriteToStream(a1, (uint64_t)v4);
  }
  return result;
}

uint64_t ktxTexture2_WriteToNamedFile(uint64_t a1, char *__filename)
{
  if (!a1) {
    return 11;
  }
  uint64_t v3 = fopen(__filename, "wb");
  if (!v3) {
    return 3;
  }
  int v4 = v3;
  uint64_t v8 = 0;
  memset(v7, 0, sizeof(v7));
  uint64_t v5 = ktxFileStream_construct((uint64_t)v7, (uint64_t)v3, 0);
  if (!v5) {
    uint64_t v5 = ktxTexture2_WriteToStream(a1, (uint64_t)v7);
  }
  fclose(v4);
  return v5;
}

uint64_t ktxTexture2_WriteToMemory(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = 11;
  if (!a1) {
    return v3;
  }
  if (!a2) {
    return v3;
  }
  if (!a3) {
    return v3;
  }
  uint64_t v15 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  memset(v10, 0, sizeof(v10));
  uint64_t v9 = 0;
  *a2 = 0;
  uint64_t v3 = ktxMemStream_construct((uint64_t)v10, 0);
  if (v3) {
    return v3;
  }
  uint64_t v8 = ktxTexture2_WriteToStream(a1, (uint64_t)v10);
  if (!v8)
  {
    ktxMemStream_getdata((uint64_t)v10, a2);
    (*((void (**)(_OWORD *, uint64_t *))&v11 + 1))(v10, &v9);
    *a3 = (int)v9;
  }
  ktxMemStream_destruct((uint64_t)v10);
  return v8;
}

uint64_t ktxTexture2_DeflateZstd(uint64_t a1, int a2)
{
  size_t v3 = (24 * *(_DWORD *)(a1 + 52));
  int v4 = (char *)malloc_type_malloc(*(void *)(a1 + 104) + v3, 0x5D2CA718uLL);
  unint64_t v5 = *(void *)(a1 + 104);
  uint64_t v6 = *(void *)(a1 + 160);
  uint64_t CCtx = ZSTD_createCCtx();
  if (!v4) {
    return 13;
  }
  if (*(_DWORD *)(a1 + 136)) {
    return 10;
  }
  unint64_t v9 = CCtx;
  int __src = &v4[v3];
  __dst = (char *)(v6 + 32);
  int v10 = *(_DWORD *)(a1 + 52);
  size_t __n = v3;
  if (v10 - 1 < 0)
  {
    size_t v12 = 0;
LABEL_10:
    ZSTD_freeCCtx(v9);
    uint64_t v17 = malloc_type_malloc(v12, 0xAF782C40uLL);
    if (v17)
    {
      uint64_t v18 = v17;
      memcpy(v17, __src, v12);
      memcpy(__dst, v4, __n);
      free(v4);
      free(*(void **)(a1 + 112));
      uint64_t result = 0;
      *(void *)(a1 + 104) = v12;
      *(void *)(a1 + 112) = v18;
      *(_DWORD *)(a1 + 136) = 2;
      *(_DWORD *)(*(void *)(a1 + 160) + 8) = 1;
      *(_DWORD *)(*(void *)(a1 + 128) + 20) = 0;
    }
    else
    {
      free(v4);
      return 13;
    }
  }
  else
  {
    uint64_t v11 = 0;
    size_t v12 = 0;
    uint64_t v13 = 24 * (v10 - 1);
    while (1)
    {
      unint64_t v14 = ZSTD_compressCCtx(v9, &__src[v11], v5, (char *)(*(void *)(a1 + 112) + *(void *)&__dst[v13]), *(void *)&__dst[v13 + 8], a2);
      if (ZSTD_isError(v14)) {
        break;
      }
      uint64_t v15 = &v4[v13];
      uint64_t v16 = *(void *)&__dst[v13 + 8];
      *((void *)v15 + 1) = v14;
      *((void *)v15 + 2) = v16;
      *(void *)uint64_t v15 = v11;
      v12 += v14;
      v11 += v14;
      v5 -= v14;
      --v10;
      v13 -= 24;
      if (v10 <= 0) {
        goto LABEL_10;
      }
    }
    free(v4);
    int v19 = ZSTD_getErrorCode(v14) - 42;
    uint64_t result = 11;
    switch(v19)
    {
      case 0:
        return result;
      case 22:
      case 24:
      case 28:
        return 13;
      default:
        return 10;
    }
  }
  return result;
}

void OFDLoadExternalSymbols(void)
{
  if (gLoadCoreTextSymbolsInitOnce != -1) {
    dispatch_once(&gLoadCoreTextSymbolsInitOnce, &__block_literal_global_48);
  }
}

void *___Z22OFDLoadExternalSymbolsv_block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  strcpy(v2, "/System/Library/Frameworks/CoreText.framework/CoreText");
  uint64_t result = dlopen(v2, 257);
  if (result)
  {
    uint64_t v1 = result;
    gIIO_kCTFontAttributeName = (uint64_t)dlsym(result, "kCTFontAttributeName");
    gIIO_kCTFontNameAttribute = (uint64_t)dlsym(v1, "kCTFontNameAttribute");
    gIIO_kCTForegroundColorAttributeName = (uint64_t)dlsym(v1, "kCTForegroundColorAttributeName");
    gFunc_CTFontCopyPostScriptName = dlsym(v1, "CTFontCopyPostScriptName");
    gFunc_CTFontCreateWithName = dlsym(v1, "CTFontCreateWithName");
    gFunc_CTFramesetterCreateWithAttributedString = dlsym(v1, "CTFramesetterCreateWithAttributedString");
    gFunc_CTFramesetterSuggestFrameSizeWithConstraints = dlsym(v1, "CTFramesetterSuggestFrameSizeWithConstraints");
    gFunc_CTLineCreateWithAttributedString = dlsym(v1, "CTLineCreateWithAttributedString");
    gFunc_CTLineDraw = dlsym(v1, "CTLineDraw");
    gFunc_CTFontDescriptorCreateWithAttributes = dlsym(v1, "CTFontDescriptorCreateWithAttributes");
    uint64_t result = dlsym(v1, "CTFontDescriptorMatchFontDescriptorsWithProgressHandler");
    gFunc_CTFontDescriptorMatchFontDescriptorsWithProgressHandler = result;
  }
  return result;
}

void OFDExtractOFDObjectsFromCFArray(const __CFDictionary *a1, void **a2)
{
  if (a1)
  {
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(a1))
    {
      uint64_t v5 = OFDCreateObject(a1);
      unint64_t v6 = (unint64_t)a2[2];
      uint64_t v7 = (uint64_t *)a2[1];
      if ((unint64_t)v7 >= v6)
      {
        uint64_t v27 = ((char *)v7 - (unsigned char *)*a2) >> 3;
        if ((unint64_t)(v27 + 1) >> 61) {
LABEL_43:
        }
          std::vector<IIOTag *>::__throw_length_error[abi:ne180100]();
        uint64_t v28 = v6 - (void)*a2;
        uint64_t v29 = v28 >> 2;
        if (v28 >> 2 <= (unint64_t)(v27 + 1)) {
          uint64_t v29 = v27 + 1;
        }
        if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v30 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v30 = v29;
        }
        if (v30) {
          uint64_t v31 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<IIOTag *>>((uint64_t)(a2 + 2), v30);
        }
        else {
          uint64_t v31 = 0;
        }
        uint64_t v32 = (uint64_t *)&v31[8 * v27];
        unint64_t v33 = &v31[8 * v30];
        *uint64_t v32 = v5;
        uint64_t v8 = v32 + 1;
        uint64_t v35 = (char *)*a2;
        unint64_t v34 = (char *)a2[1];
        if (v34 != *a2)
        {
          do
          {
            uint64_t v36 = *((void *)v34 - 1);
            v34 -= 8;
            *--uint64_t v32 = v36;
          }
          while (v34 != v35);
          unint64_t v34 = (char *)*a2;
        }
        *a2 = v32;
        a2[1] = v8;
        a2[2] = v33;
        if (v34) {
          operator delete(v34);
        }
      }
      else
      {
        uint64_t *v7 = v5;
        uint64_t v8 = v7 + 1;
      }
      a2[1] = v8;
    }
    else
    {
      CFIndex Count = CFArrayGetCount(a1);
      if (Count)
      {
        CFIndex v10 = Count;
        for (CFIndex i = 0; i != v10; ++i)
        {
          CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, i);
          uint64_t v13 = OFDCreateObject(ValueAtIndex);
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v16 = (uint64_t *)a2[1];
            unint64_t v15 = (unint64_t)a2[2];
            if ((unint64_t)v16 >= v15)
            {
              uint64_t v18 = ((char *)v16 - (unsigned char *)*a2) >> 3;
              if ((unint64_t)(v18 + 1) >> 61) {
                goto LABEL_43;
              }
              uint64_t v19 = v15 - (void)*a2;
              uint64_t v20 = v19 >> 2;
              if (v19 >> 2 <= (unint64_t)(v18 + 1)) {
                uint64_t v20 = v18 + 1;
              }
              if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v21 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v21 = v20;
              }
              if (v21) {
                unsigned int v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<IIOTag *>>((uint64_t)(a2 + 2), v21);
              }
              else {
                unsigned int v22 = 0;
              }
              uint64_t v23 = (uint64_t *)&v22[8 * v18];
              *uint64_t v23 = v14;
              uint64_t v17 = v23 + 1;
              uint64_t v25 = (char *)*a2;
              uint64_t v24 = (char *)a2[1];
              if (v24 != *a2)
              {
                do
                {
                  uint64_t v26 = *((void *)v24 - 1);
                  v24 -= 8;
                  *--uint64_t v23 = v26;
                }
                while (v24 != v25);
                uint64_t v24 = (char *)*a2;
              }
              *a2 = v23;
              a2[1] = v17;
              a2[2] = &v22[8 * v21];
              if (v24) {
                operator delete(v24);
              }
            }
            else
            {
              *uint64_t v16 = v13;
              uint64_t v17 = v16 + 1;
            }
            a2[1] = v17;
          }
        }
      }
    }
  }
}

uint64_t OFDCreateObject(const __CFDictionary *a1)
{
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (TypeID == CFGetTypeID(a1))
  {
    if (CFDictionaryContainsKey(a1, @"TextCode")) {
      operator new();
    }
    if (CFDictionaryContainsKey(a1, @"ResourceID")) {
      operator new();
    }
    if (CFDictionaryContainsKey(a1, @"PageRef")) {
      operator new();
    }
    operator new();
  }
  return 0;
}

void sub_18896FFC4(_Unwind_Exception *a1)
{
  MEMORY[0x18C11C0E0](v1, 0x10A1C40473883AELL);
  _Unwind_Resume(a1);
}

uint64_t OFDCopyResourcePathFromDictionary(IIODictionary *a1, uint64_t a2, const __CFString *a3)
{
  uint64_t v9 = 0;
  CFIndex v10 = &v9;
  uint64_t v11 = 0x2000000000;
  uint64_t v12 = 0;
  if (a1)
  {
    ArrayObjectForPath = IIODictionary::getArrayObjectForPath(a1, "Res.MultiMedias.MultiMedia");
    if (ArrayObjectForPath)
    {
      memset(v8, 0, sizeof(v8));
      IIOArray::IIOArray((IIOArray *)v8, ArrayObjectForPath);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 0x40000000;
      v7[2] = ___Z33OFDCopyResourcePathFromDictionaryP13IIODictionaryyPK10__CFString_block_invoke;
      v7[3] = &unk_1E53CF8F0;
      v7[4] = &v9;
      v7[5] = a2;
      IIOArray::enumerate((uint64_t)v8, (uint64_t)v7);
      IIOArray::~IIOArray((IIOArray *)v8);
    }
  }
  uint64_t v5 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

void sub_188970114(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  IIOArray::~IIOArray((IIOArray *)va);
  _Block_object_dispose((const void *)(v8 - 48), 8);
  _Unwind_Resume(a1);
}

void ___Z33OFDCopyResourcePathFromDictionaryP13IIODictionaryyPK10__CFString_block_invoke(uint64_t a1, CFTypeRef cf, uint64_t a3, unsigned char *a4)
{
  CFTypeID v7 = CFGetTypeID(cf);
  if (v7 == CFDictionaryGetTypeID())
  {
    memset(v9, 0, sizeof(v9));
    IIODictionary::IIODictionary((IIODictionary *)v9, (const __CFDictionary *)cf);
    if (IIODictionary::getUint64ForKey((IIODictionary *)v9, "ID") == *(const __CFDictionary **)(a1 + 40))
    {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CFDictionaryGetValue((CFDictionaryRef)cf, @"MediaFile");
      uint64_t v8 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      if (v8)
      {
        CFRetain(v8);
        *a4 = 1;
      }
    }
    IIODictionary::~IIODictionary((IIODictionary *)v9);
  }
}

void sub_188970200(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  IIODictionary::~IIODictionary((IIODictionary *)va);
  _Unwind_Resume(a1);
}

void CGAffineTransformFromString(const __CFString *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3 = MEMORY[0x1E4F1DAB8];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *a2 = *MEMORY[0x1E4F1DAB8];
  a2[1] = v4;
  a2[2] = *(_OWORD *)(v3 + 32);
  if (a1)
  {
    memset(v7, 0, sizeof(v7));
    uint64_t v5 = IIOString::IIOString((IIOString *)v7, a1);
    unint64_t v6 = (const char *)IIOString::utf8String(v5);
    sscanf(v6, "%lf %lf %lf %lf %lf %lf", a2, (char *)a2 + 8, a2 + 1, (char *)a2 + 24, a2 + 2, (char *)a2 + 40);
    IIOString::~IIOString((IIOString *)v7);
  }
}

void sub_1889702A4(_Unwind_Exception *a1)
{
  IIOString::~IIOString((IIOString *)(v1 - 40));
  _Unwind_Resume(a1);
}

double CGRectFromString(const char *a1)
{
  long long v2 = 0u;
  long long v3 = 0u;
  sscanf(a1, "%lf %lf %lf %lf", &v2, (char *)&v2 + 8, &v3, (char *)&v3 + 8);
  return *(double *)&v2;
}

double CGRectFromCFString(const __CFString *a1)
{
  if (!a1) {
    return *MEMORY[0x1E4F1DB28];
  }
  memset(v4, 0, sizeof(v4));
  IIOString::IIOString((IIOString *)v4, a1);
  if (IIOString::length((IIOString *)v4))
  {
    uint64_t v1 = (const char *)IIOString::utf8String((IIOString *)v4);
    double v2 = CGRectFromString(v1);
  }
  else
  {
    double v2 = *MEMORY[0x1E4F1DB20];
  }
  IIOString::~IIOString((IIOString *)v4);
  return v2;
}

void sub_1889703BC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  IIOString::~IIOString((IIOString *)va);
  _Unwind_Resume(a1);
}

void OFDParseTextDelta(void *a1, uint64_t *a2)
{
  memset(v25, 0, sizeof(v25));
  long long v3 = IIOString::IIOString((IIOString *)v25, a1);
  uint64_t v24 = 0;
  long long v22 = 0u;
  memset(v23, 0, sizeof(v23));
  *(_OWORD *)uint64_t v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  long long v4 = (char *)IIOString::utf8String(v3);
  std::string::basic_string[abi:ne180100]<0>(&__p, v4);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t *)&v15, &__p, 24);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  memset(&__p, 0, sizeof(__p));
  while (1)
  {
    uint64_t v5 = std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&v15, (uint64_t)&__p, 0x20u);
    if ((*((unsigned char *)v5 + *(void *)(*v5 - 24) + 32) & 5) != 0) {
      break;
    }
    if ((*((unsigned char *)&__p.__r_.__value_.__s + 23) & 0x80) != 0)
    {
      if (*__p.__r_.__value_.__l.__data_ == 103) {
        goto LABEL_10;
      }
      if (__p.__r_.__value_.__l.__size_)
      {
LABEL_24:
        unint64_t v10 = a2[1];
        if (v10 >= a2[2])
        {
          uint64_t v12 = std::vector<std::string>::__push_back_slow_path<std::string const&>(a2, (long long *)&__p);
        }
        else
        {
          if ((*((unsigned char *)&__p.__r_.__value_.__s + 23) & 0x80) != 0)
          {
            std::string::__init_copy_ctor_external((std::string *)a2[1], __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
          }
          else
          {
            long long v11 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
            *(void *)(v10 + 16) = *((void *)&__p.__r_.__value_.__l + 2);
            *(_OWORD *)unint64_t v10 = v11;
          }
          uint64_t v12 = v10 + 24;
          a2[1] = v10 + 24;
        }
        a2[1] = v12;
      }
    }
    else if (__p.__r_.__value_.__s.__data_[0] == 103)
    {
LABEL_10:
      std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&v15, (uint64_t)&__p, 0x20u);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        p_p = &__p;
      }
      else {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      int v7 = atoi((const char *)p_p);
      std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&v15, (uint64_t)&__p, 0x20u);
      if (v7 >= 1)
      {
        uint64_t v8 = (std::string *)a2[1];
        do
        {
          if ((unint64_t)v8 >= a2[2])
          {
            uint64_t v8 = (std::string *)std::vector<std::string>::__push_back_slow_path<std::string const&>(a2, (long long *)&__p);
          }
          else
          {
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
            {
              std::string::__init_copy_ctor_external(v8, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
            }
            else
            {
              long long v9 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
              v8->__r_.__value_.__r.__words[2] = __p.__r_.__value_.__r.__words[2];
              *(_OWORD *)&v8->__r_.__value_.__l.__data_ = v9;
            }
            a2[1] = (uint64_t)++v8;
          }
          a2[1] = (uint64_t)v8;
          --v7;
        }
        while (v7);
      }
    }
    else if (*((unsigned char *)&__p.__r_.__value_.__s + 23))
    {
      goto LABEL_24;
    }
  }
  if ((*((unsigned char *)&__p.__r_.__value_.__s + 23) & 0x80) != 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  *(void *)&long long v15 = *MEMORY[0x1E4FBA408];
  uint64_t v13 = *(void *)(MEMORY[0x1E4FBA408] + 72);
  *(void *)((char *)&v15 + *(void *)(v15 - 24)) = *(void *)(MEMORY[0x1E4FBA408] + 64);
  *(void *)&long long v16 = v13;
  *((void *)&v16 + 1) = MEMORY[0x1E4FBA470] + 16;
  if (SHIBYTE(v21) < 0) {
    operator delete(v20[1]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x18C11C080](v23);
  IIOString::~IIOString((IIOString *)v25);
}

void sub_188970710(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  IIOString::~IIOString((IIOString *)(v16 - 72));
  _Unwind_Resume(a1);
}

uint64_t *std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](uint64_t *a1, const std::string *a2, int a3)
{
  uint64_t v6 = MEMORY[0x1E4FBA488] + 104;
  a1[16] = MEMORY[0x1E4FBA488] + 104;
  int v7 = a1 + 2;
  uint64_t v8 = MEMORY[0x1E4FBA488] + 64;
  a1[2] = MEMORY[0x1E4FBA488] + 64;
  uint64_t v9 = (uint64_t)(a1 + 3);
  unint64_t v10 = (void *)MEMORY[0x1E4FBA408];
  uint64_t v11 = *(void *)(MEMORY[0x1E4FBA408] + 24);
  uint64_t v12 = *(void *)(MEMORY[0x1E4FBA408] + 16);
  *a1 = v12;
  *(uint64_t *)((char *)a1 + *(void *)(v12 - 24)) = v11;
  a1[1] = 0;
  uint64_t v13 = (std::ios_base *)((char *)a1 + *(void *)(*a1 - 24));
  std::ios_base::init(v13, a1 + 3);
  uint64_t v14 = MEMORY[0x1E4FBA488] + 24;
  v13[1].__vftable = 0;
  v13[1].__fmtflags_ = -1;
  uint64_t v15 = v10[5];
  uint64_t v16 = v10[4];
  a1[2] = v16;
  *(void *)((char *)v7 + *(void *)(v16 - 24)) = v15;
  uint64_t v17 = v10[1];
  *a1 = v17;
  *(uint64_t *)((char *)a1 + *(void *)(v17 - 24)) = v10[6];
  *a1 = v14;
  a1[16] = v6;
  a1[2] = v8;
  std::stringbuf::basic_stringbuf[abi:ne180100](v9, a2, a3);
  return a1;
}

void sub_188970A10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

void *std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(void *a1, uint64_t a2, unsigned __int8 a3)
{
  char v11 = 0;
  MEMORY[0x18C11BEC0](&v11, a1, 1);
  if (!v11) {
    return a1;
  }
  if (*(char *)(a2 + 23) < 0)
  {
    **(unsigned char **)a2 = 0;
    *(void *)(a2 + 8) = 0;
  }
  else
  {
    *(unsigned char *)a2 = 0;
    *(unsigned char *)(a2 + 23) = 0;
  }
  uint64_t v6 = 0;
  while (1)
  {
    int v7 = *(void **)((char *)a1 + *(void *)(*a1 - 24) + 40);
    uint64_t v8 = (unsigned char *)v7[3];
    if (v8 != (unsigned char *)v7[4])
    {
      void v7[3] = v8 + 1;
      LOBYTE(v7) = *v8;
      goto LABEL_9;
    }
    LODWORD(v7) = (*(uint64_t (**)(void *))(*v7 + 80))(v7);
    if (v7 == -1) {
      break;
    }
LABEL_9:
    if (v7 == a3)
    {
      int v9 = 0;
      goto LABEL_17;
    }
    std::string::push_back((std::string *)a2, (std::string::value_type)v7);
    --v6;
    if (*(char *)(a2 + 23) < 0 && *(void *)(a2 + 8) == 0x7FFFFFFFFFFFFFF7)
    {
      int v9 = 4;
      goto LABEL_17;
    }
  }
  if (v6) {
    int v9 = 2;
  }
  else {
    int v9 = 6;
  }
LABEL_17:
  std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | v9);
  return a1;
}

void sub_188970B9C(void *a1)
{
  __cxa_begin_catch(a1);
  uint64_t v2 = *v1;
  *(_DWORD *)((char *)v1 + *(void *)(*v1 - 24) + 32) |= 1u;
  if ((*((unsigned char *)v1 + *(void *)(v2 - 24) + 36) & 1) == 0)
  {
    __cxa_end_catch();
    JUMPOUT(0x188970B5CLL);
  }
  __cxa_rethrow();
}

void sub_188970C18(_Unwind_Exception *a1)
{
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1E4FBA408];
  uint64_t v3 = *MEMORY[0x1E4FBA408];
  *(void *)a1 = *MEMORY[0x1E4FBA408];
  uint64_t v4 = *(void *)(v2 + 72);
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 64);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = MEMORY[0x1E4FBA470] + 16;
  if (*(char *)(a1 + 111) < 0) {
    operator delete(*(void **)(a1 + 88));
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x18C11C080](a1 + 128);
  return a1;
}

void OFDParsePathOperations(void *a1, uint64_t *a2)
{
  memset(v22, 0, sizeof(v22));
  uint64_t v3 = IIOString::IIOString((IIOString *)v22, a1);
  uint64_t v21 = 0;
  long long v19 = 0u;
  memset(v20, 0, sizeof(v20));
  *(_OWORD *)uint64_t v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  uint64_t v4 = (char *)IIOString::utf8String(v3);
  std::string::basic_string[abi:ne180100]<0>(&__p, v4);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t *)&v12, &__p, 24);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  memset(&__p, 0, sizeof(__p));
  while (1)
  {
    uint64_t v5 = std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&v12, (uint64_t)&__p, 0x20u);
    if ((*((unsigned char *)v5 + *(void *)(*v5 - 24) + 32) & 5) != 0) {
      break;
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = __p.__r_.__value_.__l.__size_;
    }
    if (size)
    {
      unint64_t v7 = a2[1];
      if (v7 >= a2[2])
      {
        uint64_t v9 = std::vector<std::string>::__push_back_slow_path<std::string const&>(a2, (long long *)&__p);
      }
      else
      {
        if ((*((unsigned char *)&__p.__r_.__value_.__s + 23) & 0x80) != 0)
        {
          std::string::__init_copy_ctor_external((std::string *)a2[1], __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
        }
        else
        {
          long long v8 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
          *(void *)(v7 + 16) = *((void *)&__p.__r_.__value_.__l + 2);
          *(_OWORD *)unint64_t v7 = v8;
        }
        uint64_t v9 = v7 + 24;
        a2[1] = v7 + 24;
      }
      a2[1] = v9;
    }
  }
  if ((*((unsigned char *)&__p.__r_.__value_.__s + 23) & 0x80) != 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  *(void *)&long long v12 = *MEMORY[0x1E4FBA408];
  uint64_t v10 = *(void *)(MEMORY[0x1E4FBA408] + 72);
  *(void *)((char *)&v12 + *(void *)(v12 - 24)) = *(void *)(MEMORY[0x1E4FBA408] + 64);
  *(void *)&long long v13 = v10;
  *((void *)&v13 + 1) = MEMORY[0x1E4FBA470] + 16;
  if (SHIBYTE(v18) < 0) {
    operator delete(v17[1]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x18C11C080](v20);
  IIOString::~IIOString((IIOString *)v22);
}

void sub_188970FD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  IIOString::~IIOString((IIOString *)(v16 - 56));
  _Unwind_Resume(a1);
}

void OFDParseColor(__CFDictionary *a1, _DWORD *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  memset(v13, 0, sizeof(v13));
  IIODictionary::IIODictionary((IIODictionary *)v13, a1);
  CFDictionaryRef ObjectForKey = IIODictionary::getObjectForKey((IIODictionary *)v13, @"ColorSpace");
  if (ObjectForKey)
  {
    memset(buffer, 0, sizeof(buffer));
    *(void *)&long long v15 = 0;
    IIOString::IIOString((IIOString *)buffer, ObjectForKey);
    IIOString::utf8String((IIOString *)buffer);
    *a2 = 1;
    IIOString::~IIOString((IIOString *)buffer);
  }
  else
  {
    *a2 = 1;
  }
  CFStringRef v4 = (const __CFString *)IIODictionary::getObjectForKey((IIODictionary *)v13, @"Value");
  if (!v4) {
    goto LABEL_29;
  }
  *(_OWORD *)buffer = 0u;
  long long v15 = 0u;
  CFStringGetCString(v4, buffer, 32, 0x8000100u);
  for (uint64_t i = 0; i != 32; i += 8)
  {
    int8x8_t v6 = vceqz_s8(*(int8x8_t *)&buffer[i]);
    if (v6.i8[0]) {
      buffer[i] = 32;
    }
    if (v6.i8[1]) {
      buffer[i + 1] = 32;
    }
    if (v6.i8[2]) {
      buffer[i + 2] = 32;
    }
    if (v6.i8[3]) {
      buffer[i + 3] = 32;
    }
    if (v6.i8[4]) {
      buffer[i + 4] = 32;
    }
    if (v6.i8[5]) {
      buffer[i + 5] = 32;
    }
    if (v6.i8[6]) {
      buffer[i + 6] = 32;
    }
    if (v6.i8[7]) {
      buffer[i + 7] = 32;
    }
  }
  HIBYTE(v15) = 0;
  unint64_t v7 = strtok(buffer, " ,");
  if (v7)
  {
    unint64_t v8 = 0;
    do
    {
      unsigned int v9 = v8 + 1;
      *(double *)&a2[2 * v8 + 2] = atof(v7) / 255.0;
      unint64_t v7 = strtok(0, " ,");
      if (!v7) {
        break;
      }
    }
    while (v8++ < 3);
  }
  else
  {
LABEL_29:
    unsigned int v9 = 0;
  }
  CFDictionaryRef v11 = IIODictionary::getObjectForKey((IIODictionary *)v13, @"Alpha");
  if (v11)
  {
    memset(buffer, 0, sizeof(buffer));
    *(void *)&long long v15 = 0;
    IIOString::IIOString((IIOString *)buffer, v11);
    if (v9 <= 3)
    {
      long long v12 = (const char *)IIOString::utf8String((IIOString *)buffer);
      *(double *)&a2[2 * v9 + 2] = atof(v12) / 255.0;
    }
    IIOString::~IIOString((IIOString *)buffer);
  }
  else if (v9 <= 3)
  {
    *(void *)&a2[2 * v9 + 2] = 0x3FF0000000000000;
  }
  IIODictionary::~IIODictionary((IIODictionary *)v13);
}

void sub_1889712A4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v3 = va_arg(va1, void);
  uint64_t v5 = va_arg(va1, void);
  uint64_t v6 = va_arg(va1, void);
  IIOString::~IIOString((IIOString *)va1);
  IIODictionary::~IIODictionary((IIODictionary *)va);
  _Unwind_Resume(a1);
}

CGColorRef OFDCreateCGColor(uint64_t a1)
{
  if (*(_DWORD *)a1 != 1) {
    return 0;
  }
  uint64_t v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
  CGColorRef v3 = CGColorCreate(v2, (const CGFloat *)(a1 + 8));
  if (v2) {
    CGColorSpaceRelease(v2);
  }
  return v3;
}

uint64_t std::stringbuf::basic_stringbuf[abi:ne180100](uint64_t a1, const std::string *a2, int a3)
{
  uint64_t v6 = std::streambuf::basic_streambuf();
  *(void *)uint64_t v6 = MEMORY[0x1E4FBA470] + 16;
  *(_OWORD *)(v6 + 64) = 0u;
  *(_OWORD *)(v6 + 80) = 0u;
  *(_DWORD *)(v6 + 96) = a3;
  std::string::operator=((std::string *)(v6 + 64), a2);
  std::stringbuf::__init_buf_ptrs[abi:ne180100](a1);
  return a1;
}

void sub_1889713C4(_Unwind_Exception *a1)
{
  if (*(char *)(v1 + 87) < 0) {
    operator delete(*v2);
  }
  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

void std::stringbuf::__init_buf_ptrs[abi:ne180100](uint64_t a1)
{
  *(void *)(a1 + 88) = 0;
  uint64_t v2 = (std::string *)(a1 + 64);
  char v3 = *(unsigned char *)(a1 + 87);
  if (v3 < 0)
  {
    CFStringRef v4 = *(std::string **)(a1 + 64);
    unint64_t v5 = *(void *)(a1 + 72);
  }
  else
  {
    CFStringRef v4 = v2;
    unint64_t v5 = *(unsigned __int8 *)(a1 + 87);
  }
  int v6 = *(_DWORD *)(a1 + 96);
  if ((v6 & 8) != 0)
  {
    *(void *)(a1 + 88) = (char *)v4 + v5;
    *(void *)(a1 + 16) = v4;
    *(void *)(a1 + 24) = v4;
    *(void *)(a1 + 32) = (char *)v4 + v5;
  }
  if ((v6 & 0x10) != 0)
  {
    *(void *)(a1 + 88) = (char *)v4 + v5;
    std::string::size_type v7 = v3 < 0 ? (*(void *)(a1 + 80) & 0x7FFFFFFFFFFFFFFFLL) - 1 : 22;
    std::string::resize(v2, v7, 0);
    uint64_t v8 = *(char *)(a1 + 87) < 0 ? *(void *)(a1 + 72) : *(unsigned __int8 *)(a1 + 87);
    *(void *)(a1 + 40) = v4;
    *(void *)(a1 + 48) = v4;
    *(void *)(a1 + 56) = (char *)v4 + v8;
    if ((*(unsigned char *)(a1 + 96) & 3) != 0)
    {
      if (v5 >> 31)
      {
        uint64_t v9 = ((v5 - 0x80000000) * (unsigned __int128)0x200000005uLL) >> 64;
        unint64_t v10 = 0x7FFFFFFF * ((v9 + ((v5 - 0x80000000 - v9) >> 1)) >> 30);
        CFStringRef v4 = (std::string *)((char *)v4 + v10 + 0x7FFFFFFF);
        unint64_t v5 = v5 - v10 - 0x7FFFFFFF;
        *(void *)(a1 + 48) = v4;
      }
      if (v5) {
        *(void *)(a1 + 48) = (char *)v4 + v5;
      }
    }
  }
}

void OFDContainer::OFDContainer(OFDContainer *this, const char *a2)
{
  *(void *)this = &unk_1ED4DF230;
  *((void *)this + 3) = 0;
  operator new();
}

void sub_1889715D4(_Unwind_Exception *a1)
{
  MEMORY[0x18C11C0E0](v1, 0x10A1C4047070A01);
  _Unwind_Resume(a1);
}

void OFDContainer::OFDContainer(OFDContainer *this, unsigned __int8 *a2, unsigned int a3)
{
  *(void *)this = &unk_1ED4DF230;
  *((void *)this + 3) = 0;
  *((void *)this + 5) = a3;
  operator new();
}

void sub_1889716A4(_Unwind_Exception *a1)
{
  MEMORY[0x18C11C0E0](v1, 0x10A1C4047070A01);
  _Unwind_Resume(a1);
}

void OFDContainer::~OFDContainer(OFDContainer *this)
{
  *(void *)this = &unk_1ED4DF230;
  uint64_t v2 = *((void *)this + 4);
  if (v2) {
    unzCloseCurrentFile(v2);
  }
  uint64_t v3 = *((void *)this + 1);
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  uint64_t v4 = *((void *)this + 2);
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
}

{
  uint64_t vars8;

  OFDContainer::~OFDContainer(this);

  JUMPOUT(0x18C11C0E0);
}

BOOL OFDContainer::initializeFiles(OFDContainer *this)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v17 = 0uLL;
  if (unzGetGlobalInfo(*((void *)this + 4), &v17)) {
    BOOL v2 = 1;
  }
  else {
    BOOL v2 = (void)v17 == 0;
  }
  if (!v2)
  {
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    unsigned int v5 = 1;
    do
    {
      long long v19 = 0u;
      memset(cStr, 0, sizeof(cStr));
      uint64_t v16 = 0;
      long long v15 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      *(_OWORD *)CFDictionaryRef v11 = 0u;
      long long v12 = 0u;
      memset(v10, 0, sizeof(v10));
      if (unzGetCurrentFileInfo64(*((void *)this + 4), (uint64_t)v10, (uint64_t)cStr, 0x100uLL, 0, 0, 0, 0)|| *(void *)&v11[2] > 0xFFFFFFFEuLL)
      {
        break;
      }
      HIBYTE(v19) = 0;
      CFStringRef v6 = CFStringCreateWithCString(v4, (const char *)cStr, 0x8000100u);
      if (v6)
      {
        uint64_t v7 = *((void *)this + 2);
        IIONumber::IIONumber((IIONumber *)v9, v11[2]);
        IIODictionary::setObjectForKey(v7, (uint64_t)v9, v6);
        IIONumber::~IIONumber((IIONumber *)v9);
        CFRelease(v6);
      }
      if ((void)v17 == v5) {
        break;
      }
      if (unzGoToNextFile(*((void **)this + 4))) {
        break;
      }
      unint64_t v8 = v5++;
    }
    while ((unint64_t)v17 > v8);
  }
  return IIODictionary::getCount(*((IIODictionary **)this + 2)) != 0;
}

void sub_188971954(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  IIONumber::~IIONumber((IIONumber *)va);
  _Unwind_Resume(a1);
}

BOOL OFDContainer::initializeAttributes(OFDContainer *this)
{
  CFDataRef v2 = OFDContainer::copyFileContent(this, "OFD.xml");
  CFDataRef v3 = v2;
  if (v2)
  {
    *((void *)this + 1) = XMLDictionaryCreateWithData(v2);
    CFRelease(v3);
  }
  return v3 != 0;
}

IIODictionary *OFDContainer::initializeRootDocument(OFDContainer *this)
{
  uint64_t result = (IIODictionary *)*((void *)this + 1);
  if (result)
  {
    ArrayObjectForPath = IIODictionary::getArrayObjectForPath(result, @"OFD.DocBody.DocRoot");
    uint64_t result = (IIODictionary *)CFArrayGetValueAtIndex(ArrayObjectForPath, 0);
    if (result) {
      operator new();
    }
  }
  return result;
}

void sub_188971A6C(_Unwind_Exception *a1)
{
  MEMORY[0x18C11C0E0](v1, 0x10B3C400AA5E179);
  _Unwind_Resume(a1);
}

CFDataRef OFDContainer::copyFileContent(OFDContainer *this, const char *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v4 = *(unsigned __int8 *)a2;
  if (unzGoToFirstFile(*((void **)this + 4))) {
    return 0;
  }
  unsigned int v5 = (char *)(v4 == 47 ? a2 + 1 : a2);
  if (unzLocateFile(*((void *)this + 4), v5, 0)) {
    return 0;
  }
  memset(v18, 0, sizeof(v18));
  memset(v11, 0, sizeof(v11));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v17 = 0;
  if (unzGetCurrentFileInfo64(*((void *)this + 4), (uint64_t)v11, (uint64_t)v18, 0x100uLL, 0, 0, 0, 0))return 0; {
  CFIndex v7 = *((void *)&v12 + 1);
  }
  if (*((void *)&v12 + 1) > 0xFFFFFFFEuLL) {
    return 0;
  }
  unint64_t v8 = (UInt8 *)malloc_type_calloc(*((void *)&v12 + 1) + 1, 1uLL, 0x19EA9DD4uLL);
  if (!v8) {
    return 0;
  }
  uint64_t v9 = v8;
  if (unzOpenCurrentFile(*((void *)this + 4))
    || unzReadCurrentFile(*((void *)this + 4), (uint64_t)v9, v7) != v7)
  {
    CFDataRef v6 = 0;
  }
  else
  {
    CFDataRef v6 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v9, v7);
  }
  free(v9);
  return v6;
}

void OFDTemplate::OFDTemplate(OFDTemplate *this, OFDDocument *a2, char *__s, int a4)
{
  *(void *)this = &unk_1ED4DEE48;
  *((void *)this + 3) = 0;
  CFDataRef v6 = (char *)this + 24;
  *((void *)this + 4) = 0;
  *((void *)this + 5) = 0;
  *((void *)this + 8) = 0;
  *((void *)this + 9) = 0;
  *((void *)this + 10) = 0;
  *((void *)this + 2) = a2;
  std::string::basic_string[abi:ne180100]<0>(&v9, __s);
  if (*((char *)this + 47) < 0) {
    operator delete(*(void **)v6);
  }
  *(_OWORD *)CFDataRef v6 = v9;
  *((void *)v6 + 2) = v10;
  *((_DWORD *)this + 2) = a4;
  *((unsigned char *)this + 56) = 0;
  CFIndex v7 = (_OWORD *)MEMORY[0x1E4F1DB28];
  *((void *)this + 6) = 0;
  long long v8 = v7[1];
  *(_OWORD *)((char *)this + 88) = *v7;
  *(_OWORD *)((char *)this + 104) = v8;
}

void sub_188971CCC(_Unwind_Exception *exception_object)
{
  unsigned int v5 = *v3;
  if (*v3)
  {
    *(void *)(v1 + 72) = v5;
    operator delete(v5);
  }
  if (*(char *)(v1 + 47) < 0) {
    operator delete(*v2);
  }
  _Unwind_Resume(exception_object);
}

void OFDTemplate::~OFDTemplate(OFDTemplate *this)
{
  *(void *)this = &unk_1ED4DEE48;
  uint64_t v2 = *((void *)this + 6);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  CFDataRef v3 = (void *)*((void *)this + 8);
  if (v3)
  {
    *((void *)this + 9) = v3;
    operator delete(v3);
  }
  if (*((char *)this + 47) < 0) {
    operator delete(*((void **)this + 3));
  }
}

{
  uint64_t vars8;

  OFDTemplate::~OFDTemplate(this);

  JUMPOUT(0x18C11C0E0);
}

uint64_t OFDTemplate::open(OFDTemplate *this)
{
  if (!*((unsigned char *)this + 56))
  {
    uint64_t v2 = (OFDContainer **)*((void *)this + 2);
    CFDataRef v3 = (char *)this + 24;
    if (*((char *)this + 47) < 0) {
      CFDataRef v3 = *(const char **)v3;
    }
    CFDataRef v4 = OFDDocument::copyFileContent(v2, v3);
    if (v4)
    {
      CFDataRef v5 = v4;
      *((unsigned char *)this + 56) = OFDTemplate::parseXML(this, v4);
      CFRelease(v5);
    }
  }
  return *((unsigned __int8 *)this + 56);
}

BOOL OFDTemplate::parseXML(OFDTemplate *this, const __CFData *a2)
{
  CFDataRef v3 = (IIODictionary *)XMLDictionaryCreateWithData(a2);
  CFDataRef v4 = v3;
  *((void *)this + 6) = v3;
  if (v3)
  {
    ArrayObjectForPath = IIODictionary::getArrayObjectForPath(v3, @"Page.Area.PhysicalBox");
    CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(ArrayObjectForPath, 0);
    *((double *)this + 11) = CGRectFromCFString(ValueAtIndex);
    *((void *)this + 12) = v7;
    *((void *)this + 13) = v8;
    *((void *)this + 14) = v9;
    uint64_t v10 = IIODictionary::getArrayObjectForPath(*((IIODictionary **)this + 6), @"Page.Content.Layer.TextObject");
    OFDExtractOFDObjectsFromCFArray(v10, (void **)this + 8);
    CFDictionaryRef v11 = IIODictionary::getArrayObjectForPath(*((IIODictionary **)this + 6), @"Page.Content.Layer.PathObject");
    OFDExtractOFDObjectsFromCFArray(v11, (void **)this + 8);
  }
  else
  {
    _cg_jpeg_mem_term("parseXML", 110, "*** ERROR: XMLDictionaryCreateWithData failed\n");
  }
  return v4 != 0;
}

void OFDTemplate::drawTemplateInContext(uint64_t a1, CGContext *a2, uint64_t a3, double a4, double a5, double a6, double a7)
{
  uint64_t v7 = *(CGFloat ***)(a1 + 64);
  while (v7 != *(CGFloat ***)(a1 + 72))
  {
    long long v16 = *v7++;
    long long v15 = v16;
    (*(void (**)(CGFloat *))(*(void *)v16 + 24))(v16);
    CGContextSaveGState(a2);
    CGContextTranslateCTM(a2, v15[9], v15[10]);
    (*(void (**)(CGFloat *, CGContext *, uint64_t, double, double, double, double))(*(void *)v15 + 16))(v15, a2, a3, a4, a5, a6, a7);
    CGContextRestoreGState(a2);
  }
}

void OFDSignatureObject::OFDSignatureObject(OFDSignatureObject *this, const __CFDictionary *a2)
{
  *(void *)OFDObject::OFDObject((uint64_t)this, a2, 4) = &unk_1ED4E48B8;
  memset(v3, 0, sizeof(v3));
  IIODictionary::IIODictionary((IIODictionary *)v3, a2);
  IIODictionary::~IIODictionary((IIODictionary *)v3);
}

void sub_188972048(_Unwind_Exception *a1, uint64_t a2, const char *a3)
{
  _cg_jpeg_mem_term(v3, a2, a3);
  _Unwind_Resume(a1);
}

void OFDSignatureObject::~OFDSignatureObject(OFDSignatureObject *this, uint64_t a2, const char *a3)
{
  _cg_jpeg_mem_term(this, a2, a3);

  JUMPOUT(0x18C11C0E0);
}

void OFDSignatureObject::drawInContext(OFDSignatureObject *this, CGContext *a2, CGRect a3, OFDContainer ***a4)
{
  CFArrayRef v5 = OFDPage::copySignatureFilePath((OFDPage *)a4);
  memset(v12, 0, sizeof(v12));
  IIOString::IIOString((IIOString *)v12, v5);
  if (v5) {
    CFRelease(v5);
  }
  CFDataRef v6 = a4[2];
  uint64_t v7 = (const char *)IIOString::utf8String((IIOString *)v12);
  CFDataRef v8 = OFDDocument::copyFileContent(v6, v7);
  CFDataRef v9 = v8;
  if (v8)
  {
    BytePtr = CFDataGetBytePtr(v8);
    CFDataGetLength(v9);
    memset(v11, 0, sizeof(v11));
    ASN1Parser::ASN1Parser((ASN1Parser *)v11);
    ASN1Parser::parseASN1((ASN1Parser *)v11, BytePtr);
  }
  IIOString::~IIOString((IIOString *)v12);
}

void sub_188972378(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27,char a28)
{
  OFDContainer::~OFDContainer((OFDContainer *)&a15);
  if (a27 < 0) {
    operator delete(__p);
  }
  ASN1Parser::~ASN1Parser((ASN1Parser *)&a28);
  IIOString::~IIOString((IIOString *)(v28 - 120));
  _Unwind_Resume(a1);
}

uint64_t OFDObject::OFDObject(uint64_t a1, const __CFDictionary *a2, char a3)
{
  *(void *)a1 = &unk_1ED4E6018;
  *(unsigned char *)(a1 + 8) = a3;
  memset(v16, 0, sizeof(v16));
  CFDataRef v4 = IIODictionary::IIODictionary((IIODictionary *)v16, a2);
  if (IIODictionary::getCount(v4))
  {
    CFStringRef ObjectForKey = (const __CFString *)IIODictionary::getObjectForKey((IIODictionary *)v16, @"CTM");
    CGAffineTransformFromString(ObjectForKey, v15);
    long long v6 = v15[1];
    *(_OWORD *)(a1 + 24) = v15[0];
    *(_OWORD *)(a1 + 40) = v6;
    *(_OWORD *)(a1 + 56) = v15[2];
    CFStringRef v7 = (const __CFString *)IIODictionary::getObjectForKey((IIODictionary *)v16, @"Boundary");
    *(double *)(a1 + 72) = CGRectFromCFString(v7);
    *(void *)(a1 + 80) = v8;
    *(void *)(a1 + 88) = v9;
    *(void *)(a1 + 96) = v10;
    *(void *)(a1 + 16) = IIODictionary::getUint64ForKey((IIODictionary *)v16, @"ID");
    *(unsigned char *)(a1 + 105) = IIODictionary::getBoolForKey((IIODictionary *)v16, "Fill");
    BOOL v11 = !IIODictionary::containsKey((IIODictionary *)v16, "Stroke")
       || IIODictionary::getBoolForKey((IIODictionary *)v16, "Stroke");
    *(_OWORD *)(a1 + 112) = 0u;
    *(unsigned char *)(a1 + 104) = v11;
    *(_OWORD *)(a1 + 128) = 0u;
    *(_OWORD *)(a1 + 144) = 0u;
    *(_OWORD *)(a1 + 160) = 0u;
    *(_OWORD *)(a1 + 176) = 0u;
    long long v12 = IIODictionary::getObjectForKey((IIODictionary *)v16, @"FillColor");
    if (v12) {
      OFDParseColor(v12, (_DWORD *)(a1 + 152));
    }
    long long v13 = IIODictionary::getObjectForKey((IIODictionary *)v16, @"StrokeColor");
    if (v13) {
      OFDParseColor(v13, (_DWORD *)(a1 + 112));
    }
  }
  IIODictionary::~IIODictionary((IIODictionary *)v16);
  return a1;
}

void sub_188972550(_Unwind_Exception *a1)
{
  IIODictionary::~IIODictionary((IIODictionary *)(v1 - 40));
  _Unwind_Resume(a1);
}

void OFDObject::~OFDObject(OFDObject *this)
{
}

void OFDPage::OFDPage(OFDPage *this, OFDDocument *a2, char *__s, int a4)
{
  *(void *)this = &unk_1ED4E5A38;
  *((void *)this + 3) = 0;
  CFStringRef v7 = (char *)this + 24;
  *((void *)this + 4) = 0;
  *((void *)this + 5) = 0;
  *((void *)this + 10) = 0;
  *((void *)this + 11) = 0;
  *((void *)this + 12) = 0;
  *((void *)this + 2) = a2;
  std::string::basic_string[abi:ne180100]<0>(&v13, __s);
  if (*((char *)this + 47) < 0) {
    operator delete(*(void **)v7);
  }
  *(_OWORD *)CFStringRef v7 = v13;
  *((void *)v7 + 2) = v14;
  if (!strstr(__s, ".xml"))
  {
    if (*((char *)this + 47) >= 0) {
      size_t v8 = *((unsigned __int8 *)this + 47);
    }
    else {
      size_t v8 = *((void *)this + 4);
    }
    uint64_t v14 = 0;
    long long v13 = 0uLL;
    uint64_t v9 = &v13;
    std::string::basic_string[abi:ne180100]((uint64_t)&v13, v8 + 12);
    if (v14 < 0) {
      uint64_t v9 = (long long *)v13;
    }
    if (v8)
    {
      if (*((char *)this + 47) >= 0) {
        uint64_t v10 = v7;
      }
      else {
        uint64_t v10 = (const void *)*((void *)this + 3);
      }
      memmove(v9, v10, v8);
    }
    strcpy((char *)v9 + v8, "/Content.xml");
    if (*((char *)this + 47) < 0) {
      operator delete(*(void **)v7);
    }
    *(_OWORD *)CFStringRef v7 = v13;
    *((void *)v7 + 2) = v14;
  }
  *((_DWORD *)this + 2) = a4;
  *((void *)this + 8) = 0;
  BOOL v11 = (_OWORD *)MEMORY[0x1E4F1DB28];
  *((void *)this + 6) = 0;
  *((void *)this + 7) = 0;
  long long v12 = v11[1];
  *(_OWORD *)((char *)this + 104) = *v11;
  *(_OWORD *)((char *)this + 120) = v12;
  *((unsigned char *)this + 72) = 0;
  OFDPage::extractSignature(this);
}

void sub_18897271C(_Unwind_Exception *exception_object)
{
  CFArrayRef v5 = *v3;
  if (*v3)
  {
    *(void *)(v1 + 88) = v5;
    operator delete(v5);
  }
  if (*(char *)(v1 + 47) < 0) {
    operator delete(*v2);
  }
  _Unwind_Resume(exception_object);
}

void OFDPage::extractSignature(OFDPage *this)
{
  uint64_t v2 = *((void *)this + 2);
  if (*(char *)(v2 + 63) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(v2 + 40), *(void *)(v2 + 48));
  }
  else {
    std::string __p = *(std::string *)(v2 + 40);
  }
  uint64_t v3 = std::string::append(&__p, "/Signs/Sign_0/Signature.xml");
  long long v4 = *(_OWORD *)&v3->__r_.__value_.__l.__data_;
  int64_t v10 = v3->__r_.__value_.__r.__words[2];
  *(_OWORD *)uint64_t v9 = v4;
  v3->__r_.__value_.__l.__size_ = 0;
  v3->__r_.__value_.__r.__words[2] = 0;
  v3->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (v10 >= 0) {
    CFArrayRef v5 = v9;
  }
  else {
    CFArrayRef v5 = (void **)v9[0];
  }
  CFDataRef v6 = OFDDocument::copyFileContent(*((OFDContainer ***)this + 2), (const char *)v5);
  CFDataRef v7 = v6;
  if (v6)
  {
    *((void *)this + 8) = XMLDictionaryCreateWithData(v6);
    CFRelease(v7);
  }
  if (SHIBYTE(v10) < 0) {
    operator delete(v9[0]);
  }
}

void sub_188972824(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void OFDPage::~OFDPage(OFDPage *this)
{
  *(void *)this = &unk_1ED4E5A38;
  uint64_t v2 = *((void *)this + 6);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  uint64_t v3 = *((void *)this + 7);
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  uint64_t v4 = *((void *)this + 8);
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  CFArrayRef v5 = (void *)*((void *)this + 10);
  if (v5)
  {
    *((void *)this + 11) = v5;
    operator delete(v5);
  }
  if (*((char *)this + 47) < 0) {
    operator delete(*((void **)this + 3));
  }
}

{
  uint64_t vars8;

  OFDPage::~OFDPage(this);

  JUMPOUT(0x18C11C0E0);
}

CFDataRef OFDPage::open(OFDPage *this)
{
  if (*((unsigned char *)this + 72)) {
    return (CFDataRef)1;
  }
  uint64_t v3 = (OFDContainer **)*((void *)this + 2);
  uint64_t v4 = (char *)this + 24;
  if (*((char *)this + 47) < 0) {
    uint64_t v4 = *(const char **)v4;
  }
  CFDataRef result = OFDDocument::copyFileContent(v3, v4);
  *((unsigned char *)this + 72) = result != 0;
  if (result)
  {
    CFArrayRef v5 = result;
    OFDPage::parseXML(this, result);
    CFRelease(v5);
    return (CFDataRef)(*((unsigned char *)this + 72) != 0);
  }
  return result;
}

BOOL OFDPage::parseXML(OFDPage *this, const __CFData *a2)
{
  uint64_t v3 = (IIODictionary *)XMLDictionaryCreateWithData(a2);
  uint64_t v4 = v3;
  *((void *)this + 6) = v3;
  if (v3)
  {
    ArrayObjectForPath = IIODictionary::getArrayObjectForPath(v3, @"Page.Area.PhysicalBox");
    if (ArrayObjectForPath)
    {
      CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(ArrayObjectForPath, 0);
      double v7 = CGRectFromCFString(ValueAtIndex);
    }
    else
    {
      uint64_t v11 = *((void *)this + 2);
      double v7 = *(double *)(v11 + 152);
      uint64_t v8 = *(void *)(v11 + 160);
      uint64_t v9 = *(void *)(v11 + 168);
      uint64_t v10 = *(void *)(v11 + 176);
    }
    *((double *)this + 13) = v7;
    *((void *)this + 14) = v8;
    *((void *)this + 15) = v9;
    *((void *)this + 16) = v10;
    long long v12 = (IIODictionary *)*((void *)this + 6);
    if (v12)
    {
      long long v13 = IIODictionary::getArrayObjectForPath(v12, @"Page.Content.Layer.TextObject");
      OFDExtractOFDObjectsFromCFArray(v13, (void **)this + 10);
      uint64_t v14 = IIODictionary::getArrayObjectForPath(*((IIODictionary **)this + 6), @"Page.Content.Layer.PathObject");
      OFDExtractOFDObjectsFromCFArray(v14, (void **)this + 10);
      long long v15 = IIODictionary::getArrayObjectForPath(*((IIODictionary **)this + 6), @"Page.Content.Layer.ImageObject");
      OFDExtractOFDObjectsFromCFArray(v15, (void **)this + 10);
    }
    long long v16 = (IIODictionary *)*((void *)this + 8);
    if (v16)
    {
      uint64_t v17 = IIODictionary::getArrayObjectForPath(v16, @"Signature.SignedInfo.StampAnnot");
      OFDExtractOFDObjectsFromCFArray(v17, (void **)this + 10);
    }
  }
  return v4 != 0;
}

double OFDPage::physicalBox(OFDPage *this)
{
  if (*((void *)this + 6)) {
    return *((double *)this + 13);
  }
  else {
    return 0.0;
  }
}

CFStringRef OFDPage::copyResourcePath(IIODictionary **this, unsigned int a2, const __CFString *a3)
{
  CFStringRef result = (CFStringRef)OFDCopyResourcePathFromDictionary(this[7], a2, a3);
  if (!result)
  {
    double v7 = (IIODictionary **)this[2];
    return OFDDocument::copyResourcePath(v7, a2, a3);
  }
  return result;
}

const __CFArray *OFDPage::copySignatureFilePath(OFDPage *this)
{
  uint64_t v1 = (IIODictionary *)*((void *)this + 8);
  if (!v1) {
    return 0;
  }
  ArrayObjectForPath = IIODictionary::getArrayObjectForPath(v1, @"Signature.SignedValue");
  CFArrayRef v3 = ArrayObjectForPath;
  if (!ArrayObjectForPath) {
    return v3;
  }
  if (!CFArrayGetCount(ArrayObjectForPath)) {
    return 0;
  }
  CFArrayRef ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(v3, 0);
  CFArrayRef v3 = ValueAtIndex;
  if (ValueAtIndex) {
    CFRetain(ValueAtIndex);
  }
  return v3;
}

void OFDPage::drawInContext(OFDPage *this, CGContextRef c, CGRect a3)
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v14.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v14.c = v9;
  *(_OWORD *)&v14.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  CGContextSetTextMatrix(c, &v14);
  TemplateAtIndedouble x = OFDDocument::getTemplateAtIndex(*((OFDDocument **)this + 2), *((_DWORD *)this + 2));
  if (TemplateAtIndex) {
    OFDTemplate::drawTemplateInContext(TemplateAtIndex, c, (uint64_t)this, x, y, width, height);
  }
  uint64_t v11 = (CGFloat **)*((void *)this + 10);
  while (v11 != *((CGFloat ***)this + 11))
  {
    long long v13 = *v11++;
    long long v12 = v13;
    (*(void (**)(CGFloat *))(*(void *)v13 + 24))(v13);
    CGContextSaveGState(c);
    CGContextTranslateCTM(c, v12[9], v12[10]);
    (*(void (**)(CGFloat *, CGContextRef, OFDPage *, double, double, double, double))(*(void *)v12 + 16))(v12, c, this, x, y, width, height);
    CGContextRestoreGState(c);
  }
}

void OFDDocument::OFDDocument(OFDDocument *this, OFDContainer *a2, const char *a3)
{
  *((_OWORD *)this + 1) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(void *)this = &unk_1ED4DEE28;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  operator new();
}

void sub_188972F80(_Unwind_Exception *exception_object)
{
  CFDataRef v6 = *(void **)(v1 + 128);
  if (v6)
  {
    *(void *)(v1 + 136) = v6;
    operator delete(v6);
  }
  double v7 = *v4;
  if (*v4)
  {
    *(void *)(v1 + 112) = v7;
    operator delete(v7);
  }
  if (*(char *)(v1 + 63) < 0) {
    operator delete(*v3);
  }
  if (*(char *)(v1 + 39) < 0) {
    operator delete(*v2);
  }
  _Unwind_Resume(exception_object);
}

void OFDDocument::extractResources(OFDDocument *this)
{
  uint64_t v2 = (char *)this + 40;
  if (*((char *)this + 63) >= 0) {
    size_t v3 = *((unsigned __int8 *)this + 63);
  }
  else {
    size_t v3 = *((void *)this + 6);
  }
  v17[1] = 0;
  uint64_t v18 = 0;
  v17[0] = 0;
  std::string::basic_string[abi:ne180100]((uint64_t)v17, v3 + 16);
  if (v18 >= 0) {
    uint64_t v4 = v17;
  }
  else {
    uint64_t v4 = (void **)v17[0];
  }
  if (v3)
  {
    if (*((char *)this + 63) >= 0) {
      CFArrayRef v5 = v2;
    }
    else {
      CFArrayRef v5 = (const void *)*((void *)this + 5);
    }
    memmove(v4, v5, v3);
  }
  strcpy((char *)v4 + v3, "/DocumentRes.xml");
  if (v18 >= 0) {
    CFDataRef v6 = v17;
  }
  else {
    CFDataRef v6 = (void **)v17[0];
  }
  CFDataRef v7 = OFDContainer::copyFileContent(*((OFDContainer **)this + 1), (const char *)v6);
  CFDataRef v8 = v7;
  if (v7)
  {
    *((void *)this + 9) = XMLDictionaryCreateWithData(v7);
    CFRelease(v8);
  }
  if (*((char *)this + 63) >= 0) {
    size_t v9 = *((unsigned __int8 *)this + 63);
  }
  else {
    size_t v9 = *((void *)this + 6);
  }
  __p[1] = 0;
  uint64_t v16 = 0;
  __p[0] = 0;
  uint64_t v10 = __p;
  std::string::basic_string[abi:ne180100]((uint64_t)__p, v9 + 14);
  if (v16 < 0) {
    uint64_t v10 = (void **)__p[0];
  }
  if (v9)
  {
    if (*((char *)this + 63) >= 0) {
      uint64_t v11 = v2;
    }
    else {
      uint64_t v11 = (const void *)*((void *)this + 5);
    }
    memmove(v10, v11, v9);
  }
  strcpy((char *)v10 + v9, "/PublicRes.xml");
  if (v16 >= 0) {
    long long v12 = __p;
  }
  else {
    long long v12 = (void **)__p[0];
  }
  CFDataRef v13 = OFDContainer::copyFileContent(*((OFDContainer **)this + 1), (const char *)v12);
  CFDataRef v14 = v13;
  if (v13)
  {
    *((void *)this + 10) = XMLDictionaryCreateWithData(v13);
    CFRelease(v14);
  }
  OFDDocument::setupFonts(this);
  if (SHIBYTE(v16) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v18) < 0) {
    operator delete(v17[0]);
  }
}

void sub_1889731C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void OFDDocument::extractSignatures(OFDDocument *this)
{
  if (*((char *)this + 63) >= 0) {
    size_t v2 = *((unsigned __int8 *)this + 63);
  }
  else {
    size_t v2 = *((void *)this + 6);
  }
  __p[1] = 0;
  uint64_t v9 = 0;
  __p[0] = 0;
  std::string::basic_string[abi:ne180100]((uint64_t)__p, v2 + 21);
  if (v9 >= 0) {
    size_t v3 = __p;
  }
  else {
    size_t v3 = (void **)__p[0];
  }
  if (v2)
  {
    if (*((char *)this + 63) >= 0) {
      uint64_t v4 = (char *)this + 40;
    }
    else {
      uint64_t v4 = (char *)*((void *)this + 5);
    }
    memmove(v3, v4, v2);
  }
  strcpy((char *)v3 + v2, "/Signs/Signatures.xml");
  if (v9 >= 0) {
    CFArrayRef v5 = __p;
  }
  else {
    CFArrayRef v5 = (void **)__p[0];
  }
  CFDataRef v6 = OFDContainer::copyFileContent(*((OFDContainer **)this + 1), (const char *)v5);
  CFDataRef v7 = v6;
  if (v6)
  {
    *((void *)this + 11) = XMLDictionaryCreateWithData(v6);
    CFRelease(v7);
  }
  if (SHIBYTE(v9) < 0) {
    operator delete(__p[0]);
  }
}

void sub_1889732F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void OFDDocument::~OFDDocument(OFDDocument *this)
{
  *(void *)this = &unk_1ED4DEE28;
  uint64_t v2 = *((void *)this + 8);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  uint64_t v3 = *((void *)this + 9);
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  uint64_t v4 = *((void *)this + 10);
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  uint64_t v5 = *((void *)this + 11);
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
  }
  uint64_t v6 = *((void *)this + 12);
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  CFDataRef v7 = (void *)*((void *)this + 16);
  if (v7)
  {
    *((void *)this + 17) = v7;
    operator delete(v7);
  }
  CFDataRef v8 = (void *)*((void *)this + 13);
  if (v8)
  {
    *((void *)this + 14) = v8;
    operator delete(v8);
  }
  if (*((char *)this + 63) < 0) {
    operator delete(*((void **)this + 5));
  }
  if (*((char *)this + 39) < 0) {
    operator delete(*((void **)this + 2));
  }
}

{
  uint64_t vars8;

  OFDDocument::~OFDDocument(this);

  JUMPOUT(0x18C11C0E0);
}

uint64_t OFDDocument::getPageCount(OFDDocument *this)
{
  return *((unsigned int *)this + 46);
}

uint64_t OFDDocument::getPageAtIndex(OFDDocument *this, unsigned int a2)
{
  if (*((_DWORD *)this + 46) <= a2) {
    return 0;
  }
  uint64_t v4 = *(void *)(*((void *)this + 13) + 8 * a2);
  if (!v4)
  {
    ArrayObjectForPath = IIODictionary::getArrayObjectForPath(*((IIODictionary **)this + 8), @"Document.Pages.Page");
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(ArrayObjectForPath, a2);
    memset(v22, 0, sizeof(v22));
    IIODictionary::IIODictionary((IIODictionary *)v22, ValueAtIndex);
    if (*((char *)this + 39) < 0)
    {
      CFDataRef v8 = (char *)*((void *)this + 2);
      uint64_t v7 = *((void *)this + 3);
      if (v7)
      {
LABEL_5:
        uint64_t v9 = &v8[v7];
        uint64_t v10 = v8;
        do
        {
          if (*v10 == 47) {
            goto LABEL_9;
          }
          ++v10;
          --v7;
        }
        while (v7);
        uint64_t v10 = v9;
LABEL_9:
        std::string::size_type v11 = v10 - v8;
        if (v10 == v9) {
          std::string::size_type v12 = -1;
        }
        else {
          std::string::size_type v12 = v11;
        }
LABEL_15:
        memset(&v21, 0, sizeof(v21));
        std::string::basic_string(&v21, (const std::string *)((char *)this + 16), 0, v12, (std::allocator<char> *)__p);
        std::string::append(&v21, "/");
        CFDictionaryRef ObjectForKey = IIODictionary::getObjectForKey((IIODictionary *)v22, @"BaseLoc");
        IIOString::IIOString((IIOString *)v18, ObjectForKey);
        CFDataRef v14 = (char *)IIOString::utf8String((IIOString *)v18);
        std::string::basic_string[abi:ne180100]<0>(__p, v14);
        if ((v20 & 0x80u) == 0) {
          long long v15 = __p;
        }
        else {
          long long v15 = (void **)__p[0];
        }
        if ((v20 & 0x80u) == 0) {
          std::string::size_type v16 = v20;
        }
        else {
          std::string::size_type v16 = (std::string::size_type)__p[1];
        }
        std::string::append(&v21, (const std::string::value_type *)v15, v16);
        if ((char)v20 < 0) {
          operator delete(__p[0]);
        }
        IIOString::~IIOString((IIOString *)v18);
        operator new();
      }
    }
    else
    {
      uint64_t v7 = *((unsigned __int8 *)this + 39);
      CFDataRef v8 = (char *)this + 16;
      if (*((unsigned char *)this + 39)) {
        goto LABEL_5;
      }
    }
    std::string::size_type v12 = -1;
    goto LABEL_15;
  }
  return v4;
}

void sub_1889736BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a23 < 0) {
    operator delete(__p);
  }
  IIODictionary::~IIODictionary((IIODictionary *)(v23 - 56));
  _Unwind_Resume(a1);
}

uint64_t OFDDocument::getTemplateAtIndex(OFDDocument *this, unsigned int a2)
{
  if (*((_DWORD *)this + 46) <= a2) {
    return 0;
  }
  CFIndex v3 = a2;
  uint64_t v4 = *((void *)this + 16);
  if (a2 >= (unint64_t)((*((void *)this + 17) - v4) >> 3)) {
    return 0;
  }
  uint64_t v5 = *(void *)(v4 + 8 * a2);
  if (!v5)
  {
    ArrayObjectForPath = IIODictionary::getArrayObjectForPath(*((IIODictionary **)this + 8), @"Document.CommonData.TemplatePage");
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(ArrayObjectForPath, v3);
    memset(v23, 0, sizeof(v23));
    IIODictionary::IIODictionary((IIODictionary *)v23, ValueAtIndex);
    if (*((char *)this + 39) < 0)
    {
      uint64_t v9 = (char *)*((void *)this + 2);
      uint64_t v8 = *((void *)this + 3);
      if (v8)
      {
LABEL_6:
        uint64_t v10 = &v9[v8];
        std::string::size_type v11 = v9;
        do
        {
          if (*v11 == 47) {
            goto LABEL_10;
          }
          ++v11;
          --v8;
        }
        while (v8);
        std::string::size_type v11 = v10;
LABEL_10:
        std::string::size_type v12 = v11 - v9;
        if (v11 == v10) {
          std::string::size_type v13 = -1;
        }
        else {
          std::string::size_type v13 = v12;
        }
LABEL_17:
        memset(&v22, 0, sizeof(v22));
        std::string::basic_string(&v22, (const std::string *)((char *)this + 16), 0, v13, (std::allocator<char> *)__p);
        std::string::append(&v22, "/");
        CFDictionaryRef ObjectForKey = IIODictionary::getObjectForKey((IIODictionary *)v23, @"BaseLoc");
        IIOString::IIOString((IIOString *)v19, ObjectForKey);
        std::string::size_type v16 = (char *)IIOString::utf8String((IIOString *)v19);
        std::string::basic_string[abi:ne180100]<0>(__p, v16);
        if ((v21 & 0x80u) == 0) {
          uint64_t v17 = __p;
        }
        else {
          uint64_t v17 = (void **)__p[0];
        }
        if ((v21 & 0x80u) == 0) {
          std::string::size_type v18 = v21;
        }
        else {
          std::string::size_type v18 = (std::string::size_type)__p[1];
        }
        std::string::append(&v22, (const std::string::value_type *)v17, v18);
        if ((char)v21 < 0) {
          operator delete(__p[0]);
        }
        IIOString::~IIOString((IIOString *)v19);
        operator new();
      }
    }
    else
    {
      uint64_t v8 = *((unsigned __int8 *)this + 39);
      uint64_t v9 = (char *)this + 16;
      if (*((unsigned char *)this + 39)) {
        goto LABEL_6;
      }
    }
    std::string::size_type v13 = -1;
    goto LABEL_17;
  }
  return v5;
}

void sub_18897391C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  MEMORY[0x18C11C0E0](v23, 0x10B3C40D6404C7DLL);
  if (a23 < 0) {
    operator delete(__p);
  }
  IIODictionary::~IIODictionary((IIODictionary *)(v24 - 56));
  _Unwind_Resume(a1);
}

uint64_t OFDDocument::open(OFDDocument *this)
{
  if (!*((unsigned char *)this + 188))
  {
    *((unsigned char *)this + 188) = 1;
    uint64_t v2 = (OFDContainer *)*((void *)this + 1);
    CFIndex v3 = (char *)this + 16;
    if (*((char *)this + 39) < 0) {
      CFIndex v3 = *(const char **)v3;
    }
    CFDataRef v4 = OFDContainer::copyFileContent(v2, v3);
    if (v4)
    {
      CFDataRef v5 = v4;
      OFDDocument::parseXML(this, v4);
      CFRelease(v5);
    }
  }
  return 1;
}

BOOL OFDDocument::parseXML(OFDDocument *this, const __CFData *a2)
{
  CFIndex v3 = (IIODictionary *)XMLDictionaryCreateWithData(a2);
  CFDataRef v4 = v3;
  *((void *)this + 8) = v3;
  if (v3)
  {
    ArrayObjectForPath = IIODictionary::getArrayObjectForPath(v3, @"Document.CommonData.PageArea.PhysicalBox");
    CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(ArrayObjectForPath, 0);
    *((double *)this + 19) = CGRectFromCFString(ValueAtIndex);
    *((void *)this + 20) = v7;
    *((void *)this + 21) = v8;
    *((void *)this + 22) = v9;
    uint64_t v10 = IIODictionary::getArrayObjectForPath(*((IIODictionary **)this + 8), @"Document.Pages.Page");
    if (v10) {
      LODWORD(v10) = CFArrayGetCount(v10);
    }
    uint64_t v11 = *((void *)this + 13);
    *((_DWORD *)this + 46) = v10;
    std::string::size_type v12 = (void *)*((void *)this + 14);
    unint64_t v13 = ((uint64_t)v12 - v11) >> 3;
    if (v13 < v10)
    {
      CFDataRef v14 = (void *)((char *)this + 120);
      do
      {
        if ((unint64_t)v12 >= *v14)
        {
          if ((v13 + 1) >> 61) {
            std::vector<IIOTag *>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v15 = *v14 - v11;
          uint64_t v16 = v15 >> 2;
          if (v15 >> 2 <= v13 + 1) {
            uint64_t v16 = v13 + 1;
          }
          if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v17 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v17 = v16;
          }
          if (v17) {
            std::string::size_type v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<IIOTag *>>((uint64_t)this + 120, v17);
          }
          else {
            std::string::size_type v18 = 0;
          }
          uint64_t v19 = &v18[8 * v13];
          *(void *)uint64_t v19 = 0;
          std::string::size_type v12 = v19 + 8;
          unsigned __int8 v21 = (char *)*((void *)this + 13);
          unsigned __int8 v20 = (char *)*((void *)this + 14);
          if (v20 != v21)
          {
            do
            {
              uint64_t v22 = *((void *)v20 - 1);
              v20 -= 8;
              *((void *)v19 - 1) = v22;
              v19 -= 8;
            }
            while (v20 != v21);
            unsigned __int8 v20 = (char *)*((void *)this + 13);
          }
          *((void *)this + 13) = v19;
          *((void *)this + 14) = v12;
          *((void *)this + 15) = &v18[8 * v17];
          if (v20) {
            operator delete(v20);
          }
        }
        else
        {
          *v12++ = 0;
        }
        *((void *)this + 14) = v12;
        uint64_t v11 = *((void *)this + 13);
        unint64_t v13 = ((uint64_t)v12 - v11) >> 3;
      }
      while (v13 < *((unsigned int *)this + 46));
    }
    uint64_t v23 = IIODictionary::getArrayObjectForPath(*((IIODictionary **)this + 8), @"Document.CommonData.TemplatePage");
    if (v23)
    {
      unsigned int Count = CFArrayGetCount(v23);
      uint64_t v25 = *((void *)this + 16);
      uint64_t v26 = (void *)*((void *)this + 17);
      unint64_t v27 = ((uint64_t)v26 - v25) >> 3;
      if (v27 < Count)
      {
        unint64_t v28 = Count;
        uint64_t v29 = (void *)((char *)this + 144);
        do
        {
          if ((unint64_t)v26 >= *v29)
          {
            if ((v27 + 1) >> 61) {
              std::vector<IIOTag *>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v30 = *v29 - v25;
            uint64_t v31 = v30 >> 2;
            if (v30 >> 2 <= v27 + 1) {
              uint64_t v31 = v27 + 1;
            }
            if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v32 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v32 = v31;
            }
            if (v32) {
              unint64_t v33 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<IIOTag *>>((uint64_t)this + 144, v32);
            }
            else {
              unint64_t v33 = 0;
            }
            unint64_t v34 = &v33[8 * v27];
            *(void *)unint64_t v34 = 0;
            uint64_t v26 = v34 + 8;
            uint64_t v36 = (char *)*((void *)this + 16);
            uint64_t v35 = (char *)*((void *)this + 17);
            if (v35 != v36)
            {
              do
              {
                uint64_t v37 = *((void *)v35 - 1);
                v35 -= 8;
                *((void *)v34 - 1) = v37;
                v34 -= 8;
              }
              while (v35 != v36);
              uint64_t v35 = (char *)*((void *)this + 16);
            }
            *((void *)this + 16) = v34;
            *((void *)this + 17) = v26;
            *((void *)this + 18) = &v33[8 * v32];
            if (v35) {
              operator delete(v35);
            }
          }
          else
          {
            *v26++ = 0;
          }
          *((void *)this + 17) = v26;
          uint64_t v25 = *((void *)this + 16);
          unint64_t v27 = ((uint64_t)v26 - v25) >> 3;
        }
        while (v27 < v28);
      }
    }
  }
  return v4 != 0;
}

void OFDDocument::setupFonts(OFDDocument *this)
{
  uint64_t v2 = (IIODictionary *)*((void *)this + 9);
  if (v2)
  {
    ArrayObjectForPath = IIODictionary::getArrayObjectForPath(v2, @"Res.Fonts.Font");
    if (ArrayObjectForPath)
    {
      CFArrayRef v4 = ArrayObjectForPath;
      if (CFArrayGetCount(ArrayObjectForPath) >= 1)
      {
        CFIndex v5 = 0;
        do
        {
          CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v4, v5);
          uint64_t v7 = (IIODictionary *)*((void *)this + 12);
          CFStringRef Value = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"ID");
          IIODictionary::setObjectForKey(v7, ValueAtIndex, Value);
          ++v5;
        }
        while (CFArrayGetCount(v4) > v5);
      }
    }
  }
  uint64_t v9 = (IIODictionary *)*((void *)this + 10);
  if (v9)
  {
    uint64_t v10 = IIODictionary::getArrayObjectForPath(v9, @"Res.Fonts.Font");
    if (v10)
    {
      CFArrayRef v11 = v10;
      if (CFArrayGetCount(v10) >= 1)
      {
        CFIndex v12 = 0;
        do
        {
          CFDictionaryRef v13 = (const __CFDictionary *)CFArrayGetValueAtIndex(v11, v12);
          if (v13)
          {
            CFDictionaryRef v14 = v13;
            CFTypeID TypeID = CFDictionaryGetTypeID();
            if (TypeID == CFGetTypeID(v14))
            {
              if (CFDictionaryContainsKey(v14, @"FontName"))
              {
                uint64_t v16 = (IIODictionary *)*((void *)this + 12);
                CFStringRef v17 = (const __CFString *)CFDictionaryGetValue(v14, @"ID");
                IIODictionary::setObjectForKey(v16, v14, v17);
              }
            }
          }
          ++v12;
        }
        while (CFArrayGetCount(v11) > v12);
      }
    }
  }
  uint64_t v18 = *((void *)this + 12);

  IIODictionary::enumerate(v18, &__block_literal_global_36);
}

const void *OFDDocument::createFont(IIODictionary **this, uint64_t a2, double a3)
{
  CFStringRef v5 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%d", a2);
  CFDictionaryRef ObjectForKey = IIODictionary::getObjectForKey(this[12], v5);
  if (ObjectForKey)
  {
    CFStringRef Value = (const __CFString *)CFDictionaryGetValue(ObjectForKey, @"FontName");
    if (Value)
    {
      CFStringRef v8 = Value;
      if (CFEqual(Value, @"SimSong-Regular")
        && OFDDocument::createFont(unsigned int,double)::onceToken != -1)
      {
        dispatch_once(&OFDDocument::createFont(unsigned int,double)::onceToken, &__block_literal_global_49);
      }
      uint64_t v9 = gFunc_CTFontCreateWithName(v8, 0, a3);
      if (v9)
      {
        uint64_t v10 = (const void *)v9;
        CFStringRef v11 = (const __CFString *)gFunc_CTFontCopyPostScriptName();
        if (CFEqual(v8, v11)
          || CFEqual(@"CourierNewPSMT", v11))
        {
          CFRelease(v11);
          return v10;
        }
        CFRelease(v10);
        CFRelease(v11);
      }
    }
  }
  v13[0] = 0;
  v13[1] = 0;
  uint64_t v14 = 0;
  IIOString::IIOString((IIOString *)v13, "STSongti-TC-Regular");
  uint64_t v10 = (const void *)gFunc_CTFontCreateWithName(v14, 0, a3);
  IIOString::~IIOString((IIOString *)v13);
  return v10;
}

void sub_188973F50(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  IIOString::~IIOString((IIOString *)va);
  _Unwind_Resume(a1);
}

void ___ZN11OFDDocument10createFontEjd_block_invoke()
{
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  IIODictionary::IIODictionary((IIODictionary *)&v7);
  IIODictionary::setObjectForKey(v0, @"SimSong-Regular", *(const __CFString **)gIIO_kCTFontNameAttribute);
  uint64_t v1 = (const void *)gFunc_CTFontDescriptorCreateWithAttributes(v8);
  uint64_t v2 = dispatch_semaphore_create(0);
  CFMutableArrayRef v4 = 0;
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  IIOArray::IIOArray((IIOArray *)&v4);
  IIOArray::addObject(&v4, v1);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 0x40000000;
  v3[2] = ___ZN11OFDDocument10createFontEjd_block_invoke_2;
  void v3[3] = &__block_descriptor_tmp_22_0;
  v3[4] = v2;
  if (gFunc_CTFontDescriptorMatchFontDescriptorsWithProgressHandler(v5, 0, v3)) {
    dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
  }
  IIOArray::~IIOArray((IIOArray *)&v4);
  IIODictionary::~IIODictionary((IIODictionary *)&v7);
}

void sub_188974078(_Unwind_Exception *a1)
{
  IIODictionary::~IIODictionary((IIODictionary *)(v1 - 40));
  _Unwind_Resume(a1);
}

uint64_t ___ZN11OFDDocument10createFontEjd_block_invoke_2(uint64_t a1, int a2)
{
  if (a2 == 1) {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  return 1;
}

void ___ZN11OFDDocument10setupFontsEv_block_invoke(int a1, int a2, __CFDictionary *a3)
{
  memset(v4, 0, sizeof(v4));
  IIODictionary::IIODictionary((IIODictionary *)v4, a3);
  CFStringRef ObjectForKey = (const __CFString *)IIODictionary::getObjectForKey((IIODictionary *)v4, "FontName");
  if (CFEqual(ObjectForKey, @"宋体")
    || CFEqual(ObjectForKey, @"黑体")
    || CFEqual(ObjectForKey, @"楷体")
    || CFStringHasPrefix(ObjectForKey, @"STSong")
    || CFStringHasPrefix(ObjectForKey, @"KaiTi"))
  {
    IIODictionary::setObjectForKey((IIODictionary *)v4, @"SimSong-Regular", @"FontName");
  }
  IIODictionary::~IIODictionary((IIODictionary *)v4);
}

void sub_1889741A8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  IIODictionary::~IIODictionary((IIODictionary *)va);
  _Unwind_Resume(a1);
}

CFDataRef OFDDocument::copyFileContent(OFDContainer **this, const char *a2)
{
  return OFDContainer::copyFileContent(this[1], a2);
}

CFStringRef OFDDocument::copyResourcePath(IIODictionary **this, unsigned int a2, const __CFString *a3)
{
  uint64_t v5 = a2;
  uint64_t v6 = OFDCopyResourcePathFromDictionary(this[9], a2, a3);
  uint64_t v7 = (CFAllocatorRef *)MEMORY[0x1E4F1CF80];
  if (v6)
  {
    uint64_t v8 = (const void *)v6;
    uint64_t v9 = this + 5;
    if (*((char *)this + 63) < 0) {
      uint64_t v9 = (void *)*v9;
    }
    CFStringRef v10 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%s/Res/%@", v9, v6);
    CFRelease(v8);
    if (v10) {
      return v10;
    }
  }
  uint64_t v11 = OFDCopyResourcePathFromDictionary(this[10], v5, a3);
  if (!v11) {
    return 0;
  }
  CFIndex v12 = (const void *)v11;
  CFDictionaryRef v13 = this + 5;
  if (*((char *)this + 63) < 0) {
    CFDictionaryRef v13 = (void *)*v13;
  }
  CFStringRef v14 = CFStringCreateWithFormat(*v7, 0, @"%s/Res/%@", v13, v11);
  CFRelease(v12);
  return v14;
}

uint64_t unzStringFileNameCompare(const char *a1, const char *a2, int a3)
{
  if (a3 == 1) {
    return strcmp(a1, a2);
  }
  while (1)
  {
    int v5 = *(unsigned __int8 *)a1++;
    int v4 = v5;
    int v7 = *(unsigned __int8 *)a2++;
    int v6 = v7;
    if ((v4 - 97) < 0x1A) {
      LOBYTE(v4) = v4 - 32;
    }
    if ((v6 - 97) < 0x1A) {
      LOBYTE(v6) = v6 - 32;
    }
    if (!(_BYTE)v4) {
      break;
    }
    if (!(_BYTE)v6) {
      return 1;
    }
    if ((char)v4 < (char)v6) {
      return 0xFFFFFFFFLL;
    }
    if ((char)v4 > (char)v6) {
      return 1;
    }
  }
  if ((_BYTE)v6) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

void *unzOpenInternal(uint64_t a1, uint64_t a2, int a3)
{
  memset(__src, 0, sizeof(__src));
  unint64_t v63 = 0;
  if (a2)
  {
    long long v4 = *(_OWORD *)(a2 + 48);
    __src[2] = *(_OWORD *)(a2 + 32);
    __src[3] = v4;
    __src[4] = *(_OWORD *)(a2 + 64);
    *(void *)&__src[5] = *(void *)(a2 + 80);
    long long v5 = *(_OWORD *)(a2 + 16);
    __src[0] = *(_OWORD *)a2;
    __src[1] = v5;
  }
  else
  {
    fill_fopen64_filefunc((FILE *(**)(int, char *, char))__src);
  }
  DWORD2(__src[5]) = a3;
  uint64_t v6 = call_zopen64((uint64_t)__src);
  *(void *)&__src[6] = v6;
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  uint64_t v65 = 0;
  uint64_t v66 = 0;
  uint64_t v64 = 0;
  if (!call_zseek64(__src))
  {
    unint64_t v8 = call_ztell64((uint64_t)__src);
    unint64_t v9 = v8;
    unint64_t v10 = v8 >= 0xFFFF ? 0xFFFFLL : v8;
    uint64_t v11 = malloc_type_malloc(0x404uLL, 0xBA45F597uLL);
    if (v11)
    {
      CFIndex v12 = v11;
      if (v10 >= 5)
      {
        unint64_t v13 = 4;
        do
        {
          unint64_t v14 = v13 + 1024;
          if (v13 + 1024 >= v10) {
            unint64_t v13 = v10;
          }
          else {
            v13 += 1024;
          }
          unint64_t v15 = v13 >= 0x404 ? 1028 : v13;
          if (call_zseek64(__src)
            || (*((uint64_t (**)(void, uint64_t, unsigned char *, unint64_t))&__src[0] + 1))(*((void *)&__src[3] + 1), v7, v12, v15) != v15)
          {
            break;
          }
          if (v15 >= 4)
          {
            uint64_t v16 = (v15 - 4) + 1;
            while (v12[v16 - 1] != 80 || v12[v16] != 75 || v12[v16 + 1] != 6 || v12[v16 + 2] != 7)
            {
              BOOL v17 = v16-- <= 1;
              if (v17) {
                goto LABEL_28;
              }
            }
            if ((v16 - 1) + v9 - v13)
            {
              free(v12);
              if (call_zseek64(__src)) {
                goto LABEL_62;
              }
              v69[0] = 0;
              if (unz64local_getLong((uint64_t)__src, v7, v69)) {
                goto LABEL_62;
              }
              if (unz64local_getLong((uint64_t)__src, v7, v69)) {
                goto LABEL_62;
              }
              if (v69[0]) {
                goto LABEL_62;
              }
              unint64_t v68 = 0;
              if (unz64local_getLong64((uint64_t)__src, v7, &v68)) {
                goto LABEL_62;
              }
              if (unz64local_getLong((uint64_t)__src, v7, v69)) {
                goto LABEL_62;
              }
              if (v69[0] != 1) {
                goto LABEL_62;
              }
              unint64_t v18 = v68;
              if (call_zseek64(__src)
                || unz64local_getLong((uint64_t)__src, v7, v69)
                || v69[0] != 101075792
                || !v18)
              {
                goto LABEL_62;
              }
              HIDWORD(__src[20]) = 1;
              uint64_t v19 = call_zseek64(__src);
              int Long = unz64local_getLong((uint64_t)__src, *(uint64_t *)&__src[6], &v66);
              int Long64 = unz64local_getLong64((uint64_t)__src, *(uint64_t *)&__src[6], &v68);
              int Short = unz64local_getShort((uint64_t)__src, *(uint64_t *)&__src[6], v69);
              int v23 = unz64local_getShort((uint64_t)__src, *(uint64_t *)&__src[6], v69);
              int v24 = unz64local_getLong((uint64_t)__src, *(uint64_t *)&__src[6], &v65);
              int v25 = unz64local_getLong((uint64_t)__src, *(uint64_t *)&__src[6], &v64);
              int v26 = unz64local_getLong64((uint64_t)__src, *(uint64_t *)&__src[6], (unint64_t *)&__src[6] + 1);
              if (unz64local_getLong64((uint64_t)__src, *(uint64_t *)&__src[6], &v63) | v26 | v25 | v24 | v23 | Short | Long64 | Long) {
                BOOL v27 = 0;
              }
              else {
                BOOL v27 = v19 == 0;
              }
              int v28 = !v27;
              int v29 = v28 << 31 >> 31;
              if (v65) {
                BOOL v30 = 0;
              }
              else {
                BOOL v30 = v64 == 0;
              }
              if (v30 && v63 == *((void *)&__src[6] + 1)) {
                int v32 = v29;
              }
              else {
                int v32 = -103;
              }
              int v33 = unz64local_getLong64((uint64_t)__src, *(uint64_t *)&__src[6], (unint64_t *)&__src[10]);
              if (unz64local_getLong64((uint64_t)__src, *(uint64_t *)&__src[6], (unint64_t *)&__src[10] + 1) | v33)int v34 = -1; {
              else
              }
                int v34 = v32;
              *(void *)&__src[7] = 0;
              goto LABEL_109;
            }
          }
LABEL_28:
          ;
        }
        while (v10 > v14);
      }
      free(v12);
    }
  }
LABEL_62:
  uint64_t v35 = *(void *)&__src[6];
  if (!call_zseek64(__src))
  {
    unint64_t v36 = call_ztell64((uint64_t)__src);
    unint64_t v37 = v36;
    unint64_t v38 = v36 >= 0xFFFF ? 0xFFFFLL : v36;
    char v39 = malloc_type_malloc(0x404uLL, 0x16ECF6D5uLL);
    if (v39)
    {
      unint64_t v40 = v39;
      if (v38 >= 5)
      {
        unint64_t v41 = 4;
        do
        {
          unint64_t v42 = v41 + 1024;
          if (v41 + 1024 >= v38) {
            unint64_t v41 = v38;
          }
          else {
            v41 += 1024;
          }
          unint64_t v43 = v41 >= 0x404 ? 1028 : v41;
          if (call_zseek64(__src)
            || (*((uint64_t (**)(void, uint64_t, unsigned char *, unint64_t))&__src[0] + 1))(*((void *)&__src[3] + 1), v35, v40, v43) != v43)
          {
            break;
          }
          if (v43 >= 4)
          {
            uint64_t v44 = (v43 - 4) + 1;
            while (v40[v44 - 1] != 80 || v40[v44] != 75 || v40[v44 + 1] != 5 || v40[v44 + 2] != 6)
            {
              BOOL v17 = v44-- <= 1;
              if (v17) {
                goto LABEL_85;
              }
            }
            unint64_t v18 = (v44 - 1) + v37 - v41;
            if (v18)
            {
              free(v40);
              int v45 = 0;
              goto LABEL_91;
            }
          }
LABEL_85:
          ;
        }
        while (v38 > v42);
      }
      free(v40);
    }
  }
  unint64_t v18 = 0;
  int v45 = -1;
LABEL_91:
  HIDWORD(__src[20]) = 0;
  uint64_t v46 = call_zseek64(__src);
  int v47 = unz64local_getLong((uint64_t)__src, *(uint64_t *)&__src[6], &v66);
  int v48 = unz64local_getShort((uint64_t)__src, *(uint64_t *)&__src[6], &v65);
  int v49 = unz64local_getShort((uint64_t)__src, *(uint64_t *)&__src[6], &v64);
  int v50 = unz64local_getShort((uint64_t)__src, *(uint64_t *)&__src[6], &v66);
  *((void *)&__src[6] + 1) = v66;
  int v51 = unz64local_getShort((uint64_t)__src, *(uint64_t *)&__src[6], &v66) | v50 | v49 | v48 | v47;
  if (v46) {
    BOOL v52 = 0;
  }
  else {
    BOOL v52 = v51 == 0;
  }
  if (v52) {
    int v53 = v45;
  }
  else {
    int v53 = -1;
  }
  if (v65) {
    BOOL v54 = 0;
  }
  else {
    BOOL v54 = v64 == 0;
  }
  if (v54 && v66 == *((void *)&__src[6] + 1)) {
    int v56 = v53;
  }
  else {
    int v56 = -103;
  }
  int v57 = unz64local_getLong((uint64_t)__src, *(uint64_t *)&__src[6], &v66);
  *(void *)&__src[10] = v66;
  int v58 = unz64local_getLong((uint64_t)__src, *(uint64_t *)&__src[6], &v66);
  *((void *)&__src[10] + 1) = v66;
  if (unz64local_getShort((uint64_t)__src, *(uint64_t *)&__src[6], (uint64_t *)&__src[7]) | v58 | v57) {
    int v34 = -1;
  }
  else {
    int v34 = v56;
  }
LABEL_109:
  if (v18 < *(void *)&__src[10] + *((void *)&__src[10] + 1) || v34)
  {
    (*((void (**)(void, void))&__src[2] + 1))(*((void *)&__src[3] + 1), *(void *)&__src[6]);
    return 0;
  }
  *((void *)&__src[7] + 1) = v18 - (*(void *)&__src[10] + *((void *)&__src[10] + 1));
  *((void *)&__src[9] + 1) = v18;
  *(void *)&__src[20] = 0;
  DWORD2(__src[20]) = 0;
  long long v59 = malloc_type_malloc(0x150uLL, 0x10A004033D922FDuLL);
  uint64_t v60 = v59;
  if (v59)
  {
    memcpy(v59, __src, 0x150uLL);
    uint64_t v61 = v60[21];
    v60[16] = 0;
    v60[17] = v61;
    v60[18] = unz64local_GetCurrentFileInfoInternal((uint64_t)v60, (uint64_t)(v60 + 22), v60 + 39, 0, 0, 0, 0, 0, 0) == 0;
  }
  return v60;
}

void *unzOpen(uint64_t a1)
{
  return unzOpenInternal(a1, 0, 0);
}

void *unzOpenBuffer(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)long long v5 = 0u;
  long long v6 = 0u;
  uint64_t v4 = 0;
  memset(v3, 0, sizeof(v3));
  __sprintf_chk(v5, 0, 0x20uLL, "%lx+%lx", a1, a2);
  fill_memory_filefunc64_32(v3);
  return unzOpenInternal((uint64_t)v5, (uint64_t)v3, 0);
}

uint64_t unzCloseCurrentFile(uint64_t a1)
{
  if (!a1) {
    return 4294967194;
  }
  uint64_t v2 = *(void *)(a1 + 320);
  if (!v2) {
    return 4294967194;
  }
  if (*(void *)(v2 + 192) || *(_DWORD *)(v2 + 312))
  {
    uint64_t v3 = 0;
  }
  else if (*(void *)(v2 + 168) == *(void *)(v2 + 176))
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = 4294967191;
  }
  if (*(void *)v2) {
    free(*(void **)v2);
  }
  *(void *)uint64_t v2 = 0;
  if (*(void *)(v2 + 128) == 8) {
    inflateEnd((z_streamp)(v2 + 8));
  }
  free((void *)v2);
  *(void *)(a1 + 320) = 0;
  return v3;
}

uint64_t unzGetGlobalInfo(uint64_t a1, _OWORD *a2)
{
  if (!a1) {
    return 4294967194;
  }
  uint64_t result = 0;
  *a2 = *(_OWORD *)(a1 + 104);
  return result;
}

uint64_t unzGetCurrentFileInfo64(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, unint64_t a8)
{
  return unz64local_GetCurrentFileInfoInternal(a1, a2, 0, a3, a4, a5, a6, a7, a8);
}

uint64_t unz64local_GetCurrentFileInfoInternal(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, unint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8, unint64_t a9)
{
  uint64_t v59 = 0;
  if (!a1) {
    return 4294967194;
  }
  if (call_zseek64((void *)a1) || unz64local_getLong(a1, *(void *)(a1 + 96), &v59))
  {
    int v10 = -1;
  }
  else if (v59 == 33639248)
  {
    int v10 = 0;
  }
  else
  {
    int v10 = -103;
  }
  unsigned int v51 = v10;
  uint64_t v69 = 0;
  long long v67 = 0u;
  int8x16_t v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  unint64_t v58 = 0;
  int Short = unz64local_getShort(a1, *(void *)(a1 + 96), (uint64_t *)&v61);
  int v49 = unz64local_getShort(a1, *(void *)(a1 + 96), (uint64_t *)&v61 + 1);
  int v48 = unz64local_getShort(a1, *(void *)(a1 + 96), (uint64_t *)&v62);
  int v47 = unz64local_getShort(a1, *(void *)(a1 + 96), (uint64_t *)&v62 + 1);
  int Long = unz64local_getLong(a1, *(void *)(a1 + 96), (uint64_t *)&v63);
  LODWORD(v69) = ((v63 >> 21) & 0xF) - 1;
  HIDWORD(v69) = (v63 >> 25) + 1980;
  v11.i32[0] = v63;
  int8x16_t v12 = (int8x16_t)vshlq_u32((uint32x4_t)vdupq_n_s32(v63), (uint32x4_t)xmmword_1889BD310);
  v12.i32[0] = vshlq_u32(v11, (uint32x4_t)xmmword_1889BD300).u32[0];
  int8x16_t v68 = vandq_s8(v12, (int8x16_t)xmmword_1889BD320);
  int v45 = unz64local_getLong(a1, *(void *)(a1 + 96), (uint64_t *)&v63 + 1);
  int v13 = unz64local_getLong(a1, *(void *)(a1 + 96), (uint64_t *)&v58);
  *(void *)&long long v64 = v58;
  int v14 = unz64local_getLong(a1, *(void *)(a1 + 96), (uint64_t *)&v58);
  *((void *)&v64 + 1) = v58;
  int v15 = unz64local_getShort(a1, *(void *)(a1 + 96), (uint64_t *)&v65);
  int v16 = unz64local_getShort(a1, *(void *)(a1 + 96), (uint64_t *)&v65 + 1);
  int v17 = unz64local_getShort(a1, *(void *)(a1 + 96), (uint64_t *)&v66);
  int v18 = unz64local_getShort(a1, *(void *)(a1 + 96), (uint64_t *)&v66 + 1);
  int v19 = unz64local_getShort(a1, *(void *)(a1 + 96), (uint64_t *)&v67);
  int v20 = unz64local_getLong(a1, *(void *)(a1 + 96), (uint64_t *)&v67 + 1);
  if (unz64local_getLong(a1, *(void *)(a1 + 96), (uint64_t *)&v58) | v20 | v19 | v18 | v17 | v16 | v15 | v14 | v13 | v45 | Long | v47 | v48 | v49 | Short) {
    uint64_t v21 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v21 = v51;
  }
  unint64_t v60 = v58;
  unint64_t v22 = v65;
  if (a4)
  {
    unint64_t v24 = a7;
    uint64_t v23 = a6;
    if (!v21)
    {
      unint64_t v25 = a5;
      if ((unint64_t)v65 < a5)
      {
        *(unsigned char *)(a4 + v65) = 0;
        unint64_t v25 = v22;
      }
      uint64_t v21 = 0;
      if (a5 && v22)
      {
        if ((*(uint64_t (**)(void, void))(a1 + 8))(*(void *)(a1 + 56), *(void *)(a1 + 96)) == v25) {
          uint64_t v21 = 0;
        }
        else {
          uint64_t v21 = 0xFFFFFFFFLL;
        }
      }
      v22 -= v25;
    }
  }
  else
  {
    unint64_t v24 = a7;
    uint64_t v23 = a6;
  }
  unint64_t v26 = *((void *)&v65 + 1);
  if (v23 && !v21)
  {
    if (*((void *)&v65 + 1) >= v24) {
      unint64_t v27 = v24;
    }
    else {
      unint64_t v27 = *((void *)&v65 + 1);
    }
    if (v22)
    {
      uint64_t v28 = call_zseek64((void *)a1);
      if (v28) {
        uint64_t v21 = 0xFFFFFFFFLL;
      }
      else {
        uint64_t v21 = 0;
      }
      if (!v28) {
        unint64_t v22 = 0;
      }
      if (!v24)
      {
LABEL_40:
        unint64_t v29 = v26 - v27 + v22;
        if (v21) {
          goto LABEL_76;
        }
        goto LABEL_41;
      }
    }
    else
    {
      uint64_t v21 = 0;
      if (!v24) {
        goto LABEL_40;
      }
    }
    if (v26)
    {
      if ((*(uint64_t (**)(void, void, uint64_t, unint64_t))(a1 + 8))(*(void *)(a1 + 56), *(void *)(a1 + 96), v23, v27) == v27)uint64_t v21 = v21; {
      else
      }
        uint64_t v21 = 0xFFFFFFFFLL;
    }
    goto LABEL_40;
  }
  unint64_t v29 = *((void *)&v65 + 1) + v22;
  if (v21) {
    goto LABEL_76;
  }
LABEL_41:
  if (v26)
  {
    if (v29 == v26)
    {
      LODWORD(v21) = 0;
      unint64_t v29 = 0;
    }
    else
    {
      uint64_t v30 = call_zseek64((void *)a1);
      if (v30) {
        LODWORD(v21) = -1;
      }
      else {
        LODWORD(v21) = 0;
      }
      if (v30) {
        v29 -= v26;
      }
      else {
        unint64_t v29 = 0;
      }
    }
    for (unint64_t i = 0; i < v26; i += v33 + 4)
    {
      uint64_t v56 = 0;
      uint64_t v57 = 0;
      int v32 = unz64local_getShort(a1, *(void *)(a1 + 96), &v57);
      if (unz64local_getShort(a1, *(void *)(a1 + 96), &v56) | v32) {
        uint64_t v21 = 0xFFFFFFFFLL;
      }
      else {
        uint64_t v21 = v21;
      }
      if (v57 == 1)
      {
        if (*((void *)&v64 + 1) == 0xFFFFFFFFLL)
        {
          if (unz64local_getLong64(a1, *(void *)(a1 + 96), (unint64_t *)&v64 + 1)) {
            uint64_t v21 = 0xFFFFFFFFLL;
          }
          else {
            uint64_t v21 = v21;
          }
        }
        if ((void)v64 == 0xFFFFFFFFLL)
        {
          if (unz64local_getLong64(a1, *(void *)(a1 + 96), (unint64_t *)&v64)) {
            uint64_t v21 = 0xFFFFFFFFLL;
          }
          else {
            uint64_t v21 = v21;
          }
        }
        if (v60 == 0xFFFFFFFF)
        {
          if (unz64local_getLong64(a1, *(void *)(a1 + 96), &v60)) {
            uint64_t v21 = 0xFFFFFFFFLL;
          }
          else {
            uint64_t v21 = v21;
          }
        }
        if (*((void *)&v66 + 1) == 0xFFFFFFFFLL)
        {
          if (unz64local_getLong(a1, *(void *)(a1 + 96), &v55)) {
            uint64_t v21 = 0xFFFFFFFFLL;
          }
          else {
            uint64_t v21 = v21;
          }
        }
        uint64_t v33 = v56;
        unint64_t v26 = *((void *)&v65 + 1);
      }
      else
      {
        uint64_t v33 = v56;
        if (call_zseek64((void *)a1)) {
          uint64_t v21 = 0xFFFFFFFFLL;
        }
        else {
          uint64_t v21 = v21;
        }
      }
    }
  }
LABEL_76:
  if (a8 && !v21)
  {
    unint64_t v34 = v66;
    unint64_t v35 = a9;
    if ((unint64_t)v66 < a9)
    {
      *(unsigned char *)(a8 + v66) = 0;
      unint64_t v35 = v34;
    }
    if (v29)
    {
      if (call_zseek64((void *)a1)) {
        uint64_t v21 = 0xFFFFFFFFLL;
      }
      else {
        uint64_t v21 = 0;
      }
      if (!a9) {
        goto LABEL_91;
      }
LABEL_87:
      if (v34)
      {
        if ((*(uint64_t (**)(void, void, uint64_t, unint64_t))(a1 + 8))(*(void *)(a1 + 56), *(void *)(a1 + 96), a8, v35) == v35)uint64_t v21 = v21; {
        else
        }
          uint64_t v21 = 0xFFFFFFFFLL;
      }
      goto LABEL_91;
    }
    uint64_t v21 = 0;
    if (a9) {
      goto LABEL_87;
    }
  }
LABEL_91:
  if (a2 && !v21)
  {
    int8x16_t v36 = v68;
    *(_OWORD *)(a2 + 96) = v67;
    *(int8x16_t *)(a2 + 112) = v36;
    *(void *)(a2 + 128) = v69;
    long long v37 = v64;
    *(_OWORD *)(a2 + 32) = v63;
    *(_OWORD *)(a2 + 48) = v37;
    long long v38 = v66;
    *(_OWORD *)(a2 + 64) = v65;
    *(_OWORD *)(a2 + 80) = v38;
    long long v39 = v62;
    *(_OWORD *)a2 = v61;
    *(_OWORD *)(a2 + 16) = v39;
  }
  if (a3 && !v21) {
    *a3 = v60;
  }
  return v21;
}

uint64_t unzGoToFirstFile(void *a1)
{
  if (!a1) {
    return 4294967194;
  }
  uint64_t v2 = a1[21];
  a1[16] = 0;
  a1[17] = v2;
  uint64_t result = unz64local_GetCurrentFileInfoInternal((uint64_t)a1, (uint64_t)(a1 + 22), a1 + 39, 0, 0, 0, 0, 0, 0);
  a1[18] = result == 0;
  return result;
}

uint64_t unzGoToNextFile(void *a1)
{
  if (!a1) {
    return 4294967194;
  }
  if (!a1[18]) {
    return 4294967196;
  }
  uint64_t v2 = a1[13];
  uint64_t v3 = a1[16] + 1;
  if (v2 != 0xFFFF && v3 == v2) {
    return 4294967196;
  }
  uint64_t v5 = a1[30] + a1[31] + a1[32] + a1[17] + 46;
  a1[16] = v3;
  a1[17] = v5;
  uint64_t result = unz64local_GetCurrentFileInfoInternal((uint64_t)a1, (uint64_t)(a1 + 22), a1 + 39, 0, 0, 0, 0, 0, 0);
  a1[18] = result == 0;
  return result;
}

uint64_t unzLocateFile(uint64_t a1, char *__s, int a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!a1 || strlen(__s) > 0xFF) {
    return 4294967194;
  }
  if (!*(void *)(a1 + 144)) {
    return 4294967196;
  }
  uint64_t v7 = *(void *)(a1 + 128);
  uint64_t v8 = *(void *)(a1 + 136);
  long long v17 = *(_OWORD *)(a1 + 272);
  long long v18 = *(_OWORD *)(a1 + 288);
  uint64_t v9 = *(void *)(a1 + 312);
  uint64_t v19 = *(void *)(a1 + 304);
  long long v13 = *(_OWORD *)(a1 + 208);
  long long v14 = *(_OWORD *)(a1 + 224);
  long long v15 = *(_OWORD *)(a1 + 240);
  long long v16 = *(_OWORD *)(a1 + 256);
  long long v11 = *(_OWORD *)(a1 + 176);
  long long v12 = *(_OWORD *)(a1 + 192);
  uint64_t v10 = *(void *)(a1 + 168);
  *(void *)(a1 + 128) = 0;
  *(void *)(a1 + 136) = v10;
  uint64_t result = unz64local_GetCurrentFileInfoInternal(a1, a1 + 176, (void *)(a1 + 312), 0, 0, 0, 0, 0, 0);
  for (*(void *)(a1 + 144) = result == 0; !result; uint64_t result = unzGoToNextFile((void *)a1))
  {
    char v21 = 0;
    memset(v20, 0, sizeof(v20));
    uint64_t result = unz64local_GetCurrentFileInfoInternal(a1, 0, 0, (uint64_t)v20, 0x100uLL, 0, 0, 0, 0);
    if (result) {
      break;
    }
    uint64_t result = unzStringFileNameCompare((const char *)v20, __s, a3);
    if (!result) {
      return result;
    }
  }
  *(void *)(a1 + 128) = v7;
  *(void *)(a1 + 136) = v8;
  *(_OWORD *)(a1 + 272) = v17;
  *(_OWORD *)(a1 + 288) = v18;
  *(void *)(a1 + 304) = v19;
  *(_OWORD *)(a1 + 208) = v13;
  *(_OWORD *)(a1 + 224) = v14;
  *(_OWORD *)(a1 + 240) = v15;
  *(_OWORD *)(a1 + 256) = v16;
  *(_OWORD *)(a1 + 176) = v11;
  *(_OWORD *)(a1 + 192) = v12;
  *(void *)(a1 + 312) = v9;
  return result;
}

uint64_t unzOpenCurrentFile3(uint64_t a1, _DWORD *a2, int *a3, int a4, uint64_t a5)
{
  uint64_t v5 = 4294967194;
  if (!a1 || a5 || !*(void *)(a1 + 144)) {
    return v5;
  }
  if (*(void *)(a1 + 320)) {
    unzCloseCurrentFile(a1);
  }
  if (call_zseek64((void *)a1)) {
    return 4294967193;
  }
  unint64_t v38 = 0;
  uint64_t v39 = 0;
  uint64_t v37 = 0;
  int Long = unz64local_getLong(a1, *(void *)(a1 + 96), &v39);
  uint64_t v11 = v39;
  int Short = unz64local_getShort(a1, *(void *)(a1 + 96), (uint64_t *)&v38);
  int v13 = unz64local_getShort(a1, *(void *)(a1 + 96), &v37);
  if (unz64local_getShort(a1, *(void *)(a1 + 96), (uint64_t *)&v38))
  {
    int v14 = -1;
  }
  else
  {
    if (v11 == 67324752) {
      int v17 = 0;
    }
    else {
      int v17 = -103;
    }
    int v18 = v13 | Short | Long;
    if (v18) {
      int v14 = -1;
    }
    else {
      int v14 = v17;
    }
    if (!v18 && v11 == 67324752)
    {
      if (v38 == *(void *)(a1 + 200) && v38 <= 0xC && ((1 << v38) & 0x1101) != 0) {
        int v14 = 0;
      }
      else {
        int v14 = -103;
      }
    }
  }
  int v15 = unz64local_getLong(a1, *(void *)(a1 + 96), (uint64_t *)&v38);
  if (unz64local_getLong(a1, *(void *)(a1 + 96), (uint64_t *)&v38))
  {
    int v16 = -1;
  }
  else
  {
    if (v15) {
      int v16 = -1;
    }
    else {
      int v16 = v14;
    }
    if (!v16)
    {
      if (v38 == *(void *)(a1 + 216))
      {
        int v16 = 0;
      }
      else if ((v37 & 8) != 0)
      {
        int v16 = 0;
      }
      else
      {
        int v16 = -103;
      }
    }
  }
  if (unz64local_getLong(a1, *(void *)(a1 + 96), (uint64_t *)&v38))
  {
    int v16 = -1;
  }
  else if (!v16 && v38 != 0xFFFFFFFF)
  {
    if (v38 == *(void *)(a1 + 224))
    {
      int v16 = 0;
    }
    else if ((v37 & 8) != 0)
    {
      int v16 = 0;
    }
    else
    {
      int v16 = -103;
    }
  }
  if (unz64local_getLong(a1, *(void *)(a1 + 96), (uint64_t *)&v38))
  {
    int v16 = -1;
  }
  else if (!v16 && v38 != 0xFFFFFFFF)
  {
    if (v38 == *(void *)(a1 + 232))
    {
      int v16 = 0;
    }
    else if ((v37 & 8) != 0)
    {
      int v16 = 0;
    }
    else
    {
      int v16 = -103;
    }
  }
  uint64_t v36 = 0;
  if (unz64local_getShort(a1, *(void *)(a1 + 96), &v36))
  {
    int v16 = -1;
    uint64_t v19 = v36;
  }
  else
  {
    uint64_t v19 = v36;
    if (!v16)
    {
      if (v36 == *(void *)(a1 + 240)) {
        int v16 = 0;
      }
      else {
        int v16 = -103;
      }
    }
  }
  uint64_t v35 = 0;
  if (unz64local_getShort(a1, *(void *)(a1 + 96), &v35) || v16) {
    return 4294967193;
  }
  uint64_t v21 = *(void *)(a1 + 312);
  int v22 = v35;
  uint64_t v23 = (char *)malloc_type_malloc(0x140uLL, 0x10B004067B04D0FuLL);
  if (!v23) {
    return 4294967192;
  }
  unint64_t v24 = v23;
  unint64_t v25 = malloc_type_malloc(0x4000uLL, 0xD13C373uLL);
  *(void *)unint64_t v24 = v25;
  *((void *)v24 + 17) = v19 + v21 + 30;
  *((_DWORD *)v24 + 36) = v22;
  *((void *)v24 + 19) = 0;
  *((_DWORD *)v24 + 78) = a4;
  if (!v25)
  {
    free(v24);
    return 4294967192;
  }
  *((void *)v24 + 16) = 0;
  if (a2) {
    *a2 = *(void *)(a1 + 200);
  }
  if (!a3) {
    goto LABEL_75;
  }
  *a3 = 6;
  uint64_t v26 = *(void *)(a1 + 192) & 6;
  switch(v26)
  {
    case 2:
      int v27 = 9;
      break;
    case 6:
      int v27 = 1;
      break;
    case 4:
      int v27 = 2;
      break;
    default:
      goto LABEL_75;
  }
  *a3 = v27;
LABEL_75:
  uint64_t v28 = *(void *)(a1 + 216);
  *((void *)v24 + 21) = 0;
  *((void *)v24 + 22) = v28;
  *((void *)v24 + 20) = 0;
  *((void *)v24 + 37) = *(void *)(a1 + 200);
  *((void *)v24 + 36) = *(void *)(a1 + 96);
  long long v29 = *(_OWORD *)(a1 + 32);
  long long v30 = *(_OWORD *)(a1 + 48);
  long long v31 = *(_OWORD *)(a1 + 64);
  *((void *)v24 + 35) = *(void *)(a1 + 80);
  *(_OWORD *)(v24 + 264) = v31;
  *(_OWORD *)(v24 + 248) = v30;
  *(_OWORD *)(v24 + 232) = v29;
  long long v32 = *(_OWORD *)a1;
  *(_OWORD *)(v24 + 216) = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v24 + 200) = v32;
  *((void *)v24 + 38) = *(void *)(a1 + 120);
  *((void *)v24 + 6) = 0;
  uint64_t v33 = *(void *)(a1 + 200);
  if (a4 || v33 != 12)
  {
    if (!a4 && v33 == 8)
    {
      *((void *)v24 + 1) = 0;
      *((_DWORD *)v24 + 4) = 0;
      *((void *)v24 + 10) = 0;
      *((void *)v24 + 11) = 0;
      *((void *)v24 + 9) = 0;
      uint64_t v34 = inflateInit2_((z_streamp)(v24 + 8), -15, "1.2.12", 112);
      if (v34)
      {
        uint64_t v5 = v34;
        free(v24);
        return v5;
      }
      *((void *)v24 + 16) = 8;
    }
  }
  else
  {
    *((_DWORD *)v24 + 78) = 1;
  }
  uint64_t v5 = 0;
  *(_OWORD *)(v24 + 184) = *(_OWORD *)(a1 + 224);
  *((void *)v24 + 15) = *(void *)(a1 + 312) + (v22 + v19) + 30;
  *((_DWORD *)v24 + 4) = 0;
  *(void *)(a1 + 320) = v24;
  *(_DWORD *)(a1 + 328) = 0;
  return v5;
}

uint64_t unzOpenCurrentFile(uint64_t a1)
{
  return unzOpenCurrentFile3(a1, 0, 0, 0, 0);
}

uint64_t unzReadCurrentFile(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (!a1) {
    return 4294967194;
  }
  uint64_t v3 = *(void *)(a1 + 320);
  if (!v3) {
    return 4294967194;
  }
  if (!*(void *)v3) {
    return 4294967196;
  }
  if (!a3) {
    return 0;
  }
  *(void *)(v3 + 32) = a2;
  *(_DWORD *)(v3 + 40) = a3;
  unint64_t v4 = a3;
  unint64_t v5 = *(void *)(v3 + 192);
  if (v5 < a3 && !*(_DWORD *)(v3 + 312))
  {
    *(_DWORD *)(v3 + 40) = v5;
    a3 = v5;
  }
  uint64_t v6 = *(void *)(v3 + 184);
  uint64_t v7 = *(unsigned int *)(v3 + 16);
  if (v6 + v7 < v4 && *(_DWORD *)(v3 + 312))
  {
    a3 = v7 + v6;
    *(_DWORD *)(v3 + 40) = v7 + v6;
  }
  if (!a3) {
    return 0;
  }
  uint64_t v8 = 0;
  while (1)
  {
    LODWORD(v9) = *(_DWORD *)(v3 + 16);
    if (!v9)
    {
      unint64_t v10 = *(void *)(v3 + 184);
      if (v10)
      {
        if (v10 >= 0x4000) {
          uint64_t v9 = 0x4000;
        }
        else {
          uint64_t v9 = *(void *)(v3 + 184);
        }
        if (call_zseek64((void *)(v3 + 200))
          || (*(uint64_t (**)(void, void, void, uint64_t))(v3 + 208))(*(void *)(v3 + 256), *(void *)(v3 + 288), *(void *)v3, v9) != v9)
        {
          return 0xFFFFFFFFLL;
        }
        *(void *)(v3 + 120) += v9;
        *(void *)(v3 + 184) -= v9;
        *(void *)(v3 + 8) = *(void *)v3;
        *(_DWORD *)(v3 + 16) = v9;
      }
      else
      {
        LODWORD(v9) = 0;
      }
    }
    uint64_t v11 = *(void *)(v3 + 296);
    if (v11)
    {
      if (!*(_DWORD *)(v3 + 312)) {
        break;
      }
    }
    if (!v9 && !*(void *)(v3 + 184)) {
      return v8;
    }
    unsigned int v12 = *(_DWORD *)(v3 + 40);
    if (v12 >= v9) {
      uint64_t v9 = v9;
    }
    else {
      uint64_t v9 = v12;
    }
    if (v9)
    {
      for (uint64_t i = 0; i != v9; ++i)
        *(unsigned char *)(*(void *)(v3 + 32) + i) = *(unsigned char *)(*(void *)(v3 + 8) + i);
      uint64_t v14 = v9;
    }
    else
    {
      uint64_t v14 = 0;
    }
    uLong v15 = *(void *)(v3 + 168);
    *(void *)(v3 + 160) += v14;
    *(void *)(v3 + 168) = crc32(v15, *(const Bytef **)(v3 + 32), v9);
    *(void *)(v3 + 192) -= v14;
    *(_DWORD *)(v3 + 16) -= v9;
    *(_DWORD *)(v3 + 40) -= v9;
    *(void *)(v3 + 32) += v14;
    *(void *)(v3 + 8) += v14;
    uint64_t v8 = (v9 + v8);
    *(void *)(v3 + 48) += v14;
LABEL_35:
    if (!*(_DWORD *)(v3 + 40)) {
      return v8;
    }
  }
  if (v11 == 12) {
    goto LABEL_35;
  }
  unint64_t v16 = *(void *)(v3 + 48);
  int v17 = *(const Bytef **)(v3 + 32);
  uint64_t v18 = inflate((z_streamp)(v3 + 8), 2);
  uint64_t v19 = v18;
  if ((v18 & 0x80000000) == 0)
  {
    if (*(void *)(v3 + 56)) {
      uint64_t v19 = 4294967293;
    }
    else {
      uint64_t v19 = v18;
    }
  }
  unint64_t v20 = *(void *)(v3 + 48);
  if (v20 < v16) {
    v20 += 0x100000000;
  }
  unint64_t v21 = v20 - v16;
  uLong v22 = *(void *)(v3 + 168);
  *(void *)(v3 + 160) += v21;
  *(void *)(v3 + 168) = crc32(v22, v17, v21);
  *(void *)(v3 + 192) -= v21;
  uint64_t v8 = (v8 + v21);
  if (!v19) {
    goto LABEL_35;
  }
  uint64_t v23 = v8;
  uint64_t v8 = v19;
  if (v19 != 1) {
    return v8;
  }
  return v23;
}

uint64_t unz64local_getLong(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  int v11 = 0;
  if (unz64local_getByte(a1, a2, &v11)
    || (uint64_t v6 = v11, unz64local_getByte(a1, a2, &v11))
    || (uint64_t v7 = v11, unz64local_getByte(a1, a2, &v11)))
  {
    uint64_t v8 = 0;
    uint64_t result = 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t v10 = v6 | (v7 << 8) | ((uint64_t)v11 << 16);
    uint64_t result = unz64local_getByte(a1, a2, &v11);
    uint64_t v8 = v10 + ((uint64_t)v11 << 24);
    if (result) {
      uint64_t v8 = 0;
    }
  }
  *a3 = v8;
  return result;
}

uint64_t unz64local_getLong64(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  unsigned int v15 = 0;
  if (unz64local_getByte(a1, a2, &v15)
    || (uint64_t v6 = (int)v15, unz64local_getByte(a1, a2, &v15))
    || (uint64_t v7 = (int)v15, unz64local_getByte(a1, a2, &v15))
    || (uint64_t v8 = (int)v15, unz64local_getByte(a1, a2, &v15))
    || (uint64_t v9 = (int)v15, unz64local_getByte(a1, a2, &v15))
    || (uint64_t v10 = (int)v15, unz64local_getByte(a1, a2, &v15))
    || (uint64_t v11 = v15, unz64local_getByte(a1, a2, &v15)))
  {
    unint64_t v12 = 0;
    uint64_t result = 0xFFFFFFFFLL;
  }
  else
  {
    unint64_t v14 = v6 | (v7 << 8) | (v8 << 16) | (v9 << 24) | (v10 << 32) | (v11 << 40) | ((unint64_t)v15 << 48);
    uint64_t result = unz64local_getByte(a1, a2, &v15);
    unint64_t v12 = v14 | ((unint64_t)v15 << 56);
    if (result) {
      unint64_t v12 = 0;
    }
  }
  *a3 = v12;
  return result;
}

uint64_t unz64local_getShort(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  int v9 = 0;
  if (unz64local_getByte(a1, a2, &v9))
  {
    uint64_t v6 = 0;
    uint64_t result = 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t v8 = v9;
    uint64_t result = unz64local_getByte(a1, a2, &v9);
    uint64_t v6 = v8 | ((uint64_t)v9 << 8);
    if (result) {
      uint64_t v6 = 0;
    }
  }
  *a3 = v6;
  return result;
}

uint64_t unz64local_getByte(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  unsigned __int8 v7 = 0;
  if ((*(unsigned int (**)(void, uint64_t, unsigned __int8 *, uint64_t))(a1 + 8))(*(void *)(a1 + 56), a2, &v7, 1) == 1)
  {
    uint64_t result = 0;
    *a3 = v7;
  }
  else if ((*(unsigned int (**)(void, uint64_t))(a1 + 48))(*(void *)(a1 + 56), a2))
  {
    return 0xFFFFFFFFLL;
  }
  else
  {
    return 0;
  }
  return result;
}

uint64_t call_zopen64(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))a1;
  if (!*(void *)a1) {
    uint64_t v1 = *(uint64_t (**)(void))(a1 + 64);
  }
  return v1(*(void *)(a1 + 56));
}

uint64_t call_zseek64(void *a1)
{
  uint64_t v1 = (uint64_t (*)(void))a1[4];
  if (!v1) {
    uint64_t v1 = (uint64_t (*)(void))a1[10];
  }
  return v1(a1[7]);
}

uint64_t call_ztell64(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 56);
  if (v2)
  {
    unint64_t v4 = *(uint64_t (**)(uint64_t))(a1 + 24);
    return v4(v3);
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(uint64_t))(a1 + 72))(v3);
    if (result == 0xFFFFFFFFLL) {
      return -1;
    }
  }
  return result;
}

size_t fread_file_func(int a1, FILE *__stream, void *__ptr, size_t __nitems)
{
  return fread(__ptr, 1uLL, __nitems, __stream);
}

size_t fwrite_file_func(int a1, FILE *__stream, void *__ptr, size_t __nitems)
{
  return fwrite(__ptr, 1uLL, __nitems, __stream);
}

uint64_t fclose_file_func(int a1, FILE *a2)
{
  return fclose(a2);
}

uint64_t ferror_file_func(int a1, FILE *a2)
{
  return ferror(a2);
}

FILE *(**fill_fopen64_filefunc(FILE *(**result)(int a1, char *__filename, char a3)))(int a1, char *__filename, char a3)
{
  *uint64_t result = fopen64_file_func;
  result[1] = (FILE *(*)(int, char *, char))fread_file_func;
  result[2] = (FILE *(*)(int, char *, char))fwrite_file_func;
  result[3] = (FILE *(*)(int, char *, char))ftell64_file_func;
  result[4] = (FILE *(*)(int, char *, char))fseek64_file_func;
  result[5] = (FILE *(*)(int, char *, char))fclose_file_func;
  result[6] = (FILE *(*)(int, char *, char))ferror_file_func;
  result[7] = 0;
  return result;
}

FILE *fopen64_file_func(int a1, char *__filename, char a3)
{
  int v3 = a3 & 3;
  unint64_t v4 = "r+b";
  unint64_t v5 = "wb";
  if ((a3 & 8) == 0) {
    unint64_t v5 = 0;
  }
  if ((a3 & 4) != 0) {
    LOBYTE(v6) = 1;
  }
  else {
    int v6 = (a3 & 8) >> 3;
  }
  if ((a3 & 4) == 0) {
    unint64_t v4 = v5;
  }
  if (v3 == 1) {
    char v7 = 1;
  }
  else {
    char v7 = v6;
  }
  if (v3 == 1) {
    uint64_t v8 = "rb";
  }
  else {
    uint64_t v8 = v4;
  }
  if (__filename && (v7 & 1) != 0) {
    return fopen(__filename, v8);
  }
  else {
    return 0;
  }
}

off_t ftell64_file_func(int a1, FILE *__stream)
{
  return ftello(__stream);
}

uint64_t fseek64_file_func(int a1, FILE *__stream, off_t a3, unsigned int __whence)
{
  if (__whence > 2) {
    return -1;
  }
  if (fseeko(__stream, a3, __whence)) {
    return -1;
  }
  return 0;
}

size_t fread_mem_func(int a1, void *a2, void *__dst, size_t a4)
{
  uint64_t v5 = a2[3];
  if (a2[1] - v5 >= a4) {
    size_t v6 = a4;
  }
  else {
    size_t v6 = a2[1] - v5;
  }
  memcpy(__dst, (const void *)(*a2 + v5), v6);
  a2[3] += v6;
  return v6;
}

size_t fwrite_mem_func(int a1, void *a2, void *__src, size_t a4)
{
  uint64_t v5 = a2[3];
  if (a2[1] - v5 >= a4) {
    size_t v6 = a4;
  }
  else {
    size_t v6 = a2[1] - v5;
  }
  memcpy((void *)(*a2 + v5), __src, v6);
  size_t v7 = a2[2];
  size_t v8 = a2[3] + v6;
  a2[3] = v8;
  if (v8 > v7) {
    a2[2] = v8;
  }
  return v6;
}

uint64_t ftell_mem_func(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 24);
}

uint64_t fseek_mem_func(uint64_t a1, void *a2, unint64_t a3, int a4)
{
  unint64_t v4 = a3;
  if (a4)
  {
    if (a4 == 2)
    {
      size_t v6 = a2 + 2;
    }
    else
    {
      if (a4 != 1) {
        return -1;
      }
      size_t v6 = a2 + 3;
    }
    unint64_t v4 = *v6 + a3;
  }
  if (v4 > a2[1]) {
    return 1;
  }
  unint64_t v8 = a2[2];
  if (v4 > v8) {
    bzero((void *)(*a2 + v8), v4 - v8);
  }
  uint64_t result = 0;
  a2[3] = v4;
  return result;
}

uint64_t fclose_mem_func(int a1, void *a2)
{
  return 0;
}

uint64_t ferror_mem_func()
{
  return 0;
}

void *fill_memory_filefunc64_32(void *result)
{
  result[7] = 0;
  result[8] = fopen_mem_func;
  *uint64_t result = fopen64_mem_func;
  result[1] = fread_mem_func;
  result[2] = fwrite_mem_func;
  result[9] = ftell_mem_func;
  result[10] = fseek_mem_func;
  result[4] = 0;
  result[5] = fclose_mem_func;
  result[6] = ferror_mem_func;
  return result;
}

void *fopen64_mem_func(uint64_t a1, const char *a2, char a3)
{
  uint64_t v5 = malloc_type_malloc(0x20uLL, 0x1010040FAA616C6uLL);
  if (v5)
  {
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    if (sscanf(a2, "%lx+%lx", &v11, &v10) == 2
      && (uint64_t v6 = v10, v7 = v11, *v5 = v11, v5[1] = v6, *v7 == 80)
      && (v7[1] == 75 ? (BOOL v8 = v6 == 0) : (BOOL v8 = 1), !v8))
    {
      if ((a3 & 8) != 0) {
        uint64_t v6 = 0;
      }
      v5[2] = v6;
      v5[3] = 0;
    }
    else
    {
      free(v5);
      return 0;
    }
  }
  return v5;
}

void OFDTextObject::OFDTextObject(OFDTextObject *this, const __CFDictionary *a2)
{
  uint64_t v4 = OFDObject::OFDObject((uint64_t)this, a2, 2);
  *(void *)uint64_t v4 = &unk_1ED4E0538;
  *(_OWORD *)(v4 + 232) = 0u;
  uint64_t v5 = v4 + 232;
  *(_OWORD *)(v4 + 248) = 0u;
  uint64_t v6 = (uint64_t *)(v4 + 256);
  size_t v7 = (uint64_t *)(v4 + 280);
  *(void *)(v4 + 296) = 0;
  *(_OWORD *)(v4 + 264) = 0u;
  *(_OWORD *)(v4 + 280) = 0u;
  memset(v15, 0, sizeof(v15));
  IIODictionary::IIODictionary((IIODictionary *)v15, a2);
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(a2, @"TextCode");
  memset(v14, 0, sizeof(v14));
  IIODictionary::IIODictionary((IIODictionary *)v14, Value);
  *((_DWORD *)this + 48) = IIODictionary::getUint32ForKey((IIODictionary *)v15, @"Font");
  *((double *)this + 25) = IIODictionary::getDoubleForKey((IIODictionary *)v15, @"Size");
  *((double *)this + 27) = IIODictionary::getDoubleForKey((IIODictionary *)v14, @"X");
  *((double *)this + 28) = IIODictionary::getDoubleForKey((IIODictionary *)v14, @"Y");
  CFDictionaryRef ObjectForKey = IIODictionary::getObjectForKey((IIODictionary *)v14, @"_text");
  if (ObjectForKey)
  {
    IIOString::IIOString((IIOString *)v13, ObjectForKey);
    CFStringRef v10 = IIOString::utf8String((IIOString *)v13);
  }
  else
  {
    CFStringRef v10 = (const __CFString *)"";
  }
  MEMORY[0x18C11BE10](v5, v10);
  if (ObjectForKey) {
    IIOString::~IIOString((IIOString *)v13);
  }
  CFDictionaryRef v11 = IIODictionary::getObjectForKey((IIODictionary *)v14, @"DeltaX");
  if (v11) {
    OFDParseTextDelta(v11, v6);
  }
  CFDictionaryRef v12 = IIODictionary::getObjectForKey((IIODictionary *)v14, @"DeltaY");
  if (v12) {
    OFDParseTextDelta(v12, v7);
  }
  *((void *)this + 26) = 0;
  IIODictionary::~IIODictionary((IIODictionary *)v14);
  IIODictionary::~IIODictionary((IIODictionary *)v15);
}

void sub_188976508(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va2, a2);
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  va_copy(va2, va1);
  uint64_t v11 = va_arg(va2, void);
  uint64_t v13 = va_arg(va2, void);
  uint64_t v14 = va_arg(va2, void);
  IIOString::~IIOString((IIOString *)va);
  IIODictionary::~IIODictionary((IIODictionary *)va1);
  IIODictionary::~IIODictionary((IIODictionary *)va2);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)va2);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)va2);
  if (*(char *)(v2 + 255) < 0) {
    operator delete(*v3);
  }
  _cg_jpeg_mem_term(v2, v5, v6);
  _Unwind_Resume(a1);
}

void OFDTextObject::~OFDTextObject(OFDTextObject *this)
{
  *(void *)this = &unk_1ED4E0538;
  uint64_t v2 = (CGColor *)*((void *)this + 26);
  if (v2) {
    CGColorRelease(v2);
  }
  uint64_t v5 = (void **)((char *)this + 280);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v5);
  uint64_t v5 = (void **)((char *)this + 256);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v5);
  if (*((char *)this + 255) < 0) {
    operator delete(*((void **)this + 29));
  }
  _cg_jpeg_mem_term(this, v3, v4);
}

{
  uint64_t vars8;

  OFDTextObject::~OFDTextObject(this);

  JUMPOUT(0x18C11C0E0);
}

CFAttributedStringRef OFDTextObject::makeAttrStringRef(const void **this, const char *a2, const __CTFont *a3)
{
  uint64_t v10 = 0;
  CFDictionaryRef attributes = 0;
  uint64_t v12 = 0;
  IIODictionary::IIODictionary((IIODictionary *)&v10);
  IIODictionary::setObjectForKey((IIODictionary *)&v10, a3, *(const __CFString **)gIIO_kCTFontAttributeName);
  IIODictionary::setObjectForKey((IIODictionary *)&v10, this[26], *(const __CFString **)gIIO_kCTForegroundColorAttributeName);
  IIOString::IIOString((IIOString *)v8, a2);
  CFAttributedStringRef v6 = CFAttributedStringCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], str, attributes);
  IIOString::~IIOString((IIOString *)v8);
  IIODictionary::~IIODictionary((IIODictionary *)&v10);
  return v6;
}

void sub_188976720(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
}

void OFDTextObject::drawInContext(OFDTextObject *this, CGContext *a2, CGRect a3, OFDPage *a4)
{
  uint64_t v5 = (IIODictionary **)*((void *)a4 + 2);
  if (!v5) {
    return;
  }
  Font = (const __CTFont *)OFDDocument::createFont(v5, *((unsigned int *)this + 48), *((double *)this + 25));
  CGContextSaveGState(a2);
  *((void *)this + 23) = 0x3FF0000000000000;
  *((void *)this + 18) = 0x3FF0000000000000;
  *((void *)this + 26) = OFDCreateCGColor((uint64_t)this + 152);
  if (*((_DWORD *)this + 38) == 1) {
    CGContextSetRGBFillColor(a2, *((CGFloat *)this + 20), *((CGFloat *)this + 21), *((CGFloat *)this + 22), 1.0);
  }
  if (*((_DWORD *)this + 28) == 1) {
    CGContextSetRGBFillColor(a2, *((CGFloat *)this + 15), *((CGFloat *)this + 16), *((CGFloat *)this + 17), 1.0);
  }
  long long v8 = *(_OWORD *)((char *)this + 40);
  *(_OWORD *)&transform.a = *(_OWORD *)((char *)this + 24);
  *(_OWORD *)&transform.c = v8;
  *(_OWORD *)&transform.tdouble x = *(_OWORD *)((char *)this + 56);
  CGContextConcatCTM(a2, &transform);
  CGContextScaleCTM(a2, 1.0, -1.0);
  uint64_t v9 = (char *)this + 232;
  if (*((char *)this + 255) < 0) {
    uint64_t v9 = *(const char **)v9;
  }
  double v10 = *MEMORY[0x1E4F1DAD8] + *((double *)this + 27);
  double v11 = *(double *)(MEMORY[0x1E4F1DAD8] + 8) - *((double *)this + 28);
  CFAttributedStringRef AttrStringRef = OFDTextObject::makeAttrStringRef((const void **)this, v9, Font);
  CFRelease(Font);
  if (*((void *)this + 33) == *((void *)this + 32) && *((void *)this + 36) == *((void *)this + 35))
  {
    CGContextSetTextPosition(a2, v10, v11);
    uint64_t v31 = gFunc_CTLineCreateWithAttributedString(AttrStringRef);
    if (v31)
    {
      long long v32 = (const void *)v31;
      gFunc_CTLineDraw(v31, a2);
      CFRelease(v32);
    }
    CGContextFlush(a2);
    if (!AttrStringRef) {
      goto LABEL_32;
    }
  }
  else
  {
    if (CFAttributedStringGetLength(AttrStringRef) >= 1)
    {
      uint64_t v13 = 0;
      unint64_t v14 = 0;
      CFAllocatorRef v15 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CGFloat v16 = v10;
      uint64_t v33 = a2;
      do
      {
        v36.location = v14;
        v36.length = 1;
        CFAttributedStringRef v17 = CFAttributedStringCreateWithSubstring(v15, AttrStringRef, v36);
        if (v17)
        {
          CFAttributedStringRef v18 = v17;
          uint64_t v19 = gFunc_CTLineCreateWithAttributedString(v17);
          if (v19)
          {
            unint64_t v20 = (const void *)v19;
            CGContextSetTextPosition(a2, v16, v11);
            gFunc_CTLineDraw(v20, a2);
            uint64_t v21 = gFunc_CTFramesetterCreateWithAttributedString(v18);
            if (v21)
            {
              uLong v22 = (const void *)v21;
              v34[0] = 0;
              v34[1] = 0;
              gFunc_CTFramesetterSuggestFrameSizeWithConstraints(v21, 0, 1, 0, v34, 1.79769313e308, 1.79769313e308);
              uint64_t v24 = *((void *)this + 32);
              uint64_t v25 = *((void *)this + 33);
              if (v25 != v24 && 0xAAAAAAAAAAAAAAABLL * ((v25 - v24) >> 3) > v14)
              {
                uint64_t v26 = (const char *)(v24 + v13);
                if (*(char *)(v24 + v13 + 23) < 0) {
                  uint64_t v26 = *(const char **)v26;
                }
                double v23 = atof(v26);
              }
              CGFloat v16 = v16 + v23;
              uint64_t v27 = *((void *)this + 35);
              uint64_t v28 = *((void *)this + 36) - v27;
              if (v28 && 0xAAAAAAAAAAAAAAABLL * (v28 >> 3) > v14)
              {
                long long v29 = (const char *)(v27 + v13);
                if (*(char *)(v27 + v13 + 23) < 0) {
                  long long v29 = *(const char **)v29;
                }
                double v11 = v11 - atof(v29);
                if (v25 == v24) {
                  CGFloat v16 = v10;
                }
              }
              a2 = v33;
              CFRelease(v22);
            }
            CFRelease(v20);
          }
          CFRelease(v18);
        }
        ++v14;
        v13 += 24;
      }
      while (CFAttributedStringGetLength(AttrStringRef) > (uint64_t)v14);
    }
    if (!AttrStringRef) {
      goto LABEL_32;
    }
  }
  CFRelease(AttrStringRef);
LABEL_32:
  long long v30 = (CGColor *)*((void *)this + 26);
  if (v30)
  {
    CGColorRelease(v30);
    *((void *)this + 26) = 0;
  }
  CGContextRestoreGState(a2);
}

void OFDImageObject::OFDImageObject(OFDImageObject *this, const __CFDictionary *a2)
{
  *(void *)OFDObject::OFDObject((uint64_t)this, a2, 3) = &unk_1ED4E2B78;
  memset(v4, 0, sizeof(v4));
  IIODictionary::IIODictionary((IIODictionary *)v4, a2);
  *((void *)this + 24) = IIODictionary::getUint64ForKey((IIODictionary *)v4, @"ResourceID");
  *((double *)this + 3) = *((double *)this + 3) * (1.0 / *((double *)this + 3));
  *((double *)this + 6) = *((double *)this + 6) * (1.0 / *((double *)this + 6));
  IIODictionary::~IIODictionary((IIODictionary *)v4);
}

void sub_188976B58(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  IIODictionary::~IIODictionary((IIODictionary *)va);
  _cg_jpeg_mem_term(v2, v4, v5);
  _Unwind_Resume(a1);
}

void OFDImageObject::~OFDImageObject(OFDImageObject *this, uint64_t a2, const char *a3)
{
  _cg_jpeg_mem_term(this, a2, a3);

  JUMPOUT(0x18C11C0E0);
}

void OFDImageObject::drawInContext(OFDImageObject *this, CGContextRef c, CGRect a3, IIODictionary **a4)
{
  CGContextSaveGState(c);
  long long v7 = *(_OWORD *)((char *)this + 40);
  *(_OWORD *)&transform.a = *(_OWORD *)((char *)this + 24);
  *(_OWORD *)&transform.c = v7;
  *(_OWORD *)&transform.tCGFloat x = *(_OWORD *)((char *)this + 56);
  CGContextConcatCTM(c, &transform);
  CFStringRef v8 = OFDPage::copyResourcePath(a4, *((_DWORD *)this + 48), @"Image");
  memset(v40, 0, sizeof(v40));
  IIOString::IIOString((IIOString *)v40, v8);
  if (v8) {
    CFRelease(v8);
  }
  uint64_t v9 = (OFDContainer **)a4[2];
  double v10 = (const char *)IIOString::utf8String((IIOString *)v40);
  CFDataRef v11 = OFDDocument::copyFileContent(v9, v10);
  CFDataRef v12 = v11;
  if (v11)
  {
    uint64_t v13 = CGImageSourceCreateWithData(v11, 0);
    unint64_t v14 = v13;
    if (!v13) {
      goto LABEL_14;
    }
    CFStringRef Type = CGImageSourceGetType(v13);
    ImageAtIndeCGFloat x = (CGImage *)Type;
    if (Type)
    {
      if (CFStringCompare(Type, @"com.microsoft.bmp", 0)
        && CFStringCompare((CFStringRef)ImageAtIndex, @"public.jpeg", 0)
        && CFStringCompare((CFStringRef)ImageAtIndex, @"public.png", 0)
        && CFStringCompare((CFStringRef)ImageAtIndex, @"public.tiff", 0))
      {
        LOBYTE(ImageAtIndex) = 0;
      }
      else
      {
        ImageAtIndeCGFloat x = CGImageSourceCreateImageAtIndex(v14, 0, 0);
        if (ImageAtIndex)
        {
          CGFloat v17 = *((double *)this + 11);
          double v18 = *((double *)this + 12);
          CGFloat v19 = *MEMORY[0x1E4F1DAD8];
          double v20 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
          CGContextTranslateCTM(c, *MEMORY[0x1E4F1DAD8], v18 + v20);
          CGContextScaleCTM(c, 1.0, -1.0);
          CGContextSetInterpolationQuality(c, kCGInterpolationNone);
          v42.origin.CGFloat x = v19;
          v42.origin.CGFloat y = v20;
          v42.size.CGFloat width = v17;
          v42.size.CGFloat height = v18;
          CGContextDrawImage(c, v42, ImageAtIndex);
          CGImageRelease(ImageAtIndex);
          LOBYTE(ImageAtIndex) = 1;
        }
      }
    }
    CFRelease(v14);
    if ((ImageAtIndex & 1) == 0)
    {
LABEL_14:
      if (OFDImageObject::drawInContext(CGContext *,CGRect,OFDPage *)::onceToken != -1) {
        dispatch_once(&OFDImageObject::drawInContext(CGContext *,CGRect,OFDPage *)::onceToken, &__block_literal_global_50);
      }
      if (!g_CGPDFSourceCreateForJBIG2) {
        goto LABEL_27;
      }
      uint64_t v21 = CGDataProviderCreateWithCFData(v12);
      if (!v21) {
        goto LABEL_27;
      }
      uLong v22 = (uint64_t (*)(CGDataProvider *, uint64_t, CFIndex))g_CGPDFSourceCreateForJBIG2;
      CFIndex Length = CFDataGetLength(v12);
      if (v22(v21, 13, Length - 13))
      {
        uint64_t v24 = malloc_type_malloc(0x514uLL, 0xB1DE8658uLL);
        if (CGPDFSourceRead() == 1300
          && (uint64_t v25 = CGDataProviderCreateWithData(0, v24, 0x514uLL, (CGDataProviderReleaseDataCallback)DPReleaseDataCallback)) != 0)
        {
          uint64_t v26 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC00]);
          uint64_t v27 = CGImageCreate(0x64uLL, 0x64uLL, 1uLL, 1uLL, 0xDuLL, v26, 0, v25, 0, 0, kCGRenderingIntentDefault);
          CGColorSpaceRelease(v26);
          CGDataProviderRelease(v25);
          if (v27)
          {
            CGFloat v28 = *((double *)this + 11);
            double v29 = *((double *)this + 12);
            CGFloat v30 = *MEMORY[0x1E4F1DAD8];
            double v31 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
            CGContextTranslateCTM(c, *MEMORY[0x1E4F1DAD8], v29 + v31);
            CGContextScaleCTM(c, 1.0, -1.0);
            CGContextSetInterpolationQuality(c, kCGInterpolationNone);
            v43.origin.CGFloat x = v30;
            v43.origin.CGFloat y = v31;
            v43.size.CGFloat width = v28;
            v43.size.CGFloat height = v29;
            CGContextDrawImage(c, v43, v27);
            CGImageRelease(v27);
            LOBYTE(v27) = 1;
          }
        }
        else
        {
          LOBYTE(v27) = 0;
        }
        CGPDFSourceRelease();
      }
      else
      {
        LOBYTE(v27) = 0;
      }
      CGDataProviderRelease(v21);
      if ((v27 & 1) == 0)
      {
LABEL_27:
        CGFloat v32 = *((double *)this + 11);
        CGFloat v33 = *((double *)this + 12);
        CGFloat v34 = *MEMORY[0x1E4F1DAD8];
        CGFloat v35 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
        CGContextSetRGBFillColor(c, 0.8, 0.8, 0.8, 0.8);
        v44.origin.CGFloat x = v34;
        v44.origin.CGFloat y = v35;
        v44.size.CGFloat width = v32;
        v44.size.CGFloat height = v33;
        CGContextFillRect(c, v44);
        CGContextSetLineWidth(c, 0.2);
        v45.origin.CGFloat x = v34;
        v45.origin.CGFloat y = v35;
        v45.size.CGFloat width = v32;
        v45.size.CGFloat height = v33;
        CGRect v46 = CGRectInset(v45, 1.0, 1.0);
        CGFloat x = v46.origin.x;
        CGFloat y = v46.origin.y;
        CGFloat width = v46.size.width;
        CGFloat height = v46.size.height;
        CGContextSetRGBStrokeColor(c, 0.2, 0.2, 0.2, 0.8);
        v47.origin.CGFloat x = x;
        v47.origin.CGFloat y = y;
        v47.size.CGFloat width = width;
        v47.size.CGFloat height = height;
        CGContextStrokeRect(c, v47);
      }
    }
    CFRelease(v12);
  }
  CGContextRestoreGState(c);
  IIOString::~IIOString((IIOString *)v40);
}

void sub_188977034(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  IIOString::~IIOString((IIOString *)va);
  _Unwind_Resume(a1);
}

void *___ZN14OFDImageObject13drawInContextEP9CGContext6CGRectP7OFDPage_block_invoke()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  strcpy(v1, "/System/Library/Frameworks/CoreGraphics.framework/CoreGraphics");
  uint64_t result = dlopen(v1, 257);
  if (result)
  {
    uint64_t result = dlsym(result, "CGPDFSourceCreateForJBIG2");
    g_CGPDFSourceCreateForJBIG2 = result;
  }
  return result;
}

void DPReleaseDataCallback(void *a1, void *a2)
{
  if (a2) {
    free(a2);
  }
}

void sub_18897727C(_Unwind_Exception *a1)
{
}

uint64_t XMLDictionaryCreateWithData(const __CFData *a1)
{
  uint64_t v2 = 0;
  +[IIO_CXMLParser dictionaryForXMLData:a1 error:&v2];
  if (!v2) {
    operator new();
  }
  return 0;
}

void sub_1889775C0(_Unwind_Exception *a1)
{
  MEMORY[0x18C11C0E0](v1, 0x10A1C4047070A01);
  _Unwind_Resume(a1);
}

uint64_t ASN1Item::readTag(uint64_t a1, unsigned char *a2, unsigned int a3, uint64_t a4)
{
  if (!a3) {
    return 0;
  }
  *(unsigned char *)(a4 + 1) = *a2 & 0xC0;
  *(unsigned char *)a4 = (*a2 & 0x20) != 0;
  int v4 = *a2 & 0x1F;
  if (v4 == 31)
  {
    *(unsigned char *)(a4 + 2) = 0;
    if (a3 >= 3) {
      uint64_t v5 = 3;
    }
    else {
      uint64_t v5 = a3;
    }
    if (v5 < 2) {
      return 0;
    }
    int v6 = 0;
    uint64_t v7 = 1;
    while (1)
    {
      int v8 = a2[v7] & 0x7F | (v6 << 7);
      *(unsigned char *)(a4 + 2) = a2[v7] & 0x7F | ((_BYTE)v6 << 7);
      if (((char)a2[v7] & 0x80000000) == 0) {
        break;
      }
      ++v7;
      int v6 = v8;
      if (v5 == v7) {
        return 0;
      }
    }
    unsigned int v10 = v7 + 1;
  }
  else
  {
    *(unsigned char *)(a4 + 2) = v4;
    unsigned int v10 = 1;
  }
  if (v10 >= a3) {
    return 0;
  }
  unsigned int v11 = a2[v10];
  if (((char)a2[v10] & 0x80000000) == 0)
  {
    *(_DWORD *)(a4 + 4) = v11;
    goto LABEL_16;
  }
  uint64_t result = 0;
  if (v11 != 128 && v11 != 255)
  {
    unsigned int v14 = v11 & 0x7F;
    if (v14 > 4 || v14 + v10 >= a3) {
      return 0;
    }
    *(_DWORD *)(a4 + 4) = 0;
    unsigned int v11 = 0;
    if (v14)
    {
      uint64_t v12 = v10 + 1;
      do
      {
        unsigned int v11 = a2[v12] | (v11 << 8);
        *(_DWORD *)(a4 + 4) = v11;
        ++v12;
        --v14;
      }
      while (v14);
      if (v11 > a3) {
        return 0;
      }
      goto LABEL_17;
    }
LABEL_16:
    LODWORD(v12) = v10 + 1;
LABEL_17:
    *(void *)(a4 + 8) = &a2[v12];
    unsigned int v13 = v11 + v12;
    if (v13 <= a3)
    {
      *(_DWORD *)(a4 + 16) = v13;
      return 1;
    }
    return 0;
  }
  return result;
}

uint64_t ASN1Item::getInteger(uint64_t a1, uint64_t a2, int *a3)
{
  if (*(unsigned char *)a2 || *(unsigned char *)(a2 + 1) || *(unsigned char *)(a2 + 2) != 2) {
    return 0;
  }
  if ((*(_DWORD *)(a2 + 4) - 5) >= 0xFFFFFFFC)
  {
    uint64_t v3 = *(char **)(a2 + 8);
    int v4 = *v3 >> 7;
    *a3 = v4;
    if (*(_DWORD *)(a2 + 4))
    {
      unint64_t v5 = 0;
      do
      {
        *a3 = v4 << 8;
        int v6 = v3[v5] | (v4 << 8);
        *a3 = v6;
        ++v5;
        int v4 = v6;
      }
      while (v5 < *(unsigned int *)(a2 + 4));
    }
  }
  return 1;
}

uint64_t ASN1Item::getString(uint64_t a1, uint64_t a2, std::string *a3)
{
  MEMORY[0x18C11BE10](a3, "");
  if (*(_DWORD *)(a2 + 4))
  {
    unint64_t v5 = 0;
    do
      std::string::push_back(a3, *(unsigned char *)(*(void *)(a2 + 8) + v5++));
    while (v5 < *(unsigned int *)(a2 + 4));
  }
  return 1;
}

uint64_t ASN1Item::getObjectIdentifier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  memset(v25, 0, sizeof(v25));
  long long v24 = 0u;
  long long v23 = 0u;
  long long v22 = 0u;
  long long v21 = 0u;
  long long v20 = 0u;
  long long v19 = 0u;
  uint64_t v3 = *(unsigned char **)(a2 + 8);
  char __dst = 0;
  if (*(_DWORD *)(a2 + 4))
  {
    int v17 = 0;
    *(void *)__CFStringRef str = 0;
    unsigned int v6 = snprintf(__str, 0xCuLL, "%d.%d", *v3 / 0x28u, *v3 % 0x28u);
    p_dst = &__dst;
    if (v6 > 0x7F)
    {
      uint64_t v9 = 127;
    }
    else
    {
      unsigned int v8 = v6;
      strcpy(&__dst, __str);
      p_dst = &__dst + v8;
      uint64_t v9 = 127 - v8;
    }
    unint64_t v10 = *(unsigned int *)(a2 + 4);
    if (v10 >= 2)
    {
      int v11 = 0;
      for (unint64_t i = 1; i < v10; ++i)
      {
        if ((v3[i] & 0x80) != 0)
        {
          int v11 = v3[i] & 0x7F | (v11 << 7);
        }
        else
        {
          int v13 = snprintf(__str, 0xCuLL, ".%d", v3[i] & 0x7F | (v11 << 7));
          if (v9 >= (unint64_t)v13)
          {
            uint64_t v14 = v13;
            strcpy(p_dst, __str);
            p_dst += v14;
            v9 -= v14;
          }
          if (v9 < 1) {
            break;
          }
          int v11 = 0;
          unint64_t v10 = *(unsigned int *)(a2 + 4);
        }
      }
    }
    MEMORY[0x18C11BE10](a3, &__dst);
  }
  return 1;
}

BOOL ASN1Item::getDate(int a1, uint64_t a2, std::string *this)
{
  unsigned int v3 = *(_DWORD *)(a2 + 4);
  if (v3 >= 0xD)
  {
    std::string::push_back(this, **(unsigned char **)(a2 + 8));
    std::string::push_back(this, *(unsigned char *)(*(void *)(a2 + 8) + 1));
    std::string::push_back(this, 47);
    std::string::push_back(this, *(unsigned char *)(*(void *)(a2 + 8) + 2));
    std::string::push_back(this, *(unsigned char *)(*(void *)(a2 + 8) + 3));
    std::string::push_back(this, 47);
    std::string::push_back(this, *(unsigned char *)(*(void *)(a2 + 8) + 4));
    std::string::push_back(this, *(unsigned char *)(*(void *)(a2 + 8) + 5));
    std::string::push_back(this, 32);
    std::string::push_back(this, *(unsigned char *)(*(void *)(a2 + 8) + 6));
    std::string::push_back(this, *(unsigned char *)(*(void *)(a2 + 8) + 7));
    std::string::push_back(this, 58);
    std::string::push_back(this, *(unsigned char *)(*(void *)(a2 + 8) + 8));
    std::string::push_back(this, *(unsigned char *)(*(void *)(a2 + 8) + 9));
    std::string::push_back(this, 58);
    std::string::push_back(this, *(unsigned char *)(*(void *)(a2 + 8) + 10));
    std::string::push_back(this, *(unsigned char *)(*(void *)(a2 + 8) + 11));
    std::string::push_back(this, 32);
    std::string::push_back(this, *(unsigned char *)(*(void *)(a2 + 8) + 12));
  }
  return v3 > 0xC;
}

void _SES_Signature::~_SES_Signature(_SES_Signature *this)
{
  *(void *)this = &unk_1ED4E3020;
  uint64_t v2 = *((void *)this + 3);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  unsigned int v3 = (void *)*((void *)this + 4);
  if (v3) {
    free(v3);
  }
  int v4 = (void *)*((void *)this + 9);
  if (v4) {
    free(v4);
  }
  unint64_t v5 = (void *)*((void *)this + 11);
  if (v5) {
    free(v5);
  }
  if (*((char *)this + 71) < 0) {
    operator delete(*((void **)this + 6));
  }
}

{
  uint64_t vars8;

  _SES_Signature::~_SES_Signature(this);

  JUMPOUT(0x18C11C0E0);
}

uint64_t _SES_Signature::parse(_SES_Signature *this, unsigned __int8 *a2, unsigned int a3)
{
  size_t size = 0;
  int __src = 0;
  uint64_t v8 = 0;
  *((void *)this + 1) = a2;
  *((_DWORD *)this + 4) = a3;
  gOffset = (uint64_t)a2;
  int Tag = ASN1Item::readTag((uint64_t)this, a2, a3, (uint64_t)&size);
  uint64_t result = 0;
  if (Tag && BYTE2(size) == 16)
  {
    if (ASN1Item::readTag(0, __src, HIDWORD(size), (uint64_t)&size)) {
      BOOL v5 = BYTE2(size) == 16;
    }
    else {
      BOOL v5 = 0;
    }
    if (v5) {
      operator new();
    }
    return 0;
  }
  return result;
}

void _TBS_Sign::~_TBS_Sign(_TBS_Sign *this)
{
  *(void *)this = &unk_1ED4E6148;
  uint64_t v2 = *((void *)this + 3);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  unsigned int v3 = (void *)*((void *)this + 7);
  if (v3) {
    free(v3);
  }
  uint64_t v4 = *((void *)this + 12);
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  if (*((char *)this + 95) < 0) {
    operator delete(*((void **)this + 9));
  }
  if (*((char *)this + 55) < 0) {
    operator delete(*((void **)this + 4));
  }
}

{
  uint64_t vars8;

  _TBS_Sign::~_TBS_Sign(this);

  JUMPOUT(0x18C11C0E0);
}

uint64_t _TBS_Sign::parse(_TBS_Sign *this, unsigned __int8 *a2, unsigned int a3)
{
  size[0] = 0;
  size[1] = 0;
  uint64_t v11 = 0;
  *((void *)this + 1) = a2;
  *((_DWORD *)this + 4) = a3;
  int Tag = ASN1Item::readTag((uint64_t)this, a2, a3, (uint64_t)size);
  uint64_t result = 0;
  if (Tag && BYTE2(size[0]) == 2)
  {
    uint64_t Integer = ASN1Item::getInteger(0, (uint64_t)size, (int *)this + 5);
    if (a3 < v11)
    {
      return 0;
    }
    else
    {
      int v9 = ASN1Item::readTag(Integer, &a2[v11], a3 - v11, (uint64_t)size);
      uint64_t result = 0;
      if (v9)
      {
        if (BYTE2(size[0]) == 16) {
          operator new();
        }
      }
    }
  }
  return result;
}

void _SESeal::~_SESeal(_SESeal *this)
{
  *(void *)this = &unk_1ED4E5B50;
  uint64_t v2 = *((void *)this + 3);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  unsigned int v3 = (void *)*((void *)this + 4);
  if (v3) {
    free(v3);
  }
  uint64_t v4 = (void *)*((void *)this + 9);
  if (v4) {
    free(v4);
  }
  if (*((char *)this + 71) < 0) {
    operator delete(*((void **)this + 6));
  }
}

{
  uint64_t vars8;

  _SESeal::~_SESeal(this);

  JUMPOUT(0x18C11C0E0);
}

uint64_t _SESeal::parse(_SESeal *this, unsigned __int8 *a2, unsigned int a3)
{
  memset(size, 0, sizeof(size));
  *((void *)this + 1) = a2;
  *((_DWORD *)this + 4) = a3;
  int Tag = ASN1Item::readTag((uint64_t)this, a2, a3, (uint64_t)size);
  uint64_t result = 0;
  if (Tag)
  {
    if (BYTE2(size[0]) == 16) {
      operator new();
    }
  }
  return result;
}

void _SES_SealInfo::~_SES_SealInfo(_SES_SealInfo *this)
{
  *(void *)this = &unk_1ED4E0D80;
  uint64_t v2 = *((void *)this + 3);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  uint64_t v3 = *((void *)this + 7);
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  uint64_t v4 = *((void *)this + 8);
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  uint64_t v5 = *((void *)this + 9);
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
  }
  if (*((char *)this + 55) < 0) {
    operator delete(*((void **)this + 4));
  }
}

{
  uint64_t vars8;

  _SES_SealInfo::~_SES_SealInfo(this);

  JUMPOUT(0x18C11C0E0);
}

uint64_t _SES_SealInfo::parse(_SES_SealInfo *this, unsigned __int8 *a2, unsigned int a3)
{
  *(void *)uint64_t v5 = 0;
  unsigned int v6 = 0;
  uint64_t v7 = 0;
  *((void *)this + 1) = a2;
  *((_DWORD *)this + 4) = a3;
  int Tag = ASN1Item::readTag((uint64_t)this, a2, a3, (uint64_t)v5);
  uint64_t result = 0;
  if (Tag)
  {
    if (BYTE2(v5[0]) == 16) {
      operator new();
    }
  }
  return result;
}

void _SES_Header::~_SES_Header(void **this)
{
  *this = &unk_1ED4DEF18;
  if (*((char *)this + 79) < 0) {
    operator delete(this[7]);
  }
  if (*((char *)this + 47) < 0) {
    operator delete(this[3]);
  }
}

{
  uint64_t vars8;

  _SES_Header::~_SES_Header(this);

  JUMPOUT(0x18C11C0E0);
}

uint64_t _SES_Header::parse(_SES_Header *this, unsigned __int8 *a2, unsigned int a3)
{
  v15[0] = 0;
  v15[1] = 0;
  uint64_t v16 = 0;
  *((void *)this + 1) = a2;
  *((_DWORD *)this + 4) = a3;
  int Tag = ASN1Item::readTag((uint64_t)this, a2, a3, (uint64_t)v15);
  uint64_t result = 0;
  if (Tag && BYTE2(v15[0]) == 22)
  {
    uint64_t String = ASN1Item::getString(0, (uint64_t)v15, (std::string *)this + 1);
    int v9 = &a2[v16];
    unsigned int v10 = a3 - v16;
    uint64_t v11 = ASN1Item::readTag(String, v9, v10, (uint64_t)v15);
    if (v11) {
      BOOL v12 = BYTE2(v15[0]) == 2;
    }
    else {
      BOOL v12 = 0;
    }
    if (v12)
    {
      uint64_t Integer = ASN1Item::getInteger(v11, (uint64_t)v15, (int *)this + 12);
      int v14 = ASN1Item::readTag(Integer, &v9[v16], v10 - v16, (uint64_t)v15);
      uint64_t result = 0;
      if (v14)
      {
        if (BYTE2(v15[0]) == 22)
        {
          ASN1Item::getString(0, (uint64_t)v15, (std::string *)((char *)this + 56));
          return 1;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void _SES_ESPropertyInfo::~_SES_ESPropertyInfo(_SES_ESPropertyInfo *this)
{
  *(void *)this = &unk_1ED4E4D80;
  uint64_t v2 = *((void *)this + 7);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  if (*((char *)this + 135) < 0) {
    operator delete(*((void **)this + 14));
  }
  if (*((char *)this + 111) < 0) {
    operator delete(*((void **)this + 11));
  }
  if (*((char *)this + 87) < 0) {
    operator delete(*((void **)this + 8));
  }
  if (*((char *)this + 47) < 0) {
    operator delete(*((void **)this + 3));
  }
}

{
  uint64_t vars8;

  _SES_ESPropertyInfo::~_SES_ESPropertyInfo(this);

  JUMPOUT(0x18C11C0E0);
}

uint64_t _SES_ESPropertyInfo::parse(_SES_ESPropertyInfo *this, unsigned __int8 *a2, unsigned int a3)
{
  v30[0] = 0;
  v30[1] = 0;
  uint64_t v31 = 0;
  *((void *)this + 1) = a2;
  *((_DWORD *)this + 4) = a3;
  int Tag = ASN1Item::readTag((uint64_t)this, a2, a3, (uint64_t)v30);
  uint64_t result = 0;
  if (Tag && BYTE2(v30[0]) == 2)
  {
    uint64_t Integer = ASN1Item::getInteger(0, (uint64_t)v30, (int *)this + 5);
    int v9 = &a2[v31];
    int v10 = a3 - v31;
    uint64_t v11 = ASN1Item::readTag(Integer, v9, a3 - v31, (uint64_t)v30);
    if (v11) {
      BOOL v12 = BYTE2(v30[0]) == 12;
    }
    else {
      BOOL v12 = 0;
    }
    if (v12)
    {
      uint64_t String = ASN1Item::getString(v11, (uint64_t)v30, (std::string *)this + 1);
      int v14 = &v9[v31];
      int v15 = v10 - v31;
      int v16 = ASN1Item::readTag(String, v14, v10 - (int)v31, (uint64_t)v30);
      uint64_t result = 0;
      if (v16)
      {
        if (BYTE2(v30[0]) == 2)
        {
          uint64_t v17 = ASN1Item::getInteger(0, (uint64_t)v30, (int *)this + 12);
          double v18 = &v14[v31];
          unsigned int v19 = v15 - v31;
          int v20 = ASN1Item::readTag(v17, v18, v19, (uint64_t)v30);
          uint64_t result = 0;
          if (v20)
          {
            if (BYTE2(v30[0]) == 16)
            {
              long long v21 = &v18[v31];
              unsigned int v22 = v19 - v31;
              int v23 = ASN1Item::readTag(0, v21, v22, (uint64_t)v30);
              uint64_t result = 0;
              if (v23)
              {
                if (BYTE2(v30[0]) == 24)
                {
                  BOOL Date = ASN1Item::getDate(0, (uint64_t)v30, (std::string *)((char *)this + 64));
                  uint64_t v25 = &v21[v31];
                  unsigned int v26 = v22 - v31;
                  int v27 = ASN1Item::readTag(Date, v25, v26, (uint64_t)v30);
                  uint64_t result = 0;
                  if (v27)
                  {
                    if (BYTE2(v30[0]) == 24)
                    {
                      BOOL v28 = ASN1Item::getDate(0, (uint64_t)v30, (std::string *)((char *)this + 88));
                      int v29 = ASN1Item::readTag(v28, &v25[v31], v26 - v31, (uint64_t)v30);
                      uint64_t result = 0;
                      if (v29)
                      {
                        if (BYTE2(v30[0]) == 24)
                        {
                          ASN1Item::getDate(0, (uint64_t)v30, (std::string *)((char *)this + 112));
                          return 1;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void _SES_ESPictureInfo::~_SES_ESPictureInfo(_SES_ESPictureInfo *this)
{
  *(void *)this = &unk_1ED4E4908;
  uint64_t v2 = (void *)*((void *)this + 6);
  if (v2) {
    free(v2);
  }
  if (*((char *)this + 47) < 0) {
    operator delete(*((void **)this + 3));
  }
}

{
  uint64_t vars8;

  _SES_ESPictureInfo::~_SES_ESPictureInfo(this);

  JUMPOUT(0x18C11C0E0);
}

uint64_t _SES_ESPictureInfo::parse(_SES_ESPictureInfo *this, unsigned __int8 *a2, unsigned int a3)
{
  size_t size = 0;
  int __src = 0;
  uint64_t v22 = 0;
  *((void *)this + 1) = a2;
  *((_DWORD *)this + 4) = a3;
  int Tag = ASN1Item::readTag((uint64_t)this, a2, a3, (uint64_t)&size);
  uint64_t result = 0;
  if (Tag && BYTE2(size) == 22)
  {
    uint64_t String = ASN1Item::getString(0, (uint64_t)&size, (std::string *)this + 1);
    int v9 = &a2[v22];
    unsigned int v10 = a3 - v22;
    if (ASN1Item::readTag(String, v9, v10, (uint64_t)&size)) {
      BOOL v11 = BYTE2(size) == 4;
    }
    else {
      BOOL v11 = 0;
    }
    if (v11)
    {
      size_t v12 = HIDWORD(size);
      int v13 = malloc_type_malloc(HIDWORD(size), 0x4B106C32uLL);
      *((void *)this + 6) = v13;
      int v14 = memcpy(v13, __src, v12);
      *((_DWORD *)this + 14) = v12;
      int v15 = &v9[v22];
      unsigned int v16 = v10 - v22;
      int v17 = ASN1Item::readTag((uint64_t)v14, v15, v16, (uint64_t)&size);
      uint64_t result = 0;
      if (v17)
      {
        if (BYTE2(size) == 2)
        {
          uint64_t Integer = ASN1Item::getInteger(0, (uint64_t)&size, (int *)this + 15);
          int v19 = ASN1Item::readTag(Integer, &v15[v22], v16 - v22, (uint64_t)&size);
          uint64_t result = 0;
          if (v19)
          {
            if (BYTE2(size) == 2)
            {
              ASN1Item::getInteger(0, (uint64_t)&size, (int *)this + 16);
              return 1;
            }
          }
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

CFDataRef _SES_ESPictureInfo::copyPictureData(uint64_t a1, std::string *a2)
{
  uint64_t v3 = *(const UInt8 **)(a1 + 48);
  if (!v3) {
    return 0;
  }
  CFDataRef v5 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v3, *(unsigned int *)(a1 + 56));
  std::string::operator=(a2, (const std::string *)(a1 + 24));
  return v5;
}

void _SES_Signature_v1::~_SES_Signature_v1(_SES_Signature_v1 *this)
{
  *(void *)this = &unk_1ED4E4420;
  uint64_t v2 = *((void *)this + 3);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  uint64_t v3 = (void *)*((void *)this + 4);
  if (v3) {
    free(v3);
  }
}

{
  uint64_t vars8;

  _SES_Signature_v1::~_SES_Signature_v1(this);

  JUMPOUT(0x18C11C0E0);
}

uint64_t _SES_Signature_v1::parse(_SES_Signature_v1 *this, unsigned __int8 *a2, unsigned int a3)
{
  *(void *)unsigned int v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  *((void *)this + 1) = a2;
  *((_DWORD *)this + 4) = a3;
  unsigned int v3 = a3 - 4;
  if (a3 >= 4)
  {
    gOffset = (uint64_t)a2;
    uint64_t Tag = ASN1Item::readTag((uint64_t)this, a2, a3, (uint64_t)v6);
    if (Tag)
    {
      if (BYTE2(v6[0]) == 16
        && ASN1Item::readTag(Tag, v7, v6[1], (uint64_t)v6)
        && BYTE2(v6[0]) == 16
        && v3 >= v8)
      {
        operator new();
      }
    }
  }
  return 0;
}

void _TBS_Sign_v1::~_TBS_Sign_v1(_TBS_Sign_v1 *this)
{
  *(void *)this = &unk_1ED4DF428;
  uint64_t v2 = *((void *)this + 3);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  unsigned int v3 = (void *)*((void *)this + 4);
  if (v3) {
    free(v3);
  }
  uint64_t v4 = (void *)*((void *)this + 6);
  if (v4) {
    free(v4);
  }
  CFDataRef v5 = (void *)*((void *)this + 11);
  if (v5) {
    free(v5);
  }
  if (*((char *)this + 127) < 0) {
    operator delete(*((void **)this + 13));
  }
  if (*((char *)this + 87) < 0) {
    operator delete(*((void **)this + 8));
  }
}

{
  uint64_t vars8;

  _TBS_Sign_v1::~_TBS_Sign_v1(this);

  JUMPOUT(0x18C11C0E0);
}

uint64_t _TBS_Sign_v1::parse(_TBS_Sign_v1 *this, unsigned __int8 *a2, unsigned int a3)
{
  *(void *)int v9 = 0;
  unsigned int v10 = 0;
  uint64_t v11 = 0;
  *((void *)this + 1) = a2;
  *((_DWORD *)this + 4) = a3;
  uint64_t Tag = ASN1Item::readTag((uint64_t)this, a2, a3, (uint64_t)v9);
  if (Tag)
  {
    if (BYTE2(v9[0]) == 2)
    {
      uint64_t Integer = ASN1Item::getInteger(Tag, (uint64_t)v9, (int *)this + 5);
      if (a3 >= v11
        && ASN1Item::readTag(Integer, &a2[v11], a3 - v11, (uint64_t)v9)
        && BYTE2(v9[0]) == 16)
      {
        operator new();
      }
    }
  }
  return 0;
}

void _SESeal_v1::~_SESeal_v1(_SESeal_v1 *this)
{
  *(void *)this = &unk_1ED4DE600;
  uint64_t v2 = *((void *)this + 3);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  uint64_t v3 = *((void *)this + 4);
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
}

{
  uint64_t vars8;

  _SESeal_v1::~_SESeal_v1(this);

  JUMPOUT(0x18C11C0E0);
}

uint64_t _SESeal_v1::parse(_SESeal_v1 *this, unsigned __int8 *a2, unsigned int a3)
{
  *(void *)uint64_t v4 = 0;
  CFDataRef v5 = 0;
  uint64_t v6 = 0;
  *((void *)this + 1) = a2;
  *((_DWORD *)this + 4) = a3;
  if (ASN1Item::readTag((uint64_t)this, a2, a3, (uint64_t)v4) && BYTE2(v4[0]) == 16) {
    operator new();
  }
  return 0;
}

void _SES_SealInfo_v1::~_SES_SealInfo_v1(_SES_SealInfo_v1 *this)
{
  *(void *)this = &unk_1ED4E3FA8;
  uint64_t v2 = *((void *)this + 3);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  uint64_t v3 = *((void *)this + 7);
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  uint64_t v4 = *((void *)this + 8);
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  uint64_t v5 = *((void *)this + 9);
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
  }
  if (*((char *)this + 55) < 0) {
    operator delete(*((void **)this + 4));
  }
}

{
  uint64_t vars8;

  _SES_SealInfo_v1::~_SES_SealInfo_v1(this);

  JUMPOUT(0x18C11C0E0);
}

uint64_t _SES_SealInfo_v1::parse(_SES_SealInfo_v1 *this, unsigned __int8 *a2, unsigned int a3)
{
  *(void *)uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  *((void *)this + 1) = a2;
  *((_DWORD *)this + 4) = a3;
  int Tag = ASN1Item::readTag((uint64_t)this, a2, a3, (uint64_t)v5);
  uint64_t result = 0;
  if (Tag)
  {
    if (BYTE2(v5[0]) == 16) {
      operator new();
    }
  }
  return result;
}

void _SES_ESPropertyInfo_v1::~_SES_ESPropertyInfo_v1(_SES_ESPropertyInfo_v1 *this)
{
  *(void *)this = &unk_1ED4E54B0;
  uint64_t v2 = *((void *)this + 6);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  if (*((char *)this + 127) < 0) {
    operator delete(*((void **)this + 13));
  }
  if (*((char *)this + 103) < 0) {
    operator delete(*((void **)this + 10));
  }
  if (*((char *)this + 79) < 0) {
    operator delete(*((void **)this + 7));
  }
  if (*((char *)this + 47) < 0) {
    operator delete(*((void **)this + 3));
  }
}

{
  uint64_t vars8;

  _SES_ESPropertyInfo_v1::~_SES_ESPropertyInfo_v1(this);

  JUMPOUT(0x18C11C0E0);
}

uint64_t _SES_ESPropertyInfo_v1::parse(_SES_ESPropertyInfo_v1 *this, unsigned __int8 *a2, unsigned int a3)
{
  v26[0] = 0;
  v26[1] = 0;
  uint64_t v27 = 0;
  *((void *)this + 1) = a2;
  *((_DWORD *)this + 4) = a3;
  int Tag = ASN1Item::readTag((uint64_t)this, a2, a3, (uint64_t)v26);
  uint64_t result = 0;
  if (Tag && BYTE2(v26[0]) == 2)
  {
    uint64_t Integer = ASN1Item::getInteger(0, (uint64_t)v26, (int *)this + 5);
    int v9 = &a2[v27];
    unsigned int v10 = a3 - v27;
    uint64_t v11 = ASN1Item::readTag(Integer, v9, v10, (uint64_t)v26);
    if (v11) {
      BOOL v12 = BYTE2(v26[0]) == 12;
    }
    else {
      BOOL v12 = 0;
    }
    if (v12)
    {
      uint64_t String = ASN1Item::getString(v11, (uint64_t)v26, (std::string *)this + 1);
      int v14 = &v9[v27];
      int v15 = v10 - v27;
      int v16 = ASN1Item::readTag(String, v14, v10 - v27, (uint64_t)v26);
      uint64_t result = 0;
      if (v16)
      {
        if (BYTE2(v26[0]) == 16)
        {
          int v17 = &v14[v27];
          int v18 = v15 - v27;
          int v19 = ASN1Item::readTag(0, v17, v15 - (int)v27, (uint64_t)v26);
          uint64_t result = 0;
          if (v19)
          {
            if (BYTE2(v26[0]) == 23)
            {
              BOOL Date = ASN1Item::getDate(0, (uint64_t)v26, (std::string *)((char *)this + 56));
              long long v21 = &v17[v27];
              unsigned int v22 = v18 - v27;
              int v23 = ASN1Item::readTag(Date, v21, v22, (uint64_t)v26);
              uint64_t result = 0;
              if (v23)
              {
                if (BYTE2(v26[0]) == 23)
                {
                  BOOL v24 = ASN1Item::getDate(0, (uint64_t)v26, (std::string *)((char *)this + 80));
                  int v25 = ASN1Item::readTag(v24, &v21[v27], v22 - v27, (uint64_t)v26);
                  uint64_t result = 0;
                  if (v25)
                  {
                    if (BYTE2(v26[0]) == 23)
                    {
                      ASN1Item::getDate(0, (uint64_t)v26, (std::string *)((char *)this + 104));
                      return 1;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void _SES_SignInfo_v1::~_SES_SignInfo_v1(_SES_SignInfo_v1 *this)
{
  *(void *)this = &unk_1ED4E3FD0;
  uint64_t v2 = (void *)*((void *)this + 3);
  if (v2) {
    free(v2);
  }
  uint64_t v3 = (void *)*((void *)this + 8);
  if (v3) {
    free(v3);
  }
  if (*((char *)this + 63) < 0) {
    operator delete(*((void **)this + 5));
  }
}

{
  uint64_t vars8;

  _SES_SignInfo_v1::~_SES_SignInfo_v1(this);

  JUMPOUT(0x18C11C0E0);
}

uint64_t _SES_SignInfo_v1::parse(_SES_SignInfo_v1 *this, unsigned __int8 *a2, unsigned int a3)
{
  size_t size = 0;
  int __src = 0;
  uint64_t v21 = 0;
  *((void *)this + 1) = a2;
  *((_DWORD *)this + 4) = a3;
  int Tag = ASN1Item::readTag((uint64_t)this, a2, a3, (uint64_t)&size);
  uint64_t result = 0;
  if (Tag && BYTE2(size) == 4)
  {
    size_t v8 = HIDWORD(size);
    int v9 = malloc_type_malloc(HIDWORD(size), 0x4B106C32uLL);
    *((void *)this + 3) = v9;
    unsigned int v10 = memcpy(v9, __src, v8);
    *((_DWORD *)this + 8) = v8;
    uint64_t v11 = &a2[v21];
    unsigned int v12 = a3 - v21;
    uint64_t v13 = ASN1Item::readTag((uint64_t)v10, v11, v12, (uint64_t)&size);
    if (v13) {
      BOOL v14 = BYTE2(size) == 6;
    }
    else {
      BOOL v14 = 0;
    }
    if (v14)
    {
      uint64_t ObjectIdentifier = ASN1Item::getObjectIdentifier(v13, (uint64_t)&size, (uint64_t)this + 40);
      int v16 = ASN1Item::readTag(ObjectIdentifier, &v11[v21], v12 - v21, (uint64_t)&size);
      uint64_t result = 0;
      if (v16)
      {
        if (BYTE2(size) == 3)
        {
          size_t v17 = HIDWORD(size);
          int v18 = malloc_type_malloc(HIDWORD(size), 0x46100A1BuLL);
          *((void *)this + 8) = v18;
          memcpy(v18, __src, v17);
          *((_DWORD *)this + 18) = v17;
          return 1;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void ASN1Parser::ASN1Parser(ASN1Parser *this)
{
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *(void *)this = &unk_1ED4DE430;
}

void ASN1Parser::~ASN1Parser(ASN1Parser *this)
{
  *(void *)this = &unk_1ED4DE430;
  uint64_t v2 = *((void *)this + 2);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  uint64_t v3 = *((void *)this + 1);
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
}

{
  uint64_t vars8;

  ASN1Parser::~ASN1Parser(this);

  JUMPOUT(0x18C11C0E0);
}

void ASN1Parser::parseASN1_V4Seal(ASN1Parser *this, const unsigned __int8 *a2)
{
}

void ASN1Parser::parseASN1_V1Seal(ASN1Parser *this, const unsigned __int8 *a2)
{
}

void ASN1Parser::parseASN1(ASN1Parser *this, const unsigned __int8 *a2)
{
}

CFDataRef ASN1Parser::copyImageData(uint64_t a1, std::string *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if ((v2 || (uint64_t v2 = *(void *)(a1 + 16)) != 0)
    && (uint64_t v3 = *(void *)(*(void *)(*(void *)(*(void *)(v2 + 24) + 24) + 24) + 64)) != 0)
  {
    return _SES_ESPictureInfo::copyPictureData(v3, a2);
  }
  else
  {
    return 0;
  }
}

void OFDPathObject::OFDPathObject(OFDPathObject *this, const __CFDictionary *a2)
{
  uint64_t v4 = (void *)OFDObject::OFDObject((uint64_t)this, a2, 1);
  v4[26] = 0;
  uint64_t v5 = v4 + 26;
  *uint64_t v4 = &unk_1ED4E0508;
  v4[27] = 0;
  v4[28] = 0;
  memset(v7, 0, sizeof(v7));
  IIODictionary::IIODictionary((IIODictionary *)v7, a2);
  if (IIODictionary::getCount((IIODictionary *)v7))
  {
    *((double *)this + 24) = IIODictionary::getDoubleForKey((IIODictionary *)v7, @"LineWidth");
    *((double *)this + 25) = IIODictionary::getDoubleForKey((IIODictionary *)v7, @"MiterLimit");
    CFDictionaryRef ObjectForKey = IIODictionary::getObjectForKey((IIODictionary *)v7, @"AbbreviatedData");
    if (ObjectForKey) {
      OFDParsePathOperations(ObjectForKey, v5);
    }
    if (!*((_DWORD *)this + 28))
    {
      *((_DWORD *)this + 28) = 1;
      *((void *)this + 15) = 0;
      *((void *)this + 16) = 0;
      *((void *)this + 17) = 0;
      *((void *)this + 18) = 0x3FF0000000000000;
    }
  }
  IIODictionary::~IIODictionary((IIODictionary *)v7);
}

void sub_188979FF0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  IIODictionary::~IIODictionary((IIODictionary *)va);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _cg_jpeg_mem_term(v2, v4, v5);
  _Unwind_Resume(a1);
}

void OFDPathObject::~OFDPathObject(OFDPathObject *this)
{
  *(void *)this = &unk_1ED4E0508;
  uint64_t v4 = (void **)((char *)this + 208);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v4);
  _cg_jpeg_mem_term(this, v2, v3);
}

{
  uint64_t v2;
  const char *v3;
  __n128 v4;
  void **v5;

  *(void *)this = &unk_1ED4E0508;
  uint64_t v5 = (void **)((char *)this + 208);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v5);
  uint64_t v4 = _cg_jpeg_mem_term(this, v2, v3);
  MEMORY[0x18C11C0E0](v4);
}

void OFDPathObject::drawInContext(OFDPathObject *this, CGContextRef c, CGRect a3, OFDPage *a4)
{
  CGContextSaveGState(c);
  long long v6 = *(_OWORD *)((char *)this + 40);
  *(_OWORD *)&transform.a = *(_OWORD *)((char *)this + 24);
  *(_OWORD *)&transform.c = v6;
  *(_OWORD *)&transform.tCGFloat x = *(_OWORD *)((char *)this + 56);
  CGContextConcatCTM(c, &transform);
  CGContextSetLineWidth(c, *((CGFloat *)this + 24));
  if (*((_DWORD *)this + 28) == 1) {
    CGContextSetRGBStrokeColor(c, *((CGFloat *)this + 15), *((CGFloat *)this + 16), *((CGFloat *)this + 17), 1.0);
  }
  if (*((_DWORD *)this + 38) == 1) {
    CGContextSetRGBFillColor(c, *((CGFloat *)this + 20), *((CGFloat *)this + 21), *((CGFloat *)this + 22), 1.0);
  }
  uint64_t v7 = (double *)MEMORY[0x1E4F1DAD8];
  double v8 = *MEMORY[0x1E4F1DAD8];
  double v9 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  unsigned int v10 = (long long *)*((void *)this + 26);
  while (v10 != *((long long **)this + 27))
  {
    memset(&v61, 0, sizeof(v61));
    if (*((char *)v10 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v61, *(const std::string::value_type **)v10, *((void *)v10 + 1));
    }
    else
    {
      long long v11 = *v10;
      v61.__r_.__value_.__r.__words[2] = *((void *)v10 + 2);
      *(_OWORD *)&v61.__r_.__value_.__l.__data_ = v11;
    }
    if ((v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      unsigned int v12 = &v61;
    }
    else {
      unsigned int v12 = (std::string *)v61.__r_.__value_.__r.__words[0];
    }
    int v13 = v12->__r_.__value_.__s.__data_[0];
    if (v13 <= 75)
    {
      if (v13 == 66)
      {
        double v8 = *v7;
        double v9 = v7[1];
        BOOL v14 = (long long *)((char *)v10 + 24);
        if ((long long *)((char *)v10 + 24) == *((long long **)this + 27))
        {
          _cg_jpeg_mem_term("drawInContext", 129, "*** ERROR: malformed pathObject (%s)\n", "B.cp1x");
          goto LABEL_99;
        }
        std::string::operator=(&v61, (const std::string *)v10 + 1);
        if ((v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          unint64_t v38 = &v61;
        }
        else {
          unint64_t v38 = (std::string *)v61.__r_.__value_.__r.__words[0];
        }
        double v39 = atof((const char *)v38);
        BOOL v14 = v10 + 3;
        if (v10 + 3 == *((long long **)this + 27))
        {
          _cg_jpeg_mem_term("drawInContext", 132, "*** ERROR: malformed pathObject (%s)\n", "B.cp1y");
          goto LABEL_99;
        }
        double v40 = v39;
        std::string::operator=(&v61, (const std::string *)v10 + 2);
        if ((v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          unint64_t v41 = &v61;
        }
        else {
          unint64_t v41 = (std::string *)v61.__r_.__value_.__r.__words[0];
        }
        double v42 = atof((const char *)v41);
        BOOL v14 = (long long *)((char *)v10 + 72);
        if ((long long *)((char *)v10 + 72) == *((long long **)this + 27))
        {
          _cg_jpeg_mem_term("drawInContext", 136, "*** ERROR: malformed pathObject (%s)\n", "B.cp2x");
          goto LABEL_99;
        }
        double v43 = v42;
        std::string::operator=(&v61, (const std::string *)v10 + 3);
        if ((v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          CGRect v44 = &v61;
        }
        else {
          CGRect v44 = (std::string *)v61.__r_.__value_.__r.__words[0];
        }
        double v45 = atof((const char *)v44);
        BOOL v14 = v10 + 6;
        if (v10 + 6 == *((long long **)this + 27))
        {
          _cg_jpeg_mem_term("drawInContext", 139, "*** ERROR: malformed pathObject (%s)\n", "B.cp2y");
          goto LABEL_99;
        }
        double v46 = v45;
        std::string::operator=(&v61, (const std::string *)v10 + 4);
        if ((v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          CGRect v47 = &v61;
        }
        else {
          CGRect v47 = (std::string *)v61.__r_.__value_.__r.__words[0];
        }
        double v48 = atof((const char *)v47);
        BOOL v14 = (long long *)((char *)v10 + 120);
        if ((long long *)((char *)v10 + 120) == *((long long **)this + 27))
        {
          _cg_jpeg_mem_term("drawInContext", 143, "*** ERROR: malformed pathObject (%s)\n", "B.x");
          goto LABEL_99;
        }
        double v49 = v48;
        std::string::operator=(&v61, (const std::string *)v10 + 5);
        if ((v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          int v50 = &v61;
        }
        else {
          int v50 = (std::string *)v61.__r_.__value_.__r.__words[0];
        }
        double v51 = atof((const char *)v50);
        v10 += 9;
        if (v10 == *((long long **)this + 27))
        {
          _cg_jpeg_mem_term("drawInContext", 146, "*** ERROR: malformed pathObject (%s)\n", "B.y");
          goto LABEL_101;
        }
        double v52 = v51;
        std::string::operator=(&v61, (const std::string *)v10);
        double v53 = v8 + v40;
        double v54 = v9 + v43;
        double v55 = v8 + v46;
        double v56 = v9 + v49;
        double v57 = v8 + v52;
        if ((v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          unint64_t v58 = &v61;
        }
        else {
          unint64_t v58 = (std::string *)v61.__r_.__value_.__r.__words[0];
        }
        double v59 = atof((const char *)v58);
        CGContextAddCurveToPoint(c, v53, v54, v55, v56, v57, v9 + v59);
      }
      else if (v13 == 67)
      {
        CGContextClosePath(c);
      }
    }
    else
    {
      switch(v13)
      {
        case 'L':
          double v8 = *v7;
          double v9 = v7[1];
          BOOL v14 = (long long *)((char *)v10 + 24);
          if ((long long *)((char *)v10 + 24) == *((long long **)this + 27))
          {
            _cg_jpeg_mem_term("drawInContext", 108, "*** ERROR: malformed pathObject (%s)\n", "L.x");
            goto LABEL_99;
          }
          std::string::operator=(&v61, (const std::string *)v10 + 1);
          if ((v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            int v20 = &v61;
          }
          else {
            int v20 = (std::string *)v61.__r_.__value_.__r.__words[0];
          }
          double v21 = atof((const char *)v20);
          v10 += 3;
          if (v10 == *((long long **)this + 27))
          {
            _cg_jpeg_mem_term("drawInContext", 111, "*** ERROR: malformed pathObject (%s)\n", "L.y");
            goto LABEL_101;
          }
          double v22 = v21;
          std::string::operator=(&v61, (const std::string *)v10);
          if ((v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            int v23 = &v61;
          }
          else {
            int v23 = (std::string *)v61.__r_.__value_.__r.__words[0];
          }
          double v8 = v8 + v22;
          double v9 = v9 + atof((const char *)v23);
          CGContextAddLineToPoint(c, v8, v9);
          break;
        case 'Q':
          BOOL v14 = (long long *)((char *)v10 + 24);
          if ((long long *)((char *)v10 + 24) == *((long long **)this + 27))
          {
            _cg_jpeg_mem_term("drawInContext", 161, "*** ERROR: malformed pathObject (%s)\n", "Q.cp1x");
            goto LABEL_99;
          }
          std::string::operator=(&v61, (const std::string *)v10 + 1);
          if ((v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            BOOL v24 = &v61;
          }
          else {
            BOOL v24 = (std::string *)v61.__r_.__value_.__r.__words[0];
          }
          double v25 = atof((const char *)v24);
          BOOL v14 = v10 + 3;
          if (v10 + 3 == *((long long **)this + 27))
          {
            _cg_jpeg_mem_term("drawInContext", 164, "*** ERROR: malformed pathObject (%s)\n", "Q.cp1y");
            goto LABEL_99;
          }
          double v26 = v25;
          std::string::operator=(&v61, (const std::string *)v10 + 2);
          if ((v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            uint64_t v27 = &v61;
          }
          else {
            uint64_t v27 = (std::string *)v61.__r_.__value_.__r.__words[0];
          }
          double v28 = atof((const char *)v27);
          BOOL v14 = (long long *)((char *)v10 + 72);
          if ((long long *)((char *)v10 + 72) == *((long long **)this + 27))
          {
            _cg_jpeg_mem_term("drawInContext", 168, "*** ERROR: malformed pathObject (%s)\n", "Q.cp2x");
            goto LABEL_99;
          }
          double v29 = v28;
          std::string::operator=(&v61, (const std::string *)v10 + 3);
          if ((v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            CGFloat v30 = &v61;
          }
          else {
            CGFloat v30 = (std::string *)v61.__r_.__value_.__r.__words[0];
          }
          double v31 = atof((const char *)v30);
          v10 += 6;
          if (v10 == *((long long **)this + 27))
          {
            _cg_jpeg_mem_term("drawInContext", 171, "*** ERROR: malformed pathObject (%s)\n", "Q.cp2y");
            goto LABEL_101;
          }
          double v32 = v31;
          std::string::operator=(&v61, (const std::string *)v10);
          double v33 = v8 + v26;
          double v34 = v9 + v29;
          double v35 = v8 + v32;
          if ((v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            CFRange v36 = &v61;
          }
          else {
            CFRange v36 = (std::string *)v61.__r_.__value_.__r.__words[0];
          }
          double v37 = atof((const char *)v36);
          CGContextAddQuadCurveToPoint(c, v33, v34, v35, v9 + v37);
          break;
        case 'M':
          double v8 = *v7;
          double v9 = v7[1];
          BOOL v14 = (long long *)((char *)v10 + 24);
          if ((long long *)((char *)v10 + 24) == *((long long **)this + 27))
          {
            _cg_jpeg_mem_term("drawInContext", 86, "*** ERROR: malformed pathObject (%s)\n", "M.x");
LABEL_99:
            char v60 = 0;
            unsigned int v10 = v14;
            goto LABEL_81;
          }
          std::string::operator=(&v61, (const std::string *)v10 + 1);
          if ((v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            int v15 = &v61;
          }
          else {
            int v15 = (std::string *)v61.__r_.__value_.__r.__words[0];
          }
          double v16 = atof((const char *)v15);
          v10 += 3;
          if (v10 == *((long long **)this + 27))
          {
            _cg_jpeg_mem_term("drawInContext", 89, "*** ERROR: malformed pathObject (%s)\n", "M.y");
LABEL_101:
            char v60 = 0;
            goto LABEL_81;
          }
          double v17 = v16;
          std::string::operator=(&v61, (const std::string *)v10);
          if ((v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            int v18 = &v61;
          }
          else {
            int v18 = (std::string *)v61.__r_.__value_.__r.__words[0];
          }
          double v19 = atof((const char *)v18);
          CGContextStrokePath(c);
          double v9 = v9 + v19;
          double v8 = v8 + v17;
          CGContextMoveToPoint(c, v8, v9);
          break;
      }
    }
    unsigned int v10 = (long long *)((char *)v10 + 24);
    char v60 = 1;
LABEL_81:
    if (SHIBYTE(v61.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v61.__r_.__value_.__l.__data_);
      if ((v60 & 1) == 0) {
        break;
      }
    }
    else if ((v60 & 1) == 0)
    {
      break;
    }
  }
  if (*((unsigned char *)this + 105)) {
    CGContextFillPath(c);
  }
  if (*((unsigned char *)this + 104)) {
    CGContextStrokePath(c);
  }
  CGContextRestoreGState(c);
}

void sub_18897A844(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

__CFData *_OFDCreatePDFDataFromURL(const __CFURL *a1)
{
  CFStringRef v1 = CFURLCopyFileSystemPath(a1, kCFURLPOSIXPathStyle);
  memset(v28, 0, sizeof(v28));
  IIOString::IIOString((IIOString *)v28, v1);
  OFDLoadExternalSymbols();
  memset(v27, 0, sizeof(v27));
  uint64_t v2 = (const char *)IIOString::utf8String((IIOString *)v28);
  OFDContainer::OFDContainer((OFDContainer *)v27, v2);
  uint64_t v3 = (OFDDocument *)IIOImageSource::count((IIOImageSource *)v27);
  uint64_t v4 = v3;
  if (v3)
  {
    Pageunsigned int Count = OFDDocument::getPageCount(v3);
    Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
    uint64_t v7 = CGDataConsumerCreateWithCFData(Mutable);
    double v8 = CGPDFContextCreate(v7, 0, 0);
    CGDataConsumerRelease(v7);
    if (PageCount)
    {
      unsigned int v9 = 0;
      CFStringRef v10 = (const __CFString *)*MEMORY[0x1E4F1DDE0];
      do
      {
        PageAtIndeCGFloat x = (OFDPage *)OFDDocument::getPageAtIndex(v4, v9);
        unsigned int v12 = PageAtIndex;
        if (PageAtIndex)
        {
          OFDPage::open(PageAtIndex);
          uint64_t v24 = 0;
          CFDictionaryRef pageInfo = 0;
          uint64_t v26 = 0;
          IIODictionary::IIODictionary((IIODictionary *)&v24);
          bytes.origin.CGFloat x = OFDPage::physicalBox(v12);
          bytes.origin.CGFloat y = v13;
          CGFloat v15 = v14 * 2.54;
          bytes.size.CGFloat width = v16 * 2.54;
          bytes.size.CGFloat height = v14 * 2.54;
          CFDataRef v17 = CFDataCreate(0, (const UInt8 *)&bytes, 32);
          IIODictionary::setObjectForKey((IIODictionary *)&v24, v17, v10);
          CGPDFContextBeginPage(v8, pageInfo);
          CGContextTranslateCTM(v8, 0.0, v15);
          CGContextScaleCTM(v8, 2.54, -2.54);
          CGContextSetGrayFillColor(v8, 1.0, 1.0);
          CGContextFillRect(v8, bytes);
          OFDPage::drawInContext(v12, v8, bytes);
          CGPDFContextEndPage(v8);
          _cg_jpeg_mem_term(v12, v18, v19);
          IIODictionary::~IIODictionary((IIODictionary *)&v24);
        }
        ++v9;
      }
      while (PageCount != v9);
    }
    CGPDFContextClose(v8);
    _cg_jpeg_mem_term(v27, v20, v21);
    CFRelease(v8);
  }
  else
  {
    Mutable = 0;
  }
  OFDContainer::~OFDContainer((OFDContainer *)v27);
  IIOString::~IIOString((IIOString *)v28);
  return Mutable;
}

void sub_18897AA84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  OFDContainer::~OFDContainer((OFDContainer *)va);
  IIOString::~IIOString((IIOString *)va1);
  _Unwind_Resume(a1);
}

void xdr::CubeTexture::cubeSize()
{
  __assert_rtn("cubeSize", "HDRImageConverter_SIMD.mm", 461, "N * N * N == count");
}

void kd_roi_level_node::pull()
{
  __assert_rtn("pull", "roi.cpp", 70, "active && (width == cols) && (remaining_rows > 0)");
}

void kd_roi_level::advance()
{
  __assert_rtn("advance", "roi.cpp", 292, "source != NULL");
}

{
  __assert_rtn("advance", "roi.cpp", 330, "r >= first_buffer_idx");
}

{
  __assert_rtn("advance", "roi.cpp", 348, "node != NULL");
}

{
  __assert_rtn("advance", "roi.cpp", 360, "node != NULL");
}

{
  __assert_rtn("advance", "roi.cpp", 306, "(max_row+1-min_row) <= num_row_buffers");
}

{
  __assert_rtn("advance", "roi.cpp", 294, "next_row_loc < lim.y");
}

void kd_roi_level_node::advance()
{
}

void kd_roi_level::notify_release()
{
}

void kdu_roi_level::create(kd_roi_level *a1)
{
  kd_roi_level::~kd_roi_level(a1);

  JUMPOUT(0x18C11C0E0);
}

void kdu_roi_level::acquire_node()
{
  __assert_rtn("acquire_node", "roi.cpp", 179, "(child_idx >= 0) && (child_idx < 4)");
}

{
  __assert_rtn("acquire", "roi_local.h", 69, "available");
}

void kd_precinct_pointer_server::initialize()
{
  __assert_rtn("initialize", "compressed_local.h", 1052, "this->buf_server == NULL");
}

void kd_buf_server::augment_structure_bytes()
{
  __assert_rtn("augment_structure_bytes", "compressed_local.h", 247, "structure_bytes >= 0");
}

void kd_tile::adjust_unloadability()
{
}

void kd_precinct::desequence_packet()
{
}

void kd_compressed_input::get_offset()
{
}

void kdu_output::put()
{
}

void kdu_thread_entity::acquire_lock()
{
  __assert_rtn("acquire_lock", "kdu_threads.h", 896, "(lock_id>=0) && (lock_id<num_locks) && (lock->holder != this)");
}

void kdu_thread_entity::release_lock()
{
  __assert_rtn("release_lock", "kdu_threads.h", 935, "(lock_id>=0) && (lock_id<num_locks) && (lock->holder == this)");
}

void kd_precinct::release()
{
  __assert_rtn("release", "compressed_local.h", 3779, "resolution->codestream->in != NULL");
}

{
  __assert_rtn("release", "compressed_local.h", 4261, "(state != 0) && !(state & 1)");
}

void kd_precinct::load_required_packets()
{
  __assert_rtn("load_required_packets", "compressed_local.h", 3846, "desequenced && (next_layer_idx >= required_layers)");
}

void kd_precinct::initialize()
{
  __assert_rtn("set_modes", "compressed_local.h", 3522, "modes == (modes & 0xFF)");
}

void kd_compressed_input::set_suspend()
{
}

void kd_input::putback()
{
}

{
  __assert_rtn("putback", "compressed_local.h", 493, "!throw_markers");
}

{
  __assert_rtn("putback", "compressed_local.h", 492, "!exhausted");
}

void kd_header_out::put_bit()
{
  __assert_rtn("put_bit", "compressed_local.h", 3309, "bit == (bit & 1)");
}

void kdu_thread_queue::find_unassigned_job()
{
  __assert_rtn("find_unassigned_job", "kdu_threads.cpp", 188, "first_runnable_child != NULL");
}

{
  __assert_rtn("find_unassigned_job", "kdu_threads.cpp", 170, "scan->subtree_unassigned_jobs == 0");
}

{
  __assert_rtn("find_unassigned_job", "kdu_threads.cpp", 165, "best_secondary->subtree_unassigned_jobs > 0");
}

void kdu_thread_queue::make_primary_jobs_runnable()
{
  __assert_rtn("make_primary_jobs_runnable", "kdu_threads.cpp", 257, "subtree_primary_jobs == 0");
}

void kdu_thread_queue::make_secondary_job_runnable()
{
  __assert_rtn("make_secondary_job_runnable", "kdu_threads.cpp", 270, "(subtree_unassigned_jobs > 0) && (subtree_secondary_pref != 0) && (subtree_runnable_jobs == 0) && (subtree_primary_jobs == 0)");
}

{
  __assert_rtn("make_secondary_job_runnable", "kdu_threads.cpp", 273, "secondary_pref != 0");
}

{
  __assert_rtn("make_secondary_job_runnable", "kdu_threads.cpp", 310, "best_child != NULL");
}

{
  __assert_rtn("make_secondary_job_runnable", "kdu_threads.cpp", 323, "result != NULL");
}

{
  __assert_rtn("make_secondary_job_runnable", "kdu_threads.cpp", 318, "this->num_unassigned_jobs > (this->num_runnable_jobs+this->num_primary_jobs)");
}

{
  __assert_rtn("make_secondary_job_runnable", "kdu_threads.cpp", 301, "(scan->subtree_runnable_jobs == 0) && (scan->subtree_primary_jobs == 0) && (scan->num_runnable_jobs == 0) && (scan->num_primary_jobs == 0)");
}

void kdu_thread_queue::make_subtree_jobs_runnable()
{
  __assert_rtn("make_subtree_jobs_runnable", "kdu_threads.cpp", 228, "(subtree_runnable_jobs == subtree_unassigned_jobs) && (num_runnable_jobs == num_unassigned_jobs) && (subtree_primary_jobs == 0)");
}

void kdu_thread_queue::install_synchronization_point()
{
}

void kdu_thread_entity::terminate()
{
}

{
  __assert_rtn("terminate", "kdu_threads.cpp", 959, "group->num_deferred_jobs == 0");
}

{
  __assert_rtn("terminate", "kdu_threads.cpp", 949, "this->is_group_owner() && (group->num_finished_threads == 0)");
}

{
  __assert_rtn("terminate", "kdu_threads.cpp", 935, "root->parent->children == root");
}

{
  __assert_rtn("terminate", "kdu_threads.cpp", 932, "root->num_unassigned_jobs == 0");
}

{
  __assert_rtn("terminate", "kdu_threads.cpp", 910, "root->num_unassigned_jobs == root->subtree_unassigned_jobs");
}

void kdu_thread_entity::add_jobs()
{
  __assert_rtn("add_jobs", "kdu_threads.cpp", 669, "(delta_primary_jobs >= 0) && (num_jobs >= 0)");
}

{
  __assert_rtn("add_jobs", "kdu_threads.cpp", 688, "delta_secondary_jobs > 0");
}

{
  __assert_rtn("add_jobs", "kdu_threads.cpp", 766, "(best_thread_idx > 0) && (group->thread_activity[best_thread_idx]==NULL)");
}

{
  __assert_rtn("add_jobs", "kdu_threads.cpp", 714, "(queue->num_runnable_jobs + queue->num_primary_jobs) == queue->num_unassigned_jobs");
}

{
  __assert_rtn("add_jobs", "kdu_threads.cpp", 697, "secondary_seq != 0");
}

{
  __assert_rtn("add_jobs", "kdu_threads.cpp", 653, "num_jobs >= 0");
}

void kdu_thread_entity::synchronize()
{
  __assert_rtn("synchronize", "kdu_threads.cpp", 829, "(root->num_sync_points > 0) && (root->sync_points[0].synchronizing_thread_idx==thread_idx) && root->check_condition(true,thread_idx)");
}

{
  __assert_rtn("synchronize", "kdu_threads.cpp", 821, "(root->num_sync_points == 0) || (root->sync_points[0].synchronizing_thread_idx!=thread_idx)");
}

{
  __assert_rtn("synchronize", "kdu_threads.cpp", 808, "(root->children != NULL) || ((root->num_unassigned_jobs+root->first_unassigned_job_idx)==0)");
}

void kdu_thread_entity::process_jobs()
{
}

{
  __assert_rtn("process_jobs", "kdu_threads.cpp", 1186, "group->thread_activity[thread_idx] != NULL");
}

{
  __assert_rtn("process_jobs", "kdu_threads.cpp", 1210, "run_queue->prescheduled_job_idx >= 0");
}

{
  __assert_rtn("process_jobs", "kdu_threads.cpp", 1241, "group->num_threads > 1");
}

{
  __assert_rtn("process_jobs", "kdu_threads.cpp", 1276, "run_queue->prescheduled_job_idx >= 0");
}

{
  __assert_rtn("process_jobs", "kdu_threads.cpp", 1334, "last_queue->num_active_jobs > 0");
}

{
  __assert_rtn("process_jobs", "kdu_threads.cpp", 1415, "sp->synchronization_downcounter > 0");
}

{
  __assert_rtn("process_jobs", "kdu_threads.cpp", 1435, "last_queue->thread_awaiting_complete != this->thread_idx");
}

{
  __assert_rtn("process_jobs", "kdu_threads.cpp", 1444, "run_queue == NULL");
}

{
  __assert_rtn("check_condition", "threads_local.h", 93, "num_primary_jobs == 0");
}

{
  __assert_rtn("process_jobs", "kdu_threads.cpp", 1419, "sp->num_unsynchronized_children == 0");
}

{
  __assert_rtn("process_jobs", "kdu_threads.cpp", 1396, "last_queue->num_active_jobs == 0");
}

{
  __assert_rtn("process_jobs", "kdu_threads.cpp", 1360, "(last_queue->parent->num_sync_points > 0) && (last_queue->parent->sync_points[0].num_unsynchronized_children>0)");
}

{
  __assert_rtn("process_jobs", "kdu_threads.cpp", 1317, "run_queue->num_active_jobs == 0");
}

{
  __assert_rtn("process_jobs", "kdu_threads.cpp", 1284, "(run_queue->num_unassigned_jobs > 0) && (run_queue->num_runnable_jobs > 0)");
}

{
  __assert_rtn("process_jobs", "kdu_threads.cpp", 1215, "group->num_idle_threads > 0");
}

{
  __assert_rtn("process_jobs", "kdu_threads.cpp", 1200, "run_queue != KD_THREAD_ACTIVE");
}

{
  __assert_rtn("process_jobs", "kdu_threads.cpp", 1153, "(wait_queue->num_sync_points > 0) && (wait_queue->sync_points[0].synchronizing_thread_idx== this->thread_idx)");
}

{
  __assert_rtn("process_jobs", "kdu_threads.cpp", 1096, "(wait_queue != NULL) || !is_group_owner()");
}

void kdu_thread_queue::check_condition()
{
}

void kdu_thread_entity::process_outstanding_sync_points()
{
  __assert_rtn("process_outstanding_sync_points", "kdu_threads.cpp", 1027, "sp->synchronized_worker == NULL");
}

{
  __assert_rtn("process_outstanding_sync_points", "kdu_threads.cpp", 1078, "(parent->num_sync_points > 0) && (parent->sync_points[0].num_unsynchronized_children > 0) && (parent->sync_points[0].synchronization_downcounter == 0)");
}

{
  __assert_rtn("process_outstanding_sync_points", "kdu_threads.cpp", 1049, "n < group->num_threads");
}

void kdu_channel_mapping::set_num_channels()
{
  __assert_rtn("set_num_channels", "kdu_region_decompressor.cpp", 1498, "num >= 0");
}

void kdu_channel_mapping::configure()
{
  __assert_rtn("configure", "kdu_region_decompressor.cpp", 1614, "num_entries <= 1024");
}

{
  __assert_rtn("configure", "kdu_region_decompressor.cpp", 1618, "palette[c] == NULL");
}

void kdu_channel_mapping::add_alpha_to_configuration()
{
  __assert_rtn("add_alpha_to_configuration", "kdu_region_decompressor.cpp", 1713, "num_entries <= 1024");
}

{
  __assert_rtn("add_alpha_to_configuration", "kdu_region_decompressor.cpp", 1717, "palette[c] == NULL");
}

void kdu_region_decompressor::add_component()
{
  __assert_rtn("add_component", "kdu_region_decompressor.cpp", 1822, "(off >= 0) && (off < num_components)");
}

void kdu_region_decompressor::open_tile()
{
  __assert_rtn("open_tile", "kdu_region_decompressor.cpp", 2217, "(full_render_dims & render_dims) == render_dims");
}

{
  __assert_rtn("open_tile", "kdu_region_decompressor.cpp", 2136, "!tile_open");
}

void kdu_line_buf::pre_create()
{
  __assert_rtn("pre_create", "kdu_sample_processing.h", 334, "(!pre_created) && (this->allocator == NULL)");
}

void kdu_sample_allocator::finalize()
{
}

{
  __assert_rtn("finalize", "kdu_sample_processing.h", 185, "(bytes_reserved == 0) || (buffer != NULL)");
}

void kdu_region_decompressor::close_tile()
{
}

void transfer_fixed_point()
{
  __assert_rtn("transfer_fixed_point", "kdu_region_decompressor.cpp", 1135, "num_samples <= src->get_width()");
}

{
  __assert_rtn("transfer_fixed_point", "kdu_region_decompressor.cpp", 1209, "(sp != NULL) && !src->is_absolute()");
}

{
  __assert_rtn("transfer_fixed_point", "kdu_region_decompressor.cpp", 1139, "(sp != NULL) && !src->is_absolute()");
}

{
  __assert_rtn("transfer_fixed_point", "kdu_region_decompressor.cpp", 1289, "num_samples <= src->get_width()");
}

{
  __assert_rtn("transfer_fixed_point", "kdu_region_decompressor.cpp", 1381, "(sp != NULL) && !src->is_absolute()");
}

{
  __assert_rtn("transfer_fixed_point", "kdu_region_decompressor.cpp", 1293, "(sp != NULL) && !src->is_absolute()");
}

void kdu_sample_allocator::pre_alloc()
{
}

void kdu_sample_allocator::alloc16()
{
  __assert_rtn("alloc16", "kdu_sample_processing.h", 206, "bytes_used <= bytes_reserved");
}

{
  __assert_rtn("alloc16", "kdu_sample_processing.h", 201, "!pre_creation_phase");
}

void kdu_sample_allocator::alloc32()
{
  __assert_rtn("alloc32", "kdu_sample_processing.h", 221, "bytes_used <= bytes_reserved");
}

{
  __assert_rtn("alloc32", "kdu_sample_processing.h", 216, "!pre_creation_phase");
}

void kdu_block::set_max_samples()
{
}

void kd_block::start_buffering()
{
  __assert_rtn("start_buffering", "compressed_local.h", 3528, "first_buf == NULL");
}

{
  __assert_rtn("start_buffering", "compressed_local.h", 3531, "first_buf == NULL");
}

void kd_block::put_byte()
{
  __assert_rtn("put_byte", "compressed_local.h", 3535, "current_buf != NULL");
}

{
  __assert_rtn("put_byte", "compressed_local.h", 3542, "current_buf != NULL");
}

void kd_block::retrieve_data()
{
}

{
  __assert_rtn("retrieve_data", "blocks.cpp", 535, "block->num_passes == (int) p_idx");
}

void kd_block::store_data()
{
}

{
  __assert_rtn("store_data", "blocks.cpp", 587, "block->num_passes <= 255");
}

{
  __assert_rtn("store_data", "blocks.cpp", 604, "(val >= 0) && (val < (1<<16))");
}

{
  __assert_rtn("store_data", "blocks.cpp", 609, "total_bytes <= block->max_bytes");
}

{
  __assert_rtn("store_data", "blocks.cpp", 588, "first_buf == NULL");
}

{
  __assert_rtn("store_data", "blocks.cpp", 585, "block->modes == (int) modes");
}

{
  __assert_rtn("store_data", "blocks.cpp", 638, "block->missing_msbs < 255");
}

{
  __assert_rtn("store_data", "blocks.cpp", 639, "block->num_passes <= 255");
}

{
  __assert_rtn("store_data", "blocks.cpp", 656, "(val >= 0) && (val < (1<<16))");
}

{
  __assert_rtn("store_data", "blocks.cpp", 661, "total_bytes <= block->max_bytes");
}

{
  __assert_rtn("store_data", "blocks.cpp", 640, "first_buf == NULL");
}

void kd_block::get_byte()
{
  __assert_rtn("get_byte", "compressed_local.h", 3551, "current_buf != NULL");
}

void kd_block::start_packet()
{
}

void kd_block::write_packet_header()
{
  __assert_rtn("write_packet_header", "blocks.cpp", 850, "(included && (layer_w < 0xFFFF)) || ((!included) && (layer_w == 0xFFFF))");
}

{
  __assert_rtn("write_packet_header", "blocks.cpp", 1044, "total_bytes == (int) temp_length");
}

{
  __assert_rtn("write_packet_header", "blocks.cpp", 1041, "segment_bytes < (1<<length_bits)");
}

{
  __assert_rtn("write_packet_header", "blocks.cpp", 1005, "total_bytes == (int) temp_length");
}

{
  __assert_rtn("write_packet_header", "blocks.cpp", 955, "val == 0");
}

void kd_block::write_body_bytes()
{
  __assert_rtn("write_body_bytes", "blocks.cpp", 1076, "scan != NULL");
}

{
  __assert_rtn("write_body_bytes", "blocks.cpp", 1085, "(xfer_bytes > 0) && (scan != NULL)");
}

void kd_block::build_tree()
{
  __assert_rtn("build_tree", "blocks.cpp", 1107, "total_nodes >= 0");
}

{
  __assert_rtn("build_tree", "blocks.cpp", 1153, "node == (blocks+total_nodes)");
}

{
  __assert_rtn("build_tree", "blocks.cpp", 1148, "(x==0) && (y==0)");
}

void kd_block::save_output_tree()
{
  __assert_rtn("save_output_tree", "blocks.cpp", 1216, "node->current_buf != NULL");
}

void mq_encoder::start()
{
  __assert_rtn("start", "mq_encoder.cpp", 108, "buffer != NULL");
}

{
  __assert_rtn("start", "mq_encoder.cpp", 107, "(prev == NULL) && (next == NULL)");
}

{
  __assert_rtn("start", "mq_encoder.cpp", 106, "buf_start == NULL");
}

{
  __assert_rtn("start", "mq_encoder.cpp", 105, "!active");
}

void mq_encoder::terminate()
{
}

{
  __assert_rtn("terminate", "mq_encoder.cpp", 215, "buf_next == buf_limit");
}

{
  __assert_rtn("terminate", "mq_encoder.cpp", 183, "t==0");
}

{
  __assert_rtn("terminate", "mq_encoder.cpp", 137, "!checked_out");
}

void mq_encoder::transfer_byte()
{
}

void mq_encoder::find_truncation_point()
{
  __assert_rtn("find_truncation_point", "mq_encoder.cpp", 296, "F_min <= 5");
}

{
  __assert_rtn("find_truncation_point", "mq_encoder.cpp", 265, "buf_next < limit");
}

{
  __assert_rtn("find_truncation_point", "mq_encoder.cpp", 232, "!truncation_point_found");
}

{
  __assert_rtn("find_truncation_point", "mq_encoder.cpp", 231, "!active");
}

void mq_encoder::mq_encode()
{
  __assert_rtn("mq_encode", "mq_encoder.cpp", 366, "MQ_segment && active && (!checked_out) && ((symbol==0) || (symbol==KDU_INT32_MIN))");
}

void mq_encoder::mq_encode_run()
{
}

void kd_create_dwt_description()
{
  __assert_rtn("kd_create_dwt_description", "codestream.cpp", 148, "c == num_coeffs");
}

{
  __assert_rtn("kd_create_dwt_description", "codestream.cpp", 144, "0");
}

{
  __assert_rtn("kd_create_dwt_description", "codestream.cpp", 128, "0");
}

{
  __assert_rtn("kd_create_dwt_description", "codestream.cpp", 179, "0");
}

void kd_input::process_unexpected_marker()
{
}

{
  __assert_rtn("process_unexpected_marker", "codestream.cpp", 336, "!exhausted");
}

void kd_input::read()
{
}

void kd_input::ignore()
{
}

void kd_compressed_input::load_buf()
{
  __assert_rtn("load_buf", "codestream.cpp", 496, "(suspend_ptr>=first_unread) && (suspend_ptr<=first_unwritten)");
}

{
  __assert_rtn("load_buf", "codestream.cpp", 495, "alt_first_unwritten == NULL");
}

{
  __assert_rtn("load_buf", "codestream.cpp", 468, "first_unwritten == first_unread");
}

void kd_compressed_input::set_tileheader_scope()
{
  __assert_rtn("set_tileheader_scope", "codestream.cpp", 568, "xfer_bytes >= 0");
}

void kd_compressed_input::seek()
{
}

void kd_buf_server::release()
{
}

void kd_buf_server::get()
{
  __assert_rtn("get", "codestream.cpp", 1757, "num_allocated_pages == total_pages");
}

void kd_pph_input::load_buf()
{
  __assert_rtn("load_buf", "codestream.cpp", 735, "buf_bytes >= 0");
}

{
  __assert_rtn("load_buf", "codestream.cpp", 730, "read_buf != NULL");
}

void kd_marker::read()
{
  __assert_rtn("read", "codestream.cpp", 778, "source != NULL");
}

{
  __assert_rtn("read", "codestream.cpp", 804, "valid_code");
}

void kd_pp_markers::add_marker()
{
  __assert_rtn("add_marker", "codestream.cpp", 973, "elt->get_code() == KDU_PPT");
}

{
  __assert_rtn("add_marker", "codestream.cpp", 968, "(list == NULL) || is_ppm");
}

{
  __assert_rtn("add_marker", "codestream.cpp", 974, "(list == NULL) || !is_ppm");
}

void kd_pp_markers::advance_list()
{
  __assert_rtn("advance_list", "codestream.cpp", 1102, "(list != NULL) && (list->bytes_read == list->get_length())");
}

void kd_tlm_generator::add_tpart_length()
{
  __assert_rtn("add_tpart_length", "codestream.cpp", 1164, "(tnum >= 0) && (tnum < num_tiles)");
}

{
  __assert_rtn("add_tpart_length", "codestream.cpp", 1163, "elt_ctr < num_elts");
}

void kd_tlm_generator::write_dummy_tlms()
{
  __assert_rtn("write_dummy_tlms", "codestream.cpp", 1192, "z_tlm <= 255");
}

{
  __assert_rtn("write_dummy_tlms", "codestream.cpp", 1205, "check_tlm_bytes == tlm_bytes");
}

void kd_tlm_generator::write_tlms()
{
  __assert_rtn("write_tlms", "codestream.cpp", 1233, "z_tlm <= 255");
}

void kd_tpart_pointer_server::add_tlm_marker()
{
  __assert_rtn("add_tlm_marker", "codestream.cpp", 1319, "copy_source.get_code() == KDU_TLM");
}

void kd_tpart_pointer_server::add_tpart()
{
}

void kd_tpart_pointer_server::translate_markers()
{
  __assert_rtn("translate_markers", "codestream.cpp", 1387, "groups == NULL");
}

void kd_precinct_pointer_server::record_byte()
{
  __assert_rtn("record_byte", "compressed_local.h", 1134, "tail != NULL");
}

void kd_thread_buf_server::augment_local_store()
{
  __assert_rtn("augment_local_store", "codestream.cpp", 1892, "env->codestream != NULL");
}

void kd_thread_env::flush()
{
  __assert_rtn("flush", "codestream.cpp", 1984, "num_outstanding_blocks == 0");
}

{
  __assert_rtn("flush", "codestream.cpp", 2071, "num_outstanding_blocks == 0");
}

{
  __assert_rtn("flush", "codestream.cpp", 2047, "precinct->num_outstanding_blocks == 1");
}

{
  __assert_rtn("flush", "codestream.cpp", 2027, "have_complete_precincts");
}

{
  __assert_rtn("flush", "codestream.cpp", 2010, "scan->target_precinct->num_outstanding_blocks > 0");
}

void kdu_thread_entity::try_lock()
{
  __assert_rtn("try_lock", "kdu_threads.h", 924, "(lock_id>=0) && (lock_id<num_locks) && (lock->holder != this)");
}

void kd_global_rescomp::add_ready_precinct()
{
  __assert_rtn("add_ready_precinct", "codestream.cpp", 2825, "(precinct->prev == NULL) && (precinct->next == NULL) && (precinct != first_ready)");
}

void kd_packet_sequencer::init()
{
}

void kd_packet_sequencer::next_progression()
{
  __assert_rtn("next_progression", "codestream.cpp", 2293, "state.poc != NULL");
}

{
  __assert_rtn("next_progression", "codestream.cpp", 2295, "state.poc != NULL");
}

{
  __assert_rtn("next_progression", "codestream.cpp", 2305, "0");
}

void kd_packet_sequencer::restore_state()
{
}

void kd_packet_sequencer::next_in_sequence()
{
}

void kd_packet_sequencer::next_in_lrcp()
{
  __assert_rtn("next_in_lrcp", "codestream.cpp", 2489, "((precinct != NULL) && (precinct->next_layer_idx >= state.layer_idx)) || (state.layer_idx == 0)");
}

void kd_packet_sequencer::next_in_rlcp()
{
  __assert_rtn("next_in_rlcp", "codestream.cpp", 2529, "((precinct != NULL) && (precinct->next_layer_idx >= state.layer_idx)) || (state.layer_idx == 0)");
}

void kd_global_rescomp::notify_tile_status()
{
  __assert_rtn("notify_tile_status", "codestream.cpp", 2812, "(area_covered_by_tiles <= total_area) && (remaining_area >= 0)");
}

void kd_global_rescomp::close_ready_precinct()
{
  __assert_rtn("close_ready_precinct", "codestream.cpp", 2863, "precinct == last_ready");
}

{
  __assert_rtn("close_ready_precinct", "codestream.cpp", 2856, "precinct == first_ready");
}

void kd_codestream_comment::set_text()
{
}

void kd_mct_stage::create_stages()
{
}

{
  __assert_rtn("create_stages", "codestream.cpp", 3114, "0");
}

{
  __assert_rtn("create_stages", "codestream.cpp", 3099, "0");
}

void kd_mct_stage::apply_output_restrictions()
{
  __assert_rtn("apply_output_restrictions", "codestream.cpp", 3396, "global_comp_info != NULL");
}

{
  __assert_rtn("apply_output_restrictions", "codestream.cpp", 3598, "num_required_inputs == 0");
}

{
  __assert_rtn("apply_output_restrictions", "codestream.cpp", 3582, "unset_inputs > 0");
}

{
  __assert_rtn("apply_output_restrictions", "codestream.cpp", 3586, "unset_inputs == 0");
}

{
  __assert_rtn("apply_output_restrictions", "codestream.cpp", 3564, "unset_inputs > 0");
}

{
  __assert_rtn("apply_output_restrictions", "codestream.cpp", 3468, "(oci->apparent_idx >= 0) && (oci->block == block)");
}

{
  __assert_rtn("apply_output_restrictions", "codestream.cpp", 3421, "oci->apparent_idx == comps_of_interest[n]");
}

{
  __assert_rtn("apply_output_restrictions", "codestream.cpp", 3447, "num_apparent_outputs == next_stage->num_required_inputs");
}

{
  __assert_rtn("apply_output_restrictions", "codestream.cpp", 3439, "next_stage->input_required_indices[n]==oci->apparent_idx");
}

{
  __assert_rtn("apply_output_restrictions", "codestream.cpp", 3428, "(global_comp_info == NULL) && (num_outputs == next_stage->num_inputs)");
}

void kd_mct_block::analyze_sensitivity()
{
}

void kd_mct_block::create_rxform_ss_model()
{
  __assert_rtn("create_rxform_ss_model", "codestream.cpp", 3744, "s == N");
}

{
  __assert_rtn("create_rxform_ss_model", "codestream.cpp", 3717, "N==num_outputs");
}

void kd_mct_block::create_dependency_ss_model()
{
  __assert_rtn("create_dependency_ss_model", "codestream.cpp", 3793, "m == (int) model->range_min");
}

{
  __assert_rtn("create_dependency_ss_model", "codestream.cpp", 3773, "N==num_outputs");
}

void kd_mct_block::create_dwt_ss_model()
{
  __assert_rtn("create_dwt_ss_model", "codestream.cpp", 3848, "(range_min >= synth_min) && (range_max <= synth_max)");
}

{
  __assert_rtn("create_dwt_ss_model", "codestream.cpp", 3988, "band_start_idx == num_inputs");
}

{
  __assert_rtn("create_dwt_ss_model", "codestream.cpp", 3852, "range_min == range_max");
}

{
  __assert_rtn("create_dwt_ss_model", "codestream.cpp", 3955, "step_coeffs == dwt_coefficients");
}

{
  __assert_rtn("create_dwt_ss_model", "codestream.cpp", 3871, "range_min == range_max");
}

{
  __assert_rtn("create_dwt_ss_model", "codestream.cpp", 3878, "!((range_min|range_max) & synth_gap)");
}

{
  __assert_rtn("create_dwt_ss_model", "codestream.cpp", 3824, "N==num_outputs");
}

void kd_codestream::construct_common()
{
}

void kd_codestream::read_main_header()
{
  __assert_rtn("read_main_header", "codestream.cpp", 4666, "tile_span == tile_indices.size");
}

void kd_codestream::construct_output_comp_info()
{
}

{
  __assert_rtn("construct_output_comp_info", "codestream.cpp", 4240, "output_comp_info == NULL");
}

void kd_codestream::restrict_to_fragment()
{
  __assert_rtn("restrict_to_fragment", "codestream.cpp", 4367, "out != NULL");
}

{
  __assert_rtn("restrict_to_fragment", "codestream.cpp", 4398, "current_fragment_tiles > 0");
}

{
  __assert_rtn("restrict_to_fragment", "codestream.cpp", 4413, "(idx_min == tile_indices.pos) && (canvas == fragment_region) && initial_fragment && final_fragment");
}

void kd_codestream::restart()
{
  __assert_rtn("restart", "codestream.cpp", 4466, "tile_refs != NULL");
}

{
  __assert_rtn("restart", "codestream.cpp", 4490, "typ->tile_ref == NULL");
}

{
  __assert_rtn("restart", "codestream.cpp", 4475, "tref->tile != KD_EXPIRED_TILE");
}

void kd_codestream::create_tile()
{
  __assert_rtn("create_tile", "codestream.cpp", 4804, "tp == NULL");
}

{
  __assert_rtn("create_tile", "codestream.cpp", 4801, "(rel_idx.x >= 0) && (rel_idx.x < tile_indices.size.x) && (rel_idx.y >= 0) && (rel_idx.y < tile_indices.size.y)");
}

void kd_codestream::simulate_output()
{
}

{
  __assert_rtn("simulate_output", "codestream.cpp", 5015, "!finalize_layer");
}

{
  __assert_rtn("simulate_output", "codestream.cpp", 4991, "slope_threshold < 0xFFFF");
}

{
  __assert_rtn("simulate_output", "codestream.cpp", 4998, "packet_max_bytes >= packet_bytes");
}

{
  __assert_rtn("simulate_output", "codestream.cpp", 5003, "packet_bytes <= packet_max_bytes");
}

{
  __assert_rtn("simulate_output", "codestream.cpp", 4990, "finalize_layer && last_layer && (local_sloppy >= 0)");
}

{
  __assert_rtn("simulate_output", "codestream.cpp", 4946, "T <= (rc->remaining_area + rc->ready_area)");
}

{
  __assert_rtn("simulate_output", "codestream.cpp", 4937, "(rc->remaining_area > 0) && (rc->remaining_area >= rc->ready_area)");
}

void kd_codestream::calculate_min_header_cost()
{
  __assert_rtn("calculate_min_header_cost", "codestream.cpp", 5094, "total_area >= tile_area");
}

{
  __assert_rtn("calculate_min_header_cost", "codestream.cpp", 5078, "(abs_idx.x < tile_span.x) && (abs_idx.y < tile_span.y)");
}

{
  __assert_rtn("calculate_min_header_cost", "codestream.cpp", 5058, "min_fixed_header_size == 0");
}

void kd_codestream::pcrd_opt()
{
}

{
  __assert_rtn("pcrd_opt", "codestream.cpp", 5242, "threshold < (1<<16)");
}

{
  __assert_rtn("pcrd_opt", "codestream.cpp", 5284, "last_layer");
}

{
  __assert_rtn("pcrd_opt", "codestream.cpp", 5200, "last_layer");
}

{
  __assert_rtn("pcrd_opt", "codestream.cpp", 5161, "last_idx == -1");
}

{
  __assert_rtn("pcrd_opt", "codestream.cpp", 5150, "next_idx == (num_sized_layers-1)");
}

void kd_codestream::generate_codestream()
{
  __assert_rtn("generate_codestream", "codestream.cpp", 5298, "out != NULL");
}

{
  __assert_rtn("generate_codestream", "codestream.cpp", 5301, "(layer_sizes != NULL) && (layer_thresholds != NULL)");
}

{
  __assert_rtn("generate_codestream", "codestream.cpp", 5330, "org != NULL");
}

{
  __assert_rtn("generate_codestream", "codestream.cpp", 5371, "header_length == 0");
}

{
  __assert_rtn("generate_codestream", "codestream.cpp", 5368, "header_length == 0");
}

{
  __assert_rtn("generate_codestream", "codestream.cpp", 5329, "!tlm_generator");
}

void kd_codestream::unload_tiles_to_cache_threshold()
{
}

void kdu_codestream::create()
{
  __assert_rtn("create", "codestream.cpp", 5446, "(state == NULL) && (target != NULL)");
}

{
  __assert_rtn("create", "codestream.cpp", 5465, "state == NULL");
}

void kdu_codestream::destroy()
{
  __assert_rtn("destroy", "codestream.cpp", 5640, "state != NULL");
}

void kdu_codestream::set_max_bytes()
{
}

void kdu_codestream::apply_input_restrictions()
{
}

{
  __assert_rtn("apply_input_restrictions", "codestream.cpp", 6021, "0");
}

void kdu_codestream::get_tile_dims()
{
  __assert_rtn("get_tile_dims", "codestream.cpp", 6061, "(tile_idx.x >= 0) && (tile_idx.x < state->tile_span.x) && (tile_idx.y >= 0) && (tile_idx.y < state->tile_span.y)");
}

void kdu_codestream::open_tile()
{
  __assert_rtn("open_tile", "codestream.cpp", 6502, "tp->tile_ref == tref");
}

{
  __assert_rtn("open_tile", "codestream.cpp", 6494, "state->allow_restart && (tref->tpart_head == NULL)");
}

{
  __assert_rtn("open_tile", "codestream.cpp", 6485, "(rel_idx.x >= 0) && (rel_idx.x < state->tile_indices.size.x) && (rel_idx.y >= 0) && (rel_idx.y < state->tile_indices.size.y)");
}

{
  __assert_rtn("open_tile", "codestream.cpp", 6481, "(tile_idx.x >= 0) && (tile_idx.x < state->tile_span.x) && (tile_idx.y >= 0) && (tile_idx.y < state->tile_span.y)");
}

void kdu_codestream::flush()
{
  __assert_rtn("flush", "codestream.cpp", 6561, "(state->out != NULL) && (num_layer_specs > 0)");
}

{
  __assert_rtn("flush", "codestream.cpp", 6569, "(state->layer_thresholds==NULL) && (state->layer_sizes==NULL)");
}

{
  __assert_rtn("flush", "codestream.cpp", 6583, "(state->layer_thresholds!=NULL) && (state->layer_sizes!=NULL)");
}

void kdu_codestream::ready_for_flush()
{
  __assert_rtn("ready_for_flush", "codestream.cpp", 6823, "precinct != NULL");
}

void kdu_kernels::expand_and_convolve()
{
  __assert_rtn("expand_and_convolve", "kernels.cpp", 183, "dst_L <= work_L");
}

{
  __assert_rtn("expand_and_convolve", "kernels.cpp", 182, "(dp == work1) || (dp == work2)");
}

{
  __assert_rtn("expand_and_convolve", "kernels.cpp", 181, "(sp == work1) || (sp == work2)");
}

void kdu_kernels::derive_taps_and_gains()
{
  __assert_rtn("derive_taps_and_gains", "kernels.cpp", 366, "(branch_min[index] >= -work_L) && (branch_max[index] <= work_L)");
}

void kdu_kernels::get_impulse_response()
{
}

void kdu_kernels::get_energy_gain()
{
  __assert_rtn("get_energy_gain", "kernels.cpp", 500, "(num_extra_stages >= 0) && (num_extra_stages <= 3)");
}

{
  __assert_rtn("get_energy_gain", "kernels.cpp", 538, "half_len <= work_L");
}

void kdu_kernels::get_bibo_gain()
{
  __assert_rtn("get_bibo_gain", "kernels.cpp", 565, "(num_extra_stages >= 0) && (num_extra_stages <= 3)");
}

{
  __assert_rtn("get_bibo_gain", "kernels.cpp", 623, "rec->bibo_gain == high_gain");
}

{
  __assert_rtn("get_bibo_gain", "kernels.cpp", 603, "rec->bibo_gain == low_gain");
}

{
  __assert_rtn("get_bibo_gain", "kernels.cpp", 630, "(record_idx == 0) && (rec != NULL)");
}

void jp2_target::open(jp2_target *this, jp2_output_box *a2)
{
}

void jp2_target::open(jp2_target *this)
{
}

void jp2_family_src::open()
{
  __assert_rtn("open", "jp2.cpp", 432, "fp_name == NULL");
}

void jp2_input_box::read_box_header()
{
}

void jp2_input_box::open()
{
  __assert_rtn("open", "jp2.cpp", 747, "target_pos >= 0");
}

void jp2_input_box::open_next()
{
  __assert_rtn("open_next", "jp2.cpp", 903, "locator.bin_id >= 0");
}

void jp2_input_box::is_complete()
{
  __assert_rtn("is_complete", "jp2.cpp", 1017, "(bin_id >= 0) && (bin_class >= 0)");
}

void jp2_input_box::read()
{
}

{
  __assert_rtn("read", "jp2.cpp", 1246, "partial_word_bytes < 4");
}

{
  __assert_rtn("read", "jp2.cpp", 1250, "partial_word_bytes == 4");
}

{
  __assert_rtn("read", "jp2.cpp", 1274, "partial_word_bytes == 2");
}

void jp2_output_box::open()
{
}

{
  __assert_rtn("open", "jp2.cpp", 1389, "(buffer == NULL) && (buffer_size == 0)");
}

{
  __assert_rtn("open", "jp2.cpp", 1430, "super_box->rubber_length && super_box->write_immediately");
}

{
  __assert_rtn("open", "jp2.cpp", 1416, "(buffer == NULL) && (buffer_size == 0)");
}

void jp2_output_box::write_header()
{
  __assert_rtn("write_header", "jp2.cpp", 1461, "(box_type != 0) && ((tgt != NULL) || (super_box != NULL))");
}

{
  __assert_rtn("write_header", "jp2.cpp", 1462, "write_immediately");
}

{
  __assert_rtn("write_header", "jp2.cpp", 1463, "restore_size < 0");
}

{
  __assert_rtn("write_header", "jp2.cpp", 1473, "box_size >= 0");
}

{
  __assert_rtn("write_header", "jp2.cpp", 1467, "!write_header_on_close");
}

void jp2_output_box::set_rubber_length()
{
  __assert_rtn("set_rubber_length", "jp2.cpp", 1510, "box_type != 0");
}

{
  __assert_rtn("set_rubber_length", "jp2.cpp", 1547, "0");
}

void jp2_output_box::set_target_size()
{
  __assert_rtn("set_target_size", "jp2.cpp", 1575, "box_type != 0");
}

{
  __assert_rtn("set_target_size", "jp2.cpp", 1602, "0");
}

void jp2_output_box::write_header_last()
{
}

void jp2_output_box::close()
{
}

{
  __assert_rtn("close", "jp2.cpp", 1716, "0");
}

{
  __assert_rtn("close", "jp2.cpp", 1690, "0");
}

{
  __assert_rtn("close", "jp2.cpp", 1696, "buffer == NULL");
}

void jp2_output_box::end_rewrite()
{
  __assert_rtn("end_rewrite", "jp2.cpp", 1785, "advance >= 0");
}

{
  __assert_rtn("end_rewrite", "jp2.cpp", 1812, "0");
}

{
  __assert_rtn("end_rewrite", "jp2.cpp", 1809, "0");
}

{
  __assert_rtn("end_rewrite", "jp2.cpp", 1804, "0");
}

void jp2_output_box::write()
{
}

{
  __assert_rtn("write", "jp2.cpp", 1856, "0");
}

void jp2_dimensions::init()
{
  __assert_rtn("init", "jp2.cpp", 2133, "state != NULL");
}

{
  __assert_rtn("init", "jp2.cpp", 2137, "num_components > 0");
}

void j2_dimensions::init()
{
  __assert_rtn("init", "jp2.cpp", 1957, "ihdr->get_box_type() == jp2_image_header_4cc");
}

void jp2_dimensions::set_precision()
{
  __assert_rtn("set_precision", "jp2.cpp", 2274, "(state != NULL) && (component_idx >= 0) && (component_idx < state->num_components)");
}

void jp2_dimensions::get_size()
{
  __assert_rtn("get_size", "jp2.cpp", 2296, "state != NULL");
}

void jp2_dimensions::get_bit_depth()
{
  __assert_rtn("get_bit_depth", "jp2.cpp", 2330, "(state != NULL) && (component_idx >= 0) && (component_idx < state->num_components)");
}

void jp2_dimensions::get_signed()
{
  __assert_rtn("get_signed", "jp2.cpp", 2343, "(state != NULL) && (component_idx >= 0) && (component_idx < state->num_components)");
}

void j2_palette::init()
{
  __assert_rtn("init", "jp2.cpp", 2478, "(entry_bytes <= 5) && (entry_bytes > 0)");
}

{
  __assert_rtn("init", "jp2.cpp", 2433, "pclr->get_box_type() == jp2_palette_4cc");
}

void jp2_palette::get_num_entries()
{
  __assert_rtn("get_num_entries", "jp2.cpp", 2674, "state != NULL");
}

void jp2_palette::get_num_luts()
{
  __assert_rtn("get_num_luts", "jp2.cpp", 2685, "state != NULL");
}

void jp2_palette::get_bit_depth()
{
  __assert_rtn("get_bit_depth", "jp2.cpp", 2697, "(state != NULL) && (comp_idx >= 0) && (comp_idx < state->num_components)");
}

void jp2_palette::get_signed()
{
  __assert_rtn("get_signed", "jp2.cpp", 2710, "(state != NULL) && (comp_idx >= 0) && (comp_idx < state->num_components)");
}

void jp2_palette::get_lut()
{
  __assert_rtn("get_lut", "jp2.cpp", 2737, "(state != NULL) && (comp_idx >= 0) && (comp_idx < state->num_components)");
}

void j2_component_map::init()
{
  __assert_rtn("init", "jp2.cpp", 2796, "cmap->get_box_type() == jp2_component_mapping_4cc");
}

void j2_component_map::init_missing_cmap()
{
  __assert_rtn("init_missing_cmap", "jp2.cpp", 2844, "(cmap_channels == NULL) && (num_cmap_channels == 0)");
}

void j2_component_map::finalize()
{
  __assert_rtn("get_num_components", "jp2.cpp", 2307, "state != NULL");
}

{
  __assert_rtn("finalize", "jp2.cpp", 2909, "num_cmap_channels == 0");
}

void j2_component_map::add_cmap_channel()
{
}

{
  __assert_rtn("add_cmap_channel", "jp2.cpp", 2982, "use_cmap_box");
}

void j2_channels::init()
{
}

void j2_channels::finalize()
{
  __assert_rtn("finalize", "jp2.cpp", 3262, "channels->cmap_channel[c] >= 0");
}

void j2_channels::find_cmap_channels()
{
}

{
  __assert_rtn("find_cmap_channels", "jp2.cpp", 3373, "cp->bit_depth > 0");
}

void j2_channels::add_cmap_channels()
{
}

{
  __assert_rtn("add_cmap_channels", "jp2.cpp", 3426, "c == 0");
}

void j2_channels::save_box()
{
}

{
  __assert_rtn("save_box", "jp2.cpp", 3476, "!have_chroma_key");
}

{
  __assert_rtn("save_box", "jp2.cpp", 3452, "chroma_key_buf == NULL");
}

void jp2_channels::init()
{
  __assert_rtn("init", "jp2.cpp", 3646, "state != NULL");
}

void jp2_channels::set_colour_mapping()
{
  __assert_rtn("set_colour_mapping", "jp2.cpp", 3666, "(state != NULL) && (colour_idx >= 0) && (colour_idx < state->num_colours)");
}

void jp2_channels::set_opacity_mapping()
{
  __assert_rtn("set_opacity_mapping", "jp2.cpp", 3683, "(state != NULL) && (colour_idx >= 0) && (colour_idx < state->num_colours)");
}

void jp2_channels::set_premult_mapping()
{
  __assert_rtn("set_premult_mapping", "jp2.cpp", 3700, "(state != NULL) && (colour_idx >= 0) && (colour_idx < state->num_colours)");
}

void jp2_channels::get_num_colours()
{
  __assert_rtn("get_num_colours", "jp2.cpp", 3726, "state != NULL");
}

void jp2_channels::get_opacity_mapping()
{
  __assert_rtn("get_opacity_mapping", "jp2.cpp", 3761, "(state != NULL) && (colour_idx >= 0) && (colour_idx < state->num_colours)");
}

void jp2_channels::get_premult_mapping()
{
  __assert_rtn("get_premult_mapping", "jp2.cpp", 3779, "(state != NULL) && (colour_idx >= 0) && (colour_idx < state->num_colours)");
}

void j2_resolution::init()
{
}

void j2_resolution::parse_sub_box()
{
}

void jp2_resolution::init()
{
  __assert_rtn("init", "jp2.cpp", 4038, "state != NULL");
}

void jp2_resolution::set_resolution()
{
  __assert_rtn("set_resolution", "jp2.cpp", 4060, "(state != NULL) && (state->display_ratio > 0.0F)");
}

void j2_colour::init()
{
  __assert_rtn("init", "jp2.cpp", 4685, "meth == 4");
}

{
  __assert_rtn("init", "jp2.cpp", 4609, "0");
}

{
  __assert_rtn("init", "jp2.cpp", 4607, "colr->get_box_type() == jp2_colour_4cc");
}

void j2_colour::finalize()
{
  __assert_rtn("finalize", "jp2.cpp", 4787, "(space == JP2_CIELab_SPACE) || (space == JP2_CIEJab_SPACE)");
}

void j2_colour::save_box()
{
}

void jp2_colour::init()
{
  __assert_rtn("init", "jp2.cpp", 4924, "state != NULL");
}

{
  __assert_rtn("init", "jp2.cpp", 5016, "state != NULL");
}

void jp2_colour::get_num_colours()
{
  __assert_rtn("get_num_colours", "jp2.cpp", 5408, "state != NULL");
}

void jp2_colour::get_space()
{
  __assert_rtn("get_space", "jp2.cpp", 5419, "state != NULL");
}

void jp2_colour::is_opponent_space()
{
  __assert_rtn("is_opponent_space", "jp2.cpp", 5430, "state != NULL");
}

void jp2_colour::get_precedence()
{
  __assert_rtn("get_precedence", "jp2.cpp", 5451, "state != NULL");
}

void j2_colour_converter::j2_colour_converter()
{
}

{
  __assert_rtn("j2_colour_converter", "jp2.cpp", 5768, "!skip_primary_matrix");
}

void j2_colour_converter::configure_d65_primary_transform()
{
}

{
  __assert_rtn("configure_d65_primary_transform", "jp2.cpp", 5947, "(srgb_curve == NULL) && (tone_curves[0] == NULL) && (tone_curves[1] == NULL) && (tone_curves[2] == NULL)");
}

void j2_colour_converter::configure_lab_transform()
{
}

{
  __assert_rtn("configure_lab_transform", "jp2.cpp", 6174, "srgb_curve == NULL");
}

{
  __assert_rtn("configure_lab_transform", "jp2.cpp", 6152, "tone_curves[0] == NULL");
}

void jp2_colour_converter::convert_lum()
{
  __assert_rtn("convert_lum", "jp2.cpp", 6324, "width <= line.get_width()");
}

{
  __assert_rtn("convert_lum", "jp2.cpp", 6327, "(sp != NULL) && !line.is_absolute()");
}

void jp2_colour_converter::convert_rgb()
{
  __assert_rtn("convert_rgb", "jp2.cpp", 6395, "lut1 != NULL");
}

{
  __assert_rtn("convert_rgb", "jp2.cpp", 6358, "(width <= red.get_width()) && (width <= green.get_width()) && (width <= blue.get_width())");
}

void jp2_colour_converter::convert_rgb4()
{
  __assert_rtn("convert_rgb4", "jp2.cpp", 6496, "(width <= red.get_width()) && (width <= green.get_width()) && (width <= blue.get_width())");
}

void jp2_target::write_header()
{
  __assert_rtn("write_header", "jp2.cpp", 7007, "header != NULL");
}

{
  __assert_rtn("write_header", "jp2.cpp", 7006, "!header_written");
}

void jp2_target::access_dimensions()
{
  __assert_rtn("access_dimensions", "jp2.cpp", 7048, "header != NULL");
}

void jp2_target::access_colour()
{
  __assert_rtn("access_colour", "jp2.cpp", 7059, "header != NULL");
}

void jp2_target::access_channels()
{
  __assert_rtn("access_channels", "jp2.cpp", 7081, "header != NULL");
}

void jp2_target::access_resolution()
{
  __assert_rtn("access_resolution", "jp2.cpp", 7092, "header != NULL");
}

void j2_component_map::verify_channel_query_idx()
{
}

void kd_attribute::describe()
{
  __assert_rtn("describe", "params.cpp", 678, "cp != NULL");
}

void kdu_params::link()
{
  __assert_rtn("link", "params.cpp", 900, "(tile_idx == -1) && (comp_idx == -1)");
}

{
  __assert_rtn("link", "params.cpp", 938, "refs != &dummy_ref");
}

{
  __assert_rtn("link", "params.cpp", 876, "(this->tile_idx == -1) && (this->comp_idx == -1) && (this->inst_idx == 0) && (this->refs == &this->dummy_ref) && (tile_idx < num_tiles) && (comp_idx < num_comps) && (tile_idx >= -1) && (comp_idx >= -1)");
}

void kdu_params::add_dependency()
{
}

void kdu_params::copy_from()
{
  __assert_rtn("copy_from", "params.cpp", 1076, "dst != NULL");
}

{
  __assert_rtn("copy_from", "params.cpp", 1050, "target->tile_idx == target_tile");
}

void kdu_params::access_relation()
{
  __assert_rtn("access_relation", "params.cpp", 1398, "result->num_comps == 0");
}

{
  __assert_rtn("access_relation", "params.cpp", 1335, "tile_idx >= 0");
}

void kdu_params::get()
{
  __assert_rtn("get", "params.cpp", 1519, "(record_idx >= 0) && (field_idx >= 0)");
}

{
  __assert_rtn("get", "params.cpp", 1588, "(record_idx >= 0) && (field_idx >= 0)");
}

{
  __assert_rtn("get", "params.cpp", 1657, "(record_idx >= 0) && (field_idx >= 0)");
}

void kdu_params::set()
{
  __assert_rtn("set", "params.cpp", 1724, "(record_idx >= 0) && (field_idx >= 0)");
}

{
  __assert_rtn("set", "params.cpp", 1799, "(*cp == 'I') || (*cp == 'C')");
}

{
  __assert_rtn("set", "params.cpp", 1806, "(record_idx >= 0) && (record_idx < ap->num_records)");
}

{
  __assert_rtn("set", "params.cpp", 1832, "(record_idx >= 0) && (field_idx >= 0)");
}

{
  __assert_rtn("set", "params.cpp", 1868, "(record_idx >= 0) && (record_idx < ap->num_records)");
}

{
  __assert_rtn("set", "params.cpp", 1894, "(record_idx >= 0) && (field_idx >= 0)");
}

{
  __assert_rtn("set", "params.cpp", 1930, "(record_idx >= 0) && (record_idx < ap->num_records)");
}

void kdu_params::parse_string()
{
}

{
  __assert_rtn("parse_string", "params.cpp", 2117, "next_inst != NULL");
}

void display_options()
{
}

{
  __assert_rtn("display_options", "params.cpp", 252, "*pattern == ')'");
}

{
  __assert_rtn("display_options", "params.cpp", 268, "*pattern == ']'");
}

void kdu_params::textualize_attributes()
{
}

{
  __assert_rtn("textualize_attributes", "params.cpp", 2452, "val == att->ival");
}

{
  __assert_rtn("textualize_attributes", "params.cpp", 2473, "acc == att->ival");
}

void kdu_params::generate_marker_segments()
{
  __assert_rtn("generate_marker_segments", "params.cpp", 2814, "new_bytes >= 4");
}

{
  __assert_rtn("generate_marker_segments", "params.cpp", 2776, "(comp->comp_idx == -1) && (c >= 0)");
}

{
  __assert_rtn("generate_marker_segments", "params.cpp", 2778, "(comp==cluster->refs[ref_idx]) && (comp->comp_idx==c)");
}

void siz_params::copy_with_xforms()
{
  __assert_rtn("copy_with_xforms", "params.cpp", 3280, "(exponent.x >= 0) && (exponent.y >= 0)");
}

void siz_params::write_marker_segment()
{
  __assert_rtn("write_marker_segment", "params.cpp", 3419, "(xto >= 0) && (yto >= 0)");
}

{
  __assert_rtn("write_marker_segment", "params.cpp", 3512, "acc_length == cbd_length");
}

{
  __assert_rtn("write_marker_segment", "params.cpp", 3487, "acc_length == siz_length");
}

{
  __assert_rtn("write_marker_segment", "params.cpp", 3315, "last_marked == NULL");
}

void find_lcm()
{
}

void kdu_read()
{
  __assert_rtn("kdu_read", "kdu_utils.h", 74, "nbytes <= 4");
}

void siz_params::finalize()
{
}

void mct_params::write_marker_segment()
{
  __assert_rtn("write_marker_segment", "params.cpp", 4391, "length == acc_length");
}

void mcc_params::write_marker_segment()
{
  __assert_rtn("write_marker_segment", "params.cpp", 4885, "length == acc_length");
}

void mco_params::copy_with_xforms()
{
  __assert_rtn("copy_with_xforms", "params.cpp", 4964, "mcc != NULL");
}

void mco_params::write_marker_segment()
{
  __assert_rtn("write_marker_segment", "params.cpp", 5161, "length == acc_length");
}

{
  __assert_rtn("write_marker_segment", "params.cpp", 5137, "0");
}

void atk_params::write_marker_segment()
{
  __assert_rtn("write_marker_segment", "params.cpp", 5755, "length == acc_length");
}

void cod_params::write_marker_segment()
{
  __assert_rtn("write_marker_segment", "params.cpp", 6241, "siz != NULL");
}

{
  __assert_rtn("write_marker_segment", "params.cpp", 6401, "length == acc_length");
}

void cod_params::read_marker_segment()
{
  __assert_rtn("read_marker_segment", "params.cpp", 6500, "siz != NULL");
}

void cod_params::finalize()
{
}

{
  __assert_rtn("finalize", "params.cpp", 6837, "siz != NULL");
}

{
  __assert_rtn("finalize", "params.cpp", 6846, "0");
}

{
  __assert_rtn("finalize", "params.cpp", 6817, "!get(Cblk,0,1,val)");
}

{
  __assert_rtn("finalize", "params.cpp", 6756, "0");
}

{
  __assert_rtn("finalize", "params.cpp", 6609, "!get(Calign_blk_last,0,1,val)");
}

void cod_params::derive_decomposition_structure()
{
  __assert_rtn("derive_decomposition_structure", "params.cpp", 6992, "dfs != NULL");
}

void cod_params::validate_dfs_data()
{
}

void cod_params::validate_ads_data()
{
}

void cod_params::textualize_decomp()
{
  __assert_rtn("textualize_decomp", "params.cpp", 7177, "(bp-buf) <= 20");
}

void cod_params::expand_decomp_bands()
{
  __assert_rtn("expand_decomp_bands", "params.cpp", 7426, "num_bands <= 49");
}

void ads_params::finalize()
{
  __assert_rtn("finalize", "params.cpp", 7610, "(n == 0) || cod_params::is_valid_decomp_terminator(val)");
}

void ads_params::write_marker_segment()
{
  __assert_rtn("write_marker_segment", "params.cpp", 7697, "length == acc_length");
}

{
  __assert_rtn("write_marker_segment", "params.cpp", 7631, "(ref->tile_idx < 0) && (ref->inst_idx == this->inst_idx)");
}

void dfs_params::write_marker_segment()
{
  __assert_rtn("write_marker_segment", "params.cpp", 7963, "length == acc_length");
}

void qcd_params::copy_with_xforms()
{
}

{
  __assert_rtn("copy_with_xforms", "params.cpp", 8110, "b_in < num_level_bands");
}

{
  __assert_rtn("copy_with_xforms", "params.cpp", 8090, "0");
}

void qcd_params::write_marker_segment()
{
  __assert_rtn("write_marker_segment", "params.cpp", 8149, "cod != NULL");
}

{
  __assert_rtn("write_marker_segment", "params.cpp", 8252, "siz != NULL");
}

{
  __assert_rtn("write_marker_segment", "params.cpp", 8312, "length == acc_length");
}

{
  __assert_rtn("write_marker_segment", "params.cpp", 8190, "ref_cod != NULL");
}

void qcd_params::read_marker_segment()
{
  __assert_rtn("read_marker_segment", "params.cpp", 8375, "siz != NULL");
}

void qcd_params::finalize()
{
  __assert_rtn("finalize", "params.cpp", 8458, "cod != NULL");
}

{
  __assert_rtn("finalize", "params.cpp", 8460, "cod != NULL");
}

{
  __assert_rtn("finalize", "params.cpp", 8477, "0");
}

{
  __assert_rtn("finalize", "params.cpp", 8603, "0");
}

{
  __assert_rtn("finalize", "params.cpp", 8617, "0");
}

{
  __assert_rtn("finalize", "params.cpp", 8473, "0");
}

{
  __assert_rtn("finalize", "params.cpp", 8466, "0");
}

void rgn_params::write_marker_segment()
{
  __assert_rtn("write_marker_segment", "params.cpp", 8749, "length == acc_length");
}

void poc_params::write_marker_segment()
{
}

{
  __assert_rtn("write_marker_segment", "params.cpp", 9040, "length == acc_length");
}

{
  __assert_rtn("write_marker_segment", "params.cpp", 8932, "(ref->tile_idx < 0) && (inst_idx == 0)");
}

void poc_params::read_marker_segment()
{
}

void crg_params::copy_with_xforms()
{
  __assert_rtn("copy_with_xforms", "params.cpp", 9156, "(source_siz != NULL) && (target_siz != NULL)");
}

{
  __assert_rtn("copy_with_xforms", "params.cpp", 9173, "(fact_x > 0) && (fact_y > 0)");
}

{
  __assert_rtn("copy_with_xforms", "params.cpp", 9166, "0");
}

void crg_params::write_marker_segment()
{
}

{
  __assert_rtn("write_marker_segment", "params.cpp", 9250, "length == acc_length");
}

{
  __assert_rtn("write_marker_segment", "params.cpp", 9211, "last_marked == NULL");
}

void crg_params::read_marker_segment()
{
}

void mq_decoder::start()
{
  __assert_rtn("start", "mq_decoder.cpp", 102, "(buffer != NULL) && (segment_length >= 0)");
}

{
  __assert_rtn("start", "mq_decoder.cpp", 101, "buf_start == NULL");
}

{
  __assert_rtn("start", "mq_decoder.cpp", 100, "!active");
}

void mq_decoder::finish()
{
}

{
  __assert_rtn("finish", "mq_decoder.cpp", 149, "buf_next == (buf_start+segment_length+1)");
}

void mq_decoder::mq_decode()
{
}

void mq_decoder::mq_decode_run()
{
}

void kd_block_encoder::encode()
{
  __assert_rtn("encode", "block_encoder.cpp", 1203, "block->max_samples >= ((num_stripes<<2)*num_cols)");
}

{
  __assert_rtn("encode", "block_encoder.cpp", 1279, "available_bytes >= segment_bytes");
}

{
  __assert_rtn("encode_cleanup_pass", "block_encoder.cpp", 858, "shift > 0");
}

{
  __assert_rtn("encode", "block_encoder.cpp", 1473, "first_unsized_z == block->num_passes");
}

{
  __assert_rtn("encode", "block_encoder.cpp", 1472, "segment_passes == 0");
}

{
  __assert_rtn("encode", "block_encoder.cpp", 1467, "first_unsized_z == (z+1)");
}

{
  __assert_rtn("encode", "block_encoder.cpp", 1457, "final");
}

{
  __assert_rtn("encode", "block_encoder.cpp", 1379, "first_unsized_z == t");
}

{
  __assert_rtn("encode_cleanup_pass", "block_encoder.cpp", 1038, "A < MQE_A_MIN");
}

{
  __assert_rtn("encode_cleanup_pass", "block_encoder.cpp", 1017, "A < MQE_A_MIN");
}

{
  __assert_rtn("encode_cleanup_pass", "block_encoder.cpp", 1003, "A < MQE_A_MIN");
}

{
  __assert_rtn("encode_cleanup_pass", "block_encoder.cpp", 984, "A < MQE_A_MIN");
}

{
  __assert_rtn("encode_cleanup_pass", "block_encoder.cpp", 970, "A < MQE_A_MIN");
}

{
  __assert_rtn("encode_cleanup_pass", "block_encoder.cpp", 951, "A < MQE_A_MIN");
}

{
  __assert_rtn("encode_cleanup_pass", "block_encoder.cpp", 920, "A < MQE_A_MIN");
}

{
  __assert_rtn("encode_cleanup_pass", "block_encoder.cpp", 901, "A < MQE_A_MIN");
}

{
  __assert_rtn("encode_cleanup_pass", "block_encoder.cpp", 883, "A < MQE_A_MIN");
}

{
  __assert_rtn("encode_mag_ref_pass", "block_encoder.cpp", 825, "A < MQE_A_MIN");
}

{
  __assert_rtn("encode_mag_ref_pass", "block_encoder.cpp", 805, "A < MQE_A_MIN");
}

{
  __assert_rtn("encode_mag_ref_pass", "block_encoder.cpp", 785, "A < MQE_A_MIN");
}

{
  __assert_rtn("encode_mag_ref_pass", "block_encoder.cpp", 765, "A < MQE_A_MIN");
}

{
  __assert_rtn("encode_sig_prop_pass_raw", "block_encoder.cpp", 292, "shift > 0");
}

{
  __assert_rtn("encode_sig_prop_pass", "block_encoder.cpp", 427, "shift > 0");
}

{
  __assert_rtn("encode_sig_prop_pass", "block_encoder.cpp", 585, "A < MQE_A_MIN");
}

{
  __assert_rtn("encode_sig_prop_pass", "block_encoder.cpp", 565, "A < MQE_A_MIN");
}

{
  __assert_rtn("encode_sig_prop_pass", "block_encoder.cpp", 551, "A < MQE_A_MIN");
}

{
  __assert_rtn("encode_sig_prop_pass", "block_encoder.cpp", 533, "A < MQE_A_MIN");
}

{
  __assert_rtn("encode_sig_prop_pass", "block_encoder.cpp", 519, "A < MQE_A_MIN");
}

{
  __assert_rtn("encode_sig_prop_pass", "block_encoder.cpp", 501, "A < MQE_A_MIN");
}

{
  __assert_rtn("encode_sig_prop_pass", "block_encoder.cpp", 470, "A < MQE_A_MIN");
}

{
  __assert_rtn("encode_sig_prop_pass", "block_encoder.cpp", 452, "A < MQE_A_MIN");
}

void mq_encoder::augment_buffer()
{
  __assert_rtn("augment_buffer", "mq_encoder.h", 160, "(!checked_out) && (old_handle != NULL) && (new_handle != NULL)");
}

void mq_encoder::continues()
{
}

{
  __assert_rtn("continues", "mq_encoder.h", 171, "!previous->checked_out");
}

{
  __assert_rtn("continues", "mq_encoder.h", 169, "(!active) && (buf_start == NULL)");
}

void mq_encoder::get_bytes_used()
{
  __assert_rtn("get_bytes_used", "mq_encoder.h", 147, "(!checked_out) && (buf_start != NULL)");
}

void mq_encoder::finish()
{
}

{
  __assert_rtn("finish", "mq_encoder.h", 237, "(!active) && (next == NULL)");
}

void mq_encoder::check_out()
{
}

{
  __assert_rtn("check_out", "mq_encoder.h", 258, "active && (!checked_out) && !MQ_segment");
}

void mq_encoder::check_in()
{
}

{
  __assert_rtn("check_in", "mq_encoder.h", 270, "active && checked_out && !MQ_segment");
}

void kd_block_decoder::decode()
{
}

{
  __assert_rtn("check_out", "mq_decoder.h", 140, "active && (!checked_out) && !MQ_segment");
}

void kd_decoder::init()
{
}

{
  __assert_rtn("init", "decoder.cpp", 233, "(this->allocator == NULL) && (this->queue == NULL)");
}

void kd_decoder::pull()
{
  __assert_rtn("pull", "decoder.cpp", 381, "(queue == NULL) || (env != NULL)");
}

{
  __assert_rtn("pull", "decoder.cpp", 420, "buffered_line_lim <= buffer_height");
}

{
  __assert_rtn("pull", "decoder.cpp", 444, "buffer_height > nominal_block_height");
}

{
  __assert_rtn("pull", "decoder.cpp", 425, "line.get_width() == (subband_cols+pull_offset)");
}

{
  __assert_rtn("pull", "decoder.cpp", 411, "num_jobs_per_row == 1");
}

{
  __assert_rtn("pull", "decoder.cpp", 400, "buffer_height > nominal_block_height");
}

void kd_decoder::do_job()
{
}

{
  __assert_rtn("do_job", "decoder.cpp", 483, "idx.y < (block_indices.pos.y + block_indices.size.y)");
}

void kd_analysis::init()
{
}

{
  __assert_rtn("init", "analysis.cpp", 445, "ns == num_hor_steps");
}

{
  __assert_rtn("init", "analysis.cpp", 443, "ns == num_vert_steps");
}

{
  __assert_rtn("init", "analysis.cpp", 380, "extend < 256");
}

{
  __assert_rtn("init", "analysis.cpp", 365, "step->coeffs[n] == coefficients[n]");
}

void kd_vlift_queue::simulate_push_line()
{
  __assert_rtn("simulate_push_line", "transform_local.h", 218, "((idx ^ queue_idx) & 1) == 0");
}

void kd_vlift_queue::simulate_access_update()
{
  __assert_rtn("simulate_access_update", "transform_local.h", 232, "(((idx ^ queue_idx) & 1) == 0) && (idx >= update_pos)");
}

void kd_vlift_queue::simulate_access_source()
{
  __assert_rtn("simulate_access_source", "transform_local.h", 246, "(((idx ^ queue_idx) & 1) == 0) && (idx >= source_pos)");
}

void kd_analysis::push()
{
  __assert_rtn("push", "analysis.cpp", 673, "y_next <= y_max");
}

{
  __assert_rtn("push", "analysis.cpp", 695, "vline_in != NULL");
}

{
  __assert_rtn("push", "analysis.cpp", 863, "vline_out != NULL");
}

{
  __assert_rtn("push", "analysis.cpp", 826, "(num_vert_steps > 0) && !unit_height");
}

{
  __assert_rtn("push", "analysis.cpp", 802, "vert_xform_exists");
}

{
  __assert_rtn("push", "analysis.cpp", 708, "line.get_width() == (coset_width[0]+coset_width[1])");
}

{
  __assert_rtn("push", "analysis.cpp", 674, "reversible == line.is_absolute()");
}

void kd_vlift_queue::push_line()
{
  __assert_rtn("push_line", "transform_local.h", 140, "idx == (tail_idx+2)");
}

{
  __assert_rtn("push_line", "transform_local.h", 127, "((idx ^ queue_idx) & 1) == 0");
}

void kd_analysis::horizontal_analysis()
{
}

{
  __assert_rtn("horizontal_analysis", "analysis.cpp", 926, "(coset_width[0] == line->cosets[0].get_width()) && (coset_width[1] == line->cosets[1].get_width())");
}

void kd_vlift_queue::access_update()
{
  __assert_rtn("access_update", "transform_local.h", 157, "(((idx ^ queue_idx) & 1) == 0) && (idx >= update_pos)");
}

{
  __assert_rtn("access_update", "transform_local.h", 163, "result != NULL");
}

void kd_vlift_queue::access_source()
{
  __assert_rtn("access_source", "transform_local.h", 186, "(((idx ^ queue_idx) & 1) == 0) && (idx >= source_pos)");
}

void kd_synthesis::init()
{
}

{
  __assert_rtn("init", "synthesis.cpp", 551, "ns == num_hor_steps");
}

{
  __assert_rtn("init", "synthesis.cpp", 549, "ns == num_vert_steps");
}

{
  __assert_rtn("init", "synthesis.cpp", 463, "extend < 256");
}

{
  __assert_rtn("init", "synthesis.cpp", 448, "step->coeffs[n] == coefficients[n]");
}

{
  __assert_rtn("init", "synthesis.cpp", 325, "(lfill[0] >= 0) && (rfill[0] >= 0) && (lfill[0] < 256) && (rfill[0] < 256) && (lfill[1] >= 0) && (rfill[1] >= 0) && (lfill[1] < 256) && (rfill[1] < 256)");
}

{
  __assert_rtn("init", "synthesis.cpp", 298, "min_in[1] == max_in[1]");
}

{
  __assert_rtn("init", "synthesis.cpp", 291, "min_in[0] == max_in[0]");
}

{
  __assert_rtn("init", "synthesis.cpp", 243, "y_min_in[1] == y_max_in[1]");
}

void kd_synthesis::simulate_vertical_lifting()
{
  __assert_rtn("simulate_vertical_lifting", "synthesis.cpp", 769, "step->next_row_pos == y_next_in[vsub_parity]");
}

void kd_synthesis::pull()
{
  __assert_rtn("pull", "synthesis.cpp", 838, "y_next_out <= y_max_out");
}

{
  __assert_rtn("pull", "synthesis.cpp", 988, "src_off == 0");
}

{
  __assert_rtn("pull", "synthesis.cpp", 922, "step->next_row_pos == y_next_in[vsub_parity]");
}

void kd_encoder::init()
{
}

{
  __assert_rtn("init", "encoder.cpp", 229, "(this->allocator == NULL) && (this->queue == NULL)");
}

void kd_encoder::push()
{
  __assert_rtn("push", "encoder.cpp", 355, "(queue == NULL) || (env != NULL)");
}

{
  __assert_rtn("push", "encoder.cpp", 381, "subband_rows > 0");
}

{
  __assert_rtn("push", "encoder.cpp", 388, "queue != NULL");
}

{
  __assert_rtn("push", "encoder.cpp", 400, "free_line_lim <= buffer_height");
}

{
  __assert_rtn("push", "encoder.cpp", 456, "free_line_lim <= buffer_height");
}

{
  __assert_rtn("push", "encoder.cpp", 447, "num_jobs_per_row == 1");
}

{
  __assert_rtn("push", "encoder.cpp", 438, "free_line_lim <= nominal_block_height");
}

{
  __assert_rtn("push", "encoder.cpp", 404, "line.get_width() == subband_cols");
}

void kd_encoder::do_job()
{
}

{
  __assert_rtn("do_job", "encoder.cpp", 519, "num_samples > 0");
}

{
  __assert_rtn("do_job", "encoder.cpp", 531, "(xfer_size.x+offset) <= subband_cols");
}

{
  __assert_rtn("do_job", "encoder.cpp", 717, "downshift >= K_max");
}

{
  __assert_rtn("do_job", "encoder.cpp", 622, "upshift >= 0");
}

{
  __assert_rtn("do_job", "encoder.cpp", 528, "(xfer_size.x == block->region.size.x) && (xfer_size.y == block->region.size.y) && (0 == block->region.pos.x) && (0 == block->region.pos.y)");
}

{
  __assert_rtn("do_job", "encoder.cpp", 485, "idx.y < (block_indices.pos.y + block_indices.size.y)");
}

void kd_multi_line::reset()
{
}

{
  __assert_rtn("reset", "multi_transform.cpp", 90, "line.is_absolute() == reversible");
}

void kd_multi_line::copy()
{
}

{
  __assert_rtn("copy", "multi_transform.cpp", 186, "src->size.x == size.x");
}

void kd_multi_transform::construct()
{
  __assert_rtn("construct", "multi_transform.cpp", 518, "(n < block->num_dependencies) && (src_line != NULL)");
}

{
  __assert_rtn("construct", "multi_transform.cpp", 522, "tgt_line->reversible == src_line->reversible");
}

{
  __assert_rtn("construct", "multi_transform.cpp", 521, "src_line->bypass == NULL");
}

{
  __assert_rtn("construct", "multi_transform.cpp", 489, "line->is_constant && !line->reversible");
}

{
  __assert_rtn("construct", "multi_transform.cpp", 378, "collection->num_components == num_stage_inputs");
}

{
  __assert_rtn("construct", "multi_transform.cpp", 309, "0");
}

void kd_multi_transform::propagate_knowledge()
{
}

{
  __assert_rtn("propagate_knowledge", "multi_transform.cpp", 676, "have_xform_size");
}

{
  __assert_rtn("propagate_knowledge", "multi_transform.cpp", 589, "block->num_dependencies <= block->num_components");
}

{
  __assert_rtn("propagate_knowledge", "multi_transform.cpp", 560, "codestream_collection->num_components >= 3");
}

void kd_multi_transform::create_resources()
{
}

{
  __assert_rtn("create_resources", "multi_transform.cpp", 745, "codestream_collection->components[n] == &(comp->line)");
}

void kd_multi_synthesis::create()
{
  __assert_rtn("create", "multi_transform.cpp", 958, "comp->num_rows_in_progress <= comp->line.size.y");
}

void kd_multi_synthesis::terminate_queues()
{
  __assert_rtn("terminate_queues", "multi_transform.cpp", 906, "(env_queue != NULL) && (codestream_components[0].env_queue != NULL)");
}

void kd_multi_synthesis::get_size()
{
  __assert_rtn("get_size", "multi_transform.cpp", 973, "(comp_idx >= 0) && (comp_idx < output_collection->num_components)");
}

void kd_multi_synthesis::get_line()
{
  __assert_rtn("get_line", "multi_transform.cpp", 984, "(comp_idx >= 0) && (comp_idx < output_collection->num_components)");
}

{
  __assert_rtn("get_line", "multi_transform.cpp", 1008, "line->outstanding_consumers > 0");
}

{
  __assert_rtn("get_line", "multi_transform.cpp", 1075, "n >= 0");
}

{
  __assert_rtn("get_line", "multi_transform.cpp", 1154, "(line->row_idx == tgt_row_idx) && (line->outstanding_consumers > 0)");
}

{
  __assert_rtn("get_line", "multi_transform.cpp", 1114, "((comp->env_queue == NULL) && (env == NULL)) || ((comp->env_queue != NULL) && (env != NULL))");
}

{
  __assert_rtn("get_line", "multi_transform.cpp", 1096, "(env != NULL) && (comp->num_rows_in_progress > 0)");
}

{
  __assert_rtn("get_line", "multi_transform.cpp", 1083, "ycc_line->row_idx == (tgt_row_idx-1)");
}

{
  __assert_rtn("get_line", "multi_transform.cpp", 1076, "codestream_collection->components[n] == line");
}

{
  __assert_rtn("get_line", "multi_transform.cpp", 1066, "(scan->outstanding_consumers == 0) && (scan->row_idx == (tgt_row_idx-1))");
}

{
  __assert_rtn("get_line", "multi_transform.cpp", 1057, "scan->row_idx == tgt_row_idx");
}

{
  __assert_rtn("get_line", "multi_transform.cpp", 1026, "dep != NULL");
}

{
  __assert_rtn("get_line", "multi_transform.cpp", 1025, "(n >= 0) && (n < block->num_dependencies)");
}

{
  __assert_rtn("get_line", "multi_transform.cpp", 1016, "line->row_idx == (tgt_row_idx-1)");
}

{
  __assert_rtn("get_line", "multi_transform.cpp", 1003, "line->bypass == NULL");
}

void kd_multi_analysis::create()
{
  __assert_rtn("create", "multi_transform.cpp", 1287, "comp->num_available_rows <= comp->line.size.y");
}

void kd_multi_analysis::terminate_queues()
{
  __assert_rtn("terminate_queues", "multi_transform.cpp", 1236, "(env_queue != NULL) && (codestream_components[0].env_queue != NULL)");
}

void kd_multi_analysis::prepare_network_for_inversion()
{
}

void kd_multi_analysis::get_size()
{
  __assert_rtn("get_size", "multi_transform.cpp", 1306, "(comp_idx >= 0) && (comp_idx < output_collection->num_components)");
}

void kd_multi_analysis::exchange_line()
{
  __assert_rtn("exchange_line", "multi_transform.cpp", 1429, "line->row_idx == (row_idx-1)");
}

{
  __assert_rtn("exchange_line", "multi_transform.cpp", 1424, "(written == &(line->line)) && !line->waiting_for_inversion");
}

{
  __assert_rtn("exchange_line", "multi_transform.cpp", 1421, "line->num_consumers == 1");
}

{
  __assert_rtn("exchange_line", "multi_transform.cpp", 1416, "(comp_idx >= 0) && (comp_idx < output_collection->num_components)");
}

void kd_multi_analysis::advance_line()
{
  __assert_rtn("advance_line", "multi_transform.cpp", 1519, "n >= 0");
}

{
  __assert_rtn("advance_line", "multi_transform.cpp", 1538, "ycc_lines[n]->waiting_for_inversion");
}

{
  __assert_rtn("advance_line", "multi_transform.cpp", 1586, "!line->waiting_for_inversion");
}

{
  __assert_rtn("advance_line", "multi_transform.cpp", 1567, "((comp->env_queue == NULL) && (env == NULL)) || ((comp->env_queue != NULL) && (env != NULL))");
}

{
  __assert_rtn("advance_line", "multi_transform.cpp", 1549, "env != NULL");
}

{
  __assert_rtn("advance_line", "multi_transform.cpp", 1520, "codestream_collection->components[n] == line");
}

{
  __assert_rtn("advance_line", "multi_transform.cpp", 1511, "block->components[n].num_consumers == 1");
}

{
  __assert_rtn("advance_line", "multi_transform.cpp", 1496, "dep->num_consumers > 1");
}

{
  __assert_rtn("advance_line", "multi_transform.cpp", 1466, "(dep->num_consumers > 0) && !dep->is_constant");
}

{
  __assert_rtn("advance_line", "multi_transform.cpp", 1460, "dep->num_consumers > 1");
}

{
  __assert_rtn("advance_line", "multi_transform.cpp", 1456, "(n >= 0) && (n < block->num_dependencies)");
}

{
  __assert_rtn("advance_line", "multi_transform.cpp", 1445, "line->row_idx==(new_row_idx-1)");
}

{
  __assert_rtn("advance_line", "multi_transform.cpp", 1444, "line->num_consumers == 1");
}

void kd_multi_null_block::initialize()
{
  __assert_rtn("initialize", "multi_transform.cpp", 1645, "(num_stage_inputs == input_collection->num_components) && (num_stage_outputs == output_collection->num_components)");
}

void kd_multi_matrix_block::initialize()
{
  __assert_rtn("initialize", "multi_transform.cpp", 1709, "(num_stage_inputs == input_collection->num_components) && (num_stage_outputs == output_collection->num_components)");
}

void kd_multi_matrix_block::normalize_coefficients()
{
}

void kd_multi_matrix_block::perform_transform()
{
}

void kd_multi_matrix_block::prepare_for_inversion()
{
  __assert_rtn("prepare_for_inversion", "multi_transform.cpp", 1922, "work == NULL");
}

void kd_multi_matrix_block::perform_inverse()
{
  __assert_rtn("perform_inverse", "multi_transform.cpp", 2053, "inverse_coefficients != NULL");
}

void kd_multi_rxform_block::initialize()
{
  __assert_rtn("initialize", "multi_transform.cpp", 2219, "N >= num_block_outputs");
}

{
  __assert_rtn("initialize", "multi_transform.cpp", 2231, "(num_stage_inputs == input_collection->num_components) && (num_stage_outputs == output_collection->num_components)");
}

void kd_multi_rxform_block::perform_transform()
{
  __assert_rtn("perform_transform", "multi_transform.cpp", 2382, "n == N");
}

{
  __assert_rtn("perform_transform", "multi_transform.cpp", 2356, "n == N");
}

{
  __assert_rtn("perform_transform", "multi_transform.cpp", 2305, "num_dependencies == N");
}

void kd_multi_rxform_block::perform_inverse()
{
  __assert_rtn("perform_inverse", "multi_transform.cpp", 2480, "n == N");
}

{
  __assert_rtn("perform_inverse", "multi_transform.cpp", 2454, "n == N");
}

void kd_multi_dependency_block::initialize()
{
  __assert_rtn("initialize", "multi_transform.cpp", 2521, "N >= num_block_outputs");
}

{
  __assert_rtn("initialize", "multi_transform.cpp", 2577, "(f_cf-f_matrix) == (N*N)");
}

{
  __assert_rtn("initialize", "multi_transform.cpp", 2567, "!is_reversible");
}

{
  __assert_rtn("initialize", "multi_transform.cpp", 2545, "is_reversible");
}

{
  __assert_rtn("initialize", "multi_transform.cpp", 2556, "(i_cf-i_matrix) == (N*N)");
}

{
  __assert_rtn("initialize", "multi_transform.cpp", 2531, "(num_stage_inputs == input_collection->num_components) && (num_stage_outputs == output_collection->num_components)");
}

void kd_multi_dependency_block::normalize_coefficients()
{
  __assert_rtn("normalize_coefficients", "multi_transform.cpp", 2670, "N == num_dependencies");
}

void kd_multi_dependency_block::create_short_matrix()
{
  __assert_rtn("create_short_matrix", "multi_transform.cpp", 2723, "N == num_dependencies");
}

void kd_multi_dependency_block::perform_transform()
{
  __assert_rtn("perform_transform", "multi_transform.cpp", 2767, "num_dependencies == N");
}

void kd_multi_dependency_block::perform_inverse()
{
}

{
  __assert_rtn("perform_inverse", "multi_transform.cpp", 2895, "num_dependencies == N");
}

void kd_multi_dwt_block::initialize()
{
  __assert_rtn("initialize", "multi_transform.cpp", 3043, "(step_info != NULL) && (num_levels > 0)");
}

{
  __assert_rtn("initialize", "multi_transform.cpp", 3097, "(loc >= canvas_min) && (loc < canvas_lim)");
}

{
  __assert_rtn("initialize", "multi_transform.cpp", 3033, "(num_stage_inputs == input_collection->num_components) && (num_stage_outputs == output_collection->num_components)");
}

void kd_multi_dwt_block::prepare_for_inversion()
{
}

void kd_multi_dwt_block::normalize_coefficients()
{
}

void kd_multi_dwt_block::perform_transform()
{
  __assert_rtn("perform_transform", "multi_transform.cpp", 3609, "lev->normalizing_shift == 0");
}

{
  __assert_rtn("perform_transform", "multi_transform.cpp", 3648, "0");
}

{
  __assert_rtn("perform_transform", "multi_transform.cpp", 3635, "(k >= 0) && (k < lev->region_size)");
}

void kd_multi_dwt_block::perform_inverse()
{
}

{
  __assert_rtn("perform_inverse", "multi_transform.cpp", 3706, "lev->normalizing_shift == 0");
}

{
  __assert_rtn("perform_inverse", "multi_transform.cpp", 3784, "0");
}

{
  __assert_rtn("perform_inverse", "multi_transform.cpp", 3771, "(k >= 0) && (k < lev->region_size)");
}

void kdrc_overlay::set_buffer_surface()
{
  __assert_rtn("set_buffer_surface", "kdu_region_compositor.cpp", 545, "compositor != NULL");
}

{
  __assert_rtn("set_buffer_surface", "kdu_region_compositor.cpp", 629, "((head == NULL) && (tail == NULL)) || ((tail != NULL) && (tail->next == NULL))");
}

{
  __assert_rtn("set_buffer_surface", "kdu_region_compositor.cpp", 609, "next == NULL");
}

{
  __assert_rtn("set_buffer_surface", "kdu_region_compositor.cpp", 549, "(expansion_numerator.x > 0) && (expansion_numerator.y > 0) && (expansion_denominator.x > 0) && (expansion_denominator.y > 0)");
}

void kdrc_overlay::map_from_compositing_grid()
{
  __assert_rtn("long_floor_ratio", "kdu_utils.h", 254, "(num >= (kdu_long) KDU_INT32_MIN)");
}

{
  __assert_rtn("long_floor_ratio", "kdu_utils.h", 259, "(num <= (kdu_long) KDU_INT32_MAX)");
}

void kdrc_overlay::update_config()
{
  __assert_rtn("update_config", "kdu_region_compositor.cpp", 729, "scan == tail");
}

void kdrc_codestream::init()
{
}

{
  __assert_rtn("init", "kdu_region_compositor.cpp", 944, "!ifc");
}

{
  __assert_rtn("init", "kdu_region_compositor.cpp", 962, "!ifc");
}

void kdrc_codestream::restart()
{
}

void kdrc_codestream::attach()
{
}

{
  __assert_rtn("attach", "kdu_region_compositor.cpp", 1002, "head->prev_codestream_user == NULL");
}

{
  __assert_rtn("attach", "kdu_region_compositor.cpp", 997, "user->codestream == NULL");
}

void kdrc_codestream::detach()
{
  __assert_rtn("detach", "kdu_region_compositor.cpp", 1030, "user == head");
}

{
  __assert_rtn("detach", "kdu_region_compositor.cpp", 1037, "user != head");
}

{
  __assert_rtn("detach", "kdu_region_compositor.cpp", 1027, "user->codestream == this");
}

void kdrc_codestream::move_to_head()
{
}

{
  __assert_rtn("move_to_head", "kdu_region_compositor.cpp", 1082, "head->prev_codestream_user == NULL");
}

{
  __assert_rtn("move_to_head", "kdu_region_compositor.cpp", 1062, "user == head");
}

{
  __assert_rtn("move_to_head", "kdu_region_compositor.cpp", 1069, "user != head");
}

{
  __assert_rtn("move_to_head", "kdu_region_compositor.cpp", 1057, "user->codestream == this");
}

void kdrc_codestream::move_to_tail()
{
}

{
  __assert_rtn("move_to_tail", "kdu_region_compositor.cpp", 1107, "user == head");
}

{
  __assert_rtn("move_to_tail", "kdu_region_compositor.cpp", 1114, "user != head");
}

{
  __assert_rtn("move_to_tail", "kdu_region_compositor.cpp", 1102, "user->codestream == this");
}

void kdrc_stream::init()
{
  __assert_rtn("init", "kdu_region_compositor.cpp", 1230, "codestream == cs");
}

{
  __assert_rtn("init", "kdu_region_compositor.cpp", 1217, "codestream == sibling->codestream");
}

{
  __assert_rtn("init", "kdu_region_compositor.cpp", 1213, "codestream == NULL");
}

{
  __assert_rtn("init", "kdu_region_compositor.cpp", 1206, "overlay == NULL");
}

{
  __assert_rtn("init", "kdu_region_compositor.cpp", 1361, "mapping.num_channels == (mapping.num_colour_channels + ((have_alpha)?1:0))");
}

{
  __assert_rtn("init", "kdu_region_compositor.cpp", 1279, "codestream == cs");
}

{
  __assert_rtn("init", "kdu_region_compositor.cpp", 1266, "codestream == sibling->codestream");
}

{
  __assert_rtn("init", "kdu_region_compositor.cpp", 1262, "codestream == NULL");
}

{
  __assert_rtn("init", "kdu_region_compositor.cpp", 1254, "overlay == NULL");
}

{
  __assert_rtn("init", "kdu_region_compositor.cpp", 1415, "codestream == cs");
}

{
  __assert_rtn("init", "kdu_region_compositor.cpp", 1402, "codestream == sibling->codestream");
}

{
  __assert_rtn("init", "kdu_region_compositor.cpp", 1398, "codestream == NULL");
}

{
  __assert_rtn("init", "kdu_region_compositor.cpp", 1382, "overlay == NULL");
}

void kdrc_stream::configure_subsampling()
{
  __assert_rtn("configure_subsampling", "kdu_region_compositor.cpp", 1561, "active_component >= 0");
}

void kdrc_stream::change_frame()
{
  __assert_rtn("change_frame", "kdu_region_compositor.cpp", 1480, "codestream == cs");
}

void kdrc_stream::set_error_level()
{
  __assert_rtn("set_error_level", "kdu_region_compositor.cpp", 1493, "(codestream != NULL) && (codestream->ifc.exists())");
}

void kdrc_stream::set_scale()
{
}

{
  __assert_rtn("set_scale", "kdu_region_compositor.cpp", 1820, "expansion_denominator.y > 0");
}

void kdrc_stream::set_buffer_surface()
{
}

void kdrc_stream::process()
{
  __assert_rtn("process", "kdu_region_compositor.cpp", 2321, "buffer != NULL");
}

{
  __assert_rtn("process", "kdu_region_compositor.cpp", 2376, "!codestream->in_use");
}

void kdrc_stream::adjust_refresh()
{
}

{
  __assert_rtn("adjust_refresh", "kdu_region_compositor.cpp", 2537, "(left >= 0) && (right >= 0) && (top >= 0) && (bottom >= 0)");
}

void kdu_region_compositor::remove_stream()
{
  __assert_rtn("remove_stream", "kdu_region_compositor.cpp", 5943, "scan != NULL");
}

{
  __assert_rtn("remove_stream", "kdu_region_compositor.cpp", 5946, "(jpx_src != NULL) && single_component_box.exists()");
}

void kdrc_layer::init()
{
  __assert_rtn("init", "kdu_region_compositor.cpp", 2631, "(streams[0] == NULL) && (streams[1] == NULL)");
}

{
  __assert_rtn("init", "kdu_region_compositor.cpp", 2780, "stream_idx >= 0");
}

{
  __assert_rtn("init", "kdu_region_compositor.cpp", 2746, "(streams[0] == NULL) && (streams[1] == NULL)");
}

void kdu_region_compositor::add_active_stream()
{
  __assert_rtn("add_active_stream", "kdu_region_compositor.cpp", 5838, "raw_src == NULL");
}

{
  __assert_rtn("add_active_stream", "kdu_region_compositor.cpp", 5879, "0");
}

{
  __assert_rtn("add_active_stream", "kdu_region_compositor.cpp", 5873, "track != NULL");
}

void kdrc_layer::activate()
{
}

{
  __assert_rtn("activate", "kdu_region_compositor.cpp", 2888, "overlay == NULL");
}

void kdrc_layer::set_buffer_surface()
{
}

{
  __assert_rtn("set_buffer_surface", "kdu_region_compositor.cpp", 3124, "(next == NULL) && (prev == NULL) && (whole_region == visible_region) && (overlay_buffer == NULL)");
}

void kdu_region_compositor::donate_compositing_buffer()
{
  __assert_rtn("donate_compositing_buffer", "kdu_region_compositor.cpp", 5744, "(active_layers != NULL) && active_layers->have_overlay_info");
}

{
  __assert_rtn("donate_compositing_buffer", "kdu_region_compositor.cpp", 5743, "this->buffer_region == buffer_region");
}

{
  __assert_rtn("donate_compositing_buffer", "kdu_region_compositor.cpp", 5742, "this->composition_buffer == NULL");
}

void kdrc_layer::update_overlay()
{
  __assert_rtn("update_overlay", "kdu_region_compositor.cpp", 3366, "(next == NULL) && (prev == NULL) && (overlay_buffer == NULL)");
}

void kdrc_layer::process_overlay()
{
}

void kdu_region_compositor::retract_compositing_buffer()
{
  __assert_rtn("retract_compositing_buffer", "kdu_region_compositor.cpp", 5756, "active_layers != NULL");
}

void kdrc_layer::update_composition()
{
  __assert_rtn("update_composition", "kdu_region_compositor.cpp", 3540, "have_valid_scale && (buffer != NULL)");
}

{
  __assert_rtn("update_composition", "kdu_region_compositor.cpp", 3579, "(bytesPerPixel == 4) && (compositingBytesPP == 4)");
}

void kdu_region_compositor::remove_compositing_layer()
{
  __assert_rtn("remove_compositing_layer", "kdu_region_compositor.cpp", 4363, "scan == last_active_layer");
}

{
  __assert_rtn("remove_compositing_layer", "kdu_region_compositor.cpp", 4368, "scan != last_active_layer");
}

{
  __assert_rtn("remove_compositing_layer", "kdu_region_compositor.cpp", 4356, "scan == active_layers");
}

void kdu_region_compositor::add_compositing_layer()
{
  __assert_rtn("add_compositing_layer", "kdu_region_compositor.cpp", 4101, "mj2_src != NULL");
}

{
  __assert_rtn("add_compositing_layer", "kdu_region_compositor.cpp", 4170, "active_layers == NULL");
}

{
  __assert_rtn("add_compositing_layer", "kdu_region_compositor.cpp", 4133, "scan == last_active_layer");
}

{
  __assert_rtn("add_compositing_layer", "kdu_region_compositor.cpp", 4138, "scan != last_active_layer");
}

{
  __assert_rtn("add_compositing_layer", "kdu_region_compositor.cpp", 4126, "scan == active_layers");
}

{
  __assert_rtn("add_compositing_layer", "kdu_region_compositor.cpp", 4068, "active_streams == NULL");
}

void kdu_region_compositor::set_single_component()
{
  __assert_rtn("set_single_component", "kdu_region_compositor.cpp", 4463, "mj2_src != NULL");
}

{
  __assert_rtn("set_single_component", "kdu_region_compositor.cpp", 4492, "active_streams->codestream_idx == stream_idx");
}

{
  __assert_rtn("set_single_component", "kdu_region_compositor.cpp", 4432, "last_active_layer == NULL");
}

void kdu_region_compositor::set_buffer_surface()
{
  __assert_rtn("set_buffer_surface", "kdu_region_compositor.cpp", 4568, "(active_streams != NULL) && (active_streams->next == NULL) && (composition_buffer != NULL)");
}

{
  __assert_rtn("set_buffer_surface", "kdu_region_compositor.cpp", 4596, "(needed_left >= 0) && (needed_right >= 0) && (needed_above >= 0) && (needed_below >= 0)");
}

void kdu_region_compositor::update_composition()
{
  __assert_rtn("update_composition", "kdu_region_compositor.cpp", 5451, "active_streams->next == NULL");
}

void kdu_region_compositor::process()
{
  __assert_rtn("process", "kdu_region_compositor.cpp", 5158, "invalid_scale_code != 0");
}

{
  __assert_rtn("process", "kdu_region_compositor.cpp", 5153, "!target->is_complete");
}

void jx_fragment_list::init()
{
  __assert_rtn("init", "jpx.cpp", 90, "flst->get_box_type() == jp2_fragment_list_4cc");
}

void jpx_input_box::seek()
{
  __assert_rtn("seek", "jpx.cpp", 407, "contents_start == 0");
}

void jx_compatibility::init_ftyp()
{
  __assert_rtn("init_ftyp", "jpx.cpp", 568, "ftyp->get_box_type() == jp2_file_type_4cc");
}

void jx_compatibility::init_rreq()
{
  __assert_rtn("init_rreq", "jpx.cpp", 601, "rreq->get_box_type() == jp2_reader_requirements_4cc");
}

void jx_composition::finish()
{
  __assert_rtn("finish", "jpx.cpp", 1520, "max_repeats >= 0");
}

{
  __assert_rtn("finish", "jpx.cpp", 1519, "remaining == 0");
}

{
  __assert_rtn("finish", "jpx.cpp", 1405, "comp_in.get_box_type() == jp2_composition_4cc");
}

void jx_source::parse_next_top_level_box()
{
}

{
  __assert_rtn("parse_next_top_level_box", "jpx.cpp", 5631, "!dtbl_box");
}

{
  __assert_rtn("parse_next_top_level_box", "jpx.cpp", 5675, "!top_box");
}

{
  __assert_rtn("parse_next_top_level_box", "jpx.cpp", 5706, "!top_box");
}

{
  __assert_rtn("parse_next_top_level_box", "jpx.cpp", 5726, "!top_box");
}

{
  __assert_rtn("parse_next_top_level_box", "jpx.cpp", 5740, "!top_box");
}

{
  __assert_rtn("parse_next_top_level_box", "jpx.cpp", 5587, "!top_box");
}

{
  __assert_rtn("parse_next_top_level_box", "jpx.cpp", 5582, "!already_open");
}

void jx_composition::remove_invisible_instructions()
{
  __assert_rtn("remove_invisible_instructions", "jpx.cpp", 1778, "tail == fp");
}

{
  __assert_rtn("remove_invisible_instructions", "jpx.cpp", 1768, "head == fp");
}

{
  __assert_rtn("remove_invisible_instructions", "jpx.cpp", 1765, "fp->num_instructions == 0");
}

{
  __assert_rtn("remove_invisible_instructions", "jpx.cpp", 1755, "fp->tail == ip");
}

{
  __assert_rtn("remove_invisible_instructions", "jpx.cpp", 1748, "fp->head == ip");
}

void jpx_layer_source::access_channels()
{
  __assert_rtn("access_channels", "jpx.cpp", 5420, "(state != NULL) && state->finished");
}

void jx_numlist::add_codestream()
{
  __assert_rtn("add_codestream", "jpx.cpp", 2520, "codestream_indices == NULL");
}

void jx_numlist::add_compositing_layer()
{
  __assert_rtn("add_compositing_layer", "jpx.cpp", 2551, "layer_indices == NULL");
}

void jx_regions::set_num_regions()
{
  __assert_rtn("set_num_regions", "jpx.cpp", 2603, "(regions == NULL) && (max_regions == 0)");
}

void jx_metagroup::unlink()
{
  __assert_rtn("unlink", "jpx.cpp", 3704, "(offset >= 0) && (offset < (JX_ROIGROUP_SIZE*JX_ROIGROUP_SIZE))");
}

{
  __assert_rtn("unlink", "jpx.cpp", 3702, "roig->level == 0");
}

{
  __assert_rtn("unlink", "jpx.cpp", 3691, "node == tail");
}

{
  __assert_rtn("unlink", "jpx.cpp", 3684, "node == head");
}

{
  __assert_rtn("unlink", "jpx.cpp", 3681, "node->metagroup == this");
}

void jx_meta_manager::link()
{
}

void jx_metanode::donate_input_box()
{
  __assert_rtn("donate_input_box", "jpx.cpp", 2786, "(read_state == NULL) && !(box_complete || descendants_known)");
}

void jx_metanode::finish_reading()
{
}

{
  __assert_rtn("finish_reading", "jpx.cpp", 2819, "read_state->asoc.exists()");
}

{
  __assert_rtn("finish_reading", "jpx.cpp", 2966, "read_state->asoc.exists()");
}

{
  __assert_rtn("finish_reading", "jpx.cpp", 2967, "!read_state->box");
}

void jx_codestream_source::finish()
{
}

{
  __assert_rtn("finish", "jpx.cpp", 4910, "!chdr");
}

void jx_layer_source::finish()
{
  __assert_rtn("finish", "jpx.cpp", 5348, "cs != NULL");
}

{
  __assert_rtn("finish", "jpx.cpp", 5224, "!sub_box.exists()");
}

{
  __assert_rtn("finish", "jpx.cpp", 5256, "!jplh");
}

void jpx_metanode::get_num_regions()
{
}

void jx_roigroup::delete_child()
{
  __assert_rtn("delete_child", "jpx.cpp", 3797, "this == manager->roi_scales[scale_idx]");
}

{
  __assert_rtn("delete_child", "jpx.cpp", 3773, "(loc.x >= 0) && (loc.x < JX_ROIGROUP_SIZE) && (loc.y >= 0) && (loc.y < JX_ROIGROUP_SIZE)");
}

{
  __assert_rtn("delete_child", "jpx.cpp", 3808, "this == parent->sub_groups[loc.x+loc.y*JX_ROIGROUP_SIZE]");
}

{
  __assert_rtn("delete_child", "jpx.cpp", 3807, "(loc.x >= 0) && (loc.x < JX_ROIGROUP_SIZE) && (loc.y >= 0) && (loc.y < JX_ROIGROUP_SIZE)");
}

{
  __assert_rtn("delete_child", "jpx.cpp", 3778, "metagroups[offset].head == NULL");
}

{
  __assert_rtn("delete_child", "jpx.cpp", 3785, "sub_groups[offset] != NULL");
}

void jpx_meta_manager::enumerate_matches()
{
  __assert_rtn("enumerate_matches", "jpx.cpp", 4407, "node->metagroup == &state->numlist_nodes");
}

{
  __assert_rtn("enumerate_matches", "jpx.cpp", 4451, "node->metagroup == &state->unassociated_nodes");
}

{
  __assert_rtn("enumerate_matches", "jpx.cpp", 4337, "(loc.x<JX_ROIGROUP_SIZE) && (loc.y<JX_ROIGROUP_SIZE)");
}

{
  __assert_rtn("enumerate_matches", "jpx.cpp", 4350, "(node->rep_id == JX_ROI_NODE) && (node->regions != NULL)");
}

{
  __assert_rtn("enumerate_matches", "jpx.cpp", 4316, "(loc.x >= 0) && (loc.x < JX_ROIGROUP_SIZE) && (loc.y >= 0) && (loc.y < JX_ROIGROUP_SIZE)");
}

{
  __assert_rtn("enumerate_matches", "jpx.cpp", 4263, "(offset>=0) && (offset<(JX_ROIGROUP_SIZE*JX_ROIGROUP_SIZE))");
}

void jx_codestream_source::donate_chdr_box()
{
}

void jx_codestream_source::donate_codestream_box()
{
}

void jx_codestream_source::parse_fragment_list()
{
  __assert_rtn("parse_fragment_list", "jpx.cpp", 4794, "stream_box.get_box_type() == jp2_fragment_table_4cc");
}

void jpx_codestream_source::get_codestream_id()
{
  __assert_rtn("get_codestream_id", "jpx.cpp", 4993, "(state != NULL) && state->metadata_finished");
}

void jpx_codestream_source::access_dimensions()
{
  __assert_rtn("access_dimensions", "jpx.cpp", 5028, "(state != NULL) && state->metadata_finished");
}

void jpx_codestream_source::open_stream()
{
  __assert_rtn("open_stream", "jpx.cpp", 5091, "state != NULL");
}

{
  __assert_rtn("open_stream", "jpx.cpp", 5098, "state->stream_box.exists()");
}

void jpx_codestream_source::access_palette()
{
  __assert_rtn("access_palette", "jpx.cpp", 5058, "(state != NULL) && state->metadata_finished");
}

void jx_layer_source::donate_jplh_box()
{
}

void jx_layer_source::check_stream_headers()
{
  __assert_rtn("check_stream_headers", "jpx.cpp", 5378, "cs != NULL");
}

void jpx_layer_source::get_layer_id()
{
  __assert_rtn("get_layer_id", "jpx.cpp", 5398, "(state != NULL) && state->finished");
}

void jpx_layer_source::access_colour()
{
  __assert_rtn("access_colour", "jpx.cpp", 5442, "(state != NULL) && state->finished");
}

void jpx_layer_source::have_stream_headers()
{
  __assert_rtn("have_stream_headers", "jpx.cpp", 5480, "state != NULL");
}

void jpx_layer_source::get_codestream_registration()
{
  __assert_rtn("get_codestream_registration", "jpx.cpp", 5505, "(state != NULL) && state->finished");
}

void jpx_source::open()
{
}

{
  __assert_rtn("open", "jpx.cpp", 6002, "!state->have_reader_requirements");
}

{
  __assert_rtn("open", "jpx.cpp", 5989, "!state->top_box");
}

void jx_codestream_source::jx_codestream_source(j2_palette *a1, void *a2, jp2_input_box *a3)
{
  j2_palette::~j2_palette(a1);
  if (*a2) {
    MEMORY[0x18C11C0C0](*a2, 0x1000C8052888210);
  }

  jp2_input_box::~jp2_input_box(a3);
}

void _cg_TIFFReadDirectory_cold_1()
{
  __assert_rtn("_cg_TIFFReadDirectory", "tif_dirread.c", 4485, "fii != FAILED_FII");
}

void TIFFFetchDirectory_cold_1()
{
}

void TIFFFetchNormalTag_cold_1()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6334, "fip != NULL");
}

void TIFFFetchNormalTag_cold_2()
{
}

void TIFFFetchNormalTag_cold_3()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6336, "fip->set_field_type != TIFF_SETGET_OTHER");
}

void TIFFFetchNormalTag_cold_4()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6339, "fip->set_field_type != TIFF_SETGET_INT");
}

void TIFFFetchNormalTag_cold_5()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6404, "(uint32_t)dp->tdir_count + 1 == dp->tdir_count + 1");
}

void TIFFFetchNormalTag_cold_6()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6354, "fip->field_passcount == 0");
}

void TIFFFetchNormalTag_cold_7()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6434, "fip->field_passcount == 0");
}

void TIFFFetchNormalTag_cold_8()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6433, "fip->field_readcount == 1");
}

void TIFFFetchNormalTag_cold_9()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6447, "fip->field_passcount == 0");
}

void TIFFFetchNormalTag_cold_10()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6446, "fip->field_readcount == 1");
}

void TIFFFetchNormalTag_cold_11()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6460, "fip->field_passcount == 0");
}

void TIFFFetchNormalTag_cold_12()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6459, "fip->field_readcount == 1");
}

void TIFFFetchNormalTag_cold_13()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6473, "fip->field_passcount == 0");
}

void TIFFFetchNormalTag_cold_14()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6472, "fip->field_readcount == 1");
}

void TIFFFetchNormalTag_cold_15()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6486, "fip->field_passcount == 0");
}

void TIFFFetchNormalTag_cold_16()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6485, "fip->field_readcount == 1");
}

void TIFFFetchNormalTag_cold_17()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6499, "fip->field_passcount == 0");
}

void TIFFFetchNormalTag_cold_18()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6498, "fip->field_readcount == 1");
}

void TIFFFetchNormalTag_cold_19()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6512, "fip->field_passcount == 0");
}

void TIFFFetchNormalTag_cold_20()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6511, "fip->field_readcount == 1");
}

void TIFFFetchNormalTag_cold_21()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6527, "fip->field_passcount == 0");
}

void TIFFFetchNormalTag_cold_22()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6526, "fip->field_readcount == 1");
}

void TIFFFetchNormalTag_cold_23()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6542, "fip->field_passcount == 0");
}

void TIFFFetchNormalTag_cold_24()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6541, "fip->field_readcount == 1");
}

void TIFFFetchNormalTag_cold_25()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6557, "fip->field_passcount == 0");
}

void TIFFFetchNormalTag_cold_26()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6556, "fip->field_readcount == 1");
}

void TIFFFetchNormalTag_cold_27()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6572, "fip->field_passcount == 0");
}

void TIFFFetchNormalTag_cold_28()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6571, "fip->field_readcount == 1");
}

void TIFFFetchNormalTag_cold_29()
{
}

void TIFFFetchNormalTag_cold_30()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6587, "fip->field_passcount == 0");
}

void TIFFFetchNormalTag_cold_31()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6586, "fip->field_readcount == 2");
}

void TIFFFetchNormalTag_cold_32()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6611, "fip->field_readcount >= 1");
}

void TIFFFetchNormalTag_cold_33()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6612, "fip->field_passcount == 0");
}

void TIFFFetchNormalTag_cold_34()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6646, "fip->field_readcount >= 1");
}

void TIFFFetchNormalTag_cold_35()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6647, "fip->field_passcount == 0");
}

void TIFFFetchNormalTag_cold_36()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6681, "fip->field_readcount >= 1");
}

void TIFFFetchNormalTag_cold_37()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6682, "fip->field_passcount == 0");
}

void TIFFFetchNormalTag_cold_38()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6716, "fip->field_readcount >= 1");
}

void TIFFFetchNormalTag_cold_39()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6717, "fip->field_passcount == 0");
}

void TIFFFetchNormalTag_cold_40()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6751, "fip->field_readcount >= 1");
}

void TIFFFetchNormalTag_cold_41()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6752, "fip->field_passcount == 0");
}

void TIFFFetchNormalTag_cold_42()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6786, "fip->field_readcount >= 1");
}

void TIFFFetchNormalTag_cold_43()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6787, "fip->field_passcount == 0");
}

void TIFFFetchNormalTag_cold_44()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6821, "fip->field_readcount >= 1");
}

void TIFFFetchNormalTag_cold_45()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6822, "fip->field_passcount == 0");
}

void TIFFFetchNormalTag_cold_46()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6856, "fip->field_readcount >= 1");
}

void TIFFFetchNormalTag_cold_47()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6857, "fip->field_passcount == 0");
}

void TIFFFetchNormalTag_cold_48()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6891, "fip->field_readcount >= 1");
}

void TIFFFetchNormalTag_cold_49()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6892, "fip->field_passcount == 0");
}

void TIFFFetchNormalTag_cold_50()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6928, "fip->field_readcount >= 1");
}

void TIFFFetchNormalTag_cold_51()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6929, "fip->field_passcount == 0");
}

void TIFFFetchNormalTag_cold_52()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6964, "fip->field_passcount == 1");
}

void TIFFFetchNormalTag_cold_53()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 6963, "fip->field_readcount == TIFF_VARIABLE");
}

void TIFFFetchNormalTag_cold_54()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 7020, "fip->field_passcount == 1");
}

void TIFFFetchNormalTag_cold_55()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 7019, "fip->field_readcount == TIFF_VARIABLE");
}

void TIFFFetchNormalTag_cold_56()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 7049, "fip->field_passcount == 1");
}

void TIFFFetchNormalTag_cold_57()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 7048, "fip->field_readcount == TIFF_VARIABLE");
}

void TIFFFetchNormalTag_cold_58()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 7078, "fip->field_passcount == 1");
}

void TIFFFetchNormalTag_cold_59()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 7077, "fip->field_readcount == TIFF_VARIABLE");
}

void TIFFFetchNormalTag_cold_60()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 7107, "fip->field_passcount == 1");
}

void TIFFFetchNormalTag_cold_61()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 7106, "fip->field_readcount == TIFF_VARIABLE");
}

void TIFFFetchNormalTag_cold_62()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 7136, "fip->field_passcount == 1");
}

void TIFFFetchNormalTag_cold_63()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 7135, "fip->field_readcount == TIFF_VARIABLE");
}

void TIFFFetchNormalTag_cold_64()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 7165, "fip->field_passcount == 1");
}

void TIFFFetchNormalTag_cold_65()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 7164, "fip->field_readcount == TIFF_VARIABLE");
}

void TIFFFetchNormalTag_cold_66()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 7194, "fip->field_passcount == 1");
}

void TIFFFetchNormalTag_cold_67()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 7193, "fip->field_readcount == TIFF_VARIABLE");
}

void TIFFFetchNormalTag_cold_68()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 7223, "fip->field_passcount == 1");
}

void TIFFFetchNormalTag_cold_69()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 7222, "fip->field_readcount == TIFF_VARIABLE");
}

void TIFFFetchNormalTag_cold_70()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 7252, "fip->field_passcount == 1");
}

void TIFFFetchNormalTag_cold_71()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 7251, "fip->field_readcount == TIFF_VARIABLE");
}

void TIFFFetchNormalTag_cold_72()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 7281, "fip->field_passcount == 1");
}

void TIFFFetchNormalTag_cold_73()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 7280, "fip->field_readcount == TIFF_VARIABLE");
}

void TIFFFetchNormalTag_cold_74()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 7310, "fip->field_passcount == 1");
}

void TIFFFetchNormalTag_cold_75()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 7309, "fip->field_readcount == TIFF_VARIABLE");
}

void TIFFFetchNormalTag_cold_76()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 7339, "fip->field_passcount == 1");
}

void TIFFFetchNormalTag_cold_77()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 7338, "fip->field_readcount == TIFF_VARIABLE2");
}

void TIFFFetchNormalTag_cold_78()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 7391, "fip->field_passcount == 1");
}

void TIFFFetchNormalTag_cold_79()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 7390, "fip->field_readcount == TIFF_VARIABLE2");
}

void TIFFFetchNormalTag_cold_80()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 7438, "fip->field_passcount == 1");
}

void TIFFFetchNormalTag_cold_81()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 7437, "fip->field_readcount == TIFF_VARIABLE2");
}

void TIFFFetchNormalTag_cold_82()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 7462, "fip->field_passcount == 1");
}

void TIFFFetchNormalTag_cold_83()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 7461, "fip->field_readcount == TIFF_VARIABLE2");
}

void TIFFFetchNormalTag_cold_84()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 7486, "fip->field_passcount == 1");
}

void TIFFFetchNormalTag_cold_85()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 7485, "fip->field_readcount == TIFF_VARIABLE2");
}

void TIFFFetchNormalTag_cold_86()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 7510, "fip->field_passcount == 1");
}

void TIFFFetchNormalTag_cold_87()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 7509, "fip->field_readcount == TIFF_VARIABLE2");
}

void TIFFFetchNormalTag_cold_88()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 7534, "fip->field_passcount == 1");
}

void TIFFFetchNormalTag_cold_89()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 7533, "fip->field_readcount == TIFF_VARIABLE2");
}

void TIFFFetchNormalTag_cold_90()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 7558, "fip->field_passcount == 1");
}

void TIFFFetchNormalTag_cold_91()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 7557, "fip->field_readcount == TIFF_VARIABLE2");
}

void TIFFFetchNormalTag_cold_92()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 7582, "fip->field_passcount == 1");
}

void TIFFFetchNormalTag_cold_93()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 7581, "fip->field_readcount == TIFF_VARIABLE2");
}

void TIFFFetchNormalTag_cold_94()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 7606, "fip->field_passcount == 1");
}

void TIFFFetchNormalTag_cold_95()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 7605, "fip->field_readcount == TIFF_VARIABLE2");
}

void TIFFFetchNormalTag_cold_96()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 7630, "fip->field_passcount == 1");
}

void TIFFFetchNormalTag_cold_97()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 7629, "fip->field_readcount == TIFF_VARIABLE2");
}

void TIFFFetchNormalTag_cold_98()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 7654, "fip->field_passcount == 1");
}

void TIFFFetchNormalTag_cold_99()
{
  __assert_rtn("TIFFFetchNormalTag", "tif_dirread.c", 7653, "fip->field_readcount == TIFF_VARIABLE2");
}

void TIFFReadDirEntryOutputErr_cold_1()
{
}

void TIFFReadDirEntryOutputErr_cold_2()
{
}

void ChopUpSingleUncompressedStrip_cold_1()
{
  __assert_rtn("ChopUpSingleUncompressedStrip", "tif_dirread.c", 7932, "td->td_planarconfig == PLANARCONFIG_CONTIG");
}

void TryChopUpUncompressedBigTiff_cold_1()
{
}

void TryChopUpUncompressedBigTiff_cold_2()
{
  __assert_rtn("TryChopUpUncompressedBigTiff", "tif_dirread.c", 8054, "stripbytes <= 0x7FFFFFFFUL");
}

void TryChopUpUncompressedBigTiff_cold_3()
{
  __assert_rtn("TryChopUpUncompressedBigTiff", "tif_dirread.c", 8001, "(tif->tif_flags & (TIFF_STRIPCHOP | TIFF_ISTILED)) == TIFF_STRIPCHOP");
}

void TryChopUpUncompressedBigTiff_cold_4()
{
  __assert_rtn("TryChopUpUncompressedBigTiff", "tif_dirread.c", 7999, "tif->tif_dir.td_compression == COMPRESSION_NONE");
}

void TryChopUpUncompressedBigTiff_cold_5()
{
  __assert_rtn("TryChopUpUncompressedBigTiff", "tif_dirread.c", 7998, "tif->tif_dir.td_planarconfig == PLANARCONFIG_CONTIG");
}

void _TIFFGetStrileOffsetOrByteCountValue_cold_1()
{
}

void _TIFFGetStrileOffsetOrByteCountValue_cold_2()
{
}

void TIFFReadDirEntryData_cold_1()
{
}

void TIFFReadDirEntryArrayWithLimit_cold_1()
{
}

void TIFFReadDirEntryDataAndRealloc_cold_1()
{
}

void TIFFHashSetSize_cold_1()
{
  __assert_rtn("TIFFHashSetSize", "tif_hash_set.c", 182, "set != NULL");
}

void TIFFHashSetInsert_cold_1()
{
  __assert_rtn("TIFFHashSetInsert", "tif_hash_set.c", 442, "set != NULL");
}

void TIFFHashSetLookup_cold_1()
{
  __assert_rtn("TIFFHashSetLookup", "tif_hash_set.c", 504, "set != NULL");
}

void TIFFHashSetRemove_cold_1()
{
  __assert_rtn("TIFFHashSetRemoveInternal", "tif_hash_set.c", 519, "set != NULL");
}

uint64_t std::shared_ptr<IIOBaseObject>::shared_ptr[abi:ne180100]<IIOFrameBufferQueue,void>(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

void TIFFInitOJPEG_cold_1()
{
  __assert_rtn("TIFFInitOJPEG", "tif_ojpeg.c", 464, "scheme == COMPRESSION_OJPEG");
}

void OJPEGPreDecode_cold_1()
{
}

void OJPEGPreDecode_cold_2()
{
}

void OJPEGPreDecode_cold_3()
{
  __assert_rtn("OJPEGReadSecondarySos", "tif_ojpeg.c", 1271, "sp->sos_end[0].log != 0");
}

void OJPEGPreDecode_cold_4()
{
  __assert_rtn("OJPEGWriteHeaderInfo", "tif_ojpeg.c", 1369, "sp->subsampling_convert_ycbcrimage == 0");
}

void OJPEGPreDecode_cold_5()
{
  __assert_rtn("OJPEGWriteHeaderInfo", "tif_ojpeg.c", 1368, "sp->subsampling_convert_ycbcrbuf == 0");
}

void OJPEGPreDecode_cold_6()
{
  __assert_rtn("OJPEGReadSecondarySos", "tif_ojpeg.c", 1272, "sp->sos_end[s].log == 0");
}

void OJPEGPreDecode_cold_7()
{
  __assert_rtn("OJPEGReadHeaderInfo", "tif_ojpeg.c", 1186, "sp->readheader_done == 0");
}

void OJPEGPostDecode_cold_1()
{
  __assert_rtn("OJPEGPostDecode", "tif_ojpeg.c", 997, "sp->libjpeg_session_active != 0");
}

void OJPEGDecode_cold_1()
{
}

void OJPEGDecode_cold_2()
{
}

void OJPEGPrintDir_cold_1()
{
  __assert_rtn("OJPEGPrintDir", "tif_ojpeg.c", 658, "sp != NULL");
}

void OJPEGSubsamplingCorrect_cold_1()
{
  __assert_rtn("OJPEGSubsamplingCorrect", "tif_ojpeg.c", 1104, "sp->subsamplingcorrect_done == 0");
}

void OJPEGReadHeaderInfoSec_cold_1()
{
}

void OJPEGReadHeaderInfoSec_cold_2()
{
  __assert_rtn("OJPEGReadHeaderInfoSec", "tif_ojpeg.c", 1600, "sp->plane_sample_offset == 0");
}

void OJPEGReadByte_cold_1()
{
}

void OJPEGReadHeaderInfoSecStreamSos_cold_1()
{
  __assert_rtn("OJPEGReadHeaderInfoSecStreamSos", "tif_ojpeg.c", 1980, "sp->subsamplingcorrect == 0");
}

void OJPEGReadBufferFill_cold_1()
{
}

void OJPEGReadBufferFill_cold_2()
{
  __assert_rtn("OJPEGReadBufferFill", "tif_ojpeg.c", 2242, "n <= OJPEG_BUFFER");
}

void OJPEGReadBufferFill_cold_3()
{
  __assert_rtn("OJPEGReadBufferFill", "tif_ojpeg.c", 2244, "(uint64_t)n <= sp->in_buffer_file_togo");
}

void OJPEGReadBlock_cold_1()
{
}

void OJPEGReadBlock_cold_2()
{
}

void OJPEGLibjpegSessionAbort_cold_1()
{
  __assert_rtn("OJPEGLibjpegSessionAbort", "tif_ojpeg.c", 1492, "sp->libjpeg_session_active != 0");
}

void OJPEGLibjpegJpegSourceMgrFillInputBuffer_cold_1()
{
  __assert_rtn("OJPEGWriteStream", "tif_ojpeg.c", 2420, "sp->out_state <= ososEoi");
}

void OJPEGLibjpegJpegSourceMgrFillInputBuffer_cold_2()
{
  __assert_rtn("OJPEGWriteStreamSof", "tif_ojpeg.c", 2556, "255 >= 8 + sp->samples_per_pixel_per_plane * 3");
}

void OJPEGLibjpegJpegSourceMgrFillInputBuffer_cold_3()
{
  __assert_rtn("OJPEGWriteStreamSos", "tif_ojpeg.c", 2593, "255 >= 6 + sp->samples_per_pixel_per_plane * 2");
}

void OJPEGLibjpegJpegSourceMgrFillInputBuffer_cold_4()
{
}

void TIFFGrowStrips_cold_1()
{
  __assert_rtn("TIFFGrowStrips", "tif_write.c", 728, "td->td_planarconfig == PLANARCONFIG_CONTIG");
}

void TIFFAppendToStrip_cold_1()
{
}

void TIFFPredictorInit_cold_1()
{
  __assert_rtn("TIFFPredictorInit", "tif_predict.c", 1058, "sp != 0");
}

void TIFFPredictorCleanup_cold_1()
{
  __assert_rtn("TIFFPredictorCleanup", "tif_predict.c", 1098, "sp != 0");
}

void PredictorDecodeRow_cold_1()
{
  __assert_rtn("PredictorDecodeRow", "tif_predict.c", 611, "sp != NULL");
}

void PredictorDecodeRow_cold_2()
{
  __assert_rtn("PredictorDecodeRow", "tif_predict.c", 612, "sp->decoderow != NULL");
}

void PredictorDecodeRow_cold_3()
{
  __assert_rtn("PredictorDecodeRow", "tif_predict.c", 613, "sp->decodepfunc != NULL");
}

void PredictorDecodeTile_cold_1()
{
  __assert_rtn("PredictorDecodeTile", "tif_predict.c", 635, "sp != NULL");
}

void PredictorDecodeTile_cold_2()
{
  __assert_rtn("PredictorDecodeTile", "tif_predict.c", 636, "sp->decodetile != NULL");
}

void PredictorDecodeTile_cold_3()
{
}

void PredictorDecodeTile_cold_4()
{
  __assert_rtn("PredictorDecodeTile", "tif_predict.c", 648, "sp->decodepfunc != NULL");
}

void PredictorEncodeRow_cold_1()
{
  __assert_rtn("PredictorEncodeRow", "tif_predict.c", 911, "sp != NULL");
}

void PredictorEncodeRow_cold_2()
{
  __assert_rtn("PredictorEncodeRow", "tif_predict.c", 912, "sp->encodepfunc != NULL");
}

void PredictorEncodeRow_cold_3()
{
  __assert_rtn("PredictorEncodeRow", "tif_predict.c", 913, "sp->encoderow != NULL");
}

void PredictorEncodeTile_cold_1()
{
  __assert_rtn("PredictorEncodeTile", "tif_predict.c", 931, "sp != NULL");
}

void PredictorEncodeTile_cold_2()
{
  __assert_rtn("PredictorEncodeTile", "tif_predict.c", 932, "sp->encodepfunc != NULL");
}

void PredictorEncodeTile_cold_3()
{
  __assert_rtn("PredictorEncodeTile", "tif_predict.c", 933, "sp->encodetile != NULL");
}

void PredictorEncodeTile_cold_4()
{
}

void TIFFWriteDirectorySec_cold_1()
{
}

void TIFFWriteDirectorySec_cold_2()
{
  __assert_rtn("TIFFWriteDirectorySec", "tif_dirwrite.c", 893, "o->field_passcount == 0");
}

void TIFFWriteDirectorySec_cold_3()
{
  __assert_rtn("TIFFWriteDirectorySec", "tif_dirwrite.c", 892, "o->field_readcount == TIFF_VARIABLE");
}

void TIFFWriteDirectorySec_cold_4()
{
  __assert_rtn("TIFFWriteDirectorySec", "tif_dirwrite.c", 891, "o->field_type == TIFF_ASCII");
}

void TIFFWriteDirectorySec_cold_5()
{
  __assert_rtn("TIFFWriteDirectorySec", "tif_dirwrite.c", 907, "o->field_passcount == 0");
}

void TIFFWriteDirectorySec_cold_6()
{
  __assert_rtn("TIFFWriteDirectorySec", "tif_dirwrite.c", 906, "o->field_readcount == 1");
}

void TIFFWriteDirectorySec_cold_7()
{
  __assert_rtn("TIFFWriteDirectorySec", "tif_dirwrite.c", 905, "o->field_type == TIFF_SHORT");
}

void TIFFWriteDirectorySec_cold_8()
{
  __assert_rtn("TIFFWriteDirectorySec", "tif_dirwrite.c", 920, "o->field_passcount == 0");
}

void TIFFWriteDirectorySec_cold_9()
{
  __assert_rtn("TIFFWriteDirectorySec", "tif_dirwrite.c", 919, "o->field_readcount == 1");
}

void TIFFWriteDirectorySec_cold_10()
{
  __assert_rtn("TIFFWriteDirectorySec", "tif_dirwrite.c", 918, "o->field_type == TIFF_LONG");
}

void TIFFWriteDirectorySec_cold_11()
{
  __assert_rtn("TIFFWriteDirectorySec", "tif_dirwrite.c", 934, "o->field_passcount == 1");
}

void TIFFWriteDirectorySec_cold_12()
{
  __assert_rtn("TIFFWriteDirectorySec", "tif_dirwrite.c", 933, "o->field_readcount == TIFF_VARIABLE2");
}

void TIFFWriteDirectorySec_cold_13()
{
  __assert_rtn("TIFFWriteDirectorySec", "tif_dirwrite.c", 932, "o->field_type == TIFF_UNDEFINED");
}

void TIFFWriteDirectorySec_cold_14()
{
  __assert_rtn("TIFFWriteDirectoryTagSubifd", "tif_dirwrite.c", 2165, "pa != 0");
}

void TIFFWriteDirectoryTagSshortArray_cold_1()
{
}

void TIFFWriteDirectoryTagFloatArray_cold_1()
{
}

void TIFFWriteDirectoryTagDoubleArray_cold_1()
{
}

void TIFFWriteDirectoryTagData_cold_1()
{
  __assert_rtn("TIFFWriteDirectoryTagData", "tif_dirwrite.c", 2989, "dir[m].tdir_tag != tag");
}

void TIFFWriteDirectoryTagCheckedShortArray_cold_1()
{
}

void TIFFWriteDirectoryTagCheckedLong8Array_cold_1()
{
}

void TIFFWriteDirectoryTagCheckedLongArray_cold_1()
{
}

void TIFFWriteDirectoryTagCheckedIfdArray_cold_1()
{
}

void TIFFWriteDirectoryTagCheckedIfd8Array_cold_1()
{
}

void TIFFWriteDirectoryTagCheckedIfd8Array_cold_2()
{
}

void TIFFWriteDirectoryTagCheckedSlongArray_cold_1()
{
}

void TIFFWriteDirectoryTagCheckedSlong8Array_cold_1()
{
}

void _TIFFVSetField_cold_1()
{
  __assert_rtn("_TIFFVSetField", "tif_dir.c", 785, "fip->field_writecount == TIFF_VARIABLE2");
}

void _TIFFVSetField_cold_2()
{
}

void _TIFFVSetField_cold_3()
{
  __assert_rtn("_TIFFVSetField", "tif_dir.c", 914, "tv->count == 1");
}

void _TIFFVGetField_cold_1()
{
  __assert_rtn("_TIFFVGetField", "tif_dir.c", 1511, "tv->count == 1");
}

void decode_etc2()
{
  __assert_rtn("decode_etc2_planar", "DecompressorETC.cpp", 606, "data.mode == ETC_Data::Mode_Planar");
}

{
  __assert_rtn("get_partition", "DecompressorETC.cpp", 532, "data.mode == ETC_Data::Mode_ETC1");
}

{
  __assert_rtn("get_diff_subblock_palette", "DecompressorETC.cpp", 484, "table_idx < 8");
}

{
  __assert_rtn("get_diff_subblock_palette", "DecompressorETC.cpp", 498, "table_idx < 8");
}

void nv::decompress_eac()
{
}

void get_abs_subblock_palette()
{
}

void DumpModeEncode_cold_1()
{
}

void _TIFFFax3fillruns_cold_1()
{
  __assert_rtn("_TIFFFax3fillruns", "tif_fax3.c", 485, "x == lastx");
}

void Fax3VGetField_cold_1()
{
  __assert_rtn("Fax3VGetField", "tif_fax3.c", 1323, "sp != 0");
}

void Fax3VSetField_cold_1()
{
  __assert_rtn("Fax3VSetField", "tif_fax3.c", 1276, "sp != 0");
}

void Fax3VSetField_cold_2()
{
  __assert_rtn("Fax3VSetField", "tif_fax3.c", 1277, "sp->vsetparent != 0");
}

void Fax3PrintDir_cold_1()
{
  __assert_rtn("Fax3PrintDir", "tif_fax3.c", 1356, "sp != 0");
}

void Fax3PreDecode_cold_1()
{
  __assert_rtn("Fax3PreDecode", "tif_fax3.c", 169, "sp != NULL");
}

void Fax3PreEncode_cold_1()
{
  __assert_rtn("Fax3PreEncode", "tif_fax3.c", 790, "sp != NULL");
}

void Fax3Encode_cold_1()
{
}

void Fax3Encode_cold_2()
{
}

void Fax3Cleanup_cold_1()
{
  __assert_rtn("Fax3Cleanup", "tif_fax3.c", 1227, "sp != 0");
}

void putspan_cold_1()
{
}

void putspan_cold_2()
{
}

void putspan_cold_3()
{
  __assert_rtn("putspan", "tif_fax3.c", 714, "te->runlen == 64 * (span >> 6)");
}

void putspan_cold_4()
{
}

void Fax3PutBits_cold_1()
{
}

void _cg_TIFFReadScanline_cold_1()
{
  __assert_rtn("TIFFFillStripPartial", "tif_read.c", 266, "(tif->tif_flags & TIFF_BUFFERMMAP) == 0");
}

void _cg_TIFFReadScanline_cold_2()
{
  __assert_rtn("TIFFFillStripPartial", "tif_read.c", 248, "(tif->tif_flags & TIFF_BUFFERMMAP) == 0");
}

void TIFFReadRawStrip1_cold_1()
{
  __assert_rtn("TIFFReadRawStrip1", "tif_read.c", 611, "(tif->tif_flags & TIFF_NOREADRAW) == 0");
}

void TIFFReadBufferSetup_cold_1()
{
  __assert_rtn("TIFFReadBufferSetup", "tif_read.c", 1374, "(tif->tif_flags & TIFF_NOREADRAW) == 0");
}

void TIFFReadRawStripOrTile2_cold_1()
{
  __assert_rtn("TIFFReadRawStripOrTile2", "tif_read.c", 674, "(tif->tif_flags & TIFF_NOREADRAW) == 0");
}

void TIFFReadRawStripOrTile2_cold_2()
{
}

void TIFFReadRawTile1_cold_1()
{
  __assert_rtn("TIFFReadRawTile1", "tif_read.c", 1117, "(tif->tif_flags & TIFF_NOREADRAW) == 0");
}

void _TIFFSwab16BitData_cold_1()
{
  __assert_rtn("_TIFFSwab16BitData", "tif_read.c", 1657, "(cc & 1) == 0");
}

void _TIFFSwab24BitData_cold_1()
{
  __assert_rtn("_TIFFSwab24BitData", "tif_read.c", 1664, "(cc % 3) == 0");
}

void _TIFFSwab32BitData_cold_1()
{
  __assert_rtn("_TIFFSwab32BitData", "tif_read.c", 1671, "(cc & 3) == 0");
}

void _TIFFSwab64BitData_cold_1()
{
  __assert_rtn("_TIFFSwab64BitData", "tif_read.c", 1678, "(cc & 7) == 0");
}

void TIFFReadAndRealloc_cold_1()
{
  __assert_rtn("TIFFReadAndRealloc", "tif_read.c", 100, "(tif->tif_flags & TIFF_MYBUFFER) != 0");
}

void TIFFWritePlugin::writeOne(unsigned __int16 a1, int a2)
{
  *gCrashMessage = 0;
  snprintf(gCrashMessage, 0x200uLL, "TIFF issue: bpc: %d compress: %d\n", a2, a1);
  qword_1EB2BF498 = gCrashMessage;
  abort();
}

void TIFFInitPixarLog_cold_1()
{
  __assert_rtn("TIFFInitPixarLog", "tif_pixarlog.c", 1611, "scheme == COMPRESSION_PIXARLOG");
}

void PixarLogSetupDecode_cold_1()
{
  __assert_rtn("PixarLogSetupDecode", "tif_pixarlog.c", 747, "sp != NULL");
}

void PixarLogSetupDecode_cold_2()
{
  __assert_rtn("add_ms", "tif_pixarlog.c", 723, "m1 >= 0 && m2 >= 0");
}

void PixarLogPreDecode_cold_1()
{
  __assert_rtn("PixarLogPreDecode", "tif_pixarlog.c", 819, "sp != NULL");
}

void PixarLogSetupEncode_cold_1()
{
  __assert_rtn("PixarLogSetupEncode", "tif_pixarlog.c", 1001, "sp != NULL");
}

void PixarLogPreEncode_cold_1()
{
  __assert_rtn("PixarLogPreEncode", "tif_pixarlog.c", 1051, "sp != NULL");
}

void PixarLogClose_cold_1()
{
  __assert_rtn("PixarLogClose", "tif_pixarlog.c", 1450, "sp != 0");
}

void PixarLogCleanup_cold_1()
{
  __assert_rtn("PixarLogCleanup", "tif_pixarlog.c", 1479, "sp != 0");
}

void TIFFInitZIP_cold_1()
{
  __assert_rtn("TIFFInitZIP", "tif_zip.c", 687, "(scheme == COMPRESSION_DEFLATE) || (scheme == COMPRESSION_ADOBE_DEFLATE)");
}

void ZIPSetupDecode_cold_1()
{
  __assert_rtn("ZIPSetupDecode", "tif_zip.c", 106, "sp != NULL");
}

void ZIPPreDecode_cold_1()
{
  __assert_rtn("ZIPPreDecode", "tif_zip.c", 139, "sp != NULL");
}

void ZIPDecode_cold_1()
{
  __assert_rtn("ZIPDecode", "tif_zip.c", 169, "sp != NULL");
}

void ZIPDecode_cold_2()
{
  __assert_rtn("ZIPDecode", "tif_zip.c", 170, "sp->state == ZSTATE_INIT_DECODE");
}

void ZIPSetupEncode_cold_1()
{
  __assert_rtn("ZIPSetupEncode", "tif_zip.c", 321, "sp != NULL");
}

void ZIPPreEncode_cold_1()
{
  __assert_rtn("ZIPPreEncode", "tif_zip.c", 352, "sp != NULL");
}

void ZIPEncode_cold_1()
{
  __assert_rtn("ZIPEncode", "tif_zip.c", 378, "sp != NULL");
}

void ZIPEncode_cold_2()
{
  __assert_rtn("ZIPEncode", "tif_zip.c", 379, "sp->state == ZSTATE_INIT_ENCODE");
}

void ZIPCleanup_cold_1()
{
  __assert_rtn("ZIPCleanup", "tif_zip.c", 556, "sp != 0");
}

void IIOXPCClient::connection_set_event_handler()
{
}

void ___ZN12IIOXPCClient18wakeup_xpc_serviceEv_block_invoke_cold_1()
{
  __assert_rtn("wakeup_xpc_service_block_invoke", "IIOXPCClient.cpp", 524, "event_queue != NULL");
}

void mj2_video_source::get_stream_idx()
{
}

void mj2_source::get_track_type()
{
  __assert_rtn("get_track_type", "mj2.cpp", 3191, "state != NULL");
}

void mj2_source::access_video_track()
{
  __assert_rtn("access_video_track", "mj2.cpp", 3211, "state != NULL");
}

void TIFFInitSGILog_cold_1()
{
  __assert_rtn("TIFFInitSGILog", "tif_luv.c", 1787, "scheme == COMPRESSION_SGILOG24 || scheme == COMPRESSION_SGILOG");
}

void LogLuvDecodeStrip_cold_1()
{
  __assert_rtn("LogLuvDecodeStrip", "tif_luv.c", 398, "cc % rowlen == 0");
}

void LogLuvDecodeTile_cold_1()
{
  __assert_rtn("LogLuvDecodeTile", "tif_luv.c", 419, "cc % rowlen == 0");
}

void LogLuvEncodeStrip_cold_1()
{
  __assert_rtn("LogLuvEncodeStrip", "tif_luv.c", 721, "cc % rowlen == 0");
}

void LogLuvEncodeTile_cold_1()
{
  __assert_rtn("LogLuvEncodeTile", "tif_luv.c", 741, "cc % rowlen == 0");
}

void LogLuvClose_cold_1()
{
  __assert_rtn("LogLuvClose", "tif_luv.c", 1659, "sp != 0");
}

void LogLuvCleanup_cold_1()
{
  __assert_rtn("LogLuvCleanup", "tif_luv.c", 1683, "sp != 0");
}

void LogLuvInitState_cold_1()
{
  __assert_rtn("LogLuvInitState", "tif_luv.c", 1454, "sp != NULL");
}

void LogLuvInitState_cold_2()
{
  __assert_rtn("LogLuvInitState", "tif_luv.c", 1455, "td->td_photometric == PHOTOMETRIC_LOGLUV");
}

void LogLuvDecode24_cold_1()
{
  __assert_rtn("LogLuvDecode24", "tif_luv.c", 271, "sp != NULL");
}

void LogLuvDecode24_cold_2()
{
  __assert_rtn("LogLuvDecode24", "tif_luv.c", 270, "s == 0");
}

void LogLuvDecode32_cold_1()
{
  __assert_rtn("LogLuvDecode32", "tif_luv.c", 328, "sp != NULL");
}

void LogLuvDecode32_cold_2()
{
  __assert_rtn("LogLuvDecode32", "tif_luv.c", 326, "s == 0");
}

void LogL16InitState_cold_1()
{
  __assert_rtn("LogL16InitState", "tif_luv.c", 1349, "sp != NULL");
}

void LogL16InitState_cold_2()
{
  __assert_rtn("LogL16InitState", "tif_luv.c", 1350, "td->td_photometric == PHOTOMETRIC_LOGL");
}

void LogL16Decode_cold_1()
{
  __assert_rtn("LogL16Decode", "tif_luv.c", 198, "sp != NULL");
}

void LogL16Decode_cold_2()
{
  __assert_rtn("LogL16Decode", "tif_luv.c", 197, "s == 0");
}

void LogLuvEncode24_cold_1()
{
  __assert_rtn("LogLuvEncode24", "tif_luv.c", 556, "sp != NULL");
}

void LogLuvEncode24_cold_2()
{
  __assert_rtn("LogLuvEncode24", "tif_luv.c", 555, "s == 0");
}

void LogLuvEncode32_cold_1()
{
  __assert_rtn("LogLuvEncode32", "tif_luv.c", 616, "sp != NULL");
}

void LogLuvEncode32_cold_2()
{
  __assert_rtn("LogLuvEncode32", "tif_luv.c", 615, "s == 0");
}

void LogL16Encode_cold_1()
{
  __assert_rtn("LogL16Encode", "tif_luv.c", 448, "sp != NULL");
}

void LogL16Encode_cold_2()
{
  __assert_rtn("LogL16Encode", "tif_luv.c", 447, "s == 0");
}

void GlobalGIFInfo::GlobalGIFInfo(uint64_t a1, void **a2)
{
  uint64_t v4 = *(std::__shared_weak_count **)(a1 + 168);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  uint64_t v5 = *a2;
  if (*a2)
  {
    *(void *)(a1 + 144) = v5;
    operator delete(v5);
  }
}

void GlobalICNSInfo::GlobalICNSInfo(void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    OUTLINED_FUNCTION_0(v2, (uint64_t)a1);
  }
}

void kdu_image_in::AllocateSrcLineBuffer()
{
}

void kdu_image_in::DeallocateSrcLineBuffer()
{
  __assert_rtn("DeallocateSrcLineBuffer", "kdu_image.h", 106, "mSrcLineBuffer != NULL");
}

void TIFFInitLZW_cold_1()
{
  __assert_rtn("TIFFInitLZW", "tif_lzw.c", 1444, "scheme == COMPRESSION_LZW");
}

void LZWPreDecode_cold_1()
{
  __assert_rtn("LZWPreDecode", "tif_lzw.c", 285, "sp != NULL");
}

void LZWDecode_cold_1()
{
  __assert_rtn("LZWDecode", "tif_lzw.c", 461, "sp != NULL");
}

void LZWDecode_cold_2()
{
  __assert_rtn("LZWDecode", "tif_lzw.c", 462, "sp->dec_codetab != NULL");
}

void LZWSetupEncode_cold_1()
{
  __assert_rtn("LZWSetupEncode", "tif_lzw.c", 1075, "sp != NULL");
}

void LZWPreEncode_cold_1()
{
  __assert_rtn("LZWPreEncode", "tif_lzw.c", 1093, "sp != NULL");
}

void LZWPostEncode_cold_1()
{
  __assert_rtn("LZWPostEncode", "tif_lzw.c", 1384, "nbits <= BITS_MAX");
}

void LZWEncode_cold_1()
{
  __assert_rtn("LZWEncode", "tif_lzw.c", 1178, "sp->enc_hashtab != NULL");
}

void LZWEncode_cold_2()
{
  __assert_rtn("LZWEncode", "tif_lzw.c", 1292, "nbits <= BITS_MAX");
}

void LZWCleanup_cold_1()
{
  __assert_rtn("LZWCleanup", "tif_lzw.c", 1426, "tif->tif_data != 0");
}

void LZWDecodeCompat_cold_1()
{
  __assert_rtn("LZWDecodeCompat", "tif_lzw.c", 859, "sp != NULL");
}

void TIFFInitJPEG_cold_1()
{
  __assert_rtn("TIFFInitJPEG", "tif_jpeg.c", 2832, "scheme == COMPRESSION_JPEG");
}

void JPEGVGetField_cold_1()
{
  __assert_rtn("JPEGVGetField", "tif_jpeg.c", 2637, "sp != NULL");
}

void JPEGVSetField_cold_1()
{
  __assert_rtn("JPEGVSetField", "tif_jpeg.c", 2579, "sp != NULL");
}

void JPEGPrintDir_cold_1()
{
  __assert_rtn("JPEGPrintDir", "tif_jpeg.c", 2664, "sp != NULL");
}

void JPEGSetupDecode_cold_1()
{
  __assert_rtn("JPEGSetupDecode", "tif_jpeg.c", 1088, "sp != NULL");
}

void JPEGSetupDecode_cold_2()
{
}

void JPEGPreDecode_cold_1()
{
  __assert_rtn("JPEGPreDecode", "tif_jpeg.c", 1171, "sp != NULL");
}

void JPEGPreDecode_cold_2()
{
}

void JPEGSetupEncode_cold_1()
{
  __assert_rtn("JPEGSetupEncode", "tif_jpeg.c", 1927, "sp != NULL");
}

void JPEGSetupEncode_cold_2()
{
}

void JPEGPreEncode_cold_1()
{
  __assert_rtn("JPEGPreEncode", "tif_jpeg.c", 2155, "sp != NULL");
}

void JPEGPreEncode_cold_2()
{
}

void JPEGEncode_cold_1()
{
  __assert_rtn("JPEGEncode", "tif_jpeg.c", 2320, "sp != NULL");
}

void JPEGCleanup_cold_1()
{
  __assert_rtn("JPEGCleanup", "tif_jpeg.c", 2520, "sp != 0");
}

void JPEGFixupTagsSubsamplingReadByte_cold_1()
{
}

void BuildMapUaToAa_cold_1()
{
  __assert_rtn("BuildMapUaToAa", "tif_getimage.c", 3175, "img->UaToAa == NULL");
}

void BuildMapBitdepth16To8_cold_1()
{
  __assert_rtn("BuildMapBitdepth16To8", "tif_getimage.c", 3196, "img->Bitdepth16To8 == NULL");
}

void _TIFFreallocExt_cold_1()
{
  __assert_rtn("_TIFFreallocExt", "tif_open.c", 242, "oldSize <= tif->tif_cur_cumulated_mem_alloc");
}

void _TIFFfreeExt_cold_1()
{
  __assert_rtn("_TIFFfreeExt", "tif_open.c", 273, "oldSize <= tif->tif_cur_cumulated_mem_alloc");
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x1F40C9718](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x1F40C9720](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9728](c, data, *(void *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFAllocatorRef CFAllocatorCreate(CFAllocatorRef allocator, CFAllocatorContext *context)
{
  return (CFAllocatorRef)MEMORY[0x1F40D70F8](allocator, context);
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1F40D7160](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1F40D7170](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x1F40D7178](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7198](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

void CFArrayGetValues(CFArrayRef theArray, CFRange range, const void **values)
{
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

CFAttributedStringRef CFAttributedStringCreate(CFAllocatorRef alloc, CFStringRef str, CFDictionaryRef attributes)
{
  return (CFAttributedStringRef)MEMORY[0x1F40D7240](alloc, str, attributes);
}

CFAttributedStringRef CFAttributedStringCreateWithSubstring(CFAllocatorRef alloc, CFAttributedStringRef aStr, CFRange range)
{
  return (CFAttributedStringRef)MEMORY[0x1F40D7260](alloc, aStr, range.location, range.length);
}

CFIndex CFAttributedStringGetLength(CFAttributedStringRef aStr)
{
  return MEMORY[0x1F40D7298](aStr);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

void CFBagAddValue(CFMutableBagRef theBag, const void *value)
{
}

CFMutableBagRef CFBagCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFBagCallBacks *callBacks)
{
  return (CFMutableBagRef)MEMORY[0x1F40D7308](allocator, capacity, callBacks);
}

CFIndex CFBagGetCount(CFBagRef theBag)
{
  return MEMORY[0x1F40D7318](theBag);
}

CFTypeID CFBagGetTypeID(void)
{
  return MEMORY[0x1F40D7328]();
}

void CFBagGetValues(CFBagRef theBag, const void **values)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x1F40D7538](bundleID);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1F40D7568](bundle);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7578](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1F40D7598]();
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1F40D75D0](bundle, key);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x1F40D77A8](cf);
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return (CFStringRef)MEMORY[0x1F40D77D0](type_id);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

CFDataRef CFDataCreateCopy(CFAllocatorRef allocator, CFDataRef theData)
{
  return (CFDataRef)MEMORY[0x1F40D77F8](allocator, theData);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7808](allocator, capacity);
}

CFMutableDataRef CFDataCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDataRef theData)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7810](allocator, capacity, theData);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1F40D7818](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x1F40D7858](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1F40D7860]();
}

void CFDataIncreaseLength(CFMutableDataRef theData, CFIndex extraLength)
{
}

void CFDataReplaceBytes(CFMutableDataRef theData, CFRange range, const UInt8 *newBytes, CFIndex newLength)
{
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x1F40D78B0](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateStringWithDate(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFDateRef date)
{
  return (CFStringRef)MEMORY[0x1F40D78E0](allocator, formatter, date);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x1F40D7938]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1F40D7968](theDict, key);
}

Boolean CFDictionaryContainsValue(CFDictionaryRef theDict, const void *value)
{
  return MEMORY[0x1F40D7970](theDict, value);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7978](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7990](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D79A8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1F40D79C0](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1F40D7A18](theDict, key, value);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFStringRef CFErrorCopyFailureReason(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x1F40D7A88](err);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x1F40D7A98](allocator, domain, code, userInfo);
}

CFErrorRef CFErrorCreateWithUserInfoKeysAndValues(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, const void *const *userInfoKeys, const void *const *userInfoValues, CFIndex numUserInfoValues)
{
  return (CFErrorRef)MEMORY[0x1F40D7AA0](allocator, domain, code, userInfoKeys, userInfoValues, numUserInfoValues);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x1F40D7B60](cf);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B68](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1F40D7BA0](cf);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x1F40D7BB8]();
}

uint64_t CFLog()
{
  return MEMORY[0x1F40D7C50]();
}

CFTypeID CFNullGetTypeID(void)
{
  return MEMORY[0x1F40D7D68]();
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x1F40D7E08](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x1F40D7E30](number);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40D7F18](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F28](allocator, propertyList, mutabilityOption);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F50](allocator, data, options, format, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFReadStreamRef)MEMORY[0x1F40D7FB0](alloc, bytes, length, bytesDeallocator);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x1F40D7FF8](stream);
}

CFIndex CFReadStreamRead(CFReadStreamRef stream, UInt8 *buffer, CFIndex bufferLength)
{
  return MEMORY[0x1F40D8000](stream, buffer, bufferLength);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x1F40D81F8](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1F40D8210](allocator, capacity, callBacks);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x1F40D8220](theSet);
}

CFTypeID CFSetGetTypeID(void)
{
  return MEMORY[0x1F40D8230]();
}

void CFSetGetValues(CFSetRef theSet, const void **values)
{
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
}

void CFShow(CFTypeRef obj)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x1F40D83D0](alloc, theString, separatorString);
}

CFStringRef CFStringCreateByCombiningStrings(CFAllocatorRef alloc, CFArrayRef theArray, CFStringRef separatorString)
{
  return (CFStringRef)MEMORY[0x1F40D83E0](alloc, theArray, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1F40D83F0](alloc, theString);
}

CFStringRef CFStringCreateFromExternalRepresentation(CFAllocatorRef alloc, CFDataRef data, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8400](alloc, data, *(void *)&encoding);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8408](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8410](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1F40D8438](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1F40D8440](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation, contentsDeallocator);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return (CFStringRef)MEMORY[0x1F40D8478](alloc, buffer);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x1F40D8498](alloc, formatOptions, format, arguments);
}

CFStringRef CFStringCreateWithPascalString(CFAllocatorRef alloc, ConstStr255Param pStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D84A0](alloc, pStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1F40D84A8](alloc, str, range.location, range.length);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3 = MEMORY[0x1F40D84C8](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

CFIndex CFStringFindAndReplace(CFMutableStringRef theString, CFStringRef stringToFind, CFStringRef replacementString, CFRange rangeToSearch, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D84D0](theString, stringToFind, replacementString, rangeToSearch.location, rangeToSearch.length, compareOptions);
}

Boolean CFStringFindWithOptions(CFStringRef theString, CFStringRef stringToFind, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x1F40D84E0](theString, stringToFind, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1F40D8500](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x1F40D8528](theString, idx);
}

double CFStringGetDoubleValue(CFStringRef str)
{
  MEMORY[0x1F40D8548](str);
  return result;
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1F40D8558](string, buffer, maxBufLen);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x1F40D8568](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8590](length, *(void *)&encoding);
}

CFIndex CFStringGetMaximumSizeOfFileSystemRepresentation(CFStringRef string)
{
  return MEMORY[0x1F40D85A0](string);
}

CFStringEncoding CFStringGetSystemEncoding(void)
{
  return MEMORY[0x1F40D85E0]();
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1F40D8600](theString, prefix);
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x1F40D8608](theString, suffix);
}

void CFStringInsert(CFMutableStringRef str, CFIndex idx, CFStringRef insertedStr)
{
}

Boolean CFStringIsEncodingAvailable(CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8638](*(void *)&encoding);
}

void CFStringReplaceAll(CFMutableStringRef theString, CFStringRef replacement)
{
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return (CFURLRef)MEMORY[0x1F40D8740](relativeURL);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x1F40D8758](anURL, pathStyle);
}

CFStringRef CFURLCopyPathExtension(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x1F40D8798](url);
}

Boolean CFURLCopyResourcePropertyForKey(CFURLRef url, CFStringRef key, void *propertyValueTypeRefPtr, CFErrorRef *error)
{
  return MEMORY[0x1F40D87B0](url, key, propertyValueTypeRefPtr, error);
}

CFStringRef CFURLCopyScheme(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1F40D87C0](anURL);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D88A0](allocator, filePath, pathStyle, isDirectory);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1F40D8908](url, resolveAgainstBase, buffer, maxBufLen);
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x1F40D8928]();
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x1F40D89A0](alloc, *(void *)&bytes.byte0, *(void *)&bytes.byte8);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
}

CFErrorRef CFWriteStreamCopyError(CFWriteStreamRef stream)
{
  return (CFErrorRef)MEMORY[0x1F40D8A88](stream);
}

CFTypeRef CFWriteStreamCopyProperty(CFWriteStreamRef stream, CFStreamPropertyKey propertyName)
{
  return (CFTypeRef)MEMORY[0x1F40D8A90](stream, propertyName);
}

CFWriteStreamRef CFWriteStreamCreateWithAllocatedBuffers(CFAllocatorRef alloc, CFAllocatorRef bufferAllocator)
{
  return (CFWriteStreamRef)MEMORY[0x1F40D8AA0](alloc, bufferAllocator);
}

CFWriteStreamRef CFWriteStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFWriteStreamRef)MEMORY[0x1F40D8AB0](alloc, fileURL);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x1F40D8AD0](stream);
}

CFIndex CFWriteStreamWrite(CFWriteStreamRef stream, const UInt8 *buffer, CFIndex bufferLength)
{
  return MEMORY[0x1F40D8B08](stream, buffer, bufferLength);
}

uint64_t CGAccessSessionCreate()
{
  return MEMORY[0x1F40D9760]();
}

uint64_t CGAccessSessionGetBytePointer()
{
  return MEMORY[0x1F40D9768]();
}

uint64_t CGAccessSessionGetBytes()
{
  return MEMORY[0x1F40D9770]();
}

uint64_t CGAccessSessionRelease()
{
  return MEMORY[0x1F40D9778]();
}

uint64_t CGAccessSessionRewind()
{
  return MEMORY[0x1F40D9780]();
}

uint64_t CGAccessSessionSkipForward()
{
  return MEMORY[0x1F40D9788]();
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9790](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D8](retstr, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1F40D9818](context);
}

uint64_t CGBitmapContextCreateWithAlpha()
{
  return MEMORY[0x1F40D9820]();
}

uint64_t CGBitmapContextCreateWithDictionary()
{
  return MEMORY[0x1F40D9838]();
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x1F40D9868](context);
}

CGColorConversionInfoRef CGColorConversionInfoCreate(CGColorSpaceRef src, CGColorSpaceRef dst)
{
  return (CGColorConversionInfoRef)MEMORY[0x1F40D9940](src, dst);
}

CGColorConversionInfoRef CGColorConversionInfoCreateWithOptions(CGColorSpaceRef src, CGColorSpaceRef dst, CFDictionaryRef options)
{
  return (CGColorConversionInfoRef)MEMORY[0x1F40D9950](src, dst, options);
}

uint64_t CGColorConversionInfoIterateFunctionsWithCallbacks()
{
  return MEMORY[0x1F40D9968]();
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1F40D9970](space, components);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  MEMORY[0x1F40D99F0](color);
  return result;
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D99F8](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1F40D9A00](color);
}

CFTypeID CGColorGetTypeID(void)
{
  return MEMORY[0x1F40D9A30]();
}

uint64_t CGColorMatrixGetMatrix()
{
  return MEMORY[0x1F40D9A38]();
}

uint64_t CGColorNxMTransformGetTransform()
{
  return MEMORY[0x1F40D9A48]();
}

void CGColorRelease(CGColorRef color)
{
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x1F40D9A60](color);
}

uint64_t CGColorSpaceContainsFlexGTCInfo()
{
  return MEMORY[0x1F40D9A68]();
}

uint64_t CGColorSpaceCopyBaseColorSpace()
{
  return MEMORY[0x1F40D9A70]();
}

uint64_t CGColorSpaceCopyColorSyncProfile()
{
  return MEMORY[0x1F40D9A78]();
}

uint64_t CGColorSpaceCopyColorTable()
{
  return MEMORY[0x1F40D9A80]();
}

uint64_t CGColorSpaceCopyFlexGTCInfo()
{
  return MEMORY[0x1F40D9A88]();
}

uint64_t CGColorSpaceCopyFromIOSurface()
{
  return MEMORY[0x1F40D9A90]();
}

CFDataRef CGColorSpaceCopyICCData(CGColorSpaceRef space)
{
  return (CFDataRef)MEMORY[0x1F40D9A98](space);
}

uint64_t CGColorSpaceCopyICCProfileDescription()
{
  return MEMORY[0x1F40D9AB0]();
}

CFStringRef CGColorSpaceCopyName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x1F40D9AB8](space);
}

CFPropertyListRef CGColorSpaceCopyPropertyList(CGColorSpaceRef space)
{
  return (CFPropertyListRef)MEMORY[0x1F40D9AC0](space);
}

CGColorSpaceRef CGColorSpaceCreateCopyWithStandardRange(CGColorSpaceRef s)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AE0](s);
}

CGColorSpaceRef CGColorSpaceCreateDeviceCMYK(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AE8]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF0]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

CGColorSpaceRef CGColorSpaceCreateExtended(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B00](space);
}

CGColorSpaceRef CGColorSpaceCreateExtendedLinearized(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B08](space);
}

uint64_t CGColorSpaceCreateFromCICP()
{
  return MEMORY[0x1F40D9B10]();
}

CGColorSpaceRef CGColorSpaceCreateIndexed(CGColorSpaceRef baseSpace, size_t lastIndex, const unsigned __int8 *colorTable)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B20](baseSpace, lastIndex, colorTable);
}

CGColorSpaceRef CGColorSpaceCreateLab(const CGFloat *whitePoint, const CGFloat *blackPoint, const CGFloat *range)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B28](whitePoint, blackPoint, range);
}

CGColorSpaceRef CGColorSpaceCreateLinearized(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B30](space);
}

CGColorSpaceRef CGColorSpaceCreateWithColorSyncProfile(ColorSyncProfileRef a1, CFDictionaryRef options)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B40](a1, options);
}

CGColorSpaceRef CGColorSpaceCreateWithICCData(CFTypeRef data)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B48](data);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B60](name);
}

CGColorSpaceRef CGColorSpaceCreateWithPropertyList(CFPropertyListRef plist)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B70](plist);
}

uint64_t CGColorSpaceEqualToColorSpace()
{
  return MEMORY[0x1F40D9B78]();
}

CGColorSpaceRef CGColorSpaceGetBaseColorSpace(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B90](space);
}

uint64_t CGColorSpaceGetCICPInfo()
{
  return MEMORY[0x1F40D9B98]();
}

void CGColorSpaceGetColorTable(CGColorSpaceRef space, uint8_t *table)
{
}

size_t CGColorSpaceGetColorTableCount(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BB8](space);
}

uint64_t CGColorSpaceGetHeadroomInfo()
{
  return MEMORY[0x1F40D9BC0]();
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BE0](space);
}

CFStringRef CGColorSpaceGetName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x1F40D9BE8](space);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BF0](space);
}

uint64_t CGColorSpaceGetRenderingIntent()
{
  return MEMORY[0x1F40D9C00]();
}

uint64_t CGColorSpaceGetType()
{
  return MEMORY[0x1F40D9C08]();
}

CFTypeID CGColorSpaceGetTypeID(void)
{
  return MEMORY[0x1F40D9C10]();
}

BOOL CGColorSpaceIsHDR(CGColorSpaceRef a1)
{
  return MEMORY[0x1F40D9C18](a1);
}

BOOL CGColorSpaceIsHLGBased(CGColorSpaceRef s)
{
  return MEMORY[0x1F40D9C20](s);
}

BOOL CGColorSpaceIsPQBased(CGColorSpaceRef s)
{
  return MEMORY[0x1F40D9C30](s);
}

BOOL CGColorSpaceIsWideGamutRGB(CGColorSpaceRef a1)
{
  return MEMORY[0x1F40D9C40](a1);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

CGColorSpaceRef CGColorSpaceRetain(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9C50](space);
}

BOOL CGColorSpaceSupportsOutput(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9C58](space);
}

BOOL CGColorSpaceUsesExtendedRange(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9C60](space);
}

BOOL CGColorSpaceUsesITUR_2100TF(CGColorSpaceRef a1)
{
  return MEMORY[0x1F40D9C68](a1);
}

uint64_t CGColorTRCGetFunction()
{
  return MEMORY[0x1F40D9C70]();
}

uint64_t CGColorTRCGetGammaID()
{
  return MEMORY[0x1F40D9C78]();
}

uint64_t CGColorTransformConvertColorComponents()
{
  return MEMORY[0x1F40D9C98]();
}

uint64_t CGColorTransformCreate()
{
  return MEMORY[0x1F40D9CA8]();
}

void CGContextAddArc(CGContextRef c, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, int clockwise)
{
}

void CGContextAddCurveToPoint(CGContextRef c, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextAddQuadCurveToPoint(CGContextRef c, CGFloat cpx, CGFloat cpy, CGFloat x, CGFloat y)
{
}

void CGContextBeginPage(CGContextRef c, const CGRect *mediaBox)
{
}

uint64_t CGContextClear()
{
  return MEMORY[0x1F40D9D30]();
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
}

void CGContextClosePath(CGContextRef c)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

uint64_t CGContextDrawImageWithOptions()
{
  return MEMORY[0x1F40D9E98]();
}

void CGContextDrawPDFPage(CGContextRef c, CGPDFPageRef page)
{
}

uint64_t CGContextDrawPDFPageWithAnnotations()
{
  return MEMORY[0x1F40D9EC0]();
}

void CGContextEndPage(CGContextRef c)
{
}

uint64_t CGContextErase()
{
  return MEMORY[0x1F40D9F20]();
}

void CGContextFillPath(CGContextRef c)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextFlush(CGContextRef c)
{
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

uint64_t CGContextSetEDRTargetHeadroom()
{
  return MEMORY[0x1F40DA108]();
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetGrayFillColor(CGContextRef c, CGFloat gray, CGFloat alpha)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

uint64_t CGContextSetInterpolationQualityRange()
{
  return MEMORY[0x1F40DA178]();
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
}

void CGContextSetRGBStrokeColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
}

void CGContextSetShouldSmoothFonts(CGContextRef c, BOOL shouldSmoothFonts)
{
}

uint64_t CGContextSetTextGreekingThreshold()
{
  return MEMORY[0x1F40DA238]();
}

void CGContextSetTextMatrix(CGContextRef c, CGAffineTransform *t)
{
}

void CGContextSetTextPosition(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

void CGContextStrokeRect(CGContextRef c, CGRect rect)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGDataConsumerRef CGDataConsumerCreate(void *info, const CGDataConsumerCallbacks *cbks)
{
  return (CGDataConsumerRef)MEMORY[0x1F40DA2B8](info, cbks);
}

CGDataConsumerRef CGDataConsumerCreateWithCFData(CFMutableDataRef data)
{
  return (CGDataConsumerRef)MEMORY[0x1F40DA2C0](data);
}

CGDataConsumerRef CGDataConsumerCreateWithURL(CFURLRef url)
{
  return (CGDataConsumerRef)MEMORY[0x1F40DA2C8](url);
}

CFTypeID CGDataConsumerGetTypeID(void)
{
  return MEMORY[0x1F40DA2D0]();
}

uint64_t CGDataConsumerPutBytes()
{
  return MEMORY[0x1F40DA2D8]();
}

void CGDataConsumerRelease(CGDataConsumerRef consumer)
{
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return (CFDataRef)MEMORY[0x1F40DA2E8](provider);
}

CGDataProviderRef CGDataProviderCreateDirect(void *info, off_t size, const CGDataProviderDirectCallbacks *callbacks)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA2F0](info, size, callbacks);
}

CGDataProviderRef CGDataProviderCreateSequential(void *info, const CGDataProviderSequentialCallbacks *callbacks)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA2F8](info, callbacks);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA300](data);
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA310](info, data, size, releaseData);
}

CGDataProviderRef CGDataProviderCreateWithURL(CFURLRef url)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA320](url);
}

uint64_t CGDataProviderGetBytes()
{
  return MEMORY[0x1F40DA328]();
}

uint64_t CGDataProviderGetBytesAtPosition()
{
  return MEMORY[0x1F40DA330]();
}

uint64_t CGDataProviderGetSizeOfData()
{
  return MEMORY[0x1F40DA338]();
}

CFTypeID CGDataProviderGetTypeID(void)
{
  return MEMORY[0x1F40DA340]();
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

uint64_t CGDataProviderReleaseBytePtr()
{
  return MEMORY[0x1F40DA350]();
}

CGDataProviderRef CGDataProviderRetain(CGDataProviderRef provider)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA358](provider);
}

uint64_t CGDataProviderRetainBytePtr()
{
  return MEMORY[0x1F40DA360]();
}

uint64_t CGDataProviderRewind()
{
  return MEMORY[0x1F40DA368]();
}

uint64_t CGGetMD5DigestOfBytes()
{
  return MEMORY[0x1F40DA720]();
}

uint64_t CGImageBlockCreate()
{
  return MEMORY[0x1F40DA7E8]();
}

uint64_t CGImageBlockGetBytesPerRow()
{
  return MEMORY[0x1F40DA7F0]();
}

uint64_t CGImageBlockGetData()
{
  return MEMORY[0x1F40DA7F8]();
}

uint64_t CGImageBlockGetRect()
{
  return MEMORY[0x1F40DA800]();
}

uint64_t CGImageBlockRelease()
{
  return MEMORY[0x1F40DA808]();
}

uint64_t CGImageBlockSetCreate()
{
  return MEMORY[0x1F40DA810]();
}

uint64_t CGImageBlockSetCreateWithType()
{
  return MEMORY[0x1F40DA818]();
}

uint64_t CGImageBlockSetGetComponentType()
{
  return MEMORY[0x1F40DA820]();
}

uint64_t CGImageBlockSetGetCount()
{
  return MEMORY[0x1F40DA828]();
}

uint64_t CGImageBlockSetGetImageBlock()
{
  return MEMORY[0x1F40DA830]();
}

uint64_t CGImageBlockSetGetPixelSize()
{
  return MEMORY[0x1F40DA838]();
}

uint64_t CGImageBlockSetGetProperty()
{
  return MEMORY[0x1F40DA840]();
}

uint64_t CGImageBlockSetGetRect()
{
  return MEMORY[0x1F40DA848]();
}

uint64_t CGImageBlockSetRelease()
{
  return MEMORY[0x1F40DA850]();
}

uint64_t CGImageBlockSetSetProperty()
{
  return MEMORY[0x1F40DA860]();
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1F40DA868](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
}

uint64_t CGImageCreateCopyWithClipPath()
{
  return MEMORY[0x1F40DA878]();
}

CGImageRef CGImageCreateCopyWithColorSpace(CGImageRef image, CGColorSpaceRef space)
{
  return (CGImageRef)MEMORY[0x1F40DA880](image, space);
}

uint64_t CGImageCreateWithImageProvider()
{
  return MEMORY[0x1F40DA898]();
}

uint64_t CGImageDumpToFile()
{
  return MEMORY[0x1F40DA8C0]();
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x1F40DA8D0](image);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x1F40DA8D8](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x1F40DA8E0](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x1F40DA8E8](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x1F40DA8F0](image);
}

uint64_t CGImageGetClipPath()
{
  return MEMORY[0x1F40DA900]();
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1F40DA908](image);
}

uint64_t CGImageGetContentHeadroom()
{
  return MEMORY[0x1F40DA910]();
}

uint64_t CGImageGetData()
{
  return MEMORY[0x1F40DA918]();
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA920](image);
}

const CGFloat *__cdecl CGImageGetDecode(CGImageRef image)
{
  return (const CGFloat *)MEMORY[0x1F40DA928](image);
}

uint64_t CGImageGetHeadroomInfo()
{
  return MEMORY[0x1F40DA940]();
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

uint64_t CGImageGetImageProvider()
{
  return MEMORY[0x1F40DA958]();
}

uint64_t CGImageGetMask()
{
  return MEMORY[0x1F40DA960]();
}

uint64_t CGImageGetMaskingColors()
{
  return MEMORY[0x1F40DA968]();
}

uint64_t CGImageGetProperty()
{
  return MEMORY[0x1F40DA980]();
}

CGColorRenderingIntent CGImageGetRenderingIntent(CGImageRef image)
{
  return MEMORY[0x1F40DA988](image);
}

BOOL CGImageGetShouldInterpolate(CGImageRef image)
{
  return MEMORY[0x1F40DA990](image);
}

uint64_t CGImageGetTransformForOrientationAndSize()
{
  return MEMORY[0x1F40DA9A0]();
}

CFTypeID CGImageGetTypeID(void)
{
  return MEMORY[0x1F40DA9A8]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

uint64_t CGImageHasAlpha()
{
  return MEMORY[0x1F40DA9C0]();
}

uint64_t CGImageIOSurfaceSetCreate()
{
  return MEMORY[0x1F40DA9C8]();
}

BOOL CGImageIsMask(CGImageRef image)
{
  return MEMORY[0x1F40DA9D0](image);
}

uint64_t CGImageIsOptimizedForSharing()
{
  return MEMORY[0x1F40DA9D8]();
}

uint64_t CGImageProviderCopyIOSurface()
{
  return MEMORY[0x1F40DA9F8]();
}

uint64_t CGImageProviderCopyImageBlockSetWithOptions()
{
  return MEMORY[0x1F40DAA08]();
}

uint64_t CGImageProviderCreate()
{
  return MEMORY[0x1F40DAA18]();
}

uint64_t CGImageProviderGetAlphaInfo()
{
  return MEMORY[0x1F40DAA20]();
}

uint64_t CGImageProviderGetBitmapInfo()
{
  return MEMORY[0x1F40DAA28]();
}

uint64_t CGImageProviderGetCallbackVersion()
{
  return MEMORY[0x1F40DAA30]();
}

uint64_t CGImageProviderGetColorSpace()
{
  return MEMORY[0x1F40DAA38]();
}

uint64_t CGImageProviderGetComponentType()
{
  return MEMORY[0x1F40DAA40]();
}

uint64_t CGImageProviderGetContentHeadroom()
{
  return MEMORY[0x1F40DAA48]();
}

uint64_t CGImageProviderGetInfo()
{
  return MEMORY[0x1F40DAA50]();
}

uint64_t CGImageProviderGetPixelSize()
{
  return MEMORY[0x1F40DAA58]();
}

uint64_t CGImageProviderGetProperty()
{
  return MEMORY[0x1F40DAA60]();
}

uint64_t CGImageProviderGetSize()
{
  return MEMORY[0x1F40DAA68]();
}

uint64_t CGImageProviderRelease()
{
  return MEMORY[0x1F40DAA70]();
}

uint64_t CGImageProviderSetContentHeadroom()
{
  return MEMORY[0x1F40DAA80]();
}

uint64_t CGImageProviderSetProperty()
{
  return MEMORY[0x1F40DAA88]();
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1F40DAA98](image);
}

uint64_t CGImageSetHeadroom()
{
  return MEMORY[0x1F40DAAA8]();
}

uint64_t CGImageSetProperty()
{
  return MEMORY[0x1F40DAAB0]();
}

uint64_t CGImageSurfaceSetGetIOSurface()
{
  return MEMORY[0x1F40DAAB8]();
}

uint64_t CGImageTextureDataCreate()
{
  return MEMORY[0x1F40DAAC0]();
}

uint64_t CGImageTextureDataGetNumberOfFaces()
{
  return MEMORY[0x1F40DAAD0]();
}

uint64_t CGImageTextureDataGetNumberOfMipmaps()
{
  return MEMORY[0x1F40DAAD8]();
}

uint64_t CGImageTextureDataGetPixelFormat()
{
  return MEMORY[0x1F40DAAE8]();
}

uint64_t CGImageTextureDataGetSize()
{
  return MEMORY[0x1F40DAAF0]();
}

uint64_t CGImageTextureDataIsCompressed()
{
  return MEMORY[0x1F40DAAF8]();
}

uint64_t CGImageTextureDataSupportsTiledLayout()
{
  return MEMORY[0x1F40DAB10]();
}

void CGPDFContextBeginPage(CGContextRef context, CFDictionaryRef pageInfo)
{
}

void CGPDFContextClose(CGContextRef context)
{
}

CGContextRef CGPDFContextCreate(CGDataConsumerRef consumer, const CGRect *mediaBox, CFDictionaryRef auxiliaryInfo)
{
  return (CGContextRef)MEMORY[0x1F40DABC0](consumer, mediaBox, auxiliaryInfo);
}

void CGPDFContextEndPage(CGContextRef context)
{
}

uint64_t CGPDFDocumentCopyInfoDictionary()
{
  return MEMORY[0x1F40DAC30]();
}

CGPDFDocumentRef CGPDFDocumentCreateWithProvider(CGDataProviderRef provider)
{
  return (CGPDFDocumentRef)MEMORY[0x1F40DAC48](provider);
}

CGPDFAccessPermissions CGPDFDocumentGetAccessPermissions(CGPDFDocumentRef document)
{
  return MEMORY[0x1F40DAC58](document);
}

size_t CGPDFDocumentGetNumberOfPages(CGPDFDocumentRef document)
{
  return MEMORY[0x1F40DAC88](document);
}

CGPDFPageRef CGPDFDocumentGetPage(CGPDFDocumentRef document, size_t pageNumber)
{
  return (CGPDFPageRef)MEMORY[0x1F40DAC90](document, pageNumber);
}

BOOL CGPDFDocumentIsEncrypted(CGPDFDocumentRef document)
{
  return MEMORY[0x1F40DACA0](document);
}

BOOL CGPDFDocumentIsUnlocked(CGPDFDocumentRef document)
{
  return MEMORY[0x1F40DACB0](document);
}

void CGPDFDocumentRelease(CGPDFDocumentRef document)
{
}

uint64_t CGPDFPageContainsWideGamutContent()
{
  return MEMORY[0x1F40DAD68]();
}

CGRect CGPDFPageGetBoxRect(CGPDFPageRef page, CGPDFBox box)
{
  MEMORY[0x1F40DAD80](page, *(void *)&box);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

int CGPDFPageGetRotationAngle(CGPDFPageRef page)
{
  return MEMORY[0x1F40DADB8](page);
}

uint64_t CGPDFSourceRead()
{
  return MEMORY[0x1F40DAF40]();
}

uint64_t CGPDFSourceRelease()
{
  return MEMORY[0x1F40DAF48]();
}

void CGPathAddCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1F40DB068]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

CGPathRef CGPathRetain(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x1F40DB178](path);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB230]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x1F40DB238]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB2C8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

CFDictionaryRef CGSizeCreateDictionaryRepresentation(CGSize size)
{
  return (CFDictionaryRef)MEMORY[0x1F40DB4C8]((__n128)size, *(__n128 *)&size.height);
}

uint64_t ColorSyncCreateInputPoppyProfile()
{
  return MEMORY[0x1F40D6538]();
}

uint64_t ColorSyncCreateOutputPoppyProfileForRGBData()
{
  return MEMORY[0x1F40D6540]();
}

uint64_t ColorSyncDataCanBeIgnoredOnSRGBDevice()
{
  return MEMORY[0x1F40D6548]();
}

uint64_t ColorSyncMakeProfile()
{
  return MEMORY[0x1F40D6558]();
}

CFDataRef ColorSyncProfileCopyData(ColorSyncProfileRef prof, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40D6560](prof, error);
}

ColorSyncProfileRef ColorSyncProfileCreate(CFDataRef data, CFErrorRef *error)
{
  return (ColorSyncProfileRef)MEMORY[0x1F40D6578](data, error);
}

uint64_t ColorSyncProfileCreateCopyWithFlexGTC()
{
  return MEMORY[0x1F40D6580]();
}

uint64_t ColorSyncProfileCreateSanitizedCopy()
{
  return MEMORY[0x1F40D6598]();
}

BOOL ColorSyncProfileVerify(ColorSyncProfileRef prof, CFErrorRef *errors, CFErrorRef *warnings)
{
  return MEMORY[0x1F40D65C8](prof, errors, warnings);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1F40E8F60](*(void *)&object);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9208](*(void *)&entry, plane, key, allocator, *(void *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1F40E9250](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E9268](name);
}

uint64_t IOSurfaceAcceleratorCreate()
{
  return MEMORY[0x1F4124C48]();
}

uint64_t IOSurfaceAcceleratorTransformSurface()
{
  return MEMORY[0x1F4124C78]();
}

CFDictionaryRef IOSurfaceCopyAllValues(IOSurfaceRef buffer)
{
  return (CFDictionaryRef)MEMORY[0x1F40E92F8](buffer);
}

CFTypeRef IOSurfaceCopyValue(IOSurfaceRef buffer, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1F40E9300](buffer, key);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x1F40E9308](properties);
}

xpc_object_t IOSurfaceCreateXPCObject(IOSurfaceRef aSurface)
{
  return (xpc_object_t)MEMORY[0x1F40E9328](aSurface);
}

void IOSurfaceDecrementUseCount(IOSurfaceRef buffer)
{
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9350](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x1F40E9358](buffer);
}

void *__cdecl IOSurfaceGetBaseAddressOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return (void *)MEMORY[0x1F40E9380](buffer, planeIndex);
}

uint64_t IOSurfaceGetBulkAttachments()
{
  return MEMORY[0x1F40E9388]();
}

size_t IOSurfaceGetBytesPerElementOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x1F40E93A0](buffer, planeIndex);
}

size_t IOSurfaceGetBytesPerRow(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E93A8](buffer);
}

size_t IOSurfaceGetBytesPerRowOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x1F40E93B8](buffer, planeIndex);
}

uint64_t IOSurfaceGetCompressionTypeOfPlane()
{
  return MEMORY[0x1F40E93F0]();
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9440](buffer);
}

size_t IOSurfaceGetHeightOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x1F40E9450](buffer, planeIndex);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9480](buffer);
}

size_t IOSurfaceGetPlaneCount(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9488](buffer);
}

uint64_t IOSurfaceGetProtectionOptions()
{
  return MEMORY[0x1F40E94A8]();
}

IOSurfaceComponentRange IOSurfaceGetRangeOfComponentOfPlane(IOSurfaceRef buffer, size_t planeIndex, size_t componentIndex)
{
  return MEMORY[0x1F40E94B0](buffer, planeIndex, componentIndex);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E94F8](buffer);
}

size_t IOSurfaceGetWidthOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x1F40E9508](buffer, planeIndex);
}

uint64_t IOSurfaceGetYCbCrMatrix()
{
  return MEMORY[0x1F40E9510]();
}

void IOSurfaceIncrementUseCount(IOSurfaceRef buffer)
{
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1F40E9540](buffer, *(void *)&options, seed);
}

IOSurfaceRef IOSurfaceLookupFromXPCObject(xpc_object_t xobj)
{
  return (IOSurfaceRef)MEMORY[0x1F40E9560](xobj);
}

void IOSurfaceRemoveValue(IOSurfaceRef buffer, CFStringRef key)
{
}

uint64_t IOSurfaceSetBulkAttachments2()
{
  return MEMORY[0x1F40E95A0]();
}

uint64_t IOSurfaceSetOwnershipIdentity()
{
  return MEMORY[0x1F40E95D0]();
}

void IOSurfaceSetValue(IOSurfaceRef buffer, CFStringRef key, CFTypeRef value)
{
}

uint64_t IOSurfaceSetYCbCrMatrix()
{
  return MEMORY[0x1F40E95F8]();
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1F40E9630](buffer, *(void *)&options, seed);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1F40EDE08]();
}

uint64_t MTLPixelFormatGetInfoForDevice()
{
  return MEMORY[0x1F40EDE40]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
}

XML_Status XML_Parse(XML_Parser parser, const char *s, int len, int isFinal)
{
  return MEMORY[0x1F417F628](parser, s, *(void *)&len, *(void *)&isFinal);
}

XML_Parser XML_ParserCreateNS(const XML_Char *encoding, XML_Char namespaceSeparator)
{
  return (XML_Parser)MEMORY[0x1F417F630](encoding, namespaceSeparator);
}

void XML_ParserFree(XML_Parser parser)
{
}

void XML_SetCdataSectionHandler(XML_Parser parser, XML_StartCdataSectionHandler start, XML_EndCdataSectionHandler end)
{
}

void XML_SetCharacterDataHandler(XML_Parser parser, XML_CharacterDataHandler handler)
{
}

void XML_SetCommentHandler(XML_Parser parser, XML_CommentHandler handler)
{
}

void XML_SetElementHandler(XML_Parser parser, XML_StartElementHandler start, XML_EndElementHandler end)
{
}

void XML_SetNamespaceDeclHandler(XML_Parser parser, XML_StartNamespaceDeclHandler start, XML_EndNamespaceDeclHandler end)
{
}

void XML_SetProcessingInstructionHandler(XML_Parser parser, XML_ProcessingInstructionHandler handler)
{
}

void XML_SetUserData(XML_Parser parser, void *userData)
{
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

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1F40D90D0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1F40D90E8]();
}

uint64_t _CFStringGetFileSystemRepresentation()
{
  return MEMORY[0x1F40D9158]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1F40D9438]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1F40D9450]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::string::size_type std::string::find(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x1F417E380](this, __c, __pos);
}

std::string::size_type std::string::rfind(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x1F417E388](this, __c, __pos);
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

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1F417E588](__n);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E5A0](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1F417E5B8](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E5C0](this, __s, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E5C8](this, __str, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x1F417E5D0](this, __n, __c);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1F417E5D8](this, __s);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E5E0](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E5E8](this, __str, __pos, __n);
}

std::string *__cdecl std::string::assign(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x1F417E5F0](this, __n, __c);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1F417E600](this, __pos, __s);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

std::string *__cdecl std::string::replace(std::string *this, std::string::size_type __pos, std::string::size_type __n1, const std::string::value_type *__s, std::string::size_type __n2)
{
  return (std::string *)MEMORY[0x1F417E628](this, __pos, __n1, __s, __n2);
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x1F417E660](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1F417E670](this, __str);
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x1F417E7A0]();
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
  return MEMORY[0x1F417E880]();
}

{
  return MEMORY[0x1F417E890]();
}

{
  return MEMORY[0x1F417E898]();
}

{
  return MEMORY[0x1F417E8A0]();
}

{
  return MEMORY[0x1F417E8C8]();
}

{
  return MEMORY[0x1F417E8D0]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x1F417E940]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1F417E978]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1F417E980]();
}

void std::condition_variable::notify_all(std::condition_variable *this)
{
}

void std::condition_variable::wait(std::condition_variable *this, std::unique_lock<std::mutex> *__lk)
{
}

void std::condition_variable::~condition_variable(std::condition_variable *this)
{
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

void std::__throw_system_error(int __ev, const char *__what_arg)
{
}

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::mutex::~mutex(std::mutex *this)
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

std::bad_alloc *__cdecl std::bad_alloc::bad_alloc(std::bad_alloc *this)
{
  return (std::bad_alloc *)MEMORY[0x1F417EEC8](this);
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

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

uint64_t __CFSetLastAllocationEventName()
{
  return MEMORY[0x1F40D95A0]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x1F40C9B60](lpfunc, obj, lpdso_handle);
}

void __cxa_bad_cast(void)
{
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_call_unexpected(void *a1)
{
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void *__cxa_get_exception_ptr(void *a1)
{
  return (void *)MEMORY[0x1F417EF70](a1);
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

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x1F417EFA8](lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

simd_float3x3 __invert_f3(simd_float3x3 a1)
{
  MEMORY[0x1F40C9BF8]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2]);
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1F40C9C18](*(void *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1F40C9C28]();
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x1F40C9C88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x1F40C9CA0](a1, *(void *)&a2, a3, a4);
}

uint64_t __strncat_chk()
{
  return MEMORY[0x1F40C9CE0]();
}

uint64_t _amkrtemp()
{
  return MEMORY[0x1F40C9D40]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
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

simd_float4 _simd_exp2_f4(simd_float4 x)
{
  MEMORY[0x1F40CA158]((__n128)x);
  return result;
}

simd_float4 _simd_exp_f4(simd_float4 x)
{
  MEMORY[0x1F40CA160]((__n128)x);
  return result;
}

simd_float4 _simd_log2_f4(simd_float4 x)
{
  MEMORY[0x1F40CA170]((__n128)x);
  return result;
}

simd_float4 _simd_log_f4(simd_float4 x)
{
  MEMORY[0x1F40CA178]((__n128)x);
  return result;
}

simd_float4 _simd_pow_f4(simd_float4 x, simd_float4 y)
{
  MEMORY[0x1F40CA188]((__n128)x, (__n128)y);
  return result;
}

uint64_t _xpc_runtime_is_app_sandboxed()
{
  return MEMORY[0x1F40CA1D8]();
}

void abort(void)
{
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1F40CA210](a1, *(void *)&a2);
}

uLong adler32(uLong adler, const Bytef *buf, uInt len)
{
  return MEMORY[0x1F4182BA0](adler, buf, *(void *)&len);
}

uint64_t applejpeg_decode_clear_options()
{
  return MEMORY[0x1F410A1A8]();
}

uint64_t applejpeg_decode_create()
{
  return MEMORY[0x1F410A1B8]();
}

uint64_t applejpeg_decode_destroy()
{
  return MEMORY[0x1F410A1C0]();
}

uint64_t applejpeg_decode_dump_ra_table()
{
  return MEMORY[0x1F410A1C8]();
}

uint64_t applejpeg_decode_get_chroma_subsampling()
{
  return MEMORY[0x1F410A1D0]();
}

uint64_t applejpeg_decode_get_image_info()
{
  return MEMORY[0x1F410A1D8]();
}

uint64_t applejpeg_decode_get_output_buffer_size()
{
  return MEMORY[0x1F410A1E0]();
}

uint64_t applejpeg_decode_get_output_dimensions()
{
  return MEMORY[0x1F410A1E8]();
}

uint64_t applejpeg_decode_get_precision()
{
  return MEMORY[0x1F410A1F8]();
}

uint64_t applejpeg_decode_get_qtables()
{
  return MEMORY[0x1F410A200]();
}

uint64_t applejpeg_decode_get_ra_table_sz()
{
  return MEMORY[0x1F410A208]();
}

uint64_t applejpeg_decode_get_segment_info()
{
  return MEMORY[0x1F410A210]();
}

uint64_t applejpeg_decode_image_all()
{
  return MEMORY[0x1F410A218]();
}

uint64_t applejpeg_decode_open_file()
{
  return MEMORY[0x1F410A220]();
}

uint64_t applejpeg_decode_set_option_buildindex()
{
  return MEMORY[0x1F410A248]();
}

uint64_t applejpeg_decode_set_option_crop()
{
  return MEMORY[0x1F410A250]();
}

uint64_t applejpeg_decode_set_option_error_fill()
{
  return MEMORY[0x1F410A258]();
}

uint64_t applejpeg_decode_set_option_force_app14()
{
  return MEMORY[0x1F410A260]();
}

uint64_t applejpeg_decode_set_option_mosquito_spray()
{
  return MEMORY[0x1F410A268]();
}

uint64_t applejpeg_decode_set_option_multithread()
{
  return MEMORY[0x1F410A270]();
}

uint64_t applejpeg_decode_set_option_outformat()
{
  return MEMORY[0x1F410A280]();
}

uint64_t applejpeg_decode_set_option_outsize()
{
  return MEMORY[0x1F410A288]();
}

uint64_t applejpeg_decode_set_option_stride()
{
  return MEMORY[0x1F410A290]();
}

uint64_t applejpeg_decode_set_ra_table()
{
  return MEMORY[0x1F410A2A8]();
}

uint64_t applejpeg_encode_create()
{
  return MEMORY[0x1F410A2B8]();
}

uint64_t applejpeg_encode_destroy()
{
  return MEMORY[0x1F410A2C0]();
}

uint64_t applejpeg_encode_image_row()
{
  return MEMORY[0x1F410A2D8]();
}

uint64_t applejpeg_encode_options_init()
{
  return MEMORY[0x1F410A2E0]();
}

uint64_t applejpeg_encode_set_options_file()
{
  return MEMORY[0x1F410A328]();
}

uint64_t applejpeg_encode_set_options_mem()
{
  return MEMORY[0x1F410A330]();
}

uint64_t applejpeg_recode_all_file()
{
  return MEMORY[0x1F410A338]();
}

uint64_t applejpeg_recode_clear_options()
{
  return MEMORY[0x1F410A340]();
}

uint64_t applejpeg_recode_close()
{
  return MEMORY[0x1F410A348]();
}

uint64_t applejpeg_recode_get_image_info()
{
  return MEMORY[0x1F410A350]();
}

uint64_t applejpeg_recode_open_file()
{
  return MEMORY[0x1F410A358]();
}

uint64_t applejpeg_recode_set_option_accelerated_resize()
{
  return MEMORY[0x1F410A360]();
}

uint64_t applejpeg_recode_set_option_aspect()
{
  return MEMORY[0x1F410A368]();
}

uint64_t applejpeg_recode_set_option_converter()
{
  return MEMORY[0x1F410A370]();
}

uint64_t applejpeg_recode_set_option_jpeg_quality()
{
  return MEMORY[0x1F410A390]();
}

uint64_t applejpeg_recode_set_option_jpeg_type()
{
  return MEMORY[0x1F410A398]();
}

uint64_t applejpeg_recode_set_option_orientation()
{
  return MEMORY[0x1F410A3A0]();
}

uint64_t applejpeg_recode_set_option_outsize()
{
  return MEMORY[0x1F410A3A8]();
}

uint64_t applejpeg_recode_set_option_skip_app0()
{
  return MEMORY[0x1F410A3B8]();
}

uint64_t applejpeg_resize_plugin_set_preferred_format()
{
  return MEMORY[0x1F410A3C0]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1F40CA440](a1, a2);
}

at_block_features_t at_block_get_features(at_block_format_t blockType, at_block_buffer_t *src, at_size_t validSize, size_t size, size_t *outSize, at_flags_t flags)
{
  return (at_block_features_t)MEMORY[0x1F417E270](blockType, src, *(void *)&validSize.x, *(void *)&validSize.z, size, outSize, flags);
}

float at_encoder_compress_texels(at_encoder_t encoder, const at_texel_region_t *src, const at_block_buffer_t *dest, float errorThreshold, at_flags_t flags)
{
  MEMORY[0x1F417E278](encoder, src, dest, flags, errorThreshold);
  return result;
}

at_encoder_t at_encoder_create(at_texel_format_t texelType, at_alpha_t texelAlphaType, at_block_format_t blockType, at_alpha_t blockAlphaType, const float *backgroundColor)
{
  return (at_encoder_t)MEMORY[0x1F417E280](texelType, *(void *)&texelAlphaType, blockType, *(void *)&blockAlphaType, backgroundColor);
}

at_error_t at_encoder_decompress_texels(at_encoder_t encoder, const at_block_buffer_t *src, const at_texel_region_t *dest, at_flags_t flags)
{
  return MEMORY[0x1F417E288](encoder, src, dest, flags);
}

at_size_t at_encoder_get_block_counts(at_encoder_t encoder, at_size_t imageSize)
{
  uint64_t v2 = MEMORY[0x1F417E290](encoder, *(void *)&imageSize.x, *(void *)&imageSize.z);
  result.CGFloat x = v2;
  result.CGFloat y = HIDWORD(v2);
  result.z = v3;
  return result;
}

size_t at_encoder_get_block_size(at_encoder_t encoder)
{
  return MEMORY[0x1F417E298](encoder);
}

BOOL at_encoder_is_compression_monolithic(at_encoder_t encoder, at_flags_t flags)
{
  return MEMORY[0x1F417E2A0](encoder, flags);
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x1F40CA460](__y, __x);
  return result;
}

double atof(const char *a1)
{
  MEMORY[0x1F40CA498](a1);
  return result;
}

int atoi(const char *a1)
{
  return MEMORY[0x1F40CA4A8](a1);
}

uint64_t atol(const char *a1)
{
  return MEMORY[0x1F40CA4B8](a1);
}

uint64_t atoll(const char *a1)
{
  return MEMORY[0x1F40CA4C8](a1);
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x1F40CA4F8](a1, *(void *)&a2);
}

void *__cdecl bsearch(const void *__key, const void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return (void *)MEMORY[0x1F40CA570](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
}

int cache_create(const char *name, const cache_attributes_t *attrs, cache_t **cache_out)
{
  return MEMORY[0x1F40CA5A8](name, attrs, cache_out);
}

int cache_get_and_retain(cache_t *cache, void *key, void **value_out)
{
  return MEMORY[0x1F40CA5C0](cache, key, value_out);
}

uintptr_t cache_hash_byte_string(const char *data, size_t bytes)
{
  return MEMORY[0x1F40CA5F8](data, bytes);
}

uint64_t cache_print()
{
  return MEMORY[0x1F40CA608]();
}

int cache_release_value(cache_t *cache, void *value)
{
  return MEMORY[0x1F40CA610](cache, value);
}

int cache_remove(cache_t *cache, void *key)
{
  return MEMORY[0x1F40CA618](cache, key);
}

int cache_set_and_retain(cache_t *cache, void *key, void *value, cache_cost_t cost)
{
  return MEMORY[0x1F40CA630](cache, key, value, cost);
}

void cblas_sgemv(const CBLAS_ORDER __Order, const CBLAS_TRANSPOSE __TransA, const int __M, const int __N, const float __alpha, const float *__A, const int __lda, const float *__X, const int __incX, const float __beta, float *__Y, const int __incY)
{
}

void cblas_ssyrk(const CBLAS_ORDER __Order, const CBLAS_UPLO __Uplo, const CBLAS_TRANSPOSE __Trans, const int __N, const int __K, const float __alpha, const float *__A, const int __lda, const float __beta, float *__C, const int __ldc)
{
}

float cbrtf(float a1)
{
  MEMORY[0x1F40CA690](a1);
  return result;
}

void clearerr(FILE *a1)
{
}

clock_t clock(void)
{
  return MEMORY[0x1F40CB3B8]();
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

size_t compression_encode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x1F417F0B0](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return MEMORY[0x1F417F0C0](stream);
}

compression_status compression_stream_init(compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return MEMORY[0x1F417F0D0](stream, *(void *)&operation, *(void *)&algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return MEMORY[0x1F417F0E0](stream, *(void *)&flags);
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return MEMORY[0x1F40CB438](*(void *)&a1, a2, a3);
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return MEMORY[0x1F4182BC0](crc, buf, *(void *)&len);
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x1F4182BD0](strm, *(void *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x1F4182BE0](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x1F4182BE8](strm, *(void *)&level, *(void *)&method, *(void *)&windowBits, *(void *)&memLevel, *(void *)&strategy, version, *(void *)&stream_size);
}

int deflateInit_(z_streamp strm, int level, const char *version, int stream_size)
{
  return MEMORY[0x1F4182BF0](strm, *(void *)&level, version, *(void *)&stream_size);
}

int deflateParams(z_streamp strm, int level, int strategy)
{
  return MEMORY[0x1F4182BF8](strm, *(void *)&level, *(void *)&strategy);
}

int deflateReset(z_streamp strm)
{
  return MEMORY[0x1F4182C08](strm);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1F40CBA10](buffer, size, queue, destructor);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1F40CBD50](label);
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x1F40CBDA0](a1, a2);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

uint64_t dyld_process_is_restricted()
{
  return MEMORY[0x1F40CBE98]();
}

void exit(int a1)
{
}

long double exp(long double __x)
{
  MEMORY[0x1F40CBFE0](__x);
  return result;
}

long double exp2(long double __x)
{
  MEMORY[0x1F40CBFE8](__x);
  return result;
}

float exp2f(float a1)
{
  MEMORY[0x1F40CBFF0](a1);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
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

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x1F40CC100](a1, *(void *)&a2, a3);
}

int fileno(FILE *a1)
{
  return MEMORY[0x1F40CC110](a1);
}

void flockfile(FILE *a1)
{
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC1C0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1F40CC1E8](*(void *)&a1, a2);
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

float frexpf(float a1, int *a2)
{
  MEMORY[0x1F40CC250](a2, a1);
  return result;
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x1F40CC290](a1, a2, *(void *)&a3);
}

int fseeko(FILE *__stream, off_t a2, int __whence)
{
  return MEMORY[0x1F40CC298](__stream, a2, *(void *)&__whence);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x1F40CC2E0](a1);
}

off_t ftello(FILE *__stream)
{
  return MEMORY[0x1F40CC2E8](__stream);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1F40CC2F0](*(void *)&a1, a2);
}

FILE *__cdecl funopen(const void *a1, int (__cdecl *a2)(void *, char *, int), int (__cdecl *a3)(void *, const char *, int), fpos_t (__cdecl *a4)(void *, fpos_t, int), int (__cdecl *a5)(void *))
{
  return (FILE *)MEMORY[0x1F40CC320](a1, a2, a3, a4, a5);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1F40CC360](a1, a2, a3, a4, *(void *)&a5);
}

int getc(FILE *a1)
{
  return MEMORY[0x1F40CC388](a1);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1F40CC3B0](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1F40CC4C0]();
}

tm *__cdecl gmtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1F40CC5B0](a1, a2);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x1F4182CB0](strm, *(void *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x1F4182CB8](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x1F4182CC8](strm, *(void *)&windowBits, version, *(void *)&stream_size);
}

int inflateInit_(z_streamp strm, const char *version, int stream_size)
{
  return MEMORY[0x1F4182CD8](strm, version, *(void *)&stream_size);
}

int inflateReset(z_streamp strm)
{
  return MEMORY[0x1F4182CE0](strm);
}

int inflateReset2(z_streamp strm, int windowBits)
{
  return MEMORY[0x1F4182CE8](strm, *(void *)&windowBits);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

long double ldexp(long double __x, int __e)
{
  MEMORY[0x1F40CC800](*(void *)&__e, __x);
  return result;
}

float ldexpf(float a1, int a2)
{
  MEMORY[0x1F40CC808](*(void *)&a2, a1);
  return result;
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x1F40CC868](a1);
}

long double log(long double __x)
{
  MEMORY[0x1F40CC878](__x);
  return result;
}

long double log2(long double __x)
{
  MEMORY[0x1F40CC8A8](__x);
  return result;
}

float log2f(float a1)
{
  MEMORY[0x1F40CC8B0](a1);
  return result;
}

float logf(float a1)
{
  MEMORY[0x1F40CC8C0](a1);
  return result;
}

void longjmp(jmp_buf a1, int a2)
{
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1F40CC8F8](*(void *)&a1, a2, *(void *)&a3);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1F40CC940](*(void *)&error_value);
}

kern_return_t mach_make_memory_entry_64(vm_map_t target_task, memory_object_size_t *size, memory_object_offset_t offset, vm_prot_t permission, mach_port_t *object_handle, mem_entry_name_port_t parent_entry)
{
  return MEMORY[0x1F40CC958](*(void *)&target_task, size, offset, *(void *)&permission, object_handle, *(void *)&parent_entry);
}

kern_return_t mach_memory_entry_ownership(mem_entry_name_port_t mem_entry, task_t owner, int ledger_tag, int ledger_flags)
{
  return MEMORY[0x1F40CC960](*(void *)&mem_entry, *(void *)&owner, *(void *)&ledger_tag, *(void *)&ledger_flags);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1F40CC9B8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

kern_return_t mach_vm_protect(vm_map_t target_task, mach_vm_address_t address, mach_vm_size_t size, BOOLean_t set_maximum, vm_prot_t new_protection)
{
  return MEMORY[0x1F40CCA90](*(void *)&target_task, address, size, *(void *)&set_maximum, *(void *)&new_protection);
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1F40CCB08](a1, a2, *(void *)&a3);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x1F40CCBA0](memptr, alignment, size, type_id);
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

void *__cdecl memmem(const void *__big, size_t __big_len, const void *__little, size_t __little_len)
{
  return (void *)MEMORY[0x1F40CCD00](__big, __big_len, __little, __little_len);
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

char *__cdecl mktemp(char *a1)
{
  return (char *)MEMORY[0x1F40CCE28](a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40CCE40](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE88](a1, a2);
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

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_release(void *object)
{
}

uint64_t os_simple_hash()
{
  return MEMORY[0x1F40CD568]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1F40CD648]();
}

void perror(const char *a1)
{
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  MEMORY[0x1F40CD828](a1, a2);
  return result;
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1F40CD830](*(void *)&__fd, __buf, __nbyte, a4);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1F40CD838](a1);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x1F40CD978](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x1F40CD980](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x1F40CD988](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x1F40CD990](a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x1F40CD9A8](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1F40CD9B8](a1, a2, a3, a4);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x1F40CDA38](a1, a2);
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

int pthread_mutex_trylock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA90](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1F40CDAA0](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1F40CDAA8](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x1F40CDAC0](a1, *(void *)&a2);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1F40CDAC8](a1, a2);
}

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  return MEMORY[0x1F40CDAE8](a1);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x1F40CDAF0](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1F40CDAF8](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1F40CDB10](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1F40CDB18](a1);
}

int putchar(int a1)
{
  return MEMORY[0x1F40CDBA8](*(void *)&a1);
}

int puts(const char *a1)
{
  return MEMORY[0x1F40CDBB8](a1);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
}

void qsort_r(void *__base, size_t __nel, size_t __width, void *a4, int (__cdecl *__compar)(void *, const void *, const void *))
{
}

int rand(void)
{
  return MEMORY[0x1F40CDC08]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1F40CDC50](*(void *)&a1, a2, a3);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1F40CDC88](__ptr, __size);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int rmdir(const char *a1)
{
  return MEMORY[0x1F40CDD90](a1);
}

uint64_t rootless_trusted_by_self_token()
{
  return MEMORY[0x1F40CDDB8]();
}

uint64_t rootless_verify_trusted_by_self_token()
{
  return MEMORY[0x1F40CDDC0]();
}

uint64_t sandbox_check()
{
  return MEMORY[0x1F40CDDD0]();
}

int setjmp(jmp_buf a1)
{
  return MEMORY[0x1F40CDF80](a1);
}

char *__cdecl setlocale(int a1, const char *a2)
{
  return (char *)MEMORY[0x1F40CDF90](*(void *)&a1, a2);
}

void siglongjmp(sigjmp_buf a1, int a2)
{
}

int sigsetjmp(sigjmp_buf a1, int a2)
{
  return MEMORY[0x1F40CE048](a1, *(void *)&a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0A0](a1, a2);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0D0](a1, a2);
}

int ssyev_(char *__jobz, char *__uplo, __CLPK_integer *__n, __CLPK_real *__a, __CLPK_integer *__lda, __CLPK_real *__w, __CLPK_real *__work, __CLPK_integer *__lwork, __CLPK_integer *__info)
{
  return MEMORY[0x1F40D1910](__jobz, __uplo, __n, __a, __lda, __w, __work, __lwork);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1F40CE118](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1F40CE138](a1, a2);
}

char *__cdecl strcasestr(const char *__big, const char *__little)
{
  return (char *)MEMORY[0x1F40CE140](__big, __little);
}

char *__cdecl strcat(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1F40CE148](__s1, __s2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CE150](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x1F40CE168](__dst, __src);
}

size_t strcspn(const char *__s, const char *__charset)
{
  return MEMORY[0x1F40CE170](__s, __charset);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1F40CE178](__s1);
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

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x1F40CE1D8](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1F40CE1F8](__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1F40CE208](__s1, __n);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x1F40CE210](__big, __little, __len);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CE230](__s, *(void *)&__c);
}

size_t strspn(const char *__s, const char *__charset)
{
  return MEMORY[0x1F40CE250](__s, __charset);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1F40CE258](__s1, __s2);
}

double strtod(const char *a1, char **a2)
{
  MEMORY[0x1F40CE260](a1, a2);
  return result;
}

char *__cdecl strtok(char *__str, const char *__sep)
{
  return (char *)MEMORY[0x1F40CE290](__str, __sep);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2A0](__str, __endptr, *(void *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
}

kern_return_t task_create_identity_token(task_t task, task_id_token_t *token)
{
  return MEMORY[0x1F40CE440](*(void *)&task, token);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1F40CE588](a1);
}

void tzset(void)
{
}

int unlink(const char *a1)
{
  return MEMORY[0x1F40CE5E0](a1);
}

vImage_Error vImageAlphaBlend_ARGB8888(const vImage_Buffer *srcTop, const vImage_Buffer *srcBottom, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D2238](srcTop, srcBottom, dest, *(void *)&flags);
}

vImage_Error vImageBuffer_InitWithCGImage(vImage_Buffer *buf, vImage_CGImageFormat *format, const CGFloat *backgroundColor, CGImageRef image, vImage_Flags flags)
{
  return MEMORY[0x1F40D22B8](buf, format, backgroundColor, image, *(void *)&flags);
}

vImage_Error vImageByteSwap_Planar16U(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D22D0](src, dest, *(void *)&flags);
}

Boolean vImageCGImageFormat_IsEqual(const vImage_CGImageFormat *f1, const vImage_CGImageFormat *f2)
{
  return MEMORY[0x1F40D2318](f1, f2);
}

vImage_Error vImageClipToAlpha_RGBA8888(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D2398](src, dest, *(void *)&flags);
}

vImage_Error vImageConvert_16Fto16U(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D23A0](src, dest, *(void *)&flags);
}

vImage_Error vImageConvert_16UToPlanar8(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D23B8](src, dest, *(void *)&flags);
}

vImage_Error vImageConvert_16Uto16F(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D23C0](src, dest, *(void *)&flags);
}

vImage_Error vImageConvert_420Yp8_CbCr8ToARGB8888(const vImage_Buffer *srcYp, const vImage_Buffer *srcCbCr, const vImage_Buffer *dest, const vImage_YpCbCrToARGB *info, const uint8_t permuteMap[4], const uint8_t alpha, vImage_Flags flags)
{
  return MEMORY[0x1F40D23E8](srcYp, srcCbCr, dest, info, permuteMap, alpha, *(void *)&flags);
}

vImage_Error vImageConvert_ARGB16UToARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, const uint8_t permuteMap[4], uint8_t copyMask, const Pixel_8888 backgroundColor, vImage_Flags flags)
{
  return MEMORY[0x1F40D2480](src, dest, permuteMap, copyMask, backgroundColor, *(void *)&flags);
}

vImage_Error vImageConvert_ARGB16UtoARGB8888_dithered(const vImage_Buffer *src, const vImage_Buffer *dest, int dither, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x1F40D2490](src, dest, *(void *)&dither, permuteMap, *(void *)&flags);
}

vImage_Error vImageConvert_ARGB16UtoRGB16U(const vImage_Buffer *argbSrc, const vImage_Buffer *rgbDest, vImage_Flags flags)
{
  return MEMORY[0x1F40D24A0](argbSrc, rgbDest, *(void *)&flags);
}

vImage_Error vImageConvert_ARGB2101010ToARGB16U(const vImage_Buffer *src, const vImage_Buffer *dest, int32_t RGB101010RangeMin, int32_t RGB101010RangeMax, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x1F40D24A8](src, dest, *(void *)&RGB101010RangeMin, *(void *)&RGB101010RangeMax, permuteMap, *(void *)&flags);
}

vImage_Error vImageConvert_ARGB8888To420Yp8_CbCr8(const vImage_Buffer *src, const vImage_Buffer *destYp, const vImage_Buffer *destCbCr, const vImage_ARGBToYpCbCr *info, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x1F40D24C0](src, destYp, destCbCr, info, permuteMap, *(void *)&flags);
}

vImage_Error vImageConvert_ARGB8888ToARGB16U(const vImage_Buffer *src, const vImage_Buffer *dest, const uint8_t permuteMap[4], uint8_t copyMask, const Pixel_ARGB_16U backgroundColor, vImage_Flags flags)
{
  return MEMORY[0x1F40D2508](src, dest, permuteMap, copyMask, backgroundColor, *(void *)&flags);
}

vImage_Error vImageConvert_ARGB8888toRGB888(const vImage_Buffer *a1, const vImage_Buffer *a2, vImage_Flags a3)
{
  return MEMORY[0x1F40D2538](a1, a2, *(void *)&a3);
}

vImage_Error vImageConvert_ARGBToYpCbCr_GenerateConversion(const vImage_ARGBToYpCbCrMatrix *matrix, const vImage_YpCbCrPixelRange *pixelRange, vImage_ARGBToYpCbCr *outInfo, vImageARGBType inARGBType, vImageYpCbCrType outYpCbCrType, vImage_Flags flags)
{
  return MEMORY[0x1F40D2570](matrix, pixelRange, outInfo, *(void *)&inARGBType, *(void *)&outYpCbCrType, *(void *)&flags);
}

vImage_Error vImageConvert_AnyToAny(const vImageConverterRef converter, const vImage_Buffer *srcs, const vImage_Buffer *dests, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x1F40D2578](converter, srcs, dests, tempBuffer, *(void *)&flags);
}

vImage_Error vImageConvert_Planar16FtoPlanar8(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D25A8](src, dest, *(void *)&flags);
}

vImage_Error vImageConvert_Planar16UtoPlanar8_dithered(const vImage_Buffer *src, const vImage_Buffer *dest, int dither, vImage_Flags flags)
{
  return MEMORY[0x1F40D25C8](src, dest, *(void *)&dither, *(void *)&flags);
}

vImage_Error vImageConvert_Planar1toPlanar8(const vImage_Buffer *src, const vImage_Buffer *dest, const vImage_Flags flags)
{
  return MEMORY[0x1F40D25D0](src, dest, *(void *)&flags);
}

vImage_Error vImageConvert_Planar2toPlanar8(const vImage_Buffer *src, const vImage_Buffer *dest, const vImage_Flags flags)
{
  return MEMORY[0x1F40D25D8](src, dest, *(void *)&flags);
}

vImage_Error vImageConvert_Planar4toPlanar8(const vImage_Buffer *src, const vImage_Buffer *dest, const vImage_Flags flags)
{
  return MEMORY[0x1F40D25E0](src, dest, *(void *)&flags);
}

vImage_Error vImageConvert_Planar8To16U(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D25E8](src, dest, *(void *)&flags);
}

vImage_Error vImageConvert_RGB16UtoRGB888_dithered(const vImage_Buffer *src, const vImage_Buffer *dest, int dither, vImage_Flags flags)
{
  return MEMORY[0x1F40D2670](src, dest, *(void *)&dither, *(void *)&flags);
}

vImage_Error vImageConvert_RGB565toBGRA8888(Pixel_8 alpha, const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D2690](alpha, src, dest, *(void *)&flags);
}

vImage_Error vImageConvert_RGB565toRGB888(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D2698](src, dest, *(void *)&flags);
}

vImage_Error vImageConvert_RGB565toRGBA8888(Pixel_8 alpha, const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D26A8](alpha, src, dest, *(void *)&flags);
}

vImage_Error vImageConvert_RGB888toARGB8888(const vImage_Buffer *a1, const vImage_Buffer *a2, Pixel_8 a3, const vImage_Buffer *a4, BOOL a5, vImage_Flags a6)
{
  return MEMORY[0x1F40D26B0](a1, a2, a3, a4, a5, *(void *)&a6);
}

vImage_Error vImageConvert_RGB888toBGRA8888(const vImage_Buffer *a1, const vImage_Buffer *a2, Pixel_8 a3, const vImage_Buffer *a4, BOOL a5, vImage_Flags a6)
{
  return MEMORY[0x1F40D26B8](a1, a2, a3, a4, a5, *(void *)&a6);
}

vImage_Error vImageConvert_RGB888toRGBA8888(const vImage_Buffer *a1, const vImage_Buffer *a2, Pixel_8 a3, const vImage_Buffer *a4, BOOL a5, vImage_Flags a6)
{
  return MEMORY[0x1F40D26D0](a1, a2, a3, a4, a5, *(void *)&a6);
}

vImage_Error vImageConvert_RGBA5551toRGB565(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D26E8](src, dest, *(void *)&flags);
}

vImage_Error vImageConvert_RGBA8888toRGB888(const vImage_Buffer *a1, const vImage_Buffer *a2, vImage_Flags a3)
{
  return MEMORY[0x1F40D26F8](a1, a2, *(void *)&a3);
}

vImage_Error vImageConvert_XRGB2101010ToARGB16F(const vImage_Buffer *src, Pixel_F alpha, const vImage_Buffer *dest, int32_t RGB101010RangeMin, int32_t RGB101010RangeMax, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x1F40D2720](src, dest, *(void *)&RGB101010RangeMin, *(void *)&RGB101010RangeMax, permuteMap, *(void *)&flags, alpha);
}

vImage_Error vImageConvert_XRGB2101010ToARGB16U(const vImage_Buffer *src, uint16_t alpha, const vImage_Buffer *dest, int32_t RGB101010RangeMin, int32_t RGB101010RangeMax, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x1F40D2730](src, alpha, dest, *(void *)&RGB101010RangeMin, *(void *)&RGB101010RangeMax, permuteMap, *(void *)&flags);
}

vImage_Error vImageConvert_XRGB2101010ToARGB8888(const vImage_Buffer *src, Pixel_8 alpha, const vImage_Buffer *dest, int32_t RGB101010RangeMin, int32_t RGB101010RangeMax, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x1F40D2740](src, alpha, dest, *(void *)&RGB101010RangeMin, *(void *)&RGB101010RangeMax, permuteMap, *(void *)&flags);
}

uint64_t vImageConvert_XRGB2101010_A8ToARGB16F()
{
  return MEMORY[0x1F40D2760]();
}

uint64_t vImageConvert_XRGB2101010_A8ToARGB8888()
{
  return MEMORY[0x1F40D2778]();
}

vImage_Error vImageConvert_YpCbCrToARGB_GenerateConversion(const vImage_YpCbCrToARGBMatrix *matrix, const vImage_YpCbCrPixelRange *pixelRange, vImage_YpCbCrToARGB *outInfo, vImageYpCbCrType inYpCbCrType, vImageARGBType outARGBType, vImage_Flags flags)
{
  return MEMORY[0x1F40D2780](matrix, pixelRange, outInfo, *(void *)&inYpCbCrType, *(void *)&outARGBType, *(void *)&flags);
}

vImageConverterRef vImageConverter_CreateWithCGColorConversionInfo(CGColorConversionInfoRef colorConversionInfoRef, const vImage_CGImageFormat *sFormat, const vImage_CGImageFormat *dFormat, const CGFloat *bg, vImage_Flags flags, vImage_Error *error)
{
  return (vImageConverterRef)MEMORY[0x1F40D27A0](colorConversionInfoRef, sFormat, dFormat, bg, *(void *)&flags, error);
}

vImageConverterRef vImageConverter_CreateWithCGImageFormat(const vImage_CGImageFormat *srcFormat, const vImage_CGImageFormat *destFormat, const CGFloat *backgroundColor, vImage_Flags flags, vImage_Error *error)
{
  return (vImageConverterRef)MEMORY[0x1F40D27A8](srcFormat, destFormat, backgroundColor, *(void *)&flags, error);
}

vImage_Error vImageConverter_MustOperateOutOfPlace(const vImageConverterRef converter, const vImage_Buffer *srcs, const vImage_Buffer *dests, vImage_Flags flags)
{
  return MEMORY[0x1F40D27C8](converter, srcs, dests, *(void *)&flags);
}

uint64_t vImageConverter_Print()
{
  return MEMORY[0x1F40D27D0]();
}

void vImageConverter_Release(vImageConverterRef converter)
{
}

CGImageRef vImageCreateCGImageFromBuffer(const vImage_Buffer *buf, const vImage_CGImageFormat *format, void (__cdecl *callback)(void *, void *), void *userData, vImage_Flags flags, vImage_Error *error)
{
  return (CGImageRef)MEMORY[0x1F40D2860](buf, format, callback, userData, *(void *)&flags, error);
}

vImage_Error vImageExtractChannel_ARGB16U(const vImage_Buffer *src, const vImage_Buffer *dest, uint64_t channelIndex, vImage_Flags flags)
{
  return MEMORY[0x1F40D28D8](src, dest, channelIndex, *(void *)&flags);
}

vImage_Error vImageExtractChannel_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, uint64_t channelIndex, vImage_Flags flags)
{
  return MEMORY[0x1F40D28E0](src, dest, channelIndex, *(void *)&flags);
}

vImage_Error vImageFlatten_RGBA8888(const vImage_Buffer *rgbaSrc, const vImage_Buffer *rgbaDst, const Pixel_8888 rgbaBackgroundColorPtr, BOOL isImagePremultiplied, vImage_Flags flags)
{
  return MEMORY[0x1F40D2900](rgbaSrc, rgbaDst, rgbaBackgroundColorPtr, isImagePremultiplied, *(void *)&flags);
}

vImage_Error vImageHorizontalReflect_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D29C0](src, dest, *(void *)&flags);
}

vImage_Error vImageOverwriteChannelsWithScalar_ARGB8888(Pixel_8 scalar, const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t copyMask, vImage_Flags flags)
{
  return MEMORY[0x1F40D2AF8](scalar, src, dest, copyMask, *(void *)&flags);
}

vImage_Error vImageOverwriteChannelsWithScalar_Planar16U(Pixel_16U scalar, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D2B10](scalar, dest, *(void *)&flags);
}

vImage_Error vImageOverwriteChannelsWithScalar_PlanarF(Pixel_F scalar, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D2B20](dest, *(void *)&flags, scalar);
}

vImage_Error vImageOverwriteChannels_ARGB8888(const vImage_Buffer *newSrc, const vImage_Buffer *origSrc, const vImage_Buffer *dest, uint8_t copyMask, vImage_Flags flags)
{
  return MEMORY[0x1F40D2B30](newSrc, origSrc, dest, copyMask, *(void *)&flags);
}

vImage_Error vImagePermuteChannels_ARGB16U(const vImage_Buffer *src, const vImage_Buffer *dest, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x1F40D2B50](src, dest, permuteMap, *(void *)&flags);
}

vImage_Error vImagePermuteChannels_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x1F40D2B60](src, dest, permuteMap, *(void *)&flags);
}

vImage_Error vImagePermuteChannels_RGB888(const vImage_Buffer *src, const vImage_Buffer *dest, const uint8_t permuteMap[3], vImage_Flags flags)
{
  return MEMORY[0x1F40D2B78](src, dest, permuteMap, *(void *)&flags);
}

vImage_Error vImagePremultipliedAlphaBlend_BGRA8888(const vImage_Buffer *srcTop, const vImage_Buffer *srcBottom, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D2BE8](srcTop, srcBottom, dest, *(void *)&flags);
}

vImage_Error vImagePremultiplyData_ARGB16U(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D2C00](src, dest, *(void *)&flags);
}

vImage_Error vImagePremultiplyData_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D2C08](src, dest, *(void *)&flags);
}

vImage_Error vImagePremultiplyData_RGBA16F(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D2C10](src, dest, *(void *)&flags);
}

vImage_Error vImagePremultiplyData_RGBA16U(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D2C18](src, dest, *(void *)&flags);
}

vImage_Error vImagePremultiplyData_RGBA8888(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D2C20](src, dest, *(void *)&flags);
}

vImage_Error vImageRotate90_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t rotationConstant, Pixel_8 backColor, vImage_Flags flags)
{
  return MEMORY[0x1F40D2C78](src, dest, rotationConstant, backColor, *(void *)&flags);
}

vImage_Error vImageScale_ARGB16F(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x1F40D2CC8](src, dest, tempBuffer, *(void *)&flags);
}

vImage_Error vImageScale_ARGB16U(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x1F40D2CD0](src, dest, tempBuffer, *(void *)&flags);
}

vImage_Error vImageScale_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x1F40D2CD8](src, dest, tempBuffer, *(void *)&flags);
}

vImage_Error vImageScale_Planar16F(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x1F40D2CF0](src, dest, tempBuffer, *(void *)&flags);
}

vImage_Error vImageScale_Planar16U(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x1F40D2CF8](src, dest, tempBuffer, *(void *)&flags);
}

vImage_Error vImageScale_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x1F40D2D08](src, dest, tempBuffer, *(void *)&flags);
}

vImage_Error vImageScale_PlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x1F40D2D10](src, dest, tempBuffer, *(void *)&flags);
}

vImage_Error vImageUnpremultiplyData_ARGB16U(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D2D58](src, dest, *(void *)&flags);
}

vImage_Error vImageUnpremultiplyData_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D2D60](src, dest, *(void *)&flags);
}

vImage_Error vImageUnpremultiplyData_RGBA16F(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D2D68](src, dest, *(void *)&flags);
}

vImage_Error vImageUnpremultiplyData_RGBA16U(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D2D70](src, dest, *(void *)&flags);
}

vImage_Error vImageUnpremultiplyData_RGBA8888(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D2D78](src, dest, *(void *)&flags);
}

vImage_Error vImageVerticalReflect_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D2D98](src, dest, *(void *)&flags);
}

vImage_Error vImageVerticalReflect_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D2DB8](src, dest, *(void *)&flags);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x1F40CE680](a1, a2, a3);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return MEMORY[0x1F40CE690](a1, a2, a3);
}

kern_return_t vm_purgable_control(vm_map_t target_task, vm_address_t address, vm_purgable_t control, int *state)
{
  return MEMORY[0x1F40CE6E0](*(void *)&target_task, address, *(void *)&control, state);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1F40CE928](*(void *)&__fd, __buf, __nbyte);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1F40CEA38]();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1F40CEA58](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1F40CEAA8](xarray, index);
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBA8](name, targetq);
}

const char *__cdecl xpc_connection_get_name(xpc_connection_t connection)
{
  return (const char *)MEMORY[0x1F40CEC18](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1F40CEC68](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1F40CED90](bytes, length);
}

xpc_object_t xpc_data_create_with_dispatch_data(dispatch_data_t ddata)
{
  return (xpc_object_t)MEMORY[0x1F40CEDA0](ddata);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1F40CEE08](xdict, applier);
}

uint64_t xpc_dictionary_copy_mach_send()
{
  return MEMORY[0x1F40CEE18]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1F40CEE30]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1F40CEE40](original);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEE68](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE80](xdict, key);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x1F40CEE88](xdict);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1F40CEE98](xdict, key, length);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEEA8](xdict, key);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  MEMORY[0x1F40CEEB8](xdict, key);
  return result;
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEC8](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEF8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

uint64_t xpc_dictionary_handoff_reply()
{
  return MEMORY[0x1F40CEF18]();
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

uint64_t xpc_dictionary_set_mach_send()
{
  return MEMORY[0x1F40CEF98]();
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1F40CF248](object);
}

xpc_object_t xpc_shmem_create(void *region, size_t length)
{
  return (xpc_object_t)MEMORY[0x1F40CF268](region, length);
}

size_t xpc_shmem_map(xpc_object_t xshmem, void **region)
{
  return MEMORY[0x1F40CF278](xshmem, region);
}