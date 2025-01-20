uint64_t CONV_UTF8ToUnistr255(unsigned __int8 *a1, uint64_t a2, _WORD *a3)
{
  unsigned __int16 *v4;
  uint64_t v5;
  signed int v7;
  unint64_t v8;
  char *v9;
  unsigned __int16 *v10;
  unsigned __int8 *v11;
  unint64_t v12;
  unsigned int v13;
  uint64_t v14;
  int v15;
  unsigned int v16;
  int v17;
  int v18;
  int v19;
  unsigned int v20;
  uint64_t v21;
  int v22;
  int v23;
  int v24;
  unsigned __int16 v25;
  unsigned __int16 v26;
  int v27;
  char *v28;
  unsigned __int16 v29;
  char *v30;
  uint64_t v31;
  unsigned int v32;
  char *v33;
  char *v34;
  uint64_t v35;
  char *v36;
  unint64_t v37;
  int v38;
  char *v39;
  unsigned __int16 *v40;
  uint64_t v41;
  unsigned __int16 *v42;
  unsigned int v43;
  uint64_t result;
  uint64_t v45;
  signed int v46;

  v4 = a3 + 1;
  if (!a2)
  {
    result = 0;
    LODWORD(v10) = a3 + 2;
    goto LABEL_92;
  }
  v5 = a2;
  v7 = 0;
  v8 = (unint64_t)(a3 + 256);
  v9 = (char *)&unk_100013538;
  v10 = a3 + 1;
  do
  {
    v11 = a1;
    while (1)
    {
      v13 = *a1++;
      v12 = v13;
      if (!v13) {
        goto LABEL_88;
      }
      if ((unint64_t)v10 >= v8)
      {
LABEL_91:
        result = 63;
        goto LABEL_92;
      }
      --v5;
      if ((v12 & 0x80) == 0)
      {
        v46 = v7;
        if (v5) {
          goto LABEL_34;
        }
        if (v12 == 32)
        {
          LOWORD(v12) = -4056;
        }
        else
        {
          if (v12 != 46)
          {
LABEL_34:
            if (v12 > 0x1F)
            {
              v27 = byte_100013148[(v12 - 32)];
              if (v27 != v12) {
                LOWORD(v12) = v27 | 0xF000;
              }
            }
            else
            {
              LOWORD(v12) = v12 | 0xF000;
            }
            goto LABEL_42;
          }
          LOWORD(v12) = -4055;
        }
LABEL_42:
        v28 = v9;
        v29 = v12;
        goto LABEL_43;
      }
      v14 = utf_extrabytes[v12 >> 3];
      if ((v14 & 0x80000000) != 0 || (int)v5 < (int)v14) {
        goto LABEL_27;
      }
      v5 -= v14;
      if (v14 == 3)
      {
        v17 = *a1;
        if ((v17 & 0xC0) == 0x80)
        {
          v18 = v11[2];
          if ((v18 & 0xC0) == 0x80)
          {
            v19 = v11[3];
            if ((v19 & 0xC0) == 0x80)
            {
              v20 = v19 + (((v17 << 6) + (v12 << 12) + v18) << 6) - 63512704;
              if (!(v20 >> 20))
              {
                *v10 = (v20 >> 10) - 10240;
                if ((unint64_t)(v10 + 1) >= v8)
                {
                  result = 63;
                  LODWORD(v10) = v10 + 2;
                  goto LABEL_92;
                }
                a1 = v11 + 4;
                v10[1] = v20 & 0x3FF | 0xDC00;
                v21 = 2;
                goto LABEL_31;
              }
            }
          }
        }
        goto LABEL_27;
      }
      if (v14 != 2)
      {
        if (v14 != 1)
        {
          result = 22;
          goto LABEL_92;
        }
        v15 = *a1;
        if ((v15 & 0xC0) == 0x80)
        {
          v16 = v15 + (v12 << 6) - 12416;
          if (v16 >= 0x80)
          {
            v30 = v9;
            v31 = 2;
            goto LABEL_51;
          }
        }
        goto LABEL_27;
      }
      v22 = *a1;
      if ((v22 & 0xC0) == 0x80)
      {
        v23 = v11[2];
        if ((v23 & 0xC0) == 0x80)
        {
          v24 = (v22 << 6) + (v12 << 12) + v23;
          v16 = v24 - 925824;
          if ((v24 - 925824) >= 0x800
            && (v16 >> 11 < 0x1B || v16 >= 0xE000 && (v24 & 0x3FFFFE) != 0xF207E))
          {
            break;
          }
        }
      }
LABEL_27:
      if ((unint64_t)(v10 + 2) >= v8) {
        goto LABEL_91;
      }
      v25 = hexdigits[v12 >> 4];
      v26 = hexdigits[v12 & 0xF];
      *v10 = 37;
      if ((int)v14 <= 0) {
        v14 = 0;
      }
      v5 += v14;
      v10[1] = v25;
      v10[2] = v26;
      v21 = 3;
LABEL_31:
      v10 += v21;
      v11 = a1;
      if (!v5) {
        goto LABEL_88;
      }
    }
    v30 = v9;
    v31 = 3;
LABEL_51:
    v46 = v7;
    if (v10 == v4)
    {
      v10 = v4;
      goto LABEL_82;
    }
    v45 = v31;
    if (!sub_1000042EC((unsigned __int16)v16)) {
      goto LABEL_81;
    }
    v32 = *(v10 - 1);
    if ((unsigned __int16)(v16 - 4449) > 0x61u)
    {
      if ((unsigned __int16)(v16 - 12443) < 0xD265u) {
        goto LABEL_81;
      }
    }
    else
    {
      if ((unsigned __int16)((unsigned __int16)v16 >> 1) <= 0x8BAu && (unsigned __int16)(v32 - 4352) <= 0x12u)
      {
        LOWORD(v32) = 588 * v32 + 28 * v16 - 18076;
LABEL_57:
        v31 = v45;
        goto LABEL_58;
      }
      if ((unsigned __int16)((unsigned __int16)v16 >> 3) >= 0x235u
        && (unsigned __int16)((unsigned __int16)(v32 + 21504) >> 2) <= 0xAE8u)
      {
        HIDWORD(v37) = -1227133513 * v32 - 1840706560;
        LODWORD(v37) = HIDWORD(v37);
        if ((v37 >> 2) <= 0x9249249)
        {
          LOWORD(v32) = v16 + v32 - 4519;
          goto LABEL_57;
        }
LABEL_81:
        v31 = v45;
        goto LABEL_82;
      }
    }
    v33 = v30 + 416;
    v34 = v30;
    while (2)
    {
      v35 = (v33 - v34) >> 4;
      v36 = &v34[8 * v35];
      if (*(_DWORD *)v36 > (unsigned __int16)v16)
      {
        v33 = v36 - 8;
        goto LABEL_67;
      }
      if (*(_DWORD *)v36 < (unsigned __int16)v16)
      {
        v34 = v36 + 8;
LABEL_67:
        if (v34 > v33) {
          goto LABEL_81;
        }
        continue;
      }
      break;
    }
    v38 = *(_DWORD *)&v34[8 * v35 + 4];
    if (!v38) {
      goto LABEL_81;
    }
    v39 = (char *)&unk_1000136E0 + 4 * (unsigned __int16)v38;
    if (*(unsigned __int16 *)v39 > v32) {
      goto LABEL_81;
    }
    v40 = (unsigned __int16 *)&v39[4 * HIWORD(v38) - 4];
    if (*v40 < v32) {
      goto LABEL_81;
    }
    while (2)
    {
      v41 = ((char *)v40 - v39) >> 3;
      v42 = (unsigned __int16 *)&v39[4 * v41];
      v43 = *v42;
      if (v43 > v32)
      {
        v40 = v42 - 2;
        goto LABEL_80;
      }
      if (v43 < v32)
      {
        v39 = (char *)(v42 + 2);
LABEL_80:
        if (v39 > (char *)v40) {
          goto LABEL_81;
        }
        continue;
      }
      break;
    }
    v32 = *(unsigned __int16 *)&v39[4 * v41 + 2];
    v31 = v45;
    if (!v32) {
      goto LABEL_82;
    }
LABEL_58:
    v16 = (unsigned __int16)v32;
    --v10;
LABEL_82:
    v28 = v30;
    a1 = &v11[v31];
    if (v16 == 9216) {
      v29 = 0;
    }
    else {
      v29 = v16;
    }
LABEL_43:
    if (sub_1000042EC(v29))
    {
      v7 = v46 + 1;
      v9 = v28;
    }
    else
    {
      v9 = v28;
      if (v46 >= 2)
      {
        sub_10000434C(&v10[-v46], v46);
        v9 = v28;
      }
      v7 = 0;
    }
    *v10++ = v29;
  }
  while (v5);
LABEL_88:
  if (v7 >= 2) {
    sub_10000434C(&v10[-v7], v7);
  }
  result = 0;
LABEL_92:
  *a3 = (v10 - v4) >> 1;
  return result;
}

uint64_t sub_1000042EC(unsigned int a1)
{
  if (a1 < 0x300) {
    return 0;
  }
  int v1 = byte_1000131B8[(unint64_t)a1 >> 8];
  if (!byte_1000131B8[(unint64_t)a1 >> 8]) {
    return 0;
  }
  if (v1 == 255) {
    return 1;
  }
  return (byte_1000131B8[(a1 >> 3) + 256 + 32 * v1 - 32] >> (a1 & 7)) & 1;
}

_WORD *sub_10000434C(_WORD *result, unsigned int a2)
{
  do
  {
    if (byte_100014534[(unint64_t)(unsigned __int16)*result >> 8]) {
      unsigned int v2 = byte_100014534[256 * (unint64_t)byte_100014534[(unint64_t)(unsigned __int16)*result >> 8]
    }
                        + *result];
    else {
      unsigned int v2 = 0;
    }
    if (a2 < 2) {
      break;
    }
    int v3 = 0;
    v4 = result + 1;
    do
    {
      unint64_t v5 = (unsigned __int16)*v4;
      uint64_t v6 = byte_100014534[v5 >> 8];
      if (byte_100014534[v5 >> 8]) {
        LODWORD(v6) = byte_100014534[256 * v6 + *v4];
      }
      if (v2 > v6)
      {
        __int16 v7 = *(v4 - 1);
        *(v4 - 1) = v5;
        _WORD *v4 = v7;
        int v3 = 1;
      }
      ++v4;
      unsigned int v2 = v6;
    }
    while (v4 < &result[a2]);
  }
  while (v3);
  return result;
}

uint64_t CONV_Unistr255ToUTF8(_WORD *a1, unsigned char *a2, uint64_t a3)
{
  int v3 = a2;
  int v4 = (unsigned __int16)*a1;
  if (*a1)
  {
    int v5 = 0;
    uint64_t v6 = 0;
    unsigned int v7 = 0;
    unint64_t v8 = (unint64_t)&a2[a3 - 1];
    v9 = a1 + 1;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          while (1)
          {
            --v4;
            if (v5 < 1)
            {
              unsigned int v12 = *v9++;
              unint64_t v10 = v12;
              if (v12 >= 0xC0uLL)
              {
                int v13 = byte_100015A34[v10 >> 8];
                if (byte_100015A34[v10 >> 8])
                {
                  if (v13 == 255
                    || ((byte_100015A34[(v10 >> 3) + 256 + 32 * v13 - 32] >> (v10 & 7)) & 1) != 0)
                  {
                    unsigned __int16 v14 = v10 + 21504;
                    if ((unsigned __int16)(v10 + 21504) > 0x2BA4u)
                    {
                      int v16 = sub_1000048E0(v10, &v24);
                      LODWORD(v10) = v24;
                    }
                    else
                    {
                      __int16 v15 = (unsigned __int16)(v10 + 21504) % 0x1Cu;
                      LODWORD(v10) = ((28533 * (unsigned __int16)(v10 + 21504)) >> 24) | 0x1100;
                      unsigned __int16 v24 = ((28533 * v14) >> 24) | 0x1100;
                      v25[0] = v14 % 0x24Cu / 0x1C + 4449;
                      if (v14 % 0x1Cu)
                      {
                        v25[1] = v15 + 4519;
                        int v16 = 3;
                      }
                      else
                      {
                        int v16 = 2;
                      }
                    }
                    int v5 = v16 - 1;
                    v4 += v16 - 1;
                    uint64_t v6 = v25;
                  }
                }
              }
            }
            else
            {
              int v11 = *v6++;
              LODWORD(v10) = v11;
              --v5;
            }
            if (v10) {
              unsigned int v17 = v10;
            }
            else {
              unsigned int v17 = 9216;
            }
            if (v10 == 47)
            {
              unsigned int v7 = 22;
              unsigned int v17 = 95;
            }
            if (v17 > 0x7F) {
              break;
            }
            if ((unint64_t)v3 >= v8) {
              goto LABEL_49;
            }
            *v3++ = v17;
            if (!v4) {
              goto LABEL_51;
            }
          }
          if (v17 > 0x7FF) {
            break;
          }
          if ((unint64_t)(v3 + 1) >= v8) {
            goto LABEL_49;
          }
          *int v3 = (v17 >> 6) | 0xC0;
          v3[1] = v17 & 0x3F | 0x80;
          v3 += 2;
          if (!v4) {
            goto LABEL_51;
          }
        }
        if (v17 > 0xFFFD)
        {
          unsigned int v7 = 22;
          goto LABEL_51;
        }
        if (v17 >> 10 != 54 || v4 == 0) {
          break;
        }
        int v19 = *v9;
        if ((v19 & 0xFC00) == 0xDC00)
        {
          if ((unint64_t)(v3 + 3) >= v8) {
            goto LABEL_49;
          }
          unsigned int v20 = v19 + (v17 << 10) - 56613888;
          --v4;
          ++v9;
          *int v3 = (v20 >> 18) | 0xF0;
          v3[1] = (v20 >> 12) & 0x3F | 0x80;
          v3[2] = (v20 >> 6) & 0x3F | 0x80;
          v3[3] = v19 & 0x3F | 0x80;
          v3 += 4;
          if (!v4) {
            goto LABEL_51;
          }
        }
        else
        {
          unsigned int v21 = v17 >> 6;
          LOBYTE(v22) = 13;
LABEL_45:
          if ((unint64_t)(v3 + 2) >= v8)
          {
LABEL_49:
            unsigned int v7 = 63;
            goto LABEL_51;
          }
          *int v3 = v22 | 0xE0;
          v3[1] = v21 & 0x3F | 0x80;
          v3[2] = v17 & 0x3F | 0x80;
          v3 += 3;
          if (!v4) {
            goto LABEL_51;
          }
        }
      }
      if ((v17 & 0xFFC0) != 0xF000 || (v17 & 0x3F) >= 0x2B)
      {
        unsigned int v21 = v17 >> 6;
        unsigned int v22 = v17 >> 12;
        goto LABEL_45;
      }
      if ((unint64_t)v3 >= v8) {
        goto LABEL_49;
      }
      *v3++ = byte_100017B5C[v17 & 0x3F];
      if (!v4) {
        goto LABEL_51;
      }
    }
  }
  unsigned int v7 = 0;
LABEL_51:
  *int v3 = 0;
  return v7;
}

_WORD *CONV_Unistr255ToUpperCase(_WORD *result, uint64_t a2)
{
  uint64_t v2 = (unsigned __int16)*result;
  if (*result)
  {
    unint64_t v3 = *(void *)(a2 + 2056);
    int v4 = result + 1;
    do
    {
      unint64_t v5 = (unsigned __int16)*v4;
      if (v3 > v5) {
        _WORD *v4 = *(_WORD *)(*(void *)(a2 + 2048) + 2 * v5);
      }
      ++v4;
      --v2;
    }
    while (v2);
  }
  return result;
}

uint64_t CONV_UnistrUTF8ToUpperCase(char *a1, unsigned char *a2, uint64_t a3)
{
  uint64_t result = 22;
  if (a1 && a2)
  {
    unsigned int v7 = malloc_type_malloc(0x200uLL, 0x10000407EBBDD04uLL);
    if (v7)
    {
      unint64_t v8 = v7;
      size_t v9 = strlen(a1);
      CONV_UTF8ToUnistr255((unsigned __int8 *)a1, v9, v8);
      uint64_t v10 = (unsigned __int16)*v8;
      if (*v8)
      {
        unint64_t v11 = *(void *)(a3 + 2056);
        unsigned int v12 = v8 + 1;
        do
        {
          unint64_t v13 = (unsigned __int16)*v12;
          if (v11 > v13) {
            *unsigned int v12 = *(_WORD *)(*(void *)(a3 + 2048) + 2 * v13);
          }
          ++v12;
          --v10;
        }
        while (v10);
      }
      CONV_Unistr255ToUTF8(v8, a2, 766);
      free(v8);
      return 0;
    }
    else
    {
      return 12;
    }
  }
  return result;
}

uint64_t CONV_GetCurrentTime(timespec *__tp)
{
  return clock_gettime(_CLOCK_REALTIME, __tp);
}

char *CONV_DuplicateName(char *result, char *__s)
{
  *(void *)uint64_t result = 0;
  if (__s)
  {
    unint64_t v3 = result;
    size_t v4 = strlen(__s) + 1;
    uint64_t result = (char *)malloc_type_malloc(v4, 0x446E67DFuLL);
    *(void *)unint64_t v3 = result;
    if (result)
    {
      return (char *)strlcpy(result, __s, v4);
    }
  }
  return result;
}

uint64_t sub_1000048E0(unsigned int a1, _WORD *a2)
{
  uint64_t v2 = a2;
  if ((unsigned __int16)(a1 + 1201) < 0x571u)
  {
LABEL_8:
    unsigned int v8 = 0;
    goto LABEL_9;
  }
  unint64_t v3 = (unsigned __int16 *)&unk_100015D74;
  size_t v4 = (unsigned __int16 *)&unk_100016C98;
  while (1)
  {
    uint64_t v5 = ((char *)v4 - (char *)v3) >> 3;
    uint64_t v6 = &v3[2 * v5];
    unsigned int v7 = *v6;
    if (v7 <= a1) {
      break;
    }
    size_t v4 = v6 - 2;
LABEL_7:
    if (v3 > v4) {
      goto LABEL_8;
    }
  }
  if (v7 < a1)
  {
    unint64_t v3 = v6 + 2;
    goto LABEL_7;
  }
  unsigned int v8 = v3[2 * v5 + 1];
LABEL_9:
  int v9 = (v8 >> 12) & 7;
  __int16 v15 = v8 & 0xFFF;
  uint64_t v10 = (char *)&unk_100016C9C + 2 * (v8 & 0xFFF);
  unint64_t v11 = (unsigned __int16 *)&v15;
  if (v9 != 1) {
    unint64_t v11 = (unsigned __int16 *)((char *)&unk_100016C9C + 2 * (v8 & 0xFFF));
  }
  if ((v8 & 0x8000) == 0)
  {
    LODWORD(result) = 0;
    goto LABEL_17;
  }
  uint64_t result = sub_1000048E0(*v11, a2);
  if (result)
  {
    --v9;
    unint64_t v13 = &v15;
    if (v9) {
      unint64_t v13 = (__int16 *)v10;
    }
    unint64_t v11 = (unsigned __int16 *)(v13 + 1);
    v2 += result;
LABEL_17:
    for (uint64_t result = (result + v9); v9; --v9)
    {
      __int16 v14 = *v11++;
      *v2++ = v14;
    }
  }
  return result;
}

BOOL memory_pressure_recent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = MEMORY[0xFFFFFC030];
  if (debug) {
    BOOL v9 = MEMORY[0xFFFFFC030] == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    v11[0] = ctx;
    v11[1] = *(_OWORD *)&qword_100110C10;
    uint64_t v12 = qword_100110C20;
    fsck_printf((uint64_t)v11, (uint64_t)"vm.memory_pressure = %u\n", a3, a4, a5, a6, a7, a8, MEMORY[0xFFFFFC030]);
  }
  return v8 != 0;
}

uint64_t memory_pressure_current()
{
  unsigned int v11 = 0;
  size_t v12 = 4;
  int v6 = sysctlbyname("vm.page_free_wanted", &v11, &v12, 0, 0);
  uint64_t result = 0;
  if (!v6)
  {
    uint64_t result = v11;
    if (debug) {
      BOOL v8 = v11 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (!v8)
    {
      v9[0] = ctx;
      v9[1] = *(_OWORD *)&qword_100110C10;
      uint64_t v10 = qword_100110C20;
      fsck_printf((uint64_t)v9, (uint64_t)"vm.page_free_wanted = %u\n", v0, v1, v2, v3, v4, v5, v11);
      return v11;
    }
  }
  return result;
}

void fsck_exfat_cache_init()
{
  uint64_t v5 = 0;
  size_t v6 = 8;
  if (sysctlbyname("hw.pagesize", &v5, &v6, 0, 0)) {
    sub_100010B64();
  }
  dword_1000244B8 = v5;
  active_list = 0;
  qword_100110AD0 = (uint64_t)&active_list;
  aged_list = 0;
  qword_100110AE0 = (uint64_t)&aged_list;
  qword_100110AF0 = (uint64_t)&free_list;
  uint64_t v0 = &unk_1000244C0;
  bzero(&unk_1000244C0, 0xEA600uLL);
  uint64_t v1 = 0;
  uint64_t v2 = 20000;
  do
  {
    v0[2] = v1;
    uint64_t v3 = (char *)(v0 + 2);
    if (v1) {
      uint64_t v4 = v1 + 3;
    }
    else {
      uint64_t v4 = &qword_100110AF0;
    }
    uint64_t *v4 = (uint64_t)v3;
    v0[3] = &free_list;
    uint64_t v1 = v0;
    v0 += 6;
    --v2;
  }
  while (v2);
  free_list = (uint64_t)(v3 - 16);
  dword_10010EAC0 = 0;
}

void fsck_exfat_cache_dispose()
{
  uint64_t v0 = (void **)&qword_1000244C8;
  uint64_t v1 = 20000;
  do
  {
    if (*v0)
    {
      free(*v0);
      *uint64_t v0 = 0;
    }
    v0 += 6;
    --v1;
  }
  while (v1);
}

uint64_t fsck_exfat_cache_write(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (debug)
  {
    uint64_t v9 = *(void *)a1;
    v15[0] = ctx;
    v15[1] = *(_OWORD *)&qword_100110C10;
    uint64_t v16 = qword_100110C20;
    fsck_printf((uint64_t)v15, (uint64_t)"Write     offset = 0x%012llx  length = 0x%06x\n", a3, a4, a5, a6, a7, a8, v9);
  }
  ssize_t v10 = pwrite(g, *(const void **)(a1 + 8), *(unsigned int *)(a1 + 32), *(void *)a1);
  uint64_t v11 = *(unsigned int *)(a1 + 32);
  if (v10 == v11) {
    return 0;
  }
  off_t v13 = *(void *)a1;
  __int16 v14 = __error();
  warn("Couldn't write %zu bytes at offset %lld, errno %d", v11, v13, *v14);
  return 1;
}

uint64_t fsck_exfat_cache_evict(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a2) {
    sub_100010B80();
  }
  if (!*(void *)(a2 + 8)) {
    sub_100010BAC();
  }
  if (!*(void *)a2) {
    sub_100010BD8();
  }
  if (!*(_DWORD *)(a2 + 32)) {
    sub_100010C04();
  }
  if (*(_DWORD *)(a2 + 36)) {
    sub_100010C30();
  }
  if (*(unsigned char *)(a2 + 40) && fsck_exfat_cache_write(a2, a2, a3, a4, a5, a6, a7, a8)) {
    return 1;
  }
  if (a1)
  {
    uint64_t v11 = *(void *)(a2 + 16);
    size_t v12 = *(void **)(a2 + 24);
    if (v11)
    {
      *(void *)(v11 + 24) = v12;
      size_t v12 = *(void **)(a2 + 24);
    }
    else
    {
      *(void *)(a1 + 8) = v12;
    }
    *size_t v12 = v11;
  }
  free(*(void **)(a2 + 8));
  uint64_t result = 0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  uint64_t v13 = free_list;
  *(void *)(a2 + 16) = free_list;
  __int16 v14 = (uint64_t *)(v13 + 24);
  BOOL v15 = v13 == 0;
  free_list = a2;
  uint64_t v16 = &qword_100110AF0;
  if (!v15) {
    uint64_t v16 = v14;
  }
  *uint64_t v16 = a2 + 16;
  *(void *)(a2 + 24) = &free_list;
  return result;
}

uint64_t fsck_exfat_cache_recycle(unsigned int a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *a2 = 0;
  if (!a1)
  {
    uint64_t result = free_list;
    if (free_list)
    {
LABEL_3:
      if (*(void *)(result + 8)) {
        sub_100010CE0();
      }
      if (*(void *)result) {
        sub_100010CB4();
      }
      if (*(_DWORD *)(result + 32)) {
        sub_100010C88();
      }
      if (*(_DWORD *)(result + 36)) {
        sub_100010C5C();
      }
      uint64_t v11 = *(void *)(result + 16);
      size_t v12 = *(void **)(result + 24);
      if (v11)
      {
        *(void *)(v11 + 24) = v12;
        size_t v12 = *(void **)(result + 24);
      }
      else
      {
        qword_100110AF0 = *(void *)(result + 24);
      }
      *size_t v12 = v11;
      return result;
    }
  }
  uint64_t v13 = **(void **)(qword_100110AE0 + 8);
  if (!v13)
  {
    unsigned int v15 = 0;
    int v14 = 0;
LABEL_22:
    uint64_t v19 = **(void **)(qword_100110AD0 + 8);
    if (v19)
    {
      do
      {
        if (!*(void *)(v19 + 8)) {
          sub_100010D0C();
        }
        if (!*(void *)v19) {
          sub_100010D38();
        }
        int v20 = *(_DWORD *)(v19 + 32);
        if (!v20) {
          sub_100010D64();
        }
        uint64_t v21 = **(void **)(*(void *)(v19 + 24) + 8);
        if (!*(_DWORD *)(v19 + 36))
        {
          int v18 = fsck_exfat_cache_evict((uint64_t)&active_list, v19, a3, a4, a5, a6, a7, a8);
          if (v18) {
            goto LABEL_37;
          }
          ++v14;
          v15 += v20;
          if (v15 >= a1) {
            break;
          }
        }
        uint64_t v19 = v21;
      }
      while (v21);
    }
LABEL_30:
    if (v15)
    {
      uint64_t v22 = ++dword_10010EAC0;
      if (debug)
      {
        v24[0] = ctx;
        v24[1] = *(_OWORD *)&qword_100110C10;
        uint64_t v25 = qword_100110C20;
        fsck_printf((uint64_t)v24, (uint64_t)"--- [%d] Evicted %d buffers (%u bytes; %u pages)\n",
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v22);
      }
    }
    if (*a2) {
      return 0;
    }
    uint64_t result = free_list;
    if (!free_list)
    {
      int v23 = 12;
      goto LABEL_38;
    }
    goto LABEL_3;
  }
  int v14 = 0;
  unsigned int v15 = 0;
  while (1)
  {
    if (!*(void *)(v13 + 8)) {
      sub_100010D90();
    }
    if (!*(void *)v13) {
      sub_100010DBC();
    }
    int v16 = *(_DWORD *)(v13 + 32);
    if (!v16) {
      sub_100010DE8();
    }
    uint64_t v17 = **(void **)(*(void *)(v13 + 24) + 8);
    if (!*(_DWORD *)(v13 + 36)) {
      break;
    }
LABEL_17:
    uint64_t v13 = v17;
    if (!v17) {
      goto LABEL_22;
    }
  }
  int v18 = fsck_exfat_cache_evict((uint64_t)&aged_list, v13, a3, a4, a5, a6, a7, a8);
  if (!v18)
  {
    ++v14;
    v15 += v16;
    if (v15 >= a1) {
      goto LABEL_30;
    }
    goto LABEL_17;
  }
LABEL_37:
  int v23 = v18;
  uint64_t result = 0;
LABEL_38:
  *a2 = v23;
  return result;
}

