BOOL match(uint64_t a1, uint64_t a2)
{
  return a1
      && a2
      && *(_DWORD *)a1 == *(_DWORD *)a2
      && *(void *)(a1 + 8) == *(void *)(a2 + 8)
      && *(void *)(a1 + 16) == *(void *)(a2 + 16)
      && *(float *)(a1 + 24) == *(float *)(a2 + 24);
}

_OWORD *createCacheNode(int *a1, uint64_t a2, int a3)
{
  v3 = 0;
  if (a1 && a2 && a3)
  {
    int v5 = *a1;
    if (*a1 == 4)
    {
      if (a3 != 1552) {
        createCacheNode_cold_4();
      }
      size_t v6 = 1600;
      unsigned int v7 = 1416888032;
    }
    else if (v5 == 3)
    {
      if (a3 != 2108) {
        createCacheNode_cold_3();
      }
      size_t v6 = 2160;
      unsigned int v7 = 1128583905;
    }
    else
    {
      if (v5 != 2) {
        createCacheNode_cold_1();
      }
      if (a3 != 1284) {
        createCacheNode_cold_2();
      }
      size_t v6 = 1336;
      unsigned int v7 = 1105201864;
    }
    v8 = malloc_type_malloc(v6, v7 | 0x10E004000000000);
    v3 = v8;
    if (v8)
    {
      long long v9 = *((_OWORD *)a1 + 1);
      _OWORD *v8 = *(_OWORD *)a1;
      v8[1] = v9;
      *((void *)v8 + 4) = 0;
      *((void *)v8 + 5) = 0;
      __memmove_chk();
    }
  }
  return v3;
}

uint64_t addToFront(uint64_t result, uint64_t a2)
{
  if (result && a2)
  {
    uint64_t v2 = *(void *)(result + 8);
    if (v2)
    {
      *(void *)(a2 + 32) = 0;
      *(void *)(a2 + 40) = v2;
      v3 = (void *)(v2 + 32);
    }
    else
    {
      v3 = (void *)(result + 16);
    }
    void *v3 = a2;
    *(void *)(result + 8) = a2;
    ++*(_DWORD *)result;
  }
  return result;
}

uint64_t removeNode(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0;
  if (a1 && a2)
  {
    uint64_t v3 = *(void *)(a2 + 32);
    if (v3)
    {
      *(void *)(v3 + 40) = *(void *)(a2 + 40);
    }
    else if (*(void *)(a1 + 8) == a2)
    {
      *(void *)(a1 + 8) = *(void *)(a2 + 40);
    }
    uint64_t v4 = *(void *)(a2 + 40);
    if (v4)
    {
      int v5 = (void *)(v4 + 32);
    }
    else
    {
      int v5 = (void *)(a1 + 16);
      if (*(void *)(a1 + 16) != a2) {
        goto LABEL_11;
      }
    }
    *int v5 = v3;
LABEL_11:
    --*(_DWORD *)a1;
    return a2;
  }
  return v2;
}

double initCache(_OWORD *a1)
{
  if (a1)
  {
    if (!disableHcuCache)
    {
      double result = 0.0;
      a1[7] = 0u;
      a1[8] = 0u;
      a1[5] = 0u;
      a1[6] = 0u;
      a1[3] = 0u;
      a1[4] = 0u;
      a1[1] = 0u;
      a1[2] = 0u;
      *a1 = 0u;
    }
  }
  return result;
}

void *deleteCacheObject(uint64_t a1)
{
  uint64_t v3 = (void *)(a1 + 8);
  double result = *(void **)(a1 + 8);
  if (result)
  {
    do
    {
      uint64_t v4 = (void *)result[5];
      free(result);
      double result = v4;
    }
    while (v4);
  }
  *(_DWORD *)a1 = 0;
  void *v3 = 0;
  v3[1] = 0;
  return result;
}

void deleteCache(void *a1)
{
  if (a1 && !disableHcuCache)
  {
    uint64_t v3 = a1 + 1;
    uint64_t v2 = (void *)a1[1];
    if (v2)
    {
      do
      {
        uint64_t v4 = (void *)v2[5];
        free(v2);
        uint64_t v2 = v4;
      }
      while (v4);
    }
    *(_DWORD *)a1 = 0;
    void *v3 = 0;
    a1[2] = 0;
    int v5 = (void *)a1[7];
    if (v5)
    {
      do
      {
        size_t v6 = (void *)v5[5];
        free(v5);
        int v5 = v6;
      }
      while (v6);
    }
    *((_DWORD *)a1 + 12) = 0;
    a1[7] = 0;
    a1[8] = 0;
    unsigned int v7 = (void *)a1[13];
    if (v7)
    {
      do
      {
        v8 = (void *)v7[5];
        free(v7);
        unsigned int v7 = v8;
      }
      while (v8);
    }
  }
  free(a1);
}

uint64_t getCache(uint64_t a1, uint64_t a2, void *__dst, size_t __len)
{
  uint64_t result = 0;
  if (__dst && a2 && a1 && !disableHcuCache)
  {
    ++*(void *)(a1 + 24);
    uint64_t v6 = *(void *)(a1 + 8);
    if (v6)
    {
      unsigned int v7 = __len;
      uint64_t v9 = *(void *)(a1 + 8);
      while (*(_DWORD *)a2 != *(_DWORD *)v9
           || *(void *)(a2 + 8) != *(void *)(v9 + 8)
           || *(void *)(a2 + 16) != *(void *)(v9 + 16)
           || *(float *)(a2 + 24) != *(float *)(v9 + 24))
      {
        uint64_t v9 = *(void *)(v9 + 40);
        if (!v9) {
          goto LABEL_12;
        }
      }
      ++*(void *)(a1 + 32);
      if (v9 != v6)
      {
        uint64_t v10 = removeNode(a1, v9);
        if (v10)
        {
          uint64_t v11 = *(void *)(a1 + 8);
          if (v11)
          {
            *(void *)(v10 + 32) = 0;
            *(void *)(v10 + 40) = v11;
            v12 = (uint64_t *)(v11 + 32);
          }
          else
          {
            v12 = (uint64_t *)(a1 + 16);
          }
          uint64_t *v12 = v10;
          *(void *)(a1 + 8) = v10;
          ++*(_DWORD *)a1;
        }
      }
      memmove(__dst, (const void *)(v9 + 48), v7);
      return 1;
    }
    else
    {
LABEL_12:
      uint64_t result = 0;
      ++*(void *)(a1 + 40);
    }
  }
  return result;
}

uint64_t updateCache(uint64_t result, uint64_t a2, void *__src, size_t __len)
{
  if (!__src) {
    return result;
  }
  if (!a2) {
    return result;
  }
  uint64_t v5 = result;
  if (!result || disableHcuCache) {
    return result;
  }
  int v6 = __len;
  uint64_t v8 = *(void *)(result + 8);
  if (!v8)
  {
LABEL_11:
    if (*(_DWORD *)result == 3)
    {
      uint64_t v9 = (void *)removeNode(result, *(void *)(result + 16));
      free(v9);
    }
    uint64_t result = (uint64_t)createCacheNode((int *)a2, (uint64_t)__src, v6);
    if (!result) {
      return result;
    }
LABEL_14:
    uint64_t v10 = *(void *)(v5 + 8);
    if (v10)
    {
      *(void *)(result + 32) = 0;
      *(void *)(result + 40) = v10;
      uint64_t v11 = (void *)(v10 + 32);
    }
    else
    {
      uint64_t v11 = (void *)(v5 + 16);
    }
    *uint64_t v11 = result;
    *(void *)(v5 + 8) = result;
    ++*(_DWORD *)v5;
    return result;
  }
  while (*(_DWORD *)a2 != *(_DWORD *)v8
       || *(void *)(a2 + 8) != *(void *)(v8 + 8)
       || *(void *)(a2 + 16) != *(void *)(v8 + 16)
       || *(float *)(a2 + 24) != *(float *)(v8 + 24))
  {
    uint64_t v8 = *(void *)(v8 + 40);
    if (!v8) {
      goto LABEL_11;
    }
  }
  uint64_t result = (uint64_t)memmove((void *)(v8 + 48), __src, __len);
  if (v8 != *(void *)(v5 + 8))
  {
    uint64_t result = removeNode(v5, v8);
    if (result) {
      goto LABEL_14;
    }
  }
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_impl(a1, a2, OS_LOG_TYPE_DEFAULT, a4, &a9, 2u);
}

uint64_t getHcuId(int a1)
{
  if ((a1 - 1634952555) > 5) {
    return 0;
  }
  else {
    return *((unsigned int *)&unk_2107B98C0 + a1 - 1634952555);
  }
}

uint64_t getHcuType(int a1)
{
  if ((a1 - 1) > 5) {
    return 0;
  }
  else {
    return dword_2107B98D8[a1 - 1];
  }
}

uint64_t getHcuSize(int a1)
{
  if ((a1 - 1) > 5) {
    return 0;
  }
  else {
    return dword_2107B98F0[a1 - 1];
  }
}

unsigned char *getMin(unsigned char *result)
{
  if (result)
  {
    if (*result) {
      return (unsigned char *)(-1 << result[1]);
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t getMax(uint64_t result)
{
  if (result) {
    return ~(-1 << *(unsigned char *)(result + 1));
  }
  return result;
}

float *calcSlope(float *result, uint64_t a2, int a3)
{
  int v3 = -1 << *(unsigned char *)(a2 + 5);
  if (*(unsigned char *)(a2 + 4)) {
    int v4 = -1 << *(unsigned char *)(a2 + 5);
  }
  else {
    int v4 = 0;
  }
  uint64_t v5 = (a3 - 1);
  result[3 * v5 + 2] = 0.0;
  if (a3 != 1)
  {
    int v6 = ~v3;
    float v7 = *result;
    result += 2;
    float v8 = v7;
    do
    {
      float v9 = v8;
      *uint64_t result = 0.0;
      float v8 = result[1];
      float v10 = v8 - v9;
      if (v10 > 0.0)
      {
        int v11 = (int)(float)((float)((float)(result[2] - *(result - 1)) * *(float *)(a2 + 8)) / v10);
        if (v6 >= v11) {
          int v12 = (int)(float)((float)((float)(result[2] - *(result - 1)) * *(float *)(a2 + 8)) / v10);
        }
        else {
          int v12 = v6;
        }
        if (v4 <= v11) {
          int v13 = v12;
        }
        else {
          int v13 = v4;
        }
        *uint64_t result = (float)v13;
      }
      result += 3;
      --v5;
    }
    while (v5);
  }
  return result;
}

uint64_t float_to_fixed(char a1, char a2, float a3)
{
  int v3 = -1 << (a2 + a1);
  unsigned int v4 = ~v3;
  float v5 = 0.5;
  if (a3 < 0.0) {
    float v5 = -0.5;
  }
  double v6 = v5 + (float)((float)(1 << a2) * a3);
  if (v6 > (double)v4) {
    double v6 = (double)v4;
  }
  return (int)v6 & ~v3;
}

uint64_t interpolate_int(uint64_t result, int a2, float a3, float a4, float a5)
{
  if (a4 != a5) {
    return (int)(float)((float)(int)result
  }
                                    + (float)((float)(a2 - result) * (float)((float)(a3 - a4) / (float)(a5 - a4))));
  return result;
}

float interpolate(float a1, float a2, float a3, float a4, float a5)
{
  if (a2 == a3) {
    return a4;
  }
  else {
    return a4 + (float)((float)(a5 - a4) * (float)((float)(a1 - a2) / (float)(a3 - a2)));
  }
}

float *copyPieceWiseCurve(uint64_t a1, uint64_t a2, unsigned int a3, unsigned char *a4)
{
  if (a4)
  {
    int v4 = -1 << a4[1];
    v5.f32[0] = (float)v4;
    v6.f32[0] = (float)~v4;
    if (!*a4) {
      v5.f32[0] = 0.0;
    }
  }
  else
  {
    v5.i32[0] = 0;
    v6.i32[0] = 0;
  }
  int v7 = a4[2];
  char v8 = a4[3];
  *(_OWORD *)(a1 + 352) = 0u;
  *(_OWORD *)(a1 + 368) = 0u;
  *(_OWORD *)(a1 + 320) = 0u;
  *(_OWORD *)(a1 + 336) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  *(_OWORD *)(a1 + 304) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
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
  if (a3)
  {
    int v9 = -1 << v8;
    float v10 = (float)v9;
    if (!v7) {
      float v10 = 0.0;
    }
    uint64_t v11 = a3;
    v5.f32[1] = v10;
    v6.f32[1] = (float)~v9;
    int v12 = (float32x2_t *)(a2 + 4);
    int v13 = (int8x8_t *)a1;
    do
    {
      float32x2_t v14 = *v12++;
      *int v13 = vbsl_s8((int8x8_t)vcgt_f32(v5, v14), (int8x8_t)v5, vbsl_s8((int8x8_t)vcgt_f32(v14, v6), (int8x8_t)v6, (int8x8_t)v14));
      int v13 = (int8x8_t *)((char *)v13 + 12);
      --v11;
    }
    while (v11);
  }
  return calcSlope((float *)a1, (uint64_t)a4, a3);
}

void copyArray(int *a1, uint64_t a2, unsigned int a3, unsigned char *a4)
{
  float32x2_t v6 = a1;
  if (a4)
  {
    if (*a4) {
      int v7 = -1 << a4[1];
    }
    else {
      int v7 = 0;
    }
    int v8 = ~(-1 << a4[1]);
  }
  else
  {
    int v7 = 0;
    int v8 = 0;
  }
  if (a3 >= 0x11) {
    copyArray_cold_1();
  }
  bzero(a1, 4 * a3);
  if (a3)
  {
    uint64_t v9 = a3;
    float v10 = (int *)(a2 + 4);
    do
    {
      int v12 = *v10++;
      int v11 = v12;
      if (v12 >= v8) {
        int v13 = v8;
      }
      else {
        int v13 = v11;
      }
      if (v11 >= v7) {
        int v14 = v13;
      }
      else {
        int v14 = v7;
      }
      *v6++ = v14;
      --v9;
    }
    while (v9);
  }
}

float *interpolateTwoPieceWiseCurves(uint64_t a1, float *a2, float *a3, unsigned int a4, unsigned char *a5, float a6)
{
  if (a5)
  {
    if (*a5) {
      int v6 = -1 << a5[1];
    }
    else {
      int v6 = 0;
    }
    int v7 = ~(-1 << a5[1]);
  }
  else
  {
    int v6 = 0;
    int v7 = 0;
  }
  int v8 = -1 << a5[3];
  if (a5[2]) {
    int v9 = -1 << a5[3];
  }
  else {
    int v9 = 0;
  }
  *(_OWORD *)(a1 + 352) = 0u;
  *(_OWORD *)(a1 + 368) = 0u;
  *(_OWORD *)(a1 + 320) = 0u;
  *(_OWORD *)(a1 + 336) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  *(_OWORD *)(a1 + 304) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
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
  if (a4)
  {
    int v10 = ~v8;
    float v12 = *a2;
    int v11 = a2 + 2;
    float v13 = v12;
    float v15 = *a3;
    int v14 = a3 + 2;
    float v16 = v15;
    float v17 = (float)(a6 - v13) / (float)(v15 - v13);
    uint64_t v18 = a4;
    v19 = (float *)(a1 + 4);
    do
    {
      float v20 = *(v11 - 1);
      if (v13 != v16) {
        float v20 = v20 + (float)((float)(*(v14 - 1) - v20) * v17);
      }
      double v21 = v20;
      if (v20 >= 0.0) {
        double v22 = 0.5;
      }
      else {
        double v22 = -0.5;
      }
      int v23 = (int)(v22 + v21);
      if (v7 >= v23) {
        int v24 = (int)(v22 + v21);
      }
      else {
        int v24 = v7;
      }
      if (v6 <= v23) {
        int v25 = v24;
      }
      else {
        int v25 = v6;
      }
      *(v19 - 1) = (float)v25;
      float v26 = *v11;
      if (v13 != v16) {
        float v26 = v26 + (float)((float)(*v14 - v26) * v17);
      }
      double v27 = v26;
      if (v26 >= 0.0) {
        double v28 = 0.5;
      }
      else {
        double v28 = -0.5;
      }
      int v29 = (int)(v28 + v27);
      if (v10 >= v29) {
        int v30 = (int)(v28 + v27);
      }
      else {
        int v30 = v10;
      }
      if (v9 <= v29) {
        int v31 = v30;
      }
      else {
        int v31 = v9;
      }
      float *v19 = (float)v31;
      v19 += 3;
      v11 += 2;
      v14 += 2;
      --v18;
    }
    while (v18);
  }
  return calcSlope((float *)a1, (uint64_t)a5, a4);
}

float *copyPieceWiseCurves(uint64_t a1, unsigned char *a2)
{
  if (!a2 || *a2 || (unsigned int v4 = a2[2], v4 >= 0x11))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v6 = 0;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] Assertion: \"input && input->type == WDT_TYPE_CONSTANT && input->pointCount <= 16\" warned in \"/Library/Caches/com.apple.xbs/Sources/ASEFramework/ASECalculateControlSettingV3.m\" at line 185\n", v6, 2u);
    }
    if (!a2 || *a2 || (unsigned int v4 = a2[2], v4 >= 0x11)) {
      copyPieceWiseCurves_cold_1();
    }
  }
  return copyPieceWiseCurve(a1, (uint64_t)(a2 + 16), v4, a2 + 4);
}

void interpolatePieceWiseCurves(uint64_t a1, uint64_t a2, float a3)
{
  if (!a2 || *(unsigned char *)a2 != 1 || (unsigned int v6 = *(unsigned __int8 *)(a2 + 2), v6 >= 0x11))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v14 = 0;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] Assertion: \"input && input->type == WDT_TYPE_INTERPOLATED && input->pointCount <= 16\" warned in \"/Library/Caches/com.apple.xbs/Sources/ASEFramework/ASECalculateControlSettingV3.m\" at line 193\n", v14, 2u);
    }
    if (!a2 || *(unsigned char *)a2 != 1 || (unsigned int v6 = *(unsigned __int8 *)(a2 + 2), v6 >= 0x11)) {
      interpolatePieceWiseCurves_cold_1();
    }
  }
  uint64_t v7 = a2 + 16;
  if (*(float *)(a2 + 16) >= a3
    || (v8 = a2 + 132 * *(unsigned __int8 *)(a2 + 1), v9 = *(float *)(v8 - 116), uint64_t v7 = v8 - 116, v9 <= a3))
  {
    copyPieceWiseCurve(a1, v7, v6, (unsigned char *)(a2 + 4));
  }
  else
  {
    uint64_t v10 = a2 + 16;
    uint64_t v11 = v6 + 1;
    while (--v11)
    {
      float v12 = (float *)(v10 + 132);
      float v13 = *(float *)(v10 + 132);
      v10 += 132;
      if (v13 > a3)
      {
        interpolateTwoPieceWiseCurves(a1, v12 - 33, v12, v6, (unsigned char *)(a2 + 4), a3);
        return;
      }
    }
  }
}

void interpolateTwoArrays(int *a1, _DWORD *a2, float *a3, unsigned int a4, unsigned char *a5, float a6)
{
  uint64_t v10 = a1;
  if (a5)
  {
    if (*a5) {
      int v11 = -1 << a5[1];
    }
    else {
      int v11 = 0;
    }
    int v12 = ~(-1 << a5[1]);
  }
  else
  {
    int v11 = 0;
    int v12 = 0;
  }
  bzero(a1, 4 * a4);
  if (a4)
  {
    float v14 = *(float *)a2;
    float v13 = a2 + 1;
    float v15 = v14;
    uint64_t v16 = a4;
    float v18 = *a3;
    float v17 = a3 + 1;
    float v19 = v18;
    float v20 = (float)(a6 - v15) / (float)(v18 - v15);
    do
    {
      int v22 = *v13++;
      int v21 = v22;
      if (v15 != v19) {
        int v21 = (int)(float)((float)v21 + (float)((float)(*v17 - v21) * v20));
      }
      if (v21 >= v12) {
        int v23 = v12;
      }
      else {
        int v23 = v21;
      }
      if (v21 >= v11) {
        int v24 = v23;
      }
      else {
        int v24 = v11;
      }
      *v10++ = v24;
      ++v17;
      --v16;
    }
    while (v16);
  }
}

