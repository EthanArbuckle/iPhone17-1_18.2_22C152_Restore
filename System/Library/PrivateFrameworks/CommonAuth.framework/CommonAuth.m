uint64_t heim_ntlm_unparse_flags(uint64_t a1, char *a2, size_t a3)
{
  return (int)unparse_flags(a1, (uint64_t)&ntlm_flag_units, a2, a3);
}

void heim_ntlm_free_buf(void *a1)
{
  v2 = (void *)a1[1];
  if (v2) {
    free(v2);
  }
  *a1 = 0;
  a1[1] = 0;
}

double heim_ntlm_free_targetinfo(uint64_t a1)
{
  free(*(void **)a1);
  free(*(void **)(a1 + 8));
  free(*(void **)(a1 + 16));
  free(*(void **)(a1 + 24));
  free(*(void **)(a1 + 32));
  free(*(void **)(a1 + 48));
  v2 = *(void **)(a1 + 64);
  if (v2) {
    free(v2);
  }
  double result = 0.0;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

uint64_t heim_ntlm_encode_targetinfo(uint64_t a1, int a2, void *a3)
{
  *a3 = 0;
  a3[1] = 0;
  v6 = krb5_storage_emem();
  if (!v6) {
    return 12;
  }
  uint64_t v7 = (uint64_t)v6;
  uint64_t v8 = 2733221632;
  krb5_storage_set_byteorder((uint64_t)v6, 32);
  if (!*(void *)a1 || !encode_ti_string(v7, 1, a2, *(char **)a1))
  {
    v9 = *(char **)(a1 + 8);
    if (!v9 || !encode_ti_string(v7, 2, a2, v9))
    {
      v10 = *(char **)(a1 + 24);
      if (!v10 || !encode_ti_string(v7, 3, a2, v10))
      {
        v11 = *(char **)(a1 + 16);
        if (!v11 || !encode_ti_string(v7, 4, a2, v11))
        {
          v12 = *(char **)(a1 + 32);
          if ((!v12 || !encode_ti_string(v7, 5, a2, v12))
            && (!*(_DWORD *)(a1 + 40)
             || !krb5_store_uint16(v7, 6)
             && !krb5_store_uint16(v7, 4)
             && !krb5_store_uint32(v7, *(unsigned int *)(a1 + 40)))
            && (!*(void *)(a1 + 72)
             || !krb5_store_uint16(v7, 7)
             && !krb5_store_uint16(v7, 8)
             && !krb5_store_uint32(v7, *(unsigned int *)(a1 + 72))
             && !krb5_store_uint32(v7, *(unsigned int *)(a1 + 76))))
          {
            v13 = *(char **)(a1 + 48);
            if ((!v13 || !encode_ti_string(v7, 9, a2, v13))
              && (!*(void *)(a1 + 56)
               || !krb5_store_uint16(v7, 10)
               && !krb5_store_uint16(v7, *(_WORD *)(a1 + 56))
               && krb5_storage_write(v7) == *(void *)(a1 + 56))
              && !krb5_store_int16(v7, 0)
              && !krb5_store_int16(v7, 0))
            {
              size_t v16 = 0;
              uint64_t v17 = 0;
              uint64_t v8 = krb5_storage_to_data(v7, &v16);
              uint64_t v14 = v17;
              *a3 = v16;
              a3[1] = v14;
            }
          }
        }
      }
    }
  }
  krb5_storage_free(v7);
  return v8;
}

uint64_t encode_ti_string(uint64_t a1, __int16 a2, int a3, char *a4)
{
  uint64_t v7 = 2733221632;
  if (!krb5_store_uint16(a1, a2))
  {
    __int16 v8 = len_string(a3, a4);
    if (!krb5_store_uint16(a1, v8))
    {
      if (put_string(a1, a3, a4)) {
        return 2733221632;
      }
      else {
        return 0;
      }
    }
  }
  return v7;
}

uint64_t heim_ntlm_decode_targetinfo(uint64_t *a1, int a2, uint64_t a3)
{
  *(_OWORD *)(a3 + 48) = 0u;
  *(_OWORD *)(a3 + 64) = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)a3 = 0u;
  if (!*a1) {
    return 0;
  }
  v5 = krb5_storage_from_readonly_mem(a1[1], *a1);
  if (!v5) {
    return 12;
  }
  uint64_t v6 = (uint64_t)v5;
  LODWORD(size) = 0;
  krb5_storage_set_byteorder((uint64_t)v5, 32);
  if (krb5_ret_uint16(v6, (_WORD *)&size + 1))
  {
LABEL_4:
    uint64_t v7 = 2733221632;
    goto LABEL_5;
  }
  while (2)
  {
    if (krb5_ret_uint16(v6, &size)) {
      goto LABEL_4;
    }
    uint64_t v7 = WORD1(size);
    switch(WORD1(size))
    {
      case 0:
        goto LABEL_5;
      case 1:
        unint64_t v9 = (unsigned __int16)size;
        uint64_t v10 = v6;
        int v11 = a2;
        v12 = (void **)a3;
        goto LABEL_22;
      case 2:
        unint64_t v9 = (unsigned __int16)size;
        uint64_t v10 = v6;
        int v11 = a2;
        v12 = (void **)(a3 + 8);
        goto LABEL_22;
      case 3:
        unint64_t v9 = (unsigned __int16)size;
        uint64_t v10 = v6;
        int v11 = a2;
        v12 = (void **)(a3 + 24);
        goto LABEL_22;
      case 4:
        unint64_t v9 = (unsigned __int16)size;
        uint64_t v10 = v6;
        int v11 = a2;
        v12 = (void **)(a3 + 16);
        goto LABEL_22;
      case 5:
        unint64_t v9 = (unsigned __int16)size;
        uint64_t v10 = v6;
        int v11 = a2;
        v12 = (void **)(a3 + 32);
        goto LABEL_22;
      case 6:
        if (krb5_ret_uint32(v6, (_DWORD *)(a3 + 40))) {
          goto LABEL_4;
        }
        goto LABEL_23;
      case 7:
        unsigned int v15 = 0;
        if (krb5_ret_uint32(v6, &v15)) {
          goto LABEL_4;
        }
        *(void *)(a3 + 72) = v15;
        if (krb5_ret_uint32(v6, &v15)) {
          goto LABEL_4;
        }
        *(void *)(a3 + 72) |= (unint64_t)v15 << 32;
        goto LABEL_23;
      case 9:
        unint64_t v9 = (unsigned __int16)size;
        uint64_t v10 = v6;
        int v11 = 1;
        v12 = (void **)(a3 + 48);
LABEL_22:
        if (!ret_string(v10, v11, v9, v12)) {
          goto LABEL_23;
        }
        goto LABEL_4;
      case 0xA:
        v13 = malloc_type_malloc((unsigned __int16)size, 0x784939E6uLL);
        *(void *)(a3 + 64) = v13;
        if (v13)
        {
          *(void *)(a3 + 56) = (unsigned __int16)size;
          uint64_t v14 = krb5_storage_read(v6);
          if (v14 != (unsigned __int16)size) {
            goto LABEL_4;
          }
LABEL_23:
          if (krb5_ret_uint16(v6, (_WORD *)&size + 1)) {
            goto LABEL_4;
          }
          continue;
        }
        uint64_t v7 = 12;
LABEL_5:
        krb5_storage_free(v6);
        return v7;
      default:
        krb5_storage_seek(v6);
        goto LABEL_23;
    }
  }
}

uint64_t ret_string(uint64_t a1, int a2, unint64_t a3, void **a4)
{
  __int16 v8 = malloc_type_malloc(a3 + 1, 0xA889B100uLL);
  *a4 = v8;
  if (!v8) {
    return 12;
  }
  uint64_t v9 = 2733221632;
  if (krb5_storage_read(a1) != a3) {
    return v9;
  }
  *((unsigned char *)*a4 + a3) = 0;
  if (!a2) {
    return 0;
  }
  unsigned int v16 = 1;
  unint64_t v14 = 0;
  unint64_t v15 = a3 >> 1;
  uint64_t v10 = (unsigned __int16 *)malloc_type_malloc(a3 & 0xFFFFFFFFFFFFFFFELL, 0x1000040BDFB0063uLL);
  int v11 = *a4;
  if (!v10)
  {
    free(v11);
    *a4 = 0;
    return 12;
  }
  uint64_t v9 = wind_ucs2read((unsigned __int16 *)v11, a3, &v16, v10, (uint64_t *)&v15);
  free(*a4);
  *a4 = 0;
  if (!v9)
  {
    if (wind_ucs2utf8_length(v10, v15, &v14))
    {
      uint64_t v9 = 2733221632;
    }
    else
    {
      v12 = malloc_type_malloc(++v14, 0x803867E2uLL);
      *a4 = v12;
      uint64_t v9 = 2733221632;
      if (!wind_ucs2utf8(v10, v15, v12, &v14)) {
        uint64_t v9 = 0;
      }
    }
  }
  free(v10);
  return v9;
}

double heim_ntlm_free_type1(uint64_t a1)
{
  v2 = *(void **)(a1 + 8);
  if (v2) {
    free(v2);
  }
  v3 = *(void **)(a1 + 16);
  if (v3) {
    free(v3);
  }
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t heim_ntlm_decode_type1(uint64_t *a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v12 = 0;
  uint64_t v10 = 0;
  *(void *)int v11 = 0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  v3 = krb5_storage_from_readonly_mem(a1[1], *a1);
  if (!v3)
  {
    uint64_t v5 = 12;
    goto LABEL_6;
  }
  uint64_t v4 = (uint64_t)v3;
  krb5_storage_set_byteorder((uint64_t)v3, 32);
  if (krb5_storage_read(v4) == 8
    && v13 == 0x5053534D4C544ELL
    && !krb5_ret_uint32(v4, &v12)
    && v12 == 1
    && !krb5_ret_uint32(v4, (_DWORD *)a2))
  {
    int v7 = *(_DWORD *)a2;
    if (!ret_sec_buffer(v4, (uint64_t)v11) && !ret_sec_buffer(v4, (uint64_t)&v10))
    {
      int v8 = *(_DWORD *)a2;
      if ((*(_DWORD *)a2 & 0x2000000) != 0)
      {
        if (krb5_ret_uint32(v4, (_DWORD *)(a2 + 24))
          || krb5_ret_uint32(v4, (_DWORD *)(a2 + 28)))
        {
          goto LABEL_4;
        }
        int v8 = *(_DWORD *)a2;
      }
      int v9 = v7 & 1;
      if ((v8 & 0x1000) == 0)
      {
LABEL_17:
        if ((v8 & 0x2000) == 0 || !ret_sec_string(v4, v9, (unsigned __int16 *)&v10, (void **)(a2 + 16)))
        {
          krb5_storage_free(v4);
          return 0;
        }
        goto LABEL_4;
      }
      if (!ret_sec_string(v4, v9, v11, (void **)(a2 + 8)))
      {
        int v8 = *(_DWORD *)a2;
        goto LABEL_17;
      }
    }
  }
LABEL_4:
  krb5_storage_free(v4);
  uint64_t v5 = 2733221632;
LABEL_6:
  heim_ntlm_free_type1(a2);
  return v5;
}

uint64_t ret_sec_buffer(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = 2733221632;
  if (!krb5_ret_uint16(a1, (_WORD *)a2) && !krb5_ret_uint16(a1, (_WORD *)(a2 + 2)))
  {
    if (krb5_ret_uint32(a1, (_DWORD *)(a2 + 4))) {
      return 2733221632;
    }
    else {
      return 0;
    }
  }
  return v4;
}

uint64_t ret_sec_string(uint64_t a1, int a2, unsigned __int16 *a3, void **a4)
{
  uint64_t v8 = 2733221632;
  if (krb5_storage_seek(a1) == *((_DWORD *)a3 + 1))
  {
    if (ret_string(a1, a2, *a3, a4)) {
      return 2733221632;
    }
    else {
      return 0;
    }
  }
  return v8;
}

uint64_t heim_ntlm_encode_type1(uint64_t a1, void *a2)
{
  unsigned int v4 = *(_DWORD *)a1;
  int v5 = *(_DWORD *)a1 & 1;
  int v7 = *(char **)(a1 + 8);
  uint64_t v6 = *(char **)(a1 + 16);
  if (v7) {
    unsigned int v4 = *(_DWORD *)a1 | 0x1000;
  }
  if (v6) {
    uint64_t v8 = v4 | 0x2000;
  }
  else {
    uint64_t v8 = v4;
  }
  if (v7)
  {
    if (v6) {
      int v9 = 32;
    }
    else {
      int v9 = 24;
    }
    if ((v8 & 0x2000000) != 0) {
      int v10 = v9 + 8;
    }
    else {
      int v10 = v9;
    }
    unsigned __int16 v11 = len_string(v5, v7);
    uint64_t v6 = *(char **)(a1 + 16);
  }
  else
  {
    int v10 = 0;
    unsigned __int16 v11 = 0;
  }
  int v26 = v10;
  v25[0] = v11;
  v25[1] = v11;
  if (v6)
  {
    int v12 = v10 + v11;
    __int16 v13 = len_string(v5, v6);
  }
  else
  {
    int v12 = 0;
    __int16 v13 = 0;
  }
  int v24 = v12;
  v23[0] = v13;
  v23[1] = v13;
  uint64_t v14 = krb5_storage_emem();
  if (!v14) {
    return 12;
  }
  uint64_t v15 = (uint64_t)v14;
  uint64_t v16 = 2733221632;
  krb5_storage_set_byteorder((uint64_t)v14, 32);
  if (krb5_storage_write(v15) == 8
    && !krb5_store_uint32(v15, 1)
    && !krb5_store_uint32(v15, v8)
    && !store_sec_buffer(v15, (uint64_t)v25)
    && !store_sec_buffer(v15, (uint64_t)v23)
    && ((v8 & 0x2000000) == 0 || !encode_os_version(v15)))
  {
    v18 = *(char **)(a1 + 8);
    if (!v18 || !put_string(v15, v5, v18))
    {
      v19 = *(char **)(a1 + 16);
      if (!v19 || !put_string(v15, v5, v19))
      {
        size_t v21 = 0;
        uint64_t v22 = 0;
        uint64_t v16 = krb5_storage_to_data(v15, &v21);
        uint64_t v20 = v22;
        *a2 = v21;
        a2[1] = v20;
      }
    }
  }
  krb5_storage_free(v15);
  return v16;
}

size_t len_string(int a1, char *__s)
{
  if (a1)
  {
    size_t v5 = 0;
    if (wind_utf8ucs2_length(__s, &v5)) {
      size_t v3 = 5 * strlen(__s);
    }
    else {
      size_t v3 = v5;
    }
    return 2 * v3;
  }
  else
  {
    return strlen(__s);
  }
}

uint64_t store_sec_buffer(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = 2733221632;
  if (!krb5_store_uint16(a1, *(_WORD *)a2) && !krb5_store_uint16(a1, *(_WORD *)(a2 + 2)))
  {
    if (krb5_store_uint32(a1, *(unsigned int *)(a2 + 4))) {
      return 2733221632;
    }
    else {
      return 0;
    }
  }
  return v4;
}

uint64_t encode_os_version(uint64_t a1)
{
  uint64_t v2 = 2733221632;
  if (!krb5_store_uint8(a1, 6)
    && !krb5_store_uint8(a1, 1)
    && !krb5_store_uint16(a1, 7600)
    && !krb5_store_uint8(a1, 0)
    && !krb5_store_uint8(a1, 0)
    && !krb5_store_uint8(a1, 0))
  {
    if (krb5_store_uint8(a1, 15)) {
      return 2733221632;
    }
    else {
      return 0;
    }
  }
  return v2;
}

uint64_t put_string(uint64_t a1, int a2, char *__s)
{
  size_t v3 = __s;
  if (a2)
  {
    size_t v9 = 0;
    int v10 = 0;
    uint64_t result = ascii2ucs2le(__s, 0, &v9);
    if (result) {
      return result;
    }
    size_t v7 = v9;
    size_t v3 = v10;
  }
  else
  {
    size_t v7 = strlen(__s);
  }
  uint64_t v8 = krb5_storage_write(a1);
  if (v8 == v7) {
    uint64_t result = 0;
  }
  else {
    uint64_t result = 2733221632;
  }
  if (a2 && v8 == v7)
  {
    if (v3) {
      free(v3);
    }
    return 0;
  }
  return result;
}

double heim_ntlm_free_type2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);
  if (v2) {
    free(v2);
  }
  size_t v3 = *(void **)(a1 + 24);
  if (v3) {
    free(v3);
  }
  *(void *)(a1 + 48) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