uint64_t fsck_exfat_cache_find(uint64_t a1, uint64_t a2)
{
  uint64_t result = active_list;
  if (!active_list)
  {
LABEL_4:
    uint64_t result = aged_list;
    if (!aged_list) {
      return result;
    }
    while (1)
    {
      uint64_t v4 = *(void *)(result + 16);
      if (*(void *)result == a1) {
        break;
      }
      uint64_t result = *(void *)(result + 16);
      if (!v4) {
        return result;
      }
    }
    uint64_t v5 = *(void **)(result + 24);
    if (!v4)
    {
      qword_100110AE0 = *(void *)(result + 24);
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  while (1)
  {
    uint64_t v4 = *(void *)(result + 16);
    if (*(void *)result == a1) {
      break;
    }
    uint64_t result = *(void *)(result + 16);
    if (!v4) {
      goto LABEL_4;
    }
  }
  uint64_t v5 = *(void **)(result + 24);
  if (v4)
  {
LABEL_11:
    *(void *)(v4 + 24) = v5;
    uint64_t v5 = *(void **)(result + 24);
    goto LABEL_12;
  }
  qword_100110AD0 = *(void *)(result + 24);
LABEL_12:
  *uint64_t v5 = v4;
  if (*(_DWORD *)(result + 32) != a2) {
    sub_100010E40();
  }
  if (!*(void *)(result + 8)) {
    sub_100010E14();
  }
  return result;
}

uint64_t fsck_exfat_cache_get(uint64_t a1, size_t a2, int *a3)
{
  uint64_t v6 = fsck_exfat_cache_find(a1, a2);
  if (v6)
  {
    uint64_t v14 = v6;
LABEL_3:
    uint64_t v15 = active_list;
    *(void *)(v14 + 16) = active_list;
    int v16 = (uint64_t *)(v15 + 24);
    BOOL v17 = v15 == 0;
    active_list = v14;
    int v18 = &qword_100110AD0;
    if (!v17) {
      int v18 = v16;
    }
    *int v18 = v14 + 16;
    *(void *)(v14 + 24) = &active_list;
    ++*(_DWORD *)(v14 + 36);
    return v14;
  }
  unsigned int v20 = memory_pressure_recent(0, v7, v8, v9, v10, v11, v12, v13);
  if (v20)
  {
    int v27 = memory_pressure_current();
    if (v27) {
      unsigned int v20 = dword_1000244B8 * v27;
    }
    else {
      unsigned int v20 = a2;
    }
  }
  uint64_t v14 = fsck_exfat_cache_recycle(v20, a3, v21, v22, v23, v24, v25, v26);
  if (v14)
  {
    v28 = malloc_type_malloc(a2, 0x84198790uLL);
    *(void *)(v14 + 8) = v28;
    if (!v28)
    {
      long long v39 = ctx;
      long long v40 = *(_OWORD *)&qword_100110C10;
      uint64_t v41 = qword_100110C20;
      fsck_err((uint64_t)&v39, 1, (uint64_t)"fsck_exfat_cache_get", v30, v31, v32, v33, v34, v38);
    }
    *(void *)uint64_t v14 = a1;
    *(_DWORD *)(v14 + 32) = a2;
    if (debug)
    {
      long long v39 = ctx;
      long long v40 = *(_OWORD *)&qword_100110C10;
      uint64_t v41 = qword_100110C20;
      fsck_printf((uint64_t)&v39, (uint64_t)"Read      offset = 0x%012llx  length = 0x%06lx\n", v29, v30, v31, v32, v33, v34, a1);
    }
    if (pread(g, *(void **)(v14 + 8), a2, a1) == a2)
    {
      if ((dword_100110B04 & 0x80000000) == 0
        && pwrite(dword_100110B04, *(const void **)(v14 + 8), a2, a1) != a2
        && dword_10010EAC4 <= 19)
      {
        ++dword_10010EAC4;
        warn("Trouble shadowing offset 0x%012llx length 0x%06lx", a1, a2);
      }
      goto LABEL_3;
    }
    warn("Couldn't read %zu bytes at offset %lld", a2, a1);
    free(*(void **)(v14 + 8));
    *(_OWORD *)uint64_t v14 = 0u;
    *(_OWORD *)(v14 + 32) = 0u;
    *(_OWORD *)(v14 + 16) = 0u;
    uint64_t v35 = free_list;
    *(void *)(v14 + 16) = free_list;
    v36 = (uint64_t *)(v35 + 24);
    BOOL v17 = v35 == 0;
    free_list = v14;
    v37 = &qword_100110AF0;
    if (!v17) {
      v37 = v36;
    }
    uint64_t *v37 = v14 + 16;
    *(void *)(v14 + 24) = &free_list;
    uint64_t v14 = 0;
    *a3 = *__error();
  }
  return v14;
}

uint64_t fsck_exfat_cache_mark_dirty(uint64_t a1)
{
  if (!*(_DWORD *)(a1 + 36)) {
    sub_100010E6C();
  }
  *(unsigned char *)(a1 + 40) = 1;
  return 0;
}

uint64_t fsck_exfat_cache_release(uint64_t a1, int a2, int a3)
{
  int v3 = *(_DWORD *)(a1 + 36);
  if (!v3) {
    sub_100010E98();
  }
  if (a2)
  {
    *(unsigned char *)(a1 + 40) = 1;
  }
  else if (a3)
  {
    uint64_t v4 = *(void *)(a1 + 16);
    uint64_t v5 = *(void **)(a1 + 24);
    if (v4)
    {
      *(void *)(v4 + 24) = v5;
      uint64_t v5 = *(void **)(a1 + 24);
    }
    else
    {
      qword_100110AD0 = *(void *)(a1 + 24);
    }
    *uint64_t v5 = v4;
    uint64_t v6 = aged_list;
    *(void *)(a1 + 16) = aged_list;
    uint64_t v7 = (uint64_t *)(v6 + 24);
    BOOL v8 = v6 == 0;
    aged_list = a1;
    uint64_t v9 = &qword_100110AE0;
    if (!v8) {
      uint64_t v9 = v7;
    }
    uint64_t *v9 = a1 + 16;
    *(void *)(a1 + 24) = &aged_list;
  }
  *(_DWORD *)(a1 + 36) = v3 - 1;
  return 0;
}

uint64_t fsck_exfat_cache_flush(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = active_list;
  if (active_list)
  {
    uint64_t v9 = 0;
    do
    {
      if (*(unsigned char *)(v8 + 40))
      {
        unsigned int v10 = fsck_exfat_cache_write(v8, a2, a3, a4, a5, a6, a7, a8);
        if (v9) {
          BOOL v11 = 1;
        }
        else {
          BOOL v11 = v10 == 0;
        }
        if (v11) {
          uint64_t v9 = v9;
        }
        else {
          uint64_t v9 = v10;
        }
      }
      uint64_t v8 = *(void *)(v8 + 16);
    }
    while (v8);
  }
  else
  {
    uint64_t v9 = 0;
  }
  for (uint64_t i = aged_list; i; uint64_t i = *(void *)(i + 16))
  {
    if (*(unsigned char *)(i + 40))
    {
      unsigned int v13 = fsck_exfat_cache_write(i, a2, a3, a4, a5, a6, a7, a8);
      if (v9) {
        BOOL v14 = 1;
      }
      else {
        BOOL v14 = v13 == 0;
      }
      if (v14) {
        uint64_t v9 = v9;
      }
      else {
        uint64_t v9 = v13;
      }
    }
  }
  return v9;
}

uint64_t fsck_exfat_cache_get_cluster(unsigned int a1, int *a2)
{
  if (a1 < 2 || dword_100110B44 < a1) {
    sub_100010EC4();
  }
  size_t v3 = qword_100110B34;
  uint64_t v4 = (dword_100110B2C + HIDWORD(qword_100110B34) * (unint64_t)(a1 - 2))
     * dword_100110B30;

  return fsck_exfat_cache_get(v4, v3, a2);
}

uint64_t fsck_exfat_cache_evict_clusters(const __CFArray *a1)
{
  CFIndex Count = CFArrayGetCount(a1);
  if (Count < 1) {
    return 0;
  }
  uint64_t v3 = 0;
  unint64_t v4 = Count + 1;
  do
  {
    unsigned int ValueAtIndex = CFArrayGetValueAtIndex(a1, v4 - 2);
    uint64_t v6 = fsck_exfat_cache_find((dword_100110B2C + HIDWORD(qword_100110B34) * (unint64_t)(ValueAtIndex - 2))* dword_100110B30, qword_100110B34);
    if (v6)
    {
      unsigned int v13 = fsck_exfat_cache_evict(0, v6, v7, v8, v9, v10, v11, v12);
      if (v3) {
        BOOL v14 = 1;
      }
      else {
        BOOL v14 = v13 == 0;
      }
      if (v14) {
        uint64_t v3 = v3;
      }
      else {
        uint64_t v3 = v13;
      }
    }
    --v4;
  }
  while (v4 > 1);
  return v3;
}

uint64_t buffer_data(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t buffer_length(uint64_t a1)
{
  return *(unsigned int *)(a1 + 32);
}

uint64_t exfat_upcase_checksum(unsigned __int8 *a1, uint64_t a2)
{
  for (uint64_t i = 0; a2; --a2)
  {
    HIDWORD(v3) = i;
    LODWORD(v3) = i;
    int v4 = *a1++;
    uint64_t i = (v3 >> 1) + v4;
  }
  return i;
}

uint64_t fsck_exfat_decompress_upcase(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v3 = a3 >> 1;
  if ((int)(a3 >> 1) < 1) {
    return 421;
  }
  int v4 = 0;
  int v5 = 0;
  do
  {
    uint64_t v6 = v5 + 1;
    int v7 = *(unsigned __int16 *)(a2 + 2 * v5);
    BOOL v8 = v7 == 0xFFFF && (int)v6 < (int)v3;
    if (v8)
    {
      int v9 = *(unsigned __int16 *)(a2 + 2 * v6);
      if (v9)
      {
        uint64_t v10 = v4;
        do
        {
          *(_WORD *)(a1 + 2 * v10) = v10;
          LOWORD(v9) = v9 - 1;
          ++v4;
          if (!(_WORD)v9) {
            break;
          }
          BOOL v8 = v10++ < 0xFFFF;
        }
        while (v8);
      }
      if ((_WORD)v9) {
        return 419;
      }
      v5 += 2;
    }
    else
    {
      *(_WORD *)(a1 + 2 * v4++) = v7;
      ++v5;
    }
  }
  while (v5 < (int)v3 && v4 < 0x10000);
  if (v4 == 0x10000) {
    unsigned int v11 = 0;
  }
  else {
    unsigned int v11 = 421;
  }
  if (v5 >= (int)v3) {
    return v11;
  }
  else {
    return 419;
  }
}

uint64_t fsck_exfat_upcase_replace()
{
  uint64_t result = fsck_exfat_resize_chain((unsigned int *)&dword_100110BE4, (unint64_t *)&qword_100110BE8, default_upcase_table_size);
  if (result) {
    goto LABEL_2;
  }
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  if (dword_100110BE0 == -1)
  {
    uint64_t result = fsck_exfat_find_unused_entry(qword_100110BB8, (uint64_t)&dword_100110BE0, &v16, &v15);
    if (result) {
      goto LABEL_2;
    }
    uint64_t v1 = v15;
    *(_OWORD *)uint64_t v15 = 0u;
    *(_OWORD *)(v1 + 16) = 0u;
    *(unsigned char *)uint64_t v1 = -126;
  }
  else
  {
    uint64_t result = fsck_exfat_read_dir_entry(qword_100110BB8, dword_100110BE0, &v16, &v15);
    if (result) {
      goto LABEL_2;
    }
  }
  uint64_t v2 = v15;
  *(_DWORD *)(v15 + 20) = dword_100110BE4;
  *(void *)(v2 + 24) = qword_100110BE8;
  uint64_t v3 = default_upcase_table_size;
  if (default_upcase_table_size)
  {
    int v4 = 0;
    int v5 = &default_upcase_table;
    do
    {
      HIDWORD(v6) = v4;
      LODWORD(v6) = v4;
      int v7 = *v5++;
      int v4 = (v6 >> 1) + v7;
      --v3;
    }
    while (v3);
  }
  else
  {
    int v4 = 0;
  }
  *(_DWORD *)(v2 + 4) = v4;
  uint64_t result = fsck_exfat_cache_release(v16, 1, 0);
  unsigned int v13 = result;
  if (!result)
  {
    unsigned int v14 = dword_100110BE4;
    unsigned int v8 = default_upcase_table_size;
    int v9 = &default_upcase_table;
    while (1)
    {
      if (!v8)
      {
        uint64_t result = 0;
        byte_100110BF4 = 1;
        return result;
      }
      size_t v10 = v8 >= qword_100110B34 ? qword_100110B34 : v8;
      uint64_t cluster = fsck_exfat_cache_get_cluster(v14, (int *)&v13);
      uint64_t v16 = cluster;
      if (!cluster) {
        break;
      }
      uint64_t v12 = (void *)buffer_data(cluster);
      memcpy(v12, v9, v10);
      uint64_t result = fsck_exfat_cache_release(v16, 1, 0);
      unsigned int v13 = result;
      if (!result)
      {
        v8 -= v10;
        v9 += v10;
        uint64_t result = fsck_exfat_fat_get(v14, &v14);
        unsigned int v13 = result;
        if (!result) {
          continue;
        }
      }
      goto LABEL_2;
    }
    uint64_t result = v13;
  }
LABEL_2:
  HIBYTE(word_100110BF2) = 1;
  return result;
}

BOOL fsck_exfat_read_upcase(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v37 = 0;
  size_t v9 = *(void *)(a1 + 24);
  if (v9 > 0x20000)
  {
    long long v34 = ctx;
    long long v35 = *(_OWORD *)&qword_100110C10;
    uint64_t v36 = qword_100110C20;
    fsckPrint((uint64_t)&v34, 419, a3, a4, a5, a6, a7, a8, v33);
  }
  uint64_t v16 = (char *)malloc_type_malloc(v9, 0x893DB8F4uLL);
  if (!v16)
  {
    long long v34 = ctx;
    long long v35 = *(_OWORD *)&qword_100110C10;
    uint64_t v36 = qword_100110C20;
    fsck_err((uint64_t)&v34, 1, (uint64_t)"Cannot allocate compressed upper case transation table", v11, v12, v13, v14, v15, v33);
  }
  unsigned int v38 = *(_DWORD *)(a1 + 20);
  BOOL v17 = v16;
  size_t v18 = v9;
  while (v38 >= 2 && v38 <= dword_100110B44)
  {
    uint64_t cluster = fsck_exfat_cache_get_cluster(v38, &v37);
    if (cluster)
    {
      uint64_t v21 = cluster;
      size_t v22 = qword_100110B34;
      uint64_t v23 = (const void *)buffer_data(cluster);
      if (v18 <= v22)
      {
        memcpy(v17, v23, v18);
        size_t v18 = 0;
      }
      else
      {
        memcpy(v17, v23, qword_100110B34);
        v18 -= qword_100110B34;
        v17 += qword_100110B34;
      }
      int v37 = fsck_exfat_cache_release(v21, 0, 1);
      if (!v37)
      {
        int v37 = fsck_exfat_fat_get(v38, &v38);
        if (!v37) {
          continue;
        }
      }
    }
    if (v16) {
      goto LABEL_17;
    }
    return 1;
  }
  if (v18)
  {
    long long v34 = ctx;
    long long v35 = *(_OWORD *)&qword_100110C10;
    uint64_t v36 = qword_100110C20;
    uint64_t v25 = 422;
    goto LABEL_28;
  }
  int v26 = 0;
  if (v9)
  {
    int v27 = v16;
    size_t v28 = v9;
    do
    {
      HIDWORD(v29) = v26;
      LODWORD(v29) = v26;
      int v30 = *v27++;
      int v26 = (v29 >> 1) + v30;
      --v28;
    }
    while (v28);
  }
  if (v26 != *(_DWORD *)(a1 + 4))
  {
    long long v34 = ctx;
    long long v35 = *(_OWORD *)&qword_100110C10;
    uint64_t v36 = qword_100110C20;
    uint64_t v25 = 420;
LABEL_28:
    fsckPrint((uint64_t)&v34, v25, v10, v11, v12, v13, v14, v15, v33);
    if (v16) {
LABEL_17:
    }
      free(v16);
    return 1;
  }
  uint64_t v31 = fsck_exfat_decompress_upcase(qword_100110BD0, (uint64_t)v16, v9);
  int v37 = v31;
  if (v31)
  {
    uint64_t v25 = v31;
    long long v34 = ctx;
    long long v35 = *(_OWORD *)&qword_100110C10;
    uint64_t v36 = qword_100110C20;
    goto LABEL_28;
  }
  if (v9 <= 0x20000 && debug)
  {
    uint64_t v32 = *(unsigned int *)(a1 + 20);
    long long v34 = ctx;
    long long v35 = *(_OWORD *)&qword_100110C10;
    uint64_t v36 = qword_100110C20;
    fsck_printf((uint64_t)&v34, (uint64_t)"Found upcase table; starting cluster %u, length %llu\n",
      v10,
      v11,
      v12,
      v13,
      v14,
      v15,
      v32);
  }
  if (v16) {
    free(v16);
  }
  return v9 > 0x20000;
}

uint64_t fsck_exfat_bitmap_init()
{
  if (qword_100110BC0) {
    sub_100010EF0();
  }
  unsigned int v0 = dword_100110B40 >> 5;
  if ((dword_100110B40 & 0x1F) != 0) {
    size_t v1 = v0 + 1;
  }
  else {
    size_t v1 = v0;
  }
  uint64_t result = (uint64_t)malloc_type_calloc(v1, 4uLL, 0x100004052888210uLL);
  qword_100110BC0 = result;
  if (!result)
  {
    *((void *)&v8[0] + 1) = *((void *)&ctx + 1);
    v8[1] = *(_OWORD *)&qword_100110C10;
    uint64_t v9 = qword_100110C20;
    uint64_t result = fsck_err((uint64_t)v8, 1, (uint64_t)"Could not allocate memory for in-memory bitmap", v3, v4, v5, v6, v7, ctx);
  }
  dword_100110BC8 = 0;
  return result;
}

uint64_t fsck_exfat_bitmap_allocate(unsigned int a1, unsigned int a2, unsigned int *a3)
{
  unsigned int v3 = a1 - 2;
  if (a1 < 2 || dword_100110B44 < a1 || __CFADD__(a2, a1) || a2 + a1 > dword_100110B44 + 1) {
    sub_100010F1C();
  }
  uint64_t v4 = (int *)(qword_100110BC0 + 4 * (v3 >> 5));
  int v5 = v3 & 0x1F;
  if ((v3 & 0x1F) != 0)
  {
    int v6 = -1 << v5;
    unsigned int v7 = 32 - v5;
    int v8 = -1 << (v5 + a2);
    if (v7 > a2) {
      int v9 = ~v8;
    }
    else {
      int v9 = -2;
    }
    int v10 = v9 & v6;
    int v11 = *v4;
    if ((*v4 & v10) != 0)
    {
      unsigned int v7 = 0;
      if (!a2)
      {
LABEL_11:
        uint64_t result = 1;
LABEL_29:
        *a3 = v7;
        goto LABEL_30;
      }
LABEL_23:
      int v14 = 1 << v3;
      unsigned int v15 = a2 + v7;
      while ((v11 & v14) == 0)
      {
        v11 |= v14;
        int *v4 = v11;
        ++v7;
        v14 *= 2;
        if (!--a2)
        {
          uint64_t result = 1;
          unsigned int v7 = v15;
          goto LABEL_29;
        }
      }
      goto LABEL_11;
    }
    *v4++ = v11 | v10;
    unsigned int v13 = a2 - v7;
    if (a2 < v7) {
      unsigned int v13 = 0;
    }
    if (v7 >= a2) {
      unsigned int v7 = a2;
    }
    LOBYTE(v3) = v7 + v3;
    a2 = v13;
  }
  else
  {
    unsigned int v7 = 0;
  }
  if (a2 >= 0x20)
  {
    do
    {
      int v11 = *v4;
      if (*v4) {
        goto LABEL_23;
      }
      *v4++ = -1;
      LOBYTE(v3) = v3 + 32;
      v7 += 32;
      a2 -= 32;
    }
    while (a2 > 0x1F);
  }
  if (a2)
  {
    int v11 = *v4;
    if ((*v4 & ~(-1 << a2)) != 0) {
      goto LABEL_23;
    }
    int *v4 = v11 | ~(-1 << a2);
    v7 += a2;
  }
  uint64_t result = 0;
  if (a3) {
    goto LABEL_29;
  }
LABEL_30:
  dword_100110BC8 += v7;
  return result;
}

uint64_t fsck_exfat_bitmap_free(unsigned int a1, unsigned int a2, unsigned int *a3)
{
  unsigned int v3 = a1 - 2;
  if (a1 < 2 || dword_100110B44 < a1 || __CFADD__(a2, a1) || a2 + a1 > dword_100110B44 + 1) {
    sub_100010F48();
  }
  uint64_t v4 = (int *)(qword_100110BC0 + 4 * (v3 >> 5));
  int v5 = v3 & 0x1F;
  if ((v3 & 0x1F) != 0)
  {
    int v6 = -1 << v5;
    unsigned int v7 = 32 - v5;
    int v8 = -1 << (v5 + a2);
    if (v7 > a2) {
      int v9 = ~v8;
    }
    else {
      int v9 = -2;
    }
    int v10 = v9 & v6;
    int v11 = *v4;
    if ((v10 & ~*v4) != 0)
    {
      unsigned int v7 = 0;
      if (!a2)
      {
LABEL_27:
        uint64_t result = 1;
        goto LABEL_29;
      }
LABEL_23:
      int v14 = 1 << v3;
      unsigned int v15 = a2 + v7;
      while ((v11 & v14) != 0)
      {
        v11 &= ~v14;
        int *v4 = v11;
        ++v7;
        v14 *= 2;
        if (!--a2)
        {
          uint64_t result = 1;
          unsigned int v7 = v15;
          goto LABEL_29;
        }
      }
      goto LABEL_27;
    }
    *v4++ = v11 & ~v10;
    unsigned int v12 = a2 - v7;
    if (a2 < v7) {
      unsigned int v12 = 0;
    }
    if (v7 >= a2) {
      unsigned int v7 = a2;
    }
    LOBYTE(v3) = v7 + v3;
    a2 = v12;
  }
  else
  {
    unsigned int v7 = 0;
  }
  if (a2 >= 0x20)
  {
    do
    {
      int v11 = *v4;
      if (*v4 != -1) {
        goto LABEL_23;
      }
      *v4++ = 0;
      LOBYTE(v3) = v3 + 32;
      v7 += 32;
      a2 -= 32;
    }
    while (a2 > 0x1F);
  }
  if (!a2)
  {
    uint64_t result = 0;
    goto LABEL_29;
  }
  int v11 = *v4;
  if ((~*v4 & ~(-1 << a2)) != 0) {
    goto LABEL_23;
  }
  uint64_t result = 0;
  int *v4 = v11 & (-1 << a2);
  v7 += a2;
LABEL_29:
  *a3 = v7;
  dword_100110BC8 -= v7;
  return result;
}

uint64_t fsck_exfat_bitmap_find_free(unsigned int a1, _DWORD *a2)
{
  uint64_t v2 = (_DWORD *)qword_100110BC0;
  if (dword_100110B40)
  {
    unsigned int v3 = 0;
    do
    {
      if (*v2 != -1) {
        break;
      }
      v3 += 32;
      ++v2;
    }
    while (v3 < dword_100110B40);
  }
  else
  {
    unsigned int v3 = 0;
  }
  if (v3 >= dword_100110B40)
  {
LABEL_19:
    uint64_t result = 0;
    *a2 = 0;
  }
  else
  {
    unsigned int v4 = 1;
    while ((*v2 & v4) != 0)
    {
      ++v3;
      v4 *= 2;
      if (v3 >= dword_100110B40 || !v4)
      {
        if (v3 >= dword_100110B40) {
          goto LABEL_19;
        }
        break;
      }
    }
    *a2 = v3 + 2;
    if (v3 >= dword_100110B40 || a1 == 0)
    {
      return 0;
    }
    else
    {
      unsigned int v7 = 1;
      while ((*v2 & v4) == 0)
      {
        v4 *= 2;
        BOOL v8 = v4 == 0;
        if (v4 <= 1) {
          unsigned int v4 = 1;
        }
        unsigned int v9 = v7 + 1;
        if (v3 + v7 < dword_100110B40)
        {
          v2 += v8;
          if (v7++ < a1) {
            continue;
          }
        }
        return v9 - 1;
      }
      return v7 - 1;
    }
  }
  return result;
}

uint64_t fsck_exfat_bitmap_verify(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v101 = 0;
  uint64_t v102 = 0;
  uint64_t v100 = 0;
  BOOL v8 = &g;
  if (byte_100110BF5)
  {
    long long v97 = ctx;
    long long v98 = *(_OWORD *)&qword_100110C10;
    uint64_t v9 = qword_100110C20;
LABEL_3:
    uint64_t v99 = v9;
    fsckPrint((uint64_t)&v97, 432, a3, a4, a5, a6, a7, a8, v87);
    return 0;
  }
  unsigned int v11 = dword_100110B40 >> 3;
  if ((dword_100110B40 & 7) != 0) {
    unint64_t v12 = v11 + 1;
  }
  else {
    unint64_t v12 = v11;
  }
  if (v12 % qword_100110B34) {
    unsigned int v13 = v12 / qword_100110B34 + 1;
  }
  else {
    unsigned int v13 = v12 / qword_100110B34;
  }
  if (dword_100110BD8 == -1)
  {
    long long v97 = ctx;
    long long v98 = *(_OWORD *)&qword_100110C10;
    uint64_t v99 = qword_100110C20;
    fsckPrint((uint64_t)&v97, 415, a3, a4, a5, a6, a7, a8, v87);
    long long v97 = ctx;
    long long v98 = *(_OWORD *)&qword_100110C10;
    uint64_t v99 = qword_100110C20;
    if (fsckAskPrompt((uint64_t)&v97, (uint64_t)"Create? ", v23, v24, v25, v26, v27, v28, v89) != 1)
    {
      long long v97 = ctx;
      long long v98 = *(_OWORD *)&qword_100110C10;
      uint64_t v99 = qword_100110C20;
      fsckPrint((uint64_t)&v97, 432, v29, v30, v31, v32, v33, v34, v87);
      uint64_t result = 0;
      LOBYTE(word_100110BF2) = 1;
      return result;
    }
    int unused_entry = fsck_exfat_extend_chain((unsigned int *)&dword_100110B4C, (unint64_t *)&qword_100110B50, v12);
    LODWORD(v100) = unused_entry;
    if (!unused_entry)
    {
      int unused_entry = fsck_exfat_find_unused_entry(qword_100110BB8, (uint64_t)&dword_100110BD8, &v102, &v101);
      LODWORD(v100) = unused_entry;
    }
    uint64_t v36 = v101;
    if (unused_entry) {
      BOOL v37 = 1;
    }
    else {
      BOOL v37 = v101 == 0;
    }
    if (!v37 && v102 != 0)
    {
      *(_OWORD *)uint64_t v101 = 0u;
      *(_OWORD *)(v36 + 16) = 0u;
      *(unsigned char *)uint64_t v101 = -127;
      uint64_t v40 = v101;
      uint64_t v39 = v102;
      *(_DWORD *)(v101 + 20) = dword_100110B4C;
      *(void *)(v40 + 24) = qword_100110B50;
      int unused_entry = fsck_exfat_cache_release(v39, 1, 0);
      LODWORD(v100) = unused_entry;
    }
    int v14 = 1;
    if (unused_entry)
    {
      long long v97 = ctx;
      long long v98 = *(_OWORD *)&qword_100110C10;
      uint64_t v99 = qword_100110C20;
      fsckPrint((uint64_t)&v97, 432, a3, a4, a5, a6, a7, a8, v87);
      uint64_t result = 0;
      HIBYTE(word_100110BF2) = 1;
      return result;
    }
  }
  else
  {
    int v14 = -1;
  }
  if (qword_100110B50 < v12)
  {
    long long v97 = ctx;
    long long v98 = *(_OWORD *)&qword_100110C10;
    uint64_t v99 = qword_100110C20;
    fsckPrint((uint64_t)&v97, 409, a3, a4, a5, a6, a7, a8, (uint64_t)"Active bitmap");
    long long v97 = ctx;
    long long v98 = *(_OWORD *)&qword_100110C10;
    uint64_t v99 = qword_100110C20;
    if (fsckAskPrompt((uint64_t)&v97, (uint64_t)"Extend? ", v15, v16, v17, v18, v19, v20, v88) != 1)
    {
      LOBYTE(word_100110BF2) = 1;
      long long v97 = ctx;
      long long v98 = *(_OWORD *)&qword_100110C10;
      uint64_t v9 = qword_100110C20;
      goto LABEL_3;
    }
    if (fsck_exfat_extend_chain((unsigned int *)&dword_100110B4C, (unint64_t *)&qword_100110B50, v12)|| fsck_exfat_read_dir_entry(qword_100110BB8, dword_100110BD8, &v102, &v101)|| (v22 = v101, uint64_t v21 = v102, *(_DWORD *)(v101 + 20) = dword_100110B4C, *(void *)(v22 + 24) = qword_100110B50, LODWORD(v100) = fsck_exfat_cache_release(v21, 1, 0), v100))
    {
      uint64_t result = 0;
      HIBYTE(word_100110BF2) = 1;
      return result;
    }
    byte_100110BF4 = 1;
  }
  uint64_t v41 = (unsigned __int8 *)qword_100110BC0;
  HIDWORD(v100) = dword_100110B4C;
  if (v13)
  {
    int v92 = v14;
    uint64_t v42 = 0;
    uint64_t v96 = 0;
    uint64_t v43 = 0;
    int v44 = 0;
    unint64_t v93 = (unint64_t)dword_100110B40 >> 3;
    unsigned int v90 = v13;
    while (1)
    {
      unsigned int v45 = HIDWORD(v100);
      if (debug)
      {
        long long v97 = ctx;
        long long v98 = *(_OWORD *)&qword_100110C10;
        uint64_t v99 = qword_100110C20;
        fsck_printf((uint64_t)&v97, (uint64_t)"Checking bitmap cluster %u\n", a3, a4, a5, a6, a7, a8, HIDWORD(v100));
        unsigned int v45 = HIDWORD(v100);
      }
      uint64_t cluster = fsck_exfat_cache_get_cluster(v45, (int *)&v100);
      uint64_t v102 = cluster;
      if (!cluster) {
        goto LABEL_87;
      }
      v47 = (unsigned __int8 *)buffer_data(cluster);
      unint64_t v48 = v8[13];
      size_t v49 = v93 >= v48 ? v48 : v93;
      unsigned int v94 = v49;
      if (v49)
      {
        int v50 = memcmp(v41, v47, v49);
        LODWORD(v49) = v94;
      }
      else
      {
        int v50 = 0;
      }
      if (v49 < v48)
      {
        int v51 = v8[16] & 7;
        if (v51)
        {
          uint64_t v52 = ((int)v12 - 1) % v48;
          int v53 = v41[v52];
          char v54 = 8 - v51;
          int v55 = v47[v52];
          if (((v55 ^ v53) << v54)) {
            break;
          }
        }
      }
      if (v50)
      {
        LODWORD(v97) = 0;
        unsigned int v56 = v94;
        if (v94) {
          goto LABEL_51;
        }
        unsigned int v91 = 0;
        size_t v62 = 0;
LABEL_65:
        if (memcmp(v41, v47, v62))
        {
          size_t v69 = v62;
          if (v92 == -1)
          {
            long long v97 = ctx;
            long long v98 = *(_OWORD *)&qword_100110C10;
            uint64_t v99 = qword_100110C20;
            fsckPrint((uint64_t)&v97, 433, v63, v64, v65, v66, v67, v68, v87);
          }
          if (debug) {
            BOOL v70 = v91 == 0;
          }
          else {
            BOOL v70 = 1;
          }
          if (!v70)
          {
            uint64_t v71 = 0;
            do
            {
              if (v41[v71] != v47[v71])
              {
                uint64_t v72 = v71 + (v44 * v8[13]);
                long long v97 = ctx;
                long long v98 = *(_OWORD *)&qword_100110C10;
                uint64_t v99 = qword_100110C20;
                fsck_printf((uint64_t)&v97, (uint64_t)"%08X: %02X should be %02X\n", v63, v64, v65, v66, v67, v68, v72);
              }
              ++v71;
            }
            while (v69 != v71);
          }
          int v73 = v92;
          if (v92 == -1)
          {
            long long v97 = ctx;
            long long v98 = *(_OWORD *)&qword_100110C10;
            uint64_t v99 = qword_100110C20;
            int v73 = fsckAskPrompt((uint64_t)&v97, (uint64_t)"Repair? ", v63, v64, v65, v66, v67, v68, v87);
          }
          if (v73 == 1)
          {
            memcpy(v47, v41, v69);
            fsck_exfat_cache_mark_dirty(v102);
            int v92 = 1;
            *((unsigned char *)v8 + 244) = 1;
          }
          else
          {
            int v92 = v73;
            *((unsigned char *)v8 + 242) = 1;
          }
        }
      }
      uint64_t v74 = v8[13];
      LODWORD(v100) = fsck_exfat_cache_release(v102, 0, 0);
      if (!v100)
      {
        LODWORD(v100) = fsck_exfat_fat_get(HIDWORD(v100), (_DWORD *)&v100 + 1);
        if (!v100)
        {
          v41 += v74;
          v93 -= v94;
          if (++v44 != v13) {
            continue;
          }
        }
      }
      goto LABEL_87;
    }
    unsigned int v56 = v94 + 1;
    v41[v52] = v55 & (-256 >> v54) | v53;
    LODWORD(v97) = 0;
LABEL_51:
    v57 = v8;
    uint64_t v58 = 0;
    unsigned int v91 = v56;
    size_t __n = v56;
    do
    {
      int v59 = v47[v58];
      if (v41[v58] != v59)
      {
        for (int i = 0; i != 8; ++i)
        {
          int v61 = 1 << i;
          if ((v59 & (1 << i)) != 0 && (v61 & v41[v58]) == 0)
          {
            LODWORD(v97) = i + 8 * (v58 + v44 * v57[13]) + 2;
            LODWORD(v100) = fsck_exfat_fat_get(v97, &v97);
            if (v100)
            {
              fsck_exfat_cache_release(v102, 0, 0);
              return v100;
            }
            uint64_t v43 = (v43 + 1);
            if (v97 == -9)
            {
              v41[v58] |= v61;
              uint64_t v96 = (v96 + 1);
            }
          }
          int v59 = v47[v58];
          if ((v61 & v59) == 0) {
            uint64_t v42 = ((v41[v58] >> i) & 1) + v42;
          }
        }
      }
      ++v58;
      size_t v62 = __n;
    }
    while (v58 != __n);
    BOOL v8 = v57;
    unsigned int v13 = v90;
    goto LABEL_65;
  }
  uint64_t v43 = 0;
  uint64_t v96 = 0;
  uint64_t v42 = 0;
LABEL_87:
  if (debug)
  {
    long long v97 = ctx;
    long long v98 = *(_OWORD *)&qword_100110C10;
    uint64_t v99 = qword_100110C20;
    fsck_printf((uint64_t)&v97, (uint64_t)"%u clusters were marked used, but not referenced\n", a3, a4, a5, a6, a7, a8, v43);
    long long v97 = ctx;
    long long v98 = *(_OWORD *)&qword_100110C10;
    uint64_t v99 = qword_100110C20;
    fsck_printf((uint64_t)&v97, (uint64_t)"%u clusters were marked used and CLUST_BAD\n", v75, v76, v77, v78, v79, v80, v96);
    long long v97 = ctx;
    long long v98 = *(_OWORD *)&qword_100110C10;
    uint64_t v99 = qword_100110C20;
    fsck_printf((uint64_t)&v97, (uint64_t)"%u clusters were marked free, but referenced\n", v81, v82, v83, v84, v85, v86, v42);
  }
  return v100;
}

void fsck_exfat_fat_init()
{
  qword_100110B58 = dword_100110B30 * (unint64_t)dword_100110B28;
  unk_100110B60 = dword_100110B3C * (unint64_t)dword_100110B30;
  dword_100110BCC = 1024;
}

uint64_t fsck_exfat_fat_get(unsigned int a1, _DWORD *a2)
{
  if (a1 < 2 || dword_100110B44 < a1) {
    sub_100010F74();
  }
  unsigned int v10 = 0;
  uint64_t v4 = (a1 / dword_100110BCC) << 12;
  if ((unint64_t)(v4 + 4096) <= unk_100110B60) {
    size_t v5 = 4096;
  }
  else {
    size_t v5 = unk_100110B60 - v4;
  }
  uint64_t v6 = fsck_exfat_cache_get(qword_100110B58 + v4, v5, (int *)&v10);
  if (!v6) {
    return v10;
  }
  uint64_t v7 = v6;
  unsigned int v8 = 4 * (a1 % dword_100110BCC);
  *a2 = *(_DWORD *)(buffer_data(v6) + v8);
  return fsck_exfat_cache_release(v7, 0, 0);
}

uint64_t fsck_exfat_fat_set(unsigned int a1, int a2, _DWORD *a3)
{
  if (a1 < 2 || dword_100110B44 < a1) {
    sub_100010FA0();
  }
  unsigned int v12 = 0;
  uint64_t v6 = (a1 / dword_100110BCC) << 12;
  if ((unint64_t)(v6 + 4096) <= unk_100110B60) {
    size_t v7 = 4096;
  }
  else {
    size_t v7 = unk_100110B60 - v6;
  }
  uint64_t v8 = fsck_exfat_cache_get(qword_100110B58 + v6, v7, (int *)&v12);
  if (!v8) {
    return v12;
  }
  uint64_t v9 = v8;
  uint64_t v10 = 4 * (a1 % dword_100110BCC);
  if (a3) {
    *a3 = *(_DWORD *)(buffer_data(v8) + v10);
  }
  *(_DWORD *)(v10 + buffer_data(v9)) = a2;
  return fsck_exfat_cache_release(v9, 1, 0);
}

uint64_t fsck_exfat_fat_alloc_chain(unsigned int a1, _DWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v20 = a1;
  unsigned int v19 = 0;
  if (a1 < 2 || dword_100110B44 < a1) {
    sub_100010FCC();
  }
  for (int i = 0; ; ++i)
  {
    unsigned int v11 = v20;
    unsigned int v12 = dword_100110B44;
    if (v20 < 2 || v20 > dword_100110B44) {
      break;
    }
    if (fsck_exfat_bitmap_allocate(v20, 1u, &v19)) {
      BOOL v14 = 1;
    }
    else {
      BOOL v14 = v19 == 0;
    }
    if (v14)
    {
      unsigned int v12 = dword_100110B44;
      goto LABEL_17;
    }
    uint64_t result = fsck_exfat_fat_get(v11, &v20);
    if (result) {
      return result;
    }
  }
  if (v20 == -1)
  {
    uint64_t result = 0;
    goto LABEL_24;
  }
LABEL_17:
  BOOL v16 = v11 < 2 || v11 > v12;
  v17[0] = ctx;
  v17[1] = *(_OWORD *)&qword_100110C10;
  uint64_t v18 = qword_100110C20;
  if (v16) {
    fsckPrint((uint64_t)v17, 403, a3, a4, a5, a6, a7, a8, a3);
  }
  else {
    fsckPrint((uint64_t)v17, 404, a3, a4, a5, a6, a7, a8, a3);
  }
  uint64_t result = 1;
LABEL_24:
  *a2 = i;
  return result;
}

uint64_t fsck_exfat_truncate_chain(unsigned int a1, unsigned int a2, unsigned int a3)
{
  if (!a2) {
    return 0;
  }
  unsigned int v12 = 0;
  unsigned int v13 = a1;
  unsigned int v5 = a2 - 1;
  if (a2 != 1)
  {
    while (1)
    {
      uint64_t v6 = fsck_exfat_fat_get(v13, &v13);
      if (v6) {
        return v6;
      }
      if (!--v5)
      {
        a1 = v13;
        break;
      }
    }
  }
  uint64_t v6 = fsck_exfat_fat_set(a1, -1, &v13);
  BOOL v7 = a3 >= a2;
  unsigned int v8 = a3 - a2;
  if (v8 == 0 || !v7) {
    return v6;
  }
  while (1)
  {
    uint64_t v9 = 1;
    if (fsck_exfat_bitmap_free(v13, 1u, &v12) || v12 != 1) {
      break;
    }
    uint64_t v6 = fsck_exfat_fat_set(v13, 0, &v13);
    if (v6) {
      return v6;
    }
    if (!--v8) {
      return 0;
    }
  }
  return v9;
}

uint64_t fsck_exfat_extend_chain(unsigned int *a1, unint64_t *a2, unint64_t a3)
{
  unsigned int v23 = 0;
  unint64_t v3 = *a2;
  if (*a2 >= a3) {
    sub_100010FF8();
  }
  unsigned int v5 = a2;
  unsigned int v24 = 0;
  if (v3 % qword_100110B34) {
    unsigned int v7 = v3 / qword_100110B34 + 1;
  }
  else {
    unsigned int v7 = v3 / qword_100110B34;
  }
  if (a3 % qword_100110B34) {
    unsigned int v8 = a3 / qword_100110B34 + 1;
  }
  else {
    unsigned int v8 = a3 / qword_100110B34;
  }
  unsigned int v9 = *a1;
  unsigned int v25 = *a1;
  if (v7 < 2)
  {
LABEL_13:
    if (v7 >= v8)
    {
      unsigned int v20 = v7;
LABEL_28:
      uint64_t result = fsck_exfat_fat_set(v9, -1, 0);
      unsigned int v23 = result;
      unsigned int v11 = v20;
      if (!result)
      {
        *unsigned int v5 = a3;
        return result;
      }
    }
    else
    {
      unsigned int v11 = v7;
LABEL_15:
      unsigned int v12 = v5;
      int free = fsck_exfat_bitmap_find_free(v8 - v11, &v24);
      if (free)
      {
        int v14 = free;
        unsigned int v22 = free + v11;
        unsigned int v15 = v24;
        while (1)
        {
          uint64_t cluster = fsck_exfat_cache_get_cluster(v15, (int *)&v23);
          if (!cluster) {
            break;
          }
          uint64_t v17 = cluster;
          uint64_t v18 = (void *)buffer_data(cluster);
          bzero(v18, qword_100110B34);
          unsigned int v23 = fsck_exfat_cache_release(v17, 1, 0);
          if (v23) {
            break;
          }
          unsigned int v23 = fsck_exfat_bitmap_allocate(v24, 1u, 0);
          if (v23) {
            break;
          }
          unsigned int v19 = v24;
          if (v9)
          {
            unsigned int v23 = fsck_exfat_fat_set(v9, v24, 0);
            if (v23) {
              break;
            }
            unsigned int v9 = v24;
          }
          else
          {
            *a1 = v24;
            unsigned int v9 = v19;
          }
          unsigned int v15 = v9 + 1;
          unsigned int v24 = v9 + 1;
          ++v11;
          if (!--v14)
          {
            unsigned int v11 = v22;
            unsigned int v5 = v12;
            unsigned int v20 = v22;
            if (v22 < v8) {
              goto LABEL_15;
            }
            goto LABEL_28;
          }
        }
      }
      else
      {
        unsigned int v23 = 1;
      }
    }
    if (v11 > v7) {
      fsck_exfat_truncate_chain(*a1, v7, v11);
    }
  }
  else
  {
    unsigned int v10 = v7;
    while (1)
    {
      unsigned int v23 = fsck_exfat_fat_get(v25, &v25);
      if (v23) {
        break;
      }
      if (--v10 <= 1)
      {
        unsigned int v9 = v25;
        goto LABEL_13;
      }
    }
  }
  if (!v7) {
    *a1 = 0;
  }
  return v23;
}

uint64_t fsck_exfat_resize_chain(unsigned int *a1, unint64_t *a2, unint64_t a3)
{
  unint64_t v5 = *a2;
  if (*a2 >= a3)
  {
    if (*a2 > a3)
    {
      if (v5 % qword_100110B34) {
        unsigned int v7 = v5 / qword_100110B34 + 1;
      }
      else {
        unsigned int v7 = v5 / qword_100110B34;
      }
      if (a3 % qword_100110B34) {
        unsigned int v8 = a3 / qword_100110B34 + 1;
      }
      else {
        unsigned int v8 = a3 / qword_100110B34;
      }
      if (v8 >= v7 || (uint64_t result = fsck_exfat_truncate_chain(*a1, v8, v7), !result))
      {
        uint64_t result = 0;
        *a2 = a3;
      }
    }
    else
    {
      return 0;
    }
  }
  else
  {
    return fsck_exfat_extend_chain(a1, a2, a3);
  }
  return result;
}

UInt8 *CFStringCopyCStringUTF8(const __CFString *a1)
{
  CFIndex maxBufLen = 0;
  v5.length = CFStringGetLength(a1);
  v5.location = 0;
  CFStringGetBytes(a1, v5, 0x8000100u, 0, 0, 0, 0x7FFFFFFFFFFFFFFFLL, &maxBufLen);
  uint64_t v2 = (UInt8 *)malloc_type_malloc(maxBufLen + 1, 0x53339A6BuLL);
  if (v2)
  {
    v6.length = CFStringGetLength(a1);
    v6.location = 0;
    CFStringGetBytes(a1, v6, 0x8000100u, 0, 0, v2, maxBufLen, &maxBufLen);
    v2[maxBufLen] = 0;
  }
  return v2;
}

BOOL fsckAskContinue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_100110BF8) {
    return 0;
  }
  long long v9 = *(_OWORD *)(a1 + 16);
  v10[0] = *(_OWORD *)a1;
  v10[1] = v9;
  uint64_t v11 = *(void *)(a1 + 32);
  return fsckAskPrompt((uint64_t)v10, (uint64_t)"CONTINUE? ", a3, a4, a5, a6, a7, a8, *(uint64_t *)&v10[0]) != 1;
}

uint64_t fsckAskPrompt(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (*(void *)a1) {
    return (*(uint64_t (**)(void, uint64_t, uint64_t *))a1)(*(void *)(a1 + 32), a2, &a9);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t exfat_boot_checksum(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0;
  if (a2)
  {
    uint64_t v3 = 0;
    uint64_t v4 = 11 * a2;
    if ((unint64_t)(11 * a2) <= 1) {
      uint64_t v4 = 1;
    }
    do
    {
      if ((unint64_t)(v3 - 106) > 6 || ((1 << (v3 - 106)) & 0x43) == 0)
      {
        HIDWORD(v6) = v2;
        LODWORD(v6) = v2;
        uint64_t v2 = (v6 >> 1) + *(unsigned __int8 *)(a1 + v3);
      }
      ++v3;
    }
    while (v4 != v3);
  }
  return v2;
}

uint64_t exfat_bad_boot_checksum(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    int v2 = 0;
    uint64_t v3 = 0;
    uint64_t v4 = 11 * a2;
    if ((unint64_t)(11 * a2) <= 1) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = 11 * a2;
    }
    do
    {
      if ((unint64_t)(v3 - 106) > 6 || ((1 << (v3 - 106)) & 0x43) == 0)
      {
        HIDWORD(v7) = v2;
        LODWORD(v7) = v2;
        int v2 = (v7 >> 1) + *(unsigned __int8 *)(a1 + v3);
      }
      ++v3;
    }
    while (v5 != v3);
  }
  else
  {
    uint64_t v4 = 0;
    int v2 = 0;
  }
  for (int i = (int *)(a1 + v4); (unint64_t)i < a1 + 12 * a2; ++i)
  {
    int v9 = *i;
    if (v9 != v2) {
      return 1;
    }
  }
  return 0;
}

uint64_t exfat_update_boot_checksum(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    int v2 = 0;
    uint64_t v3 = 0;
    uint64_t v4 = 11 * a2;
    if ((unint64_t)(11 * a2) <= 1) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = 11 * a2;
    }
    do
    {
      if ((unint64_t)(v3 - 106) > 6 || ((1 << (v3 - 106)) & 0x43) == 0)
      {
        HIDWORD(v7) = v2;
        LODWORD(v7) = v2;
        int v2 = (v7 >> 1) + *(unsigned __int8 *)(result + v3);
      }
      ++v3;
    }
    while (v5 != v3);
  }
  else
  {
    uint64_t v4 = 0;
    int v2 = 0;
  }
  if (v4 < 12 * a2)
  {
    unsigned int v8 = (_DWORD *)(result + v4);
    do
      *v8++ = v2;
    while ((unint64_t)v8 < result + 12 * a2);
  }
  return result;
}