void interpolateArray(int *a1, uint64_t a2, float a3)
{
  if (!a2 || *(unsigned char *)a2 != 1)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] Assertion: \"input && input->type == WDT_TYPE_INTERPOLATED\" warned in \"/Library/Caches/com.apple.xbs/Sources/ASEFramework/ASECalculateControlSettingV3.m\" at line 247\n", v16, 2u);
    }
    if (!a2 || *(unsigned char *)a2 != 1) {
      interpolateArray_cold_1();
    }
  }
  uint64_t v6 = a2 + 8;
  if (*(float *)(a2 + 8) >= a3)
  {
    unsigned int v13 = *(unsigned __int8 *)(a2 + 2);
    float v14 = (unsigned char *)(a2 + 3);
    float v15 = a1;
LABEL_15:
    copyArray(v15, v6, v13, v14);
    return;
  }
  uint64_t v7 = a2 + 68 * *(unsigned __int8 *)(a2 + 1);
  float v8 = *(float *)(v7 - 60);
  uint64_t v6 = v7 - 60;
  if (v8 <= a3)
  {
    float v14 = (unsigned char *)(a2 + 3);
    float v15 = a1;
    unsigned int v13 = *(unsigned __int8 *)(a2 + 2);
    goto LABEL_15;
  }
  uint64_t v9 = a2 + 8;
  uint64_t v10 = *(unsigned __int8 *)(a2 + 2) + 1;
  while (--v10)
  {
    int v11 = (float *)(v9 + 68);
    float v12 = *(float *)(v9 + 68);
    v9 += 68;
    if (v12 > a3)
    {
      interpolateTwoArrays(a1, (_DWORD *)v11 - 17, v11, *(unsigned __int8 *)(a2 + 2), (unsigned char *)(a2 + 3), a3);
      return;
    }
  }
}

int8x8_t populateScalingConfig(int8x8_t *a1, _DWORD *a2, int8x8_t a3, float a4, int32x2_t a5)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  a5.i32[0] = overrideASEScalingFactor;
  *(float *)&a3.i32[1] = a4;
  float32x2_t v7 = (float32x2_t)vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(*(float *)&overrideASEScalingFactor != 0.0), 0x1FuLL)), (int8x8_t)vdup_lane_s32(a5, 0), a3);
  if (logLevel >= 3)
  {
    float32x2_t v18 = v7;
    BOOL v8 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    float32x2_t v7 = v18;
    if (v8)
    {
      *(_DWORD *)buf = 136315650;
      float v20 = "void populateScalingConfig(scalingConfigV3Hcu *, float, float, uint32_t *)";
      __int16 v21 = 2048;
      double v22 = v18.f32[0];
      __int16 v23 = 2048;
      double v24 = v18.f32[1];
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] %s : xScaler = %f, yScaler = %f\n", buf, 0x20u);
      float32x2_t v7 = v18;
    }
  }
  __asm { FMOV            V0.2S, #1.0 }
  float32x2_t v14 = vdiv_f32(_D0, v7);
  float64x2_t v15 = vaddq_f64(vcvtq_f64_f32(vmul_f32(v14, (float32x2_t)vdup_n_s32(0x4A800000u))), vcvtq_f64_f32((float32x2_t)vbsl_s8((int8x8_t)vcltz_f32(v14), (int8x8_t)0xBF000000BF000000, (int8x8_t)0x3F0000003F000000)));
  float64x2_t v16 = (float64x2_t)vdupq_n_s64(0x415FFFFFC0000000uLL);
  int8x8_t result = vand_s8((int8x8_t)vmovn_s64(vcvtq_s64_f64((float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v15, v16), (int8x16_t)v16, (int8x16_t)v15))), (int8x8_t)0x7F0000007FLL);
  *a1 = 0;
  a1[1] = result;
  a1[2].i32[0] = 0;
  a1[2].i32[1] = 0;
  *a2 |= 2u;
  return result;
}

uint64_t populatePeakingConfig(char *__dst, const void *a2, uint64_t a3, uint64_t a4, _DWORD *a5, float32_t a6)
{
  long long v17 = 0u;
  long long v18 = 0u;
  LODWORD(v17) = 2;
  if (*(float *)&overrideASEScalingFactor == 0.0) {
    v6.f32[0] = a6;
  }
  else {
    v6.f32[0] = *(float *)&overrideASEScalingFactor;
  }
  *((void *)&v17 + 1) = a2;
  *(void *)&long long v18 = a3;
  DWORD2(v18) = v6.i32[0];
  uint64_t result = getCache(a4, (uint64_t)&v17, __dst, 0x504uLL);
  if ((result & 1) == 0)
  {
    if (a2) {
      memmove(__dst, a2, 0x504uLL);
    }
    else {
      bzero(__dst, 0x504uLL);
    }
    copyPieceWiseCurves((uint64_t)(__dst + 4), *(unsigned char **)a3);
    interpolatePieceWiseCurves((uint64_t)(__dst + 388), *(void *)(a3 + 8), v6.f32[0]);
    interpolatePieceWiseCurves((uint64_t)(__dst + 772), *(void *)(a3 + 16), v6.f32[0]);
    interpolateArray((int *)__dst + 294, *(void *)(a3 + 24), v6.f32[0]);
    interpolateArray((int *)__dst + 296, *(void *)(a3 + 32), v6.f32[0]);
    interpolateArray((int *)__dst + 299, *(void *)(a3 + 40), v6.f32[0]);
    interpolateArray((int *)__dst + 303, *(void *)(a3 + 48), v6.f32[0]);
    interpolateArray((int *)__dst + 308, *(void *)(a3 + 56), v6.f32[0]);
    interpolateArray((int *)__dst + 314, *(void *)(a3 + 64), v6.f32[0]);
    v13.i32[0] = 2.5;
    *(int8x8_t *)&long long v14 = vbsl_s8((int8x8_t)vdup_lane_s32((int32x2_t)vmvn_s8((int8x8_t)vcge_f32(v13, v6)), 0), (int8x8_t)0x1A00000010, (int8x8_t)0x1E0000001ALL);
    if (v6.f32[0] <= 2.5) {
      int v15 = 0;
    }
    else {
      int v15 = 28;
    }
    if (v6.f32[0] <= 2.5) {
      int v16 = 1;
    }
    else {
      int v16 = 2;
    }
    *((void *)&v14 + 1) = v14;
    *(_DWORD *)__dst = v15;
    *((_DWORD *)__dst + 289) = v16;
    *(_OWORD *)(__dst + 1160) = v14;
    uint64_t result = updateCache(a4, (uint64_t)&v17, __dst, 0x504uLL);
  }
  *a5 |= 4u;
  return result;
}

uint64_t populateEbeConfig(int *__dst, const void *a2, uint64_t *a3, uint64_t a4, _DWORD *a5, float a6)
{
  long long v13 = 0u;
  long long v14 = 0u;
  LODWORD(v13) = 3;
  if (*(float *)&overrideASEScalingFactor == 0.0) {
    float v10 = a6;
  }
  else {
    float v10 = *(float *)&overrideASEScalingFactor;
  }
  *((void *)&v13 + 1) = a2;
  *(void *)&long long v14 = a3;
  *((float *)&v14 + 2) = v10;
  uint64_t v11 = a4 + 48;
  uint64_t result = getCache(a4 + 48, (uint64_t)&v13, __dst, 0x83CuLL);
  if ((result & 1) == 0)
  {
    if (a2) {
      memmove(__dst, a2, 0x83CuLL);
    }
    else {
      bzero(__dst, 0x83CuLL);
    }
    interpolatePieceWiseCurves((uint64_t)__dst, *a3, v10);
    interpolatePieceWiseCurves((uint64_t)(__dst + 96), a3[1], v10);
    interpolatePieceWiseCurves((uint64_t)(__dst + 192), a3[2], v10);
    interpolatePieceWiseCurves((uint64_t)(__dst + 288), a3[3], v10);
    interpolatePieceWiseCurves((uint64_t)(__dst + 384), a3[4], v10);
    interpolateArray(__dst + 509, a3[5], v10);
    uint64_t result = updateCache(v11, (uint64_t)&v13, __dst, 0x83CuLL);
  }
  *a5 |= 8u;
  return result;
}

uint64_t populateBlendConfig(void *__dst, const void *a2, uint64_t *a3, uint64_t a4, _DWORD *a5, float a6)
{
  long long v13 = 0u;
  long long v14 = 0u;
  LODWORD(v13) = 4;
  if (*(float *)&overrideASEScalingFactor == 0.0) {
    float v10 = a6;
  }
  else {
    float v10 = *(float *)&overrideASEScalingFactor;
  }
  *((void *)&v13 + 1) = a2;
  *(void *)&long long v14 = a3;
  *((float *)&v14 + 2) = v10;
  uint64_t v11 = a4 + 96;
  uint64_t result = getCache(a4 + 96, (uint64_t)&v13, __dst, 0x610uLL);
  if ((result & 1) == 0)
  {
    if (a2) {
      memmove(__dst, a2, 0x610uLL);
    }
    else {
      bzero(__dst, 0x610uLL);
    }
    interpolatePieceWiseCurves((uint64_t)__dst, *a3, v10);
    interpolatePieceWiseCurves((uint64_t)__dst + 384, a3[1], v10);
    interpolatePieceWiseCurves((uint64_t)__dst + 768, a3[2], v10);
    interpolatePieceWiseCurves((uint64_t)__dst + 1152, a3[3], v10);
    uint64_t result = updateCache(v11, (uint64_t)&v13, __dst, 0x610uLL);
  }
  *a5 |= 0x10u;
  return result;
}

void *populateAngleDetectConfig(void *result, void *a2, _DWORD *a3)
{
  *uint64_t result = *a2;
  *a3 |= 0x20u;
  return result;
}

void populateNoiseConfig(int *a1, int a2, int a3, int a4, _DWORD *a5)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  *a1 = a2 - 22;
  a1[1] = a3 - 22;
  a1[2] = a4;
  *(void *)(a1 + 3) = 0x400000007;
  *a5 |= 0x40u;
  if (logLevel >= 3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = *a1;
    int v7 = a1[1];
    int v8 = a1[2];
    int v9 = a1[3];
    int v10 = a1[4];
    v11[0] = 67110144;
    v11[1] = v6;
    __int16 v12 = 1024;
    int v13 = v7;
    __int16 v14 = 1024;
    int v15 = v8;
    __int16 v16 = 1024;
    int v17 = v9;
    __int16 v18 = 1024;
    int v19 = v10;
    _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] noiseMeter = config.{ sizeX=%d, sizeY=%d }, gainControl.{ lut0Gain= %d, lut1Gain= %d, lut2Gain= %d }\n", (uint8_t *)v11, 0x20u);
  }
}