uint64_t heim_ntlm_decode_type2(uint64_t *a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v10 = 0;
  uint64_t v8 = 0;
  *(void *)size_t v9 = 0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(void *)(a2 + 48) = 0;
  size_t v3 = krb5_storage_from_readonly_mem(a1[1], *a1);
  if (v3)
  {
    uint64_t v4 = (uint64_t)v3;
    krb5_storage_set_byteorder((uint64_t)v3, 32);
    if (krb5_storage_read(v4) == 8
      && v13 == 0x5053534D4C544ELL
      && !krb5_ret_uint32(v4, &v10)
      && v10 == 2
      && !ret_sec_buffer(v4, (uint64_t)v9)
      && !krb5_ret_uint32(v4, (_DWORD *)a2))
    {
      int v7 = *(_DWORD *)a2;
      if (krb5_storage_read(v4) == 8
        && !krb5_ret_uint32(v4, &v11)
        && !krb5_ret_uint32(v4, &v12)
        && !ret_sec_buffer(v4, (uint64_t)&v8)
        && ((*(unsigned char *)(a2 + 3) & 2) == 0
         || !krb5_ret_uint32(v4, (_DWORD *)(a2 + 48))
         && !krb5_ret_uint32(v4, (_DWORD *)(a2 + 52)))
        && !ret_sec_string(v4, v7 & 1, v9, (void **)(a2 + 8))
        && !ret_buf(v4, (unsigned __int16 *)&v8, (void *)(a2 + 16)))
      {
        krb5_storage_free(v4);
        return 0;
      }
    }
    krb5_storage_free(v4);
    uint64_t v5 = 2733221632;
  }
  else
  {
    uint64_t v5 = 12;
  }
  heim_ntlm_free_type2(a2);
  return v5;
}

uint64_t ret_buf(uint64_t a1, unsigned __int16 *a2, void *a3)
{
  uint64_t v6 = 2733221632;
  int v7 = malloc_type_malloc(*a2, 0x81D8A5B6uLL);
  *a3 = *a2;
  a3[1] = v7;
  if (krb5_storage_seek(a1) == *((_DWORD *)a2 + 1))
  {
    if (krb5_storage_read(a1) == *a3) {
      return 0;
    }
    else {
      return 2733221632;
    }
  }
  return v6;
}

uint64_t heim_ntlm_encode_type2(unsigned int *a1, void *a2)
{
  if ((*a1 & 0x2000000) != 0) {
    int v4 = 56;
  }
  else {
    int v4 = 48;
  }
  int v5 = *a1 & 1;
  int v16 = v4;
  v15[0] = len_string(v5, *((char **)a1 + 1));
  v15[1] = v15[0];
  int v14 = v4 + v15[0];
  v13[0] = *((_WORD *)a1 + 8);
  v13[1] = v13[0];
  uint64_t v6 = krb5_storage_emem();
  if (!v6) {
    return 12;
  }
  uint64_t v7 = (uint64_t)v6;
  uint64_t v8 = 2733221632;
  krb5_storage_set_byteorder((uint64_t)v6, 32);
  if (krb5_storage_write(v7) == 8
    && !krb5_store_uint32(v7, 2)
    && !store_sec_buffer(v7, (uint64_t)v15)
    && !krb5_store_uint32(v7, *a1)
    && krb5_storage_write(v7) == 8
    && !krb5_store_uint32(v7, 0)
    && !krb5_store_uint32(v7, 0)
    && !store_sec_buffer(v7, (uint64_t)v13)
    && ((*((unsigned char *)a1 + 3) & 2) == 0 || !encode_os_version(v7))
    && !put_string(v7, v5, *((char **)a1 + 1))
    && krb5_storage_write(v7) == *((void *)a1 + 2))
  {
    size_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v8 = krb5_storage_to_data(v7, &v11);
    uint64_t v9 = v12;
    *a2 = v11;
    a2[1] = v9;
  }
  krb5_storage_free(v7);
  return v8;
}

double heim_ntlm_free_type3(uint64_t a1)
{
  uint64_t v2 = (void *)(a1 + 24);
  size_t v3 = *(void **)(a1 + 32);
  if (v3) {
    free(v3);
  }
  void *v2 = 0;
  v2[1] = 0;
  int v4 = *(void **)(a1 + 48);
  if (v4) {
    free(v4);
  }
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  int v5 = *(void **)(a1 + 16);
  if (v5) {
    free(v5);
  }
  uint64_t v6 = *(void **)(a1 + 8);
  if (v6) {
    free(v6);
  }
  uint64_t v7 = *(void **)(a1 + 72);
  if (v7) {
    free(v7);
  }
  uint64_t v8 = *(void **)(a1 + 64);
  if (v8) {
    free(v8);
  }
  double result = 0.0;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

uint64_t heim_ntlm_decode_type3(uint64_t *a1, int a2, uint64_t a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  int v25 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)(a3 + 48) = 0u;
  *(_OWORD *)(a3 + 64) = 0u;
  *(_OWORD *)(a3 + 80) = 0u;
  *(_OWORD *)(a3 + 96) = 0u;
  int v5 = krb5_storage_from_readonly_mem(a1[1], *a1);
  if (!v5)
  {
    uint64_t v7 = 12;
    goto LABEL_6;
  }
  uint64_t v6 = (uint64_t)v5;
  krb5_storage_set_byteorder((uint64_t)v5, 32);
  if (krb5_storage_read(v6) == 8
    && v26 == 0x5053534D4C544ELL
    && !krb5_ret_uint32(v6, &v25)
    && v25 == 3
    && !ret_sec_buffer(v6, (uint64_t)&v24))
  {
    int v9 = WORD1(v24);
    unsigned int v10 = HIDWORD(v24);
    if (!ret_sec_buffer(v6, (uint64_t)&v23))
    {
      if (v9) {
        unsigned int v11 = v10;
      }
      else {
        unsigned int v11 = -1;
      }
      unsigned int v12 = HIDWORD(v23);
      if (v11 < HIDWORD(v23)) {
        unsigned int v12 = v11;
      }
      unsigned int v13 = WORD1(v23) ? v12 : v11;
      if (!ret_sec_buffer(v6, (uint64_t)&v22))
      {
        unsigned int v14 = HIDWORD(v22);
        if (!ret_sec_buffer(v6, (uint64_t)&v21))
        {
          unsigned int v15 = HIDWORD(v21);
          if (!ret_sec_buffer(v6, (uint64_t)&v19))
          {
            if (v13 >= v14) {
              unsigned int v16 = v14;
            }
            else {
              unsigned int v16 = v13;
            }
            if (v16 >= v15) {
              unsigned int v16 = v15;
            }
            unsigned int v17 = HIDWORD(v19);
            if (v16 < HIDWORD(v19)) {
              unsigned int v17 = v16;
            }
            if (WORD1(v19)) {
              unsigned int v18 = v17;
            }
            else {
              unsigned int v18 = v16;
            }
            if (v18 < 0x34) {
              goto LABEL_44;
            }
            if (ret_sec_buffer(v6, (uint64_t)&v20)) {
              goto LABEL_4;
            }
            if (v18 >= HIDWORD(v20)) {
              unsigned int v18 = HIDWORD(v20);
            }
            if (krb5_ret_uint32(v6, (_DWORD *)a3)) {
              goto LABEL_4;
            }
            if (v18 < 0x48) {
              goto LABEL_44;
            }
            if (krb5_ret_uint32(v6, (_DWORD *)(a3 + 80))
              || krb5_ret_uint32(v6, (_DWORD *)(a3 + 84)))
            {
              goto LABEL_4;
            }
            if (v18 < 0x58)
            {
LABEL_44:
              *(void *)(a3 + 88) = 0;
LABEL_45:
              if (!ret_buf(v6, (unsigned __int16 *)&v24, (void *)(a3 + 24))
                && !ret_buf(v6, (unsigned __int16 *)&v23, (void *)(a3 + 40))
                && !ret_sec_string(v6, a2, (unsigned __int16 *)&v22, (void **)(a3 + 16))
                && !ret_sec_string(v6, a2, (unsigned __int16 *)&v21, (void **)(a3 + 8))
                && !ret_sec_string(v6, a2, (unsigned __int16 *)&v19, (void **)(a3 + 72))
                && (!HIDWORD(v20) || !ret_buf(v6, (unsigned __int16 *)&v20, (void *)(a3 + 56))))
              {
                krb5_storage_free(v6);
                return 0;
              }
              goto LABEL_4;
            }
            *(void *)(a3 + 88) = 72;
            if (krb5_storage_read(v6) == 16) {
              goto LABEL_45;
            }
          }
        }
      }
    }
  }
LABEL_4:
  krb5_storage_free(v6);
  uint64_t v7 = 2733221632;
LABEL_6:
  heim_ntlm_free_type3(a3);
  return v7;
}

uint64_t heim_ntlm_encode_type3(unsigned int *a1, void *a2, uint64_t *a3)
{
  int v6 = *a1;
  if ((*a1 & 0x2000000) != 0) {
    uint64_t v7 = 72;
  }
  else {
    uint64_t v7 = 64;
  }
  if (a3)
  {
    *a3 = v7;
    LODWORD(v7) = v7 | 0x10;
  }
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v17 = 0;
  v18[0] = 0;
  long long v16 = 0uLL;
  int v8 = v6 & 1;
  v18[1] = v7;
  LOWORD(v18[0]) = len_string(v8, *((char **)a1 + 2));
  HIWORD(v18[0]) = v18[0];
  HIDWORD(v17) = v7 + LOWORD(v18[0]);
  LOWORD(v17) = len_string(v8, *((char **)a1 + 1));
  WORD1(v17) = v17;
  *(void *)((char *)&v16 + 4) = HIDWORD(v17) + (unsigned __int16)v17;
  LOWORD(v16) = len_string(v8, *((char **)a1 + 9));
  WORD1(v16) = v16;
  HIDWORD(v20) = DWORD1(v16) + (unsigned __int16)v16;
  LOWORD(v20) = a1[6];
  WORD1(v20) = v20;
  HIDWORD(v19) = HIDWORD(v20) + (unsigned __int16)v20;
  LOWORD(v19) = a1[10];
  WORD1(v19) = v19;
  HIDWORD(v16) = HIDWORD(v19) + (unsigned __int16)v19;
  WORD4(v16) = *((_WORD *)a1 + 28);
  WORD5(v16) = WORD4(v16);
  int v9 = krb5_storage_emem();
  if (!v9) {
    return 12;
  }
  uint64_t v10 = (uint64_t)v9;
  uint64_t v11 = 2733221632;
  krb5_storage_set_byteorder((uint64_t)v9, 32);
  if (krb5_storage_write(v10) == 8
    && !krb5_store_uint32(v10, 3)
    && !store_sec_buffer(v10, (uint64_t)&v20)
    && !store_sec_buffer(v10, (uint64_t)&v19)
    && !store_sec_buffer(v10, (uint64_t)v18)
    && !store_sec_buffer(v10, (uint64_t)&v17)
    && !store_sec_buffer(v10, (uint64_t)&v16)
    && !store_sec_buffer(v10, (uint64_t)&v16 + 8)
    && !krb5_store_uint32(v10, *a1)
    && ((*((unsigned char *)a1 + 3) & 2) == 0 || !encode_os_version(v10))
    && (!a3 || krb5_storage_write(v10) == 16)
    && !put_string(v10, v8, *((char **)a1 + 2))
    && !put_string(v10, v8, *((char **)a1 + 1))
    && !put_string(v10, v8, *((char **)a1 + 9))
    && krb5_storage_write(v10) == *((void *)a1 + 3)
    && krb5_storage_write(v10) == *((void *)a1 + 5)
    && krb5_storage_write(v10) == *((void *)a1 + 7))
  {
    size_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v11 = krb5_storage_to_data(v10, &v14);
    uint64_t v13 = v15;
    *a2 = v14;
    a2[1] = v13;
  }
  krb5_storage_free(v10);
  return v11;
}

uint64_t heim_ntlm_nt_key(char *a1, void *a2)
{
  int v4 = malloc_type_malloc(0x10uLL, 0x8DC4D69DuLL);
  a2[1] = v4;
  if (!v4) {
    return 12;
  }
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  *a2 = 16;
  uint64_t v5 = ascii2ucs2le(a1, 0, &v10);
  if (v5)
  {
    int v6 = (void *)v5;
    uint64_t v7 = (void *)a2[1];
    if (v7) {
      free(v7);
    }
    *a2 = 0;
    a2[1] = 0;
    return (uint64_t)v6;
  }
  if (!CCDigestCreate())
  {
    int v8 = (void *)a2[1];
    if (v8) {
      free(v8);
    }
    *a2 = 0;
    a2[1] = 0;
    if (v11) {
      free(v11);
    }
    return 12;
  }
  int v6 = v11;
  CCDigestUpdate();
  CCDigestFinal();
  CCDigestDestroy();
  if (v6)
  {
    free(v6);
    return 0;
  }
  return (uint64_t)v6;
}

uint64_t ascii2ucs2le(char *a1, int a2, void *a3)
{
  unint64_t v20 = 0;
  uint64_t v6 = wind_utf8ucs2_length(a1, &v20);
  if (!v6)
  {
    if (v20 >> 31) {
      return 34;
    }
    uint64_t v7 = (unsigned __int16 *)malloc_type_malloc(2 * v20, 0x1000040BDFB0063uLL);
    if (!v7) {
      return 12;
    }
    int v8 = v7;
    uint64_t v9 = wind_utf8ucs2(a1, (uint64_t)v7, &v20);
    if (v9)
    {
      uint64_t v6 = v9;
      free(v8);
      return v6;
    }
    unint64_t v10 = v20;
    if (!v20)
    {
      free(v8);
      uint64_t v6 = 0;
      *a3 = 0;
      a3[1] = 0;
      return v6;
    }
    if (a2)
    {
      unint64_t v11 = 0;
      do
      {
        unsigned int v12 = v8[v11];
        if (v12 <= 0x7F)
        {
          v8[v11] = __toupper(v12);
          unint64_t v10 = v20;
        }
        ++v11;
      }
      while (v11 < v10);
    }
    *a3 = 2 * v10;
    uint64_t v13 = (char *)malloc_type_malloc(2 * v10, 0x2059AF9EuLL);
    a3[1] = v13;
    if (!v13 && v20)
    {
      free(v8);
      size_t v14 = (void *)a3[1];
      if (v14) {
        free(v14);
      }
      *a3 = 0;
      a3[1] = 0;
      return 12;
    }
    if (v20)
    {
      unint64_t v16 = 0;
      uint64_t v17 = v13 + 1;
      do
      {
        unsigned int v18 = &v8[v16];
        *(v17 - 1) = *v18;
        *uint64_t v17 = *((unsigned char *)v18 + 1);
        v17 += 2;
        ++v16;
      }
      while (v16 < v20);
      size_t v19 = 2 * v20;
    }
    else
    {
      size_t v19 = 0;
    }
    bzero(v8, v19);
    free(v8);
    return 0;
  }
  return v6;
}