uint64_t fsck_exfat_name_hash(uint64_t a1, unsigned char *a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 35);
  if (*(unsigned char *)(a1 + 35))
  {
    unint64_t v3 = 0;
    char v4 = 0;
    int v5 = 0;
    int v6 = 0;
    uint64_t v7 = a1 + 66;
    do
    {
      unsigned __int16 v8 = *(_WORD *)(v7
                    + (((unint64_t)((v3 * (unsigned __int128)0x8888888888888889) >> 64) >> 2) & 0x3FFFFFFFFFFFFFFELL));
      if (v8 < 0x20u
        || (v8 - 34 <= 0x3A
          ? (BOOL v9 = ((1 << (v8 - 34)) & 0x400000035002101) == 0)
          : (BOOL v9 = 1),
            !v9 || v8 == 124))
      {
        char v4 = 1;
      }
      v7 += 2;
      unsigned int v10 = *(unsigned __int16 *)(qword_100110BD0 + 2 * v8);
      int v11 = (((unsigned __int16)v5 >> 1) | (v5 << 15)) + v10;
      int v5 = (((unsigned __int16)v11 >> 1) | (v11 << 15)) + (v10 >> 8);
      ++v6;
      ++v3;
    }
    while (v2 != v6);
  }
  else
  {
    LOWORD(v5) = 0;
    char v4 = 0;
  }
  if (a2) {
    *a2 = v4 & 1;
  }
  return (unsigned __int16)v5;
}

uint64_t CFStringGetNameHash(const __CFString *a1)
{
  uint64_t Length = CFStringGetLength(a1);
  if (!Length) {
    return 0;
  }
  CFIndex v3 = 0;
  int v4 = 0;
  do
  {
    uint64_t v5 = qword_100110BD0;
    unsigned int v6 = *(unsigned __int16 *)(v5 + 2 * CFStringGetCharacterAtIndex(a1, v3));
    int v7 = (((unsigned __int16)v4 >> 1) | (v4 << 15)) + v6;
    int v4 = (((unsigned __int16)v7 >> 1) | (v7 << 15)) + (v6 >> 8);
    ++v3;
  }
  while (Length != v3);
  return (unsigned __int16)((((unsigned __int16)v7 >> 1) | ((_WORD)v7 << 15)) + (v6 >> 8));
}

uint64_t exfat_checksum_file_set(uint64_t a1)
{
  unsigned __int16 v1 = 0;
  uint64_t v2 = 0;
  do
  {
    if ((v2 & 0x7FFFFFFFFFFFFFFELL) != 2) {
      unsigned __int16 v1 = ((v1 >> 1) | (v1 << 15)) + *(unsigned __int8 *)(a1 + v2);
    }
    ++v2;
  }
  while (32 * *(unsigned __int8 *)(a1 + 1) + 32 != v2);
  return v1;
}

uint64_t read_boot_region(int a1)
{
  size_t v2 = (12 * dword_100110B30);
  qword_100110B18 = v2;
  if (a1) {
    off_t v3 = (12 * dword_100110B30);
  }
  else {
    off_t v3 = 0;
  }
  if (qword_100110B10)
  {
    free((void *)qword_100110B10);
    size_t v2 = qword_100110B18;
  }
  int v4 = malloc_type_malloc(v2, 0x2B2C5DDuLL);
  qword_100110B10 = (uint64_t)v4;
  if (!v4)
  {
    warn("Could not allocate space for boot region");
    return 1;
  }
  ssize_t v5 = pread(g, v4, qword_100110B18, v3);
  if (v5 != qword_100110B18)
  {
    warnx("Could not read boot region");
    return 1;
  }
  if ((dword_100110B04 & 0x80000000) == 0
    && pwrite(dword_100110B04, (const void *)qword_100110B10, v5, v3) != qword_100110B18)
  {
    warn("Trouble writing shadow boot region");
  }
  uint64_t v6 = qword_100110B10;
  qword_100110B08 = qword_100110B10;
  if (*(void *)qword_100110B10 != 0x54414658459076EBLL || *(void *)(qword_100110B10 + 3) != 0x2020205441465845)
  {
    if (debug) {
      warnx("Invalid jump or signature");
    }
    return 0xFFFFFFFFLL;
  }
  if ((*(_WORD *)(qword_100110B10 + 104) & 0xFF00) != 0x100)
  {
    if (debug) {
      warnx("Invalid version (%04X)");
    }
    return 0xFFFFFFFFLL;
  }
  int v8 = *(unsigned __int8 *)(qword_100110B10 + 108);
  if ((v8 - 13) <= 0xFFFFFFFB)
  {
    if (debug) {
      warnx("Invalid bytes per sector shift (%d)");
    }
    return 0xFFFFFFFFLL;
  }
  unsigned int v9 = dword_100110B30;
  if (dword_100110B30 != (1 << v8))
  {
    warnx("Device block size (%lu) differs from file system block size (%lu)");
    return 1;
  }
  if (exfat_bad_boot_checksum(qword_100110B10, dword_100110B30))
  {
    if (debug) {
      warnx("Invalid boot region checksum");
    }
    return 0xFFFFFFFFLL;
  }
  unsigned int v11 = *(unsigned __int8 *)(v6 + 109);
  if (v11 > 0x10 || v11 + v8 >= 0x1A)
  {
    if (debug) {
      warnx("Invalid sectors per cluster shift (%d)");
    }
    return 0xFFFFFFFFLL;
  }
  uint32x2_t v12 = vshl_u32((uint32x2_t)(v9 | 0x100000000), (uint32x2_t)vdup_n_s32(v11));
  qword_100110B34 = (uint64_t)v12;
  if (v12.i32[0] < 0x2000001u)
  {
    unint64_t v13 = qword_100110B68;
    if (!qword_100110B68)
    {
      memset(&v20, 0, sizeof(v20));
      if (fstat(g, &v20) < 0)
      {
        if (debug) {
          warnx("Unable to stat after ioctl failure");
        }
        return 0xFFFFFFFFLL;
      }
      if (((__int16)v20.st_mode & 0x80000000) == 0)
      {
        if (debug) {
          warnx("ioctl failed to get blockCount and not regular file, giving up");
        }
        return 0xFFFFFFFFLL;
      }
      unint64_t v13 = v20.st_size / dword_100110B30;
      qword_100110B68 = v13;
      uint64_t v6 = qword_100110B08;
    }
    unint64_t v14 = *(void *)(v6 + 72);
    qword_100110B20 = v14;
    if (v14 > v13)
    {
      if (debug) {
        warnx("File system sector count (%llu) greater than device sector count (%llu)");
      }
      return 0xFFFFFFFFLL;
    }
    dword_100110B28 = *(_DWORD *)(v6 + 80);
    if (v13 <= dword_100110B28)
    {
      if (debug) {
        warnx("Invalid FAT offset (%u)");
      }
      return 0xFFFFFFFFLL;
    }
    unsigned int v15 = *(unsigned __int8 *)(v6 + 110);
    if (v15 - 3 <= 0xFFFFFFFD)
    {
      if (debug) {
        warnx("Invalid number of FATs (%d)");
      }
      return 0xFFFFFFFFLL;
    }
    int v16 = *(_WORD *)(v6 + 106) & 1;
    dword_100110B70 = v16;
    if (v15 == 1 && v16)
    {
      if (debug) {
        warnx("Alternate FAT is active, but there is only one FAT");
      }
      return 0xFFFFFFFFLL;
    }
    dword_100110B3C = *(_DWORD *)(v6 + 84);
    unint64_t v17 = dword_100110B28 + dword_100110B3C * (unint64_t)v15;
    if (v17 > v14)
    {
      if (debug) {
        warnx("Invalid FAT offset (%u), number of FATs (%d), or sectors per FAT (%u)");
      }
      return 0xFFFFFFFFLL;
    }
    dword_100110B2C = *(_DWORD *)(v6 + 88);
    if (v17 > dword_100110B2C || v14 < dword_100110B2C)
    {
      if (debug) {
        warnx("Invalid clusters offset (%u)");
      }
      return 0xFFFFFFFFLL;
    }
    unsigned int v18 = *(_DWORD *)(v6 + 92);
    dword_100110B40 = v18;
    if (dword_100110B2C + HIDWORD(qword_100110B34) * (unint64_t)v18 > v14)
    {
      if (debug) {
        warnx("Invalid clusters offset (%u) or number of clusters (%u)");
      }
      return 0xFFFFFFFFLL;
    }
    unsigned int v19 = *(_DWORD *)(v6 + 96);
    dword_100110B44 = v18 + 1;
    dword_100110B48 = v19;
    if (v19 < 2 || v19 > v18 + 1)
    {
      if (debug) {
        warnx("Invalid root cluster number (%u)");
      }
      return 0xFFFFFFFFLL;
    }
    return 0;
  }
  else
  {
    if (debug) {
      warnx("FSOPS_ReadBootSector: Cluster size not supported: %u\n", v12.i32[0]);
    }
    return 45;
  }
}

uint64_t compare_boot_region(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  long long v34 = ctx;
  long long v35 = *(_OWORD *)&qword_100110C10;
  uint64_t v36 = qword_100110C20;
  if (a1)
  {
    fsckPrint((uint64_t)&v34, 209, a3, a4, a5, a6, a7, a8, v31);
    size_t v9 = qword_100110B18;
    off_t v10 = qword_100110B18;
  }
  else
  {
    fsckPrint((uint64_t)&v34, 208, a3, a4, a5, a6, a7, a8, v31);
    off_t v10 = 0;
    size_t v9 = qword_100110B18;
  }
  unsigned int v11 = malloc_type_malloc(v9, 0x69ABD1E7uLL);
  if (!v11)
  {
    warn("Could not allocate space to compare boot region");
    return 1;
  }
  uint32x2_t v12 = v11;
  ssize_t v13 = pread(g, v11, qword_100110B18, v10);
  if (v13 != qword_100110B18)
  {
    warnx("Could not read boot region for comparison");
    free(v12);
    return 1;
  }
  unint64_t v14 = (unsigned char *)qword_100110B10;
  if (a1)
  {
    v12[106] = *(unsigned char *)(qword_100110B10 + 106);
    v12[107] = v14[107];
    v12[112] = v14[112];
    if (memcmp(v12, v14, v13))
    {
      long long v34 = ctx;
      long long v35 = *(_OWORD *)&qword_100110C10;
      uint64_t v36 = qword_100110C20;
      uint64_t v21 = 305;
      goto LABEL_11;
    }
  }
  else if (memcmp(v12, (const void *)qword_100110B10, v13))
  {
    long long v34 = ctx;
    long long v35 = *(_OWORD *)&qword_100110C10;
    uint64_t v36 = qword_100110C20;
    uint64_t v21 = 304;
LABEL_11:
    fsckPrint((uint64_t)&v34, v21, v15, v16, v17, v18, v19, v20, v32);
    long long v34 = ctx;
    long long v35 = *(_OWORD *)&qword_100110C10;
    uint64_t v36 = qword_100110C20;
    if (fsckAskPrompt((uint64_t)&v34, (uint64_t)"Update? ", v22, v23, v24, v25, v26, v27, v33) == 1)
    {
      if (pwrite(g, (const void *)qword_100110B10, qword_100110B18, v10) == qword_100110B18)
      {
        uint64_t v28 = 0;
        byte_100110BF4 = 1;
      }
      else
      {
        uint64_t v30 = "alternate";
        if (!a1) {
          uint64_t v30 = "main";
        }
        warn("Cannot write %s boot region", v30);
        uint64_t v28 = 1;
        HIBYTE(word_100110BF2) = 1;
      }
    }
    else
    {
      uint64_t v28 = 0;
      LOBYTE(word_100110BF2) = 1;
    }
    goto LABEL_16;
  }
  uint64_t v28 = 0;
LABEL_16:
  free(v12);
  return v28;
}

uint64_t fsckPrint(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (*(void *)(a1 + 8)) {
    return (*(uint64_t (**)(void, uint64_t, uint64_t *))(a1 + 8))(*(void *)(a1 + 32), a2, &a9);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t fsck_exfat_iter_dir_entries(uint64_t a1, unsigned int a2, int a3, uint64_t a4)
{
  unsigned int v38 = *(_DWORD *)(a1 + 24);
  if ((a2 & 0x1F) != 0) {
    sub_100011050();
  }
  unsigned int v5 = a2 + 32 * a3;
  if (v5)
  {
    int v7 = 0;
    uint64_t v8 = 0;
    unsigned int v9 = 0;
    uint64_t v10 = 0;
    uint64_t cluster = 0;
    int v37 = 0;
    do
    {
      if (!(v9 % qword_100110B34))
      {
        if (cluster)
        {
          int v37 = fsck_exfat_cache_release(cluster, v7 & 1, 0);
          if (v37)
          {
            long long v34 = ctx;
            long long v35 = *(_OWORD *)&qword_100110C10;
            uint64_t v36 = qword_100110C20;
            fsck_err((uint64_t)&v34, 1, (uint64_t)"Could not release cluster %u", v12, v13, v14, v15, v16, v38);
          }
          if (*(unsigned char *)(a1 + 39))
          {
            ++v38;
          }
          else
          {
            int v37 = fsck_exfat_fat_get(v38, &v38);
            if (v37)
            {
              long long v34 = ctx;
              long long v35 = *(_OWORD *)&qword_100110C10;
              uint64_t v36 = qword_100110C20;
              fsck_err((uint64_t)&v34, 1, (uint64_t)"Could not read FAT for cluster %u", v17, v18, v19, v20, v21, v38);
            }
          }
        }
        if (v38 < 2 || v38 > dword_100110B44) {
          sub_100011024();
        }
        uint64_t cluster = fsck_exfat_cache_get_cluster(v38, &v37);
        if (!cluster)
        {
          long long v34 = ctx;
          long long v35 = *(_OWORD *)&qword_100110C10;
          uint64_t v36 = qword_100110C20;
          fsck_err((uint64_t)&v34, 1, (uint64_t)"Could not read cluster %u", v22, v23, v24, v25, v26, v38);
        }
        uint64_t v10 = buffer_data(cluster);
        int v7 = 0;
      }
      if (v9 >= a2)
      {
        v7 |= (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a4 + 16))(a4, v8, v10);
        uint64_t v8 = (v8 + 1);
      }
      v9 += 32;
      v10 += 32;
    }
    while (v9 < v5);
    if (cluster)
    {
      int v37 = fsck_exfat_cache_release(cluster, v7 & 1, 0);
      if (v37)
      {
        long long v34 = ctx;
        long long v35 = *(_OWORD *)&qword_100110C10;
        uint64_t v36 = qword_100110C20;
        fsck_err((uint64_t)&v34, 1, (uint64_t)"Could not release cluster %u", v27, v28, v29, v30, v31, v38);
      }
    }
  }
  return 0;
}

uint64_t fsck_err(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (*(void *)(result + 24)) {
    return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t *))(result + 24))(*(void *)(result + 32), a2, a3, &a9);
  }
  return result;
}

uint64_t fsck_exfat_delete_dir_entries(uint64_t a1, unsigned int a2, int a3)
{
  return 0;
}

BOOL sub_100007A6C(id a1, int a2, exfat_direntry *a3)
{
  unsigned __int8 v3 = a3->var0 & 0x7F;
  if (!v3) {
    unsigned __int8 v3 = 5;
  }
  a3->var0 = v3;
  return 1;
}

uint64_t fsck_exfat_write_dir_entries(uint64_t a1, unsigned int a2, int a3, uint64_t a4)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 0x40000000;
  v5[2] = sub_100007AF8;
  v5[3] = &unk_10001C550;
  v5[4] = a4;
  fsck_exfat_iter_dir_entries(a1, a2, a3, (uint64_t)v5);
  return 0;
}

uint64_t sub_100007AF8(uint64_t a1, int a2, _OWORD *a3)
{
  unsigned __int8 v3 = (_OWORD *)(*(void *)(a1 + 32) + 32 * a2);
  long long v4 = v3[1];
  *a3 = *v3;
  a3[1] = v4;
  if (!*(unsigned char *)a3) {
    *(unsigned char *)a3 = 5;
  }
  return 1;
}

uint64_t fsck_exfat_read_dir_entries(uint64_t a1, unsigned int a2, int a3, uint64_t a4)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 0x40000000;
  v5[2] = sub_100007B94;
  v5[3] = &unk_10001C570;
  v5[4] = a4;
  fsck_exfat_iter_dir_entries(a1, a2, a3, (uint64_t)v5);
  return 0;
}

uint64_t sub_100007B94(uint64_t a1, int a2, _OWORD *a3)
{
  long long v3 = a3[1];
  long long v4 = (_OWORD *)(*(void *)(a1 + 32) + 32 * a2);
  _OWORD *v4 = *a3;
  v4[1] = v3;
  return 0;
}

uint64_t fsck_exfat_find_unused_entry(uint64_t a1, uint64_t a2, uint64_t *a3, void *a4)
{
  unsigned int v7 = 0;
  unsigned int v8 = qword_100110B34;
  uint64_t v10 = (unsigned int *)(a1 + 24);
  unsigned int v9 = *(_DWORD *)(a1 + 24);
  int v19 = 0;
  unsigned int v20 = v9;
  if (qword_100110B34 >> 5 <= 1) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = qword_100110B34 >> 5;
  }
  while (v20 >= 2 && v20 <= dword_100110B44)
  {
    uint64_t cluster = fsck_exfat_cache_get_cluster(v20, &v19);
    if (!cluster) {
      return 1;
    }
    uint64_t v14 = cluster;
    uint64_t v15 = (char *)buffer_data(cluster);
    if (v8 >= 0x20)
    {
      v7 += 32 * v11;
      uint64_t v16 = v11;
      while (*v15 < 0)
      {
        v15 += 32;
        if (!--v16) {
          goto LABEL_13;
        }
      }
      uint64_t v17 = 0;
      *a3 = v14;
      *a4 = v15;
      return v17;
    }
LABEL_13:
    int v19 = fsck_exfat_cache_release(v14, 0, 0);
    if (!v19)
    {
      int v19 = fsck_exfat_fat_get(v20, &v20);
      if (!v19) {
        continue;
      }
    }
    return 1;
  }
  unint64_t v21 = v7;
  int v19 = fsck_exfat_extend_chain(v10, &v21, qword_100110B34 + (unint64_t)v7);
  if (v19) {
    return 1;
  }
  ++*(_DWORD *)(a1 + 28);
  fsck_exfat_read_dir_entry(a1, v7, a3, a4);
  return 0;
}

uint64_t fsck_exfat_read_dir_entry(uint64_t a1, unsigned int a2, uint64_t *a3, void *a4)
{
  if ((a2 & 0x1F) != 0) {
    sub_1000110A8();
  }
  uint64_t v6 = *(unsigned int *)(a1 + 24);
  int v37 = 0;
  unsigned int v38 = v6;
  uint64_t cluster = fsck_exfat_cache_get_cluster(v6, &v37);
  if (!cluster)
  {
    long long v34 = ctx;
    long long v35 = *(_OWORD *)&qword_100110C10;
    uint64_t v36 = qword_100110C20;
    fsck_err((uint64_t)&v34, 1, (uint64_t)"Could not read cluster %u", v7, v8, v9, v10, v11, v6);
  }
  if (qword_100110B34 <= a2)
  {
    int v13 = 0;
    do
    {
      int v37 = fsck_exfat_cache_release(cluster, 0, 0);
      if (v37)
      {
        long long v34 = ctx;
        long long v35 = *(_OWORD *)&qword_100110C10;
        uint64_t v36 = qword_100110C20;
        fsck_err((uint64_t)&v34, 1, (uint64_t)"Could not release cluster %u", v14, v15, v16, v17, v18, v38);
      }
      if (*(unsigned char *)(a1 + 39))
      {
        unsigned int v19 = ++v38;
      }
      else
      {
        int v37 = fsck_exfat_fat_get(v38, &v38);
        unsigned int v19 = v38;
        if (v37)
        {
          long long v34 = ctx;
          long long v35 = *(_OWORD *)&qword_100110C10;
          uint64_t v36 = qword_100110C20;
          fsck_err((uint64_t)&v34, 1, (uint64_t)"Could not read FAT for cluster %u", v20, v21, v22, v23, v24, v38);
          unsigned int v19 = v38;
        }
      }
      if (v19 < 2 || v19 > dword_100110B44) {
        sub_10001107C();
      }
      uint64_t cluster = fsck_exfat_cache_get_cluster(v19, &v37);
      if (!cluster)
      {
        long long v34 = ctx;
        long long v35 = *(_OWORD *)&qword_100110C10;
        uint64_t v36 = qword_100110C20;
        fsck_err((uint64_t)&v34, 1, (uint64_t)"Could not read cluster %u", v26, v27, v28, v29, v30, v38);
      }
      v13 += qword_100110B34;
    }
    while ((int)qword_100110B34 + v13 <= a2);
  }
  *a3 = cluster;
  *a4 = buffer_data(cluster) + a2 % qword_100110B34;
  return 0;
}

