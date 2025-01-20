uint64_t call_zopen64(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (*(void *)a1) {
    return (*(uint64_t (**)(void, uint64_t, void))a1)(*(void *)(a1 + 56), a2, a3);
  }
  else {
    return (*(uint64_t (**)(void, uint64_t, void))(a1 + 64))(*(void *)(a1 + 56), a2, a3);
  }
}

uint64_t call_zseek64(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (*(void *)(a1 + 32)) {
    return (*(uint64_t (**)(void, uint64_t, uint64_t, void))(a1 + 32))(*(void *)(a1 + 56), a2, a3, a4);
  }
  else {
    return (*(uint64_t (**)(void, uint64_t, uint64_t, void))(a1 + 80))(*(void *)(a1 + 56), a2, a3, a4);
  }
}

uint64_t call_ztell64(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 32)) {
    return (*(uint64_t (**)(void, uint64_t))(a1 + 24))(*(void *)(a1 + 56), a2);
  }
  uint64_t v3 = (*(uint64_t (**)(void, uint64_t))(a1 + 72))(*(void *)(a1 + 56), a2);
  if (v3 == -1) {
    return -1;
  }
  else {
    return v3;
  }
}

void *fill_zlib_filefunc64_32_def_from_filefunc32(void *result, void *a2)
{
  *result = 0;
  result[8] = *a2;
  result[6] = a2[6];
  result[1] = a2[1];
  result[2] = a2[2];
  result[3] = 0;
  result[4] = 0;
  result[5] = a2[5];
  result[6] = a2[6];
  result[7] = a2[7];
  result[10] = a2[4];
  result[9] = a2[3];
  return result;
}

FILE *(**fill_fopen_filefunc(FILE *(**result)(uint64_t a1, const char *a2, char a3)))(uint64_t a1, const char *a2, char a3)
{
  *result = fopen_file_func;
  result[1] = (FILE *(*)(uint64_t, const char *, char))fread_file_func;
  result[2] = (FILE *(*)(uint64_t, const char *, char))fwrite_file_func;
  result[3] = (FILE *(*)(uint64_t, const char *, char))ftell_file_func;
  result[4] = (FILE *(*)(uint64_t, const char *, char))fseek_file_func;
  result[5] = (FILE *(*)(uint64_t, const char *, char))fclose_file_func;
  result[6] = (FILE *(*)(uint64_t, const char *, char))ferror_file_func;
  result[7] = 0;
  return result;
}

FILE *fopen_file_func(uint64_t a1, const char *a2, char a3)
{
  uint64_t v5 = 0;
  __mode = 0;
  if ((a3 & 3) == 1)
  {
    __mode = "rb";
  }
  else if ((a3 & 4) != 0)
  {
    __mode = "r+b";
  }
  else if ((a3 & 8) != 0)
  {
    __mode = "wb";
  }
  if (a2 && __mode) {
    return fopen(a2, __mode);
  }
  return (FILE *)v5;
}

size_t fread_file_func(uint64_t a1, FILE *a2, void *a3, size_t a4)
{
  return fread(a3, 1uLL, a4, a2);
}

size_t fwrite_file_func(uint64_t a1, FILE *a2, const void *a3, size_t a4)
{
  return fwrite(a3, 1uLL, a4, a2);
}

uint64_t ftell_file_func(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x22A6B1870](a2);
}

uint64_t fseek_file_func(uint64_t a1, FILE *a2, uint64_t a3, int a4)
{
  if (a4)
  {
    if (a4 == 1)
    {
      int v6 = 1;
    }
    else
    {
      if (a4 != 2) {
        return -1;
      }
      int v6 = 2;
    }
  }
  else
  {
    int v6 = 0;
  }
  uint64_t v5 = 0;
  if (fseek(a2, a3, v6)) {
    return -1;
  }
  return v5;
}

uint64_t fclose_file_func(uint64_t a1, FILE *a2)
{
  return fclose(a2);
}

uint64_t ferror_file_func(uint64_t a1, FILE *a2)
{
  return ferror(a2);
}

FILE *(**fill_fopen64_filefunc(FILE *(**result)(uint64_t a1, const char *a2, char a3)))(uint64_t a1, const char *a2, char a3)
{
  *result = fopen64_file_func;
  result[1] = (FILE *(*)(uint64_t, const char *, char))fread_file_func;
  result[2] = (FILE *(*)(uint64_t, const char *, char))fwrite_file_func;
  result[3] = (FILE *(*)(uint64_t, const char *, char))ftell64_file_func;
  result[4] = (FILE *(*)(uint64_t, const char *, char))fseek64_file_func;
  result[5] = (FILE *(*)(uint64_t, const char *, char))fclose_file_func;
  result[6] = (FILE *(*)(uint64_t, const char *, char))ferror_file_func;
  result[7] = 0;
  return result;
}

FILE *fopen64_file_func(uint64_t a1, const char *a2, char a3)
{
  uint64_t v5 = 0;
  __mode = 0;
  if ((a3 & 3) == 1)
  {
    __mode = "rb";
  }
  else if ((a3 & 4) != 0)
  {
    __mode = "r+b";
  }
  else if ((a3 & 8) != 0)
  {
    __mode = "wb";
  }
  if (a2 && __mode) {
    return fopen(a2, __mode);
  }
  return (FILE *)v5;
}

uint64_t ftell64_file_func(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x22A6B1870](a2);
}

uint64_t fseek64_file_func(uint64_t a1, FILE *a2, uint64_t a3, int a4)
{
  if (a4)
  {
    if (a4 == 1)
    {
      int v6 = 1;
    }
    else
    {
      if (a4 != 2) {
        return -1;
      }
      int v6 = 2;
    }
  }
  else
  {
    int v6 = 0;
  }
  uint64_t v5 = 0;
  if (fseek(a2, a3, v6)) {
    return -1;
  }
  return v5;
}

void sub_2290D3C00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11, id a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,id location,int a43,int a44,_Unwind_Exception *exc_buf)
{
  exc_buf = a1;
  a44 = a2;
  if (a2 == 1)
  {
    location = objc_begin_catch(exc_buf);
    a12 = (id)[location reason];
    a11 = a12;
    a9 = (uint64_t)a11;
    NSLog(&stru_26DD57FC8.isa);

    objc_storeStrong(&location, 0);
    objc_end_catch();
    JUMPOUT(0x2290D3B70);
  }
  _Unwind_Resume(exc_buf);
}

uint64_t unzStringFileNameCompare(char *a1, char *a2, int a3)
{
  int v4 = a3;
  if (!a3) {
    int v4 = 2;
  }
  if (v4 == 1) {
    return strcmp(a1, a2);
  }
  else {
    return strcmpcasenosensitive_internal(a1, a2);
  }
}

uint64_t strcmpcasenosensitive_internal(char *a1, char *a2)
{
  while (1)
  {
    v2 = a1++;
    char v7 = *v2;
    uint64_t v3 = a2++;
    char v6 = *v3;
    if (v7 >= 97 && v7 <= 122) {
      v7 -= 32;
    }
    if (v6 >= 97 && v6 <= 122) {
      v6 -= 32;
    }
    if (!v7) {
      break;
    }
    if (!v6) {
      return 1;
    }
    if (v7 < v6) {
      return -1;
    }
    if (v7 > v6) {
      return 1;
    }
  }
  if (v6) {
    return -1;
  }
  else {
    return 0;
  }
}

void *unzOpen2(uint64_t a1, void *a2)
{
  uint64_t v5 = a1;
  int v4 = a2;
  if (!a2) {
    return unzOpenInternal(v5, 0, 0);
  }
  memset(__b, 0, sizeof(__b));
  fill_zlib_filefunc64_32_def_from_filefunc32(__b, v4);
  return unzOpenInternal(v5, __b, 0);
}

void *unzOpenInternal(uint64_t a1, const void *a2, int a3)
{
  uint64_t v16 = a1;
  v15 = a2;
  int v14 = a3;
  bzero(__dst, 0x170uLL);
  v12 = 0;
  v11 = 0;
  v10 = 0;
  uint64_t v9 = 0;
  uint64_t v8 = 0;
  char v7 = 0;
  int v6 = 0;
  __dst[10] = 0;
  __dst[9] = 0;
  if (v15) {
    memcpy(__dst, v15, 0x58uLL);
  }
  else {
    fill_fopen64_filefunc(__dst);
  }
  LODWORD(__dst[11]) = v14;
  __dst[12] = (FILE *(*)(uint64_t, const char *, char))call_zopen64((uint64_t)__dst, v16, 5u);
  if (!__dst[12]) {
    return 0;
  }
  v11 = (FILE *(*)(uint64_t, const char *, char))unz64local_SearchCentralDir64((uint64_t)__dst, (uint64_t)__dst[12]);
  if (v11)
  {
    uint64_t v5 = 0;
    uint64_t v4 = 0;
    HIDWORD(__dst[41]) = 1;
    if (call_zseek64((uint64_t)__dst, (uint64_t)__dst[12], (uint64_t)v11, 0)) {
      int v6 = -1;
    }
    if (unz64local_getLong((uint64_t)__dst, (uint64_t)__dst[12], &v10)) {
      int v6 = -1;
    }
    if (unz64local_getLong64((uint64_t)__dst, (uint64_t)__dst[12], &v4)) {
      int v6 = -1;
    }
    if (unz64local_getShort((uint64_t)__dst, (uint64_t)__dst[12], &v5)) {
      int v6 = -1;
    }
    if (unz64local_getShort((uint64_t)__dst, (uint64_t)__dst[12], &v5)) {
      int v6 = -1;
    }
    if (unz64local_getLong((uint64_t)__dst, (uint64_t)__dst[12], &v9)) {
      int v6 = -1;
    }
    if (unz64local_getLong((uint64_t)__dst, (uint64_t)__dst[12], &v8)) {
      int v6 = -1;
    }
    if (unz64local_getLong64((uint64_t)__dst, (uint64_t)__dst[12], &__dst[13])) {
      int v6 = -1;
    }
    if (unz64local_getLong64((uint64_t)__dst, (uint64_t)__dst[12], &v7)) {
      int v6 = -1;
    }
    if (v7 != __dst[13] || v8 || v9) {
      int v6 = -103;
    }
    if (unz64local_getLong64((uint64_t)__dst, (uint64_t)__dst[12], &__dst[20])) {
      int v6 = -1;
    }
    if (unz64local_getLong64((uint64_t)__dst, (uint64_t)__dst[12], &__dst[21])) {
      int v6 = -1;
    }
    __dst[14] = 0;
  }
  else
  {
    v11 = (FILE *(*)(uint64_t, const char *, char))unz64local_SearchCentralDir((uint64_t)__dst, (uint64_t)__dst[12]);
    if (!v11) {
      int v6 = -1;
    }
    HIDWORD(__dst[41]) = 0;
    if (call_zseek64((uint64_t)__dst, (uint64_t)__dst[12], (uint64_t)v11, 0)) {
      int v6 = -1;
    }
    if (unz64local_getLong((uint64_t)__dst, (uint64_t)__dst[12], &v10)) {
      int v6 = -1;
    }
    if (unz64local_getShort((uint64_t)__dst, (uint64_t)__dst[12], &v9)) {
      int v6 = -1;
    }
    if (unz64local_getShort((uint64_t)__dst, (uint64_t)__dst[12], &v8)) {
      int v6 = -1;
    }
    if (unz64local_getShort((uint64_t)__dst, (uint64_t)__dst[12], &v10)) {
      int v6 = -1;
    }
    __dst[13] = v10;
    if (unz64local_getShort((uint64_t)__dst, (uint64_t)__dst[12], &v10)) {
      int v6 = -1;
    }
    char v7 = v10;
    if (v10 != __dst[13] || v8 || v9) {
      int v6 = -103;
    }
    if (unz64local_getLong((uint64_t)__dst, (uint64_t)__dst[12], &v10)) {
      int v6 = -1;
    }
    __dst[20] = v10;
    if (unz64local_getLong((uint64_t)__dst, (uint64_t)__dst[12], &v10)) {
      int v6 = -1;
    }
    __dst[21] = v10;
    if (unz64local_getShort((uint64_t)__dst, (uint64_t)__dst[12], &__dst[14])) {
      int v6 = -1;
    }
  }
  if ((char *)v11 < (char *)((char *)__dst[21] + (unint64_t)__dst[20]) && !v6) {
    int v6 = -103;
  }
  if (v6)
  {
    ((void (*)(FILE *(*)(uint64_t, const char *, char), FILE *(*)(uint64_t, const char *, char)))__dst[5])(__dst[7], __dst[12]);
    return 0;
  }
  else
  {
    __dst[15] = (FILE *(*)(uint64_t, const char *, char))((char *)v11
                                                                  - (char *)((char *)__dst[21]
                                                                           + (unint64_t)__dst[20]));
    __dst[19] = v11;
    __dst[40] = 0;
    LODWORD(__dst[41]) = 0;
    v12 = malloc_type_malloc(0x170uLL, 0x10F0040BFDC9523uLL);
    if (v12)
    {
      memcpy(v12, __dst, 0x170uLL);
      unzGoToFirstFile((uint64_t *)v12);
    }
    return v12;
  }
}

void *unzOpen2_64(uint64_t a1, const void *a2)
{
  uint64_t v5 = a1;
  uint64_t v4 = a2;
  if (!a2) {
    return unzOpenInternal(v5, 0, 1);
  }
  memset(__b, 0, sizeof(__b));
  memcpy(__b, v4, 0x40uLL);
  __b[9] = 0;
  __b[10] = 0;
  return unzOpenInternal(v5, __b, 1);
}

void *unzOpen(uint64_t a1)
{
  return unzOpenInternal(a1, 0, 0);
}

void *unzOpen64(uint64_t a1)
{
  return unzOpenInternal(a1, 0, 1);
}

uint64_t unzClose(uint64_t a1)
{
  if (a1)
  {
    if (*(void *)(a1 + 320)) {
      unzCloseCurrentFile(a1);
    }
    (*(void (**)(void, void))(a1 + 40))(*(void *)(a1 + 56), *(void *)(a1 + 96));
    if (a1) {
      free((void *)a1);
    }
    return 0;
  }
  else
  {
    return -102;
  }
}

uint64_t unzCloseCurrentFile(uint64_t a1)
{
  unsigned int v3 = 0;
  if (a1)
  {
    v2 = *(char **)(a1 + 320);
    if (v2)
    {
      if (!*((void *)v2 + 24) && !*((_DWORD *)v2 + 78) && *((void *)v2 + 21) != *((void *)v2 + 22)) {
        unsigned int v3 = -105;
      }
      if (*(void *)v2) {
        free(*(void **)v2);
      }
      *(void *)v2 = 0;
      if (*((void *)v2 + 16) == 8) {
        inflateEnd((z_streamp)(v2 + 8));
      }
      *((void *)v2 + 16) = 0;
      free(v2);
      *(void *)(a1 + 320) = 0;
      return v3;
    }
    else
    {
      return -102;
    }
  }
  else
  {
    return -102;
  }
}

uint64_t unzGetGlobalInfo64(uint64_t a1, _OWORD *a2)
{
  if (a1)
  {
    *a2 = *(_OWORD *)(a1 + 104);
    return 0;
  }
  else
  {
    return -102;
  }
}

uint64_t unzGetGlobalInfo(uint64_t a1, void *a2)
{
  if (a1)
  {
    *a2 = *(void *)(a1 + 104);
    a2[1] = *(void *)(a1 + 112);
    return 0;
  }
  else
  {
    return -102;
  }
}

uint64_t unzGetCurrentFileInfo64(uint64_t *a1, void *a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, unint64_t a8)
{
  return unz64local_GetCurrentFileInfoInternal(a1, a2, 0, a3, a4, a5, a6, a7, a8);
}

uint64_t unz64local_GetCurrentFileInfoInternal(uint64_t *a1, void *a2, uint64_t *a3, uint64_t a4, unint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8, unint64_t a9)
{
  v32 = a1;
  v31 = a2;
  v30 = a3;
  uint64_t v29 = a4;
  unint64_t v28 = a5;
  uint64_t v27 = a6;
  unint64_t v26 = a7;
  uint64_t v25 = a8;
  unint64_t v24 = a9;
  v23 = 0;
  memset(__b, 0, sizeof(__b));
  uint64_t v21 = 0;
  unsigned int v20 = 0;
  uint64_t v19 = 0;
  uint64_t v18 = 0;
  uint64_t v17 = 0;
  if (v32)
  {
    v23 = v32;
    if (call_zseek64((uint64_t)v32, v32[12], v32[17] + v32[15], 0)) {
      unsigned int v20 = -1;
    }
    if (!v20)
    {
      if (unz64local_getLong((uint64_t)v23, v23[12], &v19))
      {
        unsigned int v20 = -1;
      }
      else if (v19 != 33639248)
      {
        unsigned int v20 = -103;
      }
    }
    if (unz64local_getShort((uint64_t)v23, v23[12], __b)) {
      unsigned int v20 = -1;
    }
    if (unz64local_getShort((uint64_t)v23, v23[12], &__b[1])) {
      unsigned int v20 = -1;
    }
    if (unz64local_getShort((uint64_t)v23, v23[12], &__b[2])) {
      unsigned int v20 = -1;
    }
    if (unz64local_getShort((uint64_t)v23, v23[12], &__b[3])) {
      unsigned int v20 = -1;
    }
    if (unz64local_getLong((uint64_t)v23, v23[12], &__b[4])) {
      unsigned int v20 = -1;
    }
    unz64local_DosDateToTmuDate(__b[4], &__b[14]);
    if (unz64local_getLong((uint64_t)v23, v23[12], &__b[5])) {
      unsigned int v20 = -1;
    }
    if (unz64local_getLong((uint64_t)v23, v23[12], &v17)) {
      unsigned int v20 = -1;
    }
    __b[6] = v17;
    if (unz64local_getLong((uint64_t)v23, v23[12], &v17)) {
      unsigned int v20 = -1;
    }
    __b[7] = v17;
    if (unz64local_getShort((uint64_t)v23, v23[12], &__b[8])) {
      unsigned int v20 = -1;
    }
    if (unz64local_getShort((uint64_t)v23, v23[12], &__b[9])) {
      unsigned int v20 = -1;
    }
    if (unz64local_getShort((uint64_t)v23, v23[12], &__b[10])) {
      unsigned int v20 = -1;
    }
    if (unz64local_getShort((uint64_t)v23, v23[12], &__b[11])) {
      unsigned int v20 = -1;
    }
    if (unz64local_getShort((uint64_t)v23, v23[12], &__b[12])) {
      unsigned int v20 = -1;
    }
    if (unz64local_getLong((uint64_t)v23, v23[12], &__b[13])) {
      unsigned int v20 = -1;
    }
    if (unz64local_getLong((uint64_t)v23, v23[12], &v17)) {
      unsigned int v20 = -1;
    }
    uint64_t v21 = v17;
    v18 += __b[8];
    if (!v20 && v29)
    {
      uint64_t v16 = 0;
      if (__b[8] >= v28)
      {
        uint64_t v16 = v28;
      }
      else
      {
        *(unsigned char *)(v29 + __b[8]) = 0;
        uint64_t v16 = __b[8];
      }
      if (__b[8]
        && v28
        && ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v23[1])(v23[7], v23[12], v29, v16) != v16)
      {
        unsigned int v20 = -1;
      }
      v18 -= v16;
    }
    if (v20 || !v27)
    {
      v18 += __b[9];
    }
    else
    {
      uint64_t v15 = 0;
      if (__b[9] >= v26) {
        uint64_t v15 = v26;
      }
      else {
        uint64_t v15 = __b[9];
      }
      if (v18)
      {
        if (call_zseek64((uint64_t)v23, v23[12], v18, 1u)) {
          unsigned int v20 = -1;
        }
        else {
          uint64_t v18 = 0;
        }
      }
      if (__b[9]
        && v26
        && ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v23[1])(v23[7], v23[12], v27, v15) != v15)
      {
        unsigned int v20 = -1;
      }
      v18 += __b[9] - v15;
    }
    if (!v20 && __b[9])
    {
      unint64_t v14 = 0;
      v18 -= __b[9];
      if (v18)
      {
        if (call_zseek64((uint64_t)v23, v23[12], v18, 1u)) {
          unsigned int v20 = -1;
        }
        else {
          uint64_t v18 = 0;
        }
      }
      while (v14 < __b[9])
      {
        uint64_t v13 = 0;
        uint64_t v12 = 0;
        if (unz64local_getShort((uint64_t)v23, v23[12], &v13)) {
          unsigned int v20 = -1;
        }
        if (unz64local_getShort((uint64_t)v23, v23[12], &v12)) {
          unsigned int v20 = -1;
        }
        if (v13 == 1)
        {
          uint64_t v11 = 0;
          if (__b[7] == -1 && unz64local_getLong64((uint64_t)v23, v23[12], &__b[7])) {
            unsigned int v20 = -1;
          }
          if (__b[6] == -1 && unz64local_getLong64((uint64_t)v23, v23[12], &__b[6])) {
            unsigned int v20 = -1;
          }
          if (v21 == -1 && unz64local_getLong64((uint64_t)v23, v23[12], &v21)) {
            unsigned int v20 = -1;
          }
          if (__b[11] == -1 && unz64local_getLong((uint64_t)v23, v23[12], &v11)) {
            unsigned int v20 = -1;
          }
        }
        else if (call_zseek64((uint64_t)v23, v23[12], v12, 1u))
        {
          unsigned int v20 = -1;
        }
        v14 += v12 + 4;
      }
    }
    if (v20 || !v25)
    {
      v18 += __b[10];
    }
    else
    {
      if (__b[10] >= v24)
      {
        uint64_t v10 = v24;
      }
      else
      {
        *(unsigned char *)(v25 + __b[10]) = 0;
        uint64_t v10 = __b[10];
      }
      if (v18)
      {
        if (call_zseek64((uint64_t)v23, v23[12], v18, 1u)) {
          unsigned int v20 = -1;
        }
        else {
          uint64_t v18 = 0;
        }
      }
      if (__b[10]
        && v24
        && ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v23[1])(v23[7], v23[12], v25, v10) != v10)
      {
        unsigned int v20 = -1;
      }
      v18 += __b[10] - v10;
    }
    if (!v20 && v31) {
      memcpy(v31, __b, 0x88uLL);
    }
    if (!v20 && v30) {
      uint64_t *v30 = v21;
    }
    return v20;
  }
  else
  {
    return -102;
  }
}

uint64_t unzGetCurrentFileInfo(uint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, unint64_t a8)
{
  uint64_t v19 = a1;
  uint64_t v18 = a2;
  uint64_t v17 = a3;
  unint64_t v16 = a4;
  uint64_t v15 = a5;
  unint64_t v14 = a6;
  uint64_t v13 = a7;
  unint64_t v12 = a8;
  unsigned int CurrentFileInfoInternal = 0;
  memset(__b, 0, sizeof(__b));
  unsigned int CurrentFileInfoInternal = unz64local_GetCurrentFileInfoInternal(v19, __b, 0, v17, v16, v15, v14, v13, v12);
  if (!CurrentFileInfoInternal)
  {
    *(void *)uint64_t v18 = *(void *)__b;
    *(void *)(v18 + 8) = *(void *)&__b[8];
    *(void *)(v18 + 16) = *(void *)&__b[16];
    *(void *)(v18 + 24) = *(void *)&__b[24];
    *(void *)(v18 + 32) = *(void *)&__b[32];
    *(void *)(v18 + 40) = *(void *)&__b[40];
    *(void *)(v18 + 64) = *(void *)&__b[64];
    *(void *)(v18 + 72) = *(void *)&__b[72];
    *(void *)(v18 + 80) = *(void *)&__b[80];
    *(void *)(v18 + 88) = *(void *)&__b[88];
    *(void *)(v18 + 96) = *(void *)&__b[96];
    *(void *)(v18 + 104) = *(void *)&__b[104];
    uint64_t v8 = v18;
    *(_OWORD *)(v18 + 112) = *(_OWORD *)&__b[112];
    *(void *)(v8 + 128) = *(void *)&__b[128];
    *(void *)(v18 + 48) = *(void *)&__b[48];
    *(void *)(v18 + 56) = *(void *)&__b[56];
  }
  return CurrentFileInfoInternal;
}

uint64_t unzGoToFirstFile(uint64_t *a1)
{
  if (a1)
  {
    a1[17] = a1[21];
    a1[16] = 0;
    unsigned int CurrentFileInfoInternal = unz64local_GetCurrentFileInfoInternal(a1, a1 + 22, a1 + 39, 0, 0, 0, 0, 0, 0);
    a1[18] = CurrentFileInfoInternal == 0;
    return CurrentFileInfoInternal;
  }
  else
  {
    return -102;
  }
}

uint64_t unzGoToNextFile(uint64_t *a1)
{
  if (a1)
  {
    if (a1[18])
    {
      if (a1[13] == 0xFFFF || a1[16] + 1 != a1[13])
      {
        a1[17] += a1[30] + 46 + a1[31] + a1[32];
        ++a1[16];
        unsigned int CurrentFileInfoInternal = unz64local_GetCurrentFileInfoInternal(a1, a1 + 22, a1 + 39, 0, 0, 0, 0, 0, 0);
        a1[18] = CurrentFileInfoInternal == 0;
        return CurrentFileInfoInternal;
      }
      else
      {
        return -100;
      }
    }
    else
    {
      return -100;
    }
  }
  else
  {
    return -102;
  }
}

uint64_t unzLocateFile(uint64_t *a1, char *a2, int a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  unint64_t v12 = a1;
  __s = a2;
  int v10 = a3;
  uint64_t v9 = 0;
  unsigned int File = 0;
  memset(__b, 0, sizeof(__b));
  if (v12)
  {
    if (strlen(__s) < 0x100)
    {
      uint64_t v9 = v12;
      if (v12[18])
      {
        uint64_t v5 = v9[16];
        uint64_t v4 = v9[17];
        memcpy(__b, v9 + 22, sizeof(__b));
        uint64_t v6 = v9[39];
        unsigned int File = unzGoToFirstFile(v12);
        while (!File)
        {
          unsigned int File = unzGetCurrentFileInfo64(v12, 0, (uint64_t)v14, 0x100uLL, 0, 0, 0, 0);
          if (!File)
          {
            if (!unzStringFileNameCompare(v14, __s, v10)) {
              return 0;
            }
            unsigned int File = unzGoToNextFile(v12);
          }
        }
        v9[16] = v5;
        v9[17] = v4;
        memcpy(v9 + 22, __b, 0x88uLL);
        v9[39] = v6;
        return File;
      }
      else
      {
        return -100;
      }
    }
    else
    {
      return -102;
    }
  }
  else
  {
    return -102;
  }
}

uint64_t unzGetFilePos64(void *a1, void *a2)
{
  if (a1 && a2)
  {
    if (a1[18])
    {
      *a2 = a1[17];
      a2[1] = a1[16];
      return 0;
    }
    else
    {
      return -100;
    }
  }
  else
  {
    return -102;
  }
}

uint64_t unzGetFilePos(void *a1, void *a2)
{
  char v7 = a1;
  uint64_t v6 = a2;
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  unsigned int FilePos64 = unzGetFilePos64(a1, &v4);
  if (!FilePos64)
  {
    *uint64_t v6 = v4;
    v6[1] = v5;
  }
  return FilePos64;
}

uint64_t unzGoToFilePos64(uint64_t *a1, uint64_t *a2)
{
  if (a1 && a2)
  {
    a1[17] = *a2;
    a1[16] = a2[1];
    unsigned int CurrentFileInfoInternal = unz64local_GetCurrentFileInfoInternal(a1, a1 + 22, a1 + 39, 0, 0, 0, 0, 0, 0);
    a1[18] = CurrentFileInfoInternal == 0;
    return CurrentFileInfoInternal;
  }
  else
  {
    return -102;
  }
}

uint64_t unzGoToFilePos(uint64_t *a1, uint64_t *a2)
{
  uint64_t v6 = a1;
  uint64_t v5 = a2;
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  if (a2)
  {
    uint64_t v3 = *v5;
    uint64_t v4 = v5[1];
    return unzGoToFilePos64(v6, &v3);
  }
  else
  {
    return -102;
  }
}

uint64_t unzOpenCurrentFile3(void *a1, _DWORD *a2, _DWORD *a3, int a4, uint64_t a5)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  unint64_t v24 = a1;
  v23 = a2;
  v22 = a3;
  int v21 = a4;
  uint64_t v20 = a5;
  unsigned int v19 = 0;
  unsigned int v18 = 0;
  __src = 0;
  unint64_t v16 = 0;
  uint64_t v15 = 0;
  int v14 = 0;
  if (!a1) {
    return -102;
  }
  __src = v24;
  if (!v24[18]) {
    return -102;
  }
  if (*((void *)__src + 40)) {
    unzCloseCurrentFile((uint64_t)v24);
  }
  if (unz64local_CheckCurrentFileCoherencyHeader((uint64_t *)__src, &v18, &v15, &v14)) {
    return -103;
  }
  unint64_t v16 = malloc_type_malloc(0x140uLL, 0x10B004067B04D0FuLL);
  if (!v16) {
    return -104;
  }
  uint64_t v5 = malloc_type_malloc(0x4000uLL, 0x3EA1875CuLL);
  *(void *)unint64_t v16 = v5;
  *((void *)v16 + 17) = v15;
  *((_DWORD *)v16 + 36) = v14;
  *((void *)v16 + 19) = 0;
  *((_DWORD *)v16 + 78) = v21;
  *((void *)v16 + 38) = 0;
  if (!*(void *)v16)
  {
    if (v16) {
      free(v16);
    }
    return -104;
  }
  *((void *)v16 + 16) = 0;
  if (v23) {
    _DWORD *v23 = *((void *)__src + 25);
  }
  if (v22)
  {
    _DWORD *v22 = 6;
    uint64_t v12 = *((void *)__src + 24) & 6;
    switch(v12)
    {
      case 2:
        _DWORD *v22 = 9;
        break;
      case 4:
        _DWORD *v22 = 2;
        break;
      case 6:
        _DWORD *v22 = 1;
        break;
    }
  }
  if (*((void *)__src + 25) && *((void *)__src + 25) != 12 && *((void *)__src + 25) != 8) {
    unsigned int v19 = -103;
  }
  *((void *)v16 + 22) = *((void *)__src + 27);
  *((void *)v16 + 21) = 0;
  *((void *)v16 + 20) = 0;
  *((void *)v16 + 37) = *((void *)__src + 25);
  *((void *)v16 + 36) = *((void *)__src + 12);
  memcpy((char *)v16 + 200, __src, 0x58uLL);
  *((void *)v16 + 38) = *((void *)__src + 15);
  *((void *)v16 + 6) = 0;
  if (*((void *)__src + 25) == 12 && !v21)
  {
    *((_DWORD *)v16 + 78) = 1;
    goto LABEL_38;
  }
  if (*((void *)__src + 25) != 8 || v21)
  {
LABEL_38:
    *((void *)v16 + 23) = *((void *)__src + 28);
    *((void *)v16 + 24) = *((void *)__src + 29);
    *((void *)v16 + 15) = *((void *)__src + 39) + 30 + v18;
    *((_DWORD *)v16 + 4) = 0;
    *((void *)__src + 40) = v16;
    *((_DWORD *)__src + 82) = 0;
    if (v20)
    {
      *((void *)__src + 45) = get_crc_table();
      init_keys(v20, (void *)__src + 42, *((void *)__src + 45));
      if (call_zseek64((uint64_t)__src, *((void *)__src + 12), *(void *)(*((void *)__src + 40) + 120) + *(void *)(*((void *)__src + 40) + 304), 0))
      {
        return -104;
      }
      if ((unint64_t)(*((uint64_t (**)(void, void, unsigned char *, uint64_t))__src + 1))(*((void *)__src + 7), *((void *)__src + 12), v26, 12) < 0xC)return -104; {
      for (int i = 0; i < 12; ++i)
      }
      {
        uint64_t v11 = (char *)__src + 336;
        uint64_t v10 = *((void *)__src + 45);
        char v6 = decrypt_byte((uint64_t)__src + 336);
        char v7 = &v26[i];
        char v8 = *v7 ^ v6;
        *char v7 = v8;
        update_keys(v11, v10, v8);
      }
      *(void *)(*((void *)__src + 40) + 120) += 12;
      *((_DWORD *)__src + 82) = 1;
    }
    return 0;
  }
  *((void *)v16 + 9) = 0;
  *((void *)v16 + 10) = 0;
  *((void *)v16 + 11) = 0;
  *((void *)v16 + 1) = 0;
  *((_DWORD *)v16 + 4) = 0;
  unsigned int v19 = inflateInit2_((z_streamp)((char *)v16 + 8), -15, "1.2.12", 112);
  if (!v19)
  {
    *((void *)v16 + 16) = 8;
    goto LABEL_38;
  }
  if (v16) {
    free(v16);
  }
  return v19;
}

uint64_t unz64local_CheckCurrentFileCoherencyHeader(uint64_t *a1, _DWORD *a2, void *a3, _DWORD *a4)
{
  int v14 = a1;
  uint64_t v13 = a2;
  uint64_t v12 = a3;
  uint64_t v11 = a4;
  uint64_t v10 = 0;
  uint64_t v9 = 0;
  uint64_t v8 = 0;
  uint64_t v7 = 0;
  uint64_t v6 = 0;
  unsigned int v5 = 0;
  *a2 = 0;
  void *v12 = 0;
  *uint64_t v11 = 0;
  if (call_zseek64((uint64_t)v14, v14[12], v14[39] + v14[15], 0))
  {
    return -1;
  }
  else
  {
    if (unz64local_getLong((uint64_t)v14, v14[12], &v10))
    {
      unsigned int v5 = -1;
    }
    else if (v10 != 67324752)
    {
      unsigned int v5 = -103;
    }
    if (unz64local_getShort((uint64_t)v14, v14[12], &v9)) {
      unsigned int v5 = -1;
    }
    if (unz64local_getShort((uint64_t)v14, v14[12], &v8)) {
      unsigned int v5 = -1;
    }
    if (unz64local_getShort((uint64_t)v14, v14[12], &v9))
    {
      unsigned int v5 = -1;
    }
    else if (!v5 && v9 != v14[25])
    {
      unsigned int v5 = -103;
    }
    if (!v5 && v14[25] && v14[25] != 12 && v14[25] != 8) {
      unsigned int v5 = -103;
    }
    if (unz64local_getLong((uint64_t)v14, v14[12], &v9)) {
      unsigned int v5 = -1;
    }
    if (unz64local_getLong((uint64_t)v14, v14[12], &v9))
    {
      unsigned int v5 = -1;
    }
    else if (!v5 && v9 != v14[27] && (v8 & 8) == 0)
    {
      unsigned int v5 = -103;
    }
    if (unz64local_getLong((uint64_t)v14, v14[12], &v9))
    {
      unsigned int v5 = -1;
    }
    else if (v9 != 0xFFFFFFFFLL && !v5 && v9 != v14[28] && (v8 & 8) == 0)
    {
      unsigned int v5 = -103;
    }
    if (unz64local_getLong((uint64_t)v14, v14[12], &v9))
    {
      unsigned int v5 = -1;
    }
    else if (v9 != 0xFFFFFFFFLL && !v5 && v9 != v14[29] && (v8 & 8) == 0)
    {
      unsigned int v5 = -103;
    }
    if (unz64local_getShort((uint64_t)v14, v14[12], &v7))
    {
      unsigned int v5 = -1;
    }
    else if (!v5 && v7 != v14[30])
    {
      unsigned int v5 = -103;
    }
    *v13 += v7;
    if (unz64local_getShort((uint64_t)v14, v14[12], &v6)) {
      unsigned int v5 = -1;
    }
    void *v12 = v14[39] + 30 + v7;
    *uint64_t v11 = v6;
    *v13 += v6;
    return v5;
  }
}

uint64_t init_keys(uint64_t result, void *a2, uint64_t a3)
{
  unsigned int v5 = (unsigned char *)result;
  *a2 = 305419896;
  a2[1] = 591751049;
  a2[2] = 878082192;
  while (*v5)
    result = update_keys(a2, a3, (char)*v5++);
  return result;
}

uint64_t update_keys(void *a1, uint64_t a2, unsigned int a3)
{
  *a1 = *(void *)(a2 + 8 * (*a1 ^ a3)) ^ (*a1 >> 8);
  a1[1] += *(unsigned __int8 *)a1;
  a1[1] = 134775813 * a1[1] + 1;
  a1[2] = *(void *)(a2 + 8 * (a1[2] ^ BYTE3(a1[1]))) ^ (a1[2] >> 8);
  return a3;
}

uint64_t decrypt_byte(uint64_t a1)
{
  return ((unsigned __int16)((*(void *)(a1 + 16) | 2) * ((*(void *)(a1 + 16) | 2) ^ 1)) >> 8);
}

uint64_t unzOpenCurrentFile(void *a1)
{
  return unzOpenCurrentFile3(a1, 0, 0, 0, 0);
}

uint64_t unzOpenCurrentFilePassword(void *a1, uint64_t a2)
{
  return unzOpenCurrentFile3(a1, 0, 0, 0, a2);
}

uint64_t unzOpenCurrentFile2(void *a1, _DWORD *a2, _DWORD *a3, int a4)
{
  return unzOpenCurrentFile3(a1, a2, a3, a4, 0);
}

uint64_t unzGetCurrentFileZStreamPos64(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = *(void *)(a1 + 320);
  if (v2) {
    return *(void *)(v2 + 120) + *(void *)(v2 + 304);
  }
  else {
    return 0;
  }
}

uint64_t unzReadCurrentFile(uint64_t a1, uint64_t a2, unsigned int a3)
{
  int v19 = 0;
  unsigned int v18 = 0;
  if (a1)
  {
    uint64_t v17 = *(void *)(a1 + 320);
    if (v17)
    {
      if (*(void *)v17)
      {
        if (a3)
        {
          *(void *)(v17 + 32) = a2;
          *(_DWORD *)(v17 + 40) = a3;
          if (a3 > *(void *)(v17 + 184) + (unint64_t)*(unsigned int *)(v17 + 16) && *(_DWORD *)(v17 + 312)) {
            *(_DWORD *)(v17 + 40) = *(void *)(v17 + 184) + *(_DWORD *)(v17 + 16);
          }
          while (1)
          {
            do
            {
              while (1)
              {
                if (!*(_DWORD *)(v17 + 40))
                {
LABEL_53:
                  if (v19) {
                    return v19;
                  }
                  else {
                    return v18;
                  }
                }
                if (!*(_DWORD *)(v17 + 16) && *(void *)(v17 + 184))
                {
                  unsigned int v16 = 0x4000;
                  if (*(void *)(v17 + 184) < 0x4000uLL) {
                    unsigned int v16 = *(void *)(v17 + 184);
                  }
                  if (!v16) {
                    return 0;
                  }
                  if (call_zseek64(v17 + 200, *(void *)(v17 + 288), *(void *)(v17 + 120) + *(void *)(v17 + 304), 0))
                  {
                    return -1;
                  }
                  if ((*(uint64_t (**)(void, void, void, void))(v17 + 208))(*(void *)(v17 + 256), *(void *)(v17 + 288), *(void *)v17, v16) != v16)return -1; {
                  if (*(_DWORD *)(a1 + 328))
                  }
                  {
                    for (unsigned int i = 0; i < v16; ++i)
                    {
                      uint64_t v9 = *(void *)(a1 + 360);
                      char v3 = decrypt_byte(a1 + 336);
                      uint64_t v4 = (unsigned char *)(*(void *)v17 + i);
                      char v5 = *v4 ^ v3;
                      *uint64_t v4 = v5;
                      *(unsigned char *)(*(void *)v17 + i) = update_keys((void *)(a1 + 336), v9, v5);
                    }
                  }
                  *(void *)(v17 + 120) += v16;
                  *(void *)(v17 + 184) -= v16;
                  *(void *)(v17 + 8) = *(void *)v17;
                  *(_DWORD *)(v17 + 16) = v16;
                }
                if (*(void *)(v17 + 296) && !*(_DWORD *)(v17 + 312)) {
                  break;
                }
                if (!*(_DWORD *)(v17 + 16) && !*(void *)(v17 + 184))
                {
                  if (v18) {
                    return v18;
                  }
                  else {
                    return 0;
                  }
                }
                if (*(_DWORD *)(v17 + 40) >= *(_DWORD *)(v17 + 16)) {
                  uInt v14 = *(_DWORD *)(v17 + 16);
                }
                else {
                  uInt v14 = *(_DWORD *)(v17 + 40);
                }
                for (uInt j = 0; j < v14; ++j)
                  *(unsigned char *)(*(void *)(v17 + 32) + j) = *(unsigned char *)(*(void *)(v17 + 8) + j);
                *(void *)(v17 + 160) += v14;
                *(void *)(v17 + 168) = crc32(*(void *)(v17 + 168), *(const Bytef **)(v17 + 32), v14);
                *(void *)(v17 + 192) -= v14;
                *(_DWORD *)(v17 + 16) -= v14;
                *(_DWORD *)(v17 + 40) -= v14;
                *(void *)(v17 + 32) += v14;
                *(void *)(v17 + 8) += v14;
                *(void *)(v17 + 48) += v14;
                v18 += v14;
              }
            }
            while (*(void *)(v17 + 296) == 12);
            uint64_t v12 = *(void *)(v17 + 48);
            buf = *(Bytef **)(v17 + 32);
            int v19 = inflate((z_streamp)(v17 + 8), 2);
            if (v19 >= 0 && *(void *)(v17 + 56)) {
              int v19 = -3;
            }
            uint64_t v11 = *(void *)(v17 + 48);
            *(void *)(v17 + 160) += v11 - v12;
            *(void *)(v17 + 168) = crc32(*(void *)(v17 + 168), buf, (int)v11 - (int)v12);
            *(void *)(v17 + 192) -= v11 - v12;
            v18 += v11 - v12;
            if (v19 == 1) {
              break;
            }
            if (v19) {
              goto LABEL_53;
            }
          }
          if (v18) {
            return v18;
          }
          else {
            return 0;
          }
        }
        else
        {
          return 0;
        }
      }
      else
      {
        return -100;
      }
    }
    else
    {
      return -102;
    }
  }
  else
  {
    return -102;
  }
}

uint64_t unztell(uint64_t a1)
{
  if (!a1) {
    return -102;
  }
  uint64_t v2 = *(void *)(a1 + 320);
  if (v2) {
    return *(void *)(v2 + 48);
  }
  else {
    return -102;
  }
}

uint64_t unztell64(uint64_t a1)
{
  if (!a1) {
    return -1;
  }
  uint64_t v2 = *(void *)(a1 + 320);
  if (v2) {
    return *(void *)(v2 + 160);
  }
  else {
    return -1;
  }
}

uint64_t unzeof(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 320);
    if (v2) {
      return *(void *)(v2 + 192) == 0;
    }
    else {
      return -102;
    }
  }
  else
  {
    return -102;
  }
}

uint64_t unzGetLocalExtrafield(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (a1)
  {
    uint64_t v5 = *(void *)(a1 + 320);
    if (v5)
    {
      if (a2)
      {
        if (a3 <= (unint64_t)*(unsigned int *)(v5 + 144) - *(void *)(v5 + 152)) {
          unsigned int v4 = a3;
        }
        else {
          unsigned int v4 = *(_DWORD *)(v5 + 144) - *(_DWORD *)(v5 + 152);
        }
        if (v4)
        {
          if (call_zseek64(v5 + 200, *(void *)(v5 + 288), *(void *)(v5 + 136) + *(void *)(v5 + 152), 0))
          {
            return -1;
          }
          else if ((*(uint64_t (**)(void, void, uint64_t, void))(v5 + 208))(*(void *)(v5 + 256), *(void *)(v5 + 288), a2, v4) == v4)
          {
            return v4;
          }
          else
          {
            return -1;
          }
        }
        else
        {
          return 0;
        }
      }
      else
      {
        return (*(_DWORD *)(v5 + 144) - *(_DWORD *)(v5 + 152));
      }
    }
    else
    {
      return -102;
    }
  }
  else
  {
    return -102;
  }
}

uint64_t unzGetGlobalComment(uint64_t a1, unsigned char *a2, unint64_t a3)
{
  if (a1)
  {
    unint64_t v4 = a3;
    if (a3 > *(void *)(a1 + 112)) {
      unint64_t v4 = *(void *)(a1 + 112);
    }
    if (call_zseek64(a1, *(void *)(a1 + 96), *(void *)(a1 + 152) + 22, 0))
    {
      return -1;
    }
    else if (!v4 {
           || (*a2 = 0,
    }
               (*(uint64_t (**)(void, void, unsigned char *, unint64_t))(a1 + 8))(*(void *)(a1 + 56), *(void *)(a1 + 96), a2, v4) == v4))
    {
      if (a2 && a3 > *(void *)(a1 + 112)) {
        a2[*(void *)(a1 + 112)] = 0;
      }
      return v4;
    }
    else
    {
      return -1;
    }
  }
  else
  {
    return -102;
  }
}

uint64_t unzGetOffset64(void *a1)
{
  if (!a1) {
    return 0;
  }
  if (!a1[18]) {
    return 0;
  }
  if (a1[13] && a1[13] != 0xFFFFLL && a1[16] == a1[13]) {
    return 0;
  }
  return a1[17];
}

uint64_t unzGetOffset(void *a1)
{
  if (a1) {
    return unzGetOffset64(a1);
  }
  else {
    return 0;
  }
}

uint64_t unzSetOffset64(uint64_t *a1, uint64_t a2)
{
  if (a1)
  {
    a1[17] = a2;
    a1[16] = a1[13];
    unsigned int CurrentFileInfoInternal = unz64local_GetCurrentFileInfoInternal(a1, a1 + 22, a1 + 39, 0, 0, 0, 0, 0, 0);
    a1[18] = CurrentFileInfoInternal == 0;
    return CurrentFileInfoInternal;
  }
  else
  {
    return -102;
  }
}

uint64_t unzSetOffset(uint64_t *a1, uint64_t a2)
{
  return unzSetOffset64(a1, a2);
}

uint64_t unz64local_SearchCentralDir64(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = a1;
  uint64_t v14 = a2;
  uint64_t v13 = 0;
  unint64_t v12 = 0;
  unint64_t v11 = 0;
  unint64_t v10 = 0xFFFFLL;
  uint64_t v9 = 0;
  uint64_t v8 = 0;
  uint64_t v7 = 0;
  if (call_zseek64(a1, a2, 0, 2u)) {
    return 0;
  }
  unint64_t v12 = call_ztell64(v15, v14);
  if (v10 > v12) {
    unint64_t v10 = v12;
  }
  uint64_t v13 = malloc_type_malloc(0x404uLL, 0xBA45F597uLL);
  if (!v13) {
    return 0;
  }
  unint64_t v11 = 4;
  do
  {
    if (v11 >= v10) {
      break;
    }
    if (v11 + 1024 <= v10) {
      v11 += 1024;
    }
    else {
      unint64_t v11 = v10;
    }
    uint64_t v6 = v12 - v11;
    unint64_t v4 = v11 <= 0x404 ? v11 : 1028;
    if (call_zseek64(v15, v14, v6, 0)
      || (*(uint64_t (**)(void, uint64_t, unsigned char *, unint64_t))(v15 + 8))(*(void *)(v15 + 56), v14, v13, v4) != v4)
    {
      break;
    }
    int v5 = v4 - 3;
    while (1)
    {
      int v2 = v5--;
      if (v2 <= 0) {
        break;
      }
      if (v13[v5] == 80 && v13[v5 + 1] == 75 && v13[v5 + 2] == 6 && v13[v5 + 3] == 7)
      {
        uint64_t v9 = v6 + v5;
        break;
      }
    }
  }
  while (!v9);
  free(v13);
  if (!v9) {
    return 0;
  }
  if (call_zseek64(v15, v14, v9, 0)) {
    return 0;
  }
  if (unz64local_getLong(v15, v14, &v8)) {
    return 0;
  }
  if (unz64local_getLong(v15, v14, &v8)) {
    return 0;
  }
  if (v8) {
    return 0;
  }
  if (unz64local_getLong64(v15, v14, &v7)) {
    return 0;
  }
  if (unz64local_getLong(v15, v14, &v8)) {
    return 0;
  }
  if (v8 != 1) {
    return 0;
  }
  if (call_zseek64(v15, v14, v7, 0)) {
    return 0;
  }
  if (unz64local_getLong(v15, v14, &v8)) {
    return 0;
  }
  if (v8 == 101075792) {
    return v7;
  }
  return 0;
}

uint64_t unz64local_getLong(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = a1;
  uint64_t v8 = a2;
  uint64_t v7 = a3;
  uint64_t v6 = 0;
  int v5 = 0;
  unsigned int Byte = unz64local_getByte(a1, a2, &v5);
  uint64_t v6 = v5;
  if (!Byte) {
    unsigned int Byte = unz64local_getByte(v9, v8, &v5);
  }
  v6 |= (uint64_t)v5 << 8;
  if (!Byte) {
    unsigned int Byte = unz64local_getByte(v9, v8, &v5);
  }
  v6 |= (uint64_t)v5 << 16;
  if (!Byte) {
    unsigned int Byte = unz64local_getByte(v9, v8, &v5);
  }
  v6 += (uint64_t)v5 << 24;
  if (Byte) {
    *uint64_t v7 = 0;
  }
  else {
    *uint64_t v7 = v6;
  }
  return Byte;
}

uint64_t unz64local_getLong64(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = a1;
  uint64_t v8 = a2;
  uint64_t v7 = a3;
  uint64_t v6 = 0;
  int v5 = 0;
  unsigned int Byte = unz64local_getByte(a1, a2, &v5);
  uint64_t v6 = v5;
  if (!Byte) {
    unsigned int Byte = unz64local_getByte(v9, v8, &v5);
  }
  v6 |= (uint64_t)v5 << 8;
  if (!Byte) {
    unsigned int Byte = unz64local_getByte(v9, v8, &v5);
  }
  v6 |= (uint64_t)v5 << 16;
  if (!Byte) {
    unsigned int Byte = unz64local_getByte(v9, v8, &v5);
  }
  v6 |= (uint64_t)v5 << 24;
  if (!Byte) {
    unsigned int Byte = unz64local_getByte(v9, v8, &v5);
  }
  v6 |= (uint64_t)v5 << 32;
  if (!Byte) {
    unsigned int Byte = unz64local_getByte(v9, v8, &v5);
  }
  v6 |= (uint64_t)v5 << 40;
  if (!Byte) {
    unsigned int Byte = unz64local_getByte(v9, v8, &v5);
  }
  v6 |= (uint64_t)v5 << 48;
  if (!Byte) {
    unsigned int Byte = unz64local_getByte(v9, v8, &v5);
  }
  v6 |= (uint64_t)v5 << 56;
  if (Byte) {
    *uint64_t v7 = 0;
  }
  else {
    *uint64_t v7 = v6;
  }
  return Byte;
}

uint64_t unz64local_getShort(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = a1;
  uint64_t v8 = a2;
  uint64_t v7 = a3;
  uint64_t v6 = 0;
  int v5 = 0;
  unsigned int Byte = unz64local_getByte(a1, a2, &v5);
  uint64_t v6 = v5;
  if (!Byte) {
    unsigned int Byte = unz64local_getByte(v9, v8, &v5);
  }
  v6 |= (uint64_t)v5 << 8;
  if (Byte) {
    *uint64_t v7 = 0;
  }
  else {
    *uint64_t v7 = v6;
  }
  return Byte;
}

uint64_t unz64local_SearchCentralDir(uint64_t a1, uint64_t a2)
{
  unint64_t v8 = 0xFFFFLL;
  uint64_t v7 = 0;
  if (call_zseek64(a1, a2, 0, 2u)) {
    return 0;
  }
  unint64_t v10 = call_ztell64(a1, a2);
  if (v10 < 0xFFFF) {
    unint64_t v8 = v10;
  }
  unint64_t v11 = malloc_type_malloc(0x404uLL, 0x16ECF6D5uLL);
  if (!v11) {
    return 0;
  }
  unint64_t v9 = 4;
  do
  {
    if (v9 >= v8) {
      break;
    }
    if (v9 + 1024 <= v8) {
      v9 += 1024;
    }
    else {
      unint64_t v9 = v8;
    }
    uint64_t v6 = v10 - v9;
    unint64_t v4 = v9 <= 0x404 ? v9 : 1028;
    if (call_zseek64(a1, a2, v6, 0)
      || (*(uint64_t (**)(void, uint64_t, unsigned char *, unint64_t))(a1 + 8))(*(void *)(a1 + 56), a2, v11, v4) != v4)
    {
      break;
    }
    int v5 = v4 - 3;
    while (1)
    {
      int v2 = v5--;
      if (v2 <= 0) {
        break;
      }
      if (v11[v5] == 80 && v11[v5 + 1] == 75 && v11[v5 + 2] == 5 && v11[v5 + 3] == 6)
      {
        uint64_t v7 = v6 + v5;
        break;
      }
    }
  }
  while (!v7);
  free(v11);
  return v7;
}

uint64_t unz64local_getByte(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v7 = a1;
  uint64_t v6 = a2;
  int v5 = a3;
  unsigned __int8 v4 = 0;
  if ((*(unsigned int (**)(void, uint64_t, unsigned __int8 *, uint64_t))(a1 + 8))(*(void *)(a1 + 56), a2, &v4, 1) == 1)
  {
    *int v5 = v4;
    return 0;
  }
  else if ((*(unsigned int (**)(void, uint64_t))(v7 + 48))(*(void *)(v7 + 56), v6))
  {
    return -1;
  }
  else
  {
    return 0;
  }
}

uint64_t unz64local_DosDateToTmuDate(uint64_t result, _DWORD *a2)
{
  a2[3] = BYTE2(result) & 0x1F;
  a2[4] = (WORD1(result) & 0x1E0u) / 0x20 - 1;
  a2[5] = (WORD1(result) & 0xFE00u) / 0x200 + 1980;
  a2[2] = ((unsigned __int16)result & 0xF800u) / 0x800;
  a2[1] = ((unsigned __int16)result & 0x7E0u) / 0x20;
  *a2 = 2 * (result & 0x1F);
  return result;
}

id WithFinalizer(id val)
{
  objc_initWeak(&location, val);
  id v11 = (id)[MEMORY[0x263F80CB8] currentContext];
  if (v11)
  {
    char v3 = (void *)MEMORY[0x263F80CD8];
    uint64_t v4 = MEMORY[0x263EF8330];
    int v5 = -1073741824;
    int v6 = 0;
    uint64_t v7 = __WithFinalizer_block_invoke;
    unint64_t v8 = &unk_26485AC20;
    objc_copyWeak(&v9, &location);
    [v3 runBlock:&v4 onFinalize:v11];
    id v13 = objc_loadWeakRetained(&location);
    int v10 = 1;
    objc_destroyWeak(&v9);
  }
  else
  {
    id v13 = objc_loadWeakRetained(&location);
    int v10 = 1;
  }
  objc_storeStrong(&v11, 0);
  objc_destroyWeak(&location);
  v1 = v13;
  return v1;
}

void __WithFinalizer_block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = (id)[WeakRetained tkPage];
  [v1 dispose];
}

void sub_2290DCFF8(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  *(void *)(v9 - 40) = a1;
  *(_DWORD *)(v9 - 44) = a2;
  objc_destroyWeak((id *)(v9 - 32));
  _Unwind_Resume(*(_Unwind_Exception **)(v9 - 40));
}

BOOL __CGSizeEqualToSize(double a1, double a2, double a3, double a4)
{
  BOOL v5 = 0;
  if (a1 == a3) {
    return a2 == a4;
  }
  return v5;
}

uint64_t XXH_versionNumber()
{
  return 501;
}

uint64_t XXH32(unsigned int *a1, unint64_t a2, unsigned int a3)
{
  int v9 = a2;
  if ((a1 & 3) != 0)
  {
    if (g_one == 1)
    {
      uint64_t v29 = a1;
      unint64_t v28 = (unint64_t)a1 + a2;
      if (a2 < 0x10)
      {
        int v25 = a3 + 374761393;
      }
      else
      {
        unsigned int v24 = a3 + 606290984;
        unsigned int v23 = a3 - 2048144777;
        unsigned int v22 = a3;
        unsigned int v21 = a3 + 1640531535;
        do
        {
          int v59 = XXH_read32(v29);
          unsigned int v24 = -1640531535 * (((v24 - 2048144777 * v59) >> 19) | ((v24 - 2048144777 * v59) << 13));
          v30 = v29 + 1;
          int v58 = XXH_read32(v30);
          unsigned int v23 = -1640531535 * (((v23 - 2048144777 * v58) >> 19) | ((v23 - 2048144777 * v58) << 13));
          int v57 = XXH_read32(++v30);
          unsigned int v22 = -1640531535 * (((v22 - 2048144777 * v57) >> 19) | ((v22 - 2048144777 * v57) << 13));
          int v56 = XXH_read32(++v30);
          unsigned int v21 = -1640531535 * (((v21 - 2048144777 * v56) >> 19) | ((v21 - 2048144777 * v56) << 13));
          uint64_t v29 = v30 + 1;
        }
        while ((unint64_t)v29 <= v28 - 16);
        int v25 = ((v24 >> 31) | (2 * v24))
            + ((v23 >> 25) | (v23 << 7))
            + ((v22 >> 20) | (v22 << 12))
            + ((v21 >> 14) | (v21 << 18));
      }
      unsigned int v26 = v25 + v9;
      while ((unint64_t)(v29 + 1) <= v28)
      {
        int v60 = XXH_read32(v29);
        unsigned int v26 = 668265263 * (((v26 - 1028477379 * v60) >> 15) | ((v26 - 1028477379 * v60) << 17));
        ++v29;
      }
      while ((unint64_t)v29 < v28)
      {
        unsigned int v26 = -1640531535
            * (((v26 + 374761393 * *(unsigned __int8 *)v29) >> 21) | ((v26 + 374761393 * *(unsigned __int8 *)v29) << 11));
        uint64_t v29 = (unsigned int *)((char *)v29 + 1);
      }
      unsigned int v27 = -1028477379 * ((-2048144777 * (v26 ^ (v26 >> 15))) ^ ((-2048144777 * (v26 ^ (v26 >> 15))) >> 13));
      return v27 ^ HIWORD(v27);
    }
    else
    {
      int v19 = a1;
      unint64_t v18 = (unint64_t)a1 + a2;
      if (a2 < 0x10)
      {
        int v15 = a3 + 374761393;
      }
      else
      {
        unsigned int v14 = a3 + 606290984;
        unsigned int v13 = a3 - 2048144777;
        unsigned int v12 = a3;
        unsigned int v11 = a3 + 1640531535;
        do
        {
          unsigned int v3 = XXH_read32(v19);
          int v64 = XXH_swap32(v3);
          unsigned int v14 = -1640531535 * (((v14 - 2048144777 * v64) >> 19) | ((v14 - 2048144777 * v64) << 13));
          uint64_t v20 = v19 + 1;
          unsigned int v4 = XXH_read32(v20);
          int v63 = XXH_swap32(v4);
          unsigned int v13 = -1640531535 * (((v13 - 2048144777 * v63) >> 19) | ((v13 - 2048144777 * v63) << 13));
          unsigned int v5 = XXH_read32(++v20);
          int v62 = XXH_swap32(v5);
          unsigned int v12 = -1640531535 * (((v12 - 2048144777 * v62) >> 19) | ((v12 - 2048144777 * v62) << 13));
          unsigned int v6 = XXH_read32(++v20);
          int v61 = XXH_swap32(v6);
          unsigned int v11 = -1640531535 * (((v11 - 2048144777 * v61) >> 19) | ((v11 - 2048144777 * v61) << 13));
          int v19 = v20 + 1;
        }
        while ((unint64_t)v19 <= v18 - 16);
        int v15 = ((v14 >> 31) | (2 * v14))
            + ((v13 >> 25) | (v13 << 7))
            + ((v12 >> 20) | (v12 << 12))
            + ((v11 >> 14) | (v11 << 18));
      }
      unsigned int v16 = v15 + v9;
      while ((unint64_t)(v19 + 1) <= v18)
      {
        unsigned int v7 = XXH_read32(v19);
        int v65 = XXH_swap32(v7);
        unsigned int v16 = 668265263 * (((v16 - 1028477379 * v65) >> 15) | ((v16 - 1028477379 * v65) << 17));
        ++v19;
      }
      while ((unint64_t)v19 < v18)
      {
        unsigned int v16 = -1640531535
            * (((v16 + 374761393 * *(unsigned __int8 *)v19) >> 21) | ((v16 + 374761393 * *(unsigned __int8 *)v19) << 11));
        int v19 = (unsigned int *)((char *)v19 + 1);
      }
      unsigned int v17 = -1028477379 * ((-2048144777 * (v16 ^ (v16 >> 15))) ^ ((-2048144777 * (v16 ^ (v16 >> 15))) >> 13));
      return v17 ^ HIWORD(v17);
    }
  }
  else if (g_one == 1)
  {
    v49 = a1;
    unint64_t v48 = (unint64_t)a1 + a2;
    if (a2 < 0x10)
    {
      int v45 = a3 + 374761393;
    }
    else
    {
      unsigned int v44 = a3 + 606290984;
      unsigned int v43 = a3 - 2048144777;
      unsigned int v42 = a3;
      unsigned int v41 = a3 + 1640531535;
      do
      {
        unsigned int v44 = -1640531535 * (((v44 - 2048144777 * *v49) >> 19) | ((v44 - 2048144777 * *v49) << 13));
        v50 = v49 + 1;
        unsigned int v43 = -1640531535 * (((v43 - 2048144777 * *v50) >> 19) | ((v43 - 2048144777 * *v50) << 13));
        ++v50;
        unsigned int v42 = -1640531535 * (((v42 - 2048144777 * *v50) >> 19) | ((v42 - 2048144777 * *v50) << 13));
        ++v50;
        unsigned int v41 = -1640531535 * (((v41 - 2048144777 * *v50) >> 19) | ((v41 - 2048144777 * *v50) << 13));
        v49 = v50 + 1;
      }
      while ((unint64_t)v49 <= v48 - 16);
      int v45 = ((v44 >> 31) | (2 * v44))
          + ((v43 >> 25) | (v43 << 7))
          + ((v42 >> 20) | (v42 << 12))
          + ((v41 >> 14) | (v41 << 18));
    }
    unsigned int v46 = v45 + a2;
    while ((unint64_t)(v49 + 1) <= v48)
    {
      unsigned int v46 = 668265263 * (((v46 - 1028477379 * *v49) >> 15) | ((v46 - 1028477379 * *v49) << 17));
      ++v49;
    }
    while ((unint64_t)v49 < v48)
    {
      unsigned int v46 = -1640531535
          * (((v46 + 374761393 * *(unsigned __int8 *)v49) >> 21) | ((v46 + 374761393 * *(unsigned __int8 *)v49) << 11));
      v49 = (_DWORD *)((char *)v49 + 1);
    }
    unsigned int v47 = -1028477379 * ((-2048144777 * (v46 ^ (v46 >> 15))) ^ ((-2048144777 * (v46 ^ (v46 >> 15))) >> 13));
    return v47 ^ HIWORD(v47);
  }
  else
  {
    v39 = a1;
    unint64_t v38 = (unint64_t)a1 + a2;
    if (a2 < 0x10)
    {
      int v35 = a3 + 374761393;
    }
    else
    {
      unsigned int v34 = a3 + 606290984;
      unsigned int v33 = a3 - 2048144777;
      unsigned int v32 = a3;
      unsigned int v31 = a3 + 1640531535;
      do
      {
        int v54 = XXH_swap32(*v39);
        unsigned int v34 = -1640531535 * (((v34 - 2048144777 * v54) >> 19) | ((v34 - 2048144777 * v54) << 13));
        v40 = v39 + 1;
        int v53 = XXH_swap32(*v40);
        unsigned int v33 = -1640531535 * (((v33 - 2048144777 * v53) >> 19) | ((v33 - 2048144777 * v53) << 13));
        int v52 = XXH_swap32(*++v40);
        unsigned int v32 = -1640531535 * (((v32 - 2048144777 * v52) >> 19) | ((v32 - 2048144777 * v52) << 13));
        int v51 = XXH_swap32(*++v40);
        unsigned int v31 = -1640531535 * (((v31 - 2048144777 * v51) >> 19) | ((v31 - 2048144777 * v51) << 13));
        v39 = v40 + 1;
      }
      while ((unint64_t)v39 <= v38 - 16);
      int v35 = ((v34 >> 31) | (2 * v34))
          + ((v33 >> 25) | (v33 << 7))
          + ((v32 >> 20) | (v32 << 12))
          + ((v31 >> 14) | (v31 << 18));
    }
    unsigned int v36 = v35 + v9;
    while ((unint64_t)(v39 + 1) <= v38)
    {
      int v55 = XXH_swap32(*v39);
      unsigned int v36 = 668265263 * (((v36 - 1028477379 * v55) >> 15) | ((v36 - 1028477379 * v55) << 17));
      ++v39;
    }
    while ((unint64_t)v39 < v38)
    {
      unsigned int v36 = -1640531535
          * (((v36 + 374761393 * *(unsigned __int8 *)v39) >> 21) | ((v36 + 374761393 * *(unsigned __int8 *)v39) << 11));
      v39 = (unsigned int *)((char *)v39 + 1);
    }
    unsigned int v37 = -1028477379 * ((-2048144777 * (v36 ^ (v36 >> 15))) ^ ((-2048144777 * (v36 ^ (v36 >> 15))) >> 13));
    return v37 ^ HIWORD(v37);
  }
}

unint64_t XXH64(unsigned int *a1, unint64_t a2, unint64_t a3)
{
  if ((a1 & 7) != 0)
  {
    if (g_one == 1)
    {
      unsigned int v37 = a1;
      unint64_t v36 = (unint64_t)a1 + a2;
      if (a2 < 0x20)
      {
        unint64_t v32 = a3 + 0x27D4EB2F165667C5;
      }
      else
      {
        unint64_t v31 = a3 + 0x60EA27EEADC0B5D6;
        unint64_t v30 = a3 - 0x3D4D51C2D82B14B1;
        unint64_t v29 = a3;
        unint64_t v28 = a3 + 0x61C8864E7A143579;
        do
        {
          uint64_t v78 = XXH_read64((uint64_t)v37);
          uint64_t v38 = (uint64_t)(v37 + 2);
          unint64_t v31 = 0x9E3779B185EBCA87
              * (((v31 - 0x3D4D51C2D82B14B1 * v78) >> 33) | ((v31 - 0x3D4D51C2D82B14B1 * v78) << 31));
          uint64_t v77 = XXH_read64(v38);
          v38 += 8;
          unint64_t v30 = 0x9E3779B185EBCA87
              * (((v30 - 0x3D4D51C2D82B14B1 * v77) >> 33) | ((v30 - 0x3D4D51C2D82B14B1 * v77) << 31));
          uint64_t v76 = XXH_read64(v38);
          v38 += 8;
          unint64_t v29 = 0x9E3779B185EBCA87
              * (((v29 - 0x3D4D51C2D82B14B1 * v76) >> 33) | ((v29 - 0x3D4D51C2D82B14B1 * v76) << 31));
          uint64_t v75 = XXH_read64(v38);
          unsigned int v37 = (unsigned int *)(v38 + 8);
          unint64_t v28 = 0x9E3779B185EBCA87
              * ((__int128)__PAIR128__(v28 - 0x3D4D51C2D82B14B1 * v75, v28 - 0x3D4D51C2D82B14B1 * v75) >> 33);
        }
        while ((unint64_t)v37 <= v36 - 32);
        unint64_t v32 = 0x9E3779B185EBCA87
            * ((0x9E3779B185EBCA87
              * ((0x9E3779B185EBCA87
                * ((0x9E3779B185EBCA87
                  * ((((v31 >> 63) | (2 * v31))
                    + ((v30 >> 57) | (v30 << 7))
                    + ((v29 >> 52) | (v29 << 12))
                    + ((v28 >> 46) | (v28 << 18))) ^ (0x9E3779B185EBCA87
                                                    * (((0xC2B2AE3D27D4EB4FLL * v31) >> 33) | (0x93EA75A780000000 * v31))))
                  - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87
                                           * (((0xC2B2AE3D27D4EB4FLL * v30) >> 33) | (0x93EA75A780000000 * v30))))
                - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87
                                         * (((0xC2B2AE3D27D4EB4FLL * v29) >> 33) | (0x93EA75A780000000 * v29))))
              - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87
                                       * (((0xC2B2AE3D27D4EB4FLL * v28) >> 33) | (0x93EA75A780000000 * v28))))
            - 0x7A1435883D4D519DLL;
      }
      unint64_t v33 = v32 + a2;
      while ((unint64_t)(v37 + 2) <= v36)
      {
        uint64_t v79 = XXH_read64((uint64_t)v37);
        unint64_t v34 = v33 ^ (0x9E3779B185EBCA87 * (((0xC2B2AE3D27D4EB4FLL * v79) >> 33) | (0x93EA75A780000000 * v79)));
        unint64_t v33 = 0x9E3779B185EBCA87 * ((__int128)__PAIR128__(v34, v34) >> 37) - 0x7A1435883D4D519DLL;
        v37 += 2;
      }
      if ((unint64_t)(v37 + 1) <= v36)
      {
        unsigned int v64 = XXH_read32(v37);
        unint64_t v33 = 0xC2B2AE3D27D4EB4FLL
            * ((__int128)__PAIR128__(v33 ^ (0x9E3779B185EBCA87 * v64), v33 ^ (0x9E3779B185EBCA87 * v64)) >> 41)
            + 0x165667B19E3779F9;
        ++v37;
      }
      while ((unint64_t)v37 < v36)
      {
        unint64_t v33 = 0x9E3779B185EBCA87
            * ((__int128)__PAIR128__(v33 ^ (0x27D4EB2F165667C5 * *(unsigned __int8 *)v37), v33 ^ (0x27D4EB2F165667C5 * *(unsigned __int8 *)v37)) >> 53);
        unsigned int v37 = (unsigned int *)((char *)v37 + 1);
      }
      unint64_t v35 = 0x165667B19E3779F9
          * ((0xC2B2AE3D27D4EB4FLL * (v33 ^ (v33 >> 33))) ^ ((0xC2B2AE3D27D4EB4FLL * (v33 ^ (v33 >> 33))) >> 29));
      return v35 ^ HIDWORD(v35);
    }
    else
    {
      unsigned int v26 = a1;
      unint64_t v25 = (unint64_t)a1 + a2;
      if (a2 < 0x20)
      {
        unint64_t v23 = a3 + 0x27D4EB2F165667C5;
      }
      else
      {
        unint64_t v22 = a3 + 0x60EA27EEADC0B5D6;
        unint64_t v21 = a3 - 0x3D4D51C2D82B14B1;
        unint64_t v20 = a3;
        unint64_t v19 = a3 + 0x61C8864E7A143579;
        do
        {
          unint64_t v3 = XXH_read64((uint64_t)v26);
          uint64_t v15 = XXH_swap64(v3);
          uint64_t v27 = (uint64_t)(v26 + 2);
          unint64_t v22 = 0x9E3779B185EBCA87
              * (((v22 - 0x3D4D51C2D82B14B1 * v15) >> 33) | ((v22 - 0x3D4D51C2D82B14B1 * v15) << 31));
          unint64_t v4 = XXH_read64(v27);
          uint64_t v14 = XXH_swap64(v4);
          v27 += 8;
          unint64_t v21 = 0x9E3779B185EBCA87
              * (((v21 - 0x3D4D51C2D82B14B1 * v14) >> 33) | ((v21 - 0x3D4D51C2D82B14B1 * v14) << 31));
          unint64_t v5 = XXH_read64(v27);
          uint64_t v13 = XXH_swap64(v5);
          v27 += 8;
          unint64_t v20 = 0x9E3779B185EBCA87
              * (((v20 - 0x3D4D51C2D82B14B1 * v13) >> 33) | ((v20 - 0x3D4D51C2D82B14B1 * v13) << 31));
          unint64_t v6 = XXH_read64(v27);
          uint64_t v12 = XXH_swap64(v6);
          unsigned int v26 = (unsigned int *)(v27 + 8);
          unint64_t v19 = 0x9E3779B185EBCA87
              * (((v19 - 0x3D4D51C2D82B14B1 * v12) >> 33) | ((v19 - 0x3D4D51C2D82B14B1 * v12) << 31));
        }
        while ((unint64_t)v26 <= v25 - 32);
        unint64_t v23 = 0x9E3779B185EBCA87
            * ((0x9E3779B185EBCA87
              * ((0x9E3779B185EBCA87
                * ((0x9E3779B185EBCA87
                  * ((((v22 >> 63) | (2 * v22))
                    + ((v21 >> 57) | (v21 << 7))
                    + ((v20 >> 52) | (v20 << 12))
                    + ((v19 >> 46) | (v19 << 18))) ^ (0x9E3779B185EBCA87
                                                    * (((0xC2B2AE3D27D4EB4FLL * v22) >> 33) | (0x93EA75A780000000 * v22))))
                  - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87
                                           * (((0xC2B2AE3D27D4EB4FLL * v21) >> 33) | (0x93EA75A780000000 * v21))))
                - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87
                                         * (((0xC2B2AE3D27D4EB4FLL * v20) >> 33) | (0x93EA75A780000000 * v20))))
              - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87
                                       * (((0xC2B2AE3D27D4EB4FLL * v19) >> 33) | (0x93EA75A780000000 * v19))))
            - 0x7A1435883D4D519DLL;
      }
      unint64_t v24 = v23 + a2;
      while ((unint64_t)(v26 + 2) <= v25)
      {
        unint64_t v7 = XXH_read64((uint64_t)v26);
        uint64_t v11 = XXH_swap64(v7);
        unint64_t v18 = 0x9E3779B185EBCA87 * (((0xC2B2AE3D27D4EB4FLL * v11) >> 33) | (0x93EA75A780000000 * v11));
        unint64_t v24 = 0x9E3779B185EBCA87 * (((v24 ^ v18) >> 37) | ((v24 ^ v18) << 27)) - 0x7A1435883D4D519DLL;
        v26 += 2;
      }
      if ((unint64_t)(v26 + 1) <= v25)
      {
        unsigned int v8 = XXH_read32(v26);
        unsigned int v65 = XXH_swap32(v8);
        unint64_t v24 = 0xC2B2AE3D27D4EB4FLL
            * (((v24 ^ (0x9E3779B185EBCA87 * v65)) >> 41) | ((v24 ^ (0x9E3779B185EBCA87 * v65)) << 23))
            + 0x165667B19E3779F9;
        ++v26;
      }
      while ((unint64_t)v26 < v25)
      {
        unint64_t v24 = 0x9E3779B185EBCA87
            * (((v24 ^ (0x27D4EB2F165667C5 * *(unsigned __int8 *)v26)) >> 53) | ((v24 ^ (0x27D4EB2F165667C5
                                                                                         * *(unsigned __int8 *)v26)) << 11));
        unsigned int v26 = (unsigned int *)((char *)v26 + 1);
      }
      unint64_t v9 = 0x165667B19E3779F9
         * ((0xC2B2AE3D27D4EB4FLL * (v24 ^ (v24 >> 33))) ^ ((0xC2B2AE3D27D4EB4FLL * (v24 ^ (v24 >> 33))) >> 29));
      return v9 ^ HIDWORD(v9);
    }
  }
  else if (g_one == 1)
  {
    int v61 = a1;
    unint64_t v60 = (unint64_t)a1 + a2;
    if (a2 < 0x20)
    {
      unint64_t v56 = a3 + 0x27D4EB2F165667C5;
    }
    else
    {
      unint64_t v55 = a3 + 0x60EA27EEADC0B5D6;
      unint64_t v54 = a3 - 0x3D4D51C2D82B14B1;
      unint64_t v53 = a3;
      unint64_t v52 = a3 + 0x61C8864E7A143579;
      do
      {
        uint64_t v69 = *(void *)v61;
        int v62 = (uint64_t *)(v61 + 2);
        unint64_t v55 = 0x9E3779B185EBCA87
            * (((v55 - 0x3D4D51C2D82B14B1 * v69) >> 33) | ((v55 - 0x3D4D51C2D82B14B1 * v69) << 31));
        uint64_t v68 = *v62++;
        unint64_t v54 = 0x9E3779B185EBCA87
            * (((v54 - 0x3D4D51C2D82B14B1 * v68) >> 33) | ((v54 - 0x3D4D51C2D82B14B1 * v68) << 31));
        uint64_t v67 = *v62++;
        unint64_t v53 = 0x9E3779B185EBCA87
            * (((v53 - 0x3D4D51C2D82B14B1 * v67) >> 33) | ((v53 - 0x3D4D51C2D82B14B1 * v67) << 31));
        uint64_t v66 = *v62;
        int v61 = (unsigned int *)(v62 + 1);
        unint64_t v52 = 0x9E3779B185EBCA87
            * ((__int128)__PAIR128__(v52 - 0x3D4D51C2D82B14B1 * v66, v52 - 0x3D4D51C2D82B14B1 * v66) >> 33);
      }
      while ((unint64_t)v61 <= v60 - 32);
      unint64_t v56 = 0x9E3779B185EBCA87
          * ((0x9E3779B185EBCA87
            * ((0x9E3779B185EBCA87
              * ((0x9E3779B185EBCA87
                * ((((v55 >> 63) | (2 * v55))
                  + ((v54 >> 57) | (v54 << 7))
                  + ((v53 >> 52) | (v53 << 12))
                  + ((v52 >> 46) | (v52 << 18))) ^ (0x9E3779B185EBCA87
                                                  * (((0xC2B2AE3D27D4EB4FLL * v55) >> 33) | (0x93EA75A780000000 * v55))))
                - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87
                                         * (((0xC2B2AE3D27D4EB4FLL * v54) >> 33) | (0x93EA75A780000000 * v54))))
              - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87
                                       * (((0xC2B2AE3D27D4EB4FLL * v53) >> 33) | (0x93EA75A780000000 * v53))))
            - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87
                                     * (((0xC2B2AE3D27D4EB4FLL * v52) >> 33) | (0x93EA75A780000000 * v52))))
          - 0x7A1435883D4D519DLL;
    }
    unint64_t v57 = v56 + a2;
    while ((unint64_t)(v61 + 2) <= v60)
    {
      unint64_t v58 = v57 ^ (0x9E3779B185EBCA87
                 * (((0xC2B2AE3D27D4EB4FLL * *(void *)v61) >> 33) | (0x93EA75A780000000 * *(void *)v61)));
      unint64_t v57 = 0x9E3779B185EBCA87 * ((__int128)__PAIR128__(v58, v58) >> 37) - 0x7A1435883D4D519DLL;
      v61 += 2;
    }
    if ((unint64_t)(v61 + 1) <= v60)
    {
      unint64_t v57 = 0xC2B2AE3D27D4EB4FLL
          * ((__int128)__PAIR128__(v57 ^ (0x9E3779B185EBCA87 * *v61), v57 ^ (0x9E3779B185EBCA87 * *v61)) >> 41)
          + 0x165667B19E3779F9;
      ++v61;
    }
    while ((unint64_t)v61 < v60)
    {
      unint64_t v57 = 0x9E3779B185EBCA87
          * ((__int128)__PAIR128__(v57 ^ (0x27D4EB2F165667C5 * *(unsigned __int8 *)v61), v57 ^ (0x27D4EB2F165667C5 * *(unsigned __int8 *)v61)) >> 53);
      int v61 = (unsigned int *)((char *)v61 + 1);
    }
    unint64_t v59 = 0x165667B19E3779F9
        * ((0xC2B2AE3D27D4EB4FLL * (v57 ^ (v57 >> 33))) ^ ((0xC2B2AE3D27D4EB4FLL * (v57 ^ (v57 >> 33))) >> 29));
    return v59 ^ HIDWORD(v59);
  }
  else
  {
    v49 = (unint64_t *)a1;
    unint64_t v48 = (unint64_t)a1 + a2;
    if (a2 < 0x20)
    {
      unint64_t v44 = a3 + 0x27D4EB2F165667C5;
    }
    else
    {
      unint64_t v43 = a3 + 0x60EA27EEADC0B5D6;
      unint64_t v42 = a3 - 0x3D4D51C2D82B14B1;
      unint64_t v41 = a3;
      unint64_t v40 = a3 + 0x61C8864E7A143579;
      do
      {
        uint64_t v73 = XXH_swap64(*v49);
        v50 = v49 + 1;
        unint64_t v43 = 0x9E3779B185EBCA87
            * (((v43 - 0x3D4D51C2D82B14B1 * v73) >> 33) | ((v43 - 0x3D4D51C2D82B14B1 * v73) << 31));
        uint64_t v72 = XXH_swap64(*v50++);
        unint64_t v42 = 0x9E3779B185EBCA87
            * (((v42 - 0x3D4D51C2D82B14B1 * v72) >> 33) | ((v42 - 0x3D4D51C2D82B14B1 * v72) << 31));
        uint64_t v71 = XXH_swap64(*v50++);
        unint64_t v41 = 0x9E3779B185EBCA87
            * (((v41 - 0x3D4D51C2D82B14B1 * v71) >> 33) | ((v41 - 0x3D4D51C2D82B14B1 * v71) << 31));
        uint64_t v70 = XXH_swap64(*v50);
        v49 = v50 + 1;
        unint64_t v40 = 0x9E3779B185EBCA87
            * ((__int128)__PAIR128__(v40 - 0x3D4D51C2D82B14B1 * v70, v40 - 0x3D4D51C2D82B14B1 * v70) >> 33);
      }
      while ((unint64_t)v49 <= v48 - 32);
      unint64_t v44 = 0x9E3779B185EBCA87
          * ((0x9E3779B185EBCA87
            * ((0x9E3779B185EBCA87
              * ((0x9E3779B185EBCA87
                * ((((v43 >> 63) | (2 * v43))
                  + ((v42 >> 57) | (v42 << 7))
                  + ((v41 >> 52) | (v41 << 12))
                  + ((v40 >> 46) | (v40 << 18))) ^ (0x9E3779B185EBCA87
                                                  * (((0xC2B2AE3D27D4EB4FLL * v43) >> 33) | (0x93EA75A780000000 * v43))))
                - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87
                                         * (((0xC2B2AE3D27D4EB4FLL * v42) >> 33) | (0x93EA75A780000000 * v42))))
              - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87
                                       * (((0xC2B2AE3D27D4EB4FLL * v41) >> 33) | (0x93EA75A780000000 * v41))))
            - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87
                                     * (((0xC2B2AE3D27D4EB4FLL * v40) >> 33) | (0x93EA75A780000000 * v40))))
          - 0x7A1435883D4D519DLL;
    }
    unint64_t v45 = v44 + a2;
    while ((unint64_t)(v49 + 1) <= v48)
    {
      uint64_t v74 = XXH_swap64(*v49);
      unint64_t v46 = v45 ^ (0x9E3779B185EBCA87 * (((0xC2B2AE3D27D4EB4FLL * v74) >> 33) | (0x93EA75A780000000 * v74)));
      unint64_t v45 = 0x9E3779B185EBCA87 * ((__int128)__PAIR128__(v46, v46) >> 37) - 0x7A1435883D4D519DLL;
      ++v49;
    }
    if ((unint64_t)v49 + 4 <= v48)
    {
      unsigned int v63 = XXH_swap32(*(_DWORD *)v49);
      unint64_t v45 = 0xC2B2AE3D27D4EB4FLL
          * ((__int128)__PAIR128__(v45 ^ (0x9E3779B185EBCA87 * v63), v45 ^ (0x9E3779B185EBCA87 * v63)) >> 41)
          + 0x165667B19E3779F9;
      v49 = (unint64_t *)((char *)v49 + 4);
    }
    while ((unint64_t)v49 < v48)
    {
      unint64_t v45 = 0x9E3779B185EBCA87
          * ((__int128)__PAIR128__(v45 ^ (0x27D4EB2F165667C5 * *(unsigned __int8 *)v49), v45 ^ (0x27D4EB2F165667C5 * *(unsigned __int8 *)v49)) >> 53);
      v49 = (unint64_t *)((char *)v49 + 1);
    }
    unint64_t v47 = 0x165667B19E3779F9
        * ((0xC2B2AE3D27D4EB4FLL * (v45 ^ (v45 >> 33))) ^ ((0xC2B2AE3D27D4EB4FLL * (v45 ^ (v45 >> 33))) >> 29));
    return v47 ^ HIDWORD(v47);
  }
}

void *XXH32_createState()
{
  return XXH_malloc(0x30uLL);
}

void *XXH_malloc(size_t a1)
{
  return malloc_type_malloc(a1, 0x6E4DABBAuLL);
}

uint64_t XXH32_freeState(void *a1)
{
  return 0;
}

void XXH_free(void *a1)
{
}

void *XXH64_createState()
{
  return XXH_malloc(0x58uLL);
}

uint64_t XXH64_freeState(void *a1)
{
  return 0;
}

uint64_t XXH32_reset(uint64_t a1, int a2)
{
  uint64_t v5 = a1;
  int v4 = a2;
  memset(__b, 0, sizeof(__b));
  __b[2] = v4;
  __b[3] = v4 + 606290984;
  __b[4] = v4 - 2048144777;
  __b[5] = v4;
  __b[6] = v4 + 1640531535;
  __memcpy_chk();
  return 0;
}

uint64_t XXH64_reset(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = a1;
  uint64_t v4 = a2;
  memset(__b, 0, sizeof(__b));
  __b[1] = v4;
  __b[2] = v4 + 0x60EA27EEADC0B5D6;
  __b[3] = v4 - 0x3D4D51C2D82B14B1;
  __b[4] = v4;
  __b[5] = v4 + 0x61C8864E7A143579;
  __memcpy_chk();
  return 0;
}

uint64_t XXH32_update(uint64_t a1, unsigned int *a2, uint64_t a3)
{
  int v12 = a3;
  if (g_one == 1)
  {
    int v29 = a3;
    uint64_t v27 = a2;
    unint64_t v26 = (unint64_t)a2 + a3;
    *(void *)a1 += a3;
    if ((unint64_t)*(unsigned int *)(a1 + 44) + a3 >= 0x10)
    {
      if (*(_DWORD *)(a1 + 44))
      {
        XXH_memcpy();
        *(_DWORD *)(a1 + 12) -= 2048144777 * XXH_read32((unsigned int *)(a1 + 28));
        *(_DWORD *)(a1 + 12) = (*(_DWORD *)(a1 + 12) >> 19) | (*(_DWORD *)(a1 + 12) << 13);
        *(_DWORD *)(a1 + 12) *= -1640531535;
        *(_DWORD *)(a1 + 16) -= 2048144777 * XXH_read32((unsigned int *)(a1 + 32));
        *(_DWORD *)(a1 + 16) = (*(_DWORD *)(a1 + 16) >> 19) | (*(_DWORD *)(a1 + 16) << 13);
        *(_DWORD *)(a1 + 16) *= -1640531535;
        *(_DWORD *)(a1 + 20) -= 2048144777 * XXH_read32((unsigned int *)(a1 + 36));
        *(_DWORD *)(a1 + 20) = (*(_DWORD *)(a1 + 20) >> 19) | (*(_DWORD *)(a1 + 20) << 13);
        *(_DWORD *)(a1 + 20) *= -1640531535;
        *(_DWORD *)(a1 + 24) -= 2048144777 * XXH_read32((unsigned int *)(a1 + 40));
        *(_DWORD *)(a1 + 24) = (*(_DWORD *)(a1 + 24) >> 19) | (*(_DWORD *)(a1 + 24) << 13);
        *(_DWORD *)(a1 + 24) *= -1640531535;
        uint64_t v27 = (unsigned int *)((char *)v27 + (16 - *(_DWORD *)(a1 + 44)));
        *(_DWORD *)(a1 + 44) = 0;
      }
      if ((unint64_t)v27 <= v26 - 16)
      {
        unsigned int v25 = *(_DWORD *)(a1 + 12);
        unsigned int v24 = *(_DWORD *)(a1 + 16);
        unsigned int v23 = *(_DWORD *)(a1 + 20);
        unsigned int v22 = *(_DWORD *)(a1 + 24);
        do
        {
          int v34 = XXH_read32(v27);
          unsigned int v25 = -1640531535 * (((v25 - 2048144777 * v34) >> 19) | ((v25 - 2048144777 * v34) << 13));
          unint64_t v28 = v27 + 1;
          int v33 = XXH_read32(v28);
          unsigned int v24 = -1640531535 * (((v24 - 2048144777 * v33) >> 19) | ((v24 - 2048144777 * v33) << 13));
          int v32 = XXH_read32(++v28);
          unsigned int v23 = -1640531535 * (((v23 - 2048144777 * v32) >> 19) | ((v23 - 2048144777 * v32) << 13));
          int v31 = XXH_read32(++v28);
          unsigned int v22 = -1640531535 * (((v22 - 2048144777 * v31) >> 19) | ((v22 - 2048144777 * v31) << 13));
          uint64_t v27 = v28 + 1;
        }
        while ((unint64_t)v27 <= v26 - 16);
        *(_DWORD *)(a1 + 12) = v25;
        *(_DWORD *)(a1 + 16) = v24;
        *(_DWORD *)(a1 + 20) = v23;
        *(_DWORD *)(a1 + 24) = v22;
      }
      if ((unint64_t)v27 < v26)
      {
        XXH_memcpy();
        *(_DWORD *)(a1 + 44) = v26 - v27;
      }
    }
    else
    {
      XXH_memcpy();
      *(_DWORD *)(a1 + 44) += v29;
    }
  }
  else
  {
    unint64_t v20 = a2;
    unint64_t v19 = (unint64_t)a2 + a3;
    *(void *)a1 += a3;
    if ((unint64_t)*(unsigned int *)(a1 + 44) + a3 >= 0x10)
    {
      if (*(_DWORD *)(a1 + 44))
      {
        XXH_memcpy();
        unsigned int v3 = XXH_read32((unsigned int *)(a1 + 28));
        *(_DWORD *)(a1 + 12) -= 2048144777 * XXH_swap32(v3);
        *(_DWORD *)(a1 + 12) = (*(_DWORD *)(a1 + 12) >> 19) | (*(_DWORD *)(a1 + 12) << 13);
        *(_DWORD *)(a1 + 12) *= -1640531535;
        unsigned int v4 = XXH_read32((unsigned int *)(a1 + 32));
        *(_DWORD *)(a1 + 16) -= 2048144777 * XXH_swap32(v4);
        *(_DWORD *)(a1 + 16) = (*(_DWORD *)(a1 + 16) >> 19) | (*(_DWORD *)(a1 + 16) << 13);
        *(_DWORD *)(a1 + 16) *= -1640531535;
        unsigned int v5 = XXH_read32((unsigned int *)(a1 + 36));
        *(_DWORD *)(a1 + 20) -= 2048144777 * XXH_swap32(v5);
        *(_DWORD *)(a1 + 20) = (*(_DWORD *)(a1 + 20) >> 19) | (*(_DWORD *)(a1 + 20) << 13);
        *(_DWORD *)(a1 + 20) *= -1640531535;
        unsigned int v6 = XXH_read32((unsigned int *)(a1 + 40));
        *(_DWORD *)(a1 + 24) -= 2048144777 * XXH_swap32(v6);
        *(_DWORD *)(a1 + 24) = (*(_DWORD *)(a1 + 24) >> 19) | (*(_DWORD *)(a1 + 24) << 13);
        *(_DWORD *)(a1 + 24) *= -1640531535;
        unint64_t v20 = (unsigned int *)((char *)a2 + (16 - *(_DWORD *)(a1 + 44)));
        *(_DWORD *)(a1 + 44) = 0;
      }
      if ((unint64_t)v20 <= v19 - 16)
      {
        unsigned int v18 = *(_DWORD *)(a1 + 12);
        unsigned int v17 = *(_DWORD *)(a1 + 16);
        unsigned int v16 = *(_DWORD *)(a1 + 20);
        unsigned int v15 = *(_DWORD *)(a1 + 24);
        do
        {
          unsigned int v7 = XXH_read32(v20);
          int v38 = XXH_swap32(v7);
          unsigned int v18 = -1640531535 * (((v18 - 2048144777 * v38) >> 19) | ((v18 - 2048144777 * v38) << 13));
          unint64_t v21 = v20 + 1;
          unsigned int v8 = XXH_read32(v21);
          int v37 = XXH_swap32(v8);
          unsigned int v17 = -1640531535 * (((v17 - 2048144777 * v37) >> 19) | ((v17 - 2048144777 * v37) << 13));
          unsigned int v9 = XXH_read32(++v21);
          int v36 = XXH_swap32(v9);
          unsigned int v16 = -1640531535 * (((v16 - 2048144777 * v36) >> 19) | ((v16 - 2048144777 * v36) << 13));
          unsigned int v10 = XXH_read32(++v21);
          int v35 = XXH_swap32(v10);
          unsigned int v15 = -1640531535 * (((v15 - 2048144777 * v35) >> 19) | ((v15 - 2048144777 * v35) << 13));
          unint64_t v20 = v21 + 1;
        }
        while ((unint64_t)v20 <= v19 - 16);
        *(_DWORD *)(a1 + 12) = v18;
        *(_DWORD *)(a1 + 16) = v17;
        *(_DWORD *)(a1 + 20) = v16;
        *(_DWORD *)(a1 + 24) = v15;
      }
      if ((unint64_t)v20 < v19)
      {
        XXH_memcpy();
        *(_DWORD *)(a1 + 44) = v19 - v20;
      }
    }
    else
    {
      XXH_memcpy();
      *(_DWORD *)(a1 + 44) += v12;
    }
  }
  return 0;
}

uint64_t XXH32_digest(uint64_t a1)
{
  if (g_one == 1)
  {
    uint64_t v13 = (unsigned int *)(a1 + 28);
    unint64_t v12 = a1 + 28 + *(unsigned int *)(a1 + 44);
    if (*(void *)a1 < 0x10uLL) {
      int v9 = *(_DWORD *)(a1 + 8) + 374761393;
    }
    else {
      int v9 = ((*(_DWORD *)(a1 + 12) >> 31) | (2 * *(_DWORD *)(a1 + 12)))
    }
         + ((*(_DWORD *)(a1 + 16) >> 25) | (*(_DWORD *)(a1 + 16) << 7))
         + ((*(_DWORD *)(a1 + 20) >> 20) | (*(_DWORD *)(a1 + 20) << 12))
         + ((*(_DWORD *)(a1 + 24) >> 14) | (*(_DWORD *)(a1 + 24) << 18));
    unsigned int v10 = v9 + *(void *)a1;
    while ((unint64_t)(v13 + 1) <= v12)
    {
      int v14 = XXH_read32(v13);
      unsigned int v10 = 668265263 * (((v10 - 1028477379 * v14) >> 15) | ((v10 - 1028477379 * v14) << 17));
      ++v13;
    }
    while ((unint64_t)v13 < v12)
    {
      unsigned int v10 = -1640531535
          * (((v10 + 374761393 * *(unsigned __int8 *)v13) >> 21) | ((v10 + 374761393 * *(unsigned __int8 *)v13) << 11));
      uint64_t v13 = (unsigned int *)((char *)v13 + 1);
    }
    unsigned int v11 = -1028477379 * ((-2048144777 * (v10 ^ (v10 >> 15))) ^ ((-2048144777 * (v10 ^ (v10 >> 15))) >> 13));
    return v11 ^ HIWORD(v11);
  }
  else
  {
    unsigned int v8 = (unsigned int *)(a1 + 28);
    unint64_t v7 = a1 + 28 + *(unsigned int *)(a1 + 44);
    if (*(void *)a1 < 0x10uLL) {
      int v4 = *(_DWORD *)(a1 + 8) + 374761393;
    }
    else {
      int v4 = ((*(_DWORD *)(a1 + 12) >> 31) | (2 * *(_DWORD *)(a1 + 12)))
    }
         + ((*(_DWORD *)(a1 + 16) >> 25) | (*(_DWORD *)(a1 + 16) << 7))
         + ((*(_DWORD *)(a1 + 20) >> 20) | (*(_DWORD *)(a1 + 20) << 12))
         + ((*(_DWORD *)(a1 + 24) >> 14) | (*(_DWORD *)(a1 + 24) << 18));
    unsigned int v5 = v4 + *(void *)a1;
    while ((unint64_t)(v8 + 1) <= v7)
    {
      unsigned int v1 = XXH_read32(v8);
      int v15 = XXH_swap32(v1);
      unsigned int v5 = 668265263 * (((v5 - 1028477379 * v15) >> 15) | ((v5 - 1028477379 * v15) << 17));
      ++v8;
    }
    while ((unint64_t)v8 < v7)
    {
      unsigned int v5 = -1640531535
         * (((v5 + 374761393 * *(unsigned __int8 *)v8) >> 21) | ((v5 + 374761393 * *(unsigned __int8 *)v8) << 11));
      unsigned int v8 = (unsigned int *)((char *)v8 + 1);
    }
    unsigned int v6 = -1028477379 * ((-2048144777 * (v5 ^ (v5 >> 15))) ^ ((-2048144777 * (v5 ^ (v5 >> 15))) >> 13));
    return v6 ^ HIWORD(v6);
  }
}

uint64_t XXH64_update(uint64_t a1, unint64_t a2, uint64_t a3)
{
  int v20 = a3;
  if (g_one == 1)
  {
    int v37 = a3;
    unint64_t v35 = a2;
    unint64_t v34 = a2 + a3;
    *(void *)a1 += a3;
    if ((unint64_t)*(unsigned int *)(a1 + 80) + a3 >= 0x20)
    {
      if (*(_DWORD *)(a1 + 80))
      {
        XXH_memcpy();
        *(void *)(a1 + 16) -= 0x3D4D51C2D82B14B1 * XXH_read64(a1 + 48);
        *(void *)(a1 + 16) = (*(void *)(a1 + 16) >> 33) | (*(void *)(a1 + 16) << 31);
        *(void *)(a1 + 16) *= 0x9E3779B185EBCA87;
        *(void *)(a1 + 24) -= 0x3D4D51C2D82B14B1 * XXH_read64(a1 + 56);
        *(void *)(a1 + 24) = (*(void *)(a1 + 24) >> 33) | (*(void *)(a1 + 24) << 31);
        *(void *)(a1 + 24) *= 0x9E3779B185EBCA87;
        *(void *)(a1 + 32) -= 0x3D4D51C2D82B14B1 * XXH_read64(a1 + 64);
        *(void *)(a1 + 32) = (*(void *)(a1 + 32) >> 33) | (*(void *)(a1 + 32) << 31);
        *(void *)(a1 + 32) *= 0x9E3779B185EBCA87;
        *(void *)(a1 + 40) -= 0x3D4D51C2D82B14B1 * XXH_read64(a1 + 72);
        *(void *)(a1 + 40) = (*(void *)(a1 + 40) >> 33) | (*(void *)(a1 + 40) << 31);
        *(void *)(a1 + 40) *= 0x9E3779B185EBCA87;
        v35 += (32 - *(_DWORD *)(a1 + 80));
        *(_DWORD *)(a1 + 80) = 0;
      }
      if (v35 + 32 <= v34)
      {
        uint64_t v33 = *(void *)(a1 + 16);
        uint64_t v32 = *(void *)(a1 + 24);
        unint64_t v31 = *(void *)(a1 + 32);
        unint64_t v30 = *(void *)(a1 + 40);
        do
        {
          uint64_t v19 = XXH_read64(v35);
          uint64_t v33 = 0x9E3779B185EBCA87
              * ((__int128)__PAIR128__(v33 - 0x3D4D51C2D82B14B1 * v19, v33 - 0x3D4D51C2D82B14B1 * v19) >> 33);
          uint64_t v36 = v35 + 8;
          uint64_t v18 = XXH_read64(v36);
          uint64_t v32 = 0x9E3779B185EBCA87
              * ((__int128)__PAIR128__(v32 - 0x3D4D51C2D82B14B1 * v18, v32 - 0x3D4D51C2D82B14B1 * v18) >> 33);
          v36 += 8;
          uint64_t v17 = XXH_read64(v36);
          unint64_t v31 = 0x9E3779B185EBCA87
              * (((v31 - 0x3D4D51C2D82B14B1 * v17) >> 33) | ((v31 - 0x3D4D51C2D82B14B1 * v17) << 31));
          v36 += 8;
          uint64_t v16 = XXH_read64(v36);
          unint64_t v30 = 0x9E3779B185EBCA87
              * (((v30 - 0x3D4D51C2D82B14B1 * v16) >> 33) | ((v30 - 0x3D4D51C2D82B14B1 * v16) << 31));
          unint64_t v35 = v36 + 8;
        }
        while (v35 <= v34 - 32);
        *(void *)(a1 + 16) = v33;
        *(void *)(a1 + 24) = v32;
        *(void *)(a1 + 32) = v31;
        *(void *)(a1 + 40) = v30;
      }
      if (v35 < v34)
      {
        XXH_memcpy();
        *(_DWORD *)(a1 + 80) = v34 - v35;
      }
    }
    else
    {
      XXH_memcpy();
      *(_DWORD *)(a1 + 80) += v37;
    }
  }
  else
  {
    unint64_t v28 = a2;
    unint64_t v27 = a2 + a3;
    *(void *)a1 += a3;
    if ((unint64_t)*(unsigned int *)(a1 + 80) + a3 >= 0x20)
    {
      if (*(_DWORD *)(a1 + 80))
      {
        XXH_memcpy();
        unint64_t v3 = XXH_read64(a1 + 48);
        *(void *)(a1 + 16) -= 0x3D4D51C2D82B14B1 * XXH_swap64(v3);
        *(void *)(a1 + 16) = (*(void *)(a1 + 16) >> 33) | (*(void *)(a1 + 16) << 31);
        *(void *)(a1 + 16) *= 0x9E3779B185EBCA87;
        unint64_t v4 = XXH_read64(a1 + 56);
        *(void *)(a1 + 24) -= 0x3D4D51C2D82B14B1 * XXH_swap64(v4);
        *(void *)(a1 + 24) = (*(void *)(a1 + 24) >> 33) | (*(void *)(a1 + 24) << 31);
        *(void *)(a1 + 24) *= 0x9E3779B185EBCA87;
        unint64_t v5 = XXH_read64(a1 + 64);
        *(void *)(a1 + 32) -= 0x3D4D51C2D82B14B1 * XXH_swap64(v5);
        *(void *)(a1 + 32) = (*(void *)(a1 + 32) >> 33) | (*(void *)(a1 + 32) << 31);
        *(void *)(a1 + 32) *= 0x9E3779B185EBCA87;
        unint64_t v6 = XXH_read64(a1 + 72);
        *(void *)(a1 + 40) -= 0x3D4D51C2D82B14B1 * XXH_swap64(v6);
        *(void *)(a1 + 40) = (*(void *)(a1 + 40) >> 33) | (*(void *)(a1 + 40) << 31);
        *(void *)(a1 + 40) *= 0x9E3779B185EBCA87;
        unint64_t v28 = a2 + (32 - *(_DWORD *)(a1 + 80));
        *(_DWORD *)(a1 + 80) = 0;
      }
      if (v28 + 32 <= v27)
      {
        unint64_t v26 = *(void *)(a1 + 16);
        unint64_t v25 = *(void *)(a1 + 24);
        unint64_t v24 = *(void *)(a1 + 32);
        unint64_t v23 = *(void *)(a1 + 40);
        do
        {
          unint64_t v7 = XXH_read64(v28);
          uint64_t v15 = XXH_swap64(v7);
          unint64_t v26 = 0x9E3779B185EBCA87
              * (((v26 - 0x3D4D51C2D82B14B1 * v15) >> 33) | ((v26 - 0x3D4D51C2D82B14B1 * v15) << 31));
          uint64_t v29 = v28 + 8;
          unint64_t v8 = XXH_read64(v29);
          uint64_t v14 = XXH_swap64(v8);
          unint64_t v25 = 0x9E3779B185EBCA87
              * (((v25 - 0x3D4D51C2D82B14B1 * v14) >> 33) | ((v25 - 0x3D4D51C2D82B14B1 * v14) << 31));
          v29 += 8;
          unint64_t v9 = XXH_read64(v29);
          uint64_t v13 = XXH_swap64(v9);
          unint64_t v24 = 0x9E3779B185EBCA87
              * (((v24 - 0x3D4D51C2D82B14B1 * v13) >> 33) | ((v24 - 0x3D4D51C2D82B14B1 * v13) << 31));
          v29 += 8;
          unint64_t v10 = XXH_read64(v29);
          uint64_t v12 = XXH_swap64(v10);
          unint64_t v23 = 0x9E3779B185EBCA87
              * (((v23 - 0x3D4D51C2D82B14B1 * v12) >> 33) | ((v23 - 0x3D4D51C2D82B14B1 * v12) << 31));
          unint64_t v28 = v29 + 8;
        }
        while (v28 <= v27 - 32);
        *(void *)(a1 + 16) = v26;
        *(void *)(a1 + 24) = v25;
        *(void *)(a1 + 32) = v24;
        *(void *)(a1 + 40) = v23;
      }
      if (v28 < v27)
      {
        XXH_memcpy();
        *(_DWORD *)(a1 + 80) = v27 - v28;
      }
    }
    else
    {
      XXH_memcpy();
      *(_DWORD *)(a1 + 80) += v20;
    }
  }
  return 0;
}

unint64_t XXH64_digest(uint64_t a1)
{
  if (g_one == 1)
  {
    unint64_t v25 = (unsigned int *)(a1 + 48);
    unint64_t v24 = a1 + 48 + *(unsigned int *)(a1 + 80);
    if (*(void *)a1 < 0x20uLL)
    {
      uint64_t v20 = *(void *)(a1 + 8) + 0x27D4EB2F165667C5;
    }
    else
    {
      unint64_t v19 = *(void *)(a1 + 24);
      unint64_t v18 = *(void *)(a1 + 32);
      unint64_t v1 = *(void *)(a1 + 40);
      uint64_t v20 = 0x9E3779B185EBCA87
          * ((0x9E3779B185EBCA87
            * ((0x9E3779B185EBCA87
              * ((0x9E3779B185EBCA87
                * ((((*(void *)(a1 + 16) >> 63) | (2 * *(void *)(a1 + 16)))
                  + ((v19 >> 57) | (v19 << 7))
                  + ((v18 >> 52) | (v18 << 12))
                  + ((v1 >> 46) | (v1 << 18))) ^ (0x9E3779B185EBCA87
                                                * (((0xC2B2AE3D27D4EB4FLL * *(void *)(a1 + 16)) >> 33) | (0x93EA75A780000000 * *(void *)(a1 + 16)))))
                - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87
                                         * (((0xC2B2AE3D27D4EB4FLL * v19) >> 33) | (0x93EA75A780000000 * v19))))
              - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87
                                       * (((0xC2B2AE3D27D4EB4FLL * v18) >> 33) | (0x93EA75A780000000 * v18))))
            - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87
                                     * (((0xC2B2AE3D27D4EB4FLL * v1) >> 33) | (0x93EA75A780000000 * v1))))
          - 0x7A1435883D4D519DLL;
    }
    unint64_t v21 = v20 + *(void *)a1;
    while ((unint64_t)(v25 + 2) <= v24)
    {
      uint64_t v8 = XXH_read64((uint64_t)v25);
      unint64_t v22 = v21 ^ (0x9E3779B185EBCA87 * (((0xC2B2AE3D27D4EB4FLL * v8) >> 33) | (0x93EA75A780000000 * v8)));
      unint64_t v21 = 0x9E3779B185EBCA87 * ((v22 >> 37) | (v22 << 27)) - 0x7A1435883D4D519DLL;
      v25 += 2;
    }
    if ((unint64_t)(v25 + 1) <= v24)
    {
      unsigned int v26 = XXH_read32(v25);
      unint64_t v21 = 0xC2B2AE3D27D4EB4FLL
          * (((v21 ^ (0x9E3779B185EBCA87 * v26)) >> 41) | ((v21 ^ (0x9E3779B185EBCA87 * v26)) << 23))
          + 0x165667B19E3779F9;
      ++v25;
    }
    while ((unint64_t)v25 < v24)
    {
      unint64_t v21 = 0x9E3779B185EBCA87
          * (((v21 ^ (0x27D4EB2F165667C5 * *(unsigned __int8 *)v25)) >> 53) | ((v21 ^ (0x27D4EB2F165667C5
                                                                                       * *(unsigned __int8 *)v25)) << 11));
      unint64_t v25 = (unsigned int *)((char *)v25 + 1);
    }
    unint64_t v23 = 0x165667B19E3779F9
        * ((0xC2B2AE3D27D4EB4FLL * (v21 ^ (v21 >> 33))) ^ ((0xC2B2AE3D27D4EB4FLL * (v21 ^ (v21 >> 33))) >> 29));
    return v23 ^ HIDWORD(v23);
  }
  else
  {
    uint64_t v17 = (unsigned int *)(a1 + 48);
    unint64_t v16 = a1 + 48 + *(unsigned int *)(a1 + 80);
    if (*(void *)a1 < 0x20uLL)
    {
      uint64_t v14 = *(void *)(a1 + 8) + 0x27D4EB2F165667C5;
    }
    else
    {
      unint64_t v13 = *(void *)(a1 + 16);
      unint64_t v12 = *(void *)(a1 + 24);
      unint64_t v11 = *(void *)(a1 + 32);
      unint64_t v2 = *(void *)(a1 + 40);
      uint64_t v14 = 0x9E3779B185EBCA87
          * ((0x9E3779B185EBCA87
            * ((0x9E3779B185EBCA87
              * ((0x9E3779B185EBCA87
                * ((((v13 >> 63) | (2 * v13))
                  + ((v12 >> 57) | (v12 << 7))
                  + ((v11 >> 52) | (v11 << 12))
                  + ((v2 >> 46) | (v2 << 18))) ^ (0x9E3779B185EBCA87
                                                * (((0xC2B2AE3D27D4EB4FLL * v13) >> 33) | (0x93EA75A780000000 * v13))))
                - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87
                                         * (((0xC2B2AE3D27D4EB4FLL * v12) >> 33) | (0x93EA75A780000000 * v12))))
              - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87
                                       * (((0xC2B2AE3D27D4EB4FLL * v11) >> 33) | (0x93EA75A780000000 * v11))))
            - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87
                                     * (((0xC2B2AE3D27D4EB4FLL * v2) >> 33) | (0x93EA75A780000000 * v2))))
          - 0x7A1435883D4D519DLL;
    }
    unint64_t v15 = v14 + *(void *)a1;
    while ((unint64_t)(v17 + 2) <= v16)
    {
      unint64_t v3 = XXH_read64((uint64_t)v17);
      uint64_t v7 = XXH_swap64(v3);
      unint64_t v10 = 0x9E3779B185EBCA87 * (((0xC2B2AE3D27D4EB4FLL * v7) >> 33) | (0x93EA75A780000000 * v7));
      unint64_t v15 = 0x9E3779B185EBCA87 * (((v15 ^ v10) >> 37) | ((v15 ^ v10) << 27)) - 0x7A1435883D4D519DLL;
      v17 += 2;
    }
    if ((unint64_t)(v17 + 1) <= v16)
    {
      unsigned int v4 = XXH_read32(v17);
      unsigned int v27 = XXH_swap32(v4);
      unint64_t v15 = 0xC2B2AE3D27D4EB4FLL
          * (((v15 ^ (0x9E3779B185EBCA87 * v27)) >> 41) | ((v15 ^ (0x9E3779B185EBCA87 * v27)) << 23))
          + 0x165667B19E3779F9;
      ++v17;
    }
    while ((unint64_t)v17 < v16)
    {
      unint64_t v15 = 0x9E3779B185EBCA87
          * (((v15 ^ (0x27D4EB2F165667C5 * *(unsigned __int8 *)v17)) >> 53) | ((v15 ^ (0x27D4EB2F165667C5
                                                                                       * *(unsigned __int8 *)v17)) << 11));
      uint64_t v17 = (unsigned int *)((char *)v17 + 1);
    }
    unint64_t v5 = 0x165667B19E3779F9
       * ((0xC2B2AE3D27D4EB4FLL * (v15 ^ (v15 >> 33))) ^ ((0xC2B2AE3D27D4EB4FLL * (v15 ^ (v15 >> 33))) >> 29));
    return v5 ^ HIDWORD(v5);
  }
}

uint64_t XXH32_canonicalFromHash(uint64_t a1, unsigned int a2)
{
  if (g_one) {
    XXH_swap32(a2);
  }
  return __memcpy_chk();
}

uint64_t XXH_swap32(unsigned int a1)
{
  return (a1 << 24) | (a1 << 8) & 0xFF0000 | (a1 >> 8) & 0xFF00 | HIBYTE(a1);
}

uint64_t XXH64_canonicalFromHash(uint64_t a1, unint64_t a2)
{
  if (g_one) {
    XXH_swap64(a2);
  }
  return __memcpy_chk();
}

uint64_t XXH_swap64(unint64_t a1)
{
  return (a1 << 56) | (a1 << 40) & 0xFF000000000000 | (a1 << 24) & 0xFF0000000000 | (a1 << 8) & 0xFF00000000 | (a1 >> 8) & 0xFF000000 | (a1 >> 24) & 0xFF0000 | (a1 >> 40) & 0xFF00 | HIBYTE(a1);
}

uint64_t XXH32_hashFromCanonical(unsigned int *a1)
{
  return XXH_readBE32(a1);
}

uint64_t XXH_readBE32(unsigned int *a1)
{
  if (g_one)
  {
    unsigned int v1 = XXH_read32(a1);
    return XXH_swap32(v1);
  }
  else
  {
    return XXH_read32(a1);
  }
}

uint64_t XXH64_hashFromCanonical(uint64_t a1)
{
  return XXH_readBE64(a1);
}

uint64_t XXH_readBE64(uint64_t a1)
{
  if (!g_one) {
    return XXH_read64(a1);
  }
  unint64_t v1 = XXH_read64(a1);
  return XXH_swap64(v1);
}

uint64_t XXH_read32(unsigned int *a1)
{
  return *a1;
}

uint64_t XXH_read64(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t XXH_memcpy()
{
  return __memcpy_chk();
}

void sub_2290EE474(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  *(void *)(v10 - 40) = a1;
  *(_DWORD *)(v10 - 44) = a2;
  objc_destroyWeak((id *)(v10 - 32));
  _Unwind_Resume(*(_Unwind_Exception **)(v10 - 40));
}

void sub_2290F11F8(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  *(void *)(v10 - 32) = a1;
  *(_DWORD *)(v10 - 36) = a2;
  objc_destroyWeak((id *)(v10 - 24));
  _Unwind_Resume(*(_Unwind_Exception **)(v10 - 32));
}

void sub_2290F1854(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  *(void *)(v9 - 40) = a1;
  *(_DWORD *)(v9 - 44) = a2;
  objc_destroyWeak((id *)(v9 - 24));
  _Unwind_Resume(*(_Unwind_Exception **)(v9 - 40));
}

void sub_2290F4058(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  *(void *)(v10 - 64) = a1;
  *(_DWORD *)(v10 - 68) = a2;
  objc_destroyWeak((id *)(v10 - 56));
  _Unwind_Resume(*(_Unwind_Exception **)(v10 - 64));
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  unint64_t v2 = *(void **)(a2 + 40);
  unint64_t v3 = (id *)(a1 + 40);
  *unint64_t v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

BOOL __CGSizeEqualToSize_0(double a1, double a2, double a3, double a4)
{
  BOOL v5 = 0;
  if (a1 == a3) {
    return a2 == a4;
  }
  return v5;
}

void sub_2290F79D4(uint64_t a1, int a2)
{
  *(void *)(v2 - 128) = a1;
  *(_DWORD *)(v2 - 132) = a2;
  _Block_object_dispose((const void *)(v2 - 112), 8);
  _Unwind_Resume(*(_Unwind_Exception **)(v2 - 128));
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  uint64_t v2 = *(void **)(a2 + 40);
  unint64_t v3 = (id *)(a1 + 40);
  *unint64_t v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_2290F86B4(uint64_t a1, int a2)
{
  *(void *)(v2 - 104) = a1;
  *(_DWORD *)(v2 - 108) = a2;
  _Block_object_dispose((const void *)(v2 - 88), 8);
  _Unwind_Resume(*(_Unwind_Exception **)(v2 - 104));
}

void sub_2290FA708(uint64_t a1, int a2)
{
  *(void *)(v2 - 216) = a1;
  *(_DWORD *)(v2 - 220) = a2;
  _Block_object_dispose((const void *)(v2 - 136), 8);
  _Block_object_dispose((const void *)(v2 - 104), 8);
  _Unwind_Resume(*(_Unwind_Exception **)(v2 - 216));
}

id UIImageWithContentsOfFile(void *a1, char a2)
{
  id location = 0;
  objc_storeStrong(&location, a1);
  char v9 = a2 & 1;
  unint64_t v12 = (dispatch_once_t *)&UIImageWithContentsOfFile_onceToken;
  id v11 = 0;
  objc_storeStrong(&v11, &__block_literal_global_36);
  if (*v12 != -1) {
    dispatch_once(v12, v11);
  }
  objc_storeStrong(&v11, 0);
  id v8 = 0;
  [(id)UIImageWithContentsOfFile_lock lock];
  if (v9)
  {
    [(id)UIImageWithContentsOfFile_pathToWeakImageMap removeObjectForKey:location];
  }
  else
  {
    id v2 = (id)[(id)UIImageWithContentsOfFile_pathToWeakImageMap objectForKey:location];
    id v3 = v8;
    id v8 = v2;
  }
  [(id)UIImageWithContentsOfFile_lock unlock];
  if (!v8)
  {
    id v4 = objc_alloc(MEMORY[0x263F827E8]);
    id v8 = (id)[v4 initWithContentsOfFile:location];

    [(id)UIImageWithContentsOfFile_lock lock];
    [(id)UIImageWithContentsOfFile_pathToWeakImageMap setObject:v8 forKey:location];
    [(id)UIImageWithContentsOfFile_lock unlock];
  }
  id v6 = v8;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&location, 0);
  return v6;
}

void __Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  id v2 = *(void **)(a2 + 40);
  id v3 = (id *)(a1 + 40);
  *id v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void __UIImageWithContentsOfFile_block_invoke(uint64_t a1)
{
  id v1 = (id)objc_msgSend(MEMORY[0x263F08968], "strongToWeakObjectsMapTable", a1, a1);
  id v2 = (void *)UIImageWithContentsOfFile_pathToWeakImageMap;
  UIImageWithContentsOfFile_pathToWeakImageMap = (uint64_t)v1;

  id v3 = objc_alloc_init(MEMORY[0x263F08958]);
  id v4 = (void *)UIImageWithContentsOfFile_lock;
  UIImageWithContentsOfFile_lock = (uint64_t)v3;
}

void sub_2290FBDF0()
{
  _Unwind_Resume(v0);
}

uint64_t LoadCentralDirectoryRecord(uint64_t a1)
{
  uint64_t v22 = a1;
  unsigned int v21 = 0;
  unint64_t v20 = 0;
  unint64_t v19 = 0;
  unint64_t v18 = 0;
  unint64_t v17 = 0;
  unint64_t v16 = 0;
  uint64_t v15 = 0;
  uint64_t v14 = 0;
  unint64_t v13 = 0;
  unint64_t v12 = 0;
  uint64_t v11 = 0;
  uint64_t v10 = 0;
  uint64_t v9 = 0;
  int v8 = 0;
  unint64_t v17 = zip64local_SearchCentralDir64(a1, *(void *)(a1 + 88));
  if (v17) {
    int v8 = 1;
  }
  else {
    unint64_t v17 = zip64local_SearchCentralDir(v22, *(void *)(v22 + 88));
  }
  if (v8)
  {
    uint64_t v7 = 0;
    if (call_zseek64(v22, *(void *)(v22 + 88), v17, 0)) {
      unsigned int v21 = -1;
    }
    if (zip64local_getLong(v22, *(void *)(v22 + 88), &v16)) {
      unsigned int v21 = -1;
    }
    if (zip64local_getLong64(v22, *(void *)(v22 + 88), &v7)) {
      unsigned int v21 = -1;
    }
    if (zip64local_getShort(v22, *(void *)(v22 + 88), &v11)) {
      unsigned int v21 = -1;
    }
    if (zip64local_getShort(v22, *(void *)(v22 + 88), &v10)) {
      unsigned int v21 = -1;
    }
    if (zip64local_getLong(v22, *(void *)(v22 + 88), &v15)) {
      unsigned int v21 = -1;
    }
    if (zip64local_getLong(v22, *(void *)(v22 + 88), &v14)) {
      unsigned int v21 = -1;
    }
    if (zip64local_getLong64(v22, *(void *)(v22 + 88), &v13)) {
      unsigned int v21 = -1;
    }
    if (zip64local_getLong64(v22, *(void *)(v22 + 88), &v12)) {
      unsigned int v21 = -1;
    }
    if (v12 != v13 || v14 || v15) {
      unsigned int v21 = -103;
    }
    if (zip64local_getLong64(v22, *(void *)(v22 + 88), &v19)) {
      unsigned int v21 = -1;
    }
    if (zip64local_getLong64(v22, *(void *)(v22 + 88), &v18)) {
      unsigned int v21 = -1;
    }
    uint64_t v9 = 0;
  }
  else
  {
    if (call_zseek64(v22, *(void *)(v22 + 88), v17, 0)) {
      unsigned int v21 = -1;
    }
    if (zip64local_getLong(v22, *(void *)(v22 + 88), &v16)) {
      unsigned int v21 = -1;
    }
    if (zip64local_getShort(v22, *(void *)(v22 + 88), &v15)) {
      unsigned int v21 = -1;
    }
    if (zip64local_getShort(v22, *(void *)(v22 + 88), &v14)) {
      unsigned int v21 = -1;
    }
    unint64_t v13 = 0;
    if (zip64local_getShort(v22, *(void *)(v22 + 88), &v16)) {
      unsigned int v21 = -1;
    }
    else {
      unint64_t v13 = v16;
    }
    unint64_t v12 = 0;
    if (zip64local_getShort(v22, *(void *)(v22 + 88), &v16)) {
      unsigned int v21 = -1;
    }
    else {
      unint64_t v12 = v16;
    }
    if (v12 != v13 || v14 || v15) {
      unsigned int v21 = -103;
    }
    unint64_t v19 = 0;
    if (zip64local_getLong(v22, *(void *)(v22 + 88), &v16)) {
      unsigned int v21 = -1;
    }
    else {
      unint64_t v19 = v16;
    }
    unint64_t v18 = 0;
    if (zip64local_getLong(v22, *(void *)(v22 + 88), &v16)) {
      unsigned int v21 = -1;
    }
    else {
      unint64_t v18 = v16;
    }
    if (zip64local_getShort(v22, *(void *)(v22 + 88), &v9)) {
      unsigned int v21 = -1;
    }
  }
  if (v17 < v18 + v19 && !v21) {
    unsigned int v21 = -103;
  }
  if (v21)
  {
    (*(void (**)(void, void))(v22 + 40))(*(void *)(v22 + 56), *(void *)(v22 + 88));
    return -1;
  }
  else
  {
    if (v9)
    {
      id v1 = malloc_type_malloc(v9 + 1, 0xFAC03D29uLL);
      *(void *)(v22 + 65944) = v1;
      if (*(void *)(v22 + 65944))
      {
        uint64_t v9 = (*(uint64_t (**)(void, void, void, uint64_t))(v22 + 8))(*(void *)(v22 + 56), *(void *)(v22 + 88), *(void *)(v22 + 65944), v9);
        *(unsigned char *)(*(void *)(v22 + 65944) + v9) = 0;
      }
    }
    unint64_t v20 = v17 - (v18 + v19);
    *(void *)(v22 + 65928) = v20;
    unint64_t v6 = v19;
    BOOL v5 = malloc_type_malloc(0xFF0uLL, 0xFA61B2B4uLL);
    if (call_zseek64(v22, *(void *)(v22 + 88), v18 + v20, 0)) {
      unsigned int v21 = -1;
    }
    while (1)
    {
      BOOL v3 = 0;
      if (v6) {
        BOOL v3 = v21 == 0;
      }
      if (!v3) {
        break;
      }
      unint64_t v4 = 4080;
      if (v6 < 0xFF0) {
        unint64_t v4 = v6;
      }
      if ((*(uint64_t (**)(void, void, void *, unint64_t))(v22 + 8))(*(void *)(v22 + 56), *(void *)(v22 + 88), v5, v4) != v4)unsigned int v21 = -1; {
      if (!v21)
      }
        unsigned int v21 = add_data_in_datablock((void *)(v22 + 96), (uint64_t)v5, v4);
      v6 -= v4;
    }
    if (v5) {
      free(v5);
    }
    *(void *)(v22 + 65920) = v20;
    *(void *)(v22 + 65936) = v12;
    if (call_zseek64(v22, *(void *)(v22 + 88), v18 + v20, 0)) {
      return -1;
    }
    return v21;
  }
}

uint64_t zip64local_SearchCentralDir64(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = a1;
  uint64_t v14 = a2;
  unint64_t v13 = 0;
  unint64_t v12 = 0;
  unint64_t v11 = 0;
  unint64_t v10 = 0xFFFFLL;
  uint64_t v9 = 0;
  uint64_t v8 = 0;
  uint64_t v7 = 0;
  if (call_zseek64(a1, a2, 0, 2u)) {
    return 0;
  }
  unint64_t v12 = call_ztell64(v15, v14);
  if (v10 > v12) {
    unint64_t v10 = v12;
  }
  unint64_t v13 = malloc_type_malloc(0x404uLL, 0x92DC3A43uLL);
  if (!v13) {
    return 0;
  }
  unint64_t v11 = 4;
  do
  {
    if (v11 >= v10) {
      break;
    }
    if (v11 + 1024 <= v10) {
      v11 += 1024;
    }
    else {
      unint64_t v11 = v10;
    }
    uint64_t v6 = v12 - v11;
    unint64_t v4 = v11 <= 0x404 ? v11 : 1028;
    if (call_zseek64(v15, v14, v6, 0)
      || (*(uint64_t (**)(void, uint64_t, unsigned char *, unint64_t))(v15 + 8))(*(void *)(v15 + 56), v14, v13, v4) != v4)
    {
      break;
    }
    int v5 = v4 - 3;
    while (1)
    {
      int v2 = v5--;
      if (v2 <= 0) {
        break;
      }
      if (v13[v5] == 80 && v13[v5 + 1] == 75 && v13[v5 + 2] == 6 && v13[v5 + 3] == 7)
      {
        uint64_t v9 = v6 + v5;
        break;
      }
    }
  }
  while (!v9);
  free(v13);
  if (!v9) {
    return 0;
  }
  if (call_zseek64(v15, v14, v9, 0)) {
    return 0;
  }
  if (zip64local_getLong(v15, v14, &v8)) {
    return 0;
  }
  if (zip64local_getLong(v15, v14, &v8)) {
    return 0;
  }
  if (v8) {
    return 0;
  }
  if (zip64local_getLong64(v15, v14, &v7)) {
    return 0;
  }
  if (zip64local_getLong(v15, v14, &v8)) {
    return 0;
  }
  if (v8 != 1) {
    return 0;
  }
  if (call_zseek64(v15, v14, v7, 0)) {
    return 0;
  }
  if (zip64local_getLong(v15, v14, &v8)) {
    return 0;
  }
  if (v8 == 101075792) {
    return v7;
  }
  return 0;
}

uint64_t zip64local_SearchCentralDir(uint64_t a1, uint64_t a2)
{
  unint64_t v8 = 0xFFFFLL;
  uint64_t v7 = 0;
  if (call_zseek64(a1, a2, 0, 2u)) {
    return 0;
  }
  unint64_t v10 = call_ztell64(a1, a2);
  if (v10 < 0xFFFF) {
    unint64_t v8 = v10;
  }
  unint64_t v11 = malloc_type_malloc(0x404uLL, 0x9C088CCEuLL);
  if (!v11) {
    return 0;
  }
  unint64_t v9 = 4;
  do
  {
    if (v9 >= v8) {
      break;
    }
    if (v9 + 1024 <= v8) {
      v9 += 1024;
    }
    else {
      unint64_t v9 = v8;
    }
    uint64_t v6 = v10 - v9;
    unint64_t v4 = v9 <= 0x404 ? v9 : 1028;
    if (call_zseek64(a1, a2, v6, 0)
      || (*(uint64_t (**)(void, uint64_t, unsigned char *, unint64_t))(a1 + 8))(*(void *)(a1 + 56), a2, v11, v4) != v4)
    {
      break;
    }
    int v5 = v4 - 3;
    while (1)
    {
      int v2 = v5--;
      if (v2 <= 0) {
        break;
      }
      if (v11[v5] == 80 && v11[v5 + 1] == 75 && v11[v5 + 2] == 5 && v11[v5 + 3] == 6)
      {
        uint64_t v7 = v6 + v5;
        break;
      }
    }
  }
  while (!v7);
  free(v11);
  return v7;
}

uint64_t zip64local_getLong(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = a1;
  uint64_t v8 = a2;
  uint64_t v7 = a3;
  uint64_t v6 = 0;
  int v5 = 0;
  unsigned int Byte = zip64local_getByte(a1, a2, &v5);
  uint64_t v6 = v5;
  if (!Byte) {
    unsigned int Byte = zip64local_getByte(v9, v8, &v5);
  }
  v6 += (uint64_t)v5 << 8;
  if (!Byte) {
    unsigned int Byte = zip64local_getByte(v9, v8, &v5);
  }
  v6 += (uint64_t)v5 << 16;
  if (!Byte) {
    unsigned int Byte = zip64local_getByte(v9, v8, &v5);
  }
  v6 += (uint64_t)v5 << 24;
  if (Byte) {
    *uint64_t v7 = 0;
  }
  else {
    *uint64_t v7 = v6;
  }
  return Byte;
}

uint64_t zip64local_getLong64(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = a1;
  uint64_t v8 = a2;
  uint64_t v7 = a3;
  uint64_t v6 = 0;
  int v5 = 0;
  unsigned int Byte = zip64local_getByte(a1, a2, &v5);
  uint64_t v6 = v5;
  if (!Byte) {
    unsigned int Byte = zip64local_getByte(v9, v8, &v5);
  }
  v6 += (uint64_t)v5 << 8;
  if (!Byte) {
    unsigned int Byte = zip64local_getByte(v9, v8, &v5);
  }
  v6 += (uint64_t)v5 << 16;
  if (!Byte) {
    unsigned int Byte = zip64local_getByte(v9, v8, &v5);
  }
  v6 += (uint64_t)v5 << 24;
  if (!Byte) {
    unsigned int Byte = zip64local_getByte(v9, v8, &v5);
  }
  v6 += (uint64_t)v5 << 32;
  if (!Byte) {
    unsigned int Byte = zip64local_getByte(v9, v8, &v5);
  }
  v6 += (uint64_t)v5 << 40;
  if (!Byte) {
    unsigned int Byte = zip64local_getByte(v9, v8, &v5);
  }
  v6 += (uint64_t)v5 << 48;
  if (!Byte) {
    unsigned int Byte = zip64local_getByte(v9, v8, &v5);
  }
  v6 += (uint64_t)v5 << 56;
  if (Byte) {
    *uint64_t v7 = 0;
  }
  else {
    *uint64_t v7 = v6;
  }
  return Byte;
}

uint64_t zip64local_getShort(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = a1;
  uint64_t v8 = a2;
  uint64_t v7 = a3;
  uint64_t v6 = 0;
  int v5 = 0;
  unsigned int Byte = zip64local_getByte(a1, a2, &v5);
  uint64_t v6 = v5;
  if (!Byte) {
    unsigned int Byte = zip64local_getByte(v9, v8, &v5);
  }
  v6 += (uint64_t)v5 << 8;
  if (Byte) {
    *uint64_t v7 = 0;
  }
  else {
    *uint64_t v7 = v6;
  }
  return Byte;
}

uint64_t add_data_in_datablock(void *a1, uint64_t a2, unint64_t a3)
{
  if (a1)
  {
    if (a1[1] || (new_datablock = allocate_new_datablock(), a1[1] = new_datablock, (*a1 = new_datablock) != 0))
    {
      uint64_t v9 = (void *)a1[1];
      uint64_t v8 = a2;
      while (a3)
      {
        if (!v9[1])
        {
          *uint64_t v9 = allocate_new_datablock();
          if (!*v9) {
            return -104;
          }
          uint64_t v9 = (void *)*v9;
          a1[1] = v9;
        }
        if (v9[1] >= a3) {
          unsigned int v7 = a3;
        }
        else {
          unsigned int v7 = v9[1];
        }
        uint64_t v5 = (uint64_t)v9 + v9[2] + 32;
        for (unsigned int i = 0; i < v7; ++i)
          *(unsigned char *)(v5 + i) = *(unsigned char *)(v8 + i);
        v9[2] += v7;
        v9[1] -= v7;
        v8 += v7;
        a3 -= v7;
      }
      return 0;
    }
    else
    {
      return -104;
    }
  }
  else
  {
    return -104;
  }
}

void *zipOpen3()
{
  uint64_t v0 = MEMORY[0x270FA5388]();
  __dst[8244] = *(FILE *(**)(uint64_t, const char *, char))MEMORY[0x263EF8340];
  uint64_t v11 = v0;
  int v10 = v1;
  uint64_t v9 = v2;
  __src = v3;
  bzero(__dst, 0x200uLL);
  int CentralDirectoryRecord = 0;
  __dst[10] = 0;
  __dst[9] = 0;
  if (__src) {
    memcpy(__dst, __src, 0x58uLL);
  }
  else {
    fill_fopen64_filefunc(__dst);
  }
  if (v10) {
    unsigned int v4 = 7;
  }
  else {
    unsigned int v4 = 11;
  }
  __dst[11] = (FILE *(*)(uint64_t, const char *, char))call_zopen64((uint64_t)__dst, v11, v4);
  if (!__dst[11]) {
    return 0;
  }
  if (v10 == 1) {
    call_zseek64((uint64_t)__dst, (uint64_t)__dst[11], 0, 2u);
  }
  __dst[8240] = (FILE *(*)(uint64_t, const char *, char))call_ztell64((uint64_t)__dst, (uint64_t)__dst[11]);
  LODWORD(__dst[14]) = 0;
  LODWORD(__dst[29]) = 0;
  __dst[8242] = 0;
  __dst[8241] = 0;
  init_linkedlist(&__dst[12]);
  unsigned int v7 = malloc_type_malloc(0x101A0uLL, 0x10F0040857F4A3AuLL);
  if (v7)
  {
    __dst[8243] = 0;
    if (v10 == 2) {
      int CentralDirectoryRecord = LoadCentralDirectoryRecord((uint64_t)__dst);
    }
    if (v9) {
      *uint64_t v9 = __dst[8243];
    }
    if (CentralDirectoryRecord)
    {
      if (__dst[8243]) {
        free(__dst[8243]);
      }
      free(v7);
      return 0;
    }
    else
    {
      memcpy(v7, __dst, 0x101A0uLL);
      return v7;
    }
  }
  else
  {
    ((void (*)(FILE *(*)(uint64_t, const char *, char), FILE *(*)(uint64_t, const char *, char)))__dst[5])(__dst[7], __dst[11]);
    return 0;
  }
}

void *init_linkedlist(void *result)
{
  result[1] = 0;
  *result = 0;
  return result;
}

void *zipOpen2(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  uint64_t v9 = a1;
  int v8 = a2;
  uint64_t v7 = a3;
  uint64_t v6 = a4;
  if (!a4) {
    return zipOpen3();
  }
  memset(__b, 0, sizeof(__b));
  fill_zlib_filefunc64_32_def_from_filefunc32(__b, v6);
  return zipOpen3();
}

void *zipOpen2_64(uint64_t a1, int a2, uint64_t a3, const void *a4)
{
  uint64_t v9 = a1;
  int v8 = a2;
  uint64_t v7 = a3;
  uint64_t v6 = a4;
  if (!a4) {
    return zipOpen3();
  }
  memset(__b, 0, sizeof(__b));
  memcpy(__b, v6, 0x40uLL);
  __b[9] = 0;
  __b[10] = 0;
  return zipOpen3();
}

void *zipOpen()
{
  return zipOpen3();
}

void *zipOpen64()
{
  return zipOpen3();
}

uint64_t Write_LocalFileHeader(uint64_t a1, const char *a2, unsigned int a3, uint64_t a4)
{
  unsigned int v6 = strlen(a2);
  unsigned int v5 = a3;
  unsigned int v7 = zip64local_putValue(a1, *(void *)(a1 + 88), 0x4034B50uLL, 4);
  if (!v7)
  {
    if (*(_DWORD *)(a1 + 65852)) {
      unsigned int v7 = zip64local_putValue(a1, *(void *)(a1 + 88), 0x2DuLL, 2);
    }
    else {
      unsigned int v7 = zip64local_putValue(a1, *(void *)(a1 + 88), 0x14uLL, 2);
    }
  }
  if (!v7) {
    unsigned int v7 = zip64local_putValue(a1, *(void *)(a1 + 88), *(void *)(a1 + 280), 2);
  }
  if (!v7) {
    unsigned int v7 = zip64local_putValue(a1, *(void *)(a1 + 88), *(int *)(a1 + 288), 2);
  }
  if (!v7) {
    unsigned int v7 = zip64local_putValue(a1, *(void *)(a1 + 88), *(void *)(a1 + 65832), 4);
  }
  if (!v7) {
    unsigned int v7 = zip64local_putValue(a1, *(void *)(a1 + 88), 0, 4);
  }
  if (!v7)
  {
    if (*(_DWORD *)(a1 + 65852)) {
      unsigned int v7 = zip64local_putValue(a1, *(void *)(a1 + 88), 0xFFFFFFFFuLL, 4);
    }
    else {
      unsigned int v7 = zip64local_putValue(a1, *(void *)(a1 + 88), 0, 4);
    }
  }
  if (!v7)
  {
    if (*(_DWORD *)(a1 + 65852)) {
      unsigned int v7 = zip64local_putValue(a1, *(void *)(a1 + 88), 0xFFFFFFFFuLL, 4);
    }
    else {
      unsigned int v7 = zip64local_putValue(a1, *(void *)(a1 + 88), 0, 4);
    }
  }
  if (!v7) {
    unsigned int v7 = zip64local_putValue(a1, *(void *)(a1 + 88), v6, 2);
  }
  if (*(_DWORD *)(a1 + 65852)) {
    unsigned int v5 = a3 + 20;
  }
  if (!v7) {
    unsigned int v7 = zip64local_putValue(a1, *(void *)(a1 + 88), v5, 2);
  }
  if (!v7
    && v6
    && (*(uint64_t (**)(void, void, const char *, void))(a1 + 16))(*(void *)(a1 + 56), *(void *)(a1 + 88), a2, v6) != v6)
  {
    unsigned int v7 = -1;
  }
  if (!v7
    && a3
    && (*(uint64_t (**)(void, void, uint64_t, void))(a1 + 16))(*(void *)(a1 + 56), *(void *)(a1 + 88), a4, a3) != a3)
  {
    unsigned int v7 = -1;
  }
  if (!v7 && *(_DWORD *)(a1 + 65852))
  {
    *(void *)(a1 + 65856) = call_ztell64(a1, *(void *)(a1 + 88));
    zip64local_putValue(a1, *(void *)(a1 + 88), 1uLL, 2);
    zip64local_putValue(a1, *(void *)(a1 + 88), 0x10uLL, 2);
    zip64local_putValue(a1, *(void *)(a1 + 88), 0, 8);
    return zip64local_putValue(a1, *(void *)(a1 + 88), 0, 8);
  }
  return v7;
}

uint64_t zip64local_putValue(uint64_t a1, uint64_t a2, unint64_t a3, int a4)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  for (int i = 0; i < a4; ++i)
  {
    v9[i] = a3;
    a3 >>= 8;
  }
  if (a3)
  {
    for (int j = 0; j < a4; ++j)
      v9[j] = -1;
  }
  if ((*(uint64_t (**)(void, uint64_t, unsigned char *, void))(a1 + 16))(*(void *)(a1 + 56), a2, v9, a4) == a4) {
    return 0;
  }
  else {
    return -1;
  }
}

uint64_t zipOpenNewFileInZip4_64(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, unsigned int a7, const char *a8, int a9, int a10, int a11, int a12, int a13, int a14, uint64_t a15, int a16, unint64_t a17, uint64_t a18, int a19)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  int windowBits = a12;
  if (a1)
  {
    if (!a9 || a9 == 8)
    {
      if (*(_DWORD *)(a1 + 112) == 1 && (unsigned int v21 = zipCloseFileInZip(a1)) != 0)
      {
        return v21;
      }
      else
      {
        if (!a2) {
          a2 = "-";
        }
        if (a8) {
          unsigned int v26 = strlen(a8);
        }
        else {
          unsigned int v26 = 0;
        }
        unsigned int v27 = strlen(a2);
        if (a3)
        {
          if (*(void *)(a3 + 24)) {
            *(void *)(a1 + 65832) = *(void *)(a3 + 24);
          }
          else {
            *(void *)(a1 + 65832) = zip64local_TmzDateToDosDate((_DWORD *)a3);
          }
        }
        else
        {
          *(void *)(a1 + 65832) = 0;
        }
        *(void *)(a1 + 280) = a18;
        if (a10 == 8 || a10 == 9) {
          *(void *)(a1 + 280) |= 2uLL;
        }
        if (a10 == 2) {
          *(void *)(a1 + 280) |= 4uLL;
        }
        if (a10 == 1) {
          *(void *)(a1 + 280) |= 6uLL;
        }
        if (a15) {
          *(void *)(a1 + 280) |= 1uLL;
        }
        *(void *)(a1 + 65840) = 0;
        *(_DWORD *)(a1 + 288) = a9;
        *(_DWORD *)(a1 + 65848) = 0;
        *(_DWORD *)(a1 + 232) = 0;
        *(_DWORD *)(a1 + 236) = 0;
        *(_DWORD *)(a1 + 292) = a11;
        *(void *)(a1 + 240) = call_ztell64(a1, *(void *)(a1 + 88));
        *(void *)(a1 + 264) = v27 + 46 + a7 + v26;
        *(void *)(a1 + 272) = 32;
        *(void *)(a1 + 248) = malloc_type_malloc(*(void *)(a1 + 272) + *(void *)(a1 + 264), 0x5C9031E2uLL);
        *(void *)(a1 + 256) = a7;
        zip64local_putValue_inmemory(*(void *)(a1 + 248), 0x2014B50uLL, 4);
        zip64local_putValue_inmemory(*(void *)(a1 + 248) + 4, a17, 2);
        zip64local_putValue_inmemory(*(void *)(a1 + 248) + 6, 0x14uLL, 2);
        zip64local_putValue_inmemory(*(void *)(a1 + 248) + 8, *(void *)(a1 + 280), 2);
        zip64local_putValue_inmemory(*(void *)(a1 + 248) + 10, *(int *)(a1 + 288), 2);
        zip64local_putValue_inmemory(*(void *)(a1 + 248) + 12, *(void *)(a1 + 65832), 4);
        zip64local_putValue_inmemory(*(void *)(a1 + 248) + 16, 0, 4);
        zip64local_putValue_inmemory(*(void *)(a1 + 248) + 20, 0, 4);
        zip64local_putValue_inmemory(*(void *)(a1 + 248) + 24, 0, 4);
        zip64local_putValue_inmemory(*(void *)(a1 + 248) + 28, v27, 2);
        zip64local_putValue_inmemory(*(void *)(a1 + 248) + 30, a7, 2);
        zip64local_putValue_inmemory(*(void *)(a1 + 248) + 32, v26, 2);
        zip64local_putValue_inmemory(*(void *)(a1 + 248) + 34, 0, 2);
        if (a3) {
          zip64local_putValue_inmemory(*(void *)(a1 + 248) + 36, *(void *)(a3 + 32), 2);
        }
        else {
          zip64local_putValue_inmemory(*(void *)(a1 + 248) + 36, 0, 2);
        }
        if (a3) {
          zip64local_putValue_inmemory(*(void *)(a1 + 248) + 38, *(void *)(a3 + 40), 4);
        }
        else {
          zip64local_putValue_inmemory(*(void *)(a1 + 248) + 38, 0, 4);
        }
        if (*(void *)(a1 + 240) < 0xFFFFFFFFuLL) {
          zip64local_putValue_inmemory(*(void *)(a1 + 248) + 42, *(void *)(a1 + 240) - *(void *)(a1 + 65928), 4);
        }
        else {
          zip64local_putValue_inmemory(*(void *)(a1 + 248) + 42, 0xFFFFFFFFuLL, 4);
        }
        for (unsigned int i = 0; i < v27; ++i)
          *(unsigned char *)(*(void *)(a1 + 248) + 46 + i) = a2[i];
        for (unsigned int j = 0; j < a7; ++j)
          *(unsigned char *)(*(void *)(a1 + 248) + 46 + v27 + j) = *(unsigned char *)(a6 + j);
        for (unsigned int k = 0; k < v26; ++k)
          *(unsigned char *)(*(void *)(a1 + 248) + 46 + v27 + a7 + k) = a8[k];
        if (*(void *)(a1 + 248))
        {
          *(_DWORD *)(a1 + 65852) = a19;
          *(void *)(a1 + 65864) = 0;
          *(void *)(a1 + 65872) = 0;
          *(void *)(a1 + 65856) = 0;
          unsigned int v22 = Write_LocalFileHeader(a1, a2, a5, a4);
          *(_DWORD *)(a1 + 128) = 0;
          *(_DWORD *)(a1 + 152) = 0x10000;
          *(void *)(a1 + 144) = a1 + 296;
          *(void *)(a1 + 136) = 0;
          *(void *)(a1 + 160) = 0;
          *(_DWORD *)(a1 + 208) = 0;
          if (!v22 && *(_DWORD *)(a1 + 288) == 8 && !*(_DWORD *)(a1 + 292) && *(_DWORD *)(a1 + 288) == 8)
          {
            *(void *)(a1 + 184) = 0;
            *(void *)(a1 + 192) = 0;
            *(void *)(a1 + 200) = 0;
            if (a12 > 0) {
              int windowBits = -a12;
            }
            unsigned int v22 = deflateInit2_((z_streamp)(a1 + 120), a10, 8, windowBits, a13, a14, "1.2.12", 112);
            if (!v22) {
              *(_DWORD *)(a1 + 232) = 8;
            }
          }
          *(_DWORD *)(a1 + 65912) = 0;
          if (!v22)
          {
            if (a15)
            {
              *(_DWORD *)(a1 + 65848) = 1;
              *(void *)(a1 + 65904) = get_crc_table();
              unsigned int v20 = crypthead(a15, (uint64_t)v38, 12, (void *)(a1 + 65880), *(void *)(a1 + 65904), a16);
              *(_DWORD *)(a1 + 65912) = v20;
              if ((*(uint64_t (**)(void, void, unsigned char *, void))(a1 + 16))(*(void *)(a1 + 56), *(void *)(a1 + 88), v38, v20) != v20)unsigned int v22 = -1; {
            }
              }
          }
          if (!v22) {
            *(_DWORD *)(a1 + 112) = 1;
          }
          return v22;
        }
        else
        {
          return -104;
        }
      }
    }
    else
    {
      return -102;
    }
  }
  else
  {
    return -102;
  }
}

uint64_t zipCloseFileInZip(uint64_t a1)
{
  return zipCloseFileInZipRaw(a1, 0, 0);
}

unint64_t zip64local_TmzDateToDosDate(_DWORD *a1)
{
  unint64_t v2 = a1[5];
  if (v2 < 0x7BC)
  {
    if (v2 >= 0x50) {
      v2 -= 80;
    }
  }
  else
  {
    v2 -= 1980;
  }
  return (*a1 / 2u + 32 * a1[1] + ((unint64_t)a1[2] << 11)) | (((a1[3]
                                                                                                  + 32 * (a1[4] + 1))
                                                                                   + (v2 << 9)) << 16);
}

uint64_t zip64local_putValue_inmemory(uint64_t result, unint64_t a2, int a3)
{
  for (int i = 0; i < a3; ++i)
  {
    *(unsigned char *)(result + i) = a2;
    a2 >>= 8;
  }
  if (a2)
  {
    for (int j = 0; j < a3; ++j)
      *(unsigned char *)(result + j) = -1;
  }
  return result;
}

uint64_t crypthead(uint64_t a1, uint64_t a2, int a3, void *a4, uint64_t a5, int a6)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  __int16 v17 = HIWORD(a6);
  if (a3 >= 12)
  {
    if (++crypthead_calls == 1)
    {
      int v6 = time(0);
      srand(v6 ^ 0xBB40E64E);
    }
    init_keys_0(a1, a4, a5);
    for (int i = 0; i < 10; ++i)
    {
      unsigned int v9 = (rand() >> 7);
      char v10 = decrypt_byte_0((uint64_t)a4);
      update_keys_0(a4, a5, v9);
      v23[i] = v10 ^ v9;
    }
    init_keys_0(a1, a4, a5);
    for (int j = 0; j < 10; ++j)
    {
      char v11 = decrypt_byte_0((uint64_t)a4);
      update_keys_0(a4, a5, v23[j]);
      *(unsigned char *)(a2 + j) = v11 ^ v23[j];
    }
    char v12 = decrypt_byte_0((uint64_t)a4);
    update_keys_0(a4, a5, v17);
    uint64_t v7 = j;
    int v16 = j + 1;
    *(unsigned char *)(a2 + v7) = v12 ^ v17;
    char v13 = decrypt_byte_0((uint64_t)a4);
    update_keys_0(a4, a5, HIBYTE(v17));
    *(unsigned char *)(a2 + v16) = v13 ^ HIBYTE(v17);
    return (v16 + 1);
  }
  else
  {
    return 0;
  }
}

uint64_t zipOpenNewFileInZip4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, unsigned int a7, const char *a8, int a9, int a10, int a11, int a12, int a13, int a14, uint64_t a15, int a16, unint64_t a17, uint64_t a18)
{
  return zipOpenNewFileInZip4_64(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, 0);
}

uint64_t zipOpenNewFileInZip3(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, unsigned int a7, const char *a8, int a9, int a10, int a11, int a12, int a13, int a14, uint64_t a15, int a16)
{
  return zipOpenNewFileInZip4_64(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, 0, 0, 0);
}

uint64_t zipOpenNewFileInZip3_64(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, unsigned int a7, const char *a8, int a9, int a10, int a11, int a12, int a13, int a14, uint64_t a15, int a16, int a17, int a18)
{
  return zipOpenNewFileInZip4_64(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, 0, 0, a18);
}

uint64_t zipOpenNewFileInZip2(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, unsigned int a7, const char *a8, int a9, int a10, int a11)
{
  return zipOpenNewFileInZip4_64(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, -15, 8, 0, 0, 0, 0, 0, 0);
}

uint64_t zipOpenNewFileInZip2_64(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, unsigned int a7, const char *a8, int a9, int a10, int a11, int a12)
{
  return zipOpenNewFileInZip4_64(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, -15, 8, 0, 0, 0, 0, 0, a12);
}

uint64_t zipOpenNewFileInZip64(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, unsigned int a7, const char *a8, int a9, int a10, int a11)
{
  return zipOpenNewFileInZip4_64(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, 0, -15, 8, 0, 0, 0, 0, 0, a11);
}

uint64_t zipOpenNewFileInZip(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, unsigned int a7, const char *a8, int a9, int a10)
{
  return zipOpenNewFileInZip4_64(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, 0, -15, 8, 0, 0, 0, 0, 0, 0);
}

uint64_t zipWriteInFileInZip(uint64_t a1, const Bytef *a2, uInt a3)
{
  unsigned int v8 = 0;
  if (a1)
  {
    if (*(_DWORD *)(a1 + 112))
    {
      *(void *)(a1 + 65840) = crc32(*(void *)(a1 + 65840), a2, a3);
      *(void *)(a1 + 120) = a2;
      *(_DWORD *)(a1 + 128) = a3;
      while (1)
      {
        BOOL v4 = 0;
        if (!v8) {
          BOOL v4 = *(_DWORD *)(a1 + 128) != 0;
        }
        if (!v4) {
          break;
        }
        if (!*(_DWORD *)(a1 + 152))
        {
          if (zip64FlushWriteBuffer(a1) == -1) {
            unsigned int v8 = -1;
          }
          *(_DWORD *)(a1 + 152) = 0x10000;
          *(void *)(a1 + 144) = a1 + 296;
        }
        if (v8) {
          break;
        }
        if (*(_DWORD *)(a1 + 288) != 8 || *(_DWORD *)(a1 + 292))
        {
          if (*(_DWORD *)(a1 + 128) >= *(_DWORD *)(a1 + 152)) {
            unsigned int v6 = *(_DWORD *)(a1 + 152);
          }
          else {
            unsigned int v6 = *(_DWORD *)(a1 + 128);
          }
          for (unsigned int i = 0; i < v6; ++i)
            *(unsigned char *)(*(void *)(a1 + 144) + i) = *(unsigned char *)(*(void *)(a1 + 120) + i);
          *(_DWORD *)(a1 + 128) -= v6;
          *(_DWORD *)(a1 + 152) -= v6;
          *(void *)(a1 + 120) += v6;
          *(void *)(a1 + 144) += v6;
          *(void *)(a1 + 136) += v6;
          *(void *)(a1 + 160) += v6;
          *(_DWORD *)(a1 + 236) += v6;
        }
        else
        {
          uint64_t v7 = *(void *)(a1 + 160);
          unsigned int v8 = deflate((z_streamp)(a1 + 120), 0);
          *(_DWORD *)(a1 + 236) += *(void *)(a1 + 160) - v7;
        }
      }
      return v8;
    }
    else
    {
      return -102;
    }
  }
  else
  {
    return -102;
  }
}

uint64_t zip64FlushWriteBuffer(uint64_t a1)
{
  unsigned int v4 = 0;
  if (*(_DWORD *)(a1 + 65848))
  {
    for (unsigned int i = 0; i < *(_DWORD *)(a1 + 236); ++i)
    {
      char v2 = decrypt_byte_0(a1 + 65880);
      update_keys_0((void *)(a1 + 65880), *(void *)(a1 + 65904), *(unsigned __int8 *)(a1 + 296 + i));
      *(unsigned char *)(a1 + 296 + i) ^= v2;
    }
  }
  if ((*(uint64_t (**)(void, void, uint64_t, void))(a1 + 16))(*(void *)(a1 + 56), *(void *)(a1 + 88), a1 + 296, *(unsigned int *)(a1 + 236)) != *(_DWORD *)(a1 + 236))unsigned int v4 = -1; {
  *(void *)(a1 + 65864) += *(unsigned int *)(a1 + 236);
  }
  *(void *)(a1 + 65872) += *(void *)(a1 + 136);
  *(void *)(a1 + 136) = 0;
  *(_DWORD *)(a1 + 236) = 0;
  return v4;
}

uint64_t zipCloseFileInZipRaw(uint64_t a1, unint64_t a2, unint64_t a3)
{
  return zipCloseFileInZipRaw64(a1, a2, a3);
}

uint64_t zipCloseFileInZipRaw64(uint64_t a1, unint64_t a2, unint64_t a3)
{
  __int16 v10 = 0;
  unsigned int v9 = 0;
  if (a1)
  {
    if (*(_DWORD *)(a1 + 112))
    {
      *(_DWORD *)(a1 + 128) = 0;
      if (*(_DWORD *)(a1 + 288) == 8 && !*(_DWORD *)(a1 + 292))
      {
        while (!v9)
        {
          if (!*(_DWORD *)(a1 + 152))
          {
            zip64FlushWriteBuffer(a1);
            *(_DWORD *)(a1 + 152) = 0x10000;
            *(void *)(a1 + 144) = a1 + 296;
          }
          uint64_t v8 = *(void *)(a1 + 160);
          unsigned int v9 = deflate((z_streamp)(a1 + 120), 4);
          *(_DWORD *)(a1 + 236) += *(void *)(a1 + 160) - v8;
        }
      }
      if (v9 == 1) {
        unsigned int v9 = 0;
      }
      if (*(_DWORD *)(a1 + 236) && !v9 && zip64FlushWriteBuffer(a1) == -1) {
        unsigned int v9 = -1;
      }
      if (*(_DWORD *)(a1 + 288) == 8 && !*(_DWORD *)(a1 + 292))
      {
        int v7 = deflateEnd((z_streamp)(a1 + 120));
        if (!v9) {
          unsigned int v9 = v7;
        }
        *(_DWORD *)(a1 + 232) = 0;
      }
      if (!*(_DWORD *)(a1 + 292))
      {
        a3 = *(void *)(a1 + 65840);
        a2 = *(void *)(a1 + 65872);
      }
      unint64_t v11 = *(void *)(a1 + 65864) + *(int *)(a1 + 65912);
      if (v11 >= 0xFFFFFFFF || a2 >= 0xFFFFFFFF || *(void *)(a1 + 240) >= 0xFFFFFFFFuLL)
      {
        zip64local_putValue_inmemory(*(void *)(a1 + 248) + 4, 0x2DuLL, 2);
        zip64local_putValue_inmemory(*(void *)(a1 + 248) + 6, 0x2DuLL, 2);
      }
      zip64local_putValue_inmemory(*(void *)(a1 + 248) + 16, a3, 4);
      if (v11 < 0xFFFFFFFF) {
        zip64local_putValue_inmemory(*(void *)(a1 + 248) + 20, v11, 4);
      }
      else {
        zip64local_putValue_inmemory(*(void *)(a1 + 248) + 20, 0xFFFFFFFFuLL, 4);
      }
      if (*(_DWORD *)(a1 + 208) == 1) {
        zip64local_putValue_inmemory(*(void *)(a1 + 248) + 36, 1uLL, 2);
      }
      if (a2 < 0xFFFFFFFF) {
        zip64local_putValue_inmemory(*(void *)(a1 + 248) + 24, a2, 4);
      }
      else {
        zip64local_putValue_inmemory(*(void *)(a1 + 248) + 24, 0xFFFFFFFFuLL, 4);
      }
      if (a2 >= 0xFFFFFFFF) {
        __int16 v10 = 8;
      }
      if (v11 >= 0xFFFFFFFF) {
        v10 += 8;
      }
      if (*(void *)(a1 + 240) >= 0xFFFFFFFFuLL) {
        v10 += 8;
      }
      if (v10 > 0)
      {
        if ((unint64_t)(v10 + 4) > *(void *)(a1 + 272)) {
          return -103;
        }
        uint64_t v5 = *(void *)(a1 + 248) + *(void *)(a1 + 264);
        zip64local_putValue_inmemory(v5, 1uLL, 2);
        v5 += 2;
        zip64local_putValue_inmemory(v5, v10, 2);
        uint64_t v6 = v5 + 2;
        if (a2 >= 0xFFFFFFFF)
        {
          zip64local_putValue_inmemory(v6, a2, 8);
          v6 += 8;
        }
        if (v11 >= 0xFFFFFFFF)
        {
          zip64local_putValue_inmemory(v6, v11, 8);
          v6 += 8;
        }
        if (*(void *)(a1 + 240) >= 0xFFFFFFFFuLL) {
          zip64local_putValue_inmemory(v6, *(void *)(a1 + 240), 8);
        }
        *(void *)(a1 + 272) -= v10 + 4;
        *(void *)(a1 + 264) += v10 + 4;
        *(void *)(a1 + 256) += v10 + 4;
        zip64local_putValue_inmemory(*(void *)(a1 + 248) + 30, *(void *)(a1 + 256), 2);
      }
      if (!v9) {
        unsigned int v9 = add_data_in_datablock((void *)(a1 + 96), *(void *)(a1 + 248), *(void *)(a1 + 264));
      }
      free(*(void **)(a1 + 248));
      if (!v9)
      {
        uint64_t v4 = call_ztell64(a1, *(void *)(a1 + 88));
        if (call_zseek64(a1, *(void *)(a1 + 88), *(void *)(a1 + 240) + 14, 0)) {
          unsigned int v9 = -1;
        }
        if (!v9) {
          unsigned int v9 = zip64local_putValue(a1, *(void *)(a1 + 88), a3, 4);
        }
        if (a2 < 0xFFFFFFFF)
        {
          if (!v9) {
            unsigned int v9 = zip64local_putValue(a1, *(void *)(a1 + 88), v11, 4);
          }
          if (!v9) {
            unsigned int v9 = zip64local_putValue(a1, *(void *)(a1 + 88), a2, 4);
          }
        }
        else if (*(void *)(a1 + 65856))
        {
          if (call_zseek64(a1, *(void *)(a1 + 88), *(void *)(a1 + 65856) + 4, 0)) {
            unsigned int v9 = -1;
          }
          if (!v9) {
            unsigned int v9 = zip64local_putValue(a1, *(void *)(a1 + 88), a2, 8);
          }
          if (!v9) {
            unsigned int v9 = zip64local_putValue(a1, *(void *)(a1 + 88), v11, 8);
          }
        }
        if (call_zseek64(a1, *(void *)(a1 + 88), v4, 0)) {
          unsigned int v9 = -1;
        }
      }
      ++*(void *)(a1 + 65936);
      *(_DWORD *)(a1 + 112) = 0;
      return v9;
    }
    else
    {
      return -102;
    }
  }
  else
  {
    return -102;
  }
}

uint64_t Write_Zip64EndOfCentralDirectoryLocator(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = a2 - *(void *)(a1 + 65928);
  unsigned int v4 = zip64local_putValue(a1, *(void *)(a1 + 88), 0x7064B50uLL, 4);
  if (!v4) {
    unsigned int v4 = zip64local_putValue(a1, *(void *)(a1 + 88), 0, 4);
  }
  if (!v4) {
    unsigned int v4 = zip64local_putValue(a1, *(void *)(a1 + 88), v3, 8);
  }
  if (!v4) {
    return zip64local_putValue(a1, *(void *)(a1 + 88), 1uLL, 4);
  }
  return v4;
}

uint64_t Write_Zip64EndOfCentralDirectoryRecord(void *a1, unint64_t a2, uint64_t a3)
{
  unsigned int v4 = zip64local_putValue((uint64_t)a1, a1[11], 0x6064B50uLL, 4);
  if (!v4) {
    unsigned int v4 = zip64local_putValue((uint64_t)a1, a1[11], 0x2CuLL, 8);
  }
  if (!v4) {
    unsigned int v4 = zip64local_putValue((uint64_t)a1, a1[11], 0x2DuLL, 2);
  }
  if (!v4) {
    unsigned int v4 = zip64local_putValue((uint64_t)a1, a1[11], 0x2DuLL, 2);
  }
  if (!v4) {
    unsigned int v4 = zip64local_putValue((uint64_t)a1, a1[11], 0, 4);
  }
  if (!v4) {
    unsigned int v4 = zip64local_putValue((uint64_t)a1, a1[11], 0, 4);
  }
  if (!v4) {
    unsigned int v4 = zip64local_putValue((uint64_t)a1, a1[11], a1[8242], 8);
  }
  if (!v4) {
    unsigned int v4 = zip64local_putValue((uint64_t)a1, a1[11], a1[8242], 8);
  }
  if (!v4) {
    unsigned int v4 = zip64local_putValue((uint64_t)a1, a1[11], a2, 8);
  }
  if (!v4) {
    return zip64local_putValue((uint64_t)a1, a1[11], a3 - a1[8241], 8);
  }
  return v4;
}

uint64_t Write_EndOfCentralDirectoryRecord(void *a1, unint64_t a2, uint64_t a3)
{
  unsigned int v4 = zip64local_putValue((uint64_t)a1, a1[11], 0x6054B50uLL, 4);
  if (!v4) {
    unsigned int v4 = zip64local_putValue((uint64_t)a1, a1[11], 0, 2);
  }
  if (!v4) {
    unsigned int v4 = zip64local_putValue((uint64_t)a1, a1[11], 0, 2);
  }
  if (!v4)
  {
    if (a1[8242] < 0xFFFFuLL) {
      unsigned int v4 = zip64local_putValue((uint64_t)a1, a1[11], a1[8242], 2);
    }
    else {
      unsigned int v4 = zip64local_putValue((uint64_t)a1, a1[11], 0xFFFFuLL, 2);
    }
  }
  if (!v4)
  {
    if (a1[8242] < 0xFFFFuLL) {
      unsigned int v4 = zip64local_putValue((uint64_t)a1, a1[11], a1[8242], 2);
    }
    else {
      unsigned int v4 = zip64local_putValue((uint64_t)a1, a1[11], 0xFFFFuLL, 2);
    }
  }
  if (!v4) {
    unsigned int v4 = zip64local_putValue((uint64_t)a1, a1[11], a2, 4);
  }
  if (!v4)
  {
    if ((unint64_t)(a3 - a1[8241]) < 0xFFFFFFFF) {
      return zip64local_putValue((uint64_t)a1, a1[11], a3 - a1[8241], 4);
    }
    else {
      return zip64local_putValue((uint64_t)a1, a1[11], 0xFFFFFFFFuLL, 4);
    }
  }
  return v4;
}

uint64_t Write_GlobalComment(uint64_t a1, const char *a2)
{
  unsigned int v3 = 0;
  if (a2) {
    unsigned int v3 = strlen(a2);
  }
  unsigned int v4 = zip64local_putValue(a1, *(void *)(a1 + 88), v3, 2);
  if (!v4
    && v3
    && (*(uint64_t (**)(void, void, const char *, void))(a1 + 16))(*(void *)(a1 + 56), *(void *)(a1 + 88), a2, v3) != v3)
  {
    return -1;
  }
  return v4;
}

uint64_t zipClose(uint64_t a1, const char *a2)
{
  unsigned int v7 = 0;
  unint64_t v6 = 0;
  if (a1)
  {
    if (*(_DWORD *)(a1 + 112) == 1) {
      unsigned int v7 = zipCloseFileInZip(a1);
    }
    if (!a2) {
      a2 = *(const char **)(a1 + 65944);
    }
    uint64_t v5 = call_ztell64(a1, *(void *)(a1 + 88));
    if (!v7)
    {
      for (unsigned int i = *(void **)(a1 + 96); i; unsigned int i = (void *)*i)
      {
        if (!v7
          && i[2]
          && (*(uint64_t (**)(void, void, void *, void))(a1 + 16))(*(void *)(a1 + 56), *(void *)(a1 + 88), i + 4, i[2]) != i[2])
        {
          unsigned int v7 = -1;
        }
        v6 += i[2];
      }
    }
    free_linkedlist(a1 + 96);
    if ((unint64_t)(v5 - *(void *)(a1 + 65928)) >= 0xFFFFFFFF)
    {
      uint64_t v3 = call_ztell64(a1, *(void *)(a1 + 88));
      Write_Zip64EndOfCentralDirectoryRecord((void *)a1, v6, v5);
      Write_Zip64EndOfCentralDirectoryLocator(a1, v3);
    }
    if (!v7) {
      unsigned int v7 = Write_EndOfCentralDirectoryRecord((void *)a1, v6, v5);
    }
    if (!v7) {
      unsigned int v7 = Write_GlobalComment(a1, a2);
    }
    if ((*(unsigned int (**)(void, void))(a1 + 40))(*(void *)(a1 + 56), *(void *)(a1 + 88)) && !v7) {
      unsigned int v7 = -1;
    }
    if (*(void *)(a1 + 65944)) {
      free(*(void **)(a1 + 65944));
    }
    if (a1) {
      free((void *)a1);
    }
    return v7;
  }
  else
  {
    return -102;
  }
}

void free_linkedlist(uint64_t a1)
{
  *(void *)(a1 + 8) = 0;
  *(void *)a1 = 0;
}

uint64_t zipRemoveExtraInfoBlock(__int16 *a1, int *a2, __int16 a3)
{
  uint64_t v8 = a1;
  int v7 = 0;
  if (a1 && *a2 >= 4)
  {
    unint64_t v6 = malloc_type_malloc(*a2, 0x90F11DE4uLL);
    while (v8 < (__int16 *)((char *)a1 + *a2))
    {
      __int16 v5 = v8[1];
      if (*v8 == a3)
      {
        uint64_t v8 = (__int16 *)((char *)v8 + v5 + 4);
      }
      else
      {
        __memcpy_chk();
        uint64_t v8 = (__int16 *)((char *)v8 + v5 + 4);
        v7 += v5 + 4;
      }
    }
    if (v7 >= *a2)
    {
      unsigned int v4 = -1;
    }
    else
    {
      __memset_chk();
      if (v7 > 0) {
        __memcpy_chk();
      }
      *a2 = v7;
      unsigned int v4 = 0;
    }
    if (v6) {
      free(v6);
    }
    return v4;
  }
  else
  {
    return -102;
  }
}

uint64_t zip64local_getByte(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v7 = a1;
  uint64_t v6 = a2;
  __int16 v5 = a3;
  unsigned __int8 v4 = 0;
  if ((*(unsigned int (**)(void, uint64_t, unsigned __int8 *, uint64_t))(a1 + 8))(*(void *)(a1 + 56), a2, &v4, 1) == 1)
  {
    *__int16 v5 = v4;
    return 0;
  }
  else if ((*(unsigned int (**)(void, uint64_t))(v7 + 48))(*(void *)(v7 + 56), v6))
  {
    return -1;
  }
  else
  {
    return 0;
  }
}

void *allocate_new_datablock()
{
  int v1 = malloc_type_malloc(0x1010uLL, 0x1020040BBE2FE16uLL);
  if (v1)
  {
    void *v1 = 0;
    v1[2] = 0;
    v1[1] = 4080;
  }
  return v1;
}

uint64_t init_keys_0(uint64_t result, void *a2, uint64_t a3)
{
  __int16 v5 = (unsigned char *)result;
  *a2 = 305419896;
  a2[1] = 591751049;
  a2[2] = 878082192;
  while (*v5)
    result = update_keys_0(a2, a3, (char)*v5++);
  return result;
}

uint64_t decrypt_byte_0(uint64_t a1)
{
  return ((unsigned __int16)((*(void *)(a1 + 16) | 2) * ((*(void *)(a1 + 16) | 2) ^ 1)) >> 8);
}

uint64_t update_keys_0(void *a1, uint64_t a2, unsigned int a3)
{
  *a1 = *(void *)(a2 + 8 * (*a1 ^ a3)) ^ (*a1 >> 8);
  a1[1] += *(unsigned __int8 *)a1;
  a1[1] = 134775813 * a1[1] + 1;
  a1[2] = *(void *)(a2 + 8 * (a1[2] ^ BYTE3(a1[1]))) ^ (a1[2] >> 8);
  return a3;
}

void free_datablock(void *a1)
{
  while (a1)
  {
    int v1 = (void *)*a1;
    free(a1);
    a1 = v1;
  }
}

void sub_229104A78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17, _Unwind_Exception *exception_object, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  objc_destroyWeak(&a24);
  objc_destroyWeak((id *)(v24 - 40));
  _Unwind_Resume(a1);
}

void sub_229105B24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, int a15, int a16, _Unwind_Exception *exception_object)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v17 - 24));
  _Unwind_Resume(a1);
}

void sub_229105C70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, int a15, int a16, _Unwind_Exception *exception_object)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v17 - 24));
  _Unwind_Resume(a1);
}

void sub_229105EB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, int a16, _Unwind_Exception *exception_object, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  objc_destroyWeak(&a24);
  objc_destroyWeak((id *)(v24 - 40));
  _Unwind_Resume(a1);
}

void sub_22910700C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, int a16, _Unwind_Exception *exception_object, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id a23)
{
  objc_destroyWeak(&a23);
  objc_destroyWeak((id *)(v23 - 32));
  _Unwind_Resume(a1);
}

void sub_2291071D0(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
  *(void *)(v12 - 40) = a1;
  *(_DWORD *)(v12 - 44) = a2;
  objc_destroyWeak((id *)(v12 - 32));
  _Unwind_Resume(*(_Unwind_Exception **)(v12 - 40));
}

void sub_229107344(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13, _Unwind_Exception *exception_object, char a15, uint64_t a16, uint64_t a17, uint64_t a18, id a19)
{
}

void __Block_byref_object_copy__2(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  char v2 = *(void **)(a2 + 40);
  uint64_t v3 = (id *)(a1 + 40);
  *uint64_t v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

uint64_t Data.init(hexString:)(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = 0;
  unint64_t v14 = 0;
  sub_22912B708();
  unint64_t v12 = sub_22912B7E8();
  while (1)
  {
    MEMORY[0x22A6B0F60](a1, a2);
    if ((sub_22912B838() & 1) == 0) {
      break;
    }
    MEMORY[0x22A6B0F60](a1, a2);
    unint64_t v9 = sub_22912B848();
    if (v2)
    {
      if ((unint64_t)sub_22912B858() >> 14 < v12 >> 14)
      {
        sub_22912BAD8();
        __break(1u);
      }
      uint64_t v4 = sub_22912B898();
      MEMORY[0x22A6B0F70](v4);
      swift_bridgeObjectRelease();
      sub_22912B7F8();
      sub_22910F2D4();
      sub_22910F350();
      sub_22910F3CC();
      sub_22912B8A8();
      sub_22912B8E8();
      unint64_t v12 = sub_22912B858();
      swift_bridgeObjectRelease();
    }
    else
    {
      if (v9 >> 14 < v12 >> 14)
      {
        sub_22912BAD8();
        __break(1u);
      }
      uint64_t v3 = sub_22912B898();
      MEMORY[0x22A6B0F70](v3);
      swift_bridgeObjectRelease();
      sub_22912B7F8();
      sub_22910F2D4();
      sub_22910F350();
      sub_22910F3CC();
      sub_22912B8A8();
      sub_22912B8E8();
      unint64_t v12 = v9;
      swift_bridgeObjectRelease();
    }
  }
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2682C3DC8);
  sub_22910EFD8();
  uint64_t v8 = sub_22912B448();
  unint64_t v7 = v5;
  sub_22910F0D4(v8, v5);
  uint64_t v13 = v8;
  unint64_t v14 = v7;
  sub_22910F160();
  swift_bridgeObjectRelease();
  sub_22910F18C((uint64_t)&v13);
  return v8;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t v4 = *a1;
  if (*a1 < 0)
  {
    uint64_t TypeByMangledNameInContext2 = swift_getTypeByMangledNameInContext2();
    *a1 = TypeByMangledNameInContext2;
    return TypeByMangledNameInContext2;
  }
  return v4;
}

unint64_t sub_22910EFD8()
{
  uint64_t v2 = qword_2682C3DD0;
  if (!qword_2682C3DD0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2682C3DC8);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682C3DD0);
    return WitnessTable;
  }
  return v2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t v4 = *a1;
  if (*a1 < 0)
  {
    uint64_t TypeByMangledNameInContextInMetadataState2 = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = TypeByMangledNameInContextInMetadataState2;
    return TypeByMangledNameInContextInMetadataState2;
  }
  return v4;
}

uint64_t sub_22910F0D4(uint64_t a1, unint64_t a2)
{
  if (((a2 >> 62) & 3) == 1) {
    return swift_retain();
  }
  if (((a2 >> 62) & 3) == 2)
  {
    swift_retain();
    return swift_retain();
  }
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_22910F160()
{
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_22910F18C(uint64_t a1)
{
}

uint64_t sub_22910F1C0(uint64_t a1, unint64_t a2)
{
  if (((a2 >> 62) & 3) == 1) {
    return swift_release();
  }
  if (((a2 >> 62) & 3) == 2)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

unint64_t sub_22910F24C@<X0>(const char *a1@<X0>, unint64_t *a2@<X8>)
{
  unint64_t result = strtoul(a1, 0, 16);
  *a2 = result;
  return result;
}

unint64_t sub_22910F290@<X0>(const char *a1@<X0>, unint64_t *a2@<X8>)
{
  unint64_t result = strtoul(a1, 0, 16);
  *a2 = result;
  return result;
}

unint64_t sub_22910F2D4()
{
  uint64_t v2 = qword_2682C3DD8;
  if (!qword_2682C3DD8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682C3DD8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22910F350()
{
  uint64_t v2 = qword_2682C3DE0;
  if (!qword_2682C3DE0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682C3DE0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22910F3CC()
{
  uint64_t v2 = qword_2682C3DE8;
  if (!qword_2682C3DE8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682C3DE8);
    return WitnessTable;
  }
  return v2;
}

Swift::String_optional __swiftcall Data.toHexString()()
{
  unint64_t v0 = sub_22910FFC4();
  sub_22910F688((void (*)(char *, char *))sub_22910F564, 0, MEMORY[0x263F06F78], MEMORY[0x263F8D310], MEMORY[0x263F8E628], v0, MEMORY[0x263F8E658], v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2682C3DF8);
  sub_2291100E4();
  sub_229110040();
  uint64_t v6 = sub_22912B768();
  unint64_t v5 = v1;
  swift_bridgeObjectRelease();
  sub_229110168();
  uint64_t v2 = v5;
  uint64_t v3 = v6;
  result.value._object = v2;
  result.value._countAndFlagsBits = v3;
  return result;
}

uint64_t sub_22910F564@<X0>(char *a1@<X0>, uint64_t *a2@<X8>)
{
  char v5 = *a1;
  sub_22912B818();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2682C3E08);
  sub_22912BB68();
  *(void *)(v2 + 24) = MEMORY[0x263F8E778];
  *(void *)(v2 + 32) = MEMORY[0x263F8E7C0];
  *(unsigned char *)uint64_t v2 = v5;
  sub_22910F644();
  uint64_t v6 = sub_22912B7A8();
  uint64_t v7 = v3;
  swift_bridgeObjectRelease();
  uint64_t result = v6;
  *a2 = v6;
  a2[1] = v7;
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_22910F644()
{
}

uint64_t sub_22910F688(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v36 = a1;
  uint64_t v37 = a2;
  uint64_t v61 = a3;
  uint64_t v51 = a4;
  uint64_t v38 = a5;
  uint64_t v60 = a6;
  uint64_t v40 = a8;
  unint64_t v41 = "Fatal error";
  unint64_t v42 = "Index out of bounds";
  unint64_t v43 = "Swift/Collection.swift";
  unint64_t v44 = "Range requires lowerBound <= upperBound";
  unint64_t v45 = "Swift/Range.swift";
  unint64_t v46 = "Index out of range";
  uint64_t v76 = a3;
  uint64_t v75 = a4;
  uint64_t v74 = a5;
  uint64_t v47 = *(void *)(a5 - 8);
  uint64_t v48 = a5 - 8;
  unint64_t v49 = (*(void *)(v47 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  ((void (*)(void))MEMORY[0x270FA5388])();
  v50 = (char *)&v21 - v49;
  uint64_t v52 = 0;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v54 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v55 = AssociatedTypeWitness - 8;
  unint64_t v56 = (*(void *)(v54 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v8 = MEMORY[0x270FA5388](v52, v60, v61, v51);
  unint64_t v57 = (char *)&v21 - v56;
  unint64_t v58 = (*(void *)(*(void *)(v9 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v8, v10, v11, v9);
  unint64_t v59 = (char *)&v21 - v58;
  uint64_t v62 = swift_getAssociatedTypeWitness();
  uint64_t v63 = *(void *)(v62 - 8);
  uint64_t v64 = v62 - 8;
  unint64_t v65 = (*(void *)(v63 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v14 = MEMORY[0x270FA5388](v61, v60, v12, v13);
  uint64_t v66 = (char *)&v21 - v65;
  unint64_t v67 = (v15 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v14, v16, (char *)&v21 - v65, v17);
  uint64_t v68 = (char *)&v21 - v67;
  uint64_t v69 = sub_22912B928();
  if (v69)
  {
    uint64_t v73 = sub_22912BAB8();
    uint64_t v35 = sub_22912BAC8();
    sub_22912BA98();
    uint64_t result = sub_22912B918();
    if (v69 >= 0)
    {
      uint64_t v33 = 0;
      for (uint64_t i = v39; ; uint64_t i = v24)
      {
        uint64_t v31 = i;
        uint64_t v32 = v33;
        if (v33 == v69) {
          goto LABEL_17;
        }
        if (v32 < 0 || v32 >= v69) {
          goto LABEL_16;
        }
        uint64_t v71 = v32;
        if (v69 < 0) {
          goto LABEL_15;
        }
        if (v32 >= v69) {
          break;
        }
        uint64_t v30 = v32 + 1;
        if (__OFADD__(v32, 1))
        {
          __break(1u);
          return result;
        }
        char v72 = 0;
        uint64_t v29 = v30;
LABEL_18:
        uint64_t v28 = v29;
        if (v72)
        {
          (*(void (**)(char *, char *, uint64_t))(v63 + 32))(v66, v68, v62);
          sub_22912BA78();
          (*(void (**)(char *, uint64_t))(v63 + 8))(v66, v62);
          uint64_t v25 = v73;
          swift_retain();
          swift_release();
          uint64_t v26 = v25;
          uint64_t v27 = v31;
          return v26;
        }
        uint64_t v23 = &v70;
        unsigned int v22 = (void (*)(void))sub_22912B958();
        (*(void (**)(char *))(v54 + 16))(v57);
        v22();
        uint64_t v20 = v31;
        v36(v57, v50);
        uint64_t v24 = v20;
        if (v20)
        {
          (*(void (**)(char *, uint64_t))(v54 + 8))(v57, AssociatedTypeWitness);
          (*(void (**)(char *, uint64_t))(v63 + 8))(v68, v62);
          sub_229110194();
          (*(void (**)(uint64_t, char *, uint64_t))(v47 + 32))(v40, v50, v38);
          return v21;
        }
        (*(void (**)(char *, uint64_t))(v54 + 8))(v57, AssociatedTypeWitness);
        sub_22912BAA8();
        sub_22912B938();
        uint64_t result = v24;
        uint64_t v33 = v28;
      }
      sub_22912BAD8();
      __break(1u);
LABEL_15:
      sub_22912BAD8();
      __break(1u);
LABEL_16:
      sub_22912BAE8();
      __break(1u);
LABEL_17:
      uint64_t v71 = 0;
      char v72 = 1;
      uint64_t v29 = v32;
      goto LABEL_18;
    }
    sub_22912BAD8();
    __break(1u);
  }
  uint64_t v26 = sub_22912B8C8();
  uint64_t v27 = v39;
  return v26;
}

unint64_t sub_22910FFC4()
{
  uint64_t v2 = qword_2682C3DF0;
  if (!qword_2682C3DF0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682C3DF0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_229110040()
{
  return sub_22912B818();
}

unint64_t sub_2291100E4()
{
  uint64_t v2 = qword_2682C3E00;
  if (!qword_2682C3E00)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2682C3DF8);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682C3E00);
    return WitnessTable;
  }
  return v2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_229110168()
{
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_229110194()
{
}

void sub_2291101C0()
{
  void *v0 = *v0;
}

__SecTrust *static MCLECCertValidation.evaluatePublicCertTrust(base64EncodedCert:)()
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v24 = 0;
  unint64_t v25 = 0;
  sub_2291106B4();
  uint64_t v20 = sub_22912B3A8();
  unint64_t v21 = v0;
  if ((v0 & 0xF000000000000000) == 0xF000000000000000)
  {
    sub_2291106BC();
    swift_allocError();
    *(void *)uint64_t v10 = 0;
    *(void *)(v10 + 8) = 0;
    *(unsigned char *)(v10 + 16) = 3;
    swift_willThrow();
  }
  else
  {
    uint64_t v24 = v20;
    unint64_t v25 = v0;
    sub_22910F0D4(v20, v0);
    CFDataRef v18 = (const __CFData *)sub_22912B3B8();
    SecCertificateRef v19 = SecCertificateCreateWithData(0, v18);

    sub_22910F1C0(v20, v21);
    if (v19)
    {
      uint64_t v23 = 0;
      type metadata accessor for SecCertificate();
      sub_22912BB68();
      uint64_t v14 = v1;
      uint64_t v2 = v19;
      *uint64_t v14 = v19;
      sub_22910F644();
      CFTypeRef certificates = (CFTypeRef)sub_22912B8B8();
      SecPolicyRef BasicX509 = SecPolicyCreateBasicX509();
      unsigned int v17 = SecTrustCreateWithCertificates(certificates, BasicX509, &v23);
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      if (v17)
      {
        sub_2291106BC();
        swift_allocError();
        *(void *)uint64_t v8 = v17;
        *(void *)(v8 + 8) = 0;
        *(unsigned char *)(v8 + 16) = 0;
        swift_willThrow();
        sub_2291107E0((id *)&v23);

        sub_22910F1C0(v20, v21);
      }
      else
      {
        uint64_t v13 = v23;
        uint64_t v3 = v23;
        if (v13)
        {
          CFErrorRef error = 0;
          if (SecTrustEvaluateWithError(v13, &error))
          {
            sub_22911080C((id *)&error);
            sub_2291107E0((id *)&v23);

            sub_22910F1C0(v20, v21);
            return v13;
          }
          CFErrorRef v12 = error;
          char v5 = error;
          sub_2291106BC();
          swift_allocError();
          *(void *)uint64_t v6 = v12;
          *(void *)(v6 + 8) = 0;
          *(unsigned char *)(v6 + 16) = 1;
          swift_willThrow();
          sub_22911080C((id *)&error);

          sub_2291107E0((id *)&v23);
          sub_22910F1C0(v20, v21);
        }
        else
        {
          sub_2291106BC();
          swift_allocError();
          *(void *)uint64_t v7 = 2;
          *(void *)(v7 + 8) = 0;
          *(unsigned char *)(v7 + 16) = 3;
          swift_willThrow();
          sub_2291107E0((id *)&v23);

          sub_22910F1C0(v20, v21);
        }
      }
    }
    else
    {
      sub_2291106BC();
      swift_allocError();
      *(void *)uint64_t v9 = 1;
      *(void *)(v9 + 8) = 0;
      *(unsigned char *)(v9 + 16) = 3;
      swift_willThrow();
      sub_22910F1C0(v20, v21);
    }
  }
  return (__SecTrust *)v11;
}

uint64_t sub_2291106B4()
{
  return 0;
}

unint64_t sub_2291106BC()
{
  uint64_t v2 = qword_2682C3E10;
  if (!qword_2682C3E10)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682C3E10);
    return WitnessTable;
  }
  return v2;
}

uint64_t type metadata accessor for SecCertificate()
{
  uint64_t v4 = qword_2682C3E30;
  if (!qword_2682C3E30)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    uint64_t v4 = ForeignTypeMetadata;
    if (!v0)
    {
      unint64_t v1 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_2682C3E30);
      return v1;
    }
  }
  return v4;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_2291107E0(id *a1)
{
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_22911080C(id *a1)
{
}

uint64_t static MCLECCertValidation.getExternalCertRepresentation(from:)(__SecTrust *a1)
{
  error[1] = *(CFErrorRef *)MEMORY[0x263EF8340];
  uint64_t v11 = SecTrustCopyKey(a1);
  if (v11)
  {
    error[0] = 0;
    CFDataRef v10 = SecKeyCopyExternalRepresentation(v11, error);
    if (v10)
    {
      CFDataRef v1 = v10;
      uint64_t v9 = sub_22912B3D8();

      return v9;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_2682C3E18);
    uint64_t v8 = sub_22912B7D8();
    uint64_t v7 = v3;
    sub_2291106BC();
    swift_allocError();
    *(void *)uint64_t v4 = v8;
    *(void *)(v4 + 8) = v7;
    *(unsigned char *)(v4 + 16) = 2;
    swift_willThrow();
  }
  else
  {
    sub_2291106BC();
    swift_allocError();
    *(void *)uint64_t v5 = 3;
    *(void *)(v5 + 8) = 0;
    *(unsigned char *)(v5 + 16) = 3;
    swift_willThrow();
  }
  return v6;
}

uint64_t MCLECCertValidation.ECCertValidationError.errorDescription.getter(void *a1, uint64_t a2, char a3)
{
  if (a3)
  {
    if (a3 == 1)
    {
      id v3 = a1;
      sub_22912BB58();
      sub_22912B818();
      sub_22912BB48();
      swift_bridgeObjectRelease();
      sub_22912BB18();
      sub_22912B818();
      sub_22912BB48();
      swift_bridgeObjectRelease();
      id v4 = a1;
      if (a1)
      {
        id v5 = a1;
        type metadata accessor for CFError();
        sub_229111350();
        sub_22912BB98();
        uint64_t v10 = v6;

        uint64_t v11 = v10;
      }
      else
      {
        uint64_t v11 = 0;
      }
      if (!v11)
      {
        sub_22912B818();
        sub_229111254();
      }
      sub_22912BB38();
      sub_229111280();
      sub_22912B818();
      sub_22912BB48();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_229111228();
      uint64_t v9 = sub_22912B808();

      return v9;
    }
    else if (a3 == 2)
    {
      swift_bridgeObjectRetain();
      sub_22912BB58();
      sub_22912B818();
      sub_22912BB48();
      swift_bridgeObjectRelease();
      sub_22912BB18();
      sub_22912B818();
      sub_22912BB48();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      if (!a2)
      {
        sub_22912B818();
        sub_229111254();
      }
      sub_22912BB38();
      sub_229111280();
      sub_22912B818();
      sub_22912BB48();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_229111228();
      uint64_t v8 = sub_22912B808();
      swift_bridgeObjectRelease();
      return v8;
    }
    else
    {
      sub_22912BB58();
      sub_22912B818();
      sub_22912BB48();
      swift_bridgeObjectRelease();
      sub_22912BB18();
      sub_22912B818();
      sub_22912BB48();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_229111228();
      return sub_22912B808();
    }
  }
  else
  {
    sub_22912BB58();
    sub_22912B818();
    sub_22912BB48();
    swift_bridgeObjectRelease();
    sub_22912BB18();
    sub_22912B818();
    sub_22912BB48();
    swift_bridgeObjectRelease();
    sub_22912BB28();
    sub_22912B818();
    sub_22912BB48();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_229111228();
    return sub_22912B808();
  }
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_229111228()
{
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_229111254()
{
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_229111280()
{
}

uint64_t type metadata accessor for CFError()
{
  uint64_t v4 = qword_2682C3E28;
  if (!qword_2682C3E28)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    uint64_t v4 = ForeignTypeMetadata;
    if (!v0)
    {
      unint64_t v1 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_2682C3E28);
      return v1;
    }
  }
  return v4;
}

unint64_t sub_229111350()
{
  uint64_t v2 = qword_2682C3E20;
  if (!qword_2682C3E20)
  {
    type metadata accessor for CFError();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682C3E20);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_2291113D4()
{
  return MCLECCertValidation.ECCertValidationError.errorDescription.getter(*(void **)v0, *(void *)(v0 + 8), *(unsigned char *)(v0 + 16));
}

uint64_t sub_2291113F8()
{
  return sub_22912B358();
}

uint64_t sub_229111410()
{
  return sub_22912B378();
}

uint64_t sub_229111428()
{
  return sub_22912B348();
}

uint64_t sub_229111440()
{
  return sub_22912BBC8();
}

uint64_t sub_229111458()
{
  return sub_22912BBB8();
}

uint64_t sub_229111470()
{
  return sub_22912BBD8();
}

uint64_t sub_229111488()
{
  return sub_22912BBA8();
}

unint64_t sub_2291114A4()
{
  return sub_2291106BC();
}

ValueMetadata *type metadata accessor for MCLECCertValidation()
{
  return &type metadata for MCLECCertValidation;
}

uint64_t initializeBufferWithCopyOfBuffer for MCLECCertValidation.ECCertValidationError(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_22911152C(*(id *)a2, v4, v5);
  uint64_t result = a1;
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return result;
}

id sub_22911152C(id result, uint64_t a2, char a3)
{
  if (a3 == 1) {
    return result;
  }
  if (a3 == 2) {
    return (id)swift_bridgeObjectRetain();
  }
  return result;
}

void destroy for MCLECCertValidation.ECCertValidationError(uint64_t a1)
{
}

void sub_2291115C0(void *a1, uint64_t a2, char a3)
{
  if (a3 == 1)
  {
  }
  else if (a3 == 2)
  {
    swift_bridgeObjectRelease();
  }
}

uint64_t initializeWithCopy for MCLECCertValidation.ECCertValidationError(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_22911152C(*(id *)a2, v4, v5);
  uint64_t result = a1;
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return result;
}

uint64_t assignWithCopy for MCLECCertValidation.ECCertValidationError(uint64_t a1, uint64_t a2)
{
  id v6 = *(id *)a2;
  uint64_t v7 = *(void *)(a2 + 8);
  char v8 = *(unsigned char *)(a2 + 16);
  sub_22911152C(*(id *)a2, v7, v8);
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void *)(a1 + 8);
  char v4 = *(unsigned char *)(a1 + 16);
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(unsigned char *)(a1 + 16) = v8;
  sub_2291115C0(v2, v3, v4);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  return result;
}

uint64_t assignWithTake for MCLECCertValidation.ECCertValidationError(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  id v6 = *(void **)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  char v8 = *(unsigned char *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_2291115C0(v6, v7, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for MCLECCertValidation.ECCertValidationError(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFD && *(unsigned char *)(a1 + 17))
    {
      int v4 = *(_DWORD *)a1 + 252;
    }
    else
    {
      unsigned int v2 = *(unsigned __int8 *)(a1 + 16) ^ 0xFF;
      if (v2 >= 0xFC) {
        unsigned int v2 = -1;
      }
      int v4 = v2;
    }
  }
  else
  {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for MCLECCertValidation.ECCertValidationError(uint64_t result, unsigned int a2, unsigned int a3)
{
  uint64_t v3 = (unsigned char *)(result + 17);
  if (a2 > 0xFC)
  {
    *(void *)(result + 8) = 0;
    *(void *)__n128 result = a2 - 253;
    *(unsigned char *)(result + 16) = 0;
    if (a3 >= 0xFD) {
      *uint64_t v3 = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *uint64_t v3 = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_229111A0C(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) < 3u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return *(void *)a1 + 3;
  }
}

uint64_t sub_229111A34(uint64_t result, unsigned int a2)
{
  if (a2 < 3)
  {
    *(unsigned char *)(result + 16) = a2;
  }
  else
  {
    *(void *)__n128 result = a2 - 3;
    *(void *)(result + 8) = 0;
    *(unsigned char *)(result + 16) = 3;
  }
  return result;
}

ValueMetadata *type metadata accessor for MCLECCertValidation.ECCertValidationError()
{
  return &type metadata for MCLECCertValidation.ECCertValidationError;
}

uint64_t variable initialization expression of MCLECv2Encryption.queue()
{
  uint64_t v32 = 0;
  unint64_t v16 = (*(void *)(*(void *)(sub_22912B988() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0, v0, v1, v2);
  uint64_t v31 = (uint64_t)&v15 - v16;
  unint64_t v17 = (*(void *)(*(void *)(sub_22912B978() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v32, v3, v4, v5);
  uint64_t v30 = (char *)&v15 - v17;
  unint64_t v18 = (*(void *)(*(void *)(sub_22912B4C8() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v32, v6, v7, v8);
  uint64_t v29 = (char *)&v15 - v18;
  unint64_t v22 = sub_229111CD8();
  uint64_t v20 = 17;
  uint64_t v9 = sub_22912BB58();
  uint64_t v24 = &v33;
  uint64_t v33 = v9;
  uint64_t v34 = v10;
  int v21 = 1;
  sub_22912B818();
  uint64_t v19 = v11;
  sub_22912BB48();
  swift_bridgeObjectRelease();
  type metadata accessor for MCLECv2Encryption();
  sub_229111D68();
  sub_22912B818();
  uint64_t v23 = v12;
  sub_22912BB48();
  swift_bridgeObjectRelease();
  uint64_t v26 = v33;
  uint64_t v25 = v34;
  swift_bridgeObjectRetain();
  sub_229111228();
  uint64_t v27 = sub_22912B808();
  uint64_t v28 = v13;
  sub_229111DA0();
  sub_229111DB8();
  sub_229111E50(v31);
  return sub_22912B9B8();
}

unint64_t sub_229111CD8()
{
  uint64_t v2 = qword_2682C3E38;
  if (!qword_2682C3E38)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_2682C3E38);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t type metadata accessor for MCLECv2Encryption()
{
  return self;
}

uint64_t sub_229111D68()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_229111DA0()
{
  return sub_22912B4B8();
}

uint64_t sub_229111DB8()
{
  return sub_22912BA68();
}

uint64_t sub_229111E50@<X0>(uint64_t a1@<X8>)
{
  unsigned int v3 = *MEMORY[0x263F8F130];
  uint64_t v1 = sub_22912B988();
  return (*(uint64_t (**)(uint64_t, void))(*(void *)(v1 - 8) + 104))(a1, v3);
}

uint64_t variable initialization expression of MCLECv2Encryption.symmetricKeyLength()
{
  return 32;
}

uint64_t variable initialization expression of MCLECv2Encryption.prependsEphemeralKeyPadding()
{
  return 0;
}

uint64_t sub_229111F2C()
{
  uint64_t v2 = (char *)(v0 + OBJC_IVAR___MCLECv2Encryption_prependsEphemeralKeyPadding);
  swift_beginAccess();
  char v3 = *v2;
  swift_endAccess();
  return v3 & 1;
}

uint64_t sub_229111FE8(char a1)
{
  uint64_t v4 = (unsigned char *)(v1 + OBJC_IVAR___MCLECv2Encryption_prependsEphemeralKeyPadding);
  swift_beginAccess();
  *uint64_t v4 = a1 & 1;
  return swift_endAccess();
}

uint64_t (*sub_22911206C())()
{
  return sub_2291120D8;
}

uint64_t sub_2291120D8()
{
  return swift_endAccess();
}

uint64_t sub_229112118(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v25[2] = 0;
  uint64_t v26 = 0;
  unint64_t v27 = 0;
  v25[9] = a1;
  v25[7] = a2;
  v25[8] = a3;
  v25[5] = a4;
  v25[6] = a5;
  v25[3] = a6;
  v25[4] = a7;
  id v28 = 0;
  int v21 = self;
  swift_bridgeObjectRetain();
  uint64_t v23 = sub_22912B718();
  swift_bridgeObjectRelease();
  type metadata accessor for WritingOptions();
  sub_22912BB68();
  sub_22911253C();
  sub_22912B9E8();
  v25[0] = 0;
  id v24 = objc_msgSend(v21, sel_dataWithJSONObject_options_error_, v23, v25[1], v25);
  id v22 = v25[0];
  id v7 = v25[0];
  uint64_t v8 = v28;
  id v28 = v22;

  swift_unknownObjectRelease();
  if (v24)
  {
    uint64_t v15 = sub_22912B3D8();
    unint64_t v16 = v9;

    uint64_t v17 = v15;
    unint64_t v18 = v16;
  }
  else
  {
    id v12 = v28;
    id v13 = (id)sub_22912B398();

    swift_willThrow();
    uint64_t v17 = 0;
    unint64_t v18 = 0xF000000000000000;
  }
  if ((v18 & 0xF000000000000000) == 0xF000000000000000)
  {
    swift_retain();
    sub_2291125C0();
    id v14 = (id)swift_allocError();
    *(void *)uint64_t v11 = 2;
    *(void *)(v11 + 8) = 0;
    *(unsigned char *)(v11 + 16) = 1;
    ((void (*)(void))a6)();

    return swift_release();
  }
  else
  {
    uint64_t v26 = v17;
    unint64_t v27 = v18;
    (*(void (**)(void))((*v20 & *MEMORY[0x263F8EED0]) + 0x98))();
    return sub_22910F1C0(v17, v18);
  }
}

uint64_t type metadata accessor for WritingOptions()
{
  uint64_t v4 = qword_2682C3EF0;
  if (!qword_2682C3EF0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    uint64_t v4 = ForeignTypeMetadata;
    if (!v0)
    {
      unint64_t v1 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_2682C3EF0);
      return v1;
    }
  }
  return v4;
}

unint64_t sub_22911253C()
{
  uint64_t v2 = qword_2682C3E48;
  if (!qword_2682C3E48)
  {
    type metadata accessor for WritingOptions();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682C3E48);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_2291125C0()
{
  uint64_t v2 = qword_2682C3E50;
  if (!qword_2682C3E50)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682C3E50);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_2291127C8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

uint64_t sub_2291127FC()
{
  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_22911283C(uint64_t a1)
{
  return sub_2291127C8(a1, *(void *)(v1 + 16));
}

void sub_229112844(void *a1, uint64_t a2)
{
  id v2 = a1;
  if (a1)
  {
    uint64_t v3 = sub_22912B388();

    uint64_t v4 = (void *)v3;
  }
  else
  {
    uint64_t v4 = 0;
  }
  (*(void (**)(void))(a2 + 16))();
}

uint64_t sub_2291128E0()
{
  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_229112920(void *a1)
{
  sub_229112844(a1, *(void *)(v1 + 16));
}

uint64_t sub_229112928(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v25[2] = 0;
  uint64_t v26 = 0;
  unint64_t v27 = 0;
  v25[9] = a1;
  v25[7] = a2;
  v25[8] = a3;
  v25[5] = a4;
  v25[6] = a5;
  v25[3] = a6;
  v25[4] = a7;
  id v28 = 0;
  int v21 = self;
  swift_bridgeObjectRetain();
  uint64_t v23 = sub_22912B718();
  swift_bridgeObjectRelease();
  type metadata accessor for WritingOptions();
  sub_22912BB68();
  sub_22911253C();
  sub_22912B9E8();
  v25[0] = 0;
  id v24 = objc_msgSend(v21, sel_dataWithJSONObject_options_error_, v23, v25[1], v25);
  id v22 = v25[0];
  id v7 = v25[0];
  uint64_t v8 = v28;
  id v28 = v22;

  swift_unknownObjectRelease();
  if (v24)
  {
    uint64_t v15 = sub_22912B3D8();
    unint64_t v16 = v9;

    uint64_t v17 = v15;
    unint64_t v18 = v16;
  }
  else
  {
    id v12 = v28;
    id v13 = (id)sub_22912B398();

    swift_willThrow();
    uint64_t v17 = 0;
    unint64_t v18 = 0xF000000000000000;
  }
  if ((v18 & 0xF000000000000000) == 0xF000000000000000)
  {
    swift_retain();
    sub_2291125C0();
    id v14 = (id)swift_allocError();
    *(void *)uint64_t v11 = 2;
    *(void *)(v11 + 8) = 0;
    *(unsigned char *)(v11 + 16) = 1;
    ((void (*)(void))a6)();

    return swift_release();
  }
  else
  {
    uint64_t v26 = v17;
    unint64_t v27 = v18;
    (*(void (**)(void))((*v20 & *MEMORY[0x263F8EED0]) + 0xA0))();
    return sub_22910F1C0(v17, v18);
  }
}

uint64_t sub_229112E30()
{
  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_229112E70(uint64_t a1)
{
  return sub_2291127C8(a1, *(void *)(v1 + 16));
}

uint64_t sub_229112E78()
{
  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_229112EB8(void *a1)
{
  sub_229112844(a1, *(void *)(v1 + 16));
}

uint64_t sub_229112EC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(void), uint64_t a8)
{
  uint64_t v37 = a1;
  uint64_t v38 = a2;
  uint64_t v30 = a3;
  uint64_t v31 = a4;
  uint64_t v32 = a5;
  uint64_t v33 = a6;
  uint64_t v34 = a7;
  uint64_t v35 = a8;
  uint64_t v54 = 0;
  uint64_t v55 = 0;
  uint64_t v52 = 0;
  uint64_t v53 = 0;
  uint64_t v50 = 0;
  uint64_t v51 = 0;
  uint64_t v48 = 0;
  uint64_t v49 = 0;
  uint64_t v47 = 0;
  uint64_t v45 = 0;
  unint64_t v46 = 0;
  uint64_t v43 = sub_22912B7C8();
  uint64_t v39 = *(void *)(v43 - 8);
  uint64_t v40 = v43 - 8;
  unint64_t v36 = (*(void *)(v39 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  unint64_t v41 = (char *)&v22 - v36;
  uint64_t v54 = MEMORY[0x270FA5388](v37, v38, v30, v31);
  uint64_t v55 = v9;
  uint64_t v52 = v10;
  uint64_t v53 = v11;
  uint64_t v50 = v12;
  uint64_t v51 = v13;
  uint64_t v48 = v14;
  uint64_t v49 = v15;
  uint64_t v47 = v8;
  sub_22912B7B8();
  sub_229113178();
  uint64_t v42 = sub_22912B798();
  unint64_t v44 = v16;
  (*(void (**)(char *, uint64_t))(v39 + 8))(v41, v43);
  if ((v44 & 0xF000000000000000) == 0xF000000000000000)
  {
    swift_retain();
    sub_2291125C0();
    int v23 = 1;
    unint64_t v18 = (void *)swift_allocError();
    char v19 = v23;
    uint64_t v20 = v34;
    id v24 = v18;
    *(void *)uint64_t v21 = 2;
    *(void *)(v21 + 8) = 0;
    *(unsigned char *)(v21 + 16) = v19 & 1;
    v20();

    return swift_release();
  }
  else
  {
    uint64_t v27 = v42;
    unint64_t v28 = v44;
    unint64_t v26 = v44;
    uint64_t v25 = v42;
    uint64_t v45 = v42;
    unint64_t v46 = v44;
    (*(void (**)(void))((*v29 & *MEMORY[0x263F8EED0]) + 0xA8))();
    return sub_22910F1C0(v25, v26);
  }
}

uint64_t sub_229113178()
{
  return 0;
}

uint64_t sub_2291132F8()
{
  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_229113338(uint64_t a1)
{
  return sub_2291127C8(a1, *(void *)(v1 + 16));
}

uint64_t sub_229113340()
{
  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_229113380(void *a1)
{
  sub_229112844(a1, *(void *)(v1 + 16));
}

void MCLECv2Encryption.encrypt(_:recipientCertBase64Encoded:onSuccess:onFailure:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v44 = a1;
  unint64_t v42 = a2;
  uint64_t v39 = a3;
  uint64_t v40 = a4;
  uint64_t v35 = a5;
  uint64_t v36 = a6;
  uint64_t v37 = a7;
  uint64_t v38 = a8;
  uint64_t v45 = 0;
  uint64_t v43 = sub_229113C5C;
  uint64_t v70 = 0;
  uint64_t v71 = 0;
  uint64_t v68 = 0;
  uint64_t v69 = 0;
  uint64_t v66 = 0;
  uint64_t v67 = 0;
  uint64_t v64 = 0;
  uint64_t v65 = 0;
  uint64_t v63 = 0;
  uint64_t v49 = sub_22912B4A8();
  uint64_t v46 = *(void *)(v49 - 8);
  uint64_t v47 = v49 - 8;
  unint64_t v33 = (*(void *)(v46 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0, v9, v10, v11);
  uint64_t v48 = (char *)&v33 - v33;
  uint64_t v53 = sub_22912B4C8();
  uint64_t v50 = *(void *)(v53 - 8);
  uint64_t v51 = v53 - 8;
  unint64_t v34 = (*(void *)(v50 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v12 = MEMORY[0x270FA5388](v44, v42, v39, v40);
  uint64_t v52 = (char *)&v33 - v34;
  uint64_t v70 = v12;
  uint64_t v71 = v13;
  uint64_t v68 = v14;
  uint64_t v69 = v15;
  uint64_t v66 = v16;
  uint64_t v67 = v17;
  uint64_t v64 = v18;
  uint64_t v65 = v19;
  uint64_t v63 = v8;
  id v55 = *(id *)(v8 + OBJC_IVAR___MCLECv2Encryption_queue);
  id v20 = v55;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  id v21 = v41;
  sub_22910F0D4(v44, v42);
  uint64_t v22 = swift_allocObject();
  uint64_t v23 = v36;
  uint64_t v24 = v37;
  uint64_t v25 = v38;
  uint64_t v26 = v39;
  uint64_t v27 = v40;
  id v28 = v41;
  unint64_t v29 = v42;
  uint64_t v30 = v43;
  uint64_t v31 = (void *)v22;
  uint64_t v32 = v44;
  v31[2] = v35;
  v31[3] = v23;
  v31[4] = v24;
  v31[5] = v25;
  v31[6] = v26;
  v31[7] = v27;
  v31[8] = v28;
  v31[9] = v32;
  v31[10] = v29;
  uint64_t v61 = v30;
  uint64_t v62 = v31;
  aBlocunsigned int k = MEMORY[0x263EF8330];
  int v57 = 1107296256;
  int v58 = 0;
  unint64_t v59 = sub_2291143B0;
  uint64_t v60 = &block_descriptor;
  uint64_t v54 = _Block_copy(&aBlock);
  sub_229113FFC();
  sub_229114014();
  MEMORY[0x22A6B1090](v45, v52, v48, v54);
  (*(void (**)(char *, uint64_t))(v46 + 8))(v48, v49);
  (*(void (**)(char *, uint64_t))(v50 + 8))(v52, v53);
  _Block_release(v54);
  swift_release();
}

uint64_t sub_22911372C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v43 = a1;
  uint64_t v38 = a2;
  uint64_t v34 = a3;
  uint64_t v45 = a4;
  uint64_t v46 = a5;
  uint64_t v47 = a6;
  uint64_t v35 = a7;
  uint64_t v36 = a8;
  uint64_t v37 = a9;
  uint64_t v67 = 0;
  uint64_t v65 = 0;
  uint64_t v66 = 0;
  uint64_t v63 = 0;
  uint64_t v64 = 0;
  uint64_t v61 = 0;
  uint64_t v62 = 0;
  uint64_t v60 = 0;
  uint64_t v58 = 0;
  uint64_t v59 = 0;
  uint64_t v57 = 0;
  unint64_t v56 = 0;
  uint64_t v54 = 0;
  unint64_t v55 = 0;
  id v51 = 0;
  uint64_t v39 = sub_22912B698();
  uint64_t v40 = *(void *)(v39 - 8);
  uint64_t v41 = v39 - 8;
  unint64_t v42 = (*(void *)(v40 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v44 = &v21[-v42];
  uint64_t v67 = &v21[-v42];
  uint64_t v65 = v43;
  uint64_t v66 = MEMORY[0x270FA5388](v38, v9, v34, v45);
  uint64_t v63 = v10;
  uint64_t v64 = v11;
  uint64_t v61 = v12;
  uint64_t v62 = v13;
  uint64_t v60 = v14;
  uint64_t v58 = v15;
  uint64_t v59 = v16;
  swift_retain();
  swift_retain();
  uint64_t v17 = static MCLECCertValidation.evaluatePublicCertTrust(base64EncodedCert:)();
  uint64_t v48 = 0;
  uint64_t v49 = v17;
  uint64_t v50 = 0;
  unint64_t v29 = v17;
  unint64_t v56 = v17;
  uint64_t v18 = static MCLECCertValidation.getExternalCertRepresentation(from:)(v17);
  uint64_t v30 = 0;
  uint64_t v31 = v18;
  unint64_t v32 = v19;
  uint64_t v33 = 0;
  unint64_t v26 = v19;
  uint64_t v25 = v18;
  uint64_t v54 = v18;
  unint64_t v55 = v19;
  sub_22910F0D4(v18, v19);
  uint64_t v52 = v25;
  unint64_t v53 = v26;
  sub_22912B688();
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  id v23 = sub_229116870(v36, v37, (uint64_t)v44);
  uint64_t v24 = 0;
  id v22 = v23;
  id v51 = v23;
  sub_229113CA8(v23, v43, v38);

  (*(void (**)(unsigned char *, uint64_t))(v40 + 8))(v44, v39);
  sub_22910F1C0(v25, v26);

  swift_release();
  return swift_release();
}

uint64_t sub_229113BF8()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  sub_22910F1C0(*(void *)(v0 + 72), *(void *)(v0 + 80));
  return swift_deallocObject();
}

uint64_t sub_229113C5C()
{
  return sub_22911372C(v0[2], v0[3], v0[4], v0[5], v0[6], v0[7], v0[8], v0[9], v0[10]);
}

void sub_229113CA8(void *a1, uint64_t a2, uint64_t a3)
{
  id v21 = a1;
  uint64_t v18 = a2;
  uint64_t v19 = a3;
  uint64_t v22 = 0;
  id v20 = sub_22911E520;
  uint64_t v42 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  uint64_t v26 = sub_22912B4A8();
  uint64_t v23 = *(void *)(v26 - 8);
  uint64_t v24 = v26 - 8;
  unint64_t v16 = (*(void *)(v23 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0, v3, v4, v5);
  uint64_t v25 = (char *)&v16 - v16;
  uint64_t v30 = sub_22912B4C8();
  uint64_t v27 = *(void *)(v30 - 8);
  uint64_t v28 = v30 - 8;
  unint64_t v17 = (*(void *)(v27 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v22, v18, v19, v6);
  unint64_t v29 = (char *)&v16 - v17;
  uint64_t v42 = v7;
  uint64_t v40 = v8;
  uint64_t v41 = v9;
  sub_229111CD8();
  id v32 = (id)sub_22912B998();
  swift_retain();
  id v10 = v21;
  uint64_t v11 = swift_allocObject();
  uint64_t v12 = v19;
  uint64_t v13 = v20;
  uint64_t v14 = (void *)v11;
  id v15 = v21;
  v14[2] = v18;
  v14[3] = v12;
  v14[4] = v15;
  uint64_t v38 = v13;
  uint64_t v39 = v14;
  aBlocunsigned int k = MEMORY[0x263EF8330];
  int v34 = 1107296256;
  int v35 = 0;
  uint64_t v36 = sub_229113FAC;
  uint64_t v37 = &block_descriptor_119;
  uint64_t v31 = _Block_copy(&aBlock);
  swift_release();
  sub_229113FFC();
  sub_229114014();
  MEMORY[0x22A6B1090](v22, v29, v25, v31);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v26);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v29, v30);
  _Block_release(v31);
}

uint64_t sub_229113F3C(void (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return swift_release();
}

uint64_t sub_229113FAC(uint64_t a1)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v1 = swift_retain();
  v3(v1);
  return swift_release();
}

uint64_t sub_229113FFC()
{
  return sub_22912B4B8();
}

uint64_t sub_229114014()
{
  return sub_22912BA68();
}

void sub_2291140AC(void *a1, uint64_t a2, uint64_t a3)
{
  id v21 = a1;
  uint64_t v18 = a2;
  uint64_t v19 = a3;
  uint64_t v22 = 0;
  id v20 = sub_22911E464;
  uint64_t v42 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  uint64_t v26 = sub_22912B4A8();
  uint64_t v23 = *(void *)(v26 - 8);
  uint64_t v24 = v26 - 8;
  unint64_t v16 = (*(void *)(v23 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0, v3, v4, v5);
  uint64_t v25 = (char *)&v16 - v16;
  uint64_t v30 = sub_22912B4C8();
  uint64_t v27 = *(void *)(v30 - 8);
  uint64_t v28 = v30 - 8;
  unint64_t v17 = (*(void *)(v27 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v22, v18, v19, v6);
  unint64_t v29 = (char *)&v16 - v17;
  uint64_t v42 = v7;
  uint64_t v40 = v8;
  uint64_t v41 = v9;
  sub_229111CD8();
  id v32 = (id)sub_22912B998();
  swift_retain();
  id v10 = v21;
  uint64_t v11 = swift_allocObject();
  uint64_t v12 = v19;
  uint64_t v13 = v20;
  uint64_t v14 = (void *)v11;
  id v15 = v21;
  v14[2] = v18;
  v14[3] = v12;
  v14[4] = v15;
  uint64_t v38 = v13;
  uint64_t v39 = v14;
  aBlocunsigned int k = MEMORY[0x263EF8330];
  int v34 = 1107296256;
  int v35 = 0;
  uint64_t v36 = sub_229113FAC;
  uint64_t v37 = &block_descriptor_113;
  uint64_t v31 = _Block_copy(&aBlock);
  swift_release();
  sub_229113FFC();
  sub_229114014();
  MEMORY[0x22A6B1090](v22, v29, v25, v31);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v26);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v29, v30);
  _Block_release(v31);
}

uint64_t sub_229114340(void (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return swift_release();
}

uint64_t sub_2291143B0(uint64_t a1)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v1 = swift_retain();
  v3(v1);
  return swift_release();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_2291145DC()
{
  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_22911461C(uint64_t a1)
{
  return sub_2291127C8(a1, *(void *)(v1 + 16));
}

uint64_t sub_229114624()
{
  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_229114664(void *a1)
{
  sub_229112844(a1, *(void *)(v1 + 16));
}

void MCLECv2Encryption.encrypt(_:recipientKeyHexEncoded:onSuccess:onFailure:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v44 = a1;
  unint64_t v42 = a2;
  uint64_t v39 = a3;
  uint64_t v40 = a4;
  uint64_t v35 = a5;
  uint64_t v36 = a6;
  uint64_t v37 = a7;
  uint64_t v38 = a8;
  uint64_t v45 = 0;
  uint64_t v43 = sub_229114E30;
  uint64_t v70 = 0;
  uint64_t v71 = 0;
  uint64_t v68 = 0;
  uint64_t v69 = 0;
  uint64_t v66 = 0;
  uint64_t v67 = 0;
  uint64_t v64 = 0;
  uint64_t v65 = 0;
  uint64_t v63 = 0;
  uint64_t v49 = sub_22912B4A8();
  uint64_t v46 = *(void *)(v49 - 8);
  uint64_t v47 = v49 - 8;
  unint64_t v33 = (*(void *)(v46 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0, v9, v10, v11);
  uint64_t v48 = (char *)&v33 - v33;
  uint64_t v53 = sub_22912B4C8();
  uint64_t v50 = *(void *)(v53 - 8);
  uint64_t v51 = v53 - 8;
  unint64_t v34 = (*(void *)(v50 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v12 = MEMORY[0x270FA5388](v44, v42, v39, v40);
  uint64_t v52 = (char *)&v33 - v34;
  uint64_t v70 = v12;
  uint64_t v71 = v13;
  uint64_t v68 = v14;
  uint64_t v69 = v15;
  uint64_t v66 = v16;
  uint64_t v67 = v17;
  uint64_t v64 = v18;
  uint64_t v65 = v19;
  uint64_t v63 = v8;
  id v55 = *(id *)(v8 + OBJC_IVAR___MCLECv2Encryption_queue);
  id v20 = v55;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  id v21 = v41;
  sub_22910F0D4(v44, v42);
  uint64_t v22 = swift_allocObject();
  uint64_t v23 = v36;
  uint64_t v24 = v37;
  uint64_t v25 = v38;
  uint64_t v26 = v39;
  uint64_t v27 = v40;
  id v28 = v41;
  unint64_t v29 = v42;
  uint64_t v30 = v43;
  uint64_t v31 = (void *)v22;
  uint64_t v32 = v44;
  v31[2] = v35;
  v31[3] = v23;
  v31[4] = v24;
  v31[5] = v25;
  v31[6] = v26;
  v31[7] = v27;
  v31[8] = v28;
  v31[9] = v32;
  v31[10] = v29;
  uint64_t v61 = v30;
  uint64_t v62 = v31;
  aBlocunsigned int k = MEMORY[0x263EF8330];
  int v57 = 1107296256;
  int v58 = 0;
  uint64_t v59 = sub_2291143B0;
  uint64_t v60 = &block_descriptor_36;
  uint64_t v54 = _Block_copy(&aBlock);
  sub_229113FFC();
  sub_229114014();
  MEMORY[0x22A6B1090](v45, v52, v48, v54);
  (*(void (**)(char *, uint64_t))(v46 + 8))(v48, v49);
  (*(void (**)(char *, uint64_t))(v50 + 8))(v52, v53);
  _Block_release(v54);
  swift_release();
}

uint64_t sub_229114A10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v32 = a1;
  uint64_t v27 = a2;
  uint64_t v23 = a3;
  uint64_t v33 = a4;
  uint64_t v34 = a5;
  uint64_t v35 = a6;
  uint64_t v24 = a7;
  uint64_t v25 = a8;
  uint64_t v26 = a9;
  unint64_t v56 = 0;
  uint64_t v54 = 0;
  uint64_t v55 = 0;
  uint64_t v52 = 0;
  uint64_t v53 = 0;
  uint64_t v50 = 0;
  uint64_t v51 = 0;
  uint64_t v49 = 0;
  uint64_t v47 = 0;
  uint64_t v48 = 0;
  uint64_t v45 = 0;
  unint64_t v46 = 0;
  uint64_t v43 = 0;
  id v42 = 0;
  uint64_t v28 = sub_22912B698();
  uint64_t v29 = *(void *)(v28 - 8);
  uint64_t v30 = v28 - 8;
  unint64_t v31 = (*(void *)(v29 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v38 = &v19[-v31];
  unint64_t v56 = &v19[-v31];
  uint64_t v54 = v32;
  uint64_t v55 = MEMORY[0x270FA5388](v27, v9, v23, v33);
  uint64_t v52 = v10;
  uint64_t v53 = v11;
  uint64_t v50 = v12;
  uint64_t v51 = v13;
  uint64_t v49 = v14;
  uint64_t v47 = v15;
  uint64_t v48 = v16;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v36 = Data.init(hexString:)(v34, v35);
  unint64_t v37 = v17;
  uint64_t v45 = v36;
  unint64_t v46 = v17;
  sub_22910F0D4(v36, v17);
  uint64_t v39 = v44;
  v44[0] = v36;
  v44[1] = v37;
  sub_22911DFA8();
  sub_22912B668();
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  id v21 = sub_229116870(v25, v26, (uint64_t)v38);
  uint64_t v22 = 0;
  id v20 = v21;
  id v42 = v21;
  sub_229114EE0(v21, v32, v27);

  (*(void (**)(unsigned char *, uint64_t))(v29 + 8))(v38, v28);
  sub_22910F1C0(v36, v37);
  swift_release();
  return swift_release();
}

uint64_t sub_229114DCC()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  sub_22910F1C0(*(void *)(v0 + 72), *(void *)(v0 + 80));
  return swift_deallocObject();
}

uint64_t sub_229114E30()
{
  return sub_229114A10(v0[2], v0[3], v0[4], v0[5], v0[6], v0[7], v0[8], v0[9], v0[10]);
}

uint64_t block_copy_helper_34(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_35()
{
  return swift_release();
}

void sub_229114EE0(void *a1, uint64_t a2, uint64_t a3)
{
  id v21 = a1;
  uint64_t v18 = a2;
  uint64_t v19 = a3;
  uint64_t v22 = 0;
  id v20 = sub_22911E2A0;
  uint64_t v42 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  uint64_t v26 = sub_22912B4A8();
  uint64_t v23 = *(void *)(v26 - 8);
  uint64_t v24 = v26 - 8;
  unint64_t v16 = (*(void *)(v23 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0, v3, v4, v5);
  uint64_t v25 = (char *)&v16 - v16;
  uint64_t v30 = sub_22912B4C8();
  uint64_t v27 = *(void *)(v30 - 8);
  uint64_t v28 = v30 - 8;
  unint64_t v17 = (*(void *)(v27 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v22, v18, v19, v6);
  uint64_t v29 = (char *)&v16 - v17;
  uint64_t v42 = v7;
  uint64_t v40 = v8;
  uint64_t v41 = v9;
  sub_229111CD8();
  id v32 = (id)sub_22912B998();
  swift_retain();
  id v10 = v21;
  uint64_t v11 = swift_allocObject();
  uint64_t v12 = v19;
  uint64_t v13 = v20;
  uint64_t v14 = (void *)v11;
  id v15 = v21;
  v14[2] = v18;
  v14[3] = v12;
  v14[4] = v15;
  uint64_t v38 = v13;
  uint64_t v39 = v14;
  aBlocunsigned int k = MEMORY[0x263EF8330];
  int v34 = 1107296256;
  int v35 = 0;
  uint64_t v36 = sub_229113FAC;
  unint64_t v37 = &block_descriptor_107;
  unint64_t v31 = _Block_copy(&aBlock);
  swift_release();
  sub_229113FFC();
  sub_229114014();
  MEMORY[0x22A6B1090](v22, v29, v25, v31);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v26);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v29, v30);
  _Block_release(v31);
}

uint64_t sub_229115174(void (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return swift_release();
}

void sub_2291151E4(void *a1, uint64_t a2, uint64_t a3)
{
  id v21 = a1;
  uint64_t v18 = a2;
  uint64_t v19 = a3;
  uint64_t v22 = 0;
  id v20 = sub_22911E1E4;
  uint64_t v42 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  uint64_t v26 = sub_22912B4A8();
  uint64_t v23 = *(void *)(v26 - 8);
  uint64_t v24 = v26 - 8;
  unint64_t v16 = (*(void *)(v23 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0, v3, v4, v5);
  uint64_t v25 = (char *)&v16 - v16;
  uint64_t v30 = sub_22912B4C8();
  uint64_t v27 = *(void *)(v30 - 8);
  uint64_t v28 = v30 - 8;
  unint64_t v17 = (*(void *)(v27 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v22, v18, v19, v6);
  uint64_t v29 = (char *)&v16 - v17;
  uint64_t v42 = v7;
  uint64_t v40 = v8;
  uint64_t v41 = v9;
  sub_229111CD8();
  id v32 = (id)sub_22912B998();
  swift_retain();
  id v10 = v21;
  uint64_t v11 = swift_allocObject();
  uint64_t v12 = v19;
  uint64_t v13 = v20;
  uint64_t v14 = (void *)v11;
  id v15 = v21;
  v14[2] = v18;
  v14[3] = v12;
  v14[4] = v15;
  uint64_t v38 = v13;
  uint64_t v39 = v14;
  aBlocunsigned int k = MEMORY[0x263EF8330];
  int v34 = 1107296256;
  int v35 = 0;
  uint64_t v36 = sub_229113FAC;
  unint64_t v37 = &block_descriptor_101;
  unint64_t v31 = _Block_copy(&aBlock);
  swift_release();
  sub_229113FFC();
  sub_229114014();
  MEMORY[0x22A6B1090](v22, v29, v25, v31);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v26);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v29, v30);
  _Block_release(v31);
}

uint64_t sub_229115478(void (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return swift_release();
}

uint64_t sub_229115660()
{
  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_2291156A0(uint64_t a1)
{
  return sub_2291127C8(a1, *(void *)(v1 + 16));
}

uint64_t sub_2291156A8()
{
  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_2291156E8(void *a1)
{
  sub_229112844(a1, *(void *)(v1 + 16));
}

void MCLECv2Encryption.encrypt(_:recipientKeyBase64Encoded:onSuccess:onFailure:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v44 = a1;
  unint64_t v42 = a2;
  uint64_t v39 = a3;
  uint64_t v40 = a4;
  uint64_t v35 = a5;
  uint64_t v36 = a6;
  uint64_t v37 = a7;
  uint64_t v38 = a8;
  uint64_t v45 = 0;
  uint64_t v43 = sub_229115FB0;
  uint64_t v70 = 0;
  uint64_t v71 = 0;
  uint64_t v68 = 0;
  uint64_t v69 = 0;
  uint64_t v66 = 0;
  uint64_t v67 = 0;
  uint64_t v64 = 0;
  uint64_t v65 = 0;
  uint64_t v63 = 0;
  uint64_t v49 = sub_22912B4A8();
  uint64_t v46 = *(void *)(v49 - 8);
  uint64_t v47 = v49 - 8;
  unint64_t v33 = (*(void *)(v46 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0, v9, v10, v11);
  uint64_t v48 = (char *)&v33 - v33;
  uint64_t v53 = sub_22912B4C8();
  uint64_t v50 = *(void *)(v53 - 8);
  uint64_t v51 = v53 - 8;
  unint64_t v34 = (*(void *)(v50 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v12 = MEMORY[0x270FA5388](v44, v42, v39, v40);
  uint64_t v52 = (char *)&v33 - v34;
  uint64_t v70 = v12;
  uint64_t v71 = v13;
  uint64_t v68 = v14;
  uint64_t v69 = v15;
  uint64_t v66 = v16;
  uint64_t v67 = v17;
  uint64_t v64 = v18;
  uint64_t v65 = v19;
  uint64_t v63 = v8;
  id v55 = *(id *)(v8 + OBJC_IVAR___MCLECv2Encryption_queue);
  id v20 = v55;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  id v21 = v41;
  sub_22910F0D4(v44, v42);
  uint64_t v22 = swift_allocObject();
  uint64_t v23 = v36;
  uint64_t v24 = v37;
  uint64_t v25 = v38;
  uint64_t v26 = v39;
  uint64_t v27 = v40;
  id v28 = v41;
  unint64_t v29 = v42;
  uint64_t v30 = v43;
  unint64_t v31 = (void *)v22;
  uint64_t v32 = v44;
  v31[2] = v35;
  v31[3] = v23;
  v31[4] = v24;
  v31[5] = v25;
  v31[6] = v26;
  v31[7] = v27;
  v31[8] = v28;
  v31[9] = v32;
  v31[10] = v29;
  uint64_t v61 = v30;
  uint64_t v62 = v31;
  aBlocunsigned int k = MEMORY[0x263EF8330];
  int v57 = 1107296256;
  int v58 = 0;
  uint64_t v59 = sub_2291143B0;
  uint64_t v60 = &block_descriptor_50;
  uint64_t v54 = _Block_copy(&aBlock);
  sub_229113FFC();
  sub_229114014();
  MEMORY[0x22A6B1090](v45, v52, v48, v54);
  (*(void (**)(char *, uint64_t))(v46 + 8))(v48, v49);
  (*(void (**)(char *, uint64_t))(v50 + 8))(v52, v53);
  _Block_release(v54);
  swift_release();
}

uint64_t sub_229115A94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v55 = a1;
  uint64_t v50 = a2;
  uint64_t v46 = a3;
  uint64_t v57 = a4;
  uint64_t v58 = a5;
  uint64_t v59 = a6;
  uint64_t v47 = a7;
  uint64_t v48 = a8;
  uint64_t v49 = a9;
  uint64_t v76 = 0;
  uint64_t v74 = 0;
  uint64_t v75 = 0;
  uint64_t v72 = 0;
  uint64_t v73 = 0;
  uint64_t v70 = 0;
  uint64_t v71 = 0;
  uint64_t v69 = 0;
  uint64_t v67 = 0;
  uint64_t v68 = 0;
  uint64_t v65 = 0;
  unint64_t v66 = 0;
  uint64_t v45 = 0;
  uint64_t v63 = 0;
  id v62 = 0;
  uint64_t v51 = sub_22912B698();
  uint64_t v52 = *(void *)(v51 - 8);
  uint64_t v53 = v51 - 8;
  unint64_t v54 = (*(void *)(v52 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v56 = (uint64_t)&v29 - v54;
  uint64_t v76 = (char *)&v29 - v54;
  uint64_t v74 = v55;
  uint64_t v75 = MEMORY[0x270FA5388](v50, v9, v46, v57);
  uint64_t v72 = v10;
  uint64_t v73 = v11;
  uint64_t v70 = v12;
  uint64_t v71 = v13;
  uint64_t v69 = v14;
  uint64_t v67 = v15;
  uint64_t v68 = v16;
  swift_retain();
  swift_retain();
  uint64_t v60 = sub_22912B3A8();
  unint64_t v61 = v17;
  if ((v17 & 0xF000000000000000) != 0xF000000000000000)
  {
    uint64_t v43 = v60;
    unint64_t v44 = v61;
    uint64_t v24 = v45;
    unint64_t v37 = v61;
    uint64_t v36 = v60;
    uint64_t v65 = v60;
    unint64_t v66 = v61;
    sub_22910F0D4(v60, v61);
    uint64_t v38 = v64;
    v64[0] = v36;
    v64[1] = v37;
    sub_22911DFA8();
    sub_22912B668();
    uint64_t v39 = v24;
    uint64_t v40 = v24;
    if (v24)
    {
      uint64_t v30 = v40;
      sub_22910F1C0(v36, v37);
      id v31 = v30;
    }
    else
    {
      uint64_t v25 = v39;
      id v34 = sub_229116870(v48, v49, v56);
      uint64_t v35 = v25;
      if (!v25)
      {
        id v33 = v34;
        id v62 = v34;
        sub_229116060(v34, v55, v50);

        (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v56, v51);
        sub_22910F1C0(v36, v37);
        goto LABEL_7;
      }
      unint64_t v29 = v35;
      (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v56, v51);
      sub_22910F1C0(v36, v37);
      id v31 = v29;
    }
    uint64_t v32 = v31;
    id v27 = v31;
    uint64_t v63 = v32;
    id v28 = v32;
    sub_229116364(v32, v46, v57);

    goto LABEL_7;
  }
  sub_2291125C0();
  int v41 = 1;
  uint64_t v18 = (void *)swift_allocError();
  char v19 = v41;
  uint64_t v20 = v57;
  id v42 = v18;
  uint64_t v22 = v21;
  uint64_t v23 = v46;
  *(void *)uint64_t v22 = 1;
  *(void *)(v22 + 8) = 0;
  *(unsigned char *)(v22 + 16) = v19 & 1;
  sub_229116364(v18, v23, v20);

LABEL_7:
  swift_release();
  return swift_release();
}

uint64_t sub_229115F4C()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  sub_22910F1C0(*(void *)(v0 + 72), *(void *)(v0 + 80));
  return swift_deallocObject();
}

uint64_t sub_229115FB0()
{
  return sub_229115A94(v0[2], v0[3], v0[4], v0[5], v0[6], v0[7], v0[8], v0[9], v0[10]);
}

uint64_t block_copy_helper_48(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_49()
{
  return swift_release();
}

void sub_229116060(void *a1, uint64_t a2, uint64_t a3)
{
  id v21 = a1;
  uint64_t v18 = a2;
  uint64_t v19 = a3;
  uint64_t v22 = 0;
  uint64_t v20 = sub_22911E128;
  uint64_t v42 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  uint64_t v26 = sub_22912B4A8();
  uint64_t v23 = *(void *)(v26 - 8);
  uint64_t v24 = v26 - 8;
  unint64_t v16 = (*(void *)(v23 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0, v3, v4, v5);
  uint64_t v25 = (char *)&v16 - v16;
  uint64_t v30 = sub_22912B4C8();
  uint64_t v27 = *(void *)(v30 - 8);
  uint64_t v28 = v30 - 8;
  unint64_t v17 = (*(void *)(v27 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v22, v18, v19, v6);
  unint64_t v29 = (char *)&v16 - v17;
  uint64_t v42 = v7;
  uint64_t v40 = v8;
  uint64_t v41 = v9;
  sub_229111CD8();
  id v32 = (id)sub_22912B998();
  swift_retain();
  id v10 = v21;
  uint64_t v11 = swift_allocObject();
  uint64_t v12 = v19;
  uint64_t v13 = v20;
  uint64_t v14 = (void *)v11;
  id v15 = v21;
  v14[2] = v18;
  v14[3] = v12;
  v14[4] = v15;
  uint64_t v38 = v13;
  uint64_t v39 = v14;
  aBlocunsigned int k = MEMORY[0x263EF8330];
  int v34 = 1107296256;
  int v35 = 0;
  uint64_t v36 = sub_229113FAC;
  unint64_t v37 = &block_descriptor_95;
  id v31 = _Block_copy(&aBlock);
  swift_release();
  sub_229113FFC();
  sub_229114014();
  MEMORY[0x22A6B1090](v22, v29, v25, v31);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v26);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v29, v30);
  _Block_release(v31);
}

uint64_t sub_2291162F4(void (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return swift_release();
}

void sub_229116364(void *a1, uint64_t a2, uint64_t a3)
{
  id v21 = a1;
  uint64_t v18 = a2;
  uint64_t v19 = a3;
  uint64_t v22 = 0;
  uint64_t v20 = sub_22911E06C;
  uint64_t v42 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  uint64_t v26 = sub_22912B4A8();
  uint64_t v23 = *(void *)(v26 - 8);
  uint64_t v24 = v26 - 8;
  unint64_t v16 = (*(void *)(v23 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0, v3, v4, v5);
  uint64_t v25 = (char *)&v16 - v16;
  uint64_t v30 = sub_22912B4C8();
  uint64_t v27 = *(void *)(v30 - 8);
  uint64_t v28 = v30 - 8;
  unint64_t v17 = (*(void *)(v27 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v22, v18, v19, v6);
  unint64_t v29 = (char *)&v16 - v17;
  uint64_t v42 = v7;
  uint64_t v40 = v8;
  uint64_t v41 = v9;
  sub_229111CD8();
  id v32 = (id)sub_22912B998();
  swift_retain();
  id v10 = v21;
  uint64_t v11 = swift_allocObject();
  uint64_t v12 = v19;
  uint64_t v13 = v20;
  uint64_t v14 = (void *)v11;
  id v15 = v21;
  v14[2] = v18;
  v14[3] = v12;
  v14[4] = v15;
  uint64_t v38 = v13;
  uint64_t v39 = v14;
  aBlocunsigned int k = MEMORY[0x263EF8330];
  int v34 = 1107296256;
  int v35 = 0;
  uint64_t v36 = sub_229113FAC;
  unint64_t v37 = &block_descriptor_89;
  id v31 = _Block_copy(&aBlock);
  swift_release();
  sub_229113FFC();
  sub_229114014();
  MEMORY[0x22A6B1090](v22, v29, v25, v31);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v26);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v29, v30);
  _Block_release(v31);
}

uint64_t sub_2291165F8(void (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return swift_release();
}

uint64_t sub_2291167E0()
{
  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_229116820(uint64_t a1)
{
  return sub_2291127C8(a1, *(void *)(v1 + 16));
}

uint64_t sub_229116828()
{
  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_229116868(void *a1)
{
  sub_229112844(a1, *(void *)(v1 + 16));
}

id sub_229116870(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v129 = a1;
  uint64_t v128 = a2;
  uint64_t v139 = a3;
  uint64_t v122 = 0;
  v91 = sub_2291176E8;
  v92 = sub_229117904;
  v170 = 0;
  v169 = 0;
  v168 = 0;
  v167 = 0;
  v166 = 0;
  v165 = 0;
  uint64_t v163 = 0;
  uint64_t v164 = 0;
  uint64_t v162 = 0;
  uint64_t v161 = 0;
  uint64_t v159 = 0;
  unint64_t v160 = 0;
  uint64_t v152 = 0;
  unint64_t v153 = 0;
  uint64_t v144 = 0;
  unint64_t v145 = 0;
  unint64_t v93 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2682C3E60) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0, v3, v4, v5);
  uint64_t v94 = (uint64_t)&v53 - v93;
  uint64_t v95 = sub_22912B5B8();
  uint64_t v96 = *(void *)(v95 - 8);
  uint64_t v97 = v95 - 8;
  unint64_t v98 = (*(void *)(v96 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v9 = MEMORY[0x270FA5388](v122, v6, v7, v8);
  uint64_t v99 = (uint64_t)&v53 - v98;
  unint64_t v100 = (v10 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v9, (char *)&v53 - v98, v11, v12);
  v101 = (char *)&v53 - v100;
  v170 = (char *)&v53 - v100;
  uint64_t v102 = sub_22912B588();
  uint64_t v103 = *(void *)(v102 - 8);
  uint64_t v104 = v102 - 8;
  unint64_t v105 = (*(void *)(v103 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v122, v13, v14, v15);
  v106 = (char *)&v53 - v105;
  v169 = (char *)&v53 - v105;
  uint64_t v107 = sub_22912B558();
  uint64_t v108 = *(void *)(v107 - 8);
  uint64_t v109 = v107 - 8;
  unint64_t v110 = (*(void *)(v108 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v122, v16, v17, v18);
  v111 = (char *)&v53 - v110;
  v168 = (char *)&v53 - v110;
  uint64_t v112 = sub_22912B4F8();
  uint64_t v113 = *(void *)(v112 - 8);
  uint64_t v114 = v112 - 8;
  unint64_t v115 = (*(void *)(v113 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v122, v19, v20, v21);
  v116 = (char *)&v53 - v115;
  v167 = (char *)&v53 - v115;
  uint64_t v117 = sub_22912B698();
  uint64_t v118 = *(void *)(v117 - 8);
  uint64_t v119 = v117 - 8;
  unint64_t v120 = (*(void *)(v118 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v122, v22, v23, v24);
  uint64_t v121 = (uint64_t)&v53 - v120;
  uint64_t v123 = sub_22912B528();
  uint64_t v124 = *(void *)(v123 - 8);
  uint64_t v125 = v123 - 8;
  unint64_t v126 = (*(void *)(v124 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v122, v25, v26, v27);
  v138 = (char *)&v53 - v126;
  v166 = (char *)&v53 - v126;
  uint64_t v130 = sub_22912B6E8();
  uint64_t v131 = *(void *)(v130 - 8);
  uint64_t v132 = v130 - 8;
  uint64_t v134 = *(void *)(v131 + 64);
  unint64_t v133 = (v134 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v29 = MEMORY[0x270FA5388](v129, v128, v139, v28);
  uint64_t v135 = (uint64_t)&v53 - v133;
  unint64_t v136 = (v134 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v32 = MEMORY[0x270FA5388](v29, v30, v31, (char *)&v53 - v133);
  v137 = (char *)&v53 - v136;
  v165 = (char *)&v53 - v136;
  uint64_t v163 = v32;
  uint64_t v164 = v33;
  uint64_t v162 = v34;
  uint64_t v161 = v35;
  sub_22912B6D8();
  uint64_t v36 = v140;
  sub_22912B6B8();
  uint64_t v141 = v36;
  uint64_t v142 = v36;
  if (v36)
  {
    uint64_t v55 = v142;
    (*(void (**)(char *, uint64_t))(v131 + 8))(v137, v130);
    uint64_t v60 = v55;
    return (id)v66;
  }
  sub_22912B508();
  uint64_t v90 = 0;
  uint64_t v77 = 4;
  uint64_t v75 = MEMORY[0x263F8E778];
  uint64_t v37 = sub_22912BB68();
  *uint64_t v38 = 0;
  v38[1] = 0;
  v38[2] = 0;
  v38[3] = 1;
  sub_22910F644();
  uint64_t v78 = v37;
  uint64_t v76 = v37 + 32;
  swift_bridgeObjectRetain();
  uint64_t v158 = v76;
  v80 = &v159;
  sub_22912B3F8();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v79 = &v157;
  char v157 = 4;
  sub_229117788();
  uint64_t v88 = MEMORY[0x263F06F78];
  sub_22912B968();
  sub_22912B6C8();
  uint64_t v81 = sub_22912B678();
  unint64_t v82 = v39;
  (*(void (**)(uint64_t, uint64_t))(v118 + 8))(v121, v117);
  sub_22912B408();
  sub_22910F1C0(v81, v82);
  sub_22912B6F8();
  uint64_t v83 = v159;
  unint64_t v84 = v160;
  sub_22910F0D4(v159, v160);
  v87 = v156;
  v156[0] = v83;
  v156[1] = v84;
  unint64_t v85 = sub_229117804();
  unint64_t v86 = sub_229117888();
  sub_22912B4D8();
  sub_22910F18C((uint64_t)v87);
  uint64_t v40 = v90;
  sub_22912B4E8();
  uint64_t v89 = v40;
  if (v40)
  {
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v73 = v154;
  unint64_t v74 = v155;
  uint64_t v152 = v154;
  unint64_t v153 = v155;
  if (sub_22912B3E8() != *(void *)((char *)v127 + OBJC_IVAR___MCLECv2Encryption_symmetricKeyLength))
  {
    uint64_t v56 = *(void *)((char *)v127 + OBJC_IVAR___MCLECv2Encryption_symmetricKeyLength);
    uint64_t v58 = sub_22912B3E8();
    sub_2291125C0();
    int v57 = 0;
    uint64_t v48 = swift_allocError();
    char v49 = v57;
    uint64_t v50 = v48;
    uint64_t v51 = v58;
    uint64_t v59 = v50;
    *(void *)uint64_t v52 = v56;
    *(void *)(v52 + 8) = v51;
    *(unsigned char *)(v52 + 16) = v49 & 1;
    swift_willThrow();
    sub_22910F1C0(v73, v74);
    (*(void (**)(char *, uint64_t))(v113 + 8))(v116, v112);
    sub_22910F18C((uint64_t)&v159);
    (*(void (**)(char *, uint64_t))(v124 + 8))(v138, v123);
    (*(void (**)(char *, uint64_t))(v131 + 8))(v137, v130);
    uint64_t v60 = v59;
    return (id)v66;
  }
  sub_22910F0D4(v73, v74);
  uint64_t v148 = v73;
  unint64_t v149 = v74;
  sub_22910FFC4();
  uint64_t v67 = 16;
  uint64_t v70 = MEMORY[0x263F06F78];
  sub_22912B948();
  uint64_t v146 = v150;
  uint64_t v147 = v151;
  sub_22912B548();
  uint64_t v68 = MEMORY[0x22A6B0B10](0, v67);
  unint64_t v69 = v41;
  uint64_t v144 = v68;
  unint64_t v145 = v41;
  sub_22910F0D4(v68, v41);
  uint64_t v42 = v89;
  v143[2] = v68;
  v143[3] = v69;
  sub_22912B578();
  uint64_t v71 = v42;
  uint64_t v72 = v42;
  if (v42)
  {
LABEL_10:
    uint64_t v54 = v72;
    sub_22910F1C0(v68, v69);
    (*(void (**)(char *, uint64_t))(v108 + 8))(v111, v107);
    sub_22910F1C0(v73, v74);
    (*(void (**)(char *, uint64_t))(v113 + 8))(v116, v112);
    sub_22910F18C((uint64_t)&v159);
    (*(void (**)(char *, uint64_t))(v124 + 8))(v138, v123);
    (*(void (**)(char *, uint64_t))(v131 + 8))(v137, v130);
    uint64_t v60 = v54;
    return (id)v66;
  }
  uint64_t v63 = v143;
  v143[0] = v129;
  v143[1] = v128;
  (*(void (**)(uint64_t, char *, uint64_t))(v103 + 16))(v94, v106, v102);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v103 + 56))(v94, 0, 1, v102);
  uint64_t v43 = v71;
  sub_22912B568();
  uint64_t v64 = v43;
  uint64_t v65 = v43;
  if (!v43)
  {
    unint64_t v44 = v127;
    sub_2291179A4(v94);
    uint64_t v61 = type metadata accessor for MCLECv2Encryption.ECv2EncryptedDataContainer();
    (*(void (**)(uint64_t, char *, uint64_t))(v96 + 16))(v99, v101, v95);
    (*(void (**)(uint64_t, char *, uint64_t))(v131 + 16))(v135, v137, v130);
    uint64_t v45 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v118 + 16))(v121, v139, v117);
    char v46 = (*(uint64_t (**)(uint64_t))((*v44 & *MEMORY[0x263F8EED0]) + 0x68))(v45);
    id v62 = sub_229117A7C(v99, v135, v121, v46 & 1);
    (*(void (**)(char *, uint64_t))(v96 + 8))(v101, v95);
    (*(void (**)(char *, uint64_t))(v103 + 8))(v106, v102);
    sub_22910F1C0(v68, v69);
    (*(void (**)(char *, uint64_t))(v108 + 8))(v111, v107);
    sub_22910F1C0(v73, v74);
    (*(void (**)(char *, uint64_t))(v113 + 8))(v116, v112);
    sub_22910F18C((uint64_t)&v159);
    (*(void (**)(char *, uint64_t))(v124 + 8))(v138, v123);
    (*(void (**)(char *, uint64_t))(v131 + 8))(v137, v130);
    return v62;
  }
  uint64_t v53 = v65;
  sub_2291179A4(v94);
  (*(void (**)(char *, uint64_t))(v103 + 8))(v106, v102);
  sub_22910F1C0(v68, v69);
  (*(void (**)(char *, uint64_t))(v108 + 8))(v111, v107);
  sub_22910F1C0(v73, v74);
  (*(void (**)(char *, uint64_t))(v113 + 8))(v116, v112);
  sub_22910F18C((uint64_t)&v159);
  (*(void (**)(char *, uint64_t))(v124 + 8))(v138, v123);
  (*(void (**)(char *, uint64_t))(v131 + 8))(v137, v130);
  uint64_t v60 = v53;
  return (id)v66;
}

uint64_t sub_2291176E8@<X0>(uint64_t *a1@<X8>)
{
  sub_22912B908();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2682C3DC8);
  sub_22910EFD8();
  uint64_t result = sub_22912B448();
  *a1 = result;
  a1[1] = v2;
  return result;
}

unint64_t sub_229117788()
{
  uint64_t v2 = qword_2682C3E68;
  if (!qword_2682C3E68)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682C3E68);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_229117804()
{
  uint64_t v2 = qword_2682C3E70;
  if (!qword_2682C3E70)
  {
    sub_22912B6F8();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682C3E70);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_229117888()
{
  uint64_t v2 = qword_2682C3E78;
  if (!qword_2682C3E78)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682C3E78);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_229117904@<X0>(uint64_t *a1@<X8>)
{
  sub_22912B908();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2682C3DC8);
  sub_22910EFD8();
  uint64_t result = sub_22912B448();
  *a1 = result;
  a1[1] = v2;
  return result;
}

uint64_t sub_2291179A4(uint64_t a1)
{
  uint64_t v3 = sub_22912B588();
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return a1;
}

uint64_t type metadata accessor for MCLECv2Encryption.ECv2EncryptedDataContainer()
{
  return self;
}

id sub_229117A7C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  id v5 = objc_allocWithZone(v4);
  return sub_229119998(a1, a2, a3, a4 & 1);
}

uint64_t MCLECv2Encryption.ECv2EncryptionError.errorDescription.getter(uint64_t a1, uint64_t a2, char a3)
{
  if (a3)
  {
    sub_22912BB58();
    sub_22912B818();
    sub_22912BB48();
    swift_bridgeObjectRelease();
    sub_22912BB18();
  }
  else
  {
    sub_22912BB58();
    sub_22912B818();
    sub_22912BB48();
    swift_bridgeObjectRelease();
    sub_22912BB18();
    sub_22912B818();
    sub_22912BB48();
    swift_bridgeObjectRelease();
    sub_22912BB28();
    sub_22912B818();
    sub_22912BB48();
    swift_bridgeObjectRelease();
    sub_22912BB28();
  }
  sub_22912B818();
  sub_22912BB48();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_229111228();
  return sub_22912B808();
}

uint64_t sub_229117DF4()
{
  return MCLECv2Encryption.ECv2EncryptionError.errorDescription.getter(*(void *)v0, *(void *)(v0 + 8), *(unsigned char *)(v0 + 16) & 1);
}

uint64_t sub_229117E1C()
{
  return sub_22912B358();
}

uint64_t sub_229117E34()
{
  return sub_22912B378();
}

uint64_t sub_229117E4C()
{
  return sub_22912B348();
}

uint64_t sub_229117E64()
{
  return sub_22912BBC8();
}

uint64_t sub_229117E7C()
{
  return sub_22912BBB8();
}

uint64_t sub_229117E94()
{
  return sub_22912BBD8();
}

uint64_t sub_229117EAC()
{
  return sub_22912BBA8();
}

uint64_t variable initialization expression of MCLECv2Encryption.ECv2EncryptedDataContainer._encryptionVersion()
{
  return sub_22912B818();
}

uint64_t sub_229117F70()
{
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR___MCLECv2EncryptedDataContainer__encryptionVersion);
  swift_bridgeObjectRetain();
  return v2;
}

void *sub_229118018()
{
  uint64_t v3 = *(void **)(v0 + OBJC_IVAR___MCLECv2EncryptedDataContainer__encryptedData);
  id v1 = v3;
  return v3;
}

uint64_t sub_2291180D4()
{
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR___MCLECv2EncryptedData_ephemeralPublicKey);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_22911819C()
{
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR___MCLECv2EncryptedData_gcmEncryptedData);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_229118264()
{
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR___MCLECv2EncryptedData_gcmTag);
  swift_bridgeObjectRetain();
  return v2;
}

id sub_2291182B0(uint64_t a1, uint64_t a2, char a3)
{
  id v4 = objc_allocWithZone(v3);
  return sub_229118300(a1, a2, a3 & 1);
}

id sub_229118300(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v58 = a1;
  uint64_t v57 = a2;
  unsigned int v64 = a3;
  id v72 = 0;
  uint64_t v71 = 0;
  uint64_t v70 = 0;
  char v69 = 0;
  uint64_t v67 = 0;
  unint64_t v68 = 0;
  uint64_t v59 = sub_22912B698();
  uint64_t v60 = *(void *)(v59 - 8);
  uint64_t v61 = v59 - 8;
  unint64_t v62 = (*(void *)(v60 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v63 = (char *)&v33 - v62;
  uint64_t v71 = MEMORY[0x270FA5388](v58, v57, v64, v4);
  uint64_t v70 = v5;
  char v69 = v6 & 1;
  id v7 = v3;
  id v8 = v3;
  id v9 = v3;
  id v72 = v3;
  if (v64)
  {
    uint64_t v10 = sub_22912B418();
    uint64_t v53 = &v67;
    uint64_t v67 = v10;
    unint64_t v68 = v11;
    uint64_t v52 = &v65;
    char v65 = 4;
    sub_229117788();
    sub_22912B968();
    sub_22912B6C8();
    uint64_t v54 = sub_22912B678();
    unint64_t v55 = v12;
    (*(void (**)(char *, uint64_t))(v60 + 8))(v63, v59);
    sub_22912B408();
    sub_22910F1C0(v54, v55);
  }
  else
  {
    sub_22912B6C8();
    uint64_t v50 = sub_22912B678();
    unint64_t v51 = v13;
    (*(void (**)(char *, uint64_t))(v60 + 8))(v63, v59);
    uint64_t v67 = v50;
    unint64_t v68 = v51;
  }
  char v46 = &v67;
  uint64_t v34 = v67;
  unint64_t v35 = v68;
  sub_22910F0D4(v67, v68);
  sub_229118768();
  uint64_t v36 = sub_22912B3C8();
  uint64_t v37 = v14;
  sub_22910F1C0(v34, v35);
  uint64_t v15 = v37;
  uint64_t v16 = v56;
  uint64_t v17 = (uint64_t *)&v56[OBJC_IVAR___MCLECv2EncryptedData_ephemeralPublicKey];
  *uint64_t v17 = v36;
  v17[1] = v15;

  uint64_t v38 = sub_22912B598();
  unint64_t v39 = v18;
  sub_229118768();
  uint64_t v40 = sub_22912B3C8();
  uint64_t v41 = v19;
  sub_22910F1C0(v38, v39);
  uint64_t v20 = v41;
  uint64_t v21 = v56;
  uint64_t v22 = (uint64_t *)&v56[OBJC_IVAR___MCLECv2EncryptedData_gcmEncryptedData];
  uint64_t *v22 = v40;
  v22[1] = v20;

  uint64_t v42 = sub_22912B5A8();
  unint64_t v43 = v23;
  sub_229118768();
  uint64_t v44 = sub_22912B3C8();
  uint64_t v45 = v24;
  sub_22910F1C0(v42, v43);
  uint64_t v25 = v45;
  uint64_t v26 = v56;
  uint64_t v27 = (uint64_t *)&v56[OBJC_IVAR___MCLECv2EncryptedData_gcmTag];
  *uint64_t v27 = v44;
  v27[1] = v25;

  sub_22910F18C((uint64_t)v46);
  id v47 = v72;
  uint64_t v48 = 0;
  uint64_t v28 = (objc_class *)type metadata accessor for MCLECv2Encryption.ECv2EncryptedDataContainer.EncryptedData();
  v66.receiver = v47;
  v66.super_class = v28;
  id v49 = objc_msgSendSuper2(&v66, sel_init);
  id v29 = v49;
  id v72 = v49;
  uint64_t v30 = sub_22912B5B8();
  (*(void (**)(uint64_t))(*(void *)(v30 - 8) + 8))(v57);
  uint64_t v31 = sub_22912B6E8();
  (*(void (**)(uint64_t))(*(void *)(v31 - 8) + 8))(v58);

  return v49;
}

uint64_t sub_229118768()
{
  return 0;
}

id MCLECv2Encryption.ECv2EncryptedDataContainer.EncryptedData.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t MCLECv2Encryption.ECv2EncryptedDataContainer.EncryptedData.init()()
{
  if (!"JITAppKit.EncryptedData")
  {
    sub_22912BAD8();
    __break(1u);
  }
  uint64_t result = sub_22911B8E4((uint64_t)"JITAppKit.EncryptedData", 23, (unint64_t)"init()", 6, 2, (unint64_t)"JITAppKit/MCLECv2Encryption.swift", 33, 2, v1, 0xE1uLL, 0x10uLL);
  __break(1u);
  return result;
}

BOOL sub_2291188D0(char a1, char a2)
{
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = 2;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  if (a2)
  {
    if (a2 == 1) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = 2;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v4 == v3;
}

uint64_t sub_2291189A4()
{
  return sub_22912BBE8();
}

uint64_t sub_229118A50()
{
  swift_bridgeObjectRetain();
  sub_22912B818();
  swift_bridgeObjectRetain();
  char v4 = sub_22912B828();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v4)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v5 = 0;
LABEL_8:
    swift_bridgeObjectRelease();
    return v5;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_22912B818();
  swift_bridgeObjectRetain();
  char v3 = sub_22912B828();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v3)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v5 = 1;
    goto LABEL_8;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_22912B818();
  swift_bridgeObjectRetain();
  char v2 = sub_22912B828();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v2)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v5 = 2;
    goto LABEL_8;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 3;
}

uint64_t sub_229118C84()
{
  return 3;
}

uint64_t sub_229118C9C()
{
  return sub_22912BA88();
}

uint64_t sub_229118CE8()
{
  return 0;
}

uint64_t sub_229118D04()
{
  return sub_22912B818();
}

BOOL sub_229118DD8(char *a1, char *a2)
{
  return sub_2291188D0(*a1, *a2);
}

uint64_t sub_229118DFC()
{
  return sub_229118C9C();
}

uint64_t sub_229118E18()
{
  return sub_2291189A4();
}

uint64_t sub_229118E34()
{
  return sub_22912B748();
}

uint64_t sub_229118E4C()
{
  return sub_229118D04();
}

uint64_t sub_229118E68@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_229118A50();
  *a1 = result;
  return result;
}

uint64_t sub_229118E94()
{
  return sub_229118CE8();
}

uint64_t sub_229118EB4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_229118C84();
  *a1 = result;
  return result;
}

uint64_t sub_229118EE0()
{
  return sub_22912BC08();
}

uint64_t sub_229118F10()
{
  return sub_22912BC18();
}

id MCLECv2Encryption.ECv2EncryptedDataContainer.EncryptedData.__deallocating_deinit()
{
  char v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MCLECv2Encryption.ECv2EncryptedDataContainer.EncryptedData();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t MCLECv2Encryption.ECv2EncryptedDataContainer.EncryptedData.encode(to:)(uint64_t a1)
{
  uint64_t v20 = a1;
  uint64_t v38 = 0;
  uint64_t v37 = 0;
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2682C3EB0);
  uint64_t v21 = *(void *)(v31 - 8);
  uint64_t v22 = v31 - 8;
  unint64_t v23 = (*(void *)(v21 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v26 = (char *)v9 - v23;
  uint64_t v38 = (void *)MEMORY[0x270FA5388](v20, v2, v3, v4);
  uint64_t v37 = v1;
  uint64_t v24 = v38[3];
  uint64_t v25 = v38[4];
  __swift_project_boxed_opaque_existential_1(v38, v24);
  sub_22911BD64();
  sub_22912BBF8();
  uint64_t v5 = v28;
  uint64_t v29 = *(void *)(v27 + OBJC_IVAR___MCLECv2EncryptedData_ephemeralPublicKey);
  uint64_t v30 = *(void *)(v27 + OBJC_IVAR___MCLECv2EncryptedData_ephemeralPublicKey + 8);
  swift_bridgeObjectRetain();
  char v36 = 0;
  sub_22912BAF8();
  uint64_t v32 = v5;
  uint64_t v33 = v5;
  if (v5)
  {
    uint64_t v10 = v33;
    swift_bridgeObjectRelease();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v26, v31);
    uint64_t v11 = v10;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v6 = v32;
    uint64_t v16 = *(void *)(v27 + OBJC_IVAR___MCLECv2EncryptedData_gcmEncryptedData);
    uint64_t v17 = *(void *)(v27 + OBJC_IVAR___MCLECv2EncryptedData_gcmEncryptedData + 8);
    swift_bridgeObjectRetain();
    char v35 = 1;
    sub_22912BAF8();
    uint64_t v18 = v6;
    uint64_t v19 = v6;
    if (v6)
    {
      v9[2] = v19;
      swift_bridgeObjectRelease();
      return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v26, v31);
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v7 = v18;
      uint64_t v12 = *(void *)(v27 + OBJC_IVAR___MCLECv2EncryptedData_gcmTag);
      uint64_t v13 = *(void *)(v27 + OBJC_IVAR___MCLECv2EncryptedData_gcmTag + 8);
      swift_bridgeObjectRetain();
      char v34 = 2;
      sub_22912BAF8();
      uint64_t v14 = v7;
      uint64_t v15 = v7;
      if (v7) {
        v9[1] = v15;
      }
      swift_bridgeObjectRelease();
      return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v26, v31);
    }
  }
  return result;
}

uint64_t sub_22911933C()
{
  return (*(uint64_t (**)(void))((**v0 & *MEMORY[0x263F8EED0]) + 0x70))();
}

uint64_t sub_2291193CC()
{
  type metadata accessor for MCLECv2Encryption.ECv2EncryptedDataContainer();
  sub_22911BE5C();
  uint64_t v1 = sub_22911944C();
  uint64_t v2 = sub_229119484(v1);
  swift_release();
  return v2;
}

uint64_t sub_22911944C()
{
  return sub_22912B328();
}

uint64_t sub_229119484(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v25 = 0;
  unint64_t v26 = 0;
  uint64_t v19 = a1;
  uint64_t v18 = v1;
  uint64_t v14 = sub_22912B318();
  unint64_t v15 = v2;
  if ((v2 & 0xF000000000000000) == 0xF000000000000000) {
    goto LABEL_14;
  }
  uint64_t v25 = v14;
  unint64_t v26 = v2;
  id v21 = 0;
  id v10 = self;
  sub_22910F0D4(v14, v15);
  id v12 = (id)sub_22912B3B8();
  sub_22910F1C0(v14, v15);
  id v17 = 0;
  id v13 = objc_msgSend(v10, sel_JSONObjectWithData_options_error_, v12, 4, &v17);
  id v11 = v17;
  id v3 = v17;
  uint64_t v4 = v21;
  id v21 = v11;

  if (v13)
  {
    sub_22912B9D8();
    swift_unknownObjectRelease();
  }
  else
  {
    id v6 = v21;
    id v7 = (id)sub_22912B398();

    swift_willThrow();
    memset(v22, 0, sizeof(v22));
    uint64_t v23 = 0;
  }
  if (!v23)
  {
    sub_22911BEE0((uint64_t)v22);
    sub_22910F1C0(v14, v15);
LABEL_14:
    __swift_instantiateConcreteTypeFromMangledName(&qword_2682C3EC0);
    sub_22912BB68();
    return sub_22912B738();
  }
  sub_22911BFD0((uint64_t)v22, (uint64_t)v24);
  sub_22911BFEC((uint64_t)v24, (uint64_t)v20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2682C3EC8);
  if (swift_dynamicCast()) {
    uint64_t v9 = v16;
  }
  else {
    uint64_t v9 = 0;
  }
  if (!v9)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v24);
    sub_22910F1C0(v14, v15);
    goto LABEL_14;
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v24);
  sub_22910F1C0(v14, v15);
  return v9;
}

uint64_t sub_22911994C()
{
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR___MCLECv2EncryptedDataContainer__publicKeyHash);
  swift_bridgeObjectRetain();
  return v2;
}

id sub_229119998(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  uint64_t v55 = a1;
  uint64_t v57 = a2;
  uint64_t v44 = a3;
  unsigned int v56 = a4;
  uint64_t v5 = v4;
  unsigned int v64 = v5;
  uint64_t v65 = 0;
  id v72 = sub_229119F8C;
  unint64_t v82 = 0;
  id v81 = 0;
  uint64_t v80 = 0;
  uint64_t v79 = 0;
  uint64_t v78 = 0;
  char v77 = 0;
  uint64_t v70 = 0;
  uint64_t v45 = sub_22912B5B8();
  uint64_t v46 = *(void *)(v45 - 8);
  uint64_t v47 = v45 - 8;
  unint64_t v48 = (*(void *)(v46 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0, v7, v8, v9);
  uint64_t v49 = (uint64_t)&v37 - v48;
  uint64_t v50 = sub_22912B6E8();
  uint64_t v51 = *(void *)(v50 - 8);
  uint64_t v52 = v50 - 8;
  unint64_t v53 = (*(void *)(v51 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v65, v10, v11, v12);
  uint64_t v54 = (uint64_t)&v37 - v53;
  uint64_t v58 = sub_22912B4F8();
  uint64_t v59 = *(void *)(v58 - 8);
  uint64_t v60 = v58 - 8;
  unint64_t v61 = (*(void *)(v59 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v14 = (void *)MEMORY[0x270FA5388](v64, v57, v13, v56);
  unint64_t v68 = (char *)&v37 - v61;
  unint64_t v82 = (char *)&v37 - v61;
  uint64_t v80 = v15;
  uint64_t v79 = v16;
  uint64_t v78 = a3;
  int v62 = 1;
  char v77 = v17 & 1;
  id v18 = v14;
  uint64_t v19 = v64;
  uint64_t v20 = v64;
  id v81 = v64;
  uint64_t v63 = OBJC_IVAR___MCLECv2EncryptedDataContainer__encryptionVersion;
  uint64_t v21 = sub_22912B818();
  id v22 = v64;
  uint64_t v23 = (uint64_t *)&v64[v63];
  uint64_t *v23 = v21;
  v23[1] = v24;

  uint64_t v66 = sub_22912B6F8();
  uint64_t v25 = sub_22912B658();
  char v69 = v76;
  v76[0] = v25;
  v76[1] = v26;
  unint64_t v67 = sub_229117804();
  sub_229117888();
  uint64_t v71 = MEMORY[0x263F06F78];
  sub_22912B4D8();
  sub_22910F18C((uint64_t)v69);
  sub_22912B4E8();
  uint64_t v37 = v74;
  unint64_t v38 = v75;
  sub_229118768();
  uint64_t v39 = sub_22912B3C8();
  uint64_t v40 = v27;
  sub_22910F1C0(v37, v38);
  uint64_t v28 = v40;
  id v29 = v64;
  uint64_t v30 = (uint64_t *)&v64[OBJC_IVAR___MCLECv2EncryptedDataContainer__publicKeyHash];
  uint64_t *v30 = v39;
  v30[1] = v28;

  uint64_t v42 = 0;
  type metadata accessor for MCLECv2Encryption.ECv2EncryptedDataContainer.EncryptedData();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v51 + 16))(v54, v57, v50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v46 + 16))(v49, v55, v45);
  id v31 = sub_2291182B0(v54, v49, v56 & 1);
  id v32 = v64;
  *(void *)&v64[OBJC_IVAR___MCLECv2EncryptedDataContainer__encryptedData] = v31;

  (*(void (**)(char *, uint64_t))(v59 + 8))(v68, v58);
  id v41 = v81;
  uint64_t v33 = (objc_class *)type metadata accessor for MCLECv2Encryption.ECv2EncryptedDataContainer();
  v73.receiver = v41;
  v73.super_class = v33;
  id v43 = objc_msgSendSuper2(&v73, sel_init);
  id v34 = v43;
  id v81 = v43;
  uint64_t v35 = sub_22912B698();
  (*(void (**)(uint64_t))(*(void *)(v35 - 8) + 8))(v44);
  (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v57, v50);
  (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v55, v45);

  return v43;
}

uint64_t type metadata accessor for MCLECv2Encryption.ECv2EncryptedDataContainer.EncryptedData()
{
  return self;
}

uint64_t sub_229119F8C@<X0>(uint64_t *a1@<X8>)
{
  sub_22912B908();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2682C3DC8);
  sub_22910EFD8();
  uint64_t result = sub_22912B448();
  *a1 = result;
  a1[1] = v2;
  return result;
}

id MCLECv2Encryption.ECv2EncryptedDataContainer.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t MCLECv2Encryption.ECv2EncryptedDataContainer.init()()
{
  if (!"JITAppKit.ECv2EncryptedDataContainer")
  {
    sub_22912BAD8();
    __break(1u);
  }
  uint64_t result = sub_22911B8E4((uint64_t)"JITAppKit.ECv2EncryptedDataContainer", 36, (unint64_t)"init()", 6, 2, (unint64_t)"JITAppKit/MCLECv2Encryption.swift", 33, 2, v1, 0xDBuLL, 0xFuLL);
  __break(1u);
  return result;
}

BOOL sub_22911A18C(char a1, char a2)
{
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = 2;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  if (a2)
  {
    if (a2 == 1) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = 2;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v4 == v3;
}

uint64_t sub_22911A260()
{
  return sub_22912BBE8();
}

uint64_t sub_22911A30C()
{
  swift_bridgeObjectRetain();
  sub_22912B818();
  swift_bridgeObjectRetain();
  char v4 = sub_22912B828();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v4)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v5 = 0;
LABEL_8:
    swift_bridgeObjectRelease();
    return v5;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_22912B818();
  swift_bridgeObjectRetain();
  char v3 = sub_22912B828();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v3)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v5 = 1;
    goto LABEL_8;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_22912B818();
  swift_bridgeObjectRetain();
  char v2 = sub_22912B828();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v2)
  {
    swift_bridgeObjectRelease();
    unsigned __int8 v5 = 2;
    goto LABEL_8;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 3;
}

uint64_t sub_22911A540()
{
  return 3;
}

uint64_t sub_22911A558()
{
  return sub_22912BA88();
}

uint64_t sub_22911A5A4()
{
  return 0;
}

uint64_t sub_22911A5C0()
{
  return sub_22912B818();
}

BOOL sub_22911A694(char *a1, char *a2)
{
  return sub_22911A18C(*a1, *a2);
}

uint64_t sub_22911A6B8()
{
  return sub_22911A558();
}

uint64_t sub_22911A6D4()
{
  return sub_22911A260();
}

uint64_t sub_22911A6F0()
{
  return sub_22912B748();
}

uint64_t sub_22911A708()
{
  return sub_22911A5C0();
}

uint64_t sub_22911A724@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_22911A30C();
  *a1 = result;
  return result;
}

uint64_t sub_22911A750()
{
  return sub_22911A5A4();
}

uint64_t sub_22911A770@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_22911A540();
  *a1 = result;
  return result;
}

uint64_t sub_22911A79C()
{
  return sub_22912BC08();
}

uint64_t sub_22911A7CC()
{
  return sub_22912BC18();
}

id MCLECv2Encryption.ECv2EncryptedDataContainer.__deallocating_deinit()
{
  char v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MCLECv2Encryption.ECv2EncryptedDataContainer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t MCLECv2Encryption.ECv2EncryptedDataContainer.encode(to:)(uint64_t a1)
{
  uint64_t v23 = a1;
  uint64_t v42 = 0;
  uint64_t v41 = 0;
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2682C3ED8);
  uint64_t v24 = *(void *)(v34 - 8);
  uint64_t v25 = v34 - 8;
  unint64_t v26 = (*(void *)(v24 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  id v29 = (char *)v10 - v26;
  uint64_t v42 = (void *)MEMORY[0x270FA5388](v23, v2, v3, v4);
  uint64_t v41 = v1;
  uint64_t v27 = v42[3];
  uint64_t v28 = v42[4];
  __swift_project_boxed_opaque_existential_1(v42, v27);
  sub_22911C0D0();
  sub_22912BBF8();
  uint64_t v5 = v31;
  uint64_t v32 = *(void *)(v30 + OBJC_IVAR___MCLECv2EncryptedDataContainer__encryptionVersion);
  uint64_t v33 = *(void *)(v30 + OBJC_IVAR___MCLECv2EncryptedDataContainer__encryptionVersion + 8);
  swift_bridgeObjectRetain();
  char v40 = 0;
  sub_22912BAF8();
  uint64_t v35 = v5;
  uint64_t v36 = v5;
  if (v5)
  {
    uint64_t v11 = v36;
    swift_bridgeObjectRelease();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v29, v34);
    uint64_t v12 = v11;
  }
  else
  {
    swift_bridgeObjectRelease();
    id v17 = *(id *)(v30 + OBJC_IVAR___MCLECv2EncryptedDataContainer__encryptedData);
    id v6 = v17;
    uint64_t v20 = &v39;
    id v39 = v17;
    id v18 = &v38;
    char v38 = 1;
    uint64_t v19 = type metadata accessor for MCLECv2Encryption.ECv2EncryptedDataContainer.EncryptedData();
    sub_22911C150();
    uint64_t v7 = v35;
    sub_22912BB08();
    uint64_t v21 = v7;
    uint64_t v22 = v7;
    if (v7)
    {
      v10[2] = v22;

      return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v29, v34);
    }
    else
    {

      uint64_t v8 = v21;
      uint64_t v13 = *(void *)(v30 + OBJC_IVAR___MCLECv2EncryptedDataContainer__publicKeyHash);
      uint64_t v14 = *(void *)(v30 + OBJC_IVAR___MCLECv2EncryptedDataContainer__publicKeyHash + 8);
      swift_bridgeObjectRetain();
      char v37 = 2;
      sub_22912BAF8();
      uint64_t v15 = v8;
      uint64_t v16 = v8;
      if (v8) {
        v10[1] = v16;
      }
      swift_bridgeObjectRelease();
      return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v29, v34);
    }
  }
  return result;
}

uint64_t sub_22911AC34()
{
  return (*(uint64_t (**)(void))((**v0 & *MEMORY[0x263F8EED0]) + 0x78))();
}

id MCLECv2Encryption.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id MCLECv2Encryption.init()()
{
  id v49 = 0;
  uint64_t v41 = 0;
  unint64_t v25 = (*(void *)(*(void *)(sub_22912B988() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0, v1, v2, v3);
  uint64_t v40 = (uint64_t)&v25 - v25;
  unint64_t v26 = (*(void *)(*(void *)(sub_22912B978() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v41, v4, v5, v6);
  id v39 = (char *)&v25 - v26;
  uint64_t v7 = sub_22912B4C8();
  unint64_t v27 = (*(void *)(*(void *)(v7 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v7, v8, v9, v10);
  char v38 = (char *)&v25 - v27;
  id v11 = v0;
  id v12 = v0;
  id v13 = v0;
  id v49 = v0;
  uint64_t v42 = OBJC_IVAR___MCLECv2Encryption_queue;
  unint64_t v31 = sub_229111CD8();
  uint64_t v29 = 17;
  uint64_t v14 = sub_22912BB58();
  uint64_t v33 = &v47;
  uint64_t v47 = v14;
  uint64_t v48 = v15;
  int v30 = 1;
  sub_22912B818();
  uint64_t v28 = v16;
  sub_22912BB48();
  swift_bridgeObjectRelease();
  uint64_t v44 = (objc_class *)type metadata accessor for MCLECv2Encryption();
  sub_229111D68();
  sub_22912B818();
  uint64_t v32 = v17;
  sub_22912BB48();
  swift_bridgeObjectRelease();
  uint64_t v35 = v47;
  uint64_t v34 = v48;
  swift_bridgeObjectRetain();
  sub_229111228();
  uint64_t v36 = sub_22912B808();
  uint64_t v37 = v18;
  sub_229111DA0();
  sub_229111DB8();
  sub_229111E50(v40);
  uint64_t v19 = sub_22912B9B8();
  uint64_t v20 = v43;
  *(void *)&v43[v42] = v19;

  uint64_t v21 = v43;
  *(void *)&v43[OBJC_IVAR___MCLECv2Encryption_symmetricKeyLength] = 32;

  uint64_t v22 = v43;
  v43[OBJC_IVAR___MCLECv2Encryption_prependsEphemeralKeyPadding] = 0;

  v46.receiver = v49;
  v46.super_class = v44;
  id v45 = objc_msgSendSuper2(&v46, sel_init);
  id v23 = v45;
  id v49 = v45;

  return v45;
}

id MCLECv2Encryption.__deallocating_deinit()
{
  uint64_t v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MCLECv2Encryption();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_22911B080()
{
  return sub_22912BCC8();
}

uint64_t sub_22911B0C4()
{
  return sub_22912BC58() & 1;
}

uint64_t sub_22911B100()
{
  return sub_22912BC88();
}

uint64_t sub_22911B140()
{
  return sub_22912BC68();
}

uint64_t sub_22911B180()
{
  return sub_22912BC78();
}

uint64_t sub_22911B1C0()
{
  return sub_22912BC28() & 1;
}

uint64_t sub_22911B204()
{
  return sub_22912BC38();
}

uint64_t sub_22911B244()
{
  return sub_22912BC48();
}

uint64_t sub_22911B284()
{
  return sub_22912BCB8();
}

uint64_t sub_22911B2C8()
{
  return sub_22912BC98();
}

uint64_t sub_22911B30C()
{
  return sub_22912BCA8();
}

uint64_t sub_22911B350()
{
  return sub_22912BA18();
}

uint64_t sub_22911B368()
{
  return sub_22912BA38() & 1;
}

uint64_t sub_22911B384()
{
  return sub_22912B9F8() & 1;
}

uint64_t sub_22911B3A0()
{
  return sub_22912BA08() & 1;
}

uint64_t sub_22911B3BC()
{
  return sub_22912BA28() & 1;
}

uint64_t sub_22911B3D8()
{
  return sub_22912BA58();
}

uint64_t sub_22911B414()
{
  return sub_22912BA48();
}

uint64_t sub_22911B42C()
{
  return sub_22912BB78() & 1;
}

uint64_t sub_22911B478()
{
  return sub_22912B9E8();
}

uint64_t sub_22911B4B8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = nullsub_3(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_22911B4EC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = nullsub_3(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_22911B52C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = nullsub_4(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_22911B560(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t sub_22911B598(uint64_t (*a1)(uint64_t *, uint64_t), uint64_t a2, unsigned int a3)
{
  if (a3 < 0x80uLL)
  {
    if (a3 > 0xFF) {
      goto LABEL_12;
    }
    unsigned int v5 = (a3 + 1);
  }
  else
  {
    int v7 = (a3 & 0x3F) << 8;
    if (a3 >> 6 < 0x20uLL)
    {
      unsigned int v5 = (v7 | (a3 >> 6)) + 33217;
    }
    else
    {
      int v6 = (v7 | (a3 >> 6) & 0x3F) << 8;
      if (a3 >> 12 < 0x10uLL) {
        unsigned int v5 = (v6 | (a3 >> 12)) + 8487393;
      }
      else {
        unsigned int v5 = ((a3 >> 18) | ((v6 | (a3 >> 12) & 0x3F) << 8)) - 2122219023;
      }
    }
  }
  uint64_t v4 = 4 - ((uint64_t)__clz(v5) >> 3);
  uint64_t v8 = (v5 - 0x101010101010101) & ((1 << ((8 * v4) & 0x3F)) - 1);
  if (v4 >= 0) {
    return a1(&v8, v4);
  }
  sub_22912BAE8();
  __break(1u);
LABEL_12:
  uint64_t result = sub_22912BAD8();
  __break(1u);
  return result;
}

uint64_t sub_22911B8E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, unint64_t a6@<X5>, uint64_t a7@<X6>, int a8@<W7>, uint64_t a9@<X8>, unint64_t a10, unint64_t a11)
{
  uint64_t v21 = a9;
  uint64_t v22 = a1;
  uint64_t v23 = a2;
  unint64_t v24 = a3;
  uint64_t v25 = a4;
  unint64_t v26 = a6;
  uint64_t v27 = a7;
  int v28 = a8;
  unint64_t v29 = a10;
  unint64_t v30 = a11;
  unint64_t v31 = sub_22911DD30;
  uint64_t v32 = sub_22911DD74;
  uint64_t v33 = "Fatal error";
  uint64_t v34 = "Unexpectedly found nil while unwrapping an Optional value";
  uint64_t v35 = "Swift/StaticString.swift";
  uint64_t v36 = "Not enough bits to represent the passed value";
  uint64_t v37 = "Swift/Integers.swift";
  char v38 = "UnsafeBufferPointer with negative count";
  id v39 = "Swift/UnsafeBufferPointer.swift";
  uint64_t v40 = 0;
  unint64_t v42 = a6;
  uint64_t v43 = a7;
  char v44 = a8;
  uint64_t v45 = a1;
  uint64_t v46 = a2;
  unint64_t v47 = a10;
  unint64_t v48 = a11;
  if (a5)
  {
    if (v24 <= 0xFFFFFFFF)
    {
      unsigned int v20 = v24;
      if ((v24 < 0xD800 || v20 > 0xDFFF) && v20 <= 0x10FFFF)
      {
        uint64_t v19 = v18;
        id v11 = (uint64_t (*)(uint64_t *, uint64_t))MEMORY[0x270FA5388](v32, v18, v20, a4);
        uint64_t v16 = v31;
        uint64_t v17 = &v41;
        sub_22911B598(v11, (uint64_t)v14, v12);
        return (uint64_t)v19;
      }
      v14[0] = 2;
      uint64_t v15 = 148;
      LODWORD(v16) = 0;
      sub_22912BAD8();
      __break(1u);
    }
    v14[0] = 2;
    uint64_t v15 = 3455;
    LODWORD(v16) = 0;
    sub_22912BAD8();
    __break(1u);
  }
  if (v24) {
    uint64_t v49 = v24;
  }
  else {
    uint64_t v49 = 0;
  }
  v18[0] = v49;
  if (!v49)
  {
    v14[0] = 2;
    uint64_t v15 = 136;
    LODWORD(v16) = 0;
    sub_22912BAD8();
    __break(1u);
  }
  if (v25 >= 0) {
    return sub_22911D40C(v18[0], v25, v26, v27, v28, v22, v23, v29, v21, v30);
  }
  uint64_t result = sub_22912BAE8();
  __break(1u);
  return result;
}

unint64_t sub_22911BCE4()
{
  uint64_t v2 = qword_2682C4290;
  if (!qword_2682C4290)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682C4290);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22911BD64()
{
  uint64_t v2 = qword_2682C4298;
  if (!qword_2682C4298)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682C4298);
    return WitnessTable;
  }
  return v2;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  int v2 = *(_DWORD *)(*(void *)(a2 - 8) + 80);
  if ((v2 & 0x20000) != 0) {
    return (void *)(*result + ((v2 + 16) & ~(unint64_t)v2));
  }
  return result;
}

unint64_t sub_22911BE5C()
{
  uint64_t v2 = qword_2682C3EB8;
  if (!qword_2682C3EB8)
  {
    type metadata accessor for MCLECv2Encryption.ECv2EncryptedDataContainer();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682C3EB8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22911BEE0(uint64_t a1)
{
  if (*(void *)(a1 + 24)) {
    __swift_destroy_boxed_opaque_existential_0(a1);
  }
  return a1;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  if ((*(_DWORD *)(*(void *)(v2 - 8) + 80) & 0x20000) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(uint64_t))(*(void *)(v2 - 8) + 8))(a1);
  }
}

__n128 sub_22911BFD0(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a2 = *(_OWORD *)a1;
  __n128 result = *(__n128 *)(a1 + 16);
  *(__n128 *)(a2 + 16) = result;
  return result;
}

uint64_t sub_22911BFEC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v2;
  (**(void (***)(uint64_t))(v2 - 8))(a2);
  return a2;
}

unint64_t sub_22911C050()
{
  uint64_t v2 = qword_2682C42A0;
  if (!qword_2682C42A0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682C42A0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22911C0D0()
{
  uint64_t v2 = qword_2682C42A8[0];
  if (!qword_2682C42A8[0])
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, qword_2682C42A8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22911C150()
{
  uint64_t v2 = qword_2682C3EE0;
  if (!qword_2682C3EE0)
  {
    type metadata accessor for MCLECv2Encryption.ECv2EncryptedDataContainer.EncryptedData();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682C3EE0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22911C1D4()
{
  return sub_2291125C0();
}

uint64_t getEnumTagSinglePayload for MCLECv2Encryption.ECv2EncryptionError(uint64_t a1, int a2)
{
  if (a2)
  {
    if (*(unsigned char *)(a1 + 17)) {
      int v3 = *(_DWORD *)a1;
    }
    else {
      int v3 = -1;
    }
  }
  else
  {
    int v3 = -1;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for MCLECv2Encryption.ECv2EncryptionError(uint64_t result, int a2, int a3)
{
  int v3 = (unsigned char *)(result + 17);
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(unsigned char *)(result + 16) = 0;
    if (a3) {
      *int v3 = 1;
    }
  }
  else if (a3)
  {
    *int v3 = 0;
  }
  return result;
}

uint64_t sub_22911C46C(uint64_t a1)
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2682C3EE8);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 48))(a1, 3);
}

uint64_t sub_22911C4D0(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2682C3EE8);
  return (*(uint64_t (**)(uint64_t, void, uint64_t))(*(void *)(v2 - 8) + 56))(a1, a2, 3);
}

ValueMetadata *type metadata accessor for MCLECv2Encryption.ECv2EncryptionError()
{
  return &type metadata for MCLECv2Encryption.ECv2EncryptionError;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t sub_22911C558(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 <= 0xFD) {
      goto LABEL_15;
    }
    unsigned int v7 = ((a2 + 2) >> 8) + 1;
    int v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000) {
        int v2 = 4;
      }
      else {
        int v2 = 2;
      }
      int v8 = v2;
    }
    if (v8 == 1) {
      int v6 = a1[1];
    }
    else {
      int v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    }
    if (v6)
    {
      int v5 = (*a1 | ((v6 - 1) << 8)) + 253;
    }
    else
    {
LABEL_15:
      int v3 = *a1 - 3;
      if (v3 < 0) {
        int v3 = -1;
      }
      int v5 = v3;
    }
  }
  else
  {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *sub_22911C708(unsigned char *result, unsigned int a2, unsigned int a3)
{
  int v7 = 0;
  if (a3 > 0xFD)
  {
    unsigned int v5 = ((a3 + 2) >> 8) + 1;
    int v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000) {
        int v3 = 4;
      }
      else {
        int v3 = 2;
      }
      int v6 = v3;
    }
    int v7 = v6;
  }
  if (a2 > 0xFD)
  {
    unsigned int v4 = ((a2 - 254) >> 8) + 1;
    *__n128 result = a2 + 2;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2) {
      *__n128 result = a2 + 2;
    }
  }
  return result;
}

uint64_t sub_22911C94C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_22911C958(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

void *type metadata accessor for MCLECv2Encryption.ECv2EncryptedDataContainer.EncryptedData.CodingKeys()
{
  return &unk_26DD573A0;
}

uint64_t sub_22911C974(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 <= 0xFD) {
      goto LABEL_15;
    }
    unsigned int v7 = ((a2 + 2) >> 8) + 1;
    int v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000) {
        int v2 = 4;
      }
      else {
        int v2 = 2;
      }
      int v8 = v2;
    }
    if (v8 == 1) {
      int v6 = a1[1];
    }
    else {
      int v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    }
    if (v6)
    {
      int v5 = (*a1 | ((v6 - 1) << 8)) + 253;
    }
    else
    {
LABEL_15:
      int v3 = *a1 - 3;
      if (v3 < 0) {
        int v3 = -1;
      }
      int v5 = v3;
    }
  }
  else
  {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *sub_22911CB24(unsigned char *result, unsigned int a2, unsigned int a3)
{
  int v7 = 0;
  if (a3 > 0xFD)
  {
    unsigned int v5 = ((a3 + 2) >> 8) + 1;
    int v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000) {
        int v3 = 4;
      }
      else {
        int v3 = 2;
      }
      int v6 = v3;
    }
    int v7 = v6;
  }
  if (a2 > 0xFD)
  {
    unsigned int v4 = ((a2 - 254) >> 8) + 1;
    *__n128 result = a2 + 2;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2) {
      *__n128 result = a2 + 2;
    }
  }
  return result;
}

uint64_t sub_22911CD68(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_22911CD74(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

void *type metadata accessor for MCLECv2Encryption.ECv2EncryptedDataContainer.CodingKeys()
{
  return &unk_26DD57430;
}

unint64_t sub_22911CD90()
{
  return sub_22911CDA8();
}

unint64_t sub_22911CDA8()
{
  uint64_t v2 = qword_2682C3EF8;
  if (!qword_2682C3EF8)
  {
    type metadata accessor for WritingOptions();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682C3EF8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22911CE2C()
{
  return sub_22911253C();
}

unint64_t sub_22911CE44()
{
  return sub_22911CE5C();
}

unint64_t sub_22911CE5C()
{
  uint64_t v2 = qword_2682C49B0;
  if (!qword_2682C49B0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682C49B0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22911CEDC()
{
  return sub_22911CEF4();
}

unint64_t sub_22911CEF4()
{
  uint64_t v2 = qword_2682C49B8[0];
  if (!qword_2682C49B8[0])
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, qword_2682C49B8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22911CF74()
{
  return sub_22911CF8C();
}

unint64_t sub_22911CF8C()
{
  uint64_t v2 = qword_2682C4A40[0];
  if (!qword_2682C4A40[0])
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, qword_2682C4A40);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22911D00C()
{
  return sub_22911D024();
}

unint64_t sub_22911D024()
{
  uint64_t v2 = qword_2682C4AD0;
  if (!qword_2682C4AD0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682C4AD0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22911D0A4()
{
  return sub_22911D0BC();
}

unint64_t sub_22911D0BC()
{
  uint64_t v2 = qword_2682C4AD8[0];
  if (!qword_2682C4AD8[0])
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, qword_2682C4AD8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22911D13C()
{
  return sub_22911D154();
}

unint64_t sub_22911D154()
{
  uint64_t v2 = qword_2682C4B60[0];
  if (!qword_2682C4B60[0])
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, qword_2682C4B60);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22911D1D4()
{
  return sub_22911D1EC();
}

unint64_t sub_22911D1EC()
{
  uint64_t v2 = qword_2682C3F00;
  if (!qword_2682C3F00)
  {
    type metadata accessor for WritingOptions();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682C3F00);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22911D270()
{
  return sub_22911D288();
}

unint64_t sub_22911D288()
{
  uint64_t v2 = qword_2682C3F08;
  if (!qword_2682C3F08)
  {
    type metadata accessor for WritingOptions();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682C3F08);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22911D30C()
{
  uint64_t v2 = qword_2682C3F10;
  if (!qword_2682C3F10)
  {
    type metadata accessor for WritingOptions();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682C3F10);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22911D390()
{
  uint64_t v2 = qword_2682C3F18;
  if (!qword_2682C3F18)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682C3F18);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22911D40C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, unint64_t a8@<X7>, uint64_t a9@<X8>, unint64_t a10)
{
  uint64_t v21 = a9;
  uint64_t v22 = a1;
  uint64_t v23 = a2;
  unint64_t v24 = a3;
  uint64_t v25 = a4;
  uint64_t v26 = a6;
  uint64_t v27 = a7;
  unint64_t v28 = a8;
  unint64_t v29 = a10;
  unint64_t v30 = sub_22911DDA0;
  unint64_t v31 = sub_22911DDBC;
  uint64_t v32 = "Fatal error";
  uint64_t v33 = "Unexpectedly found nil while unwrapping an Optional value";
  uint64_t v34 = "Swift/StaticString.swift";
  uint64_t v35 = "Not enough bits to represent the passed value";
  uint64_t v36 = "Swift/Integers.swift";
  uint64_t v37 = "UnsafeBufferPointer with negative count";
  char v38 = "Swift/UnsafeBufferPointer.swift";
  uint64_t v39 = 0;
  uint64_t v41 = a6;
  uint64_t v42 = a7;
  uint64_t v43 = a1;
  uint64_t v44 = a2;
  unint64_t v45 = a8;
  unint64_t v46 = a10;
  if (a5)
  {
    if (v24 <= 0xFFFFFFFF)
    {
      unsigned int v20 = v24;
      if ((v24 < 0xD800 || v20 > 0xDFFF) && v20 <= 0x10FFFF)
      {
        uint64_t v19 = &v17;
        uint64_t v10 = (uint64_t (*)(uint64_t *, uint64_t))MEMORY[0x270FA5388](v31, &v17, v20, a4);
        uint64_t v15 = v30;
        uint64_t v16 = &v40;
        sub_22911B598(v10, (uint64_t)v13, v11);
        return (uint64_t)v19;
      }
      v13[0] = 2;
      uint64_t v14 = 148;
      LODWORD(v15) = 0;
      sub_22912BAD8();
      __break(1u);
    }
    v13[0] = 2;
    uint64_t v14 = 3455;
    LODWORD(v15) = 0;
    sub_22912BAD8();
    __break(1u);
  }
  if (v24) {
    uint64_t v47 = v24;
  }
  else {
    uint64_t v47 = 0;
  }
  uint64_t v18 = v47;
  if (!v47)
  {
    v13[0] = 2;
    uint64_t v14 = 136;
    LODWORD(v15) = 0;
    sub_22912BAD8();
    __break(1u);
  }
  if (v25 >= 0) {
    return sub_22911D7E4(v18, v25, v26, v27, v22, v23, v28, v29);
  }
  uint64_t result = sub_22912BAE8();
  __break(1u);
  return result;
}

uint64_t sub_22911D7E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, unint64_t a8)
{
  if (!a3)
  {
    sub_22912BAD8();
    __break(1u);
  }
  if (a4 >= (uint64_t)0xFFFFFFFF80000000)
  {
    if (a4 <= 0x7FFFFFFF)
    {
      if (!a5)
      {
        sub_22912BAD8();
        __break(1u);
      }
      if (a6 >= (uint64_t)0xFFFFFFFF80000000)
      {
        if (a6 <= 0x7FFFFFFF)
        {
          if (!a1)
          {
            sub_22912BAD8();
            __break(1u);
          }
          if (a2 >= (uint64_t)0xFFFFFFFF80000000)
          {
            if (a2 <= 0x7FFFFFFF)
            {
              if (a7 <= 0xFFFFFFFF)
              {
                if (a8 <= 0xFFFFFFFF) {
                  return _swift_stdlib_reportUnimplementedInitializerInFile();
                }
                sub_22912BAD8();
                __break(1u);
              }
              sub_22912BAD8();
              __break(1u);
            }
            sub_22912BAD8();
            __break(1u);
          }
          sub_22912BAD8();
          __break(1u);
        }
        sub_22912BAD8();
        __break(1u);
      }
      sub_22912BAD8();
      __break(1u);
    }
    sub_22912BAD8();
    __break(1u);
  }
  uint64_t result = sub_22912BAD8();
  __break(1u);
  return result;
}

uint64_t sub_22911DD30@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_22911D40C(a1, a2, *(void *)(v3 + 16), *(void *)(v3 + 24), *(unsigned char *)(v3 + 32), *(void *)(v3 + 40), *(void *)(v3 + 48), *(void *)(v3 + 56), a3, *(void *)(v3 + 64));
}

uint64_t sub_22911DD74(uint64_t a1, uint64_t a2)
{
  return sub_22911B560(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

uint64_t sub_22911DDA0(uint64_t a1, uint64_t a2)
{
  return sub_22911D7E4(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48), *(void *)(v2 + 56));
}

uint64_t sub_22911DDBC(uint64_t a1, uint64_t a2)
{
  return sub_22911B560(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

uint64_t sub_22911DDE8(uint64_t result)
{
  uint64_t v4 = result;
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    if (result > 0)
    {
      sub_22912B978();
      uint64_t v1 = sub_22912B8D8();
      *(void *)(v1 + 16) = v4;
      uint64_t v3 = v1;
    }
    else
    {
      uint64_t v2 = MEMORY[0x263F8EE78];
      swift_retain();
      uint64_t v3 = v2;
    }
    sub_22912B978();
    return v3;
  }
  return result;
}

uint64_t sub_22911DEC8(uint64_t result)
{
  uint64_t v4 = result;
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    if (result > 0)
    {
      sub_22912B4A8();
      uint64_t v1 = sub_22912B8D8();
      *(void *)(v1 + 16) = v4;
      uint64_t v3 = v1;
    }
    else
    {
      uint64_t v2 = MEMORY[0x263F8EE78];
      swift_retain();
      uint64_t v3 = v2;
    }
    sub_22912B4A8();
    return v3;
  }
  return result;
}

unint64_t sub_22911DFA8()
{
  uint64_t v2 = qword_2682C3F20;
  if (!qword_2682C3F20)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682C3F20);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22911E024()
{
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_22911E06C()
{
  return sub_2291165F8(*(void (**)(uint64_t))(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t block_copy_helper_87(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_88()
{
  return swift_release();
}

uint64_t sub_22911E0E0()
{
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_22911E128()
{
  return sub_2291162F4(*(void (**)(uint64_t))(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t block_copy_helper_93(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_94()
{
  return swift_release();
}

uint64_t sub_22911E19C()
{
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_22911E1E4()
{
  return sub_229115478(*(void (**)(uint64_t))(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t block_copy_helper_99(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_100()
{
  return swift_release();
}

uint64_t sub_22911E258()
{
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_22911E2A0()
{
  return sub_229115174(*(void (**)(uint64_t))(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t block_copy_helper_105(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_106()
{
  return swift_release();
}

unint64_t sub_22911E314()
{
  uint64_t v2 = qword_2682C3F28;
  if (!qword_2682C3F28)
  {
    sub_22912B4A8();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682C3F28);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22911E398()
{
  uint64_t v2 = qword_2682C3F38;
  if (!qword_2682C3F38)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2682C3F30);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682C3F38);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22911E41C()
{
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_22911E464()
{
  return sub_229114340(*(void (**)(uint64_t))(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t block_copy_helper_111(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_112()
{
  return swift_release();
}

uint64_t sub_22911E4D8()
{
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_22911E520()
{
  return sub_229113F3C(*(void (**)(uint64_t))(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t block_copy_helper_117(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_118()
{
  return swift_release();
}

unint64_t sub_22911E594()
{
  uint64_t v2 = qword_2682C3F40;
  if (!qword_2682C3F40)
  {
    sub_22912B978();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682C3F40);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22911E618()
{
  uint64_t v2 = qword_2682C3F50;
  if (!qword_2682C3F50)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2682C3F48);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682C3F50);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22911E69C()
{
  uint64_t v32 = 0;
  unint64_t v16 = (*(void *)(*(void *)(sub_22912B988() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0, v0, v1, v2);
  uint64_t v31 = (uint64_t)&v15 - v16;
  unint64_t v17 = (*(void *)(*(void *)(sub_22912B978() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v32, v3, v4, v5);
  unint64_t v30 = (char *)&v15 - v17;
  unint64_t v18 = (*(void *)(*(void *)(sub_22912B4C8() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v32, v6, v7, v8);
  unint64_t v29 = (char *)&v15 - v18;
  unint64_t v22 = sub_229111CD8();
  uint64_t v20 = 17;
  uint64_t v9 = sub_22912BB58();
  unint64_t v24 = &v33;
  uint64_t v33 = v9;
  uint64_t v34 = v10;
  int v21 = 1;
  sub_22912B818();
  uint64_t v19 = v11;
  sub_22912BB48();
  swift_bridgeObjectRelease();
  type metadata accessor for MCLHPKEEncryption();
  sub_229111D68();
  sub_22912B818();
  uint64_t v23 = v12;
  sub_22912BB48();
  swift_bridgeObjectRelease();
  uint64_t v26 = v33;
  uint64_t v25 = v34;
  swift_bridgeObjectRetain();
  sub_229111228();
  uint64_t v27 = sub_22912B808();
  uint64_t v28 = v13;
  sub_229111DA0();
  sub_229111DB8();
  sub_229111E50(v31);
  return sub_22912B9B8();
}

uint64_t type metadata accessor for MCLHPKEEncryption()
{
  return self;
}

uint64_t sub_22911E8FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v33 = a1;
  uint64_t v34 = a2;
  uint64_t v26 = a3;
  uint64_t v27 = a4;
  uint64_t v28 = a5;
  uint64_t v29 = a6;
  unint64_t v30 = (void (*)(void))a7;
  uint64_t v31 = a8;
  uint64_t v50 = 0;
  uint64_t v51 = 0;
  uint64_t v48 = 0;
  uint64_t v49 = 0;
  uint64_t v46 = 0;
  uint64_t v47 = 0;
  uint64_t v44 = 0;
  uint64_t v45 = 0;
  uint64_t v43 = 0;
  uint64_t v41 = 0;
  unint64_t v42 = 0;
  uint64_t v39 = sub_22912B7C8();
  uint64_t v35 = *(void *)(v39 - 8);
  uint64_t v36 = v39 - 8;
  unint64_t v32 = (*(void *)(v35 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v37 = (char *)&v21 - v32;
  uint64_t v50 = MEMORY[0x270FA5388](v33, v34, v26, v27);
  uint64_t v51 = v9;
  uint64_t v48 = v10;
  uint64_t v49 = v11;
  uint64_t v46 = v12;
  uint64_t v47 = v13;
  uint64_t v44 = v14;
  uint64_t v45 = v15;
  uint64_t v43 = v8;
  sub_22912B7B8();
  sub_229113178();
  uint64_t v38 = sub_22912B798();
  unint64_t v40 = v16;
  (*(void (**)(char *, uint64_t))(v35 + 8))(v37, v39);
  if ((v40 & 0xF000000000000000) == 0xF000000000000000)
  {
    swift_retain();
    sub_22911EB5C();
    unint64_t v18 = (void *)swift_allocError();
    uint64_t v19 = v30;
    id v21 = v18;
    *uint64_t v20 = 3;
    v19();

    return swift_release();
  }
  else
  {
    uint64_t v24 = v38;
    unint64_t v25 = v40;
    unint64_t v23 = v40;
    uint64_t v22 = v38;
    uint64_t v41 = v38;
    unint64_t v42 = v40;
    sub_22911F23C(v38, v40, v26, v27, v28, v29, (uint64_t)v30, v31);
    return sub_22910F1C0(v22, v23);
  }
}

unint64_t sub_22911EB5C()
{
  uint64_t v2 = qword_2682C3F58;
  if (!qword_2682C3F58)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682C3F58);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_22911ED50(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

uint64_t sub_22911ED84(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v29[2] = 0;
  uint64_t v30 = 0;
  unint64_t v31 = 0;
  v29[9] = a1;
  v29[7] = a2;
  v29[8] = a3;
  v29[5] = a4;
  v29[6] = a5;
  v29[3] = a6;
  v29[4] = a7;
  id v32 = 0;
  unint64_t v25 = self;
  swift_bridgeObjectRetain();
  uint64_t v27 = sub_22912B718();
  swift_bridgeObjectRelease();
  type metadata accessor for WritingOptions();
  sub_22912BB68();
  sub_22911253C();
  sub_22912B9E8();
  v29[0] = 0;
  id v28 = objc_msgSend(v25, sel_dataWithJSONObject_options_error_, v27, v29[1], v29);
  id v26 = v29[0];
  id v7 = v29[0];
  uint64_t v8 = v32;
  id v32 = v26;

  swift_unknownObjectRelease();
  if (v28)
  {
    uint64_t v15 = sub_22912B3D8();
    unint64_t v16 = v9;

    uint64_t v17 = v15;
    unint64_t v18 = v16;
  }
  else
  {
    id v12 = v32;
    id v13 = (id)sub_22912B398();

    swift_willThrow();
    uint64_t v17 = 0;
    unint64_t v18 = 0xF000000000000000;
  }
  if ((v18 & 0xF000000000000000) == 0xF000000000000000)
  {
    swift_retain();
    sub_22911EB5C();
    id v14 = (id)swift_allocError();
    *uint64_t v11 = 1;
    ((void (*)(void))a6)();

    return swift_release();
  }
  else
  {
    uint64_t v30 = v17;
    unint64_t v31 = v18;
    sub_22911F23C(v17, v18, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7);
    return sub_22910F1C0(v17, v18);
  }
}

uint64_t sub_22911F23C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v49 = a1;
  unint64_t v50 = a2;
  uint64_t v47 = a3;
  uint64_t v48 = a4;
  uint64_t v41 = a5;
  uint64_t v42 = a6;
  uint64_t v44 = a7;
  uint64_t v45 = a8;
  uint64_t v54 = 0;
  uint64_t v51 = sub_22911FAFC;
  uint64_t v52 = sub_22911FE4C;
  unint64_t v53 = sub_229120C50;
  uint64_t v85 = 0;
  uint64_t v86 = 0;
  uint64_t v83 = 0;
  uint64_t v84 = 0;
  uint64_t v81 = 0;
  uint64_t v82 = 0;
  uint64_t v79 = 0;
  uint64_t v80 = 0;
  uint64_t v78 = 0;
  uint64_t v76 = 0;
  uint64_t v77 = 0;
  uint64_t v74 = 0;
  uint64_t v75 = 0;
  uint64_t v58 = sub_22912B4A8();
  uint64_t v55 = *(void *)(v58 - 8);
  uint64_t v56 = v58 - 8;
  unint64_t v39 = (*(void *)(v55 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0, v9, v10, v11);
  uint64_t v57 = (char *)&v38 - v39;
  uint64_t v62 = sub_22912B4C8();
  uint64_t v59 = *(void *)(v62 - 8);
  uint64_t v60 = v62 - 8;
  unint64_t v40 = (*(void *)(v59 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v12 = MEMORY[0x270FA5388](v42, v50, v47, v48);
  unint64_t v61 = (char *)&v38 - v40;
  uint64_t v85 = v13;
  uint64_t v86 = v14;
  uint64_t v83 = v15;
  uint64_t v84 = v16;
  uint64_t v81 = v17;
  uint64_t v82 = v12;
  uint64_t v79 = v18;
  uint64_t v80 = v19;
  uint64_t v78 = v8;
  swift_retain();
  uint64_t v43 = 32;
  uint64_t v46 = 7;
  uint64_t v20 = swift_allocObject();
  uint64_t v21 = v42;
  uint64_t v22 = v51;
  uint64_t v66 = v20;
  *(void *)(v20 + 16) = v41;
  *(void *)(v20 + 24) = v21;
  uint64_t v76 = v22;
  uint64_t v77 = v20;
  swift_retain();
  uint64_t v23 = swift_allocObject();
  uint64_t v24 = v45;
  unint64_t v25 = v52;
  uint64_t v65 = v23;
  *(void *)(v23 + 16) = v44;
  *(void *)(v23 + 24) = v24;
  uint64_t v74 = v25;
  uint64_t v75 = v23;
  id v64 = *(id *)(v8 + OBJC_IVAR___MCLHPKEEncryption_queue);
  id v26 = v64;
  swift_bridgeObjectRetain();
  sub_22910F0D4(v49, v50);
  swift_retain();
  swift_retain();
  uint64_t v27 = swift_allocObject();
  uint64_t v28 = v48;
  uint64_t v29 = v49;
  unint64_t v30 = v50;
  unint64_t v31 = v51;
  id v32 = v52;
  uint64_t v33 = v53;
  uint64_t v34 = v66;
  uint64_t v35 = (void *)v27;
  uint64_t v36 = v65;
  v35[2] = v47;
  v35[3] = v28;
  v35[4] = v29;
  v35[5] = v30;
  v35[6] = v31;
  v35[7] = v34;
  v35[8] = v32;
  v35[9] = v36;
  id v72 = v33;
  objc_super v73 = v35;
  aBlocunsigned int k = MEMORY[0x263EF8330];
  int v68 = 1107296256;
  int v69 = 0;
  uint64_t v70 = sub_2291143B0;
  uint64_t v71 = &block_descriptor_0;
  uint64_t v63 = _Block_copy(&aBlock);
  sub_229113FFC();
  sub_229114014();
  MEMORY[0x22A6B1090](v54, v61, v57, v63);
  (*(void (**)(char *, uint64_t))(v55 + 8))(v57, v58);
  (*(void (**)(char *, uint64_t))(v59 + 8))(v61, v62);
  _Block_release(v63);
  swift_release();

  swift_release();
  return swift_release();
}

uint64_t sub_22911F708()
{
  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_22911F748(uint64_t a1)
{
  return sub_22911ED50(a1, *(void *)(v1 + 16));
}

uint64_t sub_22911F750()
{
  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_22911F790(void *a1)
{
  sub_229112844(a1, *(void *)(v1 + 16));
}

uint64_t sub_22911F798()
{
  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_22911F7D8(uint64_t a1)
{
  return sub_22911ED50(a1, *(void *)(v1 + 16));
}

uint64_t sub_22911F7E0()
{
  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_22911F820(void *a1)
{
  sub_229112844(a1, *(void *)(v1 + 16));
}

void sub_22911F828(void *a1, uint64_t a2, uint64_t a3)
{
  id v21 = a1;
  uint64_t v18 = a2;
  uint64_t v19 = a3;
  uint64_t v22 = 0;
  uint64_t v20 = sub_2291225C8;
  uint64_t v42 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  uint64_t v26 = sub_22912B4A8();
  uint64_t v23 = *(void *)(v26 - 8);
  uint64_t v24 = v26 - 8;
  unint64_t v16 = (*(void *)(v23 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0, v3, v4, v5);
  unint64_t v25 = (char *)&v16 - v16;
  uint64_t v30 = sub_22912B4C8();
  uint64_t v27 = *(void *)(v30 - 8);
  uint64_t v28 = v30 - 8;
  unint64_t v17 = (*(void *)(v27 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v22, v18, v19, v6);
  uint64_t v29 = (char *)&v16 - v17;
  uint64_t v42 = v7;
  uint64_t v40 = v8;
  uint64_t v41 = v9;
  sub_229111CD8();
  id v32 = (id)sub_22912B998();
  swift_retain();
  id v10 = v21;
  uint64_t v11 = swift_allocObject();
  uint64_t v12 = v19;
  uint64_t v13 = v20;
  uint64_t v14 = (void *)v11;
  id v15 = v21;
  v14[2] = v18;
  v14[3] = v12;
  v14[4] = v15;
  uint64_t v38 = v13;
  unint64_t v39 = v14;
  aBlocunsigned int k = MEMORY[0x263EF8330];
  int v34 = 1107296256;
  int v35 = 0;
  uint64_t v36 = sub_229113FAC;
  uint64_t v37 = &block_descriptor_42;
  unint64_t v31 = _Block_copy(&aBlock);
  swift_release();
  sub_229113FFC();
  sub_229114014();
  MEMORY[0x22A6B1090](v22, v29, v25, v31);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v26);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v29, v30);
  _Block_release(v31);
}

uint64_t sub_22911FABC()
{
  return swift_deallocObject();
}

void sub_22911FAFC(void *a1)
{
  sub_22911F828(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_22911FB08(void (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return swift_release();
}

void sub_22911FB78(void *a1, uint64_t a2, uint64_t a3)
{
  id v21 = a1;
  uint64_t v18 = a2;
  uint64_t v19 = a3;
  uint64_t v22 = 0;
  uint64_t v20 = sub_22912250C;
  uint64_t v42 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  uint64_t v26 = sub_22912B4A8();
  uint64_t v23 = *(void *)(v26 - 8);
  uint64_t v24 = v26 - 8;
  unint64_t v16 = (*(void *)(v23 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0, v3, v4, v5);
  unint64_t v25 = (char *)&v16 - v16;
  uint64_t v30 = sub_22912B4C8();
  uint64_t v27 = *(void *)(v30 - 8);
  uint64_t v28 = v30 - 8;
  unint64_t v17 = (*(void *)(v27 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v22, v18, v19, v6);
  uint64_t v29 = (char *)&v16 - v17;
  uint64_t v42 = v7;
  uint64_t v40 = v8;
  uint64_t v41 = v9;
  sub_229111CD8();
  id v32 = (id)sub_22912B998();
  swift_retain();
  id v10 = v21;
  uint64_t v11 = swift_allocObject();
  uint64_t v12 = v19;
  uint64_t v13 = v20;
  uint64_t v14 = (void *)v11;
  id v15 = v21;
  v14[2] = v18;
  v14[3] = v12;
  v14[4] = v15;
  uint64_t v38 = v13;
  unint64_t v39 = v14;
  aBlocunsigned int k = MEMORY[0x263EF8330];
  int v34 = 1107296256;
  int v35 = 0;
  uint64_t v36 = sub_229113FAC;
  uint64_t v37 = &block_descriptor_36_0;
  unint64_t v31 = _Block_copy(&aBlock);
  swift_release();
  sub_229113FFC();
  sub_229114014();
  MEMORY[0x22A6B1090](v22, v29, v25, v31);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v26);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v29, v30);
  _Block_release(v31);
}

uint64_t sub_22911FE0C()
{
  return swift_deallocObject();
}

void sub_22911FE4C(void *a1)
{
  sub_22911FB78(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_22911FE58(void (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return swift_release();
}

void sub_22911FEC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t a6, void (*a7)(id), uint64_t a8)
{
  uint64_t v157 = a1;
  uint64_t v156 = a2;
  uint64_t v150 = a3;
  uint64_t v151 = a4;
  uint64_t v152 = a5;
  uint64_t v153 = a6;
  uint64_t v154 = a7;
  uint64_t v155 = a8;
  v199 = 0;
  v198 = 0;
  v197 = 0;
  uint64_t v195 = 0;
  uint64_t v196 = 0;
  uint64_t v193 = 0;
  uint64_t v194 = 0;
  uint64_t v191 = 0;
  uint64_t v192 = 0;
  uint64_t v189 = 0;
  uint64_t v190 = 0;
  id v188 = 0;
  v187 = 0;
  uint64_t v185 = 0;
  unint64_t v186 = 0;
  uint64_t v178 = 0;
  unint64_t v179 = 0;
  uint64_t v172 = 0;
  unint64_t v173 = 0;
  uint64_t v168 = 0;
  unint64_t v169 = 0;
  uint64_t v142 = 0;
  uint64_t v113 = sub_22912B648();
  uint64_t v114 = *(void *)(v113 - 8);
  uint64_t v115 = v113 - 8;
  unint64_t v116 = (*(void *)(v114 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v11 = MEMORY[0x270FA5388](0, v8, v9, v10);
  uint64_t v117 = (char *)&v68 - v116;
  unint64_t v118 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v11, (char *)&v68 - v116, v13, v14);
  uint64_t v119 = (char *)&v68 - v118;
  v199 = (char *)&v68 - v118;
  uint64_t v120 = sub_22912B7C8();
  uint64_t v121 = *(void *)(v120 - 8);
  uint64_t v122 = v120 - 8;
  unint64_t v123 = (*(void *)(v121 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v142, v15, v16, v17);
  uint64_t v124 = (char *)&v68 - v123;
  uint64_t v125 = sub_22912B608();
  uint64_t v126 = *(void *)(v125 - 8);
  uint64_t v127 = v125 - 8;
  unint64_t v128 = (*(void *)(v126 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v142, v18, v19, v20);
  uint64_t v129 = (char *)&v68 - v128;
  uint64_t v130 = sub_22912B5E8();
  uint64_t v131 = *(void *)(v130 - 8);
  uint64_t v132 = v130 - 8;
  unint64_t v133 = (*(void *)(v131 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v142, v21, v22, v23);
  uint64_t v134 = (char *)&v68 - v133;
  uint64_t v135 = sub_22912B5D8();
  uint64_t v136 = *(void *)(v135 - 8);
  uint64_t v137 = v135 - 8;
  unint64_t v138 = (*(void *)(v136 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v27 = MEMORY[0x270FA5388](v142, v24, v25, v26);
  uint64_t v139 = (char *)&v68 - v138;
  unint64_t v140 = (v28 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v27, (char *)&v68 - v138, v29, v30);
  uint64_t v141 = (char *)&v68 - v140;
  v198 = (char *)&v68 - v140;
  uint64_t v143 = sub_22912B5F8();
  uint64_t v144 = *(void *)(v143 - 8);
  uint64_t v145 = v143 - 8;
  unint64_t v146 = (*(void *)(v144 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v34 = MEMORY[0x270FA5388](v142, v31, v32, v33);
  uint64_t v147 = (char *)&v68 - v146;
  unint64_t v148 = (v35 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v34, (char *)&v68 - v146, v36, v37);
  unint64_t v149 = (char *)&v68 - v148;
  uint64_t v158 = sub_22912B698();
  uint64_t v159 = *(void *)(v158 - 8);
  uint64_t v160 = v158 - 8;
  unint64_t v161 = (*(void *)(v159 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v38 = MEMORY[0x270FA5388](v157, v156, v150, v151);
  uint64_t v162 = (char *)&v68 - v161;
  unint64_t v163 = (v39 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v43 = MEMORY[0x270FA5388](v38, v40, v41, v42);
  uint64_t v164 = (char *)&v68 - v163;
  v197 = (char *)&v68 - v163;
  uint64_t v195 = v43;
  uint64_t v196 = v44;
  uint64_t v193 = v45;
  uint64_t v194 = v46;
  uint64_t v191 = v47;
  uint64_t v192 = v48;
  uint64_t v189 = v49;
  uint64_t v190 = v50;
  uint64_t v51 = static MCLECCertValidation.evaluatePublicCertTrust(base64EncodedCert:)();
  uint64_t v165 = 0;
  v166 = v51;
  uint64_t v167 = 0;
  uint64_t v108 = v51;
  v187 = v51;
  uint64_t v52 = static MCLECCertValidation.getExternalCertRepresentation(from:)(v51);
  uint64_t v109 = 0;
  uint64_t v110 = v52;
  unint64_t v111 = v53;
  uint64_t v112 = 0;
  unint64_t v102 = v53;
  uint64_t v101 = v52;
  uint64_t v185 = v52;
  unint64_t v186 = v53;
  sub_22910F0D4(v52, v53);
  unint64_t v105 = v184;
  v184[0] = v101;
  v184[1] = v102;
  uint64_t v54 = *MEMORY[0x263F04720];
  uint64_t v103 = *(void (**)(char *, uint64_t, uint64_t))(v144 + 104);
  uint64_t v104 = v144 + 104;
  v103(v149, v54, v143);
  sub_22912B6A8();
  v106 = 0;
  uint64_t v107 = 0;
  v103(v147, *MEMORY[0x263F04720], v143);
  (*(void (**)(char *, void, uint64_t))(v131 + 104))(v134, *MEMORY[0x263F04710], v130);
  (*(void (**)(char *, void, uint64_t))(v126 + 104))(v129, *MEMORY[0x263F04730], v125);
  sub_22912B5C8();
  uint64_t v95 = sub_22912B818();
  uint64_t v98 = v55;
  sub_22912B7B8();
  sub_229113178();
  uint64_t v99 = sub_22912B798();
  unint64_t v100 = v56;
  uint64_t v96 = *(void (**)(char *, uint64_t))(v121 + 8);
  uint64_t v97 = v121 + 8;
  v96(v124, v120);
  swift_bridgeObjectRelease();
  uint64_t v180 = v99;
  unint64_t v181 = v100;
  if ((v100 & 0xF000000000000000) == 0xF000000000000000)
  {
    uint64_t v182 = sub_22912B438();
    unint64_t v183 = v57;
    sub_229122470((uint64_t)&v180);
  }
  else
  {
    uint64_t v182 = v180;
    unint64_t v183 = v181;
  }
  uint64_t v58 = v106;
  uint64_t v91 = v182;
  unint64_t v92 = v183;
  uint64_t v178 = v182;
  unint64_t v179 = v183;
  (*(void (**)(char *, char *, uint64_t))(v159 + 16))(v162, v164, v158);
  (*(void (**)(char *, char *, uint64_t))(v136 + 16))(v139, v141, v135);
  sub_22910F0D4(v91, v92);
  sub_22912B618();
  unint64_t v93 = v58;
  uint64_t v94 = v58;
  if (v58)
  {
    int v69 = v94;
    sub_22910F1C0(v91, v92);
    (*(void (**)(char *, uint64_t))(v136 + 8))(v141, v135);
    (*(void (**)(char *, uint64_t))(v159 + 8))(v164, v158);
    sub_22910F1C0(v101, v102);

    id v70 = v69;
  }
  else
  {
    uint64_t v87 = sub_22912B818();
    uint64_t v88 = v59;
    sub_22912B7B8();
    sub_229113178();
    uint64_t v89 = sub_22912B798();
    unint64_t v90 = v60;
    v96(v124, v120);
    swift_bridgeObjectRelease();
    uint64_t v174 = v89;
    unint64_t v175 = v90;
    if ((v90 & 0xF000000000000000) == 0xF000000000000000)
    {
      uint64_t v176 = sub_22912B438();
      unint64_t v177 = v61;
      sub_229122470((uint64_t)&v174);
    }
    else
    {
      uint64_t v176 = v174;
      unint64_t v177 = v175;
    }
    uint64_t v62 = v93;
    uint64_t v80 = v176;
    unint64_t v81 = v177;
    uint64_t v172 = v176;
    unint64_t v173 = v177;
    uint64_t v83 = v171;
    v171[0] = v150;
    v171[1] = v151;
    uint64_t v82 = v170;
    v170[0] = v176;
    v170[1] = v177;
    sub_229117888();
    uint64_t v84 = sub_22912B638();
    unint64_t v85 = v63;
    uint64_t v86 = v62;
    if (!v62)
    {
      id v64 = v117;
      unint64_t v77 = v85;
      uint64_t v76 = v84;
      uint64_t v168 = v84;
      unint64_t v169 = v85;
      swift_retain();
      uint64_t v72 = type metadata accessor for MCLHPKEEncryption.HPKEEncryptedDataContainer();
      sub_22910F0D4(v76, v77);
      (*(void (**)(char *, char *, uint64_t))(v114 + 16))(v64, v119, v113);
      uint64_t v73 = sub_22912B628();
      unint64_t v74 = v65;
      uint64_t v79 = *(void (**)(char *, uint64_t))(v114 + 8);
      uint64_t v78 = v114 + 8;
      v79(v117, v113);
      id v75 = sub_229120C74(v76, v77, v73, v74);
      v152();

      swift_release();
      sub_22910F1C0(v76, v77);
      sub_22910F1C0(v80, v81);
      v79(v119, v113);
      sub_22910F1C0(v91, v92);
      (*(void (**)(char *, uint64_t))(v136 + 8))(v141, v135);
      (*(void (**)(char *, uint64_t))(v159 + 8))(v164, v158);
      sub_22910F1C0(v101, v102);

      return;
    }
    int v68 = v86;
    sub_22910F1C0(v80, v81);
    (*(void (**)(char *, uint64_t))(v114 + 8))(v119, v113);
    sub_22910F1C0(v91, v92);
    (*(void (**)(char *, uint64_t))(v136 + 8))(v141, v135);
    (*(void (**)(char *, uint64_t))(v159 + 8))(v164, v158);
    sub_22910F1C0(v101, v102);

    id v70 = v68;
  }
  id v71 = v70;
  id v66 = v70;
  id v188 = v71;
  swift_retain();
  id v67 = v71;
  v154(v71);

  swift_release();
}

uint64_t sub_229120BF4()
{
  swift_bridgeObjectRelease();
  sub_22910F1C0(*(void *)(v0 + 32), *(void *)(v0 + 40));
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_229120C50()
{
  sub_22911FEC8(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void (**)(void))(v0 + 48), *(void *)(v0 + 56), *(void (**)(id))(v0 + 64), *(void *)(v0 + 72));
}

id sub_229120C74(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  id v5 = objc_allocWithZone(v4);
  return sub_229120EBC(a1, a2, a3, a4);
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_229120DA8()
{
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR___MCLHPKEEncryptedDataContainer_encapsulatedKey);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_229120E70()
{
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR___MCLHPKEEncryptedDataContainer_cipher);
  swift_bridgeObjectRetain();
  return v2;
}

id sub_229120EBC(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v24 = a1;
  unint64_t v25 = a2;
  uint64_t v22 = a3;
  unint64_t v23 = a4;
  id v5 = v4;
  id v6 = v4;
  id v26 = v4;
  sub_229118768();
  uint64_t v7 = sub_22912B3C8();
  uint64_t v8 = (uint64_t *)&v15[OBJC_IVAR___MCLHPKEEncryptedDataContainer_cipher];
  *uint64_t v8 = v7;
  v8[1] = v9;

  sub_229118768();
  uint64_t v10 = sub_22912B3C8();
  uint64_t v11 = (uint64_t *)&v15[OBJC_IVAR___MCLHPKEEncryptedDataContainer_encapsulatedKey];
  *uint64_t v11 = v10;
  v11[1] = v12;

  v21.receiver = v26;
  v21.super_class = (Class)type metadata accessor for MCLHPKEEncryption.HPKEEncryptedDataContainer();
  id v20 = objc_msgSendSuper2(&v21, sel_init);
  id v13 = v20;
  id v26 = v20;
  sub_22910F1C0(a3, a4);
  sub_22910F1C0(a1, a2);

  return v20;
}

uint64_t type metadata accessor for MCLHPKEEncryption.HPKEEncryptedDataContainer()
{
  return self;
}

id sub_229121010()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t sub_229121038()
{
  if (!"JITAppKit.HPKEEncryptedDataContainer")
  {
    sub_22912BAD8();
    __break(1u);
  }
  uint64_t result = sub_22911B8E4((uint64_t)"JITAppKit.HPKEEncryptedDataContainer", 36, (unint64_t)"init()", 6, 2, (unint64_t)"JITAppKit/MCLHPKEEncryption.swift", 33, 2, v1, 0x4EuLL, 8uLL);
  __break(1u);
  return result;
}

id sub_229121170()
{
  uint64_t v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MCLHPKEEncryption.HPKEEncryptedDataContainer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

BOOL sub_229121208(char a1, char a2)
{
  switch(a1)
  {
    case 1:
      uint64_t v4 = 1;
      break;
    case 2:
      uint64_t v4 = 2;
      break;
    case 3:
      uint64_t v4 = 3;
      break;
    default:
      uint64_t v4 = 0;
      break;
  }
  switch(a2)
  {
    case 1:
      uint64_t v3 = 1;
      break;
    case 2:
      uint64_t v3 = 2;
      break;
    case 3:
      uint64_t v3 = 3;
      break;
    default:
      uint64_t v3 = 0;
      break;
  }
  return v4 == v3;
}

uint64_t sub_229121320()
{
  return sub_22912BBE8();
}

uint64_t sub_2291213EC()
{
  return sub_22912BA88();
}

BOOL sub_229121438(char *a1, char *a2)
{
  return sub_229121208(*a1, *a2);
}

uint64_t sub_22912145C()
{
  return sub_2291213EC();
}

uint64_t sub_229121478()
{
  return sub_229121320();
}

uint64_t sub_229121494()
{
  return sub_22912B748();
}

uint64_t sub_2291214AC()
{
  return sub_22912B368();
}

uint64_t sub_2291214C4()
{
  return sub_22912B358();
}

uint64_t sub_2291214DC()
{
  return sub_22912B378();
}

uint64_t sub_2291214F4()
{
  return sub_22912B348();
}

uint64_t sub_22912150C()
{
  return sub_22912BBC8();
}

uint64_t sub_229121524()
{
  return sub_22912BBB8();
}

uint64_t sub_22912153C()
{
  return sub_22912BBD8();
}

uint64_t sub_229121554()
{
  return sub_22912BBA8();
}

id sub_22912156C()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id sub_229121594()
{
  id v45 = 0;
  uint64_t v37 = 0;
  unint64_t v21 = (*(void *)(*(void *)(sub_22912B988() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0, v1, v2, v3);
  uint64_t v36 = (uint64_t)&v21 - v21;
  unint64_t v22 = (*(void *)(*(void *)(sub_22912B978() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v37, v4, v5, v6);
  uint64_t v35 = (char *)&v21 - v22;
  uint64_t v7 = sub_22912B4C8();
  unint64_t v23 = (*(void *)(*(void *)(v7 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v7, v8, v9, v10);
  uint64_t v34 = (char *)&v21 - v23;
  id v11 = v0;
  id v45 = v0;
  uint64_t v38 = OBJC_IVAR___MCLHPKEEncryption_queue;
  unint64_t v27 = sub_229111CD8();
  uint64_t v25 = 17;
  uint64_t v12 = sub_22912BB58();
  uint64_t v29 = &v43;
  uint64_t v43 = v12;
  uint64_t v44 = v13;
  int v26 = 1;
  sub_22912B818();
  uint64_t v24 = v14;
  sub_22912BB48();
  swift_bridgeObjectRelease();
  uint64_t v40 = (objc_class *)type metadata accessor for MCLHPKEEncryption();
  sub_229111D68();
  sub_22912B818();
  uint64_t v28 = v15;
  sub_22912BB48();
  swift_bridgeObjectRelease();
  uint64_t v31 = v43;
  uint64_t v30 = v44;
  swift_bridgeObjectRetain();
  sub_229111228();
  uint64_t v32 = sub_22912B808();
  uint64_t v33 = v16;
  sub_229111DA0();
  sub_229111DB8();
  sub_229111E50(v36);
  uint64_t v17 = sub_22912B9B8();
  uint64_t v18 = v39;
  *(void *)&v39[v38] = v17;

  v42.receiver = v45;
  v42.super_class = v40;
  id v41 = objc_msgSendSuper2(&v42, sel_init);
  id v19 = v41;
  id v45 = v41;

  return v41;
}

id sub_229121860()
{
  uint64_t v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MCLHPKEEncryption();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

BOOL static MCLECCertValidation.evaluateOIDsForCert(base64EncodedCert:commonName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v23 = 0;
  unint64_t v24 = 0;
  uint64_t v25 = a3;
  uint64_t v26 = a4;
  swift_bridgeObjectRetain();
  if (!a4)
  {
    char v11 = 1;
    return v11 & 1;
  }
  char v20 = 0;
  sub_2291106B4();
  uint64_t v17 = sub_22912B3A8();
  unint64_t v18 = v4;
  if ((v4 & 0xF000000000000000) == 0xF000000000000000)
  {
    sub_2291106BC();
    swift_allocError();
    *(void *)uint64_t v9 = 0;
    *(void *)(v9 + 8) = 0;
    *(unsigned char *)(v9 + 16) = 3;
    swift_willThrow();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v23 = v17;
    unint64_t v24 = v4;
    sub_22910F0D4(v17, v4);
    CFDataRef v15 = (const __CFData *)sub_22912B3B8();
    uint64_t v16 = SecCertificateCreateWithData(0, v15);

    sub_22910F1C0(v17, v18);
    if (v16)
    {
      CFStringRef commonName = 0;
      if (!SecCertificateCopyCommonName(v16, &commonName))
      {
        uint64_t v14 = (__CFString *)commonName;
        CFStringRef v5 = (id)commonName;
        if (v14)
        {
          uint64_t v6 = v14;
          sub_229121E10();
          sub_22912BB88();

          if (v21) {
            uint64_t v13 = v21;
          }
          else {
            uint64_t v13 = 0;
          }
          uint64_t v12 = v13;
        }
        else
        {
          uint64_t v12 = 0;
        }
        if (v12)
        {
          char v7 = sub_22912B828();
          if (v7) {
            char v20 = 1;
          }
          swift_bridgeObjectRelease();
        }
      }
      sub_229121DE4((id *)&commonName);

      sub_22910F1C0(v17, v18);
      swift_bridgeObjectRelease();
      char v11 = v20;
      return v11 & 1;
    }
    sub_2291106BC();
    swift_allocError();
    *(void *)uint64_t v8 = 1;
    *(void *)(v8 + 8) = 0;
    *(unsigned char *)(v8 + 16) = 3;
    swift_willThrow();
    sub_22910F1C0(v17, v18);
    swift_bridgeObjectRelease();
  }
  return *MEMORY[0x263EF8340] == v27;
}

unint64_t sub_229121D64()
{
  uint64_t v2 = qword_2682C3F78;
  if (!qword_2682C3F78)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682C3F78);
    return WitnessTable;
  }
  return v2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_229121DE4(id *a1)
{
}

unint64_t sub_229121E10()
{
  uint64_t v2 = qword_2682C3F80;
  if (!qword_2682C3F80)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682C3F80);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_229121E8C()
{
  return sub_229121EA4();
}

unint64_t sub_229121EA4()
{
  uint64_t v2 = qword_2682C3F88;
  if (!qword_2682C3F88)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682C3F88);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_229121F24()
{
  return sub_22911EB5C();
}

uint64_t sub_229121F3C(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 <= 0xFC) {
      goto LABEL_15;
    }
    unsigned int v7 = ((a2 + 3) >> 8) + 1;
    int v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000) {
        int v2 = 4;
      }
      else {
        int v2 = 2;
      }
      int v8 = v2;
    }
    if (v8 == 1) {
      int v6 = a1[1];
    }
    else {
      int v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    }
    if (v6)
    {
      int v5 = (*a1 | ((v6 - 1) << 8)) + 252;
    }
    else
    {
LABEL_15:
      int v3 = *a1 - 4;
      if (v3 < 0) {
        int v3 = -1;
      }
      int v5 = v3;
    }
  }
  else
  {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *sub_2291220EC(unsigned char *result, unsigned int a2, unsigned int a3)
{
  int v7 = 0;
  if (a3 > 0xFC)
  {
    unsigned int v5 = ((a3 + 3) >> 8) + 1;
    int v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000) {
        int v3 = 4;
      }
      else {
        int v3 = 2;
      }
      int v6 = v3;
    }
    int v7 = v6;
  }
  if (a2 > 0xFC)
  {
    unsigned int v4 = ((a2 - 253) >> 8) + 1;
    *uint64_t result = a2 + 3;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2) {
      *uint64_t result = a2 + 3;
    }
  }
  return result;
}

uint64_t sub_229122330(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_22912233C(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

void *type metadata accessor for MCLHPKEEncryption.MCLHPKEEncryptionError()
{
  return &unk_26DD57808;
}

unint64_t sub_229122358()
{
  return sub_22911CDA8();
}

unint64_t sub_229122370()
{
  return sub_22911253C();
}

unint64_t sub_229122388()
{
  return sub_22911D1EC();
}

unint64_t sub_2291223A0()
{
  return sub_22911D288();
}

uint64_t sub_2291223B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_22911D40C(a1, a2, *(void *)(v3 + 16), *(void *)(v3 + 24), *(unsigned char *)(v3 + 32), *(void *)(v3 + 40), *(void *)(v3 + 48), *(void *)(v3 + 56), a3, *(void *)(v3 + 64));
}

uint64_t sub_2291223FC(uint64_t a1, uint64_t a2)
{
  return sub_22911B560(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

uint64_t sub_229122428(uint64_t a1, uint64_t a2)
{
  return sub_22911D7E4(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48), *(void *)(v2 + 56));
}

uint64_t sub_229122444(uint64_t a1, uint64_t a2)
{
  return sub_22911B560(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

uint64_t sub_229122470(uint64_t a1)
{
  if ((*(void *)(a1 + 8) & 0xF000000000000000) != 0xF000000000000000) {
    sub_22910F1C0(*(void *)a1, *(void *)(a1 + 8));
  }
  return a1;
}

uint64_t sub_2291224C4()
{
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_22912250C()
{
  return sub_22911FE58(*(void (**)(uint64_t))(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t block_copy_helper_34_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_35_0()
{
  return swift_release();
}

uint64_t sub_229122580()
{
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_2291225C8()
{
  return sub_22911FB08(*(void (**)(uint64_t))(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t block_copy_helper_40(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_41()
{
  return swift_release();
}

BOOL sub_22912263C()
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v35 = 0;
  unint64_t v36 = 0;
  uint64_t v33 = 0;
  unint64_t v34 = 0;
  uint64_t v31 = 0;
  unint64_t v32 = 0;
  sub_2291106B4();
  uint64_t v27 = sub_22912B3A8();
  unint64_t v28 = v0;
  if ((v0 & 0xF000000000000000) == 0xF000000000000000) {
    return 0;
  }
  uint64_t v35 = v27;
  unint64_t v36 = v0;
  sub_2291106B4();
  uint64_t v25 = sub_22912B3A8();
  unint64_t v26 = v1;
  if ((v1 & 0xF000000000000000) == 0xF000000000000000)
  {
    sub_22910F1C0(v27, v28);
    return 0;
  }
  uint64_t v33 = v25;
  unint64_t v34 = v1;
  sub_2291106B4();
  uint64_t v23 = sub_22912B3A8();
  unint64_t v24 = v2;
  if ((v2 & 0xF000000000000000) == 0xF000000000000000)
  {
    sub_22910F1C0(v25, v26);
    sub_22910F1C0(v27, v28);
    return 0;
  }
  uint64_t v31 = v23;
  unint64_t v32 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2682C3F90);
  sub_22912BB68();
  unint64_t v18 = v3;
  uint64_t v15 = *MEMORY[0x263F16FA8];
  id v4 = (id)*MEMORY[0x263F16FA8];
  *unint64_t v18 = v15;
  uint64_t v16 = *MEMORY[0x263F16FE0];
  id v5 = (id)*MEMORY[0x263F16FE0];
  v18[1] = v16;
  uint64_t v17 = *MEMORY[0x263F16F68];
  id v6 = (id)*MEMORY[0x263F16F68];
  uint64_t v18[2] = v17;
  uint64_t v19 = *MEMORY[0x263F16F80];
  id v7 = (id)*MEMORY[0x263F16F80];
  v18[3] = v19;
  sub_22910F644();
  type metadata accessor for CFString();
  sub_229122BE8();
  sub_22912B738();
  CFErrorRef v30 = 0;
  sub_22910F0D4(v27, v28);
  CFDataRef keyData = (const __CFData *)sub_22912B3B8();
  swift_bridgeObjectRetain();
  CFDictionaryRef v20 = (const __CFDictionary *)sub_22912B718();
  unint64_t v22 = SecKeyCreateWithData(keyData, v20, &v30);

  swift_bridgeObjectRelease();
  sub_22910F1C0(v27, v28);
  if (v22)
  {
    CFErrorRef v29 = 0;
    algorithm = (__CFString *)*MEMORY[0x263F173A0];
    id v8 = (id)*MEMORY[0x263F173A0];
    sub_22910F0D4(v25, v26);
    CFDataRef signedData = (const __CFData *)sub_22912B3B8();
    sub_22910F0D4(v23, v24);
    CFDataRef v10 = (const __CFData *)sub_22912B3B8();
    Boolean v13 = SecKeyVerifySignature(v22, algorithm, signedData, v10, &v29);

    sub_22910F1C0(v23, v24);
    sub_22910F1C0(v25, v26);

    swift_bridgeObjectRelease();
    sub_22910F1C0(v23, v24);
    sub_22910F1C0(v25, v26);
    sub_22910F1C0(v27, v28);
    return v13 != 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_22910F1C0(v23, v24);
    sub_22910F1C0(v25, v26);
    sub_22910F1C0(v27, v28);
    return 0;
  }
}

uint64_t type metadata accessor for CFString()
{
  uint64_t v4 = qword_2682C3FA0;
  if (!qword_2682C3FA0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    uint64_t v4 = ForeignTypeMetadata;
    if (!v0)
    {
      unint64_t v1 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_2682C3FA0);
      return v1;
    }
  }
  return v4;
}

unint64_t sub_229122BE8()
{
  uint64_t v2 = qword_2682C3F98;
  if (!qword_2682C3F98)
  {
    type metadata accessor for CFString();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682C3F98);
    return WitnessTable;
  }
  return v2;
}

id sub_229122D68()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id sub_229122D90()
{
  id v4 = 0;
  v3.receiver = 0;
  v3.super_class = (Class)type metadata accessor for MCLSignatureVerification();
  id v2 = objc_msgSendSuper2(&v3, sel_init);
  id v0 = v2;
  id v4 = v2;

  return v2;
}

uint64_t type metadata accessor for MCLSignatureVerification()
{
  return self;
}

id sub_229122E4C()
{
  objc_super v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MCLSignatureVerification();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_229122E98()
{
  return sub_22912B498();
}

uint64_t sub_229122EEC()
{
  return sub_22912B488();
}

uint64_t sub_229122F44()
{
  return sub_22912B748();
}

uint64_t sub_229122F5C()
{
  return sub_22912B478() & 1;
}

unint64_t sub_229122FC8()
{
  return sub_229122BE8();
}

unint64_t sub_229122FE0()
{
  return sub_229122FF8();
}

unint64_t sub_229122FF8()
{
  uint64_t v2 = qword_2682C3FA8;
  if (!qword_2682C3FA8)
  {
    type metadata accessor for CFString();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682C3FA8);
    return WitnessTable;
  }
  return v2;
}

uint64_t variable initialization expression of MCLECv3Encryption.queue()
{
  uint64_t v32 = 0;
  unint64_t v16 = (*(void *)(*(void *)(sub_22912B988() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0, v0, v1, v2);
  uint64_t v31 = (uint64_t)&v15 - v16;
  unint64_t v17 = (*(void *)(*(void *)(sub_22912B978() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v32, v3, v4, v5);
  CFErrorRef v30 = (char *)&v15 - v17;
  unint64_t v18 = (*(void *)(*(void *)(sub_22912B4C8() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v32, v6, v7, v8);
  CFErrorRef v29 = (char *)&v15 - v18;
  unint64_t v22 = sub_229111CD8();
  uint64_t v20 = 17;
  uint64_t v9 = sub_22912BB58();
  unint64_t v24 = &v33;
  uint64_t v33 = v9;
  uint64_t v34 = v10;
  int v21 = 1;
  sub_22912B818();
  uint64_t v19 = v11;
  sub_22912BB48();
  swift_bridgeObjectRelease();
  type metadata accessor for MCLECv3Encryption();
  sub_229111D68();
  sub_22912B818();
  uint64_t v23 = v12;
  sub_22912BB48();
  swift_bridgeObjectRelease();
  uint64_t v26 = v33;
  uint64_t v25 = v34;
  swift_bridgeObjectRetain();
  sub_229111228();
  uint64_t v27 = sub_22912B808();
  uint64_t v28 = v13;
  sub_229111DA0();
  sub_229111DB8();
  sub_229111E50(v31);
  return sub_22912B9B8();
}

uint64_t type metadata accessor for MCLECv3Encryption()
{
  return self;
}

uint64_t variable initialization expression of MCLECv3Encryption.symmetricKeyLength()
{
  return 32;
}

uint64_t sub_2291232E8(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v25[2] = 0;
  uint64_t v26 = 0;
  unint64_t v27 = 0;
  v25[9] = a1;
  v25[7] = a2;
  v25[8] = a3;
  v25[5] = a4;
  v25[6] = a5;
  v25[3] = a6;
  v25[4] = a7;
  id v28 = 0;
  int v21 = self;
  swift_bridgeObjectRetain();
  uint64_t v23 = sub_22912B718();
  swift_bridgeObjectRelease();
  type metadata accessor for WritingOptions();
  sub_22912BB68();
  sub_22911253C();
  sub_22912B9E8();
  v25[0] = 0;
  id v24 = objc_msgSend(v21, sel_dataWithJSONObject_options_error_, v23, v25[1], v25);
  id v22 = v25[0];
  id v7 = v25[0];
  uint64_t v8 = v28;
  id v28 = v22;

  swift_unknownObjectRelease();
  if (v24)
  {
    uint64_t v15 = sub_22912B3D8();
    unint64_t v16 = v9;

    uint64_t v17 = v15;
    unint64_t v18 = v16;
  }
  else
  {
    id v12 = v28;
    id v13 = (id)sub_22912B398();

    swift_willThrow();
    uint64_t v17 = 0;
    unint64_t v18 = 0xF000000000000000;
  }
  if ((v18 & 0xF000000000000000) == 0xF000000000000000)
  {
    swift_retain();
    sub_229123668();
    id v14 = (id)swift_allocError();
    *(void *)uint64_t v11 = 1;
    *(void *)(v11 + 8) = 0;
    *(unsigned char *)(v11 + 16) = 1;
    ((void (*)(void))a6)();

    return swift_release();
  }
  else
  {
    uint64_t v26 = v17;
    unint64_t v27 = v18;
    (*(void (**)(void))((*v20 & *MEMORY[0x263F8EED0]) + 0x68))();
    return sub_22910F1C0(v17, v18);
  }
}

unint64_t sub_229123668()
{
  uint64_t v2 = qword_2682C3FB0;
  if (!qword_2682C3FB0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682C3FB0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_229123870(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

uint64_t sub_2291238A4()
{
  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_2291238E4(uint64_t a1)
{
  return sub_229123870(a1, *(void *)(v1 + 16));
}

uint64_t sub_2291238EC()
{
  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_22912392C(void *a1)
{
  sub_229112844(a1, *(void *)(v1 + 16));
}

uint64_t sub_229123934(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v51 = a1;
  unint64_t v52 = a2;
  uint64_t v48 = a3;
  uint64_t v49 = a4;
  uint64_t v42 = a5;
  uint64_t v43 = a6;
  uint64_t v45 = a7;
  uint64_t v46 = a8;
  uint64_t v56 = 0;
  unint64_t v53 = sub_2291240F4;
  uint64_t v54 = sub_229124444;
  uint64_t v55 = sub_22912528C;
  uint64_t v87 = 0;
  uint64_t v88 = 0;
  uint64_t v85 = 0;
  uint64_t v86 = 0;
  uint64_t v83 = 0;
  uint64_t v84 = 0;
  uint64_t v81 = 0;
  uint64_t v82 = 0;
  uint64_t v80 = 0;
  uint64_t v78 = 0;
  uint64_t v79 = 0;
  uint64_t v76 = 0;
  uint64_t v77 = 0;
  uint64_t v60 = sub_22912B4A8();
  uint64_t v57 = *(void *)(v60 - 8);
  uint64_t v58 = v60 - 8;
  unint64_t v40 = (*(void *)(v57 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0, v9, v10, v11);
  uint64_t v59 = (char *)&v40 - v40;
  uint64_t v64 = sub_22912B4C8();
  uint64_t v61 = *(void *)(v64 - 8);
  uint64_t v62 = v64 - 8;
  unint64_t v41 = (*(void *)(v61 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v12 = MEMORY[0x270FA5388](v43, v52, v48, v49);
  unint64_t v63 = (char *)&v40 - v41;
  uint64_t v87 = v13;
  uint64_t v88 = v14;
  uint64_t v85 = v15;
  uint64_t v86 = v16;
  uint64_t v83 = v17;
  uint64_t v84 = v12;
  uint64_t v81 = v18;
  uint64_t v82 = v19;
  uint64_t v80 = v8;
  swift_retain();
  uint64_t v44 = 32;
  uint64_t v47 = 7;
  uint64_t v20 = swift_allocObject();
  uint64_t v21 = v43;
  id v22 = v53;
  uint64_t v68 = v20;
  *(void *)(v20 + 16) = v42;
  *(void *)(v20 + 24) = v21;
  uint64_t v78 = v22;
  uint64_t v79 = v20;
  swift_retain();
  uint64_t v23 = swift_allocObject();
  uint64_t v24 = v46;
  uint64_t v25 = v54;
  uint64_t v67 = v23;
  *(void *)(v23 + 16) = v45;
  *(void *)(v23 + 24) = v24;
  uint64_t v76 = v25;
  uint64_t v77 = v23;
  id v66 = *(id *)(v8 + OBJC_IVAR___MCLECv3Encryption_queue);
  id v26 = v66;
  swift_bridgeObjectRetain();
  id v27 = v50;
  sub_22910F0D4(v51, v52);
  swift_retain();
  swift_retain();
  uint64_t v28 = swift_allocObject();
  uint64_t v29 = v49;
  id v30 = v50;
  uint64_t v31 = v51;
  unint64_t v32 = v52;
  uint64_t v33 = v53;
  uint64_t v34 = v54;
  uint64_t v35 = v55;
  uint64_t v36 = v68;
  uint64_t v37 = (void *)v28;
  uint64_t v38 = v67;
  v37[2] = v48;
  v37[3] = v29;
  v37[4] = v30;
  v37[5] = v31;
  v37[6] = v32;
  v37[7] = v33;
  v37[8] = v36;
  v37[9] = v34;
  v37[10] = v38;
  unint64_t v74 = v35;
  id v75 = v37;
  aBlocunsigned int k = MEMORY[0x263EF8330];
  int v70 = 1107296256;
  int v71 = 0;
  uint64_t v72 = sub_2291143B0;
  uint64_t v73 = &block_descriptor_1;
  unint64_t v65 = _Block_copy(&aBlock);
  sub_229113FFC();
  sub_229114014();
  MEMORY[0x22A6B1090](v56, v63, v59, v65);
  (*(void (**)(char *, uint64_t))(v57 + 8))(v59, v60);
  (*(void (**)(char *, uint64_t))(v61 + 8))(v63, v64);
  _Block_release(v65);
  swift_release();

  swift_release();
  return swift_release();
}

void sub_229123E20(void *a1, uint64_t a2, uint64_t a3)
{
  id v21 = a1;
  uint64_t v18 = a2;
  uint64_t v19 = a3;
  uint64_t v22 = 0;
  uint64_t v20 = sub_22912B2A4;
  uint64_t v42 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  uint64_t v26 = sub_22912B4A8();
  uint64_t v23 = *(void *)(v26 - 8);
  uint64_t v24 = v26 - 8;
  unint64_t v16 = (*(void *)(v23 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0, v3, v4, v5);
  uint64_t v25 = (char *)&v16 - v16;
  uint64_t v30 = sub_22912B4C8();
  uint64_t v27 = *(void *)(v30 - 8);
  uint64_t v28 = v30 - 8;
  unint64_t v17 = (*(void *)(v27 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v22, v18, v19, v6);
  uint64_t v29 = (char *)&v16 - v17;
  uint64_t v42 = v7;
  uint64_t v40 = v8;
  uint64_t v41 = v9;
  sub_229111CD8();
  id v32 = (id)sub_22912B998();
  swift_retain();
  id v10 = v21;
  uint64_t v11 = swift_allocObject();
  uint64_t v12 = v19;
  uint64_t v13 = v20;
  uint64_t v14 = (void *)v11;
  id v15 = v21;
  v14[2] = v18;
  v14[3] = v12;
  v14[4] = v15;
  uint64_t v38 = v13;
  uint64_t v39 = v14;
  aBlocunsigned int k = MEMORY[0x263EF8330];
  int v34 = 1107296256;
  int v35 = 0;
  uint64_t v36 = sub_229113FAC;
  uint64_t v37 = &block_descriptor_67;
  uint64_t v31 = _Block_copy(&aBlock);
  swift_release();
  sub_229113FFC();
  sub_229114014();
  MEMORY[0x22A6B1090](v22, v29, v25, v31);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v26);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v29, v30);
  _Block_release(v31);
}

uint64_t sub_2291240B4()
{
  return swift_deallocObject();
}

void sub_2291240F4(void *a1)
{
  sub_229123E20(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_229124100(void (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return swift_release();
}

void sub_229124170(void *a1, uint64_t a2, uint64_t a3)
{
  id v21 = a1;
  uint64_t v18 = a2;
  uint64_t v19 = a3;
  uint64_t v22 = 0;
  uint64_t v20 = sub_22912B1E8;
  uint64_t v42 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  uint64_t v26 = sub_22912B4A8();
  uint64_t v23 = *(void *)(v26 - 8);
  uint64_t v24 = v26 - 8;
  unint64_t v16 = (*(void *)(v23 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0, v3, v4, v5);
  uint64_t v25 = (char *)&v16 - v16;
  uint64_t v30 = sub_22912B4C8();
  uint64_t v27 = *(void *)(v30 - 8);
  uint64_t v28 = v30 - 8;
  unint64_t v17 = (*(void *)(v27 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v22, v18, v19, v6);
  uint64_t v29 = (char *)&v16 - v17;
  uint64_t v42 = v7;
  uint64_t v40 = v8;
  uint64_t v41 = v9;
  sub_229111CD8();
  id v32 = (id)sub_22912B998();
  swift_retain();
  id v10 = v21;
  uint64_t v11 = swift_allocObject();
  uint64_t v12 = v19;
  uint64_t v13 = v20;
  uint64_t v14 = (void *)v11;
  id v15 = v21;
  v14[2] = v18;
  v14[3] = v12;
  v14[4] = v15;
  uint64_t v38 = v13;
  uint64_t v39 = v14;
  aBlocunsigned int k = MEMORY[0x263EF8330];
  int v34 = 1107296256;
  int v35 = 0;
  uint64_t v36 = sub_229113FAC;
  uint64_t v37 = &block_descriptor_61;
  uint64_t v31 = _Block_copy(&aBlock);
  swift_release();
  sub_229113FFC();
  sub_229114014();
  MEMORY[0x22A6B1090](v22, v29, v25, v31);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v26);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v29, v30);
  _Block_release(v31);
}

uint64_t sub_229124404()
{
  return swift_deallocObject();
}

void sub_229124444(void *a1)
{
  sub_229124170(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_229124450(void (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return swift_release();
}

void sub_2291244C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(id), uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v104 = a1;
  uint64_t v103 = a2;
  uint64_t v96 = a3;
  uint64_t v97 = a4;
  uint64_t v98 = a5;
  uint64_t v99 = a6;
  uint64_t v100 = a7;
  uint64_t v101 = a8;
  uint64_t v102 = a9;
  uint64_t v141 = 0;
  unint64_t v140 = 0;
  uint64_t v139 = 0;
  unint64_t v138 = 0;
  uint64_t v137 = 0;
  uint64_t v135 = 0;
  uint64_t v136 = 0;
  uint64_t v134 = 0;
  uint64_t v132 = 0;
  uint64_t v133 = 0;
  uint64_t v130 = 0;
  uint64_t v131 = 0;
  uint64_t v128 = 0;
  uint64_t v129 = 0;
  uint64_t v127 = 0;
  uint64_t v126 = 0;
  uint64_t v124 = 0;
  unint64_t v125 = 0;
  uint64_t v120 = 0;
  unint64_t v121 = 0;
  id v118 = 0;
  uint64_t v90 = 0;
  uint64_t v73 = sub_22912B5B8();
  uint64_t v74 = *(void *)(v73 - 8);
  uint64_t v75 = v73 - 8;
  unint64_t v76 = (*(void *)(v74 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v12 = MEMORY[0x270FA5388](0, v9, v10, v11);
  uint64_t v77 = (uint64_t)v48 - v76;
  unint64_t v78 = (v13 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v12, (char *)v48 - v76, v14, v15);
  uint64_t v79 = (uint64_t)v48 - v78;
  uint64_t v141 = (char *)v48 - v78;
  uint64_t v80 = sub_22912B558();
  uint64_t v81 = *(void *)(v80 - 8);
  uint64_t v82 = v80 - 8;
  unint64_t v83 = (*(void *)(v81 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v90, v16, v17, v18);
  uint64_t v84 = (uint64_t)v48 - v83;
  unint64_t v140 = (char *)v48 - v83;
  uint64_t v85 = sub_22912B528();
  uint64_t v86 = *(void *)(v85 - 8);
  uint64_t v87 = v85 - 8;
  unint64_t v88 = (*(void *)(v86 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v90, v19, v20, v21);
  uint64_t v89 = (char *)v48 - v88;
  uint64_t v139 = (char *)v48 - v88;
  uint64_t v91 = sub_22912B6E8();
  uint64_t v92 = *(void *)(v91 - 8);
  uint64_t v93 = v91 - 8;
  unint64_t v94 = (*(void *)(v92 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v90, v22, v23, v24);
  uint64_t v95 = (char *)v48 - v94;
  unint64_t v138 = (char *)v48 - v94;
  uint64_t v105 = sub_22912B698();
  uint64_t v106 = *(void *)(v105 - 8);
  uint64_t v107 = v105 - 8;
  uint64_t v111 = *(void *)(v106 + 64);
  unint64_t v108 = (v111 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v25 = MEMORY[0x270FA5388](v104, v103, v96, v97);
  uint64_t v109 = (uint64_t)v48 - v108;
  unint64_t v110 = (v111 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v29 = MEMORY[0x270FA5388](v25, v26, v27, v28);
  uint64_t v112 = (uint64_t)v48 - v110;
  unint64_t v113 = (v111 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v33 = MEMORY[0x270FA5388](v29, v30, v31, v32);
  uint64_t v114 = (char *)v48 - v113;
  uint64_t v137 = (char *)v48 - v113;
  uint64_t v135 = v33;
  uint64_t v136 = v34;
  uint64_t v134 = v35;
  uint64_t v132 = v36;
  uint64_t v133 = v37;
  uint64_t v130 = v38;
  uint64_t v131 = v39;
  uint64_t v128 = v40;
  uint64_t v129 = v41;
  uint64_t v42 = static MCLECCertValidation.evaluatePublicCertTrust(base64EncodedCert:)();
  uint64_t v115 = 0;
  unint64_t v116 = v42;
  uint64_t v117 = 0;
  uint64_t v68 = v42;
  uint64_t v126 = v42;
  uint64_t v43 = static MCLECCertValidation.getExternalCertRepresentation(from:)(v42);
  uint64_t v69 = 0;
  uint64_t v70 = v43;
  unint64_t v71 = v44;
  uint64_t v72 = 0;
  unint64_t v65 = v44;
  uint64_t v64 = v43;
  uint64_t v124 = v43;
  unint64_t v125 = v44;
  sub_22910F0D4(v43, v44);
  uint64_t v122 = v64;
  unint64_t v123 = v65;
  sub_22912B688();
  uint64_t v66 = 0;
  uint64_t v67 = 0;
  sub_22912B6D8();
  sub_22912B6B8();
  uint64_t v62 = 0;
  uint64_t v63 = 0;
  sub_22912B6C8();
  uint64_t v45 = sub_22912B678();
  unint64_t v52 = &v120;
  uint64_t v120 = v45;
  unint64_t v121 = v46;
  id v50 = *(void (**)(uint64_t, uint64_t))(v106 + 8);
  uint64_t v51 = v106 + 8;
  v50(v112, v105);
  uint64_t v53 = sub_22912B678();
  unint64_t v54 = v47;
  sub_22912B408();
  sub_22910F1C0(v53, v54);
  uint64_t v58 = sub_22912B6F8();
  uint64_t v55 = v120;
  unint64_t v56 = v121;
  sub_22910F0D4(v120, v121);
  uint64_t v60 = v119;
  v119[0] = v55;
  v119[1] = v56;
  uint64_t v57 = *(void *)(v96 + OBJC_IVAR___MCLECv3Encryption_symmetricKeyLength);
  unint64_t v59 = sub_229117804();
  sub_229117888();
  sub_22912B518();
  sub_22910F18C((uint64_t)v60);
  sub_229125500(v97, v98, v84, v79);
  uint64_t v61 = 0;
  v48[6] = type metadata accessor for MCLECv3Encryption.ECV3EncryptedDataContainer();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v74 + 16))(v77, v79, v73);
  sub_22912B6C8();
  (*(void (**)(uint64_t, char *, uint64_t))(v106 + 16))(v109, v114, v105);
  id v49 = sub_2291252D8(v77, v112, v109);
  id v118 = v49;
  swift_retain();
  v99(v49);
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v74 + 8))(v79, v73);
  (*(void (**)(uint64_t, uint64_t))(v81 + 8))(v84, v80);
  sub_22910F18C((uint64_t)&v120);
  (*(void (**)(char *, uint64_t))(v86 + 8))(v89, v85);
  (*(void (**)(char *, uint64_t))(v92 + 8))(v95, v91);
  v50((uint64_t)v114, v105);
  sub_22910F1C0(v64, v65);
}

uint64_t sub_229125228()
{
  swift_bridgeObjectRelease();

  sub_22910F1C0(*(void *)(v0 + 40), *(void *)(v0 + 48));
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_22912528C()
{
  sub_2291244C0(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void (**)(id))(v0 + 56), *(void *)(v0 + 64), *(void *)(v0 + 72), *(void *)(v0 + 80));
}

id sub_2291252D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = objc_allocWithZone(v3);
  return sub_22912832C(a1, a2, a3);
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_229125500@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v53 = a4;
  uint64_t v76 = a1;
  uint64_t v70 = a2;
  uint64_t v54 = a3;
  uint64_t v5 = v4;
  uint64_t v68 = v5;
  uint64_t v62 = 0;
  unint64_t v71 = sub_229125E70;
  uint64_t v91 = 0;
  uint64_t v90 = 0;
  uint64_t v89 = 0;
  uint64_t v87 = 0;
  uint64_t v88 = 0;
  uint64_t v86 = 0;
  uint64_t v85 = 0;
  uint64_t v81 = 0;
  unint64_t v82 = 0;
  unint64_t v55 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2682C3E60) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0, v7, v8, v9);
  uint64_t v56 = (uint64_t)&v31 - v55;
  uint64_t v57 = sub_22912B5B8();
  uint64_t v58 = *(void *)(v57 - 8);
  uint64_t v59 = v57 - 8;
  unint64_t v60 = (*(void *)(v58 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v62, v10, v11, v12);
  uint64_t v61 = (char *)&v31 - v60;
  uint64_t v91 = (char *)&v31 - v60;
  uint64_t v63 = sub_22912B588();
  uint64_t v64 = *(void *)(v63 - 8);
  uint64_t v65 = v63 - 8;
  unint64_t v66 = (*(void *)(v64 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v62, v13, v14, v15);
  uint64_t v67 = (char *)&v31 - v66;
  uint64_t v90 = (char *)&v31 - v66;
  uint64_t v16 = sub_22912B558();
  uint64_t v17 = v69;
  uint64_t v72 = v16;
  uint64_t v73 = *(void *)(v16 - 8);
  uint64_t v74 = v16 - 8;
  unint64_t v75 = (*(void *)(v73 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v71, v70, v18, v19);
  uint64_t v77 = (char *)&v31 - v75;
  uint64_t v89 = (char *)&v31 - v75;
  uint64_t v87 = v76;
  uint64_t v88 = v20;
  uint64_t v86 = a3;
  uint64_t v85 = v21;
  sub_22912B538();
  uint64_t v78 = v17;
  if (v17)
  {
    __break(1u);
LABEL_9:
    uint64_t v32 = v46;
    (*(void (**)(char *, uint64_t))(v73 + 8))(v77, v72);
    uint64_t result = sub_22910F1C0(v51, v52);
    uint64_t v37 = v32;
    return result;
  }
  uint64_t v51 = v83;
  unint64_t v52 = v84;
  uint64_t v81 = v83;
  unint64_t v82 = v84;
  if (sub_22912B3E8() != *(void *)(v68 + OBJC_IVAR___MCLECv3Encryption_symmetricKeyLength))
  {
    uint64_t v33 = *(void *)(v68 + OBJC_IVAR___MCLECv3Encryption_symmetricKeyLength);
    uint64_t v35 = sub_22912B3E8();
    sub_229123668();
    int v34 = 0;
    uint64_t v26 = swift_allocError();
    char v27 = v34;
    uint64_t v28 = v26;
    uint64_t v29 = v35;
    uint64_t v36 = v28;
    *(void *)uint64_t v30 = v33;
    *(void *)(v30 + 8) = v29;
    *(unsigned char *)(v30 + 16) = v27 & 1;
    swift_willThrow();
    sub_22910F1C0(v51, v52);
    uint64_t result = v36;
    uint64_t v37 = v36;
    return result;
  }
  sub_22910F0D4(v51, v52);
  v80[8] = v51;
  v80[9] = v52;
  uint64_t v50 = *(void *)(v68 + OBJC_IVAR___MCLECv3Encryption_symmetricKeyLength);
  uint64_t v47 = v50 / 2;
  sub_22910FFC4();
  uint64_t v48 = MEMORY[0x263F06F78];
  sub_22912B948();
  v80[6] = v80[10];
  v80[7] = v80[11];
  sub_22912B548();
  sub_22910F0D4(v51, v52);
  v80[2] = v51;
  v80[3] = v52;
  uint64_t v49 = *(void *)(v68 + OBJC_IVAR___MCLECv3Encryption_symmetricKeyLength);
  uint64_t v41 = v49 / 2;
  sub_2291287A4();
  uint64_t v42 = MEMORY[0x263F06F78];
  sub_22912B758();
  uint64_t v43 = v80;
  v80[0] = v80[4];
  v80[1] = v80[5];
  unint64_t v22 = sub_229117888();
  uint64_t v23 = v78;
  unint64_t v44 = v22;
  sub_22912B578();
  uint64_t v45 = v23;
  uint64_t v46 = v23;
  if (v23) {
    goto LABEL_9;
  }
  uint64_t v38 = v79;
  v79[0] = v76;
  v79[1] = v70;
  (*(void (**)(uint64_t, char *, uint64_t))(v64 + 16))(v56, v67, v63);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v64 + 56))(v56, 0, 1, v63);
  uint64_t v24 = v45;
  sub_22912B568();
  uint64_t v39 = v24;
  uint64_t v40 = v24;
  if (v24)
  {
    uint64_t v31 = v40;
    sub_2291179A4(v56);
  }
  else
  {
    sub_2291179A4(v56);
    (*(void (**)(uint64_t, char *, uint64_t))(v58 + 16))(v53, v61, v57);
    (*(void (**)(char *, uint64_t))(v58 + 8))(v61, v57);
  }
  (*(void (**)(char *, uint64_t))(v64 + 8))(v67, v63);
  (*(void (**)(char *, uint64_t))(v73 + 8))(v77, v72);
  return sub_22910F1C0(v51, v52);
}

uint64_t sub_229125E70@<X0>(uint64_t *a1@<X8>)
{
  sub_22912B908();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2682C3DC8);
  sub_22910EFD8();
  uint64_t result = sub_22912B448();
  *a1 = result;
  a1[1] = v2;
  return result;
}

uint64_t MCLECv3Encryption.ECv3EncryptionError.errorDescription.getter(uint64_t a1, uint64_t a2, char a3)
{
  if (a3)
  {
    sub_22912BB58();
    sub_22912B818();
    sub_22912BB48();
    swift_bridgeObjectRelease();
    sub_22912BB18();
  }
  else
  {
    sub_22912BB58();
    sub_22912B818();
    sub_22912BB48();
    swift_bridgeObjectRelease();
    sub_22912BB18();
    sub_22912B818();
    sub_22912BB48();
    swift_bridgeObjectRelease();
    sub_22912BB28();
    sub_22912B818();
    sub_22912BB48();
    swift_bridgeObjectRelease();
    sub_22912BB28();
  }
  sub_22912B818();
  sub_22912BB48();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_229111228();
  return sub_22912B808();
}

uint64_t sub_229126230()
{
  return MCLECv3Encryption.ECv3EncryptionError.errorDescription.getter(*(void *)v0, *(void *)(v0 + 8), *(unsigned char *)(v0 + 16) & 1);
}

uint64_t sub_229126258()
{
  return sub_22912B358();
}

uint64_t sub_229126270()
{
  return sub_22912B378();
}

uint64_t sub_229126288()
{
  return sub_22912B348();
}

uint64_t sub_2291262A0()
{
  return sub_22912BBC8();
}

uint64_t sub_2291262B8()
{
  return sub_22912BBB8();
}

uint64_t sub_2291262D0()
{
  return sub_22912BBD8();
}

uint64_t sub_2291262E8()
{
  return sub_22912BBA8();
}

uint64_t sub_22912637C()
{
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR___MCLECv3EncryptedDataContainer_data);
  swift_bridgeObjectRetain();
  return v2;
}

void *sub_229126424()
{
  uint64_t v3 = *(void **)(v0 + OBJC_IVAR___MCLECv3EncryptedDataContainer_params);
  id v1 = v3;
  return v3;
}

uint64_t variable initialization expression of MCLECv3Encryption.ECV3EncryptedDataContainer.Params.algorithmIdentifier()
{
  return sub_22912B818();
}

uint64_t sub_229126494()
{
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR___MCLECv3Params_algorithmIdentifier);
  swift_bridgeObjectRetain();
  return v2;
}

void *sub_22912653C()
{
  uint64_t v3 = *(void **)(v0 + OBJC_IVAR___MCLECv3Params_keyAgreement);
  id v1 = v3;
  return v3;
}

uint64_t sub_2291265F8()
{
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR___MCLECv3KeyAgreement_sender);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_2291266C0()
{
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR___MCLECv3KeyAgreement_recipientFingerprint);
  swift_bridgeObjectRetain();
  return v2;
}

id sub_22912670C(uint64_t a1, uint64_t a2)
{
  id v3 = objc_allocWithZone(v2);
  return sub_229126750(a1, a2);
}

id sub_229126750(uint64_t a1, uint64_t a2)
{
  uint64_t v37 = a1;
  uint64_t v42 = a2;
  id v3 = v2;
  uint64_t v47 = v3;
  uint64_t v48 = 0;
  unint64_t v55 = sub_229126AE0;
  uint64_t v63 = 0;
  id v62 = 0;
  uint64_t v61 = 0;
  uint64_t v60 = 0;
  uint64_t v53 = 0;
  uint64_t v38 = sub_22912B4F8();
  uint64_t v39 = *(void *)(v38 - 8);
  uint64_t v40 = v38 - 8;
  unint64_t v41 = (*(void *)(v39 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v7 = (void *)MEMORY[0x270FA5388](v47, v42, v5, v6);
  uint64_t v51 = (char *)&v26 - v41;
  uint64_t v63 = (char *)&v26 - v41;
  uint64_t v61 = a1;
  uint64_t v60 = v8;
  id v9 = v7;
  uint64_t v10 = v47;
  id v62 = v47;
  uint64_t v43 = sub_22912B678();
  unint64_t v44 = v11;
  sub_229118768();
  uint64_t v45 = sub_22912B3C8();
  uint64_t v46 = v12;
  sub_22910F1C0(v43, v44);
  uint64_t v13 = v46;
  id v14 = v47;
  uint64_t v15 = (uint64_t *)&v47[OBJC_IVAR___MCLECv3KeyAgreement_sender];
  uint64_t *v15 = v45;
  v15[1] = v13;

  uint64_t v49 = sub_22912B6F8();
  uint64_t v16 = sub_22912B678();
  unint64_t v52 = v59;
  v59[0] = v16;
  v59[1] = v17;
  unint64_t v50 = sub_229117804();
  sub_229117888();
  uint64_t v54 = MEMORY[0x263F06F78];
  sub_22912B4D8();
  sub_22910F18C((uint64_t)v52);
  sub_22912B4E8();
  uint64_t v27 = v57;
  unint64_t v28 = v58;
  sub_229118768();
  uint64_t v29 = sub_22912B3C8();
  uint64_t v30 = v18;
  sub_22910F1C0(v27, v28);
  uint64_t v19 = v30;
  id v20 = v47;
  uint64_t v21 = (uint64_t *)&v47[OBJC_IVAR___MCLECv3KeyAgreement_recipientFingerprint];
  *uint64_t v21 = v29;
  v21[1] = v19;

  (*(void (**)(char *, uint64_t))(v39 + 8))(v51, v38);
  id v31 = v62;
  uint64_t v32 = 0;
  unint64_t v22 = (objc_class *)type metadata accessor for MCLECv3Encryption.ECV3EncryptedDataContainer.Params.KeyAgreement();
  v56.receiver = v31;
  v56.super_class = v22;
  id v36 = objc_msgSendSuper2(&v56, sel_init);
  id v23 = v36;
  id v62 = v36;
  uint64_t v33 = sub_22912B698();
  uint64_t v24 = *(void *)(v33 - 8);
  uint64_t v35 = *(void (**)(uint64_t))(v24 + 8);
  uint64_t v34 = v24 + 8;
  v35(v42);
  ((void (*)(uint64_t, uint64_t))v35)(v37, v33);

  return v36;
}

uint64_t sub_229126AE0@<X0>(uint64_t *a1@<X8>)
{
  sub_22912B908();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2682C3DC8);
  sub_22910EFD8();
  uint64_t result = sub_22912B448();
  *a1 = result;
  a1[1] = v2;
  return result;
}

id MCLECv3Encryption.ECV3EncryptedDataContainer.Params.KeyAgreement.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t MCLECv3Encryption.ECV3EncryptedDataContainer.Params.KeyAgreement.init()()
{
  if (!"JITAppKit.KeyAgreement")
  {
    sub_22912BAD8();
    __break(1u);
  }
  uint64_t result = sub_22911B8E4((uint64_t)"JITAppKit.KeyAgreement", 22, (unint64_t)"init()", 6, 2, (unint64_t)"JITAppKit/MCLECv3Encryption.swift", 33, 2, v1, 0x97uLL, 0x11uLL);
  __break(1u);
  return result;
}

BOOL sub_229126CE0(char a1, char a2)
{
  return ((a1 & 1) != 0) == (unint64_t)((a2 & 1) != 0);
}

uint64_t sub_229126D64()
{
  return sub_22912BBE8();
}

uint64_t sub_229126DE4()
{
  swift_bridgeObjectRetain();
  sub_22912B818();
  swift_bridgeObjectRetain();
  char v3 = sub_22912B828();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v3)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
LABEL_6:
    swift_bridgeObjectRelease();
    return v4 & 1;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_22912B818();
  swift_bridgeObjectRetain();
  char v2 = sub_22912B828();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v2)
  {
    swift_bridgeObjectRelease();
    char v4 = 1;
    goto LABEL_6;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 2;
}

uint64_t sub_229126F84()
{
  return 2;
}

uint64_t sub_229126F9C()
{
  return sub_22912BA88();
}

uint64_t sub_229126FF8()
{
  return 0;
}

uint64_t sub_22912701C()
{
  return sub_22912B818();
}

BOOL sub_2291270A8(unsigned char *a1, unsigned char *a2)
{
  return sub_229126CE0(*a1 & 1, *a2 & 1);
}

uint64_t sub_2291270D4()
{
  return sub_229126F9C();
}

uint64_t sub_2291270F4()
{
  return sub_229126D64();
}

uint64_t sub_229127114()
{
  return sub_22912B748();
}

uint64_t sub_22912712C()
{
  return sub_22912701C();
}

uint64_t sub_22912714C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_229126DE4();
  *a1 = result;
  return result;
}

uint64_t sub_229127178()
{
  return sub_229126FF8();
}

uint64_t sub_22912719C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_229126F84();
  *a1 = result;
  return result;
}

uint64_t sub_2291271C8()
{
  return sub_22912BC08();
}

uint64_t sub_2291271F8()
{
  return sub_22912BC18();
}

id MCLECv3Encryption.ECV3EncryptedDataContainer.Params.KeyAgreement.__deallocating_deinit()
{
  char v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MCLECv3Encryption.ECV3EncryptedDataContainer.Params.KeyAgreement();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t MCLECv3Encryption.ECV3EncryptedDataContainer.Params.KeyAgreement.encode(to:)(uint64_t a1)
{
  uint64_t v10 = a1;
  uint64_t v27 = 0;
  uint64_t v26 = 0;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2682C4000);
  uint64_t v11 = *(void *)(v21 - 8);
  uint64_t v12 = v21 - 8;
  unint64_t v13 = (*(void *)(v11 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v16 = (char *)v8 - v13;
  uint64_t v27 = (void *)MEMORY[0x270FA5388](v10, v2, v3, v4);
  uint64_t v26 = v1;
  uint64_t v14 = v27[3];
  uint64_t v15 = v27[4];
  __swift_project_boxed_opaque_existential_1(v27, v14);
  sub_2291296F0();
  sub_22912BBF8();
  uint64_t v5 = v18;
  uint64_t v19 = *(void *)(v17 + OBJC_IVAR___MCLECv3KeyAgreement_sender);
  uint64_t v20 = *(void *)(v17 + OBJC_IVAR___MCLECv3KeyAgreement_sender + 8);
  swift_bridgeObjectRetain();
  char v25 = 0;
  sub_22912BAF8();
  uint64_t v22 = v5;
  uint64_t v23 = v5;
  if (v5)
  {
    v8[1] = v23;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v16, v21);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v6 = v22;
    v8[3] = *(void *)(v17 + OBJC_IVAR___MCLECv3KeyAgreement_recipientFingerprint);
    v8[4] = *(void *)(v17 + OBJC_IVAR___MCLECv3KeyAgreement_recipientFingerprint + 8);
    swift_bridgeObjectRetain();
    char v24 = 1;
    sub_22912BAF8();
    v8[5] = v6;
    uint64_t v9 = v6;
    if (v6) {
      v8[0] = v9;
    }
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v16, v21);
  }
}

uint64_t sub_22912755C()
{
  return (*(uint64_t (**)(void))((**v0 & *MEMORY[0x263F8EED0]) + 0x68))();
}

id sub_2291275EC(uint64_t a1, uint64_t a2)
{
  id v3 = objc_allocWithZone(v2);
  return sub_229127630(a1, a2);
}

id sub_229127630(uint64_t a1, uint64_t a2)
{
  uint64_t v36 = a1;
  uint64_t v35 = a2;
  id v44 = 0;
  uint64_t v43 = 0;
  uint64_t v42 = 0;
  uint64_t v31 = 0;
  uint64_t v37 = sub_22912B698();
  uint64_t v33 = *(void **)(v37 - 8);
  uint64_t v34 = v37 - 8;
  unint64_t v23 = (v33[8] + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = MEMORY[0x270FA5388](v36, v35, v3, v4);
  uint64_t v28 = (uint64_t)&v22 - v23;
  unint64_t v24 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v9 = MEMORY[0x270FA5388](v5, v7, (char *)&v22 - v23, v8);
  uint64_t v29 = (uint64_t)&v22 - v24;
  uint64_t v43 = v9;
  uint64_t v42 = v10;
  id v11 = v2;
  id v12 = v2;
  id v44 = v2;
  uint64_t v25 = OBJC_IVAR___MCLECv3Params_algorithmIdentifier;
  uint64_t v13 = sub_22912B818();
  uint64_t v14 = v30;
  uint64_t v15 = (uint64_t *)&v30[v25];
  uint64_t *v15 = v13;
  v15[1] = v16;

  type metadata accessor for MCLECv3Encryption.ECV3EncryptedDataContainer.Params.KeyAgreement();
  uint64_t v27 = (void (*)(uint64_t, uint64_t, uint64_t))v33[2];
  uint64_t v26 = v33 + 2;
  v27(v29, v36, v37);
  v27(v28, v35, v37);
  id v17 = sub_22912670C(v29, v28);
  uint64_t v18 = v30;
  *(void *)&v30[OBJC_IVAR___MCLECv3Params_keyAgreement] = v17;

  id v32 = v44;
  uint64_t v19 = (objc_class *)type metadata accessor for MCLECv3Encryption.ECV3EncryptedDataContainer.Params();
  v41.receiver = v32;
  v41.super_class = v19;
  id v40 = objc_msgSendSuper2(&v41, sel_init);
  id v20 = v40;
  id v44 = v40;
  uint64_t v39 = (void (*)(uint64_t, uint64_t))v33[1];
  uint64_t v38 = v33 + 1;
  v39(v35, v37);
  v39(v36, v37);

  return v40;
}

id MCLECv3Encryption.ECV3EncryptedDataContainer.Params.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t MCLECv3Encryption.ECV3EncryptedDataContainer.Params.init()()
{
  if (!"JITAppKit.Params")
  {
    sub_22912BAD8();
    __break(1u);
  }
  uint64_t result = sub_22911B8E4((uint64_t)"JITAppKit.Params", 16, (unint64_t)"init()", 6, 2, (unint64_t)"JITAppKit/MCLECv3Encryption.swift", 33, 2, v1, 0x91uLL, 0x10uLL);
  __break(1u);
  return result;
}

BOOL sub_2291279FC(char a1, char a2)
{
  return ((a1 & 1) != 0) == (unint64_t)((a2 & 1) != 0);
}

uint64_t sub_229127A80()
{
  return sub_22912BBE8();
}

uint64_t sub_229127B00()
{
  swift_bridgeObjectRetain();
  sub_22912B818();
  swift_bridgeObjectRetain();
  char v3 = sub_22912B828();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v3)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
LABEL_6:
    swift_bridgeObjectRelease();
    return v4 & 1;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_22912B818();
  swift_bridgeObjectRetain();
  char v2 = sub_22912B828();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v2)
  {
    swift_bridgeObjectRelease();
    char v4 = 1;
    goto LABEL_6;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 2;
}

uint64_t sub_229127CA0()
{
  return 2;
}

uint64_t sub_229127CB8()
{
  return sub_22912BA88();
}

uint64_t sub_229127D14()
{
  return 0;
}

uint64_t sub_229127D38()
{
  return sub_22912B818();
}

BOOL sub_229127DC4(unsigned char *a1, unsigned char *a2)
{
  return sub_2291279FC(*a1 & 1, *a2 & 1);
}

uint64_t sub_229127DF0()
{
  return sub_229127CB8();
}

uint64_t sub_229127E10()
{
  return sub_229127A80();
}

uint64_t sub_229127E30()
{
  return sub_22912B748();
}

uint64_t sub_229127E48()
{
  return sub_229127D38();
}

uint64_t sub_229127E68@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_229127B00();
  *a1 = result;
  return result;
}

uint64_t sub_229127E94()
{
  return sub_229127D14();
}

uint64_t sub_229127EB8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_229127CA0();
  *a1 = result;
  return result;
}

uint64_t sub_229127EE4()
{
  return sub_22912BC08();
}

uint64_t sub_229127F14()
{
  return sub_22912BC18();
}

id MCLECv3Encryption.ECV3EncryptedDataContainer.Params.__deallocating_deinit()
{
  char v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MCLECv3Encryption.ECV3EncryptedDataContainer.Params();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t MCLECv3Encryption.ECV3EncryptedDataContainer.Params.encode(to:)(uint64_t a1)
{
  uint64_t v16 = a1;
  uint64_t v34 = 0;
  uint64_t v33 = 0;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2682C4008);
  uint64_t v17 = *(void *)(v27 - 8);
  uint64_t v18 = v27 - 8;
  unint64_t v19 = (*(void *)(v17 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v22 = (char *)v9 - v19;
  uint64_t v34 = (void *)MEMORY[0x270FA5388](v16, v2, v3, v4);
  uint64_t v33 = v1;
  uint64_t v20 = v34[3];
  uint64_t v21 = v34[4];
  __swift_project_boxed_opaque_existential_1(v34, v20);
  sub_229129818();
  sub_22912BBF8();
  uint64_t v5 = v24;
  uint64_t v25 = *(void *)(v23 + OBJC_IVAR___MCLECv3Params_algorithmIdentifier);
  uint64_t v26 = *(void *)(v23 + OBJC_IVAR___MCLECv3Params_algorithmIdentifier + 8);
  swift_bridgeObjectRetain();
  char v32 = 0;
  sub_22912BAF8();
  uint64_t v28 = v5;
  uint64_t v29 = v5;
  if (v5)
  {
    v9[1] = v29;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v22, v27);
  }
  else
  {
    swift_bridgeObjectRelease();
    id v10 = *(id *)(v23 + OBJC_IVAR___MCLECv3Params_keyAgreement);
    id v6 = v10;
    uint64_t v13 = &v31;
    id v31 = v10;
    id v11 = &v30;
    char v30 = 1;
    uint64_t v12 = type metadata accessor for MCLECv3Encryption.ECV3EncryptedDataContainer.Params.KeyAgreement();
    sub_229129898();
    uint64_t v7 = v28;
    sub_22912BB08();
    uint64_t v14 = v7;
    uint64_t v15 = v7;
    if (v7) {
      v9[0] = v15;
    }

    return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v22, v27);
  }
}

uint64_t sub_22912829C()
{
  return (*(uint64_t (**)(void))((**v0 & *MEMORY[0x263F8EED0]) + 0x68))();
}

id sub_22912832C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v58 = a1;
  uint64_t v53 = a2;
  uint64_t v52 = a3;
  uint64_t v4 = v3;
  uint64_t v48 = v4;
  id v66 = 0;
  uint64_t v65 = 0;
  uint64_t v64 = 0;
  uint64_t v63 = 0;
  uint64_t v57 = 0;
  uint64_t v54 = sub_22912B698();
  unint64_t v50 = *(void **)(v54 - 8);
  uint64_t v51 = v54 - 8;
  unint64_t v30 = (v50[8] + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v7 = MEMORY[0x270FA5388](v48, v53, v52, v6);
  uint64_t v46 = (uint64_t)&v30 - v30;
  unint64_t v31 = (v8 + 15) & 0xFFFFFFFFFFFFFFF0;
  id v11 = (void *)MEMORY[0x270FA5388](v7, v9, v10, (char *)&v30 - v30);
  uint64_t v47 = (uint64_t)&v30 - v31;
  uint64_t v65 = a1;
  uint64_t v64 = v12;
  uint64_t v63 = v13;
  id v14 = v11;
  uint64_t v15 = v48;
  id v66 = v48;
  uint64_t v32 = sub_22912B598();
  unint64_t v33 = v16;
  sub_229118768();
  uint64_t v34 = sub_22912B3C8();
  uint64_t v35 = v17;
  sub_22910F1C0(v32, v33);
  objc_super v41 = v62;
  v62[0] = v34;
  v62[1] = v35;
  uint64_t v36 = sub_22912B5A8();
  unint64_t v37 = v18;
  sub_229118768();
  uint64_t v38 = sub_22912B3C8();
  uint64_t v39 = v19;
  sub_22910F1C0(v36, v37);
  id v40 = v61;
  v61[0] = v38;
  v61[1] = v39;
  sub_22912991C();
  uint64_t v42 = sub_22912B9C8();
  uint64_t v43 = v20;
  sub_229111280();
  sub_229111280();
  uint64_t v21 = v43;
  id v22 = v48;
  uint64_t v23 = (uint64_t *)&v48[OBJC_IVAR___MCLECv3EncryptedDataContainer_data];
  uint64_t *v23 = v42;
  v23[1] = v21;

  type metadata accessor for MCLECv3Encryption.ECV3EncryptedDataContainer.Params();
  uint64_t v45 = (void (*)(uint64_t, uint64_t, uint64_t))v50[2];
  id v44 = v50 + 2;
  v45(v47, v53, v54);
  v45(v46, v52, v54);
  id v24 = sub_2291275EC(v47, v46);
  id v25 = v48;
  *(void *)&v48[OBJC_IVAR___MCLECv3EncryptedDataContainer_params] = v24;

  id v49 = v66;
  uint64_t v26 = (objc_class *)type metadata accessor for MCLECv3Encryption.ECV3EncryptedDataContainer();
  v60.receiver = v49;
  v60.super_class = v26;
  id v59 = objc_msgSendSuper2(&v60, sel_init);
  id v27 = v59;
  id v66 = v59;
  objc_super v56 = (void (*)(uint64_t, uint64_t))v50[1];
  unint64_t v55 = v50 + 1;
  v56(v52, v54);
  v56(v53, v54);
  uint64_t v28 = sub_22912B5B8();
  (*(void (**)(uint64_t))(*(void *)(v28 - 8) + 8))(v58);

  return v59;
}

uint64_t sub_229128714()
{
  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_229128754(uint64_t a1)
{
  return sub_229123870(a1, *(void *)(v1 + 16));
}

uint64_t sub_22912875C()
{
  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_22912879C(void *a1)
{
  sub_229112844(a1, *(void *)(v1 + 16));
}

unint64_t sub_2291287A4()
{
  uint64_t v2 = qword_2682C3FC8;
  if (!qword_2682C3FC8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682C3FC8);
    return WitnessTable;
  }
  return v2;
}

uint64_t type metadata accessor for MCLECv3Encryption.ECV3EncryptedDataContainer.Params.KeyAgreement()
{
  return self;
}

id MCLECv3Encryption.ECV3EncryptedDataContainer.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t MCLECv3Encryption.ECV3EncryptedDataContainer.init()()
{
  if (!"JITAppKit.ECV3EncryptedDataContainer")
  {
    sub_22912BAD8();
    __break(1u);
  }
  uint64_t result = sub_22911B8E4((uint64_t)"JITAppKit.ECV3EncryptedDataContainer", 36, (unint64_t)"init()", 6, 2, (unint64_t)"JITAppKit/MCLECv3Encryption.swift", 33, 2, v1, 0x86uLL, 0xFuLL);
  __break(1u);
  return result;
}

BOOL sub_2291289A8(char a1, char a2)
{
  return ((a1 & 1) != 0) == (unint64_t)((a2 & 1) != 0);
}

uint64_t sub_229128A2C()
{
  return sub_22912BBE8();
}

uint64_t sub_229128AAC()
{
  swift_bridgeObjectRetain();
  sub_22912B818();
  swift_bridgeObjectRetain();
  char v3 = sub_22912B828();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v3)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
LABEL_6:
    swift_bridgeObjectRelease();
    return v4 & 1;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_22912B818();
  swift_bridgeObjectRetain();
  char v2 = sub_22912B828();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v2)
  {
    swift_bridgeObjectRelease();
    char v4 = 1;
    goto LABEL_6;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 2;
}

uint64_t sub_229128C4C()
{
  return 2;
}

uint64_t sub_229128C64()
{
  return sub_22912BA88();
}

uint64_t sub_229128CC0()
{
  return 0;
}

uint64_t sub_229128CE4()
{
  return sub_22912B818();
}

BOOL sub_229128D70(unsigned char *a1, unsigned char *a2)
{
  return sub_2291289A8(*a1 & 1, *a2 & 1);
}

uint64_t sub_229128D9C()
{
  return sub_229128C64();
}

uint64_t sub_229128DBC()
{
  return sub_229128A2C();
}

uint64_t sub_229128DDC()
{
  return sub_22912B748();
}

uint64_t sub_229128DF4()
{
  return sub_229128CE4();
}

uint64_t sub_229128E14@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_229128AAC();
  *a1 = result;
  return result;
}

uint64_t sub_229128E40()
{
  return sub_229128CC0();
}

uint64_t sub_229128E64@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_229128C4C();
  *a1 = result;
  return result;
}

uint64_t sub_229128E90()
{
  return sub_22912BC08();
}

uint64_t sub_229128EC0()
{
  return sub_22912BC18();
}

id MCLECv3Encryption.ECV3EncryptedDataContainer.__deallocating_deinit()
{
  char v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MCLECv3Encryption.ECV3EncryptedDataContainer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t MCLECv3Encryption.ECV3EncryptedDataContainer.encode(to:)(uint64_t a1)
{
  uint64_t v16 = a1;
  uint64_t v34 = 0;
  uint64_t v33 = 0;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2682C4020);
  uint64_t v17 = *(void *)(v27 - 8);
  uint64_t v18 = v27 - 8;
  unint64_t v19 = (*(void *)(v17 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  id v22 = (char *)v9 - v19;
  uint64_t v34 = (void *)MEMORY[0x270FA5388](v16, v2, v3, v4);
  uint64_t v33 = v1;
  uint64_t v20 = v34[3];
  uint64_t v21 = v34[4];
  __swift_project_boxed_opaque_existential_1(v34, v20);
  sub_229129A40();
  sub_22912BBF8();
  uint64_t v5 = v24;
  uint64_t v25 = *(void *)(v23 + OBJC_IVAR___MCLECv3EncryptedDataContainer_data);
  uint64_t v26 = *(void *)(v23 + OBJC_IVAR___MCLECv3EncryptedDataContainer_data + 8);
  swift_bridgeObjectRetain();
  char v32 = 0;
  sub_22912BAF8();
  uint64_t v28 = v5;
  uint64_t v29 = v5;
  if (v5)
  {
    v9[1] = v29;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v22, v27);
  }
  else
  {
    swift_bridgeObjectRelease();
    id v10 = *(id *)(v23 + OBJC_IVAR___MCLECv3EncryptedDataContainer_params);
    id v6 = v10;
    uint64_t v13 = &v31;
    id v31 = v10;
    id v11 = &v30;
    char v30 = 1;
    uint64_t v12 = type metadata accessor for MCLECv3Encryption.ECV3EncryptedDataContainer.Params();
    sub_229129AC0();
    uint64_t v7 = v28;
    sub_22912BB08();
    uint64_t v14 = v7;
    uint64_t v15 = v7;
    if (v7) {
      v9[0] = v15;
    }

    return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v22, v27);
  }
}

uint64_t sub_229129248()
{
  return (*(uint64_t (**)(void))((**v0 & *MEMORY[0x263F8EED0]) + 0x68))();
}

id MCLECv3Encryption.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id MCLECv3Encryption.init()()
{
  id v47 = 0;
  uint64_t v39 = 0;
  unint64_t v23 = (*(void *)(*(void *)(sub_22912B988() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0, v1, v2, v3);
  uint64_t v38 = (uint64_t)&v23 - v23;
  unint64_t v24 = (*(void *)(*(void *)(sub_22912B978() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v39, v4, v5, v6);
  unint64_t v37 = (char *)&v23 - v24;
  uint64_t v7 = sub_22912B4C8();
  unint64_t v25 = (*(void *)(*(void *)(v7 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v7, v8, v9, v10);
  uint64_t v36 = (char *)&v23 - v25;
  id v11 = v0;
  id v12 = v0;
  id v47 = v0;
  uint64_t v40 = OBJC_IVAR___MCLECv3Encryption_queue;
  unint64_t v29 = sub_229111CD8();
  uint64_t v27 = 17;
  uint64_t v13 = sub_22912BB58();
  id v31 = &v45;
  uint64_t v45 = v13;
  uint64_t v46 = v14;
  int v28 = 1;
  sub_22912B818();
  uint64_t v26 = v15;
  sub_22912BB48();
  swift_bridgeObjectRelease();
  uint64_t v42 = (objc_class *)type metadata accessor for MCLECv3Encryption();
  sub_229111D68();
  sub_22912B818();
  uint64_t v30 = v16;
  sub_22912BB48();
  swift_bridgeObjectRelease();
  uint64_t v33 = v45;
  uint64_t v32 = v46;
  swift_bridgeObjectRetain();
  sub_229111228();
  uint64_t v34 = sub_22912B808();
  uint64_t v35 = v17;
  sub_229111DA0();
  sub_229111DB8();
  sub_229111E50(v38);
  uint64_t v18 = sub_22912B9B8();
  unint64_t v19 = v41;
  *(void *)&v41[v40] = v18;

  uint64_t v20 = v41;
  *(void *)&v41[OBJC_IVAR___MCLECv3Encryption_symmetricKeyLength] = 32;

  v44.receiver = v47;
  v44.super_class = v42;
  id v43 = objc_msgSendSuper2(&v44, sel_init);
  id v21 = v43;
  id v47 = v43;

  return v43;
}

id MCLECv3Encryption.__deallocating_deinit()
{
  uint64_t v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MCLECv3Encryption();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_229129670()
{
  uint64_t v2 = qword_2682C5270;
  if (!qword_2682C5270)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682C5270);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_2291296F0()
{
  uint64_t v2 = qword_2682C5278;
  if (!qword_2682C5278)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682C5278);
    return WitnessTable;
  }
  return v2;
}

uint64_t type metadata accessor for MCLECv3Encryption.ECV3EncryptedDataContainer.Params()
{
  return self;
}

unint64_t sub_229129798()
{
  uint64_t v2 = qword_2682C5280;
  if (!qword_2682C5280)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682C5280);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_229129818()
{
  uint64_t v2 = qword_2682C5288;
  if (!qword_2682C5288)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682C5288);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_229129898()
{
  uint64_t v2 = qword_2682C4010;
  if (!qword_2682C4010)
  {
    type metadata accessor for MCLECv3Encryption.ECV3EncryptedDataContainer.Params.KeyAgreement();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682C4010);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22912991C()
{
  uint64_t v2 = qword_2682C4018;
  if (!qword_2682C4018)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682C4018);
    return WitnessTable;
  }
  return v2;
}

uint64_t type metadata accessor for MCLECv3Encryption.ECV3EncryptedDataContainer()
{
  return self;
}

unint64_t sub_2291299C0()
{
  uint64_t v2 = qword_2682C5290;
  if (!qword_2682C5290)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682C5290);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_229129A40()
{
  uint64_t v2 = qword_2682C5298[0];
  if (!qword_2682C5298[0])
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, qword_2682C5298);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_229129AC0()
{
  uint64_t v2 = qword_2682C4028;
  if (!qword_2682C4028)
  {
    type metadata accessor for MCLECv3Encryption.ECV3EncryptedDataContainer.Params();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682C4028);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_229129B44()
{
  return sub_229123668();
}

uint64_t getEnumTagSinglePayload for MCLECv3Encryption.ECv3EncryptionError(uint64_t a1, int a2)
{
  if (a2)
  {
    if (*(unsigned char *)(a1 + 17)) {
      int v3 = *(_DWORD *)a1;
    }
    else {
      int v3 = -1;
    }
  }
  else
  {
    int v3 = -1;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for MCLECv3Encryption.ECv3EncryptionError(uint64_t result, int a2, int a3)
{
  int v3 = (unsigned char *)(result + 17);
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)uint64_t result = (a2 - 1);
    *(unsigned char *)(result + 16) = 0;
    if (a3) {
      *int v3 = 1;
    }
  }
  else if (a3)
  {
    *int v3 = 0;
  }
  return result;
}

uint64_t sub_229129DD8(uint64_t a1)
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2682C3EE8);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 48))(a1, 2);
}

uint64_t sub_229129E3C(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2682C3EE8);
  return (*(uint64_t (**)(uint64_t, void, uint64_t))(*(void *)(v2 - 8) + 56))(a1, a2, 2);
}

ValueMetadata *type metadata accessor for MCLECv3Encryption.ECv3EncryptionError()
{
  return &type metadata for MCLECv3Encryption.ECv3EncryptionError;
}

uint64_t sub_229129EB8(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 <= 0xFE) {
      goto LABEL_15;
    }
    unsigned int v7 = ((a2 + 1) >> 8) + 1;
    int v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000) {
        int v2 = 4;
      }
      else {
        int v2 = 2;
      }
      int v8 = v2;
    }
    if (v8 == 1) {
      int v6 = a1[1];
    }
    else {
      int v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    }
    if (v6)
    {
      int v5 = (*a1 | ((v6 - 1) << 8)) + 254;
    }
    else
    {
LABEL_15:
      int v3 = *a1 - 2;
      if (v3 < 0) {
        int v3 = -1;
      }
      int v5 = v3;
    }
  }
  else
  {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *sub_22912A068(unsigned char *result, unsigned int a2, unsigned int a3)
{
  int v7 = 0;
  if (a3 > 0xFE)
  {
    unsigned int v5 = ((a3 + 1) >> 8) + 1;
    int v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000) {
        int v3 = 4;
      }
      else {
        int v3 = 2;
      }
      int v6 = v3;
    }
    int v7 = v6;
  }
  if (a2 > 0xFE)
  {
    unsigned int v4 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2) {
      *uint64_t result = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_22912A2AC(unsigned char *a1)
{
  return *a1 & 1;
}

unsigned char *sub_22912A2BC(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

void *type metadata accessor for MCLECv3Encryption.ECV3EncryptedDataContainer.Params.KeyAgreement.CodingKeys()
{
  return &unk_26DD57B38;
}

uint64_t sub_22912A2E0(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 <= 0xFE) {
      goto LABEL_15;
    }
    unsigned int v7 = ((a2 + 1) >> 8) + 1;
    int v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000) {
        int v2 = 4;
      }
      else {
        int v2 = 2;
      }
      int v8 = v2;
    }
    if (v8 == 1) {
      int v6 = a1[1];
    }
    else {
      int v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    }
    if (v6)
    {
      int v5 = (*a1 | ((v6 - 1) << 8)) + 254;
    }
    else
    {
LABEL_15:
      int v3 = *a1 - 2;
      if (v3 < 0) {
        int v3 = -1;
      }
      int v5 = v3;
    }
  }
  else
  {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *sub_22912A490(unsigned char *result, unsigned int a2, unsigned int a3)
{
  int v7 = 0;
  if (a3 > 0xFE)
  {
    unsigned int v5 = ((a3 + 1) >> 8) + 1;
    int v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000) {
        int v3 = 4;
      }
      else {
        int v3 = 2;
      }
      int v6 = v3;
    }
    int v7 = v6;
  }
  if (a2 > 0xFE)
  {
    unsigned int v4 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2) {
      *uint64_t result = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_22912A6D4(unsigned char *a1)
{
  return *a1 & 1;
}

unsigned char *sub_22912A6E4(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

void *type metadata accessor for MCLECv3Encryption.ECV3EncryptedDataContainer.Params.CodingKeys()
{
  return &unk_26DD57BC8;
}

uint64_t sub_22912A708(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 <= 0xFE) {
      goto LABEL_15;
    }
    unsigned int v7 = ((a2 + 1) >> 8) + 1;
    int v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000) {
        int v2 = 4;
      }
      else {
        int v2 = 2;
      }
      int v8 = v2;
    }
    if (v8 == 1) {
      int v6 = a1[1];
    }
    else {
      int v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    }
    if (v6)
    {
      int v5 = (*a1 | ((v6 - 1) << 8)) + 254;
    }
    else
    {
LABEL_15:
      int v3 = *a1 - 2;
      if (v3 < 0) {
        int v3 = -1;
      }
      int v5 = v3;
    }
  }
  else
  {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *sub_22912A8B8(unsigned char *result, unsigned int a2, unsigned int a3)
{
  int v7 = 0;
  if (a3 > 0xFE)
  {
    unsigned int v5 = ((a3 + 1) >> 8) + 1;
    int v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000) {
        int v3 = 4;
      }
      else {
        int v3 = 2;
      }
      int v6 = v3;
    }
    int v7 = v6;
  }
  if (a2 > 0xFE)
  {
    unsigned int v4 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2) {
      *uint64_t result = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_22912AAFC(unsigned char *a1)
{
  return *a1 & 1;
}

unsigned char *sub_22912AB0C(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

void *type metadata accessor for MCLECv3Encryption.ECV3EncryptedDataContainer.CodingKeys()
{
  return &unk_26DD57C58;
}

unint64_t sub_22912AB30()
{
  return sub_22911CDA8();
}

unint64_t sub_22912AB48()
{
  return sub_22911253C();
}

unint64_t sub_22912AB60()
{
  return sub_22912AB78();
}

unint64_t sub_22912AB78()
{
  uint64_t v2 = qword_2682C5BA0;
  if (!qword_2682C5BA0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682C5BA0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22912ABF8()
{
  return sub_22912AC10();
}

unint64_t sub_22912AC10()
{
  uint64_t v2 = qword_2682C5BA8[0];
  if (!qword_2682C5BA8[0])
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, qword_2682C5BA8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22912AC90()
{
  return sub_22912ACA8();
}

unint64_t sub_22912ACA8()
{
  uint64_t v2 = qword_2682C5C30[0];
  if (!qword_2682C5C30[0])
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, qword_2682C5C30);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22912AD28()
{
  return sub_22912AD40();
}

unint64_t sub_22912AD40()
{
  uint64_t v2 = qword_2682C5CC0;
  if (!qword_2682C5CC0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682C5CC0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22912ADC0()
{
  return sub_22912ADD8();
}

unint64_t sub_22912ADD8()
{
  uint64_t v2 = qword_2682C5CC8[0];
  if (!qword_2682C5CC8[0])
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, qword_2682C5CC8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22912AE58()
{
  return sub_22912AE70();
}

unint64_t sub_22912AE70()
{
  uint64_t v2 = qword_2682C5D50[0];
  if (!qword_2682C5D50[0])
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, qword_2682C5D50);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22912AEF0()
{
  return sub_22912AF08();
}

unint64_t sub_22912AF08()
{
  uint64_t v2 = qword_2682C5DE0;
  if (!qword_2682C5DE0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2682C5DE0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22912AF88()
{
  return sub_22912AFA0();
}

unint64_t sub_22912AFA0()
{
  uint64_t v2 = qword_2682C5DE8[0];
  if (!qword_2682C5DE8[0])
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, qword_2682C5DE8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22912B020()
{
  return sub_22912B038();
}

unint64_t sub_22912B038()
{
  uint64_t v2 = qword_2682C5E70[0];
  if (!qword_2682C5E70[0])
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, qword_2682C5E70);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_22912B0B8()
{
  return sub_22911D1EC();
}

unint64_t sub_22912B0D0()
{
  return sub_22911D288();
}

uint64_t sub_22912B0E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_22911D40C(a1, a2, *(void *)(v3 + 16), *(void *)(v3 + 24), *(unsigned char *)(v3 + 32), *(void *)(v3 + 40), *(void *)(v3 + 48), *(void *)(v3 + 56), a3, *(void *)(v3 + 64));
}

uint64_t sub_22912B12C(uint64_t a1, uint64_t a2)
{
  return sub_22911B560(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

uint64_t sub_22912B158(uint64_t a1, uint64_t a2)
{
  return sub_22911D7E4(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48), *(void *)(v2 + 56));
}

uint64_t sub_22912B174(uint64_t a1, uint64_t a2)
{
  return sub_22911B560(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

uint64_t sub_22912B1A0()
{
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_22912B1E8()
{
  return sub_229124450(*(void (**)(uint64_t))(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t block_copy_helper_59(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_60()
{
  return swift_release();
}

uint64_t sub_22912B25C()
{
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_22912B2A4()
{
  return sub_229124100(*(void (**)(uint64_t))(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t block_copy_helper_65(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_66()
{
  return swift_release();
}

uint64_t sub_22912B318()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_22912B328()
{
  return MEMORY[0x270EEDF10]();
}

uint64_t sub_22912B338()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_22912B348()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_22912B358()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_22912B368()
{
  return MEMORY[0x270EEE940]();
}

uint64_t sub_22912B378()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_22912B388()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_22912B398()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_22912B3A8()
{
  return MEMORY[0x270EF0060]();
}

uint64_t sub_22912B3B8()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_22912B3C8()
{
  return MEMORY[0x270EF0130]();
}

uint64_t sub_22912B3D8()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_22912B3E8()
{
  return MEMORY[0x270EF01B0]();
}

uint64_t sub_22912B3F8()
{
  return MEMORY[0x270EF01D8]();
}

uint64_t sub_22912B408()
{
  return MEMORY[0x270EF01E0]();
}

uint64_t sub_22912B418()
{
  return MEMORY[0x270EF0258]();
}

uint64_t sub_22912B428()
{
  return MEMORY[0x270EF0280]();
}

uint64_t sub_22912B438()
{
  return MEMORY[0x270EF0288]();
}

uint64_t sub_22912B448()
{
  return MEMORY[0x270EF0290]();
}

uint64_t sub_22912B458()
{
  return MEMORY[0x270FA1128]();
}

uint64_t sub_22912B468()
{
  return MEMORY[0x270FA1138]();
}

uint64_t sub_22912B478()
{
  return MEMORY[0x270FA06B8]();
}

uint64_t sub_22912B488()
{
  return MEMORY[0x270FA06C8]();
}

uint64_t sub_22912B498()
{
  return MEMORY[0x270FA06D8]();
}

uint64_t sub_22912B4A8()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_22912B4B8()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_22912B4C8()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_22912B4D8()
{
  return MEMORY[0x270EEAA88]();
}

uint64_t sub_22912B4E8()
{
  return MEMORY[0x270EEAAA0]();
}

uint64_t sub_22912B4F8()
{
  return MEMORY[0x270EEAAA8]();
}

uint64_t sub_22912B508()
{
  return MEMORY[0x270EEAAD0]();
}

uint64_t sub_22912B518()
{
  return MEMORY[0x270EEAAE0]();
}

uint64_t sub_22912B528()
{
  return MEMORY[0x270EEAAE8]();
}

uint64_t sub_22912B538()
{
  return MEMORY[0x270EEAAF0]();
}

uint64_t sub_22912B548()
{
  return MEMORY[0x270EEAB00]();
}

uint64_t sub_22912B558()
{
  return MEMORY[0x270EEAB30]();
}

uint64_t sub_22912B568()
{
  return MEMORY[0x270EEAC60]();
}

uint64_t sub_22912B578()
{
  return MEMORY[0x270EEAC70]();
}

uint64_t sub_22912B588()
{
  return MEMORY[0x270EEAC88]();
}

uint64_t sub_22912B598()
{
  return MEMORY[0x270EEAC98]();
}

uint64_t sub_22912B5A8()
{
  return MEMORY[0x270EEACA0]();
}

uint64_t sub_22912B5B8()
{
  return MEMORY[0x270EEACD8]();
}

uint64_t sub_22912B5C8()
{
  return MEMORY[0x270EEAD98]();
}

uint64_t sub_22912B5D8()
{
  return MEMORY[0x270EEADA0]();
}

uint64_t sub_22912B5E8()
{
  return MEMORY[0x270EEADB0]();
}

uint64_t sub_22912B5F8()
{
  return MEMORY[0x270EEADB8]();
}

uint64_t sub_22912B608()
{
  return MEMORY[0x270EEADC0]();
}

uint64_t sub_22912B618()
{
  return MEMORY[0x270EEADE0]();
}

uint64_t sub_22912B628()
{
  return MEMORY[0x270EEADF8]();
}

uint64_t sub_22912B638()
{
  return MEMORY[0x270EEAE00]();
}

uint64_t sub_22912B648()
{
  return MEMORY[0x270EEAE20]();
}

uint64_t sub_22912B658()
{
  return MEMORY[0x270EEAE78]();
}

uint64_t sub_22912B668()
{
  return MEMORY[0x270EEAE80]();
}

uint64_t sub_22912B678()
{
  return MEMORY[0x270EEAE90]();
}

uint64_t sub_22912B688()
{
  return MEMORY[0x270EEAEB0]();
}

uint64_t sub_22912B698()
{
  return MEMORY[0x270EEAED8]();
}

uint64_t sub_22912B6A8()
{
  return MEMORY[0x270EEAEE8]();
}

uint64_t sub_22912B6B8()
{
  return MEMORY[0x270EEAEF0]();
}

uint64_t sub_22912B6C8()
{
  return MEMORY[0x270EEAEF8]();
}

uint64_t sub_22912B6D8()
{
  return MEMORY[0x270EEAF48]();
}

uint64_t sub_22912B6E8()
{
  return MEMORY[0x270EEAF50]();
}

uint64_t sub_22912B6F8()
{
  return MEMORY[0x270EEB090]();
}

uint64_t sub_22912B708()
{
  return MEMORY[0x270FA1408]();
}

uint64_t sub_22912B718()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_22912B728()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_22912B738()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_22912B748()
{
  return MEMORY[0x270F9D330]();
}

uint64_t sub_22912B758()
{
  return MEMORY[0x270F9D440]();
}

uint64_t sub_22912B768()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_22912B778()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_22912B788()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_22912B798()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_22912B7A8()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_22912B7B8()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_22912B7C8()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_22912B7D8()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_22912B7E8()
{
  return MEMORY[0x270F9D608]();
}

uint64_t sub_22912B7F8()
{
  return MEMORY[0x270F9D628]();
}

uint64_t sub_22912B808()
{
  return MEMORY[0x270F9D6C0]();
}

uint64_t sub_22912B818()
{
  return MEMORY[0x270F9D6D8]();
}

uint64_t sub_22912B828()
{
  return MEMORY[0x270F9D6E8]();
}

uint64_t sub_22912B838()
{
  return MEMORY[0x270F9D730]();
}

uint64_t sub_22912B848()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_22912B858()
{
  return MEMORY[0x270F9D760]();
}

uint64_t sub_22912B868()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_22912B878()
{
  return MEMORY[0x270F9D828]();
}

uint64_t sub_22912B888()
{
  return MEMORY[0x270F9D8D0]();
}

uint64_t sub_22912B898()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_22912B8A8()
{
  return MEMORY[0x270F9DA30]();
}

uint64_t sub_22912B8B8()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_22912B8C8()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_22912B8D8()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_22912B8E8()
{
  return MEMORY[0x270FA1468]();
}

uint64_t sub_22912B8F8()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_22912B908()
{
  return MEMORY[0x270F9DD08]();
}

uint64_t sub_22912B918()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_22912B928()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_22912B938()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_22912B948()
{
  return MEMORY[0x270F9E168]();
}

uint64_t sub_22912B958()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_22912B968()
{
  return MEMORY[0x270F9E290]();
}

uint64_t sub_22912B978()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_22912B988()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_22912B998()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_22912B9A8()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_22912B9B8()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_22912B9C8()
{
  return MEMORY[0x270EF25B8]();
}

uint64_t sub_22912B9D8()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_22912B9E8()
{
  return MEMORY[0x270F9E7A0]();
}

uint64_t sub_22912B9F8()
{
  return MEMORY[0x270F9E7A8]();
}

uint64_t sub_22912BA08()
{
  return MEMORY[0x270F9E7B0]();
}

uint64_t sub_22912BA18()
{
  return MEMORY[0x270F9E7B8]();
}

uint64_t sub_22912BA28()
{
  return MEMORY[0x270F9E7C0]();
}

uint64_t sub_22912BA38()
{
  return MEMORY[0x270F9E7C8]();
}

uint64_t sub_22912BA48()
{
  return MEMORY[0x270F9E7D0]();
}

uint64_t sub_22912BA58()
{
  return MEMORY[0x270F9E7D8]();
}

uint64_t sub_22912BA68()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_22912BA78()
{
  return MEMORY[0x270F9E890]();
}

uint64_t sub_22912BA88()
{
  return MEMORY[0x270F9E898]();
}

uint64_t sub_22912BA98()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_22912BAA8()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_22912BAB8()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_22912BAC8()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_22912BAD8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_22912BAE8()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_22912BAF8()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_22912BB08()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_22912BB18()
{
  return MEMORY[0x270F9F770]();
}

uint64_t sub_22912BB28()
{
  return MEMORY[0x270F9F778]();
}

uint64_t sub_22912BB38()
{
  return MEMORY[0x270F9F780]();
}

uint64_t sub_22912BB48()
{
  return MEMORY[0x270F9F788]();
}

uint64_t sub_22912BB58()
{
  return MEMORY[0x270F9F790]();
}

uint64_t sub_22912BB68()
{
  return MEMORY[0x270F9F7B8]();
}

uint64_t sub_22912BB78()
{
  return MEMORY[0x270F9F940]();
}

uint64_t sub_22912BB88()
{
  return MEMORY[0x270F9FAC0]();
}

uint64_t sub_22912BB98()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_22912BBA8()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_22912BBB8()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_22912BBC8()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_22912BBD8()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_22912BBE8()
{
  return MEMORY[0x270F9FC58]();
}

uint64_t sub_22912BBF8()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_22912BC08()
{
  return MEMORY[0x270FA00B0]();
}

uint64_t sub_22912BC18()
{
  return MEMORY[0x270FA00B8]();
}

uint64_t sub_22912BC28()
{
  return MEMORY[0x270FA00C8]();
}

uint64_t sub_22912BC38()
{
  return MEMORY[0x270FA00D0]();
}

uint64_t sub_22912BC48()
{
  return MEMORY[0x270FA00D8]();
}

uint64_t sub_22912BC58()
{
  return MEMORY[0x270FA00E0]();
}

uint64_t sub_22912BC68()
{
  return MEMORY[0x270FA00E8]();
}

uint64_t sub_22912BC78()
{
  return MEMORY[0x270FA00F0]();
}

uint64_t sub_22912BC88()
{
  return MEMORY[0x270FA00F8]();
}

uint64_t sub_22912BC98()
{
  return MEMORY[0x270FA0100]();
}

uint64_t sub_22912BCA8()
{
  return MEMORY[0x270FA0108]();
}

uint64_t sub_22912BCB8()
{
  return MEMORY[0x270FA0110]();
}

uint64_t sub_22912BCC8()
{
  return MEMORY[0x270FA0118]();
}

uint64_t sub_22912BCD8()
{
  return MEMORY[0x270FA0128]();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B28](data, *(void *)&len, md);
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x270EE42A8]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

void CFRelease(CFTypeRef cf)
{
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE59F8](context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
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

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x270EE6780](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

void CGImageRelease(CGImageRef image)
{
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

void NSLog(NSString *format, ...)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x270EF2BD8](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

OSStatus SecCertificateCopyCommonName(SecCertificateRef certificate, CFStringRef *commonName)
{
  return MEMORY[0x270EFD6E8](certificate, commonName);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x270EFD7E0](allocator, data);
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EFD9B0](key, error);
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x270EFDA60](keyData, attributes, error);
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return MEMORY[0x270EFDAC8](key, algorithm, signedData, signature, error);
}

SecPolicyRef SecPolicyCreateBasicX509(void)
{
  return (SecPolicyRef)MEMORY[0x270EFDB48]();
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x270EFDCA0](task, error);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x270EFDCD0](allocator);
}

SecKeyRef SecTrustCopyKey(SecTrustRef trust)
{
  return (SecKeyRef)MEMORY[0x270EFDD28](trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x270EFDD40](certificates, policies, trust);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x270EFDD60](trust, error);
}

BOOL UIAccessibilityIsSwitchControlRunning(void)
{
  return MEMORY[0x270F82C70]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x270F82C80]();
}

void UIGraphicsBeginImageContext(CGSize size)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F82D70]();
}

void UIRectClip(CGRect rect)
{
}

CFStringRef UTTypeCopyPreferredTagWithClass(CFStringRef inUTI, CFStringRef inTagClass)
{
  return (CFStringRef)MEMORY[0x270EE8570](inUTI, inTagClass);
}

CFStringRef UTTypeCreatePreferredIdentifierForTag(CFStringRef inTagClass, CFStringRef inTag, CFStringRef inConformingToUTI)
{
  return (CFStringRef)MEMORY[0x270EE8580](inTagClass, inTag, inConformingToUTI);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

uint64_t __memset_chk()
{
  return MEMORY[0x270ED7E48]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializerInFile()
{
  return MEMORY[0x270FA0168]();
}

void bzero(void *a1, size_t a2)
{
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return MEMORY[0x270F98F68](stream);
}

compression_status compression_stream_init(compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return MEMORY[0x270F98F78](stream, *(void *)&operation, *(void *)&algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return MEMORY[0x270F98F80](stream, *(void *)&flags);
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return MEMORY[0x270F9C690](crc, buf, *(void *)&len);
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x270F9C698](strm, *(void *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x270F9C6A8](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x270F9C6B0](strm, *(void *)&level, *(void *)&method, *(void *)&windowBits, *(void *)&memLevel, *(void *)&strategy, version, *(void *)&stream_size);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

int feof(FILE *a1)
{
  return MEMORY[0x270ED9910](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x270ED9918](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9A28](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x270ED9AC0](a1, a2, *(void *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x270ED9B18](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

const z_crc_t *get_crc_table(void)
{
  return (const z_crc_t *)MEMORY[0x270F9C6C8]();
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x270F9C730](strm, *(void *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x270F9C738](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x270F9C740](strm, *(void *)&windowBits, version, *(void *)&stream_size);
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

time_t mktime(tm *a1)
{
  return MEMORY[0x270EDA588](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

int rand(void)
{
  return MEMORY[0x270EDB0D8]();
}

void srand(unsigned int a1)
{
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

char *__cdecl strptime_l(const char *a1, const char *a2, tm *a3, locale_t a4)
{
  return (char *)MEMORY[0x270EDB678](a1, a2, a3, a4);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB708](__str, __endptr, *(void *)&__base);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x270FA0238]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

int symlink(const char *a1, const char *a2)
{
  return MEMORY[0x270EDB770](a1, a2);
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}