uint64_t heim_ntlm_calculate_ntlm1(long long *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a2 != 16) {
    return 2733221633;
  }
  long long v7 = *a1;
  int v8 = 0;
  char v9 = 0;
  uint64_t v5 = malloc_type_malloc(0x18uLL, 0xEEAAA628uLL);
  a4[1] = v5;
  if (!v5) {
    return 12;
  }
  *a4 = 24;
  splitandenc(&v7);
  splitandenc((unsigned char *)&v7 + 7);
  splitandenc((unsigned char *)((unint64_t)&v7 | 0xE));
  return 0;
}

uint64_t splitandenc(unsigned char *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v10[0] = *a1;
  HIDWORD(v2) = v10[0];
  LODWORD(v2) = a1[1] << 24;
  char v1 = v2 >> 25;
  int v3 = a1[2];
  HIDWORD(v2) = a1[1];
  LODWORD(v2) = v3 << 24;
  uint64_t v12 = 0;
  memset(v11, 0, sizeof(v11));
  v10[1] = v1;
  v10[2] = v2 >> 26;
  int v4 = a1[3];
  HIDWORD(v2) = v3;
  LODWORD(v2) = v4 << 24;
  v10[3] = v2 >> 27;
  int v5 = a1[4];
  HIDWORD(v2) = v4;
  LODWORD(v2) = v5 << 24;
  v10[4] = v2 >> 28;
  int v6 = a1[5];
  HIDWORD(v2) = v5;
  LODWORD(v2) = v6 << 24;
  v10[5] = v2 >> 29;
  int v7 = a1[6];
  HIDWORD(v2) = v6;
  LODWORD(v2) = v7 << 24;
  v10[6] = v2 >> 30;
  v10[7] = 2 * v7;
  hc_EVP_CIPHER_CTX_init((uint64_t)v11);
  int v8 = hc_EVP_des_cbc();
  hc_EVP_CipherInit_ex((uint64_t)v11, (uint64_t)v8, 0, (uint64_t)v10, 0, 1);
  hc_EVP_Cipher((uint64_t)v11);
  return hc_EVP_CIPHER_CTX_cleanup((uint64_t *)v11);
}

uint64_t heim_ntlm_v1_base_session(uint64_t a1, uint64_t a2, void *a3)
{
  *a3 = 16;
  int v4 = malloc_type_malloc(0x10uLL, 0xB9139A30uLL);
  a3[1] = v4;
  if (v4)
  {
    if (CCDigestCreate())
    {
      CCDigestUpdate();
      CCDigestFinal();
      CCDigestDestroy();
      return 0;
    }
    int v6 = (void *)a3[1];
    if (v6) {
      free(v6);
    }
    a3[1] = 0;
  }
  *a3 = 0;
  return 12;
}

uint64_t heim_ntlm_v2_base_session(const void *a1, size_t a2, uint64_t a3, void *a4)
{
  if (*(void *)a3 < 0x11uLL) {
    return 2733221633;
  }
  char v9 = malloc_type_malloc(0x10uLL, 0x2B391217uLL);
  a4[1] = v9;
  if (!v9) {
    return 12;
  }
  *a4 = 16;
  CCHmac(1u, a1, a2, *(const void **)(a3 + 8), 0x10uLL, v9);
  return 0;
}

uint64_t heim_ntlm_keyex_wrap(void *a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v3 = 2733221633;
  if (*a1 == 16)
  {
    *a2 = 16;
    int v7 = malloc_type_malloc(0x10uLL, 0xDE454FEAuLL);
    a2[1] = v7;
    if (v7)
    {
      *a3 = 16;
      int v8 = malloc_type_malloc(0x10uLL, 0x7F825DC2uLL);
      a3[1] = v8;
      if (v8)
      {
        uint64_t v17 = 0;
        memset(v16, 0, sizeof(v16));
        hc_EVP_CIPHER_CTX_init((uint64_t)v16);
        char v9 = hc_EVP_rc4();
        if (hc_EVP_CipherInit_ex((uint64_t)v16, (uint64_t)v9, 0, a1[1], 0, 1) == 1)
        {
          if (CCRandomCopyBytes())
          {
            hc_EVP_CIPHER_CTX_cleanup((uint64_t *)v16);
            uint64_t v10 = (void *)a3[1];
            if (v10) {
              free(v10);
            }
            *a3 = 0;
            a3[1] = 0;
            unint64_t v11 = (void *)a2[1];
            if (v11) {
              free(v11);
            }
            *a2 = 0;
            a2[1] = 0;
            return 2733221635;
          }
          else
          {
            hc_EVP_Cipher((uint64_t)v16);
            hc_EVP_CIPHER_CTX_cleanup((uint64_t *)v16);
            return 0;
          }
        }
        else
        {
          hc_EVP_CIPHER_CTX_cleanup((uint64_t *)v16);
          uint64_t v13 = (void *)a3[1];
          if (v13) {
            free(v13);
          }
          *a3 = 0;
          a3[1] = 0;
          size_t v14 = (void *)a2[1];
          if (v14) {
            free(v14);
          }
          *a2 = 0;
          a2[1] = 0;
          return 2733221634;
        }
      }
      else
      {
        uint64_t v12 = (void *)a2[1];
        if (v12) {
          free(v12);
        }
        *a2 = 0;
        a2[1] = 0;
        uint64_t v3 = 12;
        *a3 = 0;
      }
    }
    else
    {
      *a2 = 0;
      return 12;
    }
  }
  return v3;
}

uint64_t heim_ntlm_build_ntlm1_master(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v8 = 0;
  char v9 = 0;
  uint64_t v6 = heim_ntlm_v1_base_session(a1, a2, &v8);
  if (!v6)
  {
    uint64_t v6 = heim_ntlm_keyex_wrap(&v8, a3, a4);
    if (v9) {
      free(v9);
    }
  }
  return v6;
}

uint64_t heim_ntlm_build_ntlm2_master(const void *a1, size_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v7 = heim_ntlm_v2_base_session(a1, a2, a3, &v9);
  if (!v7)
  {
    uint64_t v7 = heim_ntlm_keyex_wrap(&v9, a4, a5);
    if (v10) {
      free(v10);
    }
  }
  return v7;
}

uint64_t heim_ntlm_keyex_unwrap(void *a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = 2733221633;
  *a3 = 0;
  a3[1] = 0;
  if (*a2 == 16 && *a1 == 16)
  {
    *a3 = 16;
    uint64_t v6 = malloc_type_malloc(0x10uLL, 0x1EDABE80uLL);
    a3[1] = v6;
    if (v6)
    {
      uint64_t v11 = 0;
      memset(v10, 0, sizeof(v10));
      hc_EVP_CIPHER_CTX_init((uint64_t)v10);
      uint64_t v7 = hc_EVP_rc4();
      if (hc_EVP_CipherInit_ex((uint64_t)v10, (uint64_t)v7, 0, a1[1], 0, 0) == 1)
      {
        hc_EVP_Cipher((uint64_t)v10);
        hc_EVP_CIPHER_CTX_cleanup((uint64_t *)v10);
        return 0;
      }
      else
      {
        hc_EVP_CIPHER_CTX_cleanup((uint64_t *)v10);
        uint64_t v8 = (void *)a3[1];
        if (v8) {
          free(v8);
        }
        *a3 = 0;
        a3[1] = 0;
        return 2733221634;
      }
    }
    else
    {
      *a3 = 0;
      return 12;
    }
  }
  return v3;
}

uint64_t heim_ntlm_ntlmv2_key(void *key, size_t keyLength, char *a3, char *a4, int a5, void *a6)
{
  memset(&ctx, 0, sizeof(ctx));
  CCHmacInit(&ctx, 1u, key, keyLength);
  size_t v13 = 0;
  size_t v14 = 0;
  uint64_t result = ascii2ucs2le(a3, 1, &v13);
  if (!result)
  {
    uint64_t v11 = v14;
    CCHmacUpdate(&ctx, v14, v13);
    free(v11);
    uint64_t result = ascii2ucs2le(a4, a5, &v13);
    if (!result)
    {
      uint64_t v12 = v14;
      CCHmacUpdate(&ctx, v14, v13);
      free(v12);
      CCHmacFinal(&ctx, a6);
      return 0;
    }
  }
  return result;
}

uint64_t heim_ntlm_unix2ts_time(uint64_t a1)
{
  return 10000000 * a1 + 116444736000000000;
}

unint64_t heim_ntlm_ts2unixtime(uint64_t a1)
{
  return (a1 - 116444736000000000) / 0x989680uLL;
}

uint64_t heim_ntlm_calculate_lm2(void *a1, size_t a2, char *a3, char *a4, const void *a5, void *a6, void *a7)
{
  v16[1] = *MEMORY[0x263EF8340];
  if (CCRandomCopyBytes()) {
    return 2733221635;
  }
  heim_ntlm_ntlmv2_key(a1, a2, a3, a4, 0, a6);
  uint64_t v15 = malloc_type_malloc(0x18uLL, 0x4EDC07A5uLL);
  a7[1] = v15;
  if (!v15) {
    return 12;
  }
  *a7 = 24;
  heim_ntlm_derive_ntlm2_sess(a6, v16, 8uLL, a5, v15);
  uint64_t result = 0;
  *(void *)(a7[1] + 16) = v16[0];
  return result;
}

void heim_ntlm_derive_ntlm2_sess(void *key, const void *a2, size_t a3, const void *a4, void *a5)
{
  memset(&v9, 0, sizeof(v9));
  CCHmacInit(&v9, 1u, key, 0x10uLL);
  CCHmacUpdate(&v9, a4, 8uLL);
  CCHmacUpdate(&v9, a2, a3);
  CCHmacFinal(&v9, a5);
}

uint64_t heim_ntlm_calculate_ntlm2(void *a1, size_t a2, char *a3, char *a4, const void *a5, void *a6, void *a7, void *a8)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v16 = 2733221632;
  size_t v25 = 0;
  uint64_t v26 = 0;
  time_t v17 = time(0);
  if (!CCRandomCopyBytes())
  {
    heim_ntlm_ntlmv2_key(a1, a2, a3, a4, 0, a7);
    uint64_t v18 = krb5_storage_emem();
    if (v18)
    {
      uint64_t v19 = (uint64_t)v18;
      krb5_storage_set_flags((uint64_t)v18, 32);
      if (krb5_store_uint32(v19, 257)
        || krb5_store_uint32(v19, 0)
        || (unint64_t v20 = 10000000 * v17 + 116444736000000000, krb5_store_uint32(v19, v20))
        || krb5_store_uint32(v19, HIDWORD(v20))
        || krb5_storage_write(v19) != 8
        || krb5_store_uint32(v19, 0)
        || krb5_storage_write(v19) != *a6
        || krb5_store_uint32(v19, 0)
        || krb5_storage_to_data(v19, &v25))
      {
LABEL_13:
        krb5_storage_free(v19);
        return v16;
      }
      krb5_storage_free(v19);
      heim_ntlm_derive_ntlm2_sess(a7, v26, v25, a5, v27);
      uint64_t v21 = krb5_storage_emem();
      if (v21)
      {
        uint64_t v19 = (uint64_t)v21;
        if (krb5_storage_write((uint64_t)v21) == 16)
        {
          uint64_t v22 = krb5_storage_write(v19);
          if (v22 == v25)
          {
            krb5_data_free(&v25);
            if (!krb5_storage_to_data(v19, &v25))
            {
              krb5_storage_free(v19);
              uint64_t v16 = 0;
              uint64_t v23 = v26;
              *a8 = v25;
              a8[1] = v23;
              return v16;
            }
          }
        }
        goto LABEL_13;
      }
      krb5_data_free(&v25);
    }
    return 12;
  }
  return 2733221635;
}

uint64_t heim_ntlm_verify_ntlm2(void *a1, size_t a2, char *a3, char *a4, uint64_t a5, const void *a6, uint64_t *a7, size_t *a8, void *a9)
{
  if (verify_ntlm2(a1, a2, a3, a4, 0, a5, a6, a7, a8, a9)
    && verify_ntlm2(a1, a2, a3, a4, 1, a5, a6, a7, a8, a9))
  {
    return verify_ntlm2(a1, a2, a3, "", 0, a5, a6, a7, a8, a9);
  }
  else
  {
    return 0;
  }
}

uint64_t verify_ntlm2(void *key, size_t keyLength, char *a3, char *a4, int a5, uint64_t a6, const void *a7, uint64_t *a8, size_t *a9, void *a10)
{
  v32[5] = *MEMORY[0x263EF8340];
  uint64_t v10 = 2733221632;
  *a9 = 0;
  a9[1] = 0;
  if ((unint64_t)*a8 < 0x10) {
    return 2733221633;
  }
  int v12 = a6;
  if (!a6) {
    int v12 = time(0);
  }
  heim_ntlm_ntlmv2_key(key, keyLength, a3, a4, a5, a10);
  uint64_t v18 = krb5_storage_from_readonly_mem(a8[1], *a8);
  if (!v18) {
    return 12;
  }
  uint64_t v19 = (uint64_t)v18;
  unsigned int v31 = 0;
  krb5_storage_set_flags((uint64_t)v18, 32);
  if (krb5_storage_read(v19) == 16 && !krb5_ret_uint32(v19, &v31) && v31 == 257)
  {
    int v20 = krb5_ret_uint32(v19, &v31);
    if (!(v20 | v31) && !krb5_ret_uint32(v19, &v31))
    {
      uint64_t v21 = v31;
      if (!krb5_ret_uint32(v19, &v31))
      {
        int v22 = ((v21 | ((unint64_t)v31 << 32)) - 116444736000000000) / 0x989680 - v12;
        if (v22 < 0) {
          int v22 = v12 - ((v21 | ((unint64_t)v31 << 32)) - 116444736000000000) / 0x989680;
        }
        if (v22 <= 0x1C20)
        {
          if (krb5_storage_read(v19) == 8 && !krb5_ret_uint32(v19, &v31))
          {
            uint64_t v23 = *a8;
            size_t v24 = v23 - krb5_storage_seek(v19);
            *a9 = v24;
            if (v24 >= 4)
            {
              size_t v25 = malloc_type_malloc(v24, 0x6FF7C28uLL);
              a9[1] = (size_t)v25;
              if (!v25)
              {
                *a9 = 0;
                a9[1] = 0;
                uint64_t v10 = 12;
LABEL_28:
                krb5_storage_free(v19);
                return v10;
              }
              if (krb5_storage_read(v19) != *a9) {
                goto LABEL_25;
              }
              krb5_storage_free(v19);
              if ((unint64_t)*a8 >= 0x10)
              {
                heim_ntlm_derive_ntlm2_sess(a10, (const void *)(a8[1] + 16), *a8 - 16, a7, v32);
                if (v32[0] == v32[3] && v32[1] == v32[4]) {
                  return 0;
                }
                v29 = (void *)a9[1];
                if (v29) {
                  free(v29);
                }
                *a9 = 0;
                a9[1] = 0;
                return 2733221636;
              }
              uint64_t v19 = 0;
            }
            uint64_t v10 = 2733221633;
          }
        }
        else
        {
          uint64_t v10 = 2733221637;
        }
      }
    }
  }
LABEL_25:
  uint64_t v26 = (void *)a9[1];
  if (v26) {
    free(v26);
  }
  *a9 = 0;
  a9[1] = 0;
  if (v19) {
    goto LABEL_28;
  }
  return v10;
}

