void os_trace_blob_destroy_slow(uint64_t a1)
{
  void *v1;

  v1 = *(void **)a1;
  *(void *)a1 = 3954044928;
  *(_WORD *)(a1 + 20) = 0;
  free(v1);
}

uint64_t os_trace_blob_grow(uint64_t a1, uint64_t a2)
{
  unsigned int v9 = *(_DWORD *)(a1 + 8) + ((*(unsigned char *)(a1 + 22) ^ 1) & 1);
  BOOL v2 = __CFADD__(v9, a2);
  unsigned int v10 = v9 + a2;
  if (v2 || v9 + a2 != v9 + a2)
  {
    unsigned int v11 = *(_DWORD *)(a1 + 16);
  }
  else
  {
    int v3 = *(_DWORD *)(a1 + 12);
    BOOL v4 = __CFADD__(v3, v3);
    unsigned int v5 = 2 * v3;
    char v6 = v4;
    if (v6)
    {
      unsigned int v11 = *(_DWORD *)(a1 + 16);
    }
    else
    {
      if (v10 <= v5) {
        unsigned int v7 = v5;
      }
      else {
        unsigned int v7 = v9 + a2;
      }
      if (*(_DWORD *)(a1 + 16) >= v7)
      {
        if (v10 > v5) {
          unsigned int v5 = v9 + a2;
        }
      }
      else
      {
        unsigned int v5 = *(_DWORD *)(a1 + 16);
      }
      unsigned int v11 = v5;
    }
  }
  if (v11 > *(_DWORD *)(a1 + 12))
  {
    if (*(_WORD *)(a1 + 20))
    {
      *(void *)a1 = _os_trace_realloc();
    }
    else
    {
      *(void *)a1 = _os_trace_malloc();
      __memcpy_chk();
      *(_WORD *)(a1 + 20) |= 1u;
    }
    *(_DWORD *)(a1 + 12) = v11;
  }
  return v11 - v9;
}

uint64_t os_trace_blob_add_slow(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v5 = a3;
  if ((*(_WORD *)(a1 + 20) & 2) != 0)
  {
    return 0;
  }
  else
  {
    unsigned int v4 = *(_DWORD *)(a1 + 12) - ((*(unsigned char *)(a1 + 22) ^ 1) & 1) - *(_DWORD *)(a1 + 8);
    if (v4 < a3)
    {
      if (*(_DWORD *)(a1 + 12) < *(_DWORD *)(a1 + 16)) {
        unsigned int v4 = os_trace_blob_grow(a1, a3);
      }
      if (v4 < v5)
      {
        *(_WORD *)(a1 + 20) |= 2u;
        LODWORD(v5) = v4;
      }
    }
    __memcpy_chk();
    *(_DWORD *)(a1 + 8) += v5;
    if ((*(unsigned char *)(a1 + 22) & 1) == 0) {
      *(unsigned char *)(*(void *)a1 + *(unsigned int *)(a1 + 8)) = 0;
    }
    return v5;
  }
}

uint64_t os_trace_blob_addns(uint64_t a1, unsigned char *a2, unint64_t a3, void *a4)
{
  uint64_t v15 = a1;
  v14 = a2;
  unint64_t v13 = a3;
  v12 = a4;
  if ((*(_WORD *)(a1 + 20) & 2) != 0)
  {
    return 0;
  }
  else
  {
    uint64_t v11 = 0;
    *(void *)&v10[1] = 0;
    uint64_t v21 = v15;
    int v20 = 0;
    int v20 = *(_DWORD *)(v15 + 8) + ((*(unsigned char *)(v15 + 22) ^ 1) & 1);
    if (*(_DWORD *)(v15 + 16))
    {
      unsigned int v22 = *(_DWORD *)(v21 + 16) - v20;
    }
    else if (*(_DWORD *)(v21 + 12))
    {
      unsigned int v22 = *(_DWORD *)(v21 + 12) - v20;
    }
    else
    {
      unsigned int v22 = 0;
    }
    if (v13 > v22)
    {
      uint64_t v18 = v15;
      int v17 = 0;
      int v17 = *(_DWORD *)(v15 + 8) + ((*(unsigned char *)(v15 + 22) ^ 1) & 1);
      if (*(_DWORD *)(v15 + 16))
      {
        unsigned int v19 = *(_DWORD *)(v18 + 16) - v17;
      }
      else if (*(_DWORD *)(v18 + 12))
      {
        unsigned int v19 = *(_DWORD *)(v18 + 12) - v17;
      }
      else
      {
        unsigned int v19 = 0;
      }
      unint64_t v13 = v19;
    }
    while (*v14)
    {
      v26 = v14;
      unint64_t v25 = v13 - *(void *)&v10[1];
      for (unint64_t i = 0; i < v25; ++i)
      {
        int v23 = 0;
        int v23 = v26[i];
        if (!v23 || !isascii(v23))
        {
          unint64_t v27 = i;
          goto LABEL_26;
        }
        if (iscntrl_l(v23, _c_locale) && !isspace_l(v23, _c_locale))
        {
          unint64_t v27 = i;
          goto LABEL_26;
        }
      }
      unint64_t v27 = v25;
LABEL_26:
      uint64_t v11 = v27;
      uint64_t v58 = v15;
      v57 = v14;
      unint64_t v56 = v27;
      if ((*(_WORD *)(v15 + 20) & 2) != 0)
      {
        int v59 = 0;
      }
      else
      {
        uint64_t v60 = v58;
        if (v56 <= *(_DWORD *)(v60 + 12) - ((*(unsigned char *)(v60 + 22) ^ 1) & 1u) - *(_DWORD *)(v60 + 8))
        {
          __memcpy_chk();
          uint64_t v62 = v58;
          unint64_t v61 = v56;
          *(_DWORD *)(v58 + 8) += v56;
          if ((*(unsigned char *)(v62 + 22) & 1) == 0) {
            *(unsigned char *)(*(void *)v62 + *(unsigned int *)(v62 + 8)) = 0;
          }
          int v59 = v61;
        }
        else
        {
          int v59 = os_trace_blob_add_slow(v58, (uint64_t)v57, v56);
        }
      }
      v14 += v11;
      *(void *)&v10[1] += v11;
      if (*(void *)&v10[1] == v13) {
        break;
      }
      v10[0] = 0;
      v10[0] = *v14;
      if (!v10[0]) {
        break;
      }
      if (isascii(v10[0]))
      {
        if (*(void *)&v10[1] + 3 > v13) {
          break;
        }
        if (v10[0] == 127) {
          char v4 = 63;
        }
        else {
          char v4 = v10[0] + 64;
        }
        v10[0] = v4;
        qmemcpy(v9, "\\^", 2);
        v9[2] = v4;
        uint64_t v51 = v15;
        v50 = v9;
        unint64_t v49 = 3;
        if ((*(_WORD *)(v15 + 20) & 2) != 0)
        {
          int v52 = 0;
        }
        else
        {
          uint64_t v53 = v51;
          if (v49 <= *(_DWORD *)(v53 + 12) - ((*(unsigned char *)(v53 + 22) ^ 1) & 1u) - *(_DWORD *)(v53 + 8))
          {
            __memcpy_chk();
            uint64_t v55 = v51;
            unint64_t v54 = v49;
            *(_DWORD *)(v51 + 8) += v49;
            if ((*(unsigned char *)(v55 + 22) & 1) == 0) {
              *(unsigned char *)(*(void *)v55 + *(unsigned int *)(v55 + 8)) = 0;
            }
            int v52 = v54;
          }
          else
          {
            int v52 = os_trace_blob_add_slow(v51, (uint64_t)v50, v49);
          }
        }
        *(void *)&v10[1] += 3;
        ++v14;
      }
      else
      {
        uint64_t v11 = _os_trace_utf8_len(v14, v13 - *(void *)&v10[1]);
        if (v11 == -2) {
          break;
        }
        if (v11 == -1)
        {
          if (*(void *)&v10[1] + 4 > v13) {
            break;
          }
          v10[0] &= ~0x80u;
          if (iscntrl_l(v10[0], _c_locale))
          {
            if (v10[0] == 127) {
              char v5 = 63;
            }
            else {
              char v5 = v10[0] + 64;
            }
            v10[0] = v5;
            qmemcpy(v8, "\\M^", 3);
            v8[3] = v5;
            uint64_t v44 = v15;
            v43 = v8;
            unint64_t v42 = 4;
            if ((*(_WORD *)(v15 + 20) & 2) != 0)
            {
              int v45 = 0;
            }
            else
            {
              uint64_t v46 = v44;
              if (v42 <= *(_DWORD *)(v46 + 12) - ((*(unsigned char *)(v46 + 22) ^ 1) & 1u) - *(_DWORD *)(v46 + 8))
              {
                __memcpy_chk();
                uint64_t v48 = v44;
                unint64_t v47 = v42;
                *(_DWORD *)(v44 + 8) += v42;
                if ((*(unsigned char *)(v48 + 22) & 1) == 0) {
                  *(unsigned char *)(*(void *)v48 + *(unsigned int *)(v48 + 8)) = 0;
                }
                int v45 = v47;
              }
              else
              {
                int v45 = os_trace_blob_add_slow(v44, (uint64_t)v43, v42);
              }
            }
          }
          else
          {
            qmemcpy(v7, "\\M-", 3);
            v7[3] = v10[0];
            uint64_t v37 = v15;
            v36 = v7;
            unint64_t v35 = 4;
            if ((*(_WORD *)(v15 + 20) & 2) != 0)
            {
              int v38 = 0;
            }
            else
            {
              uint64_t v39 = v37;
              if (v35 <= *(_DWORD *)(v39 + 12) - ((*(unsigned char *)(v39 + 22) ^ 1) & 1u) - *(_DWORD *)(v39 + 8))
              {
                __memcpy_chk();
                uint64_t v41 = v37;
                unint64_t v40 = v35;
                *(_DWORD *)(v37 + 8) += v35;
                if ((*(unsigned char *)(v41 + 22) & 1) == 0) {
                  *(unsigned char *)(*(void *)v41 + *(unsigned int *)(v41 + 8)) = 0;
                }
                int v38 = v40;
              }
              else
              {
                int v38 = os_trace_blob_add_slow(v37, (uint64_t)v36, v35);
              }
            }
          }
          *(void *)&v10[1] += 4;
          ++v14;
        }
        else
        {
          uint64_t v30 = v15;
          v29 = v14;
          unint64_t v28 = v11;
          if ((*(_WORD *)(v15 + 20) & 2) != 0)
          {
            int v31 = 0;
          }
          else
          {
            uint64_t v32 = v30;
            if (v28 <= *(_DWORD *)(v32 + 12) - ((*(unsigned char *)(v32 + 22) ^ 1) & 1u) - *(_DWORD *)(v32 + 8))
            {
              __memcpy_chk();
              uint64_t v34 = v30;
              unint64_t v33 = v28;
              *(_DWORD *)(v30 + 8) += v28;
              if ((*(unsigned char *)(v34 + 22) & 1) == 0) {
                *(unsigned char *)(*(void *)v34 + *(unsigned int *)(v34 + 8)) = 0;
              }
              int v31 = v33;
            }
            else
            {
              int v31 = os_trace_blob_add_slow(v30, (uint64_t)v29, v28);
            }
          }
          v14 += v11;
          *(void *)&v10[1] += v11;
          if (*(void *)&v10[1] == v13) {
            break;
          }
        }
      }
    }
    if (v12) {
      void *v12 = v14;
    }
    return *(unsigned int *)&v10[1];
  }
}

uint64_t _os_trace_utf8_len(unsigned char *a1, unint64_t a2)
{
  if ((*a1 & 0xF8) == 0xF0)
  {
    unint64_t v4 = 4;
  }
  else if ((*a1 & 0xF0) == 0xE0)
  {
    unint64_t v4 = 3;
  }
  else
  {
    if ((*a1 & 0xE0) != 0xC0) {
      return -1;
    }
    unint64_t v4 = 2;
  }
  if (a2 < v4) {
    return -2;
  }
  for (unint64_t i = 1; i < v4; ++i)
  {
    if ((a1[i] & 0xC0) != 0x80) {
      return -1;
    }
  }
  return v4;
}

uint64_t os_trace_blob_addnws(uint64_t a1, int *a2, unint64_t a3, int **a4)
{
  uint64_t v11 = a1;
  unsigned int v10 = a2;
  unint64_t v9 = a3;
  v8 = a4;
  if ((*(_WORD *)(a1 + 20) & 2) != 0)
  {
    return 0;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v17 = v11;
    int v16 = 0;
    int v16 = *(_DWORD *)(v11 + 8) + ((*(unsigned char *)(v11 + 22) ^ 1) & 1);
    if (*(_DWORD *)(v11 + 16))
    {
      unsigned int v18 = *(_DWORD *)(v17 + 16) - v16;
    }
    else if (*(_DWORD *)(v17 + 12))
    {
      unsigned int v18 = *(_DWORD *)(v17 + 12) - v16;
    }
    else
    {
      unsigned int v18 = 0;
    }
    if (v9 > v18)
    {
      uint64_t v14 = v11;
      int v13 = 0;
      int v13 = *(_DWORD *)(v11 + 8) + ((*(unsigned char *)(v11 + 22) ^ 1) & 1);
      if (*(_DWORD *)(v11 + 16))
      {
        unsigned int v15 = *(_DWORD *)(v14 + 16) - v13;
      }
      else if (*(_DWORD *)(v14 + 12))
      {
        unsigned int v15 = *(_DWORD *)(v14 + 12) - v13;
      }
      else
      {
        unsigned int v15 = 0;
      }
      unint64_t v9 = v15;
    }
    while (*v10)
    {
      uint64_t v5 = _os_trace_utf8_to_mbs(v6, *v10);
      if (!v5 || v7 + v5 > v9) {
        break;
      }
      uint64_t v21 = v11;
      int v20 = v6;
      unint64_t v19 = v5;
      if ((*(_WORD *)(v11 + 20) & 2) != 0)
      {
        unsigned int v22 = 0;
      }
      else
      {
        uint64_t v23 = v21;
        if (v19 <= *(_DWORD *)(v23 + 12) - ((*(unsigned char *)(v23 + 22) ^ 1) & 1u) - *(_DWORD *)(v23 + 8))
        {
          __memcpy_chk();
          uint64_t v25 = v21;
          unint64_t v24 = v19;
          *(_DWORD *)(v21 + 8) += v19;
          if ((*(unsigned char *)(v25 + 22) & 1) == 0) {
            *(unsigned char *)(*(void *)v25 + *(unsigned int *)(v25 + 8)) = 0;
          }
          unsigned int v22 = v24;
        }
        else
        {
          unsigned int v22 = os_trace_blob_add_slow(v21, (uint64_t)v20, v19);
        }
      }
      if (!v22) {
        break;
      }
      v7 += v22;
      ++v10;
    }
    if (v8) {
      *v8 = v10;
    }
    return v7;
  }
}

uint64_t _os_trace_utf8_to_mbs(unsigned char *a1, int a2)
{
  int v6 = a2;
  if ((a2 & 0xFFFFFF80) == 0)
  {
    *a1 = a2;
    return 1;
  }
  if ((a2 & 0xFFFFF800) == 0)
  {
    char v5 = -64;
    uint64_t v3 = 2;
    goto LABEL_13;
  }
  if ((a2 & 0xFFFF0000) == 0)
  {
    if (a2 < 55296 || a2 > 57343)
    {
      char v5 = -32;
      uint64_t v3 = 3;
      goto LABEL_13;
    }
    return 0;
  }
  if ((a2 & 0xFFE00000) != 0 || a2 > 1114111) {
    return 0;
  }
  char v5 = -16;
  uint64_t v3 = 4;
LABEL_13:
  for (uint64_t i = v3 - 1; i; --i)
  {
    a1[i] = v6 & 0x3F | 0x80;
    v6 >>= 6;
  }
  *a1 = v6 | v5;
  return v3;
}