void calculate_control_setting_V3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned int *a9, unsigned int *a10, _DWORD *a11, unsigned int *a12, int a13, unsigned int a14, unsigned int a15, uint64_t a16, _DWORD *a17)
{
  uint64_t v17 = MEMORY[0x270FA5388]();
  int v19 = v18;
  __int16 v21 = v20;
  __int16 v23 = (int *)v22;
  int v25 = v24;
  unsigned int v27 = v26;
  unsigned int v29 = v28;
  int v31 = v30;
  v32 = (_DWORD *)v17;
  uint64_t v139 = *MEMORY[0x263EF8340];
  int v110 = *v20;
  unsigned int v112 = *v22;
  unsigned int v108 = *a9;
  int v109 = *v18;
  if (!isT1OrNewer(a13))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v126[0]) = 0;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] Assertion: \"isT1OrNewer(productType)\" warned in \"/Library/Caches/com.apple.xbs/Sources/ASEFramework/ASECalculateControlSettingV3.m\" at line 508\n", (uint8_t *)v126, 2u);
    }
    if (!isT1OrNewer(a13)) {
      calculate_control_setting_V3_cold_1();
    }
  }
  v119 = v23;
  v114 = v19;
  v115 = v21;
  v35 = a17;
  *a17 = 0;
  *(float *)v33.i32 = (float)a14 / (float)v29;
  float v36 = (float)a15 / (float)v27;
  if (*(float *)v33.i32 >= v36) {
    float v37 = (float)a15 / (float)v27;
  }
  else {
    float v37 = (float)a14 / (float)v29;
  }
  v121 = v31;
  *(float *)v34.i32 = (float)v27;
  populateScalingConfig(v31 + 2, a17, v33, v36, v34);
  memset(v128, 0, 512);
  memset(v127, 0, 512);
  memset(v126, 0, 512);
  memset(__src, 0, 512);
  memset(__dst, 0, 512);
  memset(&v123[22], 0, 160);
  unsigned int v38 = 100 * v32[94];
  unsigned int v39 = v32[30];
  if (v39 <= v32[46]) {
    unsigned int v39 = v32[46];
  }
  memset(&v123[2], 0, 320);
  unsigned int v40 = v38 / v39;
  unsigned int v122 = v29;
  BOOL v42 = v29 > 0x383 && v27 > 0x1F3;
  BOOL v107 = v42;
  memset(v123, 0, 32);
  unsigned int v120 = v40;
  if (v25)
  {
    int v43 = v27;
    unsigned int v44 = v32[16] + v32[15];
    unsigned int v45 = *a10 - v44;
    unsigned int v46 = v32[32] + v32[31];
    v47 = a11;
    unsigned int v48 = *a11;
    unsigned int v49 = *a12;
    if (v44 > *a10) {
      unsigned int v45 = v44 - *a10;
    }
    if (v44 >= *a10) {
      unsigned int v44 = *a10;
    }
    unsigned int v50 = v46 - v48;
    if (v46 <= v48) {
      unsigned int v50 = *a11 - v46;
    }
    unsigned int v51 = 100 * v45 / v44;
    unsigned int v52 = 100 * v50;
    if (v46 >= v48) {
      unsigned int v53 = *a11;
    }
    else {
      unsigned int v53 = v32[32] + v32[31];
    }
    unsigned int v54 = v52 / v53;
    if (v51 <= v54) {
      unsigned int v51 = v54;
    }
    unsigned int v55 = v40 - v49;
    if (v40 <= v49) {
      unsigned int v55 = *a12 - v40;
    }
    unsigned int v56 = 100 * v55;
    if (v40 >= v49) {
      unsigned int v57 = *a12;
    }
    else {
      unsigned int v57 = v40;
    }
    BOOL v58 = v51 + v56 / v57 > 0x64;
  }
  else
  {
    v47 = a11;
    int v43 = v27;
    BOOL v58 = 0;
  }
  int v59 = *v32;
  if (logLevel >= 3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v60 = *a12;
    int v61 = v32[16] + v32[15];
    unsigned int v62 = *a10;
    int v63 = v32[32] + v32[31];
    int v64 = *v47;
    *(_DWORD *)buf = 67110656;
    *(_WORD *)&v130[4] = 1024;
    *(_DWORD *)&v130[6] = v120;
    LOWORD(v131) = 1024;
    *(_DWORD *)v130 = v58;
    *(_DWORD *)((char *)&v131 + 2) = v60;
    HIWORD(v131) = 1024;
    int v132 = v61;
    __int16 v133 = 1024;
    __int16 v135 = 1024;
    int v136 = v63;
    __int16 v137 = 1024;
    unsigned int v134 = v62;
    int v138 = v64;
    _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] scene_change_detected = %d, ratio_2D_1D is :%d vs %d; H1 is : %d vs %d,  V1 is: %d vs %d;\n",
      buf,
      0x2Cu);
  }
  if (!v25 || (int)(100 * v59 / (v29 - 22) * (v43 - 22)) < 20 || v25 != 1 && v58)
  {
    populatePeakingConfig((char *)&v121[6], &peakingConfig_InitialSettingVideo_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
    populateEbeConfig((int *)&v121[167] + 1, &ebeConfig_InitialSettingVideo_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
    populateBlendConfig(&v121[432], &blendConfig_InitialSettingVideo_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
    if (logLevel < 3)
    {
      unsigned int v66 = 0;
      int v67 = 0;
      int v68 = 4;
      int v69 = 1;
      v70 = v19;
      unsigned int v65 = v122;
    }
    else
    {
      unsigned int v65 = v29;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        *(void *)v130 = &peakingConfig_InitialSettingVideo_V3;
        *(_WORD *)&v130[8] = 2080;
        v131 = "peakingConfig_InitialSettingVideo_V3";
        _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] pixelControl[%p]=%s\n", buf, 0x16u);
      }
      unsigned int v66 = 0;
      int v67 = 0;
      int v68 = 4;
      int v69 = 1;
      v70 = v114;
    }
    v71 = v115;
    v72 = a10;
    goto LABEL_48;
  }
  uint64_t v80 = 0;
  unsigned int v81 = 0;
  unsigned int v82 = 0;
  do
  {
    v81 += v32[v80 + 23];
    v82 += v32[v80 + 39];
    ++v80;
  }
  while (v80 != 7);
  unsigned int v83 = 0;
  for (uint64_t i = 79; i != 94; ++i)
    v83 += v32[i];
  int v85 = 10 * v32[46] / v82 + 10 * v32[30] / v81;
  signed int v86 = 10 * v32[94] / v83;
  if (v86 <= 349) {
    int v85 = 350 * v85 / v86;
  }
  int v87 = 0;
  uint64_t v88 = 47;
  unsigned int v89 = v112;
  do
    v87 += v32[v88++];
  while (v88 != 62);
  HIDWORD(v90) = 1079574528;
  LODWORD(v90) = *v32;
  double v91 = (double)v87 * 100.0 / (double)v90;
  if (v91 >= 7.0)
  {
    if (v91 > 8.0)
    {
      if (v112 - 1 <= 4) {
        unsigned int v89 = 4;
      }
      else {
        unsigned int v89 = v112 - 1;
      }
    }
  }
  else
  {
    unsigned int v89 = v112 + 1;
  }
  if (v89 <= 0xE)
  {
    if (v89 < 0xA)
    {
      if (v89 < 6) {
        signed int v92 = 0;
      }
      else {
        signed int v92 = (50 * v89 - 300) >> 2;
      }
    }
    else
    {
      signed int v92 = ((50 * (_BYTE)v89 + 12) & 0xFEu) / 5 + 50;
    }
  }
  else
  {
    signed int v92 = 100;
  }
  unsigned int v113 = v89;
  if (v85 <= 30)
  {
    if (v85 < 24)
    {
      if (v85 < 12) {
        signed int v93 = 100;
      }
      else {
        signed int v93 = (unsigned __int16)(50 * (24 - v85)) / 0xCu + 50;
      }
    }
    else
    {
      signed int v93 = (unsigned __int16)(50 * (30 - v85)) / 6u;
    }
  }
  else
  {
    signed int v93 = 0;
  }
  if (logLevel >= 3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109888;
    *(_WORD *)&v130[4] = 1024;
    *(_DWORD *)&v130[6] = v92;
    LOWORD(v131) = 1024;
    *(_DWORD *)v130 = v25;
    *(_DWORD *)((char *)&v131 + 2) = v93;
    HIWORD(v131) = 1024;
    int v132 = v85;
    _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] Frame %d:  Curr_FG_level = %d, Curr_badly_coded_FG_level = %d, No_Bad_coded_FilmGrain_score  = %d \n", buf, 0x1Au);
  }
  if (v92 <= v93) {
    unsigned int v94 = v93;
  }
  else {
    unsigned int v94 = v92;
  }
  int v106 = v43;
  if (isPhone(a13) && isT1OrNewer(a13))
  {
    BOOL v95 = v107;
    if (logLevel >= 4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] Apply iPhone control setting V3\n", buf, 2u);
    }
    if (v107)
    {
      v71 = v115;
      if (v94 > 0x1D)
      {
        if (v94 > 0x31)
        {
          if (v94 > 0x45)
          {
            if (v94 > 0x5E)
            {
              populatePeakingConfig((char *)v127, &peakingConfig_iPhone_Video_Heavy_FG_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
              populateEbeConfig((int *)v126, &ebeConfig_iPhone_Video_Heavy_FG_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
              populateBlendConfig(__dst, &blendConfig_iPhone_Video_Heavy_FG_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
              populatePeakingConfig((char *)v128, &peakingConfig_iPhone_Video_Heavy_FG_mix_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
              populateEbeConfig((int *)__src, &ebeConfig_iPhone_Video_Heavy_FG_mix_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
              populateBlendConfig(v123, &blendConfig_iPhone_Video_Heavy_FG_mix_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
              v72 = a10;
              if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_172;
              }
              *(_WORD *)buf = 0;
              v96 = &_os_log_internal;
              v97 = " [1.37.0] Film grain level heavy\n";
            }
            else
            {
              populatePeakingConfig((char *)v127, &peakingConfig_iPhone_Video_level3_FG_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
              populateEbeConfig((int *)v126, &ebeConfig_iPhone_Video_level3_FG_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
              populateBlendConfig(__dst, &blendConfig_iPhone_Video_level3_FG_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
              populatePeakingConfig((char *)v128, &peakingConfig_iPhone_Video_level3_FG_mix_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
              populateEbeConfig((int *)__src, &ebeConfig_iPhone_Video_level3_FG_mix_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
              populateBlendConfig(v123, &blendConfig_iPhone_Video_level3_FG_mix_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
              v72 = a10;
              if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_172;
              }
              *(_WORD *)buf = 0;
              v96 = &_os_log_internal;
              v97 = " [1.37.0] Film grain level 3\n";
            }
          }
          else
          {
            populatePeakingConfig((char *)v127, &peakingConfig_iPhone_Video_level2_FG_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
            populateEbeConfig((int *)v126, &ebeConfig_iPhone_Video_level2_FG_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
            populateBlendConfig(__dst, &blendConfig_iPhone_Video_level2_FG_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
            populatePeakingConfig((char *)v128, &peakingConfig_iPhone_Video_level2_FG_mix_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
            populateEbeConfig((int *)__src, &ebeConfig_iPhone_Video_level2_FG_mix_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
            populateBlendConfig(v123, &blendConfig_iPhone_Video_level2_FG_mix_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
            v72 = a10;
            if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_172;
            }
            *(_WORD *)buf = 0;
            v96 = &_os_log_internal;
            v97 = " [1.37.0] Film grain level 2\n";
          }
        }
        else
        {
          populatePeakingConfig((char *)v127, &peakingConfig_iPhone_Video_level1_FG_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
          populateEbeConfig((int *)v126, &ebeConfig_iPhone_Video_level1_FG_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
          populateBlendConfig(__dst, &blendConfig_iPhone_Video_level1_FG_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
          populatePeakingConfig((char *)v128, &peakingConfig_iPhone_Video_level1_FG_mix_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
          populateEbeConfig((int *)__src, &ebeConfig_iPhone_Video_level1_FG_mix_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
          populateBlendConfig(v123, &blendConfig_iPhone_Video_level1_FG_mix_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
          v72 = a10;
          if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_172;
          }
          *(_WORD *)buf = 0;
          v96 = &_os_log_internal;
          v97 = " [1.37.0] Film grain level 1\n";
        }
      }
      else
      {
        populatePeakingConfig((char *)v127, &peakingConfig_iPhone_Video_light_FG_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
        populateEbeConfig((int *)v126, &ebeConfig_iPhone_Video_light_FG_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
        populateBlendConfig(__dst, &blendConfig_iPhone_Video_light_FG_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
        populatePeakingConfig((char *)v128, &peakingConfig_iPhone_Video_light_FG_mix_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
        populateEbeConfig((int *)__src, &ebeConfig_iPhone_Video_light_FG_mix_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
        populateBlendConfig(v123, &blendConfig_iPhone_Video_light_FG_mix_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
        v72 = a10;
        if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_172;
        }
        *(_WORD *)buf = 0;
        v96 = &_os_log_internal;
        v97 = " [1.37.0] Film grain level light\n";
      }
    }
    else
    {
      v71 = v115;
      if (v94 > 0x1D)
      {
        if (v94 > 0x31)
        {
          if (v94 > 0x45)
          {
            if (v94 > 0x5E)
            {
              populatePeakingConfig((char *)v127, &peakingConfig_iPhone_Video_Heavy_FG_LargeRatio_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
              populateEbeConfig((int *)v126, &ebeConfig_iPhone_Video_Heavy_FG_LargeRatio_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
              populateBlendConfig(__dst, &blendConfig_iPhone_Video_Heavy_FG_LargeRatio_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
              populatePeakingConfig((char *)v128, &peakingConfig_iPhone_Video_Heavy_FG_mix_LargeRatio_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
              populateEbeConfig((int *)__src, &ebeConfig_iPhone_Video_Heavy_FG_mix_LargeRatio_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
              populateBlendConfig(v123, &blendConfig_iPhone_Video_Heavy_FG_mix_LargeRatio_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
              v72 = a10;
              if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_172;
              }
              *(_WORD *)buf = 0;
              v96 = &_os_log_internal;
              v97 = " [1.37.0] Film grain level heavy LargeRatio\n";
            }
            else
            {
              populatePeakingConfig((char *)v127, &peakingConfig_iPhone_Video_level3_FG_LargeRatio_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
              populateEbeConfig((int *)v126, &ebeConfig_iPhone_Video_level3_FG_LargeRatio_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
              populateBlendConfig(__dst, &blendConfig_iPhone_Video_level3_FG_LargeRatio_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
              populatePeakingConfig((char *)v128, &peakingConfig_iPhone_Video_level3_FG_mix_LargeRatio_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
              populateEbeConfig((int *)__src, &ebeConfig_iPhone_Video_level3_FG_mix_LargeRatio_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
              populateBlendConfig(v123, &blendConfig_iPhone_Video_level3_FG_mix_LargeRatio_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
              v72 = a10;
              if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_172;
              }
              *(_WORD *)buf = 0;
              v96 = &_os_log_internal;
              v97 = " [1.37.0] Film grain level 3 LargeRatio\n";
            }
          }
          else
          {
            populatePeakingConfig((char *)v127, &peakingConfig_iPhone_Video_level2_FG_LargeRatio_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
            populateEbeConfig((int *)v126, &ebeConfig_iPhone_Video_level2_FG_LargeRatio_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
            populateBlendConfig(__dst, &blendConfig_iPhone_Video_level2_FG_LargeRatio_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
            populatePeakingConfig((char *)v128, &peakingConfig_iPhone_Video_level2_FG_mix_LargeRatio_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
            populateEbeConfig((int *)__src, &ebeConfig_iPhone_Video_level2_FG_mix_LargeRatio_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
            populateBlendConfig(v123, &blendConfig_iPhone_Video_level2_FG_mix_LargeRatio_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
            v72 = a10;
            if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_172;
            }
            *(_WORD *)buf = 0;
            v96 = &_os_log_internal;
            v97 = " [1.37.0] Film grain level 2 LargeRatio\n";
          }
        }
        else
        {
          populatePeakingConfig((char *)v127, &peakingConfig_iPhone_Video_level1_FG_LargeRatio_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
          populateEbeConfig((int *)v126, &ebeConfig_iPhone_Video_level1_FG_LargeRatio_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
          populateBlendConfig(__dst, &blendConfig_iPhone_Video_level1_FG_LargeRatio_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
          populatePeakingConfig((char *)v128, &peakingConfig_iPhone_Video_level1_FG_mix_LargeRatio_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
          populateEbeConfig((int *)__src, &ebeConfig_iPhone_Video_level1_FG_mix_LargeRatio_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
          populateBlendConfig(v123, &blendConfig_iPhone_Video_level1_FG_mix_LargeRatio_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
          v72 = a10;
          if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_172;
          }
          *(_WORD *)buf = 0;
          v96 = &_os_log_internal;
          v97 = " [1.37.0] Film grain level 1 LargeRatio\n";
        }
      }
      else
      {
        populatePeakingConfig((char *)v127, &peakingConfig_iPhone_Video_light_FG_LargeRatio_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
        populateEbeConfig((int *)v126, &ebeConfig_iPhone_Video_light_FG_LargeRatio_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
        populateBlendConfig(__dst, &blendConfig_iPhone_Video_light_FG_LargeRatio_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
        populatePeakingConfig((char *)v128, &peakingConfig_iPhone_Video_light_FG_mix_LargeRatio_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
        populateEbeConfig((int *)__src, &ebeConfig_iPhone_Video_light_FG_mix_LargeRatio_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
        populateBlendConfig(v123, &blendConfig_iPhone_Video_light_FG_mix_LargeRatio_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
        v72 = a10;
        if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_172;
        }
        *(_WORD *)buf = 0;
        v96 = &_os_log_internal;
        v97 = " [1.37.0] Film grain level light LargeRatio\n";
      }
    }
  }
  else
  {
    BOOL v95 = v107;
    if (logLevel >= 4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] Apply iPad control setting V3\n", buf, 2u);
    }
    if (v107)
    {
      v71 = v115;
      if (v94 > 0x1D)
      {
        if (v94 > 0x31)
        {
          if (v94 > 0x45)
          {
            if (v94 > 0x5E)
            {
              populatePeakingConfig((char *)v127, &peakingConfig_Video_Heavy_FG_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
              populateEbeConfig((int *)v126, &ebeConfig_SettingVideo_Heavy_FG_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
              populateBlendConfig(__dst, &blendConfig_SettingVideo_Heavy_FG_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
              populatePeakingConfig((char *)v128, &peakingConfig_Video_Heavy_FG_mix_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
              populateEbeConfig((int *)__src, &ebeConfig_SettingVideo_Heavy_FG_mix_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
              populateBlendConfig(v123, &blendConfig_SettingVideo_Heavy_FG_mix_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
              v72 = a10;
              if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_172;
              }
              *(_WORD *)buf = 0;
              v96 = &_os_log_internal;
              v97 = " [1.37.0] Film grain level heavy\n";
            }
            else
            {
              populatePeakingConfig((char *)v127, &peakingConfig_Video_level3_FG_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
              populateEbeConfig((int *)v126, &ebeConfig_SettingVideo_level3_FG_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
              populateBlendConfig(__dst, &blendConfig_SettingVideo_level3_FG_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
              populatePeakingConfig((char *)v128, &peakingConfig_Video_level3_FG_mix_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
              populateEbeConfig((int *)__src, &ebeConfig_SettingVideo_level3_FG_mix_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
              populateBlendConfig(v123, &blendConfig_SettingVideo_level3_FG_mix_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
              v72 = a10;
              if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_172;
              }
              *(_WORD *)buf = 0;
              v96 = &_os_log_internal;
              v97 = " [1.37.0] Film grain level 3\n";
            }
          }
          else
          {
            populatePeakingConfig((char *)v127, &peakingConfig_Video_level2_FG_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
            populateEbeConfig((int *)v126, &ebeConfig_SettingVideo_level2_FG_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
            populateBlendConfig(__dst, &blendConfig_SettingVideo_level2_FG_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
            populatePeakingConfig((char *)v128, &peakingConfig_Video_level2_FG_mix_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
            populateEbeConfig((int *)__src, &ebeConfig_SettingVideo_level2_FG_mix_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
            populateBlendConfig(v123, &blendConfig_SettingVideo_level2_FG_mix_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
            v72 = a10;
            if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_172;
            }
            *(_WORD *)buf = 0;
            v96 = &_os_log_internal;
            v97 = " [1.37.0] Film grain level 2\n";
          }
        }
        else
        {
          populatePeakingConfig((char *)v127, &peakingConfig_Video_level1_FG_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
          populateEbeConfig((int *)v126, &ebeConfig_SettingVideo_level1_FG_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
          populateBlendConfig(__dst, &blendConfig_SettingVideo_level1_FG_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
          populatePeakingConfig((char *)v128, &peakingConfig_Video_level1_FG_mix_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
          populateEbeConfig((int *)__src, &ebeConfig_SettingVideo_level1_FG_mix_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
          populateBlendConfig(v123, &blendConfig_SettingVideo_level1_FG_mix_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
          v72 = a10;
          if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_172;
          }
          *(_WORD *)buf = 0;
          v96 = &_os_log_internal;
          v97 = " [1.37.0] Film grain level 1\n";
        }
      }
      else
      {
        populatePeakingConfig((char *)v127, &peakingConfig_Video_light_FG_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
        populateEbeConfig((int *)v126, &ebeConfig_SettingVideo_light_FG_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
        populateBlendConfig(__dst, &blendConfig_SettingVideo_light_FG_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
        populatePeakingConfig((char *)v128, &peakingConfig_Video_light_FG_mix_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
        populateEbeConfig((int *)__src, &ebeConfig_SettingVideo_light_FG_mix_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
        populateBlendConfig(v123, &blendConfig_SettingVideo_light_FG_mix_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
        v72 = a10;
        if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_172;
        }
        *(_WORD *)buf = 0;
        v96 = &_os_log_internal;
        v97 = " [1.37.0] Film grain level light\n";
      }
    }
    else
    {
      v71 = v115;
      if (v94 > 0x1D)
      {
        if (v94 > 0x31)
        {
          if (v94 > 0x45)
          {
            if (v94 > 0x5E)
            {
              populatePeakingConfig((char *)v127, &peakingConfig_Video_Heavy_FG_LargeRatio_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
              populateEbeConfig((int *)v126, &ebeConfig_SettingVideo_Heavy_FG_LargeRatio_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
              populateBlendConfig(__dst, &blendConfig_SettingVideo_Heavy_FG_LargeRatio_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
              populatePeakingConfig((char *)v128, &peakingConfig_Video_Heavy_FG_mix_LargeRatio_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
              populateEbeConfig((int *)__src, &ebeConfig_SettingVideo_Heavy_FG_mix_LargeRatio_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
              populateBlendConfig(v123, &blendConfig_SettingVideo_Heavy_FG_mix_LargeRatio_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
              v72 = a10;
              if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_172;
              }
              *(_WORD *)buf = 0;
              v96 = &_os_log_internal;
              v97 = " [1.37.0] Film grain level heavy LargeRatio\n";
            }
            else
            {
              populatePeakingConfig((char *)v127, &peakingConfig_Video_level3_FG_LargeRatio_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
              populateEbeConfig((int *)v126, &ebeConfig_SettingVideo_level3_FG_LargeRatio_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
              populateBlendConfig(__dst, &blendConfig_SettingVideo_level3_FG_LargeRatio_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
              populatePeakingConfig((char *)v128, &peakingConfig_Video_level3_FG_mix_LargeRatio_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
              populateEbeConfig((int *)__src, &ebeConfig_SettingVideo_level3_FG_mix_LargeRatio_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
              populateBlendConfig(v123, &blendConfig_SettingVideo_level3_FG_mix_LargeRatio_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
              v72 = a10;
              if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_172;
              }
              *(_WORD *)buf = 0;
              v96 = &_os_log_internal;
              v97 = " [1.37.0] Film grain level 3 LargeRatio\n";
            }
          }
          else
          {
            populatePeakingConfig((char *)v127, &peakingConfig_Video_level2_FG_LargeRatio_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
            populateEbeConfig((int *)v126, &ebeConfig_SettingVideo_level2_FG_LargeRatio_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
            populateBlendConfig(__dst, &blendConfig_SettingVideo_level2_FG_LargeRatio_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
            populatePeakingConfig((char *)v128, &peakingConfig_Video_level2_FG_mix_LargeRatio_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
            populateEbeConfig((int *)__src, &ebeConfig_SettingVideo_level2_FG_mix_LargeRatio_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
            populateBlendConfig(v123, &blendConfig_SettingVideo_level2_FG_mix_LargeRatio_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
            v72 = a10;
            if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_172;
            }
            *(_WORD *)buf = 0;
            v96 = &_os_log_internal;
            v97 = " [1.37.0] Film grain level 2 LargeRatio\n";
          }
        }
        else
        {
          populatePeakingConfig((char *)v127, &peakingConfig_Video_level1_FG_LargeRatio_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
          populateEbeConfig((int *)v126, &ebeConfig_SettingVideo_level1_FG_LargeRatio_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
          populateBlendConfig(__dst, &blendConfig_SettingVideo_level1_FG_LargeRatio_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
          populatePeakingConfig((char *)v128, &peakingConfig_Video_level1_FG_mix_LargeRatio_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
          populateEbeConfig((int *)__src, &ebeConfig_SettingVideo_level1_FG_mix_LargeRatio_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
          populateBlendConfig(v123, &blendConfig_SettingVideo_level1_FG_mix_LargeRatio_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
          v72 = a10;
          if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_172;
          }
          *(_WORD *)buf = 0;
          v96 = &_os_log_internal;
          v97 = " [1.37.0] Film grain level 1 LargeRatio\n";
        }
      }
      else
      {
        populatePeakingConfig((char *)v127, &peakingConfig_Video_light_FG_LargeRatio_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
        populateEbeConfig((int *)v126, &ebeConfig_SettingVideo_light_FG_LargeRatio_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
        populateBlendConfig(__dst, &blendConfig_SettingVideo_light_FG_LargeRatio_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
        populatePeakingConfig((char *)v128, &peakingConfig_Video_light_FG_mix_LargeRatio_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
        populateEbeConfig((int *)__src, &ebeConfig_SettingVideo_light_FG_mix_LargeRatio_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
        populateBlendConfig(v123, &blendConfig_SettingVideo_light_FG_mix_LargeRatio_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
        v72 = a10;
        if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_172;
        }
        *(_WORD *)buf = 0;
        v96 = &_os_log_internal;
        v97 = " [1.37.0] Film grain level light LargeRatio\n";
      }
    }
  }
  _os_log_impl(&dword_2107A5000, v96, OS_LOG_TYPE_DEFAULT, v97, buf, 2u);
LABEL_172:
  if (v94 <= 0x14) {
    unsigned int v66 = v108 + 1;
  }
  else {
    unsigned int v66 = 0;
  }
  if (v94 > 0x14) {
    unsigned int v98 = v109 + 1;
  }
  else {
    unsigned int v98 = 0;
  }
  if (!v110)
  {
    if (v66 >= 0x30) {
      unsigned int v66 = 48;
    }
    if (v98 > 0x18)
    {
      v99 = v71;
      v100 = v72;
      int v67 = 0;
      goto LABEL_189;
    }
    int v111 = v98;
    goto LABEL_202;
  }
  if (v110 != 2)
  {
    if (v98 <= 0x18) {
      int v67 = v98;
    }
    else {
      int v67 = 0;
    }
    if (v66 <= 0x30)
    {
      v99 = v71;
      v100 = v72;
      if (v98 <= 0x18) {
        int v101 = v110;
      }
      else {
        int v101 = 2;
      }
      if (v101 != 2) {
        goto LABEL_190;
      }
      goto LABEL_211;
    }
    int v111 = v67;
    unsigned int v66 = 0;
LABEL_202:
    BOOL v102 = isPhone(a13);
    v103 = (char *)&v121[6];
    v104 = (int *)&v121[167] + 1;
    v118 = v121 + 432;
    if (v95)
    {
      if (v102)
      {
        populatePeakingConfig(v103, &peakingConfig_iPhone_Video_NFG_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
        populateEbeConfig(v104, &ebeConfig_iPhone_Video_NFG_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
        populateBlendConfig(v118, &blendConfig_iPhone_Video_NFG_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
        if (logLevel >= 3)
        {
          unsigned int v65 = v122;
          int v67 = v111;
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            *(void *)v130 = &peakingConfig_iPhone_Video_NFG_V3;
            *(_WORD *)&v130[8] = 2080;
            v131 = "peakingConfig_iPhone_Video_NFG_V3";
            v105 = &_os_log_internal;
LABEL_226:
            _os_log_impl(&dword_2107A5000, v105, OS_LOG_TYPE_DEFAULT, " [1.37.0] pixelControl[%p]=%s\n", buf, 0x16u);
            goto LABEL_227;
          }
          goto LABEL_227;
        }
      }
      else
      {
        populatePeakingConfig(v103, &peakingConfig_Video_NFG_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
        populateEbeConfig(v104, &ebeConfig_SettingVideo_NFG_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
        populateBlendConfig(v118, &blendConfig_SettingVideo_NFG_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
        if (logLevel >= 3)
        {
          unsigned int v65 = v122;
          int v67 = v111;
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            *(void *)v130 = &peakingConfig_Video_NFG_V3;
            *(_WORD *)&v130[8] = 2080;
            v131 = "peakingConfig_Video_NFG_V3";
            v105 = &_os_log_internal;
            goto LABEL_226;
          }
          goto LABEL_227;
        }
      }
    }
    else if (v102)
    {
      populatePeakingConfig(v103, &peakingConfig_iPhone_Video_NFG_LargeRatio_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
      populateEbeConfig(v104, &ebeConfig_iPhone_Video_NFG_LargeRatio_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
      populateBlendConfig(v118, &blendConfig_iPhone_Video_NFG_LargeRatio_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
      if (logLevel >= 3)
      {
        unsigned int v65 = v122;
        int v67 = v111;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)v130 = &peakingConfig_iPhone_Video_NFG_LargeRatio_V3;
          *(_WORD *)&v130[8] = 2080;
          v131 = "peakingConfig_iPhone_Video_NFG_LargeRatio_V3";
          v105 = &_os_log_internal;
          goto LABEL_226;
        }
LABEL_227:
        int v69 = 0;
        int v68 = v113;
LABEL_229:
        v70 = v114;
        goto LABEL_48;
      }
    }
    else
    {
      populatePeakingConfig(v103, &peakingConfig_Video_NFG_LargeRatio_V3, (uint64_t)&defaultWeightedPeakingConfig, a16, a17, v37);
      populateEbeConfig(v104, &ebeConfig_SettingVideo_NFG_LargeRatio_V3, (uint64_t *)&defaultWeightedEbeConfig, a16, a17, v37);
      populateBlendConfig(v118, &blendConfig_SettingVideo_NFG_LargeRatio_V3, (uint64_t *)&defaultWeightedBlendConfig, a16, a17, v37);
      if (logLevel >= 3)
      {
        unsigned int v65 = v122;
        int v67 = v111;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)v130 = &peakingConfig_Video_NFG_LargeRatio_V3;
          *(_WORD *)&v130[8] = 2080;
          v131 = "peakingConfig_Video_NFG_LargeRatio_V3";
          v105 = &_os_log_internal;
          goto LABEL_226;
        }
        goto LABEL_227;
      }
    }
    int v69 = 0;
    unsigned int v65 = v122;
    int v67 = v111;
    int v68 = v113;
    goto LABEL_229;
  }
  v99 = v71;
  v100 = v72;
  if (v98 >= 0x18) {
    int v67 = 24;
  }
  else {
    int v67 = v98;
  }
  if (v66 <= 0x30)
  {
LABEL_211:
    unsigned int v65 = v122;
    memcpy(&v121[6], v127, 0x504uLL);
    memcpy((char *)&v121[167] + 4, v126, 0x83CuLL);
    memcpy(&v121[432], __dst, 0x610uLL);
    if (logLevel < 3)
    {
      int v69 = 2;
      v72 = v100;
      int v68 = v113;
      int v43 = v106;
      v70 = v114;
      v71 = v99;
      goto LABEL_48;
    }
    v71 = v99;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      *(void *)v130 = v127;
      *(_WORD *)&v130[8] = 2080;
      v131 = "peakingConfig_FG";
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] pixelControl[%p]=%s\n", buf, 0x16u);
    }
    int v69 = 2;
    v72 = v100;
    int v68 = v113;
    int v43 = v106;
    goto LABEL_229;
  }
  unsigned int v66 = 0;
LABEL_189:
  int v101 = 1;
LABEL_190:
  int v117 = v101;
  unsigned int v65 = v122;
  memcpy(&v121[6], v128, 0x504uLL);
  memcpy((char *)&v121[167] + 4, __src, 0x83CuLL);
  memcpy(&v121[432], v123, 0x610uLL);
  if (logLevel < 3)
  {
    v72 = v100;
    int v68 = v113;
    int v43 = v106;
    v70 = v114;
    v71 = v99;
  }
  else
  {
    v71 = v99;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      *(void *)v130 = v128;
      *(_WORD *)&v130[8] = 2080;
      v131 = "peakingConfig_Mix";
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] pixelControl[%p]=%s\n", buf, 0x16u);
    }
    v72 = v100;
    int v68 = v113;
    int v43 = v106;
    v70 = v114;
  }
  int v69 = v117;
LABEL_48:
  *a17 |= 0x1Cu;
  if (v65 >= 0x501)
  {
    int v73 = v43;
    int v74 = v68;
    v116 = v32;
    v75 = v72;
    v76 = v47;
    v77 = v71;
    v78 = v70;
    int v79 = v69;
    isPhone(a13);
    int v69 = v79;
    v70 = v78;
    v71 = v77;
    v47 = v76;
    v72 = v75;
    v35 = a17;
    unsigned int v65 = v122;
    v32 = v116;
    int v68 = v74;
    int v43 = v73;
  }
  v121[627] = (int8x8_t)0x2D0000000005;
  *v35 |= 0x20u;
  int *v119 = v68;
  int *v71 = v69;
  int *v70 = v67;
  *a9 = v66;
  unsigned int *v72 = v32[16] + v32[15];
  _DWORD *v47 = v32[32] + v32[31];
  *a12 = v120;
  populateNoiseConfig((int *)&v121[629], v65, v43, v68, v35);
}

uint64_t calculate_graphics_control_setting_V3(int8x8_t *a1, unsigned int a2, unsigned int a3, double a4, double a5, double a6, uint64_t a7, uint64_t a8, unsigned int a9, unsigned int a10, uint64_t a11, _DWORD *a12)
{
  *(float *)&a4 = (float)a9 / (float)a2;
  float v14 = (float)a10 / (float)a3;
  if (*(float *)&a4 >= v14) {
    float v15 = (float)a10 / (float)a3;
  }
  else {
    float v15 = (float)a9 / (float)a2;
  }
  *(float *)&a6 = (float)a3;
  populateScalingConfig(a1 + 2, a12, *(int8x8_t *)&a4, v14, *(int32x2_t *)&a6);
  populatePeakingConfig((char *)&a1[6], &peakingConfig_InitialSettingVideo_V3, (uint64_t)&defaultWeightedPeakingConfig, a11, a12, v15);
  populateEbeConfig((int *)&a1[167] + 1, &ebeConfig_InitialSettingVideo_V3, (uint64_t *)&defaultWeightedEbeConfig, a11, a12, v15);
  return populateBlendConfig(&a1[432], &blendConfig_InitialSettingVideo_V3, (uint64_t *)&defaultWeightedBlendConfig, a11, a12, v15);
}

uint64_t getCurrentProductType()
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v0 = MGCopyAnswer();
  if (v0)
  {
    CFStringRef v1 = (const __CFString *)v0;
    uint64_t v2 = MGGetSInt64Answer();
    if (CFStringCompare(v1, @"iPhone", 0))
    {
      if (CFStringCompare(v1, @"iPad", 0))
      {
        if (CFStringCompare(v1, @"Mac", 0))
        {
          if (CFStringCompare(v1, @"Apple TV", 0))
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
            {
              int v6 = 136315906;
              int v7 = "ASEproductType getCurrentProductType(void)";
              __int16 v8 = 2048;
              *(void *)int v9 = v1;
              *(_WORD *)&v9[8] = 2112;
              *(void *)&v9[10] = v1;
              *(_WORD *)&v9[18] = 2048;
              *(void *)&v9[20] = v2;
              _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] %s : Unknown device! deviceNameRef: %p, %@, chipID = 0x%llx\n", (uint8_t *)&v6, 0x2Au);
            }
            uint64_t v3 = 7;
            goto LABEL_68;
          }
          uint64_t v3 = 20;
LABEL_64:
          if (logLevel >= 4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            int v6 = 136315906;
            int v7 = "getCurrentProductType";
            __int16 v8 = 1024;
            *(_DWORD *)int v9 = v3;
            *(_WORD *)&v9[4] = 2112;
            *(void *)&v9[6] = v1;
            *(_WORD *)&v9[14] = 2048;
            *(void *)&v9[16] = v2;
            _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] %s: productType=%d, deviceName = %@, chipID = 0x%llx\n", (uint8_t *)&v6, 0x26u);
          }
          goto LABEL_68;
        }
        if (v2 == 33090) {
          uint64_t v3 = 19;
        }
        else {
          uint64_t v3 = 18;
        }
        if (!enableT1Sim) {
          goto LABEL_64;
        }
        if (logLevel >= 4)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            int v6 = 136315138;
            int v7 = "getCurrentProductType";
            _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] %s: T1 Simulation enabled!\n", (uint8_t *)&v6, 0xCu);
          }
          uint64_t v3 = 19;
          goto LABEL_64;
        }
        uint64_t v3 = 19;
LABEL_68:
        CFRelease(v1);
        return v3;
      }
      if (v2 > 33041)
      {
        if (v2 > 33073)
        {
          if (v2 == 33090)
          {
            uint64_t v3 = 17;
            goto LABEL_58;
          }
          if (v2 == 33074)
          {
            uint64_t v3 = 16;
            goto LABEL_58;
          }
        }
        else
        {
          if (v2 == 33042)
          {
            uint64_t v3 = 14;
            goto LABEL_58;
          }
          if (v2 == 33058)
          {
            uint64_t v3 = 15;
            goto LABEL_58;
          }
        }
      }
      else if (v2 > 33026)
      {
        if (v2 == 33027)
        {
          uint64_t v3 = 11;
          goto LABEL_58;
        }
        if (v2 == 33040)
        {
          uint64_t v3 = 13;
          goto LABEL_58;
        }
      }
      else
      {
        if (v2 == 32807)
        {
          uint64_t v3 = 9;
          goto LABEL_58;
        }
        if (v2 == 33025)
        {
          uint64_t v3 = 10;
          goto LABEL_58;
        }
      }
      uint64_t v3 = 7;
LABEL_58:
      if (!enableT1Sim) {
        goto LABEL_64;
      }
      if (logLevel >= 4)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          int v6 = 136315138;
          int v7 = "getCurrentProductType";
          unsigned int v4 = &_os_log_internal;
          goto LABEL_62;
        }
        goto LABEL_63;
      }
      goto LABEL_67;
    }
    if (v2 <= 33055)
    {
      if (v2 == 33025)
      {
        uint64_t v3 = 2;
        goto LABEL_42;
      }
      if (v2 == 33040)
      {
        uint64_t v3 = 3;
        goto LABEL_42;
      }
    }
    else
    {
      switch(v2)
      {
        case 33056:
          uint64_t v3 = 4;
          goto LABEL_42;
        case 33088:
          uint64_t v3 = 6;
          goto LABEL_42;
        case 33072:
          uint64_t v3 = 5;
          goto LABEL_42;
      }
    }
    uint64_t v3 = 1;
LABEL_42:
    if (!enableT1Sim) {
      goto LABEL_64;
    }
    if (logLevel >= 4)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 136315138;
        int v7 = "getCurrentProductType";
        unsigned int v4 = &_os_log_internal;
LABEL_62:
        _os_log_impl(&dword_2107A5000, v4, OS_LOG_TYPE_DEFAULT, " [1.37.0] %s: T1 Simulation enabled!\n", (uint8_t *)&v6, 0xCu);
      }
LABEL_63:
      uint64_t v3 = 17;
      goto LABEL_64;
    }
LABEL_67:
    uint64_t v3 = 17;
    goto LABEL_68;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    int v7 = "getCurrentProductType";
    _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] %s: Failed to query kMGQDeviceName\n", (uint8_t *)&v6, 0xCu);
  }
  return 7;
}

BOOL isPhone(int a1)
{
  return (a1 - 1) < 6;
}

BOOL isPad(int a1)
{
  return (a1 - 8) < 0xA;
}

BOOL isMac(int a1)
{
  return a1 == 19;
}

BOOL isT1OrNewer(int a1)
{
  return (a1 & 0xFFFFFFFD) == 17;
}

float calculate_control_setting_V2(int *a1, uint64_t a2, unsigned int a3, unsigned int a4, int a5, unsigned int *a6, int *a7, int *a8, unsigned int *a9, unsigned int *a10, unsigned int *a11, unsigned int *a12, unsigned int a13)
{
  uint64_t v17 = a12;
  uint64_t v123 = *MEMORY[0x263EF8340];
  unsigned int v18 = *a6;
  int v90 = *a8;
  int v91 = *a7;
  unsigned int v89 = *a9;
  memset(__src, 0, 512);
  memset(__dst, 0, 512);
  long long v109 = 0uLL;
  int v110 = 0;
  long long v107 = 0uLL;
  int v108 = 0;
  memset(v106, 0, sizeof(v106));
  memset(&v105[14], 0, 64);
  unsigned int v19 = 100 * a1[94];
  unsigned int v20 = a1[30];
  if (v20 <= a1[46]) {
    unsigned int v20 = a1[46];
  }
  memset(v105, 0, 224);
  unsigned int v21 = v19 / v20;
  BOOL v23 = a3 > 0x383 && a4 > 0x1F3;
  BOOL v93 = v23;
  if (a5)
  {
    unsigned int v24 = a1[16] + a1[15];
    unsigned int v25 = *a10 - v24;
    unsigned int v26 = a1[32] + a1[31];
    unsigned int v27 = *a11;
    unsigned int v28 = *a12;
    if (v24 > *a10) {
      unsigned int v25 = v24 - *a10;
    }
    if (v24 >= *a10) {
      unsigned int v24 = *a10;
    }
    unsigned int v29 = v26 - v27;
    if (v26 <= v27) {
      unsigned int v29 = *a11 - v26;
    }
    unsigned int v30 = 100 * v25 / v24;
    unsigned int v31 = 100 * v29;
    if (v26 >= v27) {
      unsigned int v32 = *a11;
    }
    else {
      unsigned int v32 = a1[32] + a1[31];
    }
    unsigned int v33 = v31 / v32;
    if (v30 <= v33) {
      unsigned int v30 = v33;
    }
    unsigned int v34 = v21 - v28;
    if (v21 <= v28) {
      unsigned int v34 = *a12 - v21;
    }
    unsigned int v35 = 100 * v34;
    if (v21 >= v28) {
      unsigned int v36 = *a12;
    }
    else {
      unsigned int v36 = v21;
    }
    BOOL v37 = v30 + v35 / v36 > 0x64;
  }
  else
  {
    BOOL v37 = 0;
  }
  int v38 = *a1;
  unsigned int v97 = a4 - 22;
  unsigned int v98 = a3 - 22;
  if (logLevel >= 3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v39 = *a12;
    int v40 = a1[16] + a1[15];
    unsigned int v41 = *a10;
    int v42 = a1[32] + a1[31];
    unsigned int v43 = *a11;
    *(_DWORD *)buf = 67110656;
    *(_DWORD *)v114 = v37;
    *(_WORD *)&v114[4] = 1024;
    *(_DWORD *)&v114[6] = v21;
    LOWORD(v115) = 1024;
    *(_DWORD *)((char *)&v115 + 2) = v39;
    HIWORD(v115) = 1024;
    int v116 = v40;
    __int16 v117 = 1024;
    unsigned int v118 = v41;
    __int16 v119 = 1024;
    int v120 = v42;
    __int16 v121 = 1024;
    unsigned int v122 = v43;
    _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] scene_change_detected = %d, ratio_2D_1D is :%d vs %d; H1 is : %d vs %d,  V1 is: %d vs %d;\n",
      buf,
      0x2Cu);
  }
  if (!a5 || (int)(100 * v38 / v98 * v97) < 20 || a5 != 1 && v37)
  {
    memcpy((void *)(a2 + 28), &InitialSettingVideo_V2, 0x22CuLL);
    *(_DWORD *)(a2 + 592) = 0;
    *(_OWORD *)(a2 + 604) = downSample_InitialSettingVideo_V2;
    *(_DWORD *)(a2 + 620) = dword_26776239C;
    memcpy((void *)(a2 + 632), &blendLogic_InitialSettingVideo_V2, 0x120uLL);
    long long v44 = unk_2677624D0;
    *(_OWORD *)(a2 + 928) = objectProtection_InitialSettingVideo_V2;
    *(_OWORD *)(a2 + 944) = v44;
    *(_OWORD *)(a2 + 960) = xmmword_2677624E0;
    *(_OWORD *)(a2 + 972) = *(long long *)((char *)&xmmword_2677624E0 + 12);
    if (logLevel >= 3)
    {
      unsigned int v45 = a13;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        *(void *)v114 = &InitialSettingVideo_V2;
        *(_WORD *)&v114[8] = 2080;
        v115 = "InitialSettingVideo_V2";
        _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] pixelControl[%p]=%s\n", buf, 0x16u);
      }
      unsigned int v46 = 0;
      int v47 = 0;
      unsigned int v18 = 4;
      int v48 = 1;
      goto LABEL_41;
    }
    unsigned int v46 = 0;
    int v47 = 0;
    unsigned int v18 = 4;
    int v48 = 1;
LABEL_40:
    unsigned int v45 = a13;
    goto LABEL_41;
  }
  uint64_t v51 = 0;
  unsigned int v52 = 0;
  unsigned int v53 = 0;
  do
  {
    v52 += a1[v51 + 23];
    v53 += a1[v51 + 39];
    ++v51;
  }
  while (v51 != 7);
  unsigned int v54 = 0;
  for (uint64_t i = 79; i != 94; ++i)
    v54 += a1[i];
  int v56 = 10 * a1[46] / v53 + 10 * a1[30] / v52;
  signed int v57 = 10 * a1[94] / v54;
  if (v57 <= 349) {
    int v56 = 350 * v56 / v57;
  }
  int v58 = 0;
  for (uint64_t j = 47; j != 62; ++j)
    v58 += a1[j];
  HIDWORD(v60) = 1079574528;
  LODWORD(v60) = *a1;
  double v61 = (double)v58 * 100.0 / (double)v60;
  if (v61 >= 7.0)
  {
    if (v61 > 8.0)
    {
      if (v18 - 1 <= 4) {
        unsigned int v18 = 4;
      }
      else {
        --v18;
      }
    }
  }
  else
  {
    ++v18;
  }
  if (v18 <= 0xE)
  {
    if (v18 < 0xA)
    {
      if (v18 < 6) {
        signed int v62 = 0;
      }
      else {
        signed int v62 = (50 * v18 - 300) >> 2;
      }
    }
    else
    {
      signed int v62 = ((50 * (_BYTE)v18 + 12) & 0xFEu) / 5 + 50;
    }
  }
  else
  {
    signed int v62 = 100;
  }
  if (v56 <= 30)
  {
    if (v56 < 24)
    {
      if (v56 < 12) {
        signed int v63 = 100;
      }
      else {
        signed int v63 = (unsigned __int16)(50 * (24 - v56)) / 0xCu + 50;
      }
    }
    else
    {
      signed int v63 = (unsigned __int16)(50 * (30 - v56)) / 6u;
    }
  }
  else
  {
    signed int v63 = 0;
  }
  if (logLevel >= 3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)v114 = a5;
    *(_WORD *)&v114[4] = 1024;
    *(_DWORD *)&v114[6] = v62;
    LOWORD(v115) = 1024;
    *(_DWORD *)((char *)&v115 + 2) = v63;
    HIWORD(v115) = 1024;
    int v116 = v56;
    _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] Frame %d:  Curr_FG_level = %d, Curr_badly_coded_FG_level = %d, No_Bad_coded_FilmGrain_score  = %d \n", buf, 0x1Au);
  }
  if (v62 <= v63) {
    unsigned int v64 = v63;
  }
  else {
    unsigned int v64 = v62;
  }
  unsigned int v45 = a13;
  if (a13 - 2 > 4)
  {
    if (logLevel >= 4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] Apply iPad control setting V2\n", buf, 2u);
    }
    if (v93)
    {
      if (v64 > 0x1D)
      {
        if (v64 > 0x31)
        {
          if (v64 > 0x45)
          {
            if (v64 > 0x5E)
            {
              memcpy(__dst, &SettingVideo_Heavy_FG_V2, 0x22CuLL);
              long long v109 = downSample_SettingVideo_Heavy_FG_V2;
              int v110 = dword_267762AD4;
              memcpy(v106, &blendLogic_SettingVideo_Heavy_FG_V2, sizeof(v106));
              long long v102 = objectProtection_SettingVideo_Heavy_FG_V2;
              long long v103 = unk_267762C08;
              *(_OWORD *)v104 = xmmword_267762C18;
              *(_OWORD *)&v104[12] = *(long long *)((char *)&xmmword_267762C18 + 12);
              memcpy(__src, &SettingVideo_Heavy_FG_mix_V2, 0x22CuLL);
              long long v107 = downSample_SettingVideo_Heavy_FG_mix_V2;
              int v108 = dword_267763CE0;
              memcpy(v105, &blendLogic_SettingVideo_Heavy_FG_mix_V2, sizeof(v105));
              long long v99 = objectProtection_SettingVideo_Heavy_FG_mix_V2;
              long long v100 = unk_267763E14;
              *(_OWORD *)int v101 = xmmword_267763E24;
              *(_OWORD *)&v101[12] = *(long long *)((char *)&xmmword_267763E24 + 12);
              if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_167;
              }
              *(_WORD *)buf = 0;
              unsigned int v65 = &_os_log_internal;
              unsigned int v66 = " [1.37.0] Film grain level heavy\n";
            }
            else
            {
              memcpy(__dst, &SettingVideo_level3_FG_V2, 0x22CuLL);
              long long v109 = downSample_SettingVideo_level3_FG_V2;
              int v110 = dword_267763944;
              memcpy(v106, &blendLogic_SettingVideo_level3_FG_V2, sizeof(v106));
              long long v102 = objectProtection_SettingVideo_level3_FG_V2;
              long long v103 = unk_267763A78;
              *(_OWORD *)v104 = xmmword_267763A88;
              *(_OWORD *)&v104[12] = *(long long *)((char *)&xmmword_267763A88 + 12);
              memcpy(__src, &SettingVideo_level3_FG_mix_V2, 0x22CuLL);
              long long v107 = downSample_SettingVideo_level3_FG_mix_V2;
              int v108 = dword_267764B50;
              memcpy(v105, &blendLogic_SettingVideo_level3_FG_mix_V2, sizeof(v105));
              long long v99 = objectProtection_SettingVideo_level3_FG_mix_V2;
              long long v100 = unk_267764C84;
              *(_OWORD *)int v101 = xmmword_267764C94;
              *(_OWORD *)&v101[12] = *(long long *)((char *)&xmmword_267764C94 + 12);
              if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_167;
              }
              *(_WORD *)buf = 0;
              unsigned int v65 = &_os_log_internal;
              unsigned int v66 = " [1.37.0] Film grain level 3\n";
            }
          }
          else
          {
            memcpy(__dst, &SettingVideo_level2_FG_V2, 0x22CuLL);
            long long v109 = downSample_SettingVideo_level2_FG_V2;
            int v110 = dword_2677635A8;
            memcpy(v106, &blendLogic_SettingVideo_level2_FG_V2, sizeof(v106));
            long long v102 = objectProtection_SettingVideo_level2_FG_V2;
            long long v103 = unk_2677636DC;
            *(_OWORD *)v104 = xmmword_2677636EC;
            *(_OWORD *)&v104[12] = *(long long *)((char *)&xmmword_2677636EC + 12);
            memcpy(__src, &SettingVideo_level2_FG_mix_V2, 0x22CuLL);
            long long v107 = downSample_SettingVideo_level2_FG_mix_V2;
            int v108 = dword_2677647B4;
            memcpy(v105, &blendLogic_SettingVideo_level2_FG_mix_V2, sizeof(v105));
            long long v99 = objectProtection_SettingVideo_level2_FG_mix_V2;
            long long v100 = unk_2677648E8;
            *(_OWORD *)int v101 = xmmword_2677648F8;
            *(_OWORD *)&v101[12] = *(long long *)((char *)&xmmword_2677648F8 + 12);
            if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_167;
            }
            *(_WORD *)buf = 0;
            unsigned int v65 = &_os_log_internal;
            unsigned int v66 = " [1.37.0] Film grain level 2\n";
          }
        }
        else
        {
          memcpy(__dst, &SettingVideo_level1_FG_V2, 0x22CuLL);
          long long v109 = downSample_SettingVideo_level1_FG_V2;
          int v110 = dword_26776320C;
          memcpy(v106, &blendLogic_SettingVideo_level1_FG_V2, sizeof(v106));
          long long v102 = objectProtection_SettingVideo_level1_FG_V2;
          long long v103 = unk_267763340;
          *(_OWORD *)v104 = xmmword_267763350;
          *(_OWORD *)&v104[12] = *(long long *)((char *)&xmmword_267763350 + 12);
          memcpy(__src, &SettingVideo_level1_FG_mix_V2, 0x22CuLL);
          long long v107 = downSample_SettingVideo_level1_FG_mix_V2;
          int v108 = dword_267764418;
          memcpy(v105, &blendLogic_SettingVideo_level1_FG_mix_V2, sizeof(v105));
          long long v99 = objectProtection_SettingVideo_level1_FG_mix_V2;
          long long v100 = unk_26776454C;
          *(_OWORD *)int v101 = xmmword_26776455C;
          *(_OWORD *)&v101[12] = *(long long *)((char *)&xmmword_26776455C + 12);
          if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_167;
          }
          *(_WORD *)buf = 0;
          unsigned int v65 = &_os_log_internal;
          unsigned int v66 = " [1.37.0] Film grain level 1\n";
        }
      }
      else
      {
        memcpy(__dst, &SettingVideo_light_FG_V2, 0x22CuLL);
        long long v109 = downSample_SettingVideo_light_FG_V2;
        int v110 = dword_267762E70;
        memcpy(v106, &blendLogic_SettingVideo_light_FG_V2, sizeof(v106));
        long long v102 = objectProtection_SettingVideo_light_FG_V2;
        long long v103 = unk_267762FA4;
        *(_OWORD *)v104 = xmmword_267762FB4;
        *(_OWORD *)&v104[12] = *(long long *)((char *)&xmmword_267762FB4 + 12);
        memcpy(__src, &SettingVideo_light_FG_mix_V2, 0x22CuLL);
        long long v107 = downSample_SettingVideo_light_FG_mix_V2;
        int v108 = dword_26776407C;
        memcpy(v105, &blendLogic_SettingVideo_light_FG_mix_V2, sizeof(v105));
        long long v99 = objectProtection_SettingVideo_light_FG_mix_V2;
        long long v100 = unk_2677641B0;
        *(_OWORD *)int v101 = xmmword_2677641C0;
        *(_OWORD *)&v101[12] = *(long long *)((char *)&xmmword_2677641C0 + 12);
        if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_167;
        }
        *(_WORD *)buf = 0;
        unsigned int v65 = &_os_log_internal;
        unsigned int v66 = " [1.37.0] Film grain level light\n";
      }
    }
    else if (v64 > 0x1D)
    {
      if (v64 > 0x31)
      {
        if (v64 > 0x45)
        {
          if (v64 > 0x5E)
          {
            memcpy(__dst, &SettingVideo_Heavy_FG_LargeRatio_V2, 0x22CuLL);
            long long v109 = downSample_SettingVideo_Heavy_FG_LargeRatio_V2;
            int v110 = dword_267765288;
            memcpy(v106, &blendLogic_SettingVideo_Heavy_FG_LargeRatio_V2, sizeof(v106));
            long long v102 = objectProtection_SettingVideo_Heavy_FG_LargeRatio_V2;
            long long v103 = unk_2677653BC;
            *(_OWORD *)v104 = xmmword_2677653CC;
            *(_OWORD *)&v104[12] = *(long long *)((char *)&xmmword_2677653CC + 12);
            memcpy(__src, &SettingVideo_Heavy_FG_mix_LargeRatio_V2, 0x22CuLL);
            long long v107 = downSample_SettingVideo_Heavy_FG_mix_LargeRatio_V2;
            int v108 = dword_267766494;
            memcpy(v105, &blendLogic_SettingVideo_Heavy_FG_mix_LargeRatio_V2, sizeof(v105));
            long long v99 = objectProtection_SettingVideo_Heavy_FG_mix_LargeRatio_V2;
            long long v100 = unk_2677665C8;
            *(_OWORD *)int v101 = xmmword_2677665D8;
            *(_OWORD *)&v101[12] = *(long long *)((char *)&xmmword_2677665D8 + 12);
            if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_167;
            }
            *(_WORD *)buf = 0;
            unsigned int v65 = &_os_log_internal;
            unsigned int v66 = " [1.37.0] Film grain level heavy LargeRatio\n";
          }
          else
          {
            memcpy(__dst, &SettingVideo_level3_FG_LargeRatio_V2, 0x22CuLL);
            long long v109 = downSample_SettingVideo_level3_FG_LargeRatio_V2;
            int v110 = dword_2677660F8;
            memcpy(v106, &blendLogic_SettingVideo_level3_FG_LargeRatio_V2, sizeof(v106));
            long long v102 = objectProtection_SettingVideo_level3_FG_LargeRatio_V2;
            long long v103 = unk_26776622C;
            *(_OWORD *)v104 = xmmword_26776623C;
            *(_OWORD *)&v104[12] = *(long long *)((char *)&xmmword_26776623C + 12);
            memcpy(__src, &SettingVideo_level3_FG_mix_LargeRatio_V2, 0x22CuLL);
            long long v107 = downSample_SettingVideo_level3_FG_mix_LargeRatio_V2;
            int v108 = dword_267767304;
            memcpy(v105, &blendLogic_SettingVideo_level3_FG_mix_LargeRatio_V2, sizeof(v105));
            long long v99 = objectProtection_SettingVideo_level3_FG_mix_LargeRatio_V2;
            long long v100 = unk_267767438;
            *(_OWORD *)int v101 = xmmword_267767448;
            *(_OWORD *)&v101[12] = *(long long *)((char *)&xmmword_267767448 + 12);
            if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_167;
            }
            *(_WORD *)buf = 0;
            unsigned int v65 = &_os_log_internal;
            unsigned int v66 = " [1.37.0] Film grain level 3 LargeRatio\n";
          }
        }
        else
        {
          memcpy(__dst, &SettingVideo_level2_FG_LargeRatio_V2, 0x22CuLL);
          long long v109 = downSample_SettingVideo_level2_FG_LargeRatio_V2;
          int v110 = dword_267765D5C;
          memcpy(v106, &blendLogic_SettingVideo_level2_FG_LargeRatio_V2, sizeof(v106));
          long long v102 = objectProtection_SettingVideo_level2_FG_LargeRatio_V2;
          long long v103 = unk_267765E90;
          *(_OWORD *)v104 = xmmword_267765EA0;
          *(_OWORD *)&v104[12] = *(long long *)((char *)&xmmword_267765EA0 + 12);
          memcpy(__src, &SettingVideo_level2_FG_mix_LargeRatio_V2, 0x22CuLL);
          long long v107 = downSample_SettingVideo_level2_FG_mix_LargeRatio_V2;
          int v108 = dword_267766F68;
          memcpy(v105, &blendLogic_SettingVideo_level2_FG_mix_LargeRatio_V2, sizeof(v105));
          long long v99 = objectProtection_SettingVideo_level2_FG_mix_LargeRatio_V2;
          long long v100 = unk_26776709C;
          *(_OWORD *)int v101 = xmmword_2677670AC;
          *(_OWORD *)&v101[12] = *(long long *)((char *)&xmmword_2677670AC + 12);
          if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_167;
          }
          *(_WORD *)buf = 0;
          unsigned int v65 = &_os_log_internal;
          unsigned int v66 = " [1.37.0] Film grain level 2 LargeRatio\n";
        }
      }
      else
      {
        memcpy(__dst, &SettingVideo_level1_FG_LargeRatio_V2, 0x22CuLL);
        long long v109 = downSample_SettingVideo_level1_FG_LargeRatio_V2;
        int v110 = dword_2677659C0;
        memcpy(v106, &blendLogic_SettingVideo_level1_FG_LargeRatio_V2, sizeof(v106));
        long long v102 = objectProtection_SettingVideo_level1_FG_LargeRatio_V2;
        long long v103 = unk_267765AF4;
        *(_OWORD *)v104 = xmmword_267765B04;
        *(_OWORD *)&v104[12] = *(long long *)((char *)&xmmword_267765B04 + 12);
        memcpy(__src, &SettingVideo_level1_FG_mix_LargeRatio_V2, 0x22CuLL);
        long long v107 = downSample_SettingVideo_level1_FG_mix_LargeRatio_V2;
        int v108 = dword_267766BCC;
        memcpy(v105, &blendLogic_SettingVideo_level1_FG_mix_LargeRatio_V2, sizeof(v105));
        long long v99 = objectProtection_SettingVideo_level1_FG_mix_LargeRatio_V2;
        long long v100 = unk_267766D00;
        *(_OWORD *)int v101 = xmmword_267766D10;
        *(_OWORD *)&v101[12] = *(long long *)((char *)&xmmword_267766D10 + 12);
        if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_167;
        }
        *(_WORD *)buf = 0;
        unsigned int v65 = &_os_log_internal;
        unsigned int v66 = " [1.37.0] Film grain level 1 LargeRatio\n";
      }
    }
    else
    {
      memcpy(__dst, &SettingVideo_light_FG_LargeRatio_V2, 0x22CuLL);
      long long v109 = downSample_SettingVideo_light_FG_LargeRatio_V2;
      int v110 = dword_267765624;
      memcpy(v106, &blendLogic_SettingVideo_light_FG_LargeRatio_V2, sizeof(v106));
      long long v102 = objectProtection_SettingVideo_light_FG_LargeRatio_V2;
      long long v103 = unk_267765758;
      *(_OWORD *)v104 = xmmword_267765768;
      *(_OWORD *)&v104[12] = *(long long *)((char *)&xmmword_267765768 + 12);
      memcpy(__src, &SettingVideo_light_FG_mix_LargeRatio_V2, 0x22CuLL);
      long long v107 = downSample_SettingVideo_light_FG_mix_LargeRatio_V2;
      int v108 = dword_267766830;
      memcpy(v105, &blendLogic_SettingVideo_light_FG_mix_LargeRatio_V2, sizeof(v105));
      long long v99 = objectProtection_SettingVideo_light_FG_mix_LargeRatio_V2;
      long long v100 = unk_267766964;
      *(_OWORD *)int v101 = xmmword_267766974;
      *(_OWORD *)&v101[12] = *(long long *)((char *)&xmmword_267766974 + 12);
      if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_167;
      }
      *(_WORD *)buf = 0;
      unsigned int v65 = &_os_log_internal;
      unsigned int v66 = " [1.37.0] Film grain level light LargeRatio\n";
    }
  }
  else
  {
    if (logLevel >= 4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] Apply iPhone control setting V2\n", buf, 2u);
    }
    if (v93)
    {
      if (v64 > 0x1D)
      {
        if (v64 > 0x31)
        {
          if (v64 > 0x45)
          {
            if (v64 > 0x5E)
            {
              memcpy(__dst, &iPhone_SettingVideo_Heavy_FG_V2, 0x22CuLL);
              long long v109 = downSample_iPhone_SettingVideo_Heavy_FG_V2;
              int v110 = dword_267767A3C;
              memcpy(v106, &blendLogic_iPhone_SettingVideo_Heavy_FG_V2, sizeof(v106));
              long long v102 = objectProtection_iPhone_SettingVideo_Heavy_FG_V2;
              long long v103 = unk_267767B70;
              *(_OWORD *)v104 = xmmword_267767B80;
              *(_OWORD *)&v104[12] = *(long long *)((char *)&xmmword_267767B80 + 12);
              memcpy(__src, &iPhone_SettingVideo_Heavy_FG_mix_V2, 0x22CuLL);
              long long v107 = downSample_iPhone_SettingVideo_Heavy_FG_mix_V2;
              int v108 = dword_267768C48;
              memcpy(v105, &blendLogic_iPhone_SettingVideo_Heavy_FG_mix_V2, sizeof(v105));
              long long v99 = objectProtection_iPhone_SettingVideo_Heavy_FG_mix_V2;
              long long v100 = unk_267768D7C;
              *(_OWORD *)int v101 = xmmword_267768D8C;
              *(_OWORD *)&v101[12] = *(long long *)((char *)&xmmword_267768D8C + 12);
              if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_167;
              }
              *(_WORD *)buf = 0;
              unsigned int v65 = &_os_log_internal;
              unsigned int v66 = " [1.37.0] Film grain level heavy\n";
            }
            else
            {
              memcpy(__dst, &iPhone_SettingVideo_level3_FG_V2, 0x22CuLL);
              long long v109 = downSample_iPhone_SettingVideo_level3_FG_V2;
              int v110 = dword_2677688AC;
              memcpy(v106, &blendLogic_iPhone_SettingVideo_level3_FG_V2, sizeof(v106));
              long long v102 = objectProtection_iPhone_SettingVideo_level3_FG_V2;
              long long v103 = unk_2677689E0;
              *(_OWORD *)v104 = xmmword_2677689F0;
              *(_OWORD *)&v104[12] = *(long long *)((char *)&xmmword_2677689F0 + 12);
              memcpy(__src, &iPhone_SettingVideo_level3_FG_mix_V2, 0x22CuLL);
              long long v107 = downSample_iPhone_SettingVideo_level3_FG_mix_V2;
              int v108 = dword_267769AB8;
              memcpy(v105, &blendLogic_iPhone_SettingVideo_level3_FG_mix_V2, sizeof(v105));
              long long v99 = objectProtection_iPhone_SettingVideo_level3_FG_mix_V2;
              long long v100 = unk_267769BEC;
              *(_OWORD *)int v101 = xmmword_267769BFC;
              *(_OWORD *)&v101[12] = *(long long *)((char *)&xmmword_267769BFC + 12);
              if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_167;
              }
              *(_WORD *)buf = 0;
              unsigned int v65 = &_os_log_internal;
              unsigned int v66 = " [1.37.0] Film grain level 3\n";
            }
          }
          else
          {
            memcpy(__dst, &iPhone_SettingVideo_level2_FG_V2, 0x22CuLL);
            long long v109 = downSample_iPhone_SettingVideo_level2_FG_V2;
            int v110 = dword_267768510;
            memcpy(v106, &blendLogic_iPhone_SettingVideo_level2_FG_V2, sizeof(v106));
            long long v102 = objectProtection_iPhone_SettingVideo_level2_FG_V2;
            long long v103 = unk_267768644;
            *(_OWORD *)v104 = xmmword_267768654;
            *(_OWORD *)&v104[12] = *(long long *)((char *)&xmmword_267768654 + 12);
            memcpy(__src, &iPhone_SettingVideo_level2_FG_mix_V2, 0x22CuLL);
            long long v107 = downSample_iPhone_SettingVideo_level2_FG_mix_V2;
            int v108 = dword_26776971C;
            memcpy(v105, &blendLogic_iPhone_SettingVideo_level2_FG_mix_V2, sizeof(v105));
            long long v99 = objectProtection_iPhone_SettingVideo_level2_FG_mix_V2;
            long long v100 = unk_267769850;
            *(_OWORD *)int v101 = xmmword_267769860;
            *(_OWORD *)&v101[12] = *(long long *)((char *)&xmmword_267769860 + 12);
            if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_167;
            }
            *(_WORD *)buf = 0;
            unsigned int v65 = &_os_log_internal;
            unsigned int v66 = " [1.37.0] Film grain level 2\n";
          }
        }
        else
        {
          memcpy(__dst, &iPhone_SettingVideo_level1_FG_V2, 0x22CuLL);
          long long v109 = downSample_iPhone_SettingVideo_level1_FG_V2;
          int v110 = dword_267768174;
          memcpy(v106, &blendLogic_iPhone_SettingVideo_level1_FG_V2, sizeof(v106));
          long long v102 = objectProtection_iPhone_SettingVideo_level1_FG_V2;
          long long v103 = unk_2677682A8;
          *(_OWORD *)v104 = xmmword_2677682B8;
          *(_OWORD *)&v104[12] = *(long long *)((char *)&xmmword_2677682B8 + 12);
          memcpy(__src, &iPhone_SettingVideo_level1_FG_mix_V2, 0x22CuLL);
          long long v107 = downSample_iPhone_SettingVideo_level1_FG_mix_V2;
          int v108 = dword_267769380;
          memcpy(v105, &blendLogic_iPhone_SettingVideo_level1_FG_mix_V2, sizeof(v105));
          long long v99 = objectProtection_iPhone_SettingVideo_level1_FG_mix_V2;
          long long v100 = unk_2677694B4;
          *(_OWORD *)int v101 = xmmword_2677694C4;
          *(_OWORD *)&v101[12] = *(long long *)((char *)&xmmword_2677694C4 + 12);
          if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_167;
          }
          *(_WORD *)buf = 0;
          unsigned int v65 = &_os_log_internal;
          unsigned int v66 = " [1.37.0] Film grain level 1\n";
        }
      }
      else
      {
        memcpy(__dst, &iPhone_SettingVideo_light_FG_V2, 0x22CuLL);
        long long v109 = downSample_iPhone_SettingVideo_light_FG_V2;
        int v110 = dword_267767DD8;
        memcpy(v106, &blendLogic_iPhone_SettingVideo_light_FG_V2, sizeof(v106));
        long long v102 = objectProtection_iPhone_SettingVideo_light_FG_V2;
        long long v103 = unk_267767F0C;
        *(_OWORD *)v104 = xmmword_267767F1C;
        *(_OWORD *)&v104[12] = *(long long *)((char *)&xmmword_267767F1C + 12);
        memcpy(__src, &iPhone_SettingVideo_light_FG_mix_V2, 0x22CuLL);
        long long v107 = downSample_iPhone_SettingVideo_light_FG_mix_V2;
        int v108 = dword_267768FE4;
        memcpy(v105, &blendLogic_iPhone_SettingVideo_light_FG_mix_V2, sizeof(v105));
        long long v99 = objectProtection_iPhone_SettingVideo_light_FG_mix_V2;
        long long v100 = unk_267769118;
        *(_OWORD *)int v101 = xmmword_267769128;
        *(_OWORD *)&v101[12] = *(long long *)((char *)&xmmword_267769128 + 12);
        if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_167;
        }
        *(_WORD *)buf = 0;
        unsigned int v65 = &_os_log_internal;
        unsigned int v66 = " [1.37.0] Film grain level light\n";
      }
    }
    else if (v64 > 0x1D)
    {
      if (v64 > 0x31)
      {
        if (v64 > 0x45)
        {
          if (v64 > 0x5E)
          {
            memcpy(__dst, &iPhone_SettingVideo_Heavy_FG_LargeRatio_V2, 0x22CuLL);
            long long v109 = downSample_iPhone_SettingVideo_Heavy_FG_LargeRatio_V2;
            int v110 = dword_26776A1F0;
            memcpy(v106, &blendLogic_iPhone_SettingVideo_Heavy_FG_LargeRatio_V2, sizeof(v106));
            long long v102 = objectProtection_iPhone_SettingVideo_Heavy_FG_LargeRatio_V2;
            long long v103 = unk_26776A324;
            *(_OWORD *)v104 = xmmword_26776A334;
            *(_OWORD *)&v104[12] = *(long long *)((char *)&xmmword_26776A334 + 12);
            memcpy(__src, &iPhone_SettingVideo_Heavy_FG_mix_LargeRatio_V2, 0x22CuLL);
            long long v107 = downSample_iPhone_SettingVideo_Heavy_FG_mix_LargeRatio_V2;
            int v108 = dword_26776B3FC;
            memcpy(v105, &blendLogic_iPhone_SettingVideo_Heavy_FG_mix_LargeRatio_V2, sizeof(v105));
            long long v99 = objectProtection_iPhone_SettingVideo_Heavy_FG_mix_LargeRatio_V2;
            long long v100 = unk_26776B530;
            *(_OWORD *)int v101 = xmmword_26776B540;
            *(_OWORD *)&v101[12] = *(long long *)((char *)&xmmword_26776B540 + 12);
            if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_167;
            }
            *(_WORD *)buf = 0;
            unsigned int v65 = &_os_log_internal;
            unsigned int v66 = " [1.37.0] Film grain level heavy LargeRatio\n";
          }
          else
          {
            memcpy(__dst, &iPhone_SettingVideo_level3_FG_LargeRatio_V2, 0x22CuLL);
            long long v109 = downSample_iPhone_SettingVideo_level3_FG_LargeRatio_V2;
            int v110 = dword_26776B060;
            memcpy(v106, &blendLogic_iPhone_SettingVideo_level3_FG_LargeRatio_V2, sizeof(v106));
            long long v102 = objectProtection_iPhone_SettingVideo_level3_FG_LargeRatio_V2;
            long long v103 = unk_26776B194;
            *(_OWORD *)v104 = xmmword_26776B1A4;
            *(_OWORD *)&v104[12] = *(long long *)((char *)&xmmword_26776B1A4 + 12);
            memcpy(__src, &iPhone_SettingVideo_level3_FG_mix_LargeRatio_V2, 0x22CuLL);
            long long v107 = downSample_iPhone_SettingVideo_level3_FG_mix_LargeRatio_V2;
            int v108 = dword_26776C26C;
            memcpy(v105, &blendLogic_iPhone_SettingVideo_level3_FG_mix_LargeRatio_V2, sizeof(v105));
            long long v99 = objectProtection_iPhone_SettingVideo_level3_FG_mix_LargeRatio_V2;
            long long v100 = unk_26776C3A0;
            *(_OWORD *)int v101 = xmmword_26776C3B0;
            *(_OWORD *)&v101[12] = *(long long *)((char *)&xmmword_26776C3B0 + 12);
            if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_167;
            }
            *(_WORD *)buf = 0;
            unsigned int v65 = &_os_log_internal;
            unsigned int v66 = " [1.37.0] Film grain level 3 LargeRatio\n";
          }
        }
        else
        {
          memcpy(__dst, &iPhone_SettingVideo_level2_FG_LargeRatio_V2, 0x22CuLL);
          long long v109 = downSample_iPhone_SettingVideo_level2_FG_LargeRatio_V2;
          int v110 = dword_26776ACC4;
          memcpy(v106, &blendLogic_iPhone_SettingVideo_level2_FG_LargeRatio_V2, sizeof(v106));
          long long v102 = objectProtection_iPhone_SettingVideo_level2_FG_LargeRatio_V2;
          long long v103 = unk_26776ADF8;
          *(_OWORD *)v104 = xmmword_26776AE08;
          *(_OWORD *)&v104[12] = *(long long *)((char *)&xmmword_26776AE08 + 12);
          memcpy(__src, &iPhone_SettingVideo_level2_FG_mix_LargeRatio_V2, 0x22CuLL);
          long long v107 = downSample_iPhone_SettingVideo_level2_FG_mix_LargeRatio_V2;
          int v108 = dword_26776BED0;
          memcpy(v105, &blendLogic_iPhone_SettingVideo_level2_FG_mix_LargeRatio_V2, sizeof(v105));
          long long v99 = objectProtection_iPhone_SettingVideo_level2_FG_mix_LargeRatio_V2;
          long long v100 = unk_26776C004;
          *(_OWORD *)int v101 = xmmword_26776C014;
          *(_OWORD *)&v101[12] = *(long long *)((char *)&xmmword_26776C014 + 12);
          if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_167;
          }
          *(_WORD *)buf = 0;
          unsigned int v65 = &_os_log_internal;
          unsigned int v66 = " [1.37.0] Film grain level 2 LargeRatio\n";
        }
      }
      else
      {
        memcpy(__dst, &iPhone_SettingVideo_level1_FG_LargeRatio_V2, 0x22CuLL);
        long long v109 = downSample_iPhone_SettingVideo_level1_FG_LargeRatio_V2;
        int v110 = dword_26776A928;
        memcpy(v106, &blendLogic_iPhone_SettingVideo_level1_FG_LargeRatio_V2, sizeof(v106));
        long long v102 = objectProtection_iPhone_SettingVideo_level1_FG_LargeRatio_V2;
        long long v103 = unk_26776AA5C;
        *(_OWORD *)v104 = xmmword_26776AA6C;
        *(_OWORD *)&v104[12] = *(long long *)((char *)&xmmword_26776AA6C + 12);
        memcpy(__src, &iPhone_SettingVideo_level1_FG_mix_LargeRatio_V2, 0x22CuLL);
        long long v107 = downSample_iPhone_SettingVideo_level1_FG_mix_LargeRatio_V2;
        int v108 = dword_26776BB34;
        memcpy(v105, &blendLogic_iPhone_SettingVideo_level1_FG_mix_LargeRatio_V2, sizeof(v105));
        long long v99 = objectProtection_iPhone_SettingVideo_level1_FG_mix_LargeRatio_V2;
        long long v100 = unk_26776BC68;
        *(_OWORD *)int v101 = xmmword_26776BC78;
        *(_OWORD *)&v101[12] = *(long long *)((char *)&xmmword_26776BC78 + 12);
        if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_167;
        }
        *(_WORD *)buf = 0;
        unsigned int v65 = &_os_log_internal;
        unsigned int v66 = " [1.37.0] Film grain level 1 LargeRatio\n";
      }
    }
    else
    {
      memcpy(__dst, &iPhone_SettingVideo_light_FG_LargeRatio_V2, 0x22CuLL);
      long long v109 = downSample_iPhone_SettingVideo_light_FG_LargeRatio_V2;
      int v110 = dword_26776A58C;
      memcpy(v106, &blendLogic_iPhone_SettingVideo_light_FG_LargeRatio_V2, sizeof(v106));
      long long v102 = objectProtection_iPhone_SettingVideo_light_FG_LargeRatio_V2;
      long long v103 = unk_26776A6C0;
      *(_OWORD *)v104 = xmmword_26776A6D0;
      *(_OWORD *)&v104[12] = *(long long *)((char *)&xmmword_26776A6D0 + 12);
      memcpy(__src, &iPhone_SettingVideo_light_FG_mix_LargeRatio_V2, 0x22CuLL);
      long long v107 = downSample_iPhone_SettingVideo_light_FG_mix_LargeRatio_V2;
      int v108 = dword_26776B798;
      memcpy(v105, &blendLogic_iPhone_SettingVideo_light_FG_mix_LargeRatio_V2, sizeof(v105));
      long long v99 = objectProtection_iPhone_SettingVideo_light_FG_mix_LargeRatio_V2;
      long long v100 = unk_26776B8CC;
      *(_OWORD *)int v101 = xmmword_26776B8DC;
      *(_OWORD *)&v101[12] = *(long long *)((char *)&xmmword_26776B8DC + 12);
      if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_167;
      }
      *(_WORD *)buf = 0;
      unsigned int v65 = &_os_log_internal;
      unsigned int v66 = " [1.37.0] Film grain level light LargeRatio\n";
    }
  }
  _os_log_impl(&dword_2107A5000, v65, OS_LOG_TYPE_DEFAULT, v66, buf, 2u);
LABEL_167:
  if (v64 <= 0x14) {
    unsigned int v46 = v89 + 1;
  }
  else {
    unsigned int v46 = 0;
  }
  if (v64 > 0x14) {
    unsigned int v67 = v90 + 1;
  }
  else {
    unsigned int v67 = 0;
  }
  if (!v91)
  {
    if (v46 >= 0x30) {
      unsigned int v46 = 48;
    }
    if (v67 > 0x18)
    {
      int v47 = 0;
      goto LABEL_184;
    }
    unsigned int v68 = a13 - 2;
    signed int v92 = a12;
    int v47 = v67;
    goto LABEL_194;
  }
  if (v91 != 2)
  {
    unsigned int v68 = a13 - 2;
    if (v67 <= 0x18) {
      int v47 = v67;
    }
    else {
      int v47 = 0;
    }
    if (v46 <= 0x30)
    {
      if (v67 <= 0x18) {
        int v48 = v91;
      }
      else {
        int v48 = 2;
      }
      if (v48 != 2)
      {
LABEL_185:
        memcpy((void *)(a2 + 28), __src, 0x22CuLL);
        *(_DWORD *)(a2 + 592) = 0;
        *(_OWORD *)(a2 + 604) = v107;
        *(_DWORD *)(a2 + 620) = v108;
        memcpy((void *)(a2 + 632), v105, 0x120uLL);
        *(_OWORD *)(a2 + 928) = v99;
        *(_OWORD *)(a2 + 944) = v100;
        *(_OWORD *)(a2 + 960) = *(_OWORD *)v101;
        *(_OWORD *)(a2 + 972) = *(_OWORD *)&v101[12];
        if (logLevel >= 3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)v114 = __src;
          *(_WORD *)&v114[8] = 2080;
          v115 = "Mix_dyn_setting";
          _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] pixelControl[%p]=%s\n", buf, 0x16u);
        }
        goto LABEL_41;
      }
      goto LABEL_203;
    }
    signed int v92 = a12;
    unsigned int v46 = 0;
LABEL_194:
    int v69 = (void *)(a2 + 28);
    v70 = (_OWORD *)(a2 + 604);
    v71 = (_OWORD *)(a2 + 928);
    if (v93)
    {
      if (v68 <= 4)
      {
        memcpy(v69, &iPhone_SettingVideo_NFG_V2, 0x22CuLL);
        *(_DWORD *)(a2 + 592) = 0;
        _OWORD *v70 = downSample_iPhone_SettingVideo_NFG_V2;
        *(_DWORD *)(a2 + 620) = dword_2677676A0;
        memcpy((void *)(a2 + 632), &blendLogic_iPhone_SettingVideo_NFG_V2, 0x120uLL);
        long long v72 = unk_2677677D4;
        _OWORD *v71 = objectProtection_iPhone_SettingVideo_NFG_V2;
        *(_OWORD *)(a2 + 944) = v72;
        *(_OWORD *)(a2 + 960) = xmmword_2677677E4;
        *(_OWORD *)(a2 + 972) = *(long long *)((char *)&xmmword_2677677E4 + 12);
        if (logLevel >= 3)
        {
          uint64_t v17 = v92;
          unsigned int v45 = a13;
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            *(void *)v114 = &iPhone_SettingVideo_NFG_V2;
            *(_WORD *)&v114[8] = 2080;
            v115 = "iPhone_SettingVideo_NFG_V2";
            int v73 = &_os_log_internal;
LABEL_211:
            _os_log_impl(&dword_2107A5000, v73, OS_LOG_TYPE_DEFAULT, " [1.37.0] pixelControl[%p]=%s\n", buf, 0x16u);
            goto LABEL_212;
          }
          goto LABEL_212;
        }
        goto LABEL_221;
      }
      memcpy(v69, &SettingVideo_NFG_V2, 0x22CuLL);
      *(_DWORD *)(a2 + 592) = 0;
      _OWORD *v70 = downSample_SettingVideo_NFG_V2;
      *(_DWORD *)(a2 + 620) = dword_267762738;
      memcpy((void *)(a2 + 632), &blendLogic_SettingVideo_NFG_V2, 0x120uLL);
      long long v75 = unk_26776286C;
      _OWORD *v71 = objectProtection_SettingVideo_NFG_V2;
      *(_OWORD *)(a2 + 944) = v75;
      *(_OWORD *)(a2 + 960) = xmmword_26776287C;
      *(_OWORD *)(a2 + 972) = *(long long *)((char *)&xmmword_26776287C + 12);
      if (logLevel >= 3)
      {
        uint64_t v17 = v92;
        unsigned int v45 = a13;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)v114 = &SettingVideo_NFG_V2;
          *(_WORD *)&v114[8] = 2080;
          v115 = "SettingVideo_NFG_V2";
          v76 = &_os_log_internal;
LABEL_219:
          _os_log_impl(&dword_2107A5000, v76, OS_LOG_TYPE_DEFAULT, " [1.37.0] pixelControl[%p]=%s\n", buf, 0x16u);
          goto LABEL_220;
        }
        goto LABEL_220;
      }
    }
    else
    {
      if (v68 <= 4)
      {
        memcpy(v69, &iPhone_SettingVideo_NFG_LargeRatio_V2, 0x22CuLL);
        *(_DWORD *)(a2 + 592) = 0;
        _OWORD *v70 = downSample_iPhone_SettingVideo_NFG_LargeRatio_V2;
        *(_DWORD *)(a2 + 620) = dword_267769E54;
        memcpy((void *)(a2 + 632), &blendLogic_iPhone_SettingVideo_NFG_LargeRatio_V2, 0x120uLL);
        long long v74 = unk_267769F88;
        _OWORD *v71 = objectProtection_iPhone_SettingVideo_NFG_LargeRatio_V2;
        *(_OWORD *)(a2 + 944) = v74;
        *(_OWORD *)(a2 + 960) = xmmword_267769F98;
        *(_OWORD *)(a2 + 972) = *(long long *)((char *)&xmmword_267769F98 + 12);
        if (logLevel >= 3)
        {
          uint64_t v17 = v92;
          unsigned int v45 = a13;
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            *(void *)v114 = &iPhone_SettingVideo_NFG_LargeRatio_V2;
            *(_WORD *)&v114[8] = 2080;
            v115 = "iPhone_SettingVideo_NFG_LargeRatio_V2";
            int v73 = &_os_log_internal;
            goto LABEL_211;
          }
LABEL_212:
          int v48 = 0;
          goto LABEL_41;
        }
LABEL_221:
        int v48 = 0;
        uint64_t v17 = v92;
        goto LABEL_40;
      }
      memcpy(v69, &SettingVideo_NFG_LargeRatio_V2, 0x22CuLL);
      *(_DWORD *)(a2 + 592) = 0;
      _OWORD *v70 = downSample_SettingVideo_NFG_LargeRatio_V2;
      *(_DWORD *)(a2 + 620) = dword_267764EEC;
      memcpy((void *)(a2 + 632), &blendLogic_SettingVideo_NFG_LargeRatio_V2, 0x120uLL);
      long long v77 = unk_267765020;
      _OWORD *v71 = objectProtection_SettingVideo_NFG_LargeRatio_V2;
      *(_OWORD *)(a2 + 944) = v77;
      *(_OWORD *)(a2 + 960) = xmmword_267765030;
      *(_OWORD *)(a2 + 972) = *(long long *)((char *)&xmmword_267765030 + 12);
      if (logLevel >= 3)
      {
        uint64_t v17 = v92;
        unsigned int v45 = a13;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)v114 = &SettingVideo_NFG_LargeRatio_V2;
          *(_WORD *)&v114[8] = 2080;
          v115 = "SettingVideo_NFG_LargeRatio_V2";
          v76 = &_os_log_internal;
          goto LABEL_219;
        }
LABEL_220:
        int v48 = 0;
        goto LABEL_223;
      }
    }
    int v48 = 0;
    uint64_t v17 = v92;
    unsigned int v45 = a13;
    goto LABEL_223;
  }
  if (v67 >= 0x18) {
    int v47 = 24;
  }
  else {
    int v47 = v67;
  }
  if (v46 > 0x30)
  {
    unsigned int v46 = 0;
LABEL_184:
    int v48 = 1;
    goto LABEL_185;
  }
LABEL_203:
  memcpy((void *)(a2 + 28), __dst, 0x22CuLL);
  *(_DWORD *)(a2 + 592) = 0;
  *(_OWORD *)(a2 + 604) = v109;
  *(_DWORD *)(a2 + 620) = v110;
  memcpy((void *)(a2 + 632), v106, 0x120uLL);
  *(_OWORD *)(a2 + 928) = v102;
  *(_OWORD *)(a2 + 944) = v103;
  *(_OWORD *)(a2 + 960) = *(_OWORD *)v104;
  *(_OWORD *)(a2 + 972) = *(_OWORD *)&v104[12];
  if (logLevel >= 3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(void *)v114 = __dst;
    *(_WORD *)&v114[8] = 2080;
    v115 = "FG_dyn_setting";
    _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] pixelControl[%p]=%s\n", buf, 0x16u);
  }
  int v48 = 2;
LABEL_41:
  if (a3 < 0x501 || v45 - 2 > 4)
  {
LABEL_223:
    if (a3 < 0x781)
    {
      unsigned int v50 = a7;
      unsigned int v49 = a8;
    }
    else
    {
      BOOL v78 = v45 >= 7;
      unsigned int v50 = a7;
      unsigned int v49 = a8;
      if (v78)
      {
        *(unsigned char *)(a2 + 28) = 0;
        *(void *)(a2 + 40) = 0;
        *(_DWORD *)(a2 + 36) = 0;
      }
    }
    goto LABEL_228;
  }
  *(unsigned char *)(a2 + 28) = 0;
  *(void *)(a2 + 40) = 0;
  *(_DWORD *)(a2 + 36) = 0;
  *(_DWORD *)(a2 + 52) = 0;
  *(_DWORD *)(a2 + 64) = 0;
  *(_DWORD *)(a2 + 76) = 0;
  *(_DWORD *)(a2 + 88) = 0;
  *(_DWORD *)(a2 + 100) = 0;
  *(_DWORD *)(a2 + 112) = 0;
  *(_DWORD *)(a2 + 124) = 0;
  *(_DWORD *)(a2 + 136) = 0;
  *(float32x2_t *)(a2 + 264) = vmul_f32(*(float32x2_t *)(a2 + 264), (float32x2_t)0x3F0000003F000000);
  *(float32x2_t *)(a2 + 276) = vmul_f32(*(float32x2_t *)(a2 + 276), (float32x2_t)0x3F0000003F000000);
  *(float32x2_t *)(a2 + 288) = vmul_f32(*(float32x2_t *)(a2 + 288), (float32x2_t)0x3F0000003F000000);
  *(float32x2_t *)(a2 + 300) = vmul_f32(*(float32x2_t *)(a2 + 300), (float32x2_t)0x3F0000003F000000);
  *(float32x2_t *)(a2 + 312) = vmul_f32(*(float32x2_t *)(a2 + 312), (float32x2_t)0x3F0000003F000000);
  *(float32x2_t *)(a2 + 324) = vmul_f32(*(float32x2_t *)(a2 + 324), (float32x2_t)0x3F0000003F000000);
  *(float32x2_t *)(a2 + 336) = vmul_f32(*(float32x2_t *)(a2 + 336), (float32x2_t)0x3F0000003F000000);
  *(float32x2_t *)(a2 + 348) = vmul_f32(*(float32x2_t *)(a2 + 348), (float32x2_t)0x3F0000003F000000);
  *(float32x2_t *)(a2 + 360) = vmul_f32(*(float32x2_t *)(a2 + 360), (float32x2_t)0x3F0000003F000000);
  *(float32x2_t *)(a2 + 372) = vmul_f32(*(float32x2_t *)(a2 + 372), (float32x2_t)0x3F0000003F000000);
  *(float32x2_t *)(a2 + 384) = vmul_f32(*(float32x2_t *)(a2 + 384), (float32x2_t)0x3F0000003F000000);
  *(float32x2_t *)(a2 + 396) = vmul_f32(*(float32x2_t *)(a2 + 396), (float32x2_t)0x3F0000003F000000);
  *(float32x2_t *)(a2 + 408) = vmul_f32(*(float32x2_t *)(a2 + 408), (float32x2_t)0x3F0000003F000000);
  *(float32x2_t *)(a2 + 420) = vmul_f32(*(float32x2_t *)(a2 + 420), (float32x2_t)0x3F0000003F000000);
  *(float32x2_t *)(a2 + 432) = vmul_f32(*(float32x2_t *)(a2 + 432), (float32x2_t)0x3F0000003F000000);
  *(float32x2_t *)(a2 + 444) = vmul_f32(*(float32x2_t *)(a2 + 444), (float32x2_t)0x3F0000003F000000);
  if (logLevel < 3)
  {
    unsigned int v50 = a7;
    unsigned int v49 = a8;
    goto LABEL_231;
  }
  unsigned int v50 = a7;
  unsigned int v49 = a8;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] noDS == 1, set mediumAdaptGain = 0, adjust Hfactor\n", buf, 2u);
  }
LABEL_228:
  if (logLevel >= 3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] applying the zoneplate fix to all HH02012023\n", buf, 2u);
  }
LABEL_231:
  *(_DWORD *)(a2 + 32) = 204800;
  *a6 = v18;
  *unsigned int v50 = v48;
  *unsigned int v49 = v47;
  *a9 = v46;
  *a10 = a1[16] + a1[15];
  *a11 = a1[32] + a1[31];
  *uint64_t v17 = v21;
  *(_DWORD *)(a2 + 564) = v98;
  *(_DWORD *)(a2 + 568) = v97;
  *(_DWORD *)(a2 + 572) = v18;
  LODWORD(result) = 7;
  *(void *)(a2 + 576) = 0x400000007;
  if (logLevel >= 3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v80 = *(_DWORD *)(a2 + 564);
      int v81 = *(_DWORD *)(a2 + 568);
      int v82 = *(_DWORD *)(a2 + 572);
      int v83 = *(_DWORD *)(a2 + 576);
      unsigned int v84 = *(_DWORD *)(a2 + 580);
      *(_DWORD *)buf = 67110144;
      *(_DWORD *)v114 = v80;
      *(_WORD *)&v114[4] = 1024;
      *(_DWORD *)&v114[6] = v81;
      LOWORD(v115) = 1024;
      *(_DWORD *)((char *)&v115 + 2) = v82;
      HIWORD(v115) = 1024;
      int v116 = v83;
      __int16 v117 = 1024;
      unsigned int v118 = v84;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] pixelControl->noiseMeter = config.{ sizeX=%d, sizeY=%d }, gainControl.{ lut0Gain= %d, lut1Gain= %d, lut2Gain= %d }\n", buf, 0x20u);
    }
    if (logLevel >= 3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v85 = *(unsigned __int8 *)(a2 + 28);
      int v87 = *(_DWORD *)(a2 + 36);
      int v86 = *(_DWORD *)(a2 + 40);
      int v88 = *(_DWORD *)(a2 + 44);
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)v114 = v85;
      *(_WORD *)&v114[4] = 1024;
      *(_DWORD *)&v114[6] = v86;
      LOWORD(v115) = 1024;
      *(_DWORD *)((char *)&v115 + 2) = v87;
      HIWORD(v115) = 1024;
      int v116 = v88;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] pixelControl->asePixelControl.dsEnable=%d, enhancementConfig.{ebeEnable=%d, peakingEnable=%d, chromaEnhanceEnable=%d}\n", buf, 0x1Au);
    }
  }
  return result;
}

void calculate_control_setting_V1(int *a1, char *__dst, unsigned int a3, unsigned int a4, int a5, int *a6, int *a7, int *a8, unsigned int *a9, unsigned int *a10, unsigned int *a11, unsigned int *a12, int a13)
{
  unsigned int v15 = a3;
  uint64_t v128 = *MEMORY[0x263EF8340];
  unsigned int v18 = *a6;
  int v108 = *a8;
  int v109 = *a7;
  unsigned int v107 = *a9;
  memset(__src, 0, 512);
  memset(&__dsta[22], 0, 160);
  unsigned int v19 = 100 * a1[94];
  unsigned int v20 = a1[30];
  if (v20 <= a1[46]) {
    unsigned int v20 = a1[46];
  }
  memset(&__dsta[2], 0, 320);
  unsigned int v21 = v19 / v20;
  BOOL v23 = a3 > 0x383 && a4 > 0x1F3;
  memset(__dsta, 0, 32);
  unsigned int v115 = v21;
  BOOL v106 = v23;
  if (a5)
  {
    unsigned int v24 = a1[16] + a1[15];
    unsigned int v25 = *a10 - v24;
    unsigned int v26 = a1[32] + a1[31];
    unsigned int v27 = *a11;
    unsigned int v28 = *a12;
    if (v24 > *a10) {
      unsigned int v25 = v24 - *a10;
    }
    if (v24 >= *a10) {
      unsigned int v24 = *a10;
    }
    unsigned int v29 = v26 - v27;
    if (v26 <= v27) {
      unsigned int v29 = *a11 - v26;
    }
    unsigned int v30 = 100 * v25 / v24;
    unsigned int v31 = 100 * v29;
    if (v26 >= v27) {
      unsigned int v32 = *a11;
    }
    else {
      unsigned int v32 = a1[32] + a1[31];
    }
    unsigned int v33 = v31 / v32;
    if (v30 <= v33) {
      unsigned int v30 = v33;
    }
    unsigned int v34 = v21 - v28;
    if (v21 <= v28) {
      unsigned int v34 = *a12 - v21;
    }
    unsigned int v35 = 100 * v34;
    if (v21 >= v28) {
      unsigned int v36 = *a12;
    }
    else {
      unsigned int v36 = v21;
    }
    BOOL v37 = v30 + v35 / v36 > 0x64;
  }
  else
  {
    BOOL v37 = 0;
  }
  int v38 = *a1;
  if (logLevel >= 3)
  {
    unsigned int v40 = v18;
    unsigned int v41 = &_os_log_internal;
    id v42 = &_os_log_internal;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v43 = *a12;
      int v44 = a1[16] + a1[15];
      unsigned int v45 = *a10;
      int v46 = a1[32] + a1[31];
      unsigned int v47 = *a11;
      *(_DWORD *)buf = 67110656;
      *(_DWORD *)__int16 v119 = v37;
      *(_WORD *)&v119[4] = 1024;
      *(_DWORD *)&v119[6] = v115;
      LOWORD(v120) = 1024;
      *(_DWORD *)((char *)&v120 + 2) = v43;
      HIWORD(v120) = 1024;
      int v121 = v44;
      __int16 v122 = 1024;
      unsigned int v123 = v45;
      __int16 v124 = 1024;
      int v125 = v46;
      __int16 v126 = 1024;
      unsigned int v127 = v47;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] scene_change_detected = %d, ratio_2D_1D is :%d vs %d; H1 is : %d vs %d,  V1 is: %d vs %d;\n",
        buf,
        0x2Cu);
    }

    unsigned int v18 = v40;
    unsigned int v15 = a3;
  }
  unsigned int v48 = a4 - 22;
  unsigned int v110 = v48;
  unsigned int v111 = v15 - 22;
  if (!a5 || (int)(100 * v38 / (v15 - 22) * v48) < 20 || a5 != 1 && v37)
  {
    memcpy(__dst, &InitialSettingVideo_V1, 0x22CuLL);
    if (logLevel < 3)
    {
      unsigned int v50 = 0;
      int v51 = 0;
      int v52 = 4;
      int v53 = 1;
      unsigned int v49 = a12;
    }
    else
    {
      unsigned int v49 = a12;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        *(void *)__int16 v119 = &InitialSettingVideo_V1;
        *(_WORD *)&v119[8] = 2080;
        int v120 = "InitialSettingVideo";
        _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] pixelControl[%p]=%s\n", buf, 0x16u);
      }
      unsigned int v50 = 0;
      int v51 = 0;
      int v52 = 4;
      int v53 = 1;
    }
    goto LABEL_41;
  }
  uint64_t v80 = 0;
  unsigned int v81 = 0;
  unsigned int v82 = 0;
  do
  {
    v81 += a1[v80 + 23];
    v82 += a1[v80 + 39];
    ++v80;
  }
  while (v80 != 7);
  unsigned int v83 = 0;
  for (uint64_t i = 79; i != 94; ++i)
    v83 += a1[i];
  int v85 = 10 * a1[46] / v82 + 10 * a1[30] / v81;
  signed int v86 = 10 * a1[94] / v83;
  if (v86 <= 349) {
    int v85 = 350 * v85 / v86;
  }
  int v87 = 0;
  for (uint64_t j = 47; j != 62; ++j)
    v87 += a1[j];
  HIDWORD(v89) = 1079574528;
  LODWORD(v89) = *a1;
  double v90 = (double)v87 * 100.0 / (double)v89;
  if (v90 >= 7.0)
  {
    if (v90 > 8.0)
    {
      if (v18 - 1 <= 4) {
        unsigned int v18 = 4;
      }
      else {
        --v18;
      }
    }
  }
  else
  {
    ++v18;
  }
  if (v18 <= 0xE)
  {
    if (v18 < 0xA)
    {
      if (v18 < 6) {
        signed int v91 = 0;
      }
      else {
        signed int v91 = (50 * v18 - 300) >> 2;
      }
    }
    else
    {
      signed int v91 = ((50 * (_BYTE)v18 + 12) & 0xFEu) / 5 + 50;
    }
  }
  else
  {
    signed int v91 = 100;
  }
  if (v85 <= 30)
  {
    if (v85 < 24)
    {
      if (v85 < 12) {
        signed int v92 = 100;
      }
      else {
        signed int v92 = (unsigned __int16)(50 * (24 - v85)) / 0xCu + 50;
      }
    }
    else
    {
      signed int v92 = (unsigned __int16)(50 * (30 - v85)) / 6u;
    }
  }
  else
  {
    signed int v92 = 0;
  }
  if (logLevel >= 3)
  {
    BOOL v93 = &_os_log_internal;
    id v94 = &_os_log_internal;
    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)__int16 v119 = a5;
      *(_WORD *)&v119[4] = 1024;
      *(_DWORD *)&v119[6] = v91;
      LOWORD(v120) = 1024;
      *(_DWORD *)((char *)&v120 + 2) = v92;
      HIWORD(v120) = 1024;
      int v121 = v85;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] Frame %d:  Curr_FG_level = %d, Curr_badly_coded_FG_level = %d, No_Bad_coded_FilmGrain_score  = %d \n", buf, 0x1Au);
    }
  }
  if (v91 <= v92) {
    unsigned int v95 = v92;
  }
  else {
    unsigned int v95 = v91;
  }
  if (a13 == 1)
  {
    unsigned int v49 = a12;
    BOOL v96 = v106;
    if (logLevel >= 4)
    {
      unsigned int v97 = &_os_log_internal;
      id v98 = &_os_log_internal;
      if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] Apply iPhone control setting V1\n", buf, 2u);
      }
    }
    if (v106)
    {
      if (v95 > 0x1D)
      {
        if (v95 > 0x31)
        {
          if (v95 > 0x45)
          {
            if (v95 > 0x5E)
            {
              memcpy(__dsta, &iPhone_SettingVideo_Heavy_FG_V1, 0x22CuLL);
              memcpy(__src, &iPhone_SettingVideo_Heavy_FG_mix_V1, 0x22CuLL);
              if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_190;
              }
              *(_WORD *)buf = 0;
              long long v99 = &_os_log_internal;
              long long v100 = " [1.37.0] Film grain level heavy\n";
            }
            else
            {
              memcpy(__dsta, &iPhone_SettingVideo_level3_FG_V1, 0x22CuLL);
              memcpy(__src, &iPhone_SettingVideo_level3_FG_mix_V1, 0x22CuLL);
              if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_190;
              }
              *(_WORD *)buf = 0;
              long long v99 = &_os_log_internal;
              long long v100 = " [1.37.0] Film grain level 3\n";
            }
          }
          else
          {
            memcpy(__dsta, &iPhone_SettingVideo_level2_FG_V1, 0x22CuLL);
            memcpy(__src, &iPhone_SettingVideo_level2_FG_mix_V1, 0x22CuLL);
            if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_190;
            }
            *(_WORD *)buf = 0;
            long long v99 = &_os_log_internal;
            long long v100 = " [1.37.0] Film grain level 2\n";
          }
        }
        else
        {
          memcpy(__dsta, &iPhone_SettingVideo_level1_FG_V1, 0x22CuLL);
          memcpy(__src, &iPhone_SettingVideo_level1_FG_mix_V1, 0x22CuLL);
          if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_190;
          }
          *(_WORD *)buf = 0;
          long long v99 = &_os_log_internal;
          long long v100 = " [1.37.0] Film grain level 1\n";
        }
      }
      else
      {
        memcpy(__dsta, &iPhone_SettingVideo_light_FG_V1, 0x22CuLL);
        memcpy(__src, &iPhone_SettingVideo_light_FG_mix_V1, 0x22CuLL);
        if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_190;
        }
        *(_WORD *)buf = 0;
        long long v99 = &_os_log_internal;
        long long v100 = " [1.37.0] Film grain level light\n";
      }
    }
    else if (v95 > 0x1D)
    {
      if (v95 > 0x31)
      {
        if (v95 > 0x45)
        {
          if (v95 > 0x5E)
          {
            memcpy(__dsta, &iPhone_SettingVideo_Heavy_FG_LargeRatio_V1, 0x22CuLL);
            memcpy(__src, &iPhone_SettingVideo_Heavy_FG_mix_LargeRatio_V1, 0x22CuLL);
            if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_190;
            }
            *(_WORD *)buf = 0;
            long long v99 = &_os_log_internal;
            long long v100 = " [1.37.0] Film grain level heavy LargeRatio\n";
          }
          else
          {
            memcpy(__dsta, &iPhone_SettingVideo_level3_FG_LargeRatio_V1, 0x22CuLL);
            memcpy(__src, &iPhone_SettingVideo_level3_FG_mix_LargeRatio_V1, 0x22CuLL);
            if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_190;
            }
            *(_WORD *)buf = 0;
            long long v99 = &_os_log_internal;
            long long v100 = " [1.37.0] Film grain level 3 LargeRatio\n";
          }
        }
        else
        {
          memcpy(__dsta, &iPhone_SettingVideo_level2_FG_LargeRatio_V1, 0x22CuLL);
          memcpy(__src, &iPhone_SettingVideo_level2_FG_mix_LargeRatio_V1, 0x22CuLL);
          if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_190;
          }
          *(_WORD *)buf = 0;
          long long v99 = &_os_log_internal;
          long long v100 = " [1.37.0] Film grain level 2 LargeRatio\n";
        }
      }
      else
      {
        memcpy(__dsta, &iPhone_SettingVideo_level1_FG_LargeRatio_V1, 0x22CuLL);
        memcpy(__src, &iPhone_SettingVideo_level1_FG_mix_LargeRatio_V1, 0x22CuLL);
        if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_190;
        }
        *(_WORD *)buf = 0;
        long long v99 = &_os_log_internal;
        long long v100 = " [1.37.0] Film grain level 1 LargeRatio\n";
      }
    }
    else
    {
      memcpy(__dsta, &iPhone_SettingVideo_light_FG_LargeRatio_V1, 0x22CuLL);
      memcpy(__src, &iPhone_SettingVideo_light_FG_mix_LargeRatio_V1, 0x22CuLL);
      if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_190;
      }
      *(_WORD *)buf = 0;
      long long v99 = &_os_log_internal;
      long long v100 = " [1.37.0] Film grain level light LargeRatio\n";
    }
  }
  else
  {
    unsigned int v49 = a12;
    BOOL v96 = v106;
    if (v106)
    {
      if (v95 > 0x1D)
      {
        if (v95 > 0x31)
        {
          if (v95 > 0x45)
          {
            if (v95 > 0x5E)
            {
              memcpy(__dsta, &SettingVideo_Heavy_FG_V1, 0x22CuLL);
              memcpy(__src, &SettingVideo_Heavy_FG_mix_V1, 0x22CuLL);
              if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_190;
              }
              *(_WORD *)buf = 0;
              long long v99 = &_os_log_internal;
              long long v100 = " [1.37.0] Film grain level heavy\n";
            }
            else
            {
              memcpy(__dsta, &SettingVideo_level3_FG_V1, 0x22CuLL);
              memcpy(__src, &SettingVideo_level3_FG_mix_V1, 0x22CuLL);
              if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_190;
              }
              *(_WORD *)buf = 0;
              long long v99 = &_os_log_internal;
              long long v100 = " [1.37.0] Film grain level 3\n";
            }
          }
          else
          {
            memcpy(__dsta, &SettingVideo_level2_FG_V1, 0x22CuLL);
            memcpy(__src, &SettingVideo_level2_FG_mix_V1, 0x22CuLL);
            if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_190;
            }
            *(_WORD *)buf = 0;
            long long v99 = &_os_log_internal;
            long long v100 = " [1.37.0] Film grain level 2\n";
          }
        }
        else
        {
          memcpy(__dsta, &SettingVideo_level1_FG_V1, 0x22CuLL);
          memcpy(__src, &SettingVideo_level1_FG_mix_V1, 0x22CuLL);
          if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_190;
          }
          *(_WORD *)buf = 0;
          long long v99 = &_os_log_internal;
          long long v100 = " [1.37.0] Film grain level 1\n";
        }
      }
      else
      {
        memcpy(__dsta, &SettingVideo_light_FG_V1, 0x22CuLL);
        memcpy(__src, &SettingVideo_light_FG_mix_V1, 0x22CuLL);
        if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_190;
        }
        *(_WORD *)buf = 0;
        long long v99 = &_os_log_internal;
        long long v100 = " [1.37.0] Film grain level light\n";
      }
    }
    else if (v95 > 0x1D)
    {
      if (v95 > 0x31)
      {
        if (v95 > 0x45)
        {
          if (v95 > 0x5E)
          {
            memcpy(__dsta, &SettingVideo_Heavy_FG_LargeRatio_V1, 0x22CuLL);
            memcpy(__src, &SettingVideo_Heavy_FG_mix_LargeRatio_V1, 0x22CuLL);
            if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_190;
            }
            *(_WORD *)buf = 0;
            long long v99 = &_os_log_internal;
            long long v100 = " [1.37.0] Film grain level heavy LargeRatio\n";
          }
          else
          {
            memcpy(__dsta, &SettingVideo_level3_FG_LargeRatio_V1, 0x22CuLL);
            memcpy(__src, &SettingVideo_level3_FG_mix_LargeRatio_V1, 0x22CuLL);
            if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_190;
            }
            *(_WORD *)buf = 0;
            long long v99 = &_os_log_internal;
            long long v100 = " [1.37.0] Film grain level 3 LargeRatio\n";
          }
        }
        else
        {
          memcpy(__dsta, &SettingVideo_level2_FG_LargeRatio_V1, 0x22CuLL);
          memcpy(__src, &SettingVideo_level2_FG_mix_LargeRatio_V1, 0x22CuLL);
          if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_190;
          }
          *(_WORD *)buf = 0;
          long long v99 = &_os_log_internal;
          long long v100 = " [1.37.0] Film grain level 2 LargeRatio\n";
        }
      }
      else
      {
        memcpy(__dsta, &SettingVideo_level1_FG_LargeRatio_V1, 0x22CuLL);
        memcpy(__src, &SettingVideo_level1_FG_mix_LargeRatio_V1, 0x22CuLL);
        if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_190;
        }
        *(_WORD *)buf = 0;
        long long v99 = &_os_log_internal;
        long long v100 = " [1.37.0] Film grain level 1 LargeRatio\n";
      }
    }
    else
    {
      memcpy(__dsta, &SettingVideo_light_FG_LargeRatio_V1, 0x22CuLL);
      memcpy(__src, &SettingVideo_light_FG_mix_LargeRatio_V1, 0x22CuLL);
      if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_190;
      }
      *(_WORD *)buf = 0;
      long long v99 = &_os_log_internal;
      long long v100 = " [1.37.0] Film grain level light LargeRatio\n";
    }
  }
  _os_log_impl(&dword_2107A5000, v99, OS_LOG_TYPE_DEFAULT, v100, buf, 2u);
LABEL_190:
  BOOL v101 = v95 > 0x14;
  if (v95 <= 0x14) {
    unsigned int v50 = v107 + 1;
  }
  else {
    unsigned int v50 = 0;
  }
  if (v101) {
    unsigned int v102 = v108 + 1;
  }
  else {
    unsigned int v102 = 0;
  }
  if (!v109)
  {
    if (v50 >= 0x30) {
      unsigned int v50 = 48;
    }
    if (v102 > 0x18)
    {
      int v52 = v18;
      int v51 = 0;
      goto LABEL_207;
    }
    int v51 = v102;
    if (!v96)
    {
LABEL_216:
      if (a13 == 1) {
        long long v103 = &iPhone_SettingVideo_NFG_LargeRatio_V1;
      }
      else {
        long long v103 = &SettingVideo_NFG_LargeRatio_V1;
      }
      memcpy(__dst, v103, 0x22CuLL);
      int v52 = v18;
      if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_239;
      }
      *(_DWORD *)buf = 134218242;
      *(void *)__int16 v119 = &SettingVideo_NFG_LargeRatio_V1;
      *(_WORD *)&v119[8] = 2080;
      int v120 = "SettingVideo_NFG LargeRatio";
      v105 = &_os_log_internal;
LABEL_238:
      _os_log_impl(&dword_2107A5000, v105, OS_LOG_TYPE_DEFAULT, " [1.37.0] pixelControl[%p]=%s\n", buf, 0x16u);
LABEL_239:
      int v53 = 0;
      goto LABEL_41;
    }
LABEL_219:
    if (a13 == 1) {
      v104 = &iPhone_SettingVideo_NFG_V1;
    }
    else {
      v104 = &SettingVideo_NFG_V1;
    }
    memcpy(__dst, v104, 0x22CuLL);
    int v52 = v18;
    if (logLevel < 3 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_239;
    }
    *(_DWORD *)buf = 134218242;
    *(void *)__int16 v119 = &SettingVideo_NFG_V1;
    *(_WORD *)&v119[8] = 2080;
    int v120 = "SettingVideo_NFG";
    v105 = &_os_log_internal;
    goto LABEL_238;
  }
  if (v109 != 2)
  {
    if (v102 <= 0x18) {
      int v51 = v102;
    }
    else {
      int v51 = 0;
    }
    if (v50 <= 0x30)
    {
      int v52 = v18;
      if (v102 <= 0x18) {
        int v53 = v109;
      }
      else {
        int v53 = 2;
      }
      if (v53 != 2)
      {
LABEL_208:
        memcpy(__dst, __src, 0x22CuLL);
        if (logLevel >= 3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)__int16 v119 = __src;
          *(_WORD *)&v119[8] = 2080;
          int v120 = "Mix_dyn_setting";
          _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] pixelControl[%p]=%s\n", buf, 0x16u);
        }
        goto LABEL_41;
      }
      unsigned int v18 = v52;
      goto LABEL_226;
    }
    unsigned int v50 = 0;
    if (!v96) {
      goto LABEL_216;
    }
    goto LABEL_219;
  }
  if (v102 >= 0x18) {
    int v51 = 24;
  }
  else {
    int v51 = v102;
  }
  if (v50 > 0x30)
  {
    int v52 = v18;
    unsigned int v50 = 0;
LABEL_207:
    int v53 = 1;
    goto LABEL_208;
  }
LABEL_226:
  memcpy(__dst, __dsta, 0x22CuLL);
  int v52 = v18;
  if (logLevel >= 3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(void *)__int16 v119 = __dsta;
    *(_WORD *)&v119[8] = 2080;
    int v120 = "FG_dyn_setting";
    _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] pixelControl[%p]=%s\n", buf, 0x16u);
  }
  int v53 = 2;
LABEL_41:
  unsigned int v54 = (float32x2_t *)(__dst + 260);
  if (v15 >= 0x501 && a13 == 1)
  {
    *__dst = 0;
    *((_DWORD *)__dst + 4) = 0;
    *((void *)__dst + 1) = 0;
    *((_DWORD *)__dst + 6) = 0;
    *((_DWORD *)__dst + 9) = 0;
    *((_DWORD *)__dst + 12) = 0;
    *((_DWORD *)__dst + 15) = 0;
    *((_DWORD *)__dst + 18) = 0;
    *((_DWORD *)__dst + 21) = 0;
    *((_DWORD *)__dst + 24) = 0;
    *((_DWORD *)__dst + 27) = 0;
    *(float32x2_t *)(__dst + 236) = vmul_f32(*(float32x2_t *)(__dst + 236), (float32x2_t)0x3F0000003F000000);
    *((float32x2_t *)__dst + 31) = vmul_f32(*(float32x2_t *)(__dst + 248), (float32x2_t)0x3F0000003F000000);
    *unsigned int v54 = vmul_f32(*v54, (float32x2_t)0x3F0000003F000000);
    *((float32x2_t *)__dst + 34) = vmul_f32(*(float32x2_t *)(__dst + 272), (float32x2_t)0x3F0000003F000000);
    *(float32x2_t *)(__dst + 284) = vmul_f32(*(float32x2_t *)(__dst + 284), (float32x2_t)0x3F0000003F000000);
    *((float32x2_t *)__dst + 37) = vmul_f32(*(float32x2_t *)(__dst + 296), (float32x2_t)0x3F0000003F000000);
    *(float32x2_t *)(__dst + 308) = vmul_f32(*(float32x2_t *)(__dst + 308), (float32x2_t)0x3F0000003F000000);
    *((float32x2_t *)__dst + 40) = vmul_f32(*(float32x2_t *)(__dst + 320), (float32x2_t)0x3F0000003F000000);
    *(float32x2_t *)(__dst + 332) = vmul_f32(*(float32x2_t *)(__dst + 332), (float32x2_t)0x3F0000003F000000);
    *((float32x2_t *)__dst + 43) = vmul_f32(*(float32x2_t *)(__dst + 344), (float32x2_t)0x3F0000003F000000);
    *(float32x2_t *)(__dst + 356) = vmul_f32(*(float32x2_t *)(__dst + 356), (float32x2_t)0x3F0000003F000000);
    *((float32x2_t *)__dst + 46) = vmul_f32(*(float32x2_t *)(__dst + 368), (float32x2_t)0x3F0000003F000000);
    *(float32x2_t *)(__dst + 380) = vmul_f32(*(float32x2_t *)(__dst + 380), (float32x2_t)0x3F0000003F000000);
    *((float32x2_t *)__dst + 49) = vmul_f32(*(float32x2_t *)(__dst + 392), (float32x2_t)0x3F0000003F000000);
    *(float32x2_t *)(__dst + 404) = vmul_f32(*(float32x2_t *)(__dst + 404), (float32x2_t)0x3F0000003F000000);
    *((float32x2_t *)__dst + 52) = vmul_f32(*(float32x2_t *)(__dst + 416), (float32x2_t)0x3F0000003F000000);
    if (logLevel < 3) {
      goto LABEL_60;
    }
    unsigned int v55 = &_os_log_internal;
    id v56 = &_os_log_internal;
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] noDS == 1, set mediumAdaptGain = 0, adjust Hfactor\n", buf, 2u);
    }
  }
  if (logLevel >= 3)
  {
    signed int v57 = &_os_log_internal;
    id v58 = &_os_log_internal;
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      double v59 = *((float *)__dst + 106);
      *(_DWORD *)buf = 134217984;
      *(double *)__int16 v119 = v59;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] pixelControl->blendLogicCurve.point0.x_position=%f\n", buf, 0xCu);
    }

    if (logLevel >= 3)
    {
      unint64_t v60 = &_os_log_internal;
      id v61 = &_os_log_internal;
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        double v62 = *((float *)__dst + 107);
        *(_DWORD *)buf = 134217984;
        *(double *)__int16 v119 = v62;
        _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] pixelControl->blendLogicCurve.point0.y_position=%f\n", buf, 0xCu);
      }

      if (logLevel >= 3)
      {
        signed int v63 = &_os_log_internal;
        id v64 = &_os_log_internal;
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        {
          double v65 = *((float *)__dst + 108);
          *(_DWORD *)buf = 134217984;
          *(double *)__int16 v119 = v65;
          _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] pixelControl->blendLogicCurve.point0.slope=%f\n", buf, 0xCu);
        }
      }
    }
  }
  if (v15 >= 0x76D && a13 == 8)
  {
    *__dst = 0;
    *((_DWORD *)__dst + 6) = 0;
    *((_DWORD *)__dst + 9) = 0;
    *((_DWORD *)__dst + 12) = 0;
    *((_DWORD *)__dst + 15) = 0;
    *((_DWORD *)__dst + 18) = 0;
    *((_DWORD *)__dst + 21) = 0;
    *((_DWORD *)__dst + 24) = 0;
    *((_DWORD *)__dst + 27) = 0;
    __asm { FMOV            V1.2S, #0.25 }
    *(float32x2_t *)(__dst + 236) = vmul_f32(*(float32x2_t *)(__dst + 236), _D1);
    *((float32x2_t *)__dst + 31) = vmul_f32(*(float32x2_t *)(__dst + 248), _D1);
    *unsigned int v54 = vmul_f32(*v54, _D1);
    *((float32x2_t *)__dst + 34) = vmul_f32(*(float32x2_t *)(__dst + 272), _D1);
    *(float32x2_t *)(__dst + 284) = vmul_f32(*(float32x2_t *)(__dst + 284), _D1);
    *((float32x2_t *)__dst + 37) = vmul_f32(*(float32x2_t *)(__dst + 296), _D1);
    *(float32x2_t *)(__dst + 308) = vmul_f32(*(float32x2_t *)(__dst + 308), _D1);
    *((float32x2_t *)__dst + 40) = vmul_f32(*(float32x2_t *)(__dst + 320), _D1);
    *(float32x2_t *)(__dst + 332) = vmul_f32(*(float32x2_t *)(__dst + 332), _D1);
    *((float32x2_t *)__dst + 43) = vmul_f32(*(float32x2_t *)(__dst + 344), _D1);
    *(float32x2_t *)(__dst + 356) = vmul_f32(*(float32x2_t *)(__dst + 356), _D1);
    *((float32x2_t *)__dst + 46) = vmul_f32(*(float32x2_t *)(__dst + 368), _D1);
    *(float32x2_t *)(__dst + 380) = vmul_f32(*(float32x2_t *)(__dst + 380), _D1);
    *((float32x2_t *)__dst + 49) = vmul_f32(*(float32x2_t *)(__dst + 392), _D1);
    *(float32x2_t *)(__dst + 404) = vmul_f32(*(float32x2_t *)(__dst + 404), _D1);
    *((float32x2_t *)__dst + 52) = vmul_f32(*(float32x2_t *)(__dst + 416), _D1);
  }
LABEL_60:
  if (v15 >= 0x781)
  {
    *__dst = 0;
    *((void *)__dst + 1) = 0;
    *((_DWORD *)__dst + 4) = 0;
  }
  if (logLevel >= 3)
  {
    v71 = &_os_log_internal;
    id v72 = &_os_log_internal;
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0]  applying the fix to all HH02012023\n", buf, 2u);
    }
  }
  *((_DWORD *)__dst + 1) = 204800;
  *(float32x2_t *)(__dst + 428) = vmul_f32(*(float32x2_t *)(__dst + 428), (float32x2_t)0x3F0000003F000000);
  *((float32x2_t *)__dst + 55) = vmul_f32(*(float32x2_t *)(__dst + 440), (float32x2_t)0x3F0000003F000000);
  *(float32x2_t *)(__dst + 452) = vmul_f32(*(float32x2_t *)(__dst + 452), (float32x2_t)0x3F0000003F000000);
  *((float32x2_t *)__dst + 58) = vmul_f32(*(float32x2_t *)(__dst + 464), (float32x2_t)0x3F0000003F000000);
  *(float32x2_t *)(__dst + 476) = vmul_f32(*(float32x2_t *)(__dst + 476), (float32x2_t)0x3F0000003F000000);
  *((float32x2_t *)__dst + 61) = vmul_f32(*(float32x2_t *)(__dst + 488), (float32x2_t)0x3F0000003F000000);
  *(float32x2_t *)(__dst + 500) = vmul_f32(*(float32x2_t *)(__dst + 500), (float32x2_t)0x3F0000003F000000);
  *((float32x2_t *)__dst + 64) = vmul_f32(*(float32x2_t *)(__dst + 512), (float32x2_t)0x3F0000003F000000);
  *a6 = v52;
  *a7 = v53;
  *a8 = v51;
  *a9 = v50;
  *a10 = a1[16] + a1[15];
  *a11 = a1[32] + a1[31];
  *unsigned int v49 = v115;
  *((_DWORD *)__dst + 134) = v111;
  *((_DWORD *)__dst + 135) = v110;
  *((_DWORD *)__dst + 136) = v52;
  *(void *)(__dst + 548) = 0x400000007;
  if (logLevel >= 3)
  {
    int v73 = &_os_log_internal;
    id v74 = &_os_log_internal;
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      int v75 = *((_DWORD *)__dst + 134);
      int v76 = *((_DWORD *)__dst + 135);
      int v77 = *((_DWORD *)__dst + 136);
      int v78 = *((_DWORD *)__dst + 137);
      unsigned int v79 = *((_DWORD *)__dst + 138);
      *(_DWORD *)buf = 67110144;
      *(_DWORD *)__int16 v119 = v75;
      *(_WORD *)&v119[4] = 1024;
      *(_DWORD *)&v119[6] = v76;
      LOWORD(v120) = 1024;
      *(_DWORD *)((char *)&v120 + 2) = v77;
      HIWORD(v120) = 1024;
      int v121 = v78;
      __int16 v122 = 1024;
      unsigned int v123 = v79;
      _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] pixelControl->noiseMeter = config.{ sizeX=%d, sizeY=%d }, gainControl.{ lut0Gain= %d, lut1Gain= %d, lut2Gain= %d }\n", buf, 0x20u);
    }
  }
}