uint64_t heim_ntlm_calculate_ntlm2_sess(void *a1, uint64_t a2, long long *a3, uint64_t a4, void *a5)
{
  v16[1] = *MEMORY[0x263EF8340];
  uint64_t result = heim_ntlm_calculate_ntlm2_sess_hash((uint64_t)a1, a2, v16);
  if (!result)
  {
    uint64_t v10 = malloc_type_malloc(0x18uLL, 0x3B5658CuLL);
    *(void *)(a4 + 8) = v10;
    if (v10)
    {
      *(void *)a4 = 24;
      uint64_t v11 = malloc_type_malloc(0x18uLL, 0x29CB36FDuLL);
      a5[1] = v11;
      if (v11)
      {
        *a5 = 24;
        int v12 = *(void **)(a4 + 8);
        void *v12 = 0;
        v12[1] = 0;
        v12[2] = 0;
        **(void **)(a4 + 8) = *a1;
        int v14 = 0;
        char v15 = 0;
        long long v13 = *a3;
        splitandenc(&v13);
        splitandenc((unsigned char *)&v13 + 7);
        splitandenc((unsigned char *)((unint64_t)&v13 | 0xE));
        return 0;
      }
      free(*(void **)(a4 + 8));
      *(void *)(a4 + 8) = 0;
    }
    return 12;
  }
  return result;
}

uint64_t heim_ntlm_calculate_ntlm2_sess_hash(uint64_t a1, uint64_t a2, void *a3)
{
  if (!CCDigestCreate()) {
    return 12;
  }
  CCDigestUpdate();
  CCDigestUpdate();
  CCDigestFinal();
  CCDigestDestroy();
  uint64_t result = 0;
  *a3 = v5;
  return result;
}

uint64_t heim_ntlm_mppe_getmasterkey()
{
  if (!CCDigestCreate()) {
    return 12;
  }
  CCDigestUpdate();
  CCDigestUpdate();
  CCDigestUpdate();
  CCDigestFinal();
  CCDigestDestroy();
  return 0;
}

uint64_t heim_ntlm_mppe_getasymmetricstartkey(uint64_t a1, void *a2, size_t a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (a3 > 0x14) {
    return 22;
  }
  if (!CCDigestCreate()) {
    return 12;
  }
  CCDigestUpdate();
  CCDigestUpdate();
  CCDigestUpdate();
  CCDigestUpdate();
  CCDigestFinal();
  CCDigestDestroy();
  memcpy(a2, __src, a3);
  return 0;
}

uint64_t heim_ntlm_mppe_getsessionkey(const void *a1, uint64_t a2, uint64_t a3, size_t a4, void *a5, void *a6)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  CC_MD4(a1, 0x10u, md);
  uint64_t result = heim_ntlm_mppe_getmasterkey();
  *(void *)md = 0;
  uint64_t v12 = 0;
  if (!result)
  {
    uint64_t result = heim_ntlm_mppe_getasymmetricstartkey((uint64_t)v10, a5, a4);
    if (!result) {
      return heim_ntlm_mppe_getasymmetricstartkey((uint64_t)v10, a6, a4);
    }
  }
  return result;
}

void *initialize_ntlm_error_table_r(void *a1)
{
  return initialize_error_table_r(a1, (uint64_t)ntlm_error_strings, 131, -1561745664);
}

uint64_t krb5_storage_set_flags(uint64_t result, int a2)
{
  *(_DWORD *)(result + 48) |= a2;
  return result;
}

uint64_t krb5_storage_set_byteorder(uint64_t result, int a2)
{
  *(_DWORD *)(result + 48) = *(_DWORD *)(result + 48) & 0xFFFFFF9F | a2;
  return result;
}

uint64_t krb5_storage_seek(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 24))();
}

uint64_t krb5_storage_read(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 8))();
}

uint64_t krb5_storage_write(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

uint64_t krb5_storage_free(uint64_t a1)
{
  unint64_t v2 = *(void (**)(uint64_t))(a1 + 40);
  if (v2) {
    v2(a1);
  }
  free(*(void **)a1);
  free((void *)a1);
  return 0;
}

uint64_t krb5_storage_to_data(uint64_t a1, size_t *a2)
{
  uint64_t v4 = 2314790665;
  uint64_t v5 = (*(uint64_t (**)(uint64_t, void, uint64_t))(a1 + 24))(a1, 0, 1);
  if (v5 < 0) {
    return 2314790664;
  }
  uint64_t v6 = v5;
  int64_t v7 = (*(uint64_t (**)(uint64_t, void, uint64_t))(a1 + 24))(a1, 0, 2);
  if (v7 <= 102400)
  {
    int64_t v8 = v7;
    int64_t v9 = *(void *)(a1 + 56);
    if (!v9 || v9 >= v7)
    {
      uint64_t v4 = krb5_data_alloc(a2, v7);
      if (!v4)
      {
        if (!v8) {
          return 0;
        }
        (*(void (**)(uint64_t, void, void))(a1 + 24))(a1, 0, 0);
        (*(void (**)(uint64_t, size_t, size_t))(a1 + 8))(a1, a2[1], *a2);
        uint64_t v4 = 0;
      }
      (*(void (**)(uint64_t, uint64_t, void))(a1 + 24))(a1, v6, 0);
    }
  }
  return v4;
}

uint64_t krb5_store_int32(uint64_t a1, unsigned int a2)
{
  if ((*(_DWORD *)(a1 + 48) & 0x60) != 0x40 && (*(_DWORD *)(a1 + 48) & 1) == 0)
  {
    if ((*(_DWORD *)(a1 + 48) & 0x60) == 0x20) {
      a2 = rk_bswap32(a2);
    }
  }
  else
  {
    a2 = bswap32(a2);
  }
  return krb5_store_int(a1, a2, 4);
}

uint64_t krb5_store_int(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  _krb5_put_int((uint64_t)v8, a2, a3);
  uint64_t v5 = (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(a1 + 16))(a1, v8, a3);
  if (v5 < 0)
  {
    int64_t v7 = __error();
  }
  else
  {
    if (v5 == a3) {
      return 0;
    }
    int64_t v7 = (int *)(a1 + 52);
  }
  return *v7;
}

uint64_t krb5_ret_int32(uint64_t a1, unsigned int *a2)
{
  uint64_t v4 = krb5_ret_int(a1, a2, 4);
  if (!v4)
  {
    if (*(_DWORD *)(a1 + 48) & 0x60) == 0x40 || (*(_DWORD *)(a1 + 48))
    {
      unsigned int v6 = bswap32(*a2);
LABEL_9:
      *a2 = v6;
      return v4;
    }
    if ((*(_DWORD *)(a1 + 48) & 0x60) == 0x20)
    {
      unsigned int v6 = rk_bswap32(*a2);
      goto LABEL_9;
    }
  }
  return v4;
}

uint64_t krb5_ret_int(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  unint64_t v8 = 0;
  uint64_t v6 = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 8))(a1, v9);
  if (v6 < 0) {
    return *__error();
  }
  if (v6 != a3) {
    return *(unsigned int *)(a1 + 52);
  }
  _krb5_get_int(v9, &v8, a3);
  uint64_t result = 0;
  *a2 = v8;
  return result;
}

uint64_t krb5_ret_uint32(uint64_t a1, _DWORD *a2)
{
  unsigned int v4 = 0;
  uint64_t result = krb5_ret_int32(a1, &v4);
  if (!result) {
    *a2 = v4;
  }
  return result;
}

uint64_t krb5_store_int16(uint64_t a1, unsigned int a2)
{
  if ((*(_DWORD *)(a1 + 48) & 0x60) != 0x40 && (*(_DWORD *)(a1 + 48) & 1) == 0)
  {
    if ((*(_DWORD *)(a1 + 48) & 0x60) == 0x20) {
      LOWORD(a2) = rk_bswap16((unsigned __int16)a2);
    }
  }
  else
  {
    a2 = bswap32(a2) >> 16;
  }
  return krb5_store_int(a1, (__int16)a2, 2);
}

uint64_t krb5_store_uint16(uint64_t a1, __int16 a2)
{
  return krb5_store_int16(a1, a2);
}

uint64_t krb5_ret_int16(uint64_t a1, _WORD *a2)
{
  unsigned int v9 = 0;
  uint64_t v4 = krb5_ret_int(a1, &v9, 2);
  if (!v4)
  {
    unsigned int v5 = v9;
    *a2 = v9;
    if (*(_DWORD *)(a1 + 48) & 0x60) == 0x40 || (*(_DWORD *)(a1 + 48))
    {
      unsigned int v7 = bswap32(v5) >> 16;
LABEL_9:
      *a2 = v7;
      return v4;
    }
    if ((*(_DWORD *)(a1 + 48) & 0x60) == 0x20)
    {
      LOWORD(v7) = rk_bswap16((unsigned __int16)v5);
      goto LABEL_9;
    }
  }
  return v4;
}

uint64_t krb5_ret_uint16(uint64_t a1, _WORD *a2)
{
  __int16 v4 = 0;
  uint64_t result = krb5_ret_int16(a1, &v4);
  if (!result) {
    *a2 = v4;
  }
  return result;
}

uint64_t krb5_store_int8(uint64_t a1, char a2)
{
  char v6 = a2;
  uint64_t v3 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 16))(a1, &v6, 1);
  if (v3 == 1) {
    return 0;
  }
  if (v3 < 0) {
    unsigned int v5 = __error();
  }
  else {
    unsigned int v5 = (int *)(a1 + 52);
  }
  return *v5;
}

uint64_t krb5_store_uint8(uint64_t a1, char a2)
{
  return krb5_store_int8(a1, a2);
}

void *krb5_storage_emem()
{
  v0 = malloc_type_malloc(0x40uLL, 0x10800405C5E1C9BuLL);
  if (v0)
  {
    char v1 = malloc_type_malloc(0x20uLL, 0x101004038BDA701uLL);
    if (v1)
    {
      unint64_t v2 = v1;
      void *v0 = v1;
      v0[6] = 0x89F8E70500000000;
      v1[1] = 1024;
      uint64_t v3 = malloc_type_malloc(0x400uLL, 0xF239CFACuLL);
      void *v2 = v3;
      if (v3)
      {
        v2[2] = 0;
        v2[3] = v3;
        v0[1] = emem_fetch;
        v0[2] = emem_store;
        v0[3] = emem_seek;
        v0[4] = emem_trunc;
        v0[5] = emem_free;
        v0[7] = 0x1FFFFFFFLL;
        return v0;
      }
      free(v0);
      __int16 v4 = v2;
    }
    else
    {
      __int16 v4 = v0;
    }
    free(v4);
    return 0;
  }
  return v0;
}

size_t emem_fetch(void **a1, void *__dst, size_t a3)
{
  unsigned int v5 = (const void *)(*a1)[3];
  if (**a1 + (*a1)[2] - (void)v5 >= a3) {
    size_t v6 = a3;
  }
  else {
    size_t v6 = **a1 + (*a1)[2] - (void)v5;
  }
  memmove(__dst, v5, v6);
  ((void (*)(void **, size_t, uint64_t))a1[3])(a1, v6, 1);
  return v6;
}

size_t emem_store(void ***a1, void *__src, size_t __len)
{
  size_t v3 = __len;
  size_t v6 = *a1;
  unsigned int v7 = **a1;
  unint64_t v8 = (char *)v6[3];
  if ((char *)v6[1] + (void)v7 - v8 < __len)
  {
    int64_t v9 = v8 - v7;
    size_t v10 = (v8 - v7 + __len) << (v8 - v7 + __len < 0x1000);
    uint64_t v11 = (char *)malloc_type_realloc(v7, v10, 0x9195CD2BuLL);
    if (!v11) {
      return -1;
    }
    void *v6 = v11;
    v6[1] = (void *)v10;
    unint64_t v8 = &v11[v9];
    v6[3] = &v11[v9];
  }
  memmove(v8, __src, v3);
  ((void (*)(void ***, size_t, uint64_t))a1[3])(a1, v3, 1);
  return v3;
}

uint64_t emem_seek(uint64_t a1, unint64_t a2, int a3)
{
  size_t v3 = *(void **)a1;
  switch(a3)
  {
    case 2:
      size_t v6 = *(void (**)(void))(a1 + 24);
LABEL_10:
      v6();
      return v3[3] - *v3;
    case 1:
      size_t v6 = *(void (**)(void))(a1 + 24);
      goto LABEL_10;
    case 0:
      uint64_t v4 = v3[1];
      if (v4 >= a2) {
        uint64_t v4 = a2;
      }
      unint64_t v5 = v4 & ~(v4 >> 63);
      v3[3] = *v3 + v5;
      if (v5 > v3[2]) {
        v3[2] = v5;
      }
      return v3[3] - *v3;
  }
  *__error() = 22;
  return -1;
}

uint64_t emem_trunc(void ***a1, size_t size)
{
  size_t v3 = *a1;
  if (size)
  {
    unint64_t v5 = *v3;
    size_t v4 = (size_t)v3[1];
    size_t v6 = (char *)v3[3];
    if (v4 < size || v4 >> 1 > size)
    {
      unint64_t v8 = (char *)malloc_type_realloc(*v3, size, 0x7DF3B92DuLL);
      if (!v8) {
        return 12;
      }
      uint64_t v11 = v8;
      uint64_t v9 = v6 - v5;
      size_t v10 = (char *)v3[1];
      if (size > (unint64_t)v10) {
        bzero(&v10[(void)v8], size - (void)v10);
      }
      void *v3 = v11;
      v3[1] = (void *)size;
      size_t v6 = &v11[v9];
      v3[3] = &v11[v9];
    }
    else
    {
      uint64_t v11 = (char *)*v3;
    }
  }
  else
  {
    free(*v3);
    uint64_t v11 = 0;
    size_t v6 = 0;
    v3[3] = 0;
    void *v3 = 0;
    v3[1] = 0;
  }
  v3[2] = (void *)size;
  uint64_t result = 0;
  if (v6 - v11 > (uint64_t)size) {
    v3[3] = &v11[size];
  }
  return result;
}

void emem_free(void ***a1)
{
  char v1 = *a1;
  bzero(**a1, (size_t)(*a1)[2]);
  unint64_t v2 = *v1;
  free(v2);
}

size_t mem_fetch(void **a1, void *__dst, size_t a3)
{
  unint64_t v5 = (const void *)(*a1)[2];
  if (**a1 + (*a1)[1] - (void)v5 >= a3) {
    size_t v6 = a3;
  }
  else {
    size_t v6 = **a1 + (*a1)[1] - (void)v5;
  }
  memmove(__dst, v5, v6);
  ((void (*)(void **, size_t, uint64_t))a1[3])(a1, v6, 1);
  return v6;
}

uint64_t mem_seek(uint64_t a1, unint64_t a2, int a3)
{
  size_t v3 = *(void **)a1;
  if (a3 == 2)
  {
    size_t v6 = *(uint64_t (**)(void))(a1 + 24);
  }
  else
  {
    if (a3 != 1)
    {
      if (a3)
      {
        *__error() = 22;
        return -1;
      }
      else
      {
        uint64_t v4 = v3[1];
        if (v4 >= a2) {
          uint64_t v4 = a2;
        }
        uint64_t result = v4 & ~(v4 >> 63);
        v3[2] = *v3 + result;
      }
      return result;
    }
    size_t v6 = *(uint64_t (**)(void))(a1 + 24);
  }
  return v6();
}