uint64_t os_trace_blob_vaddf(uint64_t a1, const char *a2, va_list a3)
{
  if (*(unsigned char *)(a1 + 22))
  {
    _os_crash();
    __break(1u);
  }
  if ((*(_WORD *)(a1 + 20) & 2) != 0)
  {
    return 0;
  }
  else
  {
    unsigned int v5 = *(_DWORD *)(a1 + 12) - ((*(unsigned char *)(a1 + 22) ^ 1) & 1) - *(_DWORD *)(a1 + 8);
    *__error() = 0;
    unsigned int v4 = __vsnprintf_chk((char *)(*(void *)a1 + *(unsigned int *)(a1 + 8)), v5 + 1, 0, 0xFFFFFFFFFFFFFFFFLL, a2, a3);
    if ((v4 & 0x80000000) != 0)
    {
      *(unsigned char *)(*(void *)a1 + *(unsigned int *)(a1 + 8)) = 0;
      return 0;
    }
    else if (v4 > v5)
    {
      if (*(_DWORD *)(a1 + 12) < *(_DWORD *)(a1 + 16))
      {
        unsigned int v5 = os_trace_blob_grow(a1, v4);
        *__error() = 0;
        __vsnprintf_chk((char *)(*(void *)a1 + *(unsigned int *)(a1 + 8)), v5 + 1, 0, 0xFFFFFFFFFFFFFFFFLL, a2, a3);
      }
      if (v4 > v5)
      {
        *(_WORD *)(a1 + 20) |= 2u;
        unsigned int v4 = v5;
      }
      *(_DWORD *)(a1 + 8) += v4;
      return v4;
    }
    else
    {
      *(_DWORD *)(a1 + 8) += v4;
      return v4;
    }
  }
}

uint64_t os_trace_blob_addf(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return os_trace_blob_vaddf(a1, a2, &a9);
}

uint64_t os_trace_blob_add_localtime(uint64_t result, time_t a2, uint64_t a3, int a4)
{
  uint64_t v20 = result;
  time_t v19 = a2;
  uint64_t v18 = a3;
  int v17 = a4;
  if (*(unsigned char *)(result + 22))
  {
    result = _os_crash();
    __break(1u);
  }
  if ((*(_WORD *)(v20 + 20) & 2) != 0)
  {
    int v21 = 0;
  }
  else
  {
    memset(&__b, 0, sizeof(__b));
    result = (uint64_t)localtime_r(&v19, &__b);
    if (result)
    {
      os_trace_blob_addf(v20, "%04d-%02d-%02d %02d:%02d:%02d", v4, v5, v6, v7, v8, v9, LOBYTE(__b.tm_year) + 108);
      if (v17)
      {
        if (v17 == 1)
        {
          os_trace_blob_addf(v20, ".%06ld", v10, v11, v12, v13, v14, v15, v18);
        }
        else if (v17 == 2)
        {
          os_trace_blob_addf(v20, ".%03ld", v10, v11, v12, v13, v14, v15, v18);
        }
      }
      else
      {
        os_trace_blob_addf(v20, ".%09ld", v10, v11, v12, v13, v14, v15, v18);
      }
      return os_trace_blob_addf(v20, "%+05ld", v10, v11, v12, v13, v14, v15, (__b.tm_gmtoff / 60 % 60) + 100 * (__b.tm_gmtoff / 60 / 60));
    }
    else
    {
      int v21 = 0;
    }
  }
  return result;
}

uint64_t os_trace_blob_add_hexdump(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v13 = result;
  uint64_t v56 = result;
  int v55 = 39;
  char v54 = 39;
  uint64_t v59 = result;
  uint64_t v58 = &v54;
  unint64_t v57 = 1;
  if ((*(_WORD *)(result + 20) & 2) != 0)
  {
    int v60 = 0;
  }
  else
  {
    uint64_t v61 = v59;
    if (v57 <= *(_DWORD *)(v61 + 12) - ((*(unsigned char *)(v61 + 22) ^ 1) & 1u) - *(_DWORD *)(v61 + 8))
    {
      result = __memcpy_chk();
      uint64_t v63 = v59;
      unint64_t v62 = v57;
      *(_DWORD *)(v59 + 8) += v57;
      if ((*(unsigned char *)(v63 + 22) & 1) == 0) {
        *(unsigned char *)(*(void *)v63 + *(unsigned int *)(v63 + 8)) = 0;
      }
      int v60 = v62;
    }
    else
    {
      result = os_trace_blob_add_slow(v59, (uint64_t)v58, v57);
      int v60 = result;
    }
  }
  int v8 = v60;
  for (unint64_t i = 0; i < a3; ++i)
  {
    unsigned __int8 v6 = *(unsigned char *)(a2 + i);
    if (i)
    {
      uint64_t v46 = v13;
      int v45 = 32;
      char v44 = 32;
      uint64_t v49 = v13;
      uint64_t v48 = &v44;
      unint64_t v47 = 1;
      if ((*(_WORD *)(v13 + 20) & 2) != 0)
      {
        int v50 = 0;
      }
      else
      {
        uint64_t v51 = v49;
        if (v47 <= *(_DWORD *)(v51 + 12) - ((*(unsigned char *)(v51 + 22) ^ 1) & 1u) - *(_DWORD *)(v51 + 8))
        {
          result = __memcpy_chk();
          uint64_t v53 = v49;
          unint64_t v52 = v47;
          *(_DWORD *)(v49 + 8) += v47;
          if ((*(unsigned char *)(v53 + 22) & 1) == 0) {
            *(unsigned char *)(*(void *)v53 + *(unsigned int *)(v53 + 8)) = 0;
          }
          int v50 = v52;
        }
        else
        {
          result = os_trace_blob_add_slow(v49, (uint64_t)v48, v47);
          int v50 = result;
        }
      }
      v8 += v50;
    }
    int v4 = a0123456789abcd[v6 >> 4];
    uint64_t v36 = v13;
    int v35 = v4;
    char v34 = v4;
    uint64_t v39 = v13;
    int v38 = &v34;
    unint64_t v37 = 1;
    if ((*(_WORD *)(v13 + 20) & 2) != 0)
    {
      int v40 = 0;
    }
    else
    {
      uint64_t v41 = v39;
      if (v37 <= *(_DWORD *)(v41 + 12) - ((*(unsigned char *)(v41 + 22) ^ 1) & 1u) - *(_DWORD *)(v41 + 8))
      {
        result = __memcpy_chk();
        uint64_t v43 = v39;
        unint64_t v42 = v37;
        *(_DWORD *)(v39 + 8) += v37;
        if ((*(unsigned char *)(v43 + 22) & 1) == 0) {
          *(unsigned char *)(*(void *)v43 + *(unsigned int *)(v43 + 8)) = 0;
        }
        int v40 = v42;
      }
      else
      {
        result = os_trace_blob_add_slow(v39, (uint64_t)v38, v37);
        int v40 = result;
      }
    }
    int v9 = v8 + v40;
    int v5 = a0123456789abcd[v6 & 0xF];
    uint64_t v26 = v13;
    int v25 = v5;
    char v24 = v5;
    uint64_t v29 = v13;
    unint64_t v28 = &v24;
    unint64_t v27 = 1;
    if ((*(_WORD *)(v13 + 20) & 2) != 0)
    {
      int v30 = 0;
    }
    else
    {
      uint64_t v31 = v29;
      if (v27 <= *(_DWORD *)(v31 + 12) - ((*(unsigned char *)(v31 + 22) ^ 1) & 1u) - *(_DWORD *)(v31 + 8))
      {
        result = __memcpy_chk();
        uint64_t v33 = v29;
        unint64_t v32 = v27;
        *(_DWORD *)(v29 + 8) += v27;
        if ((*(unsigned char *)(v33 + 22) & 1) == 0) {
          *(unsigned char *)(*(void *)v33 + *(unsigned int *)(v33 + 8)) = 0;
        }
        int v30 = v32;
      }
      else
      {
        result = os_trace_blob_add_slow(v29, (uint64_t)v28, v27);
        int v30 = result;
      }
    }
    int v8 = v9 + v30;
  }
  if (a4)
  {
    uint64_t v66 = v13;
    v65 = "…'";
    uint64_t v64 = 0;
    return os_trace_blob_addns(v13, "…'", 0xFFFFFFFFFFFFFFFFLL, 0);
  }
  else
  {
    uint64_t v16 = v13;
    int v15 = 39;
    char v14 = 39;
    uint64_t v19 = v13;
    uint64_t v18 = &v14;
    unint64_t v17 = 1;
    if ((*(_WORD *)(v13 + 20) & 2) != 0)
    {
      int v20 = 0;
    }
    else
    {
      uint64_t v21 = v19;
      if (v17 <= *(_DWORD *)(v19 + 12) - ((*(unsigned char *)(v19 + 22) ^ 1) & 1u) - *(_DWORD *)(v19 + 8))
      {
        result = __memcpy_chk();
        uint64_t v23 = v19;
        unint64_t v22 = v17;
        *(_DWORD *)(v19 + 8) += v17;
        if ((*(unsigned char *)(v23 + 22) & 1) == 0) {
          *(unsigned char *)(*(void *)v23 + *(unsigned int *)(v23 + 8)) = 0;
        }
      }
      else
      {
        result = os_trace_blob_add_slow(v19, (uint64_t)v18, v17);
        int v20 = result;
      }
    }
  }
  return result;
}

uint64_t os_log_fmt_delimit(unsigned char *a1, uint64_t a2, size_t a3)
{
  unint64_t v17 = a1;
  uint64_t v16 = a2;
  size_t v15 = a3;
  __s = a1 + 1;
  unsigned int v12 = 0;
  if (*a1 != 37)
  {
    _os_crash();
    __break(1u);
  }
  __memset_chk();
  *(void *)size_t v15 = v17;
  if (*__s != 123)
  {
LABEL_7:
    uint64_t v3 = __s++;
    int v13 = *v3;
    while (1)
    {
      switch(v13)
      {
        case ' ':
        case '#':
        case '\'':
        case '+':
        case '-':
        case '0':
          goto LABEL_7;
        case '*':
          if ((*(_WORD *)(v15 + 8) & 8) != 0) {
            *(_WORD *)(v15 + 8) |= 1u;
          }
          addaster(&__s, v15, 2u);
          goto LABEL_7;
        case '.':
          int v4 = __s++;
          int v13 = *v4;
          if (v13 == 42)
          {
            addaster(&__s, v15, 0xCu);
            goto LABEL_7;
          }
          *(_DWORD *)(v15 + 24) = 0;
          while ((v13 - 48) <= 9)
          {
            *(_DWORD *)(v15 + 24) = v13 - 48 + 10 * *(_DWORD *)(v15 + 24);
            int v5 = __s++;
            int v13 = *v5;
          }
          if ((*(_WORD *)(v15 + 8) & 8) != 0) {
            *(_WORD *)(v15 + 8) |= 1u;
          }
          *(_WORD *)(v15 + 8) |= 8u;
          break;
        case '1':
        case '2':
        case '3':
        case '4':
        case '5':
        case '6':
        case '7':
        case '8':
        case '9':
          do
          {
            unsigned __int8 v6 = __s++;
            int v13 = *v6;
          }
          while ((v13 - 48) <= 9);
          if (v13 != 36) {
            continue;
          }
          *(_WORD *)(v15 + 8) |= 1u;
          goto LABEL_7;
        case '@':
          *(unsigned char *)(v15 + 10) = 18;
          goto LABEL_64;
        case 'A':
        case 'E':
        case 'F':
        case 'G':
        case 'a':
        case 'e':
        case 'f':
        case 'g':
          if ((v12 & 8) != 0) {
            char v8 = 15;
          }
          else {
            char v8 = 14;
          }
          *(unsigned char *)(v15 + 10) = v8;
          *(_WORD *)(v15 + 8) |= 0x10u;
          goto LABEL_64;
        case 'C':
          LOBYTE(v12) = v12 | 0x10;
          goto LABEL_37;
        case 'D':
          LOWORD(v12) = v12 | 0x10;
          goto LABEL_42;
        case 'L':
          v12 |= 8u;
          goto LABEL_7;
        case 'O':
          LOWORD(v12) = v12 | 0x10;
          goto LABEL_50;
        case 'P':
          if (v16 != 2) {
            return 0;
          }
          if ((*(_WORD *)(v15 + 8) & 8) == 0) {
            *(_WORD *)(v15 + 8) |= 1u;
          }
          *(unsigned char *)(v15 + 10) = 19;
          goto LABEL_64;
        case 'S':
          LOBYTE(v12) = v12 | 0x10;
          goto LABEL_58;
        case 'U':
          LOWORD(v12) = v12 | 0x10;
          goto LABEL_50;
        case 'X':
        case 'o':
        case 'u':
        case 'x':
LABEL_50:
          addsarg(v15, v12);
          *(_WORD *)(v15 + 8) |= 0x20u;
          ++*(unsigned char *)(v15 + 10);
          goto LABEL_64;
        case 'c':
LABEL_37:
          if ((v12 & 0x10) != 0) {
            char v7 = 7;
          }
          else {
            char v7 = 5;
          }
          *(unsigned char *)(v15 + 10) = v7;
          *(_WORD *)(v15 + 8) |= 0x10u;
          goto LABEL_64;
        case 'd':
        case 'i':
LABEL_42:
          addsarg(v15, v12);
          goto LABEL_64;
        case 'h':
          if ((v12 & 0x40) != 0) {
            unsigned int v12 = v12 & 0xFFFFDFBF | 0x2000;
          }
          else {
            v12 |= 0x40u;
          }
          goto LABEL_7;
        case 'j':
          v12 |= 0x1000u;
          goto LABEL_7;
        case 'l':
          if ((v12 & 0x10) != 0) {
            unsigned int v12 = v12 & 0xFFFFFFCF | 0x20;
          }
          else {
            v12 |= 0x10u;
          }
          goto LABEL_7;
        case 'm':
          *(unsigned char *)(v15 + 10) = 8;
          *(_WORD *)(v15 + 8) |= 0x10u;
          goto LABEL_64;
        case 'n':
          *(_WORD *)(v15 + 8) |= 1u;
          goto LABEL_64;
        case 'p':
          *(unsigned char *)(v15 + 10) = 13;
          *(_WORD *)(v15 + 8) |= 0x30u;
          goto LABEL_64;
        case 'q':
          v12 |= 0x20u;
          goto LABEL_7;
        case 's':
LABEL_58:
          if ((v12 & 0x10) != 0) {
            char v9 = 17;
          }
          else {
            char v9 = 16;
          }
          *(unsigned char *)(v15 + 10) = v9;
LABEL_64:
          unsigned __int16 v10 = (_WORD)__s - (_WORD)v17;
          *(_WORD *)(v15 + 12) = (_WORD)__s - (_WORD)v17;
          return v10;
        case 't':
          v12 |= 0x800u;
          goto LABEL_7;
        case 'z':
          v12 |= 0x400u;
          goto LABEL_7;
        default:
          return 0;
      }
    }
  }
  if (v16 == 2)
  {
    __s = strchr(__s, 125);
    if (__s)
    {
      os_log_fmt_parse_annotation(v15);
      ++__s;
      goto LABEL_7;
    }
  }
  return 0;
}

size_t os_log_fmt_parse_annotation(size_t result)
{
  size_t v4 = result;
  for (__s = (char *)(*(void *)result + 2); *__s != 125; __s = &__sa[__n])
  {
    __sa = &__s[strspn(__s, ", ")];
    result = strcspn(__sa, ",}");
    size_t __n = result;
    if (!result) {
      return result;
    }
    if (result != 6 || (result = memcmp(__sa, "public", 6uLL), result))
    {
      if (__n != 7 || (result = memcmp(__sa, "private", 7uLL), result))
      {
        if (__n != 9 || (result = memcmp(__sa, "sensitive", 9uLL), result))
        {
          result = (size_t)memchr(__sa, 61, __n);
          if (!result)
          {
            result = strncmp(__sa, "mask.", 5uLL);
            if (result)
            {
              *(_WORD *)(v4 + 8) |= 0x40u;
              result = strncmp(__sa, "builtin:", 8uLL);
              if (result)
              {
                result = (size_t)memchr(__sa, 58, __n);
                if (result)
                {
                  if ((*(_WORD *)(v4 + 8) & 0x80) != 0) {
                    *(_WORD *)(v4 + 8) ^= 0x80u;
                  }
                  *(void *)(v4 + 32) = __sa;
                  *(_WORD *)(v4 + 14) = result - (_WORD)__sa;
                  *(void *)(v4 + 40) = result + 1;
                  *(_WORD *)(v4 + 16) = (_WORD)__sa + __n - (result + 1);
                }
                else
                {
                  *(_WORD *)(v4 + 8) |= 0x80u;
                  *(void *)(v4 + 32) = "builtin";
                  *(_WORD *)(v4 + 14) = 7;
                  *(void *)(v4 + 40) = __sa;
                  *(_WORD *)(v4 + 16) = __n;
                }
              }
              else
              {
                *(_WORD *)(v4 + 8) |= 0x80u;
                *(void *)(v4 + 32) = "builtin";
                *(_WORD *)(v4 + 14) = 7;
                *(void *)(v4 + 40) = __sa + 8;
                *(_WORD *)(v4 + 16) = __n - 8;
              }
            }
            else if (__n > 5 && __n < 0xE)
            {
              *(_WORD *)(v4 + 8) |= 0x800u;
              *(void *)(v4 + 48) = __sa + 5;
              *(_WORD *)(v4 + 18) = __n - 5;
              result = _os_log_fmt_compute_mask(*(void *)(v4 + 48), *(unsigned __int16 *)(v4 + 18));
              *(void *)(v4 + 56) = result;
            }
          }
        }
        else
        {
          *(_WORD *)(v4 + 8) |= 0x400u;
        }
      }
      else
      {
        *(_WORD *)(v4 + 8) |= 0x200u;
      }
    }
    else
    {
      *(_WORD *)(v4 + 8) |= 0x100u;
    }
  }
  if ((*(_WORD *)(v4 + 8) & 0x400) != 0)
  {
    *(_WORD *)(v4 + 8) &= 0xFCFFu;
  }
  else if ((*(_WORD *)(v4 + 8) & 0x200) != 0)
  {
    *(_WORD *)(v4 + 8) &= ~0x100u;
  }
  return result;
}