uint64_t fsck_exfat_check_allocation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a2) {
    sub_1000110D4();
  }
  unsigned int v96 = 0;
  unsigned int v10 = *(_DWORD *)(a1 + 16);
  BOOL v12 = v10 == 1 || v10 > dword_100110B44;
  if (v12)
  {
    long long v93 = ctx;
    long long v94 = *(_OWORD *)&qword_100110C10;
    uint64_t v95 = qword_100110C20;
    fsckPrint((uint64_t)&v93, 401, a3, a4, a5, a6, a7, a8, a2);
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
    *(unsigned char *)(a1 + 24) &= ~2u;
    long long v93 = ctx;
    long long v94 = *(_OWORD *)&qword_100110C10;
    uint64_t v95 = qword_100110C20;
    if (fsckAskPrompt((uint64_t)&v93, (uint64_t)"Truncate? ", v13, v14, v15, v16, v17, v18, v84) != 1) {
      goto LABEL_82;
    }
    unsigned int v10 = *(_DWORD *)(a1 + 16);
  }
  unint64_t v19 = *(void *)a1;
  if (*(void *)a1)
  {
    if (v10) {
      goto LABEL_22;
    }
    goto LABEL_13;
  }
  if (v10)
  {
    long long v93 = ctx;
    long long v94 = *(_OWORD *)&qword_100110C10;
    uint64_t v95 = qword_100110C20;
    fsckPrint((uint64_t)&v93, 408, a3, a4, a5, a6, a7, a8, a2);
    *(void *)(a1 + 16) = 0;
    *(unsigned char *)(a1 + 24) &= ~2u;
    long long v93 = ctx;
    long long v94 = *(_OWORD *)&qword_100110C10;
    uint64_t v95 = qword_100110C20;
    if (fsckAskPrompt((uint64_t)&v93, (uint64_t)"Truncate? ", v26, v27, v28, v29, v30, v31, v86) != 1) {
      goto LABEL_82;
    }
    unint64_t v19 = *(void *)a1;
    if (!*(void *)a1)
    {
LABEL_20:
      BOOL v12 = 1;
      goto LABEL_22;
    }
    BOOL v12 = 1;
    if (*(_DWORD *)(a1 + 16)) {
      goto LABEL_22;
    }
LABEL_13:
    long long v93 = ctx;
    long long v94 = *(_OWORD *)&qword_100110C10;
    uint64_t v95 = qword_100110C20;
    fsckPrint((uint64_t)&v93, 401, a3, a4, a5, a6, a7, a8, a2);
    *(_DWORD *)(a1 + 20) = 0;
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0;
    *(unsigned char *)(a1 + 24) &= ~2u;
    long long v93 = ctx;
    long long v94 = *(_OWORD *)&qword_100110C10;
    uint64_t v95 = qword_100110C20;
    if (fsckAskPrompt((uint64_t)&v93, (uint64_t)"Truncate? ", v20, v21, v22, v23, v24, v25, v85) != 1) {
      goto LABEL_82;
    }
    unint64_t v19 = *(void *)a1;
    goto LABEL_20;
  }
  unint64_t v19 = 0;
LABEL_22:
  unsigned int v96 = 0;
  if (v19 % qword_100110B34) {
    unsigned int v32 = v19 / qword_100110B34 + 1;
  }
  else {
    unsigned int v32 = v19 / qword_100110B34;
  }
  if (v19 > qword_100110B34 * (unint64_t)v32)
  {
    if (debug) {
      warnx("dataLength (%llu) overflows 32 bits of clusters", v19);
    }
    unsigned int v32 = -1;
  }
  uint64_t v33 = *(unsigned int *)(a1 + 16);
  if (!v33) {
    goto LABEL_66;
  }
  if ((*(unsigned char *)(a1 + 24) & 2) == 0)
  {
    int v34 = fsck_exfat_fat_alloc_chain(v33, &v96, a2, a4, a5, a6, a7, a8);
    unsigned int v35 = v96;
    *(_DWORD *)(a1 + 20) = v96;
    if (!v35) {
      *(_DWORD *)(a1 + 16) = 0;
    }
    if (v34)
    {
      if (v35 < v32)
      {
        long long v93 = ctx;
        long long v94 = *(_OWORD *)&qword_100110C10;
        uint64_t v95 = qword_100110C20;
        fsckPrint((uint64_t)&v93, 406, a3, a4, a5, a6, a7, a8, a2);
        unint64_t v42 = qword_100110B34 * v96;
        *(void *)a1 = v42;
        if (*(void *)(a1 + 8) > v42) {
          *(void *)(a1 + 8) = v42;
        }
        long long v93 = ctx;
        long long v94 = *(_OWORD *)&qword_100110C10;
        uint64_t v95 = qword_100110C20;
        if (fsckAskPrompt((uint64_t)&v93, (uint64_t)"Truncate? ", v36, v37, v38, v39, v40, v41, v87) != 1
          || fsck_exfat_truncate_chain(*(_DWORD *)(a1 + 16), v96, v96))
        {
          goto LABEL_82;
        }
        BOOL v12 = 1;
        unsigned int v35 = v96;
      }
      if (v35 >= v32)
      {
        long long v93 = ctx;
        long long v94 = *(_OWORD *)&qword_100110C10;
        uint64_t v95 = qword_100110C20;
        uint64_t v43 = 405;
LABEL_63:
        fsckPrint((uint64_t)&v93, v43, a3, a4, a5, a6, a7, a8, v83);
        long long v93 = ctx;
        long long v94 = *(_OWORD *)&qword_100110C10;
        uint64_t v95 = qword_100110C20;
        if (fsckAskPrompt((uint64_t)&v93, (uint64_t)"Truncate? ", v69, v70, v71, v72, v73, v74, v91) != 1
          || fsck_exfat_truncate_chain(*(_DWORD *)(a1 + 16), v32, v96))
        {
          goto LABEL_82;
        }
        goto LABEL_81;
      }
    }
    else
    {
      if (v35 < v32)
      {
        long long v93 = ctx;
        long long v94 = *(_OWORD *)&qword_100110C10;
        uint64_t v95 = qword_100110C20;
        fsckPrint((uint64_t)&v93, 406, a3, a4, a5, a6, a7, a8, a2);
        unint64_t v68 = qword_100110B34 * v96;
        *(void *)a1 = v68;
        if (*(void *)(a1 + 8) > v68) {
          *(void *)(a1 + 8) = v68;
        }
        long long v93 = ctx;
        long long v94 = *(_OWORD *)&qword_100110C10;
        uint64_t v95 = qword_100110C20;
        if (fsckAskPrompt((uint64_t)&v93, (uint64_t)"Truncate? ", v62, v63, v64, v65, v66, v67, v90) != 1) {
          goto LABEL_82;
        }
        BOOL v12 = 1;
        unsigned int v35 = v96;
      }
      if (v35 > v32)
      {
        long long v93 = ctx;
        long long v94 = *(_OWORD *)&qword_100110C10;
        uint64_t v95 = qword_100110C20;
        uint64_t v83 = a2;
        uint64_t v43 = 407;
        goto LABEL_63;
      }
    }
LABEL_66:
    BOOL v52 = 0;
    goto LABEL_67;
  }
  if (v33 < 2 || v33 > dword_100110B44) {
    sub_10001112C();
  }
  if (v33 + (unint64_t)v32 - 1 <= dword_100110B44)
  {
    BOOL v52 = 0;
  }
  else
  {
    long long v93 = ctx;
    long long v94 = *(_OWORD *)&qword_100110C10;
    uint64_t v95 = qword_100110C20;
    fsckPrint((uint64_t)&v93, 403, a3, a4, a5, a6, a7, a8, a2);
    unsigned int v32 = dword_100110B44 - *(_DWORD *)(a1 + 16) + 1;
    unint64_t v50 = v32 * qword_100110B34;
    *(void *)a1 = v50;
    *(_DWORD *)(a1 + 20) = v32;
    if (*(void *)(a1 + 8) > v50) {
      *(void *)(a1 + 8) = v50;
    }
    long long v93 = ctx;
    long long v94 = *(_OWORD *)&qword_100110C10;
    uint64_t v95 = qword_100110C20;
    int v51 = fsckAskPrompt((uint64_t)&v93, (uint64_t)"Truncate? ", v44, v45, v46, v47, v48, v49, v88);
    BOOL v52 = v51 != 1;
    if (v51 == 1) {
      BOOL v12 = 1;
    }
    LODWORD(v33) = *(_DWORD *)(a1 + 16);
  }
  int v53 = fsck_exfat_bitmap_allocate(v33, v32, &v96);
  *(_DWORD *)(a1 + 20) = v96;
  if (v53)
  {
    long long v93 = ctx;
    long long v94 = *(_OWORD *)&qword_100110C10;
    uint64_t v95 = qword_100110C20;
    fsckPrint((uint64_t)&v93, 404, a3, a4, a5, a6, a7, a8, a2);
    unsigned int v60 = v96;
    unint64_t v61 = qword_100110B34 * v96;
    *(void *)a1 = v61;
    if (*(void *)(a1 + 8) > v61)
    {
      *(void *)(a1 + 8) = v61;
      if (v60)
      {
LABEL_54:
        if (v52) {
          goto LABEL_82;
        }
LABEL_80:
        long long v93 = ctx;
        long long v94 = *(_OWORD *)&qword_100110C10;
        uint64_t v95 = qword_100110C20;
        if (fsckAskPrompt((uint64_t)&v93, (uint64_t)"Truncate? ", v54, v55, v56, v57, v58, v59, v89) == 1)
        {
LABEL_81:
          BOOL v52 = 0;
          BOOL v12 = 1;
          goto LABEL_67;
        }
LABEL_82:
        LOBYTE(word_100110BF2) = 1;
        return 0xFFFFFFFFLL;
      }
    }
    else if (v60)
    {
      goto LABEL_54;
    }
    *(_DWORD *)(a1 + 16) = 0;
    if (v52) {
      goto LABEL_82;
    }
    goto LABEL_80;
  }
LABEL_67:
  if (*(void *)(a1 + 8) > *(void *)a1)
  {
    long long v93 = ctx;
    long long v94 = *(_OWORD *)&qword_100110C10;
    uint64_t v95 = qword_100110C20;
    fsckPrint((uint64_t)&v93, 410, a3, a4, a5, a6, a7, a8, a2);
    *(void *)(a1 + 8) = *(void *)a1;
    if (v52) {
      goto LABEL_82;
    }
    long long v93 = ctx;
    long long v94 = *(_OWORD *)&qword_100110C10;
    uint64_t v95 = qword_100110C20;
    if (fsckAskPrompt((uint64_t)&v93, (uint64_t)"Truncate? ", v75, v76, v77, v78, v79, v80, v92) != 1) {
      goto LABEL_82;
    }
    goto LABEL_73;
  }
  if (v52 && v12) {
    sub_100011100();
  }
  if (v12)
  {
LABEL_73:
    unsigned int v81 = 1;
    goto LABEL_75;
  }
  unsigned int v81 = 0;
LABEL_75:
  if (v52) {
    return 0xFFFFFFFFLL;
  }
  else {
    return v81;
  }
}

uint64_t fsck_exfat_scan_root(uint64_t a1, _DWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = qword_100110B34;
  *(void *)&dword_100110BD8 = -1;
  dword_100110BE0 = -1;
  long long v97 = 0u;
  long long v98 = 0u;
  unsigned int v9 = *(_DWORD *)(a1 + 24);
  unsigned int v95 = 0;
  unsigned int v96 = v9;
  BOOL v10 = v9 < 2 || v9 > dword_100110B44;
  uint64_t v11 = &unk_100110000;
  if (!v10)
  {
    unsigned int v13 = 0;
    unsigned int v14 = 0;
    if (qword_100110B34 >> 5 <= 1) {
      unsigned int v15 = 1;
    }
    else {
      unsigned int v15 = qword_100110B34 >> 5;
    }
    while (1)
    {
      if (v13 >= *(_DWORD *)(a1 + 28)) {
        goto LABEL_86;
      }
      uint64_t cluster = fsck_exfat_cache_get_cluster(v9, (int *)&v95);
      if (!cluster) {
        goto LABEL_86;
      }
      uint64_t v17 = cluster;
      unsigned int v93 = v13;
      uint64_t v18 = buffer_data(cluster);
      if (v8 >= 0x20) {
        break;
      }
LABEL_11:
      unsigned int v95 = fsck_exfat_cache_release(v17, 0, 0);
      if (!v95)
      {
        unsigned int v95 = fsck_exfat_fat_get(v96, &v96);
        if (!v95)
        {
          unsigned int v9 = v96;
          if (v96 >= 2)
          {
            unsigned int v13 = v93 + 1;
            if (v96 <= dword_100110B44) {
              continue;
            }
          }
        }
      }
      goto LABEL_86;
    }
    uint64_t v25 = (unsigned __int8 *)v18;
    int v26 = 0;
    while (1)
    {
      unsigned int v27 = *v25;
      if (v27 <= 0x81) {
        break;
      }
      if (v27 != 130)
      {
        if (v27 != 131) {
          goto LABEL_68;
        }
        uint64_t v28 = v25[1];
        if (!v25[1]) {
          goto LABEL_68;
        }
        if (v28 > 0xB)
        {
          long long v99 = ctx;
          long long v100 = *(_OWORD *)&qword_100110C10;
          uint64_t v101 = qword_100110C20;
          uint64_t v29 = 434;
          goto LABEL_58;
        }
        uint64_t v52 = 0;
        CFIndex v19 = 2 * v28;
        do
        {
          unsigned int v53 = *(unsigned __int16 *)&v25[v52 + 2];
          if (v53 - 34 <= 0x3A && ((1 << (v53 - 34)) & 0x400000035002101) != 0) {
            goto LABEL_57;
          }
          if (v53 == 124 || v53 <= 0x1F) {
            goto LABEL_57;
          }
          v52 += 2;
        }
        while (v19 != v52);
        if (v53 == 46)
        {
LABEL_57:
          long long v99 = ctx;
          long long v100 = *(_OWORD *)&qword_100110C10;
          uint64_t v101 = qword_100110C20;
          uint64_t v29 = 435;
          goto LABEL_58;
        }
        CFStringRef v69 = CFStringCreateWithBytes(kCFAllocatorDefault, v25 + 2, v19, 0x14000100u, 0);
        if (v69)
        {
          CFStringRef cf = v69;
          if (CFStringGetCString(v69, byte_100110B74, 64, 0x8000100u))
          {
            long long v99 = ctx;
            long long v100 = *(_OWORD *)&qword_100110C10;
            uint64_t v101 = qword_100110C20;
            fsckPrint((uint64_t)&v99, 207, v70, v71, v72, v73, v74, v75, (uint64_t)byte_100110B74);
            CFRelease(cf);
            goto LABEL_68;
          }
          long long v99 = ctx;
          long long v100 = *(_OWORD *)&qword_100110C10;
          uint64_t v101 = qword_100110C20;
          fsckPrint((uint64_t)&v99, 412, v70, v71, v72, v73, v74, v75, v87);
          CFRelease(cf);
        }
        else
        {
          long long v99 = ctx;
          long long v100 = *(_OWORD *)&qword_100110C10;
          uint64_t v101 = qword_100110C20;
          uint64_t v29 = 411;
LABEL_58:
          fsckPrint((uint64_t)&v99, v29, v19, v20, v21, v22, v23, v24, v87);
        }
        long long v99 = ctx;
        long long v100 = *(_OWORD *)&qword_100110C10;
        uint64_t v101 = qword_100110C20;
        if (fsckAskPrompt((uint64_t)&v99, (uint64_t)"Set name length to 0? ", v56, v57, v58, v59, v60, v61, v89) == 1)
        {
          v25[1] = 0;
LABEL_66:
          fsck_exfat_cache_mark_dirty(v17);
          byte_100110BF4 = 1;
          goto LABEL_68;
        }
        goto LABEL_67;
      }
      int v33 = *((_DWORD *)v25 + 5);
      LODWORD(v98) = v33;
      uint64_t v34 = *((void *)v25 + 3);
      *(void *)&long long v97 = v34;
      *((void *)&v97 + 1) = v34;
      BYTE8(v98) = 1;
      if (dword_100110BE0 == -1)
      {
        dword_100110BE4 = v33;
        qword_100110BE8 = v34;
        unsigned int v41 = fsck_exfat_check_allocation((uint64_t)&v97, (uint64_t)"Upcase", v19, v20, v21, v22, v23, v24);
        unsigned int v95 = v41;
        if (!v41) {
          goto LABEL_40;
        }
        byte_100110BF6 = 1;
        if (v41 == 1)
        {
          int v42 = v98;
          *((_DWORD *)v25 + 5) = v98;
          uint64_t v43 = v8;
          uint64_t v44 = v97;
          *((void *)v25 + 3) = v97;
          *(void *)&long long v99 = _NSConcreteStackBlock;
          *((void *)&v99 + 1) = 0x40000000;
          *(void *)&long long v100 = sub_100007AF8;
          *((void *)&v100 + 1) = &unk_10001C550;
          uint64_t v101 = (uint64_t)v25;
          fsck_exfat_iter_dir_entries(a1, v14, 1, (uint64_t)&v99);
          unsigned int v95 = 0;
          byte_100110BF4 = 1;
          dword_100110BE4 = v42;
          uint64_t v11 = (_DWORD *)&unk_100110000;
          qword_100110BE8 = v44;
          uint64_t v8 = v43;
LABEL_40:
          if (!byte_100110BF6)
          {
            long long v99 = ctx;
            long long v100 = *(_OWORD *)&qword_100110C10;
            uint64_t v101 = qword_100110C20;
            fsckPrint((uint64_t)&v99, 204, v19, v20, v21, v22, v23, v24, v87);
            if (fsck_exfat_read_upcase((uint64_t)v25, v45, v46, v47, v48, v49, v50, v51)) {
              byte_100110BF6 = 1;
            }
          }
        }
        dword_100110BE0 = v14;
LABEL_68:
        if (a2) {
          ++*a2;
        }
        goto LABEL_70;
      }
      long long v99 = ctx;
      long long v100 = *(_OWORD *)&qword_100110C10;
      uint64_t v101 = qword_100110C20;
      fsckPrint((uint64_t)&v99, 418, v19, v20, v21, v22, v23, v24, v87);
      long long v99 = ctx;
      long long v100 = *(_OWORD *)&qword_100110C10;
      uint64_t v101 = qword_100110C20;
      if (fsckAskPrompt((uint64_t)&v99, (uint64_t)"Delete? ", v35, v36, v37, v38, v39, v40, v88) == 1)
      {
        *v25 &= ~0x80u;
        fsck_exfat_cache_mark_dirty(v17);
        byte_100110BF4 = 1;
      }
      else
      {
        LOBYTE(word_100110BF2) = 1;
      }
LABEL_70:
      ++v26;
      v25 += 32;
      v14 += 32;
      if (v26 == v15) {
        goto LABEL_11;
      }
    }
    if (v27 != 129)
    {
      if (!*v25)
      {
        unsigned int v95 = fsck_exfat_cache_release(v17, 0, 0);
        goto LABEL_86;
      }
      goto LABEL_68;
    }
    unsigned __int8 v30 = v25[1];
    if (v30) {
      uint64_t v31 = "Alternate Bitmap";
    }
    else {
      uint64_t v31 = "Main Bitmap";
    }
    LODWORD(v98) = *((_DWORD *)v25 + 5);
    *(void *)&long long v97 = *((void *)v25 + 3);
    *((void *)&v97 + 1) = v97;
    BYTE8(v98) = 1;
    if ((v30 & 1) == 0)
    {
      if (v11[758] != -1)
      {
        long long v99 = ctx;
        long long v100 = *(_OWORD *)&qword_100110C10;
        uint64_t v101 = qword_100110C20;
        uint64_t v32 = 413;
        goto LABEL_64;
      }
      v11[758] = v14;
LABEL_74:
      unsigned int v68 = fsck_exfat_check_allocation((uint64_t)&v97, (uint64_t)v31, v19, v20, v21, v22, v23, v24);
      unsigned int v95 = v68;
      if (v68 == -1)
      {
        byte_100110BF5 = 1;
      }
      else if (v68 == 1)
      {
        *((_DWORD *)v25 + 5) = v98;
        *((void *)v25 + 3) = v97;
        *(void *)&long long v99 = _NSConcreteStackBlock;
        *((void *)&v99 + 1) = 0x40000000;
        *(void *)&long long v100 = sub_100007AF8;
        *((void *)&v100 + 1) = &unk_10001C550;
        uint64_t v101 = (uint64_t)v25;
        fsck_exfat_iter_dir_entries(a1, v14, 1, (uint64_t)&v99);
        unsigned int v95 = 0;
        byte_100110BF4 = 1;
      }
      if (dword_100110B70 == (v25[1] & 1))
      {
        dword_100110B4C = v98;
        qword_100110B50 = v97;
        if (debug)
        {
          long long v99 = ctx;
          long long v100 = *(_OWORD *)&qword_100110C10;
          uint64_t v101 = qword_100110C20;
          fsck_printf((uint64_t)&v99, (uint64_t)"Found active bitmap; first cluster %u, length %llu\n",
            v19,
            v20,
            v21,
            v22,
            v23,
            v24,
            v98);
        }
      }
      goto LABEL_68;
    }
    if (*(unsigned __int8 *)(qword_100110B08 + 110) > 1u)
    {
      if (dword_100110BDC == -1)
      {
        dword_100110BDC = v14;
        goto LABEL_74;
      }
      long long v99 = ctx;
      long long v100 = *(_OWORD *)&qword_100110C10;
      uint64_t v101 = qword_100110C20;
      uint64_t v32 = 414;
    }
    else
    {
      long long v99 = ctx;
      long long v100 = *(_OWORD *)&qword_100110C10;
      uint64_t v101 = qword_100110C20;
      uint64_t v32 = 436;
    }
LABEL_64:
    fsckPrint((uint64_t)&v99, v32, v19, v20, v21, v22, v23, v24, v87);
    long long v99 = ctx;
    long long v100 = *(_OWORD *)&qword_100110C10;
    uint64_t v101 = qword_100110C20;
    if (fsckAskPrompt((uint64_t)&v99, (uint64_t)"Delete? ", v62, v63, v64, v65, v66, v67, v90) == 1)
    {
      *v25 &= ~0x80u;
      goto LABEL_66;
    }
LABEL_67:
    LOBYTE(word_100110BF2) = 1;
    goto LABEL_68;
  }
LABEL_86:
  if (dword_100110BE0 == -1)
  {
    long long v99 = ctx;
    long long v100 = *(_OWORD *)&qword_100110C10;
    uint64_t v101 = qword_100110C20;
    fsckPrint((uint64_t)&v99, 417, a3, a4, a5, a6, a7, a8, v87);
    if (dword_100110BF8)
    {
      unsigned int v95 = 0;
    }
    else
    {
      long long v99 = ctx;
      long long v100 = *(_OWORD *)&qword_100110C10;
      uint64_t v101 = qword_100110C20;
      int v76 = fsckAskPrompt((uint64_t)&v99, (uint64_t)"CONTINUE? ", a3, a4, a5, a6, a7, a8, v87);
      unsigned int v95 = v76 != 1;
      if (v76 != 1) {
        return 1;
      }
    }
  }
  if (byte_100110BF6) {
    BOOL v77 = 1;
  }
  else {
    BOOL v77 = dword_100110BE0 == -1;
  }
  if (v77)
  {
    long long v99 = ctx;
    long long v100 = *(_OWORD *)&qword_100110C10;
    uint64_t v101 = qword_100110C20;
    fsckPrint((uint64_t)&v99, 423, a3, a4, a5, a6, a7, a8, v87);
    unsigned int v95 = fsck_exfat_decompress_upcase(qword_100110BD0, (uint64_t)&default_upcase_table, default_upcase_table_size);
    if (v95) {
      sub_100011158();
    }
  }
  if (v11[758] != -1) {
    goto LABEL_101;
  }
  long long v99 = ctx;
  long long v100 = *(_OWORD *)&qword_100110C10;
  uint64_t v101 = qword_100110C20;
  fsckPrint((uint64_t)&v99, 415, a3, a4, a5, a6, a7, a8, v87);
  if (!dword_100110BF8)
  {
    long long v99 = ctx;
    long long v100 = *(_OWORD *)&qword_100110C10;
    uint64_t v101 = qword_100110C20;
    int v78 = fsckAskPrompt((uint64_t)&v99, (uint64_t)"CONTINUE? ", a3, a4, a5, a6, a7, a8, v87);
    unsigned int v95 = v78 != 1;
    if (v78 == 1) {
      goto LABEL_101;
    }
    return 1;
  }
  unsigned int v95 = 0;
LABEL_101:
  if (*(unsigned char *)(qword_100110B08 + 110) != 2 || dword_100110BDC != -1) {
    return v95;
  }
  long long v99 = ctx;
  long long v100 = *(_OWORD *)&qword_100110C10;
  uint64_t v101 = qword_100110C20;
  fsckPrint((uint64_t)&v99, 416, a3, a4, a5, a6, a7, a8, v87);
  if (dword_100110BF8) {
    return 0;
  }
  long long v99 = ctx;
  long long v100 = *(_OWORD *)&qword_100110C10;
  uint64_t v101 = qword_100110C20;
  return fsckAskPrompt((uint64_t)&v99, (uint64_t)"CONTINUE? ", v81, v82, v83, v84, v85, v86, v91) != 1;
}

uint64_t fsck_printf(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (*(void *)(result + 16)) {
    return (*(uint64_t (**)(void, uint64_t, uint64_t *))(result + 16))(*(void *)(result + 32), a2, &a9);
  }
  return result;
}

uint64_t fsck_exfat_dir_ref(uint64_t result)
{
  int v1 = *(_DWORD *)(result + 32);
  *(_DWORD *)(result + 32) = v1 + 1;
  if (v1 == -1) {
    sub_100011184();
  }
  return result;
}

void fsck_exfat_dir_rele(int *a1)
{
  if (a1[8] < 1) {
    sub_1000111B0();
  }
  int v1 = a1;
  while (v1[8] == 1)
  {
    size_t v2 = (const void *)*((void *)v1 + 1);
    if (v2) {
      CFRelease(v2);
    }
    long long v3 = *(int **)v1;
    free(v1);
    int v1 = v3;
    if (!v3) {
      return;
    }
  }
  --v1[8];
}

char *fsck_exfat_dir_from_file_set(uint64_t a1)
{
  uint64_t v7 = (char *)malloc_type_calloc(1uLL, 0x28uLL, 0x1060040E3ABEE6CuLL);
  if (!v7)
  {
    v10[1] = *((CFMutableStringRef *)&ctx + 1);
    long long v11 = *(_OWORD *)&qword_100110C10;
    uint64_t v12 = qword_100110C20;
    fsck_err((uint64_t)v10, 1, (uint64_t)"Cannot allocate struct fsck_exfat_dir", v2, v3, v4, v5, v6, ctx);
  }
  *((_WORD *)v7 + 18) = *(_WORD *)(a1 + 36);
  v7[38] = *(unsigned char *)(a1 + 35);
  *((_DWORD *)v7 + 6) = *(_DWORD *)(a1 + 52);
  *(void *)(v7 + 28) = &_mh_execute_header;
  if ((*(unsigned char *)(a1 + 33) & 2) != 0) {
    v7[39] = 1;
  }
  CFMutableStringRef Mutable = CFStringCreateMutable(0, 0);
  v10[0] = Mutable;
  sub_100008FEC(a1, v10, v7[38]);
  *((void *)v7 + 1) = CFStringCreateCopy(0, Mutable);
  CFRelease(Mutable);
  return v7;
}

void sub_100008FEC(uint64_t a1, CFMutableStringRef *a2, int a3)
{
  if (a3)
  {
    unint64_t v5 = 0;
    uint64_t v6 = a1 + 66;
    do
    {
      int v7 = *(unsigned __int16 *)(v6
                               + (((unint64_t)((v5 * (unsigned __int128)0x8888888888888889) >> 64) >> 2) & 0x3FFFFFFFFFFFFFFELL));
      UniChar chars = v7;
      if ((unsigned __int16)(v7 + 4095) <= 0x28u) {
        UniChar chars = byte_100017D58[v7 - 61441];
      }
      v6 += 2;
      CFStringAppendCharacters(*a2, &chars, 1);
      ++v5;
    }
    while (a3 != v5);
  }
}

char *fsck_exfat_dir_get_path(uint64_t **a1)
{
  int v1 = a1;
  if (*a1)
  {
    CFMutableStringRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    do
    {
      CFArrayInsertValueAtIndex(Mutable, 0, v1[1]);
      int v1 = (uint64_t **)*v1;
    }
    while (v1);
    CFStringRef v3 = CFStringCreateByCombiningStrings(0, Mutable, @"/");
    CFRelease(Mutable);
    goto LABEL_7;
  }
  if (CFStringGetLength((CFStringRef)a1[1]))
  {
    CFStringRef v3 = (const __CFString *)CFRetain(v1[1]);
LABEL_7:
    uint64_t v4 = CFStringCopyCStringUTF8(v3);
    CFRelease(v3);
    return (char *)v4;
  }

  return strdup("/");
}

CFStringRef CFStringCopyFilenameExtension(const __CFString *a1)
{
  CFIndex Length = CFStringGetLength(a1);
  if (Length < 2) {
    goto LABEL_11;
  }
  CFIndex v3 = Length;
  uint64_t v4 = 0;
  while (1)
  {
    int CharacterAtIndex = CFStringGetCharacterAtIndex(a1, v3 + v4 - 1);
    if (CharacterAtIndex == 46) {
      break;
    }
    if ((CharacterAtIndex - 127) > 0xFFFFFFA0)
    {
      --v4;
      if (v3 + v4 > 1) {
        continue;
      }
    }
    goto LABEL_11;
  }
  if (v4)
  {
    v8.location = v3 + v4 - 1;
    v8.length = 1 - v4;
    return CFStringCreateWithSubstring(0, a1, v8);
  }
  else
  {
LABEL_11:
    return (CFStringRef)CFRetain(&stru_10001C6B0);
  }
}

uint64_t fsck_exfat_rename_file_set()
{
  uint64_t v0 = __chkstk_darwin();
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  memset(v17, 0, sizeof(v17));
  uint64_t v1 = *(void *)v0;
  unsigned int v2 = *(_DWORD *)(v0 + 16);
  int v3 = *(_DWORD *)(v0 + 20);
  uint64_t v48 = _NSConcreteStackBlock;
  uint64_t v49 = 0x40000000;
  uint64_t v50 = sub_100007B94;
  uint64_t v51 = &unk_10001C570;
  uint64_t v52 = v17;
  fsck_exfat_iter_dir_entries(v1, v2, v3, (uint64_t)&v48);
  unsigned int Length = CFStringGetLength(*(CFStringRef *)(v0 + 8));
  unsigned int v5 = Length;
  if (Length - 256 < 0xFFFFFF01) {
    sub_1000111DC();
  }
  CFIndex v6 = 0;
  uint64_t v7 = Length;
  do
  {
    *((_WORD *)&v17[2 * (v6 / 0xFuLL) + 4] + v6 % 0xF + 1) = CFStringGetCharacterAtIndex(*(CFStringRef *)(v0 + 8), v6);
    ++v6;
  }
  while (v7 != v6);
  if (-286331153 * v5 >= 0x11111112)
  {
    unsigned int v8 = v5 + 1;
    unsigned int v9 = v5;
    do
    {
      ++v9;
      *((_WORD *)&v17[2 * (v8 / 0xFuLL) + 4] + v8 % 0xF + 1) = 0;
      ++v8;
    }
    while (-15 * (v9 / 0xF) + v8 != 1);
  }
  BYTE3(v18) = v5;
  __int16 v10 = fsck_exfat_name_hash((uint64_t)v17, 0);
  unsigned __int16 v11 = 0;
  uint64_t v12 = 0;
  WORD2(v18) = v10;
  do
  {
    if ((v12 & 0x7FFFFFFFFFFFFFFELL) != 2) {
      unsigned __int16 v11 = ((v11 >> 1) | (v11 << 15)) + *((unsigned __int8 *)v17 + v12);
    }
    ++v12;
  }
  while (32 * BYTE1(v17[0]) + 32 != v12);
  WORD1(v17[0]) = v11;
  uint64_t v13 = *(void *)v0;
  unsigned int v14 = *(_DWORD *)(v0 + 16);
  int v15 = *(_DWORD *)(v0 + 20);
  uint64_t v48 = _NSConcreteStackBlock;
  uint64_t v49 = 0x40000000;
  uint64_t v50 = sub_100007AF8;
  uint64_t v51 = &unk_10001C550;
  uint64_t v52 = v17;
  fsck_exfat_iter_dir_entries(v13, v14, v15, (uint64_t)&v48);
  return 0;
}