void *krb5_storage_from_readonly_mem(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = malloc_type_malloc(0x40uLL, 0x10800405C5E1C9BuLL);
  if (v4)
  {
    unint64_t v5 = malloc_type_malloc(0x18uLL, 0x10100406AB5462FuLL);
    if (v5)
    {
      *uint64_t v4 = v5;
      v4[6] = 0x89F8E70500000000;
      void *v5 = a1;
      v5[1] = a2;
      v5[2] = a1;
      v4[1] = mem_fetch;
      v4[2] = mem_no_store;
      v4[3] = mem_seek;
      v4[4] = mem_no_trunc;
      v4[5] = 0;
      v4[7] = 0x1FFFFFFFLL;
    }
    else
    {
      free(v4);
      return 0;
    }
  }
  return v4;
}

uint64_t mem_no_store()
{
  return -1;
}

uint64_t mem_no_trunc()
{
  return 22;
}

void krb5_data_free(void *a1)
{
  unint64_t v2 = (void *)a1[1];
  if (v2) {
    free(v2);
  }
  *a1 = 0;
  a1[1] = 0;
}

uint64_t krb5_data_alloc(size_t *a1, size_t a2)
{
  uint64_t v4 = malloc_type_calloc(1uLL, a2, 0xAC2A8630uLL);
  a1[1] = (size_t)v4;
  if (a2 && !v4) {
    return 12;
  }
  uint64_t result = 0;
  *a1 = a2;
  return result;
}

uint64_t heim_apop_create(const char *a1, const char *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v8 = 0;
  memset(&v7, 0, sizeof(v7));
  CC_MD5_Init(&v7);
  CC_LONG v4 = strlen(a1);
  CC_MD5_Update(&v7, a1, v4);
  CC_LONG v5 = strlen(a2);
  CC_MD5_Update(&v7, a2, v5);
  CC_MD5_Final(md, &v7);
  rk_hex_encode_lower((char *)md, 16, &v8);
  return v8;
}

uint64_t heim_apop_verify(const char *a1, const char *a2, const char *a3)
{
  CC_LONG v4 = (const char *)heim_apop_create(a1, a2);
  if (!v4) {
    return 12;
  }
  CC_LONG v5 = (char *)v4;
  int v6 = strcasecmp(v4, a3);
  free(v5);
  if (v6) {
    return 2733221641;
  }
  else {
    return 0;
  }
}

int8x16_t heim_cram_md5_export(const char *a1, int8x16_t *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  size_t v4 = strlen(a1);
  uint64_t v20 = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  memset(v15, 0, sizeof(v15));
  if (v4 < 0x41)
  {
    __memcpy_chk();
    *(void *)&long long v6 = 0x3636363636363636;
    *((void *)&v6 + 1) = 0x3636363636363636;
    long long data = v6;
    long long v22 = v6;
    long long v23 = v6;
    long long v24 = v6;
    if (!v4)
    {
      char v8 = 1;
      goto LABEL_7;
    }
  }
  else
  {
    CC_MD5(a1, v4, md);
    *(void *)&long long v5 = 0x3636363636363636;
    *((void *)&v5 + 1) = 0x3636363636363636;
    long long data = v5;
    long long v22 = v5;
    long long v23 = v5;
    long long v24 = v5;
    size_t v4 = 8;
  }
  for (uint64_t i = 0; i != v4; ++i)
    *((unsigned char *)&data + i) ^= md[i];
  char v8 = 0;
LABEL_7:
  CC_MD5_Init((CC_MD5_CTX *)v15);
  CC_MD5_Init((CC_MD5_CTX *)&v15[92]);
  CC_MD5_Update((CC_MD5_CTX *)v15, &data, 0x40u);
  *(void *)&long long v9 = 0x5C5C5C5C5C5C5C5CLL;
  *((void *)&v9 + 1) = 0x5C5C5C5C5C5C5C5CLL;
  long long data = v9;
  long long v22 = v9;
  long long v23 = v9;
  long long v24 = v9;
  if ((v8 & 1) == 0)
  {
    p_long long data = &data;
    uint64_t v11 = md;
    do
    {
      char v12 = *v11++;
      *(unsigned char *)p_data ^= v12;
      p_long long data = (long long *)((char *)p_data + 1);
      --v4;
    }
    while (v4);
  }
  CC_MD5_Update((CC_MD5_CTX *)&v15[92], &data, 0x40u);
  int8x16_t result = vrev32q_s8(*(int8x16_t *)v15);
  int8x16_t v14 = vrev32q_s8(*(int8x16_t *)&v15[92]);
  *a2 = result;
  a2[1] = v14;
  return result;
}

char *heim_cram_md5_import(int8x16_t *a1, uint64_t a2)
{
  if (a2 != 32) {
    return 0;
  }
  int8x16_t result = (char *)malloc_type_calloc(1uLL, 0xB8uLL, 0x10000400D840072uLL);
  if (result)
  {
    int8x16_t v4 = a1[1];
    *(int8x16_t *)int8x16_t result = vrev32q_s8(*a1);
    *(int8x16_t *)(result + 92) = vrev32q_s8(v4);
    *(void *)(result + 108) = 512;
    *((void *)result + 2) = 512;
    *((_DWORD *)result + 45) = 0;
    *((_DWORD *)result + 22) = 0;
  }
  return result;
}

uint64_t heim_cram_md5_verify_ctx(CC_MD5_CTX *a1, char *__s, const char *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v13 = 0;
  CC_LONG v6 = strlen(__s);
  CC_MD5_Update(a1, __s, v6);
  CC_MD5_Final(md, a1);
  CC_MD5_Update(a1 + 1, md, 0x10u);
  CC_MD5_Final(md, a1 + 1);
  rk_hex_encode_lower((char *)md, 16, &v13);
  CC_MD5_CTX v7 = v13;
  if (!v13) {
    return 12;
  }
  uint64_t v8 = 2733221642;
  if (strlen(a3) != 32) {
    return v8;
  }
  long long v9 = (unsigned __int8 *)strdup(a3);
  if (!v9)
  {
    free(v7);
    return 12;
  }
  uint64_t v10 = v9;
  rk_strlwr(v9);
  BOOL v11 = ct_memcmp((unsigned __int8 *)v13, v10, 32);
  free(v10);
  free(v13);
  if (v11) {
    return 2733221642;
  }
  else {
    return 0;
  }
}

void heim_cram_md5_free(void *a1)
{
  *((void *)a1 + 22) = 0;
  *((_OWORD *)a1 + 9) = 0u;
  *((_OWORD *)a1 + 10) = 0u;
  *((_OWORD *)a1 + 7) = 0u;
  *((_OWORD *)a1 + 8) = 0u;
  *((_OWORD *)a1 + 5) = 0u;
  *((_OWORD *)a1 + 6) = 0u;
  *((_OWORD *)a1 + 3) = 0u;
  *((_OWORD *)a1 + 4) = 0u;
  *((_OWORD *)a1 + 1) = 0u;
  *((_OWORD *)a1 + 2) = 0u;
  *(_OWORD *)a1 = 0u;
  free(a1);
}

uint64_t heim_cram_md5_create(const char *a1, char *__s)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  memset(&ctx, 0, sizeof(ctx));
  uint64_t v7 = 0;
  size_t v4 = strlen(__s);
  CCHmacInit(&ctx, 1u, __s, v4);
  size_t v5 = strlen(a1);
  CCHmacUpdate(&ctx, a1, v5);
  CCHmacFinal(&ctx, macOut);
  memset(&ctx, 0, sizeof(ctx));
  rk_hex_encode_lower(macOut, 16, &v7);
  return v7;
}

uint64_t heim_cram_md5_verify(const char *a1, char *a2, char *a3)
{
  size_t v4 = (const char *)heim_cram_md5_create(a1, a2);
  if (!v4) {
    return 12;
  }
  size_t v5 = (char *)v4;
  size_t v6 = strlen(v4);
  if (v6 != strlen(a3))
  {
    uint64_t v10 = 2733221642;
    free(v5);
    return v10;
  }
  uint64_t v7 = (unsigned __int8 *)strdup(a3);
  if (!v7)
  {
    free(v5);
    return 12;
  }
  uint64_t v8 = v7;
  rk_strlwr(v7);
  BOOL v9 = ct_memcmp((unsigned __int8 *)v5, (unsigned __int8 *)a3, v6);
  free(v8);
  free(v5);
  if (v9) {
    return 2733221642;
  }
  else {
    return 0;
  }
}

_DWORD *heim_digest_create(uint64_t a1, int a2)
{
  int8x16_t result = malloc_type_calloc(1uLL, 0xA8uLL, 0x1010040E60783F7uLL);
  if (result)
  {
    *result |= 1u;
    result[1] = a2;
  }
  return result;
}

uint64_t heim_digest_generate_challenge(uint64_t a1)
{
  size_t v4 = 0;
  if (!*(void *)(a1 + 32)) {
    return 0;
  }
  if (*(void *)(a1 + 24) || (uint64_t result = generate_nonce(), (*(void *)(a1 + 24) = result) != 0))
  {
    if (*(void *)(a1 + 40) || (uint64_t result = (uint64_t)strdup("auth"), (*(void *)(a1 + 40) = result) != 0))
    {
      if (*(void *)(a1 + 56) || (uint64_t result = (uint64_t)strdup("65536"), (*(void *)(a1 + 56) = result) != 0))
      {
        switch(*(_DWORD *)(a1 + 4))
        {
          case 0:
            *(_DWORD *)(a1 + 4) = 8;
            goto LABEL_10;
          case 1:
            asprintf(&v4, "realm=\"%s\",nonce=\"%s\"");
            break;
          case 2:
            asprintf(&v4, "realm=\"%s\",nonce=\"%s\",algorithm=md5,qop=\"%s\"");
            break;
          case 4:
            asprintf(&v4, "realm=\"%s\",nonce=\"%s\",algorithm=md5-sess,qop=\"%s\"");
            break;
          case 8:
LABEL_10:
            asprintf(&v4, "realm=\"%s\",nonce=\"%s\",qop=\"%s\",algorithm=md5-sess,charset=utf-8,maxbuf=%s");
            break;
          default:
            break;
        }
        size_t v3 = *(void **)(a1 + 144);
        if (v3) {
          free(v3);
        }
        uint64_t result = (uint64_t)v4;
        *(void *)(a1 + 144) = v4;
      }
    }
  }
  return result;
}

uint64_t generate_nonce()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t v2 = 0;
  int v0 = CCRandomCopyBytes();
  uint64_t result = 0;
  if (!v0)
  {
    if (rk_hex_encode(v3, 8, &v2) >= 0) {
      return v2;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t heim_digest_parse_challenge(uint64_t a1, const char *a2)
{
  uint64_t v2 = a2;
  int8x16_t v14 = 0;
  if (!strncasecmp("Digest ", a2, 7uLL))
  {
    v2 += 6;
    do
      int v4 = *(unsigned __int8 *)++v2;
    while (v4 == 32);
    *(_DWORD *)a1 |= 8u;
  }
  uint64_t v5 = parse_values(v2, (void ***)&v14);
  if (v5) {
    goto LABEL_18;
  }
  uint64_t v6 = values_find(&v14, "nonce");
  *(void *)(a1 + 24) = v6;
  if (!v6) {
    goto LABEL_17;
  }
  uint64_t v7 = values_find(&v14, "realm");
  *(void *)(a1 + 32) = v7;
  if (!v7) {
    goto LABEL_17;
  }
  uint64_t v8 = (const char *)values_find(&v14, "algorithm");
  *(void *)(a1 + 128) = v8;
  if (v8)
  {
    BOOL v9 = v8;
    if (strcasecmp(v8, "md5"))
    {
      if (!strcasecmp(v9, "md5-sess"))
      {
        int v10 = 12;
        goto LABEL_13;
      }
LABEL_17:
      uint64_t v5 = 1;
LABEL_18:
      free_values((void **)v14);
      clear_context();
      return v5;
    }
  }
  int v10 = 2;
LABEL_13:
  uint64_t v11 = values_find(&v14, "qop");
  *(void *)(a1 + 40) = v11;
  if (!v11) {
    int v10 = 1;
  }
  *(void *)(a1 + 64) = values_find(&v14, "opaque");
  int v12 = *(_DWORD *)(a1 + 4);
  if (v12 && (v12 & v10) == 0) {
    goto LABEL_17;
  }
  if (!v12) {
    *(_DWORD *)(a1 + 4) = v10;
  }
  free_values((void **)v14);
  return 0;
}

uint64_t parse_values(const char *a1, void ***a2)
{
  *a2 = 0;
  size_t v3 = strdup(a1);
  if (!v3) {
    return 12;
  }
  int v4 = v3;
  size_t v5 = strlen(v3);
  uint64_t v6 = v4;
  while (v6 - v4 < v5)
  {
    size_t v7 = strspn(v6, " \t\n\r,");
    uint64_t v8 = &v6[v7];
    if (!v6[v7]) {
      break;
    }
    size_t v9 = strcspn(&v6[v7], " \t\n\r=");
    if (!v9) {
      goto LABEL_26;
    }
    size_t v10 = v9;
    uint64_t v11 = &v8[v9];
    if (!v8[v9]) {
      goto LABEL_26;
    }
    int v12 = (char **)malloc_type_malloc(0x18uLL, 0x30040254F79A5uLL);
    if (!v12) {
      goto LABEL_31;
    }
    uint64_t v13 = v12;
    void *v12 = 0;
    v12[1] = 0;
    v12[2] = (char *)*a2;
    *a2 = (void **)v12;
    int8x16_t v14 = (char *)malloc_type_malloc(v10 + 1, 0xB24B17CAuLL);
    void *v13 = v14;
    if (!v14) {
      goto LABEL_31;
    }
    strncpy(v14, v8, v10);
    (*v13)[v10] = 0;
    uint64_t v15 = &v11[strspn(v11, " \t\n\r")];
    if (*v15 != 61) {
      goto LABEL_26;
    }
    long long v16 = v15 + 1;
    size_t v17 = strspn(v15 + 1, " \t\n\r");
    long long v18 = (char *)&v16[v17];
    if (v16[v17] == 34)
    {
      long long v19 = v18 + 1;
      while (1)
      {
        long long v22 = strchr(v18 + 1, 34);
        if (!v22) {
          goto LABEL_26;
        }
        long long v18 = v22;
        if (!*v22) {
          goto LABEL_26;
        }
        if (*(v22 - 1) != 92 || *v22 != 34) {
          goto LABEL_13;
        }
      }
    }
    if (!v16[v17]) {
      goto LABEL_26;
    }
    long long v19 = &v16[v17];
    v18 += strcspn(&v16[v17], " \t\n\r=,");
LABEL_13:
    uint64_t v20 = (char *)malloc_type_malloc(v18 - v19 + 1, 0xADAA43BuLL);
    v13[1] = v20;
    if (!v20)
    {
LABEL_31:
      uint64_t v21 = 12;
      goto LABEL_27;
    }
    strncpy(v20, v19, v18 - v19);
    v13[1][v18 - v19] = 0;
    uint64_t v21 = *v18;
    if (v21 == 34)
    {
      ++v18;
    }
    else if (!*v18)
    {
      goto LABEL_28;
    }
    uint64_t v6 = &v18[strspn(v18, " \t\n\r")];
    uint64_t v21 = *(unsigned __int8 *)v6;
    if (v21 != 44)
    {
      if (!*v6) {
        goto LABEL_28;
      }
LABEL_26:
      uint64_t v21 = 22;
LABEL_27:
      free_values(*a2);
      *a2 = 0;
      goto LABEL_28;
    }
  }
  uint64_t v21 = 0;
LABEL_28:
  free(v4);
  return v21;
}

uint64_t values_find(void *a1, char *a2)
{
  uint64_t v2 = *a1;
  if (!*a1) {
    return 0;
  }
  int v4 = a1;
  if (strcasecmp(a2, *(const char **)v2))
  {
    while (1)
    {
      uint64_t v5 = v2;
      uint64_t v2 = *(void *)(v2 + 16);
      if (!v2) {
        return 0;
      }
      if (!strcasecmp(a2, *(const char **)v2))
      {
        int v4 = (void *)(v5 + 16);
        break;
      }
    }
  }
  *int v4 = *(void *)(v2 + 16);
  uint64_t v6 = *(void *)(v2 + 8);
  free(*(void **)v2);
  free((void *)v2);
  return v6;
}

void free_values(void **a1)
{
  if (a1)
  {
    char v1 = a1;
    do
    {
      uint64_t v2 = (void **)v1[2];
      if (*v1) {
        free(*v1);
      }
      size_t v3 = v1[1];
      if (v3) {
        free(v3);
      }
      free(v1);
      char v1 = v2;
    }
    while (v2);
  }
}

void clear_context(void)
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)(v0 + 8);
  if (v2)
  {
    size_t v3 = strlen(*(const char **)(v0 + 8));
    bzero(v2, v3);
    free(*(void **)(v1 + 8));
    *(void *)(v1 + 8) = 0;
  }
  int v4 = *(void **)(v1 + 16);
  if (v4)
  {
    free(v4);
    *(void *)(v1 + 16) = 0;
  }
  *(_DWORD *)v1 &= 0xFFFFFFF9;
  uint64_t v5 = *(void **)(v1 + 24);
  if (v5)
  {
    free(v5);
    *(void *)(v1 + 24) = 0;
  }
  uint64_t v6 = *(void **)(v1 + 32);
  if (v6)
  {
    free(v6);
    *(void *)(v1 + 32) = 0;
  }
  size_t v7 = *(void **)(v1 + 40);
  if (v7)
  {
    free(v7);
    *(void *)(v1 + 40) = 0;
  }
  uint64_t v8 = *(void **)(v1 + 48);
  if (v8)
  {
    free(v8);
    *(void *)(v1 + 48) = 0;
  }
  size_t v9 = *(void **)(v1 + 56);
  if (v9)
  {
    free(v9);
    *(void *)(v1 + 56) = 0;
  }
  size_t v10 = *(void **)(v1 + 64);
  if (v10)
  {
    free(v10);
    *(void *)(v1 + 64) = 0;
  }
  uint64_t v11 = *(void **)(v1 + 72);
  if (v11)
  {
    free(v11);
    *(void *)(v1 + 72) = 0;
  }
  int v12 = *(void **)(v1 + 80);
  if (v12)
  {
    free(v12);
    *(void *)(v1 + 80) = 0;
  }
  uint64_t v13 = *(void **)(v1 + 88);
  if (v13)
  {
    free(v13);
    *(void *)(v1 + 88) = 0;
  }
  int8x16_t v14 = *(void **)(v1 + 96);
  if (v14)
  {
    free(v14);
    *(void *)(v1 + 96) = 0;
  }
  uint64_t v15 = *(void **)(v1 + 104);
  if (v15)
  {
    free(v15);
    *(void *)(v1 + 104) = 0;
  }
  long long v16 = *(void **)(v1 + 112);
  if (v16)
  {
    free(v16);
    *(void *)(v1 + 112) = 0;
  }
  size_t v17 = *(void **)(v1 + 120);
  if (v17)
  {
    free(v17);
    *(void *)(v1 + 120) = 0;
  }
  long long v18 = *(void **)(v1 + 128);
  if (v18)
  {
    free(v18);
    *(void *)(v1 + 128) = 0;
  }
  long long v19 = *(void **)(v1 + 136);
  if (v19)
  {
    free(v19);
    *(void *)(v1 + 136) = 0;
  }
  uint64_t v20 = *(void **)(v1 + 144);
  if (v20)
  {
    free(v20);
    *(void *)(v1 + 144) = 0;
  }
  uint64_t v21 = *(void **)(v1 + 152);
  if (v21)
  {
    free(v21);
    *(void *)(v1 + 152) = 0;
  }
  long long v22 = *(void **)(v1 + 160);
  if (v22)
  {
    free(v22);
    *(void *)(v1 + 160) = 0;
  }
}