CFIndex initASEProcessLog()
{
  Boolean keyExistsAndHasValidFormat = 1;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"logLevel", @"com.apple.aseprocessing", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    int v1 = 4;
    if (AppIntegerValue < 4) {
      int v1 = AppIntegerValue;
    }
    logLevel = v1;
  }
  int v2 = CFPreferencesGetAppIntegerValue(@"disableHcuCache", @"com.apple.aseprocessing", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    disableHcuCache = v2;
  }
  int v3 = CFPreferencesGetAppIntegerValue(@"enableT1Sim", @"com.apple.aseprocessing", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    enableT1Sim = v3;
  }
  int v4 = CFPreferencesGetAppIntegerValue(@"hideHcu", @"com.apple.aseprocessing", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    hideHcu = v4;
  }
  CFIndex result = CFPreferencesGetAppIntegerValue(@"dumpOutputHcu", @"com.apple.aseprocessing", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    dumpOutputHcu = result;
  }
  return result;
}

char *getASEProcessingType(unsigned int a1)
{
  if (a1 >= 9) {
    int v1 = 9;
  }
  else {
    int v1 = a1;
  }
  return (&aseProcessingTypes)[v1];
}

void createCacheNode_cold_1()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
    OUTLINED_FUNCTION_0(&dword_2107A5000, &_os_log_internal, v0, " [1.37.0] Assertion: \"0\" warned in \"/Library/Caches/com.apple.xbs/Sources/ASEFramework/ASEProcessingCache.m\" at line 44\n", v1, v2, v3, v4, 0);
  }
  __assert_rtn("createCacheNode", "ASEProcessingCache.m", 44, "0");
}