uint64_t fsck_exfat_rename_names(int a1, CFArrayRef theArray, __CFArray *a3, __CFSet *a4)
{
  CFIndex Count = CFArrayGetCount(theArray);
  if (Count >= 1)
  {
    uint64_t v8 = Count;
    do
    {
      unsigned int ValueAtIndex = (CFStringRef *)CFArrayGetValueAtIndex(theArray, v8 - 1);
      v44.length = *((unsigned __int8 *)ValueAtIndex + 38);
      v44.location = 0;
      CFStringGetCharacters(ValueAtIndex[1], v44, buffer);
      CFIndex v10 = *((unsigned __int8 *)ValueAtIndex + 38);
      if (*((unsigned char *)ValueAtIndex + 38))
      {
        unsigned __int16 v11 = buffer;
        uint64_t v12 = *((unsigned __int8 *)ValueAtIndex + 38);
        do
        {
          unint64_t v13 = *v11;
          if (v13 <= 0x7F) {
            *unsigned __int16 v11 = word_100017C58[v13];
          }
          ++v11;
          --v12;
        }
        while (v12);
      }
      CFStringRef v14 = CFStringCreateWithCharacters(0, buffer, v10);
      CFRelease(ValueAtIndex[1]);
      ValueAtIndex[1] = v14;
      if (CFSetContainsValue(a4, v14))
      {
        CFArrayAppendValue(a3, ValueAtIndex);
        CFArrayRemoveValueAtIndex(theArray, v8 - 1);
      }
      else
      {
        fsck_exfat_rename_file_set();
        CFSetAddValue(a4, ValueAtIndex[1]);
      }
    }
    while (v8-- > 1);
  }
  CFIndex v39 = CFArrayGetCount(a3);
  if (v39 >= 1)
  {
    CFIndex v16 = 0;
    long long v38 = a3;
    do
    {
      CFIndex v40 = v16;
      uint64_t v17 = (const __CFString **)CFArrayGetValueAtIndex(a3, v16);
      CFStringRef v18 = CFStringCopyFilenameExtension(v17[1]);
      int v19 = *((unsigned __int8 *)v17 + 38);
      LODWORD(v20) = v19 - CFStringGetLength(v18);
      v45.length = v20;
      v45.location = 0;
      CFStringRef v21 = CFStringCreateWithSubstring(0, v17[1], v45);
      if (*((unsigned char *)v17 + 38) % 0xFu) {
        unsigned int v22 = *((unsigned __int8 *)v17 + 38) / 0xFu + 1;
      }
      else {
        unsigned int v22 = *((unsigned __int8 *)v17 + 38) / 0xFu;
      }
      unsigned int v23 = 15 * v22;
      uint64_t v24 = 1;
      do
      {
        CFStringRef v25 = CFStringCreateWithFormat(0, 0, @"%@-%u%@", v21, v24, v18);
        unsigned int Length = CFStringGetLength(v25);
        unsigned int v27 = Length - v23;
        if (Length <= v23)
        {
          uint64_t v24 = (v24 + 1);
          CFRelease(v17[1]);
          v17[1] = v25;
        }
        else
        {
          BOOL v28 = v20 >= v27;
          CFIndex v20 = v20 - v27;
          if (!v28)
          {
            long long v30 = CFStringCopyCStringUTF8(v17[1]);
            *(_OWORD *)buffer = ctx;
            long long v42 = *(_OWORD *)&qword_100110C10;
            uint64_t v43 = qword_100110C20;
            fsck_printf((uint64_t)buffer, (uint64_t)"Cannot create a generated name for %s\n", v31, v32, v33, v34, v35, v36, (uint64_t)v30);
            free(v30);
            CFRelease(v21);
            CFRelease(v25);
            CFRelease(v18);
            return 22;
          }
          v46.location = 0;
          v46.length = v20;
          CFStringRef v29 = CFStringCreateWithSubstring(0, v21, v46);
          CFRelease(v21);
          CFRelease(v25);
          CFStringRef v25 = v17[1];
          CFStringRef v21 = v29;
        }
      }
      while (CFSetContainsValue(a4, v25));
      CFRelease(v18);
      CFRelease(v21);
      fsck_exfat_rename_file_set();
      CFSetAddValue(a4, v17[1]);
      CFIndex v16 = v40 + 1;
      a3 = v38;
    }
    while (v40 + 1 != v39);
  }
  return 0;
}

uint64_t fsck_exfat_recurse(const void *a1, _DWORD *a2)
{
  long long v232 = 0u;
  long long v231 = 0u;
  *(_OWORD *)&callBacks.version = unk_10001C590;
  *(_OWORD *)&callBacks.release = *(_OWORD *)&off_10001C5A0;
  callBacks.equal = 0;
  v229.version = 0;
  *(_OWORD *)&v229.retain = *(_OWORD *)&kCFTypeDictionaryKeyCallBacks.retain;
  v229.copyDescription = kCFTypeDictionaryKeyCallBacks.copyDescription;
  v229.equal = (CFSetEqualCallBack)sub_10000A974;
  v229.hash = (CFSetHashCallBack)CFStringGetNameHash;
  uint64_t v4 = CFArrayCreateMutable(0, 0, &callBacks);
  unsigned int v5 = CFSetCreateMutable(0, 0, &v229);
  CFIndex v6 = CFArrayCreateMutable(0, 0, &callBacks);
  uint64_t v7 = CFArrayCreateMutable(0, 0, &callBacks);
  theArray = CFArrayCreateMutable(0, 0, 0);
  value = 0;
  char v227 = 0;
  uint64_t v224 = (uint64_t)a1;
  CFArrayAppendValue(v4, a1);
  if (a2) {
    *a2 = 0;
  }
  if (CFArrayGetCount(v4))
  {
    char v221 = 0;
    int v219 = 0;
    unsigned int v225 = 0;
    v217 = v4;
    theSet = v5;
    v215 = v6;
    CFArrayRef v216 = v7;
    while (1)
    {
      unsigned int ValueAtIndex = (void *)CFArrayGetValueAtIndex(v4, 0);
      path = fsck_exfat_dir_get_path((uint64_t **)ValueAtIndex);
      CFSetRemoveAllValues(v5);
      CFArrayRemoveAllValues(v6);
      CFArrayRemoveAllValues(v7);
      CFArrayRemoveAllValues(theArray);
      unsigned int v10 = *((_DWORD *)ValueAtIndex + 6);
      HIDWORD(value) = v10;
      if (v10 >= 2 && v10 <= dword_100110B44) {
        break;
      }
LABEL_10:
      uint64_t v7 = v216;
      CFIndex Count = CFArrayGetCount(v216);
      uint64_t v4 = v217;
      unsigned int v5 = theSet;
      CFIndex v6 = v215;
      if (Count || (CFIndex Count = CFArrayGetCount(v215)) != 0)
      {
        if (debug)
        {
          long long v233 = ctx;
          long long v234 = *(_OWORD *)&qword_100110C10;
          v235 = (long long *)qword_100110C20;
          LODWORD(Count) = fsck_printf((uint64_t)&v233, (uint64_t)"Renaming items in %s\n", v13, v14, v15, v16, v17, v18, (uint64_t)path);
        }
        LODWORD(value) = fsck_exfat_rename_names(Count, v216, v215, theSet);
        if (value)
        {
          HIBYTE(word_100110BF2) = 1;
          if (debug)
          {
            long long v233 = ctx;
            long long v234 = *(_OWORD *)&qword_100110C10;
            v235 = (long long *)qword_100110C20;
            fsck_printf((uint64_t)&v233, (uint64_t)"Renaming failed in %s\n", v19, v20, v21, v22, v23, v24, (uint64_t)path);
          }
        }
        else
        {
          byte_100110BF4 = 1;
          if (debug)
          {
            long long v233 = ctx;
            long long v234 = *(_OWORD *)&qword_100110C10;
            v235 = (long long *)qword_100110C20;
            fsck_printf((uint64_t)&v233, (uint64_t)"Renaming completed in %s\n", v19, v20, v21, v22, v23, v24, (uint64_t)path);
          }
        }
      }
      LODWORD(value) = fsck_exfat_cache_evict_clusters(theArray);
      if (value)
      {
        HIBYTE(word_100110BF2) = 1;
        if (debug)
        {
          long long v233 = ctx;
          long long v234 = *(_OWORD *)&qword_100110C10;
          v235 = (long long *)qword_100110C20;
          fsck_printf((uint64_t)&v233, (uint64_t)"Could not write clusters for directory %s\n", v194, v195, v196, v197, v198, v199, (uint64_t)path);
        }
      }
      free(path);
      CFArrayRemoveValueAtIndex(v217, 0);
      if (!CFArrayGetCount(v217)) {
        goto LABEL_185;
      }
    }
    unsigned int v25 = 0;
    unsigned int v26 = 0;
    int v27 = 0;
    int v28 = 0;
    unsigned int v29 = 1;
    while (1)
    {
      if (v25 >= *((_DWORD *)ValueAtIndex + 7)) {
        goto LABEL_10;
      }
      uint64_t cluster = fsck_exfat_cache_get_cluster(v10, (int *)&value);
      if (!cluster) {
        goto LABEL_10;
      }
      uint64_t v31 = cluster;
      unsigned int v222 = v25;
      unsigned int v32 = v26 + buffer_length(cluster);
      CFArrayAppendValue(theArray, (const void *)HIDWORD(value));
      uint64_t v223 = v31;
      uint64_t v33 = buffer_data(v31);
      if (v26 < v32) {
        break;
      }
LABEL_171:
      LODWORD(value) = fsck_exfat_cache_release(v223, 0, 1);
      if (value) {
        goto LABEL_10;
      }
      if (*((unsigned char *)ValueAtIndex + 39))
      {
        unsigned int v10 = ++HIDWORD(value);
        unsigned int v193 = v222;
      }
      else
      {
        LODWORD(value) = fsck_exfat_fat_get(HIDWORD(value), (_DWORD *)&value + 1);
        unsigned int v193 = v222;
        if (value) {
          goto LABEL_10;
        }
        unsigned int v10 = HIDWORD(value);
      }
      if (v10 >= 2)
      {
        unsigned int v25 = v193 + 1;
        if (v10 <= dword_100110B44) {
          continue;
        }
      }
      goto LABEL_10;
    }
    CFIndex v40 = (unsigned __int8 *)v33;
    while (1)
    {
      if (v29 != 1)
      {
        int v41 = *v40;
        if (!*v40) {
          goto LABEL_28;
        }
        long long v233 = ctx;
        long long v234 = *(_OWORD *)&qword_100110C10;
        v235 = (long long *)qword_100110C20;
        fsckPrint((uint64_t)&v233, 425, v34, v35, v36, v37, v38, v39, (uint64_t)path);
        long long v233 = ctx;
        long long v234 = *(_OWORD *)&qword_100110C10;
        v235 = (long long *)qword_100110C20;
        if (fsckAskPrompt((uint64_t)&v233, (uint64_t)"Extend? ", v42, v43, v44, v45, v46, v47, v202) == 1)
        {
          fsck_exfat_iter_dir_entries((uint64_t)ValueAtIndex, v29, (v26 - v29) >> 5, (uint64_t)&stru_10001C530);
          LODWORD(value) = 0;
          byte_100110BF4 = 1;
        }
        else
        {
          LOBYTE(word_100110BF2) = 1;
        }
      }
      int v41 = *v40;
      if (((char)*v40 & 0x80000000) == 0)
      {
        unsigned int v29 = 1;
LABEL_28:
        if (v29 == 1 && v41 == 0) {
          unsigned int v29 = v26;
        }
        if (v28)
        {
          long long v233 = ctx;
          long long v234 = *(_OWORD *)&qword_100110C10;
          v235 = (long long *)qword_100110C20;
          fsckPrint((uint64_t)&v233, 426, v34, v35, v36, v37, v38, v39, (uint64_t)path);
          long long v233 = ctx;
          long long v234 = *(_OWORD *)&qword_100110C10;
          v235 = (long long *)qword_100110C20;
          if (fsckAskPrompt((uint64_t)&v233, (uint64_t)"Delete? ", v49, v50, v51, v52, v53, v54, v203) == 1)
          {
            fsck_exfat_iter_dir_entries((uint64_t)ValueAtIndex, v225, (v26 - v225) >> 5, (uint64_t)&stru_10001C530);
            int v28 = 0;
            int v27 = 0;
            LODWORD(value) = 0;
            byte_100110BF4 = 1;
          }
          else
          {
            int v28 = 0;
            int v27 = 0;
            LOBYTE(word_100110BF2) = 1;
          }
        }
        goto LABEL_125;
      }
      if ((v41 & 0x40) == 0 && v28)
      {
        long long v233 = ctx;
        long long v234 = *(_OWORD *)&qword_100110C10;
        v235 = (long long *)qword_100110C20;
        fsckPrint((uint64_t)&v233, 426, v34, v35, v36, v37, v38, v39, (uint64_t)path);
        long long v233 = ctx;
        long long v234 = *(_OWORD *)&qword_100110C10;
        v235 = (long long *)qword_100110C20;
        if (fsckAskPrompt((uint64_t)&v233, (uint64_t)"Delete? ", v55, v56, v57, v58, v59, v60, v204) == 1)
        {
          fsck_exfat_iter_dir_entries((uint64_t)ValueAtIndex, v225, (v26 - v225) >> 5, (uint64_t)&stru_10001C530);
          int v28 = 0;
          int v27 = 0;
          LODWORD(value) = 0;
          byte_100110BF4 = 1;
        }
        else
        {
          int v28 = 0;
          int v27 = 0;
          LOBYTE(word_100110BF2) = 1;
        }
      }
      int v61 = *v40;
      if (ValueAtIndex == (void *)v224 && (v61 - 129) <= 0x1F && ((1 << (v61 + 127)) & 0x80000007) != 0) {
        goto LABEL_54;
      }
      if (v61 == 133) {
        break;
      }
      if (v61 == 160)
      {
        long long v233 = ctx;
        long long v234 = *(_OWORD *)&qword_100110C10;
        v235 = (long long *)qword_100110C20;
        fsckPrint((uint64_t)&v233, 442, v34, v35, v36, v37, v38, v39, (uint64_t)path);
LABEL_58:
        long long v233 = ctx;
        long long v234 = *(_OWORD *)&qword_100110C10;
        v235 = (long long *)qword_100110C20;
        if (fsckAskPrompt((uint64_t)&v233, (uint64_t)"Delete? ", v62, v63, v64, v65, v66, v67, v205) != 1) {
          goto LABEL_124;
        }
        *v40 &= ~0x80u;
        fsck_exfat_cache_mark_dirty(v223);
        goto LABEL_60;
      }
      if ((v61 & 0x60) == 0x20)
      {
        long long v70 = *((_OWORD *)v40 + 1);
        xmmword_10010EAC8[0] = *(_OWORD *)v40;
        unk_10010EAD8 = v70;
        int v27 = v40[1];
        *(void *)&long long v231 = *((void *)v40 + 3);
        *((void *)&v231 + 1) = v231;
        LODWORD(v232) = *((_DWORD *)v40 + 5);
        __int16 v71 = *((_WORD *)v40 + 2);
        BYTE8(v232) = v71;
        if ((v71 & 1) != 0
          && (LODWORD(value) = fsck_exfat_check_allocation((uint64_t)&v231, (uint64_t)path, v34, v35, v36, v37, v38, v39),
              value == 1))
        {
          *((void *)v40 + 3) = v231;
          *((_DWORD *)v40 + 5) = v232;
          *((_WORD *)v40 + 2) = BYTE8(v232);
          char v221 = 1;
        }
        else
        {
          char v221 = 0;
        }
        int v219 = v27 + 1;
        if (!v27)
        {
          unsigned int v225 = v26;
LABEL_74:
          unsigned __int16 v80 = 0;
          uint64_t v81 = 0;
          do
          {
            if ((v81 & 0x7FFFFFFFFFFFFFFELL) != 2) {
              unsigned __int16 v80 = ((v80 >> 1) | (v80 << 15)) + *((unsigned __int8 *)xmmword_10010EAC8 + v81);
            }
            ++v81;
          }
          while (32 * BYTE1(xmmword_10010EAC8[0]) + 32 != v81);
          if (WORD1(xmmword_10010EAC8[0]) != v80)
          {
            long long v233 = ctx;
            long long v234 = *(_OWORD *)&qword_100110C10;
            v235 = (long long *)qword_100110C20;
            uint64_t v88 = 429;
LABEL_119:
            fsckPrint((uint64_t)&v233, v88, v34, v35, v36, v37, v38, v39, v201);
            goto LABEL_120;
          }
          if (LOBYTE(xmmword_10010EAC8[0]) != 133)
          {
            if (BYTE1(xmmword_10010EAC8[0]))
            {
              unint64_t v89 = 0;
              uint64_t v90 = &qword_10010EB00;
              do
              {
                char v91 = *((unsigned char *)v90 - 23);
                if (v91)
                {
                  *(void *)&long long v231 = *v90;
                  *((void *)&v231 + 1) = v231;
                  LODWORD(v232) = *((_DWORD *)v90 - 1);
                  BYTE8(v232) = v91;
                  LODWORD(value) = fsck_exfat_check_allocation((uint64_t)&v231, (uint64_t)path, v34, v35, v36, v37, v38, v39);
                  if (value == 1)
                  {
                    *uint64_t v90 = v231;
                    *((_DWORD *)v90 - 1) = v232;
                    *((unsigned char *)v90 - 23) = BYTE8(v232);
                    char v221 = 1;
                  }
                }
                ++v89;
                v90 += 4;
              }
              while (v89 < BYTE1(xmmword_10010EAC8[0]));
            }
            unsigned int v29 = 1;
            if ((v221 & 1) == 0) {
              goto LABEL_160;
            }
            *(void *)&long long v233 = _NSConcreteStackBlock;
            *((void *)&v233 + 1) = 0x40000000;
            *(void *)&long long v234 = sub_100007AF8;
            *((void *)&v234 + 1) = &unk_10001C550;
            v235 = xmmword_10010EAC8;
            fsck_exfat_iter_dir_entries(v224, v225, v219, (uint64_t)&v233);
            int v28 = 0;
            int v27 = 0;
            char v221 = 0;
            goto LABEL_93;
          }
          if (byte_10010EAE8 != 192)
          {
            long long v233 = ctx;
            long long v234 = *(_OWORD *)&qword_100110C10;
            v235 = (long long *)qword_100110C20;
            fsckPrint((uint64_t)&v233, 439, v34, v35, v36, v37, v38, v39, (uint64_t)path);
LABEL_120:
            long long v233 = ctx;
            long long v234 = *(_OWORD *)&qword_100110C10;
            v235 = (long long *)qword_100110C20;
            if (fsckAskPrompt((uint64_t)&v233, (uint64_t)"Delete? ", v92, v93, v94, v95, v96, v97, v208) != 1)
            {
              int v28 = 0;
LABEL_123:
              int v27 = 0;
LABEL_124:
              unsigned int v29 = 1;
              LOBYTE(word_100110BF2) = 1;
              goto LABEL_125;
            }
LABEL_121:
            fsck_exfat_iter_dir_entries((uint64_t)ValueAtIndex, v225, (v26 - v225 + 32) >> 5, (uint64_t)&stru_10001C530);
            int v28 = 0;
            int v27 = 0;
            LODWORD(value) = 0;
LABEL_60:
            unsigned int v29 = 1;
LABEL_61:
            byte_100110BF4 = 1;
            goto LABEL_125;
          }
          if ((byte_10010EAE9 & 1) == 0)
          {
            long long v233 = ctx;
            long long v234 = *(_OWORD *)&qword_100110C10;
            v235 = (long long *)qword_100110C20;
            fsckPrint((uint64_t)&v233, 440, v34, v35, v36, v37, v38, v39, (uint64_t)path);
            long long v233 = ctx;
            long long v234 = *(_OWORD *)&qword_100110C10;
            v235 = (long long *)qword_100110C20;
            if (fsckAskPrompt((uint64_t)&v233, (uint64_t)"Fix? ", v82, v83, v84, v85, v86, v87, v207) == 1)
            {
              byte_10010EAE9 |= 1u;
              char v221 = 1;
            }
            else
            {
              LOBYTE(word_100110BF2) = 1;
            }
          }
          if (!byte_10010EAEB
            || ((unsigned int v98 = byte_10010EAEB / 0xFu, !(byte_10010EAEB % 0xFu))
              ? (uint64_t v99 = v98)
              : (uint64_t v99 = v98 + 1),
                v99 >= BYTE1(xmmword_10010EAC8[0])))
          {
            long long v233 = ctx;
            long long v234 = *(_OWORD *)&qword_100110C10;
            v235 = (long long *)qword_100110C20;
            fsckPrint((uint64_t)&v233, 437, v34, v35, v36, v37, v38, v39, (uint64_t)path);
            goto LABEL_120;
          }
          if (v99)
          {
            uint64_t v100 = v99;
            uint64_t v101 = &byte_10010EB08;
            while (1)
            {
              int v102 = *v101;
              v101 += 32;
              if (v102 != 193) {
                break;
              }
              if (!--v100) {
                goto LABEL_105;
              }
            }
LABEL_118:
            long long v233 = ctx;
            long long v234 = *(_OWORD *)&qword_100110C10;
            v235 = (long long *)qword_100110C20;
            uint64_t v201 = (uint64_t)path;
            uint64_t v88 = 438;
            goto LABEL_119;
          }
LABEL_105:
          if (fsck_exfat_name_hash((uint64_t)xmmword_10010EAC8, &v227) != (unsigned __int16)word_10010EAEC) {
            goto LABEL_118;
          }
          if (dword_100110BF8 != 1 && byte_100110BF7 == 0)
          {
            CFMutableStringRef Mutable = CFStringCreateMutable(0, 0);
            CFMutableStringRef v226 = Mutable;
            sub_100008FEC((uint64_t)xmmword_10010EAC8, &v226, byte_10010EAEB);
            v105 = CFStringCopyCStringUTF8(Mutable);
            CFMutableStringRef v106 = Mutable;
            v107 = v105;
            CFRelease(v106);
            if (!strncmp((const char *)v107, ".nfs.20051", 0xAuLL))
            {
              long long v233 = ctx;
              long long v234 = *(_OWORD *)&qword_100110C10;
              v235 = (long long *)qword_100110C20;
              fsckPrint((uint64_t)&v233, 446, v108, v109, v110, v111, v112, v113, v201);
              free(v107);
              goto LABEL_121;
            }
            free(v107);
          }
          v114 = fsck_exfat_dir_from_file_set((uint64_t)xmmword_10010EAC8);
          int v115 = *((_DWORD *)ValueAtIndex + 8);
          *((_DWORD *)ValueAtIndex + 8) = v115 + 1;
          if (v115 == -1) {
            sub_100011184();
          }
          *(void *)v114 = ValueAtIndex;
          *((_DWORD *)v114 + 4) = v225;
          *((_DWORD *)v114 + 5) = v219;
          v213 = (const __CFString **)v114;
          v214 = fsck_exfat_dir_get_path((uint64_t **)v114);
          *(void *)&long long v231 = qword_10010EB00;
          *((void *)&v231 + 1) = *(void *)&algn_10010EAEE[2];
          LODWORD(v232) = *(_DWORD *)&algn_10010EAEE[14];
          BYTE8(v232) = byte_10010EAE9;
          if (debug)
          {
            long long v233 = ctx;
            long long v234 = *(_OWORD *)&qword_100110C10;
            v235 = (long long *)qword_100110C20;
            if ((BYTE4(xmmword_10010EAC8[0]) & 0x10) != 0) {
              fsck_printf((uint64_t)&v233, (uint64_t)"Directory %s\n", v116, v117, v118, v119, v120, v121, (uint64_t)v214);
            }
            else {
              fsck_printf((uint64_t)&v233, (uint64_t)"File      %s\n", v116, v117, v118, v119, v120, v121, (uint64_t)v214);
            }
          }
          if (v227)
          {
            v122 = CFStringCopyCStringUTF8(v213[1]);
            long long v233 = ctx;
            long long v234 = *(_OWORD *)&qword_100110C10;
            v235 = (long long *)qword_100110C20;
            fsckPrint((uint64_t)&v233, 445, v123, v124, v125, v126, v127, v128, (uint64_t)path);
            free(v122);
            long long v233 = ctx;
            long long v234 = *(_OWORD *)&qword_100110C10;
            v235 = (long long *)qword_100110C20;
            if (fsckAskPrompt((uint64_t)&v233, (uint64_t)"Rename? ", v129, v130, v131, v132, v133, v134, v209) == 1)
            {
              v141 = v216;
              goto LABEL_134;
            }
LABEL_135:
            long long v233 = ctx;
            long long v234 = *(_OWORD *)&qword_100110C10;
            v235 = (long long *)qword_100110C20;
            if (fsckAskPrompt((uint64_t)&v233, (uint64_t)"Delete? ", v135, v136, v137, v138, v139, v140, v201) == 1)goto LABEL_159; {
            LOBYTE(word_100110BF2) = 1;
            }
          }
          else if (CFSetContainsValue(theSet, v213[1]))
          {
            v142 = CFStringCopyCStringUTF8(v213[1]);
            long long v233 = ctx;
            long long v234 = *(_OWORD *)&qword_100110C10;
            v235 = (long long *)qword_100110C20;
            fsckPrint((uint64_t)&v233, 444, v143, v144, v145, v146, v147, v148, (uint64_t)path);
            free(v142);
            long long v233 = ctx;
            long long v234 = *(_OWORD *)&qword_100110C10;
            v235 = (long long *)qword_100110C20;
            if (fsckAskPrompt((uint64_t)&v233, (uint64_t)"Rename? ", v149, v150, v151, v152, v153, v154, v210) != 1)goto LABEL_135; {
            v141 = v215;
            }
LABEL_134:
            CFArrayAppendValue(v141, v213);
          }
          else
          {
            CFSetAddValue(theSet, v213[1]);
          }
          int v161 = fsck_exfat_check_allocation((uint64_t)&v231, (uint64_t)v214, v155, v156, v157, v158, v159, v160);
          LODWORD(value) = v161;
          if (v161 == -1 || (void)v231 || (BYTE4(xmmword_10010EAC8[0]) & 0x10) == 0)
          {
            if (v161 == 1)
            {
              *(void *)&algn_10010EAEE[2] = *((void *)&v231 + 1);
              qword_10010EB00 = v231;
              *(_DWORD *)&algn_10010EAEE[14] = v232;
              byte_10010EAE9 = BYTE8(v232);
              char v221 = 1;
            }
            *((_DWORD *)v213 + 7) = DWORD1(v232);
            while (2)
            {
              if ((int)v99 >= BYTE1(xmmword_10010EAC8[0]) - 1) {
                goto LABEL_162;
              }
              v168 = &xmmword_10010EAC8[2 * (int)v99];
              char v170 = *((unsigned char *)v168 + 64);
              v169 = v168 + 4;
              if ((v170 & 0x20) == 0)
              {
                long long v233 = ctx;
                long long v234 = *(_OWORD *)&qword_100110C10;
                v235 = (long long *)qword_100110C20;
                fsckPrint((uint64_t)&v233, 441, v162, v163, v164, v165, v166, v167, (uint64_t)v214);
                long long v233 = ctx;
                long long v234 = *(_OWORD *)&qword_100110C10;
                v235 = (long long *)qword_100110C20;
                if (fsckAskPrompt((uint64_t)&v233, (uint64_t)"Remove? ", v171, v172, v173, v174, v175, v176, v211) == 1)
                {
                  LODWORD(v177) = v99 + 1;
                  char v178 = BYTE1(xmmword_10010EAC8[0]);
                  if ((int)v99 + 1 < BYTE1(xmmword_10010EAC8[0]) - 1)
                  {
                    uint64_t v177 = (int)v177;
                    v179 = &xmmword_10010EAC8[2 * (int)v177 + 4];
                    int v180 = v99;
                    do
                    {
                      v181 = &xmmword_10010EAC8[2 * v180];
                      long long v182 = *v179;
                      long long v183 = v179[1];
                      v179 += 2;
                      v181[4] = v182;
                      v181[5] = v183;
                      ++v177;
                      char v178 = BYTE1(xmmword_10010EAC8[0]);
                      ++v180;
                    }
                    while (v177 < BYTE1(xmmword_10010EAC8[0]) - 1);
                  }
                  LODWORD(v99) = v99 - 1;
                  BYTE1(xmmword_10010EAC8[0]) = v178 - 1;
                  LOBYTE(xmmword_10010EAC8[2 * (v178 - 1) + 2]) &= ~0x80u;
LABEL_156:
                  char v221 = 1;
                  goto LABEL_157;
                }
                LOBYTE(word_100110BF2) = 1;
              }
              char v184 = *((unsigned char *)v169 + 1);
              if (v184)
              {
                *(void *)&long long v231 = *((void *)v169 + 3);
                *((void *)&v231 + 1) = v231;
                LODWORD(v232) = *((_DWORD *)v169 + 5);
                BYTE8(v232) = v184;
                LODWORD(value) = fsck_exfat_check_allocation((uint64_t)&v231, (uint64_t)v214, v162, v163, v164, v165, v166, v167);
                if (value == 1)
                {
                  *((void *)v169 + 3) = v231;
                  *((_DWORD *)v169 + 5) = v232;
                  *((unsigned char *)v169 + 1) = BYTE8(v232);
                  goto LABEL_156;
                }
              }
LABEL_157:
              LODWORD(v99) = v99 + 1;
              continue;
            }
          }
          long long v233 = ctx;
          long long v234 = *(_OWORD *)&qword_100110C10;
          v235 = (long long *)qword_100110C20;
          fsckPrint((uint64_t)&v233, 443, v162, v163, v164, v165, v166, v167, (uint64_t)v214);
          long long v233 = ctx;
          long long v234 = *(_OWORD *)&qword_100110C10;
          v235 = (long long *)qword_100110C20;
          if (fsckAskPrompt((uint64_t)&v233, (uint64_t)"Delete? ", v185, v186, v187, v188, v189, v190, v212) == 1)
          {
LABEL_159:
            fsck_exfat_iter_dir_entries((uint64_t)ValueAtIndex, v225, v219 & 0x7FFFFFF, (uint64_t)&stru_10001C530);
            LODWORD(value) = 0;
            unsigned int v29 = 1;
            byte_100110BF4 = 1;
            fsck_exfat_dir_rele((int *)v213);
            free(v214);
LABEL_160:
            int v28 = 0;
            int v27 = 0;
            char v221 = 0;
            goto LABEL_125;
          }
          LOBYTE(word_100110BF2) = 1;
LABEL_162:
          if (v221)
          {
            unsigned __int16 v191 = 0;
            uint64_t v192 = 0;
            do
            {
              if ((v192 & 0x7FFFFFFFFFFFFFFELL) != 2) {
                unsigned __int16 v191 = ((v191 >> 1) | (v191 << 15)) + *((unsigned __int8 *)xmmword_10010EAC8 + v192);
              }
              ++v192;
            }
            while (32 * BYTE1(xmmword_10010EAC8[0]) + 32 != v192);
            WORD1(xmmword_10010EAC8[0]) = v191;
            *(void *)&long long v233 = _NSConcreteStackBlock;
            *((void *)&v233 + 1) = 0x40000000;
            *(void *)&long long v234 = sub_100007AF8;
            *((void *)&v234 + 1) = &unk_10001C550;
            v235 = xmmword_10010EAC8;
            fsck_exfat_iter_dir_entries((uint64_t)ValueAtIndex, v225, v219, (uint64_t)&v233);
            LODWORD(value) = 0;
            byte_100110BF4 = 1;
          }
          if ((BYTE4(xmmword_10010EAC8[0]) & 0x10) != 0) {
            CFArrayAppendValue(v217, v213);
          }
          fsck_exfat_dir_rele((int *)v213);
          free(v214);
          int v28 = 0;
          int v27 = 0;
          char v221 = 0;
          goto LABEL_54;
        }
        goto LABEL_53;
      }
      if ((v61 & 0x60) == 0)
      {
        long long v233 = ctx;
        long long v234 = *(_OWORD *)&qword_100110C10;
        v235 = (long long *)qword_100110C20;
        fsckPrint((uint64_t)&v233, 427, v34, v35, v36, v37, v38, v39, (uint64_t)path);
        goto LABEL_58;
      }
      if ((v61 & 0x40) == 0) {
        sub_100011208();
      }
      if (!v27)
      {
        long long v233 = ctx;
        long long v234 = *(_OWORD *)&qword_100110C10;
        v235 = (long long *)qword_100110C20;
        fsckPrint((uint64_t)&v233, 428, v34, v35, v36, v37, v38, v39, (uint64_t)path);
        long long v233 = ctx;
        long long v234 = *(_OWORD *)&qword_100110C10;
        v235 = (long long *)qword_100110C20;
        if (fsckAskPrompt((uint64_t)&v233, (uint64_t)"Delete? ", v74, v75, v76, v77, v78, v79, v206) != 1) {
          goto LABEL_123;
        }
        unsigned int v29 = 1;
        fsck_exfat_iter_dir_entries((uint64_t)ValueAtIndex, v26, 1, (uint64_t)&stru_10001C530);
        int v27 = 0;
LABEL_93:
        LODWORD(value) = 0;
        goto LABEL_61;
      }
      long long v72 = *((_OWORD *)v40 + 1);
      uint64_t v73 = &xmmword_10010EAC8[2 * v28];
      *uint64_t v73 = *(_OWORD *)v40;
      v73[1] = v72;
      if (!--v27) {
        goto LABEL_74;
      }
      ++v28;
LABEL_54:
      unsigned int v29 = 1;
LABEL_125:
      v40 += 32;
      v26 += 32;
      if (v26 >= v32) {
        goto LABEL_171;
      }
    }
    char v221 = 0;
    long long v69 = *((_OWORD *)v40 + 1);
    xmmword_10010EAC8[0] = *(_OWORD *)v40;
    unk_10010EAD8 = v69;
    int v27 = v40[1];
    int v219 = v27 + 1;
LABEL_53:
    int v28 = 1;
    unsigned int v225 = v26;
    goto LABEL_54;
  }
LABEL_185:
  CFRelease(v4);
  CFRelease(v5);
  CFRelease(v6);
  CFRelease(v7);
  CFRelease(theArray);
  return 0;
}