uint64_t heim_digest_parse_response(uint64_t a1, const char *a2)
{
  uint64_t v2 = a2;
  v30 = 0;
  if (!strncasecmp("Digest ", a2, 7uLL))
  {
    v2 += 6;
    do
      int v4 = *(unsigned __int8 *)++v2;
    while (v4 == 32);
    *(_DWORD *)a1 |= 8u;
  }
  uint64_t v5 = parse_values(v2, (void ***)&v30);
  if (v5) {
    goto LABEL_24;
  }
  int v6 = *(_DWORD *)(a1 + 4);
  if (!v6) {
    goto LABEL_23;
  }
  if (v6 == 8)
  {
    size_t v7 = "digest-uri";
LABEL_12:
    uint64_t v9 = values_find(&v30, v7);
    *(void *)(a1 + 88) = v9;
    if (!v9) {
      goto LABEL_23;
    }
    goto LABEL_13;
  }
  size_t v7 = "uri";
  if (v6 != 12) {
    goto LABEL_12;
  }
  uint64_t v8 = values_find(&v30, "uri");
  *(void *)(a1 + 88) = v8;
  if (v8)
  {
    *(_DWORD *)(a1 + 4) = 4;
    goto LABEL_13;
  }
  uint64_t v17 = values_find(&v30, "digest-uri");
  *(void *)(a1 + 88) = v17;
  *(_DWORD *)(a1 + 4) = 8;
  if (!v17)
  {
LABEL_23:
    uint64_t v5 = 1;
    goto LABEL_24;
  }
LABEL_13:
  uint64_t v10 = values_find(&v30, "username");
  *(void *)(a1 + 72) = v10;
  if (!v10) {
    goto LABEL_23;
  }
  uint64_t v11 = (const char *)values_find(&v30, "realm");
  *(void *)(a1 + 96) = v11;
  if (v11)
  {
    int v12 = *(const char **)(a1 + 32);
    if (v12)
    {
      if (strcmp(v11, v12)) {
        goto LABEL_23;
      }
    }
  }
  uint64_t v13 = values_find(&v30, "response");
  *(void *)(a1 + 80) = v13;
  if (!v13) {
    goto LABEL_23;
  }
  int8x16_t v14 = (const char *)values_find(&v30, "nonce");
  if (!v14) {
    goto LABEL_23;
  }
  uint64_t v15 = (char *)v14;
  int v16 = strcmp(v14, *(const char **)(a1 + 24));
  free(v15);
  if (v16) {
    goto LABEL_23;
  }
  if (*(_DWORD *)(a1 + 4) != 1)
  {
    long long v19 = (const char *)values_find(&v30, "qop");
    *(void *)(a1 + 112) = v19;
    if (!v19) {
      goto LABEL_23;
    }
    uint64_t v20 = *(char **)(a1 + 40);
    if (v20)
    {
      uint64_t v21 = v19;
      size_t v22 = strlen(v19);
      do
      {
        long long v23 = strchr(v20, 44);
        if (v23)
        {
          long long v24 = v23;
          size_t v25 = v23 - v20;
          uint64_t v26 = v24 + 1;
        }
        else
        {
          size_t v25 = strlen(v20);
          uint64_t v26 = 0;
        }
        BOOL v27 = v22 == v25 && strncmp(v20, v21, v22) == 0;
        if (!v26) {
          break;
        }
        uint64_t v20 = v26;
      }
      while (!v27);
      if (!v27) {
        goto LABEL_23;
      }
    }
    uint64_t v28 = values_find(&v30, "nc");
    *(void *)(a1 + 120) = v28;
    if (!v28) {
      goto LABEL_23;
    }
    uint64_t v29 = values_find(&v30, "cnonce");
    *(void *)(a1 + 104) = v29;
    if (!v29) {
      goto LABEL_23;
    }
  }
  set_auth_method((char *)a1);
  uint64_t v5 = 0;
LABEL_24:
  free_values((void **)v30);
  return v5;
}

char *set_auth_method(char *result)
{
  if (!*((void *)result + 6))
  {
    uint64_t v1 = result;
    if (*((_DWORD *)result + 1) == 8) {
      uint64_t v2 = "AUTHENTICATE";
    }
    else {
      uint64_t v2 = "GET";
    }
    uint64_t result = strdup(v2);
    *((void *)v1 + 6) = result;
  }
  return result;
}

unsigned __int8 *heim_digest_userhash(const char *a1, const char *a2, const char *a3)
{
  memset(&v10, 0, sizeof(v10));
  CC_MD5_Init(&v10);
  CC_LONG v6 = strlen(a1);
  CC_MD5_Update(&v10, a1, v6);
  CC_MD5_Update(&v10, ":", 1u);
  CC_LONG v7 = strlen(a2);
  CC_MD5_Update(&v10, a2, v7);
  CC_MD5_Update(&v10, ":", 1u);
  CC_LONG v8 = strlen(a3);
  CC_MD5_Update(&v10, a3, v8);
  return MD5_Final_hex(&v10);
}

unsigned __int8 *MD5_Final_hex(CC_MD5_CTX *c)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  size_t v3 = 0;
  CC_MD5_Final(md, c);
  rk_hex_encode((char *)md, 16, &v3);
  *(void *)md = 0;
  uint64_t v5 = 0;
  *(_OWORD *)&c->A = 0u;
  *(_OWORD *)&c->Nl = 0u;
  *(_OWORD *)&c->data[2] = 0u;
  *(_OWORD *)&c->data[6] = 0u;
  *(_OWORD *)&c->data[10] = 0u;
  *(_OWORD *)&c->data[13] = 0u;
  uint64_t result = v3;
  if (v3)
  {
    rk_strlwr(v3);
    return v3;
  }
  return result;
}

char *heim_digest_create_response(uint64_t a1, void *a2)
{
  long long v23 = 0;
  long long v24 = 0;
  size_t v22 = 0;
  uint64_t v21 = 0;
  if (a2) {
    *a2 = 0;
  }
  if (!*(void *)(a1 + 72) || !*(void *)(a1 + 88)) {
    return 0;
  }
  if (!*(void *)(a1 + 96))
  {
    uint64_t result = *(char **)(a1 + 32);
    if (!result) {
      return result;
    }
    uint64_t result = strdup(result);
    *(void *)(a1 + 96) = result;
    if (!result) {
      return result;
    }
  }
  if (*(_DWORD *)(a1 + 4) != 1)
  {
    if (!*(void *)(a1 + 120))
    {
      uint64_t result = strdup("00000001");
      *(void *)(a1 + 120) = result;
      if (!result) {
        return result;
      }
    }
    if (!*(void *)(a1 + 104))
    {
      uint64_t result = (char *)generate_nonce();
      *(void *)(a1 + 104) = result;
      if (!result) {
        return result;
      }
    }
    if (!*(void *)(a1 + 112))
    {
      long long v18 = *(const char **)(a1 + 40);
      if (!v18) {
        return 0;
      }
      long long v19 = strchr(*(char **)(a1 + 40), 44);
      if (v19)
      {
        size_t v20 = v19 - v18 + 1;
        uint64_t result = (char *)malloc_type_malloc(v20, 0x7A4EBC0DuLL);
        *(void *)(a1 + 112) = result;
        if (!result) {
          return result;
        }
        strlcpy(result, *(const char **)(a1 + 40), v20);
      }
      else
      {
        uint64_t result = strdup(v18);
        *(void *)(a1 + 112) = result;
        if (!result) {
          return result;
        }
      }
    }
  }
  set_auth_method((char *)a1);
  uint64_t result = (char *)build_A1_hash(a1, 0);
  if (!result) {
    return result;
  }
  uint64_t v5 = result;
  uint64_t v6 = build_digest(a1, result, *(const char **)(a1 + 48));
  if (!v6)
  {
    size_t v17 = strlen(v5);
    bzero(v5, v17);
    free(v5);
    return 0;
  }
  CC_LONG v7 = v6;
  CC_LONG v8 = *(void **)(a1 + 80);
  if (v8)
  {
    size_t v9 = strlen(*(const char **)(a1 + 80));
    bzero(v8, v9);
    free(*(void **)(a1 + 80));
  }
  *(void *)(a1 + 80) = v7;
  CC_MD5_CTX v10 = *(const char **)(a1 + 88);
  if (v10)
  {
    if (*(_DWORD *)(a1 + 4) == 8) {
      uint64_t v11 = "digest-uri";
    }
    else {
      uint64_t v11 = "uri";
    }
    asprintf(&v22, ",%s=\"%s\"", v11, v10);
  }
  if (*(void *)(a1 + 64)) {
    asprintf(&v23, ",opaque=\"%s\"", *(const char **)(a1 + 64));
  }
  if (*(void *)(a1 + 104)) {
    asprintf(&v24, ",cnonce=\"%s\"", *(const char **)(a1 + 104));
  }
  int v12 = *(char **)(a1 + 120);
  if (v12)
  {
    asprintf(&v21, ",nc=%s", *(const char **)(a1 + 120));
    int v12 = v21;
  }
  uint64_t v13 = v22;
  int8x16_t v14 = "";
  if (!v22) {
    uint64_t v13 = "";
  }
  uint64_t v15 = v24;
  if (!v24) {
    uint64_t v15 = "";
  }
  if (!v12) {
    int v12 = "";
  }
  if (v23) {
    int8x16_t v14 = v23;
  }
  asprintf((char **)(a1 + 152), "username=%s,realm=%s,nonce=\"%s\",qop=\"%s\"%s%s%s,response=\"%s\"%s", *(const char **)(a1 + 72), *(const char **)(a1 + 96), *(const char **)(a1 + 24), *(const char **)(a1 + 112), v13, v15, v12, *(const char **)(a1 + 80), v14);
  build_server_response(a1, v5, a2);
  size_t v16 = strlen(v5);
  bzero(v5, v16);
  free(v5);
  if (v22)
  {
    free(v22);
    size_t v22 = 0;
  }
  if (v23)
  {
    free(v23);
    long long v23 = 0;
  }
  if (v24)
  {
    free(v24);
    long long v24 = 0;
  }
  if (v21) {
    free(v21);
  }
  return *(char **)(a1 + 152);
}

