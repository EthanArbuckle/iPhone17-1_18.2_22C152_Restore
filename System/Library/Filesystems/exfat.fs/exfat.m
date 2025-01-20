uint64_t sub_100003054(unsigned __int8 *a1, uint64_t a2, _WORD *a3)
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
  v9 = (char *)&unk_100006D30;
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
              v27 = byte_100006940[(v12 - 32)];
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
      v14 = byte_100010000[v12 >> 3];
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
      v25 = byte_100006930[v12 >> 4];
      v26 = byte_100006930[v12 & 0xF];
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
    if (!sub_1000035C4((unsigned __int16)v16)) {
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
    v39 = (char *)&unk_100006ED8 + 4 * (unsigned __int16)v38;
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
    if (sub_1000035C4(v29))
    {
      v7 = v46 + 1;
      v9 = v28;
    }
    else
    {
      v9 = v28;
      if (v46 >= 2)
      {
        sub_100003624(&v10[-v46], v46);
        v9 = v28;
      }
      v7 = 0;
    }
    *v10++ = v29;
  }
  while (v5);
LABEL_88:
  if (v7 >= 2) {
    sub_100003624(&v10[-v7], v7);
  }
  result = 0;
LABEL_92:
  *a3 = (v10 - v4) >> 1;
  return result;
}

uint64_t sub_1000035C4(unsigned int a1)
{
  if (a1 < 0x300) {
    return 0;
  }
  int v1 = byte_1000069B0[(unint64_t)a1 >> 8];
  if (!byte_1000069B0[(unint64_t)a1 >> 8]) {
    return 0;
  }
  if (v1 == 255) {
    return 1;
  }
  return (byte_1000069B0[(a1 >> 3) + 256 + 32 * v1 - 32] >> (a1 & 7)) & 1;
}