uint64_t sub_10000A940(uint64_t a1, uint64_t a2)
{
  int v2 = *(_DWORD *)(a2 + 32);
  *(_DWORD *)(a2 + 32) = v2 + 1;
  if (v2 == -1) {
    sub_100011184();
  }
  return a2;
}

void sub_10000A96C(int a1, int *a2)
{
}

BOOL sub_10000A974(const __CFString *a1, const __CFString *a2)
{
  CFIndex Length = CFStringGetLength(a1);
  if (Length != CFStringGetLength(a2)) {
    return 0;
  }
  if (Length < 1) {
    return 1;
  }
  uint64_t v5 = qword_100110BD0;
  LODWORD(v5) = *(unsigned __int16 *)(v5 + 2 * CFStringGetCharacterAtIndex(a1, 0));
  uint64_t v6 = qword_100110BD0;
  if (v5 != *(unsigned __int16 *)(v6 + 2 * CFStringGetCharacterAtIndex(a2, 0))) {
    return 0;
  }
  CFIndex v7 = 1;
  do
  {
    CFIndex v8 = v7;
    if (Length == v7) {
      break;
    }
    uint64_t v9 = qword_100110BD0;
    LODWORD(v9) = *(unsigned __int16 *)(v9 + 2 * CFStringGetCharacterAtIndex(a1, v7));
    uint64_t v10 = qword_100110BD0;
    unsigned int CharacterAtIndex = CFStringGetCharacterAtIndex(a2, v8);
    CFIndex v7 = v8 + 1;
  }
  while (v9 == *(unsigned __int16 *)(v10 + 2 * CharacterAtIndex));
  return v8 >= Length;
}

uint64_t fsck_exfat_check_fs(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  qword_100110B10 = 0;
  qword_100110BD0 = 0;
  qword_100110BB8 = 0;
  qword_100110BC0 = 0;
  BOOL v9 = a1 && a1[2] && a1[1] && *a1 != 0;
  byte_100110BF4 = 0;
  word_100110BF2 = 0;
  long long v147 = ctx;
  long long v148 = *(_OWORD *)&qword_100110C10;
  uint64_t v149 = qword_100110C20;
  uint64_t v150 = 0;
  fsckPrint((uint64_t)&v147, 101, a3, a4, a5, a6, a7, a8, v138);
  if (dword_100110B30)
  {
    if (dword_100110B30 > 0x1000)
    {
      long long v147 = ctx;
      long long v148 = *(_OWORD *)&qword_100110C10;
      uint64_t v149 = qword_100110C20;
      fsckPrint((uint64_t)&v147, 301, v10, v11, v12, v13, v14, v15, dword_100110B30);
      uint64_t v16 = 1;
      goto LABEL_17;
    }
  }
  else
  {
    dword_100110B30 = 512;
  }
  long long v147 = ctx;
  long long v148 = *(_OWORD *)&qword_100110C10;
  uint64_t v149 = qword_100110C20;
  fsckPrint((uint64_t)&v147, 201, v10, v11, v12, v13, v14, v15, v139);
  if (v9) {
    ((void (*)(const char *, uint64_t, uint64_t, char *, void))a1[1])("Check FS: Read boot sector", 2, 2, (char *)&v150 + 4, *a1);
  }
  uint64_t boot_region = read_boot_region(0);
  uint64_t v16 = boot_region;
  ++HIDWORD(v150);
  if ((int)boot_region > 0) {
    goto LABEL_13;
  }
  if ((boot_region & 0x80000000) != 0)
  {
    byte_100110BF0 = 1;
    long long v147 = ctx;
    long long v148 = *(_OWORD *)&qword_100110C10;
    uint64_t v149 = qword_100110C20;
    fsckPrint((uint64_t)&v147, 302, v19, v20, v21, v22, v23, v24, v140);
    long long v147 = ctx;
    long long v148 = *(_OWORD *)&qword_100110C10;
    uint64_t v149 = qword_100110C20;
    fsckPrint((uint64_t)&v147, 202, v34, v35, v36, v37, v38, v39, v141);
    uint64_t v40 = read_boot_region(1);
    if (v40)
    {
      uint64_t v16 = v40;
      long long v147 = ctx;
      long long v148 = *(_OWORD *)&qword_100110C10;
      uint64_t v149 = qword_100110C20;
      uint64_t boot_region = fsckPrint((uint64_t)&v147, 303, v19, v20, v21, v22, v23, v24, v140);
LABEL_13:
      unsigned int v25 = "Check FS: Read boot sector: Failed";
      goto LABEL_14;
    }
  }
  if (v9)
  {
    ++HIDWORD(v150);
    ((void (*)(const char *, void))a1[2])("Check FS: Read boot sector", *a1);
    HIDWORD(v150) = 0;
  }
  if (*(_WORD *)(qword_100110B08 + 104) == 256)
  {
    uint64_t v33 = 11;
    while (!*(unsigned char *)(qword_100110B08 + v33))
    {
      if (++v33 == 64) {
        goto LABEL_39;
      }
    }
    long long v147 = ctx;
    long long v148 = *(_OWORD *)&qword_100110C10;
    uint64_t v149 = qword_100110C20;
    fsckPrint((uint64_t)&v147, 306, v19, v20, v21, v22, v23, v24, v140);
    long long v147 = ctx;
    long long v148 = *(_OWORD *)&qword_100110C10;
    uint64_t v149 = qword_100110C20;
    if (fsckAskPrompt((uint64_t)&v147, (uint64_t)"Fix? ", v41, v42, v43, v44, v45, v46, v142) == 1)
    {
      uint64_t v47 = qword_100110B08;
      *(void *)(qword_100110B08 + 56) = 0;
      *(_OWORD *)(v47 + 43) = 0u;
      *(_OWORD *)(v47 + 27) = 0u;
      *(_OWORD *)(v47 + 11) = 0u;
      exfat_update_boot_checksum(qword_100110B10, dword_100110B30);
      byte_100110BF4 = 1;
    }
    else
    {
      LOBYTE(word_100110BF2) = 1;
    }
  }
LABEL_39:
  if ((dword_100110B04 & 0x80000000) == 0
    && ftruncate(dword_100110B04, qword_100110B20 * dword_100110B30))
  {
    sub_100011234();
  }
  if (debug)
  {
    long long v147 = ctx;
    long long v148 = *(_OWORD *)&qword_100110C10;
    uint64_t v149 = qword_100110C20;
    fsck_printf((uint64_t)&v147, (uint64_t)"%llu total sectors; %u bytes per sector\n",
      v19,
      v20,
      v21,
      v22,
      v23,
      v24,
      qword_100110B20);
    uint64_t v54 = *(unsigned __int8 *)(qword_100110B08 + 110);
    if (v54 != 1)
    {
      long long v147 = ctx;
      long long v148 = *(_OWORD *)&qword_100110C10;
      uint64_t v149 = qword_100110C20;
      fsck_printf((uint64_t)&v147, (uint64_t)"%d FATs; active FAT #%d; ", v48, v49, v50, v51, v52, v53, v54);
    }
    long long v147 = ctx;
    long long v148 = *(_OWORD *)&qword_100110C10;
    uint64_t v149 = qword_100110C20;
    fsck_printf((uint64_t)&v147, (uint64_t)"FAT starts at sector %u; size %u sectors\n",
      v48,
      v49,
      v50,
      v51,
      v52,
      v53,
      dword_100110B28);
    long long v147 = ctx;
    long long v148 = *(_OWORD *)&qword_100110C10;
    uint64_t v149 = qword_100110C20;
    fsck_printf((uint64_t)&v147, (uint64_t)"%u clusters starting at sector %u; %u bytes per cluster\n",
      v55,
      v56,
      v57,
      v58,
      v59,
      v60,
      dword_100110B40);
    long long v147 = ctx;
    long long v148 = *(_OWORD *)&qword_100110C10;
    uint64_t v149 = qword_100110C20;
    fsck_printf((uint64_t)&v147, (uint64_t)"Root directory starts at cluster %u\n", v61, v62, v63, v64, v65, v66, dword_100110B48);
  }
  __int16 v67 = *(_WORD *)(qword_100110B08 + 106);
  if (byte_100110BF7)
  {
    if ((_BYTE)word_100110BF2 || byte_100110BF0 || byte_100110BF1)
    {
      unsigned int v68 = __stderrp;
      long long v69 = "QUICKCHECK ONLY; CORRUPTION FOUND\n";
    }
    else
    {
      if ((v67 & 4) != 0)
      {
        unsigned int v68 = __stderrp;
        long long v69 = "QUICKCHECK ONLY; FILESYSTEM MARKED CORRUPT\n";
        size_t v70 = 43;
        goto LABEL_83;
      }
      unsigned int v68 = __stderrp;
      if ((v67 & 2) == 0)
      {
        fwrite("QUICKCHECK ONLY; FILESYSTEM CLEAN\n", 0x22uLL, 1uLL, __stderrp);
        uint64_t v16 = 0;
        goto LABEL_17;
      }
      long long v69 = "QUICKCHECK ONLY; FILESYSTEM DIRTY\n";
    }
    size_t v70 = 34;
LABEL_83:
    fwrite(v69, v70, 1uLL, v68);
    uint64_t v16 = 3;
    goto LABEL_17;
  }
  if (v9)
  {
    ((void (*)(const char *, uint64_t, uint64_t, char *, void))a1[1])("Check FS: Init metadata", 3, 3, (char *)&v150 + 4, *a1);
    unsigned int v25 = 0;
  }
  else
  {
    unsigned int v25 = "Check FS: Read boot sector: Failed";
  }
  fsck_exfat_cache_init();
  ++HIDWORD(v150);
  fsck_exfat_bitmap_init();
  ++HIDWORD(v150);
  fsck_exfat_fat_init();
  if (v9)
  {
    ++HIDWORD(v150);
    ((void (*)(const char *, void))a1[2])("Check FS: Init metadata", *a1);
    HIDWORD(v150) = 0;
  }
  qword_100110BD0 = (uint64_t)malloc_type_malloc(0x20000uLL, 0x1000040BDFB0063uLL);
  if (!qword_100110BD0)
  {
    long long v147 = ctx;
    long long v148 = *(_OWORD *)&qword_100110C10;
    uint64_t v149 = qword_100110C20;
    fsck_err((uint64_t)&v147, 1, (uint64_t)"Cannot allocate upper case translation table", v72, v73, v74, v75, v76, v140);
  }
  if (dword_100110B48 < 2 || dword_100110B48 > dword_100110B44)
  {
    long long v147 = ctx;
    long long v148 = *(_OWORD *)&qword_100110C10;
    uint64_t v149 = qword_100110C20;
    uint64_t boot_region = fsckPrint((uint64_t)&v147, 401, v71, v72, v73, v74, v75, v76, (uint64_t)"/");
    HIBYTE(word_100110BF2) = 1;
    if (!v9) {
      goto LABEL_74;
    }
    goto LABEL_73;
  }
  if (fsck_exfat_fat_alloc_chain(dword_100110B48, &v150, (uint64_t)"/", v72, v73, v74, v75, v76))
  {
    long long v147 = ctx;
    long long v148 = *(_OWORD *)&qword_100110C10;
    uint64_t v149 = qword_100110C20;
    if (fsckAskPrompt((uint64_t)&v147, (uint64_t)"Truncate? ", v77, v78, v79, v80, v81, v82, v140) == 1
      && !fsck_exfat_truncate_chain(dword_100110B48, v150, v150))
    {
      byte_100110BF4 = 1;
    }
    else
    {
      LOBYTE(word_100110BF2) = 1;
    }
  }
  qword_100110BB8 = (uint64_t)malloc_type_calloc(1uLL, 0x28uLL, 0x1060040E3ABEE6CuLL);
  CFTypeRef v83 = CFRetain(&stru_10001C6B0);
  uint64_t v90 = qword_100110BB8;
  *(void *)(qword_100110BB8 + 8) = v83;
  int v91 = v150;
  *(_DWORD *)(v90 + 24) = dword_100110B48;
  *(_DWORD *)(v90 + 28) = v91;
  *(unsigned char *)(v90 + 39) = 0;
  int v92 = *(_DWORD *)(v90 + 32);
  *(_DWORD *)(v90 + 32) = v92 + 1;
  if (v92 == -1) {
    sub_100011184();
  }
  long long v147 = ctx;
  long long v148 = *(_OWORD *)&qword_100110C10;
  uint64_t v149 = qword_100110C20;
  fsckPrint((uint64_t)&v147, 203, v84, v85, v86, v87, v88, v89, v140);
  if (v9)
  {
    ((void (*)(const char *, uint64_t, void, char *, void))a1[1])("Check FS: Scan root directory", 5, (qword_100110B34 * *(_DWORD *)(qword_100110BB8 + 28)) >> 5, (char *)&v150 + 4, *a1);
    uint64_t v105 = fsck_exfat_scan_root(qword_100110BB8, (_DWORD *)&v150 + 1, v99, v100, v101, v102, v103, v104);
    if (v105)
    {
      uint64_t v16 = v105;
      unsigned int v25 = "Check FS: Scan root directory: Failed";
      goto LABEL_15;
    }
    unsigned int v115 = qword_100110B34 * *(_DWORD *)(qword_100110BB8 + 28);
    if (HIDWORD(v150) < v115 >> 5) {
      HIDWORD(v150) = v115 >> 5;
    }
    ((void (*)(const char *, void))a1[2])("Check FS: Scan root directory", *a1);
    HIDWORD(v150) = 0;
    unsigned int v25 = "Check FS: Scan root directory: Failed";
  }
  else
  {
    uint64_t boot_region = fsck_exfat_scan_root(qword_100110BB8, (_DWORD *)&v150 + 1, v93, v94, v95, v96, v97, v98);
    uint64_t v16 = boot_region;
    if (boot_region) {
      goto LABEL_16;
    }
  }
  long long v147 = ctx;
  long long v148 = *(_OWORD *)&qword_100110C10;
  uint64_t v149 = qword_100110C20;
  fsckPrint((uint64_t)&v147, 205, v19, v20, v21, v22, v23, v24, v143);
  if (debug)
  {
    long long v147 = ctx;
    long long v148 = *(_OWORD *)&qword_100110C10;
    uint64_t v149 = qword_100110C20;
    fsck_printf((uint64_t)&v147, (uint64_t)"Directory /\n", v116, v117, v118, v119, v120, v121, v145);
  }
  if (v9)
  {
    ((void (*)(const char *, uint64_t, void, char *, void))a1[1])("Check FS: Iterate directories", 85, (dword_100110B44 - 2), (char *)&v150 + 4, *a1);
    fsck_exfat_recurse((const void *)qword_100110BB8, (_DWORD *)&v150 + 1);
    if (HIDWORD(v150) < dword_100110B44 - 2) {
      HIDWORD(v150) = dword_100110B44 - 2;
    }
    ((void (*)(const char *, void))a1[2])("Check FS: Iterate directories", *a1);
    HIDWORD(v150) = 0;
    unsigned int v25 = "Check FS: Iterate directories: Failed";
  }
  else
  {
    fsck_exfat_recurse((const void *)qword_100110BB8, (_DWORD *)&v150 + 1);
  }
  if (byte_100110BF6 || dword_100110BE0 == -1)
  {
    long long v147 = ctx;
    long long v148 = *(_OWORD *)&qword_100110C10;
    uint64_t v149 = qword_100110C20;
    fsckPrint((uint64_t)&v147, 424, v19, v20, v21, v22, v23, v24, v145);
    long long v147 = ctx;
    long long v148 = *(_OWORD *)&qword_100110C10;
    uint64_t v149 = qword_100110C20;
    if (fsckAskPrompt((uint64_t)&v147, (uint64_t)"Replace? ", v122, v123, v124, v125, v126, v127, v146) == 1)
    {
      uint64_t boot_region = fsck_exfat_upcase_replace();
      if (boot_region)
      {
LABEL_114:
        uint64_t v16 = boot_region;
        goto LABEL_14;
      }
    }
    else
    {
      LOBYTE(word_100110BF2) = 1;
    }
  }
  if (v9)
  {
    ((void (*)(const char *, uint64_t, uint64_t, char *, void))a1[1])("Check FS: Perform check", 3, 3, (char *)&v150 + 4, *a1);
    unsigned int v25 = "Check FS: Perform check: Failed";
  }
  long long v147 = ctx;
  long long v148 = *(_OWORD *)&qword_100110C10;
  uint64_t v149 = qword_100110C20;
  uint64_t v130 = fsckPrint((uint64_t)&v147, 206, v19, v20, v21, v22, v23, v24, v145);
  uint64_t boot_region = fsck_exfat_bitmap_verify(v130, v131, v132, v133, v134, v135, v136, v137);
  if (boot_region) {
    goto LABEL_114;
  }
  ++HIDWORD(v150);
  uint64_t boot_region = compare_boot_region(0, v18, v19, v20, v21, v22, v23, v24);
  if (boot_region)
  {
    uint64_t v16 = 1;
    goto LABEL_14;
  }
  ++HIDWORD(v150);
  uint64_t v16 = 1;
  uint64_t boot_region = compare_boot_region(1, v18, v19, v20, v21, v22, v23, v24);
  if (boot_region)
  {
LABEL_14:
    if (!v9)
    {
LABEL_16:
      fsck_exfat_cache_flush(boot_region, v18, v19, v20, v21, v22, v23, v24);
      long long v147 = ctx;
      long long v148 = *(_OWORD *)&qword_100110C10;
      uint64_t v149 = qword_100110C20;
      fsckPrint((uint64_t)&v147, 106, v26, v27, v28, v29, v30, v31, (uint64_t)byte_100110B74);
      goto LABEL_17;
    }
LABEL_15:
    uint64_t boot_region = ((uint64_t (*)(const char *, void))a1[2])(v25, *a1);
    goto LABEL_16;
  }
  if (v9)
  {
    ++HIDWORD(v150);
    ((void (*)(const char *, void))a1[2])("Check FS: Perform check", *a1);
    HIDWORD(v150) = 0;
LABEL_73:
    uint64_t boot_region = ((uint64_t (*)(const char *, uint64_t, uint64_t, char *, void))a1[1])("Check FS: Cleanup", 2, 2, (char *)&v150 + 4, *a1);
    unsigned int v25 = "Check FS: Cleanup: Failed";
  }
LABEL_74:
  int v106 = fsck_exfat_cache_flush(boot_region, v18, v19, v20, v21, v22, v23, v24);
  ++HIDWORD(v150);
  if (v106) {
    goto LABEL_104;
  }
  fsck_exfat_cache_dispose();
  ++HIDWORD(v150);
  int v113 = HIBYTE(word_100110BF2);
  if ((v67 & 2) != 0 && !word_100110BF2)
  {
    long long v147 = ctx;
    long long v148 = *(_OWORD *)&qword_100110C10;
    uint64_t v149 = qword_100110C20;
    if (fsckAskPrompt((uint64_t)&v147, (uint64_t)"Mark volume clean? ", v107, v108, v109, v110, v111, v112, v144) == 1)
    {
      v114 = (const void *)qword_100110B10;
      *(_WORD *)(qword_100110B08 + 106) = v67 & 0xFFFD;
      if (pwrite(g, v114, qword_100110B18, 0) != qword_100110B18)
      {
        warn("Could not update main boot region");
LABEL_104:
        int v128 = 0;
        uint64_t v16 = 1;
        if (!v9) {
          goto LABEL_17;
        }
        goto LABEL_105;
      }
    }
    int v113 = HIBYTE(word_100110BF2);
  }
  if (v113)
  {
    long long v147 = ctx;
    long long v148 = *(_OWORD *)&qword_100110C10;
    uint64_t v149 = qword_100110C20;
    fsckPrint((uint64_t)&v147, 108, v107, v108, v109, v110, v111, v112, (uint64_t)byte_100110B74);
    goto LABEL_104;
  }
  if ((_BYTE)word_100110BF2)
  {
    long long v147 = ctx;
    long long v148 = *(_OWORD *)&qword_100110C10;
    uint64_t v149 = qword_100110C20;
    fsckPrint((uint64_t)&v147, 109, v107, v108, v109, v110, v111, v112, (uint64_t)byte_100110B74);
    goto LABEL_104;
  }
  long long v147 = ctx;
  long long v148 = *(_OWORD *)&qword_100110C10;
  uint64_t v149 = qword_100110C20;
  if (byte_100110BF4) {
    fsckPrint((uint64_t)&v147, 105, v107, v108, v109, v110, v111, v112, (uint64_t)byte_100110B74);
  }
  else {
    fsckPrint((uint64_t)&v147, 104, v107, v108, v109, v110, v111, v112, (uint64_t)byte_100110B74);
  }
  uint64_t v16 = 0;
  int v128 = 1;
  if (v9)
  {
LABEL_105:
    if (v128) {
      uint64_t v129 = "Check FS: Cleanup";
    }
    else {
      uint64_t v129 = v25;
    }
    ((void (*)(const char *, void))a1[2])(v129, *a1);
  }
LABEL_17:
  if (qword_100110B10) {
    free((void *)qword_100110B10);
  }
  if (qword_100110BB8) {
    fsck_exfat_dir_rele((int *)qword_100110BB8);
  }
  if (qword_100110BC0) {
    free((void *)qword_100110BC0);
  }
  if (qword_100110BD0) {
    free((void *)qword_100110BD0);
  }
  return v16;
}

uint64_t fsck_set_messages_func(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  dword_100110BF8 = a5;
  dword_100110B04 = -1;
  *(void *)&ctx = result;
  *((void *)&ctx + 1) = a2;
  qword_100110C18 = a4;
  qword_100110C20 = a6;
  qword_100110C10 = a3;
  return result;
}

uint64_t fsck_set_quick(uint64_t result)
{
  byte_100110BF7 = result;
  return result;
}

uint64_t fsck_get_quick()
{
  return byte_100110BF7;
}

uint64_t fsck_set_fd(uint64_t result)
{
  g = result;
  return result;
}

uint64_t fsck_set_shadow_fd(uint64_t result)
{
  dword_100110B04 = result;
  return result;
}

uint64_t fsck_set_debug(uint64_t result)
{
  debug = result;
  return result;
}

BOOL fsck_get_debug()
{
  return debug != 0;
}

uint64_t fsck_set_device_block_size(uint64_t result)
{
  dword_100110B30 = result;
  return result;
}

uint64_t fsck_set_device_block_count(uint64_t result)
{
  qword_100110B68 = result;
  return result;
}

unsigned char *convertfmt(char *a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = a1;
  unsigned int v2 = 1;
  do
  {
    a1 = strchr(a1 + 1, 37);
    v2 += 5;
  }
  while (a1);
  size_t v3 = strlen(v1);
  uint64_t v4 = malloc_type_calloc(1uLL, v3 + v2, 0xC0CEA113uLL);
  uint64_t v5 = v4;
  if (v4)
  {
    char v6 = *v1;
    CFIndex v7 = v4;
    if (*v1)
    {
      int v8 = 0;
      int v9 = 0;
      uint64_t v10 = v4;
      do
      {
        if (v8)
        {
          unsigned int v11 = v6 - 65;
          BOOL v12 = ((1 << (v6 - 65)) & 0x94E17D0094407DLL) == 0;
          int v8 = v11 > 0x37 || v12;
          CFIndex v7 = v10;
        }
        else
        {
          *uint64_t v10 = v6;
          CFIndex v7 = v10 + 1;
          if (*v1 == 37)
          {
            if (v1[1] == 37)
            {
              int v8 = 0;
              CFIndex v7 = v10 + 2;
              v10[1] = 37;
              ++v1;
            }
            else
            {
              v7 += sprintf(v10 + 1, "%d$@", ++v9);
              int v8 = 1;
            }
          }
          else
          {
            int v8 = 0;
          }
        }
        int v13 = *++v1;
        char v6 = v13;
        uint64_t v10 = v7;
      }
      while (v13);
    }
    *CFIndex v7 = 0;
  }
  return v5;
}

off_t format_buf_init()
{
  format_buf = (uint64_t)malloc_type_malloc(0x20000uLL, 0xB777EF11uLL);
  if (!format_buf)
  {
    *((void *)&v7 + 1) = *((void *)&newfs_ctx + 1);
    uint64_t v8 = qword_100110C50;
    newfs_print((uint64_t)&v7, 16, (uint64_t)"format buffer", v0, v1, v2, v3, v4, newfs_ctx);
  }
  format_buf_used = 0;
  format_buf_offset = 0;
  int fd = newfs_get_fd();
  return lseek(fd, 0, 0);
}

void format_buf_flush()
{
  if (format_buf_used)
  {
    int fd = newfs_get_fd();
    if (write(fd, (const void *)format_buf, format_buf_used) != format_buf_used)
    {
      *((void *)&v6 + 1) = *((void *)&newfs_ctx + 1);
      uint64_t v7 = qword_100110C50;
      newfs_print((uint64_t)&v6, 16, (uint64_t)"flushing format buffer", v1, v2, v3, v4, v5, newfs_ctx);
    }
    format_buf_used = 0;
  }
}

void format_buf_zero(size_t a1)
{
  size_t v1 = a1;
  uint64_t v2 = format_buf_used;
  if (format_buf_used + a1 >= 0x20000)
  {
    do
    {
      if (v1 >= 0x20000 - v2) {
        size_t v3 = 0x20000 - v2;
      }
      else {
        size_t v3 = v1;
      }
      bzero((void *)(format_buf + v2), v3);
      v1 -= v3;
      format_buf_used += v3;
      format_buf_offset += v3;
      format_buf_flush();
      uint64_t v2 = format_buf_used;
    }
    while ((format_buf_used + v1) >> 17);
  }
  if (v1)
  {
    bzero((void *)(format_buf + v2), v1);
    format_buf_used += v1;
    format_buf_offset += v1;
  }
}

void format_buf_zero_to_offset(uint64_t a1)
{
}

void format_buf_write(char *__src, size_t __n)
{
  size_t v2 = __n;
  uint64_t v4 = format_buf_used;
  if (format_buf_used + __n >= 0x20000)
  {
    do
    {
      if (v2 >= 0x20000 - v4) {
        size_t v5 = 0x20000 - v4;
      }
      else {
        size_t v5 = v2;
      }
      memcpy((void *)(format_buf + v4), __src, v5);
      v2 -= v5;
      format_buf_used += v5;
      format_buf_offset += v5;
      __src += v5;
      format_buf_flush();
      uint64_t v4 = format_buf_used;
    }
    while ((format_buf_used + v2) >> 17);
  }
  if (v2)
  {
    memcpy((void *)(format_buf + v4), __src, v2);
    format_buf_used += v2;
    format_buf_offset += v2;
  }
}

uint64_t newfs_set_context_properties(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)&newfs_ctx = result;
  *((void *)&newfs_ctx + 1) = a2;
  qword_100110C50 = a3;
  return result;
}

uint64_t newfs_print(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (*(void *)result) {
    return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t *))result)(*(void *)(result + 16), a2, a3, &a9);
  }
  return result;
}

void newfs_init_state()
{
  newfs_state = -1;
  dword_100110C68 = 0;
  qword_100110C60 = 0;
  qword_100110C78 = 0;
  qword_100110C80 = 0;
  qword_100110C70 = -1;
}

uint64_t newfs_set_fd(uint64_t result)
{
  newfs_state = result;
  return result;
}

uint64_t newfs_set_sector_size(uint64_t result)
{
  dword_100110C68 = result;
  return result;
}

uint64_t newfs_set_total_sectors(uint64_t result)
{
  qword_100110C60 = result;
  return result;
}

uint64_t newfs_set_partition_offset(uint64_t result)
{
  qword_100110C70 = result;
  return result;
}

uint64_t newfs_set_volume_name(uint64_t result)
{
  qword_100110C80 = result;
  return result;
}

uint64_t newfs_set_device_path(uint64_t result)
{
  qword_100110C78 = result;
  return result;
}

uint64_t newfs_get_fd()
{
  return newfs_state;
}

uint64_t newfs_get_total_sectors()
{
  return qword_100110C60;
}

uint64_t newfs_get_sector_size()
{
  return dword_100110C68;
}

uint64_t newfs_get_partition_offset()
{
  return qword_100110C70;
}

uint64_t newfs_get_volume_name()
{
  return qword_100110C80;
}

uint64_t newfs_get_device_path()
{
  return qword_100110C78;
}

uint64_t newfs_get_wipefs_function_callback()
{
  return *((void *)&newfs_ctx + 1);
}

uint64_t newfs_set_wipefs_function_callback(uint64_t result)
{
  *((void *)&newfs_ctx + 1) = result;
  return result;
}

uint64_t newfs_get_print_function_callback()
{
  return newfs_ctx;
}

uint64_t newfs_set_print_function_callback(uint64_t result)
{
  *(void *)&newfs_ctx = result;
  return result;
}

uint64_t newfs_get_client()
{
  return qword_100110C50;
}

uint64_t newfs_set_client(uint64_t result)
{
  qword_100110C50 = result;
  return result;
}