unsigned __int8 *build_A1_hash(uint64_t a1, int a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if ((*(unsigned char *)a1 & 6) != 0)
  {
    int v4 = strdup(*(const char **)(a1 + 16));
  }
  else
  {
    CC_MD5_CTX v10 = *(const char **)(a1 + 8);
    if (!v10) {
      return 0;
    }
    uint64_t v11 = *(const char **)(a1 + 72);
    if (!v11) {
      return 0;
    }
    int v12 = *(const char **)(a1 + 32);
    if (!v12) {
      return 0;
    }
    int v4 = (char *)heim_digest_userhash(v11, v12, v10);
  }
  uint64_t v5 = v4;
  if (!v4) {
    return (unsigned __int8 *)v5;
  }
  int v6 = *(_DWORD *)(a1 + 4);
  BOOL v7 = v6 == 8 || v6 == 4;
  if (!v7 || (*(unsigned char *)a1 & 4) != 0) {
    return (unsigned __int8 *)v5;
  }
  if (!*(void *)(a1 + 24))
  {
LABEL_26:
    size_t v18 = strlen(v5);
    bzero(v5, v18);
    free(v5);
    return 0;
  }
  memset(&v20, 0, sizeof(v20));
  CC_MD5_Init(&v20);
  if (a2 || *(_DWORD *)(a1 + 4) == 8)
  {
    if (rk_hex_decode(v5, data, 0x10uLL) == 16)
    {
      size_t v9 = data;
      CC_LONG v8 = 16;
      goto LABEL_20;
    }
    goto LABEL_26;
  }
  CC_LONG v8 = strlen(v5);
  size_t v9 = v5;
LABEL_20:
  CC_MD5_Update(&v20, v9, v8);
  size_t v13 = strlen(v5);
  bzero(v5, v13);
  free(v5);
  CC_MD5_Update(&v20, ":", 1u);
  CC_LONG v14 = strlen(*(const char **)(a1 + 24));
  CC_MD5_Update(&v20, *(const void **)(a1 + 24), v14);
  if (*(void *)(a1 + 104))
  {
    CC_MD5_Update(&v20, ":", 1u);
    CC_LONG v15 = strlen(*(const char **)(a1 + 104));
    CC_MD5_Update(&v20, *(const void **)(a1 + 104), v15);
  }
  if (*(_DWORD *)(a1 + 4) == 8 && *(void *)(a1 + 136))
  {
    CC_MD5_Update(&v20, ":", 1u);
    size_t v16 = *(const char **)(a1 + 136);
    CC_LONG v17 = strlen(v16);
    CC_MD5_Update(&v20, v16, v17);
  }
  return MD5_Final_hex(&v20);
}

unsigned __int8 *build_digest(uint64_t a1, const char *a2, const char *a3)
{
  memset(&v20, 0, sizeof(v20));
  memset(&c, 0, sizeof(c));
  CC_MD5_Init(&c);
  if (a3)
  {
    CC_LONG v6 = strlen(a3);
    CC_MD5_Update(&c, a3, v6);
  }
  CC_MD5_Update(&c, ":", 1u);
  CC_LONG v7 = strlen(*(const char **)(a1 + 88));
  CC_MD5_Update(&c, *(const void **)(a1 + 88), v7);
  CC_LONG v8 = *(const char **)(a1 + 112);
  if (*(_DWORD *)(a1 + 4) == 8)
  {
    if (!strcasecmp(*(const char **)(a1 + 112), "auth-int") || !strcasecmp(v8, "auth-conf")) {
      CC_MD5_Update(&c, build_A2_hash_conf_zeros, 0x21u);
    }
  }
  else if (v8 && strcasecmp(*(const char **)(a1 + 112), "auth"))
  {
    return 0;
  }
  size_t v9 = MD5_Final_hex(&c);
  if (!v9) {
    return 0;
  }
  CC_MD5_CTX v10 = (char *)v9;
  CC_MD5_Init(&v20);
  CC_LONG v11 = strlen(a2);
  CC_MD5_Update(&v20, a2, v11);
  CC_MD5_Update(&v20, ":", 1u);
  CC_LONG v12 = strlen(*(const char **)(a1 + 24));
  CC_MD5_Update(&v20, *(const void **)(a1 + 24), v12);
  if (*(_DWORD *)(a1 + 4) != 1)
  {
    CC_MD5_Update(&v20, ":", 1u);
    CC_LONG v13 = strlen(*(const char **)(a1 + 120));
    CC_MD5_Update(&v20, *(const void **)(a1 + 120), v13);
    CC_MD5_Update(&v20, ":", 1u);
    CC_LONG v14 = strlen(*(const char **)(a1 + 104));
    CC_MD5_Update(&v20, *(const void **)(a1 + 104), v14);
    CC_MD5_Update(&v20, ":", 1u);
    CC_LONG v15 = *(const char **)(a1 + 112);
    CC_LONG v16 = strlen(v15);
    CC_MD5_Update(&v20, v15, v16);
  }
  CC_MD5_Update(&v20, ":", 1u);
  CC_LONG v17 = strlen(v10);
  CC_MD5_Update(&v20, v10, v17);
  size_t v18 = MD5_Final_hex(&v20);
  free(v10);
  return v18;
}

void build_server_response(uint64_t a1, const char *a2, void *a3)
{
  uint64_t v5 = build_digest(a1, a2, 0);
  if (v5)
  {
    CC_LONG v6 = (char *)v5;
    CC_LONG v8 = (void *)(a1 + 160);
    CC_LONG v7 = *(void **)(a1 + 160);
    if (v7)
    {
      free(v7);
      *CC_LONG v8 = 0;
    }
    if ((*(_DWORD *)a1 & 8) != 0) {
      size_t v9 = "Digest ";
    }
    else {
      size_t v9 = "";
    }
    asprintf((char **)(a1 + 160), "%srspauth=%s", v9, v6);
    free(v6);
    if (a3) {
      *a3 = *v8;
    }
  }
}

uint64_t heim_digest_verify(uint64_t a1, char **a2)
{
  if (a2) {
    *a2 = 0;
  }
  set_auth_method((char *)a1);
  int v4 = build_A1_hash(a1, 0);
  if (!v4) {
    return 12;
  }
  uint64_t v5 = (char *)v4;
  CC_LONG v6 = build_digest(a1, (const char *)v4, *(const char **)(a1 + 48));
  if (!v6)
  {
LABEL_12:
    size_t v16 = strlen(v5);
    bzero(v5, v16);
    free(v5);
    return 12;
  }
  CC_LONG v7 = v6;
  int v8 = strcmp((const char *)v6, *(const char **)(a1 + 80));
  free(v7);
  if (v8)
  {
    size_t v9 = strlen(v5);
    bzero(v5, v9);
    free(v5);
    if (*(_DWORD *)(a1 + 4) != 4) {
      return 22;
    }
    CC_MD5_CTX v10 = build_A1_hash(a1, 1);
    if (!v10) {
      return 12;
    }
    uint64_t v5 = (char *)v10;
    CC_LONG v11 = build_digest(a1, (const char *)v10, *(const char **)(a1 + 48));
    if (v11)
    {
      CC_LONG v12 = v11;
      int v13 = strcmp((const char *)v11, *(const char **)(a1 + 80));
      free(v12);
      if (v13)
      {
        size_t v14 = strlen(v5);
        bzero(v5, v14);
        free(v5);
        return 22;
      }
      goto LABEL_14;
    }
    goto LABEL_12;
  }
LABEL_14:
  build_server_response(a1, v5, a2);
  size_t v17 = strlen(v5);
  bzero(v5, v17);
  free(v5);
  if (!a2) {
    return 0;
  }
  size_t v18 = strdup(*a2);
  uint64_t result = 0;
  *a2 = v18;
  return result;
}

unsigned __int8 *heim_digest_server_response(void *a1)
{
  if (!a1[3] || !a1[11]) {
    return 0;
  }
  uint64_t result = build_A1_hash((uint64_t)a1, 0);
  if (result)
  {
    size_t v3 = (char *)result;
    build_server_response((uint64_t)a1, (const char *)result, 0);
    size_t v4 = strlen(v3);
    bzero(v3, v4);
    free(v3);
    return (unsigned __int8 *)a1[20];
  }
  return result;
}

void heim_digest_release(void *a1)
{
  clear_context();
  free(a1);
}

uint64_t heim_digest_get_key(uint64_t a1, char *a2)
{
  uint64_t v4 = 0;
  while (strcasecmp(a2, (&keys)[v4]))
  {
    v4 += 2;
    if (v4 == 36) {
      return 0;
    }
  }
  return *(void *)&(&keys)[v4 + 1][a1];
}

uint64_t heim_digest_set_key(uint64_t a1, char *__s1, const char *a3)
{
  if (!strcmp(__s1, "password"))
  {
    size_t v14 = *(void **)(a1 + 8);
    if (v14)
    {
      free(v14);
      *(void *)(a1 + 8) = 0;
    }
    CC_LONG v15 = strdup(a3);
    *(void *)(a1 + 8) = v15;
    if (!v15) {
      return 12;
    }
    unsigned int v13 = *(_DWORD *)a1 & 0xFFFFFFFD;
    goto LABEL_20;
  }
  if (!strcmp(__s1, "userhash") || !strcmp(__s1, "H(A1)"))
  {
    int v8 = *(void **)(a1 + 8);
    if (v8)
    {
      free(v8);
      *(void *)(a1 + 8) = 0;
    }
    if (strlen(a3) != 32) {
      return 12;
    }
    size_t v9 = strdup(a3);
    *(void *)(a1 + 16) = v9;
    if (!v9) {
      return 12;
    }
    int v10 = strcmp(__s1, "userhash");
    unsigned int v11 = *(_DWORD *)a1 & 0xFFFFFFF9;
    int v12 = v11 | 4;
    unsigned int v13 = v11 | 2;
    if (v10) {
      unsigned int v13 = v12;
    }
LABEL_20:
    *(_DWORD *)a1 = v13;
    return 0;
  }
  if (strcmp(__s1, "method"))
  {
    uint64_t v6 = 0;
    while (strcasecmp(__s1, (&keys)[v6]))
    {
      v6 += 2;
      if (v6 == 36) {
        return 2;
      }
    }
    size_t v18 = (&keys)[v6 + 1];
    long long v19 = *(void **)&v18[a1];
    if (v19)
    {
      free(v19);
      *(void *)&v18[a1] = 0;
    }
    CC_MD5_CTX v20 = strdup(a3);
    *(void *)&v18[a1] = v20;
    if (!v20) {
      return 12;
    }
    return 0;
  }
  size_t v16 = *(void **)(a1 + 48);
  if (v16)
  {
    free(v16);
    *(void *)(a1 + 48) = 0;
  }
  size_t v17 = strdup(a3);
  *(void *)(a1 + 48) = v17;
  if (v17) {
    return 0;
  }
  return 12;
}

uint64_t _krb5_put_int(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if (a3 - 1 >= 0)
  {
    uint64_t v3 = a3;
    do
    {
      *(unsigned char *)(a1 - 1 + v3) = a2;
      a2 >>= 8;
      --v3;
    }
    while (v3);
  }
  return a3;
}

uint64_t _krb5_get_int(unsigned __int8 *a1, unint64_t *a2, uint64_t a3)
{
  unint64_t v3 = 0;
  if (a3)
  {
    uint64_t v4 = a3;
    do
    {
      unsigned int v5 = *a1++;
      unint64_t v3 = v5 | (v3 << 8);
      --v4;
    }
    while (v4);
  }
  *a2 = v3;
  return a3;
}

void *initialize_error_table_r(void *result, uint64_t a2, int a3, uint64_t a4)
{
  CC_LONG v7 = result;
  while (1)
  {
    int v8 = (void *)*v7;
    if (!*v7) {
      break;
    }
    CC_LONG v7 = (void *)*v7;
    if (*(void *)v8[1] == a2) {
      return result;
    }
  }
  uint64_t result = malloc_type_malloc(0x28uLL, 0x10E00406AA87185uLL);
  if (result)
  {
    result[2] = a2;
    *((_DWORD *)result + 8) = a3;
    result[3] = a4;
    *uint64_t result = 0;
    result[1] = result + 2;
    *CC_LONG v7 = result;
  }
  return result;
}

double hc_EVP_CIPHER_CTX_init(uint64_t a1)
{
  *(void *)(a1 + 160) = 0;
  double result = 0.0;
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
  return result;
}

uint64_t hc_EVP_CIPHER_CTX_cleanup(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if (*a1)
  {
    size_t v3 = *(int *)(v1 + 48);
    uint64_t v4 = (void *)a1[15];
    unsigned int v5 = *(void (**)(uint64_t *))(v1 + 40);
    if (v5) {
      v5(a1);
    }
    if (v4)
    {
      bzero(v4, v3);
      free(v4);
    }
    a1[20] = 0;
    *((_OWORD *)a1 + 8) = 0u;
    *((_OWORD *)a1 + 9) = 0u;
    *((_OWORD *)a1 + 6) = 0u;
    *((_OWORD *)a1 + 7) = 0u;
    *((_OWORD *)a1 + 4) = 0u;
    *((_OWORD *)a1 + 5) = 0u;
    *((_OWORD *)a1 + 2) = 0u;
    *((_OWORD *)a1 + 3) = 0u;
    *(_OWORD *)a1 = 0u;
    *((_OWORD *)a1 + 1) = 0u;
  }
  return 1;
}

uint64_t hc_EVP_CipherInit_ex(uint64_t a1, uint64_t a2, int a3, uint64_t a4, void *__src, uint64_t a6)
{
  uint64_t v8 = a2;
  *(_DWORD *)(a1 + 20) = 0;
  if (a6 == -1)
  {
    uint64_t v10 = *(unsigned int *)(a1 + 16);
  }
  else
  {
    uint64_t v10 = a6;
    *(_DWORD *)(a1 + 16) = a6 != 0;
  }
  uint64_t v11 = *(void *)a1;
  if (a2)
  {
    if (v11 != a2)
    {
      hc_EVP_CIPHER_CTX_cleanup((uint64_t *)a1);
      *(void *)a1 = v8;
      *(_DWORD *)(a1 + 104) = *(_DWORD *)(v8 + 8);
      int v12 = malloc_type_calloc(1uLL, *(int *)(v8 + 48), 0x1B7796uLL);
      *(void *)(a1 + 120) = v12;
      if (!v12 && *(_DWORD *)(v8 + 48)) {
        return 0;
      }
      *(_DWORD *)(a1 + 132) = *(_DWORD *)(v8 + 4) - 1;
      uint64_t v8 = *(void *)a1;
    }
  }
  else
  {
    uint64_t v8 = *(void *)a1;
    if (!v11) {
      return 0;
    }
  }
  int v13 = *(_DWORD *)(v8 + 16) & 7;
  if (v13) {
    BOOL v14 = v13 == 4;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14)
  {
    if (v13 == 2)
    {
      size_t v16 = *(unsigned int *)(v8 + 12);
      if (v16 >= 0x11) {
        hc_EVP_CipherInit_ex_cold_1();
      }
      if (__src)
      {
        memcpy((void *)(a1 + 24), __src, v16);
        size_t v16 = *(unsigned int *)(v8 + 12);
      }
      CC_LONG v15 = (void *)(a1 + 40);
      size_t v17 = (const void *)(a1 + 24);
      goto LABEL_21;
    }
    return 0;
  }
  if (!__src) {
    goto LABEL_22;
  }
  CC_LONG v15 = (void *)(a1 + 40);
  size_t v16 = *(unsigned int *)(v8 + 12);
  size_t v17 = __src;
LABEL_21:
  memcpy(v15, v17, v16);
LABEL_22:
  if (a4 || (*(unsigned char *)(v8 + 16) & 0x20) != 0) {
    (*(void (**)(uint64_t, uint64_t, void *, uint64_t))(v8 + 24))(a1, a4, __src, v10);
  }
  return 1;
}

uint64_t hc_EVP_Cipher(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 32))(a1);
}

void *hc_EVP_rc4()
{
  hc_hcrypto_validate();
  return hc_EVP_cc_rc4();
}

void *hc_EVP_des_cbc()
{
  hc_hcrypto_validate();
  return hc_EVP_cc_des_cbc();
}

BOOL cc_do_cipher(uint64_t a1, void *__dst, void *__src, size_t __n)
{
  uint64_t v6 = *(CCCryptorRef **)(a1 + 120);
  size_t dataOutMoved = 0;
  size_t v7 = __n;
  memcpy(__dst, __src, __n);
  return !CCCryptorUpdate(*v6, __src, v7, __dst, v7, &dataOutMoved) && dataOutMoved == v7;
}