_WORD *sub_100003624(_WORD *result, unsigned int a2)
{
  do
  {
    if (byte_100007D2C[(unint64_t)(unsigned __int16)*result >> 8]) {
      unsigned int v2 = byte_100007D2C[256 * (unint64_t)byte_100007D2C[(unint64_t)(unsigned __int16)*result >> 8]
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
      uint64_t v6 = byte_100007D2C[v5 >> 8];
      if (byte_100007D2C[v5 >> 8]) {
        LODWORD(v6) = byte_100007D2C[256 * v6 + *v4];
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

uint64_t sub_1000036B4(_WORD *a1, unsigned char *a2, uint64_t a3)
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
                int v13 = byte_10000922C[v10 >> 8];
                if (byte_10000922C[v10 >> 8])
                {
                  if (v13 == 255
                    || ((byte_10000922C[(v10 >> 3) + 256 + 32 * v13 - 32] >> (v10 & 7)) & 1) != 0)
                  {
                    unsigned __int16 v14 = v10 + 21504;
                    if ((unsigned __int16)(v10 + 21504) > 0x2BA4u)
                    {
                      int v16 = sub_100003BB8(v10, &v24);
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
      *v3++ = byte_10000B354[v17 & 0x3F];
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

_WORD *sub_100003A28(_WORD *result, uint64_t a2)
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

uint64_t sub_100003A60(char *a1, unsigned char *a2, uint64_t a3)
{
  uint64_t result = 22;
  if (a1 && a2)
  {
    unsigned int v7 = malloc_type_malloc(0x200uLL, 0x10000407EBBDD04uLL);
    if (v7)
    {
      unint64_t v8 = v7;
      size_t v9 = strlen(a1);
      sub_100003054((unsigned __int8 *)a1, v9, v8);
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
      sub_1000036B4(v8, a2, 766);
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

uint64_t sub_100003B2C(timespec *__tp)
{
  return clock_gettime(_CLOCK_REALTIME, __tp);
}

char *sub_100003B38(char *result, char *__s)
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

uint64_t sub_100003BB8(unsigned int a1, _WORD *a2)
{
  uint64_t v2 = a2;
  if ((unsigned __int16)(a1 + 1201) < 0x571u)
  {
LABEL_8:
    unsigned int v8 = 0;
    goto LABEL_9;
  }
  unint64_t v3 = (unsigned __int16 *)&unk_10000956C;
  size_t v4 = (unsigned __int16 *)&unk_10000A490;
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
  uint64_t v10 = (char *)&unk_10000A494 + 2 * (v8 & 0xFFF);
  unint64_t v11 = (unsigned __int16 *)&v15;
  if (v9 != 1) {
    unint64_t v11 = (unsigned __int16 *)((char *)&unk_10000A494 + 2 * (v8 & 0xFFF));
  }
  if ((v8 & 0x8000) == 0)
  {
    LODWORD(result) = 0;
    goto LABEL_17;
  }
  uint64_t result = sub_100003BB8(*v11, a2);
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

uint64_t sub_100003CB0(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)&xmmword_100011888 = result;
  *((void *)&xmmword_100011888 + 1) = a2;
  qword_100011898 = a3;
  return result;
}

uint64_t sub_100003CC4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (*(void *)result) {
    return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t *))result)(*(void *)(result + 16), a2, a3, &a9);
  }
  return result;
}

void sub_100003D00()
{
  dword_1000118A0 = -1;
  dword_1000118B0 = 0;
  qword_1000118A8 = 0;
  qword_1000118C0 = 0;
  qword_1000118C8 = 0;
  qword_1000118B8 = -1;
}

uint64_t sub_100003D28(uint64_t result)
{
  dword_1000118A0 = result;
  return result;
}

uint64_t sub_100003D34(uint64_t result)
{
  dword_1000118B0 = result;
  return result;
}

uint64_t sub_100003D40(uint64_t result)
{
  qword_1000118A8 = result;
  return result;
}

uint64_t sub_100003D4C(uint64_t result)
{
  qword_1000118B8 = result;
  return result;
}

uint64_t sub_100003D58(uint64_t result)
{
  qword_1000118C8 = result;
  return result;
}

uint64_t sub_100003D64(uint64_t result)
{
  qword_1000118C0 = result;
  return result;
}

uint64_t sub_100003D70()
{
  return dword_1000118A0;
}

uint64_t sub_100003D7C()
{
  return qword_1000118A8;
}

uint64_t sub_100003D88()
{
  return dword_1000118B0;
}

uint64_t sub_100003D94()
{
  return qword_1000118B8;
}

uint64_t sub_100003DA0()
{
  return qword_1000118C8;
}

uint64_t sub_100003DAC()
{
  return qword_1000118C0;
}

uint64_t sub_100003DB8()
{
  return *((void *)&xmmword_100011888 + 1);
}

uint64_t sub_100003DC4(uint64_t result)
{
  *((void *)&xmmword_100011888 + 1) = result;
  return result;
}

uint64_t sub_100003DD0()
{
  return xmmword_100011888;
}

uint64_t sub_100003DDC(uint64_t result)
{
  *(void *)&xmmword_100011888 = result;
  return result;
}

uint64_t sub_100003DE8()
{
  return qword_100011898;
}

uint64_t sub_100003DF4(uint64_t result)
{
  qword_100011898 = result;
  return result;
}

uint64_t sub_100003E00(uint64_t a1, void *a2)
{
  BOOL v4 = a2 && a2[1] && a2[2] && *a2 != 0;
  uint64_t v5 = sub_100003DA0();
  uint64_t v6 = sub_100003DAC();
  int v147 = 0;
  unsigned int v7 = sub_100003D70();
  if (v4) {
    ((void (*)(const char *, uint64_t, uint64_t, int *, void))a2[1])("Format: Preparing", 10, 2, &v147, *a2);
  }
  uint64_t v13 = sub_100003D88();
  if (!v13)
  {
    long long v148 = xmmword_100011888;
    uint64_t v149 = qword_100011898;
    uint64_t v13 = 512;
    sub_100003CC4((uint64_t)&v148, 16, (uint64_t)"%s: Sector size was not initialized, setting to default value (%d)", v8, v9, v10, v11, v12, v6);
  }
  uint64_t v14 = *(void *)(a1 + 8);
  if (!v14)
  {
    uint64_t v14 = sub_100003D7C();
    *(void *)(a1 + 8) = v14;
    if (v14 == -1)
    {
      long long v148 = xmmword_100011888;
      uint64_t v149 = qword_100011898;
      uint64_t v14 = 0x2000;
      sub_100003CC4((uint64_t)&v148, 16, (uint64_t)"%s: Total sectors was not initialized, setting to default value (%d)", v8, v9, v10, v11, v12, v6);
      *(void *)(a1 + 8) = 0x2000;
    }
  }
  unint64_t v15 = *(unsigned int *)(a1 + 16);
  if (v15)
  {
    *(void *)(a1 + 8) = v14 * (unint64_t)v13 / v15;
    uint64_t v13 = v15;
  }
  else
  {
    *(_DWORD *)(a1 + 16) = v13;
  }
  ++v147;
  if ((12 * v13) > 0x20000)
  {
    long long v148 = xmmword_100011888;
    uint64_t v149 = qword_100011898;
    sub_100003CC4((uint64_t)&v148, 16, (uint64_t)"Sector size (%u) is too large", v8, v9, v10, v11, v12, v13);
LABEL_22:
    int v19 = "Format: Preparing: Failed";
    uint64_t v20 = 22;
    goto LABEL_76;
  }
  uint64_t v16 = *(unsigned int *)(a1 + 80);
  if (v16)
  {
    int v17 = *(_DWORD *)(a1 + 20);
    unsigned int v18 = v16 * v13;
    if (v17 && v17 != v18)
    {
      long long v148 = xmmword_100011888;
      uint64_t v149 = qword_100011898;
      sub_100003CC4((uint64_t)&v148, 16, (uint64_t)"Inconsistent sectors per cluster (%u) and bytes per cluster (%u)", v8, v9, v10, v11, v12, v16);
      goto LABEL_22;
    }
    if (!v17)
    {
      *(_DWORD *)(a1 + 20) = v18;
      if (v18 >= 0x2000001)
      {
        long long v148 = xmmword_100011888;
        uint64_t v149 = qword_100011898;
        sub_100003CC4((uint64_t)&v148, 16, (uint64_t)"Sectors per cluster (%u) too large; max is %u",
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
  qword_1000118D0 = (uint64_t)malloc_type_calloc(1uLL, 0x20000uLL, 0x7A6E79F4uLL);
  if (!qword_1000118D0 || (v26 = malloc_type_malloc(*(unsigned int *)(a1 + 16), 0xE72E6DAAuLL)) == 0)
  {
    long long v148 = xmmword_100011888;
    uint64_t v149 = qword_100011898;
    sub_100003CC4((uint64_t)&v148, 16, (uint64_t)"Failed to allocate temporary buffer", v21, v22, v23, v24, v25, v145);
    int v19 = "Format: Preparing: Failed";
    uint64_t v20 = 12;
    goto LABEL_76;
  }
  v27 = v26;
  if (v4)
  {
    ++v147;
    ((void (*)(const char *, void))a2[2])("Format: Preparing", *a2);
    int v147 = 0;
    int v19 = "Format: Check reformat: Failed";
  }
  else
  {
    int v19 = "Format: Preparing: Failed";
  }
  if (*(unsigned char *)(a1 + 105)) {
    sub_1000049C4(a1, a2);
  }
  sub_100004E64(v6, a1);
  *(_DWORD *)(a1 + 80) = *(_DWORD *)(a1 + 20) / *(_DWORD *)(a1 + 16);
  if (v5)
  {
    long long v148 = xmmword_100011888;
    uint64_t v149 = qword_100011898;
    sub_100003CC4((uint64_t)&v148, 1, (uint64_t)"Volume name      : %s\n", v28, v29, v30, v31, v32, v5);
  }
  uint64_t v33 = *(void *)a1;
  long long v148 = xmmword_100011888;
  uint64_t v149 = qword_100011898;
  sub_100003CC4((uint64_t)&v148, 1, (uint64_t)"Partition offset : %llu sectors (%llu bytes)\n", v28, v29, v30, v31, v32, v33);
  uint64_t v34 = *(void *)(a1 + 8);
  long long v148 = xmmword_100011888;
  uint64_t v149 = qword_100011898;
  sub_100003CC4((uint64_t)&v148, 1, (uint64_t)"Volume size      : %llu sectors (%llu bytes)\n", v35, v36, v37, v38, v39, v34);
  uint64_t v40 = *(unsigned int *)(a1 + 16);
  long long v148 = xmmword_100011888;
  uint64_t v149 = qword_100011898;
  sub_100003CC4((uint64_t)&v148, 1, (uint64_t)"Bytes per sector : %u\n", v41, v42, v43, v44, v45, v40);
  uint64_t v46 = *(unsigned int *)(a1 + 20);
  long long v148 = xmmword_100011888;
  uint64_t v149 = qword_100011898;
  sub_100003CC4((uint64_t)&v148, 1, (uint64_t)"Bytes per cluster: %u\n", v47, v48, v49, v50, v51, v46);
  uint64_t v52 = *(unsigned int *)(a1 + 24);
  long long v148 = xmmword_100011888;
  uint64_t v149 = qword_100011898;
  sub_100003CC4((uint64_t)&v148, 1, (uint64_t)"FAT offset       : %u sectors (%llu bytes)\n", v53, v54, v55, v56, v57, v52);
  uint64_t v58 = *(unsigned int *)(a1 + 28);
  long long v148 = xmmword_100011888;
  uint64_t v149 = qword_100011898;
  sub_100003CC4((uint64_t)&v148, 1, (uint64_t)"# FAT sectors    : %u\n", v59, v60, v61, v62, v63, v58);
  uint64_t v64 = *(unsigned int *)(a1 + 44);
  long long v148 = xmmword_100011888;
  uint64_t v149 = qword_100011898;
  sub_100003CC4((uint64_t)&v148, 1, (uint64_t)"Number of FATs   : %u\n", v65, v66, v67, v68, v69, v64);
  uint64_t v70 = *(unsigned int *)(a1 + 32);
  long long v148 = xmmword_100011888;
  uint64_t v149 = qword_100011898;
  sub_100003CC4((uint64_t)&v148, 1, (uint64_t)"Cluster offset   : %u sectors (%llu bytes)\n", v71, v72, v73, v74, v75, v70);
  uint64_t v76 = *(unsigned int *)(a1 + 36);
  long long v148 = xmmword_100011888;
  uint64_t v149 = qword_100011898;
  sub_100003CC4((uint64_t)&v148, 1, (uint64_t)"# Clusters       : %u\n", v77, v78, v79, v80, v81, v76);
  uint64_t v82 = *(unsigned int *)(a1 + 40);
  long long v148 = xmmword_100011888;
  uint64_t v149 = qword_100011898;
  sub_100003CC4((uint64_t)&v148, 1, (uint64_t)"Volume Serial #  : %08x\n", v83, v84, v85, v86, v87, v82);
  uint64_t v88 = *(unsigned int *)(a1 + 72);
  long long v148 = xmmword_100011888;
  uint64_t v149 = qword_100011898;
  sub_100003CC4((uint64_t)&v148, 1, (uint64_t)"Bitmap start     : %u\n", v89, v90, v91, v92, v93, v88);
  if (*(_DWORD *)(a1 + 44) == 2)
  {
    uint64_t v99 = *(unsigned int *)(a1 + 76);
    long long v148 = xmmword_100011888;
    uint64_t v149 = qword_100011898;
    sub_100003CC4((uint64_t)&v148, 1, (uint64_t)"Bitmap start (#2): %u\n", v94, v95, v96, v97, v98, v99);
  }
  uint64_t v100 = *(unsigned int *)(a1 + 84);
  long long v148 = xmmword_100011888;
  uint64_t v149 = qword_100011898;
  sub_100003CC4((uint64_t)&v148, 1, (uint64_t)"Bitmap file size : %u\n", v94, v95, v96, v97, v98, v100);
  uint64_t v101 = *(unsigned int *)(a1 + 88);
  long long v148 = xmmword_100011888;
  uint64_t v149 = qword_100011898;
  sub_100003CC4((uint64_t)&v148, 1, (uint64_t)"Upcase start     : %u\n", v102, v103, v104, v105, v106, v101);
  uint64_t v107 = *(unsigned int *)(a1 + 92);
  long long v148 = xmmword_100011888;
  uint64_t v149 = qword_100011898;
  sub_100003CC4((uint64_t)&v148, 1, (uint64_t)"Upcase file size : %u\n", v108, v109, v110, v111, v112, v107);
  uint64_t v113 = *(unsigned int *)(a1 + 96);
  long long v148 = xmmword_100011888;
  uint64_t v149 = qword_100011898;
  sub_100003CC4((uint64_t)&v148, 1, (uint64_t)"Root start       : %u\n", v114, v115, v116, v117, v118, v113);
  if (*(unsigned char *)(a1 + 104))
  {
    uint64_t v20 = 0;
    goto LABEL_76;
  }
  if (v4)
  {
    ((void (*)(const char *, uint64_t, uint64_t, int *, void))a2[1])("Format: Wipe", 25, 1, &v147, *a2);
    int v19 = "Format: Wipe: Failed";
  }
  else
  {
    int v19 = "Format: Preparing: Failed";
  }
  if (*((void *)&xmmword_100011888 + 1))
  {
    uint64_t v119 = *(unsigned int *)(a1 + 16);
    int v120 = *(_DWORD *)(a1 + 32) + (*(_DWORD *)(a1 + 96) - 1) * *(_DWORD *)(a1 + 80);
    *(void *)&long long v148 = 0;
    *((void *)&v148 + 1) = v7;
    uint64_t v149 = v119;
    int v150 = 0;
    int v151 = v120;
    uint64_t v152 = 0;
    uint64_t v121 = (*((uint64_t (**)(uint64_t, long long *))&xmmword_100011888 + 1))(qword_100011898, &v148);
    ++v147;
    if (v121)
    {
      uint64_t v20 = v121;
      long long v148 = xmmword_100011888;
      uint64_t v149 = qword_100011898;
      sub_100003CC4((uint64_t)&v148, 16, (uint64_t)"Encountered errors trying to wipe resource", v122, v123, v124, v125, v126, v146);
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
    int v19 = "Format: Prepare boot region: Failed";
  }
  uint64_t v127 = qword_1000118D0;
  if (!*(_DWORD *)(a1 + 100))
  {
    bzero((void *)qword_1000118D0, *(unsigned int *)(a1 + 16));
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
    *(unsigned char *)(qword_1000118D0 + (*(_DWORD *)(a1 + 16) * v135 - 4)) = 0;
    *(unsigned char *)(qword_1000118D0 + (*(_DWORD *)(a1 + 16) * v135 - 3)) = 0;
    *(unsigned char *)(qword_1000118D0 + (*(_DWORD *)(a1 + 16) * v135 - 2)) = 85;
    *(unsigned char *)(qword_1000118D0 + (*(_DWORD *)(a1 + 16) * v135++ - 1)) = -86;
  }
  while (v135 != 10);
  sub_10000508C(qword_1000118D0, *(unsigned int *)(a1 + 16));
  ++v147;
  memmove(v27, (const void *)qword_1000118D0, *(unsigned int *)(a1 + 16));
  bzero((void *)qword_1000118D0, *(unsigned int *)(a1 + 16));
  ++v147;
  sub_100005BA4();
  sub_100005D80((char *)qword_1000118D0, (12 * *(_DWORD *)(a1 + 16)));
  sub_100005D80((char *)qword_1000118D0, (12 * *(_DWORD *)(a1 + 16)));
  sub_100005D70(*(unsigned int *)(a1 + 16) * (unint64_t)*(unsigned int *)(a1 + 24));
  ++v147;
  if (v4)
  {
    ((void (*)(const char *, void))a2[2])("Format: Prepare boot region", *a2);
    int v147 = 0;
    ((void (*)(const char *, uint64_t, uint64_t, int *, void))a2[1])("Format: Write FAT tables", 10, 3, &v147, *a2);
    sub_100005110((_DWORD *)a1, &v147);
    int v19 = 0;
  }
  else
  {
    sub_100005110((_DWORD *)a1, &v147);
    if (!a2)
    {
      sub_100005284((_DWORD *)a1, &v147);
      goto LABEL_70;
    }
  }
  ((void (*)(const char *, void))a2[2])("Format: Write FAT tables", *a2);
  int v147 = 0;
  if (v4)
  {
    ((void (*)(const char *, uint64_t, void, int *, void))a2[1])("Format: Write bitmaps", 10, *(unsigned int *)(a1 + 44), &v147, *a2);
    sub_100005284((_DWORD *)a1, &v147);
    ((void (*)(const char *, void))a2[2])("Format: Write bitmaps", *a2);
    int v147 = 0;
    ((void (*)(const char *, uint64_t, uint64_t, int *, void))a2[1])("Format: Flush data structures", 10, 4, &v147, *a2);
    int v19 = "Format: Flush data structures: Failed";
  }
  else
  {
    sub_100005284((_DWORD *)a1, &v147);
    ((void (*)(const char *, void))a2[2])("Format: Write bitmaps", *a2);
    int v147 = 0;
  }
LABEL_70:
  sub_10000538C(a1);
  ++v147;
  sub_1000053F0(a1);
  ++v147;
  sub_100005C28();
  ++v147;
  ssize_t v136 = pwrite(v7, v27, *(unsigned int *)(a1 + 16), (12 * *(_DWORD *)(a1 + 16)));
  if (v136 == *(_DWORD *)(a1 + 16))
  {
    if (pwrite(v7, v27, v136, 0) == *(_DWORD *)(a1 + 16))
    {
      uint64_t v20 = 0;
      ++v147;
      goto LABEL_76;
    }
    long long v148 = xmmword_100011888;
    uint64_t v149 = qword_100011898;
    v142 = "writing main boot sector";
  }
  else
  {
    long long v148 = xmmword_100011888;
    uint64_t v149 = qword_100011898;
    v142 = "writing backup boot sector";
  }
  sub_100003CC4((uint64_t)&v148, 16, (uint64_t)v142, v137, v138, v139, v140, v141, v146);
  uint64_t v20 = *__error();
LABEL_76:
  if (v4)
  {
    if (v20) {
      v143 = v19;
    }
    else {
      v143 = "Format: Flush data structures";
    }
    ((void (*)(const char *, void))a2[2])(v143, *a2);
  }
  return v20;
}

void sub_1000049C4(uint64_t a1, void *a2)
{
  int v49 = 0;
  int v4 = sub_100003D70();
  if (lseek(v4, 0, 0)
    || (size_t v5 = (12 * *(_DWORD *)(a1 + 16)), v6 = sub_100003D70(),
                                                        read(v6, (void *)qword_1000118D0, v5) != v5))
  {
    int v14 = 0;
    uint64_t v12 = 0;
    goto LABEL_9;
  }
  uint64_t v12 = qword_1000118D0;
  if (*(void *)qword_1000118D0 != 0x54414658459076EBLL || *(void *)(qword_1000118D0 + 3) != 0x2020205441465845)
  {
    int v14 = 0;
LABEL_9:
    unint64_t v15 = "Format: Check reformat: Failed";
    goto LABEL_10;
  }
  if (a2)
  {
    ((void (*)(const char *, uint64_t, void, int *, void))a2[1])("Format: Check reformat", 25, *(unsigned int *)(qword_1000118D0 + 92), &v49, *a2);
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
          int v36 = sub_100003D70();
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
          int v39 = sub_100003D70();
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
  long long v47 = xmmword_100011888;
  uint64_t v48 = qword_100011898;
  sub_100003CC4((uint64_t)&v47, 1, (uint64_t)"Reformatting existing ExFAT volume\n", v7, v8, v9, v10, v11, v41);
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

unint64_t sub_100004E64(unint64_t result, uint64_t a2)
{
  if (!*(_DWORD *)(a2 + 100))
  {
    BOOL v3 = sub_100005518(result);
    int v4 = (char *)&unk_1000117C0;
    if (!v3) {
      int v4 = (char *)&unk_1000116F0;
    }
    size_t v5 = v4 - 8;
    do
    {
      unint64_t v6 = *((void *)v5 + 3) - 1;
      v5 += 16;
    }
    while (v6 < *(void *)(a2 + 8) * (unint64_t)*(unsigned int *)(a2 + 16));
    unint64_t v7 = sub_100003D94();
    if (v7 == -1)
    {
      long long v32 = xmmword_100011888;
      uint64_t v33 = qword_100011898;
      sub_100003CC4((uint64_t)&v32, 16, (uint64_t)"Partition offset was not initialized , setting to default value (%d)", v8, v9, v10, v11, v12, 0);
      unint64_t v7 = 0;
    }
    unint64_t v13 = *(unsigned int *)(a2 + 16);
    *(void *)a2 = v7 / v13;
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

uint64_t sub_10000505C(unsigned int a1)
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

uint64_t sub_10000508C(uint64_t result, uint64_t a2)
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

void sub_100005110(_DWORD *a1, _DWORD *a2)
{
  uint64_t v4 = (void *)qword_1000118D0;
  bzero((void *)qword_1000118D0, 0x20000uLL);
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
        sub_100005D80((char *)qword_1000118D0, v17);
      }
      else
      {
        sub_100005D80((char *)qword_1000118D0, 0x20000uLL);
        sub_100005CA8(v17 - 0x20000);
      }
      ++v16;
    }
    while (v16 < a1[11]);
    unsigned int v15 = a1[4];
  }
  sub_100005D70(v15 * (unint64_t)a1[8]);
  ++*a2;
}

void sub_100005284(_DWORD *a1, _DWORD *a2)
{
  int v4 = a1[24];
  int v5 = v4 - 1;
  unsigned int v6 = (unsigned int *)qword_1000118D0;
  bzero((void *)qword_1000118D0, 0x20000uLL);
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
        sub_100005D80((char *)qword_1000118D0, v13);
      }
      else
      {
        sub_100005D80((char *)qword_1000118D0, 0x20000uLL);
        sub_100005CA8(v13 - 0x20000);
      }
      ++*a2;
      ++v12;
    }
    while (v12 < a1[11]);
  }
}

void sub_10000538C(uint64_t a1)
{
  size_t v2 = *(unsigned int *)(a1 + 92);
  unsigned int v3 = *(_DWORD *)(a1 + 20);
  unsigned int v4 = v2 % v3;
  int v5 = v3 - v2 % v3;
  if (!v4) {
    int v5 = 0;
  }
  uint64_t v6 = (v5 + v2);
  sub_100005D80(&byte_100010020, v2);
  size_t v7 = v6 - *(unsigned int *)(a1 + 92);

  sub_100005CA8(v7);
}

void sub_1000053F0(uint64_t a1)
{
  uint64_t v2 = qword_1000118D0;
  *(_OWORD *)qword_1000118D0 = 0u;
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
    size_t v7 = &byte_100010020;
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
  sub_100005D80((char *)qword_1000118D0, 0x80uLL);
  size_t v10 = *(unsigned int *)(a1 + 20) - 128;

  sub_100005CA8(v10);
}

BOOL sub_100005518(uint64_t a1)
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

unint64_t sub_100005640(uint64_t a1, char *__str, int *a3)
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
      long long v16 = xmmword_100011888;
      uint64_t v17 = qword_100011898;
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
        long long v16 = xmmword_100011888;
        uint64_t v17 = qword_100011898;
LABEL_5:
        sub_100003CC4((uint64_t)&v16, 16, (uint64_t)"Invalid argument for option -%c: %s", v7, v8, v9, v10, v11, a1);
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
    long long v16 = xmmword_100011888;
    uint64_t v17 = qword_100011898;
    sub_100003CC4((uint64_t)&v16, 16, (uint64_t)"Numeric overflow for option -%c: %s", v7, v8, v9, v10, v11, a1);
    if (a3)
    {
      int v14 = 84;
      goto LABEL_20;
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

unint64_t sub_1000057A8(uint64_t a1, char *__str, int *a3)
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
    long long v17 = xmmword_100011888;
    uint64_t v18 = qword_100011898;
LABEL_5:
    sub_100003CC4((uint64_t)&v17, 16, (uint64_t)"Invalid argument for option -%c: %s", v7, v8, v9, v10, v11, a1);
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
          long long v17 = xmmword_100011888;
          uint64_t v18 = qword_100011898;
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
        long long v17 = xmmword_100011888;
        uint64_t v18 = qword_100011898;
        sub_100003CC4((uint64_t)&v17, 16, (uint64_t)"Numeric overflow for option -%c: %s", v7, v8, v9, v10, v11, a1);
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

uint64_t sub_10000599C(uint64_t a1, uint64_t a2)
{
  uint64_t v28 = 0;
  uint64_t v3 = wipefs_alloc();
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(unsigned int *)(a2 + 8);
    strerror(v3);
    long long v26 = xmmword_100011888;
    uint64_t v27 = qword_100011898;
    sub_100003CC4((uint64_t)&v26, 16, (uint64_t)"wipefs_alloc(): fd(%d) %s", v6, v7, v8, v9, v10, v5);
  }
  else
  {
    uint64_t v11 = wipefs_except_blocks();
    if (v11)
    {
      uint64_t v4 = v11;
      uint64_t v12 = *(unsigned int *)(a2 + 8);
      strerror(v11);
      long long v26 = xmmword_100011888;
      uint64_t v27 = qword_100011898;
      sub_100003CC4((uint64_t)&v26, 16, (uint64_t)"wipefs_except_blocks(): fd(%d) %s", v13, v14, v15, v16, v17, v12);
    }
    else
    {
      uint64_t v18 = wipefs_wipe();
      uint64_t v4 = v18;
      if (v18)
      {
        uint64_t v19 = *(unsigned int *)(a2 + 8);
        strerror(v18);
        long long v26 = xmmword_100011888;
        uint64_t v27 = qword_100011898;
        sub_100003CC4((uint64_t)&v26, 16, (uint64_t)"wipefs_wipe(): fd(%d) %s", v20, v21, v22, v23, v24, v19);
      }
    }
    wipefs_free();
  }
  return v4;
}

BOOL sub_100005AB8(unsigned __int8 *a1)
{
  memset(v8, 0, sizeof(v8));
  int v2 = sub_100003054(a1, 766, v8);
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

off_t sub_100005BA4()
{
  qword_1000118D8 = (uint64_t)malloc_type_malloc(0x20000uLL, 0xB777EF11uLL);
  if (!qword_1000118D8)
  {
    *((void *)&v7 + 1) = *((void *)&xmmword_100011888 + 1);
    uint64_t v8 = qword_100011898;
    sub_100003CC4((uint64_t)&v7, 16, (uint64_t)"format buffer", v0, v1, v2, v3, v4, xmmword_100011888);
  }
  qword_1000118E0 = 0;
  qword_1000118E8 = 0;
  int v5 = sub_100003D70();
  return lseek(v5, 0, 0);
}

void sub_100005C28()
{
  if (qword_1000118E0)
  {
    int v0 = sub_100003D70();
    if (write(v0, (const void *)qword_1000118D8, qword_1000118E0) != qword_1000118E0)
    {
      *((void *)&v6 + 1) = *((void *)&xmmword_100011888 + 1);
      uint64_t v7 = qword_100011898;
      sub_100003CC4((uint64_t)&v6, 16, (uint64_t)"flushing format buffer", v1, v2, v3, v4, v5, xmmword_100011888);
    }
    qword_1000118E0 = 0;
  }
}

void sub_100005CA8(size_t a1)
{
  size_t v1 = a1;
  uint64_t v2 = qword_1000118E0;
  if (qword_1000118E0 + a1 >= 0x20000)
  {
    do
    {
      if (v1 >= 0x20000 - v2) {
        size_t v3 = 0x20000 - v2;
      }
      else {
        size_t v3 = v1;
      }
      bzero((void *)(qword_1000118D8 + v2), v3);
      v1 -= v3;
      qword_1000118E0 += v3;
      qword_1000118E8 += v3;
      sub_100005C28();
      uint64_t v2 = qword_1000118E0;
    }
    while ((qword_1000118E0 + v1) >> 17);
  }
  if (v1)
  {
    bzero((void *)(qword_1000118D8 + v2), v1);
    qword_1000118E0 += v1;
    qword_1000118E8 += v1;
  }
}

void sub_100005D70(uint64_t a1)
{
}

void sub_100005D80(char *__src, size_t __n)
{
  size_t v2 = __n;
  uint64_t v4 = qword_1000118E0;
  if (qword_1000118E0 + __n >= 0x20000)
  {
    do
    {
      if (v2 >= 0x20000 - v4) {
        size_t v5 = 0x20000 - v4;
      }
      else {
        size_t v5 = v2;
      }
      memcpy((void *)(qword_1000118D8 + v4), __src, v5);
      v2 -= v5;
      qword_1000118E0 += v5;
      qword_1000118E8 += v5;
      __src += v5;
      sub_100005C28();
      uint64_t v4 = qword_1000118E0;
    }
    while ((qword_1000118E0 + v2) >> 17);
  }
  if (v2)
  {
    memcpy((void *)(qword_1000118D8 + v4), __src, v2);
    qword_1000118E0 += v2;
    qword_1000118E8 += v2;
  }
}

void sub_100005E60()
{
}

uint64_t start(int a1, char *const *a2)
{
  sub_100003D00();
  sub_100003CB0((uint64_t)sub_1000064D0, (uint64_t)sub_10000599C, 0);
  uint64_t v4 = 0;
  long long v33 = 0u;
  memset(&v34, 0, sizeof(v34));
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  LOWORD(v30) = -1;
  BYTE9(v33) = 1;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        while (1)
        {
          uint64_t v5 = getopt(a1, a2, aNriSABCNSV);
          if ((int)v5 <= 97) {
            break;
          }
          if ((int)v5 <= 109)
          {
            if (v5 == 98)
            {
              int v13 = sub_100005640(v5, optarg, 0);
              if ((v13 & (v13 - 1)) != 0 || (v13 - 33554433) <= 0xFE0001FE) {
                errx(1, "Invalid bytes per cluster (%u); must be a power of two from 512 to 33554432");
              }
              DWORD1(v28) = v13;
            }
            else
            {
              if (v5 != 99) {
                goto LABEL_56;
              }
              LODWORD(v32) = sub_100005640(v5, optarg, 0);
              v9.i32[0] = v32;
              uint8x8_t v10 = (uint8x8_t)vcnt_s8(v9);
              v10.i16[0] = vaddlv_u8(v10);
              if (v32 > 0x10000 || v10.i32[0] != 1) {
                errx(1, "Invalid sectors per cluster (%u); must be a power of two from 1 to 65536");
              }
            }
          }
          else
          {
            switch(v5)
            {
              case 'n':
                HIDWORD(v29) = sub_100005640(v5, optarg, 0);
                if ((HIDWORD(v29) - 3) <= 0xFFFFFFFD) {
                  errx(1, "Invalid number of FATs (%u); must be 1 or 2");
                }
                break;
              case 's':
                *((void *)&v27 + 1) = sub_1000057A8(v5, optarg, 0);
                break;
              case 'v':
                if (!sub_100005AB8((unsigned __int8 *)optarg)) {
                  sub_100006534();
                }
                Mutable = CFStringCreateMutable(0, 0);
                if (!Mutable) {
                  sub_100006564();
                }
                uint64_t v7 = Mutable;
                CFStringAppendCString(Mutable, optarg, 0x8000100u);
                CFStringNormalize(v7, kCFStringNormalizationFormC);
                CFIndex Length = CFStringGetLength(v7);
                *(void *)__str = 0;
                v36.location = 0;
                v36.length = Length;
                if (CFStringGetBytes(v7, v36, 0x14000100u, 0, 0, (UInt8 *)&v30 + 2, 22, (CFIndex *)__str) != Length) {
                  sub_100006580();
                }
                LOWORD(v30) = *(void *)__str >> 1;
                uint64_t v4 = optarg;
                CFRelease(v7);
                break;
              default:
                goto LABEL_56;
            }
          }
        }
        if ((int)v5 <= 81) {
          break;
        }
        switch(v5)
        {
          case 'R':
            BYTE9(v33) = 0;
            break;
          case 'S':
            int v12 = sub_100005640(v5, optarg, 0);
            if ((v12 & (v12 - 1)) != 0 || (v12 - 4097) <= 0xFFFFF1FE) {
              errx(1, "Invalid bytes per sector (%u); must be a power of two from 512 to 4096");
            }
            LODWORD(v28) = v12;
            break;
          case 'a':
            HIDWORD(v28) = sub_100005640(v5, optarg, 0);
            if (!HIDWORD(v28)) {
              sub_100006518();
            }
            break;
          default:
            goto LABEL_56;
        }
      }
      if (v5 != 73) {
        break;
      }
      DWORD2(v29) = sub_100005640(v5, optarg, 0);
    }
    if (v5 != 78) {
      break;
    }
    BYTE8(v33) = 1;
  }
  if (v5 != -1 || a1 - optind != 1) {
LABEL_56:
  }
    sub_100005E60();
  uint64_t v15 = a2[optind];
  if (!strchr(v15, 47))
  {
    snprintf(__str, 0x400uLL, "/dev/r%s", v15);
    if (stat(__str, &v34))
    {
      usedBufLen = (CFIndex *)v15;
      uint64_t v15 = __str;
      snprintf(__str, 0x400uLL, "/dev/%s", (const char *)usedBufLen);
    }
    else
    {
      uint64_t v15 = __str;
    }
  }
  if (BYTE8(v33)) {
    uint64_t v16 = open(v15, 0);
  }
  else {
    uint64_t v16 = open(v15, 34);
  }
  sub_100003D28(v16);
  if (sub_100003D70() == -1 || (int v17 = sub_100003D70(), fstat(v17, &v34))) {
    err(1, "%s");
  }
  uint64_t v26 = 0;
  unsigned int v25 = 0;
  uint64_t v24 = 0;
  int v18 = sub_100003D70();
  if (ioctl(v18, 0x40086419uLL, &v26) == -1) {
    err(1, "%s: could not get total sectors");
  }
  int v19 = sub_100003D70();
  if (ioctl(v19, 0x40046418uLL, &v25) == -1) {
    err(1, "%s: could not get bytes per sector");
  }
  int v20 = sub_100003D70();
  if (ioctl(v20, 0x40086449uLL, &v24) == -1) {
    err(1, "%s: could not get partition offset");
  }
  sub_100003D40(v26);
  sub_100003D34(v25);
  sub_100003D4C(v24);
  sub_100003D58((uint64_t)v4);
  sub_100003D64((uint64_t)v15);
  v23[4] = v31;
  v23[5] = v32;
  v23[6] = v33;
  v23[0] = v27;
  v23[1] = v28;
  v23[2] = v29;
  v23[3] = v30;
  return sub_100003E00((uint64_t)v23, 0);
}

void sub_1000064D0(int a1, int a2, char *a3, va_list a4)
{
  if (a2 == 1)
  {
    vprintf(a3, a4);
  }
  else if (a2 == 16)
  {
    verrx(1, a3, a4);
  }
}

void sub_100006518()
{
}

void sub_100006534()
{
}

void sub_100006564()
{
}

void sub_100006580()
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

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return _CFStringCreateMutable(alloc, maxLength);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return _CFStringGetBytes(theString, range, encoding, lossByte, isExternalRepresentation, buffer, maxBufLen, usedBufLen);
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

int *__error(void)
{
  return ___error();
}

void bzero(void *a1, size_t a2)
{
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return _clock_gettime(__clock_id, __tp);
}

void err(int a1, const char *a2, ...)
{
}

void errx(int a1, const char *a2, ...)
{
}

void exit(int a1)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

int getopt(int a1, char *const a2[], const char *a3)
{
  return _getopt(a1, a2, a3);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return _ioctl(a1, a2);
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

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return _memchr(__s, __c, __n);
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

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
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

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return _strchr(__s, __c);
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

time_t time(time_t *a1)
{
  return _time(a1);
}

void verrx(int a1, const char *a2, __darwin_va_list a3)
{
}

int vprintf(const char *a1, va_list a2)
{
  return _vprintf(a1, a2);
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