uint64_t format(uint64_t a1, void *a2)
{
  BOOL v4 = a2 && a2[1] && a2[2] && *a2 != 0;
  uint64_t volume_name = newfs_get_volume_name();
  uint64_t device_path = newfs_get_device_path();
  int v147 = 0;
  unsigned int fd = newfs_get_fd();
  if (v4) {
    ((void (*)(const char *, uint64_t, uint64_t, int *, void))a2[1])("Format: Preparing", 10, 2, &v147, *a2);
  }
  uint64_t sector_size = newfs_get_sector_size();
  if (!sector_size)
  {
    long long v148 = newfs_ctx;
    uint64_t v149 = qword_100110C50;
    uint64_t sector_size = 512;
    newfs_print((uint64_t)&v148, 16, (uint64_t)"%s: Sector size was not initialized, setting to default value (%d)", v8, v9, v10, v11, v12, device_path);
  }
  uint64_t total_sectors = *(void *)(a1 + 8);
  if (!total_sectors)
  {
    uint64_t total_sectors = newfs_get_total_sectors();
    *(void *)(a1 + 8) = total_sectors;
    if (total_sectors == -1)
    {
      long long v148 = newfs_ctx;
      uint64_t v149 = qword_100110C50;
      uint64_t total_sectors = 0x2000;
      newfs_print((uint64_t)&v148, 16, (uint64_t)"%s: Total sectors was not initialized, setting to default value (%d)", v8, v9, v10, v11, v12, device_path);
      *(void *)(a1 + 8) = 0x2000;
    }
  }
  unint64_t v15 = *(unsigned int *)(a1 + 16);
  if (v15)
  {
    *(void *)(a1 + 8) = total_sectors * (unint64_t)sector_size / v15;
    uint64_t sector_size = v15;
  }
  else
  {
    *(_DWORD *)(a1 + 16) = sector_size;
  }
  ++v147;
  if ((12 * sector_size) > 0x20000)
  {
    long long v148 = newfs_ctx;
    uint64_t v149 = qword_100110C50;
    newfs_print((uint64_t)&v148, 16, (uint64_t)"Sector size (%u) is too large", v8, v9, v10, v11, v12, sector_size);
LABEL_22:
    uint64_t v19 = "Format: Preparing: Failed";
    uint64_t v20 = 22;
    goto LABEL_76;
  }
  uint64_t v16 = *(unsigned int *)(a1 + 80);
  if (v16)
  {
    int v17 = *(_DWORD *)(a1 + 20);
    unsigned int v18 = v16 * sector_size;
    if (v17 && v17 != v18)
    {
      long long v148 = newfs_ctx;
      uint64_t v149 = qword_100110C50;
      newfs_print((uint64_t)&v148, 16, (uint64_t)"Inconsistent sectors per cluster (%u) and bytes per cluster (%u)", v8, v9, v10, v11, v12, v16);
      goto LABEL_22;
    }
    if (!v17)
    {
      *(_DWORD *)(a1 + 20) = v18;
      if (v18 >= 0x2000001)
      {
        long long v148 = newfs_ctx;
        uint64_t v149 = qword_100110C50;
        newfs_print((uint64_t)&v148, 16, (uint64_t)"Sectors per cluster (%u) too large; max is %u",
          v8,
          v9,
          v10,
          v11,
          v12,
          v16);
        goto LABEL_22;
      }
    }
  }
  temp_buffer = (uint64_t)malloc_type_calloc(1uLL, 0x20000uLL, 0x7A6E79F4uLL);
  if (!temp_buffer || (uint64_t v26 = malloc_type_malloc(*(unsigned int *)(a1 + 16), 0xE72E6DAAuLL)) == 0)
  {
    long long v148 = newfs_ctx;
    uint64_t v149 = qword_100110C50;
    newfs_print((uint64_t)&v148, 16, (uint64_t)"Failed to allocate temporary buffer", v21, v22, v23, v24, v25, v145);
    uint64_t v19 = "Format: Preparing: Failed";
    uint64_t v20 = 12;
    goto LABEL_76;
  }
  uint64_t v27 = v26;
  if (v4)
  {
    ++v147;
    ((void (*)(const char *, void))a2[2])("Format: Preparing", *a2);
    int v147 = 0;
    uint64_t v19 = "Format: Check reformat: Failed";
  }
  else
  {
    uint64_t v19 = "Format: Preparing: Failed";
  }
  if (*(unsigned char *)(a1 + 105)) {
    check_reformat(a1, a2);
  }
  exfat_format_defaults(device_path, a1);
  *(_DWORD *)(a1 + 80) = *(_DWORD *)(a1 + 20) / *(_DWORD *)(a1 + 16);
  if (volume_name)
  {
    long long v148 = newfs_ctx;
    uint64_t v149 = qword_100110C50;
    newfs_print((uint64_t)&v148, 1, (uint64_t)"Volume name      : %s\n", v28, v29, v30, v31, v32, volume_name);
  }
  uint64_t v33 = *(void *)a1;
  long long v148 = newfs_ctx;
  uint64_t v149 = qword_100110C50;
  newfs_print((uint64_t)&v148, 1, (uint64_t)"Partition offset : %llu sectors (%llu bytes)\n", v28, v29, v30, v31, v32, v33);
  uint64_t v34 = *(void *)(a1 + 8);
  long long v148 = newfs_ctx;
  uint64_t v149 = qword_100110C50;
  newfs_print((uint64_t)&v148, 1, (uint64_t)"Volume size      : %llu sectors (%llu bytes)\n", v35, v36, v37, v38, v39, v34);
  uint64_t v40 = *(unsigned int *)(a1 + 16);
  long long v148 = newfs_ctx;
  uint64_t v149 = qword_100110C50;
  newfs_print((uint64_t)&v148, 1, (uint64_t)"Bytes per sector : %u\n", v41, v42, v43, v44, v45, v40);
  uint64_t v46 = *(unsigned int *)(a1 + 20);
  long long v148 = newfs_ctx;
  uint64_t v149 = qword_100110C50;
  newfs_print((uint64_t)&v148, 1, (uint64_t)"Bytes per cluster: %u\n", v47, v48, v49, v50, v51, v46);
  uint64_t v52 = *(unsigned int *)(a1 + 24);
  long long v148 = newfs_ctx;
  uint64_t v149 = qword_100110C50;
  newfs_print((uint64_t)&v148, 1, (uint64_t)"FAT offset       : %u sectors (%llu bytes)\n", v53, v54, v55, v56, v57, v52);
  uint64_t v58 = *(unsigned int *)(a1 + 28);
  long long v148 = newfs_ctx;
  uint64_t v149 = qword_100110C50;
  newfs_print((uint64_t)&v148, 1, (uint64_t)"# FAT sectors    : %u\n", v59, v60, v61, v62, v63, v58);
  uint64_t v64 = *(unsigned int *)(a1 + 44);
  long long v148 = newfs_ctx;
  uint64_t v149 = qword_100110C50;
  newfs_print((uint64_t)&v148, 1, (uint64_t)"Number of FATs   : %u\n", v65, v66, v67, v68, v69, v64);
  uint64_t v70 = *(unsigned int *)(a1 + 32);
  long long v148 = newfs_ctx;
  uint64_t v149 = qword_100110C50;
  newfs_print((uint64_t)&v148, 1, (uint64_t)"Cluster offset   : %u sectors (%llu bytes)\n", v71, v72, v73, v74, v75, v70);
  uint64_t v76 = *(unsigned int *)(a1 + 36);
  long long v148 = newfs_ctx;
  uint64_t v149 = qword_100110C50;
  newfs_print((uint64_t)&v148, 1, (uint64_t)"# Clusters       : %u\n", v77, v78, v79, v80, v81, v76);
  uint64_t v82 = *(unsigned int *)(a1 + 40);
  long long v148 = newfs_ctx;
  uint64_t v149 = qword_100110C50;
  newfs_print((uint64_t)&v148, 1, (uint64_t)"Volume Serial #  : %08x\n", v83, v84, v85, v86, v87, v82);
  uint64_t v88 = *(unsigned int *)(a1 + 72);
  long long v148 = newfs_ctx;
  uint64_t v149 = qword_100110C50;
  newfs_print((uint64_t)&v148, 1, (uint64_t)"Bitmap start     : %u\n", v89, v90, v91, v92, v93, v88);
  if (*(_DWORD *)(a1 + 44) == 2)
  {
    uint64_t v99 = *(unsigned int *)(a1 + 76);
    long long v148 = newfs_ctx;
    uint64_t v149 = qword_100110C50;
    newfs_print((uint64_t)&v148, 1, (uint64_t)"Bitmap start (#2): %u\n", v94, v95, v96, v97, v98, v99);
  }
  uint64_t v100 = *(unsigned int *)(a1 + 84);
  long long v148 = newfs_ctx;
  uint64_t v149 = qword_100110C50;
  newfs_print((uint64_t)&v148, 1, (uint64_t)"Bitmap file size : %u\n", v94, v95, v96, v97, v98, v100);
  uint64_t v101 = *(unsigned int *)(a1 + 88);
  long long v148 = newfs_ctx;
  uint64_t v149 = qword_100110C50;
  newfs_print((uint64_t)&v148, 1, (uint64_t)"Upcase start     : %u\n", v102, v103, v104, v105, v106, v101);
  uint64_t v107 = *(unsigned int *)(a1 + 92);
  long long v148 = newfs_ctx;
  uint64_t v149 = qword_100110C50;
  newfs_print((uint64_t)&v148, 1, (uint64_t)"Upcase file size : %u\n", v108, v109, v110, v111, v112, v107);
  uint64_t v113 = *(unsigned int *)(a1 + 96);
  long long v148 = newfs_ctx;
  uint64_t v149 = qword_100110C50;
  newfs_print((uint64_t)&v148, 1, (uint64_t)"Root start       : %u\n", v114, v115, v116, v117, v118, v113);
  if (*(unsigned char *)(a1 + 104))
  {
    uint64_t v20 = 0;
    goto LABEL_76;
  }
  if (v4)
  {
    ((void (*)(const char *, uint64_t, uint64_t, int *, void))a2[1])("Format: Wipe", 25, 1, &v147, *a2);
    uint64_t v19 = "Format: Wipe: Failed";
  }
  else
  {
    uint64_t v19 = "Format: Preparing: Failed";
  }
  if (*((void *)&newfs_ctx + 1))
  {
    uint64_t v119 = *(unsigned int *)(a1 + 16);
    int v120 = *(_DWORD *)(a1 + 32) + (*(_DWORD *)(a1 + 96) - 1) * *(_DWORD *)(a1 + 80);
    *(void *)&long long v148 = 0;
    *((void *)&v148 + 1) = fd;
    uint64_t v149 = v119;
    int v150 = 0;
    int v151 = v120;
    uint64_t v152 = 0;
    uint64_t v121 = (*((uint64_t (**)(uint64_t, long long *))&newfs_ctx + 1))(qword_100110C50, &v148);
    ++v147;
    if (v121)
    {
      uint64_t v20 = v121;
      long long v148 = newfs_ctx;
      uint64_t v149 = qword_100110C50;
      newfs_print((uint64_t)&v148, 16, (uint64_t)"Encountered errors trying to wipe resource", v122, v123, v124, v125, v126, v146);
      goto LABEL_76;
    }
  }
  else
  {
    ++v147;
  }
  if (v4)
  {
    ((void (*)(const char *, void))a2[2])("Format: Wipe", *a2);
    int v147 = 0;
    ((void (*)(const char *, uint64_t, uint64_t, int *, void))a2[1])("Format: Prepare boot region", 10, 3, &v147, *a2);
    uint64_t v19 = "Format: Prepare boot region: Failed";
  }
  uint64_t v127 = temp_buffer;
  if (!*(_DWORD *)(a1 + 100))
  {
    bzero((void *)temp_buffer, *(unsigned int *)(a1 + 16));
    *(_DWORD *)(v127 + 7) = 538976340;
    *(void *)uint64_t v127 = *(void *)"\xEB\x76\x90EXFAT   ";
    *(void *)(v127 + 64) = *(void *)a1;
    *(void *)(v127 + 72) = *(void *)(a1 + 8);
    *(_DWORD *)(v127 + 80) = *(_DWORD *)(a1 + 24);
    *(_DWORD *)(v127 + 84) = *(_DWORD *)(a1 + 28);
    *(_DWORD *)(v127 + 88) = *(_DWORD *)(a1 + 32);
    *(_DWORD *)(v127 + 92) = *(_DWORD *)(a1 + 36);
    *(_DWORD *)(v127 + 100) = *(_DWORD *)(a1 + 40);
    *(_WORD *)(v127 + 104) = 256;
    unsigned int v128 = *(_DWORD *)(a1 + 16);
    if (v128 < 2)
    {
      char v129 = 0;
    }
    else
    {
      char v129 = 0;
      do
      {
        ++v129;
        BOOL v130 = v128 > 3;
        v128 >>= 1;
      }
      while (v130);
    }
    *(unsigned char *)(v127 + 108) = v129;
    unsigned int v131 = *(_DWORD *)(a1 + 80);
    if (v131 < 2)
    {
      char v132 = 0;
    }
    else
    {
      char v132 = 0;
      do
      {
        ++v132;
        BOOL v130 = v131 > 3;
        v131 >>= 1;
      }
      while (v130);
    }
    char v133 = *(_DWORD *)(a1 + 44);
    *(void *)&long long v134 = 0xF4F4F4F4F4F4F4F4;
    *((void *)&v134 + 1) = 0xF4F4F4F4F4F4F4F4;
    *(_OWORD *)(v127 + 120) = v134;
    *(unsigned char *)(v127 + 109) = v132;
    *(unsigned char *)(v127 + 110) = v133;
    *(unsigned char *)(v127 + 111) = 0x80;
    *(_OWORD *)(v127 + 472) = v134;
    *(_OWORD *)(v127 + 488) = v134;
    *(_OWORD *)(v127 + 440) = v134;
    *(_OWORD *)(v127 + 456) = v134;
    *(_OWORD *)(v127 + 408) = v134;
    *(_OWORD *)(v127 + 424) = v134;
    *(_OWORD *)(v127 + 376) = v134;
    *(_OWORD *)(v127 + 392) = v134;
    *(_OWORD *)(v127 + 344) = v134;
    *(_OWORD *)(v127 + 360) = v134;
    *(_OWORD *)(v127 + 312) = v134;
    *(_OWORD *)(v127 + 328) = v134;
    *(_OWORD *)(v127 + 280) = v134;
    *(_OWORD *)(v127 + 296) = v134;
    *(_OWORD *)(v127 + 248) = v134;
    *(_OWORD *)(v127 + 264) = v134;
    *(_OWORD *)(v127 + 216) = v134;
    *(_OWORD *)(v127 + 232) = v134;
    *(_OWORD *)(v127 + 184) = v134;
    *(_OWORD *)(v127 + 200) = v134;
    *(_OWORD *)(v127 + 152) = v134;
    *(_OWORD *)(v127 + 168) = v134;
    *(_OWORD *)(v127 + 136) = v134;
    *(void *)(v127 + 502) = 0xF4F4F4F4F4F4F4F4;
  }
  *(_DWORD *)(v127 + 96) = *(_DWORD *)(a1 + 96);
  *(unsigned char *)(v127 + 112) = (100 * *(_DWORD *)(a1 + 96) - 100) / *(_DWORD *)(a1 + 36);
  int v135 = 2;
  *(_WORD *)(v127 + 106) = 0;
  *(_WORD *)(v127 + 510) = -21931;
  do
  {
    *(unsigned char *)(temp_buffer + (*(_DWORD *)(a1 + 16) * v135 - 4)) = 0;
    *(unsigned char *)(temp_buffer + (*(_DWORD *)(a1 + 16) * v135 - 3)) = 0;
    *(unsigned char *)(temp_buffer + (*(_DWORD *)(a1 + 16) * v135 - 2)) = 85;
    *(unsigned char *)(temp_buffer + (*(_DWORD *)(a1 + 16) * v135++ - 1)) = -86;
  }
  while (v135 != 10);
  exfat_set_boot_checksum(temp_buffer, *(unsigned int *)(a1 + 16));
  ++v147;
  memmove(v27, (const void *)temp_buffer, *(unsigned int *)(a1 + 16));
  bzero((void *)temp_buffer, *(unsigned int *)(a1 + 16));
  ++v147;
  format_buf_init();
  format_buf_write((char *)temp_buffer, (12 * *(_DWORD *)(a1 + 16)));
  format_buf_write((char *)temp_buffer, (12 * *(_DWORD *)(a1 + 16)));
  format_buf_zero_to_offset(*(unsigned int *)(a1 + 16) * (unint64_t)*(unsigned int *)(a1 + 24));
  ++v147;
  if (v4)
  {
    ((void (*)(const char *, void))a2[2])("Format: Prepare boot region", *a2);
    int v147 = 0;
    ((void (*)(const char *, uint64_t, uint64_t, int *, void))a2[1])("Format: Write FAT tables", 10, 3, &v147, *a2);
    fat_write((_DWORD *)a1, &v147);
    uint64_t v19 = 0;
  }
  else
  {
    fat_write((_DWORD *)a1, &v147);
    if (!a2)
    {
      bitmap_write((_DWORD *)a1, &v147);
      goto LABEL_70;
    }
  }
  ((void (*)(const char *, void))a2[2])("Format: Write FAT tables", *a2);
  int v147 = 0;
  if (v4)
  {
    ((void (*)(const char *, uint64_t, void, int *, void))a2[1])("Format: Write bitmaps", 10, *(unsigned int *)(a1 + 44), &v147, *a2);
    bitmap_write((_DWORD *)a1, &v147);
    ((void (*)(const char *, void))a2[2])("Format: Write bitmaps", *a2);
    int v147 = 0;
    ((void (*)(const char *, uint64_t, uint64_t, int *, void))a2[1])("Format: Flush data structures", 10, 4, &v147, *a2);
    uint64_t v19 = "Format: Flush data structures: Failed";
  }
  else
  {
    bitmap_write((_DWORD *)a1, &v147);
    ((void (*)(const char *, void))a2[2])("Format: Write bitmaps", *a2);
    int v147 = 0;
  }
LABEL_70:
  upcase_write(a1);
  ++v147;
  root_write(a1);
  ++v147;
  format_buf_flush();
  ++v147;
  ssize_t v136 = pwrite(fd, v27, *(unsigned int *)(a1 + 16), (12 * *(_DWORD *)(a1 + 16)));
  if (v136 == *(_DWORD *)(a1 + 16))
  {
    if (pwrite(fd, v27, v136, 0) == *(_DWORD *)(a1 + 16))
    {
      uint64_t v20 = 0;
      ++v147;
      goto LABEL_76;
    }
    long long v148 = newfs_ctx;
    uint64_t v149 = qword_100110C50;
    uint64_t v142 = "writing main boot sector";
  }
  else
  {
    long long v148 = newfs_ctx;
    uint64_t v149 = qword_100110C50;
    uint64_t v142 = "writing backup boot sector";
  }
  newfs_print((uint64_t)&v148, 16, (uint64_t)v142, v137, v138, v139, v140, v141, v146);
  uint64_t v20 = *__error();
LABEL_76:
  if (v4)
  {
    if (v20) {
      uint64_t v143 = v19;
    }
    else {
      uint64_t v143 = "Format: Flush data structures";
    }
    ((void (*)(const char *, void))a2[2])(v143, *a2);
  }
  return v20;
}

void check_reformat(uint64_t a1, void *a2)
{
  int v49 = 0;
  int fd = newfs_get_fd();
  if (lseek(fd, 0, 0)
    || (size_t v5 = (12 * *(_DWORD *)(a1 + 16)), v6 = newfs_get_fd(), read(v6, (void *)temp_buffer, v5) != v5))
  {
    int v14 = 0;
    uint64_t v12 = 0;
    goto LABEL_9;
  }
  uint64_t v12 = temp_buffer;
  if (*(void *)temp_buffer != 0x54414658459076EBLL || *(void *)(temp_buffer + 3) != 0x2020205441465845)
  {
    int v14 = 0;
LABEL_9:
    unint64_t v15 = "Format: Check reformat: Failed";
    goto LABEL_10;
  }
  if (a2)
  {
    ((void (*)(const char *, uint64_t, void, int *, void))a2[1])("Format: Check reformat", 25, *(unsigned int *)(temp_buffer + 92), &v49, *a2);
    int v14 = 1;
  }
  else
  {
    int v14 = 0;
  }
  if (*(_WORD *)(v12 + 104) != 256)
  {
    fprintf(__stderrp, "Unknown FS version (%04X); skipping reformat\n", *(unsigned __int16 *)(v12 + 104));
    goto LABEL_9;
  }
  unint64_t v16 = *(void *)(v12 + 72);
  if (v16 != *(void *)(a1 + 8)
    || (int v17 = *(unsigned __int8 *)(v12 + 108), v18 = 1 << v17, (1 << v17) != *(_DWORD *)(a1 + 16))
    || (int v19 = *(unsigned __int8 *)(v12 + 109), (v19 + v17) >= 0x1A))
  {
    uint64_t v20 = __stderrp;
    uint64_t v21 = "Invalid sector size, cluster size, or number of sectors; skipping reformat\n";
    size_t v22 = 75;
LABEL_24:
    fwrite(v21, v22, 1uLL, v20);
    goto LABEL_9;
  }
  int v23 = *(unsigned __int8 *)(v12 + 110);
  if ((v23 - 3) < 0xFFFFFFFE
    || (uint64_t v24 = *(unsigned int *)(v12 + 80),
        int v25 = *(_DWORD *)(v12 + 84),
        uint64_t v26 = *(unsigned int *)(v12 + 88),
        v26 < (int)v24 + v25 * v23))
  {
    uint64_t v20 = __stderrp;
    uint64_t v21 = "Invalid number of FATs, or FAT or cluster offset; skipping reformat\n";
    size_t v22 = 68;
    goto LABEL_24;
  }
  uint64_t v27 = *(unsigned int *)(v12 + 92);
  if ((v27 << v19) + v26 > v16)
  {
    uint64_t v20 = __stderrp;
    uint64_t v21 = "Invalid cluster offset or count; skipping reformat\n";
    size_t v22 = 51;
    goto LABEL_24;
  }
  size_t v28 = (v18 << v19);
  int v29 = *(_DWORD *)(a1 + 20);
  if (v29 && v29 != v28)
  {
    uint64_t v20 = __stderrp;
    uint64_t v21 = "Cluster size differs from command line argument; skipping reformat\n";
    size_t v22 = 67;
    goto LABEL_24;
  }
  *(void *)a1 = *(void *)(v12 + 64);
  *(_DWORD *)(a1 + 20) = v28;
  *(_DWORD *)(a1 + 24) = v24;
  *(_DWORD *)(a1 + 28) = v25;
  *(_DWORD *)(a1 + 32) = v26;
  *(_DWORD *)(a1 + 36) = v27;
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(v12 + 100);
  *(_DWORD *)(a1 + 44) = v23;
  if (*(__int16 *)(a1 + 48) == -1)
  {
    uint64_t v44 = v26;
    char v45 = v19;
    uint64_t v42 = v24;
    int v46 = v14;
    uint64_t v30 = (unsigned __int8 *)malloc_type_malloc((v18 << v19), 0x20B82865uLL);
    if (!v30)
    {
      fwrite("No memory for cluster buffer; skipping reformat\n", 0x30uLL, 1uLL, __stderrp);
      unint64_t v15 = "Format: Check reformat: Failed";
LABEL_55:
      int v14 = v46;
      goto LABEL_10;
    }
    uint64_t v31 = v30;
    unsigned int v32 = *(_DWORD *)(v12 + 96);
    if (v32 >= 2)
    {
      unsigned int v33 = v27 + 1;
      if (v32 <= v33)
      {
        uint64_t v43 = v12;
        while (1)
        {
          unsigned int v34 = v32;
          off_t v35 = (((unint64_t)(v32 - 2) << v45) + v44) << v17;
          int v36 = newfs_get_fd();
          if (pread(v36, v31, v28, v35) != v28)
          {
            fprintf(__stderrp, "Failed to read cluster %u; skipping reformat\n");
            goto LABEL_61;
          }
          uint64_t v12 = v43;
          if (v28)
          {
            for (size_t i = 0; i < v28; i += 32)
            {
              if (v31[i] == 131)
              {
                uint64_t v38 = v31[i + 1];
                if ((v38 - 1) <= 0xA)
                {
                  *(_WORD *)(a1 + 48) = v38;
                  memcpy((void *)(a1 + 50), &v31[i + 2], 2 * v38);
                  goto LABEL_57;
                }
              }
              else if (!v31[i])
              {
                goto LABEL_57;
              }
            }
          }
          int v39 = newfs_get_fd();
          if (pread(v39, v31, 1 << v17, (((4 * v34) >> v17) + v42) << v17) != v18) {
            break;
          }
          unsigned int v32 = *(_DWORD *)&v31[(4 * v34) & (v18 - 1)];
          ++v49;
          BOOL v40 = v32 < 2 || v32 > v33;
          uint64_t v12 = v43;
          if (v40) {
            goto LABEL_57;
          }
        }
        fprintf(__stderrp, "Failed to read FAT for cluster %u; skipping reformat\n");
LABEL_61:
        free(v31);
        unint64_t v15 = "Format: Check reformat: Failed";
        uint64_t v12 = v43;
        goto LABEL_55;
      }
    }
LABEL_57:
    free(v31);
    int v14 = v46;
  }
  long long v47 = newfs_ctx;
  uint64_t v48 = qword_100110C50;
  newfs_print((uint64_t)&v47, 1, (uint64_t)"Reformatting existing ExFAT volume\n", v7, v8, v9, v10, v11, v41);
  *(_DWORD *)(a1 + 100) = 1;
  unint64_t v15 = "Format: Check reformat";
LABEL_10:
  if (a2)
  {
    if (v14) {
      int v49 = *(_DWORD *)(v12 + 92);
    }
    else {
      ((void (*)(const char *, uint64_t, uint64_t, int *, void))a2[1])("Format: Check reformat", 20, 1, &v49, *a2);
    }
    ((void (*)(const char *, void))a2[2])(v15, *a2);
  }
}

unint64_t exfat_format_defaults(unint64_t result, uint64_t a2)
{
  if (!*(_DWORD *)(a2 + 100))
  {
    BOOL v3 = is_SDXC(result);
    BOOL v4 = (char *)&SDXC_defaults;
    if (!v3) {
      BOOL v4 = (char *)&disk_defaults;
    }
    size_t v5 = v4 - 8;
    do
    {
      unint64_t v6 = *((void *)v5 + 3) - 1;
      v5 += 16;
    }
    while (v6 < *(void *)(a2 + 8) * (unint64_t)*(unsigned int *)(a2 + 16));
    unint64_t partition_offset = newfs_get_partition_offset();
    if (partition_offset == -1)
    {
      long long v32 = newfs_ctx;
      uint64_t v33 = qword_100110C50;
      newfs_print((uint64_t)&v32, 16, (uint64_t)"Partition offset was not initialized , setting to default value (%d)", v8, v9, v10, v11, v12, 0);
      unint64_t partition_offset = 0;
    }
    unint64_t v13 = *(unsigned int *)(a2 + 16);
    *(void *)a2 = partition_offset / v13;
    unsigned int v14 = *(_DWORD *)(a2 + 44);
    if (!v14)
    {
      unsigned int v14 = 1;
      *(_DWORD *)(a2 + 44) = 1;
    }
    unsigned int v15 = *(_DWORD *)(a2 + 20);
    if (!v15)
    {
      unsigned int v15 = *(_DWORD *)v5;
      *(_DWORD *)(a2 + 20) = *(_DWORD *)v5;
    }
    unint64_t v16 = v15 / v13;
    unint64_t v17 = *((_DWORD *)v5 + 1) / v13;
    if (0x18 % v17) {
      int v18 = v17 - 0x18 % v17 + 24;
    }
    else {
      int v18 = 24;
    }
    *(_DWORD *)(a2 + 24) = v18;
    LODWORD(v19) = v18;
    do
    {
      uint64_t v19 = (v19 + v17);
      unint64_t v20 = (*(void *)(a2 + 8) - v19) / v16;
      unint64_t v21 = 4 * v20 + 8;
      if (v21 % v13) {
        unint64_t v22 = v21 / v13 + 1;
      }
      else {
        unint64_t v22 = v21 / v13;
      }
      if (v22 % v17) {
        uint64_t v23 = v17 - v22 % v17;
      }
      else {
        uint64_t v23 = 0;
      }
      unint64_t v24 = v23 + v22;
      uint64_t result = (v19 - v18);
    }
    while (v24 * v14 > result);
    int v25 = -1;
    if (v24 >= 0xFFFFFFFF) {
      int v26 = -1;
    }
    else {
      int v26 = v24;
    }
    *(_DWORD *)(a2 + 28) = v26;
    *(_DWORD *)(a2 + 32) = v19;
    if (v20 < 0xFFFFFFFF) {
      int v25 = v20;
    }
    *(_DWORD *)(a2 + 36) = v25;
    if (!*(_DWORD *)(a2 + 40))
    {
      uint64_t result = time(0);
      *(_DWORD *)(a2 + 40) = result;
    }
  }
  *(_DWORD *)(a2 + 72) = 2;
  if ((*(_DWORD *)(a2 + 36) & 7) != 0) {
    unsigned int v27 = (*(_DWORD *)(a2 + 36) >> 3) + 1;
  }
  else {
    unsigned int v27 = *(_DWORD *)(a2 + 36) >> 3;
  }
  *(_DWORD *)(a2 + 84) = v27;
  unsigned int v28 = *(_DWORD *)(a2 + 20);
  int v29 = v27 / v28;
  if (v27 % v28) {
    ++v29;
  }
  int v30 = v29 + 2;
  if (*(_DWORD *)(a2 + 44) == 2)
  {
    *(_DWORD *)(a2 + 76) = v30;
    v30 += v29;
  }
  *(_DWORD *)(a2 + 88) = v30;
  *(_DWORD *)(a2 + 92) = 5836;
  if (0x16CC / v28 * v28 == 5836) {
    unsigned int v31 = 0x16CC / v28;
  }
  else {
    unsigned int v31 = 0x16CC / v28 + 1;
  }
  *(_DWORD *)(a2 + 96) = v30 + v31;
  return result;
}

uint64_t ilog2(unsigned int a1)
{
  if (a1 < 2)
  {
    return 0;
  }
  else
  {
    unsigned __int8 v1 = 0;
    do
    {
      ++v1;
      BOOL v2 = a1 > 3;
      a1 >>= 1;
    }
    while (v2);
  }
  return v1;
}

uint64_t exfat_set_boot_checksum(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    int v2 = 0;
    uint64_t v3 = 0;
    uint64_t v4 = 11 * a2;
    if ((unint64_t)(11 * a2) <= 1) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = 11 * a2;
    }
    do
    {
      if ((unint64_t)(v3 - 106) > 6 || ((1 << (v3 - 106)) & 0x43) == 0)
      {
        HIDWORD(v7) = v2;
        LODWORD(v7) = v2;
        int v2 = (v7 >> 1) + *(unsigned __int8 *)(result + v3);
      }
      ++v3;
    }
    while (v5 != v3);
  }
  else
  {
    uint64_t v4 = 0;
    int v2 = 0;
  }
  if (v4 < 12 * a2)
  {
    uint64_t v8 = (_DWORD *)(result + v4);
    do
      *v8++ = v2;
    while ((unint64_t)v8 < result + 12 * a2);
  }
  return result;
}

void fat_write(_DWORD *a1, _DWORD *a2)
{
  uint64_t v4 = (void *)temp_buffer;
  bzero((void *)temp_buffer, 0x20000uLL);
  void *v4 = -8;
  unsigned int v5 = a1[18];
  unsigned int v6 = a1[21];
  unsigned int v7 = a1[5];
  if (v6 % v7) {
    unsigned int v8 = v6 / v7 + 1;
  }
  else {
    unsigned int v8 = v6 / v7;
  }
  if (v8 < 2)
  {
    unsigned int v9 = a1[18];
  }
  else
  {
    do
    {
      unsigned int v9 = v5 + 1;
      *((_DWORD *)v4 + v5) = v5 + 1;
      --v8;
      ++v5;
    }
    while (v8 > 1);
  }
  ++*a2;
  *((_DWORD *)v4 + v9) = -1;
  unsigned int v10 = a1[22];
  unsigned int v11 = a1[23];
  unsigned int v12 = a1[5];
  if (v11 % v12) {
    unsigned int v13 = v11 / v12 + 1;
  }
  else {
    unsigned int v13 = v11 / v12;
  }
  if (v13 < 2)
  {
    unsigned int v14 = a1[22];
  }
  else
  {
    do
    {
      unsigned int v14 = v10 + 1;
      *((_DWORD *)v4 + v10) = v10 + 1;
      --v13;
      ++v10;
    }
    while (v13 > 1);
  }
  ++*a2;
  *((_DWORD *)v4 + v14) = -1;
  *((_DWORD *)v4 + a1[24]) = -1;
  unsigned int v15 = a1[4];
  if (a1[11])
  {
    unsigned int v16 = 0;
    size_t v17 = v15 * (unint64_t)a1[7];
    do
    {
      if (v17 <= 0x20000)
      {
        format_buf_write((char *)temp_buffer, v17);
      }
      else
      {
        format_buf_write((char *)temp_buffer, 0x20000uLL);
        format_buf_zero(v17 - 0x20000);
      }
      ++v16;
    }
    while (v16 < a1[11]);
    unsigned int v15 = a1[4];
  }
  format_buf_zero_to_offset(v15 * (unint64_t)a1[8]);
  ++*a2;
}

void bitmap_write(_DWORD *a1, _DWORD *a2)
{
  int v4 = a1[24];
  int v5 = v4 - 1;
  unsigned int v6 = (unsigned int *)temp_buffer;
  bzero((void *)temp_buffer, 0x20000uLL);
  if ((v4 - 1) >= 0x20)
  {
    unsigned int v7 = v4 - 33;
    memset(v6, 255, ((v7 >> 3) & 0x1FFFFFFC) + 4);
    unsigned int v6 = (unsigned int *)((char *)v6 + ((v7 >> 3) & 0x1FFFFFFC) + 4);
    int v5 = v7 & 0x1F;
  }
  if (v5) {
    *unsigned int v6 = 0xFFFFFFFF >> -(char)v5;
  }
  unsigned int v8 = a1[21];
  unsigned int v9 = a1[5];
  int v10 = v8 % v9;
  unsigned int v11 = v9 - v8 % v9;
  if (!v10) {
    unsigned int v11 = 0;
  }
  if (a1[11])
  {
    unsigned int v12 = 0;
    size_t v13 = v11 + v8;
    do
    {
      if (v13 <= 0x20000)
      {
        format_buf_write((char *)temp_buffer, v13);
      }
      else
      {
        format_buf_write((char *)temp_buffer, 0x20000uLL);
        format_buf_zero(v13 - 0x20000);
      }
      ++*a2;
      ++v12;
    }
    while (v12 < a1[11]);
  }
}

void upcase_write(uint64_t a1)
{
  size_t v2 = *(unsigned int *)(a1 + 92);
  unsigned int v3 = *(_DWORD *)(a1 + 20);
  unsigned int v4 = v2 % v3;
  int v5 = v3 - v2 % v3;
  if (!v4) {
    int v5 = 0;
  }
  uint64_t v6 = (v5 + v2);
  format_buf_write(&upcase_table, v2);
  size_t v7 = v6 - *(unsigned int *)(a1 + 92);

  format_buf_zero(v7);
}

void root_write(uint64_t a1)
{
  uint64_t v2 = temp_buffer;
  *(_OWORD *)temp_buffer = 0u;
  *(_OWORD *)(v2 + 16) = 0u;
  *(_OWORD *)(v2 + 32) = 0u;
  *(_OWORD *)(v2 + 48) = 0u;
  *(_OWORD *)(v2 + 64) = 0u;
  *(_OWORD *)(v2 + 80) = 0u;
  *(_OWORD *)(v2 + 96) = 0u;
  *(_OWORD *)(v2 + 112) = 0u;
  *(unsigned char *)uint64_t v2 = -125;
  unsigned int v3 = *(unsigned __int16 *)(a1 + 48);
  if (v3 <= 0xB)
  {
    *(unsigned char *)(v2 + 1) = v3;
    memcpy((void *)(v2 + 2), (const void *)(a1 + 50), 2 * *(unsigned __int16 *)(a1 + 48));
  }
  *(unsigned char *)(v2 + 32) = -127;
  *(_DWORD *)(v2 + 52) = *(_DWORD *)(a1 + 72);
  *(void *)(v2 + 56) = *(unsigned int *)(a1 + 84);
  if (*(_DWORD *)(a1 + 44) == 2)
  {
    *(_WORD *)(v2 + 64) = 385;
    *(_DWORD *)(v2 + 84) = *(_DWORD *)(a1 + 76);
    *(void *)(v2 + 88) = *(unsigned int *)(a1 + 84);
    uint64_t v4 = v2 + 96;
  }
  else
  {
    uint64_t v4 = v2 + 64;
  }
  *(unsigned char *)uint64_t v4 = -126;
  uint64_t v5 = *(unsigned int *)(a1 + 92);
  if (v5)
  {
    int v6 = 0;
    size_t v7 = &upcase_table;
    do
    {
      HIDWORD(v8) = v6;
      LODWORD(v8) = v6;
      int v9 = *v7++;
      int v6 = (v8 >> 1) + v9;
      --v5;
    }
    while (v5);
  }
  else
  {
    int v6 = 0;
  }
  *(_DWORD *)(v4 + 4) = v6;
  *(_DWORD *)(v4 + 20) = *(_DWORD *)(a1 + 88);
  *(void *)(v4 + 24) = *(unsigned int *)(a1 + 92);
  format_buf_write((char *)temp_buffer, 0x80uLL);
  size_t v10 = *(unsigned int *)(a1 + 20) - 128;

  format_buf_zero(v10);
}