unsigned char **addaster(unsigned char **result, uint64_t a2, unsigned __int16 a3)
{
  for (unint64_t i = *result; ((char)*i - 48) <= 9; ++i)
    ;
  if (*i == 36)
  {
    *result = i + 1;
    *(_WORD *)(a2 + 8) |= 1u;
  }
  else
  {
    if ((*(_WORD *)(a2 + 8) & a3) != 0) {
      *(_WORD *)(a2 + 8) |= 1u;
    }
    *(_WORD *)(a2 + 8) |= a3;
  }
  return result;
}

uint64_t addsarg(uint64_t result, __int16 a2)
{
  if ((a2 & 0x1000) != 0)
  {
    *(unsigned char *)(result + 10) = 11;
  }
  else if ((a2 & 0x400) != 0)
  {
    *(unsigned char *)(result + 10) = 9;
  }
  else if ((a2 & 0x800) != 0)
  {
    *(unsigned char *)(result + 10) = 9;
  }
  else if ((a2 & 0x20) != 0)
  {
    *(unsigned char *)(result + 10) = 11;
  }
  else if ((a2 & 0x10) != 0)
  {
    *(unsigned char *)(result + 10) = 9;
  }
  else if ((a2 & 0x40) != 0)
  {
    *(unsigned char *)(result + 10) = 3;
  }
  else if ((a2 & 0x2000) != 0)
  {
    *(unsigned char *)(result + 10) = 1;
  }
  else
  {
    *(unsigned char *)(result + 10) = 5;
  }
  *(_WORD *)(result + 8) |= 0x10u;
  return result;
}

uint64_t _os_log_fmt_compute_mask(uint64_t a1, unint64_t a2)
{
  if (!a2)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  if (a2 > 8)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  uint64_t v4 = 0;
  for (unint64_t i = 0; i < a2; ++i)
    v4 |= (uint64_t)*(char *)(a1 + i) << (8 * i);
  return v4;
}

uint64_t _os_log_fmt_flatten_masked_data(unsigned char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, unsigned char *a8)
{
  if (!a3)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  *a1 &= 0xF8u;
  *a1 |= 2u;
  switch(a3)
  {
    case 0x68736168:
    case 0x68736168766564:
    case 0x786F626C69616DLL:
      goto LABEL_23;
    case 0x35646D6E69616C70:
      if (*a8)
      {
        LOWORD(v11) = 0;
      }
      else
      {
        ccmd5_di();
        ccdigest();
        unint64_t v11 = _os_log_fmt_truncate_to_maxsz(0x10uLL, a7, a8);
        if ((*(_WORD *)(a4 + 20) & 2) == 0)
        {
          if (v11 <= *(_DWORD *)(a4 + 12) - ((*(unsigned char *)(a4 + 22) ^ 1) & 1u) - *(_DWORD *)(a4 + 8))
          {
            __memcpy_chk();
            *(_DWORD *)(a4 + 8) += v11;
            if ((*(unsigned char *)(a4 + 22) & 1) == 0) {
              *(unsigned char *)(*(void *)a4 + *(unsigned int *)(a4 + 8)) = 0;
            }
          }
          else
          {
            os_trace_blob_add_slow(a4, (uint64_t)v16, v11);
          }
        }
      }
      goto LABEL_24;
    case 0x617474616C69616DLL:
    case 0x656D616E6C69616DLL:
    case 0x6A6275736C69616DLL:
    case 0x6D6D75736C69616DLL:
    case 0x6F6363616C69616DLL:
    case 0x7075626D6C69616DLL:
    case 0x726464616C69616DLL:
LABEL_23:
      LOWORD(v11) = 0;
      *a8 = 0;
LABEL_24:
      *a1 = *a1 & 0xF | 0xF0;
      return (unsigned __int16)v11;
  }
  *a1 = *a1 & 0xF | 0xE0;
  *a8 = 0;
  return 0;
}

unint64_t _os_log_fmt_truncate_to_maxsz(unint64_t a1, unint64_t a2, unsigned char *a3)
{
  unint64_t v4 = a1;
  if (a1 > a2)
  {
    *a3 = 1;
    return a2;
  }
  return v4;
}

uint64_t _os_log_fmt_flatten_to_blob(unsigned char *a1, unsigned __int8 a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7, unint64_t a8, unsigned char *a9, int *a10)
{
  uint64_t v26 = a1;
  unsigned __int8 v25 = a2;
  uint64_t v24 = a3;
  uint64_t v23 = a4;
  unint64_t v22 = a5;
  uint64_t v21 = a6;
  uint64_t v20 = a7;
  unint64_t v19 = a8;
  BOOL v18 = 0;
  __int16 v17 = 0;
  unsigned __int8 v16 = 0;
  unsigned __int8 v16 = *a1 & 7;
  if (a2 >= (int)privacy_flags2opt[v16] || *v26 >> 4 == 8)
  {
    if (*v26) {
      uint64_t v14 = v20;
    }
    else {
      uint64_t v14 = v21;
    }
    __int16 v17 = *(_DWORD *)(v14 + 8);
    unint64_t v22 = _os_log_fmt_flatten_data_into_blob(v14, a9, a10, v23, v22, v19, &v18);
    goto LABEL_12;
  }
  if (v24)
  {
    memset(__b, 0, sizeof(__b));
    __b[0] = (uint64_t)&v29;
    __b[1] = 0x36200000000;
    WORD2(__b[2]) = 0;
    BYTE6(__b[2]) = 1;
    LODWORD(__b[2]) = 0x10000;
    _os_log_fmt_flatten_data_into_blob((uint64_t)__b, a9, a10, v23, v22, 0x10000uLL, &v18);
    __int16 v17 = *(_DWORD *)(v21 + 8);
    LOWORD(v22) = _os_log_fmt_flatten_masked_data(v26, v25, v24, v21, __b[0], LODWORD(__b[1]), v19, &v18);
    unint64_t v22 = (unsigned __int16)v22;
    unint64_t v28 = __b;
    if ((__b[2] & 0x100000000) != 0) {
      os_trace_blob_destroy_slow((uint64_t)v28);
    }
LABEL_12:
    unsigned __int16 v10 = v26;
    char v12 = HIBYTE(v17);
    __int16 v13 = v22 & 0x7FFF | (v18 << 15);
    v26[2] = v17;
    v10[3] = v12;
    *((_WORD *)v10 + 2) = v13;
    return (unsigned __int16)v22;
  }
  return 0;
}

unint64_t _os_log_fmt_flatten_data_into_blob(uint64_t a1, unsigned char *a2, int *a3, uint64_t a4, unint64_t a5, unint64_t a6, BOOL *a7)
{
  uint64_t v18 = a1;
  __int16 v17 = a2;
  unsigned __int8 v16 = a3;
  uint64_t v15 = a4;
  unint64_t v14 = a5;
  unint64_t v13 = a6;
  char v12 = a7;
  *a7 = 0;
  if (v17 && v13)
  {
    unint64_t v11 = 0;
    if (v14 && v14 + 1 < v13) {
      unint64_t v13 = v14 + 1;
    }
    int v10 = os_trace_blob_addns(v18, v17, v13 - 1, &v11);
    uint64_t v32 = v18;
    int v31 = 0;
    char v30 = 0;
    uint64_t v35 = v18;
    char v34 = &v30;
    unint64_t v33 = 1;
    if ((*(_WORD *)(v18 + 20) & 2) != 0)
    {
      int v36 = 0;
    }
    else
    {
      uint64_t v37 = v35;
      if (v33 <= *(_DWORD *)(v37 + 12) - ((*(unsigned char *)(v37 + 22) ^ 1) & 1u) - *(_DWORD *)(v37 + 8))
      {
        __memcpy_chk();
        uint64_t v41 = v35;
        unint64_t v40 = v33;
        *(_DWORD *)(v35 + 8) += v33;
        if ((*(unsigned char *)(v41 + 22) & 1) == 0) {
          *(unsigned char *)(*(void *)v41 + *(unsigned int *)(v41 + 8)) = 0;
        }
        int v36 = v40;
      }
      else
      {
        int v36 = os_trace_blob_add_slow(v35, (uint64_t)v34, v33);
      }
    }
    if (!v14 || (BOOL v7 = 0, v11 < &v17[v14])) {
      BOOL v7 = *v11 != 0;
    }
    BOOL *v12 = v7;
    return (v10 + 1);
  }
  else if (v16 && v13)
  {
    char v9 = 0;
    unint64_t v14 = os_trace_blob_addnws(v18, v16, v13 - 1, &v9) + 1;
    BOOL *v12 = *v9 != 0;
    uint64_t v25 = v18;
    int v24 = 0;
    char v23 = 0;
    uint64_t v28 = v18;
    unint64_t v27 = &v23;
    unint64_t v26 = 1;
    if ((*(_WORD *)(v18 + 20) & 2) != 0)
    {
      int v29 = 0;
    }
    else
    {
      uint64_t v38 = v28;
      if (v26 <= *(_DWORD *)(v38 + 12) - ((*(unsigned char *)(v38 + 22) ^ 1) & 1u) - *(_DWORD *)(v38 + 8))
      {
        __memcpy_chk();
        uint64_t v43 = v28;
        unint64_t v42 = v26;
        *(_DWORD *)(v28 + 8) += v26;
        if ((*(unsigned char *)(v43 + 22) & 1) == 0) {
          *(unsigned char *)(*(void *)v43 + *(unsigned int *)(v43 + 8)) = 0;
        }
        int v29 = v42;
      }
      else
      {
        int v29 = os_trace_blob_add_slow(v28, (uint64_t)v27, v26);
      }
    }
  }
  else if (v17 || v16)
  {
    unint64_t v14 = 0;
    BOOL *v12 = 1;
  }
  else
  {
    unint64_t v14 = _os_log_fmt_truncate_to_maxsz(v14, v13, v12);
    uint64_t v21 = v18;
    uint64_t v20 = v15;
    unint64_t v19 = v14;
    if ((*(_WORD *)(v18 + 20) & 2) != 0)
    {
      int v22 = 0;
    }
    else
    {
      uint64_t v39 = v21;
      if (v19 <= *(_DWORD *)(v39 + 12) - ((*(unsigned char *)(v39 + 22) ^ 1) & 1u) - *(_DWORD *)(v39 + 8))
      {
        __memcpy_chk();
        uint64_t v45 = v21;
        unint64_t v44 = v19;
        *(_DWORD *)(v21 + 8) += v19;
        if ((*(unsigned char *)(v45 + 22) & 1) == 0) {
          *(unsigned char *)(*(void *)v45 + *(unsigned int *)(v45 + 8)) = 0;
        }
        int v22 = v44;
      }
      else
      {
        int v22 = os_trace_blob_add_slow(v21, v20, v19);
      }
    }
  }
  return v14;
}