uint64_t cc_cleanup(uint64_t a1)
{
  uint64_t v1 = **(_CCCryptor ***)(a1 + 120);
  if (v1) {
    CCCryptorRelease(v1);
  }
  return 1;
}

void *hc_EVP_cc_des_cbc()
{
  return &hc_EVP_cc_des_cbc_des_ede3_cbc;
}

BOOL cc_des_cbc_init(uint64_t a1, void *key, void *iv, int a4)
{
  return init_cc_key(a4, 1u, 0, key, 8uLL, iv, *(CCCryptorRef **)(a1 + 120));
}

void *hc_EVP_cc_rc4()
{
  return &hc_EVP_cc_rc4_rc4;
}

BOOL cc_rc4_init(uint64_t a1, void *key, void *iv, int a4)
{
  return init_cc_key(a4, 4u, 0, key, *(int *)(a1 + 104), iv, *(CCCryptorRef **)(a1 + 120));
}

BOOL init_cc_key(int a1, CCAlgorithm alg, CCOptions options, void *key, size_t keyLength, void *iv, CCCryptorRef *cryptorRef)
{
  CCOperation v13 = a1 == 0;
  BOOL v14 = *cryptorRef;
  if (*cryptorRef)
  {
    if (!key && iv)
    {
      CCCryptorReset(v14, iv);
      return 1;
    }
    CCCryptorRelease(v14);
  }
  return CCCryptorCreate(v13, alg, options, key, keyLength, iv, cryptorRef) == 0;
}

uint64_t rk_hex_encode(char *a1, uint64_t a2, void *a3)
{
  return encode_hex(a1, a2, (uint64_t)&hexchar_upper, a3);
}

uint64_t encode_hex(char *a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a2 < 0)
  {
    uint64_t v8 = 0;
    goto LABEL_8;
  }
  uint64_t v6 = a2;
  uint64_t v8 = (char *)malloc_type_malloc((2 * a2) | 1, 0x1E2051BBuLL);
  if (!v8)
  {
LABEL_8:
    uint64_t v9 = -1;
    goto LABEL_11;
  }
  if (v6)
  {
    uint64_t v9 = 2 * v6;
    uint64_t v10 = v8 + 1;
    do
    {
      *(v10 - 1) = *(unsigned char *)(a3 + ((unint64_t)*a1 >> 4));
      char v11 = *a1++;
      unsigned char *v10 = *(unsigned char *)(a3 + (v11 & 0xF));
      v10 += 2;
      --v6;
    }
    while (v6);
  }
  else
  {
    uint64_t v9 = 0;
  }
  v8[v9] = 0;
LABEL_11:
  *a4 = v8;
  return v9;
}

uint64_t rk_hex_encode_lower(char *a1, uint64_t a2, void *a3)
{
  return encode_hex(a1, a2, (uint64_t)&hexchar_lower, a3);
}

uint64_t rk_hex_decode(const char *a1, unsigned char *a2, size_t a3)
{
  unsigned int v5 = (unsigned __int8 *)a1;
  size_t v6 = strlen(a1);
  size_t v7 = v6 & 1;
  if (v7 + (v6 >> 1) > a3) {
    return -1;
  }
  unint64_t v9 = v6;
  if (v6)
  {
    unsigned __int8 v10 = *v5++;
    *a2++ = pos(v10);
  }
  if (v9 >= 2)
  {
    if (v9 >> 1 <= 1) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = v9 >> 1;
    }
    int v12 = v5 + 1;
    uint64_t v13 = v11;
    do
    {
      char v14 = pos(*(v12 - 1));
      *a2++ = pos(*v12) | (16 * v14);
      v12 += 2;
      --v13;
    }
    while (v13);
  }
  else
  {
    uint64_t v11 = 0;
  }
  return v11 + v7;
}

uint64_t pos(unsigned __int8 a1)
{
  char v1 = __toupper(a1);
  uint64_t result = 0;
  LOBYTE(v3) = 48;
  while (v1 != (char)v3)
  {
    int v3 = hexchar_upper[++result];
    if (!v3) {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t unparse_something(uint64_t a1, uint64_t a2, char *__str, size_t __size, uint64_t (*a5)(char *, size_t, uint64_t, void, uint64_t), uint64_t (*a6)(uint64_t), const char *a7)
{
  size_t v7 = __size;
  uint64_t v8 = __str;
  if (!a1) {
    return snprintf(__str, __size, "%s", a7);
  }
  uint64_t v9 = a1;
  if ((int)a1 < 1) {
    return 0;
  }
  uint64_t v13 = 0;
  while (*(void *)a2)
  {
    unsigned int v14 = *(_DWORD *)(a2 + 8);
    if (v14 <= v9)
    {
      uint64_t v15 = v9 / v14;
      uint64_t v9 = a6(v9);
      uint64_t v16 = a5(v8, v7, v15, *(void *)a2, v9);
      if ((v16 & 0x80000000) != 0) {
        return v16;
      }
      BOOL v17 = (int)v16 <= (int)v7;
      if ((int)v16 <= (int)v7) {
        v7 -= v16;
      }
      else {
        size_t v7 = 0;
      }
      if (v17) {
        v8 += v16;
      }
      else {
        uint64_t v8 = 0;
      }
      uint64_t v13 = (v16 + v13);
    }
    a2 += 16;
    if ((int)v9 <= 0) {
      return v13;
    }
  }
  return v13;
}

uint64_t unparse_flags(uint64_t a1, uint64_t a2, char *a3, size_t a4)
{
  return unparse_something(a1, a2, a3, a4, (uint64_t (*)(char *, size_t, uint64_t, void, uint64_t))print_flag, (uint64_t (*)(uint64_t))update_flag, "");
}

uint64_t print_flag(char *a1, size_t a2, uint64_t a3, const char *a4, int a5)
{
  unsigned int v5 = "";
  if (a5 > 0) {
    unsigned int v5 = ", ";
  }
  return snprintf(a1, a2, "%s%s", a4, v5);
}

uint64_t update_flag(int a1, int a2)
{
  return (a1 - a2);
}

unsigned __int8 *rk_strlwr(unsigned __int8 *a1)
{
  __darwin_ct_rune_t v2 = *a1;
  if (v2)
  {
    int v3 = a1 + 1;
    do
    {
      *(v3 - 1) = __tolower(v2);
      __darwin_ct_rune_t v4 = *v3++;
      __darwin_ct_rune_t v2 = v4;
    }
    while (v4);
  }
  return a1;
}

uint64_t rk_bswap32(unsigned int a1)
{
  return bswap32(a1);
}

uint64_t rk_bswap16(unsigned int a1)
{
  return __rev16(a1);
}

BOOL ct_memcmp(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (!a3) {
    return 0;
  }
  int v3 = 0;
  do
  {
    int v5 = *a1++;
    int v4 = v5;
    int v6 = *a2++;
    v3 |= v6 ^ v4;
    --a3;
  }
  while (a3);
  return v3 != 0;
}

uint64_t utf8toutf32(char **a1, int *a2)
{
  __darwin_ct_rune_t v2 = *a1;
  int v3 = **a1;
  if ((**a1 & 0x80000000) == 0) {
    goto LABEL_2;
  }
  uint64_t v4 = 3325697542;
  if ((v3 & 0xE0) == 0xC0)
  {
    char v7 = *++v2;
    char v6 = v7;
    if ((v7 & 0xC0) != 0x80) {
      return v4;
    }
    int v3 = v6 & 0x3F | ((v3 & 0x1F) << 6);
    goto LABEL_2;
  }
  if ((v3 & 0xF0) == 0xE0)
  {
    char v8 = v2[1];
    if ((v8 & 0xC0) == 0x80)
    {
      char v10 = v2[2];
      v2 += 2;
      char v9 = v10;
      if ((v10 & 0xC0) == 0x80)
      {
        int v3 = ((v3 & 0xF) << 12) | ((v8 & 0x3F) << 6) | v9 & 0x3F;
LABEL_2:
        uint64_t v4 = 0;
        *a2 = v3;
        *a1 = v2;
      }
    }
  }
  else if ((v3 & 0xF8) == 0xF0)
  {
    char v11 = v2[1];
    if ((v11 & 0xC0) == 0x80)
    {
      char v12 = v2[2];
      if ((v12 & 0xC0) == 0x80)
      {
        char v14 = v2[3];
        v2 += 3;
        char v13 = v14;
        if ((v14 & 0xC0) == 0x80)
        {
          int v3 = ((v3 & 7) << 18) | ((v11 & 0x3F) << 12) | ((v12 & 0x3F) << 6) | v13 & 0x3F;
          goto LABEL_2;
        }
      }
    }
  }
  return v4;
}

uint64_t wind_ucs2read(unsigned __int16 *a1, uint64_t a2, unsigned int *a3, _WORD *a4, uint64_t *a5)
{
  if (!a2)
  {
    uint64_t v15 = 0;
LABEL_30:
    uint64_t result = 0;
    *a5 = v15;
    return result;
  }
  uint64_t result = 3325697538;
  if (a2) {
    return 3325697540;
  }
  unsigned int v7 = *a3;
  int v8 = *a3 & 1;
  uint64_t v9 = *a5;
  uint64_t v10 = *a5;
  if ((*a3 & 4) == 0) {
    goto LABEL_21;
  }
  unsigned int v11 = __rev16(*a1);
  if (v11 == 65279 || v11 == 65534)
  {
    int v8 = v11 == 65534;
    unsigned int v13 = v7 & 0xFFFFFFF8;
    if (v11 == 65534) {
      int v14 = 1;
    }
    else {
      int v14 = 2;
    }
    *a3 = v14 | v13;
    a2 -= 2;
    if (a2)
    {
      ++a1;
      goto LABEL_21;
    }
LABEL_29:
    uint64_t v15 = v9 - v10;
    goto LABEL_30;
  }
  if ((v7 & 3) == 0) {
    return 3325697545;
  }
  unsigned int v16 = v7 & 0xFFFFFFF8;
  if (v8) {
    int v17 = 1;
  }
  else {
    int v17 = 2;
  }
  *a3 = v17 | v16;
LABEL_21:
  while (v10)
  {
    if (v8) {
      size_t v18 = (unsigned __int8 *)a1;
    }
    else {
      size_t v18 = (unsigned __int8 *)a1 + 1;
    }
    if (v8) {
      long long v19 = (unsigned __int8 *)a1 + 1;
    }
    else {
      long long v19 = (unsigned __int8 *)a1;
    }
    *a4++ = *v18 | (*v19 << 8);
    ++a1;
    --v10;
    a2 -= 2;
    if (!a2) {
      goto LABEL_29;
    }
  }
  return result;
}

uint64_t wind_utf8ucs2(char *a1, uint64_t a2, unint64_t *a3)
{
  unsigned int v11 = a1;
  if (*a1)
  {
    unint64_t v5 = 0;
    uint64_t v6 = 3325697538;
    while (1)
    {
      unsigned int v10 = 0;
      uint64_t v7 = utf8toutf32(&v11, (int *)&v10);
      if (v7) {
        return v7;
      }
      if (HIWORD(v10)) {
        return 3325697546;
      }
      if (a2)
      {
        if (v5 >= *a3) {
          return v6;
        }
        *(_WORD *)(a2 + 2 * v5) = v10;
      }
      ++v5;
      if (!*++v11) {
        goto LABEL_11;
      }
    }
  }
  else
  {
    unint64_t v5 = 0;
LABEL_11:
    uint64_t v6 = 0;
    *a3 = v5;
  }
  return v6;
}

uint64_t wind_utf8ucs2_length(char *a1, unint64_t *a2)
{
  return wind_utf8ucs2(a1, 0, a2);
}

uint64_t wind_ucs2utf8(unsigned __int16 *a1, uint64_t a2, unsigned char *a3, unint64_t *a4)
{
  for (unint64_t i = 0; a2; --a2)
  {
    unsigned int v6 = *a1++;
    unsigned int v5 = v6;
    if (v6 < 0x800) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = 3;
    }
    if (v5 < 0x80) {
      uint64_t v7 = 1;
    }
    i += v7;
    if (a3)
    {
      if (i >= *a4) {
        return 3325697538;
      }
      if (v7 != 1)
      {
        if (v7 != 2)
        {
          char v8 = v5 & 0x3F | 0x80;
          LOBYTE(v5) = 0;
          a3[2] = v8;
        }
        a3[1] = v5 & 0x3F | 0x80;
        LOBYTE(v5) = (_BYTE)v5 << 6;
      }
      *a3 = first_char[v7 - 1] | v5;
      a3 += v7;
    }
  }
  if (!a3) {
    goto LABEL_18;
  }
  if (i < *a4)
  {
    *a3 = 0;
LABEL_18:
    uint64_t result = 0;
    *a4 = i;
    return result;
  }
  return 3325697538;
}

uint64_t wind_ucs2utf8_length(unsigned __int16 *a1, uint64_t a2, unint64_t *a3)
{
  return wind_ucs2utf8(a1, a2, 0, a3);
}

void hc_EVP_CipherInit_ex_cold_1()
{
  __assert_rtn("hc_EVP_CipherInit_ex", "evp.c", 791, "EVP_CIPHER_CTX_iv_length(ctx) <= sizeof(ctx->iv)");
}

CCCryptorStatus CCCryptorCreate(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, CCCryptorRef *cryptorRef)
{
  return MEMORY[0x270ED78C8](*(void *)&op, *(void *)&alg, *(void *)&options, key, keyLength, iv, cryptorRef);
}

CCCryptorStatus CCCryptorRelease(CCCryptorRef cryptorRef)
{
  return MEMORY[0x270ED7940](cryptorRef);
}

CCCryptorStatus CCCryptorReset(CCCryptorRef cryptorRef, const void *iv)
{
  return MEMORY[0x270ED7948](cryptorRef, iv);
}

CCCryptorStatus CCCryptorUpdate(CCCryptorRef cryptorRef, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x270ED7950](cryptorRef, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

uint64_t CCDigestCreate()
{
  return MEMORY[0x270ED7978]();
}

uint64_t CCDigestDestroy()
{
  return MEMORY[0x270ED7980]();
}

uint64_t CCDigestFinal()
{
  return MEMORY[0x270ED7988]();
}

uint64_t CCDigestUpdate()
{
  return MEMORY[0x270ED79B0]();
}

void CCHmac(CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
}

void CCHmacFinal(CCHmacContext *ctx, void *macOut)
{
}

void CCHmacInit(CCHmacContext *ctx, CCHmacAlgorithm algorithm, const void *key, size_t keyLength)
{
}

void CCHmacUpdate(CCHmacContext *ctx, const void *data, size_t dataLength)
{
}

uint64_t CCRandomCopyBytes()
{
  return MEMORY[0x270ED7A78]();
}

unsigned __int8 *__cdecl CC_MD4(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7AB0](data, *(void *)&len, md);
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7AD0](data, *(void *)&len, md);
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x270ED7AD8](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x270ED7AE0](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7AE8](c, data, *(void *)&len);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x270ED7F00](*(void *)&a1);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x270ED7F08](*(void *)&a1);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x270ED8688](a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x270EDB590](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB5A8](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strcspn(const char *__s, const char *__charset)
{
  return MEMORY[0x270EDB5C8](__s, __charset);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB600](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x270EDB620](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x270EDB648](__dst, __src, __n);
}

size_t strspn(const char *__s, const char *__charset)
{
  return MEMORY[0x270EDB698](__s, __charset);
}