BOOL is_SDXC(uint64_t a1)
{
  if (!strncmp((const char *)a1, "/dev/", 5uLL))
  {
    int v4 = *(unsigned __int8 *)(a1 + 5);
    uint64_t v3 = a1 + 5;
    uint64_t v5 = (const char *)(v4 == 114 ? v3 + 1 : v3);
    CFDictionaryRef v6 = IOBSDNameMatching(kIOMainPortDefault, 0, v5);
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v6);
    if (MatchingService)
    {
      io_object_t v8 = MatchingService;
      CFDictionaryRef v9 = (const __CFDictionary *)IORegistryEntrySearchCFProperty(MatchingService, "IOService", @"Card Characteristics", kCFAllocatorDefault, 3u);
      if (!v9)
      {
        BOOL v2 = 0;
        goto LABEL_15;
      }
      CFDictionaryRef v10 = v9;
      CFTypeID v11 = CFGetTypeID(v9);
      if (v11 == CFDictionaryGetTypeID())
      {
        Value = CFDictionaryGetValue(v10, @"Card Type");
        BOOL v2 = (BOOL)Value;
        if (!Value)
        {
LABEL_13:
          CFRelease(v10);
LABEL_15:
          IOObjectRelease(v8);
          return v2;
        }
        CFTypeID v13 = CFGetTypeID(Value);
        if (v13 == CFStringGetTypeID())
        {
          BOOL v2 = CFEqual((CFTypeRef)v2, @"SDXC") != 0;
          goto LABEL_13;
        }
      }
      BOOL v2 = 0;
      goto LABEL_13;
    }
  }
  return 0;
}

unint64_t get_uint32(uint64_t a1, char *__str, int *a3)
{
  __endptr = 0;
  unint64_t result = strtoul(__str, &__endptr, 0);
  if (__endptr == __str) {
    goto LABEL_4;
  }
  unint64_t v12 = result;
  int v13 = *__endptr;
  if (*__endptr)
  {
    if (__endptr[1])
    {
LABEL_4:
      long long v16 = newfs_ctx;
      uint64_t v17 = qword_100110C50;
      goto LABEL_5;
    }
    char v15 = v13 - 71;
    if ((v13 - 71) > 0x26) {
      goto LABEL_24;
    }
    if (((1 << v15) & 0x100000001) != 0)
    {
      result <<= 30;
      goto LABEL_16;
    }
    if (((1 << v15) & 0x1000000010) != 0)
    {
      result <<= 10;
      goto LABEL_16;
    }
    if (((1 << v15) & 0x4000000040) != 0)
    {
      result <<= 20;
    }
    else
    {
LABEL_24:
      if (*__endptr)
      {
        long long v16 = newfs_ctx;
        uint64_t v17 = qword_100110C50;
LABEL_5:
        newfs_print((uint64_t)&v16, 16, (uint64_t)"Invalid argument for option -%c: %s", v7, v8, v9, v10, v11, a1);
        if (a3)
        {
          int v14 = 22;
LABEL_20:
          *a3 = v14;
          return 0xFFFFFFFFLL;
        }
        return 0xFFFFFFFFLL;
      }
    }
  }
LABEL_16:
  if (result < v12 || HIDWORD(result))
  {
    long long v16 = newfs_ctx;
    uint64_t v17 = qword_100110C50;
    newfs_print((uint64_t)&v16, 16, (uint64_t)"Numeric overflow for option -%c: %s", v7, v8, v9, v10, v11, a1);
    if (a3)
    {
      int v14 = 84;
      goto LABEL_20;
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

unint64_t get_uint64(uint64_t a1, char *__str, int *a3)
{
  __endptr = 0;
  unint64_t result = strtoull(__str, &__endptr, 0);
  if (__endptr == __str) {
    goto LABEL_4;
  }
  int v12 = *__endptr;
  if (!*__endptr) {
    return result;
  }
  if (__endptr[1])
  {
LABEL_4:
    long long v17 = newfs_ctx;
    uint64_t v18 = qword_100110C50;
LABEL_5:
    newfs_print((uint64_t)&v17, 16, (uint64_t)"Invalid argument for option -%c: %s", v7, v8, v9, v10, v11, a1);
    if (!a3) {
      return -1;
    }
    int v13 = 22;
  }
  else
  {
    char v14 = 50;
    if (v12 <= 102)
    {
      switch(*__endptr)
      {
        case 'K':
          goto LABEL_13;
        case 'L':
        case 'N':
        case 'O':
        case 'Q':
        case 'R':
        case 'S':
          goto LABEL_16;
        case 'M':
          goto LABEL_17;
        case 'P':
          goto LABEL_21;
        case 'T':
          goto LABEL_18;
        default:
          if (!*__endptr) {
            return result;
          }
          if (v12 != 71) {
            goto LABEL_16;
          }
          goto LABEL_20;
      }
    }
    switch(*__endptr)
    {
      case 'k':
LABEL_13:
        char v14 = 10;
        goto LABEL_21;
      case 'l':
      case 'n':
      case 'o':
      case 'q':
      case 'r':
      case 's':
        goto LABEL_16;
      case 'm':
LABEL_17:
        char v14 = 20;
        goto LABEL_21;
      case 'p':
        goto LABEL_21;
      case 't':
LABEL_18:
        char v14 = 40;
        goto LABEL_21;
      default:
        if (v12 != 103)
        {
LABEL_16:
          long long v17 = newfs_ctx;
          uint64_t v18 = qword_100110C50;
          goto LABEL_5;
        }
LABEL_20:
        char v14 = 30;
LABEL_21:
        unint64_t v15 = result << v14;
        BOOL v16 = v15 >= result;
        unint64_t result = v15;
        if (v16) {
          return result;
        }
        long long v17 = newfs_ctx;
        uint64_t v18 = qword_100110C50;
        newfs_print((uint64_t)&v17, 16, (uint64_t)"Numeric overflow for option -%c: %s", v7, v8, v9, v10, v11, a1);
        if (!a3) {
          return -1;
        }
        int v13 = 84;
        break;
    }
  }
  *a3 = v13;
  return -1;
}

uint64_t wipefs(uint64_t a1, uint64_t a2)
{
  uint64_t v28 = 0;
  uint64_t v3 = wipefs_alloc();
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(unsigned int *)(a2 + 8);
    strerror(v3);
    long long v26 = newfs_ctx;
    uint64_t v27 = qword_100110C50;
    newfs_print((uint64_t)&v26, 16, (uint64_t)"wipefs_alloc(): fd(%d) %s", v6, v7, v8, v9, v10, v5);
  }
  else
  {
    uint64_t v11 = wipefs_except_blocks();
    if (v11)
    {
      uint64_t v4 = v11;
      uint64_t v12 = *(unsigned int *)(a2 + 8);
      strerror(v11);
      long long v26 = newfs_ctx;
      uint64_t v27 = qword_100110C50;
      newfs_print((uint64_t)&v26, 16, (uint64_t)"wipefs_except_blocks(): fd(%d) %s", v13, v14, v15, v16, v17, v12);
    }
    else
    {
      uint64_t v18 = wipefs_wipe();
      uint64_t v4 = v18;
      if (v18)
      {
        uint64_t v19 = *(unsigned int *)(a2 + 8);
        strerror(v18);
        long long v26 = newfs_ctx;
        uint64_t v27 = qword_100110C50;
        newfs_print((uint64_t)&v26, 16, (uint64_t)"wipefs_wipe(): fd(%d) %s", v20, v21, v22, v23, v24, v19);
      }
    }
    wipefs_free();
  }
  return v4;
}

BOOL verify_volume_name(unsigned __int8 *a1)
{
  memset(v8, 0, sizeof(v8));
  int v2 = CONV_UTF8ToUnistr255(a1, 766, v8);
  BOOL result = 0;
  if (!v2 && LOWORD(v8[0]) <= 0xBu)
  {
    uint64_t v4 = 0;
    do
    {
      unsigned int v5 = a1[v4];
      if (v4) {
        unsigned int v6 = 32;
      }
      else {
        unsigned int v6 = 33;
      }
      if (v6 > v5) {
        break;
      }
      BOOL v7 = memchr("\"*/:<>?\\|", a1[v4], 0xAuLL) || v4 == 22;
      ++v4;
    }
    while (!v7);
    return v5 == 0;
  }
  return result;
}

uint64_t uuid_create_md5_from_name(unsigned __int8 *a1, const void *a2, const void *a3, CC_LONG a4)
{
  memset(&v9, 0, sizeof(v9));
  CC_MD5_Init(&v9);
  CC_MD5_Update(&v9, a2, 0x10u);
  CC_MD5_Update(&v9, a3, a4);
  uint64_t result = CC_MD5_Final(a1, &v9);
  a1[6] = a1[6] & 0xF | 0x30;
  a1[8] = a1[8] & 0x3F | 0x80;
  return result;
}

uint64_t fsckMsgsPrintFormat(uint64_t a1, int a2, uint64_t a3)
{
  id v6 = *(id *)a1;
  id v7 = *(id *)(a1 + 8);
  if (fsck_get_quick()) {
    goto LABEL_31;
  }
  uint64_t v8 = &unk_100021E18;
  do
  {
    int v10 = v8[10];
    v8 += 10;
    int v9 = v10;
  }
  while (v10 != a2 && v9 != 0);
  if (v9 != a2) {
    uint64_t v8 = &fsck_messages_exfat;
  }
  uint64_t v12 = v8 - 4;
  do
  {
    int v13 = v12[4];
    v12 += 10;
  }
  while (v13 != a2 && v13 != 0);
  if (v13 != a2) {
    goto LABEL_29;
  }
  if (*(_DWORD *)(a1 + 16) != 2 || *v12 < 1)
  {
    fsckMsgsPrintRaw(a1, *((void *)v12 - 2), a3);
LABEL_31:
    uint64_t v28 = 0;
    goto LABEL_32;
  }
  uint64_t v15 = convertfmt(*((char **)v12 - 2));
  if (!v15)
  {
LABEL_29:
    uint64_t v28 = 22;
    goto LABEL_32;
  }
  uint64_t v16 = v15;
  uint64_t v17 = [*(id *)a1 locale];
  long long v32 = (unsigned int *)a3;
  id v18 = objc_alloc_init((Class)NSMutableArray);
  if (*v12 >= 1)
  {
    uint64_t v19 = 0;
    do
    {
      switch(*(_DWORD *)(*((void *)v12 + 1) + 4 * v19))
      {
        case 1:
          uint64_t v24 = v32;
          v32 += 2;
          id v22 = +[NSNumber numberWithInt:*v24];
          break;
        case 2:
          int v25 = v32;
          v32 += 2;
          id v22 = +[NSNumber numberWithLong:*(void *)v25];
          break;
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 9:
          id v20 = objc_alloc((Class)NSString);
          uint64_t v21 = v32;
          v32 += 2;
          id v22 = objc_msgSend(v20, "initWithFormat:locale:", @"%s", v17, *(void *)v21);
          break;
        default:
          id v26 = objc_alloc((Class)NSString);
          uint64_t v27 = v32;
          v32 += 2;
          id v22 = objc_msgSend(v26, "initWithFormat:locale:", @"%p", v17, *(void *)v27);
          break;
      }
      uint64_t v23 = v22;
      [v18 addObject:v22];

      ++v19;
    }
    while (v19 < *v12);
  }
  if ([v18 count]) {
    id v30 = v18;
  }
  else {
    id v30 = 0;
  }

  if (v30)
  {
    unsigned int v31 = +[NSString stringWithUTF8String:v16];
    [v6 logLocalizedMessage:v31 table:@"fsck_appex" bundle:v7 array:v30];

    uint64_t v28 = 0;
  }
  else
  {
    uint64_t v28 = 22;
  }
  free(v16);

LABEL_32:
  return v28;
}

void fsckMsgsPrintRaw(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v11 = *(id *)a1;
  id v6 = *(id *)(a1 + 8);
  int v7 = *(_DWORD *)(a1 + 16);
  if (v7 == 2)
  {
    int v9 = +[NSString stringWithUTF8String:a2];
    [v11 logLocalizedMessage:v9 table:@"fsck_appex" bundle:v6 arguments:a3];
  }
  else
  {
    if (v7 != 1) {
      goto LABEL_6;
    }
    id v8 = objc_alloc((Class)NSString);
    int v9 = +[NSString stringWithUTF8String:a2];
    id v10 = [v8 initWithFormat:v9 arguments:a3];
    [v11 logMessage:v10];
  }
LABEL_6:
}

uint64_t fsckMsgsAskPrompt(id *a1, uint64_t a2, uint64_t a3)
{
  id v5 = *a1;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v17 = 0;
    id v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    id v6 = dispatch_group_create();
    dispatch_group_enter(v6);
    id v7 = v5;
    id v8 = objc_alloc((Class)NSString);
    int v9 = +[NSString stringWithUTF8String:a2];
    id v10 = [v8 initWithFormat:v9 arguments:a3];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000DF98;
    v14[3] = &unk_10001C5C0;
    uint64_t v16 = &v17;
    id v11 = v6;
    uint64_t v15 = v11;
    [v7 promptTrueFalse:v10 replyHandler:v14];

    dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v12 = *((unsigned __int8 *)v18 + 24);

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    uint64_t v12 = 1;
  }

  return v12;
}

void sub_10000DF80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000DF98(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void fsckMsgsPrintRawError(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  fsckMsgsPrintRaw(a1, a3, a4);
  id v5 = +[NSString stringWithFormat:@"fsck error %d", a2];
  id v6 = +[NSException exceptionWithName:NSGenericException reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

uint64_t sub_10000EAE8(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = bswap32(*(_DWORD *)result);
  *(_WORD *)(a2 + 4) = bswap32(*(unsigned __int16 *)(result + 4)) >> 16;
  *(_WORD *)(a2 + 6) = bswap32(*(unsigned __int16 *)(result + 6)) >> 16;
  *(void *)(a2 + 8) = *(void *)(result + 8);
  return result;
}

void sub_10000EF18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000EF50(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000EF60(uint64_t a1)
{
}

void sub_10000EF68(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void startCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9 = a5;
  id v10 = [objc_alloc((Class)NSString) initWithUTF8String:a1];
  id v11 = [v9 startPhase:v10 parentUnitCount:a2 phaseTotalCount:a3 completedCounter:a4];

  if (v11)
  {
    uint64_t v12 = fskit_std_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100011AB4(v11);
    }
  }
}

void endCallback(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)NSString) initWithUTF8String:a1];
  [v3 endPhase:v4];
}

void sub_10001049C(id *a1, int a2, uint64_t a3, uint64_t a4)
{
  if (!a1)
  {
    uint64_t v13 = fskit_std_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100011BC4(v13, v14, v15, v16, v17, v18, v19, v20);
    }
    goto LABEL_15;
  }
  if (!*a1)
  {
    uint64_t v13 = fskit_std_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100011C3C(v13, v21, v22, v23, v24, v25, v26, v27);
    }
LABEL_15:

    return;
  }
  id v7 = *a1;
  id v8 = objc_alloc((Class)NSString);
  id v9 = +[NSString stringWithUTF8String:a3];
  id v28 = [v8 initWithFormat:v9 arguments:a4];

  CFStringRef v10 = @"[UNKNOWN] ";
  if (a2 == 16) {
    CFStringRef v10 = @"[ERROR] ";
  }
  if (a2 == 1) {
    id v11 = @"[INFO] ";
  }
  else {
    id v11 = (__CFString *)v10;
  }
  uint64_t v12 = [(__CFString *)v11 stringByAppendingString:v28];
  [v7 logMessage:v12];
}

uint64_t sub_1000105F4(uint64_t a1, _DWORD *a2)
{
  id v4 = +[NSMutableIndexSet indexSet];
  id v5 = +[NSMutableIndexSet indexSet];
  if (a1)
  {
    id v6 = *(void **)(a1 + 16);
    if (v6)
    {
      id v7 = v6;
      id v8 = *(id *)(a1 + 8);
      id v9 = v8;
      if (v8 && [v8 kind] == (id)1)
      {
        CFStringRef v10 = +[FSBlockDeviceResource dynamicCast:v9];
        if ([v10 fileDescriptor] == a2[2])
        {
          if (a2[9]) {
            [v4 addIndexesInRange:a2[8]];
          }
          if (a2[7]) {
            [v5 addIndexesInRange:a2[6]];
          }
          uint64_t v46 = 0;
          long long v47 = &v46;
          uint64_t v48 = 0x3032000000;
          int v49 = sub_10000EF50;
          uint64_t v50 = sub_10000EF60;
          id v51 = 0;
          id v11 = dispatch_group_create();
          dispatch_group_enter(v11);
          BOOL v40 = _NSConcreteStackBlock;
          uint64_t v41 = 3221225472;
          uint64_t v42 = sub_100010A40;
          uint64_t v43 = &unk_10001C670;
          char v45 = &v46;
          uint64_t v12 = v11;
          uint64_t v44 = v12;
          [v7 wipeResource:v9 includingRanges:v4 excludingRanges:v5 replyHandler:&v40];
          uint64_t v13 = fskit_std_log();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
            sub_100011E88(v13);
          }

          dispatch_group_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
          if (v47[5])
          {
            uint64_t v14 = fskit_std_log();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend((id)v47[5], "description", v40, v41, v42, v43);
              id v15 = objc_claimAutoreleasedReturnValue();
              sub_100011E1C((uint64_t)[v15 UTF8String], buf, v14, v15);
            }

            uint64_t v16 = (uint64_t)[(id)v47[5] code];
          }
          else
          {
            uint64_t v16 = 0;
          }

          _Block_object_dispose(&v46, 8);
          goto LABEL_27;
        }
        uint64_t v38 = fskit_std_log();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
          sub_100011F0C(v10);
        }
      }
      else
      {
        CFStringRef v10 = fskit_std_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_100011DA4(v10, v24, v25, v26, v27, v28, v29, v30);
        }
      }
      uint64_t v16 = 22;
LABEL_27:

      goto LABEL_28;
    }
    id v7 = fskit_std_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100011D2C(v7, v31, v32, v33, v34, v35, v36, v37);
    }
  }
  else
  {
    id v7 = fskit_std_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100011CB4(v7, v17, v18, v19, v20, v21, v22, v23);
    }
  }
  uint64_t v16 = 22;
LABEL_28:

  return v16;
}

void sub_10001093C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100010A40(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v6 = fskit_std_log();
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100012038(a1 + 40, v7);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    sub_100011FB4(v7);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100010AF4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100010B24(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_100010B64()
{
}

void sub_100010B80()
{
  __assert_rtn("fsck_exfat_cache_evict", "fsck_exfat_cache.c", 221, "buf != NULL");
}

void sub_100010BAC()
{
  __assert_rtn("fsck_exfat_cache_evict", "fsck_exfat_cache.c", 222, "buf->data != NULL");
}

void sub_100010BD8()
{
  __assert_rtn("fsck_exfat_cache_evict", "fsck_exfat_cache.c", 223, "buf->offset != 0");
}

void sub_100010C04()
{
  __assert_rtn("fsck_exfat_cache_evict", "fsck_exfat_cache.c", 224, "buf->length != 0");
}

void sub_100010C30()
{
  __assert_rtn("fsck_exfat_cache_evict", "fsck_exfat_cache.c", 225, "buf->use_count == 0");
}

void sub_100010C5C()
{
  __assert_rtn("fsck_exfat_cache_recycle", "fsck_exfat_cache.c", 357, "result->use_count == 0");
}

void sub_100010C88()
{
  __assert_rtn("fsck_exfat_cache_recycle", "fsck_exfat_cache.c", 356, "result->length == 0");
}

void sub_100010CB4()
{
  __assert_rtn("fsck_exfat_cache_recycle", "fsck_exfat_cache.c", 355, "result->offset == 0");
}

void sub_100010CE0()
{
  __assert_rtn("fsck_exfat_cache_recycle", "fsck_exfat_cache.c", 354, "result->data == NULL");
}

void sub_100010D0C()
{
  __assert_rtn("fsck_exfat_cache_recycle_used", "fsck_exfat_cache.c", 288, "buf->data != NULL");
}

void sub_100010D38()
{
  __assert_rtn("fsck_exfat_cache_recycle_used", "fsck_exfat_cache.c", 289, "buf->offset != 0");
}

void sub_100010D64()
{
  __assert_rtn("fsck_exfat_cache_recycle_used", "fsck_exfat_cache.c", 290, "buf->length != 0");
}

void sub_100010D90()
{
  __assert_rtn("fsck_exfat_cache_recycle_used", "fsck_exfat_cache.c", 263, "buf->data != NULL");
}

void sub_100010DBC()
{
  __assert_rtn("fsck_exfat_cache_recycle_used", "fsck_exfat_cache.c", 264, "buf->offset != 0");
}

void sub_100010DE8()
{
  __assert_rtn("fsck_exfat_cache_recycle_used", "fsck_exfat_cache.c", 265, "buf->length != 0");
}

void sub_100010E14()
{
  __assert_rtn("fsck_exfat_cache_find", "fsck_exfat_cache.c", 404, "buf->data != NULL");
}

void sub_100010E40()
{
  __assert_rtn("fsck_exfat_cache_find", "fsck_exfat_cache.c", 403, "buf->length == length");
}

void sub_100010E6C()
{
  __assert_rtn("fsck_exfat_cache_mark_dirty", "fsck_exfat_cache.c", 499, "buf->use_count != 0");
}

void sub_100010E98()
{
  __assert_rtn("fsck_exfat_cache_release", "fsck_exfat_cache.c", 511, "buf->use_count != 0");
}

void sub_100010EC4()
{
  __assert_rtn("fsck_exfat_cache_get_cluster", "fsck_exfat_cache.c", 577, "cluster >= CLUST_FIRST && cluster <= g.maxCluster");
}

void sub_100010EF0()
{
  __assert_rtn("fsck_exfat_bitmap_init", "fsck_exfat_bitmap.c", 29, "g.bitmap == NULL");
}

void sub_100010F1C()
{
  __assert_rtn("fsck_exfat_bitmap_allocate", "fsck_exfat_bitmap.c", 68, "(start >= CLUST_FIRST) && (start <= g.maxCluster) && ((start + count) <= (g.maxCluster + 1)) && ((start + count) >= start)");
}

void sub_100010F48()
{
  __assert_rtn("fsck_exfat_bitmap_free", "fsck_exfat_bitmap.c", 181, "(start >= CLUST_FIRST) && (start <= g.maxCluster) && ((start + count) <= (g.maxCluster + 1)) && ((start + count) >= start)");
}

void sub_100010F74()
{
  __assert_rtn("fsck_exfat_fat_get", "fsck_exfat_fat.c", 33, "cluster >= CLUST_FIRST && cluster <= g.maxCluster");
}

void sub_100010FA0()
{
  __assert_rtn("fsck_exfat_fat_set", "fsck_exfat_fat.c", 69, "cluster >= CLUST_FIRST && cluster <= g.maxCluster");
}

void sub_100010FCC()
{
  __assert_rtn("fsck_exfat_fat_alloc_chain", "fsck_exfat_fat.c", 119, "cluster >= CLUST_FIRST && cluster <= g.maxCluster");
}

void sub_100010FF8()
{
}

void sub_100011024()
{
  __assert_rtn("fsck_exfat_iter_dir_entries", "lib_fsck_exfat.c", 649, "cluster >= CLUST_FIRST && cluster <= g.maxCluster");
}

void sub_100011050()
{
  __assert_rtn("fsck_exfat_iter_dir_entries", "lib_fsck_exfat.c", 618, "(firstOffset % sizeof(union exfat_direntry)) == 0");
}

void sub_10001107C()
{
  __assert_rtn("fsck_exfat_read_dir_entry", "lib_fsck_exfat.c", 881, "cluster >= CLUST_FIRST && cluster <= g.maxCluster");
}

void sub_1000110A8()
{
  __assert_rtn("fsck_exfat_read_dir_entry", "lib_fsck_exfat.c", 845, "(entryOffset % sizeof(union exfat_direntry)) == 0");
}

void sub_1000110D4()
{
  __assert_rtn("fsck_exfat_check_allocation", "lib_fsck_exfat.c", 915, "path != NULL");
}

void sub_100011100()
{
  __assert_rtn("fsck_exfat_check_allocation", "lib_fsck_exfat.c", 1164, "(skipStreamRepair && makeStreamRepair) == false");
}

void sub_10001112C()
{
  __assert_rtn("fsck_exfat_check_allocation", "lib_fsck_exfat.c", 1000, "stream->firstCluster >= CLUST_FIRST && stream->firstCluster <= g.maxCluster");
}

void sub_100011158()
{
  __assert_rtn("fsck_exfat_scan_root", "lib_fsck_exfat.c", 1535, "error == 0");
}

void sub_100011184()
{
  __assert_rtn("fsck_exfat_dir_ref", "lib_fsck_exfat.c", 1565, "dir->refs != 0");
}

void sub_1000111B0()
{
}

void sub_1000111DC()
{
}

void sub_100011208()
{
  __assert_rtn("fsck_exfat_recurse", "lib_fsck_exfat.c", 2248, "(entry->type & EXFAT_DIR_SECONDARY_MASK) != 0");
}

void sub_100011234()
{
}

void sub_100011274()
{
  v3[0] = 136315650;
  sub_100010B50();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%s: Expected to read %lu bytes, read %lu", (uint8_t *)v3, 0x20u);
}

void sub_100011300(void *a1)
{
  [a1 code];
  sub_100010B50();
  sub_100010B40();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0x16u);
}

void sub_10001138C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100011404()
{
  sub_100010B10();
  sub_100010B24((void *)&_mh_execute_header, v0, v1, "%s: Invalid bytes per sector shift: %d\n", v2, v3, v4, v5, 2u);
}

void sub_10001147C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000114F4()
{
  sub_100010B10();
  sub_100010B24((void *)&_mh_execute_header, v0, v1, "%s: Invalid sectors per cluster shift: %d", v2, v3, v4, v5, 2u);
}

void sub_10001156C()
{
  sub_100010B10();
  sub_100010B24((void *)&_mh_execute_header, v0, v1, "%s: Invalid number of FATs: %d", v2, v3, v4, v5, 2u);
}

void sub_1000115E4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001165C(int a1, int a2, os_log_t log)
{
  int v3 = 136315650;
  uint64_t v4 = "-[exfatFileSystem getVolumeNameAndUUID:reply:]";
  __int16 v5 = 1024;
  int v6 = a1;
  __int16 v7 = 1024;
  int v8 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Invalid root cluster %u, not in range 2..%u", (uint8_t *)&v3, 0x18u);
}

void sub_1000116F4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001176C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000117E4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001185C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000118D4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001194C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000119C4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100011A3C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100011AB4(void *a1)
{
  id v1 = [a1 description];
  [v1 UTF8String];
  sub_100010B40();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0xCu);
}

void sub_100011B4C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100011BC4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100011C3C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100011CB4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100011D2C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100011DA4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100011E1C(uint64_t a1, uint8_t *buf, os_log_t log, void *a4)
{
  *(_DWORD *)buf = 136315394;
  *(void *)(buf + 4) = "wipeFSCallback";
  *((_WORD *)buf + 6) = 2080;
  *(void *)(buf + 14) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Wipe resource error: %s", buf, 0x16u);
}

void sub_100011E88(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "wipeFSCallback";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s: waiting for reply from send wipe resource request", (uint8_t *)&v1, 0xCu);
}

void sub_100011F0C(void *a1)
{
  [a1 fileDescriptor];
  sub_100010B40();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0x18u);
}

void sub_100011FB4(os_log_t log)
{
  int v1 = 136315138;
  os_log_t v2 = "wipeFSCallback_block_invoke";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s: got reply from send wipe resource request with no errors", (uint8_t *)&v1, 0xCu);
}

void sub_100012038(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)a1 + 8) + 40);
  int v3 = 136315394;
  os_log_type_t v4 = "wipeFSCallback_block_invoke";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: got reply from send wipe resource request with err: %@", (uint8_t *)&v3, 0x16u);
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return _CC_MD5_Final(md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return _CC_MD5_Init(c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return _CC_MD5_Update(c, data, len);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return _CFSetContainsValue(theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return _CFSetCreateMutable(allocator, capacity, callBacks);
}

void CFSetRemoveAllValues(CFMutableSetRef theSet)
{
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
}

void CFStringAppendCharacters(CFMutableStringRef theString, const UniChar *chars, CFIndex numChars)
{
}

CFStringRef CFStringCreateByCombiningStrings(CFAllocatorRef alloc, CFArrayRef theArray, CFStringRef separatorString)
{
  return _CFStringCreateByCombiningStrings(alloc, theArray, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return _CFStringCreateCopy(alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return _CFStringCreateMutable(alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return _CFStringCreateMutableCopy(alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return _CFStringCreateWithBytes(alloc, bytes, numBytes, encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return _CFStringCreateWithCharacters(alloc, chars, numChars);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return _CFStringCreateWithSubstring(alloc, str, range);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return _CFStringGetBytes(theString, range, encoding, lossByte, isExternalRepresentation, buffer, maxBufLen, usedBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return _CFStringGetCharacterAtIndex(theString, idx);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

void CFStringNormalize(CFMutableStringRef theString, CFStringNormalizationForm theForm)
{
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return _IOBSDNameMatching(mainPort, options, bsdName);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntrySearchCFProperty(entry, plane, key, allocator, options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void NSLog(NSString *format, ...)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return ___error();
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

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return _clock_gettime(__clock_id, __tp);
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

void errx(int a1, const char *a2, ...)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

uint64_t fs_errorForPOSIXError()
{
  return _fs_errorForPOSIXError();
}

uint64_t fskit_std_log()
{
  return _fskit_std_log();
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return _ftruncate(a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return _lseek(a1, a2, a3);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_realloc(ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
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

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return _pread(__fd, __buf, __nbyte, a4);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return _pwrite(__fd, __buf, __nbyte, a4);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

int sprintf(char *a1, const char *a2, ...)
{
  return _sprintf(a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return _strchr(__s, __c);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return _strlcpy(__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return _strtoul(__str, __endptr, __base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return _strtoull(__str, __endptr, __base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

void warn(const char *a1, ...)
{
}

void warnx(const char *a1, ...)
{
}

uint64_t wipefs_alloc()
{
  return _wipefs_alloc();
}

uint64_t wipefs_except_blocks()
{
  return _wipefs_except_blocks();
}

uint64_t wipefs_free()
{
  return _wipefs_free();
}

uint64_t wipefs_wipe()
{
  return _wipefs_wipe();
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_blockCount(void *a1, const char *a2, ...)
{
  return [a1 blockCount];
}

id objc_msgSend_blockSize(void *a1, const char *a2, ...)
{
  return [a1 blockSize];
}

id objc_msgSend_bsdName(void *a1, const char *a2, ...)
{
  return [a1 bsdName];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_completedUnitCount(void *a1, const char *a2, ...)
{
  return [a1 completedUnitCount];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_fileDescriptor(void *a1, const char *a2, ...)
{
  return [a1 fileDescriptor];
}

id objc_msgSend_indexSet(void *a1, const char *a2, ...)
{
  return [a1 indexSet];
}

id objc_msgSend_kind(void *a1, const char *a2, ...)
{
  return [a1 kind];
}

id objc_msgSend_locale(void *a1, const char *a2, ...)
{
  return [a1 locale];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_option(void *a1, const char *a2, ...)
{
  return [a1 option];
}

id objc_msgSend_optionValue(void *a1, const char *a2, ...)
{
  return [a1 optionValue];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_partitionBase(void *a1, const char *a2, ...)
{
  return [a1 partitionBase];
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return [a1 reason];
}

id objc_msgSend_totalUnitCount(void *a1, const char *a2, ...)
{
  return [a1 totalUnitCount];
}

id objc_msgSend_wipeResource_includingRanges_excludingRanges_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wipeResource:includingRanges:excludingRanges:replyHandler:");
}