uint64_t os_log_fmt_flatten(unsigned char *a1, unsigned __int8 a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v48 = a1;
  unsigned __int8 v47 = 0;
  unsigned __int8 v46 = a2;
  unint64_t v45 = 1024;
  uint64_t v44 = a3;
  uint64_t v43 = a4;
  uint64_t v42 = a5;
  int v41 = a6;
  BOOL v40 = a2 != 0;
  if (!a2)
  {
    uint64_t v39 = _os_assert_log();
    _os_crash();
    __break(1u);
  }
  int v38 = 0;
  uint64_t v60 = v44;
  int v59 = 0;
  int v59 = *(_DWORD *)(v44 + 8) + ((*(unsigned char *)(v44 + 22) ^ 1) & 1);
  if (*(_DWORD *)(v44 + 16))
  {
    unsigned int v61 = *(_DWORD *)(v60 + 16) - v59;
  }
  else if (*(_DWORD *)(v60 + 12))
  {
    unsigned int v61 = *(_DWORD *)(v60 + 12) - v59;
  }
  else
  {
    unsigned int v61 = 0;
  }
  BOOL v6 = 0;
  if (v61 >= v45)
  {
    uint64_t v57 = v43;
    int v56 = 0;
    int v56 = *(_DWORD *)(v43 + 8) + ((*(unsigned char *)(v43 + 22) ^ 1) & 1);
    if (*(_DWORD *)(v43 + 16)) {
      unsigned int v58 = *(_DWORD *)(v57 + 16) - v56;
    }
    else {
      unsigned int v58 = *(_DWORD *)(v57 + 12) ? *(_DWORD *)(v57 + 12) - v56 : 0;
    }
    BOOL v6 = 0;
    if (v58 >= v45)
    {
      uint64_t v54 = v42;
      int v53 = 0;
      int v53 = *(_DWORD *)(v42 + 8) + ((*(unsigned char *)(v42 + 22) ^ 1) & 1);
      if (*(_DWORD *)(v42 + 16))
      {
        unsigned int v55 = *(_DWORD *)(v54 + 16) - v53;
      }
      else if (*(_DWORD *)(v54 + 12))
      {
        unsigned int v55 = *(_DWORD *)(v54 + 12) - v53;
      }
      else
      {
        unsigned int v55 = 0;
      }
      BOOL v6 = v55 >= v45;
    }
  }
  int v38 = v6;
  if (!v6)
  {
    uint64_t v37 = _os_assert_log();
    _os_crash();
    __break(1u);
  }
  char v36 = 0;
  char v36 = privacy_opt2flags[v47];
  char v35 = 32 * v46;
  unsigned int v34 = 0;
  unsigned int v34 = *(_DWORD *)(v44 + 8);
  unsigned int v33 = 0;
  uint64_t __dst = 0;
  uint64_t result = (uint64_t)memset(__b, 0, sizeof(__b));
  __b[0] = 32 * v46;
  __b[1] = 0;
  if ((*v48 & 0x10) != 0) {
    __b[0] |= 0x10u;
  }
  unint64_t v30 = 0;
  unint64_t v30 = v45 - *(unsigned int *)(v44 + 8) - 2;
  uint64_t v51 = v44;
  int v50 = __b;
  unint64_t v49 = 2;
  if ((*(_WORD *)(v44 + 20) & 2) != 0)
  {
    int v52 = 0;
  }
  else
  {
    uint64_t v96 = v51;
    if (v49 <= *(_DWORD *)(v96 + 12) - ((*(unsigned char *)(v96 + 22) ^ 1) & 1u) - *(_DWORD *)(v96 + 8))
    {
      uint64_t result = __memcpy_chk();
      uint64_t v106 = v51;
      unint64_t v105 = v49;
      *(_DWORD *)(v51 + 8) += v49;
      if ((*(unsigned char *)(v106 + 22) & 1) == 0) {
        *(unsigned char *)(*(void *)v106 + *(unsigned int *)(v106 + 8)) = 0;
      }
      int v52 = v105;
    }
    else
    {
      uint64_t result = os_trace_blob_add_slow(v51, (uint64_t)v50, v49);
      int v52 = result;
    }
  }
  int v29 = v48 + 2;
  unsigned __int8 v28 = 0;
  while (v28 < (int)v48[1])
  {
    uint64_t result = (uint64_t)memset(v27, 0, sizeof(v27));
    unint64_t v26 = 0;
    __src = v29 + 2;
    v27[0] = *v29;
    v27[1] = v29[1];
    if ((v27[0] & 7) == 0) {
      v27[0] = v27[0] & 0xF0 | v27[0] & 0xF | v36 & 0xF;
    }
    switch(v27[0] >> 4)
    {
      case 0:
        unsigned int v33 = v27[1];
        goto LABEL_52;
      case 1:
        BOOL v22 = v27[1] == 4;
        if (v27[1] != 4)
        {
          uint64_t v21 = 0;
          uint64_t v21 = _os_assert_log();
          uint64_t result = _os_crash();
          __break(1u);
        }
        unsigned int v33 = *(_DWORD *)__src;
        if ((v33 & 0x80000000) != 0) {
          unsigned int v33 = 0;
        }
        v27[0] = v27[0] & 0xF0 | 2;
        goto LABEL_52;
      case 6:
        v27[0] &= 0xFu;
        __src = &v41;
        v27[1] = 4;
        unsigned int v33 = 4;
        goto LABEL_52;
      case 7:
        BOOL v24 = v27[1] == 8;
        if (v27[1] != 8)
        {
          uint64_t v23 = 0;
          uint64_t v23 = _os_assert_log();
          _os_crash();
          __break(1u);
        }
        uint64_t result = (uint64_t)memcpy(&__dst, __src, sizeof(__dst));
        goto LABEL_106;
      default:
        int v20 = 0;
        int v20 = (os_log_fmt_flatten_cmd_type_is_scalar[v27[0] >> 4] ^ 1) & 1;
        if (!v20)
        {
          uint64_t v19 = 0;
          uint64_t v19 = _os_assert_log();
          _os_crash();
          __break(1u);
        }
        BOOL v18 = v27[1] == 8;
        if (v27[1] != 8)
        {
          uint64_t v17 = 0;
          uint64_t v17 = _os_assert_log();
          _os_crash();
          __break(1u);
        }
        uint64_t result = (uint64_t)memcpy(&__src, __src, sizeof(__src));
        __b[0] |= 2u;
LABEL_52:
        if (os_log_fmt_flatten_cmd_type_is_scalar[v27[0] >> 4] & 1) == 0 || (v27[0])
        {
          v27[1] = 4;
          __int16 v15 = 0;
          v16 &= 0x8000u;
          v16 &= ~0x8000u;
          v67 = __b;
          uint64_t v66 = v44;
          v65 = v27;
          uint64_t v64 = &v15;
          uint64_t v63 = &v30;
          unsigned int v62 = 0;
          unsigned int v62 = *(_DWORD *)(v44 + 8);
          BOOL v11 = v30 < 6;
          v30 -= 6;
          BOOL v108 = v11;
          if (v11)
          {
            *v67 |= 0x80u;
            v68 = 0;
          }
          else
          {
            ++v67[1];
            uint64_t v75 = v66;
            v74 = v65;
            unint64_t v73 = 2;
            if ((*(_WORD *)(v66 + 20) & 2) != 0)
            {
              int v76 = 0;
            }
            else
            {
              uint64_t v95 = v75;
              if (v73 <= *(_DWORD *)(v95 + 12) - ((*(unsigned char *)(v95 + 22) ^ 1) & 1u) - *(_DWORD *)(v95 + 8))
              {
                uint64_t result = __memcpy_chk();
                uint64_t v104 = v75;
                unint64_t v103 = v73;
                *(_DWORD *)(v75 + 8) += v73;
                if ((*(unsigned char *)(v104 + 22) & 1) == 0) {
                  *(unsigned char *)(*(void *)v104 + *(unsigned int *)(v104 + 8)) = 0;
                }
                int v76 = v103;
              }
              else
              {
                uint64_t result = os_trace_blob_add_slow(v75, (uint64_t)v74, v73);
                int v76 = result;
              }
            }
            unint64_t v12 = v65[1];
            uint64_t v71 = v66;
            v70 = v64;
            unint64_t v69 = v12;
            if ((*(_WORD *)(v66 + 20) & 2) != 0)
            {
              int v72 = 0;
            }
            else
            {
              uint64_t v94 = v71;
              if (v69 <= *(_DWORD *)(v94 + 12) - ((*(unsigned char *)(v94 + 22) ^ 1) & 1u) - *(_DWORD *)(v94 + 8))
              {
                uint64_t result = __memcpy_chk();
                uint64_t v102 = v71;
                unint64_t v101 = v69;
                *(_DWORD *)(v71 + 8) += v69;
                if ((*(unsigned char *)(v102 + 22) & 1) == 0) {
                  *(unsigned char *)(*(void *)v102 + *(unsigned int *)(v102 + 8)) = 0;
                }
                int v72 = v101;
              }
              else
              {
                uint64_t result = os_trace_blob_add_slow(v71, (uint64_t)v70, v69);
                int v72 = result;
              }
            }
            v68 = (unsigned char *)(*(void *)v66 + v62);
          }
          unint64_t v26 = v68;
          if (!v68) {
            goto LABEL_107;
          }
          unsigned __int8 v14 = v27[0] & 7;
          if (__src && (v46 >= (int)privacy_flags2opt[v14] || __dst))
          {
            uint64_t result = _os_log_fmt_flatten_data(v26, v46, __dst, (uint64_t)__src, v33, v43, v42, v30);
            v30 -= (unsigned __int16)result;
          }
          else if (!__src && v46 < (int)privacy_flags2opt[v14] && __dst)
          {
            unsigned char *v26 = *v26 & 0xF | 0xF0;
            *v26 &= 0xF8u;
            unsigned char *v26 = *v26 & 0xF0 | *v26 & 0xD | 2;
          }
          if (!(*v26 >> 4) && (*((_WORD *)v26 + 2) & 0x7FFF) == 0) {
            *((_WORD *)v26 + 2) = *((_WORD *)v26 + 2) & 0x7FFF | 0x8000;
          }
          if (*v26) {
            __b[0] |= 1u;
          }
LABEL_105:
          unsigned int v33 = 0;
          uint64_t __dst = 0;
          goto LABEL_106;
        }
        v82 = __b;
        uint64_t v81 = v44;
        v80 = v27;
        v79 = __src;
        v78 = &v30;
        unsigned int v77 = 0;
        unsigned int v77 = *(_DWORD *)(v44 + 8);
        unint64_t v8 = v27[1] + 2;
        unint64_t v9 = v30 - v8;
        LOBYTE(v8) = v30 < v8;
        unint64_t v30 = v9;
        char v107 = v8 & 1;
        if (v8)
        {
          *v82 |= 0x80u;
          uint64_t v83 = 0;
        }
        else
        {
          ++v82[1];
          uint64_t v90 = v81;
          v89 = v80;
          unint64_t v88 = 2;
          if ((*(_WORD *)(v81 + 20) & 2) != 0)
          {
            int v91 = 0;
          }
          else
          {
            uint64_t v93 = v90;
            if (v88 <= *(_DWORD *)(v93 + 12) - ((*(unsigned char *)(v93 + 22) ^ 1) & 1u) - *(_DWORD *)(v93 + 8))
            {
              uint64_t result = __memcpy_chk();
              uint64_t v100 = v90;
              unint64_t v99 = v88;
              *(_DWORD *)(v90 + 8) += v88;
              if ((*(unsigned char *)(v100 + 22) & 1) == 0) {
                *(unsigned char *)(*(void *)v100 + *(unsigned int *)(v100 + 8)) = 0;
              }
              int v91 = v99;
            }
            else
            {
              uint64_t result = os_trace_blob_add_slow(v90, (uint64_t)v89, v88);
              int v91 = result;
            }
          }
          unint64_t v10 = v80[1];
          uint64_t v86 = v81;
          uint64_t v85 = (uint64_t)v79;
          unint64_t v84 = v10;
          if ((*(_WORD *)(v81 + 20) & 2) != 0)
          {
            int v87 = 0;
          }
          else
          {
            uint64_t v92 = v86;
            if (v84 <= *(_DWORD *)(v92 + 12) - ((*(unsigned char *)(v92 + 22) ^ 1) & 1u) - *(_DWORD *)(v92 + 8))
            {
              uint64_t result = __memcpy_chk();
              uint64_t v98 = v86;
              unint64_t v97 = v84;
              *(_DWORD *)(v86 + 8) += v84;
              if ((*(unsigned char *)(v98 + 22) & 1) == 0) {
                *(unsigned char *)(*(void *)v98 + *(unsigned int *)(v98 + 8)) = 0;
              }
              int v87 = v97;
            }
            else
            {
              uint64_t result = os_trace_blob_add_slow(v86, v85, v84);
              int v87 = result;
            }
          }
          uint64_t v83 = *(void *)v81 + v77;
        }
        if (!v83) {
          goto LABEL_107;
        }
        if (v27[0] >> 4 != 1) {
          goto LABEL_105;
        }
LABEL_106:
        ++v28;
        v29 += v29[1] + 2;
        break;
    }
  }
LABEL_107:
  unint64_t v13 = (unsigned char *)(*(void *)v44 + v34);
  *unint64_t v13 = __b[0];
  v13[1] = __b[1];
  return result;
}

uint64_t _os_log_fmt_flatten_data(unsigned char *a1, unsigned __int8 a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7, unint64_t a8)
{
  unint64_t v11 = a8;
  unint64_t v10 = 0;
  if (a8 > 0x7FFF) {
    unint64_t v11 = 0x7FFFLL;
  }
  int v8 = *a1 >> 4;
  if (!v8)
  {
    if (!a5)
    {
      _os_assert_log();
      _os_crash();
      __break(1u);
    }
    return (unsigned __int16)_os_log_fmt_flatten_to_blob(a1, a2, a3, a4, a5, a6, a7, v11, v10, 0);
  }
  if (v8 == 2)
  {
    unint64_t v10 = (unsigned char *)a4;
    if ((*a1 & 7) == 0) {
      *a1 = *a1 & 0xF0 | *a1 & 0xE | 1;
    }
    return (unsigned __int16)_os_log_fmt_flatten_to_blob(a1, a2, a3, a4, a5, a6, a7, v11, v10, 0);
  }
  if (v8 != 3)
  {
    _os_crash();
    __break(1u);
    return (unsigned __int16)_os_log_fmt_flatten_to_blob(a1, a2, a3, a4, a5, a6, a7, v11, v10, 0);
  }
  if (a5)
  {
    if ((*a1 & 7) == 0) {
      *a1 = *a1 & 0xF0 | *a1 & 0xE | 1;
    }
    return (unsigned __int16)_os_log_fmt_flatten_to_blob(a1, a2, a3, a4, a5, a6, a7, v11, v10, 0);
  }
  return 0;
}

uint64_t os_log_fmt_read_scalar(uint64_t a1, unsigned __int8 *a2, __int16 a3)
{
  memset(&__b, 0, sizeof(__b));
  if (*(unsigned char *)(a1 + 10) == 14) {
    return *(void *)a2;
  }
  if (*(unsigned char *)(a1 + 10) == 15) {
    return *(void *)a2;
  }
  if ((*(_WORD *)(a1 + 8) & 0x20) != 0)
  {
    switch(a3)
    {
      case 1:
        uint64_t __b = *a2;
        break;
      case 2:
        uint64_t __b = *(unsigned __int16 *)a2;
        break;
      case 4:
        uint64_t __b = *(unsigned int *)a2;
        break;
      case 8:
        uint64_t __b = *(void *)a2;
        break;
      default:
        goto LABEL_16;
    }
  }
  else
  {
    switch(a3)
    {
      case 1:
        uint64_t __b = (char)*a2;
        break;
      case 2:
        uint64_t __b = *(__int16 *)a2;
        break;
      case 4:
        uint64_t __b = *(int *)a2;
        break;
      case 8:
        uint64_t __b = *(void *)a2;
        break;
      default:
LABEL_16:
        _os_crash();
        __break(1u);
        break;
    }
  }
  return __b;
}

unsigned char *os_log_fmt_convert_trace(unsigned char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = a2;
  unsigned __int8 v9 = *(unsigned char *)(a2 + a3 - 1);
  unint64_t v8 = a2 + a3 - v9 - 1;
  BOOL v6 = a1 + 2;
  *a1 = 0;
  a1[1] = v9;
  for (unint64_t i = 0; i < v9; ++i)
  {
    unsigned __int8 v4 = *(unsigned char *)(v8 + i) & 0x3F;
    if (v10 + (unint64_t)v4 > v8) {
      return 0;
    }
    *BOOL v6 = 0;
    v6[1] = v4;
    __memcpy_chk();
    v10 += v4;
    v6 += v4 + 2;
  }
  return a1;
}

void *os_log_fmt_extract_pubdata(uint64_t a1, unsigned __int16 a2, void *a3, unsigned __int16 *a4)
{
  *a3 = 0;
  *a4 = 0;
  if (!a2) {
    return &os_log_fmt_extract_pubdata_empty_hdr;
  }
  if (a2 < 2uLL) {
    return 0;
  }
  uint64_t v8 = a1 + 2;
  unsigned __int16 v7 = a2 - 2;
  for (unsigned __int16 i = 0; i < (int)*(unsigned __int8 *)(a1 + 1); ++i)
  {
    uint64_t v5 = v8;
    if (v7 < 2uLL) {
      return 0;
    }
    if (v7 < (unint64_t)*(unsigned __int8 *)(v8 + 1) + 2) {
      return 0;
    }
    v8 += *(unsigned __int8 *)(v8 + 1) + 2;
    v7 -= *(unsigned __int8 *)(v5 + 1) + 2;
  }
  *a3 = v8;
  *a4 = v7;
  return (void *)a1;
}

uint64_t os_log_fmt_read_aster_if_necessary(uint64_t result, _WORD *a2, void *a3)
{
  uint64_t v5 = result;
  if ((*(_WORD *)(result + 8) & 2) != 0)
  {
    if (*a2)
    {
      unsigned __int8 v9 = (unsigned char *)*a3;
      --*a2;
      *a3 = &v9[v9[1] + 2];
      uint64_t v10 = v9;
    }
    else
    {
      uint64_t v10 = 0;
    }
    if (v10 && v10[1] == 4 && (*v10 >> 4 == 1 || !(*v10 >> 4))) {
      uint64_t result = __memcpy_chk();
    }
    else {
      *(_DWORD *)(result + 20) = 0;
    }
  }
  if ((*(_WORD *)(v5 + 8) & 8) != 0)
  {
    if ((*(_WORD *)(v5 + 8) & 4) == 0 && ((*(_WORD *)(v5 + 8) & 0x10) != 0 || *(unsigned char *)(v5 + 10) == 18))
    {
      if (*a2 && *(unsigned char *)*a3 >> 4 == 1)
      {
        if (*a2)
        {
          uint64_t v8 = (unsigned char *)*a3;
          --*a2;
          *a3 = &v8[v8[1] + 2];
        }
      }
      *(_WORD *)(v5 + 8) &= ~8u;
    }
    else
    {
      if (*a2)
      {
        BOOL v6 = (unsigned char *)*a3;
        --*a2;
        *a3 = &v6[v6[1] + 2];
        unsigned __int16 v7 = v6;
      }
      else
      {
        unsigned __int16 v7 = 0;
      }
      if (v7 && v7[1] == 4 && (*v7 >> 4 == 1 || !(*v7 >> 4))) {
        return __memcpy_chk();
      }
      else {
        *(_DWORD *)(v5 + 24) = -1;
      }
    }
  }
  return result;
}

