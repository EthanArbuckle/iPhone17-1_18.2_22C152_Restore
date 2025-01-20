void OUTLINED_FUNCTION_26(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  uint64_t v4;
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x2Eu);
}

void OUTLINED_FUNCTION_9(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Cu);
}

void OUTLINED_FUNCTION_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x22u);
}

uint64_t OUTLINED_FUNCTION_9_1@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  *(void *)(v2 - 40) = a2;
  return *(void *)(*(void *)a1 + 8);
}

uint64_t OUTLINED_FUNCTION_5_2(uint64_t a1)
{
  return [v1 serviceNameforDeviceID:v2 playerID:a1];
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x22u);
}

uint64_t OUTLINED_FUNCTION_4_1@<X0>(void **a1@<X1>, uint64_t a2@<X8>)
{
  *(void *)(v2 - 24) = a2;
  uint64_t v4 = *a1;
  return [v4 UTF8String];
}

void OUTLINED_FUNCTION_4_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x36u);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x26u);
}

void OUTLINED_FUNCTION_7_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x1Cu);
}

void OUTLINED_FUNCTION_7_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x4Eu);
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x26u);
}

void OUTLINED_FUNCTION_3_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x28u);
}

void OUTLINED_FUNCTION_3_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x2Cu);
}

void OUTLINED_FUNCTION_8_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x22u);
}

uint64_t OUTLINED_FUNCTION_8_2()
{
  uint64_t v2 = *(void **)(v0 + 40);
  return [v2 playerID];
}

void OUTLINED_FUNCTION_8_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x3Au);
}

uint64_t OUTLINED_FUNCTION_11@<X0>(void *a1@<X1>, uint64_t a2@<X8>)
{
  *(void *)(v2 - 24) = a2;
  return [a1 length];
}

void OUTLINED_FUNCTION_11_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x22u);
}

void OUTLINED_FUNCTION_6_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x28u);
}

void OUTLINED_FUNCTION_16(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x22u);
}

void OUTLINED_FUNCTION_6_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x30u);
}

void OUTLINED_FUNCTION_6_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x3Cu);
}

void OUTLINED_FUNCTION_6_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x3Au);
}

void OUTLINED_FUNCTION_17(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x30u);
}

uint64_t OUTLINED_FUNCTION_10@<X0>(void *a1@<X1>, uint64_t a2@<X8>)
{
  *(void *)(v2 - 24) = a2;
  return [a1 description];
}

void OUTLINED_FUNCTION_13_1(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

double micro()
{
  double v0 = machTimeScale();
  return v0 * (double)(uint64_t)mach_absolute_time();
}

double machTimeScale()
{
  if ((machTimeScale_did_init & 1) == 0)
  {
    mach_timebase_info info = (mach_timebase_info)0xAAAAAAAAAAAAAAAALL;
    mach_timebase_info(&info);
    LODWORD(v2) = info.denom;
    LODWORD(v1) = info.numer;
    *(double *)&machTimeScale_timeScale = (double)v1 / (double)v2 / 1000000000.0;
    __dmb(0xBu);
    machTimeScale_did_init = 1;
  }
  return *(double *)&machTimeScale_timeScale;
}

uint64_t rijndaelKeySetupEnc(unsigned int *a1, unsigned int *a2, int a3)
{
  unsigned int v3 = bswap32(*a2);
  *a1 = v3;
  unsigned int v4 = bswap32(a2[1]);
  a1[1] = v4;
  unsigned int v5 = bswap32(a2[2]);
  a1[2] = v5;
  unsigned int v6 = bswap32(a2[3]);
  a1[3] = v6;
  if (a3 == 128)
  {
    uint64_t v7 = 0;
    v8 = a1 + 4;
    do
    {
      unint64_t v9 = *(v8 - 1);
      v3 ^= (Te4[4 * BYTE2(v9) + 3] << 24) ^ (Te4[4 * BYTE1(v9) + 2] << 16) ^ (Te4[4 * v9 + 1] << 8) ^ Te4[(v9 >> 22) & 0x3FC] ^ rcon[v7];
      int v10 = *(v8 - 2);
      int v11 = *(v8 - 3) ^ v3;
      unsigned int *v8 = v3;
      v8[1] = v11;
      int v12 = v10 ^ v11;
      v8[2] = v12;
      v8[3] = v12 ^ v9;
      ++v7;
      v8 += 4;
    }
    while (v7 != 10);
    return 10;
  }
  else
  {
    a1[4] = bswap32(a2[4]);
    unsigned int v14 = bswap32(a2[5]);
    a1[5] = v14;
    if (a3 == 192)
    {
      uint64_t v15 = 0;
      for (i = a1 + 11; ; i += 6)
      {
        v3 ^= (Te4[4 * BYTE2(v14) + 3] << 24) ^ (Te4[4 * BYTE1(v14) + 2] << 16) ^ (Te4[4 * v14 + 1] << 8) ^ Te4[4 * HIBYTE(v14)] ^ rcon[v15];
        v4 ^= v3;
        *(i - 5) = v3;
        *(i - 4) = v4;
        v5 ^= v4;
        v6 ^= v5;
        *(i - 3) = v5;
        *(i - 2) = v6;
        if (v15 == 7) {
          break;
        }
        int v17 = *(i - 7) ^ v6;
        v14 ^= v17;
        *(i - 1) = v17;
        unsigned int *i = v14;
        ++v15;
      }
      return 12;
    }
    else
    {
      a1[6] = bswap32(a2[6]);
      unsigned int v18 = bswap32(a2[7]);
      a1[7] = v18;
      if (a3 == 256)
      {
        uint64_t v19 = 0;
        for (j = a1 + 8; ; j += 8)
        {
          v3 ^= (Te4[4 * BYTE2(v18) + 3] << 24) ^ (Te4[4 * BYTE1(v18) + 2] << 16) ^ (Te4[4 * v18 + 1] << 8) ^ Te4[4 * HIBYTE(v18)] ^ rcon[v19];
          v4 ^= v3;
          unsigned int *j = v3;
          j[1] = v4;
          v5 ^= v4;
          v6 ^= v5;
          j[2] = v5;
          j[3] = v6;
          if (v19 == 6) {
            break;
          }
          int v21 = *(j - 4) ^ (Te4[4 * HIBYTE(v6) + 3] << 24) ^ (Te4[4 * BYTE2(v6) + 2] << 16) ^ (Te4[4 * BYTE1(v6) + 1] << 8) ^ Te4[4 * v6];
          int v22 = *(j - 3) ^ v21;
          j[4] = v21;
          j[5] = v22;
          int v23 = *(j - 2) ^ v22;
          v18 ^= v23;
          j[6] = v23;
          j[7] = v18;
          ++v19;
        }
        return 14;
      }
      else
      {
        return 0;
      }
    }
  }
}

_DWORD *rijndaelEncrypt(_DWORD *result, int a2, unsigned int *a3, _DWORD *a4)
{
  unsigned int v4 = bswap32(*a3) ^ *result;
  unsigned int v5 = bswap32(a3[1]) ^ result[1];
  unsigned int v6 = a3[3];
  unsigned int v7 = bswap32(a3[2]) ^ result[2];
  unsigned int v8 = bswap32(v6) ^ result[3];
  uint64_t v9 = ((a2 >> 1) - 1);
  int v10 = result + 6;
  for (int i = (a2 >> 1) - 1; ; --i)
  {
    unsigned int v12 = Te1[BYTE2(v5)] ^ Te0[HIBYTE(v4)] ^ Te2[BYTE1(v7)] ^ Te3[v8] ^ *(v10 - 2);
    unsigned int v13 = Te1[BYTE2(v7)] ^ Te0[HIBYTE(v5)] ^ Te2[BYTE1(v8)] ^ Te3[v4] ^ *(v10 - 1);
    unsigned int v14 = Te1[BYTE2(v8)] ^ Te0[HIBYTE(v7)] ^ Te2[BYTE1(v4)] ^ Te3[v5] ^ *v10;
    unsigned int v15 = Te1[BYTE2(v4)] ^ Te0[HIBYTE(v8)] ^ Te2[BYTE1(v5)] ^ Te3[v7] ^ v10[1];
    unsigned int v16 = HIBYTE(v12);
    unsigned int v17 = HIBYTE(v13);
    int v18 = BYTE1(v15);
    unsigned int v19 = HIBYTE(v14);
    int v20 = BYTE2(v15);
    int v21 = BYTE1(v12);
    unsigned int v22 = HIBYTE(v15);
    int v23 = BYTE2(v12);
    if (!i) {
      break;
    }
    int v24 = Te1[BYTE2(v13)] ^ Te0[v16] ^ Te2[BYTE1(v14)] ^ Te3[v15];
    int v25 = v10[2];
    int v26 = v10[3];
    int v27 = v10[4];
    int v28 = v10[5];
    v10 += 8;
    unsigned int v4 = v24 ^ v25;
    unsigned int v5 = Te1[BYTE2(v14)] ^ Te0[v17] ^ Te2[v18] ^ Te3[v12] ^ v26;
    int v29 = Te0[v22];
    int v30 = Te1[v23];
    unsigned int v7 = Te1[v20] ^ Te0[v19] ^ Te2[v21] ^ Te3[v13] ^ v27;
    unsigned int v8 = v30 ^ v29 ^ Te2[BYTE1(v13)] ^ Te3[v14] ^ v28;
  }
  v31 = &result[8 * v9];
  *a4 = bswap32(((Te4[4 * v16 + 3] << 24) | (Te4[4 * BYTE2(v13) + 2] << 16) | (Te4[4 * BYTE1(v14) + 1] << 8) | Te4[4 * v15]) ^ v31[8]);
  a4[1] = bswap32(((Te4[4 * v17 + 3] << 24) | (Te4[4 * BYTE2(v14) + 2] << 16) | (Te4[4 * BYTE1(v15) + 1] << 8) | Te4[4 * v12]) ^ v31[9]);
  a4[2] = bswap32(((Te4[4 * v19 + 3] << 24) | (Te4[4 * BYTE2(v15) + 2] << 16) | (Te4[4 * BYTE1(v12) + 1] << 8) | Te4[4 * v13]) ^ v31[10]);
  a4[3] = bswap32(((Te4[4 * v22 + 3] << 24) | (Te4[4 * BYTE2(v12) + 2] << 16) | (Te4[4 * BYTE1(v13) + 1] << 8) | Te4[4 * v14]) ^ v31[11]);
  return result;
}

_DWORD *kdf(_DWORD *result, unsigned __int8 (*a2)[4][4], char a3, int a4)
{
  unsigned int v4 = a4;
  unsigned int v6 = result;
  uint64_t v13 = *MEMORY[0x263EF8340];
  *((void *)&__src + 1) = 0xAAAAAAAAAAAAAAAALL;
  memset(v11, 0, sizeof(v11));
  *(void *)&long long __src = 0xAAAAAAAAAAAAAAAALL;
  v11[7] = a3;
  char v12 = 1;
  if (a4 < 16)
  {
    int v8 = a4;
    if (!a4) {
      return result;
    }
    goto LABEL_5;
  }
  int v7 = 2;
  do
  {
    result = rijndaelEncrypt(a2, 10, (unsigned int *)v11, &__src);
    int v8 = v4 - 16;
    *v6++ = __src;
    char v12 = v7++;
    BOOL v9 = v4 > 0x1F;
    v4 -= 16;
  }
  while (v9);
  if (v8)
  {
LABEL_5:
    rijndaelEncrypt(a2, 10, (unsigned int *)v11, &__src);
    return memcpy(v6, &__src, v8);
  }
  return result;
}

uint64_t poly_hash(uint64_t result, uint64_t a2)
{
  for (uint64_t i = 0; i != 32; i += 8)
  {
    unint64_t v3 = *(void *)(a2 + i);
    uint64_t v4 = result + i;
    uint64_t v5 = *(void *)(result + i + 1208);
    uint64_t v6 = *(void *)(result + i + 1176);
    unint64_t v7 = v6 * (unint64_t)HIDWORD(v5) + HIDWORD(v6) * (unint64_t)v5;
    unint64_t v8 = v6 * v5 + 59 * (HIDWORD(v7) + HIDWORD(v6) * (unint64_t)HIDWORD(v5));
    if (v8 < v7 << 32) {
      v8 += 59;
    }
    if (v3 < 0xFFFFFFFF00000000)
    {
      uint64_t v17 = v8 + v3;
      if (__CFADD__(v8, v3)) {
        uint64_t v17 = v8 + v3 + 59;
      }
    }
    else
    {
      if (v8 > 0x3B) {
        uint64_t v9 = -1;
      }
      else {
        uint64_t v9 = -60;
      }
      unint64_t v10 = v9 + v8;
      *(void *)(v4 + 1208) = v10;
      uint64_t v11 = *(void *)(a2 + i);
      uint64_t v12 = v11 - 59;
      unint64_t v13 = HIDWORD(v10) * (unint64_t)v6 + v10 * (unint64_t)HIDWORD(v6);
      unint64_t v14 = v10 * v6 + 59 * (HIDWORD(v13) + HIDWORD(v10) * (unint64_t)HIDWORD(v6));
      if (v14 < v13 << 32) {
        v14 += 59;
      }
      BOOL v15 = __CFADD__(v14, v12);
      uint64_t v16 = v14 + v12;
      uint64_t v17 = v14 + v11;
      if (!v15) {
        uint64_t v17 = v16;
      }
    }
    *(void *)(v4 + 1208) = v17;
  }
  return result;
}

uint64_t ip_long(uint64_t result, uint64_t a2)
{
  uint64_t v2 = 0;
  uint64_t v3 = result + 1208;
  uint64_t v4 = 1240;
  do
  {
    unint64_t v5 = *(void *)(v3 + 8 * v2);
    if (v5 >= 0xFFFFFFFFFFFFFFC5)
    {
      v5 += 59;
      *(void *)(v3 + 8 * v2) = v5;
    }
    unint64_t v6 = *(void *)(result + v4) * HIWORD(v5)
       + *(void *)(result + v4 + 8) * WORD2(v5)
       + *(void *)(result + v4 + 16) * WORD1(v5)
       + *(void *)(result + v4 + 24) * (unsigned __int16)v5;
    unint64_t v7 = 5 * (v6 >> 36) + (v6 & 0xFFFFFFFFFLL);
    if (v7 > 0xFFFFFFFFALL) {
      LODWORD(v7) = v7 + 5;
    }
    *(_DWORD *)(a2 + 4 * v2) = bswap32(*(_DWORD *)(result + 4 * v2 + 1368) ^ v7);
    ++v2;
    v4 += 32;
  }
  while (v2 != 4);
  return result;
}

uint64_t ip_short(uint64_t result, void *a2, _DWORD *a3)
{
  unint64_t v3 = a2[1];
  unint64_t v4 = *(void *)(result + 1240) * HIWORD(*a2)
     + *(void *)(result + 1248) * (unsigned __int16)WORD2(*a2)
     + *(void *)(result + 1256) * WORD1(*a2)
     + *(void *)(result + 1264) * (unsigned __int16)*a2;
  unint64_t v5 = 5 * (v4 >> 36) + (v4 & 0xFFFFFFFFFLL);
  if (v5 > 0xFFFFFFFFALL) {
    LODWORD(v5) = 5 * (v4 >> 36) + v4 + 5;
  }
  *a3 = bswap32(*(_DWORD *)(result + 1368) ^ v5);
  unint64_t v6 = *(void *)(result + 1272) * HIWORD(v3)
     + *(void *)(result + 1280) * WORD2(v3)
     + *(void *)(result + 1288) * WORD1(v3)
     + *(void *)(result + 1296) * (unsigned __int16)v3;
  unint64_t v7 = 5 * (v6 >> 36) + (v6 & 0xFFFFFFFFFLL);
  if (v7 > 0xFFFFFFFFALL) {
    LODWORD(v7) = v7 + 5;
  }
  a3[1] = bswap32(*(_DWORD *)(result + 1372) ^ v7);
  unint64_t v8 = a2[3];
  unint64_t v9 = *(void *)(result + 1304) * HIWORD(a2[2])
     + *(void *)(result + 1312) * (unsigned __int16)WORD2(a2[2])
     + *(void *)(result + 1320) * WORD1(a2[2])
     + *(void *)(result + 1328) * (unsigned __int16)a2[2];
  unint64_t v10 = 5 * (v9 >> 36) + (v9 & 0xFFFFFFFFFLL);
  if (v10 > 0xFFFFFFFFALL) {
    LODWORD(v10) = v10 + 5;
  }
  a3[2] = bswap32(*(_DWORD *)(result + 1376) ^ v10);
  unint64_t v11 = *(void *)(result + 1336) * HIWORD(v8)
      + *(void *)(result + 1344) * WORD2(v8)
      + *(void *)(result + 1352) * WORD1(v8)
      + *(void *)(result + 1360) * (unsigned __int16)v8;
  unint64_t v12 = 5 * (v11 >> 36) + (v11 & 0xFFFFFFFFFLL);
  if (v12 <= 0xFFFFFFFFALL) {
    int v13 = v12;
  }
  else {
    int v13 = v12 + 5;
  }
  a3[3] = bswap32(*(_DWORD *)(result + 1380) ^ v13);
  return result;
}

uint64_t uhash(int64x2_t *a1, unsigned __int8 *a2, uint64_t a3, _DWORD *a4)
{
  int v5 = a3;
  unint64_t v6 = a2;
  uint64_t v18 = *MEMORY[0x263EF8340];
  v8.i64[0] = 0xAAAAAAAAAAAAAAAALL;
  v8.i64[1] = 0xAAAAAAAAAAAAAAAALL;
  int64x2_t v16 = v8;
  int64x2_t v17 = v8;
  if (a3 >= 1025)
  {
    unint64_t v10 = a3 + 1024;
    int v11 = a3 + 31;
    int v12 = 8 * a3;
    int v13 = -(int)a3;
    int64x2_t v15 = vdupq_n_s64(0x2000uLL);
    do
    {
      int64x2_t v16 = v15;
      int64x2_t v17 = v15;
      nh_aux(a1->i32, v6, v16.i64, 0x400u);
      poly_hash((uint64_t)a1, (uint64_t)&v16);
      v6 += 1024;
      v10 -= 1024;
      v11 -= 1024;
      v12 -= 0x2000;
      v13 += 1024;
    }
    while (v10 > 0x7FF);
    if (v10 != 1024)
    {
      zero_pad(&v6[v10 - 1024], v13 + (v11 & 0xFFFFFFE0));
      v16.i64[0] = v12 & 0xFFFFFFF8;
      v16.i64[1] = v16.i64[0];
      v17.i64[0] = v16.i64[0];
      v17.i64[1] = v16.i64[0];
      nh_aux(a1->i32, v6, v16.i64, v11 & 0xFFFFFFE0);
      poly_hash((uint64_t)a1, (uint64_t)&v16);
    }
    ip_long((uint64_t)a1, (uint64_t)a4);
  }
  else
  {
    if (a3) {
      unsigned int v9 = (a3 + 31) & 0xFFFFFFE0;
    }
    else {
      unsigned int v9 = 32;
    }
    zero_pad(&a2[a3], v9 - a3);
    v16.i64[0] = (8 * v5);
    v16.i64[1] = v16.i64[0];
    v17.i64[0] = v16.i64[0];
    v17.i64[1] = v16.i64[0];
    nh_aux(a1->i32, v6, v16.i64, v9);
    ip_short((uint64_t)a1, &v16, a4);
  }
  a1[73].i64[0] = 0;
  a1[72] = 0u;
  a1[71] = 0u;
  a1[86].i32[2] = 0;
  a1[75].i64[1] = 1;
  a1[76] = vdupq_n_s64(1uLL);
  a1[77].i64[0] = 1;
  return 1;
}

void zero_pad(unsigned __int8 *a1, int a2)
{
  int v2 = a2;
  unint64_t v3 = a1;
  if (a2 >= 8)
  {
    if ((a1 & 7) == 0
      || (size_t v4 = (~(_BYTE)a1 & 7) + 1,
          bzero(a1, v4),
          v2 += v3 | 0xFFFFFFF8,
          v3 += v4,
          v2 >= 8))
    {
      if (v2 >= 15) {
        int v5 = 15;
      }
      else {
        int v5 = v2;
      }
      uint64_t v6 = (v2 - v5 + 7) & 0xFFFFFFF8;
      bzero(v3, v6 + 8);
      int v2 = v2 - v6 - 8;
      v3 += v6 + 8;
    }
  }
  if (v2)
  {
    bzero(v3, v2);
  }
}

uint64_t umac_delete(void *a1)
{
  return 1;
}

void **umac_new(unsigned int *a1)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  int v2 = (void **)malloc_type_malloc(0x658uLL, 0x1020040B23A9D2DuLL);
  unint64_t v3 = v2;
  if (v2)
  {
    *int v2 = (void *)(((unint64_t)(v2 + 1) & 0xFFFFFFFFFFFFFFF0) + 16);
    *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v24[9] = v4;
    v24[10] = v4;
    v24[7] = v4;
    v24[8] = v4;
    v24[5] = v4;
    v24[6] = v4;
    v24[3] = v4;
    v24[4] = v4;
    v24[1] = v4;
    v24[2] = v4;
    v24[0] = v4;
    rijndaelKeySetupEnc((unsigned int *)v24, a1, 128);
    int v5 = (unsigned int *)*v3;
    uint64_t v6 = (char *)*v3 + 1392;
    *(void *)&long long v25 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
    kdf(&v25, (unsigned __int8 (*)[4][4])v24, 0, 16);
    rijndaelKeySetupEnc(v5 + 356, (unsigned int *)&v25, 128);
    *((void *)v5 + 177) = 0;
    *((void *)v5 + 176) = 0;
    rijndaelEncrypt(v5 + 356, 10, v5 + 352, v6);
    unint64_t v7 = (char *)*v3;
    uint64_t v8 = (uint64_t)*v3 + 1176;
    bzero(*v3, 0x570uLL);
    kdf(v7, (unsigned __int8 (*)[4][4])v24, 1, 1072);
    for (uint64_t i = 0; i != 1072; i += 16)
      *(int8x16_t *)&v7[i] = vrev32q_s8(*(int8x16_t *)&v7[i]);
    *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v41 = v10;
    long long v42 = v10;
    long long v39 = v10;
    long long v40 = v10;
    long long v37 = v10;
    long long v38 = v10;
    long long v35 = v10;
    long long v36 = v10;
    long long v33 = v10;
    long long v34 = v10;
    long long v31 = v10;
    long long v32 = v10;
    long long v29 = v10;
    long long v30 = v10;
    long long v27 = v10;
    long long v28 = v10;
    long long v25 = v10;
    long long v26 = v10;
    *((void *)v7 + 146) = 0;
    *((_OWORD *)v7 + 72) = 0u;
    *((_OWORD *)v7 + 71) = 0u;
    kdf(&v25, (unsigned __int8 (*)[4][4])v24, 2, 288);
    int v11 = (float *)(v7 + 1176);
    v12.i64[0] = __PAIR64__(DWORD2(v26), v25);
    v12.i64[1] = __PAIR64__(DWORD2(v29), v28);
    v13.i64[0] = v28;
    v13.i64[1] = *((void *)&v29 + 1);
    v14.i64[0] = v25;
    v14.i64[1] = *((void *)&v26 + 1);
    v45.val[0] = (float32x4_t)vrev32q_s8((int8x16_t)vuzp2q_s32(v14, v13));
    v45.val[1] = (float32x4_t)vrev32q_s8(v12);
    vst2q_f32(v11, v45);
    v45.val[0] = (float32x4_t)(*(_OWORD *)(v8 + 16) & __PAIR128__(0x1FFFFFF01FFFFFFLL, 0x1FFFFFF01FFFFFFLL));
    v12.i64[0] = __PAIR64__(HIDWORD(*(void *)v8), *(_OWORD *)v8) & 0x1FFFFFF01FFFFFFLL;
    v12.i32[2] = *(void *)(v8 + 8) & 0x1FFFFFF;
    v12.i32[3] = HIDWORD(*(void *)v8) & 0x1FFFFFF;
    *(int8x16_t *)uint64_t v8 = v12;
    *(float32x4_t *)(v8 + 16) = v45.val[0];
    int64x2_t v15 = vdupq_n_s64(1uLL);
    *(int64x2_t *)(v8 + 32) = v15;
    *(int64x2_t *)(v8 + 48) = v15;
    kdf(&v25, (unsigned __int8 (*)[4][4])v24, 3, 288);
    uint64_t v16 = 32;
    int64x2_t v17 = v7 + 1240;
    do
    {
      *int64x2_t v17 = *(long long *)((char *)&v25 + v16);
      v17[1] = *(long long *)((char *)&v25 + v16 + 16);
      v16 += 64;
      v17 += 2;
    }
    while (v16 != 288);
    for (uint64_t j = 0; j != 128; j += 32)
    {
      unsigned int v19 = (float *)&v7[j + 1240];
      float32x4x2_t v44 = vld2q_f32(v19);
      v46.val[0] = (float32x4_t)vrev32q_s8((int8x16_t)v44.val[1]);
      v46.val[1] = (float32x4_t)vrev32q_s8((int8x16_t)v44.val[0]);
      vst2q_f32(v19, v46);
    }
    uint64_t v20 = 0;
    int v21 = v7 + 1240;
    do
    {
      *(void *)&long long v22 = *(void *)&v21[v20] % 0xFFFFFFFFBuLL;
      *((void *)&v22 + 1) = *(void *)&v21[v20 + 8] % 0xFFFFFFFFBuLL;
      *(_OWORD *)&v21[v20] = v22;
      v20 += 16;
    }
    while (v20 != 128);
    kdf((_DWORD *)(v8 + 192), (unsigned __int8 (*)[4][4])v24, 4, 16);
    *(int8x16_t *)(v8 + 192) = vrev32q_s8(*(int8x16_t *)(v8 + 192));
  }
  return v3;
}

_DWORD *pdf_gen_xor(_DWORD *result, int *a2, void *a3)
{
  long long v4 = result;
  int v5 = result + 4;
  int v7 = *a2;
  int v6 = a2[1];
  if (v6 != result[5] || v7 != *v5)
  {
    result[4] = v7;
    result[5] = v6;
    result = rijndaelEncrypt(result + 8, 10, v5, result);
  }
  uint64_t v8 = a3[1];
  *a3 ^= *v4;
  a3[1] = v8 ^ v4[1];
  return result;
}

uint64_t umac(int64x2_t **a1, unsigned __int8 *a2, uint64_t a3, _DWORD *a4, int *a5)
{
  return 1;
}

uint64_t nh_aux(int *a1, _DWORD *a2, uint64_t *a3, unsigned int a4)
{
  uint64_t v4 = *a3;
  unint64_t v5 = a3[1];
  uint64_t v6 = a4 >> 5;
  unint64_t v7 = a3[2];
  unint64_t v8 = a3[3];
  int v10 = *a1;
  int v9 = a1[1];
  int v12 = a1[2];
  int v11 = a1[3];
  int v14 = a1[4];
  int v13 = a1[5];
  int64x2_t v15 = a1 + 10;
  uint64_t v16 = (char *)(a1 + 10);
  int v17 = a1[6];
  int v18 = a1[7];
  do
  {
    int v19 = a2[1];
    int v20 = a2[4];
    int v21 = a2[5];
    int v22 = *(v15 - 2);
    int v23 = *(v15 - 1);
    uint64_t v24 = v4 + (v20 + v14) * (unint64_t)(*a2 + v10);
    int v25 = v15[2];
    int v26 = v15[3];
    unint64_t v27 = v5 + (v22 + v20) * (unint64_t)(*a2 + v14);
    unint64_t v28 = v8 + (v15[6] + v20) * (unint64_t)(v25 + *a2);
    int v29 = a2[2];
    int v30 = a2[3];
    uint64_t v31 = v24 + (v21 + v13) * (unint64_t)(v19 + v9);
    unint64_t v32 = v27 + (v23 + v21) * (unint64_t)(v19 + v13);
    unint64_t v33 = v7
        + (v25 + v20) * (unint64_t)(v22 + *a2)
        + (v26 + v21) * (unint64_t)(v23 + v19);
    int v34 = a2[6];
    int v35 = a2[7];
    unsigned int v36 = v15[7] + v21;
    int v37 = *v15;
    int v38 = v15[1];
    unint64_t v39 = v28 + v36 * (unint64_t)(v26 + v19);
    uint64_t v40 = v31 + (v34 + v17) * (unint64_t)(v29 + v12);
    unsigned int v41 = v29 + v17;
    int v17 = v15[4];
    int v42 = v15[5];
    unint64_t v43 = v33 + (v17 + v34) * (unint64_t)(*v15 + v29);
    int v44 = *((_DWORD *)v16 + 8);
    v16 += 32;
    uint64_t result = (v17 + v29);
    uint64_t v4 = v40 + (v35 + v18) * (unint64_t)(v30 + v11);
    unint64_t v5 = v32
       + (*v15 + v34) * (unint64_t)v41
       + (v38 + v35) * (unint64_t)(v30 + v18);
    unint64_t v7 = v43 + (v42 + v35) * (unint64_t)(v38 + v30);
    unint64_t v8 = v39
       + (v44 + v34) * (unint64_t)result
       + (v15[9] + v35) * (unint64_t)(v42 + v30);
    a2 += 8;
    int64x2_t v15 = (int *)v16;
    int v10 = v22;
    int v9 = v23;
    int v12 = v37;
    int v11 = v38;
    int v14 = v25;
    int v13 = v26;
    int v18 = v42;
    --v6;
  }
  while (v6);
  *a3 = v4;
  a3[1] = v5;
  a3[2] = v7;
  a3[3] = v8;
  return result;
}

void sub_221569374(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2215693F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2215697A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221569808(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2215698A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221569C10(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221569D50(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221569EC0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22156C348(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void CDX_SCDynamicStoreCallBack(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (!a3[129])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      unint64_t v5 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 136315650;
        uint64_t v7 = v4;
        __int16 v8 = 2080;
        int v9 = "CDX_SCDynamicStoreCallBack";
        __int16 v10 = 1024;
        int v11 = 1090;
        _os_log_impl(&dword_221563000, v5, OS_LOG_TYPE_DEFAULT, "CDXClient [%s] %s:%d network-did-change", (uint8_t *)&v6, 0x1Cu);
      }
    }
    a3[129] = 1;
    [a3 performSelector:sel_networkDidChange withObject:0 afterDelay:1.5];
  }
}

void sub_22156C760(_Unwind_Exception *exception_object)
{
}

void sub_22156CA9C(_Unwind_Exception *exception_object)
{
}

void sub_22156CC8C(_Unwind_Exception *exception_object)
{
}

_DWORD *CDXVendorCreate(unsigned int *a1, int a2, unsigned int *a3)
{
  int v6 = malloc_type_calloc(0x200uLL, 1uLL, 0xBDC66430uLL);
  uint64_t v7 = v6;
  if (v6)
  {
    v6[126] = rijndaelKeySetupEnc(v6 + 4, a1, 128);
    rijndaelKeySetupEnc(v7 + 64, a3, 128);
    *(void *)uint64_t v7 = umac_new(a1);
    *((void *)v7 + 1) = umac_new(a3);
    *((void *)v7 + 62) = a2;
  }
  return v7;
}

_DWORD *CDXVendorCreateWithSingleKey(unsigned int *a1)
{
  return CDXVendorCreate(a1, 0, a1);
}

void CDXVendorRelease(void **a1)
{
  umac_delete(*a1);
  umac_delete(a1[1]);
  free(a1);
}

uint64_t CDXVendorCreateTicket(uint64_t a1, unsigned char *a2, size_t *a3, void *a4, const void *a5, size_t a6, unsigned int a7, unsigned int a8, uint64_t a9, char a10)
{
  v38[1] = *MEMORY[0x263EF8340];
  time_t v18 = time(0);
  if (a3)
  {
    size_t v19 = *a3;
    if (a1) {
      goto LABEL_3;
    }
LABEL_10:
    int v20 = (FILE *)*MEMORY[0x263EF8348];
    int v21 = 102;
    goto LABEL_22;
  }
  size_t v19 = 0;
  if (!a1) {
    goto LABEL_10;
  }
LABEL_3:
  if (!a2)
  {
    int v20 = (FILE *)*MEMORY[0x263EF8348];
    int v21 = 103;
    goto LABEL_22;
  }
  if (!a3)
  {
    int v20 = (FILE *)*MEMORY[0x263EF8348];
    int v21 = 104;
    goto LABEL_22;
  }
  if (!a4)
  {
    int v20 = (FILE *)*MEMORY[0x263EF8348];
    int v21 = 105;
    goto LABEL_22;
  }
  if (!a5 && a6)
  {
    int v20 = (FILE *)*MEMORY[0x263EF8348];
    int v21 = 106;
LABEL_22:
    fprintf(v20, "/Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/CDX/cdxticketgen.c:%d: Assert Failed (%s)\n", v21, "");
    return 4294967294;
  }
  if (a8 >= a7)
  {
    int v20 = (FILE *)*MEMORY[0x263EF8348];
    int v21 = 107;
    goto LABEL_22;
  }
  if ((a10 & 4) != 0) {
    time_t v22 = 0;
  }
  else {
    time_t v22 = v18;
  }
  size_t v23 = a6 + 15;
  unint64_t v24 = ((a6 + 15) & 0xFFFFFFFFFFFFFFF0) + 32;
  *a3 = v24;
  if (v24 >= 0x500 && (a10 & 2) == 0)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "/Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/CDX/cdxticketgen.c:%d: Assert Failed (%s)\n", 116, "");
    return 4294967291;
  }
  if (v24 >= v19)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "/Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/CDX/cdxticketgen.c:%d: Assert Failed (%s)\n", 119, "");
    return 4294967293;
  }
  time_t v26 = v22 + a9;
  bzero(a2, v19);
  *a2 = 0;
  a2[1] = a7;
  a2[2] = a8;
  *((_DWORD *)a2 + 3) = bswap32(v26);
  a2[3] = v23 >> 4;
  *(void *)(a2 + 4) = *a4;
  time_t v27 = *(void *)(a1 + 496);
  BOOL v28 = v26 < v27;
  BOOL v29 = v26 >= v27;
  LODWORD(v23) = (v23 >> 4);
  if (v28) {
    int v30 = (_DWORD *)(a1 + 16);
  }
  else {
    int v30 = (_DWORD *)(a1 + 256);
  }
  uint64_t v31 = *(int64x2_t ***)(a1 + 8 * v29);
  memcpy(a2 + 16, a5, a6);
  if (a10)
  {
    if ((a6 & 0xF) != 0)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "/Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/CDX/cdxticketgen.c:%d: Assert Failed (%s)\n", 150, "");
      return 4294967292;
    }
  }
  else if (v23)
  {
    size_t v32 = 0;
    unint64_t v33 = (const double *)(a2 + 4);
    int8x16_t v34 = (int8x16_t)vld1q_dup_f64(v33);
    int v35 = (int8x16_t *)(a2 + 16);
    do
    {
      int v36 = *(_DWORD *)(a1 + 504);
      *int v35 = veorq_s8(*v35, v34);
      rijndaelEncrypt(v30, v36, (unsigned int *)v35, v35);
      int8x16_t v37 = *v35++;
      int8x16_t v34 = v37;
      ++v32;
      size_t v23 = a2[3];
    }
    while (v32 < v23);
    LOBYTE(a8) = a2[2];
  }
  v38[0] = *(void *)(a2 + 4);
  LOBYTE(v38[0]) = a8;
  umac(v31, a2, 16 * v23 + 16, &a2[16 * v23 + 16], (int *)v38);
  return 0;
}

unsigned __int8 *CDXGetPreblobLength(unsigned __int8 *result)
{
  if (result)
  {
    unint64_t v1 = *result;
    if (v1 < 7 && ((0x53u >> v1) & 1) != 0)
    {
      return (unsigned __int8 *)qword_2215E8838[(char)v1];
    }
    else if ((v1 & 0x80) != 0)
    {
      return (unsigned __int8 *)(v1 - 127);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t CDXVerifyPreblob(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t result = 0;
  if (a1 && (unint64_t)(a2 - 1) <= 0x1F)
  {
    unsigned int v4 = *a1;
    if (v4 < 2) {
      return a2 == 1;
    }
    if (v4 == 4) {
      return a2 == 7;
    }
    if (v4 == 6) {
      return a2 == 19;
    }
    uint64_t result = 0;
    if ((char)v4 < 0 && (v4 - 127) == a2) {
      return 1;
    }
  }
  return result;
}

uint64_t AGPSendingSetElement::buffer(CAGP **this, unsigned __int8 *a2, unsigned int a3, unsigned int a4, unsigned int a5, char a6)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  uint64_t v12 = (pthread_mutex_t *)(this + 4);
  pthread_mutex_lock((pthread_mutex_t *)(this + 4));
  int can_buffer = AGPAssociationSetElement::can_buffer((AGPAssociationSetElement *)this, 1);
  if (a2 && a3 - 1 <= 0x5DB && can_buffer && a4 <= a5)
  {
    unsigned int v14 = *((unsigned __int8 *)this + 699);
    if (v14 <= 0x3F)
    {
      *((unsigned char *)this + 699) = v14 + 1;
      uint64_t v15 = *((unsigned __int8 *)this + 697);
      *((unsigned char *)this + 697) = (v15 + 1) & 0x3F;
      uint64_t v16 = &this[v15];
      *((_DWORD *)v16[15] + 2) = *((_DWORD *)v16[15] + 2) & 0xFFFFFFFE | AGPAssociationSetElement::can_buffer((AGPAssociationSetElement *)this, 1) ^ 1;
      *((_DWORD *)v16[15] + 2) |= 2u;
      *((_DWORD *)v16[15] + 2) = *((_DWORD *)v16[15] + 2) & 0xFFFFC0FF | ((v15 & 0x3F) << 8);
      *((_DWORD *)v16[15] + 2) = *((_DWORD *)v16[15] + 2) & 0xFFFFFF03 | (4 * (*((unsigned char *)this + 698) & 0x3F));
      *((_DWORD *)v16[15] + 2) = *((_DWORD *)v16[15] + 2) & 0x3FFFFFF | (*((unsigned __int8 *)this + 697) << 26);
      *((_DWORD *)v16[15] + 2) = *((_DWORD *)v16[15] + 2) & 0xFFFFC0FF | ((v15 & 0x3F) << 8);
      *((_DWORD *)v16[15] + 2) = *((_DWORD *)v16[15] + 2) & 0xFFF03FFF | ((a4 & 0x3F) << 14);
      *((_DWORD *)v16[15] + 2) = *((_DWORD *)v16[15] + 2) & 0xFC0FFFFF | ((a5 & 0x3F) << 20);
      int v17 = *((_DWORD *)this + 27);
      *((_DWORD *)this + 27) = v17 + 1;
      *(_DWORD *)v16[15] = v17;
      int v18 = CAGP::current_timestamp(this[1]);
      size_t v19 = v16[15];
      *((_DWORD *)v19 + 1) = v18;
      *((_DWORD *)v19 + 3) = a3;
      *((unsigned char *)this + v15 + 632) = a6;
      memcpy((char *)v16[15] + 16, a2, a3);
      char v20 = v15 - 32;
      if (v15 < 0x20) {
        char v20 = v15;
      }
      int v21 = 1 << v20;
      uint64_t v22 = 100;
      if (v15 < 0x20) {
        uint64_t v22 = 96;
      }
      *(_DWORD *)((char *)this + v22) |= v21;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v23 = VRTraceErrorLogLevelToCSTR();
        unint64_t v24 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          int v25 = this[1];
          int v27 = *((_DWORD *)this + 24);
          int v26 = *((_DWORD *)this + 25);
          int v39 = 136316418;
          uint64_t v40 = v23;
          __int16 v41 = 2080;
          int v42 = "buffer";
          __int16 v43 = 1024;
          int v44 = 734;
          __int16 v45 = 2048;
          *(void *)float32x4x2_t v46 = v25;
          *(_WORD *)&v46[8] = 1024;
          *(_DWORD *)v47 = v26;
          *(_WORD *)&v47[4] = 1024;
          int v48 = v27;
          _os_log_impl(&dword_221563000, v24, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p buffer: send bitmap == %08X%08X", (uint8_t *)&v39, 0x32u);
        }
      }
      BOOL v28 = this[1];
      ++*((_DWORD *)v28 + 92);
      *((_DWORD *)v28 + 93) += a3;
      goto LABEL_25;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v29 = VRTraceErrorLogLevelToCSTR();
      int v30 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        int v31 = *((_DWORD *)this + 27);
        int v39 = 136316418;
        uint64_t v40 = v29;
        __int16 v41 = 2080;
        int v42 = "buffer";
        __int16 v43 = 1024;
        int v44 = 738;
        __int16 v45 = 1024;
        *(_DWORD *)float32x4x2_t v46 = v31;
        *(_WORD *)&v46[4] = 1024;
        *(_DWORD *)&v46[6] = a4;
        *(_WORD *)v47 = 1024;
        *(_DWORD *)&v47[2] = a5;
        _os_log_impl(&dword_221563000, v30, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d buffer: MAXIMUM PACKET WINDOW COUNT USED (%08X:%02d:%02d)...", (uint8_t *)&v39, 0x2Eu);
      }
    }
  }
  if ((AGPAssociationSetElement::can_buffer((AGPAssociationSetElement *)this, 1) & 1) == 0
    && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v32 = VRTraceErrorLogLevelToCSTR();
    unint64_t v33 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR))
    {
      int v38 = *((_DWORD *)this + 27);
      int v39 = 136316418;
      uint64_t v40 = v32;
      __int16 v41 = 2080;
      int v42 = "buffer";
      __int16 v43 = 1024;
      int v44 = 744;
      __int16 v45 = 1024;
      *(_DWORD *)float32x4x2_t v46 = v38;
      *(_WORD *)&v46[4] = 1024;
      *(_DWORD *)&v46[6] = a4;
      *(_WORD *)v47 = 1024;
      *(_DWORD *)&v47[2] = a5;
      _os_log_error_impl(&dword_221563000, v33, OS_LOG_TYPE_ERROR, " [%s] %s:%d buffer: CAN'T BUFFER (%08X:%02d:%02d)...", (uint8_t *)&v39, 0x2Eu);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v34 = VRTraceErrorLogLevelToCSTR();
    int v35 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR))
    {
      int v37 = *((_DWORD *)this + 27);
      int v39 = 136316418;
      uint64_t v40 = v34;
      __int16 v41 = 2080;
      int v42 = "buffer";
      __int16 v43 = 1024;
      int v44 = 746;
      __int16 v45 = 1024;
      *(_DWORD *)float32x4x2_t v46 = v37;
      *(_WORD *)&v46[4] = 1024;
      *(_DWORD *)&v46[6] = a4;
      *(_WORD *)v47 = 1024;
      *(_DWORD *)&v47[2] = a5;
      _os_log_error_impl(&dword_221563000, v35, OS_LOG_TYPE_ERROR, " [%s] %s:%d buffer: FAILED TO BUFFER A RELIABLE PACKET SERIALNUMBER (%08X:%02d:%02d)...", (uint8_t *)&v39, 0x2Eu);
    }
  }
  uint64_t v15 = 0xFFFFFFFFLL;
LABEL_25:
  pthread_mutex_unlock(v12);
  return v15;
}

uint64_t AGPAssociationSetElement::can_buffer(AGPAssociationSetElement *this, int a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  unsigned int v4 = (pthread_mutex_t *)((char *)this + 32);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 32));
  int v5 = *((unsigned __int8 *)this + 698);
  int v6 = *((unsigned __int8 *)this + 696);
  if (v5 == v6)
  {
    int v7 = 0;
    if (!a2) {
      goto LABEL_6;
    }
  }
  else
  {
    int v7 = ((((v6 - v5) & ~((v6 - v5) >> 31)) + v5 - v6 + 63) & 0xFFFFFFC0) + v6 - v5;
    if (!a2) {
      goto LABEL_6;
    }
  }
  if (64 - v7 - *((unsigned __int8 *)this + 699) >= a2)
  {
    uint64_t v10 = 1;
    goto LABEL_11;
  }
LABEL_6:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    int v9 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR))
    {
      int v12 = *((unsigned __int8 *)this + 699);
      int v13 = *((unsigned __int8 *)this + 696);
      int v14 = *((unsigned __int8 *)this + 698);
      int v15 = 136316930;
      uint64_t v16 = v8;
      __int16 v17 = 2080;
      int v18 = "can_buffer";
      __int16 v19 = 1024;
      int v20 = 434;
      __int16 v21 = 1024;
      int v22 = a2;
      __int16 v23 = 1024;
      int v24 = v12;
      __int16 v25 = 1024;
      int v26 = v13;
      __int16 v27 = 1024;
      int v28 = v14;
      __int16 v29 = 1024;
      int v30 = v7;
      _os_log_error_impl(&dword_221563000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d CAN'T BUFFER: num_packets == %d, used == %d, head == %d base == %d reserved == %d", (uint8_t *)&v15, 0x3Au);
    }
  }
  uint64_t v10 = 0;
LABEL_11:
  pthread_mutex_unlock(v4);
  return v10;
}

uint64_t CAGP::current_timestamp(CAGP *this)
{
  uint64_t v2 = *((unsigned int *)this + 52);
  v6.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&v6.tv_usec = 0xAAAAAAAAAAAAAAAALL;
  if (!gettimeofday(&v6, 0))
  {
    uint64_t v3 = (v6.tv_usec / 1000 + 1000 * (SLODWORD(v6.tv_sec) % 604800)) % 0x240C8400u;
    uint64_t v2 = *((unsigned int *)this + 52);
    if (v2 == -1
      || (v2 > v3 ? (BOOL v4 = (v2 - v3) >= 0x12064201) : (BOOL v4 = 1), v4))
    {
      *((_DWORD *)this + 52) = v3;
      return v3;
    }
  }
  return v2;
}

uint64_t AGPSendingSetElement::search(AGPSendingSetElement *this, int a2)
{
  BOOL v4 = (pthread_mutex_t *)((char *)this + 32);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 32));
  int v5 = *((unsigned __int8 *)this + 699);
  if (*((unsigned char *)this + 699))
  {
    uint64_t v6 = *((unsigned __int8 *)this + 696);
    while (**((_DWORD **)this + v6 + 15) != a2)
    {
      uint64_t v6 = ((int)v6 + 1) & 0x3FLL;
      if (!--v5) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    uint64_t v6 = 0xFFFFFFFFLL;
  }
  pthread_mutex_unlock(v4);
  return v6;
}

uint64_t AGPSendingSetElement::remove(AGPSendingSetElement *this, unsigned int a2)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  BOOL v4 = (pthread_mutex_t *)((char *)this + 32);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 32));
  if (a2 > 0x3F
    || (v5 = (char *)this + 8 * a2, v8 = (_DWORD *)*((void *)v5 + 15), v7 = v5 + 120, v6 = v8, (int v9 = v8[3]) == 0))
  {
    uint64_t v15 = 0;
    goto LABEL_38;
  }
  int v10 = v6[379];
  int v11 = (CAGP *)*((void *)this + 1);
  *((_DWORD *)v11 + 94) += v10;
  *((_DWORD *)v11 + 95) += v10 * v9;
  v6[3] = 0;
  if (v6[1] != -1)
  {
    int v12 = CAGP::current_timestamp(v11) - *(_DWORD *)(*(void *)v7 + 4);
    if (v12 < 0)
    {
      if (v12 >= 0xEDF9BE01)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v13 = VRTraceErrorLogLevelToCSTR();
          int v14 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
            AGPSendingSetElement::remove(v13, v14);
          }
        }
        goto LABEL_13;
      }
      v12 += 604800000;
    }
    if (v12 >= 1)
    {
      pthread_mutex_lock(v4);
      UpdateRTO((unsigned int *)this + 175, v12);
      pthread_mutex_unlock(v4);
    }
  }
LABEL_13:
  *(_DWORD *)(*(void *)v7 + 1516) = 0;
  *((unsigned char *)this + a2 + 632) = 0x80;
  *(_DWORD *)(*(void *)v7 + 4) = -1;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v17 = VRTraceErrorLogLevelToCSTR();
    int v18 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = *((void *)this + 1);
      int v21 = *((_DWORD *)this + 24);
      int v20 = *((_DWORD *)this + 25);
      *(_DWORD *)buf = 136316418;
      uint64_t v45 = v17;
      __int16 v46 = 2080;
      v47 = "remove";
      __int16 v48 = 1024;
      int v49 = 817;
      __int16 v50 = 2048;
      uint64_t v51 = v19;
      __int16 v52 = 1024;
      int v53 = v20;
      __int16 v54 = 1024;
      int v55 = v21;
      _os_log_impl(&dword_221563000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p remove: send bitmap == %08X%08X", buf, 0x32u);
    }
  }
  char v22 = a2 - 32;
  if (a2 < 0x20) {
    char v22 = a2;
  }
  int v23 = 1 << v22;
  uint64_t v24 = 100;
  if (a2 < 0x20) {
    uint64_t v24 = 96;
  }
  *(_DWORD *)((char *)this + v24) &= ~v23;
  if (*((unsigned char *)this + 699))
  {
    unsigned __int8 v25 = *((unsigned char *)this + 696);
    *(void *)&long long v16 = 136316418;
LABEL_22:
    if (*((unsigned __int8 *)this + 696) == v25)
    {
      uint64_t v26 = *((void *)this + v25 + 15);
      if (!*(_DWORD *)(v26 + 12))
      {
        int v27 = ((*(_DWORD *)(v26 + 8) >> 20) & 0x3F) + 1;
        unsigned __int8 v28 = v25;
        int v29 = v27;
        while (1)
        {
          uint64_t v30 = *((void *)this + v28 + 15);
          if (*(_DWORD *)(v30 + 12) || (*(unsigned char *)(v30 + 8) & 2) == 0) {
            break;
          }
          unsigned __int8 v28 = (v28 + 1) & 0x3F;
          if (!(_BYTE)--v29)
          {
            long long v43 = v16;
            do
            {
              --v27;
              --*((unsigned char *)this + 699);
              uint64_t v31 = *((void *)this + v25 + 15);
              *(_DWORD *)(v31 + 8) &= ~2u;
              unsigned __int8 v25 = (*((unsigned char *)this + 696) + 1) & 0x3F;
              *((unsigned char *)this + 696) = v25;
            }
            while ((_BYTE)v27);
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v32 = VRTraceErrorLogLevelToCSTR();
              unint64_t v33 = *MEMORY[0x263F21098];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v34 = *((void *)this + 1);
                int v35 = *((unsigned __int8 *)this + 696);
                int v36 = *((_DWORD *)this + 26);
                *(_DWORD *)buf = v43;
                uint64_t v45 = v32;
                __int16 v46 = 2080;
                v47 = "remove";
                __int16 v48 = 1024;
                int v49 = 858;
                __int16 v50 = 2048;
                uint64_t v51 = v34;
                __int16 v52 = 1024;
                int v53 = v35;
                __int16 v54 = 1024;
                int v55 = v36;
                _os_log_impl(&dword_221563000, v33, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p remove: SET HEAD (%02d) FOR (%08X)...", buf, 0x32u);
              }
            }
            long long v16 = v43;
            if (*((unsigned char *)this + 699)) {
              goto LABEL_22;
            }
            break;
          }
        }
      }
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v37 = VRTraceErrorLogLevelToCSTR();
    int v38 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v39 = *((void *)this + 1);
      int v41 = *((_DWORD *)this + 24);
      int v40 = *((_DWORD *)this + 25);
      *(_DWORD *)buf = 136316418;
      uint64_t v45 = v37;
      __int16 v46 = 2080;
      v47 = "remove";
      __int16 v48 = 1024;
      int v49 = 861;
      __int16 v50 = 2048;
      uint64_t v51 = v39;
      __int16 v52 = 1024;
      int v53 = v40;
      __int16 v54 = 1024;
      int v55 = v41;
      _os_log_impl(&dword_221563000, v38, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p remove: done bitmap == %08X%08X", buf, 0x32u);
    }
  }
  uint64_t v15 = 1;
LABEL_38:
  pthread_mutex_unlock(v4);
  return v15;
}

BOOL associationSetElementEqual(_DWORD *a1, _DWORD *a2)
{
  return a1[26] == a2[26];
}

uint64_t associationSetElementHashCode(unsigned int *a1)
{
  return a1[26];
}

const void *retainAssociationSetElement(const __CFAllocator *a1, const void *a2)
{
  return a2;
}

void releaseAssociationSetElement(const __CFAllocator *a1, void *a2)
{
  uint64_t v2 = a2[1];
  a2[2] = *(void *)(v2 + 200);
  *(void *)(v2 + 200) = a2;
}

uint64_t checkSendingSet(char *a1, char *a2)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  int v20 = (pthread_mutex_t *)(a2 + 64);
  pthread_mutex_lock((pthread_mutex_t *)a2 + 1);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 32));
  for (int i = 0; i != 64; ++i)
  {
    uint64_t v5 = ((_BYTE)i + a1[698]) & 0x3F;
    uint64_t v6 = *(unsigned __int8 **)&a1[8 * v5 + 120];
    if (v6 && *((_DWORD *)v6 + 3) && (v6[8] & 2) != 0 && *((_DWORD *)v6 + 1) != -1)
    {
      int v7 = CAGP::current_timestamp((CAGP *)a2);
      int v8 = v7 - *((_DWORD *)v6 + 1);
      if (v8 < 0)
      {
        if (v8 < 0xEDF9BE01)
        {
          v8 += 604800000;
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v9 = VRTraceErrorLogLevelToCSTR();
          int v10 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            uint64_t v36 = v9;
            LOWORD(v37[0]) = 2080;
            *(void *)((char *)v37 + 2) = "checkSendingSet";
            HIWORD(v37[2]) = 1024;
            v37[3] = 926;
            _os_log_error_impl(&dword_221563000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d ERROR: CAN'T RESEND (BAD TIMESTAMP) !!!!!!!!!!!!", buf, 0x1Cu);
          }
        }
      }
      int v11 = *((_DWORD *)a1 + 178);
      if (v11 && v8 > 3 * v11)
      {
        memset(v37, 170, 0x5D0uLL);
        buf[0] = 5;
        buf[1] = a1[v5 + 632];
        *(_WORD *)&buf[2] = 0;
        int v12 = *((_DWORD *)a1 + 26);
        LODWORD(v36) = *((_DWORD *)a2 + 4);
        HIDWORD(v36) = v12;
        v37[0] = *(_DWORD *)v6;
        v37[1] = *((_DWORD *)v6 + 2) & 0x3FFFF03 | (4 * (a1[698] & 0x3F)) | (a1[697] << 26);
        *((_DWORD *)v6 + 1) = v7;
        ++*((_DWORD *)v6 + 379);
        memcpy(&v37[2], v6 + 16, *((unsigned int *)v6 + 3));
        *(_WORD *)&buf[2] = agp_control::generate_checksum((agp_control *)buf, v6 + 16, *((_DWORD *)v6 + 3));
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v13 = VRTraceErrorLogLevelToCSTR();
          int v14 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            int v15 = *(_DWORD *)v6;
            int v16 = *((_DWORD *)a1 + 26);
            *(_DWORD *)int v21 = 136316674;
            uint64_t v22 = v13;
            __int16 v23 = 2080;
            uint64_t v24 = "checkSendingSet";
            __int16 v25 = 1024;
            int v26 = 957;
            __int16 v27 = 2048;
            unsigned __int8 v28 = a2;
            __int16 v29 = 1024;
            int v30 = v15;
            __int16 v31 = 1024;
            int v32 = v16;
            __int16 v33 = 1024;
            int v34 = v5;
            _os_log_impl(&dword_221563000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p check: RESEND serial number %08X to destination %08X INDEX %d", v21, 0x38u);
          }
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v17 = VRTraceErrorLogLevelToCSTR();
          int v18 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)int v21 = 136316162;
            uint64_t v22 = v17;
            __int16 v23 = 2080;
            uint64_t v24 = "checkSendingSet";
            __int16 v25 = 1024;
            int v26 = 959;
            __int16 v27 = 2048;
            unsigned __int8 v28 = a2;
            __int16 v29 = 1024;
            int v30 = v5;
            _os_log_impl(&dword_221563000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p check: RESEND INDEX %d", v21, 0x2Cu);
          }
        }
        GCKSessionSendTo(*((void *)a2 + 3));
      }
    }
  }
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 32));
  return pthread_mutex_unlock(v20);
}

uint64_t agp_control::generate_checksum(agp_control *this, unsigned __int8 *a2, int a3)
{
  if (*(unsigned char *)this)
  {
    __int16 v3 = 0;
    int v4 = 2 * *(unsigned __int8 *)this;
    do
    {
      __int16 v5 = *(_WORD *)this;
      this = (agp_control *)((char *)this + 2);
      v3 += v5;
      --v4;
    }
    while (v4);
    if (!a2) {
      return (unsigned __int16)~v3;
    }
  }
  else
  {
    __int16 v3 = 0;
    if (!a2) {
      return (unsigned __int16)~v3;
    }
  }
  if (a3 >= 2)
  {
    unsigned int v6 = a3 >> 1;
    do
    {
      __int16 v7 = *(_WORD *)a2;
      a2 += 2;
      v3 += v7;
      --v6;
    }
    while (v6);
  }
  if (a3) {
    v3 += *a2;
  }
  return (unsigned __int16)~v3;
}

void AGPTransportCallback(void *a1, unsigned int *a2, int a3, unsigned __int8 *a4, int a5, unsigned __int8 *a6, int a7, unsigned __int8 a8, char a9, char a10)
{
}

void sub_22156ED94(_Unwind_Exception *a1)
{
  MEMORY[0x223C84EC0](v1, 0x1060C40E2738600);
  _Unwind_Resume(a1);
}

void *CAGP::sendingSetElement(pthread_mutex_t *this, int a2)
{
  int v4 = this + 1;
  pthread_mutex_lock(this + 1);
  CFSetRef v5 = *(const __CFSet **)&this->__opaque[32];
  unsigned int v6 = *(_DWORD **)&this->__opaque[40];
  v6[26] = a2;
  value = 0;
  if (!CFSetGetValueIfPresent(v5, v6, (const void **)&value)) {
    operator new();
  }
  pthread_mutex_unlock(v4);
  return value;
}

void sub_22156EE5C(_Unwind_Exception *a1)
{
  MEMORY[0x223C84EC0](v1, 0x10A1C404616C3E8);
  _Unwind_Resume(a1);
}

uint64_t AGPDataQueue::disconnect(uint64_t **this, unsigned int *a2, int a3)
{
  unsigned int v6 = (pthread_mutex_t *)(this + 1);
  pthread_mutex_lock((pthread_mutex_t *)(this + 1));
  if (a3 >= 1)
  {
    uint64_t v7 = 0;
    int v8 = *this;
    do
    {
      if (v8)
      {
        unsigned int v9 = a2[v7];
        int v10 = v8;
        do
        {
          uint64_t v11 = *((unsigned int *)v10 + 18);
          if ((int)v11 >= 1)
          {
            uint64_t v12 = 0;
            while (*((_DWORD *)v10 + v12 + 2) != v9)
            {
              if (v11 == ++v12) {
                goto LABEL_13;
              }
            }
            LODWORD(v11) = v11 - 1;
            if ((int)v11 > (int)v12)
            {
              do
              {
                *((_DWORD *)v10 + v12 + 2) = *((_DWORD *)v10 + v12 + 3);
                uint64_t v11 = *((int *)v10 + 18) - 1;
                ++v12;
              }
              while (v12 < v11);
            }
            *((_DWORD *)v10 + 18) = v11;
          }
LABEL_13:
          int v10 = (uint64_t *)*v10;
        }
        while (v10);
      }
      ++v7;
    }
    while (v7 != a3);
  }
  return pthread_mutex_unlock(v6);
}

uint64_t AGPSessionSendTo(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  if (a3 >= 1 && a4 && a5 >= 1) {
    CheckInHandleDebug();
  }
  return 0;
}

void AGPSessionCreate()
{
}

void sub_22156F588(_Unwind_Exception *a1)
{
  MEMORY[0x223C84EC0](v1, 0x10A0C40A2D6C30DLL);
  _Unwind_Resume(a1);
}

void AGPSessionRelease()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v0 = VRTraceErrorLogLevelToCSTR();
    uint64_t v1 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v2 = 136315650;
      uint64_t v3 = v0;
      __int16 v4 = 2080;
      CFSetRef v5 = "AGPSessionRelease";
      __int16 v6 = 1024;
      int v7 = 1193;
      _os_log_impl(&dword_221563000, v1, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d agpsessionrelease: entering...", (uint8_t *)&v2, 0x1Cu);
    }
  }
  CheckInHandleDebug();
}

void sub_22156F834(_Unwind_Exception *a1)
{
  MEMORY[0x223C84EC0](v1, 0x10A0C40A2D6C30DLL);
  _Unwind_Resume(a1);
}

uint64_t AGPDataQueue::add_tail(uint64_t a1, void *a2)
{
  uint64_t v3 = (void **)a1;
  __int16 v4 = (pthread_mutex_t *)(a1 + 8);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 8));
  for (int i = *v3; i; int i = (void *)*i)
  {
    uint64_t v3 = (void **)i;
    if (i == a2) {
      a2 = 0;
    }
  }
  *uint64_t v3 = a2;
  return pthread_mutex_unlock(v4);
}

void AGPSessionSendAudioTo()
{
}

uint64_t AGPSessionRecvFrom(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3 = 0;
  uint64_t v260 = *MEMORY[0x263EF8340];
  unsigned int v242 = a2;
  if (!a1 || !a3) {
    return v3;
  }
  if (!*(void *)(a3 + 8) || (*(_DWORD *)(a3 + 16) - 1) > 0x5DB) {
    return 0;
  }
  int v7 = (pthread_mutex_t *)(a1 + 128);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 128));
  uint64_t v8 = (AGPSendingSetElement *)CAGP::receiveSetElement((CAGP *)a1, a2);
  unsigned int v9 = *(unsigned __int8 **)(a3 + 8);
  uint64_t v10 = 4 * *v9;
  int v11 = *(_DWORD *)(a3 + 16);
  if (v11 < (int)v10 || v8 == 0) {
    goto LABEL_10;
  }
  v241 = v8;
  int v13 = *((unsigned __int16 *)v9 + 1);
  *((_WORD *)v9 + 1) = 0;
  int checksum = agp_control::generate_checksum((agp_control *)v9, &v9[v10], v11 - (int)v10);
  if (v13 != checksum)
  {
    int v16 = checksum;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      int v18 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        int v248 = 136316162;
        uint64_t v249 = v17;
        *(_WORD *)v250 = 2080;
        *(void *)&v250[2] = "AGPSessionRecvFrom";
        __int16 v251 = 1024;
        int v252 = 1461;
        __int16 v253 = 2048;
        *(void *)v254 = a1;
        *(_WORD *)&v254[8] = 1024;
        *(_DWORD *)v255 = v13;
        _os_log_impl(&dword_221563000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p recv: packet checksum == (%04x)...", (uint8_t *)&v248, 0x2Cu);
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_10;
    }
    uint64_t v19 = VRTraceErrorLogLevelToCSTR();
    int v20 = *MEMORY[0x263F21098];
    uint64_t v3 = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    int v248 = 136316162;
    uint64_t v249 = v19;
    *(_WORD *)v250 = 2080;
    *(void *)&v250[2] = "AGPSessionRecvFrom";
    __int16 v251 = 1024;
    int v252 = 1462;
    __int16 v253 = 2048;
    *(void *)v254 = a1;
    *(_WORD *)&v254[8] = 1024;
    *(_DWORD *)v255 = v16;
    int v21 = " [%s] %s:%d %p recv: calculated checksum == (%04x)...";
    goto LABEL_23;
  }
  unsigned int v15 = v9[1];
  if (v15 >= 2 && v15 != 11)
  {
    if (v15 == 2)
    {
      *(void *)(a3 + 8) += v10;
      *(_DWORD *)(a3 + 16) -= v10;
      uint64_t v3 = 1;
      goto LABEL_11;
    }
LABEL_10:
    uint64_t v3 = 0;
LABEL_11:
    pthread_mutex_unlock(v7);
    return v3;
  }
  uint64_t v24 = 0;
  __int16 v25 = v241;
  do
  {
    if (v24 + 20 > v10) {
      goto LABEL_10;
    }
    int v26 = *(_DWORD *)&v9[v24 + 8];
    v24 += 12;
  }
  while (v26 != *(_DWORD *)(a1 + 16));
  *(void *)(a3 + 8) += v10;
  *(_DWORD *)(a3 + 16) -= v10;
  if (v15 < 2)
  {
    unsigned int v39 = *(_DWORD *)&v9[v24];
    unsigned int v40 = *((_DWORD *)v25 + 27);
    if (v39 < v40 && *((_DWORD *)v25 + 28) != -1)
    {
      int v41 = CAGP::current_timestamp((CAGP *)a1) - *((_DWORD *)v25 + 28);
      if (v41 <= -302400000) {
        int v42 = v41 + 604800000;
      }
      else {
        int v42 = v41;
      }
      if (v42 > 1000)
      {
        v229 = v7;
        v230 = v9;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v43 = VRTraceErrorLogLevelToCSTR();
          int v44 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            int v248 = 136316418;
            uint64_t v249 = v43;
            *(_WORD *)v250 = 2080;
            *(void *)&v250[2] = "AGPSessionRecvFrom";
            __int16 v251 = 1024;
            int v252 = 1500;
            __int16 v253 = 2048;
            *(void *)v254 = a1;
            *(_WORD *)&v254[8] = 1024;
            *(_DWORD *)v255 = v42;
            *(_WORD *)&v255[4] = 1024;
            *(_DWORD *)v256 = a2;
            uint64_t v45 = " [%s] %s:%d %p recv: FORCE ACK ONLY for timeout %08X from remoteID %08X";
            __int16 v46 = v44;
LABEL_43:
            _os_log_impl(&dword_221563000, v46, OS_LOG_TYPE_DEFAULT, v45, (uint8_t *)&v248, 0x32u);
            goto LABEL_213;
          }
        }
        goto LABEL_213;
      }
      unsigned int v39 = *(_DWORD *)&v9[v24];
      unsigned int v40 = *((_DWORD *)v25 + 27);
    }
    if (v39 < v40)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_10;
      }
      uint64_t v90 = VRTraceErrorLogLevelToCSTR();
      v91 = *MEMORY[0x263F21098];
      uint64_t v3 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      int v92 = *(_DWORD *)&v9[v24];
      int v93 = *((_DWORD *)v25 + 27);
      int v248 = 136316162;
      uint64_t v249 = v90;
      *(_WORD *)v250 = 2080;
      *(void *)&v250[2] = "AGPSessionRecvFrom";
      __int16 v251 = 1024;
      int v252 = 1784;
      __int16 v253 = 1024;
      *(_DWORD *)v254 = v92;
      *(_WORD *)&v254[4] = 1024;
      *(_DWORD *)&v254[6] = v93;
      int v21 = " [%s] %s:%d recv: SERIAL NUMBER MISMATCH (%08X:%08X)...";
      uint64_t v22 = v91;
      uint32_t v23 = 40;
      goto LABEL_24;
    }
    v94 = v25;
    unint64_t v95 = ((unint64_t)*(unsigned int *)&v9[v24 + 4] >> 8) & 0x3F;
    v96 = (_DWORD *)*((void *)v94 + v95 + 15);
    if (v96)
    {
      if (!v96[3])
      {
        v227 = &v9[v24];
        v229 = v7;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v109 = VRTraceErrorLogLevelToCSTR();
          v110 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            int v111 = *(_DWORD *)&v9[v24];
            int v248 = 136316674;
            uint64_t v249 = v109;
            *(_WORD *)v250 = 2080;
            *(void *)&v250[2] = "AGPSessionRecvFrom";
            __int16 v251 = 1024;
            int v252 = 1521;
            __int16 v253 = 2048;
            *(void *)v254 = a1;
            *(_WORD *)&v254[8] = 1024;
            *(_DWORD *)v255 = v95;
            *(_WORD *)&v255[4] = 1024;
            *(_DWORD *)v256 = v111;
            *(_WORD *)&v256[4] = 1024;
            int v257 = a2;
            _os_log_impl(&dword_221563000, v110, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p recv: INCOMING BUFFER %d for packet serial_number %08X from remoteID %08X", (uint8_t *)&v248, 0x38u);
          }
        }
        *((unsigned char *)v241 + v95 + 632) = v9[1];
        memcpy(v96 + 4, *(const void **)(a3 + 8), *(int *)(a3 + 16));
        _DWORD *v96 = *(_DWORD *)&v9[v24];
        v112 = v227;
        v96[2] = *((_DWORD *)v227 + 1);
        v96[3] = *(_DWORD *)(a3 + 16);
        v230 = v9;
        unsigned int v113 = *((_DWORD *)v112 + 1);
        unsigned int v114 = v113 >> 14;
        LODWORD(v112) = (v113 >> 14) & 0x3F;
        LODWORD(v237) = *(_DWORD *)&v9[v24] - v112;
        unsigned int v238 = v113;
        v239 = (pthread_mutex_t *)(((v113 >> 8) & 0x3F) - v112);
        *(void *)&long long v236 = a1 + 288;
        uint64_t v228 = a1 + 296;
        *(void *)&long long v115 = 136316930;
        long long v226 = v115;
        *(void *)&long long v115 = 136316418;
        long long v235 = v115;
        *(void *)&long long v115 = 136316674;
        long long v234 = v115;
        *(void *)&long long v115 = 136316162;
        long long v225 = v115;
        while (1)
        {
          int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
          LODWORD(v232) = (v238 >> 20) & 0x3F;
          LODWORD(v240) = v232 + 1;
          if (ErrorLogLevelForModule >= 7)
          {
            uint64_t v117 = VRTraceErrorLogLevelToCSTR();
            v118 = *MEMORY[0x263F21098];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
            {
              int v119 = *(_DWORD *)&v230[v24];
              int v120 = (*((_DWORD *)v227 + 1) >> 8) & 0x3F;
              int v248 = v226;
              uint64_t v249 = v117;
              *(_WORD *)v250 = 2080;
              *(void *)&v250[2] = "AGPSessionRecvFrom";
              __int16 v251 = 1024;
              int v252 = 1555;
              __int16 v253 = 2048;
              *(void *)v254 = a1;
              *(_WORD *)&v254[8] = 1024;
              *(_DWORD *)v255 = (v114 & 0x3F) + 1;
              *(_WORD *)&v255[4] = 1024;
              *(_DWORD *)v256 = v240;
              *(_WORD *)&v256[4] = 1024;
              int v257 = v119;
              __int16 v258 = 1024;
              int v259 = v120;
              _os_log_impl(&dword_221563000, v118, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p recv: got chunk segment %d of %d segments (%08X) @index %d", (uint8_t *)&v248, 0x3Eu);
            }
          }
          int v121 = 0;
          char v122 = 1;
          LODWORD(v233) = 1;
          do
          {
            uint64_t v123 = ((_BYTE)v239 + (_BYTE)v121) & 0x3F;
            v124 = (int *)*((void *)v241 + v123 + 15);
            if (v124 && v124[3] && (unsigned int v125 = v124[2], ((v125 ^ v238) & 0x3F00000) == 0) && v237 + v121 == *v124)
            {
              if (v121 != ((v125 >> 14) & 0x3F) && (int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                uint64_t v126 = VRTraceErrorLogLevelToCSTR();
                v127 = *MEMORY[0x263F21098];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR))
                {
                  int v131 = *v124;
                  int v132 = (v124[2] >> 14) & 0x3F;
                  int v248 = v234;
                  uint64_t v249 = v126;
                  *(_WORD *)v250 = 2080;
                  *(void *)&v250[2] = "AGPSessionRecvFrom";
                  __int16 v251 = 1024;
                  int v252 = 1569;
                  __int16 v253 = 1024;
                  *(_DWORD *)v254 = v123;
                  *(_WORD *)&v254[4] = 1024;
                  *(_DWORD *)&v254[6] = v131;
                  *(_WORD *)v255 = 1024;
                  *(_DWORD *)&v255[2] = v132;
                  *(_WORD *)v256 = 1024;
                  *(_DWORD *)&v256[2] = v121;
                  _os_log_error_impl(&dword_221563000, v127, OS_LOG_TYPE_ERROR, " [%s] %s:%d FAIL: message fragment @index %d ser %08X seg_idx %d should be %d", (uint8_t *)&v248, 0x34u);
                }
              }
              LODWORD(v233) = (*((unsigned char *)v241 + v123 + 632) != 1) & v233;
            }
            else
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                uint64_t v128 = VRTraceErrorLogLevelToCSTR();
                v129 = *MEMORY[0x263F21098];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR))
                {
                  if (v124) {
                    int v130 = *v124;
                  }
                  else {
                    int v130 = 0;
                  }
                  int v248 = v235;
                  uint64_t v249 = v128;
                  *(_WORD *)v250 = 2080;
                  *(void *)&v250[2] = "AGPSessionRecvFrom";
                  __int16 v251 = 1024;
                  int v252 = 1565;
                  __int16 v253 = 1024;
                  *(_DWORD *)v254 = v123;
                  *(_WORD *)&v254[4] = 1024;
                  *(_DWORD *)&v254[6] = v130;
                  *(_WORD *)v255 = 1024;
                  *(_DWORD *)&v255[2] = v237 + v121;
                  _os_log_error_impl(&dword_221563000, v129, OS_LOG_TYPE_ERROR, " [%s] %s:%d fail: message fragment @index %d ser %08X should be %08X", (uint8_t *)&v248, 0x2Eu);
                }
              }
              char v122 = 0;
            }
            ++v121;
          }
          while (v240 != v121);
          if ((v122 & 1) == 0) {
            goto LABEL_213;
          }
          int v133 = v239;
          v134 = v241;
          if (v239 != *((unsigned __int8 *)v241 + 696))
          {
            int v135 = VRTraceGetErrorLogLevelForModule();
            v134 = v241;
            if (v135 >= 7)
            {
              uint64_t v136 = VRTraceErrorLogLevelToCSTR();
              v137 = *MEMORY[0x263F21098];
              BOOL v138 = os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT);
              v134 = v241;
              if (v138)
              {
                int v139 = *((unsigned __int8 *)v241 + 696);
                int v248 = v225;
                uint64_t v249 = v136;
                *(_WORD *)v250 = 2080;
                *(void *)&v250[2] = "AGPSessionRecvFrom";
                __int16 v251 = 1024;
                int v252 = 1580;
                __int16 v253 = 1024;
                *(_DWORD *)v254 = v133;
                *(_WORD *)&v254[4] = 1024;
                *(_DWORD *)&v254[6] = v139;
                _os_log_impl(&dword_221563000, v137, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d START %d != HEAD %d", (uint8_t *)&v248, 0x28u);
              }
            }
          }
          if (v237 != *((_DWORD *)v134 + 27)) {
            break;
          }
          v140 = AGPDataQueue::peek_head_for_participant((AGPDataQueue *)v236, v242);
          os_log_t v231 = (os_log_t)&v225;
          unsigned int v141 = v233 ^ 1;
          *(_OWORD *)v243 = *(_OWORD *)a3;
          *(void *)&v243[16] = *(void *)(a3 + 16);
          MEMORY[0x270FA5388](v140);
          v143 = (char *)&v225 - v142;
          memset((char *)&v225 - v142, 170, v144);
          int v145 = 0;
          if (v232) {
            BOOL v146 = 0;
          }
          else {
            BOOL v146 = v140 == 0;
          }
          int v147 = !v146;
          unsigned int v238 = v147 | v141;
          v148 = v143;
          int v149 = (int)v143;
          *(void *)&long long v237 = v143;
          do
          {
            v150 = (_DWORD *)*((void *)v241 + ((v239 + v145) & 0x3F) + 15);
            *((unsigned char *)v241 + 696) = (*((unsigned char *)v241 + 696) + 1) & 0x3F;
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v151 = VRTraceErrorLogLevelToCSTR();
              v152 = *MEMORY[0x263F21098];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
              {
                int v153 = *v150;
                unsigned int v154 = v150[2];
                int v248 = v234;
                uint64_t v249 = v151;
                *(_WORD *)v250 = 2080;
                *(void *)&v250[2] = "AGPSessionRecvFrom";
                __int16 v251 = 1024;
                int v252 = 1612;
                __int16 v253 = 1024;
                *(_DWORD *)v254 = v153;
                *(_WORD *)&v254[4] = 1024;
                *(_DWORD *)&v254[6] = (v154 >> 14) & 0x3F;
                *(_WORD *)v255 = 1024;
                *(_DWORD *)&v255[2] = (v154 >> 20) & 0x3F;
                *(_WORD *)v256 = 1024;
                *(_DWORD *)&v256[2] = v242;
                _os_log_impl(&dword_221563000, v152, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d recv : deliver (%08X:%02d:%02d) from remoteID %08X...", (uint8_t *)&v248, 0x34u);
              }
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v155 = VRTraceErrorLogLevelToCSTR();
              v156 = *MEMORY[0x263F21098];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
              {
                int v157 = *v150;
                unsigned int v158 = v150[2];
                int v248 = v235;
                uint64_t v249 = v155;
                *(_WORD *)v250 = 2080;
                *(void *)&v250[2] = "AGPSessionRecvFrom";
                __int16 v251 = 1024;
                int v252 = 1614;
                __int16 v253 = 1024;
                *(_DWORD *)v254 = v157;
                *(_WORD *)&v254[4] = 1024;
                *(_DWORD *)&v254[6] = (v158 >> 14) & 0x3F;
                *(_WORD *)v255 = 1024;
                *(_DWORD *)&v255[2] = (v158 >> 20) & 0x3F;
                _os_log_impl(&dword_221563000, v156, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d recv : deliver (%08X:%02d:%02d)...", (uint8_t *)&v248, 0x2Eu);
              }
            }
            ++*((_DWORD *)v241 + 27);
            if (v238) {
              memcpy(v148, v150 + 4, v150[3]);
            }
            else {
              *(void *)&long long v237 = v150 + 4;
            }
            v148 += v150[3];
            _DWORD *v150 = 0;
            *((void *)v150 + 1) = 0;
            ++v145;
          }
          while (v240 != v145);
          *(void *)&v243[8] = v237;
          *(_DWORD *)&v243[16] = v148 - v149;
          if (v238) {
            operator new();
          }
          if (v233)
          {
            (*(void (**)(void, void, unsigned char *))a1)(*(void *)(a1 + 8), v242, v243);
            if (v238) {
              CFRelease(0);
            }
          }
          v239 = (pthread_mutex_t *)*((unsigned __int8 *)v241 + 696);
          v159 = (_DWORD *)*((void *)v241 + (void)v239 + 15);
          if (!v159 || !v159[3] || *v159 != *((_DWORD *)v241 + 27)) {
            goto LABEL_213;
          }
          LODWORD(v237) = *v159;
          unsigned int v238 = v159[2];
          unsigned int v114 = v238 >> 14;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v222 = VRTraceErrorLogLevelToCSTR();
          v223 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            int v224 = *((_DWORD *)v241 + 27);
            int v248 = v235;
            uint64_t v249 = v222;
            *(_WORD *)v250 = 2080;
            *(void *)&v250[2] = "AGPSessionRecvFrom";
            __int16 v251 = 1024;
            int v252 = 1684;
            __int16 v253 = 2048;
            *(void *)v254 = a1;
            *(_WORD *)&v254[8] = 1024;
            *(_DWORD *)v255 = v237;
            *(_WORD *)&v255[4] = 1024;
            *(_DWORD *)v256 = v224;
            uint64_t v45 = " [%s] %s:%d %p recv: MESSAGE SERIAL_NUMBASE %08X ARRIVED OUT-OF-SEQUENCE %08X";
            __int16 v46 = v223;
            goto LABEL_43;
          }
        }
LABEL_213:
        *(void *)&v243[20] = 0;
        int v195 = *(_DWORD *)(a1 + 16);
        *(_DWORD *)v243 = 2823;
        *(_DWORD *)&v243[4] = v195;
        *(_DWORD *)&v243[8] = v242;
        v196 = &v230[v24];
        *(_DWORD *)&v243[12] = *(_DWORD *)&v230[v24];
        *(_DWORD *)&v243[16] = *(_DWORD *)&v230[v24 + 4] & 0xFFFFFF03 | (4 * (*((unsigned char *)v241 + 696) & 0x3F));
        unsigned int v197 = *(_DWORD *)&v230[v24 + 4];
        unsigned int v198 = v197 >> 2;
        if (v197)
        {
          BOOL v199 = v198 == v197 >> 26;
          int v200 = VRTraceGetErrorLogLevelForModule();
          if (v199)
          {
            if (v200 >= 7)
            {
              uint64_t v201 = VRTraceErrorLogLevelToCSTR();
              v202 = *MEMORY[0x263F21098];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
              {
                int v248 = 136316162;
                uint64_t v249 = v201;
                *(_WORD *)v250 = 2080;
                *(void *)&v250[2] = "AGPSessionRecvFrom";
                __int16 v251 = 1024;
                int v252 = 1713;
                __int16 v253 = 2048;
                *(void *)v254 = a1;
                *(_WORD *)&v254[8] = 1024;
                *(_DWORD *)v255 = v198;
                _os_log_impl(&dword_221563000, v202, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p recv: FORCE FULL BUFFER INDEX %d", (uint8_t *)&v248, 0x2Cu);
              }
            }
            int v203 = 1;
LABEL_223:
            int v206 = 0;
            if (v203) {
              goto LABEL_225;
            }
            while (1)
            {
              if (v198 == *((_DWORD *)v196 + 1) >> 26)
              {
                int v212 = *(_DWORD *)&v243[20];
                int v213 = *(_DWORD *)&v243[24];
                if (*(void *)&v243[20])
                {
                  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                  {
                    uint64_t v214 = VRTraceErrorLogLevelToCSTR();
                    v215 = *MEMORY[0x263F21098];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
                    {
                      int v248 = 136316418;
                      uint64_t v249 = v214;
                      *(_WORD *)v250 = 2080;
                      *(void *)&v250[2] = "AGPSessionRecvFrom";
                      __int16 v251 = 1024;
                      int v252 = 1762;
                      __int16 v253 = 2048;
                      *(void *)v254 = a1;
                      *(_WORD *)&v254[8] = 1024;
                      *(_DWORD *)v255 = v213;
                      *(_WORD *)&v255[4] = 1024;
                      *(_DWORD *)v256 = v212;
                      _os_log_impl(&dword_221563000, v215, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p data: sack bitmap == %08X%08X", (uint8_t *)&v248, 0x32u);
                    }
                  }
                }
                uint64_t v216 = 0;
                __int16 v217 = 0;
                do
                {
                  v217 += *(_WORD *)&v243[v216];
                  v216 += 2;
                }
                while (v216 != 28);
                *(_WORD *)&v243[2] = ~v217;
                *(int32x2_t *)(a1 + 384) = vadd_s32(*(int32x2_t *)(a1 + 384), (int32x2_t)0x1C00000001);
                int v218 = CAGP::current_timestamp((CAGP *)a1);
                *((_DWORD *)v241 + 28) = v218;
                pthread_mutex_unlock(v229);
                GCKSessionSendTo(*(void *)(a1 + 24));
              }
LABEL_225:
              v206 |= (v198 == *((unsigned __int8 *)v241 + 696)) & (v203 ^ 1);
              if (v206)
              {
                uint64_t v207 = *((void *)v241 + v198 + 15);
                if (v207)
                {
                  char v208 = v198 - 32;
                  if (v198 < 0x20) {
                    char v208 = v198;
                  }
                  int v209 = 1 << v208;
                  if (v198 >= 0x20) {
                    uint64_t v210 = 24;
                  }
                  else {
                    uint64_t v210 = 20;
                  }
                  if (*(_DWORD *)(v207 + 12) || (*(unsigned char *)(v207 + 8) & 2) != 0) {
                    int v211 = *(_DWORD *)&v243[v210] & ~v209;
                  }
                  else {
                    int v211 = *(_DWORD *)&v243[v210] | v209;
                  }
                  *(_DWORD *)&v243[v210] = v211;
                }
              }
              int v203 = 0;
              unsigned int v198 = (v198 + 1) & 0x3F;
            }
          }
          if (v200 >= 3)
          {
            uint64_t v204 = VRTraceErrorLogLevelToCSTR();
            v205 = *MEMORY[0x263F21098];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR))
            {
              int v248 = 136316162;
              uint64_t v249 = v204;
              *(_WORD *)v250 = 2080;
              *(void *)&v250[2] = "AGPSessionRecvFrom";
              __int16 v251 = 1024;
              int v252 = 1716;
              __int16 v253 = 2048;
              *(void *)v254 = a1;
              *(_WORD *)&v254[8] = 1024;
              *(_DWORD *)v255 = v198;
              _os_log_error_impl(&dword_221563000, v205, OS_LOG_TYPE_ERROR, " [%s] %s:%d %p recv: ERROR FULL BUFFER INDEX MISMATCH %d", (uint8_t *)&v248, 0x2Cu);
            }
          }
        }
        int v203 = 0;
        goto LABEL_223;
      }
      if (v39 == *v96)
      {
        v97 = v9;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v98 = VRTraceErrorLogLevelToCSTR();
          v99 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            int v100 = *(_DWORD *)&v97[v24];
            int v248 = 136316674;
            uint64_t v249 = v98;
            *(_WORD *)v250 = 2080;
            *(void *)&v250[2] = "AGPSessionRecvFrom";
            __int16 v251 = 1024;
            int v252 = 1530;
            __int16 v253 = 2048;
            *(void *)v254 = a1;
            *(_WORD *)&v254[8] = 1024;
            *(_DWORD *)v255 = v95;
            *(_WORD *)&v255[4] = 1024;
            *(_DWORD *)v256 = v100;
            *(_WORD *)&v256[4] = 1024;
            int v257 = a2;
            _os_log_impl(&dword_221563000, v99, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p recv: DISCARD DUPLICATE %d for packet serial_number %08X from remoteID %08X", (uint8_t *)&v248, 0x38u);
          }
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_10;
        }
        uint64_t v101 = VRTraceErrorLogLevelToCSTR();
        v102 = *MEMORY[0x263F21098];
        uint64_t v3 = 0;
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_11;
        }
        int v103 = *(_DWORD *)&v97[v24];
        int v248 = 136316418;
        uint64_t v249 = v101;
        *(_WORD *)v250 = 2080;
        *(void *)&v250[2] = "AGPSessionRecvFrom";
        __int16 v251 = 1024;
        int v252 = 1532;
        __int16 v253 = 2048;
        *(void *)v254 = a1;
        *(_WORD *)&v254[8] = 1024;
        *(_DWORD *)v255 = v95;
        *(_WORD *)&v255[4] = 1024;
        *(_DWORD *)v256 = v103;
        int v21 = " [%s] %s:%d %p recv: ERROR DUPLICATE %d for packet serial_number %08X";
        uint64_t v22 = v102;
        uint32_t v23 = 50;
        goto LABEL_24;
      }
    }
    v104 = v9;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v105 = VRTraceErrorLogLevelToCSTR();
      v106 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        int v107 = *(_DWORD *)&v104[v24];
        int v248 = 136316674;
        uint64_t v249 = v105;
        *(_WORD *)v250 = 2080;
        *(void *)&v250[2] = "AGPSessionRecvFrom";
        __int16 v251 = 1024;
        int v252 = 1534;
        __int16 v253 = 2048;
        *(void *)v254 = a1;
        *(_WORD *)&v254[8] = 1024;
        *(_DWORD *)v255 = v95;
        *(_WORD *)&v255[4] = 1024;
        *(_DWORD *)v256 = v107;
        *(_WORD *)&v256[4] = 1024;
        int v257 = a2;
        _os_log_impl(&dword_221563000, v106, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p recv: DISCARD NO BUFFER AVAILABLE %d for packet serial_number %08X from remoteID %08X", (uint8_t *)&v248, 0x38u);
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_10;
    }
    uint64_t v108 = VRTraceErrorLogLevelToCSTR();
    int v20 = *MEMORY[0x263F21098];
    uint64_t v3 = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    int v248 = 136316162;
    uint64_t v249 = v108;
    *(_WORD *)v250 = 2080;
    *(void *)&v250[2] = "AGPSessionRecvFrom";
    __int16 v251 = 1024;
    int v252 = 1536;
    __int16 v253 = 2048;
    *(void *)v254 = a1;
    *(_WORD *)&v254[8] = 1024;
    *(_DWORD *)v255 = v95;
    int v21 = " [%s] %s:%d %p recv: ERROR NO BUFFER %d";
LABEL_23:
    uint64_t v22 = v20;
    uint32_t v23 = 44;
LABEL_24:
    _os_log_impl(&dword_221563000, v22, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v248, v23);
    goto LABEL_10;
  }
  pthread_mutex_unlock(v7);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 64));
  __int16 v27 = (char *)CAGP::sendingSetElement((pthread_mutex_t *)a1, a2);
  unsigned __int8 v28 = (pthread_mutex_t *)(v27 + 32);
  pthread_mutex_lock((pthread_mutex_t *)(v27 + 32));
  uint64_t v29 = v27[696];
  int v30 = v27[699];
  v241 = (AGPSendingSetElement *)v27;
  v239 = (pthread_mutex_t *)(a1 + 64);
  if (!v30)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v47 = VRTraceErrorLogLevelToCSTR();
      uint64_t v36 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        int v48 = *(_DWORD *)&v9[v24];
        int v49 = **((_DWORD **)v241 + ((v29 - 1) & 0x3F) + 15) + 1;
        int v248 = 136316418;
        uint64_t v249 = v47;
        *(_WORD *)v250 = 2080;
        *(void *)&v250[2] = "AGPSessionRecvFrom";
        __int16 v251 = 1024;
        int v252 = 1967;
        __int16 v253 = 2048;
        *(void *)v254 = a1;
        *(_WORD *)&v254[8] = 1024;
        *(_DWORD *)v255 = v48;
        *(_WORD *)&v255[4] = 1024;
        *(_DWORD *)v256 = v49;
        uint64_t v38 = " [%s] %s:%d %p sack: RECEIVED SACK WITH LOWER SERIAL NUMBER [%08X] THAN NEXT [%08X], SKIPPING";
        goto LABEL_248;
      }
    }
    goto LABEL_249;
  }
  unsigned int v31 = **(_DWORD **)&v27[8 * v29 + 120];
  unsigned int v32 = *(_DWORD *)&v9[v24];
  int v33 = VRTraceGetErrorLogLevelForModule();
  if (v32 < v31)
  {
    if (v33 >= 7)
    {
      uint64_t v35 = VRTraceErrorLogLevelToCSTR();
      uint64_t v36 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        int v37 = *(_DWORD *)&v9[v24];
        int v248 = 136316418;
        uint64_t v249 = v35;
        *(_WORD *)v250 = 2080;
        *(void *)&v250[2] = "AGPSessionRecvFrom";
        __int16 v251 = 1024;
        int v252 = 1963;
        __int16 v253 = 2048;
        *(void *)v254 = a1;
        *(_WORD *)&v254[8] = 1024;
        *(_DWORD *)v255 = v37;
        *(_WORD *)&v255[4] = 1024;
        *(_DWORD *)v256 = v31;
        uint64_t v38 = " [%s] %s:%d %p sack: RECEIVED SACK WITH LOWER SERIAL NUMBER [%08X] THAN HEAD [%08X], SKIPPING";
        goto LABEL_248;
      }
    }
    goto LABEL_249;
  }
  *(void *)&long long v235 = v28;
  *(void *)&long long v240 = &v9[v24 + 8];
  if (v33 >= 7)
  {
    uint64_t v50 = VRTraceErrorLogLevelToCSTR();
    uint64_t v51 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v248 = 136316162;
      uint64_t v249 = v50;
      *(_WORD *)v250 = 2080;
      *(void *)&v250[2] = "AGPSessionRecvFrom";
      __int16 v251 = 1024;
      int v252 = 1817;
      __int16 v253 = 2048;
      *(void *)v254 = a1;
      *(_WORD *)&v254[8] = 1024;
      *(_DWORD *)v255 = a2;
      _os_log_impl(&dword_221563000, v51, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p sack: PROCESS SACK PACKET FROM (%08X)...", (uint8_t *)&v248, 0x2Cu);
    }
  }
  v230 = v9;
  __int16 v52 = &v9[v24];
  int v53 = &v9[v24 + 12];
  if (*(_DWORD *)v53 || *(_DWORD *)v240)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v54 = VRTraceErrorLogLevelToCSTR();
      int v55 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        int v56 = *((_DWORD *)v52 + 3);
        int v57 = *(_DWORD *)v240;
        int v248 = 136316418;
        uint64_t v249 = v54;
        *(_WORD *)v250 = 2080;
        *(void *)&v250[2] = "AGPSessionRecvFrom";
        __int16 v251 = 1024;
        int v252 = 1821;
        __int16 v253 = 2048;
        *(void *)v254 = a1;
        *(_WORD *)&v254[8] = 1024;
        *(_DWORD *)v255 = v56;
        *(_WORD *)&v255[4] = 1024;
        *(_DWORD *)v256 = v57;
        _os_log_impl(&dword_221563000, v55, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p sack: sack bitmap == %08X%08X", (uint8_t *)&v248, 0x32u);
      }
    }
    if (*((_DWORD *)v52 + 3) || *(_DWORD *)v240)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v58 = VRTraceErrorLogLevelToCSTR();
        v59 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          int v60 = *((unsigned __int8 *)v241 + 698);
          int v61 = *((unsigned __int8 *)v241 + 696);
          int v62 = *((unsigned __int8 *)v241 + 697);
          int v63 = *((unsigned __int8 *)v241 + 699);
          int v248 = 136316930;
          uint64_t v249 = v58;
          *(_WORD *)v250 = 2080;
          *(void *)&v250[2] = "AGPSessionRecvFrom";
          __int16 v251 = 1024;
          int v252 = 1829;
          __int16 v253 = 2048;
          *(void *)v254 = a1;
          *(_WORD *)&v254[8] = 1024;
          *(_DWORD *)v255 = v60;
          *(_WORD *)&v255[4] = 1024;
          *(_DWORD *)v256 = v61;
          *(_WORD *)&v256[4] = 1024;
          int v257 = v62;
          __int16 v258 = 1024;
          int v259 = v63;
          _os_log_impl(&dword_221563000, v59, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p sack: RECEIVER CLAIMS TO BE MISSING PACKETS (sender base %02d head %02d tail %02d used %02d", (uint8_t *)&v248, 0x3Eu);
        }
      }
      int v64 = 0;
      v233 = v250;
      *(void *)&long long v234 = &v250[8];
      *(void *)&long long v34 = 136316674;
      long long v237 = v34;
      *(void *)&long long v34 = 136316162;
      long long v236 = v34;
      *(void *)&long long v34 = 136315650;
      long long v232 = v34;
      while (1)
      {
        uint64_t v65 = ((_BYTE)v64 + *((unsigned char *)v241 + 698)) & 0x3F;
        if ((((_BYTE)v64 + *((unsigned char *)v241 + 698)) & 0x20) != 0) {
          char v66 = v65 - 32;
        }
        else {
          char v66 = (v64 + *((unsigned char *)v241 + 698)) & 0x3F;
        }
        v67 = (unsigned __int8 *)v240;
        if ((((_BYTE)v64 + *((unsigned char *)v241 + 698)) & 0x20) != 0) {
          v67 = v53;
        }
        if (((*(_DWORD *)v67 >> v66) & 1) == 0) {
          goto LABEL_93;
        }
        v68 = (unsigned __int8 *)*((void *)v241 + ((v64 + *((unsigned char *)v241 + 698)) & 0x3F) + 15);
        if (!v68) {
          goto LABEL_93;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v69 = VRTraceErrorLogLevelToCSTR();
          v70 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            int v71 = *((_DWORD *)v68 + 3);
            int v72 = (*((_DWORD *)v68 + 2) >> 1) & 1;
            int v248 = v237;
            uint64_t v249 = v69;
            *(_WORD *)v250 = 2080;
            *(void *)&v250[2] = "AGPSessionRecvFrom";
            __int16 v251 = 1024;
            int v252 = 1848;
            __int16 v253 = 2048;
            *(void *)v254 = a1;
            *(_WORD *)&v254[8] = 1024;
            *(_DWORD *)v255 = v65;
            *(_WORD *)&v255[4] = 1024;
            *(_DWORD *)v256 = v71;
            *(_WORD *)&v256[4] = 1024;
            int v257 = v72;
            _os_log_impl(&dword_221563000, v70, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p sack: TEST INDEX %d len == %d ack_pending = %01d ", (uint8_t *)&v248, 0x38u);
          }
        }
        if (*((_DWORD *)v68 + 3) && (v68[8] & 2) != 0 && *((_DWORD *)v68 + 1) != -1) {
          break;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_93;
        }
        uint64_t v76 = VRTraceErrorLogLevelToCSTR();
        v77 = *MEMORY[0x263F21098];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_93;
        }
        int v248 = v236;
        uint64_t v249 = v76;
        *(_WORD *)v250 = 2080;
        *(void *)&v250[2] = "AGPSessionRecvFrom";
        __int16 v251 = 1024;
        int v252 = 1897;
        __int16 v253 = 2048;
        *(void *)v254 = a1;
        *(_WORD *)&v254[8] = 1024;
        *(_DWORD *)v255 = v65;
        v78 = v77;
        v79 = " [%s] %s:%d %p sack: CAN'T RESEND INDEX %d";
        uint32_t v80 = 44;
LABEL_82:
        _os_log_impl(&dword_221563000, v78, OS_LOG_TYPE_DEFAULT, v79, (uint8_t *)&v248, v80);
LABEL_93:
        if (++v64 == 64) {
          goto LABEL_94;
        }
      }
      int v73 = CAGP::current_timestamp((CAGP *)a1);
      int v74 = v73 - *((_DWORD *)v68 + 1);
      if (v74 < 0)
      {
        if (v74 > 0xEDF9BE00)
        {
          unsigned int v238 = v73 - *((_DWORD *)v68 + 1);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v75 = VRTraceErrorLogLevelToCSTR();
            os_log_t v231 = (os_log_t)*MEMORY[0x263F21098];
            if (os_log_type_enabled(v231, OS_LOG_TYPE_ERROR))
            {
              int v248 = v232;
              uint64_t v249 = v75;
              *(_WORD *)v250 = 2080;
              *(void *)&v250[2] = "AGPSessionRecvFrom";
              __int16 v251 = 1024;
              int v252 = 1856;
              _os_log_error_impl(&dword_221563000, v231, OS_LOG_TYPE_ERROR, " [%s] %s:%d ERROR: CAN'T RESEND (BAD TIMESTAMP) !!!!!!!!!!!!", (uint8_t *)&v248, 0x1Cu);
            }
          }
          goto LABEL_85;
        }
        v74 += 604800000;
      }
      unsigned int v238 = v74;
LABEL_85:
      if ((signed int)v238 > *((_DWORD *)v241 + 178))
      {
        memset(v233, 170, 0x5D0uLL);
        LOBYTE(v248) = 5;
        BYTE1(v248) = *((unsigned char *)v241 + v65 + 632);
        HIWORD(v248) = 0;
        LODWORD(v249) = *(_DWORD *)(a1 + 16);
        HIDWORD(v249) = v242;
        *(_DWORD *)v250 = *(_DWORD *)v68;
        *(_DWORD *)&v250[4] = *((_DWORD *)v68 + 2) & 0x3FFFF03 | (4 * (*((unsigned char *)v241 + 698) & 0x3F)) | (*((unsigned __int8 *)v241 + 697) << 26);
        *((_DWORD *)v68 + 1) = v73;
        ++*((_DWORD *)v68 + 379);
        memcpy((void *)v234, v68 + 16, *((unsigned int *)v68 + 3));
        HIWORD(v248) = agp_control::generate_checksum((agp_control *)&v248, v68 + 16, *((_DWORD *)v68 + 3));
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v81 = VRTraceErrorLogLevelToCSTR();
          v82 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v243 = v236;
            *(void *)&v243[4] = v81;
            *(_WORD *)&v243[12] = 2080;
            *(void *)&v243[14] = "AGPSessionRecvFrom";
            *(_WORD *)&v243[22] = 1024;
            *(_DWORD *)&v243[24] = 1888;
            __int16 v244 = 2048;
            uint64_t v245 = a1;
            __int16 v246 = 1024;
            int v247 = v65;
            _os_log_impl(&dword_221563000, v82, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p sack: RESEND INDEX %d", v243, 0x2Cu);
          }
        }
        GCKSessionSendTo(*(void *)(a1 + 24));
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_93;
      }
      uint64_t v83 = VRTraceErrorLogLevelToCSTR();
      v84 = *MEMORY[0x263F21098];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_93;
      }
      int v85 = *((_DWORD *)v241 + 178);
      int v248 = v237;
      uint64_t v249 = v83;
      *(_WORD *)v250 = 2080;
      *(void *)&v250[2] = "AGPSessionRecvFrom";
      __int16 v251 = 1024;
      int v252 = 1894;
      __int16 v253 = 2048;
      *(void *)v254 = a1;
      *(_WORD *)&v254[8] = 1024;
      *(_DWORD *)v255 = v65;
      *(_WORD *)&v255[4] = 1024;
      *(_DWORD *)v256 = v238;
      *(_WORD *)&v256[4] = 1024;
      int v257 = v85;
      v78 = v84;
      v79 = " [%s] %s:%d %p sack: RESEND ABORT %d ELAPSED_TIME (%04d) < RTO (%04d)";
      uint32_t v80 = 56;
      goto LABEL_82;
    }
  }
LABEL_94:
  v86 = v241;
  int v87 = *((unsigned __int8 *)v241 + 698);
  v88 = &v230[v24];
  if (*(_DWORD *)&v230[v24 + 4] >> 2 == v87)
  {
    int v89 = 0;
    goto LABEL_201;
  }
  int v89 = 0;
  *(void *)&long long v34 = 136316418;
  long long v240 = v34;
  do
  {
    uint64_t v160 = *((void *)v86 + v87 + 15);
    if (!v160) {
      break;
    }
    if (!*(_DWORD *)(v160 + 12) || (*(unsigned char *)(v160 + 8) & 2) == 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_194;
      }
      uint64_t v161 = VRTraceErrorLogLevelToCSTR();
      v162 = *MEMORY[0x263F21098];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_194;
      }
      int v163 = *(_DWORD *)v160;
      int v248 = v240;
      uint64_t v249 = v161;
      *(_WORD *)v250 = 2080;
      *(void *)&v250[2] = "AGPSessionRecvFrom";
      __int16 v251 = 1024;
      int v252 = 1930;
      __int16 v253 = 2048;
      *(void *)v254 = a1;
      *(_WORD *)&v254[8] = 1024;
      *(_DWORD *)v255 = v163;
      *(_WORD *)&v255[4] = 1024;
      *(_DWORD *)v256 = v242;
      v164 = v162;
      v165 = " [%s] %s:%d %p sack: BUFFER MISSING SERIAL NUMBER (%08X) FROM (%08X)...";
      goto LABEL_181;
    }
    int v166 = AGPSendingSetElement::search(v86, *(_DWORD *)v160);
    if (v166 < 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_194;
      }
      uint64_t v172 = VRTraceErrorLogLevelToCSTR();
      v173 = *MEMORY[0x263F21098];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_194;
      }
      int v174 = *(_DWORD *)v160;
      int v248 = v240;
      uint64_t v249 = v172;
      *(_WORD *)v250 = 2080;
      *(void *)&v250[2] = "AGPSessionRecvFrom";
      __int16 v251 = 1024;
      int v252 = 1926;
      __int16 v253 = 2048;
      *(void *)v254 = a1;
      *(_WORD *)&v254[8] = 1024;
      *(_DWORD *)v255 = v174;
      *(_WORD *)&v255[4] = 1024;
      *(_DWORD *)v256 = v242;
      v164 = v173;
      v165 = " [%s] %s:%d %p sack: SEARCH FAILURE SERIAL NUMBER (%08X) FROM (%08X)...";
      goto LABEL_181;
    }
    int v167 = AGPSendingSetElement::remove(v241, v166);
    int v168 = VRTraceGetErrorLogLevelForModule();
    if (v167)
    {
      if (v168 >= 7)
      {
        uint64_t v169 = VRTraceErrorLogLevelToCSTR();
        v170 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          int v171 = *(_DWORD *)v160;
          int v248 = v240;
          uint64_t v249 = v169;
          *(_WORD *)v250 = 2080;
          *(void *)&v250[2] = "AGPSessionRecvFrom";
          __int16 v251 = 1024;
          int v252 = 1921;
          __int16 v253 = 2048;
          *(void *)v254 = a1;
          *(_WORD *)&v254[8] = 1024;
          *(_DWORD *)v255 = v171;
          *(_WORD *)&v255[4] = 1024;
          *(_DWORD *)v256 = v242;
          _os_log_impl(&dword_221563000, v170, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p sack: REMOVED PACKET SERIAL NUMBER (%08X) FROM (%08X)...", (uint8_t *)&v248, 0x32u);
        }
      }
      int v89 = 1;
      goto LABEL_194;
    }
    if (v168 >= 7)
    {
      uint64_t v175 = VRTraceErrorLogLevelToCSTR();
      v176 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        int v177 = *(_DWORD *)v160;
        int v248 = v240;
        uint64_t v249 = v175;
        *(_WORD *)v250 = 2080;
        *(void *)&v250[2] = "AGPSessionRecvFrom";
        __int16 v251 = 1024;
        int v252 = 1923;
        __int16 v253 = 2048;
        *(void *)v254 = a1;
        *(_WORD *)&v254[8] = 1024;
        *(_DWORD *)v255 = v177;
        *(_WORD *)&v255[4] = 1024;
        *(_DWORD *)v256 = v242;
        v164 = v176;
        v165 = " [%s] %s:%d %p sack: REMOVE FAILURE SERIAL NUMBER (%08X) FROM (%08X)...";
LABEL_181:
        _os_log_impl(&dword_221563000, v164, OS_LOG_TYPE_DEFAULT, v165, (uint8_t *)&v248, 0x32u);
      }
    }
LABEL_194:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v178 = VRTraceErrorLogLevelToCSTR();
      v179 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        int v180 = *((unsigned __int8 *)v241 + 698);
        int v248 = v240;
        uint64_t v249 = v178;
        *(_WORD *)v250 = 2080;
        *(void *)&v250[2] = "AGPSessionRecvFrom";
        __int16 v251 = 1024;
        int v252 = 1934;
        __int16 v253 = 2048;
        *(void *)v254 = a1;
        *(_WORD *)&v254[8] = 1024;
        *(_DWORD *)v255 = v180;
        *(_WORD *)&v255[4] = 1024;
        *(_DWORD *)v256 = v242;
        _os_log_impl(&dword_221563000, v179, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p sack: INC BASE (%02d) FOR (%08X)...", (uint8_t *)&v248, 0x32u);
      }
    }
    v86 = v241;
    int v87 = (*((unsigned char *)v241 + 698) + 1) & 0x3F;
    *((unsigned char *)v241 + 698) = v87;
  }
  while (*((_DWORD *)v88 + 1) >> 2 != v87);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v181 = VRTraceErrorLogLevelToCSTR();
    v182 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v183 = *((unsigned __int8 *)v241 + 698);
      int v248 = v240;
      uint64_t v249 = v181;
      *(_WORD *)v250 = 2080;
      *(void *)&v250[2] = "AGPSessionRecvFrom";
      __int16 v251 = 1024;
      int v252 = 1939;
      __int16 v253 = 2048;
      *(void *)v254 = a1;
      *(_WORD *)&v254[8] = 1024;
      *(_DWORD *)v255 = v183;
      *(_WORD *)&v255[4] = 1024;
      *(_DWORD *)v256 = v242;
      _os_log_impl(&dword_221563000, v182, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p sack: SET BASE (%02d) FOR (%08X)...", (uint8_t *)&v248, 0x32u);
    }
  }
LABEL_201:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v184 = VRTraceErrorLogLevelToCSTR();
    v185 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v186 = *((unsigned __int8 *)v241 + 698);
      int v248 = 136316418;
      uint64_t v249 = v184;
      *(_WORD *)v250 = 2080;
      *(void *)&v250[2] = "AGPSessionRecvFrom";
      __int16 v251 = 1024;
      int v252 = 1942;
      __int16 v253 = 2048;
      *(void *)v254 = a1;
      *(_WORD *)&v254[8] = 1024;
      *(_DWORD *)v255 = v186;
      *(_WORD *)&v255[4] = 1024;
      *(_DWORD *)v256 = v242;
      _os_log_impl(&dword_221563000, v185, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p sack: CUR BASE (%02d) FOR (%08X)...", (uint8_t *)&v248, 0x32u);
    }
  }
  int v187 = AGPSendingSetElement::search(v241, *(_DWORD *)&v230[v24]);
  if (v187 < 0)
  {
    unsigned __int8 v28 = (pthread_mutex_t *)v235;
    if (!v89)
    {
      unsigned __int8 v28 = (pthread_mutex_t *)v235;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v192 = VRTraceErrorLogLevelToCSTR();
        v193 = *MEMORY[0x263F21098];
        unsigned __int8 v28 = (pthread_mutex_t *)v235;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR))
        {
          int v194 = *(_DWORD *)&v230[v24];
          int v248 = 136316418;
          uint64_t v249 = v192;
          *(_WORD *)v250 = 2080;
          *(void *)&v250[2] = "AGPSessionRecvFrom";
          __int16 v251 = 1024;
          int v252 = 1957;
          __int16 v253 = 2048;
          *(void *)v254 = a1;
          *(_WORD *)&v254[8] = 1024;
          *(_DWORD *)v255 = v194;
          *(_WORD *)&v255[4] = 1024;
          *(_DWORD *)v256 = v242;
          _os_log_error_impl(&dword_221563000, v193, OS_LOG_TYPE_ERROR, " [%s] %s:%d %p sack: SEARCH FAILURE SERIAL NUMBER (%08X) FROM (%08X)...", (uint8_t *)&v248, 0x32u);
        }
      }
    }
  }
  else
  {
    int v188 = AGPSendingSetElement::remove(v241, v187);
    int v189 = VRTraceGetErrorLogLevelForModule();
    if (v188)
    {
      unsigned __int8 v28 = (pthread_mutex_t *)v235;
      if (v189 >= 7)
      {
        uint64_t v190 = VRTraceErrorLogLevelToCSTR();
        uint64_t v36 = *MEMORY[0x263F21098];
        unsigned __int8 v28 = (pthread_mutex_t *)v235;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          int v191 = *(_DWORD *)&v230[v24];
          int v248 = 136316418;
          uint64_t v249 = v190;
          *(_WORD *)v250 = 2080;
          *(void *)&v250[2] = "AGPSessionRecvFrom";
          __int16 v251 = 1024;
          int v252 = 1950;
          __int16 v253 = 2048;
          *(void *)v254 = a1;
          *(_WORD *)&v254[8] = 1024;
          *(_DWORD *)v255 = v191;
          *(_WORD *)&v255[4] = 1024;
          *(_DWORD *)v256 = v242;
          uint64_t v38 = " [%s] %s:%d %p sack: REMOVED PACKET SERIAL NUMBER (%08X) FROM (%08X)...";
          goto LABEL_248;
        }
      }
    }
    else
    {
      unsigned __int8 v28 = (pthread_mutex_t *)v235;
      if (v189 >= 7)
      {
        uint64_t v219 = VRTraceErrorLogLevelToCSTR();
        uint64_t v36 = *MEMORY[0x263F21098];
        unsigned __int8 v28 = (pthread_mutex_t *)v235;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          int v220 = *(_DWORD *)&v230[v24];
          int v248 = 136316418;
          uint64_t v249 = v219;
          *(_WORD *)v250 = 2080;
          *(void *)&v250[2] = "AGPSessionRecvFrom";
          __int16 v251 = 1024;
          int v252 = 1952;
          __int16 v253 = 2048;
          *(void *)v254 = a1;
          *(_WORD *)&v254[8] = 1024;
          *(_DWORD *)v255 = v220;
          *(_WORD *)&v255[4] = 1024;
          *(_DWORD *)v256 = v242;
          uint64_t v38 = " [%s] %s:%d %p sack: REMOVE FAILURE SERIAL NUMBER (%08X) FROM (%08X)...";
LABEL_248:
          _os_log_impl(&dword_221563000, v36, OS_LOG_TYPE_DEFAULT, v38, (uint8_t *)&v248, 0x32u);
        }
      }
    }
  }
LABEL_249:
  pthread_mutex_unlock(v28);
  pthread_mutex_unlock(v239);
  return 0;
}

void sub_2215722D4(_Unwind_Exception *a1)
{
  MEMORY[0x223C84EC0](v1, 0x1060C40E2738600);
  _Unwind_Resume(a1);
}

void *CAGP::receiveSetElement(CAGP *this, int a2)
{
  __int16 v4 = (pthread_mutex_t *)((char *)this + 128);
  pthread_mutex_lock((pthread_mutex_t *)this + 2);
  CFSetRef v5 = (_DWORD *)*((void *)this + 7);
  v5[26] = a2;
  value = 0;
  if (!CFSetGetValueIfPresent(*((CFSetRef *)this + 4), v5, (const void **)&value)) {
    operator new();
  }
  pthread_mutex_unlock(v4);
  return value;
}

void sub_2215723A0(_Unwind_Exception *a1)
{
  MEMORY[0x223C84EC0](v1, 0x10A1C404616C3E8);
  _Unwind_Resume(a1);
}

AGPDataQueue *AGPDataQueue::peek_head_for_participant(AGPDataQueue *this, int a2)
{
  uint64_t v3 = this;
  __int16 v4 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  do
    uint64_t v3 = *(AGPDataQueue **)v3;
  while (v3 && (*((_DWORD *)v3 + 18) != 1 || *((_DWORD *)v3 + 2) != a2));
  pthread_mutex_unlock(v4);
  return v3;
}

AGPDataQueue *AGPDataQueue::pop_head_for_participant(AGPDataQueue **this, int a2)
{
  __int16 v4 = (pthread_mutex_t *)(this + 1);
  pthread_mutex_lock((pthread_mutex_t *)(this + 1));
  CFSetRef v5 = *this;
  if (*this)
  {
    __int16 v6 = 0;
    int v7 = *this;
    while (1)
    {
      uint64_t v8 = v7;
      if (*((_DWORD *)v7 + 18) == 1 && *((_DWORD *)v7 + 2) == a2) {
        break;
      }
      int v7 = *(AGPDataQueue **)v7;
      __int16 v6 = v8;
      if (!*(void *)v8) {
        goto LABEL_6;
      }
    }
    if (v6) {
      CFSetRef v5 = v7;
    }
    else {
      __int16 v6 = (AGPDataQueue *)this;
    }
    *(void *)__int16 v6 = *(void *)v5;
  }
  else
  {
LABEL_6:
    uint64_t v8 = 0;
  }
  pthread_mutex_unlock(v4);
  return v8;
}

void AGPSessionEvent()
{
}

void AGPSessionBroadcast()
{
  uint64_t v0 = *MEMORY[0x263EF8340];
  CheckInHandleDebug();
}

void monitorSendingSet(_DWORD *a1, _DWORD *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    CFSetRef v5 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = a1[26];
      int v8 = 136316162;
      uint64_t v9 = v4;
      __int16 v10 = 2080;
      int v11 = "monitorSendingSet";
      __int16 v12 = 1024;
      int v13 = 2107;
      __int16 v14 = 2048;
      unsigned int v15 = a2;
      __int16 v16 = 1024;
      int v17 = v6;
      _os_log_impl(&dword_221563000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p monitor: participant (%08X)...", (uint8_t *)&v8, 0x2Cu);
    }
  }
  int v7 = a1[175];
  a2[98] += v7;
  a2[99] += a1[178] * v7;
}

void copyAGPSessionStatistics()
{
  uint64_t v0 = *MEMORY[0x263EF8340];
  CheckInHandleDebug();
}

void AGPSendingSetElement::AGPSendingSetElement(AGPSendingSetElement *this, CAGP *a2)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  AGPAssociationSetElement::AGPAssociationSetElement(this, a2);
}

void sub_221572B58(_Unwind_Exception *a1)
{
  AGPAssociationSetElement::~AGPAssociationSetElement(v1);
  _Unwind_Resume(a1);
}

void AGPAssociationSetElement::AGPAssociationSetElement(AGPAssociationSetElement *this, CAGP *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  *((void *)this + 12) = 0;
  *(void *)this = &unk_26D39C990;
  *((void *)this + 1) = a2;
  *((_DWORD *)this + 27) = 0;
  uint64_t v3 = (unsigned int *)((char *)this + 700);
  uint64_t v4 = (pthread_mutex_t *)((char *)this + 32);
  *(_OWORD *)((char *)this + 696) = 0u;
  *((_DWORD *)this + 178) = 0;
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 32));
  UpdateRTO(v3, 250);
  pthread_mutex_unlock(v4);
  *((_DWORD *)this + 28) = -1;
  v5.__sig = 0xAAAAAAAAAAAAAAAALL;
  *(void *)v5.__opaque = 0xAAAAAAAAAAAAAAAALL;
  if (!pthread_mutexattr_init(&v5))
  {
    pthread_mutexattr_settype(&v5, 2);
    pthread_mutex_init(v4, &v5);
    pthread_mutexattr_destroy(&v5);
  }
  operator new();
}

void AGPAssociationSetElement::~AGPAssociationSetElement(AGPAssociationSetElement *this)
{
  uint64_t v2 = 0;
  *(void *)this = &unk_26D39C990;
  do
  {
    *((unsigned char *)this + v2 + 632) = 0x80;
    uint64_t v3 = *((void *)this + v2 + 15);
    if (v3) {
      MEMORY[0x223C84EC0](v3, 0x1000C40D24D2377);
    }
    ++v2;
  }
  while (v2 != 64);
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 32));
}

{
  uint64_t vars8;

  AGPAssociationSetElement::~AGPAssociationSetElement(this);
  JUMPOUT(0x223C84EC0);
}

void __clang_call_terminate(void *a1)
{
}

void AGPSendingSetElement::~AGPSendingSetElement(AGPSendingSetElement *this)
{
  AGPSendingSetElement::~AGPSendingSetElement(this);
  JUMPOUT(0x223C84EC0);
}

{
  uint64_t v2;
  NSObject *v3;
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  int v13 = *MEMORY[0x263EF8340];
  *(void *)this = &unk_26D39C930;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *((_DWORD *)this + 26);
      pthread_mutexattr_t v5 = 136315906;
      uint64_t v6 = v2;
      int v7 = 2080;
      int v8 = "~AGPSendingSetElement";
      uint64_t v9 = 1024;
      __int16 v10 = 505;
      int v11 = 1024;
      __int16 v12 = v4;
      _os_log_impl(&dword_221563000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d DELETING sending set element %08X", (uint8_t *)&v5, 0x22u);
    }
  }
  AGPAssociationSetElement::~AGPAssociationSetElement(this);
}

void sub_221572DC8(_Unwind_Exception *a1)
{
  MEMORY[0x223C84EC0](v1, 0x10A1C404616C3E8);
  _Unwind_Resume(a1);
}

void sub_221572E38(_Unwind_Exception *a1)
{
  MEMORY[0x223C84EC0](v1, 0x10A1C404616C3E8);
  _Unwind_Resume(a1);
}

void sub_221572F80(_Unwind_Exception *a1)
{
  AGPAssociationSetElement::~AGPAssociationSetElement(v1);
  _Unwind_Resume(a1);
}

void CAGP::CAGP(CAGP *this)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  AGPDataQueue::AGPDataQueue((CAGP *)((char *)this + 216));
  AGPDataQueue::AGPDataQueue((CAGP *)((char *)this + 288));
  *((void *)this + 24) = 0;
  *((void *)this + 25) = 0;
  *((void *)this + 4) = CFSetCreateMutable(0, 0, &associationSetCallBacks);
  *((void *)this + 5) = CFSetCreateMutable(0, 0, &associationSetCallBacks);
  operator new();
}

void sub_221573108(_Unwind_Exception *a1)
{
  MEMORY[0x223C84EC0](v3, 0x10A1C404616C3E8);
  AGPDataQueue::~AGPDataQueue(v2);
  AGPDataQueue::~AGPDataQueue(v1);
  _Unwind_Resume(a1);
}

void AGPDataQueue::AGPDataQueue(AGPDataQueue *this)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  *(void *)this = 0;
  v2.__sig = 0xAAAAAAAAAAAAAAAALL;
  *(void *)v2.__opaque = 0xAAAAAAAAAAAAAAAALL;
  if (!pthread_mutexattr_init(&v2))
  {
    pthread_mutexattr_settype(&v2, 2);
    pthread_mutex_init((pthread_mutex_t *)((char *)this + 8), &v2);
    pthread_mutexattr_destroy(&v2);
  }
}

void AGPReceiveSetElement::AGPReceiveSetElement(AGPReceiveSetElement *this, CAGP *a2)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  AGPAssociationSetElement::AGPAssociationSetElement(this, a2);
}

void sub_221573318(_Unwind_Exception *a1)
{
  AGPAssociationSetElement::~AGPAssociationSetElement(v1);
  _Unwind_Resume(a1);
}

void AGPReceiveSetElement::~AGPReceiveSetElement(AGPReceiveSetElement *this)
{
  AGPReceiveSetElement::~AGPReceiveSetElement(this);
  JUMPOUT(0x223C84EC0);
}

{
  uint64_t v2;
  NSObject *v3;
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  int v13 = *MEMORY[0x263EF8340];
  *(void *)this = &unk_26D39C9B0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *((_DWORD *)this + 26);
      pthread_mutexattr_t v5 = 136315906;
      uint64_t v6 = v2;
      int v7 = 2080;
      int v8 = "~AGPReceiveSetElement";
      uint64_t v9 = 1024;
      __int16 v10 = 520;
      int v11 = 1024;
      __int16 v12 = v4;
      _os_log_impl(&dword_221563000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d DELETING receive set element %08X", (uint8_t *)&v5, 0x22u);
    }
  }
  AGPAssociationSetElement::~AGPAssociationSetElement(this);
}

void sub_221573390(_Unwind_Exception *a1)
{
  MEMORY[0x223C84EC0](v1, 0x10A1C404616C3E8);
  _Unwind_Resume(a1);
}

void sub_2215734D8(_Unwind_Exception *a1)
{
  AGPAssociationSetElement::~AGPAssociationSetElement(v1);
  _Unwind_Resume(a1);
}

void AGPDataQueue::~AGPDataQueue(AGPDataQueue *this)
{
  for (int i = *(void **)this; *(void *)this; int i = *(void **)this)
  {
    *(void *)this = *i;
    uint64_t v3 = (const void *)i[10];
    if (v3)
    {
      CFRelease(v3);
      i[10] = 0;
    }
    MEMORY[0x223C84EC0](i, 0x1060C40E2738600);
  }
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 8));
}

void sub_221573578(_Unwind_Exception *a1)
{
  MEMORY[0x223C84EC0](v1, 0x1060C40E2738600);
  _Unwind_Resume(a1);
}

void CAGP::~CAGP(pthread_mutex_t *this)
{
  uint64_t v2 = *(const void **)&this->__opaque[32];
  if (v2)
  {
    CFRelease(v2);
    *(void *)&this->__opaque[32] = 0;
  }
  uint64_t v3 = *(const void **)&this->__opaque[24];
  if (v3)
  {
    CFRelease(v3);
    *(void *)&this->__opaque[24] = 0;
  }
  while (1)
  {
    sig = (void *)this[3].__sig;
    if (!sig) {
      break;
    }
    pthread_mutexattr_t v5 = (__CFSet *)sig[3];
    this[3].__sig = sig[2];
    CFSetRemoveValue(v5, sig);
  }
  while (1)
  {
    uint64_t v6 = *(void **)this[3].__opaque;
    if (!v6) {
      break;
    }
    *(void *)this[3].__opaque = v6[2];
    (*(void (**)(void *))(*v6 + 8))(v6);
  }
  pthread_mutex_destroy(this + 1);
  pthread_mutex_destroy(this + 2);
  uint64_t v7 = *(void *)&this->__opaque[40];
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
  }
  uint64_t v8 = *(void *)&this->__opaque[48];
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
  }
  AGPDataQueue::~AGPDataQueue((AGPDataQueue *)&this[4].__opaque[24]);
  AGPDataQueue::~AGPDataQueue((AGPDataQueue *)&this[3].__opaque[16]);
}

void sub_2215736A4(_Unwind_Exception *a1)
{
  AGPDataQueue::~AGPDataQueue((AGPDataQueue *)(v1 + 216));
  _Unwind_Resume(a1);
}

uint64_t PostEventCallback(uint64_t a1, int a2, int a3, const void *a4, int a5, int a6)
{
  uint64_t v6 = 2149187587;
  if (a1)
  {
    int v13 = (pthread_mutex_t *)(a1 + 48);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 48));
    if (*(_DWORD *)(a1 + 4))
    {
      uint64_t v6 = 2149187606;
LABEL_14:
      pthread_mutex_unlock(v13);
      return v6;
    }
    if (a4 && a5)
    {
      __int16 v14 = malloc_type_malloc(a5 + 48, 0xE32982CCuLL);
      if (!v14) {
        goto LABEL_14;
      }
      unsigned int v15 = v14;
      *__int16 v14 = a2;
      v14[2] = a3;
      __int16 v16 = v14 + 12;
      *((void *)v15 + 2) = v16;
      v15[6] = a5;
      v15[7] = a6;
      memcpy(v16, a4, a5);
    }
    else
    {
      int v17 = malloc_type_malloc(0x30uLL, 0x103004055E16862uLL);
      if (!v17) {
        goto LABEL_14;
      }
      unsigned int v15 = v17;
      *int v17 = a2;
      v17[2] = a3;
      *((void *)v17 + 2) = 0;
      v17[6] = 0;
      v17[7] = a6;
    }
    *((void *)v15 + 5) = 0;
    uint64_t v18 = (void *)(a1 + 40);
    do
    {
      uint64_t v19 = v18;
      uint64_t v20 = *v18;
      uint64_t v18 = (void *)(*v18 + 40);
    }
    while (v20);
    *uint64_t v19 = v15;
    pthread_cond_signal((pthread_cond_t *)(a1 + 112));
    uint64_t v6 = 0;
    goto LABEL_14;
  }
  return 2149187585;
}

uint64_t WaitEventCallback(uint64_t a1, int a2, int a3, const void *a4, int a5, int a6, double a7)
{
  uint64_t v7 = 2149187587;
  if (a1)
  {
    unsigned int v15 = (pthread_mutex_t *)(a1 + 248);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 248));
    __int16 v16 = (pthread_mutex_t *)(a1 + 48);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 48));
    if (*(_DWORD *)(a1 + 4))
    {
      uint64_t v7 = 2149187606;
LABEL_19:
      pthread_mutex_unlock(v16);
      pthread_mutex_unlock(v15);
      return v7;
    }
    if (a4 && a5)
    {
      int v17 = (double *)malloc_type_malloc(a5 + 48, 0x78C5AD35uLL);
      if (!v17) {
        goto LABEL_19;
      }
      uint64_t v18 = v17;
      v17[4] = a7;
      *(_DWORD *)int v17 = a2;
      *((_DWORD *)v17 + 2) = a3;
      uint64_t v19 = v17 + 6;
      *((void *)v18 + 2) = v19;
      *((_DWORD *)v18 + 6) = a5;
      *((_DWORD *)v18 + 7) = a6;
      memcpy(v19, a4, a5);
    }
    else
    {
      uint64_t v20 = (double *)malloc_type_malloc(0x30uLL, 0x103004055E16862uLL);
      if (!v20) {
        goto LABEL_19;
      }
      uint64_t v18 = v20;
      v20[4] = a7;
      *(_DWORD *)uint64_t v20 = a2;
      *((_DWORD *)v20 + 2) = a3;
      v20[2] = 0.0;
      *((_DWORD *)v20 + 6) = 0;
      *((_DWORD *)v20 + 7) = a6;
    }
    v18[5] = 0.0;
    uint64_t v23 = *(void *)(a1 + 240);
    uint64_t v22 = (double **)(a1 + 240);
    uint64_t v21 = v23;
    if (v23)
    {
      if (*(double *)(v21 + 32) > a7)
      {
LABEL_16:
        *((void *)v18 + 5) = v21;
      }
      else
      {
        while (1)
        {
          uint64_t v24 = v21;
          uint64_t v21 = *(void *)(v21 + 40);
          if (!v21) {
            break;
          }
          if (*(double *)(v21 + 32) > a7)
          {
            uint64_t v22 = (double **)(v24 + 40);
            goto LABEL_16;
          }
        }
        uint64_t v22 = (double **)(v24 + 40);
      }
    }
    uint64_t v7 = 0;
    *uint64_t v22 = v18;
    goto LABEL_19;
  }
  return 2149187585;
}

uint64_t ServiceWaitEventCallbacks(uint64_t a1, double a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = 2149187606;
  if (!a1) {
    return 2149187585;
  }
  pthread_mutexattr_t v5 = (pthread_mutex_t *)(a1 + 248);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 248));
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 48));
  if (*(_DWORD *)(a1 + 4))
  {
LABEL_3:
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 48));
    pthread_mutex_unlock(v5);
  }
  else
  {
    uint64_t v6 = (uint64_t *)(a1 + 240);
    uint64_t v7 = *(void *)(a1 + 240);
    if (v7)
    {
      do
      {
        uint64_t v8 = (uint64_t *)(v7 + 40);
        if (*(double *)(v7 + 32) <= a2)
        {
          *uint64_t v6 = *v8;
          uint64_t *v8 = 0;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v9 = VRTraceErrorLogLevelToCSTR();
            __int16 v10 = *MEMORY[0x263F21098];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
            {
              int v11 = *(_DWORD *)(v7 + 8);
              int v12 = *(_DWORD *)v7;
              *(_DWORD *)buf = 136316162;
              uint64_t v15 = v9;
              __int16 v16 = 2080;
              int v17 = "ServiceWaitEventCallbacks";
              __int16 v18 = 1024;
              int v19 = 197;
              __int16 v20 = 1024;
              int v21 = v11;
              __int16 v22 = 1024;
              int v23 = v12;
              _os_log_impl(&dword_221563000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ServiceWaitEventCallbacks: post delayed event of type %d to participant %08X", buf, 0x28u);
            }
          }
          pthread_mutex_unlock((pthread_mutex_t *)(a1 + 48));
          PostEventCallback(a1, *(_DWORD *)v7, *(_DWORD *)(v7 + 8), *(const void **)(v7 + 16), *(_DWORD *)(v7 + 24), *(_DWORD *)(v7 + 28));
          pthread_mutex_lock((pthread_mutex_t *)(a1 + 48));
          free((void *)v7);
          if (*(_DWORD *)(a1 + 4)) {
            goto LABEL_3;
          }
        }
        else
        {
          uint64_t v6 = (uint64_t *)(v7 + 40);
        }
        uint64_t v7 = *v6;
      }
      while (*v6);
    }
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 48));
    pthread_mutex_unlock(v5);
    return 0;
  }
  return v2;
}

uint64_t StartEventCallbackThread(_DWORD *a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 2149187585;
  }
  uint64_t v2 = (pthread_mutex_t *)(a1 + 12);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 12));
  if (*a1)
  {
    pthread_mutex_unlock(v2);
    return 0;
  }
  else
  {
    *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v6.__opaque[24] = v4;
    *(_OWORD *)&v6.__opaque[40] = v4;
    *(_OWORD *)&v6.__sig = v4;
    *(_OWORD *)&v6.__opaque[8] = v4;
    pthread_attr_init(&v6);
    pthread_attr_setdetachstate(&v6, 2);
    uint64_t v3 = pthread_create((pthread_t *)a1 + 20, 0, (void *(__cdecl *)(void *))EventCBProc, a1);
    pthread_attr_destroy(&v6);
    if (v3) {
      uint64_t v3 = v3 | 0xC01A0000;
    }
    else {
      *a1 = 1;
    }
    pthread_mutex_unlock(v2);
  }
  return v3;
}

uint64_t EventCBProc(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  pthread_setname_np("com.apple.gamekitservices.eventcallback.eventcbproc");
  while (1)
  {
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 48));
    while (1)
    {
      uint64_t v2 = *(void **)(a1 + 40);
      if (v2) {
        break;
      }
      if (*(_DWORD *)(a1 + 4)) {
        goto LABEL_8;
      }
      pthread_cond_wait((pthread_cond_t *)(a1 + 112), (pthread_mutex_t *)(a1 + 48));
    }
    if (*(_DWORD *)(a1 + 4)) {
      break;
    }
    *(void *)(a1 + 40) = v2[5];
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 48));
    (*(void (**)(void, void, void *))(a1 + 8))(*(void *)(a1 + 16), *(unsigned int *)v2, v2 + 1);
    free(v2);
  }
LABEL_8:
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 48));
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    long long v4 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315650;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      uint64_t v9 = "EventCBProc";
      __int16 v10 = 1024;
      int v11 = 38;
      _os_log_impl(&dword_221563000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d EventCallbackThread ends.", (uint8_t *)&v6, 0x1Cu);
    }
  }
  return 0;
}

uint64_t StopEventCallbackThread(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 2149187585;
  }
  uint64_t v2 = (pthread_mutex_t *)(a1 + 48);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 48));
  *(_DWORD *)(a1 + 4) = 1;
  pthread_cond_signal((pthread_cond_t *)(a1 + 112));
  uint64_t v3 = *(void **)(a1 + 40);
  if (v3)
  {
    do
    {
      long long v4 = (void *)v3[5];
      free(v3);
      uint64_t v3 = v4;
    }
    while (v4);
  }
  *(void *)(a1 + 40) = 0;
  pthread_mutex_unlock(v2);
  pthread_join(*(pthread_t *)(a1 + 160), 0);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    int v6 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315650;
      uint64_t v10 = v5;
      __int16 v11 = 2080;
      uint64_t v12 = "CleanupWaitEventCallbacks";
      __int16 v13 = 1024;
      int v14 = 226;
      _os_log_impl(&dword_221563000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d CleanupWaitEventCallbacks", (uint8_t *)&v9, 0x1Cu);
    }
  }
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 248));
  while (1)
  {
    uint64_t v7 = *(void **)(a1 + 240);
    if (!v7) {
      break;
    }
    *(void *)(a1 + 240) = v7[5];
    free(v7);
  }
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 248));
  pthread_mutex_destroy(v2);
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 248));
  pthread_cond_destroy((pthread_cond_t *)(a1 + 112));
  free((void *)a1);
  return 0;
}

void GCKSessionDecodeChannelStatistics()
{
}

void *GCKSessionDecodeChannelStatisticsInternal(char *a1, unsigned int a2)
{
  long long v4 = malloc_type_calloc(1uLL, 0x98uLL, 0x102004012D539F1uLL);
  if (v4)
  {
    *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v8.x_public = v5;
    *(_OWORD *)&v8.x_base = v5;
    *(_OWORD *)&v8.x_op = v5;
    xdrmem_create(&v8, a1, a2, XDR_DECODE);
    if (!xdr_chanstat_node(&v8, (uint64_t)v4))
    {
      free(v4);
      long long v4 = 0;
    }
    x_destroy = v8.x_ops->x_destroy;
    if (x_destroy) {
      ((void (*)(XDR *))x_destroy)(&v8);
    }
  }
  return v4;
}

uint64_t TracePrintChanStats(int *a1)
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x263F21098];
    long long v4 = *MEMORY[0x263F21098];
    if (*MEMORY[0x263F21088])
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v5 = *a1;
        int v6 = a1[1];
        int v7 = a1[16];
        *(_DWORD *)buf = 136316418;
        uint64_t v54 = v2;
        __int16 v55 = 2080;
        int v56 = "TracePrintChanStats";
        __int16 v57 = 1024;
        int v58 = 74;
        __int16 v59 = 1024;
        *(_DWORD *)int v60 = v5;
        *(_WORD *)&v60[4] = 1024;
        *(_DWORD *)&v60[6] = v6;
        *(_WORD *)&v60[10] = 1024;
        *(_DWORD *)&v60[12] = v7;
        _os_log_impl(&dword_221563000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ====> report (hostID %08X iIFIndex %d chanID %d)", buf, 0x2Eu);
      }
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      TracePrintChanStats_cold_8();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    int v9 = *MEMORY[0x263F21098];
    uint64_t v10 = *MEMORY[0x263F21098];
    if (*MEMORY[0x263F21088])
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = a1[17];
        int v12 = *((unsigned __int16 *)a1 + 4);
        int v13 = *((unsigned __int16 *)a1 + 5);
        *(_DWORD *)buf = 136316418;
        uint64_t v54 = v8;
        __int16 v55 = 2080;
        int v56 = "TracePrintChanStats";
        __int16 v57 = 1024;
        int v58 = 75;
        __int16 v59 = 1024;
        *(_DWORD *)int v60 = v11;
        *(_WORD *)&v60[4] = 1024;
        *(_DWORD *)&v60[6] = v12;
        *(_WORD *)&v60[10] = 1024;
        *(_DWORD *)&v60[12] = v13;
        _os_log_impl(&dword_221563000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ====>        (peerID %08X type %d rsvd %d)", buf, 0x2Eu);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      TracePrintChanStats_cold_7();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    uint64_t v15 = *MEMORY[0x263F21098];
    __int16 v16 = *MEMORY[0x263F21098];
    if (*MEMORY[0x263F21088])
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = a1[3];
        uint64_t v18 = *((void *)a1 + 2);
        uint64_t v19 = *((void *)a1 + 3);
        *(_DWORD *)buf = 136316418;
        uint64_t v54 = v14;
        __int16 v55 = 2080;
        int v56 = "TracePrintChanStats";
        __int16 v57 = 1024;
        int v58 = 76;
        __int16 v59 = 1024;
        *(_DWORD *)int v60 = v17;
        *(_WORD *)&v60[4] = 2048;
        *(void *)&v60[6] = v18;
        *(_WORD *)&v60[14] = 2048;
        *(void *)&v60[16] = v19;
        _os_log_impl(&dword_221563000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ====>        (rtt %d recv %ld send %ld)", buf, 0x36u);
      }
    }
    else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      TracePrintChanStats_cold_6();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v20 = VRTraceErrorLogLevelToCSTR();
    int v21 = *MEMORY[0x263F21098];
    __int16 v22 = *MEMORY[0x263F21098];
    if (*MEMORY[0x263F21088])
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = a1[8];
        int v24 = a1[9];
        *(_DWORD *)buf = 136316162;
        uint64_t v54 = v20;
        __int16 v55 = 2080;
        int v56 = "TracePrintChanStats";
        __int16 v57 = 1024;
        int v58 = 78;
        __int16 v59 = 1024;
        *(_DWORD *)int v60 = v23;
        *(_WORD *)&v60[4] = 1024;
        *(_DWORD *)&v60[6] = v24;
        _os_log_impl(&dword_221563000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ====>        (rbw %d sbw %d)", buf, 0x28u);
      }
    }
    else if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      TracePrintChanStats_cold_5();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v25 = VRTraceErrorLogLevelToCSTR();
    int v26 = *MEMORY[0x263F21098];
    __int16 v27 = *MEMORY[0x263F21098];
    if (*MEMORY[0x263F21088])
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        double v28 = *((float *)a1 + 10);
        double v29 = *((float *)a1 + 11);
        double v30 = *((float *)a1 + 12);
        *(_DWORD *)buf = 136316418;
        uint64_t v54 = v25;
        __int16 v55 = 2080;
        int v56 = "TracePrintChanStats";
        __int16 v57 = 1024;
        int v58 = 79;
        __int16 v59 = 2048;
        *(double *)int v60 = v28;
        *(_WORD *)&v60[8] = 2048;
        *(double *)&v60[10] = v29;
        *(_WORD *)&v60[18] = 2048;
        *(double *)&v60[20] = v30;
        _os_log_impl(&dword_221563000, v26, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ====>        (up %f irate %f orate %f)", buf, 0x3Au);
      }
    }
    else if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      TracePrintChanStats_cold_4();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v31 = VRTraceErrorLogLevelToCSTR();
    unsigned int v32 = *MEMORY[0x263F21098];
    int v33 = *MEMORY[0x263F21098];
    if (*MEMORY[0x263F21088])
    {
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        double v34 = *((float *)a1 + 13);
        double v35 = *((float *)a1 + 14);
        *(_DWORD *)buf = 136316162;
        uint64_t v54 = v31;
        __int16 v55 = 2080;
        int v56 = "TracePrintChanStats";
        __int16 v57 = 1024;
        int v58 = 80;
        __int16 v59 = 2048;
        *(double *)int v60 = v34;
        *(_WORD *)&v60[8] = 2048;
        *(double *)&v60[10] = v35;
        _os_log_impl(&dword_221563000, v32, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ====>        (iloss %f oloss %f)", buf, 0x30u);
      }
    }
    else if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      TracePrintChanStats_cold_3();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v36 = VRTraceErrorLogLevelToCSTR();
    int v37 = *MEMORY[0x263F21098];
    uint64_t v38 = *MEMORY[0x263F21098];
    if (*MEMORY[0x263F21088])
    {
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        int v39 = a1[18];
        *(_DWORD *)buf = 136315906;
        uint64_t v54 = v36;
        __int16 v55 = 2080;
        int v56 = "TracePrintChanStats";
        __int16 v57 = 1024;
        int v58 = 81;
        __int16 v59 = 1024;
        *(_DWORD *)int v60 = v39;
        _os_log_impl(&dword_221563000, v37, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ====>        (ndst %d)", buf, 0x22u);
      }
    }
    else if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      TracePrintChanStats_cold_2();
    }
  }
  if (a1[18] >= 1)
  {
    uint64_t v40 = 0;
    int v41 = a1 + 19;
    do
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        uint64_t v42 = VRTraceErrorLogLevelToCSTR();
        uint64_t v43 = *MEMORY[0x263F21098];
        int v44 = *MEMORY[0x263F21098];
        if (*MEMORY[0x263F21088])
        {
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            int v45 = v41[v40];
            *(_DWORD *)buf = 136316162;
            uint64_t v54 = v42;
            __int16 v55 = 2080;
            int v56 = "TracePrintChanStats";
            __int16 v57 = 1024;
            int v58 = 83;
            __int16 v59 = 1024;
            *(_DWORD *)int v60 = v40;
            *(_WORD *)&v60[4] = 1024;
            *(_DWORD *)&v60[6] = v45;
            _os_log_impl(&dword_221563000, v43, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ====>         (dstID %d %08X)", buf, 0x28u);
          }
        }
        else if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          int v46 = v41[v40];
          *(_DWORD *)buf = 136316162;
          uint64_t v54 = v42;
          __int16 v55 = 2080;
          int v56 = "TracePrintChanStats";
          __int16 v57 = 1024;
          int v58 = 83;
          __int16 v59 = 1024;
          *(_DWORD *)int v60 = v40;
          *(_WORD *)&v60[4] = 1024;
          *(_DWORD *)&v60[6] = v46;
          _os_log_debug_impl(&dword_221563000, v43, OS_LOG_TYPE_DEBUG, " [%s] %s:%d ====>         (dstID %d %08X)", buf, 0x28u);
        }
      }
      ++v40;
    }
    while (v40 < a1[18]);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v47 = VRTraceErrorLogLevelToCSTR();
    int v48 = *MEMORY[0x263F21098];
    int v49 = *MEMORY[0x263F21098];
    if (*MEMORY[0x263F21088])
    {
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v50 = *((void *)a1 + 18);
        *(_DWORD *)buf = 136315906;
        if (v50) {
          uint64_t v51 = "YES";
        }
        else {
          uint64_t v51 = "NO";
        }
        uint64_t v54 = v47;
        __int16 v55 = 2080;
        int v56 = "TracePrintChanStats";
        __int16 v57 = 1024;
        int v58 = 85;
        __int16 v59 = 2080;
        *(void *)int v60 = v51;
        _os_log_impl(&dword_221563000, v48, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ====>        (next == %s)", buf, 0x26u);
      }
    }
    else if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
    {
      TracePrintChanStats_cold_1();
    }
  }
  uint64_t result = *((void *)a1 + 18);
  if (result) {
    return TracePrintChanStats();
  }
  return result;
}

void GCKSession_TrimLocalInterfaceList(int **a1, int *a2, int a3)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  if (a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      long long v4 = *MEMORY[0x263F21098];
      int v5 = *MEMORY[0x263F21098];
      if (*MEMORY[0x263F21088])
      {
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v29 = v3;
          __int16 v30 = 2080;
          uint64_t v31 = "GCKSession_TrimLocalInterfaceList";
          __int16 v32 = 1024;
          int v33 = 306;
          _os_log_impl(&dword_221563000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d InterfaceFilter not trimming interfaces for local gaming.", buf, 0x1Cu);
        }
      }
      else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        GCKSession_TrimLocalInterfaceList_cold_1();
      }
    }
  }
  else
  {
    __int16 v27 = 0;
    if (a1 && a2 && (uint64_t v8 = *a1) != 0)
    {
      int v26 = 0;
      if (*a2 < 1)
      {
        BOOL v11 = 0;
        BOOL v10 = 0;
      }
      else
      {
        uint64_t v9 = 0;
        BOOL v10 = 0;
        BOOL v11 = 0;
        int v12 = v8 + 1;
        while (1)
        {
          if (strncmp((const char *)v8 + 4, "en", 2uLL) || v10)
          {
            if ((*(unsigned char *)v8 & 4) != 0 && !v11)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
              {
                uint64_t v17 = VRTraceErrorLogLevelToCSTR();
                uint64_t v18 = *MEMORY[0x263F21098];
                uint64_t v19 = *MEMORY[0x263F21098];
                if (*MEMORY[0x263F21088])
                {
                  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                  {
                    int v20 = *v8;
                    *(_DWORD *)buf = 136316162;
                    uint64_t v29 = v17;
                    __int16 v30 = 2080;
                    uint64_t v31 = "GCKSession_TrimLocalInterfaceList";
                    __int16 v32 = 1024;
                    int v33 = 323;
                    __int16 v34 = 1024;
                    int v35 = v20;
                    __int16 v36 = 2080;
                    int v37 = v12;
                    _os_log_impl(&dword_221563000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d InterfaceFilter found an carrier IPPort. Try to use it as first pdpIPPort. iFlags=(%02X)\tszIfName=%s", buf, 0x2Cu);
                  }
                }
                else if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
                {
                  int v22 = *v8;
                  *(_DWORD *)buf = 136316162;
                  uint64_t v29 = v17;
                  __int16 v30 = 2080;
                  uint64_t v31 = "GCKSession_TrimLocalInterfaceList";
                  __int16 v32 = 1024;
                  int v33 = 323;
                  __int16 v34 = 1024;
                  int v35 = v22;
                  __int16 v36 = 2080;
                  int v37 = v12;
                  _os_log_debug_impl(&dword_221563000, v18, OS_LOG_TYPE_DEBUG, " [%s] %s:%d InterfaceFilter found an carrier IPPort. Try to use it as first pdpIPPort. iFlags=(%02X)\tszIfName=%s", buf, 0x2Cu);
                }
              }
              BOOL v11 = _GCKSession_AddOneIPPortToInterfaceList((void **)&v27, (long long *)v8, (unsigned int *)&v26);
            }
          }
          else
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
            {
              uint64_t v13 = VRTraceErrorLogLevelToCSTR();
              uint64_t v14 = *MEMORY[0x263F21098];
              uint64_t v15 = *MEMORY[0x263F21098];
              if (*MEMORY[0x263F21088])
              {
                if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
                {
                  int v16 = *v8;
                  *(_DWORD *)buf = 136316162;
                  uint64_t v29 = v13;
                  __int16 v30 = 2080;
                  uint64_t v31 = "GCKSession_TrimLocalInterfaceList";
                  __int16 v32 = 1024;
                  int v33 = 320;
                  __int16 v34 = 1024;
                  int v35 = v16;
                  __int16 v36 = 2080;
                  int v37 = v12;
                  _os_log_impl(&dword_221563000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d InterfaceFilter found an en IPPort. Try to use it as first enIPPort. iFlags=(%02X)\tszIfName=%s", buf, 0x2Cu);
                }
              }
              else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
              {
                int v21 = *v8;
                *(_DWORD *)buf = 136316162;
                uint64_t v29 = v13;
                __int16 v30 = 2080;
                uint64_t v31 = "GCKSession_TrimLocalInterfaceList";
                __int16 v32 = 1024;
                int v33 = 320;
                __int16 v34 = 1024;
                int v35 = v21;
                __int16 v36 = 2080;
                int v37 = v12;
                _os_log_debug_impl(&dword_221563000, v14, OS_LOG_TYPE_DEBUG, " [%s] %s:%d InterfaceFilter found an en IPPort. Try to use it as first enIPPort. iFlags=(%02X)\tszIfName=%s", buf, 0x2Cu);
              }
            }
            BOOL v10 = _GCKSession_AddOneIPPortToInterfaceList((void **)&v27, (long long *)v8, (unsigned int *)&v26);
          }
          if (v26 >= 2) {
            break;
          }
          ++v9;
          v8 += 10;
          v12 += 10;
          if (v9 >= *a2) {
            goto LABEL_40;
          }
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
        {
          uint64_t v23 = VRTraceErrorLogLevelToCSTR();
          int v24 = *MEMORY[0x263F21098];
          uint64_t v25 = *MEMORY[0x263F21098];
          if (*MEMORY[0x263F21088])
          {
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              uint64_t v29 = v23;
              __int16 v30 = 2080;
              uint64_t v31 = "GCKSession_TrimLocalInterfaceList";
              __int16 v32 = 1024;
              int v33 = 327;
              _os_log_impl(&dword_221563000, v24, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d InterfaceFilter got 2 or more interfaces already. skip the rest of the list.", buf, 0x1Cu);
            }
          }
          else if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            GCKSession_TrimLocalInterfaceList_cold_4();
          }
        }
      }
LABEL_40:
      if ((v26 - 3) <= 0xFFFFFFFD && (int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
          GCKSession_TrimLocalInterfaceList_cold_3();
        }
      }
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
          GCKSession_TrimLocalInterfaceList_cold_2();
        }
      }
      BOOL v11 = 0;
      BOOL v10 = 0;
    }
    if (v10 || v11)
    {
      *a2 = v26;
      FreeLocalInterfaceList();
      *a1 = v27;
    }
    else
    {
      FreeLocalInterfaceList();
    }
  }
}

BOOL _GCKSession_AddOneIPPortToInterfaceList(void **a1, long long *a2, unsigned int *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (!a2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL result = os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR);
      if (!result) {
        return result;
      }
      _GCKSession_AddOneIPPortToInterfaceList_cold_1();
    }
    return 0;
  }
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL result = os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR);
      if (!result) {
        return result;
      }
      _GCKSession_AddOneIPPortToInterfaceList_cold_2();
    }
    return 0;
  }
  if (!a1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL result = os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR);
      if (!result) {
        return result;
      }
      _GCKSession_AddOneIPPortToInterfaceList_cold_3();
    }
    return 0;
  }
  if (*a3 >= 2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      uint64_t v18 = *MEMORY[0x263F21098];
      uint64_t v19 = *MEMORY[0x263F21098];
      if (*MEMORY[0x263F21088])
      {
        BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
        BOOL result = 0;
        if (!v20) {
          return result;
        }
        int v21 = 136315650;
        uint64_t v22 = v17;
        __int16 v23 = 2080;
        int v24 = "_GCKSession_AddOneIPPortToInterfaceList";
        __int16 v25 = 1024;
        int v26 = 280;
        _os_log_impl(&dword_221563000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Bailing due to: invalid numberOfIPPortsToUse.", (uint8_t *)&v21, 0x1Cu);
      }
      else
      {
        BOOL result = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
        if (!result) {
          return result;
        }
        _GCKSession_AddOneIPPortToInterfaceList_cold_4();
      }
    }
    return 0;
  }
  unsigned int v6 = *a3 + 1;
  int v7 = *a1;
  if (!*a1)
  {
    uint64_t v8 = (char *)malloc_type_calloc(1uLL, 0x28uLL, 0x100004053E81896uLL);
    uint64_t v9 = v8;
    if (v8) {
      goto LABEL_9;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL result = os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR);
      if (!result) {
        return result;
      }
      _GCKSession_AddOneIPPortToInterfaceList_cold_5();
    }
    return 0;
  }
  uint64_t v8 = (char *)malloc_type_realloc(v7, 40 * v6, 0x100004053E81896uLL);
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL result = os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR);
      if (!result) {
        return result;
      }
      _GCKSession_AddOneIPPortToInterfaceList_cold_7();
    }
    return 0;
  }
  uint64_t v9 = v8 + 40;
LABEL_9:
  long long v10 = *a2;
  long long v11 = a2[1];
  *((void *)v9 + 4) = *((void *)a2 + 4);
  *(_OWORD *)uint64_t v9 = v10;
  *((_OWORD *)v9 + 1) = v11;
  *a3 = v6;
  *a1 = v8;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    uint64_t v13 = *MEMORY[0x263F21098];
    uint64_t v14 = *MEMORY[0x263F21098];
    if (*MEMORY[0x263F21088])
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = *(_DWORD *)a2;
        int v21 = 136316162;
        uint64_t v22 = v12;
        __int16 v23 = 2080;
        int v24 = "_GCKSession_AddOneIPPortToInterfaceList";
        __int16 v25 = 1024;
        int v26 = 297;
        __int16 v27 = 1024;
        int v28 = v15;
        __int16 v29 = 2080;
        uint64_t v30 = (uint64_t)a2 + 4;
        _os_log_impl(&dword_221563000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Successfully added an IPPort to ipPortList. Added IPPort:\tflag(%02X)\tszIfName=%s", (uint8_t *)&v21, 0x2Cu);
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      _GCKSession_AddOneIPPortToInterfaceList_cold_6();
    }
  }
  return 1;
}

uint64_t UpdateRTO(unsigned int *a1, int a2)
{
  if (a2 >= 1)
  {
    unsigned int v3 = *a1;
    int v2 = a1[1];
    unsigned int v4 = *a1 + 1;
    *a1 = v4;
    if (v3 <= 0x3F)
    {
      int v5 = v2 + a2;
      unsigned int v6 = (v2 + a2) / v4;
      unsigned int v7 = a2 - v6;
      if ((int)(a2 - v6) < 0) {
        unsigned int v7 = v6 - a2;
      }
      unsigned int v8 = a1[2] - ((int)a1[2] >> 5) + v7;
      a1[1] = v5;
      a1[2] = v8;
      goto LABEL_11;
    }
    int v9 = a2 - (v2 >> 6);
    if (v9 >= 0) {
      int v10 = a2 - (v2 >> 6);
    }
    else {
      int v10 = (v2 >> 6) - a2;
    }
    int v11 = a1[2];
    if (v10 < (3 * v11) >> 5)
    {
      int v12 = v9 + v2;
      int v13 = v10 - (v11 >> 5) + v11;
      a1[1] = v12;
      a1[2] = v13;
      unsigned int v6 = (v13 >> 5) + (v12 >> 6);
LABEL_11:
      a1[3] = v6;
    }
  }
  return a1[3];
}

uint64_t GCKSessionCreateUniqueID()
{
  return arc4random() & 0x7FFFFFFF;
}

void GCKSessionGetLocalServicePort()
{
  uint64_t v0 = *MEMORY[0x263EF8340];
  CheckInHandleDebug();
}

void GCKSessionSetDisconnectTimeout()
{
}

uint64_t GCKSessionCreate(int a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ((GCKSessionCreate_s_fInit & 1) == 0)
  {
    GCKSessionCreate_s_fInit = 1;
    if (a1 == 1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v4 = VRTraceErrorLogLevelToCSTR();
        int v2 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          buf[0] = 136315650;
          *(void *)&buf[1] = v4;
          __int16 v10 = 2080;
          int v11 = "GCKSessionCreate";
          __int16 v12 = 1024;
          int v13 = 6416;
          unsigned int v3 = " [%s] %s:%d localscopelaunch";
          goto LABEL_10;
        }
      }
    }
    else if (!a1 && (int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v1 = VRTraceErrorLogLevelToCSTR();
      int v2 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        buf[0] = 136315650;
        *(void *)&buf[1] = v1;
        __int16 v10 = 2080;
        int v11 = "GCKSessionCreate";
        __int16 v12 = 1024;
        int v13 = 6413;
        unsigned int v3 = " [%s] %s:%d globalscopelaunch";
LABEL_10:
        _os_log_impl(&dword_221563000, v2, OS_LOG_TYPE_DEFAULT, v3, (uint8_t *)buf, 0x1Cu);
      }
    }
  }
  int v5 = malloc_type_calloc(1uLL, 0x2138uLL, 0x10E004096A975A5uLL);
  if (v5)
  {
    unsigned int v6 = v5;
    unsigned int v7 = malloc_type_calloc(1uLL, 0x138uLL, 0x10A00406F2D52ADuLL);
    v6[12] = v7;
    if (v7) {
      CreateHandle();
    }
    free(v6);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        GCKSessionCreate_cold_2();
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
      GCKSessionCreate_cold_1();
    }
  }
  return 2149187587;
}

void GCKSessionRelease()
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  uint64_t v1 = (os_log_t *)MEMORY[0x263F21098];
  if (ErrorLogLevelForModule >= 6)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    unsigned int v3 = *v1;
    if (os_log_type_enabled(*v1, OS_LOG_TYPE_DEFAULT))
    {
      buf[0] = 136315650;
      *(void *)&buf[1] = v2;
      __int16 v6 = 2080;
      unsigned int v7 = "GCKSessionRelease";
      __int16 v8 = 1024;
      int v9 = 6571;
      _os_log_impl(&dword_221563000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gcksession-released", (uint8_t *)buf, 0x1Cu);
    }
  }
  timeval v4 = (timeval)xmmword_2215E8970;
  v4.tv_usec = 50000;
  CheckInHandleDebug();
}

void gckSessionSendUDPPacket()
{
  uint64_t v0 = *MEMORY[0x263EF8340];
  CheckInHandleDebug();
}

void gckSessionRecvUDPPacketWithTimeout()
{
}

void gckSessionReconnectedCallback()
{
  uint64_t v0 = *MEMORY[0x263EF8340];
  CheckInHandleDebug();
}

void gckSessionCancelRecvUDP()
{
}

void gckSessionRecvProc()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  memset(v0, 170, sizeof(v0));
  pthread_setname_np("com.apple.gamekitservices.gcksession.recvproc");
  CheckInHandleDebug();
}

void gckSessionSendProc()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  v0.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&v0.tv_usec = 0xAAAAAAAAAAAAAAAALL;
  pthread_setname_np("com.apple.gamekitservices.gcksession.sendproc");
  CheckInHandleDebug();
}

void gckRegisterForNetworkChanges()
{
  uint64_t v0 = *MEMORY[0x263EF8340];
  CheckInHandleDebug();
}

uint64_t gckSessionDisposeAllConnections(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = (pthread_rwlock_t *)(a1 + 7904);
  pthread_rwlock_wrlock((pthread_rwlock_t *)(a1 + 7904));
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 7800));
  memcpy(__dst, (const void *)(a1 + 116), sizeof(__dst));
  __dst[71] = 0;
  ++LOWORD(__dst[68]);
  __dst[69] = 1;
  gckSessionSendLSA(a1, 1, __dst, -1, 1);
  *(_DWORD *)(a1 + 400) = 0;
  *(_WORD *)(a1 + 388) = __dst[68];
  gckSessionFindShortestPath(*(_DWORD *)(a1 + 112), (_DWORD *)(a1 + 116));
  gckSessionCleanupNodes(a1, -1, 0);
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 7800));
  return pthread_rwlock_unlock(v2);
}

uint64_t BWE_CloseObject(uint64_t result)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (*(void *)(result + 736) != 0xFFFFFFFFLL)
  {
    uint64_t v1 = result;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v2 = VRTraceErrorLogLevelToCSTR();
      unsigned int v3 = *MEMORY[0x263F21098];
      timeval v4 = *MEMORY[0x263F21098];
      if (*MEMORY[0x263F21088])
      {
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v5 = *(void *)(v1 + 736);
          int v6 = *(_DWORD *)(v1 + 116);
          int v7 = *(unsigned __int16 *)(v1 + 744);
          int v11 = 136316418;
          uint64_t v12 = v2;
          __int16 v13 = 2080;
          uint64_t v14 = "BWE_CloseObject";
          __int16 v15 = 1024;
          int v16 = 8800;
          __int16 v17 = 2048;
          uint64_t v18 = v5;
          __int16 v19 = 1024;
          int v20 = v6;
          __int16 v21 = 1024;
          int v22 = v7;
          _os_log_impl(&dword_221563000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d **Deleted BWE %p for node %d (wProbeSeqId %d)", (uint8_t *)&v11, 0x32u);
        }
      }
      else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v8 = *(void *)(v1 + 736);
        int v9 = *(_DWORD *)(v1 + 116);
        int v10 = *(unsigned __int16 *)(v1 + 744);
        int v11 = 136316418;
        uint64_t v12 = v2;
        __int16 v13 = 2080;
        uint64_t v14 = "BWE_CloseObject";
        __int16 v15 = 1024;
        int v16 = 8800;
        __int16 v17 = 2048;
        uint64_t v18 = v8;
        __int16 v19 = 1024;
        int v20 = v9;
        __int16 v21 = 1024;
        int v22 = v10;
        _os_log_debug_impl(&dword_221563000, v3, OS_LOG_TYPE_DEBUG, " [%s] %s:%d **Deleted BWE %p for node %d (wProbeSeqId %d)", (uint8_t *)&v11, 0x32u);
      }
    }
    GCK_BWE_CloseHandle();
  }
  return result;
}

uint64_t GCKSessionSetLocalName(uint64_t a1, uint64_t a2, int a3)
{
  if (a2 && (a3 & 0x80000000) == 0) {
    CheckInHandleDebug();
  }
  return 2149187586;
}

void GCKSessionConnectToLocalService()
{
  uint64_t v0 = *MEMORY[0x263EF8340];
  CheckInHandleDebug();
}

uint64_t gckSessionAddNode(uint64_t a1, int a2, int a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(unsigned int *)(a1 + 400);
  if ((int)v3 <= 15)
  {
    if ((int)v3 < 1)
    {
      LODWORD(v7) = 0;
    }
    else
    {
      uint64_t v7 = 0;
      uint64_t v8 = (_DWORD *)(a1 + 412);
      while (*(v8 - 2) != a2)
      {
        ++v7;
        v8 += 3;
        if (v3 == v7) {
          goto LABEL_13;
        }
      }
      *v8 |= a3;
    }
    if (v7 == v3)
    {
LABEL_13:
      uint64_t v4 = 0;
      int v9 = (_DWORD *)(a1 + 12 * v3);
      v9[101] = a2;
      v9[102] = -1;
      v9[103] = a3;
      *(_DWORD *)(a1 + 400) = v3 + 1;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    uint64_t v4 = 2149187603;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      int v6 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315650;
        uint64_t v12 = v5;
        __int16 v13 = 2080;
        uint64_t v14 = "gckSessionAddNode";
        __int16 v15 = 1024;
        int v16 = 1021;
        _os_log_impl(&dword_221563000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Max # of nodes reached", (uint8_t *)&v11, 0x1Cu);
      }
    }
  }
  return v4;
}

uint64_t gckSessionLocalClientProc(uint64_t a1)
{
  if (a1) {
    CheckInHandleDebug();
  }
  return -2145779711;
}

uint64_t gckSessionDeleteNode(uint64_t a1, int a2, int a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 136315906;
      uint64_t v21 = v6;
      __int16 v22 = 2080;
      uint64_t v23 = "gckSessionDeleteNode";
      __int16 v24 = 1024;
      int v25 = 1229;
      __int16 v26 = 1024;
      int v27 = a2;
      _os_log_impl(&dword_221563000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Deleting a node %08X", (uint8_t *)&v20, 0x22u);
    }
  }
  uint64_t result = 2149187606;
  uint64_t v9 = *(unsigned int *)(a1 + 400);
  uint64_t v10 = a1 + 404;
  if ((int)v9 < 1)
  {
    LODWORD(v11) = 0;
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v12 = (int *)(a1 + 404);
    while (1)
    {
      int v13 = *v12;
      v12 += 3;
      if (v13 == a2) {
        break;
      }
      if (v9 == ++v11) {
        return result;
      }
    }
  }
  if (v11 != v9)
  {
    uint64_t v14 = (_DWORD *)(v10 + 12 * v11);
    int v15 = v14[1];
    memmove(v14, (const void *)(v10 + 12 * (v11 + 1)), 12 * ((int)v9 + ~v11));
    --*(_DWORD *)(a1 + 400);
    if (v15 != -1 || a3 != 0)
    {
      ++*(_WORD *)(a1 + 388);
      *(_DWORD *)(a1 + 392) = 1;
      uint64_t v17 = *(unsigned int *)(a1 + 112);
      if (a3 && (int)v17 > 0)
      {
        uint64_t v18 = 0;
        uint64_t v19 = a1;
        while (*(_DWORD *)(v19 + 116) != a2)
        {
          ++v18;
          v19 += 480;
          if (v17 == v18) {
            goto LABEL_22;
          }
        }
        memmove((void *)(v19 + 116), (const void *)(v19 + 596), 480 * (~v18 + (int)v17));
        LODWORD(v17) = *(_DWORD *)(a1 + 112) - 1;
        *(_DWORD *)(a1 + 112) = v17;
      }
LABEL_22:
      gckSessionFindShortestPath(v17, (_DWORD *)(a1 + 116));
    }
    return 0;
  }
  return result;
}

void GCKSessionCancelConnectToLocalService()
{
  uint64_t v0 = *MEMORY[0x263EF8340];
  CheckInHandleDebug();
}

uint64_t gckSessionDisconnectNeighbor(uint64_t a1, int a2, int a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  int v20 = (pthread_rwlock_t *)(a1 + 7904);
  pthread_rwlock_wrlock((pthread_rwlock_t *)(a1 + 7904));
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 7800));
  memcpy(__dst, (const void *)(a1 + 116), sizeof(__dst));
  int v6 = __dst[71];
  if (__dst[71] < 1)
  {
    LODWORD(v7) = 0;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = &__dst[72];
    while (1)
    {
      int v9 = *v8;
      v8 += 3;
      if (v9 == a2) {
        break;
      }
      if (__dst[71] == ++v7) {
        goto LABEL_8;
      }
    }
  }
  if (v7 == __dst[71]) {
    goto LABEL_8;
  }
  uint64_t v16 = a1 + 12 * v7;
  BOOL v17 = (*(_DWORD *)(v16 + 412) & ~a3) == 0;
  *(_DWORD *)(v16 + 412) &= ~a3;
  if (v17)
  {
    uint64_t v18 = &__dst[3 * v7 + 72];
    int v19 = v18[1];
    memmove(v18, &__dst[3 * (v7 + 1) + 72], 12 * (v6 + ~v7));
    --__dst[71];
    if (v19 == -1)
    {
      memcpy((void *)(a1 + 116), __dst, 0x1E0uLL);
      *(_DWORD *)(a1 + 392) = 0;
    }
    else
    {
      ++LOWORD(__dst[68]);
      __dst[69] = 1;
      gckSessionSendLSA(a1, 1, __dst, -1, 1);
      memcpy((void *)(a1 + 116), __dst, 0x1E0uLL);
      *(_DWORD *)(a1 + 392) = 0;
      gckSessionFindShortestPath(*(_DWORD *)(a1 + 112), (_DWORD *)(a1 + 116));
    }
LABEL_8:
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 7800));
    uint64_t v10 = *(void *)(a1 + 7888);
    if (v10)
    {
      uint64_t v11 = (os_log_t *)MEMORY[0x263F21098];
      do
      {
        if (*(_DWORD *)(v10 + 116) == a2)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v12 = VRTraceErrorLogLevelToCSTR();
            int v13 = *v11;
            if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
            {
              int v14 = *(_DWORD *)(v10 + 116);
              *(_DWORD *)buf = 136315906;
              uint64_t v22 = v12;
              __int16 v23 = 2080;
              __int16 v24 = "gckSessionDisconnectNeighbor";
              __int16 v25 = 1024;
              int v26 = 3131;
              __int16 v27 = 1024;
              int v28 = v14;
              _os_log_impl(&dword_221563000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckSessionDisconnectNeighbor closing (%d)", buf, 0x22u);
            }
          }
          *(_DWORD *)(v10 + 84) = 1;
        }
        uint64_t v10 = *(void *)(v10 + 728);
      }
      while (v10);
    }
    return pthread_rwlock_unlock(v20);
  }
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 7800));
  return pthread_rwlock_unlock(v20);
}

void GCKSessionRespondToInvitation()
{
  uint64_t v0 = *MEMORY[0x263EF8340];
  CheckInHandleDebug();
}

uint64_t gckSessionSendDD(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v27 = v6;
  long long v28 = v6;
  int v26 = (void *)0xAAAAAAAAAAAAAAAALL;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = " back";
      *(_DWORD *)buf = 136316162;
      if (a3) {
        int v9 = "";
      }
      uint64_t v30 = v7;
      __int16 v31 = 2080;
      __int16 v32 = "gckSessionSendDD";
      __int16 v33 = 1024;
      int v34 = 1718;
      __int16 v35 = 2080;
      __int16 v36 = v9;
      __int16 v37 = 1024;
      unsigned int v38 = a2;
      _os_log_impl(&dword_221563000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Sending DD%s to [%08X]", buf, 0x2Cu);
    }
  }
  uint64_t v10 = 2149187606;
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 7800));
  int v11 = *(_DWORD *)(a1 + 112);
  HIDWORD(v27) = v11;
  *(void *)&long long v28 = a1 + 116;
  uint64_t v12 = *(void *)(a1 + 7888);
  if (!v12)
  {
LABEL_9:
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 7800));
    return v10;
  }
  while (*(_DWORD *)(v12 + 116) != a2)
  {
    uint64_t v12 = *(void *)(v12 + 728);
    if (!v12) {
      goto LABEL_9;
    }
  }
  if (!*(_DWORD *)(v12 + 88))
  {
    ++*(_WORD *)(a1 + 388);
    *(_DWORD *)(a1 + 392) = 1;
  }
  TracePrintNodes(v11, a1 + 116);
  uint64_t v14 = OSPFMakeDD((Bytef **)&v26, (uint64_t)&v27, 0, *(_DWORD *)(a1 + 108), a2, *(_DWORD *)(v12 + 48));
  *(_DWORD *)(v12 + 88) = 1;
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 7800));
  if ((v14 & 0x80000000) != 0) {
    return 2149187618;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    uint64_t v16 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v30 = v15;
      __int16 v31 = 2080;
      __int16 v32 = "gckSessionSendDD";
      __int16 v33 = 1024;
      int v34 = 1753;
      __int16 v35 = 1024;
      LODWORD(v36) = v14;
      _os_log_impl(&dword_221563000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Made DD of %d bytes", buf, 0x22u);
    }
  }
  if (!a3)
  {
    uint64_t v10 = SendUDPPacketToParticipantChannelID(a1, v26, v14, a2, 0, -1, 0);
LABEL_26:
    free(v26);
    return v10;
  }
  uint64_t v17 = *(void *)(a1 + 7888);
  if (!v17)
  {
LABEL_21:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        gckSessionSendDD_cold_1();
      }
    }
    goto LABEL_26;
  }
  while (*(_DWORD *)(v17 + 116) != a2)
  {
    uint64_t v17 = *(void *)(v17 + 728);
    if (!v17) {
      goto LABEL_21;
    }
  }
  uint64_t v18 = (pthread_mutex_t *)(v17 + 664);
  pthread_mutex_lock((pthread_mutex_t *)(v17 + 664));
  uint64_t v19 = *(void *)(v17 + 496);
  if (v19)
  {
    while (1)
    {
      uint64_t v20 = v19;
      if (*(unsigned char *)v19 == 2) {
        break;
      }
      uint64_t v19 = *(void *)(v19 + 64);
      if (!v19)
      {
        uint64_t v21 = (void *)(v20 + 64);
        goto LABEL_32;
      }
    }
    *(_OWORD *)(v19 + 8) = xmmword_2215E8980;
    *(void *)(v19 + 32) = 0x4082BFEB851EB852;
    __int16 v24 = *(void **)(v19 + 40);
    if (v24) {
      free(v24);
    }
    *(void *)(v20 + 40) = v26;
    *(_DWORD *)(v20 + 48) = v14;
    *(_DWORD *)(v20 + 52) = a2;
  }
  else
  {
    uint64_t v21 = (void *)(v17 + 496);
LABEL_32:
    uint64_t v22 = (char *)malloc_type_calloc(1uLL, 0x48uLL, 0x10200409EACE7F9uLL);
    *uint64_t v22 = 2;
    *(_OWORD *)(v22 + 8) = xmmword_2215E8980;
    __int16 v23 = v26;
    *((void *)v22 + 4) = 0x4082BFEB851EB852;
    *((void *)v22 + 5) = v23;
    *((_DWORD *)v22 + 12) = v14;
    *((_DWORD *)v22 + 13) = a2;
    *uint64_t v21 = v22;
  }
  pthread_mutex_unlock(v18);
  int v25 = *(_DWORD *)(a1 + 12);
  if (v25 != -1)
  {
    *(_DWORD *)(a1 + 12) = -1;
    close(v25);
  }
  return 0;
}

void GCKSessionPrepareConnection()
{
}

void GCKSessionPrepareConnectionWithRelayInfo()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  uint64_t v0 = 0;
  CheckInHandleDebug();
}

uint64_t gckSessionCreateSocketAndBind(long long *a1, int a2, int a3, int **a4)
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  *(void *)&v8.sa_len = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&v8.sa_data[6] = 0xAAAAAAAAAAAAAAAALL;
  v64[3] = v8;
  v64[4] = v8;
  v64[2] = v8;
  *(void *)((char *)v64 + 14) = 0xAAAAAAAAAAAAAAAALL;
  sockaddr v63 = v8;
  v64[0] = v8;
  sockaddr v62 = v8;
  socklen_t v38 = -1431655766;
  memset(v39, 170, 6);
  unint64_t v61 = 0xAAAAAAAAAAAAAAAALL;
  sockaddr v59 = v8;
  sockaddr v60 = v8;
  *(sockaddr *)&v37.ai_addrlen = v8;
  *(sockaddr *)&v37.ai_addr = v8;
  *(sockaddr *)&v37.ai_flags = v8;
  __int16 v36 = (addrinfo *)0xAAAAAAAAAAAAAAAALL;
  sockaddr v57 = v8;
  sockaddr v58 = v8;
  sockaddr v55 = v8;
  sockaddr v56 = v8;
  sockaddr v53 = v8;
  sockaddr v54 = v8;
  sockaddr v51 = v8;
  sockaddr v52 = v8;
  int v9 = (char *)malloc_type_calloc(1uLL, 0x300uLL, 0x10200408D2C4DCCuLL);
  if (!v9)
  {
    uint64_t v16 = 2149187587;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        gckSessionCreateSocketAndBind_cold_1();
      }
    }
    return v16;
  }
  uint64_t v10 = (int *)v9;
  *((_DWORD *)v9 + 29) = a2;
  *((_DWORD *)v9 + 25) = a3;
  *(void *)(v9 + 108) = -1;
  *((_DWORD *)v9 + 102) = 0;
  long long v11 = *a1;
  long long v12 = a1[1];
  *(void *)(v9 + 444) = *((void *)a1 + 4);
  *(_OWORD *)(v9 + 412) = v11;
  *(_OWORD *)(v9 + 428) = v12;
  int v13 = *(_DWORD *)a1;
  if (*(_DWORD *)a1) {
    int ai_family = 30;
  }
  else {
    int ai_family = 2;
  }
  memset(&v37.ai_socktype, 0, 40);
  v37.ai_flags = 5;
  v37.int ai_family = ai_family;
  v37.ai_socktype = 2;
  if (v13)
  {
    if (*(void *)((char *)a1 + 20) != *MEMORY[0x263EF88F0]
      || *(void *)((char *)a1 + 28) != *(void *)(MEMORY[0x263EF88F0] + 8))
    {
      goto LABEL_7;
    }
LABEL_16:
    uint64_t v15 = 0;
    goto LABEL_17;
  }
  if (!*((_DWORD *)a1 + 5)) {
    goto LABEL_16;
  }
LABEL_7:
  uint64_t v15 = (const char *)IPToString();
LABEL_17:
  __sprintf_chk(v39, 0, 6uLL, "%u", *((unsigned __int16 *)a1 + 18));
  int v18 = getaddrinfo(v15, v39, &v37, &v36);
  if (v18)
  {
    uint64_t v16 = v18 | 0xB01A0000;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        gckSessionCreateSocketAndBind_cold_7();
      }
    }
LABEL_62:
    free(v10);
    return v16;
  }
  uint64_t v19 = v36;
  if (v36)
  {
    uint64_t v20 = v36;
    while (v20->ai_family != ai_family)
    {
      uint64_t v20 = v20->ai_next;
      if (!v20)
      {
        int ai_family = v36->ai_family;
        goto LABEL_30;
      }
    }
    uint64_t v19 = v20;
LABEL_30:
    v10[18] = -1;
    int v21 = socket(ai_family, v19->ai_socktype, v19->ai_protocol);
    *uint64_t v10 = v21;
    if (v21 == -1)
    {
      uint64_t v16 = *__error() | 0xC00F0000;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
          gckSessionCreateSocketAndBind_cold_3();
        }
      }
      freeaddrinfo(v36);
      goto LABEL_62;
    }
    int v35 = 1;
    if (v13)
    {
      setsockopt(v21, 41, 27, &v35, 4u);
      if (*((unsigned char *)a1 + 1))
      {
        *(_DWORD *)buf = 1;
        setsockopt(*v10, 0xFFFF, 4356, buf, 4u);
      }
      int v22 = *v10;
      int v23 = 41;
      int v24 = 61;
    }
    else
    {
      *(_DWORD *)buf = if_nametoindex((const char *)a1 + 4);
      setsockopt(*v10, 0, 25, buf, 4u);
      setsockopt(*v10, 0, 7, &v35, 4u);
      int v22 = *v10;
      int v23 = 0;
      int v24 = 20;
    }
    setsockopt(v22, v23, v24, &v35, 4u);
    int v34 = 1;
    setsockopt(*v10, 0xFFFF, 4130, &v34, 4u);
    int v33 = 500;
    setsockopt(*v10, 0xFFFF, 4230, &v33, 4u);
    ai_addr = v19->ai_addr;
    unsigned int v26 = 16402;
    do
    {
      *(_WORD *)ai_addr->sa_data = bswap32(v26) >> 16;
      if (!bind(*v10, v19->ai_addr, v19->ai_addrlen))
      {
        freeaddrinfo(v36);
        goto LABEL_48;
      }
      --v26;
    }
    while ((unsigned __int16)v26 >= 0x4000u);
    *(_WORD *)ai_addr->sa_data = 0;
    int v27 = bind(*v10, v19->ai_addr, v19->ai_addrlen);
    freeaddrinfo(v36);
    if (v27)
    {
      uint64_t v16 = *__error() | 0xC00F0000;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
          gckSessionCreateSocketAndBind_cold_6();
        }
      }
LABEL_61:
      close(*v10);
      goto LABEL_62;
    }
LABEL_48:
    socklen_t v38 = 128;
    if (getsockname(*v10, &v51, &v38) == -1)
    {
      uint64_t v16 = *__error() | 0xC01A0000;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
          gckSessionCreateSocketAndBind_cold_4();
        }
      }
      goto LABEL_61;
    }
    SAToIPPORT();
    *((_WORD *)v10 + 224) = WORD2(v61);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v28 = VRTraceErrorLogLevelToCSTR();
      __int16 v29 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v30 = IPPORTToStringWithSize();
        int v31 = *v10;
        *(_DWORD *)buf = 136316674;
        *(void *)&uint8_t buf[4] = v28;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "gckSessionCreateSocketAndBind";
        __int16 v41 = 1024;
        int v42 = 982;
        __int16 v43 = 1024;
        int v44 = a2;
        __int16 v45 = 2080;
        uint64_t v46 = v30;
        __int16 v47 = 2080;
        int v48 = v10 + 104;
        __int16 v49 = 1024;
        int v50 = v31;
        _os_log_impl(&dword_221563000, v29, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d For remoteID[%08X]: Start listening on %s(%s) sock %d\n", buf, 0x3Cu);
      }
    }
    *((void *)v10 + 50) = 0;
    memset(buf, 170, 16);
    if (!pthread_mutexattr_init((pthread_mutexattr_t *)buf))
    {
      pthread_mutexattr_settype((pthread_mutexattr_t *)buf, 2);
      pthread_mutex_init((pthread_mutex_t *)(v10 + 166), (const pthread_mutexattr_t *)buf);
      pthread_mutexattr_destroy((pthread_mutexattr_t *)buf);
      uint64_t v16 = 0;
      *((void *)v10 + 92) = 0xFFFFFFFFLL;
      *((_WORD *)v10 + 372) = 0;
      *(void *)(v10 + 187) = 0;
      *a4 = v10;
      return v16;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        gckSessionCreateSocketAndBind_cold_5();
      }
    }
    close(*v10);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
      gckSessionCreateSocketAndBind_cold_2();
    }
  }
  free(v10);
  return 2149187588;
}

char *GCKGetNAT64Prefix(uint64_t a1, uint64_t a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(char **)(a1 + 8496);
  if (v4)
  {
    int v5 = *(_DWORD *)a2 & 1;
    do
    {
      if ((*(_DWORD *)v4 & 1) == v5)
      {
        if (v5)
        {
          if (*(void *)(v4 + 20) == *(void *)(a2 + 20) && *(void *)(v4 + 28) == *(void *)(a2 + 28))
          {
LABEL_12:
            if (*((unsigned __int16 *)v4 + 18) == *(unsigned __int16 *)(a2 + 36)) {
              return v4 + 40;
            }
          }
        }
        else if (*((_DWORD *)v4 + 5) == *(_DWORD *)(a2 + 20))
        {
          goto LABEL_12;
        }
      }
      uint64_t v4 = (char *)*((void *)v4 + 7);
      *(void *)(a1 + 8496) = v4;
    }
    while (v4);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    sockaddr v8 = *MEMORY[0x263F21098];
    int v9 = *MEMORY[0x263F21098];
    if (*MEMORY[0x263F21088])
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v25 = v7;
        __int16 v26 = 2080;
        int v27 = "GCKGetNAT64Prefix";
        __int16 v28 = 1024;
        int v29 = 447;
        __int16 v30 = 2080;
        int v31 = (const char *)(a2 + 4);
        __int16 v32 = 2048;
        double v33 = micro();
        _os_log_impl(&dword_221563000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKGetNAT64Prefix: start NAT64 prefix resolution for %s at %f", buf, 0x30u);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      GCKGetNAT64Prefix_cold_3();
    }
  }
  uint64_t v4 = (char *)malloc_type_calloc(1uLL, 0x40uLL, 0x10200406CABA15FuLL);
  *(void *)(a1 + 8496) = v4;
  uint64_t v10 = *(void *)(a2 + 32);
  long long v11 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v4 = *(_OWORD *)a2;
  *((_OWORD *)v4 + 1) = v11;
  *((void *)v4 + 4) = v10;
  long long v12 = (const char *)(a2 + 4);
  if_nametoindex(v12);
  int v13 = nw_nat64_copy_prefixes();
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v13 < 1)
  {
    if (ErrorLogLevelForModule >= 8)
    {
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      uint64_t v20 = *MEMORY[0x263F21098];
      int v21 = *MEMORY[0x263F21098];
      if (*MEMORY[0x263F21088])
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          double v22 = micro();
          *(_DWORD *)buf = 136316162;
          uint64_t v25 = v19;
          __int16 v26 = 2080;
          int v27 = "GCKGetNAT64Prefix";
          __int16 v28 = 1024;
          int v29 = 458;
          __int16 v30 = 2080;
          int v31 = v12;
          __int16 v32 = 2048;
          double v33 = v22;
          _os_log_impl(&dword_221563000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKGetNAT64Prefix: no NAT64 prefix discovered for %s at %f", buf, 0x30u);
        }
      }
      else if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        GCKGetNAT64Prefix_cold_2();
      }
    }
  }
  else
  {
    if (ErrorLogLevelForModule >= 8)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      uint64_t v16 = *MEMORY[0x263F21098];
      uint64_t v17 = *MEMORY[0x263F21098];
      if (*MEMORY[0x263F21088])
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          double v18 = micro();
          *(_DWORD *)buf = 136316162;
          uint64_t v25 = v15;
          __int16 v26 = 2080;
          int v27 = "GCKGetNAT64Prefix";
          __int16 v28 = 1024;
          int v29 = 454;
          __int16 v30 = 2080;
          int v31 = v12;
          __int16 v32 = 2048;
          double v33 = v18;
          _os_log_impl(&dword_221563000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKGetNAT64Prefix: NAT64 prefix resolved for %s at %f", buf, 0x30u);
        }
      }
      else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        GCKGetNAT64Prefix_cold_1();
      }
    }
    *(_OWORD *)(v4 + 40) = MEMORY[0];
    free(0);
  }
  return v4 + 40;
}

void GCKSessionEstablishConnection()
{
}

void GCKSessionEstablishConnectionWithRelayInfo()
{
}

uint64_t gckSessionChangeState(uint64_t a1, int a2, int a3)
{
  long long v6 = (pthread_rwlock_t *)(a1 + 7904);
  pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 7904));
  for (uint64_t i = *(void *)(a1 + 7888); i; uint64_t i = *(void *)(i + 728))
  {
    if (*(_DWORD *)(i + 116) == a2)
    {
      pthread_mutex_lock((pthread_mutex_t *)(i + 664));
      gckSessionChangeStateCList(a1, i, a3);
      pthread_mutex_unlock((pthread_mutex_t *)(i + 664));
    }
  }
  return pthread_rwlock_unlock(v6);
}

void gckHandleRetryICEReport()
{
  uint64_t v0 = *MEMORY[0x263EF8340];
  CheckInHandleDebug();
}

uint64_t xdr_chanstat_node(XDR *a1, uint64_t a2)
{
  if (xdr_u_int32_t(a1, (u_int32_t *)a2)
    && xdr_u_int32_t(a1, (u_int32_t *)(a2 + 4))
    && xdr_u_int16_t(a1, (u_int16_t *)(a2 + 8))
    && xdr_u_int16_t(a1, (u_int16_t *)(a2 + 10))
    && xdr_u_int32_t(a1, (u_int32_t *)(a2 + 12))
    && xdr_u_int64_t(a1, (u_int64_t *)(a2 + 16))
    && xdr_u_int64_t(a1, (u_int64_t *)(a2 + 24))
    && xdr_u_int32_t(a1, (u_int32_t *)(a2 + 32))
    && xdr_u_int32_t(a1, (u_int32_t *)(a2 + 36))
    && xdr_float(a1, (float *)(a2 + 40))
    && xdr_float(a1, (float *)(a2 + 44))
    && xdr_float(a1, (float *)(a2 + 48))
    && xdr_float(a1, (float *)(a2 + 52))
    && xdr_float(a1, (float *)(a2 + 56))
    && xdr_u_int32_t(a1, (u_int32_t *)(a2 + 64))
    && xdr_u_int32_t(a1, (u_int32_t *)(a2 + 68))
    && xdr_u_int32_t(a1, (u_int32_t *)(a2 + 72)))
  {
    uint64_t v4 = 0;
    while (xdr_u_int32_t(a1, (u_int32_t *)(a2 + 76 + v4)))
    {
      v4 += 4;
      if (v4 == 64)
      {
        return xdr_pointer(a1, (char **)(a2 + 144), 0x98u, (xdrproc_t)xdr_chanstat_node);
      }
    }
  }
  return 0;
}

void gckHandleRetryICEPreparation()
{
  uint64_t v0 = *MEMORY[0x263EF8340];
  CheckInHandleDebug();
}

uint64_t GCKSessionPrepareRetryICE(uint64_t a1, int a2)
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  uint64_t v3 = 2149187606;
  sockaddr v59 = 0;
  unint64_t v60 = 0xAAAAAAAAAAAAAAAALL;
  int LocalInterfaceListWithOptions = GetLocalInterfaceListWithOptions();
  if (!LocalInterfaceListWithOptions)
  {
    FreeLocalInterfaceList();
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        GCKSessionPrepareRetryICE_cold_1();
      }
    }
    int v48 = 0;
LABEL_76:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v52 = VRTraceErrorLogLevelToCSTR();
      sockaddr v53 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v62 = v52;
        __int16 v63 = 2080;
        int v64 = "GCKSessionPrepareRetryICE";
        __int16 v65 = 1024;
        int v66 = 2130;
        __int16 v67 = 1024;
        int v68 = a2;
        __int16 v69 = 1024;
        int v70 = v48;
        _os_log_error_impl(&dword_221563000, v53, OS_LOG_TYPE_ERROR, " [%s] %s:%d remoteID[%08X]: %d valid interfaces found", buf, 0x28u);
      }
    }
    return v3;
  }
  int v5 = LocalInterfaceListWithOptions;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v62 = v6;
      __int16 v63 = 2080;
      int v64 = "GCKSessionPrepareRetryICE";
      __int16 v65 = 1024;
      int v66 = 2001;
      __int16 v67 = 1024;
      int v68 = a2;
      __int16 v69 = 1024;
      int v70 = v5;
      _os_log_impl(&dword_221563000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d For remoteID[%08X]: %d interfaces found.\n", buf, 0x28u);
    }
  }
  if (v5 < 1)
  {
    int v48 = 0;
    goto LABEL_70;
  }
  uint64_t v8 = 0;
  uint64_t v55 = 0;
  int v9 = (pthread_rwlock_t *)(a1 + 7904);
  uint64_t v10 = (uint64_t *)(a1 + 7888);
  uint64_t v56 = v5;
  do
  {
    unsigned int v11 = if_nametoindex((const char *)(v60 + 40 * v8 + 4));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      int v13 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v62 = v12;
        __int16 v63 = 2080;
        int v64 = "GCKSessionPrepareRetryICE";
        __int16 v65 = 1024;
        int v66 = 2006;
        __int16 v67 = 1024;
        int v68 = v8;
        __int16 v69 = 1024;
        int v70 = v11;
        _os_log_impl(&dword_221563000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d check %d iIFIndex %d", buf, 0x28u);
      }
    }
    sockaddr v58 = 0;
    pthread_rwlock_wrlock(v9);
    uint64_t v14 = v9;
    uint64_t v15 = *v10;
    sockaddr v59 = (int *)v15;
    if (!v15)
    {
      pthread_rwlock_unlock(v14);
      sockaddr v59 = 0;
      int v19 = a2;
      int v9 = v14;
      goto LABEL_47;
    }
    uint64_t v16 = v10;
    uint64_t v17 = 0;
    int v18 = 0;
    int v19 = a2;
    do
    {
      if (*(_DWORD *)(v15 + 104) != v11 || *(_DWORD *)(v15 + 116) != v19) {
        goto LABEL_22;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v20 = VRTraceErrorLogLevelToCSTR();
        int v21 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          int v22 = *(_DWORD *)(v15 + 100);
          *(_DWORD *)buf = 136316162;
          uint64_t v62 = v20;
          __int16 v63 = 2080;
          int v64 = "GCKSessionPrepareRetryICE";
          __int16 v65 = 1024;
          int v66 = 2019;
          __int16 v67 = 1024;
          int v68 = v22;
          __int16 v69 = 1024;
          int v70 = v11;
          _os_log_impl(&dword_221563000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d found channel %d iIFIndex %d", buf, 0x28u);
        }
      }
      int v23 = *(_DWORD *)(v15 + 108);
      int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      if ((v23 & 0x80000000) == 0)
      {
        if (ErrorLogLevelForModule >= 7)
        {
          uint64_t v25 = VRTraceErrorLogLevelToCSTR();
          __int16 v26 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            int v27 = *(_DWORD *)(v15 + 108);
            *(_DWORD *)buf = 136316162;
            uint64_t v62 = v25;
            __int16 v63 = 2080;
            int v64 = "GCKSessionPrepareRetryICE";
            __int16 v65 = 1024;
            int v66 = 2022;
            __int16 v67 = 1024;
            int v68 = v27;
            __int16 v69 = 1024;
            int v70 = v11;
            _os_log_impl(&dword_221563000, v26, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d channel priority %d iIFIndex %d", buf, 0x28u);
          }
        }
        int v18 = 1;
        int v19 = a2;
LABEL_22:
        uint64_t v16 = (uint64_t *)(v15 + 728);
        goto LABEL_23;
      }
      if (ErrorLogLevelForModule >= 7)
      {
        uint64_t v28 = VRTraceErrorLogLevelToCSTR();
        int v29 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          int v30 = *(_DWORD *)(v15 + 112);
          *(_DWORD *)buf = 136316162;
          uint64_t v62 = v28;
          __int16 v63 = 2080;
          int v64 = "GCKSessionPrepareRetryICE";
          __int16 v65 = 1024;
          int v66 = 2025;
          __int16 v67 = 1024;
          int v68 = v30;
          __int16 v69 = 1024;
          int v70 = v11;
          _os_log_impl(&dword_221563000, v29, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d remove original %d iIFIndex %d", buf, 0x28u);
        }
      }
      *uint64_t v16 = *(void *)(v15 + 728);
      uint64_t v17 = v59;
      *((void *)v59 + 91) = v58;
      sockaddr v58 = v17;
      int v19 = a2;
LABEL_23:
      uint64_t v15 = *v16;
      sockaddr v59 = (int *)v15;
    }
    while (v15);
    int v9 = (pthread_rwlock_t *)(a1 + 7904);
    pthread_rwlock_unlock((pthread_rwlock_t *)(a1 + 7904));
    if (v17)
    {
      do
      {
        int v31 = v17;
        sockaddr v58 = (int *)*((void *)v17 + 91);
        if (*v17 != -1)
        {
          close(*v17);
          *uint64_t v17 = -1;
        }
        int v32 = v17[18];
        if (v32 != -1)
        {
          close(v32);
          v17[18] = -1;
        }
        ICERemoveOneInterface();
        double v33 = &v58;
        do
        {
          uint64_t v34 = v33;
          int v35 = *v33;
          double v33 = (int **)(*v33 + 182);
          if (v35) {
            BOOL v36 = v35 == v17;
          }
          else {
            BOOL v36 = 1;
          }
        }
        while (!v36);
        if (v35)
        {
          *uint64_t v34 = (int *)*((void *)v35 + 91);
          *((void *)v35 + 91) = *(void *)(a1 + 7896);
          *(void *)(a1 + 7896) = v35;
        }
        uint64_t v17 = v58;
      }
      while (v58);
    }
    else
    {
      int v31 = 0;
    }
    sockaddr v59 = v31;
    uint64_t v10 = (uint64_t *)(a1 + 7888);
    if (!v18)
    {
LABEL_47:
      if ((gckSessionCreateSocketAndBind((long long *)(v60 + 40 * v8), v19, *(_DWORD *)(a1 + 88), &v59) & 0x80000000) == 0)
      {
        addrinfo v37 = v59;
        *((void *)v59 + 49) = 0x404DFEB851EB851FLL;
        *((void *)v37 + 48) = *(void *)(a1 + 24);
        v37[26] = v11;
        int v38 = ICEAddOneInterface();
        int v39 = VRTraceGetErrorLogLevelForModule();
        if (v38 < 0)
        {
          if (v39 >= 3)
          {
            uint64_t v45 = VRTraceErrorLogLevelToCSTR();
            uint64_t v46 = *MEMORY[0x263F21098];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316162;
              uint64_t v62 = v45;
              __int16 v63 = 2080;
              int v64 = "GCKSessionPrepareRetryICE";
              __int16 v65 = 1024;
              int v66 = 2059;
              __int16 v67 = 1024;
              int v68 = a2;
              __int16 v69 = 1024;
              int v70 = 6;
              _os_log_error_impl(&dword_221563000, v46, OS_LOG_TYPE_ERROR, " [%s] %s:%d GCKSessionPrepareRetryICE: FAILURE adding interface for remoteID[%08X]: proto %d", buf, 0x28u);
            }
          }
          close(*v37);
          freeOptionsList((uint64_t *)v37 + 64);
          freeOptionsList((uint64_t *)v37 + 65);
          pthread_mutex_destroy((pthread_mutex_t *)(v37 + 166));
          BWE_CloseObject((uint64_t)v37);
          free(v37);
        }
        else
        {
          if (v39 >= 7)
          {
            uint64_t v40 = VRTraceErrorLogLevelToCSTR();
            __int16 v41 = *MEMORY[0x263F21098];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              uint64_t v62 = v40;
              __int16 v63 = 2080;
              int v64 = "GCKSessionPrepareRetryICE";
              __int16 v65 = 1024;
              int v66 = 2069;
              __int16 v67 = 1024;
              int v68 = a2;
              __int16 v69 = 1024;
              int v70 = 6;
              _os_log_impl(&dword_221563000, v41, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionPrepareRetryICE: SUCCESS adding interface for remoteID[%08X]: proto %d", buf, 0x28u);
            }
          }
          *((_OWORD *)v37 + 34) = 0u;
          *((_WORD *)v37 + 284) = 1;
          *((_WORD *)v37 + 309) = 0;
          *(_OWORD *)((char *)v37 + 570) = 0u;
          *(_OWORD *)((char *)v37 + 586) = 0u;
          *(_OWORD *)((char *)v37 + 602) = 0u;
          pthread_rwlock_wrlock(v9);
          int v42 = (int **)v10;
          do
          {
            __int16 v43 = v42;
            int v44 = *v42;
            int v42 = (int **)(*v42 + 182);
          }
          while (v44);
          *__int16 v43 = v37;
          pthread_rwlock_unlock(v9);
          ++*(_DWORD *)(a1 + 88);
          LODWORD(v55) = 1;
          ++HIDWORD(v55);
        }
      }
    }
    ++v8;
  }
  while (v8 != v56);
  if (v55)
  {
    pthread_rwlock_rdlock(v9);
    int v47 = *(_DWORD *)(a1 + 12);
    uint64_t v3 = 2149187606;
    int v48 = HIDWORD(v55);
    if (v47 != -1)
    {
      *(_DWORD *)(a1 + 12) = -1;
      close(v47);
    }
    pthread_rwlock_unlock(v9);
  }
  else
  {
    uint64_t v3 = 2149187606;
    int v48 = HIDWORD(v55);
  }
LABEL_70:
  FreeLocalInterfaceList();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v49 = VRTraceErrorLogLevelToCSTR();
    int v50 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v62 = v49;
      __int16 v63 = 2080;
      int v64 = "GCKSessionPrepareRetryICE";
      __int16 v65 = 1024;
      int v66 = 2112;
      __int16 v67 = 1024;
      int v68 = a2;
      __int16 v69 = 1024;
      int v70 = v48;
      _os_log_impl(&dword_221563000, v50, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d For remoteID[%08X]: %d valid interfaces found.\n", buf, 0x28u);
    }
  }
  if (!v48) {
    goto LABEL_76;
  }
  uint64_t v51 = ICEGetCandidates();
  uint64_t v3 = 0;
  if ((v51 & 0x80000000) != 0)
  {
    uint64_t v3 = v51;
    goto LABEL_76;
  }
  return v3;
}

void GCKSessionSendDOOB(uint64_t a1, int a2, const UInt8 *a3, int a4, unsigned int a5, double a6)
{
  *(_WORD *)bytes = __rev16(a5);
  Mutable = CFDataCreateMutable(0, 0);
  CFDataAppendBytes(Mutable, bytes, 2);
  if (a3 && a4) {
    CFDataAppendBytes(Mutable, a3, a4);
  }
  uint64_t v12 = *(void *)(a1 + 96);
  if (*(_DWORD *)(a1 + 108) == a2) {
    int v13 = 8;
  }
  else {
    int v13 = 7;
  }
  BytePtr = CFDataGetBytePtr(Mutable);
  int Length = CFDataGetLength(Mutable);
  if (a6 <= 0.0)
  {
    PostEventCallback(v12, a2, v13, BytePtr, Length, 1);
  }
  else
  {
    double v16 = micro();
    WaitEventCallback(v12, a2, v13, BytePtr, Length, 1, v16 + a6);
  }
  CFRelease(Mutable);
}

void gckHandleRetryICEValidationTimeout()
{
  uint64_t v0 = *MEMORY[0x263EF8340];
  CheckInHandleDebug();
}

uint64_t gckSessionChangeStateCList(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  uint64_t v3 = 2149187628;
  unsigned int v7 = *(_DWORD *)(a2 + 408);
  switch(a3)
  {
    case 0:
      if (v7 <= 1) {
        int v8 = 1;
      }
      else {
        int v8 = *(_DWORD *)(a2 + 408);
      }
      goto LABEL_26;
    case 1:
    case 2:
      if (v7 == 1) {
        int v8 = 2;
      }
      else {
        int v8 = *(_DWORD *)(a2 + 408);
      }
      goto LABEL_26;
    case 3:
      if (v7 <= 3) {
        int v8 = 3;
      }
      else {
        int v8 = *(_DWORD *)(a2 + 408);
      }
      goto LABEL_26;
    case 4:
      if (v7 > 3 || v7 == 1) {
        return v3;
      }
      int v8 = 4;
      goto LABEL_27;
    case 5:
    case 11:
      int v9 = *(_DWORD *)(a1 + 104);
      if (v9 == 1)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v14 = VRTraceErrorLogLevelToCSTR();
          unsigned int v11 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            int v51 = 136315650;
            uint64_t v52 = v14;
            __int16 v53 = 2080;
            sockaddr v54 = "gckSessionChangeStateCList";
            __int16 v55 = 1024;
            int v56 = 2225;
            uint64_t v12 = " [%s] %s:%d localscopeDisconnectedForced";
            goto LABEL_24;
          }
        }
      }
      else if (!v9 && (int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        unsigned int v11 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          int v51 = 136315650;
          uint64_t v52 = v10;
          __int16 v53 = 2080;
          sockaddr v54 = "gckSessionChangeStateCList";
          __int16 v55 = 1024;
          int v56 = 2221;
          uint64_t v12 = " [%s] %s:%d globalscopeDisconnectedForced";
LABEL_24:
          _os_log_impl(&dword_221563000, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v51, 0x1Cu);
        }
      }
      int v8 = 4;
LABEL_26:
      if (v7 == v8) {
        return v3;
      }
LABEL_27:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        double v16 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          int v17 = *(_DWORD *)(a2 + 116);
          int v51 = 136316674;
          uint64_t v52 = v15;
          __int16 v53 = 2080;
          sockaddr v54 = "gckSessionChangeStateCList";
          __int16 v55 = 1024;
          int v56 = 2232;
          __int16 v57 = 1024;
          int v58 = v17;
          __int16 v59 = 1024;
          int v60 = a3;
          __int16 v61 = 1024;
          unsigned int v62 = v7;
          __int16 v63 = 1024;
          int v64 = v8;
          _os_log_impl(&dword_221563000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [%08X] State Change with event %d: %d -> %d", (uint8_t *)&v51, 0x34u);
        }
      }
      if (v8 != 4) {
        goto LABEL_89;
      }
      pthread_mutex_lock((pthread_mutex_t *)(a1 + 7800));
      if (a3 != 4) {
        goto LABEL_56;
      }
      int v18 = *(_DWORD *)(a1 + 104);
      if (v18 == 1 || v7 != 3) {
        goto LABEL_56;
      }
      if (*(double *)(a2 + 400) != 0.0) {
        goto LABEL_58;
      }
      uint64_t v19 = *(unsigned int *)(a1 + 400);
      if ((int)v19 < 1)
      {
        LODWORD(v20) = 0;
      }
      else
      {
        uint64_t v20 = 0;
        int v21 = (int *)(a1 + 404);
        while (1)
        {
          int v22 = *v21;
          v21 += 3;
          if (v22 == *(_DWORD *)(a2 + 116)) {
            break;
          }
          if (v19 == ++v20) {
            goto LABEL_56;
          }
        }
      }
      if (v20 != v19)
      {
        uint64_t v23 = a1 + 404 + 12 * v20;
        int v25 = *(_DWORD *)(v23 + 4);
        int v24 = (_DWORD *)(v23 + 4);
        if (v25 != -1)
        {
          *int v24 = -1;
          gckSessionFindShortestPath(*(_DWORD *)(a1 + 112), (_DWORD *)(a1 + 116));
          uint64_t v26 = *(unsigned int *)(a1 + 112);
          if ((int)v26 >= 1)
          {
            uint64_t v27 = 0;
            uint64_t v28 = (int *)(a2 + 116);
            uint64_t v29 = 480 * v26;
            while (*(_DWORD *)(a1 + v27 + 116) != *(_DWORD *)(a2 + 116))
            {
              v27 += 480;
              if (v29 == v27) {
                goto LABEL_56;
              }
            }
            if (*(_DWORD *)(a1 + v27 + 120) != -1)
            {
              *(double *)(a2 + 400) = micro();
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                uint64_t v30 = VRTraceErrorLogLevelToCSTR();
                int v31 = *MEMORY[0x263F21098];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
                {
                  int v32 = *v28;
                  int v51 = 136315906;
                  uint64_t v52 = v30;
                  __int16 v53 = 2080;
                  sockaddr v54 = "gckSessionChangeStateCList";
                  __int16 v55 = 1024;
                  int v56 = 2281;
                  __int16 v57 = 1024;
                  int v58 = v32;
                  _os_log_impl(&dword_221563000, v31, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ====== remain connected to peer (%08X) =====", (uint8_t *)&v51, 0x22u);
                }
              }
              gckSessionSendLSA(a1, *(_DWORD *)(a1 + 112), (void *)(a1 + 116), *v28, 0);
              gckSessionCleanupNodes(a1, -1, 0);
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                uint64_t v33 = VRTraceErrorLogLevelToCSTR();
                uint64_t v34 = *MEMORY[0x263F21098];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
                {
                  int v35 = *v28;
                  int v51 = 136315906;
                  uint64_t v52 = v33;
                  __int16 v53 = 2080;
                  sockaddr v54 = "gckSessionChangeStateCList";
                  __int16 v55 = 1024;
                  int v56 = 2286;
                  __int16 v57 = 1024;
                  int v58 = v35;
                  _os_log_impl(&dword_221563000, v34, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ====== async validate viability (%08X) =====", (uint8_t *)&v51, 0x22u);
                }
              }
              GCKSessionSendDOOB(a1, *v28, 0, 0, 6u, 10.0);
              GCKSessionSendDOOB(a1, *(_DWORD *)(a1 + 108), (const UInt8 *)(a2 + 116), 4, 8u, 17.0);
              int v8 = 3;
              goto LABEL_88;
            }
          }
        }
      }
LABEL_56:
      if (a3 != 4) {
        goto LABEL_67;
      }
      int v18 = *(_DWORD *)(a1 + 104);
LABEL_58:
      if (v18 == 1)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v39 = VRTraceErrorLogLevelToCSTR();
          addrinfo v37 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            int v51 = 136315650;
            uint64_t v52 = v39;
            __int16 v53 = 2080;
            sockaddr v54 = "gckSessionChangeStateCList";
            __int16 v55 = 1024;
            int v56 = 2301;
            int v38 = " [%s] %s:%d localscopeDisconnectedTimeout";
            goto LABEL_66;
          }
        }
      }
      else if (!v18 && (int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v36 = VRTraceErrorLogLevelToCSTR();
        addrinfo v37 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          int v51 = 136315650;
          uint64_t v52 = v36;
          __int16 v53 = 2080;
          sockaddr v54 = "gckSessionChangeStateCList";
          __int16 v55 = 1024;
          int v56 = 2297;
          int v38 = " [%s] %s:%d globalscopeDisconnectedTimeout";
LABEL_66:
          _os_log_impl(&dword_221563000, v37, OS_LOG_TYPE_DEFAULT, v38, (uint8_t *)&v51, 0x1Cu);
        }
      }
LABEL_67:
      if ((int)VRTraceGetErrorLogLevelForModule() > 6)
      {
        uint64_t v40 = VRTraceErrorLogLevelToCSTR();
        __int16 v41 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          int v42 = *(_DWORD *)(a2 + 116);
          int v51 = 136315906;
          uint64_t v52 = v40;
          __int16 v53 = 2080;
          sockaddr v54 = "gckSessionChangeStateCList";
          __int16 v55 = 1024;
          int v56 = 2306;
          __int16 v57 = 1024;
          int v58 = v42;
          _os_log_impl(&dword_221563000, v41, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ====== disconnected from a peer (%08X) =====", (uint8_t *)&v51, 0x22u);
        }
      }
      if (!*(_DWORD *)(a1 + 48) && !*(_DWORD *)(a1 + 104))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v43 = VRTraceErrorLogLevelToCSTR();
          int v44 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            int v45 = *(_DWORD *)(a2 + 116);
            int v51 = 136315906;
            uint64_t v52 = v43;
            __int16 v53 = 2080;
            sockaddr v54 = "gckSessionChangeStateCList";
            __int16 v55 = 1024;
            int v56 = 2308;
            __int16 v57 = 1024;
            int v58 = v45;
            _os_log_impl(&dword_221563000, v44, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d XX: STOP ICE check with peer %08X", (uint8_t *)&v51, 0x22u);
          }
        }
        ICEStopConnectivityCheck();
        ICEStopConnectivityCheck();
      }
      int v46 = a3 == 11 || a3 == 4;
      int v47 = gckSessionDeleteNode(a1, *(_DWORD *)(a2 + 116), a3 == 11);
      gckSessionSendLSA(a1, *(_DWORD *)(a1 + 112), (void *)(a1 + 116), *(_DWORD *)(a2 + 116), 0);
      gckSessionCleanupNodes(a1, *(_DWORD *)(a2 + 116), v46);
      int v8 = 4;
      if (a3 == 4 && v47 == -2145779690)
      {
        uint64_t v48 = *(unsigned int *)(a1 + 112);
        if ((int)v48 >= 1)
        {
          uint64_t v49 = a1;
          while (*(_DWORD *)(v49 + 116) != *(_DWORD *)(a2 + 116))
          {
            v49 += 480;
            if (!--v48) {
              goto LABEL_87;
            }
          }
          memmove((void *)(v49 + 116), (const void *)(v49 + 596), 480 * ((int)v48 - 1));
          --*(_DWORD *)(a1 + 112);
LABEL_87:
          int v8 = 4;
        }
      }
LABEL_88:
      pthread_mutex_unlock((pthread_mutex_t *)(a1 + 7800));
LABEL_89:
      uint64_t v3 = 0;
      *(_DWORD *)(a2 + 408) = v8;
      return v3;
    default:
      return v3;
  }
}

void gckHandleRetryICEViable()
{
  uint64_t v0 = *MEMORY[0x263EF8340];
  CheckInHandleDebug();
}

void gckHandleRetryICEValidate()
{
  uint64_t v0 = *MEMORY[0x263EF8340];
  CheckInHandleDebug();
}

void gckHandleRetryICEResponse()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  char v0 = 0;
  CheckInHandleDebug();
}

void gckHandleRetryICERequest()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  char v0 = 0;
  CheckInHandleDebug();
}

void gckHandleRetryICEEnforced()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  char v0 = 0;
  CheckInHandleDebug();
}

void gckHandleRetryICEForce()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  char v0 = 0;
  CheckInHandleDebug();
}

void gckHandleRetryICEInit()
{
  uint64_t v0 = *MEMORY[0x263EF8340];
  CheckInHandleDebug();
}

uint64_t GCKSessionReceiveDOOB(uint64_t a1, int a2, unsigned __int16 *a3, int a4)
{
  uint64_t v102 = *MEMORY[0x263EF8340];
  uint64_t v4 = 2149187618;
  if (a3)
  {
    if (a4 >= 2)
    {
      unsigned int v6 = bswap32(*a3);
      unsigned int v7 = HIWORD(v6);
      int v8 = HIWORD(v6) - 1;
      if ((unsigned __int16)(HIWORD(v6) - 1) <= 9u)
      {
        uint64_t v90 = 0;
        v91 = &v90;
        uint64_t v92 = 0x2000000000;
        uint64_t v93 = 0;
        uint64_t v86 = 0;
        int v87 = &v86;
        uint64_t v88 = 0x2000000000;
        int v89 = a4 - 2;
        if (v7 <= 0xA)
        {
          if (((1 << SBYTE2(v6)) & 0x614) != 0) {
            goto LABEL_6;
          }
          if (v7 == 1)
          {
            int v89 = 0;
LABEL_6:
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v11 = VRTraceErrorLogLevelToCSTR();
              uint64_t v12 = *MEMORY[0x263F21098];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
              {
                unsigned int v13 = *((_DWORD *)v87 + 6);
                *(_DWORD *)buf = 136315906;
                uint64_t v95 = v11;
                __int16 v96 = 2080;
                v97 = "GCKSessionReceiveDOOB";
                __int16 v98 = 1024;
                int v99 = 8032;
                __int16 v100 = 1024;
                unsigned int v101 = v13;
                _os_log_impl(&dword_221563000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionReceiveDOOB: dispatch -- DataSize == %d...", buf, 0x22u);
              }
            }
            int v14 = *((_DWORD *)v87 + 6);
            if (v14 && v14 <= 2000)
            {
              uint64_t v15 = malloc_type_malloc(v14, 0xFADC0F76uLL);
              v91[3] = (uint64_t)v15;
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v16 = VRTraceErrorLogLevelToCSTR();
              int v17 = *MEMORY[0x263F21098];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                uint64_t v95 = v16;
                __int16 v96 = 2080;
                v97 = "GCKSessionReceiveDOOB";
                __int16 v98 = 1024;
                int v99 = 8042;
                _os_log_impl(&dword_221563000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionReceiveDOOB: ASYNCHRONOUS EVENT HANDLER...", buf, 0x1Cu);
              }
            }
            size_t v18 = *((int *)v87 + 6);
            if (v18)
            {
              uint64_t v19 = (void *)v91[3];
              if (v19) {
                memcpy(v19, a3 + 1, v18);
              }
            }
            switch(v8)
            {
              case 0:
                if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                {
                  uint64_t v20 = VRTraceErrorLogLevelToCSTR();
                  int v21 = *MEMORY[0x263F21098];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315650;
                    uint64_t v95 = v20;
                    __int16 v96 = 2080;
                    v97 = "GCKSessionReceiveDOOB";
                    __int16 v98 = 1024;
                    int v99 = 8050;
                    _os_log_impl(&dword_221563000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionReceiveDOOB: received oob ICE init...", buf, 0x1Cu);
                  }
                }
                global_queue = dispatch_get_global_queue(0, 0);
                v84[0] = MEMORY[0x263EF8330];
                v84[1] = 0x40000000;
                v84[2] = __GCKSessionReceiveDOOB_block_invoke;
                v84[3] = &unk_2645B7CB8;
                int v85 = a2;
                v84[4] = &v90;
                v84[5] = a1;
                uint64_t v23 = v84;
                goto LABEL_74;
              case 1:
                if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                {
                  uint64_t v31 = VRTraceErrorLogLevelToCSTR();
                  int v32 = *MEMORY[0x263F21098];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315650;
                    uint64_t v95 = v31;
                    __int16 v96 = 2080;
                    v97 = "GCKSessionReceiveDOOB";
                    __int16 v98 = 1024;
                    int v99 = 8061;
                    _os_log_impl(&dword_221563000, v32, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionReceiveDOOB: received oob ICE request...", buf, 0x1Cu);
                  }
                }
                global_queue = dispatch_get_global_queue(0, 0);
                v82[0] = MEMORY[0x263EF8330];
                v82[1] = 0x40000000;
                v82[2] = __GCKSessionReceiveDOOB_block_invoke_9;
                v82[3] = &unk_2645B7CE0;
                v82[6] = a1;
                int v83 = a2;
                v82[4] = &v90;
                v82[5] = &v86;
                uint64_t v23 = v82;
                goto LABEL_74;
              case 2:
                if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                {
                  uint64_t v33 = VRTraceErrorLogLevelToCSTR();
                  uint64_t v34 = *MEMORY[0x263F21098];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315650;
                    uint64_t v95 = v33;
                    __int16 v96 = 2080;
                    v97 = "GCKSessionReceiveDOOB";
                    __int16 v98 = 1024;
                    int v99 = 8072;
                    _os_log_impl(&dword_221563000, v34, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionReceiveDOOB: received oob ICE response...", buf, 0x1Cu);
                  }
                }
                global_queue = dispatch_get_global_queue(0, 0);
                v80[0] = MEMORY[0x263EF8330];
                v80[1] = 0x40000000;
                v80[2] = __GCKSessionReceiveDOOB_block_invoke_11;
                v80[3] = &unk_2645B7D08;
                int v81 = a2;
                v80[4] = &v90;
                v80[5] = &v86;
                v80[6] = a1;
                uint64_t v23 = v80;
                goto LABEL_74;
              case 3:
                if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                {
                  uint64_t v35 = VRTraceErrorLogLevelToCSTR();
                  uint64_t v36 = *MEMORY[0x263F21098];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315650;
                    uint64_t v95 = v35;
                    __int16 v96 = 2080;
                    v97 = "GCKSessionReceiveDOOB";
                    __int16 v98 = 1024;
                    int v99 = 8083;
                    _os_log_impl(&dword_221563000, v36, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionReceiveDOOB: received oob ICE force...", buf, 0x1Cu);
                  }
                }
                global_queue = dispatch_get_global_queue(0, 0);
                v78[0] = MEMORY[0x263EF8330];
                v78[1] = 0x40000000;
                v78[2] = __GCKSessionReceiveDOOB_block_invoke_13;
                v78[3] = &unk_2645B7D30;
                int v79 = a2;
                v78[4] = &v90;
                v78[5] = &v86;
                v78[6] = a1;
                uint64_t v23 = v78;
                goto LABEL_74;
              case 4:
                if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                {
                  uint64_t v37 = VRTraceErrorLogLevelToCSTR();
                  int v38 = *MEMORY[0x263F21098];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315650;
                    uint64_t v95 = v37;
                    __int16 v96 = 2080;
                    v97 = "GCKSessionReceiveDOOB";
                    __int16 v98 = 1024;
                    int v99 = 8094;
                    _os_log_impl(&dword_221563000, v38, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionReceiveDOOB: received oob ICE enforced...", buf, 0x1Cu);
                  }
                }
                global_queue = dispatch_get_global_queue(0, 0);
                v76[0] = MEMORY[0x263EF8330];
                v76[1] = 0x40000000;
                v76[2] = __GCKSessionReceiveDOOB_block_invoke_15;
                v76[3] = &unk_2645B7D58;
                int v77 = a2;
                v76[4] = &v90;
                v76[5] = &v86;
                v76[6] = a1;
                uint64_t v23 = v76;
                goto LABEL_74;
              case 5:
                if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                {
                  uint64_t v39 = VRTraceErrorLogLevelToCSTR();
                  uint64_t v40 = *MEMORY[0x263F21098];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315650;
                    uint64_t v95 = v39;
                    __int16 v96 = 2080;
                    v97 = "GCKSessionReceiveDOOB";
                    __int16 v98 = 1024;
                    int v99 = 8105;
                    _os_log_impl(&dword_221563000, v40, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionReceiveDOOB: received oob ICE validate...", buf, 0x1Cu);
                  }
                }
                global_queue = dispatch_get_global_queue(0, 0);
                v74[0] = MEMORY[0x263EF8330];
                v74[1] = 0x40000000;
                v74[2] = __GCKSessionReceiveDOOB_block_invoke_17;
                v74[3] = &unk_2645B7D80;
                int v75 = a2;
                v74[4] = &v90;
                v74[5] = a1;
                uint64_t v23 = v74;
                goto LABEL_74;
              case 6:
                if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                {
                  uint64_t v41 = VRTraceErrorLogLevelToCSTR();
                  int v42 = *MEMORY[0x263F21098];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315650;
                    uint64_t v95 = v41;
                    __int16 v96 = 2080;
                    v97 = "GCKSessionReceiveDOOB";
                    __int16 v98 = 1024;
                    int v99 = 8116;
                    _os_log_impl(&dword_221563000, v42, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionReceiveDOOB: received oob ICE viable...", buf, 0x1Cu);
                  }
                }
                global_queue = dispatch_get_global_queue(0, 0);
                v72[0] = MEMORY[0x263EF8330];
                v72[1] = 0x40000000;
                v72[2] = __GCKSessionReceiveDOOB_block_invoke_19;
                v72[3] = &unk_2645B7DA8;
                int v73 = a2;
                v72[4] = &v90;
                v72[5] = a1;
                uint64_t v23 = v72;
                goto LABEL_74;
              case 7:
                if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                {
                  uint64_t v43 = VRTraceErrorLogLevelToCSTR();
                  int v44 = *MEMORY[0x263F21098];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315650;
                    uint64_t v95 = v43;
                    __int16 v96 = 2080;
                    v97 = "GCKSessionReceiveDOOB";
                    __int16 v98 = 1024;
                    int v99 = 8127;
                    _os_log_impl(&dword_221563000, v44, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionReceiveDOOB: received oob ICE validation check timeout...", buf, 0x1Cu);
                  }
                }
                global_queue = dispatch_get_global_queue(0, 0);
                v70[0] = MEMORY[0x263EF8330];
                v70[1] = 0x40000000;
                v70[2] = __GCKSessionReceiveDOOB_block_invoke_21;
                v70[3] = &unk_2645B7DD0;
                int v71 = a2;
                v70[4] = &v90;
                v70[5] = &v86;
                v70[6] = a1;
                uint64_t v23 = v70;
                goto LABEL_74;
              case 8:
                if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                {
                  uint64_t v45 = VRTraceErrorLogLevelToCSTR();
                  int v46 = *MEMORY[0x263F21098];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315650;
                    uint64_t v95 = v45;
                    __int16 v96 = 2080;
                    v97 = "GCKSessionReceiveDOOB";
                    __int16 v98 = 1024;
                    int v99 = 8138;
                    _os_log_impl(&dword_221563000, v46, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionReceiveDOOB: received oob ICE prepare...", buf, 0x1Cu);
                  }
                }
                global_queue = dispatch_get_global_queue(0, 0);
                v68[0] = MEMORY[0x263EF8330];
                v68[1] = 0x40000000;
                v68[2] = __GCKSessionReceiveDOOB_block_invoke_23;
                v68[3] = &unk_2645B7DF8;
                int v69 = a2;
                v68[4] = &v90;
                v68[5] = &v86;
                v68[6] = a1;
                uint64_t v23 = v68;
                goto LABEL_74;
              case 9:
                if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                {
                  uint64_t v47 = VRTraceErrorLogLevelToCSTR();
                  uint64_t v48 = *MEMORY[0x263F21098];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315650;
                    uint64_t v95 = v47;
                    __int16 v96 = 2080;
                    v97 = "GCKSessionReceiveDOOB";
                    __int16 v98 = 1024;
                    int v99 = 8149;
                    _os_log_impl(&dword_221563000, v48, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionReceiveDOOB: received oob ICE report...", buf, 0x1Cu);
                  }
                }
                global_queue = dispatch_get_global_queue(0, 0);
                block[0] = MEMORY[0x263EF8330];
                block[1] = 0x40000000;
                block[2] = __GCKSessionReceiveDOOB_block_invoke_25;
                block[3] = &unk_2645B7E20;
                int v67 = a2;
                block[4] = &v90;
                block[5] = &v86;
                block[6] = a1;
                uint64_t v23 = block;
LABEL_74:
                dispatch_async(global_queue, v23);
                uint64_t v4 = 0;
                break;
              default:
                if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                {
                  uint64_t v28 = VRTraceErrorLogLevelToCSTR();
                  uint64_t v29 = *MEMORY[0x263F21098];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315906;
                    uint64_t v95 = v28;
                    __int16 v96 = 2080;
                    v97 = "GCKSessionReceiveDOOB";
                    __int16 v98 = 1024;
                    int v99 = 8160;
                    __int16 v100 = 1024;
                    unsigned int v101 = v7;
                    _os_log_impl(&dword_221563000, v29, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionReceiveDOOB: received unknown message of obType == %d", buf, 0x22u);
                  }
                }
                uint64_t v30 = (void *)v91[3];
                if (v30) {
                  free(v30);
                }
                break;
            }
LABEL_75:
            _Block_object_dispose(&v86, 8);
            _Block_object_dispose(&v90, 8);
            return v4;
          }
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v24 = VRTraceErrorLogLevelToCSTR();
          int v25 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            uint64_t v95 = v24;
            __int16 v96 = 2080;
            v97 = "GCKSessionReceiveDOOB";
            __int16 v98 = 1024;
            int v99 = 8167;
            _os_log_impl(&dword_221563000, v25, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionReceiveDOOB: SYNCHRONOUS EVENT HANDLER...", buf, 0x1Cu);
          }
        }
        switch(v7)
        {
          case 3u:
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v26 = VRTraceErrorLogLevelToCSTR();
              uint64_t v27 = *MEMORY[0x263F21098];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                uint64_t v95 = v26;
                __int16 v96 = 2080;
                v97 = "GCKSessionReceiveDOOB";
                __int16 v98 = 1024;
                int v99 = 8182;
                _os_log_impl(&dword_221563000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionReceiveDOOB: received oob ICE response...", buf, 0x1Cu);
              }
            }
            gckHandleRetryICEResponse();
          case 4u:
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v52 = VRTraceErrorLogLevelToCSTR();
              __int16 v53 = *MEMORY[0x263F21098];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                uint64_t v95 = v52;
                __int16 v96 = 2080;
                v97 = "GCKSessionReceiveDOOB";
                __int16 v98 = 1024;
                int v99 = 8188;
                _os_log_impl(&dword_221563000, v53, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionReceiveDOOB: received oob ICE force...", buf, 0x1Cu);
              }
            }
            gckHandleRetryICEForce();
          case 5u:
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v54 = VRTraceErrorLogLevelToCSTR();
              __int16 v55 = *MEMORY[0x263F21098];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                uint64_t v95 = v54;
                __int16 v96 = 2080;
                v97 = "GCKSessionReceiveDOOB";
                __int16 v98 = 1024;
                int v99 = 8194;
                _os_log_impl(&dword_221563000, v55, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionReceiveDOOB: received oob ICE enforced...", buf, 0x1Cu);
              }
            }
            gckHandleRetryICEEnforced();
          case 6u:
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v56 = VRTraceErrorLogLevelToCSTR();
              __int16 v57 = *MEMORY[0x263F21098];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                uint64_t v95 = v56;
                __int16 v96 = 2080;
                v97 = "GCKSessionReceiveDOOB";
                __int16 v98 = 1024;
                int v99 = 8200;
                _os_log_impl(&dword_221563000, v57, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionReceiveDOOB: received oob ICE validate...", buf, 0x1Cu);
              }
            }
            gckHandleRetryICEValidate();
          case 7u:
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v58 = VRTraceErrorLogLevelToCSTR();
              __int16 v59 = *MEMORY[0x263F21098];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                uint64_t v95 = v58;
                __int16 v96 = 2080;
                v97 = "GCKSessionReceiveDOOB";
                __int16 v98 = 1024;
                int v99 = 8205;
                _os_log_impl(&dword_221563000, v59, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionReceiveDOOB: received oob ICE viable...", buf, 0x1Cu);
              }
            }
            gckHandleRetryICEViable();
          case 8u:
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v60 = VRTraceErrorLogLevelToCSTR();
              __int16 v61 = *MEMORY[0x263F21098];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                uint64_t v95 = v60;
                __int16 v96 = 2080;
                v97 = "GCKSessionReceiveDOOB";
                __int16 v98 = 1024;
                int v99 = 8210;
                _os_log_impl(&dword_221563000, v61, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionReceiveDOOB: received oob ICE validation check timeout...", buf, 0x1Cu);
              }
            }
            gckHandleRetryICEValidationTimeout();
          case 9u:
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v62 = VRTraceErrorLogLevelToCSTR();
              __int16 v63 = *MEMORY[0x263F21098];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                uint64_t v95 = v62;
                __int16 v96 = 2080;
                v97 = "GCKSessionReceiveDOOB";
                __int16 v98 = 1024;
                int v99 = 8216;
                _os_log_impl(&dword_221563000, v63, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionReceiveDOOB: received oob ICE prepare...", buf, 0x1Cu);
              }
            }
            gckHandleRetryICEPreparation();
          case 0xAu:
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v64 = VRTraceErrorLogLevelToCSTR();
              uint64_t v65 = *MEMORY[0x263F21098];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                uint64_t v95 = v64;
                __int16 v96 = 2080;
                v97 = "GCKSessionReceiveDOOB";
                __int16 v98 = 1024;
                int v99 = 8222;
                _os_log_impl(&dword_221563000, v65, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionReceiveDOOB: received oob ICE report...", buf, 0x1Cu);
              }
            }
            gckHandleRetryICEReport();
          default:
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v50 = VRTraceErrorLogLevelToCSTR();
              int v51 = *MEMORY[0x263F21098];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315906;
                uint64_t v95 = v50;
                __int16 v96 = 2080;
                v97 = "GCKSessionReceiveDOOB";
                __int16 v98 = 1024;
                int v99 = 8228;
                __int16 v100 = 1024;
                unsigned int v101 = v7;
                _os_log_impl(&dword_221563000, v51, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionReceiveDOOB: received unknown message of obType == %d", buf, 0x22u);
              }
            }
            break;
        }
        goto LABEL_75;
      }
    }
  }
  return v4;
}

void __GCKSessionReceiveDOOB_block_invoke()
{
}

void __GCKSessionReceiveDOOB_block_invoke_9()
{
}

void __GCKSessionReceiveDOOB_block_invoke_11()
{
}

void __GCKSessionReceiveDOOB_block_invoke_13()
{
}

void __GCKSessionReceiveDOOB_block_invoke_15()
{
}

void __GCKSessionReceiveDOOB_block_invoke_17()
{
}

void __GCKSessionReceiveDOOB_block_invoke_19()
{
}

void __GCKSessionReceiveDOOB_block_invoke_21()
{
}

void __GCKSessionReceiveDOOB_block_invoke_23()
{
}

void __GCKSessionReceiveDOOB_block_invoke_25()
{
}

void GCKSessionDisposeConnection()
{
}

void GCKSessionDisposeAllConnections()
{
}

void GCKSessionSendTo(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x270FA5388](a1);
  v11[20] = v2;
  v11[21] = v3;
  uint64_t v13 = v4;
  uint64_t v17 = *MEMORY[0x263EF8340];
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v14 = v5;
  long long v15 = v5;
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v1);
  int v9 = (char *)v11 - v8;
  if (v10) {
    memset((char *)v11 - v8, 170, 4 * v7);
  }
  uint64_t v12 = v9;
  memset(v16, 170, sizeof(v16));
  CheckInHandleDebug();
}

uint64_t gckSessionFindNextHop(uint64_t a1, int a2)
{
  uint64_t v4 = (pthread_mutex_t *)(a1 + 7800);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 7800));
  uint64_t v5 = *(unsigned int *)(a1 + 112);
  if ((int)v5 < 1)
  {
LABEL_5:
    uint64_t v7 = 0xFFFFFFFFLL;
  }
  else
  {
    unsigned int v6 = (unsigned int *)(a1 + 120);
    while (*(v6 - 1) != a2)
    {
      v6 += 120;
      if (!--v5) {
        goto LABEL_5;
      }
    }
    uint64_t v7 = *v6;
  }
  pthread_mutex_unlock(v4);
  return v7;
}

void GCKSessionSendAudioTo(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x270FA5388](a1);
  v8[6] = v2;
  uint64_t v12 = *MEMORY[0x263EF8340];
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v9 = v3;
  long long v10 = v3;
  MEMORY[0x270FA5388](v1);
  unsigned int v6 = (char *)v8 - v4;
  v8[9] = v5;
  if (v7) {
    memset((char *)v8 - v4, 170, 4 * v5);
  }
  v8[5] = v6;
  memset(v11, 170, sizeof(v11));
  CheckInHandleDebug();
}

void GCKSessionRegisterReliableTransportCallback()
{
}

void GCKSessionSetWifiEnabled()
{
}

void GCKSessionSetEventCallback()
{
}

void GCKSessionStartEventCallbacks()
{
}

void GCKSessionInitiateRelay()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  CFErrorRef error = 0;
  CheckInHandleDebug();
}

void GCKSessionUpdateRelay()
{
  CFErrorRef error = 0;
  CheckInHandleDebug();
}

void GCKSessionIsParticipantConnected()
{
  uint64_t v0 = *MEMORY[0x263EF8340];
  CheckInHandleDebug();
}

void gckSessionConnectedCallback()
{
  uint64_t v0 = *MEMORY[0x263EF8340];
  CheckInHandleDebug();
}

uint64_t gckSessionUpdateNode(uint64_t a1, int a2, int a3, int *a4)
{
  uint64_t v8 = (pthread_mutex_t *)(a1 + 7800);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 7800));
  uint64_t v9 = *(unsigned int *)(a1 + 400);
  if ((int)v9 >= 1)
  {
    uint64_t v10 = 0;
    uint64_t v11 = (_DWORD *)(a1 + 408);
    while (*(v11 - 1) != a2)
    {
      ++v10;
      v11 += 3;
      if (v9 == v10)
      {
        BOOL v12 = 0;
        LODWORD(v10) = *(_DWORD *)(a1 + 400);
        if (a4) {
          goto LABEL_10;
        }
        goto LABEL_17;
      }
    }
    *uint64_t v11 = a3;
    BOOL v12 = (int)v9 > 1;
    if (!a4) {
      goto LABEL_17;
    }
    goto LABEL_10;
  }
  LODWORD(v10) = 0;
  BOOL v12 = 0;
  if (a4)
  {
LABEL_10:
    int v14 = v10 == v9 && (int)v9 > 0 || v12;
    *a4 = v14;
  }
LABEL_17:
  return pthread_mutex_unlock(v8);
}

uint64_t gckSessionSetupChannelCList(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  unsigned int v6 = (pthread_rwlock_t *)(a1 + 7904);
  pthread_rwlock_wrlock((pthread_rwlock_t *)(a1 + 7904));
  int v7 = (int **)(a1 + 7888);
  uint64_t v8 = *(void *)(a1 + 7888);
  if (v8)
  {
    int v9 = 0;
    do
    {
      if (*(_DWORD *)(v8 + 116) == a2)
      {
        int v10 = *(_DWORD *)(v8 + 108);
        if (v10 >= v9) {
          int v9 = v10 + 1;
        }
      }
      uint64_t v8 = *(void *)(v8 + 728);
    }
    while (v8);
  }
  else
  {
    int v9 = 0;
  }
  uint64_t v58 = a1;
  pthread_rwlock_unlock(v6);
  int v11 = 0;
  do
  {
    if (*(_DWORD *)(a3 + 16) != 6 || *(_DWORD *)a3 != a2) {
      goto LABEL_31;
    }
    BOOL v12 = (_DWORD *)(a3 + 28);
    pthread_rwlock_wrlock(v6);
    uint64_t v13 = *v7;
    if (!*v7)
    {
LABEL_26:
      pthread_rwlock_unlock(v6);
      if (!v11)
      {
        *(void *)&v78[46] = 0xAAAAAAAAAAAAAAAALL;
        *(void *)&long long v15 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&v78[16] = v15;
        *(_OWORD *)&v78[32] = v15;
        *(_OWORD *)v78 = v15;
        *(void *)((char *)v77 + 14) = 0xAAAAAAAAAAAAAAAALL;
        long long v76 = v15;
        v77[0] = v15;
        long long v75 = v15;
        *(void *)((char *)v74 + 14) = 0xAAAAAAAAAAAAAAAALL;
        long long v73 = v15;
        v74[0] = v15;
        long long v72 = v15;
        *(void *)((char *)v71 + 14) = 0xAAAAAAAAAAAAAAAALL;
        long long v70 = v15;
        v71[0] = v15;
        long long v69 = v15;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v16 = VRTraceErrorLogLevelToCSTR();
          uint64_t v17 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v18 = IPPORTToStringWithSize();
            uint64_t v19 = IPPORTToStringWithSize();
            uint64_t v20 = IPPORTToStringWithSize();
            uint64_t v21 = IPPORTToStringWithSize();
            *(_DWORD *)buf = 136317442;
            *(void *)&uint8_t buf[4] = v16;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "gckSessionSetupChannelCList";
            *(_WORD *)&unsigned char buf[22] = 1024;
            *(_DWORD *)&buf[24] = 5450;
            *(_WORD *)&buf[28] = 1024;
            *(_DWORD *)&buf[30] = -1;
            *(_WORD *)&buf[34] = 1024;
            *(_DWORD *)&buf[36] = a2;
            *(_WORD *)&buf[40] = 1024;
            *(_DWORD *)&buf[42] = v9;
            *(_WORD *)&buf[46] = 2080;
            *(void *)&buf[48] = v18;
            __int16 v60 = 2080;
            uint64_t v61 = v19;
            __int16 v62 = 2080;
            uint64_t v63 = v20;
            __int16 v64 = 2080;
            uint64_t v65 = v21;
            _os_log_impl(&dword_221563000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d failed to setup channel %d with %08X: priority %d local[%s], src[%s] <-> dst[%s], remote[%s]\n", buf, 0x56u);
          }
        }
        int v11 = 0;
        *(_DWORD *)(a3 + 312) = -1;
      }
      goto LABEL_31;
    }
    while (1)
    {
      if ((v13[28] & 0x80000000) == 0 || v13[29] != a2 || (*v12 & 1) != (v13[103] & 1)) {
        goto LABEL_25;
      }
      if (*v12)
      {
        if (*(void *)(a3 + 48) != *((void *)v13 + 54) || *(void *)(a3 + 56) != *((void *)v13 + 55)) {
          goto LABEL_25;
        }
      }
      else if (*(_DWORD *)(a3 + 48) != v13[108])
      {
        goto LABEL_25;
      }
      if (*(unsigned __int16 *)(a3 + 64) == *((unsigned __int16 *)v13 + 224)) {
        break;
      }
LABEL_25:
      uint64_t v13 = (int *)*((void *)v13 + 91);
      if (!v13) {
        goto LABEL_26;
      }
    }
    *(void *)((char *)v77 + 14) = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v22 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v22 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v76 = v22;
    v77[0] = v22;
    long long v75 = v22;
    *(void *)((char *)v74 + 14) = 0xAAAAAAAAAAAAAAAALL;
    long long v73 = v22;
    v74[0] = v22;
    long long v72 = v22;
    *(void *)((char *)v71 + 14) = 0xAAAAAAAAAAAAAAAALL;
    long long v70 = v22;
    v71[0] = v22;
    long long v69 = v22;
    *(void *)((char *)v68 + 14) = 0xAAAAAAAAAAAAAAAALL;
    long long v67 = v22;
    v68[0] = v22;
    long long v66 = v22;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v23 = VRTraceErrorLogLevelToCSTR();
      uint64_t v24 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        int v55 = v13[25];
        uint64_t v52 = IPPORTToStringWithSize();
        uint64_t v51 = IPPORTToStringWithSize();
        uint64_t v25 = IPPORTToStringWithSize();
        uint64_t v26 = IPPORTToStringWithSize();
        *(_DWORD *)buf = 136317442;
        *(void *)&uint8_t buf[4] = v23;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "gckSessionSetupChannelCList";
        *(_WORD *)&unsigned char buf[22] = 1024;
        *(_DWORD *)&buf[24] = 5414;
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = v55;
        *(_WORD *)&buf[34] = 1024;
        *(_DWORD *)&buf[36] = a2;
        *(_WORD *)&buf[40] = 1024;
        *(_DWORD *)&buf[42] = v9;
        *(_WORD *)&buf[46] = 2080;
        *(void *)&buf[48] = v52;
        __int16 v60 = 2080;
        uint64_t v61 = v51;
        __int16 v62 = 2080;
        uint64_t v63 = v25;
        __int16 v64 = 2080;
        uint64_t v65 = v26;
        _os_log_impl(&dword_221563000, v24, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d setup channel %d with %08X: priority %d local[%s], src[%s] <-> dst[%s], remote[%s]\n", buf, 0x56u);
      }
    }
    long long v27 = *(_OWORD *)(a3 + 148);
    long long v28 = *(_OWORD *)(a3 + 164);
    *(void *)(v13 + 121) = *(void *)(a3 + 180);
    *(_OWORD *)(v13 + 113) = v27;
    *(_OWORD *)(v13 + 117) = v28;
    v13[27] = v9;
    v13[28] = v9;
    v13[1] = *(_DWORD *)(a3 + 20);
    v13[140] = *(_DWORD *)(a3 + 268);
    *((_WORD *)v13 + 4) = *(_WORD *)(a3 + 26);
    int Handle = GCK_BWE_CreateHandle();
    *(void *)&buf[46] = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v30 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&buf[16] = v30;
    *(_OWORD *)&buf[32] = v30;
    *(_OWORD *)buf = v30;
    if ((int)VRTraceGetErrorLogLevelForModule() > 7)
    {
      uint64_t v31 = VRTraceErrorLogLevelToCSTR();
      int v32 = *MEMORY[0x263F21098];
      uint64_t v33 = *MEMORY[0x263F21098];
      if (*MEMORY[0x263F21088])
      {
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v53 = *((void *)v13 + 92);
          int v56 = v13[29];
          uint64_t v34 = IPPORTToStringWithSize();
          *(_DWORD *)v78 = 136316418;
          *(void *)&v78[4] = v31;
          *(_WORD *)&v78[12] = 2080;
          *(void *)&v78[14] = "BWE_CreateObject";
          *(_WORD *)&v78[22] = 1024;
          *(_DWORD *)&v78[24] = 8785;
          *(_WORD *)&v78[28] = 2048;
          *(void *)&v78[30] = v53;
          *(_WORD *)&v78[38] = 1024;
          *(_DWORD *)&v78[40] = v56;
          *(_WORD *)&v78[44] = 2080;
          *(void *)&v78[46] = v34;
          _os_log_impl(&dword_221563000, v32, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d **Created BWE %p for node %d %s ", v78, 0x36u);
        }
      }
      else if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v54 = *((void *)v13 + 92);
        int v57 = v13[29];
        uint64_t v40 = IPPORTToStringWithSize();
        *(_DWORD *)v78 = 136316418;
        *(void *)&v78[4] = v31;
        *(_WORD *)&v78[12] = 2080;
        *(void *)&v78[14] = "BWE_CreateObject";
        *(_WORD *)&v78[22] = 1024;
        *(_DWORD *)&v78[24] = 8785;
        *(_WORD *)&v78[28] = 2048;
        *(void *)&v78[30] = v54;
        *(_WORD *)&v78[38] = 1024;
        *(_DWORD *)&v78[40] = v57;
        *(_WORD *)&v78[44] = 2080;
        *(void *)&v78[46] = v40;
        _os_log_debug_impl(&dword_221563000, v32, OS_LOG_TYPE_DEBUG, " [%s] %s:%d **Created BWE %p for node %d %s ", v78, 0x36u);
      }
    }
    *((_WORD *)v13 + 372) = 0;
    if (Handle)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v35 = VRTraceErrorLogLevelToCSTR();
        uint64_t v36 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v78 = 136315906;
          *(void *)&v78[4] = v35;
          *(_WORD *)&v78[12] = 2080;
          *(void *)&v78[14] = "BWE_CreateObject";
          *(_WORD *)&v78[22] = 1024;
          *(_DWORD *)&v78[24] = 8791;
          *(_WORD *)&v78[28] = 1024;
          *(_DWORD *)&v78[30] = Handle;
          _os_log_error_impl(&dword_221563000, v36, OS_LOG_TYPE_ERROR, " [%s] %s:%d GCK_BWE_CreateHandle failed (%08X)", v78, 0x22u);
        }
      }
    }
    *(_DWORD *)(a3 + 312) = v13[25];
    int v37 = v13[24];
    if ((v37 & 1) == 0)
    {
      v13[24] = v37 | 1;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v38 = VRTraceErrorLogLevelToCSTR();
        uint64_t v39 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = v38;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "gckSessionSetupChannelCList";
          *(_WORD *)&unsigned char buf[22] = 1024;
          *(_DWORD *)&buf[24] = 5428;
          _os_log_impl(&dword_221563000, v39, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d retryICE: setting fGotICEResultAlready", buf, 0x1Cu);
        }
      }
    }
    ++v9;
    pthread_rwlock_unlock(v6);
    int v11 = 1;
LABEL_31:
    a3 = *(void *)(a3 + 304);
  }
  while (a3);
  pthread_rwlock_wrlock(v6);
  uint64_t v41 = *v7;
  if (!*v7) {
    return pthread_rwlock_unlock(v6);
  }
  int v42 = 0;
  while (2)
  {
    if (v41[29] == a2 && v41[27] < 0)
    {
      if (*v41 != -1)
      {
        close(*v41);
        *uint64_t v41 = -1;
      }
      int v44 = v41[18];
      if (v44 != -1)
      {
        close(v44);
        v41[18] = -1;
      }
      uint64_t v45 = v7;
      do
      {
        int v46 = v45;
        uint64_t v47 = *v45;
        uint64_t v45 = (int **)(*v45 + 182);
        if (v47) {
          BOOL v48 = v47 == v41;
        }
        else {
          BOOL v48 = 1;
        }
      }
      while (!v48);
      if (!v47)
      {
        int v42 = 1;
        goto LABEL_55;
      }
      *int v46 = (int *)*((void *)v47 + 91);
      *((void *)v47 + 91) = *(void *)(v58 + 7896);
      *(void *)(v58 + 7896) = v47;
      int v42 = 1;
      uint64_t v43 = v7;
    }
    else
    {
LABEL_55:
      uint64_t v43 = (int **)(v41 + 182);
    }
    uint64_t v41 = *v43;
    if (*v43) {
      continue;
    }
    break;
  }
  if (v42)
  {
    int v49 = *(_DWORD *)(v58 + 12);
    if (v49 != -1)
    {
      *(_DWORD *)(v58 + 12) = -1;
      close(v49);
    }
  }
  return pthread_rwlock_unlock(v6);
}

uint64_t gckSessionSendHello(uint64_t a1, unsigned int a2, int a3, int a4, __int16 a5, int a6)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v34 = v12;
  long long v35 = v12;
  uint64_t v33 = (void *)0xAAAAAAAAAAAAAAAALL;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    int v14 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      long long v15 = " back";
      *(_DWORD *)buf = 136316162;
      if (a3) {
        long long v15 = "";
      }
      uint64_t v37 = v13;
      __int16 v38 = 2080;
      uint64_t v39 = "gckSessionSendHello";
      __int16 v40 = 1024;
      int v41 = 1551;
      __int16 v42 = 2080;
      uint64_t v43 = v15;
      __int16 v44 = 1024;
      unsigned int v45 = a2;
      _os_log_impl(&dword_221563000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Sending HELLO%s to [%08X]", buf, 0x2Cu);
    }
  }
  WORD6(v34) = a5;
  *(void *)&long long v35 = 0x8000000000000402;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v16 = VRTraceErrorLogLevelToCSTR();
    uint64_t v17 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v37 = v16;
      __int16 v38 = 2080;
      uint64_t v39 = "gckSessionSendHello";
      __int16 v40 = 1024;
      int v41 = 1554;
      __int16 v42 = 2048;
      uint64_t v43 = (const char *)v35;
      _os_log_impl(&dword_221563000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d before MakeHello: %llX", buf, 0x26u);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v18 = VRTraceErrorLogLevelToCSTR();
    uint64_t v19 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v37 = v18;
      __int16 v38 = 2080;
      uint64_t v39 = "gckSessionSendHello";
      __int16 v40 = 1024;
      int v41 = 1556;
      __int16 v42 = 1024;
      LODWORD(v43) = a6;
      _os_log_impl(&dword_221563000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckSessionSendHello: channel %d", buf, 0x22u);
    }
  }
  uint64_t v20 = 2149187606;
  uint64_t v21 = OSPFMakeHello(&v33, (uint64_t)&v34, *(_DWORD *)(a1 + 108), a2);
  if ((v21 & 0x80000000) != 0) {
    return 2149187618;
  }
  int v22 = v21;
  if (!a3)
  {
    uint64_t v20 = SendUDPPacketToParticipantChannelID(a1, v33, v21, a2, a4, a6, 0);
    goto LABEL_31;
  }
  if (a4) {
    pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 7904));
  }
  uint64_t v23 = *(void *)(a1 + 7888);
  if (!v23)
  {
LABEL_23:
    int v24 = 1;
    if (!a4) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  while (1)
  {
    if (*(_DWORD *)(v23 + 116) != a2) {
      goto LABEL_22;
    }
    if (a6 < 0) {
      break;
    }
    if (*(_DWORD *)(v23 + 100) == a6) {
      goto LABEL_34;
    }
LABEL_22:
    uint64_t v23 = *(void *)(v23 + 728);
    if (!v23) {
      goto LABEL_23;
    }
  }
  if (*(_DWORD *)(v23 + 108)) {
    goto LABEL_22;
  }
LABEL_34:
  uint64_t v26 = (pthread_mutex_t *)(v23 + 664);
  pthread_mutex_lock((pthread_mutex_t *)(v23 + 664));
  uint64_t v27 = *(void *)(v23 + 496);
  if (v27)
  {
    while (1)
    {
      uint64_t v28 = v27;
      if (*(unsigned char *)v27 == 1) {
        break;
      }
      uint64_t v27 = *(void *)(v27 + 64);
      if (!v27)
      {
        uint64_t v29 = (void *)(v28 + 64);
        goto LABEL_39;
      }
    }
    *(_OWORD *)(v27 + 8) = xmmword_2215E8990;
    *(void *)(v27 + 32) = *(void *)(a1 + 32);
    *(_DWORD *)(v27 + 24) = 1;
    uint64_t v31 = *(void **)(v27 + 40);
    if (v31) {
      free(v31);
    }
    *(void *)(v28 + 40) = v33;
    *(_DWORD *)(v28 + 48) = v22;
    *(_DWORD *)(v28 + 52) = a2;
  }
  else
  {
    uint64_t v29 = (void *)(v23 + 496);
LABEL_39:
    long long v30 = (char *)malloc_type_calloc(1uLL, 0x48uLL, 0x10200409EACE7F9uLL);
    *long long v30 = 1;
    *(_OWORD *)(v30 + 8) = xmmword_2215E8990;
    *((void *)v30 + 4) = *(void *)(a1 + 32);
    *((void *)v30 + 5) = v33;
    *((_DWORD *)v30 + 12) = v22;
    *((_DWORD *)v30 + 13) = a2;
    *uint64_t v29 = v30;
  }
  pthread_mutex_unlock(v26);
  int v32 = *(_DWORD *)(a1 + 12);
  if (v32 != -1)
  {
    *(_DWORD *)(a1 + 12) = -1;
    close(v32);
  }
  int v24 = 0;
  if (a4) {
LABEL_24:
  }
    pthread_rwlock_unlock((pthread_rwlock_t *)(a1 + 7904));
LABEL_25:
  if (!v24) {
    return 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
      gckSessionSendHello_cold_1();
    }
  }
LABEL_31:
  free(v33);
  return v20;
}

uint64_t gckSessionWaitForHello(uint64_t a1, int a2, int a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    int v7 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136316162;
      uint64_t v20 = v6;
      __int16 v21 = 2080;
      int v22 = "gckSessionWaitForHello";
      __int16 v23 = 1024;
      int v24 = 1638;
      __int16 v25 = 1024;
      int v26 = a2;
      __int16 v27 = 1024;
      int v28 = 10;
      _os_log_impl(&dword_221563000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Waiting for HELLO from [%08X] for %d seconds", (uint8_t *)&v19, 0x28u);
    }
  }
  uint64_t v8 = (pthread_rwlock_t *)(a1 + 7904);
  pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 7904));
  uint64_t v9 = *(void *)(a1 + 7888);
  if (!v9)
  {
LABEL_11:
    uint64_t v10 = 2149187606;
    pthread_rwlock_unlock(v8);
    if ((int)VRTraceGetErrorLogLevelForModule() > 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        gckSessionWaitForHello_cold_1();
      }
    }
    return v10;
  }
  while (1)
  {
    if (*(_DWORD *)(v9 + 116) != a2) {
      goto LABEL_10;
    }
    if (a3 < 0) {
      break;
    }
    if (*(_DWORD *)(v9 + 100) == a3) {
      goto LABEL_14;
    }
LABEL_10:
    uint64_t v9 = *(void *)(v9 + 728);
    if (!v9) {
      goto LABEL_11;
    }
  }
  if (*(_DWORD *)(v9 + 108)) {
    goto LABEL_10;
  }
LABEL_14:
  int v11 = (pthread_mutex_t *)(v9 + 664);
  pthread_mutex_lock((pthread_mutex_t *)(v9 + 664));
  double v12 = micro();
  uint64_t v13 = *(void *)(v9 + 496);
  if (v13)
  {
    while (1)
    {
      uint64_t v14 = v13;
      if (*(unsigned char *)v13 == 1) {
        break;
      }
      uint64_t v13 = *(void *)(v13 + 64);
      if (!v13)
      {
        long long v15 = (double **)(v14 + 64);
        goto LABEL_19;
      }
    }
  }
  else
  {
    long long v15 = (double **)(v9 + 496);
LABEL_19:
    uint64_t v16 = (double *)malloc_type_calloc(1uLL, 0x48uLL, 0x10200409EACE7F9uLL);
    *(unsigned char *)uint64_t v16 = 1;
    v16[1] = 0.065;
    v16[2] = v12 + 10.0;
    v16[4] = v12 + 10.0;
    v16[5] = 0.0;
    *((_DWORD *)v16 + 12) = 0;
    *((_DWORD *)v16 + 13) = a2;
    *long long v15 = v16;
    int v17 = *(_DWORD *)(a1 + 12);
    if (v17 != -1)
    {
      *(_DWORD *)(a1 + 12) = -1;
      close(v17);
    }
  }
  pthread_mutex_unlock(v11);
  pthread_rwlock_unlock((pthread_rwlock_t *)(a1 + 7904));
  return 0;
}

void gckSessionCheckPendingConnections(uint64_t a1, int a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (a2) {
    pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 7904));
  }
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 7800));
  uint64_t v4 = *(unsigned int *)(a1 + 112);
  if ((int)v4 < 1)
  {
    int v5 = 0;
  }
  else
  {
    int v5 = 0;
    uint64_t v6 = (_DWORD *)(a1 + 120);
    do
    {
      if (*v6 == -1) {
        ++v5;
      }
      v6 += 120;
      --v4;
    }
    while (v4);
  }
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 7800));
  uint64_t v7 = *(void *)(a1 + 7888);
  if (v7)
  {
    int v8 = 0;
    uint64_t v9 = *(void *)(a1 + 7888);
    do
    {
      v8 += (*(_DWORD *)(v9 + 96) & 1) == 0;
      uint64_t v9 = *(void *)(v9 + 728);
    }
    while (v9);
    int v10 = 0;
    do
    {
      if (!*(_DWORD *)(v7 + 92)) {
        ++v10;
      }
      uint64_t v7 = *(void *)(v7 + 728);
    }
    while (v7);
  }
  else
  {
    int v8 = 0;
    int v10 = 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3
    && (uint64_t v11 = VRTraceErrorLogLevelToCSTR(),
        double v12 = *MEMORY[0x263F21098],
        os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)))
  {
    int v13 = 136316418;
    uint64_t v14 = v11;
    __int16 v15 = 2080;
    uint64_t v16 = "gckSessionCheckPendingConnections";
    __int16 v17 = 1024;
    int v18 = 1527;
    __int16 v19 = 1024;
    int v20 = v8;
    __int16 v21 = 1024;
    int v22 = v5;
    __int16 v23 = 1024;
    int v24 = v10;
    _os_log_error_impl(&dword_221563000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d gckSessionCheckPendingConnections: iICEChecksLeft=%d, iUnconnectedNodeCount=%d, iDDsExpected=%d", (uint8_t *)&v13, 0x2Eu);
    if (v8) {
      goto LABEL_25;
    }
  }
  else if (v8)
  {
    goto LABEL_25;
  }
  if (!v5 && !v10) {
    PostEventCallback(*(void *)(a1 + 96), 0, 11, 0, 0, 0);
  }
LABEL_25:
  if (a2) {
    pthread_rwlock_unlock((pthread_rwlock_t *)(a1 + 7904));
  }
}

uint64_t SendUDPPacketToParticipantChannelID(uint64_t a1, _WORD *a2, uint64_t a3, int a4, int a5, int a6, int a7)
{
  uint64_t v7 = 0;
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (a2 && a3)
  {
    if (a5) {
      pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 7904));
    }
    uint64_t v7 = 2149187606;
    for (uint64_t i = *(void *)(a1 + 7888); i; uint64_t i = *(void *)(i + 728))
    {
      if (*(_DWORD *)(i + 116) == a4)
      {
        if (a6 < 0)
        {
          if (*(_DWORD *)(i + 108)) {
            continue;
          }
        }
        else if (*(_DWORD *)(i + 100) != a6)
        {
          continue;
        }
        if ((*(_DWORD *)(i + 408) & 0xFFFFFFFE) == 2)
        {
          double v17 = micro();
          if (a7 && (*(_DWORD *)(a1 + 8320) || v17 <= *(double *)(i + 40)))
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v19 = VRTraceErrorLogLevelToCSTR();
              int v20 = *MEMORY[0x263F21098];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
              {
                int v21 = 136315906;
                uint64_t v22 = v19;
                __int16 v23 = 2080;
                int v24 = "SendUDPPacketToParticipantChannelID";
                __int16 v25 = 1024;
                int v26 = 647;
                __int16 v27 = 1024;
                int v28 = a4;
                _os_log_impl(&dword_221563000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %08X: DROP", (uint8_t *)&v21, 0x22u);
              }
            }
          }
          else
          {
            unsigned int v18 = SendUDPPacketCList(a1, i, a2, a3, 0, 1);
            if (v18 == -1072037876) {
              *(double *)(i + 40) = v17 + 3.0;
            }
            if (v18 == -1072037856) {
              uint64_t v7 = 2149187626;
            }
            else {
              uint64_t v7 = v18;
            }
          }
          break;
        }
      }
    }
    if (a5) {
      pthread_rwlock_unlock((pthread_rwlock_t *)(a1 + 7904));
    }
  }
  return v7;
}

uint64_t SendUDPPacketCList(uint64_t a1, uint64_t a2, _WORD *a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v7 = a5;
  uint64_t v52 = *MEMORY[0x263EF8340];
  uint64_t v40 = 0;
  int v41 = &v40;
  uint64_t v42 = 0x2000000000;
  int v43 = -2145779690;
  v38[0] = 0;
  v38[1] = v38;
  void v38[2] = 0x2000000000;
  int v39 = 0;
  unint64_t v50 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v51 = 0xAAAAAAAAAAAAAAAALL;
  memset(v36, 170, sizeof(v36));
  unint64_t v35 = 0xAAAAAAAAAAAAAAAALL;
  if (a5) {
    goto LABEL_2;
  }
  uint64_t v7 = a2 + 452;
  if ((*(unsigned char *)(a2 + 452) & 1) == 0)
  {
    if (*(_DWORD *)(a2 + 472)) {
      goto LABEL_2;
    }
LABEL_33:
    uint64_t v20 = 0;
    goto LABEL_27;
  }
  if (*(void *)(a2 + 472) == *MEMORY[0x263EF88F0] && *(void *)(a2 + 480) == *(void *)(MEMORY[0x263EF88F0] + 8)) {
    goto LABEL_33;
  }
LABEL_2:
  double v12 = (unsigned char *)(a2 + 412);
  if ((*(unsigned char *)(a2 + 412) & 1) != 0 && (*(unsigned char *)v7 & 1) == 0 && *(_DWORD *)GCKGetNAT64Prefix(a1, a2 + 412))
  {
    *(void *)&buf[32] = *(void *)(v7 + 32);
    long long v13 = *(_OWORD *)(v7 + 16);
    *(_OWORD *)buf = *(_OWORD *)v7;
    *(_OWORD *)&buf[16] = v13;
    synthesizeIPPORTv6FromIPv4();
  }
  if (*v12)
  {
    int v37 = 28;
    uint64_t v14 = IPPORTToSA6();
  }
  else
  {
    int v37 = 16;
    uint64_t v14 = IPPORTToSA();
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 0x40000000;
  v32[2] = __SendUDPPacketCList_block_invoke;
  v32[3] = &unk_2645B7E48;
  v32[6] = v14;
  v32[7] = a2;
  v32[4] = v38;
  v32[5] = &v40;
  int v33 = v37;
  int v34 = a4;
  pthread_mutex_lock((pthread_mutex_t *)(a2 + 664));
  if (g_iBWEstLogLevel_gck < 6) {
    goto LABEL_10;
  }
  ++SendUDPPacketCList_g_nPktCount;
  SendUDPPacketCList_g_nPktBytes += a4;
  double v23 = micro();
  if (v23 - *(double *)&SendUDPPacketCList_g_dLastReport <= 1.0) {
    goto LABEL_10;
  }
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  __int16 v25 = (_DWORD *)&unk_267F55000;
  int v26 = (_DWORD *)&unk_267F55000;
  if (ErrorLogLevelForModule >= 8)
  {
    uint64_t v27 = VRTraceErrorLogLevelToCSTR();
    int v28 = *MEMORY[0x263F21098];
    log = *MEMORY[0x263F21098];
    if (!*MEMORY[0x263F21088])
    {
      BOOL v30 = os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG);
      int v26 = &unk_267F55000;
      __int16 v25 = &unk_267F55000;
      if (!v30) {
        goto LABEL_41;
      }
      *(_DWORD *)buf = 136316674;
      *(void *)&uint8_t buf[4] = v27;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "SendUDPPacketCList";
      *(_WORD *)&unsigned char buf[22] = 1024;
      *(_DWORD *)&buf[24] = 559;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = SendUDPPacketCList_g_nPktCount;
      *(_WORD *)&buf[34] = 1024;
      *(_DWORD *)&buf[36] = a4;
      __int16 v46 = 1024;
      int v47 = SendUDPPacketCList_g_nPktCount - SendUDPPacketCList_g_nPktCount_LastReport;
      __int16 v48 = 2048;
      double v49 = (double)(SendUDPPacketCList_g_nPktBytes - SendUDPPacketCList_g_nPktBytes_LastReport)
          * 8.0
          / (v23 - *(double *)&SendUDPPacketCList_g_dLastReport);
      _os_log_debug_impl(&dword_221563000, log, OS_LOG_TYPE_DEBUG, " [%s] %s:%d ***** SendUDPPacketCList (%d): %d bytes (count: %d rate: %f)", buf, 0x38u);
      goto LABEL_39;
    }
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
    int v26 = (_DWORD *)&unk_267F55000;
    __int16 v25 = &unk_267F55000;
    if (v29)
    {
      *(_DWORD *)buf = 136316674;
      *(void *)&uint8_t buf[4] = v27;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "SendUDPPacketCList";
      *(_WORD *)&unsigned char buf[22] = 1024;
      *(_DWORD *)&buf[24] = 559;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = SendUDPPacketCList_g_nPktCount;
      *(_WORD *)&buf[34] = 1024;
      *(_DWORD *)&buf[36] = a4;
      __int16 v46 = 1024;
      int v47 = SendUDPPacketCList_g_nPktCount - SendUDPPacketCList_g_nPktCount_LastReport;
      __int16 v48 = 2048;
      double v49 = (double)(SendUDPPacketCList_g_nPktBytes - SendUDPPacketCList_g_nPktBytes_LastReport)
          * 8.0
          / (v23 - *(double *)&SendUDPPacketCList_g_dLastReport);
      _os_log_impl(&dword_221563000, log, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ***** SendUDPPacketCList (%d): %d bytes (count: %d rate: %f)", buf, 0x38u);
LABEL_39:
      __int16 v25 = (_DWORD *)&unk_267F55000;
      int v26 = (_DWORD *)&unk_267F55000;
    }
  }
LABEL_41:
  SendUDPPacketCList_g_dLastReport = *(void *)&v23;
  v25[54] = SendUDPPacketCList_g_nPktCount;
  v26[55] = SendUDPPacketCList_g_nPktBytes;
LABEL_10:
  memset(buf, 170, 24);
  if (*(_DWORD *)(a2 + 504) && *(void *)(a2 + 736) != 0xFFFFFFFFLL)
  {
    int v44 = 0;
    GCK_BWE_GetProbeSeqSize();
  }
  __int16 v15 = (pthread_mutex_t *)(a1 + 8400);
  pthread_mutex_lock(v15);
  if (*(_DWORD *)(a2 + 504)) {
    uint64_t v16 = (unsigned __int8 ***)(a2 + 512);
  }
  else {
    uint64_t v16 = 0;
  }
  if (a6) {
    BOOL v17 = *(_DWORD *)(a2 + 4) != 0;
  }
  else {
    BOOL v17 = 0;
  }
  uint64_t v18 = OSPFAddDynamicOptions(v16, a3, a4, v17, *(unsigned __int16 *)(a2 + 8), (_DWORD *)(a2 + 624), 0, (uint64_t)v32);
  pthread_mutex_unlock(v15);
  pthread_mutex_unlock((pthread_mutex_t *)(a2 + 664));
  if (v18)
  {
    do
    {
      uint64_t v19 = *(void *)(v18 + 8);
      if (*(void *)v18) {
        free(*(void **)v18);
      }
      free((void *)v18);
      uint64_t v18 = v19;
    }
    while (v19);
  }
  uint64_t v20 = *((unsigned int *)v41 + 6);
LABEL_27:
  _Block_object_dispose(v38, 8);
  _Block_object_dispose(&v40, 8);
  return v20;
}

uint64_t synthesizeIPPORTv6FromIPv4()
{
  uint64_t result = nw_nat64_synthesize_v6();
  if (result) {
    return SAToIPPORT();
  }
  return result;
}

BOOL __SendUDPPacketCList_block_invoke(uint64_t a1, msghdr *a2)
{
  a2->msg_name = *(void **)(a1 + 48);
  a2->msg_namelen = *(_DWORD *)(a1 + 64);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = sendmsg(**(_DWORD **)(a1 + 56), a2, 0);
  *(float *)(*(void *)(a1 + 56) + 608) = *(float *)(*(void *)(a1 + 56) + 608) + 1.0;
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == -1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        __SendUDPPacketCList_block_invoke_cold_1(v5, v6);
      }
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *__error() | 0xC01A0000;
    *(float *)(*(void *)(a1 + 56) + 616) = *(float *)(*(void *)(a1 + 56) + 616) + 1.0;
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    double v3 = micro();
    uint64_t v4 = *(void *)(a1 + 56);
    *(double *)(v4 + 64) = v3;
    *(void *)(v4 + 584) += *(int *)(a1 + 68);
  }
  return *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) >= 0;
}

uint64_t SendUDPPacket(uint64_t a1, _WORD *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = 0;
  if (!a2 || !a3 || !a4 || !a5) {
    return v5;
  }
  uint64_t v5 = 2149187606;
  uint64_t v11 = (pthread_rwlock_t *)(a1 + 7904);
  pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 7904));
  uint64_t v12 = *(void *)(a1 + 7888);
  if (!v12) {
    goto LABEL_30;
  }
  int v13 = *(_DWORD *)a4 & 1;
  while ((*(_DWORD *)(v12 + 412) & 1) != v13)
  {
LABEL_18:
    if (*(_DWORD *)(v12 + 412)) {
      goto LABEL_21;
    }
    if (!*(_DWORD *)(v12 + 432)) {
      goto LABEL_26;
    }
LABEL_27:
    uint64_t v12 = *(void *)(v12 + 728);
    if (!v12) {
      goto LABEL_30;
    }
  }
  if (!v13)
  {
    int v14 = *(_DWORD *)(v12 + 432);
    if (v14 != *(_DWORD *)(a4 + 20))
    {
      if (!v14) {
        goto LABEL_26;
      }
      goto LABEL_27;
    }
    goto LABEL_17;
  }
  if (*(void *)(v12 + 432) == *(void *)(a4 + 20) && *(void *)(v12 + 440) == *(void *)(a4 + 28))
  {
LABEL_17:
    if (*(unsigned __int16 *)(v12 + 448) == *(unsigned __int16 *)(a4 + 36)) {
      goto LABEL_29;
    }
    goto LABEL_18;
  }
LABEL_21:
  if (*(void *)(v12 + 432) != *MEMORY[0x263EF88F0]
    || *(void *)(v12 + 440) != *(void *)(MEMORY[0x263EF88F0] + 8))
  {
    goto LABEL_27;
  }
LABEL_26:
  if (*(unsigned __int16 *)(v12 + 448) != *(unsigned __int16 *)(a4 + 36)) {
    goto LABEL_27;
  }
LABEL_29:
  uint64_t v5 = SendUDPPacketCList(a1, v12, a2, a3, a5, 0);
LABEL_30:
  pthread_rwlock_unlock(v11);
  return v5;
}

uint64_t __gckSessionRecvProc_block_invoke(uint64_t a1)
{
  pthread_rwlock_rdlock((pthread_rwlock_t *)(*(void *)(a1 + 32) + 7904));
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 12);
  if (v3 != -1)
  {
    *(_DWORD *)(v2 + 12) = -1;
    close(v3);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  return pthread_rwlock_unlock((pthread_rwlock_t *)(v2 + 7904));
}

void TracePrintNodesX(int a1, uint64_t a2)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v30 = v3;
      __int16 v31 = 2080;
      int v32 = "TracePrintNodesX";
      __int16 v33 = 1024;
      int v34 = 2400;
      __int16 v35 = 1024;
      *(_DWORD *)uint64_t v36 = a1;
      _os_log_impl(&dword_221563000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ------ Report %d nodes ------", buf, 0x22u);
    }
  }
  if (a1 >= 1)
  {
    uint64_t v5 = 0;
    uint64_t v6 = (int *)(a2 + 292);
    do
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        int v8 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v9 = (int *)(a2 + 480 * v5);
          int v10 = *v9;
          int v11 = v9[1];
          int v12 = v9[67];
          int v13 = *((unsigned __int16 *)v9 + 136);
          int v14 = *((unsigned __int16 *)v9 + 137);
          int v15 = v9[69];
          int v16 = v9[70];
          int v17 = v9[71];
          *(_DWORD *)buf = 136318210;
          uint64_t v30 = v7;
          __int16 v31 = 2080;
          int v32 = "TracePrintNodesX";
          __int16 v33 = 1024;
          int v34 = 2406;
          __int16 v35 = 1024;
          *(_DWORD *)uint64_t v36 = v5;
          *(_WORD *)&v36[4] = 1024;
          *(_DWORD *)&v36[6] = v10;
          LOWORD(v37) = 1024;
          *(_DWORD *)((char *)&v37 + 2) = v11;
          HIWORD(v37) = 1024;
          int v38 = v12;
          __int16 v39 = 1024;
          int v40 = v13;
          __int16 v41 = 1024;
          int v42 = v14;
          __int16 v43 = 1024;
          int v44 = v15;
          __int16 v45 = 1024;
          int v46 = v16;
          __int16 v47 = 1024;
          int v48 = v17;
          __int16 v49 = 2080;
          uint64_t v50 = (uint64_t)v9 + 9;
          _os_log_impl(&dword_221563000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %d: %08X Next[%08X], dist[%u], SN[%u], LSASN[%u], New[%d], From[%08X], #NEIGHBOR[%d] \"%s\"", buf, 0x5Cu);
        }
      }
      uint64_t v18 = a2 + 480 * v5;
      if (*(int *)(v18 + 284) >= 1)
      {
        uint64_t v19 = 0;
        uint64_t v20 = (int *)(v18 + 284);
        int v21 = v6;
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v22 = VRTraceErrorLogLevelToCSTR();
            double v23 = *MEMORY[0x263F21098];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
            {
              int v24 = *(v21 - 1);
              int v25 = *v21;
              *(_DWORD *)buf = 136316162;
              uint64_t v30 = v22;
              __int16 v31 = 2080;
              int v32 = "TracePrintNodesX";
              __int16 v33 = 1024;
              int v34 = 2409;
              __int16 v35 = 1024;
              *(_DWORD *)uint64_t v36 = v24;
              *(_WORD *)&v36[4] = 1024;
              *(_DWORD *)&v36[6] = v25;
              _os_log_impl(&dword_221563000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d     %08X, R[%u]", buf, 0x28u);
            }
          }
          ++v19;
          v21 += 3;
        }
        while (v19 < *v20);
      }
      ++v5;
      v6 += 120;
    }
    while (v5 != a1);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v26 = VRTraceErrorLogLevelToCSTR();
    uint64_t v27 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v30 = v26;
      __int16 v31 = 2080;
      int v32 = "TracePrintNodesX";
      __int16 v33 = 1024;
      int v34 = 2412;
      __int16 v35 = 2080;
      *(void *)uint64_t v36 = "Nov 10 2024";
      *(_WORD *)&v36[8] = 2080;
      int v37 = "03:38:08";
      _os_log_impl(&dword_221563000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ------[GKS: %s - %s] ------", buf, 0x30u);
    }
  }
}

void gckSessionSendHBs(uint64_t a1)
{
  for (uint64_t i = *(void *)(a1 + 7888); i; uint64_t i = *(void *)(i + 728))
  {
    if (*(_DWORD *)(i + 4))
    {
      double v2 = micro();
      if (v2 - *(double *)(i + 16) > 27.0)
      {
        ICERefreshRelayBinding();
        *(double *)(i + 16) = v2;
      }
    }
  }
}

void attempt_failover(uint64_t a1, uint64_t a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (*(_DWORD *)(a2 + 108))
  {
LABEL_2:
    *(_DWORD *)(a2 + 108) = -1;
    *(_OWORD *)(a2 + 544) = 0u;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        int v5 = *(_DWORD *)(a2 + 100);
        int v7 = *(_DWORD *)(a2 + 112);
        int v6 = *(_DWORD *)(a2 + 116);
        int v16 = 136316418;
        uint64_t v17 = v3;
        __int16 v18 = 2080;
        uint64_t v19 = "attempt_failover";
        __int16 v20 = 1024;
        int v21 = 4489;
        __int16 v22 = 1024;
        int v23 = v5;
        __int16 v24 = 1024;
        int v25 = v6;
        __int16 v26 = 1024;
        int v27 = v7;
        _os_log_impl(&dword_221563000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d demoted channel %d for %08X to inactive state: original priority %d", (uint8_t *)&v16, 0x2Eu);
      }
    }
    return;
  }
  uint64_t v9 = *(void *)(a1 + 7888);
  if (v9)
  {
    int v10 = 0;
    do
    {
      if (v9 != a2 && *(_DWORD *)(v9 + 116) == *(_DWORD *)(a2 + 116) && *(int *)(v9 + 108) >= 0) {
        int v10 = (_DWORD *)v9;
      }
      uint64_t v9 = *(void *)(v9 + 728);
    }
    while (v9);
    if (v10)
    {
      if (v10 != (_DWORD *)a2)
      {
        v10[27] = 0;
        gckSessionUpdateNode(a1, v10[29], v10[140], 0);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v11 = VRTraceErrorLogLevelToCSTR();
          int v12 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            int v13 = v10[25];
            int v15 = v10[28];
            int v14 = v10[29];
            int v16 = 136316418;
            uint64_t v17 = v11;
            __int16 v18 = 2080;
            uint64_t v19 = "attempt_failover";
            __int16 v20 = 1024;
            int v21 = 4482;
            __int16 v22 = 1024;
            int v23 = v13;
            __int16 v24 = 1024;
            int v25 = v14;
            __int16 v26 = 1024;
            int v27 = v15;
            _os_log_impl(&dword_221563000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d promoted channel %d for %08X to active status: original priority %d\n", (uint8_t *)&v16, 0x2Eu);
          }
        }
      }
      goto LABEL_2;
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
      attempt_failover_cold_1();
    }
  }
  if (*(_DWORD *)(a2 + 408) != 6) {
    gckSessionChangeStateCList(a1, a2, 4);
  }
}

uint64_t GCKInvalidateOneCList(uint64_t a1, int *a2)
{
  if (*a2 != -1)
  {
    close(*a2);
    *a2 = -1;
  }
  int v4 = a2[18];
  if (v4 != -1)
  {
    close(v4);
    a2[18] = -1;
  }
  ICERemoveOneInterface();
  int v5 = (void *)(a1 + 7888);
  do
  {
    int v6 = v5;
    int v7 = (int *)*v5;
    int v5 = (void *)(*v5 + 728);
    if (v7) {
      BOOL v8 = v7 == a2;
    }
    else {
      BOOL v8 = 1;
    }
  }
  while (!v8);
  if (!v7) {
    return 0;
  }
  *int v6 = *((void *)v7 + 91);
  *((void *)v7 + 91) = *(void *)(a1 + 7896);
  *(void *)(a1 + 7896) = v7;
  return 1;
}

void gckSessionLocalServerProc(void *a1)
{
}

uint64_t gckSessionRecvMessage(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x270FA5388](a1);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v8 = v1;
  uint64_t v179 = *MEMORY[0x263EF8340];
  memset(v175, 170, 0x1001uLL);
  *(void *)&v174[16] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v173 = v9;
  *(_OWORD *)int v174 = v9;
  unint64_t v172 = 0xAAAAAAAAAAAAAAAALL;
  long long v170 = v9;
  long long v171 = v9;
  v169[6] = v9;
  v169[7] = v9;
  v169[4] = v9;
  v169[5] = v9;
  v169[2] = v9;
  v169[3] = v9;
  v169[0] = v9;
  v169[1] = v9;
  *(void *)&v162.msg_iovlen = 0xAAAAAAAA00000001;
  v168[0] = v9;
  v168[1] = v9;
  v167[0] = v175;
  v167[1] = 4096;
  v162.msg_name = v169;
  *(void *)&v162.msg_namelen = 0xAAAAAAAA00000080;
  v162.msg_iov = (iovec *)v167;
  v162.msg_control = v168;
  *(void *)&v162.msg_controllen = 32;
  ssize_t v10 = recvmsg(*(_DWORD *)v7, &v162, 0);
  ssize_t v11 = v10;
  if (v10 == -1)
  {
    uint64_t v14 = *__error() | 0xC01A0000;
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      return v14;
    }
    uint64_t v16 = VRTraceErrorLogLevelToCSTR();
    uint64_t v17 = *MEMORY[0x263F21098];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT)) {
      return v14;
    }
    int v18 = *(_DWORD *)v7;
    v163[0] = 136316418;
    *(void *)&v163[1] = v16;
    LOWORD(v163[3]) = 2080;
    *(void *)((char *)&v163[3] + 2) = "gckSessionRecvMessage";
    HIWORD(v163[5]) = 1024;
    v163[6] = 3334;
    LOWORD(v163[7]) = 1024;
    *(_DWORD *)((char *)&v163[7] + 2) = 3334;
    HIWORD(v163[8]) = 1024;
    v163[9] = v18;
    LOWORD(v163[10]) = 1024;
    *(_DWORD *)((char *)&v163[10] + 2) = v14;
    uint64_t v19 = " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSessio"
          "n.c:%d: recvmsg(%d) failed(%X)";
    __int16 v20 = v17;
LABEL_9:
    _os_log_impl(&dword_221563000, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)v163, 0x2Eu);
    return v14;
  }
  if (!v10)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      return 0;
    }
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    int v13 = *MEMORY[0x263F21098];
    uint64_t v14 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v15 = *(_DWORD *)v7;
      v163[0] = 136316162;
      *(void *)&v163[1] = v12;
      LOWORD(v163[3]) = 2080;
      *(void *)((char *)&v163[3] + 2) = "gckSessionRecvMessage";
      HIWORD(v163[5]) = 1024;
      v163[6] = 3330;
      LOWORD(v163[7]) = 1024;
      *(_DWORD *)((char *)&v163[7] + 2) = 3330;
      HIWORD(v163[8]) = 1024;
      v163[9] = v15;
      _os_log_impl(&dword_221563000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: recvmsg(%d) returned 0: empty message", (uint8_t *)v163, 0x28u);
      return 0;
    }
    return v14;
  }
  uint64_t v154 = v8;
  pthread_mutex_lock((pthread_mutex_t *)(v7 + 664));
  *(void *)(v7 + 576) += (int)v11;
  pthread_mutex_unlock((pthread_mutex_t *)(v7 + 664));
  long long v21 = *(_OWORD *)(v7 + 428);
  long long v173 = *(_OWORD *)(v7 + 412);
  *(_OWORD *)int v174 = v21;
  *(void *)&v174[16] = *(void *)(v7 + 444);
  if (v162.msg_controllen >= 0xC)
  {
    msg_control = (unsigned int *)v162.msg_control;
    if (v162.msg_control)
    {
      while (msg_control[1] != 41 || msg_control[2] != 46)
      {
        msg_control = (unsigned int *)((char *)msg_control + ((*msg_control + 3) & 0x1FFFFFFFCLL));
        if ((char *)(msg_control + 3) > (char *)v162.msg_control + v162.msg_controllen) {
          goto LABEL_21;
        }
      }
      if (msg_control[3] || msg_control[4] || msg_control[5] != -65536)
      {
        LODWORD(v173) = 1;
        *(_OWORD *)&v174[4] = *(_OWORD *)(msg_control + 3);
      }
      else
      {
        unsigned int v23 = bswap32(msg_control[6]);
        LODWORD(v173) = v173 & 0xFFFFFFFE;
        *(_DWORD *)&v174[4] = v23;
      }
    }
  }
LABEL_21:
  SAToIPPORT();
  uint64_t v160 = 0;
  uint64_t v161 = (_DWORD *)0xAAAAAAAAAAAAAAAALL;
  int v159 = 0;
  v157[0] = MEMORY[0x263EF8330];
  v157[1] = 0x40000000;
  v157[2] = __gckSessionRecvMessage_block_invoke;
  v157[3] = &__block_descriptor_tmp_43;
  v157[4] = v7;
  v157[5] = v3;
  v157[6] = &v158;
  uint64_t v158 = 0;
  if (*(_DWORD *)(v7 + 504)) {
    __int16 v24 = v157;
  }
  else {
    __int16 v24 = 0;
  }
  uint64_t ErrorLogLevelForModule = OSPFParse((void **)&v161, &v160, v175, v11, 0, (uint64_t)v24);
  uint64_t v26 = v154;
  if ((int)ErrorLogLevelForModule > 0
    || (v175[0] & 0xC0) == 0x40
    && (unsigned int v38 = bswap32(v175[1]), v11 - 4 == HIWORD(v38))
    && ((ssize_t v11 = HIWORD(v38), __memmove_chk(), *(_DWORD *)(v7 + 504)) ? (v39 = v157) : (v39 = 0),
        uint64_t ErrorLogLevelForModule = OSPFParse((void **)&v161, &v160, v175, v11, 0, (uint64_t)v39),
        (int)ErrorLogLevelForModule >= 1))
  {
    ssize_t v146 = v11;
    int v27 = v161;
    int v28 = *((unsigned __int8 *)v161 + 1);
    *(void *)(v7 + 32) = v5;
    *(void *)(v7 + 760) = 0;
    int v149 = v28;
    if (v28 == 6)
    {
      int v30 = 6;
    }
    else
    {
      if (v28 == 1 && (v27[1] & 1) != 0) {
        *(_DWORD *)(v7 + 48) = 1;
      }
      *(void *)&v178[14] = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&long long v29 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v29 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v177 = v29;
      *(_OWORD *)uint64_t v178 = v29;
      long long v176 = v29;
      *(void *)((char *)v166 + 14) = 0xAAAAAAAAAAAAAAAALL;
      long long v165 = v29;
      v166[0] = v29;
      long long v164 = v29;
      uint64_t ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      int v30 = v149;
      if ((int)ErrorLogLevelForModule >= 8)
      {
        uint64_t v31 = VRTraceErrorLogLevelToCSTR();
        int v32 = *MEMORY[0x263F21098];
        __int16 v33 = *MEMORY[0x263F21098];
        if (*MEMORY[0x263F21088])
        {
          uint64_t ErrorLogLevelForModule = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
          if (ErrorLogLevelForModule)
          {
            uint64_t v34 = IPPORTToStringWithSize();
            int v35 = v161[3];
            uint64_t v36 = IPPORTToStringWithSize();
            int v37 = v161[2];
            v163[0] = 136317186;
            *(void *)&v163[1] = v31;
            LOWORD(v163[3]) = 2080;
            *(void *)((char *)&v163[3] + 2) = "gckSessionRecvMessage";
            HIWORD(v163[5]) = 1024;
            v163[6] = 3520;
            LOWORD(v163[7]) = 2080;
            *(void *)((char *)&v163[7] + 2) = v34;
            int v30 = v149;
            HIWORD(v163[9]) = 1024;
            v163[10] = v35;
            LOWORD(v163[11]) = 2080;
            *(void *)((char *)&v163[11] + 2) = v36;
            HIWORD(v163[13]) = 1024;
            v163[14] = v37;
            LOWORD(v163[15]) = 1024;
            *(_DWORD *)((char *)&v163[15] + 2) = v146;
            HIWORD(v163[16]) = 1024;
            v163[17] = v149;
            _os_log_impl(&dword_221563000, v32, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [%s] %08X <= [%s] %08X: %d bytes(%d)", (uint8_t *)v163, 0x48u);
          }
        }
        else
        {
          uint64_t ErrorLogLevelForModule = os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG);
          if (ErrorLogLevelForModule)
          {
            uint64_t v124 = IPPORTToStringWithSize();
            int v125 = v161[3];
            uint64_t v126 = IPPORTToStringWithSize();
            int v127 = v161[2];
            v163[0] = 136317186;
            *(void *)&v163[1] = v31;
            LOWORD(v163[3]) = 2080;
            *(void *)((char *)&v163[3] + 2) = "gckSessionRecvMessage";
            HIWORD(v163[5]) = 1024;
            v163[6] = 3520;
            LOWORD(v163[7]) = 2080;
            *(void *)((char *)&v163[7] + 2) = v124;
            int v30 = v149;
            HIWORD(v163[9]) = 1024;
            v163[10] = v125;
            LOWORD(v163[11]) = 2080;
            *(void *)((char *)&v163[11] + 2) = v126;
            HIWORD(v163[13]) = 1024;
            v163[14] = v127;
            LOWORD(v163[15]) = 1024;
            *(_DWORD *)((char *)&v163[15] + 2) = v146;
            HIWORD(v163[16]) = 1024;
            v163[17] = v149;
            _os_log_debug_impl(&dword_221563000, v32, OS_LOG_TYPE_DEBUG, " [%s] %s:%d [%s] %08X <= [%s] %08X: %d bytes(%d)", (uint8_t *)v163, 0x48u);
          }
        }
      }
      int v27 = v161;
      uint64_t v26 = v154;
    }
    int v147 = &v143;
    uint64_t v48 = v26 + 8464;
    __int16 v49 = v27 + 3;
    unint64_t v50 = *(unsigned char *)v27 & 0xF;
    MEMORY[0x270FA5388](ErrorLogLevelForModule);
    uint64_t v53 = (char *)&v143 - v52;
    if (!v50) {
      goto LABEL_92;
    }
    uint64_t v144 = v26 + 8464;
    size_t v152 = v51;
    memset((char *)&v143 - v52, 170, v51);
    int v150 = 0;
    unint64_t v155 = v50;
    uint64_t v54 = v27 + 3;
    int v55 = v53;
    do
    {
      int v57 = *v54++;
      int v56 = v57;
      if (v57 == *(_DWORD *)(v26 + 108))
      {
        int v150 = 1;
        uint64_t NextHop = 0xFFFFFFFFLL;
      }
      else
      {
        uint64_t NextHop = gckSessionFindNextHop(v26, v56);
      }
      *v55++ = NextHop;
      --v50;
    }
    while (v50);
    uint64_t v145 = v7;
    unint64_t v59 = 0;
    BOOL v148 = v30 == 7;
    __int16 v60 = v27 + 4;
    uint64_t v61 = v53 + 4;
    uint64_t v62 = 1;
    unint64_t v63 = v155;
    int v153 = v49;
    uint64_t v151 = v53;
    while (1)
    {
      int v64 = *(_DWORD *)&v53[4 * v59];
      if (v64 != -1) {
        break;
      }
      ++v59;
LABEL_77:
      ++v62;
      ++v60;
      v61 += 4;
      if (v59 == v63)
      {
        uint64_t v48 = v144;
        uint64_t v7 = v145;
        uint64_t v26 = v154;
        if (v150)
        {
          switch(v30)
          {
            case 7:
              goto LABEL_82;
            case 6:
              uint64_t v73 = *(void *)(v154 + 96);
              int v74 = v161[2];
              long long v76 = *(const void **)v160;
              int v77 = v160[2];
              int v75 = 5;
              goto LABEL_90;
            case 5:
LABEL_82:
              uint64_t v73 = *(void *)(v154 + 96);
              int v74 = v161[2];
              if (v30 == 7) {
                int v75 = 6;
              }
              else {
                int v75 = 4;
              }
              long long v76 = *(const void **)v160;
              int v77 = v160[2];
LABEL_90:
              PostEventCallback(v73, v74, v75, v76, v77, 0);
              break;
            default:
              gckSessionProcessOSPFPacket(v154, v145, (uint64_t)v161, (uint64_t)v160);
              break;
          }
        }
LABEL_92:
        if (!(_BYTE)v158)
        {
          if (*(unsigned char *)v48)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
            {
              uint64_t v86 = VRTraceErrorLogLevelToCSTR();
              int v87 = *MEMORY[0x263F21098];
              uint64_t v88 = *MEMORY[0x263F21098];
              if (*MEMORY[0x263F21088])
              {
                if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
                {
                  int v89 = *(_DWORD *)(v154 + 8468);
                  int v90 = *(_DWORD *)(v154 + 8472);
                  int v91 = *(unsigned __int16 *)(v48 + 12);
                  int v92 = *(_DWORD *)(v7 + 116);
                  int v93 = *(_DWORD *)(v7 + 100);
                  v163[0] = 136317186;
                  *(void *)&v163[1] = v86;
                  LOWORD(v163[3]) = 2080;
                  *(void *)((char *)&v163[3] + 2) = "BWE_TrackSeqInterruption";
                  HIWORD(v163[5]) = 1024;
                  v163[6] = 9053;
                  LOWORD(v163[7]) = 1024;
                  *(_DWORD *)((char *)&v163[7] + 2) = v89;
                  HIWORD(v163[8]) = 1024;
                  v163[9] = v90;
                  LOWORD(v163[10]) = 1024;
                  *(_DWORD *)((char *)&v163[10] + 2) = v91;
                  HIWORD(v163[11]) = 1024;
                  v163[12] = v92;
                  LOWORD(v163[13]) = 1024;
                  *(_DWORD *)((char *)&v163[13] + 2) = v93;
                  HIWORD(v163[14]) = 2048;
                  *(void *)&v163[15] = v5;
                  _os_log_impl(&dword_221563000, v87, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ******* BWE_RCV: SEQ CUT (%d/%d, %d) with a non-probe pkt from %d/%d  @%.3f ", (uint8_t *)v163, 0x44u);
                }
              }
              else if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
              {
                int v138 = *(_DWORD *)(v154 + 8468);
                int v139 = *(_DWORD *)(v154 + 8472);
                int v140 = *(unsigned __int16 *)(v48 + 12);
                int v141 = *(_DWORD *)(v7 + 116);
                int v142 = *(_DWORD *)(v7 + 100);
                v163[0] = 136317186;
                *(void *)&v163[1] = v86;
                LOWORD(v163[3]) = 2080;
                *(void *)((char *)&v163[3] + 2) = "BWE_TrackSeqInterruption";
                HIWORD(v163[5]) = 1024;
                v163[6] = 9053;
                LOWORD(v163[7]) = 1024;
                *(_DWORD *)((char *)&v163[7] + 2) = v138;
                HIWORD(v163[8]) = 1024;
                v163[9] = v139;
                LOWORD(v163[10]) = 1024;
                *(_DWORD *)((char *)&v163[10] + 2) = v140;
                HIWORD(v163[11]) = 1024;
                v163[12] = v141;
                LOWORD(v163[13]) = 1024;
                *(_DWORD *)((char *)&v163[13] + 2) = v142;
                HIWORD(v163[14]) = 2048;
                *(void *)&v163[15] = v5;
                _os_log_debug_impl(&dword_221563000, v87, OS_LOG_TYPE_DEBUG, " [%s] %s:%d ******* BWE_RCV: SEQ CUT (%d/%d, %d) with a non-probe pkt from %d/%d  @%.3f ", (uint8_t *)v163, 0x44u);
              }
            }
            uint64_t v108 = v154;
            BWE_EndCurrentSequence(v154);
            ++*(_DWORD *)(v108 + 8488);
            goto LABEL_123;
          }
          goto LABEL_132;
        }
        int v80 = WORD1(v158);
        if (*(unsigned char *)v48)
        {
          if (*(_DWORD *)(v7 + 116) == *(_DWORD *)(v26 + 8468)
            && *(_DWORD *)(v7 + 100) == *(_DWORD *)(v26 + 8472)
            && WORD1(v158) == *(unsigned __int16 *)(v48 + 12))
          {
            if (WORD2(v158) < 0x1000u)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
                goto LABEL_123;
              }
              uint64_t v81 = VRTraceErrorLogLevelToCSTR();
              v82 = *MEMORY[0x263F21098];
              int v83 = *MEMORY[0x263F21098];
              if (*MEMORY[0x263F21088])
              {
                if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
                {
                  int v84 = *(_DWORD *)(v7 + 116);
                  v163[0] = 136316418;
                  *(void *)&v163[1] = v81;
                  LOWORD(v163[3]) = 2080;
                  *(void *)((char *)&v163[3] + 2) = "BWE_TrackSeqInterruption";
                  HIWORD(v163[5]) = 1024;
                  v163[6] = 9006;
                  LOWORD(v163[7]) = 1024;
                  *(_DWORD *)((char *)&v163[7] + 2) = v84;
                  HIWORD(v163[8]) = 1024;
                  v163[9] = v80;
                  LOWORD(v163[10]) = 2048;
                  *(void *)((char *)&v163[10] + 2) = v5;
                  int v85 = " [%s] %s:%d ******* BWE_RCV: continuing the existing seq (%d): %d   @%.3f ";
                  goto LABEL_142;
                }
                goto LABEL_123;
              }
              if (!os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG)) {
                goto LABEL_123;
              }
              int v130 = *(_DWORD *)(v7 + 116);
              v163[0] = 136316418;
              *(void *)&v163[1] = v81;
              LOWORD(v163[3]) = 2080;
              *(void *)((char *)&v163[3] + 2) = "BWE_TrackSeqInterruption";
              HIWORD(v163[5]) = 1024;
              v163[6] = 9006;
              LOWORD(v163[7]) = 1024;
              *(_DWORD *)((char *)&v163[7] + 2) = v130;
              HIWORD(v163[8]) = 1024;
              v163[9] = v80;
              LOWORD(v163[10]) = 2048;
              *(void *)((char *)&v163[10] + 2) = v5;
              int v131 = " [%s] %s:%d ******* BWE_RCV: continuing the existing seq (%d): %d   @%.3f ";
LABEL_149:
              _os_log_debug_impl(&dword_221563000, v82, OS_LOG_TYPE_DEBUG, v131, (uint8_t *)v163, 0x32u);
              goto LABEL_123;
            }
            *(unsigned char *)uint64_t v48 = 0;
            if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
              goto LABEL_123;
            }
            uint64_t v119 = VRTraceErrorLogLevelToCSTR();
            v82 = *MEMORY[0x263F21098];
            int v120 = *MEMORY[0x263F21098];
            if (!*MEMORY[0x263F21088])
            {
              if (!os_log_type_enabled(v120, OS_LOG_TYPE_DEBUG)) {
                goto LABEL_123;
              }
              int v132 = *(_DWORD *)(v7 + 116);
              v163[0] = 136316418;
              *(void *)&v163[1] = v119;
              LOWORD(v163[3]) = 2080;
              *(void *)((char *)&v163[3] + 2) = "BWE_TrackSeqInterruption";
              HIWORD(v163[5]) = 1024;
              v163[6] = 9001;
              LOWORD(v163[7]) = 1024;
              *(_DWORD *)((char *)&v163[7] + 2) = v132;
              HIWORD(v163[8]) = 1024;
              v163[9] = v80;
              LOWORD(v163[10]) = 2048;
              *(void *)((char *)&v163[10] + 2) = v5;
              int v131 = " [%s] %s:%d ******* BWE_RCV: last pkt of the existing seq (%d): %d   @%.3f ";
              goto LABEL_149;
            }
            if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
            {
              int v121 = *(_DWORD *)(v7 + 116);
              v163[0] = 136316418;
              *(void *)&v163[1] = v119;
              LOWORD(v163[3]) = 2080;
              *(void *)((char *)&v163[3] + 2) = "BWE_TrackSeqInterruption";
              HIWORD(v163[5]) = 1024;
              v163[6] = 9001;
              LOWORD(v163[7]) = 1024;
              *(_DWORD *)((char *)&v163[7] + 2) = v121;
              HIWORD(v163[8]) = 1024;
              v163[9] = v80;
              LOWORD(v163[10]) = 2048;
              *(void *)((char *)&v163[10] + 2) = v5;
              int v85 = " [%s] %s:%d ******* BWE_RCV: last pkt of the existing seq (%d): %d   @%.3f ";
LABEL_142:
              _os_log_impl(&dword_221563000, v82, OS_LOG_TYPE_DEFAULT, v85, (uint8_t *)v163, 0x32u);
            }
LABEL_123:
            if ((_BYTE)v158)
            {
              int v109 = HIWORD(v158);
              *(_DWORD *)(v7 + 748) = HIWORD(v158);
              *(_DWORD *)(v7 + 596) = 125 * v109;
              *(void *)&v178[14] = 0xAAAAAAAAAAAAAAAALL;
              *(void *)&long long v110 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v110 + 1) = 0xAAAAAAAAAAAAAAAALL;
              long long v177 = v110;
              *(_OWORD *)uint64_t v178 = v110;
              long long v176 = v110;
              IPPORTToStringWithSize();
              int v111 = VRTraceGetErrorLogLevelForModule();
              int v112 = v146;
              if (v111 >= 8)
              {
                uint64_t v113 = VRTraceErrorLogLevelToCSTR();
                unsigned int v114 = *MEMORY[0x263F21098];
                long long v115 = *MEMORY[0x263F21098];
                if (*MEMORY[0x263F21088])
                {
                  if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
                  {
                    int v116 = *(_DWORD *)(v7 + 116);
                    int v117 = *(_DWORD *)(v7 + 748);
                    v163[0] = 136317442;
                    *(void *)&v163[1] = v113;
                    LOWORD(v163[3]) = 2080;
                    *(void *)((char *)&v163[3] + 2) = "BWE_UpdateEstimate";
                    HIWORD(v163[5]) = 1024;
                    v163[6] = 8874;
                    LOWORD(v163[7]) = 1024;
                    *(_DWORD *)((char *)&v163[7] + 2) = v116;
                    HIWORD(v163[8]) = 2080;
                    *(void *)&v163[9] = &v176;
                    LOWORD(v163[11]) = 1024;
                    *(_DWORD *)((char *)&v163[11] + 2) = v112;
                    HIWORD(v163[12]) = 2048;
                    *(void *)&v163[13] = v5;
                    LOWORD(v163[15]) = 1024;
                    *(_DWORD *)((char *)&v163[15] + 2) = WORD1(v158);
                    HIWORD(v163[16]) = 1024;
                    v163[17] = WORD2(v158);
                    LOWORD(v163[18]) = 1024;
                    *(_DWORD *)((char *)&v163[18] + 2) = v117;
                    _os_log_impl(&dword_221563000, v114, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ****************************************************\npBwOption (from %d %s): %d   @%.3f (%d %x) upstream BW: %d kbps\n****************************************************\n", (uint8_t *)v163, 0x4Eu);
                  }
                }
                else if (os_log_type_enabled(v115, OS_LOG_TYPE_DEBUG))
                {
                  int v128 = *(_DWORD *)(v7 + 116);
                  int v129 = *(_DWORD *)(v7 + 748);
                  v163[0] = 136317442;
                  *(void *)&v163[1] = v113;
                  LOWORD(v163[3]) = 2080;
                  *(void *)((char *)&v163[3] + 2) = "BWE_UpdateEstimate";
                  HIWORD(v163[5]) = 1024;
                  v163[6] = 8874;
                  LOWORD(v163[7]) = 1024;
                  *(_DWORD *)((char *)&v163[7] + 2) = v128;
                  HIWORD(v163[8]) = 2080;
                  *(void *)&v163[9] = &v176;
                  LOWORD(v163[11]) = 1024;
                  *(_DWORD *)((char *)&v163[11] + 2) = v112;
                  HIWORD(v163[12]) = 2048;
                  *(void *)&v163[13] = v5;
                  LOWORD(v163[15]) = 1024;
                  *(_DWORD *)((char *)&v163[15] + 2) = WORD1(v158);
                  HIWORD(v163[16]) = 1024;
                  v163[17] = WORD2(v158);
                  LOWORD(v163[18]) = 1024;
                  *(_DWORD *)((char *)&v163[18] + 2) = v129;
                  _os_log_debug_impl(&dword_221563000, v114, OS_LOG_TYPE_DEBUG, " [%s] %s:%d ****************************************************\npBwOption (from %d %s): %d   @%.3f (%d %x) upstream BW: %d kbps\n****************************************************\n", (uint8_t *)v163, 0x4Eu);
                }
              }
              if (*(void *)(v7 + 736) != 0xFFFFFFFFLL) {
                GCK_BWE_CalcRxEstimate();
              }
            }
LABEL_132:
            if (v161) {
              free(v161);
            }
            if (v160) {
              free(v160);
            }
            return 0;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
          {
            uint64_t v94 = VRTraceErrorLogLevelToCSTR();
            uint64_t v95 = *MEMORY[0x263F21098];
            __int16 v96 = *MEMORY[0x263F21098];
            if (*MEMORY[0x263F21088])
            {
              if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
              {
                int v97 = *(_DWORD *)(v154 + 8468);
                int v98 = *(_DWORD *)(v154 + 8472);
                int v99 = *(unsigned __int16 *)(v48 + 12);
                int v100 = *(_DWORD *)(v7 + 116);
                int v101 = *(_DWORD *)(v7 + 100);
                v163[0] = 136317442;
                *(void *)&v163[1] = v94;
                LOWORD(v163[3]) = 2080;
                *(void *)((char *)&v163[3] + 2) = "BWE_TrackSeqInterruption";
                HIWORD(v163[5]) = 1024;
                v163[6] = 9012;
                LOWORD(v163[7]) = 1024;
                *(_DWORD *)((char *)&v163[7] + 2) = v97;
                HIWORD(v163[8]) = 1024;
                v163[9] = v98;
                LOWORD(v163[10]) = 1024;
                *(_DWORD *)((char *)&v163[10] + 2) = v99;
                HIWORD(v163[11]) = 1024;
                v163[12] = v100;
                LOWORD(v163[13]) = 1024;
                *(_DWORD *)((char *)&v163[13] + 2) = v101;
                HIWORD(v163[14]) = 1024;
                v163[15] = v80;
                LOWORD(v163[16]) = 2048;
                *(void *)((char *)&v163[16] + 2) = v5;
                _os_log_impl(&dword_221563000, v95, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ******* BWE_RCV: SEQ OVERRIDE (%d/%d, %d) --> (%d/%d, %d)   @%.3f ", (uint8_t *)v163, 0x4Au);
              }
            }
            else if (os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG))
            {
              int v133 = *(_DWORD *)(v154 + 8468);
              int v134 = *(_DWORD *)(v154 + 8472);
              int v135 = *(unsigned __int16 *)(v48 + 12);
              int v136 = *(_DWORD *)(v7 + 116);
              int v137 = *(_DWORD *)(v7 + 100);
              v163[0] = 136317442;
              *(void *)&v163[1] = v94;
              LOWORD(v163[3]) = 2080;
              *(void *)((char *)&v163[3] + 2) = "BWE_TrackSeqInterruption";
              HIWORD(v163[5]) = 1024;
              v163[6] = 9012;
              LOWORD(v163[7]) = 1024;
              *(_DWORD *)((char *)&v163[7] + 2) = v133;
              HIWORD(v163[8]) = 1024;
              v163[9] = v134;
              LOWORD(v163[10]) = 1024;
              *(_DWORD *)((char *)&v163[10] + 2) = v135;
              HIWORD(v163[11]) = 1024;
              v163[12] = v136;
              LOWORD(v163[13]) = 1024;
              *(_DWORD *)((char *)&v163[13] + 2) = v137;
              HIWORD(v163[14]) = 1024;
              v163[15] = v80;
              LOWORD(v163[16]) = 2048;
              *(void *)((char *)&v163[16] + 2) = v5;
              _os_log_debug_impl(&dword_221563000, v95, OS_LOG_TYPE_DEBUG, " [%s] %s:%d ******* BWE_RCV: SEQ OVERRIDE (%d/%d, %d) --> (%d/%d, %d)   @%.3f ", (uint8_t *)v163, 0x4Au);
            }
          }
          uint64_t v102 = (int32x2_t *)v154;
          BWE_EndCurrentSequence(v154);
          v102[1060] = vadd_s32(v102[1060], (int32x2_t)0x100000001);
        }
        else
        {
          if (WORD2(v158) > 0xFFFu) {
            goto LABEL_123;
          }
          ++*(_DWORD *)(v26 + 8480);
          uint64_t v102 = (int32x2_t *)v26;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
          {
            uint64_t v103 = VRTraceErrorLogLevelToCSTR();
            v104 = *MEMORY[0x263F21098];
            uint64_t v105 = *MEMORY[0x263F21098];
            if (*MEMORY[0x263F21088])
            {
              BOOL v106 = os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT);
              uint64_t v102 = (int32x2_t *)v154;
              if (v106)
              {
                int v107 = *(_DWORD *)(v7 + 116);
                v163[0] = 136316418;
                *(void *)&v163[1] = v103;
                LOWORD(v163[3]) = 2080;
                *(void *)((char *)&v163[3] + 2) = "BWE_TrackSeqInterruption";
                HIWORD(v163[5]) = 1024;
                v163[6] = 9035;
                LOWORD(v163[7]) = 1024;
                *(_DWORD *)((char *)&v163[7] + 2) = v107;
                HIWORD(v163[8]) = 1024;
                v163[9] = v80;
                LOWORD(v163[10]) = 2048;
                *(void *)((char *)&v163[10] + 2) = v5;
                _os_log_impl(&dword_221563000, v104, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ******* BWE_RCV: NEW SEQ (%d, %d) @%.3f ", (uint8_t *)v163, 0x32u);
              }
            }
            else
            {
              BOOL v122 = os_log_type_enabled(v105, OS_LOG_TYPE_DEBUG);
              uint64_t v102 = (int32x2_t *)v154;
              if (v122)
              {
                int v123 = *(_DWORD *)(v7 + 116);
                v163[0] = 136316418;
                *(void *)&v163[1] = v103;
                LOWORD(v163[3]) = 2080;
                *(void *)((char *)&v163[3] + 2) = "BWE_TrackSeqInterruption";
                HIWORD(v163[5]) = 1024;
                v163[6] = 9035;
                LOWORD(v163[7]) = 1024;
                *(_DWORD *)((char *)&v163[7] + 2) = v123;
                HIWORD(v163[8]) = 1024;
                v163[9] = v80;
                LOWORD(v163[10]) = 2048;
                *(void *)((char *)&v163[10] + 2) = v5;
                _os_log_debug_impl(&dword_221563000, v104, OS_LOG_TYPE_DEBUG, " [%s] %s:%d ******* BWE_RCV: NEW SEQ (%d, %d) @%.3f ", (uint8_t *)v163, 0x32u);
              }
            }
          }
        }
        *(unsigned char *)uint64_t v48 = 1;
        v102[1058].i32[1] = *(_DWORD *)(v7 + 116);
        v102[1059].i32[0] = *(_DWORD *)(v7 + 100);
        *(_WORD *)(v48 + 12) = v80;
        goto LABEL_123;
      }
    }
    v156 = &v143;
    MEMORY[0x270FA5388](NextHop);
    long long v66 = (unsigned int *)((char *)&v143 - v65);
    uint64_t NextHop = (uint64_t)memset((char *)&v143 - v65, 170, v67);
    unint64_t v63 = v155;
    *long long v66 = v49[v59++];
    uint64_t v68 = 1;
    if (v59 < v63)
    {
      unint64_t v69 = v63;
      long long v70 = v61;
      int v71 = v60;
      do
      {
        if (*(_DWORD *)v70 == v64)
        {
          v66[(int)v68] = *v71;
          uint64_t v68 = (v68 + 1);
          *(_DWORD *)long long v70 = -1;
        }
        ++v71;
        v70 += 4;
        --v69;
      }
      while (v62 != v69);
    }
    if (v30 != 7)
    {
      if (v30 == 6)
      {
        memset(v163, 170, sizeof(v163));
        uint64_t NextHop = OSPFMakeAudio((uint64_t)v163, 4096, (uint64_t)v160, 0, v161[2], v66, v68);
        if ((int)NextHop >= 1) {
          uint64_t NextHop = SendUDPPacketToParticipantChannelID(v154, v163, NextHop, v64, 0, -1, 2);
        }
        goto LABEL_75;
      }
      if (v30 != 5)
      {
LABEL_76:
        __int16 v49 = v153;
        uint64_t v53 = v151;
        goto LABEL_77;
      }
    }
    memset(v163, 170, sizeof(v163));
    uint64_t v72 = v154;
    uint64_t NextHop = OSPFMakeData((char *)v163, 4096, (uint64_t)v160, 0, v148, v161[2], v66, v68, *(uint64_t (**)(uint64_t, unsigned int *, uint64_t, char *, void, void, void, void, unsigned __int16))(*(void *)(v154 + 96) + 24), *(void *)(*(void *)(v154 + 96) + 32), 0x40u, 0, 0);
    if ((int)NextHop >= 1) {
      uint64_t NextHop = SendUDPPacketToParticipantChannelID(v72, v163, NextHop, v64, 0, -1, 1);
    }
    int v30 = v149;
LABEL_75:
    unint64_t v63 = v155;
    goto LABEL_76;
  }
  if (!ErrorLogLevelForModule)
  {
    __int16 v47 = v161;
    if (*((unsigned char *)v161 + 1) != 1 || (gckSessionProcessHello(v154, v7, (uint64_t)v160, 0), (__int16 v47 = v161) != 0)) {
      free(v47);
    }
    if (v160) {
      free(v160);
    }
    return 0;
  }
  int v40 = malloc_type_calloc(1uLL, 0x1070uLL, 0x10200407CC26935uLL);
  if (v40)
  {
    __int16 v41 = v40;
    v40[1026] = *(_DWORD *)(v7 + 116);
    __memcpy_chk();
    v41[1025] = v11;
    long long v42 = *(_OWORD *)v174;
    *(_OWORD *)(v41 + 1027) = v173;
    *(_OWORD *)(v41 + 1031) = v42;
    *(void *)(v41 + 1035) = *(void *)&v174[16];
    long long v43 = v171;
    *(_OWORD *)(v41 + 1037) = v170;
    *(_OWORD *)(v41 + 1041) = v43;
    *(void *)(v41 + 1045) = v172;
    *((void *)v41 + 524) = v5;
    pthread_mutex_lock((pthread_mutex_t *)(v26 + 8112));
    int v44 = (void *)(v26 + 8104);
    do
    {
      __int16 v45 = v44;
      uint64_t v46 = *v44;
      int v44 = (void *)(*v44 + 4200);
    }
    while (v46);
    *__int16 v45 = v41;
    pthread_cond_broadcast((pthread_cond_t *)(v26 + 8176));
    pthread_mutex_unlock((pthread_mutex_t *)(v26 + 8112));
    return 0;
  }
  uint64_t v14 = 2149187587;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v78 = VRTraceErrorLogLevelToCSTR();
    uint64_t v79 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      v163[0] = 136316418;
      *(void *)&v163[1] = v78;
      LOWORD(v163[3]) = 2080;
      *(void *)((char *)&v163[3] + 2) = "gckSessionRecvMessage";
      HIWORD(v163[5]) = 1024;
      v163[6] = 3633;
      LOWORD(v163[7]) = 1024;
      *(_DWORD *)((char *)&v163[7] + 2) = 3633;
      HIWORD(v163[8]) = 1024;
      v163[9] = 4208;
      LOWORD(v163[10]) = 1024;
      *(_DWORD *)((char *)&v163[10] + 2) = -2145779709;
      uint64_t v19 = " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSess"
            "ion.c:%d: calloc(%d) failed(%X)";
      __int16 v20 = v79;
      goto LABEL_9;
    }
  }
  return v14;
}

void gckSessionRecvTCPMessage(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x270FA5388](a1);
  uint64_t v3 = v2;
  uint64_t v4 = v1;
  uint64_t v92 = *MEMORY[0x263EF8340];
  memset(v91, 170, sizeof(v91));
  uint64_t v75 = v3;
  ssize_t v5 = recv(*(_DWORD *)(v3 + 72), v91, 0x1000uLL, 0);
  ssize_t v6 = v5;
  if (v5 == -1)
  {
    int v10 = *__error();
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        int v13 = *(_DWORD *)(v75 + 72);
        v86[0] = 136316418;
        *(void *)&v86[1] = v11;
        LOWORD(v86[3]) = 2080;
        *(void *)((char *)&v86[3] + 2) = "gckSessionRecvTCPMessage";
        HIWORD(v86[5]) = 1024;
        v86[6] = 3158;
        LOWORD(v86[7]) = 1024;
        *(_DWORD *)((char *)&v86[7] + 2) = 3158;
        HIWORD(v86[8]) = 1024;
        v86[9] = v13;
        LOWORD(v86[10]) = 1024;
        *(_DWORD *)((char *)&v86[10] + 2) = v10 | 0xC01A0000;
        _os_log_impl(&dword_221563000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: recv(%d) failed(%X)", (uint8_t *)v86, 0x2Eu);
      }
    }
    return;
  }
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        int v9 = *(_DWORD *)(v75 + 72);
        v86[0] = 136316162;
        *(void *)&v86[1] = v7;
        LOWORD(v86[3]) = 2080;
        *(void *)((char *)&v86[3] + 2) = "gckSessionRecvTCPMessage";
        HIWORD(v86[5]) = 1024;
        v86[6] = 3149;
        LOWORD(v86[7]) = 1024;
        *(_DWORD *)((char *)&v86[7] + 2) = 3149;
        HIWORD(v86[8]) = 1024;
        v86[9] = v9;
        _os_log_impl(&dword_221563000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: recv(%d) returned 0: Shutting down connection", (uint8_t *)v86, 0x28u);
      }
    }
    shutdown(*(_DWORD *)(v75 + 72), 2);
    close(*(_DWORD *)(v75 + 72));
    *(_DWORD *)(v75 + 72) = -1;
    return;
  }
  int v85 = (unsigned int *)0xAAAAAAAAAAAAAAAALL;
  int v14 = OSPFGetLength((uint64_t)v91, v5);
  if (v14 < 1) {
    return;
  }
  int v16 = v14;
  uint64_t v69 = v75 + 452;
  uint64_t v70 = v75 + 412;
  uint64_t v17 = v91;
  *(void *)&long long v15 = 136317186;
  long long v68 = v15;
  uint64_t v78 = v4;
  do
  {
    int v84 = 0;
    if (*(_DWORD *)(v75 + 504)) {
      int v18 = &__block_literal_global;
    }
    else {
      int v18 = 0;
    }
    uint64_t ErrorLogLevelForModule = OSPFParse((void **)&v85, &v84, v17, v16, 0, (uint64_t)v18);
    if ((int)ErrorLogLevelForModule < 1)
    {
      if (!ErrorLogLevelForModule)
      {
        size_t v67 = v85;
        if (*((unsigned char *)v85 + 1) != 1)
        {
LABEL_73:
          free(v67);
LABEL_74:
          if (v84) {
            free(v84);
          }
          return;
        }
        gckSessionProcessHello(v4, v75, (uint64_t)v84, 0);
      }
      size_t v67 = v85;
      if (!v85) {
        goto LABEL_74;
      }
      goto LABEL_73;
    }
    long long v76 = v17;
    __int16 v20 = v85;
    int v82 = *((unsigned __int8 *)v85 + 1);
    if (v82 != 6)
    {
      *(void *)&v90[14] = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&long long v21 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)int v90 = v21;
      v89[3] = v21;
      v89[2] = v21;
      *(void *)((char *)v89 + 14) = 0xAAAAAAAAAAAAAAAALL;
      v89[0] = v21;
      long long v88 = v21;
      long long v87 = v21;
      uint64_t ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      if ((int)ErrorLogLevelForModule >= 8)
      {
        uint64_t v22 = VRTraceErrorLogLevelToCSTR();
        unsigned int v23 = *MEMORY[0x263F21098];
        __int16 v24 = *MEMORY[0x263F21098];
        if (*MEMORY[0x263F21088])
        {
          uint64_t ErrorLogLevelForModule = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
          if (ErrorLogLevelForModule)
          {
            uint64_t v25 = IPPORTToStringWithSize();
            int v26 = v16;
            unsigned int v27 = v85[3];
            uint64_t v28 = IPPORTToStringWithSize();
            unsigned int v29 = v85[2];
            v86[0] = v68;
            *(void *)&v86[1] = v22;
            LOWORD(v86[3]) = 2080;
            *(void *)((char *)&v86[3] + 2) = "gckSessionRecvTCPMessage";
            HIWORD(v86[5]) = 1024;
            v86[6] = 3196;
            LOWORD(v86[7]) = 2080;
            *(void *)((char *)&v86[7] + 2) = v25;
            HIWORD(v86[9]) = 1024;
            v86[10] = v27;
            int v16 = v26;
            LOWORD(v86[11]) = 2080;
            *(void *)((char *)&v86[11] + 2) = v28;
            HIWORD(v86[13]) = 1024;
            v86[14] = v29;
            LOWORD(v86[15]) = 1024;
            *(_DWORD *)((char *)&v86[15] + 2) = v6;
            HIWORD(v86[16]) = 1024;
            v86[17] = v82;
            _os_log_impl(&dword_221563000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCP: [%s] %08X <= [%s] %08X: %d bytes(%d)", (uint8_t *)v86, 0x48u);
          }
        }
        else
        {
          uint64_t ErrorLogLevelForModule = os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG);
          if (ErrorLogLevelForModule)
          {
            uint64_t v62 = IPPORTToStringWithSize();
            int v63 = v16;
            unsigned int v64 = v85[3];
            uint64_t v65 = IPPORTToStringWithSize();
            unsigned int v66 = v85[2];
            v86[0] = v68;
            *(void *)&v86[1] = v22;
            LOWORD(v86[3]) = 2080;
            *(void *)((char *)&v86[3] + 2) = "gckSessionRecvTCPMessage";
            HIWORD(v86[5]) = 1024;
            v86[6] = 3196;
            LOWORD(v86[7]) = 2080;
            *(void *)((char *)&v86[7] + 2) = v62;
            HIWORD(v86[9]) = 1024;
            v86[10] = v64;
            int v16 = v63;
            LOWORD(v86[11]) = 2080;
            *(void *)((char *)&v86[11] + 2) = v65;
            HIWORD(v86[13]) = 1024;
            v86[14] = v66;
            LOWORD(v86[15]) = 1024;
            *(_DWORD *)((char *)&v86[15] + 2) = v6;
            HIWORD(v86[16]) = 1024;
            v86[17] = v82;
            _os_log_debug_impl(&dword_221563000, v23, OS_LOG_TYPE_DEBUG, " [%s] %s:%d TCP: [%s] %08X <= [%s] %08X: %d bytes(%d)", (uint8_t *)v86, 0x48u);
          }
        }
      }
      __int16 v20 = v85;
    }
    int v30 = v20 + 3;
    size_t v31 = 4 * (*(unsigned char *)v20 & 0xF);
    MEMORY[0x270FA5388](ErrorLogLevelForModule);
    uint64_t v34 = (_DWORD *)((char *)&v68 - v32);
    if (!v33) {
      goto LABEL_62;
    }
    uint64_t v72 = &v68;
    int v73 = v16;
    ssize_t v74 = v6;
    unint64_t v35 = v33;
    memset((char *)&v68 - v32, 170, v31);
    int v36 = 0;
    int v80 = v34;
    unint64_t v81 = v35;
    int v37 = (int *)(v20 + 3);
    do
    {
      int v39 = *v37++;
      int v38 = v39;
      if (v39 == *(_DWORD *)(v4 + 108))
      {
        int v36 = 1;
        uint64_t NextHop = 0xFFFFFFFFLL;
      }
      else
      {
        uint64_t NextHop = gckSessionFindNextHop(v4, v38);
      }
      *v34++ = NextHop;
      --v35;
    }
    while (v35);
    int v71 = v36;
    int v41 = v82;
    BOOL v77 = v82 == 7;
    long long v42 = v20 + 4;
    long long v43 = v80;
    unint64_t v44 = v81;
    __int16 v45 = v80 + 1;
    uint64_t v46 = 1;
    size_t v79 = v31;
    do
    {
      int v47 = v43[v35];
      if (v47 == -1)
      {
        ++v35;
        goto LABEL_50;
      }
      int v83 = &v68;
      MEMORY[0x270FA5388](NextHop);
      __int16 v49 = (unsigned int *)((char *)&v68 - v48);
      uint64_t NextHop = (uint64_t)memset((char *)&v68 - v48, 170, v31);
      unint64_t v44 = v81;
      unint64_t v50 = v30;
      *__int16 v49 = *(_DWORD *)&v30[4 * v35++];
      uint64_t v51 = 1;
      if (v35 >= v44)
      {
        int v41 = v82;
      }
      else
      {
        unint64_t v52 = v44;
        uint64_t v53 = v45;
        uint64_t v54 = v42;
        int v41 = v82;
        do
        {
          if (*v53 == v47)
          {
            v49[(int)v51] = *v54;
            uint64_t v51 = (v51 + 1);
            *uint64_t v53 = -1;
          }
          ++v54;
          ++v53;
          --v52;
        }
        while (v46 != v52);
      }
      switch(v41)
      {
        case 7:
LABEL_43:
          memset(v86, 170, sizeof(v86));
          uint64_t v55 = v78;
          uint64_t NextHop = OSPFMakeData((char *)v86, 4096, (uint64_t)v84, 0, v77, v85[2], v49, v51, *(uint64_t (**)(uint64_t, unsigned int *, uint64_t, char *, void, void, void, void, unsigned __int16))(*(void *)(v78 + 96) + 24), *(void *)(*(void *)(v78 + 96) + 32), 0x40u, 0, 0);
          if ((int)NextHop >= 1) {
            uint64_t NextHop = SendUDPPacketToParticipantChannelID(v55, v86, NextHop, v47, 0, -1, 1);
          }
LABEL_48:
          int v41 = v82;
          unint64_t v44 = v81;
          break;
        case 6:
          memset(v86, 170, sizeof(v86));
          uint64_t NextHop = OSPFMakeAudio((uint64_t)v86, 4096, (uint64_t)v84, 0, v85[2], v49, v51);
          if ((int)NextHop >= 1) {
            uint64_t NextHop = SendUDPPacketToParticipantChannelID(v78, v86, NextHop, v47, 0, -1, 2);
          }
          goto LABEL_48;
        case 5:
          goto LABEL_43;
      }
      int v30 = v50;
      size_t v31 = v79;
      long long v43 = v80;
LABEL_50:
      ++v46;
      ++v42;
      ++v45;
    }
    while (v35 != v44);
    uint64_t v4 = v78;
    LODWORD(v6) = v74;
    int v16 = v73;
    if (v71)
    {
      switch(v41)
      {
        case 7:
          goto LABEL_55;
        case 6:
          uint64_t v56 = *(void *)(v78 + 96);
          int v57 = v85[2];
          unint64_t v59 = *(const void **)v84;
          int v60 = v84[2];
          int v58 = 5;
          goto LABEL_60;
        case 5:
LABEL_55:
          uint64_t v56 = *(void *)(v78 + 96);
          int v57 = v85[2];
          if (v41 == 7) {
            int v58 = 6;
          }
          else {
            int v58 = 4;
          }
          unint64_t v59 = *(const void **)v84;
          int v60 = v84[2];
LABEL_60:
          PostEventCallback(v56, v57, v58, v59, v60, 0);
          break;
        default:
          gckSessionProcessOSPFPacket(v78, v75, (uint64_t)v85, (uint64_t)v84);
          break;
      }
    }
LABEL_62:
    if (v85) {
      free(v85);
    }
    uint64_t v61 = v76;
    if (v84) {
      free(v84);
    }
    ssize_t v6 = (v6 - v16);
    if ((int)v6 < 1) {
      break;
    }
    uint64_t v17 = (_WORD *)((char *)v61 + v16);
    int v16 = OSPFGetLength((uint64_t)v17, v6);
  }
  while (v16 > 0);
}

uint64_t __gckSessionRecvMessage_block_invoke(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v3 = *(void *)(result + 32);
  ++*(_DWORD *)(v3 + 652);
  if (a3)
  {
    uint64_t v6 = result;
    pthread_mutex_lock((pthread_mutex_t *)(v3 + 664));
    if (a3 >= 1)
    {
      uint64_t v7 = 0;
      uint64_t v8 = a3;
      do
      {
        int v9 = *(unsigned __int8 **)(a2 + 8 * v7);
        if (v9)
        {
          uint64_t v10 = v9[1];
          int v11 = *v9;
          if ((v11 - 13) >= 2)
          {
            if (v11 == 15)
            {
              uint64_t v26 = *(void *)(v6 + 48);
              if (!*(unsigned char *)v26)
              {
                *(unsigned char *)uint64_t v26 = 1;
                *(_DWORD *)(v26 + 8) = 4 * v10;
                *(_WORD *)(v26 + 6) = bswap32(*((unsigned __int16 *)v9 + 1)) >> 16;
                *(_WORD *)(v26 + 2) = bswap32(*((unsigned __int16 *)v9 + 2)) >> 16;
                *(_WORD *)(v26 + 4) = bswap32(*((unsigned __int16 *)v9 + 3)) >> 16;
              }
            }
          }
          else
          {
            uint64_t v12 = *(_DWORD **)(v6 + 32);
            unsigned int v13 = v12[161];
            int v14 = v12[165];
            if ((OSPFProcessDynamicOption(v12 + 156, v9, *(timeval **)(v6 + 40)) & 1) == 0)
            {
              uint64_t v15 = *(void *)(v6 + 32);
              unsigned int v16 = *(_DWORD *)(v15 + 644);
              BOOL v17 = v16 >= v13;
              unsigned int v18 = v16 - v13;
              *(float *)(v15 + 604) = *(float *)(v15 + 604) + (float)v18;
              if (v18 != 0 && v17) {
                *(float *)(v15 + 612) = *(float *)(v15 + 612) + (float)(*(_DWORD *)(v15 + 660) - v14);
              }
              uint64_t v19 = malloc_type_calloc(1uLL, 0x10uLL, 0x20040A4A59CD2uLL);
              if (v19)
              {
                __int16 v20 = v19;
                size_t v21 = 4 * v10 + 4;
                uint64_t v22 = malloc_type_calloc(1uLL, v21, 0x952A29A6uLL);
                *__int16 v20 = v22;
                if (v22)
                {
                  memcpy(v22, *(const void **)(a2 + 8 * v7), v21);
                  unsigned int v23 = (void *)(*(void *)(v6 + 32) + 520);
                  do
                  {
                    __int16 v24 = v23;
                    uint64_t v25 = *v23;
                    unsigned int v23 = (void *)(*v23 + 8);
                  }
                  while (v25);
                  *__int16 v24 = v20;
                }
                else
                {
                  free(v20);
                }
              }
            }
          }
        }
        ++v7;
      }
      while (v7 != v8);
    }
    unsigned int v27 = (pthread_mutex_t *)(*(void *)(v6 + 32) + 664);
    return pthread_mutex_unlock(v27);
  }
  return result;
}

void gckSessionProcessOSPFPacket(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  switch(*(unsigned char *)(a3 + 1))
  {
    case 1:
      gckSessionProcessHello(a1, a2, a4, 1);
      return;
    case 2:
      gckSessionProcessDD(a1, a2, a4);
      return;
    case 3:
      gckSessionProcessLSA(a1, (_DWORD *)a2, a4);
      return;
    case 4:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        uint64_t v8 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          int v9 = *(_DWORD *)(a1 + 108);
          int v10 = *(_DWORD *)(a2 + 116);
          *(_DWORD *)buf = 136316162;
          uint64_t v41 = v7;
          __int16 v42 = 2080;
          long long v43 = "gckSessionProcessLSAACK";
          __int16 v44 = 1024;
          int v45 = 3031;
          __int16 v46 = 1024;
          *(_DWORD *)int v47 = v9;
          *(_WORD *)&v47[4] = 1024;
          *(_DWORD *)&unsigned char v47[6] = v10;
          _os_log_impl(&dword_221563000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d I am %08X ==================================== LSAACK from %08X", buf, 0x28u);
        }
      }
      int v11 = (pthread_mutex_t *)(a2 + 664);
      pthread_mutex_lock((pthread_mutex_t *)(a2 + 664));
      uint64_t v12 = *(unsigned char **)(a2 + 496);
      if (v12)
      {
        unsigned int v13 = (void *)(a2 + 496);
        do
        {
          if (*v12 == 4 && *((unsigned __int16 *)v12 + 28) == *(unsigned __int16 *)(a4 + 12))
          {
            *unsigned int v13 = *((void *)v12 + 8);
            int v14 = (void *)*((void *)v12 + 5);
            if (v14) {
              free(v14);
            }
            free(v12);
          }
          else
          {
            unsigned int v13 = v12 + 64;
          }
          uint64_t v12 = (unsigned char *)*v13;
        }
        while (*v13);
      }
      goto LABEL_50;
    case 8:
      double v15 = micro();
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v16 = VRTraceErrorLogLevelToCSTR();
        BOOL v17 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v18 = "request";
          int v19 = *(unsigned __int16 *)(a4 + 14);
          unsigned int v20 = *(_DWORD *)(a2 + 116);
          if ((*(_WORD *)(a4 + 12) & 2) == 0) {
            unsigned int v18 = "response";
          }
          int v21 = *(_DWORD *)(a2 + 100);
          *(_DWORD *)buf = 136316674;
          uint64_t v41 = v16;
          __int16 v42 = 2080;
          long long v43 = "gckSessionProcessHeartbeat";
          __int16 v44 = 1024;
          int v45 = 2594;
          __int16 v46 = 2080;
          *(void *)int v47 = v18;
          *(_WORD *)&v47[8] = 1024;
          *(_DWORD *)uint64_t v48 = v19;
          *(_WORD *)&v48[4] = 1024;
          unsigned int v49 = v20;
          __int16 v50 = 1024;
          int v51 = v21;
          _os_log_impl(&dword_221563000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Received Heartbeat (%s) with SN [%d] from participant [%08X] over channel [%d]", buf, 0x38u);
        }
      }
      if ((*(_WORD *)(a4 + 12) & 2) == 0)
      {
        int v11 = (pthread_mutex_t *)(a2 + 664);
        pthread_mutex_lock((pthread_mutex_t *)(a2 + 664));
        uint64_t v22 = *(void *)(a2 + 496);
        if (v22)
        {
          while (*(unsigned char *)v22 != 8)
          {
            uint64_t v22 = *(void *)(v22 + 64);
            if (!v22) {
              goto LABEL_50;
            }
          }
          if (*(unsigned __int16 *)(v22 + 56) == *(unsigned __int16 *)(a4 + 14))
          {
            *(void *)(v22 + 8) = 0x3FC999999999999ALL;
            double v34 = *(double *)(a2 + 392);
            *(double *)(v22 + 32) = v15 + v34;
            *(double *)(v22 + 16) = v15 + v34 * 0.5;
          }
          else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v35 = VRTraceErrorLogLevelToCSTR();
            int v36 = *MEMORY[0x263F21098];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
            {
              int v37 = *(unsigned __int16 *)(a4 + 14);
              int v38 = *(unsigned __int16 *)(v22 + 56);
              *(_DWORD *)buf = 136316162;
              uint64_t v41 = v35;
              __int16 v42 = 2080;
              long long v43 = "gckSessionProcessHeartbeat";
              __int16 v44 = 1024;
              int v45 = 2617;
              __int16 v46 = 1024;
              *(_DWORD *)int v47 = v37;
              *(_WORD *)&v47[4] = 1024;
              *(_DWORD *)&unsigned char v47[6] = v38;
              _os_log_impl(&dword_221563000, v36, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Received SN [%u] doesn't match the expected SN [%u]", buf, 0x28u);
            }
          }
        }
LABEL_50:
        pthread_mutex_unlock(v11);
        return;
      }
      unsigned int v23 = *(_DWORD *)(a2 + 116);
      unsigned int v24 = *(unsigned __int16 *)(a4 + 14);
      int v25 = *(_DWORD *)(a2 + 100);
      int v39 = (void *)0xAAAAAAAAAAAAAAAALL;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v26 = VRTraceErrorLogLevelToCSTR();
        unsigned int v27 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          uint64_t v41 = v26;
          __int16 v42 = 2080;
          long long v43 = "gckSessionSendHeartbeat";
          __int16 v44 = 1024;
          int v45 = 1689;
          __int16 v46 = 1024;
          *(_DWORD *)int v47 = v23;
          _os_log_impl(&dword_221563000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Sending Heartbeat to [%08X]", buf, 0x22u);
        }
      }
      uint64_t v28 = OSPFMakeHeartbeat(&v39, *(_DWORD *)(a1 + 108), v23, 0, v24);
      int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      if ((v28 & 0x80000000) != 0)
      {
        if (ErrorLogLevelForModule >= 3)
        {
          uint64_t v32 = VRTraceErrorLogLevelToCSTR();
          unint64_t v33 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316418;
            uint64_t v41 = v32;
            __int16 v42 = 2080;
            long long v43 = "gckSessionSendHeartbeat";
            __int16 v44 = 1024;
            int v45 = 1694;
            __int16 v46 = 1024;
            *(_DWORD *)int v47 = v23;
            *(_WORD *)&v47[4] = 1024;
            *(_DWORD *)&unsigned char v47[6] = v24;
            *(_WORD *)uint64_t v48 = 1024;
            *(_DWORD *)&v48[2] = v25;
            _os_log_error_impl(&dword_221563000, v33, OS_LOG_TYPE_ERROR, " [%s] %s:%d OSPFMakeHeartbeat failed for participant [%08X], SN [%d], channel [%d]", buf, 0x2Eu);
          }
        }
      }
      else
      {
        if (ErrorLogLevelForModule >= 7)
        {
          uint64_t v30 = VRTraceErrorLogLevelToCSTR();
          size_t v31 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316674;
            uint64_t v41 = v30;
            __int16 v42 = 2080;
            long long v43 = "gckSessionSendHeartbeat";
            __int16 v44 = 1024;
            int v45 = 1698;
            __int16 v46 = 2080;
            *(void *)int v47 = "response";
            *(_WORD *)&v47[8] = 1024;
            *(_DWORD *)uint64_t v48 = v24;
            *(_WORD *)&v48[4] = 1024;
            unsigned int v49 = v23;
            __int16 v50 = 1024;
            int v51 = v25;
            _os_log_impl(&dword_221563000, v31, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Sending Heartbeat (%s) with SN [%d] to participant [%08X] over channel [%d]", buf, 0x38u);
          }
        }
        SendUDPPacketToParticipantChannelID(a1, v39, v28, v23, 0, v25, 0);
        free(v39);
      }
      return;
    default:
      return;
  }
}

uint64_t gckSessionProcessHello(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  _OWORD v77[2] = *MEMORY[0x263EF8340];
  int v67 = *(_DWORD *)(a2 + 408);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    int v9 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = *(_DWORD *)(a2 + 116);
      int v11 = *(_DWORD *)(a2 + 100);
      uint64_t v12 = *(void *)(a3 + 16);
      *(_DWORD *)buf = 136316418;
      uint64_t v70 = v8;
      __int16 v71 = 2080;
      uint64_t v72 = "gckSessionProcessHello";
      __int16 v73 = 1024;
      int v74 = 2423;
      __int16 v75 = 1024;
      *(_DWORD *)long long v76 = v10;
      *(_WORD *)&v76[4] = 1024;
      *(_DWORD *)&v76[6] = v11;
      LOWORD(v77[0]) = 2048;
      *(void *)((char *)v77 + 2) = v12;
      _os_log_impl(&dword_221563000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Received Hello from participant [%08X] over channel [%d]. Hello Flags [%llX]", buf, 0x32u);
    }
  }
  double v13 = micro();
  if (a4)
  {
    uint64_t v14 = gckSessionChangeStateCList(a1, a2, 3);
    unsigned int v15 = *(unsigned __int16 *)(a3 + 12);
    double v16 = *(double *)(a1 + 24);
    if (v16 < (double)v15) {
      unsigned int v15 = (int)v16;
    }
    if (v15 <= 5) {
      unsigned int v17 = 5;
    }
    else {
      unsigned int v17 = v15;
    }
  }
  else
  {
    unsigned int v17 = 0;
    uint64_t v14 = 0;
  }
  unsigned int v18 = *(_DWORD *)(a2 + 116);
  if (*(_DWORD *)(a1 + 108) > v18)
  {
    int v19 = gckSessionSendHello(a1, v18, 0, 0, v17, *(_DWORD *)(a2 + 100));
    if (v19 < 0 && v19 != -1072037876)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3
        && (VRTraceErrorLogLevelToCSTR(), os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)))
      {
        gckSessionProcessHello_cold_2();
        if (a4) {
          goto LABEL_17;
        }
      }
      else if (a4)
      {
LABEL_17:
        gckSessionChangeStateCList(a1, a2, 5);
        goto LABEL_19;
      }
      return 0;
    }
  }
  if (!a4) {
    return 0;
  }
LABEL_19:
  pthread_mutex_lock((pthread_mutex_t *)(a2 + 664));
  uint64_t v20 = *(void *)(a3 + 16);
  *(void *)(a2 + 56) = v20;
  if ((v20 & 2) != 0)
  {
    if ((v20 & 0x400) != 0 && *(_DWORD *)(a1 + 104) != 1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        uint64_t v25 = VRTraceErrorLogLevelToCSTR();
        uint64_t v26 = *MEMORY[0x263F21098];
        unsigned int v27 = *MEMORY[0x263F21098];
        if (*MEMORY[0x263F21088])
        {
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            uint64_t v70 = v25;
            __int16 v71 = 2080;
            uint64_t v72 = "gckSessionProcessHello";
            __int16 v73 = 1024;
            int v74 = 2467;
            _os_log_impl(&dword_221563000, v26, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d FLOW CONTROL enabled.", buf, 0x1Cu);
          }
        }
        else if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          gckSessionProcessHello_cold_1();
        }
      }
      *(_DWORD *)(a2 + 504) = 1;
    }
    uint64_t v32 = (double **)(a2 + 496);
    unint64_t v33 = *(double **)(a2 + 496);
    if (!v33)
    {
LABEL_51:
      unint64_t v68 = 0xAAAAAAAAAAAAAAAALL;
      int v41 = OSPFMakeHeartbeat(&v68, *(_DWORD *)(a1 + 108), *(_DWORD *)(a2 + 116), 1, 1u);
      if ((v41 & 0x80000000) == 0)
      {
        int v42 = v41;
        long long v43 = (double *)malloc_type_calloc(1uLL, 0x48uLL, 0x10200409EACE7F9uLL);
        *(unsigned char *)long long v43 = 8;
        v43[1] = 0.2;
        double v44 = *(double *)(a2 + 392);
        v43[4] = v13 + v44;
        v43[2] = v13 + v44 * 0.5;
        *((void *)v43 + 5) = v68;
        *((_DWORD *)v43 + 12) = v42;
        *((_WORD *)v43 + 28) = 1;
        *((_DWORD *)v43 + 13) = *(_DWORD *)(a2 + 116);
        *uint64_t v32 = v43;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v45 = VRTraceErrorLogLevelToCSTR();
          __int16 v46 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            int v47 = *((unsigned __int16 *)v43 + 28);
            int v48 = *(_DWORD *)(a2 + 116);
            int v49 = *(_DWORD *)(a2 + 100);
            *(_DWORD *)buf = 136316418;
            uint64_t v70 = v45;
            __int16 v71 = 2080;
            uint64_t v72 = "gckSessionProcessHello";
            __int16 v73 = 1024;
            int v74 = 2510;
            __int16 v75 = 1024;
            *(_DWORD *)long long v76 = v47;
            *(_WORD *)&v76[4] = 1024;
            *(_DWORD *)&v76[6] = v48;
            LOWORD(v77[0]) = 1024;
            *(_DWORD *)((char *)v77 + 2) = v49;
            _os_log_impl(&dword_221563000, v46, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Schedule a Heartbeat with SN [%d] for participant [%08X] over channel [%d].", buf, 0x2Eu);
          }
        }
        if (*(_DWORD *)(a2 + 504))
        {
          if (*(double *)(a2 + 528) == 0.0)
          {
            double v50 = *(double *)(a2 + 536);
            if (v50 != 0.0)
            {
              ++*(_DWORD *)(a2 + 652);
              *(double *)(a2 + 528) = v13 + v50;
            }
          }
        }
      }
      uint64_t v14 = v14;
      goto LABEL_60;
    }
    double v34 = (os_log_t *)MEMORY[0x263F21098];
    while (1)
    {
      int v35 = *(unsigned __int8 *)v33;
      if (v35 == 1)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v36 = VRTraceErrorLogLevelToCSTR();
          int v37 = *v34;
          if (os_log_type_enabled(*v34, OS_LOG_TYPE_DEFAULT))
          {
            int v38 = *(_DWORD *)(a2 + 116);
            int v39 = *(_DWORD *)(a2 + 100);
            *(_DWORD *)buf = 136316162;
            uint64_t v70 = v36;
            __int16 v71 = 2080;
            uint64_t v72 = "gckSessionProcessHello";
            __int16 v73 = 1024;
            int v74 = 2474;
            __int16 v75 = 1024;
            *(_DWORD *)long long v76 = v38;
            *(_WORD *)&v76[4] = 1024;
            *(_DWORD *)&v76[6] = v39;
            _os_log_impl(&dword_221563000, v37, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Remove Hello from the retry list for participant [%08X] channel [%d]", buf, 0x28u);
          }
        }
        *uint64_t v32 = (double *)*((void *)v33 + 8);
        int v40 = (void *)*((void *)v33 + 5);
        if (v40) {
          free(v40);
        }
        free(v33);
      }
      else
      {
        if (v35 == 8)
        {
          v33[1] = 0.2;
          double v61 = *(double *)(a2 + 392);
          v33[4] = v13 + v61;
          v33[2] = v13 + v61 * 0.5;
          uint64_t v14 = v14;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v62 = VRTraceErrorLogLevelToCSTR();
            int v63 = *v34;
            if (os_log_type_enabled(*v34, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v64 = *((void *)v33 + 2);
              uint64_t v65 = *((void *)v33 + 4);
              *(_DWORD *)buf = 136316162;
              uint64_t v70 = v62;
              __int16 v71 = 2080;
              uint64_t v72 = "gckSessionProcessHello";
              __int16 v73 = 1024;
              int v74 = 2485;
              __int16 v75 = 2048;
              *(void *)long long v76 = v64;
              *(_WORD *)&v76[8] = 2048;
              v77[0] = v65;
              _os_log_impl(&dword_221563000, v63, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Heartbeat queued. Updated state to: nextFire [%.1lf] waitUntil [%.1lf]", buf, 0x30u);
            }
          }
          goto LABEL_60;
        }
        uint64_t v32 = (double **)(v33 + 8);
      }
      unint64_t v33 = *v32;
      if (!*v32) {
        goto LABEL_51;
      }
    }
  }
  uint64_t v21 = *(void *)(a2 + 496);
  if (v21)
  {
    while (1)
    {
      uint64_t v22 = v21;
      if (*(unsigned char *)v21 == 1) {
        break;
      }
      uint64_t v21 = *(void *)(v21 + 64);
      if (!v21)
      {
        uint64_t v23 = v14;
        unsigned int v24 = (double **)(v22 + 64);
        goto LABEL_31;
      }
    }
    *(void *)(v21 + 8) = 0x3FB0A3D70A3D70A4;
    double v30 = v13 + (double)v17;
    *(double *)(v21 + 32) = v30;
    if (*(void *)(v21 + 40)) {
      double v31 = *(double *)(a1 + 32);
    }
    else {
      double v31 = 0.0;
    }
    *(double *)(v21 + 16) = v30 - v31;
  }
  else
  {
    uint64_t v23 = v14;
    unsigned int v24 = (double **)(a2 + 496);
LABEL_31:
    uint64_t v28 = (double *)malloc_type_calloc(1uLL, 0x48uLL, 0x10200409EACE7F9uLL);
    *(unsigned char *)uint64_t v28 = 1;
    v28[1] = 0.065;
    double v29 = v13 + (double)v17;
    v28[4] = v29;
    v28[2] = v29;
    v28[5] = 0.0;
    *((_DWORD *)v28 + 12) = 0;
    *((_DWORD *)v28 + 13) = *(_DWORD *)(a2 + 116);
    *unsigned int v24 = v28;
    uint64_t v14 = v23;
  }
LABEL_60:
  int v51 = *(_DWORD *)(a1 + 12);
  if (v51 != -1)
  {
    *(_DWORD *)(a1 + 12) = -1;
    close(v51);
  }
  pthread_mutex_unlock((pthread_mutex_t *)(a2 + 664));
  if ((v14 & 0x80000000) == 0)
  {
    if (*(_DWORD *)(a1 + 104))
    {
      int v52 = *(_DWORD *)(a2 + 84);
      if (*(_DWORD *)(a2 + 76))
      {
        if (!v52)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v53 = VRTraceErrorLogLevelToCSTR();
            uint64_t v54 = *MEMORY[0x263F21098];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315906;
              uint64_t v70 = v53;
              __int16 v71 = 2080;
              uint64_t v72 = "gckSessionProcessHello";
              __int16 v73 = 1024;
              int v74 = 2554;
              __int16 v75 = 2080;
              *(void *)long long v76 = a2 + 120;
              _os_log_impl(&dword_221563000, v54, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Invitation from \"%s\"", buf, 0x26u);
            }
          }
          PostEventCallback(*(void *)(a1 + 96), *(_DWORD *)(a2 + 116), 0, (const void *)(a2 + 120), *(_DWORD *)(a2 + 376), 0);
        }
        return v14;
      }
      if (v52 || v67 == 3 || *(_DWORD *)(a1 + 108) >= *(_DWORD *)(a2 + 116) || *(_DWORD *)(a2 + 108)) {
        return v14;
      }
      uint64_t v56 = v14;
      pthread_mutex_lock((pthread_mutex_t *)(a1 + 7800));
      int v57 = *(_DWORD *)(a1 + 112);
      pthread_mutex_unlock((pthread_mutex_t *)(a1 + 7800));
      if (v57 < 2) {
        return v56;
      }
      uint64_t v14 = v56;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v58 = VRTraceErrorLogLevelToCSTR();
        unint64_t v59 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          int v60 = *(_DWORD *)(a2 + 116);
          *(_DWORD *)buf = 136315906;
          uint64_t v70 = v58;
          __int16 v71 = 2080;
          uint64_t v72 = "gckSessionProcessHello";
          __int16 v73 = 1024;
          int v74 = 2571;
          __int16 v75 = 1024;
          *(_DWORD *)long long v76 = v60;
          _os_log_impl(&dword_221563000, v59, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Send DD to %08X (local)", buf, 0x22u);
        }
      }
      unsigned int v55 = *(_DWORD *)(a2 + 116);
    }
    else
    {
      if (v67 == 3) {
        return v14;
      }
      unsigned int v55 = *(_DWORD *)(a2 + 116);
      if (*(_DWORD *)(a1 + 108) >= v55) {
        return v14;
      }
    }
    gckSessionSendDD(a1, v55, 1);
  }
  return v14;
}

void gckSessionProcessDD(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v103 = *MEMORY[0x263EF8340];
  unint64_t v5 = *(unsigned int *)(a1 + 112);
  uint64_t v89 = a2;
  if ((int)v5 < 1)
  {
    BOOL v8 = 0;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = (_DWORD *)(a1 + 396);
    BOOL v8 = 1;
    do
    {
      if (*(v7 - 1) && *v7 != *(_DWORD *)(a2 + 116)) {
        break;
      }
      BOOL v8 = ++v6 < v5;
      v7 += 120;
    }
    while (v5 != v6);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    int v10 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = *(_DWORD *)(v4 + 108);
      int v12 = *(_DWORD *)(v89 + 116);
      *(_DWORD *)buf = 136316162;
      os_log_t v92 = (os_log_t)v9;
      __int16 v93 = 2080;
      uint64_t v94 = "gckSessionProcessDD";
      __int16 v95 = 1024;
      int v96 = 2667;
      __int16 v97 = 1024;
      *(_DWORD *)int v98 = v11;
      *(_WORD *)&v98[4] = 1024;
      *(_DWORD *)&v98[6] = v12;
      _os_log_impl(&dword_221563000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d I am %08X ==================================== DD from %08X", buf, 0x28u);
    }
  }
  TracePrintNodes(*(_DWORD *)(a3 + 12), *(void *)(a3 + 16));
  double v13 = &Te2[10];
  if (!*(_DWORD *)(v4 + 48) && !*(_DWORD *)(v4 + 104))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      unsigned int v15 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        int v16 = *(_DWORD *)(v89 + 116);
        *(_DWORD *)buf = 136315906;
        os_log_t v92 = (os_log_t)v14;
        __int16 v93 = 2080;
        uint64_t v94 = "gckSessionProcessDD";
        __int16 v95 = 1024;
        int v96 = 2671;
        __int16 v97 = 1024;
        *(_DWORD *)int v98 = v16;
        _os_log_impl(&dword_221563000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d DD: STOP ICE check with peer %08X", buf, 0x22u);
      }
    }
    ICEStopConnectivityCheck();
    ICEStopConnectivityCheck();
  }
  int v17 = *(_DWORD *)(v4 + 104);
  if (v17 == 1)
  {
    if (*(_DWORD *)(v89 + 76)) {
      goto LABEL_24;
    }
    unsigned int v18 = *(_DWORD *)(v89 + 116);
    goto LABEL_23;
  }
  if (!v17)
  {
    unsigned int v18 = *(_DWORD *)(v89 + 116);
    if (*(_DWORD *)(v4 + 108) > v18) {
LABEL_23:
    }
      gckSessionSendDD(v4, v18, 0);
  }
LABEL_24:
  int v19 = (_DWORD *)(v4 + 116);
  uint64_t v20 = (pthread_mutex_t *)(v89 + 664);
  pthread_mutex_lock((pthread_mutex_t *)(v89 + 664));
  uint64_t v21 = *(void **)(v89 + 496);
  if (v21)
  {
    uint64_t v22 = (void *)(v89 + 496);
    do
    {
      if (*(unsigned char *)v21 == 2)
      {
        *uint64_t v22 = v21[8];
        uint64_t v23 = (void *)v21[5];
        if (v23) {
          free(v23);
        }
        free(v21);
      }
      else
      {
        uint64_t v22 = v21 + 8;
      }
      uint64_t v21 = (void *)*v22;
    }
    while (*v22);
  }
  uint64_t v24 = pthread_mutex_unlock(v20);
  uint64_t v25 = *(unsigned int *)(a3 + 12);
  *(void *)&long long v87 = *(void *)(a3 + 16);
  MEMORY[0x270FA5388](v24);
  uint64_t v88 = v4;
  int v90 = (char *)&v81 - ((v26 + 15) & 0x7FFFFFFF0);
  if (!v25)
  {
    int v83 = (pthread_mutex_t *)(v4 + 7800);
    pthread_mutex_lock((pthread_mutex_t *)(v4 + 7800));
    goto LABEL_67;
  }
  memset((char *)&v81 - ((v26 + 15) & 0x7FFFFFFF0), 170, v26);
  int v83 = (pthread_mutex_t *)(v4 + 7800);
  pthread_mutex_lock((pthread_mutex_t *)(v4 + 7800));
  if ((int)v25 < 1)
  {
LABEL_67:
    int v29 = 0;
    goto LABEL_68;
  }
  uint64_t v28 = 0;
  int v29 = 0;
  uint64_t v84 = v4 + 125;
  *(void *)&long long v27 = 136315906;
  long long v86 = v27;
  *(void *)&long long v27 = 136316162;
  long long v85 = v27;
  do
  {
    uint64_t v30 = *(unsigned int *)(v4 + 112);
    if ((int)v30 < 1)
    {
      int v33 = 0;
      goto LABEL_51;
    }
    uint64_t v31 = v25;
    uint64_t v32 = 0;
    int v33 = 0;
    double v34 = (_DWORD *)(v87 + 480 * v28);
    while (1)
    {
      uint64_t v35 = v4 + v32;
      if (*v34 == *(_DWORD *)(v4 + v32 + 116)) {
        break;
      }
      ++v33;
      v32 += 480;
      if (480 * v30 == v32)
      {
        uint64_t v25 = v31;
        goto LABEL_52;
      }
    }
    if (*(unsigned __int16 *)(v87 + 480 * v28 + 272) <= *(unsigned __int16 *)(v35 + 388)) {
      goto LABEL_50;
    }
    uint64_t v36 = (int *)(v35 + 116);
    memcpy((void *)(v35 + 116), v34, 0x1E0uLL);
    if (*(_DWORD *)(v89 + 108) || *(_DWORD *)(v89 + 116) != *v36) {
      goto LABEL_49;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v81 = VRTraceErrorLogLevelToCSTR();
      os_log_t v82 = (os_log_t)*MEMORY[0x263F21098];
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v86;
        os_log_t v92 = (os_log_t)v81;
        __int16 v93 = 2080;
        uint64_t v94 = "gckSessionProcessDD";
        __int16 v95 = 1024;
        int v96 = 2718;
        __int16 v97 = 2080;
        *(void *)int v98 = v84 + v32;
        _os_log_impl(&dword_221563000, v82, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d DD: Connected to \"%s\" (promote direct)", buf, 0x26u);
      }
    }
    if (*(_DWORD *)(v88 + 104) == 1)
    {
      uint64_t v37 = v89;
      if (isInNeighbor((uint64_t)v19, 1, *(_DWORD *)(v89 + 116)))
      {
LABEL_49:
        uint64_t v4 = v88;
      }
      else
      {
        uint64_t v4 = v88;
        if ((gckSessionAddNode(v88, *(_DWORD *)(v37 + 116), 255) & 0x80000000) == 0)
        {
          gckSessionUpdateNode(v4, *(_DWORD *)(v37 + 116), *(_DWORD *)(v37 + 560), 0);
          ++*(_WORD *)(v4 + 388);
          BOOL v8 = 1;
          *(_DWORD *)(v4 + 392) = 1;
        }
      }
LABEL_50:
      uint64_t v25 = v31;
      goto LABEL_51;
    }
    uint64_t v25 = v31;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      os_log_t v82 = (os_log_t)VRTraceErrorLogLevelToCSTR();
      int v42 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        int v43 = *v36;
        *(_DWORD *)buf = v86;
        os_log_t v92 = v82;
        __int16 v93 = 2080;
        uint64_t v94 = "gckSessionProcessDD";
        __int16 v95 = 1024;
        int v96 = 2726;
        __int16 v97 = 1024;
        *(_DWORD *)int v98 = v43;
        _os_log_impl(&dword_221563000, v42, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckSessionProcessDD: init RetryICE w/ remoteID %08X OOB", buf, 0x22u);
      }
    }
    int v44 = *v36;
    uint64_t v4 = v88;
    GCKSessionSendDOOB(v88, v44, 0, 0, 1u, 0.0);
LABEL_51:
    if (v33 == v30)
    {
LABEL_52:
      int v38 = *(_DWORD *)(v4 + 112);
      if (v38 > 15)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v40 = VRTraceErrorLogLevelToCSTR();
          int v41 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR))
          {
            int v45 = *(_DWORD *)(v87 + 480 * v28);
            *(_DWORD *)buf = v85;
            os_log_t v92 = (os_log_t)v40;
            __int16 v93 = 2080;
            uint64_t v94 = "gckSessionProcessDD";
            __int16 v95 = 1024;
            int v96 = 2754;
            __int16 v97 = 1024;
            *(_DWORD *)int v98 = 2754;
            *(_WORD *)&v98[4] = 1024;
            *(_DWORD *)&v98[6] = v45;
            _os_log_error_impl(&dword_221563000, v41, OS_LOG_TYPE_ERROR, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: Maximum # of nodes reached.  Ignoring node [%08X]\n", buf, 0x28u);
          }
          uint64_t v4 = v88;
        }
      }
      else
      {
        int v39 = (_DWORD *)(v87 + 480 * v28);
        memcpy(&v19[120 * v38], v39, 0x1E0uLL);
        ++*(_DWORD *)(v4 + 112);
        *(_DWORD *)&v90[4 * v29++] = *v39;
      }
    }
    ++v28;
  }
  while (v28 != v25);
  double v13 = Te2 + 40;
LABEL_68:
  gckSessionFindShortestPath(*(_DWORD *)(v4 + 112), v19);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v46 = VRTraceErrorLogLevelToCSTR();
    int v47 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      os_log_t v92 = (os_log_t)v46;
      __int16 v93 = 2080;
      uint64_t v94 = "gckSessionProcessDD";
      __int16 v95 = 1024;
      int v96 = 2760;
      _os_log_impl(&dword_221563000, v47, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ====== After processing incoming DD", buf, 0x1Cu);
    }
  }
  TracePrintNodes(*(_DWORD *)(v4 + 112), (uint64_t)v19);
  if (v8) {
    int v48 = -1;
  }
  else {
    int v48 = *(_DWORD *)(v89 + 116);
  }
  gckSessionSendLSA(v4, *(_DWORD *)(v4 + 112), v19, v48, 0);
  gckSessionCleanupNodes(v4, -1, 0);
  uint64_t v49 = *(unsigned int *)(v4 + 112);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v51 = VRTraceErrorLogLevelToCSTR();
    int v52 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      os_log_t v92 = (os_log_t)v51;
      __int16 v93 = 2080;
      uint64_t v94 = "gckSessionProcessDD";
      __int16 v95 = 1024;
      int v96 = 2770;
      __int16 v97 = 1024;
      *(_DWORD *)int v98 = v29;
      *(_WORD *)&v98[4] = 1024;
      *(_DWORD *)&v98[6] = v49;
      _os_log_impl(&dword_221563000, v52, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ====== iNewNodeIDs = %d, iNodes = %d", buf, 0x28u);
    }
  }
  if (v29 >= 1)
  {
    uint64_t v53 = 0;
    uint64_t v84 = v29;
    *(void *)&long long v50 = 136316674;
    long long v87 = v50;
    *(void *)&long long v50 = *((void *)v13 + 251);
    long long v86 = v50;
    *(void *)&long long v50 = 136315650;
    long long v85 = v50;
    while ((int)v49 < 1)
    {
LABEL_118:
      if (++v53 == v84) {
        goto LABEL_119;
      }
    }
    uint64_t v54 = 0;
    while (2)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() <= 6)
      {
        int v58 = *(_DWORD *)&v90[4 * v53];
      }
      else
      {
        uint64_t v55 = VRTraceErrorLogLevelToCSTR();
        uint64_t v56 = *MEMORY[0x263F21098];
        BOOL v57 = os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT);
        int v58 = *(_DWORD *)&v90[4 * v53];
        if (v57)
        {
          int v59 = v19[120 * v54];
          *(_DWORD *)buf = v87;
          os_log_t v92 = (os_log_t)v55;
          __int16 v93 = 2080;
          uint64_t v94 = "gckSessionProcessDD";
          __int16 v95 = 1024;
          int v96 = 2773;
          __int16 v97 = 1024;
          *(_DWORD *)int v98 = v53;
          *(_WORD *)&v98[4] = 1024;
          *(_DWORD *)&v98[6] = v54;
          __int16 v99 = 1024;
          int v100 = v58;
          __int16 v101 = 1024;
          int v102 = v59;
          _os_log_impl(&dword_221563000, v56, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ====== @ %d (%08X), %d (%08X)", buf, 0x34u);
        }
      }
      int v60 = &v19[120 * v54];
      if (v58 == *v60 && v19[120 * v54 + 1] != -1)
      {
        uint64_t v61 = v89;
        reportingGKLog();
        if (*(_DWORD *)(v61 + 108) || *(_DWORD *)(v61 + 116) != *v60)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v69 = VRTraceErrorLogLevelToCSTR();
            uint64_t v70 = *MEMORY[0x263F21098];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v86;
              os_log_t v92 = (os_log_t)v69;
              __int16 v93 = 2080;
              uint64_t v94 = "gckSessionProcessDD";
              __int16 v95 = 1024;
              int v96 = 2794;
              __int16 v97 = 2080;
              *(void *)int v98 = (char *)&v19[120 * v54 + 2] + 1;
              _os_log_impl(&dword_221563000, v70, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d DD: Connected to \"%s\" (new connection)", buf, 0x26u);
            }
          }
          uint64_t v65 = v88;
          uint64_t v64 = v89;
          uint64_t v71 = *(void *)(v88 + 7888);
          if (v71)
          {
            while (*(_DWORD *)(v71 + 116) != *v60)
            {
              uint64_t v71 = *(void *)(v71 + 728);
              if (!v71) {
                goto LABEL_105;
              }
            }
            int v72 = 0;
            atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(v71 + 96), (unsigned int *)&v72, 2u, memory_order_relaxed, memory_order_relaxed);
          }
        }
        else
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v62 = VRTraceErrorLogLevelToCSTR();
            int v63 = *MEMORY[0x263F21098];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v86;
              os_log_t v92 = (os_log_t)v62;
              __int16 v93 = 2080;
              uint64_t v94 = "gckSessionProcessDD";
              __int16 v95 = 1024;
              int v96 = 2782;
              __int16 v97 = 2080;
              *(void *)int v98 = (char *)&v19[120 * v54 + 2] + 1;
              _os_log_impl(&dword_221563000, v63, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d DD: Connected to \"%s\" (direct connection)", buf, 0x26u);
            }
          }
          uint64_t v65 = v88;
          uint64_t v64 = v89;
          if (*(_DWORD *)(v88 + 104) != 1)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v66 = VRTraceErrorLogLevelToCSTR();
              int v67 = *MEMORY[0x263F21098];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
              {
                int v68 = *v60;
                *(_DWORD *)buf = v86;
                os_log_t v92 = (os_log_t)v66;
                __int16 v93 = 2080;
                uint64_t v94 = "gckSessionProcessDD";
                __int16 v95 = 1024;
                int v96 = 2790;
                __int16 v97 = 1024;
                *(_DWORD *)int v98 = v68;
                _os_log_impl(&dword_221563000, v67, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckSessionProcessDD: init RetryICE w/ remoteID %08X OOB", buf, 0x22u);
              }
            }
            uint64_t v65 = v88;
            GCKSessionSendDOOB(v88, *v60, 0, 0, 1u, 0.0);
            uint64_t v64 = v89;
          }
        }
LABEL_105:
        if (*(_DWORD *)(v64 + 4)) {
          int v73 = 13;
        }
        else {
          int v73 = 1;
        }
        PostEventCallback(*(void *)(v65 + 96), *v60, v73, (char *)&v19[120 * v54 + 2] + 1, LOBYTE(v19[120 * v54 + 2]), 0);
        int v74 = *(_DWORD *)(v65 + 104);
        if (v74 == 1)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            uint64_t v79 = VRTraceErrorLogLevelToCSTR();
            int v80 = *MEMORY[0x263F21098];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v85;
              os_log_t v92 = (os_log_t)v79;
              __int16 v93 = 2080;
              uint64_t v94 = "gckSessionProcessDD";
              __int16 v95 = 1024;
              int v96 = 2817;
              BOOL v77 = v80;
              uint64_t v78 = " [%s] %s:%d localscopeconnected";
LABEL_116:
              _os_log_impl(&dword_221563000, v77, OS_LOG_TYPE_DEFAULT, v78, buf, 0x1Cu);
            }
          }
        }
        else if (!v74 && (int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v75 = VRTraceErrorLogLevelToCSTR();
          long long v76 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v85;
            os_log_t v92 = (os_log_t)v75;
            __int16 v93 = 2080;
            uint64_t v94 = "gckSessionProcessDD";
            __int16 v95 = 1024;
            int v96 = 2813;
            BOOL v77 = v76;
            uint64_t v78 = " [%s] %s:%d globalscopeconnected";
            goto LABEL_116;
          }
        }
      }
      if (++v54 == v49) {
        goto LABEL_118;
      }
      continue;
    }
  }
LABEL_119:
  *(_DWORD *)(v89 + 92) = 1;
  pthread_mutex_unlock(v83);
  gckSessionCheckPendingConnections(v88, 0);
}

void gckSessionProcessLSA(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  *(void *)((char *)&v99[2] + 2) = *MEMORY[0x263EF8340];
  uint64_t v6 = *(void *)(a3 + 24);
  MEMORY[0x270FA5388](a1);
  BOOL v8 = (char *)&v81 - ((v7 + 15) & 0x7FFFFFFF0);
  *(void *)&long long v88 = v9;
  if (v9) {
    memset((char *)&v81 - ((v7 + 15) & 0x7FFFFFFF0), 170, v7);
  }
  unint64_t v10 = *(unsigned int *)(a1 + 112);
  if ((int)v10 < 1)
  {
    BOOL v13 = 0;
  }
  else
  {
    uint64_t v11 = 0;
    int v12 = (_DWORD *)(a1 + 396);
    BOOL v13 = 1;
    do
    {
      if (*(v12 - 1) && *v12 != a2[29]) {
        break;
      }
      BOOL v13 = ++v11 < v10;
      v12 += 120;
    }
    while (v10 != v11);
  }
  uint64_t v14 = (_DWORD *)(a1 + 116);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    int v16 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v17 = *(_DWORD *)(a1 + 108);
      int v18 = a2[29];
      *(_DWORD *)buf = 136316162;
      uint64_t v93 = v15;
      __int16 v94 = 2080;
      __int16 v95 = "gckSessionProcessLSA";
      __int16 v96 = 1024;
      int v97 = 2855;
      __int16 v98 = 1024;
      LODWORD(v99[0]) = v17;
      WORD2(v99[0]) = 1024;
      *(_DWORD *)((char *)v99 + 6) = v18;
      _os_log_impl(&dword_221563000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d I am %08X ==================================== LSA from %08X", buf, 0x28u);
    }
  }
  TracePrintNodes(*(_DWORD *)(a3 + 16), *(void *)(a3 + 24));
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 7800));
  char v19 = isInNeighbor(v6, v88, *(_DWORD *)(a1 + 108));
  if (*(_DWORD *)(a3 + 16) == 1)
  {
    char v21 = *(_DWORD *)v6 == a2[29] ? v19 : 1;
    if ((v21 & 1) == 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v25 = VRTraceErrorLogLevelToCSTR();
        size_t v26 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v93 = v25;
          __int16 v94 = 2080;
          __int16 v95 = "gckSessionProcessLSA";
          __int16 v96 = 1024;
          int v97 = 2869;
          _os_log_impl(&dword_221563000, v26, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got declining LSA", buf, 0x1Cu);
        }
      }
      unint64_t v27 = *(unsigned int *)(a1 + 112);
      int v28 = *(_DWORD *)v6;
      if ((int)v27 < 1) {
        goto LABEL_31;
      }
      if (*v14 != v28)
      {
        int v29 = (int *)(a1 + 596);
        uint64_t v30 = 1;
        do
        {
          unint64_t v31 = v30;
          if (v27 == v30) {
            break;
          }
          int v32 = *v29;
          ++v30;
          v29 += 120;
        }
        while (v32 != v28);
        if (v31 >= v27) {
LABEL_31:
        }
          PostEventCallback(*(void *)(a1 + 96), v28, 3, (const void *)(v6 + 9), *(unsigned __int8 *)(v6 + 8), 0);
      }
      a2[21] = 1;
      int v33 = *(_DWORD *)(a1 + 12);
      if (v33 != -1)
      {
        *(_DWORD *)(a1 + 12) = -1;
        close(v33);
      }
      goto LABEL_34;
    }
  }
  if (a2[23])
  {
LABEL_34:
    uint64_t v82 = a3;
    int v83 = (pthread_mutex_t *)(a1 + 7800);
    uint64_t v89 = a2;
    uint64_t v84 = v8;
    if ((int)v88 >= 1)
    {
      uint64_t v34 = 0;
      LODWORD(v86) = 0;
      uint64_t v87 = a1 + 404;
      *(void *)&long long v20 = 136315650;
      long long v85 = v20;
      *(void *)&long long v20 = 136316162;
      long long v81 = v20;
      while (1)
      {
        uint64_t v35 = *(unsigned int *)(a1 + 112);
        if ((int)v35 < 1)
        {
          LODWORD(v36) = 0;
        }
        else
        {
          uint64_t v36 = 0;
          uint64_t v37 = (_DWORD *)(v6 + 480 * v34);
          uint64_t v38 = a1;
          while (*v37 != *(_DWORD *)(v38 + 116))
          {
            ++v36;
            v38 += 480;
            if (v35 == v36) {
              goto LABEL_45;
            }
          }
          if (*(unsigned __int16 *)(v6 + 480 * v34 + 272) > *(unsigned __int16 *)(v38 + 388))
          {
            memcpy((void *)(v38 + 116), v37, 0x1E0uLL);
            if (!*(_DWORD *)(v38 + 400))
            {
              uint64_t v53 = *(unsigned int *)(a1 + 400);
              if ((int)v53 > 0)
              {
                uint64_t v54 = (_DWORD *)v87;
                while (*v54 != *(_DWORD *)(v38 + 116))
                {
                  v54 += 3;
                  if (!--v53) {
                    goto LABEL_44;
                  }
                }
                memmove(v54, v54 + 3, 12 * ((int)v53 - 1));
                --*(_DWORD *)(a1 + 400);
                ++*(_WORD *)(a1 + 388);
                *(_DWORD *)(a1 + 392) = 1;
              }
            }
          }
        }
LABEL_44:
        if (v36 != v35) {
          goto LABEL_63;
        }
LABEL_45:
        int v39 = (_DWORD *)(v6 + 480 * v34);
        if (v39[71])
        {
          int v40 = *(_DWORD *)(a1 + 112);
          a2 = v89;
          if (v40 <= 15)
          {
            memcpy(&v14[120 * v40], (const void *)(v6 + 480 * v34), 0x1E0uLL);
            ++*(_DWORD *)(a1 + 112);
            int v41 = v86 + 1;
            *(_DWORD *)&v84[4 * (int)v86] = *v39;
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v42 = VRTraceErrorLogLevelToCSTR();
              int v43 = *MEMORY[0x263F21098];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v85;
                uint64_t v93 = v42;
                __int16 v94 = 2080;
                __int16 v95 = "gckSessionProcessLSA";
                __int16 v96 = 1024;
                int v97 = 2937;
                _os_log_impl(&dword_221563000, v43, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Added one node", buf, 0x1Cu);
              }
            }
            LODWORD(v86) = v41;
            goto LABEL_64;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v48 = VRTraceErrorLogLevelToCSTR();
            uint64_t v49 = *MEMORY[0x263F21098];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR))
            {
              int v50 = *v39;
              *(_DWORD *)buf = v81;
              uint64_t v93 = v48;
              __int16 v94 = 2080;
              __int16 v95 = "gckSessionProcessLSA";
              __int16 v96 = 1024;
              int v97 = 2941;
              __int16 v98 = 1024;
              LODWORD(v99[0]) = 2941;
              WORD2(v99[0]) = 1024;
              *(_DWORD *)((char *)v99 + 6) = v50;
              _os_log_error_impl(&dword_221563000, v49, OS_LOG_TYPE_ERROR, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: Maximum # of nodes reached.  Ignoring node [%08X]\n", buf, 0x28u);
            }
LABEL_63:
            a2 = v89;
          }
        }
        else
        {
          uint64_t v44 = *(unsigned int *)(a1 + 400);
          a2 = v89;
          if ((int)v44 >= 1)
          {
            int v45 = *v39;
            int v46 = 1;
            int v47 = (_DWORD *)v87;
            while (*v47 != v45)
            {
              v47 += 3;
              ++v46;
              if (!--v44) {
                goto LABEL_64;
              }
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v51 = VRTraceErrorLogLevelToCSTR();
              int v52 = *MEMORY[0x263F21098];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v85;
                uint64_t v93 = v51;
                __int16 v94 = 2080;
                __int16 v95 = "gckSessionProcessLSA";
                __int16 v96 = 1024;
                int v97 = 2922;
                _os_log_impl(&dword_221563000, v52, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Removing Disconnecting Node", buf, 0x1Cu);
              }
            }
            memmove(v47, v47 + 3, 12 * (*(_DWORD *)(a1 + 400) - v46));
            --*(_DWORD *)(a1 + 400);
            ++*(_WORD *)(a1 + 388);
            *(_DWORD *)(a1 + 392) = 1;
            goto LABEL_63;
          }
        }
LABEL_64:
        if (++v34 == (void)v88) {
          goto LABEL_73;
        }
      }
    }
    LODWORD(v86) = 0;
LABEL_73:
    gckSessionFindShortestPath(*(_DWORD *)(a1 + 112), (_DWORD *)(a1 + 116));
    TracePrintNodes(*(_DWORD *)(a1 + 112), a1 + 116);
    unsigned int v55 = a2[29];
    __int16 v56 = *(_WORD *)(v82 + 12);
    *(void *)&long long v57 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v57 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v91[0] = v57;
    v91[1] = v57;
    int v90 = (_WORD *)0xAAAAAAAAAAAAAAAALL;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v58 = VRTraceErrorLogLevelToCSTR();
      int v59 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v93 = v58;
        __int16 v94 = 2080;
        __int16 v95 = "gckSessionSendLSAACK";
        __int16 v96 = 1024;
        int v97 = 1906;
        __int16 v98 = 1024;
        LODWORD(v99[0]) = v55;
        _os_log_impl(&dword_221563000, v59, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Sending LSAACK to [%08X]", buf, 0x22u);
      }
    }
    WORD6(v91[0]) = v56;
    uint64_t v60 = OSPFMakeLSAACK(&v90, (uint64_t)v91, 0, *(_DWORD *)(a1 + 108), v55);
    if ((v60 & 0x80000000) == 0)
    {
      SendUDPPacketToParticipantChannelID(a1, v90, v60, v55, 0, -1, 0);
      free(v90);
    }
    if (v13) {
      int v61 = -1;
    }
    else {
      int v61 = a2[29];
    }
    gckSessionSendLSA(a1, *(_DWORD *)(a1 + 112), (void *)(a1 + 116), v61, 0);
    gckSessionCleanupNodes(a1, -1, 0);
    if ((int)v86 < 1)
    {
LABEL_112:
      pthread_mutex_unlock(v83);
      return;
    }
    uint64_t v87 = 0;
    *(void *)&long long v85 = v86;
    uint64_t v63 = *(unsigned int *)(a1 + 112);
    *(void *)&long long v62 = 136315906;
    long long v88 = v62;
    *(void *)&long long v62 = 136315650;
    long long v86 = v62;
    while ((int)v63 < 1)
    {
LABEL_111:
      if (++v87 == (void)v85) {
        goto LABEL_112;
      }
    }
    uint64_t v64 = 0;
    int v65 = *(_DWORD *)&v84[4 * v87];
    while (1)
    {
      uint64_t v66 = &v14[120 * v64];
      if (v65 == *v66 && v14[120 * v64 + 1] != -1)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v67 = VRTraceErrorLogLevelToCSTR();
          int v68 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v88;
            uint64_t v93 = v67;
            __int16 v94 = 2080;
            __int16 v95 = "gckSessionProcessLSA";
            __int16 v96 = 1024;
            int v97 = 2964;
            __int16 v98 = 2080;
            v99[0] = (char *)&v14[120 * v64 + 2] + 1;
            _os_log_impl(&dword_221563000, v68, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d LSA: Connected to \"%s\" (new connection) ", buf, 0x26u);
          }
        }
        uint64_t v69 = v89;
        reportingGKLog();
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v70 = VRTraceErrorLogLevelToCSTR();
          uint64_t v71 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            int v72 = *v66;
            *(_DWORD *)buf = v88;
            uint64_t v93 = v70;
            __int16 v94 = 2080;
            __int16 v95 = "gckSessionProcessLSA";
            __int16 v96 = 1024;
            int v97 = 2974;
            __int16 v98 = 1024;
            LODWORD(v99[0]) = v72;
            _os_log_impl(&dword_221563000, v71, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckSessionProcessLSA: async RetryICE w/ remoteID %08X OOB", buf, 0x22u);
          }
        }
        uint64_t v73 = *(void *)(a1 + 7888);
        if (v73)
        {
          while (*(_DWORD *)(v73 + 116) != *v66)
          {
            uint64_t v73 = *(void *)(v73 + 728);
            if (!v73) {
              goto LABEL_96;
            }
          }
          int v74 = 0;
          atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(v73 + 96), (unsigned int *)&v74, 2u, memory_order_relaxed, memory_order_relaxed);
        }
        else
        {
LABEL_96:
          if (*(_DWORD *)(a1 + 104) != 1) {
            GCKSessionSendDOOB(a1, *(_DWORD *)(a1 + 108), (const UInt8 *)&v14[120 * v64], 4, 9u, 5.0);
          }
        }
        if (v69[1]) {
          int v75 = 13;
        }
        else {
          int v75 = 1;
        }
        PostEventCallback(*(void *)(a1 + 96), *v66, v75, (char *)&v14[120 * v64 + 2] + 1, LOBYTE(v14[120 * v64 + 2]), 0);
        int v76 = *(_DWORD *)(a1 + 104);
        if (v76 == 1) {
          goto LABEL_107;
        }
        if (!v76) {
          break;
        }
      }
LABEL_110:
      if (++v64 == v63) {
        goto LABEL_111;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v77 = VRTraceErrorLogLevelToCSTR();
      uint64_t v78 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v86;
        uint64_t v93 = v77;
        __int16 v94 = 2080;
        __int16 v95 = "gckSessionProcessLSA";
        __int16 v96 = 1024;
        int v97 = 3013;
        _os_log_impl(&dword_221563000, v78, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d globalscopeconnected", buf, 0x1Cu);
      }
    }
LABEL_107:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v79 = VRTraceErrorLogLevelToCSTR();
      int v80 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v86;
        uint64_t v93 = v79;
        __int16 v94 = 2080;
        __int16 v95 = "gckSessionProcessLSA";
        __int16 v96 = 1024;
        int v97 = 3015;
        _os_log_impl(&dword_221563000, v80, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d localscopeconnected", buf, 0x1Cu);
      }
    }
    goto LABEL_110;
  }
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 7800));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v22 = VRTraceErrorLogLevelToCSTR();
    uint64_t v23 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v24 = a2[29];
      *(_DWORD *)buf = 136315906;
      uint64_t v93 = v22;
      __int16 v94 = 2080;
      __int16 v95 = "gckSessionProcessLSA";
      __int16 v96 = 1024;
      int v97 = 2887;
      __int16 v98 = 1024;
      LODWORD(v99[0]) = v24;
      _os_log_impl(&dword_221563000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Premature LSA from %08X: ignoring...", buf, 0x22u);
    }
  }
}

void TracePrintNodes(int a1, uint64_t a2)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v32 = v3;
      __int16 v33 = 2080;
      uint64_t v34 = "TracePrintNodes";
      __int16 v35 = 1024;
      int v36 = 2382;
      __int16 v37 = 1024;
      int v38 = a1;
      _os_log_impl(&dword_221563000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ====== %d nodes =====", buf, 0x22u);
    }
  }
  if (a1 >= 1)
  {
    uint64_t v5 = 0;
    uint64_t v6 = (int *)(a2 + 292);
    size_t v7 = (unsigned char *)MEMORY[0x263F21088];
    do
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        uint64_t v9 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v10 = (int *)(a2 + 480 * v5);
          int v11 = *v10;
          int v12 = v10[1];
          int v13 = v10[67];
          int v14 = *((unsigned __int16 *)v10 + 136);
          int v15 = v10[69];
          int v16 = v10[70];
          int v17 = v10[71];
          uint64_t v18 = (uint64_t)v10 + 9;
          LODWORD(v10) = *((unsigned __int8 *)v10 + 8);
          *(_DWORD *)buf = 136318210;
          uint64_t v32 = v8;
          __int16 v33 = 2080;
          uint64_t v34 = "TracePrintNodes";
          __int16 v35 = 1024;
          int v36 = 2389;
          __int16 v37 = 1024;
          int v38 = v5;
          __int16 v39 = 1024;
          int v40 = v11;
          __int16 v41 = 1024;
          int v42 = v12;
          __int16 v43 = 1024;
          int v44 = v13;
          __int16 v45 = 1024;
          int v46 = v14;
          __int16 v47 = 1024;
          int v48 = v15;
          __int16 v49 = 1024;
          int v50 = v16;
          __int16 v51 = 1024;
          int v52 = v17;
          __int16 v53 = 2080;
          uint64_t v54 = v18;
          __int16 v55 = 1024;
          int v56 = (int)v10;
          _os_log_impl(&dword_221563000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %d: %08X Next[%08X], dist[%u], SN[%u], New[%d], From[%08X], #NEIGHBOR[%d] \"%s\"[%u]\n", buf, 0x5Cu);
        }
      }
      uint64_t v19 = a2 + 480 * v5;
      if (*(int *)(v19 + 284) >= 1)
      {
        uint64_t v20 = 0;
        char v21 = (int *)(v19 + 284);
        uint64_t v22 = v6;
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
          {
            uint64_t v23 = VRTraceErrorLogLevelToCSTR();
            int v24 = *MEMORY[0x263F21098];
            uint64_t v25 = *MEMORY[0x263F21098];
            if (*v7)
            {
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                int v26 = *(v22 - 1);
                int v27 = *v22;
                *(_DWORD *)buf = 136316162;
                uint64_t v32 = v23;
                __int16 v33 = 2080;
                uint64_t v34 = "TracePrintNodes";
                __int16 v35 = 1024;
                int v36 = 2392;
                __int16 v37 = 1024;
                int v38 = v26;
                __int16 v39 = 1024;
                int v40 = v27;
                _os_log_impl(&dword_221563000, v24, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d     %08X, RTT[%u]", buf, 0x28u);
              }
            }
            else if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            {
              int v28 = *(v22 - 1);
              int v29 = *v22;
              *(_DWORD *)buf = 136316162;
              uint64_t v32 = v23;
              __int16 v33 = 2080;
              uint64_t v34 = "TracePrintNodes";
              __int16 v35 = 1024;
              int v36 = 2392;
              __int16 v37 = 1024;
              int v38 = v28;
              __int16 v39 = 1024;
              int v40 = v29;
              _os_log_debug_impl(&dword_221563000, v24, OS_LOG_TYPE_DEBUG, " [%s] %s:%d     %08X, RTT[%u]", buf, 0x28u);
            }
          }
          ++v20;
          v22 += 3;
        }
        while (v20 < *v21);
      }
      ++v5;
      v6 += 120;
    }
    while (v5 != a1);
  }
}

uint64_t isInNeighbor(uint64_t a1, int a2, int a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (a2 < 1)
  {
    char v14 = 0;
  }
  else
  {
    uint64_t v4 = 0;
    char v14 = 0;
    uint64_t v16 = a2;
    uint64_t v5 = (int *)(a1 + 288);
    uint64_t v15 = a1;
    do
    {
      uint64_t v6 = a1 + 480 * v4;
      if (*(int *)(v6 + 284) >= 1)
      {
        uint64_t v7 = 0;
        uint64_t v8 = (int *)(v6 + 284);
        uint64_t v9 = v5;
        while (*v9 != a3)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v10 = VRTraceErrorLogLevelToCSTR();
            int v11 = *MEMORY[0x263F21098];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
            {
              int v12 = *v9;
              *(_DWORD *)buf = 136315906;
              uint64_t v18 = v10;
              __int16 v19 = 2080;
              uint64_t v20 = "isInNeighbor";
              __int16 v21 = 1024;
              int v22 = 2652;
              __int16 v23 = 1024;
              int v24 = v12;
              _os_log_impl(&dword_221563000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Neighbor %08X", buf, 0x22u);
            }
          }
          ++v7;
          v9 += 3;
          if (v7 >= *v8) {
            goto LABEL_12;
          }
        }
        char v14 = 1;
LABEL_12:
        a1 = v15;
      }
      ++v4;
      v5 += 120;
    }
    while (v4 != v16);
  }
  return v14 & 1;
}

void gckSessionFindShortestPath(int a1, _DWORD *a2)
{
  v35[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = a1;
  int v5 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v7 = (char *)v35 - v6;
  uint64_t v8 = 4 * v4;
  if (v5)
  {
    uint64_t v9 = memset((char *)v35 - v6, 170, 4 * v4);
    MEMORY[0x270FA5388](v9);
    uint64_t v10 = (char *)v35 - ((v8 + 15) & 0x7FFFFFFF0);
    int v11 = memset(v10, 170, 4 * v4);
    MEMORY[0x270FA5388](v11);
    int v12 = v10;
    memset(v10, 170, 4 * v4);
  }
  else
  {
    uint64_t v13 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
    uint64_t v10 = (char *)v35 - ((v8 + 15) & 0x7FFFFFFF0);
    MEMORY[0x270FA5388](v13);
    int v12 = (_DWORD *)((char *)v35 - v14);
  }
  memset(v12, 255, 4 * a1);
  memset(v7, 255, 4 * a1);
  bzero(v10, 4 * a1);
  *int v12 = 0;
  if (a1 >= 1)
  {
    uint64_t v15 = 0;
    unsigned int v16 = -1;
    for (int i = -1; ; int i = -1)
    {
      do
      {
        if (!*(_DWORD *)&v10[4 * v15] && v12[v15] < v16)
        {
          int i = v15;
          unsigned int v16 = v12[v15];
        }
        ++v15;
      }
      while (v15 != v4);
      if (i == -1) {
        break;
      }
      *(_DWORD *)&v10[4 * i] = 1;
      uint64_t v18 = &a2[120 * i];
      uint64_t v19 = v18[71];
      if ((int)v19 >= 1)
      {
        uint64_t v20 = 0;
        __int16 v21 = v18 + 72;
        do
        {
          uint64_t v22 = 0;
          __int16 v23 = a2;
          while (*v23 != v21[3 * v20])
          {
            v23 += 120;
            if (v4 == ++v22) {
              goto LABEL_19;
            }
          }
          if (v22 != a1 && !*(_DWORD *)&v10[4 * v22])
          {
            int v24 = v21[3 * v20 + 1];
            if (v24 != -1)
            {
              unsigned int v25 = v24 + v16;
              if (v25 < v12[v22])
              {
                v12[v22] = v25;
                *(_DWORD *)&v7[4 * v22] = i;
              }
            }
          }
LABEL_19:
          ++v20;
        }
        while (v20 != v19);
      }
      uint64_t v15 = 0;
      unsigned int v16 = -1;
    }
  }
  uint64_t v26 = a2[71];
  if ((int)v26 >= 1)
  {
    uint64_t v27 = 0;
    int v28 = a2 + 72;
    do
    {
      if (a1 < 1)
      {
        LODWORD(v29) = 0;
      }
      else
      {
        uint64_t v29 = 0;
        uint64_t v30 = a2;
        while (*v30 != v28[3 * v27])
        {
          v30 += 120;
          if (v4 == ++v29) {
            goto LABEL_36;
          }
        }
      }
      if (v29 != a1 && v28[3 * v27 + 1] != -1) {
        *(_DWORD *)&v7[4 * v29] = 0;
      }
LABEL_36:
      ++v27;
    }
    while (v27 != v26);
  }
  if (a1 > 1)
  {
    uint64_t v31 = 1;
    do
    {
      int v32 = v31;
      while (1)
      {
        int v33 = v32;
        int v32 = *(_DWORD *)&v7[4 * v32];
        if (v32 == -1) {
          break;
        }
        if (!v32)
        {
          a2[120 * v31 + 1] = a2[120 * v33];
          int v34 = v12[v31];
          goto LABEL_44;
        }
      }
      int v34 = -1;
      a2[120 * v31 + 1] = -1;
LABEL_44:
      a2[120 * v31++ + 67] = v34;
    }
    while (v31 != v4);
  }
}

void gckSessionSendLSA(uint64_t a1, int a2, void *a3, int a4, int a5)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  memset(v36, 170, 32);
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  int v11 = (os_log_t *)MEMORY[0x263F21098];
  if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    uint64_t v13 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v14 = *(_DWORD *)(a1 + 400);
      *(_DWORD *)buf = 136315906;
      uint64_t v38 = v12;
      __int16 v39 = 2080;
      int v40 = "gckSessionSendLSA";
      __int16 v41 = 1024;
      int v42 = 1830;
      __int16 v43 = 1024;
      unsigned int v44 = v14;
      _os_log_impl(&dword_221563000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Sending LSA to %2d neighbors", buf, 0x22u);
    }
  }
  LODWORD(v36[3]) = a2;
  v36[4] = a3;
  if (*(int *)(a1 + 400) >= 1)
  {
    uint64_t v15 = 0;
    int v35 = a5;
    do
    {
      unsigned int v16 = *(_DWORD *)(a1 + 12 * v15 + 404);
      if (v16 != a4)
      {
        __int16 v17 = *(_WORD *)(a1 + 20);
        *(_WORD *)(a1 + 20) = v17 + 1;
        WORD2(v36[2]) = v17;
        int v18 = OSPFMakeLSA((Bytef **)v36, (uint64_t)&v36[1], 0, *(_DWORD *)(a1 + 108), v16, 0);
        if ((v18 & 0x80000000) == 0)
        {
          uint64_t v19 = *(void *)(a1 + 7888);
          if (!v19) {
            goto LABEL_25;
          }
          int v20 = v18;
          while (v16 != *(_DWORD *)(v19 + 116) || *(_DWORD *)(v19 + 108))
          {
            uint64_t v19 = *(void *)(v19 + 728);
            if (!v19) {
              goto LABEL_25;
            }
          }
          if (!*(_DWORD *)(v19 + 88) && a5 == 0)
          {
LABEL_25:
            free(v36[0]);
          }
          else
          {
            uint64_t v22 = v11;
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v23 = VRTraceErrorLogLevelToCSTR();
              int v24 = *v11;
              if (os_log_type_enabled(*v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315906;
                uint64_t v38 = v23;
                __int16 v39 = 2080;
                int v40 = "gckSessionSendLSA";
                __int16 v41 = 1024;
                int v42 = 1857;
                __int16 v43 = 1024;
                unsigned int v44 = v16;
                _os_log_impl(&dword_221563000, v24, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Sending LSA to [%08X]", buf, 0x22u);
              }
            }
            unsigned int v25 = (pthread_mutex_t *)(v19 + 664);
            pthread_mutex_lock((pthread_mutex_t *)(v19 + 664));
            uint64_t v26 = (void *)(v19 + 496);
            do
            {
              uint64_t v27 = v26;
              uint64_t v28 = *v26;
              uint64_t v26 = (void *)(*v26 + 64);
            }
            while (v28);
            uint64_t v29 = (char *)malloc_type_calloc(1uLL, 0x48uLL, 0x10200409EACE7F9uLL);
            *uint64_t v29 = 4;
            *(_OWORD *)(v29 + 8) = xmmword_2215E8980;
            uint64_t v30 = v36[0];
            *((void *)v29 + 4) = 0x4082BFEB851EB852;
            *((void *)v29 + 5) = v30;
            *((_DWORD *)v29 + 12) = v20;
            *((_DWORD *)v29 + 13) = v16;
            *((_WORD *)v29 + 28) = WORD2(v36[2]);
            *uint64_t v27 = v29;
            pthread_mutex_unlock(v25);
            int v31 = *(_DWORD *)(a1 + 12);
            int v11 = v22;
            a5 = v35;
            if (v31 != -1)
            {
              *(_DWORD *)(a1 + 12) = -1;
              close(v31);
            }
          }
        }
      }
      ++v15;
    }
    while (v15 < *(int *)(a1 + 400));
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v32 = VRTraceErrorLogLevelToCSTR();
    int v33 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v34 = *(_DWORD *)(a1 + 108);
      *(_DWORD *)buf = 136315906;
      uint64_t v38 = v32;
      __int16 v39 = 2080;
      int v40 = "gckSessionSendLSA";
      __int16 v41 = 1024;
      int v42 = 1894;
      __int16 v43 = 1024;
      unsigned int v44 = v34;
      _os_log_impl(&dword_221563000, v33, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d I am %08X ========= After sending all LSAs...", buf, 0x22u);
    }
  }
  TracePrintNodes(*(_DWORD *)(a1 + 112), a1 + 116);
}

void gckSessionCleanupNodes(uint64_t a1, int a2, int a3)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  LODWORD(v5) = *(_DWORD *)(a1 + 112);
  if ((int)v5 < 1) {
    goto LABEL_42;
  }
  int v6 = 0;
  int v44 = 0;
  int v7 = a3 ? -2145779689 : 0;
  int v43 = v7;
  do
  {
    uint64_t v8 = a1 + 480 * v6;
    if (*(_DWORD *)(v8 + 120) == -1)
    {
      uint64_t v9 = (int *)(v8 + 116);
      int v10 = *(_DWORD *)(a1 + 400);
      if (v10 >= 1)
      {
        for (int i = 0; i < v10; ++i)
        {
          uint64_t v12 = a1 + 12 * i;
          if (*(_DWORD *)(v12 + 404) == *v9)
          {
            memmove((void *)(v12 + 404), (const void *)(a1 + 12 * i + 416), 12 * (v10 + ~i));
            int v10 = *(_DWORD *)(a1 + 400) - 1;
            *(_DWORD *)(a1 + 400) = v10;
            --i;
          }
        }
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        unsigned int v14 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          int v15 = *v9;
          *(_DWORD *)buf = 136316162;
          uint64_t v47 = v13;
          __int16 v48 = 2080;
          __int16 v49 = "gckSessionCleanupNodes";
          __int16 v50 = 1024;
          int v51 = 1320;
          __int16 v52 = 2080;
          uint64_t v53 = a1 + 480 * v6 + 125;
          __int16 v54 = 1024;
          int v55 = v15;
          _os_log_impl(&dword_221563000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Disconnected from \"%s\"[%08X]", buf, 0x2Cu);
        }
      }
      uint64_t v16 = *(void *)(a1 + 96);
      uint64_t v17 = *(unsigned int *)(v16 + 168);
      int v18 = *v9;
      if ((int)v17 < 1)
      {
        LODWORD(v19) = 0;
      }
      else
      {
        uint64_t v19 = 0;
        while (*(_DWORD *)(v16 + 172 + 4 * v19) != v18)
        {
          if (v17 == ++v19)
          {
            LODWORD(v19) = *(_DWORD *)(v16 + 168);
            break;
          }
        }
      }
      if (v19 <= 0xF && v19 == v17)
      {
        *(_DWORD *)(v16 + 4 * v17 + 172) = v18;
        *(_DWORD *)(v16 + 168) = v17 + 1;
        int v18 = *v9;
      }
      PostEventCallback(v16, v18, 3, (const void *)(a1 + 480 * v6 + 125), *(unsigned __int8 *)(a1 + 480 * v6 + 124), v43);
      int v20 = v44;
      if (*v9 == a2) {
        int v20 = 1;
      }
      int v44 = v20;
      for (uint64_t j = *(void *)(a1 + 7888); j; uint64_t j = *(void *)(j + 728))
      {
        if (*(_DWORD *)(j + 116) == *v9)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v22 = VRTraceErrorLogLevelToCSTR();
            uint64_t v23 = *MEMORY[0x263F21098];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
            {
              int v24 = *(_DWORD *)(j + 116);
              *(_DWORD *)buf = 136315906;
              uint64_t v47 = v22;
              __int16 v48 = 2080;
              __int16 v49 = "gckSessionCleanupNodes";
              __int16 v50 = 1024;
              int v51 = 1357;
              __int16 v52 = 1024;
              LODWORD(v53) = v24;
              _os_log_impl(&dword_221563000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckSessionCleanupNodes closing invalid (%08X)", buf, 0x22u);
            }
          }
          *(_DWORD *)(j + 84) = 1;
          if (a3)
          {
            *(double *)(j + 24) = micro();
            if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
            {
              uint64_t v25 = VRTraceErrorLogLevelToCSTR();
              uint64_t v26 = *MEMORY[0x263F21098];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                uint64_t v47 = v25;
                __int16 v48 = 2080;
                __int16 v49 = "gckSessionCleanupNodes";
                __int16 v50 = 1024;
                int v51 = 1362;
                _os_log_impl(&dword_221563000, v26, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckSessionCleanupNodes: timed out, enforcing clean up", buf, 0x1Cu);
              }
            }
          }
        }
      }
      memmove(v9, (const void *)(a1 + 480 * v6 + 596), 480 * (*(_DWORD *)(a1 + 112) + ~v6));
      LODWORD(v5) = *(_DWORD *)(a1 + 112) - 1;
      *(_DWORD *)(a1 + 112) = v5;
      --v6;
    }
    ++v6;
  }
  while (v6 < (int)v5);
  if ((int)v5 >= 1)
  {
    uint64_t v5 = v5;
    uint64_t v27 = (_DWORD *)(a1 + 392);
    do
    {
      *uint64_t v27 = 0;
      v27 += 120;
      --v5;
    }
    while (v5);
  }
  if (!v44)
  {
LABEL_42:
    uint64_t v28 = *(void *)(a1 + 7888);
    if (v28)
    {
      int v29 = 0;
      if (a3) {
        int v30 = -2145779689;
      }
      else {
        int v30 = 0;
      }
      do
      {
        if (*(_DWORD *)(v28 + 116) == a2)
        {
          if (!v29)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
            {
              uint64_t v31 = VRTraceErrorLogLevelToCSTR();
              uint64_t v32 = *MEMORY[0x263F21098];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
              {
                int v33 = *(_DWORD *)(v28 + 116);
                *(_DWORD *)buf = 136316162;
                uint64_t v47 = v31;
                __int16 v48 = 2080;
                __int16 v49 = "gckSessionCleanupNodes";
                __int16 v50 = 1024;
                int v51 = 1384;
                __int16 v52 = 2080;
                uint64_t v53 = v28 + 120;
                __int16 v54 = 1024;
                int v55 = v33;
                _os_log_impl(&dword_221563000, v32, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Disconnected from \"%s\"[%08X]", buf, 0x2Cu);
              }
            }
            uint64_t v34 = *(void *)(a1 + 96);
            uint64_t v35 = *(unsigned int *)(v34 + 168);
            int v36 = *(_DWORD *)(v28 + 116);
            if ((int)v35 < 1)
            {
              LODWORD(v37) = 0;
            }
            else
            {
              uint64_t v37 = 0;
              while (*(_DWORD *)(v34 + 172 + 4 * v37) != v36)
              {
                if (v35 == ++v37)
                {
                  LODWORD(v37) = *(_DWORD *)(v34 + 168);
                  break;
                }
              }
            }
            if (v37 <= 0xF && v37 == v35)
            {
              *(_DWORD *)(v34 + 4 * v35 + 172) = v36;
              *(_DWORD *)(v34 + 168) = v35 + 1;
              int v36 = *(_DWORD *)(v28 + 116);
            }
            PostEventCallback(v34, v36, 3, (const void *)(v28 + 120), *(_DWORD *)(v28 + 376), v30);
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v38 = VRTraceErrorLogLevelToCSTR();
            __int16 v39 = *MEMORY[0x263F21098];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
            {
              int v40 = *(_DWORD *)(v28 + 116);
              *(_DWORD *)buf = 136315906;
              uint64_t v47 = v38;
              __int16 v48 = 2080;
              __int16 v49 = "gckSessionCleanupNodes";
              __int16 v50 = 1024;
              int v51 = 1416;
              __int16 v52 = 1024;
              LODWORD(v53) = v40;
              _os_log_impl(&dword_221563000, v39, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckSessionCleanupNodes closing disconnectID (%d)", buf, 0x22u);
            }
          }
          int v29 = 1;
          *(_DWORD *)(v28 + 84) = 1;
          if (a3)
          {
            *(double *)(v28 + 24) = micro();
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v41 = VRTraceErrorLogLevelToCSTR();
              int v42 = *MEMORY[0x263F21098];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                uint64_t v47 = v41;
                __int16 v48 = 2080;
                __int16 v49 = "gckSessionCleanupNodes";
                __int16 v50 = 1024;
                int v51 = 1421;
                _os_log_impl(&dword_221563000, v42, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckSessionCleanupNodes: timed out, enforcing clean up", buf, 0x1Cu);
              }
            }
            int v29 = 1;
          }
        }
        uint64_t v28 = *(void *)(v28 + 728);
      }
      while (v28);
    }
  }
}

uint64_t BWE_EndCurrentSequence(uint64_t result)
{
  uint64_t v1 = (unsigned char *)(result + 8464);
  uint64_t v2 = *(void *)(result + 7888);
  if (v2)
  {
    while (*(_DWORD *)(v2 + 116) != *(_DWORD *)(result + 8468) || *(_DWORD *)(v2 + 100) != *(_DWORD *)(result + 8472))
    {
      uint64_t v2 = *(void *)(v2 + 728);
      if (!v2) {
        goto LABEL_5;
      }
    }
    uint64_t result = *(void *)(v2 + 736);
    if (result != 0xFFFFFFFFLL) {
      GCK_BWE_CalcRxEstimate();
    }
  }
LABEL_5:
  unsigned char *v1 = 0;
  return result;
}

void __gckSessionRecvTCPMessage_block_invoke()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v0 = VRTraceErrorLogLevelToCSTR();
    uint64_t v1 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v2 = 136315650;
      uint64_t v3 = v0;
      __int16 v4 = 2080;
      uint64_t v5 = "gckSessionRecvTCPMessage_block_invoke";
      __int16 v6 = 1024;
      int v7 = 3179;
      _os_log_impl(&dword_221563000, v1, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckSessionRecvTCPMessage: optionHandler invoked...", (uint8_t *)&v2, 0x1Cu);
    }
  }
}

void gckNetworkMonitorCallback()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v0 = VRTraceErrorLogLevelToCSTR();
    uint64_t v1 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v3 = v0;
      __int16 v4 = 2080;
      uint64_t v5 = "gckNetworkMonitorCallback";
      __int16 v6 = 1024;
      int v7 = 5500;
      _os_log_impl(&dword_221563000, v1, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckNetworkMonitorCallback: ...", buf, 0x1Cu);
    }
  }
  CheckInHandleDebug();
}

void gckDisplayNetworkState(uint64_t a1)
{
  values[2] = *(void **)MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 8296);
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v2)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v40 = v4;
        __int16 v41 = 2080;
        int v42 = "gckDisplayNetworkState";
        __int16 v43 = 1024;
        int v44 = 1438;
        _os_log_impl(&dword_221563000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckDisplayNetworkState: ...", buf, 0x1Cu);
      }
    }
    CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFStringRef v7 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], "State:/Network/Interface/[^/]+/Link", 0x8000100u);
    CFStringRef v8 = CFStringCreateWithCString(v6, "State:/Network/Interface/[^/]+/IPv4", 0x8000100u);
    values[0] = (void *)v7;
    values[1] = (void *)v8;
    CFArrayRef v9 = CFArrayCreate(v6, (const void **)values, 2, MEMORY[0x263EFFF70]);
    CFDictionaryRef v10 = SCDynamicStoreCopyMultiple(*(SCDynamicStoreRef *)(a1 + 8296), 0, v9);
    if (v10)
    {
      CFDictionaryRef v11 = v10;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        uint64_t v13 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v40 = v12;
          __int16 v41 = 2080;
          int v42 = "gckDisplayNetworkState";
          __int16 v43 = 1024;
          int v44 = 1453;
          _os_log_impl(&dword_221563000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d first SCDynamicStoreCopyMultiple succeeded", buf, 0x1Cu);
        }
      }
      CFIndex Count = CFDictionaryGetCount(v11);
      if (Count)
      {
        uint64_t v15 = Count;
        CFArrayRef v35 = v9;
        CFStringRef v36 = v8;
        CFStringRef v37 = v7;
        uint64_t v34 = (uint64_t)&v34;
        size_t v16 = 8 * Count;
        MEMORY[0x270FA5388](Count);
        uint64_t v17 = (char *)&v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
        int v18 = memset(v17, 170, v16);
        MEMORY[0x270FA5388](v18);
        memset(v17, 170, v16);
        CFDictionaryGetKeysAndValues(v11, (const void **)v17, (const void **)v17);
        if (v15 >= 1)
        {
          uint64_t v20 = 0;
          *(void *)&long long v19 = 136316162;
          long long v38 = v19;
          do
          {
            CFStringRef v21 = *(const __CFString **)&v17[8 * v20];
            if (v21)
            {
              CFIndex Length = CFStringGetLength(*(CFStringRef *)&v17[8 * v20]);
              CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
              uint64_t v24 = MEMORY[0x270FA5388](MaximumSizeForEncoding);
              uint64_t v26 = (char *)&v34 - v25;
              if (v24) {
                memset((char *)&v34 - v25, 170, MaximumSizeForEncoding);
              }
              CStringPtr = CFStringGetCStringPtr(v21, 0x8000100u);
              if (!CStringPtr)
              {
                if (CFStringGetCString(v21, v26, MaximumSizeForEncoding, 0x8000100u)) {
                  CStringPtr = v26;
                }
                else {
                  CStringPtr = 0;
                }
              }
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                uint64_t v28 = VRTraceErrorLogLevelToCSTR();
                int v29 = *MEMORY[0x263F21098];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = v38;
                  uint64_t v40 = v28;
                  __int16 v41 = 2080;
                  int v42 = "gckDisplayNetworkState";
                  __int16 v43 = 1024;
                  int v44 = 1482;
                  __int16 v45 = 1024;
                  LODWORD(v46[0]) = v20;
                  WORD2(v46[0]) = 2080;
                  *(void *)((char *)v46 + 6) = CStringPtr;
                  _os_log_impl(&dword_221563000, v29, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d key[%d] == %s", buf, 0x2Cu);
                }
              }
            }
            else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v30 = VRTraceErrorLogLevelToCSTR();
              uint64_t v31 = *MEMORY[0x263F21098];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v38;
                uint64_t v40 = v30;
                __int16 v41 = 2080;
                int v42 = "gckDisplayNetworkState";
                __int16 v43 = 1024;
                int v44 = 1484;
                __int16 v45 = 1024;
                LODWORD(v46[0]) = v20;
                WORD2(v46[0]) = 2080;
                *(void *)((char *)v46 + 6) = "NULL";
                _os_log_impl(&dword_221563000, v31, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d key[%d] == %s", buf, 0x2Cu);
              }
            }
            ++v20;
          }
          while (v15 != v20);
        }
        CFArrayRef v9 = v35;
        CFStringRef v8 = v36;
        CFStringRef v7 = v37;
      }
      CFRelease(v11);
    }
    CFRelease(v8);
    CFRelease(v7);
    CFRelease(v9);
  }
  else if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v32 = VRTraceErrorLogLevelToCSTR();
    int v33 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v40 = v32;
      __int16 v41 = 2080;
      int v42 = "gckDisplayNetworkState";
      __int16 v43 = 1024;
      int v44 = 1499;
      __int16 v45 = 2048;
      v46[0] = a1;
      _os_log_impl(&dword_221563000, v33, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gckDisplayNetworkState: error %p", buf, 0x26u);
    }
  }
}

void freeOptionsList(uint64_t *a1)
{
  for (uint64_t i = *a1; *a1; uint64_t i = *a1)
  {
    *a1 = *(void *)(i + 8);
    *(void *)(i + 8) = 0;
    if (*(void *)i) {
      free(*(void **)i);
    }
    free((void *)i);
  }
}

void sub_2215922C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9, int a10, __int16 a11, __int16 a12, long long a13, uint64_t a14)
{
  if (a2 == 1)
  {
    id v15 = objc_begin_catch(exception_object);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      uint64_t v17 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR))
      {
        Name = sel_getName(v14);
        uint64_t v19 = objc_msgSend((id)objc_msgSend(v15, "description"), "UTF8String");
        LODWORD(a9) = 136316162;
        *(void *)((char *)&a9 + 4) = v16;
        WORD6(a9) = 2080;
        *(void *)((char *)&a9 + 14) = "+[GKConnection externalAddressForSelfConnectionData:]";
        a12 = 1024;
        LODWORD(a13) = 357;
        WORD2(a13) = 2080;
        *(void *)((char *)&a13 + 6) = Name;
        HIWORD(a13) = 2080;
        a14 = v19;
        _os_log_error_impl(&dword_221563000, v17, OS_LOG_TYPE_ERROR, " [%s] %s:%d +[GKConnection %s]: Exception thrown: %s", (uint8_t *)&a9, 0x30u);
      }
    }
    objc_end_catch();
    JUMPOUT(0x221592294);
  }
  _Unwind_Resume(exception_object);
}

void sub_221592430(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9, int a10, __int16 a11, __int16 a12, long long a13, uint64_t a14)
{
  if (a2 == 1)
  {
    id v15 = objc_begin_catch(exception_object);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      uint64_t v17 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR))
      {
        Name = sel_getName(v14);
        uint64_t v19 = objc_msgSend((id)objc_msgSend(v15, "description"), "UTF8String");
        LODWORD(a9) = 136316162;
        *(void *)((char *)&a9 + 4) = v16;
        WORD6(a9) = 2080;
        *(void *)((char *)&a9 + 14) = "+[GKConnection externalAddressForCDXSelfConnectionData:]";
        a12 = 1024;
        LODWORD(a13) = 367;
        WORD2(a13) = 2080;
        *(void *)((char *)&a13 + 6) = Name;
        HIWORD(a13) = 2080;
        a14 = v19;
        _os_log_error_impl(&dword_221563000, v17, OS_LOG_TYPE_ERROR, " [%s] %s:%d +[GKConnection %s]: Exception thrown: %s", (uint8_t *)&a9, 0x30u);
      }
    }
    objc_end_catch();
    JUMPOUT(0x221592400);
  }
  _Unwind_Resume(exception_object);
}

void GCKEventListenerForGKConnection(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    CFStringRef v7 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315650;
      uint64_t v10 = v6;
      __int16 v11 = 2080;
      uint64_t v12 = "GCKEventListenerForGKConnection";
      __int16 v13 = 1024;
      int v14 = 158;
      _os_log_impl(&dword_221563000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKEventListenerForGKConnection", (uint8_t *)&v9, 0x1Cu);
    }
  }
  id v8 = objc_alloc_init(MEMORY[0x263F086B0]);
  [a1 addEvent:a3 remotePeer:a2];
}

void sub_221594C28(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221595784(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221596070(_Unwind_Exception *exception_object)
{
}

void sub_221596424(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_221597EB0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221597F44(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22159824C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
}

void sub_221598674(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221598A24(_Unwind_Exception *exception_object)
{
}

void sub_2215990D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221599628(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_221599D7C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

dispatch_object_t dispatch_value_callback_retain(int a1, dispatch_object_t object)
{
  return object;
}

void dispatch_value_callback_release(int a1, dispatch_object_t object)
{
}

id GCKGameConnectivityKitBundle()
{
  id result = (id)GCKGameConnectivityKitBundle_cachedBundle;
  if (!GCKGameConnectivityKitBundle_cachedBundle)
  {
    id result = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    GCKGameConnectivityKitBundle_cachedBundle = (uint64_t)result;
  }
  return result;
}

void AGPNetworkEventListener(void *a1, uint64_t a2, long long *a3)
{
  id v5 = objc_alloc_init(MEMORY[0x263F086B0]);
  id v6 = a1;
  if (*(_DWORD *)a3 != 5)
  {
    if (*(_DWORD *)a3 == 7)
    {
      long long v9 = *a3;
      uint64_t v10 = *((void *)a3 + 2);
      CFStringRef v7 = objc_alloc_init(GCKOOBMessage);
      v7->type = 1000;
      v7->band = *((_DWORD *)a3 + 5);
      v7->data = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x263EFF8F8]), "initWithBytes:length:", *((void *)a3 + 1), *((int *)a3 + 4), v9, v10);
      id v8 = (void *)[MEMORY[0x263F08910] archivedDataWithRootObject:v7 requiringSecureCoding:0 error:0];
      [v8 length];
      [v8 bytes];
      [a1 agpSessionRef];
      AGPSessionEvent();
    }
    [a1 agpSessionRef];
    AGPSessionEvent();
  }
}

void GKNetworkEventListener(void *a1, uint64_t a2, long long *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = objc_alloc_init(MEMORY[0x263F086B0]);
  long long v21 = *a3;
  uint64_t v22 = *((void *)a3 + 2);
  if (*(_DWORD *)a3 == 6)
  {
    HIDWORD(v22) = 0;
    uint64_t v7 = [MEMORY[0x263EFF8F8] dataWithBytes:*((void *)a3 + 1) length:*((int *)a3 + 4)];
    if (!v7) {
      goto LABEL_18;
    }
    uint64_t v8 = v7;
    long long v9 = (void *)MEMORY[0x263EFFA08];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0, v21, v22);
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v8 error:0];
    __int16 v13 = (id)[v12 decodeObjectOfClasses:v11 forKey:*MEMORY[0x263F081D0]];
    [v12 finishDecoding];

    if (!v13) {
      goto LABEL_13;
    }
    int v14 = (objc_class *)objc_opt_class();
    if (v14 == objc_getClass("GCKOOBMessage") && [v13 data])
    {
      if (v13[2] == 1000)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v16 = VRTraceErrorLogLevelToCSTR();
          uint64_t v17 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            uint64_t v24 = v16;
            __int16 v25 = 2080;
            uint64_t v26 = "GKNetworkEventListener";
            __int16 v27 = 1024;
            int v28 = 1420;
            _os_log_impl(&dword_221563000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNetworkEventListener: received oobMessage of type GCKOOBInternal", buf, 0x1Cu);
          }
        }
        LODWORD(v22) = objc_msgSend((id)objc_msgSend(v13, "data"), "length");
        *((void *)&v21 + 1) = objc_msgSend((id)objc_msgSend(v13, "data"), "bytes");
        HIDWORD(v22) = [v13 band];
LABEL_13:
        int v15 = 1;
        goto LABEL_14;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v18 = VRTraceErrorLogLevelToCSTR();
        uint64_t v19 = *MEMORY[0x263F21098];
        BOOL v20 = os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT);
        int v15 = 0;
        if (!v20)
        {
LABEL_14:
          if (!v15) {
            goto LABEL_16;
          }
          goto LABEL_15;
        }
        *(_DWORD *)buf = 136315650;
        uint64_t v24 = v18;
        __int16 v25 = 2080;
        uint64_t v26 = "GKNetworkEventListener";
        __int16 v27 = 1024;
        int v28 = 1428;
        _os_log_impl(&dword_221563000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNetworkEventListener: received oobMessage w/unrecognized type...", buf, 0x1Cu);
      }
    }
    int v15 = 0;
    goto LABEL_14;
  }
  __int16 v13 = 0;
LABEL_15:
  [a1 sendCallbacksToDelegate:&v21 remotePeer:a2];
LABEL_16:
  if (v13) {

  }
LABEL_18:
}

void sub_2215A5A18(_Unwind_Exception *exception_object)
{
  if (v1) {
    objc_end_catch();
  }
  _Unwind_Resume(exception_object);
}

void sub_2215A5A50(void *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, long long buf, int a16, __int16 a17, __int16 a18, int a19)
{
  if (a2)
  {
    if (a2 == 2)
    {
      objc_begin_catch(a1);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v19 = VRTraceErrorLogLevelToCSTR();
        BOOL v20 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 136315650;
          *(void *)((char *)&buf + 4) = v19;
          WORD6(buf) = 2080;
          *(void *)((char *)&buf + 14) = "GKNetworkEventListener";
          a18 = 1024;
          a19 = 1407;
          _os_log_impl(&dword_221563000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKNetworkEventListener: received oob event with unrecognized message archive...", (uint8_t *)&buf, 0x1Cu);
        }
      }
      objc_end_catch();
    }
    else
    {
      objc_begin_catch(a1);
    }
    JUMPOUT(0x2215A57FCLL);
  }
  JUMPOUT(0x2215A5A48);
}

id NSStringCreateTruncatedStringWithMaxBytesInUTF8Encoding(void *a1)
{
  int v1 = (const char *)[a1 UTF8String];
  if ((int)strlen(v1) >= 41)
  {
    uint64_t v3 = 40;
    do
      int v4 = v1[v3--] & 0xC0;
    while (v4 == 128);
    id v5 = [NSString alloc];
    return (id)[v5 initWithBytes:v1 length:v3 + 1 encoding:4];
  }
  else
  {
    return a1;
  }
}

uint64_t gkResolveCallback(uint64_t a1, int a2, uint64_t a3, int a4, const char *a5, const char *a6, unsigned int a7, uint64_t a8, uint64_t a9, void *a10)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  uint64_t v18 = (os_log_t *)MEMORY[0x263F21098];
  unsigned int v27 = __rev16(a7);
  if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v19 = VRTraceErrorLogLevelToCSTR();
    BOOL v20 = *v18;
    if (os_log_type_enabled(*v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136317698;
      uint64_t v30 = v19;
      __int16 v31 = 2080;
      uint64_t v32 = "gkResolveCallback";
      __int16 v33 = 1024;
      int v34 = 4442;
      __int16 v35 = 1024;
      *(_DWORD *)CFStringRef v36 = a1;
      *(_WORD *)&v36[4] = 1024;
      *(_DWORD *)&v36[6] = a2;
      LOWORD(v37) = 1024;
      *(_DWORD *)((char *)&v37 + 2) = a3;
      HIWORD(v37) = 1024;
      *(_DWORD *)long long v38 = a4;
      *(_WORD *)&v38[4] = 2080;
      __int16 v39 = a5;
      __int16 v40 = 2080;
      __int16 v41 = a6;
      __int16 v42 = 1024;
      unsigned int v43 = v27;
      __int16 v44 = 1024;
      int v45 = a8;
      _os_log_impl(&dword_221563000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ~ DNSServiceResolve callback: Ref=%x, Flags=%x, IFIndex=%d, ErrorType=%d fullname=%s hosttarget=%s port=%u txtLen=%u", buf, 0x54u);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v21 = VRTraceErrorLogLevelToCSTR();
    uint64_t v22 = *v18;
    if (os_log_type_enabled(*v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = "null";
      *(_DWORD *)buf = 136316674;
      if (a5) {
        uint64_t v24 = a5;
      }
      else {
        uint64_t v24 = "null";
      }
      uint64_t v30 = v21;
      __int16 v31 = 2080;
      uint64_t v32 = "gkResolveCallback";
      if (a6) {
        uint64_t v23 = a6;
      }
      __int16 v33 = 1024;
      int v34 = 4444;
      __int16 v35 = 2080;
      *(void *)CFStringRef v36 = v24;
      *(_WORD *)&v36[8] = 2080;
      CFStringRef v37 = v23;
      *(_WORD *)long long v38 = 1024;
      *(_DWORD *)&void v38[2] = v27;
      LOWORD(v39) = 1024;
      *(_DWORD *)((char *)&v39 + 2) = a4;
      _os_log_impl(&dword_221563000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ************* fullname: %s, hosttarget: %s port: %u error: %d", buf, 0x3Cu);
    }
  }
  BYTE4(v26) = a2 & 1;
  LODWORD(v26) = a4;
  return objc_msgSend((id)objc_msgSend(a10, "session"), "didResolveService:forPeer:hostName:port:interface:txtLen:txtRecord:withError:moreComing:", a1, a10, a6, v27, a3, a8, a9, v26);
}

uint64_t gkRegisterCallback(int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    int v15 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136317186;
      uint64_t v18 = v14;
      __int16 v19 = 2080;
      BOOL v20 = "gkRegisterCallback";
      __int16 v21 = 1024;
      int v22 = 3714;
      __int16 v23 = 1024;
      int v24 = a1;
      __int16 v25 = 1024;
      int v26 = a2;
      __int16 v27 = 1024;
      int v28 = a3;
      __int16 v29 = 2080;
      uint64_t v30 = a4;
      __int16 v31 = 2080;
      uint64_t v32 = a5;
      __int16 v33 = 2080;
      uint64_t v34 = a6;
      _os_log_impl(&dword_221563000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ~ DNSServiceRegister callback: Ref=%x, Flags=%x, ErrorType=%d name=%s regtype=%s domain=%s", (uint8_t *)&v17, 0x4Cu);
    }
  }
  return [a7 didPublishWithError:a3];
}

uint64_t gkQueryRecordCallback(int a1, int a2, unsigned int a3, uint64_t a4, uint64_t a5, int a6, int a7, uint64_t a8, uint64_t a9, int a10, void *a11)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  memset(v48, 170, sizeof(v48));
  if (!if_indextoname(a3, v48)) {
    v48[0] = 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v17 = VRTraceErrorLogLevelToCSTR();
    uint64_t v18 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136318210;
      uint64_t v23 = v17;
      __int16 v24 = 2080;
      __int16 v25 = "gkQueryRecordCallback";
      __int16 v26 = 1024;
      int v27 = 3904;
      __int16 v28 = 1024;
      int v29 = a1;
      __int16 v30 = 1024;
      int v31 = a2;
      __int16 v32 = 1024;
      unsigned int v33 = a3;
      __int16 v34 = 2080;
      uint64_t v35 = v48;
      __int16 v36 = 1024;
      int v37 = a4;
      __int16 v38 = 2080;
      uint64_t v39 = a5;
      __int16 v40 = 1024;
      int v41 = a6;
      __int16 v42 = 1024;
      int v43 = a7;
      __int16 v44 = 1024;
      int v45 = a8;
      __int16 v46 = 1024;
      int v47 = a10;
      _os_log_impl(&dword_221563000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ~ DNSServiceQueryRecord callback: Ref=%x, Flags=%x, IFIndex=%d (name=[%s]), ErrorType=%d fullname=%s rrtype=%u rrclass=%u rdlen=%u ttl=%u", buf, 0x60u);
    }
  }
  return objc_msgSend((id)objc_msgSend(a11, "session"), "didUpdateTXTRecordForPeer:fromIF:txtLen:txtRecord:withError:moreComing:", a11, v48, a8, a9, a4, a2 & 1);
}

uint64_t gkBrowseCallback(int a1, int a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  memset(v39, 170, sizeof(v39));
  if (!if_indextoname(a3, v39)) {
    v39[0] = 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v16 = VRTraceErrorLogLevelToCSTR();
    uint64_t v17 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 136317698;
      uint64_t v25 = v16;
      __int16 v26 = 2080;
      int v27 = "gkBrowseCallback";
      __int16 v28 = 1024;
      int v29 = 4106;
      __int16 v30 = 1024;
      *(_DWORD *)int v31 = a1;
      *(_WORD *)&v31[4] = 1024;
      *(_DWORD *)&v31[6] = a2;
      LOWORD(v32) = 1024;
      *(_DWORD *)((char *)&v32 + 2) = a3;
      HIWORD(v32) = 2080;
      *(void *)unsigned int v33 = v39;
      *(_WORD *)&v33[8] = 1024;
      *(_DWORD *)__int16 v34 = a4;
      *(_WORD *)&v34[4] = 2080;
      *(void *)uint64_t v35 = a5;
      *(_WORD *)&v35[8] = 2080;
      uint64_t v36 = a6;
      __int16 v37 = 2080;
      uint64_t v38 = a7;
      _os_log_impl(&dword_221563000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ~ DNSServiceBrowse callback: Ref=%x, Flags=%x, IFIndex=%d (name=[%s]), ErrorType=%d name=%s regtype=%s domain=%s", (uint8_t *)&v24, 0x5Cu);
    }
  }
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if ((a2 & 2) != 0)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      uint64_t v23 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 136317186;
        uint64_t v25 = v22;
        __int16 v26 = 2080;
        int v27 = "gkBrowseCallback";
        __int16 v28 = 1024;
        int v29 = 4111;
        __int16 v30 = 2080;
        *(void *)int v31 = a5;
        *(_WORD *)&v31[8] = 2080;
        uint64_t v32 = a6;
        *(_WORD *)unsigned int v33 = 2080;
        *(void *)&v33[2] = a7;
        *(_WORD *)__int16 v34 = 1024;
        *(_DWORD *)&v34[2] = a3;
        *(_WORD *)uint64_t v35 = 2080;
        *(void *)&void v35[2] = v39;
        LOWORD(v36) = 1024;
        *(_DWORD *)((char *)&v36 + 2) = a4;
        _os_log_impl(&dword_221563000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d browse add: [%s][%s][%s] from %d [%s] (%d)", (uint8_t *)&v24, 0x50u);
      }
    }
    return [a8 didFindService:a5 fromIF:v39 withError:a4 moreComing:a2 & 1];
  }
  else
  {
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      BOOL v20 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 136317186;
        uint64_t v25 = v19;
        __int16 v26 = 2080;
        int v27 = "gkBrowseCallback";
        __int16 v28 = 1024;
        int v29 = 4114;
        __int16 v30 = 2080;
        *(void *)int v31 = a5;
        *(_WORD *)&v31[8] = 2080;
        uint64_t v32 = a6;
        *(_WORD *)unsigned int v33 = 2080;
        *(void *)&v33[2] = a7;
        *(_WORD *)__int16 v34 = 1024;
        *(_DWORD *)&v34[2] = a3;
        *(_WORD *)uint64_t v35 = 2080;
        *(void *)&void v35[2] = v39;
        LOWORD(v36) = 1024;
        *(_DWORD *)((char *)&v36 + 2) = a4;
        _os_log_impl(&dword_221563000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d browse rmv: [%s][%s][%s] from %d [%s] (%d)", (uint8_t *)&v24, 0x50u);
      }
    }
    return [a8 didRemoveService:a5 fromIF:v39 withError:a4 moreComing:a2 & 1];
  }
}

void hostnameLookupCallback(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    uint64_t v16 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316930;
      uint64_t v21 = v15;
      __int16 v22 = 2080;
      uint64_t v23 = "hostnameLookupCallback";
      __int16 v24 = 1024;
      int v25 = 4317;
      __int16 v26 = 1024;
      *(_DWORD *)int v27 = a1;
      *(_WORD *)&v27[4] = 1024;
      *(_DWORD *)&v27[6] = a2;
      __int16 v28 = 1024;
      int v29 = a3;
      __int16 v30 = 1024;
      int v31 = a4;
      __int16 v32 = 2080;
      uint64_t v33 = a5;
      _os_log_impl(&dword_221563000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ~ DNSServiceGetAddrInfo callback: Ref=%x, Flags=%x, IFIndex=%d, ErrorType=%d hostname=%s", buf, 0x3Eu);
    }
  }
  if (*(unsigned char *)(a6 + 1) == 2)
  {
    LOBYTE(v19) = a2 & 1;
    objc_msgSend((id)objc_msgSend(a8, "session"), "didLookupHostname:forPeer:hostName:address:interface:withError:moreComing:", a1, a8, a5, a6, a3, a4, v19);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v17 = VRTraceErrorLogLevelToCSTR();
    uint64_t v18 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v21 = v17;
      __int16 v22 = 2080;
      uint64_t v23 = "hostnameLookupCallback";
      __int16 v24 = 1024;
      int v25 = 4320;
      __int16 v26 = 2080;
      *(void *)int v27 = a5;
      _os_log_impl(&dword_221563000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d hostname lookup got non-AF_INET address for %s", buf, 0x26u);
    }
  }
}

void sub_2215AFBD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint8_t buf)
{
}

void sub_2215B099C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2215B426C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2215B687C(_Unwind_Exception *a1)
{
}

void sub_2215B9260(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t __hasMicPermission_block_invoke(uint64_t a1, int a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2 != 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t OSPFProcessDynamicOption(_DWORD *a1, unsigned __int8 *a2, timeval *a3)
{
  if (a2)
  {
    int v4 = *a2;
    if (v4 == 13)
    {
      if (a2[3] == 1)
      {
        memset(v24, 170, sizeof(v24));
        unint64_t v23 = 0xAAAAAAAAAAAAAAAALL;
        unsigned int v10 = a2[2];
        if (v10 <= 5 && ((1 << v10) & 0x36) != 0)
        {
          if (!OSPFReadTimeval((unint64_t *)(a2 + 4), 4 * a2[1], (uint64_t)&v24[1])) {
            goto LABEL_33;
          }
          if (!a3)
          {
            a3 = v24;
            if (gettimeofday(v24, 0)) {
              goto LABEL_33;
            }
          }
          __darwin_time_t v13 = a3->tv_sec - v24[1].tv_sec;
          __darwin_time_t v22 = v13;
          int v14 = a3->tv_usec - v24[1].tv_usec;
          LODWORD(v23) = v14;
          if (v14 < 0)
          {
            __darwin_time_t v22 = v13 - 1;
            LODWORD(v23) = v14 + 1000000;
          }
          if (!OSPFWriteTimeval(a2 + 4, 4 * a2[1], (uint64_t)&v22))
          {
LABEL_33:
            char v9 = 0;
            uint64_t v6 = 1;
            goto LABEL_34;
          }
          unsigned int v10 = a2[2];
        }
        if (v10 - 1 <= 4)
        {
          uint64_t v6 = 0;
          char v9 = v10 + 1;
          goto LABEL_34;
        }
      }
      return 0;
    }
    if (v4 != 14 || a2[3] != 1) {
      return 0;
    }
    int v5 = a2[2];
    if (v5 != 2)
    {
      if (v5 == 1)
      {
        if (a2[1] >= 2u)
        {
          uint64_t v6 = 0;
          unsigned int v7 = a1[4];
          unsigned int v8 = v7 - a1[6];
          a1[6] = v7;
          *((_DWORD *)a2 + 1) = bswap32(v7);
          *((_DWORD *)a2 + 2) = bswap32(v8);
          char v9 = 2;
LABEL_34:
          a2[2] = v9;
          return v6;
        }
        return 1;
      }
      return 0;
    }
    if (a2[1] < 2u) {
      return 1;
    }
    unsigned int v15 = bswap32(*((_DWORD *)a2 + 1));
    unsigned int v16 = bswap32(*((_DWORD *)a2 + 2));
    unsigned int v17 = a1[5];
    if (v15 - v16 != v17)
    {
      if (v15 - v16 <= v17)
      {
        unsigned int v16 = 0;
        unsigned int v20 = 0;
        goto LABEL_35;
      }
      unsigned int v16 = v15 - v17;
    }
    unsigned int v18 = a1[7];
    BOOL v19 = v15 >= v18;
    unsigned int v20 = v15 - v18;
    if (!v19) {
      unsigned int v20 = 0;
    }
    a1[7] = v15;
    a1[5] = v15;
LABEL_35:
    *((_DWORD *)a2 + 1) = bswap32(v16);
    *((_DWORD *)a2 + 2) = bswap32(v20);
    a2[2] = 3;
    if (v20)
    {
      uint64_t v6 = 0;
      a1[9] += v20;
      return v6;
    }
    return 0;
  }
  return 0;
}

uint64_t OSPFReadTimeval(unint64_t *a1, unint64_t a2, uint64_t a3)
{
  uint64_t result = 0;
  int64_t v14 = 0;
  int64_t v15 = 0;
  if (a2 >= 0x10 && a1 && a3)
  {
    *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v13.x_public = v6;
    *(_OWORD *)&v13.x_base = v6;
    *(_OWORD *)&v13.x_op = v6;
    unint64_t v11 = bswap64(*a1);
    xdrmem_create(&v13, (char *)&v11, 8u, XDR_DECODE);
    int v7 = xdr_int64_t(&v13, &v15);
    x_destroy = v13.x_ops->x_destroy;
    if (x_destroy) {
      ((void (*)(XDR *))x_destroy)(&v13);
    }
    *(void *)uint64_t v12 = bswap64(a1[1]);
    xdrmem_create(&v13, v12, 8u, XDR_DECODE);
    int v9 = xdr_int64_t(&v13, &v14);
    unsigned int v10 = v13.x_ops->x_destroy;
    if (v10) {
      ((void (*)(XDR *))v10)(&v13);
    }
    uint64_t result = 0;
    if (v7)
    {
      if (v9)
      {
        *(void *)a3 = v15;
        *(_DWORD *)(a3 + 8) = v14;
        return 1;
      }
    }
  }
  return result;
}

uint64_t OSPFWriteTimeval(void *a1, unint64_t a2, uint64_t a3)
{
  uint64_t result = 0;
  uint64_t v21 = *MEMORY[0x263EF8340];
  *(void *)unsigned int v18 = 0;
  *(void *)BOOL v19 = 0;
  if (a1 && a3)
  {
    *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v17.x_public = v5;
    *(_OWORD *)&v17.x_base = v5;
    *(_OWORD *)&v17.x_op = v5;
    int64_t v16 = *(void *)a3;
    int64_t v15 = *(int *)(a3 + 8);
    xdrmem_create(&v17, v18, 8u, XDR_ENCODE);
    int v6 = xdr_int64_t(&v17, &v16);
    x_destroy = v17.x_ops->x_destroy;
    if (x_destroy) {
      ((void (*)(XDR *))x_destroy)(&v17);
    }
    memset(v20, 170, 17);
    int v13 = v6;
    if (v6)
    {
      int64_t v8 = v16;
      __sprintf_chk(v20, 0, 0x11uLL, "%02X", HIBYTE(v16));
      __sprintf_chk(&v20[2], 0, 0xFuLL, "%02X", BYTE6(v8));
      __sprintf_chk(&v20[4], 0, 0xDuLL, "%02X", BYTE5(v8));
      __sprintf_chk(&v20[6], 0, 0xBuLL, "%02X", BYTE4(v8));
      __sprintf_chk(&v20[8], 0, 9uLL, "%02X", BYTE3(v8));
      __sprintf_chk(&v20[10], 0, 7uLL, "%02X", BYTE2(v8));
      __sprintf_chk(&v20[12], 0, 5uLL, "%02X", BYTE1(v8));
      __sprintf_chk(&v20[14], 0, 3uLL, "%02X", v8);
      v20[16] = 0;
    }
    xdrmem_create(&v17, v19, 8u, XDR_ENCODE);
    int v9 = xdr_int64_t(&v17, &v15);
    unsigned int v10 = v17.x_ops->x_destroy;
    if (v10) {
      ((void (*)(XDR *))v10)(&v17);
    }
    if (v9)
    {
      int64_t v11 = v15;
      __sprintf_chk(v20, 0, 0x11uLL, "%02X", HIBYTE(v15));
      __sprintf_chk(&v20[2], 0, 0xFuLL, "%02X", BYTE6(v11));
      __sprintf_chk(&v20[4], 0, 0xDuLL, "%02X", BYTE5(v11));
      __sprintf_chk(&v20[6], 0, 0xBuLL, "%02X", BYTE4(v11));
      __sprintf_chk(&v20[8], 0, 9uLL, "%02X", BYTE3(v11));
      __sprintf_chk(&v20[10], 0, 7uLL, "%02X", BYTE2(v11));
      __sprintf_chk(&v20[12], 0, 5uLL, "%02X", BYTE1(v11));
      __sprintf_chk(&v20[14], 0, 3uLL, "%02X", v11);
      uint64_t result = 0;
      if (a2 >= 0x10)
      {
        if (v13)
        {
          unint64_t v12 = bswap64(*(unint64_t *)v19);
          *a1 = bswap64(*(unint64_t *)v18);
          a1[1] = v12;
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

uint64_t OSPFMakeHello(void *a1, uint64_t a2, unsigned int a3, unsigned int a4)
{
  int64_t v8 = (char *)malloc_type_calloc(1uLL, 0x22uLL, 0xB6FAA202uLL);
  if (!v8) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v9 = 0;
  LOWORD(v10) = 0;
  *(_WORD *)int64_t v8 = 449;
  *(_DWORD *)(v8 + 2) = 50340352;
  *((_DWORD *)v8 + 2) = bswap32(a3);
  *((_DWORD *)v8 + 3) = bswap32(a4);
  *((_WORD *)v8 + 8) = bswap32(*(unsigned __int16 *)(a2 + 12)) >> 16;
  *(_DWORD *)(v8 + 18) = 268435960;
  *(_DWORD *)(v8 + 22) = 523;
  *(void *)(v8 + 26) = bswap64(*(void *)(a2 + 16));
  do
    unsigned int v10 = CRC16Table[(v8[v9++] ^ v10)] ^ ((unsigned __int16)(v10 & 0xFF00) >> 8);
  while (v9 != 34);
  *((_WORD *)v8 + 3) = bswap32(v10) >> 16;
  *a1 = v8;
  return 34;
}

uint64_t OSPFMakeHeartbeat(void *a1, unsigned int a2, unsigned int a3, int a4, unsigned int a5)
{
  unsigned int v10 = malloc_type_calloc(1uLL, 0x14uLL, 0xF6A69FCuLL);
  if (!v10) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v11 = 0;
  LOWORD(v12) = 0;
  *(_WORD *)unsigned int v10 = 2241;
  *(_DWORD *)((char *)v10 + 2) = 5120;
  v10[2] = bswap32(a2);
  v10[3] = bswap32(a3);
  *((_WORD *)v10 + 8) = (a4 != 0) << 9;
  *((_WORD *)v10 + 9) = __rev16(a5);
  do
    unsigned int v12 = CRC16Table[(*((unsigned char *)v10 + v11++) ^ v12)] ^ ((unsigned __int16)(v12 & 0xFF00) >> 8);
  while (v11 != 20);
  *((_WORD *)v10 + 3) = bswap32(v12) >> 16;
  *a1 = v10;
  return 20;
}

uint64_t OSPFMakeDD(Bytef **a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5, int a6)
{
  uint64_t v10 = *(unsigned int *)(a2 + 12);
  uint64_t v11 = *(void *)(a2 + 16);
  if ((int)v10 < 1)
  {
    unsigned int v12 = 0;
    int v13 = 2;
  }
  else
  {
    unsigned int v12 = 0;
    int v13 = 2;
    uint64_t v14 = *(unsigned int *)(a2 + 12);
    uint64_t v15 = *(void *)(a2 + 16);
    do
    {
      if (*(_DWORD *)v15 != a5)
      {
        v13 += *(unsigned __int8 *)(v15 + 8) + 8 * *(_DWORD *)(v15 + 284) + 9;
        ++v12;
      }
      v15 += 480;
      --v14;
    }
    while (v14);
  }
  uint64_t v16 = (v13 + 16);
  XDR v17 = (Bytef *)malloc_type_calloc(1uLL, (int)v16, 0x8EFA3056uLL);
  if (!v17) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v18 = v17;
  int v38 = a6;
  uint64_t v36 = v16;
  __int16 v37 = a1;
  *(_WORD *)XDR v17 = 705;
  *((_WORD *)v17 + 1) = bswap32(v16) >> 16;
  *((_DWORD *)v17 + 2) = bswap32(a4);
  *((_DWORD *)v17 + 3) = bswap32(a5);
  *((_WORD *)v17 + 8) = bswap32(v12) >> 16;
  if ((int)v10 >= 1)
  {
    uint64_t v19 = 0;
    unsigned int v20 = v17 + 18;
    uint64_t v21 = (unsigned int *)(v11 + 292);
    do
    {
      unsigned int v22 = *(_DWORD *)(v11 + 480 * v19);
      if (v22 != a5)
      {
        uint64_t v23 = v11 + 480 * v19;
        uint64_t v24 = *(unsigned int *)(v23 + 284);
        *(_DWORD *)unsigned int v20 = bswap32(v22);
        v20[2] = bswap32(*(unsigned __int16 *)(v23 + 272)) >> 16;
        *((unsigned char *)v20 + 6) = *(unsigned char *)(v23 + 8);
        int v25 = (char *)v20 + 7;
        memcpy((char *)v20 + 7, (const void *)(v23 + 9), *(unsigned __int8 *)(v23 + 8));
        __int16 v26 = &v25[*(unsigned __int8 *)(v23 + 8)];
        *(_WORD *)__int16 v26 = bswap32(v24) >> 16;
        unsigned int v20 = v26 + 2;
        if ((int)v24 >= 1)
        {
          int v27 = v21;
          do
          {
            *(_DWORD *)unsigned int v20 = bswap32(*(v27 - 1));
            unsigned int v28 = *v27;
            v27 += 3;
            *((_DWORD *)v20 + 1) = bswap32(v28);
            v20 += 4;
            --v24;
          }
          while (v24);
        }
      }
      ++v19;
      v21 += 120;
    }
    while (v19 != v10);
  }
  if (v38)
  {
    uint64_t v40 = (Bytef *)0xAAAAAAAAAAAAAAAALL;
    unsigned int v39 = -1431655766;
    uint64_t v29 = v36;
    if (!ospfTryCompressPacket(&v40, &v39, (uint64_t)v18, v36))
    {
      free(v18);
      unsigned int v18 = v40;
      uint64_t v29 = v39;
    }
    __int16 v30 = v37;
  }
  else
  {
    uint64_t v29 = v36;
    __int16 v30 = v37;
  }
  if ((int)v29 < 1)
  {
    unsigned int v31 = 0;
  }
  else
  {
    LOWORD(v31) = 0;
    uint64_t v32 = v29;
    uint64_t v33 = v18;
    do
    {
      char v34 = *v33++;
      unsigned int v31 = CRC16Table[(v34 ^ v31)] ^ ((unsigned __int16)(v31 & 0xFF00) >> 8);
      --v32;
    }
    while (v32);
  }
  *((_WORD *)v18 + 3) = bswap32(v31) >> 16;
  *__int16 v30 = v18;
  return v29;
}

uint64_t ospfTryCompressPacket(Bytef **a1, unsigned int *a2, uint64_t a3, signed int a4)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  signed int v7 = a4 - 16;
  uLong v8 = compressBound(a4 - 16);
  uLongf destLen = v8;
  uint64_t v9 = (Bytef *)malloc_type_malloc(v8 + 18, 0xCE0E22E0uLL);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    uint64_t v11 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316930;
      uint64_t v28 = v10;
      __int16 v29 = 2080;
      __int16 v30 = "ospfTryCompressPacket";
      __int16 v31 = 1024;
      int v32 = 628;
      __int16 v33 = 1024;
      *(_DWORD *)char v34 = 16;
      *(_WORD *)&v34[4] = 1024;
      *(_DWORD *)&unsigned char v34[6] = 2;
      *(_WORD *)uint64_t v35 = 2048;
      *(void *)&void v35[2] = v8;
      __int16 v36 = 1024;
      signed int v37 = v7;
      __int16 v38 = 2048;
      uLong v39 = v8 + 18;
      _os_log_impl(&dword_221563000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ospfTryCompressPacket: %u + %u + %lu(%d) = %lu", buf, 0x42u);
    }
  }
  if (!v9) {
    return 1;
  }
  if (compress2(v9 + 18, &destLen, (const Bytef *)(a3 + 16), v7, 9) || (unsigned __int16 v12 = destLen, (int)destLen + 2 >= v7))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      unsigned int v22 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        int v23 = *(unsigned __int8 *)(a3 + 1);
        uint64_t v24 = "OSPF";
        if (v23 == 3) {
          uint64_t v24 = "LSA";
        }
        *(_DWORD *)buf = 136316418;
        uint64_t v28 = v21;
        __int16 v29 = 2080;
        __int16 v30 = "ospfTryCompressPacket";
        if (v23 == 2) {
          uint64_t v24 = "DD";
        }
        __int16 v31 = 1024;
        int v32 = 645;
        __int16 v33 = 2080;
        *(void *)char v34 = v24;
        *(_WORD *)&v34[8] = 1024;
        *(_DWORD *)uint64_t v35 = v7;
        *(_WORD *)&v35[4] = 1024;
        *(_DWORD *)&v35[6] = destLen;
        _os_log_impl(&dword_221563000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s compressed body %u => %u+2 (not performed)", buf, 0x32u);
      }
    }
    free(v9);
    return 1;
  }
  *(_OWORD *)uint64_t v9 = *(_OWORD *)a3;
  *((_WORD *)v9 + 8) = bswap32(v7) >> 16;
  *((_WORD *)v9 + 2) = 256;
  unsigned int v13 = v12 + 18;
  *((_WORD *)v9 + 1) = bswap32(v13) >> 16;
  *a1 = v9;
  *a2 = v13;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    uint64_t v15 = *MEMORY[0x263F21098];
    BOOL v16 = os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT);
    uint64_t result = 0;
    if (!v16) {
      return result;
    }
    unsigned int v18 = "OSPF";
    int v19 = *(unsigned __int8 *)(a3 + 1);
    unsigned int v20 = *a2;
    if (v19 == 3) {
      unsigned int v18 = "LSA";
    }
    *(_DWORD *)buf = 136316930;
    uint64_t v28 = v14;
    __int16 v29 = 2080;
    __int16 v30 = "ospfTryCompressPacket";
    if (v19 == 2) {
      unsigned int v18 = "DD";
    }
    __int16 v31 = 1024;
    int v32 = 642;
    __int16 v33 = 2080;
    *(void *)char v34 = v18;
    *(_WORD *)&v34[8] = 1024;
    *(_DWORD *)uint64_t v35 = v7;
    *(_WORD *)&v35[4] = 1024;
    *(_DWORD *)&v35[6] = v12;
    __int16 v36 = 1024;
    signed int v37 = a4;
    __int16 v38 = 1024;
    LODWORD(v39) = v20;
    _os_log_impl(&dword_221563000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s compressed body %u => %u+2, total size: %d => %d", buf, 0x3Eu);
  }
  return 0;
}

uint64_t OSPFMakeLSA(Bytef **a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5, int a6)
{
  uint64_t v6 = *(unsigned int *)(a2 + 16);
  if ((int)v6 < 1) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v11 = 0;
  unsigned int v12 = *(unsigned __int16 *)(a2 + 12);
  uint64_t v13 = *(void *)(a2 + 24);
  int v14 = 4;
  uint64_t v15 = *(unsigned int *)(a2 + 16);
  uint64_t v16 = v13;
  do
  {
    if (*(_DWORD *)v16 != a5 && *(_DWORD *)(v16 + 276) && *(_DWORD *)(v16 + 280) != a5)
    {
      v14 += *(unsigned __int8 *)(v16 + 8) + 8 * *(_DWORD *)(v16 + 284) + 9;
      ++v11;
    }
    v16 += 480;
    --v15;
  }
  while (v15);
  if (!(_WORD)v11) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v17 = (v14 + 16);
  unsigned int v18 = (Bytef *)malloc_type_calloc(1uLL, (int)v17, 0x973799F8uLL);
  if (!v18) {
    return 0xFFFFFFFFLL;
  }
  int v19 = v18;
  int v37 = a6;
  __int16 v38 = a1;
  uint64_t v20 = 0;
  *(_WORD *)unsigned int v18 = 961;
  uint64_t v36 = v17;
  *((_WORD *)v18 + 1) = bswap32(v17) >> 16;
  *((_DWORD *)v18 + 2) = bswap32(a4);
  *((_DWORD *)v18 + 3) = bswap32(a5);
  *((_WORD *)v18 + 8) = __rev16(v12);
  *((_WORD *)v18 + 9) = bswap32(v11) >> 16;
  uint64_t v21 = v18 + 20;
  unsigned int v22 = (unsigned int *)(v13 + 292);
  do
  {
    unsigned int v23 = *(_DWORD *)(v13 + 480 * v20);
    if (v23 != a5)
    {
      if (*(_DWORD *)(v13 + 480 * v20 + 276))
      {
        if (*(_DWORD *)(v13 + 480 * v20 + 280) != a5)
        {
          uint64_t v24 = v13 + 480 * v20;
          uint64_t v25 = *(unsigned int *)(v24 + 284);
          *(_DWORD *)uint64_t v21 = bswap32(v23);
          v21[2] = bswap32(*(unsigned __int16 *)(v24 + 272)) >> 16;
          *((unsigned char *)v21 + 6) = *(unsigned char *)(v24 + 8);
          __int16 v26 = (char *)v21 + 7;
          memcpy((char *)v21 + 7, (const void *)(v24 + 9), *(unsigned __int8 *)(v24 + 8));
          int v27 = &v26[*(unsigned __int8 *)(v24 + 8)];
          *(_WORD *)int v27 = bswap32(v25) >> 16;
          uint64_t v21 = v27 + 2;
          if ((int)v25 >= 1)
          {
            uint64_t v28 = v22;
            do
            {
              *(_DWORD *)uint64_t v21 = bswap32(*(v28 - 1));
              unsigned int v29 = *v28;
              v28 += 3;
              *((_DWORD *)v21 + 1) = bswap32(v29);
              v21 += 4;
              --v25;
            }
            while (v25);
          }
        }
      }
    }
    ++v20;
    v22 += 120;
  }
  while (v20 != v6);
  if (v37)
  {
    uint64_t v40 = (Bytef *)0xAAAAAAAAAAAAAAAALL;
    unsigned int v39 = -1431655766;
    uint64_t v30 = v36;
    if (!ospfTryCompressPacket(&v40, &v39, (uint64_t)v19, v36))
    {
      free(v19);
      int v19 = v40;
      uint64_t v30 = v39;
    }
  }
  else
  {
    uint64_t v30 = v36;
  }
  if ((int)v30 < 1)
  {
    unsigned int v31 = 0;
  }
  else
  {
    LOWORD(v31) = 0;
    uint64_t v32 = v30;
    __int16 v33 = v19;
    do
    {
      char v34 = *v33++;
      unsigned int v31 = CRC16Table[(v34 ^ v31)] ^ ((unsigned __int16)(v31 & 0xFF00) >> 8);
      --v32;
    }
    while (v32);
  }
  *((_WORD *)v19 + 3) = bswap32(v31) >> 16;
  *__int16 v38 = v19;
  return v30;
}

uint64_t OSPFMakeLSAACK(void *a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5)
{
  uint64_t v9 = malloc_type_calloc(1uLL, 0x12uLL, 0x87F1BE7uLL);
  if (!v9) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v10 = 0;
  LOWORD(v11) = 0;
  _DWORD *v9 = 301991105;
  v9[2] = bswap32(a4);
  v9[3] = bswap32(a5);
  *((_WORD *)v9 + 8) = bswap32(*(unsigned __int16 *)(a2 + 12)) >> 16;
  do
    unsigned int v11 = CRC16Table[(*((unsigned char *)v9 + v10++) ^ v11)] ^ ((unsigned __int16)(v11 & 0xFF00) >> 8);
  while (v10 != 18);
  *((_WORD *)v9 + 3) = bswap32(v11) >> 16;
  *a1 = v9;
  return 18;
}

uint64_t OSPFMakeData(char *a1, int a2, uint64_t a3, uint64_t a4, int a5, unsigned int a6, unsigned int *a7, uint64_t a8, uint64_t (*a9)(uint64_t, unsigned int *, uint64_t, char *, void, void, void, void, unsigned __int16), uint64_t a10, unsigned __int8 a11, unsigned __int8 a12, unsigned __int8 a13)
{
  int v13 = a8;
  int v14 = a7;
  int v19 = a1;
  uint64_t v20 = &a1[4 * (int)a8];
  if (a9)
  {
    int v21 = a9(a10, a7, a8, v20 + 12, (1488 - 4 * a8), *(void *)a3, *(unsigned int *)(a3 + 8), a11, __PAIR16__(a13, a12));
    if (v21 < 0)
    {
      uint64_t v22 = 0;
      unsigned int v23 = 0;
      *((_WORD *)v19 + 2) = 0;
      uint64_t v24 = v19 + 6;
LABEL_18:
      *uint64_t v24 = bswap32(v23) >> 16;
      return v22;
    }
  }
  else
  {
    int v21 = 0;
  }
  uint64_t v22 = (4 * v13 + v21 + *(_DWORD *)(a3 + 8) + 12);
  if ((int)v22 <= a2)
  {
    *int v19 = v13 & 0xF | 0xC0;
    if (a5) {
      char v25 = 7;
    }
    else {
      char v25 = 5;
    }
    v19[1] = v25;
    *((_WORD *)v19 + 1) = bswap32(v22) >> 16;
    *((_DWORD *)v19 + 2) = bswap32(a6);
    if (v13 >= 1)
    {
      uint64_t v26 = v13;
      int v27 = v19 + 12;
      do
      {
        unsigned int v28 = *v14++;
        *v27++ = bswap32(v28);
        --v26;
      }
      while (v26);
    }
    memcpy(&v20[v21 + 12], *(const void **)a3, *(int *)(a3 + 8));
    *((_DWORD *)v19 + 1) = 0;
    uint64_t v24 = v19 + 6;
    if ((int)v22 < 1)
    {
      unsigned int v23 = 0;
    }
    else
    {
      LOWORD(v23) = 0;
      uint64_t v29 = v22;
      do
      {
        char v30 = *v19++;
        unsigned int v23 = CRC16Table[(v30 ^ v23)] ^ ((unsigned __int16)(v23 & 0xFF00) >> 8);
        --v29;
      }
      while (v29);
    }
    goto LABEL_18;
  }
  return 0xFFFFFFFFLL;
}

uint64_t OSPFMakeAudio(uint64_t a1, int a2, uint64_t a3, uint64_t a4, unsigned int a5, unsigned int *a6, int a7)
{
  uint64_t v7 = (*(_DWORD *)(a3 + 8) + 4 * a7 + 12);
  if ((int)v7 > a2) {
    return 0xFFFFFFFFLL;
  }
  *(unsigned char *)a1 = a7 & 0xF | 0xC0;
  *(unsigned char *)(a1 + 1) = 6;
  *(_WORD *)(a1 + 2) = bswap32(v7) >> 16;
  *(_DWORD *)(a1 + 8) = bswap32(a5);
  if (a7 >= 1)
  {
    uint64_t v9 = a7;
    uint64_t v10 = (_DWORD *)(a1 + 12);
    do
    {
      unsigned int v11 = *a6++;
      *v10++ = bswap32(v11);
      --v9;
    }
    while (v9);
  }
  memcpy((void *)(a1 + 4 * a7 + 12), *(const void **)a3, *(int *)(a3 + 8));
  *(_DWORD *)(a1 + 4) = 0;
  if ((int)v7 < 1)
  {
    unsigned int v12 = 0;
  }
  else
  {
    LOWORD(v12) = 0;
    int v13 = (char *)a1;
    uint64_t v14 = v7;
    do
    {
      char v15 = *v13++;
      unsigned int v12 = CRC16Table[(v15 ^ v12)] ^ ((unsigned __int16)(v12 & 0xFF00) >> 8);
      --v14;
    }
    while (v14);
  }
  *(_WORD *)(a1 + 6) = bswap32(v12) >> 16;
  return v7;
}

uint64_t OSPFGetLength(uint64_t a1, int a2)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  if (a2 <= 15)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 0xFFFFFFFFLL;
    }
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x263F21098];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT)) {
      return 0xFFFFFFFFLL;
    }
    int v33 = 136315650;
    uint64_t v34 = v2;
    __int16 v35 = 2080;
    uint64_t v36 = "OSPFGetLength";
    __int16 v37 = 1024;
    int v38 = 921;
    int v4 = " [%s] %s:%d OSPFGetLength: buffer is too short...";
LABEL_5:
    _os_log_impl(&dword_221563000, v3, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v33, 0x1Cu);
    return 0xFFFFFFFFLL;
  }
  BOOL v6 = (*(unsigned char *)a1 & 0xF0) != 0xC0 || (*(unsigned char *)a1 & 0xF) == 0;
  if (v6 || *(unsigned __int8 *)(a1 + 1) - 1 > 8) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = bswap32(*(unsigned __int16 *)(a1 + 2)) >> 16;
  if (result > a2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 0xFFFFFFFFLL;
    }
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x263F21098];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT)) {
      return 0xFFFFFFFFLL;
    }
    int v33 = 136315650;
    uint64_t v34 = v8;
    __int16 v35 = 2080;
    uint64_t v36 = "OSPFGetLength";
    __int16 v37 = 1024;
    int v38 = 941;
    int v4 = " [%s] %s:%d OSPFGetLength: Length doesn't fit in buffer ...";
    goto LABEL_5;
  }
  LOWORD(v9) = 0;
  unsigned int v10 = *(unsigned __int16 *)(a1 + 6);
  *(_WORD *)(a1 + 6) = 0;
  uint64_t v11 = a2;
  unsigned int v12 = (char *)a1;
  do
  {
    char v13 = *v12++;
    unsigned int v9 = CRC16Table[(v13 ^ v9)] ^ ((unsigned __int16)(v9 & 0xFF00) >> 8);
    --v11;
  }
  while (v11);
  unsigned int v14 = bswap32(v9) >> 16;
  *(_WORD *)(a1 + 6) = v14;
  if (v14 != v10)
  {
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    uint64_t v16 = (os_log_t *)MEMORY[0x263F21098];
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      unsigned int v18 = *v16;
      if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
      {
        int v33 = 136315650;
        uint64_t v34 = v17;
        __int16 v35 = 2080;
        uint64_t v36 = "OSPFGetLength";
        __int16 v37 = 1024;
        int v38 = 948;
        _os_log_impl(&dword_221563000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d OSPFGetLength: bad checksum...", (uint8_t *)&v33, 0x1Cu);
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      uint64_t v20 = *v16;
      if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
      {
        int v33 = 136315906;
        uint64_t v34 = v19;
        __int16 v35 = 2080;
        uint64_t v36 = "OSPFGetLength";
        __int16 v37 = 1024;
        int v38 = 949;
        __int16 v39 = 1024;
        unsigned int v40 = v10;
        _os_log_impl(&dword_221563000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d OSPFGetLength: checksum == %04X NO...", (uint8_t *)&v33, 0x22u);
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      uint64_t v22 = *v16;
      if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v23 = *(unsigned __int16 *)(a1 + 6);
        int v33 = 136315906;
        uint64_t v34 = v21;
        __int16 v35 = 2080;
        uint64_t v36 = "OSPFGetLength";
        __int16 v37 = 1024;
        int v38 = 950;
        __int16 v39 = 1024;
        unsigned int v40 = v23;
        _os_log_impl(&dword_221563000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d OSPFGetLength: shouldbe == %04X OK...", (uint8_t *)&v33, 0x22u);
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v24 = VRTraceErrorLogLevelToCSTR();
      char v25 = *v16;
      if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v26 = *(unsigned __int8 *)(a1 + 1);
        int v33 = 136315906;
        uint64_t v34 = v24;
        __int16 v35 = 2080;
        uint64_t v36 = "OSPFGetLength";
        __int16 v37 = 1024;
        int v38 = 951;
        __int16 v39 = 1024;
        unsigned int v40 = v26;
        _os_log_impl(&dword_221563000, v25, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d OSPFGetLength: pkttype == %d ...", (uint8_t *)&v33, 0x22u);
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v27 = VRTraceErrorLogLevelToCSTR();
      unsigned int v28 = *v16;
      if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v29 = bswap32(*(unsigned __int16 *)(a1 + 4)) >> 16;
        int v33 = 136315906;
        uint64_t v34 = v27;
        __int16 v35 = 2080;
        uint64_t v36 = "OSPFGetLength";
        __int16 v37 = 1024;
        int v38 = 952;
        __int16 v39 = 1024;
        unsigned int v40 = v29;
        _os_log_impl(&dword_221563000, v28, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d OSPFGetLength: flags == %04X ...", (uint8_t *)&v33, 0x22u);
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v30 = VRTraceErrorLogLevelToCSTR();
      unsigned int v31 = *v16;
      if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v32 = bswap32(*(unsigned __int16 *)(a1 + 2)) >> 16;
        int v33 = 136315906;
        uint64_t v34 = v30;
        __int16 v35 = 2080;
        uint64_t v36 = "OSPFGetLength";
        __int16 v37 = 1024;
        int v38 = 953;
        __int16 v39 = 1024;
        unsigned int v40 = v32;
        _os_log_impl(&dword_221563000, v31, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d OSPFGetLength: length == %d ...", (uint8_t *)&v33, 0x22u);
      }
    }
    *(_WORD *)(a1 + 6) = v10;
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t OSPFParse_ParsePacketHeader(_WORD *a1, int a2, unsigned int **a3, _DWORD *a4)
{
  if (!a1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        OSPFParse_ParsePacketHeader_cold_1();
      }
    }
    return 0;
  }
  if (a2 <= 15)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        OSPFParse_ParsePacketHeader_cold_2();
      }
    }
    return 0;
  }
  uint64_t v8 = 0;
  LOWORD(v9) = 0;
  unsigned int v10 = (unsigned __int16)a1[3];
  a1[3] = 0;
  do
    int v9 = CRC16Table[(*((unsigned char *)a1 + v8++) ^ v9)] ^ ((unsigned __int16)(v9 & 0xFF00) >> 8);
  while (a2 != v8);
  a1[3] = v10;
  if (__rev16(v10) != (unsigned __int16)v9) {
    return 0;
  }
  if ((*(unsigned char *)a1 & 0xF) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        OSPFParse_ParsePacketHeader_cold_3();
      }
    }
    return 0;
  }
  uint64_t v11 = 4 * (*(unsigned char *)a1 & 0xF);
  size_t v12 = v11 + 12;
  if ((int)v11 + 12 > a2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        OSPFParse_ParsePacketHeader_cold_4();
      }
    }
    return 0;
  }
  char v13 = (unsigned int *)malloc_type_malloc(v11 + 12, 0x2B35E4F2uLL);
  memcpy(v13, a1, v12);
  char v14 = *(unsigned char *)v13;
  int v15 = *((unsigned __int8 *)v13 + 1);
  if ((*(unsigned char *)v13 & 0xF0) == 0xC0)
  {
    if ((v15 - 1) >= 9)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
          OSPFParse_ParsePacketHeader_cold_6();
        }
      }
LABEL_44:
      uint64_t v20 = 0;
LABEL_23:
      free(v13);
      return v20;
    }
  }
  else if (v15 != 1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        OSPFParse_ParsePacketHeader_cold_7();
      }
    }
    goto LABEL_44;
  }
  unsigned int v16 = *((unsigned __int16 *)v13 + 1);
  *((_WORD *)v13 + 3) = bswap32(*((unsigned __int16 *)v13 + 3)) >> 16;
  unsigned int v17 = bswap32(v16) >> 16;
  *((_WORD *)v13 + 1) = v17;
  if (v17 != a2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        OSPFParse_ParsePacketHeader_cold_5();
      }
    }
    goto LABEL_44;
  }
  *((_WORD *)v13 + 2) = bswap32(*((unsigned __int16 *)v13 + 2)) >> 16;
  v13[2] = bswap32(v13[2]);
  unint64_t v18 = v14 & 0xF;
  if (v18)
  {
    for (unint64_t i = 0; i < v18; ++i)
      v13[i + 3] = bswap32(v13[i + 3]);
  }
  if (a3)
  {
    *a3 = v13;
    char v13 = 0;
  }
  if (a4) {
    *a4 = v12;
  }
  uint64_t v20 = 1;
  if (v13) {
    goto LABEL_23;
  }
  return v20;
}

uint64_t _OSPFParse_ParseDecompress(uint64_t a1, const Bytef *a2, unsigned int a3, Bytef **a4, _DWORD *a5, unsigned char *a6)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  if (!a2 || !a4 || !a5 || !a6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 0;
    }
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    size_t v12 = *MEMORY[0x263F21098];
    BOOL v13 = os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT);
    uint64_t result = 0;
    if (!v13) {
      return result;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v41 = v11;
    __int16 v42 = 2080;
    int v43 = "_OSPFParse_ParseDecompress";
    __int16 v44 = 1024;
    int v45 = 1139;
    char v14 = " [%s] %s:%d Invalid parameter...";
    goto LABEL_11;
  }
  *a6 = 0;
  if ((*(unsigned char *)(a1 + 1) & 0xFE) != 2 || (*(_WORD *)(a1 + 4) & 1) == 0) {
    return 1;
  }
  if (a3 > 2)
  {
    uLongf v21 = bswap32(*(unsigned __int16 *)a2) >> 16;
    uLongf destLen = v21;
    uint64_t v22 = (Bytef *)malloc_type_malloc(v21, 0x6D9F3B3AuLL);
    if (v22)
    {
      unsigned int v23 = v22;
      uLong v24 = a3 - 2;
      int v25 = uncompress(v22, &destLen, a2 + 2, v24);
      uLongf v26 = destLen;
      int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      if (v25 || v26 != v21)
      {
        if (ErrorLogLevelForModule >= 7)
        {
          uint64_t v35 = VRTraceErrorLogLevelToCSTR();
          uint64_t v36 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            int v37 = *(unsigned __int8 *)(a1 + 1);
            int v38 = "OSPF";
            if (v37 == 3) {
              int v38 = "LSA";
            }
            *(_DWORD *)buf = 136316674;
            uint64_t v41 = v35;
            __int16 v42 = 2080;
            int v43 = "_OSPFParse_ParseDecompress";
            if (v37 == 2) {
              int v38 = "DD";
            }
            __int16 v44 = 1024;
            int v45 = 1172;
            __int16 v46 = 2080;
            int v47 = v38;
            __int16 v48 = 1024;
            int v49 = destLen;
            __int16 v50 = 1024;
            int v51 = v21;
            __int16 v52 = 1024;
            int v53 = v25;
            _os_log_impl(&dword_221563000, v36, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s uncompressed body (real %u =? %u) failed (%d)", buf, 0x38u);
          }
        }
        free(v23);
        return 0;
      }
      if (ErrorLogLevelForModule >= 7)
      {
        uint64_t v28 = VRTraceErrorLogLevelToCSTR();
        unsigned int v29 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          int v30 = *(unsigned __int8 *)(a1 + 1);
          unsigned int v31 = "OSPF";
          if (v30 == 3) {
            unsigned int v31 = "LSA";
          }
          *(_DWORD *)buf = 136316674;
          uint64_t v41 = v28;
          __int16 v42 = 2080;
          int v43 = "_OSPFParse_ParseDecompress";
          if (v30 == 2) {
            unsigned int v31 = "DD";
          }
          __int16 v44 = 1024;
          int v45 = 1176;
          __int16 v46 = 2080;
          int v47 = v31;
          __int16 v48 = 1024;
          int v49 = v24;
          __int16 v50 = 1024;
          int v51 = destLen;
          __int16 v52 = 1024;
          int v53 = v21;
          _os_log_impl(&dword_221563000, v29, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s uncompressed body %u+2 => %u (stated %u)", buf, 0x38u);
        }
      }
      *a4 = v23;
      *a5 = destLen;
      uint64_t result = 1;
      *a6 = 1;
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return 0;
      }
      uint64_t v32 = VRTraceErrorLogLevelToCSTR();
      int v33 = *MEMORY[0x263F21098];
      BOOL v34 = os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT);
      uint64_t result = 0;
      if (v34)
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v41 = v32;
        __int16 v42 = 2080;
        int v43 = "_OSPFParse_ParseDecompress";
        __int16 v44 = 1024;
        int v45 = 1166;
        __int16 v46 = 1024;
        LODWORD(v47) = v21;
        char v14 = " [%s] %s:%d Failed to allocate packet size=%d";
        int v15 = v33;
        uint32_t v16 = 34;
        goto LABEL_12;
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 0;
    }
    uint64_t v18 = VRTraceErrorLogLevelToCSTR();
    size_t v12 = *MEMORY[0x263F21098];
    BOOL v19 = os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT);
    uint64_t result = 0;
    if (v19)
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v41 = v18;
      __int16 v42 = 2080;
      int v43 = "_OSPFParse_ParseDecompress";
      __int16 v44 = 1024;
      int v45 = 1153;
      char v14 = " [%s] %s:%d Size is too small...";
LABEL_11:
      int v15 = v12;
      uint32_t v16 = 28;
LABEL_12:
      _os_log_impl(&dword_221563000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      return 0;
    }
  }
  return result;
}

BOOL _OSPFParse_ParseExtractOptions(uint64_t a1, unsigned __int8 *a2, int a3, void *a4, _DWORD *a5, _DWORD *a6)
{
  uint64_t v6 = a1;
  uint64_t v95 = *MEMORY[0x263EF8340];
  *a6 = -1;
  if (a3 <= 3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        int v9 = *(unsigned __int8 *)(v6 + 1);
        *(_DWORD *)buf = 136315906;
        uint64_t v78 = v7;
        __int16 v79 = 2080;
        int v80 = "ospfVerifyOptions";
        __int16 v81 = 1024;
        int v82 = 1027;
        __int16 v83 = 1024;
        int v84 = v9;
        _os_log_impl(&dword_221563000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VerifyOptions: msg: %d: missing options info", buf, 0x22u);
      }
    }
    int v10 = 1;
    goto LABEL_16;
  }
  if (*a2 != 248)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      uint64_t v18 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        int v19 = *(unsigned __int8 *)(v6 + 1);
        int v20 = *a2;
        *(_DWORD *)buf = 136316162;
        uint64_t v78 = v17;
        __int16 v79 = 2080;
        int v80 = "ospfVerifyOptions";
        __int16 v81 = 1024;
        int v82 = 1032;
        __int16 v83 = 1024;
        int v84 = v19;
        __int16 v85 = 1024;
        int v86 = v20;
        _os_log_impl(&dword_221563000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VerifyOptions: msg: %d: expecting options info, got %d", buf, 0x28u);
      }
    }
    int v10 = 2;
    goto LABEL_16;
  }
  uint64_t v13 = __rev16(*((unsigned __int16 *)a2 + 1));
  if (v13 > a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      int v15 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        int v16 = *(unsigned __int8 *)(v6 + 1);
        *(_DWORD *)buf = 136316418;
        uint64_t v78 = v14;
        __int16 v79 = 2080;
        int v80 = "ospfVerifyOptions";
        __int16 v81 = 1024;
        int v82 = 1037;
        __int16 v83 = 1024;
        int v84 = v16;
        __int16 v85 = 1024;
        int v86 = v13;
        __int16 v87 = 1024;
        int v88 = a3;
        _os_log_impl(&dword_221563000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VerifyOptions: msg: %d: body offset %d > %d", buf, 0x2Eu);
      }
    }
    int v10 = 3;
    goto LABEL_16;
  }
  unsigned int v29 = (char *)(a2 + 4);
  if (a2[1])
  {
    int v30 = 0;
    unsigned int v31 = a2 + 4;
    while (1)
    {
      int v32 = v31 - a2;
      uint64_t v33 = v13 - (v31 - a2);
      if (v33 <= 3)
      {
        int v49 = a2[1];
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v50 = VRTraceErrorLogLevelToCSTR();
          int v51 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            int v52 = *(unsigned __int8 *)(a1 + 1);
            *(_DWORD *)buf = 136316418;
            uint64_t v78 = v50;
            __int16 v79 = 2080;
            int v80 = "ospfVerifyOptions";
            __int16 v81 = 1024;
            int v82 = 1049;
            __int16 v83 = 1024;
            int v84 = v52;
            __int16 v85 = 1024;
            int v86 = v30;
            uint64_t v6 = a1;
            __int16 v87 = 1024;
            int v88 = v49;
            _os_log_impl(&dword_221563000, v51, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VerifyOptions: msg: %d: option %d of %d: not enough option header", buf, 0x2Eu);
            int v10 = 4;
            goto LABEL_16;
          }
        }
        int v10 = 4;
        goto LABEL_52;
      }
      unint64_t v34 = 4 * v31[1] + 4;
      if (v33 < v34) {
        break;
      }
      v31 += v34;
      if (a2[1] == ++v30)
      {
        uint64_t v6 = a1;
        goto LABEL_28;
      }
    }
    int v53 = a2[1];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v54 = VRTraceErrorLogLevelToCSTR();
      int v55 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        int v56 = *(unsigned __int8 *)(a1 + 1);
        *(_DWORD *)buf = 136317186;
        uint64_t v78 = v54;
        __int16 v79 = 2080;
        int v80 = "ospfVerifyOptions";
        __int16 v81 = 1024;
        int v82 = 1055;
        __int16 v83 = 1024;
        int v84 = v56;
        __int16 v85 = 1024;
        int v86 = v30;
        uint64_t v6 = a1;
        __int16 v87 = 1024;
        int v88 = v53;
        __int16 v89 = 1024;
        int v90 = v32;
        __int16 v91 = 1024;
        int v92 = v13;
        __int16 v93 = 1024;
        int v94 = v34;
        _os_log_impl(&dword_221563000, v55, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VerifyOptions: msg: %d: option %d of %d: @%d/%d, size=%d", buf, 0x40u);
        int v10 = 5;
        goto LABEL_16;
      }
    }
    int v10 = 5;
LABEL_52:
    uint64_t v6 = a1;
LABEL_16:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      uint64_t v22 = *MEMORY[0x263F21098];
      BOOL v23 = os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT);
      BOOL result = 0;
      if (!v23) {
        return result;
      }
      int v25 = *(unsigned __int8 *)(v6 + 1);
      *(_DWORD *)buf = 136316162;
      uint64_t v78 = v21;
      __int16 v79 = 2080;
      int v80 = "_OSPFParse_ParseExtractOptions";
      __int16 v81 = 1024;
      int v82 = 1193;
      __int16 v83 = 1024;
      int v84 = v25;
      __int16 v85 = 1024;
      int v86 = v10;
      _os_log_impl(&dword_221563000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d msg: %d: options verification failed (%d)", buf, 0x28u);
    }
    return 0;
  }
  unsigned int v31 = a2 + 4;
LABEL_28:
  int v35 = v31 - a2;
  if (v31 - a2 != v13)
  {
    int v45 = a2[1];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v46 = VRTraceErrorLogLevelToCSTR();
      int v47 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        int v48 = *(unsigned __int8 *)(v6 + 1);
        *(_DWORD *)buf = 136316674;
        uint64_t v78 = v46;
        __int16 v79 = 2080;
        int v80 = "ospfVerifyOptions";
        __int16 v81 = 1024;
        int v82 = 1063;
        __int16 v83 = 1024;
        int v84 = v48;
        __int16 v85 = 1024;
        int v86 = v45;
        __int16 v87 = 1024;
        int v88 = v35;
        __int16 v89 = 1024;
        int v90 = v13;
        _os_log_impl(&dword_221563000, v47, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VerifyOptions: msg: %d: %d options used %d bytes != %d offset", buf, 0x34u);
      }
    }
    int v10 = 6;
    goto LABEL_16;
  }
  uint64_t v36 = a2[1];
  int v37 = malloc_type_malloc(8 * v36, 0x2004093837F09uLL);
  if (v37)
  {
    int v38 = v37;
    uint64_t v39 = v36;
    if (!v36)
    {
LABEL_39:
      *a5 = v39;
      *a4 = v37;
      BOOL result = 1;
      *a6 = v13;
      return result;
    }
    uint64_t v40 = v6;
    uint64_t v41 = 0;
    int v42 = a3 - 4;
    __int16 v43 = *(_WORD *)(v40 + 4);
    while (1)
    {
      *((void *)v37 + v41) = v29;
      if ((v43 & 2) == 0 || !v42) {
        goto LABEL_59;
      }
      if (v42 <= 3)
      {
        int v57 = v39;
        int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
        LODWORD(v39) = v57;
        if (ErrorLogLevelForModule >= 7)
        {
          uint64_t v59 = VRTraceErrorLogLevelToCSTR();
          uint64_t v60 = *MEMORY[0x263F21098];
          BOOL v61 = os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT);
          LODWORD(v39) = v57;
          if (v61)
          {
            int v62 = *(unsigned __int8 *)(v40 + 1);
            *(_DWORD *)buf = 136316162;
            uint64_t v78 = v59;
            __int16 v79 = 2080;
            int v80 = "ospfParseOption";
            __int16 v81 = 1024;
            int v82 = 980;
            __int16 v83 = 1024;
            int v84 = v62;
            __int16 v85 = 1024;
            int v86 = v42;
            _os_log_impl(&dword_221563000, v60, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ParseOption: msg: %d: option too small: %d", buf, 0x28u);
            LODWORD(v39) = v57;
          }
        }
LABEL_59:
        int v63 = v39;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v64 = VRTraceErrorLogLevelToCSTR();
          int v65 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v78 = v64;
            __int16 v79 = 2080;
            int v80 = "_OSPFParse_ParseExtractOptions";
            __int16 v81 = 1024;
            int v82 = 1211;
            __int16 v83 = 1024;
            int v84 = v41;
            __int16 v85 = 1024;
            int v86 = v63;
            uint64_t v66 = " [%s] %s:%d expecting option %d of %d";
            uint64_t v67 = v65;
            goto LABEL_68;
          }
        }
        goto LABEL_70;
      }
      uint64_t v44 = 4 * v29[1] + 4;
      if (v42 < v44) {
        break;
      }
      if (!*v29) {
        goto LABEL_70;
      }
      if (*v29 < 0)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v72 = VRTraceErrorLogLevelToCSTR();
          uint64_t v73 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            int v74 = *(unsigned __int8 *)(v40 + 1);
            int v75 = *v29;
            *(_DWORD *)buf = 136316162;
            uint64_t v78 = v72;
            __int16 v79 = 2080;
            int v80 = "ospfParseOption";
            __int16 v81 = 1024;
            int v82 = 1001;
            __int16 v83 = 1024;
            int v84 = v74;
            __int16 v85 = 1024;
            int v86 = v75;
            uint64_t v66 = " [%s] %s:%d ParseOption: msg: %d: unsupported required option: %d";
            uint64_t v67 = v73;
LABEL_68:
            uint32_t v71 = 40;
LABEL_69:
            _os_log_impl(&dword_221563000, v67, OS_LOG_TYPE_DEFAULT, v66, buf, v71);
            goto LABEL_70;
          }
        }
        goto LABEL_70;
      }
      v29 += v44;
      ++v41;
      v42 -= v44;
      if (v39 == v41) {
        goto LABEL_39;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v68 = VRTraceErrorLogLevelToCSTR();
      uint64_t v69 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        int v70 = *(unsigned __int8 *)(v40 + 1);
        *(_DWORD *)buf = 136316418;
        uint64_t v78 = v68;
        __int16 v79 = 2080;
        int v80 = "ospfParseOption";
        __int16 v81 = 1024;
        int v82 = 988;
        __int16 v83 = 1024;
        int v84 = v70;
        __int16 v85 = 1024;
        int v86 = v44;
        __int16 v87 = 1024;
        int v88 = v42;
        uint64_t v66 = " [%s] %s:%d ParseOption: msg: %d: incorrect option size: %d > %d";
        uint64_t v67 = v69;
        uint32_t v71 = 46;
        goto LABEL_69;
      }
    }
LABEL_70:
    free(v38);
    return 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
    return 0;
  }
  VRTraceErrorLogLevelToCSTR();
  BOOL result = os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR);
  if (result)
  {
    _OSPFParse_ParseExtractOptions_cold_1();
    return 0;
  }
  return result;
}

uint64_t OSPFParse(void **a1, void *a2, _WORD *a3, int a4, unsigned __int8 **a5, uint64_t a6)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  unsigned int v31 = (Bytef *)0xAAAAAAAAAAAAAAAALL;
  unsigned int v30 = -1431655766;
  char v29 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  uint64_t v12 = 0xFFFFFFFFLL;
  unsigned int v25 = -1;
  unsigned int v26 = 0;
  if (!OSPFParse_ParsePacketHeader(a3, a4, (unsigned int **)&v28, &v25) || !v28) {
    return v12;
  }
  if (!a2 && (*((_WORD *)v28 + 2) & 1) != 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      uint64_t v14 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v33 = v13;
        __int16 v34 = 2080;
        int v35 = "OSPFParse";
        __int16 v36 = 1024;
        int v37 = 1523;
        _os_log_impl(&dword_221563000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Flow control: returning -1 when message is compressed and ppOSPFBody is NULL", buf, 0x1Cu);
      }
    }
    goto LABEL_15;
  }
  unsigned int v31 = (Bytef *)a3 + v25;
  unsigned int v30 = a4 - v25;
  if ((_OSPFParse_ParseDecompress((uint64_t)v28, v31, a4 - v25, &v31, &v30, &v29) & 1) == 0)
  {
LABEL_15:
    uint64_t v17 = 0;
    int v16 = 0;
    goto LABEL_16;
  }
  int v15 = v31;
  if (v29) {
    int v16 = v31;
  }
  else {
    int v16 = 0;
  }
  if (*((unsigned char *)v28 + 1) != 1)
  {
    LOWORD(v21) = 0;
    goto LABEL_30;
  }
  if (v30 > 1)
  {
    int v15 = v31 + 2;
    unsigned int v21 = bswap32(*(unsigned __int16 *)v31) >> 16;
    v31 += 2;
    v30 -= 2;
LABEL_30:
    if ((*((_WORD *)v28 + 2) & 2) != 0)
    {
      if (!_OSPFParse_ParseExtractOptions((uint64_t)v28, v15, v30, &v27, &v26, &v25))
      {
        uint64_t v17 = 0;
        goto LABEL_18;
      }
      int v15 = &v31[v25];
      unsigned int v31 = v15;
      v30 -= v25;
    }
    if (a5)
    {
      if (v16) {
        uint64_t v22 = 0;
      }
      else {
        uint64_t v22 = v15;
      }
      *a5 = v22;
    }
    if (a6) {
      (*(void (**)(uint64_t, void *, void))(a6 + 16))(a6, v27, v26);
    }
    uint64_t v17 = 0;
    if (a2)
    {
      unsigned int v25 = -1;
      int v19 = v28;
      int v23 = 0;
      switch(*((unsigned char *)v28 + 1))
      {
        case 1:
          uint64_t v17 = _OSPFParse_ParsePacketHello(v21, (uint64_t)v27, v26);
          if ((*(unsigned char *)v28 & 0xF0) == 0xC0) {
            goto LABEL_56;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
              OSPFParse_cold_1();
            }
          }
          int v23 = 1;
          break;
        case 2:
          uLong v24 = _OSPFParse_ParsePacketDD((uint64_t)v28, (unsigned __int16 *)v31, v30, &v25);
          goto LABEL_55;
        case 3:
          uLong v24 = _OSPFParse_ParsePacketLSA((uint64_t)v28, (unsigned __int16 *)v31, v30, &v25);
          goto LABEL_55;
        case 4:
          uLong v24 = _OSPFParse_ParsePacketLSAAck((unsigned __int16 *)v31, v30, &v25);
          goto LABEL_55;
        case 5:
        case 7:
          uLong v24 = _OSPFParse_ParsePacketData((uint64_t)v31, v30, &v25);
          goto LABEL_55;
        case 6:
          uLong v24 = _OSPFParse_ParsePacketAudio((uint64_t)v31, v30, &v25);
          goto LABEL_55;
        case 8:
          uLong v24 = _OSPFParse_ParsePacketHeartbeat((unsigned __int16 *)v31, v30, &v25);
LABEL_55:
          uint64_t v17 = v24;
LABEL_56:
          int v23 = 0;
          break;
        case 9:
          break;
        default:
          goto LABEL_19;
      }
      if (*((unsigned char *)v28 + 1) != 9 && !v17) {
        goto LABEL_16;
      }
    }
    else
    {
      int v23 = 0;
    }
    if (a1)
    {
      *a1 = v28;
      uint64_t v28 = 0;
    }
    if (a2)
    {
      *a2 = v17;
      uint64_t v17 = 0;
    }
    if (v23) {
      int v18 = 0;
    }
    else {
      int v18 = a4;
    }
    goto LABEL_17;
  }
  uint64_t v17 = 0;
LABEL_16:
  int v18 = -1;
LABEL_17:
  unsigned int v25 = v18;
LABEL_18:
  int v19 = v28;
  if (v28) {
LABEL_19:
  }
    free(v19);
  if (v17) {
    free(v17);
  }
  if (v16) {
    free(v16);
  }
  if (v27) {
    free(v27);
  }
  return v25;
}

_WORD *_OSPFParse_ParsePacketHello(__int16 a1, uint64_t a2, unsigned int a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v6 = malloc_type_calloc(1uLL, 0x20uLL, 0x10300409059B04AuLL);
  uint64_t v7 = v6;
  if (v6)
  {
    v6[6] = a1;
    *(void *)uint64_t v6 = 0;
    *((_DWORD *)v6 + 2) = 0;
    if (a3)
    {
      uint64_t v8 = a3;
      do
      {
        if (**(unsigned char **)a2 == 11) {
          *((void *)v6 + 2) = bswap64(*(void *)(*(void *)a2 + 4));
        }
        a2 += 8;
        --v8;
      }
      while (v8);
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    int v10 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315650;
      uint64_t v13 = v9;
      __int16 v14 = 2080;
      int v15 = "_OSPFParse_ParsePacketHello";
      __int16 v16 = 1024;
      int v17 = 1236;
      _os_log_impl(&dword_221563000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to allocate buffer", (uint8_t *)&v12, 0x1Cu);
    }
  }
  return v7;
}

_DWORD *_OSPFParse_ParsePacketHeartbeat(unsigned __int16 *a1, unsigned int a2, _DWORD *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (!a1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        _OSPFParse_ParsePacketHeartbeat_cold_1();
      }
    }
    return 0;
  }
  if (a2 <= 3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 0;
    }
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    long long v5 = *MEMORY[0x263F21098];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT)) {
      return 0;
    }
    int v14 = 136315906;
    uint64_t v15 = v4;
    __int16 v16 = 2080;
    int v17 = "_OSPFParse_ParsePacketHeartbeat";
    __int16 v18 = 1024;
    int v19 = 1267;
    __int16 v20 = 1024;
    unsigned int v21 = a2;
    uint64_t v6 = " [%s] %s:%d Payload size=%d is too small";
    uint64_t v7 = v5;
    uint32_t v8 = 34;
    goto LABEL_14;
  }
  BOOL result = malloc_type_calloc(1uLL, 0x10uLL, 0x1010040FDD9F14CuLL);
  if (result)
  {
    *(void *)BOOL result = 0;
    result[2] = 0;
    *((_WORD *)result + 6) = bswap32(*a1) >> 16;
    *((_WORD *)result + 7) = bswap32(a1[1]) >> 16;
    *a3 = 4;
    return result;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    uint64_t v13 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315650;
      uint64_t v15 = v12;
      __int16 v16 = 2080;
      int v17 = "_OSPFParse_ParsePacketHeartbeat";
      __int16 v18 = 1024;
      int v19 = 1274;
      uint64_t v6 = " [%s] %s:%d Failed to allocate buffer";
      uint64_t v7 = v13;
      uint32_t v8 = 28;
LABEL_14:
      _os_log_impl(&dword_221563000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v14, v8);
    }
  }
  return 0;
}

void *_OSPFParse_ParsePacketDD(uint64_t a1, unsigned __int16 *a2, unsigned int a3, _DWORD *a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  int v15 = 0;
  *a4 = 0;
  if (!a2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        _OSPFParse_ParsePacketDD_cold_1();
      }
    }
    return 0;
  }
  unsigned int v4 = a3 - 2;
  if (a3 < 2) {
    return 0;
  }
  int v6 = (int)a2;
  uint32_t v8 = a2 + 1;
  unsigned int v9 = bswap32(*a2) >> 16;
  int v10 = (char *)malloc_type_malloc((480 * v9) | 0x18, 0x942DA601uLL);
  if (!v10)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      uint64_t v13 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v17 = v12;
        __int16 v18 = 2080;
        int v19 = "_OSPFParse_ParsePacketDD";
        __int16 v20 = 1024;
        int v21 = 1479;
        _os_log_impl(&dword_221563000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to allocate buffer", buf, 0x1Cu);
      }
    }
    return 0;
  }
  uint64_t v11 = v10;
  *(void *)int v10 = 0;
  *((_DWORD *)v10 + 2) = 0;
  *((_DWORD *)v10 + 3) = v9;
  *((void *)v10 + 2) = v10 + 24;
  if ((_OSPFParse_ParseNodes(a1, (uint64_t)(v10 + 24), v9, v8, v4, &v15) & 1) == 0)
  {
    free(v11);
    return 0;
  }
  *a4 = v8 + v15 - v6;
  return v11;
}

void *_OSPFParse_ParsePacketLSA(uint64_t a1, unsigned __int16 *a2, unsigned int a3, _DWORD *a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  int v15 = 0;
  *a4 = 0;
  if (!a2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        _OSPFParse_ParsePacketLSA_cold_1();
      }
    }
    return 0;
  }
  unsigned int v4 = a3 - 4;
  if (a3 < 4) {
    return 0;
  }
  unsigned int v8 = *a2;
  unsigned int v9 = bswap32(a2[1]) >> 16;
  int v10 = (char *)malloc_type_malloc(480 * v9 + 32, 0xF419A8DBuLL);
  if (!v10)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      uint64_t v13 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v17 = v12;
        __int16 v18 = 2080;
        int v19 = "_OSPFParse_ParsePacketLSA";
        __int16 v20 = 1024;
        int v21 = 1408;
        _os_log_impl(&dword_221563000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to allocate buffer", buf, 0x1Cu);
      }
    }
    return 0;
  }
  uint64_t v11 = v10;
  *(void *)int v10 = 0;
  *((_DWORD *)v10 + 2) = 0;
  *((_WORD *)v10 + 6) = __rev16(v8);
  *((_DWORD *)v10 + 4) = v9;
  *((void *)v10 + 3) = v10 + 32;
  if ((_OSPFParse_ParseNodes(a1, (uint64_t)(v10 + 32), v9, a2 + 2, v4, &v15) & 1) == 0)
  {
    free(v11);
    return 0;
  }
  *a4 = v15 + 4;
  return v11;
}

_DWORD *_OSPFParse_ParsePacketLSAAck(unsigned __int16 *a1, unsigned int a2, _DWORD *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a1)
  {
    *a3 = 0;
    if (a2 >= 2)
    {
      BOOL result = malloc_type_calloc(1uLL, 0x10uLL, 0x1010040F51ADB7CuLL);
      if (result)
      {
        *(void *)BOOL result = 0;
        result[2] = 0;
        *((_WORD *)result + 6) = bswap32(*a1) >> 16;
        *a3 = 2;
        return result;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        uint64_t v7 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          int v8 = 136315650;
          uint64_t v9 = v6;
          __int16 v10 = 2080;
          uint64_t v11 = "_OSPFParse_ParsePacketLSAAck";
          __int16 v12 = 1024;
          int v13 = 1443;
          _os_log_impl(&dword_221563000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to allocate buffer", (uint8_t *)&v8, 0x1Cu);
        }
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
      _OSPFParse_ParsePacketLSAAck_cold_1();
    }
  }
  return 0;
}

_DWORD *_OSPFParse_ParsePacketData(uint64_t a1, int a2, _DWORD *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v6 = malloc_type_calloc(1uLL, 0x10uLL, 0x1010040A1D9428BuLL);
  uint64_t v7 = v6;
  if (v6)
  {
    *(void *)uint64_t v6 = a1;
    v6[2] = a2;
    *a3 = a2;
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315650;
      uint64_t v12 = v8;
      __int16 v13 = 2080;
      uint64_t v14 = "_OSPFParse_ParsePacketData";
      __int16 v15 = 1024;
      int v16 = 1298;
      _os_log_impl(&dword_221563000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to allocate buffer", (uint8_t *)&v11, 0x1Cu);
    }
  }
  return v7;
}

_DWORD *_OSPFParse_ParsePacketAudio(uint64_t a1, int a2, _DWORD *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v6 = malloc_type_calloc(1uLL, 0x10uLL, 0x1010040A1D9428BuLL);
  uint64_t v7 = v6;
  if (v6)
  {
    *(void *)uint64_t v6 = a1;
    v6[2] = a2;
    *a3 = a2;
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315650;
      uint64_t v12 = v8;
      __int16 v13 = 2080;
      uint64_t v14 = "_OSPFParse_ParsePacketAudio";
      __int16 v15 = 1024;
      int v16 = 1312;
      _os_log_impl(&dword_221563000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to allocate buffer", (uint8_t *)&v11, 0x1Cu);
    }
  }
  return v7;
}

uint64_t OSPFAddDynamicOptions(unsigned __int8 ***a1, _WORD *a2, uint64_t a3, int a4, unsigned int a5, _DWORD *a6, unint64_t a7, uint64_t a8)
{
  uint64_t v138 = a8;
  unint64_t v127 = a7;
  uint64_t v172 = *MEMORY[0x263EF8340];
  size_t v152 = 0;
  __int16 v147 = -21846;
  long long v149 = 0u;
  long long v150 = 0u;
  long long v151 = 0u;
  memset(v153, 0, sizeof(v153));
  int v135 = a4;
  if (a4)
  {
    __int16 v147 = __rev16(a5);
    *(void *)&v153[0] = &v147;
    *((void *)&v153[0] + 1) = 4;
    DWORD2(v150) = 1;
  }
  __int16 v148 = -21846;
  uint64_t v143 = 0;
  uint64_t v144 = &v143;
  uint64_t v145 = 0x2000000000;
  char v146 = 0;
  uint64_t v141 = 0;
  v142[0] = MEMORY[0x263EF8330];
  v142[1] = 0x40000000;
  v142[2] = __OSPFAddDynamicOptions_block_invoke;
  v142[3] = &unk_2645B80E0;
  v142[4] = &v143;
  uint64_t v130 = a3;
  uint64_t v11 = OSPFGetLength((uint64_t)a2, a3);
  int v12 = v11;
  unint64_t v128 = (unint64_t)a6;
  if ((int)v11 < 1)
  {
    int v13 = 0;
  }
  else
  {
    int v13 = 1238 - v11;
    ++a6[4];
  }
  MEMORY[0x270FA5388](v11);
  __int16 v15 = (_WORD *)((char *)&v118 - ((v14 + 15) & 0x1FFFFFFF0));
  int v16 = memset(v15, 170, v14);
  MEMORY[0x270FA5388](v16);
  __int16 v18 = (char *)&v118 - ((v17 + 15) & 0x1FFFFFFF0);
  if ((v19 & 1) == 0) {
    memset((char *)&v118 - ((v17 + 15) & 0x1FFFFFFF0), 170, v17);
  }
  int v140 = 0;
  int v131 = a2;
  int v129 = &v118;
  if (v12 >= 1 && v13 >= 1 && a1)
  {
    int v12 = OSPFParse(&v152, 0, a2, v12, &v140, (uint64_t)v142);
    int v21 = v144;
    if (v12 < 1)
    {
      int v139 = -1431655766;
    }
    else
    {
      int v139 = -1431655766;
      if (!*((unsigned char *)v144 + 24) && v140)
      {
        uint64_t v22 = *a1;
        unint64_t v125 = (unint64_t)v18;
        if (v22)
        {
          if (v13 < 4)
          {
            int v23 = 0;
          }
          else
          {
            int v23 = 0;
            *(void *)&long long v20 = 136315906;
            long long v137 = v20;
            do
            {
              if (*v22)
              {
                int v24 = 4 * (*v22)[1];
                if (v13 >= (v24 + 8))
                {
                  *a1 = (unsigned __int8 **)v22[1];
                  v22[1] = 0;
                  if (OSPFProcessDynamicOption((_DWORD *)v128, *v22, 0))
                  {
                    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                    {
                      uint64_t v25 = VRTraceErrorLogLevelToCSTR();
                      unsigned int v26 = *MEMORY[0x263F21098];
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
                      {
                        int v27 = **v22;
                        *(_DWORD *)buf = v137;
                        uint64_t v155 = v25;
                        __int16 v156 = 2080;
                        int v157 = "OSPFAddDynamicOptions";
                        __int16 v158 = 1024;
                        int v159 = 1795;
                        __int16 v160 = 1024;
                        int v161 = v27;
                        _os_log_impl(&dword_221563000, v26, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d OSPFAddOptions: error processing option node (type == %d)", buf, 0x22u);
                      }
                    }
                    if (*v22) {
                      free(*v22);
                    }
                    free(v22);
                    __int16 v18 = (char *)v125;
                  }
                  else
                  {
                    v13 -= v24 + 4;
                    uint64_t v28 = &v141;
                    do
                    {
                      char v29 = v28;
                      uint64_t v30 = *v28;
                      uint64_t v28 = (uint64_t *)(*v28 + 8);
                    }
                    while (v30);
                    v23 += v24 + 4;
                    *char v29 = (uint64_t)v22;
                  }
                }
                else
                {
                  a1 = (unsigned __int8 ***)(v22 + 1);
                }
              }
              else
              {
                *a1 = (unsigned __int8 **)v22[1];
                free(v22);
              }
              uint64_t v22 = *a1;
              if (*a1) {
                BOOL v31 = v13 <= 3;
              }
              else {
                BOOL v31 = 1;
              }
            }
            while (!v31);
            if (v23)
            {
              signed int v32 = v23 + 4;
LABEL_103:
              unint64_t v81 = v127;
              uint64_t v41 = v131;
LABEL_106:
              uint64_t v82 = 0;
              unsigned int v136 = 43690;
              if (v81 && v13 >= 12)
              {
                if (*(void *)v81 == 0xFFFFFFFFLL)
                {
                  uint64_t v82 = 0;
                }
                else
                {
                  uint64_t v82 = *(unsigned int *)(v81 + 8);
                  if (v82)
                  {
                    if (v12 + v23 + 8 >= 196) {
                      signed int v83 = 8;
                    }
                    else {
                      signed int v83 = ((191 - (v12 + v23)) & 0xFFFFFFFC) + 8;
                    }
                    if (v13 - v83 >= 4)
                    {
                      int v109 = malloc_type_malloc(v83 + 4, 0x3FFED812uLL);
                      long long v110 = malloc_type_calloc(1uLL, 0x10uLL, 0x20040A4A59CD2uLL);
                      int v111 = v110;
                      if (v109 && v110)
                      {
                        unint64_t v112 = v127;
                        int v113 = *(_DWORD *)(v127 + 16);
                        *int v109 = 15;
                        v109[1] = (v83 + 1020) >> 2;
                        v109[2] = BYTE1(v113);
                        v109[3] = v113;
                        *((_WORD *)v109 + 3) = 0;
                        *((_WORD *)v109 + 2) = bswap32(*(unsigned __int16 *)(v112 + 12)) >> 16;
                        void *v110 = v109;
                        v110[1] = 0;
                        unsigned int v114 = &v141;
                        do
                        {
                          long long v115 = v114;
                          uint64_t v116 = *v114;
                          unsigned int v114 = (uint64_t *)(*v114 + 8);
                        }
                        while (v116);
                        *long long v115 = (uint64_t)v110;
                        unint64_t v117 = *(void *)v109;
                        uint64_t v119 = *(void *)v109 >> 8;
                        uint64_t v124 = v117;
                        uint64_t v126 = HIWORD(v117);
                        buf[0] = 0;
                        GCK_BWE_TrackLargeFrameState();
                      }
                      free(v109);
                      free(v111);
                      uint64_t v82 = 0;
                      uint64_t v134 = 170;
                      unsigned int v136 = 43690;
                      uint64_t v133 = 170;
                      uint64_t v132 = 170;
                      uint64_t v124 = 170;
                      uint64_t v126 = 43690;
                      uint64_t v122 = 43690;
                      uint64_t v121 = 170;
                      uint64_t v120 = 170;
                      uint64_t v119 = 170;
                      uint64_t v41 = v131;
                    }
                    else
                    {
                      uint64_t v82 = 0;
                      uint64_t v134 = 170;
                      unsigned int v136 = 43690;
                      uint64_t v133 = 170;
                      uint64_t v132 = 170;
                      uint64_t v124 = 170;
                      uint64_t v126 = 43690;
                      uint64_t v122 = 43690;
                      uint64_t v121 = 170;
                      uint64_t v120 = 170;
                      uint64_t v119 = 170;
                    }
                    int v84 = v130;
                    __int16 v18 = (char *)v125;
                    goto LABEL_119;
                  }
                }
                uint64_t v134 = 170;
                unsigned int v136 = 43690;
                uint64_t v133 = 170;
                uint64_t v132 = 170;
                uint64_t v124 = 170;
                uint64_t v126 = 43690;
                uint64_t v122 = 43690;
                uint64_t v121 = 170;
                uint64_t v120 = 170;
                uint64_t v119 = 170;
              }
              else
              {
                uint64_t v132 = 170;
                uint64_t v133 = 170;
                uint64_t v124 = 170;
                uint64_t v126 = 43690;
                uint64_t v122 = 43690;
                uint64_t v120 = 170;
                uint64_t v121 = 170;
                uint64_t v134 = 170;
                uint64_t v119 = 170;
              }
              int v84 = v130;
LABEL_119:
              *(void *)&long long v137 = v82;
              BOOL v79 = v82 == 0;
              unsigned int v123 = v82 != 0;
              int v85 = v32 + v84;
              if (v79) {
                int v85 = 0;
              }
              LODWORD(v130) = v85;
              if (v32)
              {
                uint64_t v86 = v141;
                if (v141)
                {
                  char v87 = 0;
                  int v88 = v18 + 4;
                  do
                  {
                    size_t v89 = 4 * *(unsigned __int8 *)(*(void *)v86 + 1) + 4;
                    memcpy(v88, *(const void **)v86, v89);
                    v88 += v89;
                    ++v87;
                    uint64_t v86 = *(void *)(v86 + 8);
                  }
                  while (v86);
                }
                else
                {
                  char v87 = 0;
                }
                unint64_t v92 = v125;
                *(unsigned char *)unint64_t v125 = -8;
                *(unsigned char *)(v92 + 1) = v87;
                *(_WORD *)(v92 + 2) = bswap32(v32) >> 16;
                __int16 v93 = v140;
                int v94 = v140 - v131;
                size_t v95 = (int)v140 - (int)v131;
                memcpy(v15, v131, v95);
                v15[2] |= 0x200u;
                v15[1] = bswap32(v32 + (bswap32((unsigned __int16)v15[1]) >> 16)) >> 16;
                v15[3] = 0;
                if (v94 < 1)
                {
                  unsigned int v96 = 0;
                }
                else
                {
                  LOWORD(v96) = 0;
                  uint64_t v97 = v94;
                  __int16 v98 = (char *)v15;
                  do
                  {
                    char v99 = *v98++;
                    unsigned int v96 = CRC16Table[(v99 ^ v96)] ^ ((unsigned __int16)(v96 & 0xFF00) >> 8);
                    --v97;
                  }
                  while (v97);
                }
                int v100 = v12 - v94;
                if (v32 >= 1)
                {
                  uint64_t v101 = v32;
                  int v102 = (char *)v125;
                  do
                  {
                    char v103 = *v102++;
                    unsigned int v96 = CRC16Table[(v103 ^ v96)] ^ ((unsigned __int16)(v96 & 0xFF00) >> 8);
                    --v101;
                  }
                  while (v101);
                }
                if (v100 >= 1)
                {
                  v104 = v93;
                  uint64_t v105 = (v12 - v94);
                  do
                  {
                    char v106 = *v104++;
                    unsigned int v96 = CRC16Table[(v106 ^ v96)] ^ ((unsigned __int16)(v96 & 0xFF00) >> 8);
                    --v105;
                  }
                  while (v105);
                }
                v15[3] = bswap32(v96) >> 16;
                int v107 = DWORD2(v150);
                if (DWORD2(v150)) {
                  __int16 v148 = bswap32(v32 + v12) >> 16;
                }
                uint64_t v108 = &v153[SDWORD2(v150)];
                *uint64_t v108 = v15;
                v108[1] = v95;
                v108[2] = v125;
                v108[3] = v32;
                v108[4] = v93;
                v108[5] = v100;
                DWORD2(v150) = v107 + 3;
                uint64_t v41 = v131;
              }
              else
              {
                int v90 = DWORD2(v150);
                if (DWORD2(v150)) {
                  __int16 v148 = bswap32(v12) >> 16;
                }
                __int16 v91 = &v153[SDWORD2(v150)];
                void *v91 = v41;
                v91[1] = v12;
                DWORD2(v150) = v90 + 1;
              }
              unsigned __int8 v42 = v124;
              uint64_t v43 = v126;
              unsigned __int8 v45 = v121;
              unsigned int v44 = v122;
              unsigned __int8 v47 = v119;
              unsigned __int8 v46 = v120;
              int v48 = v130;
              char v39 = v123;
              goto LABEL_51;
            }
          }
          unint64_t v81 = v127;
          uint64_t v41 = v131;
          signed int v32 = 0;
          goto LABEL_106;
        }
        int v23 = 0;
        signed int v32 = 0;
        goto LABEL_103;
      }
    }
    goto LABEL_41;
  }
  int v139 = -1431655766;
  if (a1)
  {
    int v21 = v144;
LABEL_41:
    if (!*((unsigned char *)v21 + 24))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v33 = VRTraceErrorLogLevelToCSTR();
        __int16 v34 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          uint64_t v155 = v33;
          __int16 v156 = 2080;
          int v157 = "OSPFAddDynamicOptions";
          __int16 v158 = 1024;
          int v159 = 1754;
          __int16 v160 = 1024;
          int v161 = v12;
          _os_log_impl(&dword_221563000, v34, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d OSPFAddOptions: fail iOSPFLen == %d)", buf, 0x22u);
        }
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v35 = VRTraceErrorLogLevelToCSTR();
        __int16 v36 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          uint64_t v155 = v35;
          __int16 v156 = 2080;
          int v157 = "OSPFAddDynamicOptions";
          __int16 v158 = 1024;
          int v159 = 1755;
          __int16 v160 = 1024;
          int v161 = v130;
          _os_log_impl(&dword_221563000, v36, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d OSPFAddOptions: iLen == %d)", buf, 0x22u);
        }
      }
    }
  }
  int v37 = DWORD2(v150);
  int v38 = v130;
  if (DWORD2(v150)) {
    __int16 v148 = bswap32(v130) >> 16;
  }
  *(void *)&long long v137 = 0;
  char v39 = 0;
  uint64_t v40 = &v153[SDWORD2(v150)];
  uint64_t v41 = v131;
  *uint64_t v40 = v131;
  v40[1] = v38;
  DWORD2(v150) = v37 + 1;
  uint64_t v134 = 170;
  unsigned int v136 = 43690;
  uint64_t v133 = 170;
  uint64_t v132 = 170;
  unsigned __int8 v42 = -86;
  uint64_t v43 = 43690;
  unsigned int v44 = 43690;
  unsigned __int8 v45 = -86;
  unsigned __int8 v46 = -86;
  unsigned __int8 v47 = -86;
  int v48 = -1431655766;
LABEL_51:
  *(void *)&long long v150 = v153;
  if (v152) {
    free(v152);
  }
  if (v138)
  {
    uint64_t v126 = v43;
    int v49 = (*(uint64_t (**)(void))(v138 + 16))();
    char v50 = v39 ^ 1;
    if (!v49) {
      char v50 = 1;
    }
    if ((v50 & 1) == 0)
    {
      LODWORD(v130) = v41[2];
      LODWORD(v122) = *(_DWORD *)(v127 + 20);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        uint64_t v52 = VRTraceErrorLogLevelToCSTR();
        int v53 = *MEMORY[0x263F21098];
        uint64_t v54 = *MEMORY[0x263F21098];
        if (*MEMORY[0x263F21088])
        {
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136317186;
            uint64_t v155 = v52;
            __int16 v156 = 2080;
            int v157 = "BWE_SendProbePkts";
            __int16 v158 = 1024;
            int v159 = 481;
            __int16 v160 = 1024;
            int v161 = v122;
            __int16 v162 = 1024;
            int v163 = v48;
            __int16 v164 = 1024;
            int v165 = 4 * v47;
            __int16 v166 = 1024;
            int v167 = v45 | (v46 << 8);
            __int16 v168 = 1024;
            unsigned int v169 = bswap32(v44) >> 16;
            __int16 v170 = 1024;
            unsigned int v171 = __rev16(v126);
            _os_log_impl(&dword_221563000, v53, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ****************************************************\nOSPFAddDynamicOption (to %d)  %d bytes optionDataLength: %d\n \t\t wRxEstimate_kbps: %d  wProbeSeqId: %d  wPktIndex: %x  \n****************************************************\n", buf, 0x40u);
          }
        }
        else if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136317186;
          uint64_t v155 = v52;
          __int16 v156 = 2080;
          int v157 = "BWE_SendProbePkts";
          __int16 v158 = 1024;
          int v159 = 481;
          __int16 v160 = 1024;
          int v161 = v122;
          __int16 v162 = 1024;
          int v163 = v48;
          __int16 v164 = 1024;
          int v165 = 4 * v47;
          __int16 v166 = 1024;
          int v167 = v45 | (v46 << 8);
          __int16 v168 = 1024;
          unsigned int v169 = bswap32(v44) >> 16;
          __int16 v170 = 1024;
          unsigned int v171 = __rev16(v126);
          _os_log_debug_impl(&dword_221563000, v53, OS_LOG_TYPE_DEBUG, " [%s] %s:%d ****************************************************\nOSPFAddDynamicOption (to %d)  %d bytes optionDataLength: %d\n \t\t wRxEstimate_kbps: %d  wProbeSeqId: %d  wPktIndex: %x  \n****************************************************\n", buf, 0x40u);
        }
      }
      int v57 = v137;
      if ((int)v137 < 1)
      {
        uint64_t v58 = 0;
      }
      else
      {
        uint64_t v58 = 0;
        LODWORD(v126) = bswap32(v122);
        unint64_t v125 = (unint64_t)&v153[v135 != 0];
        uint64_t v124 = v125 | 8;
        int v59 = 4 * v132;
        size_t v60 = (v59 + 24);
        unint64_t v128 = (unint64_t)(unsigned __int16)v136 << 32;
        LODWORD(v131) = __rev16(v60);
        LODWORD(v121) = v59;
        unsigned int v123 = __rev16(v59 + 8);
        LODWORD(v120) = v134 | (v133 << 8);
        LODWORD(v119) = bswap32(v136) >> 16;
        BOOL v61 = (unint64_t *)0xAAAAAAAAAAAAAAAALL;
        int v62 = 1;
        *(void *)&long long v51 = 136317186;
        long long v118 = v51;
        unint64_t v127 = ((unint64_t)v134 << 24) | ((unint64_t)v133 << 16) | ((unint64_t)v132 << 8) | v42;
        do
        {
          if (v62 == v57) {
            int v63 = 61440;
          }
          else {
            int v63 = 0;
          }
          unsigned __int16 v64 = v63 | v62;
          uint64_t v65 = bswap32(v63 | v62) >> 16;
          if (v62 == 1)
          {
            uint64_t v66 = (char *)malloc_type_calloc(1uLL, v60, 0xD3EB463FuLL);
            if (!v66) {
              break;
            }
            uint64_t v67 = 0;
            LOWORD(v68) = 0;
            uint64_t v58 = v66;
            *(_WORD *)uint64_t v66 = 2497;
            *((_WORD *)v66 + 1) = (_WORD)v131;
            *((_WORD *)v66 + 2) = 512;
            int v69 = v126;
            *((_DWORD *)v66 + 2) = v130;
            *((_DWORD *)v66 + 3) = v69;
            *((_WORD *)v66 + 8) = 504;
            *((_WORD *)v66 + 9) = v123;
            *((_WORD *)v66 + 13) = v65;
            v66[20] = 15;
            BOOL v61 = (unint64_t *)(v66 + 20);
            v66[21] = v132;
            v66[22] = v133;
            v66[23] = v134;
            *((_WORD *)v66 + 12) = v136;
            do
              unsigned int v68 = CRC16Table[(v66[v67++] ^ v68)] ^ ((unsigned __int16)(v68 & 0xFF00) >> 8);
            while (v60 != v67);
            *((_WORD *)v66 + 3) = bswap32(v68) >> 16;
            if (v135)
            {
              __int16 v148 = (__int16)v131;
              int v70 = 2;
            }
            else
            {
              int v70 = 1;
            }
            *(void *)unint64_t v125 = v66;
            *(void *)uint64_t v124 = v60;
            DWORD2(v150) = v70;
            int v71 = v60;
            *(void *)&long long v150 = v153;
          }
          else
          {
            *BOOL v61 = v128 | (v65 << 48) | v127;
            *((_WORD *)v58 + 3) = 0;
            int v71 = v139;
            if (v139 < 1)
            {
              unsigned int v72 = 0;
            }
            else
            {
              LOWORD(v72) = 0;
              uint64_t v73 = v139;
              int v74 = v58;
              do
              {
                char v75 = *v74++;
                unsigned int v72 = CRC16Table[(v75 ^ v72)] ^ ((unsigned __int16)(v72 & 0xFF00) >> 8);
                --v73;
              }
              while (v73);
            }
            *((_WORD *)v58 + 3) = bswap32(v72) >> 16;
          }
          if (!(*(unsigned int (**)(uint64_t, long long *))(v138 + 16))(v138, &v149)) {
            break;
          }
          int v139 = v71;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
          {
            uint64_t v76 = VRTraceErrorLogLevelToCSTR();
            uint64_t v77 = *MEMORY[0x263F21098];
            uint64_t v78 = *MEMORY[0x263F21098];
            if (*MEMORY[0x263F21088])
            {
              if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v118;
                uint64_t v155 = v76;
                __int16 v156 = 2080;
                int v157 = "BWE_SendProbePkts";
                __int16 v158 = 1024;
                int v159 = 540;
                __int16 v160 = 1024;
                int v161 = v122;
                __int16 v162 = 1024;
                int v163 = v139;
                __int16 v164 = 1024;
                int v165 = v121;
                __int16 v166 = 1024;
                int v167 = v120;
                __int16 v168 = 1024;
                unsigned int v169 = v119;
                __int16 v170 = 1024;
                unsigned int v171 = v64;
                _os_log_impl(&dword_221563000, v77, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ****************************************************\nOSPFAddDynamicOption (to %d)  %d bytes optionDataLength: %d\n \t\t wRxEstimate_kbps: %d  wProbeSeqId: %d  wPktIndex: %x  \n****************************************************\n", buf, 0x40u);
              }
            }
            else if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v118;
              uint64_t v155 = v76;
              __int16 v156 = 2080;
              int v157 = "BWE_SendProbePkts";
              __int16 v158 = 1024;
              int v159 = 540;
              __int16 v160 = 1024;
              int v161 = v122;
              __int16 v162 = 1024;
              int v163 = v139;
              __int16 v164 = 1024;
              int v165 = v121;
              __int16 v166 = 1024;
              int v167 = v120;
              __int16 v168 = 1024;
              unsigned int v169 = v119;
              __int16 v170 = 1024;
              unsigned int v171 = v64;
              _os_log_debug_impl(&dword_221563000, v77, OS_LOG_TYPE_DEBUG, " [%s] %s:%d ****************************************************\nOSPFAddDynamicOption (to %d)  %d bytes optionDataLength: %d\n \t\t wRxEstimate_kbps: %d  wProbeSeqId: %d  wPktIndex: %x  \n****************************************************\n", buf, 0x40u);
            }
          }
          int v57 = v137;
          BOOL v79 = v62++ == v137;
        }
        while (!v79);
      }
      free(v58);
      goto LABEL_100;
    }
    if (v49)
    {
LABEL_100:
      uint64_t v55 = v141;
      goto LABEL_101;
    }
  }
  ++*(_DWORD *)(v128 + 32);
  uint64_t v55 = v141;
  if (v141)
  {
    do
    {
      uint64_t v56 = *(void *)(v55 + 8);
      if (*(void *)v55) {
        free(*(void **)v55);
      }
      free((void *)v55);
      uint64_t v55 = v56;
    }
    while (v56);
  }
LABEL_101:
  _Block_object_dispose(&v143, 8);
  return v55;
}

uint64_t __OSPFAddDynamicOptions_block_invoke(uint64_t result, void *a2, int a3)
{
  if (a3 >= 1)
  {
    uint64_t v3 = a3;
    do
    {
      if (*a2) {
        *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
      }
      ++a2;
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t _OSPFParse_ParseNodes(uint64_t a1, uint64_t a2, unsigned int a3, unsigned __int16 *a4, unsigned int a5, _DWORD *a6)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  int v25 = (int)a4;
  LODWORD(v6) = a4;
  if (a3)
  {
    uint64_t v9 = 0;
    __int16 v10 = (_DWORD *)(a2 + 292);
    uint64_t v6 = a4;
    uint64_t v11 = a3;
    while (1)
    {
      unsigned int v12 = a5 - 7;
      if (a5 < 7) {
        return 0;
      }
      uint64_t v13 = a2 + 480 * v9;
      *(_DWORD *)uint64_t v13 = bswap32(*(_DWORD *)v6);
      *(_DWORD *)(v13 + 4) = -1;
      *(_DWORD *)(v13 + 268) = -1;
      *(_WORD *)(v13 + 272) = bswap32(v6[2]) >> 16;
      *(_DWORD *)(v13 + 276) = 1;
      *(_DWORD *)(v13 + 280) = *(_DWORD *)(a1 + 8);
      size_t v14 = *((unsigned __int8 *)v6 + 6);
      *(unsigned char *)(v13 + 8) = v14;
      if (v12 < (int)v14 + 2) {
        return 0;
      }
      __int16 v15 = (char *)v6 + 7;
      memcpy((void *)(a2 + 480 * v9 + 9), (char *)v6 + 7, v14);
      int v16 = &v15[v14];
      *(unsigned char *)(a2 + 480 * v9 + 9 + v14) = 0;
      unsigned int v17 = *(unsigned __int16 *)v16;
      uint64_t v18 = __rev16(v17);
      if (v18 >= 0x11)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v21 = VRTraceErrorLogLevelToCSTR();
          uint64_t v22 = *MEMORY[0x263F21098];
          BOOL v23 = os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT);
          uint64_t result = 0;
          if (!v23) {
            return result;
          }
          *(_DWORD *)buf = 136315906;
          uint64_t v27 = v21;
          __int16 v28 = 2080;
          char v29 = "_OSPFParse_ParseNodes";
          __int16 v30 = 1024;
          int v31 = 1360;
          __int16 v32 = 1024;
          int v33 = v18;
          _os_log_impl(&dword_221563000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Too many neighbors. Count=%d", buf, 0x22u);
        }
        return 0;
      }
      a5 = v12 - v14 - 2;
      *(_DWORD *)(a2 + 480 * v9 + 284) = v18;
      if (a5 < 8 * (int)v18) {
        return 0;
      }
      uint64_t v6 = (unsigned __int16 *)(v16 + 2);
      if (v17)
      {
        char v19 = v10;
        do
        {
          *(v19 - 1) = bswap32(*(_DWORD *)v6);
          *char v19 = bswap32(*((_DWORD *)v6 + 1));
          v19 += 3;
          v6 += 4;
          a5 -= 8;
          --v18;
        }
        while (v18);
      }
      ++v9;
      v10 += 120;
      if (v9 == v11) {
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    *a6 = v6 - v25;
    return 1;
  }
}

uint64_t TimingLog(int a1, int a2, uint64_t a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  double v6 = micro();
  double v7 = v6;
  if (a2)
  {
    g_resetTime = *(void *)&v6;
    pthread_mutex_lock(&g_xTimingLog);
    if (a1 != 3)
    {
      if (a1 == 2)
      {
        fprintf((FILE *)*MEMORY[0x263EF8348], "**TIME** %0.3lf (T0 ---): %s\n");
      }
      else if (a1 == 1)
      {
        NSLog(&cfstr_Time03lfT0S.isa, *(void *)&v7, a3);
      }
      return pthread_mutex_unlock(&g_xTimingLog);
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return pthread_mutex_unlock(&g_xTimingLog);
    }
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x263F21098];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT)) {
      return pthread_mutex_unlock(&g_xTimingLog);
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v17 = v8;
    __int16 v18 = 2080;
    char v19 = "TimingLog";
    __int16 v20 = 1024;
    int v21 = 28;
    __int16 v22 = 2048;
    double v23 = v7;
    __int16 v24 = 2080;
    double v25 = *(double *)&a3;
    __int16 v10 = " [%s] %s:%d **TIME** %0.3lf (T0 ---): %s";
    uint64_t v11 = v9;
    uint32_t v12 = 48;
LABEL_18:
    _os_log_impl(&dword_221563000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
    return pthread_mutex_unlock(&g_xTimingLog);
  }
  pthread_mutex_lock(&g_xTimingLog);
  switch(a1)
  {
    case 3:
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return pthread_mutex_unlock(&g_xTimingLog);
      }
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      size_t v14 = *MEMORY[0x263F21098];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT)) {
        return pthread_mutex_unlock(&g_xTimingLog);
      }
      *(_DWORD *)buf = 136316418;
      uint64_t v17 = v13;
      __int16 v18 = 2080;
      char v19 = "TimingLog";
      __int16 v20 = 1024;
      int v21 = 45;
      __int16 v22 = 2048;
      double v23 = v7;
      __int16 v24 = 2048;
      double v25 = v7 - *(double *)&g_resetTime;
      __int16 v26 = 2080;
      uint64_t v27 = a3;
      __int16 v10 = " [%s] %s:%d **TIME** %0.3lf (T+%0.3lf): %s";
      uint64_t v11 = v14;
      uint32_t v12 = 58;
      goto LABEL_18;
    case 2:
      fprintf((FILE *)*MEMORY[0x263EF8348], "**TIME** %0.3lf (T+%0.3lf): %s\n");
      break;
    case 1:
      NSLog(&cfstr_Time03lfT03lfS.isa, *(void *)&v7, v7 - *(double *)&g_resetTime, a3);
      break;
  }
  return pthread_mutex_unlock(&g_xTimingLog);
}

void UpdateRxEstimate(uint64_t a1, int a2, int a3, int *a4, double a5, double a6, double a7)
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 356))
  {
    UpdateRxEstimate_v1(a1, a2, a3, a4, a5, a6, a7);
    *(void *)(a1 + 264) = *(void *)(a1 + 320);
    return;
  }
  if (*(unsigned char *)(a1 + 357))
  {
    int v59 = -1;
    UpdateRxEstimate_v1(a1, a2, a3, &v59, a5, a6, a7);
  }
  int v14 = *(_DWORD *)(a1 + 92);
  if (v14 == 2) {
    int v15 = 0;
  }
  else {
    int v15 = 3;
  }
  double v16 = *(double *)(a1 + 264);
  if (v16 != 0.0)
  {
    if (!a2 || a3 < 250) {
      return;
    }
    if (dbl_2215E8C40[v14 == 2] <= a6)
    {
      *(_DWORD *)(a1 + 296) = 0;
    }
    else
    {
      int v22 = *(_DWORD *)(a1 + 296);
      if (v22 < v15) {
        *(_DWORD *)(a1 + 296) = ++v22;
      }
      if (v22 < v15) {
        return;
      }
    }
  }
  if (a5 <= 0.0) {
    return;
  }
  if (dbl_2215E8C50[v14 == 2] >= a5) {
    double v17 = a5;
  }
  else {
    double v17 = dbl_2215E8C50[v14 == 2];
  }
  *(double *)(a1 + 464) = *(double *)(a1 + 464) + a5;
  ++*(_DWORD *)(a1 + 472);
  if (v14 != 2)
  {
    if (v14 == 1) {
      unsigned int v20 = 4;
    }
    else {
      unsigned int v20 = 3;
    }
    double v21 = 0.0;
    double v19 = 4.0;
    if (v14 != 1) {
      double v19 = 0.0;
    }
    double v18 = v19;
LABEL_30:
    BOOL v23 = v17 <= v16 * 0.5;
    if (v16 - v17 > 200000.0) {
      BOOL v23 = 1;
    }
    BOOL v24 = v17 - v16 > 200000.0 || v17 >= v16 * 1.5;
    BOOL v25 = v16 - v17 > v21 && v23;
    BOOL v26 = v17 - v16 > v21 && v24;
    if (v16 == 0.0)
    {
      int v27 = 0;
      double v28 = 100000.0;
      if (v17 >= 100000.0) {
        double v28 = v17;
      }
      *(double *)(a1 + 264) = v28;
      goto LABEL_98;
    }
    if (!v25 && !v26)
    {
      if (v14 == 2)
      {
        uint64_t v33 = *(unsigned int *)(a1 + 220);
        if ((int)v33 >= 1)
        {
          uint64_t v34 = (int *)(a1 + 100);
          do
          {
            int v35 = *v34++;
            double v16 = (double)v35 * 0.05 + v16 * 0.95;
            --v33;
          }
          while (v33);
          *(_DWORD *)(a1 + 220) = 0;
        }
        double v36 = v17 * 0.075;
        double v37 = 0.925;
      }
      else
      {
        double v36 = v17 * 0.1;
        double v37 = 0.9;
      }
      *(double *)(a1 + 264) = v36 + v16 * v37;
      *(_DWORD *)(a1 + 280) = 0;
      int v27 = 1;
      *(void *)(a1 + 272) = 0;
      goto LABEL_98;
    }
    if ((v14 - 1) > 1)
    {
      BOOL v29 = 0;
    }
    else
    {
      if (*(int *)(a1 + 280) < 0) {
        double v19 = v18;
      }
      BOOL v29 = a7 - *(double *)(a1 + 288) < v19;
    }
    if (v25)
    {
      int v38 = *(_DWORD *)(a1 + 280);
      if (v38 < 0)
      {
        int v39 = v38 - 1;
      }
      else
      {
        *(void *)(a1 + 272) = 0;
        *(double *)(a1 + 288) = a7;
        int v39 = -1;
      }
      *(_DWORD *)(a1 + 280) = v39;
      int v42 = -10;
    }
    else
    {
      if (!v26)
      {
LABEL_76:
        double v43 = v17 + *(double *)(a1 + 272);
        *(double *)(a1 + 272) = v43;
        int v44 = *(_DWORD *)(a1 + 280);
        if (v44 < 0) {
          int v44 = -v44;
        }
        if (v14 == 2)
        {
          uint64_t v45 = *(int *)(a1 + 220);
          if ((int)v45 <= 29)
          {
            *(_DWORD *)(a1 + 4 * v45 + 100) = (int)v17;
            ++*(_DWORD *)(a1 + 220);
          }
          char v46 = v44 < v20 || v29;
          if (v46) {
            goto LABEL_99;
          }
          double v47 = v43 / (double)v44;
          if ((*(_DWORD *)(a1 + 280) & 0x80000000) == 0) {
            double v47 = v47 * 0.9 + v16 * 0.1;
          }
        }
        else
        {
          char v48 = v44 < v20 || v29;
          if (v48)
          {
LABEL_99:
            if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
            {
              uint64_t v50 = VRTraceErrorLogLevelToCSTR();
              long long v51 = *MEMORY[0x263F21098];
              uint64_t v52 = *MEMORY[0x263F21098];
              if (*MEMORY[0x263F21088])
              {
                if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
                {
                  int v53 = (int)*(double *)(a1 + 264);
                  int v54 = *a4;
                  int v55 = *(_DWORD *)(a1 + 280);
                  int v59 = 136316674;
                  uint64_t v60 = v50;
                  __int16 v61 = 2080;
                  int v62 = "UpdateRxEstimate";
                  __int16 v63 = 1024;
                  int v64 = 817;
                  __int16 v65 = 1024;
                  int v66 = (int)v17;
                  __int16 v67 = 1024;
                  int v68 = v53;
                  __int16 v69 = 1024;
                  int v70 = v54;
                  __int16 v71 = 1024;
                  int v72 = v55;
                  _os_log_impl(&dword_221563000, v51, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d \t\t\t\t\t\t\t\t ------ dBWD: %d Rx: %d  \t %d %d", (uint8_t *)&v59, 0x34u);
                }
              }
              else if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
              {
                int v56 = (int)*(double *)(a1 + 264);
                int v57 = *a4;
                int v58 = *(_DWORD *)(a1 + 280);
                int v59 = 136316674;
                uint64_t v60 = v50;
                __int16 v61 = 2080;
                int v62 = "UpdateRxEstimate";
                __int16 v63 = 1024;
                int v64 = 817;
                __int16 v65 = 1024;
                int v66 = (int)v17;
                __int16 v67 = 1024;
                int v68 = v56;
                __int16 v69 = 1024;
                int v70 = v57;
                __int16 v71 = 1024;
                int v72 = v58;
                _os_log_debug_impl(&dword_221563000, v51, OS_LOG_TYPE_DEBUG, " [%s] %s:%d \t\t\t\t\t\t\t\t ------ dBWD: %d Rx: %d  \t %d %d", (uint8_t *)&v59, 0x34u);
              }
            }
            return;
          }
          double v47 = v43 / (double)v44;
        }
        *(double *)(a1 + 264) = v47;
        *(_DWORD *)(a1 + 280) = 0;
        *(void *)(a1 + 272) = 0;
        if (*a4 == -10) {
          int v49 = -100;
        }
        else {
          int v49 = 200;
        }
        if (*a4 == 10) {
          int v27 = 100;
        }
        else {
          int v27 = v49;
        }
LABEL_98:
        *a4 = v27;
        goto LABEL_99;
      }
      int v40 = *(_DWORD *)(a1 + 280);
      if (v40 <= 0)
      {
        *(void *)(a1 + 272) = 0;
        *(double *)(a1 + 288) = a7;
        int v41 = 1;
      }
      else
      {
        int v41 = v40 + 1;
      }
      *(_DWORD *)(a1 + 280) = v41;
      int v42 = 10;
    }
    *a4 = v42;
    goto LABEL_76;
  }
  if (*(unsigned char *)(a1 + 97))
  {
    double v18 = 7.0;
    double v19 = 10.0;
    unsigned int v20 = 6;
    double v21 = 100000.0;
    goto LABEL_30;
  }
  double v30 = 200000.0;
  if (v17 <= 200000.0) {
    double v30 = v17;
  }
  double v31 = v30 + *(double *)(a1 + 272);
  *(double *)(a1 + 272) = v31;
  int v32 = *(_DWORD *)(a1 + 280);
  *(_DWORD *)(a1 + 280) = v32 + 1;
  if (v32 > 8 || a7 - *(double *)(a1 + 288) >= 7.0)
  {
    *(unsigned char *)(a1 + 97) = 1;
    *(double *)(a1 + 264) = v31 / (double)(v32 + 1);
    *(void *)(a1 + 288) = 0;
    *(_DWORD *)(a1 + 280) = 0;
  }
}

uint64_t UpdateRxEstimate_v1(uint64_t result, int a2, int a3, int *a4, double a5, double a6, double a7)
{
  double v8 = *(double *)(result + 320);
  if (v8 != 0.0)
  {
    if (!a2 || a3 < 250) {
      return result;
    }
    if (a6 >= 0.008)
    {
      *(_DWORD *)(result + 352) = 0;
    }
    else
    {
      int v14 = *(_DWORD *)(result + 352);
      if (v14 <= 2)
      {
        *(_DWORD *)(result + 352) = v14 + 1;
        if (v14 != 2) {
          return result;
        }
      }
    }
  }
  if (a5 <= 0.0) {
    return result;
  }
  double v9 = 2300000.0;
  if (a5 <= 2300000.0) {
    double v9 = a5;
  }
  BOOL v10 = v9 <= v8 * 0.5;
  if (v8 - v9 > 200000.0) {
    BOOL v10 = 1;
  }
  BOOL v11 = v9 >= v8 * 1.5;
  if (v9 - v8 > 200000.0) {
    BOOL v11 = 1;
  }
  if (v8 == 0.0)
  {
    int v12 = 0;
    double v13 = 100000.0;
    if (v9 >= 100000.0) {
      double v13 = v9;
    }
    *(double *)(result + 320) = v13;
    goto LABEL_43;
  }
  if (!v10 && !v11)
  {
    *(double *)(result + 320) = v9 * 0.1 + v8 * 0.9;
    *(_DWORD *)(result + 336) = 0;
    *(void *)(result + 328) = 0;
    int v12 = 1;
LABEL_43:
    *a4 = v12;
    return result;
  }
  if (v10)
  {
    int v15 = *(_DWORD *)(result + 336);
    if (v15 < 0)
    {
      int v16 = v15 - 1;
    }
    else
    {
      *(void *)(result + 328) = 0;
      *(double *)(result + 344) = a7;
      int v16 = -1;
    }
    *(_DWORD *)(result + 336) = v16;
    int v19 = -10;
  }
  else
  {
    if (!v11) {
      goto LABEL_34;
    }
    int v17 = *(_DWORD *)(result + 336);
    if (v17 <= 0)
    {
      *(void *)(result + 328) = 0;
      *(double *)(result + 344) = a7;
      int v18 = 1;
    }
    else
    {
      int v18 = v17 + 1;
    }
    *(_DWORD *)(result + 336) = v18;
    int v19 = 10;
  }
  *a4 = v19;
LABEL_34:
  double v20 = v9 + *(double *)(result + 328);
  *(double *)(result + 328) = v20;
  int v21 = *(_DWORD *)(result + 336);
  if (v21 < 0) {
    int v21 = -v21;
  }
  if (v21 >= 3)
  {
    *(double *)(result + 320) = v20 / (double)v21;
    *(_DWORD *)(result + 336) = 0;
    *(void *)(result + 328) = 0;
    if (*a4 == -10) {
      int v22 = -100;
    }
    else {
      int v22 = 200;
    }
    if (*a4 == 10) {
      int v12 = 100;
    }
    else {
      int v12 = v22;
    }
    goto LABEL_43;
  }
  return result;
}

void GCK_BWE_CalcRxEstimate()
{
}

uint64_t BWEstCheckIfLargeFrameNeeded(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  double v2 = micro();
  if (*(double *)(a1 + 360) == 0.0)
  {
    *(double *)(a1 + 400) = v2;
    double v3 = v2;
  }
  else
  {
    double v3 = *(double *)(a1 + 400);
  }
  double v4 = v2 - v3;
  double v5 = 2.0;
  if (v4 >= 10.0 && *(int *)(a1 + 408) >= 5) {
    double v5 = 10.0;
  }
  if (*(unsigned char *)(a1 + 416)) {
    *(unsigned char *)(a1 + 416) = 0;
  }
  unsigned int v6 = 5 * *(_DWORD *)(a1 + 8);
  unsigned int v7 = (v6 >> 1) & 0x1FFFFFFF;
  if (((v6 >> 2) & 0xFFFFFFF) < 0x55F)
  {
    unsigned int v9 = 20 * *(_DWORD *)(a1 + 8);
    unsigned int v10 = v9 >> 4;
    if (v9 <= 0x897) {
      unsigned int v7 = 257;
    }
    if (v10 <= 0x100) {
      int v11 = 256;
    }
    else {
      int v11 = v9 >> 4;
    }
    if (v9 >= 0xFA0) {
      int v12 = 2;
    }
    else {
      int v12 = 1;
    }
    if (v9 >= 0xFA0) {
      unsigned int v7 = v11 + 1;
    }
    if (v10 >= 0x36B) {
      unsigned int v8 = 3;
    }
    else {
      unsigned int v8 = v12;
    }
    if (v10 >= 0x36B) {
      unsigned int v7 = (unsigned __int16)(20 * *(_WORD *)(a1 + 8)) / 0x18u + 1;
    }
  }
  else
  {
    unsigned int v8 = 2;
    do
      ++v8;
    while (v7 / v8 > *(_DWORD *)(a1 + 84));
    unsigned int v7 = v7 / v8 + 1;
  }
  *(_DWORD *)(a1 + 388) = v7;
  *(_DWORD *)(a1 + 392) = v8;
  uint64_t v13 = v7 * v8;
  *(_DWORD *)(a1 + 380) = v13;
  if (v2 - *(double *)(a1 + 368) < v5) {
    return 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    int v15 = *MEMORY[0x263F21098];
    int v16 = *MEMORY[0x263F21098];
    if (*MEMORY[0x263F21088])
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 136315906;
        uint64_t v19 = v14;
        __int16 v20 = 2080;
        int v21 = "BWEstCheckIfLargeFrameNeeded";
        __int16 v22 = 1024;
        int v23 = 1730;
        __int16 v24 = 1024;
        int v25 = v13;
        _os_log_impl(&dword_221563000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ^^^^^ LARGE frame req'd of %d ", (uint8_t *)&v18, 0x22u);
      }
    }
    else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      BWEstCheckIfLargeFrameNeeded_cold_1();
    }
  }
  return v13;
}

void GCK_BWE_TrackLargeFrameState()
{
  uint64_t v0 = *MEMORY[0x263EF8340];
  CheckInHandleDebug();
}

uint64_t GCK_BWE_CreateHandle()
{
  if (malloc_type_calloc(1uLL, 0x2B8uLL, 0x1000040040ACAD7uLL)) {
    CreateHandle();
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
  {
    VRTraceErrorLogLevelToCSTR();
    if (VRTraceIsOSFaultDisabled())
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        GCK_BWE_CreateHandle_cold_1();
      }
    }
    else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_FAULT))
    {
      GCK_BWE_CreateHandle_cold_2();
    }
  }
  return 2149908483;
}

void GCK_BWE_CloseHandle()
{
  uint64_t v0 = *MEMORY[0x263EF8340];
  CheckInHandleDebug();
}

void GCK_BWE_GetProbeSeqSize()
{
}

void sub_2215C8D74(_Unwind_Exception *exception_object)
{
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

double convertTimeoutToRelativeTimespec(double a1)
{
  return (a1 - (double)(int)a1) * 1000000000.0;
}

void gkDiscoveryBrowseCallback(int a1, int a2, uint32_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  DNSServiceRef sdRef = (DNSServiceRef)0xAAAAAAAAAAAAAAAALL;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    int v16 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136317442;
      *(void *)&uint8_t buf[4] = v15;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "gkDiscoveryBrowseCallback";
      *(_WORD *)&unsigned char buf[22] = 1024;
      LODWORD(v32) = 253;
      WORD2(v32) = 1024;
      *(_DWORD *)((char *)&v32 + 6) = a1;
      WORD5(v32) = 1024;
      HIDWORD(v32) = a2;
      LOWORD(v33) = 1024;
      *(_DWORD *)((char *)&v33 + 2) = a3;
      HIWORD(v33) = 1024;
      int v34 = a4;
      __int16 v35 = 2080;
      uint64_t v36 = a5;
      __int16 v37 = 2080;
      uint64_t v38 = a6;
      __int16 v39 = 2080;
      uint64_t v40 = a7;
      _os_log_impl(&dword_221563000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d bonjour browse callback - sdRef=%x, flags=%x, interfaceIndex=%d, errorCode=%d, serviceName=%s, regtype=%s, replyDomain=%s", buf, 0x52u);
    }
  }
  if (a8)
  {
    if (a4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
          gkDiscoveryBrowseCallback_cold_6();
        }
      }
      return;
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3052000000;
    *(void *)&long long v32 = __Block_byref_object_copy__0;
    *((void *)&v32 + 1) = __Block_byref_object_dispose__0;
    uint64_t v33 = a8;
    if (a5) {
      uint64_t v17 = [NSString stringWithUTF8String:a5];
    }
    else {
      uint64_t v17 = 0;
    }
    unsigned int v18 = a2 & 2;
    if (!v18)
    {
      if ([*(id *)(*(void *)&buf[8] + 40) browseCallback])
      {
        uint64_t v19 = [*(id *)(*(void *)&buf[8] + 40) browseCallback];
        (*(void (**)(uint64_t, void, uint64_t, void, void, void))(v19 + 16))(v19, 0, v17, a3, 0, 0);
      }
LABEL_43:
      _Block_object_dispose(buf, 8);
      return;
    }
    if (a5 && a6 && a7)
    {
      __int16 v20 = objc_msgSend(NSString, "stringWithFormat:", @"%s.%s%s", a5, a6, a7);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v21 = VRTraceErrorLogLevelToCSTR();
        __int16 v22 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          if (v20) {
            int v23 = (const char *)objc_msgSend((id)objc_msgSend(v20, "description"), "UTF8String");
          }
          else {
            int v23 = "<nil>";
          }
          *(_DWORD *)int v41 = 136315906;
          uint64_t v42 = v21;
          __int16 v43 = 2080;
          int v44 = "generateFullName";
          __int16 v45 = 1024;
          int v46 = 236;
          __int16 v47 = 2080;
          char v48 = v23;
          _os_log_impl(&dword_221563000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d gkDiscovery: generated fullname %s for TxT record", v41, 0x26u);
        }
      }
      if (v20)
      {
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __gkDiscoveryBrowseCallback_block_invoke;
        v26[3] = &unk_2645B83B0;
        char v29 = v18 >> 1;
        v26[4] = v17;
        v26[5] = buf;
        uint32_t v27 = a3;
        int v28 = 0;
        __int16 v24 = (void *)[v26 copy];
        if (DNSServiceQueryRecord(&sdRef, 0x20000u, a3, (const char *)[v20 UTF8String], 0x10u, 1u, (DNSServiceQueryRecordReply)gkDiscoveryTxtCallback, v24))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
              gkDiscoveryBrowseCallback_cold_4();
            }
          }
        }
        else if (DNSServiceSetDispatchQueue(sdRef, MEMORY[0x263EF83A0]))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
              gkDiscoveryBrowseCallback_cold_3();
            }
          }
        }
        goto LABEL_43;
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        gkDiscoveryBrowseCallback_cold_5();
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        gkDiscoveryBrowseCallback_cold_2();
      }
    }
    goto LABEL_43;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
      gkDiscoveryBrowseCallback_cold_1();
    }
  }
}

void sub_2215CEF0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void gkDiscoveryResolveCallback(int a1, int a2, uint32_t a3, uint64_t a4, uint64_t a5, const char *a6, unsigned int a7, int a8, uint64_t a9, void *a10)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v17 = VRTraceErrorLogLevelToCSTR();
    unsigned int v18 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136317698;
      *(void *)&uint8_t buf[4] = v17;
      __int16 v33 = 2080;
      int v34 = "gkDiscoveryResolveCallback";
      __int16 v35 = 1024;
      int v36 = 401;
      __int16 v37 = 1024;
      int v38 = a1;
      __int16 v39 = 1024;
      int v40 = a2;
      __int16 v41 = 1024;
      uint32_t v42 = a3;
      __int16 v43 = 1024;
      int v44 = a4;
      __int16 v45 = 2080;
      uint64_t v46 = a5;
      __int16 v47 = 2080;
      char v48 = a6;
      __int16 v49 = 1024;
      unsigned int v50 = __rev16(a7);
      __int16 v51 = 1024;
      int v52 = a8;
      _os_log_impl(&dword_221563000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d bonjour resolve callback - sdRef=%x, flags=%x, interfaceIndex=%d, errorCode=%d, fullname=%s, hosttarget=%s, port=%d, txtLen=%d", buf, 0x54u);
    }
  }
  if (a10)
  {
    uint64_t v19 = objc_msgSend((id)objc_msgSend(a10, "context"), "resolveContainersSyncQueue");
    uint64_t v20 = [a10 resolveCompletionHandler];
    uint64_t v21 = v20;
    if (a4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
          gkDiscoveryResolveCallback_cold_4();
        }
      }
      (*(void (**)(uint64_t, void, void, void, uint64_t))(v21 + 16))(v21, 0, 0, 0, a4);
      return;
    }
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __gkDiscoveryResolveCallback_block_invoke;
    v30[3] = &unk_2645B83D8;
    v30[4] = v20;
    __int16 v31 = a7;
    __int16 v22 = (void *)[v30 copy];
    *(void *)buf = 0;
    DNSServiceErrorType AddrInfo = DNSServiceGetAddrInfo((DNSServiceRef *)buf, 0x20000u, a3, 0, a6, (DNSServiceGetAddrInfoReply)gkDiscoveryGetAddrCallback, v22);
    if (AddrInfo || (DNSServiceErrorType v25 = DNSServiceSetDispatchQueue(*(DNSServiceRef *)buf, v19)) == 0)
    {
      if (*(void *)buf)
      {
        __int16 v24 = (void *)[a10 serviceRefList];
        objc_msgSend(v24, "addObject:", objc_msgSend(MEMORY[0x263F08D40], "valueWithPointer:", *(void *)buf));
      }
      if (!AddrInfo) {
        return;
      }
    }
    else
    {
      DNSServiceErrorType v26 = v25;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
          gkDiscoveryResolveCallback_cold_3();
        }
      }
      if (*(void *)buf)
      {
        DNSServiceRefDeallocate(*(DNSServiceRef *)buf);
        *(void *)buf = 0;
      }
      DNSServiceErrorType AddrInfo = v26;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3
      && (VRTraceErrorLogLevelToCSTR(), os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)))
    {
      gkDiscoveryResolveCallback_cold_2();
      if (!v21) {
        return;
      }
    }
    else if (!v21)
    {
      return;
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __gkDiscoveryResolveCallback_block_invoke_133;
    block[3] = &unk_2645B8360;
    block[4] = v21;
    DNSServiceErrorType v29 = AddrInfo;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
      gkDiscoveryResolveCallback_cold_1();
    }
  }
}

void sub_2215D07D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void gkDiscoveryRegisterCallback(int a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    uint64_t v15 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136317186;
      uint64_t v17 = v14;
      __int16 v18 = 2080;
      uint64_t v19 = "gkDiscoveryRegisterCallback";
      __int16 v20 = 1024;
      int v21 = 738;
      __int16 v22 = 1024;
      int v23 = a1;
      __int16 v24 = 1024;
      int v25 = a2;
      __int16 v26 = 1024;
      int v27 = a3;
      __int16 v28 = 2080;
      uint64_t v29 = a4;
      __int16 v30 = 2080;
      uint64_t v31 = a5;
      __int16 v32 = 2080;
      uint64_t v33 = a6;
      _os_log_impl(&dword_221563000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d bonjour register callback - sdRef=%x, flags=%x, errorCode=%d, name=%s, regtype=%s, domain=%s", (uint8_t *)&v16, 0x4Cu);
    }
  }
  if (a3)
  {
    if (a3 == -65548)
    {
      (*(void (**)(uint64_t))(a7 + 16))(a7);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        gkDiscoveryRegisterCallback_cold_1();
      }
    }
  }
}

uint64_t __gkDiscoveryBrowseCallback_block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) browseCallback];
  if (result)
  {
    double v3 = *(uint64_t (**)(void))([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) browseCallback]
                             + 16);
    return v3();
  }
  return result;
}

void gkDiscoveryTxtCallback(uint64_t a1, int a2, int a3, int a4, uint64_t a5, int a6, int a7, int a8, const void *a9, int a10, void (**a11)(void, void))
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v18 = VRTraceErrorLogLevelToCSTR();
    uint64_t v19 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136317954;
      *(void *)&uint8_t buf[4] = v18;
      *(_WORD *)&unsigned char buf[12] = 2080;
      *(void *)&buf[14] = "gkDiscoveryTxtCallback";
      *(_WORD *)&unsigned char buf[22] = 1024;
      *(_DWORD *)&unsigned char buf[24] = 190;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = a1;
      *(_WORD *)&buf[34] = 1024;
      *(_DWORD *)&buf[36] = a2;
      *(_WORD *)&unsigned char buf[40] = 1024;
      *(_DWORD *)&buf[42] = a3;
      *(_WORD *)&buf[46] = 1024;
      LODWORD(v32) = a4;
      WORD2(v32) = 2080;
      *(void *)((char *)&v32 + 6) = a5;
      HIWORD(v32) = 1024;
      LODWORD(v33) = a6;
      WORD2(v33) = 1024;
      *(_DWORD *)((char *)&v33 + 6) = a7;
      WORD5(v33) = 1024;
      HIDWORD(v33) = a8;
      LOWORD(v34) = 1024;
      *(_DWORD *)((char *)&v34 + 2) = a10;
      _os_log_impl(&dword_221563000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d bonjour txt callback - sdRef=%x, flags=%x, interfaceIndex=%d, errorCode=%d, fullname=%s, rrtype=%u, rrclass=%u, rdlen=%u, ttl=%u", buf, 0x56u);
    }
  }
  if (a11)
  {
    if (a4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
          gkDiscoveryTxtCallback_cold_2();
        }
      }
    }
    __int16 v20 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a1);
    if (TXTRecordGetCount(a8, a9))
    {
      uint16_t v21 = 0;
      do
      {
        *(void *)&long long v22 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v22 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v43 = v22;
        long long v44 = v22;
        long long v41 = v22;
        long long v42 = v22;
        long long v39 = v22;
        long long v40 = v22;
        long long v37 = v22;
        long long v38 = v22;
        long long v35 = v22;
        long long v36 = v22;
        long long v33 = v22;
        long long v34 = v22;
        *(_OWORD *)&buf[32] = v22;
        long long v32 = v22;
        *(_OWORD *)buf = v22;
        *(_OWORD *)&buf[16] = v22;
        uint8_t valueLen = -86;
        value = (void *)0xAAAAAAAAAAAAAAAALL;
        TXTRecordGetItemAtIndex(a8, a9, v21, 0x100u, buf, &valueLen, (const void **)&value);
        int v23 = (void *)[NSString stringWithUTF8String:buf];
        id v24 = [NSString alloc];
        id v25 = (id)[v24 initWithBytes:value length:valueLen encoding:4];
        if (v23)
        {
          id v26 = v25;
          if ([v23 length])
          {
            if (v26) {
              [v20 setObject:v26 forKeyedSubscript:v23];
            }
          }
        }
        ++v21;
      }
      while (TXTRecordGetCount(a8, a9) > v21);
    }
    ((void (**)(void, void *))a11)[2](a11, v20);
    if ((a2 & 1) == 0)
    {
      if (sdRef) {
        DNSServiceRefDeallocate(sdRef);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
      gkDiscoveryTxtCallback_cold_1();
    }
  }
}

uint64_t __gkDiscoveryResolveCallback_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, uint64_t, uint64_t, void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, a3, *(unsigned __int16 *)(a1 + 40), a4);
}

void gkDiscoveryGetAddrCallback(int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int8 *a6, int a7, void (**a8)(void, void, void, void))
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  if (a8)
  {
    if (a4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
          gkDiscoveryGetAddrCallback_cold_2();
        }
      }
      a8[2](a8, 0, 0, a4);
      return;
    }
    *(_OWORD *)long long v43 = 0u;
    memset(v44, 0, sizeof(v44));
    int v16 = a6[1];
    if (v16 == 30)
    {
      uint64_t v17 = a6 + 8;
      uint64_t v18 = v43;
      int v19 = 30;
      socklen_t v20 = 46;
    }
    else
    {
      if (v16 != 2)
      {
        uint64_t v18 = "unknown address";
LABEL_16:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v21 = VRTraceErrorLogLevelToCSTR();
          long long v22 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            int v23 = 136317442;
            uint64_t v24 = v21;
            __int16 v25 = 2080;
            id v26 = "gkDiscoveryGetAddrCallback";
            __int16 v27 = 1024;
            int v28 = 378;
            __int16 v29 = 1024;
            int v30 = a1;
            __int16 v31 = 1024;
            int v32 = a2;
            __int16 v33 = 1024;
            int v34 = a3;
            __int16 v35 = 1024;
            int v36 = 0;
            __int16 v37 = 2080;
            uint64_t v38 = a5;
            __int16 v39 = 2080;
            long long v40 = v18;
            __int16 v41 = 1024;
            int v42 = a7;
            _os_log_impl(&dword_221563000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d bonjour getAddr callback - sdRef=%x, flags=%x, interfaceIndex=%d, errorCode=%d, hostname=%s, sockaddr=%s, ttl=%d", (uint8_t *)&v23, 0x4Eu);
          }
        }
        ((void (**)(void, uint64_t, unsigned __int8 *, void))a8)[2](a8, a3, a6, 0);
        if ((a2 & 1) == 0) {

        }
        return;
      }
      uint64_t v17 = a6 + 4;
      uint64_t v18 = v43;
      int v19 = 2;
      socklen_t v20 = 16;
    }
    inet_ntop(v19, v17, v43, v20);
    goto LABEL_16;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
      gkDiscoveryGetAddrCallback_cold_1();
    }
  }
}

uint64_t __gkDiscoveryResolveCallback_block_invoke_133(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, 0, 0, *(unsigned int *)(a1 + 40));
}

void *copysockaddr(unsigned __int8 *a1)
{
  int v2 = a1[1];
  if (v2 == 2)
  {
    size_t v3 = 16;
  }
  else
  {
    if (v2 != 30) {
      return 0;
    }
    size_t v3 = 28;
  }
  double v4 = malloc_type_malloc(v3, 0xAD7D1E36uLL);
  double v5 = v4;
  if (v4) {
    memcpy(v4, a1, v3);
  }
  return v5;
}

void sub_2215D9360(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2215D93C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void AGPSendingSetElement::remove(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  double v5 = "remove";
  __int16 v6 = 1024;
  int v7 = 802;
  _os_log_error_impl(&dword_221563000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d ERROR: CAN'T UPDATE (BAD TIMESTAMP) !!!!!!!!!!!!", (uint8_t *)&v2, 0x1Cu);
}

void TracePrintChanStats_cold_1()
{
  OUTLINED_FUNCTION_10_0();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x26u);
}

void TracePrintChanStats_cold_2()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_16(&dword_221563000, v0, v1, " [%s] %s:%d ====>        (ndst %d)", v2, v3, v4, v5);
}

void TracePrintChanStats_cold_3()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_10_0();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x30u);
}

void TracePrintChanStats_cold_4()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_10_0();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x3Au);
}

void TracePrintChanStats_cold_5()
{
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_10_0();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x28u);
}

void TracePrintChanStats_cold_6()
{
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_10_0();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x36u);
}

void TracePrintChanStats_cold_7()
{
  OUTLINED_FUNCTION_24();
  *(_WORD *)&v4[4] = v0;
  *(void *)&v4[6] = "TracePrintChanStats";
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_26(&dword_221563000, v1, v2, " [%s] %s:%d ====>        (peerID %08X type %d rsvd %d)", v3, *(const char **)v4, (unint64_t)"TracePrintChanStats" >> 16, v5, v6, v7);
}

void TracePrintChanStats_cold_8()
{
  OUTLINED_FUNCTION_24();
  *(_WORD *)&v4[4] = v0;
  *(void *)&v4[6] = "TracePrintChanStats";
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_26(&dword_221563000, v1, v2, " [%s] %s:%d ====> report (hostID %08X iIFIndex %d chanID %d)", v3, *(const char **)v4, (unint64_t)"TracePrintChanStats" >> 16, v5, v6, v7);
}

void GCKSession_TrimLocalInterfaceList_cold_1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7_0(&dword_221563000, v0, v1, " [%s] %s:%d InterfaceFilter not trimming interfaces for local gaming.", v2, v3, v4, v5, v6);
}

void GCKSession_TrimLocalInterfaceList_cold_2()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d ipPortList must not be nil and ipPortListCount must not be nil. Skip interface list trimming.", v2, v3, v4, v5, v6);
}

void GCKSession_TrimLocalInterfaceList_cold_3()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d InterfaceFilter found an invalid number after actions done. We should not update the interface list.", v2, v3, v4, v5, v6);
}

void GCKSession_TrimLocalInterfaceList_cold_4()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7_0(&dword_221563000, v0, v1, " [%s] %s:%d InterfaceFilter got 2 or more interfaces already. skip the rest of the list.", v2, v3, v4, v5, v6);
}

void _GCKSession_AddOneIPPortToInterfaceList_cold_1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d newIPPortToAdd must not be nil. Skip interface list trimming.", v2, v3, v4, v5, v6);
}

void _GCKSession_AddOneIPPortToInterfaceList_cold_2()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d ipPortListCount must not be nil. Skip interface list trimming.", v2, v3, v4, v5, v6);
}

void _GCKSession_AddOneIPPortToInterfaceList_cold_3()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d ipPortList must not be nil. Skip interface list trimming.", v2, v3, v4, v5, v6);
}

void _GCKSession_AddOneIPPortToInterfaceList_cold_4()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7_0(&dword_221563000, v0, v1, " [%s] %s:%d Bailing due to: invalid numberOfIPPortsToUse.", v2, v3, v4, v5, v6);
}

void _GCKSession_AddOneIPPortToInterfaceList_cold_5()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d Bailing due to: failed to calloc ipPorts.", v2, v3, v4, v5, v6);
}

void _GCKSession_AddOneIPPortToInterfaceList_cold_6()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_10_0();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x2Cu);
}

void _GCKSession_AddOneIPPortToInterfaceList_cold_7()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d Bailing due to: failed to reallocate ipPorts.", v2, v3, v4, v5, v6);
}

void GCKSessionCreate_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_6_0(&dword_221563000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: calloc(%d) failed", v2);
}

void GCKSessionCreate_cold_2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_6_0(&dword_221563000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: calloc(%d) failed", v2);
}

void GCKSessionCreate_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_221563000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: gckSessionCreate failed(%X)", v2, v3, v4, v5, v6);
}

void GCKSessionCreate_cold_4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_221563000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: StartEventCallbackThread failed(%X)", v2, v3, v4, v5, v6);
}

void GCKSessionCreate_cold_5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_221563000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: pthread_create failed(%X)", v2, v3, v4, v5, v6);
}

void GCKSessionCreate_cold_6()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_221563000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: pthread_create failed(%X)", v2, v3, v4, v5, v6);
}

void GCKSessionRelease_cold_1()
{
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_10_0();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x38u);
}

void gckSessionRecvProc_cold_1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d gckSessionRecvProc: ERROR: Cannot create timer source   ", v2, v3, v4, v5, v6);
}

void gckSessionRecvProc_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_221563000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: socket failed(%X)", v2, v3, v4, v5, v6);
}

void gckSessionRecvProc_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_221563000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: select failed(%X)", v2, v3, v4, v5, v6);
}

void gckSessionLocalClientProc_cold_1()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  int v4 = 4377;
  __int16 v5 = v0;
  int v6 = v1;
  _os_log_error_impl(&dword_221563000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Connection cancelled to %08X", v3, 0x22u);
}

void gckSessionSendDD_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_221563000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: Couldn't find pCList for [%08X]", v2, v3, v4, v5, v6);
}

void GCKSessionPrepareConnectionWithRelayInfo_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_11_0(&dword_221563000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: No network interface found.", v2, v3, v4, v5, v6);
}

void GCKSessionPrepareConnectionWithRelayInfo_cold_2()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_16(&dword_221563000, v0, v1, " [%s] %s:%d InterfaceFilter job done. Remaining interfaces count=%d.", v2, v3, v4, v5);
}

void GCKSessionPrepareConnectionWithRelayInfo_cold_3()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_16(&dword_221563000, v0, v1, " [%s] %s:%d InterfaceFilter trimming interface list from all interfaces. count=%d", v2, v3, v4, v5);
}

void gckSessionCreateSocketAndBind_cold_1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_27();
  int v3 = 768;
  OUTLINED_FUNCTION_6_0(&dword_221563000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: calloc(%d) failed", v2);
}

void gckSessionCreateSocketAndBind_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_11_0(&dword_221563000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: getaddrinfo returned NULL", v2, v3, v4, v5, v6);
}

void gckSessionCreateSocketAndBind_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_221563000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: socket failed(%X)", v2, v3, v4, v5, v6);
}

void gckSessionCreateSocketAndBind_cold_4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_221563000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: getsockname failed(%X)", v2, v3, v4, v5, v6);
}

void gckSessionCreateSocketAndBind_cold_5()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_27();
  int v3 = -2145779708;
  OUTLINED_FUNCTION_6_0(&dword_221563000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: pthread_mutexattr_init failed(%X)", v2);
}

void gckSessionCreateSocketAndBind_cold_6()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_221563000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: bind failed(%X) for all ports in range", v2, v3, v4, v5, v6);
}

void gckSessionCreateSocketAndBind_cold_7()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_221563000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: getaddrinfo failed(%X)", v2, v3, v4, v5, v6);
}

void GCKGetNAT64Prefix_cold_1()
{
  micro();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_17(&dword_221563000, v0, v1, " [%s] %s:%d GCKGetNAT64Prefix: NAT64 prefix resolved for %s at %f", v2, v3, v4, v5, 2u);
}

void GCKGetNAT64Prefix_cold_2()
{
  micro();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_17(&dword_221563000, v0, v1, " [%s] %s:%d GCKGetNAT64Prefix: no NAT64 prefix discovered for %s at %f", v2, v3, v4, v5, 2u);
}

void GCKGetNAT64Prefix_cold_3()
{
  micro();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_17(&dword_221563000, v0, v1, " [%s] %s:%d GCKGetNAT64Prefix: start NAT64 prefix resolution for %s at %f", v2, v3, v4, v5, 2u);
}

void GCKSessionEstablishConnectionWithRelayInfo_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_11_0(&dword_221563000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: cannot add any more nodes", v2, v3, v4, v5, v6);
}

void GCKSessionPrepareRetryICE_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_11_0(&dword_221563000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: No network interface found.", v2, v3, v4, v5, v6);
}

void GCKSessionStartEventCallbacks_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_221563000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: StartEventCallbackThread failed(%X)", v2, v3, v4, v5, v6);
}

void gckSessionSendHello_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_221563000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: Couldn't find pCList for [%08X]", v2, v3, v4, v5, v6);
}

void gckSessionWaitForHello_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_221563000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: Couldn't find pCList for [%08X]", v2, v3, v4, v5, v6);
}

void __SendUDPPacketCList_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  __error();
  int v4 = 136315906;
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_18();
  _os_log_error_impl(&dword_221563000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d sendmsg error: errno = %d", (uint8_t *)&v4, 0x22u);
}

void attempt_failover_cold_1()
{
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_3_0(&dword_221563000, v0, v1, " [%s] %s:%d Connection timed out for [%08X] (in clstate %d)", v2, v3, v4, v5, v6);
}

void gckSessionLocalServerProc_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_11_0(&dword_221563000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: remoteID is invalid", v2, v3, v4, v5, v6);
}

void gckSessionLocalServerProc_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_11_0(&dword_221563000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: No more node allowed", v2, v3, v4, v5, v6);
}

void gckSessionLocalServerProc_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_221563000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: recv failed(%d)", v2, v3, v4, v5, v6);
}

void gckSessionLocalServerProc_cold_4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_221563000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: recv failed(%d)", v2, v3, v4, v5, v6);
}

void gckSessionLocalServerProc_cold_5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_221563000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: recv failed(%d)", v2, v3, v4, v5, v6);
}

void gckSessionLocalServerProc_cold_6()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_221563000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: iRemoteConnectionDataSize wrong(%d)", v2, v3, v4, v5, v6);
}

void gckSessionLocalServerProc_cold_7()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_221563000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: recv failed(%d)", v2, v3, v4, v5, v6);
}

void gckSessionLocalServerProc_cold_8()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_221563000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: recv failed(%d)", v2, v3, v4, v5, v6);
}

void gckSessionProcessHello_cold_1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7_0(&dword_221563000, v0, v1, " [%s] %s:%d FLOW CONTROL enabled.", v2, v3, v4, v5, v6);
}

void gckSessionProcessHello_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_221563000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GCKSession.c:%d: gckSessionSendHello failed(%X)", v2, v3, v4, v5, v6);
}

void OSPFParse_ParsePacketHeader_cold_1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d Buffer is NULL", v2, v3, v4, v5, v6);
}

void OSPFParse_ParsePacketHeader_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1(&dword_221563000, v0, v1, " [%s] %s:%d bufferLength=%d is too small for header", v2, v3, v4, 1082);
}

void OSPFParse_ParsePacketHeader_cold_3()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_1(&dword_221563000, v0, v1, " [%s] %s:%d Bad destination count=%d", v2, v3, v4, v5);
}

void OSPFParse_ParsePacketHeader_cold_4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1(&dword_221563000, v0, v1, " [%s] %s:%d bufferLength=%d is too small", v2, v3, v4, 1103);
}

void OSPFParse_ParsePacketHeader_cold_5()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_1(&dword_221563000, v0, v1, " [%s] %s:%d Length=%d doesn't match", v2, v3, v4, v5);
}

void OSPFParse_ParsePacketHeader_cold_6()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_1(&dword_221563000, v0, v1, " [%s] %s:%d Bad packet type=%d", v2, v3, v4, v5);
}

void OSPFParse_ParsePacketHeader_cold_7()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d Bad version", v2, v3, v4, v5, v6);
}

void _OSPFParse_ParseExtractOptions_cold_1()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  int v3 = 1203;
  __int16 v4 = v0;
  int v5 = 1203;
  _os_log_error_impl(&dword_221563000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/OSPF.c:%d: malloc failed", v2, 0x22u);
}

void OSPFParse_cold_1()
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3();
  int v4 = 1577;
  __int16 v5 = v0;
  int v6 = 12;
  __int16 v7 = v0;
  int v8 = v1;
  _os_log_error_impl(&dword_221563000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d OSPF version mismatch: expected %d, got %d\n", v3, 0x28u);
}

void _OSPFParse_ParsePacketHeartbeat_cold_1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d payload=NULL", v2, v3, v4, v5, v6);
}

void _OSPFParse_ParsePacketDD_cold_1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d payload=NULL", v2, v3, v4, v5, v6);
}

void _OSPFParse_ParsePacketLSA_cold_1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d payload=NULL", v2, v3, v4, v5, v6);
}

void _OSPFParse_ParsePacketLSAAck_cold_1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d payload=NULL", v2, v3, v4, v5, v6);
}

void GCK_BWE_CalcRxEstimate_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_3_2(&dword_221563000, v0, v1, " [%s] %s:%d \t\t\t\t AFRCCalcRxEstimate [%d]: //////\t\t%s\n", v2, v3, v4, v5, v6);
}

void GCK_BWE_CalcRxEstimate_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_3_2(&dword_221563000, v0, v1, " [%s] %s:%d \t\t\t\t AFRCCalcRxEstimate [%d]: //////\t\t%s\n", v2, v3, v4, v5, v6);
}

void GCK_BWE_CalcRxEstimate_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_3_2(&dword_221563000, v0, v1, " [%s] %s:%d AFRCCalcRxEstimate [%d]: //////\t\t%s", v2, v3, v4, v5, v6);
}

void GCK_BWE_CalcRxEstimate_cold_4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_3_2(&dword_221563000, v0, v1, " [%s] %s:%d AFRCCalcRxEstimate [%d]: //////\t\t%s\n", v2, v3, v4, v5, v6);
}

void BWEstCheckIfLargeFrameNeeded_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_16(&dword_221563000, v0, v1, " [%s] %s:%d ^^^^^ LARGE frame req'd of %d ", v2, v3, v4, 1730);
}

void GCK_BWE_TrackLargeFrameState_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_16(&dword_221563000, v0, v1, " [%s] %s:%d ^^^^^ new frame of %d ", v2, v3, v4, 1864);
}

void GCK_BWE_TrackLargeFrameState_cold_2(uint64_t a1, unsigned int *a2, os_log_t log)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  unsigned int v3 = *a2;
  unsigned int v4 = a2[2];
  int v5 = 136316162;
  uint64_t v6 = a1;
  __int16 v7 = 2080;
  int v8 = "GCK_BWE_TrackLargeFrameState";
  int v10 = 1977;
  __int16 v9 = 1024;
  __int16 v11 = 1024;
  unsigned int v12 = v3 / 0x3E8;
  __int16 v13 = 1024;
  unsigned int v14 = v4;
  _os_log_debug_impl(&dword_221563000, log, OS_LOG_TYPE_DEBUG, " [%s] %s:%d \t\t\t\t\t\t\t\t\t\t\t^^^^^ Tx/RxRate: %d/%d  ", (uint8_t *)&v5, 0x28u);
}

void GCK_BWE_CreateHandle_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_2();
  _os_log_error_impl(&dword_221563000, v0, OS_LOG_TYPE_ERROR, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/BWE/BWE_GCK.c:%d: calloc(%d) failed", v1, 0x28u);
}

void GCK_BWE_CreateHandle_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_2();
  _os_log_fault_impl(&dword_221563000, v0, OS_LOG_TYPE_FAULT, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/BWE/BWE_GCK.c:%d: calloc(%d) failed", v1, 0x28u);
}

void GCK_BWE_CreateHandle_cold_3()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  int v3 = 2049;
  __int16 v4 = v0;
  int v5 = 2049;
  _os_log_error_impl(&dword_221563000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/BWE/BWE_GCK.c:%d: GCK_BWE_CreateHandle failed", v2, 0x22u);
}

double GCK_BWE_CloseHandle_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  int v3 = *(_DWORD *)(a2 + 440);
  int v4 = *(_DWORD *)(a2 + 448);
  int v5 = *(unsigned __int16 *)(a2 + 444);
  int v6 = *(_DWORD *)(a2 + 452);
  int v7 = *(_DWORD *)(a2 + 460);
  int v8 = *(unsigned __int16 *)(a2 + 456);
  double v9 = *(double *)(a2 + 464);
  int v10 = *(_DWORD *)(a2 + 472);
  int v12 = 136317698;
  uint64_t v13 = a1;
  __int16 v14 = 2080;
  uint64_t v15 = "BWEstUninit";
  __int16 v16 = 1024;
  int v17 = 1513;
  __int16 v18 = 1024;
  int v19 = v3;
  __int16 v20 = 1024;
  int v21 = v4;
  __int16 v22 = 1024;
  int v23 = v5;
  __int16 v24 = 1024;
  int v25 = v6;
  __int16 v26 = 1024;
  int v27 = v7;
  __int16 v28 = 1024;
  int v29 = v8;
  __int16 v30 = 2048;
  double v31 = v9 / (double)v10;
  __int16 v32 = 1024;
  int v33 = v10;
  _os_log_debug_impl(&dword_221563000, log, OS_LOG_TYPE_DEBUG, " [%s] %s:%d ////////////////// Loss event reports //////////////////////////\n///// Video: %d/%d\tlast seq#: %d \t\t Audio: %d/%d last seq#: %d\n///// Avg. BW: %f  \t  with %d reports\n///////////////////////////////////////////////////////\n", (uint8_t *)&v12, 0x50u);
  return result;
}

void gkDiscoveryBrowseCallback_cold_1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d context == NULL!", v2, v3, v4, v5, v6);
}

void gkDiscoveryBrowseCallback_cold_2()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d cannot resolve full name!", v2, v3, v4, v5, v6);
}

void gkDiscoveryBrowseCallback_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_1(&dword_221563000, v0, v1, " [%s] %s:%d set dispatch queue failed with error [%d]", v2, v3, v4, v5);
}

void gkDiscoveryBrowseCallback_cold_4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_1(&dword_221563000, v0, v1, " [%s] %s:%d service query record failed with error [%d]", v2, v3, v4, v5);
}

void gkDiscoveryBrowseCallback_cold_5()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d gkDiscovery: failed to generate fullname, invalid inputs", v2, v3, v4, v5, v6);
}

void gkDiscoveryBrowseCallback_cold_6()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_1(&dword_221563000, v0, v1, " [%s] %s:%d browse callback called with error [%d] - ignoring.", v2, v3, v4, v5);
}

void gkDiscoveryResolveCallback_cold_1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d context == NULL!", v2, v3, v4, v5, v6);
}

void gkDiscoveryResolveCallback_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_1(&dword_221563000, v0, v1, " [%s] %s:%d service get addr info failed with error [%d]", v2, v3, v4, v5);
}

void gkDiscoveryResolveCallback_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_1(&dword_221563000, v0, v1, " [%s] %s:%d set dispatch queue failed with error [%d]", v2, v3, v4, v5);
}

void gkDiscoveryResolveCallback_cold_4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_1(&dword_221563000, v0, v1, " [%s] %s:%d getAddrCallback called with error [%d]", v2, v3, v4, v5);
}

void gkDiscoveryRegisterCallback_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_1(&dword_221563000, v0, v1, " [%s] %s:%d discovery register callback called with error [%d]", v2, v3, v4, v5);
}

void gkDiscoveryTxtCallback_cold_1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d context == NULL!", v2, v3, v4, v5, v6);
}

void gkDiscoveryTxtCallback_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_1(&dword_221563000, v0, v1, " [%s] %s:%d txtCallback called with error [%d]", v2, v3, v4, v5);
}

void gkDiscoveryGetAddrCallback_cold_1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d context == NULL!", v2, v3, v4, v5, v6);
}

void gkDiscoveryGetAddrCallback_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_1(&dword_221563000, v0, v1, " [%s] %s:%d getAddrCallback called with error [%d]", v2, v3, v4, v5);
}

uint64_t BTLocalDeviceSupportsService()
{
  return MEMORY[0x270F4AD30]();
}

CCCryptorStatus CCCrypt(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x270ED78A0](*(void *)&op, *(void *)&alg, *(void *)&options, key, keyLength, iv, dataIn, dataInLength);
}

void CCHmac(CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
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

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x270EE4788](cf);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E0](allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x270EE4968](theDict, key, value);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x270EE4A18](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CE0](key, applicationID, keyExistsAndHasValidFormat);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EE4D10](allocator, propertyList, format, options, error);
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E68]();
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x270EE4F60](allocator, capacity, callBacks);
}

Boolean CFSetGetValueIfPresent(CFSetRef theSet, const void *candidate, const void **value)
{
  return MEMORY[0x270EE4F88](theSet, candidate, value);
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x270EE5170](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x270EE51E0](length, *(void *)&encoding);
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x270EE5228](theString, prefix);
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x270EE5230](theString, suffix);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x270EE5470](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x270EE5488](alloc, uuid);
}

void CheckInHandleDebug()
{
  while (1)
    ;
}

void CheckOutHandleDebug()
{
  while (1)
    ;
}

void CreateHandle()
{
  while (1)
    ;
}

DNSServiceErrorType DNSServiceBrowse(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *regtype, const char *domain, DNSServiceBrowseReply callBack, void *context)
{
  return MEMORY[0x270ED7BB0](sdRef, *(void *)&flags, *(void *)&interfaceIndex, regtype, domain, callBack, context);
}

DNSServiceErrorType DNSServiceConstructFullName(char *const fullName, const char *const service, const char *const regtype, const char *const domain)
{
  return MEMORY[0x270ED7BB8](fullName, service, regtype, domain);
}

DNSServiceErrorType DNSServiceCreateConnection(DNSServiceRef *sdRef)
{
  return MEMORY[0x270ED7BC0](sdRef);
}

DNSServiceErrorType DNSServiceGetAddrInfo(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, DNSServiceProtocol protocol, const char *hostname, DNSServiceGetAddrInfoReply callBack, void *context)
{
  return MEMORY[0x270ED7BD0](sdRef, *(void *)&flags, *(void *)&interfaceIndex, *(void *)&protocol, hostname, callBack, context);
}

DNSServiceErrorType DNSServiceProcessResult(DNSServiceRef sdRef)
{
  return MEMORY[0x270ED7BD8](sdRef);
}

DNSServiceErrorType DNSServiceQueryRecord(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *fullname, uint16_t rrtype, uint16_t rrclass, DNSServiceQueryRecordReply callBack, void *context)
{
  return MEMORY[0x270ED7BE0](sdRef, *(void *)&flags, *(void *)&interfaceIndex, fullname, rrtype, rrclass, callBack, context);
}

void DNSServiceRefDeallocate(DNSServiceRef sdRef)
{
}

dnssd_sock_t DNSServiceRefSockFD(DNSServiceRef sdRef)
{
  return MEMORY[0x270ED7BF8](sdRef);
}

DNSServiceErrorType DNSServiceRegister(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *name, const char *regtype, const char *domain, const char *host, uint16_t port, uint16_t txtLen, const void *txtRecord, DNSServiceRegisterReply callBack, void *context)
{
  return MEMORY[0x270ED7C00](sdRef, *(void *)&flags, *(void *)&interfaceIndex, name, regtype, domain, host, port);
}

DNSServiceErrorType DNSServiceResolve(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *name, const char *regtype, const char *domain, DNSServiceResolveReply callBack, void *context)
{
  return MEMORY[0x270ED7C10](sdRef, *(void *)&flags, *(void *)&interfaceIndex, name, regtype, domain, callBack, context);
}

DNSServiceErrorType DNSServiceSetDispatchQueue(DNSServiceRef service, dispatch_queue_t queue)
{
  return MEMORY[0x270ED7C18](service, queue);
}

DNSServiceErrorType DNSServiceUpdateRecord(DNSServiceRef sdRef, DNSRecordRef recordRef, DNSServiceFlags flags, uint16_t rdlen, const void *rdata, uint32_t ttl)
{
  return MEMORY[0x270ED7C20](sdRef, recordRef, *(void *)&flags, rdlen, rdata, *(void *)&ttl);
}

uint64_t FreeLocalInterfaceList()
{
  return MEMORY[0x270F08E28]();
}

void GKSConnectivitySettings_GetICETimeout()
{
  while (1)
    ;
}

uint64_t GetLocalIFIndexForBoundSocket()
{
  return MEMORY[0x270F08E30]();
}

uint64_t GetLocalInterfaceListWithOptions()
{
  return MEMORY[0x270F08E38]();
}

uint64_t ICEAddOneInterface()
{
  return MEMORY[0x270F08E40]();
}

uint64_t ICECloseHandle()
{
  return MEMORY[0x270F08E48]();
}

uint64_t ICECreateHandle()
{
  return MEMORY[0x270F08E50]();
}

uint64_t ICEDiscardRelayBinding()
{
  return MEMORY[0x270F08E68]();
}

uint64_t ICEGetCallInfoForConnectionData()
{
  return MEMORY[0x270F08E70]();
}

uint64_t ICEGetCandidates()
{
  return MEMORY[0x270F08E78]();
}

uint64_t ICERefreshRelayBinding()
{
  return MEMORY[0x270F08E80]();
}

uint64_t ICERemoveOneInterface()
{
  return MEMORY[0x270F08E88]();
}

uint64_t ICEStartConnectivityCheck()
{
  return MEMORY[0x270F08E90]();
}

uint64_t ICEStartConnectivityCheckN()
{
  return MEMORY[0x270F08E98]();
}

uint64_t ICEStopConnectivityCheck()
{
  return MEMORY[0x270F08EA0]();
}

uint64_t ICEUpdateNAT64FlagForInterface()
{
  return MEMORY[0x270F08EA8]();
}

uint64_t ICEUpdateRole()
{
  return MEMORY[0x270F08EB0]();
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

uint64_t IPPORTToSA()
{
  return MEMORY[0x270F08EB8]();
}

uint64_t IPPORTToSA6()
{
  return MEMORY[0x270F08EC0]();
}

uint64_t IPPORTToStringWithSize()
{
  return MEMORY[0x270F08ED0]();
}

uint64_t IPToString()
{
  return MEMORY[0x270F08ED8]();
}

uint64_t IsIPPORTValid()
{
  return MEMORY[0x270F08EE0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

id NSAllocateObject(Class aClass, NSUInteger extraBytes, NSZone *zone)
{
  return (id)MEMORY[0x270EF2A30](aClass, extraBytes, zone);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void NSLog(NSString *format, ...)
{
}

uint64_t SAToIPPORT()
{
  return MEMORY[0x270F08EE8]();
}

CFDictionaryRef SCDynamicStoreCopyMultiple(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return (CFDictionaryRef)MEMORY[0x270F054F8](store, keys, patterns);
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x270F05500](store, key);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x270F05508](allocator, name, callout, context);
}

CFRunLoopSourceRef SCDynamicStoreCreateRunLoopSource(CFAllocatorRef allocator, SCDynamicStoreRef store, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x270F05510](allocator, store, order);
}

Boolean SCDynamicStoreSetDispatchQueue(SCDynamicStoreRef store, dispatch_queue_t queue)
{
  return MEMORY[0x270F05558](store, queue);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return MEMORY[0x270F05560](store, keys, patterns);
}

CFArrayRef SCNetworkInterfaceCopyAll(void)
{
  return (CFArrayRef)MEMORY[0x270F05598]();
}

CFStringRef SCNetworkInterfaceGetBSDName(SCNetworkInterfaceRef interface)
{
  return (CFStringRef)MEMORY[0x270F055A8](interface);
}

CFStringRef SCNetworkInterfaceGetInterfaceType(SCNetworkInterfaceRef interface)
{
  return (CFStringRef)MEMORY[0x270F055C0](interface);
}

uint64_t TCCAccessRequest()
{
  return MEMORY[0x270F79618]();
}

int TXTRecordContainsKey(uint16_t txtLen, const void *txtRecord, const char *key)
{
  return MEMORY[0x270ED7C90](txtLen, txtRecord, key);
}

void TXTRecordCreate(TXTRecordRef *txtRecord, uint16_t bufferLen, void *buffer)
{
}

void TXTRecordDeallocate(TXTRecordRef *txtRecord)
{
}

const void *__cdecl TXTRecordGetBytesPtr(const TXTRecordRef *txtRecord)
{
  return (const void *)MEMORY[0x270ED7CA8](txtRecord);
}

uint16_t TXTRecordGetCount(uint16_t txtLen, const void *txtRecord)
{
  return MEMORY[0x270ED7CB0](txtLen, txtRecord);
}

DNSServiceErrorType TXTRecordGetItemAtIndex(uint16_t txtLen, const void *txtRecord, uint16_t itemIndex, uint16_t keyBufLen, char *key, uint8_t *valueLen, const void **value)
{
  return MEMORY[0x270ED7CB8](txtLen, txtRecord, itemIndex, keyBufLen, key, valueLen, value);
}

uint16_t TXTRecordGetLength(const TXTRecordRef *txtRecord)
{
  return MEMORY[0x270ED7CC0](txtRecord);
}

const void *__cdecl TXTRecordGetValuePtr(uint16_t txtLen, const void *txtRecord, const char *key, uint8_t *valueLen)
{
  return (const void *)MEMORY[0x270ED7CC8](txtLen, txtRecord, key, valueLen);
}

DNSServiceErrorType TXTRecordSetValue(TXTRecordRef *txtRecord, const char *key, uint8_t valueSize, const void *value)
{
  return MEMORY[0x270ED7CD0](txtRecord, key, valueSize, value);
}

uint64_t VRTraceErrorLogLevelToCSTR()
{
  return MEMORY[0x270F08F20]();
}

uint64_t VRTraceGetErrorLogLevelForModule()
{
  return MEMORY[0x270F08F28]();
}

uint64_t VRTraceIsOSFaultDisabled()
{
  return MEMORY[0x270F08F30]();
}

uint64_t VRTracePrintLoggingInfo()
{
  return MEMORY[0x270F08F38]();
}

uint64_t VRTraceReset()
{
  return MEMORY[0x270F08F40]();
}

uint64_t VRTraceSetErrorLogLevel()
{
  return MEMORY[0x270F08F48]();
}

uint64_t VRTraceVariable_()
{
  return MEMORY[0x270F08F50]();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _SCNetworkInterfaceIsBluetoothP2P()
{
  return MEMORY[0x270F05790]();
}

uint64_t _SCNetworkInterfaceIsBluetoothPAN()
{
  return MEMORY[0x270F05798]();
}

uint64_t _SCNetworkInterfaceIsBluetoothPAN_NAP()
{
  return MEMORY[0x270F057A0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::terminate(void)
{
}

void operator delete()
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

int __darwin_check_fd_set_overflow(int a1, const void *a2, int a3)
{
  return MEMORY[0x270ED7DA8](*(void *)&a1, a2, *(void *)&a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

uint64_t __memmove_chk()
{
  return MEMORY[0x270ED7E40]();
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x270ED7EB0](a1, *(void *)&a2, a3, a4);
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x270ED7ED8]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
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

int accept(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x270ED8478](*(void *)&a1, a2, a3);
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x270ED8758](*(void *)&a1, a2, *(void *)&a3);
}

void bzero(void *a1, size_t a2)
{
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x270F9A480](cls);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

int compress2(Bytef *dest, uLongf *destLen, const Bytef *source, uLong sourceLen, int level)
{
  return MEMORY[0x270F9C680](dest, destLen, source, sourceLen, *(void *)&level);
}

uLong compressBound(uLong sourceLen)
{
  return MEMORY[0x270F9C688](sourceLen);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x270ED8F58](*(void *)&a1, a2, *(void *)&a3);
}

uint64_t connectingGKLog()
{
  return MEMORY[0x270F08F58]();
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return MEMORY[0x270F9C690](crc, buf, *(void *)&len);
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

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return MEMORY[0x270ED9580](source);
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

int dup(int a1)
{
  return MEMORY[0x270ED9678](*(void *)&a1);
}

long double exp2(long double __x)
{
  MEMORY[0x270ED9860](__x);
  return result;
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

void freeaddrinfo(addrinfo *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

const char *__cdecl gai_strerror(int a1)
{
  return (const char *)MEMORY[0x270ED9B90](*(void *)&a1);
}

int getaddrinfo(const char *a1, const char *a2, const addrinfo *a3, addrinfo **a4)
{
  return MEMORY[0x270ED9B98](a1, a2, a3, a4);
}

hostent *__cdecl gethostbyname2(const char *a1, int a2)
{
  return (hostent *)MEMORY[0x270ED9C50](a1, *(void *)&a2);
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

int getsockname(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x270ED9D88](*(void *)&a1, a2, a3);
}

int getsockopt(int a1, int a2, int a3, void *a4, socklen_t *a5)
{
  return MEMORY[0x270ED9D90](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, a5);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x270ED9D98](a1, a2);
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  return (char *)MEMORY[0x270ED9E70](*(void *)&a1, a2);
}

unsigned int if_nametoindex(const char *a1)
{
  return MEMORY[0x270ED9E80](a1);
}

in_addr_t inet_addr(const char *a1)
{
  return MEMORY[0x270ED9EA0](a1);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x270ED9EC0](*(void *)&a1, a2, a3, *(void *)&a4);
}

int listen(int a1, int a2)
{
  return MEMORY[0x270EDA078](*(void *)&a1, *(void *)&a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

uint64_t nw_nat64_copy_prefixes()
{
  return MEMORY[0x270EF84B0]();
}

uint64_t nw_nat64_synthesize_v6()
{
  return MEMORY[0x270EF84B8]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x270F9A6A0](location);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

void objc_terminate(void)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t perfTimerStart()
{
  return MEMORY[0x270F08F60]();
}

uint64_t perfTimerStop()
{
  return MEMORY[0x270F08F68]();
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x270EDADF8](a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x270EDAE10](a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x270EDAE20](a1, *(void *)&a2);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE50](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE58](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x270EDAE60](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE68](a1);
}

int pthread_cond_timedwait_relative_np(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x270EDAE80](a1, a2, a3);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x270EDAE88](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x270EDAEA0](a1, a2, a3, a4);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x270EDAF10](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF50](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x270EDAF58](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return MEMORY[0x270EDAF78](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x270EDAF80](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x270EDAF98](a1, *(void *)&a2);
}

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFC8](a1);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x270EDAFD0](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFD8](a1);
}

int pthread_rwlock_tryrdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFE0](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFF0](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFF8](a1);
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x270EDB038](a1);
}

uint64_t random(void)
{
  return MEMORY[0x270EDB0E8]();
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return MEMORY[0x270EDB190](*(void *)&a1, a2, a3, *(void *)&a4);
}

ssize_t recvfrom(int a1, void *a2, size_t a3, int a4, sockaddr *a5, socklen_t *a6)
{
  return MEMORY[0x270EDB198](*(void *)&a1, a2, a3, *(void *)&a4, a5, a6);
}

ssize_t recvmsg(int a1, msghdr *a2, int a3)
{
  return MEMORY[0x270EDB1A0](*(void *)&a1, a2, *(void *)&a3);
}

uint64_t reportingGKAppInfo()
{
  return MEMORY[0x270F08F70]();
}

uint64_t reportingGKLog()
{
  return MEMORY[0x270F08F78]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x270F9AAE0](sel);
}

int select(int a1, fd_set *a2, fd_set *a3, fd_set *a4, timeval *a5)
{
  return MEMORY[0x270EDB328](*(void *)&a1, a2, a3, a4, a5);
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return MEMORY[0x270EDB3B0](*(void *)&a1, a2, a3, *(void *)&a4);
}

ssize_t sendmsg(int a1, const msghdr *a2, int a3)
{
  return MEMORY[0x270EDB3B8](*(void *)&a1, a2, *(void *)&a3);
}

ssize_t sendto(int a1, const void *a2, size_t a3, int a4, const sockaddr *a5, socklen_t a6)
{
  return MEMORY[0x270EDB3C0](*(void *)&a1, a2, a3, *(void *)&a4, a5, *(void *)&a6);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x270EDB440](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, *(void *)&a5);
}

int shutdown(int a1, int a2)
{
  return MEMORY[0x270EDB480](*(void *)&a1, *(void *)&a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x270EDB520](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB560](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
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

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB718](__str, __endptr, *(void *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}

int uncompress(Bytef *dest, uLongf *destLen, const Bytef *source, uLong sourceLen)
{
  return MEMORY[0x270F9C770](dest, destLen, source, sourceLen);
}

void uuid_generate(uuid_t out)
{
}

int xdr_float(XDR *a1, float *a2)
{
  return MEMORY[0x270EDBC68](a1, a2);
}

int xdr_int64_t(XDR *a1, int64_t *a2)
{
  return MEMORY[0x270EDBC70](a1, a2);
}

int xdr_pointer(XDR *a1, char **a2, unsigned int a3, xdrproc_t a4)
{
  return MEMORY[0x270EDBC78](a1, a2, *(void *)&a3, a4);
}

int xdr_u_int16_t(XDR *a1, u_int16_t *a2)
{
  return MEMORY[0x270EDBC80](a1, a2);
}

int xdr_u_int32_t(XDR *a1, u_int32_t *a2)
{
  return MEMORY[0x270EDBC88](a1, a2);
}

int xdr_u_int64_t(XDR *a1, u_int64_t *a2)
{
  return MEMORY[0x270EDBC90](a1, a2);
}

void xdrmem_create(XDR *a1, char *a2, unsigned int a3, xdr_op a4)
{
}