void createCacheNode_cold_2()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
    OUTLINED_FUNCTION_0(&dword_2107A5000, &_os_log_internal, v0, " [1.37.0] Assertion: \"size == sizeof(ASEHcuCacheNodeValuePeaking)\" warned in \"/Library/Caches/com.apple.xbs/Sources/ASEFramework/ASEProcessingCache.m\" at line 32\n", v1, v2, v3, v4, 0);
  }
  __assert_rtn("createCacheNode", "ASEProcessingCache.m", 32, "size == sizeof(ASEHcuCacheNodeValuePeaking)");
}

void createCacheNode_cold_3()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
    OUTLINED_FUNCTION_0(&dword_2107A5000, &_os_log_internal, v0, " [1.37.0] Assertion: \"size == sizeof(ASEHcuCacheNodeValueEbe)\" warned in \"/Library/Caches/com.apple.xbs/Sources/ASEFramework/ASEProcessingCache.m\" at line 36\n", v1, v2, v3, v4, 0);
  }
  __assert_rtn("createCacheNode", "ASEProcessingCache.m", 36, "size == sizeof(ASEHcuCacheNodeValueEbe)");
}

void createCacheNode_cold_4()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
    OUTLINED_FUNCTION_0(&dword_2107A5000, &_os_log_internal, v0, " [1.37.0] Assertion: \"size == sizeof(ASEHcuCacheNodeValueBlend)\" warned in \"/Library/Caches/com.apple.xbs/Sources/ASEFramework/ASEProcessingCache.m\" at line 40\n", v1, v2, v3, v4, 0);
  }
  __assert_rtn("createCacheNode", "ASEProcessingCache.m", 40, "size == sizeof(ASEHcuCacheNodeValueBlend)");
}