uint64_t os_log_fmt_get_data(uint64_t a1, unsigned __int8 a2, unsigned __int8 a3, __int16 *a4, __int16 a5, uint64_t a6, __int16 **a7, _WORD *a8, BOOL *a9, __int16 *a10, unsigned __int16 a11, __int16 *a12, unsigned __int16 a13)
{
  uint64_t v27 = a1;
  unsigned __int8 v26 = a2;
  unsigned __int8 v25 = a3;
  BOOL v24 = a4;
  __int16 v23 = a5;
  uint64_t v22 = a6;
  uint64_t v21 = a7;
  int v20 = a8;
  uint64_t v19 = a10;
  unsigned __int16 v18 = a11;
  unsigned __int8 v17 = 0;
  if (!a4)
  {
    unsigned __int8 v17 = 2;
LABEL_63:
    *uint64_t v21 = 0;
    *int v20 = 0;
    return v17;
  }
  if (*(unsigned char *)v24 >> 4 == 14)
  {
    if (*(void *)(v27 + 56))
    {
      if (os_log_fmt_validate_mask(*(void *)(v27 + 56))) {
        unsigned __int8 v17 = 8;
      }
      else {
        unsigned __int8 v17 = 10;
      }
    }
    else
    {
      unsigned __int8 v17 = 3;
    }
    goto LABEL_63;
  }
  if (*(unsigned char *)v24)
  {
    unsigned __int8 v16 = privacy_flags2opt[*(unsigned char *)v24 & 7];
    if (!v16)
    {
      unsigned __int8 v17 = 3;
      goto LABEL_63;
    }
    if (v16 > (int)v25)
    {
      unsigned __int8 v17 = 1;
      goto LABEL_63;
    }
    if (v26)
    {
      if (v26 - 1 <= 2 && v16 > (int)v26 && *(unsigned char *)v24 >> 4 != 8)
      {
        unsigned __int8 v17 = 1;
        goto LABEL_63;
      }
    }
    else if (!a12)
    {
      unsigned __int8 v17 = 1;
      goto LABEL_63;
    }
    uint64_t v19 = a12;
    unsigned __int16 v18 = a13;
  }
  if (!v19 && v18)
  {
    unsigned __int8 v17 = 4;
    goto LABEL_63;
  }
  *a9 = 0;
  if ((*(unsigned char *)v24 & 1) == 0 && !(*(unsigned char *)v24 >> 4))
  {
    uint64_t v19 = v24 + 1;
    unsigned __int16 v18 = *((unsigned __int8 *)v24 + 1);
    *a9 = v18 == 0;
LABEL_57:
    if (*a9 && !(*(unsigned char *)v24 >> 4))
    {
      unsigned __int8 v17 = 2;
      goto LABEL_63;
    }
    *uint64_t v21 = v19;
    *int v20 = v18;
    if (_os_log_fmt_validate_cmd(v27, v22, v24, v18)) {
      return 0;
    }
    else {
      return 3;
    }
  }
  __int16 v15 = _os_log_fmt_compose_read_range(v24, v18, &v17);
  if (!v15) {
    goto LABEL_63;
  }
  if (v19) {
    uint64_t v19 = (__int16 *)((char *)v19 + *(unsigned __int16 *)v15);
  }
  *a9 = *((__int16 *)v15 + 1) < 0;
  if (!*a9 || v23 || (*((_WORD *)v15 + 1) & 0x7FFF) != 0 || v18 - *(unsigned __int16 *)v15 < 0x8000)
  {
    unsigned __int16 v18 = *((_WORD *)v15 + 1) & 0x7FFF;
  }
  else
  {
    unsigned __int16 v18 = 0x8000;
    *a9 = 0;
  }
  if (*(unsigned char *)v24 >> 4 != 15) {
    goto LABEL_57;
  }
  uint64_t v13 = *(void *)(v27 + 56);
  switch(v13)
  {
    case 0:
      unsigned __int8 v17 = 3;
      goto LABEL_63;
    case 0x68736168:
    case 0x68736168766564:
      goto LABEL_52;
    case 0x786F626C69616DLL:
      goto LABEL_54;
    case 0x35646D6E69616C70:
LABEL_52:
      *uint64_t v21 = v19;
      *int v20 = v18;
      return 5;
    case 0x617474616C69616DLL:
    case 0x656D616E6C69616DLL:
    case 0x6A6275736C69616DLL:
    case 0x6D6D75736C69616DLL:
    case 0x6F6363616C69616DLL:
LABEL_54:
      *uint64_t v21 = v19;
      *int v20 = v18;
      return 6;
    case 0x7075626D6C69616DLL:
      goto LABEL_52;
  }
  if (v13 != 0x726464616C69616DLL)
  {
    unsigned __int8 v17 = 9;
    goto LABEL_63;
  }
  *uint64_t v21 = v19;
  *int v20 = v18;
  return 7;
}

BOOL os_log_fmt_validate_mask(uint64_t a1)
{
  return a1 == 1752392040
      || a1 == 0x68736168766564
      || a1 == 0x786F626C69616DLL
      || a1 == 0x35646D6E69616C70
      || a1 == 0x617474616C69616DLL
      || a1 == 0x656D616E6C69616DLL
      || a1 == 0x6A6275736C69616DLL
      || a1 == 0x6D6D75736C69616DLL
      || a1 == 0x6F6363616C69616DLL
      || a1 == 0x7075626D6C69616DLL
      || a1 == 0x726464616C69616DLL;
}

unsigned __int8 *_os_log_fmt_compose_read_range(__int16 *a1, unsigned __int16 a2, unsigned char *a3)
{
  if (((*(unsigned char *)a1 & 1) != 0 || *(unsigned __int8 *)a1 >> 4 > 1u) && *((unsigned char *)a1 + 1) == 4)
  {
    if (a2 >= (int)(unsigned __int16)a1[1] && a2 - (unsigned __int16)a1[1] >= (a1[2] & 0x7FFF))
    {
      if (a1[2] >= 0 || *(unsigned char *)a1 >> 4)
      {
        return (unsigned __int8 *)(a1 + 1);
      }
      else
      {
        *a3 = 2;
        return 0;
      }
    }
    else
    {
      *a3 = 4;
      return 0;
    }
  }
  else
  {
    *a3 = 3;
    return 0;
  }
}

BOOL _os_log_fmt_validate_cmd(uint64_t a1, unsigned __int16 a2, unsigned char *a3, unsigned __int16 a4)
{
  if (*a3 >> 4 == 1)
  {
    return 0;
  }
  else if (((*(_WORD *)(a1 + 8) & 0x10) != 0) == (*a3 >> 4 == 0))
  {
    if ((*(_WORD *)(a1 + 8) & 0x10) != 0 && (!a4 || ((a4 - 1) & a4) != 0))
    {
      return 0;
    }
    else
    {
      switch(*(unsigned char *)(a1 + 10))
      {
        case 1:
        case 2:
          BOOL v6 = a4 <= 4uLL;
          break;
        case 3:
        case 4:
          BOOL v6 = a4 <= 4uLL;
          break;
        case 5:
        case 6:
        case 7:
        case 8:
          BOOL v6 = a4 <= 4uLL;
          break;
        case 9:
        case 0xA:
          BOOL v6 = a4 <= (int)a2;
          break;
        case 0xB:
        case 0xC:
          BOOL v6 = a4 <= 8uLL;
          break;
        case 0xD:
          BOOL v6 = a4 == a2;
          break;
        case 0xE:
          BOOL v6 = a4 == 8;
          break;
        case 0xF:
          BOOL v6 = a4 == 8;
          break;
        case 0x10:
          BOOL v6 = *a3 >> 4 == 2;
          break;
        case 0x11:
          BOOL v6 = *a3 >> 4 == 5;
          break;
        case 0x12:
          int v4 = *a3 >> 4;
          BOOL v6 = (v4 - 2) < 3 || v4 == 8;
          break;
        case 0x13:
          BOOL v6 = *a3 >> 4 == 3;
          break;
        default:
          _os_crash();
          __break(1u);
          break;
      }
    }
  }
  else
  {
    return 0;
  }
  return v6;
}

void os_log_fmt_compose(uint64_t a1, char *a2, uint64_t a3, unsigned __int8 a4, uint64_t a5, unsigned char *a6, __int16 *a7, unsigned __int16 a8, __int16 *a9, unsigned __int16 a10)
{
  uint64_t v38 = a1;
  uint64_t v37 = a2;
  uint64_t v36 = a3;
  unsigned __int8 v35 = a4;
  uint64_t v34 = a5;
  unsigned int v33 = a6;
  uint64_t v32 = a7;
  unsigned __int16 v31 = a8;
  unint64_t v30 = a6 + 2;
  __int16 v29 = 0;
  __int16 v29 = a6[1];
  unsigned __int8 v28 = 0;
  unsigned __int8 v28 = (*a6 & 0x60) >> 5;
  memset(__b, 0, 0x40uLL);
  unsigned __int8 v26 = 0;
  while (1)
  {
    unint64_t v25 = 0;
    unint64_t v25 = strcspn(v37, "%");
    uint64_t v41 = v38;
    BOOL v40 = v37;
    unint64_t v39 = v25;
    if ((*(_WORD *)(v38 + 20) & 2) != 0)
    {
      int v42 = 0;
    }
    else
    {
      uint64_t v57 = v41;
      if (v39 <= *(_DWORD *)(v57 + 12) - ((*(unsigned char *)(v57 + 22) ^ 1) & 1u) - *(_DWORD *)(v57 + 8))
      {
        __memcpy_chk();
        uint64_t v61 = v41;
        unint64_t v60 = v39;
        *(_DWORD *)(v41 + 8) += v39;
        if ((*(unsigned char *)(v61 + 22) & 1) == 0) {
          *(unsigned char *)(*(void *)v61 + *(unsigned int *)(v61 + 8)) = 0;
        }
        int v42 = v60;
      }
      else
      {
        int v42 = os_trace_blob_add_slow(v41, (uint64_t)v40, v39);
      }
    }
    v37 += v25;
    if (!*v37) {
      break;
    }
    unint64_t v25 = os_log_fmt_delimit(v37, v36, (size_t)__b);
    if (v25)
    {
      v37 += v25;
      if (__b[4])
      {
        _os_log_fmt_decode_give_up(v38, (uint64_t)__b, v10, v11, v12, v13, v14, v15);
        return;
      }
      os_log_fmt_read_aster_if_necessary((uint64_t)__b, &v29, &v30);
      BOOL v24 = 0;
      unsigned __int16 v23 = 0;
      unint64_t v45 = (uint64_t *)&v30;
      uint64_t v44 = &v29;
      if (v29)
      {
        uint64_t v43 = 0;
        uint64_t v43 = *v45;
        --*v44;
        *unint64_t v45 = v43 + 2 + *(unsigned __int8 *)(v43 + 1);
        unsigned __int8 v46 = (__int16 *)v43;
      }
      else
      {
        unsigned __int8 v46 = 0;
      }
      unsigned __int8 v26 = v46;
      BOOL v22 = 0;
      unsigned __int8 data = os_log_fmt_get_data((uint64_t)__b, v28, v35, v46, v29, v34, (__int16 **)&v24, &v23, &v22, v32, v31, a9, a10);
      if (data == 5)
      {
        _os_log_fmt_compose_masked_digest(v38, (uint64_t)__b, (uint64_t)v24, v23, v22, v17, v18, v19);
      }
      else if (data == 6 || data == 7)
      {
        _os_log_fmt_compose_masked_partial_redacted(v38, (uint64_t)__b, v24, v23, v22);
      }
      else if (data)
      {
        _os_log_fmt_decode_data_access_failure(v38, (uint64_t)__b, data, v26, v23, v17, v18, v19);
      }
      else if ((__b[4] & 0x40) == 0 {
             || (_os_log_fmt_compose_annotated(v38, v34, (uint64_t)__b, (uint64_t)v26, (uint64_t)v24, v23, v22) & 1) == 0)
      }
      {
        if ((__b[4] & 0x10) != 0) {
          _os_log_fmt_compose_scalar(v38, (uint64_t)__b, v34, v24, v23);
        }
        else {
          _os_log_fmt_compose_data(v38, (uint64_t)__b, v26, (uint64_t)v24, v23, v22);
        }
      }
    }
    else
    {
      if (!v37[1]) {
        break;
      }
      int v16 = v37[1];
      uint64_t v49 = v38;
      int v48 = v16;
      char v47 = v16;
      uint64_t v52 = v38;
      uint64_t v51 = &v47;
      unint64_t v50 = 1;
      if ((*(_WORD *)(v38 + 20) & 2) != 0)
      {
        int v53 = 0;
      }
      else
      {
        uint64_t v56 = v52;
        if (v50 <= *(_DWORD *)(v56 + 12) - ((*(unsigned char *)(v56 + 22) ^ 1) & 1u) - *(_DWORD *)(v56 + 8))
        {
          __memcpy_chk();
          uint64_t v59 = v52;
          unint64_t v58 = v50;
          *(_DWORD *)(v52 + 8) += v50;
          if ((*(unsigned char *)(v59 + 22) & 1) == 0) {
            *(unsigned char *)(*(void *)v59 + *(unsigned int *)(v59 + 8)) = 0;
          }
          int v53 = v58;
        }
        else
        {
          int v53 = os_trace_blob_add_slow(v52, (uint64_t)v51, v50);
        }
      }
      v37 += 2;
    }
  }
  uint64_t v55 = v38;
  unsigned int i = 0;
  for (unsigned int i = *(_DWORD *)(v38 + 8); ; --i)
  {
    BOOL v20 = 0;
    if (i) {
      BOOL v20 = isspace(*(char *)(*(void *)v55 + i - 1)) != 0;
    }
    if (!v20) {
      break;
    }
  }
  uint64_t v63 = v55;
  unsigned int v62 = i;
  *(_DWORD *)(v55 + 8) = i;
  if ((*(unsigned char *)(v63 + 22) & 1) == 0) {
    *(unsigned char *)(*(void *)v63 + v62) = 0;
  }
}

unint64_t _os_log_fmt_compose_masked_digest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned __int16 v10 = a4;
  char v9 = a5;
  os_trace_blob_addf(a1, "<mask.%.*s: ", a3, a4, a5, a6, a7, a8, *(_WORD *)(a2 + 18));
  if (v10 || (v9 & 1) != 0)
  {
    os_trace_blob_add_hexdump(a1, a3, v10, v9 & 1);
  }
  else
  {
    size_t v14 = strlen("(null)");
    if ((*(_WORD *)(a1 + 20) & 2) == 0)
    {
      if (v14 <= *(_DWORD *)(a1 + 12) - ((*(unsigned char *)(a1 + 22) ^ 1) & 1u) - *(_DWORD *)(a1 + 8))
      {
        __memcpy_chk();
        *(_DWORD *)(a1 + 8) += v14;
        if ((*(unsigned char *)(a1 + 22) & 1) == 0) {
          *(unsigned char *)(*(void *)a1 + *(unsigned int *)(a1 + 8)) = 0;
        }
      }
      else
      {
        os_trace_blob_add_slow(a1, (uint64_t)"(null)", v14);
      }
    }
  }
  unint64_t result = strlen(">");
  int v13 = result;
  if ((*(_WORD *)(a1 + 20) & 2) == 0)
  {
    if (result <= *(_DWORD *)(a1 + 12) - ((*(unsigned char *)(a1 + 22) ^ 1) & 1u) - *(_DWORD *)(a1 + 8))
    {
      unint64_t result = __memcpy_chk();
      *(_DWORD *)(a1 + 8) += v13;
      if ((*(unsigned char *)(a1 + 22) & 1) == 0) {
        *(unsigned char *)(*(void *)a1 + *(unsigned int *)(a1 + 8)) = 0;
      }
    }
    else
    {
      return os_trace_blob_add_slow(a1, (uint64_t)">", result);
    }
  }
  return result;
}

