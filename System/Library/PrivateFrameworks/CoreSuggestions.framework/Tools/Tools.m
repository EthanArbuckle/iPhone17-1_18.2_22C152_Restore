uint64_t sub_100002A58(int a1, FILE *a2)
{
  return ferror(a2);
}

uint64_t sub_100002A60(int a1, FILE *a2)
{
  return fclose(a2);
}

size_t sub_100002A68(int a1, FILE *__stream, void *__ptr, size_t __nitems)
{
  return fwrite(__ptr, 1uLL, __nitems, __stream);
}

size_t sub_100002A80(int a1, FILE *__stream, void *__ptr, size_t __nitems)
{
  return fread(__ptr, 1uLL, __nitems, __stream);
}

uint64_t sub_100002A98(int a1, FILE *__stream, off_t a3, unsigned int __whence)
{
  if (__whence > 2) {
    return -1;
  }
  if (fseeko(__stream, a3, __whence)) {
    return -1;
  }
  return 0;
}

off_t sub_100002AD8(int a1, FILE *__stream)
{
  return ftello(__stream);
}

FILE *sub_100002AE0(int a1, char *__filename, char a3)
{
  int v3 = a3 & 3;
  v4 = "r+b";
  v5 = "wb";
  if ((a3 & 8) == 0) {
    v5 = 0;
  }
  if ((a3 & 4) != 0) {
    LOBYTE(v6) = 1;
  }
  else {
    int v6 = (a3 & 8) >> 3;
  }
  if ((a3 & 4) == 0) {
    v4 = v5;
  }
  if (v3 == 1) {
    char v7 = 1;
  }
  else {
    char v7 = v6;
  }
  if (v3 == 1) {
    v8 = "rb";
  }
  else {
    v8 = v4;
  }
  if (__filename && (v7 & 1) != 0) {
    return fopen(__filename, v8);
  }
  else {
    return 0;
  }
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

void *sub_100003410(char *a1, uint64_t a2, int a3)
{
  memset(__src, 0, sizeof(__src));
  unint64_t v79 = 0;
  if (a2)
  {
    long long v3 = *(_OWORD *)(a2 + 48);
    __src[2] = *(_OWORD *)(a2 + 32);
    __src[3] = v3;
    __src[4] = *(_OWORD *)(a2 + 64);
    *(void *)&__src[5] = *(void *)(a2 + 80);
    long long v4 = *(_OWORD *)(a2 + 16);
    __src[0] = *(_OWORD *)a2;
    __src[1] = v4;
    int v5 = *(FILE *(**)(int, char *, char))&__src[0];
  }
  else
  {
    int v5 = sub_100002AE0;
    *(void *)&__src[0] = sub_100002AE0;
    *((void *)&__src[0] + 1) = sub_100002A80;
    *(void *)&__src[1] = sub_100002A68;
    *((void *)&__src[1] + 1) = sub_100002AD8;
    *(void *)&__src[2] = sub_100002A98;
    *((void *)&__src[2] + 1) = sub_100002A60;
    *(void *)&__src[3] = sub_100002A58;
    *((void *)&__src[3] + 1) = 0;
  }
  DWORD2(__src[5]) = a3;
  if (!v5) {
    int v5 = *(FILE *(**)(int, char *, char))&__src[4];
  }
  uint64_t v6 = (uint64_t)v5(*((void *)&__src[3] + 1), a1, 5);
  *(void *)&__src[6] = v6;
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  uint64_t v81 = 0;
  uint64_t v82 = 0;
  uint64_t v80 = 0;
  v8 = *(uint64_t (**)(void, uint64_t, void, uint64_t))&__src[5];
  if (*(void *)&__src[2]) {
    v8 = *(uint64_t (**)(void, uint64_t, void, uint64_t))&__src[2];
  }
  if (!v8(*((void *)&__src[3] + 1), v6, 0, 2))
  {
    if (*(void *)&__src[2])
    {
      unint64_t v9 = (*((uint64_t (**)(void, uint64_t))&__src[1] + 1))(*((void *)&__src[3] + 1), v7);
    }
    else
    {
      uint64_t v10 = (*((uint64_t (**)(void, uint64_t))&__src[4] + 1))(*((void *)&__src[3] + 1), v7);
      unint64_t v9 = v10 == 0xFFFFFFFFLL ? -1 : v10;
    }
    unint64_t v11 = v9 >= 0xFFFF ? 0xFFFFLL : v9;
    v12 = malloc_type_malloc(0x404uLL, 0xE2C88504uLL);
    if (v12)
    {
      v13 = v12;
      if (v11 >= 5)
      {
        v14 = *(uint64_t (**)(void, uint64_t, unint64_t, void))&__src[5];
        if (*(void *)&__src[2]) {
          v14 = *(uint64_t (**)(void, uint64_t, unint64_t, void))&__src[2];
        }
        v77 = v14;
        unint64_t v15 = 4;
        do
        {
          unint64_t v16 = v15 + 1024;
          if (v15 + 1024 >= v11) {
            unint64_t v15 = v11;
          }
          else {
            v15 += 1024;
          }
          unint64_t v17 = v15 >= 0x404 ? 1028 : v15;
          if (v77(*((void *)&__src[3] + 1), v7, v9 - v15, 0)
            || (*((uint64_t (**)(void, uint64_t, unsigned char *, unint64_t))&__src[0] + 1))(*((void *)&__src[3] + 1), v7, v13, v17) != v17)
          {
            break;
          }
          if (v17 >= 4)
          {
            uint64_t v18 = (v17 - 4) + 1;
            while (1)
            {
              uint64_t v19 = v18 - 1;
              if (v13[v18 - 1] == 80 && v13[v18] == 75)
              {
                v20 = &v13[v18];
                if (v20[1] == 6 && v20[2] == 7) {
                  break;
                }
              }
              uint64_t v18 = v19;
              if (v19 <= 0) {
                goto LABEL_38;
              }
            }
            unint64_t v21 = v19 + v9 - v15;
            if (v21)
            {
              free(v13);
              if (v77(*((void *)&__src[3] + 1), v7, v21, 0)) {
                goto LABEL_76;
              }
              v85[0] = 0;
              if (sub_100003C6C((uint64_t)__src, v7, v85)) {
                goto LABEL_76;
              }
              if (sub_100003C6C((uint64_t)__src, v7, v85)) {
                goto LABEL_76;
              }
              if (v85[0]) {
                goto LABEL_76;
              }
              unint64_t v84 = 0;
              if (sub_100003D28((uint64_t)__src, v7, &v84)
                || sub_100003C6C((uint64_t)__src, v7, v85)
                || v85[0] != 1)
              {
                goto LABEL_76;
              }
              unint64_t v22 = v84;
              v23 = *(uint64_t (**)(void, uint64_t, unint64_t, void))&__src[5];
              if (*(void *)&__src[2]) {
                v23 = *(uint64_t (**)(void, uint64_t, unint64_t, void))&__src[2];
              }
              if (v23(*((void *)&__src[3] + 1), v7, v84, 0)
                || sub_100003C6C((uint64_t)__src, v7, v85)
                || v85[0] != 101075792)
              {
                goto LABEL_76;
              }
              uint64_t v24 = *(void *)&__src[6];
              v25 = *(uint64_t (**)(void, uint64_t, void, uint64_t))&__src[2];
              if (!v22) {
                goto LABEL_77;
              }
              HIDWORD(__src[20]) = 1;
              v26 = *(uint64_t (**)(void, void, unint64_t, void))&__src[5];
              if (*(void *)&__src[2]) {
                v26 = *(uint64_t (**)(void, void, unint64_t, void))&__src[2];
              }
              uint64_t v27 = v26(*((void *)&__src[3] + 1), *(void *)&__src[6], v22, 0);
              int v28 = sub_100003C6C((uint64_t)__src, v24, &v82);
              int v29 = sub_100003D28((uint64_t)__src, *(uint64_t *)&__src[6], &v84);
              int v30 = sub_100003E64((uint64_t)__src, *(uint64_t *)&__src[6], v85);
              int v31 = sub_100003E64((uint64_t)__src, *(uint64_t *)&__src[6], v85);
              int v32 = sub_100003C6C((uint64_t)__src, *(uint64_t *)&__src[6], &v81);
              int v33 = sub_100003C6C((uint64_t)__src, *(uint64_t *)&__src[6], &v80);
              int v34 = sub_100003D28((uint64_t)__src, *(uint64_t *)&__src[6], (unint64_t *)&__src[6] + 1);
              if (sub_100003D28((uint64_t)__src, *(uint64_t *)&__src[6], &v79) | v34 | v33 | v32 | v31 | v30 | v29 | v28) {
                BOOL v35 = 0;
              }
              else {
                BOOL v35 = v27 == 0;
              }
              int v36 = !v35;
              int v37 = v36 << 31 >> 31;
              if (v81) {
                BOOL v38 = 0;
              }
              else {
                BOOL v38 = v80 == 0;
              }
              if (v38 && v79 == *((void *)&__src[6] + 1)) {
                int v40 = v37;
              }
              else {
                int v40 = -103;
              }
              int v41 = sub_100003D28((uint64_t)__src, *(uint64_t *)&__src[6], (unint64_t *)&__src[10]);
              if (sub_100003D28((uint64_t)__src, *(uint64_t *)&__src[6], (unint64_t *)&__src[10] + 1) | v41)int v42 = -1; {
              else
              }
                int v42 = v40;
              *(void *)&__src[7] = 0;
              goto LABEL_134;
            }
          }
LABEL_38:
          ;
        }
        while (v11 > v16);
      }
      free(v13);
    }
  }
LABEL_76:
  uint64_t v24 = *(void *)&__src[6];
  v25 = *(uint64_t (**)(void, uint64_t, void, uint64_t))&__src[2];
LABEL_77:
  v43 = *(uint64_t (**)(void, uint64_t, void, uint64_t))&__src[5];
  uint64_t v44 = *((void *)&__src[3] + 1);
  if (v25) {
    v43 = v25;
  }
  if (!v43(*((void *)&__src[3] + 1), v24, 0, 2))
  {
    if (v25)
    {
      unint64_t v45 = (*((uint64_t (**)(uint64_t, uint64_t))&__src[1] + 1))(v44, v24);
    }
    else
    {
      uint64_t v46 = (*((uint64_t (**)(uint64_t, uint64_t))&__src[4] + 1))(v44, v24);
      unint64_t v45 = v46 == 0xFFFFFFFFLL ? -1 : v46;
    }
    unint64_t v47 = v45 >= 0xFFFF ? 0xFFFFLL : v45;
    v48 = malloc_type_malloc(0x404uLL, 0x332B2FE7uLL);
    if (v48)
    {
      v49 = v48;
      if (v47 >= 5)
      {
        v50 = *(uint64_t (**)(uint64_t, uint64_t, unint64_t, void))&__src[5];
        if (v25) {
          v50 = v25;
        }
        v76 = (uint64_t (*)(uint64_t, uint64_t, unsigned char *, unint64_t))*((void *)&__src[0] + 1);
        v78 = v50;
        unint64_t v51 = 4;
        do
        {
          unint64_t v52 = v51 + 1024;
          if (v51 + 1024 >= v47) {
            unint64_t v51 = v47;
          }
          else {
            v51 += 1024;
          }
          unint64_t v53 = v51 >= 0x404 ? 1028 : v51;
          if (v78(v44, v24, v45 - v51, 0) || v76(v44, v24, v49, v53) != v53) {
            break;
          }
          if (v53 >= 4)
          {
            uint64_t v54 = (v53 - 4) + 1;
            while (1)
            {
              uint64_t v55 = v54 - 1;
              if (v49[v54 - 1] == 80 && v49[v54] == 75)
              {
                v56 = &v49[v54];
                if (v56[1] == 5 && v56[2] == 6) {
                  break;
                }
              }
              uint64_t v54 = v55;
              if (v55 <= 0) {
                goto LABEL_108;
              }
            }
            unint64_t v22 = v55 + v45 - v51;
            if (v22)
            {
              free(v49);
              int v57 = 0;
              goto LABEL_114;
            }
          }
LABEL_108:
          ;
        }
        while (v47 > v52);
      }
      free(v49);
    }
  }
  unint64_t v22 = 0;
  int v57 = -1;
LABEL_114:
  HIDWORD(__src[20]) = 0;
  v58 = *(uint64_t (**)(uint64_t, uint64_t, unint64_t, void))&__src[5];
  if (v25) {
    v58 = v25;
  }
  uint64_t v59 = v58(v44, v24, v22, 0);
  int v60 = sub_100003C6C((uint64_t)__src, v24, &v82);
  int v61 = sub_100003E64((uint64_t)__src, *(uint64_t *)&__src[6], &v81);
  int v62 = sub_100003E64((uint64_t)__src, *(uint64_t *)&__src[6], &v80);
  int v63 = sub_100003E64((uint64_t)__src, *(uint64_t *)&__src[6], &v82);
  *((void *)&__src[6] + 1) = v82;
  int v64 = sub_100003E64((uint64_t)__src, *(uint64_t *)&__src[6], &v82) | v63 | v62 | v61 | v60;
  if (v59) {
    BOOL v65 = 0;
  }
  else {
    BOOL v65 = v64 == 0;
  }
  if (v65) {
    int v66 = v57;
  }
  else {
    int v66 = -1;
  }
  if (v81) {
    BOOL v67 = 0;
  }
  else {
    BOOL v67 = v80 == 0;
  }
  if (v67 && v82 == *((void *)&__src[6] + 1)) {
    int v69 = v66;
  }
  else {
    int v69 = -103;
  }
  int v70 = sub_100003C6C((uint64_t)__src, *(uint64_t *)&__src[6], &v82);
  *(void *)&__src[10] = v82;
  int v71 = sub_100003C6C((uint64_t)__src, *(uint64_t *)&__src[6], &v82);
  *((void *)&__src[10] + 1) = v82;
  if (sub_100003E64((uint64_t)__src, *(uint64_t *)&__src[6], (uint64_t *)&__src[7]) | v71 | v70) {
    int v42 = -1;
  }
  else {
    int v42 = v69;
  }
LABEL_134:
  if (v22 < *(void *)&__src[10] + *((void *)&__src[10] + 1) || v42)
  {
    (*((void (**)(void, void))&__src[2] + 1))(*((void *)&__src[3] + 1), *(void *)&__src[6]);
    return 0;
  }
  *((void *)&__src[7] + 1) = v22 - (*(void *)&__src[10] + *((void *)&__src[10] + 1));
  *((void *)&__src[9] + 1) = v22;
  *(void *)&__src[20] = 0;
  DWORD2(__src[20]) = 0;
  v72 = malloc_type_malloc(0x150uLL, 0x10A004033D922FDuLL);
  v73 = v72;
  if (v72)
  {
    memcpy(v72, __src, 0x150uLL);
    uint64_t v74 = v73[21];
    v73[16] = 0;
    v73[17] = v74;
    v73[18] = sub_100003EE0((uint64_t)v73, (uint64_t)(v73 + 22), v73 + 39, 0, 0, 0, 0, 0, 0) == 0;
  }
  return v73;
}

uint64_t sub_100003C6C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  int v11 = 0;
  if (sub_100004520(a1, a2, &v11)
    || (uint64_t v6 = v11, sub_100004520(a1, a2, &v11))
    || (uint64_t v7 = v11, sub_100004520(a1, a2, &v11)))
  {
    uint64_t v8 = 0;
    uint64_t result = 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t v10 = v6 | (v7 << 8) | ((uint64_t)v11 << 16);
    uint64_t result = sub_100004520(a1, a2, &v11);
    uint64_t v8 = v10 + ((uint64_t)v11 << 24);
    if (result) {
      uint64_t v8 = 0;
    }
  }
  *a3 = v8;
  return result;
}

uint64_t sub_100003D28(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  unsigned int v15 = 0;
  if (sub_100004520(a1, a2, &v15)
    || (uint64_t v6 = (int)v15, sub_100004520(a1, a2, &v15))
    || (uint64_t v7 = (int)v15, sub_100004520(a1, a2, &v15))
    || (uint64_t v8 = (int)v15, sub_100004520(a1, a2, &v15))
    || (uint64_t v9 = (int)v15, sub_100004520(a1, a2, &v15))
    || (uint64_t v10 = (int)v15, sub_100004520(a1, a2, &v15))
    || (uint64_t v11 = v15, sub_100004520(a1, a2, &v15)))
  {
    unint64_t v12 = 0;
    uint64_t result = 0xFFFFFFFFLL;
  }
  else
  {
    unint64_t v14 = v6 | (v7 << 8) | (v8 << 16) | (v9 << 24) | (v10 << 32) | (v11 << 40) | ((unint64_t)v15 << 48);
    uint64_t result = sub_100004520(a1, a2, &v15);
    unint64_t v12 = v14 | ((unint64_t)v15 << 56);
    if (result) {
      unint64_t v12 = 0;
    }
  }
  *a3 = v12;
  return result;
}

uint64_t sub_100003E64(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  int v9 = 0;
  if (sub_100004520(a1, a2, &v9))
  {
    uint64_t v6 = 0;
    uint64_t result = 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t v8 = v9;
    uint64_t result = sub_100004520(a1, a2, &v9);
    uint64_t v6 = v8 | ((uint64_t)v9 << 8);
    if (result) {
      uint64_t v6 = 0;
    }
  }
  *a3 = v6;
  return result;
}

uint64_t sub_100003EE0(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, unint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8, unint64_t a9)
{
  uint64_t v65 = 0;
  if (!a1) {
    return 4294967194;
  }
  uint64_t v10 = *(uint64_t (**)(void, void, void, void))(a1 + 32);
  if (!v10) {
    uint64_t v10 = *(uint64_t (**)(void, void, void, void))(a1 + 80);
  }
  if (v10(*(void *)(a1 + 56), *(void *)(a1 + 96), *(void *)(a1 + 120) + *(void *)(a1 + 136), 0)
    || sub_100003C6C(a1, *(void *)(a1 + 96), &v65))
  {
    int v11 = -1;
  }
  else if (v65 == 33639248)
  {
    int v11 = 0;
  }
  else
  {
    int v11 = -103;
  }
  unsigned int v57 = v11;
  uint64_t v75 = 0;
  long long v73 = 0u;
  int8x16_t v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  unint64_t v64 = 0;
  int v56 = sub_100003E64(a1, *(void *)(a1 + 96), (uint64_t *)&v67);
  int v55 = sub_100003E64(a1, *(void *)(a1 + 96), (uint64_t *)&v67 + 1);
  int v54 = sub_100003E64(a1, *(void *)(a1 + 96), (uint64_t *)&v68);
  int v53 = sub_100003E64(a1, *(void *)(a1 + 96), (uint64_t *)&v68 + 1);
  int v52 = sub_100003C6C(a1, *(void *)(a1 + 96), (uint64_t *)&v69);
  LODWORD(v75) = ((v69 >> 21) & 0xF) - 1;
  HIDWORD(v75) = (v69 >> 25) + 1980;
  v12.i32[0] = v69;
  int8x16_t v13 = (int8x16_t)vshlq_u32((uint32x4_t)vdupq_n_s32(v69), (uint32x4_t)xmmword_100044AD0);
  v13.i32[0] = vshlq_u32(v12, (uint32x4_t)xmmword_100044AC0).u32[0];
  int8x16_t v74 = vandq_s8(v13, (int8x16_t)xmmword_100044AE0);
  int v51 = sub_100003C6C(a1, *(void *)(a1 + 96), (uint64_t *)&v69 + 1);
  int v14 = sub_100003C6C(a1, *(void *)(a1 + 96), (uint64_t *)&v64);
  *(void *)&long long v70 = v64;
  int v15 = sub_100003C6C(a1, *(void *)(a1 + 96), (uint64_t *)&v64);
  *((void *)&v70 + 1) = v64;
  int v16 = sub_100003E64(a1, *(void *)(a1 + 96), (uint64_t *)&v71);
  int v17 = sub_100003E64(a1, *(void *)(a1 + 96), (uint64_t *)&v71 + 1);
  int v18 = sub_100003E64(a1, *(void *)(a1 + 96), (uint64_t *)&v72);
  int v19 = sub_100003E64(a1, *(void *)(a1 + 96), (uint64_t *)&v72 + 1);
  int v20 = sub_100003E64(a1, *(void *)(a1 + 96), (uint64_t *)&v73);
  int v21 = sub_100003C6C(a1, *(void *)(a1 + 96), (uint64_t *)&v73 + 1);
  if (sub_100003C6C(a1, *(void *)(a1 + 96), (uint64_t *)&v64) | v21 | v20 | v19 | v18 | v17 | v16 | v15 | v14 | v51 | v52 | v53 | v54 | v55 | v56) {
    uint64_t v22 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v22 = v57;
  }
  unint64_t v66 = v64;
  unint64_t v23 = v71;
  if (a4)
  {
    unint64_t v25 = a7;
    uint64_t v24 = a6;
    if (v22)
    {
      uint64_t v27 = a3;
    }
    else
    {
      unint64_t v26 = a5;
      if ((unint64_t)v71 < a5)
      {
        *(unsigned char *)(a4 + v71) = 0;
        unint64_t v26 = v23;
      }
      uint64_t v22 = 0;
      if (a5)
      {
        uint64_t v27 = a3;
        if (v23)
        {
          if ((*(uint64_t (**)(void, void))(a1 + 8))(*(void *)(a1 + 56), *(void *)(a1 + 96)) == v26) {
            uint64_t v22 = 0;
          }
          else {
            uint64_t v22 = 0xFFFFFFFFLL;
          }
        }
      }
      else
      {
        uint64_t v27 = a3;
      }
      v23 -= v26;
    }
  }
  else
  {
    uint64_t v27 = a3;
    unint64_t v25 = a7;
    uint64_t v24 = a6;
  }
  unint64_t v28 = *((void *)&v71 + 1);
  if (v24 && !v22)
  {
    if (*((void *)&v71 + 1) >= v25) {
      unint64_t v29 = v25;
    }
    else {
      unint64_t v29 = *((void *)&v71 + 1);
    }
    if (v23)
    {
      int v30 = *(uint64_t (**)(void, void, unint64_t, uint64_t))(a1 + 32);
      if (!v30) {
        int v30 = *(uint64_t (**)(void, void, unint64_t, uint64_t))(a1 + 80);
      }
      uint64_t v31 = v30(*(void *)(a1 + 56), *(void *)(a1 + 96), v23, 1);
      if (v31) {
        uint64_t v22 = 0xFFFFFFFFLL;
      }
      else {
        uint64_t v22 = 0;
      }
      if (!v31) {
        unint64_t v23 = 0;
      }
      if (!v25)
      {
LABEL_49:
        unint64_t v32 = v28 - v29 + v23;
        if (v22) {
          goto LABEL_89;
        }
        goto LABEL_50;
      }
    }
    else
    {
      uint64_t v22 = 0;
      if (!v25) {
        goto LABEL_49;
      }
    }
    if (v28)
    {
      if ((*(uint64_t (**)(void, void, uint64_t, unint64_t))(a1 + 8))(*(void *)(a1 + 56), *(void *)(a1 + 96), v24, v29) == v29)uint64_t v22 = v22; {
      else
      }
        uint64_t v22 = 0xFFFFFFFFLL;
    }
    goto LABEL_49;
  }
  unint64_t v32 = *((void *)&v71 + 1) + v23;
  if (v22) {
    goto LABEL_89;
  }
LABEL_50:
  if (v28)
  {
    if (v32 == v28)
    {
      LODWORD(v22) = 0;
      unint64_t v32 = 0;
    }
    else
    {
      int v33 = *(uint64_t (**)(void, void, unint64_t, uint64_t))(a1 + 32);
      if (!v33) {
        int v33 = *(uint64_t (**)(void, void, unint64_t, uint64_t))(a1 + 80);
      }
      uint64_t v34 = v33(*(void *)(a1 + 56), *(void *)(a1 + 96), v32 - v28, 1);
      if (v34) {
        LODWORD(v22) = -1;
      }
      else {
        LODWORD(v22) = 0;
      }
      if (v34) {
        v32 -= v28;
      }
      else {
        unint64_t v32 = 0;
      }
    }
    for (unint64_t i = 0; i < v28; i += v37 + 4)
    {
      uint64_t v62 = 0;
      uint64_t v63 = 0;
      int v36 = sub_100003E64(a1, *(void *)(a1 + 96), &v63);
      if (sub_100003E64(a1, *(void *)(a1 + 96), &v62) | v36) {
        uint64_t v22 = 0xFFFFFFFFLL;
      }
      else {
        uint64_t v22 = v22;
      }
      if (v63 == 1)
      {
        if (*((void *)&v70 + 1) == 0xFFFFFFFFLL)
        {
          if (sub_100003D28(a1, *(void *)(a1 + 96), (unint64_t *)&v70 + 1)) {
            uint64_t v22 = 0xFFFFFFFFLL;
          }
          else {
            uint64_t v22 = v22;
          }
        }
        if ((void)v70 == 0xFFFFFFFFLL)
        {
          if (sub_100003D28(a1, *(void *)(a1 + 96), (unint64_t *)&v70)) {
            uint64_t v22 = 0xFFFFFFFFLL;
          }
          else {
            uint64_t v22 = v22;
          }
        }
        if (v66 == 0xFFFFFFFF)
        {
          if (sub_100003D28(a1, *(void *)(a1 + 96), &v66)) {
            uint64_t v22 = 0xFFFFFFFFLL;
          }
          else {
            uint64_t v22 = v22;
          }
        }
        if (*((void *)&v72 + 1) == 0xFFFFFFFFLL)
        {
          if (sub_100003C6C(a1, *(void *)(a1 + 96), &v61)) {
            uint64_t v22 = 0xFFFFFFFFLL;
          }
          else {
            uint64_t v22 = v22;
          }
        }
        uint64_t v37 = v62;
        unint64_t v28 = *((void *)&v71 + 1);
      }
      else
      {
        BOOL v38 = *(uint64_t (**)(void, void, uint64_t, uint64_t))(a1 + 32);
        if (!v38) {
          BOOL v38 = *(uint64_t (**)(void, void, uint64_t, uint64_t))(a1 + 80);
        }
        uint64_t v37 = v62;
        if (v38(*(void *)(a1 + 56), *(void *)(a1 + 96), v62, 1)) {
          uint64_t v22 = 0xFFFFFFFFLL;
        }
        else {
          uint64_t v22 = v22;
        }
      }
    }
  }
LABEL_89:
  if (a8 && !v22)
  {
    unint64_t v39 = v72;
    unint64_t v40 = a9;
    if ((unint64_t)v72 < a9)
    {
      *(unsigned char *)(a8 + v72) = 0;
      unint64_t v40 = v39;
    }
    if (v32)
    {
      int v41 = *(uint64_t (**)(void, void, unint64_t, uint64_t))(a1 + 32);
      if (!v41) {
        int v41 = *(uint64_t (**)(void, void, unint64_t, uint64_t))(a1 + 80);
      }
      if (v41(*(void *)(a1 + 56), *(void *)(a1 + 96), v32, 1)) {
        uint64_t v22 = 0xFFFFFFFFLL;
      }
      else {
        uint64_t v22 = 0;
      }
      if (!a9) {
        goto LABEL_106;
      }
      goto LABEL_102;
    }
    uint64_t v22 = 0;
    if (a9)
    {
LABEL_102:
      if (v39)
      {
        if ((*(uint64_t (**)(void, void, uint64_t, unint64_t))(a1 + 8))(*(void *)(a1 + 56), *(void *)(a1 + 96), a8, v40) == v40)uint64_t v22 = v22; {
        else
        }
          uint64_t v22 = 0xFFFFFFFFLL;
      }
    }
  }
LABEL_106:
  if (a2 && !v22)
  {
    int8x16_t v42 = v74;
    *(_OWORD *)(a2 + 96) = v73;
    *(int8x16_t *)(a2 + 112) = v42;
    *(void *)(a2 + 128) = v75;
    long long v43 = v70;
    *(_OWORD *)(a2 + 32) = v69;
    *(_OWORD *)(a2 + 48) = v43;
    long long v44 = v72;
    *(_OWORD *)(a2 + 64) = v71;
    *(_OWORD *)(a2 + 80) = v44;
    long long v45 = v68;
    *(_OWORD *)a2 = v67;
    *(_OWORD *)(a2 + 16) = v45;
  }
  if (v27 && !v22) {
    *uint64_t v27 = v66;
  }
  return v22;
}

uint64_t sub_100004520(uint64_t a1, uint64_t a2, _DWORD *a3)
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

uint64_t unzClose(uint64_t a1)
{
  if (!a1) {
    return 4294967194;
  }
  if (*(void *)(a1 + 320)) {
    unzCloseCurrentFile(a1);
  }
  (*(void (**)(void, void))(a1 + 40))(*(void *)(a1 + 56), *(void *)(a1 + 96));
  free((void *)a1);
  return 0;
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

uint64_t unzGoToFirstFile(void *a1)
{
  if (!a1) {
    return 4294967194;
  }
  uint64_t v2 = a1[21];
  a1[16] = 0;
  a1[17] = v2;
  uint64_t result = sub_100003EE0((uint64_t)a1, (uint64_t)(a1 + 22), a1 + 39, 0, 0, 0, 0, 0, 0);
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
  uint64_t result = sub_100003EE0((uint64_t)a1, (uint64_t)(a1 + 22), a1 + 39, 0, 0, 0, 0, 0, 0);
  a1[18] = result == 0;
  return result;
}

uint64_t unzLocateFile(uint64_t a1, char *__s, int a3)
{
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
  uint64_t result = sub_100003EE0(a1, a1 + 176, (void *)(a1 + 312), 0, 0, 0, 0, 0, 0);
  for (*(void *)(a1 + 144) = result == 0; !result; uint64_t result = unzGoToNextFile((void *)a1))
  {
    char v21 = 0;
    memset(v20, 0, sizeof(v20));
    uint64_t result = sub_100003EE0(a1, 0, 0, (uint64_t)v20, 0x100uLL, 0, 0, 0, 0);
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
  uint64_t v10 = *(uint64_t (**)(void, void, void, void))(a1 + 32);
  if (!v10) {
    uint64_t v10 = *(uint64_t (**)(void, void, void, void))(a1 + 80);
  }
  if (v10(*(void *)(a1 + 56), *(void *)(a1 + 96), *(void *)(a1 + 120) + *(void *)(a1 + 312), 0)) {
    return 4294967193;
  }
  unint64_t v39 = 0;
  uint64_t v40 = 0;
  uint64_t v38 = 0;
  int v11 = sub_100003C6C(a1, *(void *)(a1 + 96), &v40);
  uint64_t v12 = v40;
  int v13 = sub_100003E64(a1, *(void *)(a1 + 96), (uint64_t *)&v39);
  int v14 = sub_100003E64(a1, *(void *)(a1 + 96), &v38);
  if (sub_100003E64(a1, *(void *)(a1 + 96), (uint64_t *)&v39))
  {
    int v15 = -1;
  }
  else
  {
    if (v12 == 67324752) {
      int v18 = 0;
    }
    else {
      int v18 = -103;
    }
    int v19 = v14 | v13 | v11;
    if (v19) {
      int v15 = -1;
    }
    else {
      int v15 = v18;
    }
    if (!v19 && v12 == 67324752)
    {
      if (v39 == *(void *)(a1 + 200) && v39 <= 0xC && ((1 << v39) & 0x1101) != 0) {
        int v15 = 0;
      }
      else {
        int v15 = -103;
      }
    }
  }
  int v16 = sub_100003C6C(a1, *(void *)(a1 + 96), (uint64_t *)&v39);
  if (sub_100003C6C(a1, *(void *)(a1 + 96), (uint64_t *)&v39))
  {
    int v17 = -1;
  }
  else
  {
    if (v16) {
      int v17 = -1;
    }
    else {
      int v17 = v15;
    }
    if (!v17)
    {
      if (v39 == *(void *)(a1 + 216))
      {
        int v17 = 0;
      }
      else if ((v38 & 8) != 0)
      {
        int v17 = 0;
      }
      else
      {
        int v17 = -103;
      }
    }
  }
  if (sub_100003C6C(a1, *(void *)(a1 + 96), (uint64_t *)&v39))
  {
    int v17 = -1;
  }
  else if (!v17 && v39 != 0xFFFFFFFF)
  {
    if (v39 == *(void *)(a1 + 224))
    {
      int v17 = 0;
    }
    else if ((v38 & 8) != 0)
    {
      int v17 = 0;
    }
    else
    {
      int v17 = -103;
    }
  }
  if (sub_100003C6C(a1, *(void *)(a1 + 96), (uint64_t *)&v39))
  {
    int v17 = -1;
  }
  else if (!v17 && v39 != 0xFFFFFFFF)
  {
    if (v39 == *(void *)(a1 + 232))
    {
      int v17 = 0;
    }
    else if ((v38 & 8) != 0)
    {
      int v17 = 0;
    }
    else
    {
      int v17 = -103;
    }
  }
  uint64_t v37 = 0;
  if (sub_100003E64(a1, *(void *)(a1 + 96), &v37))
  {
    int v17 = -1;
    uint64_t v20 = v37;
  }
  else
  {
    uint64_t v20 = v37;
    if (!v17)
    {
      if (v37 == *(void *)(a1 + 240)) {
        int v17 = 0;
      }
      else {
        int v17 = -103;
      }
    }
  }
  uint64_t v36 = 0;
  if (sub_100003E64(a1, *(void *)(a1 + 96), &v36) || v17) {
    return 4294967193;
  }
  uint64_t v22 = *(void *)(a1 + 312);
  int v23 = v36;
  uint64_t v24 = (char *)malloc_type_malloc(0x140uLL, 0x10B004067B04D0FuLL);
  if (!v24) {
    return 4294967192;
  }
  unint64_t v25 = v24;
  unint64_t v26 = malloc_type_malloc(0x4000uLL, 0xC0BC21B9uLL);
  *(void *)unint64_t v25 = v26;
  *((void *)v25 + 17) = v20 + v22 + 30;
  *((_DWORD *)v25 + 36) = v23;
  *((void *)v25 + 19) = 0;
  *((_DWORD *)v25 + 78) = a4;
  if (!v26)
  {
    free(v25);
    return 4294967192;
  }
  *((void *)v25 + 16) = 0;
  if (a2) {
    *a2 = *(void *)(a1 + 200);
  }
  if (!a3) {
    goto LABEL_77;
  }
  *a3 = 6;
  uint64_t v27 = *(void *)(a1 + 192) & 6;
  switch(v27)
  {
    case 2:
      int v28 = 9;
      break;
    case 6:
      int v28 = 1;
      break;
    case 4:
      int v28 = 2;
      break;
    default:
      goto LABEL_77;
  }
  *a3 = v28;
LABEL_77:
  uint64_t v29 = *(void *)(a1 + 216);
  *((void *)v25 + 21) = 0;
  *((void *)v25 + 22) = v29;
  *((void *)v25 + 20) = 0;
  *((void *)v25 + 37) = *(void *)(a1 + 200);
  *((void *)v25 + 36) = *(void *)(a1 + 96);
  long long v30 = *(_OWORD *)(a1 + 32);
  long long v31 = *(_OWORD *)(a1 + 48);
  long long v32 = *(_OWORD *)(a1 + 64);
  *((void *)v25 + 35) = *(void *)(a1 + 80);
  *(_OWORD *)(v25 + 264) = v32;
  *(_OWORD *)(v25 + 248) = v31;
  *(_OWORD *)(v25 + 232) = v30;
  long long v33 = *(_OWORD *)a1;
  *(_OWORD *)(v25 + 216) = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v25 + 200) = v33;
  *((void *)v25 + 38) = *(void *)(a1 + 120);
  *((void *)v25 + 6) = 0;
  uint64_t v34 = *(void *)(a1 + 200);
  if (a4 || v34 != 12)
  {
    if (!a4 && v34 == 8)
    {
      *((void *)v25 + 1) = 0;
      *((_DWORD *)v25 + 4) = 0;
      *((void *)v25 + 10) = 0;
      *((void *)v25 + 11) = 0;
      *((void *)v25 + 9) = 0;
      uint64_t v35 = inflateInit2_((z_streamp)(v25 + 8), -15, "1.2.12", 112);
      if (v35)
      {
        uint64_t v5 = v35;
        free(v25);
        return v5;
      }
      *((void *)v25 + 16) = 8;
    }
  }
  else
  {
    *((_DWORD *)v25 + 78) = 1;
  }
  uint64_t v5 = 0;
  *(_OWORD *)(v25 + 184) = *(_OWORD *)(a1 + 224);
  *((void *)v25 + 15) = *(void *)(a1 + 312) + (v23 + v20) + 30;
  *((_DWORD *)v25 + 4) = 0;
  *(void *)(a1 + 320) = v25;
  *(_DWORD *)(a1 + 328) = 0;
  return v5;
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
        int v11 = *(uint64_t (**)(void, void, void, void))(v3 + 232);
        if (!v11) {
          int v11 = *(uint64_t (**)(void, void, void, void))(v3 + 280);
        }
        if (v11(*(void *)(v3 + 256), *(void *)(v3 + 288), *(void *)(v3 + 304) + *(void *)(v3 + 120), 0)
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
    uint64_t v12 = *(void *)(v3 + 296);
    if (v12)
    {
      if (!*(_DWORD *)(v3 + 312)) {
        break;
      }
    }
    if (!v9 && !*(void *)(v3 + 184)) {
      return v8;
    }
    unsigned int v13 = *(_DWORD *)(v3 + 40);
    if (v13 >= v9) {
      uint64_t v9 = v9;
    }
    else {
      uint64_t v9 = v13;
    }
    if (v9)
    {
      for (uint64_t i = 0; i != v9; ++i)
        *(unsigned char *)(*(void *)(v3 + 32) + i) = *(unsigned char *)(*(void *)(v3 + 8) + i);
      uint64_t v15 = v9;
    }
    else
    {
      uint64_t v15 = 0;
    }
    uLong v16 = *(void *)(v3 + 168);
    *(void *)(v3 + 160) += v15;
    *(void *)(v3 + 168) = crc32(v16, *(const Bytef **)(v3 + 32), v9);
    *(void *)(v3 + 192) -= v15;
    *(_DWORD *)(v3 + 16) -= v9;
    *(_DWORD *)(v3 + 40) -= v9;
    *(void *)(v3 + 32) += v15;
    *(void *)(v3 + 8) += v15;
    uint64_t v8 = (v9 + v8);
    *(void *)(v3 + 48) += v15;
LABEL_37:
    if (!*(_DWORD *)(v3 + 40)) {
      return v8;
    }
  }
  if (v12 == 12) {
    goto LABEL_37;
  }
  uint64_t v17 = *(void *)(v3 + 48);
  int v18 = *(const Bytef **)(v3 + 32);
  uint64_t v19 = inflate((z_streamp)(v3 + 8), 2);
  uint64_t v20 = v19;
  if ((v19 & 0x80000000) == 0)
  {
    if (*(void *)(v3 + 56)) {
      uint64_t v20 = 4294967293;
    }
    else {
      uint64_t v20 = v19;
    }
  }
  uint64_t v21 = *(void *)(v3 + 48) - v17;
  uLong v22 = *(void *)(v3 + 168);
  *(void *)(v3 + 160) += v21;
  *(void *)(v3 + 168) = crc32(v22, v18, v21);
  *(void *)(v3 + 192) -= v21;
  uint64_t v8 = (v8 + v21);
  if (!v20) {
    goto LABEL_37;
  }
  uint64_t v23 = v8;
  uint64_t v8 = v20;
  if (v20 != 1) {
    return v8;
  }
  return v23;
}

intptr_t sub_1000055D4(uint64_t a1, uint64_t a2)
{
  if (a2) {
    fwrite("couldn't fetch asset catalog :(\n", 0x20uLL, 1uLL, __stderrp);
  }
  uint64_t v3 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v3);
}

intptr_t sub_10000562C(uint64_t a1, uint64_t a2)
{
  if (a2 && a2 != 10) {
    fwrite("couldn't fetch asset :(\n", 0x18uLL, 1uLL, __stderrp);
  }
  uint64_t v3 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v3);
}

void SGTBatchParseNames()
{
  v0 = (void *)__chkstk_darwin();
  uint64_t v2 = v1;
  id v3 = v0;
  id v4 = v2;
  id v38 = v3;
  unint64_t v5 = fopen((const char *)[v38 cStringUsingEncoding:4], "r");
  +[NSFileHandle fileHandleForWritingAtPath:v4];
  uint64_t v40 = v39 = v5;
  uint64_t v6 = &CFPreferencesCopyKeyList_ptr;
  while (!feof(v5))
  {
    bzero(v51, 0x1000uLL);
    uint64_t v7 = [v6[264] stringWithCapacity:256];
    LODWORD(v47) = 0;
    do
    {
      if (fscanf(v5, "%4095[^\n]%n%*c", v51, &v47) != 1) {
        break;
      }
      uint64_t v8 = +[NSString stringWithUTF8String:v51];
      if (!v8)
      {
        +[NSAssertionHandler currentHandler];
        uint64_t v9 = v45 = v7;
        unint64_t v10 = +[NSString stringWithUTF8String:"NSString *readLineAsNSString(FILE *)"];
        [v9 handleFailureInFunction:v10 file:@"suggest_tool_namehelper.m" lineNumber:31 description:@"failed to get line from buffer"];

        uint64_t v7 = v45;
      }
      [v7 appendString:v8];
    }
    while (v47 == 4095);
    if ([v7 length])
    {
      int v11 = +[SGIdentityName nameWithString:v7];
      uint64_t v46 = v7;
      id v12 = v7;
      unsigned int v13 = [v6[264] string];
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v43 = v12;
      v52[0] = v12;
      int v14 = [v11 fullName];
      v52[1] = v14;
      uint64_t v15 = [v11 prefix];
      int8x16_t v42 = (void *)v15;
      if (v15) {
        CFStringRef v16 = (const __CFString *)v15;
      }
      else {
        CFStringRef v16 = &stru_10005B0F8;
      }
      v52[2] = v16;
      uint64_t v17 = [v11 firstname];
      int v41 = (void *)v17;
      if (v17) {
        CFStringRef v18 = (const __CFString *)v17;
      }
      else {
        CFStringRef v18 = &stru_10005B0F8;
      }
      v52[3] = v18;
      uint64_t v19 = [v11 middlename];
      uint64_t v20 = (void *)v19;
      if (v19) {
        CFStringRef v21 = (const __CFString *)v19;
      }
      else {
        CFStringRef v21 = &stru_10005B0F8;
      }
      v52[4] = v21;
      uint64_t v22 = [v11 surname];
      uint64_t v23 = (void *)v22;
      if (v22) {
        CFStringRef v24 = (const __CFString *)v22;
      }
      else {
        CFStringRef v24 = &stru_10005B0F8;
      }
      v52[5] = v24;
      long long v44 = v11;
      uint64_t v25 = [v11 suffix];
      unint64_t v26 = (void *)v25;
      if (v25) {
        CFStringRef v27 = (const __CFString *)v25;
      }
      else {
        CFStringRef v27 = &stru_10005B0F8;
      }
      v52[6] = v27;
      int v28 = +[NSArray arrayWithObjects:v52 count:7];

      id v29 = [v28 countByEnumeratingWithState:&v47 objects:v51 count:16];
      if (v29)
      {
        id v30 = v29;
        uint64_t v31 = *(void *)v48;
        CFStringRef v32 = &stru_10005B0F8;
        do
        {
          for (uint64_t i = 0; i != v30; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v48 != v31) {
              objc_enumerationMutation(v28);
            }
            id v34 = [*(id *)(*((void *)&v47 + 1) + 8 * i) mutableCopy];
            objc_msgSend(v34, "replaceOccurrencesOfString:withString:options:range:", @"\"", @"\"\"", 2, 0, objc_msgSend(v34, "length"));
            if (([v34 containsString:@","] & 1) != 0
              || [v34 containsString:@"\""])
            {
              id v35 = [objc_alloc((Class)NSString) initWithFormat:@"\"%@\"", v34];
            }
            else
            {
              id v35 = v34;
            }
            uint64_t v36 = v35;

            [v13 appendFormat:@"%@%@", v32, v36];
            CFStringRef v32 = @",";
          }
          id v30 = [v28 countByEnumeratingWithState:&v47 objects:v51 count:16];
          CFStringRef v32 = @",";
        }
        while (v30);
      }

      [v13 appendString:@"\n"];
      uint64_t v37 = [v13 dataUsingEncoding:4];
      [v40 writeData:v37];

      unint64_t v5 = v39;
      uint64_t v6 = &CFPreferencesCopyKeyList_ptr;
      uint64_t v7 = v46;
    }
  }
  fclose(v5);
  [v40 closeFile];
}

id sub_100006034(void *a1)
{
  id v1 = a1;
  if (sub_1000060A8()) {
    id v2 = [objc_alloc((Class)NSString) initWithFormat:@"\x1B[1m%@\x1B[0m", v1];
  }
  else {
    id v2 = v1;
  }
  id v3 = v2;

  return v3;
}

BOOL sub_1000060A8()
{
  if (qword_10006A7E8 != -1) {
    dispatch_once(&qword_10006A7E8, &stru_10005AB88);
  }
  if (!byte_10006A7E0) {
    return 0;
  }
  int v0 = fileno(__stdoutp);
  return isatty(v0) == 1;
}

void sub_100006114(id a1)
{
  id v1 = getenv("TERM");
  if (v1) {
    BOOL v2 = *v1 != 0;
  }
  else {
    BOOL v2 = 0;
  }
  byte_10006A7E0 = v2;
}

void sub_100006720(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    id v4 = [objc_alloc((Class)NSString) initWithFormat:@"Contact suggestion %@ had confirmation error %@", *(void *)(a1 + 32), v3];

    id v5 = v4;
    puts((const char *)[v5 UTF8String]);
  }
  uint64_t v6 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v6);
}

void sub_1000067B4(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    id v4 = [objc_alloc((Class)NSString) initWithFormat:@"Event suggestion %@ had confirmation error %@", *(void *)(a1 + 32), v3];

    id v5 = v4;
    puts((const char *)[v5 UTF8String]);
  }
  uint64_t v6 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v6);
}

void sub_100006C40(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100006C74(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100006C84(uint64_t a1)
{
}

void sub_100006C8C(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  id v4 = [*(id *)(a1 + 32) attributeSetCoder];
  id v5 = self;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100006D14(id a1)
{
  uint64_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  qos_class_t v2 = qos_class_self();
  attr = dispatch_queue_attr_make_with_qos_class(v1, v2, 0);

  dispatch_queue_t v3 = dispatch_queue_create("com.apple.suggestions.addSearchableItems", attr);
  id v4 = (void *)qword_10006A7D8;
  qword_10006A7D8 = (uint64_t)v3;
}

void sub_100007A8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
}

id sub_100007AE0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 mutableCopy];
  id v5 = [v4 length];
  id v7 = objc_msgSend(v4, "rangeOfCharacterFromSet:options:range:", *(void *)(a1 + 32), 4, 0, v5);
  if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    for (id i = v7;
          i != (id)0x7FFFFFFFFFFFFFFFLL;
          id i = objc_msgSend(v4, "rangeOfCharacterFromSet:options:range:", *(void *)(a1 + 32), 4, 0, i))
    {
      objc_msgSend(v4, "replaceCharactersInRange:withString:", i, v8, @"_");
    }
  }
  unint64_t v10 = +[NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  int v11 = [v10 stringValue];
  [v4 appendString:v11];

  return v4;
}

BOOL sub_100007C10()
{
  int v0 = getenv("RFC822");
  BOOL result = 1;
  if (v0)
  {
    id v1 = [objc_alloc((Class)NSString) initWithCString:v0 encoding:4];
    qos_class_t v2 = [v1 lowercaseString];

    LOBYTE(v1) = [v2 isEqual:@"new"];
    if (v1) {
      return 0;
    }
  }
  return result;
}

void sub_100007C94(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v19 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1 + 56);
  int v11 = v8;
  if (!v8)
  {
    id v4 = +[NSUUID UUID];
    int v11 = [v4 UUIDString];
  }
  id v12 = (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
  if (!v8)
  {
  }
  unsigned int v13 = NSTemporaryDirectory();
  id v14 = objc_alloc((Class)NSString);
  uint64_t v15 = +[NSProcessInfo processInfo];
  CFStringRef v16 = [v15 globallyUniqueString];
  id v17 = [v14 initWithFormat:@"%@_%@", v16, v12];
  CFStringRef v18 = [v13 stringByAppendingPathComponent:v17];

  [v19 writeToFile:v18 atomically:1];
  [*(id *)(a1 + 32) addObject:v9];
  [*(id *)(a1 + 40) addObject:v12];
  [*(id *)(a1 + 48) addObject:v18];
}

void sub_10000B358(uint64_t a1)
{
  [*(id *)(a1 + 32) beSameUserAsSuggestd];
  id v1 = objc_alloc((Class)NSString);
  CFStringRef v2 = (const __CFString *)kSGSuggestionsSettingsSuiteIdentifier;
  id v3 = [v1 initWithFormat:@"Preferences for %@", kSGSuggestionsSettingsSuiteIdentifier];
  puts((const char *)[v3 UTF8String]);

  CFArrayRef v4 = CFPreferencesCopyKeyList(v2, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  if (v4)
  {
    CFArrayRef v5 = v4;
    CFDictionaryRef v7 = CFPreferencesCopyMultiple(v4, v2, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
    id v6 = [objc_alloc((Class)NSString) initWithFormat:@"%@", v7];
    puts((const char *)[v6 UTF8String]);

    CFRelease(v5);
  }
  else
  {
    CFDictionaryRef v7 = (CFDictionaryRef)[objc_alloc((Class)NSString) initWithFormat:@"Could not get keys."];
    puts((const char *)[(__CFDictionary *)v7 UTF8String]);
  }
}

void sub_10000B488(uint64_t a1, void *a2)
{
  id v3 = a2;
  CFArrayRef v4 = [v3 objectAtIndexedSubscript:0];
  CFArrayRef v5 = [v4 uppercaseString];

  id v6 = [v5 isEqualToString:@"YES"];
  if ((v6 & 1) == 0 && ([v5 isEqualToString:@"NO"] & 1) == 0)
  {
    id v9 = [objc_alloc((Class)NSString) initWithFormat:@"Argument must be either YES or NO"];
    puts((const char *)[v9 UTF8String]);

    abort();
  }
  [*(id *)(a1 + 32) beSameUserAsSuggestd];
  +[SGPreferenceStorage setSyncHistoryToCloud:v6];
  id v7 = [objc_alloc((Class)NSString) initWithFormat:@"Killing suggestd to allow update to take effect"];
  puts((const char *)[v7 UTF8String]);

  pid_t v10 = 0;
  *(_OWORD *)__argv = *(_OWORD *)off_100058D60;
  long long v12 = *(_OWORD *)&off_100058D70;
  posix_spawn(&v10, "/usr/bin/killall", 0, 0, __argv, 0);
  waitpid(v10, 0, 0);
  id v8 = [objc_alloc((Class)NSString) initWithFormat:@"Done!"];
  puts((const char *)[v8 UTF8String]);
}

void sub_10000B620(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) beSameUserAsSuggestd];
  if ([v3 count])
  {
    CFArrayRef v4 = [v3 objectAtIndexedSubscript:0];
    if ([v4 length])
    {
      CFArrayRef v5 = [v3 objectAtIndexedSubscript:0];
    }
    else
    {
      CFArrayRef v5 = 0;
    }
  }
  else
  {
    CFArrayRef v5 = 0;
  }
  if ((unint64_t)[v3 count] < 2)
  {
    id v8 = 0;
    int v11 = 0;
  }
  else
  {
    id v6 = objc_opt_new();
    [v6 setDateFormat:@"yyyy-MM-dd"];
    id v7 = [v3 objectAtIndexedSubscript:1];
    id v8 = [v6 dateFromString:v7];

    if ((unint64_t)[v3 count] < 3)
    {
      int v11 = 0;
    }
    else
    {
      id v9 = [v3 objectAtIndexedSubscript:2];
      pid_t v10 = [v6 dateFromString:v9];
      int v11 = [v10 dateByAddingTimeInterval:86400.0];
    }
  }
  long long v12 = +[SGSuggestionsService serviceForInternal];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100036DA8;
  v17[3] = &unk_100058D88;
  id v18 = v5;
  id v19 = v8;
  id v20 = v11;
  dispatch_semaphore_t v21 = dispatch_semaphore_create(0);
  unsigned int v13 = v21;
  id v14 = v11;
  id v15 = v8;
  id v16 = v5;
  [v12 spotlightReimportFromIdentifier:@"suggest_tool" forPersonHandle:v16 startDate:v15 endDate:v14 withCompletion:v17];
  dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
}

void sub_10000B870(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [v3 count] == (id)4 || objc_msgSend(v3, "count") == (id)5;
  sub_10001A9E0(v4, @"suggestionsFromMessage SUBJECT TO FROM BODY (optional DATE)");
  id v20 = [*(id *)(a1 + 32) messageFromArgs:v3];
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000;
  unint64_t v39 = sub_100006C74;
  uint64_t v40 = sub_100006C84;
  id v41 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  long long v33 = sub_100006C74;
  id v34 = sub_100006C84;
  id v35 = 0;
  dispatch_semaphore_t v21 = +[SGSuggestionsService serviceForMail];
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = [v20 createNewSearchableItem];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100036D0C;
  v26[3] = &unk_100058DB0;
  int v28 = &v30;
  id v29 = &v36;
  id v7 = v5;
  CFStringRef v27 = v7;
  [v21 suggestionsFromSearchableItem:v6 options:3 withCompletion:v26];

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  if (v37[5])
  {
    id v18 = objc_alloc((Class)NSString);
    id v19 = [v18 initWithFormat:@"Error! %@", v37[5]];
    puts((const char *)[v19 UTF8String]);

    _exit(1);
  }
  id v8 = objc_alloc((Class)NSString);
  id v9 = objc_msgSend(v8, "initWithFormat:", @"Found %d suggestions", objc_msgSend( (id) v31[5], "count"));
  puts((const char *)[v9 UTF8String]);

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = (id)v31[5];
  id v11 = [v10 countByEnumeratingWithState:&v22 objects:v42 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v23;
    do
    {
      unsigned int v13 = 0;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v10);
        }
        id v14 = *(void **)(*((void *)&v22 + 1) + 8 * (void)v13);
        id v15 = objc_alloc((Class)NSString);
        id v16 = [v14 description];
        id v17 = [v15 initWithFormat:@"\n%@\n", v16];
        puts((const char *)[v17 UTF8String]);

        unsigned int v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v10 countByEnumeratingWithState:&v22 objects:v42 count:16];
    }
    while (v11);
  }

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);
}

void sub_10000BBFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

void sub_10000BC38(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [v3 count] == (id)4 || objc_msgSend(v3, "count") == (id)5;
  sub_10001A9E0(v4, @"confirmSuggestionsFromMessage SUBJECT FROM TO BODY (optional DATE)");
  dispatch_semaphore_t v5 = +[SGSuggestionsService serviceForMail];
  id v6 = [*(id *)(a1 + 32) messageFromArgs:v3];
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_100006C74;
  id v19 = sub_100006C84;
  id v20 = 0;
  id v8 = [v6 createNewSearchableItemWithSource:@"suggest_tool" uniqueIdentifier:0 domainIdentifier:0];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100036CAC;
  v12[3] = &unk_100058DD8;
  id v14 = &v15;
  id v9 = v7;
  unsigned int v13 = v9;
  [v5 suggestionsFromSearchableItem:v8 options:3 withCompletion:v12];

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  id v10 = objc_alloc((Class)NSString);
  id v11 = objc_msgSend(v10, "initWithFormat:", @"Found %d suggestions", objc_msgSend( (id) v16[5], "count"));
  puts((const char *)[v11 UTF8String]);

  [*(id *)(a1 + 32) confirmSuggestions:v16[5]];
  _Block_object_dispose(&v15, 8);
}

void sub_10000BE38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000BE50(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_10001A9E0([v3 count] == (id)1, @"confirmSuggestionsFromRFC822 FILEPATH");
  [*(id *)(a1 + 32) beSameUserAsSuggestd];
  dispatch_semaphore_t v5 = [*(id *)(a1 + 32) searchableItemsFromArgs:v3];
  id v6 = [v5 firstObject];

  if (!v6)
  {
    uint64_t v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"suggest_tool.m", 1460, @"Invalid parameter not satisfying: %@", @"searchableItem" object file lineNumber description];
  }
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = sub_100006C74;
  uint64_t v32 = sub_100006C84;
  id v33 = 0;
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x3032000000;
  long long v25 = sub_100006C74;
  unint64_t v26 = sub_100006C84;
  id v27 = 0;
  dispatch_semaphore_t v7 = +[SGSuggestionsService serviceForMail];
  uint64_t v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  uint64_t v17 = sub_100036C10;
  id v18 = &unk_100058DB0;
  id v20 = &v22;
  dispatch_semaphore_t v21 = &v28;
  id v8 = dispatch_semaphore_create(0);
  id v19 = v8;
  [v7 suggestionsFromSearchableItem:v6 options:3 withCompletion:&v15];
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  if (v29[5])
  {
    id v13 = objc_alloc((Class)NSString);
    id v14 = [v13 initWithFormat:@"Error! %@", v29[5], v15, v16, v17, v18];
    puts((const char *)[v14 UTF8String]);

    exit(1);
  }
  id v9 = objc_alloc((Class)NSString);
  id v10 = [(id)v23[5] count];
  id v11 = objc_msgSend(v9, "initWithFormat:", @"Found %d suggestions", v10, v15, v16, v17, v18);
  puts((const char *)[v11 UTF8String]);

  [*(id *)(a1 + 32) confirmSuggestions:v23[5]];
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
}

void sub_10000C110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10000C138(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v19 = v3;
  char v4 = [v3 count] == (id)4 || objc_msgSend(v3, "count") == (id)5;
  sub_10001A9E0(v4, @"rejectSuggestionsFromMessage SUBJECT FROM TO BODY (optional DATE)");
  id v20 = +[SGSuggestionsService serviceForMail];
  id v18 = [*(id *)(a1 + 32) messageFromArgs:v3];
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  id v35 = sub_100006C74;
  uint64_t v36 = sub_100006C84;
  id v37 = 0;
  id v6 = [v18 createNewSearchableItemWithSource:@"suggest_tool" uniqueIdentifier:0 domainIdentifier:0];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100036A88;
  v29[3] = &unk_100058DD8;
  uint64_t v31 = &v32;
  dispatch_semaphore_t dsema = v5;
  dispatch_semaphore_t v30 = dsema;
  [v20 suggestionsFromSearchableItem:v6 options:3 withCompletion:v29];

  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  id v7 = objc_alloc((Class)NSString);
  id v8 = objc_msgSend(v7, "initWithFormat:", @"Found %d suggestions", objc_msgSend( (id) v33[5], "count"));
  puts((const char *)[v8 UTF8String]);

  id v9 = dispatch_group_create();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v10 = (id)v33[5];
  id v11 = [v10 countByEnumeratingWithState:&v25 objects:v38 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v26;
    do
    {
      for (id i = 0; i != v11; id i = (char *)i + 1)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        id v15 = [objc_alloc((Class)NSString) initWithFormat:@"\nRejecting %@\n", v14];
        puts((const char *)[v15 UTF8String]);

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          dispatch_group_enter(v9);
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472;
          v23[2] = sub_100036AE8;
          v23[3] = &unk_100058E20;
          v23[4] = v14;
          uint64_t v24 = v9;
          [v20 rejectContact:v14 rejectionUI:2 withCompletion:v23];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            dispatch_group_enter(v9);
            v21[0] = _NSConcreteStackBlock;
            v21[1] = 3221225472;
            v21[2] = sub_100036B7C;
            v21[3] = &unk_100058E20;
            v21[4] = v14;
            uint64_t v22 = v9;
            [v20 rejectEvent:v14 withCompletion:v21];
          }
          else
          {
            id v16 = [objc_alloc((Class)NSString) initWithFormat:@"Unknown suggestion type..."];
            puts((const char *)[v16 UTF8String]);
          }
        }
      }
      id v11 = [v10 countByEnumeratingWithState:&v25 objects:v38 count:16];
    }
    while (v11);
  }

  dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  _Block_object_dispose(&v32, 8);
}

void sub_10000C5A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

void sub_10000C5CC(uint64_t a1, void *a2)
{
  id v24 = a2;
  sub_10001A9E0([v24 count] == (id)1, @"rejectSuggestionsFromRFC822 FILEPATH");
  uint64_t v22 = +[SGSuggestionsService serviceForInternal];
  long long v25 = +[SGSuggestionsService serviceForMail];
  id v3 = [v24 objectAtIndexedSubscript:0];
  long long v23 = +[NSData dataWithContentsOfFile:v3];

  if (v23)
  {
    dispatch_semaphore_t v21 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    uint64_t v37 = 0;
    uint64_t v38 = &v37;
    uint64_t v39 = 0x3032000000;
    uint64_t v40 = sub_100006C74;
    id v41 = sub_100006C84;
    id v42 = 0;
    dispatch_semaphore_t v5 = [v21 first];
    id v6 = [v21 second];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100036794;
    v34[3] = &unk_100058DD8;
    uint64_t v36 = &v37;
    dispatch_semaphore_t dsema = v4;
    dispatch_semaphore_t v35 = dsema;
    [v22 suggestionsFromSimpleMailMessage:v5 headers:v6 options:3 withCompletion:v34];

    dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
    id v7 = objc_alloc((Class)NSString);
    id v8 = objc_msgSend(v7, "initWithFormat:", @"Found %d suggestions", objc_msgSend( (id) v38[5], "count"));
    puts((const char *)[v8 UTF8String]);

    id v9 = dispatch_group_create();
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v10 = (id)v38[5];
    id v11 = [v10 countByEnumeratingWithState:&v30 objects:v43 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v31;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v31 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void *)(*((void *)&v30 + 1) + 8 * (void)v13);
          id v15 = [objc_alloc((Class)NSString) initWithFormat:@"\nRejecting %@\n", v14];
          puts((const char *)[v15 UTF8String]);

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            dispatch_group_enter(v9);
            v28[0] = _NSConcreteStackBlock;
            v28[1] = 3221225472;
            v28[2] = sub_1000367F4;
            v28[3] = &unk_100058E20;
            v28[4] = v14;
            id v29 = v9;
            [v25 rejectContact:v14 withCompletion:v28];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              dispatch_group_enter(v9);
              v26[0] = _NSConcreteStackBlock;
              v26[1] = 3221225472;
              v26[2] = sub_100036888;
              v26[3] = &unk_100058E20;
              void v26[4] = v14;
              long long v27 = v9;
              [v25 rejectEvent:v14 withCompletion:v26];
            }
            else
            {
              id v16 = [objc_alloc((Class)NSString) initWithFormat:@"Unknown suggestion type..."];
              puts((const char *)[v16 UTF8String]);
            }
          }
          uint64_t v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v10 countByEnumeratingWithState:&v30 objects:v43 count:16];
      }
      while (v11);
    }

    dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    _Block_object_dispose(&v37, 8);
  }
  else
  {
    id v17 = objc_alloc((Class)NSString);
    id v18 = [v24 objectAtIndexedSubscript:0];
    id v19 = [v17 initWithFormat:@"ERROR: failed to read contentsOfFile:%@", v18];
    puts((const char *)[v19 UTF8String]);
  }
}

void sub_10000CAD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

void sub_10000CB00(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [v3 count] == (id)4 || objc_msgSend(v3, "count") == (id)5;
  sub_10001A9E0(v4, @"harvestQueueAddMessage SUBJECT FROM TO BODY (optional DATE)");
  dispatch_semaphore_t v5 = [*(id *)(a1 + 32) messageFromArgs:v3];
  id v6 = [*(id *)(a1 + 32) searchableItemFromMessage:v5];
  id v7 = *(void **)(a1 + 32);
  id v9 = v6;
  id v8 = +[NSArray arrayWithObjects:&v9 count:1];
  [v7 addSearchableItems:v8];
}

void sub_10000CC04(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_10001A9E0([v3 count] == (id)1, @"suggestionsFromTextMessageJson JSON_FILE");
  char v4 = [v3 objectAtIndexedSubscript:0];

  id v11 = 0;
  dispatch_semaphore_t v5 = +[NSData dataWithContentsOfFile:v4 options:0 error:&v11];
  id v6 = v11;
  if (v5)
  {
    id v10 = v6;
    id v7 = +[NSJSONSerialization JSONObjectWithData:v5 options:0 error:&v10];
    id v8 = v10;

    if (v8)
    {
      id v9 = [objc_alloc((Class)NSString) initWithFormat:@"Error decoding JSON content from %@: %@", v4, v8];
      puts((const char *)[v9 UTF8String]);
    }
    else
    {
      id v9 = [*(id *)(a1 + 32) searchableItemFromDictionary:v7];
      sub_100031FB4(v9);
    }
  }
  else
  {
    id v7 = [objc_alloc((Class)NSString) initWithFormat:@"Error reading JSON file: %@", v6];
    puts((const char *)[v7 UTF8String]);
    id v8 = v6;
  }
}

void sub_10000CD70(uint64_t a1, void *a2)
{
  id v2 = a2;
  sub_10001A9E0([v2 count] == (id)3, @"airportCodeFromAirportName AIRPORT_NAME CARRIER_CODE FLIGHT_NUMBER");
  char v3 = 1;
  char v4 = [v2 objectAtIndexedSubscript:1];
  uint64_t v5 = [v4 length] == (id)2;
  id v6 = [@"airportCodeFromAirportName AIRPORT_NAME CARRIER_CODE FLIGHT_NUMBER" stringByAppendingString:@"\n Error: CARRIER_CODE should be exactly 2 characters."];
  sub_10001A9E0(v5, v6);

  id v7 = [v2 objectAtIndexedSubscript:2];
  id v8 = [v7 length];
  if (v8 != (id)3)
  {
    uint64_t v5 = [v2 objectAtIndexedSubscript:2];
    char v3 = [(id)v5 length] == (id)4;
  }
  id v9 = [@"airportCodeFromAirportName AIRPORT_NAME CARRIER_CODE FLIGHT_NUMBER" stringByAppendingString:@"\n Error: FLIGHT_NUMBER should be 3 to 4 digits."];
  sub_10001A9E0(v3, v9);

  if (v8 != (id)3) {
  id v10 = +[SGFlightData sharedInstance];
  }
  id v11 = [v2 objectAtIndexedSubscript:0];
  uint64_t v12 = [v2 objectAtIndexedSubscript:1];
  uint64_t v13 = [v2 objectAtIndexedSubscript:2];
  objc_msgSend(v10, "airportCodeForAirportName:flightCarrier:flightNumber:outputInfos:", v11, v12, (unsigned __int16)objc_msgSend(v13, "intValue"), 0);
  id v42 = (__CFString *)objc_claimAutoreleasedReturnValue();

  uint64_t v14 = objc_opt_new();
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v15 = +[SGFlightData sharedInstance];
  id v16 = [v2 objectAtIndexedSubscript:1];
  long long v43 = v2;
  id v17 = [v2 objectAtIndexedSubscript:2];
  id v18 = objc_msgSend(v15, "airportsServicedByCarrier:flightNumber:", v16, (unsigned __int16)objc_msgSend(v17, "intValue"));

  id obj = v18;
  id v47 = [v18 countByEnumeratingWithState:&v53 objects:v60 count:16];
  if (v47)
  {
    uint64_t v46 = *(void *)v54;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v54 != v46) {
          objc_enumerationMutation(obj);
        }
        uint64_t v48 = v19;
        uint64_t v20 = *(void *)(*((void *)&v53 + 1) + 8 * v19);
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        dispatch_semaphore_t v21 = +[SGFlightData sharedInstance];
        uint64_t v22 = [v21 namesForAirport:v20];

        id v23 = [v22 countByEnumeratingWithState:&v49 objects:v59 count:16];
        if (v23)
        {
          id v24 = v23;
          uint64_t v25 = *(void *)v50;
          do
          {
            long long v26 = 0;
            do
            {
              if (*(void *)v50 != v25) {
                objc_enumerationMutation(v22);
              }
              long long v27 = *(void **)(*((void *)&v49 + 1) + 8 * (void)v26);
              long long v28 = [v14 objectForKeyedSubscript:v20];
              if (v28)
              {
                [v14 setObject:v28 forKeyedSubscript:v20];
              }
              else
              {
                id v29 = objc_opt_new();
                [v14 setObject:v29 forKeyedSubscript:v20];
              }
              long long v30 = [v27 second];
              if (!v30)
              {
                long long v32 = +[NSAssertionHandler currentHandler];
                [v32 handleFailureInMethod:*(void *)(a1 + 32), *(void *)(a1 + 40), @"suggest_tool.m", 1669, @"Invalid airport name: %@", v27 object file lineNumber description];
              }
              long long v31 = [v14 objectForKeyedSubscript:v20];
              [v31 addObject:v30];

              long long v26 = (char *)v26 + 1;
            }
            while (v24 != v26);
            id v24 = [v22 countByEnumeratingWithState:&v49 objects:v59 count:16];
          }
          while (v24);
        }

        uint64_t v19 = v48 + 1;
      }
      while ((id)(v48 + 1) != v47);
      id v47 = [obj countByEnumeratingWithState:&v53 objects:v60 count:16];
    }
    while (v47);
  }

  id v33 = objc_alloc((Class)NSString);
  v57[0] = @"carrier_code";
  uint64_t v34 = [v43 objectAtIndexedSubscript:1];
  v58[0] = v34;
  v57[1] = @"flight_number";
  dispatch_semaphore_t v35 = [v43 objectAtIndexedSubscript:2];
  v58[1] = v35;
  v57[2] = @"airport_name";
  uint64_t v36 = [v43 objectAtIndexedSubscript:0];
  uint64_t v37 = (void *)v36;
  CFStringRef v38 = &stru_10005B0F8;
  if (v42) {
    CFStringRef v38 = v42;
  }
  v58[2] = v36;
  v58[3] = v38;
  v57[3] = @"airport_code";
  v57[4] = @"airport_candidates";
  v58[4] = v14;
  uint64_t v39 = +[NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:5];
  uint64_t v40 = sub_10001B094(v39);
  id v41 = [v33 initWithFormat:@"%@", v40];
  puts((const char *)[v41 UTF8String]);
}

void sub_10000D304(uint64_t a1, void *a2)
{
  id v19 = a2;
  char v3 = objc_msgSend(*(id *)(a1 + 32), "dictionaryFromArgs:keys:");
  uint64_t v22 = +[SGSuggestionsService serviceForEvents];
  dispatch_semaphore_t v21 = dispatch_semaphore_create(0);
  char v4 = objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v31;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v31 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v30 + 1) + 8 * (void)v7);
        uint64_t v26 = 0;
        long long v27 = &v26;
        uint64_t v28 = 0x2020000000;
        char v29 = 0;
        id v9 = objc_alloc((Class)NSURL);
        id v10 = [v8 objectForKeyedSubscript:@"url"];
        id v11 = [v9 initWithString:v10];
        uint64_t v12 = [v8 objectForKeyedSubscript:@"title"];
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_100036168;
        v23[3] = &unk_100058F08;
        uint64_t v25 = &v26;
        uint64_t v13 = v21;
        id v24 = v13;
        [v22 isEventCandidateForURL:v11 andTitle:v12 withCompletion:v23];

        if (*((unsigned char *)v27 + 24)) {
          CFStringRef v14 = @"Yes";
        }
        else {
          CFStringRef v14 = @"No";
        }
        [v4 addObject:v14];
        dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);

        _Block_object_dispose(&v26, 8);
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v5);
  }

  BOOL v15 = [v4 count] == (id)1;
  id v16 = objc_alloc((Class)NSString);
  if (v15) {
    [v4 objectAtIndexedSubscript:0];
  }
  else {
  id v17 = sub_10001B094(v4);
  }
  id v18 = [v16 initWithFormat:@"%@", v17];
  puts((const char *)[v18 UTF8String]);
}

void sub_10000D620(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
}

void sub_10000D640(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100035684;
  v6[3] = &unk_100058F30;
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  [v4 allowPastAndCancelledEventsWithBlock:v6];
}

void sub_10000D6D8(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_10001A9E0([v3 count] == (id)1, @"suggestionsJsonLdOutput FILEPATH (.eml or json with eml file paths)");
  char v4 = *(void **)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100033BF4;
  v6[3] = &unk_100059088;
  id v9 = v4;
  id v7 = v3;
  id v8 = *(id *)(a1 + 32);
  id v5 = v3;
  [v4 allowPastAndCancelledEventsWithBlock:v6];
}

void sub_10000D7AC(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = [v4 count];
  if (v5 != (id)1) {
    LOBYTE(v5) = [v4 count] == (id)2;
  }
  sub_10001A9E0((char)v5, @"dkimVerificationForEmail FILEPATH [BODY|HEADERS|ALL]");
  if ([v4 count] == (id)2)
  {
    uint64_t v6 = [v4 objectAtIndexedSubscript:1];
    id v7 = [v6 lowercaseString];

    if ([v7 isEqualToString:@"body"])
    {
      uint64_t v8 = 2;
    }
    else if ([v7 isEqualToString:@"headers"])
    {
      uint64_t v8 = 1;
    }
    else
    {
      if (([v7 isEqualToString:@"all"] & 1) == 0)
      {
        id v24 = [objc_alloc((Class)NSString) initWithFormat:@"Argument must be BODY, HEADERS or ALL"];
        puts((const char *)[v24 UTF8String]);

        abort();
      }
      uint64_t v8 = 3;
    }
    uint64_t v27 = v8;
  }
  else
  {
    uint64_t v27 = 3;
  }
  uint64_t v25 = v4;
  id v9 = [*(id *)(a1 + 32) filesFromArgs:v4];
  uint64_t v28 = +[SGMailClientUtil sharedInstance];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v9;
  id v10 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = &CFPreferencesCopyKeyList_ptr;
    uint64_t v29 = *(void *)v33;
    do
    {
      for (id i = 0; i != v11; id i = (char *)i + 1)
      {
        if (*(void *)v33 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        id v31 = 0;
        id v16 = +[NSData dataWithContentsOfFile:v14 options:0 error:&v31];
        id v17 = v31;
        if (v16)
        {
          id v18 = +[SGMailClientUtil convertLineEndingsToNetwork:v16];
          id v30 = v17;
          id v19 = [v28 verifyDKIMSignatureForMailWithData:v18 options:v27 error:&v30];
          id v20 = v30;

          id v21 = objc_alloc((Class)v12[274]);
          if (v19)
          {
            id v2 = (__CFString *)[objc_alloc((Class)v12[274]) initWithFormat:@"FAIL: %@", v20];
            CFStringRef v22 = v2;
          }
          else
          {
            CFStringRef v22 = @"PASS";
          }
          id v23 = [v21 initWithFormat:@"DKIM Verification Status: %@", v22];
          puts((const char *)[v23 UTF8String]);

          if (v19) {
          id v17 = v20;
          }
          uint64_t v12 = &CFPreferencesCopyKeyList_ptr;
        }
        else
        {
          id v18 = [objc_alloc((Class)v12[274]) initWithFormat:@"Skipping DKIM verification for '%@' due to failing to load data: %@.", v14, v17];
          puts((const char *)[v18 UTF8String]);
        }
      }
      id v11 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v11);
  }
}

void sub_10000DB1C(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_10001A9E0([v3 count] == (id)1, @"ipsosMessagesFromSearchableItems FILEPATH (.eml or json with eml file paths)");
  long long v32 = +[SGSuggestionsService serviceForIpsos];
  long long v33 = objc_opt_new();
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v31 = v3;
  id v4 = [*(id *)(a1 + 40) filesFromArgs:v3];
  id v5 = [v4 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v44;
    do
    {
      for (id i = 0; i != v6; id i = (char *)i + 1)
      {
        if (*(void *)v44 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v43 + 1) + 8 * i);
        id v11 = +[NSData dataWithContentsOfFile:v9];
        if (v11)
        {
          uint64_t v12 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
          id v13 = [v12 first];

          uint64_t v14 = [v13 createNewSearchableItemWithSource:@"suggest_tool" uniqueIdentifier:0 domainIdentifier:0];
          if (v14) {
            [v33 addObject:v14];
          }
        }
        else
        {
          id v13 = [objc_alloc((Class)NSString) initWithFormat:@"ERROR: failed to read contentsOfFile:%@", v9];
          puts((const char *)[v13 UTF8String]);
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v6);
  }

  id v42 = 0;
  BOOL v15 = [v32 ipsosMessagesFromSearchableItems:v33 error:&v42];
  id v16 = v42;
  if (v16)
  {
    id v17 = [objc_alloc((Class)NSString) initWithFormat:@"Error: %@", v16];
    puts((const char *)[v17 UTF8String]);
  }
  id v30 = v16;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v15;
  id v36 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v36)
  {
    uint64_t v35 = *(void *)v39;
    do
    {
      for (j = 0; j != v36; j = (char *)j + 1)
      {
        if (*(void *)v39 != v35) {
          objc_enumerationMutation(obj);
        }
        id v19 = *(void **)(*((void *)&v38 + 1) + 8 * (void)j);
        id v20 = objc_alloc((Class)NSString);
        id v21 = [v19 messageId];
        CFStringRef v22 = [v19 sender];
        id v23 = [v22 name];
        id v24 = [v19 sender];
        uint64_t v25 = [v24 handle];
        uint64_t v26 = [v19 dateSent];
        uint64_t v27 = [v19 subject];
        uint64_t v28 = [v19 messageUnits];
        id v29 = [v20 initWithFormat:@"---\nSGIPMessage: %@\nSender: %@ <%@>\nDate: %@\nSubject: %@\n\nUnits:\n%@\n---", v21, v23, v25, v26, v27, v28, v30];
        puts((const char *)[v29 UTF8String]);
      }
      id v36 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
    }
    while (v36);
  }
}

void sub_10000DF28(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_10001A9E0([v3 count] == (id)1, @"suggestionsJsonLdOutputFromSMS FILEPATH (.json with text messages)");
  id v4 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000331B8;
  v6[3] = &unk_100058F30;
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  [v4 allowPastAndCancelledEventsWithBlock:v6];
}

void sub_10000DFDC(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_10001A9E0([v3 count] == (id)1, @"suggestionsFromRFC822 FILEPATH");
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100032D0C;
  v6[3] = &unk_100059120;
  id v7 = v3;
  id v4 = *(void **)(a1 + 40);
  id v8 = *(id *)(a1 + 32);
  id v5 = v3;
  [v4 allowPastAndCancelledEventsWithBlock:v6];
}

void sub_10000E0A8(uint64_t a1, void *a2)
{
  id v6 = a2;
  sub_10001A9E0([v6 count] == (id)1, @"extractAttributesAndDonateMail EML_FILEPATH");
  [*(id *)(a1 + 32) beSameUserAsSuggestd];
  id v4 = [*(id *)(a1 + 32) searchableItemsFromArgs:v6];
  id v5 = [v4 firstObject];

  sub_100032964(v5);
}

void sub_10000E154(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_10001A9E0([v3 count] == (id)1, @"mlEventSuggestionsFromTextMessageJson JSON_FILE");
  id v4 = [v3 objectAtIndexedSubscript:0];

  id v12 = 0;
  id v5 = +[NSData dataWithContentsOfFile:v4 options:0 error:&v12];
  id v6 = v12;
  if (v5)
  {
    id v11 = v6;
    id v7 = +[NSJSONSerialization JSONObjectWithData:v5 options:0 error:&v11];
    id v8 = v11;

    if (v8)
    {
      id v9 = [objc_alloc((Class)NSString) initWithFormat:@"Error decoding JSON content from %@: %@", v4, v8];
      puts((const char *)[v9 UTF8String]);
    }
    else
    {
      id v9 = [*(id *)(a1 + 32) searchableItemFromDictionary:v7];
      id v10 = [v9 attributeSet];
      [v10 setPotentialEventMessage:&__kCFBooleanTrue];

      sub_100031FB4(v9);
    }
  }
  else
  {
    id v7 = [objc_alloc((Class)NSString) initWithFormat:@"Error reading JSON file: %@", v6];
    puts((const char *)[v7 UTF8String]);
    id v8 = v6;
  }
}

void sub_10000E2E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_10001A9E0([v3 count] == (id)1, @"mlEventExtractionForMessageEventDissectorFrom JSON_FILE");
  id v4 = [v3 objectAtIndexedSubscript:0];
  id v54 = 0;
  id v5 = +[NSData dataWithContentsOfFile:v4 options:0 error:&v54];
  id v6 = v54;
  if (v5)
  {
    id v53 = v6;
    id v7 = +[NSJSONSerialization JSONObjectWithData:v5 options:0 error:&v53];
    id v8 = v53;

    if (v8)
    {
      id v9 = [objc_alloc((Class)NSString) initWithFormat:@"Error decoding JSON content from %@: %@", v4, v8];
      puts((const char *)[v9 UTF8String]);
      id v6 = v8;
    }
    else
    {
      uint64_t v10 = [v7 objectForKeyedSubscript:@"textContent"];
      if (!v10)
      {
        id v36 = +[NSAssertionHandler currentHandler];
        [v36 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"suggest_tool.m" lineNumber:2355 description:@"JSON key \"textContent\" is required"];
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v37 = +[NSAssertionHandler currentHandler];
        [v37 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"suggest_tool.m" lineNumber:2356 description:@"textContent must be a string"];
      }
      uint64_t v11 = [v7 objectForKeyedSubscript:@"mlModelParameters"];
      if (!v11)
      {
        long long v38 = +[NSAssertionHandler currentHandler];
        [v38 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"suggest_tool.m" lineNumber:2359 description:@"JSON key \"mlModelParameters\" is required"];
      }
      id v47 = v7;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        long long v39 = +[NSAssertionHandler currentHandler];
        [v39 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"suggest_tool.m" lineNumber:2360 description:@"mlModelParameters must be a dictionary"];
      }
      id v12 = objc_opt_new();
      [v12 setBundleID:SGBundleIdentifierMessages];
      id v13 = objc_opt_new();
      uint64_t v14 = [v12 attributeSet];
      [v14 setContentCreationDate:v13];

      BOOL v15 = [v12 attributeSet];
      long long v46 = (void *)v10;
      [v15 setTextContent:v10];

      [v12 setDomainIdentifier:@"testConversation"];
      id v16 = [v12 attributeSet];
      [v16 setPotentialEventMessage:&__kCFBooleanTrue];

      id v17 = [objc_alloc((Class)CSPerson) initWithDisplayName:0 handles:&off_100064848 handleIdentifier:CNContactInstantMessageAddressesKey];
      id v56 = v17;
      id v18 = +[NSArray arrayWithObjects:&v56 count:1];
      id v19 = [v12 attributeSet];
      [v19 setAuthors:v18];

      id v20 = [objc_alloc((Class)SGTextMessage) initWithSearchableItem:v12];
      id v21 = +[SGMessageEventDissector sharedInstance];
      long long v45 = (void *)v11;
      CFStringRef v22 = [v21 schemaOrgAndMissingEntitiesForMessage:v20 withMLModelParameters:v11];

      id v23 = v22;
      if (v22)
      {
        long long v44 = v5;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v24 = v22;
        id v25 = [v24 countByEnumeratingWithState:&v49 objects:v55 count:16];
        if (v25)
        {
          id v26 = v25;
          long long v40 = v23;
          long long v41 = v12;
          id v42 = v4;
          id v43 = v3;
          id v6 = 0;
          uint64_t v27 = *(void *)v50;
          do
          {
            uint64_t v28 = 0;
            id v29 = v6;
            do
            {
              if (*(void *)v50 != v27) {
                objc_enumerationMutation(v24);
              }
              uint64_t v30 = *(void *)(*((void *)&v49 + 1) + 8 * (void)v28);
              id v48 = v29;
              id v31 = +[NSJSONSerialization dataWithJSONObject:v30 options:1 error:&v48];
              id v6 = v48;

              id v32 = objc_alloc((Class)NSString);
              if (v31)
              {
                id v33 = [v32 initWithData:v31 encoding:4];
              }
              else
              {
                id v34 = [v32 initWithFormat:@"Got error in deserialization: %@", v6];
                puts((const char *)[v34 UTF8String]);

                id v33 = 0;
              }
              id v35 = [objc_alloc((Class)NSString) initWithFormat:@"%@", v33];
              puts((const char *)[v35 UTF8String]);

              uint64_t v28 = (char *)v28 + 1;
              id v29 = v6;
            }
            while (v26 != v28);
            id v26 = [v24 countByEnumeratingWithState:&v49 objects:v55 count:16];
          }
          while (v26);
          id v4 = v42;
          id v3 = v43;
          id v5 = v44;
          id v12 = v41;
          id v23 = v40;
        }
        else
        {
          id v6 = 0;
        }
      }
      else
      {
        id v24 = [objc_alloc((Class)NSString) initWithFormat:@"Unable to fetch events from MLRuntime plugin"];
        puts((const char *)[v24 UTF8String]);
        id v6 = 0;
      }

      id v9 = v46;
      id v7 = v47;
    }
  }
  else
  {
    id v7 = [objc_alloc((Class)NSString) initWithFormat:@"Error reading JSON file: %@", v6];
    puts((const char *)[v7 UTF8String]);
  }
}

void sub_10000E8DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_10001A9E0([v3 count] == (id)1, @"harvestEventFromRFC822 FILEPATH");
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100031E1C;
  v8[3] = &unk_100059088;
  id v9 = v3;
  id v4 = *(void **)(a1 + 40);
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v10 = v5;
  uint64_t v11 = v6;
  id v7 = v3;
  [v4 allowPastAndCancelledEventsWithBlock:v8];
}

void sub_10000E9AC(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_10001A9E0([v3 count] == (id)1, @"jsEntityFromRFC822 FILEPATH (.eml or json with eml file paths)");
  id v4 = objc_opt_new();
  uint64_t v35 = a1;
  id v31 = v3;
  id v5 = [*(id *)(a1 + 40) filesFromArgs:v3];
  id v32 = objc_opt_new();
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v5;
  id v6 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v37;
    do
    {
      id v9 = 0;
      id v33 = v7;
      do
      {
        if (*(void *)v37 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v36 + 1) + 8 * (void)v9);
        id v12 = +[NSData dataWithContentsOfFile:v10];
        if (v12)
        {
          id v13 = (*(void (**)(void))(*(void *)(v35 + 32) + 16))();
          id v14 = [v13 first];

          if (v14)
          {
            BOOL v15 = v4;
            id v16 = [v32 packedJSMailMessageFromMailMessage:v14];
            id v17 = +[NSMutableDictionary dictionaryWithDictionary:v16];

            id v18 = [v17 objectForKeyedSubscript:@"html"];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass)
            {
              id v20 = [v17 objectForKeyedSubscript:@"html"];
              id v21 = +[NSString _pas_stringWithDataNoCopy:v20 encoding:4 nullTerminated:0];
              [v17 setObject:v21 forKeyedSubscript:@"html"];
            }
            CFStringRef v22 = [v17 objectForKeyedSubscript:@"html"];
            uint64_t v23 = +[SGMonochrome stringByExtractingPlainTextFromHTML:v22 tableDelimiters:1 stripLinks:1];
            id v24 = (void *)v23;
            if (v23) {
              CFStringRef v25 = (const __CFString *)v23;
            }
            else {
              CFStringRef v25 = &stru_10005B0F8;
            }
            [v17 setObject:v25 forKeyedSubscript:@"monochrome"];

            id v4 = v15;
            [v15 addObject:v17];
            id v7 = v33;
          }
          else
          {
            id v17 = [objc_alloc((Class)NSString) initWithFormat:@"ERROR: failed to retrieve Message: %@", v12];
            puts((const char *)[v17 UTF8String]);
          }
        }
        else
        {
          id v14 = [objc_alloc((Class)NSString) initWithFormat:@"ERROR: failed to read contentsOfFile:%@", v10];
          puts((const char *)[v14 UTF8String]);
        }

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v7);
  }

  id v26 = [v4 count];
  id v27 = objc_alloc((Class)NSString);
  if (v26 == (id)1)
  {
    uint64_t v28 = [v4 objectAtIndexedSubscript:0];
    sub_10001B094(v28);
    id v29 = (id)objc_claimAutoreleasedReturnValue();
    id v30 = [v27 initWithFormat:@"%@", v29];
    puts((const char *)[v30 UTF8String]);
  }
  else
  {
    uint64_t v28 = sub_10001B094(v4);
    id v29 = [v27 initWithFormat:@"%@", v28];
    puts((const char *)[v29 UTF8String]);
  }
}

void sub_10000EDD4(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_10001A9E0((unint64_t)[v3 count] < 2, @"htmlFromRFC822 FILEPATH (eml file, or omit for stdin)");
  if ([v3 count])
  {
    id v8 = objc_alloc((Class)NSData);
    id v9 = [v3 objectAtIndexedSubscript:0];
    id v18 = 0;
    id v10 = [v8 initWithContentsOfFile:v9 options:1 error:&v18];
    id v6 = v18;

    if (!v10)
    {
      id v11 = objc_alloc((Class)NSString);
      id v12 = [v3 objectAtIndexedSubscript:0];
      id v13 = [v11 initWithFormat:@"ERROR: Could not read %@ (%@)", v12, v6];
      puts((const char *)[v13 UTF8String]);

LABEL_6:
      exit(1);
    }
  }
  else
  {
    id v4 = +[NSFileHandle fileHandleWithStandardInput];
    id v19 = 0;
    uint64_t v5 = [v4 readDataToEndOfFileAndReturnError:&v19];
    id v6 = v19;

    if (!v5)
    {
      id v7 = [objc_alloc((Class)NSString) initWithFormat:@"ERROR: Could not read stdin (%@)", v6];
      puts((const char *)[v7 UTF8String]);

      goto LABEL_6;
    }
  }

  id v14 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  BOOL v15 = [v14 first];

  if (byte_10006A7BB == 1)
  {
    id v16 = [v15 htmlParser];
    id v17 = [v16 textContent];
    printf("%s", (const char *)[v17 UTF8String]);
  }
  else
  {
    id v16 = [v15 htmlBody];
    printf("%s", (const char *)[v16 UTF8String]);
  }

  exit(0);
}

void sub_10000EFE8(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_10001A9E0([v3 count] == (id)2, @"reportCorrectness ZIP_FILEPATH OUTPUT_PLIST_PATH");
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100031830;
  v6[3] = &unk_100059120;
  id v7 = v3;
  id v4 = *(void **)(a1 + 40);
  id v8 = *(id *)(a1 + 32);
  id v5 = v3;
  [v4 allowPastAndCancelledEventsWithBlock:v6];
}

void sub_10000F0B4(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_10001A9E0([v3 count] == (id)1, @"suggestionsFromConversation .json with content or json with json file path"));
  id v4 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100030EEC;
  v6[3] = &unk_100058F30;
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  [v4 allowPastAndCancelledEventsWithBlock:v6];
}

void sub_10000F168(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_10001A9E0([v3 count] == (id)1, @"dissectAttachmentsFromSearchableItem FILEPATH");
  id v4 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100030A1C;
  v6[3] = &unk_1000591B0;
  id v7 = v3;
  long long v8 = *(_OWORD *)(a1 + 32);
  id v5 = v3;
  [v4 allowPastAndCancelledEventsWithBlock:v6];
}

void sub_10000F22C(uint64_t a1)
{
  [*(id *)(a1 + 32) beSameUserAsSuggestd];
  id v1 = objc_alloc((Class)NSString);
  id v3 = +[SGSqlEntityStore defaultPath];
  id v2 = [v1 initWithFormat:@"%@", v3];
  puts((const char *)[v2 UTF8String]);
}

void sub_10000F2B4(uint64_t a1)
{
  id v2 = &CFPreferencesCopyKeyList_ptr;
  id v3 = [objc_alloc((Class)NSString) initWithFormat:@"Killing suggestd and reversetemplated"];
  puts((const char *)[v3 UTF8String]);

  id v4 = sgLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [objc_alloc((Class)NSString) initWithFormat:@"Killing suggestd and reversetemplated"];
    id v6 = [v5 UTF8String];
    LODWORD(buf[0]) = 136315138;
    *(void *)((char *)buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s\n", (uint8_t *)buf, 0xCu);
  }
  buf[0] = *(_OWORD *)off_100059210;
  buf[1] = *(_OWORD *)off_100059220;
  uint64_t v148 = 0;
  +[_PASPosixUtils runCommandWithPath:"/usr/bin/killall" argv:buf envp:0 stdoutData:0 stderrData:0];
  id v7 = [objc_alloc((Class)NSString) initWithFormat:@"Killed daemons"];
  puts((const char *)[v7 UTF8String]);

  long long v8 = sgLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [objc_alloc((Class)NSString) initWithFormat:@"Killed daemons"];
    id v10 = [v9 UTF8String];
    LODWORD(v145) = 136315138;
    *(void *)((char *)&v145 + 4) = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s\n", (uint8_t *)&v145, 0xCu);
  }
  id v11 = [objc_alloc((Class)NSString) initWithFormat:@"Running dbPath subcommand to determine path"];
  puts((const char *)[v11 UTF8String]);

  id v12 = sgLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = [objc_alloc((Class)NSString) initWithFormat:@"Running dbPath subcommand to determine path"];
    id v14 = [v13 UTF8String];
    LODWORD(v145) = 136315138;
    *(void *)((char *)&v145 + 4) = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s\n", (uint8_t *)&v145, 0xCu);
  }
  uint64_t v15 = _CFProcessPath();
  *(void *)&long long v145 = v15;
  *((void *)&v145 + 1) = "dbPath";
  uint64_t v146 = 0;
  if (!v15) {
    +[NSException raise:@"NSInternalInconsistencyException", @"%@", @"Unable to fetch tool path." format];
  }
  id v141 = 0;
  +[_PASPosixUtils runCommandWithPath:v15 argv:&v145 envp:0 stdoutData:&v141 stderrData:0];
  id v16 = v141;
  id v17 = [objc_alloc((Class)NSString) initWithData:v16 encoding:4];
  id v18 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  id v19 = [v17 stringByTrimmingCharactersInSet:v18];
  id v20 = [v19 stringByDeletingLastPathComponent];

  id v21 = [objc_alloc((Class)NSString) initWithFormat:@"Suggestions directory is %@", v20];
  puts((const char *)[v21 UTF8String]);

  CFStringRef v22 = sgLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    id v23 = [objc_alloc((Class)NSString) initWithFormat:@"Suggestions directory is %@", v20];
    id v24 = [v23 UTF8String];
    *(_DWORD *)v143 = 136315138;
    id v144 = v24;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s\n", v143, 0xCu);
  }
  if ([v20 rangeOfString:@"Suggestions"] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v25 = [objc_alloc((Class)NSString) initWithFormat:@"Refusing to remove suspicious-looking Suggestions path \"%@\".", v20];
    +[NSException raise:@"NSInternalInconsistencyException", @"%@", v25 format];
  }
  id v26 = [objc_alloc((Class)NSString) initWithFormat:@"Removing all suggestions files at %@", v20];
  puts((const char *)[v26 UTF8String]);

  id v27 = sgLogHandle();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    id v28 = [objc_alloc((Class)NSString) initWithFormat:@"Removing all suggestions files at %@", v20];
    id v29 = [v28 UTF8String];
    *(_DWORD *)v143 = 136315138;
    id v144 = v29;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%s\n", v143, 0xCu);
  }
  id v30 = +[NSFileManager defaultManager];
  id v140 = 0;
  unsigned __int8 v31 = [v30 removeItemAtPath:v20 error:&v140];
  id v32 = v140;

  if (v31)
  {
    [*(id *)(a1 + 32) beSameUserAsSuggestd];
    id v33 = +[NSFileManager defaultManager];
    id v139 = v32;
    unsigned __int8 v34 = [v33 createDirectoryAtPath:v20 withIntermediateDirectories:1 attributes:0 error:&v139];
    id v35 = v139;

    id v36 = objc_alloc((Class)NSString);
    if (v34)
    {
      id v37 = [v36 initWithFormat:@"Clearing preferences"];
      puts((const char *)[v37 UTF8String]);

      long long v38 = sgLogHandle();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        id v39 = [objc_alloc((Class)NSString) initWithFormat:@"Clearing preferences"];
        id v40 = [v39 UTF8String];
        *(_DWORD *)v143 = 136315138;
        id v144 = v40;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "%s\n", v143, 0xCu);
      }
      +[SGPreferenceStorage resetAllPreferences];
      id v41 = [objc_alloc((Class)NSString) initWithFormat:@"Re-creating the database"];
      puts((const char *)[v41 UTF8String]);

      id v42 = sgLogHandle();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        id v43 = [objc_alloc((Class)NSString) initWithFormat:@"Re-creating the database"];
        id v44 = [v43 UTF8String];
        *(_DWORD *)v143 = 136315138;
        id v144 = v44;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "%s\n", v143, 0xCu);
      }
      id v126 = v35;

      id v45 = +[SGSqlEntityStore defaultStore];
      id v46 = [objc_alloc((Class)NSString) initWithFormat:@"Clearing suggest history"];
      puts((const char *)[v46 UTF8String]);

      id v47 = sgLogHandle();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        id v48 = [objc_alloc((Class)NSString) initWithFormat:@"Clearing suggest history"];
        id v49 = [v48 UTF8String];
        *(_DWORD *)v143 = 136315138;
        id v144 = v49;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "%s\n", v143, 0xCu);
      }
      long long v50 = +[SGSuggestionsService serviceForInternal];
      v137[0] = _NSConcreteStackBlock;
      v137[1] = 3221225472;
      v137[2] = sub_1000306A4;
      v137[3] = &unk_100059240;
      long long v51 = dispatch_semaphore_create(0);
      v138 = v51;
      v125 = v50;
      [v50 resetConfirmationAndRejectionHistoryWithCompletion:v137];
      if (+[_PASDispatch waitForSemaphore:v51 timeoutSeconds:10.0] == 1)
      {
        id v52 = [objc_alloc((Class)NSString) initWithFormat:@"Clearing suggest history time-outed."];
        puts((const char *)[v52 UTF8String]);

        id v53 = sgLogHandle();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          id v54 = [objc_alloc((Class)NSString) initWithFormat:@"Clearing suggest history time-outed."];
          id v55 = [v54 UTF8String];
          *(_DWORD *)v143 = 136315138;
          id v144 = v55;
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "%s\n", v143, 0xCu);
        }
      }
      id v56 = [objc_alloc((Class)NSString) initWithFormat:@"Clearing local persistent logs"];
      puts((const char *)[v56 UTF8String]);

      unsigned int v57 = sgLogHandle();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
      {
        id v58 = [objc_alloc((Class)NSString) initWithFormat:@"Clearing local persistent logs"];
        id v59 = [v58 UTF8String];
        *(_DWORD *)v143 = 136315138;
        id v144 = v59;
        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_INFO, "%s\n", v143, 0xCu);
      }
      int v60 = +[SGRTCLogging defaultLogger];
      [v60 resetLogs];

      id v61 = [objc_alloc((Class)NSString) initWithFormat:@"Removing pseudo contacts from Spotlight"];
      puts((const char *)[v61 UTF8String]);

      uint64_t v62 = sgLogHandle();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
      {
        id v63 = [objc_alloc((Class)NSString) initWithFormat:@"Removing pseudo contacts from Spotlight"];
        id v64 = [v63 UTF8String];
        *(_DWORD *)v143 = 136315138;
        id v144 = v64;
        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_INFO, "%s\n", v143, 0xCu);
      }
      uint64_t v65 = +[SGSuggestionsService serviceForInternal];
      v135[0] = _NSConcreteStackBlock;
      v135[1] = 3221225472;
      v135[2] = sub_1000307C0;
      v135[3] = &unk_100059240;
      unint64_t v66 = v51;
      v136 = v66;
      [v65 removeAllStoredPseudoContactsWithCompletion:v135];

      long long v67 = v125;
      if (+[_PASDispatch waitForSemaphore:v66 timeoutSeconds:10.0] == 1)
      {
        id v68 = [objc_alloc((Class)NSString) initWithFormat:@"Removing pseudocontacts from Spotlight time-outed."];
        puts((const char *)[v68 UTF8String]);

        long long v69 = sgLogHandle();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
        {
          id v70 = [objc_alloc((Class)NSString) initWithFormat:@"Removing pseudocontacts from Spotlight time-outed."];
          id v71 = [v70 UTF8String];
          *(_DWORD *)v143 = 136315138;
          id v144 = v71;
          _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_INFO, "%s\n", v143, 0xCu);
        }
      }
      id v72 = [objc_alloc((Class)NSString) initWithFormat:@"Removing and adding suggestedEventCalendar"];
      puts((const char *)[v72 UTF8String]);

      long long v73 = sgLogHandle();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
      {
        id v74 = [objc_alloc((Class)NSString) initWithFormat:@"Removing and adding suggestedEventCalendar"];
        id v75 = [v74 UTF8String];
        *(_DWORD *)v143 = 136315138;
        id v144 = v75;
        _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_INFO, "%s\n", v143, 0xCu);
      }
      v124 = v20;

      v76 = objc_opt_new();
      [v76 removeSuggestedEventCalendar];
      [v76 insertSuggestedEventCalendar];
      id v77 = [objc_alloc((Class)NSString) initWithFormat:@"Removing pseudoreminders"];
      puts((const char *)[v77 UTF8String]);

      v78 = sgLogHandle();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
      {
        id v79 = [objc_alloc((Class)NSString) initWithFormat:@"Removing pseudoreminders"];
        id v80 = [v79 UTF8String];
        *(_DWORD *)v143 = 136315138;
        id v144 = v80;
        _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_INFO, "%s\n", v143, 0xCu);
      }
      id v134 = 0;
      v127 = objc_opt_new();
      uint64_t v81 = [v127 fetchSiriFoundInAppsListWithError:&v134];
      id v82 = v134;
      if (v81)
      {
        id v120 = v16;
        id v133 = 0;
        v83 = [v81 fetchRemindersWithError:&v133];
        unint64_t v84 = v133;
        v119 = v83;
        if (v83)
        {
          v118 = v84;
          long long v131 = 0u;
          long long v132 = 0u;
          long long v129 = 0u;
          long long v130 = 0u;
          v85 = v83;
          id v86 = [v85 countByEnumeratingWithState:&v129 objects:v142 count:16];
          if (v86)
          {
            id v87 = v86;
            id v117 = v82;
            v121 = v66;
            uint64_t v88 = *(void *)v130;
            do
            {
              for (id i = 0; i != v87; id i = (char *)i + 1)
              {
                if (*(void *)v130 != v88) {
                  objc_enumerationMutation(v85);
                }
                uint64_t v90 = *(void *)(*((void *)&v129 + 1) + 8 * i);
                id v91 = [objc_alloc((Class)REMSaveRequest) initWithStore:v127];
                id v92 = [v91 updateList:v81];
                v93 = [v91 updateReminder:v90];
                [v93 removeFromList];
                id v128 = 0;
                LOBYTE(v90) = [v91 saveSynchronouslyWithError:&v128];
                id v94 = v128;
                if ((v90 & 1) == 0)
                {
                  v95 = sgRemindersLogHandle();
                  if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)v143 = 138412290;
                    id v144 = v94;
                    _os_log_error_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_ERROR, "Unable to delete reminder in ReminderKit error: %@", v143, 0xCu);
                  }
                }
              }
              id v87 = [v85 countByEnumeratingWithState:&v129 objects:v142 count:16];
            }
            while (v87);
            id v2 = &CFPreferencesCopyKeyList_ptr;
            long long v67 = v125;
            id v35 = v126;
            unint64_t v66 = v121;
            id v82 = v117;
          }
          v96 = v118;
        }
        else
        {
          v123 = v66;
          v107 = v84;
          id v108 = [objc_alloc((Class)NSString) initWithFormat:@"Error fetching pseudoReminders: %@", v84];
          puts((const char *)[v108 UTF8String]);

          v85 = sgLogHandle();
          if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
          {
            id v109 = [objc_alloc((Class)NSString) initWithFormat:@"Error fetching pseudoReminders: %@", v107];
            id v110 = [v109 UTF8String];
            *(_DWORD *)v143 = 136315138;
            id v144 = v110;
            _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_INFO, "%s\n", v143, 0xCu);
          }
          v96 = v107;
          unint64_t v66 = v123;
        }

        id v16 = v120;
      }
      else
      {
        id v103 = [objc_alloc((Class)NSString) initWithFormat:@"Error fetching remindersFoundInAppsList: %@", v82];
        puts((const char *)[v103 UTF8String]);

        v96 = sgLogHandle();
        if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
        {
          v122 = v66;
          v104 = v96;
          id v105 = [objc_alloc((Class)NSString) initWithFormat:@"Error fetching remindersFoundInAppsList: %@", v82];
          id v106 = [v105 UTF8String];
          *(_DWORD *)v143 = 136315138;
          id v144 = v106;
          _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_INFO, "%s\n", v143, 0xCu);

          v96 = v104;
          unint64_t v66 = v122;
        }
      }

      id v111 = [objc_alloc((Class)v2[274]) initWithFormat:@"Done. To re-send mail to Suggestions, run this command:\n killall -9 searchd ; mdutil -S"];
      puts((const char *)[v111 UTF8String]);

      v112 = sgLogHandle();
      if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
      {
        id v113 = [objc_alloc((Class)v2[274]) initWithFormat:@"Done. To re-send mail to Suggestions, run this command:\n killall -9 searchd ; mdutil -S"];
        id v114 = v82;
        id v115 = v113;
        id v116 = [v113 UTF8String];
        *(_DWORD *)v143 = 136315138;
        id v144 = v116;
        _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_INFO, "%s\n", v143, 0xCu);

        id v82 = v114;
      }

      id v20 = v124;
    }
    else
    {
      id v100 = [v36 initWithFormat:@"Failed to create Suggestions directory at %@: %@", v20, v35];
      puts((const char *)[v100 UTF8String]);

      long long v67 = sgLogHandle();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
      {
        id v101 = [objc_alloc((Class)NSString) initWithFormat:@"Failed to create Suggestions directory at %@: %@", v20, v35];
        id v102 = [v101 UTF8String];
        *(_DWORD *)v143 = 136315138;
        id v144 = v102;
        _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_INFO, "%s\n", v143, 0xCu);
      }
    }
  }
  else
  {
    id v97 = [objc_alloc((Class)NSString) initWithFormat:@"Failed to remove %@: %@", v20, v32];
    puts((const char *)[v97 UTF8String]);

    long long v67 = sgLogHandle();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
    {
      id v98 = [objc_alloc((Class)NSString) initWithFormat:@"Failed to remove %@: %@", v20, v32];
      id v99 = [v98 UTF8String];
      *(_DWORD *)v143 = 136315138;
      id v144 = v99;
      _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_INFO, "%s\n", v143, 0xCu);
    }
    id v35 = v32;
  }
}

void sub_1000104A8(uint64_t a1)
{
  [*(id *)(a1 + 32) beSameUserAsSuggestd];
  id v53 = 0;
  id v1 = [objc_alloc((Class)SGSqlEntityStore) initForDbStatsOnlyWithError:&v53];
  id v2 = v53;
  id v3 = v2;
  if (!v1)
  {
    id v4 = [v2 domain];
    if ([v4 isEqualToString:NSPOSIXErrorDomain])
    {
      id v5 = [v3 code];

      if (v5 == (id)2)
      {
        id v6 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"No Suggestions database exists for user %d\n", getuid());
        puts((const char *)[v6 UTF8String]);
        goto LABEL_16;
      }
    }
    else
    {
    }
  }
  id v7 = objc_alloc((Class)NSString);
  long long v8 = sub_100006034(@"Entity Store:");
  id v9 = [v7 initWithFormat:@"\n%@\n", v8];
  puts((const char *)[v9 UTF8String]);

  [v1 performIntegrityCheckOnly];
  id v10 = objc_alloc((Class)NSString);
  id v11 = sub_100006034(@"Entities Schema:");
  id v12 = [v1 dbHandleForTesting];
  id v13 = [v10 initWithFormat:@"\n%@ %lu\n", v11, objc_msgSend(v12, "userVersion")];
  puts((const char *)[v13 UTF8String]);

  id v14 = [v1 dbHandleForTesting];
  [v14 prepAndRunQuery:@"SELECT sql FROM sqlite_master WHERE sql IS NOT NULL AND tbl_name NOT LIKE 'sqlite_%' " onPrep:0 onRow:&stru_10005AC58 onError:&stru_10005AC78];

  id v15 = objc_alloc((Class)NSString);
  id v16 = sub_100006034(@"\n\nSnippets Schema:");
  id v17 = [v1 snippetsDbHandleForTesting];
  id v18 = [v15 initWithFormat:@"%@ %lu\n", v16, objc_msgSend(v17, "userVersion")];
  puts((const char *)[v18 UTF8String]);

  id v19 = [v1 snippetsDbHandleForTesting];
  [v19 prepAndRunQuery:@"SELECT sql FROM sqlite_master WHERE sql IS NOT NULL AND tbl_name NOT LIKE 'sqlite_%' " onPrep:0 onRow:&stru_10005AC58 onError:&stru_10005AC78];

  id v20 = objc_alloc((Class)NSString);
  id v21 = sub_100006034(@"Harvest queue:");
  id v22 = [v20 initWithFormat:@"\n%@\n", v21];
  puts((const char *)[v22 UTF8String]);

  id v23 = +[SGPaths suggestionsSubdirectory:@"harvestqueue"];
  id v6 = [v23 stringByAppendingPathComponent:@"queue.db"];

  id v52 = 0;
  id v24 = +[SGSqliteDatabase sqliteDatabaseWithFilename:v6 error:&v52];
  id v25 = v52;
  if (v25)
  {
    id v26 = [objc_alloc((Class)NSString) initWithFormat:@"Error: failed to open harvest db: %@", v25];
    puts((const char *)[v26 UTF8String]);
  }
  else
  {
    [v24 performIntegrityCheck];
    id v27 = objc_alloc((Class)NSString);
    id v28 = sub_100006034(@"Harvest queue schema:");
    id v29 = [v27 initWithFormat:@"\n%@ %lu\n", v28, objc_msgSend(v24, "userVersion")];
    puts((const char *)[v29 UTF8String]);

    [v24 prepAndRunQuery:@"SELECT sql FROM sqlite_master WHERE sql IS NOT NULL AND tbl_name NOT LIKE 'sqlite_%' " onPrep:0 onRow:&stru_10005AC58 onError:&stru_10005AC78];
  }

  id v30 = objc_alloc((Class)NSString);
  unsigned __int8 v31 = sub_100006034(@"Pending queue:");
  id v32 = [v30 initWithFormat:@"\n%@\n", v31];
  puts((const char *)[v32 UTF8String]);

  id v33 = +[SGPaths suggestionsSubdirectory:@"pending"];
  unsigned __int8 v34 = [v33 stringByAppendingPathComponent:@"queue.db"];

  id v51 = 0;
  id v35 = +[SGSqliteDatabase sqliteDatabaseWithFilename:v34 error:&v51];
  id v36 = v51;
  if (v36)
  {
    id v37 = [objc_alloc((Class)NSString) initWithFormat:@"Error: failed to open pending db: %@", v36];
    puts((const char *)[v37 UTF8String]);
  }
  else
  {
    [v35 performIntegrityCheck];
    id v38 = objc_alloc((Class)NSString);
    id v39 = sub_100006034(@"Pending queue schema:");
    id v40 = [v38 initWithFormat:@"\n%@ %lu\n", v39, objc_msgSend(v35, "userVersion")];
    puts((const char *)[v40 UTF8String]);

    [v35 prepAndRunQuery:@"SELECT sql FROM sqlite_master WHERE sql IS NOT NULL AND tbl_name NOT LIKE 'sqlite_%' " onPrep:0 onRow:&stru_10005AC58 onError:&stru_10005AC78];
  }

  id v41 = objc_alloc((Class)NSString);
  id v42 = sub_100006034(@"Training database:");
  id v43 = [v41 initWithFormat:@"\n%@\n", v42];
  puts((const char *)[v43 UTF8String]);

  id v44 = +[SGPaths suggestionsDirectoryFile:@"training.db"];
  id v50 = 0;
  id v45 = +[SGSqliteDatabase sqliteDatabaseWithFilename:v44 error:&v50];
  id v3 = v50;

  if (v3)
  {
    id v46 = [objc_alloc((Class)NSString) initWithFormat:@"Error: failed to open training db: %@", v3];
    puts((const char *)[v46 UTF8String]);
  }
  else
  {
    [v45 performIntegrityCheck];
    id v47 = objc_alloc((Class)NSString);
    id v48 = sub_100006034(@"Training db schema:");
    id v49 = [v47 initWithFormat:@"\n%@ %lu\n", v48, objc_msgSend(v45, "userVersion")];
    puts((const char *)[v49 UTF8String]);

    [v45 prepAndRunQuery:@"SELECT sql FROM sqlite_master WHERE sql IS NOT NULL AND tbl_name NOT LIKE 'sqlite_%' " onPrep:0 onRow:&stru_10005AC58 onError:&stru_10005AC78];
  }

LABEL_16:
}

void sub_100010B6C(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 beSameUserAsSuggestd];
  id v7 = [*(id *)(a1 + 32) getEntityStore];
  id v5 = [v7 dbHandleForTesting];
  id v6 = [v4 objectAtIndexedSubscript:0];

  [v5 prepAndRunQuery:v6 onPrep:0 onRow:&stru_100059308 onError:&stru_100059348];
}

void sub_100010C20(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) beSameUserAsSuggestd];
  if ([v3 count])
  {
    id v4 = [v3 objectAtIndexedSubscript:0];
    id v5 = [v4 stringByAppendingPathComponent:@"entities.db"];

    id v6 = [v3 objectAtIndexedSubscript:0];
    id v7 = [v6 stringByAppendingPathComponent:@"snippets.db"];

    long long v8 = +[NSFileManager defaultManager];
    if ([v8 fileExistsAtPath:v5 isDirectory:0])
    {
      id v9 = +[NSFileManager defaultManager];
      unsigned __int8 v10 = [v9 fileExistsAtPath:v7 isDirectory:0];

      if (v10)
      {
        id v22 = 0;
        id v11 = [objc_alloc((Class)SGSqlEntityStore) initForRawDatabaseAccessWithEntityPath:v5 snippetsPath:v7 error:&v22];
        id v12 = v22;
        if (v12)
        {
          id v17 = v12;
          id v18 = objc_alloc((Class)NSString);
          id v19 = [v3 objectAtIndexedSubscript:0];
          id v20 = [v18 initWithFormat:@"Error: failed to initialize store at specified path: %@: %@", v19, v17];
          puts((const char *)[v20 UTF8String]);

          exit(1);
        }

        id v13 = 0;
        goto LABEL_6;
      }
    }
    else
    {
    }
    id v16 = [objc_alloc((Class)NSString) initWithFormat:@"Error: you need to specify a path containing both an entities.db and snippets.db"];
    puts((const char *)[v16 UTF8String]);

    exit(2);
  }
  id v21 = 0;
  id v11 = [objc_alloc((Class)SGSqlEntityStore) initForDbStatsOnlyWithError:&v21];
  id v14 = v21;
  id v13 = v14;
  if (v11) {
    goto LABEL_8;
  }
  id v5 = [v14 domain];
  if (![v5 isEqualToString:NSPOSIXErrorDomain])
  {
    id v11 = 0;
LABEL_6:

    goto LABEL_8;
  }
  id v15 = [v13 code];

  if (v15 == (id)2)
  {
    id v11 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"No Suggestions database exists for user %d\n", getuid());
    puts((const char *)[v11 UTF8String]);
    goto LABEL_9;
  }
  id v11 = 0;
LABEL_8:
  [v11 performDatabaseCheck];
LABEL_9:
}

void sub_100010EBC(uint64_t a1)
{
  [*(id *)(a1 + 32) beSameUserAsSuggestd];
  id v171 = 0;
  id v2 = [objc_alloc((Class)SGSqlEntityStore) initForDbStatsOnlyWithError:&v171];
  id v3 = v171;
  id v4 = v3;
  if (!v2)
  {
    id v5 = [v3 domain];
    if ([v5 isEqualToString:NSPOSIXErrorDomain])
    {
      id v6 = [v4 code];

      if (v6 == (id)2)
      {
        id v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"No Suggestions database exists for user %d\n", getuid());
        puts((const char *)[v7 UTF8String]);
        goto LABEL_26;
      }
    }
    else
    {
    }
  }
  uint64_t v156 = a1;
  v158 = v4;
  id v159 = v2;
  long long v8 = [v2 dbStats];
  id v9 = objc_alloc((Class)NSString);
  unsigned __int8 v10 = sub_100006034(@"Schema version:");
  id v11 = [v8 objectForKeyedSubscript:@"schema_version"];
  id v12 = [v9 initWithFormat:@"%@ %@\n", v10, v11];
  puts((const char *)[v12 UTF8String]);

  id v13 = objc_alloc((Class)NSString);
  id v14 = sub_100006034(@"Entities:");
  id v15 = [v13 initWithFormat:@"%@", v14];
  puts((const char *)[v15 UTF8String]);

  long long v169 = 0u;
  long long v170 = 0u;
  long long v167 = 0u;
  long long v168 = 0u;
  v162 = v8;
  id obj = [v8 objectForKeyedSubscript:@"entities"];
  id v16 = [obj countByEnumeratingWithState:&v167 objects:v173 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v168;
    do
    {
      for (id i = 0; i != v17; id i = (char *)i + 1)
      {
        if (*(void *)v168 != v18) {
          objc_enumerationMutation(obj);
        }
        id v20 = *(void **)(*((void *)&v167 + 1) + 8 * i);
        id v21 = SGEntityTypeDescription();
        unsigned int v22 = [v20 isEqual:v21];

        id v23 = objc_alloc((Class)NSString);
        id v24 = [v162 objectForKeyedSubscript:@"entities"];
        uint64_t v25 = [v24 objectForKeyedSubscript:v20];
        id v26 = (void *)v25;
        if (v22)
        {
          id v27 = [v162 objectForKeyedSubscript:@"merged_pseudocontacts"];
          id v28 = [v23 initWithFormat:@" %@\t%@\t(%@ merged)", v26, v20, v27];
          puts((const char *)[v28 UTF8String]);
        }
        else
        {
          id v27 = [v23 initWithFormat:@" %@\t%@", v25, v20];
          puts((const char *)[v27 UTF8String]);
        }
      }
      id v17 = [obj countByEnumeratingWithState:&v167 objects:v173 count:16];
    }
    while (v17);
  }

  id v29 = objc_alloc((Class)NSString);
  id v30 = [v162 objectForKeyedSubscript:@"orphaned_entity_count"];
  id v31 = [v29 initWithFormat:@"\n Orphans: %@", v30];
  puts((const char *)[v31 UTF8String]);

  id v32 = objc_alloc((Class)NSString);
  id v33 = [v162 objectForKeyedSubscript:@"total_entities"];
  id v34 = [v32 initWithFormat:@" Total: %@\n", v33];
  puts((const char *)[v34 UTF8String]);

  id v35 = objc_alloc((Class)NSString);
  id v36 = sub_100006034(@"Full Text Search:");
  id v37 = [v35 initWithFormat:@"%@", v36];
  puts((const char *)[v37 UTF8String]);

  id v38 = objc_alloc((Class)NSString);
  id v39 = [v162 objectForKeyedSubscript:@"entity_fts_lang"];
  id v40 = [v38 initWithFormat:@" Locale: %@", v39];
  puts((const char *)[v40 UTF8String]);

  id v41 = objc_alloc((Class)NSString);
  id v42 = [v162 objectForKeyedSubscript:@"entity_fts_details"];
  id v43 = [v41 initWithFormat:@" Details: %@", v42];
  puts((const char *)[v43 UTF8String]);

  id v44 = objc_alloc((Class)NSString);
  id v45 = [v162 objectForKeyedSubscript:@"entity_fts_count"];
  id v46 = [v44 initWithFormat:@" Rows: %@\n", v45];
  puts((const char *)[v46 UTF8String]);

  id v47 = objc_alloc((Class)NSString);
  id v48 = sub_100006034(@"Serialized Contacts:");
  id v49 = [v47 initWithFormat:@"%@", v48];
  puts((const char *)[v49 UTF8String]);

  id v50 = objc_alloc((Class)NSString);
  id v51 = [v162 objectForKeyedSubscript:@"serialized_contacts_lowest"];
  id v52 = [v50 initWithFormat:@" %@\tLowest EntityID", v51];
  puts((const char *)[v52 UTF8String]);

  id v53 = objc_alloc((Class)NSString);
  id v54 = [v162 objectForKeyedSubscript:@"serialized_contacts_highest"];
  id v55 = [v53 initWithFormat:@" %@\tHighest EntityID", v54];
  puts((const char *)[v55 UTF8String]);

  id v56 = objc_alloc((Class)NSString);
  unsigned int v57 = [v162 objectForKeyedSubscript:@"serialized_contacts_limit"];
  id v58 = [v56 initWithFormat:@"\n Limit: %@", v57];
  puts((const char *)[v58 UTF8String]);

  id v59 = objc_alloc((Class)NSString);
  int v60 = [v162 objectForKeyedSubscript:@"serialized_contacts_total"];
  id v61 = [v59 initWithFormat:@" Total: %@\n", v60];
  puts((const char *)[v61 UTF8String]);

  id v62 = objc_alloc((Class)NSString);
  id v63 = sub_100006034(@"Snippets:");
  id v7 = v162;
  id v64 = [v62 initWithFormat:@"%@", v63];
  puts((const char *)[v64 UTF8String]);

  id v65 = objc_alloc((Class)NSString);
  unint64_t v66 = [v162 objectForKeyedSubscript:@"snippets_title_count"];
  id v67 = [v65 initWithFormat:@" %@\tSnippets with titles", v66];
  puts((const char *)[v67 UTF8String]);

  id v68 = objc_alloc((Class)NSString);
  long long v69 = [v162 objectForKeyedSubscript:@"snippets_content_count"];
  id v70 = [v68 initWithFormat:@" %@\tSnippets with content", v69];
  puts((const char *)[v70 UTF8String]);

  id v71 = objc_alloc((Class)NSString);
  id v72 = [v162 objectForKeyedSubscript:@"snippets_count"];
  id v73 = [v71 initWithFormat:@"\n Total: %@", v72];
  puts((const char *)[v73 UTF8String]);

  id v74 = +[SGPaths suggestionsSubdirectory:@"journals"];
  uint64_t v75 = [v74 stringByAppendingPathComponent:@"snippets"];

  id v76 = objc_alloc((Class)NSString);
  id v77 = +[NSFileManager defaultManager];
  id obja = (id)v75;
  v78 = [v77 contentsOfDirectoryAtPath:v75 error:0];
  id v79 = objc_msgSend(v76, "initWithFormat:", @" Journals: %lu\n", objc_msgSend(v78, "count"));
  puts((const char *)[v79 UTF8String]);

  id v80 = [v162 objectForKeyedSubscript:@"statsCounters"];

  if (v80)
  {
    uint64_t v81 = [v162 objectForKeyedSubscript:@"statsCounters"];
    id v82 = objc_alloc((Class)NSString);
    v83 = sub_100006034(@"Enqueued items:");
    unint64_t v84 = [v81 objectForKeyedSubscript:kSGStatsKeyEnqueuedItems];
    id v85 = [v82 initWithFormat:@"\n%@ %lu", v83, objc_msgSend(v84, "integerValue")];
    puts((const char *)[v85 UTF8String]);

    id v86 = objc_alloc((Class)NSString);
    id v87 = sub_100006034(@"Dissected items:");
    uint64_t v88 = [v81 objectForKeyedSubscript:kSGStatsKeyDissectedItems];
    id v89 = [v86 initWithFormat:@"\n%@ %lu", v87, objc_msgSend(v88, "integerValue")];
    puts((const char *)[v89 UTF8String]);
  }
  id v90 = objc_alloc((Class)NSString);
  id v91 = sub_100006034(@"Tombstones:");
  id v92 = [v162 objectForKeyedSubscript:@"tombstones_count"];
  id v93 = [v90 initWithFormat:@"\n%@ %@", v91, v92];
  puts((const char *)[v93 UTF8String]);

  v157 = [*(id *)(v156 + 32) getRecipientsFilter];
  id v94 = [v157 counts];
  id v95 = objc_alloc((Class)NSString);
  v96 = sub_100006034(@"Recipient filter counts:");
  id v97 = [v94 first];
  v155 = v94;
  id v98 = [v94 second];
  id v99 = [v95 initWithFormat:@"\n%@ %@ / %@\n", v96, v97, v98];
  puts((const char *)[v99 UTF8String]);

  id v100 = objc_alloc((Class)NSString);
  id v101 = sub_100006034(@"Reimport Requests:");
  id v102 = [v100 initWithFormat:@"%@", v101];
  puts((const char *)[v102 UTF8String]);

  id v103 = objc_alloc((Class)NSString);
  v104 = [v162 objectForKeyedSubscript:@"reimportRequests_total"];
  id v105 = [v103 initWithFormat:@" Total: %@", v104];
  puts((const char *)[v105 UTF8String]);

  id v106 = objc_alloc((Class)NSString);
  v107 = [v162 objectForKeyedSubscript:@"reimportRequests_unqueried"];
  id v108 = [v106 initWithFormat:@" Unqueried: %@", v107];
  puts((const char *)[v108 UTF8String]);

  id v109 = objc_alloc((Class)NSString);
  id v110 = [v162 objectForKeyedSubscript:@"reimportRequests_unexecuted"];
  id v111 = [v109 initWithFormat:@" Unexecuted: %@", v110];
  puts((const char *)[v111 UTF8String]);

  id v112 = objc_alloc((Class)NSString);
  id v113 = [v162 objectForKeyedSubscript:@"reimportRequests_oldest"];
  [v113 doubleValue];
  id v114 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");
  id v115 = [v112 initWithFormat:@" Oldest: %@", v114];
  puts((const char *)[v115 UTF8String]);

  id v116 = objc_alloc((Class)NSString);
  id v117 = [v162 objectForKeyedSubscript:@"reimportRequests_oldestOpen"];
  [v117 doubleValue];
  v118 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");
  id v119 = [v116 initWithFormat:@" Oldest Open: %@", v118];
  puts((const char *)[v119 UTF8String]);

  id v120 = objc_alloc((Class)NSString);
  v121 = [v162 objectForKeyedSubscript:@"reimportItems_total"];
  id v122 = [v120 initWithFormat:@" Total Items: %@", v121];
  puts((const char *)[v122 UTF8String]);

  id v123 = objc_alloc((Class)NSString);
  v124 = [v162 objectForKeyedSubscript:@"reimportItems_unseen"];
  id v125 = [v123 initWithFormat:@" Unseen Items: %@", v124];
  puts((const char *)[v125 UTF8String]);

  id v126 = [objc_alloc((Class)NSString) initWithFormat:&stru_10005B0F8];
  puts((const char *)[v126 UTF8String]);

  id v127 = objc_alloc((Class)NSString);
  id v128 = sub_100006034(@"URLs:");
  id v129 = [v127 initWithFormat:@"%@", v128];
  puts((const char *)[v129 UTF8String]);

  long long v165 = 0u;
  long long v166 = 0u;
  long long v163 = 0u;
  long long v164 = 0u;
  long long v130 = [v162 objectForKeyedSubscript:@"urlsCounters"];
  id v131 = [v130 countByEnumeratingWithState:&v163 objects:v172 count:16];
  if (v131)
  {
    id v132 = v131;
    uint64_t v133 = *(void *)v164;
    do
    {
      for (j = 0; j != v132; j = (char *)j + 1)
      {
        if (*(void *)v164 != v133) {
          objc_enumerationMutation(v130);
        }
        uint64_t v135 = *(void *)(*((void *)&v163 + 1) + 8 * (void)j);
        id v136 = objc_alloc((Class)NSString);
        v137 = [v7 objectForKeyedSubscript:@"urlsCounters"];
        v138 = [v137 objectForKeyedSubscript:v135];
        id v139 = [v136 initWithFormat:@" %@: %@", v135, v138];
        puts((const char *)[v139 UTF8String]);

        id v7 = v162;
      }
      id v132 = [v130 countByEnumeratingWithState:&v163 objects:v172 count:16];
    }
    while (v132);
  }

  id v140 = [objc_alloc((Class)NSString) initWithFormat:&stru_10005B0F8];
  puts((const char *)[v140 UTF8String]);

  id v141 = objc_alloc((Class)NSString);
  v142 = sub_100006034(@"Training Store Statistics:");
  id v143 = [v141 initWithFormat:@"%@", v142];
  puts((const char *)[v143 UTF8String]);

  id v144 = +[SGPaths suggestionsDirectory];
  long long v145 = +[PMLTraining sharedSingletonWithDirectory:v144];
  uint64_t v146 = [v145 store];
  v147 = [v146 sessionStats];

  [v147 enumerateKeysAndObjectsUsingBlock:&stru_100059388];
  id v148 = [objc_alloc((Class)NSString) initWithFormat:&stru_10005B0F8];
  puts((const char *)[v148 UTF8String]);

  v149 = +[SGSuggestionsService serviceForInternal];
  v150 = [v149 powerState];

  id v151 = objc_alloc((Class)NSString);
  v152 = sub_100006034(@"PowerBudget State:");
  id v153 = [v151 initWithFormat:@"%@", v152];
  puts((const char *)[v153 UTF8String]);

  id v154 = [objc_alloc((Class)NSString) initWithFormat:@"%@", v150];
  puts((const char *)[v154 UTF8String]);

  id v4 = v158;
  id v2 = v159;
LABEL_26:
}

void sub_100011F94(uint64_t a1)
{
  [*(id *)(a1 + 32) beSameUserAsSuggestd];
  id v1 = +[SGSuggestionsService serviceForContacts];
  id v2 = [v1 namesForDetailCaches];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = v2;
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * (void)v7);
        id v9 = [objc_alloc((Class)NSString) initWithFormat:&stru_10005B0F8];
        puts((const char *)[v9 UTF8String]);

        id v10 = [objc_alloc((Class)NSString) initWithFormat:@"%@", v8];
        puts((const char *)[v10 UTF8String]);

        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

void sub_100012118(uint64_t a1)
{
  [*(id *)(a1 + 32) beSameUserAsSuggestd];
  id v7 = 0;
  id v1 = [objc_alloc((Class)SGSqlEntityStore) initForDbStatsOnlyWithError:&v7];
  id v2 = v7;
  id v3 = v2;
  if (v1) {
    goto LABEL_6;
  }
  id v4 = [v2 domain];
  if (([v4 isEqualToString:NSPOSIXErrorDomain] & 1) == 0)
  {

    goto LABEL_6;
  }
  id v5 = [v3 code];

  if (v5 != (id)2)
  {
LABEL_6:
    [v1 reportDbStats];
    goto LABEL_7;
  }
  id v6 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"No Suggestions database exists for user %d\n", getuid());
  puts((const char *)[v6 UTF8String]);

LABEL_7:
}

void sub_100012208(uint64_t a1)
{
  [*(id *)(a1 + 32) beSameUserAsSuggestd];
  id v4 = +[SGSqlEntityStore defaultStore];
  id v1 = objc_alloc((Class)NSString);
  if (v4) {
    CFStringRef v2 = @"Successfully initialized the entity store and ran migrations.";
  }
  else {
    CFStringRef v2 = @"Failed to initialize and migrate the entity store. See syslog and ostrace messages for details.";
  }
  id v3 = [v1 initWithFormat:v2];
  puts((const char *)[v3 UTF8String]);
}

void sub_10001229C(uint64_t a1)
{
  [*(id *)(a1 + 32) beSameUserAsSuggestd];
  CFStringRef v2 = getlogin();
  id v3 = &CFPreferencesCopyKeyList_ptr;
  if (v2)
  {
    id v4 = getpwnam(v2);
    if (v4)
    {
      id v5 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"User: %s (%i)", v4->pw_name, v4->pw_uid);
      puts((const char *)[v5 UTF8String]);
    }
  }
  id v6 = [objc_alloc((Class)NSString) initWithFormat:&stru_10005B0F8];
  puts((const char *)[v6 UTF8String]);

  id v7 = +[SGPaths suggestionsDirectory];
  uint64_t v8 = [v7 stringByStandardizingPath];

  id v9 = +[NSURL fileURLWithPath:v8];
  uint64_t v10 = [v9 URLByResolvingSymlinksInPath];

  id v46 = v8;
  id v41 = [v8 stringByDeletingLastPathComponent];
  long long v11 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:");
  long long v12 = [v11 URLByResolvingSymlinksInPath];

  if (v12)
  {
    if (v10) {
      goto LABEL_6;
    }
  }
  else
  {
    id v36 = +[NSAssertionHandler currentHandler];
    [v36 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"suggest_tool.m" lineNumber:3159 description:@"Library URL must be nonnull"];

    if (v10) {
      goto LABEL_6;
    }
  }
  id v37 = +[NSAssertionHandler currentHandler];
  [v37 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"suggest_tool.m" lineNumber:3160 description:@"Top-level URL must be nonnull"];

LABEL_6:
  v58[0] = NSURLAddedToDirectoryDateKey;
  v58[1] = NSURLAttributeModificationDateKey;
  v58[2] = NSURLContentModificationDateKey;
  v58[3] = NSURLCreationDateKey;
  v58[4] = NSURLIsDirectoryKey;
  void v58[5] = NSURLIsExecutableKey;
  v58[6] = NSURLIsReadableKey;
  v58[7] = NSURLIsRegularFileKey;
  v58[8] = NSURLIsSymbolicLinkKey;
  v58[9] = NSURLIsWritableKey;
  uint64_t v13 = +[NSArray arrayWithObjects:v58 count:10];
  +[NSFileManager defaultManager];
  v43 = id v55 = 0;
  long long v14 = [v43 contentsOfDirectoryAtURL:v12 includingPropertiesForKeys:v13 options:0 error:&v55];
  id v15 = (NSError *)v55;
  id v16 = v15;
  if (v15) {
    sub_10002F604(v15, v12, v15);
  }
  id v38 = v16;
  id v40 = v12;
  id v17 = [objc_alloc((Class)NSString) initWithFormat:@"Suggestions Directory: %@", v46];
  puts((const char *)[v17 UTF8String]);

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v14;
  id v18 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v52;
    do
    {
      for (id i = 0; i != v19; id i = (char *)i + 1)
      {
        if (*(void *)v52 != v20) {
          objc_enumerationMutation(obj);
        }
        unsigned int v22 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        id v23 = [v22 path];
        unsigned int v24 = [v23 containsString:@"Suggestions"];

        if (v24) {
          sub_10002F68C(v22);
        }
      }
      id v19 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
    }
    while (v19);
  }

  id v42 = (void *)v10;
  id v39 = (void *)v13;
  [v43 enumeratorAtURL:v10 includingPropertiesForKeys:v13 options:0 errorHandler:&stru_1000593C8];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v44 = (id)objc_claimAutoreleasedReturnValue();
  id v25 = [v44 countByEnumeratingWithState:&v47 objects:v56 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v48;
    do
    {
      for (j = 0; j != v26; j = (char *)j + 1)
      {
        if (*(void *)v48 != v27) {
          objc_enumerationMutation(v44);
        }
        id v29 = *(void **)(*((void *)&v47 + 1) + 8 * (void)j);
        id v30 = objc_alloc((Class)v3[274]);
        id v31 = [v29 path];
        [v31 stringByStandardizingPath];
        v33 = id v32 = v3;
        id v34 = [v33 stringByReplacingOccurrencesOfString:v46 withString:&stru_10005B0F8];
        id v35 = [v30 initWithFormat:@"%@", v34];
        puts((const char *)[v35 UTF8String]);

        id v3 = v32;
        sub_10002F68C(v29);
      }
      id v26 = [v44 countByEnumeratingWithState:&v47 objects:v56 count:16];
    }
    while (v26);
  }
}

void sub_1000127E8(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) beSameUserAsSuggestd];
  id v4 = objc_opt_new();
  sub_10001A9E0([v3 count] == (id)1, @"createEntityStore PATH");
  id v5 = [v3 objectAtIndexedSubscript:0];
  id v6 = [v5 stringByAppendingPathComponent:@"Suggestions"];

  id v7 = +[NSFileManager defaultManager];
  id v24 = 0;
  [v7 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:&v24];
  id v8 = v24;

  if (v8)
  {
    id v17 = [objc_alloc((Class)NSString) initWithFormat:@"Error: %@", v8];
    puts((const char *)[v17 UTF8String]);

    exit(2);
  }
  id v9 = [v6 stringByAppendingPathComponent:@"entities.db"];
  uint64_t v10 = [v6 stringByAppendingPathComponent:@"snippets.db"];
  id v23 = 0;
  id v11 = [objc_alloc((Class)SGSqlEntityStore) initForRawDatabaseAccessWithEntityPath:v9 snippetsPath:v10 error:&v23];
  id v12 = v23;
  if (v12)
  {
    id v18 = [objc_alloc((Class)NSString) initWithFormat:@"Error: failed to initialize the store: %@", v12];
    puts((const char *)[v18 UTF8String]);

    exit(3);
  }
  if ([v11 configureMigratorThenMigrateToVersion:1] != (id)4)
  {
    id v19 = objc_alloc((Class)NSString);
    CFStringRef v20 = @"Error: failed to migrate manually to v1";
    goto LABEL_11;
  }
  if ([v11 migrateDatabases] != (id)1)
  {
    id v19 = objc_alloc((Class)NSString);
    CFStringRef v20 = @"Error: failed to fully migrate the db";
LABEL_11:
    id v21 = [v19 initWithFormat:v20];
    puts((const char *)[v21 UTF8String]);

    exit(4);
  }
  id v13 = objc_alloc((Class)NSString);
  long long v14 = v13;
  if (!v11)
  {
    id v22 = [v13 initWithFormat:@"Error: failed to instantiate the entity store. See syslog for details."];
    puts((const char *)[v22 UTF8String]);

    exit(5);
  }
  [v4 timeIntervalSinceNow];
  id v16 = [v14 initWithFormat:@"Created entity store at %@ in %0.2f seconds", v6, -v15];
  puts((const char *)[v16 UTF8String]);
}

void sub_100012AA0(uint64_t a1)
{
  [*(id *)(a1 + 32) beSameUserAsSuggestd];
  CFStringRef v2 = [*(id *)(a1 + 32) getEntityStore];
  id v3 = [v2 loadAllSerializedContacts];

  sub_10002A6C0(v3, 0);
}

void sub_100012B10(uint64_t a1)
{
  [*(id *)(a1 + 32) beSameUserAsSuggestd];
  id v2 = [*(id *)(a1 + 32) getEntityStore];
  [v2 updateSerializedContacts:0];
}

void sub_100012B6C(uint64_t a1)
{
  [*(id *)(a1 + 32) beSameUserAsSuggestd];
  id v2 = [*(id *)(a1 + 32) getEntityStore];
  id v3 = [v2 loadAllPrecomputedContactMatches];

  id v4 = [objc_alloc((Class)NSString) initWithFormat:@"Identifier\t\tMax ID\tEntity IDs"];
  puts((const char *)[v4 UTF8String]);

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v9);
        id v11 = objc_alloc((Class)NSString);
        id v12 = [v10 objectAtIndexedSubscript:0];
        id v13 = [v10 objectAtIndexedSubscript:1];
        long long v14 = [v10 objectAtIndexedSubscript:2];
        id v15 = [v11 initWithFormat:@"%@\t%@\t%@", v12, v13, v14];
        puts((const char *)[v15 UTF8String]);

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
}

void sub_100012D40(uint64_t a1)
{
  [*(id *)(a1 + 32) beSameUserAsSuggestd];
  id v2 = [*(id *)(a1 + 32) getEntityStore];
  [v2 updateCNContactMatches:0];
}

void sub_100012D9C(uint64_t a1)
{
  [*(id *)(a1 + 32) beSameUserAsSuggestd];
  id v1 = +[SGRTCLogging defaultLogger];
  [v1 resetLogs];
}

void sub_100012DEC(uint64_t a1)
{
  [*(id *)(a1 + 32) beSameUserAsSuggestd];
  id v1 = objc_alloc((Class)NSString);
  id v4 = +[SGRTCLogging defaultLogger];
  id v2 = [v4 loggedExtractionsDescription];
  id v3 = [v1 initWithFormat:@"%@", v2];
  puts((const char *)[v3 UTF8String]);
}

void sub_100012E88(uint64_t a1)
{
  [*(id *)(a1 + 32) beSameUserAsSuggestd];
  id v1 = objc_alloc((Class)NSString);
  id v4 = +[SGRTCLogging defaultLogger];
  id v2 = [v4 loggedInteractionsDescription];
  id v3 = [v1 initWithFormat:@"%@", v2];
  puts((const char *)[v3 UTF8String]);
}

void sub_100012F24(uint64_t a1)
{
  [*(id *)(a1 + 32) beSameUserAsSuggestd];
  id v1 = objc_alloc((Class)NSString);
  id v4 = +[SGRTCLogging defaultLogger];
  id v2 = [v4 loggedInteractionsSummaryDescription];
  id v3 = [v1 initWithFormat:@"%@", v2];
  puts((const char *)[v3 UTF8String]);
}

void sub_100012FC0(uint64_t a1)
{
  [*(id *)(a1 + 32) beSameUserAsSuggestd];
  id v1 = objc_alloc((Class)NSString);
  id v4 = +[SGRTCLogging defaultLogger];
  [v4 storeAge];
  id v3 = objc_msgSend(v1, "initWithFormat:", @"Store age: %ld seconds", (uint64_t)v2);
  puts((const char *)[v3 UTF8String]);
}

void sub_100013054(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_10001A9E0([v3 count] == (id)1, @"parseMicrodataToJson FILEPATH (.eml or .html)");
  uint64_t v30 = a1;
  uint64_t v27 = v3;
  [*(id *)(a1 + 40) filesFromArgs:v3];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v34;
    id v7 = &CFPreferencesCopyKeyList_ptr;
    uint64_t v8 = &CFPreferencesCopyKeyList_ptr;
    do
    {
      id v9 = 0;
      id v28 = v5;
      do
      {
        if (*(void *)v34 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v33 + 1) + 8 * (void)v9);
        id v12 = [v7[245] dataWithContentsOfFile:v10];
        if (v12)
        {
          id v13 = (*(void (**)(void))(*(void *)(v30 + 32) + 16))();
          id v14 = [v13 first];

          if (v14)
          {
            id v31 = v11;
            id v15 = v8;
            uint64_t v16 = v6;
            long long v17 = v7;
            long long v18 = [v14 htmlBody];
            id v32 = 0;
            long long v19 = +[SGMicrodataToJsonParser parseMicrodataToJsonLd:v18 error:&v32];
            id v20 = v32;

            if (v20)
            {
              id v21 = sgLogHandle();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
              {
                id v25 = [v20 localizedDescription];
                *(_DWORD *)buf = 138412290;
                id v38 = v25;
                _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Unable to parse Microdata to JSON-LD. Error: %@", buf, 0xCu);
              }
              uint64_t v8 = v15;
              id v22 = objc_alloc((Class)v15[274]);
              CFStringRef v23 = &stru_10005B0F8;
            }
            else
            {
              uint64_t v8 = v15;
              id v22 = objc_alloc((Class)v15[274]);
              id v26 = v19;
              CFStringRef v23 = @"%@";
            }
            id v24 = objc_msgSend(v22, "initWithFormat:", v23, v26);
            puts((const char *)[v24 UTF8String]);

            id v7 = v17;
            uint64_t v6 = v16;
            id v5 = v28;
            id v11 = v31;
          }
          else
          {
            id v20 = [objc_alloc((Class)v8[274]) initWithFormat:@"ERROR: failed to retrieve Message: %@", v12];
            puts((const char *)[v20 UTF8String]);
          }
        }
        else
        {
          id v14 = [objc_alloc((Class)v8[274]) initWithFormat:@"ERROR: failed to read contentsOfFile:%@", v10];
          puts((const char *)[v14 UTF8String]);
        }

        id v9 = (char *)v9 + 1;
      }
      while (v5 != v9);
      id v5 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v5);
  }
}

void sub_100013388(uint64_t a1, void *a2)
{
  id v6 = a2;
  sub_10001A9E0([v6 count] != 0, @"addMessage MESSAGE_FILE ...");
  [*(id *)(a1 + 32) beSameUserAsSuggestd];
  id v4 = [*(id *)(a1 + 32) searchableItemsFromArgs:v6];
  id v5 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Adding %lu messages", objc_msgSend(v4, "count"));
  puts((const char *)[v5 UTF8String]);

  [*(id *)(a1 + 32) addSearchableItems:v4];
}

void sub_100013468(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_10001A9E0([v3 count] == (id)1, @"acceptAllFromMessage MESSAGE_FILE");
  [*(id *)(a1 + 32) beSameUserAsSuggestd];
  id v4 = [*(id *)(a1 + 32) searchableItemsFromArgs:v3];
  uint64_t v27 = [v4 firstObject];

  id v5 = v27;
  if (!v27)
  {
    id v21 = +[NSAssertionHandler currentHandler];
    [v21 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"suggest_tool.m", 3524, @"Invalid parameter not satisfying: %@", @"searchableItem" object file lineNumber description];

    id v5 = 0;
  }
  id v6 = *(void **)(a1 + 32);
  long long v49 = v5;
  id v7 = +[NSArray arrayWithObjects:&v49 count:1];
  [v6 addSearchableItems:v7];

  uint64_t v42 = 0;
  id v43 = &v42;
  uint64_t v44 = 0x3032000000;
  id v45 = sub_100006C74;
  id v46 = sub_100006C84;
  id v47 = 0;
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x3032000000;
  id v39 = sub_100006C74;
  id v40 = sub_100006C84;
  id v41 = 0;
  uint64_t v8 = +[SGSuggestionsService serviceForMail];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10002EB58;
  v32[3] = &unk_100058DB0;
  long long v34 = &v36;
  long long v35 = &v42;
  dispatch_semaphore_t dsema = dispatch_semaphore_create(0);
  long long v33 = dsema;
  id v24 = v8;
  [v8 harvestedSuggestionsFromSearchableItem:v27 options:3 withCompletion:v32];
  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  if (v43[5])
  {
    id v22 = objc_alloc((Class)NSString);
    id v23 = [v22 initWithFormat:@"Error! %@", v43[5]];
    puts((const char *)[v23 UTF8String]);

    exit(1);
  }
  id v9 = objc_alloc((Class)NSString);
  id v10 = objc_msgSend(v9, "initWithFormat:", @"Found %d suggestions", objc_msgSend( (id) v37[5], "count"));
  puts((const char *)[v10 UTF8String]);

  [*(id *)(a1 + 32) confirmSuggestions:v37[5]];
  id v11 = objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v12 = (id)v37[5];
  uint64_t v13 = 0;
  id v14 = [v12 countByEnumeratingWithState:&v28 objects:v48 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v29;
    do
    {
      for (id i = 0; i != v14; id i = (char *)i + 1)
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v18 = [v17 event];
          long long v19 = [v18 toEKEventWithStore:v11];
          [v11 acceptSuggestedEvent:v19];

          uint64_t v13 = (v13 + 1);
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            continue;
          }
          id v18 = [objc_alloc((Class)NSString) initWithFormat:@"Unknown suggestion type..."];
          puts((const char *)[v18 UTF8String]);
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v28 objects:v48 count:16];
    }
    while (v14);
  }

  id v20 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Accepted %d suggestions as calendar events", v13);
  puts((const char *)[v20 UTF8String]);

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);
}

void sub_10001391C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
}

void sub_100013968(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_10001A9E0([v3 count] == 0, @"contactMatchesWithMeContact");
  [*(id *)(a1 + 32) beSameUserAsSuggestd];
  v30[0] = CNContactGivenNameKey;
  v30[1] = CNContactMiddleNameKey;
  v30[2] = CNContactFamilyNameKey;
  v30[3] = CNContactPhoneNumbersKey;
  v30[4] = CNContactEmailAddressesKey;
  v30[5] = CNContactPostalAddressesKey;
  v30[6] = CNContactSocialProfilesKey;
  v30[7] = CNContactBirthdayKey;
  id v4 = +[CNContactFormatter descriptorForRequiredKeysForStyle:0];
  v30[8] = v4;
  id v5 = +[NSArray arrayWithObjects:v30 count:9];

  id v6 = +[SGContactStoreFactory contactStore];
  id v29 = 0;
  id v7 = [v6 _crossPlatformUnifiedMeContactWithKeysToFetch:v5 error:&v29];
  id v8 = v29;
  id v9 = v8;
  if (v7)
  {

    uint64_t v23 = 0;
    id v24 = &v23;
    uint64_t v25 = 0x3032000000;
    id v26 = sub_100006C74;
    uint64_t v27 = sub_100006C84;
    id v28 = 0;
    uint64_t v17 = 0;
    id v18 = &v17;
    uint64_t v19 = 0x3032000000;
    id v20 = sub_100006C74;
    id v21 = sub_100006C84;
    id v22 = 0;
    id v10 = +[SGSuggestionsService serviceForContacts];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10002B2A8;
    v13[3] = &unk_100058DB0;
    uint64_t v15 = &v17;
    uint64_t v16 = &v23;
    id v11 = dispatch_semaphore_create(0);
    id v14 = v11;
    [v10 contactMatchesWithContact:v7 limitTo:10000 withCompletion:v13];
    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
    sub_10002AB40((void *)v18[5], (void *)v24[5]);

    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v23, 8);
  }
  else
  {
    id v12 = [objc_alloc((Class)NSString) initWithFormat:@"Error fetching me contact: %@", v8];
    puts((const char *)[v12 UTF8String]);
  }
}

void sub_100013C80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100013CB0(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_10001A9E0([v3 count] == 0, @"contactMatchesWithPeopleWhoShareMyName");
  [*(id *)(a1 + 32) beSameUserAsSuggestd];
  v38[0] = CNContactGivenNameKey;
  v38[1] = CNContactMiddleNameKey;
  v38[2] = CNContactFamilyNameKey;
  id v4 = +[NSArray arrayWithObjects:v38 count:3];
  id v5 = +[SGContactStoreFactory contactStore];
  id v37 = 0;
  id v6 = [v5 _crossPlatformUnifiedMeContactWithKeysToFetch:v4 error:&v37];
  id v7 = v37;
  if (v7 || !v6)
  {
    id v8 = [objc_alloc((Class)NSString) initWithFormat:@"Error fetching me contact: %@", v7];
    puts((const char *)[v8 UTF8String]);
  }
  id v9 = objc_opt_new();
  uint64_t v10 = [v6 givenName];
  uint64_t v11 = (void *)v10;
  if (v10) {
    CFStringRef v12 = (const __CFString *)v10;
  }
  else {
    CFStringRef v12 = &stru_10005B0F8;
  }
  [v9 setGivenName:v12];

  uint64_t v13 = [v6 middleName];
  uint64_t v14 = (void *)v13;
  if (v13) {
    CFStringRef v15 = (const __CFString *)v13;
  }
  else {
    CFStringRef v15 = &stru_10005B0F8;
  }
  [v9 setMiddleName:v15];

  uint64_t v16 = [v6 familyName];
  uint64_t v17 = (void *)v16;
  if (v16) {
    CFStringRef v18 = (const __CFString *)v16;
  }
  else {
    CFStringRef v18 = &stru_10005B0F8;
  }
  [v9 setFamilyName:v18];

  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x3032000000;
  long long v34 = sub_100006C74;
  long long v35 = sub_100006C84;
  id v36 = 0;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = sub_100006C74;
  id v29 = sub_100006C84;
  id v30 = 0;
  uint64_t v19 = +[SGSuggestionsService serviceForContacts];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10002B20C;
  v21[3] = &unk_100058DB0;
  uint64_t v23 = &v25;
  id v24 = &v31;
  id v20 = dispatch_semaphore_create(0);
  id v22 = v20;
  [v19 contactMatchesWithContact:v9 limitTo:10000 withCompletion:v21];
  dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
  sub_10002AB40((void *)v26[5], (void *)v32[5]);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);
}

void sub_100013FEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10001401C(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_10001A9E0([v3 count] == (id)1, @"geocodeFromRFC822 FILEPATH");
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100027B78;
  v5[3] = &unk_1000591B0;
  id v6 = v3;
  long long v7 = *(_OWORD *)(a1 + 32);
  id v4 = v3;
  [(id)v7 allowPastAndCancelledEventsWithBlock:v5];
}

void sub_1000140DC(uint64_t a1, void *a2)
{
  id v27 = a2;
  id v3 = [objc_alloc((Class)NSString) initWithFormat:@"Getting all deliveries"];
  puts((const char *)[v3 UTF8String]);

  [*(id *)(a1 + 32) beSameUserAsSuggestd];
  uint64_t v42 = 0;
  id v43 = &v42;
  uint64_t v44 = 0x3032000000;
  id v45 = sub_100006C74;
  id v46 = sub_100006C84;
  id v47 = 0;
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x3032000000;
  id v39 = sub_100006C74;
  id v40 = sub_100006C84;
  id v41 = 0;
  id v4 = +[SGSuggestionsService serviceForDeliveries];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100026560;
  v32[3] = &unk_100058DB0;
  long long v34 = &v36;
  long long v35 = &v42;
  dispatch_semaphore_t dsema = dispatch_semaphore_create(0);
  uint64_t v33 = dsema;
  id v28 = v4;
  [v4 allDeliveriesWithLimit:10000 withCompletion:v32];
  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  id v5 = (void *)v43[5];
  id v29 = (id)v37[5];
  id v30 = v5;
  if (v30)
  {
    id v6 = [objc_alloc((Class)NSString) initWithFormat:@"Error! %@", v30];
    puts((const char *)[v6 UTF8String]);

    id v7 = [objc_alloc((Class)NSString) initWithFormat:&stru_10005B0F8];
    id v8 = (const char *)[v7 UTF8String];
  }
  else
  {
    int v9 = byte_10006A7B8;
    id v10 = objc_alloc((Class)NSString);
    if (v9)
    {
      uint64_t v11 = sub_10001B094(v29);
      id v12 = [v10 initWithFormat:@"%@", v11];
      puts((const char *)[v12 UTF8String]);

      id v7 = [objc_alloc((Class)NSString) initWithFormat:&stru_10005B0F8];
      id v8 = (const char *)[v7 UTF8String];
    }
    else
    {
      id v13 = objc_msgSend(v10, "initWithFormat:", @"Found deliveries: %lu\n", objc_msgSend(v29, "count"));
      puts((const char *)[v13 UTF8String]);

      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v14 = v29;
      id v15 = [v14 countByEnumeratingWithState:&v48 objects:v52 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v49;
        do
        {
          for (id i = 0; i != v15; id i = (char *)i + 1)
          {
            if (*(void *)v49 != v16) {
              objc_enumerationMutation(v14);
            }
            int v18 = byte_10006A7B8;
            id v19 = *(id *)(*((void *)&v48 + 1) + 8 * i);
            id v20 = objc_alloc((Class)NSString);
            if (v18)
            {
              id v21 = sub_10001B094(v19);

              id v22 = [v20 initWithFormat:@"%@", v21];
              puts((const char *)[v22 UTF8String]);
            }
            else
            {
              id v21 = objc_msgSend((id)objc_opt_class(), "stringForProvider:", objc_msgSend(v19, "provider"));
              sub_100006034(v21);
              id v22 = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v23 = [v19 trackingNumber];
              id v24 = [v19 parentURL];

              uint64_t v25 = [v24 absoluteString];
              id v26 = [v20 initWithFormat:@"%@: %@ <%@>", v22, v23, v25];
              puts((const char *)[v26 UTF8String]);
            }
          }
          id v15 = [v14 countByEnumeratingWithState:&v48 objects:v52 count:16];
        }
        while (v15);
      }

      id v7 = [objc_alloc((Class)NSString) initWithFormat:&stru_10005B0F8];
      id v8 = (const char *)[v7 UTF8String];
    }
  }
  puts(v8);

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);
}

void sub_1000145DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_100014614(uint64_t a1)
{
  [*(id *)(a1 + 32) beSameUserAsSuggestd];
  id v1 = +[SGContactStoreFactory contactStore];
  id v2 = objc_alloc((Class)CNContactFetchRequest);
  v9[0] = CNContactGivenNameKey;
  v9[1] = CNContactMiddleNameKey;
  v9[2] = CNContactFamilyNameKey;
  v9[3] = CNContactEmailAddressesKey;
  v9[4] = CNContactPhoneNumbersKey;
  v9[5] = CNContactPostalAddressesKey;
  v9[6] = CNContactSocialProfilesKey;
  v9[7] = CNContactBirthdayKey;
  id v3 = +[NSArray arrayWithObjects:v9 count:8];
  id v4 = [v2 initWithKeysToFetch:v3];

  id v8 = 0;
  unsigned __int8 v5 = [v1 enumerateContactsWithFetchRequest:v4 error:&v8 usingBlock:&stru_100059B58];
  id v6 = v8;
  if ((v5 & 1) == 0)
  {
    id v7 = [objc_alloc((Class)NSString) initWithFormat:@"Failed to dump CNContactStore: %@", v6];
    puts((const char *)[v7 UTF8String]);
  }
}

void sub_1000147A4(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_10001A9E0([v3 count] == (id)1, @"setMessagesToProcessImmediately N");
  [*(id *)(a1 + 32) beSameUserAsSuggestd];
  id v4 = +[SGPreferenceStorage messagesToProcessImmediately];
  unsigned __int8 v5 = [v3 objectAtIndexedSubscript:0];

  id v6 = [v5 integerValue];
  +[SGPreferenceStorage setMessagesToProcessImmediately:v6];
  id v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Message count set to %li (was %li)", v6, v4);
  puts((const char *)[v7 UTF8String]);
}

void sub_100014880(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (([v5 isEqual:&__NSArray0__struct] & 1) == 0)
  {
    id v4 = [objc_alloc((Class)NSString) initWithFormat:@"Error: dirtyTest does not accept any arguments."];
    puts((const char *)[v4 UTF8String]);

    exit(1);
  }
  [*(id *)(a1 + 32) beSameUserAsSuggestd];
  id v3 = +[SGSuggestionsService serviceForInternal];
  [v3 keepDirty:1];
  sleep(1u);
  [v3 keepDirty:0];
  sleep(1u);
  [v3 keepDirty:1];
}

void sub_100014958(uint64_t a1, void *a2)
{
  id v34 = a2;
  [*(id *)(a1 + 32) beSameUserAsSuggestd];
  [*(id *)(a1 + 32) getEntityStore];
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_100022498;
  v56[3] = &unk_100059CE8;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v57 = v3;
  id v4 = objc_retainBlock(v56);
  [v3 allContactsWithSnippets:1 limitTo:10000];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v37 = [v5 countByEnumeratingWithState:&v52 objects:v60 count:16];
  id obj = v5;
  if (!v37)
  {

LABEL_22:
    puts("--- AMBIGUOUS PSEUDOCONTACT GROUPS (MERGED) ---\n(None detected.)\n\n");
    goto LABEL_23;
  }
  char v6 = 0;
  uint64_t v36 = *(void *)v53;
  do
  {
    for (id i = 0; i != v37; id i = (char *)i + 1)
    {
      if (*(void *)v53 != v36) {
        objc_enumerationMutation(obj);
      }
      id v8 = *(void **)(*((void *)&v52 + 1) + 8 * i);
      id v10 = [v8 recordId];
      uint64_t v11 = ((void (*)(void *, void *))v4[2])(v4, v10);

      id v12 = [v8 recordId];
      id v13 = [v3 contactIdsMergedWithMasterEntityId:v12];

      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472;
      v49[2] = sub_100022568;
      v49[3] = &unk_100059D10;
      long long v51 = v4;
      id v14 = v11;
      id v50 = v14;
      id v15 = +[SGFn mapAndFilter:v13 f:v49];
      if ([v15 count])
      {
        id v39 = v9;
        uint64_t v16 = v4;
        id v17 = v3;
        if ((v6 & 1) == 0) {
          puts("--- AMBIGUOUS PSEUDOCONTACT GROUPS (MERGED) ---\nsuggestd decided that each one of the following groups of pseudocontacts\nprobably corresponds to a single person, and merged each group together.\nDid suggestd incorrectly merge *different* people?  File a radar against\nPurple Suggestions | suggestd .\n\n");
        }
        puts("------------------------------------------");
        sub_100022874(v14, 1);
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v18 = v15;
        id v19 = [v18 countByEnumeratingWithState:&v45 objects:v59 count:16];
        if (v19)
        {
          id v20 = v19;
          uint64_t v21 = *(void *)v46;
          do
          {
            for (j = 0; j != v20; j = (char *)j + 1)
            {
              if (*(void *)v46 != v21) {
                objc_enumerationMutation(v18);
              }
              sub_100022874(*(void **)(*((void *)&v45 + 1) + 8 * (void)j), 1);
            }
            id v20 = [v18 countByEnumeratingWithState:&v45 objects:v59 count:16];
          }
          while (v20);
        }

        puts("------------------------------------------\n\n");
        char v6 = 1;
        id v3 = v17;
        id v4 = v16;
        int v9 = v39;
      }
    }
    id v5 = obj;
    id v37 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
  }
  while (v37);

  if ((v6 & 1) == 0) {
    goto LABEL_22;
  }
LABEL_23:
  uint64_t v23 = [v3 unmergedCandidatesLimitedTo:10000];
  if ([v23 count])
  {
    puts("\n\n--- AMBIGUOUS PSEUDOCONTACT GROUPS (NOT MERGED) ---\nsuggestd decided that each of the following groups of pseudocontacts\nprobably contain *different* people, and chose NOT to merge those groups.\nDid suggestd fail to merge two pseudocontacts who represent the same person?\nFile a radar against Purple Suggestions | suggestd .\n\n");
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v38 = v23;
    id v40 = v23;
    id v24 = [v40 countByEnumeratingWithState:&v41 objects:v58 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v42;
      do
      {
        for (k = 0; k != v25; k = (char *)k + 1)
        {
          if (*(void *)v42 != v26) {
            objc_enumerationMutation(v40);
          }
          id v28 = *(void **)(*((void *)&v41 + 1) + 8 * (void)k);
          id v30 = [v28 first];
          uint64_t v31 = [v3 suggestContactByRecordId:v30];

          id v32 = [v28 second];
          uint64_t v33 = [v3 suggestContactByRecordId:v32];

          puts("------------------------------------------");
          sub_100022874(v31, 1);
          sub_100022874(v33, 1);
          puts("------------------------------------------\n\n");
        }
        id v25 = [v40 countByEnumeratingWithState:&v41 objects:v58 count:16];
      }
      while (v25);
    }

    id v5 = obj;
    uint64_t v23 = v38;
  }
  else
  {
    puts("\n\n--- AMBIGUOUS PSEUDOCONTACT GROUPS (NOT MERGED) ---\n(None detected.)\n\n");
  }
}

void sub_100014E84(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_10001A9E0([v3 count] == (id)1, @"createRelatedCNContacts NUMBER");
  id v32 = v3;
  id v4 = [v3 objectAtIndexedSubscript:0];
  id v5 = [v4 integerValue];

  [*(id *)(a1 + 32) beSameUserAsSuggestd];
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x3032000000;
  v47[3] = sub_100006C74;
  v47[4] = sub_100006C84;
  id v48 = 0;
  uint64_t v41 = 0;
  long long v42 = &v41;
  uint64_t v43 = 0x3032000000;
  long long v44 = sub_100006C74;
  long long v45 = sub_100006C84;
  id v46 = 0;
  char v6 = +[SGSuggestionsService serviceForContacts];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1000223FC;
  v37[3] = &unk_100058DB0;
  id v39 = &v41;
  id v40 = v47;
  id v7 = dispatch_semaphore_create(0);
  uint64_t v38 = v7;
  id v34 = v6;
  [v6 allContactsWithSnippets:1 limitTo:10000 withCompletion:v37];
  uint64_t v33 = v7;
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  id v8 = [(id)v42[5] count];
  if (v5 >= v8) {
    unint64_t v9 = (unint64_t)v8;
  }
  else {
    unint64_t v9 = (unint64_t)v5;
  }
  id v10 = sgShuffledArrayFrom();
  long long v35 = objc_opt_new();
  if (v9)
  {
    unint64_t v11 = 0;
    unint64_t v12 = 0;
    while (1)
    {
      if (v11 >= (unint64_t)[v10 count]) {
        goto LABEL_14;
      }
      id v14 = [v10 objectAtIndexedSubscript:v11];
      id v15 = [v14 name];
      uint64_t v16 = [v15 firstName];
      if (!v16) {
        goto LABEL_10;
      }
      id v17 = [v14 name];
      id v18 = [v17 lastName];
      BOOL v19 = v18 == 0;

      if (!v19) {
        break;
      }
LABEL_11:

      ++v11;
      if (v12 >= v9) {
        goto LABEL_14;
      }
    }
    id v15 = objc_opt_new();
    [v15 setContactType:0];
    id v20 = [v14 name];
    uint64_t v21 = [v20 firstName];
    [v15 setGivenName:v21];

    id v22 = [v14 name];
    uint64_t v23 = [v22 lastName];
    [v15 setFamilyName:v23];

    id v24 = objc_alloc((Class)NSString);
    id v25 = [v15 givenName];
    uint64_t v26 = [v15 familyName];
    id v27 = [v24 initWithFormat:@"Save CNContact %@ %@...", v25, v26];
    puts((const char *)[v27 UTF8String]);

    [v35 addContact:v15 toContainerWithIdentifier:0];
    ++v12;
LABEL_10:

    goto LABEL_11;
  }
  unint64_t v12 = 0;
LABEL_14:
  id v28 = +[SGContactStoreFactory contactStore];
  id v36 = 0;
  [v28 executeSaveRequest:v35 error:&v36];
  id v29 = v36;
  if (v29)
  {
    id v30 = [objc_alloc((Class)NSString) initWithFormat:@"Error saving CNContactStore changes: %@", v29];
    puts((const char *)[v30 UTF8String]);

    uint64_t v31 = sgLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v50 = v29;
      _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Error saving CNContactStore changes: %@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v31 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Created %lu new CNContacts.", v12);
    puts((const char *)[v31 UTF8String]);
  }

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(v47, 8);
}

void sub_100015354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1000153A8(uint64_t a1, void *a2)
{
  id v13 = a2;
  sub_10001A9E0([v13 count] == (id)1, @"addEmailToRecipientsFilter EMAIL");
  [*(id *)(a1 + 32) beSameUserAsSuggestd];
  uint64_t v3 = [*(id *)(a1 + 32) getEntityStore];
  if (!v3)
  {
    id v9 = objc_alloc((Class)NSString);
    CFStringRef v10 = @"Failed to instantiate SGSqlEntityStore.";
    goto LABEL_8;
  }
  id v4 = (void *)v3;
  id v5 = [v13 objectAtIndexedSubscript:0];
  char v6 = [v4 normalizeHandleForRecipientFilterAndRemoveFromDetailsCache:v5];

  if (!v6)
  {
    id v9 = objc_alloc((Class)NSString);
    uint64_t v12 = 0;
    CFStringRef v10 = @"Could not normalize email \"%@\".";
LABEL_8:
    id v11 = objc_msgSend(v9, "initWithFormat:", v10, v12);
    puts((const char *)[v11 UTF8String]);

    exit(1);
  }
  id v7 = [*(id *)(a1 + 32) getRecipientsFilter];
  [v7 add:v6];
  id v8 = [objc_alloc((Class)NSString) initWithFormat:@"Added %@", v6];
  puts((const char *)[v8 UTF8String]);
}

void sub_1000154FC(uint64_t a1, void *a2)
{
  id v16 = a2;
  sub_10001A9E0([v16 count] == (id)1, @"checkForEmailInRecipientsFilter EMAIL");
  [*(id *)(a1 + 32) beSameUserAsSuggestd];
  uint64_t v3 = [*(id *)(a1 + 32) getEntityStore];
  if (!v3)
  {
    id v12 = objc_alloc((Class)NSString);
    CFStringRef v13 = @"Failed to instantiate SGSqlEntityStore.";
    goto LABEL_11;
  }
  id v4 = (void *)v3;
  id v5 = [v16 objectAtIndexedSubscript:0];
  char v6 = [v4 normalizeHandleForRecipientFilterAndRemoveFromDetailsCache:v5];

  if (!v6)
  {
    id v12 = objc_alloc((Class)NSString);
    uint64_t v15 = 0;
    CFStringRef v13 = @"Could not normalize email \"%@\".";
LABEL_11:
    id v14 = objc_msgSend(v12, "initWithFormat:", v13, v15);
    puts((const char *)[v14 UTF8String]);

    exit(1);
  }
  id v7 = [*(id *)(a1 + 32) getRecipientsFilter];
  unsigned int v8 = [v7 exists:v6];
  id v9 = objc_alloc((Class)NSString);
  if (v8) {
    CFStringRef v10 = @"Yes, %@ is in recipients filter.";
  }
  else {
    CFStringRef v10 = @"No, %@ is not in recipients filter.";
  }
  id v11 = objc_msgSend(v9, "initWithFormat:", v10, v6);
  puts((const char *)[v11 UTF8String]);
}

void sub_100015664(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 beSameUserAsSuggestd];
  unsigned int v4 = +[SGPreferenceStorage showPastEvents];
  id v5 = [v3 isEqual:&off_100064890];

  +[SGPreferenceStorage setShowPastEvents:v5];
  id v6 = objc_alloc((Class)NSString);
  CFStringRef v7 = @"disable";
  if (v5) {
    CFStringRef v8 = @"enable";
  }
  else {
    CFStringRef v8 = @"disable";
  }
  if (v4) {
    CFStringRef v7 = @"enable";
  }
  id v9 = [v6 initWithFormat:@"showPastEvents set to %@ (was %@)", v8, v7];
  puts((const char *)[v9 UTF8String]);
}

void sub_100015738(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 beSameUserAsSuggestd];
  unsigned int v4 = +[SGPreferenceStorage alwaysShowCancelledEvents];
  id v5 = [v3 isEqual:&off_1000648A8];

  +[SGPreferenceStorage setAlwaysShowCancelledEvents:v5];
  id v6 = objc_alloc((Class)NSString);
  CFStringRef v7 = @"disable";
  if (v5) {
    CFStringRef v8 = @"enable";
  }
  else {
    CFStringRef v8 = @"disable";
  }
  if (v4) {
    CFStringRef v7 = @"enable";
  }
  id v9 = [v6 initWithFormat:@"setAlwaysShowCancelledEvents set to %@ (was %@)", v8, v7];
  puts((const char *)[v9 UTF8String]);
}

void sub_10001580C(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 beSameUserAsSuggestd];
  unsigned int v4 = +[SGPreferenceStorage onlyShowSignificantPseudoContacts];
  id v5 = [v3 isEqual:&off_1000648C0];

  +[SGPreferenceStorage setOnlyShowSignificantPseudoContacts:v5];
  id v6 = objc_alloc((Class)NSString);
  CFStringRef v7 = @"disable";
  if (v5) {
    CFStringRef v8 = @"enable";
  }
  else {
    CFStringRef v8 = @"disable";
  }
  if (v4) {
    CFStringRef v7 = @"enable";
  }
  id v9 = [v6 initWithFormat:@"setOnlyShowSignificantPseudoContacts set to %@ (was %@)", v8, v7];
  puts((const char *)[v9 UTF8String]);
}

void sub_1000158E0(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 beSameUserAsSuggestd];
  unsigned int v4 = +[SGPreferenceStorage onlyShowSignificantNLEvents];
  id v5 = [v3 isEqual:&off_1000648D8];

  +[SGPreferenceStorage setOnlyShowSignificantNLEvents:v5];
  id v6 = objc_alloc((Class)NSString);
  CFStringRef v7 = @"disable";
  if (v5) {
    CFStringRef v8 = @"enable";
  }
  else {
    CFStringRef v8 = @"disable";
  }
  if (v4) {
    CFStringRef v7 = @"enable";
  }
  id v9 = [v6 initWithFormat:@"setOnlyShowSignificantNLEvents set to %@ (was %@)", v8, v7];
  puts((const char *)[v9 UTF8String]);
}

void sub_1000159B4(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 beSameUserAsSuggestd];
  unsigned int v4 = +[SGPreferenceStorage allowAgeBasedPruning];
  id v5 = [v3 isEqual:&off_1000648F0];

  +[SGPreferenceStorage setAllowAgeBasedPruning:v5];
  id v6 = objc_alloc((Class)NSString);
  CFStringRef v7 = @"disable";
  if (v5) {
    CFStringRef v8 = @"enable";
  }
  else {
    CFStringRef v8 = @"disable";
  }
  if (v4) {
    CFStringRef v7 = @"enable";
  }
  id v9 = [v6 initWithFormat:@"setAllowAgeBasedPruning set to %@ (was %@)", v8, v7];
  puts((const char *)[v9 UTF8String]);
}

void sub_100015A88(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 beSameUserAsSuggestd];
  unsigned int v4 = +[SGPreferenceStorage useMLModelForContacts];
  id v5 = [v3 isEqual:&off_100064908];

  +[SGPreferenceStorage setUseMLModelForContacts:v5];
  id v6 = objc_alloc((Class)NSString);
  CFStringRef v7 = @"disable";
  if (v5) {
    CFStringRef v8 = @"enable";
  }
  else {
    CFStringRef v8 = @"disable";
  }
  if (v4) {
    CFStringRef v7 = @"enable";
  }
  id v9 = [v6 initWithFormat:@"setUseMLModelForContacts set to %@ (was %@)", v8, v7];
  puts((const char *)[v9 UTF8String]);
}

void sub_100015B5C(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 beSameUserAsSuggestd];
  unsigned int v4 = +[SGPreferenceStorage allowUnverifiedSourceForMarkup];
  id v5 = [v3 isEqual:&off_100064920];

  +[SGPreferenceStorage setAllowUnverifiedSourceForMarkup:v5];
  id v6 = objc_alloc((Class)NSString);
  CFStringRef v7 = @"disable";
  if (v5) {
    CFStringRef v8 = @"enable";
  }
  else {
    CFStringRef v8 = @"disable";
  }
  if (v4) {
    CFStringRef v7 = @"enable";
  }
  id v9 = [v6 initWithFormat:@"setAllowUnverifiedSourceForMarkup set to %@ (was %@)", v8, v7];
  puts((const char *)[v9 UTF8String]);
}

void sub_100015C30(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 beSameUserAsSuggestd];
  unsigned int v4 = +[SGPreferenceStorage allowAnyDomainForMarkup];
  id v5 = [v3 isEqual:&off_100064938];

  +[SGPreferenceStorage setAllowAnyDomainForMarkup:v5];
  id v6 = objc_alloc((Class)NSString);
  CFStringRef v7 = @"disable";
  if (v5) {
    CFStringRef v8 = @"enable";
  }
  else {
    CFStringRef v8 = @"disable";
  }
  if (v4) {
    CFStringRef v7 = @"enable";
  }
  id v9 = [v6 initWithFormat:@"setAllowAnyDomainForMarkup set to %@ (was %@)", v8, v7];
  puts((const char *)[v9 UTF8String]);
}

void sub_100015D04(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 beSameUserAsSuggestd];
  id v4 = +[SGPreferenceStorage harvestBudgetNumberOfOperations];
  id v5 = [v3 objectAtIndexedSubscript:0];

  id v6 = [v5 integerValue];
  +[SGPreferenceStorage setHarvestBudgetNumberOfOperations:v6];
  id v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"setHarvestBudgetNumberOfOperations set to %td (was %td)", v6, v4);
  puts((const char *)[v7 UTF8String]);
}

void sub_100015DC8(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 beSameUserAsSuggestd];
  +[SGPreferenceStorage harvestBudgetCPUTimeSeconds];
  uint64_t v5 = v4;
  id v6 = [v3 objectAtIndexedSubscript:0];

  [v6 doubleValue];
  double v8 = v7;

  +[SGPreferenceStorage setHarvestBudgetCPUTimeSeconds:v8];
  id v9 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"setHarvestBudgetCPUTimeSeconds set to %f (was %f)", *(void *)&v8, v5);
  puts((const char *)[v9 UTF8String]);
}

void sub_100015E94(uint64_t a1, void *a2)
{
  id v65 = a2;
  sub_10001A9E0([v65 count] == 0, @"sanityCheckDaemonConnection (no arguments)");
  [*(id *)(a1 + 32) beSameUserAsSuggestd];
  id v3 = +[SGSuggestionsService serviceForInternal];
  uint64_t v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  uint64_t v87 = 0;
  uint64_t v88 = (id *)&v87;
  uint64_t v89 = 0x2020000000;
  LODWORD(v90) = 0;
  v115[0] = _NSConcreteStackBlock;
  v115[1] = 3221225472;
  v115[2] = sub_1000218C8;
  v115[3] = &unk_100059DA0;
  id v117 = &v87;
  int8x16_t v118 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  uint64_t v5 = v4;
  id v116 = v5;
  id v6 = objc_retainBlock(v115);
  double v7 = objc_retainBlock(v6);

  _Block_object_dispose(&v87, 8);
  [v3 sleepWithCompletion:v7];

  dispatch_group_enter(v5);
  uint64_t v87 = 0;
  uint64_t v88 = (id *)&v87;
  uint64_t v89 = 0x2020000000;
  LODWORD(v90) = 0;
  v111[0] = _NSConcreteStackBlock;
  v111[1] = 3221225472;
  v111[2] = sub_1000219B0;
  v111[3] = &unk_100059DA0;
  id v113 = &v87;
  id v67 = (int8x16_t *)a1;
  int8x16_t v114 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  double v8 = v5;
  id v112 = v8;
  id v9 = objc_retainBlock(v111);
  CFStringRef v10 = objc_retainBlock(v9);

  _Block_object_dispose(&v87, 8);
  [v3 daemonExitWithCompletion:v10];

  dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v107 = 0;
  id v108 = (unsigned int *)&v107;
  uint64_t v109 = 0x2020000000;
  int v110 = 0;
  int v11 = 11;
  do
  {
    dispatch_group_enter(v8);
    uint64_t v87 = 0;
    uint64_t v88 = (id *)&v87;
    uint64_t v89 = 0x2020000000;
    LODWORD(v90) = 0;
    v102[0] = _NSConcreteStackBlock;
    v102[1] = 3221225472;
    v102[2] = sub_100021A98;
    v102[3] = &unk_100059DC8;
    int8x16_t v106 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
    v104 = &v87;
    id v105 = &v107;
    id v12 = v8;
    id v103 = v12;
    id v13 = [v102 copy];

    _Block_object_dispose(&v87, 8);
    [v3 sleepWithCompletion:v13];

    --v11;
  }
  while (v11);
  dispatch_group_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  unsigned int v14 = atomic_load(v108 + 6);
  if (v14 != 1)
  {
    id v57 = +[NSAssertionHandler currentHandler];
    [v57 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"suggest_tool.m", 4823, @"Invalid parameter not satisfying: %@", @"atomic_load(&throttles) == 1" object file lineNumber description];
  }
  dispatch_group_enter(v12);
  uint64_t v87 = 0;
  uint64_t v88 = (id *)&v87;
  uint64_t v89 = 0x2020000000;
  LODWORD(v90) = 0;
  v98[0] = _NSConcreteStackBlock;
  v98[1] = 3221225472;
  v98[2] = sub_100021BA4;
  v98[3] = &unk_100059DA0;
  id v100 = &v87;
  int8x16_t v101 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  uint64_t v15 = v12;
  id v99 = v15;
  id v16 = objc_retainBlock(v98);
  id v17 = objc_retainBlock(v16);

  _Block_object_dispose(&v87, 8);
  [v3 sleepWithCompletion:v17];

  dispatch_group_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  int v18 = 10;
  do
  {
    dispatch_group_enter(v15);
    uint64_t v87 = 0;
    uint64_t v88 = (id *)&v87;
    uint64_t v89 = 0x2020000000;
    LODWORD(v90) = 0;
    v93[0] = _NSConcreteStackBlock;
    v93[1] = 3221225472;
    v93[2] = sub_100021C8C;
    v93[3] = &unk_100059DF0;
    v96 = &v87;
    int8x16_t v97 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
    id v19 = v3;
    id v94 = v19;
    id v20 = v15;
    id v95 = v20;
    id v21 = [v93 copy];

    _Block_object_dispose(&v87, 8);
    [v19 sleepWithCompletion:v21];

    --v18;
  }
  while (v18);
  dispatch_group_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v87 = 0;
  uint64_t v88 = (id *)&v87;
  uint64_t v89 = 0x3032000000;
  id v90 = sub_100006C74;
  id v91 = sub_100006C84;
  id v92 = 0;
  +[NSDate timeIntervalSinceReferenceDate];
  double v23 = v22;
  while (1)
  {
    id v24 = v88 + 5;
    id obj = v88[5];
    [v19 sleep:&obj];
    objc_storeStrong(v24, obj);
    id v25 = v88;
    if (!v88[5]) {
      break;
    }
    +[NSDate timeIntervalSinceReferenceDate];
    if (v26 - v23 >= 10.0)
    {
      id v25 = v88;
      if (v88[5])
      {
        id v64 = [objc_alloc((Class)NSString) initWithFormat:@"Timed out while waiting for launchd to stop throttling for synchronous API tests"];
        puts((const char *)[v64 UTF8String]);

        exit(1);
      }
      break;
    }
  }
  id v85 = 0;
  [v19 sleep:&v85];
  objc_storeStrong(v25 + 5, v85);
  if (v88[5])
  {
    id v58 = +[NSAssertionHandler currentHandler];
    [v58 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"suggest_tool.m", 4864, @"%@", v88[5] object file lineNumber description];
  }
  id v27 = dispatch_get_global_queue(25, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100021DD8;
  block[3] = &unk_100059E18;
  id v28 = v19;
  id v83 = v28;
  unint64_t v84 = &v87;
  dispatch_group_async(v20, v27, block);

  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472;
  v80[2] = sub_100021E24;
  v80[3] = &unk_100059E40;
  id v29 = v28;
  id v81 = v29;
  dispatch_group_async(v20, v27, v80);

  usleep(0x493E0u);
  [v29 daemonExit:0];
  unint64_t v66 = v29;
  dispatch_group_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
  id v30 = v88;
  id v31 = v88[5];
  if (!v31)
  {
    id v59 = +[NSAssertionHandler currentHandler];
    [v59 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"suggest_tool.m", 4875, @"Invalid parameter not satisfying: %@", @"err" object file lineNumber description];

    id v30 = v88;
    id v31 = v88[5];
  }
  v30[5] = 0;

  [v29 setSyncTimeout:99999.0];
  id v32 = v88 + 5;
  id v79 = v88[5];
  [v66 sleep:&v79];
  objc_storeStrong(v32, v79);
  if (v88[5])
  {
    int v60 = +[NSAssertionHandler currentHandler];
    [v60 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"suggest_tool.m", 4881, @"%@", v88[5] object file lineNumber description];
  }
  [v66 setSyncTimeout:INFINITY];
  uint64_t v33 = v88 + 5;
  id v78 = v88[5];
  [v66 sleep:&v78];
  objc_storeStrong(v33, v78);
  if (v88[5])
  {
    id v61 = +[NSAssertionHandler currentHandler];
    [v61 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"suggest_tool.m", 4884, @"%@", v88[5] object file lineNumber description];
  }
  [v66 setSyncTimeout:0.0];
  id v34 = v88 + 5;
  id v77 = v88[5];
  [v66 sleep:&v77];
  objc_storeStrong(v34, v77);
  if (!v88[5])
  {
    id v62 = +[NSAssertionHandler currentHandler];
    [v62 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"suggest_tool.m", 4887, @"Invalid parameter not satisfying: %@", @"err" object file lineNumber description];
  }
  [v66 daemonExit:0];
  [v66 setSyncTimeout:INFINITY];
  [v66 isEnabledWithError:0];
  [v66 setSyncTimeout:0.1];
  [v66 setQueuesRequestsIfBusy:1];
  id v35 = [objc_alloc((Class)NSMutableArray) initWithCapacity:11];
  int v36 = 11;
  do
  {
    [v35 addObject:&off_100064CB0];
    --v36;
  }
  while (v36);
  id v37 = +[NSDate date];
  for (int i = 0; i != 11; ++i)
  {
    dispatch_group_enter(v20);
    v75[0] = 0;
    v75[1] = v75;
    v75[2] = 0x2020000000;
    int v76 = 0;
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472;
    v68[2] = sub_100021E30;
    v68[3] = &unk_100059E68;
    id v72 = v75;
    int8x16_t v73 = vextq_s8(v67[2], v67[2], 8uLL);
    id v39 = v37;
    id v69 = v39;
    id v40 = v35;
    id v70 = v40;
    int v74 = i;
    uint64_t v41 = v20;
    id v71 = v41;
    id v42 = [v68 copy];

    _Block_object_dispose(v75, 8);
    [v66 sleepWithCompletion:v42];
  }
  dispatch_group_wait(v41, 0xFFFFFFFFFFFFFFFFLL);
  for (uint64_t j = 0; j != 10; ++j)
  {
    long long v44 = [v40 objectAtIndexedSubscript:j];
    [v44 doubleValue];
    if (v45 <= 0.6)
    {
    }
    else
    {
      id v46 = [v40 objectAtIndexedSubscript:j];
      [v46 doubleValue];
      double v48 = v47;

      if (v48 < 1.3) {
        continue;
      }
    }
    long long v49 = +[NSAssertionHandler currentHandler];
    uint64_t v51 = v67[2].i64[0];
    uint64_t v50 = v67[2].i64[1];
    long long v52 = [v40 objectAtIndexedSubscript:j];
    [v49 handleFailureInMethod:v50, v51, @"suggest_tool.m", 4919, @"expected target 0.7 (allow between 0.6 and 1.3), got %@", v52 object file lineNumber description];
  }
  long long v53 = [v40 objectAtIndexedSubscript:10];
  [v53 doubleValue];
  double v55 = v54;

  if (v55 <= 1.3)
  {
    id v63 = +[NSAssertionHandler currentHandler];
    [v63 handleFailureInMethod:v67[2].i64[1], v67[2].i64[0], @"suggest_tool.m", 4923, @"Invalid parameter not satisfying: %@", @"timeIntervals[10].doubleValue > 1.3" object file lineNumber description];
  }
  id v56 = [objc_alloc((Class)NSString) initWithFormat:@"All tests passed."];
  puts((const char *)[v56 UTF8String]);

  _Block_object_dispose(&v87, 8);
  _Block_object_dispose(&v107, 8);
}

void sub_100016AC8(_Unwind_Exception *a1)
{
}

void sub_100016B30(uint64_t a1, void *a2)
{
  sub_10001A9E0([a2 count] == 0, @"smokeTestXpcAutorelease (no arguments)");
  puts((const char *)[v3 UTF8String]);

  [*(id *)(a1 + 32) beSameUserAsSuggestd];
  uint64_t v4 = dispatch_group_create();
  for (uint64_t i = 0; ; ++i)
  {
    dispatch_group_enter(v4);
    double v7 = +[SGSuggestionsService serviceForInternal];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100021830;
    v14[3] = &unk_100059E90;
    int8x16_t v16 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
    uint64_t v17 = i;
    double v8 = v4;
    uint64_t v15 = v8;
    [v7 pingWithCompletion:v14];

    CFStringRef v10 = +[SGSuggestionsService serviceForInternal];
    id v13 = 0;
    [v10 ping:&v13];
    id v11 = v13;

    if (v11)
    {
      id v12 = +[NSAssertionHandler currentHandler];
      [v12 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"suggest_tool.m", 4943, @"\nSync error at iteration %tu: %@", i, v11 object file lineNumber description];
    }
    dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  }
}

void sub_100016CF4(uint64_t a1)
{
  [*(id *)(a1 + 32) beSameUserAsSuggestd];
  id v5 = +[SGSuggestionsService serviceForContacts];
  id v1 = [v5 registerContactsChangeObserver:&stru_100059ED0];
  id v2 = +[SGSuggestionsService serviceForEvents];
  id v3 = [v2 registerEventsChangeObserver:&stru_100059EF0];
  id v4 = [objc_alloc((Class)NSString) initWithFormat:@"Staying alive to monitor for Suggestions notifications...\n"];
  puts((const char *)[v4 UTF8String]);

  CFRunLoopRun();
}

void sub_100016DB4(uint64_t a1, void *a2)
{
  id v22 = a2;
  [*(id *)(a1 + 32) beSameUserAsSuggestd];
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x2020000000;
  int v32 = 0;
  id v3 = +[SGSuggestionsService serviceForContacts];
  id v4 = +[SGSuggestionsService serviceForEvents];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100021320;
  v26[3] = &unk_100059F58;
  id v27 = &stru_100059F30;
  id v28 = &v29;
  id v5 = [v3 registerContactsChangeObserver:v26];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000213A0;
  v23[3] = &unk_100059F58;
  id v24 = &stru_100059F30;
  id v25 = &v29;
  id v6 = [v4 registerEventsChangeObserver:v23];
  id v7 = [objc_alloc((Class)NSString) initWithFormat:@"Making sure that changes aren't triggered with nothing going on..."];
  puts((const char *)[v7 UTF8String]);

  double v8 = +[NSRunLoop currentRunLoop];
  id v9 = +[NSDate dateWithTimeIntervalSinceNow:5.0];
  [v8 runUntilDate:v9];

  if (*((_DWORD *)v30 + 6))
  {
    id v10 = objc_alloc((Class)NSString);
    id v11 = objc_msgSend(v10, "initWithFormat:", @"OH NO! Got notifications: %i", *((unsigned int *)v30 + 6));
  }
  else
  {
    id v11 = [objc_alloc((Class)NSString) initWithFormat:@"Done. No spurious changes."];
  }
  puts((const char *)[v11 UTF8String]);

  id v12 = [objc_alloc((Class)NSString) initWithFormat:@"Sending a message containing contact information, which we expect to trigger a notification..."];
  puts((const char *)[v12 UTF8String]);

  id v13 = [*(id *)(a1 + 32) messageFromArgs:&off_100064950];
  unsigned int v14 = *(void **)(a1 + 32);
  uint64_t v15 = [v14 searchableItemFromMessage:v13];
  uint64_t v33 = v15;
  int8x16_t v16 = +[NSArray arrayWithObjects:&v33 count:1];
  [v14 addSearchableItems:v16];

  uint64_t v17 = +[NSRunLoop currentRunLoop];
  int v18 = +[NSDate dateWithTimeIntervalSinceNow:5.0];
  [v17 runUntilDate:v18];

  id v19 = [objc_alloc((Class)NSString) initWithFormat:@"You should have seen notifications happen for new contacts, but not events. If that's not the case, then panic!"];
  puts((const char *)[v19 UTF8String]);

  if (([v4 deregisterEventsChangeObserverWithToken:v6] & 1) == 0)
  {
    id v20 = +[NSAssertionHandler currentHandler];
    [v20 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"suggest_tool.m" lineNumber:5015 description:@"Failed to deregister events notification"];
  }
  if (([v3 deregisterContactsChangeObserverWithToken:v5] & 1) == 0)
  {
    id v21 = +[NSAssertionHandler currentHandler];
    [v21 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"suggest_tool.m" lineNumber:5017 description:@"Failed to deregister contacts notification"];
  }
  _Block_object_dispose(&v29, 8);
}

void sub_1000171B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000171EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_10001A9E0([v3 count] == (id)1, @"Needs a single argument");
  id v4 = [v3 firstObject];
  id v5 = +[NSData dataWithContentsOfFile:v4];

  if (v5)
  {
    uint64_t v29 = a1;
    id v31 = v3;
    id v30 = v5;
    id v6 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:0];
    id v7 = +[NSUUID UUID];
    double v8 = [v7 UUIDString];
    id v9 = [@"permafailDissect-" stringByAppendingString:v8];

    id v28 = v6;
    id v10 = [v6 attributeSet];
    id v11 = [v10 emailHeaders];
    id v12 = [v11 mutableCopy];

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v13 = [v12 allKeys];
    id v14 = [v13 countByEnumeratingWithState:&v32 objects:v38 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v15; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v33 != v16) {
            objc_enumerationMutation(v13);
          }
          int v18 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          id v19 = [v18 lowercaseString];
          unsigned int v20 = [v19 isEqualToString:@"message-id"];

          if (v20)
          {
            id v37 = v9;
            id v21 = +[NSArray arrayWithObjects:&v37 count:1];
            [v12 setObject:v21 forKeyedSubscript:v18];
          }
        }
        id v15 = [v13 countByEnumeratingWithState:&v32 objects:v38 count:16];
      }
      while (v15);
    }

    id v22 = [v28 attributeSet];
    [v22 setEmailHeaders:v12];

    [v28 setUniqueIdentifier:v9];
    double v23 = *(void **)(v29 + 32);
    int v36 = v28;
    id v24 = +[NSArray arrayWithObjects:&v36 count:1];
    [v23 addSearchableItems:v24];

    id v5 = v30;
    id v3 = v31;
  }
  else
  {
    id v25 = objc_alloc((Class)NSString);
    double v26 = [v3 firstObject];
    id v27 = [v25 initWithFormat:@"Error: failed to load file: %@", v26];
    puts((const char *)[v27 UTF8String]);
  }
}

id sub_100017518(uint64_t a1)
{
  return [*(id *)(a1 + 32) registerTabCompletions];
}

void sub_100017520(uint64_t a1, void *a2)
{
  id v10 = a2;
  if (([v10 isEqual:&off_100064980] & 1) == 0
    && ([v10 isEqual:&off_100064998] & 1) == 0)
  {
    id v9 = [objc_alloc((Class)NSString) initWithFormat:@"Error: you must specify 0 (disable) or 1 (enable)"];
    puts((const char *)[v9 UTF8String]);

    exit(1);
  }
  [*(id *)(a1 + 32) beSameUserAsSuggestd];
  unsigned int v3 = +[SGPreferenceStorage useManateeSaltForHistory];
  id v4 = [v10 isEqual:&off_1000649B0];
  +[SGPreferenceStorage setUseManateeSaltForHistory:v4];
  id v5 = objc_alloc((Class)NSString);
  CFStringRef v6 = @"disable";
  if (v4) {
    CFStringRef v7 = @"enable";
  }
  else {
    CFStringRef v7 = @"disable";
  }
  if (v3) {
    CFStringRef v6 = @"enable";
  }
  id v8 = [v5 initWithFormat:@"useManateeSaltForHistory set to %@ (was %@)", v7, v6];
  puts((const char *)[v8 UTF8String]);
}

void sub_10001764C(uint64_t a1, void *a2)
{
  id v10 = a2;
  if (([v10 isEqual:&off_1000649C8] & 1) == 0
    && ([v10 isEqual:&off_1000649E0] & 1) == 0)
  {
    id v9 = [objc_alloc((Class)NSString) initWithFormat:@"Error: you must specify 0 (disable) or 1 (enable)"];
    puts((const char *)[v9 UTF8String]);

    exit(1);
  }
  [*(id *)(a1 + 32) beSameUserAsSuggestd];
  unsigned int v3 = +[SGPreferenceStorage showOperatingSystemVersionInSnippets];
  id v4 = [v10 isEqual:&off_1000649F8];
  +[SGPreferenceStorage setShowOperatingSystemVersionInSnippets:v4];
  id v5 = objc_alloc((Class)NSString);
  CFStringRef v6 = @"disable";
  if (v4) {
    CFStringRef v7 = @"enable";
  }
  else {
    CFStringRef v7 = @"disable";
  }
  if (v3) {
    CFStringRef v6 = @"enable";
  }
  id v8 = [v5 initWithFormat:@"showOperatingSystemVersionInSnippets set to %@ (was %@)", v7, v6];
  puts((const char *)[v8 UTF8String]);
}

void sub_100017778(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_10001A9E0([v3 count] != 0, @"miSalientMails [options]\n                                    -w               Shows top salient as the widget's last query\n                                    -m MAILBOX_ID    Shows top salient of this specific mailbox\n                                    -a               Shows top salient of any mailbox\n                                    -l LIMIT         Shows top salient up to this limit (default 10)\n");
  [*(id *)(a1 + 32) beSameUserAsSuggestd];
  int v60 = +[SGSqlEntityStore defaultStore];
  double v55 = v3;
  if ([v3 count])
  {
    id v56 = 0;
    id v4 = 0;
    uint64_t v5 = kLastMailboxCheckedForTopSGMISaliency;
    uint64_t v6 = kLastLimitCheckedForTopSGMISaliency;
    uint64_t v7 = 10;
    while (1)
    {
      id v8 = [v3 objectAtIndexedSubscript:v4];
      unsigned int v9 = [v8 isEqualToString:@"-w"];

      if (v9) {
        break;
      }
      id v14 = [v3 objectAtIndexedSubscript:v4];
      unsigned int v15 = [v14 isEqualToString:@"-m"];

      if (v15)
      {
        if ([v3 count] == v4)
        {
          id v49 = objc_alloc((Class)NSString);
          CFStringRef v50 = @"ERROR: -m option requires to be followed by the mailbox id";
          goto LABEL_35;
        }
        id v13 = [v3 objectAtIndexedSubscript:++v4];
        id v71 = v13;
        uint64_t v11 = +[NSArray arrayWithObjects:&v71 count:1];

        goto LABEL_9;
      }
      uint64_t v16 = [v3 objectAtIndexedSubscript:v4];
      unsigned int v17 = [v16 isEqualToString:@"-l"];

      if (!v17) {
        goto LABEL_11;
      }
      if ([v3 count] == v4)
      {
        id v49 = objc_alloc((Class)NSString);
        CFStringRef v50 = @"ERROR: -l option requires to be followed by an integer";
LABEL_35:
        id v51 = [v49 initWithFormat:v50];
        puts((const char *)[v51 UTF8String]);

LABEL_36:
        exit(1);
      }
      id v13 = [v3 objectAtIndexedSubscript:++v4];
      uint64_t v7 = (int)[v13 intValue];
LABEL_10:

LABEL_11:
      ++v4;
      id v3 = v55;
      if (v4 >= [v55 count]) {
        goto LABEL_17;
      }
    }
    id v10 = [v60 getNSStringForKey:v5];
    id v72 = v10;
    uint64_t v11 = +[NSArray arrayWithObjects:&v72 count:1];

    id v12 = [v60 getInt64NSNumberForKey:v6];
    if (!v12)
    {
      id v49 = objc_alloc((Class)NSString);
      CFStringRef v50 = @"ERROR: -w option was not able to read cached value of widget preferences (mailbox and limit)";
      goto LABEL_35;
    }
    id v13 = v12;
    uint64_t v7 = (uint64_t)[v12 integerValue];
LABEL_9:
    id v56 = (void *)v11;
    goto LABEL_10;
  }
  id v56 = 0;
  uint64_t v7 = 10;
LABEL_17:
  +[SGSuggestionsService serviceForMail];
  double v54 = v69 = 0;
  int v18 = [v54 sortedSaliencyResultsRestrictedToMailboxTypes:0 mailboxIds:v56 receivedOnOrAfter:0 ascending:0 limit:v7 error:&v69];
  id v19 = v69;
  id v20 = objc_alloc((Class)NSString);
  id v21 = v20;
  if (v19)
  {
    long long v52 = [v19 localizedDescription];
    id v53 = [v21 initWithFormat:@"ERROR: %@", v52];
    puts((const char *)[v53 UTF8String]);

    goto LABEL_36;
  }
  id v22 = [v20 initWithFormat:@"\n--- Top salient mails ranked by decayed saliency score ---\n"];
  puts((const char *)[v22 UTF8String]);

  id v23 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%-10s %-10s %-13s %-11s %-42s %-40s %-40s \n", "uniqueId", "isSalient", "decayedScore", "score", "sender", "creationDate", "subject");
  puts((const char *)[v23 UTF8String]);

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id obj = v18;
  id v61 = [obj countByEnumeratingWithState:&v65 objects:v70 count:16];
  if (v61)
  {
    uint64_t v59 = *(void *)v66;
    uint64_t v58 = MDItemSubject;
    do
    {
      for (uint64_t i = 0; i != v61; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v66 != v59) {
          objc_enumerationMutation(obj);
        }
        id v25 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        double v26 = [v25 messageId];
        id v27 = [v60 uniqueIdentifierForMessageId:v26];

        if (v27)
        {
          id v28 = +[SGMISpotlightUtility itemWithUniqueIdentifier:v27 error:0];
          uint64_t v29 = [v28 attributeSet];
          id v30 = [v29 authorEmailAddresses];

          id v31 = [v30 firstObject];
          long long v32 = [v28 attributeSet];
          long long v33 = [v32 attributeForKey:v58];
        }
        else
        {
          id v31 = 0;
          long long v33 = 0;
        }
        id v64 = [v25 creationDate];
        long long v34 = +[NSDateFormatter localizedStringFromDate:v64 dateStyle:1 timeStyle:1];
        id v62 = objc_alloc((Class)NSString);
        id v63 = v27;
        id v35 = [v63 UTF8String];
        if ([v25 isSalient]) {
          int v36 = "YES";
        }
        else {
          int v36 = "NO";
        }
        id v37 = [v25 decayedScore];
        [v37 doubleValue];
        uint64_t v39 = v38;
        id v40 = [v25 score];
        [v40 doubleValue];
        uint64_t v42 = v41;
        id v43 = v31;
        id v44 = [v43 UTF8String];
        id v45 = v34;
        id v46 = [v45 UTF8String];
        id v47 = v33;
        id v48 = objc_msgSend(v62, "initWithFormat:", @"%-10s %-10s %-13f %-11f %-42s %-40s %-40s", v35, v36, v39, v42, v44, v46, objc_msgSend(v47, "UTF8String"));
        puts((const char *)[v48 UTF8String]);
      }
      id v61 = [obj countByEnumeratingWithState:&v65 objects:v70 count:16];
    }
    while (v61);
  }
}

void sub_100017E3C(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_10001A9E0([v3 count] != 0, @"miMagicUnsubscribeCandidates [options]\n                -mc MIN_COUNT restricts the results to correlations that are backed on at this this number of mails\n                -ms MIN_SCORE number from 0 to 1 that reflect how likely the user will ignore this mail given a value (that we return) on the mentioned field\n                -l  LIMIT     set the maximum number of results to return.\n");
  [*(id *)(a1 + 32) beSameUserAsSuggestd];
  if ([v3 count])
  {
    id v4 = 0;
    uint64_t v48 = 20;
    double v5 = 0.9;
    uint64_t v47 = 50;
    while (1)
    {
      uint64_t v6 = [v3 objectAtIndexedSubscript:v4];
      unsigned int v7 = [v6 isEqualToString:@"-mc"];

      if (v7) {
        break;
      }
      unsigned int v9 = [v3 objectAtIndexedSubscript:v4];
      unsigned int v10 = [v9 isEqualToString:@"-ms"];

      if (v10)
      {
        if ([v3 count] == v4)
        {
          id v41 = objc_alloc((Class)NSString);
          CFStringRef v42 = @"ERROR: -ms option requires to be followed by the min score in range 0 to 1";
          goto LABEL_40;
        }
        id v8 = [v3 objectAtIndexedSubscript:++v4];
        [v8 doubleValue];
        double v5 = v11;
        goto LABEL_12;
      }
      id v12 = [v3 objectAtIndexedSubscript:v4];
      unsigned int v13 = [v12 isEqualToString:@"-l"];

      if (v13)
      {
        if ([v3 count] == v4)
        {
          id v41 = objc_alloc((Class)NSString);
          CFStringRef v42 = @"ERROR: -l option requires to be followed by an integer";
          goto LABEL_40;
        }
        id v8 = [v3 objectAtIndexedSubscript:++v4];
        uint64_t v47 = (int)[v8 intValue];
LABEL_12:
      }
      if (++v4 >= [v3 count]) {
        goto LABEL_16;
      }
    }
    if ([v3 count] == v4)
    {
      id v41 = objc_alloc((Class)NSString);
      CFStringRef v42 = @"ERROR: -mc requires to be followed by the min count";
LABEL_40:
      id v43 = [v41 initWithFormat:v42];
      puts((const char *)[v43 UTF8String]);

LABEL_36:
      exit(1);
    }
    id v8 = [v3 objectAtIndexedSubscript:++v4];
    uint64_t v48 = (int)[v8 intValue];
    goto LABEL_12;
  }
  uint64_t v47 = 50;
  double v5 = 0.9;
  uint64_t v48 = 20;
LABEL_16:
  id v46 = +[SGSuggestionsService serviceForMail];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v49 = [&off_100064A10 countByEnumeratingWithState:&v57 objects:v62 count:16];
  if (v49)
  {
    id v44 = v3;
    id v14 = 0;
    uint64_t v45 = *(void *)v58;
    while (1)
    {
      for (uint64_t i = 0; i != v49; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v58 != v45) {
          objc_enumerationMutation(&off_100064A10);
        }
        uint64_t v16 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        id v17 = [v16 integerValue];
        id v56 = 0;
        int v18 = [v46 sortedUnsubscriptionOpportunitiesForField:v17 minCount:v48 minScore:v47 limit:&v56 error:v5];
        id v19 = v56;

        if (v19)
        {
          id v38 = objc_alloc((Class)NSString);
          uint64_t v39 = [v19 localizedDescription];
          id v40 = [v38 initWithFormat:@"ERROR: %@", v39];
          puts((const char *)[v40 UTF8String]);

          goto LABEL_36;
        }
        id v14 = v18;
        if ([v18 count])
        {
          CFStringRef v50 = i;
          id v20 = objc_alloc((Class)NSString);
          id v21 = +[SGMailIntelligenceUnsubscriptionRule prettyNameForUnsubscriptionRuleField:](SGMailIntelligenceUnsubscriptionRule, "prettyNameForUnsubscriptionRuleField:", [v16 unsignedCharValue]);
          id v22 = [v20 initWithFormat:@"\n--- You might want to magic unsubscribe from those %@ ---", v21];
          puts((const char *)[v22 UTF8String]);

          id v23 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%-50s %-10s %-10s", "value", "count", "score");
          puts((const char *)[v23 UTF8String]);

          long long v54 = 0u;
          long long v55 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          id v51 = v18;
          id v24 = v18;
          id v25 = [v24 countByEnumeratingWithState:&v52 objects:v61 count:16];
          if (v25)
          {
            id v26 = v25;
            uint64_t v27 = *(void *)v53;
            do
            {
              for (uint64_t j = 0; j != v26; uint64_t j = (char *)j + 1)
              {
                if (*(void *)v53 != v27) {
                  objc_enumerationMutation(v24);
                }
                uint64_t v29 = *(void **)(*((void *)&v52 + 1) + 8 * (void)j);
                id v30 = objc_alloc((Class)NSString);
                id v31 = [v29 value];
                id v32 = [v31 UTF8String];
                long long v33 = [v29 mailCount];
                id v34 = [v33 intValue];
                id v35 = [v29 score];
                [v35 doubleValue];
                id v37 = objc_msgSend(v30, "initWithFormat:", @"%-50s %-10d %-10f", v32, v34, v36);
                puts((const char *)[v37 UTF8String]);
              }
              id v26 = [v24 countByEnumeratingWithState:&v52 objects:v61 count:16];
            }
            while (v26);
          }

          uint64_t i = v50;
          id v14 = v51;
        }
      }
      id v49 = [&off_100064A10 countByEnumeratingWithState:&v57 objects:v62 count:16];
      if (!v49)
      {

        id v3 = v44;
        break;
      }
    }
  }
}

void sub_1000183F0(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_10001A9E0([v3 count] == (id)2, @"miPreventMagicUnsubscribe FIELD COMMA_SEPARATED_VALUES");
  [*(id *)(a1 + 32) beSameUserAsSuggestd];
  id v4 = [v3 objectAtIndexedSubscript:0];
  unsigned __int8 v5 = [v4 isEqualToString:@"sender"];

  uint64_t v6 = 0;
  if ((v5 & 1) == 0)
  {
    unsigned int v7 = [v3 objectAtIndexedSubscript:0];
    unsigned __int8 v8 = [v7 isEqualToString:@"senderDomain"];

    if ((v8 & 1) == 0)
    {
      id v16 = [objc_alloc((Class)NSString) initWithFormat:@"ERROR: FIELD argument can only be 'sender' or 'senderDomain'"];
      puts((const char *)[v16 UTF8String]);

LABEL_8:
      exit(1);
    }
    uint64_t v6 = 1;
  }
  unsigned int v9 = +[SGSuggestionsService serviceForMail];
  unsigned int v10 = [v3 objectAtIndexedSubscript:1];
  double v11 = [v10 componentsSeparatedByString:@","];
  id v17 = 0;
  [v9 preventUnsubscriptionOpportunitiesSuggestionsForField:v6 toValues:v11 error:&v17];
  id v12 = v17;

  if (v12)
  {
    id v13 = objc_alloc((Class)NSString);
    id v14 = [v12 localizedDescription];
    id v15 = [v13 initWithFormat:@"ERROR: %@", v14];
    puts((const char *)[v15 UTF8String]);

    goto LABEL_8;
  }
}

void sub_1000185A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_10001A9E0((unint64_t)[v3 count] > 1, @"miOmissionDetection SUBJECT CONTENT [-to TO_LIST -cc CC_LIST -bcc BCC_LIST -oto ORIGINAL_MAIL_TO_LIST -occ ORIGINAL_MAIL_CC_LIST -simulate-attachment -simulate-huge-attachment -chain-with-negative-engagement -chain-with-positive-engagement]\nFormat for lists : \n\"John Doe <jodoe@apple.com>,Jane Doe <jadoe@apple.com>\"");
  [*(id *)(a1 + 32) beSameUserAsSuggestd];
  int v76 = +[SGSuggestionsService serviceForMail];
  long long v68 = [v3 objectAtIndexedSubscript:0];
  id v70 = objc_opt_new();
  long long v67 = [v3 objectAtIndexedSubscript:1];
  id v4 = objc_opt_new();
  [v4 setObject:&stru_10005B0F8 forKeyedSubscript:@"-to"];
  [v4 setObject:&stru_10005B0F8 forKeyedSubscript:@"-cc"];
  [v4 setObject:&stru_10005B0F8 forKeyedSubscript:@"-bcc"];
  [v4 setObject:&stru_10005B0F8 forKeyedSubscript:@"-oto"];
  id v71 = v4;
  [v4 setObject:&stru_10005B0F8 forKeyedSubscript:@"-occ"];
  uint64_t v75 = 0;
  unsigned __int8 v5 = 0;
  id v69 = v3;
  if ((unint64_t)[v3 count] < 3)
  {
LABEL_21:
    long long v66 = v5;
    int v74 = objc_opt_new();
    id v13 = [v71 objectForKeyedSubscript:@"-to"];
    id v14 = sub_10001E9F4(v13);
    id v15 = [v71 objectForKeyedSubscript:@"-cc"];
    id v16 = sub_10001E9F4(v15);
    id v17 = [v71 objectForKeyedSubscript:@"-bcc"];
    int v18 = sub_10001E9F4(v17);
    id v19 = [v71 objectForKeyedSubscript:@"-oto"];
    id v20 = sub_10001E9F4(v19);
    id v21 = [v71 objectForKeyedSubscript:@"-occ"];
    id v22 = sub_10001E9F4(v21);
    id v87 = 0;
    id v72 = [v76 identifyComposeWarningsFromSubject:v68 content:v67 attributes:&__NSDictionary0__struct toRecipients:v14 ccRecipients:v16 bccRecipients:v18 originalToRecipients:v20 originalCcRecipients:v22 attachments:v70 error:&v87];
    id v65 = v87;

    id v23 = v74;
    [v74 removeAllObjects];
    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id v24 = v72;
    id v25 = [v24 countByEnumeratingWithState:&v83 objects:v89 count:16];
    id v73 = v24;
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v84;
      do
      {
        for (uint64_t i = 0; i != v26; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v84 != v27) {
            objc_enumerationMutation(v24);
          }
          uint64_t v29 = *(void **)(*((void *)&v83 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v30 = objc_alloc((Class)NSString);
            id v31 = [v29 snippet];
            id v32 = [v29 signature];
            id v33 = [v30 initWithFormat:@"This content seems to refer an attachment around \"%@\" with signature \"%@\"", v31, v32];
            [v23 addObject:v33];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v31 = [v29 handle];
              id v34 = [v29 matchFoundInBCC];

              id v35 = objc_alloc((Class)NSString);
              uint64_t v36 = [v29 core];
              id v37 = (void *)v36;
              if (v31)
              {
                id v38 = [objc_alloc((Class)NSString) initWithFormat:@" (with handle \"%@\"", v31];
                id v39 = [v35 initWithFormat:@"\"%@\"%@", v37, v38];
              }
              else
              {
                id v39 = [v35 initWithFormat:@"\"%@\"%@", v36, &stru_10005B0F8];
              }

              id v40 = objc_alloc((Class)NSString);
              if (v34) {
                CFStringRef v41 = @"BCC ";
              }
              else {
                CFStringRef v41 = &stru_10005B0F8;
              }
              CFStringRef v42 = [v29 snippet];
              id v43 = [v40 initWithFormat:@"This content seems to refer a missing %@recipient %@ in \"%@\"", v41, v39, v42];
              id v23 = v74;
              [v74 addObject:v43];

              id v24 = v73;
            }
            else
            {
              id v31 = sgMailIntelligenceLogHandle();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_fault_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_FAULT, "Unsupported SGMailIntelligenceWarning", buf, 2u);
              }
            }
          }
        }
        id v26 = [v24 countByEnumeratingWithState:&v83 objects:v89 count:16];
      }
      while (v26);
    }

    if ([v23 count])
    {
      [v23 enumerateObjectsUsingBlock:&stru_10005A6D8];
      id v44 = v65;
      unsigned __int8 v5 = v66;
      if (!v75)
      {
LABEL_57:
        id v3 = v69;

        goto LABEL_61;
      }
      long long v80 = 0u;
      long long v81 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      id v45 = v24;
      id v46 = [v45 countByEnumeratingWithState:&v78 objects:v88 count:16];
      if (v46)
      {
        id v47 = v46;
        uint64_t v48 = *(void *)v79;
        do
        {
          id v49 = v45;
          CFStringRef v50 = 0;
          id v51 = v44;
          do
          {
            if (*(void *)v79 != v48) {
              objc_enumerationMutation(v49);
            }
            long long v52 = *(void **)(*((void *)&v78 + 1) + 8 * (void)v50);
            id v53 = [v75 BOOLValue];
            id v77 = v51;
            long long v54 = [v76 reportUserEngagement:v53 forWarning:v52 error:&v77];
            id v44 = v77;

            id v55 = objc_alloc((Class)NSString);
            if ([v75 BOOLValue]) {
              CFStringRef v56 = @"positive";
            }
            else {
              CFStringRef v56 = @"negative";
            }
            long long v57 = [v52 core];
            unsigned int v58 = [v54 BOOLValue];
            CFStringRef v59 = @"not";
            if (v58) {
              CFStringRef v59 = @"still";
            }
            id v60 = [v55 initWithFormat:@"Reported %@ engagement for warning \"%@\", next similar warning will %@ be reported.", v56, v57, v59];
            puts((const char *)[v60 UTF8String]);

            CFStringRef v50 = (char *)v50 + 1;
            id v51 = v44;
          }
          while (v47 != v50);
          id v45 = v49;
          id v47 = [v49 countByEnumeratingWithState:&v78 objects:v88 count:16];
        }
        while (v47);
        unsigned __int8 v5 = v66;
        id v24 = v73;
        id v23 = v74;
      }
    }
    else
    {
      id v45 = [objc_alloc((Class)NSString) initWithFormat:@"According to current heuristic, no attachment reference or missing recipient got detected in this content"];
      puts((const char *)[v45 UTF8String]);
      id v44 = v65;
      unsigned __int8 v5 = v66;
    }

    goto LABEL_57;
  }
  unsigned __int8 v5 = 0;
  uint64_t v75 = 0;
  uint64_t v6 = 2;
  while (1)
  {
    unsigned int v7 = v5;
    unsigned __int8 v5 = [v3 objectAtIndexedSubscript:v6];

    unsigned __int8 v8 = [v3 objectAtIndexedSubscript:v6];
    unsigned int v9 = [v71 objectForKeyedSubscript:v8];

    if (v9)
    {
      if (++v6 >= (unint64_t)[v3 count])
      {
        id v61 = objc_alloc((Class)NSString);
        id v64 = v5;
        CFStringRef v62 = @"Error: you must specify recipients after the <%@> option";
        goto LABEL_59;
      }
      id v10 = [v3 objectAtIndexedSubscript:v6];
      [v71 setObject:v10 forKeyedSubscript:v5];
      goto LABEL_10;
    }
    if ([v5 isEqualToString:@"-simulate-attachment"])
    {
      id v10 = [objc_alloc((Class)SGMailIntelligenceAttachmentProperties) initWithFileName:@"foo.txt" fileSizeInBytes:&off_100064B48 fileDescription:&stru_10005B0F8 keywords:&__NSArray0__struct authors:&__NSArray0__struct];
      [v70 addObject:v10];
      id v3 = v69;
LABEL_10:

      goto LABEL_11;
    }
    id v3 = v69;
    if ([v5 isEqualToString:@"-simulate-huge-attachment"])
    {
      id v10 = [objc_alloc((Class)SGMailIntelligenceAttachmentProperties) initWithFileName:@"foo.txt" fileSizeInBytes:&off_100064B60 fileDescription:&stru_10005B0F8 keywords:&__NSArray0__struct authors:&__NSArray0__struct];
      [v70 addObject:v10];
      goto LABEL_10;
    }
    if ([v5 isEqualToString:@"-chain-with-positive-engagement"])
    {
      double v11 = &__kCFBooleanTrue;
LABEL_17:
      uint64_t v75 = v11;
      goto LABEL_11;
    }
    if ([v5 isEqualToString:@"-chain-with-negative-engagement"])
    {
      double v11 = &__kCFBooleanFalse;
      goto LABEL_17;
    }
    if ([v5 isEqualToString:@"-chain-with-negative-feedback"]) {
      break;
    }
    if (([v5 isEqualToString:@"-latest-spi-only"] & 1) == 0)
    {
      id v12 = [objc_alloc((Class)NSString) initWithFormat:@"Error: Invalid option <%@>", v5];
      goto LABEL_60;
    }
LABEL_11:
    if (++v6 >= (unint64_t)[v3 count]) {
      goto LABEL_21;
    }
  }
  id v61 = objc_alloc((Class)NSString);
  CFStringRef v62 = @"Error: The option -chain-with-negative-feedback has been renamed to -chain-with-negative-engagement";
LABEL_59:
  id v12 = objc_msgSend(v61, "initWithFormat:", v62, v64);
LABEL_60:
  id v63 = v12;
  puts((const char *)[v63 UTF8String]);

LABEL_61:
}

void sub_100018F40(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [v3 count] == (id)2 || objc_msgSend(v3, "count") == (id)3;
  sub_10001A9E0(v4, @"miFollowUp SUBJECT BODY [-chain-with-positive-engagement -chain-with-negative-engagement -chain-with-no-engagement]");
  [*(id *)(a1 + 32) beSameUserAsSuggestd];
  unsigned __int8 v5 = [v3 objectAtIndexedSubscript:0];
  uint64_t v6 = [v3 objectAtIndexedSubscript:1];
  unsigned int v7 = 0;
  if ([v3 count] == (id)3)
  {
    unsigned __int8 v8 = [v3 objectAtIndexedSubscript:2];
    unsigned int v7 = [&off_100064EA0 objectForKeyedSubscript:v8];
  }
  unsigned int v9 = +[SGSuggestionsService serviceForMail];
  uint64_t v38 = 0;
  id v10 = [v9 identifyFollowUpWarningFromSubject:v5 body:v6 date:0 error:&v38];
  double v11 = objc_opt_new();
  [v11 setDateStyle:2];
  [v11 setTimeStyle:0];
  id v12 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:@"en_US"];
  [v11 setLocale:v12];

  if (v10)
  {
    if (v7)
    {
      id v13 = objc_msgSend(v9, "reportUserEngagement:forWarning:error:", objc_msgSend(v7, "BOOLValue"), v10, 0);
      id v14 = objc_alloc((Class)NSString);
      id v15 = [v3 objectAtIndexedSubscript:2];
      id v16 = [v14 initWithFormat:@"ENGAGEMENT: %@ registered.", v15];
      puts((const char *)[v16 UTF8String]);
    }
    else
    {
      id v15 = [objc_alloc((Class)NSString) initWithFormat:@"ENGAGEMENT: -chain-with-no-engagement registered."];
      puts((const char *)[v15 UTF8String]);
    }

    id v18 = [objc_alloc((Class)NSString) initWithFormat:@"-----------------------------------"];
    puts((const char *)[v18 UTF8String]);

    id v19 = [objc_alloc((Class)NSString) initWithFormat:@"Follow Up warning raised"];
    puts((const char *)[v19 UTF8String]);

    id v20 = [objc_alloc((Class)NSString) initWithFormat:@"-----------------------------------"];
    puts((const char *)[v20 UTF8String]);

    id v21 = objc_alloc((Class)NSString);
    id v22 = [v10 snippet];
    id v23 = [v21 initWithFormat:@"Snippet : %@", v22];
    puts((const char *)[v23 UTF8String]);

    id v24 = objc_alloc((Class)NSString);
    id v25 = [v10 score];
    [v25 doubleValue];
    id v27 = objc_msgSend(v24, "initWithFormat:", @"Score : %f", v26);
    puts((const char *)[v27 UTF8String]);

    id v28 = objc_alloc((Class)NSString);
    uint64_t v29 = [v10 startDate];
    id v30 = [v11 stringFromDate:v29];
    id v31 = [v28 initWithFormat:@"Start date : %@", v30];
    puts((const char *)[v31 UTF8String]);

    id v32 = objc_alloc((Class)NSString);
    id v33 = [v10 endDate];
    id v34 = [v11 stringFromDate:v33];
    id v35 = [v32 initWithFormat:@"End date : %@", v34];
    puts((const char *)[v35 UTF8String]);

    id v36 = objc_alloc((Class)NSString);
    id v17 = [v10 signature];
    id v37 = [v36 initWithFormat:@"Signature : %@", v17];
    puts((const char *)[v37 UTF8String]);
  }
  else
  {
    id v17 = [objc_alloc((Class)NSString) initWithFormat:@"No Follow Up warning raised."];
    puts((const char *)[v17 UTF8String]);
  }
}

void sub_1000193C0(uint64_t a1, void *a2)
{
  id v37 = a2;
  sub_10001A9E0([v37 count] == (id)3, @"mailDetectFollowUp DATE BODY IS_SENT\nThe date has to be in ISO8601 Format or today(+ or -)(number of days) -- Example: \"2022-01-17T16:00:56-08:00\" -- Example: \"today+2\" or \"today-5\" \nIS_SENT: YES for outgoing, NO for incoming");
  [*(id *)(a1 + 32) beSameUserAsSuggestd];
  id v3 = [v37 objectAtIndexedSubscript:0];
  char v4 = objc_opt_new();
  unsigned __int8 v5 = [v4 dateFromString:v3];
  if (!v5)
  {
    uint64_t v6 = [v3 substringToIndex:5];
    unsigned __int8 v7 = [v6 isEqualToString:@"today"];

    if (v7)
    {
      unsigned __int8 v8 = +[NSDate now];
      unsigned int v9 = [v3 substringFromIndex:5];
      [v9 doubleValue];
      unsigned __int8 v5 = [v8 dateByAddingTimeInterval:v10 * 24.0 * 3600.0];

      if (v5) {
        goto LABEL_4;
      }
    }
    else
    {
      id v36 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid date format."];
      puts((const char *)[v36 UTF8String]);
    }
    __assert_rtn("+[SGTools initialize]_block_invoke", "suggest_tool.m", 6039, "date");
  }
LABEL_4:
  uint64_t v11 = [v37 objectAtIndexedSubscript:1];
  if (!v11) {
    __assert_rtn("+[SGTools initialize]_block_invoke", "suggest_tool.m", 6041, "body");
  }
  id v12 = (void *)v11;
  id v13 = [v37 objectAtIndexedSubscript:2];
  id v14 = [v13 uppercaseString];
  id v15 = [&off_100064F18 objectForKeyedSubscript:v14];

  if (v15)
  {
    +[SGMIFollowUpAnalyzer analyzeForFollowUpMailWithBody:isSent:messageId:date:](SGMIFollowUpAnalyzer, "analyzeForFollowUpMailWithBody:isSent:messageId:date:", v12, [v15 BOOLValue], &stru_10005B0F8, v5);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    id v17 = objc_alloc((Class)NSString);
    if (v16)
    {
      id v18 = [v17 initWithFormat:@"-----------------------------------"];
      puts((const char *)[v18 UTF8String]);

      id v19 = [objc_alloc((Class)NSString) initWithFormat:@"Follow Up warning raised"];
      puts((const char *)[v19 UTF8String]);

      id v20 = [objc_alloc((Class)NSString) initWithFormat:@"-----------------------------------"];
      puts((const char *)[v20 UTF8String]);

      id v21 = objc_alloc((Class)NSString);
      id v22 = [v16 snippet];
      id v23 = [v21 initWithFormat:@"Snippet : %@", v22];
      puts((const char *)[v23 UTF8String]);

      id v24 = objc_alloc((Class)NSString);
      id v25 = [v16 score];
      [v25 doubleValue];
      id v27 = objc_msgSend(v24, "initWithFormat:", @"Score : %f", v26);
      puts((const char *)[v27 UTF8String]);

      id v28 = objc_alloc((Class)NSString);
      uint64_t v29 = [v16 startDate];
      id v30 = [v4 stringFromDate:v29];
      id v31 = [v28 initWithFormat:@"Start date : %@", v30];
      puts((const char *)[v31 UTF8String]);

      id v32 = objc_alloc((Class)NSString);
      id v33 = [v16 endDate];
      id v34 = [v4 stringFromDate:v33];
      id v35 = [v32 initWithFormat:@"End date : %@", v34];
      puts((const char *)[v35 UTF8String]);
    }
    else
    {
      id v33 = [v17 initWithFormat:@"No Follow Up warning raised."];
      puts((const char *)[v33 UTF8String]);
    }
  }
  else
  {
    id v16 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid IS_SENT parameter."];
    puts((const char *)[v16 UTF8String]);
  }
}

void sub_100019838(uint64_t a1)
{
  [*(id *)(a1 + 32) beSameUserAsSuggestd];
  id v1 = +[SGSqlEntityStore defaultStore];
  [v1 clearMailIntelligence];
}

void sub_100019888(uint64_t a1, void *a2)
{
  id v3 = [a2 objectAtIndexedSubscript:0];
  char v4 = +[NSData dataWithContentsOfFile:v3];
  if (v4)
  {
    unsigned __int8 v5 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v6 = [v5 first];

    if (v6)
    {
      id v25 = v3;
      id v7 = objc_alloc((Class)SGMIFeatureVector);
      unsigned __int8 v8 = [v6 messageId];
      uint64_t v9 = kDefaultUnknownConnectionScore;
      double v10 = +[SGSqlEntityStore defaultStore];
      uint64_t v11 = +[SGMIFeature allFeatureNames];
      id v24 = v6;
      id v12 = [v7 initWithMessageId:v8 hasHashedMessageId:0 simpleMailMessage:v6 senderConnectionScore:v9 biomeMessageSummary:0 store:v10 preLoadedFeatureNames:v11];

      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v13 = +[SGMIFeature allFeatureNames];
      id v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v15; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v27 != v16) {
              objc_enumerationMutation(v13);
            }
            id v18 = [*(id *)(*((void *)&v26 + 1) + 8 * i) integerValue];
            id v19 = objc_alloc((Class)NSString);
            id v20 = +[SGMIFeature prettyName:v18];
            id v21 = [v12 feature:v18];
            id v22 = [v19 initWithFormat:@"%@\t%@", v20, v21];
            puts((const char *)[v22 UTF8String]);
          }
          id v15 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v15);
      }

      id v3 = v25;
      id v6 = v24;
    }
    else
    {
      id v23 = [objc_alloc((Class)NSString) initWithFormat:@"ERROR: Failed to create mail"];
      puts((const char *)[v23 UTF8String]);
    }
  }
  else
  {
    id v6 = [objc_alloc((Class)NSString) initWithFormat:@"ERROR: failed to read contentsOfFile:%@", v3];
    puts((const char *)[v6 UTF8String]);
  }
}

void sub_100019B68(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_10001A9E0([v3 count] == (id)1, @"miSaliencyFromRFC822 FILEPATH");
  [*(id *)(a1 + 40) beSameUserAsSuggestd];
  char v4 = [v3 objectAtIndexedSubscript:0];

  unsigned __int8 v5 = +[NSData dataWithContentsOfFile:v4];
  if (v5)
  {
    id v6 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v7 = [v6 first];

    if (v7)
    {
      id v8 = objc_alloc((Class)SGMIFeatureVector);
      uint64_t v9 = [v7 messageId];
      uint64_t v10 = kDefaultUnknownConnectionScore;
      uint64_t v11 = +[SGSqlEntityStore defaultStore];
      id v12 = [v8 initWithMessageId:v9 hasHashedMessageId:0 simpleMailMessage:v7 senderConnectionScore:v10 biomeMessageSummary:0 store:v11 preLoadedFeatureNames:&__NSArray0__struct];

      id v13 = +[SGMISaliencyModelConfig defaultConfig];
      id v22 = 0;
      id v14 = +[SGMISaliencyInference evaluate:v12 enablePreFiltering:1 config:v13 error:&v22];
      id v15 = v22;

      if (v15)
      {
        id v16 = [objc_alloc((Class)NSString) initWithFormat:@"SGMISaliencyInference: %@", v15];
        puts((const char *)[v16 UTF8String]);
      }
      id v17 = objc_alloc((Class)NSString);
      id v18 = [v14 score];
      unsigned int v19 = [v14 isSalient];
      CFStringRef v20 = @"NO";
      if (v19) {
        CFStringRef v20 = @"YES";
      }
      id v21 = [v17 initWithFormat:@"Saliency score is: %@, is salient? %@", v18, v20];
      puts((const char *)[v21 UTF8String]);
    }
    else
    {
      id v12 = [objc_alloc((Class)NSString) initWithFormat:@"ERROR: Failed to create mail"];
      puts((const char *)[v12 UTF8String]);
    }
  }
  else
  {
    id v7 = [objc_alloc((Class)NSString) initWithFormat:@"ERROR: failed to read contentsOfFile:%@", v4];
    puts((const char *)[v7 UTF8String]);
  }
}

void sub_100019E0C(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 beSameUserAsSuggestd];
  unsigned int v4 = +[SGPreferenceStorage enableDKIMEnforcement];
  id v5 = [v3 isEqual:&off_100064A88];

  +[SGPreferenceStorage setEnableDKIMEnforcement:v5];
  id v6 = objc_alloc((Class)NSString);
  CFStringRef v7 = @"disable";
  if (v5) {
    CFStringRef v8 = @"enable";
  }
  else {
    CFStringRef v8 = @"disable";
  }
  if (v4) {
    CFStringRef v7 = @"enable";
  }
  id v9 = [v6 initWithFormat:@"enableDKIMEnforcement set to %@ (was %@)", v8, v7];
  puts((const char *)[v9 UTF8String]);
}

void sub_100019EE0(uint64_t a1, void *a2)
{
  sub_10001A9E0([a2 count] == 0, @"eventUpdateCategories (no arguments)");
  id v3 = objc_alloc((Class)NSString);
  uint64_t v4 = +[SGPreferenceStorage disabledEventUpdateCategories];
  id v5 = (void *)v4;
  if (v4) {
    id v6 = (void *)v4;
  }
  else {
    id v6 = &__NSArray0__struct;
  }
  CFStringRef v7 = v6;

  if (![v7 count])
  {

    CFStringRef v7 = &off_100064AA0;
  }
  CFStringRef v8 = objc_msgSend(v7, "_pas_componentsJoinedByString:", @", ");

  id v9 = [v3 initWithFormat:@"Disabled categories: %@", v8];
  puts((const char *)[v9 UTF8String]);

  id v10 = objc_alloc((Class)NSString);
  uint64_t v11 = [*(id *)(a1 + 32) result];
  id v12 = [v11 mutableCopy];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v13 = +[SGPreferenceStorage disabledEventUpdateCategories];
  id v14 = (void *)v13;
  if (v13) {
    id v15 = (void *)v13;
  }
  else {
    id v15 = &__NSArray0__struct;
  }
  id v16 = v15;

  id v17 = [v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v18; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v16);
        }
        [v12 removeObject:*(void *)(*((void *)&v25 + 1) + 8 * i)];
      }
      id v18 = [v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v18);
  }

  if (![v12 count]) {
    [v12 addObject:@"(none)"];
  }
  id v21 = objc_msgSend(v12, "_pas_componentsJoinedByString:", @", ");

  id v22 = [v10 initWithFormat:@"Enabled categories: %@", v21];
  puts((const char *)[v22 UTF8String]);

  id v23 = [objc_alloc((Class)NSString) initWithFormat:@"When a category is disabled, then every event detected for that category will be treated as a new event for EventKit and Spotlight, even if heuristics believe it is an update to an existing event."];
  puts((const char *)[v23 UTF8String]);

  id v24 = [objc_alloc((Class)NSString) initWithFormat:@"Use suggest_tool setEventUpdateCategories to configure enabled/disabled categories."];
  puts((const char *)[v24 UTF8String]);
}

void sub_10001A190(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 40) beSameUserAsSuggestd];
  char v4 = [v3 count] != 0;
  id v5 = objc_alloc((Class)NSString);
  uint64_t v72 = a1;
  id v6 = [*(id *)(a1 + 32) result];
  CFStringRef v7 = objc_msgSend(v6, "_pas_componentsJoinedByString:", @", ");
  id v8 = [v5 initWithFormat:@"setEventUpdateCategories (+ to enable or - to disable)(one of %@)\nMore than one argument may be provided, for example suggest_tool setEventUpdateCategories -Flight -Hotel +CarRental\nWhen a category is disabled, then every event detected for that category will be treated as a new event for EventKit and Spotlight, even if heuristics believe it is an update to an existing event.", v7];

  sub_10001A9E0(v4, v8);
  id v9 = objc_opt_new();
  id v73 = objc_opt_new();
  id v69 = objc_opt_new();
  id v10 = (id)objc_opt_new();
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id v11 = v3;
  id v12 = [v11 countByEnumeratingWithState:&v91 objects:v99 count:16];
  long long v68 = v9;
  id obj = v11;
  if (v12)
  {
    id v13 = v12;
    uint64_t v74 = *(void *)v92;
    while (2)
    {
      for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v92 != v74) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v91 + 1) + 8 * i);
        if ([v15 length])
        {
          unsigned int v16 = [v15 characterAtIndex:0];
          id v17 = v9;
          id v18 = v73;
          if (v16 != 43)
          {
            if (v16 != 45)
            {
              id v63 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid argument %@ (arguments must be extracted event categories prefixed by '+' to insert and '-' to remove)", v15];
              [v10 addObject:v63];

              CFStringRef v59 = v69;
              id v64 = obj;
              id v62 = obj;
              goto LABEL_62;
            }
            id v17 = v73;
            id v18 = v9;
          }
          id v19 = v17;
          id v20 = v18;
          id v21 = [v15 substringFromIndex:1];
          id v22 = [*(id *)(v72 + 32) result];
          unsigned __int8 v23 = [v22 containsObject:v21];

          if ((v23 & 1) == 0)
          {
            id v24 = objc_alloc((Class)NSString);
            long long v25 = [*(id *)(v72 + 32) result];
            long long v26 = objc_msgSend(v25, "_pas_componentsJoinedByString:", @", ");
            id v27 = [v24 initWithFormat:@"Unrecognized extracted event category %@ (allowed: %@)", v21, v26];
            [v10 addObject:v27];

            id v9 = v68;
          }
          if ([v19 containsObject:v21])
          {
            id v28 = [objc_alloc((Class)NSString) initWithFormat:@"Repeated argument %@", v15];
            [v69 addObject:v28];
          }
          else
          {
            [v19 addObject:v21];
            if ([v20 containsObject:v21])
            {
              id v29 = [objc_alloc((Class)NSString) initWithFormat:@"+ and - on %@", v21];
              [v69 addObject:v29];

              [v20 removeObject:v21];
            }
          }
        }
        else
        {
          [v10 addObject:@"Empty argument"];
        }
      }
      id v11 = obj;
      id v13 = [obj countByEnumeratingWithState:&v91 objects:v99 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id v30 = v69;
  id v31 = [v30 countByEnumeratingWithState:&v87 objects:v98 count:16];
  if (v31)
  {
    id v32 = v31;
    uint64_t v33 = *(void *)v88;
    do
    {
      for (uint64_t j = 0; j != v32; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v88 != v33) {
          objc_enumerationMutation(v30);
        }
        fprintf(__stderrp, "Warning: %s\n", (const char *)[*(id *)(*((void *)&v87 + 1) + 8 * (void)j) UTF8String]);
      }
      id v32 = [v30 countByEnumeratingWithState:&v87 objects:v98 count:16];
    }
    while (v32);
  }

  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v35 = v10;
  id v36 = [v35 countByEnumeratingWithState:&v83 objects:v97 count:16];
  if (v36)
  {
    id v37 = v36;
    uint64_t v38 = *(void *)v84;
    do
    {
      for (k = 0; k != v37; k = (char *)k + 1)
      {
        if (*(void *)v84 != v38) {
          objc_enumerationMutation(v35);
        }
        fprintf(__stderrp, "Fatal: %s\n", (const char *)[*(id *)(*((void *)&v83 + 1) + 8 * (void)k) UTF8String]);
      }
      id v37 = [v35 countByEnumeratingWithState:&v83 objects:v97 count:16];
    }
    while (v37);
  }

  if ([v35 count])
  {
    fwrite("Aborting due to fatal issues. Please check your arguments and try again.\n", 0x49uLL, 1uLL, __stderrp);
    exit(1);
  }

  uint64_t v40 = +[SGPreferenceStorage disabledEventUpdateCategories];
  id v41 = objc_alloc((Class)NSMutableSet);
  id v70 = (void *)v40;
  if (v40) {
    CFStringRef v42 = (void *)v40;
  }
  else {
    CFStringRef v42 = &__NSArray0__struct;
  }
  id v10 = [v41 initWithArray:v42];
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id v43 = v68;
  id v44 = [v43 countByEnumeratingWithState:&v79 objects:v96 count:16];
  if (v44)
  {
    id v45 = v44;
    uint64_t v46 = *(void *)v80;
    do
    {
      for (m = 0; m != v45; m = (char *)m + 1)
      {
        if (*(void *)v80 != v46) {
          objc_enumerationMutation(v43);
        }
        uint64_t v48 = *(void *)(*((void *)&v79 + 1) + 8 * (void)m);
        CFStringRef v49 = @"%@ enabled (but it was already enabled)";
        if ([v10 containsObject:v48])
        {
          [v10 removeObject:v48];
          CFStringRef v49 = @"%@ enabled";
        }
        id v50 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", v49, v48);
        puts((const char *)[v50 UTF8String]);
      }
      id v45 = [v43 countByEnumeratingWithState:&v79 objects:v96 count:16];
    }
    while (v45);
  }

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v51 = v73;
  id v52 = [v51 countByEnumeratingWithState:&v75 objects:v95 count:16];
  if (v52)
  {
    id v53 = v52;
    uint64_t v54 = *(void *)v76;
    do
    {
      for (n = 0; n != v53; n = (char *)n + 1)
      {
        if (*(void *)v76 != v54) {
          objc_enumerationMutation(v51);
        }
        uint64_t v56 = *(void *)(*((void *)&v75 + 1) + 8 * (void)n);
        CFStringRef v57 = @"%@ disabled (but it was already disabled)";
        if (([v10 containsObject:v56] & 1) == 0)
        {
          [v10 addObject:v56];
          CFStringRef v57 = @"%@ disabled";
        }
        id v58 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", v57, v56);
        puts((const char *)[v58 UTF8String]);
      }
      id v53 = [v51 countByEnumeratingWithState:&v75 objects:v95 count:16];
    }
    while (v53);
  }

  CFStringRef v59 = v70;
  if (v70
    && (id v60 = [objc_alloc((Class)NSSet) initWithArray:v70],
        unsigned int v61 = [v10 isEqual:v60],
        v60,
        v61))
  {
    id v62 = [objc_alloc((Class)NSString) initWithFormat:@"No changes were made."];
    puts((const char *)[v62 UTF8String]);
  }
  else
  {
    id v65 = [v10 allObjects];
    id v62 = [v65 sortedArrayUsingSelector:"compare:"];

    id v66 = [objc_alloc((Class)NSString) initWithFormat:@"Disabled item list updated to: %@", v62];
    puts((const char *)[v66 UTF8String]);

    long long v67 = [v10 allObjects];
    +[SGPreferenceStorage setDisabledEventUpdateCategories:v67];
  }
  id v9 = v68;
  id v64 = obj;
LABEL_62:
}

void sub_10001A9E0(char a1, void *a2)
{
  id v3 = a2;
  if ((a1 & 1) == 0)
  {
    id v5 = v3;
    if (os_variant_has_internal_diagnostics())
    {
      id v4 = [objc_alloc((Class)NSString) initWithFormat:@"usage: suggest_tool %@", v5];
      puts((const char *)[v4 UTF8String]);
    }
    _exit(1);
  }
}

void sub_10001AA70(id a1, NSArray *a2)
{
  sub_10001A9E0([(NSArray *)a2 count] == 0, @"resetEventUpdateCategories (no arguments)");
  +[SGPreferenceStorage setDisabledEventUpdateCategories:0];
  id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Done. All categories are now enabled."];
  puts((const char *)[v2 UTF8String]);
}

NSArray *__cdecl sub_10001AAF4(id a1)
{
  id v1 = +[SGEntityTag eventCategoryToEntityTagMapping];
  id v2 = [v1 allKeys];
  id v3 = [v2 sortedArrayUsingSelector:"compare:"];

  return (NSArray *)v3;
}

void sub_10001AB68(id a1, NSArray *a2)
{
  id v2 = a2;
  sub_10001A9E0([(NSArray *)v2 count] < 3, @"run: pet_tool aggregatedMessages | suggest_tool decodePETMessages [className=*] [jsonFormat=YES]");
  if ([(NSArray *)v2 count]
    && ([(NSArray *)v2 objectAtIndexedSubscript:0],
        id v3 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v4 = [v3 isEqualToString:@"*"],
        v3,
        (v4 & 1) == 0))
  {
    id v5 = [(NSArray *)v2 objectAtIndexedSubscript:0];
    char v6 = 0;
  }
  else
  {
    id v5 = 0;
    char v6 = 1;
  }
  unsigned __int8 v23 = v2;
  if ([(NSArray *)v2 count] < 2)
  {
    int v24 = 1;
  }
  else
  {
    CFStringRef v7 = [(NSArray *)v2 objectAtIndexedSubscript:1];
    int v24 = [v7 isEqualToString:@"YES"];
  }
  __s = 0;
  __linep = 0;
  id v8 = v5;
  id v9 = (const char *)[v8 UTF8String];
  id v10 = "";
  if (v9) {
    id v10 = v9;
  }
  asprintf(&__s, "Message Name: %s", v10);
  char v11 = 0;
  id v12 = 0;
  char v13 = 0;
  size_t __linecapp = 0;
  id v14 = __stdinp;
  while (1)
  {
    ssize_t v15 = getline(&__linep, &__linecapp, v14);
    if (v15 < 1) {
      break;
    }
    ssize_t v16 = v15;
    __linep[v16 - 1] = 0;
    id v18 = __linep;
    if (!strncmp(__linep, "UTC Date: ", 0xAuLL) || !strncmp(v18, "Message Group: ", 0xFuLL))
    {
      free(v12);
      id v18 = __linep;
      id v12 = strdup(__linep);
    }
    if (v6)
    {
      size_t v19 = strlen(__s);
      if (!strncmp(v18, __s, v19))
      {
        puts(v12);
        uint64_t v20 = +[NSString stringWithCString:&__linep[strlen(__s)] encoding:4];

        char v13 = 0;
        id v8 = (id)v20;
        goto LABEL_22;
      }
    }
    else if (!strcmp(v18, __s))
    {
      puts(v12);
      char v13 = 0;
      goto LABEL_22;
    }
    if ((v11 & 1) == 0)
    {
      char v11 = 0;
      goto LABEL_27;
    }
LABEL_22:
    id v21 = __linep;
    v13 |= strcmp(__linep, "Message Body:") == 0;
    if ((v13 & 1) == 0)
    {
      puts(v21);
      id v21 = __linep;
    }
    if (!strncmp(v21, "Message Body (base64): ", 0x17uLL))
    {
      id v22 = +[NSString stringWithCString:v21 + 23 encoding:4];
      sub_10001AE90(v8, v22, v24);

      putchar(10);
      char v11 = 0;
      char v13 = 0;
    }
    else
    {
      char v11 = 1;
    }
LABEL_27:
  }
  free(v12);
  free(__s);
  free(__linep);
}

void sub_10001AE90(void *a1, void *a2, int a3)
{
  aClassName = a1;
  id v6 = a2;
  if (aClassName && v6)
  {
    id v7 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v6 options:0];
    if (!v7) {
      +[NSException raise:@"Base64ProtoToJSON", @"failed to get NSData from %@", v6 format];
    }
    Class v8 = NSClassFromString(aClassName);
    if (([(objc_class *)v8 isSubclassOfClass:NSClassFromString(@"PBCodable")] & 1) == 0)
    {
      id v3 = +[NSAssertionHandler currentHandler];
      char v13 = +[NSString stringWithUTF8String:"void printPETBase64Protobuf(NSString *__strong, NSString *__strong, BOOL)"];
      [v3 handleFailureInFunction:v13, @"suggest_tool.m", 1263, @"Invalid parameter not satisfying: %@", @"[cls isSubclassOfClass:NSClassFromString(@\"PBCodable\"" file lineNumber description];
    }
    id v9 = [[v8 alloc] initWithData:v7];
    id v10 = objc_alloc((Class)NSString);
    if (a3)
    {
      id v3 = [v9 dictionaryRepresentation];
      sub_10001B094(v3);
    }
    else
    {
      [v9 formattedText];
    char v11 = };
    id v12 = [v10 initWithFormat:@"%@", v11];
    puts((const char *)[v12 UTF8String]);

    if (a3)
    {

      char v11 = v3;
    }
  }
  else
  {
    id v7 = objc_retainAutorelease([objc_alloc((Class)NSString) initWithFormat:@"{}"]);
    puts((const char *)[v7 UTF8String]);
  }
}

__CFString *sub_10001B094(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (v1)
  {
    id v3 = sub_10001B18C(v1);
    id v10 = 0;
    unsigned __int8 v4 = +[NSJSONSerialization dataWithJSONObject:v3 options:1 error:&v10];
    id v5 = v10;

    id v6 = objc_alloc((Class)NSString);
    if (v4)
    {
      id v7 = (__CFString *)[v6 initWithData:v4 encoding:4];
    }
    else
    {
      id v8 = [v6 initWithFormat:@"Error: failed to convert object to JSON: %@: %@", v2, v5];
      puts((const char *)[v8 UTF8String]);

      id v7 = 0;
    }
  }
  else
  {
    id v7 = @"{}";
  }

  return v7;
}

id sub_10001B18C(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (qword_10006A7F0 == -1)
  {
    if (v1) {
      goto LABEL_3;
    }
LABEL_41:
    uint64_t v11 = +[NSNull null];
    goto LABEL_42;
  }
  dispatch_once(&qword_10006A7F0, &stru_10005ABD0);
  if (!v2) {
    goto LABEL_41;
  }
LABEL_3:
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v2 doubleValue];
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v3 = (id)qword_10006A7F8;
  unsigned __int8 v4 = (char *)[v3 countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v46;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v46 != v5) {
          objc_enumerationMutation(v3);
        }
        if (objc_opt_isKindOfClass())
        {
          id v12 = v2;

          goto LABEL_43;
        }
      }
      unsigned __int8 v4 = (char *)[v3 countByEnumeratingWithState:&v45 objects:v51 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

  long long v44 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v41 = 0u;
  id v7 = (id)qword_10006A800;
  id v8 = (char *)[v7 countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v42;
    while (2)
    {
      for (uint64_t j = 0; j != v8; ++j)
      {
        if (*(void *)v42 != v9) {
          objc_enumerationMutation(v7);
        }
        if (objc_opt_isKindOfClass())
        {
          id v12 = [objc_alloc((Class)NSString) initWithFormat:@"%@", v2];

          goto LABEL_43;
        }
      }
      id v8 = (char *)[v7 countByEnumeratingWithState:&v41 objects:v50 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &stru_10005AC10);
LABEL_42:
    id v12 = (id)v11;
    goto LABEL_43;
  }
  uint64_t v35 = 0;
  id v36 = &v35;
  uint64_t v37 = 0x3032000000;
  uint64_t v38 = sub_100006C74;
  id v39 = sub_100006C84;
  id v40 = 0;
  id v40 = (id)objc_opt_new();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10001B77C;
    v34[3] = &unk_10005AC38;
    void v34[4] = &v35;
    [v2 enumerateKeysAndObjectsUsingBlock:v34];
    char v13 = (void *)v36[5];
  }
  else
  {
    id v14 = (void *)qword_10006A808;
    ssize_t v15 = (void *)v36[5];
    id v16 = v2;
    id v17 = v14;
    id v18 = v15;
    unsigned int outCount = 0;
    size_t v19 = (objc_class *)objc_opt_class();
    uint64_t v20 = class_copyIvarList(v19, &outCount);
    if (outCount)
    {
      for (unint64_t k = 0; k < outCount; ++k)
      {
        Name = ivar_getName(v20[k]);
        if (!Name)
        {
          id v32 = +[NSAssertionHandler currentHandler];
          long long v25 = +[NSString stringWithUTF8String:"void addIvarsFromObjectToDict(NSObject *__strong, NSSet *__strong, NSMutableDictionary *__strong)"];
          [v32 handleFailureInFunction:v25 file:@"suggest_tool.m" lineNumber:565 description:@"invalid ivar name"];
        }
        unsigned __int8 v23 = +[NSString stringWithUTF8String:Name];
        if (!v23)
        {
          uint64_t v33 = +[NSAssertionHandler currentHandler];
          long long v26 = +[NSString stringWithUTF8String:"void addIvarsFromObjectToDict(NSObject *__strong, NSSet *__strong, NSMutableDictionary *__strong)"];
          [v33 handleFailureInFunction:v26 file:@"suggest_tool.m" lineNumber:567 description:@"failed to convert ivar name to NSString"];
        }
        if ([v17 containsObject:v23])
        {
          int v24 = +[NSNumber numberWithUnsignedLongLong:object_getIvar(v16, v20[k])];
          [v18 setObject:v24 forKey:v23];
        }
      }
    }
    free(v20);

    id v27 = (objc_class *)objc_opt_class();
    sub_10001B7E8(v16, v27, (void *)v36[5]);
    for (m = (objc_class *)[v16 superclass]; ; m = class_getSuperclass(m))
    {
      id v29 = +[NSString stringWithUTF8String:class_getName(m)];
      unsigned int v30 = [v29 hasPrefix:@"SG"];

      char v13 = (void *)v36[5];
      if (!v30) {
        break;
      }
      sub_10001B7E8(v16, m, v13);
    }
  }
  id v12 = v13;
  _Block_object_dispose(&v35, 8);

LABEL_43:

  return v12;
}

void sub_10001B750(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001B77C(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v7 = a2;
  id v8 = sub_10001B18C(a3);
  [v6 setObject:v8 forKey:v7];

  *a4 = 0;
}

void sub_10001B7E8(void *a1, objc_class *a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  unsigned int outCount = 0;
  id v7 = class_copyPropertyList(a2, &outCount);
  if (outCount)
  {
    unint64_t v8 = 0;
    uint64_t v9 = 0;
    do
    {
      id v10 = v9;
      uint64_t v9 = +[NSString stringWithUTF8String:property_getName(v7[v8])];

      if (([v9 isEqualToString:@"superclass"] & 1) == 0)
      {
        uint64_t v11 = [v5 valueForKey:v9];
        id v12 = sub_10001B18C(v11);
        [v6 setObject:v12 forKey:v9];
      }
      ++v8;
    }
    while (v8 < outCount);
  }
  free(v7);
}

id sub_10001B904(id a1, id a2)
{
  return sub_10001B18C(a2);
}

void sub_10001B90C(id a1)
{
  id v2 = objc_alloc((Class)NSSet);
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  id v5 = objc_msgSend(v2, "initWithObjects:", v3, v4, objc_opt_class(), 0);
  id v6 = (void *)qword_10006A7F8;
  qword_10006A7F8 = (uint64_t)v5;

  id v8 = objc_alloc((Class)NSSet);
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  id v11 = objc_msgSend(v8, "initWithObjects:", v9, v10, objc_opt_class(), 0);
  id v12 = (void *)qword_10006A800;
  qword_10006A800 = (uint64_t)v11;

  id v14 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", @"_internalEntityId", 0);
  ssize_t v15 = (void *)qword_10006A808;
  qword_10006A808 = (uint64_t)v14;
}

void sub_10001BA6C(id a1, NSArray *a2)
{
  id v2 = a2;
  sub_10001A9E0((id)[(NSArray *)v2 count] == (id)2, @"base64ProtoToJSON className base64Data");
  id v4 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  uint64_t v3 = [(NSArray *)v2 objectAtIndexedSubscript:1];

  sub_10001AE90(v4, v3, 1);
}

void sub_10001BB04(id a1, NSArray *a2)
{
  [(NSArray *)a2 firstObject];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001BC34;
  v9[3] = &unk_10005A9A0;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = v2;
  +[SGAssetDownloader downloadAssetsWithTypeIdentifier:@"com.apple.MobileAsset.LinguisticData" matchingBlock:v9];
  id v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472;
  id v6 = sub_10001BCA0;
  id v7 = &unk_10005A9A0;
  id v8 = v2;
  id v3 = v2;
  +[SGAssetDownloader downloadAssetsWithTypeIdentifier:@"com.apple.MobileAsset.CoreSuggestions" matchingBlock:&v4];
  +[SGAssetDownloader downloadAssetsWithTypeIdentifier:@"com.apple.MobileAsset.CoreSuggestionsModels", &stru_10005A9E0, v4, v5, v6, v7 matchingBlock];
}

uint64_t sub_10001BC34(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKeyedSubscript:@"AssetLocale"];
  if ([&off_100064A58 containsObject:v3]) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = (uint64_t)[v3 isEqualToString:*(void *)(a1 + 32)];
  }

  return v4;
}

uint64_t sub_10001BCA0(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKeyedSubscript:@"SGAssetIdentifier"];
  if ([&off_100064A70 containsObject:v3]) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = (uint64_t)[v3 isEqualToString:*(void *)(a1 + 32)];
  }

  return v4;
}

BOOL sub_10001BD0C(id a1, NSDictionary *a2)
{
  return 1;
}

void sub_10001BD14(id a1, NSArray *a2)
{
  uint64_t v20 = a2;
  if ([(NSArray *)v20 count]) {
    char v2 = (id)[(NSArray *)v20 count] == (id)2;
  }
  else {
    char v2 = 1;
  }
  sub_10001A9E0(v2, @"miPerformIncrementalTrainingsOnFakeData TRAINING_COUNT TESTING_COUNT (both params are optional, but if you set one, you have to set the other)");
  +[SGTools beSameUserAsSuggestd];
  if ((id)[(NSArray *)v20 count] == (id)2)
  {
    id v3 = [(NSArray *)v20 objectAtIndexedSubscript:0];
    uint64_t v4 = (int)[v3 intValue];
  }
  else
  {
    uint64_t v4 = 500;
  }
  if ((id)[(NSArray *)v20 count] == (id)2)
  {
    uint64_t v5 = [(NSArray *)v20 objectAtIndexedSubscript:1];
    uint64_t v6 = (int)[v5 intValue];
  }
  else
  {
    uint64_t v6 = 100;
  }
  id v7 = +[SGMISuggestToolHelpers fakeDataWithTrainingCount:v4 testingCount:v6];
  id v8 = [v7 objectForKeyedSubscript:@"train"];
  +[SGMISuggestToolHelpers incrementalSubmodelUpdateOnSearchableItems:v8];

  uint64_t v9 = +[NSDate date];
  id v10 = [v7 objectForKeyedSubscript:@"test"];
  +[SGMISuggestToolHelpers incrementalSubmodelUpdateOnSearchableItems:v10];

  id v11 = +[NSDate date];
  [v11 timeIntervalSinceDate:v9];
  uint64_t v13 = v12;

  id v14 = objc_alloc((Class)NSString);
  ssize_t v15 = [v7 objectForKeyedSubscript:@"test"];
  id v16 = objc_msgSend(v14, "initWithFormat:", @"Inference and training over %lu mails took %.1f seconds", objc_msgSend(v15, "count"), v13);
  puts((const char *)[v16 UTF8String]);

  id v17 = objc_alloc((Class)NSString);
  id v18 = +[SGMISuggestToolHelpers jsonFormattedAccuracyStats];
  id v19 = [v17 initWithFormat:@"Accuracy stats:%@", v18];
  puts((const char *)[v19 UTF8String]);
}

void sub_10001BF6C(id a1, NSArray *a2)
{
  sub_10001A9E0([(NSArray *)a2 count] == 0, @"miStats");
  +[SGTools beSameUserAsSuggestd];
  id v2 = objc_alloc((Class)NSString);
  id v4 = +[SGMISuggestToolHelpers jsonFormattedStats];
  id v3 = [v2 initWithFormat:@"Mail saliency stats:\n%@\n", v4];
  puts((const char *)[v3 UTF8String]);
}

void sub_10001C014(id a1, NSArray *a2)
{
  sub_10001A9E0([(NSArray *)a2 count] == 0, @"miIntrospection");
  +[SGTools beSameUserAsSuggestd];
  id v2 = objc_alloc((Class)NSString);
  id v3 = +[SGMISaliencyModel description];
  id v4 = [v2 initWithFormat:@"SGMISaliencyModel introspection\n%@", v3];
  puts((const char *)[v4 UTF8String]);

  id v5 = [objc_alloc((Class)NSString) initWithFormat:@"\n\x1B[1mWarning config\x1B[0m\n"];
  puts((const char *)[v5 UTF8String]);

  id v6 = objc_alloc((Class)NSString);
  id v9 = +[SGMIConfig defaultConfig];
  id v7 = [v9 description];
  id v8 = [v6 initWithFormat:@"SGMIWarnings\n%@", v7];
  puts((const char *)[v8 UTF8String]);
}

void sub_10001C14C(id a1, NSArray *a2)
{
  id v2 = a2;
  sub_10001A9E0((id)[(NSArray *)v2 count] == (id)1, @"miSpotlightSubmodelProbabilities SPOTLIGHT_UNIQUE_IDENTIFIER");
  id v23 = [(NSArray *)v2 objectAtIndexedSubscript:0];

  +[SGTools beSameUserAsSuggestd];
  id v3 = +[SGSqlEntityStore defaultStore];
  id v4 = +[SGMISpotlightUtility itemWithUniqueIdentifier:v23 error:0];
  id v5 = v4;
  if (v4)
  {
    [v4 standardizeCSPersons];
    id v6 = [objc_alloc((Class)SGSimpleMailMessage) initWithSearchableItem:v5];
    id v7 = objc_alloc((Class)SGMIFeatureVector);
    id v8 = [v6 messageId];
    id v9 = [v7 initWithMessageId:v8 hasHashedMessageId:1 simpleMailMessage:v6 senderConnectionScore:kDefaultUnknownConnectionScore biomeMessageSummary:0 store:v3 preLoadedFeatureNames:&__NSArray0__struct];

    id v10 = [objc_alloc((Class)NSString) initWithFormat:@"Printing submodel outputs and other features used in saliency inference for spotlightUniqueIdentifier: %@\n", v23];
    puts((const char *)[v10 UTF8String]);

    id v11 = objc_alloc((Class)NSString);
    uint64_t v12 = [v6 from];
    uint64_t v13 = [v12 emailAddress];
    id v14 = [v9 feature:2003];
    ssize_t v15 = [v14 stringValue];
    id v16 = [v11 initWithFormat:@"From: <%@> (Hashed to: %@ in the DB)", v13, v15];
    puts((const char *)[v16 UTF8String]);

    id v17 = objc_alloc((Class)NSString);
    id v18 = [v6 subject];
    id v19 = [v17 initWithFormat:@"Subject: %@\n", v18];
    puts((const char *)[v19 UTF8String]);

    id v20 = objc_alloc((Class)NSString);
    id v21 = +[SGMISaliencyModel inferenceIntrospectionOnFeatureVector:v9];
    id v22 = [v20 initWithFormat:@"Inference introspection\n%@\n", v21];
    puts((const char *)[v22 UTF8String]);
  }
  else
  {
    id v6 = [objc_alloc((Class)NSString) initWithFormat:@"Item %@ not found or unavailable (e.g. the device might be locked)", v23];
    puts((const char *)[v6 UTF8String]);
  }
}

void sub_10001C428(id a1, NSArray *a2)
{
  id v2 = a2;
  sub_10001A9E0((id)[(NSArray *)v2 count] == (id)2, @"miSpotlightSaliencyFeature SPOTLIGHT_UNIQUE_IDENTIFIER FEATURE_NAME");
  id v3 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  id v4 = [(NSArray *)v2 objectAtIndexedSubscript:1];

  id v5 = +[SGSqlEntityStore defaultStore];
  id v20 = 0;
  id v6 = +[SGMISpotlightUtility itemWithUniqueIdentifier:v3 error:&v20];
  id v7 = v20;
  if (v6)
  {
    id v8 = +[SGMIFeature prettyNamesReverseMapping];
    id v9 = [v8 objectForKeyedSubscript:v4];

    if (v9)
    {
      id v10 = [objc_alloc((Class)SGSimpleMailMessage) initWithSearchableItem:v6];
      id v11 = objc_alloc((Class)SGMIFeatureVector);
      uint64_t v12 = [v10 messageId];
      uint64_t v13 = kDefaultUnknownConnectionScore;
      id v21 = v9;
      +[NSArray arrayWithObjects:&v21 count:1];
      v14 = id v19 = v7;
      id v15 = [v11 initWithMessageId:v12 hasHashedMessageId:1 simpleMailMessage:v10 senderConnectionScore:v13 biomeMessageSummary:0 store:v5 preLoadedFeatureNames:v14];

      id v16 = objc_alloc((Class)NSString);
      id v17 = objc_msgSend(v15, "feature:", objc_msgSend(v9, "integerValue"));
      id v18 = [v16 initWithFormat:@"feature %@", v17];
      puts((const char *)[v18 UTF8String]);

      id v7 = v19;
    }
    else
    {
      id v10 = [objc_alloc((Class)NSString) initWithFormat:@"The feature <%@> does not exist.", v4];
      puts((const char *)[v10 UTF8String]);
    }
  }
  else
  {
    id v9 = [objc_alloc((Class)NSString) initWithFormat:@"Item %@ not found or unavailable (e.g. the device might be locked): %@", v3, v7];
    puts((const char *)[v9 UTF8String]);
  }
}

void sub_10001C6C8(id a1, NSArray *a2)
{
  id v2 = a2;
  sub_10001A9E0((id)[(NSArray *)v2 count] == (id)1, @"miSetHighEngagementToMessageIdsList COMMA_SEPARATED_MSG_IDS_LIST");
  id v3 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  id v4 = [v3 componentsSeparatedByString:@","];

  +[SGTools beSameUserAsSuggestd];
  id v5 = [objc_alloc((Class)NSString) initWithFormat:@"Adding events to Biome stream to simulate that all messages were read for 15 seconds and scrolled to the end\n"];
  puts((const char *)[v5 UTF8String]);

  id v6 = +[EMBiomeStreamDirectory url];
  id v7 = v6;
  if (v6)
  {
    id v28 = v2;
    long long v26 = v6;
    uint64_t v25 = [v6 path];
    id v8 = +[BMStoreConfig newPrivateStreamDefaultConfigurationWithStoreBasePath:](BMStoreConfig, "newPrivateStreamDefaultConfigurationWithStoreBasePath:");
    id v9 = objc_alloc((Class)BMStoreStream);
    int v24 = v8;
    id v23 = [v9 initWithPrivateStreamIdentifier:kEMBiomeStreamIdentifier storeConfig:v8];
    id v10 = [v23 source];
    v36[0] = kEMPayloadKeyDuration;
    v36[1] = kEMPayloadKeyScrolledToEnd;
    v37[0] = &off_100064C68;
    v37[1] = &__kCFBooleanTrue;
    id v11 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:2];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v27 = v4;
    id obj = v4;
    id v12 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v31;
      uint64_t v15 = kEMEventNameMessageViewStart;
      uint64_t v16 = kEMEventNameMessageViewEnd;
      do
      {
        for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v31 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          id v19 = [objc_alloc((Class)EMBiomeEvent) initWithEventName:v15 messageId:v18 payload:&__NSDictionary0__struct];
          [v10 sendEvent:v19];
          id v20 = [objc_alloc((Class)EMBiomeEvent) initWithEventName:v16 messageId:v18 payload:v11];
          [v10 sendEvent:v20];
        }
        id v13 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v13);
    }

    id v21 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Added events for %d messages", objc_msgSend(obj, "count"));
    puts((const char *)[v21 UTF8String]);

    id v4 = v27;
    id v2 = v28;
    id v22 = v25;
    id v7 = v26;
  }
  else
  {
    id v22 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Error retrieving directory for Biome stream data", buf, 2u);
    }
  }
}

void sub_10001CA40(id a1, NSArray *a2)
{
  id v2 = a2;
  sub_10001A9E0((id)[(NSArray *)v2 count] == (id)1, @"miSetHighEngagement SENDER_EMAIL");
  id v27 = v2;
  uint64_t v3 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  +[SGTools beSameUserAsSuggestd];
  id v4 = [objc_alloc((Class)NSString) initWithFormat:@"Adding events to Biome stream to simulate that all messages from %@ from the past 365 days were read for 15 seconds and scrolled to the end\n", v3];
  puts((const char *)[v4 UTF8String]);

  id v5 = objc_opt_new();
  uint64_t v41 = 0;
  long long v42 = &v41;
  uint64_t v43 = 0x2020000000;
  int v44 = 0;
  id v39 = &v41;
  id v40 = 0;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  void v36[2] = sub_10001CFC0;
  v36[3] = &unk_10005A898;
  id v28 = (id)v3;
  id v37 = v28;
  id v30 = v5;
  id v38 = v30;
  LOBYTE(v3) = +[SGMISpotlightUtility queryFromDaysAgo:365 throughDaysAgo:0 limit:10000 withError:&v40 handler:v36];
  id v29 = v40;
  if (v3)
  {
    id v6 = objc_alloc((Class)NSString);
    id v7 = objc_msgSend(v6, "initWithFormat:", @"Number of items returned by Spotlight query: %d", *((unsigned int *)v42 + 6));
    puts((const char *)[v7 UTF8String]);

    id v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Number of items with matching email address: %d", objc_msgSend(v30, "count"));
    puts((const char *)[v8 UTF8String]);

    id v9 = +[SGSqlEntityStore defaultStore];
    long long v26 = [v9 messageIdsForBundleIdentifier:SGBundleIdentifierMail uniqueIdentifiers:v30];
    id v10 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Number of messageIds found matching spotlightUniqueIdentifiers: %d", objc_msgSend(v26, "count"));
    puts((const char *)[v10 UTF8String]);

    id v11 = +[EMBiomeStreamDirectory url];
    int v24 = v11;
    if (v11)
    {
      log = [v11 path];
      id v23 = +[BMStoreConfig newPrivateStreamDefaultConfigurationWithStoreBasePath:](BMStoreConfig, "newPrivateStreamDefaultConfigurationWithStoreBasePath:");
      id v12 = objc_alloc((Class)BMStoreStream);
      id v22 = [v12 initWithPrivateStreamIdentifier:kEMBiomeStreamIdentifier storeConfig:v23];
      id v13 = [v22 source];
      v46[0] = kEMPayloadKeyDuration;
      v46[1] = kEMPayloadKeyScrolledToEnd;
      v47[0] = &off_100064C68;
      v47[1] = &__kCFBooleanTrue;
      uint64_t v14 = +[NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:2];
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v15 = v26;
      id v16 = [v15 countByEnumeratingWithState:&v31 objects:v45 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v32;
        uint64_t v18 = kEMEventNameMessageViewEnd;
        do
        {
          for (uint64_t i = 0; i != v16; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v32 != v17) {
              objc_enumerationMutation(v15);
            }
            id v20 = [objc_alloc((Class)EMBiomeEvent) initWithEventName:v18 messageId:*(void *)(*((void *)&v31 + 1) + 8 * i) payload:v14];
            [v13 sendEvent:v20];
          }
          id v16 = [v15 countByEnumeratingWithState:&v31 objects:v45 count:16];
        }
        while (v16);
      }

      id v21 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Added events for %d messages", objc_msgSend(v15, "count"));
      puts((const char *)[v21 UTF8String]);
    }
    else
    {
      log = sgMailIntelligenceLogHandle();
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error retrieving directory for Biome stream data", buf, 2u);
      }
    }
  }
  else
  {
    id v9 = [objc_alloc((Class)NSString) initWithFormat:@"Error from SGMISpotlightUtility: %@", v29];
    puts((const char *)[v9 UTF8String]);
  }

  _Block_object_dispose(&v41, 8);
}

void sub_10001CF6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

void sub_10001CFC0(void *a1, void *a2)
{
  id v3 = a2;
  ++*(_DWORD *)(*(void *)(a1[6] + 8) + 24);
  id v9 = v3;
  id v4 = [v3 attributeSet];
  id v5 = [v4 attributeForKey:@"kMDItemAuthorEmailAddresses"];
  unsigned int v6 = [v5 containsObject:a1[4]];

  if (v6)
  {
    id v7 = (void *)a1[5];
    id v8 = [v9 uniqueIdentifier];
    [v7 addObject:v8];
  }
}

void sub_10001D07C(id a1, NSArray *a2)
{
  id v2 = a2;
  sub_10001A9E0((id)[(NSArray *)v2 count] == (id)2, @"miPreprocessingForOfflineTraining INPUT_FOLDER_PATH OUTPUT_FOLDER_PATH");
  id v3 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  id v4 = [(NSArray *)v2 objectAtIndexedSubscript:1];
  unsigned int v6 = +[NSFileManager defaultManager];
  id v7 = [v6 contentsOfDirectoryAtPath:v3 error:0];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001D1CC;
  v10[3] = &unk_10005A850;
  id v8 = v3;
  id v11 = v8;
  id v9 = v4;
  id v12 = v9;
  id v13 = &off_100064A40;
  [v7 enumerateObjectsUsingBlock:v10];
}

void sub_10001D1CC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 pathExtension];
  id v5 = [v4 lowercaseString];

  if ([v5 isEqualToString:@"json"])
  {
    id v6 = [objc_alloc((Class)NSString) initWithFormat:@"Processing %@", v3];
    puts((const char *)[v6 UTF8String]);

    id v7 = [*(id *)(a1 + 32) stringByAppendingPathComponent:v3];
    id v8 = +[NSData dataWithContentsOfFile:v7];
    if (v8)
    {
      id v9 = +[NSFileManager defaultManager];
      uint64_t v10 = *(void *)(a1 + 40);
      id v98 = 0;
      [v9 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:0 error:&v98];
      id v11 = v98;

      if (v11)
      {
        id v54 = [objc_alloc((Class)NSString) initWithFormat:@"Error creating directory: %@", v11];
        puts((const char *)[v54 UTF8String]);

        exit(1);
      }
      id v97 = 0;
      id v12 = +[NSJSONSerialization JSONObjectWithData:v8 options:0 error:&v97];
      id v13 = v97;
      if (v13)
      {
        id v14 = [objc_alloc((Class)NSString) initWithFormat:@"Error: invalid JSON in file: %@, error %@", v7, v13];
        puts((const char *)[v14 UTF8String]);
      }
      else
      {
        uint64_t v71 = a1;
        id v55 = v8;
        uint64_t v56 = v7;
        CFStringRef v57 = v5;
        id v58 = v3;
        uint64_t v73 = +[SGSqlEntityStore sqlStoreInMemory];
        id v64 = objc_opt_new();
        uint64_t v72 = +[SGSimpleMailMessage simpleMailMessageFromHeaders:&__NSArray0__struct];
        long long v93 = 0u;
        long long v94 = 0u;
        long long v95 = 0u;
        long long v96 = 0u;
        id obj = [v12 objectForKeyedSubscript:@"sub-model-data"];
        id v60 = v12;
        id v74 = [obj countByEnumeratingWithState:&v93 objects:v103 count:16];
        if (v74)
        {
          uint64_t v69 = *(void *)v94;
          do
          {
            for (uint64_t i = 0; i != v74; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v94 != v69) {
                objc_enumerationMutation(obj);
              }
              uint64_t v17 = *(void **)(*((void *)&v93 + 1) + 8 * i);
              long long v89 = 0u;
              long long v90 = 0u;
              long long v91 = 0u;
              long long v92 = 0u;
              uint64_t v18 = [v12 objectForKeyedSubscript:@"sub-model-data"];
              id v19 = [v18 objectForKeyedSubscript:v17];

              id v20 = [v19 countByEnumeratingWithState:&v89 objects:v102 count:16];
              if (v20)
              {
                id v21 = v20;
                uint64_t v22 = *(void *)v90;
                do
                {
                  for (uint64_t j = 0; j != v21; uint64_t j = (char *)j + 1)
                  {
                    if (*(void *)v90 != v22) {
                      objc_enumerationMutation(v19);
                    }
                    id v24 = [objc_alloc((Class)SGMIFeatureVector) initWithDictionary:*(void *)(*((void *)&v89 + 1) + 8 * (void)j) simpleMailMessage:v72 messageId:&stru_10005B0F8 hasHashedMessageId:1 store:v73];
                    objc_msgSend(v64, "ingest:asSalient:", v24, objc_msgSend(v17, "isEqualToString:", @"salient"));
                  }
                  id v21 = [v19 countByEnumeratingWithState:&v89 objects:v102 count:16];
                }
                while (v21);
              }

              id v12 = v60;
            }
            id v74 = [obj countByEnumeratingWithState:&v93 objects:v103 count:16];
          }
          while (v74);
        }

        uint64_t v25 = objc_opt_new();
        [v64 commitToStore:v73 updateDate:v25];

        long long v75 = objc_opt_new();
        long long v85 = 0u;
        long long v86 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        id v66 = v12;
        id v61 = [v66 countByEnumeratingWithState:&v85 objects:v101 count:16];
        if (v61)
        {
          uint64_t v59 = *(void *)v86;
          do
          {
            uint64_t v26 = 0;
            do
            {
              if (*(void *)v86 != v59) {
                objc_enumerationMutation(v66);
              }
              uint64_t v62 = v26;
              uint64_t v27 = *(void *)(*((void *)&v85 + 1) + 8 * v26);
              id v28 = objc_opt_new();
              [v75 setObject:v28 forKeyedSubscript:v27];

              long long v83 = 0u;
              long long v84 = 0u;
              long long v81 = 0u;
              long long v82 = 0u;
              id v63 = [v66 objectForKeyedSubscript:v27];
              id obja = [v63 countByEnumeratingWithState:&v81 objects:v100 count:16];
              if (obja)
              {
                uint64_t v65 = *(void *)v82;
                do
                {
                  uint64_t v29 = 0;
                  do
                  {
                    if (*(void *)v82 != v65) {
                      objc_enumerationMutation(v63);
                    }
                    uint64_t v70 = v29;
                    uint64_t v30 = *(void *)(*((void *)&v81 + 1) + 8 * v29);
                    long long v31 = objc_opt_new();
                    long long v32 = [v75 objectForKeyedSubscript:v27];
                    [v32 setObject:v31 forKeyedSubscript:v30];

                    long long v79 = 0u;
                    long long v80 = 0u;
                    long long v77 = 0u;
                    long long v78 = 0u;
                    long long v33 = [v66 objectForKeyedSubscript:v27];
                    long long v34 = [v33 objectForKeyedSubscript:v30];

                    id v35 = [v34 countByEnumeratingWithState:&v77 objects:v99 count:16];
                    if (v35)
                    {
                      id v36 = v35;
                      uint64_t v37 = *(void *)v78;
                      do
                      {
                        for (unint64_t k = 0; k != v36; unint64_t k = (char *)k + 1)
                        {
                          if (*(void *)v78 != v37) {
                            objc_enumerationMutation(v34);
                          }
                          id v39 = [objc_alloc((Class)SGMIFeatureVector) initWithDictionary:*(void *)(*((void *)&v77 + 1) + 8 * (void)k) simpleMailMessage:v72 messageId:&stru_10005B0F8 hasHashedMessageId:0 store:v73];
                          id v40 = [v75 objectForKeyedSubscript:v27];
                          uint64_t v41 = [v40 objectForKeyedSubscript:v30];
                          long long v42 = [v39 flatVectorForFeatureNames:*(void *)(v71 + 48)];
                          [v41 addObject:v42];
                        }
                        id v36 = [v34 countByEnumeratingWithState:&v77 objects:v99 count:16];
                      }
                      while (v36);
                    }

                    uint64_t v29 = v70 + 1;
                  }
                  while ((id)(v70 + 1) != obja);
                  id obja = [v63 countByEnumeratingWithState:&v81 objects:v100 count:16];
                }
                while (obja);
              }

              uint64_t v26 = v62 + 1;
            }
            while ((id)(v62 + 1) != v61);
            id v61 = [v66 countByEnumeratingWithState:&v85 objects:v101 count:16];
          }
          while (v61);
        }

        uint64_t v43 = sgMap();
        [v75 setObject:v43 forKeyedSubscript:@"features"];

        id v3 = v58;
        int v44 = [*(id *)(v71 + 40) stringByAppendingPathComponent:v58];
        id v76 = 0;
        long long v45 = +[NSJSONSerialization dataWithJSONObject:v75 options:0 error:&v76];
        id v46 = v76;
        if (v46)
        {
          id v47 = [objc_alloc((Class)NSString) initWithFormat:@"Unable to serialize processed data of %@: %@", v58, v46];
          puts((const char *)[v47 UTF8String]);
          id v7 = v56;
          id v5 = v57;
          id v13 = 0;
          id v8 = v55;
        }
        else
        {
          long long v48 = +[NSFileManager defaultManager];
          unsigned __int8 v49 = [v48 fileExistsAtPath:v44];

          id v7 = v56;
          id v5 = v57;
          id v13 = 0;
          if ((v49 & 1) == 0)
          {
            id v50 = +[NSFileManager defaultManager];
            [v50 createFileAtPath:v44 contents:0 attributes:0];
          }
          id v51 = objc_alloc((Class)NSString);
          id v52 = v45;
          id v47 = objc_msgSend(v51, "initWithBytes:length:encoding:", objc_msgSend(v52, "bytes"), objc_msgSend(v52, "length"), 4);
          id v53 = [v47 dataUsingEncoding:4];
          [v53 writeToFile:v44 atomically:0];

          id v8 = v55;
        }

        id v12 = v60;
        id v14 = (id)v73;
      }
    }
    else
    {
      id v15 = [objc_alloc((Class)NSString) initWithFormat:@"Error: failed to load file: %@", v7];
      puts((const char *)[v15 UTF8String]);
    }
  }
}

NSString *__cdecl sub_10001DA94(id a1, NSNumber *a2)
{
  uint64_t v2 = [(NSNumber *)a2 intValue];

  return (NSString *)+[SGMIFeature prettyName:v2];
}

void sub_10001DAD8(id a1, NSArray *a2)
{
  uint64_t v2 = a2;
  sub_10001A9E0((id)[(NSArray *)v2 count] == (id)2, @"miFeedbackSPIForFollowUp VALUE BODY\nfor instance: suggest_tool miFeedbackSPIForFollowUp POSITIVE \"could you send me the document please?\" \nVALUE in POSITIVE NEGATIVE NONE");
  id v11 = +[SGSuggestionsService serviceForMail];
  id v3 = [(NSArray *)v2 objectAtIndexedSubscript:1];
  id v4 = [v11 identifyFollowUpWarningFromSubject:&stru_10005B0F8 body:v3 date:0 error:0];
  id v5 = [v4 toLightJson];
  id v6 = [(NSArray *)v2 objectAtIndexedSubscript:0];

  id v7 = [v6 lowercaseString];
  id v8 = [&off_100064EF0 objectForKeyedSubscript:v7];

  id v9 = [v11 reportMailIntelligenceFollowUpUserEngagement:v8 forStringFromFollowUpWarning:v5 error:0];
  id v10 = [objc_alloc((Class)NSString) initWithFormat:@"Engagement [%ld] registered for string [%@].", v8, v3];
  puts((const char *)[v10 UTF8String]);
}

void sub_10001DC3C(id a1, NSArray *a2)
{
  uint64_t v2 = a2;
  sub_10001A9E0((id)[(NSArray *)v2 count] == (id)2, @"miRegisterSetting VALUE FEATURE_NAME\nfor instance: suggest_tool miRegisterSetting followup YES\n");
  id v16 = +[SGSuggestionsService serviceForMail];
  id v3 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  id v4 = [v3 lowercaseString];
  id v5 = [v4 isEqual:@"yes"];

  id v6 = [(NSArray *)v2 objectAtIndexedSubscript:1];

  id v7 = [v6 lowercaseString];
  id v8 = [&off_100064EC8 objectForKeyedSubscript:v7];

  if (v8)
  {
    id v9 = [v6 lowercaseString];
    id v10 = [&off_100064EC8 objectForKeyedSubscript:v9];
    id v11 = [v10 integerValue];

    id v12 = [v16 reportValue:v5 forFeatureSetting:v11 error:0];
    id v13 = objc_alloc((Class)NSString);
    id v14 = +[NSNumber numberWithBool:v5];
    id v15 = [v13 initWithFormat:@"SPI called with value %@ for feature %@. Check the logs.", v14, v6];
    puts((const char *)[v15 UTF8String]);
  }
  else
  {
    id v14 = [objc_alloc((Class)NSString) initWithFormat:@"The feature %@ does not exist.", v6];
    puts((const char *)[v14 UTF8String]);
  }
}

void sub_10001DE18(id a1, NSArray *a2)
{
  uint64_t v2 = a2;
  sub_10001A9E0((id)[(NSArray *)v2 count] == (id)5, @"miResetAndEvaluate DB_PATH OUTPUT_FILE_PATH [SELECTION] [PRINT VERBOSITY]\nfor instance: suggest_tool miResetAndEvaluate \\\n/var/mobile/sgmi/sgmi.sqlite \\\n/var/mobile/sgmi/list_of_firstnames.txt \\\n/tmp/report.csv \\\n\"SELECT * from data INNER JOIN sources ON data.source_id = sources.id WHERE sources.kind = 'TryRating'\" 500");
  id v3 = objc_opt_new();
  id v4 = +[NSPredicate predicateWithValue:1];
  id v13 = CNContactIdentifierKey;
  id v5 = +[NSArray arrayWithObjects:&v13 count:1];
  id v6 = [v3 unifiedContactsMatchingPredicate:v4 keysToFetch:v5 error:0];

  if ([v6 count])
  {
    id v7 = [objc_alloc((Class)NSString) initWithFormat:@"Warning evaluation results might interfere with the device's contacts"];
    puts((const char *)[v7 UTF8String]);
  }
  id v8 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  id v9 = [(NSArray *)v2 objectAtIndexedSubscript:1];
  id v10 = [(NSArray *)v2 objectAtIndexedSubscript:2];
  id v11 = [(NSArray *)v2 objectAtIndexedSubscript:3];
  id v12 = [(NSArray *)v2 objectAtIndexedSubscript:4];

  +[SGMISuggestToolHelpers performEvaluationOnDBPath:contactPath:outputFilePath:query:printStatsEvery:](SGMISuggestToolHelpers, "performEvaluationOnDBPath:contactPath:outputFilePath:query:printStatsEvery:", v8, v9, v10, v11, [v12 integerValue]);
}

void sub_10001E000(id a1, NSArray *a2)
{
  uint64_t v2 = a2;
  sub_10001A9E0((id)[(NSArray *)v2 count] == (id)3, @"miRunOnPersonalEmails LIMIT -language en\n");
  id v3 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  id v4 = [v3 integerValue];

  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = sub_100006C74;
  void v13[4] = sub_100006C84;
  id v14 = 0;
  if ([(NSArray *)v2 count] < 3)
  {
    CFStringRef v5 = &stru_10005B0F8;
  }
  else
  {
    CFStringRef v5 = [(NSArray *)v2 objectAtIndexedSubscript:2];
  }
  id v14 = (__CFString *)v5;
  v16[0] = MDItemSubject;
  v16[1] = MDItemUniqueIdentifier;
  id v6 = +[NSArray arrayWithObjects:v16 count:2];
  uint64_t v15 = SGBundleIdentifierMail;
  id v7 = +[NSArray arrayWithObjects:&v15 count:1];
  id v8 = +[SGMISpotlightUtility queryEmailsFromDaysAgo:365 throughDaysAgo:0 fetchAttributes:v6 filterQuery:0 queryString:@"contentType == \"public.email-message\" && kMDItemMailboxes == \"mailbox.sent\" " bundleIds:v7 spotlightTimeOut:10 withError:0];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001E258;
  v9[3] = &unk_10005A788;
  id v10 = &stru_10005A738;
  id v11 = v13;
  id v12 = v4;
  [v8 enumerateObjectsUsingBlock:v9];

  _Block_object_dispose(v13, 8);
}

void sub_10001E238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001E258(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = [objc_alloc((Class)SGSimpleMailMessage) initWithSearchableItem:v7];
  id v9 = objc_alloc((Class)SGMIFeatureVector);
  id v10 = [v7 uniqueIdentifier];
  id v11 = +[SGSqlEntityStore defaultStore];
  id v12 = [v9 initWithMessageId:&stru_10005B0F8 hasHashedMessageId:0 simpleMailMessage:v8 spotlightIdentifier:v10 senderConnectionScore:&off_100064B00 biomeMessageSummary:0 store:v11 preLoadedFeatureNames:&off_100064A28];

  id v13 = [v12 mailMessage];
  id v14 = [v13 textContentLanguageIdentifier];
  unsigned int v15 = [v14 isEqualToString:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

  if (v15)
  {
    uint64_t v36 = 0;
    uint64_t v37 = &v36;
    uint64_t v38 = 0x3032000000;
    id v39 = sub_100006C74;
    id v40 = sub_100006C84;
    id v41 = 0;
    id v16 = [v12 mailMessage];
    id v41 = [v16 textContent];

    uint64_t v30 = 0;
    long long v31 = &v30;
    uint64_t v32 = 0x3032000000;
    long long v33 = sub_100006C74;
    long long v34 = sub_100006C84;
    id v35 = 0;
    uint64_t v17 = [v12 mailMessage];
    id v35 = [v17 subject];

    uint64_t v18 = +[SGMIFollowUpAnalyzer identifyFollowUpWarningFromSubject:v31[5] body:v37[5] date:0];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v19 = +[SGSuggestionsService serviceForMail];
    id v20 = v19;
    if (v37[5]) {
      CFStringRef v21 = (const __CFString *)v37[5];
    }
    else {
      CFStringRef v21 = &stru_10005B0F8;
    }
    uint64_t v22 = [v19 identifyComposeWarningsFromSubject:v31[5] content:v21 attributes:&__NSDictionary0__struct toRecipients:&__NSArray0__struct ccRecipients:&__NSArray0__struct bccRecipients:&__NSArray0__struct originalToRecipients:&__NSArray0__struct originalCcRecipients:&__NSArray0__struct attachments:&__NSArray0__struct error:0];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10001E5F0;
    v24[3] = &unk_10005A760;
    id v26 = *(id *)(a1 + 32);
    uint64_t v27 = &v30;
    id v28 = &v36;
    unint64_t v29 = a3;
    id v23 = v18;
    id v25 = v23;
    [v22 enumerateObjectsUsingBlock:v24];

    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v36, 8);
  }
  if (*(void *)(a1 + 48) <= a3) {
    *a4 = 1;
  }
}

void sub_10001E5BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

void sub_10001E5F0(void *a1, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1[6] + 8) + 40);
  uint64_t v3 = *(void *)(*(void *)(a1[7] + 8) + 40);
  uint64_t v4 = a1[8];
  uint64_t v5 = a1[5];
  id v7 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    CFStringRef v6 = @"Omitted recipient";
  }
  else {
    CFStringRef v6 = @"Omitted attachment";
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, id, uint64_t, const __CFString *))(v5 + 16))(v5, v2, v3, v7, v4, v6);
}

void sub_10001E6B0(id a1, NSString *a2, NSString *a3, SGMailIntelligenceWarning *a4, unint64_t a5, NSString *a6)
{
  long long v42 = a3;
  id v10 = a6;
  if (a4)
  {
    id v11 = a4;
    id v12 = a2;
    id v13 = [(SGMailIntelligenceWarning *)v11 snippet];
    id v14 = [v13 stringByReplacingOccurrencesOfString:@"…" withString:&stru_10005B0F8];
    unsigned int v15 = (char *)[(NSString *)v42 rangeOfString:v14];
    uint64_t v17 = v16;

    id v18 = objc_alloc((Class)NSString);
    id v19 = [objc_alloc((Class)NSString) initWithFormat:@"\n------EMAIL %lu %@--------------------\n", a5, v10];
    id v20 = sub_100006034(v19);
    id v21 = [v18 initWithFormat:@"%@", v20];
    puts((const char *)[v21 UTF8String]);

    id v22 = [objc_alloc((Class)NSString) initWithFormat:@"Subject:\n%@\n", v12];
    id v23 = v22;
    puts((const char *)[v23 UTF8String]);

    id v24 = objc_alloc((Class)NSString);
    id v25 = v24;
    if (v15 == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      id v26 = [v24 initWithFormat:@"Body:\n%@\n", v42];
      puts((const char *)[v26 UTF8String]);
    }
    else
    {
      id v41 = v11;
      uint64_t v27 = v42;
      id v40 = objc_alloc((Class)NSString);
      id v28 = [(NSString *)v27 substringToIndex:v15];
      unint64_t v29 = -[NSString substringWithRange:](v27, "substringWithRange:", v15, v17);
      sub_100006034(v29);
      id v30 = (id)objc_claimAutoreleasedReturnValue();
      if (sub_1000060A8()) {
        id v31 = [objc_alloc((Class)NSString) initWithFormat:@"\x1B[4m%@\x1B[0m", v30];
      }
      else {
        id v31 = v30;
      }
      uint64_t v32 = v31;

      long long v33 = [(NSString *)v27 substringFromIndex:&v15[v17]];
      id v26 = [v40 initWithFormat:@"%@%@%@", v28, v32, v33];

      id v34 = [v25 initWithFormat:@"Body:\n%@\n", v26];
      puts((const char *)[v34 UTF8String]);

      id v11 = v41;
    }

    id v35 = [objc_alloc((Class)NSString) initWithFormat:@"------------------"];
    puts((const char *)[v35 UTF8String]);

    id v36 = objc_alloc((Class)NSString);
    uint64_t v37 = sub_100006034(v10);
    uint64_t v38 = [(SGMailIntelligenceWarning *)v11 snippet];

    id v39 = [v36 initWithFormat:@"%@: %@", v37, v38];
    puts((const char *)[v39 UTF8String]);
  }
}

id sub_10001E9F4(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 componentsSeparatedByString:@","];
  uint64_t v3 = objc_opt_new();
  unsigned __int8 v4 = [v1 isEqualToString:&stru_10005B0F8];

  if ((v4 & 1) == 0)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10001EB5C;
    v6[3] = &unk_10005A698;
    id v7 = v3;
    [v2 enumerateObjectsUsingBlock:v6];
  }

  return v3;
}

void sub_10001EAE0(id a1, NSString *a2, unint64_t a3, BOOL *a4)
{
  unsigned __int8 v4 = a2;
  id v5 = [objc_alloc((Class)NSString) initWithFormat:@"%@", v4];

  id v6 = v5;
  puts((const char *)[v6 UTF8String]);
}

void sub_10001EB5C(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 componentsSeparatedByString:@"<"];
  unsigned __int8 v4 = [v3 objectAtIndexedSubscript:0];
  id v5 = [v3 objectAtIndexedSubscript:1];
  id v6 = [v3 objectAtIndexedSubscript:1];
  id v7 = objc_msgSend(v5, "substringToIndex:", (char *)objc_msgSend(v6, "length") - 1);

  id v8 = *(void **)(a1 + 32);
  id v9 = objc_alloc((Class)CSPerson);
  id v12 = v7;
  id v10 = +[NSArray arrayWithObjects:&v12 count:1];
  id v11 = [v9 initWithDisplayName:v4 handles:v10 handleIdentifier:CNContactEmailAddressesKey];
  [v8 addObject:v11];
}

void sub_10001ECA4(id a1, NSArray *a2)
{
}

void sub_10001ECB4(id a1, NSArray *a2)
{
}

void sub_10001ECC4(id a1, NSArray *a2)
{
}

void sub_10001ECD4(id a1, NSArray *a2)
{
}

void sub_10001ECE4(id a1, NSArray *a2)
{
}

void sub_10001ECF4(id a1, NSArray *a2)
{
}

void sub_10001ED04(id a1, NSArray *a2)
{
}

void sub_10001ED14(id a1, NSArray *a2)
{
}

void sub_10001ED24(id a1, NSArray *a2)
{
}

void sub_10001ED34(id a1, NSArray *a2)
{
}

void sub_10001ED44(id a1, NSArray *a2)
{
}

void sub_10001ED54(id a1, NSArray *a2)
{
}

void sub_10001ED64(id a1, NSArray *a2)
{
}

void sub_10001ED74(id a1, NSArray *a2)
{
}

void sub_10001ED84(id a1, NSArray *a2)
{
}

void sub_10001ED94(id a1, NSArray *a2)
{
}

void sub_10001EDA4(id a1, NSArray *a2)
{
}

void sub_10001EDB4(id a1, NSArray *a2)
{
}

void sub_10001EDC4(id a1, NSArray *a2)
{
}

void sub_10001EDD4(id a1, NSArray *a2)
{
}

void sub_10001EDE4(id a1, NSArray *a2)
{
}

void sub_10001EDF4(id a1, NSArray *a2)
{
}

void sub_10001EE04(id a1, NSArray *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = +[SGSuggestionsService serviceForInternal];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  unsigned int v15 = sub_100006C74;
  uint64_t v16 = sub_100006C84;
  id v17 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001EFFC;
  v9[3] = &unk_100059748;
  id v11 = &v12;
  unsigned __int8 v4 = dispatch_semaphore_create(0);
  id v10 = v4;
  [v3 deleteCloudKitZoneWithCompletion:v9];
  if (+[_PASDispatch waitForSemaphore:v4 timeoutSeconds:1.5] == 1)
  {
    id v5 = [objc_alloc((Class)NSString) initWithFormat:@"Please wait...this can take a few seconds if suggestd wasn't already running..."];
    puts((const char *)[v5 UTF8String]);

    dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  }
  if (v13[5])
  {
    id v7 = objc_alloc((Class)NSString);
    id v8 = [v7 initWithFormat:@"Error deleting CloudKit zone: %@", v13[5]];
    puts((const char *)[v8 UTF8String]);

    exit(1);
  }
  id v6 = [objc_alloc((Class)NSString) initWithFormat:@"Successfully deleted CloudKit zone"];
  puts((const char *)[v6 UTF8String]);

  _Block_object_dispose(&v12, 8);
}

void sub_10001EFE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001EFFC(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10001F05C(id a1, BOOL a2)
{
}

BOOL sub_10001F06C(id a1)
{
  return +[SGPreferenceStorage EventMLRegexEnsembleExtractionEnabled];
}

void sub_10001F078(id a1, BOOL a2)
{
}

BOOL sub_10001F088(id a1)
{
  return +[SGPreferenceStorage detectRemindersInMail];
}

void sub_10001F094(id a1, BOOL a2)
{
}

BOOL sub_10001F0A4(id a1)
{
  return +[SGPreferenceStorage detectStructuredEventsML];
}

void sub_10001F0B0(id a1, BOOL a2)
{
}

BOOL sub_10001F0C0(id a1)
{
  return +[SGPreferenceStorage detectReminders];
}

void sub_10001F0CC(id a1, BOOL a2)
{
}

BOOL sub_10001F0DC(id a1)
{
  return +[SGPreferenceStorage detectStructuredEvents];
}

void sub_10001F0E8(id a1, BOOL a2)
{
}

BOOL sub_10001F0F8(id a1)
{
  return +[SGPreferenceStorage detectNLEvents];
}

void sub_10001F104(id a1, BOOL a2)
{
}

BOOL sub_10001F114(id a1)
{
  return +[SGPreferenceStorage detectContacts];
}

void sub_10001F120(id a1, NSArray *a2)
{
  uint64_t v2 = a2;
  sub_10001A9E0((id)[(NSArray *)v2 count] == (id)3, @"runEspressoTrainingPlan RECIPE_JSON SERIALIZED_PLAN_PATH ESPRESSO_MODEL_PATH");
  uint64_t v3 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  id v4 = +[NSData dataWithContentsOfFile:v3];

  if (v4)
  {
    id v24 = 0;
    id v5 = +[NSJSONSerialization JSONObjectWithData:v4 options:0 error:&v24];
    id v6 = v24;
    if (v5)
    {
      dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
      id v8 = +[SGSuggestionsService serviceForFides];
      id v21 = v6;
      id v9 = [(NSArray *)v2 objectAtIndexedSubscript:1];
      id v10 = +[NSURL fileURLWithPath:v9];
      v25[0] = v10;
      id v11 = [(NSArray *)v2 objectAtIndexedSubscript:2];
      uint64_t v12 = +[NSURL fileURLWithPath:v11];
      v25[1] = v12;
      id v13 = +[NSArray arrayWithObjects:v25 count:2];

      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10001F414;
      v22[3] = &unk_10005A190;
      dispatch_semaphore_t v23 = v7;
      uint64_t v14 = v7;
      [v8 evaluateRecipe:v5 attachments:v13 completion:v22];
      dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);

      unsigned int v15 = v21;
    }
    else
    {
      id v19 = objc_alloc((Class)NSString);
      unsigned int v15 = [(NSArray *)v2 objectAtIndexedSubscript:0];
      id v20 = [v19 initWithFormat:@"Error: invalid JSON in file: %@, error %@", v15, v6];

      id v8 = v20;
      puts((const char *)[v8 UTF8String]);
    }
  }
  else
  {
    id v16 = objc_alloc((Class)NSString);
    id v17 = [(NSArray *)v2 objectAtIndexedSubscript:0];
    id v18 = [v16 initWithFormat:@"Error: failed to load file: %@", v17];
    puts((const char *)[v18 UTF8String]);
  }
}

void sub_10001F414(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = objc_alloc((Class)NSString);
  if (v5) {
    id v7 = [v6 initWithFormat:@"Error: %@", v5];
  }
  else {
    id v7 = [v6 initWithFormat:@"Result: %@", v9];
  }
  id v8 = v7;
  puts((const char *)[v8 UTF8String]);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10001F4C0(id a1, NSArray *a2)
{
  uint64_t v2 = a2;
  sub_10001A9E0((id)[(NSArray *)v2 count] == (id)1, @"runTrysteroPlan SERIALIZED_PLAN_PATH");
  uint64_t v3 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  id v4 = +[NSData dataWithContentsOfFile:v3];

  if (v4)
  {
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    id v6 = +[SGSuggestionsService serviceForFides];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10001F634;
    v9[3] = &unk_10005A190;
    dispatch_semaphore_t v10 = v5;
    id v7 = v5;
    [v6 planReceivedFromServerWithPayload:v4 completion:v9];
    dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    id v8 = objc_alloc((Class)NSString);
    id v6 = [(NSArray *)v2 objectAtIndexedSubscript:0];
    id v7 = [v8 initWithFormat:@"Error: failed to load file: %@", v6];
    puts((const char *)[v7 UTF8String]);
  }
}

void sub_10001F634(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = objc_alloc((Class)NSString);
  if (v5) {
    id v7 = [v6 initWithFormat:@"Error: %@", v5];
  }
  else {
    id v7 = [v6 initWithFormat:@"Result: %@", v9];
  }
  id v8 = v7;
  puts((const char *)[v8 UTF8String]);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10001F6E0(id a1, NSArray *a2)
{
  uint64_t v14 = a2;
  uint64_t v2 = [(NSArray *)v14 firstObject];
  uint64_t v3 = +[SGBinaryClassificationModel modelFromMobileAssetForName:v2 language:@"en"];

  id v4 = [(NSArray *)v14 lastObject];
  id v5 = [v3 trainingFeaturesOf:v4];
  id v6 = [v5 vector];

  id v7 = objc_opt_new();
  if ([v6 length])
  {
    unint64_t v8 = 0;
    do
    {
      [v6 valueAtIndex:v8];
      if (v9 > 0.0)
      {
        id v10 = [objc_alloc((Class)NSString) initWithFormat:@"(%d, %d) %g", v8, 0, v9];
        [v7 addObject:v10];
      }
      ++v8;
    }
    while ((unint64_t)[v6 length] > v8);
  }
  id v11 = objc_alloc((Class)NSString);
  uint64_t v12 = objc_msgSend(v7, "_pas_componentsJoinedByString:", @",");
  id v13 = [v11 initWithFormat:@"%@", v12];
  puts((const char *)[v13 UTF8String]);
}

void sub_10001F88C(id a1, NSArray *a2)
{
  id v7 = a2;
  uint64_t v2 = [(NSArray *)v7 firstObject];
  uint64_t v3 = +[SGBinaryClassificationModel modelFromMobileAssetForName:v2 language:@"en"];

  if (objc_opt_respondsToSelector())
  {
    id v4 = [(NSArray *)v7 lastObject];
    id v5 = [v3 performSelector:"ngrammed:" withObject:v4];

    id v6 = [objc_alloc((Class)NSString) initWithFormat:@"%@", v5];
    puts((const char *)[v6 UTF8String]);
  }
  else
  {
    id v5 = [objc_alloc((Class)NSString) initWithFormat:@"This model does not support string conversion"];
    puts((const char *)[v5 UTF8String]);
  }
}

void sub_10001F9B0(id a1, NSArray *a2)
{
  id v11 = +[PMLHashingVectorizer withBucketSize:10000 andNgrams:1];
  for (int i = 0; i != 100; ++i)
  {
    bzero(buffer, 0x3E8uLL);
    uint64_t v3 = +[NSMutableString stringWithCapacity:20];
    uint64_t v4 = 20;
    do
    {
      -[__CFString appendFormat:](v3, "appendFormat:", @"%C", [@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXZY012345678_-" characterAtIndex:arc4random()% (unint64_t)objc_msgSend(@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXZY012345678_-", "length")]);
      --v4;
    }
    while (v4);
    if (!CFStringGetCharactersPtr(v3))
    {
      v14.length = (CFIndex)[(__CFString *)v3 length];
      v14.location = 0;
      CFStringGetCharacters(v3, v14, buffer);
    }
    [(__CFString *)v3 length];
    uint64_t v5 = _PASMurmur3_x86_32();
    uint64_t v12 = v3;
    id v6 = +[NSArray arrayWithObjects:&v12 count:1];
    id v7 = [v11 transform:v6];

    if ([v7 length])
    {
      unint64_t v8 = 0;
      do
      {
        [v7 valueAtIndex:v8];
        if (v9 != 0.0)
        {
          id v10 = [objc_alloc((Class)NSString) initWithFormat:@"%@\t%u\t%u\t%d", v3, v5, v8, (v5 >> 1) - 10000 * (v5 / 0x4E20)];
          puts((const char *)[v10 UTF8String]);
        }
        ++v8;
      }
      while ((unint64_t)[v7 length] > v8);
    }
  }
}

void sub_10001FBE0(id a1, NSArray *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = +[SGSuggestionsService serviceForInternal];
  id v8 = 0;
  [v3 clearCachesFully:1 error:&v8];
  id v4 = v8;
  id v5 = objc_alloc((Class)NSString);
  if (v4)
  {
    id v7 = [v5 initWithFormat:@"Error: %@", v4];
    puts((const char *)[v7 UTF8String]);

    exit(2);
  }
  id v6 = [v5 initWithFormat:@"Caches cleared."];
  puts((const char *)[v6 UTF8String]);
}

void sub_10001FCA8(id a1, NSArray *a2)
{
  sub_10001A9E0([(NSArray *)a2 count] == 0, @"testEventsForSchemas (no args)");
  uint64_t v2 = objc_opt_new();
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  id v4 = +[SGSuggestionsService serviceForEvents];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001FE20;
  v9[3] = &unk_10005A0C8;
  id v5 = v3;
  id v10 = v5;
  [v4 keysForSchemas:&off_100064968 completion:v9];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001FEC4;
  v7[3] = &unk_10005A0C8;
  id v8 = v5;
  id v6 = v5;
  [v4 eventsForSchemas:&off_100064968 usingStore:v2 completion:v7];
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t sub_10001FE20(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = objc_alloc((Class)NSString);
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = v5;
  }
  id v9 = [v7 initWithFormat:@"keysForSchemas: %@", v8];

  id v10 = v9;
  puts((const char *)[v10 UTF8String]);

  id v11 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v11);
}

intptr_t sub_10001FEC4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = objc_alloc((Class)NSString);
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = v5;
  }
  id v9 = [v7 initWithFormat:@"eventsForSchemas: %@", v8];

  id v10 = v9;
  puts((const char *)[v10 UTF8String]);

  id v11 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v11);
}

void sub_10001FF68(id a1, NSArray *a2)
{
  uint64_t v2 = a2;
  sub_10001A9E0((id)[(NSArray *)v2 count] == (id)1, @"deleteInteractionsWithBundleID bundleID");
  dispatch_semaphore_t v3 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  int v11 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  id v5 = dispatch_get_global_queue(5, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002008C;
  block[3] = &unk_10005A020;
  void block[4] = v3;
  block[6] = &v8;
  id v6 = v4;
  block[5] = v6;
  dispatch_async(v5, block);

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  exit(*((_DWORD *)v9 + 6));
}

void sub_100020074(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002008C(uint64_t a1)
{
  uint64_t v2 = +[SGUnfilteredService serviceForInternal];
  uint64_t v3 = *(void *)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002014C;
  v6[3] = &unk_100059748;
  long long v5 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v5;
  long long v7 = v5;
  [v2 deleteInteractionsWithBundleId:v3 completion:v6];
}

intptr_t sub_10002014C(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    id v4 = [objc_alloc((Class)NSString) initWithFormat:@"Error: %@", v3];

    id v5 = v4;
    puts((const char *)[v5 UTF8String]);

    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 2;
  }
  id v6 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v6);
}

void sub_1000201EC(id a1, NSArray *a2)
{
  uint64_t v2 = a2;
  sub_10001A9E0([(NSArray *)v2 count] > 1, @"deleteInteractionsWithIdentifiers GROUP_IDENTIFIERS bundleID");
  id v3 = -[NSArray subarrayWithRange:](v2, "subarrayWithRange:", 0, (char *)[(NSArray *)v2 count] - 1);
  id v4 = [(NSArray *)v2 objectAtIndexedSubscript:(char *)[(NSArray *)v2 count] - 1];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  int v12 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = dispatch_get_global_queue(5, 0);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100020344;
  v8[3] = &unk_1000599D0;
  void v8[4] = v4;
  v8[5] = v3;
  v8[7] = &v9;
  long long v7 = v5;
  v8[6] = v7;
  dispatch_async(v6, v8);

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  exit(*((_DWORD *)v10 + 6));
}

void sub_10002032C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100020344(uint64_t a1)
{
  uint64_t v2 = +[SGUnfilteredService serviceForInternal];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100020408;
  v7[3] = &unk_100059748;
  long long v6 = *(_OWORD *)(a1 + 48);
  id v5 = (id)v6;
  long long v8 = v6;
  [v2 deleteInteractionsWithBundleId:v3 groupIdentifiers:v4 completion:v7];
}

intptr_t sub_100020408(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    id v4 = [objc_alloc((Class)NSString) initWithFormat:@"Error: %@", v3];

    id v5 = v4;
    puts((const char *)[v5 UTF8String]);

    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 2;
  }
  long long v6 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v6);
}

void sub_1000204A8(id a1, NSArray *a2)
{
  uint64_t v2 = a2;
  sub_10001A9E0([(NSArray *)v2 count] > 1, @"deleteInteractionsWithIdentifiers IDENTIFIERS bundleID");
  id v3 = -[NSArray subarrayWithRange:](v2, "subarrayWithRange:", 0, (char *)[(NSArray *)v2 count] - 1);
  id v4 = [(NSArray *)v2 objectAtIndexedSubscript:(char *)[(NSArray *)v2 count] - 1];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  int v12 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  long long v6 = dispatch_get_global_queue(5, 0);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100020600;
  v8[3] = &unk_1000599D0;
  void v8[4] = v4;
  v8[5] = v3;
  v8[7] = &v9;
  long long v7 = v5;
  v8[6] = v7;
  dispatch_async(v6, v8);

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  exit(*((_DWORD *)v10 + 6));
}

void sub_1000205E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100020600(uint64_t a1)
{
  uint64_t v2 = +[SGUnfilteredService serviceForInternal];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000206C4;
  v7[3] = &unk_100059748;
  long long v6 = *(_OWORD *)(a1 + 48);
  id v5 = (id)v6;
  long long v8 = v6;
  [v2 deleteInteractionsWithBundleId:v3 identifiers:v4 completion:v7];
}

intptr_t sub_1000206C4(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    id v4 = [objc_alloc((Class)NSString) initWithFormat:@"Error: %@", v3];

    id v5 = v4;
    puts((const char *)[v5 UTF8String]);

    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 2;
  }
  long long v6 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v6);
}

void sub_100020764(id a1, NSArray *a2)
{
  uint64_t v2 = a2;
  char v3 = (id)[(NSArray *)v2 count] == (id)3 || (id)[(NSArray *)v2 count] == (id)4;
  sub_10001A9E0(v3, @"addInteraction TYPE IN_OR_OUT HANDLE (optional DISPLAY_NAME)");
  id v4 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  id v5 = [(NSArray *)v2 objectAtIndexedSubscript:1];
  uint64_t v6 = [(NSArray *)v2 objectAtIndexedSubscript:2];
  if ([(NSArray *)v2 count] < 4)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = [(NSArray *)v2 objectAtIndexedSubscript:3];
  }
  long long v8 = [v5 lowercaseString];
  unsigned __int8 v9 = [v8 isEqualToString:@"in"];

  if (v9)
  {
    uint64_t v10 = 2;
  }
  else
  {
    unsigned int v15 = [v5 lowercaseString];
    unsigned __int8 v16 = [v15 isEqualToString:@"out"];

    if (v16)
    {
      uint64_t v10 = 1;
    }
    else
    {
      sub_10001A9E0(0, @"addInteraction TYPE IN_OR_OUT HANDLE (optional DISPLAY_NAME)\n Error: IN_OR_OUT must be 'in' or 'out'.");
      uint64_t v10 = 0;
    }
  }
  id v11 = objc_msgSend(objc_alloc((Class)INPerson), "initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:", objc_msgSend(objc_alloc((Class)INPersonHandle), "initWithValue:type:", v6, 2), 0, v7, 0, 0, 0);
  if (([v4 isEqualToString:@"INStartCallIntent"] & 1) != 0
    || [v4 isEqualToString:@"INStartAudioCallIntent"])
  {
    id v12 = objc_alloc((Class)INStartCallIntent);
    id v38 = v11;
    id v13 = +[NSArray arrayWithObjects:&v38 count:1];
    id v14 = [v12 initWithCallRecordFilter:0 callRecordToCallBack:0 audioRoute:0 destinationType:0 contacts:v13 callCapability:1];
  }
  else if ([v4 isEqualToString:@"INStartVideoCallIntent"])
  {
    id v17 = objc_alloc((Class)INStartCallIntent);
    id v37 = v11;
    id v18 = +[NSArray arrayWithObjects:&v37 count:1];
    id v14 = [v17 initWithCallRecordFilter:0 callRecordToCallBack:0 audioRoute:0 destinationType:0 contacts:v18 callCapability:2];
  }
  else if ([v4 isEqualToString:@"INSendMessageIntent"])
  {
    id v19 = objc_alloc((Class)INSendMessageIntent);
    id v36 = v11;
    id v20 = +[NSArray arrayWithObjects:&v36 count:1];
    id v14 = [v19 initWithRecipients:v20 outgoingMessageType:1 content:@"message content" speakableGroupName:0 conversationIdentifier:0 serviceName:0 sender:0 attachments:0];
  }
  else
  {
    id v21 = [objc_alloc((Class)NSString) initWithFormat:@"addInteraction TYPE IN_OR_OUT HANDLE (optional DISPLAY_NAME)\n Error: unrecognized interaction type: %@.", v4];
    sub_10001A9E0(0, v21);

    id v14 = 0;
  }
  id v22 = objc_alloc((Class)INInteraction);
  id v23 = [objc_alloc((Class)INIntentResponse) _initWithCode:4 userActivity:0];
  id v24 = [v22 initWithIntent:v14 response:v23];

  id v25 = objc_alloc((Class)NSDateInterval);
  id v26 = objc_opt_new();
  id v27 = [v25 initWithStartDate:v26 duration:60.0];
  [v24 setDateInterval:v27];

  [v24 setDirection:v10];
  uint64_t v32 = 0;
  long long v33 = &v32;
  uint64_t v34 = 0x2020000000;
  int v35 = 0;
  dispatch_semaphore_t v28 = dispatch_semaphore_create(0);
  unint64_t v29 = dispatch_get_global_queue(5, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100020C0C;
  block[3] = &unk_10005A020;
  void block[4] = v24;
  block[6] = &v32;
  id v30 = v28;
  block[5] = v30;
  dispatch_async(v29, block);

  dispatch_semaphore_wait(v30, 0xFFFFFFFFFFFFFFFFLL);
  exit(*((_DWORD *)v33 + 6));
}

void sub_100020BEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100020C0C(uint64_t a1)
{
  uint64_t v2 = +[SGUnfilteredService serviceForInternal];
  uint64_t v8 = *(void *)(a1 + 32);
  char v3 = +[NSArray arrayWithObjects:&v8 count:1];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100020D24;
  v6[3] = &unk_100059748;
  long long v5 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v5;
  long long v7 = v5;
  [v2 addInteractions:v3 bundleId:@"com.apple.suggestions.suggest_tool" withCompletion:v6];
}

intptr_t sub_100020D24(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    id v4 = [objc_alloc((Class)NSString) initWithFormat:@"Error: %@", v3];

    id v5 = v4;
    puts((const char *)[v5 UTF8String]);

    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 2;
  }
  uint64_t v6 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v6);
}

void sub_100020DC4(id a1, NSArray *a2)
{
  id v14 = a2;
  sub_10001A9E0((id)[(NSArray *)v14 count] == (id)1, @"Needs a single argument");
  uint64_t v2 = [(NSArray *)v14 firstObject];
  id v3 = +[NSData dataWithContentsOfFile:v2];

  if (v3)
  {
    id v4 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:0];
    id v5 = [v4 attributeSet];
    uint64_t v6 = [v5 emailHeaders];
    [v6 enumerateKeysAndObjectsUsingBlock:&stru_100059FD8];

    putchar(10);
    long long v7 = [v4 attributeSet];
    id v8 = [v7 HTMLContentData];

    id v9 = objc_alloc((Class)NSString);
    if (v8)
    {
      id v10 = [objc_alloc((Class)NSString) initWithData:v8 encoding:4];
      id v11 = [v9 initWithFormat:@"%@", v10];
      puts((const char *)[v11 UTF8String]);
    }
    else
    {
      id v10 = [v4 attributeSet];
      id v11 = [v10 textContent];
      id v13 = [v9 initWithFormat:@"%@", v11];
      puts((const char *)[v13 UTF8String]);
    }
  }
  else
  {
    id v12 = objc_alloc((Class)NSString);
    id v4 = [(NSArray *)v14 firstObject];
    id v8 = [v12 initWithFormat:@"Error: failed to load file: %@", v4];
    puts((const char *)[v8 UTF8String]);
  }
}

void sub_100020FD8(id a1, NSString *a2, NSArray *a3, BOOL *a4)
{
  id v5 = a2;
  uint64_t v6 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v10);
        id v12 = objc_alloc((Class)NSString);
        id v13 = [(NSString *)v5 capitalizedString];
        id v14 = [v12 initWithFormat:@"%@: %@", v13, v11];
        puts((const char *)[v14 UTF8String]);

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

void sub_100021130(id a1, NSArray *a2)
{
  uint64_t v2 = a2;
  id v3 = +[SGPaths suggestionsSubdirectory:@"permafail"];
  id v4 = +[NSFileManager defaultManager];
  id v21 = 0;
  id v5 = [v4 contentsOfDirectoryAtPath:v3 error:&v21];
  id v6 = v21;

  if (v6)
  {
    id v16 = [objc_alloc((Class)NSString) initWithFormat:@"Error listing files in %@: %@", v3, v6];
    puts((const char *)[v16 UTF8String]);

    exit(1);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * (void)v11);
        id v13 = objc_alloc((Class)NSString);
        id v14 = [v3 stringByAppendingPathComponent:v12];
        id v15 = [v13 initWithFormat:@"%@", v14];
        puts((const char *)[v15 UTF8String]);

        uint64_t v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v9);
  }
}

uint64_t sub_100021320(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (a2) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= 8u;
  }
  if (a3) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= 0x10u;
  }
  return result;
}

uint64_t sub_1000213A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (a2) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= 2u;
  }
  if (a3) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= 4u;
  }
  return result;
}

void sub_100021420(id a1, NSString *a2, NSArray *a3, NSArray *a4)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v9 = [(NSArray *)v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v29;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = [objc_alloc((Class)NSString) initWithFormat:@"%@ updated: %@", v6, *(void *)(*((void *)&v28 + 1) + 8 * (void)v12)];
        puts((const char *)[v13 UTF8String]);

        uint64_t v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSArray *)v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v10);
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v14 = v8;
  id v15 = [(NSArray *)v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v25;
    do
    {
      long long v18 = 0;
      do
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v24 + 1) + 8 * (void)v18);
        id v20 = objc_alloc((Class)NSString);
        id v21 = [v20 initWithFormat:@"%@ deleted: %@", v6, v19, (void)v24];
        puts((const char *)[v21 UTF8String]);

        long long v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [(NSArray *)v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v16);
  }

  if (v7 && ![(NSArray *)v7 count])
  {
    id v22 = [objc_alloc((Class)NSString) initWithFormat:@"updated %@s, but which ones are unknown", v6];
    puts((const char *)[v22 UTF8String]);
  }
  if (v14 && ![(NSArray *)v14 count])
  {
    id v23 = [objc_alloc((Class)NSString) initWithFormat:@"deleted %@s, but which ones are unknown", v6];
    puts((const char *)[v23 UTF8String]);
  }
}

void sub_100021698(id a1, NSArray *a2, NSArray *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = objc_alloc((Class)NSString);
  id v10 = +[NSDate date];
  id v7 = [(NSArray *)v5 count];

  id v8 = [(NSArray *)v4 count];
  id v9 = [v6 initWithFormat:@"Event change notification fired at %@: %lu updated, %lu deleted", v10, v7, v8];
  puts((const char *)[v9 UTF8String]);
}

void sub_100021764(id a1, NSArray *a2, NSArray *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = objc_alloc((Class)NSString);
  id v10 = +[NSDate date];
  id v7 = [(NSArray *)v5 count];

  id v8 = [(NSArray *)v4 count];
  id v9 = [v6 initWithFormat:@"Contact change notification fired at %@: %lu updated, %lu deleted", v10, v7, v8];
  puts((const char *)[v9 UTF8String]);
}

void sub_100021830(void *a1, void *a2)
{
  if (a2)
  {
    id v4 = a2;
    id v5 = +[NSAssertionHandler currentHandler];
    [v5 handleFailureInMethod:a1[5], a1[6], @"suggest_tool.m", 4938, @"\nAsync error at iteration %tu: %@", a1[7], v4 object file lineNumber description];
  }
  id v3 = a1[4];

  dispatch_group_leave(v3);
}

void sub_1000218C8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (atomic_fetch_add((atomic_uint *volatile)(*(void *)(*(void *)(a1 + 40) + 8) + 24), 1u))
  {
    id v4 = +[NSAssertionHandler currentHandler];
    [v4 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 56) file:@"suggest_tool.m" lineNumber:4793 description:@"This block should not be run more than once"];

    if (v6) {
      goto LABEL_3;
    }
  }
  else if (v3)
  {
    goto LABEL_3;
  }
  id v5 = +[NSAssertionHandler currentHandler];
  [v5 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 56), @"suggest_tool.m", 4794, @"Invalid parameter not satisfying: %@", @"err != nil" object file lineNumber description];

LABEL_3:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_1000219B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (atomic_fetch_add((atomic_uint *volatile)(*(void *)(*(void *)(a1 + 40) + 8) + 24), 1u))
  {
    id v4 = +[NSAssertionHandler currentHandler];
    [v4 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 56) file:@"suggest_tool.m" lineNumber:4799 description:@"This block should not be run more than once"];

    if (v6) {
      goto LABEL_3;
    }
  }
  else if (v3)
  {
    goto LABEL_3;
  }
  id v5 = +[NSAssertionHandler currentHandler];
  [v5 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 56), @"suggest_tool.m", 4800, @"Invalid parameter not satisfying: %@", @"err != nil" object file lineNumber description];

LABEL_3:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100021A98(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (atomic_fetch_add((atomic_uint *volatile)(*(void *)(*(void *)(a1 + 40) + 8) + 24), 1u))
  {
    id v4 = +[NSAssertionHandler currentHandler];
    [v4 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 64) file:@"suggest_tool.m" lineNumber:4811 description:@"This block should not be run more than once"];

    id v3 = v6;
    if (!v6) {
      goto LABEL_6;
    }
  }
  else if (!v3)
  {
    goto LABEL_6;
  }
  if ([v3 code] != (id)7)
  {
    id v5 = +[NSAssertionHandler currentHandler];
    [v5 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 64), @"suggest_tool.m", 4813, @"Invalid parameter not satisfying: %@", @"err.code == SGErrorTooManyRequests" object file lineNumber description];
  }
  atomic_fetch_add((atomic_uint *volatile)(*(void *)(*(void *)(a1 + 48) + 8) + 24), 1u);
LABEL_6:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100021BA4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (atomic_fetch_add((atomic_uint *volatile)(*(void *)(*(void *)(a1 + 40) + 8) + 24), 1u))
  {
    id v4 = +[NSAssertionHandler currentHandler];
    [v4 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 56) file:@"suggest_tool.m" lineNumber:4828 description:@"This block should not be run more than once"];

    if (!v6) {
      goto LABEL_3;
    }
  }
  else if (!v3)
  {
    goto LABEL_3;
  }
  id v5 = +[NSAssertionHandler currentHandler];
  [v5 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 56), @"suggest_tool.m", 4829, @"%@", v6 object file lineNumber description];

LABEL_3:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100021C8C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (atomic_fetch_add((atomic_uint *volatile)(*(void *)(*(void *)(a1 + 48) + 8) + 24), 1u))
  {
    id v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 64) file:@"suggest_tool.m" lineNumber:4839 description:@"This block should not be run more than once"];
  }
  id v4 = *(void **)(a1 + 32);
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  int v15 = 0;
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  id v9 = sub_100021FA8;
  id v10 = &unk_100059DA0;
  uint64_t v12 = v14;
  long long v13 = *(_OWORD *)(a1 + 56);
  id v11 = *(id *)(a1 + 40);
  id v5 = [&v7 copy];

  _Block_object_dispose(v14, 8);
  objc_msgSend(v4, "daemonExitWithCompletion:", v5, v7, v8, v9, v10);
}

void sub_100021DC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100021DD8(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v2 + 40);
  [v1 sleep:&obj];
  objc_storeStrong((id *)(v2 + 40), obj);
}

id sub_100021E24(uint64_t a1)
{
  return [*(id *)(a1 + 32) sleep:0];
}

void sub_100021E30(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v11 = v3;
  if (atomic_fetch_add((atomic_uint *volatile)(*(void *)(*(void *)(a1 + 56) + 8) + 24), 1u))
  {
    id v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 72) file:@"suggest_tool.m" lineNumber:4903 description:@"This block should not be run more than once"];

    if (!v11) {
      goto LABEL_3;
    }
  }
  else if (!v3)
  {
    goto LABEL_3;
  }
  id v10 = +[NSAssertionHandler currentHandler];
  [v10 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 72), @"suggest_tool.m", 4904, @"Invalid parameter not satisfying: %@", @"err == nil" object file lineNumber description];

LABEL_3:
  id v4 = +[NSDate date];
  [v4 timeIntervalSinceDate:*(void *)(a1 + 32)];
  double v6 = v5;

  id v7 = *(id *)(a1 + 40);
  objc_sync_enter(v7);
  uint64_t v8 = +[NSNumber numberWithDouble:v6];
  [*(id *)(a1 + 40) setObject:v8 atIndexedSubscript:*(int *)(a1 + 80)];

  objc_sync_exit(v7);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_100021F94(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100021FA8(void *a1)
{
  if (atomic_fetch_add((atomic_uint *volatile)(*(void *)(a1[5] + 8) + 24), 1u))
  {
    id v3 = +[NSAssertionHandler currentHandler];
    [v3 handleFailureInMethod:a1[6] object:a1[7] file:@"suggest_tool.m" lineNumber:4841 description:@"This block should not be run more than once"];
  }
  uint64_t v2 = a1[4];

  dispatch_group_leave(v2);
}

void sub_10002202C(id a1, NSArray *a2)
{
  id v2 = (id)objc_opt_new();
  [v2 setLaunchPath:@"/usr/local/bin/ctsctl"];
  [v2 setArguments:&off_100064878];
  [v2 launch];
  [v2 waitUntilExit];
}

void sub_100022098(id a1, NSArray *a2)
{
  id v2 = a2;
  sub_10001A9E0((id)[(NSArray *)v2 count] == (id)1, @"isEmailAddressSignificant EMAIL");
  id v3 = objc_alloc((Class)NSString);
  id v4 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  id v5 = [v3 initWithFormat:@"Asking suggestd for significance of %@", v4];
  puts((const char *)[v5 UTF8String]);

  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = sub_100006C74;
  v27[4] = sub_100006C84;
  id v28 = 0;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  long long v24 = sub_100006C74;
  long long v25 = sub_100006C84;
  id v26 = 0;
  double v6 = +[SGSuggestionsService serviceForInternal];
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  uint64_t v8 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  id v16 = sub_100022360;
  uint64_t v17 = &unk_100059D58;
  uint64_t v19 = &v21;
  id v20 = v27;
  id v9 = v7;
  long long v18 = v9;
  [v6 emailAddressIsSignificant:v8 withCompletion:&v14];

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  if ([(id)v22[5] BOOLValue])
  {
    id v10 = objc_alloc((Class)NSString);
    id v11 = [(NSArray *)v2 objectAtIndexedSubscript:0];
    id v12 = [v10 initWithFormat:@"%@ is significant.", v11, v14, v15, v16, v17];
  }
  else
  {
    id v13 = objc_alloc((Class)NSString);
    id v11 = [(NSArray *)v2 objectAtIndexedSubscript:0];
    id v12 = [v13 initWithFormat:@"%@ is not significant.", v11, v14, v15, v16, v17];
  }
  puts((const char *)[v12 UTF8String]);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(v27, 8);
}

void sub_100022338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_100022360(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000223FC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_100022498(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v10 = 0;
  id v5 = [v4 loadStorageContactByRecordId:v3 error:&v10];
  id v6 = v10;
  if (v6)
  {
    id v7 = [objc_alloc((Class)NSString) initWithFormat:@"Warning: detected bad record id: %@", v3];
    puts((const char *)[v7 UTF8String]);
  }
  uint64_t v8 = [v5 convertToContact:*(void *)(a1 + 32)];

  return v8;
}

id sub_100022568(uint64_t a1)
{
  id v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v3 = *(id *)(a1 + 32);
  id v4 = v2;
  id v5 = [v3 name];
  uint64_t v6 = [v5 firstName];
  id v7 = (void *)v6;
  if (v6) {
    uint64_t v8 = (__CFString *)v6;
  }
  else {
    uint64_t v8 = &stru_10005B0F8;
  }
  uint64_t v9 = v8;

  id v10 = [v3 name];
  uint64_t v11 = [v10 lastName];
  id v12 = (void *)v11;
  if (v11) {
    CFStringRef v13 = (const __CFString *)v11;
  }
  else {
    CFStringRef v13 = &stru_10005B0F8;
  }
  id v14 = [(__CFString *)v9 stringByAppendingString:v13];

  uint64_t v15 = [v4 name];
  uint64_t v16 = [v15 firstName];
  uint64_t v17 = (void *)v16;
  if (v16) {
    long long v18 = (__CFString *)v16;
  }
  else {
    long long v18 = &stru_10005B0F8;
  }
  uint64_t v19 = v18;

  id v20 = [v4 name];
  uint64_t v21 = [v20 lastName];
  id v22 = (void *)v21;
  if (v21) {
    CFStringRef v23 = (const __CFString *)v21;
  }
  else {
    CFStringRef v23 = &stru_10005B0F8;
  }
  long long v24 = [(__CFString *)v19 stringByAppendingString:v23];

  if ([v14 isEqualToString:v24])
  {
    long long v25 = [v3 name];
    uint64_t v26 = [v25 middleName];
    long long v27 = (void *)v26;
    if (v26) {
      id v28 = (__CFString *)v26;
    }
    else {
      id v28 = &stru_10005B0F8;
    }
    long long v29 = v28;

    long long v30 = [v4 name];
    uint64_t v31 = [v30 middleName];
    uint64_t v32 = (void *)v31;
    if (v31) {
      long long v33 = (__CFString *)v31;
    }
    else {
      long long v33 = &stru_10005B0F8;
    }
    uint64_t v34 = v33;

    if ([(__CFString *)v29 length]
      && [(__CFString *)v34 length]
      && ![(__CFString *)v29 isEqualToString:v34])
    {
      unsigned int v39 = 0;
    }
    else
    {
      int v35 = [v3 emailAddresses];
      id v36 = sub_1000234E8(v35);

      id v37 = [v4 emailAddresses];
      id v38 = sub_1000234E8(v37);

      if ([v36 intersectsSet:v38])
      {
        unsigned int v39 = 1;
      }
      else
      {
        id v40 = [v3 phones];
        id v41 = sub_100023574(v40);

        long long v42 = [v4 phones];
        sub_100023574(v42);
        long long v48 = v34;
        int v44 = v43 = v29;

        unsigned int v39 = [v41 intersectsSet:v44];
        long long v29 = v43;
        uint64_t v34 = v48;
      }
    }
  }
  else
  {
    unsigned int v39 = 0;
  }

  if (v39) {
    long long v45 = 0;
  }
  else {
    long long v45 = v4;
  }
  id v46 = v45;

  return v46;
}

void sub_100022874(void *a1, int a2)
{
  id v3 = a1;
  if (byte_10006A7B8 == 1)
  {
    id v4 = objc_alloc((Class)NSString);
    id v5 = sub_10001B094(v3);
    id v6 = [v4 initWithFormat:@"%@", v5];
    puts((const char *)[v6 UTF8String]);
  }
  else
  {
    uint64_t v110 = sub_100023278();
    id v7 = objc_alloc((Class)NSString);
    id v8 = objc_alloc((Class)NSString);
    uint64_t v9 = [v3 recordId];
    id v10 = objc_msgSend(v8, "initWithFormat:", @"%lld", objc_msgSend(v9, "numericValue"));
    uint64_t v11 = sub_1000232CC(v10, a2);
    id v12 = [v3 name];
    CFStringRef v13 = [v12 fullName];
    id v14 = [v7 initWithFormat:@"%@ %@", v11, v13];
    puts((const char *)[v14 UTF8String]);

    if ([v3 significance] == (id)1)
    {
      CFStringRef v15 = @"Yes";
    }
    else if ([v3 significance] == (id)2)
    {
      CFStringRef v15 = @"No";
    }
    else
    {
      CFStringRef v15 = @"Unknown";
    }
    id v16 = objc_alloc((Class)NSString);
    uint64_t v17 = sub_1000232CC(@"significant", a2);
    id v18 = [v16 initWithFormat:@"%@%@: %@", v110, v17, v15];
    puts((const char *)[v18 UTF8String]);

    id v19 = objc_alloc((Class)NSString);
    int v102 = a2;
    id v20 = sub_1000232CC(@"emails", a2);
    id v21 = [v19 initWithFormat:@"%@%@:", v110, v20];
    puts((const char *)[v21 UTF8String]);

    long long v125 = 0u;
    long long v126 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    id v103 = v3;
    id obj = [v3 emailAddresses];
    id v22 = [obj countByEnumeratingWithState:&v123 objects:v130 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v124;
      do
      {
        for (int i = 0; i != v23; int i = (char *)i + 1)
        {
          if (*(void *)v124 != v24) {
            objc_enumerationMutation(obj);
          }
          uint64_t v26 = *(void **)(*((void *)&v123 + 1) + 8 * i);
          id v27 = objc_alloc((Class)NSString);
          id v28 = [v26 recordId];
          id v29 = [v28 numericValue];
          long long v30 = [v26 label];
          uint64_t v31 = sub_100023328(v30);
          uint64_t v32 = [v26 emailAddress];
          long long v33 = sub_1000233D8(v26);
          id v34 = [v27 initWithFormat:@"%@%@%lld\t%@: %@%@", v110, v110, v29, v31, v32, v33];
          puts((const char *)[v34 UTF8String]);
        }
        id v23 = [obj countByEnumeratingWithState:&v123 objects:v130 count:16];
      }
      while (v23);
    }

    id v35 = objc_alloc((Class)NSString);
    id v36 = sub_1000232CC(@"phones", v102);
    id v37 = (void *)v110;
    id v38 = [v35 initWithFormat:@"%@%@:", v110, v36];
    puts((const char *)[v38 UTF8String]);

    long long v121 = 0u;
    long long v122 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    id obja = [v103 phones];
    id v39 = [obja countByEnumeratingWithState:&v119 objects:v129 count:16];
    if (v39)
    {
      id v40 = v39;
      uint64_t v41 = *(void *)v120;
      do
      {
        for (uint64_t j = 0; j != v40; uint64_t j = (char *)j + 1)
        {
          if (*(void *)v120 != v41) {
            objc_enumerationMutation(obja);
          }
          uint64_t v43 = *(void **)(*((void *)&v119 + 1) + 8 * (void)j);
          id v44 = objc_alloc((Class)NSString);
          long long v45 = [v43 recordId];
          id v46 = [v45 numericValue];
          id v47 = [v43 label];
          long long v48 = sub_100023328(v47);
          unsigned __int8 v49 = [v43 phoneNumber];
          id v50 = sub_1000233D8(v43);
          id v99 = v46;
          id v37 = (void *)v110;
          id v51 = [v44 initWithFormat:@"%@%@%lld\t%@: %@%@", v110, v110, v99, v48, v49, v50];
          puts((const char *)[v51 UTF8String]);
        }
        id v40 = [obja countByEnumeratingWithState:&v119 objects:v129 count:16];
      }
      while (v40);
    }

    id v52 = objc_alloc((Class)NSString);
    id v53 = sub_1000232CC(@"addresses", v102);
    id v54 = [v52 initWithFormat:@"%@%@:", v37, v53];
    puts((const char *)[v54 UTF8String]);

    long long v117 = 0u;
    long long v118 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    id objb = [v103 postalAddresses];
    id v55 = [objb countByEnumeratingWithState:&v115 objects:v128 count:16];
    if (v55)
    {
      id v56 = v55;
      uint64_t v57 = *(void *)v116;
      do
      {
        for (unint64_t k = 0; k != v56; unint64_t k = (char *)k + 1)
        {
          if (*(void *)v116 != v57) {
            objc_enumerationMutation(objb);
          }
          uint64_t v59 = *(void **)(*((void *)&v115 + 1) + 8 * (void)k);
          id v60 = objc_alloc((Class)NSString);
          id v61 = [v59 recordId];
          id v62 = [v61 numericValue];
          id v63 = [v59 label];
          id v64 = sub_100023328(v63);
          uint64_t v65 = [v59 address];
          id v66 = sub_1000233D8(v59);
          id v100 = v62;
          id v37 = (void *)v110;
          id v67 = [v60 initWithFormat:@"%@%@%lld\t%@: %@%@", v110, v110, v100, v64, v65, v66];
          puts((const char *)[v67 UTF8String]);
        }
        id v56 = [objb countByEnumeratingWithState:&v115 objects:v128 count:16];
      }
      while (v56);
    }

    id v3 = v103;
    long long v68 = [v103 socialProfiles];
    id v69 = [v68 count];

    if (v69)
    {
      id v70 = objc_alloc((Class)NSString);
      uint64_t v71 = sub_1000232CC(@"socialProfiles", v102);
      id v72 = [v70 initWithFormat:@"%@%@:", v37, v71];
      puts((const char *)[v72 UTF8String]);

      long long v113 = 0u;
      long long v114 = 0u;
      long long v111 = 0u;
      long long v112 = 0u;
      id v104 = [v103 socialProfiles];
      id objc = [v104 countByEnumeratingWithState:&v111 objects:v127 count:16];
      if (objc)
      {
        uint64_t v105 = *(void *)v112;
        do
        {
          for (m = 0; m != objc; m = (char *)m + 1)
          {
            if (*(void *)v112 != v105) {
              objc_enumerationMutation(v104);
            }
            id v74 = *(void **)(*((void *)&v111 + 1) + 8 * (void)m);
            id v75 = objc_alloc((Class)NSString);
            id v76 = [v74 recordId];
            id v77 = [v76 numericValue];
            long long v78 = [v74 label];
            long long v79 = sub_100023328(v78);
            long long v80 = [v74 service];
            long long v81 = [v74 displayName];
            long long v82 = sub_1000233D8(v74);
            id v83 = [v75 initWithFormat:@"%@%@%lld\t%@: %@ %@ [%@] %@", v110, v110, v77, v79, v80, v81, v74, v82];
            puts((const char *)[v83 UTF8String]);
          }
          id objc = [v104 countByEnumeratingWithState:&v111 objects:v127 count:16];
        }
        while (objc);
      }

      id v3 = v103;
      id v37 = (void *)v110;
    }
    long long v84 = [v3 birthday];

    if (v84)
    {
      id v85 = objc_alloc((Class)NSString);
      long long v86 = sub_1000232CC(@"birthday", v102);
      id v87 = [v85 initWithFormat:@"%@%@:", v37, v86];
      puts((const char *)[v87 UTF8String]);

      id v88 = objc_alloc((Class)NSString);
      long long v89 = [v3 birthday];
      long long v90 = [v89 recordId];
      id v91 = [v90 numericValue];
      long long v92 = [v3 birthday];
      long long v93 = [v92 label];
      long long v94 = sub_100023328(v93);
      long long v95 = [v3 birthday];
      long long v96 = [v3 birthday];
      id v97 = sub_1000233D8(v96);
      id v101 = v91;
      id v37 = (void *)v110;
      id v98 = [v88 initWithFormat:@"%@%@%lld\t%@: %@%@", v110, v110, v101, v94, v95, v97];
      puts((const char *)[v98 UTF8String]);

      id v3 = v103;
    }
  }
}

id sub_100023278()
{
  id v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%*s", 3, " ");

  return v0;
}

id sub_1000232CC(void *a1, int a2)
{
  id v3 = a1;
  id v4 = v3;
  if (a2)
  {
    id v5 = v3;
  }
  else
  {
    sub_100006034(v3);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v6 = v5;

  return v6;
}

__CFString *sub_100023328(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    id v2 = +[NSRegularExpression regularExpressionWithPattern:@"([_<>!$]+)([^_<>!$]+)([_<>!$]+)" options:0 error:0];
    objc_msgSend(v2, "stringByReplacingMatchesInString:options:range:withTemplate:", v1, 0, 0, objc_msgSend(v1, "length"), @"$2");
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = @"nolabel";
  }

  return v3;
}

id sub_1000233D8(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc((Class)NSString);
  id v3 = [v1 extractionInfo];
  [v3 extractionType];
  id v4 = SGExtractionTypeDescription();
  id v5 = [v1 extractionInfo];
  id v6 = [v5 modelVersion];
  id v7 = [v6 intValue];
  id v8 = [v1 extractionInfo];

  uint64_t v9 = [v8 confidence];
  [v9 floatValue];
  id v11 = [v2 initWithFormat:@"\t(extr type: %@ model ver: %d, conf: %.02f)", v4, v7, v10];

  return v11;
}

id sub_1000234E8(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc((Class)NSSet);
  id v3 = +[SGFn map:v1 f:&stru_10005AD00];

  id v4 = [v2 initWithArray:v3];

  return v4;
}

id sub_100023574(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc((Class)NSSet);
  id v3 = +[SGFn map:v1 f:&stru_10005AD40];

  id v4 = [v2 initWithArray:v3];

  return v4;
}

SGNormalizedPhoneNumber *__cdecl sub_100023600(id a1, SGPhoneNumber *a2)
{
  id v2 = [(SGPhoneNumber *)a2 phoneNumber];
  id v3 = SGNormalizePhoneNumber();

  return (SGNormalizedPhoneNumber *)v3;
}

SGNormalizedEmailAddress *__cdecl sub_100023650(id a1, SGEmailAddress *a2)
{
  id v2 = [(SGEmailAddress *)a2 emailAddress];
  id v3 = SGNormalizeEmailAddress();

  return (SGNormalizedEmailAddress *)v3;
}

void sub_1000236A0(id a1, NSArray *a2)
{
  id v2 = a2;
  sub_10001A9E0((id)[(NSArray *)v2 count] == (id)1, @"rejectEventByRecordId RECORD_ID");
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = sub_100006C74;
  id v20 = sub_100006C84;
  id v21 = 0;
  id v3 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  id v4 = [v3 intValue];

  if ((int)v4 <= 0)
  {
    id v10 = [objc_alloc((Class)NSString) initWithFormat:@"Error: RECORD_ID must be a positive integer"];
    puts((const char *)[v10 UTF8String]);

    exit(2);
  }
  id v5 = +[SGRecordId recordIdWithNumericValue:v4];
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  id v7 = +[SGSuggestionsService serviceForEvents];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100023900;
  v13[3] = &unk_100059748;
  CFStringRef v15 = &v16;
  id v8 = v6;
  id v14 = v8;
  [v7 rejectEventByRecordId:v5 withCompletion:v13];

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  if (v17[5])
  {
    id v11 = objc_alloc((Class)NSString);
    id v12 = [v11 initWithFormat:@"Error: %@", v17[5]];
    puts((const char *)[v12 UTF8String]);

    exit(2);
  }
  id v9 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Rejected event record %d", v4);
  puts((const char *)[v9 UTF8String]);

  _Block_object_dispose(&v16, 8);
}

void sub_1000238E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100023900(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100023960(id a1, NSArray *a2)
{
  id v2 = a2;
  sub_10001A9E0((id)[(NSArray *)v2 count] == (id)1, @"confirmEventByRecordId RECORD_ID");
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = sub_100006C74;
  id v20 = sub_100006C84;
  id v21 = 0;
  id v3 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  id v4 = [v3 intValue];

  if ((int)v4 <= 0)
  {
    id v10 = [objc_alloc((Class)NSString) initWithFormat:@"Error: RECORD_ID must be a positive integer"];
    puts((const char *)[v10 UTF8String]);

    exit(2);
  }
  id v5 = +[SGRecordId recordIdWithNumericValue:v4];
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  id v7 = +[SGSuggestionsService serviceForEvents];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100023BC0;
  v13[3] = &unk_100059748;
  CFStringRef v15 = &v16;
  id v8 = v6;
  id v14 = v8;
  [v7 confirmEventByRecordId:v5 withCompletion:v13];

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  if (v17[5])
  {
    id v11 = objc_alloc((Class)NSString);
    id v12 = [v11 initWithFormat:@"Error: %@", v17[5]];
    puts((const char *)[v12 UTF8String]);

    exit(2);
  }
  id v9 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Confirmed event record %d", v4);
  puts((const char *)[v9 UTF8String]);

  _Block_object_dispose(&v16, 8);
}

void sub_100023BA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100023BC0(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100023C20(id a1, NSArray *a2)
{
  CFStringRef v15 = a2;
  id v2 = +[SGSuggestionsService serviceForInternal];
  id v3 = objc_opt_new();
  id v4 = [(NSArray *)v15 objectAtIndexedSubscript:0];
  id v5 = [v4 substringToIndex:4];
  objc_msgSend(v3, "setYear:", (int)objc_msgSend(v5, "intValue"));

  dispatch_semaphore_t v6 = [(NSArray *)v15 objectAtIndexedSubscript:0];
  id v7 = objc_msgSend(v6, "substringWithRange:", 4, 2);
  objc_msgSend(v3, "setMonth:", (int)objc_msgSend(v7, "intValue"));

  id v8 = [(NSArray *)v15 objectAtIndexedSubscript:0];
  id v9 = [v8 substringFromIndex:6];
  objc_msgSend(v3, "setDay:", (int)objc_msgSend(v9, "intValue"));

  id v10 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  id v11 = [v10 dateFromComponents:v3];
  if (v11)
  {
    uint64_t v12 = [v10 dateByAddingUnit:16 value:1 toDate:v11 options:0];
    if (v12)
    {
      [v2 suggestEventsStartingAt:v11 endingAt:v12 limitTo:100 options:0 withCompletion:&stru_100059C80];
      dispatch_main();
    }
    CFStringRef v13 = @"Error: failed to construct end date from components: %@";
  }
  else
  {
    CFStringRef v13 = @"Error: failed to get start date from components: %@";
  }
  id v14 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", v13, v3);
  puts((const char *)[v14 UTF8String]);
}

void sub_100023E14(id a1, NSArray *a2, NSError *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (byte_10006A7B8)
  {
    id v6 = objc_alloc((Class)NSString);
    id v7 = sub_10001B094(v4);
    id v8 = [v6 initWithFormat:@"%@", v7];
    puts((const char *)[v8 UTF8String]);
  }
  else if ([(NSArray *)v4 count])
  {
    unint64_t v9 = 0;
    do
    {
      id v10 = objc_alloc((Class)NSString);
      id v11 = [(NSArray *)v4 objectAtIndexedSubscript:v9];
      id v12 = [v10 initWithFormat:@"--- %d ---\n%@\n\n", v9, v11];
      puts((const char *)[v12 UTF8String]);

      ++v9;
    }
    while ([(NSArray *)v4 count] > v9);
  }
  exit(0);
}

void sub_100023F1C(id a1, NSArray *a2)
{
  id v2 = a2;
  sub_10001A9E0((id)[(NSArray *)v2 count] == (id)1, @"rejectContactDetailRecord RECORD_ID");
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = sub_100006C74;
  id v20 = sub_100006C84;
  id v21 = 0;
  id v3 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  id v4 = [v3 intValue];

  if ((int)v4 <= 0)
  {
    id v10 = [objc_alloc((Class)NSString) initWithFormat:@"Error: RECORD_ID must be a positive integer"];
    puts((const char *)[v10 UTF8String]);

    exit(2);
  }
  id v5 = +[SGRecordId recordIdWithNumericValue:v4];
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  id v7 = +[SGSuggestionsService serviceForContacts];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100024180;
  v13[3] = &unk_100059748;
  CFStringRef v15 = &v16;
  id v8 = v6;
  id v14 = v8;
  [v7 rejectContactDetailRecord:v5 rejectionUI:2 withCompletion:v13];

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  if (v17[5])
  {
    id v11 = objc_alloc((Class)NSString);
    id v12 = [v11 initWithFormat:@"Error: %@", v17[5]];
    puts((const char *)[v12 UTF8String]);

    exit(2);
  }
  id v9 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Rejected contact detail record %d", v4);
  puts((const char *)[v9 UTF8String]);

  _Block_object_dispose(&v16, 8);
}

void sub_100024160(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100024180(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000241E0(id a1, NSArray *a2)
{
  id v2 = a2;
  sub_10001A9E0((id)[(NSArray *)v2 count] == (id)1, @"confirmContactDetailRecord RECORD_ID");
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = sub_100006C74;
  id v20 = sub_100006C84;
  id v21 = 0;
  id v3 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  id v4 = [v3 intValue];

  if ((int)v4 <= 0)
  {
    id v10 = [objc_alloc((Class)NSString) initWithFormat:@"Error: RECORD_ID must be a positive integer"];
    puts((const char *)[v10 UTF8String]);

    exit(2);
  }
  id v5 = +[SGRecordId recordIdWithNumericValue:v4];
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  id v7 = +[SGSuggestionsService serviceForContacts];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100024444;
  v13[3] = &unk_100059748;
  CFStringRef v15 = &v16;
  id v8 = v6;
  id v14 = v8;
  [v7 confirmContactDetailRecord:v5 confirmationUI:2 withCompletion:v13];

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  if (v17[5])
  {
    id v11 = objc_alloc((Class)NSString);
    id v12 = [v11 initWithFormat:@"Error: %@", v17[5]];
    puts((const char *)[v12 UTF8String]);

    exit(2);
  }
  id v9 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Confirmed contact detail record %d", v4);
  puts((const char *)[v9 UTF8String]);

  _Block_object_dispose(&v16, 8);
}

void sub_100024424(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100024444(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000244A4(id a1, NSArray *a2)
{
  id v2 = a2;
  sub_10001A9E0((id)[(NSArray *)v2 count] == (id)1, @"rejectRecord RECORD_ID");
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = sub_100006C74;
  id v20 = sub_100006C84;
  id v21 = 0;
  id v3 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  id v4 = [v3 intValue];

  if ((int)v4 <= 0)
  {
    id v10 = [objc_alloc((Class)NSString) initWithFormat:@"Error: RECORD_ID must be a positive integer"];
    puts((const char *)[v10 UTF8String]);

    exit(2);
  }
  id v5 = +[SGRecordId recordIdWithNumericValue:v4];
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  id v7 = +[SGSuggestionsService serviceForContacts];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100024708;
  v13[3] = &unk_100059748;
  CFStringRef v15 = &v16;
  id v8 = v6;
  id v14 = v8;
  [v7 rejectRecord:v5 rejectionUI:2 withCompletion:v13];

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  if (v17[5])
  {
    id v11 = objc_alloc((Class)NSString);
    id v12 = [v11 initWithFormat:@"Error: %@", v17[5]];
    puts((const char *)[v12 UTF8String]);

    exit(2);
  }
  id v9 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Rejected record %d", v4);
  puts((const char *)[v9 UTF8String]);

  _Block_object_dispose(&v16, 8);
}

void sub_1000246E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100024708(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100024768(id a1, NSArray *a2)
{
  id v2 = a2;
  sub_10001A9E0((id)[(NSArray *)v2 count] == (id)1, @"confirmRecord RECORD_ID");
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = sub_100006C74;
  id v20 = sub_100006C84;
  id v21 = 0;
  id v3 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  id v4 = [v3 intValue];

  if ((int)v4 <= 0)
  {
    id v10 = [objc_alloc((Class)NSString) initWithFormat:@"Error: RECORD_ID must be a positive integer"];
    puts((const char *)[v10 UTF8String]);

    exit(2);
  }
  id v5 = +[SGRecordId recordIdWithNumericValue:v4];
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  id v7 = +[SGSuggestionsService serviceForContacts];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000249C8;
  v13[3] = &unk_100059748;
  CFStringRef v15 = &v16;
  id v8 = v6;
  id v14 = v8;
  [v7 confirmRecord:v5 withCompletion:v13];

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  if (v17[5])
  {
    id v11 = objc_alloc((Class)NSString);
    id v12 = [v11 initWithFormat:@"Error: %@", v17[5]];
    puts((const char *)[v12 UTF8String]);

    exit(2);
  }
  id v9 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Confirmed record %d", v4);
  puts((const char *)[v9 UTF8String]);

  _Block_object_dispose(&v16, 8);
}

void sub_1000249A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000249C8(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100024A28(id a1, NSArray *a2)
{
  id v2 = a2;
  sub_10001A9E0((id)[(NSArray *)v2 count] == (id)1, @"originFromRecordId RECORD_ID");
  id v3 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  int v4 = [v3 intValue];

  if (v4 <= 0)
  {
    id v61 = [objc_alloc((Class)NSString) initWithFormat:@"Error: RECORD_ID must be a positive integer"];
    puts((const char *)[v61 UTF8String]);

    exit(2);
  }
  id v5 = +[SGRecordId recordIdWithNumericValue:v4];
  v75[0] = 0;
  v75[1] = v75;
  v75[2] = 0x3032000000;
  void v75[3] = sub_100006C74;
  v75[4] = sub_100006C84;
  id v76 = 0;
  uint64_t v69 = 0;
  id v70 = &v69;
  uint64_t v71 = 0x3032000000;
  id v72 = sub_100006C74;
  uint64_t v73 = sub_100006C84;
  id v74 = 0;
  dispatch_semaphore_t v6 = +[SGSuggestionsService serviceForContacts];
  id v62 = _NSConcreteStackBlock;
  uint64_t v63 = 3221225472;
  id v64 = sub_100025150;
  uint64_t v65 = &unk_100059BA0;
  id v67 = &v69;
  long long v68 = v75;
  id v7 = dispatch_semaphore_create(0);
  id v66 = v7;
  [v6 originFromRecordId:v5 withCompletion:&v62];
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  id v8 = (void *)v70[5];
  if (byte_10006A7B8 == 1)
  {
    id v9 = v8;
    id v10 = objc_alloc((Class)NSString);
    id v11 = sub_10001B094(v9);

    id v12 = [v10 initWithFormat:@"%@", v11];
  }
  else
  {
    id v13 = v8;
    unint64_t v14 = (unint64_t)[v13 type];
    if (v14 > 7) {
      CFStringRef v15 = 0;
    }
    else {
      CFStringRef v15 = off_10005AD60[v14];
    }
    id v16 = objc_alloc((Class)NSString);
    uint64_t v17 = sub_100006034(@"type");
    id v18 = [v16 initWithFormat:@"%@: %@", v17, v15, v62, v63, v64, v65];
    puts((const char *)[v18 UTF8String]);

    id v19 = objc_alloc((Class)NSString);
    id v20 = sub_100006034(@"title");
    id v21 = [v13 title];
    id v22 = [v19 initWithFormat:@"%@: %@", v20, v21];
    puts((const char *)[v22 UTF8String]);

    id v23 = objc_alloc((Class)NSString);
    uint64_t v24 = sub_100006034(@"fromPerson");
    long long v25 = [v13 fromPerson];
    id v26 = [v23 initWithFormat:@"%@: %@", v24, v25];
    puts((const char *)[v26 UTF8String]);

    id v27 = objc_alloc((Class)NSString);
    id v28 = sub_100006034(@"bundleId");
    id v29 = [v13 bundleId];
    id v30 = [v27 initWithFormat:@"%@: %@", v28, v29];
    puts((const char *)[v30 UTF8String]);

    id v31 = objc_alloc((Class)NSString);
    uint64_t v32 = sub_100006034(@"localizedApplicationName");
    long long v33 = [v13 localizedApplicationName];
    id v34 = [v31 initWithFormat:@"%@: %@", v32, v33];
    puts((const char *)[v34 UTF8String]);

    id v35 = objc_alloc((Class)NSString);
    id v36 = sub_100006034(@"teamId");
    id v37 = [v13 teamId];
    id v38 = [v35 initWithFormat:@"%@: %@", v36, v37];
    puts((const char *)[v38 UTF8String]);

    id v39 = objc_alloc((Class)NSString);
    id v40 = sub_100006034(@"to");
    uint64_t v41 = [v13 to];
    long long v42 = objc_msgSend(v41, "_pas_componentsJoinedByString:", @", ");
    id v43 = [v39 initWithFormat:@"%@: %@", v40, v42];
    puts((const char *)[v43 UTF8String]);

    id v44 = objc_alloc((Class)NSString);
    long long v45 = sub_100006034(@"cc");
    id v46 = [v13 cc];
    id v47 = objc_msgSend(v46, "_pas_componentsJoinedByString:", @", ");
    id v48 = [v44 initWithFormat:@"%@: %@", v45, v47];
    puts((const char *)[v48 UTF8String]);

    id v49 = objc_alloc((Class)NSString);
    id v50 = sub_100006034(@"date");
    id v51 = [v13 date];
    id v52 = [v49 initWithFormat:@"%@: %@", v50, v51];
    puts((const char *)[v52 UTF8String]);

    id v53 = objc_alloc((Class)NSString);
    id v54 = sub_100006034(@"---------------------------- Context ----------------------------");
    id v55 = [v53 initWithFormat:@"%@", v54];
    puts((const char *)[v55 UTF8String]);

    id v56 = objc_alloc((Class)NSString);
    uint64_t v57 = [v13 contextSnippet];

    id v58 = [v56 initWithFormat:@"%@", v57];
    puts((const char *)[v58 UTF8String]);

    id v59 = objc_alloc((Class)NSString);
    id v11 = sub_100006034(@"-----------------------------------------------------------------");
    id v12 = [v59 initWithFormat:@"%@", v11];
  }
  id v60 = v12;
  puts((const char *)[v60 UTF8String]);

  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(v75, 8);
}

void sub_100025128(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100025150(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000251EC(id a1, CNContact *a2, BOOL *a3)
{
  int v4 = a2;
  id v3 = [objc_alloc((Class)NSString) initWithFormat:@"%@\n", v4];
  puts((const char *)[v3 UTF8String]);
}

void sub_1000252C4(id a1, NSArray *a2)
{
  id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Waiting for kSGURLChangeNotification..."];
  puts((const char *)[v2 UTF8String]);

  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  int out_token = 0;
  int v4 = (const char *)kSGURLChangeNotification;
  id v5 = dispatch_get_global_queue(17, 0);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100025438;
  handler[3] = &unk_100059B18;
  dispatch_semaphore_t v11 = v3;
  id v6 = v3;
  uint64_t v7 = notify_register_dispatch(v4, &out_token, v5, handler);

  if (v7)
  {
    id v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Error: failed to register for kSGURLChangeNotification: error %u", v7);
    puts((const char *)[v8 UTF8String]);
  }
  else
  {
    +[_PASDispatch waitForSemaphore:v6];
    id v9 = [objc_alloc((Class)NSString) initWithFormat:@"kSGURLChangeNotification received."];
    puts((const char *)[v9 UTF8String]);

    notify_cancel(out_token);
  }
}

intptr_t sub_100025438(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100025440(id a1, NSArray *a2)
{
  id v2 = a2;
  sub_10001A9E0((id)[(NSArray *)v2 count] == (id)2, @"registerURLFeedback URL (ENGAGED|OFFERED|REJECTED)");
  dispatch_semaphore_t v3 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  uint64_t v4 = 1;
  id v5 = [(NSArray *)v2 objectAtIndexedSubscript:1];
  id v6 = [v5 lowercaseString];
  unsigned __int8 v7 = [v6 isEqualToString:@"engaged"];

  if ((v7 & 1) == 0)
  {
    id v8 = [(NSArray *)v2 objectAtIndexedSubscript:1];
    id v9 = [v8 lowercaseString];
    unsigned __int8 v10 = [v9 isEqualToString:@"offered"];

    if (v10)
    {
      uint64_t v4 = 2;
    }
    else
    {
      dispatch_semaphore_t v11 = [(NSArray *)v2 objectAtIndexedSubscript:1];
      id v12 = [v11 lowercaseString];
      unsigned __int8 v13 = [v12 isEqualToString:@"rejected"];

      if ((v13 & 1) == 0)
      {
        id v18 = [objc_alloc((Class)NSString) initWithFormat:@"Error: feedback must be one of 'engaged', 'offered', or 'rejected'."];
        puts((const char *)[v18 UTF8String]);

        exit(2);
      }
      uint64_t v4 = 0;
    }
  }
  dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
  uint64_t v15 = +[SGSuggestionsService serviceForURLs];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100025678;
  v19[3] = &unk_100059240;
  dispatch_semaphore_t v20 = v14;
  uint64_t v16 = v14;
  [v15 registerURLFeedback:v4 absoluteURL:v3 withCompletion:v19];

  +[_PASDispatch waitForSemaphore:v16];
  id v17 = [objc_alloc((Class)NSString) initWithFormat:@"Feedback regitered."];
  puts((const char *)[v17 UTF8String]);
}

intptr_t sub_100025678(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100025680(id a1, NSArray *a2)
{
  id v2 = a2;
  sub_10001A9E0([(NSArray *)v2 count] != 0, @"urlsFoundContaining SUBSTRING (optional FLAG_FILTER)");
  if ([(NSArray *)v2 count] < 2)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    dispatch_semaphore_t v3 = [(NSArray *)v2 objectAtIndexedSubscript:1];
    int v4 = [v3 intValue];

    if (v4 >= 256)
    {
      id v5 = [objc_alloc((Class)NSString) initWithFormat:@"FLAG_FILTER was not a valid value for SGURLFlags bitmask."];
      puts((const char *)[v5 UTF8String]);

      exit(2);
    }
  }
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = sub_100006C74;
  void v22[4] = sub_100006C84;
  id v23 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = sub_100006C74;
  dispatch_semaphore_t v20 = sub_100006C84;
  id v21 = 0;
  id v6 = +[SGSuggestionsService serviceForURLs];
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  id v8 = +[NSDate distantPast];
  id v9 = +[NSDate distantFuture];
  unsigned __int8 v10 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002591C;
  v12[3] = &unk_100058DB0;
  dispatch_semaphore_t v14 = &v16;
  uint64_t v15 = v22;
  dispatch_semaphore_t v11 = v7;
  unsigned __int8 v13 = v11;
  [v6 urlsFoundBetweenStartDate:v8 endDate:v9 excludingBundleIdentifiers:0 containingSubstring:v10 flagFilter:v4 limit:10000 withCompletion:v12];

  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  sub_1000259B8((void *)v17[5]);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v22, 8);
}

void sub_1000258F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10002591C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000259B8(void *a1)
{
  id v1 = a1;
  id v2 = objc_opt_new();
  [v2 setTimeStyle:2];
  [v2 setDateStyle:2];
  id v3 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"\n %-30s %-25s %s", "Received At", "Bundle", "Received From");
  puts((const char *)[v3 UTF8String]);

  id v4 = [objc_alloc((Class)NSString) initWithFormat:@"-------------------------------------------------------------------------"];
  puts((const char *)[v4 UTF8String]);

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100025AF4;
  v6[3] = &unk_10005ACC0;
  id v7 = v2;
  id v5 = v2;
  [v1 enumerateObjectsUsingBlock:v6];
}

void sub_100025AF4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = objc_alloc((Class)NSString);
  id v7 = *(void **)(a1 + 32);
  id v8 = [v5 receivedAt];
  id v9 = [v7 stringFromDate:v8];
  id v10 = [v9 UTF8String];
  id v11 = [v5 bundleIdentifier];
  id v12 = [v11 UTF8String];
  id v13 = [v5 receivedFromHandle];
  id v14 = objc_msgSend(v6, "initWithFormat:", @"[%02tu] %-30s %-25s %s", a3, v10, v12, objc_msgSend(v13, "UTF8String"));
  puts((const char *)[v14 UTF8String]);

  id v15 = objc_alloc((Class)NSString);
  uint64_t v16 = [v5 url];
  id v17 = [v16 absoluteString];
  uint64_t v18 = sub_100006034(v17);
  id v19 = [v15 initWithFormat:@" url: %@", v18];
  puts((const char *)[v19 UTF8String]);

  id v20 = objc_alloc((Class)NSString);
  id v21 = [v5 title];
  id v22 = sub_100006034(v21);
  id v23 = [v20 initWithFormat:@" title: %@", v22];
  puts((const char *)[v23 UTF8String]);

  id v24 = objc_alloc((Class)NSString);
  long long v25 = [v5 documentIdentifier];
  id v26 = [v24 initWithFormat:@" doc id: %@", v25];
  puts((const char *)[v26 UTF8String]);

  id v27 = objc_alloc((Class)NSString);
  id v28 = [v5 groupIdentifier];
  id v29 = [v27 initWithFormat:@" domain id: %@", v28];
  puts((const char *)[v29 UTF8String]);

  id v30 = objc_alloc((Class)NSString);
  id v31 = [v5 documentTitle];
  id v32 = [v30 initWithFormat:@" doc title: %@", v31];
  puts((const char *)[v32 UTF8String]);

  id v33 = objc_alloc((Class)NSString);
  id v34 = *(void **)(a1 + 32);
  id v35 = [v5 documentDate];
  id v36 = [v34 stringFromDate:v35];
  id v37 = [v33 initWithFormat:@" doc date: %@", v36];
  puts((const char *)[v37 UTF8String]);

  id v38 = objc_alloc((Class)NSString);
  [v5 documentTimeInterval];
  id v40 = objc_msgSend(v38, "initWithFormat:", @" doc interval: %f", v39);
  puts((const char *)[v40 UTF8String]);

  id v41 = objc_alloc((Class)NSString);
  long long v42 = [v5 nonFeedbackFlagDescription];
  id v43 = [v41 initWithFormat:@" flags: %@", v42];
  puts((const char *)[v43 UTF8String]);

  id v44 = objc_alloc((Class)NSString);
  long long v45 = [v5 feedbackDescription];

  id v46 = [v44 initWithFormat:@" feedback: %@", v45];
  puts((const char *)[v46 UTF8String]);

  id v48 = [objc_alloc((Class)NSString) initWithFormat:&stru_10005B0F8];
  puts((const char *)[v48 UTF8String]);
}

void sub_100025F10(id a1, NSArray *a2)
{
  id v2 = a2;
  sub_10001A9E0([(NSArray *)v2 count] > 1, @"urlsFoundBetween STARTDATE ENDDATE (optional EXCLUDING_BUNDLE_1 ...)");
  id v3 = objc_opt_new();
  [v3 setDateFormat:@"yyyy-MM-dd"];
  id v4 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  id v5 = [v3 dateFromString:v4];

  if (!v5)
  {
    id v11 = objc_alloc((Class)NSString);
    id v12 = [v3 dateFormat];
    id v13 = [(NSArray *)v2 objectAtIndexedSubscript:0];
    id v14 = [v11 initWithFormat:@"Error: failed to parse start date (expected format %@): %@", v12, v13];
LABEL_7:
    id v16 = v14;
    puts((const char *)[v16 UTF8String]);

    goto LABEL_10;
  }
  id v6 = [(NSArray *)v2 objectAtIndexedSubscript:1];
  id v7 = [v3 dateFromString:v6];

  if (!v7)
  {
    id v15 = objc_alloc((Class)NSString);
    id v12 = [v3 dateFormat];
    id v13 = [(NSArray *)v2 objectAtIndexedSubscript:1];
    id v14 = [v15 initWithFormat:@"Error: failed to parse end date (expected format %@): %@", v12, v13];
    goto LABEL_7;
  }
  if ([(NSArray *)v2 count] < 3)
  {
    id v10 = 0;
  }
  else
  {
    id v8 = objc_alloc((Class)NSSet);
    id v9 = -[NSArray subarrayWithRange:](v2, "subarrayWithRange:", 2, (char *)[(NSArray *)v2 count] - 2);
    id v10 = [v8 initWithArray:v9];
  }
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = sub_100006C74;
  void v29[4] = sub_100006C84;
  id v30 = 0;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = sub_100006C74;
  id v27 = sub_100006C84;
  id v28 = 0;
  id v17 = +[SGSuggestionsService serviceForURLs];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100026288;
  v19[3] = &unk_100058DB0;
  id v21 = &v23;
  id v22 = v29;
  uint64_t v18 = dispatch_semaphore_create(0);
  id v20 = v18;
  [v17 urlsFoundBetweenStartDate:v5 endDate:v7 excludingBundleIdentifiers:v10 containingSubstring:0 flagFilter:0 limit:10000 withCompletion:v19];
  dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
  sub_1000259B8((void *)v24[5]);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(v29, 8);

LABEL_10:
}

void sub_100026260(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100026288(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100026324(id a1, NSArray *a2)
{
  id v2 = a2;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = sub_100006C74;
  v15[4] = sub_100006C84;
  id v16 = 0;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = sub_100006C74;
  id v13 = sub_100006C84;
  id v14 = 0;
  id v3 = +[SGSuggestionsService serviceForURLs];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000264C4;
  v5[3] = &unk_100058DB0;
  uint64_t v7 = &v9;
  id v8 = v15;
  id v4 = dispatch_semaphore_create(0);
  id v6 = v4;
  [v3 recentURLsWithLimit:10000 withCompletion:v5];
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  sub_1000259B8((void *)v10[5]);

  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(v15, 8);
}

void sub_10002649C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1000264C4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100026560(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000265FC(id a1, NSArray *a2)
{
  id v2 = a2;
  sub_10001A9E0((id)[(NSArray *)v2 count] == (id)1, @"logUserCreatedReminderTitle TITLE");
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = sub_100006C74;
  id v19 = sub_100006C84;
  id v20 = 0;
  id v3 = +[SGSuggestionsService serviceForReminders];
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  id v5 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100026814;
  v12[3] = &unk_100059748;
  id v14 = &v15;
  id v6 = v4;
  id v13 = v6;
  [v3 logUserCreatedReminderTitle:v5 withCompletion:v12];

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  if (v16[5])
  {
    id v10 = objc_alloc((Class)NSString);
    id v11 = [v10 initWithFormat:@"Error: %@", v16[5]];
    puts((const char *)[v11 UTF8String]);

    exit(2);
  }
  id v7 = objc_alloc((Class)NSString);
  id v8 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  id v9 = [v7 initWithFormat:@"logUserCreatedReminderTitle: %@", v8];
  puts((const char *)[v9 UTF8String]);

  _Block_object_dispose(&v15, 8);
}

void sub_1000267F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100026814(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100026874(id a1, NSArray *a2)
{
  id v2 = a2;
  sub_10001A9E0((id)[(NSArray *)v2 count] == (id)1, @"reminderTitleForContent TEXT_CONTENT");
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = sub_100006C74;
  void v22[4] = sub_100006C84;
  id v23 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = sub_100006C74;
  id v20 = sub_100006C84;
  id v21 = 0;
  id v3 = +[SGSuggestionsService serviceForReminders];
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  id v5 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  id v11 = sub_100026A7C;
  id v12 = &unk_1000595B8;
  id v14 = &v16;
  uint64_t v15 = v22;
  id v6 = v4;
  id v13 = v6;
  [v3 reminderTitleForContent:v5 withCompletion:&v9];

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  id v7 = objc_alloc((Class)NSString);
  id v8 = [v7 initWithFormat:@"%@", v17[5], v9, v10, v11, v12];
  puts((const char *)[v8 UTF8String]);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v22, 8);
}

void sub_100026A54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_100026A7C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100026B18(id a1, NSArray *a2)
{
  id v2 = a2;
  sub_10001A9E0((id)[(NSArray *)v2 count] == (id)2, @"recordId RECORD_ID, style: style(0,1)");
  id v3 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  dispatch_semaphore_t v4 = +[SGRecordId recordIdWithNumericValue:](SGRecordId, "recordIdWithNumericValue:", [v3 integerValue]);

  v25[0] = 0;
  v25[1] = v25;
  void v25[2] = 0x3032000000;
  v25[3] = sub_100006C74;
  v25[4] = sub_100006C84;
  id v26 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_100006C74;
  id v23 = sub_100006C84;
  id v24 = 0;
  id v5 = +[SGSuggestionsService serviceForReminders];
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  uint64_t v7 = [(NSArray *)v2 objectAtIndexedSubscript:1];
  unsigned __int8 v8 = [v7 integerValue];
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  id v14 = sub_100026D70;
  uint64_t v15 = &unk_1000595B8;
  uint64_t v17 = &v19;
  uint64_t v18 = v25;
  uint64_t v9 = v6;
  uint64_t v16 = v9;
  [v5 foundInStringForRecordId:v4 style:v8 withCompletion:&v12];

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  id v10 = objc_alloc((Class)NSString);
  id v11 = [v10 initWithFormat:@"Result: %@", v20[5], v12, v13, v14, v15];
  puts((const char *)[v11 UTF8String]);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v25, 8);
}

void sub_100026D48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_100026D70(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  unsigned __int8 v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100026E0C(id a1, NSArray *a2)
{
  id v41 = a2;
  id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Getting all reminders"];
  puts((const char *)[v2 UTF8String]);

  uint64_t v57 = 0;
  id v58 = &v57;
  uint64_t v59 = 0x3032000000;
  id v60 = sub_100006C74;
  id v61 = sub_100006C84;
  id v62 = 0;
  uint64_t v51 = 0;
  id v52 = &v51;
  uint64_t v53 = 0x3032000000;
  id v54 = sub_100006C74;
  id v55 = sub_100006C84;
  id v56 = 0;
  id v3 = +[SGSuggestionsService serviceForReminders];
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  void v47[2] = sub_1000274C8;
  v47[3] = &unk_100058DB0;
  id v49 = &v51;
  id v50 = &v57;
  dispatch_semaphore_t dsema = dispatch_semaphore_create(0);
  id v48 = dsema;
  long long v42 = v3;
  [v3 allRemindersLimitedTo:10000 withCompletion:v47];
  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_semaphore_t v4 = (void *)v58[5];
  id v45 = (id)v52[5];
  id v43 = v4;
  LODWORD(v4) = byte_10006A7B8;
  id v5 = objc_alloc((Class)NSString);
  if (v4)
  {
    sub_10001B094(v45);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    id v7 = [v5 initWithFormat:@"%@", v6];
    puts((const char *)[v7 UTF8String]);
  }
  else
  {
    id v8 = objc_msgSend(v5, "initWithFormat:", @"Found reminders: %lu\n", objc_msgSend(v45, "count"));
    puts((const char *)[v8 UTF8String]);

    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id obj = v45;
    id v9 = [obj countByEnumeratingWithState:&v63 objects:v67 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v64;
      do
      {
        id v11 = 0;
        do
        {
          if (*(void *)v64 != v10) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(id *)(*((void *)&v63 + 1) + 8 * (void)v11);
          int v13 = byte_10006A7B8;
          id v14 = objc_alloc((Class)NSString);
          if (v13)
          {
            sub_10001B094(v12);
            id v15 = (id)objc_claimAutoreleasedReturnValue();
            id v16 = [v14 initWithFormat:@"%@", v15];
            puts((const char *)[v16 UTF8String]);
          }
          else
          {
            id v17 = objc_alloc((Class)NSString);
            uint64_t v18 = [v12 recordId];
            id v19 = objc_msgSend(v17, "initWithFormat:", @"%6lld", objc_msgSend(v18, "numericValue"));
            id v20 = sub_100006034(v19);
            uint64_t v21 = [v12 title];
            id v22 = [v14 initWithFormat:@"%@: %@", v20, v21];
            puts((const char *)[v22 UTF8String]);

            id v23 = [v12 dueDateComponents];

            if (v23)
            {
              id v24 = +[NSCalendar currentCalendar];
              uint64_t v25 = [v12 dueDateComponents];
              id v26 = [v24 dateFromComponents:v25];

              if (v26)
              {
                id v27 = [v12 dueDateComponents];
                id v28 = [v27 timeZone];

                id v29 = objc_alloc((Class)NSString);
                id v30 = sub_100006034(@"DueDate");
                id v31 = sub_100027564(v26, v28);
                id v32 = [v29 initWithFormat:@"%*c%@: %@", 8, 32, v30, v31];
                puts((const char *)[v32 UTF8String]);
              }
            }
            id v33 = [v12 dueLocation];

            if (v33)
            {
              id v34 = objc_alloc((Class)NSString);
              id v35 = sub_100006034(@"DueLocation Type");
              id v36 = objc_msgSend((id)objc_opt_class(), "describeReminderDueLocationType:", objc_msgSend(v12, "dueLocationType"));
              id v37 = sub_100006034(@"DueLocation Trigger");
              id v38 = objc_msgSend((id)objc_opt_class(), "describeReminderDueLocationTrigger:", objc_msgSend(v12, "dueLocationTrigger"));
              id v39 = [v34 initWithFormat:@"%*c%@: %@ %@:%@", 8, 32, v35, v36, v37, v38];
              puts((const char *)[v39 UTF8String]);
            }
            id v15 = [objc_alloc((Class)NSString) initWithFormat:&stru_10005B0F8];
            puts((const char *)[v15 UTF8String]);
          }

          id v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [obj countByEnumeratingWithState:&v63 objects:v67 count:16];
      }
      while (v9);
    }

    if (v43)
    {
      id v40 = [objc_alloc((Class)NSString) initWithFormat:@"Error! %@", v43];
      puts((const char *)[v40 UTF8String]);
    }
    id v6 = [objc_alloc((Class)NSString) initWithFormat:&stru_10005B0F8];
    puts((const char *)[v6 UTF8String]);
  }

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v57, 8);
}

void sub_100027490(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

void sub_1000274C8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_100027564(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (qword_10006A818 != -1) {
    dispatch_once(&qword_10006A818, &stru_10005AC98);
  }
  if (v4)
  {
    [(id)qword_10006A810 setTimeZone:v4];
  }
  else
  {
    id v5 = +[NSTimeZone timeZoneWithAbbreviation:@"GMT"];
    [(id)qword_10006A810 setTimeZone:v5];
  }
  id v6 = [(id)qword_10006A810 stringFromDate:v3];

  return v6;
}

void sub_100027638(id a1)
{
  uint64_t v1 = objc_opt_new();
  id v2 = (void *)qword_10006A810;
  qword_10006A810 = v1;

  id v3 = (void *)qword_10006A810;

  [v3 setDateFormat:@"yyyy-MM-dd HH:mm:ss z"];
}

void sub_10002768C(id a1, NSArray *a2)
{
  id v2 = a2;
  id v3 = [(NSArray *)v2 count];
  if (v3 != (id)1) {
    LOBYTE(v3) = (id)[(NSArray *)v2 count] == (id)2;
  }
  sub_10001A9E0((char)v3, @"addInteractionFromSchema JSON_FILE (optional BUNDLE_ID)");
  id v4 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  id v23 = 0;
  id v5 = +[NSData dataWithContentsOfFile:v4 options:0 error:&v23];
  id v6 = v23;
  if (v5)
  {
    id v22 = 0;
    uint64_t v7 = +[NSJSONSerialization JSONObjectWithData:v5 options:0 error:&v22];
    id v8 = v22;
    if (v8)
    {
      id v9 = [objc_alloc((Class)NSString) initWithFormat:@"Error decoding JSON content from %@: %@", v4, v8];
LABEL_10:
      id v10 = v9;
      puts((const char *)[v10 UTF8String]);

      goto LABEL_11;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v7;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v9 = [objc_alloc((Class)NSString) initWithFormat:@"Top level item in JSON is not array or dictionary"];
        goto LABEL_10;
      }
      id v24 = v7;
      id v11 = +[NSArray arrayWithObjects:&v24 count:1];
    }
    id v12 = +[INInteraction fromSchemas:v11];
    if ((id)[(NSArray *)v2 count] == (id)2)
    {
      int v13 = [(NSArray *)v2 objectAtIndexedSubscript:1];
    }
    else
    {
      int v13 = @"com.apple.suggestions.suggest_tool";
    }
    uint64_t v18 = 0;
    id v19 = &v18;
    uint64_t v20 = 0x2020000000;
    int v21 = 0;
    dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
    id v15 = dispatch_get_global_queue(5, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000279C0;
    block[3] = &unk_1000599D0;
    void block[4] = v12;
    block[5] = v13;
    void block[7] = &v18;
    id v16 = v14;
    block[6] = v16;
    dispatch_async(v15, block);

    dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
    exit(*((_DWORD *)v19 + 6));
  }
  id v8 = [objc_alloc((Class)NSString) initWithFormat:@"Error reading JSON file: %@", v6];
  puts((const char *)[v8 UTF8String]);
LABEL_11:
}

void sub_1000279A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000279C0(uint64_t a1)
{
  id v2 = +[SGUnfilteredService serviceForInternal];
  uint64_t v9 = *(void *)(a1 + 32);
  id v3 = +[NSArray arrayWithObjects:&v9 count:1];
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100027AD8;
  v7[3] = &unk_100059748;
  long long v6 = *(_OWORD *)(a1 + 48);
  id v5 = (id)v6;
  long long v8 = v6;
  [v2 addInteractions:v3 bundleId:v4 withCompletion:v7];
}

intptr_t sub_100027AD8(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    id v4 = [objc_alloc((Class)NSString) initWithFormat:@"Error: %@", v3];

    id v5 = v4;
    puts((const char *)[v5 UTF8String]);

    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 2;
  }
  long long v6 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v6);
}

void sub_100027B78(uint64_t a1)
{
  group = dispatch_group_create();
  id v2 = [*(id *)(a1 + 40) searchableItemsFromArgs:*(void *)(a1 + 32)];
  id v29 = [v2 firstObject];

  if (!v29)
  {
    id v26 = +[NSAssertionHandler currentHandler];
    [v26 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 40), @"suggest_tool.m", 4047, @"Invalid parameter not satisfying: %@", @"searchableItem" object file lineNumber description];
  }
  v61[0] = 0;
  v61[1] = v61;
  v61[2] = 0x3032000000;
  v61[3] = sub_100006C74;
  v61[4] = sub_100006C84;
  id v62 = 0;
  uint64_t v55 = 0;
  id v56 = &v55;
  uint64_t v57 = 0x3032000000;
  id v58 = sub_100006C74;
  uint64_t v59 = sub_100006C84;
  id v60 = 0;
  +[SGSuggestionsService serviceForMail];
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_1000281C4;
  v51[3] = &unk_100058DB0;
  uint64_t v53 = &v55;
  id v27 = v54 = v61;
  dispatch_semaphore_t dsema = dispatch_semaphore_create(0);
  id v52 = dsema;
  [v27 suggestionsFromSearchableItem:v29 options:3 withCompletion:v51];
  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  id v3 = objc_alloc((Class)NSString);
  id v4 = objc_msgSend(v3, "initWithFormat:", @"Foud %lu suggestion results in this document", objc_msgSend( (id) v56[5], "count"));
  puts((const char *)[v4 UTF8String]);

  id v33 = objc_opt_new();
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v5 = (id)v56[5];
  id v6 = [v5 countByEnumeratingWithState:&v47 objects:v65 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v48;
    do
    {
      for (int i = 0; i != v6; int i = (char *)i + 1)
      {
        if (*(void *)v48 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          dispatch_group_enter(group);
          id v10 = v9;
          id v11 = [v10 event];
          v44[0] = _NSConcreteStackBlock;
          v44[1] = 3221225472;
          v44[2] = sub_100028260;
          v44[3] = &unk_100059988;
          id v45 = v33;
          id v46 = group;
          [v11 geocodeWithCallback:v44];
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v47 objects:v65 count:16];
    }
    while (v6);
  }

  dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v33;
  id v32 = [obj countByEnumeratingWithState:&v40 objects:v64 count:16];
  if (v32)
  {
    uint64_t v31 = *(void *)v41;
    do
    {
      for (uint64_t j = 0; j != v32; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v41 != v31) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v40 + 1) + 8 * (void)j);
        id v13 = objc_alloc((Class)NSString);
        dispatch_semaphore_t v14 = [v12 title];
        id v15 = [v13 initWithFormat:@"-- Event: %@ --", v14];
        puts((const char *)[v15 UTF8String]);

        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v16 = [v12 locations];
        id v17 = [v16 countByEnumeratingWithState:&v36 objects:v63 count:16];
        if (v17)
        {
          uint64_t v18 = *(void *)v37;
          do
          {
            for (unint64_t k = 0; k != v17; unint64_t k = (char *)k + 1)
            {
              if (*(void *)v37 != v18) {
                objc_enumerationMutation(v16);
              }
              uint64_t v20 = *(void **)(*((void *)&v36 + 1) + 8 * (void)k);
              id v21 = [objc_alloc((Class)NSString) initWithFormat:@"Geocoded location %@", v20];
              puts((const char *)[v21 UTF8String]);

              id v22 = objc_alloc((Class)NSString);
              id v23 = [v20 geocodeHandle];
              CFStringRef v24 = @"Yes";
              if (!v23) {
                CFStringRef v24 = @"No";
              }
              id v25 = [v22 initWithFormat:@"Maps Handle data: %@", v24];
              puts((const char *)[v25 UTF8String]);
            }
            id v17 = [v16 countByEnumeratingWithState:&v36 objects:v63 count:16];
          }
          while (v17);
        }
      }
      id v32 = [obj countByEnumeratingWithState:&v40 objects:v64 count:16];
    }
    while (v32);
  }

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(v61, 8);
}

void sub_100028168(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
}

void sub_1000281C4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100028260(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) addObject:a2];
  id v3 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v3);
}

void sub_1000282A0(id a1, NSArray *a2)
{
  id v2 = a2;
  sub_10001A9E0((id)[(NSArray *)v2 count] == (id)4, @"geocodeLocation LOCATION_NAME LOCATION_ADDRESS MODE FILTERS");
  long long v47 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  id v46 = [(NSArray *)v2 objectAtIndexedSubscript:1];
  id v3 = [(NSArray *)v2 objectAtIndexedSubscript:2];
  long long v50 = [v3 lowercaseString];

  id v4 = [(NSArray *)v2 objectAtIndexedSubscript:3];
  long long v48 = [v4 lowercaseString];

  v71[0] = @"address";
  uint64_t v5 = +[NSNumber numberWithInt:1];
  v72[0] = v5;
  v71[1] = @"poi";
  id v6 = +[NSNumber numberWithInt:2];
  v72[1] = v6;
  v71[2] = @"address+poi";
  uint64_t v7 = +[NSNumber numberWithInt:3];
  v72[2] = v7;
  v71[3] = @"canonical";
  long long v8 = +[NSNumber numberWithInteger:0];
  v72[3] = v8;
  long long v49 = +[NSDictionary dictionaryWithObjects:v72 forKeys:v71 count:4];

  uint64_t v9 = [v49 objectForKeyedSubscript:v50];
  LOBYTE(v5) = v9 == 0;

  if (v5)
  {
    id v10 = [objc_alloc((Class)NSString) initWithFormat:@"! \"%@\" isn't recognized as a defined Geocoding mode type. Please use address/poi/address+poi\n Continue processing using SGGeocodingModeAddressOnly.\n", v50];
    puts((const char *)[v10 UTF8String]);
    uint64_t v11 = 1;
  }
  else
  {
    id v10 = [v49 objectForKeyedSubscript:v50];
    uint64_t v11 = (int)[v10 intValue];
  }

  long long v43 = +[SGEventGeocode poiCategoriesFromString:v48];
  id v45 = +[SGRecordId recordIdForContactDetailWithRowId:0];
  id v44 = +[SGOrigin originWithType:0 sourceKey:@"null" externalKey:@"null" fromForwardedMessage:0];
  id v42 = [objc_alloc((Class)SGLocation) initWithId:v45 origin:v44 type:0 label:v47 address:v46 airportCode:v47 accuracy:1.0 quality:1.0];
  uint64_t v61 = 0;
  id v62 = &v61;
  uint64_t v63 = 0x3032000000;
  long long v64 = sub_100006C74;
  long long v65 = sub_100006C84;
  id v66 = 0;
  uint64_t v55 = 0;
  id v56 = &v55;
  uint64_t v57 = 0x3032000000;
  id v58 = sub_100006C74;
  uint64_t v59 = sub_100006C84;
  id v60 = 0;
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_100028A0C;
  v51[3] = &unk_100059960;
  uint64_t v53 = &v61;
  id v54 = &v55;
  id v12 = dispatch_semaphore_create(0);
  id v52 = v12;
  +[SGEventGeocode geocodeLocation:v42 usingMode:v11 withGeoFilters:v43 withCallback:v51];
  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  if (byte_10006A7B8 == 1)
  {
    CFStringRef v13 = (const __CFString *)v56[5];
    if (!v13) {
      CFStringRef v13 = &stru_10005B0F8;
    }
    v70[0] = v13;
    v69[0] = @"timezone";
    v69[1] = @"location";
    v67[0] = @"geocodeLabel";
    uint64_t v14 = [(id)v62[5] geocodeLabel];
    id v15 = (void *)v14;
    if (v14) {
      CFStringRef v16 = (const __CFString *)v14;
    }
    else {
      CFStringRef v16 = &stru_10005B0F8;
    }
    v68[0] = v16;
    v67[1] = @"geocodeAddress";
    uint64_t v17 = [(id)v62[5] geocodeAddress];
    uint64_t v18 = (void *)v17;
    if (v17) {
      CFStringRef v19 = (const __CFString *)v17;
    }
    else {
      CFStringRef v19 = &stru_10005B0F8;
    }
    v68[1] = v19;
    v67[2] = @"geocodeAirportCode";
    uint64_t v20 = [(id)v62[5] geocodeAirportCode];
    id v21 = (void *)v20;
    if (v20) {
      CFStringRef v22 = (const __CFString *)v20;
    }
    else {
      CFStringRef v22 = &stru_10005B0F8;
    }
    v68[2] = v22;
    v67[3] = @"geocodeLatitude";
    id v23 = objc_alloc((Class)NSString);
    [(id)v62[5] geocodeLatitude];
    id v25 = objc_msgSend(v23, "initWithFormat:", @"%f", v24);
    v68[3] = v25;
    v67[4] = @"geocodeLongitude";
    id v26 = objc_alloc((Class)NSString);
    [(id)v62[5] geocodeLongitude];
    id v28 = objc_msgSend(v26, "initWithFormat:", @"%f", v27);
    void v68[4] = v28;
    id v29 = +[NSDictionary dictionaryWithObjects:v68 forKeys:v67 count:5];
    v70[1] = v29;
    v69[2] = @"hasGeocodeHandle";
    id v30 = [(id)v62[5] geocodeHandle];
    CFStringRef v31 = @"true";
    if (!v30) {
      CFStringRef v31 = @"false";
    }
    v70[2] = v31;
    id v32 = +[NSDictionary dictionaryWithObjects:v70 forKeys:v69 count:3];

    id v33 = objc_alloc((Class)NSString);
    sub_10001B094(v32);
    id v34 = (id)objc_claimAutoreleasedReturnValue();
    id v35 = [v33 initWithFormat:@"%@", v34];
    puts((const char *)[v35 UTF8String]);
  }
  else
  {
    id v36 = objc_alloc((Class)NSString);
    id v37 = [v36 initWithFormat:@"Geocoded location %@", v62[5]];
    puts((const char *)[v37 UTF8String]);

    id v38 = objc_alloc((Class)NSString);
    id v39 = [v38 initWithFormat:@"Detected timezone: %@", v56[5]];
    puts((const char *)[v39 UTF8String]);

    id v40 = objc_alloc((Class)NSString);
    id v32 = [(id)v62[5] geocodeHandle];
    CFStringRef v41 = @"Yes";
    if (!v32) {
      CFStringRef v41 = @"No";
    }
    id v34 = [v40 initWithFormat:@"Maps Handle data: %@", v41];
    puts((const char *)[v34 UTF8String]);
  }

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v61, 8);
}

void sub_1000289DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_100028A0C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100028AA8(id a1, NSArray *a2)
{
  id v29 = a2;
  id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Getting all database storage events corresponding to events that are saved on the calendars"];
  puts((const char *)[v2 UTF8String]);

  uint64_t v56 = 0;
  uint64_t v57 = &v56;
  uint64_t v58 = 0x3032000000;
  uint64_t v59 = sub_100006C74;
  id v60 = sub_100006C84;
  id v61 = 0;
  uint64_t v50 = 0;
  uint64_t v51 = &v50;
  uint64_t v52 = 0x3032000000;
  uint64_t v53 = sub_100006C74;
  id v54 = sub_100006C84;
  id v55 = 0;
  id v3 = +[SGSuggestionsService serviceForEvents];
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  void v46[2] = sub_100028FF0;
  v46[3] = &unk_100058DB0;
  long long v48 = &v50;
  long long v49 = &v56;
  id v4 = dispatch_semaphore_create(0);
  long long v47 = v4;
  [v3 allEventsLimitedTo:10000 withCompletion:v46];
  id v30 = v4;
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  id v32 = objc_opt_new();
  id v5 = objc_opt_new();
  id v33 = objc_opt_new();
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = (id)v51[5];
  id v6 = [obj countByEnumeratingWithState:&v42 objects:v64 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v43;
    do
    {
      for (int i = 0; i != v6; int i = (char *)i + 1)
      {
        if (*(void *)v43 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        id v10 = [v9 opaqueKey];
        id v11 = [v33 predicateForEventCreatedFromSuggestionWithOpaqueKey:v10];

        uint64_t v12 = [v33 eventsMatchingPredicate:v11];
        CFStringRef v13 = (void *)v12;
        uint64_t v14 = &__NSArray0__struct;
        if (v12) {
          uint64_t v14 = (void *)v12;
        }
        id v15 = v14;

        if ([v15 count]) {
          [v32 addObject:v9];
        }
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v16 = v15;
        id v17 = [v16 countByEnumeratingWithState:&v38 objects:v63 count:16];
        if (v17)
        {
          uint64_t v18 = *(void *)v39;
          do
          {
            for (uint64_t j = 0; j != v17; uint64_t j = (char *)j + 1)
            {
              if (*(void *)v39 != v18) {
                objc_enumerationMutation(v16);
              }
              [v5 addObject:*(void *)(*((void *)&v38 + 1) + 8 * (void)j)];
            }
            id v17 = [v16 countByEnumeratingWithState:&v38 objects:v63 count:16];
          }
          while (v17);
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v42 objects:v64 count:16];
    }
    while (v6);
  }

  sub_10002908C(v32, (void *)v57[5]);
  id v20 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Found %d EKEvents on the calendars corresponding to the above database storage events", objc_msgSend(v5, "count"));
  puts((const char *)[v20 UTF8String]);

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v21 = v5;
  id v22 = [v21 countByEnumeratingWithState:&v34 objects:v62 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v35;
    do
    {
      for (unint64_t k = 0; k != v22; unint64_t k = (char *)k + 1)
      {
        if (*(void *)v35 != v23) {
          objc_enumerationMutation(v21);
        }
        id v25 = *(void **)(*((void *)&v34 + 1) + 8 * (void)k);
        id v26 = objc_alloc((Class)NSString);
        uint64_t v27 = [v25 description];
        id v28 = [v26 initWithFormat:@"%@", v27, v29, v30];
        puts((const char *)[v28 UTF8String]);
      }
      id v22 = [v21 countByEnumeratingWithState:&v34 objects:v62 count:16];
    }
    while (v22);
  }

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v56, 8);
}

void sub_100028F88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
}

void sub_100028FF0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10002908C(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = &selRef_socialProfiles;
  int v6 = byte_10006A7B8;
  uint64_t v7 = &CFPreferencesCopyKeyList_ptr;
  id v8 = objc_alloc((Class)NSString);
  if (v6 == 1)
  {
    uint64_t v9 = sub_10001B094(v3);
    id v10 = [v8 initWithFormat:@"%@", v9];
    puts((const char *)[v10 UTF8String]);
  }
  else
  {
    id v69 = v4;
    id v11 = objc_msgSend(v8, "initWithFormat:", @"Found events: %lu\n", objc_msgSend(v3, "count"));
    puts((const char *)[v11 UTF8String]);

    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id v70 = v3;
    id obj = v3;
    id v12 = [obj countByEnumeratingWithState:&v73 objects:v77 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v74;
      uint64_t v71 = *(void *)v74;
      do
      {
        for (int i = 0; i != v13; int i = (char *)i + 1)
        {
          if (*(void *)v74 != v14) {
            objc_enumerationMutation(obj);
          }
          id v16 = *(id *)(*((void *)&v73 + 1) + 8 * i);
          int v17 = *((unsigned __int8 *)v5 + 1976);
          uint64_t v18 = v7;
          id v19 = objc_alloc((Class)v7[274]);
          if (v17 == 1)
          {
            sub_10001B094(v16);
            id v20 = (id)objc_claimAutoreleasedReturnValue();
            id v21 = [v19 initWithFormat:@"%@", v20];
            puts((const char *)[v21 UTF8String]);

            uint64_t v7 = v18;
          }
          else
          {
            id v22 = v13;
            id v23 = objc_alloc((Class)v18[274]);
            uint64_t v24 = [v16 recordId];
            id v25 = objc_msgSend(v23, "initWithFormat:", @"%6lld", objc_msgSend(v24, "numericValue"));
            id v26 = sub_100006034(v25);
            uint64_t v27 = [v16 title];
            id v28 = [v19 initWithFormat:@"%@: %@", v26, v27];
            puts((const char *)[v28 UTF8String]);

            id v29 = [v16 tags];
            id v30 = +[SGEntityTag extractedEventCancellation];
            CFStringRef v31 = [v30 name];
            LODWORD(v27) = [v29 containsObject:v31];

            id v32 = v18;
            if (v27)
            {
              id v33 = objc_alloc((Class)v18[274]);
              long long v34 = sub_100006034(@"*** Canceled ***");
              id v35 = [v33 initWithFormat:@"%*c%@", 8, 32, v34];
              puts((const char *)[v35 UTF8String]);
            }
            long long v36 = [v16 start];

            if (v36)
            {
              id v37 = objc_alloc((Class)v18[274]);
              long long v38 = sub_100006034(@"Start");
              long long v39 = [v16 start];
              long long v40 = [v16 startTimeZone];
              long long v41 = sub_100027564(v39, v40);
              id v42 = [v37 initWithFormat:@"%*c%@: %@", 8, 32, v38, v41];
              puts((const char *)[v42 UTF8String]);

              id v32 = &CFPreferencesCopyKeyList_ptr;
            }
            long long v43 = [v16 end];

            if (v43)
            {
              id v44 = objc_alloc((Class)v32[274]);
              long long v45 = sub_100006034(@"End  ");
              id v46 = [v16 end];
              long long v47 = [v16 endTimeZone];
              long long v48 = sub_100027564(v46, v47);
              id v49 = [v44 initWithFormat:@"%*c%@: %@", 8, 32, v45, v48];
              puts((const char *)[v49 UTF8String]);

              id v32 = &CFPreferencesCopyKeyList_ptr;
            }
            if ([v16 isAllDay])
            {
              id v50 = objc_alloc((Class)v32[274]);
              uint64_t v51 = sub_100006034(@"All day event");
              id v52 = [v50 initWithFormat:@"%*c%@", 8, 32, v51];
              puts((const char *)[v52 UTF8String]);
            }
            uint64_t v53 = [v16 naturalLanguageEventTypeIdentifier];

            id v13 = v22;
            if (v53)
            {
              id v54 = objc_alloc((Class)v32[274]);
              id v55 = sub_100006034(@"NL type id");
              uint64_t v56 = [v16 naturalLanguageEventTypeIdentifier];
              id v57 = [v54 initWithFormat:@"%*c%@: %@", 8, 32, v55, v56];
              puts((const char *)[v57 UTF8String]);

              id v32 = &CFPreferencesCopyKeyList_ptr;
            }
            id v58 = objc_alloc((Class)v32[274]);
            uint64_t v59 = sub_100006034(@"External key");
            id v60 = [v16 origin];
            id v61 = [v60 externalKey];
            id v62 = [v58 initWithFormat:@"%*c%@: %@", 8, 32, v59, v61];
            puts((const char *)[v62 UTF8String]);

            id v63 = objc_alloc((Class)NSString);
            long long v64 = sub_100006034(@"Opaque key");
            long long v65 = [v16 opaqueKey];
            id v66 = [v63 initWithFormat:@"%*c%@: %@", 8, 32, v64, v65];
            puts((const char *)[v66 UTF8String]);

            uint64_t v7 = &CFPreferencesCopyKeyList_ptr;
            id v20 = [objc_alloc((Class)NSString) initWithFormat:&stru_10005B0F8];
            puts((const char *)[v20 UTF8String]);
            id v5 = &selRef_socialProfiles;
            uint64_t v14 = v71;
          }
        }
        id v13 = [obj countByEnumeratingWithState:&v73 objects:v77 count:16];
      }
      while (v13);
    }

    id v4 = v69;
    if (v69)
    {
      id v67 = [objc_alloc((Class)v7[274]) initWithFormat:@"Error! %@", v69];
      puts((const char *)[v67 UTF8String]);
    }
    id v68 = [objc_alloc((Class)v7[274]) initWithFormat:&stru_10005B0F8];
    puts((const char *)[v68 UTF8String]);

    id v3 = v70;
  }
}

void sub_1000297A0(id a1, NSArray *a2)
{
  id v2 = a2;
  sub_10001A9E0([(NSArray *)v2 count] != 0, @"allEventsInEmlFiles PATH [...]\nMultiple path arguments are allowed. The path can contain both eml files and NeXT format mbox packages.");
  id v3 = objc_opt_new();
  id v4 = +[SGSuggestionsService serviceForInternal];
  id v5 = objc_opt_new();
  v66[0] = _NSConcreteStackBlock;
  v66[1] = 3221225472;
  v66[2] = sub_100029E20;
  v66[3] = &unk_1000598D0;
  id v45 = v4;
  id v67 = v45;
  id v43 = v5;
  id v68 = v43;
  id v44 = v3;
  id v69 = v44;
  uint64_t v51 = objc_retainBlock(v66);
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id obj = v2;
  id v6 = [(NSArray *)obj countByEnumeratingWithState:&v62 objects:v71 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v63;
    NSFileAttributeType v9 = NSFileTypeRegular;
    id v10 = &CFPreferencesCopyKeyList_ptr;
    uint64_t v46 = *(void *)v63;
    do
    {
      id v11 = 0;
      id v47 = v7;
      do
      {
        if (*(void *)v63 != v8) {
          objc_enumerationMutation(obj);
        }
        id v50 = (char *)v11;
        id v12 = *(void **)(*((void *)&v62 + 1) + 8 * (void)v11);
        char v61 = 0;
        id v13 = [v10[253] defaultManager];
        unsigned __int8 v14 = [v13 fileExistsAtPath:v12 isDirectory:&v61];

        if (v14)
        {
          if (v61)
          {
            id v15 = [v10[253] defaultManager];
            id v16 = [v15 enumeratorAtPath:v12];

            long long v59 = 0u;
            long long v60 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            id v17 = v16;
            id v54 = [v17 countByEnumeratingWithState:&v57 objects:v70 count:16];
            if (!v54) {
              goto LABEL_30;
            }
            uint64_t v53 = *(void *)v58;
            id v52 = v12;
            while (1)
            {
              for (int i = 0; i != v54; int i = (char *)i + 1)
              {
                if (*(void *)v58 != v53) {
                  objc_enumerationMutation(v17);
                }
                uint64_t v19 = *(void *)(*((void *)&v57 + 1) + 8 * i);
                id v21 = [v12 stringByAppendingPathComponent:v19];
                id v22 = [v17 fileAttributes];
                id v23 = [v22 objectForKeyedSubscript:NSFileType];

                if ([v23 isEqual:v9])
                {
                  uint64_t v24 = [v21 stringByDeletingLastPathComponent];
                  id v25 = [v24 pathExtension];
                  unsigned int v26 = [v25 isEqual:@"mbox"];

                  if (v26)
                  {
                    uint64_t v27 = [v21 lastPathComponent];
                    unsigned int v28 = [v27 isEqual:@"mbox"];

                    id v12 = v52;
                    if (!v28) {
                      goto LABEL_28;
                    }
                    uint64_t v29 = [v21 stringByDeletingLastPathComponent];

                    id v30 = NSFileTypeDirectory;
                    id v21 = (void *)v29;
                    id v23 = v30;
                  }
                  else
                  {
                    id v12 = v52;
                  }
                }
                if ([v23 isEqual:NSFileTypeDirectory])
                {
                  CFStringRef v31 = [v21 pathExtension];
                  unsigned int v32 = [v31 isEqual:@"mbox"];

                  if (!v32) {
                    goto LABEL_28;
                  }
                  id v33 = objc_alloc((Class)NSData);
                  long long v34 = [v21 stringByAppendingPathComponent:@"table_of_contents"];
                  id v35 = [v33 initWithContentsOfFile:v34 options:1 error:0];

                  id v36 = objc_alloc((Class)NSData);
                  id v37 = [v21 stringByAppendingPathComponent:@"mbox"];
                  id v38 = [v36 initWithContentsOfFile:v37 options:1 error:0];

                  if (v35 && v38)
                  {
                    v55[0] = _NSConcreteStackBlock;
                    v55[1] = 3221225472;
                    v55[2] = sub_10002A0C4;
                    v55[3] = &unk_1000598F8;
                    uint64_t v56 = v51;
                    +[SGSimpleMailMessage enumerateRfc822InNeXTMbox:v38 tableOfContents:v35 withBlock:v55];
                  }
                  [v17 skipDescendants];

                  NSFileAttributeType v9 = NSFileTypeRegular;
                  id v12 = v52;
                }
                if ([v23 isEqual:v9])
                {
                  id v39 = [objc_alloc((Class)NSData) initWithContentsOfFile:v21 options:1 error:0];
                  if (v39) {
                    ((void (*)(void *, id))v51[2])(v51, v39);
                  }
                }
LABEL_28:
              }
              id v54 = [v17 countByEnumeratingWithState:&v57 objects:v70 count:16];
              if (!v54)
              {
LABEL_30:

                uint64_t v8 = v46;
                id v7 = v47;
                id v10 = &CFPreferencesCopyKeyList_ptr;
                goto LABEL_32;
              }
            }
          }
          long long v41 = +[NSData dataWithContentsOfFile:v12 options:1 error:0];
          long long v40 = v50;
          if (v41) {
            ((void (*)(void *, void *))v51[2])(v51, v41);
          }
        }
        else
        {
          fprintf(__stderrp, "Could not resolve path, skipping: %s\n", (const char *)[v12 UTF8String]);
LABEL_32:
          long long v40 = v50;
        }
        id v11 = v40 + 1;
      }
      while (v11 != v7);
      id v42 = [(NSArray *)obj countByEnumeratingWithState:&v62 objects:v71 count:16];
      id v7 = v42;
    }
    while (v42);
  }

  sub_10002908C(v44, 0);
}

void sub_100029E20(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v32 = 0;
  id v5 = [v4 suggestionsFromRFC822Data:v3 source:@"allEventsInEmlFiles" options:1073741826 error:&v32];
  id v6 = v32;
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = __stderrp;
    id v9 = [v6 description];
    fprintf(v8, "Error: %s", (const char *)[v9 UTF8String]);
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v10 = v5;
  id v11 = [v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
  id obj = v10;
  if (!v11) {
    goto LABEL_21;
  }
  id v12 = v11;
  id v25 = v7;
  id v26 = v3;
  id v10 = 0;
  uint64_t v13 = *(void *)v29;
  while (2)
  {
    for (int i = 0; i != v12; int i = (char *)i + 1)
    {
      if (*(void *)v29 != v13) {
        objc_enumerationMutation(obj);
      }
      id v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = v15;
        id v17 = [v16 event];

        if (v17)
        {
          if (!v10)
          {
            uint64_t v18 = [v16 event];
            uint64_t v19 = [v18 origin];
            id v10 = [v19 externalKey];
          }
          if ([*(id *)(a1 + 40) containsObject:v10])
          {

            goto LABEL_19;
          }
          id v20 = *(void **)(a1 + 48);
          id v21 = [v16 event];
          id v22 = objc_msgSend(v20, "indexOfObject:inSortedRange:options:usingComparator:", v21, 0, objc_msgSend(*(id *)(a1 + 48), "count"), 1024, &stru_1000598A8);

          id v23 = *(void **)(a1 + 48);
          uint64_t v24 = [v16 event];
          [v23 insertObject:v24 atIndex:v22];
        }
      }
    }
    id v12 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v12) {
      continue;
    }
    break;
  }
LABEL_19:

  id v7 = v25;
  id v3 = v26;
  if (v10)
  {
    [*(id *)(a1 + 40) addObject:v10];
LABEL_21:
  }
}

uint64_t sub_10002A0C4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

int64_t sub_10002A0D4(id a1, SGEvent *a2, SGEvent *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [(SGEvent *)v4 start];
  id v7 = [(SGEvent *)v5 start];
  id v8 = [v6 compare:v7];
  if (!v8)
  {
    id v9 = [(SGEvent *)v4 end];
    id v10 = [(SGEvent *)v5 end];
    id v8 = [v9 compare:v10];
    if (!v8)
    {
      id v11 = [(SGEvent *)v4 title];
      id v12 = [(SGEvent *)v5 title];
      id v8 = [v11 compare:v12];
    }
  }

  return (int64_t)v8;
}

void sub_10002A1E0(id a1, NSArray *a2)
{
  id v2 = a2;
  id v3 = [objc_alloc((Class)NSString) initWithFormat:@"Getting all events"];
  puts((const char *)[v3 UTF8String]);

  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = sub_100006C74;
  id v20 = sub_100006C84;
  id v21 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = sub_100006C74;
  unsigned __int8 v14 = sub_100006C84;
  id v15 = 0;
  id v4 = +[SGSuggestionsService serviceForEvents];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002A3B4;
  v6[3] = &unk_100058DB0;
  id v8 = &v10;
  id v9 = &v16;
  id v5 = dispatch_semaphore_create(0);
  id v7 = v5;
  [v4 allEventsLimitedTo:10000 withCompletion:v6];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  sub_10002908C((void *)v11[5], (void *)v17[5]);

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v16, 8);
}

void sub_10002A38C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10002A3B4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10002A450(id a1, NSArray *a2)
{
  id v2 = a2;
  id v3 = [objc_alloc((Class)NSString) initWithFormat:@"Getting all contacts"];
  puts((const char *)[v3 UTF8String]);

  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = sub_100006C74;
  id v20 = sub_100006C84;
  id v21 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = sub_100006C74;
  unsigned __int8 v14 = sub_100006C84;
  id v15 = 0;
  id v4 = +[SGSuggestionsService serviceForContacts];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002A624;
  v6[3] = &unk_100058DB0;
  id v8 = &v10;
  uint64_t v9 = &v16;
  id v5 = dispatch_semaphore_create(0);
  uint64_t v7 = v5;
  [v4 allContactsLimitedTo:10000 withCompletion:v6];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  sub_10002A6C0((void *)v11[5], (void *)v17[5]);

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v16, 8);
}

void sub_10002A5FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10002A624(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10002A6C0(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  int v5 = byte_10006A7B8;
  id v6 = objc_alloc((Class)NSString);
  if (v5 == 1)
  {
    uint64_t v7 = sub_10001B094(v3);
    id v8 = [v6 initWithFormat:@"%@", v7];
    puts((const char *)[v8 UTF8String]);
  }
  else
  {
    id v9 = objc_msgSend(v6, "initWithFormat:", @"Found contacts: %lu\n", objc_msgSend(v3, "count"));
    puts((const char *)[v9 UTF8String]);

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v10 = v3;
    id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (int i = 0; i != v12; int i = (char *)i + 1)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          sub_100022874(*(void **)(*((void *)&v17 + 1) + 8 * i), 0);
          id v15 = [objc_alloc((Class)NSString) initWithFormat:&stru_10005B0F8];
          puts((const char *)[v15 UTF8String]);
        }
        id v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }

    if (v4)
    {
      id v16 = [objc_alloc((Class)NSString) initWithFormat:@"Error! %@", v4];
      puts((const char *)[v16 UTF8String]);
    }
  }
}

void sub_10002A8C0(id a1, NSArray *a2)
{
  id v2 = a2;
  sub_10001A9E0((id)[(NSArray *)v2 count] == (id)1, @"contactMatchesWithContactIdentifier IDENTIFIER_STRING");
  id v3 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x3032000000;
  long long v19 = sub_100006C74;
  long long v20 = sub_100006C84;
  id v21 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = sub_100006C74;
  unsigned __int8 v14 = sub_100006C84;
  id v15 = 0;
  id v4 = +[SGSuggestionsService serviceForContacts];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002AAA4;
  v6[3] = &unk_100058DB0;
  id v8 = &v10;
  id v9 = &v16;
  int v5 = dispatch_semaphore_create(0);
  uint64_t v7 = v5;
  [v4 contactMatchesWithContactIdentifier:v3 limitTo:10000 withCompletion:v6];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  sub_10002AB40((void *)v11[5], (void *)v17[5]);

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v16, 8);
}

void sub_10002AA7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_10002AAA4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10002AB40(void *a1, void *a2)
{
  id v3 = a1;
  id v47 = a2;
  id v4 = &selRef_socialProfiles;
  int v5 = byte_10006A7B8;
  id v6 = &CFPreferencesCopyKeyList_ptr;
  id v7 = objc_alloc((Class)NSString);
  if (v5 == 1)
  {
    id v8 = sub_10001B094(v3);
    id v9 = [v7 initWithFormat:@"%@", v8];
    puts((const char *)[v9 UTF8String]);

    goto LABEL_41;
  }
  id v10 = objc_msgSend(v7, "initWithFormat:", @"Found contacts: %lu\n", objc_msgSend(v3, "count"));
  puts((const char *)[v10 UTF8String]);

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id obj = v3;
  id v11 = [obj countByEnumeratingWithState:&v66 objects:v78 count:16];
  if (!v11) {
    goto LABEL_39;
  }
  id v12 = v11;
  uint64_t v13 = *(void *)v67;
  uint64_t v48 = *(void *)v67;
  id v49 = v3;
  do
  {
    unsigned __int8 v14 = 0;
    id v50 = v12;
    do
    {
      if (*(void *)v67 != v13) {
        objc_enumerationMutation(obj);
      }
      id v15 = *(id *)(*((void *)&v66 + 1) + 8 * (void)v14);
      uint64_t v16 = v15;
      if (*((unsigned char *)v4 + 1976) == 1)
      {
        id v17 = objc_alloc((Class)v6[274]);
        uint64_t v18 = sub_10001B094(v16);
        id v19 = [v17 initWithFormat:@"%@", v18];
        puts((const char *)[v19 UTF8String]);

        goto LABEL_37;
      }
      uint64_t v53 = v14;
      uint64_t v18 = [v15 contact];
      sub_100022874(v18, 0);
      id v52 = v16;
      id v20 = v16;
      id v21 = sub_100023278();
      id v22 = objc_alloc((Class)v6[274]);
      id v23 = sub_1000232CC(@"matches", 0);
      id v24 = [v22 initWithFormat:@"%@%@:", v21, v23];
      puts((const char *)[v24 UTF8String]);

      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      uint64_t v56 = v20;
      id v54 = [v20 matchTokens];
      id v57 = [v54 countByEnumeratingWithState:&v74 objects:v81 count:16];
      if (!v57) {
        goto LABEL_36;
      }
      uint64_t v55 = *(void *)v75;
      long long v65 = v18;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v75 != v55) {
            objc_enumerationMutation(v54);
          }
          uint64_t v59 = v25;
          id v26 = *(void **)(*((void *)&v74 + 1) + 8 * v25);
          long long v58 = [v26 stringByReplacingOccurrencesOfString:@"##&" withString:&stru_10005B0F8];
          id v27 = [objc_alloc((Class)v6[274]) initWithFormat:@"%@%@%@:", v21, v21, v58];
          puts((const char *)[v27 UTF8String]);

          long long v72 = 0u;
          long long v73 = 0u;
          long long v70 = 0u;
          long long v71 = 0u;
          long long v28 = [v56 matchedDetails];
          long long v29 = [v28 matchedDetailsForToken:v26];

          id v64 = v29;
          id v30 = [v29 countByEnumeratingWithState:&v70 objects:v80 count:16];
          if (v30)
          {
            id v31 = v30;
            uint64_t v32 = *(void *)v71;
            do
            {
              id v33 = 0;
              do
              {
                if (*(void *)v71 != v32) {
                  objc_enumerationMutation(v64);
                }
                long long v34 = *(void **)(*((void *)&v70 + 1) + 8 * (void)v33);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v35 = [v34 emailAddress];
LABEL_28:
                  id v36 = (__CFString *)v35;
                  goto LABEL_29;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v35 = [v34 fullName];
                  goto LABEL_28;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v35 = [v34 phoneNumber];
                  goto LABEL_28;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v35 = [v34 address];
                  goto LABEL_28;
                }
                objc_opt_class();
                id v36 = @"unknown";
                if (objc_opt_isKindOfClass())
                {
                  id v38 = v34;
                  long long v63 = [v38 service];
                  v79[0] = v63;
                  long long v62 = [v38 displayName];
                  v79[1] = v62;
                  char v61 = [v38 username];
                  v79[2] = v61;
                  long long v60 = [v38 userIdentifier];
                  v79[3] = v60;
                  id v39 = [v38 teamIdentifier];
                  v79[4] = v39;
                  long long v40 = [v38 bundleIdentifier];
                  v79[5] = v40;
                  +[NSArray arrayWithObjects:v79 count:6];
                  v42 = long long v41 = v6;
                  objc_msgSend(v42, "_pas_proxyComponentsJoinedByString:", @" | ");
                  id v36 = (__CFString *)objc_claimAutoreleasedReturnValue();

                  id v6 = v41;
                }
LABEL_29:
                id v37 = [objc_alloc((Class)v6[274]) initWithFormat:@"%@%@%@%@", v21, v21, v21, v36];
                puts((const char *)[v37 UTF8String]);

                id v33 = (char *)v33 + 1;
                uint64_t v18 = v65;
              }
              while (v31 != v33);
              id v43 = [v64 countByEnumeratingWithState:&v70 objects:v80 count:16];
              id v31 = v43;
            }
            while (v43);
          }

          uint64_t v25 = v59 + 1;
        }
        while ((id)(v59 + 1) != v57);
        id v57 = [v54 countByEnumeratingWithState:&v74 objects:v81 count:16];
      }
      while (v57);
LABEL_36:

      id v3 = v49;
      id v12 = v50;
      id v4 = &selRef_socialProfiles;
      uint64_t v13 = v48;
      uint64_t v16 = v52;
      unsigned __int8 v14 = v53;
LABEL_37:

      id v44 = [objc_alloc((Class)v6[274]) initWithFormat:&stru_10005B0F8];
      puts((const char *)[v44 UTF8String]);

      unsigned __int8 v14 = (char *)v14 + 1;
    }
    while (v14 != v12);
    id v12 = [obj countByEnumeratingWithState:&v66 objects:v78 count:16];
  }
  while (v12);
LABEL_39:

  id v45 = v47;
  if (v47)
  {
    id v46 = [objc_alloc((Class)v6[274]) initWithFormat:@"Error! %@", v47];
    puts((const char *)[v46 UTF8String]);

LABEL_41:
    id v45 = v47;
  }
}

void sub_10002B20C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10002B2A8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10002B344(id a1, NSArray *a2)
{
  id v2 = a2;
  sub_10001A9E0((id)[(NSArray *)v2 count] == (id)5, @"contactMatchesWithContact FIRST_NAME LAST_NAME EMAIL PHONE POSTAL_ADDRESS");
  id v3 = objc_opt_new();
  id v4 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  [v3 setGivenName:v4];

  id v5 = [(NSArray *)v2 objectAtIndexedSubscript:1];
  [v3 setFamilyName:v5];

  id v6 = [(NSArray *)v2 objectAtIndexedSubscript:2];
  unsigned __int8 v7 = [v6 isEqualToString:&stru_10005B0F8];

  if ((v7 & 1) == 0)
  {
    id v8 = [(NSArray *)v2 objectAtIndexedSubscript:2];
    uint64_t v9 = +[CNLabeledValue labeledValueWithLabel:CNLabelHome value:v8];
    id v45 = v9;
    id v10 = +[NSArray arrayWithObjects:&v45 count:1];
    [v3 setEmailAddresses:v10];
  }
  id v11 = [(NSArray *)v2 objectAtIndexedSubscript:3];
  id v12 = +[CNPhoneNumber phoneNumberWithStringValue:v11];

  if (v12)
  {
    uint64_t v13 = [(NSArray *)v2 objectAtIndexedSubscript:3];
    unsigned __int8 v14 = [v13 isEqualToString:&stru_10005B0F8];

    if ((v14 & 1) == 0)
    {
      id v15 = +[CNLabeledValue labeledValueWithLabel:CNLabelHome value:v12];
      id v44 = v15;
      uint64_t v16 = +[NSArray arrayWithObjects:&v44 count:1];
      [v3 setPhoneNumbers:v16];
    }
    id v17 = [(NSArray *)v2 objectAtIndexedSubscript:4];
    unsigned __int8 v18 = [v17 isEqualToString:&stru_10005B0F8];

    if ((v18 & 1) == 0)
    {
      id v19 = [(NSArray *)v2 objectAtIndexedSubscript:4];
      id v20 = +[CNLabeledValue labeledValueWithLabel:CNLabelHome value:v19];
      id v43 = v20;
      id v21 = +[NSArray arrayWithObjects:&v43 count:1];
      [v3 setPostalAddresses:v21];
    }
    uint64_t v37 = 0;
    id v38 = &v37;
    uint64_t v39 = 0x3032000000;
    long long v40 = sub_100006C74;
    long long v41 = sub_100006C84;
    id v42 = 0;
    uint64_t v31 = 0;
    uint64_t v32 = &v31;
    uint64_t v33 = 0x3032000000;
    long long v34 = sub_100006C74;
    uint64_t v35 = sub_100006C84;
    id v36 = 0;
    id v22 = +[SGSuggestionsService serviceForContacts];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10002B7FC;
    v27[3] = &unk_100058DB0;
    long long v29 = &v31;
    id v30 = &v37;
    id v23 = dispatch_semaphore_create(0);
    long long v28 = v23;
    [v22 contactMatchesWithContact:v3 limitTo:10000 withCompletion:v27];
    dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
    sub_10002AB40((void *)v32[5], (void *)v38[5]);

    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(&v37, 8);
  }
  else
  {
    id v24 = objc_alloc((Class)NSString);
    uint64_t v25 = [(NSArray *)v2 objectAtIndexedSubscript:3];
    id v26 = [v24 initWithFormat:@"Error: failed to create CNPhoneNumber from '%@'", v25];
    puts((const char *)[v26 UTF8String]);
  }
}

void sub_10002B7CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10002B7FC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10002B898(id a1, NSArray *a2)
{
  id v2 = a2;
  sub_10001A9E0([(NSArray *)v2 count] != 0, @"cnContactMatchesForRecordIds RECORD_ID ...");
  unsigned __int8 v18 = v2;
  id v19 = sgMap();
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = sub_100006C74;
  v42[4] = sub_100006C84;
  id v43 = 0;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000;
  uint64_t v39 = sub_100006C74;
  long long v40 = sub_100006C84;
  id v41 = 0;
  id v3 = +[SGSuggestionsService serviceForContacts];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10002BCB0;
  v32[3] = &unk_100058DB0;
  long long v34 = &v36;
  uint64_t v35 = v42;
  id v4 = dispatch_semaphore_create(0);
  uint64_t v33 = v4;
  id v17 = v3;
  [v3 cnContactMatchesForRecordIds:v19 withCompletion:v32];
  uint64_t v16 = v4;
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = (id)v37[5];
  id v22 = [obj countByEnumeratingWithState:&v28 objects:v45 count:16];
  if (v22)
  {
    uint64_t v21 = *(void *)v29;
    do
    {
      id v23 = 0;
      do
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v28 + 1) + 8 * (void)v23);
        id v6 = objc_retainAutorelease([objc_alloc((Class)NSString) initWithFormat:@"("];
        puts((const char *)[v6 UTF8String]);

        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v7 = v5;
        id v8 = [v7 countByEnumeratingWithState:&v24 objects:v44 count:16];
        if (v8)
        {
          uint64_t v9 = *(void *)v25;
          do
          {
            uint64_t v10 = 0;
            do
            {
              if (*(void *)v25 != v9) {
                objc_enumerationMutation(v7);
              }
              uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8 * (void)v10);
              id v12 = objc_alloc((Class)NSString);
              uint64_t v13 = sub_100006034(@"Identifier:");
              id v14 = [v12 initWithFormat:@"\t%@ %@", v13, v11, v16];
              puts((const char *)[v14 UTF8String]);

              uint64_t v10 = (char *)v10 + 1;
            }
            while (v8 != v10);
            id v8 = [v7 countByEnumeratingWithState:&v24 objects:v44 count:16];
          }
          while (v8);
        }

        id v15 = [objc_alloc((Class)NSString) initWithFormat:@""]);
        puts((const char *)[v15 UTF8String]);

        id v23 = (char *)v23 + 1;
      }
      while (v23 != v22);
      id v22 = [obj countByEnumeratingWithState:&v28 objects:v45 count:16];
    }
    while (v22);
  }

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(v42, 8);
}

void sub_10002BC68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
}

void sub_10002BCB0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

SGRecordId *__cdecl sub_10002BD4C(id a1, NSString *a2)
{
  id v2 = a2;
  if ([(NSString *)v2 intValue] <= 0)
  {
    id v5 = [objc_alloc((Class)NSString) initWithFormat:@"Error: RECORD_ID must be a positive integer"];
    puts((const char *)[v5 UTF8String]);

    exit(2);
  }
  id v3 = +[SGRecordId recordIdWithNumericValue:[(NSString *)v2 intValue]];

  return (SGRecordId *)v3;
}

void sub_10002BDEC(id a1, NSArray *a2)
{
  id v2 = a2;
  sub_10001A9E0((id)[(NSArray *)v2 count] == (id)1, @"cnContactMatchesForRecordId RECORD_ID");
  unsigned __int8 v18 = v2;
  id v3 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  int v4 = [v3 intValue];

  if (v4 <= 0)
  {
    id v15 = [objc_alloc((Class)NSString) initWithFormat:@"Error: RECORD_ID must be a positive integer"];
    puts((const char *)[v15 UTF8String]);

    exit(2);
  }
  id v19 = +[SGRecordId recordIdWithNumericValue:v4];
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = sub_100006C74;
  void v34[4] = sub_100006C84;
  id v35 = 0;
  uint64_t v28 = 0;
  long long v29 = &v28;
  uint64_t v30 = 0x3032000000;
  long long v31 = sub_100006C74;
  uint64_t v32 = sub_100006C84;
  id v33 = 0;
  id v5 = +[SGSuggestionsService serviceForContacts];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10002C168;
  v24[3] = &unk_100058DB0;
  long long v26 = &v28;
  long long v27 = v34;
  id v6 = dispatch_semaphore_create(0);
  long long v25 = v6;
  id v17 = v5;
  [v5 cnContactMatchesForRecordId:v19 withCompletion:v24];
  uint64_t v16 = v6;
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = (id)v29[5];
  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v36 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v21;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * (void)v10);
        id v12 = objc_alloc((Class)NSString);
        uint64_t v13 = sub_100006034(@"Identifier:");
        id v14 = [v12 initWithFormat:@"%@ %@", v13, v11, v16];
        puts((const char *)[v14 UTF8String]);

        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v7 countByEnumeratingWithState:&v20 objects:v36 count:16];
    }
    while (v8);
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(v34, 8);
}

void sub_10002C12C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

void sub_10002C168(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10002C204(id a1, NSArray *a2)
{
  id v2 = a2;
  sub_10001A9E0((id)[(NSArray *)v2 count] == (id)2, @"registerContactWithRecents NAME PHONE/EMAIL");
  id v3 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  int v4 = SGNormalizeName();

  id v5 = [(NSArray *)v2 objectAtIndexedSubscript:1];
  if ([v5 rangeOfString:@"@"] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = CRAddressKindPhoneNumber;
    SGNormalizePhoneNumber();
  }
  else
  {
    id v6 = CRAddressKindEmail;
    SGNormalizeEmailAddress();
  uint64_t v7 = };

  id v8 = +[NSDate date];
  uint64_t v9 = +[CRRecentContactsLibrary recentEventForAddress:v7 displayName:v4 kind:v6 date:v8 weight:&off_100064B00 metadata:0 options:1];

  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  uint64_t v24 = 0;
  long long v25 = &v24;
  uint64_t v26 = 0x3032000000;
  long long v27 = sub_100006C74;
  uint64_t v28 = sub_100006C84;
  id v29 = 0;
  id v11 = +[CRRecentContactsLibrary defaultInstance];
  uint64_t v30 = v9;
  id v12 = +[NSArray arrayWithObjects:&v30 count:1];
  uint64_t v13 = CRRecentsDomainMessages;
  unsigned __int8 v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  long long v20 = sub_10002C564;
  long long v21 = &unk_100059748;
  long long v23 = &v24;
  id v14 = v10;
  long long v22 = v14;
  [v11 recordContactEvents:v12 recentsDomain:v13 sendingAddress:0 completion:&v18];

  dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  if (v25[5])
  {
    id v15 = objc_alloc((Class)NSString);
    id v16 = [(id)v25[5] debugDescription];
    id v17 = [v15 initWithFormat:@"Failed registering %@ with CoreRecents.\n%@", v4, v16, v18, v19, v20, v21];
    puts((const char *)[v17 UTF8String]);
  }
  else
  {
    id v16 = [objc_alloc((Class)NSString) initWithFormat:@"Sucesfully registered %@ with CoreRecents.", v4];
    puts((const char *)[v16 UTF8String]);
  }

  _Block_object_dispose(&v24, 8);
}

void sub_10002C544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002C564(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10002C5C4(id a1, NSArray *a2)
{
  id v2 = a2;
  sub_10001A9E0((id)[(NSArray *)v2 count] == (id)1, @"contactFromRecordID RECORD_ID");
  id v3 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  int v4 = [v3 intValue];

  if (v4 <= 0)
  {
    id v11 = [objc_alloc((Class)NSString) initWithFormat:@"Error: RECORD_ID must be a positive integer"];
    puts((const char *)[v11 UTF8String]);

    exit(2);
  }
  id v5 = +[SGRecordId recordIdWithNumericValue:v4];
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = sub_100006C74;
  void v22[4] = sub_100006C84;
  id v23 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = sub_100006C74;
  long long v20 = sub_100006C84;
  id v21 = 0;
  id v6 = +[SGSuggestionsService serviceForContacts];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002C858;
  v12[3] = &unk_100059700;
  id v14 = &v16;
  id v15 = v22;
  uint64_t v7 = dispatch_semaphore_create(0);
  uint64_t v13 = v7;
  [v6 contactFromRecordID:v5 withCompletion:v12];
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  id v8 = [(id)v17[5] recordId];
  unsigned int v9 = [v8 isEqualToRecordId:v5];

  if (v9)
  {
    sub_100022874((void *)v17[5], 0);
  }
  else
  {
    id v10 = [objc_alloc((Class)NSString) initWithFormat:@"Record not found"];
    puts((const char *)[v10 UTF8String]);
  }
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(v22, 8);
}

void sub_10002C830(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_10002C858(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10002C8F4(id a1, NSArray *a2)
{
  id v2 = a2;
  sub_10001A9E0((id)[(NSArray *)v2 count] == (id)2, @"celebrationExtractionsByStartDate startDate endDate");
  id v3 = objc_opt_new();
  [v3 setDateFormat:@"yyyy-MM-dd"];
  int v4 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  id v5 = [v3 dateFromString:v4];

  id v6 = [(NSArray *)v2 objectAtIndexedSubscript:1];
  uint64_t v7 = [v3 dateFromString:v6];

  if (v5 && v7)
  {
    id v8 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v5 endDate:v7];
    uint64_t v25 = 0;
    uint64_t v26 = &v25;
    uint64_t v27 = 0x3032000000;
    uint64_t v28 = sub_100006C74;
    id v29 = sub_100006C84;
    id v30 = 0;
    uint64_t v19 = 0;
    long long v20 = &v19;
    uint64_t v21 = 0x3032000000;
    long long v22 = sub_100006C74;
    id v23 = sub_100006C84;
    id v24 = 0;
    uint64_t v9 = +[SGSuggestionsService serviceForContacts];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10002CBF4;
    v15[3] = &unk_100058DB0;
    id v17 = &v19;
    uint64_t v18 = &v25;
    id v10 = dispatch_semaphore_create(0);
    uint64_t v16 = v10;
    [v9 celebrationExtractionsForInterval:v8 withCompletion:v15];
    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    sub_10002CC90((void *)v20[5], (void *)v26[5]);

    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(&v25, 8);
  }
  else
  {
    id v11 = objc_alloc((Class)NSString);
    id v8 = [v3 dateFormat];
    id v12 = [(NSArray *)v2 objectAtIndexedSubscript:0];
    uint64_t v13 = [(NSArray *)v2 objectAtIndexedSubscript:1];
    id v14 = [v11 initWithFormat:@"Error: failed to parse start (or end) date (expected format %@): %@ %@", v8, v12, v13];
    puts((const char *)[v14 UTF8String]);
  }
}

void sub_10002CBCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10002CBF4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10002CC90(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Found %tu extraction objects\n", objc_msgSend(v3, "count"));
  puts((const char *)[v5 UTF8String]);

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [objc_alloc((Class)NSString) initWithFormat:@"%@", *(void *)(*((void *)&v13 + 1) + 8 * (void)v10)];
        puts((const char *)[v11 UTF8String]);

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  if (v4)
  {
    id v12 = [objc_alloc((Class)NSString) initWithFormat:@"Error: %@", v4];
    puts((const char *)[v12 UTF8String]);
  }
}

void sub_10002CE40(id a1, NSArray *a2)
{
  id v2 = a2;
  sub_10001A9E0((id)[(NSArray *)v2 count] == (id)2, @"birthdayExtractionsByStartDate startDate endDate");
  id v3 = objc_opt_new();
  [v3 setDateFormat:@"yyyy-MM-dd"];
  id v4 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  id v5 = [v3 dateFromString:v4];

  id v6 = [(NSArray *)v2 objectAtIndexedSubscript:1];
  id v7 = [v3 dateFromString:v6];

  if (v5 && v7)
  {
    id v8 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v5 endDate:v7];
    uint64_t v25 = 0;
    uint64_t v26 = &v25;
    uint64_t v27 = 0x3032000000;
    uint64_t v28 = sub_100006C74;
    id v29 = sub_100006C84;
    id v30 = 0;
    uint64_t v19 = 0;
    long long v20 = &v19;
    uint64_t v21 = 0x3032000000;
    long long v22 = sub_100006C74;
    id v23 = sub_100006C84;
    id v24 = 0;
    uint64_t v9 = +[SGSuggestionsService serviceForContacts];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10002D140;
    v15[3] = &unk_100058DB0;
    uint64_t v17 = &v19;
    uint64_t v18 = &v25;
    id v10 = dispatch_semaphore_create(0);
    long long v16 = v10;
    [v9 birthdayExtractionsForInterval:v8 withCompletion:v15];
    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    sub_10002CC90((void *)v20[5], (void *)v26[5]);

    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(&v25, 8);
  }
  else
  {
    id v11 = objc_alloc((Class)NSString);
    id v8 = [v3 dateFormat];
    id v12 = [(NSArray *)v2 objectAtIndexedSubscript:0];
    long long v13 = [(NSArray *)v2 objectAtIndexedSubscript:1];
    id v14 = [v11 initWithFormat:@"Error: failed to parse start (or end) date (expected format %@): %@ %@", v8, v12, v13];
    puts((const char *)[v14 UTF8String]);
  }
}

void sub_10002D118(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10002D140(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10002D1DC(id a1, NSArray *a2)
{
  id v2 = a2;
  sub_10001A9E0([(NSArray *)v2 count] > 1, @"contactMatchesBySocialProfile BUNDLE_IDENTIFIER USER_NAME [USER_IDENTIFIER DISPLAY_NAME SERVICE TEAM_IDENTIFIER]");
  id v14 = objc_alloc((Class)SGSocialProfile);
  uint64_t v18 = [(NSArray *)v2 objectAtIndexedSubscript:1];
  NSUInteger v16 = [(NSArray *)v2 count];
  if (v16 < 3)
  {
    uint64_t v17 = &stru_10005B0F8;
  }
  else
  {
    uint64_t v17 = [(NSArray *)v2 objectAtIndexedSubscript:2];
  }
  id v3 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  NSUInteger v4 = [(NSArray *)v2 count];
  if (v4 < 4)
  {
    id v5 = &stru_10005B0F8;
  }
  else
  {
    id v5 = [(NSArray *)v2 objectAtIndexedSubscript:3];
  }
  NSUInteger v6 = [(NSArray *)v2 count];
  if (v6 < 5)
  {
    uint64_t v7 = &stru_10005B0F8;
  }
  else
  {
    uint64_t v7 = [(NSArray *)v2 objectAtIndexedSubscript:4];
  }
  NSUInteger v8 = [(NSArray *)v2 count];
  if (v8 < 6)
  {
    uint64_t v9 = &stru_10005B0F8;
  }
  else
  {
    uint64_t v9 = [(NSArray *)v2 objectAtIndexedSubscript:4];
  }
  id v10 = +[SGExtractionInfo extractionInfoWithExtractionType:0 modelVersion:0 confidence:0];
  id v11 = +[SGRecordId recordIdWithNumericValue:-1];
  id v15 = [v14 initWithUsername:v18 userIdentifier:v17 bundleIdentifier:v3 displayName:v5 service:v7 teamIdentifier:v9 label:0 extractionInfo:v10 recordId:v11];

  if (v8 >= 6) {
  if (v6 >= 5)
  }

  if (v4 >= 4) {
  if (v16 >= 3)
  }

  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = sub_100006C74;
  id v33 = sub_100006C84;
  id v34 = 0;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = sub_100006C74;
  uint64_t v27 = sub_100006C84;
  id v28 = 0;
  id v12 = +[SGSuggestionsService serviceForContacts];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10002D574;
  v19[3] = &unk_100058DB0;
  uint64_t v21 = &v23;
  long long v22 = &v29;
  long long v13 = dispatch_semaphore_create(0);
  long long v20 = v13;
  [v12 contactMatchesBySocialProfile:v15 withCompletion:v19];
  dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  sub_10002AB40((void *)v24[5], (void *)v30[5]);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);
}

void sub_10002D54C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v16 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_10002D574(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  NSUInteger v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10002D610(id a1, NSArray *a2)
{
  id v2 = a2;
  sub_10001A9E0((id)[(NSArray *)v2 count] == (id)1, @"contactMatchesByEmailAddress EMAIL");
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  long long v20 = sub_100006C74;
  uint64_t v21 = sub_100006C84;
  id v22 = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = sub_100006C74;
  id v15 = sub_100006C84;
  id v16 = 0;
  id v3 = +[SGSuggestionsService serviceForContacts];
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  id v5 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002D7F4;
  v7[3] = &unk_100058DB0;
  uint64_t v9 = &v11;
  id v10 = &v17;
  id v6 = v4;
  NSUInteger v8 = v6;
  [v3 contactMatchesByEmailAddress:v5 withCompletion:v7];

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  sub_10002AB40((void *)v12[5], (void *)v18[5]);

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
}

void sub_10002D7CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10002D7F4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  NSUInteger v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10002D890(id a1, NSArray *a2)
{
  id v2 = a2;
  sub_10001A9E0((id)[(NSArray *)v2 count] == (id)1, @"contactMatchesByPhoneNumber NUMBER");
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  long long v20 = sub_100006C74;
  uint64_t v21 = sub_100006C84;
  id v22 = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = sub_100006C74;
  id v15 = sub_100006C84;
  id v16 = 0;
  id v3 = +[SGSuggestionsService serviceForContacts];
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  id v5 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002DA74;
  v7[3] = &unk_100058DB0;
  uint64_t v9 = &v11;
  id v10 = &v17;
  id v6 = v4;
  NSUInteger v8 = v6;
  [v3 contactMatchesByPhoneNumber:v5 withCompletion:v7];

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  sub_10002AB40((void *)v12[5], (void *)v18[5]);

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
}

void sub_10002DA4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10002DA74(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  NSUInteger v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10002DB10(id a1, NSArray *a2)
{
  id v2 = a2;
  sub_10001A9E0((id)[(NSArray *)v2 count] == (id)1, @"contactMatchesWithFullTextSearch TEXT");
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  long long v20 = sub_100006C74;
  uint64_t v21 = sub_100006C84;
  id v22 = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = sub_100006C74;
  id v15 = sub_100006C84;
  id v16 = 0;
  id v3 = +[SGSuggestionsService serviceForContacts];
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  id v5 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002DCF8;
  v7[3] = &unk_100058DB0;
  uint64_t v9 = &v11;
  id v10 = &v17;
  id v6 = v4;
  NSUInteger v8 = v6;
  [v3 suggestContactMatchesWithFullTextSearch:v5 limitTo:-1 withCompletion:v7];

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  sub_10002AB40((void *)v12[5], (void *)v18[5]);

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
}

void sub_10002DCD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10002DCF8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  NSUInteger v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10002DD94(id a1, NSArray *a2)
{
  id v2 = a2;
  sub_10001A9E0((id)[(NSArray *)v2 count] == (id)1, @"contactMatchesWithMessagingPrefix PREFIX");
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  long long v20 = sub_100006C74;
  uint64_t v21 = sub_100006C84;
  id v22 = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = sub_100006C74;
  id v15 = sub_100006C84;
  id v16 = 0;
  id v3 = +[SGSuggestionsService serviceForContacts];
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  id v5 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002DF7C;
  v7[3] = &unk_100058DB0;
  uint64_t v9 = &v11;
  id v10 = &v17;
  id v6 = v4;
  NSUInteger v8 = v6;
  [v3 suggestContactMatchesWithMessagingPrefix:v5 limitTo:-1 withCompletion:v7];

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  sub_10002AB40((void *)v12[5], (void *)v18[5]);

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
}

void sub_10002DF54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10002DF7C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  NSUInteger v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10002E018(id a1, NSArray *a2)
{
  id v2 = a2;
  id v3 = [(NSArray *)v2 count];
  if (v3 != (id)1) {
    LOBYTE(v3) = (id)[(NSArray *)v2 count] == (id)2;
  }
  sub_10001A9E0((char)v3, @"namesForDetailWithAdditionalInfo TEXT [IGNORE_SIGNFICANCE]");
  if ((id)[(NSArray *)v2 count] == (id)2)
  {
    dispatch_semaphore_t v4 = [(NSArray *)v2 objectAtIndexedSubscript:1];
    uint64_t v5 = [v4 BOOLValue] ^ 1;
  }
  else
  {
    uint64_t v5 = 1;
  }
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = sub_100006C74;
  v33[4] = sub_100006C84;
  id v34 = 0;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = sub_100006C74;
  uint64_t v31 = sub_100006C84;
  id v32 = 0;
  uint64_t v18 = +[SGSuggestionsService serviceForContacts];
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  id v16 = v2;
  uint64_t v7 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10002E394;
  v23[3] = &unk_100058DB0;
  uint64_t v25 = &v27;
  uint64_t v26 = v33;
  dispatch_semaphore_t dsema = v6;
  dispatch_semaphore_t v24 = dsema;
  [v18 namesForDetail:v7 limitTo:100 prependMaybe:0 onlySignificant:v5 supportsInfoLookup:1 withCompletion:v23];

  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = (id)v28[5];
  id v9 = [v8 countByEnumeratingWithState:&v19 objects:v35 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v20;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v11);
        id v13 = objc_alloc((Class)NSString);
        id v14 = sub_100006034(@"Lookup Information");
        id v15 = [v13 initWithFormat:@"%@: %@", v14, v12];
        puts((const char *)[v15 UTF8String]);

        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v8 countByEnumeratingWithState:&v19 objects:v35 count:16];
    }
    while (v9);
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(v33, 8);
}

void sub_10002E358(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

void sub_10002E394(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10002E430(id a1, NSArray *a2)
{
  id v2 = a2;
  id v3 = [(NSArray *)v2 count];
  if (v3 != (id)1) {
    LOBYTE(v3) = (id)[(NSArray *)v2 count] == (id)2;
  }
  sub_10001A9E0((char)v3, @"interactionStoreLookupForDetail TEXT");
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = sub_100006C74;
  void v21[4] = sub_100006C84;
  id v22 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = sub_100006C74;
  long long v19 = sub_100006C84;
  id v20 = 0;
  dispatch_semaphore_t v4 = +[SGSuggestionsService serviceForContacts];
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002E670;
  v11[3] = &unk_1000595B8;
  id v13 = &v15;
  id v14 = v21;
  uint64_t v7 = v5;
  id v12 = v7;
  [v4 interactionStoreLookupForDetail:v6 withCompletion:v11];

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  id v8 = objc_alloc((Class)NSString);
  uint64_t v9 = sub_100006034(@"Lookup Information");
  id v10 = [v8 initWithFormat:@"%@: %@", v9, v16[5]];
  puts((const char *)[v10 UTF8String]);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(v21, 8);
}

void sub_10002E648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_10002E670(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10002E70C(id a1, NSArray *a2)
{
  id v2 = a2;
  NSUInteger v3 = [(NSArray *)v2 count];
  if (v3) {
    LOBYTE(v3) = [(NSArray *)v2 count] < 4;
  }
  sub_10001A9E0(v3, @"namesForDetail TEXT [IGNORE_SIGNFICANCE] [SUPPORTS_INFO_LOOKUP]");
  long long v19 = v2;
  if ([(NSArray *)v2 count] < 2)
  {
    uint64_t v5 = 1;
  }
  else
  {
    dispatch_semaphore_t v4 = [(NSArray *)v2 objectAtIndexedSubscript:1];
    uint64_t v5 = [v4 BOOLValue] ^ 1;
  }
  if ((id)[(NSArray *)v2 count] == (id)3)
  {
    id v6 = [(NSArray *)v2 objectAtIndexedSubscript:2];
    id v7 = [v6 BOOLValue];
  }
  else
  {
    id v7 = 0;
  }
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = sub_100006C74;
  v35[4] = sub_100006C84;
  id v36 = 0;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = sub_100006C74;
  id v33 = sub_100006C84;
  id v34 = 0;
  id v20 = +[SGSuggestionsService serviceForContacts];
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  uint64_t v9 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  void v25[2] = sub_10002EABC;
  v25[3] = &unk_100058DB0;
  uint64_t v27 = &v29;
  id v28 = v35;
  dispatch_semaphore_t dsema = v8;
  dispatch_semaphore_t v26 = dsema;
  [v20 namesForDetail:v9 limitTo:100 prependMaybe:0 onlySignificant:v5 supportsInfoLookup:v7 withCompletion:v25];

  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = (id)v30[5];
  id v11 = [v10 countByEnumeratingWithState:&v21 objects:v37 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v22;
    do
    {
      for (int i = 0; i != v11; int i = (char *)i + 1)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        id v15 = objc_alloc((Class)NSString);
        id v16 = sub_100006034(@"Name");
        id v17 = [v15 initWithFormat:@"%@: %@", v16, v14];
        puts((const char *)[v17 UTF8String]);
      }
      id v11 = [v10 countByEnumeratingWithState:&v21 objects:v37 count:16];
    }
    while (v11);
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(v35, 8);
}

void sub_10002EA80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

void sub_10002EABC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_semaphore_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10002EB58(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_semaphore_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10002EBF4(id a1, NSArray *a2)
{
  id v2 = a2;
  id v4 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  NSUInteger v3 = [(NSArray *)v2 objectAtIndexedSubscript:1];

  SGTBatchParseNames();
}

void sub_10002EC6C(id a1, NSArray *a2)
{
  id v2 = a2;
  id v3 = [objc_alloc((Class)NSString) initWithFormat:@"Sending RTC logs"];
  puts((const char *)[v3 UTF8String]);

  id v4 = +[SGSuggestionsService serviceForInternal];
  id v9 = 0;
  [v4 sendRTCLogs:&v9];
  id v5 = v9;
  id v6 = objc_alloc((Class)NSString);
  if (v5)
  {
    id v8 = [v6 initWithFormat:@"Error: %@", v5];
    puts((const char *)[v8 UTF8String]);

    exit(2);
  }
  id v7 = [v6 initWithFormat:@"Logs sent!"];
  puts((const char *)[v7 UTF8String]);
}

void sub_10002ED58(id a1, NSArray *a2)
{
  +[SGSuggestionsService prepareForQuery];
  id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Preparing asynchronously at low QOS."];
  puts((const char *)[v2 UTF8String]);
}

void sub_10002EDBC(id a1, NSArray *a2)
{
  id v2 = a2;
  id v3 = +[SGSuggestionsService serviceForMail];
  id v8 = 0;
  [v3 prepareForRealtimeExtraction:&v8];
  id v4 = v8;
  id v5 = objc_alloc((Class)NSString);
  if (v4)
  {
    id v7 = [v5 initWithFormat:@"Error: %@", v4];
    puts((const char *)[v7 UTF8String]);

    exit(2);
  }
  id v6 = [v5 initWithFormat:@"Prepped!"];
  puts((const char *)[v6 UTF8String]);
}

void sub_10002EE80(id a1, NSArray *a2)
{
  id v2 = a2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1000594A8);
  dispatch_main();
}

void sub_10002EEA8(id a1)
{
  uint64_t v1 = objc_opt_new();
  id v2 = objc_opt_new();
  [v2 setLaunchPath:@"/usr/local/bin/aggregatectl"];
  [v2 setArguments:&off_100064860];
  id v3 = objc_opt_new();
  [v2 setStandardOutput:v3];
  [v2 launch];
  id v4 = [v3 fileHandleForReading];
  id v5 = [v4 readDataToEndOfFile];

  id v6 = objc_alloc((Class)NSString);
  id v7 = v5;
  id v8 = objc_msgSend(v6, "initWithBytes:length:encoding:", objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"), 4);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  void v25[2] = sub_10002F12C;
  v25[3] = &unk_1000594D0;
  id v9 = v1;
  void v25[4] = v9;
  [v8 enumerateLinesUsingBlock:v25];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * (void)v14);
        id v16 = objc_opt_new();
        objc_msgSend(v16, "setLaunchPath:", @"/usr/local/bin/aggregatectl", (void)v21);
        v26[0] = @"--clearDistribution";
        v26[1] = v15;
        id v17 = +[NSArray arrayWithObjects:v26 count:2];
        [v16 setArguments:v17];

        uint64_t v18 = objc_opt_new();
        [v16 setStandardOutput:v18];
        [v16 launch];
        long long v19 = [v18 fileHandleForReading];
        id v20 = [v19 readDataToEndOfFile];

        uint64_t v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v12);
  }

  exit(0);
}

void sub_10002F12C(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = [v11 rangeOfString:@"com.apple.suggestions.timing" options:2];
  if (v3 != (unsigned char *)0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = v3;
    id v5 = (char *)((unsigned char *)[v11 length] - v3);
    id v6 = +[NSCharacterSet whitespaceCharacterSet];
    id v7 = (char *)objc_msgSend(v11, "rangeOfCharacterFromSet:options:range:", v6, 0, v4, v5);

    if (v7 == (char *)0x7FFFFFFFFFFFFFFFLL) {
      id v8 = v5;
    }
    else {
      id v8 = (char *)(v7 - v4);
    }
    id v9 = *(void **)(a1 + 32);
    id v10 = objc_msgSend(v11, "substringWithRange:", v4, v8);
    [v9 addObject:v10];
  }
}

void sub_10002F214(id a1, NSArray *a2)
{
  pid_t v2 = 0;
  *(_OWORD *)__argv = *(_OWORD *)off_100059448;
  long long v4 = *(_OWORD *)&off_100059458;
  posix_spawn(&v2, "/usr/local/bin/aggregatectl", 0, 0, __argv, 0);
}

void sub_10002F290(id a1, NSArray *a2)
{
  id v5 = +[SGSuggestionsService serviceForInternal];
  id v2 = objc_alloc((Class)NSString);
  if ([v5 isEnabledWithError:0]) {
    CFStringRef v3 = @"Suggestions is enabled";
  }
  else {
    CFStringRef v3 = @"Suggestions is NOT enabled";
  }
  id v4 = [v2 initWithFormat:v3];
  puts((const char *)[v4 UTF8String]);
}

void sub_10002F32C(id a1, NSArray *a2)
{
  id v2 = +[SGPreferenceStorage defaultsForTests];
  CFStringRef v3 = [v2 dictionaryRepresentation];

  id v4 = [objc_alloc((Class)NSString) initWithFormat:@"Before:"];
  puts((const char *)[v4 UTF8String]);

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v32;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v31 + 1) + 8 * (void)v9);
        id v11 = objc_alloc((Class)NSString);
        id v12 = [v5 objectForKeyedSubscript:v10];
        id v13 = [v11 initWithFormat:@"key: %@ value: %@", v10, v12];
        puts((const char *)[v13 UTF8String]);

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v7);
  }

  +[SGPreferenceStorage removeDeprecatedDefaults];
  uint64_t v14 = +[SGPreferenceStorage defaultsForTests];
  [v14 synchronize];

  uint64_t v15 = +[SGPreferenceStorage defaultsForTests];
  id v16 = [v15 dictionaryRepresentation];

  id v17 = [objc_alloc((Class)NSString) initWithFormat:@"After:"];
  puts((const char *)[v17 UTF8String]);

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v18 = v16;
  id v19 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v28;
    do
    {
      long long v22 = 0;
      do
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v27 + 1) + 8 * (void)v22);
        id v24 = objc_alloc((Class)NSString);
        uint64_t v25 = [v18 objectForKeyedSubscript:v23];
        id v26 = [v24 initWithFormat:@"key: %@ value: %@", v23, v25, (void)v27];
        puts((const char *)[v26 UTF8String]);

        long long v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      id v20 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v20);
  }
}

BOOL sub_10002F604(id a1, NSURL *a2, NSError *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [objc_alloc((Class)NSString) initWithFormat:@"Error: %@: %@", v5, v4];

  id v7 = v6;
  puts((const char *)[v7 UTF8String]);

  return 1;
}

void sub_10002F68C(void *a1)
{
  id v1 = a1;
  id v2 = +[NSFileManager defaultManager];
  CFStringRef v3 = [v1 path];
  id v4 = [v2 attributesOfItemAtPath:v3 error:0];

  id v5 = objc_alloc((Class)NSString);
  id v6 = [v4 objectForKeyedSubscript:NSFileSize];
  id v7 = [v5 initWithFormat:@"Size: %@", v6];
  puts((const char *)[v7 UTF8String]);

  id v8 = objc_alloc((Class)NSString);
  id v9 = [v4 objectForKeyedSubscript:NSFileOwnerAccountID];
  id v10 = [v8 initWithFormat:@"Owner: %@", v9];
  puts((const char *)[v10 UTF8String]);

  id v11 = objc_alloc((Class)NSString);
  id v12 = [v4 objectForKeyedSubscript:NSFileGroupOwnerAccountID];
  id v13 = [v11 initWithFormat:@"Group: %@", v12];
  puts((const char *)[v13 UTF8String]);

  id v49 = [v4 objectForKeyedSubscript:NSFilePosixPermissions];
  id v14 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Permissions: %o", (int)objc_msgSend(v49, "shortValue"));
  puts((const char *)[v14 UTF8String]);

  v60[0] = 0;
  [v1 getResourceValue:v60 forKey:NSURLCreationDateKey error:0];
  id v48 = v60[0];
  id v15 = [objc_alloc((Class)NSString) initWithFormat:@"Created: %@", v48];
  puts((const char *)[v15 UTF8String]);

  id v59 = 0;
  [v1 getResourceValue:&v59 forKey:NSURLAddedToDirectoryDateKey error:0];
  id v47 = v59;
  id v16 = [objc_alloc((Class)NSString) initWithFormat:@"Added: %@", v47];
  puts((const char *)[v16 UTF8String]);

  id v58 = 0;
  [v1 getResourceValue:&v58 forKey:NSURLAttributeModificationDateKey error:0];
  id v46 = v58;
  id v17 = [objc_alloc((Class)NSString) initWithFormat:@"Attributes Modified: %@", v46];
  puts((const char *)[v17 UTF8String]);

  id v57 = 0;
  [v1 getResourceValue:&v57 forKey:NSURLContentModificationDateKey error:0];
  id v45 = v57;
  id v18 = [objc_alloc((Class)NSString) initWithFormat:@"Content Modified: %@", v45];
  puts((const char *)[v18 UTF8String]);

  id v56 = 0;
  [v1 getResourceValue:&v56 forKey:NSURLIsDirectoryKey error:0];
  id v44 = v56;
  id v19 = objc_alloc((Class)NSString);
  if ([v44 BOOLValue]) {
    CFStringRef v20 = @"YES";
  }
  else {
    CFStringRef v20 = @"NO";
  }
  id v21 = [v19 initWithFormat:@"Directory? %@", v20];
  puts((const char *)[v21 UTF8String]);

  id v55 = 0;
  [v1 getResourceValue:&v55 forKey:NSURLIsExecutableKey error:0];
  id v43 = v55;
  id v22 = objc_alloc((Class)NSString);
  if ([v43 BOOLValue]) {
    CFStringRef v23 = @"YES";
  }
  else {
    CFStringRef v23 = @"NO";
  }
  id v24 = [v22 initWithFormat:@"Executable? %@", v23];
  puts((const char *)[v24 UTF8String]);

  id v54 = 0;
  [v1 getResourceValue:&v54 forKey:NSURLIsReadableKey error:0];
  id v25 = v54;
  id v26 = objc_alloc((Class)NSString);
  if ([v25 BOOLValue]) {
    CFStringRef v27 = @"YES";
  }
  else {
    CFStringRef v27 = @"NO";
  }
  id v28 = [v26 initWithFormat:@"Readable? %@", v27];
  puts((const char *)[v28 UTF8String]);

  id v53 = 0;
  [v1 getResourceValue:&v53 forKey:NSURLIsRegularFileKey error:0];
  id v29 = v53;
  id v30 = objc_alloc((Class)NSString);
  if ([v29 BOOLValue]) {
    CFStringRef v31 = @"YES";
  }
  else {
    CFStringRef v31 = @"NO";
  }
  id v32 = [v30 initWithFormat:@"Regular File? %@", v31];
  puts((const char *)[v32 UTF8String]);

  id v52 = 0;
  [v1 getResourceValue:&v52 forKey:NSURLIsSymbolicLinkKey error:0];
  id v33 = v52;
  id v34 = objc_alloc((Class)NSString);
  if ([v33 BOOLValue]) {
    CFStringRef v35 = @"YES";
  }
  else {
    CFStringRef v35 = @"NO";
  }
  id v36 = [v34 initWithFormat:@"Symbolic Link? %@", v35];
  puts((const char *)[v36 UTF8String]);

  id v51 = 0;
  [v1 getResourceValue:&v51 forKey:NSURLIsWritableKey error:0];
  id v37 = v51;
  id v38 = objc_alloc((Class)NSString);
  unsigned int v39 = [v37 BOOLValue];

  if (v39) {
    CFStringRef v40 = @"YES";
  }
  else {
    CFStringRef v40 = @"NO";
  }
  id v41 = [v38 initWithFormat:@"Writable? %@", v40];
  puts((const char *)[v41 UTF8String]);

  id v42 = [objc_alloc((Class)NSString) initWithFormat:&stru_10005B0F8];
  puts((const char *)[v42 UTF8String]);
}

void sub_10002FD60(id a1, PMLSessionDescriptor *a2, NSSet *a3, BOOL *a4)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_alloc((Class)NSString);
  id v8 = [(PMLSessionDescriptor *)v5 name];
  id v9 = [(PMLSessionDescriptor *)v5 version];
  id v10 = [(PMLSessionDescriptor *)v5 locale];
  id v11 = [v7 initWithFormat:@" Stats for model: %@ version: %@ locale: %@", v8, v9, v10];
  puts((const char *)[v11 UTF8String]);

  id v12 = [objc_alloc((Class)NSString) initWithFormat:@" Label Count"];
  puts((const char *)[v12 UTF8String]);

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v13 = v6;
  id v14 = [(NSSet *)v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v24;
    do
    {
      id v17 = 0;
      do
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v17);
        id v19 = objc_alloc((Class)NSString);
        CFStringRef v20 = [v18 first];
        id v21 = [v18 second];
        id v22 = [v19 initWithFormat:@" %@ %@", v20, v21];
        puts((const char *)[v22 UTF8String]);

        id v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [(NSSet *)v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v15);
  }
}

_PASDBIterAction_ sub_10002FF70(id a1, NSError *a2)
{
  id v2 = a2;
  id v3 = [objc_alloc((Class)NSString) initWithFormat:@"Error: %@", v2];

  id v4 = v3;
  puts((const char *)[v4 UTF8String]);

  return (_PASDBIterAction_)SGSqliteDatabaseStop;
}

_PASDBIterAction_ sub_10002FFE8(id a1, sqlite3_stmt *a2)
{
  int v2 = sqlite3_column_count(a2);
  id v3 = objc_opt_new();
  if (v2 >= 1)
  {
    for (int i = 0; i != v2; ++i)
    {
      uint64_t v5 = sqlite3_column_nsstring();
      id v6 = (void *)v5;
      if (v5) {
        CFStringRef v7 = (const __CFString *)v5;
      }
      else {
        CFStringRef v7 = @" ";
      }
      [v3 appendString:v7];
      [v3 appendString:@"  |  "];
    }
  }
  id v8 = [objc_alloc((Class)NSString) initWithFormat:@"%@", v3];
  puts((const char *)[v8 UTF8String]);

  return (_PASDBIterAction_)SGSqliteDatabaseKeepGoing;
}

_PASDBIterAction_ sub_1000300E0(id a1, NSError *a2)
{
  int v2 = a2;
  id v3 = [objc_alloc((Class)NSString) initWithFormat:@"Error: dbSchema: %@", v2];

  id v4 = v3;
  puts((const char *)[v4 UTF8String]);

  return (_PASDBIterAction_)SGSqliteDatabaseStop;
}

_PASDBIterAction_ sub_100030158(id a1, sqlite3_stmt *a2)
{
  int v2 = sqlite3_column_nsstring();
  id v3 = [objc_alloc((Class)NSString) initWithFormat:@"%@", v2];
  puts((const char *)[v3 UTF8String]);

  return (_PASDBIterAction_)SGSqliteDatabaseKeepGoing;
}

void sub_1000301D0(id a1, NSArray *a2)
{
  id v2 = objc_alloc((Class)NSString);
  id v3 = +[SGModelAsset asset];
  id v4 = objc_msgSend(v2, "initWithFormat:", @"Currently installed CoreSuggestionsModelAssets version: %lu", objc_msgSend(v3, "assetVersion"));
  puts((const char *)[v4 UTF8String]);

  id v5 = objc_alloc((Class)NSString);
  id v6 = +[SGModelAsset asset];
  id v7 = objc_msgSend(v5, "initWithFormat:", @"Highest available CoreSuggestionsModelAssets version: %lu", objc_msgSend(v6, "bestAssetVersionObserved"));
  puts((const char *)[v7 UTF8String]);

  id v8 = objc_alloc((Class)NSString);
  id v10 = +[SGModelAsset asset];
  id v9 = objc_msgSend(v8, "initWithFormat:", @"CoreSuggestionsModelAssets compatibility version: %lu", objc_msgSend(v10, "compatibilityVersion"));
  puts((const char *)[v9 UTF8String]);
}

void sub_1000302F8(id a1, NSArray *a2)
{
  id v2 = objc_alloc((Class)NSString);
  id v3 = +[SGAsset asset];
  id v4 = objc_msgSend(v2, "initWithFormat:", @"Assets Compatibility version: %lu", objc_msgSend(v3, "compatibilityVersion"));
  puts((const char *)[v4 UTF8String]);

  id v5 = [objc_alloc((Class)NSString) initWithFormat:@"\n######## COMMON ASSETS ########"];
  puts((const char *)[v5 UTF8String]);

  id v6 = objc_alloc((Class)NSString);
  id v7 = +[SGAsset asset];
  id v8 = objc_msgSend(v6, "initWithFormat:", @"Currently installed asset version: %lu", objc_msgSend(v7, "assetVersion"));
  puts((const char *)[v8 UTF8String]);

  id v9 = objc_alloc((Class)NSString);
  id v10 = +[SGAsset asset];
  id v11 = objc_msgSend(v9, "initWithFormat:", @"Highest available asset version: %lu", objc_msgSend(v10, "bestAssetVersionObserved"));
  puts((const char *)[v11 UTF8String]);

  id v12 = [objc_alloc((Class)NSString) initWithFormat:@"\n######## REMINDERS ASSETS ########"];
  puts((const char *)[v12 UTF8String]);

  id v13 = objc_alloc((Class)NSString);
  id v14 = +[SGAsset localeAssetIdentifier];
  id v15 = [v13 initWithFormat:@"Reminders: Model loaded: %@", v14];
  puts((const char *)[v15 UTF8String]);

  id v16 = objc_alloc((Class)NSString);
  id v17 = +[SGAsset localeAsset];
  id v18 = objc_msgSend(v16, "initWithFormat:", @"Reminders: Currently installed asset version: %lu", objc_msgSend(v17, "assetVersion"));
  puts((const char *)[v18 UTF8String]);

  id v19 = objc_alloc((Class)NSString);
  id v21 = +[SGAsset localeAsset];
  id v20 = objc_msgSend(v19, "initWithFormat:", @"Reminders: Highest available asset version: %lu", objc_msgSend(v21, "bestAssetVersionObserved"));
  puts((const char *)[v20 UTF8String]);
}

void sub_100030550(id a1, NSArray *a2)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  id v3 = +[SGAsset asset];
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  id v13 = sub_10003069C;
  id v14 = &unk_100059288;
  dispatch_semaphore_t v15 = v2;
  id v4 = v2;
  id v5 = [v3 registerUpdateHandler:&v11];

  +[_PASDispatch waitForSemaphore:v4 timeoutSeconds:5.0];
  id v6 = +[SGAsset asset];
  id v7 = [v6 filesystemPathForAssetDataRelativePath:@"ReverseTemplateJS"];

  id v8 = objc_alloc((Class)NSString);
  id v9 = [v7 stringByDeletingLastPathComponent];
  id v10 = [v8 initWithFormat:@"Asset path is: %@", v9, v11, v12, v13, v14];
  puts((const char *)[v10 UTF8String]);
}

intptr_t sub_10003069C(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000306A4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = [objc_alloc((Class)NSString) initWithFormat:@"Error clearing suggest history: %@", v3];
    puts((const char *)[v4 UTF8String]);

    id v5 = sgLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [objc_alloc((Class)NSString) initWithFormat:@"Error clearing suggest history: %@", v3];
      *(_DWORD *)buf = 136315138;
      id v8 = [v6 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s\n", buf, 0xCu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000307C0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = [objc_alloc((Class)NSString) initWithFormat:@"Error removing all stored pseudo contacts: %@", v3];
    puts((const char *)[v4 UTF8String]);

    id v5 = sgLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [objc_alloc((Class)NSString) initWithFormat:@"Error removing all stored pseudo contacts: %@", v3];
      *(_DWORD *)buf = 136315138;
      id v8 = [v6 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s\n", buf, 0xCu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000308DC(id a1, NSArray *a2)
{
  dispatch_semaphore_t v2 = a2;
  id v3 = +[SGSuggestionsService serviceForInternal];
  id v6 = 0;
  [v3 rebuildNamesForDetailCache:&v6];
  id v4 = v6;
  if (v4)
  {
    id v5 = [objc_alloc((Class)NSString) initWithFormat:@"Error: %@", v4];
    puts((const char *)[v5 UTF8String]);

    exit(2);
  }
}

void sub_10003097C(id a1, NSArray *a2)
{
  dispatch_semaphore_t v2 = a2;
  id v3 = +[SGSuggestionsService serviceForInternal];
  id v6 = 0;
  [v3 resetConfirmationAndRejectionHistory:&v6];
  id v4 = v6;
  if (v4)
  {
    id v5 = [objc_alloc((Class)NSString) initWithFormat:@"Error: %@", v4];
    puts((const char *)[v5 UTF8String]);

    exit(2);
  }
}

void sub_100030A1C(uint64_t a1)
{
  long long v23 = +[SGSuggestionsService serviceForMail];
  dispatch_semaphore_t v22 = dispatch_semaphore_create(0);
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x3032000000;
  id v34 = sub_100006C74;
  CFStringRef v35 = sub_100006C84;
  id v36 = 0;
  dispatch_semaphore_t v2 = [*(id *)(a1 + 32) objectAtIndexedSubscript:0];
  id v3 = +[NSData dataWithContentsOfFile:v2];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 40) searchableItemsFromArgs:*(void *)(a1 + 32)];
    id v5 = [v4 firstObject];

    if (!v5)
    {
      id v21 = +[NSAssertionHandler currentHandler];
      [v21 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 40), @"suggest_tool.m", 2677, @"Invalid parameter not satisfying: %@", @"searchableItem" object file lineNumber description];
    }
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100030E2C;
    v28[3] = &unk_100058DD8;
    id v30 = &v31;
    id v6 = v22;
    id v29 = v6;
    [v23 dissectAttachmentsFromSearchableItem:v5 options:3 withCompletion:v28];
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    if (byte_10006A7B8 == 1)
    {
      id v7 = objc_alloc((Class)NSString);
      sub_10001B094((void *)v32[5]);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      id v9 = [v7 initWithFormat:@"%@", v8];
      puts((const char *)[v9 UTF8String]);
    }
    else
    {
      id v12 = objc_alloc((Class)NSString);
      id v13 = objc_msgSend(v12, "initWithFormat:", @"Found %d suggestions", objc_msgSend( (id) v32[5], "count"));
      puts((const char *)[v13 UTF8String]);

      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v8 = (id)v32[5];
      id v14 = [v8 countByEnumeratingWithState:&v24 objects:v37 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v25;
        do
        {
          id v16 = 0;
          do
          {
            if (*(void *)v25 != v15) {
              objc_enumerationMutation(v8);
            }
            id v17 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v16);
            id v18 = objc_alloc((Class)NSString);
            id v19 = [v17 description];
            id v20 = [v18 initWithFormat:@"\n%@\n", v19];
            puts((const char *)[v20 UTF8String]);

            id v16 = (char *)v16 + 1;
          }
          while (v14 != v16);
          id v14 = [v8 countByEnumeratingWithState:&v24 objects:v37 count:16];
        }
        while (v14);
      }
    }

    id v11 = v29;
  }
  else
  {
    id v10 = objc_alloc((Class)NSString);
    id v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:0];
    id v11 = [v10 initWithFormat:@"Error: failed to load file: %@", v5];
    puts((const char *)[v11 UTF8String]);
  }

  _Block_object_dispose(&v31, 8);
}

void sub_100030DFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_100030E2C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (a3)
  {
    id v6 = a3;
    id v7 = [objc_alloc((Class)NSString) initWithFormat:@"Error: dissectAttachmentsFromSearchableItem: %@", v6];

    id v8 = v7;
    puts((const char *)[v8 UTF8String]);
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100030EEC(uint64_t a1)
{
  if (byte_10006A7BA) {
    dispatch_semaphore_t v2 = @"suggest_tool_preprocess";
  }
  else {
    dispatch_semaphore_t v2 = @"suggest_tool";
  }
  long long v82 = v2;
  long long v73 = objc_opt_new();
  uint64_t v80 = a1;
  id v3 = [*(id *)(a1 + 40) filesFromArgs:*(void *)(a1 + 32)];
  long long v81 = +[SGPipeline remindersTestingPipeline];
  long long v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v112 objects:v121 count:16];
  if (v5)
  {
    id v6 = v5;
    id v7 = &CFPreferencesCopyKeyList_ptr;
    id v8 = &CFPreferencesCopyKeyList_ptr;
    uint64_t v75 = *(void *)v113;
    uint64_t v9 = &CFPreferencesCopyKeyList_ptr;
    id v71 = v4;
    while (2)
    {
      uint64_t v10 = 0;
      id v72 = v6;
      do
      {
        if (*(void *)v113 != v75) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void *)(*((void *)&v112 + 1) + 8 * v10);
        long long v84 = objc_opt_new();
        id v12 = v7[245];
        id v111 = 0;
        uint64_t v13 = [v12 dataWithContentsOfFile:v11 options:0 error:&v111];
        id v14 = v111;
        uint64_t v15 = (void *)v13;
        id v16 = v14;
        uint64_t v77 = v10;
        long long v78 = v15;
        if (v15)
        {
          id v17 = v8[255];
          id v110 = v16;
          id v18 = [v17 JSONObjectWithData:v15 options:0 error:&v110];
          id v19 = v110;

          id v16 = v19;
          long long v76 = v18;
          if (v19)
          {
            id v20 = [objc_alloc((Class)NSString) initWithFormat:@"Error decoding JSON content from %@: %@", v18, v19];
            puts((const char *)[v20 UTF8String]);
            int v21 = 1;
          }
          else
          {
            id v74 = [v18 mutableCopy];
            long long v23 = +[SGSqlEntityStore defaultStore];
            long long v106 = 0u;
            long long v107 = 0u;
            long long v108 = 0u;
            long long v109 = 0u;
            id obj = [v18 objectForKeyedSubscript:@"messages"];
            id v85 = [obj countByEnumeratingWithState:&v106 objects:v120 count:16];
            if (v85)
            {
              uint64_t v83 = *(void *)v107;
              do
              {
                uint64_t v24 = 0;
                do
                {
                  if (*(void *)v107 != v83) {
                    objc_enumerationMutation(obj);
                  }
                  uint64_t v88 = v24;
                  long long v25 = *(void **)(*((void *)&v106 + 1) + 8 * v24);
                  id v89 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v25];
                  id v87 = [*(id *)(v80 + 40) searchableItemFromDictionary:v25];
                  id v26 = [objc_alloc((Class)SGTextMessage) initWithSearchableItem:v87];
                  [v26 setSource:v82];
                  long long v86 = v26;
                  id v27 = [objc_alloc((Class)SGPipelineEntity) initWithMessage:v26];
                  id v28 = [v25 objectForKeyedSubscript:@"humanAnnotation"];

                  if (v28)
                  {
                    id v29 = objc_opt_new();
                    long long v102 = 0u;
                    long long v103 = 0u;
                    long long v104 = 0u;
                    long long v105 = 0u;
                    id v30 = [v25 objectForKeyedSubscript:@"humanAnnotation"];
                    id v31 = [v30 countByEnumeratingWithState:&v102 objects:v119 count:16];
                    if (v31)
                    {
                      id v32 = v31;
                      uint64_t v33 = *(void *)v103;
                      do
                      {
                        for (int i = 0; i != v32; int i = (char *)i + 1)
                        {
                          if (*(void *)v103 != v33) {
                            objc_enumerationMutation(v30);
                          }
                          id v35 = [objc_alloc((Class)v9[342]) initWithDict:*(void *)(*((void *)&v102 + 1) + 8 * i)];
                          [v29 addObject:v35];
                        }
                        id v32 = [v30 countByEnumeratingWithState:&v102 objects:v119 count:16];
                      }
                      while (v32);
                    }

                    [v27 addTaggedCharacterRanges:v29];
                  }
                  [v81 dissect:v27];
                  id v36 = objc_opt_new();
                  long long v98 = 0u;
                  long long v99 = 0u;
                  long long v100 = 0u;
                  long long v101 = 0u;
                  id v37 = [v27 enrichments];
                  id v38 = [v37 countByEnumeratingWithState:&v98 objects:v118 count:16];
                  if (v38)
                  {
                    id v39 = v38;
                    uint64_t v40 = *(void *)v99;
                    do
                    {
                      for (uint64_t j = 0; j != v39; uint64_t j = (char *)j + 1)
                      {
                        if (*(void *)v99 != v40) {
                          objc_enumerationMutation(v37);
                        }
                        id v42 = *(void **)(*((void *)&v98 + 1) + 8 * (void)j);
                        id v43 = [v42 duplicateKey];
                        id v44 = [v43 entityType];

                        if (v44 == (id)22)
                        {
                          id v45 = +[SGRecordId recordIdWithNumericValue:-1];
                          [v27 setRecordId:v45];
                          [v42 setRecordId:v45];

                          id v46 = [v42 duplicateKey];
                          id v47 = +[SGOrigin originForDuplicateKey:v46 entity:v42 parent:v27 store:v23];

                          if (v47)
                          {
                            id v48 = +[SGStorageReminder storageReminderFromEntity:v42 origin:v47];
                            id v49 = [v48 dictionaryRepresentation];
                            [v36 addObject:v49];
                          }
                        }
                      }
                      id v39 = [v37 countByEnumeratingWithState:&v98 objects:v118 count:16];
                    }
                    while (v39);
                  }

                  [v89 setObject:v36 forKeyedSubscript:@"outputs"];
                  id v50 = objc_opt_new();
                  long long v94 = 0u;
                  long long v95 = 0u;
                  long long v96 = 0u;
                  long long v97 = 0u;
                  id v51 = [v27 taggedCharacterRanges];
                  id v52 = [v51 countByEnumeratingWithState:&v94 objects:v117 count:16];
                  if (v52)
                  {
                    id v53 = v52;
                    uint64_t v54 = *(void *)v95;
                    do
                    {
                      for (unint64_t k = 0; k != v53; unint64_t k = (char *)k + 1)
                      {
                        if (*(void *)v95 != v54) {
                          objc_enumerationMutation(v51);
                        }
                        id v56 = *(void **)(*((void *)&v94 + 1) + 8 * (void)k);
                        if ([v56 annotationType] == (id)4
                          || [v56 annotationType] == (id)1
                          || [v56 annotationType] == (id)10)
                        {
                          id v57 = [v56 dictRepresentation];
                          [v50 addObject:v57];
                        }
                      }
                      id v53 = [v51 countByEnumeratingWithState:&v94 objects:v117 count:16];
                    }
                    while (v53);
                  }

                  [v89 setObject:v50 forKeyedSubscript:@"taggedCharacterRanges"];
                  long long v92 = 0u;
                  long long v93 = 0u;
                  long long v90 = 0u;
                  long long v91 = 0u;
                  id v58 = [v27 tags];
                  id v59 = [v58 countByEnumeratingWithState:&v90 objects:v116 count:16];
                  if (v59)
                  {
                    id v60 = v59;
                    uint64_t v61 = *(void *)v91;
                    do
                    {
                      for (m = 0; m != v60; m = (char *)m + 1)
                      {
                        if (*(void *)v91 != v61) {
                          objc_enumerationMutation(v58);
                        }
                        long long v63 = *(void **)(*((void *)&v90 + 1) + 8 * (void)m);
                        if ([v63 isReminderMetadata])
                        {
                          id v64 = [v63 reminderMetadata];
                          if (v64) {
                            [v89 setObject:v64 forKeyedSubscript:@"reminderMetadata"];
                          }
                        }
                      }
                      id v60 = [v58 countByEnumeratingWithState:&v90 objects:v116 count:16];
                    }
                    while (v60);
                  }

                  [v84 addObject:v89];
                  uint64_t v24 = v88 + 1;
                  uint64_t v9 = &CFPreferencesCopyKeyList_ptr;
                }
                while ((id)(v88 + 1) != v85);
                id v85 = [obj countByEnumeratingWithState:&v106 objects:v120 count:16];
              }
              while (v85);
            }

            id v20 = v74;
            [v74 setObject:v84 forKeyedSubscript:@"messages"];
            [v73 addObject:v74];

            int v21 = 0;
            id v4 = v71;
            id v6 = v72;
            id v7 = &CFPreferencesCopyKeyList_ptr;
            id v8 = &CFPreferencesCopyKeyList_ptr;
            id v16 = 0;
          }

          id v22 = v76;
        }
        else
        {
          id v22 = [objc_alloc((Class)NSString) initWithFormat:@"Error reading JSON file: %@", v14];
          puts((const char *)[v22 UTF8String]);
          int v21 = 1;
        }

        if (v21)
        {
          long long v68 = v4;
          long long v65 = v73;
          goto LABEL_72;
        }
        uint64_t v10 = v77 + 1;
      }
      while ((id)(v77 + 1) != v6);
      id v6 = [v4 countByEnumeratingWithState:&v112 objects:v121 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  long long v65 = v73;
  id v66 = [v73 count];
  id v67 = objc_alloc((Class)NSString);
  if (v66 == (id)1)
  {
    long long v68 = [v73 objectAtIndexedSubscript:0];
    sub_10001B094(v68);
    id v69 = (id)objc_claimAutoreleasedReturnValue();
    id v70 = [v67 initWithFormat:@"%@", v69];
    puts((const char *)[v70 UTF8String]);
  }
  else
  {
    long long v68 = sub_10001B094(v73);
    id v69 = [v67 initWithFormat:@"%@", v68];
    puts((const char *)[v69 UTF8String]);
  }

LABEL_72:
}

void sub_100031830(uint64_t a1)
{
  id v31 = +[SGSuggestionsService serviceForInternal];
  id v30 = objc_opt_new();
  dispatch_semaphore_t v2 = [SGZipFileReader alloc];
  id v3 = [*(id *)(a1 + 32) objectAtIndexedSubscript:0];
  id v4 = [(SGZipFileReader *)v2 initWithPath:v3];

  uint64_t v32 = a1;
  id v27 = [*(id *)(a1 + 32) objectAtIndexedSubscript:1];
  id v29 = objc_opt_new();
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v4;
  id v5 = [(SGZipFileReader *)obj countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v40;
    CFStringRef v8 = @"eml";
    uint64_t v28 = *(void *)v40;
    do
    {
      for (int i = 0; i != v6; int i = (char *)i + 1)
      {
        if (*(void *)v40 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        id v12 = [v10 pathExtension];
        unsigned int v13 = [v12 isEqualToString:v8];

        if (v13)
        {
          id v34 = [(SGZipFileReader *)obj readFile:v10];
          id v14 = (*(void (**)(void))(*(void *)(v32 + 40) + 16))();
          uint64_t v15 = [v14 first];
          if (v15)
          {
            id v16 = [v30 jsonLdOutputFromMailMessage:v15];
            +[NSMutableDictionary dictionaryWithDictionary:v16];
            uint64_t v33 = v11;
            CFStringRef v17 = v8;
            v19 = id v18 = v6;

            dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
            int v21 = [v14 second];
            v36[0] = _NSConcreteStackBlock;
            v36[1] = 3221225472;
            void v36[2] = sub_100031BFC;
            v36[3] = &unk_100059188;
            id v37 = v19;
            dispatch_semaphore_t v38 = v20;
            id v22 = v20;
            id v23 = v19;
            id v6 = v18;
            CFStringRef v8 = v17;
            uint64_t v11 = v33;
            id v24 = v23;
            [v31 suggestionsFromSimpleMailMessage:v15 headers:v21 options:2 withCompletion:v36];

            dispatch_semaphore_wait(v22, 0xFFFFFFFFFFFFFFFFLL);
            long long v25 = sub_10001B094(v24);
            [v29 setObject:v25 forKeyedSubscript:v10];

            uint64_t v7 = v28;
          }
          else
          {
            id v26 = objc_alloc((Class)NSString);
            id v24 = [v14 first];
            id v22 = [v26 initWithFormat:@"ERROR: failed to retrieve Message: %@", v24];
            puts((const char *)[v22 UTF8String]);
          }
        }
      }
      id v6 = [(SGZipFileReader *)obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v6);
  }

  [v29 writeToFile:v27 atomically:1];
}

void sub_100031BFC(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3) {
    [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:@"errors"];
  }
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:@"events"];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100031C78(id a1, NSArray *a2)
{
  dispatch_semaphore_t v2 = a2;
  sub_10001A9E0((id)[(NSArray *)v2 count] == (id)2, @"isInhuman emailbody|emailaddress|name string");
  id v10 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  id v3 = [(NSArray *)v2 objectAtIndexedSubscript:1];

  if ([v10 isEqualToString:@"emailbody"])
  {
    unsigned int v4 = +[SGInhumans isInhumanBody:v3];
    id v5 = objc_alloc((Class)NSString);
    if (v4) {
      CFStringRef v6 = @"Mail body is tagged inhuman";
    }
    else {
      CFStringRef v6 = @"Mail body is not tagged inhuman";
    }
  }
  else if ([v10 isEqualToString:@"emailaddress"])
  {
    unsigned int v7 = +[SGInhumans isInhumanEmailAddress:v3];
    id v5 = objc_alloc((Class)NSString);
    if (v7) {
      CFStringRef v6 = @"Mail Address is tagged inhuman";
    }
    else {
      CFStringRef v6 = @"Mail Address is not tagged inhuman";
    }
  }
  else if ([v10 isEqualToString:@"name"])
  {
    unsigned int v8 = +[SGInhumans isInhumanName:v3];
    id v5 = objc_alloc((Class)NSString);
    if (v8) {
      CFStringRef v6 = @"name is tagged inhuman";
    }
    else {
      CFStringRef v6 = @"name is not tagged inhuman";
    }
  }
  else
  {
    id v5 = objc_alloc((Class)NSString);
    CFStringRef v6 = @"first argument needs to be one of emailbody|emailaddress|name";
  }
  id v9 = [v5 initWithFormat:v6];
  puts((const char *)[v9 UTF8String]);
}

void sub_100031E1C(uint64_t a1)
{
  dispatch_semaphore_t v2 = [*(id *)(a1 + 32) objectAtIndexedSubscript:0];
  id v3 = +[NSData dataWithContentsOfFile:v2];

  if (v3)
  {
    unsigned int v4 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v5 = [v4 first];

    id v6 = [objc_alloc((Class)NSString) initWithFormat:@"Harvesting email message..."];
    puts((const char *)[v6 UTF8String]);

    unsigned int v7 = *(void **)(a1 + 48);
    unsigned int v8 = [v5 createNewSearchableItem];
    unsigned int v13 = v8;
    id v9 = +[NSArray arrayWithObjects:&v13 count:1];
    [v7 addSearchableItems:v9];
  }
  else
  {
    id v10 = objc_alloc((Class)NSString);
    uint64_t v11 = [*(id *)(a1 + 32) objectAtIndexedSubscript:0];
    id v12 = [v10 initWithFormat:@"ERROR: failed to read contentsOfFile:%@", v11];
    puts((const char *)[v12 UTF8String]);
  }
}

void sub_100031FB4(void *a1)
{
  id v1 = a1;
  unsigned int v42 = +[SGPreferenceStorage showPastEvents];
  unsigned int v41 = +[SGPreferenceStorage alwaysShowCancelledEvents];
  unsigned int v40 = +[SGPreferenceStorage detectReminders];
  +[SGPreferenceStorage setShowPastEvents:1];
  +[SGPreferenceStorage setAlwaysShowCancelledEvents:1];
  +[SGPreferenceStorage setDetectReminders:1];
  id v2 = objc_alloc((Class)NSString);
  id v43 = v1;
  id v3 = [v1 attributeSet];
  unsigned int v4 = [v3 authors];
  id v5 = [v4 objectAtIndexedSubscript:0];
  id v6 = [v5 handles];
  unsigned int v7 = [v6 objectAtIndexedSubscript:0];
  unsigned int v8 = [v1 attributeSet];
  id v9 = [v8 textContent];
  id v10 = [v2 initWithFormat:@"Initializing service with sender = %@, content = %@...", v7, v9];
  puts((const char *)[v10 UTF8String]);

  uint64_t v11 = +[SGSuggestionsService serviceForMessages];
  id v12 = [objc_alloc((Class)NSString) initWithFormat:@"Initialized: %@", v11];
  puts((const char *)[v12 UTF8String]);

  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  uint64_t v62 = 0;
  long long v63 = &v62;
  uint64_t v64 = 0x3032000000;
  long long v65 = sub_100006C74;
  id v66 = sub_100006C84;
  id v67 = 0;
  uint64_t v56 = 0;
  id v57 = &v56;
  uint64_t v58 = 0x3032000000;
  id v59 = sub_100006C74;
  id v60 = sub_100006C84;
  id v61 = 0;
  id v14 = [objc_alloc((Class)NSString) initWithFormat:@"Will start..."];
  puts((const char *)[v14 UTF8String]);

  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_1000325E0;
  v52[3] = &unk_10005ABB0;
  uint64_t v54 = &v62;
  id v55 = &v56;
  uint64_t v15 = v13;
  id v53 = v15;
  [v11 suggestionsFromMessage:v43 options:3 completionHandler:v52];
  dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  +[SGPreferenceStorage setShowPastEvents:v42];
  +[SGPreferenceStorage setAlwaysShowCancelledEvents:v41];
  +[SGPreferenceStorage setDetectReminders:v40];
  if (byte_10006A7B8 == 1)
  {
    id v16 = objc_alloc((Class)NSString);
    CFStringRef v17 = sub_10001B094((void *)v63[5]);
    id v18 = [v16 initWithFormat:@"%@", v17];
    puts((const char *)[v18 UTF8String]);

    id v19 = objc_alloc((Class)NSString);
    sub_10001B094((void *)v57[5]);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    id v21 = [v19 initWithFormat:@"%@", v20];
    puts((const char *)[v21 UTF8String]);
  }
  else
  {
    id v22 = objc_alloc((Class)NSString);
    id v23 = [(id)v63[5] count];
    id v24 = [v22 initWithFormat:@"Found %ld contacts, %ld events", v23, objc_msgSend( (id) v57[5], "count")];
    puts((const char *)[v24 UTF8String]);

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v25 = (id)v63[5];
    id v26 = [v25 countByEnumeratingWithState:&v48 objects:v69 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v49;
      do
      {
        for (int i = 0; i != v26; int i = (char *)i + 1)
        {
          if (*(void *)v49 != v27) {
            objc_enumerationMutation(v25);
          }
          id v29 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          id v30 = objc_alloc((Class)NSString);
          id v31 = [v29 description];
          id v32 = [v30 initWithFormat:@"\n%@\n", v31];
          puts((const char *)[v32 UTF8String]);
        }
        id v26 = [v25 countByEnumeratingWithState:&v48 objects:v69 count:16];
      }
      while (v26);
    }

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v20 = (id)v57[5];
    id v33 = [v20 countByEnumeratingWithState:&v44 objects:v68 count:16];
    if (v33)
    {
      uint64_t v34 = *(void *)v45;
      do
      {
        for (uint64_t j = 0; j != v33; uint64_t j = (char *)j + 1)
        {
          if (*(void *)v45 != v34) {
            objc_enumerationMutation(v20);
          }
          id v36 = *(void **)(*((void *)&v44 + 1) + 8 * (void)j);
          id v37 = objc_alloc((Class)NSString);
          dispatch_semaphore_t v38 = [v36 description];
          id v39 = [v37 initWithFormat:@"\n%@\n", v38];
          puts((const char *)[v39 UTF8String]);
        }
        id v33 = [v20 countByEnumeratingWithState:&v44 objects:v68 count:16];
      }
      while (v33);
    }
  }

  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v62, 8);
}

void sub_10003259C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
}

void sub_1000325E0(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7)
  {
    id v10 = sgLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138412290;
      id v18 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Error: suggestionsFromTextMessage: %@", (uint8_t *)&v17, 0xCu);
    }
  }
  id v11 = [v8 copy];
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_semaphore_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  id v14 = [v9 copy];
  uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100032708(id a1, NSArray *a2)
{
  id v2 = a2;
  char v3 = (id)[(NSArray *)v2 count] == (id)3 || (id)[(NSArray *)v2 count] == (id)2;
  sub_10001A9E0(v3, @"extractAttributesAndDonateMessage [SENDER_NAME] SENDER_PHONE MESSAGE_CONTENT");
  if ((id)[(NSArray *)v2 count] == (id)3)
  {
    unsigned int v4 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  }
  else
  {
    unsigned int v4 = 0;
  }
  id v5 = [(NSArray *)v2 objectAtIndexedSubscript:(char *)[(NSArray *)v2 count] - 2];
  id v6 = [(NSArray *)v2 objectAtIndexedSubscript:(char *)[(NSArray *)v2 count] - 1];
  id v7 = [objc_alloc((Class)NSString) initWithFormat:@"%@%@%@", v4, v5, v6];
  id v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%ld", (unint64_t)objc_msgSend(v7, "hash") & 0xFFFFF);
  id v9 = objc_opt_new();
  [v9 setTextContent:v6];
  id v10 = objc_alloc((Class)CSPerson);
  id v16 = v5;
  id v11 = +[NSArray arrayWithObjects:&v16 count:1];
  id v12 = [v10 initWithDisplayName:v4 handles:v11 handleIdentifier:CNContactPhoneNumbersKey];
  id v17 = v12;
  dispatch_semaphore_t v13 = +[NSArray arrayWithObjects:&v17 count:1];
  [v9 setAuthors:v13];

  id v14 = [objc_alloc((Class)CSSearchableItem) initWithUniqueIdentifier:v8 domainIdentifier:@"conversation" attributeSet:v9];
  [v14 setBundleID:SGBundleIdentifierMessages];
  sub_100032964(v14);
}

void sub_100032964(void *a1)
{
  id v14 = a1;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = sub_100006C74;
  id v26 = sub_100006C84;
  id v27 = 0;
  id v1 = +[SGSuggestionsService serviceForSpotlightKnowledge];
  id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Initialized: %@", v1];
  puts((const char *)[v2 UTF8String]);

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100032C4C;
  v19[3] = &unk_100058DD8;
  id v21 = &v22;
  char v3 = dispatch_semaphore_create(0);
  id v20 = v3;
  [v1 extractAttributesAndDonate:v14 withCompletion:v19];
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  id v4 = objc_alloc((Class)NSString);
  id v5 = objc_msgSend(v4, "initWithFormat:", @"Found %ld results", objc_msgSend( (id) v23[5], "count"));
  puts((const char *)[v5 UTF8String]);

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = (id)v23[5];
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v9);
        id v11 = objc_alloc((Class)NSString);
        id v12 = [v10 debugDescription];
        id v13 = [v11 initWithFormat:@"\n%@\n", v12];
        puts((const char *)[v13 UTF8String]);

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v15 objects:v28 count:16];
    }
    while (v7);
  }

  _Block_object_dispose(&v22, 8);
}

void sub_100032C1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100032C4C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (a3)
  {
    id v6 = a3;
    id v7 = [objc_alloc((Class)NSString) initWithFormat:@"Error: extractAttributesAndDonate: %@", v6];

    id v8 = v7;
    puts((const char *)[v8 UTF8String]);
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100032D0C(uint64_t a1)
{
  id v23 = +[SGSuggestionsService serviceForInternal];
  dispatch_semaphore_t v22 = dispatch_semaphore_create(0);
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = sub_100006C74;
  id v35 = sub_100006C84;
  id v36 = 0;
  id v2 = [*(id *)(a1 + 32) objectAtIndexedSubscript:0];
  char v3 = +[NSData dataWithContentsOfFile:v2];

  if (v3)
  {
    id v4 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v5 = [v4 first];
    id v6 = [v4 second];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000330F8;
    v28[3] = &unk_100058DD8;
    id v30 = &v31;
    id v7 = v22;
    id v29 = v7;
    [v23 suggestionsFromSimpleMailMessage:v5 headers:v6 options:3 withCompletion:v28];

    dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
    if (byte_10006A7B8 == 1)
    {
      id v8 = objc_alloc((Class)NSString);
      sub_10001B094((void *)v32[5]);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      id v10 = [v8 initWithFormat:@"%@", v9];
      puts((const char *)[v10 UTF8String]);
    }
    else
    {
      id v13 = objc_alloc((Class)NSString);
      id v14 = objc_msgSend(v13, "initWithFormat:", @"Found %d suggestions", objc_msgSend( (id) v32[5], "count"));
      puts((const char *)[v14 UTF8String]);

      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v9 = (id)v32[5];
      id v15 = [v9 countByEnumeratingWithState:&v24 objects:v37 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v25;
        do
        {
          long long v17 = 0;
          do
          {
            if (*(void *)v25 != v16) {
              objc_enumerationMutation(v9);
            }
            long long v18 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v17);
            id v19 = objc_alloc((Class)NSString);
            id v20 = [v18 description];
            id v21 = [v19 initWithFormat:@"\n%@\n", v20];
            puts((const char *)[v21 UTF8String]);

            long long v17 = (char *)v17 + 1;
          }
          while (v15 != v17);
          id v15 = [v9 countByEnumeratingWithState:&v24 objects:v37 count:16];
        }
        while (v15);
      }
    }

    id v12 = v29;
  }
  else
  {
    id v11 = objc_alloc((Class)NSString);
    id v4 = [*(id *)(a1 + 32) objectAtIndexedSubscript:0];
    id v12 = [v11 initWithFormat:@"Error: failed to load file: %@", v4];
    puts((const char *)[v12 UTF8String]);
  }

  _Block_object_dispose(&v31, 8);
}

void sub_1000330C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1000330F8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (a3)
  {
    id v6 = a3;
    id v7 = [objc_alloc((Class)NSString) initWithFormat:@"Error: suggestionsFromRFC822: %@", v6];

    id v8 = v7;
    puts((const char *)[v8 UTF8String]);
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000331B8(uint64_t a1)
{
  id v32 = +[SGSuggestionsService serviceForMessages];
  id v37 = objc_opt_new();
  id v35 = objc_opt_new();
  id v2 = [*(id *)(a1 + 40) dictionaryFromArgs:*(void *)(a1 + 32) keys:&off_100064830];
  dispatch_semaphore_t v38 = objc_opt_new();
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = v2;
  id v39 = [obj countByEnumeratingWithState:&v50 objects:v56 count:16];
  if (!v39)
  {
    uint64_t v33 = 0;
    goto LABEL_20;
  }
  uint64_t v33 = 0;
  uint64_t v36 = *(void *)v51;
  do
  {
    for (int i = 0; i != v39; int i = (char *)i + 1)
    {
      if (*(void *)v51 != v36) {
        objc_enumerationMutation(obj);
      }
      id v4 = *(void **)(*((void *)&v50 + 1) + 8 * i);
      id v5 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v4];
      id v6 = +[NSUUID UUID];
      [v5 setObject:v6 forKeyedSubscript:@"uniqueIdentifier"];

      id v7 = [v4 objectForKeyedSubscript:@"extractionDate"];

      if (!v7)
      {
        uint64_t v9 = objc_opt_new();
        if (!v9) {
          goto LABEL_11;
        }
LABEL_10:
        [v5 setObject:v9 forKeyedSubscript:@"date"];
        goto LABEL_11;
      }
      id v8 = [v4 objectForKeyedSubscript:@"extractionDate"];
      uint64_t v9 = [v35 dateFromString:v8];

      if (v9) {
        goto LABEL_10;
      }
LABEL_11:
      id v10 = objc_alloc((Class)CSPerson);
      id v11 = [v4 objectForKeyedSubscript:@"accountHandle"];
      id v55 = v11;
      id v12 = +[NSArray arrayWithObjects:&v55 count:1];
      id v13 = [v10 initWithDisplayName:@"Test" handles:v12 handleIdentifier:CNContactInstantMessageAddressesKey];

      id v14 = [objc_alloc((Class)SGTextMessage) initWithMessageDictionary:v5];
      [v14 setSender:v13];
      id v15 = objc_alloc((Class)NSMutableDictionary);
      uint64_t v16 = [v37 jsonLdOutputFromTextMessage:v14];
      id v17 = [v15 initWithDictionary:v16];

      if (byte_10006A7B9) {
        goto LABEL_16;
      }
      long long v18 = [v17 objectForKeyedSubscript:@"outputs"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v19 = [v17 objectForKeyedSubscript:@"outputs"];
        BOOL v20 = [v19 count] == 0;

        if (v20) {
          goto LABEL_16;
        }
        long long v18 = objc_opt_new();
        id v21 = [v4 objectForKeyedSubscript:@"body"];
        dispatch_semaphore_t v22 = [v18 attributeSet];
        [v22 setTextContent:v21];

        [v18 setDomainIdentifier:@"conversation"];
        id v54 = v13;
        id v23 = +[NSArray arrayWithObjects:&v54 count:1];
        long long v24 = [v18 attributeSet];
        [v24 setAuthors:v23];

        dispatch_semaphore_t v25 = dispatch_semaphore_create(0);
        uint64_t v44 = 0;
        long long v45 = &v44;
        uint64_t v46 = 0x3032000000;
        long long v47 = sub_100006C74;
        long long v48 = sub_100006C84;
        id v49 = 0;
        v41[0] = _NSConcreteStackBlock;
        v41[1] = 3221225472;
        v41[2] = sub_100033818;
        v41[3] = &unk_1000590F8;
        id v43 = &v44;
        long long v26 = v25;
        unsigned int v42 = v26;
        [v32 suggestionsFromMessage:v18 options:3 completionHandler:v41];
        dispatch_semaphore_wait(v26, 0xFFFFFFFFFFFFFFFFLL);
        [v17 setObject:v45[5] forKeyedSubscript:@"events"];
        uint64_t v33 = v26;

        _Block_object_dispose(&v44, 8);
      }

LABEL_16:
      [v38 addObject:v17];
    }
    id v39 = [obj countByEnumeratingWithState:&v50 objects:v56 count:16];
  }
  while (v39);
LABEL_20:

  BOOL v27 = [v38 count] == (id)1;
  id v28 = objc_alloc((Class)NSString);
  if (v27)
  {
    id v29 = [v38 objectAtIndexedSubscript:0];
    sub_10001B094(v29);
    id v30 = (id)objc_claimAutoreleasedReturnValue();
    id v31 = [v28 initWithFormat:@"%@", v30];
    puts((const char *)[v31 UTF8String]);
  }
  else
  {
    id v29 = sub_10001B094(v38);
    id v30 = [v28 initWithFormat:@"%@", v29];
    puts((const char *)[v30 UTF8String]);
  }
}

void sub_1000337F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_100033818(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if (v6)
  {
    id v8 = sgLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      id v13 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Error: suggestionsJsonLdOutputFromSMS: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
  id v11 = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10003390C(id a1, NSArray *a2)
{
  id v2 = a2;
  sub_10001A9E0((id)[(NSArray *)v2 count] == (id)1, @"titleSuggestionForMessage MESSAGE_CONTENT");
  char v3 = +[SGSuggestionsService serviceForIpsos];
  id v4 = objc_opt_new();
  [v4 setBundleID:SGBundleIdentifierMessages];
  id v5 = objc_opt_new();
  id v6 = [v4 attributeSet];
  [v6 setContentCreationDate:v5];

  id v7 = [(NSArray *)v2 objectAtIndexedSubscript:0];

  id v8 = [v4 attributeSet];
  [v8 setTextContent:v7];

  [v4 setDomainIdentifier:@"testConversation"];
  uint64_t v9 = [v4 attributeSet];
  [v9 setPotentialEventMessage:&__kCFBooleanTrue];

  id v10 = [objc_alloc((Class)CSPerson) initWithDisplayName:@"Apple Bot" handles:&off_100064818 handleIdentifier:CNContactInstantMessageAddressesKey];
  id v24 = v10;
  id v11 = +[NSArray arrayWithObjects:&v24 count:1];
  int v12 = [v4 attributeSet];
  [v12 setAuthors:v11];

  id v13 = +[SGThreadParser ipsosMessageWithSearchableItem:v4];
  id v14 = +[SGIPMessage messageWithIPMessage:v13];

  id v23 = 0;
  id v15 = [v3 titleSuggestionForMessage:v14 error:&v23];
  id v16 = v23;
  id v17 = objc_alloc((Class)NSString);
  long long v18 = v17;
  if (v16)
  {
    id v19 = [v17 initWithFormat:@"Error: titleSuggestionForMessage: %@", v16];
    puts((const char *)[v19 UTF8String]);
  }
  else
  {
    id v19 = [v14 messageId];
    BOOL v20 = [v14 dateSent];
    id v21 = [v14 messageUnits];
    id v22 = [v18 initWithFormat:@"---\nSGIPMessage: %@\n\nDate: %@\n\nUnits:\n%@\nModel Generated Title: %@\n---", v19, v20, v21, v15];
    puts((const char *)[v22 UTF8String]);
  }
}

void sub_100033BF4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 48) filesFromArgs:*(void *)(a1 + 32)];
  long long v116 = objc_opt_new();
  id v110 = +[SGSuggestionsService serviceForMail];
  long long v114 = objc_opt_new();
  long long v112 = +[SGStructuredEventDissector sharedInstance];
  long long v158 = 0u;
  long long v159 = 0u;
  long long v156 = 0u;
  long long v157 = 0u;
  id obj = v1;
  id v123 = [obj countByEnumeratingWithState:&v156 objects:v170 count:16];
  if (!v123)
  {
    id v111 = 0;
    goto LABEL_85;
  }
  id v111 = 0;
  uint64_t v122 = *(void *)v157;
  do
  {
    uint64_t v2 = 0;
    do
    {
      if (*(void *)v157 != v122)
      {
        uint64_t v3 = v2;
        objc_enumerationMutation(obj);
        uint64_t v2 = v3;
      }
      uint64_t v125 = v2;
      id v4 = *(void **)(*((void *)&v156 + 1) + 8 * v2);
      if (![v4 hasSuffix:@".json"])
      {
        uint64_t v9 = +[NSData dataWithContentsOfFile:v4];
        if (v9)
        {
          id v5 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
          id v10 = [v5 first];
          goto LABEL_18;
        }
        id v128 = [objc_alloc((Class)NSString) initWithFormat:@"ERROR: failed to read contentsOfFile:%@", v4];
        int v12 = (const char *)[v128 UTF8String];
LABEL_36:
        puts(v12);
        goto LABEL_81;
      }
      id v155 = 0;
      id v5 = +[NSData dataWithContentsOfFile:v4 options:0 error:&v155];
      id v6 = v155;
      if (!v5)
      {
        id v11 = [objc_alloc((Class)NSString) initWithFormat:@"Error reading JSON file: %@", v6];

        id v128 = v11;
        int v12 = (const char *)[v128 UTF8String];
        goto LABEL_36;
      }
      id v154 = v6;
      id v7 = +[NSJSONSerialization JSONObjectWithData:v5 options:0 error:&v154];
      id v128 = v154;

      if (v128)
      {
        id v8 = [objc_alloc((Class)NSString) initWithFormat:@"Error decoding JSON content from %@: %@", v7, v128];
        puts((const char *)[v8 UTF8String]);

        goto LABEL_81;
      }
      id v13 = [v7 objectForKeyedSubscript:@"jsEntity"];

      if (v13)
      {
        id v14 = objc_opt_new();
        id v15 = [v7 objectForKeyedSubscript:@"jsEntity"];
        id v16 = [v15 objectForKeyedSubscript:@"html"];
        [v14 setObject:v16 forKeyedSubscript:@"htmlBody"];

        id v17 = [v15 objectForKeyedSubscript:@"from"];
        [v14 setObject:v17 forKeyedSubscript:@"from"];

        [v14 setObject:&off_100064800 forKeyedSubscript:@"to"];
        [v14 setObject:&__NSArray0__struct forKeyedSubscript:@"cc"];
        [v14 setObject:&__NSArray0__struct forKeyedSubscript:@"bcc"];
        long long v18 = [v15 objectForKeyedSubscript:@"headers"];
        [v14 setObject:v18 forKeyedSubscript:@"headers"];

        id v19 = [v15 objectForKeyedSubscript:@"subject"];
        [v14 setObject:v19 forKeyedSubscript:@"subject"];

        BOOL v20 = [v15 objectForKeyedSubscript:@"date"];
        [v14 setObject:v20 forKeyedSubscript:@"date"];

        id v10 = [objc_alloc((Class)SGSimpleMailMessage) initWithMessageDictionary:v14];
      }
      else
      {
        id v10 = 0;
      }

      uint64_t v9 = 0;
LABEL_18:

      if (!v10)
      {
        id v128 = [objc_alloc((Class)NSString) initWithFormat:@"ERROR: Unable to create SGSimpleMailMessage from %@", v4];
        int v12 = (const char *)[v128 UTF8String];
        goto LABEL_36;
      }
      long long v115 = [v10 createNewSearchableItemWithSource:@"suggest_tool" uniqueIdentifier:0 domainIdentifier:0];
      id v124 = (id)objc_opt_new();
      v152[0] = _NSConcreteStackBlock;
      v152[1] = 3221225472;
      v152[2] = sub_100034EBC;
      v152[3] = &unk_100059060;
      id v128 = v10;
      id v153 = v128;
      long long v117 = objc_retainBlock(v152);
      if (!+[SGPreferenceStorage detectStructuredEventsML])
      {
        long long v45 = [v116 jsonLdOutputFromMailMessage:v128];
        uint64_t v46 = +[NSMutableDictionary dictionaryWithDictionary:v45];

        long long v47 = [v46 objectForKeyedSubscript:@"outputs"];
        if (+[SGPreferenceStorage EventMLRegexEnsembleExtractionEnabled](SGPreferenceStorage, "EventMLRegexEnsembleExtractionEnabled")&& [v116 requiredFieldsMissingForOutputItems:v47])
        {
          long long v48 = ((void (*)(void))v117[2])();
          id v49 = [v116 extractMissingValuesFromMLForMail:v128 outputItems:v47 fromSuggestTool:1 withFiEMLResults:v48];
          if (v49)
          {
            long long v50 = [v116 jsonLdOutputFromMailMessage:v128 schema:v49];
            id v124 = [v50 mutableCopy];
          }
          else
          {
            id v124 = v46;
          }
        }
        else
        {
          id v124 = v46;
        }

        id v28 = 0;
        long long v121 = 0;
        if ((byte_10006A7BA & 1) == 0) {
          goto LABEL_66;
        }
LABEL_45:
        long long v51 = [v116 eventClassificationWithoutXPCForMailMessage:v128];
        long long v121 = +[SGStructuredEventClassification describeCategory:](SGStructuredEventClassification, "describeCategory:", [v51 category]);

        goto LABEL_46;
      }
      id v21 = [v116 eventClassificationWithoutXPCForMailMessage:v128];
      long long v121 = +[SGStructuredEventClassification describeCategory:](SGStructuredEventClassification, "describeCategory:", [v21 category]);
      id v22 = [v128 htmlBody];
      id v23 = [v128 subject];
      id v24 = [v128 date];
      [v24 timeIntervalSince1970];
      double v26 = v25;
      BOOL v27 = +[SGStructuredEventDissector labelsWithMatchingStringsForMailMessage:v128];
      id v28 = +[SGStructuredEventDissector preprocessWithoutXPCForHTML:v22 subject:v23 epoch:v121 category:v27 labelsWithMatchingStrings:v26];

      id v131 = ((void (*)(void))v117[2])();
      id v30 = +[SGStructuredEventDissector schemaOrgAndMissingEntitiesForDUFoundInEvent:v131 eventClassification:v21 fromSuggestTool:1];
      id v31 = sgEventsLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v30;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "SGStructuredEventDissector: foundInEventResult result schema %@", (uint8_t *)&buf, 0xCu);
      }

      uint64_t v133 = [v30 objectForKeyedSubscript:@"schema"];
      uint64_t v135 = [v30 objectForKeyedSubscript:@"missingEntities"];
      id v32 = objc_opt_new();
      uint64_t v33 = objc_opt_new();
      if ([v135 count])
      {
        CFStringRef v168 = @"ml_failed";
        long long v169 = v135;
        uint64_t v34 = +[NSDictionary dictionaryWithObjects:&v169 forKeys:&v168 count:1];
        [v33 addObject:v34];
      }
      if (v133) {
        [v32 addObject:v133];
      }
      id v35 = [v30 objectForKeyedSubscript:@"ml_plaintext_prediction"];

      if (v35)
      {
        uint64_t v36 = [v30 objectForKeyedSubscript:@"ml_plaintext_prediction"];
        [v124 setObject:v36 forKeyedSubscript:@"ml_plaintext_prediction"];
      }
      id v37 = [v30 objectForKeyedSubscript:@"ml_summary"];

      if (v37)
      {
        dispatch_semaphore_t v38 = [v30 objectForKeyedSubscript:@"ml_summary"];
        [v124 setObject:v38 forKeyedSubscript:@"ml_summary"];
      }
      [v124 setObject:v32 forKeyedSubscript:@"schemas"];
      [v124 setObject:v33 forKeyedSubscript:@"issues"];
      id v39 = [*(id *)(a1 + 48) reverseMapAnnotationsForMessageFile:v4 forMailMessage:v128 withPreprocessed:v28];
      unsigned int v40 = [v39 first];
      id v41 = [v40 count];

      if (v41)
      {
        unsigned int v42 = [v39 first];
        id v43 = [v28 objectForKeyedSubscript:@"plainText"];
        uint64_t v44 = +[SGStructuredEventDissector plainTextStringsByLabelInTaggedCharacterRanges:v42 inPlainText:v43];
        [v124 setObject:v44 forKeyedSubscript:@"reverse_mapped"];
      }
      if ((byte_10006A7BA & 1) == 0)
      {
LABEL_66:
        long long v120 = v28;
        if ((byte_10006A7B9 & 1) == 0)
        {
          long long v86 = [v124 objectForKeyedSubscript:@"outputs"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v87 = [v124 objectForKeyedSubscript:@"outputs"];
            BOOL v88 = [v87 count] == 0;

            if (!v88)
            {
              dispatch_semaphore_t v89 = dispatch_semaphore_create(0);

              *(void *)&long long buf = 0;
              *((void *)&buf + 1) = &buf;
              uint64_t v161 = 0x3032000000;
              v162 = sub_100006C74;
              long long v163 = sub_100006C84;
              id v164 = 0;
              v137[0] = _NSConcreteStackBlock;
              v137[1] = 3221225472;
              v137[2] = sub_100035398;
              v137[3] = &unk_100058DD8;
              p_long long buf = &buf;
              long long v90 = v89;
              v138 = v90;
              [v110 suggestionsFromSearchableItem:v115 options:2 withCompletion:v137];
              dispatch_semaphore_wait(v90, 0xFFFFFFFFFFFFFFFFLL);
              [v124 setObject:*(void *)(*((void *)&buf + 1) + 40) forKeyedSubscript:@"events"];
              id v111 = v90;

              _Block_object_dispose(&buf, 8);
            }
          }
          else
          {
          }
        }
        goto LABEL_80;
      }
      if (!v121) {
        goto LABEL_45;
      }
LABEL_46:
      if (!v28)
      {
        long long v52 = [v128 htmlBody];
        long long v53 = [v128 subject];
        id v54 = [v128 date];
        [v54 timeIntervalSince1970];
        double v56 = v55;
        id v57 = +[SGStructuredEventDissector labelsWithMatchingStringsForMailMessage:v128];
        id v28 = +[SGStructuredEventDissector preprocessWithoutXPCForHTML:v52 subject:v53 epoch:v121 category:v57 labelsWithMatchingStrings:v56];
      }
      long long v120 = v28;
      id v132 = [*(id *)(a1 + 48) reverseMapAnnotationsForMessageFile:v4 forMailMessage:v128 withPreprocessed:v28];
      long long v113 = [v28 objectForKeyedSubscript:@"crossTags"];
      uint64_t v58 = [v132 first];
      BOOL v59 = [v58 count] == 0;

      if (v59)
      {
        id v85 = v113;
      }
      else
      {
        long long v130 = objc_opt_new();
        long long v150 = 0u;
        long long v151 = 0u;
        long long v148 = 0u;
        long long v149 = 0u;
        id v127 = v113;
        id v134 = [v127 countByEnumeratingWithState:&v148 objects:v167 count:16];
        if (v134)
        {
          uint64_t v129 = *(void *)v149;
          do
          {
            uint64_t v60 = 0;
            do
            {
              if (*(void *)v149 != v129)
              {
                uint64_t v61 = v60;
                objc_enumerationMutation(v127);
                uint64_t v60 = v61;
              }
              uint64_t v136 = v60;
              uint64_t v62 = *(void **)(*((void *)&v148 + 1) + 8 * v60);
              long long v63 = [v62 tags];
              id v64 = [v63 mutableCopy];

              long long v146 = 0u;
              long long v147 = 0u;
              long long v144 = 0u;
              long long v145 = 0u;
              long long v65 = [v132 first];
              id v66 = [v65 countByEnumeratingWithState:&v144 objects:v166 count:16];
              if (v66)
              {
                uint64_t v67 = *(void *)v145;
                do
                {
                  for (int i = 0; i != v66; int i = (char *)i + 1)
                  {
                    if (*(void *)v145 != v67) {
                      objc_enumerationMutation(v65);
                    }
                    id v69 = *(void **)(*((void *)&v144 + 1) + 8 * i);
                    id v70 = [v62 range];
                    NSUInteger v72 = v71;
                    v172.location = (NSUInteger)[v69 range];
                    v172.length = v73;
                    v171.location = (NSUInteger)v70;
                    v171.length = v72;
                    if (NSIntersectionRange(v171, v172).length)
                    {
                      id v74 = objc_alloc((Class)NSString);
                      uint64_t v75 = [v69 annotationTypeUniqueIdentifier];
                      long long v76 = [v69 tags];
                      uint64_t v77 = [v76 firstObject];
                      id v78 = [v74 initWithFormat:@"%@_%@", v75, v77];
                      [v64 addObject:v78];
                    }
                  }
                  id v66 = [v65 countByEnumeratingWithState:&v144 objects:v166 count:16];
                }
                while (v66);
              }

              id v79 = objc_alloc((Class)SGTaggedCharacterRange);
              id v80 = [v62 range];
              uint64_t v82 = v81;
              uint64_t v83 = [v62 text];
              id v84 = objc_msgSend(v79, "initWithAnnotationType:tags:range:text:", 4, v64, v80, v82, v83);
              [v130 addObject:v84];

              uint64_t v60 = v136 + 1;
            }
            while ((id)(v136 + 1) != v134);
            id v134 = [v127 countByEnumeratingWithState:&v148 objects:v167 count:16];
          }
          while (v134);
        }

        id v85 = v130;
      }
      long long v91 = v85;
      long long v92 = objc_msgSend(v112, "tagsWithModelOutputFromEnrichedTaggedCharacterRanges:");
      long long v93 = objc_opt_new();
      long long v142 = 0u;
      long long v143 = 0u;
      long long v140 = 0u;
      long long v141 = 0u;
      id v94 = v92;
      id v95 = [v94 countByEnumeratingWithState:&v140 objects:v165 count:16];
      if (v95)
      {
        uint64_t v96 = *(void *)v141;
        do
        {
          for (uint64_t j = 0; j != v95; uint64_t j = (char *)j + 1)
          {
            if (*(void *)v141 != v96) {
              objc_enumerationMutation(v94);
            }
            long long v98 = [*(id *)(*((void *)&v140 + 1) + 8 * (void)j) dictRepresentation];
            [v93 addObject:v98];
          }
          id v95 = [v94 countByEnumeratingWithState:&v140 objects:v165 count:16];
        }
        while (v95);
      }

      long long v99 = [v120 objectForKeyedSubscript:@"plainText"];
      [v124 setObject:v99 forKeyedSubscript:@"plainText"];

      [v124 setObject:v93 forKeyedSubscript:@"tags"];
LABEL_80:
      [v114 addObject:v124];

LABEL_81:
      uint64_t v2 = v125 + 1;
    }
    while ((id)(v125 + 1) != v123);
    id v123 = [obj countByEnumeratingWithState:&v156 objects:v170 count:16];
  }
  while (v123);
LABEL_85:

  if ([v114 count] == (id)1)
  {
    id v100 = objc_alloc((Class)NSString);
    id v101 = [v114 objectAtIndexedSubscript:0];
    long long v102 = sub_10001B094(v101);
    id v103 = [v100 initWithFormat:@"%@", v102];
  }
  else
  {
    long long v104 = [*(id *)(a1 + 32) objectAtIndexedSubscript:0];
    long long v105 = [v104 componentsSeparatedByString:@"/"];
    long long v106 = [v105 lastObject];

    id v101 = [objc_alloc((Class)NSString) initWithFormat:@"/tmp/%@", v106];
    long long v107 = +[NSFileManager defaultManager];
    [v107 createFileAtPath:v101 contents:0 attributes:0];

    long long v102 = sub_10001B094(v114);
    long long v108 = [v102 dataUsingEncoding:4];
    [v108 writeToFile:v101 atomically:0];

    id v103 = [objc_alloc((Class)NSString) initWithFormat:@"%@", v102];
  }
  id v109 = v103;
  puts((const char *)[v109 UTF8String]);
}

void sub_100034E9C(_Unwind_Exception *a1)
{
}

id sub_100034EBC(uint64_t a1)
{
  id v2 = [objc_alloc((Class)DUClientObjC) initWithIdentifier:@"suggest_tool"];
  id v3 = [objc_alloc((Class)DURequestContentTypeObjC) initWithOptions:2048];
  id v4 = [objc_alloc((Class)DURequestObjC) initWithClient:v2 contentType:v3 strategies:0];
  id v5 = objc_opt_new();
  id v6 = objc_opt_new();
  id v7 = objc_opt_new();
  id v8 = [*(id *)(a1 + 32) subject];
  [v7 setSubject:v8];

  uint64_t v9 = [*(id *)(a1 + 32) from];
  id v10 = [v9 name];
  [v7 setSenderName:v10];

  id v11 = [*(id *)(a1 + 32) from];
  int v12 = [v11 emailAddress];
  [v7 setSenderEmail:v12];

  id v13 = [*(id *)(a1 + 32) senderDomain];
  [v7 setSenderDomain:v13];

  id v14 = [*(id *)(a1 + 32) to];
  id v15 = sgMap();
  [v7 setRecipientNames:v15];

  id v16 = [*(id *)(a1 + 32) to];
  id v17 = sgMap();
  [v7 setRecipientEmails:v17];

  long long v18 = [*(id *)(a1 + 32) cc];
  id v19 = sgMap();
  [v7 setCcNames:v19];

  BOOL v20 = [*(id *)(a1 + 32) cc];
  id v21 = sgMap();
  [v7 setCcEmails:v21];

  id v22 = [*(id *)(a1 + 32) bcc];
  id v23 = sgMap();
  [v7 setBccNames:v23];

  id v24 = [*(id *)(a1 + 32) bcc];
  double v25 = sgMap();
  [v7 setBccEmails:v25];

  double v26 = [*(id *)(a1 + 32) date];
  [v7 setDateReceived:v26];

  [v6 setDocumentEmailData:v7];
  BOOL v27 = [*(id *)(a1 + 32) htmlBody];
  [v6 setHtmlString:v27];

  [v5 setDocumentHTMLData:v6];
  uint64_t v41 = 0;
  unsigned int v42 = &v41;
  uint64_t v43 = 0x2020000000;
  char v44 = 0;
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000;
  dispatch_semaphore_t v38 = sub_100006C74;
  id v39 = sub_100006C84;
  id v40 = 0;
  id v40 = (id)objc_opt_new();
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10003548C;
  v34[3] = &unk_100059038;
  void v34[4] = &v35;
  void v34[5] = &v41;
  id v28 = v4;
  [v4 executeWithDocument:v5 completion:v34];
  do
  {
    if (*((unsigned char *)v42 + 24)) {
      break;
    }
    id v29 = +[NSRunLoop currentRunLoop];
    id v30 = +[NSDate distantFuture];
    unsigned __int8 v31 = [v29 runMode:NSDefaultRunLoopMode beforeDate:v30];
  }
  while ((v31 & 1) != 0);
  id v32 = [(id)v36[5] foundInEvent];
  _Block_object_dispose(&v35, 8);

  _Block_object_dispose(&v41, 8);

  return v32;
}

void sub_100035368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100035398(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = sgLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Error: suggestionsFromRFC822: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10003548C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = sgLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Error: suggestionsJsonLdOutputFromRFC822 DUResponseObjC: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
}

NSString *__cdecl sub_100035588(id a1, SGSimpleNamedEmailAddress *a2)
{
  return (NSString *)[(SGSimpleNamedEmailAddress *)a2 emailAddress];
}

NSString *__cdecl sub_100035590(id a1, SGSimpleNamedEmailAddress *a2)
{
  id v2 = [(SGSimpleNamedEmailAddress *)a2 name];
  id v3 = v2;
  if (!v2) {
    id v2 = &stru_10005B0F8;
  }
  id v4 = v2;

  return v4;
}

NSString *__cdecl sub_1000355DC(id a1, SGSimpleNamedEmailAddress *a2)
{
  return (NSString *)[(SGSimpleNamedEmailAddress *)a2 emailAddress];
}

NSString *__cdecl sub_1000355E4(id a1, SGSimpleNamedEmailAddress *a2)
{
  id v2 = [(SGSimpleNamedEmailAddress *)a2 name];
  id v3 = v2;
  if (!v2) {
    id v2 = &stru_10005B0F8;
  }
  id v4 = v2;

  return v4;
}

NSString *__cdecl sub_100035630(id a1, SGSimpleNamedEmailAddress *a2)
{
  return (NSString *)[(SGSimpleNamedEmailAddress *)a2 emailAddress];
}

NSString *__cdecl sub_100035638(id a1, SGSimpleNamedEmailAddress *a2)
{
  id v2 = [(SGSimpleNamedEmailAddress *)a2 name];
  id v3 = v2;
  if (!v2) {
    id v2 = &stru_10005B0F8;
  }
  id v4 = v2;

  return v4;
}

void sub_100035684(uint64_t a1)
{
  double v56 = +[NSRegularExpression regularExpressionWithPattern:@"<title[^>]*?>\\s*([\\s\\S]*?)\\s*<\\/title>" options:0 error:0];
  id v57 = objc_opt_new();
  double v55 = +[SGSuggestionsService serviceForInternal];
  dispatch_semaphore_t v54 = dispatch_semaphore_create(0);
  BOOL v59 = objc_opt_new();
  id v2 = [*(id *)(a1 + 40) dictionaryFromArgs:*(void *)(a1 + 32) keys:&off_1000647D0];
  uint64_t v58 = objc_opt_new();
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id obj = v2;
  id v63 = [obj countByEnumeratingWithState:&v70 objects:v81 count:16];
  if (v63)
  {
    uint64_t v62 = *(void *)v71;
LABEL_3:
    uint64_t v3 = 0;
    while (1)
    {
      if (*(void *)v71 != v62) {
        objc_enumerationMutation(obj);
      }
      id v4 = *(void **)(*((void *)&v70 + 1) + 8 * v3);
      id v5 = [v4 objectForKeyedSubscript:@"path"];
      id v6 = +[NSData dataWithContentsOfFile:v5];

      id v7 = objc_alloc((Class)NSString);
      uint64_t v8 = v7;
      if (v6)
      {
        id v9 = [v7 initWithData:v6 encoding:4];
        if (!v9)
        {
          NSStringEncodingDetectionOptionsKey v79 = NSStringEncodingDetectionSuggestedEncodingsKey;
          id v80 = &off_1000647E8;
          id v9 = +[NSDictionary dictionaryWithObjects:&v80 forKeys:&v79 count:1];
          char v69 = 0;
          id v10 = [v4 objectForKeyedSubscript:@"path"];
          int v11 = +[NSData dataWithContentsOfFile:v10];

          if (!v11)
          {
            id v28 = [objc_alloc((Class)NSString) initWithFormat:@"Error: unable to read HTML payload from file."];
            puts((const char *)[v28 UTF8String]);

            goto LABEL_35;
          }
          id v68 = 0;
          NSStringEncoding v12 = +[NSString stringEncodingForData:v11 encodingOptions:v9 convertedString:&v68 usedLossyConversion:&v69];
          id v13 = v68;
          if (v69)
          {
            id v14 = sgLogHandle();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              LODWORD(buf) = 134217984;
              *(void *)((char *)&buf + 4) = v12;
              _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Lossy conversion of HTMLPayload. Detected Encoding: %ld", (uint8_t *)&buf, 0xCu);
            }
          }
          id v9 = v13;
        }
        id v15 = [v4 objectForKeyedSubscript:@"url"];
        id v16 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
        id v17 = [v15 stringByTrimmingCharactersInSet:v16];
        long long v18 = +[NSCharacterSet URLQueryAllowedCharacterSet];
        id v19 = [v17 stringByAddingPercentEncodingWithAllowedCharacters:v18];

        if (v19)
        {
          BOOL v20 = +[NSURL URLWithString:v19];
          if (v20)
          {
            id v21 = [v4 objectForKeyedSubscript:@"title"];

            if (v21)
            {
              uint64_t v61 = [v4 objectForKeyedSubscript:@"title"];
            }
            else
            {
              id v29 = objc_msgSend(v56, "matchesInString:options:range:", v9, 0, 0, objc_msgSend(v9, "length"));
              if (![v29 count])
              {
                id v51 = objc_alloc((Class)NSString);
                long long v52 = [v4 objectForKeyedSubscript:@"path"];
                id v53 = [v51 initWithFormat:@"No Title to extract for file: %@", v52];
                puts((const char *)[v53 UTF8String]);

                long long v48 = obj;
                goto LABEL_42;
              }
              id v30 = [v29 objectAtIndexedSubscript:0];
              id v31 = [v30 rangeAtIndex:1];
              uint64_t v61 = objc_msgSend(v9, "substringWithRange:", v31, v32);
            }
            uint64_t v33 = [v4 objectForKeyedSubscript:@"extractionDate"];

            if (v33)
            {
              uint64_t v34 = [v4 objectForKeyedSubscript:@"extractionDate"];
              uint64_t v35 = [v58 dateFromString:v34];

              if (v35) {
                goto LABEL_26;
              }
LABEL_31:
              id v43 = objc_alloc((Class)NSString);
              id v38 = [v4 objectForKeyedSubscript:@"extractionDate"];
              char v44 = [v4 objectForKeyedSubscript:@"path"];
              id v45 = [v43 initWithFormat:@"Error: creating date %@ %@", v38, v44];
              puts((const char *)[v45 UTF8String]);
            }
            else
            {
              uint64_t v35 = objc_opt_new();
              if (!v35) {
                goto LABEL_31;
              }
LABEL_26:
              id v36 = objc_alloc((Class)NSMutableDictionary);
              uint64_t v37 = [v57 jsonLdOutputFromURL:v20 title:v61 payload:v9 extractionDate:v35];
              id v38 = [v36 initWithDictionary:v37];

              if ((byte_10006A7B9 & 1) == 0)
              {
                id v39 = [v38 objectForKeyedSubscript:@"outputs"];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v40 = [v38 objectForKeyedSubscript:@"outputs"];
                  BOOL v41 = [v40 count] == 0;

                  if (!v41)
                  {
                    *(void *)&long long buf = 0;
                    *((void *)&buf + 1) = &buf;
                    uint64_t v75 = 0x3032000000;
                    long long v76 = sub_100006C74;
                    uint64_t v77 = sub_100006C84;
                    id v78 = 0;
                    v65[0] = _NSConcreteStackBlock;
                    v65[1] = 3221225472;
                    v65[2] = sub_100036074;
                    v65[3] = &unk_100058DD8;
                    p_long long buf = &buf;
                    unsigned int v42 = v54;
                    id v66 = v42;
                    [v55 realtimeSuggestionsFromURL:v20 title:v61 HTMLPayload:v9 extractionDate:v35 withCompletion:v65];
                    dispatch_semaphore_wait(v42, 0xFFFFFFFFFFFFFFFFLL);
                    [v38 setObject:*(void *)(*((void *)&buf + 1) + 40) forKeyedSubscript:@"events"];

                    _Block_object_dispose(&buf, 8);
                  }
                }
                else
                {
                }
              }
              [v59 addObject:v38];
            }

            goto LABEL_35;
          }
          id v25 = objc_alloc((Class)NSString);
          double v26 = [v4 objectForKeyedSubscript:@"path"];
          id v27 = [v25 initWithFormat:@"Error: converting url from string: %@ %@", v19, v26];
          puts((const char *)[v27 UTF8String]);
        }
        else
        {
          id v22 = objc_alloc((Class)NSString);
          id v23 = [v4 objectForKeyedSubscript:@"path"];
          id v24 = [v22 initWithFormat:@"Error: no url string for: %@", v23];
          puts((const char *)[v24 UTF8String]);
        }
      }
      else
      {
        id v6 = [v4 objectForKeyedSubscript:@"path"];
        id v9 = [v8 initWithFormat:@"Error: failed to load file: %@", v6];
        puts((const char *)[v9 UTF8String]);
      }
LABEL_35:

      if (v63 == (id)++v3)
      {
        id v63 = [obj countByEnumeratingWithState:&v70 objects:v81 count:16];
        if (v63) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  BOOL v46 = [v59 count] == (id)1;
  id v47 = objc_alloc((Class)NSString);
  if (v46)
  {
    long long v48 = [v59 objectAtIndexedSubscript:0];
    sub_10001B094(v48);
    id v49 = (id)objc_claimAutoreleasedReturnValue();
    id v50 = [v47 initWithFormat:@"%@", v49];
    puts((const char *)[v50 UTF8String]);
  }
  else
  {
    long long v48 = sub_10001B094(v59);
    id v49 = [v47 initWithFormat:@"%@", v48];
    puts((const char *)[v49 UTF8String]);
  }

LABEL_42:
}

void sub_100036054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
}

void sub_100036074(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = sgLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Error: suggestionsFromHTML: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t sub_100036168(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10003617C(id a1, NSArray *a2)
{
  id v2 = a2;
  id v3 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Args count %lu", -[NSArray count](v2, "count"));
  puts((const char *)[v3 UTF8String]);

  sub_10001A9E0((id)[(NSArray *)v2 count] == (id)1, @"cityForIataCode IATA_CODE");
  id v4 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  sub_10001A9E0([v4 length] != 0, @"cityForIataCode IATA_CODE");

  id v5 = +[SGFlightData sharedInstance];
  id v6 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  id v7 = [v5 cityForIataCode:v6];

  id v8 = objc_alloc((Class)NSString);
  v14[0] = @"iata_code";
  id v9 = [(NSArray *)v2 objectAtIndexedSubscript:0];

  v14[1] = @"city";
  v15[0] = v9;
  CFStringRef v10 = &stru_10005B0F8;
  if (v7) {
    CFStringRef v10 = v7;
  }
  v15[1] = v10;
  int v11 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
  id v12 = sub_10001B094(v11);
  id v13 = [v8 initWithFormat:@"%@", v12];
  puts((const char *)[v13 UTF8String]);
}

void sub_10003636C(id a1, NSArray *a2)
{
  id v2 = a2;
  id v3 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Args count %lu", -[NSArray count](v2, "count"));
  puts((const char *)[v3 UTF8String]);

  sub_10001A9E0((id)[(NSArray *)v2 count] == (id)1, @"carrierCodeFromCarrierName CARRIER_NAME");
  id v4 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  sub_10001A9E0([v4 length] != 0, @"carrierCodeFromCarrierName CARRIER_NAME");

  id v5 = +[SGFlightData sharedInstance];
  id v6 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  id v7 = [v5 carrierIataCodeForCarrierName:v6];

  id v8 = objc_alloc((Class)NSString);
  v14[0] = @"carrier_name";
  id v9 = [(NSArray *)v2 objectAtIndexedSubscript:0];

  v14[1] = @"carrier_code";
  v15[0] = v9;
  CFStringRef v10 = &stru_10005B0F8;
  if (v7) {
    CFStringRef v10 = v7;
  }
  v15[1] = v10;
  int v11 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
  id v12 = sub_10001B094(v11);
  id v13 = [v8 initWithFormat:@"%@", v12];
  puts((const char *)[v13 UTF8String]);
}

void sub_10003655C(id a1, NSArray *a2)
{
  id v2 = a2;
  char v3 = (id)[(NSArray *)v2 count] == (id)3 || (id)[(NSArray *)v2 count] == (id)2;
  sub_10001A9E0(v3, @"suggestionsFromTextMessage [SENDER_NAME] SENDER_EMAIL CONTENT");
  if ((id)[(NSArray *)v2 count] == (id)3)
  {
    id v4 = [(NSArray *)v2 objectAtIndexedSubscript:0];
  }
  else
  {
    id v4 = 0;
  }
  id v5 = objc_opt_new();
  id v6 = [(NSArray *)v2 objectAtIndexedSubscript:(char *)[(NSArray *)v2 count] - 1];
  id v7 = [v5 attributeSet];
  [v7 setTextContent:v6];

  [v5 setDomainIdentifier:@"conversation"];
  id v8 = [(NSArray *)v2 objectAtIndexedSubscript:(char *)[(NSArray *)v2 count] - 2];
  unsigned int v9 = [v8 containsString:@"@"];
  id v10 = objc_alloc((Class)CSPerson);
  int v11 = [(NSArray *)v2 objectAtIndexedSubscript:(char *)[(NSArray *)v2 count] - 2];
  id v17 = v11;
  id v12 = +[NSArray arrayWithObjects:&v17 count:1];
  id v13 = &CNContactEmailAddressesKey;
  if (!v9) {
    id v13 = &CNContactPhoneNumbersKey;
  }
  id v14 = [v10 initWithDisplayName:v4 handles:v12 handleIdentifier:*v13];
  id v18 = v14;
  id v15 = +[NSArray arrayWithObjects:&v18 count:1];
  id v16 = [v5 attributeSet];
  [v16 setAuthors:v15];

  sub_100031FB4(v5);
}

void sub_100036794(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000367F4(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    id v4 = [objc_alloc((Class)NSString) initWithFormat:@"Contact suggestion %@ had rejection error %@", *(void *)(a1 + 32), v3];

    id v5 = v4;
    puts((const char *)[v5 UTF8String]);
  }
  id v6 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v6);
}

void sub_100036888(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    id v4 = [objc_alloc((Class)NSString) initWithFormat:@"Event suggestion %@ had rejection error %@", *(void *)(a1 + 32), v3];

    id v5 = v4;
    puts((const char *)[v5 UTF8String]);
  }
  id v6 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v6);
}

_PASTuple2 *__cdecl sub_10003691C(id a1, NSData *a2)
{
  id v2 = a2;
  if (sub_100007C10())
  {
    id v4 = +[MFMailMessage sg_messageWithRFC822Data:v2];
    id v5 = objc_msgSend(v4, "sg_bestAlternativePart");
    id v6 = objc_msgSend(v4, "sg_allHeaders");
    id v7 = +[SGSimpleMailMessage simpleMailMessageFromHeaders:v6];

    id v8 = [v5 copy];
    [v7 setHtmlBody:v8];

    [v7 setSource:@"suggest_tool"];
    unsigned int v9 = [v4 headerData];
  }
  else
  {
    id v7 = +[SGSimpleMailMessage parseRfc822:v2];
    [v7 setSource:@"suggest_tool"];
    id v10 = +[SGSimpleMailMessage rangeOfHeadersFromRfc822:v2];
    unsigned int v9 = -[NSData subdataWithRange:](v2, "subdataWithRange:", v10, v11);
  }
  id v12 = +[_PASTuple2 tupleWithFirst:v7 second:v9];

  return (_PASTuple2 *)v12;
}

void sub_100036A88(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100036AE8(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    id v4 = [objc_alloc((Class)NSString) initWithFormat:@"Contact suggestion %@ had rejection error %@", *(void *)(a1 + 32), v3];

    id v5 = v4;
    puts((const char *)[v5 UTF8String]);
  }
  id v6 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v6);
}

void sub_100036B7C(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    id v4 = [objc_alloc((Class)NSString) initWithFormat:@"Event suggestion %@ had rejection error %@", *(void *)(a1 + 32), v3];

    id v5 = v4;
    puts((const char *)[v5 UTF8String]);
  }
  id v6 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v6);
}

void sub_100036C10(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100036CAC(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100036D0C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100036DA8(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = objc_alloc((Class)NSString);
  if (v8) {
    id v4 = [v3 initWithFormat:@"Error: %@", v8, v6, v7];
  }
  else {
    id v4 = [v3 initWithFormat:@"reimport issued for %@ between dates %@ - %@", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48)];
  }
  id v5 = v4;
  puts((const char *)[v5 UTF8String]);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

void sub_100036F5C(uint64_t a1, void *a2)
{
  id v19 = a2;
  if ([v19 count])
  {
    if (([v19 isEqual:&off_100064770] & 1) == 0
      && ([v19 isEqual:&off_100064788] & 1) == 0)
    {
      id v17 = [objc_alloc((Class)NSString) initWithFormat:@"\nError: you must specify 0 (to disable) or 1 (to enable)"];
      puts((const char *)[v17 UTF8String]);

      _exit(1);
    }
    [*(id *)(a1 + 56) beSameUserAsSuggestd];
    int v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    unsigned int v4 = [v19 isEqual:&off_1000647A0];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v5 = objc_alloc((Class)NSString);
    uint64_t v6 = *(void *)(a1 + 32);
    if (v4) {
      uint64_t v7 = @"enabled";
    }
    else {
      uint64_t v7 = @"disabled";
    }
    uint64_t v8 = sub_100006034(v7);
    uint64_t v9 = (void *)v8;
    if (v3) {
      CFStringRef v10 = @"enabled";
    }
    else {
      CFStringRef v10 = @"disabled";
    }
    id v11 = [v5 initWithFormat:@"\n%@ set to %@ (was %@)", v6, v8, v10];
  }
  else
  {
    [*(id *)(a1 + 56) beSameUserAsSuggestd];
    int v12 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    id v13 = objc_alloc((Class)NSString);
    uint64_t v14 = *(void *)(a1 + 32);
    if (v12) {
      id v15 = @"enabled";
    }
    else {
      id v15 = @"disabled";
    }
    uint64_t v9 = sub_100006034(v15);
    id v11 = [v13 initWithFormat:@"\n%@ is %@", v14, v9, v18];
  }
  id v16 = v11;
  puts((const char *)[v16 UTF8String]);
}

uint64_t sub_1000372A8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_100037A38(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = [v3 objectForKeyedSubscript:@"name"];
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v16 = +[NSAssertionHandler currentHandler];
      [v16 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"suggest_tool.m" lineNumber:1042 description:@"person name must be a string"];
    }
  }
  id v5 = [v3 objectForKeyedSubscript:@"handles"];
  if (!v5)
  {
    int v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"suggest_tool.m" lineNumber:1045 description:@"JSON key \"handles\" required for a person dict"];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"suggest_tool.m" lineNumber:1046 description:@"handles must be an array"];
  }
  if ([v5 count])
  {
    uint64_t v6 = [v5 firstObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      uint64_t v8 = +[NSAssertionHandler currentHandler];
      [v8 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"suggest_tool.m" lineNumber:1047 description:@"handles elements must be strings"];
    }
  }
  uint64_t v9 = [v3 objectForKeyedSubscript:@"handleIdentifier"];
  if (!v9)
  {
    uint64_t v14 = +[NSAssertionHandler currentHandler];
    [v14 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"suggest_tool.m" lineNumber:1049 description:@"JSON key \"handleIdentifier\" required for a person dict"];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v15 = +[NSAssertionHandler currentHandler];
    [v15 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"suggest_tool.m" lineNumber:1050 description:@"handleIdentifier must be a string (CNContactPropertyKey)"];
  }
  id v10 = [objc_alloc((Class)CSPerson) initWithDisplayName:v4 handles:v5 handleIdentifier:v9];

  return v10;
}

id sub_100037DE8(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 headersForKey:v4];
  uint64_t v6 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 40), "countForObject:", v4));

  [*(id *)(a1 + 40) addObject:v4];
  id v7 = [objc_alloc((Class)SGSimpleMailHeaderKeyValue) initWithKey:v4 value:v6];

  return v7;
}

intptr_t sub_1000383D0(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "sg_bestAlternativePart");
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = *(NSObject **)(a1 + 40);

  return dispatch_semaphore_signal(v5);
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3 = objc_opt_new();
  id v4 = +[NSProcessInfo processInfo];
  id v5 = [v4 arguments];

  uint64_t v58 = objc_opt_new();
  uint64_t v6 = (char *)[v5 count];
  if (v6)
  {
    id v7 = v6;
    for (int i = 0; i != v7; ++i)
    {
      uint64_t v9 = [v5 objectAtIndexedSubscript:i];
      if ([v9 hasPrefix:@"--"])
      {
        id v10 = v5;
        id v11 = v9;
        uint64_t v12 = 0;
        id v13 = (char *)[v11 UTF8String] + 2;
        while (strcmp(v13, (&off_100058C70)[v12]))
        {
          v12 += 3;
          if (v12 == 12)
          {
            id v53 = [objc_alloc((Class)NSString) initWithFormat:@"Unrecognized flag: %@", v11];
            puts((const char *)[v53 UTF8String]);

            _exit(1);
          }
        }
        uint64_t v14 = +[NSString stringWithUTF8String:v13];
        [v58 setObject:&__kCFBooleanTrue forKeyedSubscript:v14];

        id v5 = v10;
      }
      else
      {
        [v3 addObject:v9];
      }
    }
  }
  id v15 = v3;
  int v16 = [v15 count];
  id v17 = [v58 objectForKeyedSubscript:@"json"];

  if (v17) {
    byte_10006A7B8 = 1;
  }
  uint64_t v18 = [v58 objectForKeyedSubscript:@"js-only"];

  if (v18) {
    byte_10006A7B9 = 1;
  }
  id v19 = [v58 objectForKeyedSubscript:@"preprocess"];

  if (v19) {
    byte_10006A7BA = 1;
  }
  BOOL v20 = [v58 objectForKeyedSubscript:@"parse-html"];

  if (v20) {
    byte_10006A7BB = 1;
  }
  if (v16 < 2)
  {
    int v34 = 0;
    id v22 = v15;
  }
  else
  {
    id v21 = [v15 objectAtIndexedSubscript:1];
    id v22 = objc_msgSend(v15, "subarrayWithRange:", 2, (char *)objc_msgSend(v15, "count") - 2);

    id v23 = +[SGTools commands];
    id v24 = [v23 objectForKeyedSubscript:v21];
    if (v24) {
      goto LABEL_43;
    }
    dispatch_semaphore_t v54 = v5;
    double v55 = v22;
    id v25 = objc_opt_new();
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    double v26 = [v23 allKeys];
    id v27 = [v26 countByEnumeratingWithState:&v59 objects:v63 count:16];
    if (v27)
    {
      id v28 = v27;
      id v29 = v15;
      id v24 = 0;
      uint64_t v30 = *(void *)v60;
      do
      {
        for (uint64_t j = 0; j != v28; uint64_t j = (char *)j + 1)
        {
          if (*(void *)v60 != v30) {
            objc_enumerationMutation(v26);
          }
          uint64_t v32 = *(void **)(*((void *)&v59 + 1) + 8 * (void)j);
          if (![v32 caseInsensitiveCompare:v21])
          {
            [v25 addObject:v32];
            if ([v25 count] == (id)1)
            {
              uint64_t v33 = [v23 objectForKeyedSubscript:v32];
            }
            else
            {
              uint64_t v33 = 0;
            }

            id v24 = (void (**)(void, void))v33;
          }
        }
        id v28 = [v26 countByEnumeratingWithState:&v59 objects:v63 count:16];
      }
      while (v28);
    }
    else
    {
      id v29 = v15;
      id v24 = 0;
    }

    id v15 = v29;
    if ([v25 count])
    {
      id v46 = objc_alloc((Class)NSString);
      id v47 = objc_msgSend(v25, "_pas_componentsJoinedByString:", @", ");
      id v48 = [v46 initWithFormat:@"\n--- Unrecognized command '%@'. Case-insensitive matches: %@ ---\n", v21, v47];
      puts((const char *)[v48 UTF8String]);
    }
    id v5 = v54;
    id v22 = v55;
    if (v24)
    {
LABEL_43:
      id v45 = +[NSDate date];
      ((void (**)(void, void *))v24)[2](v24, v22);
      id v49 = __stderrp;
      [v45 timeIntervalSinceNow];
      fprintf(v49, "\nCompleted in %0.1fms\n", v50 * -1000.0);
      int v34 = 0;
LABEL_44:

      goto LABEL_45;
    }
    id v52 = [objc_alloc((Class)NSString) initWithFormat:@"\n--- I don't know what '%@' is ---\n", v21];
    puts((const char *)[v52 UTF8String]);

    int v34 = 1;
  }
  if (os_variant_has_internal_diagnostics())
  {
    double v56 = v22;
    id v35 = objc_alloc((Class)NSString);
    id v36 = +[SGTools helpStrings];
    uint64_t v37 = objc_msgSend(v36, "_pas_componentsJoinedByString:", @"\n");
    id v38 = [v35 initWithFormat:@"\nCommands: \n%@", v37];
    puts((const char *)[v38 UTF8String]);

    id v21 = objc_opt_new();
    for (uint64_t k = 0; k != 12; k += 3)
    {
      id v40 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"  --%-20s %s", (&off_100058C70)[k], (&off_100058C70)[k + 2]);
      [v21 addObject:v40];
    }
    id v41 = objc_alloc((Class)NSString);
    unsigned int v42 = objc_msgSend(v21, "_pas_componentsJoinedByString:", @"\n");
    id v43 = [v41 initWithFormat:@"\nFlags:\n%@", v42];
    puts((const char *)[v43 UTF8String]);

    id v44 = objc_alloc((Class)NSString);
    id v23 = sub_100006034(@"TAB COMPLETIONS:");
    sub_100006034(@"tabCompletions");
    id v24 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    id v45 = [v44 initWithFormat:@"\n%@ To enable commands TAB completions run this tool with %@ command\n", v23, v24];
    puts((const char *)[v45 UTF8String]);
    id v22 = v56;
    goto LABEL_44;
  }
LABEL_45:

  return v34;
}

void sub_1000396F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a54, 8);
  _Block_object_dispose(&a60, 8);
  _Block_object_dispose(&a64, 8);
  _Block_object_dispose(&a68, 8);
  _Block_object_dispose(&a72, 8);
  _Block_object_dispose(&STACK[0x218], 8);
  _Block_object_dispose(&STACK[0x238], 8);
  _Block_object_dispose(&STACK[0x258], 8);
  _Block_object_dispose(&STACK[0x278], 8);
  _Block_object_dispose(&STACK[0x298], 8);
  _Block_object_dispose(&STACK[0x2B8], 8);
  _Block_object_dispose(&STACK[0x2D8], 8);
  _Block_object_dispose(&STACK[0x2F8], 8);
  _Block_object_dispose(&STACK[0x318], 8);
  _Block_object_dispose((const void *)(v72 - 248), 8);
  _Block_object_dispose((const void *)(v72 - 216), 8);
  _Block_object_dispose((const void *)(v72 - 184), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000397D4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000397E4(uint64_t a1)
{
}

void sub_1000397EC(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100039910;
  v4[3] = &unk_10005AF30;
  long long v8 = *(_OWORD *)(a1 + 72);
  long long v9 = *(_OWORD *)(a1 + 88);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  long long v10 = *(_OWORD *)(a1 + 104);
  long long v11 = *(_OWORD *)(a1 + 120);
  long long v12 = *(_OWORD *)(a1 + 136);
  long long v13 = *(_OWORD *)(a1 + 152);
  long long v14 = *(_OWORD *)(a1 + 168);
  long long v15 = *(_OWORD *)(a1 + 184);
  uint64_t v16 = *(void *)(a1 + 200);
  long long v17 = *(_OWORD *)(a1 + 208);
  [v2 prepAndRunQuery:v3 onPrep:0 onRow:v4 onError:0];
}

uint64_t sub_100039910(void *a1, void *a2)
{
  id v3 = a2;
  id v62 = [v3 getIntegerForColumnName:"id" table:"data"];
  uint64_t v4 = [v3 getNSStringForColumnName:"subject" table:"data"];
  id v5 = (void *)v4;
  id v6 = &stru_10005B0F8;
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  id v66 = v6;

  long long v65 = [v3 getNSStringForColumnName:"body" table:"data"];
  uint64_t v7 = [v3 getNSStringForColumnName:"language" table:"data"];
  uint64_t v8 = *(void *)(a1[7] + 8);
  long long v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  if ((uint64_t)[v3 getIntegerForColumnName:"omittedRecipientWarnings_validation_level_id" table:"data"] >= 2)++*(void *)(*(void *)(a1[8] + 8) + 24); {
  if ((uint64_t)[v3 getIntegerForColumnName:"omittedAttachmentWarnings_validation_level_id" table:"data"] >= 2)++*(void *)(*(void *)(a1[9] + 8) + 24);
  }
  if ((uint64_t)[v3 getIntegerForColumnName:"followUpWarnings_validation_level_id" table:"data"] >= 2) {
    ++*(void *)(*(void *)(a1[10] + 8) + 24);
  }
  long long v10 = [v3 getNSStringForColumnName:"omittedRecipientWarnings" table:"data"];
  long long v11 = v10;
  if (!v10) {
    long long v10 = @"?";
  }
  unsigned int v59 = [(__CFString *)v10 characterAtIndex:0];

  long long v12 = [v3 getNSStringForColumnName:"omittedAttachmentWarnings" table:"data"];
  long long v13 = v12;
  if (!v12) {
    long long v12 = @"?";
  }
  unsigned int v60 = [(__CFString *)v12 characterAtIndex:0];

  id v64 = v3;
  long long v14 = [v3 getNSStringForColumnName:"followUpWarnings" table:"data"];
  long long v15 = v14;
  if (!v14) {
    long long v14 = @"?";
  }
  unsigned int v61 = [(__CFString *)v14 characterAtIndex:0];

  id v16 = [objc_alloc((Class)NSAttributedString) initWithString:v65];
  LOBYTE(v5_Block_object_dispose(&STACK[0x280], 8) = 1;
  long long v17 = +[SGMIOmissionAnalyzer identifyComposeWarningsFromSubject:v66 content:v16 toRecipients:&__NSArray0__struct ccRecipients:&__NSArray0__struct bccRecipients:&__NSArray0__struct originalToRecipients:0 originalCcRecipients:0 attachments:&__NSArray0__struct language:*(void *)(*(void *)(a1[7] + 8) + 40) store:a1[4] disableConservativeCheckRequirement:v58];

  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v18 = v17;
  id v19 = [v18 countByEnumeratingWithState:&v73 objects:v78 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v74;
    unsigned __int16 v67 = 78;
    id v68 = 0;
    do
    {
      for (int i = 0; i != v20; int i = (char *)i + 1)
      {
        if (*(void *)v74 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = *(void **)(*((void *)&v73 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v24 = a1;
          id v25 = (void *)a1[5];
          double v26 = [v23 core];
          id v27 = [v26 lowercaseString];
          LODWORD(v25) = [v25 containsObject:v27];

          if (v25)
          {
            id v28 = [v23 core];
            uint64_t v29 = [v28 lowercaseString];

            unsigned __int16 v67 = 89;
            id v68 = (void *)v29;
          }
          a1 = v24;
        }
      }
      id v20 = [v18 countByEnumeratingWithState:&v73 objects:v78 count:16];
    }
    while (v20);
  }
  else
  {
    unsigned __int16 v67 = 78;
    id v68 = 0;
  }

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v30 = v18;
  id v31 = [v30 countByEnumeratingWithState:&v69 objects:v77 count:16];
  if (v31)
  {
    id v32 = v31;
    uint64_t v33 = *(void *)v70;
    while (2)
    {
      for (uint64_t j = 0; j != v32; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v70 != v33) {
          objc_enumerationMutation(v30);
        }
        id v35 = *(void **)(*((void *)&v69 + 1) + 8 * (void)j);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (!v68
            || ([v35 core],
                id v36 = objc_claimAutoreleasedReturnValue(),
                [v36 lowercaseString],
                uint64_t v37 = objc_claimAutoreleasedReturnValue(),
                unsigned int v38 = [v37 containsString:v68],
                v37,
                v36,
                !v38))
          {
            int v41 = 0;
            int v39 = 1;
            uint64_t v40 = 89;
            goto LABEL_40;
          }
        }
      }
      id v32 = [v30 countByEnumeratingWithState:&v69 objects:v77 count:16];
      if (v32) {
        continue;
      }
      break;
    }
  }
  int v39 = 0;
  uint64_t v40 = 78;
  int v41 = 1;
LABEL_40:

  unsigned int v42 = +[SGMIFollowUpAnalyzer identifyFollowUpWarningFromSubject:v66 body:v65 date:0];
  id v43 = (void *)a1[6];
  id v44 = objc_alloc((Class)NSString);
  uint64_t v45 = 89;
  if (!v42) {
    uint64_t v45 = 78;
  }
  id v46 = objc_msgSend(v44, "initWithFormat:", @"%ld,%hu,%hu,%hu\n", v62, v67, v40, v45);
  [v43 appendString:v46];

  if (v59 != 63)
  {
    if (v67 == 78)
    {
      BOOL v47 = v59 == 78;
      id v48 = a1 + 14;
      id v49 = a1 + 13;
    }
    else
    {
      if (v67 != 89) {
        goto LABEL_51;
      }
      BOOL v47 = v59 == 89;
      id v48 = a1 + 12;
      id v49 = a1 + 11;
    }
    if (v47) {
      id v48 = v49;
    }
    ++*(void *)(*(void *)(*v48 + 8) + 24);
  }
LABEL_51:
  if (v60 == 63) {
    goto LABEL_60;
  }
  if (v39)
  {
    BOOL v50 = v60 == 89;
    id v51 = a1 + 16;
    id v52 = a1 + 15;
  }
  else
  {
    if (!v41) {
      goto LABEL_60;
    }
    BOOL v50 = v60 == 78;
    id v51 = a1 + 18;
    id v52 = a1 + 17;
  }
  if (v50) {
    id v51 = v52;
  }
  ++*(void *)(*(void *)(*v51 + 8) + 24);
LABEL_60:
  if (v61 != 63)
  {
    id v53 = a1 + 22;
    if (v61 == 78) {
      id v53 = a1 + 21;
    }
    dispatch_semaphore_t v54 = a1 + 20;
    if (v61 == 89) {
      dispatch_semaphore_t v54 = a1 + 19;
    }
    if (v42) {
      id v53 = v54;
    }
    ++*(void *)(*(void *)(*v53 + 8) + 24);
  }

  unint64_t v55 = ++*(void *)(*(void *)(a1[23] + 8) + 24);
  if (v55 && !(v55 % a1[24]))
  {
    mach_absolute_time();
    id v56 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Processed % 6ld records ┃% 6ld┆% 6ld│% 6ld┆% 6ld┃% 6ld┆% 6ld│% 6ld┆% 6ld┃% 6ld┆% 6ld│% 6ld┆% 6ld┃ %llu ms/record ", *(void *)(*(void *)(a1[23] + 8) + 24), *(void *)(*(void *)(a1[11] + 8) + 24), *(void *)(*(void *)(a1[12] + 8) + 24), *(void *)(*(void *)(a1[13] + 8) + 24), *(void *)(*(void *)(a1[14] + 8) + 24), *(void *)(*(void *)(a1[15] + 8) + 24), *(void *)(*(void *)(a1[16] + 8) + 24), *(void *)(*(void *)(a1[17] + 8) + 24), *(void *)(*(void *)(a1[18] + 8) + 24), *(void *)(*(void *)(a1[19] + 8) + 24), *(void *)(*(void *)(a1[20] + 8) + 24), *(void *)(*(void *)(a1[21] + 8) + 24), *(void *)(*(void *)(a1[22] + 8) + 24), SGMachTimeToNanoseconds() / (unint64_t)(1000000 * *(void *)(*(void *)(a1[23] + 8) + 24)));
    puts((const char *)[v56 UTF8String]);
  }
  return _PASSqliteDatabaseKeepGoing;
}

BOOL sub_10003A1D8(id a1)
{
  return 1;
}

void sub_10003AA74(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003AB98;
  v12[3] = &unk_10005AEA0;
  id v13 = (id)objc_opt_new();
  id v7 = v13;
  [v5 enumerateKeysAndObjectsUsingBlock:v12];

  uint64_t v8 = *(void **)(a1 + 32);
  id v9 = objc_alloc((Class)NSString);
  long long v10 = objc_msgSend(v7, "_pas_componentsJoinedByString:", @",\n");
  id v11 = [v9 initWithFormat:@"  \"%@\": {\n%@\n  },\n", v6, v10];

  [v8 appendString:v11];
}

void sub_10003AB98(uint64_t a1, void *a2, void *a3)
{
  id v18 = a3;
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = objc_alloc((Class)NSString);
    id v8 = [v18 objectForKeyedSubscript:@"salientCount"];
    id v9 = [v8 unsignedIntValue];
    long long v10 = [v18 objectForKeyedSubscript:@"regularCount"];
    id v11 = [v7 initWithFormat:@"    \"%@\": {\"salientCount\": %u, \"regularCount\": %u}", v5, v9, objc_msgSend(v10, "unsignedIntValue")];

    [v6 addObject:v11];
  }
  else
  {
    id v8 = v18;
    long long v12 = [v8 firstObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      long long v14 = &stru_10005AE38;
    }
    else {
      long long v14 = &stru_10005AE78;
    }
    long long v10 = objc_msgSend(v8, "_pas_mappedArrayWithTransform:", v14);
    long long v15 = *(void **)(a1 + 32);
    id v16 = objc_alloc((Class)NSString);
    objc_msgSend(v10, "_pas_componentsJoinedByString:", @", ");
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    id v17 = [v16 initWithFormat:@"    \"%@\": [%@]", v5, v11];

    [v15 addObject:v17];
  }
}

NSString *__cdecl sub_10003AD5C(id a1, NSString *a2)
{
  uint64_t v2 = a2;
  id v3 = [objc_alloc((Class)NSString) initWithFormat:@"\"%@\"", v2];

  return (NSString *)v3;
}

NSString *__cdecl sub_10003ADC4(id a1, NSNumber *a2)
{
  return [(NSNumber *)a2 stringValue];
}

void sub_10003B928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_10003B96C(uint64_t a1, void *a2)
{
  signed int v3 = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  uint64_t v4 = +[SGMIFeature prettyName:](SGMIFeature, "prettyName:", (int)[a2 intValue]);
  signed int v5 = [v4 length];

  if (v3 <= v5) {
    signed int v6 = v5;
  }
  else {
    signed int v6 = v3;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v6;
}

void sub_10003BF70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

void sub_10003BFBC(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v22 = a2;
  [*(id *)(a1 + 32) setObject:&off_100064C98 atIndexedSubscript:a3];
  uint64_t v7 = +[SGMISaliencyModel getSaliencyOutputOf:*(void *)(a1 + 40) forArray:*(void *)(a1 + 32)];
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  long long v10 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (!v10)
  {
    uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
    long long v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = @"MLModel inference failed.";

    *a4 = 1;
    long long v10 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  }
  [v10 salientScore];
  double v14 = v13;
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) regularScore];
  if (fabs(v14 + v15) > 0.001)
  {
    id v16 = objc_alloc((Class)NSString);
    id v17 = +[SGMIFeature prettyName:](SGMIFeature, "prettyName:", (int)[v22 intValue]);
    id v18 = [v16 initWithFormat:@"MLModel has asymetric weights for salient and regular of feature %@,likely due to a random init of weights at training time.", v17];
    uint64_t v19 = *(void *)(*(void *)(a1 + 64) + 8);
    id v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

    *a4 = 1;
  }
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) salientScore];
  uint64_t v21 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [*(id *)(a1 + 48) setObject:v21 forKeyedSubscript:v22];

  [*(id *)(a1 + 32) setObject:&off_100064C80 atIndexedSubscript:a3];
}

void sub_10003C184(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  [*(id *)(a1 + 32) setObject:&off_100064C98 atIndexedSubscript:a3];
  if (a3)
  {
    uint64_t v8 = +[SGMISaliencyModel getSaliencyOutputOf:*(void *)(a1 + 40) forArray:*(void *)(a1 + 32)];
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    long long v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
      long long v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = @"MLModel inference failed.";

      *a4 = 1;
    }
    double v13 = [*(id *)(a1 + 48) objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
    [v13 floatValue];
    float v15 = v14;
    id v16 = [*(id *)(a1 + 48) objectForKeyedSubscript:v7];
    [v16 floatValue];
    double v18 = (float)(v15 + v17);
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) salientScore];
    double v20 = vabdd_f64(v18, v19);

    if (v20 > 0.001)
    {
      id v21 = objc_alloc((Class)NSString);
      uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      id v23 = +[SGMIFeature prettyName:](SGMIFeature, "prettyName:", (int)[v7 intValue]);
      id v24 = [v21 initWithFormat:@"MLModel doesn't seems linear for the sum of the one-hot encoded %@ & %@,features.", v22, v23];
      uint64_t v25 = *(void *)(*(void *)(a1 + 64) + 8);
      double v26 = *(void **)(v25 + 40);
      *(void *)(v25 + 40) = v24;

      *a4 = 1;
    }
    [*(id *)(a1 + 32) setObject:&off_100064C80 atIndexedSubscript:a3 - 1];
  }
  uint64_t v27 = *(void *)(*(void *)(a1 + 72) + 8);
  id v28 = *(void **)(v27 + 40);
  *(void *)(v27 + 40) = v7;
}

void sub_10003CCE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a65, 8);
  _Unwind_Resume(a1);
}

void sub_10003CD48(uint64_t a1, void *a2)
{
  signed int v3 = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  uint64_t v4 = +[SGMIFeature prettyName:](SGMIFeature, "prettyName:", (int)[a2 intValue]);
  signed int v5 = [v4 length];

  if (v3 <= v5) {
    signed int v6 = v5;
  }
  else {
    signed int v6 = v3;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v6;
}

CFArrayRef CFPreferencesCopyKeyList(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyKeyList(applicationID, userName, hostName);
}

CFDictionaryRef CFPreferencesCopyMultiple(CFArrayRef keysToFetch, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyMultiple(keysToFetch, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopRun(void)
{
}

unint64_t CFStringConvertEncodingToNSStringEncoding(CFStringEncoding encoding)
{
  return _CFStringConvertEncodingToNSStringEncoding(encoding);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return _CFStringCreateWithBytes(alloc, bytes, numBytes, encoding, isExternalRepresentation);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return _CFStringGetCharactersPtr(theString);
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSRange v4 = _NSIntersectionRange(range1, range2);
  NSUInteger length = v4.length;
  NSUInteger location = v4.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

void NSLog(NSString *format, ...)
{
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t SGEntityTypeDescription()
{
  return _SGEntityTypeDescription();
}

uint64_t SGExtractionTypeDescription()
{
  return _SGExtractionTypeDescription();
}

uint64_t SGMachTimeToNanoseconds()
{
  return _SGMachTimeToNanoseconds();
}

uint64_t SGNormalizeEmailAddress()
{
  return _SGNormalizeEmailAddress();
}

uint64_t SGNormalizeName()
{
  return _SGNormalizeName();
}

uint64_t SGNormalizePhoneNumber()
{
  return _SGNormalizePhoneNumber();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFProcessPath()
{
  return __CFProcessPath();
}

uint64_t _PASMurmur3_x86_32()
{
  return __PASMurmur3_x86_32();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _exit(int a1)
{
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
  return _arc4random();
}

int asprintf(char **a1, const char *a2, ...)
{
  return _asprintf(a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

Ivar *__cdecl class_copyIvarList(Class cls, unsigned int *outCount)
{
  return _class_copyIvarList(cls, outCount);
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return _class_copyPropertyList(cls, outCount);
}

const char *__cdecl class_getName(Class cls)
{
  return _class_getName(cls);
}

Class class_getSuperclass(Class cls)
{
  return _class_getSuperclass(cls);
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return _crc32(crc, buf, len);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int feof(FILE *a1)
{
  return _feof(a1);
}

int ferror(FILE *a1)
{
  return _ferror(a1);
}

int fileno(FILE *a1)
{
  return _fileno(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fread(__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fscanf(FILE *a1, const char *a2, ...)
{
  return _fscanf(a1, a2);
}

int fseeko(FILE *__stream, off_t a2, int __whence)
{
  return _fseeko(__stream, a2, __whence);
}

off_t ftello(FILE *__stream)
{
  return _ftello(__stream);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return _getenv(a1);
}

ssize_t getline(char **__linep, size_t *__linecapp, FILE *__stream)
{
  return _getline(__linep, __linecapp, __stream);
}

char *getlogin(void)
{
  return _getlogin();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return _getpwnam(a1);
}

uid_t getuid(void)
{
  return _getuid();
}

int inflate(z_streamp strm, int flush)
{
  return _inflate(strm, flush);
}

int inflateEnd(z_streamp strm)
{
  return _inflateEnd(strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return _inflateInit2_(strm, windowBits, version, stream_size);
}

int isatty(int a1)
{
  return _isatty(a1);
}

const char *__cdecl ivar_getName(Ivar v)
{
  return _ivar_getName(v);
}

float logf(float a1)
{
  return _logf(a1);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

id object_getIvar(id a1, Ivar a2)
{
  return _object_getIvar(a1, a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

int posix_spawn(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return _posix_spawn(a1, a2, a3, a4, __argv, __envp);
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return _property_getName(property);
}

int putchar(int a1)
{
  return _putchar(a1);
}

int puts(const char *a1)
{
  return _puts(a1);
}

qos_class_t qos_class_self(void)
{
  return _qos_class_self();
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return _reallocf(__ptr, __size);
}

int setuid(uid_t a1)
{
  return _setuid(a1);
}

uint64_t sgEventsLogHandle()
{
  return _sgEventsLogHandle();
}

uint64_t sgLogHandle()
{
  return _sgLogHandle();
}

uint64_t sgMailIntelligenceLogHandle()
{
  return _sgMailIntelligenceLogHandle();
}

uint64_t sgMap()
{
  return _sgMap();
}

uint64_t sgRemindersLogHandle()
{
  return _sgRemindersLogHandle();
}

uint64_t sgShuffledArrayFrom()
{
  return _sgShuffledArrayFrom();
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return _sqlite3_column_count(pStmt);
}

uint64_t sqlite3_column_nsstring()
{
  return _sqlite3_column_nsstring();
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return _waitpid(a1, a2, a3);
}

id objc_msgSend_EventMLRegexEnsembleExtractionEnabled(void *a1, const char *a2, ...)
{
  return [a1 EventMLRegexEnsembleExtractionEnabled];
}

id objc_msgSend_HTMLContentData(void *a1, const char *a2, ...)
{
  return [a1 HTMLContentData];
}

id objc_msgSend_HTMLContentDataNoCopy(void *a1, const char *a2, ...)
{
  return [a1 HTMLContentDataNoCopy];
}

id objc_msgSend_URLByResolvingSymlinksInPath(void *a1, const char *a2, ...)
{
  return [a1 URLByResolvingSymlinksInPath];
}

id objc_msgSend_URLQueryAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 URLQueryAllowedCharacterSet];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return [a1 address];
}

id objc_msgSend_allFeatureNames(void *a1, const char *a2, ...)
{
  return [a1 allFeatureNames];
}

id objc_msgSend_allHeaderKeys(void *a1, const char *a2, ...)
{
  return [a1 allHeaderKeys];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allowAgeBasedPruning(void *a1, const char *a2, ...)
{
  return [a1 allowAgeBasedPruning];
}

id objc_msgSend_allowAnyDomainForMarkup(void *a1, const char *a2, ...)
{
  return [a1 allowAnyDomainForMarkup];
}

id objc_msgSend_allowUnverifiedSourceForMarkup(void *a1, const char *a2, ...)
{
  return [a1 allowUnverifiedSourceForMarkup];
}

id objc_msgSend_alphanumericCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 alphanumericCharacterSet];
}

id objc_msgSend_alwaysShowCancelledEvents(void *a1, const char *a2, ...)
{
  return [a1 alwaysShowCancelledEvents];
}

id objc_msgSend_annotationType(void *a1, const char *a2, ...)
{
  return [a1 annotationType];
}

id objc_msgSend_annotationTypeUniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 annotationTypeUniqueIdentifier];
}

id objc_msgSend_arguments(void *a1, const char *a2, ...)
{
  return [a1 arguments];
}

id objc_msgSend_asset(void *a1, const char *a2, ...)
{
  return [a1 asset];
}

id objc_msgSend_assetId(void *a1, const char *a2, ...)
{
  return [a1 assetId];
}

id objc_msgSend_assetVersion(void *a1, const char *a2, ...)
{
  return [a1 assetVersion];
}

id objc_msgSend_attachmentFilename(void *a1, const char *a2, ...)
{
  return [a1 attachmentFilename];
}

id objc_msgSend_attachments(void *a1, const char *a2, ...)
{
  return [a1 attachments];
}

id objc_msgSend_attributeSet(void *a1, const char *a2, ...)
{
  return [a1 attributeSet];
}

id objc_msgSend_attributeSetCoder(void *a1, const char *a2, ...)
{
  return [a1 attributeSetCoder];
}

id objc_msgSend_attributeSetData(void *a1, const char *a2, ...)
{
  return [a1 attributeSetData];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return [a1 attributes];
}

id objc_msgSend_authorEmailAddresses(void *a1, const char *a2, ...)
{
  return [a1 authorEmailAddresses];
}

id objc_msgSend_authors(void *a1, const char *a2, ...)
{
  return [a1 authors];
}

id objc_msgSend_bcc(void *a1, const char *a2, ...)
{
  return [a1 bcc];
}

id objc_msgSend_beSameUserAsSuggestd(void *a1, const char *a2, ...)
{
  return [a1 beSameUserAsSuggestd];
}

id objc_msgSend_bestAssetVersionObserved(void *a1, const char *a2, ...)
{
  return [a1 bestAssetVersionObserved];
}

id objc_msgSend_birthday(void *a1, const char *a2, ...)
{
  return [a1 birthday];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_bundleId(void *a1, const char *a2, ...)
{
  return [a1 bundleId];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_capitalizedString(void *a1, const char *a2, ...)
{
  return [a1 capitalizedString];
}

id objc_msgSend_category(void *a1, const char *a2, ...)
{
  return [a1 category];
}

id objc_msgSend_cc(void *a1, const char *a2, ...)
{
  return [a1 cc];
}

id objc_msgSend_clearMailIntelligence(void *a1, const char *a2, ...)
{
  return [a1 clearMailIntelligence];
}

id objc_msgSend_closeFile(void *a1, const char *a2, ...)
{
  return [a1 closeFile];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_commands(void *a1, const char *a2, ...)
{
  return [a1 commands];
}

id objc_msgSend_compatibilityVersion(void *a1, const char *a2, ...)
{
  return [a1 compatibilityVersion];
}

id objc_msgSend_completionCommands(void *a1, const char *a2, ...)
{
  return [a1 completionCommands];
}

id objc_msgSend_confidence(void *a1, const char *a2, ...)
{
  return [a1 confidence];
}

id objc_msgSend_contact(void *a1, const char *a2, ...)
{
  return [a1 contact];
}

id objc_msgSend_contactStore(void *a1, const char *a2, ...)
{
  return [a1 contactStore];
}

id objc_msgSend_contextSnippet(void *a1, const char *a2, ...)
{
  return [a1 contextSnippet];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_core(void *a1, const char *a2, ...)
{
  return [a1 core];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_counts(void *a1, const char *a2, ...)
{
  return [a1 counts];
}

id objc_msgSend_createNewSearchableItem(void *a1, const char *a2, ...)
{
  return [a1 createNewSearchableItem];
}

id objc_msgSend_creationDate(void *a1, const char *a2, ...)
{
  return [a1 creationDate];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_cursor(void *a1, const char *a2, ...)
{
  return [a1 cursor];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_dateFormat(void *a1, const char *a2, ...)
{
  return [a1 dateFormat];
}

id objc_msgSend_dateSent(void *a1, const char *a2, ...)
{
  return [a1 dateSent];
}

id objc_msgSend_dbHandleForTesting(void *a1, const char *a2, ...)
{
  return [a1 dbHandleForTesting];
}

id objc_msgSend_dbStats(void *a1, const char *a2, ...)
{
  return [a1 dbStats];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return [a1 debugDescription];
}

id objc_msgSend_decayedScore(void *a1, const char *a2, ...)
{
  return [a1 decayedScore];
}

id objc_msgSend_defaultConfig(void *a1, const char *a2, ...)
{
  return [a1 defaultConfig];
}

id objc_msgSend_defaultInstance(void *a1, const char *a2, ...)
{
  return [a1 defaultInstance];
}

id objc_msgSend_defaultLogger(void *a1, const char *a2, ...)
{
  return [a1 defaultLogger];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultModel(void *a1, const char *a2, ...)
{
  return [a1 defaultModel];
}

id objc_msgSend_defaultPath(void *a1, const char *a2, ...)
{
  return [a1 defaultPath];
}

id objc_msgSend_defaultSnippetPath(void *a1, const char *a2, ...)
{
  return [a1 defaultSnippetPath];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_defaultsForTests(void *a1, const char *a2, ...)
{
  return [a1 defaultsForTests];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_detectReminders(void *a1, const char *a2, ...)
{
  return [a1 detectReminders];
}

id objc_msgSend_detectStructuredEventsML(void *a1, const char *a2, ...)
{
  return [a1 detectStructuredEventsML];
}

id objc_msgSend_dictRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictRepresentation];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_disabledEventUpdateCategories(void *a1, const char *a2, ...)
{
  return [a1 disabledEventUpdateCategories];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return [a1 distantFuture];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return [a1 distantPast];
}

id objc_msgSend_documentDate(void *a1, const char *a2, ...)
{
  return [a1 documentDate];
}

id objc_msgSend_documentIdentifier(void *a1, const char *a2, ...)
{
  return [a1 documentIdentifier];
}

id objc_msgSend_documentTimeInterval(void *a1, const char *a2, ...)
{
  return [a1 documentTimeInterval];
}

id objc_msgSend_documentTitle(void *a1, const char *a2, ...)
{
  return [a1 documentTitle];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_dueDateComponents(void *a1, const char *a2, ...)
{
  return [a1 dueDateComponents];
}

id objc_msgSend_dueLocation(void *a1, const char *a2, ...)
{
  return [a1 dueLocation];
}

id objc_msgSend_dueLocationTrigger(void *a1, const char *a2, ...)
{
  return [a1 dueLocationTrigger];
}

id objc_msgSend_dueLocationType(void *a1, const char *a2, ...)
{
  return [a1 dueLocationType];
}

id objc_msgSend_duplicateKey(void *a1, const char *a2, ...)
{
  return [a1 duplicateKey];
}

id objc_msgSend_emailAddress(void *a1, const char *a2, ...)
{
  return [a1 emailAddress];
}

id objc_msgSend_emailAddresses(void *a1, const char *a2, ...)
{
  return [a1 emailAddresses];
}

id objc_msgSend_emailHeaders(void *a1, const char *a2, ...)
{
  return [a1 emailHeaders];
}

id objc_msgSend_enableDKIMEnforcement(void *a1, const char *a2, ...)
{
  return [a1 enableDKIMEnforcement];
}

id objc_msgSend_end(void *a1, const char *a2, ...)
{
  return [a1 end];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return [a1 endDate];
}

id objc_msgSend_endTimeZone(void *a1, const char *a2, ...)
{
  return [a1 endTimeZone];
}

id objc_msgSend_enrichments(void *a1, const char *a2, ...)
{
  return [a1 enrichments];
}

id objc_msgSend_entityType(void *a1, const char *a2, ...)
{
  return [a1 entityType];
}

id objc_msgSend_event(void *a1, const char *a2, ...)
{
  return [a1 event];
}

id objc_msgSend_eventCategoryToEntityTagMapping(void *a1, const char *a2, ...)
{
  return [a1 eventCategoryToEntityTagMapping];
}

id objc_msgSend_externalKey(void *a1, const char *a2, ...)
{
  return [a1 externalKey];
}

id objc_msgSend_extractedEventCancellation(void *a1, const char *a2, ...)
{
  return [a1 extractedEventCancellation];
}

id objc_msgSend_extractionInfo(void *a1, const char *a2, ...)
{
  return [a1 extractionInfo];
}

id objc_msgSend_extractionType(void *a1, const char *a2, ...)
{
  return [a1 extractionType];
}

id objc_msgSend_familyName(void *a1, const char *a2, ...)
{
  return [a1 familyName];
}

id objc_msgSend_featureName(void *a1, const char *a2, ...)
{
  return [a1 featureName];
}

id objc_msgSend_featureNames(void *a1, const char *a2, ...)
{
  return [a1 featureNames];
}

id objc_msgSend_feedbackDescription(void *a1, const char *a2, ...)
{
  return [a1 feedbackDescription];
}

id objc_msgSend_fileAttributes(void *a1, const char *a2, ...)
{
  return [a1 fileAttributes];
}

id objc_msgSend_fileHandleForReading(void *a1, const char *a2, ...)
{
  return [a1 fileHandleForReading];
}

id objc_msgSend_fileHandleWithStandardInput(void *a1, const char *a2, ...)
{
  return [a1 fileHandleWithStandardInput];
}

id objc_msgSend_first(void *a1, const char *a2, ...)
{
  return [a1 first];
}

id objc_msgSend_firstName(void *a1, const char *a2, ...)
{
  return [a1 firstName];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_firstname(void *a1, const char *a2, ...)
{
  return [a1 firstname];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_formattedText(void *a1, const char *a2, ...)
{
  return [a1 formattedText];
}

id objc_msgSend_foundInEvent(void *a1, const char *a2, ...)
{
  return [a1 foundInEvent];
}

id objc_msgSend_freezeObservers(void *a1, const char *a2, ...)
{
  return [a1 freezeObservers];
}

id objc_msgSend_from(void *a1, const char *a2, ...)
{
  return [a1 from];
}

id objc_msgSend_fromPerson(void *a1, const char *a2, ...)
{
  return [a1 fromPerson];
}

id objc_msgSend_fullName(void *a1, const char *a2, ...)
{
  return [a1 fullName];
}

id objc_msgSend_geocodeAddress(void *a1, const char *a2, ...)
{
  return [a1 geocodeAddress];
}

id objc_msgSend_geocodeAirportCode(void *a1, const char *a2, ...)
{
  return [a1 geocodeAirportCode];
}

id objc_msgSend_geocodeHandle(void *a1, const char *a2, ...)
{
  return [a1 geocodeHandle];
}

id objc_msgSend_geocodeLabel(void *a1, const char *a2, ...)
{
  return [a1 geocodeLabel];
}

id objc_msgSend_geocodeLatitude(void *a1, const char *a2, ...)
{
  return [a1 geocodeLatitude];
}

id objc_msgSend_geocodeLongitude(void *a1, const char *a2, ...)
{
  return [a1 geocodeLongitude];
}

id objc_msgSend_getEntityStore(void *a1, const char *a2, ...)
{
  return [a1 getEntityStore];
}

id objc_msgSend_getRecipientsFilter(void *a1, const char *a2, ...)
{
  return [a1 getRecipientsFilter];
}

id objc_msgSend_givenName(void *a1, const char *a2, ...)
{
  return [a1 givenName];
}

id objc_msgSend_globallyUniqueString(void *a1, const char *a2, ...)
{
  return [a1 globallyUniqueString];
}

id objc_msgSend_groundTruthEstimatorRules(void *a1, const char *a2, ...)
{
  return [a1 groundTruthEstimatorRules];
}

id objc_msgSend_groundTruthVersion(void *a1, const char *a2, ...)
{
  return [a1 groundTruthVersion];
}

id objc_msgSend_groupIdentifier(void *a1, const char *a2, ...)
{
  return [a1 groupIdentifier];
}

id objc_msgSend_handle(void *a1, const char *a2, ...)
{
  return [a1 handle];
}

id objc_msgSend_handles(void *a1, const char *a2, ...)
{
  return [a1 handles];
}

id objc_msgSend_harvestBudgetCPUTimeSeconds(void *a1, const char *a2, ...)
{
  return [a1 harvestBudgetCPUTimeSeconds];
}

id objc_msgSend_harvestBudgetNumberOfOperations(void *a1, const char *a2, ...)
{
  return [a1 harvestBudgetNumberOfOperations];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_headerData(void *a1, const char *a2, ...)
{
  return [a1 headerData];
}

id objc_msgSend_headers(void *a1, const char *a2, ...)
{
  return [a1 headers];
}

id objc_msgSend_helpStrings(void *a1, const char *a2, ...)
{
  return [a1 helpStrings];
}

id objc_msgSend_htmlBody(void *a1, const char *a2, ...)
{
  return [a1 htmlBody];
}

id objc_msgSend_htmlContentData(void *a1, const char *a2, ...)
{
  return [a1 htmlContentData];
}

id objc_msgSend_htmlData(void *a1, const char *a2, ...)
{
  return [a1 htmlData];
}

id objc_msgSend_htmlParser(void *a1, const char *a2, ...)
{
  return [a1 htmlParser];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_inferenceVersion(void *a1, const char *a2, ...)
{
  return [a1 inferenceVersion];
}

id objc_msgSend_initForBuilding(void *a1, const char *a2, ...)
{
  return [a1 initForBuilding];
}

id objc_msgSend_insertSuggestedEventCalendar(void *a1, const char *a2, ...)
{
  return [a1 insertSuggestedEventCalendar];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_introspection(void *a1, const char *a2, ...)
{
  return [a1 introspection];
}

id objc_msgSend_invert(void *a1, const char *a2, ...)
{
  return [a1 invert];
}

id objc_msgSend_isAllDay(void *a1, const char *a2, ...)
{
  return [a1 isAllDay];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return [a1 isMainThread];
}

id objc_msgSend_isReminderMetadata(void *a1, const char *a2, ...)
{
  return [a1 isReminderMetadata];
}

id objc_msgSend_isSalient(void *a1, const char *a2, ...)
{
  return [a1 isSalient];
}

id objc_msgSend_journal(void *a1, const char *a2, ...)
{
  return [a1 journal];
}

id objc_msgSend_jsonFormattedAccuracyStats(void *a1, const char *a2, ...)
{
  return [a1 jsonFormattedAccuracyStats];
}

id objc_msgSend_jsonFormattedStats(void *a1, const char *a2, ...)
{
  return [a1 jsonFormattedStats];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_lastName(void *a1, const char *a2, ...)
{
  return [a1 lastName];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_launch(void *a1, const char *a2, ...)
{
  return [a1 launch];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_loadAllPrecomputedContactMatches(void *a1, const char *a2, ...)
{
  return [a1 loadAllPrecomputedContactMatches];
}

id objc_msgSend_loadAllSerializedContacts(void *a1, const char *a2, ...)
{
  return [a1 loadAllSerializedContacts];
}

id objc_msgSend_locale(void *a1, const char *a2, ...)
{
  return [a1 locale];
}

id objc_msgSend_localeAsset(void *a1, const char *a2, ...)
{
  return [a1 localeAsset];
}

id objc_msgSend_localeAssetIdentifier(void *a1, const char *a2, ...)
{
  return [a1 localeAssetIdentifier];
}

id objc_msgSend_localizedApplicationName(void *a1, const char *a2, ...)
{
  return [a1 localizedApplicationName];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_locations(void *a1, const char *a2, ...)
{
  return [a1 locations];
}

id objc_msgSend_loggedExtractionsDescription(void *a1, const char *a2, ...)
{
  return [a1 loggedExtractionsDescription];
}

id objc_msgSend_loggedInteractionsDescription(void *a1, const char *a2, ...)
{
  return [a1 loggedInteractionsDescription];
}

id objc_msgSend_loggedInteractionsSummaryDescription(void *a1, const char *a2, ...)
{
  return [a1 loggedInteractionsSummaryDescription];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mailCount(void *a1, const char *a2, ...)
{
  return [a1 mailCount];
}

id objc_msgSend_mailMessage(void *a1, const char *a2, ...)
{
  return [a1 mailMessage];
}

id objc_msgSend_matchFoundInBCC(void *a1, const char *a2, ...)
{
  return [a1 matchFoundInBCC];
}

id objc_msgSend_matchTokens(void *a1, const char *a2, ...)
{
  return [a1 matchTokens];
}

id objc_msgSend_matchedDetails(void *a1, const char *a2, ...)
{
  return [a1 matchedDetails];
}

id objc_msgSend_mean(void *a1, const char *a2, ...)
{
  return [a1 mean];
}

id objc_msgSend_messageBodyIfAvailable(void *a1, const char *a2, ...)
{
  return [a1 messageBodyIfAvailable];
}

id objc_msgSend_messageId(void *a1, const char *a2, ...)
{
  return [a1 messageId];
}

id objc_msgSend_messageUnits(void *a1, const char *a2, ...)
{
  return [a1 messageUnits];
}

id objc_msgSend_messagesToProcessImmediately(void *a1, const char *a2, ...)
{
  return [a1 messagesToProcessImmediately];
}

id objc_msgSend_middleName(void *a1, const char *a2, ...)
{
  return [a1 middleName];
}

id objc_msgSend_middlename(void *a1, const char *a2, ...)
{
  return [a1 middlename];
}

id objc_msgSend_migrateDatabases(void *a1, const char *a2, ...)
{
  return [a1 migrateDatabases];
}

id objc_msgSend_mimeBody(void *a1, const char *a2, ...)
{
  return [a1 mimeBody];
}

id objc_msgSend_mimePart(void *a1, const char *a2, ...)
{
  return [a1 mimePart];
}

id objc_msgSend_minCountToConsiderATokenAsExtremelyDiscriminant(void *a1, const char *a2, ...)
{
  return [a1 minCountToConsiderATokenAsExtremelyDiscriminant];
}

id objc_msgSend_minCountToConsiderATokenAsHighlyDiscriminant(void *a1, const char *a2, ...)
{
  return [a1 minCountToConsiderATokenAsHighlyDiscriminant];
}

id objc_msgSend_modelVersion(void *a1, const char *a2, ...)
{
  return [a1 modelVersion];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_namesForDetailCaches(void *a1, const char *a2, ...)
{
  return [a1 namesForDetailCaches];
}

id objc_msgSend_naturalLanguageEventTypeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 naturalLanguageEventTypeIdentifier];
}

id objc_msgSend_nonFeedbackFlagDescription(void *a1, const char *a2, ...)
{
  return [a1 nonFeedbackFlagDescription];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_numericValue(void *a1, const char *a2, ...)
{
  return [a1 numericValue];
}

id objc_msgSend_onlyShowSignificantNLEvents(void *a1, const char *a2, ...)
{
  return [a1 onlyShowSignificantNLEvents];
}

id objc_msgSend_onlyShowSignificantPseudoContacts(void *a1, const char *a2, ...)
{
  return [a1 onlyShowSignificantPseudoContacts];
}

id objc_msgSend_opaqueKey(void *a1, const char *a2, ...)
{
  return [a1 opaqueKey];
}

id objc_msgSend_origin(void *a1, const char *a2, ...)
{
  return [a1 origin];
}

id objc_msgSend_output(void *a1, const char *a2, ...)
{
  return [a1 output];
}

id objc_msgSend_parentURL(void *a1, const char *a2, ...)
{
  return [a1 parentURL];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_performDatabaseCheck(void *a1, const char *a2, ...)
{
  return [a1 performDatabaseCheck];
}

id objc_msgSend_performIntegrityCheck(void *a1, const char *a2, ...)
{
  return [a1 performIntegrityCheck];
}

id objc_msgSend_performIntegrityCheckOnly(void *a1, const char *a2, ...)
{
  return [a1 performIntegrityCheckOnly];
}

id objc_msgSend_phoneNumber(void *a1, const char *a2, ...)
{
  return [a1 phoneNumber];
}

id objc_msgSend_phones(void *a1, const char *a2, ...)
{
  return [a1 phones];
}

id objc_msgSend_postalAddresses(void *a1, const char *a2, ...)
{
  return [a1 postalAddresses];
}

id objc_msgSend_powerState(void *a1, const char *a2, ...)
{
  return [a1 powerState];
}

id objc_msgSend_preferredEncoding(void *a1, const char *a2, ...)
{
  return [a1 preferredEncoding];
}

id objc_msgSend_prefix(void *a1, const char *a2, ...)
{
  return [a1 prefix];
}

id objc_msgSend_prepareForQuery(void *a1, const char *a2, ...)
{
  return [a1 prepareForQuery];
}

id objc_msgSend_prettyNamesReverseMapping(void *a1, const char *a2, ...)
{
  return [a1 prettyNamesReverseMapping];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_provider(void *a1, const char *a2, ...)
{
  return [a1 provider];
}

id objc_msgSend_queryMetaDataSync(void *a1, const char *a2, ...)
{
  return [a1 queryMetaDataSync];
}

id objc_msgSend_range(void *a1, const char *a2, ...)
{
  return [a1 range];
}

id objc_msgSend_ratioToConsiderATokenAsExtremelyDiscriminant(void *a1, const char *a2, ...)
{
  return [a1 ratioToConsiderATokenAsExtremelyDiscriminant];
}

id objc_msgSend_ratioToConsiderATokenAsHighlyDiscriminant(void *a1, const char *a2, ...)
{
  return [a1 ratioToConsiderATokenAsHighlyDiscriminant];
}

id objc_msgSend_rawData(void *a1, const char *a2, ...)
{
  return [a1 rawData];
}

id objc_msgSend_readCurrentFile(void *a1, const char *a2, ...)
{
  return [a1 readCurrentFile];
}

id objc_msgSend_readDataToEndOfFile(void *a1, const char *a2, ...)
{
  return [a1 readDataToEndOfFile];
}

id objc_msgSend_receivedAt(void *a1, const char *a2, ...)
{
  return [a1 receivedAt];
}

id objc_msgSend_receivedFromHandle(void *a1, const char *a2, ...)
{
  return [a1 receivedFromHandle];
}

id objc_msgSend_recordId(void *a1, const char *a2, ...)
{
  return [a1 recordId];
}

id objc_msgSend_regularScore(void *a1, const char *a2, ...)
{
  return [a1 regularScore];
}

id objc_msgSend_reminderMetadata(void *a1, const char *a2, ...)
{
  return [a1 reminderMetadata];
}

id objc_msgSend_remindersTestingPipeline(void *a1, const char *a2, ...)
{
  return [a1 remindersTestingPipeline];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeDeprecatedDefaults(void *a1, const char *a2, ...)
{
  return [a1 removeDeprecatedDefaults];
}

id objc_msgSend_removeFromList(void *a1, const char *a2, ...)
{
  return [a1 removeFromList];
}

id objc_msgSend_removeSuggestedEventCalendar(void *a1, const char *a2, ...)
{
  return [a1 removeSuggestedEventCalendar];
}

id objc_msgSend_reportDbStats(void *a1, const char *a2, ...)
{
  return [a1 reportDbStats];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_resetAllPreferences(void *a1, const char *a2, ...)
{
  return [a1 resetAllPreferences];
}

id objc_msgSend_resetLogs(void *a1, const char *a2, ...)
{
  return [a1 resetLogs];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return [a1 results];
}

id objc_msgSend_saliencyOverrideRules(void *a1, const char *a2, ...)
{
  return [a1 saliencyOverrideRules];
}

id objc_msgSend_salientScore(void *a1, const char *a2, ...)
{
  return [a1 salientScore];
}

id objc_msgSend_score(void *a1, const char *a2, ...)
{
  return [a1 score];
}

id objc_msgSend_second(void *a1, const char *a2, ...)
{
  return [a1 second];
}

id objc_msgSend_sender(void *a1, const char *a2, ...)
{
  return [a1 sender];
}

id objc_msgSend_senderDomain(void *a1, const char *a2, ...)
{
  return [a1 senderDomain];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return [a1 service];
}

id objc_msgSend_serviceForContacts(void *a1, const char *a2, ...)
{
  return [a1 serviceForContacts];
}

id objc_msgSend_serviceForDeliveries(void *a1, const char *a2, ...)
{
  return [a1 serviceForDeliveries];
}

id objc_msgSend_serviceForEvents(void *a1, const char *a2, ...)
{
  return [a1 serviceForEvents];
}

id objc_msgSend_serviceForFides(void *a1, const char *a2, ...)
{
  return [a1 serviceForFides];
}

id objc_msgSend_serviceForInternal(void *a1, const char *a2, ...)
{
  return [a1 serviceForInternal];
}

id objc_msgSend_serviceForIpsos(void *a1, const char *a2, ...)
{
  return [a1 serviceForIpsos];
}

id objc_msgSend_serviceForMail(void *a1, const char *a2, ...)
{
  return [a1 serviceForMail];
}

id objc_msgSend_serviceForMessages(void *a1, const char *a2, ...)
{
  return [a1 serviceForMessages];
}

id objc_msgSend_serviceForReminders(void *a1, const char *a2, ...)
{
  return [a1 serviceForReminders];
}

id objc_msgSend_serviceForSpotlightKnowledge(void *a1, const char *a2, ...)
{
  return [a1 serviceForSpotlightKnowledge];
}

id objc_msgSend_serviceForURLs(void *a1, const char *a2, ...)
{
  return [a1 serviceForURLs];
}

id objc_msgSend_sessionStats(void *a1, const char *a2, ...)
{
  return [a1 sessionStats];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shortValue(void *a1, const char *a2, ...)
{
  return [a1 shortValue];
}

id objc_msgSend_showOperatingSystemVersionInSnippets(void *a1, const char *a2, ...)
{
  return [a1 showOperatingSystemVersionInSnippets];
}

id objc_msgSend_showPastEvents(void *a1, const char *a2, ...)
{
  return [a1 showPastEvents];
}

id objc_msgSend_signature(void *a1, const char *a2, ...)
{
  return [a1 signature];
}

id objc_msgSend_significance(void *a1, const char *a2, ...)
{
  return [a1 significance];
}

id objc_msgSend_skipDescendants(void *a1, const char *a2, ...)
{
  return [a1 skipDescendants];
}

id objc_msgSend_snippet(void *a1, const char *a2, ...)
{
  return [a1 snippet];
}

id objc_msgSend_snippetsDbHandleForTesting(void *a1, const char *a2, ...)
{
  return [a1 snippetsDbHandleForTesting];
}

id objc_msgSend_socialProfiles(void *a1, const char *a2, ...)
{
  return [a1 socialProfiles];
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return [a1 source];
}

id objc_msgSend_sqlStoreInMemory(void *a1, const char *a2, ...)
{
  return [a1 sqlStoreInMemory];
}

id objc_msgSend_standardizeCSPersons(void *a1, const char *a2, ...)
{
  return [a1 standardizeCSPersons];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return [a1 startDate];
}

id objc_msgSend_startTimeZone(void *a1, const char *a2, ...)
{
  return [a1 startTimeZone];
}

id objc_msgSend_std(void *a1, const char *a2, ...)
{
  return [a1 std];
}

id objc_msgSend_store(void *a1, const char *a2, ...)
{
  return [a1 store];
}

id objc_msgSend_storeAge(void *a1, const char *a2, ...)
{
  return [a1 storeAge];
}

id objc_msgSend_strictLowerBound(void *a1, const char *a2, ...)
{
  return [a1 strictLowerBound];
}

id objc_msgSend_strictUpperBound(void *a1, const char *a2, ...)
{
  return [a1 strictUpperBound];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringByExpandingTildeInPath(void *a1, const char *a2, ...)
{
  return [a1 stringByExpandingTildeInPath];
}

id objc_msgSend_stringByStandardizingPath(void *a1, const char *a2, ...)
{
  return [a1 stringByStandardizingPath];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_subModelsStats(void *a1, const char *a2, ...)
{
  return [a1 subModelsStats];
}

id objc_msgSend_subject(void *a1, const char *a2, ...)
{
  return [a1 subject];
}

id objc_msgSend_subtype(void *a1, const char *a2, ...)
{
  return [a1 subtype];
}

id objc_msgSend_suffix(void *a1, const char *a2, ...)
{
  return [a1 suffix];
}

id objc_msgSend_suggestionsDirectory(void *a1, const char *a2, ...)
{
  return [a1 suggestionsDirectory];
}

id objc_msgSend_superclass(void *a1, const char *a2, ...)
{
  return [a1 superclass];
}

id objc_msgSend_surname(void *a1, const char *a2, ...)
{
  return [a1 surname];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_taggedCharacterRanges(void *a1, const char *a2, ...)
{
  return [a1 taggedCharacterRanges];
}

id objc_msgSend_tags(void *a1, const char *a2, ...)
{
  return [a1 tags];
}

id objc_msgSend_teamId(void *a1, const char *a2, ...)
{
  return [a1 teamId];
}

id objc_msgSend_teamIdentifier(void *a1, const char *a2, ...)
{
  return [a1 teamIdentifier];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_textContent(void *a1, const char *a2, ...)
{
  return [a1 textContent];
}

id objc_msgSend_textContentLanguageIdentifier(void *a1, const char *a2, ...)
{
  return [a1 textContentLanguageIdentifier];
}

id objc_msgSend_threshold(void *a1, const char *a2, ...)
{
  return [a1 threshold];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeZone(void *a1, const char *a2, ...)
{
  return [a1 timeZone];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_to(void *a1, const char *a2, ...)
{
  return [a1 to];
}

id objc_msgSend_toLightJson(void *a1, const char *a2, ...)
{
  return [a1 toLightJson];
}

id objc_msgSend_topLevelPart(void *a1, const char *a2, ...)
{
  return [a1 topLevelPart];
}

id objc_msgSend_trackingNumber(void *a1, const char *a2, ...)
{
  return [a1 trackingNumber];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifier];
}

id objc_msgSend_unsignedCharValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedCharValue];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_useMLModelForContacts(void *a1, const char *a2, ...)
{
  return [a1 useMLModelForContacts];
}

id objc_msgSend_useManateeSaltForHistory(void *a1, const char *a2, ...)
{
  return [a1 useManateeSaltForHistory];
}

id objc_msgSend_userIdentifier(void *a1, const char *a2, ...)
{
  return [a1 userIdentifier];
}

id objc_msgSend_userVersion(void *a1, const char *a2, ...)
{
  return [a1 userVersion];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_vector(void *a1, const char *a2, ...)
{
  return [a1 vector];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_waitUntilExit(void *a1, const char *a2, ...)
{
  return [a1 waitUntilExit];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceAndNewlineCharacterSet];
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceCharacterSet];
}

id objc_msgSend_writeToFile_atomically_encoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:encoding:error:");
}