void copyArray_cold_1()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v0 = 0;
    _os_log_impl(&dword_2107A5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.37.0] Assertion: \"count <= 16\" warned in \"/Library/Caches/com.apple.xbs/Sources/ASEFramework/ASECalculateControlSettingV3.m\" at line 128\n", v0, 2u);
  }
  __assert_rtn("copyArray", "ASECalculateControlSettingV3.m", 128, "count <= 16");
}

void copyPieceWiseCurves_cold_1()
{
  __assert_rtn("copyPieceWiseCurves", "ASECalculateControlSettingV3.m", 185, "input && input->type == WDT_TYPE_CONSTANT && input->pointCount <= 16");
}

void interpolatePieceWiseCurves_cold_1()
{
  __assert_rtn("interpolatePieceWiseCurves", "ASECalculateControlSettingV3.m", 193, "input && input->type == WDT_TYPE_INTERPOLATED && input->pointCount <= 16");
}

void interpolateArray_cold_1()
{
  __assert_rtn("interpolateArray", "ASECalculateControlSettingV3.m", 247, "input && input->type == WDT_TYPE_INTERPOLATED");
}

void calculate_control_setting_V3_cold_1()
{
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF4A50](*(void *)&entry, plane, key, allocator, *(void *)&options);
}

uint64_t IOSurfaceAcceleratorCreate()
{
  return MEMORY[0x270F3D448]();
}

uint64_t IOSurfaceAcceleratorGetServiceObject()
{
  return MEMORY[0x270F3D460]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetSInt64Answer()
{
  return MEMORY[0x270F95FF0]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t __memmove_chk()
{
  return MEMORY[0x270ED7E40]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
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

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_exception_throw(id exception)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}