uint64_t _os_log_fmt_compose_masked_partial_redacted(uint64_t a1, uint64_t a2, unsigned char *a3, unsigned __int16 a4, char a5)
{
  uint64_t v38 = a1;
  uint64_t v37 = a2;
  uint64_t v36 = a3;
  unsigned __int16 v35 = a4;
  char v34 = a5;
  if (a4 || (v34 & 1) != 0)
  {
    if (v35 >= 4uLL)
    {
      memset(__b, 0, sizeof(__b));
      __b[0] = *v36;
      __b[1] = v36[1];
      unsigned char __b[2] = v36[2];
      uint64_t __b[3] = v36[3];
      BOOL v32 = __b[3] == 2;
      BOOL v6 = 0;
      if ((v34 & 1) == 0)
      {
        BOOL v6 = 0;
        if (!__b[0])
        {
          BOOL v6 = 1;
          if (__b[3] == 2) {
            BOOL v6 = __b[2] == 0;
          }
        }
      }
      if (v6)
      {
        return os_trace_blob_addns(v38, v36 + 4, v35 - 4, 0);
      }
      else
      {
        BOOL v7 = 1;
        if (__b[3] != 2) {
          BOOL v7 = __b[3] == 0;
        }
        BOOL v31 = v7;
        BOOL v30 = __b[3] == 1;
        uint64_t v103 = v38;
        uint64_t v102 = "<";
        size_t v8 = strlen("<");
        uint64_t v106 = v38;
        unint64_t v105 = "<";
        size_t v104 = v8;
        if ((*(_WORD *)(v38 + 20) & 2) != 0)
        {
          int v107 = 0;
        }
        else
        {
          uint64_t v108 = v106;
          if (v104 <= *(_DWORD *)(v108 + 12) - ((*(unsigned char *)(v108 + 22) ^ 1) & 1u) - *(_DWORD *)(v108 + 8))
          {
            __memcpy_chk();
            uint64_t v110 = v106;
            unint64_t v109 = v104;
            *(_DWORD *)(v106 + 8) += v104;
            if ((*(unsigned char *)(v110 + 22) & 1) == 0) {
              *(unsigned char *)(*(void *)v110 + *(unsigned int *)(v110 + 8)) = 0;
            }
            int v107 = v109;
          }
          else
          {
            int v107 = os_trace_blob_add_slow(v106, (uint64_t)v105, v104);
          }
        }
        if ((unint64_t)__b[0] + 4 < v35)
        {
          uint64_t v29 = __b[0] + 4;
          if (v32)
          {
            if (__b[2] >= (unint64_t)v35 - v29) {
              unint64_t v15 = v35 - v29;
            }
            else {
              unint64_t v15 = __b[2];
            }
          }
          else
          {
            unint64_t v15 = v35 - v29;
          }
          unint64_t v28 = v15;
          char v27 = 0;
          if (v15)
          {
            if (v30)
            {
              uint64_t v94 = v38;
              uint64_t v93 = "…";
              size_t v16 = strlen("…");
              uint64_t v97 = v38;
              uint64_t v96 = "…";
              size_t v95 = v16;
              if ((*(_WORD *)(v38 + 20) & 2) != 0)
              {
                int v98 = 0;
              }
              else
              {
                uint64_t v99 = v97;
                if (v95 <= *(_DWORD *)(v99 + 12) - ((*(unsigned char *)(v99 + 22) ^ 1) & 1u) - *(_DWORD *)(v99 + 8))
                {
                  __memcpy_chk();
                  uint64_t v101 = v97;
                  unint64_t v100 = v95;
                  *(_DWORD *)(v97 + 8) += v95;
                  if ((*(unsigned char *)(v101 + 22) & 1) == 0) {
                    *(unsigned char *)(*(void *)v101 + *(unsigned int *)(v101 + 8)) = 0;
                  }
                  int v98 = v100;
                }
                else
                {
                  int v98 = os_trace_blob_add_slow(v97, (uint64_t)v96, v95);
                }
              }
              char v27 = 1;
            }
            if (os_trace_blob_addns(v38, &v36[v29], v28, 0))
            {
              if (v31 || (v34 & 1) != 0)
              {
                uint64_t v85 = v38;
                unint64_t v84 = "…";
                size_t v17 = strlen("…");
                uint64_t v88 = v38;
                int v87 = "…";
                size_t v86 = v17;
                if ((*(_WORD *)(v38 + 20) & 2) != 0)
                {
                  int v89 = 0;
                }
                else
                {
                  uint64_t v90 = v88;
                  if (v86 <= *(_DWORD *)(v90 + 12) - ((*(unsigned char *)(v90 + 22) ^ 1) & 1u) - *(_DWORD *)(v90 + 8))
                  {
                    __memcpy_chk();
                    uint64_t v92 = v88;
                    unint64_t v91 = v86;
                    *(_DWORD *)(v88 + 8) += v86;
                    if ((*(unsigned char *)(v92 + 22) & 1) == 0) {
                      *(unsigned char *)(*(void *)v92 + *(unsigned int *)(v92 + 8)) = 0;
                    }
                    int v89 = v91;
                  }
                  else
                  {
                    int v89 = os_trace_blob_add_slow(v88, (uint64_t)v87, v86);
                  }
                }
              }
              char v27 = 1;
            }
          }
          if (v32)
          {
            unint64_t v26 = __b[0] + 4 + v28;
            unint64_t v25 = v35 - v26;
            if (v25)
            {
              if (v30)
              {
                uint64_t v76 = v38;
                uint64_t v75 = "…";
                size_t v18 = strlen("…");
                uint64_t v79 = v38;
                v78 = "…";
                size_t v77 = v18;
                if ((*(_WORD *)(v38 + 20) & 2) != 0)
                {
                  int v80 = 0;
                }
                else
                {
                  uint64_t v81 = v79;
                  if (v77 <= *(_DWORD *)(v81 + 12) - ((*(unsigned char *)(v81 + 22) ^ 1) & 1u) - *(_DWORD *)(v81 + 8))
                  {
                    __memcpy_chk();
                    uint64_t v83 = v79;
                    unint64_t v82 = v77;
                    *(_DWORD *)(v79 + 8) += v77;
                    if ((*(unsigned char *)(v83 + 22) & 1) == 0) {
                      *(unsigned char *)(*(void *)v83 + *(unsigned int *)(v83 + 8)) = 0;
                    }
                    int v80 = v82;
                  }
                  else
                  {
                    int v80 = os_trace_blob_add_slow(v79, (uint64_t)v78, v77);
                  }
                }
                char v27 = 1;
              }
              if (os_trace_blob_addns(v38, &v36[v26], v25, 0))
              {
                if (v31)
                {
                  uint64_t v67 = v38;
                  uint64_t v66 = "…";
                  size_t v19 = strlen("…");
                  uint64_t v70 = v38;
                  unint64_t v69 = "…";
                  size_t v68 = v19;
                  if ((*(_WORD *)(v38 + 20) & 2) != 0)
                  {
                    int v71 = 0;
                  }
                  else
                  {
                    uint64_t v72 = v70;
                    if (v68 <= *(_DWORD *)(v72 + 12) - ((*(unsigned char *)(v72 + 22) ^ 1) & 1u) - *(_DWORD *)(v72 + 8))
                    {
                      __memcpy_chk();
                      uint64_t v74 = v70;
                      unint64_t v73 = v68;
                      *(_DWORD *)(v70 + 8) += v68;
                      if ((*(unsigned char *)(v74 + 22) & 1) == 0) {
                        *(unsigned char *)(*(void *)v74 + *(unsigned int *)(v74 + 8)) = 0;
                      }
                      int v71 = v73;
                    }
                    else
                    {
                      int v71 = os_trace_blob_add_slow(v70, (uint64_t)v69, v68);
                    }
                  }
                }
                char v27 = 1;
              }
            }
          }
          if (v27)
          {
            uint64_t v58 = v38;
            uint64_t v57 = ", ";
            size_t v20 = strlen(", ");
            uint64_t v61 = v38;
            unint64_t v60 = ", ";
            size_t v59 = v20;
            if ((*(_WORD *)(v38 + 20) & 2) != 0)
            {
              int v62 = 0;
            }
            else
            {
              uint64_t v63 = v61;
              if (v59 <= *(_DWORD *)(v63 + 12) - ((*(unsigned char *)(v63 + 22) ^ 1) & 1u) - *(_DWORD *)(v63 + 8))
              {
                __memcpy_chk();
                uint64_t v65 = v61;
                unint64_t v64 = v59;
                *(_DWORD *)(v61 + 8) += v59;
                if ((*(unsigned char *)(v65 + 22) & 1) == 0) {
                  *(unsigned char *)(*(void *)v65 + *(unsigned int *)(v65 + 8)) = 0;
                }
                int v62 = v64;
              }
              else
              {
                int v62 = os_trace_blob_add_slow(v61, (uint64_t)v60, v59);
              }
            }
          }
        }
        os_trace_blob_addf(v38, "length=%u", v9, v10, v11, v12, v13, v14, __b[1]);
        uint64_t v24 = (uint64_t)(v36 + 4);
        if (__b[0] >= (unint64_t)v35 - 4) {
          uint64_t v21 = v35 - 4;
        }
        else {
          uint64_t v21 = __b[0];
        }
        unint64_t v23 = v21;
        if (v21)
        {
          uint64_t v49 = v38;
          int v48 = ", ";
          size_t v22 = strlen(", ");
          uint64_t v52 = v38;
          uint64_t v51 = ", ";
          size_t v50 = v22;
          if ((*(_WORD *)(v38 + 20) & 2) != 0)
          {
            int v53 = 0;
          }
          else
          {
            uint64_t v54 = v52;
            if (v50 <= *(_DWORD *)(v54 + 12) - ((*(unsigned char *)(v54 + 22) ^ 1) & 1u) - *(_DWORD *)(v54 + 8))
            {
              __memcpy_chk();
              uint64_t v56 = v52;
              unint64_t v55 = v50;
              *(_DWORD *)(v52 + 8) += v50;
              if ((*(unsigned char *)(v56 + 22) & 1) == 0) {
                *(unsigned char *)(*(void *)v56 + *(unsigned int *)(v56 + 8)) = 0;
              }
              int v53 = v55;
            }
            else
            {
              int v53 = os_trace_blob_add_slow(v52, (uint64_t)v51, v50);
            }
          }
          os_trace_blob_add_hexdump(v38, v24, v23, v23 != __b[0]);
        }
        uint64_t v40 = v38;
        __s = ">";
        uint64_t result = strlen(">");
        uint64_t v43 = v38;
        int v42 = ">";
        unint64_t v41 = result;
        if ((*(_WORD *)(v38 + 20) & 2) != 0)
        {
          int v44 = 0;
        }
        else
        {
          uint64_t v45 = v43;
          if (v41 <= *(_DWORD *)(v45 + 12) - ((*(unsigned char *)(v45 + 22) ^ 1) & 1u) - *(_DWORD *)(v45 + 8))
          {
            uint64_t result = __memcpy_chk();
            uint64_t v47 = v43;
            unint64_t v46 = v41;
            *(_DWORD *)(v43 + 8) += v41;
            if ((*(unsigned char *)(v47 + 22) & 1) == 0) {
              *(unsigned char *)(*(void *)v47 + *(unsigned int *)(v47 + 8)) = 0;
            }
          }
          else
          {
            uint64_t result = os_trace_blob_add_slow(v43, (uint64_t)v42, v41);
            int v44 = result;
          }
        }
      }
    }
    else
    {
      uint64_t v112 = v38;
      v111 = "<…>";
      uint64_t result = strlen("<…>");
      uint64_t v115 = v38;
      v114 = "<…>";
      unint64_t v113 = result;
      if ((*(_WORD *)(v38 + 20) & 2) != 0)
      {
        int v116 = 0;
      }
      else
      {
        uint64_t v117 = v115;
        if (v113 <= *(_DWORD *)(v117 + 12) - ((*(unsigned char *)(v117 + 22) ^ 1) & 1u) - *(_DWORD *)(v117 + 8))
        {
          uint64_t result = __memcpy_chk();
          uint64_t v119 = v115;
          unint64_t v118 = v113;
          *(_DWORD *)(v115 + 8) += v113;
          if ((*(unsigned char *)(v119 + 22) & 1) == 0) {
            *(unsigned char *)(*(void *)v119 + *(unsigned int *)(v119 + 8)) = 0;
          }
          int v116 = v118;
        }
        else
        {
          uint64_t result = os_trace_blob_add_slow(v115, (uint64_t)v114, v113);
          int v116 = result;
        }
      }
    }
  }
  else
  {
    uint64_t v121 = v38;
    v120 = "<(null)>";
    uint64_t result = strlen("<(null)>");
    uint64_t v124 = v38;
    v123 = "<(null)>";
    unint64_t v122 = result;
    if ((*(_WORD *)(v38 + 20) & 2) != 0)
    {
      int v125 = 0;
    }
    else
    {
      uint64_t v126 = v124;
      if (v122 <= *(_DWORD *)(v126 + 12) - ((*(unsigned char *)(v126 + 22) ^ 1) & 1u) - *(_DWORD *)(v126 + 8))
      {
        uint64_t result = __memcpy_chk();
        uint64_t v128 = v124;
        unint64_t v127 = v122;
        *(_DWORD *)(v124 + 8) += v122;
        if ((*(unsigned char *)(v128 + 22) & 1) == 0) {
          *(unsigned char *)(*(void *)v128 + *(unsigned int *)(v128 + 8)) = 0;
        }
        int v125 = v127;
      }
      else
      {
        uint64_t result = os_trace_blob_add_slow(v124, (uint64_t)v123, v122);
        int v125 = result;
      }
    }
  }
  return result;
}

void _os_log_fmt_decode_data_access_failure(uint64_t a1, uint64_t a2, unsigned __int8 a3, unsigned char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  switch(a3)
  {
    case 1u:
      size_t v9 = strlen("<private>");
      if ((*(_WORD *)(a1 + 20) & 2) == 0)
      {
        if (v9 <= *(_DWORD *)(a1 + 12) - ((*(unsigned char *)(a1 + 22) ^ 1) & 1u) - *(_DWORD *)(a1 + 8))
        {
          __memcpy_chk();
          *(_DWORD *)(a1 + 8) += v9;
          if ((*(unsigned char *)(a1 + 22) & 1) == 0) {
            *(unsigned char *)(*(void *)a1 + *(unsigned int *)(a1 + 8)) = 0;
          }
        }
        else
        {
          os_trace_blob_add_slow(a1, (uint64_t)"<private>", v9);
        }
      }
      break;
    case 2u:
      _os_log_fmt_decode_error(a1);
      break;
    case 3u:
      _os_log_fmt_decode_cmd_mismatch(a1, a2, a4, (unsigned __int16)a5, a5, a6, a7, a8);
      break;
    case 4u:
      _os_log_fmt_decode_bad_range(a1, a2, (uint64_t)a4, (unsigned __int16)a5, a5, a6, a7, a8);
      break;
    case 8u:
    case 9u:
    case 0xAu:
      _os_log_fmt_decode_masked_unknown(a1, a2, (uint64_t)a4, a3, a5, a6, a7, a8);
      break;
    default:
      return;
  }
}

uint64_t _os_log_fmt_compose_annotated(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int16 a6, char a7)
{
  if ((*(_WORD *)(a3 + 8) & 0x80) != 0) {
    char v8 = _os_log_fmt_builtin_annotated(a1, a2, a3, a4, a5, a6, a7 & 1) & 1;
  }
  else {
    char v8 = 0;
  }
  return v8 & 1;
}

unint64_t _os_log_fmt_compose_scalar(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4, __int16 a5)
{
  uint64_t v35 = a1;
  uint64_t v34 = a2;
  uint64_t v33 = a3;
  BOOL v32 = a4;
  __int16 v31 = a5;
  memset(&__b, 0, sizeof(__b));
  uint64_t __b = os_log_fmt_read_scalar(v34, v32, v31);
  int v29 = 0;
  if ((*(_WORD *)(v34 + 8) & 2) != 0)
  {
    int v5 = *(_DWORD *)(v34 + 20);
    int v6 = v29++;
    v45[v6] = v5;
  }
  if ((*(_WORD *)(v34 + 8) & 4) != 0)
  {
    int v7 = *(_DWORD *)(v34 + 24);
    int v8 = v29++;
    v45[v8] = v7;
  }
  if (*(unsigned __int16 *)(v34 + 12) + 2 <= 6) {
    int v9 = 6;
  }
  else {
    int v9 = *(unsigned __int16 *)(v34 + 12) + 2;
  }
  uint64_t v10 = (v9 + 1);
  unint64_t v28 = v22;
  uint64_t v11 = &v22[-((v10 + 15) & 0x1FFFFFFF0)];
  uint64_t v27 = v10;
  unsigned __int16 v26 = 0;
  unint64_t result = _os_log_fmt_compose_format_copy(v11, v34);
  unsigned __int16 v26 = result;
  switch(*(unsigned char *)(v34 + 10))
  {
    case 0:
    case 0x10:
    case 0x11:
    case 0x12:
    case 0x13:
      unint64_t result = _os_crash();
      __break(1u);
      return result;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
      goto LABEL_9;
    case 8:
      uint64_t v19 = v35;
      size_t v20 = strerror(__b);
      uint64_t v37 = v19;
      uint64_t v36 = v20;
      uint64_t v21 = (uint64_t)v20;
      unint64_t result = strlen(v20);
      uint64_t v40 = v19;
      uint64_t v39 = v21;
      unint64_t v38 = result;
      if ((*(_WORD *)(v19 + 20) & 2) != 0)
      {
        int v41 = 0;
      }
      else
      {
        uint64_t v42 = v40;
        if (v38 <= *(_DWORD *)(v42 + 12) - ((*(unsigned char *)(v42 + 22) ^ 1) & 1u) - *(_DWORD *)(v42 + 8))
        {
          unint64_t result = __memcpy_chk();
          uint64_t v44 = v40;
          unint64_t v43 = v38;
          *(_DWORD *)(v40 + 8) += v38;
          if ((*(unsigned char *)(v44 + 22) & 1) == 0) {
            *(unsigned char *)(*(void *)v44 + *(unsigned int *)(v44 + 8)) = 0;
          }
          int v41 = v43;
        }
        else
        {
          unint64_t result = os_trace_blob_add_slow(v40, v39, v38);
          int v41 = result;
        }
      }
      return result;
    case 9:
    case 0xA:
    case 0xD:
      if (v33 == 8)
      {
        uint64_t v24 = __b;
        if (!v29) {
          unint64_t result = os_trace_blob_addf(v35, v11, v13, v14, v15, v16, v17, v18, v24);
        }
        if (v29 == 1) {
          unint64_t result = os_trace_blob_addf(v35, v11, v13, v14, v15, v16, v17, v18, v45[0]);
        }
        if (v29 == 2) {
          return os_trace_blob_addf(v35, v11, v13, v14, v15, v16, v17, v18, v45[0]);
        }
        return result;
      }
      char v23 = 0;
      char v23 = v11[v26 - 1];
      if (*(unsigned char *)(v34 + 10) == 13) {
        goto LABEL_32;
      }
      if (v33 == 4)
      {
        unint64_t result = isupper(v23);
        if (result)
        {
          unint64_t result = tolower(v23);
          v11[v26 - 1] = result;
        }
        else
        {
          v11[v26 - 2] = v23;
          v11[v26 - 1] = 0;
        }
LABEL_9:
        int v25 = __b;
        if (!v29) {
          unint64_t result = os_trace_blob_addf(v35, v11, v13, v14, v15, v16, v17, v18, v25);
        }
        if (v29 == 1) {
          unint64_t result = os_trace_blob_addf(v35, v11, v13, v14, v15, v16, v17, v18, v45[0]);
        }
        if (v29 == 2) {
          return os_trace_blob_addf(v35, v11, v13, v14, v15, v16, v17, v18, v45[0]);
        }
      }
      else
      {
        unint64_t result = isupper(v23);
        if (result)
        {
          v11[v26 - 1] = 108;
          v11[v26] = 108;
          unint64_t result = tolower(v23);
          v11[v26 + 1] = result;
          v11[v26 + 2] = 0;
        }
        else
        {
          v11[v26 - 2] = 108;
          v11[v26 - 1] = 108;
          v11[v26] = v23;
          v11[v26 + 1] = 0;
        }
LABEL_32:
        if (!v29) {
          unint64_t result = os_trace_blob_addf(v35, v11, v13, v14, v15, v16, v17, v18, __b);
        }
        if (v29 == 1) {
          unint64_t result = os_trace_blob_addf(v35, v11, v13, v14, v15, v16, v17, v18, v45[0]);
        }
        if (v29 == 2) {
          return os_trace_blob_addf(v35, v11, v13, v14, v15, v16, v17, v18, v45[0]);
        }
      }
      return result;
    case 0xB:
    case 0xC:
      goto LABEL_32;
    case 0xE:
      if (!v29) {
        unint64_t result = os_trace_blob_addf(v35, v11, v13, v14, v15, v16, v17, v18, __b);
      }
      if (v29 == 1) {
        unint64_t result = os_trace_blob_addf(v35, v11, v13, v14, v15, v16, v17, v18, v45[0]);
      }
      if (v29 == 2) {
        return os_trace_blob_addf(v35, v11, v13, v14, v15, v16, v17, v18, v45[0]);
      }
      return result;
    case 0xF:
      if (!v29) {
        unint64_t result = os_trace_blob_addf(v35, v11, v13, v14, v15, v16, v17, v18, __b);
      }
      if (v29 == 1) {
        unint64_t result = os_trace_blob_addf(v35, v11, v13, v14, v15, v16, v17, v18, v45[0]);
      }
      if (v29 == 2) {
        return os_trace_blob_addf(v35, v11, v13, v14, v15, v16, v17, v18, v45[0]);
      }
      return result;
    default:
      return result;
  }
}

uint64_t _os_log_fmt_compose_data(uint64_t a1, uint64_t a2, unsigned char *a3, uint64_t a4, unsigned __int16 a5, char a6)
{
  uint64_t v35 = a1;
  uint64_t v34 = a2;
  uint64_t v33 = a3;
  uint64_t v32 = a4;
  unsigned __int16 v31 = a5;
  char v30 = a6 & 1;
  int v29 = 0;
  int v6 = *(unsigned __int16 *)(a2 + 12);
  unint64_t v28 = &v24;
  int v7 = (char *)&v24 - ((v6 + 18) & 0x1FFF0);
  uint64_t v27 = (v6 + 3);
  unsigned __int16 v26 = 0;
  uint64_t result = _os_log_fmt_compose_format_copy(v7, a2);
  unsigned __int16 v26 = result;
  if (*v33 >> 4 == 3)
  {
    uint64_t result = os_trace_blob_add_hexdump(v35, v32, v31, v30 & 1);
    int v25 = 1;
  }
  else
  {
    if (*(unsigned char *)(v34 + 10) == 18) {
      v7[v26 - 1] = 115;
    }
    if ((*(_WORD *)(v34 + 8) & 2) != 0)
    {
      int v15 = *(_DWORD *)(v34 + 20);
      int v16 = v29++;
      *(&v39 + v16) = v15;
    }
    if (v31)
    {
      if ((*(_WORD *)(v34 + 8) & 8) != 0)
      {
        if ((*(_WORD *)(v34 + 8) & 4) != 0)
        {
          if ((*(_DWORD *)(v34 + 24) & 0x80000000) != 0 || *(_DWORD *)(v34 + 24) > (int)v31)
          {
            int v21 = v29++;
            *(&v39 + v21) = v31;
          }
          else
          {
            int v22 = *(_DWORD *)(v34 + 24);
            int v23 = v29++;
            *(&v39 + v23) = v22;
          }
        }
        else
        {
          uint64_t v24 = 0;
          uint64_t v24 = strrchr(v7, 46);
          uint64_t result = __memcpy_chk();
          int v20 = v29++;
          *(&v39 + v20) = v31;
        }
      }
      else
      {
        uint64_t result = __memcpy_chk();
        int v19 = v29++;
        *(&v39 + v19) = v31;
      }
    }
    else
    {
      if (v30) {
        uint64_t v17 = (const char *)&unk_BE8E;
      }
      else {
        uint64_t v17 = "(null)";
      }
      uint64_t v32 = (uint64_t)v17;
      if ((*(_WORD *)(v34 + 8) & 4) != 0)
      {
        int v18 = v29++;
        *(&v39 + v18) = 0x7FFFFFFF;
      }
    }
    if (!v29) {
      uint64_t result = os_trace_blob_addf(v35, v7, v9, v10, v11, v12, v13, v14, v32);
    }
    if (v29 == 1) {
      uint64_t result = os_trace_blob_addf(v35, v7, v9, v10, v11, v12, v13, v14, v39);
    }
    if (v29 == 2) {
      uint64_t result = os_trace_blob_addf(v35, v7, v9, v10, v11, v12, v13, v14, v39);
    }
    if (v30)
    {
      uint64_t v38 = v35;
      uint64_t v37 = "<…>";
      uint64_t v36 = 0;
      return os_trace_blob_addns(v35, "<…>", 0xFFFFFFFFFFFFFFFFLL, 0);
    }
  }
  return result;
}

uint64_t _os_log_fmt_compose_format_copy(unsigned char *a1, uint64_t a2)
{
  unsigned __int16 __n = *(_WORD *)(a2 + 12);
  uint64_t v3 = memchr(*(const void **)a2, 125, __n);
  if (v3)
  {
    __n -= (_WORD)v3 - *(void *)a2;
    __memcpy_chk();
    *a1 = 37;
  }
  else
  {
    __memcpy_chk();
  }
  a1[__n] = 0;
  return __n;
}

uint64_t _os_log_fmt_builtin_annotated(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int16 a6, char a7)
{
  __s1 = *(char **)(a3 + 40);
  size_t __n = *(unsigned __int16 *)(a3 + 16);
  unint64_t v11 = 0;
  unint64_t v10 = 16;
  while (v11 < v10)
  {
    unint64_t v9 = (v11 + v10) >> 1;
    int v8 = strncmp(__s1, (&_os_log_fmt_builtin_annotated_functions)[2 * v9], __n);
    if (!v8) {
      int v8 = -(&_os_log_fmt_builtin_annotated_functions)[2 * v9][__n];
    }
    if (!v8)
    {
      char v21 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void))(&_os_log_fmt_builtin_annotated_functions)[2 * v9 + 1])(a1, a2, a3, a4, a5, a6, a7 & 1) & 1;
      return v21 & 1;
    }
    if (v8 < 0) {
      unint64_t v10 = (v11 + v10) >> 1;
    }
    else {
      unint64_t v11 = v9 + 1;
    }
  }
  char v21 = 0;
  return v21 & 1;
}

uint64_t _os_log_fmt_builtin_uuid_t(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, const unsigned __int8 *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(unsigned char *)(a3 + 10) != 19)
  {
    _os_log_fmt_decode_cmd_mismatch(a1, a3, a4, (unsigned __int16)a6, (uint64_t)a5, a6, a7, a8);
    return 1;
  }
  if ((unsigned __int16)a6 > 0x10uLL || (unsigned __int16)a6 < 0x10uLL && (a7 & 1) == 0)
  {
    _os_log_fmt_decode_cmd_mismatch(a1, a3, a4, (unsigned __int16)a6, (uint64_t)a5, a6, a7, a8);
LABEL_11:
    char v12 = 0;
    goto LABEL_12;
  }
  if (unsigned __int16)a6 < 0x10uLL && (a7)
  {
    _os_log_fmt_decode_error(a1);
    goto LABEL_11;
  }
  char v12 = 1;
LABEL_12:
  if (v12)
  {
    memset(__b, 0, sizeof(__b));
    uuid_unparse_upper(a5, __b);
    size_t v11 = strlen(__b);
    if ((*(_WORD *)(a1 + 20) & 2) == 0)
    {
      if (v11 <= *(_DWORD *)(a1 + 12) - ((*(unsigned char *)(a1 + 22) ^ 1) & 1u) - *(_DWORD *)(a1 + 8))
      {
        __memcpy_chk();
        *(_DWORD *)(a1 + 8) += v11;
        if ((*(unsigned char *)(a1 + 22) & 1) == 0) {
          *(unsigned char *)(*(void *)a1 + *(unsigned int *)(a1 + 8)) = 0;
        }
      }
      else
      {
        os_trace_blob_add_slow(a1, (uint64_t)__b, v11);
      }
    }
  }
  return 1;
}

uint64_t _os_log_fmt_builtin_timeval(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, void *a5, unsigned __int16 a6, char a7)
{
  uint64_t v19 = a1;
  uint64_t v18 = a2;
  uint64_t v17 = a3;
  int v16 = a4;
  __src = a5;
  unsigned __int16 v14 = a6;
  char v13 = a7;
  memset(__b, 0, sizeof(__b));
  if (*(unsigned char *)(v17 + 10) != 19)
  {
    _os_log_fmt_decode_cmd_mismatch(v19, v17, v16, v14, v7, v8, v9, v10);
    char v20 = 1;
    return v20 & 1;
  }
  uint64_t v26 = v19;
  uint64_t v25 = v17;
  uint64_t v24 = v16;
  unsigned __int16 v23 = v14;
  unint64_t v22 = 16;
  char v21 = v13 & 1;
  if (v14 > 0x10uLL || v23 < v22 && (v21 & 1) == 0)
  {
    _os_log_fmt_decode_cmd_mismatch(v26, v25, v24, v23, v7, v8, v9, v10);
LABEL_11:
    char v27 = 0;
    goto LABEL_12;
  }
  if (v23 < v22 && (v21 & 1) != 0)
  {
    _os_log_fmt_decode_error(v26);
    goto LABEL_11;
  }
  char v27 = 1;
LABEL_12:
  if (v27)
  {
    memcpy(__b, __src, sizeof(__b));
    os_trace_blob_add_localtime(v19, __b[0], SLODWORD(__b[1]), 1);
  }
  char v20 = 1;
  return v20 & 1;
}

uint64_t _os_log_fmt_builtin_timespec(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, void *a5, unsigned __int16 a6, char a7)
{
  uint64_t v19 = a1;
  uint64_t v18 = a2;
  uint64_t v17 = a3;
  int v16 = a4;
  __src = a5;
  unsigned __int16 v14 = a6;
  char v13 = a7;
  memset(__b, 0, sizeof(__b));
  if (*(unsigned char *)(v17 + 10) != 19)
  {
    _os_log_fmt_decode_cmd_mismatch(v19, v17, v16, v14, v7, v8, v9, v10);
    char v20 = 1;
    return v20 & 1;
  }
  uint64_t v26 = v19;
  uint64_t v25 = v17;
  uint64_t v24 = v16;
  unsigned __int16 v23 = v14;
  unint64_t v22 = 16;
  char v21 = v13 & 1;
  if (v14 > 0x10uLL || v23 < v22 && (v21 & 1) == 0)
  {
    _os_log_fmt_decode_cmd_mismatch(v26, v25, v24, v23, v7, v8, v9, v10);
LABEL_11:
    char v27 = 0;
    goto LABEL_12;
  }
  if (v23 < v22 && (v21 & 1) != 0)
  {
    _os_log_fmt_decode_error(v26);
    goto LABEL_11;
  }
  char v27 = 1;
LABEL_12:
  if (v27)
  {
    memcpy(__b, __src, sizeof(__b));
    os_trace_blob_add_localtime(v19, __b[0], __b[1], 0);
  }
  char v20 = 1;
  return v20 & 1;
}

uint64_t _os_log_fmt_builtin_time(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, uint64_t a5, unsigned __int16 a6)
{
  if ((_os_log_fmt_spec_is_integer(a3, 0) & 1) != 0 && (a6 == 4 || a6 == 8))
  {
    __memcpy_chk();
    os_trace_blob_add_localtime(a1, 0, 0, 3);
  }
  else
  {
    _os_log_fmt_decode_cmd_mismatch(a1, a3, a4, a6, v6, v7, v8, v9);
  }
  return 1;
}

uint64_t _os_log_fmt_spec_is_integer(uint64_t a1, char a2)
{
  if (*(unsigned char *)(a1 + 10) && *(unsigned __int8 *)(a1 + 10) <= 0xCu)
  {
    char v4 = 1;
  }
  else
  {
    BOOL v2 = 0;
    if (a2) {
      BOOL v2 = *(unsigned char *)(a1 + 10) == 13;
    }
    char v4 = v2;
  }
  return v4 & 1;
}

uint64_t _os_log_fmt_builtin_mach_errno(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, int *a5, unsigned __int16 a6)
{
  if ((_os_log_fmt_spec_is_integer(a3, 0) & 1) != 0 && a6 == 4)
  {
    int v17 = *a5;
    mach_error_string(*a5 & 0xFFFFC1FF);
    os_trace_blob_addf(a1, "[%#x: %s]", v10, v11, v12, v13, v14, v15, v17);
  }
  else
  {
    _os_log_fmt_decode_cmd_mismatch(a1, a3, a4, a6, v6, v7, v8, v9);
  }
  return 1;
}

uint64_t _os_log_fmt_builtin_iec_bytes(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, unsigned __int8 *a5, unsigned __int16 a6)
{
  return _os_log_fmt_builtin_scaled(a1, 0x400u, a3, a4, a5, a6, (uint64_t)_os_log_fmt_builtin_iec_bytes_suffixes) & 1;
}

uint64_t _os_log_fmt_builtin_scaled(uint64_t a1, unsigned int a2, uint64_t a3, unsigned char *a4, unsigned __int8 *a5, unsigned __int16 a6, uint64_t a7)
{
  if (_os_log_fmt_spec_is_integer(a3, 0))
  {
    unint64_t scalar = os_log_fmt_read_scalar(a3, a5, a6);
    unsigned int v20 = 0;
    for (unsigned int i = 0; ; ++i)
    {
      BOOL v17 = 0;
      if (*(void *)(a7 + 8 * i))
      {
        BOOL v17 = 0;
        if (*(void *)(a7 + 8 * (i + 1))) {
          BOOL v17 = scalar >= 0x3E8;
        }
      }
      if (!v17) {
        break;
      }
      unsigned int v20 = scalar % a2;
      scalar /= a2;
    }
    unsigned int v21 = round((double)v20 * 100.0 / (double)a2);
    if (v21 == 100)
    {
      ++scalar;
      unsigned int v21 = 0;
    }
    if (i)
    {
      if (scalar < 0xA && v21 % 0xA)
      {
        os_trace_blob_addf(a1, "%llu.%02u %s", v11, v12, v13, v14, v15, v16, scalar);
        return 1;
      }
      if (scalar < 0x64 && v21)
      {
        os_trace_blob_addf(a1, "%llu.%01u %s", v11, v12, v13, v14, v15, v16, scalar);
        return 1;
      }
    }
    os_trace_blob_addf(a1, "%llu %s", v11, v12, v13, v14, v15, v16, scalar);
    return 1;
  }
  _os_log_fmt_decode_cmd_mismatch(a1, a3, a4, a6, v7, v8, v9, v10);
  return 1;
}

uint64_t _os_log_fmt_builtin_iec_bitrate(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, unsigned __int8 *a5, unsigned __int16 a6)
{
  return _os_log_fmt_builtin_scaled(a1, 0x400u, a3, a4, a5, a6, (uint64_t)_os_log_fmt_builtin_iec_bitrate_suffixes) & 1;
}

uint64_t _os_log_fmt_builtin_darwin_signal(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, int *a5, unsigned __int16 a6)
{
  if ((_os_log_fmt_spec_is_integer(a3, 0) & 1) != 0 && a6 == 4)
  {
    int v13 = *a5;
    if (*a5 < 0 || v13 >= 32) {
      os_trace_blob_addf(a1, "[%d: Unknown signal]", v6, v7, v8, v9, v10, v11, v13);
    }
    else {
      os_trace_blob_addf(a1, "[sig%s: %s]", v6, v7, v8, v9, v10, v11, (char)sys_signame[v13]);
    }
  }
  else
  {
    _os_log_fmt_decode_cmd_mismatch(a1, a3, a4, a6, v8, v9, v10, v11);
  }
  return 1;
}

uint64_t _os_log_fmt_builtin_darwin_mode(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, int *a5, unsigned __int16 a6)
{
  if ((_os_log_fmt_spec_is_integer(a3, 0) & 1) != 0 && a6 == 4)
  {
    int v23 = *a5;
    v29[0] = aPcDBLSW[(*a5 & 0xF000u) >> 12];
    if ((v23 & 0x100) != 0) {
      char v10 = 114;
    }
    else {
      char v10 = 45;
    }
    v29[1] = v10;
    if ((v23 & 0x80u) == 0) {
      char v11 = 45;
    }
    else {
      char v11 = 119;
    }
    v29[2] = v11;
    if ((v23 & 0x40) != 0) {
      char v12 = 120;
    }
    else {
      char v12 = 45;
    }
    char v30 = v12;
    if ((v23 & 0x800) != 0)
    {
      if ((v23 & 0x40) != 0) {
        char v13 = 115;
      }
      else {
        char v13 = 83;
      }
      char v30 = v13;
    }
    if ((v23 & 0x20) != 0) {
      char v14 = 114;
    }
    else {
      char v14 = 45;
    }
    char v31 = v14;
    if ((v23 & 0x10) != 0) {
      char v15 = 119;
    }
    else {
      char v15 = 45;
    }
    char v32 = v15;
    if ((v23 & 8) != 0) {
      char v16 = 120;
    }
    else {
      char v16 = 45;
    }
    char v33 = v16;
    if ((v23 & 0x400) != 0)
    {
      if ((v23 & 8) != 0) {
        char v17 = 115;
      }
      else {
        char v17 = 83;
      }
      char v33 = v17;
    }
    if ((v23 & 4) != 0) {
      char v18 = 114;
    }
    else {
      char v18 = 45;
    }
    char v34 = v18;
    if ((v23 & 2) != 0) {
      char v19 = 119;
    }
    else {
      char v19 = 45;
    }
    char v35 = v19;
    if (v23) {
      char v20 = 120;
    }
    else {
      char v20 = 45;
    }
    char v36 = v20;
    if ((v23 & 0x200) != 0)
    {
      if (v23) {
        char v21 = 116;
      }
      else {
        char v21 = 84;
      }
      char v36 = v21;
    }
    if ((*(_WORD *)(a1 + 20) & 2) == 0)
    {
      if (*(_DWORD *)(a1 + 12) - ((*(unsigned char *)(a1 + 22) ^ 1) & 1u) - *(_DWORD *)(a1 + 8) >= 0xAuLL)
      {
        __memcpy_chk();
        *(_DWORD *)(a1 + 8) += 10;
        if ((*(unsigned char *)(a1 + 22) & 1) == 0) {
          *(unsigned char *)(*(void *)a1 + *(unsigned int *)(a1 + 8)) = 0;
        }
      }
      else
      {
        os_trace_blob_add_slow(a1, (uint64_t)v29, 0xAuLL);
      }
    }
  }
  else
  {
    _os_log_fmt_decode_cmd_mismatch(a1, a3, a4, a6, v6, v7, v8, v9);
  }
  return 1;
}

uint64_t _os_log_fmt_builtin_darwin_errno(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, int *a5, unsigned __int16 a6)
{
  if ((_os_log_fmt_spec_is_integer(a3, 0) & 1) != 0 && a6 == 4)
  {
    int __errnum = *a5;
    if (*a5) {
      strerror(__errnum);
    }
    os_trace_blob_addf(a1, "[%d: %s]", v6, v7, v8, v9, v10, v11, __errnum);
  }
  else
  {
    _os_log_fmt_decode_cmd_mismatch(a1, a3, a4, a6, v8, v9, v10, v11);
  }
  return 1;
}

uint64_t _os_log_fmt_builtin_bytes(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, unsigned __int8 *a5, unsigned __int16 a6)
{
  return _os_log_fmt_builtin_scaled(a1, 0x3E8u, a3, a4, a5, a6, (uint64_t)_os_log_fmt_builtin_bytes_suffixes) & 1;
}

uint64_t _os_log_fmt_builtin_bitrate(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, unsigned __int8 *a5, unsigned __int16 a6)
{
  return _os_log_fmt_builtin_scaled(a1, 0x3E8u, a3, a4, a5, a6, (uint64_t)_os_log_fmt_builtin_bitrate_suffixes) & 1;
}

uint64_t _os_log_fmt_builtin_BOOL(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, unsigned __int8 *a5, unsigned __int16 a6, char a7)
{
  uint64_t v25 = a1;
  uint64_t v24 = a2;
  uint64_t v23 = a3;
  unint64_t v22 = a4;
  char v21 = a5;
  unsigned __int16 v20 = a6;
  char v19 = a7;
  if (_os_log_fmt_spec_is_integer(a3, 1))
  {
    memset(&scalar, 0, sizeof(scalar));
    uint64_t scalar = os_log_fmt_read_scalar(v23, v21, v20);
    if (**(unsigned char **)(v23 + 40) == 66)
    {
      if (scalar) {
        uint64_t v11 = "YES";
      }
      else {
        uint64_t v11 = "NO";
      }
      uint64_t v37 = v25;
      char v36 = v11;
      uint64_t v12 = (uint64_t)v11;
      size_t v13 = strlen(v11);
      uint64_t v40 = v25;
      uint64_t v39 = v12;
      size_t v38 = v13;
      if ((*(_WORD *)(v25 + 20) & 2) != 0)
      {
        int v41 = 0;
      }
      else
      {
        uint64_t v42 = v40;
        if (v38 <= *(_DWORD *)(v42 + 12) - ((*(unsigned char *)(v42 + 22) ^ 1) & 1u) - *(_DWORD *)(v42 + 8))
        {
          __memcpy_chk();
          uint64_t v44 = v40;
          unint64_t v43 = v38;
          *(_DWORD *)(v40 + 8) += v38;
          if ((*(unsigned char *)(v44 + 22) & 1) == 0) {
            *(unsigned char *)(*(void *)v44 + *(unsigned int *)(v44 + 8)) = 0;
          }
          int v41 = v43;
        }
        else
        {
          int v41 = os_trace_blob_add_slow(v40, v39, v38);
        }
      }
    }
    else
    {
      if (scalar) {
        char v14 = "true";
      }
      else {
        char v14 = "false";
      }
      uint64_t v28 = v25;
      __s = v14;
      uint64_t v15 = (uint64_t)v14;
      size_t v16 = strlen(v14);
      uint64_t v31 = v25;
      uint64_t v30 = v15;
      size_t v29 = v16;
      if ((*(_WORD *)(v25 + 20) & 2) != 0)
      {
        int v32 = 0;
      }
      else
      {
        uint64_t v33 = v31;
        if (v29 <= *(_DWORD *)(v31 + 12) - ((*(unsigned char *)(v31 + 22) ^ 1) & 1u) - *(_DWORD *)(v31 + 8))
        {
          __memcpy_chk();
          uint64_t v35 = v31;
          unint64_t v34 = v29;
          *(_DWORD *)(v31 + 8) += v29;
          if ((*(unsigned char *)(v35 + 22) & 1) == 0) {
            *(unsigned char *)(*(void *)v35 + *(unsigned int *)(v35 + 8)) = 0;
          }
          int v32 = v34;
        }
        else
        {
          int v32 = os_trace_blob_add_slow(v31, v30, v29);
        }
      }
    }
    char v26 = 1;
  }
  else
  {
    _os_log_fmt_decode_cmd_mismatch(v25, v23, v22, v20, v7, v8, v9, v10);
    char v26 = 1;
  }
  return v26 & 1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return (MEMORY[0xFFFFFC104] & 0x100) == 0 && (MEMORY[0xFFFFFC104] & 0x400) == 0;
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_to_kernel(char *a1, unsigned char *a2)
{
  size_t v13 = a1;
  uint64_t v12 = a2;
  int v11 = 0;
  int v11 = *__error();
  unsigned __int8 v10 = 0;
  if ((MEMORY[0xFFFFFC104] & 0x2000000) != 0)
  {
    unsigned __int8 v10 = 3;
  }
  else if ((MEMORY[0xFFFFFC104] & 0x1000000) != 0)
  {
    unsigned __int8 v10 = 2;
  }
  else
  {
    unsigned __int8 v10 = 1;
  }
  memset(__b, 0, sizeof(__b));
  __b[0] = &v17;
  __b[1] = (unsigned char *)0x40000000000;
  v7[3] = (_WORD *)(&stru_3C8 + 56);
  int v8 = 1024;
  LODWORD(__b[2]) = 0;
  WORD2(__b[2]) = 0;
  BYTE6(__b[2]) = 1;
  memset(v7, 0, 0x18uLL);
  v7[0] = (__int16 *)&v16;
  v7[1] = (__int16 *)0x40000000000;
  v5[3] = (_WORD *)(&stru_3C8 + 56);
  int v6 = 1024;
  LODWORD(v7[2]) = 0;
  WORD2(v7[2]) = 0;
  BYTE6(v7[2]) = 1;
  memset(v5, 0, 0x18uLL);
  v5[0] = (__int16 *)&v15;
  v5[1] = (__int16 *)0x40000000000;
  v3[3] = 1024;
  int v4 = 1024;
  LODWORD(v5[2]) = 0;
  WORD2(v5[2]) = 0;
  BYTE6(v5[2]) = 1;
  os_log_fmt_flatten(v12, v10, (uint64_t)__b, (uint64_t)v7, (uint64_t)v5, v11);
  memset(v3, 0, 0x18uLL);
  v3[0] = &v14;
  v3[1] = 0x40000000000;
  LODWORD(v3[2]) = 0;
  WORD2(v3[2]) = 0;
  BYTE6(v3[2]) = 0;
  os_log_fmt_compose((uint64_t)v3, v13, 2, v10, 8, __b[0], v7[0], (unsigned __int16)v7[1], v5[0], (unsigned __int16)v5[1]);
  return log_data_as_kernel();
}

uint64_t _os_trace_realloc()
{
  uint64_t v1 = malloc_type_realloc();
  if (!v1)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  return v1;
}

uint64_t _os_trace_malloc()
{
  uint64_t v1 = malloc_type_malloc();
  if (!v1)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  return v1;
}

uint64_t _os_trace_memdup()
{
  return __memcpy_chk();
}

void _os_log_fmt_decode_give_up(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _os_log_fmt_decode_cmd_mismatch(uint64_t a1, uint64_t a2, unsigned char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v20 = a4;
  os_trace_blob_addf(a1, "<decode: mismatch for [%.*s] got [", (uint64_t)a3, a4, a5, a6, a7, a8, *(_WORD *)(a2 + 12));
  if ((*a3 >> 4) >= 5uLL)
  {
    os_trace_blob_addf(a1, "%d", v8, v9, v10, v11, v12, v13, *a3 >> 4);
  }
  else
  {
    size_t v25 = strlen(_cmd_type2str[*a3 >> 4]);
    if ((*(_WORD *)(a1 + 20) & 2) == 0)
    {
      if (v25 <= *(_DWORD *)(a1 + 12) - ((*(unsigned char *)(a1 + 22) ^ 1) & 1u) - *(_DWORD *)(a1 + 8))
      {
        __memcpy_chk();
        *(_DWORD *)(a1 + 8) += v25;
        if ((*(unsigned char *)(a1 + 22) & 1) == 0) {
          *(unsigned char *)(*(void *)a1 + *(unsigned int *)(a1 + 8)) = 0;
        }
      }
      else
      {
        os_trace_blob_add_slow(a1, (uint64_t)_cmd_type2str[*a3 >> 4], v25);
      }
    }
  }
  if ((*a3 & 2) != 0)
  {
    size_t v24 = strlen(" public");
    if ((*(_WORD *)(a1 + 20) & 2) == 0)
    {
      if (v24 <= *(_DWORD *)(a1 + 12) - ((*(unsigned char *)(a1 + 22) ^ 1) & 1u) - *(_DWORD *)(a1 + 8))
      {
        __memcpy_chk();
        *(_DWORD *)(a1 + 8) += v24;
        if ((*(unsigned char *)(a1 + 22) & 1) == 0) {
          *(unsigned char *)(*(void *)a1 + *(unsigned int *)(a1 + 8)) = 0;
        }
      }
      else
      {
        os_trace_blob_add_slow(a1, (uint64_t)" public", v24);
      }
    }
  }
  if (*a3)
  {
    size_t v23 = strlen(" private");
    if ((*(_WORD *)(a1 + 20) & 2) == 0)
    {
      if (v23 <= *(_DWORD *)(a1 + 12) - ((*(unsigned char *)(a1 + 22) ^ 1) & 1u) - *(_DWORD *)(a1 + 8))
      {
        __memcpy_chk();
        *(_DWORD *)(a1 + 8) += v23;
        if ((*(unsigned char *)(a1 + 22) & 1) == 0) {
          *(unsigned char *)(*(void *)a1 + *(unsigned int *)(a1 + 8)) = 0;
        }
      }
      else
      {
        os_trace_blob_add_slow(a1, (uint64_t)" private", v23);
      }
    }
  }
  os_trace_blob_addf(a1, " sz:%d]>", v14, v15, v16, v17, v18, v19, v20);
  _os_log_fmt_decode_failure();
}

void _os_log_fmt_decode_error(uint64_t a1)
{
  size_t v1 = strlen("<decode: missing data>");
  if ((*(_WORD *)(a1 + 20) & 2) == 0)
  {
    if (v1 <= *(_DWORD *)(a1 + 12) - ((*(unsigned char *)(a1 + 22) ^ 1) & 1u) - *(_DWORD *)(a1 + 8))
    {
      __memcpy_chk();
      *(_DWORD *)(a1 + 8) += v1;
      if ((*(unsigned char *)(a1 + 22) & 1) == 0) {
        *(unsigned char *)(*(void *)a1 + *(unsigned int *)(a1 + 8)) = 0;
      }
    }
    else
    {
      os_trace_blob_add_slow(a1, (uint64_t)"<decode: missing data>", v1);
    }
  }
  _os_log_fmt_decode_failure();
}

void _os_log_fmt_decode_bad_range(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _os_log_fmt_decode_masked_unknown(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a4 != 8 && a4 != 9 && a4 != 10)
  {
    _os_crash();
    __break(1u);
  }
  os_trace_blob_addf(a1, "<decode: mask \"%.*s\" is %s>", a3, a4, a5, a6, a7, a8, *(_WORD *)(a2 + 18));
  _os_log_fmt_decode_failure();
}

int *__error(void)
{
  return ___error();
}

uint64_t __memcpy_chk()
{
  return ___memcpy_chk();
}

uint64_t __memset_chk()
{
  return ___memset_chk();
}

uint64_t __strcpy_chk()
{
  return ___strcpy_chk();
}

int __vsnprintf_chk(char *a1, size_t a2, int a3, size_t a4, const char *a5, va_list a6)
{
  return ___vsnprintf_chk(a1, a2, a3, a4, a5, a6);
}

uint64_t _os_assert_log()
{
  return __os_assert_log();
}

uint64_t _os_crash()
{
  return __os_crash();
}

uint64_t ccdigest()
{
  return _ccdigest();
}

uint64_t ccmd5_di()
{
  return _ccmd5_di();
}

void free(void *a1)
{
}

int isascii(int a1)
{
  return _isascii(a1);
}

int iscntrl_l(int a1, locale_t a2)
{
  return _iscntrl_l(a1, a2);
}

int isspace(int a1)
{
  return _isspace(a1);
}

int isspace_l(int a1, locale_t a2)
{
  return _isspace_l(a1, a2);
}

int isupper(int a1)
{
  return _isupper(a1);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return _localtime_r(a1, a2);
}

uint64_t log_data_as_kernel()
{
  return _log_data_as_kernel();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return _mach_error_string(error_value);
}

uint64_t malloc_type_malloc()
{
  return _malloc_type_malloc();
}

uint64_t malloc_type_realloc()
{
  return _malloc_type_realloc();
}

void *__cdecl memchr(const void *__s, int __c, size_t __n)
{
  return _memchr(__s, __c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

char *__cdecl strchr(const char *__s, int __c)
{
  return _strchr(__s, __c);
}

size_t strcspn(const char *__s, const char *__charset)
{
  return _strcspn(__s, __charset);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

char *__cdecl strrchr(const char *__s, int __c)
{
  return _strrchr(__s, __c);
}

size_t strspn(const char *__s, const char *__charset)
{
  return _strspn(__s, __charset);
}

int tolower(int a1)
{
  return _tolower(a1);
}

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
}