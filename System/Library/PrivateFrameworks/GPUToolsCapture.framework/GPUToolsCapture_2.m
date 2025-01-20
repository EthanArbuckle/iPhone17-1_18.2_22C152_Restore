void DYTraceEncode_MTLDevice_newTemporalScalerWithDescriptor(uint64_t a1, unsigned int *a2, unint64_t a3, _DWORD *a4, int *a5)
{
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  int v20;
  const char *v21;
  long long v22;
  long long v23;

  if (a3 <= 0x23 && a5)
  {
    v10 = *a5;
    v22 = 0u;
    v23 = 0u;
    v19 = v10;
    v20 = 500;
    v21 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v19);
  }
  *((void *)a2 + 1) = 0;
  *((void *)a2 + 2) = 0;
  *((void *)a2 + 3) = 0;
  if (a4) {
    v11 = 9;
  }
  else {
    v11 = 1;
  }
  a2[8] = v11;
  a2[9] = 21827;
  *(void *)a2 = 0xFFFFB80100000028;
  *((void *)a2 + 5) = *(void *)a1;
  *a2 = 48;
  AppendString(*(const char **)(a1 + 16), (int *)a2);
  v12 = *a2;
  v13 = (v12 + 3) & 0xFFFFFFFC;
  bzero((char *)a2 + v12, v13 - v12);
  *a2 = v13;
  *(_WORD *)((char *)a2 + v13) = 116;
  v14 = (*a2 + 5) & 0xFFFFFFFC;
  bzero((char *)a2 + *a2 + 2, v14 - (*a2 + 2));
  *a2 = v14;
  *(void *)((char *)a2 + v14) = *(void *)(a1 + 8);
  v15 = *a2 + 8;
  *a2 = v15;
  if (a4)
  {
    v16 = 8 * *a4 + 8;
    memcpy((char *)a2 + v15, a4, v16);
    v17 = v16 + *a2;
    v15 = (v17 + 3) & 0xFFFFFFFC;
    bzero((char *)a2 + v17, v15 - v17);
    *a2 = v15;
  }
  if (a5)
  {
    if (v15 > a3)
    {
      v18 = *a5;
      v22 = 0u;
      v23 = 0u;
      v19 = v18;
      v20 = 500;
      v21 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v19);
    }
  }
}

void DYTraceEncode_MTLFXSpatialScaler_setColorTexture(void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    long long v18 = 0u;
    long long v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0);
  *(_DWORD *)(a2 + 36) = 29763;
  *(void *)a2 = 0xFFFFB00000000028;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = a1[1];
  unint64_t v11 = 56;
  *(_DWORD *)a2 = 56;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 56), __src, v12 + 8);
    uint64_t v13 = (v12 + 64);
    unint64_t v11 = (v12 + 67) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }
  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      long long v18 = 0u;
      long long v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }
}

void DYTraceEncode_MTLFXSpatialScaler_setFence(void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    long long v18 = 0u;
    long long v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0);
  *(_DWORD *)(a2 + 36) = 29763;
  *(void *)a2 = 0xFFFFB00100000028;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = a1[1];
  unint64_t v11 = 56;
  *(_DWORD *)a2 = 56;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 56), __src, v12 + 8);
    uint64_t v13 = (v12 + 64);
    unint64_t v11 = (v12 + 67) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }
  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      long long v18 = 0u;
      long long v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }
}

void DYTraceEncode_MTLFXSpatialScaler_setInputContentHeight(void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    long long v18 = 0u;
    long long v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0);
  *(_DWORD *)(a2 + 36) = 7107907;
  *(void *)a2 = 0xFFFFB00200000028;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = a1[1];
  unint64_t v11 = 56;
  *(_DWORD *)a2 = 56;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 56), __src, v12 + 8);
    uint64_t v13 = (v12 + 64);
    unint64_t v11 = (v12 + 67) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }
  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      long long v18 = 0u;
      long long v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }
}

void DYTraceEncode_MTLFXSpatialScaler_setInputContentWidth(void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    long long v18 = 0u;
    long long v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0);
  *(_DWORD *)(a2 + 36) = 7107907;
  *(void *)a2 = 0xFFFFB00300000028;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = a1[1];
  unint64_t v11 = 56;
  *(_DWORD *)a2 = 56;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 56), __src, v12 + 8);
    uint64_t v13 = (v12 + 64);
    unint64_t v11 = (v12 + 67) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }
  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      long long v18 = 0u;
      long long v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }
}

void DYTraceEncode_MTLFXSpatialScaler_setOutputTexture(void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    long long v18 = 0u;
    long long v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0);
  *(_DWORD *)(a2 + 36) = 29763;
  *(void *)a2 = 0xFFFFB00400000028;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = a1[1];
  unint64_t v11 = 56;
  *(_DWORD *)a2 = 56;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 56), __src, v12 + 8);
    uint64_t v13 = (v12 + 64);
    unint64_t v11 = (v12 + 67) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }
  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      long long v18 = 0u;
      long long v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }
}

void DYTraceEncode_MTLFXSpatialScaler_dealloc(void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    long long v18 = 0u;
    long long v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0);
  *(_DWORD *)(a2 + 36) = 67;
  *(void *)a2 = 0xFFFFB00500000028;
  *(void *)(a2 + 40) = *a1;
  unint64_t v11 = 48;
  *(_DWORD *)a2 = 48;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 48), __src, v12 + 8);
    uint64_t v13 = (v12 + 56);
    unint64_t v11 = (v12 + 59) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }
  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      long long v18 = 0u;
      long long v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }
}

void DYTraceEncode_MTLFXSpatialScaler_encodeToCommandBuffer(void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    long long v18 = 0u;
    long long v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0);
  *(_DWORD *)(a2 + 36) = 29763;
  *(void *)a2 = 0xFFFFB00600000028;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = a1[1];
  unint64_t v11 = 56;
  *(_DWORD *)a2 = 56;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 56), __src, v12 + 8);
    uint64_t v13 = (v12 + 64);
    unint64_t v11 = (v12 + 67) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }
  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      long long v18 = 0u;
      long long v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }
}

void DYTraceEncode_MTLFXTemporalScaler_executionMode(void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    long long v19 = 0u;
    long long v20 = 0u;
    int v16 = v10;
    int v17 = 500;
    long long v18 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v16);
  }
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  if (__src) {
    int v11 = 12;
  }
  else {
    int v11 = 4;
  }
  *(_DWORD *)(a2 + 32) = v11;
  *(_DWORD *)(a2 + 36) = 7107907;
  *(void *)a2 = 0xFFFFB80200000028;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = a1[1];
  unint64_t v12 = 56;
  *(_DWORD *)a2 = 56;
  if (__src)
  {
    int v13 = 8 * *__src;
    memcpy((void *)(a2 + 56), __src, v13 + 8);
    uint64_t v14 = (v13 + 64);
    unint64_t v12 = (v13 + 67) & 0xFFFFFFF8;
    bzero((void *)(a2 + v14), v12 - v14);
    *(_DWORD *)a2 = v12;
  }
  if (v12 > a3)
  {
    if (a5)
    {
      int v15 = *a5;
      long long v19 = 0u;
      long long v20 = 0u;
      int v16 = v15;
      int v17 = 500;
      long long v18 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v16);
    }
  }
}

void DYTraceEncode_MTLFXTemporalScaler_setColorTexture(void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    long long v18 = 0u;
    long long v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0);
  *(_DWORD *)(a2 + 36) = 29763;
  *(void *)a2 = 0xFFFFB00700000028;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = a1[1];
  unint64_t v11 = 56;
  *(_DWORD *)a2 = 56;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 56), __src, v12 + 8);
    uint64_t v13 = (v12 + 64);
    unint64_t v11 = (v12 + 67) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }
  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      long long v18 = 0u;
      long long v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }
}

void DYTraceEncode_MTLFXTemporalScaler_setDepthReversed(uint64_t a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    long long v18 = 0u;
    long long v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0);
  *(_DWORD *)(a2 + 36) = 6911299;
  *(void *)a2 = 0xFFFFB00800000028;
  *(void *)(a2 + 40) = *(void *)a1;
  *(_DWORD *)a2 = 48;
  *(_DWORD *)(a2 + 48) = *(_DWORD *)(a1 + 8);
  unint64_t v11 = 52;
  *(_DWORD *)a2 = 52;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 52), __src, v12 + 8);
    uint64_t v13 = (v12 + 60);
    unint64_t v11 = (v12 + 63) & 0xFFFFFFFC;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }
  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      long long v18 = 0u;
      long long v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }
}

void DYTraceEncode_MTLFXTemporalScaler_setDepthTexture(void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    long long v18 = 0u;
    long long v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0);
  *(_DWORD *)(a2 + 36) = 29763;
  *(void *)a2 = 0xFFFFB00900000028;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = a1[1];
  unint64_t v11 = 56;
  *(_DWORD *)a2 = 56;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 56), __src, v12 + 8);
    uint64_t v13 = (v12 + 64);
    unint64_t v11 = (v12 + 67) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }
  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      long long v18 = 0u;
      long long v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }
}

void DYTraceEncode_MTLFXTemporalScaler_setExposureTexture(void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    long long v18 = 0u;
    long long v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0);
  *(_DWORD *)(a2 + 36) = 29763;
  *(void *)a2 = 0xFFFFB00A00000028;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = a1[1];
  unint64_t v11 = 56;
  *(_DWORD *)a2 = 56;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 56), __src, v12 + 8);
    uint64_t v13 = (v12 + 64);
    unint64_t v11 = (v12 + 67) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }
  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      long long v18 = 0u;
      long long v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }
}

void DYTraceEncode_MTLFXTemporalScaler_setFence(void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    long long v18 = 0u;
    long long v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0);
  *(_DWORD *)(a2 + 36) = 29763;
  *(void *)a2 = 0xFFFFB00B00000028;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = a1[1];
  unint64_t v11 = 56;
  *(_DWORD *)a2 = 56;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 56), __src, v12 + 8);
    uint64_t v13 = (v12 + 64);
    unint64_t v11 = (v12 + 67) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }
  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      long long v18 = 0u;
      long long v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }
}

void DYTraceEncode_MTLFXTemporalScaler_setInputContentHeight(void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    long long v18 = 0u;
    long long v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0);
  *(_DWORD *)(a2 + 36) = 7107907;
  *(void *)a2 = 0xFFFFB00C00000028;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = a1[1];
  unint64_t v11 = 56;
  *(_DWORD *)a2 = 56;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 56), __src, v12 + 8);
    uint64_t v13 = (v12 + 64);
    unint64_t v11 = (v12 + 67) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }
  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      long long v18 = 0u;
      long long v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }
}

void DYTraceEncode_MTLFXTemporalScaler_setInputContentWidth(void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    long long v18 = 0u;
    long long v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0);
  *(_DWORD *)(a2 + 36) = 7107907;
  *(void *)a2 = 0xFFFFB00D00000028;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = a1[1];
  unint64_t v11 = 56;
  *(_DWORD *)a2 = 56;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 56), __src, v12 + 8);
    uint64_t v13 = (v12 + 64);
    unint64_t v11 = (v12 + 67) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }
  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      long long v18 = 0u;
      long long v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }
}

void DYTraceEncode_MTLFXTemporalScaler_setJitterOffsetX(uint64_t a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    long long v18 = 0u;
    long long v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0);
  *(_DWORD *)(a2 + 36) = 26179;
  *(void *)a2 = 0xFFFFB00E00000028;
  *(void *)(a2 + 40) = *(void *)a1;
  *(_DWORD *)a2 = 48;
  *(_DWORD *)(a2 + 48) = *(_DWORD *)(a1 + 8);
  unint64_t v11 = 52;
  *(_DWORD *)a2 = 52;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 52), __src, v12 + 8);
    uint64_t v13 = (v12 + 60);
    unint64_t v11 = (v12 + 63) & 0xFFFFFFFC;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }
  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      long long v18 = 0u;
      long long v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }
}

void DYTraceEncode_MTLFXTemporalScaler_setJitterOffsetY(uint64_t a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    long long v18 = 0u;
    long long v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0);
  *(_DWORD *)(a2 + 36) = 26179;
  *(void *)a2 = 0xFFFFB00F00000028;
  *(void *)(a2 + 40) = *(void *)a1;
  *(_DWORD *)a2 = 48;
  *(_DWORD *)(a2 + 48) = *(_DWORD *)(a1 + 8);
  unint64_t v11 = 52;
  *(_DWORD *)a2 = 52;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 52), __src, v12 + 8);
    uint64_t v13 = (v12 + 60);
    unint64_t v11 = (v12 + 63) & 0xFFFFFFFC;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }
  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      long long v18 = 0u;
      long long v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }
}

void DYTraceEncode_MTLFXTemporalScaler_setMotionTexture(void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    long long v18 = 0u;
    long long v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0);
  *(_DWORD *)(a2 + 36) = 29763;
  *(void *)a2 = 0xFFFFB01000000028;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = a1[1];
  unint64_t v11 = 56;
  *(_DWORD *)a2 = 56;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 56), __src, v12 + 8);
    uint64_t v13 = (v12 + 64);
    unint64_t v11 = (v12 + 67) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }
  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      long long v18 = 0u;
      long long v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }
}

void DYTraceEncode_MTLFXTemporalScaler_setMotionVectorScaleX(uint64_t a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    long long v18 = 0u;
    long long v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0);
  *(_DWORD *)(a2 + 36) = 26179;
  *(void *)a2 = 0xFFFFB01100000028;
  *(void *)(a2 + 40) = *(void *)a1;
  *(_DWORD *)a2 = 48;
  *(_DWORD *)(a2 + 48) = *(_DWORD *)(a1 + 8);
  unint64_t v11 = 52;
  *(_DWORD *)a2 = 52;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 52), __src, v12 + 8);
    uint64_t v13 = (v12 + 60);
    unint64_t v11 = (v12 + 63) & 0xFFFFFFFC;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }
  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      long long v18 = 0u;
      long long v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }
}

void DYTraceEncode_MTLFXTemporalScaler_setMotionVectorScaleY(uint64_t a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    long long v18 = 0u;
    long long v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0);
  *(_DWORD *)(a2 + 36) = 26179;
  *(void *)a2 = 0xFFFFB01200000028;
  *(void *)(a2 + 40) = *(void *)a1;
  *(_DWORD *)a2 = 48;
  *(_DWORD *)(a2 + 48) = *(_DWORD *)(a1 + 8);
  unint64_t v11 = 52;
  *(_DWORD *)a2 = 52;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 52), __src, v12 + 8);
    uint64_t v13 = (v12 + 60);
    unint64_t v11 = (v12 + 63) & 0xFFFFFFFC;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }
  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      long long v18 = 0u;
      long long v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }
}

void DYTraceEncode_MTLFXTemporalScaler_setOutputTexture(void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    long long v18 = 0u;
    long long v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0);
  *(_DWORD *)(a2 + 36) = 29763;
  *(void *)a2 = 0xFFFFB01300000028;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = a1[1];
  unint64_t v11 = 56;
  *(_DWORD *)a2 = 56;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 56), __src, v12 + 8);
    uint64_t v13 = (v12 + 64);
    unint64_t v11 = (v12 + 67) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }
  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      long long v18 = 0u;
      long long v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }
}

void DYTraceEncode_MTLFXTemporalScaler_setPreExposure(uint64_t a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    long long v18 = 0u;
    long long v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0);
  *(_DWORD *)(a2 + 36) = 26179;
  *(void *)a2 = 0xFFFFB01400000028;
  *(void *)(a2 + 40) = *(void *)a1;
  *(_DWORD *)a2 = 48;
  *(_DWORD *)(a2 + 48) = *(_DWORD *)(a1 + 8);
  unint64_t v11 = 52;
  *(_DWORD *)a2 = 52;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 52), __src, v12 + 8);
    uint64_t v13 = (v12 + 60);
    unint64_t v11 = (v12 + 63) & 0xFFFFFFFC;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }
  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      long long v18 = 0u;
      long long v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }
}

void DYTraceEncode_MTLFXTemporalScaler_setReactiveMaskTexture(void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    long long v18 = 0u;
    long long v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0);
  *(_DWORD *)(a2 + 36) = 29763;
  *(void *)a2 = 0xFFFFB01800000028;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = a1[1];
  unint64_t v11 = 56;
  *(_DWORD *)a2 = 56;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 56), __src, v12 + 8);
    uint64_t v13 = (v12 + 64);
    unint64_t v11 = (v12 + 67) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }
  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      long long v18 = 0u;
      long long v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }
}

void DYTraceEncode_MTLFXTemporalScaler_setReset(uint64_t a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    long long v18 = 0u;
    long long v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0);
  *(_DWORD *)(a2 + 36) = 6911299;
  *(void *)a2 = 0xFFFFB01500000028;
  *(void *)(a2 + 40) = *(void *)a1;
  *(_DWORD *)a2 = 48;
  *(_DWORD *)(a2 + 48) = *(_DWORD *)(a1 + 8);
  unint64_t v11 = 52;
  *(_DWORD *)a2 = 52;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 52), __src, v12 + 8);
    uint64_t v13 = (v12 + 60);
    unint64_t v11 = (v12 + 63) & 0xFFFFFFFC;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }
  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      long long v18 = 0u;
      long long v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }
}

void DYTraceEncode_MTLFXTemporalScaler_dealloc(void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    long long v18 = 0u;
    long long v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0);
  *(_DWORD *)(a2 + 36) = 67;
  *(void *)a2 = 0xFFFFB01600000028;
  *(void *)(a2 + 40) = *a1;
  unint64_t v11 = 48;
  *(_DWORD *)a2 = 48;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 48), __src, v12 + 8);
    uint64_t v13 = (v12 + 56);
    unint64_t v11 = (v12 + 59) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }
  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      long long v18 = 0u;
      long long v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }
}

void DYTraceEncode_MTLFXTemporalScaler_encodeToCommandBuffer(void *a1, uint64_t a2, unint64_t a3, _DWORD *__src, int *a5)
{
  if (a3 <= 0x23 && a5)
  {
    int v10 = *a5;
    long long v18 = 0u;
    long long v19 = 0u;
    int v15 = v10;
    int v16 = 500;
    int v17 = "36 <= length";
    GTError_addError(a5, (uint64_t)&v15);
  }
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(_DWORD *)(a2 + 32) = 8 * (__src != 0);
  *(_DWORD *)(a2 + 36) = 29763;
  *(void *)a2 = 0xFFFFB01700000028;
  *(void *)(a2 + 40) = *a1;
  *(_DWORD *)a2 = 48;
  *(void *)(a2 + 48) = a1[1];
  unint64_t v11 = 56;
  *(_DWORD *)a2 = 56;
  if (__src)
  {
    int v12 = 8 * *__src;
    memcpy((void *)(a2 + 56), __src, v12 + 8);
    uint64_t v13 = (v12 + 64);
    unint64_t v11 = (v12 + 67) & 0xFFFFFFF8;
    bzero((void *)(a2 + v13), v11 - v13);
    *(_DWORD *)a2 = v11;
  }
  if (v11 > a3)
  {
    if (a5)
    {
      int v14 = *a5;
      long long v18 = 0u;
      long long v19 = 0u;
      int v15 = v14;
      int v16 = 500;
      int v17 = "bytes->length <= length";
      GTError_addError(a5, (uint64_t)&v15);
    }
  }
}

uint64_t GTMTLGPUAddressResource_compare(void *a1, void *a2)
{
  if (*a1 < *a2) {
    return 0xFFFFFFFFLL;
  }
  else {
    return *a1 != *a2;
  }
}

void *GTMTLGPUAddressResource_resourceForGPUAddress(void *a1, unint64_t a2, unint64_t a3)
{
  if (!a2) {
    return 0;
  }
  v3 = a1;
  do
  {
    v4 = &a1[3 * (a2 >> 1)];
    unint64_t v6 = *v4;
    v5 = v4 + 3;
    BOOL v7 = v6 > a3;
    if (v6 <= a3) {
      a2 += ~(a2 >> 1);
    }
    else {
      a2 >>= 1;
    }
    if (!v7) {
      a1 = v5;
    }
  }
  while (a2);
  if (a1 == v3) {
    return 0;
  }
  uint64_t v9 = *(a1 - 3);
  uint64_t v10 = *(a1 - 2);
  result = a1 - 3;
  if (v10 + v9 <= a3) {
    return 0;
  }
  return result;
}

uint64_t GTMTLGPUAddressResource_translateToBufferOffset(uint64_t result)
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

uint64_t GTMTLUniqueIdentifierResource_resourceForIdentifier(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a2;
  entry = find_entry(a1, &v4, 8uLL, 0);
  if (*entry) {
    return *(void *)(*entry + 32);
  }
  else {
    return 0;
  }
}

uint64_t GTMTLUniqueIdentifierResource_resourceForGPUResourceID(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a2;
  entry = find_entry(a1, &v4, 8uLL, 0);
  if (*entry) {
    return *(void *)(*entry + 32);
  }
  else {
    return 0;
  }
}

uint64_t GTMTLUniqueIdentifierResource_resourceForGPUResourceIDWithType(uint64_t *a1, int a2, uint64_t a3)
{
  uint64_t v4 = 0;
  if (a2 > 114)
  {
    if ((a2 - 117) < 2)
    {
      v5 = a1 + 8;
    }
    else if (a2 == 115)
    {
      v5 = a1 + 6;
    }
    else
    {
      if (a2 != 116) {
        goto LABEL_20;
      }
      v5 = a1 + 7;
    }
  }
  else if (a2 <= 77)
  {
    if (a2 == 58)
    {
      v5 = a1 + 1;
    }
    else
    {
      if (a2 != 59) {
        goto LABEL_20;
      }
      v5 = a1 + 2;
    }
  }
  else
  {
    switch(a2)
    {
      case 'N':
        v5 = a1 + 3;
        break;
      case 'O':
        v5 = a1 + 4;
        break;
      case 'P':
        v5 = a1 + 5;
        break;
      default:
        goto LABEL_20;
    }
  }
  uint64_t v4 = *v5;
LABEL_20:
  uint64_t v8 = a3;
  entry = find_entry(v4, &v8, 8uLL, 0);
  if (*entry) {
    return *(void *)(*entry + 32);
  }
  else {
    return 0;
  }
}

uint64_t GTMTLIndirectResources_renderPipelineIdForUniqueIdentifier(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  uint64_t v6 = a2;
  entry = find_entry(v2, &v6, 8uLL, 0);
  if (*entry && (uint64_t v4 = *(void *)(*entry + 32)) != 0) {
    return *(void *)(v4 + 8);
  }
  else {
    return 0;
  }
}

uint64_t GTMTLIndirectResources_computePipelineIdForUniqueIdentifier(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v6 = a2;
  entry = find_entry(v2, &v6, 8uLL, 0);
  if (*entry && (uint64_t v4 = *(void *)(*entry + 32)) != 0) {
    return *(void *)(v4 + 8);
  }
  else {
    return 0;
  }
}

uint64_t GTMTLIndirectResources_renderPipelineIdForGPUResourceID(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  uint64_t v6 = a2;
  entry = find_entry(v2, &v6, 8uLL, 0);
  if (*entry && (uint64_t v4 = *(void *)(*entry + 32)) != 0) {
    return *(void *)(v4 + 8);
  }
  else {
    return 0;
  }
}

uint64_t GTMTLIndirectResources_computePipelineIdForGPUResourceID(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v6 = a2;
  entry = find_entry(v2, &v6, 8uLL, 0);
  if (*entry && (uint64_t v4 = *(void *)(*entry + 32)) != 0) {
    return *(void *)(v4 + 8);
  }
  else {
    return 0;
  }
}

uint64_t GTMTLIndirectResources_visibleFunctionTableIdForGPUAddress(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = a2;
  entry = find_entry(*(void *)(a1 + 72), &v5, 8uLL, 0);
  if (*entry && (uint64_t v3 = *(void *)(*entry + 32)) != 0) {
    return *(void *)(v3 + 8);
  }
  else {
    return 0;
  }
}

void GTMTLUniqueIdentifierResource_fillHashMap(char *key, int a2, apr_hash_t *ht)
{
  if (a2 >= 1)
  {
    uint64_t v5 = a2;
    do
    {
      apr_hash_set(ht, key, 8, key);
      key += 32;
      --v5;
    }
    while (v5);
  }
}

void GTMTLUniqueIdentifierResource_fillHashMapByKey(char *val, int a2, int a3, apr_hash_t *ht)
{
  if (a2 >= 1)
  {
    uint64_t v7 = 0;
    uint64_t v8 = a2;
    uint64_t v9 = val;
    do
    {
      uint64_t v10 = &val[32 * v7];
      if (a3 == 1) {
        v10 += 16;
      }
      if (a3 == 2) {
        unint64_t v11 = v9 + 24;
      }
      else {
        unint64_t v11 = v10;
      }
      apr_hash_set(ht, v11, 8, v9);
      ++v7;
      v9 += 32;
      --v8;
    }
    while (v8);
  }
}

void GTMTLIndirectResources_optimize(apr_pool_t *pool@<X1>, uint64_t *a2@<X0>, uint64_t *a3@<X8>)
{
}

void GTMTLIndirectResources_optimizeByKey(apr_pool_t *pool@<X2>, uint64_t *a2@<X0>, int a3@<W1>, uint64_t *a4@<X8>)
{
  uint64_t v8 = *a2;
  *a4 = *a2;
  uint64_t v9 = apr_hash_make(pool);
  a4[1] = (uint64_t)v9;
  uint64_t v10 = apr_hash_make(pool);
  a4[2] = (uint64_t)v10;
  unint64_t v11 = apr_hash_make(pool);
  a4[3] = (uint64_t)v11;
  int v12 = apr_hash_make(pool);
  a4[4] = (uint64_t)v12;
  uint64_t v13 = apr_hash_make(pool);
  a4[5] = (uint64_t)v13;
  ht = apr_hash_make(pool);
  a4[6] = (uint64_t)ht;
  v22 = apr_hash_make(pool);
  a4[7] = (uint64_t)v22;
  v23 = apr_hash_make(pool);
  a4[8] = (uint64_t)v23;
  int v14 = apr_hash_make(pool);
  a4[9] = (uint64_t)v14;
  a4[10] = 0;
  qsort(*(void **)(v8 + 24), *(int *)(v8 + 12), *(int *)(v8 + 8), (int (__cdecl *)(const void *, const void *))GTMTLGPUAddressResource_compare);
  GTMTLUniqueIdentifierResource_fillHashMapByKey(*(char **)(a2[1] + 24), *(_DWORD *)(a2[1] + 12), a3, v9);
  GTMTLUniqueIdentifierResource_fillHashMapByKey(*(char **)(a2[2] + 24), *(_DWORD *)(a2[2] + 12), a3, v10);
  GTMTLUniqueIdentifierResource_fillHashMapByKey(*(char **)(a2[3] + 24), *(_DWORD *)(a2[3] + 12), a3, v11);
  GTMTLUniqueIdentifierResource_fillHashMapByKey(*(char **)(a2[4] + 24), *(_DWORD *)(a2[4] + 12), a3, v12);
  GTMTLUniqueIdentifierResource_fillHashMapByKey(*(char **)(a2[5] + 24), *(_DWORD *)(a2[5] + 12), a3, v13);
  GTMTLUniqueIdentifierResource_fillHashMapByKey(*(char **)(a2[6] + 24), *(_DWORD *)(a2[6] + 12), a3, ht);
  uint64_t v15 = a2[6];
  uint64_t v16 = *(unsigned int *)(v15 + 12);
  if ((int)v16 >= 1)
  {
    uint64_t v17 = *(void *)(v15 + 24);
    do
    {
      apr_hash_set(v14, (const void *)(v17 + 24), 8, (const void *)v17);
      v17 += 32;
      --v16;
    }
    while (v16);
  }
  GTMTLUniqueIdentifierResource_fillHashMapByKey(*(char **)(a2[7] + 24), *(_DWORD *)(a2[7] + 12), a3, v22);
  uint64_t v18 = a2[8];
  long long v19 = *(char **)(v18 + 24);
  int v20 = *(_DWORD *)(v18 + 12);

  GTMTLUniqueIdentifierResource_fillHashMapByKey(v19, v20, a3, v23);
}

void GTMTLIndirectResources_allResources(apr_pool_t *p@<X2>, _DWORD **a2@<X0>, unint64_t a3@<X1>, uint64_t *a4@<X8>)
{
}

void GTMTLIndirectResources_allResourcesByKey(apr_pool_t *p@<X3>, _DWORD **a2@<X0>, unint64_t a3@<X1>, int a4@<W2>, uint64_t *a5@<X8>)
{
  uint64_t v10 = apr_array_make(p, 32, 8);
  v10->int nelts = 0;
  GTMTLSMContext_getObjects(a2[1], a3, v10);
  unint64_t v11 = apr_array_make(p, v10->nelts, 24);
  v60[0] = (uint64_t)v11;
  if (v10->nelts >= 1)
  {
    int v12 = v11;
    uint64_t v13 = 0;
    do
    {
      uint64_t v14 = *(void *)&v10->elts[8 * v13];
      uint64_t v15 = (int8x16_t *)apr_array_push(v12);
      *uint64_t v15 = vextq_s8(*(int8x16_t *)(v14 + 104), *(int8x16_t *)(v14 + 104), 8uLL);
      v15[1].i64[0] = *(void *)(v14 + 8);
      ++v13;
    }
    while (v13 < v10->nelts);
  }
  v10->int nelts = 0;
  GTMTLSMContext_getObjects(a2[2], a3, v10);
  uint64_t v16 = apr_array_make(p, v10->nelts, 32);
  v60[1] = (uint64_t)v16;
  if (v10->nelts >= 1)
  {
    uint64_t v17 = v16;
    uint64_t v18 = 0;
    do
    {
      long long v19 = *(void **)&v10->elts[8 * v18];
      int v20 = apr_array_push(v17);
      v20[1] = v19[1];
      *int v20 = v19[21];
      v20[2] = v19[25];
      ++v18;
    }
    while (v18 < v10->nelts);
  }
  v10->int nelts = 0;
  GTMTLSMContext_getObjects(a2[3], a3, v10);
  v21 = apr_array_make(p, v10->nelts, 32);
  v60[2] = (uint64_t)v21;
  int nelts = v10->nelts;
  if (nelts >= 1)
  {
    v23 = v21;
    for (uint64_t i = 0; i < nelts; ++i)
    {
      v25 = *(void **)&v10->elts[8 * i];
      uint64_t v26 = v25[6];
      if (v26 && *(unsigned char *)(v26 + 62))
      {
        v27 = apr_array_push(v23);
        v27[1] = v25[1];
        void *v27 = v25[8];
        v27[2] = v25[9];
        int nelts = v10->nelts;
      }
    }
  }
  v61 = 0;
  v62 = 0;
  v63 = 0;
  v10->int nelts = 0;
  GTMTLSMContext_getObjects(a2[4], a3, v10);
  v28 = apr_array_make(p, v10->nelts, 32);
  v60[3] = (uint64_t)v28;
  int v29 = v10->nelts;
  if (v29 >= 1)
  {
    v30 = v28;
    for (uint64_t j = 0; j < v29; ++j)
    {
      v32 = *(void **)&v10->elts[8 * j];
      if (GTMTLSMPipelineState_supportsIndirectCommandBuffers((uint64_t)v32))
      {
        v33 = apr_array_push(v30);
        v33[1] = v32[1];
        void *v33 = v32[12];
        v33[2] = v32[14];
        int v29 = v10->nelts;
      }
    }
  }
  v10->int nelts = 0;
  GTMTLSMContext_getObjects(a2[5], a3, v10);
  v34 = apr_array_make(p, v10->nelts, 32);
  v60[4] = (uint64_t)v34;
  int v35 = v10->nelts;
  if (v35 >= 1)
  {
    v36 = v34;
    for (uint64_t k = 0; k < v35; ++k)
    {
      v38 = *(void **)&v10->elts[8 * k];
      if (GTMTLSMPipelineState_supportsIndirectCommandBuffers((uint64_t)v38))
      {
        v39 = apr_array_push(v36);
        v39[1] = v38[1];
        void *v39 = v38[12];
        v39[2] = v38[14];
        int v35 = v10->nelts;
      }
    }
  }
  v10->int nelts = 0;
  GTMTLSMContext_getObjects(a2[6], a3, v10);
  v40 = apr_array_make(p, v10->nelts, 32);
  v60[5] = (uint64_t)v40;
  if (v10->nelts >= 1)
  {
    v41 = v40;
    uint64_t v42 = 0;
    do
    {
      v43 = *(void **)&v10->elts[8 * v42];
      v44 = apr_array_push(v41);
      v44[1] = v43[1];
      void *v44 = v43[15];
      v44[2] = v43[16];
      ++v42;
    }
    while (v42 < v10->nelts);
  }
  v10->int nelts = 0;
  GTMTLSMContext_getObjects(a2[7], a3, v10);
  v45 = apr_array_make(p, v10->nelts, 32);
  v61 = v45;
  if (v10->nelts >= 1)
  {
    v46 = v45;
    uint64_t v47 = 0;
    do
    {
      uint64_t v48 = *(void *)&v10->elts[8 * v47];
      v49 = apr_array_push(v46);
      v49[1] = *(void *)(v48 + 8);
      void *v49 = *(void *)(v48 + 136);
      *((_OWORD *)v49 + 1) = *(_OWORD *)(v48 + 152);
      ++v47;
    }
    while (v47 < v10->nelts);
  }
  v10->int nelts = 0;
  GTMTLSMContext_getObjects(a2[8], a3, v10);
  v50 = apr_array_make(p, v10->nelts, 32);
  v62 = v50;
  if (v10->nelts >= 1)
  {
    v51 = v50;
    uint64_t v52 = 0;
    do
    {
      v53 = *(void **)&v10->elts[8 * v52];
      v54 = apr_array_push(v51);
      v54[1] = v53[1];
      void *v54 = v53[18];
      v54[2] = v53[19];
      ++v52;
    }
    while (v52 < v10->nelts);
  }
  v10->int nelts = 0;
  GTMTLSMContext_getObjects(a2[9], a3, v10);
  v55 = apr_array_make(p, v10->nelts, 32);
  v63 = v55;
  if (v10->nelts >= 1)
  {
    v56 = v55;
    uint64_t v57 = 0;
    do
    {
      v58 = *(void **)&v10->elts[8 * v57];
      v59 = apr_array_push(v56);
      v59[1] = v58[1];
      void *v59 = v58[16];
      v59[2] = v58[17];
      ++v57;
    }
    while (v57 < v10->nelts);
  }
  GTMTLIndirectResources_optimizeByKey(p, v60, a4, a5);
}

apr_hash_index_t *GTMTLIndirectResources_rehash@<X0>(apr_pool_t *p@<X2>, apr_hash_index_t *result@<X0>, int a3@<W1>, uint64_t a4@<X8>)
{
  uint64_t v4 = (uint64_t *)result;
  if (*((unsigned __int8 *)result + 80) == a3)
  {
    long long v6 = *((_OWORD *)result + 3);
    *(_OWORD *)(a4 + 32) = *((_OWORD *)result + 2);
    *(_OWORD *)(a4 + 48) = v6;
    *(_OWORD *)(a4 + 64) = *((_OWORD *)result + 4);
    *(void *)(a4 + 80) = *((void *)result + 10);
    long long v7 = *((_OWORD *)result + 1);
    *(_OWORD *)a4 = *(_OWORD *)result;
    *(_OWORD *)(a4 + 16) = v7;
  }
  else
  {
    *(void *)a4 = apr_array_copy(p, *(const apr_array_header_t **)result);
    uint64_t v10 = apr_hash_make(p);
    *(void *)(a4 + 8) = v10;
    unint64_t v11 = apr_hash_make(p);
    *(void *)(a4 + 16) = v11;
    int v12 = apr_hash_make(p);
    *(void *)(a4 + 24) = v12;
    uint64_t v13 = apr_hash_make(p);
    *(void *)(a4 + 32) = v13;
    uint64_t v14 = apr_hash_make(p);
    *(void *)(a4 + 40) = v14;
    uint64_t v15 = apr_hash_make(p);
    *(void *)(a4 + 48) = v15;
    long long v19 = apr_hash_make(p);
    *(void *)(a4 + 56) = v19;
    uint64_t v18 = apr_hash_make(p);
    *(void *)(a4 + 64) = v18;
    uint64_t v16 = apr_hash_make(p);
    *(void *)(a4 + 72) = v16;
    *(unsigned char *)(a4 + 80) = a3;
    *(_DWORD *)(a4 + 81) = 0;
    *(_DWORD *)(a4 + 84) = 0;
    GTMTLUniqueIdentifierResource_fillHashMapByKey_apr_ht(v4[1], a3, v10);
    GTMTLUniqueIdentifierResource_fillHashMapByKey_apr_ht(v4[2], a3, v11);
    GTMTLUniqueIdentifierResource_fillHashMapByKey_apr_ht(v4[3], a3, v12);
    GTMTLUniqueIdentifierResource_fillHashMapByKey_apr_ht(v4[4], a3, v13);
    GTMTLUniqueIdentifierResource_fillHashMapByKey_apr_ht(v4[5], a3, v14);
    GTMTLUniqueIdentifierResource_fillHashMapByKey_apr_ht(v4[6], a3, v15);
    GTMTLUniqueIdentifierResource_fillHashMapByKey_apr_ht(v4[9], 2, v16);
    GTMTLUniqueIdentifierResource_fillHashMapByKey_apr_ht(v4[7], a3, v19);
    uint64_t v17 = v4[8];
    return GTMTLUniqueIdentifierResource_fillHashMapByKey_apr_ht(v17, a3, v18);
  }
  return result;
}

apr_hash_index_t *GTMTLUniqueIdentifierResource_fillHashMapByKey_apr_ht(uint64_t a1, int a2, apr_hash_t *a3)
{
  uint64_t v5 = *(apr_pool_t **)a3;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 16) = a1;
  *(_DWORD *)(a1 + 40) = 0;
  result = apr_hash_next((apr_hash_index_t *)(a1 + 16));
  if (result)
  {
    long long v7 = result;
    do
    {
      uint64_t v8 = *(_OWORD **)(*((void *)v7 + 1) + 32);
      uint64_t v9 = apr_palloc(v5, 0x20uLL);
      long long v10 = v8[1];
      *uint64_t v9 = *v8;
      v9[1] = v10;
      unint64_t v11 = v9 + 1;
      if (a2 != 1) {
        unint64_t v11 = v9;
      }
      if (a2 == 2) {
        int v12 = (char *)v9 + 24;
      }
      else {
        int v12 = v11;
      }
      apr_hash_set(a3, v12, 8, v9);
      result = apr_hash_next(v7);
      long long v7 = result;
    }
    while (result);
  }
  return result;
}

unint64_t SaveResourceMapsData(void *a1, void *a2, unint64_t a3, uint64_t a4)
{
  long long v7 = a1;
  if (a3 > 7)
  {
    *a2 = 81;
    uint64_t v8 = *a1;
    uint64_t v9 = (int *)(*a1 + 12);
    int v10 = *v9;
    if (a3 < 0x10) {
      goto LABEL_6;
    }
    a2[1] = v10;
  }
  else
  {
    uint64_t v8 = *a1;
    uint64_t v9 = (int *)(*a1 + 12);
  }
  int v10 = *(_DWORD *)(v8 + 12);
LABEL_6:
  if (v10 < 1)
  {
    uint64_t v17 = 16;
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = a2 + 2;
    do
    {
      uint64_t v14 = *(void **)(*(void *)(v8 + 24) + 8 * v12);
      if (v14) {
        uint64_t v15 = v14[1];
      }
      else {
        uint64_t v15 = 0;
      }
      uint64_t v93 = v15;
      uint64_t v16 = *find_entry(a4, &v93, 8uLL, 0);
      if (v16) {
        uint64_t v16 = *(void *)(v16 + 32);
      }
      if (v11 * 8 + 24 <= a3) {
        v13[v11] = *(void *)(v16 + 8);
      }
      if (v11 * 8 + 32 <= a3) {
        v13[v11 + 1] = v14[14];
      }
      if (v11 * 8 + 40 <= a3) {
        v13[v11 + 2] = v14[13];
      }
      ++v12;
      v11 += 3;
    }
    while (v12 < *v9);
    uint64_t v17 = v11 * 8 + 16;
  }
  uint64_t v18 = v7[1];
  int v19 = *(_DWORD *)(v18 + 12);
  uint64_t v20 = v17 + 8;
  if (v17 + 8 <= a3)
  {
    *(void *)((char *)a2 + v17) = v19;
    int v19 = *(_DWORD *)(v18 + 12);
  }
  if (v19 >= 1)
  {
    uint64_t v21 = 0;
    unint64_t v22 = v17 + 32;
    do
    {
      v23 = *(void **)(*(void *)(v18 + 24) + 8 * v21);
      if (v23) {
        uint64_t v24 = v23[1];
      }
      else {
        uint64_t v24 = 0;
      }
      uint64_t v93 = v24;
      uint64_t v25 = *find_entry(a4, &v93, 8uLL, 0);
      if (v25) {
        uint64_t v25 = *(void *)(v25 + 32);
      }
      if (v22 - 16 <= a3) {
        *(void *)((char *)a2 + v22 - 24) = *(void *)(v25 + 8);
      }
      if (v22 - 8 <= a3) {
        *(void *)((char *)a2 + v22 - 16) = v23[21];
      }
      if (v22 <= a3) {
        *(void *)((char *)a2 + v22 - 8) = v23[25];
      }
      ++v21;
      v22 += 24;
    }
    while (v21 < *(int *)(v18 + 12));
    uint64_t v20 = v22 - 24;
  }
  uint64_t v26 = v7[2];
  uint64_t v27 = *(unsigned int *)(v26 + 12);
  if ((int)v27 < 1)
  {
    int v28 = 0;
  }
  else
  {
    int v28 = 0;
    int v29 = *(uint64_t **)(v26 + 24);
    v30 = v29;
    do
    {
      uint64_t v31 = *v30;
      if (*(unsigned char *)(*(void *)(*v30 + 48) + 62))
      {
        uint64_t *v30 = v29[v28];
        v29[v28++] = v31;
      }
      ++v30;
      --v27;
    }
    while (v27);
  }
  uint64_t v32 = v20 + 8;
  if (v20 + 8 <= a3) {
    *(void *)((char *)a2 + v20) = v28;
  }
  v92 = v7;
  if (v28 >= 1)
  {
    uint64_t v33 = 0;
    uint64_t v34 = 0;
    int v35 = (char *)a2 + v20;
    uint64_t v36 = 24 * v28;
    do
    {
      v37 = *(void **)(*(void *)(v26 + 24) + v33);
      if (v37) {
        uint64_t v38 = v37[1];
      }
      else {
        uint64_t v38 = 0;
      }
      uint64_t v93 = v38;
      uint64_t v39 = *find_entry(a4, &v93, 8uLL, 0);
      if (v39) {
        uint64_t v39 = *(void *)(v39 + 32);
      }
      if (v20 + v34 + 16 <= a3) {
        *(void *)&v35[v34 + 8] = *(void *)(v39 + 8);
      }
      if (v20 + v34 + 24 <= a3) {
        *(void *)&v35[v34 + 16] = v37[8];
      }
      if (v20 + v34 + 32 <= a3) {
        *(void *)&v35[v34 + 24] = v37[9];
      }
      v34 += 24;
      v33 += 8;
    }
    while (v36 != v34);
    uint64_t v32 = v20 + v34 + 8;
    long long v7 = v92;
  }
  uint64_t v40 = v7[3];
  int v41 = GTMTLSMPipelineState_sortIndirectResources(*(uint64_t **)(v40 + 24), *(_DWORD *)(v40 + 12));
  uint64_t v42 = v32 + 8;
  if (v32 + 8 <= a3) {
    *(void *)((char *)a2 + v32) = v41;
  }
  if (v41 >= 1)
  {
    uint64_t v43 = 0;
    uint64_t v44 = 0;
    v45 = (char *)a2 + v32;
    uint64_t v46 = 24 * v41;
    do
    {
      uint64_t v47 = *(void **)(*(void *)(v40 + 24) + v43);
      if (v47) {
        uint64_t v48 = v47[1];
      }
      else {
        uint64_t v48 = 0;
      }
      uint64_t v93 = v48;
      uint64_t v49 = *find_entry(a4, &v93, 8uLL, 0);
      if (v49) {
        uint64_t v49 = *(void *)(v49 + 32);
      }
      if (v32 + v44 + 16 <= a3) {
        *(void *)&v45[v44 + 8] = *(void *)(v49 + 8);
      }
      if (v32 + v44 + 24 <= a3) {
        *(void *)&v45[v44 + 16] = v47[12];
      }
      if (v32 + v44 + 32 <= a3) {
        *(void *)&v45[v44 + 24] = v47[14];
      }
      v44 += 24;
      v43 += 8;
    }
    while (v46 != v44);
    uint64_t v42 = v32 + v44 + 8;
    long long v7 = v92;
  }
  uint64_t v50 = v7[4];
  int v51 = GTMTLSMPipelineState_sortIndirectResources(*(uint64_t **)(v50 + 24), *(_DWORD *)(v50 + 12));
  uint64_t v52 = v42 + 8;
  if (v42 + 8 <= a3) {
    *(void *)((char *)a2 + v42) = v51;
  }
  if (v51 >= 1)
  {
    uint64_t v53 = 0;
    uint64_t v54 = 0;
    v55 = (char *)a2 + v42;
    uint64_t v56 = 24 * v51;
    do
    {
      uint64_t v57 = *(void **)(*(void *)(v50 + 24) + v53);
      if (v57) {
        uint64_t v58 = v57[1];
      }
      else {
        uint64_t v58 = 0;
      }
      uint64_t v93 = v58;
      uint64_t v59 = *find_entry(a4, &v93, 8uLL, 0);
      if (v59) {
        uint64_t v59 = *(void *)(v59 + 32);
      }
      if (v42 + v54 + 16 <= a3) {
        *(void *)&v55[v54 + 8] = *(void *)(v59 + 8);
      }
      if (v42 + v54 + 24 <= a3) {
        *(void *)&v55[v54 + 16] = v57[12];
      }
      if (v42 + v54 + 32 <= a3) {
        *(void *)&v55[v54 + 24] = v57[14];
      }
      v54 += 24;
      v53 += 8;
    }
    while (v56 != v54);
    uint64_t v52 = v42 + v54 + 8;
    long long v7 = v92;
  }
  uint64_t v60 = v7[5];
  int v61 = *(_DWORD *)(v60 + 12);
  uint64_t v62 = v52 + 8;
  if (v52 + 8 <= a3)
  {
    *(void *)((char *)a2 + v52) = v61;
    int v61 = *(_DWORD *)(v60 + 12);
  }
  if (v61 >= 1)
  {
    uint64_t v63 = 0;
    unint64_t v64 = v52 + 32;
    do
    {
      v65 = *(void **)(*(void *)(v60 + 24) + 8 * v63);
      if (v65) {
        uint64_t v66 = v65[1];
      }
      else {
        uint64_t v66 = 0;
      }
      uint64_t v93 = v66;
      uint64_t v67 = *find_entry(a4, &v93, 8uLL, 0);
      if (v67) {
        uint64_t v67 = *(void *)(v67 + 32);
      }
      if (v64 - 16 <= a3) {
        *(void *)((char *)a2 + v64 - 24) = *(void *)(v67 + 8);
      }
      if (v64 - 8 <= a3) {
        *(void *)((char *)a2 + v64 - 16) = v65[15];
      }
      if (v64 <= a3) {
        *(void *)((char *)a2 + v64 - 8) = v65[16];
      }
      ++v63;
      v64 += 24;
    }
    while (v63 < *(int *)(v60 + 12));
    uint64_t v62 = v64 - 24;
  }
  uint64_t v68 = v7[6];
  int v69 = *(_DWORD *)(v68 + 12);
  uint64_t v70 = v62 + 8;
  if (v62 + 8 <= a3)
  {
    *(void *)((char *)a2 + v62) = v69;
    int v69 = *(_DWORD *)(v68 + 12);
  }
  if (v69 >= 1)
  {
    uint64_t v71 = 0;
    unint64_t v72 = v62 + 32;
    do
    {
      v73 = *(void **)(*(void *)(v68 + 24) + 8 * v71);
      if (v73) {
        uint64_t v74 = v73[1];
      }
      else {
        uint64_t v74 = 0;
      }
      uint64_t v93 = v74;
      uint64_t v75 = *find_entry(a4, &v93, 8uLL, 0);
      if (v75) {
        uint64_t v75 = *(void *)(v75 + 32);
      }
      if (v72 - 16 <= a3) {
        *(void *)((char *)a2 + v72 - 24) = *(void *)(v75 + 8);
      }
      if (v72 - 8 <= a3) {
        *(void *)((char *)a2 + v72 - 16) = v73[17];
      }
      if (v72 <= a3) {
        *(void *)((char *)a2 + v72 - 8) = v73[19];
      }
      ++v71;
      v72 += 24;
    }
    while (v71 < *(int *)(v68 + 12));
    uint64_t v70 = v72 - 24;
  }
  uint64_t v76 = v7[7];
  int v77 = *(_DWORD *)(v76 + 12);
  unint64_t v78 = v70 + 8;
  if (v70 + 8 <= a3)
  {
    *(void *)((char *)a2 + v70) = v77;
    int v77 = *(_DWORD *)(v76 + 12);
  }
  if (v77 >= 1)
  {
    uint64_t v79 = 0;
    unint64_t v80 = v70 + 32;
    do
    {
      v81 = *(void **)(*(void *)(v76 + 24) + 8 * v79);
      if (v81) {
        uint64_t v82 = v81[1];
      }
      else {
        uint64_t v82 = 0;
      }
      uint64_t v93 = v82;
      uint64_t v83 = *find_entry(a4, &v93, 8uLL, 0);
      if (v83) {
        uint64_t v83 = *(void *)(v83 + 32);
      }
      if (v80 - 16 <= a3) {
        *(void *)((char *)a2 + v80 - 24) = *(void *)(v83 + 8);
      }
      if (v80 - 8 <= a3) {
        *(void *)((char *)a2 + v80 - 16) = v81[18];
      }
      if (v80 <= a3) {
        *(void *)((char *)a2 + v80 - 8) = v81[19];
      }
      ++v79;
      v80 += 24;
    }
    while (v79 < *(int *)(v76 + 12));
    unint64_t v78 = v80 - 24;
  }
  uint64_t v84 = v7[8];
  int v85 = *(_DWORD *)(v84 + 12);
  unint64_t result = v78 + 8;
  if (v78 + 8 <= a3)
  {
    *(void *)((char *)a2 + v78) = v85;
    int v85 = *(_DWORD *)(v84 + 12);
  }
  if (v85 >= 1)
  {
    uint64_t v87 = 0;
    unint64_t v88 = v78 + 32;
    do
    {
      v89 = *(void **)(*(void *)(v84 + 24) + 8 * v87);
      if (v89) {
        uint64_t v90 = v89[1];
      }
      else {
        uint64_t v90 = 0;
      }
      uint64_t v93 = v90;
      uint64_t v91 = *find_entry(a4, &v93, 8uLL, 0);
      if (v91) {
        uint64_t v91 = *(void *)(v91 + 32);
      }
      if (v88 - 16 <= a3) {
        *(void *)((char *)a2 + v88 - 24) = *(void *)(v91 + 8);
      }
      if (v88 - 8 <= a3) {
        *(void *)((char *)a2 + v88 - 16) = v89[16];
      }
      if (v88 <= a3) {
        *(void *)((char *)a2 + v88 - 8) = v89[17];
      }
      ++v87;
      v88 += 24;
    }
    while (v87 < *(int *)(v84 + 12));
    return v88 - 24;
  }
  return result;
}

apr_array_header_t *MakeResourceMapsData(apr_array_header_t **a1, unsigned int *a2, int a3, apr_pool_t *p)
{
  unsigned int v6 = *a2;
  int v7 = a2[2];
  uint64_t v8 = a2 + 4;
  uint64_t v9 = apr_array_make(p, v7, 24);
  if (v7 >= 1)
  {
    do
    {
      int v10 = apr_array_push(v9);
      v10[2] = *(void *)v8;
      *int v10 = *((void *)v8 + 1);
      uint64_t v11 = *((void *)v8 + 2);
      v8 += 6;
      v10[1] = v11;
      --v7;
    }
    while (v7);
  }
  uint64_t v13 = v8;
  *a1 = v9;
  a1[1] = LoadUniqueIdentifierResourceGroup((int **)&v13, v6, p);
  a1[2] = LoadUniqueIdentifierResourceGroup((int **)&v13, v6, p);
  if (v6 <= 0x16)
  {
    a1[3] = apr_array_make(p, 0, 32);
    a1[4] = apr_array_make(p, 0, 32);
    a1[5] = apr_array_make(p, 0, 32);
    goto LABEL_8;
  }
  a1[3] = LoadUniqueIdentifierResourceGroup((int **)&v13, v6, p);
  a1[4] = LoadUniqueIdentifierResourceGroup((int **)&v13, v6, p);
  a1[5] = LoadUniqueIdentifierResourceGroup((int **)&v13, v6, p);
  if (v6 <= 0x2E)
  {
LABEL_8:
    a1[6] = apr_array_make(p, 0, 32);
    goto LABEL_9;
  }
  a1[6] = LoadUniqueIdentifierResourceGroup((int **)&v13, v6, p);
  if (v6 < 0x36)
  {
LABEL_9:
    a1[7] = apr_array_make(p, 0, 32);
    unint64_t result = apr_array_make(p, 0, 32);
    goto LABEL_10;
  }
  a1[7] = LoadUniqueIdentifierResourceGroup((int **)&v13, v6, p);
  unint64_t result = LoadUniqueIdentifierResourceGroup((int **)&v13, v6, p);
LABEL_10:
  a1[8] = result;
  return result;
}

apr_array_header_t *LoadUniqueIdentifierResourceGroup(int **a1, unsigned int a2, apr_pool_t *p)
{
  int v5 = **a1;
  *a1 += 2;
  unsigned int v6 = apr_array_make(p, v5, 32);
  if (v5 >= 1)
  {
    do
    {
      int v7 = apr_array_push(v6);
      uint64_t v8 = *a1;
      uint64_t v9 = *(void *)*a1;
      *a1 += 2;
      v7[1] = v9;
      uint64_t v10 = *((void *)v8 + 1);
      *a1 = v8 + 4;
      *int v7 = v10;
      if (a2 >= 0x41)
      {
        uint64_t v11 = *((void *)v8 + 2);
        *a1 = v8 + 6;
        v7[2] = v11;
      }
      --v5;
    }
    while (v5);
  }
  return v6;
}

uint64_t SaveDYMTLMutableBufferAncestorMaps(uint64_t a1, void *a2, unint64_t a3, uint64_t a4)
{
  if (a3 > 7)
  {
    *a2 = 81;
    int v7 = (int *)(a1 + 12);
    int v8 = *(_DWORD *)(a1 + 12);
    if (a3 < 0x10) {
      goto LABEL_6;
    }
    a2[1] = v8;
  }
  else
  {
    int v7 = (int *)(a1 + 12);
  }
  int v8 = *v7;
LABEL_6:
  if (v8 < 1) {
    return 16;
  }
  uint64_t v9 = 0;
  uint64_t v10 = a2 + 3;
  uint64_t v11 = 16;
  uint64_t v26 = a1;
  do
  {
    uint64_t v12 = *(void *)(*(void *)(a1 + 24) + 8 * v9);
    uint64_t v13 = v11 + 8;
    if (v11 + 8 <= a3) {
      *(void *)((char *)a2 + v11) = *(unsigned int *)(v12 + 48);
    }
    uint64_t v14 = (apr_hash_index_t *)(v12 + 16);
    *(void *)(v12 + 24) = 0;
    *(void *)(v12 + 32) = 0;
    *(void *)(v12 + 16) = v12;
    *(_DWORD *)(v12 + 40) = 0;
    while (1)
    {
      uint64_t v15 = apr_hash_next(v14);
      uint64_t v16 = v15;
      if (!v15) {
        break;
      }
      uint64_t v17 = *((void *)v15 + 1);
      uint64_t v18 = *(void *)(v17 + 32);
      uint64_t v27 = **(void **)(v17 + 16);
      entry = find_entry(a4, &v27, 8uLL, 0);
      if (*entry) {
        uint64_t v20 = *(void *)(*entry + 32);
      }
      else {
        uint64_t v20 = 0;
      }
      if (v13 + 8 <= a3) {
        *(void *)((char *)a2 + v13) = *(void *)(v20 + 8);
      }
      if (v13 + 16 <= a3) {
        *(void *)((char *)a2 + v13 + 8) = *(unsigned int *)(v18 + 48);
      }
      *(void *)(v18 + 24) = 0;
      *(void *)(v18 + 32) = 0;
      *(void *)(v18 + 16) = v18;
      *(_DWORD *)(v18 + 40) = 0;
      uint64_t v21 = apr_hash_next((apr_hash_index_t *)(v18 + 16));
      if (v21)
      {
        do
        {
          uint64_t v22 = *((void *)v21 + 1);
          v23 = *(void **)(v22 + 32);
          uint64_t v27 = **(void **)(v22 + 16);
          uint64_t v24 = *find_entry(a4, &v27, 8uLL, 0);
          if (v24) {
            uint64_t v24 = *(void *)(v24 + 32);
          }
          if (v13 + 24 <= a3) {
            *(void *)((char *)v10 + v13 - 8) = *(void *)(v24 + 8);
          }
          if (v13 + 32 <= a3) {
            *(void *)((char *)v10 + v13) = *v23;
          }
          uint64_t v21 = apr_hash_next(v21);
          v13 += 16;
        }
        while (v21);
        v13 += 16;
      }
      else
      {
        v13 += 16;
      }
      uint64_t v14 = v16;
    }
    ++v9;
    uint64_t v11 = v13;
    a1 = v26;
  }
  while (v9 < *v7);
  return v13;
}

uint64_t SaveDYMTLIndirectArgumentBufferInfos(uint64_t a1, uint64_t a2, void *a3, unint64_t a4, uint64_t a5)
{
  uint64_t v8 = a1;
  if (a4 > 7)
  {
    *a3 = 81;
    uint64_t v9 = (int *)(a1 + 12);
    int v10 = *(_DWORD *)(a1 + 12);
    if (a4 < 0x10) {
      goto LABEL_6;
    }
    a3[1] = v10;
  }
  else
  {
    uint64_t v9 = (int *)(a1 + 12);
  }
  int v10 = *v9;
LABEL_6:
  if (v10 < 1) {
    return 16;
  }
  uint64_t v11 = 0;
  uint64_t v25 = a3 + 5;
  uint64_t v26 = v9;
  uint64_t v12 = 16;
  int v28 = a3;
  do
  {
    uint64_t v13 = (uint64_t *)(*(void *)(v8 + 24) + 16 * v11);
    uint64_t v14 = *v13;
    uint64_t v15 = v13[1];
    uint64_t result = v12 + 8;
    if (v12 + 8 <= a4) {
      *(void *)((char *)a3 + v12) = v15;
    }
    unint64_t v17 = v15 + v14;
    if (v17 > (int)v14)
    {
      uint64_t v18 = 0;
      int v19 = (char *)v25 + v12;
      uint64_t v20 = 40 * (int)v14;
      unint64_t v21 = v17 - (int)v14;
      do
      {
        uint64_t v22 = *(void *)(a2 + 24);
        uint64_t v29 = *(void *)(v22 + v20 + v18);
        uint64_t v23 = *find_entry(a5, &v29, 8uLL, 0);
        if (v23) {
          uint64_t v23 = *(void *)(v23 + 32);
        }
        if (v12 + v18 + 16 <= a4) {
          *(void *)&v19[v18 - 32] = *(void *)(v23 + 8);
        }
        if (v12 + v18 + 24 <= a4) {
          *(void *)&v19[v18 - 24] = *(void *)(v22 + v20 + v18 + 8);
        }
        if (v12 + v18 + 32 <= a4) {
          *(void *)&v19[v18 - 16] = *(void *)(v22 + v20 + v18 + 16);
        }
        uint64_t v29 = *(void *)(v22 + v20 + v18 + 24);
        uint64_t v24 = *find_entry(a5, &v29, 8uLL, 0);
        if (v24) {
          uint64_t v24 = *(void *)(v24 + 32);
        }
        if (v12 + v18 + 40 <= a4) {
          *(void *)&v19[v18 - 8] = *(void *)(v24 + 8);
        }
        if (v12 + v18 + 48 <= a4) {
          *(void *)&v19[v18] = *(void *)(v22 + v20 + v18 + 32);
        }
        v18 += 40;
        --v21;
      }
      while (v21);
      uint64_t result = v12 + v18 + 8;
      uint64_t v8 = a1;
      a3 = v28;
      uint64_t v9 = v26;
    }
    ++v11;
    uint64_t v12 = result;
  }
  while (v11 < *v9);
  return result;
}

uint64_t fbuf_header_length(unsigned char *a1)
{
  uint64_t v1 = *(unsigned int *)a1;
  if ((a1[33] & 0x10) == 0) {
    return *(unsigned int *)a1;
  }
  uint64_t v2 = *(unsigned int *)a1;
  do
  {
    a1 += v1;
    uint64_t v1 = *(unsigned int *)a1;
    v2 += v1;
  }
  while ((a1[33] & 0x20) == 0);
  return v2;
}

uint64_t fbuf_header_fits(unsigned int *a1, unint64_t a2)
{
  if (a2 < 0x24) {
    return 0;
  }
  unint64_t v2 = *a1;
  if (v2 > a2) {
    return 0;
  }
  if ((*((unsigned char *)a1 + 33) & 0x10) != 0)
  {
    while (1)
    {
      a2 -= v2;
      if (a2 < 0x24) {
        break;
      }
      a1 = (unsigned int *)((char *)a1 + v2);
      unint64_t v2 = *a1;
      if (a2 < v2) {
        break;
      }
      if ((*((unsigned char *)a1 + 33) & 0x20) != 0) {
        return 1;
      }
    }
    return 0;
  }
  return 1;
}

uint64_t FBDecoder_DecodeArguments(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  int v7 = a2;
  unint64_t v9 = a2 + a3;
  uint64_t v10 = *a1;
  uint64_t v11 = (char *)(a2 + v10);
  uint64_t v12 = (char *)memchr((void *)(a2 + v10), 0, a3 - v10);
  if (!v12) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v13 = v12;
  int v39 = v7;
  uint64_t v40 = a1;
  unsigned int v14 = a1[1];
  uint64_t v15 = v12 + 1;
  if (v11 == v12)
  {
LABEL_36:
    uint64_t result = 0;
    _DWORD *v40 = ((v15 + 3) & 0xFFFFFFFC) - v39;
    v40[1] = v14;
    return result;
  }
  while (1)
  {
    uint64_t v16 = v14;
    if (v14 >= a5) {
      return 2;
    }
    unint64_t v17 = (unint64_t *)(a4 + 16 * v14);
    uint64_t v18 = a4 + 16 * v16;
    *(unsigned char *)(v18 + 11) = 0;
    int v19 = (char *)(v18 + 11);
    uint64_t v20 = a4 + 16 * v16;
    *(_WORD *)(v20 + 8) = 1;
    unint64_t v21 = (unsigned __int16 *)(v20 + 8);
    int v22 = *v11;
    if (v22 == 64)
    {
      unsigned __int16 v23 = 0;
      uint64_t v25 = v11 + 1;
      int v24 = v11[1];
      if (v11 + 1 != v13)
      {
        __int16 v26 = v24 - 48;
        if ((v24 - 48) <= 9)
        {
          unsigned __int16 v23 = 0;
          uint64_t v27 = v11 + 2;
          do
          {
            unsigned __int16 v23 = v26 + 10 * v23;
            BOOL v28 = v27 == v13;
            int v30 = *v27++;
            int v29 = v30;
            if (v28) {
              break;
            }
            __int16 v26 = v29 - 48;
          }
          while ((v29 - 48) < 0xA);
          uint64_t v25 = v27 - 1;
        }
      }
      *int v19 = 1;
      uint64_t v31 = v23;
      unsigned __int16 *v21 = v23;
      int v22 = *v25;
      char v32 = 3;
      uint64_t v11 = v25;
    }
    else
    {
      char v32 = 2;
      uint64_t v31 = 1;
    }
    if (v22 == 117)
    {
      *int v19 = v32;
      char v33 = *++v11;
      LOBYTE(v22) = v33;
    }
    *(unsigned char *)(a4 + 16 * v16 + 10) = v22;
    uint64_t result = 0xFFFFFFFFLL;
    if ((char)v22 <= 97)
    {
      if ((char)v22 != 67)
      {
        if ((char)v22 != 83 && (char)v22 != 85) {
          return result;
        }
        if (v9 - (unint64_t)v15 >= 8 && *v15 == 0xFFFFFFFFLL)
        {
          unint64_t *v17 = 0;
          unsigned __int16 *v21 = 0;
          ++v15;
        }
        else
        {
          unint64_t *v17 = (unint64_t)v15;
          v37 = (char *)memchr(v15, 0, v9 - (void)v15);
          if (!v37) {
            return 0xFFFFFFFFLL;
          }
          unsigned __int16 *v21 = (_WORD)v37 - (_WORD)v15;
          uint64_t v15 = v37 + 1;
        }
        goto LABEL_31;
      }
    }
    else
    {
      unsigned int v35 = (char)v22 - 98;
      if (v35 > 0x15) {
        return result;
      }
      if (((1 << v35) & 0x244404) == 0)
      {
        if (((1 << v35) & 0x90) != 0)
        {
          unint64_t v38 = ((unint64_t)v15 + 3) & 0xFFFFFFFFFFFFFFFCLL;
          unint64_t *v17 = v38;
          uint64_t v15 = (void *)(v38 + 4 * v31);
        }
        else
        {
          if ((char)v22 != 98) {
            return result;
          }
          unint64_t *v17 = (unint64_t)v15;
          uint64_t v15 = (void *)((char *)v15 + v31);
        }
        goto LABEL_31;
      }
    }
    unint64_t v36 = ((unint64_t)v15 + 3) & 0xFFFFFFFFFFFFFFFCLL;
    unint64_t *v17 = v36;
    uint64_t v15 = (void *)(v36 + 8 * v31);
LABEL_31:
    if (v9 < (unint64_t)v15) {
      return 0xFFFFFFFFLL;
    }
    if ((unint64_t)(v11 + 1) < v9 && v11[1] == 60) {
      uint64_t v11 = (char *)memchr(v11 + 2, 62, v13 - (v11 + 2));
    }
    unsigned int v14 = v16 + 1;
    if (++v11 == v13) {
      goto LABEL_36;
    }
  }
}

uint64_t Fbuf_ReturnValue(_DWORD *a1)
{
  uint64_t v1 = (uint64_t)(a1 + 9);
  uint64_t v2 = (*a1 - 36);
  uint64_t v4 = 0;
  FBDecoder_DecodeArguments((unsigned int *)&v4, (uint64_t)(a1 + 9), v2, (uint64_t)v5, 0x10uLL);
  HIDWORD(v4) = 0;
  FBDecoder_DecodeArguments((unsigned int *)&v4, v1, v2, (uint64_t)v5, 0x10uLL);
  return *(void *)v5[0];
}

uint64_t GetStream(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a2;
  entry = find_entry(a1, &v4, 8uLL, 0);
  if (*entry) {
    return *(void *)(*entry + 32);
  }
  else {
    return 0;
  }
}

uint64_t GetObjectDownloadRequest_(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  entry = find_entry(a1, &v4, 8uLL, 0);
  if (*entry) {
    return *(void *)(*entry + 32);
  }
  else {
    return 0;
  }
}

uint64_t GetObjectChildren_(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  entry = find_entry(a1, &v4, 8uLL, 0);
  if (*entry) {
    return *(void *)(*entry + 32);
  }
  else {
    return 0;
  }
}

uint64_t FetchData(uint64_t result)
{
  if (result) {
    result += 16;
  }
  return result;
}

uint64_t CommandBufferCommitIndex(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    unsigned int v2 = 0;
    while (1)
    {
      unsigned int v3 = atomic_load((unsigned int *)(v1 + 4));
      uint64_t v4 = v2 + (v3 >> 6) - 1;
      if ((int)v4 > 0) {
        break;
      }
      uint64_t v1 = *(void *)(v1 + 40);
      unsigned int v2 = v4;
      if (!v1)
      {
        unsigned int v2 = v4;
        goto LABEL_8;
      }
    }
  }
  else
  {
    unsigned int v2 = 0;
  }
  uint64_t v4 = 0;
LABEL_8:
  unint64_t v5 = v2 | (unint64_t)(v4 << 32);
LABEL_9:
  uint64_t v6 = v1 + 64;
  while (v1)
  {
    int v7 = HIDWORD(v5) - v5;
    if ((*(unsigned char *)(v6 + ((uint64_t)(HIDWORD(v5) - (int)v5) << 6) + 15) & 8) == 0) {
      break;
    }
    int v8 = *(_DWORD *)(v6 + ((uint64_t)v7 << 6) + 8);
    if (v8 > -15344)
    {
      unsigned int v11 = v8 + 15343;
      BOOL v12 = v11 > 0x1B;
      int v13 = (1 << v11) & 0xA000001;
      if (!v12 && v13 != 0) {
        return *(void *)(v6 + ((uint64_t)v7 << 6));
      }
    }
    else if (v8 == -16361 || v8 == -16202 || v8 == -15908)
    {
      return *(void *)(v6 + ((uint64_t)v7 << 6));
    }
    unsigned int v15 = atomic_load((unsigned int *)(v1 + 4));
    uint64_t v16 = (HIDWORD(v5) + 1);
    int v17 = v5 + (v15 >> 6) - 1;
    unint64_t v5 = (v16 << 32) | v5;
    if (v16 == v17)
    {
      unint64_t v5 = (v16 << 32) | v16;
      uint64_t v1 = *(void *)(v1 + 40);
      goto LABEL_9;
    }
  }
  return -1;
}

uint64_t CommandBufferQueue(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    unsigned int v4 = 0;
    while (1)
    {
      unsigned int v5 = atomic_load((unsigned int *)(v3 + 4));
      uint64_t v6 = v4 + (v5 >> 6) - 1;
      if ((int)v6 > 0) {
        break;
      }
      uint64_t v3 = *(void *)(v3 + 40);
      unsigned int v4 = v6;
      if (!v3)
      {
        unsigned int v4 = v6;
        goto LABEL_8;
      }
    }
  }
  else
  {
    unsigned int v4 = 0;
  }
  uint64_t v6 = 0;
LABEL_8:
  unint64_t v7 = v4 | (unint64_t)(v6 << 32);
LABEL_9:
  uint64_t v8 = v3 + 64;
  while (1)
  {
    if (!v3 || (*(unsigned char *)(v8 + ((uint64_t)(HIDWORD(v7) - (int)v7) << 6) + 15) & 8) == 0) {
      return -1;
    }
    uint64_t v9 = v8 + ((uint64_t)(HIDWORD(v7) - (int)v7) << 6);
    if (GetFuncEnumConstructorType(*(_DWORD *)(v9 + 8)) == 25) {
      return *(void *)GTTraceFunc_argumentBytesWithMap((void *)v9, *(unsigned __int8 *)(v9 + 13), a2);
    }
    unsigned int v10 = atomic_load((unsigned int *)(v3 + 4));
    int v11 = v7 + (v10 >> 6);
    uint64_t v12 = (HIDWORD(v7) + 1);
    unint64_t v7 = (v12 << 32) | v7;
    if (v12 == v11 - 1)
    {
      unint64_t v7 = (v12 << 32) | v12;
      uint64_t v3 = *(void *)(v3 + 40);
      goto LABEL_9;
    }
  }
}

void GatherResidencySetAllocationsUpToIndex(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5)
{
}

void GatherResidencySetAllocationsUpToIndexInternal(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, int a6)
{
  if (a5) {
    unint64_t v7 = a5;
  }
  else {
    unint64_t v7 = a4;
  }
  uint64_t v8 = *(void *)(a2 + 32);
  if (v8)
  {
    unsigned int v9 = 0;
    while (1)
    {
      unsigned int v10 = atomic_load((unsigned int *)(v8 + 4));
      uint64_t v11 = v9 + (v10 >> 6) - 1;
      if ((int)v11 > 0) {
        break;
      }
      uint64_t v8 = *(void *)(v8 + 40);
      unsigned int v9 = v11;
      if (!v8)
      {
        unsigned int v9 = v11;
        goto LABEL_11;
      }
    }
  }
  else
  {
    unsigned int v9 = 0;
  }
  uint64_t v11 = 0;
LABEL_11:
  unint64_t v12 = 0;
  unint64_t v13 = v9 | (unint64_t)(v11 << 32);
LABEL_12:
  uint64_t v14 = v8 + 64;
  while (v8)
  {
    int v15 = HIDWORD(v13) - v13;
    if ((*(unsigned char *)(v14 + ((uint64_t)(HIDWORD(v13) - (int)v13) << 6) + 15) & 8) == 0) {
      break;
    }
    uint64_t v16 = v15;
    unint64_t v17 = *(void *)(v14 + ((uint64_t)v15 << 6));
    if (v17 >= v7) {
      break;
    }
    int v18 = *(_DWORD *)(v14 + (v16 << 6) + 8);
    if (*(char *)(v14 + ((uint64_t)(HIDWORD(v13) - (int)v13) << 6) + 15) < 0 && v18 == -15208) {
      unint64_t v12 = v17;
    }
    unsigned int v20 = atomic_load((unsigned int *)(v8 + 4));
    uint64_t v21 = (HIDWORD(v13) + 1);
    int v22 = v13 + (v20 >> 6) - 1;
    unint64_t v13 = (v21 << 32) | v13;
    if (v21 == v22)
    {
      unint64_t v13 = (v21 << 32) | v21;
      uint64_t v8 = *(void *)(v8 + 40);
      goto LABEL_12;
    }
  }
  uint64_t v23 = *(void *)(a2 + 32);
  unint64_t v54 = v7;
  unsigned int v24 = 0;
  if (v23)
  {
    while (1)
    {
      unsigned int v25 = atomic_load((unsigned int *)(v23 + 4));
      uint64_t v26 = v24 + (v25 >> 6) - 1;
      if ((int)v26 > 0) {
        break;
      }
      uint64_t v23 = *(void *)(v23 + 40);
      unsigned int v24 = v26;
      if (!v23)
      {
        unsigned int v24 = v26;
        goto LABEL_28;
      }
    }
  }
  uint64_t v26 = 0;
LABEL_28:
  unint64_t v27 = v24 | (unint64_t)(v26 << 32);
LABEL_29:
  uint64_t v28 = v23 + 64;
  while (v23)
  {
    int v29 = HIDWORD(v27) - v27;
    if ((*(unsigned char *)(v28 + ((uint64_t)(HIDWORD(v27) - (int)v27) << 6) + 15) & 8) == 0) {
      break;
    }
    int v30 = (unint64_t *)(v28 + ((uint64_t)v29 << 6));
    unint64_t v31 = *v30;
    if (*v30 >= v12 && (v31 < a4 || *(char *)(v28 + ((uint64_t)(HIDWORD(v27) - (int)v27) << 6) + 15) < 0))
    {
      if (v31 >= v54) {
        return;
      }
      int v32 = *(_DWORD *)(v28 + ((uint64_t)v29 << 6) + 8);
      if (!a6 || (v32 + 15208) >= 3)
      {
        switch(v32)
        {
          case -15220:
            *(void *)(a1 + 8) = apr_hash_copy(**(apr_pool_t ***)a1, *(const apr_hash_t **)a1);
            break;
          case -15212:
            unint64_t v36 = GTTraceFunc_argumentBytesWithMap(v30, *(unsigned __int8 *)(v28 + ((uint64_t)v29 << 6) + 13), a3) + 8;
            entry = find_entry(*(void *)a1, v36, 8uLL, 0);
            if (!*entry || !*(void *)(*entry + 32))
            {
              unint64_t v38 = (char *)apr_palloc(**(apr_pool_t ***)a1, 8uLL);
              *(void *)unint64_t v38 = *(void *)v36;
              int v39 = *(apr_pool_t ***)a1;
              uint64_t v40 = v38;
              goto LABEL_57;
            }
            break;
          case -15211:
            int v41 = GTTraceFunc_argumentBytesWithMap(v30, *(unsigned __int8 *)(v28 + ((uint64_t)v29 << 6) + 13), a3);
            uint64_t v42 = GTTraceFunc_argumentBytesWithMap(v30, v41[16], a3);
            if (*((void *)v41 + 1))
            {
              uint64_t v43 = v42;
              uint64_t v44 = 0;
              unint64_t v45 = 0;
              do
              {
                uint64_t v46 = *find_entry(*(void *)a1, &v43[v44], 8uLL, 0);
                if (!v46 || !*(void *)(v46 + 32))
                {
                  if (v43)
                  {
                    uint64_t v47 = apr_palloc(**(apr_pool_t ***)a1, 8uLL);
                    *uint64_t v47 = *(void *)&v43[8 * v45];
                  }
                  else
                  {
                    uint64_t v47 = 0;
                  }
                  apr_hash_set(*(apr_hash_t **)a1, v47, 8, v47);
                }
                ++v45;
                v44 += 8;
              }
              while (*((void *)v41 + 1) > v45);
            }
            break;
          case -15208:
            apr_hash_clear(*(apr_hash_t **)a1);
            break;
          case -15207:
            unint64_t v38 = GTTraceFunc_argumentBytesWithMap(v30, *(unsigned __int8 *)(v28 + ((uint64_t)v29 << 6) + 13), a3) + 8;
            int v39 = *(apr_pool_t ***)a1;
            uint64_t v40 = 0;
LABEL_57:
            apr_hash_set((apr_hash_t *)v39, v38, 8, v40);
            break;
          case -15206:
            uint64_t v48 = GTTraceFunc_argumentBytesWithMap(v30, *(unsigned __int8 *)(v28 + ((uint64_t)v29 << 6) + 13), a3);
            uint64_t v49 = GTTraceFunc_argumentBytesWithMap(v30, v48[16], a3);
            if (*((void *)v48 + 1))
            {
              uint64_t v50 = v49;
              unint64_t v51 = 0;
              do
              {
                apr_hash_set(*(apr_hash_t **)a1, v50, 8, 0);
                ++v51;
                v50 += 8;
              }
              while (*((void *)v48 + 1) > v51);
            }
            break;
          default:
            break;
        }
      }
    }
    unsigned int v33 = atomic_load((unsigned int *)(v23 + 4));
    int v34 = v27 + (v33 >> 6);
    uint64_t v35 = (HIDWORD(v27) + 1);
    unint64_t v27 = (v35 << 32) | v27;
    if (v35 == v34 - 1)
    {
      unint64_t v27 = (v35 << 32) | v35;
      uint64_t v23 = *(void *)(v23 + 40);
      goto LABEL_29;
    }
  }
}

void GatherResidencySetAllocationsUpToIndexIgnoringRemoves(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5)
{
}

void GatherCommandQueueResidencySetsUpToIndex(apr_pool_t **a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5)
{
}

void GatherCommandQueueResidencySetsUpToIndexInternal(apr_pool_t **a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, int a6)
{
  if (a5) {
    unint64_t v7 = a5;
  }
  else {
    unint64_t v7 = a4;
  }
  uint64_t v8 = *(void *)(a2 + 32);
  if (v8)
  {
    unsigned int v9 = 0;
    while (1)
    {
      unsigned int v10 = atomic_load((unsigned int *)(v8 + 4));
      uint64_t v11 = v9 + (v10 >> 6) - 1;
      if ((int)v11 > 0) {
        break;
      }
      uint64_t v8 = *(void *)(v8 + 40);
      unsigned int v9 = v11;
      if (!v8)
      {
        unsigned int v9 = v11;
        goto LABEL_11;
      }
    }
  }
  else
  {
    unsigned int v9 = 0;
  }
  uint64_t v11 = 0;
LABEL_11:
  unint64_t v12 = 0;
  unint64_t v13 = v9 | (unint64_t)(v11 << 32);
LABEL_12:
  uint64_t v14 = v8 + 64;
  while (v8)
  {
    int v15 = HIDWORD(v13) - v13;
    if ((*(unsigned char *)(v14 + ((uint64_t)(HIDWORD(v13) - (int)v13) << 6) + 15) & 8) == 0) {
      break;
    }
    uint64_t v16 = v15;
    unint64_t v17 = *(void *)(v14 + ((uint64_t)v15 << 6));
    if (v17 >= v7) {
      break;
    }
    int v18 = *(_DWORD *)(v14 + (v16 << 6) + 8);
    if (*(char *)(v14 + ((uint64_t)(HIDWORD(v13) - (int)v13) << 6) + 15) < 0 && v18 == -15251) {
      unint64_t v12 = v17;
    }
    unsigned int v20 = atomic_load((unsigned int *)(v8 + 4));
    uint64_t v21 = (HIDWORD(v13) + 1);
    int v22 = v13 + (v20 >> 6) - 1;
    unint64_t v13 = (v21 << 32) | v13;
    if (v21 == v22)
    {
      unint64_t v13 = (v21 << 32) | v21;
      uint64_t v8 = *(void *)(v8 + 40);
      goto LABEL_12;
    }
  }
  uint64_t v23 = *(void *)(a2 + 32);
  unint64_t v54 = v7;
  unsigned int v24 = 0;
  if (v23)
  {
    while (1)
    {
      unsigned int v25 = atomic_load((unsigned int *)(v23 + 4));
      uint64_t v26 = v24 + (v25 >> 6) - 1;
      if ((int)v26 > 0) {
        break;
      }
      uint64_t v23 = *(void *)(v23 + 40);
      unsigned int v24 = v26;
      if (!v23)
      {
        unsigned int v24 = v26;
        goto LABEL_28;
      }
    }
  }
  uint64_t v26 = 0;
LABEL_28:
  unint64_t v27 = v24 | (unint64_t)(v26 << 32);
LABEL_29:
  uint64_t v28 = v23 + 64;
  while (v23)
  {
    int v29 = HIDWORD(v27) - v27;
    if ((*(unsigned char *)(v28 + ((uint64_t)(HIDWORD(v27) - (int)v27) << 6) + 15) & 8) == 0) {
      break;
    }
    int v30 = (unint64_t *)(v28 + ((uint64_t)v29 << 6));
    unint64_t v31 = *v30;
    if (*v30 >= v12 && (v31 < a4 || *(char *)(v28 + ((uint64_t)(HIDWORD(v27) - (int)v27) << 6) + 15) < 0))
    {
      if (v31 >= v54) {
        return;
      }
      int v32 = *(_DWORD *)(v28 + ((uint64_t)v29 << 6) + 8);
      if (!a6 || (v32 & 0xFFFFFFFE) != 0xFFFFC46E)
      {
        switch(v32)
        {
          case -15252:
            unsigned int v33 = GTTraceFunc_argumentBytesWithMap(v30, *(unsigned __int8 *)(v28 + ((uint64_t)v29 << 6) + 13), a3) + 8;
            uint64_t v34 = *find_entry((uint64_t)a1, v33, 8uLL, 0);
            if (!v34 || !*(void *)(v34 + 32))
            {
              uint64_t v35 = (char *)apr_palloc(*a1, 8uLL);
              *(void *)uint64_t v35 = *(void *)v33;
              unint64_t v36 = (apr_hash_t *)a1;
              v37 = v35;
              goto LABEL_53;
            }
            break;
          case -15251:
            unint64_t v38 = GTTraceFunc_argumentBytesWithMap(v30, *(unsigned __int8 *)(v28 + ((uint64_t)v29 << 6) + 13), a3);
            int v39 = GTTraceFunc_argumentBytesWithMap(v30, v38[16], a3);
            if (*((void *)v38 + 1))
            {
              uint64_t v40 = v39;
              uint64_t v41 = 0;
              unint64_t v42 = 0;
              do
              {
                uint64_t v43 = *find_entry((uint64_t)a1, &v40[v41], 8uLL, 0);
                if (!v43 || !*(void *)(v43 + 32))
                {
                  if (v40)
                  {
                    uint64_t v44 = apr_palloc(*a1, 8uLL);
                    void *v44 = *(void *)&v40[8 * v42];
                  }
                  else
                  {
                    uint64_t v44 = 0;
                  }
                  apr_hash_set((apr_hash_t *)a1, v44, 8, v44);
                }
                ++v42;
                v41 += 8;
              }
              while (*((void *)v38 + 1) > v42);
            }
            break;
          case -15250:
            uint64_t v35 = GTTraceFunc_argumentBytesWithMap(v30, *(unsigned __int8 *)(v28 + ((uint64_t)v29 << 6) + 13), a3) + 8;
            unint64_t v36 = (apr_hash_t *)a1;
            v37 = 0;
LABEL_53:
            apr_hash_set(v36, v35, 8, v37);
            break;
          case -15249:
            unint64_t v45 = GTTraceFunc_argumentBytesWithMap(v30, *(unsigned __int8 *)(v28 + ((uint64_t)v29 << 6) + 13), a3);
            uint64_t v46 = GTTraceFunc_argumentBytesWithMap(v30, v45[16], a3);
            if (*((void *)v45 + 1))
            {
              uint64_t v47 = v46;
              unint64_t v48 = 0;
              do
              {
                apr_hash_set((apr_hash_t *)a1, v47, 8, 0);
                ++v48;
                v47 += 8;
              }
              while (*((void *)v45 + 1) > v48);
            }
            break;
          default:
            break;
        }
      }
    }
    unsigned int v49 = atomic_load((unsigned int *)(v23 + 4));
    int v50 = v27 + (v49 >> 6);
    uint64_t v51 = (HIDWORD(v27) + 1);
    unint64_t v27 = (v51 << 32) | v27;
    if (v51 == v50 - 1)
    {
      unint64_t v27 = (v51 << 32) | v51;
      uint64_t v23 = *(void *)(v23 + 40);
      goto LABEL_29;
    }
  }
}

void GatherCommandQueueResidencySetsUpToIndexIgnoringRemoves(apr_pool_t **a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5)
{
}

char *GTResourceDownloaderGetResourceFilename(uint64_t a1, int a2, char *__str, size_t __size)
{
  unsigned int v5 = *(unsigned __int8 *)(a1 + 46);
  if (v5 > 0x3B)
  {
    if (*(unsigned __int8 *)(a1 + 46) > 0x52u)
    {
      if (v5 == 83)
      {
        snprintf(__str, __size, "MTLVisibleFunctionTable-%llu-%u");
      }
      else if (v5 == 86)
      {
        snprintf(__str, __size, "IOSurface-%llu-%d-%u");
      }
    }
    else if (v5 == 60)
    {
      if (a2 == 1)
      {
        snprintf(__str, __size, "MTLIntersectionFunctionTable-buffers-%llu-%u");
      }
      else if (!a2)
      {
        snprintf(__str, __size, "MTLIntersectionFunctionTable-functions-%llu-%u");
      }
    }
    else if (v5 == 80)
    {
      if (*(unsigned char *)(a1 + 47))
      {
        snprintf(__str, __size, "MTLTexture-%llu-%u-Origin:%u-%u-%u-Size:%u-%u-%u-Level%u-Slice%u", *(void *)(a1 + 8), *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 88 * a2 + 52));
      }
      else if ((*(unsigned char *)(a1 + 47) & 4) != 0)
      {
        snprintf(__str, __size, "CAMetalLayer-%llu-index-%llu");
      }
      else
      {
        snprintf(__str, __size, "MTLTexture-%llu-%u-mipmap%u-slice%u");
      }
    }
  }
  else if (*(unsigned __int8 *)(a1 + 46) > 0x31u)
  {
    if (v5 == 50)
    {
      if (*(void *)(a1 + 48)) {
        snprintf(__str, __size, "MTLHeap-%llu-%u-0x%llx");
      }
      else {
        snprintf(__str, __size, "MTLHeap-%llu-%u");
      }
    }
    else if (v5 == 57)
    {
      snprintf(__str, __size, "MTLIndirectCmdBuf-%llu-%u");
    }
  }
  else if (v5 == 16)
  {
    if (a2 == 1)
    {
      snprintf(__str, __size, "MTLAccelerationStructure-primitive-%llu-%u");
    }
    else if (!a2)
    {
      snprintf(__str, __size, "MTLAccelerationStructure-data-%llu-%u");
    }
  }
  else if (v5 == 22)
  {
    if (*(void *)(a1 + 48)) {
      snprintf(__str, __size, "MTLBuffer-%llu-%u-0x%llx");
    }
    else {
      snprintf(__str, __size, "MTLBuffer-%llu-%u");
    }
  }
  return __str;
}

uint64_t GetFuncEnumConstructorType(int a1)
{
  if (a1 <= -15716)
  {
    if (a1 > -16121)
    {
      if (a1 > -16015)
      {
        if (a1 <= -15892)
        {
          if (a1 > -15970)
          {
            switch(a1)
            {
              case -15922:
                return 59;
              case -15921:
                return 58;
              case -15920:
              case -15919:
              case -15918:
              case -15917:
              case -15916:
              case -15915:
              case -15911:
              case -15910:
                return 0;
              case -15914:
                return 22;
              case -15913:
                return 80;
              case -15912:
              case -15909:
                return 76;
              default:
                if (a1 == -15969)
                {
                  uint64_t result = 57;
                }
                else
                {
                  if (a1 != -15900) {
                    return 0;
                  }
                  uint64_t result = 73;
                }
                break;
            }
            return result;
          }
          if (a1 <= -15997)
          {
            switch(a1)
            {
              case -16014:
                return 28;
              case -16013:
                return 82;
              case -15997:
                return 38;
            }
            return 0;
          }
          if ((a1 + 15980) >= 2)
          {
            if (a1 == -15996) {
              return 76;
            }
            int v6 = -15972;
            goto LABEL_119;
          }
          return 80;
        }
        if (a1 <= -15778)
        {
          if (a1 <= -15848)
          {
            switch(a1)
            {
              case -15891:
                return 64;
              case -15870:
                return 74;
              case -15848:
                return 31;
            }
            return 0;
          }
          if (a1 > -15794)
          {
            if (a1 == -15793) {
              return 68;
            }
            int v6 = -15778;
LABEL_119:
            if (a1 != v6) {
              return 0;
            }
            return 22;
          }
          if (a1 == -15847) {
            return 62;
          }
          if (a1 != -15830) {
            return 0;
          }
          return 43;
        }
        if (a1 > -15739)
        {
          if ((a1 + 15731) >= 2)
          {
            if (a1 == -15738) {
              return 71;
            }
            if (a1 == -15717) {
              return 19;
            }
            return 0;
          }
          return 43;
        }
        if (a1 == -15777 || a1 == -15775) {
          return 80;
        }
        int v5 = -15740;
LABEL_67:
        if (a1 == v5) {
          return 29;
        }
        return 0;
      }
      if (a1 > -16054)
      {
        switch(a1)
        {
          case -16039:
          case -16029:
            return 62;
          case -16038:
            return 43;
          case -16037:
            return 18;
          case -16036:
          case -16035:
          case -16034:
          case -16033:
          case -16032:
            return 0;
          case -16031:
          case -16030:
            return 80;
          default:
            if ((a1 + 16053) < 3) {
              return 18;
            }
            if (a1 == -16018) {
              return 62;
            }
            return 0;
        }
      }
      switch(a1)
      {
        case -16120:
          uint64_t result = 50;
          break;
        case -16119:
        case -16118:
        case -16115:
        case -16114:
        case -16113:
        case -16112:
        case -16111:
        case -16110:
        case -16109:
        case -16108:
        case -16105:
        case -16103:
        case -16102:
        case -16100:
        case -16097:
        case -16094:
        case -16093:
        case -16092:
        case -16087:
        case -16086:
        case -16085:
        case -16084:
        case -16083:
          return 0;
        case -16117:
          return 22;
        case -16116:
        case -16104:
        case -16098:
        case -16096:
          return 80;
        case -16107:
        case -16106:
        case -16082:
        case -16081:
          return 43;
        case -16101:
          return 29;
        case -16099:
          uint64_t result = 81;
          break;
        case -16095:
          return 62;
        case -16091:
        case -16090:
        case -16089:
        case -16088:
          return 71;
        default:
          if (a1 != -16075) {
            return 0;
          }
          uint64_t result = 67;
          break;
      }
      return result;
    }
    if (a1 > -16234)
    {
      if (a1 > -16197)
      {
        if (a1 > -16164)
        {
          if (a1 != -16163)
          {
            if (a1 == -16128) {
              return 41;
            }
            return 0;
          }
          return 22;
        }
        if (a1 != -16196)
        {
          if (a1 == -16165) {
            return 27;
          }
          return 0;
        }
        return 80;
      }
      if ((a1 + 16200) < 4) {
        return 29;
      }
      int v3 = -16233;
    }
    else
    {
      if (a1 > -16355)
      {
        switch(a1)
        {
          case -16354:
            goto LABEL_39;
          case -16353:
          case -16286:
            uint64_t result = 70;
            break;
          case -16352:
            return 28;
          case -16351:
            uint64_t result = 65;
            break;
          case -16343:
          case -16342:
            return 25;
          case -16316:
          case -16315:
            return 27;
          case -16314:
          case -16313:
          case -16312:
            return 22;
          case -16311:
            uint64_t result = 34;
            break;
          case -16310:
          case -16294:
            return 80;
          case -16309:
            uint64_t result = 75;
            break;
          case -16308:
          case -16307:
          case -16306:
          case -16305:
          case -16304:
            return 62;
          case -16303:
          case -16302:
          case -16301:
          case -16300:
            return 71;
          case -16299:
          case -16298:
          case -16297:
          case -16296:
            return 29;
          case -16290:
            return 43;
          default:
            return 0;
        }
        return result;
      }
      if (a1 == -18432) {
        return 39;
      }
      if (a1 == -18431) {
        return 40;
      }
      int v3 = -16368;
    }
LABEL_88:
    if (a1 == v3) {
      return 80;
    }
    return 0;
  }
  if (a1 > -15365)
  {
    if (a1 <= -12545)
    {
      if (a1 <= -15318)
      {
        switch(a1)
        {
          case -15359:
          case -15358:
          case -15356:
          case -15355:
          case -15354:
          case -15353:
          case -15352:
          case -15351:
LABEL_19:
            uint64_t result = 16;
            break;
          case -15357:
          case -15349:
          case -15347:
          case -15346:
          case -15345:
          case -15344:
          case -15343:
          case -15342:
          case -15341:
          case -15340:
          case -15339:
          case -15338:
          case -15337:
          case -15336:
          case -15335:
          case -15334:
            return 0;
          case -15350:
            uint64_t result = 52;
            break;
          case -15348:
            return 53;
          case -15333:
            return 51;
          default:
            int v7 = -15364;
LABEL_148:
            if (a1 != v7) {
              return 0;
            }
            uint64_t result = 17;
            break;
        }
        return result;
      }
      if (a1 > -15262)
      {
        if ((a1 + 15260) >= 2)
        {
          if (a1 == -15261) {
            return 18;
          }
          if (a1 == -15245) {
            return 72;
          }
          return 0;
        }
      }
      else
      {
        if (a1 <= -15300)
        {
          if (a1 == -15317) {
            return 33;
          }
          int v2 = -15306;
          goto LABEL_48;
        }
        if (a1 == -15299) {
          return 55;
        }
        if (a1 != -15296) {
          return 0;
        }
      }
      return 53;
    }
    if (a1 > -6123)
    {
      int v4 = a1 + 6122;
      uint64_t result = 6;
      switch(v4)
      {
        case 0:
          uint64_t result = 10;
          break;
        case 3:
        case 6:
LABEL_63:
          uint64_t result = 8;
          break;
        case 11:
          return result;
        case 12:
          uint64_t result = 9;
          break;
        case 13:
          uint64_t result = 7;
          break;
        default:
          return 0;
      }
      return result;
    }
    if (a1 > -7167)
    {
      switch(a1)
      {
        case -6143:
        case -6131:
          uint64_t result = 5;
          break;
        case -6142:
        case -6140:
        case -6139:
        case -6138:
        case -6137:
        case -6136:
        case -6135:
        case -6132:
        case -6130:
          return 0;
        case -6141:
        case -6133:
        case -6129:
          goto LABEL_63;
        case -6134:
          uint64_t result = 11;
          break;
        default:
          if (a1 != -7166 && a1 != -6655) {
            return 0;
          }
          uint64_t result = 2;
          break;
      }
      return result;
    }
    if (a1 > -10238)
    {
      if (a1 == -10237) {
        return 22;
      }
      int v3 = -7167;
      goto LABEL_88;
    }
    if (a1 == -12544) {
      return 25;
    }
    int v2 = -12543;
LABEL_48:
    if (a1 == v2) {
      return 51;
    }
    return 0;
  }
  if (a1 <= -15507)
  {
    if (a1 > -15588)
    {
      if (a1 > -15552)
      {
        if (a1 > -15541)
        {
          if (a1 == -15540) {
            return 60;
          }
          if (a1 == -15531) {
            return 37;
          }
          int v6 = -15509;
          goto LABEL_119;
        }
        if ((a1 + 15551) < 2) {
          return 43;
        }
        int v5 = -15541;
        goto LABEL_67;
      }
      switch(a1)
      {
        case -15587:
LABEL_39:
          uint64_t result = 21;
          break;
        case -15586:
        case -15584:
          return 28;
        case -15585:
          return 74;
        case -15578:
LABEL_69:
          uint64_t result = 83;
          break;
        case -15577:
          return 60;
        default:
          return 0;
      }
    }
    else
    {
      if (a1 <= -15674)
      {
        switch(a1)
        {
          case -15707:
          case -15705:
            return 22;
          case -15706:
          case -15704:
          case -15703:
          case -15702:
          case -15700:
          case -15699:
          case -15698:
          case -15697:
          case -15696:
          case -15694:
          case -15692:
          case -15691:
            return 0;
          case -15701:
            return 25;
          case -15695:
            return 37;
          case -15693:
            return 62;
          case -15690:
          case -15689:
          case -15688:
            return 80;
          default:
            if ((a1 + 15715) < 2) {
              return 18;
            }
            return 0;
        }
      }
      switch(a1)
      {
        case -15620:
LABEL_11:
          uint64_t result = 44;
          break;
        case -15619:
        case -15618:
        case -15617:
        case -15616:
        case -15612:
        case -15611:
        case -15610:
          return 0;
        case -15615:
        case -15614:
          goto LABEL_19;
        case -15613:
          return 37;
        case -15609:
        case -15608:
          return 43;
        default:
          int v7 = -15673;
          goto LABEL_148;
      }
    }
  }
  else
  {
    switch(a1)
    {
      case -15464:
        goto LABEL_19;
      case -15463:
      case -15444:
      case -15437:
      case -15436:
        goto LABEL_11;
      case -15462:
      case -15443:
      case -15442:
      case -15441:
        return 60;
      case -15461:
      case -15406:
      case -15405:
      case -15404:
      case -15403:
        return 71;
      case -15460:
      case -15440:
      case -15439:
      case -15438:
        goto LABEL_69;
      case -15459:
      case -15458:
      case -15457:
      case -15456:
      case -15455:
      case -15454:
      case -15453:
      case -15452:
      case -15451:
      case -15450:
      case -15449:
      case -15448:
      case -15447:
      case -15446:
      case -15445:
      case -15433:
      case -15432:
      case -15431:
      case -15426:
      case -15424:
      case -15423:
      case -15422:
      case -15418:
      case -15417:
      case -15416:
      case -15415:
      case -15414:
      case -15413:
      case -15412:
      case -15411:
      case -15410:
      case -15409:
      case -15408:
      case -15407:
        return 0;
      case -15435:
      case -15434:
      case -15425:
      case -15421:
      case -15420:
      case -15419:
        return 62;
      case -15430:
      case -15429:
      case -15428:
      case -15427:
        return 43;
      default:
        if (a1 == -15506) {
          goto LABEL_19;
        }
        if (a1 != -15496) {
          return 0;
        }
        uint64_t result = 61;
        break;
    }
  }
  return result;
}

uint64_t IsFuncEnumDestructor(int a1)
{
  uint64_t result = 1;
  if (a1 <= -15894)
  {
    if (a1 <= -16294)
    {
      if (a1 > -16371)
      {
        unsigned int v7 = a1 + 16370;
        if (v7 > 0x35) {
          return 0;
        }
        uint64_t v4 = 1 << v7;
        uint64_t v5 = 0x26000104000081;
        goto LABEL_29;
      }
      if (a1 == -20475 || a1 == -20458) {
        return result;
      }
      int v10 = -16383;
    }
    else
    {
      if (a1 > -16119)
      {
        if ((a1 + 15973) <= 0x32 && ((1 << (a1 + 101)) & 0x4004000010001) != 0) {
          return result;
        }
        unsigned int v9 = a1 + 16118;
        if (v9 > 0x38) {
          return 0;
        }
        uint64_t v4 = 1 << v9;
        uint64_t v5 = 0x100000000200001;
        goto LABEL_29;
      }
      if ((a1 + 16293) <= 0x37 && ((1 << (a1 - 91)) & 0x98000000002045) != 0) {
        return result;
      }
      int v10 = -16127;
    }
LABEL_43:
    if (a1 == v10) {
      return result;
    }
    return 0;
  }
  if (a1 > -15496)
  {
    if (a1 <= -15232)
    {
      if ((a1 + 15341) > 0x34 || ((1 << (a1 - 19)) & 0x10000000201601) == 0)
      {
        unsigned int v6 = a1 + 15495;
        if (v6 > 6 || ((1 << v6) & 0x43) == 0) {
          return 0;
        }
      }
      return result;
    }
    if (a1 <= -7162)
    {
      if (a1 == -15231) {
        return result;
      }
      int v10 = -10206;
    }
    else
    {
      if (a1 == -7161 || a1 == -6652) {
        return result;
      }
      int v10 = -6139;
    }
    goto LABEL_43;
  }
  if (a1 <= -15686)
  {
    if ((a1 + 15893) <= 0x1A && ((1 << (a1 + 21)) & 0x4004011) != 0) {
      return result;
    }
    unsigned int v3 = a1 + 15801;
    if (v3 <= 0x3B)
    {
      uint64_t v4 = 1 << v3;
      uint64_t v5 = 0x800000100000801;
      goto LABEL_29;
    }
    return 0;
  }
  if ((a1 + 15685) <= 0x29 && ((1 << (a1 + 69)) & 0x20004000401) != 0) {
    return result;
  }
  unsigned int v8 = a1 + 15610;
  if (v8 > 0x2A) {
    return 0;
  }
  uint64_t v4 = 1 << v8;
  uint64_t v5 = 0x40000000021;
LABEL_29:
  if ((v4 & v5) == 0) {
    return 0;
  }
  return result;
}

uint64_t IsFuncEnumDrawCall(int a1)
{
  uint64_t result = 1;
  if ((a1 + 16251) > 0x24 || ((1 << (a1 + 123)) & 0x1E0000000FLL) == 0)
  {
    unsigned int v3 = a1 + 16147;
    BOOL v4 = (a1 + 15416) < 3;
    return v3 < 4 || v4;
  }
  return result;
}

uint64_t IsFuncEnumIOCall(int a1)
{
  return ((a1 + 15345) < 0x39) & (0x17C40BE00017E7FuLL >> (a1 - 15));
}

BOOL IsFuncEnumComputeCall(int a1)
{
  return (a1 + 16079) < 2 || a1 == -16327 || a1 == -16220;
}

uint64_t IsFuncEnumTileCall(int a1)
{
  BOOL v1 = a1 == -15486 || a1 == -15297;
  return a1 == -16137 || v1;
}

BOOL IsFuncEnumMeshCall(int a1)
{
  return (a1 + 15416) < 3;
}

uint64_t IsFuncEnumBlitCall(int a1)
{
  uint64_t result = 1;
  if (a1 <= -15879)
  {
    if (((a1 + 15995) > 0x25 || ((1 << (a1 + 123)) & 0x38000C000FLL) == 0)
      && (a1 + 16382) >= 6
      && (a1 + 16213) >= 5)
    {
      return 0;
    }
  }
  else if ((a1 + 15474) >= 6 && (a1 + 15878) >= 2 && (a1 + 15756) >= 2)
  {
    return 0;
  }
  return result;
}

BOOL IsFuncEnumVideoCall(int a1)
{
  return a1 == -15887;
}

BOOL IsFuncEnumSampleCall(int a1)
{
  return (a1 + 15756) <= 6 && ((1 << (a1 - 116)) & 0x47) != 0 || a1 == -15637;
}

BOOL IsFuncEnumSampledBlitCall(int a1)
{
  return (a1 + 16382) < 6 || (a1 + 16210) < 2 || (a1 + 15878) < 2;
}

BOOL IsFuncEnumSampledBlitCallAGX(int a1)
{
  BOOL result = 1;
  if (((a1 + 15995) > 0x25 || ((1 << (a1 + 123)) & 0x38000C000FLL) == 0)
    && ((a1 + 15802) > 4 || ((1 << (a1 - 70)) & 0x15) == 0))
  {
    return (a1 + 15470) < 2;
  }
  return result;
}

BOOL IsFuncEnumGPUCommandCall(int a1)
{
  if (IsFuncEnumDrawCall(a1)) {
    return 1;
  }
  BOOL result = 1;
  if ((a1 + 16079) >= 2 && a1 != -16327 && a1 != -16220)
  {
    if (IsFuncEnumSampledBlitCall(a1) || IsFuncEnumSampledBlitCallAGX(a1)) {
      return 1;
    }
    BOOL result = 1;
    if (a1 != -16137 && a1 != -15486 && a1 != -15297) {
      return (a1 + 15416) < 3;
    }
  }
  return result;
}

uint64_t IsFuncEnumPushDebugGroup(int a1)
{
  uint64_t result = 1;
  if (a1 <= -16066)
  {
    if (a1 > -16284)
    {
      if (a1 == -16283) {
        return result;
      }
      int v3 = -16244;
    }
    else
    {
      if (a1 == -16374) {
        return result;
      }
      int v3 = -16323;
    }
    goto LABEL_13;
  }
  if (a1 <= -15787)
  {
    if (a1 == -16065) {
      return result;
    }
    int v3 = -15882;
    goto LABEL_13;
  }
  if (a1 != -15786 && a1 != -15639)
  {
    int v3 = -15292;
LABEL_13:
    if (a1 != v3) {
      return 0;
    }
  }
  return result;
}

uint64_t IsFuncEnumPopDebugGroup(int a1)
{
  uint64_t result = 1;
  if (a1 <= -16065)
  {
    if (a1 > -16283)
    {
      if (a1 == -16282) {
        return result;
      }
      int v3 = -16243;
    }
    else
    {
      if (a1 == -16373) {
        return result;
      }
      int v3 = -16322;
    }
    goto LABEL_13;
  }
  if (a1 <= -15788)
  {
    if (a1 == -16064) {
      return result;
    }
    int v3 = -15881;
    goto LABEL_13;
  }
  if (a1 != -15787 && a1 != -15640)
  {
    int v3 = -15293;
LABEL_13:
    if (a1 != v3) {
      return 0;
    }
  }
  return result;
}

uint64_t IsFuncEnumSetLabel(int a1)
{
  uint64_t result = 1;
  if (a1 <= -15926)
  {
    if (a1 <= -16293)
    {
      unsigned int v4 = a1 + 0x4000;
      if (v4 > 0x2D || ((1 << v4) & 0x200800081001) == 0) {
        return 0;
      }
      return result;
    }
    if (a1 > -16124)
    {
      if ((a1 + 16123) <= 0x3C && ((1 << (a1 - 5)) & 0x1000000000000011) != 0) {
        return result;
      }
      int v3 = -15974;
    }
    else
    {
      if ((a1 + 16292) <= 0x34 && ((1 << (a1 - 92)) & 0x10000000000811) != 0) {
        return result;
      }
      int v3 = -16136;
    }
    goto LABEL_30;
  }
  if (a1 <= -15608)
  {
    if (a1 <= -15677)
    {
      if ((a1 + 15925) <= 0x2D && ((1 << (a1 + 53)) & 0x200800000001) != 0
        || a1 == -15794)
      {
        return result;
      }
      int v3 = -15743;
      goto LABEL_30;
    }
    unsigned int v5 = a1 + 15676;
    if (v5 <= 0x1C)
    {
      int v6 = 1 << v5;
      int v7 = 268468481;
      goto LABEL_26;
    }
    return 0;
  }
  if (a1 > -15314)
  {
    unsigned int v8 = a1 + 15313;
    if (v8 <= 0x17)
    {
      int v6 = 1 << v8;
      int v7 = 8388673;
LABEL_26:
      if ((v6 & v7) == 0) {
        return 0;
      }
      return result;
    }
    return 0;
  }
  if (a1 == -15607 || a1 == -15570) {
    return result;
  }
  int v3 = -15491;
LABEL_30:
  if (a1 != v3) {
    return 0;
  }
  return result;
}

uint64_t IsFuncEnumEndEncoding(int a1)
{
  uint64_t result = 1;
  if (a1 > -16247)
  {
    if (a1 > -15790)
    {
      if (a1 == -15789) {
        return result;
      }
      int v3 = -15642;
    }
    else
    {
      if (a1 == -16246) {
        return result;
      }
      int v3 = -15884;
    }
    goto LABEL_10;
  }
  if (a1 != -16376 && a1 != -16325)
  {
    int v3 = -16285;
LABEL_10:
    if (a1 != v3) {
      return 0;
    }
  }
  return result;
}

BOOL IsFuncEnumIndirectExecuteCall(unsigned int a1)
{
  return a1 >> 2 == 1073737833;
}

BOOL IsFuncEnumPresent(int a1)
{
  return (a1 + 7158) < 3 || (a1 + 16359) < 2 || a1 == -16133;
}

uint64_t IsFuncEnumMPSEncodeCall(int a1)
{
  return ((a1 + 6144) < 0x30) & (0x8BF1EC9D5395uLL >> a1);
}

BOOL IsFuncEnumResourceCall(int a1)
{
  return (a1 + 15784) < 3 || a1 == -15271;
}

BOOL IsFuncEnumAccelerationEncodeCall(int a1)
{
  return (a1 + 15647) <= 0x13 && ((1 << (a1 + 31)) & 0xC0207) != 0 || (a1 + 15366) < 2;
}

BOOL IsCommandEncoder(int a1)
{
  BOOL result = 1;
  if ((a1 - 21) > 0x3D || ((1 << (a1 - 21)) & 0x2022100000000081) == 0) {
    return a1 == 17;
  }
  return result;
}

uint64_t IsFuncEnumUseResourceCall(int a1)
{
  uint64_t result = 1;
  if (a1 <= -15822)
  {
    if ((a1 + 16047) < 8) {
      return result;
    }
    return 0;
  }
  if (a1 <= -15635)
  {
    if ((a1 + 15821) < 4) {
      return result;
    }
    return 0;
  }
  if ((a1 + 15634) >= 4 && a1 != -15510 && a1 != -15507) {
    return 0;
  }
  return result;
}

uint64_t IsFuncEnumUseResidencySetCall(int a1)
{
  return ((a1 + 15254) < 0xC) & (0xCCFu >> (a1 - 106));
}

const char *GetReceiverTypeString(int a1)
{
  if ((a1 - 1) > 0x55) {
    return "Unknown";
  }
  else {
    return off_222318[a1 - 1];
  }
}

const char *GetFuncEnumAsString(int a1)
{
  if (a1 > -12545)
  {
    if (a1 > -7169)
    {
      switch(a1)
      {
        case -6144:
          uint64_t result = "kDYFEMPSExternalMatrixMultiplication_encodeToCommandBuffer_encoder_options_batchSize_resultRows_resul"
                   "tColumns_interiorColumns_alpha_beta_A_aInfo_B_bInfo_C_cInfo_predicationBuffer_predicationOffset";
          break;
        case -6143:
          uint64_t result = "kDYFEMPSPlugin_newCNNConvolutionWithDescriptor_convolutionData";
          break;
        case -6142:
          uint64_t result = "kDYFEMPSExternalCNNPoolingAverage_encodeBatchToCommandBuffer_computeCommandEncoder_options_sourceText"
                   "ures_sourceInfo_destinationTextures_destinationInfo_zeroPadSizeX_zeroPadSizeY_predicationBuffer_predicationOffset";
          break;
        case -6141:
          uint64_t result = "kDYFEMPSPlugin_newCNNPoolingMaxWithKernelWidth_kernelHeight_strideInPixelsX_strideInPixelsY";
          break;
        case -6140:
          uint64_t result = "kDYFEMPSExternalMatrixVectorMultiplication_encodeToCommandBuffer_encoder_options_batchSize_matrix_mat"
                   "rixStructure_vector_vectorStructure_result_resultStructure_predicationBuffer_predicationOffset";
          break;
        case -6139:
          uint64_t result = "kDYFEMPSExternalPluginBase_dealloc";
          break;
        case -6138:
          uint64_t result = "kDYFEMPSExternalCNNUnary_maxBatchSize";
          break;
        case -6137:
          uint64_t result = "kDYFEMPSExternalMatrixVectorMultiplication_encodeToCommandBuffer_encoder_options_batchSize_matrix_mat"
                   "rixStructure_vector_vectorStructure_result_resultStructure";
          break;
        case -6136:
          uint64_t result = "kDYFEMPSExternalCNNConvolution_reloadWeightsAndBiasesWithCommandBuffer_encoder_weights_biases_predica"
                   "tionBuffer_predicationOffset";
          break;
        case -6135:
          uint64_t result = "kDYFEMPSExternalCNNUnary_encodeToCommandBuffer_computeCommandEncoder_options_sourceTexture_sourceInfo"
                   "_destinationTexture_destinationInfo";
          break;
        case -6134:
          uint64_t result = "kDYFEMPSPlugin_newMatrixVectorMultiplicationWithTranspose_rows_columns_alpha_beta";
          break;
        case -6133:
          uint64_t result = "kDYFEMPSPlugin_newCNNNeuronWithNeuronType_neuronParameterA_neuronParameterB_neuronParameterC";
          break;
        case -6132:
          uint64_t result = "kDYFEMPSExternalMatrixMultiplication_encodeToCommandBuffer_encoder_options_batchSize_resultRows_resul"
                   "tColumns_interiorColumns_alpha_beta_A_aInfo_B_bInfo_C_cInfo";
          break;
        case -6131:
          uint64_t result = "kDYFEMPSPlugin_newCNNConvolutionWithDescriptor_dataSource_fullyConnected";
          break;
        case -6130:
          uint64_t result = "kDYFEMPSExternalMatrixMultiplication_encodeToCommandBuffer_encoder_options_batchSize_A_aInfo_B_bInfo_C_cInfo";
          break;
        case -6129:
          uint64_t result = "kDYFEMPSPlugin_newCNNNeuronWithNeuronType_neuronParameterAArray_count";
          break;
        case -6128:
          uint64_t result = "kDYFEMPSExternalMatrixFullyConnected_encodeToCommandBuffer_encoder_options_batchSize_inputMatrix_inpu"
                   "tMatrixInfo_weightMatrix_weightMatrixInfo_biasVector_biasVectorInfo_resultMatrix_resultMatrixInfo_alp"
                   "ha_numberOfFeatureVectors_inputFeatureChannels_outputFeatureChannels_neuronType_neuronParameterA_neur"
                   "onParameterB_neuronParameterC";
          break;
        case -6127:
          uint64_t result = "kDYFEMPSExternalCNNConvolutionGradient_reloadWeights";
          break;
        case -6126:
          uint64_t result = "kDYFEMPSExternalCNNPoolingAverage_encodeToCommandBuffer_computeCommandEncoder_options_sourceTexture_s"
                   "ourceInfo_destinationTexture_destinationInfo";
          break;
        case -6125:
          uint64_t result = "kDYFEMPSExternalCNNBinary_encodeToCommandBuffer_computeCommandEncoder_options_pluginOptions_primaryTe"
                   "xture_primaryInfo_secondaryTexture_secondaryInfo_destinationTexture_destinationInfo";
          break;
        case -6124:
          uint64_t result = "kDYFEMPSExternalMatrixFullyConnected_encodeToCommandBuffer_encoder_options_batchSize_inputMatrix_inpu"
                   "tMatrixInfo_weightMatrix_weightMatrixInfo_biasVector_biasVectorInfo_resultMatrix_resultMatrixInfo_alp"
                   "ha_numberOfFeatureVectors_inputFeatureChannels_outputFeatureChannels_neuronType_neuronParameterA_neur"
                   "onParameterB_neuronParameterC_predicationBuffer_predicationOffset";
          break;
        case -6123:
          uint64_t result = "kDYFEMPSExternalCNNBinary_maxBatchSize";
          break;
        case -6122:
          uint64_t result = "kDYFEMPSPlugin_newMatrixMultiplicationWithTransposeLeft_transposeRight_resultRows_resultColumns_inter"
                   "iorColumns_alpha_beta";
          break;
        case -6121:
          uint64_t result = "kDYFEMPSExternalCNNPoolingAverage_encodeToCommandBuffer_computeCommandEncoder_options_sourceTexture_s"
                   "ourceInfo_destinationTexture_destinationInfo_zeroPadSizeX_zeroPadSizeY";
          break;
        case -6120:
          uint64_t result = "kDYFEMPSExternalCNNConvolution_reloadWeightsAndBiases";
          break;
        case -6119:
          uint64_t result = "kDYFEMPSPlugin_newCNNSoftMax";
          break;
        case -6118:
          uint64_t result = "kDYFEMPSExternalCNNBinary_encodeBatchToCommandBuffer_computeCommandEncoder_options_pluginOptions_prim"
                   "aryTextures_primaryInfo_secondaryTextures_secondaryInfo_destinationTextures_destinationInfo_predicati"
                   "onBuffer_predicationOffset";
          break;
        case -6117:
          uint64_t result = "kDYFEMPSExternalCNNUnary_encodeToCommandBuffer_computeCommandEncoder_options_pluginOptions_sourceText"
                   "ure_sourceInfo_destinationTexture_destinationInfo";
          break;
        case -6116:
          uint64_t result = "kDYFEMPSPlugin_newCNNDilatedPoolingMaxWithKernelWidth_kernelHeight_strideInPixelsX_strideInPixelsY_di"
                   "lationRateX_dilationRateY";
          break;
        case -6115:
          uint64_t result = "kDYFEMPSExternalCNNUnary_encodeBatchToCommandBuffer_computeCommandEncoder_options_pluginOptions_sourc"
                   "eTextures_sourceInfo_destinationTextures_destinationInfo_predicationBuffer_predicationOffset";
          break;
        case -6114:
          uint64_t result = "kDYFEMPSExternalCNNConvolutionGradient_encodeBatchToCommandBuffer_computeCommandEncoder_options_plugi"
                   "nOptions_primaryTextures_primaryInfo_secondaryTextures_secondaryInfo_weightsGradient_biasesGradient_a"
                   "ccumulate_predicationBuffer_predicationOffset";
          break;
        case -6113:
          uint64_t result = "kDYFEMPSExternalCNNConvolutionGradient_reloadWeightsWithCommandBuffer_encoder_weights_predicationBuff"
                   "er_predicationOffset";
          break;
        case -6112:
          uint64_t result = "kDYFEMPSExternalCNNConvolution_exportWeightsAndBiasesWithCommandBuffer_encoder_weights_biases_predica"
                   "tionBuffer_predicationOffset";
          break;
        case -6111:
          uint64_t result = "kDYFEMPSPlugin_newCNNConvolutionGradientWithDescriptor_convolutionData";
          break;
        case -6110:
          uint64_t result = "kDYFEMPSPlugin_newMatrixFullyConnected";
          break;
        case -6109:
          uint64_t result = "kDYFEMPSPlugin_newCNNPoolingAverageWithKernelWidth_kernelHeight_strideInPixelsX_strideInPixelsY";
          break;
        case -6108:
          uint64_t result = "kDYFEMPSExternalCNNConvolution_reloadWeightsAndBiasesWithCommandBuffer_encoder_weights_weightsDataTyp"
                   "e_biases_predicationBuffer_predicationOffset";
          break;
        case -6107:
          uint64_t result = "kDYFEMPSExternalCNNConvolutionGradient_reloadWeightsWithCommandBuffer_encoder_weights_weightsDataType"
                   "_predicationBuffer_predicationOffset";
          break;
        case -6106:
          uint64_t result = "kDYFEMPSExternalCNNConvolution_exportWeightsAndBiasesWithCommandBuffer_encoder_weights_weightsDataTyp"
                   "e_biases_predicationBuffer_predicationOffset";
          break;
        case -6105:
          uint64_t result = "kDYFEMPSExternalMatrixMultiplication_encodeToCommandBuffer_encoder_options_batchSize_resultRowsAndRes"
                   "ultColumnsAndInteriorColumns_alphaAndBeta_A_aInfo_B_bInfo_C_cInfo_predicationBuffer_predicationOffset";
          break;
        case -6104:
          uint64_t result = "kDYFEMPSExternalMatrixFullyConnected_encodeToCommandBuffer_encoder_optionsAndBatchSize_inputMatrix_in"
                   "putMatrixInfo_weightMatrix_weightMatrixInfo_biasVector_biasVectorInfo_resultMatrix_resultMatrixInfo_a"
                   "lpha_numberOfFeatureVectorsAndInputFeatureChannelsAndOutputFeatureChannels_neuronType_neuronParameters";
          break;
        case -6103:
          uint64_t result = "kDYFEMPSExternalMatrixFullyConnected_encodeToCommandBuffer_encoder_optionsAndBatchSize_inputMatrix_in"
                   "putMatrixInfo_weightMatrix_weightMatrixInfo_biasVector_biasVectorInfo_resultMatrix_resultMatrixInfo_a"
                   "lpha_numberOfFeatureVectorsAndInputFeatureChannelsAndOutputFeatureChannelsAndNeuronTypeAndPredication"
                   "Offset_neuronParameters_predicationBuffer";
          break;
        case -6102:
          uint64_t result = "kDYFEMPSExternalNDArrayConvolution2DGradient_encodePrimaryGradientToCommandBuffer_encoder_options_plu"
                   "ginOptions_primary_primaryInfo_secondary_secondaryInfo_gradient_gradientInfo_destination_destinationI"
                   "nfo_accumulate_predicationBuffer_predicationOffset";
          break;
        case -6101:
          uint64_t result = "kDYFEMPSExternalMatrixMultiplication_encodeToCommandBuffer_encoder_options_batchSize_resultRows_resul"
                   "tColumns_interiorColumns_alpha_beta_A_aInfo_B_bInfo_C_cInfo_predicationBuffer_predicationOffset_transA_transB";
          break;
        case -6100:
          uint64_t result = "kDYFEMPSExternalNDArrayConvolution2DGradient_encodeSecondaryGradientToCommandBuffer_encoder_options_p"
                   "luginOptions_primary_primaryInfo_secondary_secondaryInfo_gradient_gradientInfo_destination_destinatio"
                   "nInfo_accumulate_predicationBuffer_predicationOffset";
          break;
        case -6099:
          uint64_t result = "kDYFEMPSExternalNDArrayBinaryGradient_encodePrimaryGradientToCommandBuffer_encoder_options_pluginOpti"
                   "ons_primaryBuffer_primaryInfo_secondaryBuffer_secondaryInfo_gradientBuffer_gradientInfo_destination_d"
                   "estinationInfo_accumulate_predicationBuffer_predicationOffset";
          break;
        case -6098:
          uint64_t result = "kDYFEMPSExternalNDArrayBinaryGradient_encodeSecondaryGradientToCommandBuffer_encoder_options_pluginOp"
                   "tions_primaryBuffer_primaryInfo_secondaryBuffer_secondaryInfo_gradientBuffer_gradientInfo_destination"
                   "_destinationInfo_accumulate_predicationBuffer_predicationOffset";
          break;
        case -6097:
          uint64_t result = "kDYFEMPSExternalNDArrayBinary_encodeToCommandBuffer_encoder_options_pluginOptions_primaryBuffer_prima"
                   "ryInfo_secondaryBuffer_secondaryInfo_destinationBuffer_destinationInfo_predicationBuffer_predicationOffset";
          break;
        case -6096:
          uint64_t result = "kDYFEMPSPlugin_newNDArrayConvolution2DGradientWithDescriptor";
          break;
        case -6095:
          uint64_t result = "kDYFEMPSPlugin_newNDArrayConvolution2DWithDescriptor";
          break;
        default:
          switch(a1)
          {
            case -7168:
              uint64_t result = "kDYFECAMetalLayer_setPresentsWithTransaction";
              break;
            case -7167:
              uint64_t result = "kDYFECAMetalDrawable_texture";
              break;
            case -7166:
              uint64_t result = "kDYFECAMetalLayer_nextDrawable";
              break;
            case -7165:
              uint64_t result = "kDYFECAMetalLayer_setPixelFormat";
              break;
            case -7164:
              uint64_t result = "kDYFECAMetalLayer_setDrawableSize";
              break;
            case -7163:
              uint64_t result = "kDYFECAMetalLayer_setDevice";
              break;
            case -7162:
              uint64_t result = "kDYFECAMetalLayer_setBounds_contentsScale";
              break;
            case -7161:
              uint64_t result = "kDYFECAMetalDrawable_dealloc";
              break;
            case -7160:
              uint64_t result = "kDYFECAMetalLayer_setFramebufferOnly";
              break;
            case -7159:
              uint64_t result = "kDYFECAMetalLayer_setBounds_contentsScale_windowBounds_windowProperties";
              break;
            case -7158:
              uint64_t result = "kDYFECAMetalDrawable_present";
              break;
            case -7157:
              uint64_t result = "kDYFECAMetalDrawable_presentAtTime";
              break;
            case -7156:
              uint64_t result = "kDYFECAMetalDrawable_presentAfterMinimumDuration";
              break;
            case -7155:
              uint64_t result = "kDYFEUIScreen_setInterfaceOrientation";
              break;
            case -7154:
              uint64_t result = "kDYFECAMetalLayer_setWantsExtendedDynamicRangeContent";
              break;
            case -7153:
              uint64_t result = "kDYFECAMetalLayer_setColorspace";
              break;
            default:
              switch(a1)
              {
                case -6656:
                  uint64_t result = "kDYFENSHMDMetalSession_setDrawablePixelFormat";
                  break;
                case -6655:
                  uint64_t result = "kDYFENSHMDMetalSession_nextDrawable";
                  break;
                case -6654:
                  uint64_t result = "kDYFENSHMDMetalSession_initWithMetalDevice_deviceReference_hmdName";
                  break;
                case -6653:
                  uint64_t result = "kDYFENSHMDMetalSession_setDrawableSize";
                  break;
                case -6652:
                  uint64_t result = "kDYFENSHMDMetalSession_dealloc";
                  break;
                default:
LABEL_1384:
                  uint64_t result = 0;
                  break;
              }
              break;
          }
          break;
      }
    }
    else
    {
      switch(a1)
      {
        case -10240:
          uint64_t result = "kDYFEMTLCommandBuffer_restoreMTLBufferContents";
          break;
        case -10239:
          uint64_t result = "kDYFEMTLDevice_deviceReference";
          break;
        case -10238:
          uint64_t result = "kDYFEMTLTexture_harvested_replaceRegion_mipmapLevel_slice_withBytes_bytesPerRow_bytesPerImage";
          break;
        case -10237:
          uint64_t result = "kDYFEMTLDevice_harvested_newBufferWithBytes_length_options";
          break;
        case -10236:
          uint64_t result = "kDYFEMTLTexture_harvested_replaceRegion_mipmapLevel_slice_withBytes_bytesPerRow_bytesPerImage_totalBytes";
          break;
        case -10235:
          uint64_t result = "kDYFEMTLBuffer_resourceUsage";
          break;
        case -10234:
          uint64_t result = "kDYFEMTLTexture_resourceUsage";
          break;
        case -10233:
          uint64_t result = "kDYFEMTLDevice_setSelectedCommandQueueAddress";
          break;
        case -10232:
          uint64_t result = "kDYFEMTLTexture_restoreIOSurfaceData_length_forPlane";
          break;
        case -10231:
          uint64_t result = "kDYFEMTLTexture_mipmapInfo";
          break;
        case -10230:
          uint64_t result = "kDYFEMTLDevice_setCapturingCommandQueueAddress";
          break;
        case -10229:
          uint64_t result = "kDYFEMTLCommandBuffer_indirectArgumentBufferData";
          break;
        case -10228:
          uint64_t result = "kDYFEMTLBuffer_gpuVirtualAddress";
          break;
        case -10227:
          uint64_t result = "kDYFEMTLTexture_uniqueIdentifier";
          break;
        case -10226:
          uint64_t result = "kDYFEMTLSamplerState_uniqueIdentifier";
          break;
        case -10225:
          uint64_t result = "kDYFEMTLCommandBuffer_encodeIndirectArgumentsForBuffer_data";
          break;
        case -10224:
          uint64_t result = "kDYFEFrameEnd";
          break;
        case -10223:
          uint64_t result = "kDYFEMTLBuffer_allocatedSize";
          break;
        case -10222:
          uint64_t result = "kDYFEMTLTexture_allocatedSize";
          break;
        case -10221:
          uint64_t result = "kDYFEMTLBuffer_indirectCommandBufferData";
          break;
        case -10220:
          uint64_t result = "kDYFEMTLRenderPipelineState_uniqueIdentifier";
          break;
        case -10219:
          uint64_t result = "kDYFEMTLIndirectCommandBuffer_restoreData";
          break;
        case -10218:
          uint64_t result = "kDYFEMTLIndirectCommandBuffer_uniqueIdentifier";
          break;
        case -10217:
          uint64_t result = "kDYFEMTLIndirectCommandBuffer_indirectCommandNop";
          break;
        case -10216:
          uint64_t result = "kDYFEMTLIndirectCommandBuffer_restoreOptimizedRanges";
          break;
        case -10215:
          uint64_t result = "kDYFEMTLIndirectCommandBuffer_allocatedSize";
          break;
        case -10214:
          uint64_t result = "kDYFEMTLComputePipelineState_uniqueIdentifier";
          break;
        case -10213:
          uint64_t result = "kDYFEMTLResourceStateCommandEncoder_harvested_updateTextureMapping_mode_region_mipLevel_slice";
          break;
        case -10212:
          uint64_t result = "kDYFEMTLTexture_timeSinceTouched";
          break;
        case -10211:
          uint64_t result = "kDYFEMTLHeap_timeSinceTouched";
          break;
        case -10210:
          uint64_t result = "kDYFEMTLBuffer_timeSinceTouched";
          break;
        case -10209:
          uint64_t result = "kDYFEMTLIndirectCommandBuffer_timeSinceTouched";
          break;
        case -10208:
          uint64_t result = "kDYFEMTLHeap_usedSize";
          break;
        case -10207:
          uint64_t result = "kDYFEMTLHeap_currentAllocatedSize";
          break;
        case -10206:
          uint64_t result = "kDYFEMTLSharedEventHandle_dealloc";
          break;
        case -10205:
          uint64_t result = "kDYFEMTLTexture_compressionFeedback";
          break;
        case -10204:
          uint64_t result = "kDYFEMTLTexture_allocationID";
          break;
        case -10203:
          uint64_t result = "kDYFEMTLBuffer_allocationID";
          break;
        case -10202:
          uint64_t result = "kDYFEMTLIndirectCommandBuffer_allocationID";
          break;
        case -10201:
          uint64_t result = "kDYFEMTLTexture_saveSlice_level_zPlane_normalize_blitOption_toPath";
          break;
        case -10200:
          uint64_t result = "kDYFEMTLBuffer_saveContentsToPath";
          break;
        case -10199:
          uint64_t result = "kDYFEMTLRenderPipelineState_resourceIndex";
          break;
        case -10198:
          uint64_t result = "kDYFEMTLTexture_resourceIndex";
          break;
        case -10197:
          uint64_t result = "kDYFEMTLAccelerationStructure_allocationID";
          break;
        case -10196:
          uint64_t result = "kDYFEMTLAccelerationStructure_allocatedSize";
          break;
        case -10195:
          uint64_t result = "kDYFEMTLAccelerationStructure_resourceUsage";
          break;
        case -10194:
          uint64_t result = "kDYFEMTLAccelerationStructure_restoreMTLAccelerationStructure";
          break;
        case -10193:
          uint64_t result = "kDYFEMTLVisibleFunctionTable_uniqueIdentifier";
          break;
        case -10192:
          uint64_t result = "kDYFEMTLRenderPipelineState_allocatedSize";
          break;
        case -10191:
          uint64_t result = "kDYFEMTLComputePipelineState_allocatedSize";
          break;
        case -10190:
          uint64_t result = "kDYFEMTLAccelerationStructure_restoreMTLAccelerationStructure_instance";
          break;
        case -10189:
          uint64_t result = "kDYFEMTLDynamicLibrary_installName";
          break;
        case -10188:
          uint64_t result = "kDYFEMTLLibrary_libraryIdentifier";
          break;
        case -10187:
          uint64_t result = "kDYFEMTLBuffer_heapOffset";
          break;
        case -10186:
          uint64_t result = "kDYFEMTLBuffer_parentGPUAddress_parentGPUSize";
          break;
        case -10185:
          uint64_t result = "kDYFEMTLTexture_heapOffset";
          break;
        case -10184:
          uint64_t result = "kDYFEMTLRenderPipelineState_imageblockSampleLength";
          break;
        case -10183:
          uint64_t result = "kDYFEMTLLibrary_type";
          break;
        case -10182:
          uint64_t result = "kDYFEMTLAccelerationStructure_allocationInfo";
          break;
        case -10181:
          uint64_t result = "kDYFEMTLAccelerationStructure_uniqueIdentifier";
          break;
        case -10180:
          uint64_t result = "kDYFEMTLIntersectionFunctionTable_timeSinceTouched";
          break;
        case -10179:
          uint64_t result = "kDYFEMTLIntersectionFunctionTable_allocatedSize";
          break;
        case -10178:
          uint64_t result = "kDYFEMTLVisibleFunctionTable_timeSinceTouched";
          break;
        case -10177:
          uint64_t result = "kDYFEMTLVisibleFunctionTable_allocationID";
          break;
        case -10176:
          uint64_t result = "kDYFEMTLIntersectionFunctionTable_allocationID";
          break;
        case -10175:
          uint64_t result = "kDYFEMTLIntersectionFunctionTable_uniqueIdentifier";
          break;
        case -10174:
          uint64_t result = "kDYFEMTLVisibleFunctionTable_allocatedSize";
          break;
        case -10173:
          uint64_t result = "kDYFEMTLAccelerationStructure_timeSinceTouched";
          break;
        case -10172:
          uint64_t result = "kDYFEMTLRenderPipelineState_timeSinceTouched";
          break;
        case -10171:
          uint64_t result = "kDYFEMTLComputePipelineState_timeSinceTouched";
          break;
        case -10170:
          uint64_t result = "kDYFEMTLAccelerationStructure_resourceIndex";
          break;
        case -10169:
          uint64_t result = "kDYFEMTLAccelerationStructure_heapOffset";
          break;
        case -10168:
          uint64_t result = "kDYFEBoundary_Frame";
          break;
        case -10167:
          uint64_t result = "kDYFEMTLAccelerationStructure_gpuResourceID";
          break;
        case -10166:
          uint64_t result = "kDYFEMTLIndirectCommandBuffer_gpuResourceID";
          break;
        case -10165:
          uint64_t result = "kDYFEMTLRenderPipelineState_gpuResourceID";
          break;
        case -10164:
          uint64_t result = "kDYFEMTLTexture_gpuResourceID";
          break;
        case -10163:
          uint64_t result = "kDYFEMTLSamplerState_gpuResourceID";
          break;
        case -10162:
          uint64_t result = "kDYFEMTLComputePipelineState_gpuResourceID";
          break;
        case -10161:
          uint64_t result = "kDYFEMTLIntersectionFunctionTable_gpuResourceID";
          break;
        case -10160:
          uint64_t result = "kDYFEMTLVisibleFunctionTable_gpuResourceID";
          break;
        case -10159:
          uint64_t result = "kDYFEMTLAccelerationStructure_state";
          break;
        case -10158:
          uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_setAccelerationStructureState";
          break;
        case -10157:
          uint64_t result = "kDYFEMTLFunction_setDescriptor_library";
          break;
        case -10156:
          uint64_t result = "kDYFEMTLAccelerationStructure_children";
          break;
        case -10155:
          uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_setAccelerationStructureChildren";
          break;
        case -10154:
          uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_setAccelerationStructureDescriptor";
          break;
        case -10153:
          uint64_t result = "kDYFEMTLVisibleFunctionTable_gpuAddress";
          break;
        case -10152:
          uint64_t result = "kDYFEMTLIntersectionFunctionTable_setBuffers";
          break;
        case -10151:
          uint64_t result = "kDYFEMTLCaptureManager_sharedCaptureManager";
          break;
        default:
          if (a1 == -12544)
          {
            uint64_t result = "kDYFEMTLCommandQueue_continueCommandBuffer_retainReferences";
          }
          else
          {
            if (a1 != -12543) {
              goto LABEL_1384;
            }
            uint64_t result = "kDYFEMTLIOCommandQueue_continueCommandBuffer_retainReferences";
          }
          break;
      }
    }
  }
  else if (a1 <= -18431)
  {
    switch(a1)
    {
      case -20480:
        uint64_t result = "kDYFEMTLFXSpatialScaler_setColorTexture";
        break;
      case -20479:
        uint64_t result = "kDYFEMTLFXSpatialScaler_setFence";
        break;
      case -20478:
        uint64_t result = "kDYFEMTLFXSpatialScaler_setInputContentHeight";
        break;
      case -20477:
        uint64_t result = "kDYFEMTLFXSpatialScaler_setInputContentWidth";
        break;
      case -20476:
        uint64_t result = "kDYFEMTLFXSpatialScaler_setOutputTexture";
        break;
      case -20475:
        uint64_t result = "kDYFEMTLFXSpatialScaler_dealloc";
        break;
      case -20474:
        uint64_t result = "kDYFEMTLFXSpatialScaler_encodeToCommandBuffer";
        break;
      case -20473:
        uint64_t result = "kDYFEMTLFXTemporalScaler_setColorTexture";
        break;
      case -20472:
        uint64_t result = "kDYFEMTLFXTemporalScaler_setDepthReversed";
        break;
      case -20471:
        uint64_t result = "kDYFEMTLFXTemporalScaler_setDepthTexture";
        break;
      case -20470:
        uint64_t result = "kDYFEMTLFXTemporalScaler_setExposureTexture";
        break;
      case -20469:
        uint64_t result = "kDYFEMTLFXTemporalScaler_setFence";
        break;
      case -20468:
        uint64_t result = "kDYFEMTLFXTemporalScaler_setInputContentHeight";
        break;
      case -20467:
        uint64_t result = "kDYFEMTLFXTemporalScaler_setInputContentWidth";
        break;
      case -20466:
        uint64_t result = "kDYFEMTLFXTemporalScaler_setJitterOffsetX";
        break;
      case -20465:
        uint64_t result = "kDYFEMTLFXTemporalScaler_setJitterOffsetY";
        break;
      case -20464:
        uint64_t result = "kDYFEMTLFXTemporalScaler_setMotionTexture";
        break;
      case -20463:
        uint64_t result = "kDYFEMTLFXTemporalScaler_setMotionVectorScaleX";
        break;
      case -20462:
        uint64_t result = "kDYFEMTLFXTemporalScaler_setMotionVectorScaleY";
        break;
      case -20461:
        uint64_t result = "kDYFEMTLFXTemporalScaler_setOutputTexture";
        break;
      case -20460:
        uint64_t result = "kDYFEMTLFXTemporalScaler_setPreExposure";
        break;
      case -20459:
        uint64_t result = "kDYFEMTLFXTemporalScaler_setReset";
        break;
      case -20458:
        uint64_t result = "kDYFEMTLFXTemporalScaler_dealloc";
        break;
      case -20457:
        uint64_t result = "kDYFEMTLFXTemporalScaler_encodeToCommandBuffer";
        break;
      case -20456:
        uint64_t result = "kDYFEMTLFXTemporalScaler_setReactiveMaskTexture";
        break;
      default:
        if (a1 == -18432)
        {
          uint64_t result = "kDYFEMTLDevice_newSpatialScalerWithDescriptor";
        }
        else
        {
          if (a1 != -18431) {
            goto LABEL_1384;
          }
          uint64_t result = "kDYFEMTLDevice_newTemporalScalerWithDescriptor";
        }
        break;
    }
  }
  else
  {
    int v1 = a1 + 0x4000;
    uint64_t result = "kDYFEMTLBlitCommandEncoder_setLabel";
    switch(v1)
    {
      case 0:
        return result;
      case 1:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_dealloc";
        break;
      case 2:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toTexture_de"
                 "stinationSlice_destinationLevel_destinationOrigin";
        break;
      case 3:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_copyFromBuffer_sourceOffset_sourceBytesPerRow_sourceBytesPerImage_sourceSize"
                 "_toTexture_destinationSlice_destinationLevel_destinationOrigin";
        break;
      case 4:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toBuffer_des"
                 "tinationOffset_destinationBytesPerRow_destinationBytesPerImage";
        break;
      case 5:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_generateMipmapsForTexture";
        break;
      case 6:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_fillBuffer_range_value";
        break;
      case 7:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_copyFromBuffer_sourceOffset_toBuffer_destinationOffset_size";
        break;
      case 8:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_endEncoding";
        break;
      case 9:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_insertDebugSignpost";
        break;
      case 10:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_pushDebugGroup";
        break;
      case 11:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_popDebugGroup";
        break;
      case 12:
        uint64_t result = "kDYFEMTLBuffer_setLabel";
        break;
      case 13:
        uint64_t result = "kDYFEMTLBuffer_setResponsibleProcess";
        break;
      case 14:
        uint64_t result = "kDYFEMTLBuffer_dealloc";
        break;
      case 15:
        uint64_t result = "kDYFEMTLBuffer_contents";
        break;
      case 16:
        uint64_t result = "kDYFEMTLBuffer_newTextureWithDescriptor_offset_bytesPerRow";
        break;
      case 17:
        uint64_t result = "kDYFEMTLBuffer_setPurgeableState";
        break;
      case 18:
        uint64_t result = "kDYFEMTLBuffer_isPurgeable";
        break;
      case 19:
        uint64_t result = "kDYFEMTLCommandBuffer_setLabel";
        break;
      case 20:
        uint64_t result = "kDYFEMTLCommandBuffer_setProfilingEnabled";
        break;
      case 21:
        uint64_t result = "kDYFEMTLCommandBuffer_dealloc";
        break;
      case 22:
        uint64_t result = "kDYFEMTLCommandBuffer_enqueue";
        break;
      case 23:
        uint64_t result = "kDYFEMTLCommandBuffer_commit";
        break;
      case 24:
        uint64_t result = "kDYFEMTLCommandBuffer_addScheduledHandler";
        break;
      case 25:
        uint64_t result = "kDYFEMTLCommandBuffer_presentDrawable";
        break;
      case 26:
        uint64_t result = "kDYFEMTLCommandBuffer_presentDrawable_atTime";
        break;
      case 27:
        uint64_t result = "kDYFEMTLCommandBuffer_waitUntilScheduled";
        break;
      case 28:
        uint64_t result = "kDYFEMTLCommandBuffer_addCompletedHandler";
        break;
      case 29:
        uint64_t result = "kDYFEMTLCommandBuffer_waitUntilCompleted";
        break;
      case 30:
        uint64_t result = "kDYFEMTLCommandBuffer_blitCommandEncoder";
        break;
      case 31:
        uint64_t result = "kDYFEMTLCommandBuffer_renderCommandEncoderWithDescriptor";
        break;
      case 32:
        uint64_t result = "kDYFEMTLCommandBuffer_computeCommandEncoder";
        break;
      case 33:
        uint64_t result = "kDYFEMTLCommandBuffer_parallelRenderCommandEncoderWithDescriptor";
        break;
      case 34:
        uint64_t result = "kDYFEMTLCommandBuffer_debugCommandEncoder";
        break;
      case 35:
        uint64_t result = "kDYFEMTLCommandQueue_setLabel";
        break;
      case 36:
        uint64_t result = "kDYFEMTLCommandQueue_setBackgroundTrackingPID";
        break;
      case 37:
        uint64_t result = "kDYFEMTLCommandQueue_setSkipRender";
        break;
      case 38:
        uint64_t result = "kDYFEMTLCommandQueue_setExecutionEnabled";
        break;
      case 39:
        uint64_t result = "kDYFEMTLCommandQueue_setProfilingEnabled";
        break;
      case 40:
        uint64_t result = "kDYFEMTLCommandQueue_dealloc";
        break;
      case 41:
        uint64_t result = "kDYFEMTLCommandQueue_commandBuffer";
        break;
      case 42:
        uint64_t result = "kDYFEMTLCommandQueue_commandBufferWithUnretainedReferences";
        break;
      case 43:
        uint64_t result = "kDYFEMTLCommandQueue_insertDebugCaptureBoundary";
        break;
      case 44:
        uint64_t result = "kDYFEMTLCommandQueue_finish";
        break;
      case 45:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setLabel";
        break;
      case 46:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_dealloc";
        break;
      case 47:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setComputePipelineState";
        break;
      case 48:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setBuffer_offset_atIndex";
        break;
      case 49:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setBuffers_offsets_withRange";
        break;
      case 50:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setTexture_atIndex";
        break;
      case 51:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setTextures_withRange";
        break;
      case 52:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setSamplerState_atIndex";
        break;
      case 53:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setSamplerStates_withRange";
        break;
      case 54:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setSamplerState_lodMinClamp_lodMaxClamp_atIndex";
        break;
      case 55:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setSamplerStates_lodMinClamps_lodMaxClamps_withRange";
        break;
      case 56:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setThreadgroupMemoryLength_atIndex";
        break;
      case 57:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_dispatchThreadgroups_threadsPerThreadgroup";
        break;
      case 58:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_executeBarrier";
        break;
      case 59:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_endEncoding";
        break;
      case 60:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_insertDebugSignpost";
        break;
      case 61:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_pushDebugGroup";
        break;
      case 62:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_popDebugGroup";
        break;
      case 63:
        uint64_t result = "kDYFEMTLComputePipelineState_dealloc";
        break;
      case 64:
        uint64_t result = "kDYFEMTLDepthStencilState_dealloc";
        break;
      case 65:
        uint64_t result = "kDYFEMTLDevice_setShaderDebugInfoCaching";
        break;
      case 66:
        uint64_t result = "kDYFEMTLDevice_setMetalAssertionsEnabled";
        break;
      case 67:
        uint64_t result = "kDYFEMTLDevice_dealloc";
        break;
      case 68:
        uint64_t result = "kDYFEMTLDevice_newCommandQueue";
        break;
      case 69:
        uint64_t result = "kDYFEMTLDevice_newCommandQueueWithMaxCommandBufferCount";
        break;
      case 70:
        uint64_t result = "kDYFEMTLDevice_newBufferWithLength_options";
        break;
      case 71:
        uint64_t result = "kDYFEMTLDevice_newBufferWithBytes_length_options";
        break;
      case 72:
        uint64_t result = "kDYFEMTLDevice_newBufferWithBytesNoCopy_length_options_deallocator";
        break;
      case 73:
        uint64_t result = "kDYFEMTLDevice_newDepthStencilStateWithDescriptor";
        break;
      case 74:
        uint64_t result = "kDYFEMTLDevice_newTextureWithDescriptor";
        break;
      case 75:
        uint64_t result = "kDYFEMTLDevice_newSamplerStateWithDescriptor";
        break;
      case 76:
        uint64_t result = "kDYFEMTLDevice_newDefaultLibrary";
        break;
      case 77:
        uint64_t result = "kDYFEMTLDevice_newLibraryWithFile_error";
        break;
      case 78:
        uint64_t result = "kDYFEMTLDevice_newLibraryWithData_error";
        break;
      case 79:
        uint64_t result = "kDYFEMTLDevice_newLibraryWithSource_options_error";
        break;
      case 80:
        uint64_t result = "kDYFEMTLDevice_newLibraryWithSource_options_completionHandler";
        break;
      case 81:
        uint64_t result = "kDYFEMTLDevice_newRenderPipelineStateWithDescriptor_error";
        break;
      case 82:
        uint64_t result = "kDYFEMTLDevice_newRenderPipelineStateWithDescriptor_options_reflection_error";
        break;
      case 83:
        uint64_t result = "kDYFEMTLDevice_newRenderPipelineStateWithDescriptor_completionHandler";
        break;
      case 84:
        uint64_t result = "kDYFEMTLDevice_newRenderPipelineStateWithDescriptor_options_completionHandler";
        break;
      case 85:
        uint64_t result = "kDYFEMTLDevice_newComputePipelineStateWithFunction_error";
        break;
      case 86:
        uint64_t result = "kDYFEMTLDevice_newComputePipelineStateWithFunction_options_reflection_error";
        break;
      case 87:
        uint64_t result = "kDYFEMTLDevice_newComputePipelineStateWithFunction_completionHandler";
        break;
      case 88:
        uint64_t result = "kDYFEMTLDevice_newComputePipelineStateWithFunction_options_completionHandler";
        break;
      case 89:
        uint64_t result = "kDYFEMTLDevice_unmapShaderSampleBuffer";
        break;
      case 90:
        uint64_t result = "kDYFEMTLDevice_newTextureWithDescriptor_iosurface_plane";
        break;
      case 91:
        uint64_t result = "kDYFEMTLFunction_dealloc";
        break;
      case 92:
        uint64_t result = "kDYFEMTLLibrary_setLabel";
        break;
      case 93:
        uint64_t result = "kDYFEMTLLibrary_dealloc";
        break;
      case 94:
        uint64_t result = "kDYFEMTLLibrary_newFunctionWithName";
        break;
      case 95:
        uint64_t result = "kDYFEMTLParallelRenderCommandEncoder_setSeparateCommits";
        break;
      case 96:
        uint64_t result = "kDYFEMTLParallelRenderCommandEncoder_setLabel";
        break;
      case 97:
        uint64_t result = "kDYFEMTLParallelRenderCommandEncoder_dealloc";
        break;
      case 98:
        uint64_t result = "kDYFEMTLParallelRenderCommandEncoder_renderCommandEncoder";
        break;
      case 99:
        uint64_t result = "kDYFEMTLParallelRenderCommandEncoder_endEncoding";
        break;
      case 100:
        uint64_t result = "kDYFEMTLParallelRenderCommandEncoder_insertDebugSignpost";
        break;
      case 101:
        uint64_t result = "kDYFEMTLParallelRenderCommandEncoder_pushDebugGroup";
        break;
      case 102:
        uint64_t result = "kDYFEMTLParallelRenderCommandEncoder_popDebugGroup";
        break;
      case 103:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setLabel";
        break;
      case 104:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_dealloc";
        break;
      case 105:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setRenderPipelineState";
        break;
      case 106:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setVertexBuffer_offset_atIndex";
        break;
      case 107:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setVertexBuffers_offsets_withRange";
        break;
      case 108:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setVertexTexture_atIndex";
        break;
      case 109:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setVertexTextures_withRange";
        break;
      case 110:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setVertexSamplerState_atIndex";
        break;
      case 111:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setVertexSamplerStates_withRange";
        break;
      case 112:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setVertexSamplerState_lodMinClamp_lodMaxClamp_atIndex";
        break;
      case 113:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setVertexSamplerStates_lodMinClamps_lodMaxClamps_withRange";
        break;
      case 114:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setViewport";
        break;
      case 115:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setFrontFacingWinding";
        break;
      case 116:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setCullMode";
        break;
      case 117:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setDepthClipMode";
        break;
      case 118:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setDepthBias_slopeScale_clamp";
        break;
      case 119:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setScissorRect";
        break;
      case 120:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setTriangleFillMode";
        break;
      case 121:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setFragmentBuffer_offset_atIndex";
        break;
      case 122:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setFragmentBuffers_offsets_withRange";
        break;
      case 123:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setFragmentTexture_atIndex";
        break;
      case 124:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setFragmentTextures_withRange";
        break;
      case 125:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setFragmentSamplerState_atIndex";
        break;
      case 126:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setFragmentSamplerStates_withRange";
        break;
      case 127:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setFragmentSamplerState_lodMinClamp_lodMaxClamp_atIndex";
        break;
      case 128:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setFragmentSamplerStates_lodMinClamps_lodMaxClamps_withRange";
        break;
      case 129:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setBlendColorRed_green_blue_alpha";
        break;
      case 130:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setDepthStencilState";
        break;
      case 131:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setStencilReferenceValue";
        break;
      case 132:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setVisibilityResultMode_offset";
        break;
      case 133:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_drawPrimitives_vertexStart_vertexCount_instanceCount";
        break;
      case 134:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_drawPrimitives_vertexStart_vertexCount";
        break;
      case 135:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount";
        break;
      case 136:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset";
        break;
      case 137:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setLineWidth";
        break;
      case 138:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_endEncoding";
        break;
      case 139:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_insertDebugSignpost";
        break;
      case 140:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_pushDebugGroup";
        break;
      case 141:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_popDebugGroup";
        break;
      case 142:
        uint64_t result = "kDYFEMTLRenderPipelineState_dealloc";
        break;
      case 143:
        uint64_t result = "kDYFEMTLSamplerState_dealloc";
        break;
      case 144:
        uint64_t result = "kDYFEMTLTexture_setLabel";
        break;
      case 145:
        uint64_t result = "kDYFEMTLTexture_setResponsibleProcess";
        break;
      case 146:
        uint64_t result = "kDYFEMTLTexture_dealloc";
        break;
      case 147:
        uint64_t result = "kDYFEMTLTexture_getBytes_bytesPerRow_bytesPerImage_fromRegion_mipmapLevel_slice";
        break;
      case 148:
        uint64_t result = "kDYFEMTLTexture_replaceRegion_mipmapLevel_slice_withBytes_bytesPerRow_bytesPerImage";
        break;
      case 149:
        uint64_t result = "kDYFEMTLTexture_getBytes_bytesPerRow_fromRegion_mipmapLevel";
        break;
      case 150:
        uint64_t result = "kDYFEMTLTexture_replaceRegion_mipmapLevel_withBytes_bytesPerRow";
        break;
      case 151:
        uint64_t result = "kDYFEMTLTexture_newTextureViewWithPixelFormat";
        break;
      case 152:
        uint64_t result = "kDYFEMTLTexture_setPurgeableState";
        break;
      case 153:
        uint64_t result = "kDYFEMTLTexture_isPurgeable";
        break;
      case 154:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_flushResource";
        break;
      case 155:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_flushTexture_slice_mipmapLevel";
        break;
      case 156:
        uint64_t result = "kDYFEMTLBuffer_invalidateRange";
        break;
      case 157:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setBytes_length_atIndex";
        break;
      case 158:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setBufferOffset_atIndex";
        break;
      case 159:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setVertexBytes_length_atIndex";
        break;
      case 160:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setVertexBufferOffset_atIndex";
        break;
      case 161:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setFragmentBytes_length_atIndex";
        break;
      case 162:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setFragmentBufferOffset_atIndex";
        break;
      case 163:
        uint64_t result = "kDYFEMTLTexture_invalidateRegion";
        break;
      case 164:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_dispatchThreadgroupsWithIndirectBuffer_indirectBufferOffset_threadsPerThreadgroup";
        break;
      case 165:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setStencilFrontReferenceValue_backReferenceValue";
        break;
      case 166:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_drawPrimitives_vertexStart_vertexCount_instanceCount_baseInstance";
        break;
      case 167:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_i"
                 "nstanceCount_baseVertex_baseInstance";
        break;
      case 168:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_drawPrimitives_indirectBuffer_indirectBufferOffset";
        break;
      case 169:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_drawIndexedPrimitives_indexType_indexBuffer_indexBufferOffset_indirectBuff"
                 "er_indirectBufferOffset";
        break;
      case 170:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setFragmentTexture_atTextureIndex_samplerState_atSamplerIndex";
        break;
      case 171:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_synchronizeResource";
        break;
      case 172:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_synchronizeTexture_slice_level";
        break;
      case 173:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toTexture_de"
                 "stinationSlice_destinationLevel_destinationOrigin_options";
        break;
      case 174:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_copyFromBuffer_sourceOffset_sourceBytesPerRow_sourceBytesPerImage_sourceSize"
                 "_toTexture_destinationSlice_destinationLevel_destinationOrigin_options";
        break;
      case 175:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toBuffer_des"
                 "tinationOffset_destinationBytesPerRow_destinationBytesPerImage_options";
        break;
      case 176:
        uint64_t result = "kDYFEMTLBuffer_didModifyRange";
        break;
      case 177:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setTexture_baseLevel_atIndex";
        break;
      case 178:
        uint64_t result = "kDYFEMTLDevice_supportsFeatureSet";
        break;
      case 179:
        uint64_t result = "kDYFEMTLDevice_supportsSampleCount";
        break;
      case 180:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setVertexTexture_baseLevel_atIndex";
        break;
      case 181:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setFragmentTexture_baseLevel_atIndex";
        break;
      case 182:
        uint64_t result = "kDYFEMTLCommandBuffer_commitAndHold";
        break;
      case 183:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_textureBarrier";
        break;
      case 184:
        uint64_t result = "kDYFEMTLDevice_newComputePipelineStateWithDescriptor_error";
        break;
      case 185:
        uint64_t result = "kDYFEMTLDevice_newComputePipelineStateWithDescriptor_options_reflection_error";
        break;
      case 186:
        uint64_t result = "kDYFEMTLDevice_newComputePipelineStateWithDescriptor_completionHandler";
        break;
      case 187:
        uint64_t result = "kDYFEMTLDevice_newComputePipelineStateWithDescriptor_options_completionHandler";
        break;
      case 188:
        uint64_t result = "kDYFEMTLTexture_newTextureViewWithPixelFormat_textureType_levels_slices";
        break;
      case 189:
        uint64_t result = "kDYFEMTLCommandBuffer_fragmentRenderCommandEncoderWithDescriptor";
        break;
      case 190:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setLabel";
        break;
      case 191:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_dealloc";
        break;
      case 192:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setRenderPipelineState";
        break;
      case 193:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setDepthBias_slopeScale_clamp";
        break;
      case 194:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setScissorRect";
        break;
      case 195:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setFragmentBytes_length_atIndex";
        break;
      case 196:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setFragmentBuffer_offset_atIndex";
        break;
      case 197:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setFragmentBufferOffset_atIndex";
        break;
      case 198:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setFragmentBuffers_offsets_withRange";
        break;
      case 199:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setFragmentTexture_atIndex";
        break;
      case 200:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setFragmentTextures_withRange";
        break;
      case 201:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setFragmentTexture_baseLevel_atIndex";
        break;
      case 202:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setFragmentTexture_atTextureIndex_samplerState_atSamplerIndex";
        break;
      case 203:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setFragmentSamplerState_atIndex";
        break;
      case 204:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setFragmentSamplerStates_withRange";
        break;
      case 205:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setFragmentSamplerState_lodMinClamp_lodMaxClamp_atIndex";
        break;
      case 206:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setFragmentSamplerStates_lodMinClamps_lodMaxClamps_withRange";
        break;
      case 207:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setBlendColorRed_green_blue_alpha";
        break;
      case 208:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setDepthStencilState";
        break;
      case 209:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setStencilReferenceValue";
        break;
      case 210:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setStencilFrontReferenceValue_backReferenceValue";
        break;
      case 211:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_drawTrianglesWithPositions_vertexCount_triangleIndices_triangleCount";
        break;
      case 212:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_drawTrianglesWithPositions_vertexCount_vertexVaryings_varyingCount"
                 "PerVertex_triangleIndices_triangleCount";
        break;
      case 213:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_drawTrianglesWithPositions_vertexCount_vertexVaryings_varyingCountPerVertex";
        break;
      case 214:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_endEncoding";
        break;
      case 215:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_insertDebugSignpost";
        break;
      case 216:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_pushDebugGroup";
        break;
      case 217:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_popDebugGroup";
        break;
      case 218:
        uint64_t result = "kDYFEMTLDevice_supportsTextureSampleCount";
        break;
      case 219:
        uint64_t result = "kDYFEMTLDevice_newCommandQueueWithDescriptor";
        break;
      case 220:
        uint64_t result = "kDYFEMTLCommandBuffer_setListIndex";
        break;
      case 221:
        uint64_t result = "kDYFEMTLDevice_newBufferWithIOSurface";
        break;
      case 222:
        uint64_t result = "kDYFEMTLParallelRenderCommandEncoder_setColorStoreAction_atIndex";
        break;
      case 223:
        uint64_t result = "kDYFEMTLParallelRenderCommandEncoder_setDepthStoreAction";
        break;
      case 224:
        uint64_t result = "kDYFEMTLParallelRenderCommandEncoder_setStencilStoreAction";
        break;
      case 225:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setColorStoreAction_atIndex";
        break;
      case 226:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setDepthStoreAction";
        break;
      case 227:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setStencilStoreAction";
        break;
      case 228:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setColorResolveTexture_slice_depthPlane_level_atIndex";
        break;
      case 229:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setDepthResolveTexture_slice_depthPlane_level";
        break;
      case 230:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setColorStoreAction_atIndex";
        break;
      case 231:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setDepthStoreAction";
        break;
      case 232:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setStencilStoreAction";
        break;
      case 233:
        uint64_t result = "kDYFEMTLCommandBuffer_computeCommandEncoderWithParallelExecution";
        break;
      case 234:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_dispatchBarrier";
        break;
      case 235:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setImageblockWidth_height";
        break;
      case 236:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setTessellationFactorBuffer_offset_instanceStride";
        break;
      case 237:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_drawPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_"
                 "instanceCount_baseInstance";
        break;
      case 238:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_drawPatches_patchIndexBuffer_patchIndexBufferOffset_indirectBuffer_indirectBufferOffset";
        break;
      case 239:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_drawIndexedPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBuffer"
                 "Offset_controlPointIndexBuffer_controlPointIndexBufferOffset_instanceCount_baseInstance";
        break;
      case 240:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_drawIndexedPatches_patchIndexBuffer_patchIndexBufferOffset_controlPointInd"
                 "exBuffer_controlPointIndexBufferOffset_indirectBuffer_indirectBufferOffset";
        break;
      case 241:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setTileBytes_length_atIndex";
        break;
      case 242:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setTileBuffer_offset_atIndex";
        break;
      case 243:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setTileBufferOffset_atIndex";
        break;
      case 244:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setTileTexture_atIndex";
        break;
      case 245:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setTileSamplerState_atIndex";
        break;
      case 246:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setTileSamplerState_lodMinClamp_lodMaxClamp_atIndex";
        break;
      case 247:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_dispatchThreadsPerTile";
        break;
      case 248:
        uint64_t result = "kDYFEMTLFence_setLabel";
        break;
      case 249:
        uint64_t result = "kDYFEMTLFunction_functionConstantIndexByName_type";
        break;
      case 250:
        uint64_t result = "kDYFEMTLCommandQueue_setIsOpenGLQueue";
        break;
      case 251:
        uint64_t result = "kDYFEMTLCommandBuffer_presentDrawable_afterMinimumDuration";
        break;
      case 252:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setTessellationFactorScale";
        break;
      case 253:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_waitForFence";
        break;
      case 254:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_updateFence";
        break;
      case 255:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_waitForFence";
        break;
      case 256:
        uint64_t result = "kDYFEMTLDevice_newFence";
        break;
      case 257:
        uint64_t result = "kDYFEMTLFence_dealloc";
        break;
      case 258:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_updateFence_afterStages";
        break;
      case 259:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_waitForFence_beforeStages";
        break;
      case 260:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_updateFence";
        break;
      case 261:
        uint64_t result = "kDYFEMTLFunction_setLabel";
        break;
      case 262:
        uint64_t result = "kDYFEMTLBuffer_makeAliasable";
        break;
      case 263:
        uint64_t result = "kDYFEMTLDevice_heapTextureSizeWithDescriptor";
        break;
      case 264:
        uint64_t result = "kDYFEMTLDevice_newHeapWithDescriptor";
        break;
      case 265:
        uint64_t result = "kDYFEMTLHeap_setLabel";
        break;
      case 266:
        uint64_t result = "kDYFEMTLHeap_dealloc";
        break;
      case 267:
        uint64_t result = "kDYFEMTLHeap_newBufferWithLength_options";
        break;
      case 268:
        uint64_t result = "kDYFEMTLHeap_newTextureWithDescriptor";
        break;
      case 269:
        uint64_t result = "kDYFEMTLHeap_setPurgeableState";
        break;
      case 270:
        uint64_t result = "kDYFEMTLTexture_makeAliasable";
        break;
      case 271:
        uint64_t result = "kDYFEMTLBuffer_isAliasable";
        break;
      case 272:
        uint64_t result = "kDYFEMTLDevice_heapTextureSizeAndAlignWithDescriptor";
        break;
      case 273:
        uint64_t result = "kDYFEMTLDevice_heapBufferSizeAndAlignWithLength_options";
        break;
      case 274:
        uint64_t result = "kDYFEMTLHeap_setResponsibleProcess";
        break;
      case 275:
        uint64_t result = "kDYFEMTLHeap_isPurgeable";
        break;
      case 276:
        uint64_t result = "kDYFEMTLTexture_isAliasable";
        break;
      case 277:
        uint64_t result = "kDYFEMTLLibrary_newFunctionWithName_constantValues_error";
        break;
      case 278:
        uint64_t result = "kDYFEMTLLibrary_newFunctionWithName_constantValues_completionHandler";
        break;
      case 279:
        uint64_t result = "kDYFEMTLHeap_maxAvailableSizeWithAlignment";
        break;
      case 280:
        uint64_t result = "kDYFEMTLBuffer_newTiledTextureWithDescriptor_offset_bytesPerRow";
        break;
      case 281:
        uint64_t result = "kDYFEMTLBuffer_addDebugMarker_range";
        break;
      case 282:
        uint64_t result = "kDYFEMTLBuffer_removeAllDebugMarkers";
        break;
      case 283:
        uint64_t result = "kDYFEMTLDevice_newComputePipelineStateWithImageFilterFunctionsSPI_imageFilterFunctionInfo_error";
        break;
      case 284:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setStageInRegion";
        break;
      case 285:
        uint64_t result = "kDYFEMTLDevice_newTextureLayoutWithDescriptor_isHeapOrBufferBacked";
        break;
      case 286:
        uint64_t result = "kDYFEMTLBuffer_newLinearTextureWithDescriptor_offset_bytesPerRow_bytesPerImage";
        break;
      case 287:
        uint64_t result = "kDYFEMTLTextureLayout_dealloc";
        break;
      case 288:
        uint64_t result = "kDYFEMTLDevice_newTextureWithBytesNoCopy_length_descriptor_deallocator";
        break;
      case 289:
        uint64_t result = "kDYFEMTLDevice_newDefaultLibraryWithBundle_error";
        break;
      case 290:
        uint64_t result = "kDYFEMTLTexture_formattedDescription";
        break;
      case 291:
        uint64_t result = "kDYFEMTLDevice_minLinearTextureAlignmentForPixelFormat";
        break;
      case 292:
        uint64_t result = "kDYFEMTLComputePipelineState_getComputeKernelTelemetryID";
        break;
      case 293:
        uint64_t result = "kDYFEMTLDevice_newRenderPipelineStateWithTileDescriptor_error";
        break;
      case 294:
        uint64_t result = "kDYFEMTLDevice_newRenderPipelineStateWithTileDescriptor_options_reflection_error";
        break;
      case 295:
        uint64_t result = "kDYFEMTLDevice_newRenderPipelineStateWithTileDescriptor_completionHandler";
        break;
      case 296:
        uint64_t result = "kDYFEMTLDevice_newRenderPipelineStateWithTileDescriptor_options_completionHandler";
        break;
      case 297:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setTileBuffers_offsets_withRange";
        break;
      case 298:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setTileTextures_withRange";
        break;
      case 299:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setTileSamplerStates_withRange";
        break;
      case 300:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setTileSamplerStates_lodMinClamps_lodMaxClamps_withRange";
        break;
      case 301:
        uint64_t result = "kDYFEMTLLibrary_setOverrideTriple";
        break;
      case 302:
        uint64_t result = "kDYFEMTLLibrary_newFunctionWithName_constantValues_pipelineLibrary_error";
        break;
      case 303:
        uint64_t result = "kDYFEMTLLibrary_newFunctionWithName_constantValues_pipelineLibrary_completionHandler";
        break;
      case 304:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setThreadgroupMemoryLength_atIndex";
        break;
      case 305:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_dispatchThreadsWithIndirectBuffer_indirectBufferOffset";
        break;
      case 306:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_dispatchThreads_threadsPerThreadgroup";
        break;
      case 307:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setViewports_count";
        break;
      case 308:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setScissorRects_count";
        break;
      case 309:
        uint64_t result = "kDYFEMTLDevice_newPipelineLibraryWithFilePath_error";
        break;
      case 310:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setThreadgroupMemoryLength_offset_atIndex";
        break;
      case 311:
        uint64_t result = "kDYFEMTLCaptureScope_setLabel";
        break;
      case 312:
        uint64_t result = "kDYFEMTLCaptureScope_dealloc";
        break;
      case 313:
        uint64_t result = "kDYFEMTLCaptureScope_beginScope";
        break;
      case 314:
        uint64_t result = "kDYFEMTLCaptureScope_endScope";
        break;
      case 315:
        uint64_t result = "kDYFEMTLCaptureManager_startCaptureWithDevice";
        break;
      case 316:
        uint64_t result = "kDYFEMTLCaptureManager_startCaptureWithCommandQueue";
        break;
      case 317:
        uint64_t result = "kDYFEMTLCaptureManager_stopCapture";
        break;
      case 318:
        uint64_t result = "kDYFEMTLDevice_startCollectingPipelineDescriptors";
        break;
      case 319:
        uint64_t result = "kDYFEMTLCommandBuffer_pushDebugGroup";
        break;
      case 320:
        uint64_t result = "kDYFEMTLCommandBuffer_popDebugGroup";
        break;
      case 321:
        uint64_t result = "kDYFEMTLArgumentEncoder_setLabel";
        break;
      case 322:
        uint64_t result = "kDYFEMTLArgumentEncoder_dealloc";
        break;
      case 323:
        uint64_t result = "kDYFEMTLArgumentEncoder_setArgumentBuffer_offset";
        break;
      case 324:
        uint64_t result = "kDYFEMTLArgumentEncoder_setBuffer_offset_atIndex";
        break;
      case 325:
        uint64_t result = "kDYFEMTLArgumentEncoder_setBuffers_offsets_withRange";
        break;
      case 326:
        uint64_t result = "kDYFEMTLArgumentEncoder_setTexture_atIndex";
        break;
      case 327:
        uint64_t result = "kDYFEMTLArgumentEncoder_setTextures_withRange";
        break;
      case 328:
        uint64_t result = "kDYFEMTLArgumentEncoder_setSamplerState_atIndex";
        break;
      case 329:
        uint64_t result = "kDYFEMTLArgumentEncoder_setSamplerStates_withRange";
        break;
      case 330:
        uint64_t result = "kDYFEMTLArgumentEncoder_constantDataAtIndex";
        break;
      case 331:
        uint64_t result = "kDYFEMTLArgumentEncoder_newArgumentEncoderForBufferAtIndex";
        break;
      case 332:
        uint64_t result = "kDYFEMTLFunction_newArgumentEncoderWithBufferIndex";
        break;
      case 333:
        uint64_t result = "kDYFEMTLFunction_newArgumentEncoderWithBufferIndex_reflection";
        break;
      case 334:
        uint64_t result = "kDYFEMTLDevice_newArgumentEncoderWithArguments_count";
        break;
      case 335:
        uint64_t result = "kDYFEMTLDevice_newArgumentBufferLayoutWithStructType";
        break;
      case 336:
        uint64_t result = "kDYFEMTLDevice_newArgumentEncoderWithLayout";
        break;
      case 337:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_useResource_usage";
        break;
      case 338:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_useResources_count_usage";
        break;
      case 339:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_useHeap";
        break;
      case 340:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_useHeaps_count";
        break;
      case 341:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_useResource_usage";
        break;
      case 342:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_useResources_count_usage";
        break;
      case 343:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_useHeap";
        break;
      case 344:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_useHeaps_count";
        break;
      case 345:
        uint64_t result = "kDYFEMTLDevice_newLibraryWithURL_error";
        break;
      case 346:
        uint64_t result = "kDYFEMTLLibrary_newExternFunctionWithName";
        break;
      case 347:
        uint64_t result = "kDYFEMTLDevice_newArgumentEncoderWithArguments";
        break;
      case 348:
        uint64_t result = "kDYFEMTLDevice_indirectArgumentBufferDecodingData";
        break;
      case 349:
        uint64_t result = "kDYFEMTLDevice_setIndirectArgumentBufferDecodingData";
        break;
      case 350:
        uint64_t result = "kDYFEMTLCaptureManager_notifySubmissionForEyeSPI_iosurface_bounds_submitFlags";
        break;
      case 351:
        uint64_t result = "kDYFEMTLArgumentEncoder_setArgumentBuffer_startOffset_arrayElement";
        break;
      case 352:
        uint64_t result = "kDYFEMTLTextureLayout_initializeTextureMemory";
        break;
      case 353:
        uint64_t result = "kDYFEMTLDevice_newTiledTextureWithBytesNoCopy_length_descriptor_offset_bytesPerRow";
        break;
      case 354:
        uint64_t result = "kDYFEMTLDevice_newTiledTextureWithBytesNoCopy_length_deallocator_descriptor_offset_bytesPerRow";
        break;
      case 355:
        uint64_t result = "kDYFEMTLDevice_newLibraryWithCIFilters_imageFilterFunctionInfo_error";
        break;
      case 356:
        uint64_t result = "kDYFEMTLParallelRenderCommandEncoder_setColorStoreActionOptions_atIndex";
        break;
      case 357:
        uint64_t result = "kDYFEMTLParallelRenderCommandEncoder_setDepthStoreActionOptions";
        break;
      case 358:
        uint64_t result = "kDYFEMTLParallelRenderCommandEncoder_setStencilStoreActionOptions";
        break;
      case 359:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setColorStoreActionOptions_atIndex";
        break;
      case 360:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setDepthStoreActionOptions";
        break;
      case 361:
        uint64_t result = "kDYFEMTLFragmentRenderCommandEncoder_setStencilStoreActionOptions";
        break;
      case 362:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setColorStoreActionOptions_atIndex";
        break;
      case 363:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setDepthStoreActionOptions";
        break;
      case 364:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setStencilStoreActionOptions";
        break;
      case 365:
        uint64_t result = "kDYFEMTLCaptureManager_notifyPostPresentHandoffSPI";
        break;
      case 366:
        uint64_t result = "kDYFEMTLDevice_newLibraryWithCIFiltersForComputePipeline_imageFilterFunctionInfo_error";
        break;
      case 367:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setStageInRegionWithIndirectBuffer_indirectBufferOffset";
        break;
      case 368:
        uint64_t result = "kDYFEMTLDevice_newIndirectRenderCommandEncoderWithBuffer";
        break;
      case 369:
        uint64_t result = "kDYFEMTLDevice_newIndirectComputeCommandEncoderWithBuffer";
        break;
      case 370:
        uint64_t result = "kDYFEMTLCommandBuffer_computeCommandEncoderWithDispatchType";
        break;
      case 371:
        uint64_t result = "kDYFEMTLCommandBuffer_videoCommandEncoder";
        break;
      case 372:
        uint64_t result = "kDYFEMTLCommandBuffer_doCorruptCBSPI";
        break;
      case 373:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_useComputePipelineState";
        break;
      case 374:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_useComputePipelineStates_count";
        break;
      case 375:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_memoryBarrierWithScope";
        break;
      case 376:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_memoryBarrierWithResources_count";
        break;
      case 377:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_useRenderPipelineState";
        break;
      case 378:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_useRenderPipelineStates_count";
        break;
      case 379:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_executeCommandsInBuffer_startIndex";
        break;
      case 380:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_memoryBarrierWithScope_afterStages_beforeStages";
        break;
      case 381:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_memoryBarrierWithResources_count_afterStages_beforeStages";
        break;
      case 382:
        uint64_t result = "kDYFEMTLArgumentEncoder_setRenderPipelineState_atIndex";
        break;
      case 383:
        uint64_t result = "kDYFEMTLArgumentEncoder_setRenderPipelineStates_withRange";
        break;
      case 384:
        uint64_t result = "kDYFEMTLArgumentEncoder_setComputePipelineState_atIndex";
        break;
      case 385:
        uint64_t result = "kDYFEMTLArgumentEncoder_setComputePipelineStates_withRange";
        break;
      case 386:
        uint64_t result = "kDYFEMTLDevice_minimumTextureBufferAlignmentForPixelFormat";
        break;
      case 387:
        uint64_t result = "kDYFEMTLDevice_newEvent";
        break;
      case 388:
        uint64_t result = "kDYFEMTLDevice_newSharedEvent";
        break;
      case 389:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_optimizeContentsForGPUAccess";
        break;
      case 390:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_optimizeContentsForGPUAccess_slice_level";
        break;
      case 391:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_optimizeContentsForCPUAccess";
        break;
      case 392:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_optimizeContentsForCPUAccess_slice_level";
        break;
      case 393:
        uint64_t result = "kDYFEMTLCommandBuffer_encodeWaitForEvent_value";
        break;
      case 394:
        uint64_t result = "kDYFEMTLCommandBuffer_encodeSignalEvent_value";
        break;
      case 395:
        uint64_t result = "kDYFEMTLComputePipelineState_resourceIndex";
        break;
      case 396:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setPointSize";
        break;
      case 397:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setClipPlane_p2_p3_p4_atIndex";
        break;
      case 398:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setVertexSamplerState_lodMinClamp_lodMaxClamp_lodBias_atIndex";
        break;
      case 399:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setFragmentSamplerState_lodMinClamp_lodMaxClamp_lodBias_atIndex";
        break;
      case 400:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setPrimitiveRestartEnabled_index";
        break;
      case 401:
        uint64_t result = "kDYFEMTLSamplerState_resourceIndex";
        break;
      case 402:
        uint64_t result = "kDYFEMTLSharedTextureHandle_dealloc";
        break;
      case 403:
        uint64_t result = "kDYFEMTLTexture_newSharedHandle";
        break;
      case 404:
        uint64_t result = "kDYFEMTLDevice_newSharedTextureWithDescriptor";
        break;
      case 405:
        uint64_t result = "kDYFEMTLDevice_newSharedTextureWithHandle";
        break;
      case 406:
        uint64_t result = "kDYFEMTLDevice_tileSizeWithTextureType_pixelFormat_sampleCount";
        break;
      case 407:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_getTextureAccessCounters_region_mipLevel_slice_resetCounters_countersBuffer_"
                 "countersBufferOffset";
        break;
      case 408:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_resetTextureAccessCounters_region_mipLevel_slice";
        break;
      case 409:
        uint64_t result = "kDYFEMTLSharedEvent_setSignaledValue";
        break;
      case 410:
        uint64_t result = "kDYFEMTLSharedEvent_setLabel";
        break;
      case 411:
        uint64_t result = "kDYFEMTLSharedEvent_dealloc";
        break;
      case 412:
        uint64_t result = "kDYFEMTLDevice_newIndirectCommandBufferWithDescriptor_maxCount_options";
        break;
      case 413:
        uint64_t result = "kDYFEMTLDevice_reserveResourceIndicesForResourceType_indices_indexCount";
        break;
      case 414:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setPrimitiveRestartEnabled";
        break;
      case 415:
        uint64_t result = "kDYFEMTLDevice_newIndirectCommandBufferWithDescriptor_maxCommandCount_options";
        break;
      case 416:
        uint64_t result = "kDYFEMTLDevice_getIndirectCommandBufferHeaderSize";
        break;
      case 417:
        uint64_t result = "kDYFEMTLCommandBuffer_addPurgedResource";
        break;
      case 418:
        uint64_t result = "kDYFEMTLCommandBuffer_addPurgedHeap";
        break;
      case 419:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_executeCommandsInBuffer_startIndex";
        break;
      case 420:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_executeCommandsInBuffer_withRange";
        break;
      case 421:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_executeCommandsInBuffer_indirectBuffer_indirectBufferOffset";
        break;
      case 422:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_executeCommandsInBuffer_withRange";
        break;
      case 423:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_executeCommandsInBuffer_indirectBuffer_indirectBufferOffset";
        break;
      case 424:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_resetCommandsInBuffer_withRange";
        break;
      case 425:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_copyIndirectCommandBuffer_sourceRange_destination_destinationIndex";
        break;
      case 426:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_optimizeIndirectCommandBuffer_withRange";
        break;
      case 427:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_dealloc";
        break;
      case 428:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_setRenderPipelineState";
        break;
      case 429:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_setVertexBuffer_offset_atIndex";
        break;
      case 430:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_setFragmentBuffer_offset_atIndex";
        break;
      case 431:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_drawPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset"
                 "_instanceCount_baseInstance_tessellationFactorBuffer_tessellationFactorBufferOffset_tessellationFactorB"
                 "ufferInstanceStride_tessellationFactorBufferScale";
        break;
      case 432:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_drawPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset"
                 "_instanceCount_baseInstance_tessellationFactorBuffer_tessellationFactorBufferOffset_tessellationFactorB"
                 "ufferInstanceStride";
        break;
      case 433:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_drawIndexedPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBuffe"
                 "rOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_instanceCount_baseInstance_tessellationFa"
                 "ctorBuffer_tessellationFactorBufferOffset_tessellationFactorBufferInstanceStride_tessellationFactorBufferScale";
        break;
      case 434:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_drawIndexedPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBuffe"
                 "rOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_instanceCount_baseInstance_tessellationFa"
                 "ctorBuffer_tessellationFactorBufferOffset_tessellationFactorBufferInstanceStride";
        break;
      case 435:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_drawPrimitives_vertexStart_vertexCount_instanceCount_baseInstance";
        break;
      case 436:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_"
                 "instanceCount_baseVertex_baseInstance";
        break;
      case 437:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_nop";
        break;
      case 438:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_end";
        break;
      case 439:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_setTessellationFactorBuffer_offset_instanceStride";
        break;
      case 440:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_setTessellationFactorScale";
        break;
      case 441:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_drawPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset"
                 "_instanceCount_baseInstance";
        break;
      case 442:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_drawIndexedPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBuffe"
                 "rOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_instanceCount_baseInstance";
        break;
      case 443:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_dispatchThreadsPerTile";
        break;
      case 444:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_setVertexArgument_offset_atIndex";
        break;
      case 445:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_setFragmentArgument_offset_atIndex";
        break;
      case 446:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_setTileArgument_offset_atIndex";
        break;
      case 447:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_setThreadgroupMemoryLength_offset_atIndex";
        break;
      case 448:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_endIndirectCommandBuffer";
        break;
      case 449:
        uint64_t result = "kDYFEMTLIndirectComputeCommand_dealloc";
        break;
      case 450:
        uint64_t result = "kDYFEMTLIndirectComputeCommand_setComputePipelineState";
        break;
      case 451:
        uint64_t result = "kDYFEMTLIndirectComputeCommand_setKernelBuffer_offset_atIndex";
        break;
      case 452:
        uint64_t result = "kDYFEMTLIndirectComputeCommand_dispatchThreadgroups_threadsPerThreadgroup";
        break;
      case 453:
        uint64_t result = "kDYFEMTLIndirectComputeCommand_concurrentDispatchThreadgroups_threadsPerThreadgroup";
        break;
      case 454:
        uint64_t result = "kDYFEMTLIndirectComputeCommand_nop";
        break;
      case 455:
        uint64_t result = "kDYFEMTLIndirectComputeCommand_endIndirectCommandBuffer";
        break;
      case 456:
        uint64_t result = "kDYFEMTLIndirectComputeCommand_setKernelArgument_offset_atIndex";
        break;
      case 457:
        uint64_t result = "kDYFEMTLIndirectComputeCommand_setThreadgroupMemoryLength_atIndex";
        break;
      case 458:
        uint64_t result = "kDYFEMTLIndirectComputeCommand_setStageInRegion";
        break;
      case 459:
        uint64_t result = "kDYFEMTLIndirectCommandBuffer_setLabel";
        break;
      case 460:
        uint64_t result = "kDYFEMTLIndirectCommandBuffer_setResponsibleProcess";
        break;
      case 461:
        uint64_t result = "kDYFEMTLIndirectCommandBuffer_dealloc";
        break;
      case 462:
        uint64_t result = "kDYFEMTLIndirectCommandBuffer_indirectRenderCommandAtIndex";
        break;
      case 463:
        uint64_t result = "kDYFEMTLIndirectCommandBuffer_indirectComputeCommandAtIndex";
        break;
      case 464:
        uint64_t result = "kDYFEMTLIndirectCommandBuffer_setPurgeableState";
        break;
      case 465:
        uint64_t result = "kDYFEMTLIndirectCommandBuffer_makeAliasable";
        break;
      case 466:
        uint64_t result = "kDYFEMTLIndirectCommandBuffer_isAliasable";
        break;
      case 467:
        uint64_t result = "kDYFEMTLIndirectCommandBuffer_isPurgeable";
        break;
      case 468:
        uint64_t result = "kDYFEMTLArgumentEncoder_setIndirectCommandBuffer_atIndex";
        break;
      case 469:
        uint64_t result = "kDYFEMTLArgumentEncoder_setIndirectCommandBuffers_withRange";
        break;
      case 470:
        uint64_t result = "kDYFEMTLBuffer_newRemoteBufferViewForDevice";
        break;
      case 471:
        uint64_t result = "kDYFEMTLTexture_newRemoteTextureViewForDevice";
        break;
      case 472:
        uint64_t result = "kDYFEMTLDevice_newSharedEventWithMachPort";
        break;
      case 473:
        uint64_t result = "kDYFEMTLSharedEvent_eventPort";
        break;
      case 474:
        uint64_t result = "kDYFEMTLTexture_newSharedTextureHandle";
        break;
      case 475:
        uint64_t result = "kDYFEMTLDevice_newSharedEventWithHandle";
        break;
      case 476:
        uint64_t result = "kDYFEMTLCommandBuffer_commitAndWaitUntilSubmitted";
        break;
      case 477:
        uint64_t result = "kDYFEMTLSharedEvent_newSharedEventHandle";
        break;
      case 478:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_reset";
        break;
      case 479:
        uint64_t result = "kDYFEMTLIndirectComputeCommand_reset";
        break;
      case 480:
        uint64_t result = "kDYFEMTLBuffer_containsResource";
        break;
      case 481:
        uint64_t result = "kDYFEMTLTexture_containsResource";
        break;
      case 482:
        uint64_t result = "kDYFEMTLDevice_supportsPrimitiveType";
        break;
      case 483:
        uint64_t result = "kDYFEMTLDevice_startCollectingPipelineDescriptorsUsingPrefixForNames";
        break;
      case 484:
        uint64_t result = "kDYFEMTLDevice_newResourceGroupFromResources_count";
        break;
      case 485:
        uint64_t result = "kDYFEMTLCommandBuffer_sampledComputeCommandEncoderWithDispatchType_programInfoBuffer_capacity";
        break;
      case 486:
        uint64_t result = "kDYFEMTLCommandBuffer_setResourceGroups_count";
        break;
      case 487:
        uint64_t result = "kDYFEMTLCommandBuffer_dropResourceGroups_count";
        break;
      case 488:
        uint64_t result = "kDYFEMTLIndirectCommandBuffer_resetWithRange";
        break;
      case 489:
        uint64_t result = "kDYFEMTLIndirectCommandBuffer_containsResource";
        break;
      case 490:
        uint64_t result = "kDYFEMTLTexture_isShareable";
        break;
      case 491:
        uint64_t result = "kDYFEMTLMotionEstimationPipeline_dealloc";
        break;
      case 492:
        uint64_t result = "kDYFEMTLDevice_motionEstimatorCapabilities";
        break;
      case 493:
        uint64_t result = "kDYFEMTLDevice_newMotionEstimationPipelineWithDescriptor";
        break;
      case 494:
        uint64_t result = "kDYFEMTLVideoCommandEncoder_setLabel";
        break;
      case 495:
        uint64_t result = "kDYFEMTLVideoCommandEncoder_dealloc";
        break;
      case 496:
        uint64_t result = "kDYFEMTLVideoCommandEncoder_setMotionEstimationPipeline";
        break;
      case 497:
        uint64_t result = "kDYFEMTLVideoCommandEncoder_generateMotionVectorsForTexture_previousTexture_resultBuffer_bufferOffset";
        break;
      case 498:
        uint64_t result = "kDYFEMTLVideoCommandEncoder_waitForFence";
        break;
      case 499:
        uint64_t result = "kDYFEMTLVideoCommandEncoder_updateFence";
        break;
      case 500:
        uint64_t result = "kDYFEMTLVideoCommandEncoder_endEncoding";
        break;
      case 501:
        uint64_t result = "kDYFEMTLVideoCommandEncoder_insertDebugSignpost";
        break;
      case 502:
        uint64_t result = "kDYFEMTLVideoCommandEncoder_pushDebugGroup";
        break;
      case 503:
        uint64_t result = "kDYFEMTLVideoCommandEncoder_popDebugGroup";
        break;
      case 504:
        uint64_t result = "kDYFEMTLEvent_setLabel";
        break;
      case 505:
        uint64_t result = "kDYFEMTLEvent_dealloc";
        break;
      case 506:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_copyFromTexture_sourceSlice_sourceLevel_toTexture_destinationSlice_destinati"
                 "onLevel_sliceCount_levelCount";
        break;
      case 507:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_copyFromTexture_toTexture";
        break;
      case 508:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_resolveCountersWithIndexRange_sampleBuffer_resolvedBuffer";
        break;
      case 509:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_sampleCountersInBuffer_atIndex_allowOverlap";
        break;
      case 510:
        uint64_t result = "kDYFEMTLBuffer_setResourceIndex";
        break;
      case 511:
        uint64_t result = "kDYFEMTLCommandBuffer_debugBufferContentsWithLength";
        break;
      case 512:
        uint64_t result = "kDYFEMTLCommandBuffer_encodeCacheControlFinalizeOperation_resourceGroups_count";
        break;
      case 513:
        uint64_t result = "kDYFEMTLCommandBuffer_encodeCacheControlTagOperation_resourceGroups_count";
        break;
      case 514:
        uint64_t result = "kDYFEMTLCommandBuffer_resourceStateCommandEncoder";
        break;
      case 515:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_sampleCountersInBuffer_atIndex_allowOverlap";
        break;
      case 516:
        uint64_t result = "kDYFEMTLComputePipelineState_setResourceIndex";
        break;
      case 517:
        uint64_t result = "kDYFEMTLCounterSampleBuffer_dealloc";
        break;
      case 518:
        uint64_t result = "kDYFEMTLDeserializationContext_dealloc";
        break;
      case 519:
        uint64_t result = "kDYFEMTLDeserializationContext_functionWithFunctionRef";
        break;
      case 520:
        uint64_t result = "kDYFEMTLDevice_setCurrentUtilityBufferIndex";
        break;
      case 521:
        uint64_t result = "kDYFEMTLDevice_setResourceIndirectionEnabled";
        break;
      case 522:
        uint64_t result = "kDYFEMTLDevice_setUtilityBuffers";
        break;
      case 523:
        uint64_t result = "kDYFEMTLDevice_addBufferToGlobalResourceTable";
        break;
      case 524:
        uint64_t result = "kDYFEMTLDevice_addComputePipelineStateToGlobalResourceTable";
        break;
      case 525:
        uint64_t result = "kDYFEMTLDevice_addIndirectCommandBufferToGlobalResourceTable";
        break;
      case 526:
        uint64_t result = "kDYFEMTLDevice_addRenderPipelineStateToGlobalResourceTable";
        break;
      case 527:
        uint64_t result = "kDYFEMTLDevice_addSamplerStateToGlobalResourceTable";
        break;
      case 528:
        uint64_t result = "kDYFEMTLDevice_addTextureToGlobalResourceTable";
        break;
      case 529:
        uint64_t result = "kDYFEMTLDevice_allowLibrariesFromOtherPlatforms";
        break;
      case 530:
        uint64_t result = "kDYFEMTLDevice_createNewUtilityBuffer";
        break;
      case 531:
        uint64_t result = "kDYFEMTLDevice_describeCounter";
        break;
      case 532:
        uint64_t result = "kDYFEMTLDevice_indirectBufferAddressForResourceIndex_offset";
        break;
      case 533:
        uint64_t result = "kDYFEMTLDevice_newBufferWithBytes_length_options_atResourceIndex";
        break;
      case 534:
        uint64_t result = "kDYFEMTLDevice_newBufferWithBytesNoCopy_length_options_atResourceIndex_deallocator";
        break;
      case 535:
        uint64_t result = "kDYFEMTLDevice_newBufferWithLength_options_atResourceIndex";
        break;
      case 536:
        uint64_t result = "kDYFEMTLDevice_newCounterSampleBufferWithDescriptor_error";
        break;
      case 537:
        uint64_t result = "kDYFEMTLDevice_newLibraryWithImageFilterFunctionsSPI_imageFilterFunctionInfo_error";
        break;
      case 538:
        uint64_t result = "kDYFEMTLDevice_newRasterizationRateMapWithScreenSize_layerCount_layers";
        break;
      case 539:
        uint64_t result = "kDYFEMTLDevice_newRenderPipelineDescriptorWithSerializedData_deserializationContext";
        break;
      case 540:
        uint64_t result = "kDYFEMTLDevice_offsetFromIndirectBufferAddress";
        break;
      case 541:
        uint64_t result = "kDYFEMTLDevice_pollSampleBuffer_resolvedBuffer";
        break;
      case 542:
        uint64_t result = "kDYFEMTLDevice_removeResourceFromGlobalResourceTable_resourceType";
        break;
      case 543:
        uint64_t result = "kDYFEMTLDevice_requiresIndirectionForAllResourceTypes";
        break;
      case 544:
        uint64_t result = "kDYFEMTLDevice_resolveCountersWithIndexRange_sampleBuffer";
        break;
      case 545:
        uint64_t result = "kDYFEMTLDevice_resourceIndexFromIndirectBufferAddress";
        break;
      case 546:
        uint64_t result = "kDYFEMTLDevice_sampleCountersAtInterval_sampleBuffer_error";
        break;
      case 547:
        uint64_t result = "kDYFEMTLDevice_sampleTimeStamps_gpuTimeStamp";
        break;
      case 548:
        uint64_t result = "kDYFEMTLDevice_serializeRenderPipelineDescriptor";
        break;
      case 549:
        uint64_t result = "kDYFEMTLDevice_setGPUAssertionsEnabled";
        break;
      case 550:
        uint64_t result = "kDYFEMTLDevice_setResourcesPurgeableState_newState_oldState_count";
        break;
      case 551:
        uint64_t result = "kDYFEMTLDevice_useDeviceResourceTableForType";
        break;
      case 552:
        uint64_t result = "kDYFEMTLDevice_utilityBufferForComputeCommandEncoder";
        break;
      case 553:
        uint64_t result = "kDYFEMTLDevice_utilityBufferForRenderCommandEncoder";
        break;
      case 554:
        uint64_t result = "kDYFEMTLFunction_newFunctionWithPluginData_bitcodeType";
        break;
      case 555:
        uint64_t result = "kDYFEMTLHeap_newBufferWithLength_options_atOffset";
        break;
      case 556:
        uint64_t result = "kDYFEMTLHeap_newTextureWithDescriptor_atOffset";
        break;
      case 557:
        uint64_t result = "kDYFEMTLIndirectComputeCommand_clearBarrier";
        break;
      case 558:
        uint64_t result = "kDYFEMTLIndirectComputeCommand_concurrentDispatchThreads_threadsPerThreadgroup";
        break;
      case 559:
        uint64_t result = "kDYFEMTLIndirectComputeCommand_setBarrier";
        break;
      case 560:
        uint64_t result = "kDYFEMTLIndirectComputeCommand_setImageBlockWidth_height";
        break;
      case 561:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_sampleCountersInBuffer_atIndex_allowOverlap";
        break;
      case 562:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setVertexAmplificationCount_viewMappings";
        break;
      case 563:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_useHeap_stages";
        break;
      case 564:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_useHeaps_count_stages";
        break;
      case 565:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_useResource_usage_stages";
        break;
      case 566:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_useResources_count_usage_stages";
        break;
      case 567:
        uint64_t result = "kDYFEMTLRenderPipelineState_setResourceIndex";
        break;
      case 568:
        uint64_t result = "kDYFEMTLSamplerState_setResourceIndex";
        break;
      case 569:
        uint64_t result = "kDYFEMTLTexture_setResourceIndex";
        break;
      case 570:
        uint64_t result = "kDYFEMTLDevice_newComputePipelineDescriptorWithSerializedData_deserializationContext";
        break;
      case 571:
        uint64_t result = "kDYFEMTLDevice_serializeComputePipelineDescriptor";
        break;
      case 572:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setVertexAmplificationMode_value";
        break;
      case 573:
        uint64_t result = "kDYFEMTLCommandQueue_getBackgroundGPUPriority";
        break;
      case 574:
        uint64_t result = "kDYFEMTLCommandQueue_getGPUPriority";
        break;
      case 575:
        uint64_t result = "kDYFEMTLCommandQueue_setBackgroundGPUPriority";
        break;
      case 576:
        uint64_t result = "kDYFEMTLCommandQueue_setBackgroundGPUPriority_offset";
        break;
      case 577:
        uint64_t result = "kDYFEMTLCommandQueue_setCompletionQueue";
        break;
      case 578:
        uint64_t result = "kDYFEMTLCommandQueue_setGPUPriority";
        break;
      case 579:
        uint64_t result = "kDYFEMTLCommandQueue_setGPUPriority_offset";
        break;
      case 580:
        uint64_t result = "kDYFEMTLCommandQueue_setSubmissionQueue";
        break;
      case 581:
        uint64_t result = "kDYFEMTLRasterizationRateMap_copyParameterDataToBuffer_atOffset";
        break;
      case 582:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_updateTextureMapping_mode_indirectBuffer_indirectBufferOffset";
        break;
      case 583:
        uint64_t result = "kDYFEMTLRasterizationRateMap_dealloc";
        break;
      case 584:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_updateTextureMapping_mode_region_mipLevel_slice";
        break;
      case 585:
        uint64_t result = "kDYFEMTLRasterizationRateMap_physicalCoordinate_forLayer";
        break;
      case 586:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_updateTextureMappings_mode_regions_mipLevels_slices_numRegions";
        break;
      case 587:
        uint64_t result = "kDYFEMTLRasterizationRateMap_physicalSizeForLayer";
        break;
      case 588:
        uint64_t result = "kDYFEMTLDevice_tileSizeWithSparsePageSize_textureType_pixelFormat_sampleCount";
        break;
      case 589:
        uint64_t result = "kDYFEMTLRasterizationRateMap_screenCoordinate_forLayer";
        break;
      case 590:
        uint64_t result = "kDYFEMTLResourceStateCommandEncoder_setLabel";
        break;
      case 591:
        uint64_t result = "kDYFEMTLDevice_newRasterizationRateMapWithDescriptor";
        break;
      case 592:
        uint64_t result = "kDYFEMTLResourceStateCommandEncoder_copyMappingStateFromTexture_mipLevel_slice_toBuffer_offset_numTiles";
        break;
      case 593:
        uint64_t result = "kDYFEMTLDevice_supportsRasterizationRateMapWithLayerCount";
        break;
      case 594:
        uint64_t result = "kDYFEMTLResourceStateCommandEncoder_dealloc";
        break;
      case 595:
        uint64_t result = "kDYFEMTLResourceStateCommandEncoder_endEncoding";
        break;
      case 596:
        uint64_t result = "kDYFEMTLResourceStateCommandEncoder_insertDebugSignpost";
        break;
      case 597:
        uint64_t result = "kDYFEMTLResourceStateCommandEncoder_popDebugGroup";
        break;
      case 598:
        uint64_t result = "kDYFEMTLResourceStateCommandEncoder_pushDebugGroup";
        break;
      case 599:
        uint64_t result = "kDYFEMTLResourceStateCommandEncoder_updateFence";
        break;
      case 600:
        uint64_t result = "kDYFEMTLResourceStateCommandEncoder_updateTextureMapping_mode_indirectBuffer_indirectBufferOffset";
        break;
      case 601:
        uint64_t result = "kDYFEMTLResourceStateCommandEncoder_updateTextureMapping_mode_region_mipLevel_slice";
        break;
      case 602:
        uint64_t result = "kDYFEMTLResourceStateCommandEncoder_updateTextureMappings_mode_regions_mipLevels_slices_numRegions";
        break;
      case 603:
        uint64_t result = "kDYFEMTLResourceStateCommandEncoder_waitForFence";
        break;
      case 604:
        uint64_t result = "kDYFEMTLDevice_supportsFamily";
        break;
      case 605:
        uint64_t result = "kDYFEMTLDevice_supportsVersion";
        break;
      case 606:
        uint64_t result = "kDYFEMTLHeap_newBufferWithLength_options_offset";
        break;
      case 607:
        uint64_t result = "kDYFEMTLHeap_newTextureWithDescriptor_offset";
        break;
      case 608:
        uint64_t result = "kDYFEMTLRasterizationRateMap_copyParameterDataToBuffer_offset";
        break;
      case 609:
        uint64_t result = "kDYFEMTLTexture_newTextureViewWithPixelFormat_textureType_levels_slices_swizzle";
        break;
      case 610:
        uint64_t result = "kDYFEMTLDevice_newPrecompiledComputePipelineStateWithDescriptor_options_pipelineCache_completionHandler";
        break;
      case 611:
        uint64_t result = "kDYFEMTLIndirectComputeCommand_setImageblockWidth_height";
        break;
      case 612:
        uint64_t result = "kDYFEMTLLibrary_newFunctionWithName_constantValues_functionCache_error";
        break;
      case 613:
        uint64_t result = "kDYFEMTLRasterizationRateMap_mapPhysicalToScreenCoordinates_forLayer";
        break;
      case 614:
        uint64_t result = "kDYFEMTLRasterizationRateMap_mapScreenToPhysicalCoordinates_forLayer";
        break;
      case 615:
        uint64_t result = "kDYFEMTLResourceGroup_dealloc";
        break;
      case 616:
        uint64_t result = "kDYFEMTLBuffer_isComplete";
        break;
      case 617:
        uint64_t result = "kDYFEMTLBuffer_waitUntilComplete";
        break;
      case 618:
        uint64_t result = "kDYFEMTLIndirectCommandBuffer_doesAliasAllResources_count";
        break;
      case 619:
        uint64_t result = "kDYFEMTLIndirectCommandBuffer_doesAliasAnyResources_count";
        break;
      case 620:
        uint64_t result = "kDYFEMTLIndirectCommandBuffer_doesAliasResource";
        break;
      case 621:
        uint64_t result = "kDYFEMTLIndirectCommandBuffer_isComplete";
        break;
      case 622:
        uint64_t result = "kDYFEMTLIndirectCommandBuffer_waitUntilComplete";
        break;
      case 623:
        uint64_t result = "kDYFEMTLTexture_isComplete";
        break;
      case 624:
        uint64_t result = "kDYFEMTLTexture_waitUntilComplete";
        break;
      case 625:
        uint64_t result = "kDYFEMTLDevice_convertSparsePixelRegions_toTileRegions_withTileSize_alignmentMode_numRegions";
        break;
      case 626:
        uint64_t result = "kDYFEMTLDevice_convertSparseTileRegions_toPixelRegions_withTileSize_numRegions";
        break;
      case 627:
        uint64_t result = "kDYFEMTLDevice_supportsVertexAmplificationCount";
        break;
      case 628:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_resolveCounters_inRange_destinationBuffer_destinationOffset";
        break;
      case 629:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_sampleCountersInBuffer_atSampleIndex_withBarrier";
        break;
      case 630:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_sampleCountersInBuffer_atSampleIndex_withBarrier";
        break;
      case 631:
        uint64_t result = "kDYFEMTLCounterSampleBuffer_resolveCounterRange";
        break;
      case 632:
        uint64_t result = "kDYFEMTLCounterSet_dealloc";
        break;
      case 633:
        uint64_t result = "kDYFEMTLDevice_sampleTimestamps_gpuTimestamp";
        break;
      case 634:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_sampleCountersInBuffer_atSampleIndex_withBarrier";
        break;
      case 635:
        uint64_t result = "kDYFEMTLCommandBuffer_encodeWaitForEvent_value_timeout";
        break;
      case 636:
        uint64_t result = "kDYFEMTLCounter_dealloc";
        break;
      case 637:
        uint64_t result = "kDYFEMTLDevice_copyShaderCacheToPath";
        break;
      case 638:
        uint64_t result = "kDYFEMTLDevice_serializeStructType_version";
        break;
      case 639:
        uint64_t result = "kDYFEMTLPipelineCache_dealloc";
        break;
      case 640:
        uint64_t result = "kDYFEMTLPipelineLibrary_setDisableRunTimeCompilation";
        break;
      case 641:
        uint64_t result = "kDYFEMTLPipelineLibrary_setLabel";
        break;
      case 642:
        uint64_t result = "kDYFEMTLPipelineLibrary_dealloc";
        break;
      case 643:
        uint64_t result = "kDYFEMTLPipelineLibrary_newComputePipelineDescriptorWithName_error";
        break;
      case 644:
        uint64_t result = "kDYFEMTLPipelineLibrary_newComputePipelineStateWithName_options_reflection_error";
        break;
      case 645:
        uint64_t result = "kDYFEMTLPipelineLibrary_newRenderPipelineDescriptorWithName_error";
        break;
      case 646:
        uint64_t result = "kDYFEMTLPipelineLibrary_newRenderPipelineStateWithName_options_reflection_error";
        break;
      case 647:
        uint64_t result = "kDYFEMTLDevice_sparseTileSizeWithTextureType_pixelFormat_sampleCount";
        break;
      case 648:
        uint64_t result = "kDYFEMTLCaptureManager_startCaptureWithDescriptor_error";
        break;
      case 649:
        uint64_t result = "kDYFEMTLCaptureManager_startCaptureWithScope";
        break;
      case 650:
        uint64_t result = "kDYFEMTLCaptureManager_newCaptureScopeWithDevice";
        break;
      case 651:
        uint64_t result = "kDYFEMTLCaptureManager_newCaptureScopeWithCommandQueue";
        break;
      case 652:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_enableNullBufferBinds";
        break;
      case 653:
        uint64_t result = "kDYFEMTLDevice_newFunctionWithGLIR_functionType";
        break;
      case 654:
        uint64_t result = "kDYFEMTLDevice_newFunctionWithGLIR_inputsDescription_functionType";
        break;
      case 655:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setAlphaTestReferenceValue";
        break;
      case 656:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setColorResolveTexture_slice_depthPlane_level_yInvert_atIndex";
        break;
      case 657:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setDepthCleared";
        break;
      case 658:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setDepthResolveTexture_slice_depthPlane_level_yInvert";
        break;
      case 659:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setProvokingVertexMode";
        break;
      case 660:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setStencilCleared";
        break;
      case 661:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setStencilResolveTexture_slice_depthPlane_level";
        break;
      case 662:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setStencilResolveTexture_slice_depthPlane_level_yInvert";
        break;
      case 663:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setTriangleFrontFillMode_backFillMode";
        break;
      case 664:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setViewportTransformEnabled";
        break;
      case 665:
        uint64_t result = "kDYFEMTLDevice_minLinearTextureBaseAddressAlignmentForDescriptor";
        break;
      case 666:
        uint64_t result = "kDYFEMTLDevice_minLinearTexturePitchAlignmentForDescriptor_mustMatchExactly";
        break;
      case 667:
        uint64_t result = "kDYFEMTLDevice_newBinaryArchiveWithDescriptor_error";
        break;
      case 668:
        uint64_t result = "kDYFEMTLDevice_requiredLinearTextureBytesPerRowForDescriptor";
        break;
      case 669:
        uint64_t result = "kDYFEMTLFunction_newArgumentEncoderWithBufferIndex_pipelineLibrary";
        break;
      case 670:
        uint64_t result = "kDYFEMTLFunction_newArgumentEncoderWithBufferIndex_reflection_pipelineLibrary";
        break;
      case 671:
        uint64_t result = "kDYFEMTLFunction_reflectionWithOptions_pipelineLibrary";
        break;
      case 672:
        uint64_t result = "kDYFEMTLCommandBuffer_computeCommandEncoderWithDispatchType_substreamCount";
        break;
      case 673:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setSubstream";
        break;
      case 674:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_signalProgress";
        break;
      case 675:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_waitForProgress";
        break;
      case 676:
        uint64_t result = "kDYFEMTLDevice_maximumComputeSubstreams";
        break;
      case 677:
        uint64_t result = "kDYFEMTLDevice_newBufferWithBytes_length_options_gpuAddress";
        break;
      case 678:
        uint64_t result = "kDYFEMTLDevice_newBufferWithBytesNoCopy_length_options_gpuAddress_deallocator";
        break;
      case 679:
        uint64_t result = "kDYFEMTLDevice_newBufferWithLength_options_gpuAddress";
        break;
      case 680:
        uint64_t result = "kDYFEMTLDevice_reserveGPUAddressRange";
        break;
      case 681:
        uint64_t result = "kDYFEMTLCommandBuffer_addLoggingForType_handler";
        break;
      case 682:
        uint64_t result = "kDYFEMTLCommandBufferEncoderInfo_dealloc";
        break;
      case 683:
        uint64_t result = "kDYFEMTLCommandQueue_commandBufferWithDescriptor";
        break;
      case 684:
        uint64_t result = "kDYFEMTLComputePipelineState_functionPointerHandleWithFunction";
        break;
      case 685:
        uint64_t result = "kDYFEMTLComputePipelineState_functionPointerHandlesWithFunctions_range";
        break;
      case 686:
        uint64_t result = "kDYFEMTLDevice_setCommandBufferErrorOptions";
        break;
      case 687:
        uint64_t result = "kDYFEMTLDevice_newBinaryLibraryWithOptions_url_error";
        break;
      case 688:
        uint64_t result = "kDYFEMTLDevice_newDynamicLibrary_computeDescriptor_error";
        break;
      case 689:
        uint64_t result = "kDYFEMTLDevice_newDynamicLibrary_error";
        break;
      case 690:
        uint64_t result = "kDYFEMTLDevice_newDynamicLibraryFromURL_error";
        break;
      case 691:
        uint64_t result = "kDYFEMTLDevice_newLibraryWithDAG_functions_error";
        break;
      case 692:
        uint64_t result = "kDYFEMTLFunctionLog_dealloc";
        break;
      case 693:
        uint64_t result = "kDYFEMTLStackTraceEntry_dealloc";
        break;
      case 694:
        uint64_t result = "kDYFEMTLTexture_newTextureViewWithPixelFormat_resourceIndex";
        break;
      case 695:
        uint64_t result = "kDYFEMTLTexture_newTextureViewWithPixelFormat_textureType_levels_slices_resourceIndex";
        break;
      case 696:
        uint64_t result = "kDYFEMTLTexture_newTextureViewWithPixelFormat_textureType_levels_slices_swizzle_resourceIndex";
        break;
      case 697:
        uint64_t result = "kDYFEMTLBinaryArchive_addComputePipelineStateWithDescriptor_error";
        break;
      case 698:
        uint64_t result = "kDYFEMTLBinaryArchive_addLibrary_computePipelineDescriptor_error";
        break;
      case 699:
        uint64_t result = "kDYFEMTLBinaryArchive_dealloc";
        break;
      case 700:
        uint64_t result = "kDYFEMTLBinaryArchive_writeToURL_error";
        break;
      case 701:
        uint64_t result = "kDYFEMTLBinaryLibrary_setLabel";
        break;
      case 702:
        uint64_t result = "kDYFEMTLBinaryLibrary_addBinaryEntry";
        break;
      case 703:
        uint64_t result = "kDYFEMTLBinaryLibrary_addComputePipelineFunctionsWithDescriptor_error";
        break;
      case 704:
        uint64_t result = "kDYFEMTLBinaryLibrary_dealloc";
        break;
      case 705:
        uint64_t result = "kDYFEMTLBinaryLibrary_getBinaryDataWithKey";
        break;
      case 706:
        uint64_t result = "kDYFEMTLBinaryLibrary_removeComputePipelineFunctionsWithDescriptor_error";
        break;
      case 707:
        uint64_t result = "kDYFEMTLBinaryLibrary_serializeToURL_error";
        break;
      case 708:
        uint64_t result = "kDYFEMTLDynamicLibrary_setLabel";
        break;
      case 709:
        uint64_t result = "kDYFEMTLDynamicLibrary_dealloc";
        break;
      case 710:
        uint64_t result = "kDYFEMTLDynamicLibrary_serializeToURL_error";
        break;
      case 711:
        uint64_t result = "kDYFEMTLCommandBuffer_accelerationStructureCommandEncoder";
        break;
      case 712:
        uint64_t result = "kDYFEMTLDevice_accelerationStructureSizesWithDescriptor";
        break;
      case 713:
        uint64_t result = "kDYFEMTLDevice_loadDynamicLibrariesForComputeDescriptor_error";
        break;
      case 714:
        uint64_t result = "kDYFEMTLFunction_newArgumentEncoderWithBufferIndex_reflection_binaryArchives";
        break;
      case 715:
        uint64_t result = "kDYFEMTLFunction_reflectionWithOptions_binaryArchives";
        break;
      case 716:
        uint64_t result = "kDYFEMTLBinaryArchive_setLabel";
        break;
      case 717:
        uint64_t result = "kDYFEMTLBinaryArchive_addBinaryEntry_forKey";
        break;
      case 718:
        uint64_t result = "kDYFEMTLBinaryArchive_addComputePipelineFunctionsWithDescriptor_error";
        break;
      case 719:
        uint64_t result = "kDYFEMTLBinaryArchive_addRenderPipelineFunctionsWithDescriptor_error";
        break;
      case 720:
        uint64_t result = "kDYFEMTLBinaryArchive_addTileRenderPipelineFunctionsWithDescriptor_error";
        break;
      case 721:
        uint64_t result = "kDYFEMTLBinaryArchive_getBinaryDataForKey";
        break;
      case 722:
        uint64_t result = "kDYFEMTLBinaryArchive_serializeToURL_error";
        break;
      case 723:
        uint64_t result = "kDYFEMTLAccelerationStructure_setLabel";
        break;
      case 724:
        uint64_t result = "kDYFEMTLAccelerationStructure_setResponsibleProcess";
        break;
      case 725:
        uint64_t result = "kDYFEMTLAccelerationStructure_dealloc";
        break;
      case 726:
        uint64_t result = "kDYFEMTLAccelerationStructure_doesAliasAllResources_count";
        break;
      case 727:
        uint64_t result = "kDYFEMTLAccelerationStructure_doesAliasAnyResources_count";
        break;
      case 728:
        uint64_t result = "kDYFEMTLAccelerationStructure_doesAliasResource";
        break;
      case 729:
        uint64_t result = "kDYFEMTLAccelerationStructure_isAliasable";
        break;
      case 730:
        uint64_t result = "kDYFEMTLAccelerationStructure_isComplete";
        break;
      case 731:
        uint64_t result = "kDYFEMTLAccelerationStructure_isPurgeable";
        break;
      case 732:
        uint64_t result = "kDYFEMTLAccelerationStructure_isWriteComplete";
        break;
      case 733:
        uint64_t result = "kDYFEMTLAccelerationStructure_makeAliasable";
        break;
      case 734:
        uint64_t result = "kDYFEMTLAccelerationStructure_setPurgeableState";
        break;
      case 735:
        uint64_t result = "kDYFEMTLAccelerationStructure_waitUntilComplete";
        break;
      case 736:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_setLabel";
        break;
      case 737:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_buildAccelerationStructure_descriptor_scratchBuffer_scratchBufferOffset";
        break;
      case 738:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_copyAccelerationStructure_toAccelerationStructure";
        break;
      case 739:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_copyAndCompactAccelerationStructure_toAccelerationStructure";
        break;
      case 740:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_dealloc";
        break;
      case 741:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_deserializeAccelerationStructure_fromBuffer_offset";
        break;
      case 742:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_endEncoding";
        break;
      case 743:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_insertDebugSignpost";
        break;
      case 744:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_popDebugGroup";
        break;
      case 745:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_pushDebugGroup";
        break;
      case 746:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_refitAccelerationStructure_descriptor_destination_scratchBu"
                 "ffer_scratchBufferOffset";
        break;
      case 747:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_sampleCountersInBuffer_atSampleIndex_withBarrier";
        break;
      case 748:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_serializeAccelerationStructure_toBuffer_offset";
        break;
      case 749:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_updateFence";
        break;
      case 750:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_useHeap";
        break;
      case 751:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_useHeaps_count";
        break;
      case 752:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_useResource_usage";
        break;
      case 753:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_useResources_count_usage";
        break;
      case 754:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_waitForFence";
        break;
      case 755:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_writeCompactedAccelerationStructureSize_toBuffer_offset";
        break;
      case 756:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_writeSerializedAccelerationStructureSize_toBuffer_offset";
        break;
      case 757:
        uint64_t result = "kDYFEMTLArgumentEncoder_setAccelerationStructure_atIndex";
        break;
      case 758:
        uint64_t result = "kDYFEMTLArgumentEncoder_setFunctionTable_atIndex";
        break;
      case 759:
        uint64_t result = "kDYFEMTLArgumentEncoder_setFunctionTables_withRange";
        break;
      case 760:
        uint64_t result = "kDYFEMTLCommandQueue_getSPIStats";
        break;
      case 761:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setAccelerationStructure_atBufferIndex";
        break;
      case 762:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setFunctionTable_atIndex";
        break;
      case 763:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setFunctionTables_withRange";
        break;
      case 764:
        uint64_t result = "kDYFEMTLComputePipelineState_functionHandleWithFunction";
        break;
      case 765:
        uint64_t result = "kDYFEMTLComputePipelineState_functionHandlesWithFunctions";
        break;
      case 766:
        uint64_t result = "kDYFEMTLComputePipelineState_newComputePipelineStateWithAdditionalDynamicFunctions";
        break;
      case 767:
        uint64_t result = "kDYFEMTLDevice_compileVisibleFunction_withDescriptor_completionHandler";
        break;
      case 768:
        uint64_t result = "kDYFEMTLDevice_compileVisibleFunction_withDescriptor_error";
        break;
      case 769:
        uint64_t result = "kDYFEMTLDevice_newAccelerationStructureWithDescriptor";
        break;
      case 770:
        uint64_t result = "kDYFEMTLDevice_newAccelerationStructureWithSize";
        break;
      case 771:
        uint64_t result = "kDYFEMTLDevice_newDynamicLibraryWithURL_error";
        break;
      case 772:
        uint64_t result = "kDYFEMTLDevice_newVisibleFunctionTableWithDescriptor";
        break;
      case 773:
        uint64_t result = "kDYFEMTLDynamicLibrary_serializeToURL_options_error";
        break;
      case 774:
        uint64_t result = "kDYFEMTLFunctionHandle_dealloc";
        break;
      case 775:
        uint64_t result = "kDYFEMTLLibrary_newFunctionWithDescriptor_completionHandler";
        break;
      case 776:
        uint64_t result = "kDYFEMTLLibrary_newFunctionWithDescriptor_error";
        break;
      case 777:
        uint64_t result = "kDYFEMTLVisibleFunctionTable_setLabel";
        break;
      case 778:
        uint64_t result = "kDYFEMTLVisibleFunctionTable_setResponsibleProcess";
        break;
      case 779:
        uint64_t result = "kDYFEMTLVisibleFunctionTable_dealloc";
        break;
      case 780:
        uint64_t result = "kDYFEMTLVisibleFunctionTable_doesAliasAllResources_count";
        break;
      case 781:
        uint64_t result = "kDYFEMTLVisibleFunctionTable_doesAliasAnyResources_count";
        break;
      case 782:
        uint64_t result = "kDYFEMTLVisibleFunctionTable_doesAliasResource";
        break;
      case 783:
        uint64_t result = "kDYFEMTLVisibleFunctionTable_isAliasable";
        break;
      case 784:
        uint64_t result = "kDYFEMTLVisibleFunctionTable_isPurgeable";
        break;
      case 785:
        uint64_t result = "kDYFEMTLVisibleFunctionTable_makeAliasable";
        break;
      case 786:
        uint64_t result = "kDYFEMTLVisibleFunctionTable_setFunction_atIndex";
        break;
      case 787:
        uint64_t result = "kDYFEMTLVisibleFunctionTable_setFunctions_withRange";
        break;
      case 788:
        uint64_t result = "kDYFEMTLVisibleFunctionTable_setPurgeableState";
        break;
      case 789:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_deserializeAccelerationStructure_fromBuffer_serializedBufferOffset";
        break;
      case 790:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_deserializeAccelerationStructure_primitiveAccelerationStruc"
                 "tures_fromBuffer_serializedBufferOffset";
        break;
      case 791:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_serializeAccelerationStructure_toBuffer_serializedBufferOffset";
        break;
      case 792:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_writeDeserializedAccelerationStructureSize_serializedOffset"
                 "_toBuffer_sizeBufferOffset";
        break;
      case 793:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_writeDeserializedPrimitiveAccelerationStructureSizes_serial"
                 "izedOffset_toBuffer_sizesBufferOffset";
        break;
      case 794:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_writeGeometryOfAccelerationStructure_toBuffer_geometryBufferOffset";
        break;
      case 795:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_writeGeometrySizeOfAccelerationStructure_toBuffer_sizeBufferOffset";
        break;
      case 796:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_writeSerializedAccelerationStructureSize_toBuffer_sizeBufferOffset";
        break;
      case 797:
        uint64_t result = "kDYFEMTLCommandBuffer_blitCommandEncoderWithDescriptor";
        break;
      case 798:
        uint64_t result = "kDYFEMTLCommandBuffer_computeCommandEncoderWithDescriptor";
        break;
      case 799:
        uint64_t result = "kDYFEMTLCommandBuffer_resourceStateCommandEncoderWithDescriptor";
        break;
      case 800:
        uint64_t result = "kDYFEMTLCommandBuffer_sampledComputeCommandEncoderWithDescriptor_programInfoBuffer_capacity";
        break;
      case 801:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setIntersectionFunctionTable_atBufferIndex";
        break;
      case 802:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setIntersectionFunctionTables_withBufferRange";
        break;
      case 803:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setVisibleFunctionTable_atBufferIndex";
        break;
      case 804:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setVisibleFunctionTables_withBufferRange";
        break;
      case 805:
        uint64_t result = "kDYFEMTLComputePipelineState_newComputePipelineStateWithAdditionalBinaryFunctions";
        break;
      case 806:
        uint64_t result = "kDYFEMTLComputePipelineState_newVisibleFunctionTableWithDescriptor";
        break;
      case 807:
        uint64_t result = "kDYFEMTLDevice_newIntersectionFunctionTableWithDescriptor";
        break;
      case 808:
        uint64_t result = "kDYFEMTLDevice_supportsCounterSampling";
        break;
      case 809:
        uint64_t result = "kDYFEMTLDevice_supportsTextureWriteFPRoundingMode";
        break;
      case 810:
        uint64_t result = "kDYFEMTLVisibleFunctionTable_setGlobalBuffer";
        break;
      case 811:
        uint64_t result = "kDYFEMTLVisibleFunctionTable_setGlobalBufferOffset";
        break;
      case 812:
        uint64_t result = "kDYFEMTLIntersectionFunctionTable_setGlobalBuffer";
        break;
      case 813:
        uint64_t result = "kDYFEMTLIntersectionFunctionTable_setGlobalBufferOffset";
        break;
      case 814:
        uint64_t result = "kDYFEMTLIntersectionFunctionTable_setLabel";
        break;
      case 815:
        uint64_t result = "kDYFEMTLIntersectionFunctionTable_setResponsibleProcess";
        break;
      case 816:
        uint64_t result = "kDYFEMTLIntersectionFunctionTable_dealloc";
        break;
      case 817:
        uint64_t result = "kDYFEMTLIntersectionFunctionTable_doesAliasAllResources_count";
        break;
      case 818:
        uint64_t result = "kDYFEMTLIntersectionFunctionTable_doesAliasAnyResources_count";
        break;
      case 819:
        uint64_t result = "kDYFEMTLIntersectionFunctionTable_doesAliasResource";
        break;
      case 820:
        uint64_t result = "kDYFEMTLIntersectionFunctionTable_isAliasable";
        break;
      case 821:
        uint64_t result = "kDYFEMTLIntersectionFunctionTable_isComplete";
        break;
      case 822:
        uint64_t result = "kDYFEMTLIntersectionFunctionTable_isPurgeable";
        break;
      case 823:
        uint64_t result = "kDYFEMTLIntersectionFunctionTable_isWriteComplete";
        break;
      case 824:
        uint64_t result = "kDYFEMTLIntersectionFunctionTable_makeAliasable";
        break;
      case 825:
        uint64_t result = "kDYFEMTLIntersectionFunctionTable_setFunction_atIndex";
        break;
      case 826:
        uint64_t result = "kDYFEMTLIntersectionFunctionTable_setFunctions_withRange";
        break;
      case 827:
        uint64_t result = "kDYFEMTLIntersectionFunctionTable_setPurgeableState";
        break;
      case 828:
        uint64_t result = "kDYFEMTLIntersectionFunctionTable_waitUntilComplete";
        break;
      case 829:
        uint64_t result = "kDYFEMTLBinaryArchive_addComputePipelineFunctionsWithDescriptor_options_error";
        break;
      case 830:
        uint64_t result = "kDYFEMTLBinaryArchive_addRenderPipelineFunctionsWithDescriptor_options_error";
        break;
      case 831:
        uint64_t result = "kDYFEMTLBinaryArchive_addTileRenderPipelineFunctionsWithDescriptor_options_error";
        break;
      case 832:
        uint64_t result = "kDYFEMTLAccelerationStructure_setDescriptor";
        break;
      case 833:
        uint64_t result = "kDYFEMTLLibrary_newIntersectionFunctionWithDescriptor_completionHandler";
        break;
      case 834:
        uint64_t result = "kDYFEMTLLibrary_newIntersectionFunctionWithDescriptor_error";
        break;
      case 835:
        uint64_t result = "kDYFEMTLArgumentEncoder_setIntersectionFunctionTable_atBufferIndex";
        break;
      case 836:
        uint64_t result = "kDYFEMTLArgumentEncoder_setIntersectionFunctionTables_withBufferRange";
        break;
      case 837:
        uint64_t result = "kDYFEMTLArgumentEncoder_setVisibleFunctionTable_atBufferIndex";
        break;
      case 838:
        uint64_t result = "kDYFEMTLArgumentEncoder_setVisibleFunctionTables_withBufferRange";
        break;
      case 839:
        uint64_t result = "kDYFEMTLIntersectionFunctionTable_setBuffer_offset_atIndex";
        break;
      case 840:
        uint64_t result = "kDYFEMTLIntersectionFunctionTable_setBuffers_offsets_withRange";
        break;
      case 841:
        uint64_t result = "kDYFEMTLVisibleFunctionTable_setBuffer_offset_atIndex";
        break;
      case 842:
        uint64_t result = "kDYFEMTLVisibleFunctionTable_setBuffers_offsets_withRange";
        break;
      case 843:
        uint64_t result = "kDYFEMTLComputePipelineState_newComputePipelineStateWithAdditionalBinaryFunctions_error";
        break;
      case 844:
        uint64_t result = "kDYFEMTLComputePipelineState_newIntersectionFunctionTableWithDescriptor";
        break;
      case 845:
        uint64_t result = "kDYFEMTLArgumentEncoder_setIntersectionFunctionTable_atIndex";
        break;
      case 846:
        uint64_t result = "kDYFEMTLArgumentEncoder_setIntersectionFunctionTables_withRange";
        break;
      case 847:
        uint64_t result = "kDYFEMTLArgumentEncoder_setVisibleFunctionTable_atIndex";
        break;
      case 848:
        uint64_t result = "kDYFEMTLArgumentEncoder_setVisibleFunctionTables_withRange";
        break;
      case 849:
        uint64_t result = "kDYFEMTLDevice_supportsTextureWriteRoundingMode";
        break;
      case 850:
        uint64_t result = "kDYFEMTLTexture_didModifyData";
        break;
      case 851:
        uint64_t result = "kDYFEMTLCommandBuffer_setSharedIndirectionTable";
        break;
      case 852:
        uint64_t result = "kDYFEMTLDevice_newPrecompiledRenderPipelineStateWithDescriptor_options_pipelineCache_completionHandler";
        break;
      case 853:
        uint64_t result = "kDYFEMTLDevice_newDynamicLibraryWithURL_options_error";
        break;
      case 854:
        uint64_t result = "kDYFEMTLIntersectionFunctionTable_setOpaqueTriangleIntersectionFunctionWithSignature_atIndex";
        break;
      case 855:
        uint64_t result = "kDYFEMTLIntersectionFunctionTable_setOpaqueTriangleIntersectionFunctionWithSignature_withRange";
        break;
      case 856:
        uint64_t result = "kDYFEMTLVisibleFunctionTable_setValue_atIndex";
        break;
      case 857:
        uint64_t result = "kDYFEMTLVisibleFunctionTable_setValue_withRange";
        break;
      case 858:
        uint64_t result = "kDYFEMTLIntersectionFunctionTable_setVisibleFunctionTable_atBufferIndex";
        break;
      case 859:
        uint64_t result = "kDYFEMTLIntersectionFunctionTable_setVisibleFunctionTables_withBufferRange";
        break;
      case 860:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_deserializeInstanceAccelerationStructure_primitiveAccelerat"
                 "ionStructures_fromBuffer_serializedBufferOffset";
        break;
      case 861:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_deserializePrimitiveAccelerationStructure_fromBuffer_serial"
                 "izedBufferOffset";
        break;
      case 862:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_serializeInstanceAccelerationStructure_primitiveAcceleratio"
                 "nStructures_toBuffer_serializedBufferOffset";
        break;
      case 863:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_serializePrimitiveAccelerationStructure_toBuffer_serializedBufferOffset";
        break;
      case 864:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_writeGenericBVHStructureOfAccelerationStructure_headerBuffe"
                 "r_headerBufferOffset_innerNodeBuffer_innerNodeBufferOffset_leafNodeBuffer_leafNodeBufferOffset_primitiv"
                 "eBuffer_primitiveBufferOffset";
        break;
      case 865:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_writeGenericBVHStructureSizesOfAccelerationStructure_toBuff"
                 "er_sizesBufferOffset";
        break;
      case 866:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_encodeEndDoWhile_offset_comparison_referenceValue";
        break;
      case 867:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_encodeEndIf";
        break;
      case 868:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_encodeEndWhile";
        break;
      case 869:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_encodeStartDoWhile";
        break;
      case 870:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_encodeStartElse";
        break;
      case 871:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_encodeStartIf_offset_comparison_referenceValue";
        break;
      case 872:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_encodeStartWhile_offset_comparison_referenceValue";
        break;
      case 873:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_insertCompressedTextureReinterpretationFlush";
        break;
      case 874:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_useResourceGroup_usage";
        break;
      case 875:
        uint64_t result = "kDYFEMTLDevice_newBufferWithDescriptor";
        break;
      case 876:
        uint64_t result = "kDYFEMTLRelocation_dealloc";
        break;
      case 877:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_useResourceGroup_usage_stages";
        break;
      case 878:
        uint64_t result = "kDYFEMTLDevice_newAccelerationStructureWithSize_resourceIndex";
        break;
      case 879:
        uint64_t result = "kDYFEMTLBuffer_setParentGPUAddress";
        break;
      case 880:
        uint64_t result = "kDYFEMTLBuffer_setParentGPUSize";
        break;
      case 881:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_insertUncompressedToCompressedFlush";
        break;
      case 882:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_writeCompactedAccelerationStructureSize_toBuffer_offset_sizeDataType";
        break;
      case 883:
        uint64_t result = "kDYFEMTLCommandBuffer_encodeDashboardFinalizeForResourceGroup_dashboard_value_forIndex";
        break;
      case 884:
        uint64_t result = "kDYFEMTLCommandBuffer_encodeDashboardTagForResourceGroup";
        break;
      case 885:
        uint64_t result = "kDYFEMTLDevice_setPluginData";
        break;
      case 886:
        uint64_t result = "kDYFEMTLDevice_loadDynamicLibrariesForComputeDescriptor_options_error";
        break;
      case 887:
        uint64_t result = "kDYFEMTLDevice_loadDynamicLibrariesForFunction_insertLibraries_options_error";
        break;
      case 888:
        uint64_t result = "kDYFEMTLDevice_newLateEvalEvent";
        break;
      case 889:
        uint64_t result = "kDYFEMTLFunctionPointerHandle_dealloc";
        break;
      case 890:
        uint64_t result = "kDYFEMTLFunctionPrivateArgument_dealloc";
        break;
      case 891:
        uint64_t result = "kDYFEMTLFunctionStitchingAttribute_dealloc";
        break;
      case 892:
        uint64_t result = "kDYFEMTLFunctionStitchingNode_dealloc";
        break;
      case 893:
        uint64_t result = "kDYFEMTLLateEvalEvent_setLabel";
        break;
      case 894:
        uint64_t result = "kDYFEMTLLateEvalEvent_setSignaledValue";
        break;
      case 895:
        uint64_t result = "kDYFEMTLLateEvalEvent_dealloc";
        break;
      case 896:
        uint64_t result = "kDYFEMTLLateEvalEvent_newSharedEventHandle";
        break;
      case 897:
        uint64_t result = "kDYFEMTLLibrary_setShaderValidationEnabled";
        break;
      case 898:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_dispatchThreadsPerTile_inRegion";
        break;
      case 899:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setMeshAccelerationStructure_atBufferIndex";
        break;
      case 900:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setMeshIntersectionFunctionTable_atBufferIndex";
        break;
      case 901:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setMeshIntersectionFunctionTables_withBufferRange";
        break;
      case 902:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setMeshVisibleFunctionTable_atBufferIndex";
        break;
      case 903:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setMeshVisibleFunctionTables_withBufferRange";
        break;
      case 904:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setObjectAccelerationStructure_atBufferIndex";
        break;
      case 905:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setObjectIntersectionFunctionTable_atBufferIndex";
        break;
      case 906:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setObjectIntersectionFunctionTables_withBufferRange";
        break;
      case 907:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setObjectVisibleFunctionTable_atBufferIndex";
        break;
      case 908:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setObjectVisibleFunctionTables_withBufferRange";
        break;
      case 909:
        uint64_t result = "kDYFEMTLDevice_compileVisibleFunction_withDescriptor_destinationBinaryArchive_error";
        break;
      case 910:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_fillBuffer_range_pattern4";
        break;
      case 911:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_fillTexture_level_slice_region_bytes_length";
        break;
      case 912:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_fillTexture_level_slice_region_color";
        break;
      case 913:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_fillTexture_level_slice_region_color_pixelFormat";
        break;
      case 914:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_invalidateCompressedTexture";
        break;
      case 915:
        uint64_t result = "kDYFEMTLBlitCommandEncoder_invalidateCompressedTexture_slice_level";
        break;
      case 916:
        uint64_t result = "kDYFEMTLDevice_newLibraryWithGraphs_functions_error";
        break;
      case 917:
        uint64_t result = "kDYFEMTLDevice_newLibraryWithGraphsSPI_functions_error";
        break;
      case 918:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_deserializeInstanceAccelerationStructure_primitiveAccelerat"
                 "ionStructures_fromBuffer_serializedBufferOffset_withDescriptor";
        break;
      case 919:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_deserializePrimitiveAccelerationStructure_fromBuffer_serial"
                 "izedBufferOffset_withDescriptor";
        break;
      case 920:
        uint64_t result = "kDYFEMTLDevice_newAccelerationStructureWithBuffer_offset";
        break;
      case 921:
        uint64_t result = "kDYFEMTLRenderPipelineState_functionHandleWithFunction_stage";
        break;
      case 922:
        uint64_t result = "kDYFEMTLRenderPipelineState_newIntersectionFunctionTableWithDescriptor_stage";
        break;
      case 923:
        uint64_t result = "kDYFEMTLRenderPipelineState_newRenderPipelineStateWithAdditionalBinaryFunctions_error";
        break;
      case 924:
        uint64_t result = "kDYFEMTLRenderPipelineState_newVisibleFunctionTableWithDescriptor_stage";
        break;
      case 925:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setFragmentAccelerationStructure_atBufferIndex";
        break;
      case 926:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setFragmentIntersectionFunctionTable_atBufferIndex";
        break;
      case 927:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setFragmentIntersectionFunctionTables_withBufferRange";
        break;
      case 928:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setFragmentVisibleFunctionTable_atBufferIndex";
        break;
      case 929:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setFragmentVisibleFunctionTables_withBufferRange";
        break;
      case 930:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setTileAccelerationStructure_atBufferIndex";
        break;
      case 931:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setTileIntersectionFunctionTable_atBufferIndex";
        break;
      case 932:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setTileIntersectionFunctionTables_withBufferRange";
        break;
      case 933:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setTileVisibleFunctionTable_atBufferIndex";
        break;
      case 934:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setTileVisibleFunctionTables_withBufferRange";
        break;
      case 935:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setVertexAccelerationStructure_atBufferIndex";
        break;
      case 936:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setVertexIntersectionFunctionTable_atBufferIndex";
        break;
      case 937:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setVertexIntersectionFunctionTables_withBufferRange";
        break;
      case 938:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setVertexVisibleFunctionTable_atBufferIndex";
        break;
      case 939:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setVertexVisibleFunctionTables_withBufferRange";
        break;
      case 940:
        uint64_t result = "kDYFEMTLRenderPipelineState_fragmentFunctionHandleWithFunction";
        break;
      case 941:
        uint64_t result = "kDYFEMTLRenderPipelineState_newFragmentIntersectionFunctionTableWithDescriptor";
        break;
      case 942:
        uint64_t result = "kDYFEMTLRenderPipelineState_newTileIntersectionFunctionTableWithDescriptor";
        break;
      case 943:
        uint64_t result = "kDYFEMTLRenderPipelineState_newVertexIntersectionFunctionTableWithDescriptor";
        break;
      case 944:
        uint64_t result = "kDYFEMTLRenderPipelineState_newVisibleFunctionTableFromFragmentStageWithDescriptor";
        break;
      case 945:
        uint64_t result = "kDYFEMTLRenderPipelineState_newVisibleFunctionTableFromTileStageWithDescriptor";
        break;
      case 946:
        uint64_t result = "kDYFEMTLRenderPipelineState_newVisibleFunctionTableFromVertexStageWithDescriptor";
        break;
      case 947:
        uint64_t result = "kDYFEMTLRenderPipelineState_tileFunctionHandleWithFunction";
        break;
      case 948:
        uint64_t result = "kDYFEMTLRenderPipelineState_vertexFunctionHandleWithFunction";
        break;
      case 949:
        uint64_t result = "kDYFEMTLDevice_newLibraryWithDescriptor_error";
        break;
      case 950:
        uint64_t result = "kDYFEMTLDevice_newLibraryWithDescriptorSPI_error";
        break;
      case 951:
        uint64_t result = "kDYFEMTLDevice_getBVHBuilderLock";
        break;
      case 952:
        uint64_t result = "kDYFEMTLDevice_getRawBVHBuilderPtr";
        break;
      case 953:
        uint64_t result = "kDYFEMTLDevice_setRawBVHBuilderPtr";
        break;
      case 954:
        uint64_t result = "kDYFEMTLDevice_newFunctionWithGLCoreIR_functionType";
        break;
      case 955:
        uint64_t result = "kDYFEMTLDevice_newFunctionWithGLCoreIR_inputsDescription_functionType";
        break;
      case 956:
        uint64_t result = "kDYFEMTLDevice_newFunctionWithGLESIR_functionType";
        break;
      case 957:
        uint64_t result = "kDYFEMTLDevice_newFunctionWithGLESIR_inputsDescription_functionType";
        break;
      case 958:
        uint64_t result = "kDYFEMTLBinaryArchive_addLibraryWithDescriptor_error";
        break;
      case 959:
        uint64_t result = "kDYFEMTLDevice_newLibraryWithDescriptor_completionHandler";
        break;
      case 960:
        uint64_t result = "kDYFEMTLLateEvalEvent_waitUntilSignaledValue_timeoutMS";
        break;
      case 961:
        uint64_t result = "kDYFEMTLLibrary_serializeToURL_error";
        break;
      case 962:
        uint64_t result = "kDYFEMTLSharedEvent_waitUntilSignaledValue_timeoutMS";
        break;
      case 963:
        uint64_t result = "kDYFEMTLDevice_newLibraryWithStitchedDescriptor_completionHandler";
        break;
      case 964:
        uint64_t result = "kDYFEMTLDevice_newLibraryWithStitchedDescriptor_error";
        break;
      case 965:
        uint64_t result = "kDYFEMTLDevice_newLibraryWithStitchedDescriptorSPI_error";
        break;
      case 966:
        uint64_t result = "kDYFEMTLDevice_deserializeInstanceAccelerationStructureFromBytes_primitiveAccelerationStructures_withDescriptor";
        break;
      case 967:
        uint64_t result = "kDYFEMTLDevice_deserializePrimitiveAccelerationStructureFromBytes_withDescriptor";
        break;
      case 968:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_drawMeshThreadgroups_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup";
        break;
      case 969:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_drawMeshThreadgroupsWithIndirectBuffer_indirectBufferOffset_threadsPerObje"
                 "ctThreadgroup_threadsPerMeshThreadgroup";
        break;
      case 970:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_drawMeshThreads_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup";
        break;
      case 971:
        uint64_t result = "kDYFEMTLRenderPipelineState_setUsesMeshShaderEmulation";
        break;
      case 972:
        uint64_t result = "kDYFEMTLRasterizationRateMap_formattedDescription";
        break;
      case 973:
        uint64_t result = "kDYFEMTLRasterizationRateMap_resetUsingDescriptor";
        break;
      case 974:
        uint64_t result = "kDYFEMTLCommandBuffer_encodeDashboardFinalizeForResourceGroup_dashboard_values_indices_count";
        break;
      case 975:
        uint64_t result = "kDYFEMTLBinaryArchive_addMeshRenderPipelineFunctionsWithDescriptor_error";
        break;
      case 976:
        uint64_t result = "kDYFEMTLBinaryArchive_addMeshRenderPipelineFunctionsWithDescriptor_options_error";
        break;
      case 977:
        uint64_t result = "kDYFEMTLBinaryArchive_storeMeshRenderPipelineDescriptor";
        break;
      case 978:
        uint64_t result = "kDYFEMTLDevice_newRenderPipelineStateWithMeshDescriptor_completionHandler";
        break;
      case 979:
        uint64_t result = "kDYFEMTLDevice_newRenderPipelineStateWithMeshDescriptor_error";
        break;
      case 980:
        uint64_t result = "kDYFEMTLDevice_newRenderPipelineStateWithMeshDescriptor_options_completionHandler";
        break;
      case 981:
        uint64_t result = "kDYFEMTLDevice_newRenderPipelineStateWithMeshDescriptor_options_reflection_error";
        break;
      case 982:
        uint64_t result = "kDYFEMTLDevice_writeMeshShaderEmulatorDataStructureHeader_meshShaderPSO_scalingFactor";
        break;
      case 983:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setMeshBuffer_offset_atIndex";
        break;
      case 984:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setMeshBufferOffset_atIndex";
        break;
      case 985:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setMeshBuffers_offsets_withRange";
        break;
      case 986:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setMeshBytes_length_atIndex";
        break;
      case 987:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setMeshSamplerState_atIndex";
        break;
      case 988:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setMeshSamplerState_lodMinClamp_lodMaxClamp_atIndex";
        break;
      case 989:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setMeshSamplerStates_lodMinClamps_lodMaxClamps_withRange";
        break;
      case 990:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setMeshSamplerStates_withRange";
        break;
      case 991:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setMeshTexture_atIndex";
        break;
      case 992:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setMeshTextures_withRange";
        break;
      case 993:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setObjectBuffer_offset_atIndex";
        break;
      case 994:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setObjectBufferOffset_atIndex";
        break;
      case 995:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setObjectBuffers_offsets_withRange";
        break;
      case 996:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setObjectBytes_length_atIndex";
        break;
      case 997:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setObjectSamplerState_atIndex";
        break;
      case 998:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setObjectSamplerState_lodMinClamp_lodMaxClamp_atIndex";
        break;
      case 999:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setObjectSamplerStates_lodMinClamps_lodMaxClamps_withRange";
        break;
      case 1000:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setObjectSamplerStates_withRange";
        break;
      case 1001:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setObjectTexture_atIndex";
        break;
      case 1002:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setObjectTextures_withRange";
        break;
      case 1003:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setObjectThreadgroupMemoryLength_atIndex";
        break;
      case 1004:
        uint64_t result = "kDYFEMTLRenderPipelineState_setEmulationMeshMaxPrimitiveCount";
        break;
      case 1005:
        uint64_t result = "kDYFEMTLRenderPipelineState_setEmulationMeshMaxVertexCount";
        break;
      case 1006:
        uint64_t result = "kDYFEMTLRenderPipelineState_setEmulationMeshShaderIntermediateBufferSlot";
        break;
      case 1007:
        uint64_t result = "kDYFEMTLRenderPipelineState_setEmulationMeshShaderPSO";
        break;
      case 1008:
        uint64_t result = "kDYFEMTLRenderPipelineState_setEmulationMeshSize";
        break;
      case 1009:
        uint64_t result = "kDYFEMTLRenderPipelineState_setEmulationObjectShaderIntermediateBufferSlot";
        break;
      case 1010:
        uint64_t result = "kDYFEMTLRenderPipelineState_setEmulationObjectShaderPSO";
        break;
      case 1011:
        uint64_t result = "kDYFEMTLRenderPipelineState_setEmulationVertexShaderIntermediateBufferSlot";
        break;
      case 1012:
        uint64_t result = "kDYFEMTLRenderPipelineState_meshFunctionHandleWithFunction";
        break;
      case 1013:
        uint64_t result = "kDYFEMTLRenderPipelineState_newMeshIntersectionFunctionTableWithDescriptor";
        break;
      case 1014:
        uint64_t result = "kDYFEMTLRenderPipelineState_newObjectIntersectionFunctionTableWithDescriptor";
        break;
      case 1015:
        uint64_t result = "kDYFEMTLRenderPipelineState_newVisibleFunctionTableFromMeshStageWithDescriptor";
        break;
      case 1016:
        uint64_t result = "kDYFEMTLRenderPipelineState_newVisibleFunctionTableFromObjectStageWithDescriptor";
        break;
      case 1017:
        uint64_t result = "kDYFEMTLRenderPipelineState_objectFunctionHandleWithFunction";
        break;
      case 1018:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_refitAccelerationStructure_descriptor_destination_scratchBu"
                 "ffer_scratchBufferOffset_options";
        break;
      case 1019:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_writeAccelerationStructureSerializationData_toBuffer_offset";
        break;
      case 1020:
        uint64_t result = "kDYFEMTLCommandBuffer_accelerationStructureCommandEncoderWithDescriptor";
        break;
      case 1021:
        uint64_t result = "kDYFEMTLDevice_deserializeInstanceAccelerationStructure_fromBytes_primitiveAccelerationStructures_withDescriptor";
        break;
      case 1022:
        uint64_t result = "kDYFEMTLDevice_deserializePrimitiveAccelerationStructure_fromBytes_withDescriptor";
        break;
      case 1023:
        uint64_t result = "kDYFEMTLDevice_heapAccelerationStructureSizeAndAlignWithDescriptor";
        break;
      case 1024:
        uint64_t result = "kDYFEMTLDevice_heapAccelerationStructureSizeAndAlignWithSize";
        break;
      case 1025:
        uint64_t result = "kDYFEMTLDevice_newAccelerationStructureWithBuffer_offset_resourceIndex";
        break;
      case 1026:
        uint64_t result = "kDYFEMTLDevice_newAccelerationStructureWithSize_withDescriptor";
        break;
      case 1027:
        uint64_t result = "kDYFEMTLBuffer__aneIOSurface";
        break;
      case 1028:
        uint64_t result = "kDYFEMTLHeap_newAccelerationStructureWithDescriptor";
        break;
      case 1029:
        uint64_t result = "kDYFEMTLHeap_newAccelerationStructureWithDescriptor_offset";
        break;
      case 1030:
        uint64_t result = "kDYFEMTLHeap_newAccelerationStructureWithSize";
        break;
      case 1031:
        uint64_t result = "kDYFEMTLHeap_newAccelerationStructureWithSize_offset";
        break;
      case 1032:
        uint64_t result = "kDYFEMTLHeap_newAccelerationStructureWithSize_offset_resourceIndex";
        break;
      case 1033:
        uint64_t result = "kDYFEMTLHeap_newAccelerationStructureWithSize_resourceIndex";
        break;
      case 1034:
        uint64_t result = "kDYFEMTLDevice_newIOCommandQueueWithDescriptor_error";
        break;
      case 1035:
        uint64_t result = "kDYFEMTLDevice_newIOHandleWithURL_compressionType_error";
        break;
      case 1036:
        uint64_t result = "kDYFEMTLDevice_newIOHandleWithURL_error";
        break;
      case 1037:
        uint64_t result = "kDYFEMTLDevice_newPerformanceStateAssertion_error";
        break;
      case 1038:
        uint64_t result = "kDYFEMTLIOCommandBuffer_setStatus";
        break;
      case 1039:
        uint64_t result = "kDYFEMTLIOCommandBuffer_addCompletedHandler";
        break;
      case 1040:
        uint64_t result = "kDYFEMTLIOCommandBuffer_barrier";
        break;
      case 1041:
        uint64_t result = "kDYFEMTLIOCommandBuffer_commit";
        break;
      case 1042:
        uint64_t result = "kDYFEMTLIOCommandBuffer_copyStatusToBuffer_offset";
        break;
      case 1043:
        uint64_t result = "kDYFEMTLIOCommandBuffer_dealloc";
        break;
      case 1044:
        uint64_t result = "kDYFEMTLIOCommandBuffer_encodeSignalEvent_value";
        break;
      case 1045:
        uint64_t result = "kDYFEMTLIOCommandBuffer_encodeWaitForEvent_value";
        break;
      case 1046:
        uint64_t result = "kDYFEMTLIOCommandBuffer_loadBuffer_offset_size_handle_handleOffset";
        break;
      case 1047:
        uint64_t result = "kDYFEMTLIOCommandBuffer_loadTexture_slice_level_size_bytesPerRow_bytesPerImage_dstOrigin_handle_handleOffset";
        break;
      case 1048:
        uint64_t result = "kDYFEMTLIOCommandBuffer_tryCancel";
        break;
      case 1049:
        uint64_t result = "kDYFEMTLIOCommandBuffer_waitUntilCompleted";
        break;
      case 1050:
        uint64_t result = "kDYFEMTLIOCommandQueue_barrier";
        break;
      case 1051:
        uint64_t result = "kDYFEMTLIOCommandQueue_commandBuffer";
        break;
      case 1052:
        uint64_t result = "kDYFEMTLIOCommandQueue_dealloc";
        break;
      case 1053:
        uint64_t result = "kDYFEMTLIOScratchBuffer_dealloc";
        break;
      case 1054:
        uint64_t result = "kDYFEMTLIOScratchBufferAllocator_allocateScratchBufferWithMinimumSize";
        break;
      case 1055:
        uint64_t result = "kDYFEMTLIOScratchBufferAllocator_dealloc";
        break;
      case 1056:
        uint64_t result = "kDYFEMTLIOHandle_dealloc";
        break;
      case 1057:
        uint64_t result = "kDYFEMTLBinaryArchive_getArchiveIDWithError";
        break;
      case 1058:
        uint64_t result = "kDYFEMTLCommandBuffer_presentDrawable_options";
        break;
      case 1059:
        uint64_t result = "kDYFEMTLEvent_setEnableBarrier";
        break;
      case 1060:
        uint64_t result = "kDYFEMTLLateEvalEvent_setEnableBarrier";
        break;
      case 1061:
        uint64_t result = "kDYFEMTLLibrary_bitCodeListForFunctions";
        break;
      case 1062:
        uint64_t result = "kDYFEMTLLibrary_bitCodeWithHash";
        break;
      case 1063:
        uint64_t result = "kDYFEMTLSharedEvent_setEnableBarrier";
        break;
      case 1064:
        uint64_t result = "kDYFEMTLDeadlineProfile_dealloc";
        break;
      case 1065:
        uint64_t result = "kDYFEMTLRenderPipelineState_setEmulationPrimitiveTopology";
        break;
      case 1066:
        uint64_t result = "kDYFEMTLCommandBuffer_commitWithDeadline";
        break;
      case 1067:
        uint64_t result = "kDYFEMTLDevice_newProfileWithExecutionSize";
        break;
      case 1068:
        uint64_t result = "kDYFEMTLCommandBuffer_commitAndWaitUntilSubmittedWithDeadline";
        break;
      case 1069:
        uint64_t result = "kDYFEMTLDevice_sparseTileSizeInBytesForSparsePageSize";
        break;
      case 1070:
        uint64_t result = "kDYFEMTLDevice_sparseTileSizeWithTextureType_pixelFormat_sampleCount_sparsePageSize";
        break;
      case 1071:
        uint64_t result = "kDYFEMTLIOCommandBuffer_setLabel";
        break;
      case 1072:
        uint64_t result = "kDYFEMTLIOCommandBuffer_enqueue";
        break;
      case 1073:
        uint64_t result = "kDYFEMTLIOCommandBuffer_loadBuffer_offset_size_sourceHandle_sourceHandleOffset";
        break;
      case 1074:
        uint64_t result = "kDYFEMTLIOCommandBuffer_loadTexture_slice_level_size_sourceBytesPerRow_sourceBytesPerImage_destinationO"
                 "rigin_sourceHandle_sourceHandleOffset";
        break;
      case 1075:
        uint64_t result = "kDYFEMTLIOCommandBuffer_signalEvent_value";
        break;
      case 1076:
        uint64_t result = "kDYFEMTLIOCommandBuffer_waitForEvent_value";
        break;
      case 1077:
        uint64_t result = "kDYFEMTLIOCommandQueue_setLabel";
        break;
      case 1078:
        uint64_t result = "kDYFEMTLIOCommandQueue_commandBufferWithUnretainedReferences";
        break;
      case 1079:
        uint64_t result = "kDYFEMTLIOHandle_setLabel";
        break;
      case 1080:
        uint64_t result = "kDYFEMTLIOHandle_decompress_size_offset_stagingBuffer_stagingBufferSize";
        break;
      case 1081:
        uint64_t result = "kDYFEMTLIOHandle_getHandleOffset_offset";
        break;
      case 1082:
        uint64_t result = "kDYFEMTLIOHandle_read_size_offset_stagingBuffer_stagingBufferSize";
        break;
      case 1083:
        uint64_t result = "kDYFEMTLIOHandle_readIntoStagingBuffer_offset_stagingBuffer_stagingBufferSize";
        break;
      case 1084:
        uint64_t result = "kDYFEMTLIOHandle_stagingBufferSize_offset";
        break;
      case 1085:
        uint64_t result = "kDYFEMTLIOScratchBufferAllocator_newScratchBufferWithMinimumSize";
        break;
      case 1086:
        uint64_t result = "kDYFEMTLDevice_getMostCompatibleArchitecture";
        break;
      case 1087:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_dispatchThreadsPerTile_inRegion_withRenderTargetArrayIndex";
        break;
      case 1088:
        uint64_t result = "kDYFEMTLDevice_newIOHandleWithURL_compressionMethod_error";
        break;
      case 1089:
        uint64_t result = "kDYFEMTLIOCommandBuffer_addBarrier";
        break;
      case 1090:
        uint64_t result = "kDYFEMTLIOCommandBuffer_loadBytes_size_sourceHandle_sourceHandleOffset";
        break;
      case 1091:
        uint64_t result = "kDYFEMTLIOCommandBuffer_popDebugGroup";
        break;
      case 1092:
        uint64_t result = "kDYFEMTLIOCommandBuffer_pushDebugGroup";
        break;
      case 1093:
        uint64_t result = "kDYFEMTLIOCommandQueue_enqueueBarrier";
        break;
      case 1094:
        uint64_t result = "kDYFEMTLIOFileHandle_setLabel";
        break;
      case 1095:
        uint64_t result = "kDYFEMTLIOFileHandle_dealloc";
        break;
      case 1096:
        uint64_t result = "kDYFEMTLRenderPipelineState_setEmulationPayloadMemoryLength";
        break;
      case 1097:
        uint64_t result = "kDYFEMTLAccelerationStructureCommandEncoder_writeAccelerationStructureTraversalDepth_toBuffer_offset";
        break;
      case 1098:
        uint64_t result = "kDYFEMTLCommandBuffer_encodeConditionalAbortEvent";
        break;
      case 1099:
        uint64_t result = "kDYFEMTLCommandBuffer_encodeSignalEvent_value_agentMask";
        break;
      case 1100:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setBuffer_offset_attributeStride_atIndex";
        break;
      case 1101:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setBufferOffset_attributeStride_atIndex";
        break;
      case 1102:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setBuffers_offsets_attributeStrides_withRange";
        break;
      case 1103:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setBytes_length_attributeStride_atIndex";
        break;
      case 1104:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setThreadgroupDistributionMode";
        break;
      case 1105:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setThreadgroupDistributionModeWithClusterGroupIndex";
        break;
      case 1106:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_setThreadgroupPackingDisabled";
        break;
      case 1107:
        uint64_t result = "kDYFEMTLIndirectComputeCommand_setKernelBuffer_offset_attributeStride_atIndex";
        break;
      case 1108:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_setVertexBuffer_offset_attributeStride_atIndex";
        break;
      case 1109:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setVertexBuffer_offset_attributeStride_atIndex";
        break;
      case 1110:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setVertexBufferOffset_attributeStride_atIndex";
        break;
      case 1111:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setVertexBuffers_offsets_attributeStrides_withRange";
        break;
      case 1112:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_setVertexBytes_length_attributeStride_atIndex";
        break;
      case 1113:
        uint64_t result = "kDYFEMTLResourceStateCommandEncoder_moveTextureMappingsFromTexture_sourceSlice_sourceLevel_sourceOrigin"
                 "_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin";
        break;
      case 1114:
        uint64_t result = "kDYFEMTLDevice_setShouldMaximizeConcurrentCompilation";
        break;
      case 1115:
        uint64_t result = "kDYFEMTLDevice_newEventWithOptions";
        break;
      case 1116:
        uint64_t result = "kDYFEMTLDevice_newSharedEventWithOptions";
        break;
      case 1117:
        uint64_t result = "kDYFEMTLDevice_setCompilerProcessesCount";
        break;
      case 1118:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_drawMeshThreadgroups_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup";
        break;
      case 1119:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_drawMeshThreads_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup";
        break;
      case 1120:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_setMeshBuffer_offset_atIndex";
        break;
      case 1121:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_setObjectBuffer_offset_atIndex";
        break;
      case 1122:
        uint64_t result = "kDYFEMTLIndirectRenderCommand_setObjectThreadgroupMemoryLength_atIndex";
        break;
      case 1123:
        uint64_t result = "kDYFEMTLDevice_newArgumentEncoderWithBufferBinding";
        break;
      case 1124:
        uint64_t result = "kDYFEMTLDevice_newIOFileHandleWithURL_compressionMethod_error";
        break;
      case 1125:
        uint64_t result = "kDYFEMTLDevice_newIOFileHandleWithURL_error";
        break;
      case 1126:
        uint64_t result = "kDYFEMTLIntersectionFunctionTable_setOpaqueCurveIntersectionFunctionWithSignature_atIndex";
        break;
      case 1127:
        uint64_t result = "kDYFEMTLIntersectionFunctionTable_setOpaqueCurveIntersectionFunctionWithSignature_withRange";
        break;
      case 1128:
        uint64_t result = "kDYFEMTLCommandBuffer_setPrivateLoggingBuffer";
        break;
      case 1129:
        uint64_t result = "kDYFEMTLCommandBuffer_setResponsibleTaskIDs_count";
        break;
      case 1130:
        uint64_t result = "kDYFEMTLCommandBuffer_useResidencySet";
        break;
      case 1131:
        uint64_t result = "kDYFEMTLCommandBuffer_useResidencySets_count";
        break;
      case 1132:
        uint64_t result = "kDYFEMTLCommandQueue_addResidencySet";
        break;
      case 1133:
        uint64_t result = "kDYFEMTLCommandQueue_addResidencySets_count";
        break;
      case 1134:
        uint64_t result = "kDYFEMTLCommandQueue_removeResidencySet";
        break;
      case 1135:
        uint64_t result = "kDYFEMTLCommandQueue_removeResidencySets_count";
        break;
      case 1136:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_useResidencySet";
        break;
      case 1137:
        uint64_t result = "kDYFEMTLComputeCommandEncoder_useResidencySets_count";
        break;
      case 1138:
        uint64_t result = "kDYFEMTLDevice_setWritableHeapsEnabled";
        break;
      case 1139:
        uint64_t result = "kDYFEMTLDevice_newResidencySetWithDescriptor_error";
        break;
      case 1140:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_useResidencySet";
        break;
      case 1141:
        uint64_t result = "kDYFEMTLRenderCommandEncoder_useResidencySets_count";
        break;
      case 1142:
        uint64_t result = "kDYFEMTLResidencySet_addHeap";
        break;
      case 1143:
        uint64_t result = "kDYFEMTLResidencySet_addHeaps_count";
        break;
      case 1144:
        uint64_t result = "kDYFEMTLResidencySet_addResource";
        break;
      case 1145:
        uint64_t result = "kDYFEMTLResidencySet_addResources_count";
        break;
      case 1146:
        uint64_t result = "kDYFEMTLResidencySet_commitAdds";
        break;
      case 1147:
        uint64_t result = "kDYFEMTLResidencySet_commitRemoves";
        break;
      case 1148:
        uint64_t result = "kDYFEMTLResidencySet_commitResidency";
        break;
      case 1149:
        uint64_t result = "kDYFEMTLResidencySet_containsHeap";
        break;
      case 1150:
        uint64_t result = "kDYFEMTLResidencySet_containsResource";
        break;
      case 1151:
        uint64_t result = "kDYFEMTLResidencySet_countForHeap";
        break;
      case 1152:
        uint64_t result = "kDYFEMTLResidencySet_countForResource";
        break;
      case 1153:
        uint64_t result = "kDYFEMTLResidencySet_dealloc";
        break;
      case 1154:
        uint64_t result = "kDYFEMTLResidencySet_endResidency";
        break;
      case 1155:
        uint64_t result = "kDYFEMTLResidencySet_removeAllHeaps";
        break;
      case 1156:
        uint64_t result = "kDYFEMTLResidencySet_removeAllResources";
        break;
      case 1157:
        uint64_t result = "kDYFEMTLResidencySet_removeHeap";
        break;
      case 1158:
        uint64_t result = "kDYFEMTLResidencySet_removeHeaps_count";
        break;
      case 1159:
        uint64_t result = "kDYFEMTLResidencySet_removeResource";
        break;
      case 1160:
        uint64_t result = "kDYFEMTLResidencySet_removeResources_count";
        break;
      case 1161:
        uint64_t result = "kDYFEMTLResidencySet_requestResidency";
        break;
      case 1162:
        uint64_t result = "kDYFEMTLResidencySet_setCurrentGeneration";
        break;
      case 1163:
        uint64_t result = "kDYFEMTLResidencySet_setExpiredGeneration";
        break;
      case 1164:
        uint64_t result = "kDYFEMTLResidencySet_commit";
        break;
      case 1165:
        uint64_t result = "kDYFEMTLResidencySet_generationForHeap";
        break;
      case 1166:
        uint64_t result = "kDYFEMTLResidencySet_generationForResource";
        break;
      case 1167:
        uint64_t result = "kDYFEMTLCommandBuffer_encodeSignalEventScheduled_value";
        break;
      case 1168:
        uint64_t result = "kDYFEMTLCommandBuffer_setPrivateData";
        break;
      case 1169:
        uint64_t result = "kDYFEMTLCommandBuffer_setPrivateDataOffset";
        break;
      case 1170:
        uint64_t result = "kDYFEMTLDevice_newLogStateWithDescriptor_error";
        break;
      case 1171:
        uint64_t result = "kDYFEMTLLogState_dealloc";
        break;
      case 1172:
        uint64_t result = "kDYFEMTLResidencySet_addAllocation";
        break;
      case 1173:
        uint64_t result = "kDYFEMTLResidencySet_addAllocations_count";
        break;
      case 1174:
        uint64_t result = "kDYFEMTLResidencySet_containsAllocation";
        break;
      case 1175:
        uint64_t result = "kDYFEMTLResidencySet_generationForAllocation";
        break;
      case 1176:
        uint64_t result = "kDYFEMTLResidencySet_removeAllAllocations";
        break;
      case 1177:
        uint64_t result = "kDYFEMTLResidencySet_removeAllocation";
        break;
      case 1178:
        uint64_t result = "kDYFEMTLResidencySet_removeAllocations_count";
        break;
      default:
        if ("kDYFEMTLBlitCommandEncoder_setLabel" != -18430) {
          goto LABEL_1384;
        }
        uint64_t result = "kDYFEMTLFXTemporalScaler_executionMode";
        break;
    }
  }
  return result;
}

uint64_t GetFuncEnumReceiverType(int a1)
{
  if (a1 > -12545)
  {
    if (a1 > -7169)
    {
      switch(a1)
      {
        case -6144:
        case -6132:
        case -6130:
        case -6105:
        case -6101:
          uint64_t result = 10;
          break;
        case -6143:
        case -6141:
        case -6134:
        case -6133:
        case -6131:
        case -6129:
        case -6122:
        case -6119:
        case -6116:
        case -6111:
        case -6110:
        case -6109:
        case -6096:
        case -6095:
LABEL_4:
          uint64_t result = 36;
          break;
        case -6142:
        case -6126:
        case -6121:
          uint64_t result = 7;
          break;
        case -6140:
        case -6137:
          uint64_t result = 11;
          break;
        case -6139:
          uint64_t result = 15;
          break;
        case -6138:
        case -6135:
        case -6117:
        case -6115:
          uint64_t result = 8;
          break;
        case -6136:
        case -6120:
        case -6112:
        case -6108:
        case -6106:
          uint64_t result = 5;
          break;
        case -6128:
        case -6124:
        case -6104:
        case -6103:
          uint64_t result = 9;
          break;
        case -6127:
        case -6114:
        case -6113:
        case -6107:
          uint64_t result = 6;
          break;
        case -6125:
        case -6123:
        case -6118:
          uint64_t result = 4;
          break;
        case -6102:
        case -6100:
          uint64_t result = 14;
          break;
        case -6099:
        case -6098:
          uint64_t result = 13;
          break;
        case -6097:
          uint64_t result = 12;
          break;
        default:
          switch(a1)
          {
            case -7168:
            case -7166:
            case -7165:
            case -7164:
            case -7163:
            case -7162:
            case -7160:
            case -7159:
            case -7154:
            case -7153:
              uint64_t result = 3;
              break;
            case -7167:
            case -7161:
            case -7158:
            case -7157:
            case -7156:
              uint64_t result = 2;
              break;
            case -7155:
              uint64_t result = 85;
              break;
            default:
              switch(a1)
              {
                case -6656:
                case -6655:
                case -6654:
                case -6653:
                case -6652:
                  uint64_t result = 84;
                  break;
                default:
LABEL_75:
                  uint64_t result = 0;
                  break;
              }
              break;
          }
          break;
      }
    }
    else
    {
      int v2 = a1 + 10240;
      uint64_t result = 1;
      switch(v2)
      {
        case 0:
        case 11:
        case 15:
LABEL_12:
          uint64_t result = 25;
          break;
        case 1:
        case 3:
        case 7:
        case 10:
          goto LABEL_4;
        case 2:
        case 4:
        case 6:
        case 8:
        case 9:
        case 13:
        case 18:
        case 28:
        case 35:
        case 36:
        case 39:
        case 42:
        case 55:
        case 76:
LABEL_8:
          uint64_t result = 80;
          break;
        case 5:
        case 12:
        case 17:
        case 19:
        case 30:
        case 37:
        case 40:
        case 53:
        case 54:
LABEL_18:
          uint64_t result = 22;
          break;
        case 14:
        case 77:
LABEL_50:
          uint64_t result = 75;
          break;
        case 20:
        case 41:
        case 48:
        case 56:
        case 68:
        case 75:
LABEL_15:
          uint64_t result = 71;
          break;
        case 21:
        case 22:
        case 23:
        case 24:
        case 25:
        case 31:
        case 38:
        case 74:
LABEL_25:
          uint64_t result = 57;
          break;
        case 26:
        case 49:
        case 69:
        case 78:
LABEL_34:
          uint64_t result = 29;
          break;
        case 27:
LABEL_36:
          uint64_t result = 74;
          break;
        case 29:
        case 32:
        case 33:
LABEL_30:
          uint64_t result = 50;
          break;
        case 34:
          uint64_t result = 77;
          break;
        case 43:
        case 44:
        case 45:
        case 46:
        case 50:
        case 58:
        case 59:
        case 67:
        case 70:
        case 71:
        case 73:
        case 81:
        case 84:
LABEL_24:
          uint64_t result = 16;
          break;
        case 47:
        case 62:
        case 63:
        case 66:
        case 80:
        case 87:
LABEL_26:
          uint64_t result = 83;
          break;
        case 51:
LABEL_49:
          uint64_t result = 37;
          break;
        case 52:
        case 57:
LABEL_31:
          uint64_t result = 62;
          break;
        case 60:
        case 61:
        case 64:
        case 65:
        case 79:
        case 88:
LABEL_19:
          uint64_t result = 60;
          break;
        case 72:
          return result;
        case 82:
        case 85:
        case 86:
LABEL_14:
          uint64_t result = 17;
          break;
        case 83:
LABEL_37:
          uint64_t result = 43;
          break;
        case 89:
LABEL_40:
          uint64_t result = 23;
          break;
        default:
          goto LABEL_75;
      }
    }
  }
  else if (a1 <= -18431)
  {
    switch(a1)
    {
      case -20480:
      case -20479:
      case -20478:
      case -20477:
      case -20476:
      case -20475:
      case -20474:
        uint64_t result = 39;
        break;
      case -20473:
      case -20472:
      case -20471:
      case -20470:
      case -20469:
      case -20468:
      case -20467:
      case -20466:
      case -20465:
      case -20464:
      case -20463:
      case -20462:
      case -20461:
      case -20460:
      case -20459:
      case -20458:
      case -20457:
      case -20456:
LABEL_23:
        uint64_t result = 40;
        break;
      default:
        if (a1 != -18432 && a1 != -18431) {
          goto LABEL_75;
        }
        goto LABEL_4;
    }
  }
  else
  {
    switch(a1)
    {
      case -16384:
      case -16383:
      case -16382:
      case -16381:
      case -16380:
      case -16379:
      case -16378:
      case -16377:
      case -16376:
      case -16375:
      case -16374:
      case -16373:
      case -16230:
      case -16229:
      case -16213:
      case -16212:
      case -16211:
      case -16210:
      case -16209:
      case -16131:
      case -16124:
      case -15995:
      case -15994:
      case -15993:
      case -15992:
      case -15977:
      case -15976:
      case -15960:
      case -15959:
      case -15958:
      case -15878:
      case -15877:
      case -15876:
      case -15875:
      case -15802:
      case -15800:
      case -15798:
      case -15756:
      case -15755:
      case -15474:
      case -15473:
      case -15472:
      case -15471:
      case -15470:
      case -15469:
        uint64_t result = 21;
        break;
      case -16372:
      case -16371:
      case -16370:
      case -16369:
      case -16368:
      case -16367:
      case -16366:
      case -16228:
      case -16208:
      case -16122:
      case -16113:
      case -16104:
      case -16103:
      case -16102:
      case -16098:
      case -15914:
      case -15904:
      case -15874:
      case -15768:
      case -15767:
      case -15505:
      case -15504:
      case -15357:
        goto LABEL_18;
      case -16365:
      case -16364:
      case -16363:
      case -16362:
      case -16361:
      case -16360:
      case -16359:
      case -16358:
      case -16357:
      case -16356:
      case -16355:
      case -16354:
      case -16353:
      case -16352:
      case -16351:
      case -16350:
      case -16202:
      case -16195:
      case -16164:
      case -16151:
      case -16133:
      case -16065:
      case -16064:
      case -16014:
      case -16013:
      case -16012:
      case -15991:
      case -15990:
      case -15967:
      case -15966:
      case -15908:
      case -15899:
      case -15898:
      case -15897:
      case -15873:
      case -15872:
      case -15871:
      case -15870:
      case -15749:
      case -15712:
      case -15703:
      case -15673:
      case -15587:
      case -15586:
      case -15585:
      case -15584:
      case -15533:
      case -15501:
      case -15500:
      case -15410:
      case -15364:
      case -15326:
      case -15318:
      case -15316:
      case -15286:
      case -15285:
      case -15256:
      case -15255:
      case -15254:
      case -15253:
      case -15217:
      case -15216:
      case -15215:
        goto LABEL_12;
      case -16349:
      case -16348:
      case -16347:
      case -16346:
      case -16345:
      case -16344:
      case -16343:
      case -16342:
      case -16341:
      case -16340:
      case -16134:
      case -15811:
      case -15810:
      case -15809:
      case -15808:
      case -15807:
      case -15806:
      case -15805:
      case -15804:
      case -15701:
      case -15624:
      case -15252:
      case -15251:
      case -15250:
      case -15249:
        uint64_t result = 27;
        break;
      case -16339:
      case -16338:
      case -16337:
      case -16336:
      case -16335:
      case -16334:
      case -16333:
      case -16332:
      case -16331:
      case -16330:
      case -16329:
      case -16328:
      case -16327:
      case -16326:
      case -16325:
      case -16324:
      case -16323:
      case -16322:
      case -16227:
      case -16226:
      case -16220:
      case -16207:
      case -16150:
      case -16149:
      case -16130:
      case -16129:
      case -16100:
      case -16079:
      case -16078:
      case -16047:
      case -16046:
      case -16045:
      case -16044:
      case -16017:
      case -16011:
      case -16010:
      case -16009:
      case -16008:
      case -15965:
      case -15964:
      case -15963:
      case -15869:
      case -15754:
      case -15732:
      case -15711:
      case -15710:
      case -15709:
      case -15623:
      case -15622:
      case -15621:
      case -15583:
      case -15582:
      case -15581:
      case -15580:
      case -15518:
      case -15517:
      case -15516:
      case -15515:
      case -15514:
      case -15513:
      case -15512:
      case -15511:
      case -15510:
      case -15503:
      case -15284:
      case -15283:
      case -15282:
      case -15281:
      case -15280:
      case -15279:
      case -15278:
      case -15248:
      case -15247:
        uint64_t result = 28;
        break;
      case -16321:
      case -16092:
      case -15989:
      case -15868:
      case -15700:
      case -15699:
      case -15620:
      case -15619:
      case -15618:
      case -15579:
      case -15578:
      case -15541:
      case -15540:
        goto LABEL_34;
      case -16320:
        uint64_t result = 34;
        break;
      case -16319:
      case -16318:
      case -16317:
      case -16316:
      case -16315:
      case -16314:
      case -16313:
      case -16312:
      case -16311:
      case -16310:
      case -16309:
      case -16308:
      case -16307:
      case -16306:
      case -16305:
      case -16304:
      case -16303:
      case -16302:
      case -16301:
      case -16300:
      case -16299:
      case -16298:
      case -16297:
      case -16296:
      case -16295:
      case -16294:
      case -16206:
      case -16205:
      case -16200:
      case -16199:
      case -16198:
      case -16197:
      case -16166:
      case -16165:
      case -16163:
      case -16128:
      case -16121:
      case -16120:
      case -16112:
      case -16111:
      case -16101:
      case -16099:
      case -16096:
      case -16095:
      case -16093:
      case -16091:
      case -16090:
      case -16089:
      case -16088:
      case -16075:
      case -16066:
      case -16050:
      case -16049:
      case -16048:
      case -16039:
      case -16037:
      case -16036:
      case -16035:
      case -16031:
      case -16030:
      case -16029:
      case -16018:
      case -16016:
      case -16015:
      case -15998:
      case -15997:
      case -15996:
      case -15980:
      case -15979:
      case -15978:
      case -15972:
      case -15971:
      case -15969:
      case -15968:
      case -15912:
      case -15909:
      case -15902:
      case -15901:
      case -15900:
      case -15892:
      case -15891:
      case -15864:
      case -15863:
      case -15862:
      case -15861:
      case -15860:
      case -15859:
      case -15858:
      case -15857:
      case -15856:
      case -15855:
      case -15854:
      case -15853:
      case -15852:
      case -15851:
      case -15850:
      case -15849:
      case -15848:
      case -15847:
      case -15846:
      case -15845:
      case -15844:
      case -15843:
      case -15842:
      case -15841:
      case -15840:
      case -15839:
      case -15838:
      case -15837:
      case -15836:
      case -15835:
      case -15834:
      case -15833:
      case -15832:
      case -15831:
      case -15814:
      case -15813:
      case -15796:
      case -15793:
      case -15791:
      case -15780:
      case -15779:
      case -15774:
      case -15759:
      case -15758:
      case -15757:
      case -15751:
      case -15747:
      case -15746:
      case -15737:
      case -15731:
      case -15730:
      case -15719:
      case -15718:
      case -15717:
      case -15716:
      case -15708:
      case -15707:
      case -15706:
      case -15705:
      case -15704:
      case -15698:
      case -15697:
      case -15696:
      case -15695:
      case -15694:
      case -15693:
      case -15672:
      case -15671:
      case -15617:
      case -15616:
      case -15615:
      case -15614:
      case -15613:
      case -15612:
      case -15577:
      case -15576:
      case -15575:
      case -15535:
      case -15532:
      case -15531:
      case -15509:
      case -15506:
      case -15499:
      case -15498:
      case -15497:
      case -15496:
      case -15475:
      case -15468:
      case -15467:
      case -15464:
      case -15435:
      case -15434:
      case -15433:
      case -15432:
      case -15431:
      case -15430:
      case -15429:
      case -15428:
      case -15427:
      case -15425:
      case -15421:
      case -15420:
      case -15419:
      case -15418:
      case -15417:
      case -15406:
      case -15405:
      case -15404:
      case -15403:
      case -15402:
      case -15363:
      case -15362:
      case -15361:
      case -15360:
      case -15359:
      case -15358:
      case -15350:
      case -15349:
      case -15348:
      case -15347:
      case -15317:
      case -15315:
      case -15314:
      case -15298:
      case -15296:
      case -15270:
      case -15269:
      case -15268:
      case -15267:
      case -15261:
      case -15260:
      case -15259:
      case -15246:
      case -15245:
      case -15214:
        goto LABEL_4;
      case -16293:
      case -16135:
      case -16123:
      case -16052:
      case -16051:
      case -15830:
      case -15715:
      case -15714:
      case -15713:
      case -15670:
      case -15669:
        goto LABEL_37;
      case -16292:
      case -16291:
      case -16290:
      case -16107:
      case -16106:
      case -16083:
      case -16082:
      case -16081:
      case -16038:
      case -15772:
      case -15609:
      case -15608:
      case -15551:
      case -15550:
      case -15487:
      case -15423:
      case -15323:
      case -15322:
        goto LABEL_31;
      case -16289:
      case -16288:
      case -16287:
      case -16286:
      case -16285:
      case -16284:
      case -16283:
      case -16282:
      case -16162:
      case -16161:
      case -16160:
      case -16028:
      case -16027:
      case -16026:
        uint64_t result = 65;
        break;
      case -16281:
      case -16280:
      case -16279:
      case -16278:
      case -16277:
      case -16276:
      case -16275:
      case -16274:
      case -16273:
      case -16272:
      case -16271:
      case -16270:
      case -16269:
      case -16268:
      case -16267:
      case -16266:
      case -16265:
      case -16264:
      case -16263:
      case -16262:
      case -16261:
      case -16260:
      case -16259:
      case -16258:
      case -16257:
      case -16256:
      case -16255:
      case -16254:
      case -16253:
      case -16252:
      case -16251:
      case -16250:
      case -16249:
      case -16248:
      case -16247:
      case -16246:
      case -16245:
      case -16244:
      case -16243:
      case -16225:
      case -16224:
      case -16223:
      case -16222:
      case -16219:
      case -16218:
      case -16217:
      case -16216:
      case -16215:
      case -16214:
      case -16204:
      case -16203:
      case -16201:
      case -16159:
      case -16158:
      case -16157:
      case -16156:
      case -16155:
      case -16148:
      case -16147:
      case -16146:
      case -16145:
      case -16144:
      case -16143:
      case -16142:
      case -16141:
      case -16140:
      case -16139:
      case -16138:
      case -16137:
      case -16132:
      case -16126:
      case -16125:
      case -16087:
      case -16086:
      case -16085:
      case -16084:
      case -16080:
      case -16077:
      case -16076:
      case -16074:
      case -16043:
      case -16042:
      case -16041:
      case -16040:
      case -16022:
      case -16021:
      case -16020:
      case -16007:
      case -16006:
      case -16005:
      case -16004:
      case -16003:
      case -15988:
      case -15987:
      case -15986:
      case -15985:
      case -15984:
      case -15970:
      case -15962:
      case -15961:
      case -15823:
      case -15822:
      case -15821:
      case -15820:
      case -15819:
      case -15818:
      case -15812:
      case -15750:
      case -15729:
      case -15728:
      case -15727:
      case -15726:
      case -15725:
      case -15724:
      case -15723:
      case -15722:
      case -15721:
      case -15720:
      case -15507:
      case -15486:
      case -15485:
      case -15484:
      case -15483:
      case -15482:
      case -15481:
      case -15480:
      case -15479:
      case -15478:
      case -15477:
      case -15476:
      case -15459:
      case -15458:
      case -15457:
      case -15456:
      case -15455:
      case -15454:
      case -15453:
      case -15452:
      case -15451:
      case -15450:
      case -15449:
      case -15448:
      case -15447:
      case -15446:
      case -15445:
      case -15416:
      case -15415:
      case -15414:
      case -15401:
      case -15400:
      case -15399:
      case -15398:
      case -15397:
      case -15396:
      case -15395:
      case -15394:
      case -15393:
      case -15392:
      case -15391:
      case -15390:
      case -15389:
      case -15388:
      case -15387:
      case -15386:
      case -15385:
      case -15384:
      case -15383:
      case -15382:
      case -15381:
      case -15297:
      case -15275:
      case -15274:
      case -15273:
      case -15272:
      case -15244:
      case -15243:
        uint64_t result = 70;
        break;
      case -16242:
      case -15817:
      case -15463:
      case -15462:
      case -15461:
      case -15460:
      case -15444:
      case -15443:
      case -15442:
      case -15441:
      case -15440:
      case -15439:
      case -15438:
      case -15437:
      case -15436:
      case -15413:
      case -15380:
      case -15379:
      case -15378:
      case -15377:
      case -15376:
      case -15375:
      case -15374:
      case -15373:
      case -15372:
      case -15371:
      case -15370:
      case -15369:
      case -15368:
      case -15367:
      case -15319:
      case -15288:
        goto LABEL_15;
      case -16241:
      case -15983:
      case -15816:
        goto LABEL_50;
      case -16240:
      case -16239:
      case -16238:
      case -16237:
      case -16236:
      case -16235:
      case -16234:
      case -16233:
      case -16232:
      case -16231:
      case -16221:
      case -16196:
      case -16114:
      case -16108:
      case -16094:
      case -15981:
      case -15913:
      case -15910:
      case -15903:
      case -15894:
      case -15815:
      case -15775:
      case -15761:
      case -15760:
      case -15690:
      case -15689:
      case -15688:
      case -15534:
        goto LABEL_8;
      case -16194:
      case -16193:
      case -16192:
      case -16191:
      case -16190:
      case -16189:
      case -16188:
      case -16187:
      case -16186:
      case -16185:
      case -16184:
      case -16183:
      case -16182:
      case -16181:
      case -16180:
      case -16179:
      case -16178:
      case -16177:
      case -16176:
      case -16175:
      case -16174:
      case -16173:
      case -16172:
      case -16171:
      case -16170:
      case -16169:
      case -16168:
      case -16167:
      case -16154:
      case -16153:
      case -16152:
      case -16025:
      case -16024:
      case -16023:
        uint64_t result = 42;
        break;
      case -16136:
      case -16127:
        uint64_t result = 41;
        break;
      case -16119:
      case -16118:
      case -16117:
      case -16116:
      case -16115:
      case -16110:
      case -16109:
      case -16105:
      case -15829:
      case -15828:
      case -15778:
      case -15777:
      case -15356:
      case -15355:
      case -15354:
      case -15353:
      case -15352:
      case -15351:
        goto LABEL_30;
      case -16097:
      case -16032:
        uint64_t result = 81;
        break;
      case -16073:
      case -16072:
      case -16071:
      case -16070:
        uint64_t result = 24;
        break;
      case -16069:
      case -16068:
      case -16067:
      case -16034:
      case -16019:
      case -15736:
      case -15735:
      case -15734:
      case -15733:
        goto LABEL_40;
      case -16063:
      case -16062:
      case -16061:
      case -16060:
      case -16059:
      case -16058:
      case -16057:
      case -16056:
      case -16055:
      case -16054:
      case -16053:
      case -16033:
      case -16002:
      case -16001:
      case -16000:
      case -15999:
      case -15916:
      case -15915:
      case -15627:
      case -15626:
      case -15625:
      case -15549:
      case -15548:
      case -15547:
      case -15546:
      case -15539:
      case -15538:
      case -15537:
      case -15536:
        uint64_t result = 18;
        break;
      case -15982:
        uint64_t result = 78;
        break;
      case -15975:
      case -15974:
      case -15973:
      case -15911:
      case -15907:
      case -15422:
      case -15321:
        uint64_t result = 76;
        break;
      case -15957:
      case -15956:
      case -15955:
      case -15954:
      case -15953:
      case -15952:
      case -15951:
      case -15950:
      case -15949:
      case -15948:
      case -15947:
      case -15946:
      case -15945:
      case -15944:
      case -15943:
      case -15942:
      case -15941:
      case -15940:
      case -15939:
      case -15938:
      case -15937:
      case -15936:
      case -15906:
      case -15276:
      case -15266:
      case -15265:
      case -15264:
      case -15263:
      case -15262:
        uint64_t result = 59;
        break;
      case -15935:
      case -15934:
      case -15933:
      case -15932:
      case -15931:
      case -15930:
      case -15929:
      case -15928:
      case -15927:
      case -15926:
      case -15905:
      case -15827:
      case -15826:
      case -15825:
      case -15824:
      case -15773:
      case -15277:
        uint64_t result = 58;
        break;
      case -15925:
      case -15924:
      case -15923:
      case -15922:
      case -15921:
      case -15920:
      case -15919:
      case -15918:
      case -15917:
      case -15896:
      case -15895:
      case -15766:
      case -15765:
      case -15764:
      case -15763:
      case -15762:
        goto LABEL_25;
      case -15893:
        uint64_t result = 64;
        break;
      case -15890:
      case -15889:
      case -15888:
      case -15887:
      case -15886:
      case -15885:
      case -15884:
      case -15883:
      case -15882:
      case -15881:
        uint64_t result = 82;
        break;
      case -15880:
      case -15879:
      case -15325:
        uint64_t result = 38;
        break;
      case -15867:
      case -15753:
        uint64_t result = 31;
        break;
      case -15866:
      case -15865:
        uint64_t result = 35;
        break;
      case -15803:
      case -15801:
      case -15799:
      case -15797:
      case -15795:
      case -15776:
      case -15771:
      case -15770:
      case -15412:
      case -15411:
        uint64_t result = 68;
        break;
      case -15794:
      case -15792:
      case -15790:
      case -15789:
      case -15788:
      case -15787:
      case -15786:
      case -15785:
      case -15784:
      case -15783:
      case -15782:
      case -15781:
      case -15271:
        goto LABEL_36;
      case -15769:
        uint64_t result = 73;
        break;
      case -15752:
        uint64_t result = 32;
        break;
      case -15748:
        uint64_t result = 30;
        break;
      case -15745:
        uint64_t result = 66;
        break;
      case -15744:
      case -15743:
      case -15742:
      case -15741:
      case -15740:
      case -15739:
      case -15738:
        uint64_t result = 67;
        break;
      case -15702:
        uint64_t result = 26;
        break;
      case -15692:
        uint64_t result = 45;
        break;
      case -15691:
        uint64_t result = 79;
        break;
      case -15687:
      case -15686:
      case -15685:
      case -15684:
      case -15668:
      case -15667:
      case -15666:
      case -15665:
      case -15664:
      case -15663:
      case -15662:
      case -15555:
      case -15554:
      case -15553:
      case -15426:
      case -15409:
      case -15408:
      case -15407:
      case -15327:
        uint64_t result = 19;
        break;
      case -15683:
      case -15682:
      case -15681:
      case -15680:
      case -15679:
      case -15678:
      case -15677:
        uint64_t result = 20;
        break;
      case -15676:
      case -15675:
      case -15674:
      case -15611:
        goto LABEL_49;
      case -15661:
      case -15660:
      case -15659:
      case -15658:
      case -15657:
      case -15656:
      case -15655:
      case -15654:
      case -15653:
      case -15652:
      case -15651:
      case -15650:
      case -15649:
      case -15552:
        goto LABEL_24;
      case -15648:
      case -15647:
      case -15646:
      case -15645:
      case -15644:
      case -15643:
      case -15642:
      case -15641:
      case -15640:
      case -15639:
      case -15638:
      case -15637:
      case -15636:
      case -15635:
      case -15634:
      case -15633:
      case -15632:
      case -15631:
      case -15630:
      case -15629:
      case -15628:
      case -15595:
      case -15594:
      case -15593:
      case -15592:
      case -15591:
      case -15590:
      case -15589:
      case -15588:
      case -15524:
      case -15523:
      case -15522:
      case -15521:
      case -15520:
      case -15519:
      case -15502:
      case -15466:
      case -15465:
      case -15366:
      case -15365:
      case -15287:
        goto LABEL_14;
      case -15610:
        uint64_t result = 44;
        break;
      case -15607:
      case -15606:
      case -15605:
      case -15604:
      case -15603:
      case -15602:
      case -15601:
      case -15600:
      case -15599:
      case -15598:
      case -15597:
      case -15596:
      case -15574:
      case -15573:
      case -15543:
      case -15542:
      case -15528:
      case -15527:
        goto LABEL_26;
      case -15572:
      case -15571:
      case -15570:
      case -15569:
      case -15568:
      case -15567:
      case -15566:
      case -15565:
      case -15564:
      case -15563:
      case -15562:
      case -15561:
      case -15560:
      case -15559:
      case -15558:
      case -15557:
      case -15556:
      case -15545:
      case -15544:
      case -15530:
      case -15529:
      case -15526:
      case -15525:
      case -15258:
      case -15257:
        goto LABEL_19;
      case -15508:
        uint64_t result = 69;
        break;
      case -15495:
        uint64_t result = 46;
        break;
      case -15494:
        uint64_t result = 47;
        break;
      case -15493:
        uint64_t result = 48;
        break;
      case -15492:
        uint64_t result = 49;
        break;
      case -15491:
      case -15490:
      case -15489:
      case -15488:
      case -15424:
      case -15324:
        uint64_t result = 61;
        break;
      case -15346:
      case -15345:
      case -15344:
      case -15343:
      case -15342:
      case -15341:
      case -15340:
      case -15339:
      case -15338:
      case -15337:
      case -15336:
      case -15335:
      case -15313:
      case -15312:
      case -15311:
      case -15310:
      case -15309:
      case -15308:
      case -15295:
      case -15294:
      case -15293:
      case -15292:
        uint64_t result = 51;
        break;
      case -15334:
      case -15333:
      case -15332:
      case -15307:
      case -15306:
      case -15291:
        uint64_t result = 52;
        break;
      case -15331:
        uint64_t result = 55;
        break;
      case -15330:
      case -15329:
      case -15299:
        uint64_t result = 56;
        break;
      case -15328:
      case -15305:
      case -15304:
      case -15303:
      case -15302:
      case -15301:
      case -15300:
        uint64_t result = 54;
        break;
      case -15320:
        uint64_t result = 33;
        break;
      case -15290:
      case -15289:
        uint64_t result = 53;
        break;
      case -15242:
      case -15241:
      case -15240:
      case -15239:
      case -15238:
      case -15237:
      case -15236:
      case -15235:
      case -15234:
      case -15233:
      case -15232:
      case -15231:
      case -15230:
      case -15229:
      case -15228:
      case -15227:
      case -15226:
      case -15225:
      case -15224:
      case -15223:
      case -15222:
      case -15221:
      case -15220:
      case -15219:
      case -15218:
      case -15212:
      case -15211:
      case -15210:
      case -15209:
      case -15208:
      case -15207:
      case -15206:
        uint64_t result = 72;
        break;
      case -15213:
        uint64_t result = 63;
        break;
      default:
        if (a1 != -18430) {
          goto LABEL_75;
        }
        goto LABEL_23;
    }
  }
  return result;
}

BOOL IsFuncEnumVRSubmitCall(int a1)
{
  return a1 == -16034;
}

BOOL IsFuncEnumPatchCall(int a1)
{
  return (a1 + 16147) < 4;
}

BOOL IsFuncEnumConstructor(int a1)
{
  return GetFuncEnumConstructorType(a1) != 0;
}

BOOL IsFuncEnumCreateCommandBuffer(int a1)
{
  return GetFuncEnumConstructorType(a1) == 25;
}

BOOL IsFuncEnumCreateIOCommandBuffer(int a1)
{
  return GetFuncEnumConstructorType(a1) == 51;
}

BOOL IsFuncEnumCreateCommandEncoder(int a1)
{
  int FuncEnumConstructorType = GetFuncEnumConstructorType(a1);

  return IsCommandEncoder(FuncEnumConstructorType);
}

uint64_t IsFuncEnumEncodeWaitForEvent(int a1)
{
  uint64_t result = 1;
  if (a1 > -15340)
  {
    if (a1 == -15339) {
      return result;
    }
    int v3 = -15308;
  }
  else
  {
    if (a1 == -15991) {
      return result;
    }
    int v3 = -15749;
  }
  if (a1 != v3) {
    return 0;
  }
  return result;
}

uint64_t IsFuncEnumEncodeSignalEvent(int a1)
{
  BOOL v1 = a1 == -15340 || a1 == -15309;
  return a1 == -15990 || v1;
}

BOOL IsFuncEnumCreateResource(int a1)
{
  unsigned int FuncEnumConstructorType = GetFuncEnumConstructorType(a1);
  return (FuncEnumConstructorType > 0x33 || ((1 << FuncEnumConstructorType) & 0x8000002000001) == 0)
      && !IsCommandEncoder(FuncEnumConstructorType);
}

BOOL IsFuncEnumDisplayableCall(int a1)
{
  if ((IsFuncEnumDrawCall(a1) & 1) != 0
    || (a1 + 16079) < 2
    || a1 == -16327
    || a1 == -16220
    || (IsFuncEnumBlitCall(a1) & 1) != 0)
  {
    return 1;
  }
  if (a1 <= -15298)
  {
    if (a1 <= -15785)
    {
      if (a1 == -16137 || a1 == -16034) {
        return 1;
      }
      int v3 = -15887;
    }
    else
    {
      if ((a1 + 15784) < 3) {
        return 1;
      }
      int v3 = -15486;
    }
  }
  else
  {
    if ((a1 + 6144) <= 0x2F && ((1 << a1) & 0x8BF1EC9D5395) != 0 || a1 == -15297) {
      return 1;
    }
    int v3 = -15271;
  }
  if (a1 == v3 || IsFuncEnumAccelerationEncodeCall(a1)) {
    return 1;
  }

  return IsFuncEnumPresent(a1);
}

uint64_t IsFuncEnumCommandBufferCommit(int a1)
{
  uint64_t result = 1;
  if (a1 <= -15909)
  {
    if (a1 == -16361) {
      return result;
    }
    int v3 = -16202;
    goto LABEL_7;
  }
  if (a1 != -15908 && a1 != -15318)
  {
    int v3 = -15316;
LABEL_7:
    if (a1 != v3) {
      return 0;
    }
  }
  return result;
}

BOOL IsFuncEnumIOCommandBufferCommit(int a1)
{
  return a1 == -15343;
}

uint64_t IsFuncEnumSharedResourceConstructor(int a1)
{
  uint64_t result = 1;
  if (a1 <= -16097)
  {
    if (a1 > -16164)
    {
      if (a1 == -16163) {
        return result;
      }
      int v3 = -16104;
    }
    else
    {
      if (a1 == -16312) {
        return result;
      }
      int v3 = -16294;
    }
    goto LABEL_11;
  }
  if (((a1 + 16031) > 0x34 || ((1 << (a1 - 97)) & 0x18000000000003) == 0)
    && (a1 + 15914) >= 2)
  {
    int v3 = -16096;
LABEL_11:
    if (a1 != v3) {
      return 0;
    }
  }
  return result;
}

uint64_t IsFuncEnumParallelCommandEncoderCall(int a1)
{
  uint64_t result = 1;
  if (a1 > -16163)
  {
    if ((a1 + 16162) >= 3 && (a1 + 16028) >= 3) {
      return 0;
    }
  }
  else if (((a1 + 16289) > 7 || a1 == -16286) && a1 != -16351)
  {
    return 0;
  }
  return result;
}

uint64_t IsFuncEnumMPSDispatchCall(int a1)
{
  return ((a1 + 6144) < 0x2A) & (0x3806C9D5295uLL >> a1);
}

BOOL IsFuncEnumIndirectExecuteRenderCall(unsigned int a1)
{
  return a1 >> 1 == 2147475667;
}

BOOL IsFuncEnumIndirectExecuteComputeCall(unsigned int a1)
{
  return a1 >> 1 == 2147475666;
}

BOOL IsFuncEnumCommandBufferRelated(int a1)
{
  int FuncEnumReceiverType = GetFuncEnumReceiverType(a1);
  if (FuncEnumReceiverType == 25) {
    return 1;
  }
  int v3 = FuncEnumReceiverType;
  if (IsCommandEncoder(FuncEnumReceiverType) || v3 == 27 && GetFuncEnumConstructorType(a1)) {
    return 1;
  }
  return a1 == -20474 || a1 == -20457;
}

BOOL IsFuncEnumMetalFXEncode(int a1)
{
  return a1 == -20474 || a1 == -20457;
}

BOOL IsFuncIOCommandBufferRelated(int a1)
{
  int FuncEnumReceiverType = GetFuncEnumReceiverType(a1);
  if (FuncEnumReceiverType == 51) {
    return 1;
  }
  if (FuncEnumReceiverType == 52) {
    return GetFuncEnumConstructorType(a1) != 0;
  }
  return 0;
}

uint64_t IsFuncEnumFrameBoundary(int a1)
{
  BOOL v2 = IsFuncEnumPresent(a1);
  BOOL v4 = a1 == -10168 || a1 == -16341;
  return v2 || v4;
}

void FlushChainedRenderPipelineStateInfo(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  entry = find_entry(a3, (unsigned char *)(a2 + 8), 8uLL, 0);
  if (*entry && (uint64_t v8 = *(void *)(*entry + 32)) != 0) {
    uint64_t v9 = *(void *)(v8 + 8);
  }
  else {
    uint64_t v9 = 0;
  }
  long long v10 = *(_OWORD *)(a1 + 16);
  long long v11 = *(_OWORD *)(a1 + 32);
  v88[0] = *(_OWORD *)a1;
  v88[1] = v10;
  uint64_t v12 = *(void *)(a2 + 56);
  v88[2] = v11;
  uint64_t v89 = *(void *)(a1 + 48);
  *(void *)&v88[0] = v9;
  *(_DWORD *)(*(void *)(a1 + 8) + 32) |= a4 | 0x1000;
  if (*(_WORD *)(v12 + 208))
  {
    uint64_t v13 = 0;
    unint64_t v14 = 0;
    do
    {
      EncodeGTMTLBinding((uint64_t *)v88, *(void *)(v12 + 72) + v13, 102);
      ++v14;
      v13 += 56;
    }
    while (v14 < *(unsigned __int16 *)(v12 + 208));
  }
  if (*(_WORD *)(v12 + 198))
  {
    uint64_t v15 = 0;
    unint64_t v16 = 0;
    do
    {
      EncodeGTMTLBinding((uint64_t *)v88, *(void *)(v12 + 24) + v15, 103);
      ++v16;
      v15 += 56;
    }
    while (v16 < *(unsigned __int16 *)(v12 + 198));
  }
  if (*(_WORD *)(v12 + 204))
  {
    uint64_t v17 = 0;
    unint64_t v18 = 0;
    do
    {
      EncodeGTMTLBinding((uint64_t *)v88, *(void *)(v12 + 40) + v17, 130);
      ++v18;
      v17 += 56;
    }
    while (v18 < *(unsigned __int16 *)(v12 + 204));
  }
  if (*(_WORD *)(v12 + 210))
  {
    uint64_t v19 = 0;
    unint64_t v20 = 0;
    do
    {
      EncodeGTMTLBinding((uint64_t *)v88, *(void *)(v12 + 80) + v19, 133);
      ++v20;
      v19 += 56;
    }
    while (v20 < *(unsigned __int16 *)(v12 + 210));
  }
  if (*(_WORD *)(v12 + 206))
  {
    uint64_t v21 = 0;
    unint64_t v22 = 0;
    do
    {
      EncodeGTMTLBinding((uint64_t *)v88, *(void *)(v12 + 48) + v21, 131);
      ++v22;
      v21 += 56;
    }
    while (v22 < *(unsigned __int16 *)(v12 + 206));
  }
  if (*(_WORD *)(v12 + 212))
  {
    uint64_t v23 = 0;
    unint64_t v24 = 0;
    do
    {
      EncodeGTMTLBinding((uint64_t *)v88, *(void *)(v12 + 88) + v23, 134);
      ++v24;
      v23 += 56;
    }
    while (v24 < *(unsigned __int16 *)(v12 + 212));
  }
  if (*(_WORD *)(v12 + 200))
  {
    uint64_t v25 = 0;
    unint64_t v26 = 0;
    do
    {
      EncodeGTMTLBinding((uint64_t *)v88, *(void *)(v12 + 32) + v25, 104);
      ++v26;
      v25 += 56;
    }
    while (v26 < *(unsigned __int16 *)(v12 + 200));
  }
  unsigned int v27 = *(unsigned __int16 *)(v12 + 202);
  if (*(_WORD *)(v12 + 202))
  {
    uint64_t v28 = 0;
    unint64_t v29 = 0;
    char v30 = 0;
    do
    {
      uint64_t v31 = *(void *)(v12 + 56);
      uint64_t v32 = v31 + v28;
      int v33 = *(unsigned __int8 *)(v31 + v28 + 16);
      if (v33 != 17 || *(unsigned char *)(v32 + 38))
      {
        if (*(void *)(v12 + 64) && (v33 == 16 || v33 == 17 && *(unsigned char *)(v31 + v28 + 38) == 1))
        {
          char v30 = 1;
          uint64_t v32 = *(void *)(v12 + 64);
        }
        EncodeGTMTLBinding((uint64_t *)v88, v32, 121);
        unsigned int v27 = *(unsigned __int16 *)(v12 + 202);
      }
      ++v29;
      v28 += 56;
    }
    while (v29 < v27);
  }
  else
  {
    char v30 = 0;
  }
  uint64_t v34 = *(void *)(v12 + 64);
  if (v34)
  {
    int v35 = *(unsigned __int8 *)(v34 + 16);
    if (v35 == 16 || v35 == 17 && *(unsigned char *)(v34 + 38) == 1)
    {
      int v36 = *(unsigned __int16 *)(v12 + 208)
          + *(unsigned __int16 *)(v12 + 198)
          + *(unsigned __int16 *)(v12 + 200)
          + *(unsigned __int16 *)(v12 + 204)
          + *(unsigned __int16 *)(v12 + 210)
          + *(unsigned __int16 *)(v12 + 206);
      int v37 = *(unsigned __int16 *)(v12 + 212);
      uint64_t v38 = 56;
      if (v36 + v37) {
        uint64_t v38 = 32;
      }
      uint64_t v39 = 200;
      if (!(v36 + v37)) {
        uint64_t v39 = 202;
      }
      uint64_t v40 = *(unsigned __int16 *)(v12 + v39);
      if (v40)
      {
        uint64_t v41 = (unsigned char *)(*(void *)(v12 + v38) + 38);
        do
        {
          int v42 = *(v41 - 22);
          if (v42 == 17)
          {
            if (*v41 == 1) {
              goto LABEL_59;
            }
          }
          else if (v42 == 16)
          {
            goto LABEL_59;
          }
          v41 += 56;
          --v40;
        }
        while (v40);
      }
      if ((v30 & 1) == 0)
      {
        if (v36 == -v37) {
          int v43 = 121;
        }
        else {
          int v43 = 104;
        }
        EncodeGTMTLBinding((uint64_t *)v88, v34, v43);
      }
    }
  }
LABEL_59:
  if (*(void *)(v12 + 120))
  {
    fbstream_write(*(void *)(a1 + 24), *(void *)(a1 + 8), **(unsigned int **)(a1 + 8));
    uint64_t v44 = *(void *)(a1 + 8);
    *(_DWORD *)(v44 + 32) = 0;
    *(_OWORD *)uint64_t v44 = 0u;
    *(_OWORD *)(v44 + 16) = 0u;
    uint64_t v45 = *(void *)(a1 + 8);
    *(_DWORD *)(v45 + 32) = 198;
    *(void *)uint64_t v45 = 0xFFFFD01000000024;
    uint64_t v46 = *(uint64_t **)(v12 + 112);
    uint64_t v47 = *(const void **)(v12 + 120);
    uint64_t v48 = *(void *)(a1 + 32);
    HashBytes(v46, (unint64_t)v47, __s);
    GTMTLCaptureState_storePointer(v48, __s, v46, v47);
    long long v92 = v97;
    long long v93 = v98;
    char v94 = v99;
    long long v90 = *(_OWORD *)__s;
    long long v91 = v96;
    long long v97 = 0uLL;
    *(void *)__s = v9;
    *(void *)&__s[8] = 116;
    *(void *)&long long v96 = &v90;
    *((void *)&v96 + 1) = v47;
    DYTraceEncode_InternalData((uint64_t)__s, *(unsigned int **)(a1 + 8), *(unsigned int *)(a1 + 16), v49, 0);
  }
  if (*(_WORD *)(v12 + 214))
  {
    unint64_t v50 = 0;
    do
    {
      fbstream_write(*(void *)(a1 + 24), *(void *)(a1 + 8), **(unsigned int **)(a1 + 8));
      uint64_t v51 = *(void *)(a1 + 8);
      *(_DWORD *)(v51 + 32) = 0;
      *(_OWORD *)uint64_t v51 = 0u;
      *(_OWORD *)(v51 + 16) = 0u;
      uint64_t v52 = *(void *)(a1 + 8);
      *(_DWORD *)(v52 + 32) = 198;
      *(void *)uint64_t v52 = 0xFFFFD01000000024;
      SaveFileWithURL(*(void *)(a1 + 32), *(char **)(*(void *)(v12 + 104) + 8 * v50), __s, 0, 1);
      *((void *)&v91 + 1) = 0;
      long long v92 = 0uLL;
      *(void *)&long long v90 = v9;
      *((void *)&v90 + 1) = 126;
      *(void *)&long long v91 = __s;
      *((void *)&v91 + 1) = *(void *)(*(void *)(v12 + 104) + 8 * v50);
      DYTraceEncode_InternalData((uint64_t)&v90, *(unsigned int **)(a1 + 8), *(unsigned int *)(a1 + 16), v53, 0);
      ++v50;
    }
    while (v50 < *(unsigned __int16 *)(v12 + 214));
  }
  unint64_t v54 = *(unsigned int **)(a1 + 8);
  unsigned int v55 = v54[8];
  if ((v55 & 0x1000) != 0) {
    unsigned int v56 = v55 & 0xFFFFEFFF;
  }
  else {
    unsigned int v56 = v55 | 0x2000;
  }
  v54[8] = v56;
  unint64_t v57 = *v54;
  if ((v56 & 0x1000) != 0)
  {
    uint64_t v58 = *v54;
    uint64_t v59 = v54;
    do
    {
      uint64_t v59 = (unsigned int *)((char *)v59 + v58);
      uint64_t v58 = *v59;
      v57 += v58;
    }
    while ((*((unsigned char *)v59 + 33) & 0x20) == 0);
  }
  fbstream_write(*(void *)(a1 + 24), (uint64_t)v54, v57);
  uint64_t v60 = *(void *)(a2 + 96);
  if (v60)
  {
    int v61 = *(void **)(a1 + 8);
    v61[2] = 0;
    v61[3] = 0;
    v61[1] = 0;
    v61[4] = 0x77754300000004;
    void *v61 = 0xFFFFD81400000028;
    v61[5] = v9;
    v61[6] = v60;
    *(_DWORD *)int v61 = 56;
    uint64_t v62 = *(unsigned int **)(a1 + 8);
    int v63 = v62[8] | a4;
    v62[8] = v63;
    unint64_t v64 = *v62;
    if ((v63 & 0x1000) != 0)
    {
      uint64_t v65 = *v62;
      uint64_t v66 = v62;
      do
      {
        uint64_t v66 = (unsigned int *)((char *)v66 + v65);
        uint64_t v65 = *v66;
        v64 += v65;
      }
      while ((*((unsigned char *)v66 + 33) & 0x20) == 0);
    }
    fbstream_write(*(void *)(a1 + 24), (uint64_t)v62, v64);
  }
  uint64_t v67 = *(unsigned int *)(a2 + 412);
  if (v67)
  {
    uint64_t v68 = *(void **)(a1 + 8);
    v68[2] = 0;
    v68[3] = 0;
    v68[1] = 0;
    v68[4] = 0x6C754300000006;
    *uint64_t v68 = 0xFFFFD83800000028;
    v68[5] = v9;
    v68[6] = v67;
    *(_DWORD *)uint64_t v68 = 56;
    int v69 = *(unsigned int **)(a1 + 8);
    int v70 = v69[8] | a4;
    v69[8] = v70;
    unint64_t v71 = *v69;
    if ((v70 & 0x1000) != 0)
    {
      uint64_t v72 = *v69;
      v73 = v69;
      do
      {
        v73 = (unsigned int *)((char *)v73 + v72);
        uint64_t v72 = *v73;
        v71 += v72;
      }
      while ((*((unsigned char *)v73 + 33) & 0x20) == 0);
    }
    fbstream_write(*(void *)(a1 + 24), (uint64_t)v69, v71);
  }
  int v74 = *(_DWORD *)(a2 + 408);
  uint64_t v75 = *(void *)(a1 + 8);
  *(void *)(v75 + 16) = 0;
  *(void *)(v75 + 24) = 0;
  *(void *)(v75 + 8) = 0;
  *(void *)(v75 + 32) = 0x69754300000006;
  *(void *)uint64_t v75 = 0xFFFFD83000000028;
  *(void *)(v75 + 40) = v9;
  *(_DWORD *)(v75 + 48) = v74;
  *(_DWORD *)uint64_t v75 = 52;
  uint64_t v76 = *(unsigned int **)(a1 + 8);
  int v77 = v76[8] | a4;
  v76[8] = v77;
  unint64_t v78 = *v76;
  if ((v77 & 0x1000) != 0)
  {
    uint64_t v79 = *v76;
    unint64_t v80 = v76;
    do
    {
      unint64_t v80 = (unsigned int *)((char *)v80 + v79);
      uint64_t v79 = *v80;
      v78 += v79;
    }
    while ((*((unsigned char *)v80 + 33) & 0x20) == 0);
  }
  fbstream_write(*(void *)(a1 + 24), (uint64_t)v76, v78);
  uint64_t v81 = *(void *)(a2 + 112);
  if (v81)
  {
    uint64_t v82 = *(void **)(a1 + 8);
    v82[2] = 0;
    v82[3] = 0;
    v82[1] = 0;
    v82[4] = 0x77754300000004;
    *uint64_t v82 = 0xFFFFD84B00000028;
    v82[5] = v9;
    v82[6] = v81;
    *(_DWORD *)uint64_t v82 = 56;
    uint64_t v83 = *(unsigned int **)(a1 + 8);
    int v84 = v83[8] | a4;
    v83[8] = v84;
    unint64_t v85 = *v83;
    if ((v84 & 0x1000) != 0)
    {
      uint64_t v86 = *v83;
      uint64_t v87 = v83;
      do
      {
        uint64_t v87 = (unsigned int *)((char *)v87 + v86);
        uint64_t v86 = *v87;
        v85 += v86;
      }
      while ((*((unsigned char *)v87 + 33) & 0x20) == 0);
    }
    fbstream_write(*(void *)(a1 + 24), (uint64_t)v83, v85);
  }
}

void EncodeGTMTLBinding(uint64_t *a1, uint64_t a2, int a3)
{
  if (*(unsigned char *)(a2 + 16) == 17 && !*(unsigned char *)(a2 + 38)) {
    return;
  }
  fbstream_write(a1[3], a1[1], *(unsigned int *)a1[1]);
  uint64_t v6 = a1[1];
  *(_DWORD *)(v6 + 32) = 0;
  *(_OWORD *)uint64_t v6 = 0u;
  *(_OWORD *)(v6 + 16) = 0u;
  uint64_t v7 = a1[1];
  *(_DWORD *)(v7 + 32) = 198;
  *(void *)uint64_t v7 = 0xFFFFD01000000024;
  unsigned int v8 = *(unsigned __int8 *)(a2 + 16);
  if (v8 <= 0x10)
  {
    switch(*(unsigned char *)(a2 + 16))
    {
      case 0:
        uint64_t v9 = *(unsigned __int8 **)(a2 + 8);
        if (!v9) {
          goto LABEL_26;
        }
        int v10 = *v9;
        if (v10 != 1)
        {
          if (v10 == 60 && v9[22] == 1) {
            uint64_t v9 = (unsigned __int8 *)*((void *)v9 + 1);
          }
          else {
LABEL_26:
          }
            uint64_t v9 = 0;
        }
        EncodeGTMTLBindingStart(a1, a2, a3);
        unsigned int v55 = (_DWORD *)a1[1];
        *(void *)((char *)v55 + *v55) = *(unsigned __int16 *)(a2 + 28);
        *v55 += 8;
        unsigned int v56 = (_DWORD *)a1[1];
        *(void *)((char *)v56 + *v56) = *(unsigned int *)(a2 + 24);
        *v56 += 8;
        unint64_t v57 = (_DWORD *)a1[1];
        *(void *)((char *)v57 + *v57) = *(unsigned __int8 *)(a2 + 30);
        *v57 += 8;
        uint64_t v58 = (_DWORD *)a1[1];
        *((unsigned char *)v58 + (*v58)++) = v9 != 0;
        uint64_t v59 = (_DWORD *)a1[1];
        *((unsigned char *)v59 + (*v59)++) = *(unsigned char *)(a2 + 31);
        uint64_t v60 = (_DWORD *)a1[1];
        uint64_t v61 = *v60;
        int v62 = (v61 + 3) & 0xFFFFFFFC;
        bzero((char *)v60 + v61, (v62 - v61));
        *uint64_t v60 = v62;
        if (!v9) {
          return;
        }
        uint64_t v23 = a1;
        uint64_t v22 = (uint64_t)v9;
        break;
      case 1:
        uint64_t v31 = *(void *)(a2 + 8);
        if (v31)
        {
          uint64_t v32 = *(unsigned __int8 *)(v31 + 22);
          uint64_t v33 = *(unsigned int *)(v31 + 16);
          BOOL v34 = *(void *)(v31 + 8) != 0;
        }
        else
        {
          BOOL v34 = 0;
          uint64_t v33 = 0;
          uint64_t v32 = 0;
        }
        EncodeGTMTLBindingStart(a1, a2, a3);
        unint64_t v64 = (_DWORD *)a1[1];
        *(void *)((char *)v64 + *v64) = *(unsigned __int16 *)(a2 + 28);
        *v64 += 8;
        uint64_t v65 = (_DWORD *)a1[1];
        *(void *)((char *)v65 + *v65) = *(unsigned int *)(a2 + 24);
        *v65 += 8;
        uint64_t v66 = (_DWORD *)a1[1];
        *(void *)((char *)v66 + *v66) = v32;
        *v66 += 8;
        uint64_t v67 = (_DWORD *)a1[1];
        *(void *)((char *)v67 + *v67) = v33;
        *v67 += 8;
        uint64_t v68 = (_DWORD *)a1[1];
        *((unsigned char *)v68 + (*v68)++) = v34;
        int v69 = (_DWORD *)a1[1];
        uint64_t v70 = *v69;
        int v71 = (v70 + 3) & 0xFFFFFFFC;
        bzero((char *)v69 + v70, (v71 - v70));
        *int v69 = v71;
        if (!v34) {
          return;
        }
        uint64_t v22 = *(void *)(v31 + 8);
        uint64_t v23 = a1;
        goto LABEL_33;
      case 2:
        EncodeGTMTLBindingStart(a1, a2, a3);
        int v35 = (_DWORD *)a1[1];
        *(void *)((char *)v35 + *v35) = *(unsigned __int8 *)(a2 + 25);
        *v35 += 8;
        int v36 = (_DWORD *)a1[1];
        *(void *)((char *)v36 + *v36) = *(unsigned __int8 *)(a2 + 24);
        *v36 += 8;
        int v37 = (_DWORD *)a1[1];
        *(void *)((char *)v37 + *v37) = *(unsigned __int8 *)(a2 + 26);
        *v37 += 8;
        uint64_t v38 = (_DWORD *)a1[1];
        *((unsigned char *)v38 + (*v38)++) = *(unsigned char *)(a2 + 27);
        uint64_t v39 = (_DWORD *)a1[1];
        uint64_t v40 = *v39;
        int v41 = (v40 + 3) & 0xFFFFFFFC;
        bzero((char *)v39 + v40, (v41 - v40));
        _DWORD *v39 = v41;
        return;
      case 3:
        goto LABEL_5;
      default:
        if (v8 != 16) {
          return;
        }
        uint64_t v24 = *(void *)(a2 + 24);
        BOOL v25 = *(void *)(a2 + 8) != 0;
        BOOL v26 = v24 != 0;
        EncodeGTMTLBindingStart(a1, a2, a3);
        unsigned int v27 = (_DWORD *)a1[1];
        *((unsigned char *)v27 + (*v27)++) = v25;
        uint64_t v28 = (_DWORD *)a1[1];
        uint64_t v29 = *v28;
        int v30 = (v29 + 3) & 0xFFFFFFFC;
        bzero((char *)v28 + v29, (v30 - v29));
        _DWORD *v28 = v30;
        goto LABEL_23;
    }
  }
  else
  {
    if (v8 - 24 < 4)
    {
LABEL_5:
      EncodeGTMTLBindingStart(a1, a2, a3);
      return;
    }
    if (v8 == 17)
    {
      uint64_t v24 = *(void *)(a2 + 24);
      BOOL v42 = *(void *)(a2 + 8) != 0;
      BOOL v26 = v24 != 0;
      EncodeGTMTLBindingStart(a1, a2, a3);
      int v43 = (_DWORD *)a1[1];
      *((unsigned char *)v43 + (*v43)++) = v42;
      uint64_t v44 = (_DWORD *)a1[1];
      uint64_t v45 = *v44;
      int v46 = (v45 + 3) & 0xFFFFFFFC;
      bzero((char *)v44 + v45, (v46 - v45));
      _DWORD *v44 = v46;
      uint64_t v47 = (_DWORD *)a1[1];
      *(void *)((char *)v47 + *v47) = *(unsigned __int8 *)(a2 + 38);
      *v47 += 8;
LABEL_23:
      uint64_t v48 = (_DWORD *)a1[1];
      *(void *)((char *)v48 + *v48) = *(unsigned int *)(a2 + 32);
      *v48 += 8;
      uint64_t v49 = (_DWORD *)a1[1];
      *((unsigned char *)v49 + (*v49)++) = v26;
      unint64_t v50 = (_DWORD *)a1[1];
      *((unsigned char *)v50 + (*v50)++) = *(unsigned char *)(a2 + 37);
      uint64_t v51 = (_DWORD *)a1[1];
      uint64_t v52 = *v51;
      int v53 = (v52 + 3) & 0xFFFFFFFC;
      bzero((char *)v51 + v52, (v53 - v52));
      _DWORD *v51 = v53;
      unint64_t v54 = (_DWORD *)a1[1];
      *(void *)((char *)v54 + *v54) = *(unsigned __int8 *)(a2 + 36);
      *v54 += 8;
      if (!v24) {
        uint64_t v24 = *(void *)(a2 + 8);
      }
      uint64_t v23 = a1;
      uint64_t v22 = v24;
LABEL_33:
      unsigned int v63 = 1;
      goto LABEL_34;
    }
    if (v8 != 35) {
      return;
    }
    EncodeGTMTLBindingStart(a1, a2, a3);
    long long v11 = (_DWORD *)a1[1];
    *((unsigned char *)v11 + (*v11)++) = *(unsigned char *)(a2 + 24);
    uint64_t v12 = (_DWORD *)a1[1];
    *((unsigned char *)v12 + (*v12)++) = *(unsigned char *)(a2 + 25);
    uint64_t v13 = (_DWORD *)a1[1];
    uint64_t v14 = *v13;
    int v15 = (v14 + 3) & 0xFFFFFFFC;
    bzero((char *)v13 + v14, (v15 - v14));
    *uint64_t v13 = v15;
    unint64_t v16 = (_DWORD *)a1[1];
    *(_DWORD *)((char *)v16 + *v16) = *(unsigned __int16 *)(a2 + 48);
    *v16 += 4;
    uint64_t v17 = (_DWORD *)a1[1];
    *(_DWORD *)((char *)v17 + *v17) = *(unsigned __int16 *)(a2 + 50);
    *v17 += 4;
    unint64_t v18 = (_DWORD *)a1[1];
    *((unsigned char *)v18 + (*v18)++) = *(unsigned char *)(a2 + 52);
    uint64_t v19 = (_DWORD *)a1[1];
    uint64_t v20 = *v19;
    int v21 = (v20 + 3) & 0xFFFFFFFC;
    bzero((char *)v19 + v20, (v21 - v20));
    *uint64_t v19 = v21;
    EncodeGTMTLStructType(a1, *(void *)(a2 + 32), 0);
    uint64_t v22 = *(void *)(a2 + 40);
    uint64_t v23 = a1;
  }
  unsigned int v63 = 0;
LABEL_34:

  EncodeGTMTLStructType(v23, v22, v63);
}

void EncodeGTMTLBindingStart(uint64_t *a1, uint64_t a2, int a3)
{
  v20[0] = *(_OWORD *)"CiSululuiul";
  memset(&v20[1], 0, 48);
  __strcat_chk();
  uint64_t v6 = *a1;
  uint64_t v7 = (_DWORD *)a1[1];
  size_t v8 = strlen((const char *)v20);
  int v9 = v8 + 1;
  memcpy((char *)v7 + *v7, v20, v8 + 1);
  *v7 += v9;
  int v10 = (_DWORD *)a1[1];
  uint64_t v11 = *v10;
  LODWORD(v7) = (v11 + 3) & 0xFFFFFFFC;
  bzero((char *)v10 + v11, (v7 - v11));
  *int v10 = v7;
  uint64_t v12 = (_DWORD *)a1[1];
  *(void *)((char *)v12 + *v12) = v6;
  *v12 += 8;
  uint64_t v13 = (_DWORD *)a1[1];
  *(_DWORD *)((char *)v13 + *v13) = a3;
  *v13 += 4;
  EncodeString((int *)a1[1], *(char **)a2);
  uint64_t v14 = (_DWORD *)a1[1];
  uint64_t v15 = *v14;
  LODWORD(v10) = (v15 + 3) & 0xFFFFFFFC;
  bzero((char *)v14 + v15, (v10 - v15));
  *uint64_t v14 = v10;
  unint64_t v16 = (_DWORD *)a1[1];
  *(void *)((char *)v16 + *v16) = *(unsigned __int8 *)(a2 + 16);
  *v16 += 8;
  uint64_t v17 = (_DWORD *)a1[1];
  *(void *)((char *)v17 + *v17) = *(unsigned __int8 *)(a2 + 17);
  *v17 += 8;
  unint64_t v18 = (_DWORD *)a1[1];
  *(_DWORD *)((char *)v18 + *v18) = *(unsigned char *)(a2 + 19) & 1;
  *v18 += 4;
  uint64_t v19 = (_DWORD *)a1[1];
  *(void *)((char *)v19 + *v19) = *(unsigned __int8 *)(a2 + 18);
  *v19 += 8;
}

void EncodeGTMTLStructType(uint64_t *a1, uint64_t a2, unsigned int a3)
{
  uint64_t v5 = *a1;
  fbstream_write(a1[3], a1[1], *(unsigned int *)a1[1]);
  uint64_t v6 = a1[1];
  *(_DWORD *)(v6 + 32) = 0;
  *(_OWORD *)uint64_t v6 = 0u;
  *(_OWORD *)(v6 + 16) = 0u;
  uint64_t v7 = a1[1];
  *(_DWORD *)(v7 + 32) = 198;
  *(void *)uint64_t v7 = 0xFFFFD01000000024;
  size_t v8 = (char *)a1[1];
  strcpy(&v8[*(unsigned int *)v8], "Ci");
  *(_DWORD *)v8 += 3;
  int v9 = (_DWORD *)a1[1];
  uint64_t v10 = *v9;
  int v11 = (v10 + 3) & 0xFFFFFFFC;
  bzero((char *)v9 + v10, (v11 - v10));
  *int v9 = v11;
  uint64_t v12 = (_DWORD *)a1[1];
  uint64_t v58 = v5;
  *(void *)((char *)v12 + *v12) = v5;
  *v12 += 8;
  uint64_t v13 = (_DWORD *)a1[1];
  *(_DWORD *)((char *)v13 + *v13) = *(_DWORD *)(a2 + 16);
  *v13 += 4;
  if (*(_DWORD *)(a2 + 16))
  {
    uint64_t v14 = 0;
    unint64_t v15 = 0;
    uint64_t v57 = a2;
    do
    {
      uint64_t v16 = *(void *)(a2 + 8);
      uint64_t v17 = v16 + v14;
      int v18 = *(unsigned __int8 *)(v16 + v14 + 24);
      if (v18 == 60)
      {
        BOOL v19 = 0;
        BOOL v20 = 0;
        BOOL v21 = *(void *)(v17 + 8) != 0;
      }
      else
      {
        if (v18 == 2)
        {
          BOOL v20 = 0;
          BOOL v19 = *(void *)(v16 + v14 + 8) != 0;
        }
        else
        {
          BOOL v19 = 0;
          BOOL v20 = v18 == 1 && *(void *)(v16 + v14 + 8) != 0;
        }
        BOOL v21 = 0;
      }
      fbstream_write(a1[3], a1[1], *(unsigned int *)a1[1]);
      uint64_t v22 = a1[1];
      *(_DWORD *)(v22 + 32) = 0;
      *(_OWORD *)uint64_t v22 = 0u;
      *(_OWORD *)(v22 + 16) = 0u;
      uint64_t v23 = a1[1];
      *(_DWORD *)(v23 + 32) = 198;
      *(void *)uint64_t v23 = 0xFFFFD01000000024;
      uint64_t v24 = (char *)a1[1];
      strcpy(&v24[*(unsigned int *)v24], "CiSulbbulbb");
      *(_DWORD *)v24 += 12;
      BOOL v25 = (_DWORD *)a1[1];
      uint64_t v26 = *v25;
      int v27 = (v26 + 3) & 0xFFFFFFFC;
      bzero((char *)v25 + v26, (v27 - v26));
      _DWORD *v25 = v27;
      uint64_t v28 = (_DWORD *)a1[1];
      *(void *)((char *)v28 + *v28) = v58;
      *v28 += 8;
      uint64_t v29 = (_DWORD *)a1[1];
      uint64_t v60 = v16 + v14;
      *(_DWORD *)((char *)v29 + *v29) = *(unsigned __int8 *)(v17 + 24);
      *v29 += 4;
      EncodeString((int *)a1[1], *(char **)(v16 + v14));
      int v30 = (_DWORD *)a1[1];
      uint64_t v31 = *v30;
      int v32 = (v31 + 3) & 0xFFFFFFFC;
      bzero((char *)v30 + v31, (v32 - v31));
      _DWORD *v30 = v32;
      uint64_t v33 = (_DWORD *)a1[1];
      *(void *)((char *)v33 + *v33) = *(unsigned int *)(v16 + v14 + 16);
      *v33 += 8;
      BOOL v34 = (_DWORD *)a1[1];
      *((unsigned char *)v34 + (*v34)++) = v20;
      int v35 = (_DWORD *)a1[1];
      *((unsigned char *)v35 + (*v35)++) = v19;
      int v36 = (_DWORD *)a1[1];
      uint64_t v37 = *v36;
      int v38 = (v37 + 3) & 0xFFFFFFFC;
      bzero((char *)v36 + v37, (v38 - v37));
      _DWORD *v36 = v38;
      uint64_t v39 = (_DWORD *)a1[1];
      *(void *)((char *)v39 + *v39) = *(unsigned __int16 *)(v16 + v14 + 22);
      *v39 += 8;
      uint64_t v40 = (_DWORD *)a1[1];
      *((unsigned char *)v40 + (*v40)++) = a3;
      int v41 = (_DWORD *)a1[1];
      *((unsigned char *)v41 + (*v41)++) = v21;
      BOOL v42 = (_DWORD *)a1[1];
      uint64_t v43 = *v42;
      LODWORD(v25) = (v43 + 3) & 0xFFFFFFFC;
      bzero((char *)v42 + v43, (v25 - v43));
      *BOOL v42 = v25;
      if (a3)
      {
        if ((*(unsigned char *)(v60 + 24) - 62) > 0xFu) {
          uint64_t v44 = 0;
        }
        else {
          uint64_t v44 = word_1DFC40[(*(unsigned char *)(v60 + 24) - 62)];
        }
        fbstream_write(a1[3], a1[1], *(unsigned int *)a1[1]);
        uint64_t v45 = a1[1];
        *(_DWORD *)(v45 + 32) = 0;
        *(_OWORD *)uint64_t v45 = 0u;
        *(_OWORD *)(v45 + 16) = 0u;
        uint64_t v46 = a1[1];
        *(_DWORD *)(v46 + 32) = 198;
        *(void *)uint64_t v46 = 0xFFFFD01000000024;
        uint64_t v47 = (char *)a1[1];
        strcpy(&v47[*(unsigned int *)v47], "Culul");
        *(_DWORD *)v47 += 6;
        uint64_t v48 = (_DWORD *)a1[1];
        uint64_t v49 = *v48;
        int v50 = (v49 + 3) & 0xFFFFFFFC;
        bzero((char *)v48 + v49, (v50 - v49));
        *uint64_t v48 = v50;
        uint64_t v51 = (_DWORD *)a1[1];
        *(void *)((char *)v51 + *v51) = v58;
        *v51 += 8;
        uint64_t v52 = (_DWORD *)a1[1];
        *(void *)((char *)v52 + *v52) = v44;
        *v52 += 8;
        int v53 = (_DWORD *)a1[1];
        *(void *)((char *)v53 + *v53) = *(unsigned __int8 *)(v16 + v14 + 25);
        *v53 += 8;
      }
      a2 = v57;
      if (v20)
      {
        if (*(unsigned char *)(v60 + 24) == 1) {
          uint64_t v54 = *(void *)(v16 + v14 + 8);
        }
        else {
          uint64_t v54 = 0;
        }
        EncodeGTMTLStructType(a1, v54, a3);
        if (v19)
        {
LABEL_24:
          if (*(unsigned char *)(v60 + 24) == 2) {
            uint64_t v55 = *(void *)(v16 + v14 + 8);
          }
          else {
            uint64_t v55 = 0;
          }
          EncodeGTMTLArrayType(a1, v55, a3);
          if (!v21) {
            goto LABEL_32;
          }
LABEL_28:
          if (*(unsigned char *)(v60 + 24) == 60) {
            uint64_t v56 = *(void *)(v16 + v14 + 8);
          }
          else {
            uint64_t v56 = 0;
          }
          EncodeGTMTLPointerType(a1, v56, a3);
          goto LABEL_32;
        }
      }
      else if (v19)
      {
        goto LABEL_24;
      }
      if (v21) {
        goto LABEL_28;
      }
LABEL_32:
      ++v15;
      v14 += 32;
    }
    while (v15 < *(unsigned int *)(v57 + 16));
  }
}

int *EncodeString(int *result, char *__s)
{
  BOOL v2 = result;
  if (__s)
  {
    size_t v4 = strlen(__s);
    int v5 = v4 + 1;
    uint64_t result = (int *)memcpy((char *)v2 + *v2, __s, v4 + 1);
    int v6 = *v2 + v5;
  }
  else
  {
    *(void *)((char *)result + *result) = 0xFFFFFFFFLL;
    int v6 = *result + 8;
  }
  *BOOL v2 = v6;
  return result;
}

void EncodeGTMTLArrayType(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  int v7 = *(unsigned __int8 *)(a2 + 24);
  if (v7 == 60)
  {
    BOOL v8 = 0;
    BOOL v9 = 0;
    BOOL v10 = *(void *)(a2 + 8) != 0;
  }
  else
  {
    if (v7 == 2)
    {
      BOOL v9 = 0;
      BOOL v8 = *(void *)(a2 + 8) != 0;
    }
    else
    {
      BOOL v8 = 0;
      BOOL v9 = v7 == 1 && *(void *)(a2 + 8) != 0;
    }
    BOOL v10 = 0;
  }
  fbstream_write(a1[3], a1[1], *(unsigned int *)a1[1]);
  uint64_t v11 = a1[1];
  *(_DWORD *)(v11 + 32) = 0;
  *(_OWORD *)uint64_t v11 = 0u;
  *(_OWORD *)(v11 + 16) = 0u;
  uint64_t v12 = a1[1];
  *(_DWORD *)(v12 + 32) = 198;
  *(void *)uint64_t v12 = 0xFFFFD01000000024;
  uint64_t v13 = (char *)a1[1];
  strcpy(&v13[*(unsigned int *)v13], "Ciululbbbulb");
  *(_DWORD *)v13 += 13;
  uint64_t v14 = (_DWORD *)a1[1];
  uint64_t v15 = *v14;
  int v16 = (v15 + 3) & 0xFFFFFFFC;
  bzero((char *)v14 + v15, (v16 - v15));
  *uint64_t v14 = v16;
  uint64_t v17 = (_DWORD *)a1[1];
  *(void *)((char *)v17 + *v17) = v6;
  *v17 += 8;
  int v18 = (_DWORD *)a1[1];
  *(_DWORD *)((char *)v18 + *v18) = *(unsigned __int16 *)(a2 + 20);
  *v18 += 4;
  BOOL v19 = (_DWORD *)a1[1];
  *(void *)((char *)v19 + *v19) = *(unsigned __int8 *)(a2 + 24);
  *v19 += 8;
  BOOL v20 = (_DWORD *)a1[1];
  *(void *)((char *)v20 + *v20) = *(unsigned int *)(a2 + 16);
  *v20 += 8;
  BOOL v21 = (_DWORD *)a1[1];
  *((unsigned char *)v21 + (*v21)++) = v9;
  uint64_t v22 = (_DWORD *)a1[1];
  *((unsigned char *)v22 + (*v22)++) = v8;
  uint64_t v23 = (_DWORD *)a1[1];
  *((unsigned char *)v23 + (*v23)++) = a3;
  uint64_t v24 = (_DWORD *)a1[1];
  uint64_t v25 = *v24;
  int v26 = (v25 + 3) & 0xFFFFFFFC;
  bzero((char *)v24 + v25, (v26 - v25));
  *uint64_t v24 = v26;
  int v27 = (_DWORD *)a1[1];
  *(void *)((char *)v27 + *v27) = *(unsigned __int16 *)(a2 + 22);
  *v27 += 8;
  uint64_t v28 = (_DWORD *)a1[1];
  *((unsigned char *)v28 + (*v28)++) = v10;
  uint64_t v29 = (_DWORD *)a1[1];
  uint64_t v30 = *v29;
  int v31 = (v30 + 3) & 0xFFFFFFFC;
  bzero((char *)v29 + v30, (v31 - v30));
  *uint64_t v29 = v31;
  if (a3)
  {
    if ((*(unsigned char *)(a2 + 24) - 62) > 0xFu) {
      uint64_t v32 = 0;
    }
    else {
      uint64_t v32 = word_1DFC40[(*(unsigned char *)(a2 + 24) - 62)];
    }
    fbstream_write(a1[3], a1[1], *(unsigned int *)a1[1]);
    uint64_t v33 = a1[1];
    *(_DWORD *)(v33 + 32) = 0;
    *(_OWORD *)uint64_t v33 = 0u;
    *(_OWORD *)(v33 + 16) = 0u;
    uint64_t v34 = a1[1];
    *(_DWORD *)(v34 + 32) = 198;
    *(void *)uint64_t v34 = 0xFFFFD01000000024;
    int v35 = (char *)a1[1];
    strcpy(&v35[*(unsigned int *)v35], "Culul");
    *(_DWORD *)v35 += 6;
    int v36 = (_DWORD *)a1[1];
    uint64_t v37 = *v36;
    int v38 = (v37 + 3) & 0xFFFFFFFC;
    bzero((char *)v36 + v37, (v38 - v37));
    _DWORD *v36 = v38;
    uint64_t v39 = (_DWORD *)a1[1];
    *(void *)((char *)v39 + *v39) = v6;
    *v39 += 8;
    uint64_t v40 = (_DWORD *)a1[1];
    *(void *)((char *)v40 + *v40) = v32;
    *v40 += 8;
    int v41 = (_DWORD *)a1[1];
    *(void *)((char *)v41 + *v41) = *(unsigned __int8 *)(a2 + 25);
    *v41 += 8;
  }
  if (v9)
  {
    if (*(unsigned char *)(a2 + 24) == 1) {
      uint64_t v43 = *(void *)(a2 + 8);
    }
    else {
      uint64_t v43 = 0;
    }
    EncodeGTMTLStructType(a1, v43, a3);
    if (!v8)
    {
LABEL_16:
      if (!v10) {
        return;
      }
      goto LABEL_17;
    }
  }
  else if (!v8)
  {
    goto LABEL_16;
  }
  if (*(unsigned char *)(a2 + 24) == 2) {
    uint64_t v44 = *(void *)(a2 + 8);
  }
  else {
    uint64_t v44 = 0;
  }
  EncodeGTMTLArrayType(a1, v44, a3);
  if (v10)
  {
LABEL_17:
    if (*(unsigned char *)(a2 + 24) == 60) {
      uint64_t v42 = *(void *)(a2 + 8);
    }
    else {
      uint64_t v42 = 0;
    }
    EncodeGTMTLPointerType(a1, v42, a3);
  }
}

void EncodeGTMTLPointerType(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  int v7 = *(unsigned __int8 *)(a2 + 22);
  if (v7 == 2)
  {
    BOOL v9 = 0;
    BOOL v8 = *(void *)(a2 + 8) != 0;
  }
  else if (v7 == 1)
  {
    BOOL v8 = 0;
    BOOL v9 = *(void *)(a2 + 8) != 0;
  }
  else
  {
    BOOL v9 = 0;
    BOOL v8 = 0;
  }
  fbstream_write(a1[3], a1[1], *(unsigned int *)a1[1]);
  uint64_t v10 = a1[1];
  *(_DWORD *)(v10 + 32) = 0;
  *(_OWORD *)uint64_t v10 = 0u;
  *(_OWORD *)(v10 + 16) = 0u;
  uint64_t v11 = a1[1];
  *(_DWORD *)(v11 + 32) = 198;
  *(void *)uint64_t v11 = 0xFFFFD01000000024;
  uint64_t v12 = (char *)a1[1];
  strcpy(&v12[*(unsigned int *)v12], "Cululululbb");
  *(_DWORD *)v12 += 12;
  uint64_t v13 = (_DWORD *)a1[1];
  uint64_t v14 = *v13;
  int v15 = (v14 + 3) & 0xFFFFFFFC;
  bzero((char *)v13 + v14, (v15 - v14));
  *uint64_t v13 = v15;
  int v16 = (_DWORD *)a1[1];
  *(void *)((char *)v16 + *v16) = v6;
  *v16 += 8;
  uint64_t v17 = (_DWORD *)a1[1];
  *(void *)((char *)v17 + *v17) = *(unsigned __int8 *)(a2 + 22);
  *v17 += 8;
  int v18 = (_DWORD *)a1[1];
  *(void *)((char *)v18 + *v18) = *(unsigned __int8 *)(a2 + 23);
  *v18 += 8;
  BOOL v19 = (_DWORD *)a1[1];
  *(void *)((char *)v19 + *v19) = *(unsigned __int16 *)(a2 + 20);
  *v19 += 8;
  BOOL v20 = (_DWORD *)a1[1];
  *(void *)((char *)v20 + *v20) = *(unsigned int *)(a2 + 16);
  *v20 += 8;
  BOOL v21 = (_DWORD *)a1[1];
  *((unsigned char *)v21 + (*v21)++) = v9;
  uint64_t v22 = (_DWORD *)a1[1];
  *((unsigned char *)v22 + (*v22)++) = v8;
  uint64_t v23 = (_DWORD *)a1[1];
  uint64_t v24 = *v23;
  LODWORD(v13) = (v24 + 3) & 0xFFFFFFFC;
  bzero((char *)v23 + v24, (v13 - v24));
  _DWORD *v23 = v13;
  if (v9)
  {
    if (*(unsigned char *)(a2 + 22) == 1) {
      uint64_t v25 = *(void *)(a2 + 8);
    }
    else {
      uint64_t v25 = 0;
    }
    EncodeGTMTLStructType(a1, v25, a3);
  }
  if (v8)
  {
    if (*(unsigned char *)(a2 + 22) == 2) {
      uint64_t v26 = *(void *)(a2 + 8);
    }
    else {
      uint64_t v26 = 0;
    }
    EncodeGTMTLArrayType(a1, v26, a3);
  }
}

void FlushChainedComputePipelineStateInfo(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  entry = find_entry(a3, (unsigned char *)(a2 + 8), 8uLL, 0);
  if (*entry && (uint64_t v8 = *(void *)(*entry + 32)) != 0) {
    uint64_t v9 = *(void *)(v8 + 8);
  }
  else {
    uint64_t v9 = 0;
  }
  long long v10 = *(_OWORD *)(a1 + 16);
  long long v11 = *(_OWORD *)(a1 + 32);
  v61[0] = *(_OWORD *)a1;
  v61[1] = v10;
  uint64_t v12 = *(void *)(a2 + 64);
  v61[2] = v11;
  uint64_t v62 = *(void *)(a1 + 48);
  *(void *)&v61[0] = v9;
  *(_DWORD *)(*(void *)(a1 + 8) + 32) |= a4 | 0x1000;
  if (*(_WORD *)(v12 + 92))
  {
    uint64_t v13 = 0;
    unint64_t v14 = 0;
    do
    {
      EncodeGTMTLBinding((uint64_t *)v61, *(void *)(v12 + 24) + v13, 105);
      ++v14;
      v13 += 56;
    }
    while (v14 < *(unsigned __int16 *)(v12 + 92));
  }
  if (*(_WORD *)(v12 + 94))
  {
    uint64_t v15 = 0;
    unint64_t v16 = 0;
    do
    {
      EncodeGTMTLBinding((uint64_t *)v61, *(void *)(v12 + 32) + v15, 106);
      ++v16;
      v15 += 56;
    }
    while (v16 < *(unsigned __int16 *)(v12 + 94));
  }
  if (*(void *)(v12 + 64))
  {
    fbstream_write(*(void *)(a1 + 24), *(void *)(a1 + 8), **(unsigned int **)(a1 + 8));
    uint64_t v17 = *(void *)(a1 + 8);
    *(_DWORD *)(v17 + 32) = 0;
    *(_OWORD *)uint64_t v17 = 0u;
    *(_OWORD *)(v17 + 16) = 0u;
    uint64_t v18 = *(void *)(a1 + 8);
    *(_DWORD *)(v18 + 32) = 198;
    *(void *)uint64_t v18 = 0xFFFFD01000000024;
    BOOL v19 = *(uint64_t **)(v12 + 56);
    BOOL v20 = *(const void **)(v12 + 64);
    uint64_t v21 = *(void *)(a1 + 32);
    HashBytes(v19, (unint64_t)v20, __s);
    GTMTLCaptureState_storePointer(v21, __s, v19, v20);
    long long v65 = v70;
    long long v66 = v71;
    char v67 = v72;
    long long v63 = *(_OWORD *)__s;
    long long v64 = v69;
    long long v70 = 0uLL;
    *(void *)__s = v9;
    *(void *)&__s[8] = 116;
    *(void *)&long long v69 = &v63;
    *((void *)&v69 + 1) = v20;
    DYTraceEncode_InternalData((uint64_t)__s, *(unsigned int **)(a1 + 8), *(unsigned int *)(a1 + 16), v22, 0);
  }
  if (*(_WORD *)(v12 + 96))
  {
    unint64_t v23 = 0;
    do
    {
      fbstream_write(*(void *)(a1 + 24), *(void *)(a1 + 8), **(unsigned int **)(a1 + 8));
      uint64_t v24 = *(void *)(a1 + 8);
      *(_DWORD *)(v24 + 32) = 0;
      *(_OWORD *)uint64_t v24 = 0u;
      *(_OWORD *)(v24 + 16) = 0u;
      uint64_t v25 = *(void *)(a1 + 8);
      *(_DWORD *)(v25 + 32) = 198;
      *(void *)uint64_t v25 = 0xFFFFD01000000024;
      SaveFileWithURL(*(void *)(a1 + 32), *(char **)(*(void *)(v12 + 48) + 8 * v23), __s, 0, 1);
      *((void *)&v64 + 1) = 0;
      long long v65 = 0uLL;
      *(void *)&long long v63 = v9;
      *((void *)&v63 + 1) = 126;
      *(void *)&long long v64 = __s;
      *((void *)&v64 + 1) = *(void *)(*(void *)(v12 + 48) + 8 * v23);
      DYTraceEncode_InternalData((uint64_t)&v63, *(unsigned int **)(a1 + 8), *(unsigned int *)(a1 + 16), v26, 0);
      ++v23;
    }
    while (v23 < *(unsigned __int16 *)(v12 + 96));
  }
  int v27 = *(unsigned int **)(a1 + 8);
  unsigned int v28 = v27[8];
  if ((v28 & 0x1000) != 0) {
    unsigned int v29 = v28 & 0xFFFFEFFF;
  }
  else {
    unsigned int v29 = v28 | 0x2000;
  }
  v27[8] = v29;
  unint64_t v30 = *v27;
  if ((v29 & 0x1000) != 0)
  {
    uint64_t v31 = *v27;
    uint64_t v32 = v27;
    do
    {
      uint64_t v32 = (unsigned int *)((char *)v32 + v31);
      uint64_t v31 = *v32;
      v30 += v31;
    }
    while ((*((unsigned char *)v32 + 33) & 0x20) == 0);
  }
  fbstream_write(*(void *)(a1 + 24), (uint64_t)v27, v30);
  uint64_t v33 = *(void *)(a2 + 104);
  if (v33)
  {
    uint64_t v34 = *(void **)(a1 + 8);
    v34[2] = 0;
    v34[3] = 0;
    v34[1] = 0;
    v34[4] = 0x77754300000004;
    void *v34 = 0xFFFFC18B00000028;
    v34[5] = v9;
    v34[6] = v33;
    *(_DWORD *)uint64_t v34 = 56;
    int v35 = *(unsigned int **)(a1 + 8);
    int v36 = v35[8] | a4;
    v35[8] = v36;
    unint64_t v37 = *v35;
    if ((v36 & 0x1000) != 0)
    {
      uint64_t v38 = *v35;
      uint64_t v39 = v35;
      do
      {
        uint64_t v39 = (unsigned int *)((char *)v39 + v38);
        uint64_t v38 = *v39;
        v37 += v38;
      }
      while ((*((unsigned char *)v39 + 33) & 0x20) == 0);
    }
    fbstream_write(*(void *)(a1 + 24), (uint64_t)v35, v37);
  }
  uint64_t v40 = *(void *)(a2 + 96);
  if (v40)
  {
    int v41 = *(void **)(a1 + 8);
    v41[2] = 0;
    v41[3] = 0;
    v41[1] = 0;
    v41[4] = 0x77754300000004;
    void *v41 = 0xFFFFD81A00000028;
    v41[5] = v9;
    v41[6] = v40;
    *(_DWORD *)int v41 = 56;
    uint64_t v42 = *(unsigned int **)(a1 + 8);
    int v43 = v42[8] | a4;
    v42[8] = v43;
    unint64_t v44 = *v42;
    if ((v43 & 0x1000) != 0)
    {
      uint64_t v45 = *v42;
      uint64_t v46 = v42;
      do
      {
        uint64_t v46 = (unsigned int *)((char *)v46 + v45);
        uint64_t v45 = *v46;
        v44 += v45;
      }
      while ((*((unsigned char *)v46 + 33) & 0x20) == 0);
    }
    fbstream_write(*(void *)(a1 + 24), (uint64_t)v42, v44);
  }
  int v47 = *(_DWORD *)(a2 + 192);
  uint64_t v48 = *(void *)(a1 + 8);
  *(void *)(v48 + 16) = 0;
  *(void *)(v48 + 24) = 0;
  *(void *)(v48 + 8) = 0;
  *(void *)(v48 + 32) = 0x69754300000006;
  *(void *)uint64_t v48 = 0xFFFFD83100000028;
  *(void *)(v48 + 40) = v9;
  *(_DWORD *)(v48 + 48) = v47;
  *(_DWORD *)uint64_t v48 = 52;
  uint64_t v49 = *(unsigned int **)(a1 + 8);
  int v50 = v49[8] | a4;
  v49[8] = v50;
  unint64_t v51 = *v49;
  if ((v50 & 0x1000) != 0)
  {
    uint64_t v52 = *v49;
    int v53 = v49;
    do
    {
      int v53 = (unsigned int *)((char *)v53 + v52);
      uint64_t v52 = *v53;
      v51 += v52;
    }
    while ((*((unsigned char *)v53 + 33) & 0x20) == 0);
  }
  fbstream_write(*(void *)(a1 + 24), (uint64_t)v49, v51);
  uint64_t v54 = *(void *)(a2 + 112);
  if (v54)
  {
    uint64_t v55 = *(void **)(a1 + 8);
    v55[2] = 0;
    v55[3] = 0;
    v55[1] = 0;
    v55[4] = 0x77754300000004;
    void *v55 = 0xFFFFD84E00000028;
    v55[5] = v9;
    v55[6] = v54;
    *(_DWORD *)uint64_t v55 = 56;
    uint64_t v56 = *(unsigned int **)(a1 + 8);
    int v57 = v56[8] | a4;
    v56[8] = v57;
    unint64_t v58 = *v56;
    if ((v57 & 0x1000) != 0)
    {
      uint64_t v59 = *v56;
      uint64_t v60 = v56;
      do
      {
        uint64_t v60 = (unsigned int *)((char *)v60 + v59);
        uint64_t v59 = *v60;
        v58 += v59;
      }
      while ((*((unsigned char *)v60 + 33) & 0x20) == 0);
    }
    fbstream_write(*(void *)(a1 + 24), (uint64_t)v56, v58);
  }
}

void FlushChainedFunctionInfo(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v6 = *(unsigned int **)(a1 + 8);
  int v7 = v6[8] | a4;
  v6[8] = v7;
  if (a2 && *(void *)(a2 + 80))
  {
    entry = find_entry(a3, (unsigned char *)(a2 + 8), 8uLL, 0);
    if (*entry && (uint64_t v9 = *(void *)(*entry + 32)) != 0) {
      uint64_t v10 = *(void *)(v9 + 8);
    }
    else {
      uint64_t v10 = 0;
    }
    uint64_t v15 = *(void *)(a2 + 80);
    unint64_t v16 = *(unsigned int **)(a1 + 8);
    v16[8] |= 0x1000u;
    fbstream_write(*(void *)(a1 + 24), (uint64_t)v16, *v16);
    uint64_t v17 = *(void *)(a1 + 8);
    *(_DWORD *)(v17 + 32) = 0;
    *(_OWORD *)uint64_t v17 = 0u;
    *(_OWORD *)(v17 + 16) = 0u;
    uint64_t v18 = *(void *)(a1 + 8);
    *(_DWORD *)(v18 + 32) = 198;
    *(void *)uint64_t v18 = 0xFFFFD01000000024;
    *(void *)&__s[0] = v10;
    *((void *)&__s[0] + 1) = 101;
    uint64_t v19 = *(unsigned __int16 *)(v15 + 42);
    *(void *)&__s[1] = *(unsigned __int16 *)(v15 + 40);
    *((void *)&__s[1] + 1) = v19;
    __s[2] = *(_OWORD *)(v15 + 8);
    DYTraceEncode_InternalData((uint64_t)__s, *(unsigned int **)(a1 + 8), *(unsigned int *)(a1 + 16), v20, 0);
    if (*(unsigned char *)(v15 + 46))
    {
      uint64_t v21 = 0;
      unint64_t v22 = 0;
      do
      {
        fbstream_write(*(void *)(a1 + 24), *(void *)(a1 + 8), **(unsigned int **)(a1 + 8));
        uint64_t v23 = *(void *)(a1 + 8);
        *(_DWORD *)(v23 + 32) = 0;
        *(_OWORD *)uint64_t v23 = 0u;
        *(_OWORD *)(v23 + 16) = 0u;
        uint64_t v24 = *(void *)(a1 + 8);
        *(_DWORD *)(v24 + 32) = 198;
        *(void *)uint64_t v24 = 0xFFFFD01000000024;
        uint64_t v25 = *(void *)(v15 + 24) + v21;
        memset(&__s[1], 0, 32);
        *(void *)&__s[0] = v10;
        *((void *)&__s[0] + 1) = 109;
        *(void *)&__s[1] = *(unsigned int *)(v25 + 8);
        *((void *)&__s[1] + 1) = *(unsigned __int8 *)(v25 + 12);
        *(void *)&__s[2] = *(void *)v25;
        BYTE8(__s[2]) = *(unsigned char *)(v25 + 13);
        HIDWORD(__s[2]) = 0;
        *(_DWORD *)((char *)&__s[2] + 9) = 0;
        DYTraceEncode_InternalData((uint64_t)__s, *(unsigned int **)(a1 + 8), *(unsigned int *)(a1 + 16), v26, 0);
        ++v22;
        v21 += 16;
      }
      while (v22 < *(unsigned __int8 *)(v15 + 46));
    }
    if (*(unsigned char *)(v15 + 47))
    {
      uint64_t v27 = 0;
      unint64_t v28 = 0;
      do
      {
        fbstream_write(*(void *)(a1 + 24), *(void *)(a1 + 8), **(unsigned int **)(a1 + 8));
        uint64_t v29 = *(void *)(a1 + 8);
        *(_DWORD *)(v29 + 32) = 0;
        *(_OWORD *)uint64_t v29 = 0u;
        *(_OWORD *)(v29 + 16) = 0u;
        uint64_t v30 = *(void *)(a1 + 8);
        *(_DWORD *)(v30 + 32) = 198;
        *(void *)uint64_t v30 = 0xFFFFD01000000024;
        uint64_t v31 = *(void *)(v15 + 32) + v27;
        memset(&__s[1], 0, 32);
        *(void *)&__s[0] = v10;
        *((void *)&__s[0] + 1) = 120;
        *(void *)&__s[1] = *(unsigned int *)(v31 + 8);
        *((void *)&__s[1] + 1) = *(unsigned __int8 *)(v31 + 12);
        *(void *)&__s[2] = *(void *)v31;
        BYTE8(__s[2]) = *(unsigned char *)(v31 + 13);
        HIDWORD(__s[2]) = 0;
        *(_DWORD *)((char *)&__s[2] + 9) = 0;
        DYTraceEncode_InternalData((uint64_t)__s, *(unsigned int **)(a1 + 8), *(unsigned int *)(a1 + 16), v32, 0);
        ++v28;
        v27 += 16;
      }
      while (v28 < *(unsigned __int8 *)(v15 + 47));
    }
    if (*(void *)(a2 + 72))
    {
      fbstream_write(*(void *)(a1 + 24), *(void *)(a1 + 8), **(unsigned int **)(a1 + 8));
      uint64_t v33 = *(void *)(a1 + 8);
      *(_DWORD *)(v33 + 32) = 0;
      *(_OWORD *)uint64_t v33 = 0u;
      *(_OWORD *)(v33 + 16) = 0u;
      uint64_t v34 = *(void *)(a1 + 8);
      *(_DWORD *)(v34 + 32) = 198;
      *(void *)uint64_t v34 = 0xFFFFD01000000024;
      int v35 = (const void *)EncodeDYMTLFunctionConstantValues(*(uint64_t **)(a2 + 72), *(void **)(a1 + 8), *(unsigned int *)(a1 + 16));
      uint64_t v36 = *(void *)(a1 + 32);
      unint64_t v37 = *(uint64_t **)(a1 + 8);
      HashBytes(v37, (unint64_t)v35, (char *)__s);
      GTMTLCaptureState_storePointer(v36, (char *)__s, v37, v35);
      v52[2] = __s[2];
      v52[3] = __s[3];
      char v53 = v55;
      v52[0] = __s[0];
      v52[1] = __s[1];
      *(void *)&__s[0] = v10;
      DWORD2(__s[0]) = 111;
      memset((char *)__s + 12, 0, 36);
      *(void *)&__s[1] = v52;
      DYTraceEncode_InternalData((uint64_t)__s, *(unsigned int **)(a1 + 8), *(unsigned int *)(a1 + 16), v38, 0);
    }
    fbstream_write(*(void *)(a1 + 24), *(void *)(a1 + 8), **(unsigned int **)(a1 + 8));
    uint64_t v40 = *(void *)(a1 + 8);
    *(_DWORD *)(v40 + 32) = 0;
    *(_OWORD *)uint64_t v40 = 0u;
    *(_OWORD *)(v40 + 16) = 0u;
    uint64_t v41 = *(void *)(a1 + 8);
    *(_DWORD *)(v41 + 32) = 198;
    *(void *)uint64_t v41 = 0xFFFFD01000000024;
    *(void *)&__s[0] = v10;
    DWORD2(__s[0]) = 117;
    memset((char *)__s + 12, 0, 36);
    uint64_t v42 = "";
    if (*(void *)(a2 + 64)) {
      uint64_t v42 = *(const char **)(a2 + 64);
    }
    *(void *)&__s[1] = v42;
    DYTraceEncode_InternalData((uint64_t)__s, *(unsigned int **)(a1 + 8), *(unsigned int *)(a1 + 16), v39, 0);
    fbstream_write(*(void *)(a1 + 24), *(void *)(a1 + 8), **(unsigned int **)(a1 + 8));
    uint64_t v44 = *(void *)(a1 + 8);
    *(_DWORD *)(v44 + 32) = 0;
    *(_OWORD *)uint64_t v44 = 0u;
    *(_OWORD *)(v44 + 16) = 0u;
    uint64_t v45 = *(void *)(a1 + 8);
    *(_DWORD *)(v45 + 32) = 198;
    *(void *)uint64_t v45 = 0xFFFFD01000000024;
    __s[2] = 0uLL;
    *(void *)&__s[0] = v10;
    *((void *)&__s[0] + 1) = 110;
    *(void *)&__s[1] = *(unsigned __int8 *)(v15 + 48);
    if (*(void *)(a2 + 72)) {
      unsigned int v46 = -1;
    }
    else {
      unsigned int v46 = *(__int16 *)(v15 + 44);
    }
    *((void *)&__s[1] + 1) = v46;
    DYTraceEncode_InternalData((uint64_t)__s, *(unsigned int **)(a1 + 8), *(unsigned int *)(a1 + 16), v43, 0);
    int v47 = *(unsigned int **)(a1 + 8);
    unsigned int v48 = v47[8];
    v47[8] = v48 | 0x2000;
    unint64_t v49 = *v47;
    if ((v48 & 0x1000) != 0)
    {
      uint64_t v50 = *v47;
      unint64_t v51 = v47;
      do
      {
        unint64_t v51 = (unsigned int *)((char *)v51 + v50);
        uint64_t v50 = *v51;
        v49 += v50;
      }
      while ((*((unsigned char *)v51 + 33) & 0x20) == 0);
    }
    fbstream_write(*(void *)(a1 + 24), (uint64_t)v47, v49);
  }
  else
  {
    uint64_t v11 = *v6;
    if ((v7 & 0x1000) != 0)
    {
      uint64_t v13 = v6;
      unint64_t v12 = *v6;
      do
      {
        uint64_t v13 = (unsigned int *)((char *)v13 + v11);
        uint64_t v11 = *v13;
        v12 += v11;
      }
      while ((*((unsigned char *)v13 + 33) & 0x20) == 0);
    }
    else
    {
      unint64_t v12 = *v6;
    }
    uint64_t v14 = *(void *)(a1 + 24);
    fbstream_write(v14, (uint64_t)v6, v12);
  }
}

void FlushChainedDynamicLibraryInfo(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v6 = *(unsigned int **)(a1 + 8);
  int v7 = v6[8] | a4;
  v6[8] = v7;
  if (a2)
  {
    entry = find_entry(a3, (unsigned char *)(a2 + 8), 8uLL, 0);
    if (*entry && (uint64_t v9 = *(void *)(*entry + 32)) != 0) {
      uint64_t v10 = *(void *)(v9 + 8);
    }
    else {
      uint64_t v10 = 0;
    }
    uint64_t v11 = *(unsigned int **)(a1 + 8);
    v11[8] |= 0x1000u;
    if (*(void *)(a2 + 72))
    {
      fbstream_write(*(void *)(a1 + 24), (uint64_t)v11, *v11);
      uint64_t v12 = *(void *)(a1 + 8);
      *(_DWORD *)(v12 + 32) = 0;
      *(_OWORD *)uint64_t v12 = 0u;
      *(_OWORD *)(v12 + 16) = 0u;
      uint64_t v13 = *(void *)(a1 + 8);
      *(_DWORD *)(v13 + 32) = 198;
      *(void *)uint64_t v13 = 0xFFFFD01000000024;
      uint64_t v32 = v10;
      int v33 = 128;
      long long v34 = 0u;
      long long v35 = 0u;
      int v36 = 0;
      *(void *)((char *)&v34 + 4) = *(void *)(a2 + 72);
      DYTraceEncode_InternalData((uint64_t)&v32, *(unsigned int **)(a1 + 8), *(unsigned int *)(a1 + 16), v14, 0);
    }
    if (*(void *)(a2 + 88))
    {
      fbstream_write(*(void *)(a1 + 24), *(void *)(a1 + 8), **(unsigned int **)(a1 + 8));
      uint64_t v15 = *(void *)(a1 + 8);
      *(_DWORD *)(v15 + 32) = 0;
      *(_OWORD *)uint64_t v15 = 0u;
      *(_OWORD *)(v15 + 16) = 0u;
      uint64_t v16 = *(void *)(a1 + 8);
      *(_DWORD *)(v16 + 32) = 198;
      *(void *)uint64_t v16 = 0xFFFFD01000000024;
      uint64_t v32 = v10;
      int v33 = 127;
      long long v34 = 0u;
      long long v35 = 0u;
      int v36 = 0;
      *(void *)((char *)&v34 + 4) = *(void *)(a2 + 88);
      DYTraceEncode_InternalData((uint64_t)&v32, *(unsigned int **)(a1 + 8), *(unsigned int *)(a1 + 16), v17, 0);
    }
    if (*(_WORD *)(a2 + 104))
    {
      unint64_t v18 = 0;
      do
      {
        fbstream_write(*(void *)(a1 + 24), *(void *)(a1 + 8), **(unsigned int **)(a1 + 8));
        uint64_t v19 = *(void *)(a1 + 8);
        *(_DWORD *)(v19 + 32) = 0;
        *(_OWORD *)uint64_t v19 = 0u;
        *(_OWORD *)(v19 + 16) = 0u;
        uint64_t v20 = *(void *)(a1 + 8);
        *(_DWORD *)(v20 + 32) = 198;
        *(void *)uint64_t v20 = 0xFFFFD01000000024;
        uint64_t v32 = v10;
        int v33 = 129;
        long long v34 = 0u;
        long long v35 = 0u;
        int v36 = 0;
        *(void *)((char *)&v34 + 4) = *(void *)(*(void *)(a2 + 96) + 8 * v18);
        DYTraceEncode_InternalData((uint64_t)&v32, *(unsigned int **)(a1 + 8), *(unsigned int *)(a1 + 16), v21, 0);
        ++v18;
      }
      while (v18 < *(unsigned __int16 *)(a2 + 104));
    }
    unint64_t v22 = *(unsigned int **)(a1 + 8);
    unsigned int v23 = v22[8];
    if ((v23 & 0x1000) != 0) {
      unsigned int v24 = v23 & 0xFFFFEFFF;
    }
    else {
      unsigned int v24 = v23 | 0x2000;
    }
    v22[8] = v24;
    unint64_t v25 = *v22;
    if ((v24 & 0x1000) != 0)
    {
      uint64_t v26 = *v22;
      uint64_t v27 = v22;
      do
      {
        uint64_t v27 = (unsigned int *)((char *)v27 + v26);
        uint64_t v26 = *v27;
        v25 += v26;
      }
      while ((*((unsigned char *)v27 + 33) & 0x20) == 0);
    }
    fbstream_write(*(void *)(a1 + 24), (uint64_t)v22, v25);
  }
  else
  {
    uint64_t v28 = *(void *)(a1 + 24);
    uint64_t v29 = *v6;
    if ((v7 & 0x1000) != 0)
    {
      uint64_t v31 = v6;
      unint64_t v30 = *v6;
      do
      {
        uint64_t v31 = (unsigned int *)((char *)v31 + v29);
        uint64_t v29 = *v31;
        v30 += v29;
      }
      while ((*((unsigned char *)v31 + 33) & 0x20) == 0);
    }
    else
    {
      unint64_t v30 = *v6;
    }
    fbstream_write(v28, (uint64_t)v6, v30);
  }
}

void WriteBufferInfo(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  entry = find_entry(a3, (unsigned char *)(a2 + 8), 8uLL, 0);
  if (*entry && (uint64_t v8 = *(void *)(*entry + 32)) != 0) {
    uint64_t v9 = *(void *)(v8 + 8);
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *(void *)(a2 + 112);
  uint64_t v11 = *(void **)(a1 + 8);
  v11[2] = 0;
  v11[3] = 0;
  v11[1] = 0;
  v11[4] = 0x77754300000004;
  *uint64_t v11 = 0xFFFFD80C00000028;
  v11[5] = v9;
  v11[6] = v10;
  *(_DWORD *)uint64_t v11 = 56;
  uint64_t v12 = *(unsigned int **)(a1 + 8);
  LODWORD(v10) = v12[8] | a4;
  v12[8] = v10;
  unint64_t v13 = *v12;
  if ((v10 & 0x1000) != 0)
  {
    uint64_t v14 = *v12;
    uint64_t v15 = v12;
    do
    {
      uint64_t v15 = (unsigned int *)((char *)v15 + v14);
      uint64_t v14 = *v15;
      v13 += v14;
    }
    while ((*((unsigned char *)v15 + 33) & 0x20) == 0);
  }
  fbstream_write(*(void *)(a1 + 24), (uint64_t)v12, v13);
  int v16 = *(_DWORD *)(a2 + 88);
  uint64_t v17 = *(void *)(a1 + 8);
  *(void *)(v17 + 16) = 0;
  *(void *)(v17 + 24) = 0;
  *(void *)(v17 + 8) = 0;
  *(_DWORD *)(v17 + 32) = 6;
  *(_DWORD *)(v17 + 36) = 26947;
  *(void *)uint64_t v17 = 0xFFFFC00D00000028;
  *(void *)(v17 + 40) = v9;
  *(_DWORD *)(v17 + 48) = v16;
  *(_DWORD *)uint64_t v17 = 52;
  unint64_t v18 = *(unsigned int **)(a1 + 8);
  int v19 = v18[8] | a4;
  v18[8] = v19;
  unint64_t v20 = *v18;
  if ((v19 & 0x1000) != 0)
  {
    uint64_t v21 = *v18;
    unint64_t v22 = v18;
    do
    {
      unint64_t v22 = (unsigned int *)((char *)v22 + v21);
      uint64_t v21 = *v22;
      v20 += v21;
    }
    while ((*((unsigned char *)v22 + 33) & 0x20) == 0);
  }
  fbstream_write(*(void *)(a1 + 24), (uint64_t)v18, v20);
  uint64_t v23 = *(unsigned int *)(a2 + 84);
  unsigned int v24 = *(void **)(a1 + 8);
  v24[2] = 0;
  v24[3] = 0;
  v24[1] = 0;
  v24[4] = 0x6C754300000006;
  *unsigned int v24 = 0xFFFFD81100000028;
  v24[5] = v9;
  v24[6] = v23;
  *(_DWORD *)unsigned int v24 = 56;
  unint64_t v25 = *(unsigned int **)(a1 + 8);
  LODWORD(v23) = v25[8] | a4;
  v25[8] = v23;
  unint64_t v26 = *v25;
  if ((v23 & 0x1000) != 0)
  {
    uint64_t v27 = *v25;
    uint64_t v28 = v25;
    do
    {
      uint64_t v28 = (unsigned int *)((char *)v28 + v27);
      uint64_t v27 = *v28;
      v26 += v27;
    }
    while ((*((unsigned char *)v28 + 33) & 0x20) == 0);
  }
  fbstream_write(*(void *)(a1 + 24), (uint64_t)v25, v26);
  uint64_t v29 = *(void *)(a2 + 56);
  if (v29)
  {
    unint64_t v30 = *(void **)(a1 + 8);
    v30[2] = 0;
    v30[3] = 0;
    v30[1] = 0;
    v30[4] = 0x77754300000006;
    void *v30 = 0xFFFFD82500000028;
    v30[5] = v9;
    v30[6] = v29;
    *(_DWORD *)unint64_t v30 = 56;
    uint64_t v31 = *(unsigned int **)(a1 + 8);
    int v32 = v31[8] | a4;
    v31[8] = v32;
    unint64_t v33 = *v31;
    if ((v32 & 0x1000) != 0)
    {
      uint64_t v34 = *v31;
      long long v35 = v31;
      do
      {
        long long v35 = (unsigned int *)((char *)v35 + v34);
        uint64_t v34 = *v35;
        v33 += v34;
      }
      while ((*((unsigned char *)v35 + 33) & 0x20) == 0);
    }
    fbstream_write(*(void *)(a1 + 24), (uint64_t)v31, v33);
  }
  if (*(void *)(a2 + 48))
  {
    uint64_t v36 = *(void *)(a2 + 112) - *(void *)(a2 + 128);
    unint64_t v37 = *(void **)(a1 + 8);
    v37[1] = 0;
    v37[2] = 0;
    v37[3] = 0;
    v37[4] = 0x6C754300000000;
    void *v37 = 0xFFFFD83500000028;
    v37[5] = v9;
    v37[6] = v36;
    *(_DWORD *)unint64_t v37 = 56;
  }
  else
  {
    long long v38 = *(_OWORD *)(a2 + 128);
    uint64_t v39 = *(void *)(a1 + 8);
    *(void *)(v39 + 8) = 0;
    *(void *)(v39 + 16) = 0;
    *(void *)(v39 + 24) = 0;
    *(void *)uint64_t v39 = 0xFFFFD83600000024;
    *(_DWORD *)(v39 + 32) = 4;
    *(void *)(v39 + 36) = 0x7775777543;
    *(void *)(v39 + 44) = v9;
    *(_OWORD *)(v39 + 52) = v38;
    *(_DWORD *)uint64_t v39 = 68;
  }
  uint64_t v40 = *(unsigned int **)(a1 + 8);
  int v41 = v40[8] | a4;
  v40[8] = v41;
  uint64_t v42 = *(void *)(a1 + 24);
  unint64_t v43 = *v40;
  if ((v41 & 0x1000) != 0)
  {
    uint64_t v44 = *v40;
    uint64_t v45 = v40;
    do
    {
      uint64_t v45 = (unsigned int *)((char *)v45 + v44);
      uint64_t v44 = *v45;
      v43 += v44;
    }
    while ((*((unsigned char *)v45 + 33) & 0x20) == 0);
  }

  fbstream_write(v42, (uint64_t)v40, v43);
}

void WriteTextureInfo(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  entry = find_entry(a3, (unsigned char *)(a2 + 8), 8uLL, 0);
  if (*entry && (uint64_t v8 = *(void *)(*entry + 32)) != 0) {
    uint64_t v9 = *(void *)(v8 + 8);
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *(void *)(a2 + 168);
  uint64_t v11 = *(void **)(a1 + 8);
  v11[2] = 0;
  v11[3] = 0;
  v11[1] = 0;
  v11[4] = 0x77754300000004;
  *uint64_t v11 = 0xFFFFD80D00000028;
  v11[5] = v9;
  v11[6] = v10;
  *(_DWORD *)uint64_t v11 = 56;
  uint64_t v12 = *(unsigned int **)(a1 + 8);
  LODWORD(v10) = v12[8] | a4;
  v12[8] = v10;
  unint64_t v13 = *v12;
  if ((v10 & 0x1000) != 0)
  {
    uint64_t v14 = *v12;
    uint64_t v15 = v12;
    do
    {
      uint64_t v15 = (unsigned int *)((char *)v15 + v14);
      uint64_t v14 = *v15;
      v13 += v14;
    }
    while ((*((unsigned char *)v15 + 33) & 0x20) == 0);
  }
  fbstream_write(*(void *)(a1 + 24), (uint64_t)v12, v13);
  int v16 = *(_DWORD *)(a2 + 88);
  uint64_t v17 = *(void *)(a1 + 8);
  *(void *)(v17 + 16) = 0;
  *(void *)(v17 + 24) = 0;
  *(void *)(v17 + 8) = 0;
  *(_DWORD *)(v17 + 32) = 6;
  *(_DWORD *)(v17 + 36) = 26947;
  *(void *)uint64_t v17 = 0xFFFFC09100000028;
  *(void *)(v17 + 40) = v9;
  *(_DWORD *)(v17 + 48) = v16;
  *(_DWORD *)uint64_t v17 = 52;
  unint64_t v18 = *(unsigned int **)(a1 + 8);
  int v19 = v18[8] | a4;
  v18[8] = v19;
  unint64_t v20 = *v18;
  if ((v19 & 0x1000) != 0)
  {
    uint64_t v21 = *v18;
    unint64_t v22 = v18;
    do
    {
      unint64_t v22 = (unsigned int *)((char *)v22 + v21);
      uint64_t v21 = *v22;
      v20 += v21;
    }
    while ((*((unsigned char *)v22 + 33) & 0x20) == 0);
  }
  fbstream_write(*(void *)(a1 + 24), (uint64_t)v18, v20);
  int v23 = *(_DWORD *)(a2 + 84);
  uint64_t v24 = *(void *)(a1 + 8);
  *(void *)(v24 + 16) = 0;
  *(void *)(v24 + 24) = 0;
  *(void *)(v24 + 8) = 0;
  *(void *)(v24 + 32) = 0x69754300000006;
  *(void *)uint64_t v24 = 0xFFFFD81200000028;
  *(void *)(v24 + 40) = v9;
  *(_DWORD *)(v24 + 48) = v23;
  *(_DWORD *)uint64_t v24 = 52;
  unint64_t v25 = *(unsigned int **)(a1 + 8);
  int v26 = v25[8] | a4;
  v25[8] = v26;
  unint64_t v27 = *v25;
  if ((v26 & 0x1000) != 0)
  {
    uint64_t v28 = *v25;
    uint64_t v29 = v25;
    do
    {
      uint64_t v29 = (unsigned int *)((char *)v29 + v28);
      uint64_t v28 = *v29;
      v27 += v28;
    }
    while ((*((unsigned char *)v29 + 33) & 0x20) == 0);
  }
  fbstream_write(*(void *)(a1 + 24), (uint64_t)v25, v27);
  unint64_t v30 = *(uint64_t **)(a2 + 112);
  uint64_t v31 = *(void *)(a1 + 8) + *(unsigned int *)(a1 + 16) - 512;
  uint64_t v75 = 512;
  int v32 = (const char *)StoreMTLTextureMipmapInfo2UsingEncode(*(void *)(a1 + 32), v30, v31, &v75);
  unint64_t v33 = *(unsigned int **)(a1 + 8);
  *((void *)v33 + 1) = 0;
  *((void *)v33 + 2) = 0;
  *((void *)v33 + 3) = 0;
  *((void *)v33 + 4) = 0x554300000006;
  *(void *)unint64_t v33 = 0xFFFFD80900000028;
  *((void *)v33 + 5) = v9;
  unsigned int *v33 = 48;
  AppendString(v32, (int *)v33);
  uint64_t v34 = *v33;
  uint64_t v35 = (v34 + 3) & 0xFFFFFFFC;
  bzero((char *)v33 + v34, v35 - v34);
  unsigned int *v33 = v35;
  uint64_t v36 = *(unsigned int **)(a1 + 8);
  int v37 = v36[8] | a4;
  v36[8] = v37;
  unint64_t v38 = *v36;
  if ((v37 & 0x1000) != 0)
  {
    uint64_t v39 = *v36;
    uint64_t v40 = v36;
    do
    {
      uint64_t v40 = (unsigned int *)((char *)v40 + v39);
      uint64_t v39 = *v40;
      v38 += v39;
    }
    while ((*((unsigned char *)v40 + 33) & 0x20) == 0);
  }
  fbstream_write(*(void *)(a1 + 24), (uint64_t)v36, v38);
  int v41 = *(unsigned __int16 *)(a2 + 212);
  uint64_t v42 = *(void *)(a1 + 8);
  *(void *)(v42 + 16) = 0;
  *(void *)(v42 + 24) = 0;
  *(void *)(v42 + 8) = 0;
  *(void *)(v42 + 32) = 0x69754300000006;
  *(void *)uint64_t v42 = 0xFFFFD82300000028;
  *(void *)(v42 + 40) = v9;
  *(_DWORD *)(v42 + 48) = v41;
  *(_DWORD *)uint64_t v42 = 52;
  unint64_t v43 = *(unsigned int **)(a1 + 8);
  int v44 = v43[8] | a4;
  v43[8] = v44;
  unint64_t v45 = *v43;
  if ((v44 & 0x1000) != 0)
  {
    uint64_t v46 = *v43;
    int v47 = v43;
    do
    {
      int v47 = (unsigned int *)((char *)v47 + v46);
      uint64_t v46 = *v47;
      v45 += v46;
    }
    while ((*((unsigned char *)v47 + 33) & 0x20) == 0);
  }
  fbstream_write(*(void *)(a1 + 24), (uint64_t)v43, v45);
  uint64_t v48 = *(void *)(a2 + 56);
  unint64_t v49 = *(void **)(a1 + 8);
  v49[2] = 0;
  v49[3] = 0;
  v49[1] = 0;
  v49[4] = 0x77754300000006;
  void *v49 = 0xFFFFD82400000028;
  v49[5] = v9;
  v49[6] = v48;
  *(_DWORD *)unint64_t v49 = 56;
  uint64_t v50 = *(unsigned int **)(a1 + 8);
  LODWORD(v48) = v50[8] | a4;
  v50[8] = v48;
  unint64_t v51 = *v50;
  if ((v48 & 0x1000) != 0)
  {
    uint64_t v52 = *v50;
    char v53 = v50;
    do
    {
      char v53 = (unsigned int *)((char *)v53 + v52);
      uint64_t v52 = *v53;
      v51 += v52;
    }
    while ((*((unsigned char *)v53 + 33) & 0x20) == 0);
  }
  fbstream_write(*(void *)(a1 + 24), (uint64_t)v50, v51);
  uint64_t v54 = *(void *)(a2 + 176);
  char v55 = *(void **)(a1 + 8);
  v55[2] = 0;
  v55[3] = 0;
  v55[1] = 0;
  v55[4] = 0x77754300000004;
  void *v55 = 0xFFFFD82A00000028;
  v55[5] = v9;
  v55[6] = v54;
  *(_DWORD *)char v55 = 56;
  uint64_t v56 = *(unsigned int **)(a1 + 8);
  LODWORD(v54) = v56[8] | a4;
  v56[8] = v54;
  unint64_t v57 = *v56;
  if ((v54 & 0x1000) != 0)
  {
    uint64_t v58 = *v56;
    uint64_t v59 = v56;
    do
    {
      uint64_t v59 = (unsigned int *)((char *)v59 + v58);
      uint64_t v58 = *v59;
      v57 += v58;
    }
    while ((*((unsigned char *)v59 + 33) & 0x20) == 0);
  }
  fbstream_write(*(void *)(a1 + 24), (uint64_t)v56, v57);
  if (*(void *)(a2 + 48))
  {
    uint64_t v60 = *(void *)(a2 + 128);
    if (v60) {
      int v61 = *(_DWORD *)(v60 + 64) - *(_DWORD *)(v60 + 72);
    }
    else {
      int v61 = *(_DWORD *)(a2 + 80);
    }
    uint64_t v62 = *(void **)(a1 + 8);
    v62[2] = 0;
    v62[3] = 0;
    v62[1] = 0;
    v62[4] = 0x6C754300000000;
    void *v62 = 0xFFFFD83700000028;
    v62[5] = v9;
    v62[6] = v61;
    *(_DWORD *)uint64_t v62 = 56;
    long long v63 = *(unsigned int **)(a1 + 8);
    int v64 = v63[8] | a4;
    v63[8] = v64;
    unint64_t v65 = *v63;
    if ((v64 & 0x1000) != 0)
    {
      uint64_t v66 = *v63;
      char v67 = v63;
      do
      {
        char v67 = (unsigned int *)((char *)v67 + v66);
        uint64_t v66 = *v67;
        v65 += v66;
      }
      while ((*((unsigned char *)v67 + 33) & 0x20) == 0);
    }
    fbstream_write(*(void *)(a1 + 24), (uint64_t)v63, v65);
  }
  uint64_t v68 = *(void *)(a2 + 200);
  long long v69 = *(void **)(a1 + 8);
  v69[2] = 0;
  v69[3] = 0;
  v69[1] = 0;
  v69[4] = 0x77754300000004;
  *long long v69 = 0xFFFFD84C00000028;
  v69[5] = v9;
  v69[6] = v68;
  *(_DWORD *)long long v69 = 56;
  long long v70 = *(unsigned int **)(a1 + 8);
  LODWORD(v68) = v70[8] | a4;
  v70[8] = v68;
  uint64_t v71 = *(void *)(a1 + 24);
  unint64_t v72 = *v70;
  if ((v68 & 0x1000) != 0)
  {
    uint64_t v73 = *v70;
    int v74 = v70;
    do
    {
      int v74 = (unsigned int *)((char *)v74 + v73);
      uint64_t v73 = *v74;
      v72 += v73;
    }
    while ((*((unsigned char *)v74 + 33) & 0x20) == 0);
  }

  fbstream_write(v71, (uint64_t)v70, v72);
}

void WriteSamplerStateInfo(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  entry = find_entry(a3, (unsigned char *)(a2 + 8), 8uLL, 0);
  if (*entry && (uint64_t v8 = *(void *)(*entry + 32)) != 0) {
    uint64_t v9 = *(void *)(v8 + 8);
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *(void *)(a2 + 64);
  if (v10)
  {
    uint64_t v11 = *(void **)(a1 + 8);
    v11[2] = 0;
    v11[3] = 0;
    v11[1] = 0;
    v11[4] = 0x77754300000004;
    *uint64_t v11 = 0xFFFFD80E00000028;
    v11[5] = v9;
    v11[6] = v10;
    *(_DWORD *)uint64_t v11 = 56;
    uint64_t v12 = *(unsigned int **)(a1 + 8);
    int v13 = v12[8] | a4;
    v12[8] = v13;
    unint64_t v14 = *v12;
    if ((v13 & 0x1000) != 0)
    {
      uint64_t v15 = *v12;
      int v16 = v12;
      do
      {
        int v16 = (unsigned int *)((char *)v16 + v15);
        uint64_t v15 = *v16;
        v14 += v15;
      }
      while ((*((unsigned char *)v16 + 33) & 0x20) == 0);
    }
    fbstream_write(*(void *)(a1 + 24), (uint64_t)v12, v14);
  }
  uint64_t v17 = *(void *)(a2 + 72);
  if (v17)
  {
    unint64_t v18 = *(void **)(a1 + 8);
    v18[2] = 0;
    v18[3] = 0;
    v18[1] = 0;
    v18[4] = 0x77754300000004;
    *unint64_t v18 = 0xFFFFD84D00000028;
    v18[5] = v9;
    v18[6] = v17;
    *(_DWORD *)unint64_t v18 = 56;
    int v19 = *(unsigned int **)(a1 + 8);
    int v20 = v19[8] | a4;
    v19[8] = v20;
    uint64_t v21 = *(void *)(a1 + 24);
    unint64_t v22 = *v19;
    if ((v20 & 0x1000) != 0)
    {
      uint64_t v23 = *v19;
      uint64_t v24 = v19;
      do
      {
        uint64_t v24 = (unsigned int *)((char *)v24 + v23);
        uint64_t v23 = *v24;
        v22 += v23;
      }
      while ((*((unsigned char *)v24 + 33) & 0x20) == 0);
    }
    fbstream_write(v21, (uint64_t)v19, v22);
  }
}

void WriteIndirectCommandBufferInfo(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  entry = find_entry(a3, (unsigned char *)(a2 + 8), 8uLL, 0);
  if (*entry && (uint64_t v8 = *(void *)(*entry + 32)) != 0) {
    uint64_t v9 = *(void *)(v8 + 8);
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *(void *)(a2 + 120);
  uint64_t v11 = *(void **)(a1 + 8);
  v11[2] = 0;
  v11[3] = 0;
  v11[1] = 0;
  v11[4] = 0x77754300000004;
  *uint64_t v11 = 0xFFFFD81600000028;
  v11[5] = v9;
  v11[6] = v10;
  *(_DWORD *)uint64_t v11 = 56;
  uint64_t v12 = *(unsigned int **)(a1 + 8);
  LODWORD(v10) = v12[8] | a4;
  v12[8] = v10;
  unint64_t v13 = *v12;
  if ((v10 & 0x1000) != 0)
  {
    uint64_t v14 = *v12;
    uint64_t v15 = v12;
    do
    {
      uint64_t v15 = (unsigned int *)((char *)v15 + v14);
      uint64_t v14 = *v15;
      v13 += v14;
    }
    while ((*((unsigned char *)v15 + 33) & 0x20) == 0);
  }
  fbstream_write(*(void *)(a1 + 24), (uint64_t)v12, v13);
  int v16 = *(_DWORD *)(a2 + 88);
  uint64_t v17 = *(void *)(a1 + 8);
  *(void *)(v17 + 16) = 0;
  *(void *)(v17 + 24) = 0;
  *(void *)(v17 + 8) = 0;
  *(_DWORD *)(v17 + 32) = 6;
  *(_DWORD *)(v17 + 36) = 26947;
  *(void *)uint64_t v17 = 0xFFFFC1CC00000028;
  *(void *)(v17 + 40) = v9;
  *(_DWORD *)(v17 + 48) = v16;
  *(_DWORD *)uint64_t v17 = 52;
  unint64_t v18 = *(unsigned int **)(a1 + 8);
  int v19 = v18[8] | a4;
  v18[8] = v19;
  unint64_t v20 = *v18;
  if ((v19 & 0x1000) != 0)
  {
    uint64_t v21 = *v18;
    unint64_t v22 = v18;
    do
    {
      unint64_t v22 = (unsigned int *)((char *)v22 + v21);
      uint64_t v21 = *v22;
      v20 += v21;
    }
    while ((*((unsigned char *)v22 + 33) & 0x20) == 0);
  }
  fbstream_write(*(void *)(a1 + 24), (uint64_t)v18, v20);
  uint64_t v23 = *(unsigned int *)(a2 + 84);
  uint64_t v24 = *(void **)(a1 + 8);
  v24[2] = 0;
  v24[3] = 0;
  v24[1] = 0;
  v24[4] = 0x6C754300000004;
  *uint64_t v24 = 0xFFFFD81900000028;
  v24[5] = v9;
  v24[6] = v23;
  *(_DWORD *)uint64_t v24 = 56;
  unint64_t v25 = *(unsigned int **)(a1 + 8);
  LODWORD(v23) = v25[8] | a4;
  v25[8] = v23;
  unint64_t v26 = *v25;
  if ((v23 & 0x1000) != 0)
  {
    uint64_t v27 = *v25;
    uint64_t v28 = v25;
    do
    {
      uint64_t v28 = (unsigned int *)((char *)v28 + v27);
      uint64_t v27 = *v28;
      v26 += v27;
    }
    while ((*((unsigned char *)v28 + 33) & 0x20) == 0);
  }
  fbstream_write(*(void *)(a1 + 24), (uint64_t)v25, v26);
  uint64_t v29 = *(void *)(a2 + 56);
  unint64_t v30 = *(void **)(a1 + 8);
  v30[2] = 0;
  v30[3] = 0;
  v30[1] = 0;
  v30[4] = 0x77754300000006;
  void *v30 = 0xFFFFD82600000028;
  v30[5] = v9;
  v30[6] = v29;
  *(_DWORD *)unint64_t v30 = 56;
  uint64_t v31 = *(unsigned int **)(a1 + 8);
  LODWORD(v29) = v31[8] | a4;
  v31[8] = v29;
  unint64_t v32 = *v31;
  if ((v29 & 0x1000) != 0)
  {
    uint64_t v33 = *v31;
    uint64_t v34 = v31;
    do
    {
      uint64_t v34 = (unsigned int *)((char *)v34 + v33);
      uint64_t v33 = *v34;
      v32 += v33;
    }
    while ((*((unsigned char *)v34 + 33) & 0x20) == 0);
  }
  fbstream_write(*(void *)(a1 + 24), (uint64_t)v31, v32);
  uint64_t v35 = *(void *)(a2 + 128);
  uint64_t v36 = *(void **)(a1 + 8);
  v36[2] = 0;
  v36[3] = 0;
  v36[1] = 0;
  v36[4] = 0x77754300000004;
  void *v36 = 0xFFFFD84A00000028;
  v36[5] = v9;
  v36[6] = v35;
  *(_DWORD *)uint64_t v36 = 56;
  int v37 = *(unsigned int **)(a1 + 8);
  LODWORD(v35) = v37[8] | a4;
  v37[8] = v35;
  uint64_t v38 = *(void *)(a1 + 24);
  unint64_t v39 = *v37;
  if ((v35 & 0x1000) != 0)
  {
    uint64_t v40 = *v37;
    int v41 = v37;
    do
    {
      int v41 = (unsigned int *)((char *)v41 + v40);
      uint64_t v40 = *v41;
      v39 += v40;
    }
    while ((*((unsigned char *)v41 + 33) & 0x20) == 0);
  }

  fbstream_write(v38, (uint64_t)v37, v39);
}

void WriteVisibleFunctionTableInfo(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  entry = find_entry(a3, (unsigned char *)(a2 + 8), 8uLL, 0);
  if (*entry && (uint64_t v8 = *(void *)(*entry + 32)) != 0) {
    uint64_t v9 = *(void *)(v8 + 8);
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *(void *)(a2 + 136);
  uint64_t v11 = *(void **)(a1 + 8);
  v11[2] = 0;
  v11[3] = 0;
  v11[1] = 0;
  v11[4] = 0x77754300000004;
  *uint64_t v11 = 0xFFFFD82F00000028;
  v11[5] = v9;
  v11[6] = v10;
  *(_DWORD *)uint64_t v11 = 56;
  uint64_t v12 = *(unsigned int **)(a1 + 8);
  LODWORD(v10) = v12[8] | a4;
  v12[8] = v10;
  unint64_t v13 = *v12;
  if ((v10 & 0x1000) != 0)
  {
    uint64_t v14 = *v12;
    uint64_t v15 = v12;
    do
    {
      uint64_t v15 = (unsigned int *)((char *)v15 + v14);
      uint64_t v14 = *v15;
      v13 += v14;
    }
    while ((*((unsigned char *)v15 + 33) & 0x20) == 0);
  }
  fbstream_write(*(void *)(a1 + 24), (uint64_t)v12, v13);
  uint64_t v16 = *(unsigned int *)(a2 + 84);
  uint64_t v17 = *(void **)(a1 + 8);
  v17[2] = 0;
  v17[3] = 0;
  v17[1] = 0;
  v17[4] = 0x6C754300000000;
  void *v17 = 0xFFFFD84200000028;
  v17[5] = v9;
  v17[6] = v16;
  *(_DWORD *)uint64_t v17 = 56;
  unint64_t v18 = *(unsigned int **)(a1 + 8);
  LODWORD(v16) = v18[8] | a4;
  v18[8] = v16;
  unint64_t v19 = *v18;
  if ((v16 & 0x1000) != 0)
  {
    uint64_t v20 = *v18;
    uint64_t v21 = v18;
    do
    {
      uint64_t v21 = (unsigned int *)((char *)v21 + v20);
      uint64_t v20 = *v21;
      v19 += v20;
    }
    while ((*((unsigned char *)v21 + 33) & 0x20) == 0);
  }
  fbstream_write(*(void *)(a1 + 24), (uint64_t)v18, v19);
  uint64_t v22 = *(void *)(a2 + 56);
  uint64_t v23 = *(void **)(a1 + 8);
  v23[2] = 0;
  v23[3] = 0;
  v23[1] = 0;
  v23[4] = 0x77754300000000;
  void *v23 = 0xFFFFD83F00000028;
  v23[5] = v9;
  v23[6] = v22;
  *(_DWORD *)uint64_t v23 = 56;
  uint64_t v24 = *(unsigned int **)(a1 + 8);
  LODWORD(v22) = v24[8] | a4;
  v24[8] = v22;
  unint64_t v25 = *v24;
  if ((v22 & 0x1000) != 0)
  {
    uint64_t v26 = *v24;
    uint64_t v27 = v24;
    do
    {
      uint64_t v27 = (unsigned int *)((char *)v27 + v26);
      uint64_t v26 = *v27;
      v25 += v26;
    }
    while ((*((unsigned char *)v27 + 33) & 0x20) == 0);
  }
  fbstream_write(*(void *)(a1 + 24), (uint64_t)v24, v25);
  uint64_t v28 = *(void *)(a2 + 152);
  uint64_t v29 = *(void **)(a1 + 8);
  v29[2] = 0;
  v29[3] = 0;
  v29[1] = 0;
  v29[4] = 0x77754300000004;
  *uint64_t v29 = 0xFFFFD85000000028;
  v29[5] = v9;
  v29[6] = v28;
  *(_DWORD *)uint64_t v29 = 56;
  unint64_t v30 = *(unsigned int **)(a1 + 8);
  LODWORD(v28) = v30[8] | a4;
  v30[8] = v28;
  unint64_t v31 = *v30;
  if ((v28 & 0x1000) != 0)
  {
    uint64_t v32 = *v30;
    uint64_t v33 = v30;
    do
    {
      uint64_t v33 = (unsigned int *)((char *)v33 + v32);
      uint64_t v32 = *v33;
      v31 += v32;
    }
    while ((*((unsigned char *)v33 + 33) & 0x20) == 0);
  }
  fbstream_write(*(void *)(a1 + 24), (uint64_t)v30, v31);
  uint64_t v34 = *(void *)(a2 + 160);
  uint64_t v35 = *(void **)(a1 + 8);
  v35[2] = 0;
  v35[3] = 0;
  v35[1] = 0;
  v35[4] = 0x77754300000000;
  *uint64_t v35 = 0xFFFFD85700000028;
  v35[5] = v9;
  v35[6] = v34;
  *(_DWORD *)uint64_t v35 = 56;
  uint64_t v36 = *(unsigned int **)(a1 + 8);
  LODWORD(v34) = v36[8] | a4;
  v36[8] = v34;
  uint64_t v37 = *(void *)(a1 + 24);
  unint64_t v38 = *v36;
  if ((v34 & 0x1000) != 0)
  {
    uint64_t v39 = *v36;
    uint64_t v40 = v36;
    do
    {
      uint64_t v40 = (unsigned int *)((char *)v40 + v39);
      uint64_t v39 = *v40;
      v38 += v39;
    }
    while ((*((unsigned char *)v40 + 33) & 0x20) == 0);
  }

  fbstream_write(v37, (uint64_t)v36, v38);
}

void WriteIntersectionFunctionTableInfo(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  entry = find_entry(a3, (unsigned char *)(a2 + 8), 8uLL, 0);
  if (*entry && (uint64_t v8 = *(void *)(*entry + 32)) != 0) {
    uint64_t v9 = *(void *)(v8 + 8);
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *(void *)(a2 + 144);
  uint64_t v11 = *(void *)(a1 + 8);
  *(void *)(v11 + 16) = 0;
  *(void *)(v11 + 24) = 0;
  *(void *)(v11 + 8) = 0;
  *(_DWORD *)(v11 + 32) = 1;
  *(_DWORD *)(v11 + 36) = 67;
  *(void *)uint64_t v11 = 0xFFFFD84100000028;
  *(void *)(v11 + 40) = v9;
  *(_DWORD *)(v11 + 48) = 30581;
  *(void *)(v11 + 52) = v10;
  *(_DWORD *)uint64_t v11 = 60;
  uint64_t v12 = *(unsigned int **)(a1 + 8);
  LODWORD(v10) = v12[8] | a4;
  v12[8] = v10;
  unint64_t v13 = *v12;
  if ((v10 & 0x1000) != 0)
  {
    uint64_t v14 = *v12;
    uint64_t v15 = v12;
    do
    {
      uint64_t v15 = (unsigned int *)((char *)v15 + v14);
      uint64_t v14 = *v15;
      v13 += v14;
    }
    while ((*((unsigned char *)v15 + 33) & 0x20) == 0);
  }
  fbstream_write(*(void *)(a1 + 24), (uint64_t)v12, v13);
  uint64_t v16 = *(unsigned int *)(a2 + 84);
  uint64_t v17 = *(void **)(a1 + 8);
  v17[2] = 0;
  v17[3] = 0;
  v17[1] = 0;
  v17[4] = 0x6C754300000000;
  void *v17 = 0xFFFFD83D00000028;
  v17[5] = v9;
  v17[6] = v16;
  *(_DWORD *)uint64_t v17 = 56;
  unint64_t v18 = *(unsigned int **)(a1 + 8);
  LODWORD(v16) = v18[8] | a4;
  v18[8] = v16;
  unint64_t v19 = *v18;
  if ((v16 & 0x1000) != 0)
  {
    uint64_t v20 = *v18;
    uint64_t v21 = v18;
    do
    {
      uint64_t v21 = (unsigned int *)((char *)v21 + v20);
      uint64_t v20 = *v21;
      v19 += v20;
    }
    while ((*((unsigned char *)v21 + 33) & 0x20) == 0);
  }
  fbstream_write(*(void *)(a1 + 24), (uint64_t)v18, v19);
  uint64_t v22 = *(void *)(a2 + 56);
  uint64_t v23 = *(void **)(a1 + 8);
  v23[2] = 0;
  v23[3] = 0;
  v23[1] = 0;
  v23[4] = 0x77754300000000;
  void *v23 = 0xFFFFD84000000028;
  v23[5] = v9;
  v23[6] = v22;
  *(_DWORD *)uint64_t v23 = 56;
  uint64_t v24 = *(unsigned int **)(a1 + 8);
  LODWORD(v22) = v24[8] | a4;
  v24[8] = v22;
  unint64_t v25 = *v24;
  if ((v22 & 0x1000) != 0)
  {
    uint64_t v26 = *v24;
    uint64_t v27 = v24;
    do
    {
      uint64_t v27 = (unsigned int *)((char *)v27 + v26);
      uint64_t v26 = *v27;
      v25 += v26;
    }
    while ((*((unsigned char *)v27 + 33) & 0x20) == 0);
  }
  fbstream_write(*(void *)(a1 + 24), (uint64_t)v24, v25);
  uint64_t v28 = *(void *)(a2 + 152);
  uint64_t v29 = *(void **)(a1 + 8);
  v29[2] = 0;
  v29[3] = 0;
  v29[1] = 0;
  v29[4] = 0x77754300000004;
  *uint64_t v29 = 0xFFFFD84F00000028;
  v29[5] = v9;
  v29[6] = v28;
  *(_DWORD *)uint64_t v29 = 56;
  unint64_t v30 = *(unsigned int **)(a1 + 8);
  LODWORD(v28) = v30[8] | a4;
  v30[8] = v28;
  uint64_t v31 = *(void *)(a1 + 24);
  unint64_t v32 = *v30;
  if ((v28 & 0x1000) != 0)
  {
    uint64_t v33 = *v30;
    uint64_t v34 = v30;
    do
    {
      uint64_t v34 = (unsigned int *)((char *)v34 + v33);
      uint64_t v33 = *v34;
      v32 += v33;
    }
    while ((*((unsigned char *)v34 + 33) & 0x20) == 0);
  }

  fbstream_write(v31, (uint64_t)v30, v32);
}

void WriteAccelerationStructureInfo(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  entry = find_entry(a3, (unsigned char *)(a2 + 8), 8uLL, 0);
  if (*entry && (uint64_t v8 = *(void *)(*entry + 32)) != 0) {
    uint64_t v9 = *(void *)(v8 + 8);
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *(void *)(a2 + 152);
  if (v10)
  {
    uint64_t v11 = *(void **)(a1 + 8);
    v11[2] = 0;
    v11[3] = 0;
    v11[1] = 0;
    v11[4] = 0x77754300000000;
    *uint64_t v11 = 0xFFFFD84600000028;
    v11[5] = v9;
    v11[6] = v10;
    *(_DWORD *)uint64_t v11 = 56;
    uint64_t v12 = *(unsigned int **)(a1 + 8);
    int v13 = v12[8] | a4;
    v12[8] = v13;
    unint64_t v14 = *v12;
    if ((v13 & 0x1000) != 0)
    {
      uint64_t v15 = *v12;
      uint64_t v16 = v12;
      do
      {
        uint64_t v16 = (unsigned int *)((char *)v16 + v15);
        uint64_t v15 = *v16;
        v14 += v15;
      }
      while ((*((unsigned char *)v16 + 33) & 0x20) == 0);
    }
    fbstream_write(*(void *)(a1 + 24), (uint64_t)v12, v14);
  }
  uint64_t v17 = *(void *)(a2 + 160);
  if (v17)
  {
    long long v18 = *(_OWORD *)(a2 + 168);
    uint64_t v19 = *(unsigned __int16 *)(a2 + 96);
    long long v20 = *(_OWORD *)(a2 + 192);
    uint64_t v21 = *(void *)(a1 + 8);
    *(void *)(v21 + 8) = 0;
    *(void *)(v21 + 16) = 0;
    *(void *)(v21 + 24) = 0;
    *(void *)uint64_t v21 = 0xFFFFD83A00000024;
    *(_DWORD *)(v21 + 32) = 0;
    strcpy((char *)(v21 + 36), "Cuwuwuwululul");
    *(_WORD *)(v21 + 50) = 0;
    *(void *)(v21 + 52) = v9;
    *(void *)(v21 + 60) = v17;
    *(_OWORD *)(v21 + 68) = v18;
    *(void *)(v21 + 84) = v19;
    *(_OWORD *)(v21 + 92) = v20;
    *(_DWORD *)uint64_t v21 = 108;
    uint64_t v22 = *(unsigned int **)(a1 + 8);
    int v23 = v22[8] | a4;
    v22[8] = v23;
    unint64_t v24 = *v22;
    if ((v23 & 0x1000) != 0)
    {
      uint64_t v25 = *v22;
      uint64_t v26 = v22;
      do
      {
        uint64_t v26 = (unsigned int *)((char *)v26 + v25);
        uint64_t v25 = *v26;
        v24 += v25;
      }
      while ((*((unsigned char *)v26 + 33) & 0x20) == 0);
    }
    fbstream_write(*(void *)(a1 + 24), (uint64_t)v22, v24);
  }
  uint64_t v27 = *(void *)(a2 + 128);
  uint64_t v28 = *(void *)(a1 + 8);
  *(void *)(v28 + 16) = 0;
  *(void *)(v28 + 24) = 0;
  *(void *)(v28 + 8) = 0;
  *(_DWORD *)(v28 + 32) = 5;
  *(_DWORD *)(v28 + 36) = 67;
  *(void *)uint64_t v28 = 0xFFFFD83B00000028;
  *(void *)(v28 + 40) = v9;
  *(_DWORD *)(v28 + 48) = 30581;
  *(void *)(v28 + 52) = v27;
  *(_DWORD *)uint64_t v28 = 60;
  uint64_t v29 = *(unsigned int **)(a1 + 8);
  LODWORD(v27) = v29[8] | a4;
  v29[8] = v27;
  unint64_t v30 = *v29;
  if ((v27 & 0x1000) != 0)
  {
    uint64_t v31 = *v29;
    unint64_t v32 = v29;
    do
    {
      unint64_t v32 = (unsigned int *)((char *)v32 + v31);
      uint64_t v31 = *v32;
      v30 += v31;
    }
    while ((*((unsigned char *)v32 + 33) & 0x20) == 0);
  }
  fbstream_write(*(void *)(a1 + 24), (uint64_t)v29, v30);
  uint64_t v33 = *(unsigned int *)(a2 + 84);
  uint64_t v34 = *(void **)(a1 + 8);
  v34[2] = 0;
  v34[3] = 0;
  v34[1] = 0;
  v34[4] = 0x6C754300000006;
  void *v34 = 0xFFFFD82C00000028;
  v34[5] = v9;
  v34[6] = v33;
  *(_DWORD *)uint64_t v34 = 56;
  uint64_t v35 = *(unsigned int **)(a1 + 8);
  LODWORD(v33) = v35[8] | a4;
  v35[8] = v33;
  unint64_t v36 = *v35;
  if ((v33 & 0x1000) != 0)
  {
    uint64_t v37 = *v35;
    unint64_t v38 = v35;
    do
    {
      unint64_t v38 = (unsigned int *)((char *)v38 + v37);
      uint64_t v37 = *v38;
      v36 += v37;
    }
    while ((*((unsigned char *)v38 + 33) & 0x20) == 0);
  }
  fbstream_write(*(void *)(a1 + 24), (uint64_t)v35, v36);
  uint64_t v39 = *(void *)(a2 + 56);
  uint64_t v40 = *(void **)(a1 + 8);
  v40[2] = 0;
  v40[3] = 0;
  v40[1] = 0;
  v40[4] = 0x77754300000006;
  void *v40 = 0xFFFFD82B00000028;
  v40[5] = v9;
  v40[6] = v39;
  *(_DWORD *)uint64_t v40 = 56;
  int v41 = *(unsigned int **)(a1 + 8);
  LODWORD(v39) = v41[8] | a4;
  v41[8] = v39;
  unint64_t v42 = *v41;
  if ((v39 & 0x1000) != 0)
  {
    uint64_t v43 = *v41;
    int v44 = v41;
    do
    {
      int v44 = (unsigned int *)((char *)v44 + v43);
      uint64_t v43 = *v44;
      v42 += v43;
    }
    while ((*((unsigned char *)v44 + 33) & 0x20) == 0);
  }
  fbstream_write(*(void *)(a1 + 24), (uint64_t)v41, v42);
  int v45 = *(_DWORD *)(a2 + 88);
  uint64_t v46 = *(void *)(a1 + 8);
  *(void *)(v46 + 16) = 0;
  *(void *)(v46 + 24) = 0;
  *(void *)(v46 + 8) = 0;
  *(_DWORD *)(v46 + 32) = 6;
  *(_DWORD *)(v46 + 36) = 26947;
  *(void *)uint64_t v46 = 0xFFFFC2D400000028;
  *(void *)(v46 + 40) = v9;
  *(_DWORD *)(v46 + 48) = v45;
  *(_DWORD *)uint64_t v46 = 52;
  int v47 = *(unsigned int **)(a1 + 8);
  int v48 = v47[8] | a4;
  v47[8] = v48;
  unint64_t v49 = *v47;
  if ((v48 & 0x1000) != 0)
  {
    uint64_t v50 = *v47;
    unint64_t v51 = v47;
    do
    {
      unint64_t v51 = (unsigned int *)((char *)v51 + v50);
      uint64_t v50 = *v51;
      v49 += v50;
    }
    while ((*((unsigned char *)v51 + 33) & 0x20) == 0);
  }
  fbstream_write(*(void *)(a1 + 24), (uint64_t)v47, v49);
  if (*(void *)(a2 + 48))
  {
    uint64_t v52 = *(void *)(*(void *)(a2 + 120) + 72) - *(void *)(*(void *)(a2 + 120) + 80);
    char v53 = *(void **)(a1 + 8);
    v53[2] = 0;
    v53[3] = 0;
    v53[1] = 0;
    v53[4] = 0x6C754300000000;
    void *v53 = 0xFFFFD84700000028;
    v53[5] = v9;
    v53[6] = v52;
    *(_DWORD *)char v53 = 56;
    uint64_t v54 = *(unsigned int **)(a1 + 8);
    LODWORD(v52) = v54[8] | a4;
    v54[8] = v52;
    unint64_t v55 = *v54;
    if ((v52 & 0x1000) != 0)
    {
      uint64_t v56 = *v54;
      unint64_t v57 = v54;
      do
      {
        unint64_t v57 = (unsigned int *)((char *)v57 + v56);
        uint64_t v56 = *v57;
        v55 += v56;
      }
      while ((*((unsigned char *)v57 + 33) & 0x20) == 0);
    }
    fbstream_write(*(void *)(a1 + 24), (uint64_t)v54, v55);
  }
  uint64_t v58 = *(void *)(a2 + 136);
  uint64_t v59 = *(void **)(a1 + 8);
  v59[2] = 0;
  v59[3] = 0;
  v59[1] = 0;
  v59[4] = 0x77754300000004;
  void *v59 = 0xFFFFD84900000028;
  v59[5] = v9;
  v59[6] = v58;
  *(_DWORD *)uint64_t v59 = 56;
  uint64_t v60 = *(unsigned int **)(a1 + 8);
  LODWORD(v58) = v60[8] | a4;
  v60[8] = v58;
  uint64_t v61 = *(void *)(a1 + 24);
  unint64_t v62 = *v60;
  if ((v58 & 0x1000) != 0)
  {
    uint64_t v63 = *v60;
    int v64 = v60;
    do
    {
      int v64 = (unsigned int *)((char *)v64 + v63);
      uint64_t v63 = *v64;
      v62 += v63;
    }
    while ((*((unsigned char *)v64 + 33) & 0x20) == 0);
  }

  fbstream_write(v61, (uint64_t)v60, v62);
}

void FlushChainedLibraryInfo(uint64_t *a1, uint64_t a2, uint64_t a3, int a4)
{
  entry = find_entry(a3, (unsigned char *)(a2 + 8), 8uLL, 0);
  if (*entry && (uint64_t v8 = *(void *)(*entry + 32)) != 0) {
    uint64_t v9 = *(void *)(v8 + 8);
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = (unsigned int *)a1[1];
  int v11 = v10[8] | a4;
  v10[8] = v11;
  if (*(unsigned char *)(a2 + 161) == 1)
  {
    v10[8] = v11 | 0x1000;
    fbstream_write(a1[3], (uint64_t)v10, *v10);
    uint64_t v17 = a1[1];
    *(_DWORD *)(v17 + 32) = 0;
    *(_OWORD *)uint64_t v17 = 0u;
    *(_OWORD *)(v17 + 16) = 0u;
    uint64_t v18 = a1[1];
    *(_DWORD *)(v18 + 32) = 198;
    *(void *)uint64_t v18 = 0xFFFFD01000000024;
    uint64_t v15 = (unsigned int *)a1[1];
    uint64_t v37 = *a1;
    *(_DWORD *)unint64_t v38 = 127;
    memset(&v38[4], 0, 36);
    *(void *)&v38[8] = *(void *)(a2 + 136);
  }
  else
  {
    if (*(unsigned char *)(a2 + 161)) {
      goto LABEL_10;
    }
    v10[8] = v11 | 0x1000;
    fbstream_write(a1[3], (uint64_t)v10, *v10);
    uint64_t v13 = a1[1];
    *(_DWORD *)(v13 + 32) = 0;
    *(_OWORD *)uint64_t v13 = 0u;
    *(_OWORD *)(v13 + 16) = 0u;
    uint64_t v14 = a1[1];
    *(_DWORD *)(v14 + 32) = 198;
    *(void *)uint64_t v14 = 0xFFFFD01000000024;
    *(void *)&v38[32] = 0;
    uint64_t v15 = (unsigned int *)a1[1];
    uint64_t v37 = *a1;
    *(void *)unint64_t v38 = 108;
    unint64_t v16 = *(void *)(a2 + 144);
    *(void *)&v38[8] = v9;
    *(_OWORD *)&v38[16] = v16;
  }
  DYTraceEncode_InternalData((uint64_t)&v37, v15, *((unsigned int *)a1 + 4), v12, 0);
  uint64_t v10 = (unsigned int *)a1[1];
  v10[8] |= 0x2000u;
LABEL_10:
  uint64_t v19 = *v10;
  if ((*((unsigned char *)v10 + 33) & 0x10) != 0)
  {
    uint64_t v21 = v10;
    unint64_t v20 = *v10;
    do
    {
      uint64_t v21 = (unsigned int *)((char *)v21 + v19);
      uint64_t v19 = *v21;
      v20 += v19;
    }
    while ((*((unsigned char *)v21 + 33) & 0x20) == 0);
  }
  else
  {
    unint64_t v20 = *v10;
  }
  fbstream_write(a1[3], (uint64_t)v10, v20);
  uint64_t v22 = *(unsigned __int8 *)(a2 + 160);
  uint64_t v23 = a1[1];
  *(void *)(v23 + 16) = 0;
  *(void *)(v23 + 24) = 0;
  *(void *)(v23 + 8) = 0;
  *(_DWORD *)(v23 + 32) = 5;
  *(_DWORD *)(v23 + 36) = 67;
  *(void *)uint64_t v23 = 0xFFFFD83900000028;
  *(void *)(v23 + 40) = v9;
  *(_DWORD *)(v23 + 48) = 27765;
  *(void *)(v23 + 52) = v22;
  *(_DWORD *)uint64_t v23 = 60;
  unint64_t v24 = (unsigned int *)a1[1];
  LODWORD(v22) = v24[8] | a4;
  v24[8] = v22;
  unint64_t v25 = *v24;
  if ((v22 & 0x1000) != 0)
  {
    uint64_t v26 = *v24;
    uint64_t v27 = v24;
    do
    {
      uint64_t v27 = (unsigned int *)((char *)v27 + v26);
      uint64_t v26 = *v27;
      v25 += v26;
    }
    while ((*((unsigned char *)v27 + 33) & 0x20) == 0);
  }
  fbstream_write(a1[3], (uint64_t)v24, v25);
  uint64_t v28 = *(const char **)(a2 + 128);
  if (v28)
  {
    uint64_t v29 = (unsigned int *)a1[1];
    *((void *)v29 + 1) = 0;
    *((void *)v29 + 2) = 0;
    *((void *)v29 + 3) = 0;
    *((void *)v29 + 4) = 0x534300000004;
    *(void *)uint64_t v29 = 0xFFFFD83400000028;
    *((void *)v29 + 5) = v9;
    *uint64_t v29 = 48;
    AppendString(v28, (int *)v29);
    uint64_t v30 = *v29;
    uint64_t v31 = (v30 + 3) & 0xFFFFFFFC;
    bzero((char *)v29 + v30, v31 - v30);
    *uint64_t v29 = v31;
    unint64_t v32 = (unsigned int *)a1[1];
    int v33 = v32[8] | a4;
    v32[8] = v33;
    unint64_t v34 = *v32;
    if ((v33 & 0x1000) != 0)
    {
      uint64_t v35 = *v32;
      unint64_t v36 = v32;
      do
      {
        unint64_t v36 = (unsigned int *)((char *)v36 + v35);
        uint64_t v35 = *v36;
        v34 += v35;
      }
      while ((*((unsigned char *)v36 + 33) & 0x20) == 0);
    }
    fbstream_write(a1[3], (uint64_t)v32, v34);
  }
}

void FlushChainedPipelineLibraryInfo(uint64_t *a1, uint64_t a2, uint64_t a3, int a4)
{
  find_entry(a3, (unsigned char *)(a2 + 8), 8uLL, 0);
  int v7 = (unsigned int *)a1[1];
  v7[8] |= a4 | 0x1000;
  if (*(void *)(a2 + 48))
  {
    fbstream_write(a1[3], (uint64_t)v7, *v7);
    uint64_t v8 = a1[1];
    *(_DWORD *)(v8 + 32) = 0;
    *(_OWORD *)uint64_t v8 = 0u;
    *(_OWORD *)(v8 + 16) = 0u;
    uint64_t v9 = a1[1];
    *(_DWORD *)(v9 + 32) = 198;
    *(void *)uint64_t v9 = 0xFFFFD01000000024;
    uint64_t v10 = (unsigned int *)a1[1];
    uint64_t v26 = *a1;
    *(_DWORD *)uint64_t v27 = 132;
    memset(&v27[4], 0, 36);
    *(void *)&v27[8] = *(void *)(a2 + 48);
    DYTraceEncode_InternalData((uint64_t)&v26, v10, *((unsigned int *)a1 + 4), v11, 0);
  }
  if (*(_WORD *)(a2 + 80))
  {
    unint64_t v12 = 0;
    do
    {
      fbstream_write(a1[3], a1[1], *(unsigned int *)a1[1]);
      uint64_t v13 = a1[1];
      *(_DWORD *)(v13 + 32) = 0;
      *(_OWORD *)uint64_t v13 = 0u;
      *(_OWORD *)(v13 + 16) = 0u;
      uint64_t v14 = a1[1];
      *(_DWORD *)(v14 + 32) = 198;
      *(void *)uint64_t v14 = 0xFFFFD01000000024;
      memset(&v27[8], 0, 32);
      uint64_t v26 = *a1;
      *(void *)uint64_t v27 = 135;
      uint64_t v15 = __chkstk_darwin(a1[4], *(void *)(*(void *)(a2 + 64) + 8 * v12));
      *((unsigned char *)&v25 - 16) = 0;
      *((_OWORD *)&v25 - 3) = v16;
      *((_OWORD *)&v25 - 2) = v16;
      *((_OWORD *)&v25 - 5) = v16;
      *((_OWORD *)&v25 - 4) = v16;
      *(void *)&v27[8] = SaveFileWithURL(v15, v17, (char *)&v25 - 80, 0, 1);
      *(void *)&v27[16] = *(void *)(*(void *)(a2 + 72) + 8 * v12);
      DYTraceEncode_InternalData((uint64_t)&v26, (unsigned int *)a1[1], *((unsigned int *)a1 + 4), v18, 0);
      ++v12;
    }
    while (v12 < *(unsigned __int16 *)(a2 + 80));
  }
  uint64_t v19 = (unsigned int *)a1[1];
  unsigned int v20 = v19[8];
  if ((v20 & 0x1000) != 0) {
    unsigned int v21 = v20 & 0xFFFFEFFF;
  }
  else {
    unsigned int v21 = v20 | 0x2000;
  }
  v19[8] = v21;
  unint64_t v22 = *v19;
  if ((v21 & 0x1000) != 0)
  {
    uint64_t v23 = *v19;
    unint64_t v24 = v19;
    do
    {
      unint64_t v24 = (unsigned int *)((char *)v24 + v23);
      uint64_t v23 = *v24;
      v22 += v23;
    }
    while ((*((unsigned char *)v24 + 33) & 0x20) == 0);
  }
  fbstream_write(a1[3], (uint64_t)v19, v22);
}

apr_array_header_t *ActiveDevices(uint64_t a1, uint64_t a2, uint64_t a3, apr_pool_t *p)
{
  int v7 = apr_array_make(p, 2, 8);
  if (*(int *)(a3 + 12) >= 1)
  {
    for (uint64_t i = 0; i < *(int *)(a3 + 12); ++i)
    {
      *(void *)&long long v17 = *(void *)(*(void *)(a3 + 24) + 8 * i);
      entry = find_entry(a1, &v17, 8uLL, 0);
      if (*entry && (uint64_t v10 = *(void *)(*entry + 32)) != 0)
      {
        uint64_t v11 = *(void *)(v10 + 32);
        if (v11) {
          uint64_t v12 = v11 + 64;
        }
        else {
          uint64_t v12 = 0;
        }
      }
      else
      {
        uint64_t v12 = 0;
      }
      if (*(_DWORD *)(v12 + 8) == -15350)
      {
        long long v17 = 0uLL;
        uint64_t v18 = 0;
        long long v20 = 0uLL;
        long long v21 = 0uLL;
        LODWORD(v17) = 52;
        uint64_t v19 = -1;
        GTMTLSMIOCommandQueue_processTraceFuncWithMap((char *)&v17, a2, (uint64_t *)v12);
        uint64_t v13 = *((void *)&v20 + 1);
        uint64_t nelts = v7->nelts;
        if ((int)nelts < 1) {
          goto LABEL_21;
        }
        uint64_t v15 = 0;
        while (*(void *)&v7->elts[8 * v15] != *((void *)&v20 + 1))
        {
          if (nelts == ++v15) {
            goto LABEL_21;
          }
        }
      }
      else
      {
        long long v17 = 0uLL;
        uint64_t v18 = 0;
        long long v21 = 0uLL;
        long long v22 = 0uLL;
        long long v20 = 0uLL;
        LODWORD(v17) = 27;
        uint64_t v19 = -1;
        BYTE12(v22) = 1;
        WORD4(v22) = 769;
        GTMTLSMCommandQueue_processTraceFuncWithMap((char *)&v17, a2, (uint64_t *)v12);
        uint64_t v13 = *((void *)&v20 + 1);
        uint64_t nelts = v7->nelts;
        if ((int)nelts < 1) {
          goto LABEL_21;
        }
        uint64_t v15 = 0;
        while (*(void *)&v7->elts[8 * v15] != *((void *)&v20 + 1))
        {
          if (nelts == ++v15) {
            goto LABEL_21;
          }
        }
      }
      if ((int)nelts <= (int)v15) {
LABEL_21:
      }
        *(void *)apr_array_push(v7) = v13;
    }
  }
  return v7;
}

uint64_t CommandQueueForCommandBuffer(uint64_t a1, uint64_t a2)
{
  int v2 = *(_DWORD *)(a2 + 8);
  if ((v2 + 16343) < 2 || v2 == -15333 || v2 == -15701) {
    return *(void *)GTTraceFunc_argumentBytesWithPool((uint64_t *)a2, *(unsigned __int8 *)(a2 + 13), a1);
  }
  else {
    return 0;
  }
}

apr_array_header_t *ActiveCommandQueues(uint64_t a1, uint64_t a2, apr_pool_t *p)
{
  int v5 = apr_array_make(p, 1, 8);
  if (*(int *)(a2 + 12) >= 1)
  {
    uint64_t v6 = 0;
    do
    {
      uint64_t v14 = *(void *)(*(void *)(a2 + 24) + 8 * v6);
      uint64_t v7 = *find_entry(a1, &v14, 8uLL, 0);
      if (v7 && (uint64_t v7 = *(void *)(v7 + 32)) != 0 && (v8 = *(void *)(v7 + 32)) != 0 && (*(unsigned char *)(v8 + 79) & 8) != 0) {
        uint64_t v9 = v8 + 64;
      }
      else {
        uint64_t v9 = 0;
      }
      uint64_t v10 = CommandQueueForCommandBuffer(*(void *)(v7 + 24), v9);
      uint64_t nelts = v5->nelts;
      if ((int)nelts < 1) {
        goto LABEL_14;
      }
      uint64_t v12 = 0;
      while (*(void *)&v5->elts[8 * v12] != v10)
      {
        if (nelts == ++v12) {
          goto LABEL_14;
        }
      }
      if ((int)nelts <= (int)v12) {
LABEL_14:
      }
        *(void *)apr_array_push(v5) = v10;
      ++v6;
    }
    while (v6 < *(int *)(a2 + 12));
  }
  return v5;
}

apr_array_header_t *OrderDispatchCommandBuffers(uint64_t a1, uint64_t a2, uint64_t a3, apr_pool_t *parent)
{
  newpool = 0;
  apr_pool_create_ex(&newpool, parent, 0, 0);
  uint64_t v8 = newpool;
  uint64_t v43 = (apr_pool_t **)apr_hash_make(newpool);
  uint64_t v9 = apr_array_make(parent, 8, 8);
  if (*(int *)(a3 + 12) >= 1)
  {
    uint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *(void *)(a3 + 24);
      int v12 = *(_DWORD *)(v11 + (v10 << 6) + 8);
      if (v12 > -15344)
      {
        if (v12 <= -15317)
        {
          BOOL v13 = v12 == -15343;
          int v14 = -15318;
          goto LABEL_11;
        }
        if (v12 == -15316) {
          goto LABEL_23;
        }
        if (v12 == -15312)
        {
LABEL_18:
          int v45 = GTTraceFunc_targetContext(v11 + (v10 << 6), a2);
          uint64_t v16 = *find_entry(a1, &v45, 8uLL, 0);
          if (v16)
          {
            uint64_t v17 = *(void *)(v16 + 32);
            if (v17)
            {
              uint64_t v18 = *(void *)(v17 + 32);
              if (v18) {
                uint64_t v19 = v18 + 64;
              }
              else {
                uint64_t v19 = 0;
              }
LABEL_39:
              unint64_t v32 = GTTraceFunc_argumentBytesWithMap((void *)v19, *(unsigned __int8 *)(v19 + 14), a2);
              if (v32 && *v32)
              {
                uint64_t v33 = *(void *)(v17 + 24);
                uint64_t v34 = CommandQueueForCommandBuffer(v33, v19);
                QueueForRef = GetQueueForRef(v43, v34);
                uint64_t v36 = *(void *)GTTraceFunc_argumentBytesWithPool((uint64_t *)(v11 + (v10 << 6)), *(unsigned __int8 *)(v11 + (v10 << 6) + 13), v33);
                *(void *)apr_array_push(QueueForRef) = v36;
              }
              goto LABEL_52;
            }
          }
          else
          {
            uint64_t v17 = 0;
          }
          uint64_t v19 = 0;
          goto LABEL_39;
        }
      }
      else
      {
        if (v12 > -16203)
        {
          BOOL v13 = v12 == -16202;
          int v14 = -15908;
LABEL_11:
          if (v13 || v12 == v14)
          {
LABEL_23:
            int v45 = GTTraceFunc_targetContext(v11 + (v10 << 6), a2);
            uint64_t v20 = *find_entry(a1, &v45, 8uLL, 0);
            if (v20)
            {
              uint64_t v21 = *(void *)(v20 + 32);
              if (v21)
              {
                uint64_t v22 = *(void *)(v21 + 32);
                if (v22) {
                  uint64_t v23 = v22 + 64;
                }
                else {
                  uint64_t v23 = 0;
                }
LABEL_30:
                unint64_t v24 = GTTraceFunc_argumentBytesWithMap((void *)v23, *(unsigned __int8 *)(v23 + 14), a2);
                if (v24 && *v24)
                {
                  uint64_t v25 = *(void *)(v21 + 24);
                  uint64_t v26 = CommandQueueForCommandBuffer(v25, v23);
                  uint64_t v27 = GetQueueForRef(v43, v26);
                  uint64_t v28 = *(void *)GTTraceFunc_argumentBytesWithPool((uint64_t *)(v11 + (v10 << 6)), *(unsigned __int8 *)(v11 + (v10 << 6) + 13), v25);
                  uint64_t nelts = v27->nelts;
                  if ((int)nelts < 1) {
                    goto LABEL_43;
                  }
                  uint64_t v30 = 0;
                  elts = v27->elts;
                  while (*(void *)&elts[8 * v30] != v28)
                  {
                    if (nelts == ++v30) {
                      goto LABEL_43;
                    }
                  }
                  if (nelts == v30)
                  {
LABEL_43:
                    *(void *)apr_array_push(v27) = v28;
                    elts = v27->elts;
                    LODWORD(v37) = v27->nelts;
                  }
                  else
                  {
                    LODWORD(v37) = v27->nelts;
                    LODWORD(nelts) = v30;
                  }
                  *(void *)&elts[8 * (int)nelts] |= 0x8000000000000000;
                  if ((int)v37 < 1)
                  {
                    LODWORD(v39) = 0;
                  }
                  else
                  {
                    uint64_t v38 = *(void *)elts;
                    if ((*(void *)elts & 0x8000000000000000) != 0)
                    {
                      uint64_t v40 = 1;
                      do
                      {
                        uint64_t v39 = v40;
                        *(void *)apr_array_push(v9) = v38 & 0x7FFFFFFFFFFFFFFFLL;
                        uint64_t v37 = v27->nelts;
                        elts = v27->elts;
                        if (v39 >= v37) {
                          break;
                        }
                        uint64_t v38 = *(void *)&elts[8 * v39];
                        uint64_t v40 = v39 + 1;
                      }
                      while (v38 < 0);
                    }
                    else
                    {
                      LODWORD(v39) = 0;
                    }
                  }
                  int v41 = v37 - v39;
                  v27->uint64_t nelts = v41;
                  memmove(elts, &elts[8 * v39], v27->elt_size * (uint64_t)v41);
                }
                goto LABEL_52;
              }
            }
            else
            {
              uint64_t v21 = 0;
            }
            uint64_t v23 = 0;
            goto LABEL_30;
          }
          goto LABEL_52;
        }
        if (v12 == -16362) {
          goto LABEL_18;
        }
        if (v12 == -16361) {
          goto LABEL_23;
        }
      }
LABEL_52:
      if (++v10 >= *(int *)(a3 + 12))
      {
        uint64_t v8 = newpool;
        break;
      }
    }
  }
  apr_pool_destroy(v8);
  return v9;
}

apr_array_header_t *GetQueueForRef(apr_pool_t **a1, uint64_t a2)
{
  uint64_t v8 = a2;
  uint64_t v3 = *find_entry((uint64_t)a1, &v8, 8uLL, 0);
  if (!v3 || (size_t v4 = *(apr_array_header_t **)(v3 + 32)) == 0)
  {
    int v5 = *a1;
    size_t v4 = apr_array_make(*a1, 4, 8);
    uint64_t v6 = apr_palloc(v5, 8uLL);
    *uint64_t v6 = v8;
    apr_hash_set((apr_hash_t *)a1, v6, 8, v4);
  }
  return v4;
}

void GTTraceDump_writeCapture(uint64_t a1, apr_pool_t *a2, apr_pool_t *a3)
{
  uint64_t v6 = *(void *)(a1 + 16);
  v9[0] = *(void *)(a1 + 56);
  v9[0] = *(void *)(*(void *)(*find_entry(v6, v9, 8uLL, 0) + 32) + 8);
  v9[1] = apr_palloc(a3, 0x100000uLL);
  v9[2] = 0x100000;
  v9[3] = fbstream_open(a2, (uint64_t)"capture", a3);
  v9[4] = a2;
  v9[5] = a3;
  char v10 = *(unsigned char *)(a1 + 488);
  memset(v11, 0, sizeof(v11));
  uint64_t v7 = (apr_pool_t **)GTTraceDispatch_create(a3, a1);
  GTTraceDispatch_sort((uint64_t)v7, v8);
  GTTraceDispatch_boundaries(v7, (uint64_t)a2);
  GTTraceDispatch_serialize((uint64_t)v7, (uint64_t)v9);
  apr_pool_destroy(*v7);
}

uint64_t GTTraceDump_writeUnsortedCapture(uint64_t a1, apr_pool_t *a2, apr_pool_t *a3)
{
  uint64_t v6 = *(void *)(a1 + 544);
  uint64_t v7 = *(void *)(a1 + 16);
  v13[0] = *(void *)(a1 + 56);
  v13[0] = *(void *)(*(void *)(*find_entry(v7, v13, 8uLL, 0) + 32) + 8);
  v13[1] = apr_palloc(a3, 0x100000uLL);
  v13[2] = 0x100000;
  uint64_t v8 = fbstream_open(a2, (uint64_t)"unsorted-capture", a3);
  data = v8;
  uint64_t v15 = a2;
  uint64_t v16 = 0;
  char v17 = *(unsigned char *)(a1 + 488);
  memset(v18, 0, sizeof(v18));
  if (*(int *)(v6 + 12) < 1)
  {
    uint64_t v11 = v8;
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    do
    {
      GTTraceFuncToFbuf(v13, a1, *(void *)(v6 + 24) + v9, 0);
      ++v10;
      v9 += 64;
    }
    while (v10 < *(int *)(v6 + 12));
    uint64_t v11 = (apr_pool_t **)data;
  }
  apr_pool_cleanup_kill(*v11, v11, (apr_status_t (__cdecl *)(void *))fbstream_cleanup);
  return fbstream_cleanup((uint64_t)v11);
}

uint64_t ResourceTracker_addCommandQueues(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*(int *)(a2 + 12) >= 1)
  {
    int v5 = (uint64_t *)result;
    uint64_t v6 = 0;
    do
    {
      uint64_t v7 = *(void *)(*(void *)(a2 + 24) + 8 * v6);
      uint64_t v8 = *(void *)(a3 + 16);
      uint64_t v10 = v7;
      if (*(_DWORD *)(*(void *)(*(void *)(*find_entry(v8, &v10, 8uLL, 0) + 32) + 32) + 72) == -15350) {
        int v9 = 52;
      }
      else {
        int v9 = 27;
      }
      uint64_t result = GTResourceTrackerUsingResource(v5[2], v9, v7, *v5, v5[1]);
      ++v6;
    }
    while (v6 < *(int *)(a2 + 12));
  }
  return result;
}

uint64_t ResourceTracker_addDrawables(uint64_t *a1, uint64_t a2, unint64_t a3, apr_pool_t *p)
{
  uint64_t v7 = apr_array_make(p, 4, 8);
  uint64_t result = (uint64_t)GTMTLSMContext_getObjects(*(_DWORD **)(a2 + 240), a3, v7);
  if (v7->nelts >= 1)
  {
    uint64_t v9 = 0;
    do
    {
      uint64_t v10 = *(void *)&v7->elts[8 * v9];
      uint64_t v11 = *(void *)(v10 + 48);
      uint64_t result = (uint64_t)find_entry(a1[2], &v11, 8uLL, 0);
      if (*(void *)result)
      {
        if (*(void *)(*(void *)result + 32)) {
          uint64_t result = GTResourceTrackerUsingResource(a1[2], 2, *(void *)(v10 + 8), *a1, a1[1]);
        }
      }
      ++v9;
    }
    while (v9 < v7->nelts);
  }
  return result;
}

uint64_t *ResourceTracker_addIndirectCommands(uint64_t *result, uint64_t a2)
{
  if (*(int *)(a2 + 12) >= 1)
  {
    uint64_t v3 = result;
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    do
    {
      uint64_t result = GTResourceTrackerProcessIndirectCommandResourceUse(v3, *(void *)(a2 + 24) + v4);
      ++v5;
      v4 += 64;
    }
    while (v5 < *(int *)(a2 + 12));
  }
  return result;
}

BOOL IsAppleInternalLabel(BOOL result)
{
  if (result)
  {
    BOOL v1 = result;
    if (!strncmp((const char *)result, "com.apple.", 0xAuLL))
    {
      uint64_t v2 = 0;
      uint64_t v3 = (const char *)(v1 + 10);
      do
      {
        int v4 = strcmp(v3, off_2225C8[v2]);
        uint64_t result = v4 != 0;
        if (!v4) {
          break;
        }
      }
      while (v2++ != 5);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

apr_array_header_t *GTTraceContextDumpGetBoundDownloadRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = apr_array_make(*(apr_pool_t **)a1, 16, 88);
  if (*(int *)(a1 + 344) >= 1)
  {
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)(a1 + 64);
    do
    {
      uint64_t v8 = *(void *)(*(void *)(v7 + 24) + 8 * v6);
      uint64_t v30 = *(void *)(v8 + 8);
      entry = find_entry(a2, &v30, 8uLL, 0);
      if (!*entry || !*(void *)(*entry + 32))
      {
        uint64_t v30 = *(void *)(v8 + 8);
        uint64_t v10 = *(void *)(*(void *)(*find_entry(v4, &v30, 8uLL, 0) + 32) + 8);
        uint64_t v11 = *(void *)(v8 + 8);
        int v12 = (char *)apr_array_push(v5);
        *(void *)int v12 = v10;
        *((void *)v12 + 1) = v11;
        *((void *)v12 + 3) = 0;
        *((void *)v12 + 4) = 0;
        *((void *)v12 + 2) = 0;
        *(void *)(v12 + 38) = 0;
        v12[46] = 22;
        *(_OWORD *)(v12 + 47) = 0u;
        *(_OWORD *)(v12 + 63) = 0u;
        *(_OWORD *)(v12 + 72) = 0u;
      }
      ++v6;
    }
    while (v6 < *(int *)(a1 + 344));
  }
  if (*(int *)(a1 + 348) >= 1)
  {
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)(a1 + 72);
    do
    {
      uint64_t v15 = *(void **)(*(void *)(v14 + 24) + 8 * v13);
      if (!v15[17] && !v15[18] && !v15[24])
      {
        uint64_t v16 = v15[13];
        if (!v16 || !*(unsigned char *)(v16 + 44))
        {
          uint64_t v30 = v15[1];
          char v17 = find_entry(a2, &v30, 8uLL, 0);
          if (!*v17 || !*(void *)(*v17 + 32))
          {
            uint64_t v18 = v15[13];
            if (!v18 || (*(_WORD *)(v18 + 36) & 0xF0) != 0x30)
            {
              uint64_t v30 = v15[1];
              uint64_t v19 = *(void *)(*(void *)(*find_entry(v4, &v30, 8uLL, 0) + 32) + 8);
              uint64_t v20 = v15[1];
              uint64_t v21 = (char *)apr_array_push(v5);
              *(void *)uint64_t v21 = v19;
              *((void *)v21 + 1) = v20;
              *((void *)v21 + 3) = 0;
              *((void *)v21 + 4) = 0;
              *((void *)v21 + 2) = 0;
              *(void *)(v21 + 38) = 0;
              v21[46] = 80;
              *(_OWORD *)(v21 + 47) = 0u;
              *(_OWORD *)(v21 + 63) = 0u;
              *(_OWORD *)(v21 + 72) = 0u;
            }
          }
        }
      }
      ++v13;
    }
    while (v13 < *(int *)(a1 + 348));
  }
  if (*(int *)(a1 + 368) >= 1)
  {
    uint64_t v22 = 0;
    uint64_t v23 = *(void *)(a1 + 112);
    do
    {
      uint64_t v24 = *(void *)(*(void *)(v23 + 24) + 8 * v22);
      uint64_t v30 = *(void *)(v24 + 8);
      uint64_t v25 = find_entry(a2, &v30, 8uLL, 0);
      if (!*v25 || !*(void *)(*v25 + 32))
      {
        uint64_t v30 = *(void *)(v24 + 8);
        uint64_t v26 = *(void *)(*(void *)(*find_entry(v4, &v30, 8uLL, 0) + 32) + 16);
        uint64_t v27 = *(void *)(v24 + 8);
        uint64_t v28 = (char *)apr_array_push(v5);
        *(void *)uint64_t v28 = v26;
        *((void *)v28 + 1) = v27;
        *((void *)v28 + 3) = 0;
        *((void *)v28 + 4) = 0;
        *((void *)v28 + 2) = 0;
        *(void *)(v28 + 38) = 0;
        v28[46] = 83;
        *(_OWORD *)(v28 + 47) = 0u;
        *(_OWORD *)(v28 + 63) = 0u;
        *(_OWORD *)(v28 + 72) = 0u;
      }
      ++v22;
    }
    while (v22 < *(int *)(a1 + 368));
  }
  return v5;
}

apr_array_header_t *GTTraceContextDumpGetUnusedDownloadRequest(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 72);
  uint64_t v5 = *(void *)(a1 + 128);
  uint64_t v6 = apr_array_make(*(apr_pool_t **)a1, *(_DWORD *)(v3 + 12)+ *(_DWORD *)(v4 + 12)+ *(_DWORD *)(*(void *)(a1 + 112) + 12)+ *(_DWORD *)(v5 + 12)- (*(_DWORD *)(a1 + 344)+ *(_DWORD *)(a1 + 348)+ *(_DWORD *)(a1 + 368)+ *(_DWORD *)(a1 + 376)), 88);
  uint64_t v7 = *(int *)(a1 + 344);
  if ((int)v7 < *(_DWORD *)(v4 + 12))
  {
    do
    {
      uint64_t v8 = *(void *)(*(void *)(v4 + 24) + 8 * v7);
      if (v8) {
        uint64_t v9 = *(void *)(v8 + 8);
      }
      else {
        uint64_t v9 = 0;
      }
      uint64_t v25 = v9;
      uint64_t v10 = *(void *)(*(void *)(*find_entry(v2, &v25, 8uLL, 0) + 32) + 8);
      uint64_t v11 = (char *)apr_array_push(v6);
      *(void *)uint64_t v11 = v10;
      *((void *)v11 + 1) = v9;
      *((void *)v11 + 3) = 0;
      *((void *)v11 + 4) = 0;
      *((void *)v11 + 2) = 0;
      *(void *)(v11 + 38) = 0;
      v11[46] = 22;
      *(_OWORD *)(v11 + 47) = 0u;
      *(_OWORD *)(v11 + 63) = 0u;
      *(_OWORD *)(v11 + 72) = 0u;
      ++v7;
    }
    while (v7 < *(int *)(v4 + 12));
  }
  uint64_t v12 = *(int *)(a1 + 348);
  int v13 = *(_DWORD *)(v3 + 12);
  if ((int)v12 < v13)
  {
    do
    {
      uint64_t v14 = *(void **)(*(void *)(v3 + 24) + 8 * v12);
      if (!v14[17] && !v14[18])
      {
        uint64_t v15 = v14[1];
        uint64_t v16 = v14[13];
        if (!v16 || (*(_WORD *)(v16 + 36) & 0xF0) != 0x30 && !*(unsigned char *)(v16 + 43))
        {
          uint64_t v25 = v15;
          uint64_t v17 = *(void *)(*(void *)(*find_entry(v2, &v25, 8uLL, 0) + 32) + 8);
          uint64_t v18 = (char *)apr_array_push(v6);
          *(void *)uint64_t v18 = v17;
          *((void *)v18 + 1) = v15;
          *((void *)v18 + 3) = 0;
          *((void *)v18 + 4) = 0;
          *((void *)v18 + 2) = 0;
          *(void *)(v18 + 38) = 0;
          v18[46] = 80;
          *(_OWORD *)(v18 + 47) = 0u;
          *(_OWORD *)(v18 + 63) = 0u;
          *(_OWORD *)(v18 + 72) = 0u;
          int v13 = *(_DWORD *)(v3 + 12);
        }
      }
      ++v12;
    }
    while (v12 < v13);
  }
  uint64_t v19 = *(int *)(a1 + 376);
  if ((int)v19 < *(_DWORD *)(v5 + 12))
  {
    do
    {
      uint64_t v20 = *(void *)(*(void *)(v5 + 24) + 8 * v19);
      if (v20) {
        uint64_t v21 = *(void *)(v20 + 8);
      }
      else {
        uint64_t v21 = 0;
      }
      uint64_t v25 = v21;
      uint64_t v22 = *(void *)(*(void *)(*find_entry(v2, &v25, 8uLL, 0) + 32) + 16);
      uint64_t v23 = (char *)apr_array_push(v6);
      *(void *)uint64_t v23 = v22;
      *((void *)v23 + 1) = v21;
      *((void *)v23 + 3) = 0;
      *((void *)v23 + 4) = 0;
      *((void *)v23 + 2) = 0;
      *(void *)(v23 + 38) = 0;
      v23[46] = 16;
      *(_OWORD *)(v23 + 47) = 0u;
      *(_OWORD *)(v23 + 63) = 0u;
      *(_OWORD *)(v23 + 72) = 0u;
      ++v19;
    }
    while (v19 < *(int *)(v5 + 12));
  }
  return v6;
}

apr_hash_t *DownloadsByCommandBuffer(uint64_t a1, uint64_t a2, apr_pool_t *pool)
{
  uint64_t v6 = apr_hash_make(pool);
  if (*(int *)(a2 + 12) >= 1)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 16;
    do
    {
      uint64_t v9 = (unsigned char *)(*(void *)(a2 + 24) + v8);
      if (*(void *)v9)
      {
        entry = find_entry(*(void *)(a1 + 32), v9 - 8, 8uLL, 0);
        if (*entry)
        {
          uint64_t v11 = *(void *)(*entry + 32);
          if (v11)
          {
            if (*(unsigned char *)(v11 + 48))
            {
              uint64_t v12 = *find_entry((uint64_t)v6, v9, 8uLL, 0);
              if (!v12 || (int v13 = *(apr_array_header_t **)(v12 + 32)) == 0)
              {
                int v13 = apr_array_make(pool, 1, 8);
                uint64_t v14 = apr_palloc(pool, 8uLL);
                *uint64_t v14 = *(void *)v9;
                apr_hash_set(v6, v14, 8, v13);
              }
              *(void *)apr_array_push(v13) = v9 - 16;
            }
          }
        }
      }
      ++v7;
      v8 += 88;
    }
    while (v7 < *(int *)(a2 + 12));
  }
  return v6;
}

void DownloadsByResource(uint64_t a1, apr_hash_t *ht)
{
  int v2 = *(_DWORD *)(a1 + 12);
  if (v2 >= 1)
  {
    int v5 = 0;
    do
    {
      uint64_t v6 = *(void *)(a1 + 24);
      int v7 = v5;
      uint64_t v8 = (v2 - v5);
      if ((int)v8 < 1)
      {
        LODWORD(v8) = 0;
      }
      else if (v8 == 1)
      {
        LODWORD(v8) = 1;
      }
      else
      {
        uint64_t v9 = v6 + 88 * v5;
        uint64_t v10 = *(void *)(v9 + 8);
        uint64_t v11 = (_DWORD *)(v9 + 128);
        uint64_t v12 = 1;
        while (v10 == *((void *)v11 - 4) && *(_DWORD *)(v6 + 88 * v5 + 40) == *v11)
        {
          ++v12;
          v11 += 22;
          if (v8 == v12) {
            goto LABEL_13;
          }
        }
        LODWORD(v8) = v12;
      }
LABEL_13:
      if (!*(_DWORD *)(v6 + 88 * v5 + 40))
      {
        int v13 = (_WORD *)(v6 + 88 * v5);
        v13[22] = v8;
        apr_hash_set(ht, v13 + 4, 8, v13);
        int v2 = *(_DWORD *)(a1 + 12);
      }
      int v5 = v8 + v7;
    }
    while ((int)v8 + v7 < v2);
  }
}

apr_hash_t *DownloadsByResourceDelta(uint64_t a1, uint64_t a2, apr_pool_t *pool)
{
  int v5 = apr_hash_make(pool);
  *(void *)(a2 + 24) = 0;
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 16) = a2;
  *(_DWORD *)(a2 + 40) = 0;
  uint64_t v6 = apr_hash_next((apr_hash_index_t *)(a2 + 16));
  if (v6)
  {
    int v7 = v6;
    do
    {
      uint64_t v8 = *(unsigned char **)(*((void *)v7 + 1) + 32);
      uint64_t v9 = *find_entry(*(void *)(a1 + 32), v8 + 8, 8uLL, 0);
      if (v9)
      {
        uint64_t v10 = *(void *)(v9 + 32);
        if (v10)
        {
          uint64_t v11 = *(void *)(v10 + 32);
          if (v11 != -1)
          {
            uint64_t v12 = *(void *)(v10 + 24);
            BOOL v13 = v12 != -1 && v12 <= v11;
            if (v13 && !*(unsigned char *)(v10 + 48)) {
              apr_hash_set(v5, v8 + 8, 8, v8);
            }
          }
        }
      }
      int v7 = apr_hash_next(v7);
    }
    while (v7);
  }
  return v5;
}

uint64_t GTTraceDump_startContext(uint64_t a1, void *a2, unint64_t a3, uint64_t a4)
{
  uint64_t v8 = g_signpostLog;
  if (os_signpost_enabled((os_log_t)g_signpostLog))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&def_CFBEC, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "TraceContextDumpStart", (const char *)&unk_21C232, buf, 2u);
  }
  p = 0;
  newpool = 0;
  apr_pool_create_ex(&newpool, 0, 0, 0);
  uint64_t v9 = newpool;
  apr_pool_create_ex(&p, newpool, 0, 0);
  uint64_t v10 = (char *)apr_palloc(v9, 0x258uLL);
  uint64_t v11 = (uint64_t)v10;
  if (v10) {
    bzero(v10 + 8, 0x250uLL);
  }
  *(void *)uint64_t v11 = v9;
  *(void *)(v11 + 40) = a3;
  *(void *)(v11 + 48) = a4;
  *(void *)(v11 + 536) = GTTraceContext_buildBacktraceMap(a1, v9);
  *(void *)(v11 + 8) = a1;
  *(unsigned char *)(v11 + 488) = 0;
  *(void *)(v11 + 32) = a2;
  *(_DWORD *)(v11 + 484) = 1;
  v103 = 0;
  uint64_t v99 = a4;
  uint64_t v12 = GTTraceContext_copyStreamMapAndBuildDispatchArray(a1, a3, a4, v9, &v103);
  BOOL v13 = v103;
  *(void *)(v11 + 16) = v103;
  *((void *)v13 + 3) = 0;
  *((void *)v13 + 4) = 0;
  *((void *)v13 + 2) = v13;
  *((_DWORD *)v13 + 10) = 0;
  uint64_t v14 = apr_hash_next((apr_hash_t *)((char *)v13 + 16));
  if (v14)
  {
    do
    {
      uint64_t v15 = *(void *)(*((void *)v14 + 1) + 32);
      if (v15)
      {
        uint64_t v16 = (unint64_t *)(v15 + 56);
        unint64_t v17 = atomic_load(v16);
        unint64_t v18 = v17;
        do
        {
          atomic_compare_exchange_strong((atomic_ullong *volatile)v16, &v18, v17 | 0x10);
          BOOL v42 = v18 == v17;
          unint64_t v17 = v18;
        }
        while (!v42);
      }
      uint64_t v14 = apr_hash_next(v14);
    }
    while (v14);
    uint64_t v9 = newpool;
  }
  atomic_store(2u, (unsigned int *)(a1 + 104));
  GTTraceContext_filterDispatchArray((uint64_t)v12);
  *(void *)(v11 + 24) = apr_hash_make(v9);
  uint64_t v19 = *(void *)(v11 + 16);
  *(void *)(v19 + 24) = 0;
  *(void *)(v19 + 32) = 0;
  *(void *)(v19 + 16) = v19;
  *(_DWORD *)(v19 + 40) = 0;
  uint64_t v20 = apr_hash_next((apr_hash_index_t *)(v19 + 16));
  if (v20)
  {
    uint64_t v21 = v20;
    do
    {
      GTTraceMemPool_buildMemoryMap(*(void *)(*(void *)(*((void *)v21 + 1) + 32) + 24), *(apr_hash_t **)(v11 + 24));
      uint64_t v21 = apr_hash_next(v21);
    }
    while (v21);
  }
  uint64_t v23 = *(void *)(v11 + 16);
  uint64_t v22 = *(void *)(v11 + 24);
  v101 = a2;
  uint64_t v102 = v11;
  unint64_t v100 = a3;
  if (v12->nelts >= 1)
  {
    unint64_t v24 = 0;
    do
    {
      if (v24 >= 8) {
        uint64_t v25 = 8;
      }
      else {
        uint64_t v25 = v24;
      }
      uint64_t v26 = &v12->elts[64 * v24];
      if (*((_DWORD *)v26 + 2) == -7161)
      {
        int v27 = v24 >= 8 ? 8 : v24;
        FuncStreamRef = GTTraceFunc_getFuncStreamRef((uint64_t)&v12->elts[64 * v24], v22);
        elts = v12->elts;
        *(void *)buf = FuncStreamRef;
        entry = find_entry(v23, buf, 8uLL, 0);
        if (v27)
        {
          uint64_t v31 = v25 + 1;
          unint64_t v32 = &elts[64 * (uint64_t)((int)v24 - v27)];
          uint64_t v33 = *(void *)(*(void *)(*entry + 32) + 8);
          while (1)
          {
            uint64_t v34 = &v32[64 * (unint64_t)(v31 - 2)];
            if (*((_DWORD *)v34 + 2) == -7166)
            {
              *(void *)buf = GTTraceFunc_getFuncStreamRef((uint64_t)&v32[64 * (unint64_t)(v31 - 2)], v22);
              if (*(void *)(*(void *)(*find_entry(v23, buf, 8uLL, 0) + 32) + 8) == v33) {
                break;
              }
            }
            if ((unint64_t)--v31 < 2) {
              goto LABEL_31;
            }
          }
          *(_OWORD *)buf = *(_OWORD *)v34;
          long long v107 = *((_OWORD *)v34 + 1);
          long long v108 = *((_OWORD *)v34 + 2);
          long long v109 = *((_OWORD *)v34 + 3);
          memmove(&v32[64 * (unint64_t)(v31 - 2)], v34 + 64, ((v26 - v34) << 26 >> 26) & 0xFFFFFFFFFFFFFFC0);
          *(_OWORD *)uint64_t v26 = *(_OWORD *)buf;
          *((_OWORD *)v26 + 1) = v107;
          *((_OWORD *)v26 + 2) = v108;
          *((_OWORD *)v26 + 3) = v109;
        }
      }
LABEL_31:
      ++v24;
    }
    while ((uint64_t)v24 < v12->nelts);
    a2 = v101;
    uint64_t v11 = v102;
    uint64_t v23 = *(void *)(v102 + 16);
    uint64_t v22 = *(void *)(v102 + 24);
  }
  *(void *)(v11 + 544) = v12;
  uint64_t v35 = OrderDispatchCommandBuffers(v23, v22, (uint64_t)v12, v9);
  uint64_t v36 = ActiveCommandQueues(*(void *)(v11 + 16), (uint64_t)v35, v9);
  uint64_t v37 = ActiveDevices(*(void *)(v11 + 16), *(void *)(v11 + 24), (uint64_t)v36, v9);
  *(void *)(v11 + 552) = v35;
  uint64_t nelts = v37->nelts;
  if (!nelts)
  {
    *(void *)(v11 + 56) = 0;
    goto LABEL_110;
  }
  uint64_t v39 = *(void *)(v11 + 16);
  uint64_t v40 = *(void *)(v11 + 24);
  uint64_t v41 = *a2;
  BOOL v42 = (int)nelts < 1 || v41 == 0;
  if (v42) {
    goto LABEL_44;
  }
  uint64_t v43 = 0;
  while (*(void *)&v37->elts[8 * v43] != v41)
  {
    if (nelts == ++v43) {
      goto LABEL_44;
    }
  }
  if ((int)nelts <= (int)v43)
  {
LABEL_44:
    uint64_t v44 = a2[1];
    if (!v44) {
      goto LABEL_57;
    }
    uint64_t v45 = v36->nelts;
    if ((int)v45 < 1) {
      goto LABEL_57;
    }
    uint64_t v46 = 0;
    while (*(void *)&v36->elts[8 * v46] != v44)
    {
      if (v45 == ++v46) {
        goto LABEL_57;
      }
    }
    if ((int)v45 > (int)v46)
    {
      *(void *)buf = a2[1];
      int v47 = find_entry(v39, buf, 8uLL, 0);
      if (*v47
        && (uint64_t v48 = *(void *)(*v47 + 32)) != 0
        && (uint64_t v49 = *(void *)(v48 + 32)) != 0
        && (*(unsigned char *)(v49 + 79) & 8) != 0)
      {
        uint64_t v50 = (uint64_t *)(v49 + 64);
      }
      else
      {
        uint64_t v50 = 0;
      }
      *(_OWORD *)buf = 0u;
      *(void *)&long long v107 = 0;
      long long v109 = 0u;
      long long v110 = 0u;
      long long v108 = 0u;
      *(_DWORD *)buf = 27;
      *((void *)&v107 + 1) = -1;
      BYTE12(v110) = 1;
      WORD4(v110) = 769;
      GTMTLSMCommandQueue_processTraceFuncWithMap((char *)buf, v40, v50);
      uint64_t v41 = *((void *)&v108 + 1);
    }
    else
    {
LABEL_57:
      uint64_t v41 = *(void *)v37->elts;
    }
  }
  *(void *)(v11 + 56) = v41;
  if (!v41) {
    goto LABEL_110;
  }
  if (v36->nelts < 1)
  {
    int v52 = 0;
  }
  else
  {
    uint64_t v51 = 0;
    int v52 = 0;
    do
    {
      uint64_t v53 = *(void *)&v36->elts[8 * v51];
      uint64_t v54 = *(void *)(v11 + 16);
      *(void *)buf = v53;
      unint64_t v55 = find_entry(v54, buf, 8uLL, 0);
      if (*v55 && (uint64_t v56 = *(void *)(*v55 + 32)) != 0)
      {
        uint64_t v57 = *(void *)(v56 + 32);
        if (v57) {
          uint64_t v58 = v57 + 64;
        }
        else {
          uint64_t v58 = 0;
        }
      }
      else
      {
        uint64_t v58 = 0;
      }
      uint64_t v59 = v11;
      uint64_t v60 = *(void *)(v11 + 56);
      uint64_t v61 = *(void *)(v59 + 24);
      if (*(_DWORD *)(v58 + 8) == -15350)
      {
        *(_OWORD *)buf = 0uLL;
        *(void *)&long long v107 = 0;
        long long v108 = 0uLL;
        long long v109 = 0uLL;
        *(_DWORD *)buf = 52;
        *((void *)&v107 + 1) = -1;
        GTMTLSMIOCommandQueue_processTraceFuncWithMap((char *)buf, v61, (uint64_t *)v58);
      }
      else
      {
        *(_OWORD *)buf = 0uLL;
        *(void *)&long long v107 = 0;
        long long v109 = 0uLL;
        long long v110 = 0uLL;
        long long v108 = 0uLL;
        *(_DWORD *)buf = 27;
        *((void *)&v107 + 1) = -1;
        BYTE12(v110) = 1;
        WORD4(v110) = 769;
        GTMTLSMCommandQueue_processTraceFuncWithMap((char *)buf, v61, (uint64_t *)v58);
      }
      if (v60 == *((void *)&v108 + 1)) {
        *(void *)&v36->elts[8 * v52++] = v53;
      }
      uint64_t v11 = v102;
      ++v51;
    }
    while (v51 < v36->nelts);
  }
  v36->uint64_t nelts = v52;
  if (v35->nelts < 1)
  {
    int v63 = 0;
    unint64_t v64 = v100;
  }
  else
  {
    uint64_t v62 = 0;
    int v63 = 0;
    unint64_t v64 = v100;
    do
    {
      uint64_t v65 = *(void *)&v35->elts[8 * v62];
      uint64_t v66 = *(void *)(v11 + 16);
      *(void *)buf = v65;
      uint64_t v67 = *(void *)(*find_entry(v66, buf, 8uLL, 0) + 32);
      uint64_t v68 = *(void *)(v67 + 32);
      if (v68 && (*(unsigned char *)(v68 + 79) & 8) != 0) {
        uint64_t v69 = v68 + 64;
      }
      else {
        uint64_t v69 = 0;
      }
      uint64_t v70 = CommandQueueForCommandBuffer(*(void *)(v67 + 24), v69);
      uint64_t v71 = v36->nelts;
      if ((int)v71 >= 1)
      {
        uint64_t v72 = 0;
        while (*(void *)&v36->elts[8 * v72] != v70)
        {
          if (v71 == ++v72) {
            goto LABEL_88;
          }
        }
        if ((int)v71 > (int)v72) {
          *(void *)&v35->elts[8 * v63++] = v65;
        }
      }
LABEL_88:
      ++v62;
    }
    while (v62 < v35->nelts);
  }
  v35->uint64_t nelts = v63;
  uint64_t v73 = newpool;
  *(void *)(v11 + 568) = GTMTLSMContext_buildDeviceMirrorWithIgnoreFlags(*(void *)(v11 + 16), *(void *)(v11 + 24), *(void *)(v11 + 544), *(void *)(v11 + 56), v64, v99, newpool, 0, 0);
  int v74 = GTResourceTrackerMake(*(void *)(v11 + 16), *(void *)(v11 + 24), v73);
  uint64_t v75 = p;
  ResourceTracker_addFunctionHandles(v74, *(void *)(v11 + 568), v64, p);
  ResourceTracker_addAccelerationStructures(v74, *(void *)(v11 + 568), v64, v75);
  ResourceTracker_addResourceGroups(v74, *(void *)(v11 + 568), v64, v75);
  uint64_t v76 = *(void *)(v11 + 552);
  if (*(int *)(v76 + 12) >= 1)
  {
    uint64_t v77 = 0;
    do
    {
      uint64_t v78 = *(void *)(*(void *)(v76 + 24) + 8 * v77);
      GTResourceTrackerProcessCommandBuffer(v74, v78, 1);
      uint64_t v79 = *(void *)(v11 + 16);
      *(void *)buf = v78;
      uint64_t v80 = *find_entry(v79, buf, 8uLL, 0);
      if (v80) {
        uint64_t v81 = *(void *)(v80 + 32);
      }
      else {
        uint64_t v81 = 0;
      }
      unint64_t v82 = CommandBufferCommitIndex(v81);
      ResourceTracker_addChainedResources(v74, *(uint64_t **)(v11 + 568), v82, v75);
      ResourceTracker_addDrawables(v74, *(void *)(v11 + 568), v82, v75);
      ResourceTracker_addIndirectResources(v74, *(_DWORD ***)(v11 + 568), v82, v75);
      ResourceTracker_addLibraries(v74, *(void *)(v11 + 568), v82, v75);
      ResourceTracker_addFunctionHandles(v74, *(void *)(v11 + 568), v82, v75);
      ResourceTracker_addAccelerationStructures(v74, *(void *)(v11 + 568), v82, v75);
      ResourceTracker_addResourceGroups(v74, *(void *)(v11 + 568), v82, v75);
      apr_pool_clear(v75);
      ++v77;
      uint64_t v76 = *(void *)(v11 + 552);
    }
    while (v77 < *(int *)(v76 + 12));
  }
  uint64_t v83 = *(void *)(v11 + 544);
  if (*(int *)(v83 + 12) >= 1)
  {
    uint64_t v84 = 0;
    uint64_t v85 = 0;
    do
    {
      GTResourceTrackerProcessIndirectCommandResourceUse(v74, *(void *)(v83 + 24) + v84);
      ++v85;
      v84 += 64;
    }
    while (v85 < *(int *)(v83 + 12));
  }
  uint64_t v11 = v102;
  ResourceTracker_addCommandQueues((uint64_t)v74, (uint64_t)v36, v102);
  ResourceTracker_postAccumulateHeapReads(v74);
  ResourceTracker_processAccelerationStructureReads((uint64_t)v74);
  ResourceTracker_processUsedDrawables((uint64_t)v74);
  uint64_t v86 = 0;
  *(void *)(v102 + 528) = v74[2];
  *(void *)(v102 + 576) = v74;
  do
  {
    uint64_t v87 = apr_array_make(v73, 16, 8);
    uint64_t v88 = v102 + 8 * v86;
    *(void *)(v88 + 64) = v87;
    if ((v86 + 1) > 0x24)
    {
      unsigned int v89 = 0;
    }
    else
    {
      unsigned int v89 = dword_1DA4F0[v86 + 1] - 2;
      if (v89 > 0x51) {
        goto LABEL_107;
      }
    }
    int v90 = byte_1DA584[v89];
    if ((v90 & 0x80000000) == 0)
    {
      long long v91 = *(_DWORD **)(*(void *)(v102 + 568) + 8 * v90 + 8);
      goto LABEL_108;
    }
LABEL_107:
    long long v91 = 0;
LABEL_108:
    GTMTLSMContext_getObjects(v91, v64, v87);
    *(_DWORD *)(v102 + 344 + 4 * v86++) = GTMTLSMObject_sortUsedResources(*(uint64_t **)(*(void *)(v88 + 64) + 24), *(_DWORD *)(*(void *)(v88 + 64) + 12), *(void *)(v102 + 528));
  }
  while (v86 != 35);
  long long v92 = (apr_pool_t **)apr_hash_make(v73);
  *(void *)(v102 + 520) = v92;
  GTMTLSMContext_buildResourceChildrenMap(*(uint64_t **)(v102 + 568), v64, v92);
  GTMTLSMContext_buildLibraryFunctionsMap(*(void *)(v102 + 568), v64, *(apr_pool_t ***)(v102 + 520));
  long long v93 = apr_array_copy(v73, (const apr_array_header_t *)v101[24]);
  char v94 = apr_hash_make(v73);
  *(void *)(v102 + 496) = v94;
  DownloadsByResource((uint64_t)v93, v94);
  *(void *)(v102 + 512) = DownloadsByCommandBuffer((uint64_t)v74, (uint64_t)v93, v73);
  BoundDownloadRequest = GTTraceContextDumpGetBoundDownloadRequest(v102, *(void *)(v102 + 496));
  long long v96 = GTResourceDownloaderProcessRequest(*(apr_pool_t **)v102, (uint64_t)BoundDownloadRequest);
  DownloadFromDevice(*(void *)(v102 + 16), *(void *)(v102 + 56), (uint64_t)v96);
  DownloadsByResource((uint64_t)v96, *(apr_hash_t **)(v102 + 496));
  *(void *)(v102 + 504) = DownloadsByResourceDelta((uint64_t)v74, *(void *)(v102 + 496), v73);
LABEL_110:
  apr_pool_destroy(p);
  long long v97 = g_signpostLog;
  if (os_signpost_enabled((os_log_t)g_signpostLog))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&def_CFBEC, v97, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "TraceContextDumpStart", (const char *)&unk_21C232, buf, 2u);
  }
  return v11;
}

void GTTraceDump_endContext(uint64_t a1)
{
  int v2 = GTTraceContext_cleanupTransientStreams(*(void *)(a1 + 8), *(apr_pool_t **)a1);
  if (v2) {
    ReleaseDebugObjects((uint64_t *)v2->elts, v2->nelts);
  }
  uint64_t v3 = *(apr_pool_t **)a1;

  apr_pool_destroy(v3);
}

int32x2_t GTTraceContextDumpUnusedCount@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 144);
  uint64_t v5 = *(int *)(a1 + 384);
  if ((int)v5 >= *(_DWORD *)(v4 + 12))
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = 0;
    do
    {
      entry = find_entry(*(void *)(a1 + 520), (unsigned char *)(*(void *)(*(void *)(v4 + 24) + 8 * v5) + 8), 8uLL, 0);
      if (*entry)
      {
        uint64_t v8 = *(void *)(*entry + 32);
        if (v8) {
          v6 += *(int *)(v8 + 12);
        }
      }
      ++v5;
    }
    while (v5 < *(int *)(v4 + 12));
  }
  v9.i32[0] = *(_DWORD *)(*(void *)(a1 + 64) + 12);
  v9.i32[1] = *(_DWORD *)(*(void *)(a1 + 72) + 12);
  uint64_t v10 = *(void *)(a1 + 88);
  uint64_t v11 = *(void *)(a1 + 200);
  uint64_t v12 = *(int *)(*(void *)(a1 + 208) + 12) - (uint64_t)*(int *)(a1 + 416);
  *(void *)(a2 + 16) = *(int *)(*(void *)(a1 + 80) + 12) - (uint64_t)*(int *)(a1 + 352);
  *(void *)(a2 + 24) = v12;
  uint64_t v13 = *(int *)(v10 + 12) - (uint64_t)*(int *)(a1 + 356);
  uint64_t v14 = *(void *)(a1 + 104);
  uint64_t v15 = *(int *)(*(void *)(a1 + 96) + 12) - (uint64_t)*(int *)(a1 + 360);
  int32x2_t v16 = vsub_s32(v9, *(int32x2_t *)(a1 + 344));
  *(void *)(a2 + 32) = v13;
  *(void *)(a2 + 40) = v15;
  uint64_t v17 = *(int *)(v14 + 12) - (uint64_t)*(int *)(a1 + 364);
  *(void *)(a2 + 48) = *(int *)(v11 + 12) - (uint64_t)*(int *)(a1 + 412);
  *(void *)(a2 + 56) = v17;
  v18.i32[0] = *(_DWORD *)(*(void *)(a1 + 128) + 12);
  v18.i32[1] = *(_DWORD *)(*(void *)(a1 + 136) + 12);
  uint64_t v19 = *(int *)(*(void *)(a1 + 176) + 12) - (uint64_t)*(int *)(a1 + 400);
  uint64_t v20 = *(int *)(*(void *)(a1 + 168) + 12) - (uint64_t)*(int *)(a1 + 396);
  *(void *)&long long v21 = v16.i32[0];
  *((void *)&v21 + 1) = v16.i32[1];
  *(_OWORD *)a2 = v21;
  int32x2_t v22 = vsub_s32(v18, *(int32x2_t *)(a1 + 376));
  *(void *)&long long v21 = v22.i32[0];
  *((void *)&v21 + 1) = v22.i32[1];
  *(_OWORD *)(a2 + 64) = v21;
  *(void *)(a2 + 80) = v19;
  *(void *)(a2 + 88) = v20;
  v18.i32[0] = *(_DWORD *)(*(void *)(a1 + 240) + 12);
  v18.i32[1] = *(_DWORD *)(*(void *)(a1 + 248) + 12);
  int32x2_t result = vsub_s32(v18, *(int32x2_t *)(a1 + 432));
  *(void *)&long long v21 = result.i32[0];
  *((void *)&v21 + 1) = result.i32[1];
  int32x2_t result = (int32x2_t)result.i32[0];
  *(_OWORD *)(a2 + 96) = v21;
  *(void *)(a2 + 112) = 0;
  *(void *)(a2 + 120) = v6;
  *(void *)(a2 + 128) = *(int *)(*(void *)(a1 + 144) + 12) - (uint64_t)*(int *)(a1 + 384);
  return result;
}

uint64_t GTTraceContextDumpActiveDevice(uint64_t a1)
{
  return *(void *)(a1 + 56);
}

BOOL GTTraceContextDumpContainsValidCommandBuffers(uint64_t a1)
{
  return *(_DWORD *)(*(void *)(a1 + 552) + 12) > 0;
}

uint64_t GTTraceContextDumpEmptyCapture(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = atomic_load((unint64_t *)(*(void *)(a1 + 8) + 80));
  uint64_t v4 = (v3 << 32) + 0x100000000;
  if ((unint64_t)v4 >= 0x100000001)
  {
    unint64_t v5 = v4 >> 32;
    unint64_t v6 = 1;
    while (1)
    {
      while (1)
      {
        v19[0] = v6;
        uint64_t v7 = *find_entry(v2, v19, 8uLL, 0);
        if (v7) {
          break;
        }
        uint64_t v8 = 0;
LABEL_14:
        if (++v6 >= v5) {
          goto LABEL_17;
        }
      }
      uint64_t v8 = *(void *)(v7 + 32);
      if (!v8) {
        goto LABEL_14;
      }
      uint64_t v9 = *(void *)(v8 + 32);
      if (!v9 || (*(unsigned char *)(v9 + 79) & 8) == 0) {
        goto LABEL_14;
      }
      ++v6;
      if (*(_DWORD *)(v9 + 72) == -10239 || v6 >= v5)
      {
        uint64_t v18 = v9 + 64;
        goto LABEL_18;
      }
    }
  }
  uint64_t v8 = 0;
LABEL_17:
  uint64_t v18 = 0;
LABEL_18:
  uint64_t v11 = (char *)apr_palloc(*(apr_pool_t **)a1, 0x400uLL);
  v19[0] = *(void *)(v8 + 8);
  v19[1] = v11;
  v19[2] = 1024;
  uint64_t v12 = fbstream_open(*(apr_pool_t **)(a1 + 32), (uint64_t)"startup-0-platform", *(apr_pool_t **)a1);
  uint64_t v13 = *(void *)(a1 + 32);
  data = v12;
  uint64_t v21 = v13;
  uint64_t v22 = 0;
  char v23 = *(unsigned char *)(a1 + 488);
  memset(v24, 0, sizeof(v24));
  GTTraceFuncToFbuf(v19, a1, v18, 4);
  uint64_t v14 = data;
  apr_pool_cleanup_kill(*(apr_pool_t **)data, data, (apr_status_t (__cdecl *)(void *))fbstream_cleanup);
  fbstream_cleanup((uint64_t)v14);
  uint64_t v15 = fbstream_open(*(apr_pool_t **)(a1 + 32), (uint64_t)"capture", *(apr_pool_t **)a1);
  data = v15;
  apr_pool_cleanup_kill(*v15, v15, (apr_status_t (__cdecl *)(void *))fbstream_cleanup);
  fbstream_cleanup((uint64_t)v15);
  snprintf(v11, 0x400uLL, "delta-device-resources-0x%llx", v19[0]);
  int32x2_t v16 = fbstream_open(*(apr_pool_t **)(a1 + 32), (uint64_t)v11, *(apr_pool_t **)a1);
  data = v16;
  apr_pool_cleanup_kill(*v16, v16, (apr_status_t (__cdecl *)(void *))fbstream_cleanup);
  return fbstream_cleanup((uint64_t)v16);
}

uint64_t HashBytes(uint64_t *a1, unint64_t a2, char *a3)
{
  if (a2 < 0x20)
  {
    unint64_t v12 = 0x27D4EB2F165667C5;
  }
  else
  {
    unint64_t v3 = 0;
    unint64_t v4 = (unint64_t)a1 + a2 - 31;
    unint64_t v5 = 0x61C8864E7A143579;
    unint64_t v6 = 0x60EA27EEADC0B5D6;
    unint64_t v7 = 0xC2B2AE3D27D4EB4FLL;
    do
    {
      uint64_t v8 = __ROR8__(v6 - 0x3D4D51C2D82B14B1 * *a1, 33);
      unint64_t v6 = 0x9E3779B185EBCA87 * v8;
      uint64_t v9 = __ROR8__(v7 - 0x3D4D51C2D82B14B1 * a1[1], 33);
      unint64_t v7 = 0x9E3779B185EBCA87 * v9;
      uint64_t v10 = __ROR8__(v3 - 0x3D4D51C2D82B14B1 * a1[2], 33);
      unint64_t v3 = 0x9E3779B185EBCA87 * v10;
      uint64_t v11 = __ROR8__(v5 - 0x3D4D51C2D82B14B1 * a1[3], 33);
      unint64_t v5 = 0x9E3779B185EBCA87 * v11;
      a1 += 4;
    }
    while ((unint64_t)a1 < v4);
    unint64_t v12 = 0x85EBCA77C2B2AE63
        - 0x61C8864E7A143579
        * ((0x85EBCA77C2B2AE63
          - 0x61C8864E7A143579
          * ((0x85EBCA77C2B2AE63
            - 0x61C8864E7A143579
            * ((0x85EBCA77C2B2AE63
              - 0x61C8864E7A143579
              * ((__ROR8__(v7, 57) + __ROR8__(v6, 63) + __ROR8__(v3, 52) + __ROR8__(v5, 46)) ^ (0x9E3779B185EBCA87
                                                                                              * __ROR8__(0xDEF35B010F796CA9* v8, 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xDEF35B010F796CA9 * v9, 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xDEF35B010F796CA9 * v10, 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xDEF35B010F796CA9 * v11, 33)));
  }
  unint64_t v13 = v12 + a2;
  unint64_t v14 = a2 & 0x1F;
  if (v14 >= 8)
  {
    do
    {
      uint64_t v15 = *a1++;
      unint64_t v13 = 0x85EBCA77C2B2AE63
          - 0x61C8864E7A143579 * __ROR8__((0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v15, 33)) ^ v13, 37);
      v14 -= 8;
    }
    while (v14 > 7);
  }
  if (v14 >= 4)
  {
    unsigned int v16 = *(_DWORD *)a1;
    a1 = (uint64_t *)((char *)a1 + 4);
    unint64_t v13 = 0x165667B19E3779F9 - 0x3D4D51C2D82B14B1 * __ROR8__((0x9E3779B185EBCA87 * v16) ^ v13, 41);
    v14 -= 4;
  }
  for (; v14; --v14)
  {
    unsigned int v17 = *(unsigned __int8 *)a1;
    a1 = (uint64_t *)((char *)a1 + 1);
    unint64_t v13 = 0x9E3779B185EBCA87 * __ROR8__((0x27D4EB2F165667C5 * v17) ^ v13, 53);
  }
  unint64_t v18 = 0x165667B19E3779F9
      * ((0xC2B2AE3D27D4EB4FLL * (v13 ^ (v13 >> 33))) ^ ((0xC2B2AE3D27D4EB4FLL * (v13 ^ (v13 >> 33))) >> 29));
  sprintf(a3, "%llX", v18 ^ HIDWORD(v18));
  return 0;
}

uint64_t SavePointer(uint64_t a1, uint64_t *a2, const void *a3, uint64_t a4)
{
  HashBytes(a2, (unint64_t)a3, __s);
  GTMTLCaptureState_storePointer(a1, __s, a2, a3);
  if (a4)
  {
    long long v8 = v14;
    *(_OWORD *)(a4 + 32) = v13;
    *(_OWORD *)(a4 + 48) = v8;
    *(unsigned char *)(a4 + 64) = v15;
    long long v9 = v12;
    *(_OWORD *)a4 = *(_OWORD *)__s;
    *(_OWORD *)(a4 + 16) = v9;
  }
  return a4;
}

char *SaveFileWithURL(uint64_t a1, char *a2, char *a3, void *a4, int a5)
{
  if (!a2) {
    return 0;
  }
  int v9 = open(a2, 0, 0);
  if (v9 < 0) {
    return 0;
  }
  int v10 = v9;
  uint64_t v11 = (const void *)lseek(v9, 0, 2);
  long long v12 = (uint64_t *)mmap(0, (size_t)v11, 1, 2, v10, 0);
  close(v10);
  if (a4) {
    *a4 -= 65;
  }
  if (a5) {
    SavePointer(a1, v12, v11, (uint64_t)a3);
  }
  else {
    GTMTLCaptureState_storePointer(a1, a3, v12, v11);
  }
  munmap(v12, (size_t)v11);
  return a3;
}

char *SaveFilePath(uint64_t a1, char *a2, char *a3, void *a4)
{
  return SaveFileWithURL(a1, a2, a3, a4, 1);
}

uint64_t GTTrace_storePointer(uint64_t result, int a2, uint64_t a3, char *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = a5;
  uint64_t v8 = (uint64_t)a4;
  uint64_t v49 = a5;
  int v10 = &a4[a5];
  uint64_t v11 = *(void *)(result + 32);
  if (a2 <= -15553)
  {
    if (a2 <= -16030)
    {
      if (a2 <= -16164)
      {
        if (a2 <= -16228)
        {
          if (a2 > -16354)
          {
            switch(a2)
            {
              case -16311:
                int32x2_t result = StoreMTLDepthStencilDescriptorUsingEncode(*(void *)(result + 32), *(void *)(a3 + 16), (uint64_t)a4, &v49);
                goto LABEL_158;
              case -16310:
                goto LABEL_85;
              case -16309:
                int32x2_t result = StoreMTLSamplerDescriptorUsingEncode(*(void *)(result + 32), *(void *)(a3 + 16), (uint64_t)a4, &v49);
                goto LABEL_158;
              case -16308:
              case -16299:
              case -16298:
              case -16297:
              case -16296:
              case -16295:
                return result;
              case -16307:
                goto LABEL_102;
              case -16306:
                goto LABEL_215;
              case -16305:
              case -16304:
                uint64_t v30 = *(void *)(a3 + 16);
                if (*(unsigned char *)(result + 48))
                {
                  uint64_t v8 = *(void *)(a3 + 16);
                }
                else if (v30)
                {
                  uint64_t v7 = a5 - 65;
                  uint64_t v49 = a5 - 65;
                  SavePointer(v11, (uint64_t *)(v30 + 16), (const void *)*(unsigned int *)(v30 + 12), (uint64_t)a4);
                }
                else
                {
                  uint64_t v8 = 0;
                }
                *(void *)(a3 + 16) = v8;
                int32x2_t result = StoreMTLCompileOptionsUsingEncode_14091(v11, *(void *)(a3 + 24), (uint64_t)&v10[-v7], &v49, a6);
                goto LABEL_278;
              case -16303:
              case -16302:
              case -16301:
              case -16300:
                int32x2_t result = StoreMTLRenderPipelineDescriptorUsingEncode(*(void *)(result + 32), *(void *)(a3 + 16), (uint64_t)a4, &v49, a6);
                goto LABEL_158;
              case -16294:
                *(void *)(a3 + 16) = StoreMTLTextureDescriptorUsingEncode(*(void *)(result + 32), *(void *)(a3 + 16), (uint64_t)a4, &v49);
                int32x2_t result = StoreIOSurfaceUsingEncode(v11, *(void *)(a3 + 24), (uint64_t)&v10[-v49], &v49);
                goto LABEL_278;
              default:
                if (a2 != -16353 && a2 != -16351) {
                  return result;
                }
                int32x2_t result = StoreMTLRenderPassDescriptorUsingEncode(*(void *)(result + 32), *(void *)(a3 + 16), (uint64_t)a4, &v49, a6);
                break;
            }
            goto LABEL_158;
          }
          if (a2 == -18432)
          {
            int32x2_t result = StoreMTLFXSpatialScalerDescriptorUsingEncode(*(void *)(result + 32), *(void *)(a3 + 16), (uint64_t)a4, &v49);
            goto LABEL_158;
          }
          if (a2 == -18431)
          {
            int32x2_t result = StoreMTLFXTemporalScalerDescriptorUsingEncode(*(void *)(result + 32), *(unsigned __int16 **)(a3 + 16), (uint64_t)a4, &v49);
            goto LABEL_158;
          }
          if (a2 != -16368) {
            return result;
          }
          goto LABEL_85;
        }
        if (a2 > -16201)
        {
          switch(a2)
          {
            case -16200:
            case -16199:
            case -16198:
            case -16197:
              uint64_t v13 = *(void *)(a3 + 16);
              uint64_t v14 = *(void *)(result + 32);
              uint64_t v15 = (uint64_t)a4;
              goto LABEL_92;
            default:
              if (a2 != -16165) {
                return result;
              }
              int32x2_t result = StoreMTLCommandQueueDescriptorUsingEncode(*(void *)(result + 32), *(unsigned __int8 **)(a3 + 16), (uint64_t)a4, &v49);
              break;
          }
          goto LABEL_158;
        }
        if (a2 == -16227 || a2 == -16225) {
          goto LABEL_155;
        }
        int v17 = -16223;
LABEL_154:
        if (a2 != v17) {
          return result;
        }
        goto LABEL_155;
      }
      if (a2 <= -16040)
      {
        switch(a2)
        {
          case -16120:
            int32x2_t result = StoreMTLHeapDescriptorUsingEncode(*(void *)(result + 32), *(void *)(a3 + 16), (uint64_t)a4, &v49);
            goto LABEL_158;
          case -16119:
          case -16118:
          case -16117:
          case -16115:
          case -16114:
          case -16113:
          case -16111:
          case -16110:
          case -16109:
          case -16108:
          case -16105:
          case -16103:
          case -16102:
          case -16100:
          case -16097:
          case -16094:
          case -16093:
          case -16092:
          case -16086:
          case -16085:
          case -16084:
          case -16083:
          case -16080:
          case -16079:
          case -16078:
            return result;
          case -16116:
          case -16104:
          case -16099:
          case -16098:
            goto LABEL_85;
          case -16112:
            int32x2_t result = StoreMTLTextureDescriptorUsingEncode(*(void *)(result + 32), *(void *)(a3 + 24), (uint64_t)a4, &v49);
            goto LABEL_278;
          case -16107:
          case -16106:
          case -16082:
          case -16081:
            int32x2_t result = StoreMTLFunctionConstantValuesUsingEncode(*(void *)(result + 32), *(uint64_t **)(a3 + 24), (uint64_t)a4, &v49);
            goto LABEL_278;
          case -16101:
            goto LABEL_148;
          case -16096:
            goto LABEL_165;
          case -16095:
          case -16087:
            goto LABEL_215;
          case -16091:
          case -16090:
          case -16089:
          case -16088:
            int32x2_t result = StoreMTLTileRenderPipelineDescriptorUsingEncode(*(void *)(result + 32), *(void *)(a3 + 16), (uint64_t)a4, &v49, a6);
            goto LABEL_158;
          case -16077:
            int32x2_t result = StoreMTLViewportUsingEncode(*(void *)(result + 32), *(const void **)(a3 + 8), (uint64_t)a4, &v49, *(void *)(a3 + 16));
            goto LABEL_238;
          case -16076:
            int32x2_t result = StoreMTLScissorRectUsingEncode(*(void *)(result + 32), *(const void **)(a3 + 8), (uint64_t)a4, &v49, *(void *)(a3 + 16));
            goto LABEL_238;
          default:
            if (a2 != -16163)
            {
              int v17 = -16143;
              goto LABEL_154;
            }
            int32x2_t result = StoreIOSurfaceUsingEncode(*(void *)(result + 32), *(void *)(a3 + 16), (uint64_t)a4, &v49);
            break;
        }
        goto LABEL_158;
      }
      if (a2 == -16039) {
        goto LABEL_102;
      }
      if (a2 != -16031)
      {
        if (a2 == -16030)
        {
          int32x2_t result = StoreMTLTextureDescriptorUsingEncode(*(void *)(result + 32), *(void *)(a3 + 40), (uint64_t)a4, &v49);
LABEL_231:
          *(void *)(a3 + 40) = result;
        }
        return result;
      }
LABEL_165:
      int32x2_t result = StoreMTLTextureDescriptorUsingEncode(*(void *)(result + 32), *(void *)(a3 + 32), (uint64_t)a4, &v49);
LABEL_234:
      *(void *)(a3 + 32) = result;
      return result;
    }
    if (a2 > -15720)
    {
      if (a2 > -15618)
      {
        switch(a2)
        {
          case -15617:
            int32x2_t result = StoreMTLFunctionDescriptorUsingEncode(*(void *)(result + 32), *(void *)(a3 + 24), (uint64_t)a4, &v49, a6);
            goto LABEL_278;
          case -15616:
          case -15614:
          case -15612:
          case -15611:
          case -15610:
            return result;
          case -15615:
            goto LABEL_157;
          case -15613:
            goto LABEL_102;
          case -15609:
          case -15608:
LABEL_55:
            int32x2_t result = StoreMTLFunctionDescriptorUsingEncode(*(void *)(result + 32), *(void *)(a3 + 16), (uint64_t)a4, &v49, a6);
            goto LABEL_158;
          default:
            if (a2 != -15597) {
              return result;
            }
            int32x2_t result = UnwrapArray_(*(void *)(result + 32), *(void *)(a3 + 8), (uint64_t)a4, &v49, *(void *)(a3 + 24), a6);
            break;
        }
        goto LABEL_238;
      }
      if (a2 > -15675)
      {
        if (a2 <= -15665)
        {
          switch(a2)
          {
            case -15674:
              goto LABEL_155;
            case -15666:
LABEL_170:
              int32x2_t result = StoreMTLComputePipelineDescriptorUsingEncode(*(void *)(result + 32), *(void *)(a3 + 8), (uint64_t)a4, &v49, a6);
              break;
            case -15665:
LABEL_110:
              int32x2_t result = StoreMTLRenderPipelineDescriptorUsingEncode(*(void *)(result + 32), *(void *)(a3 + 8), (uint64_t)a4, &v49, a6);
              break;
            default:
              return result;
          }
          goto LABEL_238;
        }
        if (a2 > -15639)
        {
          if (a2 != -15638)
          {
            int v17 = -15624;
            goto LABEL_154;
          }
        }
        else
        {
          if (a2 == -15664)
          {
            int32x2_t result = StoreMTLTileRenderPipelineDescriptorUsingEncode(*(void *)(result + 32), *(void *)(a3 + 8), (uint64_t)a4, &v49, a6);
            goto LABEL_238;
          }
          if (a2 != -15647) {
            return result;
          }
        }
LABEL_157:
        int32x2_t result = StoreMTLAccelerationStructureDescriptorUsingEncode(*(void *)(result + 32), *(unsigned __int8 **)(a3 + 16), (uint64_t)a4, &v49, a6);
        goto LABEL_158;
      }
      if (a2 > -15708)
      {
        if (a2 == -15707) {
          goto LABEL_215;
        }
        if (a2 == -15701)
        {
          int32x2_t result = StoreMTLCommandBufferDescriptorUsingEncode(*(void *)(result + 32), *(uint64_t **)(a3 + 16), (uint64_t)a4, &v49, a6);
          goto LABEL_158;
        }
        if (a2 != -15693) {
          return result;
        }
        uint64_t v20 = *(unint64_t **)(a3 + 24);
        uint64_t v21 = *(void *)(result + 32);
        uint64_t v22 = (uint64_t)a4;
LABEL_268:
        int32x2_t result = UnwrapMTLArray_(v21, v20, v22, &v49, a6);
        goto LABEL_278;
      }
      if (a2 != -15719 && a2 != -15716)
      {
        if (a2 != -15714) {
          return result;
        }
LABEL_73:
        uint64_t v16 = *(void *)(a3 + 24);
        if (v16) {
          goto LABEL_138;
        }
        goto LABEL_219;
      }
    }
    else
    {
      if (a2 <= -15831)
      {
        if (a2 <= -15892)
        {
          switch(a2)
          {
            case -15980:
              goto LABEL_85;
            case -15979:
            case -15978:
            case -15977:
            case -15976:
            case -15975:
            case -15974:
            case -15973:
            case -15970:
            case -15968:
            case -15967:
            case -15966:
            case -15965:
              return result;
            case -15972:
            case -15969:
              int32x2_t result = StoreMTLIndirectCommandBufferDescriptorUsingEncode(*(void *)(result + 32), *(void *)(a3 + 16), (uint64_t)a4, &v49);
              goto LABEL_158;
            case -15971:
              goto LABEL_215;
            case -15964:
            case -15962:
              uint64_t v27 = *(void *)(a3 + 40);
              if (v27) {
                int32x2_t result = SavePointer(*(void *)(result + 32), (uint64_t *)(v27 + 16), (const void *)*(unsigned int *)(v27 + 12), (uint64_t)a4);
              }
              else {
                uint64_t v8 = 0;
              }
              *(void *)(a3 + 40) = v8;
              return result;
            case -15963:
            case -15961:
              uint64_t v28 = *(void *)(a3 + 40);
              if (v28)
              {
                uint64_t v7 = a5 - 65;
                int32x2_t result = SavePointer(*(void *)(result + 32), (uint64_t *)(v28 + 16), (const void *)*(unsigned int *)(v28 + 12), (uint64_t)a4);
              }
              else
              {
                uint64_t v8 = 0;
              }
              *(void *)(a3 + 40) = v8;
              uint64_t v12 = *(void *)(a3 + 48);
              if (!v12) {
                goto LABEL_249;
              }
              uint64_t v8 = (uint64_t)&v10[-v7];
              goto LABEL_248;
            default:
              if (a2 != -16029 && a2 != -16018) {
                return result;
              }
LABEL_148:
              char v23 = *(unint64_t **)(a3 + 16);
              if (v23)
              {
                uint64_t v24 = *v23;
                uint64_t v25 = UnwrapMTLArray_(*(void *)(result + 32), v23, (uint64_t)a4, &v49, a6);
                uint64_t v7 = v49;
              }
              else
              {
                uint64_t v25 = 0;
                uint64_t v24 = 0;
              }
              *(void *)(a3 + 16) = v25;
              int32x2_t result = StoreMTLImageFilterFunctionInfoSPIUsingEncode(v11, *(void *)(a3 + 24), (uint64_t)&v10[-v7], &v49, v24);
              break;
          }
          goto LABEL_278;
        }
        if (a2 == -15891)
        {
          int32x2_t result = StoreMTLMotionEstimationPipelineDescriptorUsingEncode(*(void *)(result + 32), *(unsigned __int16 **)(a3 + 16), (uint64_t)a4, &v49);
          goto LABEL_158;
        }
        if (a2 == -15848)
        {
          int32x2_t result = StoreMTLCounterSampleBufferDescriptorUsingEncode(*(void *)(result + 32), *(void *)(a3 + 16), (uint64_t)a4, &v49);
          goto LABEL_158;
        }
        if (a2 != -15847) {
          return result;
        }
        int32x2_t result = StoreMTLImageFilterFunctionInfoSPIUsingEncode(*(void *)(result + 32), *(void *)(a3 + 32), (uint64_t)a4, &v49, *(void *)(a3 + 24));
        goto LABEL_234;
      }
      if (a2 > -15754)
      {
        switch(a2)
        {
          case -15741:
            goto LABEL_170;
          case -15740:
          case -15738:
          case -15737:
          case -15735:
          case -15734:
          case -15733:
          case -15732:
            return result;
          case -15739:
            goto LABEL_110;
          case -15736:
            int32x2_t result = StoreMTLCaptureDescriptorUsingEncode(*(void *)(result + 32), *(uint64_t **)(a3 + 8), (uint64_t)a4, &v49, a6);
            goto LABEL_238;
          case -15731:
            goto LABEL_215;
          case -15730:
            goto LABEL_126;
          default:
            if (a2 == -15753) {
              goto LABEL_155;
            }
            if (a2 != -15746) {
              return result;
            }
            uint64_t v29 = *(void *)(a3 + 8);
            if (v29)
            {
              uint64_t v7 = a5 - 65;
              int32x2_t result = SavePointer(*(void *)(result + 32), (uint64_t *)(v29 + 16), (const void *)*(unsigned int *)(v29 + 12), (uint64_t)a4);
            }
            else
            {
              uint64_t v8 = 0;
            }
            *(void *)(a3 + 8) = v8;
            uint64_t v39 = *(void *)(a3 + 16);
            if (!v39) {
              goto LABEL_274;
            }
            uint64_t v8 = (uint64_t)&v10[-v7];
            break;
        }
        goto LABEL_216;
      }
      if (a2 <= -15794)
      {
        if (a2 == -15830) {
          goto LABEL_215;
        }
        if (a2 != -15822) {
          return result;
        }
        int32x2_t result = StoreMTLVertexAmplificationViewMappingUsingEncode(*(void *)(result + 32), *(const void **)(a3 + 16), (uint64_t)a4, &v49, *(void *)(a3 + 8));
        goto LABEL_158;
      }
      if (a2 == -15793)
      {
        int32x2_t result = StoreMTLRasterizationRateMapDescriptorUsingEncode(*(void *)(result + 32), *(const char ***)(a3 + 16), (uint64_t)a4, &v49);
        goto LABEL_158;
      }
      if (a2 != -15777)
      {
        if (a2 == -15756)
        {
          uint64_t v12 = *(void *)(a3 + 48);
          if (v12) {
LABEL_248:
          }
            int32x2_t result = SavePointer(v11, (uint64_t *)(v12 + 16), (const void *)*(unsigned int *)(v12 + 12), v8);
          else {
LABEL_249:
          }
            uint64_t v8 = 0;
          *(void *)(a3 + 48) = v8;
        }
        return result;
      }
    }
LABEL_85:
    int32x2_t result = StoreMTLTextureDescriptorUsingEncode(*(void *)(result + 32), *(void *)(a3 + 16), (uint64_t)a4, &v49);
    goto LABEL_158;
  }
  if (a2 <= -15367)
  {
    if (a2 > -15498)
    {
      switch(a2)
      {
        case -15475:
          goto LABEL_55;
        case -15474:
        case -15472:
        case -15471:
        case -15470:
        case -15469:
        case -15468:
        case -15467:
        case -15464:
        case -15463:
        case -15459:
        case -15458:
        case -15457:
        case -15456:
        case -15455:
        case -15454:
        case -15453:
        case -15452:
        case -15451:
        case -15450:
        case -15449:
        case -15448:
        case -15447:
        case -15446:
        case -15445:
        case -15444:
        case -15437:
        case -15436:
        case -15433:
        case -15432:
        case -15431:
        case -15424:
        case -15423:
        case -15422:
          return result;
        case -15473:
          uint64_t v41 = *(void *)(a3 + 80);
          if (v41) {
            int32x2_t result = SavePointer(*(void *)(result + 32), (uint64_t *)(v41 + 16), (const void *)*(unsigned int *)(v41 + 12), (uint64_t)a4);
          }
          else {
            uint64_t v8 = 0;
          }
          *(void *)(a3 + 80) = v8;
          break;
        case -15466:
          *(void *)(a3 + 16) = UnwrapMTLArray_(*(void *)(result + 32), *(unint64_t **)(a3 + 16), (uint64_t)a4, &v49, a6);
          int32x2_t result = StoreMTLAccelerationStructureDescriptorUsingEncode(v11, *(unsigned __int8 **)(a3 + 40), (uint64_t)&v10[-v49], &v49, a6);
          goto LABEL_231;
        case -15465:
          uint64_t v35 = *(unsigned __int8 **)(a3 + 32);
          uint64_t v37 = *(void *)(result + 32);
          uint64_t v36 = (uint64_t)a4;
LABEL_233:
          int32x2_t result = StoreMTLAccelerationStructureDescriptorUsingEncode(v37, v35, v36, &v49, a6);
          goto LABEL_234;
        case -15462:
        case -15443:
        case -15442:
        case -15441:
          goto LABEL_81;
        case -15461:
          int32x2_t result = StoreMTLRenderPipelineFunctionsDescriptorUsingEncode(*(void *)(result + 32), *(void **)(a3 + 16), (uint64_t)a4, &v49, a6);
          goto LABEL_158;
        case -15460:
        case -15440:
        case -15439:
        case -15438:
          int32x2_t result = StoreMTLVisibleFunctionTableDescriptorUsingEncode(*(void *)(result + 32), *(void *)(a3 + 16), (uint64_t)a4, &v49);
          goto LABEL_158;
        case -15435:
        case -15434:
        case -15425:
        case -15421:
        case -15420:
        case -15419:
          int32x2_t result = StoreMTLStitchedLibraryDescriptorUsingEncode(*(void *)(result + 32), *(uint64_t **)(a3 + 16), (uint64_t)a4, &v49, a6);
          goto LABEL_158;
        case -15430:
        case -15428:
          goto LABEL_215;
        case -15429:
        case -15427:
          goto LABEL_126;
        case -15426:
          int32x2_t result = StoreMTLStitchedLibraryDescriptorUsingEncode(*(void *)(result + 32), *(uint64_t **)(a3 + 8), (uint64_t)a4, &v49, a6);
          goto LABEL_238;
        default:
          switch(a2)
          {
            case -15411:
              int32x2_t result = StoreMTLRasterizationRateMapDescriptorUsingEncode(*(void *)(result + 32), *(const char ***)(a3 + 8), (uint64_t)a4, &v49);
              goto LABEL_238;
            case -15410:
            case -15409:
            case -15408:
            case -15407:
            case -15402:
            case -15401:
            case -15400:
            case -15397:
            case -15396:
            case -15394:
            case -15393:
            case -15392:
            case -15391:
            case -15390:
            case -15387:
            case -15386:
              return result;
            case -15406:
            case -15405:
            case -15404:
            case -15403:
              int32x2_t result = StoreMTLMeshRenderPipelineDescriptorUsingEncode(*(void *)(result + 32), *(void *)(a3 + 16), (uint64_t)a4, &v49, a6);
              goto LABEL_158;
            case -15399:
            case -15389:
              goto LABEL_215;
            case -15398:
            case -15388:
              goto LABEL_155;
            case -15395:
            case -15385:
              goto LABEL_126;
            default:
              if (a2 != -15497) {
                return result;
              }
              *(void *)(a3 + 8) = UnwrapMTLArray_(*(void *)(result + 32), *(unint64_t **)(a3 + 8), (uint64_t)a4, &v49, a6);
              uint64_t v31 = *(void *)(a3 + 16);
              uint64_t v32 = v49;
              uint64_t v33 = -v49;
              if (v31)
              {
                uint64_t v34 = (uint64_t)&v10[-v49];
                v49 -= 65;
                SavePointer(v11, (uint64_t *)(v31 + 16), (const void *)*(unsigned int *)(v31 + 12), v34);
                uint64_t v33 = 65 - v32;
              }
              else
              {
                uint64_t v34 = 0;
              }
              *(void *)(a3 + 16) = v34;
              uint64_t v20 = *(unint64_t **)(a3 + 24);
              uint64_t v22 = (uint64_t)&v10[v33];
              uint64_t v21 = v11;
              break;
          }
          goto LABEL_268;
      }
      return result;
    }
    if (a2 <= -15532)
    {
      if (a2 <= -15551)
      {
        if (a2 == -15552)
        {
          int32x2_t result = StoreMTLAccelerationStructureDescriptorUsingEncode(*(void *)(result + 32), *(unsigned __int8 **)(a3 + 8), (uint64_t)a4, &v49, a6);
          goto LABEL_238;
        }
      }
      else if (a2 != -15550)
      {
        if (a2 != -15541)
        {
          if (a2 != -15540) {
            return result;
          }
LABEL_81:
          int32x2_t result = StoreMTLIntersectionFunctionTableDescriptorUsingEncode(*(void *)(result + 32), *(void *)(a3 + 16), (uint64_t)a4, &v49);
          goto LABEL_158;
        }
        goto LABEL_93;
      }
      int32x2_t result = StoreMTLIntersectionFunctionDescriptorUsingEncode(*(void *)(result + 32), *(void *)(a3 + 16), (uint64_t)a4, &v49);
      goto LABEL_158;
    }
    if (a2 > -15510)
    {
      switch(a2)
      {
        case -15509:
          int32x2_t result = StoreMTLBufferDescriptorUsingEncode(*(void *)(result + 32), *(void *)(a3 + 16), (uint64_t)a4, &v49);
          break;
        case -15499:
          goto LABEL_155;
        case -15498:
          *(void *)(a3 + 8) = UnwrapMTLArray_(*(void *)(result + 32), *(unint64_t **)(a3 + 8), (uint64_t)a4, &v49, a6);
          uint64_t v13 = *(void *)(a3 + 16);
          uint64_t v15 = (uint64_t)&v10[-v49];
          uint64_t v14 = v11;
LABEL_92:
          int32x2_t result = StoreMTLComputePipelineDescriptorUsingEncode(v14, v13, v15, &v49, a6);
          break;
        default:
          return result;
      }
LABEL_158:
      *(void *)(a3 + 16) = result;
      return result;
    }
    if (a2 != -15531)
    {
      if (a2 != -15524 && a2 != -15522) {
        return result;
      }
LABEL_93:
      int32x2_t result = UnwrapMTLArray_(*(void *)(result + 32), *(unint64_t **)(a3 + 16), (uint64_t)a4, &v49, a6);
      goto LABEL_158;
    }
LABEL_102:
    int32x2_t result = (uint64_t)SaveFileWithURL(*(void *)(result + 32), *(char **)(a3 + 16), a4, &v49, 1);
    goto LABEL_158;
  }
  if (a2 > -7164)
  {
    if (a2 > -6144)
    {
      switch(a2)
      {
        case -6143:
        case -6131:
        case -6111:
          *(void *)(a3 + 16) = StoreMPSPluginCNNConvolutionDescriptorUsingEncode(*(void *)(result + 32), *(void *)(a3 + 16), (uint64_t)a4, &v49);
          int32x2_t result = StoreMPSPluginCNNConvolutionDataUsingEncode(v11, *(unsigned int **)(a3 + 24), (uint64_t)&v10[-v49], &v49);
          goto LABEL_278;
        case -6142:
          *(void *)(a3 + 56) = StoreMPSSourceTextureInfoUsingEncode(*(void *)(result + 32), *(void **)(a3 + 56), (uint64_t)a4, &v49);
          int32x2_t result = StoreMPSDestinationTextureInfoUsingEncode(v11, *(void **)(a3 + 80), (uint64_t)&v10[-v49], &v49);
          *(void *)(a3 + 80) = result;
          return result;
        case -6135:
        case -6126:
        case -6121:
          *(void *)(a3 + 48) = StoreMPSSourceTextureInfoUsingEncode(*(void *)(result + 32), *(void **)(a3 + 48), (uint64_t)a4, &v49);
          int32x2_t result = StoreMPSDestinationTextureInfoUsingEncode(v11, *(void **)(a3 + 64), (uint64_t)&v10[-v49], &v49);
          *(void *)(a3 + 64) = result;
          return result;
        case -6129:
          goto LABEL_73;
        case -6127:
        case -6120:
          int32x2_t result = StoreMPSPluginCNNConvolutionDataUsingEncode(*(void *)(result + 32), *(unsigned int **)(a3 + 8), (uint64_t)a4, &v49);
          goto LABEL_238;
        case -6125:
          *(void *)(a3 + 56) = StoreMPSSourceTextureInfoUsingEncode(*(void *)(result + 32), *(void **)(a3 + 56), (uint64_t)a4, &v49);
          *(void *)(a3 + 72) = StoreMPSSourceTextureInfoUsingEncode(v11, *(void **)(a3 + 72), (uint64_t)&v10[-v49], &v49);
          goto LABEL_203;
        case -6118:
          *(void *)(a3 + 64) = StoreMPSSourceTextureInfoUsingEncode(*(void *)(result + 32), *(void **)(a3 + 64), (uint64_t)a4, &v49);
          *(void *)(a3 + 88) = StoreMPSSourceTextureInfoUsingEncode(v11, *(void **)(a3 + 88), (uint64_t)&v10[-v49], &v49);
          int32x2_t result = StoreMPSDestinationTextureInfoUsingEncode(v11, *(void **)(a3 + 112), (uint64_t)&v10[-v49], &v49);
          *(void *)(a3 + 112) = result;
          return result;
        case -6117:
          *(void *)(a3 + 56) = StoreMPSSourceTextureInfoUsingEncode(*(void *)(result + 32), *(void **)(a3 + 56), (uint64_t)a4, &v49);
          int32x2_t result = StoreMPSDestinationTextureInfoUsingEncode(v11, *(void **)(a3 + 72), (uint64_t)&v10[-v49], &v49);
          *(void *)(a3 + 72) = result;
          return result;
        case -6115:
          *(void *)(a3 + 64) = StoreMPSSourceTextureInfoUsingEncode(*(void *)(result + 32), *(void **)(a3 + 64), (uint64_t)a4, &v49);
LABEL_203:
          int32x2_t result = StoreMPSDestinationTextureInfoUsingEncode(v11, *(void **)(a3 + 88), (uint64_t)&v10[-v49], &v49);
          goto LABEL_206;
        case -6114:
          *(void *)(a3 + 64) = StoreMPSSourceTextureInfoUsingEncode(*(void *)(result + 32), *(void **)(a3 + 64), (uint64_t)a4, &v49);
          int32x2_t result = StoreMPSSourceTextureInfoUsingEncode(v11, *(void **)(a3 + 88), (uint64_t)&v10[-v49], &v49);
          goto LABEL_206;
        case -6102:
        case -6100:
        case -6099:
        case -6098:
          *(void *)(a3 + 56) = StoreMPSNDArrayStructureUsingEncode(*(void *)(result + 32), *(void *)(a3 + 56), (uint64_t)a4, &v49);
          *(void *)(a3 + 72) = StoreMPSNDArrayStructureUsingEncode(v11, *(void *)(a3 + 72), (uint64_t)&v10[-v49], &v49);
          *(void *)(a3 + 88) = StoreMPSNDArrayStructureUsingEncode(v11, *(void *)(a3 + 88), (uint64_t)&v10[-v49], &v49);
          int32x2_t result = StoreMPSNDArrayStructureUsingEncode(v11, *(void *)(a3 + 104), (uint64_t)&v10[-v49], &v49);
          *(void *)(a3 + 104) = result;
          return result;
        case -6097:
          *(void *)(a3 + 56) = StoreMPSNDArrayStructureUsingEncode(*(void *)(result + 32), *(void *)(a3 + 56), (uint64_t)a4, &v49);
          *(void *)(a3 + 72) = StoreMPSNDArrayStructureUsingEncode(v11, *(void *)(a3 + 72), (uint64_t)&v10[-v49], &v49);
          int32x2_t result = StoreMPSNDArrayStructureUsingEncode(v11, *(void *)(a3 + 88), (uint64_t)&v10[-v49], &v49);
LABEL_206:
          *(void *)(a3 + 88) = result;
          break;
        case -6096:
        case -6095:
          int32x2_t result = StoreMPSPluginNDArrayConvolutionDescriptorUsingEncode(*(void *)(result + 32), *(unsigned __int8 **)(a3 + 16), (uint64_t)a4, &v49);
          goto LABEL_158;
        default:
          return result;
      }
      return result;
    }
    if (a2 == -7163)
    {
      int32x2_t result = StoreMTLDeviceDescriptorUsingEncode(*(void *)(result + 32), *(void *)(a3 + 16), (uint64_t)a4, &v49);
      goto LABEL_158;
    }
    if (a2 == -7153) {
      goto LABEL_155;
    }
    if (a2 != -6654) {
      return result;
    }
    int32x2_t result = StoreMTLDeviceDescriptorUsingEncode(*(void *)(result + 32), *(void *)(a3 + 24), (uint64_t)a4, &v49);
LABEL_278:
    *(void *)(a3 + 24) = result;
    return result;
  }
  if (a2 <= -15261)
  {
    if (a2 <= -15297)
    {
      switch(a2)
      {
        case -15366:
        case -15356:
        case -15355:
          goto LABEL_157;
        case -15364:
          int32x2_t result = StoreMTLAccelerationStructurePassDescriptorUsingEncode(*(void *)(result + 32), *(void *)(a3 + 16), (uint64_t)a4, &v49, a6);
          goto LABEL_158;
        case -15363:
          *(void *)(a3 + 24) = UnwrapMTLArray_(*(void *)(result + 32), *(unint64_t **)(a3 + 24), (uint64_t)a4, &v49, a6);
          uint64_t v35 = *(unsigned __int8 **)(a3 + 32);
          uint64_t v36 = (uint64_t)&v10[-v49];
          uint64_t v37 = v11;
          goto LABEL_233;
        case -15362:
          int32x2_t result = StoreMTLAccelerationStructureDescriptorUsingEncode(*(void *)(result + 32), *(unsigned __int8 **)(a3 + 24), (uint64_t)a4, &v49, a6);
          goto LABEL_278;
        case -15358:
          int32x2_t result = StoreMTLAccelerationStructureAllocationDescriptorUsingEncode(*(void *)(result + 32), *(void *)(a3 + 24), (uint64_t)a4, &v49);
          goto LABEL_278;
        case -15350:
          int32x2_t result = StoreMTLIOCommandQueueDescriptorUsingEncode(*(void *)(result + 32), *(unsigned int **)(a3 + 16), (uint64_t)a4, &v49);
          goto LABEL_158;
        case -15348:
          goto LABEL_215;
        default:
          return result;
      }
      return result;
    }
    if (a2 <= -15282)
    {
      if (a2 != -15296)
      {
        if (a2 != -15294)
        {
          if (a2 != -15282) {
            return result;
          }
          goto LABEL_126;
        }
        goto LABEL_155;
      }
LABEL_215:
      uint64_t v39 = *(void *)(a3 + 16);
      if (!v39)
      {
LABEL_274:
        uint64_t v8 = 0;
        goto LABEL_275;
      }
LABEL_216:
      int32x2_t result = SavePointer(v11, (uint64_t *)(v39 + 16), (const void *)*(unsigned int *)(v39 + 12), v8);
LABEL_275:
      *(void *)(a3 + 16) = v8;
      return result;
    }
    if (a2 != -15281)
    {
      if (a2 == -15273)
      {
LABEL_126:
        uint64_t v19 = *(void *)(a3 + 16);
        if (v19)
        {
          uint64_t v7 = a5 - 65;
          int32x2_t result = SavePointer(*(void *)(result + 32), (uint64_t *)(v19 + 16), (const void *)*(unsigned int *)(v19 + 12), (uint64_t)a4);
        }
        else
        {
          uint64_t v8 = 0;
        }
        *(void *)(a3 + 16) = v8;
        goto LABEL_136;
      }
      int v17 = -15272;
      goto LABEL_154;
    }
LABEL_155:
    uint64_t v26 = *(void *)(a3 + 8);
    if (v26) {
      int32x2_t result = SavePointer(*(void *)(result + 32), (uint64_t *)(v26 + 16), (const void *)*(unsigned int *)(v26 + 12), (uint64_t)a4);
    }
    else {
      uint64_t v8 = 0;
    }
    *(void *)(a3 + 8) = v8;
    return result;
  }
  if (a2 <= -10230)
  {
    if (a2 <= -12273)
    {
      if (a2 == -15260 || a2 == -15259) {
        goto LABEL_215;
      }
      if (a2 != -15245) {
        return result;
      }
      int32x2_t result = StoreMTLResidencySetDescriptorUsingEncode(*(void *)(result + 32), *(void *)(a3 + 16), (uint64_t)a4, &v49);
      goto LABEL_158;
    }
    if (a2 <= -10240)
    {
      if (a2 != -12272)
      {
        if (a2 != -10240) {
          return result;
        }
        goto LABEL_215;
      }
      int v38 = *(_DWORD *)(a3 + 8);
      if (v38 == 116) {
        goto LABEL_215;
      }
      if (v38 != 111) {
        return result;
      }
      int32x2_t result = StoreMTLFunctionConstantValuesUsingEncode(*(void *)(result + 32), *(uint64_t **)(a3 + 16), (uint64_t)a4, &v49);
      goto LABEL_158;
    }
    if (a2 == -10239)
    {
      int32x2_t result = StoreMTLDeviceDescriptorUsingEncode(*(void *)(result + 32), *(void *)(a3 + 8), (uint64_t)a4, &v49);
    }
    else
    {
      if (a2 != -10231) {
        return result;
      }
      int32x2_t result = StoreMTLTextureMipmapInfo2UsingEncode(*(void *)(result + 32), *(uint64_t **)(a3 + 8), (uint64_t)a4, &v49);
    }
LABEL_238:
    *(void *)(a3 + 8) = result;
    return result;
  }
  if (a2 <= -10158)
  {
    if (a2 != -10229)
    {
      if (a2 != -10194)
      {
        if (a2 != -10190) {
          return result;
        }
        uint64_t v18 = *(void *)(a3 + 8);
        if (v18)
        {
          uint64_t v7 = a5 - 65;
          int32x2_t result = SavePointer(*(void *)(result + 32), (uint64_t *)(v18 + 16), (const void *)*(unsigned int *)(v18 + 12), (uint64_t)a4);
        }
        else
        {
          uint64_t v8 = 0;
        }
        *(void *)(a3 + 8) = v8;
LABEL_136:
        uint64_t v16 = *(void *)(a3 + 24);
        if (v16)
        {
          uint64_t v8 = (uint64_t)&v10[-v7];
LABEL_138:
          int32x2_t result = SavePointer(v11, (uint64_t *)(v16 + 16), (const void *)*(unsigned int *)(v16 + 12), v8);
LABEL_220:
          *(void *)(a3 + 24) = v8;
          return result;
        }
LABEL_219:
        uint64_t v8 = 0;
        goto LABEL_220;
      }
      goto LABEL_155;
    }
    uint64_t v40 = *(void *)(a3 + 8);
    if (v40)
    {
      uint64_t v7 = a5 - 65;
      int32x2_t result = SavePointer(*(void *)(result + 32), (uint64_t *)(v40 + 16), (const void *)*(unsigned int *)(v40 + 12), (uint64_t)a4);
    }
    else
    {
      uint64_t v8 = 0;
    }
    *(void *)(a3 + 8) = v8;
    uint64_t v42 = *(void *)(a3 + 16);
    uint64_t v43 = -v7;
    if (v42)
    {
      uint64_t v44 = &v10[-v7];
      int32x2_t result = SavePointer(v11, (uint64_t *)(v42 + 16), (const void *)*(unsigned int *)(v42 + 12), (uint64_t)&v10[-v7]);
      uint64_t v43 = 65 - v7;
      v7 -= 65;
    }
    else
    {
      uint64_t v44 = 0;
    }
    *(void *)(a3 + 16) = v44;
    uint64_t v45 = *(void *)(a3 + 24);
    if (v45)
    {
      uint64_t v46 = &v10[v43];
      int32x2_t result = SavePointer(v11, (uint64_t *)(v45 + 16), (const void *)*(unsigned int *)(v45 + 12), (uint64_t)&v10[v43]);
      uint64_t v43 = 65 - v7;
    }
    else
    {
      uint64_t v46 = 0;
    }
    *(void *)(a3 + 24) = v46;
    uint64_t v47 = *(void *)(a3 + 32);
    if (v47)
    {
      uint64_t v48 = &v10[v43];
      int32x2_t result = SavePointer(v11, (uint64_t *)(v47 + 16), (const void *)*(unsigned int *)(v47 + 12), (uint64_t)&v10[v43]);
    }
    else
    {
      uint64_t v48 = 0;
    }
    *(void *)(a3 + 32) = v48;
  }
  else
  {
    switch(a2)
    {
      case -10157:
        int32x2_t result = StoreMTLFunctionDescriptorUsingEncode(*(void *)(result + 32), *(void *)(a3 + 8), (uint64_t)a4, &v49, a6);
        goto LABEL_238;
      case -10156:
        int32x2_t result = UnwrapMTLArray_(*(void *)(result + 32), *(unint64_t **)(a3 + 8), (uint64_t)a4, &v49, a6);
        goto LABEL_238;
      case -10154:
        goto LABEL_157;
      case -10152:
        goto LABEL_155;
      default:
        return result;
    }
  }
  return result;
}

uint64_t StoreMTLImageFilterFunctionInfoSPIUsingEncode(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!a2) {
    return 0;
  }
  int v10 = (const void *)EncodeDYMTLImageFilterFunctionInfoSPI(a2, a5, 0, 0);
  uint64_t v11 = (uint64_t *)GTCoreAlloc((uint64_t)v10, (memory_object_size_t)v10);
  EncodeDYMTLImageFilterFunctionInfoSPI(a2, a5, v11, (unint64_t)v10);
  *a4 -= 65;
  SavePointer(a1, v11, v10, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v11, (vm_size_t)v10);
  return a3;
}

uint64_t StoreMTLFunctionConstantValuesUsingEncode(uint64_t a1, uint64_t *a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0;
  }
  uint64_t v8 = (const void *)EncodeDYMTLFunctionConstantValues(a2, 0, 0);
  int v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMTLFunctionConstantValues(a2, v9, (unint64_t)v8);
  *a4 -= 65;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t UnwrapMTLArray_(uint64_t a1, unint64_t *a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!a2) {
    return 0;
  }
  unint64_t v10 = *a2;
  uint64_t v11 = (const void *)(8 * *a2 + 16);
  __chkstk_darwin();
  uint64_t v13 = (unint64_t *)((char *)&v16 - ((v12 + 31) & 0xFFFFFFFFFFFFFFF0));
  bzero(v13, (size_t)v11);
  *uint64_t v13 = 81;
  v13[1] = v10;
  if (v10)
  {
    unint64_t v14 = 0;
    do
    {
      unint64_t v16 = a2[v14 + 1];
      v13[v14++ + 2] = *(void *)(*(void *)(*find_entry(a5, &v16, 8uLL, 0) + 32) + 8);
    }
    while (*a2 > v14);
  }
  *a4 -= 65;
  SavePointer(a1, v13, v11, a3);
  return a3;
}

uint64_t UnwrapArray_(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, unint64_t a5, uint64_t a6)
{
  if (!a2) {
    return 0;
  }
  uint64_t v12 = (const void *)(8 * a5);
  __chkstk_darwin();
  bzero((char *)&v16 - (((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFFFF0), (size_t)v12);
  if (a5)
  {
    unint64_t v13 = 0;
    unsigned int v14 = 1;
    do
    {
      uint64_t v16 = *(void *)(a2 + 8 * v13);
      *(uint64_t *)((char *)&v16 + 8 * v13 - (((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFFFF0)) = *(void *)(*(void *)(*find_entry(a6, &v16, 8uLL, 0) + 32) + 8);
      unint64_t v13 = v14++;
    }
    while (v13 < a5);
  }
  *a4 -= 65;
  SavePointer(a1, (uint64_t *)((char *)&v16 - (((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFFFF0)), v12, a3);
  return a3;
}

uint64_t StoreMTLTextureMipmapInfo2UsingEncode(uint64_t a1, uint64_t *a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0;
  }
  uint64_t v8 = (const void *)EncodeDYMTLTextureMipmapInfo2(a2, 0, 0);
  int v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMTLTextureMipmapInfo2(a2, v9, (unint64_t)v8);
  *a4 -= 65;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreMTLDeviceDescriptorUsingEncode(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0;
  }
  uint64_t v8 = (const void *)EncodeDYMTLDeviceDescriptor(a2, 0, 0);
  int v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMTLDeviceDescriptor(a2, v9, (unint64_t)v8);
  *a4 -= 65;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreMTLAccelerationStructureDescriptorUsingEncode(uint64_t a1, unsigned __int8 *a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!a2) {
    return 0;
  }
  unint64_t v10 = (const void *)EncodeDYMTLAccelerationStructureDescriptor(a2, 0, 0, a5);
  uint64_t v11 = (uint64_t *)GTCoreAlloc((uint64_t)v10, (memory_object_size_t)v10);
  EncodeDYMTLAccelerationStructureDescriptor(a2, v11, (unint64_t)v10, a5);
  *a4 -= 65;
  SavePointer(a1, v11, v10, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v11, (vm_size_t)v10);
  return a3;
}

uint64_t StoreMTLComputePipelineDescriptorUsingEncode(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!a2) {
    return 0;
  }
  unint64_t v10 = (const void *)EncodeDYMTLComputePipelineDescriptor(a2, 0, 0, a5);
  uint64_t v11 = (uint64_t *)GTCoreAlloc((uint64_t)v10, (memory_object_size_t)v10);
  EncodeDYMTLComputePipelineDescriptor(a2, v11, (unint64_t)v10, a5);
  *a4 -= 65;
  SavePointer(a1, v11, v10, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v11, (vm_size_t)v10);
  return a3;
}

uint64_t StoreMTLStitchedLibraryDescriptorUsingEncode(uint64_t a1, uint64_t *a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!a2) {
    return 0;
  }
  unint64_t v10 = (const void *)EncodeDYMTLStitchedLibraryDescriptor(a2, 0, 0, a5);
  uint64_t v11 = (uint64_t *)GTCoreAlloc((uint64_t)v10, (memory_object_size_t)v10);
  EncodeDYMTLStitchedLibraryDescriptor(a2, v11, (unint64_t)v10, a5);
  *a4 -= 65;
  SavePointer(a1, v11, v10, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v11, (vm_size_t)v10);
  return a3;
}

uint64_t StoreMTLRenderPipelineDescriptorUsingEncode(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!a2) {
    return 0;
  }
  unint64_t v10 = (const void *)EncodeDYMTLRenderPipelineDescriptor(a2, 0, 0, a5);
  uint64_t v11 = (uint64_t *)GTCoreAlloc((uint64_t)v10, (memory_object_size_t)v10);
  EncodeDYMTLRenderPipelineDescriptor(a2, v11, (unint64_t)v10, a5);
  *a4 -= 65;
  SavePointer(a1, v11, v10, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v11, (vm_size_t)v10);
  return a3;
}

uint64_t StoreMTLTileRenderPipelineDescriptorUsingEncode(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!a2) {
    return 0;
  }
  unint64_t v10 = (const void *)EncodeDYMTLTileRenderPipelineDescriptor(a2, 0, 0, a5);
  uint64_t v11 = (uint64_t *)GTCoreAlloc((uint64_t)v10, (memory_object_size_t)v10);
  EncodeDYMTLTileRenderPipelineDescriptor(a2, v11, (unint64_t)v10, a5);
  *a4 -= 65;
  SavePointer(a1, v11, v10, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v11, (vm_size_t)v10);
  return a3;
}

uint64_t StoreMTLTextureDescriptorUsingEncode(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0;
  }
  uint64_t v8 = (const void *)EncodeDYMTLTextureDescriptor(a2, 0, 0);
  int v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMTLTextureDescriptor(a2, v9, (unint64_t)v8);
  *a4 -= 65;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreMTLCaptureDescriptorUsingEncode(uint64_t a1, uint64_t *a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!a2) {
    return 0;
  }
  unint64_t v10 = (const void *)EncodeDYMTLCaptureDescriptor(a2, 0, 0, a5);
  uint64_t v11 = (uint64_t *)GTCoreAlloc((uint64_t)v10, (memory_object_size_t)v10);
  EncodeDYMTLCaptureDescriptor(a2, v11, (unint64_t)v10, a5);
  *a4 -= 65;
  SavePointer(a1, v11, v10, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v11, (vm_size_t)v10);
  return a3;
}

uint64_t StoreMTLAccelerationStructurePassDescriptorUsingEncode(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!a2) {
    return 0;
  }
  unint64_t v10 = (const void *)EncodeDYMTLAccelerationStructurePassDescriptor(a2, 0, 0, a5);
  uint64_t v11 = (uint64_t *)GTCoreAlloc((uint64_t)v10, (memory_object_size_t)v10);
  EncodeDYMTLAccelerationStructurePassDescriptor(a2, v11, (unint64_t)v10, a5);
  *a4 -= 65;
  SavePointer(a1, v11, v10, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v11, (vm_size_t)v10);
  return a3;
}

uint64_t StoreMTLBlitPassDescriptorUsingEncode(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!a2) {
    return 0;
  }
  unint64_t v10 = (const void *)EncodeDYMTLBlitPassDescriptor(a2, 0, 0, a5);
  uint64_t v11 = (uint64_t *)GTCoreAlloc((uint64_t)v10, (memory_object_size_t)v10);
  EncodeDYMTLBlitPassDescriptor(a2, v11, (unint64_t)v10, a5);
  *a4 -= 65;
  SavePointer(a1, v11, v10, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v11, (vm_size_t)v10);
  return a3;
}

uint64_t StoreMTLComputePassDescriptorUsingEncode(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!a2) {
    return 0;
  }
  unint64_t v10 = (const void *)EncodeDYMTLComputePassDescriptor(a2, 0, 0, a5);
  uint64_t v11 = (uint64_t *)GTCoreAlloc((uint64_t)v10, (memory_object_size_t)v10);
  EncodeDYMTLComputePassDescriptor(a2, v11, (unint64_t)v10, a5);
  *a4 -= 65;
  SavePointer(a1, v11, v10, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v11, (vm_size_t)v10);
  return a3;
}

uint64_t StoreMTLRenderPassDescriptorUsingEncode(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!a2) {
    return 0;
  }
  unint64_t v10 = (const void *)EncodeDYMTLRenderPassDescriptor(a2, 0, 0, a5);
  uint64_t v11 = (uint64_t *)GTCoreAlloc((uint64_t)v10, (memory_object_size_t)v10);
  EncodeDYMTLRenderPassDescriptor(a2, v11, (unint64_t)v10, a5);
  *a4 -= 65;
  SavePointer(a1, v11, v10, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v11, (vm_size_t)v10);
  return a3;
}

uint64_t StoreMTLResourceStatePassDescriptorUsingEncode(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!a2) {
    return 0;
  }
  unint64_t v10 = (const void *)EncodeDYMTLResourceStatePassDescriptor(a2, 0, 0, a5);
  uint64_t v11 = (uint64_t *)GTCoreAlloc((uint64_t)v10, (memory_object_size_t)v10);
  EncodeDYMTLResourceStatePassDescriptor(a2, v11, (unint64_t)v10, a5);
  *a4 -= 65;
  SavePointer(a1, v11, v10, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v11, (vm_size_t)v10);
  return a3;
}

uint64_t StoreMTLCommandBufferDescriptorUsingEncode(uint64_t a1, uint64_t *a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!a2) {
    return 0;
  }
  unint64_t v10 = (const void *)EncodeDYMTLCommandBufferDescriptor(a2, 0, 0, a5);
  uint64_t v11 = (uint64_t *)GTCoreAlloc((uint64_t)v10, (memory_object_size_t)v10);
  EncodeDYMTLCommandBufferDescriptor(a2, v11, (unint64_t)v10, a5);
  *a4 -= 65;
  SavePointer(a1, v11, v10, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v11, (vm_size_t)v10);
  return a3;
}

uint64_t StoreMTLIntersectionFunctionTableDescriptorUsingEncode(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0;
  }
  uint64_t v8 = (const void *)EncodeDYMTLIntersectionFunctionTableDescriptor(a2, 0, 0);
  int v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMTLIntersectionFunctionTableDescriptor(a2, v9, (unint64_t)v8);
  *a4 -= 65;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreMTLVisibleFunctionTableDescriptorUsingEncode(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0;
  }
  uint64_t v8 = (const void *)EncodeDYMTLVisibleFunctionTableDescriptor(a2, 0, 0);
  int v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMTLVisibleFunctionTableDescriptor(a2, v9, (unint64_t)v8);
  *a4 -= 65;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreMTLFunctionDescriptorUsingEncode(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!a2) {
    return 0;
  }
  unint64_t v10 = (const void *)EncodeDYMTLFunctionDescriptor(a2, 0, 0, a5);
  uint64_t v11 = (uint64_t *)GTCoreAlloc((uint64_t)v10, (memory_object_size_t)v10);
  EncodeDYMTLFunctionDescriptor(a2, v11, (unint64_t)v10, a5);
  *a4 -= 65;
  SavePointer(a1, v11, v10, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v11, (vm_size_t)v10);
  return a3;
}

uint64_t StoreMTLAccelerationStructureAllocationDescriptorUsingEncode(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0;
  }
  uint64_t v8 = (const void *)EncodeDYMTLAccelerationStructureAllocationDescriptor(a2, 0, 0);
  int v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMTLAccelerationStructureAllocationDescriptor(a2, v9, (unint64_t)v8);
  *a4 -= 65;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreMTLBufferDescriptorUsingEncode(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0;
  }
  uint64_t v8 = (const void *)EncodeDYMTLBufferDescriptor(a2, 0, 0);
  int v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMTLBufferDescriptor(a2, v9, (unint64_t)v8);
  *a4 -= 65;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreIOSurfaceUsingEncode(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0;
  }
  uint64_t v8 = (const void *)EncodeDYIOSurface(a2, 0, 0);
  int v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYIOSurface(a2, v9, (unint64_t)v8);
  *a4 -= 65;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreMTLCommandQueueDescriptorUsingEncode(uint64_t a1, unsigned __int8 *a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0;
  }
  uint64_t v8 = (const void *)EncodeDYMTLCommandQueueDescriptor(a2, 0, 0);
  int v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMTLCommandQueueDescriptor(a2, v9, (unint64_t)v8);
  *a4 -= 65;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreMTLCounterSampleBufferDescriptorUsingEncode(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0;
  }
  uint64_t v8 = (const void *)EncodeDYMTLCounterSampleBufferDescriptor(a2, 0, 0);
  int v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMTLCounterSampleBufferDescriptor(a2, v9, (unint64_t)v8);
  *a4 -= 65;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreMTLDepthStencilDescriptorUsingEncode(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0;
  }
  uint64_t v8 = (const void *)EncodeDYMTLDepthStencilDescriptor(a2, 0, 0);
  int v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMTLDepthStencilDescriptor(a2, v9, (unint64_t)v8);
  *a4 -= 65;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreMTLHeapDescriptorUsingEncode(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0;
  }
  uint64_t v8 = (const void *)EncodeDYMTLHeapDescriptor(a2, 0, 0);
  int v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMTLHeapDescriptor(a2, v9, (unint64_t)v8);
  *a4 -= 65;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreMTLIOCommandQueueDescriptorUsingEncode(uint64_t a1, unsigned int *a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0;
  }
  uint64_t v8 = (const void *)EncodeDYMTLIOCommandQueueDescriptor(a2, 0, 0);
  int v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMTLIOCommandQueueDescriptor(a2, v9, (unint64_t)v8);
  *a4 -= 65;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreMTLIndirectCommandBufferDescriptorUsingEncode(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0;
  }
  uint64_t v8 = (const void *)EncodeDYMTLIndirectCommandBufferDescriptor(a2, 0, 0);
  int v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMTLIndirectCommandBufferDescriptor(a2, v9, (unint64_t)v8);
  *a4 -= 65;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreMTLCompileOptionsUsingEncode_14091(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!a2) {
    return 0;
  }
  unint64_t v10 = (const void *)EncodeDYMTLCompileOptions(a2, 0, 0, a5);
  uint64_t v11 = (uint64_t *)GTCoreAlloc((uint64_t)v10, (memory_object_size_t)v10);
  EncodeDYMTLCompileOptions(a2, v11, (unint64_t)v10, a5);
  *a4 -= 65;
  SavePointer(a1, v11, v10, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v11, (vm_size_t)v10);
  return a3;
}

uint64_t StoreMTLMotionEstimationPipelineDescriptorUsingEncode(uint64_t a1, unsigned __int16 *a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0;
  }
  uint64_t v8 = (const void *)EncodeDYMTLMotionEstimationPipelineDescriptor(a2, 0, 0);
  int v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMTLMotionEstimationPipelineDescriptor(a2, v9, (unint64_t)v8);
  *a4 -= 65;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreMTLRasterizationRateMapDescriptorUsingEncode(uint64_t a1, const char **a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0;
  }
  uint64_t v8 = (const void *)EncodeDYMTLRasterizationRateMapDescriptor(a2, 0, 0);
  int v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMTLRasterizationRateMapDescriptor(a2, v9, (unint64_t)v8);
  *a4 -= 65;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreMTLMeshRenderPipelineDescriptorUsingEncode(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!a2) {
    return 0;
  }
  unint64_t v10 = (const void *)EncodeDYMTLMeshRenderPipelineDescriptor(a2, 0, 0, a5);
  uint64_t v11 = (uint64_t *)GTCoreAlloc((uint64_t)v10, (memory_object_size_t)v10);
  EncodeDYMTLMeshRenderPipelineDescriptor(a2, v11, (unint64_t)v10, a5);
  *a4 -= 65;
  SavePointer(a1, v11, v10, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v11, (vm_size_t)v10);
  return a3;
}

uint64_t StoreMTLResidencySetDescriptorUsingEncode(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0;
  }
  uint64_t v8 = (const void *)EncodeDYMTLResidencySetDescriptor(a2, 0, 0);
  int v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMTLResidencySetDescriptor(a2, v9, (unint64_t)v8);
  *a4 -= 65;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreMTLSamplerDescriptorUsingEncode(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0;
  }
  uint64_t v8 = (const void *)EncodeDYMTLSamplerDescriptor(a2, 0, 0);
  int v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMTLSamplerDescriptor(a2, (uint64_t)v9, (unint64_t)v8);
  *a4 -= 65;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreMTLIntersectionFunctionDescriptorUsingEncode(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0;
  }
  uint64_t v8 = (const void *)EncodeDYMTLIntersectionFunctionDescriptor(a2, 0, 0);
  int v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMTLIntersectionFunctionDescriptor(a2, v9, (unint64_t)v8);
  *a4 -= 65;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreMTLScissorRectUsingEncode(uint64_t a1, const void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!a2) {
    return 0;
  }
  size_t v9 = 32 * a5;
  unint64_t v10 = (const void *)((32 * a5) | 8);
  uint64_t v11 = (uint64_t *)GTCoreAlloc(a1, (memory_object_size_t)v10);
  *uint64_t v11 = 81;
  memcpy(v11 + 1, a2, v9);
  *a4 -= 65;
  SavePointer(a1, v11, v10, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v11, (vm_size_t)v10);
  return a3;
}

uint64_t StoreMTLVertexAmplificationViewMappingUsingEncode(uint64_t a1, const void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!a2) {
    return 0;
  }
  size_t v9 = 8 * a5;
  unint64_t v10 = (const void *)(8 * a5 + 8);
  uint64_t v11 = (uint64_t *)GTCoreAlloc(a1, (memory_object_size_t)v10);
  *uint64_t v11 = 81;
  memcpy(v11 + 1, a2, v9);
  *a4 -= 65;
  SavePointer(a1, v11, v10, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v11, (vm_size_t)v10);
  return a3;
}

uint64_t StoreMTLViewportUsingEncode(uint64_t a1, const void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!a2) {
    return 0;
  }
  size_t v9 = 48 * a5;
  unint64_t v10 = (const void *)((48 * a5) | 8);
  uint64_t v11 = (uint64_t *)GTCoreAlloc(a1, (memory_object_size_t)v10);
  *uint64_t v11 = 81;
  memcpy(v11 + 1, a2, v9);
  *a4 -= 65;
  SavePointer(a1, v11, v10, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v11, (vm_size_t)v10);
  return a3;
}

uint64_t StoreMTLRenderPipelineFunctionsDescriptorUsingEncode(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!a2) {
    return 0;
  }
  unint64_t v10 = (const void *)EncodeDYMTLRenderPipelineFunctionsDescriptor(a2, 0, 0, a5);
  uint64_t v11 = (uint64_t *)GTCoreAlloc((uint64_t)v10, (memory_object_size_t)v10);
  EncodeDYMTLRenderPipelineFunctionsDescriptor(a2, v11, (unint64_t)v10, a5);
  *a4 -= 65;
  SavePointer(a1, v11, v10, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v11, (vm_size_t)v10);
  return a3;
}

uint64_t StoreMPSPluginCNNConvolutionDescriptorUsingEncode(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0;
  }
  uint64_t v8 = (const void *)EncodeDYMPSPluginCNNConvolutionDescriptor(a2, 0, 0);
  size_t v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMPSPluginCNNConvolutionDescriptor(a2, (uint64_t)v9, (unint64_t)v8);
  *a4 -= 65;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreMPSPluginCNNConvolutionDataUsingEncode(uint64_t a1, unsigned int *a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0;
  }
  uint64_t v8 = (const void *)EncodeDYMPSPluginCNNConvolutionData(a2, 0, 0);
  size_t v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMPSPluginCNNConvolutionData(a2, v9, (unint64_t)v8);
  *a4 -= 65;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreMPSPluginNDArrayConvolutionDescriptorUsingEncode(uint64_t a1, unsigned __int8 *a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0;
  }
  uint64_t v8 = (const void *)EncodeDYMPSPluginNDArrayConvolutionDescriptor(a2, 0, 0);
  size_t v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMPSPluginNDArrayConvolutionDescriptor(a2, v9, (unint64_t)v8);
  *a4 -= 65;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreMPSSourceTextureInfoUsingEncode(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0;
  }
  uint64_t v8 = (const void *)EncodeDYMPSSourceTextureInfo(a2, 0, 0);
  size_t v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMPSSourceTextureInfo(a2, v9, (unint64_t)v8);
  *a4 -= 65;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreMPSDestinationTextureInfoUsingEncode(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0;
  }
  uint64_t v8 = (const void *)EncodeDYMPSDestinationTextureInfo(a2, 0, 0);
  size_t v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMPSDestinationTextureInfo(a2, v9, (unint64_t)v8);
  *a4 -= 65;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreMPSNDArrayStructureUsingEncode(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0;
  }
  uint64_t v8 = (const void *)EncodeDYMPSNDArrayStructure(a2, 0, 0);
  size_t v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMPSNDArrayStructure(a2, v9, (unint64_t)v8);
  *a4 -= 65;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreMTLFXSpatialScalerDescriptorUsingEncode(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0;
  }
  uint64_t v8 = (const void *)EncodeDYMTLFXSpatialScalerDescriptor(a2, 0, 0);
  size_t v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMTLFXSpatialScalerDescriptor(a2, v9, (unint64_t)v8);
  *a4 -= 65;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

uint64_t StoreMTLFXTemporalScalerDescriptorUsingEncode(uint64_t a1, unsigned __int16 *a2, uint64_t a3, void *a4)
{
  if (!a2) {
    return 0;
  }
  uint64_t v8 = (const void *)EncodeDYMTLFXTemporalScalerDescriptor(a2, 0, 0);
  size_t v9 = (uint64_t *)GTCoreAlloc((uint64_t)v8, (memory_object_size_t)v8);
  EncodeDYMTLFXTemporalScalerDescriptor(a2, (uint64_t)v9, (unint64_t)v8);
  *a4 -= 65;
  SavePointer(a1, v9, v8, a3);
  vm_deallocate(mach_task_self_, (vm_address_t)v9, (vm_size_t)v8);
  return a3;
}

char *GTTraceMemPool_allocateBytes(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = (HIDWORD(a3) + 23) & 0x1FFFFFFF8;
  unsigned int add = atomic_fetch_add((atomic_uint *volatile)(a1 + 24), 1u);
  do
    unsigned int v8 = atomic_load((unsigned int *)(a1 + 28));
  while (v8 != add);
  size_t v9 = *(unsigned int **)(a1 + 8);
  if (!v9) {
    goto LABEL_12;
  }
  unsigned int v10 = atomic_load(v9 + 1);
  while (1)
  {
    uint64_t v11 = v10;
    unint64_t v12 = v6 + v10;
    unint64_t v13 = *v9;
    if (v12 > v13) {
      break;
    }
    unsigned int v10 = v11;
    atomic_compare_exchange_strong((atomic_uint *volatile)v9 + 1, &v10, v12);
    if (v10 == v11)
    {
      unint64_t v13 = *v9;
      break;
    }
  }
  unsigned int v14 = (char *)v9 + v11;
  int32x2_t result = v12 <= v13 ? v14 : 0;
  if (v12 > v13)
  {
LABEL_12:
    uint64_t v16 = (unsigned int *)GTTraceStoreAllocNode(*(int **)a1, (HIDWORD(a3) + 23) & 0x1FFFFFFF8, 2, *(void *)(a1 + 32));
    uint64_t v17 = *(void *)(a1 + 16);
    if (v17) {
      uint64_t v18 = (void *)(v17 + 40);
    }
    else {
      uint64_t v18 = (void *)(a1 + 8);
    }
    *uint64_t v18 = v16;
    *(void *)(a1 + 16) = v16;
    *((void *)v16 + 5) = 0;
    unsigned int v19 = atomic_load(v16 + 1);
    while (1)
    {
      uint64_t v20 = v19;
      unint64_t v21 = v6 + v19;
      unint64_t v22 = *v16;
      if (v21 > v22) {
        break;
      }
      unsigned int v19 = v20;
      atomic_compare_exchange_strong((atomic_uint *volatile)v16 + 1, &v19, v21);
      if (v19 == v20)
      {
        unint64_t v22 = *v16;
        break;
      }
    }
    char v23 = (char *)v16 + v20;
    if (v21 <= v22) {
      int32x2_t result = v23;
    }
    else {
      int32x2_t result = 0;
    }
  }
  atomic_store(add + 1, (unsigned int *)(a1 + 28));
  *(void *)int32x2_t result = a2;
  *((void *)result + 1) = a3;
  return result;
}

void *GTTraceMemPool_storeBytes(void *result, uint64_t a2, unint64_t a3, const void *a4)
{
  if (a4)
  {
    size_t v4 = HIDWORD(a3);
    if (HIDWORD(a3))
    {
      uint64_t v6 = GTTraceMemPool_allocateBytes((uint64_t)result, a2, a3) + 16;
      return memcpy(v6, a4, v4);
    }
  }
  return result;
}

uint64_t GTTraceMemPool_findHeader(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t v3 = *(void *)(a1 + 8);
  if (!v3) {
    return 0;
  }
  while (1)
  {
    unsigned int v4 = atomic_load((unsigned int *)(v3 + 4));
    int v5 = v4 - 64;
    if (v5 >= 1) {
      break;
    }
LABEL_8:
    uint64_t v3 = *(void *)(v3 + 40);
    if (!v3) {
      return 0;
    }
  }
  uint64_t result = v3 + 64;
  while (a2 != *(void *)result || *(unsigned __int8 *)(result + 8) != a3)
  {
    signed int v7 = (*(_DWORD *)(result + 12) + 23) & 0xFFFFFFF8;
    result += v7;
    BOOL v8 = __OFSUB__(v5, v7);
    v5 -= v7;
    if ((v5 < 0) ^ v8 | (v5 == 0)) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t GTTraceMemHeader_data(uint64_t result)
{
  if (result) {
    result += 16;
  }
  return result;
}

uint64_t GTTraceMemHeader_bytes(uint64_t a1)
{
  if (a1) {
    return a1 + 16;
  }
  else {
    return 0;
  }
}

void GTTraceMemPool_buildMemoryMap(uint64_t a1, apr_hash_t *ht)
{
  for (uint64_t i = *(void *)(a1 + 8); i; uint64_t i = *(void *)(i + 40))
  {
    unsigned int v4 = atomic_load((unsigned int *)(i + 4));
    int v5 = v4 - 64;
    if ((int)(v4 - 64) >= 1)
    {
      uint64_t v6 = (_DWORD *)(i + 64);
      do
      {
        apr_hash_set(ht, v6, 9, v6);
        signed int v7 = (v6[3] + 23) & 0xFFFFFFF8;
        uint64_t v6 = (_DWORD *)((char *)v6 + v7);
        BOOL v8 = __OFSUB__(v5, v7);
        v5 -= v7;
      }
      while (!((v5 < 0) ^ v8 | (v5 == 0)));
    }
  }
}

uint64_t GTTraceMemPool_headerFromMap(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5[0] = a2;
  v5[1] = a3;
  entry = find_entry(a1, v5, 9uLL, 0);
  if (*entry) {
    return *(void *)(*entry + 32);
  }
  else {
    return 0;
  }
}

unint64_t GetFreeIndex(unint64_t result)
{
  if (result < 0x101) {
    return 0;
  }
  unint64_t v1 = result;
  LODWORD(result) = 0;
  for (unint64_t i = 256; i < v1; i *= 2)
    uint64_t result = (result + 1);
  return result;
}

uint64_t GetFreeIndexCapacity(int a1)
{
  if (a1 < 1) {
    return 256;
  }
  int v1 = a1;
  uint64_t result = 256;
  do
  {
    result *= 2;
    --v1;
  }
  while (v1);
  return result;
}

vm_address_t GTTraceStoreCreate(uint64_t a1)
{
  vm_address_t v1 = GTCoreAlloc(a1, 0x148uLL);
  pthread_mutex_init((pthread_mutex_t *)(v1 + 264), 0);
  return v1;
}

uint64_t GTTraceStoreDestroy(int *a1)
{
  if (*a1 >= 1)
  {
    uint64_t v2 = 0;
    uint64_t v3 = 0;
    do
    {
      vm_deallocate(mach_task_self_, *(void *)(*((void *)a1 + 1) + v2), *(void *)(*((void *)a1 + 1) + v2 + 8));
      ++v3;
      v2 += 16;
    }
    while (v3 < *a1);
  }
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 66));
  free(*((void **)a1 + 1));
  vm_map_t v4 = mach_task_self_;

  return vm_deallocate(v4, (vm_address_t)a1, 0x148uLL);
}

uint64_t GTTraceStoreAllocNode(int *a1, uint64_t a2, char a3, uint64_t a4)
{
  unint64_t v7 = a2 + 64;
  if ((unint64_t)(a2 + 64) < 0x101)
  {
    unint64_t v12 = (pthread_mutex_t *)(a1 + 66);
    uint64_t v13 = pthread_mutex_lock((pthread_mutex_t *)(a1 + 66));
    int v11 = 0;
    goto LABEL_8;
  }
  unsigned int v8 = -1;
  unint64_t v9 = 256;
  do
  {
    unsigned int v10 = v8;
    v9 *= 2;
    ++v8;
  }
  while (v9 < v7);
  int v11 = v10 + 2;
  unint64_t v12 = (pthread_mutex_t *)(a1 + 66);
  uint64_t v13 = pthread_mutex_lock((pthread_mutex_t *)(a1 + 66));
  if (v8 <= 0x1D)
  {
LABEL_8:
    unsigned int v14 = (vm_address_t *)v11;
    while (!*(void *)&a1[2 * (void)v14 + 4])
    {
      unsigned int v14 = (vm_address_t *)((char *)v14 + 1);
      if (v14 == (vm_address_t *)((char *)&dword_1C + 3)) {
        goto LABEL_11;
      }
    }
    goto LABEL_26;
  }
  if (v11 != 31)
  {
LABEL_30:
    uint64_t v26 = v11;
    goto LABEL_31;
  }
  int v11 = 31;
LABEL_11:
  int v15 = 0;
  unint64_t v16 = 0x800000;
  if (v7 > 0x800000) {
    unint64_t v16 = v7;
  }
  for (unint64_t i = 256; i < v16; i *= 2)
    ++v15;
  memory_object_size_t v18 = 256;
  do
  {
    v18 *= 2;
    --v15;
  }
  while (v15);
  vm_address_t v19 = GTCoreAlloc(v13, v18);
  int v20 = *a1;
  int v21 = a1[1];
  if (v21 == *a1)
  {
    int v22 = 2 * v21;
    if (!v21) {
      int v22 = 8;
    }
    a1[1] = v22;
    char v23 = (char *)malloc_type_realloc(*((void **)a1 + 1), 16 * v22, 0x10C004028F705ECuLL);
    *((void *)a1 + 1) = v23;
    int v20 = *a1;
  }
  else
  {
    char v23 = (char *)*((void *)a1 + 1);
  }
  *a1 = v20 + 1;
  unsigned int v14 = (vm_address_t *)&v23[16 * v20];
  *unsigned int v14 = v19;
  v14[1] = v18;
  *(_DWORD *)vm_address_t v19 = v18;
  *(_DWORD *)(v19 + 4) = 64;
  *(void *)(v19 + 8) = 0;
  *(void *)(v19 + 16) = 0;
  *(void *)(v19 + 24) = 0;
  *(void *)(v19 + 32) = v19;
  *(void *)(v19 + 48) = 0;
  *(void *)(v19 + 56) = 0;
  *(void *)(v19 + 40) = 0;
  LODWORD(v14) = 0;
  if (v18)
  {
    unint64_t v24 = 256;
    do
    {
      v24 *= 2;
      LODWORD(v14) = v14 + 1;
    }
    while (v24 < v18);
  }
  *(void *)&a1[2 * (int)v14 + 4] = v19;
LABEL_26:
  if (v11 >= (int)v14) {
    goto LABEL_30;
  }
  uint64_t v25 = (int)v14;
  uint64_t v26 = v11;
  uint64_t v27 = *(unsigned int **)&a1[2 * (int)v14 + 4];
  do
  {
    uint64_t v28 = &a1[2 * v25];
    *((void *)v28 + 2) = *((void *)v27 + 5);
    unint64_t v29 = (unint64_t)*v27 >> 1;
    *v27 >>= 1;
    v27[1] = 64;
    *((void *)v27 + 2) = 0;
    *((void *)v27 + 3) = 0;
    *((void *)v27 + 1) = 0;
    *((void *)v27 + 4) = v27;
    *((void *)v27 + 6) = 0;
    *((void *)v27 + 7) = 0;
    uint64_t v30 = (char *)v27 + v29;
    *(_DWORD *)uint64_t v30 = v29;
    *((_DWORD *)v30 + 1) = 64;
    *((void *)v30 + 1) = 0;
    *((void *)v30 + 2) = 0;
    *((void *)v30 + 3) = 0;
    *((void *)v30 + 4) = v30;
    *((void *)v30 + 6) = 0;
    *((void *)v30 + 7) = 0;
    *((void *)v30 + 5) = 0;
    *((void *)v27 + 5) = (char *)v27 + v29;
    --v25;
    *((void *)v28 + 1) = v27;
  }
  while (v25 > v11);
LABEL_31:
  uint64_t v31 = &a1[2 * v26];
  uint64_t v32 = *((void *)v31 + 2);
  *((void *)v31 + 2) = *(void *)(v32 + 40);
  *(unsigned char *)(v32 + 8) = a3;
  *(void *)(v32 + 16) = a4;
  *(void *)(v32 + 24) = a1;
  *(void *)(v32 + 40) = 0;
  pthread_mutex_unlock(v12);
  return v32;
}

uint64_t GTTraceStoreFreeNodes(uint64_t result, unsigned int *a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    uint64_t v3 = result;
    vm_map_t v4 = (pthread_mutex_t *)(result + 264);
    pthread_mutex_lock((pthread_mutex_t *)(result + 264));
    do
    {
      unint64_t v5 = *v2;
      if (v5 < 0x101)
      {
        int v6 = 0;
      }
      else
      {
        int v6 = 0;
        for (unint64_t i = 256; i < v5; i *= 2)
          ++v6;
      }
      unsigned int v8 = (unsigned int *)*((void *)v2 + 5);
      v2[1] = 64;
      *((void *)v2 + 1) = 0;
      *((void *)v2 + 2) = 0;
      *((void *)v2 + 3) = 0;
      *((void *)v2 + 4) = v2;
      *((void *)v2 + 6) = 0;
      *((void *)v2 + 7) = 0;
      *((void *)v2 + 5) = 0;
      uint64_t v9 = v3 + 8 * v6;
      *((void *)v2 + 5) = *(void *)(v9 + 16);
      *(void *)(v9 + 16) = v2;
      uint64_t v2 = v8;
    }
    while (v8);
    return pthread_mutex_unlock(v4);
  }
  return result;
}

char *GTTraceStoreNodeSubAlloc(unsigned int *a1, uint64_t a2)
{
  unsigned int v2 = atomic_load(a1 + 1);
  while (1)
  {
    uint64_t v3 = v2;
    unint64_t v4 = a2 + v2;
    unint64_t v5 = *a1;
    if (v4 > v5) {
      break;
    }
    unsigned int v2 = v3;
    atomic_compare_exchange_strong((atomic_uint *volatile)a1 + 1, &v2, v4);
    if (v2 == v3)
    {
      unint64_t v5 = *a1;
      break;
    }
  }
  int v6 = (char *)a1 + v3;
  if (v4 <= v5) {
    return v6;
  }
  else {
    return 0;
  }
}

uint64_t GTTraceStoreListLock(uint64_t a1)
{
  uint64_t add = atomic_fetch_add((atomic_uint *volatile)(a1 + 16), 1u);
  do
    unsigned int v2 = atomic_load((unsigned int *)(a1 + 20));
  while (v2 != add);
  return add;
}

uint64_t GTTraceStoreListUnlock(uint64_t result, int a2)
{
  return result;
}

void *GTTraceStoreListPrependNode(void *result, uint64_t a2)
{
  *(void *)(a2 + 40) = *result;
  char *result = a2;
  if (!result[1]) {
    result[1] = a2;
  }
  return result;
}

uint64_t GTTraceStoreListConcat(uint64_t result, unsigned int *a2)
{
  if (*(void *)(result + 8))
  {
    unsigned int v2 = atomic_load(a2 + 4);
    atomic_fetch_add((atomic_uint *volatile)(result + 16), v2);
    unsigned int v3 = atomic_load(a2 + 5);
    atomic_fetch_add((atomic_uint *volatile)(result + 20), v3);
    *(void *)(*(void *)(result + 8) + 40) = *(void *)a2;
    uint64_t v4 = *((void *)a2 + 1);
    if (v4) {
      *(void *)(result + 8) = v4;
    }
  }
  else
  {
    long long v5 = *(_OWORD *)a2;
    *(void *)(result + 16) = *((void *)a2 + 2);
    *(_OWORD *)uint64_t result = v5;
  }
  *(void *)a2 = 0;
  *((void *)a2 + 1) = 0;
  *((void *)a2 + 2) = 0;
  return result;
}

void *GTTraceStoreListAppendNode(void *result, uint64_t a2)
{
  uint64_t v2 = result[1];
  if (v2) {
    unsigned int v3 = (void *)(v2 + 40);
  }
  else {
    unsigned int v3 = result;
  }
  void *v3 = a2;
  result[1] = a2;
  *(void *)(a2 + 40) = 0;
  return result;
}

apr_pool_t **fbstream_open(apr_pool_t *a1, uint64_t a2, apr_pool_t *a3)
{
  unint64_t v7 = (apr_pool_t **)apr_palloc(a3, 0x20uLL);
  unsigned int v8 = v7;
  if (v7)
  {
    *(_OWORD *)unint64_t v7 = 0u;
    *((_OWORD *)v7 + 1) = 0u;
  }
  uint64_t v9 = (void *)*((void *)a3 + 5);
  if (v9) {
    *((void *)a3 + 5) = *v9;
  }
  else {
    uint64_t v9 = apr_palloc(a3, 0x20uLL);
  }
  v9[1] = v8;
  v9[2] = fbstream_cleanup;
  v9[3] = apr_pool_cleanup_null;
  *uint64_t v9 = *((void *)a3 + 4);
  *((void *)a3 + 4) = v9;
  unsigned int v10 = +[NSString stringWithUTF8String:a2];
  *unsigned int v8 = a3;
  uint64_t v11 = +[NSMutableData dataWithCapacity:4096];
  unint64_t v12 = v8[1];
  v8[1] = (apr_pool_t *)v11;

  v8[2] = a1;
  v18[0] = @"buffer name";
  v18[1] = @"has pstream header";
  v19[0] = v10;
  v19[1] = &__kCFBooleanTrue;
  v18[2] = @"capture serial";
  uint64_t v13 = +[NSNumber numberWithUnsignedLongLong:*((void *)a1 + 4)];
  v19[2] = v13;
  uint64_t v14 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];
  int v15 = v8[3];
  v8[3] = (apr_pool_t *)v14;

  uint64_t v17 = 0x4005053544DLL;
  fbstream_write((uint64_t)v8, (uint64_t)&v17, 8uLL);

  return v8;
}

void fbstream_write(uint64_t a1, uint64_t a2, unint64_t a3)
{
  id v7 = [*(id *)(a1 + 8) length];
  if (*(void *)(*(void *)(a1 + 16) + 104))
  {
    if ((unint64_t)v7 + a3 >= 0x1000)
    {
      uint64_t v8 = 4096 - (void)v7;
      [*(id *)(a1 + 8) appendBytes:a2 length:4096 - (void)v7];
      fbstream_flush(a1);
      a2 += v8;
      a3 -= v8;
      if (a3 >= 0x1000)
      {
        uint64_t v9 = +[NSData dataWithBytesNoCopy:a2 length:a3 freeWhenDone:0];
        fbstream_send(a1, v9);

        a3 = 0;
      }
    }
  }
  [*(id *)(a1 + 8) appendBytes:a2 length:a3];
}

void fbstream_flush(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 8) copy];
  fbstream_send(a1, v2);

  [*(id *)(a1 + 8) setLength:0];
  unsigned int v3 = [*(id *)(a1 + 24) objectForKeyedSubscript:@"has pstream header"];
  unsigned int v4 = [v3 BOOLValue];

  if (v4)
  {
    long long v5 = [*(id *)(a1 + 24) objectForKeyedSubscript:@"buffer name"];
    int v6 = [*(id *)(a1 + 24) objectForKeyedSubscript:@"capture serial"];
    v9[0] = @"buffer name";
    v9[1] = @"has pstream header";
    v10[0] = v5;
    v10[1] = &__kCFBooleanFalse;
    v9[2] = @"capture serial";
    v10[2] = v6;
    uint64_t v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];
    uint64_t v8 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = v7;
  }
}

void fbstream_send(uint64_t a1, void *a2)
{
  id v4 = *(id *)(*(void *)(a1 + 16) + 104);
  id v5 = a2;
  _sendTimebaseUpdate(v4, 0);
  id v6 = +[GTTransportMessage_capture messageWithKind:1792 attributes:*(void *)(a1 + 24) payload:v5];

  [v4 send:v6 error:0];
}

uint64_t fbstream_cleanup(uint64_t a1)
{
  unsigned int v3 = *(void **)(a1 + 16);
  if (v3[13])
  {
    fbstream_flush(a1);
  }
  else
  {
    id v4 = [*(id *)(a1 + 24) objectForKeyedSubscript:@"buffer name"];
    GTMTLCaptureState_storeData(v3, v4, *(void **)(a1 + 8));
  }
  id v5 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = 0;

  id v6 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = 0;

  return 0;
}

uint64_t fbstream_close(apr_pool_t **data)
{
  apr_pool_cleanup_kill(*data, data, (apr_status_t (__cdecl *)(void *))fbstream_cleanup);

  return fbstream_cleanup((uint64_t)data);
}

uint64_t GTTraceContext_setParent()
{
  s();
  uint64_t v1 = *v0;
  uint64_t *v0 = v2;
  return v1;
}

void GTTraceContext_addFlags()
{
  s();
  *(unsigned char *)(v0 + 8) |= v1;
}

void GTTraceContext_removeFlags()
{
  s();
  *(unsigned char *)(v0 + 8) &= ~v1;
}

uint64_t GTTraceContext_setIncludeBacktrace(uint64_t result, unsigned __int8 a2)
{
  return result;
}

apr_hash_t *GTTraceContext_buildBacktraceMap(uint64_t a1, apr_pool_t *pool)
{
  unsigned int v3 = apr_hash_make(pool);
  for (uint64_t i = 0; i != 16; ++i)
  {
    for (uint64_t j = *(void *)(a1 + 24 * i + 128); j; uint64_t j = *(void *)(j + 40))
    {
      uint64_t v6 = atomic_load((unsigned int *)(j + 4));
      if (v6 != 64)
      {
        uint64_t v7 = j + 64;
        uint64_t v8 = j + v6;
        do
        {
          apr_hash_set(v3, (const void *)v7, 8, (const void *)(v7 + 8));
          v7 += (8 * *(void *)(v7 + 8) + 23) & 0xFFFFFFFF8;
        }
        while (v7 != v8);
      }
    }
  }
  return v3;
}

uint64_t GTTraceContext_create()
{
  newpool = 0;
  apr_pool_create_ex(&newpool, 0, 0, 0);
  uint64_t v0 = newpool;
  char v1 = (pthread_mutex_t *)apr_palloc(newpool, 0x200uLL);
  uint64_t v2 = (uint64_t)v1;
  if (v1)
  {
    *(_OWORD *)&v1[7].__opaque[24] = 0u;
    *(_OWORD *)&v1[7].__opaque[40] = 0u;
    *(_OWORD *)&v1[7].__sig = 0u;
    *(_OWORD *)&v1[7].__opaque[8] = 0u;
    *(_OWORD *)&v1[6].__opaque[24] = 0u;
    *(_OWORD *)&v1[6].__opaque[40] = 0u;
    *(_OWORD *)&v1[6].__sig = 0u;
    *(_OWORD *)&v1[6].__opaque[8] = 0u;
    *(_OWORD *)&v1[5].__opaque[24] = 0u;
    *(_OWORD *)&v1[5].__opaque[40] = 0u;
    *(_OWORD *)&v1[5].__sig = 0u;
    *(_OWORD *)&v1[5].__opaque[8] = 0u;
    *(_OWORD *)&v1[4].__opaque[24] = 0u;
    *(_OWORD *)&v1[4].__opaque[40] = 0u;
    *(_OWORD *)&v1[4].__sig = 0u;
    *(_OWORD *)&v1[4].__opaque[8] = 0u;
    *(_OWORD *)&v1[3].__opaque[24] = 0u;
    *(_OWORD *)&v1[3].__opaque[40] = 0u;
    *(_OWORD *)&v1[3].__sig = 0u;
    *(_OWORD *)&v1[3].__opaque[8] = 0u;
    *(_OWORD *)&v1[2].__opaque[24] = 0u;
    *(_OWORD *)&v1[2].__opaque[40] = 0u;
    *(_OWORD *)&v1[2].__sig = 0u;
    *(_OWORD *)&v1[2].__opaque[8] = 0u;
    *(_OWORD *)&v1[1].__opaque[24] = 0u;
    *(_OWORD *)&v1[1].__opaque[40] = 0u;
    *(_OWORD *)&v1[1].__sig = 0u;
    *(_OWORD *)&v1[1].__opaque[8] = 0u;
    *(_OWORD *)&v1->__opaque[24] = 0u;
    *(_OWORD *)&v1->__opaque[40] = 0u;
    *(_OWORD *)&v1->__sig = 0u;
    *(_OWORD *)&v1->__opaque[8] = 0u;
  }
  pthread_mutex_init(v1, 0);
  unsigned int v3 = apr_hash_make(v0);
  *(void *)(v2 + 88) = v3;
  vm_address_t v4 = GTCoreAlloc((uint64_t)v3, 0x148uLL);
  pthread_mutex_init((pthread_mutex_t *)(v4 + 264), 0);
  *(void *)(v2 + 64) = v4;
  *(void *)(v2 + 112) = GTTraceContext_openStream(v2, 0, 0);
  atomic_store(0, (unsigned __int8 *)(v2 + 120));
  atomic_store(0, (unsigned int *)(v2 + 104));
  return v2;
}

unint64_t *GTTraceContext_openStream(uint64_t a1, unint64_t a2, unint64_t a3)
{
  pthread_mutex_lock((pthread_mutex_t *)a1);
  RetainFreeNode(a1);
  uint64_t v7 = v6;
  RetainFreeNode(a1);
  v7[3] = v8;
  unint64_t add = atomic_fetch_add((atomic_ullong *volatile)(a1 + 80), 1uLL);
  *uint64_t v7 = add;
  v7[1] = a2;
  v7[2] = a3;
  unint64_t v10 = v7[3];
  *(void *)unint64_t v10 = *(void *)(a1 + 64);
  *(void *)(v10 + 32) = add;
  atomic_fetch_add((atomic_uint *volatile)(v10 + 40), 1u);
  atomic_store(0, v7 + 7);
  apr_hash_set(*(apr_hash_t **)(a1 + 88), v7, 8, v7);
  pthread_mutex_unlock((pthread_mutex_t *)a1);
  return v7;
}

double RetainFreeNode(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 96);
  if (!v2)
  {
    uint64_t v2 = apr_palloc(**(apr_pool_t ***)(a1 + 88), 0x1000uLL);
    for (uint64_t i = 0; i != 504; i += 8)
      v2[i] = &v2[i + 8];
    v2[504] = 0;
    *(void *)(a1 + 96) = v2;
  }
  *(void *)(a1 + 96) = *v2;
  double result = 0.0;
  *((_OWORD *)v2 + 2) = 0u;
  *((_OWORD *)v2 + 3) = 0u;
  *(_OWORD *)uint64_t v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  return result;
}

void GTTraceContext_destroy(uint64_t a1)
{
}

void GTTraceContext_closeStream(uint64_t a1, void *a2)
{
  pthread_mutex_lock((pthread_mutex_t *)a1);
  unsigned int v4 = atomic_load((unsigned int *)(a1 + 104));
  if (v4 == 1)
  {
    if (!a2) {
      goto LABEL_15;
    }
    goto LABEL_12;
  }
  BOOL v5 = v4 != 2 || a2 == 0;
  if (!v5)
  {
    char v8 = atomic_load(a2 + 7);
    if ((v8 & 0x10) != 0)
    {
LABEL_12:
      unint64_t v9 = atomic_load(a2 + 7);
      unint64_t v10 = v9;
      do
      {
        atomic_compare_exchange_strong(a2 + 7, &v10, v9 | 4);
        BOOL v5 = v10 == v9;
        unint64_t v9 = v10;
      }
      while (!v5);
LABEL_15:
      pthread_mutex_unlock((pthread_mutex_t *)a1);
      return;
    }
  }
  long long v14 = 0uLL;
  *(void *)int v15 = 0;
  apr_hash_set(*(apr_hash_t **)(a1 + 88), a2, 8, 0);
  int v6 = *(_DWORD *)(*(void *)(a1 + 88) + 48);
  uint64_t v7 = a2[3];
  if (atomic_fetch_add((atomic_uint *volatile)(v7 + 40), 0xFFFFFFFF) == 1)
  {
    long long v14 = *(_OWORD *)(v7 + 8);
    *(void *)int v15 = *(void *)(v7 + 24);
    *(void *)(v7 + 8) = 0;
    *(void *)(v7 + 16) = 0;
    *(void *)(v7 + 24) = 0;
    *(void *)uint64_t v7 = *(void *)(a1 + 96);
    *(void *)(a1 + 96) = v7;
  }
  uint64_t v11 = (long long *)(a2 + 4);
  if (*((void *)&v14 + 1))
  {
    unsigned int v12 = atomic_load((unsigned int *)a2 + 12);
    atomic_fetch_add(v15, v12);
    unsigned int v13 = atomic_load((unsigned int *)a2 + 13);
    atomic_fetch_add(&v15[1], v13);
    *(void *)(*((void *)&v14 + 1) + 40) = a2[4];
  }
  else
  {
    long long v14 = *v11;
    *(void *)int v15 = a2[6];
  }
  *(void *)uint64_t v11 = 0;
  a2[5] = 0;
  a2[6] = 0;
  *a2 = *(void *)(a1 + 96);
  *(void *)(a1 + 96) = a2;
  pthread_mutex_unlock((pthread_mutex_t *)a1);
  GTTraceStoreFreeNodes(*(void *)(a1 + 64), (unsigned int *)v14);
  if (!v6)
  {
    pthread_mutex_destroy((pthread_mutex_t *)a1);
    GTTraceStoreDestroy(*(int **)(a1 + 64));
    apr_pool_destroy(**(apr_pool_t ***)(a1 + 88));
    if ((shared_initialized & 1) == 0 && !--initialized) {
      apr_pool_terminate();
    }
  }
}

uint64_t GTTraceContext_getStream(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = a2;
  pthread_mutex_lock((pthread_mutex_t *)a1);
  uint64_t v3 = *find_entry(*(void *)(a1 + 88), &v6, 8uLL, 0);
  if (v3) {
    uint64_t v4 = *(void *)(v3 + 32);
  }
  else {
    uint64_t v4 = 0;
  }
  pthread_mutex_unlock((pthread_mutex_t *)a1);
  return v4;
}

unint64_t GTTraceContext_newStreamIdentifier(uint64_t a1)
{
  return atomic_fetch_add((atomic_ullong *volatile)(a1 + 80), 1uLL);
}

unint64_t *GTTraceContext_openEncoderStream(uint64_t a1, unint64_t a2, unint64_t a3)
{
  pthread_mutex_lock((pthread_mutex_t *)a1);
  RetainFreeNode(a1);
  uint64_t v7 = v6;
  *uint64_t v6 = atomic_fetch_add((atomic_ullong *volatile)(a1 + 80), 1uLL);
  v6[1] = a2;
  v6[3] = a3;
  atomic_fetch_add((atomic_uint *volatile)(a3 + 40), 1u);
  atomic_store(0, v6 + 7);
  apr_hash_set(*(apr_hash_t **)(a1 + 88), v7, 8, v7);
  pthread_mutex_unlock((pthread_mutex_t *)a1);
  return v7;
}

BOOL GTTraceContext_isTransientStreamRetained(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = atomic_load((unsigned int *)(a1 + 104));
  if (v2 != 2) {
    return v2 == 1;
  }
  if (!a2) {
    return 0;
  }
  unint64_t v4 = atomic_load((unint64_t *)(a2 + 56));
  return (v4 >> 4) & 1;
}

uint64_t GTTraceContext_retainTransientStreams(uint64_t result)
{
  return result;
}

uint64_t GTTraceContext_stopRetainingNewTransientStreams(uint64_t result)
{
  return result;
}

apr_array_header_t *GTTraceContext_cleanupTransientStreams(uint64_t a1, apr_pool_t *a2)
{
  atomic_store(0, (unsigned int *)(a1 + 104));
  pthread_mutex_lock((pthread_mutex_t *)a1);
  unint64_t v4 = apr_array_make(a2, 32, 8);
  long long v29 = 0uLL;
  *(void *)uint64_t v30 = 0;
  uint64_t v5 = *(void *)(a1 + 88);
  *(_DWORD *)(v5 + 40) = 0;
  *(void *)(v5 + 16) = v5;
  *(void *)(v5 + 24) = 0;
  *(void *)(v5 + 32) = 0;
  uint64_t v6 = apr_hash_next((apr_hash_index_t *)(v5 + 16));
  if (v6)
  {
    uint64_t v7 = v6;
    do
    {
      char v8 = *(void **)(*((void *)v7 + 1) + 32);
      if (v8)
      {
        char v9 = atomic_load(v8 + 7);
        if ((v9 & 4) != 0)
        {
          uint64_t v13 = v8[1];
          *(void *)apr_array_push(v4) = v13;
          apr_hash_set(*(apr_hash_t **)(a1 + 88), v8, 8, 0);
          uint64_t v14 = v8[3];
          uint64_t v15 = *((void *)&v29 + 1);
          if (atomic_fetch_add((atomic_uint *volatile)(v14 + 40), 0xFFFFFFFF) == 1)
          {
            unint64_t v16 = (long long *)(v14 + 8);
            if (*((void *)&v29 + 1))
            {
              unsigned int v17 = atomic_load((unsigned int *)(v14 + 24));
              atomic_fetch_add(v30, v17);
              unsigned int v18 = atomic_load((unsigned int *)(v14 + 28));
              atomic_fetch_add(&v30[1], v18);
              uint64_t v15 = *((void *)&v29 + 1);
              *(void *)(*((void *)&v29 + 1) + 40) = *(void *)(v14 + 8);
              if (*(void *)(v14 + 16))
              {
                *((void *)&v29 + 1) = *(void *)(v14 + 16);
                uint64_t v15 = *((void *)&v29 + 1);
              }
            }
            else
            {
              long long v29 = *v16;
              *(void *)uint64_t v30 = *(void *)(v14 + 24);
              uint64_t v15 = *((void *)&v29 + 1);
            }
            *(void *)unint64_t v16 = 0;
            *(void *)(v14 + 16) = 0;
            *(void *)(v14 + 24) = 0;
            *(void *)uint64_t v14 = *(void *)(a1 + 96);
            *(void *)(a1 + 96) = v14;
          }
          vm_address_t v19 = (long long *)(v8 + 4);
          if (v15)
          {
            unsigned int v20 = atomic_load((unsigned int *)v8 + 12);
            atomic_fetch_add(v30, v20);
            unsigned int v21 = atomic_load((unsigned int *)v8 + 13);
            atomic_fetch_add(&v30[1], v21);
            *(void *)(*((void *)&v29 + 1) + 40) = v8[4];
            if (v8[5]) {
              *((void *)&v29 + 1) = v8[5];
            }
          }
          else
          {
            long long v29 = *v19;
            *(void *)uint64_t v30 = v8[6];
          }
          *(void *)vm_address_t v19 = 0;
          v8[5] = 0;
          v8[6] = 0;
          *char v8 = *(void *)(a1 + 96);
          *(void *)(a1 + 96) = v8;
        }
        else
        {
          unint64_t v10 = atomic_load(v8 + 7);
          unint64_t v11 = v10;
          do
          {
            atomic_compare_exchange_strong(v8 + 7, &v11, v10 & 0xFFFFFFFFFFFFFFEFLL);
            BOOL v12 = v11 == v10;
            unint64_t v10 = v11;
          }
          while (!v12);
        }
      }
      uint64_t v7 = apr_hash_next(v7);
    }
    while (v7);
  }
  pthread_mutex_unlock((pthread_mutex_t *)a1);
  for (uint64_t i = 0; i != 384; i += 24)
  {
    uint64_t v23 = a1 + i;
    unint64_t v24 = (void *)(a1 + i + 128);
    if (*((void *)&v29 + 1))
    {
      unsigned int v25 = atomic_load((unsigned int *)(v23 + 144));
      atomic_fetch_add(v30, v25);
      unsigned int v26 = atomic_load((unsigned int *)(v23 + 148));
      atomic_fetch_add(&v30[1], v26);
      *(void *)(*((void *)&v29 + 1) + 40) = *v24;
      uint64_t v27 = *(void *)(v23 + 136);
      if (v27) {
        *((void *)&v29 + 1) = v27;
      }
    }
    else
    {
      long long v29 = *(_OWORD *)v24;
      *(void *)uint64_t v30 = *(void *)(a1 + i + 144);
    }
    *unint64_t v24 = 0;
    *(void *)(a1 + i + 136) = 0;
    *(void *)(a1 + i + 144) = 0;
  }
  GTTraceStoreFreeNodes(*(void *)(a1 + 64), (unsigned int *)v29);
  return v4;
}

unint64_t GTTraceContext_newDispatchIndex(uint64_t a1)
{
  return atomic_fetch_add((atomic_ullong *volatile)(a1 + 72), 1uLL);
}

unint64_t GTTraceContext_newDispatchIndices(uint64_t a1, unint64_t a2)
{
  return atomic_fetch_add((atomic_ullong *volatile)(a1 + 72), a2);
}

unint64_t GTTraceContext_dispatchIndex(uint64_t a1)
{
  return atomic_load((unint64_t *)(a1 + 72));
}

unint64_t *GTTraceContext_openLayerStream(uint64_t a1, unint64_t a2)
{
  unint64_t v6 = a2;
  pthread_mutex_lock((pthread_mutex_t *)a1);
  uint64_t v3 = *find_entry(*(void *)(a1 + 88), &v6, 8uLL, 0);
  if (!v3)
  {
    pthread_mutex_unlock((pthread_mutex_t *)a1);
LABEL_5:
    unint64_t v4 = GTTraceContext_openStream(a1, v6, v6);
    pthread_mutex_lock((pthread_mutex_t *)a1);
    apr_hash_set(*(apr_hash_t **)(a1 + 88), v4 + 1, 8, v4);
    pthread_mutex_unlock((pthread_mutex_t *)a1);
    return v4;
  }
  unint64_t v4 = *(unint64_t **)(v3 + 32);
  pthread_mutex_unlock((pthread_mutex_t *)a1);
  if (!v4) {
    goto LABEL_5;
  }
  return v4;
}

void GTTraceContext_closeLayerStream(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = a2;
  pthread_mutex_lock((pthread_mutex_t *)a1);
  uint64_t v3 = *find_entry(*(void *)(a1 + 88), &v5, 8uLL, 0);
  if (v3 && (unint64_t v4 = *(void **)(v3 + 32)) != 0)
  {
    apr_hash_set(*(apr_hash_t **)(a1 + 88), v4 + 1, 8, 0);
    pthread_mutex_unlock((pthread_mutex_t *)a1);
    GTTraceContext_closeStream(a1, v4);
  }
  else
  {
    pthread_mutex_unlock((pthread_mutex_t *)a1);
  }
}

apr_hash_t *GTTraceContext_copyStreamMap(uint64_t a1, apr_pool_t *a2)
{
  pthread_mutex_lock((pthread_mutex_t *)a1);
  unint64_t v4 = apr_hash_copy(a2, *(const apr_hash_t **)(a1 + 88));
  pthread_mutex_unlock((pthread_mutex_t *)a1);
  return v4;
}

apr_array_header_t *GTTraceContext_buildDispatchArray(uint64_t a1, unint64_t a2, uint64_t nelts, apr_pool_t *p)
{
  int v4 = nelts;
  unint64_t v25 = a2;
  uint64_t v26 = nelts;
  unint64_t v6 = apr_array_make(p, nelts, 64);
  v6->uint64_t nelts = v4;
  *(_DWORD *)(a1 + 40) = 0;
  *(void *)(a1 + 16) = a1;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  uint64_t v7 = apr_hash_next((apr_hash_index_t *)(a1 + 16));
  if (v7)
  {
    char v8 = v7;
    do
    {
      uint64_t v9 = *(void *)(*(void *)(*((void *)v8 + 1) + 32) + 32);
      if (v9)
      {
        while (1)
        {
          unsigned int v10 = atomic_load((unsigned int *)(v9 + 4));
          unsigned int v11 = (v10 >> 6) - 1;
          if (v10 >> 6 == 1)
          {
            uint64_t v12 = 0;
          }
          else
          {
            uint64_t v12 = (int)v11;
            uint64_t v13 = (char *)(v9 + (v10 & 0xFFFFFFC0) - 49);
            do
            {
              char v14 = *v13;
              v13 -= 64;
              if ((v14 & 8) != 0) {
                break;
              }
              --v12;
            }
            while (v12);
          }
          unint64_t v15 = v9 + 64;
          if (v10 >= 0x80)
          {
            do
            {
              if ((int)GTTraceFuncCompare((void *)(v15 + (v11 >> 1 << 6)), &v25) >= 0)
              {
                v11 >>= 1;
              }
              else
              {
                v15 += (v11 >> 1 << 6) + 64;
                v11 += ~(v11 >> 1);
              }
            }
            while ((int)v11 > 0);
          }
          unint64_t v16 = v9 + 64 + (v12 << 6);
          if (v15 < v16) {
            break;
          }
LABEL_22:
          uint64_t v9 = *(void *)(v9 + 40);
          if (!v9) {
            goto LABEL_23;
          }
        }
        unint64_t v17 = v25;
        unint64_t v18 = v26 + v25;
        while (*(void *)v15 >= v17 && *(void *)v15 < v18)
        {
          unsigned int v20 = &v6->elts[64 * (*(void *)v15 - v17)];
          long long v21 = *(_OWORD *)v15;
          long long v22 = *(_OWORD *)(v15 + 16);
          long long v23 = *(_OWORD *)(v15 + 48);
          *((_OWORD *)v20 + 2) = *(_OWORD *)(v15 + 32);
          *((_OWORD *)v20 + 3) = v23;
          *(_OWORD *)unsigned int v20 = v21;
          *((_OWORD *)v20 + 1) = v22;
          v15 += 64;
          if (v15 >= v16) {
            goto LABEL_22;
          }
        }
      }
LABEL_23:
      char v8 = apr_hash_next(v8);
    }
    while (v8);
  }
  return v6;
}

uint64_t GTTraceFuncCompare(void *a1, void *a2)
{
  if (*a1 < *a2) {
    return 0xFFFFFFFFLL;
  }
  else {
    return *a1 > *a2;
  }
}

_DWORD *StreamNodeToArray@<X0>(unsigned int *a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = 0;
  unsigned int v2 = atomic_load(a1 + 1);
  unsigned int v4 = *a1;
  double result = a1 + 16;
  *(_DWORD *)(a2 + 8) = 64;
  *(_DWORD *)(a2 + 12) = (v2 >> 6) - 1;
  *(_DWORD *)(a2 + 16) = (v4 >> 6) - 1;
  *(void *)(a2 + 24) = result;
  return result;
}

uint64_t GTTraceContext_filterDispatchArray(uint64_t result)
{
  char v1 = (_OWORD *)*(unsigned int *)(result + 12);
  if ((int)v1 < 1)
  {
    LODWORD(v2) = 0;
  }
  else
  {
    uint64_t v2 = 0;
    uint64_t v3 = (int *)(*(void *)(result + 24) + 8);
    while (1)
    {
      int v4 = *v3;
      v3 += 16;
      if (!v4) {
        break;
      }
      if (v1 == (_OWORD *)++v2) {
        goto LABEL_14;
      }
    }
  }
  if ((int)v2 >= (int)v1)
  {
LABEL_14:
    int v5 = 0;
  }
  else
  {
    int v5 = 0;
    unint64_t v6 = (unint64_t)v2 << 6;
    do
    {
      uint64_t v7 = *(void *)(result + 24);
      char v8 = (long long *)(v7 + v6);
      if (*(_DWORD *)(v7 + v6 + 8))
      {
        char v1 = (_OWORD *)(v7 + ((uint64_t)((int)v2 - v5) << 6));
        long long v9 = *v8;
        long long v10 = v8[1];
        long long v11 = v8[3];
        v1[2] = v8[2];
        v1[3] = v11;
        *char v1 = v9;
        v1[1] = v10;
        LODWORD(v1) = *(_DWORD *)(result + 12);
      }
      else
      {
        ++v5;
      }
      LODWORD(v2) = v2 + 1;
      v6 += 64;
    }
    while ((int)v1 > (int)v2);
  }
  *(_DWORD *)(result + 12) = v1 - v5;
  return result;
}

apr_array_header_t *GTTraceContext_copyStreamMapAndBuildDispatchArray(uint64_t a1, unint64_t a2, uint64_t a3, apr_pool_t *a4, apr_hash_t **a5)
{
  pthread_mutex_lock((pthread_mutex_t *)a1);
  long long v10 = apr_hash_copy(a4, *(const apr_hash_t **)(a1 + 88));
  long long v11 = GTTraceContext_buildDispatchArray((uint64_t)v10, a2, a3, a4);
  pthread_mutex_unlock((pthread_mutex_t *)a1);
  if (a5) {
    *a5 = v10;
  }
  return v11;
}

uint64_t GTTraceFunc_argumentBlobWithPool(uint64_t *a1, unsigned int a2, uint64_t a3)
{
  if (a2 < 0x40) {
    return 0;
  }
  else {
    return GTTraceMemPool_findHeader(a3, *a1, a2);
  }
}

uint64_t GTTraceFunc_argumentBlobWithMap(void *a1, unsigned int a2, uint64_t a3)
{
  if (a2 < 0x40) {
    return 0;
  }
  v7[2] = v3;
  v7[3] = v4;
  v7[0] = *a1;
  v7[1] = a2;
  entry = find_entry(a3, v7, 9uLL, 0);
  if (*entry) {
    return *(void *)(*entry + 32);
  }
  else {
    return 0;
  }
}

char *GTTraceFunc_argumentBytesWithPool(uint64_t *a1, unsigned int a2, uint64_t a3)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0x40) {
    return (char *)a1 + a2;
  }
  uint64_t Header = GTTraceMemPool_findHeader(a3, *a1, a2);
  if (Header) {
    return (char *)(Header + 16);
  }
  else {
    return 0;
  }
}

char *GTTraceFunc_argumentBytesWithMap(void *a1, unsigned int a2, uint64_t a3)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0x40) {
    return (char *)a1 + a2;
  }
  v8[2] = v3;
  v8[3] = v4;
  v8[0] = *a1;
  v8[1] = a2;
  entry = find_entry(a3, v8, 9uLL, 0);
  if (!*entry) {
    return 0;
  }
  uint64_t v6 = *(void *)(*entry + 32);
  if (v6) {
    return (char *)(v6 + 16);
  }
  else {
    return 0;
  }
}

char *GTTraceFunc_targetContext(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = *(_DWORD *)(a1 + 8);
  double result = GTTraceFunc_argumentBytesWithMap((void *)a1, *(unsigned __int8 *)(a1 + 13), a2);
  if (v2 >> 1 == 2147475691)
  {
    result += 16;
  }
  else if (!result)
  {
    return result;
  }
  return *(char **)result;
}

char *GTTraceFunc_getFuncStreamRef(uint64_t a1, uint64_t a2)
{
  if (GetFuncEnumConstructorType(*(_DWORD *)(a1 + 8))) {
    return (char *)*((void *)GTTraceFunc_argumentBytesWithMap((void *)a1, *(unsigned __int8 *)(a1 + 13), a2) + 1);
  }

  return GTTraceFunc_targetContext(a1, a2);
}

char *GTTraceFunc_parentWithMap(uint64_t a1, uint64_t a2)
{
  double result = GTTraceFunc_argumentBytesWithMap((void *)a1, *(unsigned __int8 *)(a1 + 12), a2);
  if (result) {
    return *(char **)result;
  }
  return result;
}

uint64_t GTTraceMemoryMap_argumentBlobAtIndex(unsigned int a1, uint64_t a2, uint64_t a3)
{
  if (a1 < 0x40) {
    return 0;
  }
  v7[2] = v3;
  v7[3] = v4;
  v7[0] = a3;
  v7[1] = a1;
  entry = find_entry(a2, v7, 9uLL, 0);
  if (*entry) {
    return *(void *)(*entry + 32);
  }
  else {
    return 0;
  }
}

void GTTraceContext_pushEncoderWithExplicitIndex(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = a1;
  a3[1] = 0;
  a3[2] = 0;
  a3[3] = a2;
  s();
  uint64_t v4 = *v3;
  uint64_t *v3 = v5;
  *(void *)(v6 + 32) = v4;
  *(unsigned char *)(v6 + 40) = *((unsigned char *)v3 + 8);
  *(_WORD *)(v6 + 41) = 16400;
  *(_DWORD *)(v6 + 43) = 0;
  *(unsigned char *)(v6 + 47) = 0;
}

void GTTraceContext_pushEncoder(uint64_t a1@<X0>, void *a2@<X8>)
{
  unint64_t add = atomic_fetch_add((atomic_ullong *volatile)(a1 + 72), 1uLL);
  *a2 = a1;
  a2[1] = 0;
  a2[2] = 0;
  a2[3] = add;
  s();
  uint64_t v4 = *v3;
  uint64_t *v3 = v5;
  *(void *)(v6 + 32) = v4;
  *(unsigned char *)(v6 + 40) = *((unsigned char *)v3 + 8);
  *(_WORD *)(v6 + 41) = 16400;
  *(_DWORD *)(v6 + 43) = 0;
  *(unsigned char *)(v6 + 47) = 0;
}

void *GTTraceContext_pushEncoderWithStream@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  unint64_t add = atomic_fetch_add((atomic_ullong *volatile)(a1 + 72), 1uLL);
  *(void *)a2 = a1;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = add;
  s();
  uint64_t v6 = *v5;
  uint64_t *v5 = v7;
  *(void *)(a2 + 32) = v6;
  *(unsigned char *)(a2 + 40) = *((unsigned char *)v5 + 8);
  *(_WORD *)(a2 + 41) = 16400;
  *(_DWORD *)(a2 + 43) = 0;
  *(unsigned char *)(a2 + 47) = 0;
  double result = (void *)GTTraceEncoder_setStream_(a2, v8);
  unsigned __int8 v10 = atomic_load((unsigned __int8 *)(a1 + 120));
  if (v10)
  {
    uint64_t v11 = *(void *)a2;
    uint64_t v12 = *(void *)(a2 + 24);
    return GTTraceContext_backtrace(v11, v12);
  }
  return result;
}

uint64_t GTTraceEncoder_setStream_(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    a2 = *(void *)(*(void *)a1 + 112);
  }
  *(void *)(a1 + 8) = a2;
  PushFunc(a2);
  *(void *)(a1 + 16) = v3;
  char v4 = *(unsigned char *)(a1 + 40);
  *(void *)uint64_t v3 = *(void *)(a1 + 24);
  *(_DWORD *)(v3 + 8) = 0;
  *(_DWORD *)(v3 + 11) = 0;
  *(unsigned char *)(v3 + 15) = v4;
  *(_OWORD *)(v3 + 32) = 0u;
  *(_OWORD *)(v3 + 48) = 0u;
  *(_OWORD *)(v3 + 16) = 0u;
  if (*(void *)(a1 + 32)) {
    uint64_t result = GTTraceEncoder_storeBytes(a1, (void *)(a1 + 32), 8uLL);
  }
  else {
    uint64_t result = 0;
  }
  *(unsigned char *)(*(void *)(a1 + 16) + 12) = result;
  return result;
}

void *GTTraceContext_backtrace(uint64_t a1, uint64_t a2)
{
  GTTraceContext_backtrace_callstack();
  uint64_t v5 = v4;
  uint64_t result = (void *)backtrace(v4, 512);
  if ((int)result >= 1)
  {
    uint64_t v7 = (int)result - 2;
    size_t v8 = 8 * v7;
    __uint64_t v32 = 0;
    pthread_threadid_np(0, &v32);
    unsigned int v9 = v32 & 0xF;
    __uint64_t v10 = a1 + 24 * (v32 & 0xF);
    unsigned int add = atomic_fetch_add((atomic_uint *volatile)(v10 + 144), 1u);
    uint64_t v12 = (unsigned int *)(v10 + 148);
    do
      unsigned int v13 = atomic_load(v12);
    while (v13 != add);
    unint64_t v14 = (v8 + 23) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v15 = a1 + 24 * v9;
    unint64_t v18 = *(unsigned int **)(v15 + 128);
    unint64_t v17 = (void *)(v15 + 128);
    unint64_t v16 = v18;
    if (!v18) {
      goto LABEL_10;
    }
    unsigned int v19 = atomic_load(v16 + 1);
    while (1)
    {
      uint64_t v20 = v19;
      unint64_t v21 = v14 + v19;
      unint64_t v22 = *v16;
      if (v21 > v22) {
        break;
      }
      unsigned int v19 = v20;
      atomic_compare_exchange_strong((atomic_uint *volatile)v16 + 1, &v19, v21);
      if (v19 == v20)
      {
        unint64_t v22 = *v16;
        break;
      }
    }
    long long v23 = (void *)((char *)v16 + v20);
    if (v21 > v22)
    {
LABEL_10:
      unint64_t v24 = (unsigned int *)GTTraceStoreAllocNode(*(int **)(a1 + 64), 16320, 3, 0);
      *((void *)v24 + 5) = *v17;
      void *v17 = v24;
      uint64_t v25 = a1 + 24 * v9;
      uint64_t v27 = *(void *)(v25 + 136);
      uint64_t v26 = (void *)(v25 + 136);
      if (!v27) {
        *uint64_t v26 = v24;
      }
      unsigned int v28 = atomic_load(v24 + 1);
      while (1)
      {
        uint64_t v29 = v28;
        unint64_t v30 = v14 + v28;
        unint64_t v31 = *v24;
        if (v30 > v31) {
          break;
        }
        unsigned int v28 = v29;
        atomic_compare_exchange_strong((atomic_uint *volatile)v24 + 1, &v28, v30);
        if (v28 == v29)
        {
          unint64_t v31 = *v24;
          break;
        }
      }
      long long v23 = (void *)((char *)v24 + v29);
      if (v30 > v31) {
        long long v23 = 0;
      }
    }
    atomic_store(add + 1, v12);
    void *v23 = a2;
    v23[1] = v7 | 0x800000000;
    return memcpy(v23 + 2, v5 + 2, v8);
  }
  return result;
}

double PushFunc(uint64_t a1)
{
  unsigned int add = atomic_fetch_add((atomic_uint *volatile)(a1 + 48), 1u);
  do
    unsigned int v3 = atomic_load((unsigned int *)(a1 + 52));
  while (v3 != add);
  char v4 = *(unsigned int **)(a1 + 40);
  if (!v4) {
    goto LABEL_9;
  }
  unsigned int v5 = atomic_load(v4 + 1);
  while (1)
  {
    uint64_t v6 = v5;
    unint64_t v7 = v5 + 64;
    unint64_t v8 = *v4;
    if (v7 > v8) {
      break;
    }
    unsigned int v5 = v6;
    atomic_compare_exchange_strong((atomic_uint *volatile)v4 + 1, &v5, v7);
    if (v5 == v6)
    {
      unint64_t v8 = *v4;
      break;
    }
  }
  if (v7 <= v8)
  {
    unsigned int v19 = (_OWORD *)((char *)v4 + v6);
    signed int v9 = add + 1;
  }
  else
  {
LABEL_9:
    signed int v9 = add + 1;
    if ((unint64_t)((uint64_t)(int)(add + 1) << 7) >= 0x3FC0) {
      uint64_t v10 = 16320;
    }
    else {
      uint64_t v10 = (uint64_t)v9 << 7;
    }
    uint64_t v11 = (unsigned int *)GTTraceStoreAllocNode(**(int ***)(a1 + 24), v10, 1, *(void *)a1);
    uint64_t v12 = *(void *)(a1 + 40);
    if (v12) {
      unsigned int v13 = (void *)(v12 + 40);
    }
    else {
      unsigned int v13 = (void *)(a1 + 32);
    }
    *unsigned int v13 = v11;
    *(void *)(a1 + 40) = v11;
    *((void *)v11 + 5) = 0;
    unsigned int v14 = atomic_load(v11 + 1);
    while (1)
    {
      uint64_t v15 = v14;
      unint64_t v16 = v14 + 64;
      unint64_t v17 = *v11;
      if (v16 > v17) {
        break;
      }
      unsigned int v14 = v15;
      atomic_compare_exchange_strong((atomic_uint *volatile)v11 + 1, &v14, v16);
      if (v14 == v15)
      {
        unint64_t v17 = *v11;
        break;
      }
    }
    unint64_t v18 = (_OWORD *)((char *)v11 + v15);
    if (v16 <= v17) {
      unsigned int v19 = v18;
    }
    else {
      unsigned int v19 = 0;
    }
  }
  double result = 0.0;
  v19[2] = 0u;
  void v19[3] = 0u;
  *unsigned int v19 = 0u;
  v19[1] = 0u;
  atomic_store(v9, (unsigned int *)(a1 + 52));
  return result;
}

uint64_t GTTraceEncoder_storeBytes(uint64_t a1, void *__src, size_t __n)
{
  uint64_t v3 = 0;
  if (__src)
  {
    unsigned int v4 = __n;
    if (__n)
    {
      uint64_t v3 = *(unsigned __int8 *)(a1 + 41);
      if (v3 + __n > 0x40)
      {
        uint64_t v7 = *(void *)(*(void *)(a1 + 8) + 24);
        uint64_t v3 = *(unsigned __int8 *)(a1 + 42);
        *(unsigned char *)(a1 + 42) = v3 + 1;
        if (__n)
        {
          Bytes = GTTraceMemPool_allocateBytes(v7, *(void *)(a1 + 24), v3 | ((unint64_t)__n << 32));
          memcpy(Bytes + 16, __src, v4);
        }
      }
      else
      {
        memcpy((void *)(*(void *)(a1 + 16) + v3), __src, __n);
        *(unsigned char *)(a1 + 41) += (v4 + 7) & 0xF8;
      }
    }
  }
  return v3;
}

uint64_t GTTraceEncoder_finishEncoding(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 16) + 15) |= 8u;
  return result;
}

void GTTraceContext_popEncoder()
{
  s();
  *(void *)uint64_t v0 = v1;
  *(unsigned char *)(v0 + 8) = *(unsigned char *)(v2 + 40);
  *(unsigned char *)(*(void *)(v2 + 16) + 15) |= 8u;
}

void *GTTraceEncoder_setStream(uint64_t *a1, uint64_t a2)
{
  double result = (void *)GTTraceEncoder_setStream_((uint64_t)a1, a2);
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)(*a1 + 120));
  if (v4)
  {
    uint64_t v5 = *a1;
    uint64_t v6 = a1[3];
    return GTTraceContext_backtrace(v5, v6);
  }
  return result;
}

char *GTTraceEncoder_allocateArguments(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  *(_DWORD *)(v3 + 8) = a2;
  if (a3)
  {
    uint64_t v4 = *(unsigned __int8 *)(a1 + 41);
    if ((unint64_t)(v4 + a3) > 0x40)
    {
      uint64_t v6 = *(void *)(*(void *)(a1 + 8) + 24);
      uint64_t v7 = *(unsigned __int8 *)(a1 + 42);
      *(unsigned char *)(a1 + 42) = v7 + 1;
      uint64_t v5 = GTTraceMemPool_allocateBytes(v6, *(void *)(a1 + 24), v7 | (a3 << 32)) + 16;
      LOBYTE(v4) = v7;
    }
    else
    {
      uint64_t v5 = (char *)(v3 + v4);
      *(unsigned char *)(a1 + 41) = v4 + a3;
    }
  }
  else
  {
    uint64_t v5 = 0;
    LOBYTE(v4) = 0;
  }
  *(unsigned char *)(v3 + 13) = v4;
  return v5;
}

uint64_t GTTraceEncoder_storeBlob(uint64_t a1, const void *a2, uint64_t a3)
{
  uint64_t v3 = 0;
  if (a2)
  {
    if (a3)
    {
      uint64_t v4 = *(void *)(*(void *)(a1 + 8) + 24);
      uint64_t v3 = *(unsigned __int8 *)(a1 + 42);
      *(unsigned char *)(a1 + 42) = v3 + 1;
      if (a3)
      {
        size_t v6 = a3;
        Bytes = GTTraceMemPool_allocateBytes(v4, *(void *)(a1 + 24), v3 | ((unint64_t)a3 << 32));
        memcpy(Bytes + 16, a2, v6);
      }
    }
  }
  return v3;
}

char *GTTraceEncoder_allocateBlobWithType(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 8) + 24);
  uint64_t v5 = *(void *)(a1 + 24);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 42);
  *(unsigned char *)(a1 + 42) = v6 + 1;
  return GTTraceMemPool_allocateBytes(v4, v5, (a2 << 32) | ((unint64_t)a3 << 16) | ((unint64_t)a4 << 8) | v6);
}

__n128 GTTraceEncoder_cloneToStream(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(a1 + 16) + 15) |= 8u;
  PushFunc(a2);
  uint64_t v3 = *(void *)(a1 + 16);
  long long v5 = *(_OWORD *)(v3 + 32);
  __n128 result = *(__n128 *)(v3 + 48);
  long long v6 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)uint64_t v7 = *(_OWORD *)v3;
  *(_OWORD *)(v7 + 16) = v6;
  *(_OWORD *)(v7 + 32) = v5;
  *(__n128 *)(v7 + 48) = result;
  return result;
}

uint64_t GTTraceStream_uniqueIdentifier(uint64_t result)
{
  if (result) {
    return *(void *)result;
  }
  return result;
}

uint64_t GTTraceStream_deviceObject(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t GTTraceStream_deviceObjectOrNULL(uint64_t result)
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

uint64_t GTTraceStream_toolsObject(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

uint64_t GTTraceStream_memoryPool(uint64_t a1)
{
  return *(void *)(a1 + 24);
}

uint64_t GTTraceStream_setBoundTimestamp(uint64_t result, uint64_t a2)
{
  if (result)
  {
    unint64_t v2 = atomic_load((unint64_t *)(result + 56));
    unint64_t v3 = v2;
    do
    {
      atomic_compare_exchange_strong((atomic_ullong *volatile)(result + 56), &v3, v2 & 0x1F | a2 & 0xFFFFFFFFFFFFFFE0);
      BOOL v4 = v3 == v2;
      unint64_t v2 = v3;
    }
    while (!v4);
  }
  return result;
}

uint64_t GTTraceStream_touchBoundTimestamp(uint64_t a1)
{
  uint64_t result = mach_absolute_time();
  if (a1)
  {
    unint64_t v3 = atomic_load((unint64_t *)(a1 + 56));
    unint64_t v4 = v3;
    do
    {
      atomic_compare_exchange_strong((atomic_ullong *volatile)(a1 + 56), &v4, v3 & 0x1F | result & 0xFFFFFFFFFFFFFFE0);
      BOOL v5 = v4 == v3;
      unint64_t v3 = v4;
    }
    while (!v5);
  }
  return result;
}

uint64_t GTTraceStream_touchResourceUsage(uint64_t result, uint64_t a2)
{
  if (result)
  {
    unint64_t v2 = atomic_load((unint64_t *)(result + 56));
    unint64_t v3 = v2;
    do
    {
      atomic_compare_exchange_strong((atomic_ullong *volatile)(result + 56), &v3, v2 | a2);
      BOOL v4 = v3 == v2;
      unint64_t v2 = v3;
    }
    while (!v4);
  }
  return result;
}

uint64_t GTTraceStream_touchUpdated(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = atomic_load((unint64_t *)(result + 56));
    unint64_t v2 = v1;
    do
    {
      atomic_compare_exchange_strong((atomic_ullong *volatile)(result + 56), &v2, v1 | 8);
      BOOL v3 = v2 == v1;
      unint64_t v1 = v2;
    }
    while (!v3);
  }
  return result;
}

uint64_t GTTraceStream_resetUpdated(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = atomic_load((unint64_t *)(result + 56));
    unint64_t v2 = v1;
    do
    {
      atomic_compare_exchange_strong((atomic_ullong *volatile)(result + 56), &v2, v1 & 0xFFFFFFFFFFFFFFF7);
      BOOL v3 = v2 == v1;
      unint64_t v1 = v2;
    }
    while (!v3);
  }
  return result;
}

uint64_t GTTraceStream_resourceUsage(uint64_t result)
{
  if (result)
  {
    char v1 = atomic_load((unint64_t *)(result + 56));
    return v1 & 3;
  }
  return result;
}

unint64_t GTTraceStream_boundTimestamp(unint64_t result)
{
  if (result)
  {
    unint64_t v1 = atomic_load((unint64_t *)(result + 56));
    return v1 & 0xFFFFFFFFFFFFFFE0;
  }
  return result;
}

uint64_t GTTraceStream_updated(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = atomic_load((unint64_t *)(result + 56));
    return (v1 >> 3) & 1;
  }
  return result;
}

uint64_t GTTraceStream_markForDeferredClose(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = atomic_load((unint64_t *)(result + 56));
    unint64_t v2 = v1;
    do
    {
      atomic_compare_exchange_strong((atomic_ullong *volatile)(result + 56), &v2, v1 | 0x10);
      BOOL v3 = v2 == v1;
      unint64_t v1 = v2;
    }
    while (!v3);
  }
  return result;
}

uint64_t GTTraceStream_firstFunc(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = *(void *)(result + 32);
    if (v1 && (*(unsigned char *)(v1 + 79) & 8) != 0) {
      return v1 + 64;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t GTTraceStream_lastFunc(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    unsigned int v2 = atomic_load((unsigned int *)(v1 + 4));
    if (v2 < 0x80)
    {
LABEL_7:
      uint64_t v1 = *(void *)(a1 + 32);
      if (v1)
      {
        unsigned int v6 = 0;
        while (1)
        {
          unsigned int v7 = atomic_load((unsigned int *)(v1 + 4));
          int v8 = v6 + (v7 >> 6) - 1;
          if (v8 > 0) {
            break;
          }
          uint64_t v1 = *(void *)(v1 + 40);
          unsigned int v6 = v8;
          if (!v1) {
            return v1;
          }
        }
        uint64_t v9 = v6;
        uint64_t v10 = (uint64_t)(0xFFFFFFFF00000001 * v6) >> 32;
        if ((*(unsigned char *)(v1 + (v10 << 6) + 79) & 8) != 0)
        {
          do
          {
            uint64_t v11 = v1;
            uint64_t v12 = v10;
            unsigned int v13 = atomic_load((unsigned int *)(v1 + 4));
            uint64_t v14 = (HIDWORD(v9) + 1);
            if (v14 == v9 + (v13 >> 6) - 1)
            {
              uint64_t v1 = *(void *)(v11 + 40);
              if (!v1) {
                return v11 + (v12 << 6) + 64;
              }
              uint64_t v9 = (HIDWORD(v9) + 1);
            }
            else
            {
              uint64_t v9 = v9;
              uint64_t v1 = v11;
            }
            v9 |= v14 << 32;
            uint64_t v10 = (uint64_t)(0xFFFFFFFF00000001 * v9) >> 32;
          }
          while ((*(unsigned char *)(v1 + (v10 << 6) + 79) & 8) != 0);
          return v11 + (v12 << 6) + 64;
        }
        else
        {
          return 0;
        }
      }
    }
    else
    {
      int v3 = (v2 >> 6) - 2;
      uint64_t v4 = v1 + 64;
      while (1)
      {
        uint64_t v1 = v4 + ((unint64_t)v3 << 6);
        if ((*(unsigned char *)(v1 + 15) & 8) != 0) {
          break;
        }
        BOOL v5 = __OFSUB__(v3--, 1);
        if (v3 < 0 != v5) {
          goto LABEL_7;
        }
      }
    }
  }
  return v1;
}

uint64_t GTTraceStream_makeIterator(uint64_t a1, int a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    int v3 = 0;
    do
    {
      unsigned int v4 = atomic_load((unsigned int *)(result + 4));
      int v5 = v3 + (v4 >> 6) - 1;
      if (v5 > a2) {
        break;
      }
      uint64_t result = *(void *)(result + 40);
      int v3 = v5;
    }
    while (result);
  }
  return result;
}

uint64_t GTTraceStreamIteratorFunc(uint64_t a1)
{
  if (*(void *)a1
    && (uint64_t v1 = *(void *)a1 + ((*(int *)(a1 + 12) - (uint64_t)*(int *)(a1 + 8)) << 6), (*(unsigned char *)(v1 + 79) & 8) != 0))
  {
    return v1 + 64;
  }
  else
  {
    return 0;
  }
}

_DWORD *GTTraceStreamIteratorNext(_DWORD *result)
{
  unsigned int v1 = atomic_load((unsigned int *)(*(void *)result + 4));
  int v2 = result[2] + (v1 >> 6);
  int v3 = result[3] + 1;
  result[3] = v3;
  if (v3 == v2 - 1)
  {
    result[2] = v3;
    *(void *)uint64_t result = *(void *)(*(void *)result + 40);
  }
  return result;
}

BOOL GTTraceStreamIteratorBegin(uint64_t a1)
{
  return *(_DWORD *)(a1 + 12) == 0;
}

BOOL GTTraceStreamIteratorEnd(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if (*a1)
  {
    uint64_t v2 = v1 + ((*((int *)a1 + 3) - (uint64_t)*((int *)a1 + 2)) << 6);
    if ((*(unsigned char *)(v2 + 79) & 8) != 0) {
      uint64_t v1 = v2 + 64;
    }
    else {
      uint64_t v1 = 0;
    }
  }
  return v1 == 0;
}

uint64_t GTTraceFuncGetAttribs(uint64_t result, unsigned char *a2)
{
  if (result)
  {
    entry = find_entry(result, a2, 8uLL, 0);
    if (*entry) {
      return *(void *)(*entry + 32);
    }
    else {
      return 0;
    }
  }
  return result;
}

void *GTCaptureArchive_open(const char *a1, apr_pool_t *a2)
{
  bzero(v53, 0x400uLL);
  unsigned int v4 = realpath_DARWIN_EXTSN(a1, v53);
  memset(&v49.st_blksize, 0, 32);
  if (v4) {
    a1 = v4;
  }
  *(_OWORD *)&v49.off_t st_size = 0uLL;
  int v5 = gt_filepath_merge(a1, "index", a2);
  int v6 = open(v5, 0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0);
  if (v6 < 0) {
    return 0;
  }
  int v7 = v6;
  fstat(v6, &v49);
  int v8 = apr_palloc(a2, v49.st_size);
  uint64_t v9 = 0;
  off_t st_size = v49.st_size;
  do
  {
    if ((unint64_t)(st_size - v9) >= 0x100000) {
      size_t v11 = 0x100000;
    }
    else {
      size_t v11 = st_size - v9;
    }
    ssize_t v12 = read(v7, (char *)v8 + v9, v11);
    if (v12 == -1) {
      ssize_t v13 = 0;
    }
    else {
      ssize_t v13 = v12;
    }
    v9 += v13;
  }
  while (v12 != -1 && v9 != st_size);
  close(v7);
  if (v49.st_size < 0x14uLL) {
    return 0;
  }
  if (*v8 != 1667851384) {
    return 0;
  }
  if (v8[1]) {
    return 0;
  }
  uint64_t v15 = v8[2];
  if (v49.st_size - 20 < (unint64_t)(12 * v15)) {
    return 0;
  }
  uint64_t v16 = (uint64_t)&v8[3 * v15 + 5];
  uint64_t v17 = v8[3];
  if (v49.st_size - (12 * (unint64_t)v15 + 20) < 24 * v17) {
    return 0;
  }
  uint64_t v18 = v16 + 24 * v17;
  uint64_t v19 = v8[4];
  if ((unint64_t)v8 + v49.st_size - v18 < 2 * v19) {
    return 0;
  }
  uint64_t v20 = apr_array_make(a2, v19, 8);
  uint64_t v21 = v8[4];
  if (v21)
  {
    unint64_t v22 = 0;
    long long v23 = (char *)v8 + v49.st_size;
    unint64_t v24 = v18 + 2 * v21;
    while ((unint64_t)v23 > v24)
    {
      *(void *)apr_array_push(v20) = v24;
      v24 += *(unsigned __int16 *)(v18 + 2 * v22++);
      if (v22 >= v8[4]) {
        goto LABEL_26;
      }
    }
    return 0;
  }
LABEL_26:
  uint64_t v25 = gt_filepath_merge(a1, "store0", a2);
  int v26 = open(v25, 0);
  if (v26 < 0) {
    return 0;
  }
  int v27 = v26;
  memset(&v51, 0, sizeof(v51));
  fstat(v26, &v51);
  unsigned int v28 = mmap(0, v51.st_size, 1, 2, v27, 0);
  off_t v29 = v51.st_size;
  close(v27);
  unint64_t v30 = apr_palloc(a2, 0x70uLL);
  unint64_t v31 = v30;
  if (v30)
  {
    v30[5] = 0u;
    v30[6] = 0u;
    v30[3] = 0u;
    atomic_uint v30[4] = 0u;
    v30[1] = 0u;
    v30[2] = 0u;
    _OWORD *v30 = 0u;
  }
  *(void *)unint64_t v30 = apr_pstrdup(a2, a1);
  v31[1] = a2;
  v31[2] = v8;
  v31[3] = v49.st_size;
  v31[4] = v8 + 5;
  v31[5] = v16;
  v31[6] = v20;
  v31[7] = *((void *)v8 + 1);
  v31[8] = v28;
  v31[9] = v29;
  v31[10] = apr_array_make(a2, 4, 24);
  v31[11] = apr_hash_make(a2);
  newpool = 0;
  if (!apr_pool_create_ex(&newpool, a2, 0, 0))
  {
    __uint64_t v32 = v31 + 12;
    uint64_t v33 = newpool;
    uint64_t v34 = gt_filepath_merge(a1, "metadata", newpool);
    int v35 = open(v34, 0);
    if (v35 < 0)
    {
      void *v32 = 0;
      v31[13] = 0;
    }
    else
    {
      int v36 = v35;
      memset(&v51, 0, sizeof(v51));
      fstat(v35, &v51);
      uint64_t v37 = (const UInt8 *)apr_palloc(v33, v51.st_size);
      uint64_t v38 = 0;
      off_t v39 = v51.st_size;
      do
      {
        if ((unint64_t)(v39 - v38) >= 0x100000) {
          size_t v40 = 0x100000;
        }
        else {
          size_t v40 = v39 - v38;
        }
        ssize_t v41 = read(v36, (void *)&v37[v38], v40);
        if (v41 == -1) {
          ssize_t v42 = 0;
        }
        else {
          ssize_t v42 = v41;
        }
        v38 += v42;
      }
      while (v41 != -1 && v38 != v39);
      close(v36);
      CFDataRef v44 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, v37, v51.st_size, kCFAllocatorNull);
      CFErrorRef error = 0;
      CFDictionaryRef v45 = (const __CFDictionary *)CFPropertyListCreateWithData(kCFAllocatorDefault, v44, 0, 0, &error);
      CFRelease(v44);
      if (error || (CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v45, @"(uuid)")) == 0)
      {
        void *v32 = 0;
        v31[13] = 0;
      }
      else
      {
        CFUUIDRef v48 = CFUUIDCreateFromString(kCFAllocatorDefault, Value);
        *((CFUUIDBytes *)v31 + 6) = CFUUIDGetUUIDBytes(v48);
        CFRelease(v48);
      }
      CFRelease(v45);
    }
    apr_pool_destroy(v33);
  }
  apr_pool_cleanup_register(a2, v31, (apr_status_t (__cdecl *)(void *))GTCaptureArchive_cleanup, apr_pool_cleanup_null);
  return v31;
}

uint64_t GTCaptureArchive_cleanup(uint64_t a1)
{
  return 0;
}

void GTCaptureArchive_overrideURL(uint64_t a1, const char *a2, const char *a3)
{
  newpool = 0;
  apr_pool_create_ex(&newpool, *(apr_pool_t **)(a1 + 8), 0, 0);
  int v6 = newpool;
  int v7 = gt_filepath_merge(*(const char **)a1, a3, newpool);
  int v8 = fopen(v7, "r");
  uint64_t v9 = v8;
  if (v8)
  {
    memset(&v16, 0, sizeof(v16));
    int v10 = fileno(v8);
    if (!fstat(v10, &v16))
    {
      size_t v11 = apr_pstrdup(*(apr_pool_t **)(a1 + 8), a2);
      ssize_t v12 = apr_pstrdup(*(apr_pool_t **)(a1 + 8), a3);
      ssize_t v13 = *(apr_array_header_t **)(a1 + 48);
      int nelts = v13->nelts;
      *(void *)apr_array_push(v13) = v12;
      LODWORD(v12) = (LODWORD(v16.st_size) + vm_page_size - 1) & -(int)vm_page_size;
      uint64_t v15 = apr_array_push(*(apr_array_header_t **)(a1 + 80));
      *uint64_t v15 = v12;
      v15[1] = nelts;
      *((void *)v15 + 1) = 0;
      *((void *)v15 + 2) = 2;
      apr_hash_set(*(apr_hash_t **)(a1 + 88), v11, -1, v15);
    }
  }
  fclose(v9);
  apr_pool_destroy(v6);
}

__n128 GTCaptureArchive_getUUID(__n128 *a1, __n128 *a2)
{
  __n128 result = a1[6];
  *a2 = result;
  return result;
}

uint64_t GTCaptureArchive_rootPath(uint64_t a1)
{
  return *(void *)a1;
}

size_t GTCaptureArchive_getFileWithFilename(uint64_t a1, char *a2)
{
  uint64_t v4 = *find_entry(*(void *)(a1 + 88), a2, 0xFFFFFFFFFFFFFFFFLL, 0);
  if (!v4 || (size_t result = *(void *)(v4 + 32)) == 0)
  {
    size_t result = strlen(a2);
    if (result)
    {
      unsigned int v6 = dy_hash_string((uint64_t)a2, result);
      unsigned int v7 = *(_DWORD *)(a1 + 56);
      uint64_t v8 = *(void *)(a1 + 32);
      unsigned int v9 = v6 % v7;
      uint64_t v10 = (int)(v6 % v7);
      while (1)
      {
        unsigned int v11 = *(_DWORD *)(v8 + 12 * v10);
        if (v11 == -1) {
          return 0;
        }
        uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 24);
        if (!strcmp(a2, *(const char **)(v12 + 8 * *(unsigned int *)(v8 + 12 * v10 + 4)))) {
          break;
        }
        if (v7 <= ++v10)
        {
          if (v9)
          {
            uint64_t v13 = 0;
            for (uint64_t i = (unsigned int *)(v8 + 4); ; i += 3)
            {
              unsigned int v11 = *(i - 1);
              if (v11 == -1) {
                break;
              }
              if (!strcmp(a2, *(const char **)(v12 + 8 * *i))) {
                return *(void *)(a1 + 40) + 24 * v11;
              }
              size_t result = 0;
              if (++v13 >= (unint64_t)v9) {
                return result;
              }
            }
          }
          return 0;
        }
      }
      return *(void *)(a1 + 40) + 24 * v11;
    }
  }
  return result;
}

uint64_t dy_hash_string(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = -1640531527;
  unint64_t v3 = a2 - 1;
  if (a2 == 1) {
    goto LABEL_5;
  }
  unint64_t v4 = 0;
  do
  {
    unsigned int v5 = v2 + *(unsigned __int8 *)(a1 + v4);
    int v6 = (v5 << 16) ^ (*(unsigned __int8 *)(a1 + v4 + 1) << 11);
    unsigned int v2 = (v6 ^ v5) + ((v6 ^ v5) >> 11);
    v4 += 2;
  }
  while (v4 < v3);
  if (a2) {
LABEL_5:
  }
    unsigned int v2 = ((v2 + *(unsigned __int8 *)(a1 + v3)) ^ ((v2 + *(unsigned __int8 *)(a1 + v3)) << 11))
       + (((v2 + *(unsigned __int8 *)(a1 + v3)) ^ ((v2 + *(unsigned __int8 *)(a1 + v3)) << 11)) >> 17);
  unsigned int v7 = (v2 ^ (8 * v2)) + ((v2 ^ (8 * v2)) >> 5);
  unsigned int v8 = (v7 ^ (4 * v7)) + ((v7 ^ (4 * v7)) >> 15);
  unsigned int v9 = v8 ^ (v8 << 10);
  if (v9) {
    return v9;
  }
  else {
    return 0x40000000;
  }
}

BOOL GTCaptureFileEntry_isCompressed(uint64_t a1)
{
  return (*(unsigned char *)(a1 + 16) & 2) == 0;
}

void *GTCaptureArchiveDecompressor_create(apr_pool_t *a1)
{
  unsigned int v2 = apr_palloc(a1, 0x10uLL);
  unint64_t v3 = v2;
  if (v2)
  {
    *unsigned int v2 = 0;
    v2[1] = 0;
  }
  apr_pool_create_ex((apr_pool_t **)v2, a1, 0, 0);
  apr_size_t v4 = compression_decode_scratch_buffer_size(COMPRESSION_ZLIB);
  v3[1] = apr_palloc(a1, v4);
  return v3;
}

uint64_t GTCaptureArchiveDecompressor_tempPool(uint64_t a1)
{
  return *(void *)a1;
}

void *GTCaptureArchive_mapDataSeperateFile(uint64_t a1, unsigned int *a2, apr_pool_t *a3, int *a4)
{
  unsigned int v7 = a2[4];
  if (!a4)
  {
    if ((v7 & 2) == 0) {
      return 0;
    }
    unsigned int v10 = a2[1];
    uint64_t v11 = *(void *)(a1 + 48);
    if (v10 >= *(_DWORD *)(v11 + 12)) {
      return 0;
    }
    goto LABEL_8;
  }
  if ((v7 & 2) != 0)
  {
    unsigned int v10 = a2[1];
    uint64_t v11 = *(void *)(a1 + 48);
    if (v10 >= *(_DWORD *)(v11 + 12))
    {
      int v16 = *a4;
      long long v24 = 0u;
      long long v25 = 0u;
      int v21 = v16;
      int v22 = 500;
      unsigned int v9 = "0 <= entry->name_entry && entry->name_entry < self->index.string_table->nelts";
      goto LABEL_12;
    }
LABEL_8:
    uint64_t v12 = gt_filepath_merge(*(const char **)a1, *(const char **)(*(void *)(v11 + 24) + 8 * v10), a3);
    int v13 = open(v12, 0);
    int v14 = v13;
    if (a4)
    {
      if (v13 < 0)
      {
        int v15 = *a4;
        long long v24 = 0u;
        long long v25 = 0u;
        int v21 = v15;
        int v22 = 500;
        unsigned int v9 = "0 <= fd";
        goto LABEL_12;
      }
    }
    else if (v13 < 0)
    {
      return 0;
    }
    uint64_t v17 = mmap(0, *a2, 1, 2, v13, 0);
    uint64_t v19 = *a2;
    close(v14);
    uint64_t v20 = apr_palloc(a3, 0x10uLL);
    *uint64_t v20 = v17;
    v20[1] = v19;
    apr_pool_cleanup_register(a3, v20, (apr_status_t (__cdecl *)(void *))GTData_munmap, apr_pool_cleanup_null);
    return v17;
  }
  int v8 = *a4;
  long long v24 = 0u;
  long long v25 = 0u;
  int v21 = v8;
  int v22 = 500;
  unsigned int v9 = "entry->flags & 0x00000002";
LABEL_12:
  long long v23 = v9;
  GTError_addError(a4, (uint64_t)&v21);
  return 0;
}

uint64_t GTData_munmap(uint64_t a1)
{
  return 0;
}

unint64_t GTCaptureArchive_fileBackingStore(uint64_t a1, uint64_t a2, int *a3)
{
  int v3 = *(_DWORD *)(a2 + 16);
  if (!a3)
  {
    if ((v3 & 2) != 0) {
      return 0;
    }
    unint64_t v4 = *(void *)(a2 + 8);
    if (v4 > *(void *)(a1 + 72)) {
      return 0;
    }
    return *(void *)(a1 + 64) + v4;
  }
  if ((v3 & 2) != 0)
  {
    int v8 = *a3;
    long long v12 = 0u;
    long long v13 = 0u;
    int v9 = v8;
    int v10 = 500;
    int v6 = "!(entry->flags & 0x00000002)";
    goto LABEL_9;
  }
  unint64_t v4 = *(void *)(a2 + 8);
  if (v4 <= *(void *)(a1 + 72)) {
    return *(void *)(a1 + 64) + v4;
  }
  int v5 = *a3;
  long long v12 = 0u;
  long long v13 = 0u;
  int v9 = v5;
  int v10 = 500;
  int v6 = "entry->storage_offset <= archive->backingStore.length";
LABEL_9:
  uint64_t v11 = v6;
  GTError_addError(a3, (uint64_t)&v9);
  return 0;
}

void GTCaptureArchive_fillBufferCompressedDeflate(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, size_t a5, int *a6)
{
  if (!a2 && a6)
  {
    int v12 = *a6;
    long long v21 = 0u;
    long long v22 = 0u;
    int v18 = v12;
    int v19 = 500;
    uint64_t v20 = "decompressor != NULL";
    GTError_addError(a6, (uint64_t)&v18);
LABEL_14:
    bzero(a4, a5);
    return;
  }
  if (!a2) {
    goto LABEL_14;
  }
  if (a6 && *(_DWORD *)(a3 + 4) <= 5u)
  {
    int v13 = *a6;
    long long v21 = 0u;
    long long v22 = 0u;
    int v18 = v13;
    int v19 = 500;
    uint64_t v20 = "ZLIB_HEADER_SIZE + ZLIB_ADLER_SIZE <= entry->storage_size";
    GTError_addError(a6, (uint64_t)&v18);
  }
  if (*(_DWORD *)(a3 + 4) < 6u) {
    goto LABEL_14;
  }
  unint64_t v14 = GTCaptureArchive_fileBackingStore(a1, a3, a6);
  if (!v14) {
    goto LABEL_14;
  }
  size_t v15 = compression_decode_buffer((uint8_t *)a4, a5, (const uint8_t *)(v14 + 2), (*(_DWORD *)(a3 + 4) - 6), *(void **)(a2 + 8), COMPRESSION_ZLIB);
  size_t v16 = v15;
  if (a6 && v15 != a5)
  {
    int v17 = *a6;
    long long v21 = 0u;
    long long v22 = 0u;
    int v18 = v17;
    int v19 = 500;
    uint64_t v20 = "total_out == destSize";
    GTError_addError(a6, (uint64_t)&v18);
  }
  if (v16 != a5) {
    goto LABEL_14;
  }
}

void GTCaptureArchive_fillBuffer(const char **a1, apr_pool_t **a2, char *a3, void *a4, size_t a5, int *a6)
{
  FileWithFilename = (unsigned int *)GTCaptureArchive_getFileWithFilename((uint64_t)a1, a3);
  size_t v12 = *FileWithFilename;
  if (a6 && v12 < a5)
  {
    int v13 = *a6;
    long long v19 = 0u;
    long long v20 = 0u;
    v17[0] = v13;
    v17[1] = 500;
    int v18 = "destSize <= entry->size";
    GTError_addError(a6, (uint64_t)v17);
    size_t v12 = *FileWithFilename;
  }
  if (v12 >= a5)
  {
    if ((FileWithFilename[4] & 2) != 0)
    {
      unint64_t v14 = *(const char **)(*((void *)a1[6] + 3) + 8 * FileWithFilename[1]);
      size_t v15 = *a2;
      size_t v16 = *a1;
      GTCaptureArchive_fillBufferSeperateFile(v16, v14, a4, a5, v15, a6);
    }
    else
    {
      GTCaptureArchive_fillBufferCompressedDeflate((uint64_t)a1, (uint64_t)a2, (uint64_t)FileWithFilename, a4, a5, a6);
    }
  }
  else
  {
    bzero(a4, a5);
  }
}

void GTCaptureArchive_fillBufferSeperateFile(const char *a1, const char *a2, void *a3, size_t a4, apr_pool_t *a5, int *a6)
{
  int v9 = gt_filepath_merge(a1, a2, a5);
  int v10 = open(v9, 0, 0);
  char v11 = GTFile_map(v10, (uint64_t)a3, a4);
  if ((v10 & 0x80000000) == 0) {
    close(v10);
  }
  if (a6) {
    char v12 = v11;
  }
  else {
    char v12 = 1;
  }
  if ((v12 & 1) == 0)
  {
    int v13 = *a6;
    long long v16 = 0u;
    long long v17 = 0u;
    v14[0] = v13;
    v14[1] = 500;
    size_t v15 = "mapped";
    GTError_addError(a6, (uint64_t)v14);
  }
  if ((v11 & 1) == 0)
  {
    bzero(a3, a4);
  }
}

void *GTCaptureArchive_readData(const char **a1, apr_pool_t **a2, char *a3, apr_pool_t *a4, int *a5)
{
  if (!a3) {
    return 0;
  }
  FileWithFilename = (unsigned int *)GTCaptureArchive_getFileWithFilename((uint64_t)a1, a3);
  if (!FileWithFilename) {
    return 0;
  }
  uint64_t v11 = (uint64_t)FileWithFilename;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v17 = 0u;
  unsigned int v12 = FileWithFilename[4];
  apr_size_t v13 = *FileWithFilename;
  unint64_t v14 = apr_palloc(a4, v13);
  if ((v12 & 2) != 0) {
    GTCaptureArchive_fillBufferSeperateFile(*a1, a3, v14, v13, *a2, (int *)&v17);
  }
  else {
    GTCaptureArchive_fillBufferCompressedDeflate((uint64_t)a1, (uint64_t)a2, v11, v14, v13, (int *)&v17);
  }
  if (DWORD1(v17))
  {
    v16[0] = v17;
    v16[1] = v18;
    v16[2] = v19;
    GTError_addError(a5, (uint64_t)v16);
    return 0;
  }
  return v14;
}

void *GTCaptureArchive_mapData(uint64_t a1, uint64_t a2, char *a3, apr_pool_t *a4, int *a5)
{
  FileWithFilename = (unsigned int *)GTCaptureArchive_getFileWithFilename(a1, a3);
  if (!FileWithFilename) {
    return 0;
  }
  uint64_t v10 = (uint64_t)FileWithFilename;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  if ((FileWithFilename[4] & 2) != 0)
  {
    unsigned int v12 = GTCaptureArchive_mapDataSeperateFile(a1, FileWithFilename, a4, (int *)&v15);
  }
  else
  {
    apr_size_t v11 = *FileWithFilename;
    unsigned int v12 = apr_palloc(a4, v11);
    GTCaptureArchive_fillBufferCompressedDeflate(a1, a2, v10, v12, v11, (int *)&v15);
  }
  if (DWORD1(v15))
  {
    v14[0] = v15;
    v14[1] = v16;
    _DWORD v14[2] = v17;
    GTError_addError(a5, (uint64_t)v14);
    return 0;
  }
  return v12;
}

apr_array_header_t *GTCaptureArchive_sortedStrings(uint64_t a1, apr_pool_t *p)
{
  unsigned int v2 = apr_array_copy(p, *(const apr_array_header_t **)(a1 + 48));
  qsort(v2->elts, v2->nelts, v2->elt_size, (int (__cdecl *)(const void *, const void *))GTCaptureArchive_strcmp);
  return v2;
}

uint64_t GTCaptureArchive_strcmp(const char **a1, const char **a2)
{
  return strcmp(*a1, *a2);
}

uint64_t GTCaptureArchive_filenamesWithPrefix(uint64_t a1, char *__s, apr_array_header_t *a3)
{
  uint64_t result = strlen(__s);
  size_t v7 = result;
  int v8 = *(const char ***)(a1 + 24);
  unint64_t v9 = *(int *)(a1 + 12);
  uint64_t v10 = &v8[v9];
  if ((int)v9 >= 1)
  {
    do
    {
      apr_size_t v11 = &v8[v9 >> 1];
      apr_size_t v13 = *v11;
      unsigned int v12 = v11 + 1;
      uint64_t result = strncmp(v13, __s, v7);
      if ((int)result >= 0)
      {
        v9 >>= 1;
      }
      else
      {
        int v8 = v12;
        v9 += ~(v9 >> 1);
      }
    }
    while ((uint64_t)v9 > 0);
  }
  while (v8 != v10)
  {
    unint64_t v14 = *v8;
    uint64_t result = strncmp(*v8, __s, v7);
    if (result) {
      break;
    }
    uint64_t result = (uint64_t)apr_array_push(a3);
    *(void *)uint64_t result = v14;
    ++v8;
  }
  return result;
}

apr_array_header_t *GTCaptureArchive_fileIndex(uint64_t a1, apr_pool_t *p)
{
  unint64_t v4 = apr_array_make(p, *(_DWORD *)(a1 + 60), 32);
  v4->int nelts = *(_DWORD *)(a1 + 60);
  uint64_t v5 = *(void *)(a1 + 48);
  if (*(int *)(v5 + 12) >= 1)
  {
    uint64_t v6 = 0;
    do
    {
      size_t v7 = *(char **)(*(void *)(v5 + 24) + 8 * v6);
      size_t FileWithFilename = GTCaptureArchive_getFileWithFilename(a1, v7);
      uint64_t v9 = (uint64_t)&v4->elts[0x5555555555555560 * ((FileWithFilename - *(void *)(a1 + 40)) >> 3)];
      *(void *)uint64_t v9 = apr_pstrdup(p, v7);
      *(_DWORD *)(v9 + 8) = *(_DWORD *)FileWithFilename;
      *(_DWORD *)(v9 + 12) = *(_DWORD *)(FileWithFilename + 4);
      *(void *)(v9 + 16) = *(void *)(FileWithFilename + 8);
      *(_DWORD *)(v9 + 24) = *(_DWORD *)(FileWithFilename + 16);
      ++v6;
      uint64_t v5 = *(void *)(a1 + 48);
    }
    while (v6 < *(int *)(v5 + 12));
  }
  return v4;
}

uint64_t GTCaptureFileIndex_compareByStorageOffset(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(a2 + 16);
  if (v2 == v3) {
    return strcmp(*(const char **)a1, *(const char **)a2);
  }
  if (v2 < v3) {
    return 0xFFFFFFFFLL;
  }
  return 1;
}

uint64_t GTCaptureFileIndex_compareByName(const char **a1, const char **a2)
{
  return strcmp(*a1, *a2);
}

void GTCaptureFileIndex_save(uint64_t a1, const char *a2)
{
  newpool = 0;
  apr_pool_create_ex(&newpool, *(apr_pool_t **)a1, 0, 0);
  uint64_t v30 = 1667851384;
  unsigned int v3 = (2 * *(_DWORD *)(a1 + 12) + 1023) & 0xFFFFFC00;
  unsigned int v31 = v3;
  unint64_t v4 = newpool;
  uint64_t v5 = (char *)apr_palloc(newpool, 12 * v3);
  memset(v5, 255, 12 * v3);
  unsigned int v32 = *(_DWORD *)(a1 + 12);
  apr_size_t v26 = 24 * v32;
  off_t v29 = apr_palloc(v4, v26);
  unsigned int v33 = *(_DWORD *)(a1 + 12);
  p = v4;
  apr_size_t v25 = 2 * v33;
  uint64_t v6 = apr_palloc(v4, v25);
  if (*(int *)(a1 + 12) < 1)
  {
    apr_size_t v8 = 0;
  }
  else
  {
    uint64_t v7 = 0;
    apr_size_t v8 = 0;
    do
    {
      uint64_t v9 = *(void *)(a1 + 24);
      size_t v10 = strlen(*(const char **)(v9 + 32 * v7));
      __int16 v11 = v10;
      uint64_t v12 = (int)(dy_hash_string(*(void *)(v9 + 32 * v7), v10) % v3);
      while (1)
      {
        apr_size_t v13 = &v5[12 * v12];
        if (*(_DWORD *)v13 == -1) {
          break;
        }
        if (v3 <= ++v12)
        {
          uint64_t v14 = 0;
          apr_size_t v13 = v5 - 12;
          do
          {
            int v15 = *((_DWORD *)v13 + 3);
            v13 += 12;
            ++v14;
          }
          while (v15 != -1);
          break;
        }
      }
      *(_DWORD *)apr_size_t v13 = v7;
      *((_DWORD *)v13 + 1) = v7;
      uint64_t v16 = v9 + 32 * v7;
      v29[6 * v7] = *(_DWORD *)(v16 + 8);
      int v17 = v7;
      if (*(unsigned char *)(v16 + 24)) {
        int v17 = *(_DWORD *)(v16 + 12);
      }
      long long v18 = (char *)&v29[6 * v7];
      *((_DWORD *)v18 + 1) = v17;
      *((void *)v18 + 1) = *(void *)(v16 + 16);
      *((_DWORD *)v18 + 4) = *(_DWORD *)(v16 + 24);
      *((_DWORD *)v18 + 5) = 0;
      v6[v7] = v11 + 1;
      v8 += (unsigned __int16)(v11 + 1);
      ++v7;
    }
    while (v7 < *(int *)(a1 + 12));
  }
  long long v19 = (char *)apr_palloc(p, v8);
  if (*(int *)(a1 + 12) < 1)
  {
    uint64_t v22 = 0;
  }
  else
  {
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    do
    {
      size_t v23 = (unsigned __int16)v6[v21];
      memcpy(&v19[v22], *(const void **)(*(void *)(a1 + 24) + v20), v23);
      v22 += v23;
      ++v21;
      v20 += 32;
    }
    while (v21 < *(int *)(a1 + 12));
  }
  v35.iov_base = &v30;
  v35.iov_len = 20;
  int v36 = v5;
  uint64_t v37 = 12 * v3;
  uint64_t v38 = v29;
  apr_size_t v39 = v26;
  size_t v40 = v6;
  apr_size_t v41 = v25;
  ssize_t v42 = v19;
  uint64_t v43 = v22;
  int v24 = open(a2, 514, 438);
  writev(v24, &v35, 5);
  close(v24);
  apr_pool_destroy(p);
}

__n128 GTMTLGetTextureLevelInfoForDeviceWithOptions@<Q0>(uint64_t a1@<X1>, uint64_t a2@<X5>, uint64_t a3@<X8>)
{
  MTLGetTextureLevelInfoForDeviceWithOptions();
  char v7 = a1 + 11;
  if ((unint64_t)(a1 - 501) <= 0x3E)
  {
    if (((1 << v7) & 0x2000000000100001) != 0)
    {
      *(_OWORD *)a3 = 0u;
      result.n128_u64[0] = 0;
      *(_OWORD *)(a3 + 48) = 0u;
      uint64_t v8 = 2 * a2;
      goto LABEL_7;
    }
    if (((1 << v7) & 0x4000000000800008) != 0) {
      goto LABEL_5;
    }
  }
  if (a1 == 590)
  {
LABEL_5:
    *(_OWORD *)a3 = 0u;
    result.n128_u64[0] = 0;
    *(_OWORD *)(a3 + 48) = 0u;
    uint64_t v8 = 4 * a2;
LABEL_7:
    *(void *)(a3 + 16) = 0;
    *(void *)(a3 + 24) = 0;
    *(void *)(a3 + 32) = 0;
    *(void *)(a3 + 40) = 0;
    *(void *)(a3 + 64) = 0;
    *(void *)(a3 + 72) = v8;
    *(void *)(a3 + 80) = 0;
    *(void *)(a3 + 88) = 0;
    *(void *)(a3 + 96) = 0;
    return result;
  }
  *(_OWORD *)(a3 + 64) = 0u;
  *(_OWORD *)(a3 + 80) = 0u;
  *(void *)(a3 + 96) = 0;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  __n128 result = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)(a3 + 48) = 0u;
  return result;
}

uint64_t GTMTLPixelFormatGetInfoForDevice@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  *(void *)(a2 + 48) = 0;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  uint64_t result = MTLPixelFormatGetInfoForDevice();
  char v5 = a1 + 11;
  if ((unint64_t)(a1 - 501) > 0x3E) {
    goto LABEL_4;
  }
  if (((1 << v5) & 0x2000000000100001) != 0)
  {
    uint64_t v6 = 2;
    goto LABEL_7;
  }
  if (((1 << v5) & 0x4000000000800008) == 0)
  {
LABEL_4:
    if (a1 != 590) {
      return result;
    }
  }
  uint64_t v6 = 4;
LABEL_7:
  *(void *)(a2 + 24) = v6;
  return result;
}

BOOL GTMTLPixelFormatIsRGB10A8_2P(uint64_t a1)
{
  return (a1 & 0xFFFFFFFFFFFFFFFELL) == 550;
}

char *GTNameSimilarityScore(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = [v3 length];
  if (v5 <= [v4 length]) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v4;
  }
  char v7 = (char *)[v6 length];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    while (1)
    {
      unsigned int v10 = [v3 characterAtIndex:v9];
      if (v10 != [v4 characterAtIndex:v9]) {
        break;
      }
      if (v8 == ++v9)
      {
        uint64_t v9 = v8;
        break;
      }
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

id MTLDevice_newHeap(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9 = a5;
  id v10 = a1;
  __int16 v11 = objc_opt_new();
  [v11 setSize:a2];
  [v11 setResourceOptions:a3];
  [v11 setType:a4];
  id v12 = [v10 newHeapWithDescriptor:v11];

  if (v9) {
    [v12 setLabel:v9];
  }

  return v12;
}

id MTLDevice_newBuffer(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  id v8 = a1;
  id v9 = objc_opt_new();
  [v9 setLength:a2];
  [v9 setResourceOptions:a3];
  id v10 = [v8 newBufferWithDescriptor:v9];

  if (v10) {
    [v10 setLabel:v7];
  }

  return v10;
}

id MTLDevice_newTexture(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, void *a6)
{
  id v11 = a6;
  id v12 = a1;
  apr_size_t v13 = objc_opt_new();
  [v13 setTextureType:a2];
  [v13 setPixelFormat:a3];
  [v13 setWidth:*a4];
  [v13 setHeight:a4[1]];
  [v13 setDepth:a4[2]];
  [v13 setResourceOptions:a5];
  id v14 = [v12 newTextureWithDescriptor:v13];

  [v14 setLabel:v11];

  return v14;
}

id MTLHeap_backbuffer(void *a1)
{
  id v1 = a1;
  id v2 = [v1 currentAllocatedSize];
  id v3 = [v1 resourceOptions];
  if ([v1 type])
  {
    if ([v1 type] == (char *)&def_CFBEC + 1) {
      id v4 = [v1 newBufferWithLength:v2 options:v3 offset:0];
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = [v1 newBufferWithLength:v2 options:v3];
    [v4 makeAliasable];
  }

  return v4;
}

id MTLHeap_newBuffer(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a1;
  id v8 = a4;
  if ([v7 type] == (char *)&def_CFBEC + 2) {
    goto LABEL_5;
  }
  if ([v7 type])
  {
    if ([v7 type] == (char *)&def_CFBEC + 1)
    {
      id v9 = objc_msgSend(v7, "newBufferWithLength:options:offset:", a2, objc_msgSend(v7, "resourceOptions"), a3);
      goto LABEL_7;
    }
LABEL_5:
    id v10 = 0;
    goto LABEL_9;
  }
  id v9 = objc_msgSend(v7, "newBufferWithLength:options:", a2, objc_msgSend(v7, "resourceOptions"));
LABEL_7:
  id v10 = v9;
  if (v9) {
    [v9 setLabel:v8];
  }
LABEL_9:

  return v10;
}

id MTLHeap_newTexture(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, void *a7)
{
  id v13 = a1;
  id v14 = a7;
  int v15 = objc_opt_new();
  [v15 setTextureType:a2];
  [v15 setPixelFormat:a3];
  [v15 setWidth:*a5];
  [v15 setHeight:a5[1]];
  [v15 setDepth:a5[2]];
  [v15 setUsage:a4];
  objc_msgSend(v15, "setResourceOptions:", objc_msgSend(v13, "resourceOptions"));
  if ([v13 type] == (char *)&def_CFBEC + 2) {
    goto LABEL_5;
  }
  if ([v13 type])
  {
    if ([v13 type] == (char *)&def_CFBEC + 1)
    {
      id v16 = [v13 newTextureWithDescriptor:v15 offset:a6];
      goto LABEL_7;
    }
LABEL_5:
    int v17 = 0;
    goto LABEL_9;
  }
  id v16 = [v13 newTextureWithDescriptor:v15];
LABEL_7:
  int v17 = v16;
  if (v16) {
    [v16 setLabel:v14];
  }
LABEL_9:

  return v17;
}

id MTLTexture_descriptor(void *a1)
{
  id v1 = a1;
  id v2 = objc_opt_new();
  objc_msgSend(v2, "setTextureType:", objc_msgSend(v1, "textureType"));
  objc_msgSend(v2, "setPixelFormat:", objc_msgSend(v1, "pixelFormat"));
  objc_msgSend(v2, "setWidth:", objc_msgSend(v1, "width"));
  objc_msgSend(v2, "setHeight:", objc_msgSend(v1, "height"));
  objc_msgSend(v2, "setDepth:", objc_msgSend(v1, "depth"));
  objc_msgSend(v2, "setUsage:", objc_msgSend(v1, "usage"));
  objc_msgSend(v2, "setResourceOptions:", objc_msgSend(v1, "resourceOptions"));
  objc_msgSend(v2, "setMipmapLevelCount:", objc_msgSend(v1, "mipmapLevelCount"));
  objc_msgSend(v2, "setSampleCount:", objc_msgSend(v1, "sampleCount"));
  objc_msgSend(v2, "setArrayLength:", objc_msgSend(v1, "arrayLength"));
  objc_msgSend(v2, "setFramebufferOnly:", objc_msgSend(v1, "isFramebufferOnly"));
  objc_msgSend(v2, "setAllowGPUOptimizedContents:", objc_msgSend(v1, "allowGPUOptimizedContents"));
  id v3 = [v1 compressionType];

  [v2 setCompressionType:v3];

  return v2;
}

char *__cdecl apr_cpystrn(char *dst, const char *src, apr_size_t dst_size)
{
  if (dst_size)
  {
    if (src && (id v3 = &dst[dst_size - 1], v3 > dst))
    {
      apr_size_t v4 = dst_size - 1;
      while (1)
      {
        int v5 = *(unsigned __int8 *)src;
        *dst = v5;
        if (!v5) {
          break;
        }
        ++dst;
        ++src;
        if (!--v4)
        {
          dst = v3;
          goto LABEL_8;
        }
      }
    }
    else
    {
LABEL_8:
      *dst = 0;
    }
  }
  return dst;
}

apr_status_t apr_tokenize_to_argv(const char *arg_str, char ***argv_out, apr_pool_t *token_context)
{
  while (1)
  {
    int v6 = *(unsigned __int8 *)arg_str;
    if (v6 != 9 && v6 != 32) {
      break;
    }
    ++arg_str;
  }
  if (!*arg_str)
  {
    int v7 = 1;
    goto LABEL_48;
  }
  int v7 = 1;
  id v8 = arg_str;
  do
  {
    if (v6 == 39) {
      id v9 = v8 + 1;
    }
    else {
      id v9 = v8;
    }
    if (v6 == 34) {
      ++v8;
    }
    else {
      id v8 = v9;
    }
    BOOL v10 = v6 != 34 && v6 != 39;
    BOOL v11 = v6 != 34 && v6 == 39;
    while (1)
    {
      int v12 = *(unsigned __int8 *)v8;
      if (v12 == 92)
      {
        unsigned int v15 = *((unsigned __int8 *)v8 + 1);
        BOOL v16 = v15 > 0x27;
        uint64_t v17 = (1 << v15) & 0x8500000200;
        if (!v16 && v17 != 0)
        {
          ++v8;
          goto LABEL_38;
        }
      }
      else if (!*v8)
      {
        break;
      }
      if (v10 && (v12 == 9 || v12 == 32)) {
        break;
      }
      BOOL v13 = v12 == 39 && v11;
      BOOL v14 = v12 == 34 && v6 == 34;
      if (v14 || v13) {
        break;
      }
LABEL_38:
      ++v8;
    }
    if (*v8) {
      ++v8;
    }
    while (1)
    {
      int v6 = *(unsigned __int8 *)v8;
      if (v6 != 32 && v6 != 9) {
        break;
      }
      ++v8;
    }
    ++v7;
  }
  while (*v8);
LABEL_48:
  uint64_t v20 = (char **)apr_palloc(token_context, 8 * v7);
  *argv_out = v20;
  if (v7 < 2)
  {
    uint64_t v22 = 0;
    goto LABEL_106;
  }
  uint64_t v21 = 0;
  uint64_t v22 = (v7 - 1);
  while (2)
  {
    while (1)
    {
      int v23 = *(unsigned __int8 *)arg_str;
      if (v23 != 32 && v23 != 9) {
        break;
      }
      ++arg_str;
    }
    if (v23 == 39) {
      apr_size_t v25 = arg_str + 1;
    }
    else {
      apr_size_t v25 = arg_str;
    }
    if (v23 == 34) {
      apr_size_t v26 = arg_str + 1;
    }
    else {
      apr_size_t v26 = v25;
    }
    BOOL v27 = v23 != 34 && v23 != 39;
    BOOL v28 = v23 != 34 && v23 == 39;
    off_t v29 = v26;
    while (2)
    {
      int v30 = *(unsigned __int8 *)v29;
      if (v30 == 92)
      {
        unsigned int v33 = *((unsigned __int8 *)v29 + 1);
        BOOL v16 = v33 > 0x27;
        uint64_t v34 = (1 << v33) & 0x8500000200;
        if (v16 || v34 == 0) {
          goto LABEL_71;
        }
        ++v29;
LABEL_88:
        ++v29;
        continue;
      }
      break;
    }
    if (!*v29) {
      goto LABEL_89;
    }
LABEL_71:
    if (!v27 || v30 != 9 && v30 != 32)
    {
      BOOL v31 = v30 == 39 && v28;
      BOOL v32 = v30 == 34 && v23 == 34;
      if (!v32 && !v31) {
        goto LABEL_88;
      }
    }
LABEL_89:
    arg_str = v29 + 1;
    (*argv_out)[v21] = (char *)apr_palloc(token_context, v29 + 1 - v26);
    if (v29 + 1 != v26)
    {
      int v36 = (*argv_out)[v21];
      uint64_t v37 = &v36[v29 - v26];
      if (v37 <= v36)
      {
LABEL_95:
        char *v36 = 0;
      }
      else
      {
        int64_t v38 = v29 - v26;
        while (1)
        {
          int v39 = *(unsigned __int8 *)v26;
          char *v36 = v39;
          if (!v39) {
            break;
          }
          ++v36;
          ++v26;
          if (!--v38)
          {
            int v36 = v37;
            goto LABEL_95;
          }
        }
      }
    }
    size_t v40 = (*argv_out)[v21];
    int v41 = *v40;
    if (*v40)
    {
      int v42 = 0;
      uint64_t v43 = (unsigned __int8 *)(v40 + 1);
      do
      {
        if (v42 || v41 != 92)
        {
          int v42 = 0;
          *v40++ = v41;
        }
        else
        {
          int v42 = 1;
        }
        int v44 = *v43++;
        int v41 = v44;
      }
      while (v44);
    }
    char *v40 = 0;
    if (++v21 != v22) {
      continue;
    }
    break;
  }
  uint64_t v20 = *argv_out;
LABEL_106:
  v20[v22] = 0;
  return 0;
}

const char *__cdecl apr_filepath_name_get(const char *pathname)
{
  id v2 = strrchr((char *)pathname, 47);
  if (v2) {
    return v2 + 1;
  }
  else {
    return pathname;
  }
}

char *__cdecl apr_collapse_spaces(char *dest, const char *src)
{
  __darwin_ct_rune_t v3 = *(unsigned __int8 *)src;
  if (*src)
  {
    apr_size_t v4 = src + 1;
    while ((v3 & 0x80) == 0)
    {
      if ((_DefaultRuneLocale.__runetype[v3] & 0x4000) == 0) {
        goto LABEL_5;
      }
LABEL_6:
      __darwin_ct_rune_t v5 = *(unsigned __int8 *)v4++;
      __darwin_ct_rune_t v3 = v5;
      if (!v5) {
        goto LABEL_10;
      }
    }
    if (__maskrune(v3, 0x4000uLL)) {
      goto LABEL_6;
    }
LABEL_5:
    *dest++ = v3;
    goto LABEL_6;
  }
LABEL_10:
  *dest = 0;
  return dest;
}

char *__cdecl apr_strerror(apr_status_t statcode, char *buf, apr_size_t bufsize)
{
  if (statcode <= 19999)
  {
    if ((strerror_r(statcode, buf, bufsize) & 0x80000000) == 0 || !bufsize) {
      return buf;
    }
    __darwin_ct_rune_t v5 = &buf[bufsize - 1];
    int v6 = buf;
    if (v5 > buf)
    {
      uint64_t v7 = 0;
      while (1)
      {
        buf[v7] = aAprDoesNotUnde[v7];
        if (v7 == 39) {
          return buf;
        }
        if (bufsize - 1 == ++v7) {
          goto LABEL_39;
        }
      }
    }
LABEL_89:
    *int v6 = 0;
    return buf;
  }
  if (statcode >> 6 > 0x752)
  {
    if (statcode > 0xA392F)
    {
      if (statcode > 0xAFC7F)
      {
        if (!bufsize) {
          return buf;
        }
        __darwin_ct_rune_t v5 = &buf[bufsize - 1];
        int v6 = buf;
        if (v5 <= buf) {
          goto LABEL_89;
        }
        BOOL v14 = "Unrecognized resolver error";
        if (statcode == 720004) {
          BOOL v14 = "No address for host";
        }
        if (statcode == 720001) {
          unsigned int v15 = "Unknown host";
        }
        else {
          unsigned int v15 = v14;
        }
        apr_size_t v16 = bufsize - 1;
        uint64_t v17 = buf;
        while (1)
        {
          int v18 = *(unsigned __int8 *)v15;
          char *v17 = v18;
          if (!v18) {
            break;
          }
          ++v17;
          ++v15;
          if (!--v16)
          {
LABEL_39:
            int v6 = v5;
            goto LABEL_89;
          }
        }
      }
      else
      {
        BOOL v10 = gai_strerror(statcode - 670000);
        if (!bufsize) {
          return buf;
        }
        int v6 = buf;
        if (!v10) {
          goto LABEL_89;
        }
        __darwin_ct_rune_t v5 = &buf[bufsize - 1];
        int v6 = buf;
        if (v5 <= buf) {
          goto LABEL_89;
        }
        apr_size_t v11 = bufsize - 1;
        int v12 = buf;
        while (1)
        {
          int v13 = *(unsigned __int8 *)v10;
          *int v12 = v13;
          if (!v13) {
            break;
          }
          ++v12;
          ++v10;
          if (!--v11) {
            goto LABEL_39;
          }
        }
      }
    }
    else
    {
      if (!bufsize) {
        return buf;
      }
      __darwin_ct_rune_t v5 = &buf[bufsize - 1];
      int v6 = buf;
      if (v5 <= buf) {
        goto LABEL_89;
      }
      uint64_t v9 = 0;
      while (1)
      {
        buf[v9] = aAprDoesNotUnde[v9];
        if (v9 == 39) {
          break;
        }
        if (bufsize - 1 == ++v9) {
          goto LABEL_39;
        }
      }
    }
  }
  else
  {
    id v8 = "Could not perform a stat on the file.";
    switch(statcode)
    {
      case 20001:
        break;
      case 20002:
        id v8 = "A new pool could not be created.";
        break;
      case 20003:
      case 20018:
LABEL_70:
        id v8 = "Error string not specified yet";
        break;
      case 20004:
        id v8 = "An invalid date has been provided";
        break;
      case 20005:
        id v8 = "An invalid socket was returned";
        break;
      case 20006:
        id v8 = "No process was provided and one was required.";
        break;
      case 20007:
        id v8 = "No time was provided and one was required.";
        break;
      case 20008:
        id v8 = "No directory was provided and one was required.";
        break;
      case 20009:
        id v8 = "No lock was provided and one was required.";
        break;
      case 20010:
        id v8 = "No poll structure was provided and one was required.";
        break;
      case 20011:
        id v8 = "No socket was provided and one was required.";
        break;
      case 20012:
        id v8 = "No thread was provided and one was required.";
        break;
      case 20013:
        id v8 = "No thread key structure was provided and one was required.";
        break;
      case 20014:
        id v8 = "Internal error (specific information not available)";
        break;
      case 20015:
        id v8 = "No shared memory is currently available";
        break;
      case 20016:
        id v8 = "The specified IP address is invalid.";
        break;
      case 20017:
        id v8 = "The specified network mask is invalid.";
        break;
      case 20019:
        id v8 = "DSO load failed";
        break;
      case 20020:
        id v8 = "The given path is absolute";
        break;
      case 20021:
        id v8 = "The given path is relative";
        break;
      case 20022:
        id v8 = "The given path is incomplete";
        break;
      case 20023:
        id v8 = "The given path was above the root path";
        break;
      case 20024:
        id v8 = "The given path is misformatted or contained invalid characters";
        break;
      case 20025:
        id v8 = "The given path contained wildcard characters";
        break;
      case 20026:
        id v8 = "Could not find the requested symbol.";
        break;
      case 20027:
        id v8 = "The process is not recognized.";
        break;
      case 20028:
        id v8 = "Not enough entropy to continue.";
        break;
      default:
        switch(statcode)
        {
          case 70001:
            id v8 = "Your code just forked, and you are currently executing in the child process";
            break;
          case 70002:
            id v8 = "Your code just forked, and you are currently executing in the parent process";
            break;
          case 70003:
            id v8 = "The specified thread is detached";
            break;
          case 70004:
            id v8 = "The specified thread is not detached";
            break;
          case 70005:
            id v8 = "The specified child process is done executing";
            break;
          case 70006:
            id v8 = "The specified child process is not done executing";
            break;
          case 70007:
            id v8 = "The timeout specified has expired";
            break;
          case 70008:
            id v8 = "Partial results are valid but processing is incomplete";
            break;
          case 70012:
            id v8 = "Bad character specified on command line";
            break;
          case 70013:
            id v8 = "Missing parameter for the specified command line option";
            break;
          case 70014:
            id v8 = "End of file found";
            break;
          case 70015:
            id v8 = "Could not find specified socket in poll list.";
            break;
          case 70019:
            id v8 = "Shared memory is implemented anonymously";
            break;
          case 70020:
            id v8 = "Shared memory is implemented using files";
            break;
          case 70021:
            id v8 = "Shared memory is implemented using a key system";
            break;
          case 70022:
            id v8 = "There is no error, this value signifies an initialized error code";
            break;
          case 70023:
            id v8 = "This function has not been implemented on this platform";
            break;
          case 70024:
            id v8 = "passwords do not match";
            break;
          case 70025:
            id v8 = "The given lock was busy.";
            break;
          default:
            goto LABEL_70;
        }
        break;
    }
    if (!bufsize) {
      return buf;
    }
    int v6 = buf;
    if (&buf[bufsize - 1] <= buf) {
      goto LABEL_89;
    }
    apr_size_t v19 = bufsize - 1;
    uint64_t v20 = buf;
    while (1)
    {
      int v21 = *(unsigned __int8 *)v8;
      *uint64_t v20 = v21;
      if (!v21) {
        break;
      }
      ++v20;
      ++v8;
      if (!--v19)
      {
        int v6 = &buf[bufsize - 1];
        goto LABEL_89;
      }
    }
  }
  return buf;
}

apr_hash_t *__cdecl apr_hash_make(apr_pool_t *pool)
{
  v6.__darwin_time_t tv_sec = 0;
  *(void *)&v6.tv_usec = 0;
  gettimeofday(&v6, 0);
  v6.__darwin_time_t tv_sec = v6.tv_usec + 1000000 * v6.tv_sec;
  __darwin_time_t tv_sec = v6.tv_sec;
  __darwin_ct_rune_t v3 = apr_palloc(pool, 0x50uLL);
  void *v3 = pool;
  v3[9] = 0;
  v3[6] = 0xF00000000;
  *((_DWORD *)v3 + 14) = (&v6 ^ pool ^ v3 ^ tv_sec ^ HIDWORD(tv_sec)) - 1;
  apr_size_t v4 = apr_palloc(pool, 0x80uLL);
  if (v4)
  {
    v4[6] = 0u;
    v4[7] = 0u;
    v4[4] = 0u;
    v4[5] = 0u;
    v4[2] = 0u;
    v4[3] = 0u;
    _OWORD *v4 = 0u;
    v4[1] = 0u;
  }
  v3[1] = v4;
  v3[8] = 0;
  return (apr_hash_t *)v3;
}

apr_hash_t *__cdecl apr_hash_make_custom(apr_pool_t *pool, apr_hashfunc_t hash_func)
{
  uint64_t result = apr_hash_make(pool);
  *((void *)result + 8) = hash_func;
  return result;
}

apr_hash_index_t *__cdecl apr_hash_next(apr_hash_index_t *hi)
{
  id v1 = (void *)*((void *)hi + 2);
  *((void *)hi + 1) = v1;
  if (v1)
  {
LABEL_5:
    *((void *)hi + 2) = *v1;
  }
  else
  {
    uint64_t v2 = *(void *)hi;
    unsigned int v3 = *(_DWORD *)(*(void *)hi + 52);
    unsigned int v4 = *((_DWORD *)hi + 6);
    while (v4 <= v3)
    {
      id v1 = *(void **)(*(void *)(v2 + 8) + 8 * v4++);
      *((_DWORD *)hi + 6) = v4;
      *((void *)hi + 1) = v1;
      if (v1) {
        goto LABEL_5;
      }
    }
    return 0;
  }
  return hi;
}

apr_hash_index_t *__cdecl apr_hash_first(apr_pool_t *p, apr_hash_t *ht)
{
  if (p) {
    unsigned int v3 = (char *)apr_palloc(p, 0x20uLL);
  }
  else {
    unsigned int v3 = (char *)ht + 16;
  }
  *((void *)v3 + 1) = 0;
  *((void *)v3 + 2) = 0;
  *(void *)unsigned int v3 = ht;
  *((_DWORD *)v3 + 6) = 0;

  return apr_hash_next((apr_hash_index_t *)v3);
}

void apr_hash_this(apr_hash_index_t *hi, const void **key, apr_ssize_t *klen, void **val)
{
  if (key) {
    *key = *(const void **)(*((void *)hi + 1) + 16);
  }
  if (klen) {
    *klen = *(void *)(*((void *)hi + 1) + 24);
  }
  if (val) {
    *val = *(void **)(*((void *)hi + 1) + 32);
  }
}

const void *__cdecl apr_hash_this_key(apr_hash_index_t *hi)
{
  return *(const void **)(*((void *)hi + 1) + 16);
}

apr_ssize_t apr_hash_this_key_len(apr_hash_index_t *hi)
{
  return *(void *)(*((void *)hi + 1) + 24);
}

void *__cdecl apr_hash_this_val(apr_hash_index_t *hi)
{
  return *(void **)(*((void *)hi + 1) + 32);
}

unsigned int apr_hashfunc_default(const char *key, apr_ssize_t *klen)
{
  return hashfunc_default(key, klen, 0);
}

uint64_t hashfunc_default(unsigned char *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = *a2;
  if (*a2 == -1)
  {
    int v5 = *a1;
    if (*a1)
    {
      timeval v6 = a1;
      do
      {
        a3 = (33 * a3 + v5);
        int v7 = *++v6;
        int v5 = v7;
      }
      while (v7);
    }
    else
    {
      timeval v6 = a1;
    }
    *a2 = v6 - a1;
  }
  else
  {
    for (; v3; --v3)
    {
      int v4 = *a1++;
      a3 = (33 * a3 + v4);
    }
  }
  return a3;
}

apr_hash_t *__cdecl apr_hash_copy(apr_pool_t *pool, const apr_hash_t *h)
{
  uint64_t result = (apr_hash_t *)apr_palloc(pool, 40 * *((unsigned int *)h + 12) + 8 * (*((_DWORD *)h + 13) + 1) + 80);
  uint64_t v5 = 0;
  timeval v6 = 0;
  *((_DWORD *)result + 12) = *((_DWORD *)h + 12);
  uint64_t v7 = *(void *)((char *)h + 52);
  *(void *)((char *)result + 52) = v7;
  *((void *)result + 8) = *((void *)h + 8);
  *((void *)result + 9) = 0;
  *(void *)uint64_t result = pool;
  *((void *)result + 1) = (char *)result + 80;
  id v8 = (char *)result + 8 * (*((_DWORD *)h + 13) + 1) + 80;
  if ((v7 + 1) > 1) {
    uint64_t v9 = (v7 + 1);
  }
  else {
    uint64_t v9 = 1;
  }
  do
  {
    BOOL v10 = (char **)(*((void *)result + 1) + 8 * v5);
    apr_size_t v11 = *(uint64_t **)(*((void *)h + 1) + 8 * v5);
    if (v11)
    {
      do
      {
        int v12 = (char **)(v6 + 1);
        int v13 = &v8[40 * v6];
        *BOOL v10 = v13;
        *((_DWORD *)v13 + 2) = *((_DWORD *)v11 + 2);
        BOOL v14 = (char *)v11[3];
        *((void *)v13 + 2) = v11[2];
        timeval v6 = (char **)*v10;
        unsigned int v15 = (char *)v11[4];
        v6[3] = v14;
        v6[4] = v15;
        BOOL v10 = (char **)*v10;
        apr_size_t v11 = (uint64_t *)*v11;
        LODWORD(v6) = v12;
      }
      while (v11);
    }
    else
    {
      int v12 = v6;
    }
    *BOOL v10 = 0;
    ++v5;
    timeval v6 = v12;
  }
  while (v5 != v9);
  return result;
}

void *__cdecl apr_hash_get(apr_hash_t *ht, const void *key, apr_ssize_t klen)
{
  entry = find_entry((uint64_t)ht, key, klen, 0);
  if (*entry) {
    return *(void **)(*entry + 32);
  }
  else {
    return 0;
  }
}

void *find_entry(uint64_t a1, unsigned char *a2, size_t a3, uint64_t a4)
{
  size_t __n = a3;
  uint64_t v7 = *(uint64_t (**)(unsigned char *, size_t *))(a1 + 64);
  if (v7) {
    unsigned int v8 = v7(a2, &__n);
  }
  else {
    unsigned int v8 = hashfunc_default(a2, (uint64_t *)&__n, *(unsigned int *)(a1 + 56));
  }
  unsigned int v9 = v8;
  BOOL v10 = (void *)(*(void *)(a1 + 8) + 8 * (*(_DWORD *)(a1 + 52) & v8));
  uint64_t v11 = *v10;
  if (*v10)
  {
    size_t v12 = __n;
    while (1)
    {
      int v13 = v10;
      BOOL v10 = (void *)v11;
      if (*(_DWORD *)(v11 + 8) == v9 && *(void *)(v11 + 24) == v12 && !memcmp(*(const void **)(v11 + 16), a2, v12)) {
        break;
      }
      uint64_t v11 = *v10;
      if (!*v10) {
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    if (a4)
    {
      BOOL v14 = *(_DWORD **)(a1 + 72);
      if (v14) {
        *(void *)(a1 + 72) = *(void *)v14;
      }
      else {
        BOOL v14 = apr_palloc(*(apr_pool_t **)a1, 0x28uLL);
      }
      *(void *)BOOL v14 = 0;
      _DWORD v14[2] = v9;
      size_t v15 = __n;
      *((void *)v14 + 2) = a2;
      *((void *)v14 + 3) = v15;
      *((void *)v14 + 4) = a4;
      *BOOL v10 = v14;
      ++*(_DWORD *)(a1 + 48);
    }
    return v10;
  }
  return v13;
}

void apr_hash_set(apr_hash_t *ht, const void *key, apr_ssize_t klen, const void *val)
{
  entry = find_entry((uint64_t)ht, key, klen, (uint64_t)val);
  uint64_t v7 = (void *)*entry;
  if (*entry)
  {
    if (val)
    {
      void v7[4] = val;
      unsigned int v8 = *((_DWORD *)ht + 13);
      if (*((_DWORD *)ht + 12) > v8)
      {
        int v9 = (2 * v8) | 1;
        apr_size_t v10 = 8 * (2 * v8 + 2);
        uint64_t v11 = apr_palloc(*(apr_pool_t **)ht, v10);
        size_t v12 = v11;
        if (v11) {
          bzero(v11, v10);
        }
        int v13 = (apr_hash_t *)((char *)ht + 16);
        *((void *)ht + 3) = 0;
        *((void *)ht + 4) = 0;
        *((void *)ht + 2) = ht;
        *((_DWORD *)ht + 10) = 0;
        while (1)
        {
          int v13 = apr_hash_next(v13);
          if (!v13) {
            break;
          }
          uint64_t v14 = *((void *)v13 + 1);
          unsigned int v15 = *(_DWORD *)(v14 + 8) & v9;
          *(void *)uint64_t v14 = v12[v15];
          v12[v15] = v14;
        }
        *((void *)ht + 1) = v12;
        *((_DWORD *)ht + 13) = v9;
      }
    }
    else
    {
      void *entry = *v7;
      *uint64_t v7 = *((void *)ht + 9);
      *((void *)ht + 9) = v7;
      --*((_DWORD *)ht + 12);
    }
  }
}

unsigned int apr_hash_count(apr_hash_t *ht)
{
  return *((_DWORD *)ht + 12);
}

void apr_hash_clear(apr_hash_t *ht)
{
  *((void *)ht + 4) = 0;
  *((void *)ht + 2) = ht;
  *((void *)ht + 3) = 0;
  *((_DWORD *)ht + 10) = 0;
  uint64_t v2 = apr_hash_next((apr_hash_t *)((char *)ht + 16));
  if (v2)
  {
    uint64_t v3 = v2;
    do
    {
      apr_hash_set(ht, *(const void **)(*((void *)v3 + 1) + 16), *(void *)(*((void *)v3 + 1) + 24), 0);
      uint64_t v3 = apr_hash_next(v3);
    }
    while (v3);
  }
}

apr_hash_t *__cdecl apr_hash_overlay(apr_pool_t *p, const apr_hash_t *overlay, const apr_hash_t *base)
{
  return apr_hash_merge(p, overlay, base, 0, 0);
}

apr_hash_t *__cdecl apr_hash_merge(apr_pool_t *p, const apr_hash_t *h1, const apr_hash_t *h2, void *(__cdecl *merger)(apr_pool_t *, const void *, apr_ssize_t, const void *, const void *, const void *), const void *data)
{
  unsigned int v8 = apr_palloc(p, 0x50uLL);
  int v9 = v8;
  *unsigned int v8 = p;
  v8[8] = *((void *)h2 + 8);
  v8[9] = 0;
  unsigned int v10 = *((_DWORD *)h2 + 13);
  *((_DWORD *)v8 + 12) = *((_DWORD *)h2 + 12);
  int v12 = *((_DWORD *)h1 + 12);
  unsigned int v11 = *((_DWORD *)h1 + 13);
  if (v11 <= v10) {
    unsigned int v11 = v10;
  }
  *((_DWORD *)v8 + 13) = v11;
  if (v12 + *((_DWORD *)h2 + 12) > v11)
  {
    unsigned int v11 = (2 * v11) | 1;
    *((_DWORD *)v8 + 13) = v11;
  }
  *((_DWORD *)v8 + 14) = *((_DWORD *)h2 + 14);
  apr_size_t v13 = 8 * (v11 + 1);
  uint64_t v14 = apr_palloc(p, v13);
  unsigned int v15 = v14;
  if (v14) {
    bzero(v14, v13);
  }
  v9[1] = v15;
  unsigned int v16 = *((_DWORD *)h1 + 12) + *((_DWORD *)h2 + 12);
  if (v16) {
    uint64_t v17 = (char *)apr_palloc(p, 40 * v16);
  }
  else {
    uint64_t v17 = 0;
  }
  uint64_t v18 = 0;
  int v19 = 0;
  int v20 = *((_DWORD *)h2 + 13);
  if ((v20 + 1) > 1) {
    uint64_t v21 = (v20 + 1);
  }
  else {
    uint64_t v21 = 1;
  }
  do
  {
    uint64_t v22 = *(uint64_t **)(*((void *)h2 + 1) + 8 * v18);
    if (v22)
    {
      int v23 = *((_DWORD *)v9 + 13);
      do
      {
        unsigned int v24 = *((_DWORD *)v22 + 2);
        apr_size_t v25 = &v17[40 * v19];
        *((_OWORD *)v25 + 1) = *((_OWORD *)v22 + 1);
        *((void *)v25 + 4) = v22[4];
        uint64_t v26 = v9[1];
        uint64_t v27 = *(void *)(v26 + 8 * (v23 & v24));
        *((_DWORD *)v25 + 2) = v24;
        *(void *)apr_size_t v25 = v27;
        *(void *)(v26 + 8 * (v23 & v24)) = v25;
        ++v19;
        uint64_t v22 = (uint64_t *)*v22;
      }
      while (v22);
    }
    ++v18;
  }
  while (v18 != v21);
  int v44 = p;
  unsigned int v28 = 0;
  int v42 = h1;
  do
  {
    unsigned int v43 = v28;
    for (uint64_t i = *(void **)(*((void *)h1 + 1) + 8 * v28); i; uint64_t i = (void *)*i)
    {
      int v30 = (uint64_t (*)(unsigned char *, void *))v9[8];
      BOOL v31 = (unsigned char *)i[2];
      if (v30) {
        unsigned int v32 = v30(v31, i + 3);
      }
      else {
        unsigned int v32 = hashfunc_default(v31, i + 3, *((unsigned int *)v9 + 14));
      }
      unsigned int v33 = v32;
      uint64_t v34 = *((_DWORD *)v9 + 13) & v32;
      uint64_t v35 = v9[1];
      int v36 = *(uint64_t ***)(v35 + 8 * v34);
      size_t v37 = i[3];
      if (v36)
      {
        while (1)
        {
          if (v36[3] == (uint64_t *)v37)
          {
            int64_t v38 = (const void *)i[2];
            if (!memcmp(v36[2], v38, v37)) {
              break;
            }
          }
          int v36 = (uint64_t **)*v36;
          if (!v36) {
            goto LABEL_26;
          }
        }
        size_t v40 = (uint64_t *)i[4];
        if (merger) {
          v36[4] = (uint64_t *)((uint64_t (*)(apr_pool_t *, const void *, size_t, uint64_t *, uint64_t *, const void *))merger)(v44, v38, v37, v40, v36[4], data);
        }
        else {
          v36[4] = v40;
        }
      }
      else
      {
LABEL_26:
        int v39 = &v17[40 * v19];
        *((void *)v39 + 2) = i[2];
        *((void *)v39 + 3) = v37;
        *((void *)v39 + 4) = i[4];
        *((_DWORD *)v39 + 2) = v33;
        *(void *)int v39 = *(void *)(v35 + 8 * v34);
        *(void *)(v35 + 8 * v34) = v39;
        ++*((_DWORD *)v9 + 12);
        ++v19;
      }
    }
    unsigned int v28 = v43 + 1;
    h1 = v42;
  }
  while (v43 + 1 <= *((_DWORD *)v42 + 13));
  return (apr_hash_t *)v9;
}

int apr_hash_do(apr_hash_do_callback_fn_t *comp, void *rec, const apr_hash_t *ht)
{
  unsigned int v5 = 0;
  uint64_t v12 = 0;
  v11[0] = ht;
  unsigned int v6 = *((_DWORD *)ht + 13);
  uint64_t v7 = *((void *)ht + 1);
  while (1)
  {
    unsigned int v8 = *(void **)(v7 + 8 * v5++);
    v11[1] = v8;
    if (v8) {
      break;
    }
    if (v5 > v6) {
      return 1;
    }
  }
  LODWORD(v12) = v5;
  v11[2] = *v8;
  int v9 = (apr_hash_index_t *)v11;
  while (1)
  {
    int result = ((uint64_t (*)(void *, void, void, void))comp)(rec, *(void *)(*((void *)v9 + 1) + 16), *(void *)(*((void *)v9 + 1) + 24), *(void *)(*((void *)v9 + 1) + 32));
    if (!result) {
      break;
    }
    int v9 = apr_hash_next(v9);
    if (!v9) {
      return 1;
    }
  }
  return result;
}

apr_pool_t *__cdecl apr_hash_pool_get(const apr_hash_t *thehash)
{
  return *(apr_pool_t **)thehash;
}

uint64_t GTCoreAllocatorInit(uint64_t result)
{
  hideMemory = result & 1;
  return result;
}

uint64_t GTCoreAllocatorIsHiddingMemory()
{
  return hideMemory;
}

vm_address_t GTCoreAlloc(uint64_t a1, memory_object_size_t a2)
{
  kern_return_t v12;
  FILE *v14;
  void block[4];
  kern_return_t v16;
  memory_object_size_t size;
  mach_port_t object_handle;
  vm_address_t address;
  uint8_t buf[4];
  mach_error_t v21;
  __int16 v22;
  char *v23;

  address = 0;
  object_handle = 0;
  size = a2;
  mach_error_t memory_entry_64 = mach_make_memory_entry_64(mach_task_self_, &size, 0, 139267, &object_handle, 0);
  if (memory_entry_64)
  {
    mach_error_t v4 = memory_entry_64;
    if (!s_logUsingOsLog)
    {
      unsigned int v11 = __stderrp;
      mach_error_string(memory_entry_64);
      fprintf(v11, "warning: failed to create memory entry error 0x%x (%s)\n");
      return 0;
    }
    unsigned int v5 = gt_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      unsigned int v6 = mach_error_string(v4);
      *(_DWORD *)buf = 67109378;
      uint64_t v21 = v4;
      uint64_t v22 = 2080;
      int v23 = v6;
      uint64_t v7 = "warning: failed to create memory entry error 0x%x (%s)";
LABEL_9:
      _os_log_error_impl(&def_CFBEC, v5, OS_LOG_TYPE_ERROR, v7, buf, 0x12u);
      return 0;
    }
    return 0;
  }
  mach_error_t v8 = vm_map(mach_task_self_, &address, a2, 0, 1, object_handle, 0, 0, 3, 3, 1u);
  if (v8)
  {
    mach_error_t v9 = v8;
    if (!s_logUsingOsLog)
    {
      uint64_t v14 = __stderrp;
      mach_error_string(v8);
      fprintf(v14, "warning: failed to map memory error 0x%x (%s)\n");
      return 0;
    }
    unsigned int v5 = gt_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      unsigned int v10 = mach_error_string(v9);
      *(_DWORD *)buf = 67109378;
      uint64_t v21 = v9;
      uint64_t v22 = 2080;
      int v23 = v10;
      uint64_t v7 = "warning: failed to map memory error 0x%x (%s)";
      goto LABEL_9;
    }
    return 0;
  }
  if (hideMemory)
  {
    uint64_t v12 = mach_memory_entry_ownership(object_handle, mach_task_self_, 4, 1);
    if (v12)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 0x40000000;
      block[2] = __GTCoreAlloc_block_invoke;
      block[3] = &__block_descriptor_tmp_14387;
      unsigned int v16 = v12;
      if (GTCoreAlloc_onceToken != -1) {
        dispatch_once(&GTCoreAlloc_onceToken, block);
      }
    }
  }
  mach_port_deallocate(mach_task_self_, object_handle);
  return address;
}

void __GTCoreAlloc_block_invoke(uint64_t a1)
{
  if (s_logUsingOsLog)
  {
    uint64_t v2 = gt_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      mach_error_t v3 = *(_DWORD *)(a1 + 32);
      *(_DWORD *)buf = 67109378;
      mach_error_t v8 = v3;
      __int16 v9 = 2080;
      unsigned int v10 = mach_error_string(v3);
      _os_log_error_impl(&def_CFBEC, v2, OS_LOG_TYPE_ERROR, "warning: failed to mark memory(GRAPHICS) error 0x%x (%s)", buf, 0x12u);
    }
  }
  else
  {
    mach_error_t v4 = __stderrp;
    mach_error_t v5 = *(_DWORD *)(a1 + 32);
    unsigned int v6 = mach_error_string(v5);
    fprintf(v4, "warning: failed to mark memory(GRAPHICS) error 0x%x (%s)\n", v5, v6);
  }
}

vm_address_t *GTCoreFree(vm_address_t *result, vm_size_t size)
{
  if (result)
  {
    uint64_t v2 = result;
    int result = (vm_address_t *)vm_deallocate(mach_task_self_, *result, size);
    *uint64_t v2 = 0;
  }
  return result;
}

apr_status_t apr_atomic_init(apr_pool_t *p)
{
  if (hash_mutex) {
    return 0;
  }
  uint64_t v2 = apr_palloc(p, 0x38uLL);
  hash_mutex = (uint64_t)v2;
  mach_error_t v3 = (void *)*((void *)p + 5);
  if (v3) {
    *((void *)p + 5) = *v3;
  }
  else {
    mach_error_t v3 = apr_palloc(p, 0x20uLL);
  }
  uint64_t v4 = 0;
  v3[1] = v2;
  v3[2] = atomic_cleanup;
  v3[3] = apr_pool_cleanup_null;
  void *v3 = *((void *)p + 4);
  *((void *)p + 4) = v3;
  while (1)
  {
    apr_status_t result = apr_thread_mutex_create((apr_thread_mutex_t **)(hash_mutex + v4), 0, p);
    if (result) {
      break;
    }
    v4 += 8;
    if (v4 == 56) {
      return 0;
    }
  }
  return result;
}

uint64_t atomic_cleanup(uint64_t a1)
{
  if (hash_mutex == a1) {
    hash_mutex = 0;
  }
  return 0;
}

apr_uint32_t apr_atomic_read32(apr_uint32_t *mem)
{
  return *mem;
}

void apr_atomic_set32(apr_uint32_t *mem, apr_uint32_t val)
{
  uint64_t v4 = (pthread_mutex_t *)(*(void *)(hash_mutex
                                     + 8 * (-7 * ((unint64_t)mem / 0x1C) + ((unint64_t)mem >> 2)))
                         + 8);
  if (pthread_mutex_lock(v4) || (*mem = val, pthread_mutex_unlock(v4))) {
    abort();
  }
}

apr_uint32_t apr_atomic_add32(apr_uint32_t *mem, apr_uint32_t val)
{
  uint64_t v4 = (pthread_mutex_t *)(*(void *)(hash_mutex
                                     + 8 * (-7 * ((unint64_t)mem / 0x1C) + ((unint64_t)mem >> 2)))
                         + 8);
  if (pthread_mutex_lock(v4) || (apr_uint32_t v5 = *mem, *mem += val, pthread_mutex_unlock(v4))) {
    abort();
  }
  return v5;
}

void apr_atomic_sub32(apr_uint32_t *mem, apr_uint32_t val)
{
  uint64_t v4 = (pthread_mutex_t *)(*(void *)(hash_mutex
                                     + 8 * (-7 * ((unint64_t)mem / 0x1C) + ((unint64_t)mem >> 2)))
                         + 8);
  if (pthread_mutex_lock(v4) || (*mem -= val, pthread_mutex_unlock(v4))) {
    abort();
  }
}

apr_uint32_t apr_atomic_inc32(apr_uint32_t *mem)
{
  return apr_atomic_add32(mem, 1u);
}

int apr_atomic_dec32(apr_uint32_t *mem)
{
  uint64_t v2 = (pthread_mutex_t *)(*(void *)(hash_mutex
                                     + 8 * (-7 * ((unint64_t)mem / 0x1C) + ((unint64_t)mem >> 2)))
                         + 8);
  if (pthread_mutex_lock(v2) || (--*mem, apr_uint32_t v3 = *mem, pthread_mutex_unlock(v2))) {
    abort();
  }
  return v3;
}

apr_uint32_t apr_atomic_cas32(apr_uint32_t *mem, apr_uint32_t with, apr_uint32_t cmp)
{
  unsigned int v6 = (pthread_mutex_t *)(*(void *)(hash_mutex
                                     + 8 * (-7 * ((unint64_t)mem / 0x1C) + ((unint64_t)mem >> 2)))
                         + 8);
  if (pthread_mutex_lock(v6)) {
    goto LABEL_6;
  }
  apr_uint32_t v7 = *mem;
  if (*mem == cmp) {
    *mem = with;
  }
  if (pthread_mutex_unlock(v6)) {
LABEL_6:
  }
    abort();
  return v7;
}

apr_uint32_t apr_atomic_xchg32(apr_uint32_t *mem, apr_uint32_t val)
{
  uint64_t v4 = (pthread_mutex_t *)(*(void *)(hash_mutex
                                     + 8 * (-7 * ((unint64_t)mem / 0x1C) + ((unint64_t)mem >> 2)))
                         + 8);
  if (pthread_mutex_lock(v4) || (apr_uint32_t v5 = *mem, *mem = val, pthread_mutex_unlock(v4))) {
    abort();
  }
  return v5;
}

void *__cdecl apr_atomic_casptr(void **mem, void *with, const void *cmp)
{
  unsigned int v6 = (pthread_mutex_t *)(*(void *)(hash_mutex
                                     + 8 * (-7 * ((unint64_t)*mem / 0x1C) + ((unint64_t)*mem >> 2)))
                         + 8);
  if (pthread_mutex_lock(v6)) {
    goto LABEL_6;
  }
  apr_uint32_t v7 = *mem;
  if (*mem == cmp) {
    *mem = with;
  }
  if (pthread_mutex_unlock(v6)) {
LABEL_6:
  }
    abort();
  return v7;
}

void *__cdecl apr_atomic_xchgptr(void **mem, void *with)
{
  uint64_t v4 = (pthread_mutex_t *)(*(void *)(hash_mutex
                                     + 8 * (-7 * ((unint64_t)*mem / 0x1C) + ((unint64_t)*mem >> 2)))
                         + 8);
  if (pthread_mutex_lock(v4) || (apr_uint32_t v5 = *mem, *mem = with, pthread_mutex_unlock(v4))) {
    abort();
  }
  return v5;
}

void apr_pool_attribute_cleanup_destroy(apr_pool_t **a1)
{
}

void apr_pool_destroy(apr_pool_t *p)
{
  for (uint64_t i = *((void *)p + 14); i; uint64_t i = *((void *)p + 14))
  {
    *((void *)p + 14) = *(void *)i;
    (*(void (**)(void))(i + 16))(*(void *)(i + 8));
  }
  *((void *)p + 14) = 0;
  while (1)
  {
    apr_uint32_t v3 = (apr_pool_t *)*((void *)p + 1);
    if (!v3) {
      break;
    }
    apr_pool_destroy(v3);
  }
  while (1)
  {
    uint64_t v4 = *((void *)p + 4);
    if (!v4) {
      break;
    }
    *((void *)p + 4) = *(void *)v4;
    (*(void (**)(void))(v4 + 16))(*(void *)(v4 + 8));
  }
  free_proc_chain(*((void *)p + 7));
  if (*(void *)p)
  {
    uint64_t v5 = *(void *)(*(void *)(*(void *)p + 48) + 24);
    if (v5) {
      pthread_mutex_lock((pthread_mutex_t *)(v5 + 8));
    }
    uint64_t v6 = *((void *)p + 2);
    **((void **)p + 3) = v6;
    if (v6) {
      *(void *)(*((void *)p + 2) + 24) = *((void *)p + 3);
    }
    if (v5) {
      pthread_mutex_unlock((pthread_mutex_t *)(v5 + 8));
    }
  }
  apr_uint32_t v7 = (unint64_t *)*((void *)p + 6);
  vm_address_t v8 = *((void *)p + 12);
  **(void **)(v8 + 8) = 0;
  if ((apr_pool_t *)v7[4] == p)
  {
    v7[3] = 0;
  }
  else
  {
    unint64_t v9 = v7[3];
    if (v9) {
      pthread_mutex_lock((pthread_mutex_t *)(v9 + 8));
    }
  }
  vm_address_t v10 = 0;
  unint64_t v11 = *v7;
  unint64_t v12 = v7[1];
  unint64_t v13 = v7[2];
  do
  {
    while (1)
    {
      while (1)
      {
        vm_address_t v14 = v8;
        vm_address_t v8 = *(void *)v8;
        unint64_t v15 = *(unsigned int *)(v14 + 16);
        if (!v12 || v13 > v15) {
          break;
        }
        *(void *)vm_address_t v14 = v10;
        vm_address_t v10 = v14;
        if (!v8) {
          goto LABEL_38;
        }
      }
      if (v15 > 0x13) {
        break;
      }
      unsigned int v16 = (uint64_t *)&v7[v15];
      uint64_t v17 = v16[5];
      *(void *)vm_address_t v14 = v17;
      if (v11 < v15 && v17 == 0) {
        unint64_t v11 = v15;
      }
      v16[5] = v14;
      if (v13 <= v15)
      {
        unint64_t v13 = 0;
        if (!v8) {
          goto LABEL_38;
        }
      }
      else
      {
        v13 += ~v15;
        if (!v8) {
          goto LABEL_38;
        }
      }
    }
    *(void *)vm_address_t v14 = v7[5];
    v7[5] = v14;
    BOOL v19 = v13 > v15;
    v13 += ~v15;
    if (!v19) {
      unint64_t v13 = 0;
    }
  }
  while (v8);
LABEL_38:
  *apr_uint32_t v7 = v11;
  v7[2] = v13;
  unint64_t v20 = v7[3];
  if (v20) {
    pthread_mutex_unlock((pthread_mutex_t *)(v20 + 8));
  }
  if (v10)
  {
    do
    {
      vm_address_t v21 = *(void *)v10;
      vm_deallocate(mach_task_self_, v10, ((*(_DWORD *)(v10 + 16) << 12) + 4096));
      vm_address_t v10 = v21;
    }
    while (v21);
  }
  if ((apr_pool_t *)v7[4] == p)
  {
    apr_allocator_destroy((apr_allocator_t *)v7);
  }
}

uint64_t free_proc_chain(uint64_t result)
{
  if (!result) {
    return result;
  }
  uint64_t v1 = result;
  uint64_t v2 = result;
  do
  {
    apr_status_t result = apr_proc_wait(*(apr_proc_t **)v2, 0, 0, APR_NOWAIT);
    if (result != 70006) {
      *(_DWORD *)(v2 + 8) = 0;
    }
    uint64_t v2 = *(void *)(v2 + 16);
  }
  while (v2);
  uint64_t v3 = v1;
  do
  {
    int v4 = *(_DWORD *)(v3 + 8);
    if (v4 == 1)
    {
      apr_status_t result = apr_proc_kill(*(apr_proc_t **)v3, 9);
    }
    else if (v4 == 4 || v4 == 2)
    {
      apr_status_t result = apr_proc_kill(*(apr_proc_t **)v3, 15);
      if (!result) {
        LODWORD(v2) = 1;
      }
    }
    uint64_t v3 = *(void *)(v3 + 16);
  }
  while (v3);
  uint64_t v6 = v1;
  if (!v2) {
    goto LABEL_29;
  }
  long long v11 = xmmword_1DA2A0;
  apr_status_t result = select(0, 0, 0, 0, (timeval *)&v11);
  unint64_t v7 = 46875;
  while (2)
  {
    uint64_t v8 = 0;
    uint64_t v9 = v1;
    do
    {
      uint64_t v10 = v8;
      if (*(_DWORD *)(v9 + 8) == 2)
      {
        uint64_t v8 = 1;
        apr_status_t result = apr_proc_wait(*(apr_proc_t **)v9, 0, 0, APR_NOWAIT);
        if (result == 70006) {
          goto LABEL_24;
        }
        *(_DWORD *)(v9 + 8) = 0;
      }
      uint64_t v8 = v10;
LABEL_24:
      uint64_t v9 = *(void *)(v9 + 16);
    }
    while (v9);
    if (v8 && v7 <= 0x2DC6BF)
    {
      *(void *)&long long v11 = v7 / 0xF4240;
      *((void *)&v11 + 1) = v7 % 0xF4240;
      apr_status_t result = select(0, 0, 0, 0, (timeval *)&v11);
      v7 *= 2;
      continue;
    }
    break;
  }
  uint64_t v6 = v1;
  do
  {
LABEL_29:
    if (*(_DWORD *)(v6 + 8) == 2) {
      apr_status_t result = apr_proc_kill(*(apr_proc_t **)v6, 9);
    }
    uint64_t v6 = *(void *)(v6 + 16);
  }
  while (v6);
  do
  {
    if (*(_DWORD *)(v1 + 8)) {
      apr_status_t result = apr_proc_wait(*(apr_proc_t **)v1, 0, 0, APR_WAIT);
    }
    uint64_t v1 = *(void *)(v1 + 16);
  }
  while (v1);
  return result;
}

void apr_allocator_destroy(apr_allocator_t *allocator)
{
  for (uint64_t i = 0; i != 20; ++i)
  {
    uint64_t v3 = (char *)allocator + 8 * i;
    vm_address_t v6 = *((void *)v3 + 5);
    uint64_t v5 = (vm_address_t *)(v3 + 40);
    vm_address_t v4 = v6;
    if (v6)
    {
      do
      {
        vm_address_t *v5 = *(void *)v4;
        vm_deallocate(mach_task_self_, v4, ((*(_DWORD *)(v4 + 16) << 12) + 4096));
        vm_address_t v4 = *v5;
      }
      while (*v5);
    }
  }
  vm_map_t v7 = mach_task_self_;

  vm_deallocate(v7, (vm_address_t)allocator, 0xC8uLL);
}

apr_status_t apr_allocator_create(apr_allocator_t **allocator)
{
  *allocator = 0;
  vm_address_t v2 = GTCoreAlloc((uint64_t)allocator, 0xC8uLL);
  if (!v2) {
    return 12;
  }
  vm_address_t v3 = v2;
  apr_status_t result = 0;
  *(void *)(v3 + 192) = 0;
  *(_OWORD *)(v3 + 160) = 0u;
  *(_OWORD *)(v3 + 176) = 0u;
  *(_OWORD *)(v3 + 128) = 0u;
  *(_OWORD *)(v3 + 144) = 0u;
  *(_OWORD *)(v3 + 96) = 0u;
  *(_OWORD *)(v3 + 112) = 0u;
  *(_OWORD *)(v3 + 64) = 0u;
  *(_OWORD *)(v3 + 80) = 0u;
  *(_OWORD *)(v3 + 32) = 0u;
  *(_OWORD *)(v3 + 48) = 0u;
  *(_OWORD *)vm_address_t v3 = 0u;
  *(_OWORD *)(v3 + 16) = 0u;
  *allocator = (apr_allocator_t *)v3;
  return result;
}

void apr_allocator_mutex_set(apr_allocator_t *allocator, apr_thread_mutex_t *mutex)
{
  *((void *)allocator + 3) = mutex;
}

apr_thread_mutex_t *__cdecl apr_allocator_mutex_get(apr_allocator_t *allocator)
{
  return (apr_thread_mutex_t *)*((void *)allocator + 3);
}

void apr_allocator_owner_set(apr_allocator_t *allocator, apr_pool_t *pool)
{
  *((void *)allocator + 4) = pool;
}

apr_pool_t *__cdecl apr_allocator_owner_get(apr_allocator_t *allocator)
{
  return (apr_pool_t *)*((void *)allocator + 4);
}

void apr_allocator_max_free_set(apr_allocator_t *allocator, apr_size_t size)
{
  uint64_t v4 = *((void *)allocator + 3);
  if (v4) {
    pthread_mutex_lock((pthread_mutex_t *)(v4 + 8));
  }
  apr_size_t v5 = (size + 4095) >> 12;
  apr_size_t v6 = *((void *)allocator + 2) + v5 - *((void *)allocator + 1);
  *((void *)allocator + 1) = v5;
  *((void *)allocator + 2) = v6;
  if (v6 > v5) {
    *((void *)allocator + 2) = v5;
  }
  if (v4)
  {
    pthread_mutex_unlock((pthread_mutex_t *)(v4 + 8));
  }
}

unint64_t apr_allocator_align(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (a2 + 4135) & 0xFFFFFFFFFFFFF000;
  unint64_t v3 = 0x2000;
  if (v2 > 0x2000) {
    unint64_t v3 = (a2 + 4135) & 0xFFFFFFFFFFFFF000;
  }
  if (v2 >= a2) {
    return v3;
  }
  else {
    return 0;
  }
}

vm_address_t allocator_alloc(uint64_t a1, unint64_t a2)
{
  vm_address_t v2 = 0;
  unint64_t v3 = (a2 + 4135) & 0xFFFFFFFFFFFFF000;
  unint64_t v4 = 0x2000;
  if (v3 > 0x2000) {
    unint64_t v4 = (a2 + 4135) & 0xFFFFFFFFFFFFF000;
  }
  if (v3 >= a2) {
    memory_object_size_t v5 = v4;
  }
  else {
    memory_object_size_t v5 = 0;
  }
  if (v3 >= a2)
  {
    unint64_t v6 = v4 >> 12;
    unint64_t v7 = (v4 >> 12) - 1;
    if (HIDWORD(v7)) {
      return 0;
    }
    uint64_t v8 = (unint64_t *)a1;
    unint64_t v9 = *(void *)a1;
    if (v7 <= *(void *)a1)
    {
      uint64_t v14 = *(void *)(a1 + 24);
      if (v14)
      {
        a1 = pthread_mutex_lock((pthread_mutex_t *)(v14 + 8));
        unint64_t v9 = *v8;
      }
      unint64_t v15 = &v8[v7];
      vm_address_t v17 = v15[5];
      unsigned int v16 = v15 + 5;
      vm_address_t v2 = v17;
      BOOL v18 = v17 == 0;
      BOOL v19 = v7 < v9;
      if (v17) {
        BOOL v20 = 1;
      }
      else {
        BOOL v20 = v7 >= v9;
      }
      if (!v20)
      {
        do
        {
          vm_address_t v21 = v16[1];
          ++v16;
          vm_address_t v2 = v21;
          BOOL v18 = v21 == 0;
          BOOL v19 = v6 < v9;
          if (v21) {
            BOOL v22 = 1;
          }
          else {
            BOOL v22 = v6 >= v9;
          }
          ++v6;
        }
        while (!v22);
      }
      if (!v18)
      {
        vm_address_t v25 = *(void *)v2;
        *unsigned int v16 = *(void *)v2;
        if (v25) {
          BOOL v19 = 1;
        }
        if (!v19)
        {
          uint64_t v26 = v16 - 1;
          do
          {
            if (*v26--) {
              BOOL v28 = 1;
            }
            else {
              BOOL v28 = v9 == 1;
            }
            --v9;
          }
          while (!v28);
          *uint64_t v8 = v9;
        }
        uint64_t v13 = (*(_DWORD *)(v2 + 16) + 1);
LABEL_43:
        unint64_t v29 = v8[2] + v13;
        if (v29 >= v8[1]) {
          unint64_t v29 = v8[1];
        }
        v8[2] = v29;
        unint64_t v30 = v8[3];
        if (v30) {
          pthread_mutex_unlock((pthread_mutex_t *)(v30 + 8));
        }
        goto LABEL_47;
      }
    }
    else
    {
      vm_address_t v2 = a1 + 40;
      if (!*(void *)(a1 + 40))
      {
LABEL_30:
        vm_address_t v24 = GTCoreAlloc(a1, v5);
        vm_address_t v2 = v24;
        if (!v24) {
          return v2;
        }
        *(_DWORD *)(v24 + 16) = v7;
        *(void *)(v24 + 32) = v24 + v5;
LABEL_47:
        *(void *)vm_address_t v2 = 0;
        *(void *)(v2 + 24) = v2 + 40;
        return v2;
      }
      uint64_t v10 = *(void *)(a1 + 24);
      if (v10) {
        a1 = pthread_mutex_lock((pthread_mutex_t *)(v10 + 8));
      }
      while (1)
      {
        long long v11 = (void *)v2;
        vm_address_t v2 = *(void *)v2;
        if (!v2) {
          break;
        }
        unint64_t v12 = *(unsigned int *)(v2 + 16);
        if (v7 <= v12)
        {
          *long long v11 = *(void *)v2;
          uint64_t v13 = (v12 + 1);
          goto LABEL_43;
        }
      }
    }
    unint64_t v23 = v8[3];
    if (v23) {
      a1 = pthread_mutex_unlock((pthread_mutex_t *)(v23 + 8));
    }
    goto LABEL_30;
  }
  return v2;
}

void apr_allocator_free(apr_allocator_t *allocator, apr_memnode_t *memnode)
{
  uint64_t v4 = *((void *)allocator + 3);
  if (v4) {
    pthread_mutex_lock((pthread_mutex_t *)(v4 + 8));
  }
  vm_address_t v5 = 0;
  unint64_t v6 = *(void *)allocator;
  uint64_t v7 = *((void *)allocator + 1);
  unint64_t v8 = *((void *)allocator + 2);
  do
  {
    while (1)
    {
      while (1)
      {
        unint64_t v9 = memnode;
        memnode = memnode->next;
        unint64_t index = v9->index;
        if (!v7 || v8 > index) {
          break;
        }
        v9->next = (apr_memnode_t *)v5;
        vm_address_t v5 = (vm_address_t)v9;
        if (!memnode) {
          goto LABEL_22;
        }
      }
      if (index > 0x13) {
        break;
      }
      long long v11 = (char *)allocator + 8 * index;
      unint64_t v12 = (apr_memnode_t *)*((void *)v11 + 5);
      v9->next = v12;
      if (v6 < index && v12 == 0) {
        unint64_t v6 = index;
      }
      *((void *)v11 + 5) = v9;
      if (v8 <= index)
      {
        unint64_t v8 = 0;
        if (!memnode) {
          goto LABEL_22;
        }
      }
      else
      {
        v8 += ~index;
        if (!memnode) {
          goto LABEL_22;
        }
      }
    }
    v9->next = (apr_memnode_t *)*((void *)allocator + 5);
    *((void *)allocator + 5) = v9;
    BOOL v14 = v8 > index;
    v8 += ~index;
    if (!v14) {
      unint64_t v8 = 0;
    }
  }
  while (memnode);
LABEL_22:
  *(void *)allocator = v6;
  *((void *)allocator + 2) = v8;
  uint64_t v15 = *((void *)allocator + 3);
  if (v15) {
    pthread_mutex_unlock((pthread_mutex_t *)(v15 + 8));
  }
  if (v5)
  {
    do
    {
      vm_address_t v16 = *(void *)v5;
      vm_deallocate(mach_task_self_, v5, ((*(_DWORD *)(v5 + 16) << 12) + 4096));
      vm_address_t v5 = v16;
    }
    while (v16);
  }
}

apr_status_t apr_pool_initialize(void)
{
  if (apr_pools_shared_initialized) {
    return 0;
  }
  if (apr_pools_initialized++) {
    return 0;
  }
  global_allocator = 0;
  vm_address_t v4 = GTCoreAlloc(v0, 0xC8uLL);
  if (v4)
  {
    *(void *)(v4 + 192) = 0;
    *(_OWORD *)(v4 + 160) = 0u;
    *(_OWORD *)(v4 + 176) = 0u;
    *(_OWORD *)(v4 + 128) = 0u;
    *(_OWORD *)(v4 + 144) = 0u;
    *(_OWORD *)(v4 + 96) = 0u;
    *(_OWORD *)(v4 + 112) = 0u;
    *(_OWORD *)(v4 + 64) = 0u;
    *(_OWORD *)(v4 + 80) = 0u;
    *(_OWORD *)(v4 + 32) = 0u;
    *(_OWORD *)(v4 + 48) = 0u;
    *(_OWORD *)vm_address_t v4 = 0u;
    *(_OWORD *)(v4 + 16) = 0u;
    global_allocator = v4;
    apr_allocator_max_free_set((apr_allocator_t *)v4, 0x8000000uLL);
    apr_status_t v5 = apr_pool_create_ex((apr_pool_t **)&global_pool, 0, 0, (apr_allocator_t *)global_allocator);
    if (v5)
    {
      apr_status_t v2 = v5;
      apr_allocator_destroy((apr_allocator_t *)global_allocator);
      global_allocator = 0;
      apr_pools_initialized = 0;
    }
    else
    {
      unint64_t v6 = (apr_pool_t *)global_pool;
      *(void *)(global_pool + 80) = "apr_global_pool";
      apr_status_t v2 = apr_atomic_init(v6);
      if (!v2)
      {
        mutex = 0;
        apr_status_t v2 = apr_thread_mutex_create(&mutex, 0, (apr_pool_t *)global_pool);
        if (!v2)
        {
          uint64_t v7 = global_allocator;
          uint64_t v8 = global_pool;
          *(void *)(global_allocator + 24) = mutex;
          *(void *)(v7 + 32) = v8;
        }
      }
    }
  }
  else
  {
    apr_pools_initialized = 0;
    return 12;
  }
  return v2;
}

apr_status_t apr_pool_create_ex(apr_pool_t **newpool, apr_pool_t *parent, apr_abortfunc_t abort_fn, apr_allocator_t *allocator)
{
  vm_address_t v4 = allocator;
  apr_abortfunc_t v5 = abort_fn;
  apr_pool_t *newpool = 0;
  if (parent) {
    uint64_t v7 = parent;
  }
  else {
    uint64_t v7 = (apr_pool_t *)global_pool;
  }
  if (!abort_fn && v7) {
    apr_abortfunc_t v5 = (apr_abortfunc_t)*((void *)v7 + 8);
  }
  if (!allocator) {
    vm_address_t v4 = (apr_allocator_t *)*((void *)v7 + 6);
  }
  uint64_t v8 = (apr_pool_t *)allocator_alloc((uint64_t)v4, 0x1FD8uLL);
  if (v8)
  {
    *(void *)uint64_t v8 = v8;
    *((void *)v8 + 1) = v8;
    unint64_t v9 = (apr_pool_t **)*((void *)v8 + 3);
    *((void *)v8 + 3) = v9 + 15;
    v9[12] = v8;
    v9[13] = (apr_pool_t *)(v9 + 15);
    v9[14] = 0;
    void v9[6] = v4;
    v9[7] = 0;
    v9[4] = 0;
    v9[5] = 0;
    v9[10] = 0;
    v9[11] = v8;
    v9[8] = (apr_pool_t *)v5;
    v9[9] = 0;
    *unint64_t v9 = v7;
    v9[1] = 0;
    if (v7)
    {
      uint64_t v10 = *(void *)(*((void *)v7 + 6) + 24);
      if (v10) {
        pthread_mutex_lock((pthread_mutex_t *)(v10 + 8));
      }
      uint64_t v13 = (apr_pool_t *)*((void *)v7 + 1);
      unint64_t v12 = (apr_pool_t ***)((char *)v7 + 8);
      long long v11 = v13;
      v9[2] = v13;
      if (v13) {
        *((void *)v11 + 3) = v9 + 2;
      }
      *unint64_t v12 = v9;
      void v9[3] = (apr_pool_t *)v12;
      if (v10) {
        pthread_mutex_unlock((pthread_mutex_t *)(v10 + 8));
      }
    }
    else
    {
      v9[2] = 0;
      void v9[3] = 0;
    }
    apr_status_t v14 = 0;
    apr_pool_t *newpool = (apr_pool_t *)v9;
  }
  else
  {
    apr_status_t v14 = 12;
    if (v5) {
      ((void (*)(uint64_t))v5)(12);
    }
  }
  return v14;
}

void apr_pool_tag(apr_pool_t *pool, const char *tag)
{
  *((void *)pool + 10) = tag;
}

uint64_t apr_pool_shared_initialize(uint64_t a1)
{
  apr_pools_initialized = 1;
  apr_pools_shared_initialized = 1;
  global_pool = a1;
  global_allocator = *(void *)(a1 + 48);
  return 0;
}

void apr_pool_terminate(void)
{
  if ((apr_pools_shared_initialized & 1) == 0 && apr_pools_initialized && !--apr_pools_initialized)
  {
    apr_pool_destroy((apr_pool_t *)global_pool);
    global_pool = 0;
    global_allocator = 0;
  }
}

void *__cdecl apr_palloc(apr_pool_t *p, apr_size_t size)
{
  apr_size_t v3 = (size + 7) & 0xFFFFFFFFFFFFFFF8;
  if (v3 < size)
  {
LABEL_2:
    vm_address_t v4 = (void (*)(uint64_t))*((void *)p + 8);
    if (v4) {
      v4(12);
    }
    return 0;
  }
  unint64_t v6 = (vm_address_t *)*((void *)p + 11);
  apr_status_t result = (void *)v6[3];
  if (v3 <= v6[4] - (unint64_t)result)
  {
    v6[3] = (vm_address_t)result + v3;
    return result;
  }
  vm_address_t v7 = *v6;
  if (v3 <= *(void *)(*v6 + 32) - *(void *)(*v6 + 24))
  {
    **(void **)(v7 + 8) = *(void *)v7;
    *(void *)(*(void *)v7 + 8) = *(void *)(v7 + 8);
  }
  else
  {
    vm_address_t v7 = allocator_alloc(*((void *)p + 6), (size + 7) & 0xFFFFFFFFFFFFFFF8);
    if (!v7) {
      goto LABEL_2;
    }
  }
  *(_DWORD *)(v7 + 20) = 0;
  apr_status_t result = *(void **)(v7 + 24);
  *(void *)(v7 + 24) = (char *)result + v3;
  uint64_t v8 = (vm_address_t *)v6[1];
  *(void *)(v7 + 8) = v8;
  *uint64_t v8 = v7;
  *(void *)vm_address_t v7 = v6;
  v6[1] = v7;
  *((void *)p + 11) = v7;
  unint64_t v9 = (uint64_t)(v6[4] - v6[3]) >> 12;
  *((_DWORD *)v6 + 5) = v9;
  if (v9 < *(unsigned int *)(*v6 + 20))
  {
    vm_address_t v10 = *v6;
    do
      vm_address_t v10 = *(void *)v10;
    while (*(_DWORD *)(v10 + 20) > v9);
    *(void *)vm_address_t v7 = *v6;
    *(void *)(*v6 + 8) = v6[1];
    long long v11 = *(vm_address_t ***)(v10 + 8);
    v6[1] = (vm_address_t)v11;
    *long long v11 = v6;
    *unint64_t v6 = v10;
    *(void *)(v10 + 8) = v6;
  }
  return result;
}

void *apr_pcalloc(apr_pool_t *a1, apr_size_t a2)
{
  apr_size_t v3 = apr_palloc(a1, a2);
  vm_address_t v4 = v3;
  if (v3) {
    bzero(v3, a2);
  }
  return v4;
}

void apr_pool_clear(apr_pool_t *p)
{
  for (uint64_t i = *((void *)p + 14); i; uint64_t i = *((void *)p + 14))
  {
    *((void *)p + 14) = *(void *)i;
    (*(void (**)(void))(i + 16))(*(void *)(i + 8));
  }
  *((void *)p + 14) = 0;
  while (1)
  {
    apr_size_t v3 = (apr_pool_t *)*((void *)p + 1);
    if (!v3) {
      break;
    }
    apr_pool_destroy(v3);
  }
  apr_abortfunc_t v5 = (uint64_t *)((char *)p + 32);
  uint64_t v4 = *((void *)p + 4);
  if (v4)
  {
    do
    {
      uint64_t *v5 = *(void *)v4;
      (*(void (**)(void))(v4 + 16))(*(void *)(v4 + 8));
      uint64_t v4 = *v5;
    }
    while (*v5);
  }
  uint64_t *v5 = 0;
  *((void *)p + 5) = 0;
  free_proc_chain(*((void *)p + 7));
  *((void *)p + 7) = 0;
  *((void *)p + 9) = 0;
  uint64_t v7 = *((void *)p + 12);
  uint64_t v6 = *((void *)p + 13);
  *((void *)p + 11) = v7;
  *(void *)(v7 + 24) = v6;
  if (*(void *)v7 != v7)
  {
    **(void **)(v7 + 8) = 0;
    uint64_t v8 = (unint64_t *)*((void *)p + 6);
    unint64_t v9 = *(vm_address_t **)v7;
    unint64_t v10 = v8[3];
    if (v10) {
      pthread_mutex_lock((pthread_mutex_t *)(v10 + 8));
    }
    vm_address_t v11 = 0;
    unint64_t v12 = *v8;
    unint64_t v13 = v8[1];
    unint64_t v14 = v8[2];
    do
    {
      while (1)
      {
        while (1)
        {
          uint64_t v15 = v9;
          unint64_t v9 = (vm_address_t *)*v9;
          unint64_t v16 = *((unsigned int *)v15 + 4);
          if (!v13 || v14 > v16) {
            break;
          }
          *uint64_t v15 = v11;
          vm_address_t v11 = (vm_address_t)v15;
          if (!v9) {
            goto LABEL_30;
          }
        }
        if (v16 > 0x13) {
          break;
        }
        vm_address_t v17 = &v8[v16];
        vm_address_t v18 = v17[5];
        *uint64_t v15 = v18;
        if (v12 < v16 && v18 == 0) {
          unint64_t v12 = v16;
        }
        v17[5] = (unint64_t)v15;
        if (v14 <= v16)
        {
          unint64_t v14 = 0;
          if (!v9) {
            goto LABEL_30;
          }
        }
        else
        {
          v14 += ~v16;
          if (!v9) {
            goto LABEL_30;
          }
        }
      }
      *uint64_t v15 = v8[5];
      v8[5] = (unint64_t)v15;
      BOOL v20 = v14 > v16;
      v14 += ~v16;
      if (!v20) {
        unint64_t v14 = 0;
      }
    }
    while (v9);
LABEL_30:
    *uint64_t v8 = v12;
    v8[2] = v14;
    unint64_t v21 = v8[3];
    if (v21) {
      pthread_mutex_unlock((pthread_mutex_t *)(v21 + 8));
    }
    if (v11)
    {
      do
      {
        vm_address_t v22 = *(void *)v11;
        vm_deallocate(mach_task_self_, v11, ((*(_DWORD *)(v11 + 16) << 12) + 4096));
        vm_address_t v11 = v22;
      }
      while (v22);
    }
    *(void *)uint64_t v7 = v7;
    *(void *)(v7 + 8) = v7;
  }
}

apr_status_t apr_pool_create_unmanaged_ex(apr_pool_t **newpool, apr_abortfunc_t abort_fn, apr_allocator_t *allocator)
{
  apr_pool_t *newpool = 0;
  if (!apr_pools_initialized) {
    return 20002;
  }
  uint64_t v6 = allocator;
  if (!allocator)
  {
    vm_address_t v7 = GTCoreAlloc((uint64_t)newpool, 0xC8uLL);
    if (!v7) {
      goto LABEL_10;
    }
    uint64_t v6 = (apr_allocator_t *)v7;
    *(void *)(v7 + 192) = 0;
    *(_OWORD *)(v7 + 160) = 0u;
    *(_OWORD *)(v7 + 176) = 0u;
    *(_OWORD *)(v7 + 128) = 0u;
    *(_OWORD *)(v7 + 144) = 0u;
    *(_OWORD *)(v7 + 96) = 0u;
    *(_OWORD *)(v7 + 112) = 0u;
    *(_OWORD *)(v7 + 64) = 0u;
    *(_OWORD *)(v7 + 80) = 0u;
    *(_OWORD *)(v7 + 32) = 0u;
    *(_OWORD *)(v7 + 48) = 0u;
    *(_OWORD *)vm_address_t v7 = 0u;
    *(_OWORD *)(v7 + 16) = 0u;
  }
  uint64_t v8 = (void *)allocator_alloc((uint64_t)v6, 0x1FD8uLL);
  if (v8)
  {
    *uint64_t v8 = v8;
    v8[1] = v8;
    uint64_t v9 = v8[3];
    v8[3] = v9 + 120;
    *(void *)(v9 + 96) = v8;
    *(void *)(v9 + 104) = v9 + 120;
    *(void *)(v9 + 112) = 0;
    *(void *)(v9 + 48) = v6;
    *(void *)(v9 + 56) = 0;
    *(_OWORD *)uint64_t v9 = 0u;
    *(_OWORD *)(v9 + 16) = 0u;
    *(_OWORD *)(v9 + 32) = 0u;
    *(void *)(v9 + 80) = 0;
    *(void *)(v9 + 88) = v8;
    *(void *)(v9 + 64) = abort_fn;
    *(void *)(v9 + 72) = 0;
    if (!allocator) {
      *((void *)v6 + 4) = v9;
    }
    apr_status_t v10 = 0;
    apr_pool_t *newpool = (apr_pool_t *)v9;
    return v10;
  }
LABEL_10:
  apr_status_t v10 = 12;
  if (abort_fn) {
    ((void (*)(uint64_t))abort_fn)(12);
  }
  return v10;
}

char *__cdecl apr_pvsprintf(apr_pool_t *p, const char *fmt, va_list ap)
{
  uint64_t v49 = 0;
  vm_address_t address = 0;
  vm_address_t v47 = *((void *)p + 11);
  CFUUIDRef v48 = p;
  uint64_t v6 = *(char **)(v47 + 32);
  v46.curpos = *(char **)(v47 + 24);
  v46.endpos = v6 - 1;
  if (v46.curpos == v6 && psprintf_flush((uint64_t)&v46) == -1
    || apr_vformatter((int (__cdecl *)(apr_vformatter_buff_t *))psprintf_flush, &v46, fmt, ap) == -1)
  {
    unint64_t v30 = (void (*)(uint64_t))*((void *)p + 8);
    if (v30) {
      v30(12);
    }
    if ((_BYTE)v49)
    {
      BOOL v31 = (vm_address_t *)v47;
      *(void *)vm_address_t v47 = address;
      unsigned int v32 = (unint64_t *)*((void *)p + 6);
      unint64_t v33 = v32[3];
      if (v33) {
        pthread_mutex_lock((pthread_mutex_t *)(v33 + 8));
      }
      vm_address_t v34 = 0;
      unint64_t v35 = *v32;
      unint64_t v36 = v32[1];
      unint64_t v37 = v32[2];
      do
      {
        while (1)
        {
          while (1)
          {
            int64_t v38 = v31;
            BOOL v31 = (vm_address_t *)*v31;
            unint64_t v39 = *((unsigned int *)v38 + 4);
            if (!v36 || v37 > v39) {
              break;
            }
            vm_address_t *v38 = v34;
            vm_address_t v34 = (vm_address_t)v38;
            if (!v31) {
              goto LABEL_59;
            }
          }
          if (v39 > 0x13) {
            break;
          }
          size_t v40 = &v32[v39];
          vm_address_t v41 = v40[5];
          vm_address_t *v38 = v41;
          if (v35 < v39 && v41 == 0) {
            unint64_t v35 = v39;
          }
          v40[5] = (unint64_t)v38;
          if (v37 <= v39)
          {
            unint64_t v37 = 0;
            if (!v31) {
              goto LABEL_59;
            }
          }
          else
          {
            v37 += ~v39;
            if (!v31) {
              goto LABEL_59;
            }
          }
        }
        vm_address_t *v38 = v32[5];
        v32[5] = (unint64_t)v38;
        BOOL v21 = v37 > v39;
        v37 += ~v39;
        if (!v21) {
          unint64_t v37 = 0;
        }
      }
      while (v31);
LABEL_59:
      unint64_t *v32 = v35;
      v32[2] = v37;
      unint64_t v43 = v32[3];
      if (v43) {
        pthread_mutex_unlock((pthread_mutex_t *)(v43 + 8));
      }
      if (v34)
      {
        do
        {
          vm_address_t v44 = *(void *)v34;
          vm_deallocate(mach_task_self_, v34, ((*(_DWORD *)(v34 + 16) << 12) + 4096));
          vm_address_t v34 = v44;
        }
        while (v44);
      }
    }
    return 0;
  }
  else
  {
    vm_address_t v7 = v46.curpos++;
    *vm_address_t v7 = 0;
    uint64_t v8 = *(char **)(v47 + 24);
    *(void *)(v47 + 24) = &v8[(v46.curpos - v8 + 7) & 0xFFFFFFFFFFFFFFF8];
    uint64_t v9 = (vm_address_t *)address;
    if (address)
    {
      apr_status_t v10 = (unint64_t *)*((void *)p + 6);
      unint64_t v11 = v10[3];
      if (v11) {
        pthread_mutex_lock((pthread_mutex_t *)(v11 + 8));
      }
      vm_address_t v12 = 0;
      unint64_t v13 = *v10;
      unint64_t v14 = v10[1];
      unint64_t v15 = v10[2];
      do
      {
        while (1)
        {
          while (1)
          {
            unint64_t v16 = v9;
            uint64_t v9 = (vm_address_t *)*v9;
            unint64_t v17 = *((unsigned int *)v16 + 4);
            if (!v14 || v15 > v17) {
              break;
            }
            *unint64_t v16 = v12;
            vm_address_t v12 = (vm_address_t)v16;
            if (!v9) {
              goto LABEL_26;
            }
          }
          if (v17 > 0x13) {
            break;
          }
          vm_address_t v18 = &v10[v17];
          vm_address_t v19 = v18[5];
          *unint64_t v16 = v19;
          if (v13 < v17 && v19 == 0) {
            unint64_t v13 = v17;
          }
          v18[5] = (unint64_t)v16;
          if (v15 <= v17)
          {
            unint64_t v15 = 0;
            if (!v9) {
              goto LABEL_26;
            }
          }
          else
          {
            v15 += ~v17;
            if (!v9) {
              goto LABEL_26;
            }
          }
        }
        *unint64_t v16 = v10[5];
        v10[5] = (unint64_t)v16;
        BOOL v21 = v15 > v17;
        v15 += ~v17;
        if (!v21) {
          unint64_t v15 = 0;
        }
      }
      while (v9);
LABEL_26:
      *apr_status_t v10 = v13;
      v10[2] = v15;
      unint64_t v22 = v10[3];
      if (v22) {
        pthread_mutex_unlock((pthread_mutex_t *)(v22 + 8));
      }
      if (v12)
      {
        do
        {
          vm_address_t v23 = *(void *)v12;
          vm_deallocate(mach_task_self_, v12, ((*(_DWORD *)(v12 + 16) << 12) + 4096));
          vm_address_t v12 = v23;
        }
        while (v23);
      }
    }
    if ((_BYTE)v49)
    {
      vm_address_t v24 = (uint64_t *)*((void *)p + 11);
      vm_address_t v25 = (void *)v47;
      *(_DWORD *)(v47 + 20) = 0;
      uint64_t v26 = (void *)v24[1];
      v25[1] = v26;
      *uint64_t v26 = v25;
      void *v25 = v24;
      v24[1] = (uint64_t)v25;
      *((void *)p + 11) = v25;
      unint64_t v27 = (v24[4] - v24[3]) >> 12;
      *((_DWORD *)v24 + 5) = v27;
      if (v27 < *(unsigned int *)(*v24 + 20))
      {
        BOOL v28 = (uint64_t *)*v24;
        do
          BOOL v28 = (uint64_t *)*v28;
        while (*((_DWORD *)v28 + 5) > v27);
        void *v25 = *v24;
        *(void *)(*v24 + 8) = v24[1];
        unint64_t v29 = (void *)v28[1];
        v24[1] = (uint64_t)v29;
        *unint64_t v29 = v24;
        *vm_address_t v24 = (uint64_t)v28;
        v28[1] = (uint64_t)v24;
      }
    }
  }
  return v8;
}

uint64_t psprintf_flush(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v2 = *(void *)(a1 + 24);
  size_t v4 = *(void *)a1 - *(void *)(v3 + 24);
  if (2 * v4 <= 0x20) {
    unint64_t v5 = 32;
  }
  else {
    unint64_t v5 = 2 * v4;
  }
  if (!*(unsigned char *)(a1 + 32))
  {
    vm_address_t v6 = *(void *)v3;
    if (v5 <= *(void *)(*(void *)v3 + 32) - *(void *)(*(void *)v3 + 24))
    {
      **(void **)(v6 + 8) = *(void *)v6;
      *(void *)(*(void *)v6 + 8) = *(void *)(v6 + 8);
      apr_status_t v10 = *(vm_address_t **)(v3 + 8);
      *(void *)(v6 + 8) = v10;
      *apr_status_t v10 = v6;
      *(void *)vm_address_t v6 = v3;
      *(void *)(v3 + 8) = v6;
      *(_DWORD *)(v6 + 20) = 0;
      *(void *)(v2 + 88) = v6;
      unint64_t v11 = (uint64_t)(*(void *)(v3 + 32) - *(void *)(v3 + 24)) >> 12;
      *(_DWORD *)(v3 + 20) = v11;
      if (v11 < *(unsigned int *)(*(void *)v3 + 20))
      {
        vm_address_t v12 = *(void *)v3;
        do
          vm_address_t v12 = *(void *)v12;
        while (*(_DWORD *)(v12 + 20) > v11);
        *(void *)vm_address_t v6 = *(void *)v3;
        *(void *)(*(void *)v3 + 8) = *(void *)(v3 + 8);
        unint64_t v13 = *(void **)(v12 + 8);
        *(void *)(v3 + 8) = v13;
        *unint64_t v13 = v3;
        *(void *)uint64_t v3 = v12;
        *(void *)(v12 + 8) = v3;
        vm_address_t v6 = *(void *)(v2 + 88);
      }
      goto LABEL_10;
    }
  }
  vm_address_t v7 = allocator_alloc(*(void *)(v2 + 48), v5);
  if (v7)
  {
    vm_address_t v6 = v7;
    if (*(unsigned char *)(a1 + 32))
    {
      *(void *)uint64_t v3 = *(void *)(a1 + 40);
      *(void *)(a1 + 40) = v3;
    }
    *(unsigned char *)(a1 + 32) = 1;
LABEL_10:
    memcpy(*(void **)(v6 + 24), *(const void **)(v3 + 24), v4);
    uint64_t result = 0;
    *(void *)(a1 + 16) = v6;
    uint64_t v9 = *(void *)(v6 + 32) - 1;
    *(void *)a1 = *(void *)(v6 + 24) + v4;
    *(void *)(a1 + 8) = v9;
    return result;
  }
  return 0xFFFFFFFFLL;
}

char *apr_psprintf(apr_pool_t *p, const char *fmt, ...)
{
  va_start(va, fmt);
  return apr_pvsprintf(p, fmt, va);
}

void apr_pool_abort_set(apr_abortfunc_t abortfunc, apr_pool_t *pool)
{
  *((void *)pool + 8) = abortfunc;
}

apr_abortfunc_t apr_pool_abort_get(apr_pool_t *pool)
{
  return (apr_abortfunc_t)*((void *)pool + 8);
}

apr_pool_t *__cdecl apr_pool_parent_get(apr_pool_t *pool)
{
  return *(apr_pool_t **)pool;
}

apr_allocator_t *__cdecl apr_pool_allocator_get(apr_pool_t *pool)
{
  return (apr_allocator_t *)*((void *)pool + 6);
}

int apr_pool_is_ancestor(apr_pool_t *a, apr_pool_t *b)
{
  if (a)
  {
    if (!b) {
      return 0;
    }
    while (b != a)
    {
      b = *(apr_pool_t **)b;
      if (!b) {
        return 0;
      }
    }
  }
  return 1;
}

apr_status_t apr_pool_userdata_set(const void *data, const char *key, apr_status_t (__cdecl *cleanup)(void *), apr_pool_t *pool)
{
  uint64_t v8 = (apr_hash_t *)*((void *)pool + 9);
  if (!v8)
  {
    uint64_t v8 = apr_hash_make(pool);
    *((void *)pool + 9) = v8;
  }
  uint64_t v9 = *find_entry((uint64_t)v8, key, 0xFFFFFFFFFFFFFFFFLL, 0);
  if (v9 && *(void *)(v9 + 32))
  {
    apr_status_t v10 = (apr_hash_t *)*((void *)pool + 9);
    unint64_t v11 = key;
  }
  else
  {
    apr_size_t v12 = strlen(key) + 1;
    unint64_t v13 = apr_palloc(pool, v12);
    memcpy(v13, key, v12);
    apr_status_t v10 = (apr_hash_t *)*((void *)pool + 9);
    unint64_t v11 = (const char *)v13;
  }
  apr_hash_set(v10, v11, -1, data);
  if (cleanup)
  {
    unint64_t v14 = (void *)*((void *)pool + 5);
    if (v14) {
      *((void *)pool + 5) = *v14;
    }
    else {
      unint64_t v14 = apr_palloc(pool, 0x20uLL);
    }
    _DWORD v14[2] = cleanup;
    _OWORD v14[3] = cleanup;
    *unint64_t v14 = *((void *)pool + 4);
    v14[1] = data;
    *((void *)pool + 4) = v14;
  }
  return 0;
}

void apr_pool_cleanup_register(apr_pool_t *p, const void *data, apr_status_t (__cdecl *plain_cleanup)(void *), apr_status_t (__cdecl *child_cleanup)(void *))
{
  if (p)
  {
    uint64_t v8 = (void *)*((void *)p + 5);
    if (v8) {
      *((void *)p + 5) = *v8;
    }
    else {
      uint64_t v8 = apr_palloc(p, 0x20uLL);
    }
    v8[2] = plain_cleanup;
    v8[3] = child_cleanup;
    *uint64_t v8 = *((void *)p + 4);
    v8[1] = data;
    *((void *)p + 4) = v8;
  }
}

apr_status_t apr_pool_userdata_setn(const void *data, const char *key, apr_status_t (__cdecl *cleanup)(void *), apr_pool_t *pool)
{
  uint64_t v8 = (apr_hash_t *)*((void *)pool + 9);
  if (!v8)
  {
    uint64_t v8 = apr_hash_make(pool);
    *((void *)pool + 9) = v8;
  }
  apr_hash_set(v8, key, -1, data);
  if (cleanup)
  {
    uint64_t v9 = (void *)*((void *)pool + 5);
    if (v9) {
      *((void *)pool + 5) = *v9;
    }
    else {
      uint64_t v9 = apr_palloc(pool, 0x20uLL);
    }
    v9[2] = cleanup;
    void v9[3] = cleanup;
    *uint64_t v9 = *((void *)pool + 4);
    v9[1] = data;
    *((void *)pool + 4) = v9;
  }
  return 0;
}

apr_status_t apr_pool_userdata_get(void **data, const char *key, apr_pool_t *pool)
{
  uint64_t v4 = *((void *)pool + 9);
  if (v4)
  {
    unint64_t v5 = (void *)*find_entry(v4, key, 0xFFFFFFFFFFFFFFFFLL, 0);
    if (v5) {
      unint64_t v5 = (void *)v5[4];
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  void *data = v5;
  return 0;
}

void apr_pool_pre_cleanup_register(apr_pool_t *p, const void *data, apr_status_t (__cdecl *plain_cleanup)(void *))
{
  if (p)
  {
    vm_address_t v6 = (void *)*((void *)p + 5);
    if (v6) {
      *((void *)p + 5) = *v6;
    }
    else {
      vm_address_t v6 = apr_palloc(p, 0x20uLL);
    }
    v6[2] = plain_cleanup;
    *vm_address_t v6 = *((void *)p + 14);
    v6[1] = data;
    *((void *)p + 14) = v6;
  }
}

void apr_pool_cleanup_kill(apr_pool_t *p, const void *data, apr_status_t (__cdecl *cleanup)(void *))
{
  if (p)
  {
    uint64_t v3 = (void *)((char *)p + 32);
    uint64_t v4 = (uint64_t *)*((void *)p + 4);
    if (v4)
    {
      while (1)
      {
        unint64_t v5 = v4;
        if ((const void *)v4[1] == data && (apr_status_t (__cdecl *)(void *))v4[2] == cleanup) {
          break;
        }
        uint64_t v4 = (uint64_t *)*v4;
        uint64_t v3 = v5;
        if (!*v5) {
          goto LABEL_8;
        }
      }
      void *v3 = *v4;
      uint64_t *v4 = *((void *)p + 5);
      *((void *)p + 5) = v4;
    }
LABEL_8:
    vm_address_t v6 = (void *)((char *)p + 112);
    vm_address_t v7 = (uint64_t *)*((void *)p + 14);
    if (v7)
    {
      while (1)
      {
        uint64_t v8 = v7;
        if ((const void *)v7[1] == data && (apr_status_t (__cdecl *)(void *))v7[2] == cleanup) {
          break;
        }
        vm_address_t v7 = (uint64_t *)*v7;
        vm_address_t v6 = v8;
        if (!*v8) {
          return;
        }
      }
      *vm_address_t v6 = *v7;
      *vm_address_t v7 = *((void *)p + 5);
      *((void *)p + 5) = v7;
    }
  }
}

void apr_pool_child_cleanup_set(apr_pool_t *p, const void *data, apr_status_t (__cdecl *plain_cleanup)(void *), apr_status_t (__cdecl *child_cleanup)(void *))
{
  if (p)
  {
    uint64_t v4 = (uint64_t **)*((void *)p + 4);
    if (v4)
    {
      while (v4[1] != data || v4[2] != (uint64_t *)plain_cleanup)
      {
        uint64_t v4 = (uint64_t **)*v4;
        if (!v4) {
          return;
        }
      }
      v4[3] = (uint64_t *)child_cleanup;
    }
  }
}

apr_status_t apr_pool_cleanup_run(apr_pool_t *p, void *data, apr_status_t (__cdecl *cleanup)(void *))
{
  apr_pool_cleanup_kill(p, data, cleanup);

  return ((uint64_t (*)(void *))cleanup)(data);
}

void apr_pool_cleanup_for_exec(void)
{
}

uint64_t cleanup_pool_for_exec(uint64_t result)
{
  uint64_t v1 = result;
  for (uint64_t i = *(void *)(result + 32); i; uint64_t i = *(void *)(v1 + 32))
  {
    *(void *)(v1 + 32) = *(void *)i;
    uint64_t result = (*(uint64_t (**)(void))(i + 24))(*(void *)(i + 8));
  }
  for (uint64_t j = *(void *)(v1 + 8); j; uint64_t j = *(void *)(j + 16))
    uint64_t result = cleanup_pool_for_exec(j);
  return result;
}

apr_status_t apr_pool_cleanup_null(void *data)
{
  return 0;
}

void apr_pool_note_subprocess(apr_pool_t *a, apr_proc_t *proc, apr_kill_conditions_e how)
{
  vm_address_t v6 = apr_palloc(a, 0x18uLL);
  *(void *)vm_address_t v6 = proc;
  v6[2] = how;
  *((void *)v6 + 2) = *((void *)a + 7);
  *((void *)a + 7) = v6;
}

void *__cdecl apr_pcalloc_debug(apr_pool_t *p, apr_size_t size, const char *file_line)
{
  uint64_t v4 = apr_palloc(p, size);
  unint64_t v5 = v4;
  if (v4) {
    bzero(v4, size);
  }
  return v5;
}

apr_status_t apr_procattr_create(apr_procattr_t **new_attr, apr_pool_t *cont)
{
  uint64_t v4 = (char *)apr_palloc(cont, 0x88uLL);
  if (v4)
  {
    unint64_t v5 = v4;
    apr_status_t result = 0;
    *(_OWORD *)(v5 + 120) = 0u;
    *(_OWORD *)(v5 + 104) = 0u;
    *(_OWORD *)(v5 + 88) = 0u;
    *(_OWORD *)(v5 + 72) = 0u;
    *(_OWORD *)(v5 + 56) = 0u;
    *(_OWORD *)(v5 + 40) = 0u;
    *(_OWORD *)(v5 + 24) = 0u;
    *(_OWORD *)(v5 + 8) = 0u;
    *new_attr = (apr_procattr_t *)v5;
    *(void *)unint64_t v5 = cont;
    vm_address_t v7 = *new_attr;
    *((_DWORD *)v7 + 16) = 1;
    *(void *)((char *)v7 + 116) = -1;
  }
  else
  {
    *new_attr = 0;
    return 12;
  }
  return result;
}

apr_status_t apr_procattr_io_set(apr_procattr_t *attr, apr_int32_t in, apr_int32_t out, apr_int32_t err)
{
  return 0;
}

apr_status_t apr_procattr_child_in_set(apr_procattr_t *attr, apr_file_t *child_in, apr_file_t *parent_in)
{
  return 0;
}

apr_status_t apr_procattr_child_out_set(apr_procattr_t *attr, apr_file_t *child_out, apr_file_t *parent_out)
{
  return 0;
}

apr_status_t apr_procattr_child_err_set(apr_procattr_t *attr, apr_file_t *child_err, apr_file_t *parent_err)
{
  return 0;
}

apr_status_t apr_procattr_dir_set(apr_procattr_t *attr, const char *dir)
{
  uint64_t v3 = apr_pstrdup(*(apr_pool_t **)attr, dir);
  *((void *)attr + 7) = v3;
  if (v3) {
    return 0;
  }
  else {
    return 12;
  }
}

apr_status_t apr_procattr_cmdtype_set(apr_procattr_t *attr, apr_cmdtype_e cmd)
{
  *((_DWORD *)attr + 16) = cmd;
  return 0;
}

apr_status_t apr_procattr_detach_set(apr_procattr_t *attr, apr_int32_t detach)
{
  *((_DWORD *)attr + 17) = detach;
  return 0;
}

apr_status_t apr_proc_fork(apr_proc_t *proc, apr_pool_t *cont)
{
  *(_OWORD *)&proc->pid = 0u;
  *(_OWORD *)&proc->out = 0u;
  pid_t v3 = fork();
  if (v3 < 0) {
    return *__error();
  }
  apr_status_t v4 = 70001;
  if (v3)
  {
    proc->pid = v3;
    return 70002;
  }
  else
  {
    proc->pid = getpid();
    apr_random_after_fork(proc);
  }
  return v4;
}

apr_status_t apr_procattr_child_errfn_set(apr_procattr_t *attr, apr_child_errfn_t *errfn)
{
  *((void *)attr + 13) = errfn;
  return 0;
}

apr_status_t apr_procattr_error_check_set(apr_procattr_t *attr, apr_int32_t chk)
{
  *((_DWORD *)attr + 28) = chk;
  return 0;
}

apr_status_t apr_procattr_addrspace_set(apr_procattr_t *attr, apr_int32_t addrspace)
{
  return 0;
}

apr_status_t apr_procattr_user_set(apr_procattr_t *attr, const char *username, const char *password)
{
  return 0;
}

apr_status_t apr_procattr_group_set(apr_procattr_t *attr, const char *groupname)
{
  return 0;
}

apr_status_t apr_proc_create(apr_proc_t *new_proc, const char *progname, const char *const *args, const char *const *env, apr_procattr_t *attr, apr_pool_t *pool)
{
  return 0;
}

apr_status_t apr_proc_wait_all_procs(apr_proc_t *proc, int *exitcode, apr_exit_why_e *exitwhy, apr_wait_how_e waithow, apr_pool_t *p)
{
  proc->pid = -1;
  return apr_proc_wait(proc, exitcode, exitwhy, waithow);
}

apr_status_t apr_proc_wait(apr_proc_t *proc, int *exitcode, apr_exit_why_e *exitwhy, apr_wait_how_e waithow)
{
  int v14 = 0;
  if (waithow) {
    int v7 = 3;
  }
  else {
    int v7 = 2;
  }
  while (1)
  {
    pid_t v8 = waitpid(proc->pid, &v14, v7);
    if ((v8 & 0x80000000) == 0) {
      break;
    }
    if (*__error() != 4) {
      return *__error();
    }
  }
  pid_t v10 = v8;
  apr_status_t result = 70005;
  if (!v10) {
    return 70006;
  }
  proc->pid = v10;
  unsigned __int8 v11 = BYTE1(v14);
  int v12 = v14 & 0x7F;
  if (v12 == 127) {
    return 20014;
  }
  if ((v14 & 0x7F) != 0)
  {
    if (exitwhy)
    {
      if ((v14 & 0x80) != 0) {
        apr_exit_why_e v13 = APR_PROC_SIGNAL_CORE|APR_PROC_SIGNAL;
      }
      else {
        apr_exit_why_e v13 = APR_PROC_SIGNAL;
      }
      *exitwhy = v13;
    }
  }
  else
  {
    if (exitwhy) {
      *exitwhy = APR_PROC_EXIT;
    }
    int v12 = v11;
  }
  if (exitcode) {
    *exitcode = v12;
  }
  return result;
}

uint64_t apr_procattr_perms_set_register(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  pid_t v8 = apr_palloc(*(apr_pool_t **)a1, 0x20uLL);
  v8[3] = a3;
  *((_DWORD *)v8 + 4) = a4;
  *pid_t v8 = *(void *)(a1 + 128);
  v8[1] = a2;
  *(void *)(a1 + 128) = v8;
  return 0;
}

apr_status_t apr_proc_mutex_destroy(apr_proc_mutex_t *mutex)
{
  apr_pool_cleanup_kill(*(apr_pool_t **)mutex, mutex, apr_proc_mutex_cleanup);

  return apr_proc_mutex_cleanup(mutex);
}

apr_status_t apr_proc_mutex_cleanup(void *mutex)
{
  return (*(uint64_t (**)(void))(*((void *)mutex + 1) + 40))();
}

void apr_proc_mutex_unix_setup_lock()
{
  proc_mutex_op_on = -65536;
  word_250124 = 4096;
  proc_mutex_op_try = -65536;
  word_25012A = 6144;
  proc_mutex_op_off = 0x10000;
  word_250130 = 4096;
  proc_mutex_lock_it = 0;
  unk_250140 = 0;
  qword_250148 = 0x300000000;
  proc_mutex_unlock_it = 0;
  *(void *)algn_250158 = 0;
  qword_250160 = 0x200000000;
}

const char *apr_proc_mutex_defname(void)
{
  return "sysvsem";
}

uint64_t proc_mutex_sysv_perms_set()
{
  return 0;
}

uint64_t proc_mutex_no_child_init()
{
  return 0;
}

uint64_t proc_mutex_sysv_cleanup(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 32);
  if (v1 != -1) {
    semctl(v1, 0, 0, 0);
  }
  return 0;
}

uint64_t proc_mutex_sysv_release(uint64_t a1)
{
  *(_DWORD *)(a1 + 16) = 0;
  while (semop(*(_DWORD *)(a1 + 32), (sembuf *)&proc_mutex_op_off, 1uLL) < 0)
  {
    if (*__error() != 4) {
      return *__error();
    }
  }
  return 0;
}

uint64_t proc_mutex_sysv_tryacquire(uint64_t a1)
{
  do
  {
    if ((semop(*(_DWORD *)(a1 + 32), (sembuf *)&proc_mutex_op_try, 1uLL) & 0x80000000) == 0)
    {
      uint64_t result = 0;
      *(_DWORD *)(a1 + 16) = 1;
      return result;
    }
  }
  while (*__error() == 4);
  if (*__error() == 35) {
    return 70025;
  }
  else {
    return *__error();
  }
}

uint64_t proc_mutex_sysv_acquire(uint64_t a1)
{
  while (semop(*(_DWORD *)(a1 + 32), (sembuf *)&proc_mutex_op_on, 1uLL) < 0)
  {
    if (*__error() != 4) {
      return *__error();
    }
  }
  uint64_t result = 0;
  *(_DWORD *)(a1 + 16) = 1;
  return result;
}

uint64_t proc_mutex_sysv_create(uint64_t a1)
{
  int v2 = semget(0, 1, 896);
  *(_DWORD *)(a1 + 32) = v2;
  if (v2 == -1)
  {
    uint64_t v3 = *__error();
    int v4 = *(_DWORD *)(a1 + 32);
    if (v4 != -1) {
      semctl(v4, 0, 0, 0);
    }
  }
  else if (semctl(v2, 0, 8, 1) < 0)
  {
    uint64_t v3 = *__error();
    int v5 = *(_DWORD *)(a1 + 32);
    if (v5 != -1) {
      semctl(v5, 0, 0, 0);
    }
    *(_DWORD *)(a1 + 32) = -1;
  }
  else
  {
    *(_DWORD *)(a1 + 16) = 0;
    apr_pool_cleanup_register(*(apr_pool_t **)a1, (const void *)a1, apr_proc_mutex_cleanup, apr_pool_cleanup_null);
    return 0;
  }
  return v3;
}

const char *__cdecl apr_proc_mutex_name(apr_proc_mutex_t *mutex)
{
  return *(const char **)(*((void *)mutex + 1) + 72);
}

apr_status_t apr_proc_mutex_create(apr_proc_mutex_t **mutex, const char *fname, apr_lockmech_e mech, apr_pool_t *pool)
{
  pid_t v8 = (char *)apr_palloc(pool, 0x40uLL);
  uint64_t v9 = v8;
  if (v8)
  {
    *((void *)v8 + 7) = 0;
    *(_OWORD *)(v8 + 40) = 0u;
    *(_OWORD *)(v8 + 24) = 0u;
    *(_OWORD *)(v8 + 8) = 0u;
  }
  apr_status_t result = 70023;
  *(void *)uint64_t v9 = pool;
  *((_DWORD *)v9 + 8) = -1;
  *((void *)v9 + 6) = 0;
  *((_DWORD *)v9 + 14) = 0;
  if (mech <= APR_LOCK_DEFAULT && ((0x27u >> mech) & 1) != 0)
  {
    uint64_t v11 = (uint64_t)*(&off_222708 + mech);
    *((void *)v9 + 1) = v11;
    apr_status_t result = (*(uint64_t (**)(char *, const char *))(v11 + 8))(v9, fname);
    if (!result) {
      apr_thread_mutex_t *mutex = (apr_proc_mutex_t *)v9;
    }
  }
  return result;
}

uint64_t proc_mutex_flock_perms_set(uint64_t a1, __int16 a2, uid_t a3, gid_t a4)
{
  if (!*(void *)(a1 + 24)) {
    return 0;
  }
  if ((a2 & 0x4000) == 0) {
    a4 = -1;
  }
  if (fchown(*(_DWORD *)(a1 + 32), a3, a4) < 0) {
    return *__error();
  }
  else {
    return 0;
  }
}

uint64_t proc_mutex_flock_child_init()
{
  return 0;
}

uint64_t proc_mutex_flock_cleanup()
{
  return 0;
}

uint64_t proc_mutex_flock_release(uint64_t a1)
{
  *(_DWORD *)(a1 + 16) = 0;
  while (flock(*(_DWORD *)(a1 + 32), 8) < 0)
  {
    if (*__error() != 4) {
      return *__error();
    }
  }
  return 0;
}

uint64_t proc_mutex_flock_tryacquire(uint64_t a1)
{
  do
  {
    if ((flock(*(_DWORD *)(a1 + 32), 6) & 0x80000000) == 0)
    {
      uint64_t v2 = 0;
      *(_DWORD *)(a1 + 16) = 1;
      return v2;
    }
  }
  while (*__error() == 4);
  uint64_t v2 = 70025;
  if (*__error() != 35 && *__error() != 35) {
    return *__error();
  }
  return v2;
}

uint64_t proc_mutex_flock_acquire(uint64_t a1)
{
  while (flock(*(_DWORD *)(a1 + 32), 2) < 0)
  {
    if (*__error() != 4) {
      return *__error();
    }
  }
  uint64_t result = 0;
  *(_DWORD *)(a1 + 16) = 1;
  return result;
}

uint64_t proc_mutex_flock_create()
{
  return 0;
}

uint64_t proc_mutex_fcntl_perms_set(uint64_t a1, __int16 a2, uid_t a3, gid_t a4)
{
  if (!*(void *)(a1 + 24)) {
    return 0;
  }
  if ((a2 & 0x4000) == 0) {
    a4 = -1;
  }
  if (fchown(*(_DWORD *)(a1 + 32), a3, a4) < 0) {
    return *__error();
  }
  else {
    return 0;
  }
}

uint64_t proc_mutex_fcntl_cleanup()
{
  return 0;
}

uint64_t proc_mutex_fcntl_release(uint64_t a1)
{
  *(_DWORD *)(a1 + 16) = 0;
  while (fcntl(*(_DWORD *)(a1 + 32), 9, &proc_mutex_unlock_it) < 0)
  {
    if (*__error() != 4) {
      return *__error();
    }
  }
  return 0;
}

uint64_t proc_mutex_fcntl_tryacquire(uint64_t a1)
{
  do
  {
    if ((fcntl(*(_DWORD *)(a1 + 32), 8, &proc_mutex_lock_it) & 0x80000000) == 0)
    {
      uint64_t result = 0;
      *(_DWORD *)(a1 + 16) = 1;
      return result;
    }
  }
  while (*__error() == 4);
  if (*__error() == 35) {
    return 70025;
  }
  else {
    return *__error();
  }
}

uint64_t proc_mutex_fcntl_acquire(uint64_t a1)
{
  while (fcntl(*(_DWORD *)(a1 + 32), 9, &proc_mutex_lock_it) < 0)
  {
    if (*__error() != 4) {
      return *__error();
    }
  }
  uint64_t result = 0;
  *(_DWORD *)(a1 + 16) = 1;
  return result;
}

uint64_t proc_mutex_fcntl_create()
{
  return 0;
}

apr_status_t apr_proc_mutex_child_init(apr_proc_mutex_t **mutex, const char *fname, apr_pool_t *pool)
{
  return (*(uint64_t (**)(void))(*((void *)*mutex + 1) + 48))();
}

apr_status_t apr_proc_mutex_lock(apr_proc_mutex_t *mutex)
{
  return (*(uint64_t (**)(void))(*((void *)mutex + 1) + 16))();
}

apr_status_t apr_proc_mutex_trylock(apr_proc_mutex_t *mutex)
{
  return (*(uint64_t (**)(void))(*((void *)mutex + 1) + 24))();
}

apr_status_t apr_proc_mutex_unlock(apr_proc_mutex_t *mutex)
{
  return (*(uint64_t (**)(void))(*((void *)mutex + 1) + 32))();
}

uint64_t apr_proc_mutex_mech(uint64_t a1)
{
  return *(unsigned int *)(*(void *)(a1 + 8) + 64);
}

const char *__cdecl apr_proc_mutex_lockfile(apr_proc_mutex_t *mutex)
{
  int v1 = (void *)*((void *)mutex + 1);
  if (v1 == &mutex_flock_methods || v1 == &mutex_fcntl_methods) {
    return (const char *)*((void *)mutex + 3);
  }
  else {
    return 0;
  }
}

uint64_t apr_proc_mutex_perms_set(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 56))();
}

apr_pool_t *__cdecl apr_proc_mutex_pool_get(const apr_proc_mutex_t *theproc_mutex)
{
  return *(apr_pool_t **)theproc_mutex;
}

uint64_t apr_os_proc_mutex_get_ex(_OWORD *a1, uint64_t a2, _DWORD *a3)
{
  *a1 = *(_OWORD *)(a2 + 32);
  if (a3) {
    *a3 = *(_DWORD *)(*(void *)(a2 + 8) + 64);
  }
  return 0;
}

apr_status_t apr_os_proc_mutex_get(apr_os_proc_mutex_t *ospmutex, apr_proc_mutex_t *pmutex)
{
  *ospmutex = *((apr_os_proc_mutex_t *)pmutex + 2);
  return 0;
}

uint64_t apr_os_proc_mutex_put_ex()
{
  return 0;
}

apr_status_t apr_os_proc_mutex_put(apr_proc_mutex_t **pmutex, apr_os_proc_mutex_t *ospmutex, apr_pool_t *cont)
{
  return 0;
}

void apr_random_init(apr_random_t *g, apr_pool_t *p, apr_crypto_hash_t *pool_hash, apr_crypto_hash_t *key_hash, apr_crypto_hash_t *prng_hash)
{
  *(void *)g = p;
  *((void *)g + 1) = pool_hash;
  *((void *)g + 7) = key_hash;
  *((void *)g + 8) = prng_hash;
  *((_DWORD *)g + 4) = 32;
  int v7 = apr_palloc(p, 0x200uLL);
  *((void *)g + 3) = v7;
  uint64_t v8 = *((unsigned int *)g + 4);
  if (v8) {
    bzero(v7, 16 * v8);
  }
  *((void *)g + 4) = 0;
  *((void *)g + 5) = 2
                     * *(void *)(*((void *)g + 1) + 24)
                     * (((unint64_t)(2 * *(void *)(*((void *)g + 1) + 24) + 1023)
                       / *(void *)(*((void *)g + 1) + 24)) >> 1);
  *((void *)g + 6) = 32;
  apr_size_t v9 = *(void *)(*((void *)g + 7) + 24) + *(void *)(*((void *)g + 8) + 24);
  pid_t v10 = apr_palloc(p, v9);
  uint64_t v11 = v10;
  if (v10) {
    bzero(v10, v9);
  }
  *((void *)g + 9) = v11;
  apr_size_t v12 = *(void *)(*((void *)g + 7) + 24) + *(void *)(*((void *)g + 8) + 24);
  apr_exit_why_e v13 = apr_palloc(p, v12);
  int v14 = v13;
  if (v13) {
    bzero(v13, v12);
  }
  *((void *)g + 10) = v14;
  *((void *)g + 11) = apr_palloc(p, *(void *)(*((void *)g + 8) + 24));
  *((void *)g + 12) = 0;
  *((_DWORD *)g + 28) = 0;
  *((void *)g + 13) = 0x14000000020;
  *((unsigned char *)g + 116) &= 0xFCu;
  *((void *)g + 15) = all_random;
  all_random = (uint64_t)g;
  unint64_t v15 = (void *)*((void *)p + 5);
  if (v15) {
    *((void *)p + 5) = *v15;
  }
  else {
    unint64_t v15 = apr_palloc(p, 0x20uLL);
  }
  v15[1] = g;
  v15[2] = random_cleanup;
  v15[3] = apr_pool_cleanup_null;
  *unint64_t v15 = *((void *)p + 4);
  *((void *)p + 4) = v15;
}

uint64_t random_cleanup(uint64_t a1)
{
  uint64_t v1 = all_random;
  if (all_random)
  {
    if (all_random == a1)
    {
      uint64_t v3 = &all_random;
LABEL_7:
      uint64_t *v3 = *(void *)(a1 + 120);
    }
    else
    {
      while (1)
      {
        uint64_t v2 = v1;
        uint64_t v1 = *(void *)(v1 + 120);
        if (!v1) {
          break;
        }
        if (v1 == a1)
        {
          uint64_t v3 = (uint64_t *)(v2 + 120);
          goto LABEL_7;
        }
      }
    }
  }
  return 0;
}

void apr_random_after_fork(apr_proc_t *proc)
{
  for (uint64_t i = all_random; i; uint64_t i = *(void *)(i + 120))
  {
    if ((*(unsigned char *)(i + 116) & 3) == 1) {
      uint64_t v2 = 80;
    }
    else {
      uint64_t v2 = 72;
    }
    uint64_t v3 = *(void *)(i + v2);
    mix_pid(i);
    if (v3 != *(void *)(i + 72)) {
      mix_pid(i);
    }
    --*(_DWORD *)(i + 36);
    *(void *)(i + 96) = 0;
  }
}

uint64_t mix_pid(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

apr_random_t *__cdecl apr_random_standard_new(apr_pool_t *p)
{
  return (apr_random_t *)apr_palloc(p, 0x80uLL);
}

void apr_random_add_entropy(apr_random_t *g, const void *entropy_, apr_size_t bytes)
{
  if (bytes)
  {
    uint64_t v6 = 0;
    for (i = 0; i < bytes; uint64_t v6 = ++i)
    {
      uint64_t v8 = *((unsigned int *)g + 8);
      uint64_t v9 = *((void *)g + 3) + 16 * v8;
      if (v8 + 1 == *((_DWORD *)g + 4)) {
        int v10 = 0;
      }
      else {
        int v10 = v8 + 1;
      }
      *((_DWORD *)g + 8) = v10;
      apr_size_t v12 = (unsigned int *)(v9 + 8);
      unsigned int v11 = *(_DWORD *)(v9 + 8);
      unsigned int v13 = v11 + 1;
      if (*(_DWORD *)(v9 + 12) >= v11 + 1)
      {
        int v14 = *(void **)v9;
      }
      else
      {
        int v14 = apr_palloc(*(apr_pool_t **)g, 2 * v13);
        memcpy(v14, *(const void **)v9, *v12);
        *(void *)uint64_t v9 = v14;
        unsigned int v11 = *v12;
        *(_DWORD *)(v9 + 12) = 2 * *v12 + 2;
        unsigned int v13 = v11 + 1;
      }
      char v15 = *((unsigned char *)entropy_ + v6);
      *apr_size_t v12 = v13;
      *((unsigned char *)v14 + v11) = v15;
      unint64_t v16 = *v12;
      if (*((void *)g + 5) == v16)
      {
        if (v16 >= 2)
        {
          unint64_t v17 = 0;
          uint64_t v18 = *((void *)g + 1);
          do
          {
            (*(void (**)(void))v18)();
            (*(void (**)(void))(*((void *)g + 1) + 8))();
            (*(void (**)(void))(*((void *)g + 1) + 16))();
            uint64_t v18 = *((void *)g + 1);
            v17 += *(void *)(v18 + 24);
            unint64_t v19 = *v12;
          }
          while (v17 < v19 >> 1);
          unint64_t v16 = v19 >> 1;
        }
        else
        {
          LODWORD(v16) = v16 >> 1;
        }
        *apr_size_t v12 = v16;
      }
    }
  }
  if (*((void *)g + 6) <= (unint64_t)*(unsigned int *)(*((void *)g + 3) + 8))
  {
    (**((void (***)(void))g + 7))();
    (*(void (**)(void))(*((void *)g + 7) + 8))();
    if (*((_DWORD *)g + 4))
    {
      uint64_t v20 = 0;
      unint64_t v21 = 0;
      do
      {
        if (v21 && ((*((_DWORD *)g + 9) >> (v21 - 1)) & 1) == 0) {
          break;
        }
        (*(void (**)(void))(*((void *)g + 7) + 8))();
        *(_DWORD *)(*((void *)g + 3) + v20 + 8) = 0;
        ++v21;
        v20 += 16;
      }
      while (v21 < *((unsigned int *)g + 4));
    }
    (*(void (**)(void))(*((void *)g + 7) + 16))();
    unsigned int v22 = *((_DWORD *)g + 9) + 1;
    *((_DWORD *)g + 9) = v22;
    char v23 = *((unsigned char *)g + 116);
    if ((v23 & 1) != 0 || v22 <= *((_DWORD *)g + 26))
    {
      char v24 = *((unsigned char *)g + 116);
      if ((v24 & 2) != 0) {
        return;
      }
    }
    else
    {
      char v24 = v23 | 1;
      *((unsigned char *)g + 116) = v23 | 1;
      if ((v23 & 2) == 0)
      {
        memcpy(*((void **)g + 10), *((const void **)g + 9), *(void *)(*((void *)g + 7) + 24) + *(void *)(*((void *)g + 8) + 24));
        unsigned int v22 = *((_DWORD *)g + 9);
        *((_DWORD *)g + 28) = v22;
        char v24 = *((unsigned char *)g + 116);
      }
      if ((v24 & 2) != 0) {
        return;
      }
    }
    if (v22 > *((_DWORD *)g + 27) + *((_DWORD *)g + 28))
    {
      *((unsigned char *)g + 116) = v24 | 2;
      vm_address_t v25 = (void *)*((void *)g + 9);
      uint64_t v26 = (const void *)*((void *)g + 10);
      size_t v27 = *(void *)(*((void *)g + 7) + 24) + *(void *)(*((void *)g + 8) + 24);
      memcpy(v25, v26, v27);
    }
  }
}

apr_status_t apr_random_secure_bytes(apr_random_t *g, void *random, apr_size_t bytes)
{
  if ((*((unsigned char *)g + 116) & 2) == 0) {
    return 20028;
  }
  apr_random_bytes(g, (uint64_t)random, bytes);
  return 0;
}

void *apr_random_bytes(void *result, uint64_t a2, unint64_t a3)
{
  if (a3)
  {
    int v5 = result;
    unint64_t v6 = 0;
    size_t v7 = result[12];
    do
    {
      uint64_t v8 = v5[8];
      if (v7)
      {
        size_t v9 = *(void *)(v8 + 24);
      }
      else
      {
        (*(void (**)(void))v8)();
        (*(void (**)(void))(v5[8] + 8))();
        (*(void (**)(void))(v5[8] + 16))();
        (*(void (**)(void))v5[8])();
        (*(void (**)(void, void, void))(v5[8] + 8))(v5[8], v5[9], *(void *)(v5[8] + 24));
        (*(void (**)(void))(v5[8] + 16))();
        size_t v9 = *(void *)(v5[8] + 24);
        v5[12] = v9;
        size_t v7 = v9;
      }
      if (a3 - v6 >= v7) {
        size_t v10 = v7;
      }
      else {
        size_t v10 = a3 - v6;
      }
      uint64_t result = memcpy((void *)(a2 + v6), (const void *)(v5[11] + v9 - v7), v10);
      size_t v7 = v5[12] - v10;
      v5[12] = v7;
      v6 += v10;
    }
    while (v6 < a3);
  }
  return result;
}

apr_status_t apr_random_insecure_bytes(apr_random_t *g, void *random, apr_size_t bytes)
{
  if ((*((unsigned char *)g + 116) & 1) == 0) {
    return 20028;
  }
  apr_random_bytes(g, (uint64_t)random, bytes);
  return 0;
}

void apr_random_barrier(apr_random_t *g)
{
  *((unsigned char *)g + 116) &= ~2u;
  *((_DWORD *)g + 28) = *((_DWORD *)g + 9);
}

apr_status_t apr_random_secure_ready(apr_random_t *r)
{
  if ((*((unsigned char *)r + 116) & 2) != 0) {
    return 0;
  }
  else {
    return 20028;
  }
}

apr_status_t apr_random_insecure_ready(apr_random_t *r)
{
  if (*((unsigned char *)r + 116)) {
    return 0;
  }
  else {
    return 20028;
  }
}

int apr_vformatter(int (__cdecl *flush_func)(apr_vformatter_buff_t *), apr_vformatter_buff_t *c, const char *fmt, va_list ap)
{
  int v4 = fmt;
  int v5 = c;
  unint64_t v174 = 0;
  unsigned int v172 = 0;
  unint64_t v6 = 0;
  p_n_4 = 0;
  int v8 = 0;
  v180 = 0;
  va_list v181 = ap;
  unsigned int v178 = 0;
  curpos = c->curpos;
  endpos = c->endpos;
LABEL_2:
  LOBYTE(v10) = *v4;
  while (1)
  {
LABEL_3:
    if (v10 != 37)
    {
      unint64_t v55 = endpos;
      if (!(_BYTE)v10)
      {
        v5->curpos = curpos;
        return v8;
      }
      if (curpos)
      {
        if (curpos >= endpos)
        {
          v5->curpos = curpos;
          if (((unsigned int (*)(apr_vformatter_buff_t *, uint64_t))flush_func)(v5, 10)) {
            return -1;
          }
          curpos = v5->curpos;
          unint64_t v55 = v5->endpos;
          LOBYTE(v10) = *v4;
        }
        *curpos++ = v10;
      }
      ++v8;
LABEL_426:
      endpos = v55;
      ++v4;
      goto LABEL_2;
    }
    int v12 = v4[1];
    unsigned int v11 = (char *)(v4 + 1);
    uint64_t v13 = v12;
    if (v12 < 0)
    {
      if (__maskrune(v13, 0x1000uLL))
      {
LABEL_6:
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        uint64_t v17 = 1;
        int v18 = 32;
        int v176 = 0;
        int v177 = 1;
        goto LABEL_41;
      }
    }
    else if ((_DefaultRuneLocale.__runetype[v13] & 0x1000) != 0)
    {
      goto LABEL_6;
    }
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v19 = 1;
    int v18 = 32;
    while (1)
    {
      unsigned int v20 = *v11;
      if (v20 <= 0x2A) {
        break;
      }
      switch(v20)
      {
        case '0':
          int v18 = 48;
          break;
        case '-':
          int v19 = 0;
          break;
        case '+':
          int v15 = 1;
          break;
        default:
          goto LABEL_21;
      }
LABEL_20:
      ++v11;
    }
    if (v20 == 32)
    {
      int v14 = 1;
      goto LABEL_20;
    }
    if (v20 == 35)
    {
      int v16 = 1;
      goto LABEL_20;
    }
LABEL_21:
    int v177 = v19;
    if (v20 - 48 <= 9)
    {
      unint64_t v6 = *v11 - 48;
      unsigned int v21 = *++v11;
      unsigned int v20 = v21;
      if (v21 - 48 <= 9)
      {
        do
        {
          unint64_t v6 = 10 * v6 + (char)v20 - 48;
          unsigned int v22 = *++v11;
          unsigned int v20 = v22;
        }
        while (v22 - 48 < 0xA);
      }
      goto LABEL_31;
    }
    if (v20 == 42)
    {
      char v23 = (unsigned int *)v181;
      v181 += 8;
      uint64_t v24 = *v23;
      unsigned int v25 = *++v11;
      unsigned int v20 = v25;
      int v26 = v19;
      if ((int)v24 < 0) {
        int v26 = 0;
      }
      int v177 = v26;
      unint64_t v6 = (int)v24 >= 0 ? v24 : -(int)v24;
LABEL_31:
      int v176 = 1;
    }
    else
    {
      int v176 = 0;
    }
    if (v20 == 46)
    {
      int v27 = v11[1];
      if ((v27 - 48) > 9)
      {
        uint64_t v17 = 0;
        if ((char)v27 == 42)
        {
          size_t v40 = v181;
          v181 += 8;
          v11 += 2;
          unint64_t v174 = *v40 & ~((int)*v40 >> 31);
        }
        else
        {
          unint64_t v174 = 0;
          ++v11;
        }
      }
      else
      {
        int v29 = v11[2];
        v11 += 2;
        char v28 = v29;
        unint64_t v174 = (char)v27 - 48;
        if ((v29 - 48) <= 9)
        {
          uint64_t v30 = (char)v27 - 48;
          do
          {
            int v31 = *++v11;
            uint64_t v30 = 10 * v30 + v28 - 48;
            char v28 = v31;
          }
          while ((v31 - 48) < 0xA);
          unint64_t v174 = v30;
        }
        uint64_t v17 = 0;
      }
    }
    else
    {
      uint64_t v17 = 1;
    }
LABEL_41:
    int v32 = *v11;
    BOOL v33 = v32 == 108;
    if (v32 == 108) {
      vm_address_t v34 = (unsigned __int8 *)(v11 + 1);
    }
    else {
      vm_address_t v34 = (unsigned __int8 *)v11;
    }
    if (v32 == 113)
    {
      BOOL v33 = 1;
      vm_address_t v34 = (unsigned __int8 *)(v11 + 1);
    }
    BOOL v35 = v32 == 104;
    if (v32 == 104) {
      BOOL v33 = 0;
    }
    LODWORD(v36) = v32 == 104;
    int v4 = v35 ? v11 + 1 : (const char *)v34;
    int v37 = *v4;
    if (v37 > 70) {
      break;
    }
    LOBYTE(v10) = *v4;
    if (*v4)
    {
      if (v37 == 37)
      {
        LOBYTE(v36) = 0;
        LOBYTE(v16) = 0;
        LOBYTE(v87) = 37;
LABEL_140:
        v179[0] = v87;
        uint64_t v86 = 1;
      }
      else
      {
        if (v37 == 69)
        {
LABEL_86:
          uint64_t v59 = (double *)v181;
          v181 += 8;
          long double v60 = *v59;
          int v41 = v177;
          if (fabs(*v59) == INFINITY)
          {
            LOBYTE(v36) = 0;
            LOBYTE(v16) = 0;
            v180 = (unsigned char *)(&def_CFBEC + 3);
            p_n_4 = "inf";
            int v42 = flush_func;
            goto LABEL_384;
          }
          int v61 = *(unsigned __int8 *)v4;
          if (v17) {
            int v62 = 6;
          }
          else {
            int v62 = v174;
          }
          int __n = 0;
          int v169 = v61;
          v171 = v5;
          if (v61 == 102)
          {
            int v63 = v62;
            int v64 = 0;
          }
          else
          {
            int v63 = v62 + 1;
            int v64 = 1;
          }
          apr_cvt(v63, &__n, &v178, v64, __s, v60);
          char v104 = __s[0];
          if (__s[0] < 0)
          {
            if (__maskrune(__s[0], 0x100uLL)) {
              goto LABEL_174;
            }
          }
          else if ((_DefaultRuneLocale.__runetype[__s[0]] & 0x100) != 0)
          {
LABEL_174:
            v180 = (unsigned char *)strlen(__s);
            p_n_4 = __n_5;
            __memcpy_chk();
            unsigned int v178 = 0;
            int v41 = v177;
            goto LABEL_175;
          }
          int v122 = v169;
          if (v169 == 102)
          {
            if (__n < 1)
            {
              __n_5[0] = 48;
              if (v62 < 1)
              {
                if (v16)
                {
                  char __n_6 = 46;
                  v124 = __s;
                  p_n_6 = __n_7;
                }
                else
                {
                  v124 = __s;
                  p_n_6 = &__n_6;
                }
              }
              else
              {
                char __n_6 = 46;
                p_n_6 = __n_7;
                if (__n < 0)
                {
                  uint64_t v144 = ~__n;
                  memset(__n_7, 48, v144 + 1);
                  int v122 = 102;
                  p_n_6 = &__n_5[v144 + 3];
                }
                int __n = 1;
                v124 = __s;
              }
            }
            else
            {
              uint64_t v123 = __n;
              memcpy(__n_5, __s, __n);
              v124 = &__s[v123];
              p_n_6 = &__n_5[v123];
              int __n = -1;
              if (v16 || v62 > 0)
              {
                char *p_n_6 = 46;
                p_n_6 = &__n_7[(v123 - 1)];
              }
              int v122 = 102;
            }
          }
          else
          {
            __n_5[0] = v104;
            if (v16 || (p_n_6 = &__n_6, v124 = &__s[1], v62 >= 1))
            {
              char __n_6 = 46;
              p_n_6 = __n_7;
              v124 = &__s[1];
            }
          }
          char v153 = *v124;
          if (*v124)
          {
            v154 = (unsigned __int8 *)(v124 + 1);
            do
            {
              *p_n_6++ = v153;
              int v155 = *v154++;
              char v153 = v155;
            }
            while (v155);
          }
          p_n_4 = __n_5;
          if (v122 != 102)
          {
            char *p_n_6 = v122;
            int v156 = __n;
            int v157 = --__n;
            if (__n)
            {
              if (v157 >= 0) {
                unsigned int v158 = v157;
              }
              else {
                unsigned int v158 = -v157;
              }
              uint64_t v159 = -1;
              v160 = v188;
              do
              {
                uint64_t v161 = v159;
                *--v160 = v158 % 0xA + 48;
                --v159;
                BOOL v79 = v158 > 9;
                v158 /= 0xAu;
              }
              while (v79);
              if (v156 <= 0) {
                char v162 = 45;
              }
              else {
                char v162 = 43;
              }
              v163 = p_n_6 + 2;
              p_n_6[1] = v162;
              v164 = (unsigned char *)(v188 - v160);
              if (v164)
              {
                if (v164 == (unsigned char *)&def_CFBEC + 1)
                {
                  v163 = p_n_6 + 3;
                  p_n_6[2] = 48;
                }
                do
                {
                  *v163++ = v188[v161];
                  BOOL v68 = __CFADD__(v161++, 1);
                }
                while (!v68);
              }
            }
            else
            {
              *(_WORD *)(p_n_6 + 1) = 12331;
              v163 = p_n_6 + 4;
              p_n_6[3] = 48;
            }
            p_n_6 = v163;
          }
          v180 = (unsigned char *)(p_n_6 - __n_5);
          int v41 = v177;
          if (v178)
          {
            int v103 = 45;
LABEL_379:
            int v42 = flush_func;
            goto LABEL_380;
          }
LABEL_175:
          if (v15) {
            int v103 = 43;
          }
          else {
            int v103 = 32 * (v14 != 0);
          }
          goto LABEL_379;
        }
LABEL_137:
        LOBYTE(v36) = 0;
        LOBYTE(v16) = 0;
        v179[0] = 37;
        v179[1] = *v4;
        uint64_t v86 = 2;
      }
      v180 = (unsigned char *)v86;
      p_n_4 = v179;
LABEL_142:
      int v18 = 32;
LABEL_297:
      int v42 = flush_func;
LABEL_313:
      int v41 = v177;
      goto LABEL_384;
    }
  }
  switch(*v4)
  {
    case 'c':
      LOBYTE(v36) = 0;
      LOBYTE(v16) = 0;
      uint64_t v88 = v181;
      v181 += 8;
      int v87 = *v88;
      goto LABEL_140;
    case 'd':
    case 'i':
      if (v33)
      {
        uint64_t v69 = (unint64_t *)v181;
        v181 += 8;
        uint64_t v70 = v17;
        uint64_t v71 = conv_10_quad(*v69, 0, &v178, (uint64_t)&v187[3], &v180);
        uint64_t v17 = v70;
        p_n_4 = (char *)v71;
        if (v70) {
          goto LABEL_169;
        }
LABEL_165:
        unint64_t v102 = 511;
        if (v174 + 1 < 0x200) {
          unint64_t v102 = v174;
        }
        for (; (unint64_t)v180 < v102; ++v180)
          *--p_n_4 = 48;
        goto LABEL_169;
      }
      long long v98 = (unsigned int *)v181;
      v181 += 8;
      unsigned int v99 = *v98;
      if (v36) {
        unsigned int v100 = (__int16)v99;
      }
      else {
        unsigned int v100 = v99;
      }
      unsigned int v101 = v100 >> 31;
      if ((v100 & 0x80000000) != 0) {
        unsigned int v100 = -v100;
      }
      unsigned int v178 = v101;
      p_n_4 = &v187[3];
      do
      {
        *--p_n_4 = v100 % 0xA + 48;
        BOOL v79 = v100 > 9;
        v100 /= 0xAu;
      }
      while (v79);
      v180 = (unsigned char *)(&v187[3] - p_n_4);
      if ((v17 & 1) == 0) {
        goto LABEL_165;
      }
LABEL_169:
      v171 = v5;
      if (v178)
      {
        int v103 = 45;
      }
      else if (v15)
      {
        int v103 = 43;
      }
      else
      {
        int v103 = 32 * (v14 != 0);
      }
      int v42 = flush_func;
LABEL_348:
      int v41 = v177;
      break;
    case 'e':
    case 'f':
      goto LABEL_86;
    case 'g':
      goto LABEL_104;
    case 'h':
    case 'j':
    case 'k':
    case 'l':
    case 'm':
    case 'q':
    case 'r':
    case 't':
    case 'v':
    case 'w':
      goto LABEL_137;
    case 'n':
      if (v33)
      {
        LOBYTE(v36) = 0;
        unsigned int v89 = (void **)v181;
        v181 += 8;
        *void *v89 = v8;
      }
      else if (v36)
      {
        LOBYTE(v36) = 0;
        v126 = (_WORD **)v181;
        v181 += 8;
        _WORD **v126 = v8;
      }
      else
      {
        v142 = (_DWORD **)v181;
        v181 += 8;
        _DWORD **v142 = v8;
      }
      LOBYTE(v16) = 1;
      goto LABEL_297;
    case 'o':
      if (v33)
      {
        int v90 = (unint64_t *)v181;
        v181 += 8;
        unint64_t v91 = *v90;
        long long v92 = "0123456789abcdef";
        if (*v4 == 88) {
          long long v92 = "0123456789ABCDEF";
        }
        if (HIDWORD(v91))
        {
          p_n_4 = &v187[3];
          int v42 = flush_func;
          do
          {
            *--p_n_4 = v92[v91 & 7];
            BOOL v68 = v91 >= 8;
            v91 >>= 3;
          }
          while (v68);
        }
        else
        {
          p_n_4 = &v187[3];
          int v42 = flush_func;
          do
          {
            *--p_n_4 = v92[v91 & 7];
            BOOL v68 = v91 >= 8;
            LODWORD(v91) = v91 >> 3;
          }
          while (v68);
        }
      }
      else
      {
        v127 = (unsigned int *)v181;
        v181 += 8;
        unsigned int v128 = *v127;
        if (v36) {
          unsigned int v128 = (unsigned __int16)v128;
        }
        v129 = "0123456789abcdef";
        if (*v4 == 88) {
          v129 = "0123456789ABCDEF";
        }
        unsigned int v172 = v128;
        p_n_4 = &v187[3];
        do
        {
          *--p_n_4 = v129[v128 & 7];
          BOOL v79 = v128 > 7;
          v128 >>= 3;
        }
        while (v79);
        int v42 = flush_func;
      }
      int v41 = v177;
      v180 = (unsigned char *)(&v187[3] - p_n_4);
      if ((v17 & 1) == 0)
      {
        unint64_t v141 = 511;
        if (v174 + 1 < 0x200) {
          unint64_t v141 = v174;
        }
        if (&v187[3] - p_n_4 >= v141)
        {
          int v41 = v177;
        }
        else
        {
          int v41 = v177;
          do
          {
            *--p_n_4 = 48;
            ++v180;
          }
          while ((unint64_t)v180 < v141);
        }
      }
      if (!v16)
      {
        LOBYTE(v36) = 0;
        goto LABEL_384;
      }
      if (*p_n_4 == 48) {
        goto LABEL_301;
      }
      LOBYTE(v36) = 0;
      LOBYTE(v16) = 0;
      *--p_n_4 = 48;
      v136 = v180 + 1;
      goto LABEL_304;
    case 'p':
      int v39 = *++v4;
      int v38 = v39;
      int v10 = v39;
      if (!v39) {
        goto LABEL_3;
      }
      if (v38 <= 83)
      {
        int v41 = v177;
        int v42 = flush_func;
        fmt = (unsigned char *)(&stru_B8 + 62);
        switch(v38)
        {
          case 'A':
            unint64_t v43 = (unsigned int **)v181;
            v181 += 8;
            unint64_t v36 = *v43;
            if (!v36) {
              goto LABEL_211;
            }
            unsigned int v44 = bswap32(*v36);
            unsigned int v45 = v44;
            apr_vformatter_buff_t v46 = v187;
            vm_address_t v47 = &v187[2];
            CFUUIDRef v48 = &v187[4];
            do
            {
              uint64_t v49 = v47;
              uint64_t v50 = v46;
              *(v48 - 2) = v45 % 0xA + 48;
              --v48;
              --v47;
              --v46;
              BOOL v79 = v45 > 9;
              v45 /= 0xAu;
            }
            while (v79);
            *(v48 - 2) = 46;
            unsigned int v51 = BYTE1(v44);
            do
            {
              int v52 = v50;
              *(v49 - 2) = v51 % 0xA + 48;
              --v49;
              --v50;
              BOOL v79 = v51 > 9;
              v51 /= 0xAu;
            }
            while (v79);
            *(v49 - 2) = 46;
            unsigned int v53 = BYTE2(v44);
            do
            {
              *(v52 - 2) = v53 % 0xA + 48;
              --v52;
              BOOL v79 = v53 > 9;
              v53 /= 0xAu;
            }
            while (v79);
            *(v52 - 2) = 46;
            p_n_4 = v52 - 2;
            unsigned int v54 = HIBYTE(v44);
            do
            {
              *--p_n_4 = v54 % 0xA + 48;
              BOOL v79 = v54 > 9;
              v54 /= 0xAu;
            }
            while (v79);
            goto LABEL_307;
          case 'B':
          case 'F':
            goto LABEL_191;
          case 'C':
          case 'D':
          case 'E':
          case 'G':
          case 'H':
            goto LABEL_202;
          case 'I':
            v114 = (unsigned int **)v181;
            v181 += 8;
            unint64_t v36 = *v114;
            if (!v36) {
              goto LABEL_211;
            }
            LOBYTE(v36) = 0;
            LOBYTE(v16) = 0;
            p_n_4 = 0;
            v115 = v180;
            unint64_t v116 = v174;
            if (v174 >= (unint64_t)v180) {
              int v117 = 1;
            }
            else {
              int v117 = v17;
            }
            goto LABEL_207;
          default:
            int v42 = flush_func;
            if (v38 != 83) {
              goto LABEL_202;
            }
LABEL_191:
            if (v10 == 66)
            {
              long long v108 = (unsigned int **)v181;
              v181 += 8;
              long long v109 = *v108;
              if (v109)
              {
                apr_off_t v110 = *v109;
                goto LABEL_197;
              }
            }
            else
            {
              v111 = (apr_off_t **)v181;
              v181 += 8;
              v112 = *v111;
              if (v112)
              {
                apr_off_t v110 = *v112;
                goto LABEL_197;
              }
            }
            apr_off_t v110 = 0;
LABEL_197:
            p_n_4 = __s;
            apr_strfsize(v110, __s);
            size_t v113 = strlen(__s);
            LOBYTE(v36) = 0;
            LOBYTE(v16) = 0;
            v180 = (unsigned char *)v113;
            int v18 = 32;
            break;
        }
        goto LABEL_313;
      }
      int v41 = v177;
      if (v38 <= 111)
      {
        if (v38 == 84)
        {
          v118 = (unsigned int **)v181;
          v181 += 8;
          unint64_t v36 = *v118;
          int v42 = flush_func;
          if (!v36)
          {
LABEL_211:
            LOBYTE(v16) = 0;
            v180 = (unsigned char *)(&dword_4 + 2);
            int v18 = 32;
            p_n_4 = "(null)";
            goto LABEL_384;
          }
          int v119 = v17;
          p_n_4 = (char *)conv_10_quad(*(void *)v36, 1, __s, (uint64_t)&v187[3], &v180);
          LOBYTE(v36) = 0;
          LOBYTE(v16) = 0;
          v115 = v180;
          unint64_t v116 = v174;
          if (v174 >= (unint64_t)v180) {
            int v117 = 1;
          }
          else {
            int v117 = v119;
          }
LABEL_207:
          BOOL v35 = v117 == 0;
          int v41 = v177;
          if (v35) {
            v115 = (unsigned char *)v116;
          }
          v180 = v115;
        }
        else
        {
          int v42 = flush_func;
          if (v38 != 109) {
            goto LABEL_202;
          }
          uint64_t v56 = (apr_status_t **)v181;
          v181 += 8;
          uint64_t v57 = *v56;
          if (v57)
          {
            p_n_4 = &__n_4;
            apr_strerror(*v57, &__n_4, 0x1FFuLL);
            size_t v58 = strlen(&__n_4);
            int v41 = v177;
          }
          else
          {
            size_t v58 = 6;
            p_n_4 = "(null)";
          }
          LOBYTE(v36) = 0;
          LOBYTE(v16) = 0;
          v180 = (unsigned char *)v58;
        }
LABEL_352:
        int v18 = 32;
        goto LABEL_384;
      }
      if (v38 == 116)
      {
        v120 = (unsigned int **)v181;
        v181 += 8;
        unint64_t v36 = *v120;
        int v42 = flush_func;
        if (!v36)
        {
          LOBYTE(v16) = 0;
          v180 = (unsigned char *)(&dword_4 + 2);
          int v18 = 32;
          p_n_4 = "(null)";
          goto LABEL_313;
        }
        unint64_t v121 = *(void *)v36;
        if (HIDWORD(v121))
        {
          p_n_4 = &v187[3];
          do
          {
            *--p_n_4 = conv_p2_low_digits[v121 & 0xF];
            BOOL v79 = v121 > 0xF;
            v121 >>= 4;
          }
          while (v79);
        }
        else
        {
          p_n_4 = &v187[3];
          do
          {
            *--p_n_4 = conv_p2_low_digits[v121 & 0xF];
            BOOL v68 = v121 >= 0x10;
            LODWORD(v121) = v121 >> 4;
          }
          while (v68);
        }
LABEL_307:
        LOBYTE(v36) = 0;
        LOBYTE(v16) = 0;
        v137 = (unsigned char *)(&v187[3] - p_n_4);
        if (v174 >= &v187[3] - p_n_4) {
          int v143 = 1;
        }
        else {
          int v143 = v17;
        }
        if (!v143) {
          v137 = (unsigned char *)v174;
        }
      }
      else
      {
        int v42 = flush_func;
        if (v38 != 112)
        {
LABEL_202:
          LOBYTE(v36) = 0;
          LOBYTE(v16) = 0;
          v180 = (unsigned char *)&dword_8;
          v181 += 8;
          p_n_4 = "bogus %p";
          goto LABEL_384;
        }
        uint64_t v84 = (unint64_t *)v181;
        v181 += 8;
        unint64_t v85 = *v84;
        if (HIDWORD(v85))
        {
          p_n_4 = &v187[3];
          do
          {
            *--p_n_4 = conv_p2_low_digits[v85 & 0xF];
            BOOL v79 = v85 > 0xF;
            v85 >>= 4;
          }
          while (v79);
        }
        else
        {
          p_n_4 = &v187[3];
          do
          {
            *--p_n_4 = conv_p2_low_digits[v85 & 0xF];
            BOOL v68 = v85 >= 0x10;
            LODWORD(v85) = v85 >> 4;
          }
          while (v68);
        }
        LOBYTE(v36) = 0;
        LOBYTE(v16) = 0;
        v137 = (unsigned char *)(&v187[3] - p_n_4);
      }
      v180 = v137;
      int v18 = 32;
      goto LABEL_313;
    case 's':
      long long v93 = (const char **)v181;
      v181 += 8;
      p_n_4 = (char *)*v93;
      if (!*v93)
      {
        LOBYTE(v36) = 0;
        LOBYTE(v16) = 0;
        v180 = (unsigned char *)(&dword_4 + 2);
        int v18 = 32;
        p_n_4 = "(null)";
        goto LABEL_297;
      }
      if (v17)
      {
        size_t v94 = strlen(*v93);
        LOBYTE(v36) = 0;
        LOBYTE(v16) = 0;
        v180 = (unsigned char *)v94;
        goto LABEL_142;
      }
      v180 = 0;
      int v42 = flush_func;
      LOBYTE(v36) = v174;
      int v41 = v177;
      if (v174)
      {
        uint64_t v140 = 0;
        while (p_n_4[v140])
        {
          v180 = (unsigned char *)++v140;
          int v18 = 32;
          if (v174 == v140)
          {
LABEL_301:
            LOBYTE(v36) = 0;
            LOBYTE(v16) = 0;
            goto LABEL_384;
          }
        }
        LOBYTE(v36) = 0;
      }
      else
      {
        unint64_t v174 = 0;
      }
      LOBYTE(v16) = 0;
      goto LABEL_352;
    case 'u':
      if (v33)
      {
        v95 = (unint64_t *)v181;
        v181 += 8;
        uint64_t v96 = v17;
        uint64_t v97 = conv_10_quad(*v95, 1, &v178, (uint64_t)&v187[3], &v180);
        uint64_t v17 = v96;
        p_n_4 = (char *)v97;
      }
      else
      {
        v130 = (unsigned int *)v181;
        v181 += 8;
        unsigned int v131 = *v130;
        if (v36) {
          unsigned int v132 = (unsigned __int16)v131;
        }
        else {
          unsigned int v132 = v131;
        }
        unsigned int v178 = 0;
        p_n_4 = &v187[3];
        do
        {
          *--p_n_4 = v132 % 0xA + 48;
          BOOL v79 = v132 > 9;
          v132 /= 0xAu;
        }
        while (v79);
        v180 = (unsigned char *)(&v187[3] - p_n_4);
      }
      int v42 = flush_func;
      if (v17)
      {
        LOBYTE(v36) = 0;
        LOBYTE(v16) = 0;
      }
      else
      {
        unint64_t v133 = 511;
        if (v174 + 1 < 0x200) {
          unint64_t v133 = v174;
        }
        for (; (unint64_t)v180 < v133; ++v180)
          *--p_n_4 = 48;
        LOBYTE(v36) = 0;
        LOBYTE(v16) = 0;
      }
      goto LABEL_313;
    case 'x':
      goto LABEL_94;
    default:
      if (v37 == 71)
      {
LABEL_104:
        v171 = v5;
        uint64_t v72 = v174;
        if (v174 <= 1) {
          uint64_t v72 = 1;
        }
        if (v17) {
          uint64_t v73 = 6;
        }
        else {
          uint64_t v73 = v72;
        }
        int v74 = v181;
        v181 += 8;
        long double v75 = *(double *)v74;
        *(_DWORD *)&v187[3] = 0;
        int __n = 0;
        apr_cvt(v73, &__n, &v187[3], 1, __s, v75);
        uint64_t v76 = __n_5;
        if (*(_DWORD *)&v187[3])
        {
          __n_5[0] = 45;
          uint64_t v76 = &__n_6;
        }
        unint64_t v174 = v73;
        if ((int)v73 >= 2)
        {
          uint64_t v73 = v73;
          do
          {
            uint64_t v77 = v73 - 1;
            if (__s[(v73 - 1)] != 48) {
              goto LABEL_116;
            }
            --v73;
          }
          while ((unint64_t)(v77 + 1) > 2);
          LODWORD(v73) = 1;
        }
LABEL_116:
        int v78 = __n;
        BOOL v79 = __n < 0 || __n - (int)v73 <= 4;
        int v80 = !v79;
        if (__n >= -3 && v80 == 0)
        {
          if (__n <= 0)
          {
            if (__s[0] != 48) {
              *v76++ = 46;
            }
            if (v78 < 0)
            {
              do
              {
                int __n = v78 + 1;
                *v76++ = 48;
                int v78 = __n;
              }
              while (__n < 0);
            }
            else
            {
              int v78 = 0;
            }
          }
          if ((int)v73 >= 1)
          {
            uint64_t v145 = 0;
            do
            {
              *uint64_t v76 = __s[v145];
              if (v145 + 1 == __n)
              {
                v76[1] = 46;
                v76 += 2;
              }
              else
              {
                ++v76;
              }
              ++v145;
            }
            while ((v73 - 1) + 1 != v145);
            int v78 = __n;
          }
          if ((int)v73 < v78)
          {
            do
            {
              v146 = v76;
              LODWORD(v73) = v73 + 1;
              *v76++ = 48;
            }
            while ((int)v73 < __n);
            *uint64_t v76 = 46;
            uint64_t v76 = v146 + 2;
          }
        }
        else
        {
          --__n;
          *uint64_t v76 = __s[0];
          unint64_t v82 = v76 + 2;
          v76[1] = 46;
          if ((int)v73 > 1)
          {
            int v170 = v78;
            memcpy(v82, &__s[1], (v73 - 1));
            int v78 = v170;
            unint64_t v82 = &v76[(v73 - 2) + 3];
          }
          *unint64_t v82 = 101;
          if (v78 < 1)
          {
            int __n = 1 - v78;
            char v83 = 45;
          }
          else
          {
            char v83 = 43;
          }
          v82[1] = v83;
          int v138 = __n;
          if (__n < 100)
          {
            v139 = v82 + 2;
          }
          else
          {
            v139 = v82 + 3;
            v82[2] = __n / 0x64u + 48;
            int v138 = __n;
          }
          if (v138 >= 10)
          {
            *v139++ = ((103 * (v138 % 0x64u)) >> 10) | 0x30;
            int v138 = __n;
          }
          unsigned char *v139 = v138 % 10 + 48;
          uint64_t v76 = v139 + 1;
        }
        v147 = v76 - 1;
        if (*(v76 - 1) != 46 || v16 != 0) {
          v147 = v76;
        }
        char *v147 = 0;
        int v149 = 32 * (v14 != 0);
        if (v15) {
          int v149 = 43;
        }
        if (__n_5[0] == 45) {
          int v103 = 45;
        }
        else {
          int v103 = v149;
        }
        if (__n_5[0] == 45) {
          p_n_4 = &__n_6;
        }
        else {
          p_n_4 = __n_5;
        }
        size_t v150 = strlen(p_n_4);
        v180 = (unsigned char *)v150;
        if (v16)
        {
          size_t v151 = v150;
          if (!strchr(p_n_4, 46))
          {
            v180 = (unsigned char *)(v151 + 1);
            *(_WORD *)&p_n_4[v151] = 46;
          }
        }
        int v42 = flush_func;
        if (*v4 == 71)
        {
          v152 = strchr(p_n_4, 101);
          if (v152) {
            char *v152 = 69;
          }
        }
        goto LABEL_348;
      }
      if (v37 != 88) {
        goto LABEL_137;
      }
LABEL_94:
      if (v33)
      {
        uint64_t v65 = (unint64_t *)v181;
        v181 += 8;
        unint64_t v66 = *v65;
        uint64_t v67 = "0123456789abcdef";
        if (*v4 == 88) {
          uint64_t v67 = "0123456789ABCDEF";
        }
        if (HIDWORD(v66))
        {
          p_n_4 = &v187[3];
          int v42 = flush_func;
          do
          {
            *--p_n_4 = v67[v66 & 0xF];
            BOOL v68 = v66 >= 0x10;
            v66 >>= 4;
          }
          while (v68);
        }
        else
        {
          p_n_4 = &v187[3];
          int v42 = flush_func;
          do
          {
            *--p_n_4 = v67[v66 & 0xF];
            BOOL v68 = v66 >= 0x10;
            LODWORD(v66) = v66 >> 4;
          }
          while (v68);
        }
      }
      else
      {
        v105 = (unsigned int *)v181;
        v181 += 8;
        unsigned int v106 = *v105;
        if (v36) {
          unsigned int v106 = (unsigned __int16)v106;
        }
        long long v107 = "0123456789abcdef";
        if (*v4 == 88) {
          long long v107 = "0123456789ABCDEF";
        }
        unsigned int v172 = v106;
        p_n_4 = &v187[3];
        do
        {
          *--p_n_4 = v107[v106 & 0xF];
          BOOL v79 = v106 > 0xF;
          v106 >>= 4;
        }
        while (v79);
        int v42 = flush_func;
      }
      v180 = (unsigned char *)(&v187[3] - p_n_4);
      if (v17) {
        goto LABEL_259;
      }
      unint64_t v134 = 511;
      if (v174 + 1 < 0x200) {
        unint64_t v134 = v174;
      }
      if (&v187[3] - p_n_4 >= v134)
      {
LABEL_259:
        int v41 = v177;
      }
      else
      {
        int v41 = v177;
        do
        {
          *--p_n_4 = 48;
          ++v180;
        }
        while ((unint64_t)v180 < v134);
      }
      LOBYTE(v36) = 0;
      if (v16 && v172)
      {
        LOBYTE(v36) = 0;
        LOBYTE(v16) = 0;
        char v135 = *v4;
        *(p_n_4 - 2) = 48;
        p_n_4 -= 2;
        p_n_4[1] = v135;
        v136 = v180 + 2;
LABEL_304:
        v180 = v136;
      }
      else
      {
        LOBYTE(v16) = 0;
      }
      goto LABEL_384;
  }
LABEL_380:
  LOBYTE(v16) = 0;
  LOBYTE(v36) = v103 != 0;
  if (v103 && p_n_4 != "(null)")
  {
    LOBYTE(v16) = 0;
    *--p_n_4 = v103;
    ++v180;
    LOBYTE(v36) = 1;
  }
  int v5 = v171;
LABEL_384:
  unint64_t v165 = (unint64_t)v180;
  if (!v176)
  {
    unint64_t v55 = endpos;
LABEL_405:
    if (v165) {
      char v167 = v16;
    }
    else {
      char v167 = 1;
    }
    if ((v167 & 1) == 0)
    {
      v8 += v165;
      do
      {
        if (curpos)
        {
          if (curpos >= v55)
          {
            v5->curpos = curpos;
            if (((unsigned int (*)(apr_vformatter_buff_t *, uint64_t, const char *, uint64_t))v42)(v5, 10, fmt, v17))
            {
              return -1;
            }
            curpos = v5->curpos;
            unint64_t v55 = v5->endpos;
          }
          *curpos++ = *p_n_4;
        }
        ++p_n_4;
        --v165;
      }
      while (v165);
      unint64_t v165 = (unint64_t)v180;
    }
    if (v176 && !v177)
    {
      while (v6 > v165)
      {
        if (curpos)
        {
          if (curpos >= v55)
          {
            v5->curpos = curpos;
            if (((unsigned int (*)(apr_vformatter_buff_t *, uint64_t, const char *, uint64_t))v42)(v5, 10, fmt, v17))
            {
              return -1;
            }
            curpos = v5->curpos;
            unint64_t v55 = v5->endpos;
          }
          *curpos++ = v18;
          unint64_t v165 = (unint64_t)v180;
        }
        ++v8;
        --v6;
      }
    }
    goto LABEL_426;
  }
  BOOL v35 = v41 == 1;
  unint64_t v55 = endpos;
  if (!v35 || v6 <= (unint64_t)v180) {
    goto LABEL_405;
  }
  char v166 = v36 ^ 1;
  if (v18 != 48) {
    char v166 = 1;
  }
  if (v166)
  {
    do
    {
LABEL_397:
      if (curpos)
      {
        if (curpos >= v55)
        {
          v5->curpos = curpos;
          if (((unsigned int (*)(apr_vformatter_buff_t *, uint64_t, const char *, uint64_t))v42)(v5, 10, fmt, v17))
          {
            return -1;
          }
          curpos = v5->curpos;
          unint64_t v55 = v5->endpos;
        }
        *curpos++ = v18;
        unint64_t v165 = (unint64_t)v180;
      }
      ++v8;
      --v6;
    }
    while (v6 > v165);
    goto LABEL_405;
  }
  if (!curpos) {
    goto LABEL_396;
  }
  if (curpos < endpos) {
    goto LABEL_395;
  }
  v5->curpos = curpos;
  if (!((unsigned int (*)(apr_vformatter_buff_t *, uint64_t, const char *, uint64_t))v42)(v5, 10, fmt, v17))
  {
    curpos = v5->curpos;
    unint64_t v55 = v5->endpos;
LABEL_395:
    *curpos++ = *p_n_4;
    unint64_t v165 = (unint64_t)v180;
LABEL_396:
    ++v8;
    ++p_n_4;
    v180 = (unsigned char *)--v165;
    --v6;
    goto LABEL_397;
  }
  return -1;
}

uint64_t conv_10_quad(unint64_t a1, int a2, _DWORD *a3, uint64_t a4, void *a5)
{
  if ((HIDWORD(a1) || !a2) && (a1 != (int)a1 || a2))
  {
    if ((a1 & 0x8000000000000000) == 0) {
      uint64_t v10 = a1;
    }
    else {
      uint64_t v10 = -(uint64_t)a1;
    }
    if (a2) {
      int v11 = 0;
    }
    else {
      int v11 = a1 >> 63;
    }
    if (a2) {
      unint64_t v12 = a1;
    }
    else {
      unint64_t v12 = v10;
    }
    *a3 = v11;
    uint64_t result = a4;
    do
    {
      *(unsigned char *)--uint64_t result = v12 % 0xA + 48;
      BOOL v13 = v12 > 9;
      v12 /= 0xAuLL;
    }
    while (v13);
  }
  else
  {
    if ((a1 & 0x80000000) == 0) {
      int v5 = a1;
    }
    else {
      int v5 = -(int)a1;
    }
    if (a2) {
      int v6 = 0;
    }
    else {
      int v6 = (a1 >> 31) & 1;
    }
    if (a2) {
      unsigned int v7 = a1;
    }
    else {
      unsigned int v7 = v5;
    }
    *a3 = v6;
    uint64_t result = a4;
    do
    {
      *(unsigned char *)--uint64_t result = v7 % 0xA + 48;
      BOOL v9 = v7 >= 0xA;
      v7 /= 0xAu;
    }
    while (v9);
  }
  *a5 = a4 - result;
  return result;
}

char *apr_cvt(int a1, int *a2, _DWORD *a3, int a4, char *a5, long double a6)
{
  if (a1 >= 78) {
    int v9 = 78;
  }
  else {
    int v9 = a1;
  }
  *a3 = 0;
  if (a6 < 0.0)
  {
    *a3 = 1;
    a6 = -a6;
  }
  double v31 = 0.0;
  double __y = 0.0;
  double v10 = modf(a6, &__y);
  double v11 = v10;
  double v12 = __y;
  if (__y == 0.0)
  {
    if (v10 > 0.0)
    {
      int v13 = 1;
      do
      {
        double v21 = v11;
        double v11 = v11 * 10.0;
        --v13;
      }
      while (v11 < 1.0);
      unint64_t v19 = 0;
      double v31 = v11;
      double v11 = v21;
      goto LABEL_20;
    }
    int v13 = 0;
  }
  else
  {
    int v13 = 0;
    uint64_t v14 = 80;
    uint64_t v15 = 1;
    do
    {
      uint64_t v16 = v14;
      uint64_t v17 = v15;
      double v18 = modf(v12 / 10.0, &__y);
      ++v13;
      uint64_t v14 = v16 - 1;
      a5[v16 - 1] = (int)((v18 + 0.03) * 10.0) + 48;
      if (v16 == 1) {
        break;
      }
      double v12 = __y;
      uint64_t v15 = v17 + 1;
    }
    while (__y != 0.0);
    double v31 = v18;
    if (v16 <= 80)
    {
      unint64_t v19 = 81 - v16;
      unsigned int v20 = a5;
      do
      {
        *unsigned int v20 = v20[v14];
        ++v20;
        --v17;
      }
      while (v17);
      goto LABEL_20;
    }
  }
  unint64_t v19 = 0;
LABEL_20:
  if (a4) {
    int v22 = 0;
  }
  else {
    int v22 = v13;
  }
  uint64_t v23 = v22 + (uint64_t)v9;
  if (v23 < 0)
  {
    *a2 = -v9;
    int v27 = a5;
  }
  else
  {
    *a2 = v13;
    if ((uint64_t)v19 <= v23 && v19 <= 0x4F)
    {
      do
      {
        double v11 = modf(v11 * 10.0, &v31);
        a5[v19] = (int)v31 + 48;
        if ((uint64_t)v19 >= v23) {
          break;
        }
      }
      while (v19++ < 0x4F);
    }
    if (v23 >= 80)
    {
      int v27 = a5 + 79;
    }
    else
    {
      unsigned int v25 = &a5[v23];
      int v26 = (char)(a5[v23] + 5);
      a5[v23] += 5;
      if (v26 < 58)
      {
        int v27 = &a5[v23];
      }
      else
      {
        int v27 = &a5[v23];
        do
        {
          char *v25 = 48;
          if (v25 <= a5)
          {
            char *v25 = 49;
            ++*a2;
            if (!a4)
            {
              if (v27 > a5) {
                char *v27 = 48;
              }
              ++v27;
            }
            char v29 = *v25;
          }
          else
          {
            char v28 = *--v25;
            char v29 = v28 + 1;
            char *v25 = v28 + 1;
          }
        }
        while (v29 > 57);
      }
    }
  }
  char *v27 = 0;
  return a5;
}

int apr_snprintf(char *buf, apr_size_t len, const char *format, ...)
{
  va_start(va, format);
  int v4 = &buf[len - 1];
  if (len) {
    int v5 = buf;
  }
  else {
    int v5 = 0;
  }
  if (!len) {
    int v4 = 0;
  }
  c.curpos = v5;
  c.endpos = v4;
  va_copy(v8, va);
  int result = apr_vformatter((int (__cdecl *)(apr_vformatter_buff_t *))snprintf_flush, &c, format, va);
  if (len) {
    *c.curpos = 0;
  }
  if (result == -1) {
    return len - 1;
  }
  return result;
}

uint64_t snprintf_flush()
{
  return 0xFFFFFFFFLL;
}

int apr_vsnprintf(char *buf, apr_size_t len, const char *format, va_list ap)
{
  int v4 = len;
  if (len)
  {
    v6.curpos = buf;
    v6.endpos = &buf[len - 1];
    int result = apr_vformatter((int (__cdecl *)(apr_vformatter_buff_t *))snprintf_flush, &v6, format, ap);
    *v6.curpos = 0;
  }
  else
  {
    v6.curpos = 0;
    v6.endpos = 0;
    int result = apr_vformatter((int (__cdecl *)(apr_vformatter_buff_t *))snprintf_flush, &v6, format, ap);
  }
  if (result == -1) {
    return v4 - 1;
  }
  return result;
}

char *__cdecl apr_pstrdup(apr_pool_t *p, const char *s)
{
  if (!s) {
    return 0;
  }
  apr_size_t v4 = strlen(s) + 1;
  int v5 = apr_palloc(p, v4);
  memcpy(v5, s, v4);
  return (char *)v5;
}

void *__cdecl apr_pmemdup(apr_pool_t *p, const void *m, apr_size_t n)
{
  if (!m) {
    return 0;
  }
  int v5 = apr_palloc(p, n);
  memcpy(v5, m, n);
  return v5;
}

char *__cdecl apr_pstrndup(apr_pool_t *p, const char *s, apr_size_t n)
{
  if (!s) {
    return 0;
  }
  apr_size_t v3 = n;
  apr_vformatter_buff_t v6 = memchr((void *)s, 0, n);
  if (v6) {
    apr_size_t v3 = v6 - s;
  }
  unsigned int v7 = apr_palloc(p, v3 + 1);
  memcpy(v7, s, v3);
  *((unsigned char *)v7 + v3) = 0;
  return (char *)v7;
}

char *__cdecl apr_pstrmemdup(apr_pool_t *p, const char *s, apr_size_t n)
{
  if (!s) {
    return 0;
  }
  int v5 = apr_palloc(p, n + 1);
  memcpy(v5, s, n);
  *((unsigned char *)v5 + n) = 0;
  return (char *)v5;
}

char *apr_pstrcat(apr_pool_t *p, ...)
{
  va_start(va, p);
  __s = va_arg(va, char *);
  memset(v18, 0, sizeof(v18));
  va_copy(v16, va);
  uint64_t v2 = __s;
  if (__s)
  {
    uint64_t v3 = 0;
    int v4 = 0;
    int v5 = __s;
    do
    {
      size_t v6 = strlen(v5);
      if (v4 <= 5) {
        *((void *)v18 + v4++) = v6;
      }
      v3 += v6;
      unsigned int v7 = va_arg(v16, const char *);
      int v5 = v7;
    }
    while (v7);
    apr_size_t v8 = v3 + 1;
  }
  else
  {
    apr_size_t v8 = 1;
  }
  int v9 = (char *)apr_palloc(p, v8);
  double v10 = v9;
  va_copy(v17, va);
  double v11 = v9;
  if (__s)
  {
    int v12 = 0;
    double v11 = v9;
    do
    {
      if (v12 > 5) {
        size_t v13 = strlen(v2);
      }
      else {
        size_t v13 = *((void *)v18 + v12++);
      }
      memcpy(v11, v2, v13);
      v11 += v13;
      uint64_t v14 = (const char **)v17;
      v17 += 8;
      uint64_t v2 = *v14;
    }
    while (*v14);
  }
  *double v11 = 0;
  return v10;
}

char *__cdecl apr_pstrcatv(apr_pool_t *p, const iovec *vec, apr_size_t nvec, apr_size_t *nbytes)
{
  apr_size_t v4 = nvec;
  int v5 = vec;
  apr_size_t v6 = 0;
  if (nvec)
  {
    p_iov_len = &vec->iov_len;
    apr_size_t v8 = nvec;
    do
    {
      size_t v9 = *p_iov_len;
      p_iov_len += 2;
      v6 += v9;
      --v8;
    }
    while (v8);
  }
  if (nbytes) {
    *nbytes = v6;
  }
  double v10 = (char *)apr_palloc(p, v6 + 1);
  double v11 = v10;
  int v12 = v10;
  if (v4)
  {
    int v12 = v10;
    do
    {
      memcpy(v12, v5->iov_base, v5->iov_len);
      v12 += v5->iov_len;
      ++v5;
      --v4;
    }
    while (v4);
  }
  *int v12 = 0;
  return v11;
}

apr_status_t apr_strtoff(apr_off_t *offset, const char *buf, char **end, int base)
{
  *__error() = 0;
  *offset = strtol(buf, end, base);
  return *__error();
}

apr_int64_t apr_strtoi64(const char *buf, char **end, int base)
{
  *__error() = 0;

  return strtol(buf, end, base);
}

apr_int64_t apr_atoi64(const char *buf)
{
  *__error() = 0;

  return strtol(buf, 0, 10);
}

char *__cdecl apr_itoa(apr_pool_t *p, int n)
{
  uint64_t v3 = apr_palloc(p, 0xEuLL);
  if (n >= 0) {
    unsigned int v4 = n;
  }
  else {
    unsigned int v4 = -n;
  }
  v3[13] = 0;
  int v5 = v3 + 14;
  do
  {
    *(v5 - 2) = (v4 % 0xA) | 0x30;
    int result = v5 - 2;
    --v5;
    BOOL v7 = v4 > 9;
    v4 /= 0xAu;
  }
  while (v7);
  if (n < 0)
  {
    *(v5 - 2) = 45;
    return v5 - 2;
  }
  return result;
}

char *__cdecl apr_ltoa(apr_pool_t *p, uint64_t n)
{
  uint64_t v3 = apr_palloc(p, 0x1AuLL);
  if (n >= 0) {
    unint64_t v4 = n;
  }
  else {
    unint64_t v4 = -n;
  }
  v3[25] = 0;
  int v5 = v3 + 26;
  do
  {
    *(v5 - 2) = (v4 % 0xA) | 0x30;
    int result = v5 - 2;
    --v5;
    BOOL v7 = v4 > 9;
    v4 /= 0xAuLL;
  }
  while (v7);
  if (n < 0)
  {
    *(v5 - 2) = 45;
    return v5 - 2;
  }
  return result;
}

char *__cdecl apr_off_t_toa(apr_pool_t *p, apr_off_t n)
{
  uint64_t v3 = apr_palloc(p, 0x1AuLL);
  if (n >= 0) {
    unint64_t v4 = n;
  }
  else {
    unint64_t v4 = -n;
  }
  v3[25] = 0;
  int v5 = v3 + 26;
  do
  {
    *(v5 - 2) = (v4 % 0xA) | 0x30;
    int result = v5 - 2;
    --v5;
    BOOL v7 = v4 > 9;
    v4 /= 0xAuLL;
  }
  while (v7);
  if (n < 0)
  {
    *(v5 - 2) = 45;
    return v5 - 2;
  }
  return result;
}

char *__cdecl apr_strfsize(apr_off_t size, char *buf)
{
  if (size < 0)
  {
    unint64_t v4 = "  - ";
LABEL_14:
    *(_DWORD *)buf = *(_DWORD *)v4;
    uint8_t buf[4] = v4[4];
    return buf;
  }
  if ((unint64_t)size >= 0x3CD)
  {
    int v5 = "";
    do
    {
      __int16 v6 = size;
      size = (unint64_t)size >> 10;
      ++v5;
    }
    while ((unint64_t)size > 0x3CC);
    unsigned int v7 = v6 & 0x3FF;
    if ((unint64_t)size < 9 || size == 9 && v7 <= 0x3CC) {
      int v3 = apr_snprintf(buf, 5uLL, "%d.%d%c");
    }
    else {
      int v3 = apr_snprintf(buf, 5uLL, "%3d%c");
    }
  }
  else
  {
    int v3 = apr_snprintf(buf, 5uLL, "%3d ");
  }
  if (v3 < 0)
  {
    unint64_t v4 = "****";
    goto LABEL_14;
  }
  return buf;
}

apr_status_t apr_initialize(void)
{
  if (shared_initialized) {
    return 0;
  }
  if (initialized++) {
    return 0;
  }
  proc_mutex_op_on = -65536;
  word_250124 = 4096;
  proc_mutex_op_try = -65536;
  word_25012A = 6144;
  proc_mutex_op_off = 0x10000;
  word_250130 = 4096;
  proc_mutex_lock_it = 0;
  unk_250140 = 0;
  qword_250148 = 0x300000000;
  proc_mutex_unlock_it = 0;
  *(void *)algn_250158 = 0;
  qword_250160 = 0x200000000;
  apr_status_t result = apr_pool_initialize();
  if (!result)
  {
    newpool = 0;
    apr_status_t result = apr_pool_create_ex(&newpool, 0, 0, 0);
    if (result) {
      return 20002;
    }
    else {
      *((void *)newpool + 10) = "apr_initialize";
    }
  }
  return result;
}

uint64_t apr_shared_initialize(uint64_t a1)
{
  if (!a1) {
    return 20002;
  }
  if (initialized) {
    return 20014;
  }
  uint64_t result = 0;
  shared_initialized = 1;
  apr_pools_initialized = 1;
  apr_pools_shared_initialized = 1;
  global_pool = a1;
  global_allocator = *(void *)(a1 + 48);
  return result;
}

void apr_terminate(void)
{
  if ((shared_initialized & 1) == 0 && !--initialized) {
    apr_pool_terminate();
  }
}

void apr_terminate2(void)
{
  if ((shared_initialized & 1) == 0 && !--initialized) {
    apr_pool_terminate();
  }
}

apr_status_t apr_proc_kill(apr_proc_t *proc, int sig)
{
  if (kill(proc->pid, sig) == -1) {
    return *__error();
  }
  else {
    return 0;
  }
}

apr_sigfunc_t *__cdecl apr_signal(int signo, apr_sigfunc_t *func)
{
  v3.__sigaction_u.__sa_handler = 0;
  *(void *)&v3.sa_masuint64_t k = 0;
  v4.__sigaction_u.__sa_handler = func;
  *(void *)&v4.sa_masuint64_t k = 0;
  if (sigaction(signo, &v4, &v3) < 0) {
    return (apr_sigfunc_t *)-1;
  }
  else {
    return v3.__sigaction_u.__sa_handler;
  }
}

const char *__cdecl apr_signal_description_get(int signum)
{
  if (signum < 0) {
    return "unknown signal (number)";
  }
  else {
    return sys_siglist[signum];
  }
}

apr_status_t apr_signal_thread(int (__cdecl *signal_handler)(int))
{
  sigset_t v4 = -1074077689;
  do
  {
    int v3 = 0;
    sigwait(&v4, &v3);
  }
  while (((unsigned int (*)(void))signal_handler)(v3) != 1);
  return 0;
}

apr_status_t apr_setup_signal_thread(void)
{
  sigset_t v1 = -1073749753;
  return pthread_sigmask(3, &v1, 0);
}

apr_status_t apr_signal_block(int signum)
{
  sigset_t v1 = 1 << (signum - 1);
  if (signum > 32) {
    sigset_t v1 = 0;
  }
  sigset_t v3 = v1;
  return pthread_sigmask(1, &v3, 0);
}

apr_status_t apr_signal_unblock(int signum)
{
  sigset_t v1 = 1 << (signum - 1);
  if (signum > 32) {
    sigset_t v1 = 0;
  }
  sigset_t v3 = v1;
  return pthread_sigmask(2, &v3, 0);
}

int apr_is_empty_array(const apr_array_header_t *a)
{
  return !a || a->nelts == 0;
}

apr_array_header_t *__cdecl apr_array_make(apr_pool_t *p, int nelts, int elt_size)
{
  __int16 v6 = (apr_array_header_t *)apr_palloc(p, 0x20uLL);
  if (nelts <= 1) {
    int v7 = 1;
  }
  else {
    int v7 = nelts;
  }
  apr_size_t v8 = (char *)apr_palloc(p, v7 * elt_size);
  size_t v9 = v8;
  if (v8) {
    bzero(v8, v7 * elt_size);
  }
  v6->elts = v9;
  v6->pool = p;
  v6->elt_size = elt_size;
  v6->int nelts = 0;
  v6->nalloapr_vformatter_buff_t c = v7;
  return v6;
}

void *apr_array_remove(uint64_t a1, int a2)
{
  uint64_t v2 = *(int *)(a1 + 8);
  uint64_t v3 = *(int *)(a1 + 12) - 1;
  *(_DWORD *)(a1 + 12) = v3;
  return memmove((void *)(*(void *)(a1 + 24) + (int)v2 * (uint64_t)a2), (const void *)(*(void *)(a1 + 24) + v2 + (int)v2 * (uint64_t)a2), v2 * (v3 - a2));
}

void apr_array_clear(apr_array_header_t *arr)
{
  arr->int nelts = 0;
}

void *__cdecl apr_array_pop(void *arr)
{
  if (arr)
  {
    uint64_t v1 = *((int *)arr + 3);
    if (v1)
    {
      uint64_t v2 = *((void *)arr + 3);
      uint64_t v3 = *((int *)arr + 2);
      uint64_t v4 = v1 - 1;
      *((_DWORD *)arr + 3) = v4;
      return (void *)(v2 + v4 * v3);
    }
    else
    {
      return 0;
    }
  }
  return arr;
}

void *__cdecl apr_array_push(apr_array_header_t *arr)
{
  int nelts = arr->nelts;
  if (nelts == arr->nalloc)
  {
    if (nelts < 1) {
      int v3 = 1;
    }
    else {
      int v3 = 2 * nelts;
    }
    elts = (char *)apr_palloc(arr->pool, arr->elt_size * (uint64_t)v3);
    memcpy(elts, arr->elts, arr->elt_size * (uint64_t)arr->nalloc);
    bzero(&elts[arr->elt_size * arr->nalloc], arr->elt_size * (v3 - arr->nalloc));
    arr->elts = elts;
    arr->nalloapr_vformatter_buff_t c = v3;
    int nelts = arr->nelts;
  }
  else
  {
    elts = arr->elts;
  }
  arr->int nelts = nelts + 1;
  return &elts[arr->elt_size * (uint64_t)nelts];
}

void apr_array_cat(apr_array_header_t *dst, const apr_array_header_t *src)
{
  int nelts = dst->nelts;
  int elt_size = dst->elt_size;
  int v6 = src->nelts;
  int v7 = v6 + nelts;
  nalloapr_vformatter_buff_t c = dst->nalloc;
  if (v6 + nelts <= nalloc)
  {
    elts = dst->elts;
  }
  else
  {
    int v9 = 2 * nalloc;
    if (nalloc < 1) {
      int v9 = 1;
    }
    do
    {
      int v10 = v9;
      v9 *= 2;
    }
    while (v7 > v10);
    double v11 = (char *)apr_palloc(dst->pool, v10 * elt_size);
    elts = v11;
    if (v11) {
      bzero(v11, v10 * elt_size);
    }
    memcpy(elts, dst->elts, dst->nalloc * (uint64_t)elt_size);
    dst->elts = elts;
    dst->nalloapr_vformatter_buff_t c = v10;
    int nelts = dst->nelts;
    int v6 = src->nelts;
  }
  memcpy(&elts[elt_size * (uint64_t)nelts], src->elts, v6 * elt_size);
  dst->nelts += src->nelts;
}

apr_array_header_t *__cdecl apr_array_copy(apr_pool_t *p, const apr_array_header_t *arr)
{
  uint64_t v4 = (apr_array_header_t *)apr_palloc(p, 0x20uLL);
  int elt_size = arr->elt_size;
  if (arr->nalloc <= 1) {
    nalloapr_vformatter_buff_t c = 1;
  }
  else {
    nalloapr_vformatter_buff_t c = arr->nalloc;
  }
  int v7 = (char *)apr_palloc(p, nalloc * elt_size);
  v4->elts = v7;
  v4->pool = p;
  v4->int elt_size = elt_size;
  v4->int nelts = 0;
  v4->nalloapr_vformatter_buff_t c = nalloc;
  memcpy(v7, arr->elts, arr->nelts * (uint64_t)arr->elt_size);
  int nelts = arr->nelts;
  v4->int nelts = nelts;
  bzero(&v4->elts[v4->elt_size * nelts], (v4->nalloc - nelts) * v4->elt_size);
  return v4;
}

apr_array_header_t *__cdecl apr_array_copy_hdr(apr_pool_t *p, const apr_array_header_t *arr)
{
  uint64_t result = (apr_array_header_t *)apr_palloc(p, 0x20uLL);
  result->pool = p;
  result->elts = arr->elts;
  *(void *)&result->int elt_size = *(void *)&arr->elt_size;
  result->nalloapr_vformatter_buff_t c = arr->nelts;
  return result;
}

apr_array_header_t *__cdecl apr_array_append(apr_pool_t *p, const apr_array_header_t *first, const apr_array_header_t *second)
{
  int v6 = (apr_array_header_t *)apr_palloc(p, 0x20uLL);
  v6->pool = p;
  v6->elts = first->elts;
  *(void *)&v6->int elt_size = *(void *)&first->elt_size;
  v6->nalloapr_vformatter_buff_t c = first->nelts;
  apr_array_cat(v6, second);
  return v6;
}

char *__cdecl apr_array_pstrcat(apr_pool_t *p, const apr_array_header_t *arr, const char sep)
{
  int nelts = arr->nelts;
  int v5 = nelts - 1;
  if (nelts >= 1)
  {
    elts = arr->elts;
    if (elts)
    {
      int v8 = sep;
      uint64_t v9 = 0;
      uint64_t v10 = sep != 0;
      while (1)
      {
        if (*(void *)elts) {
          v9 += strlen(*(const char **)elts);
        }
        if (!v5) {
          break;
        }
        v9 += v10;
        elts += 8;
        --v5;
      }
      int v12 = (char *)apr_palloc(p, v9 + 1);
      uint64_t v14 = arr->elts;
      int v15 = 1;
      double v11 = v12;
      if (v14)
      {
LABEL_12:
        if (*(void *)v14)
        {
          size_t v16 = strlen(*(const char **)v14);
          memcpy(v11, *(const void **)v14, v16);
          v11 += v16;
        }
      }
      while (v15 < arr->nelts)
      {
        if (v8) {
          *v11++ = v8;
        }
        v14 += 8;
        ++v15;
        if (v14) {
          goto LABEL_12;
        }
      }
      goto LABEL_9;
    }
  }
  double v11 = apr_palloc(p, 1uLL);
  int v12 = v11;
  if (v11) {
LABEL_9:
  }
    *double v11 = 0;
  return v12;
}

int apr_is_empty_table(const apr_table_t *t)
{
  return !t || *((_DWORD *)t + 3) == 0;
}

apr_table_t *__cdecl apr_table_make(apr_pool_t *p, int nelts)
{
  uint64_t v4 = apr_palloc(p, 0x128uLL);
  if (nelts <= 1) {
    int nelts = 1;
  }
  v4[3] = apr_palloc(p, (24 * nelts));
  void *v4 = p;
  v4[1] = 24;
  *((_DWORD *)v4 + 4) = nelts;
  *((_DWORD *)v4 + 8) = 0;
  return (apr_table_t *)v4;
}

apr_table_t *__cdecl apr_table_copy(apr_pool_t *p, const apr_table_t *t)
{
  uint64_t v4 = (char *)apr_palloc(p, 0x128uLL);
  if (*((int *)t + 4) <= 1) {
    int v5 = 1;
  }
  else {
    int v5 = *((_DWORD *)t + 4);
  }
  int v6 = apr_palloc(p, (24 * v5));
  *((void *)v4 + 3) = v6;
  *(void *)uint64_t v4 = p;
  *((void *)v4 + 1) = 24;
  *((_DWORD *)v4 + 4) = v5;
  memcpy(v6, *((const void **)t + 3), 24 * *((int *)t + 3));
  *((_DWORD *)v4 + 3) = *((_DWORD *)t + 3);
  long long v7 = *(_OWORD *)((char *)t + 100);
  long long v8 = *(_OWORD *)((char *)t + 116);
  long long v9 = *(_OWORD *)((char *)t + 132);
  *(_OWORD *)(v4 + 148) = *(_OWORD *)((char *)t + 148);
  *(_OWORD *)(v4 + 132) = v9;
  *(_OWORD *)(v4 + 116) = v8;
  *(_OWORD *)(v4 + 100) = v7;
  long long v10 = *(_OWORD *)((char *)t + 36);
  long long v11 = *(_OWORD *)((char *)t + 52);
  long long v12 = *(_OWORD *)((char *)t + 68);
  *(_OWORD *)(v4 + 84) = *(_OWORD *)((char *)t + 84);
  *(_OWORD *)(v4 + 68) = v12;
  *(_OWORD *)(v4 + 52) = v11;
  *(_OWORD *)(v4 + 36) = v10;
  long long v13 = *(_OWORD *)((char *)t + 180);
  long long v14 = *(_OWORD *)((char *)t + 196);
  long long v15 = *(_OWORD *)((char *)t + 212);
  *(_OWORD *)(v4 + 164) = *(_OWORD *)((char *)t + 164);
  *(_OWORD *)(v4 + 212) = v15;
  *(_OWORD *)(v4 + 196) = v14;
  *(_OWORD *)(v4 + 180) = v13;
  long long v16 = *(_OWORD *)((char *)t + 244);
  long long v17 = *(_OWORD *)((char *)t + 260);
  long long v18 = *(_OWORD *)((char *)t + 276);
  *(_OWORD *)(v4 + 228) = *(_OWORD *)((char *)t + 228);
  *(_OWORD *)(v4 + 260) = v17;
  *(_OWORD *)(v4 + 276) = v18;
  *(_OWORD *)(v4 + 244) = v16;
  *((_DWORD *)v4 + 8) = *((_DWORD *)t + 8);
  return (apr_table_t *)v4;
}

apr_table_t *__cdecl apr_table_clone(apr_pool_t *p, const apr_table_t *t)
{
  uint64_t v3 = *((void *)t + 3);
  uint64_t v4 = apr_table_make(p, *((_DWORD *)t + 3));
  if (*((int *)t + 3) >= 1)
  {
    uint64_t v5 = 0;
    int v6 = (const char **)(v3 + 8);
    do
    {
      apr_table_add(v4, *(v6 - 1), *v6);
      ++v5;
      v6 += 3;
    }
    while (v5 < *((int *)t + 3));
  }
  return v4;
}

void apr_table_add(apr_table_t *t, const char *key, const char *val)
{
  char v6 = *key;
  int v7 = *((_DWORD *)t + 3);
  long long v8 = (char *)t + 4 * (*key & 0x1F);
  *((_DWORD *)v8 + 41) = v7;
  int v9 = *((_DWORD *)t + 8);
  int v10 = 1 << v6;
  if ((v9 & v10) == 0)
  {
    *((_DWORD *)v8 + 9) = v7;
    *((_DWORD *)t + 8) = v9 | v10;
  }
  int v11 = *key;
  if (*key && (int v11 = (key[1] << 8) | (v11 << 16), key[1]))
  {
    int v12 = (v11 | key[2]) << 8;
    if (key[2]) {
      v12 |= key[3];
    }
  }
  else
  {
    int v12 = v11 << 8;
  }
  long long v13 = apr_array_push_noclear((uint64_t)t);
  apr_size_t v14 = strlen(key) + 1;
  long long v15 = apr_palloc(*(apr_pool_t **)t, v14);
  memcpy(v15, key, v14);
  *(void *)long long v13 = v15;
  *((void *)v13 + 1) = apr_pstrdup(*(apr_pool_t **)t, val);
  *((_DWORD *)v13 + 4) = v12 & 0xDFDFDFDF;
}

char *apr_array_push_noclear(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 12);
  if (v2 == *(_DWORD *)(a1 + 16))
  {
    if (v2 < 1) {
      int v3 = 1;
    }
    else {
      int v3 = 2 * v2;
    }
    uint64_t v4 = (char *)apr_palloc(*(apr_pool_t **)a1, *(int *)(a1 + 8) * (uint64_t)v3);
    memcpy(v4, *(const void **)(a1 + 24), *(int *)(a1 + 8) * (uint64_t)*(int *)(a1 + 16));
    *(void *)(a1 + 24) = v4;
    *(_DWORD *)(a1 + 16) = v3;
    int v2 = *(_DWORD *)(a1 + 12);
  }
  else
  {
    uint64_t v4 = *(char **)(a1 + 24);
  }
  *(_DWORD *)(a1 + 12) = v2 + 1;
  return &v4[*(int *)(a1 + 8) * (uint64_t)v2];
}

void apr_table_clear(apr_table_t *t)
{
  *((_DWORD *)t + 3) = 0;
  *((_DWORD *)t + 8) = 0;
}

const char *__cdecl apr_table_get(const apr_table_t *t, const char *key)
{
  if (!key) {
    return 0;
  }
  char v3 = *key;
  if (((*((_DWORD *)t + 8) >> *key) & 1) == 0) {
    return 0;
  }
  int v4 = v3;
  uint64_t v5 = v3 & 0x1F;
  if (v4 && (int v4 = (key[1] << 8) | (v4 << 16), key[1]))
  {
    int v6 = (v4 | key[2]) << 8;
    if (key[2]) {
      v6 |= key[3];
    }
  }
  else
  {
    int v6 = v4 << 8;
  }
  long long v8 = (char *)t + 4 * v5;
  int v9 = *((_DWORD *)v8 + 9);
  int v10 = *((_DWORD *)v8 + 41);
  if (v9 > v10) {
    return 0;
  }
  unsigned int v11 = v6 & 0xDFDFDFDF;
  uint64_t v12 = *((void *)t + 3);
  unint64_t v13 = v12 + 24 * v10;
  unint64_t v14 = v12 + 24 * v9;
  while (v11 != *(_DWORD *)(v14 + 16) || strcasecmp(*(const char **)v14, key))
  {
    v14 += 24;
    if (v14 > v13) {
      return 0;
    }
  }
  return *(const char **)(v14 + 8);
}

void apr_table_set(apr_table_t *t, const char *key, const char *val)
{
  int v6 = *key;
  if (!*key)
  {
    int v7 = 0;
    goto LABEL_6;
  }
  int v7 = (key[1] << 8) | (v6 << 16);
  if (!key[1])
  {
LABEL_6:
    int v8 = v7 << 8;
    goto LABEL_7;
  }
  int v8 = (v7 | key[2]) << 8;
  if (key[2]) {
    v8 |= key[3];
  }
LABEL_7:
  unsigned int v9 = v8 & 0xDFDFDFDF;
  int v10 = *((_DWORD *)t + 8);
  uint64_t v11 = *key & 0x1F;
  int v12 = 1 << v6;
  unint64_t v13 = (char *)t + 4 * v11;
  unint64_t v14 = (int *)(v13 + 36);
  if ((v10 & v12) == 0)
  {
    int v17 = *((_DWORD *)t + 3);
    *unint64_t v14 = v17;
    *((_DWORD *)t + 8) = v10 | v12;
    goto LABEL_15;
  }
  int v15 = *v14;
  int v16 = *((_DWORD *)v13 + 41);
  int v17 = *((_DWORD *)t + 3);
  if (*v14 > v16)
  {
LABEL_15:
    *((_DWORD *)t + v11 + 41) = v17;
    int v22 = apr_array_push_noclear((uint64_t)t);
    apr_size_t v23 = strlen(key) + 1;
    uint64_t v24 = apr_palloc(*(apr_pool_t **)t, v23);
    memcpy(v24, key, v23);
    *(void *)int v22 = v24;
    *((void *)v22 + 1) = apr_pstrdup(*(apr_pool_t **)t, val);
    *((_DWORD *)v22 + 4) = v9;
    return;
  }
  uint64_t v18 = *((void *)t + 3);
  unint64_t v19 = v18 + 24 * v16;
  unint64_t v20 = v18 + 24 * v17;
  unint64_t v21 = v18 + 24 * v15;
  while (v9 != *(_DWORD *)(v21 + 16) || strcasecmp(*(const char **)v21, key))
  {
    v21 += 24;
    if (v21 > v19) {
      goto LABEL_15;
    }
  }
  *(void *)(v21 + 8) = apr_pstrdup(*(apr_pool_t **)t, val);
  unint64_t v25 = v21 + 24;
  if (v21 + 24 > v19) {
    return;
  }
  unint64_t v26 = 0;
  int v27 = 0;
  do
  {
    while (1)
    {
      int v28 = *(_DWORD *)(v21 + 40);
      unint64_t v21 = v25;
      if (v9 == v28 && !strcasecmp(*(const char **)v25, key))
      {
        --*((_DWORD *)t + 3);
        if (!v26) {
          unint64_t v26 = v21;
        }
        goto LABEL_27;
      }
      if (!v26) {
        break;
      }
      long long v29 = *(_OWORD *)v21;
      *(void *)(v26 + 16) = *(void *)(v21 + 16);
      *(_OWORD *)unint64_t v26 = v29;
      v26 += 24;
      int v27 = 1;
LABEL_27:
      unint64_t v25 = v21 + 24;
      if (v21 + 24 > v19)
      {
        while (v25 < v20)
        {
          long long v30 = *(_OWORD *)v25;
          *(void *)(v26 + 16) = *(void *)(v25 + 16);
          *(_OWORD *)unint64_t v26 = v30;
          v26 += 24;
          v25 += 24;
        }
        goto LABEL_30;
      }
    }
    unint64_t v25 = v21 + 24;
  }
  while (v21 + 24 <= v19);
  if (!v27) {
    return;
  }
LABEL_30:

  table_reindex((uint64_t)t);
}

uint64_t table_reindex(uint64_t result)
{
  uint64_t v1 = *(char ***)(result + 24);
  *(_DWORD *)(result + 32) = 0;
  int v2 = *(_DWORD *)(result + 12);
  if (v2 >= 1)
  {
    int v3 = 0;
    for (int i = 0; i != v2; ++i)
    {
      char v5 = **v1;
      uint64_t v6 = result + 4 * (v5 & 0x1F);
      *(_DWORD *)(v6 + 164) = i;
      int v7 = 1 << v5;
      if ((v7 & v3) == 0)
      {
        *(_DWORD *)(v6 + 36) = i;
        v3 |= v7;
        *(_DWORD *)(result + 32) = v3;
      }
      v1 += 3;
    }
  }
  return result;
}

void apr_table_setn(apr_table_t *t, const char *key, const char *val)
{
  int v6 = *key;
  if (!*key)
  {
    int v7 = 0;
    goto LABEL_6;
  }
  int v7 = (key[1] << 8) | (v6 << 16);
  if (!key[1])
  {
LABEL_6:
    int v8 = v7 << 8;
    goto LABEL_7;
  }
  int v8 = (v7 | key[2]) << 8;
  if (key[2]) {
    v8 |= key[3];
  }
LABEL_7:
  unsigned int v9 = v8 & 0xDFDFDFDF;
  int v10 = *((_DWORD *)t + 8);
  uint64_t v11 = *key & 0x1F;
  int v12 = 1 << v6;
  unint64_t v13 = (char *)t + 4 * v11;
  unint64_t v14 = (int *)(v13 + 36);
  if ((v10 & v12) == 0)
  {
    int v17 = *((_DWORD *)t + 3);
    *unint64_t v14 = v17;
    *((_DWORD *)t + 8) = v10 | v12;
    goto LABEL_15;
  }
  int v15 = *v14;
  int v16 = *((_DWORD *)v13 + 41);
  int v17 = *((_DWORD *)t + 3);
  if (*v14 > v16)
  {
LABEL_15:
    *((_DWORD *)t + v11 + 41) = v17;
    int v22 = apr_array_push_noclear((uint64_t)t);
    *(void *)int v22 = key;
    *((void *)v22 + 1) = val;
    *((_DWORD *)v22 + 4) = v9;
    return;
  }
  uint64_t v18 = *((void *)t + 3);
  unint64_t v19 = v18 + 24 * v16;
  unint64_t v20 = v18 + 24 * v17;
  unint64_t v21 = v18 + 24 * v15;
  while (v9 != *(_DWORD *)(v21 + 16) || strcasecmp(*(const char **)v21, key))
  {
    v21 += 24;
    if (v21 > v19) {
      goto LABEL_15;
    }
  }
  *(void *)(v21 + 8) = val;
  unint64_t v23 = v21 + 24;
  if (v21 + 24 > v19) {
    return;
  }
  unint64_t v24 = 0;
  int v25 = 0;
  do
  {
    while (1)
    {
      int v26 = *(_DWORD *)(v21 + 40);
      unint64_t v21 = v23;
      if (v9 == v26 && !strcasecmp(*(const char **)v23, key))
      {
        --*((_DWORD *)t + 3);
        if (!v24) {
          unint64_t v24 = v21;
        }
        goto LABEL_27;
      }
      if (!v24) {
        break;
      }
      long long v27 = *(_OWORD *)v21;
      *(void *)(v24 + 16) = *(void *)(v21 + 16);
      *(_OWORD *)unint64_t v24 = v27;
      v24 += 24;
      int v25 = 1;
LABEL_27:
      unint64_t v23 = v21 + 24;
      if (v21 + 24 > v19)
      {
        while (v23 < v20)
        {
          long long v28 = *(_OWORD *)v23;
          *(void *)(v24 + 16) = *(void *)(v23 + 16);
          *(_OWORD *)unint64_t v24 = v28;
          v24 += 24;
          v23 += 24;
        }
        goto LABEL_30;
      }
    }
    unint64_t v23 = v21 + 24;
  }
  while (v21 + 24 <= v19);
  if (!v25) {
    return;
  }
LABEL_30:

  table_reindex((uint64_t)t);
}

void apr_table_unset(apr_table_t *t, const char *key)
{
  char v2 = *key;
  if ((*((_DWORD *)t + 8) >> *key))
  {
    int v5 = v2;
    uint64_t v6 = v2 & 0x1F;
    if (v5 && (int v5 = (key[1] << 8) | (v5 << 16), key[1]))
    {
      int v7 = (v5 | key[2]) << 8;
      if (key[2]) {
        v7 |= key[3];
      }
    }
    else
    {
      int v7 = v5 << 8;
    }
    int v8 = (char *)t + 4 * v6;
    int v9 = *((_DWORD *)v8 + 9);
    int v10 = *((_DWORD *)v8 + 41);
    if (v9 <= v10)
    {
      unsigned int v11 = v7 & 0xDFDFDFDF;
      uint64_t v12 = *((void *)t + 3);
      unint64_t v13 = v12 + 24 * v10;
      unint64_t v14 = v12 + 24 * v9;
      while (v11 != *(_DWORD *)(v14 + 16) || strcasecmp(*(const char **)v14, key))
      {
        v14 += 24;
        if (v14 > v13) {
          return;
        }
      }
      int v15 = *((_DWORD *)t + 3);
      unint64_t v16 = v12 + 24 * v15;
      *((_DWORD *)t + 3) = v15 - 1;
      for (int i = (long long *)(v14 + 24); (unint64_t)i <= v13; int i = (long long *)((char *)i + 24))
      {
        if (v11 == *((_DWORD *)i + 4) && !strcasecmp(*(const char **)i, key))
        {
          --*((_DWORD *)t + 3);
        }
        else
        {
          long long v18 = *i;
          *(void *)(v14 + 16) = *((void *)i + 2);
          *(_OWORD *)unint64_t v14 = v18;
          v14 += 24;
        }
      }
      while ((unint64_t)i < v16)
      {
        long long v19 = *i;
        *(void *)(v14 + 16) = *((void *)i + 2);
        *(_OWORD *)unint64_t v14 = v19;
        v14 += 24;
        int i = (long long *)((char *)i + 24);
      }
      table_reindex((uint64_t)t);
    }
  }
}

void apr_table_merge(apr_table_t *t, const char *key, const char *val)
{
  int v6 = *key;
  if (!*key)
  {
    int v7 = 0;
    goto LABEL_6;
  }
  int v7 = (key[1] << 8) | (v6 << 16);
  if (!key[1])
  {
LABEL_6:
    int v8 = v7 << 8;
    goto LABEL_7;
  }
  int v8 = (v7 | key[2]) << 8;
  if (key[2]) {
    v8 |= key[3];
  }
LABEL_7:
  unsigned int v9 = v8 & 0xDFDFDFDF;
  int v10 = *((_DWORD *)t + 8);
  uint64_t v11 = *key & 0x1F;
  int v12 = 1 << v6;
  unint64_t v13 = (char *)t + 4 * v11;
  unint64_t v14 = (int *)(v13 + 36);
  if ((v10 & v12) == 0)
  {
    *unint64_t v14 = *((_DWORD *)t + 3);
    *((_DWORD *)t + 8) = v10 | v12;
    goto LABEL_15;
  }
  int v15 = *((_DWORD *)v13 + 41);
  if (*v14 > v15)
  {
LABEL_15:
    *((_DWORD *)t + v11 + 41) = *((_DWORD *)t + 3);
    long long v19 = apr_array_push_noclear((uint64_t)t);
    apr_size_t v20 = strlen(key) + 1;
    unint64_t v21 = apr_palloc(*(apr_pool_t **)t, v20);
    memcpy(v21, key, v20);
    *(void *)long long v19 = v21;
    *((void *)v19 + 1) = apr_pstrdup(*(apr_pool_t **)t, val);
    *((_DWORD *)v19 + 4) = v9;
    return;
  }
  uint64_t v16 = *((void *)t + 3);
  unint64_t v17 = v16 + 24 * v15;
  unint64_t v18 = v16 + 24 * *v14;
  while (v9 != *(_DWORD *)(v18 + 16) || strcasecmp(*(const char **)v18, key))
  {
    v18 += 24;
    if (v18 > v17) {
      goto LABEL_15;
    }
  }
  *(void *)(v18 + 8) = apr_pstrcat(*(apr_pool_t **)t, *(void *)(v18 + 8), ", ", val, 0);
}

void apr_table_mergen(apr_table_t *t, const char *key, const char *val)
{
  int v6 = *key;
  if (!*key)
  {
    int v7 = 0;
    goto LABEL_6;
  }
  int v7 = (key[1] << 8) | (v6 << 16);
  if (!key[1])
  {
LABEL_6:
    int v8 = v7 << 8;
    goto LABEL_7;
  }
  int v8 = (v7 | key[2]) << 8;
  if (key[2]) {
    v8 |= key[3];
  }
LABEL_7:
  unsigned int v9 = v8 & 0xDFDFDFDF;
  int v10 = *((_DWORD *)t + 8);
  uint64_t v11 = *key & 0x1F;
  int v12 = 1 << v6;
  unint64_t v13 = (char *)t + 4 * v11;
  unint64_t v14 = (int *)(v13 + 36);
  if ((v10 & v12) == 0)
  {
    *unint64_t v14 = *((_DWORD *)t + 3);
    *((_DWORD *)t + 8) = v10 | v12;
    goto LABEL_15;
  }
  int v15 = *((_DWORD *)v13 + 41);
  if (*v14 > v15)
  {
LABEL_15:
    *((_DWORD *)t + v11 + 41) = *((_DWORD *)t + 3);
    long long v19 = apr_array_push_noclear((uint64_t)t);
    *(void *)long long v19 = key;
    *((void *)v19 + 1) = val;
    *((_DWORD *)v19 + 4) = v9;
    return;
  }
  uint64_t v16 = *((void *)t + 3);
  unint64_t v17 = v16 + 24 * v15;
  unint64_t v18 = v16 + 24 * *v14;
  while (v9 != *(_DWORD *)(v18 + 16) || strcasecmp(*(const char **)v18, key))
  {
    v18 += 24;
    if (v18 > v17) {
      goto LABEL_15;
    }
  }
  *(void *)(v18 + 8) = apr_pstrcat(*(apr_pool_t **)t, *(void *)(v18 + 8), ", ", val, 0);
}

void apr_table_addn(apr_table_t *t, const char *key, const char *val)
{
  char v5 = *key;
  int v6 = *((_DWORD *)t + 3);
  int v7 = (char *)t + 4 * (*key & 0x1F);
  *((_DWORD *)v7 + 41) = v6;
  int v8 = *((_DWORD *)t + 8);
  int v9 = 1 << v5;
  if ((v8 & v9) == 0)
  {
    *((_DWORD *)v7 + 9) = v6;
    *((_DWORD *)t + 8) = v8 | v9;
  }
  int v10 = *key;
  if (*key && (int v10 = (key[1] << 8) | (v10 << 16), key[1]))
  {
    int v11 = (v10 | key[2]) << 8;
    if (key[2]) {
      v11 |= key[3];
    }
  }
  else
  {
    int v11 = v10 << 8;
  }
  unsigned int v12 = v11 & 0xDFDFDFDF;
  unint64_t v13 = apr_array_push_noclear((uint64_t)t);
  *(void *)unint64_t v13 = key;
  *((void *)v13 + 1) = val;
  *((_DWORD *)v13 + 4) = v12;
}

apr_table_t *__cdecl apr_table_overlay(apr_pool_t *p, const apr_table_t *overlay, const apr_table_t *base)
{
  int v6 = (apr_array_header_t *)apr_palloc(p, 0x128uLL);
  v6->pool = p;
  v6->elts = (char *)*((void *)overlay + 3);
  *(void *)&v6->int elt_size = *((void *)overlay + 1);
  v6->nalloapr_vformatter_buff_t c = *((_DWORD *)overlay + 3);
  apr_array_cat(v6, (const apr_array_header_t *)base);
  table_reindex((uint64_t)v6);
  return (apr_table_t *)v6;
}

int apr_table_do(apr_table_do_callback_fn_t *comp, void *rec, const apr_table_t *t, ...)
{
  va_start(va, t);
  return apr_table_vdo(comp, rec, t, va);
}

int apr_table_vdo(apr_table_do_callback_fn_t *comp, void *rec, const apr_table_t *t, va_list vp)
{
  uint64_t v7 = *((void *)t + 3);
  va_list v29 = vp + 8;
  int v8 = *(char **)vp;
  int v26 = (void *)(v7 + 8);
  uint64_t v27 = v7 + 16;
  int v28 = 1;
  do
  {
    if (v8)
    {
      char v9 = *v8;
      if (((*((_DWORD *)t + 8) >> *v8) & 1) == 0) {
        goto LABEL_24;
      }
      int v10 = v9;
      if (v9 && (int v10 = (v8[1] << 8) | (v9 << 16), v8[1]))
      {
        int v11 = (v10 | v8[2]) << 8;
        if (v8[2]) {
          v11 |= v8[3];
        }
      }
      else
      {
        int v11 = v10 << 8;
      }
      unsigned int v16 = v11 & 0xDFDFDFDF;
      unint64_t v17 = (char *)t + 4 * (v9 & 0x1F);
      uint64_t v18 = *((int *)v17 + 9);
      long long v19 = (int *)(v17 + 164);
      apr_size_t v20 = (_DWORD *)(v27 + 24 * (int)v18);
      uint64_t v21 = v18 - 1;
      int v22 = 1;
      while (++v21 <= *v19)
      {
        uint64_t v23 = *((void *)v20 - 2);
        if (v23 && v16 == *v20 && !strcasecmp(*((const char **)v20 - 2), v8)) {
          int v22 = ((uint64_t (*)(void *, uint64_t, void))comp)(rec, v23, *((void *)v20 - 1));
        }
        v20 += 6;
        if (!v22) {
          goto LABEL_22;
        }
      }
    }
    else
    {
      int v12 = 1;
      uint64_t v13 = -1;
      unint64_t v14 = v26;
      while (++v13 < *((int *)t + 3))
      {
        uint64_t v15 = *(v14 - 1);
        if (v15) {
          int v12 = ((uint64_t (*)(void *, uint64_t, void))comp)(rec, v15, *v14);
        }
        v14 += 3;
        if (!v12)
        {
LABEL_22:
          int v28 = 0;
          break;
        }
      }
    }
    if (!v8) {
      return v28;
    }
LABEL_24:
    unint64_t v24 = (char **)v29;
    v29 += 8;
    int v8 = *v24;
  }
  while (*v24);
  return v28;
}

void apr_table_compress(apr_table_t *t, unsigned int flags)
{
  if (flags == 2) {
    return;
  }
  uint64_t v3 = *((unsigned int *)t + 3);
  if ((int)v3 < 2) {
    return;
  }
  char v5 = (char *)apr_palloc(*(apr_pool_t **)t, 8 * v3);
  int v6 = v5;
  uint64_t v7 = 0;
  uint64_t v8 = *((void *)t + 3);
  signed int v9 = *((_DWORD *)t + 3);
  do
  {
    *(void *)&v5[8 * v7] = v8;
    v8 += 24;
    ++v7;
  }
  while (v9 != v7);
  unint64_t v10 = v9;
  int v11 = (const char ***)apr_palloc(*(apr_pool_t **)t, 8 * v9);
  uint64_t v71 = t;
  unsigned int v70 = flags;
  if (v9 < 2) {
    goto LABEL_47;
  }
  int v12 = v11;
  uint64_t v13 = 0;
  do
  {
    unint64_t v14 = (const char ***)&v6[8 * v13];
    uint64_t v15 = *v14;
    unsigned int v16 = v14[1];
    if (strcasecmp(**v14, *v16) >= 1)
    {
      *(void *)&v6[8 * v13] = v16;
      v14[1] = v15;
    }
    unint64_t v17 = v13 + 3;
    v13 += 2;
  }
  while (v17 < v9);
  if (v9 < 3)
  {
LABEL_47:
    int v37 = (const char ***)v6;
    goto LABEL_48;
  }
  unint64_t v18 = 2;
  unint64_t v73 = v9;
  do
  {
    unint64_t v19 = 0;
    apr_size_t v20 = v12;
    unint64_t v21 = v18;
    int v12 = (const char ***)v6;
    unint64_t v22 = 2 * v18;
    unint64_t v23 = v18;
    uint64_t v72 = (char *)v20;
    uint64_t v74 = 2 * v18;
    unint64_t v75 = v18;
    do
    {
      if (v22 >= v10) {
        unint64_t v24 = v10;
      }
      else {
        unint64_t v24 = v22;
      }
      unint64_t v25 = v23 + v21;
      if (v25 >= v10) {
        unint64_t v26 = v10;
      }
      else {
        unint64_t v26 = v25;
      }
      unint64_t v76 = v24;
      if (v19 == v23)
      {
        unint64_t v27 = v23;
LABEL_32:
        if (v27 >= v26) {
          goto LABEL_40;
        }
        unint64_t v33 = v76 - v27;
        vm_address_t v34 = &v12[v27];
        unint64_t v10 = v73;
        unint64_t v18 = v74;
        do
        {
          BOOL v35 = *v34++;
          *v20++ = v35;
          --v33;
        }
        while (v33);
      }
      else
      {
        unint64_t v27 = v23;
        unint64_t v28 = v19;
        while (v27 != v26)
        {
          va_list v29 = v12[v28];
          long long v30 = v12[v27];
          int v31 = strcasecmp(*v29, *v30);
          if (v31 >= 1) {
            int v32 = v30;
          }
          else {
            int v32 = v29;
          }
          if (v31 < 1) {
            ++v28;
          }
          if (v31 > 0) {
            ++v27;
          }
          *v20++ = v32;
          if (v28 == v23) {
            goto LABEL_32;
          }
        }
        if (v28 >= v23)
        {
LABEL_40:
          unint64_t v10 = v73;
          unint64_t v18 = v74;
          goto LABEL_41;
        }
        unint64_t v10 = v73;
        unint64_t v18 = v74;
        do
          *v20++ = v12[v28++];
        while (v28 < v23);
      }
LABEL_41:
      v19 += v18;
      unint64_t v21 = v75;
      unint64_t v23 = v19 + v75;
      v22 += v18;
    }
    while (v19 + v75 < v10);
    uint64_t v36 = (char *)v20 - v72;
    int v37 = (const char ***)v72;
    if (v10 > v36 >> 3)
    {
      uint64_t v38 = v36 >> 3;
      unint64_t v39 = v10 - (v36 >> 3);
      size_t v40 = &v72[8 * v38];
      int v41 = (uint64_t *)&v12[v38];
      do
      {
        uint64_t v42 = *v41++;
        *(void *)size_t v40 = v42;
        v40 += 8;
        --v39;
      }
      while (v39);
    }
    int v6 = v72;
  }
  while (v18 < v10);
LABEL_48:
  uint64_t v43 = (uint64_t)v71;
  uint64_t v44 = *((int *)v71 + 3);
  if ((int)v44 >= 2)
  {
    unsigned int v45 = v37 + 1;
    char v46 = 1;
    vm_address_t v47 = &v37[v44];
    while (2)
    {
      CFUUIDRef v48 = v37;
      uint64_t v49 = *v37;
      int v50 = *((_DWORD *)*v37 + 4);
      unsigned int v51 = v45 + 1;
      while (1)
      {
        int v52 = *v45;
        int v53 = *((_DWORD *)*v45 + 4);
        if (v53 == v50)
        {
          unsigned int v54 = *v49;
          if (!strcasecmp(*v52, *v49)) {
            break;
          }
        }
        CFUUIDRef v48 = v45;
        ++v51;
        int v50 = v53;
        uint64_t v49 = v52;
        if (++v45 >= v47)
        {
          uint64_t v43 = (uint64_t)v71;
          if (v46) {
            goto LABEL_77;
          }
          goto LABEL_72;
        }
      }
      uint64_t v43 = (uint64_t)v71;
      do
      {
        unint64_t v55 = v51;
        if (v51 >= v47) {
          break;
        }
        uint64_t v56 = *v51;
        if (*((_DWORD *)*v51 + 4) != v50) {
          break;
        }
        ++v51;
      }
      while (!strcasecmp(*v56, v54));
      unint64_t v57 = (unint64_t)(v55 - 1);
      if (v70 == 1)
      {
        apr_size_t v58 = 0;
        int v37 = v48;
        uint64_t v59 = v48;
        do
        {
          uint64_t v60 = (uint64_t)*v59++;
          v58 += strlen(*(const char **)(v60 + 8)) + 2;
        }
        while ((unint64_t)v59 <= v57);
        int v61 = (char *)apr_palloc(*(apr_pool_t **)v71, v58);
        int v62 = v48 + 1;
        int v63 = v61;
        while (1)
        {
          strcpy(v63, *(const char **)(*(v62 - 1) + 8));
          int v64 = &v63[strlen(*(const char **)(*(v62 - 1) + 8))];
          if ((unint64_t)v62 > v57) {
            break;
          }
          *(_WORD *)int v64 = 8236;
          int v63 = v64 + 2;
          ++v62;
        }
        *int v64 = 0;
        uint64_t v49 = *v48;
      }
      else
      {
        int v61 = (char *)(*(v55 - 1))[1];
        int v37 = v48;
      }
      v49[1] = v61;
      do
      {
        uint64_t v65 = *v45++;
        unint64_t *v65 = 0;
      }
      while ((unint64_t)v45 <= v57);
      char v46 = 0;
      if (v45 < v47) {
        continue;
      }
      break;
    }
LABEL_72:
    unint64_t v66 = *(long long **)(v43 + 24);
    unint64_t v67 = (unint64_t)v66 + 24 * *(int *)(v43 + 12);
    BOOL v68 = v66;
    do
    {
      if (*(void *)v66)
      {
        long long v69 = *v66;
        *((void *)v68 + 2) = *((void *)v66 + 2);
        *BOOL v68 = v69;
        BOOL v68 = (long long *)((char *)v68 + 24);
      }
      unint64_t v66 = (long long *)((char *)v66 + 24);
    }
    while ((unint64_t)v66 < v67);
    *(_DWORD *)(v43 + 12) += 1431655765 * ((v67 - (unint64_t)v68) >> 3);
  }
LABEL_77:

  table_reindex(v43);
}

void apr_table_overlap(apr_table_t *a, const apr_table_t *b, unsigned int flags)
{
  int v3 = *((_DWORD *)a + 3);
  if (v3 + *((_DWORD *)b + 3))
  {
    apr_array_cat((apr_array_header_t *)a, (const apr_array_header_t *)b);
    if (v3)
    {
      uint64_t v7 = 0;
      uint64_t v8 = (_DWORD *)((char *)b + 164);
      signed int v9 = (_DWORD *)((char *)a + 164);
      do
      {
        if (((1 << v7) & *((_DWORD *)b + 8)) != 0)
        {
          *signed int v9 = *v8 + v3;
          if ((*((_DWORD *)a + 8) & (1 << v7)) == 0) {
            *(v9 - 32) = *(v8 - 32) + v3;
          }
        }
        ++v7;
        ++v8;
        ++v9;
      }
      while (v7 != 32);
      int v10 = *((_DWORD *)a + 8) | *((_DWORD *)b + 8);
    }
    else
    {
      long long v11 = *(_OWORD *)((char *)b + 36);
      long long v12 = *(_OWORD *)((char *)b + 52);
      long long v13 = *(_OWORD *)((char *)b + 68);
      *(_OWORD *)((char *)a + 84) = *(_OWORD *)((char *)b + 84);
      *(_OWORD *)((char *)a + 68) = v13;
      *(_OWORD *)((char *)a + 52) = v12;
      *(_OWORD *)((char *)a + 36) = v11;
      long long v14 = *(_OWORD *)((char *)b + 100);
      long long v15 = *(_OWORD *)((char *)b + 116);
      long long v16 = *(_OWORD *)((char *)b + 132);
      *(_OWORD *)((char *)a + 148) = *(_OWORD *)((char *)b + 148);
      *(_OWORD *)((char *)a + 132) = v16;
      *(_OWORD *)((char *)a + 116) = v15;
      *(_OWORD *)((char *)a + 100) = v14;
      long long v17 = *(_OWORD *)((char *)b + 244);
      long long v18 = *(_OWORD *)((char *)b + 260);
      long long v19 = *(_OWORD *)((char *)b + 276);
      *(_OWORD *)((char *)a + 228) = *(_OWORD *)((char *)b + 228);
      *(_OWORD *)((char *)a + 260) = v18;
      *(_OWORD *)((char *)a + 276) = v19;
      *(_OWORD *)((char *)a + 244) = v17;
      long long v20 = *(_OWORD *)((char *)b + 164);
      long long v21 = *(_OWORD *)((char *)b + 180);
      long long v22 = *(_OWORD *)((char *)b + 196);
      *(_OWORD *)((char *)a + 212) = *(_OWORD *)((char *)b + 212);
      *(_OWORD *)((char *)a + 196) = v22;
      *(_OWORD *)((char *)a + 180) = v21;
      *(_OWORD *)((char *)a + 164) = v20;
      int v10 = *((_DWORD *)b + 8);
    }
    *((_DWORD *)a + 8) = v10;
    apr_table_compress(a, flags);
  }
}

const char *__cdecl apr_table_getm(apr_pool_t *p, const apr_table_t *t, const char *key)
{
  int v6 = 0;
  arr = 0;
  reapr_vformatter_buff_t c = p;
  apr_table_do((apr_table_do_callback_fn_t *)table_getm_do, &rec, t, key, 0);
  uint64_t result = v6;
  if (v6)
  {
    if (arr) {
      return apr_array_pstrcat(p, arr, 44);
    }
  }
  return result;
}

uint64_t table_getm_do(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a1 + 8);
  char v5 = (void *)(a1 + 8);
  if (v6)
  {
    uint64_t v7 = *(apr_array_header_t **)(a1 + 16);
    if (!v7)
    {
      uint64_t v8 = *(apr_pool_t **)a1;
      signed int v9 = (apr_array_header_t *)apr_palloc(*(apr_pool_t **)a1, 0x20uLL);
      int v10 = (char *)apr_palloc(v8, 0x50uLL);
      if (v10)
      {
        *((_OWORD *)v10 + 3) = 0u;
        *((_OWORD *)v10 + 4) = 0u;
        *((_OWORD *)v10 + 1) = 0u;
        *((_OWORD *)v10 + 2) = 0u;
        *(_OWORD *)int v10 = 0u;
      }
      v9->elts = v10;
      v9->pool = v8;
      *(void *)&v9->int elt_size = 8;
      v9->nalloapr_vformatter_buff_t c = 10;
      *(void *)(a1 + 16) = v9;
      *(void *)apr_array_push(v9) = *(void *)(a1 + 8);
      uint64_t v7 = *(apr_array_header_t **)(a1 + 16);
    }
    char v5 = apr_array_push(v7);
  }
  void *v5 = a3;
  return 1;
}

apr_status_t apr_thread_mutex_create(apr_thread_mutex_t **mutex, unsigned int flags, apr_pool_t *pool)
{
  char v4 = flags;
  uint64_t v6 = (char *)apr_palloc(pool, 0x48uLL);
  uint64_t v7 = v6;
  if (v6)
  {
    *(_OWORD *)(v6 + 56) = 0u;
    *(_OWORD *)(v6 + 40) = 0u;
    *(_OWORD *)(v6 + 24) = 0u;
    *(_OWORD *)(v6 + 8) = 0u;
  }
  *(void *)uint64_t v6 = pool;
  if (v4)
  {
    v11.__sig = 0;
    *(void *)v11.__opaque = 0;
    apr_status_t v8 = pthread_mutexattr_init(&v11);
    if (v8) {
      return v8;
    }
    int v9 = pthread_mutexattr_settype(&v11, 2);
    if (v9)
    {
      apr_status_t v8 = v9;
      pthread_mutexattr_destroy(&v11);
      return v8;
    }
    apr_status_t v8 = pthread_mutex_init((pthread_mutex_t *)(v7 + 8), &v11);
    pthread_mutexattr_destroy(&v11);
    if (v8) {
      return v8;
    }
    goto LABEL_5;
  }
  apr_status_t v8 = pthread_mutex_init((pthread_mutex_t *)(v6 + 8), 0);
  if (!v8)
  {
LABEL_5:
    apr_pool_cleanup_register(*(apr_pool_t **)v7, v7, (apr_status_t (__cdecl *)(void *))thread_mutex_cleanup, apr_pool_cleanup_null);
    apr_thread_mutex_t *mutex = (apr_thread_mutex_t *)v7;
  }
  return v8;
}

uint64_t thread_mutex_cleanup(uint64_t a1)
{
  return pthread_mutex_destroy((pthread_mutex_t *)(a1 + 8));
}

apr_status_t apr_thread_mutex_lock(apr_thread_mutex_t *mutex)
{
  return pthread_mutex_lock((pthread_mutex_t *)((char *)mutex + 8));
}

apr_status_t apr_thread_mutex_trylock(apr_thread_mutex_t *mutex)
{
  apr_status_t result = pthread_mutex_trylock((pthread_mutex_t *)((char *)mutex + 8));
  if (result == 16) {
    return 70025;
  }
  return result;
}

apr_status_t apr_thread_mutex_unlock(apr_thread_mutex_t *mutex)
{
  return pthread_mutex_unlock((pthread_mutex_t *)((char *)mutex + 8));
}

apr_status_t apr_thread_mutex_destroy(apr_thread_mutex_t *mutex)
{
  apr_pool_cleanup_kill(*(apr_pool_t **)mutex, mutex, (apr_status_t (__cdecl *)(void *))thread_mutex_cleanup);

  return thread_mutex_cleanup((uint64_t)mutex);
}

apr_pool_t *__cdecl apr_thread_mutex_pool_get(const apr_thread_mutex_t *thethread_mutex)
{
  return *(apr_pool_t **)thethread_mutex;
}

apr_status_t apr_time_ansi_put(apr_time_t *result, time_t input)
{
  const char *result = 1000000 * input;
  return 0;
}

apr_time_t apr_time_now(void)
{
  v1.__darwin_time_t tv_sec = 0;
  *(void *)&v1.tv_useapr_vformatter_buff_t c = 0;
  gettimeofday(&v1, 0);
  return v1.tv_usec + 1000000 * v1.tv_sec;
}

apr_status_t apr_time_exp_tz(apr_time_exp_t *result, apr_time_t input, apr_int32_t offs)
{
  result->tm_gmtoff = offs;
  return 0;
}

double explode_time(uint64_t a1, uint64_t a2, int a3, int a4)
{
  memset(&v9, 0, sizeof(v9));
  time_t v8 = a2 / 1000000 + a3;
  *(_DWORD *)a1 = a2 % 1000000;
  if (a4) {
    localtime_r(&v8, &v9);
  }
  else {
    gmtime_r(&v8, &v9);
  }
  double result = *(double *)&v9.tm_sec;
  long long v6 = *(_OWORD *)&v9.tm_mon;
  *(_OWORD *)(a1 + 4) = *(_OWORD *)&v9.tm_sec;
  *(_OWORD *)(a1 + 2explode_time((uint64_t)result, input, offs, 0) = v6;
  int tm_gmtoff = v9.tm_gmtoff;
  *(_DWORD *)(a1 + 36) = v9.tm_isdst;
  *(_DWORD *)(a1 + 4explode_time((uint64_t)result, input, offs, 0) = tm_gmtoff;
  return result;
}

apr_status_t apr_time_exp_gmt(apr_time_exp_t *result, apr_time_t input)
{
  memset(&v6, 0, sizeof(v6));
  time_t v5 = input / 1000000;
  result->tm_useapr_vformatter_buff_t c = input % 1000000;
  gmtime_r(&v5, &v6);
  long long v3 = *(_OWORD *)&v6.tm_mon;
  *(_OWORD *)&result->tm_seapr_vformatter_buff_t c = *(_OWORD *)&v6.tm_sec;
  *(_OWORD *)&result->tm_mon = v3;
  *(void *)&result->tm_isdst = v6.tm_isdst;
  return 0;
}

apr_status_t apr_time_exp_lt(apr_time_exp_t *result, apr_time_t input)
{
  memset(&v7, 0, sizeof(v7));
  time_t v6 = input / 1000000;
  result->tm_useapr_vformatter_buff_t c = input % 1000000;
  localtime_r(&v6, &v7);
  long long v3 = *(_OWORD *)&v7.tm_mon;
  *(_OWORD *)&result->tm_seapr_vformatter_buff_t c = *(_OWORD *)&v7.tm_sec;
  *(_OWORD *)&result->tm_mon = v3;
  apr_int32_t tm_gmtoff = v7.tm_gmtoff;
  result->tm_isdst = v7.tm_isdst;
  result->apr_int32_t tm_gmtoff = tm_gmtoff;
  return 0;
}

apr_status_t apr_time_exp_get(apr_time_t *result, apr_time_exp_t *input)
{
  uint64_t tm_mon = input->tm_mon;
  if (tm_mon > 0xB) {
    return 20004;
  }
  int64_t v3 = input->tm_year - (unint64_t)(tm_mon < 2);
  int64_t v4 = v3 + 3;
  if (v3 >= 0) {
    int64_t v4 = input->tm_year - (unint64_t)(tm_mon < 2);
  }
  uint64_t v5 = 365 * v3 + (v4 >> 2) - v3 / 100;
  int v6 = v3 / 100 + 3;
  int v7 = v3 / 100 + 6;
  if ((int)((uint64_t)(input->tm_year - (unint64_t)(tm_mon < 2)) / 100) >= -3) {
    int v7 = v6;
  }
  uint64_t v8 = input->tm_sec
     + 60
     * (input->tm_min
      + 60 * (input->tm_hour + 24 * (v5 + apr_time_exp_get_dayoffset[tm_mon] + input->tm_mday - 1 + (v7 >> 2))))
     - 2203891200;
  if (v8 < 0) {
    return 20004;
  }
  apr_status_t v9 = 0;
  const char *result = input->tm_usec + 1000000 * v8;
  return v9;
}

apr_status_t apr_time_exp_gmt_get(apr_time_t *result, apr_time_exp_t *input)
{
  apr_status_t v4 = apr_time_exp_get(result, input);
  if (!v4) {
    *result -= 1000000 * input->tm_gmtoff;
  }
  return v4;
}

apr_status_t apr_os_imp_time_get(apr_os_imp_time_t **ostime, apr_time_t *aprtime)
{
  apr_time_t v2 = *aprtime / 1000000;
  int64_t v3 = *ostime;
  v3->tv_useapr_vformatter_buff_t c = *aprtime % 1000000;
  v3->__darwin_time_t tv_sec = v2;
  return 0;
}

apr_status_t apr_os_exp_time_get(apr_os_exp_time_t **ostime, apr_time_exp_t *aprtime)
{
  apr_time_t v2 = *ostime;
  *(_OWORD *)&v2->tm_seapr_vformatter_buff_t c = *(_OWORD *)&aprtime->tm_sec;
  *(_OWORD *)&v2->uint64_t tm_mon = *(_OWORD *)&aprtime->tm_mon;
  uint64_t tm_gmtoff = aprtime->tm_gmtoff;
  v2->tm_isdst = aprtime->tm_isdst;
  v2->uint64_t tm_gmtoff = tm_gmtoff;
  return 0;
}

apr_status_t apr_os_imp_time_put(apr_time_t *aprtime, apr_os_imp_time_t **ostime, apr_pool_t *cont)
{
  *aprtime = (*ostime)->tv_usec + 1000000 * (*ostime)->tv_sec;
  return 0;
}

apr_status_t apr_os_exp_time_put(apr_time_exp_t *aprtime, apr_os_exp_time_t **ostime, apr_pool_t *cont)
{
  int64_t v3 = *ostime;
  *(_OWORD *)&aprtime->tm_seapr_vformatter_buff_t c = *(_OWORD *)&(*ostime)->tm_sec;
  *(_OWORD *)&aprtime->uint64_t tm_mon = *(_OWORD *)&v3->tm_mon;
  apr_int32_t tm_isdst = v3->tm_isdst;
  uint64_t tm_gmtoff = v3->tm_gmtoff;
  aprtime->apr_int32_t tm_isdst = tm_isdst;
  aprtime->uint64_t tm_gmtoff = tm_gmtoff;
  return 0;
}

void apr_sleep(apr_interval_time_t t)
{
  v1.__darwin_time_t tv_sec = t / 1000000;
  *(void *)&v1.tv_useapr_vformatter_buff_t c = (t % 1000000);
  select(0, 0, 0, 0, &v1);
}

void *GTDataAppendBytes(void *result, const void *a2, size_t a3)
{
  int64_t v3 = result;
  uint64_t v4 = result[1];
  size_t v5 = v4 + a3;
  if (v4 + a3 <= result[2])
  {
    double result = memcpy((void *)(*result + v4), a2, a3);
    size_t v5 = v3[1] + a3;
  }
  v3[1] = v5;
  return result;
}

void GTDataIncreaseLength(void *a1, size_t a2)
{
  size_t v2 = a2;
  unint64_t v4 = a1[1];
  unint64_t v5 = a1[2];
  BOOL v6 = v5 > v4;
  size_t v7 = v5 - v4;
  if (v6)
  {
    uint64_t v8 = (void *)(*a1 + v4);
    if (v7 < a2) {
      a2 = v7;
    }
    bzero(v8, a2);
    unint64_t v4 = a1[1];
  }
  a1[1] = v4 + v2;
}

uint64_t get64u(void **a1)
{
  return *(*a1)++;
}

float get32f(float **a1)
{
  float result = **a1;
  *a1 += 2;
  return result;
}

double get64f(double **a1)
{
  return *(*a1)++;
}

const char *ReadDynamicBufferString(const char **a1)
{
  timeval v1 = *a1;
  *a1 += (strlen(*a1) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (*v1) {
    return v1;
  }
  else {
    return 0;
  }
}

uint64_t ReadDynamicBufferData(uint64_t **a1)
{
  uint64_t v1 = **a1;
  if (v1) {
    uint64_t v2 = (uint64_t)(*a1 + 1);
  }
  else {
    uint64_t v2 = 0;
  }
  *a1 = (uint64_t *)((char *)*a1 + ((v1 + 7) & 0xFFFFFFFFFFFFFFF8) + 8);
  return v2;
}

const char *GTMessageKindAsString(int a1)
{
  if (a1 > 1791)
  {
    if (a1 <= 4095)
    {
      switch(a1)
      {
        case 2304:
          uint64_t v1 = "kDYMessageFSStreamInitializeTransfer";
          break;
        case 2305:
          uint64_t v1 = "kDYMessageFSStreamInitializeTransferAck";
          break;
        case 2306:
          uint64_t v1 = "kDYMessageFSStreamItemData";
          break;
        case 2307:
          uint64_t v1 = "kDYMessageFSStreamFinishedSending";
          break;
        case 2308:
          uint64_t v1 = "kDYMessageFSStreamFinishedSendingAck";
          break;
        case 2309:
          uint64_t v1 = "kDYMessageFSStreamAbort";
          break;
        default:
          switch(a1)
          {
            case 1792:
              uint64_t v1 = "kDYMessageTraceBufferedFstreamData";
              break;
            case 1793:
              uint64_t v1 = "kDYMessageTraceConfiguration";
              break;
            case 1794:
              uint64_t v1 = "kDYMessageTraceOverridesConfiguration";
              break;
            case 1795:
              uint64_t v1 = "kDYMessageTraceFlushBuffers";
              break;
            case 1796:
              uint64_t v1 = "kDYMessageTraceModeChanged";
              break;
            default:
LABEL_109:
              GTMessageKindAsString_str();
              uint64_t v1 = v2;
              snprintf(v2, 0x40uLL, "Unrecognized message: %d", v3);
              break;
          }
          break;
      }
    }
    else
    {
      switch(a1)
      {
        case 4096:
          return "kDYMessageReplayerAppReady";
        case 4097:
        case 4123:
        case 4124:
        case 4125:
        case 4126:
        case 4127:
        case 4128:
          goto LABEL_109;
        case 4098:
          return "kDYMessageReplayerReplayArchive";
        case 4099:
          return "kDYMessageReplayerExperimentResult";
        case 4100:
          return "kDYMessageReplayerReplayFinished";
        case 4101:
          return "kDYMessageReplayerSetBackgroundImage";
        case 4102:
          return "kDYMessageReplayerDeleteAllArchives";
        case 4103:
          return "kDYMessageReplayerBeginDebugArchive";
        case 4104:
          return "kDYMessageReplayerEndDebugArchive";
        case 4105:
          return "kDYMessageReplayerDebugStatus";
        case 4106:
          return "kDYMessageReplayerDebugFuncStop";
        case 4107:
          return "kDYMessageReplayerDebugEnableWireframePresent";
        case 4108:
          return "kDYMessageReplayerDebugEnableDrawCallPresent";
        case 4109:
          return "kDYMessageReplayerDebugWireframeLineWidth";
        case 4110:
          return "kDYMessageReplayerDebugWireframeLineColor";
        case 4111:
          return "kDYMessageReplayerDebugDisableFunctions";
        case 4112:
          return "kDYMessageReplayerDebugEnableFunctions";
        case 4113:
          return "kDYMessageReplayerSetBackgroundImageData";
        case 4114:
          return "kDYMessageReplayerLoadArchives";
        case 4115:
          return "kDYMessageReplayerQueryLoadedArchivesInfo";
        case 4116:
          return "kDYMessageReplayerArchivesDirectoryPath";
        case 4117:
          return "kDYMessageReplayerQueryShaderInfo";
        case 4118:
          return "kDYMessageReplayerDerivedCounterData";
        case 4119:
          return "kDYMessageReplayerGenerateThumbnails";
        case 4120:
          return "kDYMessageReplayerGenerateDependencyGraphThumbnails";
        case 4121:
          return "kDYMessageFetchResourceObjectBatch";
        case 4122:
          return "kDYMessageReplayerDebugEnableOutlinePresent";
        case 4129:
          return "kGTMessageReplayerResourcesUsedForFunctionIndex";
        default:
          if (a1 == 4353)
          {
            uint64_t v1 = "kGTMessageDiagnosticsReceivedData";
          }
          else
          {
            if (a1 != 4865) {
              goto LABEL_109;
            }
            uint64_t v1 = "kGTMessageRunnablePID";
          }
          break;
      }
    }
  }
  else if (a1 <= 1279)
  {
    if (a1 > 511)
    {
      switch(a1)
      {
        case 1024:
          uint64_t v1 = "kDYMessageCurrentDrawFramebufferImage";
          break;
        case 1025:
          uint64_t v1 = "kDYMessageFetchResourceList";
          break;
        case 1026:
          uint64_t v1 = "kDYMessageFetchResourceObject";
          break;
        case 1027:
          uint64_t v1 = "kDYMessageFetchState";
          break;
        case 1028:
          uint64_t v1 = "kDYMessageUpdateResourceObject";
          break;
        case 1029:
          uint64_t v1 = "kDYMessageClearResourceOverrides";
          break;
        case 1030:
          uint64_t v1 = "kDYGenerateShaderDebuggerTrace";
          break;
        default:
          if (a1 == 512)
          {
            uint64_t v1 = "kDYMessageBreakpoint";
          }
          else
          {
            if (a1 != 513) {
              goto LABEL_109;
            }
            uint64_t v1 = "kDYMessageBreakpointContinue";
          }
          break;
      }
    }
    else
    {
      uint64_t v1 = "kDYMessageCaptureStart";
      switch(a1)
      {
        case 256:
          return v1;
        case 257:
          uint64_t v1 = "kDYMessageCaptureStarted";
          break;
        case 258:
          uint64_t v1 = "kDYMessageCaptureData";
          break;
        case 259:
          uint64_t v1 = "kDYMessageCaptureCreateAlias";
          break;
        case 260:
          uint64_t v1 = "kDYMessageCaptureStop";
          break;
        case 262:
          uint64_t v1 = "kDYMessageCaptureDataReferenceCounts";
          break;
        case 263:
          uint64_t v1 = "kDYMessageCaptureSentAllData";
          break;
        case 264:
          uint64_t v1 = "kDYMessageCaptureActivateSession";
          break;
        case 265:
          uint64_t v1 = "kDYMessageCaptureInvalidateSession";
          break;
        case 266:
          uint64_t v1 = "kDYMessageCaptureSentUsedData";
          break;
        case 267:
          uint64_t v1 = "kDYMessageCaptureSentAllMetadata";
          break;
        case 271:
          uint64_t v1 = "kDYMessageCaptureDataChunk";
          break;
        default:
          goto LABEL_109;
      }
    }
  }
  else
  {
    switch(a1)
    {
      case 1280:
        uint64_t v1 = "kDYMessageLaunchGuestApp";
        break;
      case 1281:
        uint64_t v1 = "kDYMessageKillGuestApp";
        break;
      case 1282:
        uint64_t v1 = "kDYMessageGuestAppTerminated";
        break;
      case 1283:
        uint64_t v1 = "kDYMessageTerminateDaemon";
        break;
      case 1284:
        uint64_t v1 = "kDYMessageApplicationList";
        break;
      case 1285:
        uint64_t v1 = "kDYMessageApplicationIcon";
        break;
      case 1286:
        uint64_t v1 = "kDYMessageDaemonCreateGuestAppTransport";
        break;
      case 1287:
        uint64_t v1 = "kDYMessageMobileDaemonReloadUIServer";
        break;
      case 1288:
        uint64_t v1 = "kDYMessageSendGuestAppToBackground";
        break;
      case 1289:
        uint64_t v1 = "kDYMessageBringGuestAppToForeground";
        break;
      case 1290:
        uint64_t v1 = "kDYMessageGPUToolsVersionQuery";
        break;
      case 1291:
        uint64_t v1 = "kDYMessageMobileDaemonPosixSpawn";
        break;
      case 1292:
        uint64_t v1 = "kDYMessageDaemonRegisterInferior";
        break;
      case 1293:
        uint64_t v1 = "kDYDaemonResumeInferior";
        break;
      case 1294:
        uint64_t v1 = "kDYMessageDaemonDeviceCapabilities";
        break;
      case 1295:
        uint64_t v1 = "kDYMessageDaemonLaunchDebugServer";
        break;
      case 1296:
      case 1297:
        goto LABEL_109;
      case 1298:
        uint64_t v1 = "kDYMessageDeviceCompatibilityCapabilities";
        break;
      default:
        switch(a1)
        {
          case 1536:
            uint64_t v1 = "kDYMessageInferiorLaunched";
            break;
          case 1537:
            uint64_t v1 = "kDYMessageInferiorSignalInterposeSemaphore";
            break;
          case 1538:
            uint64_t v1 = "kDYMessageGuestAppCSSignature";
            break;
          case 1539:
            uint64_t v1 = "kDYMessageGuestAppTimebase";
            break;
          case 1540:
            uint64_t v1 = "kDYMessageGuestAppInvalidateSavePointerAliases";
            break;
          case 1541:
            uint64_t v1 = "kDYMessageGuestAppProfilingData";
            break;
          case 1542:
            uint64_t v1 = "kDYMessageGuestAppGLContextsInfo";
            break;
          case 1543:
            uint64_t v1 = "kDYMessageGuestAppCADisplayLinkEvent";
            break;
          case 1544:
            uint64_t v1 = "kDYMessageGuestAppMultitaskingSuspensionState";
            break;
          case 1545:
            uint64_t v1 = "kDYMessageGuestAppLockGraphics";
            break;
          case 1546:
            uint64_t v1 = "kDYMessageGuestAppUnlockGraphics";
            break;
          case 1547:
            uint64_t v1 = "kDYMessageGuestAppMTLCommandQueuesInfo";
            break;
          case 1548:
            uint64_t v1 = "kDYMessageGuestAppMTLCommandBuffersCaptured";
            break;
          case 1549:
            uint64_t v1 = "kDYMessageGuestAppMTLCaptureScopesInfo";
            break;
          case 1550:
            uint64_t v1 = "kDYMessageGuestAppCAMetalLayersInfo";
            break;
          case 1551:
            uint64_t v1 = "kDYMessageGuestAppMTLDevicesInfo";
            break;
          default:
            goto LABEL_109;
        }
        break;
    }
  }
  return v1;
}

const char *GTResourceTypeAsString(uint64_t a1)
{
  if (a1 <= 21)
  {
    if (a1 == 1) {
      return "Texture";
    }
    if (a1 == 2) {
      return "Buffer";
    }
  }
  else
  {
    switch(a1)
    {
      case 22:
        return "Threadgroup buffer";
      case 24:
        return "Indirect command buffer";
      case 39:
        return "Rasterization rate map";
    }
  }
  return "Resource";
}

char *GTFilePath_make(apr_pool_t *a1, const char *a2)
{
  return apr_pstrdup(a1, a2);
}

char *GTFilePath_append(uint64_t a1, uint64_t a2)
{
  float result = apr_pstrcat(*(apr_pool_t **)(a1 + 8), *(void *)a1, "/", a2, 0);
  *(void *)a1 = result;
  return result;
}

uint64_t GTFileSystem_open(const char *a1, int a2, uint64_t a3)
{
  return open(a1, a2, a3);
}

BOOL GTFile_isValid(int a1)
{
  return a1 >= 0;
}

BOOL GTFile_append(int a1, dispatch_data_t data)
{
  uint64_t v5 = 0;
  if (data && a1 != -1)
  {
    uint64_t v9 = v2;
    uint64_t v10 = v3;
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472;
    applier[2] = __GTFile_append_block_invoke;
    applier[3] = &__block_descriptor_36_e47_B40__0__NSObject_OS_dispatch_data__8Q16r_v24Q32l;
    int v8 = a1;
    return dispatch_data_apply(data, applier);
  }
  return v5;
}

BOOL GTFile_write(int a1, uint64_t a2, dispatch_data_t data)
{
  uint64_t v5 = 0;
  if (data && a1 != -1)
  {
    uint64_t v9 = v3;
    uint64_t v10 = v4;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = __GTFile_write_block_invoke;
    v7[3] = &__block_descriptor_44_e47_B40__0__NSObject_OS_dispatch_data__8Q16r_v24Q32l;
    int v8 = a1;
    void v7[4] = a2;
    return dispatch_data_apply(data, v7);
  }
  return v5;
}

uint64_t GTFile_map(int a1, uint64_t a2, uint64_t a3)
{
  if ((a1 & 0x80000000) == 0)
  {
    uint64_t v6 = 0;
    while (1)
    {
      size_t v7 = (unint64_t)(a3 - v6) >= 0x100000 ? 0x100000 : a3 - v6;
      ssize_t v8 = read(a1, (void *)(a2 + v6), v7);
      if ((unint64_t)(v8 + 1) < 2) {
        break;
      }
      v6 += v8;
      if (v6 == a3) {
        return 1;
      }
    }
  }
  return 0;
}

uint64_t GTFile_close(_DWORD *a1)
{
  uint64_t result = *a1;
  if ((result & 0x80000000) == 0)
  {
    uint64_t result = close(result);
    *a1 = -1;
  }
  return result;
}

id GTFileSystem_move(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = +[NSFileManager defaultManager];
  uint64_t v5 = +[NSString stringWithUTF8String:a1];
  uint64_t v6 = +[NSString stringWithUTF8String:a2];
  id v17 = 0;
  unsigned __int8 v7 = [v4 moveItemAtPath:v5 toPath:v6 error:&v17];
  id v8 = v17;

  if (v7)
  {
    id v9 = &def_CFBEC + 1;
  }
  else
  {

    uint64_t v10 = +[NSFileManager defaultManager];
    pthread_mutexattr_t v11 = +[NSString stringWithUTF8String:a2];
    long long v12 = +[NSURL fileURLWithPath:v11];
    long long v13 = +[NSString stringWithUTF8String:a1];
    long long v14 = +[NSURL fileURLWithPath:v13];
    id v16 = 0;
    id v9 = [v10 replaceItemAtURL:v12 withItemAtURL:v14 backupItemName:0 options:0 resultingItemURL:0 error:&v16];
    id v8 = v16;
  }
  return v9;
}

id GTFileSystem_unlink(uint64_t a1)
{
  uint64_t v2 = +[NSFileManager defaultManager];
  uint64_t v3 = +[NSString stringWithUTF8String:a1];
  uint64_t v6 = 0;
  id v4 = [v2 removeItemAtPath:v3 error:&v6];

  return v4;
}

id GTFileSystem_symlink(uint64_t a1, uint64_t a2)
{
  id v4 = +[NSFileManager defaultManager];
  uint64_t v5 = +[NSString stringWithUTF8String:a2];
  uint64_t v6 = +[NSString stringWithUTF8String:a1];
  uint64_t v9 = 0;
  id v7 = [v4 createSymbolicLinkAtPath:v5 withDestinationPath:v6 error:&v9];

  return v7;
}

id GTFileSystem_copy(uint64_t a1, uint64_t a2)
{
  id v4 = +[NSFileManager defaultManager];
  uint64_t v5 = +[NSString stringWithUTF8String:a1];
  uint64_t v6 = +[NSString stringWithUTF8String:a2];
  uint64_t v9 = 0;
  id v7 = [v4 copyItemAtPath:v5 toPath:v6 error:&v9];

  return v7;
}

BOOL GTFileSystem_write(const char *a1, void *a2)
{
  uint64_t v3 = a2;
  id v4 = v3;
  BOOL v5 = 0;
  if (a1 && v3)
  {
    int v6 = open(a1, 1537, 420);
    if (v6 == -1)
    {
      BOOL v5 = 0;
    }
    else
    {
      int v7 = v6;
      applier[0] = _NSConcreteStackBlock;
      applier[1] = 3221225472;
      applier[2] = __GTFileSystem_write_block_invoke;
      applier[3] = &__block_descriptor_36_e47_B40__0__NSObject_OS_dispatch_data__8Q16r_v24Q32l;
      int v10 = v6;
      BOOL v5 = dispatch_data_apply(v4, applier);
      close(v7);
    }
  }

  return v5;
}

id GTFileSystem_mkdir(uint64_t a1, uint64_t a2)
{
  id v4 = +[NSFileManager defaultManager];
  BOOL v5 = +[NSString stringWithUTF8String:a1];
  uint64_t v8 = 0;
  id v6 = [v4 createDirectoryAtPath:v5 withIntermediateDirectories:a2 attributes:0 error:&v8];

  return v6;
}

char *gt_filepath_merge(const char *a1, const char *a2, apr_pool_t *a3)
{
  size_t v6 = strlen(a1);
  size_t v7 = strlen(a2);
  size_t v8 = v7;
  if (v6 && a1[v6 - 1] == 47) {
    --v6;
  }
  uint64_t v9 = (char *)apr_palloc(a3, v7 + v6 + 2);
  memcpy(v9, a1, v6);
  v9[v6] = 47;
  memcpy(&v9[v6 + 1], a2, v8);
  v9[v8 + 1 + v6] = 0;
  return v9;
}

ssize_t gt_read_full(int a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = 0;
  do
  {
    if ((unint64_t)(a3 - v6) >= 0x100000) {
      size_t v7 = 0x100000;
    }
    else {
      size_t v7 = a3 - v6;
    }
    ssize_t result = read(a1, (void *)(a2 + v6), v7);
    if (result == -1) {
      ssize_t v9 = 0;
    }
    else {
      ssize_t v9 = result;
    }
    v6 += v9;
  }
  while (result != -1 && v6 != a3);
  return result;
}

ssize_t gt_write_full(int __fd, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = 0;
  do
  {
    if ((unint64_t)(a3 - v6) >= 0x100000) {
      size_t v7 = 0x100000;
    }
    else {
      size_t v7 = a3 - v6;
    }
    ssize_t result = write(__fd, (const void *)(a2 + v6), v7);
    if (result == -1) {
      ssize_t v9 = 0;
    }
    else {
      ssize_t v9 = result;
    }
    v6 += v9;
  }
  while (result != -1 && v6 != a3);
  return result;
}

uint64_t gt_file_copy(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (const char *)__chkstk_darwin(a1, a2);
  id v4 = v3;
  int v5 = open(v2, 0);
  int v6 = creat(v4, 0x1B0u);
  unint64_t v7 = lseek(v5, 0, 2);
  lseek(v5, 0, 0);
  if (v7)
  {
    for (unint64_t i = 0; i < v7; i += v10)
    {
      if (v7 - i >= 0x2000) {
        size_t v9 = 0x2000;
      }
      else {
        size_t v9 = v7 - i;
      }
      ssize_t v10 = read(v5, v17, v9);
      uint64_t v11 = 0;
      do
      {
        if ((unint64_t)(v10 - v11) >= 0x100000) {
          size_t v12 = 0x100000;
        }
        else {
          size_t v12 = v10 - v11;
        }
        ssize_t v13 = write(v6, &v17[v11], v12);
        if (v13 == -1) {
          ssize_t v14 = 0;
        }
        else {
          ssize_t v14 = v13;
        }
        v11 += v14;
      }
      while (v13 != -1 && v11 != v10);
    }
  }
  close(v5);
  return close(v6);
}

id gt_default_log()
{
  uint64_t v0 = s_defaultLog;
  if (s_defaultLog == &_os_log_default)
  {
    if (gt_default_log_onceToken != -1) {
      dispatch_once(&gt_default_log_onceToken, &__block_literal_global_14733);
    }
    uint64_t v0 = s_defaultLog;
  }

  return v0;
}

void __gt_default_log_block_invoke(id a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&def_CFBEC, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "GPUTOOLS(warning): Log uninitialized, please call GTCoreLogInit(), logging to OS_LOG_DEFAULT instead", v1, 2u);
  }
}

id gt_tagged_log(unint64_t a1)
{
  if (s_logCount <= a1)
  {
    if (s_logUsingOsLog)
    {
      int v5 = gt_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = a1;
        _os_log_fault_impl(&def_CFBEC, v5, OS_LOG_TYPE_FAULT, "fail: Invalid log tag: %llu", buf, 0xCu);
      }
    }
    else
    {
      int v6 = __stderrp;
      id v7 = +[NSString stringWithFormat:@"fail: Invalid log tag: %llu", a1];
      fprintf(v6, "%s\n", (const char *)[v7 UTF8String]);
    }
    id v4 = &_os_log_default;
    id v8 = &_os_log_default;
  }
  else
  {
    *(_OWORD *)buf = 0u;
    long long v11 = 0u;
    __copy_constructor_8_8_s0_s8_s16_s24(buf, (id *)(s_logs + 32 * a1));
    int v2 = GTCoreLog_enabled((uint64_t)buf);
    uint64_t v3 = (void *)*((void *)&v11 + 1);
    if (!v2) {
      uint64_t v3 = &_os_log_disabled;
    }
    id v4 = v3;
    __destructor_8_s0_s8_s16_s24((uint64_t)buf);
  }

  return v4;
}

id __copy_constructor_8_8_s0_s8_s16_s24(void *a1, id *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  id result = a2[3];
  a1[3] = result;
  return result;
}

uint64_t GTCoreLog_enabled(uint64_t a1)
{
  if (!*(void *)(a1 + 16)) {
    return 1;
  }
  int v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 BOOLForKey:*(void *)(a1 + 16)];

  return (uint64_t)v3;
}

void __destructor_8_s0_s8_s16_s24(uint64_t a1)
{
  int v2 = *(void **)(a1 + 24);
}

uint64_t GTCoreLogUseOsLog()
{
  return s_logUsingOsLog;
}

void GTCoreLogInit(const char *a1, uint64_t a2, int a3)
{
  if (s_defaultLog == &_os_log_default)
  {
    int v6 = a1;
    os_log_t v7 = os_log_create(a1, "");
    id v8 = s_defaultLog;
    s_defaultLog = v7;

    size_t v9 = &s_accelerationStructuresByStreamRef;
    s_logs = (uint64_t)malloc_type_calloc(a3, 0x20uLL, 0x8004018A671A6uLL);
    s_logCount = a3;
    if (a3 >= 1)
    {
      ssize_t v10 = 0;
      unint64_t v11 = a3;
      uint64_t v12 = a2 + 8;
      uint64_t v13 = 16;
      ssize_t v14 = NSComparisonPredicate_ptr;
      id v36 = (id)v11;
      do
      {
        long long v15 = *(const char **)v12;
        if (v10 == *(char **)(v12 - 8))
        {
          id v16 = v6;
          uint64_t v17 = *(unsigned __int8 *)(v12 + 8);
          uint64_t v18 = v9[49];
          uint64_t v19 = v18 + v13;
          long long v20 = v16;
          uint64_t v21 = objc_msgSend(v14[23], "stringWithUTF8String:");
          long long v22 = *(void **)(v18 + v13 - 16);
          *(void *)(v19 - 16) = v21;

          uint64_t v23 = [v14[23] stringWithUTF8String:v15];
          unint64_t v24 = *(void **)(v18 + v13 - 8);
          *(void *)(v19 - 8) = v23;

          if (v17)
          {
            uint64_t v25 = [v14[23] stringWithFormat:@"%@.%@.enableLog", *(void *)(v19 - 16), *(void *)(v19 - 8)];
            unint64_t v26 = *(void **)(v18 + v13);
            *(void *)(v18 + v13) = v25;
          }
          else
          {
            unint64_t v26 = *(void **)(v18 + v13);
            *(void *)(v18 + v13) = 0;
          }

          int v6 = v20;
          os_log_t v28 = os_log_create(v20, v15);
          va_list v29 = *(void **)(v18 + v13 + 8);
          *(void *)(v18 + v13 + 8) = v28;

          GTCoreLog_enabled(v19 - 16);
          size_t v9 = &s_accelerationStructuresByStreamRef;
          unint64_t v11 = (unint64_t)v36;
          ssize_t v14 = NSComparisonPredicate_ptr;
        }
        else
        {
          if (s_logUsingOsLog)
          {
            unint64_t v27 = gt_default_log();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              unint64_t v39 = v15;
              __int16 v40 = 1024;
              int v41 = (int)v10;
              _os_log_error_impl(&def_CFBEC, v27, OS_LOG_TYPE_ERROR, "warning: Invalid tag ID for %s, %d expected. Falling back to OS_LOG_DEFAULT", buf, 0x12u);
            }
          }
          else
          {
            long long v30 = __stderrp;
            unint64_t v27 = [v14[23] stringWithFormat:@"warning: Invalid tag ID for %s, %d expected. Falling back to OS_LOG_DEFAULT", v15, v10];
            fprintf(v30, "%s\n", (const char *)[v27 UTF8String]);
          }

          objc_storeStrong((id *)(v9[49] + v13 + 8), &_os_log_default);
        }
        ++v10;
        v13 += 32;
        v12 += 24;
      }
      while ((char *)v11 != v10);
    }
    int v31 = +[NSUserDefaults standardUserDefaults];
    unsigned __int8 v32 = [v31 BOOLForKey:@"GPUToolsPerfLogging"];

    if (v32)
    {
      os_log_t v33 = os_log_create(v6, "");
      vm_address_t v34 = g_signpostLog;
      g_signpostLog = v33;
    }
  }
  else if (s_logUsingOsLog)
  {
    id v3 = gt_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      unint64_t v39 = "Log already initialized, did you call GTCoreLogInit twice?";
      _os_log_error_impl(&def_CFBEC, v3, OS_LOG_TYPE_ERROR, "warning: %s", buf, 0xCu);
    }
  }
  else
  {
    BOOL v35 = __stderrp;
    id v37 = +[NSString stringWithFormat:@"warning: %s", "Log already initialized, did you call GTCoreLogInit twice?"];
    fprintf(v35, "%s\n", (const char *)[v37 UTF8String]);
  }
}

uint64_t GTCoreLogTagEnabled(unint64_t a1)
{
  if (s_logCount <= a1) {
    return 0;
  }
  memset(v3, 0, sizeof(v3));
  __copy_constructor_8_8_s0_s8_s16_s24(v3, (id *)(s_logs + 32 * a1));
  uint64_t v1 = GTCoreLog_enabled((uint64_t)v3);
  __destructor_8_s0_s8_s16_s24((uint64_t)v3);
  return v1;
}

uint64_t GTCoreLogUseStandardOutputStreams(uint64_t result)
{
  s_logUsingOsLog = result ^ 1;
  return result;
}

uint64_t GTCorePlatformGet()
{
  return 1;
}

BOOL GTCorePlatform_isTranslated()
{
  int v3 = 0;
  size_t v2 = 4;
  if (sysctlbyname("sysctl.proc_translated", &v3, &v2, 0, 0)) {
    BOOL v0 = 1;
  }
  else {
    BOOL v0 = v3 == 0;
  }
  return !v0;
}

uint64_t GTCorePlatform_isInternal()
{
  return os_variant_has_internal_content();
}

id GTCorePlatform_isCatalyst()
{
  BOOL v0 = +[NSProcessInfo processInfo];
  id v1 = [v0 isMacCatalystApp];

  return v1;
}

id GTCorePlatform_isAlmond()
{
  BOOL v0 = +[NSProcessInfo processInfo];
  id v1 = [v0 isiOSAppOnMac];

  return v1;
}

id PrettifyFenumString(void *a1, int a2, int a3)
{
  id v5 = a1;
  if (v5)
  {
    int v6 = v5;
    if ([v5 hasPrefix:@"kDYFE"])
    {
      uint64_t v7 = [v6 substringFromIndex:5];

      int v6 = (void *)v7;
    }
    id v8 = [v6 rangeOfString:@"_"];
    if (v8 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v10 = objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:options:range:", @"_", @" ", 0, v8, v9);

      int v6 = (void *)v10;
    }
    unint64_t v11 = [v6 stringByReplacingOccurrencesOfString:@"_" withString:@":"];

    CFStringRef v12 = @"-";
    if (a2) {
      CFStringRef v12 = @"+";
    }
    CFStringRef v13 = &stru_223D10;
    if (a3) {
      CFStringRef v13 = @":";
    }
    ssize_t v14 = +[NSString stringWithFormat:@"%@[%@%@]", v12, v11, v13];
  }
  else
  {
    ssize_t v14 = 0;
  }

  return v14;
}

void GTError_initialize()
{
  if (GTError_initialize_onceToken != -1) {
    dispatch_once(&GTError_initialize_onceToken, &__block_literal_global_14873);
  }
}

void GTError_addError(int *a1, uint64_t a2)
{
  if (a1 && *(_DWORD *)(a2 + 4))
  {
    if (GTError_initialize_onceToken != -1) {
      dispatch_once(&GTError_initialize_onceToken, &__block_literal_global_14873);
    }
    if (a1[1])
    {
      int v4 = *(_DWORD *)a2 | *a1 | 2;
    }
    else
    {
      int v5 = *a1;
      long long v7 = *(_OWORD *)(a2 + 16);
      long long v6 = *(_OWORD *)(a2 + 32);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *((_OWORD *)a1 + 1) = v7;
      *((_OWORD *)a1 + 2) = v6;
      int v4 = *a1 | v5;
    }
    *a1 = v4;
  }
}

const char *GTError_description(uint64_t a1)
{
  if (!a1) {
    return "";
  }
  uint64_t v1 = a1;
  if (GTError_initialize_onceToken != -1) {
    dispatch_once(&GTError_initialize_onceToken, &__block_literal_global_14873);
  }
  size_t v2 = "";
  do
  {
    int v3 = *(_DWORD *)(v1 + 4);
    int v4 = (apr_pool_t *)s_errorPool;
    if (v3 == 500)
    {
      int v5 = apr_pstrcat((apr_pool_t *)s_errorPool, v2, "Assertion failed: ", *(void *)(v1 + 8), 0);
    }
    else
    {
      long long v7 = apr_itoa((apr_pool_t *)s_errorPool, v3);
      int v5 = apr_pstrcat(v4, v2, "Code: ", v7, 0);
    }
    size_t v2 = v5;
    uint64_t v1 = *(void *)(v1 + 40);
  }
  while (v1);
  return v2;
}

uint64_t __GLOBAL_init_65535()
{
  return __cxa_atexit((void (*)(void *))CaptureExit, 0, &def_CFBEC);
}

CFTimeInterval CACurrentMediaTime(void)
{
  return _CACurrentMediaTime();
}

CATransform3D *__cdecl CATransform3DConcat(CATransform3D *__return_ptr retstr, CATransform3D *a, CATransform3D *b)
{
  return _CATransform3DConcat(retstr, a, b);
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return _CATransform3DMakeTranslation(retstr, tx, ty, tz);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_SHA256(data, len, md);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreate(allocator, values, numValues, callBacks);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return _CFDataCreateWithBytesNoCopy(allocator, bytes, length, bytesDeallocator);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return _CFErrorCopyDescription(err);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return _CFHash(cf);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return _CFPropertyListCreateData(allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return _CFPropertyListCreateWithData(allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return _CFStringCreateArrayBySeparatingStrings(alloc, theString, separatorString);
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return _CFStringCreateExternalRepresentation(alloc, theString, encoding, lossByte);
}

CFStringRef CFStringCreateFromExternalRepresentation(CFAllocatorRef alloc, CFDataRef data, CFStringEncoding encoding)
{
  return _CFStringCreateFromExternalRepresentation(alloc, data, encoding);
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return _CFStringCreateWithFileSystemRepresentation(alloc, buffer);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

double CFStringGetDoubleValue(CFStringRef str)
{
  return _CFStringGetDoubleValue(str);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return _CFStringGetFileSystemRepresentation(string, buffer, maxBufLen);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return _CFUUIDCreate(alloc);
}

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return _CFUUIDCreateFromString(alloc, uuidStr);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  CFUUIDBytes v3 = _CFUUIDGetUUIDBytes(uuid);
  uint64_t v2 = *(void *)&v3.byte8;
  uint64_t v1 = *(void *)&v3.byte0;
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return _CGColorCreate(space, components);
}

CFPropertyListRef CGColorSpaceCopyPropertyList(CGColorSpaceRef space)
{
  return _CGColorSpaceCopyPropertyList(space);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return _CGColorSpaceCreateDeviceRGB();
}

uint64_t GSSystemRootDirectory()
{
  return _GSSystemRootDirectory();
}

uint64_t GTTransportServiceDaemonConnectionNew()
{
  return _GTTransportServiceDaemonConnectionNew();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

Boolean IOSurfaceAllowsPixelSizeCasting(IOSurfaceRef buffer)
{
  return _IOSurfaceAllowsPixelSizeCasting(buffer);
}

CFDictionaryRef IOSurfaceCopyAllValues(IOSurfaceRef buffer)
{
  return _IOSurfaceCopyAllValues(buffer);
}

uint64_t IOSurfaceGetAddressFormatOfPlane()
{
  return _IOSurfaceGetAddressFormatOfPlane();
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return _IOSurfaceGetAllocSize(buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return _IOSurfaceGetBaseAddress(buffer);
}

uint64_t IOSurfaceGetBaseAddressOfCompressedTileDataRegionOfPlane()
{
  return _IOSurfaceGetBaseAddressOfCompressedTileDataRegionOfPlane();
}

uint64_t IOSurfaceGetBaseAddressOfCompressedTileHeaderRegionOfPlane()
{
  return _IOSurfaceGetBaseAddressOfCompressedTileHeaderRegionOfPlane();
}

void *__cdecl IOSurfaceGetBaseAddressOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return _IOSurfaceGetBaseAddressOfPlane(buffer, planeIndex);
}

uint64_t IOSurfaceGetBytesPerCompressedTileHeaderOfPlane()
{
  return _IOSurfaceGetBytesPerCompressedTileHeaderOfPlane();
}

size_t IOSurfaceGetBytesPerElement(IOSurfaceRef buffer)
{
  return _IOSurfaceGetBytesPerElement(buffer);
}

size_t IOSurfaceGetBytesPerElementOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return _IOSurfaceGetBytesPerElementOfPlane(buffer, planeIndex);
}

size_t IOSurfaceGetBytesPerRow(IOSurfaceRef buffer)
{
  return _IOSurfaceGetBytesPerRow(buffer);
}

size_t IOSurfaceGetBytesPerRowOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return _IOSurfaceGetBytesPerRowOfPlane(buffer, planeIndex);
}

uint64_t IOSurfaceGetBytesPerRowOfTileDataOfPlane()
{
  return _IOSurfaceGetBytesPerRowOfTileDataOfPlane();
}

uint64_t IOSurfaceGetBytesPerTileDataOfPlane()
{
  return _IOSurfaceGetBytesPerTileDataOfPlane();
}

uint64_t IOSurfaceGetCacheMode()
{
  return _IOSurfaceGetCacheMode();
}

uint64_t IOSurfaceGetCompressedTileHeightOfPlane()
{
  return _IOSurfaceGetCompressedTileHeightOfPlane();
}

uint64_t IOSurfaceGetCompressedTileWidthOfPlane()
{
  return _IOSurfaceGetCompressedTileWidthOfPlane();
}

uint64_t IOSurfaceGetCompressionFootprintOfPlane()
{
  return _IOSurfaceGetCompressionFootprintOfPlane();
}

uint64_t IOSurfaceGetCompressionTypeOfPlane()
{
  return _IOSurfaceGetCompressionTypeOfPlane();
}

size_t IOSurfaceGetElementHeight(IOSurfaceRef buffer)
{
  return _IOSurfaceGetElementHeight(buffer);
}

size_t IOSurfaceGetElementHeightOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return _IOSurfaceGetElementHeightOfPlane(buffer, planeIndex);
}

size_t IOSurfaceGetElementWidth(IOSurfaceRef buffer)
{
  return _IOSurfaceGetElementWidth(buffer);
}

size_t IOSurfaceGetElementWidthOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return _IOSurfaceGetElementWidthOfPlane(buffer, planeIndex);
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return _IOSurfaceGetHeight(buffer);
}

uint64_t IOSurfaceGetHeightInCompressedTilesOfPlane()
{
  return _IOSurfaceGetHeightInCompressedTilesOfPlane();
}

size_t IOSurfaceGetHeightOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return _IOSurfaceGetHeightOfPlane(buffer, planeIndex);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return _IOSurfaceGetPixelFormat(buffer);
}

size_t IOSurfaceGetPlaneCount(IOSurfaceRef buffer)
{
  return _IOSurfaceGetPlaneCount(buffer);
}

uint64_t IOSurfaceGetProtectionOptions()
{
  return _IOSurfaceGetProtectionOptions();
}

uint64_t IOSurfaceGetSizeOfPlane()
{
  return _IOSurfaceGetSizeOfPlane();
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return _IOSurfaceGetWidth(buffer);
}

uint64_t IOSurfaceGetWidthInCompressedTilesOfPlane()
{
  return _IOSurfaceGetWidthInCompressedTilesOfPlane();
}

size_t IOSurfaceGetWidthOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return _IOSurfaceGetWidthOfPlane(buffer, planeIndex);
}

uint64_t IOSurfaceGetYCbCrMatrix()
{
  return _IOSurfaceGetYCbCrMatrix();
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return _IOSurfaceLock(buffer, options, seed);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return _IOSurfaceUnlock(buffer, options, seed);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGCopyMultipleAnswers()
{
  return _MGCopyMultipleAnswers();
}

uint64_t MGIsQuestionValid()
{
  return _MGIsQuestionValid();
}

id MTLCreateSystemDefaultDevice(void)
{
  return _MTLCreateSystemDefaultDevice();
}

uint64_t MTLGetTextureLevelInfoForDeviceWithOptions()
{
  return _MTLGetTextureLevelInfoForDeviceWithOptions();
}

uint64_t MTLPixelFormatGetInfoForDevice()
{
  return _MTLPixelFormatGetInfoForDevice();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSUInteger NSRoundUpToMultipleOfPageSize(NSUInteger bytes)
{
  return _NSRoundUpToMultipleOfPageSize(bytes);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

int32_t NSVersionOfLinkTimeLibrary(const char *libraryName)
{
  return _NSVersionOfLinkTimeLibrary(libraryName);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFExecutableLinkedOnOrAfter()
{
  return __CFExecutableLinkedOnOrAfter();
}

uint64_t _MTLConstantDataSize()
{
  return __MTLConstantDataSize();
}

int _NSGetExecutablePath(char *buf, uint32_t *bufsize)
{
  return __NSGetExecutablePath(buf, bufsize);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

size_t std::__next_prime(size_t __n)
{
  return std::__next_prime(__n);
}

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::terminate(void)
{
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

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return ___cxa_atexit(lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

int *__error(void)
{
  return ___error();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return ___maskrune(a1, a2);
}

uint64_t __memcpy_chk()
{
  return ___memcpy_chk();
}

uint64_t __strcat_chk()
{
  return ___strcat_chk();
}

uint64_t __udivti3()
{
  return ___udivti3();
}

uint64_t _objc_addWillInitializeClassFunc()
{
  return __objc_addWillInitializeClassFunc();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

int accept(int a1, sockaddr *a2, socklen_t *a3)
{
  return _accept(a1, a2, a3);
}

int atexit(void (*a1)(void))
{
  return _atexit(a1);
}

int atoi(const char *a1)
{
  return _atoi(a1);
}

int backtrace(void **a1, int a2)
{
  return _backtrace(a1, a2);
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return _bind(a1, a2, a3);
}

void *__cdecl bsearch(const void *__key, const void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return _bsearch(__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return _class_addMethod(cls, name, imp, types);
}

BOOL class_addProtocol(Class cls, Protocol *protocol)
{
  return _class_addProtocol(cls, protocol);
}

Method class_getClassMethod(Class cls, SEL name)
{
  return _class_getClassMethod(cls, name);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return _class_getInstanceMethod(cls, name);
}

int close(int a1)
{
  return _close(a1);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return _compression_decode_buffer(dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, algorithm);
}

size_t compression_decode_scratch_buffer_size(compression_algorithm algorithm)
{
  return _compression_decode_scratch_buffer_size(algorithm);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return _connect(a1, a2, a3);
}

int creat(const char *a1, mode_t a2)
{
  return _creat(a1, a2);
}

int deflate(z_streamp strm, int flush)
{
  return _deflate(strm, flush);
}

int deflateEnd(z_streamp strm)
{
  return _deflateEnd(strm);
}

int deflateInit_(z_streamp strm, int level, const char *version, int stream_size)
{
  return _deflateInit_(strm, level, version, stream_size);
}

int deflateReset(z_streamp strm)
{
  return _deflateReset(strm);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

BOOL dispatch_data_apply(dispatch_data_t data, dispatch_data_applier_t applier)
{
  return _dispatch_data_apply(data, applier);
}

dispatch_data_t dispatch_data_create_map(dispatch_data_t data, const void **buffer_ptr, size_t *size_ptr)
{
  return _dispatch_data_create_map(data, buffer_ptr, size_ptr);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t dispatch_queue_attr_make_with_overcommit()
{
  return _dispatch_queue_attr_make_with_overcommit();
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return _dispatch_queue_create_with_target_V2(label, attr, target);
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

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

uintptr_t dispatch_source_get_handle(dispatch_source_t source)
{
  return _dispatch_source_get_handle(source);
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
  return _dispatch_source_testcancel(source);
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

int fchown(int a1, uid_t a2, gid_t a3)
{
  return _fchown(a1, a2, a3);
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

int fileno(FILE *a1)
{
  return _fileno(a1);
}

int flock(int a1, int a2)
{
  return _flock(a1, a2);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

pid_t fork(void)
{
  return _fork();
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

int ftruncate(int a1, off_t a2)
{
  return _ftruncate(a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

const char *__cdecl gai_strerror(int a1)
{
  return _gai_strerror(a1);
}

char *__cdecl getenv(const char *a1)
{
  return _getenv(a1);
}

int gethostname(char *a1, size_t a2)
{
  return _gethostname(a1, a2);
}

int gethostuuid(uuid_t a1, const timespec *a2)
{
  return _gethostuuid(a1, a2);
}

int getpagesize(void)
{
  return _getpagesize();
}

pid_t getpid(void)
{
  return _getpid();
}

const char *getprogname(void)
{
  return _getprogname();
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

tm *__cdecl gmtime_r(const time_t *a1, tm *a2)
{
  return _gmtime_r(a1, a2);
}

int kill(pid_t a1, int a2)
{
  return _kill(a1, a2);
}

int listen(int a1, int a2)
{
  return _listen(a1, a2);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return _localtime_r(a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return _lseek(a1, a2, a3);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return _mach_error_string(error_value);
}

kern_return_t mach_make_memory_entry_64(vm_map_t target_task, memory_object_size_t *size, memory_object_offset_t offset, vm_prot_t permission, mach_port_t *object_handle, mem_entry_name_port_t parent_entry)
{
  return _mach_make_memory_entry_64(target_task, size, offset, permission, object_handle, parent_entry);
}

kern_return_t mach_memory_entry_ownership(mem_entry_name_port_t mem_entry, task_t owner, int ledger_tag, int ledger_flags)
{
  return _mach_memory_entry_ownership(mem_entry, owner, ledger_tag, ledger_flags);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return _mach_msg(msg, option, send_size, rcv_size, rcv_name, timeout, notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

mach_msg_return_t mach_msg_server(BOOLean_t (__cdecl *a1)(mach_msg_header_t *, mach_msg_header_t *), mach_msg_size_t a2, mach_port_t a3, mach_msg_options_t a4)
{
  return _mach_msg_server(a1, a2, a3, a4);
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return _mach_port_allocate(task, right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return _mach_port_deallocate(task, name);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return _mach_port_insert_right(task, name, poly, polyPoly);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
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

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

IMP method_setImplementation(Method m, IMP imp)
{
  return _method_setImplementation(m, imp);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
}

mach_port_t mig_get_reply_port(void)
{
  return _mig_get_reply_port();
}

void mig_put_reply_port(mach_port_t reply_port)
{
}

int mkstemp(char *a1)
{
  return _mkstemp(a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return _mmap(a1, a2, a3, a4, a5, a6);
}

long double modf(long double __x, long double *__y)
{
  return _modf(__x, __y);
}

int mprotect(void *a1, size_t a2, int a3)
{
  return _mprotect(a1, a2, a3);
}

int munmap(void *a1, size_t a2)
{
  return _munmap(a1, a2);
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

void objc_exception_rethrow(void)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

Protocol *__cdecl objc_getProtocol(const char *name)
{
  return _objc_getProtocol(name);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeak(id *location)
{
  return _objc_loadWeak(location);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

const char *__cdecl object_getClassName(id a1)
{
  return _object_getClassName(a1);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return _os_signpost_id_make_with_pointer(log, ptr);
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return _os_unfair_lock_trylock(lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

int poll(pollfd *a1, nfds_t a2, int a3)
{
  return _poll(a1, a2, a3);
}

BOOL protocol_isEqual(Protocol *proto, Protocol *other)
{
  return _protocol_isEqual(proto, other);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return _pthread_attr_destroy(a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return _pthread_attr_init(a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return _pthread_attr_setdetachstate(a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create(a1, a2, a3, a4);
}

int pthread_detach(pthread_t a1)
{
  return _pthread_detach(a1);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return _pthread_mutex_destroy(a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return _pthread_mutex_init(a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_trylock(pthread_mutex_t *a1)
{
  return _pthread_mutex_trylock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return _pthread_mutexattr_destroy(a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return _pthread_mutexattr_init(a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return _pthread_mutexattr_settype(a1, a2);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return _pthread_once(a1, a2);
}

int pthread_setname_np(const char *a1)
{
  return _pthread_setname_np(a1);
}

int pthread_sigmask(int a1, const sigset_t *a2, sigset_t *a3)
{
  return _pthread_sigmask(a1, a2, a3);
}

int pthread_threadid_np(pthread_t a1, __uint64_t *a2)
{
  return _pthread_threadid_np(a1, a2);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return _pwrite(__fd, __buf, __nbyte, a4);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return _recv(a1, a2, a3, a4);
}

uint64_t registerService()
{
  return _registerService();
}

uint64_t sandbox_extension_consume()
{
  return _sandbox_extension_consume();
}

uint64_t sandbox_extension_release()
{
  return _sandbox_extension_release();
}

const char *__cdecl sel_getName(SEL sel)
{
  return _sel_getName(sel);
}

SEL sel_getUid(const char *str)
{
  return _sel_getUid(str);
}

int select(int a1, fd_set *a2, fd_set *a3, fd_set *a4, timeval *a5)
{
  return _select(a1, a2, a3, a4, a5);
}

int semctl(int a1, int a2, int a3, ...)
{
  return _semctl(a1, a2, a3);
}

int semget(key_t a1, int a2, int a3)
{
  return _semget(a1, a2, a3);
}

int semop(int a1, sembuf *a2, size_t a3)
{
  return _semop(a1, a2, a3);
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return _send(a1, a2, a3, a4);
}

char *__cdecl setlocale(int a1, const char *a2)
{
  return _setlocale(a1, a2);
}

int shm_open(const char *a1, int a2, ...)
{
  return _shm_open(a1, a2);
}

int shm_unlink(const char *a1)
{
  return _shm_unlink(a1);
}

int sigaction(int a1, const sigaction *a2, sigaction *a3)
{
  return _sigaction(a1, a2, a3);
}

int sigwait(const sigset_t *a1, int *a2)
{
  return _sigwait(a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return _socket(a1, a2, a3);
}

int sprintf(char *a1, const char *a2, ...)
{
  return _sprintf(a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return _strcasecmp(a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return _strchr(__s, __c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return _strcpy(__dst, __src);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return _strerror_r(__errnum, __strerrbuf, __buflen);
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

char *__cdecl strrchr(char *__s, int __c)
{
  return _strrchr(__s, __c);
}

float strtof(const char *a1, char **a2)
{
  return _strtof(a1, a2);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

int symlink(const char *a1, const char *a2)
{
  return _symlink(a1, a2);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

kern_return_t task_set_exception_ports(task_t task, exception_mask_t exception_mask, mach_port_t new_port, exception_behavior_t behavior, thread_state_flavor_t new_flavor)
{
  return _task_set_exception_ports(task, exception_mask, new_port, behavior, new_flavor);
}

kern_return_t task_suspend(task_read_t target_task)
{
  return _task_suspend(target_task);
}

kern_return_t task_swap_exception_ports(task_t task, exception_mask_t exception_mask, mach_port_t new_port, exception_behavior_t behavior, thread_state_flavor_t new_flavor, exception_mask_array_t masks, mach_msg_type_number_t *masksCnt, exception_handler_array_t old_handlers, exception_behavior_array_t old_behaviors, exception_flavor_array_t old_flavors)
{
  return _task_swap_exception_ports(task, exception_mask, new_port, behavior, new_flavor, masks, masksCnt, old_handlers, old_behaviors, old_flavors);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return _vm_allocate(target_task, address, size, flags);
}

kern_return_t vm_copy(vm_map_t target_task, vm_address_t source_address, vm_size_t size, vm_address_t dest_address)
{
  return _vm_copy(target_task, source_address, size, dest_address);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return _vm_deallocate(target_task, address, size);
}

kern_return_t vm_map(vm_map_t target_task, vm_address_t *address, vm_size_t size, vm_address_t mask, int flags, mem_entry_name_port_t object, vm_offset_t offset, BOOLean_t copy, vm_prot_t cur_protection, vm_prot_t max_protection, vm_inherit_t inheritance)
{
  return _vm_map(target_task, address, size, mask, flags, object, offset, copy, cur_protection, max_protection, inheritance);
}

kern_return_t vm_protect(vm_map_t target_task, vm_address_t address, vm_size_t size, BOOLean_t set_maximum, vm_prot_t new_protection)
{
  return _vm_protect(target_task, address, size, set_maximum, new_protection);
}

kern_return_t vm_remap(vm_map_t target_task, vm_address_t *target_address, vm_size_t size, vm_address_t mask, int flags, vm_map_t src_task, vm_address_t src_address, BOOLean_t copy, vm_prot_t *cur_protection, vm_prot_t *max_protection, vm_inherit_t inheritance)
{
  return _vm_remap(target_task, target_address, size, mask, flags, src_task, src_address, copy, cur_protection, max_protection, inheritance);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return _voucher_mach_msg_set(msg);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return _waitpid(a1, a2, a3);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

ssize_t writev(int a1, const iovec *a2, int a3)
{
  return _writev(a1, a2, a3);
}

id objc_msgSend_GPUBVHBuilder(void *a1, const char *a2, ...)
{
  return [a1 GPUBVHBuilder];
}

id objc_msgSend_GPUEndTime(void *a1, const char *a2, ...)
{
  return [a1 GPUEndTime];
}

id objc_msgSend_GPUStartTime(void *a1, const char *a2, ...)
{
  return [a1 GPUStartTime];
}

id objc_msgSend_GTGPUToolsData(void *a1, const char *a2, ...)
{
  return [a1 GTGPUToolsData];
}

id objc_msgSend_IOSurfaceSharedEvent(void *a1, const char *a2, ...)
{
  return [a1 IOSurfaceSharedEvent];
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__allocateMessageBuffer(void *a1, const char *a2, ...)
{
  return [a1 _allocateMessageBuffer];
}

id objc_msgSend__aneIOSurface(void *a1, const char *a2, ...)
{
  return [a1 _aneIOSurface];
}

id objc_msgSend__callCancellationHandler(void *a1, const char *a2, ...)
{
  return [a1 _callCancellationHandler];
}

id objc_msgSend__callRegistrationHandler(void *a1, const char *a2, ...)
{
  return [a1 _callRegistrationHandler];
}

id objc_msgSend__cancel(void *a1, const char *a2, ...)
{
  return [a1 _cancel];
}

id objc_msgSend__clearBuffers(void *a1, const char *a2, ...)
{
  return [a1 _clearBuffers];
}

id objc_msgSend__computeBytesAvailableToRead(void *a1, const char *a2, ...)
{
  return [a1 _computeBytesAvailableToRead];
}

id objc_msgSend__computeBytesAvailableToWrite(void *a1, const char *a2, ...)
{
  return [a1 _computeBytesAvailableToWrite];
}

id objc_msgSend__dequeueIncomingMessages(void *a1, const char *a2, ...)
{
  return [a1 _dequeueIncomingMessages];
}

id objc_msgSend__dequeuePacket(void *a1, const char *a2, ...)
{
  return [a1 _dequeuePacket];
}

id objc_msgSend__descriptorPrivate(void *a1, const char *a2, ...)
{
  return [a1 _descriptorPrivate];
}

id objc_msgSend__destroySharedMemoryTransport(void *a1, const char *a2, ...)
{
  return [a1 _destroySharedMemoryTransport];
}

id objc_msgSend__encodeDownloadPoint(void *a1, const char *a2, ...)
{
  return [a1 _encodeDownloadPoint];
}

id objc_msgSend__initArgumentBufferPatchingTypes(void *a1, const char *a2, ...)
{
  return [a1 _initArgumentBufferPatchingTypes];
}

id objc_msgSend__initDummyEncoder(void *a1, const char *a2, ...)
{
  return [a1 _initDummyEncoder];
}

id objc_msgSend__invalidate(void *a1, const char *a2, ...)
{
  return [a1 _invalidate];
}

id objc_msgSend__nextMessageSerial(void *a1, const char *a2, ...)
{
  return [a1 _nextMessageSerial];
}

id objc_msgSend__readAndAccumulate(void *a1, const char *a2, ...)
{
  return [a1 _readAndAccumulate];
}

id objc_msgSend__readAndAccumulateLoop(void *a1, const char *a2, ...)
{
  return [a1 _readAndAccumulateLoop];
}

id objc_msgSend__register(void *a1, const char *a2, ...)
{
  return [a1 _register];
}

id objc_msgSend__setupIOBuffers(void *a1, const char *a2, ...)
{
  return [a1 _setupIOBuffers];
}

id objc_msgSend__tearDownSharedMemory(void *a1, const char *a2, ...)
{
  return [a1 _tearDownSharedMemory];
}

id objc_msgSend__unpackAndDispatchMessage(void *a1, const char *a2, ...)
{
  return [a1 _unpackAndDispatchMessage];
}

id objc_msgSend__waitEAGAIN(void *a1, const char *a2, ...)
{
  return [a1 _waitEAGAIN];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_accelerationStructureCommandEncoder(void *a1, const char *a2, ...)
{
  return [a1 accelerationStructureCommandEncoder];
}

id objc_msgSend_accelerationStructureCommandEncoderPreamble(void *a1, const char *a2, ...)
{
  return [a1 accelerationStructureCommandEncoderPreamble];
}

id objc_msgSend_accelerationStructureDescriptorProcessEvent(void *a1, const char *a2, ...)
{
  return [a1 accelerationStructureDescriptorProcessEvent];
}

id objc_msgSend_accelerationStructureUniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 accelerationStructureUniqueIdentifier];
}

id objc_msgSend_acceleratorPort(void *a1, const char *a2, ...)
{
  return [a1 acceleratorPort];
}

id objc_msgSend_access(void *a1, const char *a2, ...)
{
  return [a1 access];
}

id objc_msgSend_addBarrier(void *a1, const char *a2, ...)
{
  return [a1 addBarrier];
}

id objc_msgSend_additionalCompilerArguments(void *a1, const char *a2, ...)
{
  return [a1 additionalCompilerArguments];
}

id objc_msgSend_aliasImplicitImageBlock(void *a1, const char *a2, ...)
{
  return [a1 aliasImplicitImageBlock];
}

id objc_msgSend_aliasImplicitImageBlockRenderTarget(void *a1, const char *a2, ...)
{
  return [a1 aliasImplicitImageBlockRenderTarget];
}

id objc_msgSend_alignment(void *a1, const char *a2, ...)
{
  return [a1 alignment];
}

id objc_msgSend_allCaptureScopes(void *a1, const char *a2, ...)
{
  return [a1 allCaptureScopes];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_allocatedSize(void *a1, const char *a2, ...)
{
  return [a1 allocatedSize];
}

id objc_msgSend_allocationCount(void *a1, const char *a2, ...)
{
  return [a1 allocationCount];
}

id objc_msgSend_allocationID(void *a1, const char *a2, ...)
{
  return [a1 allocationID];
}

id objc_msgSend_allowDuplicateIntersectionFunctionInvocation(void *a1, const char *a2, ...)
{
  return [a1 allowDuplicateIntersectionFunctionInvocation];
}

id objc_msgSend_allowGPUOptimizedContents(void *a1, const char *a2, ...)
{
  return [a1 allowGPUOptimizedContents];
}

id objc_msgSend_allowReferencingUndefinedSymbols(void *a1, const char *a2, ...)
{
  return [a1 allowReferencingUndefinedSymbols];
}

id objc_msgSend_allowsKeyedCoding(void *a1, const char *a2, ...)
{
  return [a1 allowsKeyedCoding];
}

id objc_msgSend_alphaBlendOperation(void *a1, const char *a2, ...)
{
  return [a1 alphaBlendOperation];
}

id objc_msgSend_alphaTestFunction(void *a1, const char *a2, ...)
{
  return [a1 alphaTestFunction];
}

id objc_msgSend_aluType(void *a1, const char *a2, ...)
{
  return [a1 aluType];
}

id objc_msgSend_anchorPoint(void *a1, const char *a2, ...)
{
  return [a1 anchorPoint];
}

id objc_msgSend_anchorPointZ(void *a1, const char *a2, ...)
{
  return [a1 anchorPointZ];
}

id objc_msgSend_apiTriggeredCapture(void *a1, const char *a2, ...)
{
  return [a1 apiTriggeredCapture];
}

id objc_msgSend_architecture(void *a1, const char *a2, ...)
{
  return [a1 architecture];
}

id objc_msgSend_areBarycentricCoordsSupported(void *a1, const char *a2, ...)
{
  return [a1 areBarycentricCoordsSupported];
}

id objc_msgSend_areGPUAssertionsEnabled(void *a1, const char *a2, ...)
{
  return [a1 areGPUAssertionsEnabled];
}

id objc_msgSend_areProgrammableSamplePositionsSupported(void *a1, const char *a2, ...)
{
  return [a1 areProgrammableSamplePositionsSupported];
}

id objc_msgSend_areRasterOrderGroupsSupported(void *a1, const char *a2, ...)
{
  return [a1 areRasterOrderGroupsSupported];
}

id objc_msgSend_areWritableHeapsEnabled(void *a1, const char *a2, ...)
{
  return [a1 areWritableHeapsEnabled];
}

id objc_msgSend_argumentBuffersSupport(void *a1, const char *a2, ...)
{
  return [a1 argumentBuffersSupport];
}

id objc_msgSend_argumentIndex(void *a1, const char *a2, ...)
{
  return [a1 argumentIndex];
}

id objc_msgSend_argumentIndexStride(void *a1, const char *a2, ...)
{
  return [a1 argumentIndexStride];
}

id objc_msgSend_arguments(void *a1, const char *a2, ...)
{
  return [a1 arguments];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_arrayLength(void *a1, const char *a2, ...)
{
  return [a1 arrayLength];
}

id objc_msgSend_asError(void *a1, const char *a2, ...)
{
  return [a1 asError];
}

id objc_msgSend_attributeIndex(void *a1, const char *a2, ...)
{
  return [a1 attributeIndex];
}

id objc_msgSend_attributeType(void *a1, const char *a2, ...)
{
  return [a1 attributeType];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return [a1 attributes];
}

id objc_msgSend_availableCounters(void *a1, const char *a2, ...)
{
  return [a1 availableCounters];
}

id objc_msgSend_availableCountersAndDict(void *a1, const char *a2, ...)
{
  return [a1 availableCountersAndDict];
}

id objc_msgSend_backFaceStencil(void *a1, const char *a2, ...)
{
  return [a1 backFaceStencil];
}

id objc_msgSend_backbuffer(void *a1, const char *a2, ...)
{
  return [a1 backbuffer];
}

id objc_msgSend_backgroundTrackingPID(void *a1, const char *a2, ...)
{
  return [a1 backgroundTrackingPID];
}

id objc_msgSend_barrier(void *a1, const char *a2, ...)
{
  return [a1 barrier];
}

id objc_msgSend_baseInstance(void *a1, const char *a2, ...)
{
  return [a1 baseInstance];
}

id objc_msgSend_baseObject(void *a1, const char *a2, ...)
{
  return [a1 baseObject];
}

id objc_msgSend_baseVertex(void *a1, const char *a2, ...)
{
  return [a1 baseVertex];
}

id objc_msgSend_beginVirtualSubstream(void *a1, const char *a2, ...)
{
  return [a1 beginVirtualSubstream];
}

id objc_msgSend_binaryArchives(void *a1, const char *a2, ...)
{
  return [a1 binaryArchives];
}

id objc_msgSend_binaryData(void *a1, const char *a2, ...)
{
  return [a1 binaryData];
}

id objc_msgSend_binaryFunctions(void *a1, const char *a2, ...)
{
  return [a1 binaryFunctions];
}

id objc_msgSend_bindIndex(void *a1, const char *a2, ...)
{
  return [a1 bindIndex];
}

id objc_msgSend_bindings(void *a1, const char *a2, ...)
{
  return [a1 bindings];
}

id objc_msgSend_bitCodeHash(void *a1, const char *a2, ...)
{
  return [a1 bitCodeHash];
}

id objc_msgSend_bitcodeData(void *a1, const char *a2, ...)
{
  return [a1 bitcodeData];
}

id objc_msgSend_blitCommandEncoder(void *a1, const char *a2, ...)
{
  return [a1 blitCommandEncoder];
}

id objc_msgSend_BOOLResult(void *a1, const char *a2, ...)
{
  return [a1 BOOLResult];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_borderColor(void *a1, const char *a2, ...)
{
  return [a1 borderColor];
}

id objc_msgSend_boundingBoxBuffer(void *a1, const char *a2, ...)
{
  return [a1 boundingBoxBuffer];
}

id objc_msgSend_boundingBoxBufferOffset(void *a1, const char *a2, ...)
{
  return [a1 boundingBoxBufferOffset];
}

id objc_msgSend_boundingBoxBuffers(void *a1, const char *a2, ...)
{
  return [a1 boundingBoxBuffers];
}

id objc_msgSend_boundingBoxCount(void *a1, const char *a2, ...)
{
  return [a1 boundingBoxCount];
}

id objc_msgSend_boundingBoxStride(void *a1, const char *a2, ...)
{
  return [a1 boundingBoxStride];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_broadcast(void *a1, const char *a2, ...)
{
  return [a1 broadcast];
}

id objc_msgSend_buffer(void *a1, const char *a2, ...)
{
  return [a1 buffer];
}

id objc_msgSend_bufferAlignment(void *a1, const char *a2, ...)
{
  return [a1 bufferAlignment];
}

id objc_msgSend_bufferBytesPerRow(void *a1, const char *a2, ...)
{
  return [a1 bufferBytesPerRow];
}

id objc_msgSend_bufferDataSize(void *a1, const char *a2, ...)
{
  return [a1 bufferDataSize];
}

id objc_msgSend_bufferDataType(void *a1, const char *a2, ...)
{
  return [a1 bufferDataType];
}

id objc_msgSend_bufferIndex(void *a1, const char *a2, ...)
{
  return [a1 bufferIndex];
}

id objc_msgSend_bufferOffset(void *a1, const char *a2, ...)
{
  return [a1 bufferOffset];
}

id objc_msgSend_bufferRobustnessSupport(void *a1, const char *a2, ...)
{
  return [a1 bufferRobustnessSupport];
}

id objc_msgSend_buffers(void *a1, const char *a2, ...)
{
  return [a1 buffers];
}

id objc_msgSend_builtInArguments(void *a1, const char *a2, ...)
{
  return [a1 builtInArguments];
}

id objc_msgSend_builtInDataType(void *a1, const char *a2, ...)
{
  return [a1 builtInDataType];
}

id objc_msgSend_builtInType(void *a1, const char *a2, ...)
{
  return [a1 builtInType];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bundlePath(void *a1, const char *a2, ...)
{
  return [a1 bundlePath];
}

id objc_msgSend_byteOffset(void *a1, const char *a2, ...)
{
  return [a1 byteOffset];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_callStackSymbols(void *a1, const char *a2, ...)
{
  return [a1 callStackSymbols];
}

id objc_msgSend_canGenerateMipmapLevels(void *a1, const char *a2, ...)
{
  return [a1 canGenerateMipmapLevels];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_captureAccelerationStructures(void *a1, const char *a2, ...)
{
  return [a1 captureAccelerationStructures];
}

id objc_msgSend_captureDescriptor(void *a1, const char *a2, ...)
{
  return [a1 captureDescriptor];
}

id objc_msgSend_captureEventListener(void *a1, const char *a2, ...)
{
  return [a1 captureEventListener];
}

id objc_msgSend_captureLibrary(void *a1, const char *a2, ...)
{
  return [a1 captureLibrary];
}

id objc_msgSend_captureMode(void *a1, const char *a2, ...)
{
  return [a1 captureMode];
}

id objc_msgSend_captureObject(void *a1, const char *a2, ...)
{
  return [a1 captureObject];
}

id objc_msgSend_captureRaytracingEnabled(void *a1, const char *a2, ...)
{
  return [a1 captureRaytracingEnabled];
}

id objc_msgSend_category(void *a1, const char *a2, ...)
{
  return [a1 category];
}

id objc_msgSend_clearBarrier(void *a1, const char *a2, ...)
{
  return [a1 clearBarrier];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_clearDepth(void *a1, const char *a2, ...)
{
  return [a1 clearDepth];
}

id objc_msgSend_clearStencil(void *a1, const char *a2, ...)
{
  return [a1 clearStencil];
}

id objc_msgSend_clipDistanceEnableMask(void *a1, const char *a2, ...)
{
  return [a1 clipDistanceEnableMask];
}

id objc_msgSend_closeFile(void *a1, const char *a2, ...)
{
  return [a1 closeFile];
}

id objc_msgSend_closeSocketDescriptor(void *a1, const char *a2, ...)
{
  return [a1 closeSocketDescriptor];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_colorAttachments(void *a1, const char *a2, ...)
{
  return [a1 colorAttachments];
}

id objc_msgSend_colorProcessingMode(void *a1, const char *a2, ...)
{
  return [a1 colorProcessingMode];
}

id objc_msgSend_colorSampleCount(void *a1, const char *a2, ...)
{
  return [a1 colorSampleCount];
}

id objc_msgSend_colorSpaceConversionMatrix(void *a1, const char *a2, ...)
{
  return [a1 colorSpaceConversionMatrix];
}

id objc_msgSend_colorTextureFormat(void *a1, const char *a2, ...)
{
  return [a1 colorTextureFormat];
}

id objc_msgSend_colorTextureUsage(void *a1, const char *a2, ...)
{
  return [a1 colorTextureUsage];
}

id objc_msgSend_colorspace(void *a1, const char *a2, ...)
{
  return [a1 colorspace];
}

id objc_msgSend_commandBuffer(void *a1, const char *a2, ...)
{
  return [a1 commandBuffer];
}

id objc_msgSend_commandBufferErrorOptions(void *a1, const char *a2, ...)
{
  return [a1 commandBufferErrorOptions];
}

id objc_msgSend_commandBufferWithUnretainedReferences(void *a1, const char *a2, ...)
{
  return [a1 commandBufferWithUnretainedReferences];
}

id objc_msgSend_commandQueue(void *a1, const char *a2, ...)
{
  return [a1 commandQueue];
}

id objc_msgSend_commandQueueStreamRef(void *a1, const char *a2, ...)
{
  return [a1 commandQueueStreamRef];
}

id objc_msgSend_commandTypes(void *a1, const char *a2, ...)
{
  return [a1 commandTypes];
}

id objc_msgSend_commanndBufferDescriptor(void *a1, const char *a2, ...)
{
  return [a1 commanndBufferDescriptor];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return [a1 commit];
}

id objc_msgSend_commitAndHold(void *a1, const char *a2, ...)
{
  return [a1 commitAndHold];
}

id objc_msgSend_commitAndWaitUntilSubmitted(void *a1, const char *a2, ...)
{
  return [a1 commitAndWaitUntilSubmitted];
}

id objc_msgSend_commitQueue(void *a1, const char *a2, ...)
{
  return [a1 commitQueue];
}

id objc_msgSend_commitSynchronously(void *a1, const char *a2, ...)
{
  return [a1 commitSynchronously];
}

id objc_msgSend_commitsWithQoS(void *a1, const char *a2, ...)
{
  return [a1 commitsWithQoS];
}

id objc_msgSend_compareFunction(void *a1, const char *a2, ...)
{
  return [a1 compareFunction];
}

id objc_msgSend_compileSymbolVisibility(void *a1, const char *a2, ...)
{
  return [a1 compileSymbolVisibility];
}

id objc_msgSend_completionHandler(void *a1, const char *a2, ...)
{
  return [a1 completionHandler];
}

id objc_msgSend_completionQueue(void *a1, const char *a2, ...)
{
  return [a1 completionQueue];
}

id objc_msgSend_compressionFeedback(void *a1, const char *a2, ...)
{
  return [a1 compressionFeedback];
}

id objc_msgSend_compressionFootprint(void *a1, const char *a2, ...)
{
  return [a1 compressionFootprint];
}

id objc_msgSend_compressionMode(void *a1, const char *a2, ...)
{
  return [a1 compressionMode];
}

id objc_msgSend_compressionType(void *a1, const char *a2, ...)
{
  return [a1 compressionType];
}

id objc_msgSend_computeCommandEncoder(void *a1, const char *a2, ...)
{
  return [a1 computeCommandEncoder];
}

id objc_msgSend_computeFunction(void *a1, const char *a2, ...)
{
  return [a1 computeFunction];
}

id objc_msgSend_computeFunctionCopyIndirectCommandBuffer(void *a1, const char *a2, ...)
{
  return [a1 computeFunctionCopyIndirectCommandBuffer];
}

id objc_msgSend_computePipelineCopyBuffer(void *a1, const char *a2, ...)
{
  return [a1 computePipelineCopyBuffer];
}

id objc_msgSend_computePipelineCopyIndirectCommandBuffer(void *a1, const char *a2, ...)
{
  return [a1 computePipelineCopyIndirectCommandBuffer];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_connect(void *a1, const char *a2, ...)
{
  return [a1 connect];
}

id objc_msgSend_connected(void *a1, const char *a2, ...)
{
  return [a1 connected];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_constantValues(void *a1, const char *a2, ...)
{
  return [a1 constantValues];
}

id objc_msgSend_contents(void *a1, const char *a2, ...)
{
  return [a1 contents];
}

id objc_msgSend_contentsScale(void *a1, const char *a2, ...)
{
  return [a1 contentsScale];
}

id objc_msgSend_controlDependencies(void *a1, const char *a2, ...)
{
  return [a1 controlDependencies];
}

id objc_msgSend_controlPointBuffer(void *a1, const char *a2, ...)
{
  return [a1 controlPointBuffer];
}

id objc_msgSend_controlPointBufferOffset(void *a1, const char *a2, ...)
{
  return [a1 controlPointBufferOffset];
}

id objc_msgSend_controlPointBuffers(void *a1, const char *a2, ...)
{
  return [a1 controlPointBuffers];
}

id objc_msgSend_controlPointCount(void *a1, const char *a2, ...)
{
  return [a1 controlPointCount];
}

id objc_msgSend_controlPointFormat(void *a1, const char *a2, ...)
{
  return [a1 controlPointFormat];
}

id objc_msgSend_controlPointIndexBufferVirtualAddress(void *a1, const char *a2, ...)
{
  return [a1 controlPointIndexBufferVirtualAddress];
}

id objc_msgSend_controlPointStride(void *a1, const char *a2, ...)
{
  return [a1 controlPointStride];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_copyGranularity(void *a1, const char *a2, ...)
{
  return [a1 copyGranularity];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_counterInfo(void *a1, const char *a2, ...)
{
  return [a1 counterInfo];
}

id objc_msgSend_counterSet(void *a1, const char *a2, ...)
{
  return [a1 counterSet];
}

id objc_msgSend_counterSets(void *a1, const char *a2, ...)
{
  return [a1 counterSets];
}

id objc_msgSend_counters(void *a1, const char *a2, ...)
{
  return [a1 counters];
}

id objc_msgSend_cpuCacheMode(void *a1, const char *a2, ...)
{
  return [a1 cpuCacheMode];
}

id objc_msgSend_cpuType(void *a1, const char *a2, ...)
{
  return [a1 cpuType];
}

id objc_msgSend_currentAllocatedSize(void *a1, const char *a2, ...)
{
  return [a1 currentAllocatedSize];
}

id objc_msgSend_currentGeneration(void *a1, const char *a2, ...)
{
  return [a1 currentGeneration];
}

id objc_msgSend_currentOrientation(void *a1, const char *a2, ...)
{
  return [a1 currentOrientation];
}

id objc_msgSend_currentPerformanceState(void *a1, const char *a2, ...)
{
  return [a1 currentPerformanceState];
}

id objc_msgSend_currentThread(void *a1, const char *a2, ...)
{
  return [a1 currentThread];
}

id objc_msgSend_currentViewToClipMatrix(void *a1, const char *a2, ...)
{
  return [a1 currentViewToClipMatrix];
}

id objc_msgSend_currentWorldToViewMatrix(void *a1, const char *a2, ...)
{
  return [a1 currentWorldToViewMatrix];
}

id objc_msgSend_curveBasis(void *a1, const char *a2, ...)
{
  return [a1 curveBasis];
}

id objc_msgSend_curveType(void *a1, const char *a2, ...)
{
  return [a1 curveType];
}

id objc_msgSend_customMessage(void *a1, const char *a2, ...)
{
  return [a1 customMessage];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_dataSize(void *a1, const char *a2, ...)
{
  return [a1 dataSize];
}

id objc_msgSend_dataType(void *a1, const char *a2, ...)
{
  return [a1 dataType];
}

id objc_msgSend_dataTypeDescription(void *a1, const char *a2, ...)
{
  return [a1 dataTypeDescription];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_deadlineProfile(void *a1, const char *a2, ...)
{
  return [a1 deadlineProfile];
}

id objc_msgSend_debugCommandEncoder(void *a1, const char *a2, ...)
{
  return [a1 debugCommandEncoder];
}

id objc_msgSend_debuggingEnabled(void *a1, const char *a2, ...)
{
  return [a1 debuggingEnabled];
}

id objc_msgSend_dedicatedMemorySize(void *a1, const char *a2, ...)
{
  return [a1 dedicatedMemorySize];
}

id objc_msgSend_defaultCaptureScope(void *a1, const char *a2, ...)
{
  return [a1 defaultCaptureScope];
}

id objc_msgSend_defaultColorSampleCount(void *a1, const char *a2, ...)
{
  return [a1 defaultColorSampleCount];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultRasterSampleCount(void *a1, const char *a2, ...)
{
  return [a1 defaultRasterSampleCount];
}

id objc_msgSend_defaultTextureWriteRoundingMode(void *a1, const char *a2, ...)
{
  return [a1 defaultTextureWriteRoundingMode];
}

id objc_msgSend_depth(void *a1, const char *a2, ...)
{
  return [a1 depth];
}

id objc_msgSend_depthAttachment(void *a1, const char *a2, ...)
{
  return [a1 depthAttachment];
}

id objc_msgSend_depthAttachmentPixelFormat(void *a1, const char *a2, ...)
{
  return [a1 depthAttachmentPixelFormat];
}

id objc_msgSend_depthCompareFunction(void *a1, const char *a2, ...)
{
  return [a1 depthCompareFunction];
}

id objc_msgSend_depthFailureOperation(void *a1, const char *a2, ...)
{
  return [a1 depthFailureOperation];
}

id objc_msgSend_depthPlane(void *a1, const char *a2, ...)
{
  return [a1 depthPlane];
}

id objc_msgSend_depthResolveFilter(void *a1, const char *a2, ...)
{
  return [a1 depthResolveFilter];
}

id objc_msgSend_depthStencilPassOperation(void *a1, const char *a2, ...)
{
  return [a1 depthStencilPassOperation];
}

id objc_msgSend_depthTextureFormat(void *a1, const char *a2, ...)
{
  return [a1 depthTextureFormat];
}

id objc_msgSend_depthTextureUsage(void *a1, const char *a2, ...)
{
  return [a1 depthTextureUsage];
}

id objc_msgSend_dereference(void *a1, const char *a2, ...)
{
  return [a1 dereference];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_destination(void *a1, const char *a2, ...)
{
  return [a1 destination];
}

id objc_msgSend_destinationAlphaBlendFactor(void *a1, const char *a2, ...)
{
  return [a1 destinationAlphaBlendFactor];
}

id objc_msgSend_destinationRGBBlendFactor(void *a1, const char *a2, ...)
{
  return [a1 destinationRGBBlendFactor];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_deviceAddress(void *a1, const char *a2, ...)
{
  return [a1 deviceAddress];
}

id objc_msgSend_deviceCreationFlags(void *a1, const char *a2, ...)
{
  return [a1 deviceCreationFlags];
}

id objc_msgSend_deviceLinearReadOnlyTextureAlignmentBytes(void *a1, const char *a2, ...)
{
  return [a1 deviceLinearReadOnlyTextureAlignmentBytes];
}

id objc_msgSend_deviceLinearTextureAlignmentBytes(void *a1, const char *a2, ...)
{
  return [a1 deviceLinearTextureAlignmentBytes];
}

id objc_msgSend_deviceStreamRef(void *a1, const char *a2, ...)
{
  return [a1 deviceStreamRef];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_disableCrossQueueHazardTracking(void *a1, const char *a2, ...)
{
  return [a1 disableCrossQueueHazardTracking];
}

id objc_msgSend_disableHashResources(void *a1, const char *a2, ...)
{
  return [a1 disableHashResources];
}

id objc_msgSend_disableRunTimeCompilation(void *a1, const char *a2, ...)
{
  return [a1 disableRunTimeCompilation];
}

id objc_msgSend_dispatchGroup(void *a1, const char *a2, ...)
{
  return [a1 dispatchGroup];
}

id objc_msgSend_dispatchThreadgroupsArguments(void *a1, const char *a2, ...)
{
  return [a1 dispatchThreadgroupsArguments];
}

id objc_msgSend_dispatchThreadsArguments(void *a1, const char *a2, ...)
{
  return [a1 dispatchThreadsArguments];
}

id objc_msgSend_dispatchType(void *a1, const char *a2, ...)
{
  return [a1 dispatchType];
}

id objc_msgSend_ditherEnabled(void *a1, const char *a2, ...)
{
  return [a1 ditherEnabled];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleFPConfig(void *a1, const char *a2, ...)
{
  return [a1 doubleFPConfig];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_downloadContext(void *a1, const char *a2, ...)
{
  return [a1 downloadContext];
}

id objc_msgSend_downloadEvent(void *a1, const char *a2, ...)
{
  return [a1 downloadEvent];
}

id objc_msgSend_downloadQueue(void *a1, const char *a2, ...)
{
  return [a1 downloadQueue];
}

id objc_msgSend_downloadValue(void *a1, const char *a2, ...)
{
  return [a1 downloadValue];
}

id objc_msgSend_downloader(void *a1, const char *a2, ...)
{
  return [a1 downloader];
}

id objc_msgSend_drawArguments(void *a1, const char *a2, ...)
{
  return [a1 drawArguments];
}

id objc_msgSend_drawIndexedArguments(void *a1, const char *a2, ...)
{
  return [a1 drawIndexedArguments];
}

id objc_msgSend_drawIndexedPatchesArguments(void *a1, const char *a2, ...)
{
  return [a1 drawIndexedPatchesArguments];
}

id objc_msgSend_drawMeshThreadgroupsArguments(void *a1, const char *a2, ...)
{
  return [a1 drawMeshThreadgroupsArguments];
}

id objc_msgSend_drawMeshThreadsArguments(void *a1, const char *a2, ...)
{
  return [a1 drawMeshThreadsArguments];
}

id objc_msgSend_drawPatchesArguments(void *a1, const char *a2, ...)
{
  return [a1 drawPatchesArguments];
}

id objc_msgSend_drawableSize(void *a1, const char *a2, ...)
{
  return [a1 drawableSize];
}

id objc_msgSend_driverCompilerOptions(void *a1, const char *a2, ...)
{
  return [a1 driverCompilerOptions];
}

id objc_msgSend_dummyArgumentEncoder(void *a1, const char *a2, ...)
{
  return [a1 dummyArgumentEncoder];
}

id objc_msgSend_elementType(void *a1, const char *a2, ...)
{
  return [a1 elementType];
}

id objc_msgSend_elementTypeDescription(void *a1, const char *a2, ...)
{
  return [a1 elementTypeDescription];
}

id objc_msgSend_enable(void *a1, const char *a2, ...)
{
  return [a1 enable];
}

id objc_msgSend_enableBarrier(void *a1, const char *a2, ...)
{
  return [a1 enableBarrier];
}

id objc_msgSend_enableLogErrors(void *a1, const char *a2, ...)
{
  return [a1 enableLogErrors];
}

id objc_msgSend_enablePresentDownload(void *a1, const char *a2, ...)
{
  return [a1 enablePresentDownload];
}

id objc_msgSend_encodeEndIf(void *a1, const char *a2, ...)
{
  return [a1 encodeEndIf];
}

id objc_msgSend_encodeEndWhile(void *a1, const char *a2, ...)
{
  return [a1 encodeEndWhile];
}

id objc_msgSend_encodeStartDoWhile(void *a1, const char *a2, ...)
{
  return [a1 encodeStartDoWhile];
}

id objc_msgSend_encodeStartElse(void *a1, const char *a2, ...)
{
  return [a1 encodeStartElse];
}

id objc_msgSend_encodedAttributes(void *a1, const char *a2, ...)
{
  return [a1 encodedAttributes];
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return [a1 encodedData];
}

id objc_msgSend_encodedLength(void *a1, const char *a2, ...)
{
  return [a1 encodedLength];
}

id objc_msgSend_endCaps(void *a1, const char *a2, ...)
{
  return [a1 endCaps];
}

id objc_msgSend_endCollectingPipelineDescriptors(void *a1, const char *a2, ...)
{
  return [a1 endCollectingPipelineDescriptors];
}

id objc_msgSend_endEncoding(void *a1, const char *a2, ...)
{
  return [a1 endEncoding];
}

id objc_msgSend_endOfEncoderSampleIndex(void *a1, const char *a2, ...)
{
  return [a1 endOfEncoderSampleIndex];
}

id objc_msgSend_endOfFragmentSampleIndex(void *a1, const char *a2, ...)
{
  return [a1 endOfFragmentSampleIndex];
}

id objc_msgSend_endOfVertexSampleIndex(void *a1, const char *a2, ...)
{
  return [a1 endOfVertexSampleIndex];
}

id objc_msgSend_endResidency(void *a1, const char *a2, ...)
{
  return [a1 endResidency];
}

id objc_msgSend_endVirtualSubstream(void *a1, const char *a2, ...)
{
  return [a1 endVirtualSubstream];
}

id objc_msgSend_enqueue(void *a1, const char *a2, ...)
{
  return [a1 enqueue];
}

id objc_msgSend_enqueueBarrier(void *a1, const char *a2, ...)
{
  return [a1 enqueueBarrier];
}

id objc_msgSend_enqueuedCommandBuffers(void *a1, const char *a2, ...)
{
  return [a1 enqueuedCommandBuffers];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_errorOptions(void *a1, const char *a2, ...)
{
  return [a1 errorOptions];
}

id objc_msgSend_eventPort(void *a1, const char *a2, ...)
{
  return [a1 eventPort];
}

id objc_msgSend_evictsImmediately(void *a1, const char *a2, ...)
{
  return [a1 evictsImmediately];
}

id objc_msgSend_executablePath(void *a1, const char *a2, ...)
{
  return [a1 executablePath];
}

id objc_msgSend_executionEnabled(void *a1, const char *a2, ...)
{
  return [a1 executionEnabled];
}

id objc_msgSend_executionMode(void *a1, const char *a2, ...)
{
  return [a1 executionMode];
}

id objc_msgSend_expiredGeneration(void *a1, const char *a2, ...)
{
  return [a1 expiredGeneration];
}

id objc_msgSend_explicitVisibilityGroupID(void *a1, const char *a2, ...)
{
  return [a1 explicitVisibilityGroupID];
}

id objc_msgSend_exportedFunctions(void *a1, const char *a2, ...)
{
  return [a1 exportedFunctions];
}

id objc_msgSend_externFunctionNames(void *a1, const char *a2, ...)
{
  return [a1 externFunctionNames];
}

id objc_msgSend_extraRetainedObjects(void *a1, const char *a2, ...)
{
  return [a1 extraRetainedObjects];
}

id objc_msgSend_familyName(void *a1, const char *a2, ...)
{
  return [a1 familyName];
}

id objc_msgSend_fastMathEnabled(void *a1, const char *a2, ...)
{
  return [a1 fastMathEnabled];
}

id objc_msgSend_featureProfile(void *a1, const char *a2, ...)
{
  return [a1 featureProfile];
}

id objc_msgSend_fenum(void *a1, const char *a2, ...)
{
  return [a1 fenum];
}

id objc_msgSend_filePath(void *a1, const char *a2, ...)
{
  return [a1 filePath];
}

id objc_msgSend_filePathURL(void *a1, const char *a2, ...)
{
  return [a1 filePathURL];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_finish(void *a1, const char *a2, ...)
{
  return [a1 finish];
}

id objc_msgSend_finishDecoding(void *a1, const char *a2, ...)
{
  return [a1 finishDecoding];
}

id objc_msgSend_firstMipmapInTail(void *a1, const char *a2, ...)
{
  return [a1 firstMipmapInTail];
}

id objc_msgSend_flush(void *a1, const char *a2, ...)
{
  return [a1 flush];
}

id objc_msgSend_forceResourceIndex(void *a1, const char *a2, ...)
{
  return [a1 forceResourceIndex];
}

id objc_msgSend_forceSeamsOnCubemapFiltering(void *a1, const char *a2, ...)
{
  return [a1 forceSeamsOnCubemapFiltering];
}

id objc_msgSend_forceSoftwareVertexFetch(void *a1, const char *a2, ...)
{
  return [a1 forceSoftwareVertexFetch];
}

id objc_msgSend_format(void *a1, const char *a2, ...)
{
  return [a1 format];
}

id objc_msgSend_fps(void *a1, const char *a2, ...)
{
  return [a1 fps];
}

id objc_msgSend_fragmentAdditionalBinaryFunctions(void *a1, const char *a2, ...)
{
  return [a1 fragmentAdditionalBinaryFunctions];
}

id objc_msgSend_fragmentBindings(void *a1, const char *a2, ...)
{
  return [a1 fragmentBindings];
}

id objc_msgSend_fragmentBuffers(void *a1, const char *a2, ...)
{
  return [a1 fragmentBuffers];
}

id objc_msgSend_fragmentDepthCompareClampMask(void *a1, const char *a2, ...)
{
  return [a1 fragmentDepthCompareClampMask];
}

id objc_msgSend_fragmentFunction(void *a1, const char *a2, ...)
{
  return [a1 fragmentFunction];
}

id objc_msgSend_fragmentLinkedFunctions(void *a1, const char *a2, ...)
{
  return [a1 fragmentLinkedFunctions];
}

id objc_msgSend_fragmentPluginReturnData(void *a1, const char *a2, ...)
{
  return [a1 fragmentPluginReturnData];
}

id objc_msgSend_fragmentPreloadedLibraries(void *a1, const char *a2, ...)
{
  return [a1 fragmentPreloadedLibraries];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_framebufferOnly(void *a1, const char *a2, ...)
{
  return [a1 framebufferOnly];
}

id objc_msgSend_frontFaceStencil(void *a1, const char *a2, ...)
{
  return [a1 frontFaceStencil];
}

id objc_msgSend_functionArray(void *a1, const char *a2, ...)
{
  return [a1 functionArray];
}

id objc_msgSend_functionCache(void *a1, const char *a2, ...)
{
  return [a1 functionCache];
}

id objc_msgSend_functionConstantsDictionary(void *a1, const char *a2, ...)
{
  return [a1 functionConstantsDictionary];
}

id objc_msgSend_functionCount(void *a1, const char *a2, ...)
{
  return [a1 functionCount];
}

id objc_msgSend_functionGraphs(void *a1, const char *a2, ...)
{
  return [a1 functionGraphs];
}

id objc_msgSend_functionHandle(void *a1, const char *a2, ...)
{
  return [a1 functionHandle];
}

id objc_msgSend_functionHandleMap(void *a1, const char *a2, ...)
{
  return [a1 functionHandleMap];
}

id objc_msgSend_functionName(void *a1, const char *a2, ...)
{
  return [a1 functionName];
}

id objc_msgSend_functionNames(void *a1, const char *a2, ...)
{
  return [a1 functionNames];
}

id objc_msgSend_functionPointers(void *a1, const char *a2, ...)
{
  return [a1 functionPointers];
}

id objc_msgSend_functionType(void *a1, const char *a2, ...)
{
  return [a1 functionType];
}

id objc_msgSend_functions(void *a1, const char *a2, ...)
{
  return [a1 functions];
}

id objc_msgSend_future(void *a1, const char *a2, ...)
{
  return [a1 future];
}

id objc_msgSend_geometryBuffer(void *a1, const char *a2, ...)
{
  return [a1 geometryBuffer];
}

id objc_msgSend_geometryDescriptors(void *a1, const char *a2, ...)
{
  return [a1 geometryDescriptors];
}

id objc_msgSend_getBVHBuilderLock(void *a1, const char *a2, ...)
{
  return [a1 getBVHBuilderLock];
}

id objc_msgSend_getBackgroundGPUPriority(void *a1, const char *a2, ...)
{
  return [a1 getBackgroundGPUPriority];
}

id objc_msgSend_getCommandType(void *a1, const char *a2, ...)
{
  return [a1 getCommandType];
}

id objc_msgSend_getComputeKernelTelemetryID(void *a1, const char *a2, ...)
{
  return [a1 getComputeKernelTelemetryID];
}

id objc_msgSend_getFragmentShaderTelemetryID(void *a1, const char *a2, ...)
{
  return [a1 getFragmentShaderTelemetryID];
}

id objc_msgSend_getGPUPriority(void *a1, const char *a2, ...)
{
  return [a1 getGPUPriority];
}

id objc_msgSend_getListIndex(void *a1, const char *a2, ...)
{
  return [a1 getListIndex];
}

id objc_msgSend_getOptimizedStatus(void *a1, const char *a2, ...)
{
  return [a1 getOptimizedStatus];
}

id objc_msgSend_getPipelineStateUniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 getPipelineStateUniqueIdentifier];
}

id objc_msgSend_getRawBVHBuilderPtr(void *a1, const char *a2, ...)
{
  return [a1 getRawBVHBuilderPtr];
}

id objc_msgSend_getRequestedCounters(void *a1, const char *a2, ...)
{
  return [a1 getRequestedCounters];
}

id objc_msgSend_getShaderCacheKeys(void *a1, const char *a2, ...)
{
  return [a1 getShaderCacheKeys];
}

id objc_msgSend_getStageInRegion(void *a1, const char *a2, ...)
{
  return [a1 getStageInRegion];
}

id objc_msgSend_getStatLocations(void *a1, const char *a2, ...)
{
  return [a1 getStatLocations];
}

id objc_msgSend_getStatOptions(void *a1, const char *a2, ...)
{
  return [a1 getStatOptions];
}

id objc_msgSend_getTessellationFactorArguments(void *a1, const char *a2, ...)
{
  return [a1 getTessellationFactorArguments];
}

id objc_msgSend_getVertexShaderTelemetryID(void *a1, const char *a2, ...)
{
  return [a1 getVertexShaderTelemetryID];
}

id objc_msgSend_globalBuffer(void *a1, const char *a2, ...)
{
  return [a1 globalBuffer];
}

id objc_msgSend_globalBufferOffset(void *a1, const char *a2, ...)
{
  return [a1 globalBufferOffset];
}

id objc_msgSend_globalTraceObjectID(void *a1, const char *a2, ...)
{
  return [a1 globalTraceObjectID];
}

id objc_msgSend_globallyUniqueString(void *a1, const char *a2, ...)
{
  return [a1 globallyUniqueString];
}

id objc_msgSend_gpuAddress(void *a1, const char *a2, ...)
{
  return [a1 gpuAddress];
}

id objc_msgSend_gpuHandle(void *a1, const char *a2, ...)
{
  return [a1 gpuHandle];
}

id objc_msgSend_gpuResourceID(void *a1, const char *a2, ...)
{
  return [a1 gpuResourceID];
}

id objc_msgSend_gpuTime(void *a1, const char *a2, ...)
{
  return [a1 gpuTime];
}

id objc_msgSend_groups(void *a1, const char *a2, ...)
{
  return [a1 groups];
}

id objc_msgSend_halfFPConfig(void *a1, const char *a2, ...)
{
  return [a1 halfFPConfig];
}

id objc_msgSend_harvester(void *a1, const char *a2, ...)
{
  return [a1 harvester];
}

id objc_msgSend_hasBarrier(void *a1, const char *a2, ...)
{
  return [a1 hasBarrier];
}

id objc_msgSend_hasBeenSent(void *a1, const char *a2, ...)
{
  return [a1 hasBeenSent];
}

id objc_msgSend_hasObservers(void *a1, const char *a2, ...)
{
  return [a1 hasObservers];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_hazardTrackingMode(void *a1, const char *a2, ...)
{
  return [a1 hazardTrackingMode];
}

id objc_msgSend_headerBuffer(void *a1, const char *a2, ...)
{
  return [a1 headerBuffer];
}

id objc_msgSend_heap(void *a1, const char *a2, ...)
{
  return [a1 heap];
}

id objc_msgSend_heapOffset(void *a1, const char *a2, ...)
{
  return [a1 heapOffset];
}

id objc_msgSend_height(void *a1, const char *a2, ...)
{
  return [a1 height];
}

id objc_msgSend_horizontalSampleStorage(void *a1, const char *a2, ...)
{
  return [a1 horizontalSampleStorage];
}

id objc_msgSend_ignoreUnusedResources(void *a1, const char *a2, ...)
{
  return [a1 ignoreUnusedResources];
}

id objc_msgSend_imageBlockDataReturn(void *a1, const char *a2, ...)
{
  return [a1 imageBlockDataReturn];
}

id objc_msgSend_imageBlockDataSize(void *a1, const char *a2, ...)
{
  return [a1 imageBlockDataSize];
}

id objc_msgSend_imageBlockKind(void *a1, const char *a2, ...)
{
  return [a1 imageBlockKind];
}

id objc_msgSend_imageBlockMasterStructMembers(void *a1, const char *a2, ...)
{
  return [a1 imageBlockMasterStructMembers];
}

id objc_msgSend_imageblockSampleLength(void *a1, const char *a2, ...)
{
  return [a1 imageblockSampleLength];
}

id objc_msgSend_importedLibraries(void *a1, const char *a2, ...)
{
  return [a1 importedLibraries];
}

id objc_msgSend_importedSymbols(void *a1, const char *a2, ...)
{
  return [a1 importedSymbols];
}

id objc_msgSend_includeBacktrace(void *a1, const char *a2, ...)
{
  return [a1 includeBacktrace];
}

id objc_msgSend_index(void *a1, const char *a2, ...)
{
  return [a1 index];
}

id objc_msgSend_indexBuffer(void *a1, const char *a2, ...)
{
  return [a1 indexBuffer];
}

id objc_msgSend_indexBufferGPUVirtualAddress(void *a1, const char *a2, ...)
{
  return [a1 indexBufferGPUVirtualAddress];
}

id objc_msgSend_indexBufferIndex(void *a1, const char *a2, ...)
{
  return [a1 indexBufferIndex];
}

id objc_msgSend_indexBufferOffset(void *a1, const char *a2, ...)
{
  return [a1 indexBufferOffset];
}

id objc_msgSend_indexCount(void *a1, const char *a2, ...)
{
  return [a1 indexCount];
}

id objc_msgSend_indexType(void *a1, const char *a2, ...)
{
  return [a1 indexType];
}

id objc_msgSend_indirectArgumentBufferCapabilities(void *a1, const char *a2, ...)
{
  return [a1 indirectArgumentBufferCapabilities];
}

id objc_msgSend_indirectArgumentBufferDecodingData(void *a1, const char *a2, ...)
{
  return [a1 indirectArgumentBufferDecodingData];
}

id objc_msgSend_indirectArgumentIndex(void *a1, const char *a2, ...)
{
  return [a1 indirectArgumentIndex];
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return [a1 infoDictionary];
}

id objc_msgSend_inheritBuffers(void *a1, const char *a2, ...)
{
  return [a1 inheritBuffers];
}

id objc_msgSend_inheritPipelineState(void *a1, const char *a2, ...)
{
  return [a1 inheritPipelineState];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_initialCapacity(void *a1, const char *a2, ...)
{
  return [a1 initialCapacity];
}

id objc_msgSend_innerNodeBuffer(void *a1, const char *a2, ...)
{
  return [a1 innerNodeBuffer];
}

id objc_msgSend_inputContentHeight(void *a1, const char *a2, ...)
{
  return [a1 inputContentHeight];
}

id objc_msgSend_inputContentMaxScale(void *a1, const char *a2, ...)
{
  return [a1 inputContentMaxScale];
}

id objc_msgSend_inputContentMinScale(void *a1, const char *a2, ...)
{
  return [a1 inputContentMinScale];
}

id objc_msgSend_inputContentWidth(void *a1, const char *a2, ...)
{
  return [a1 inputContentWidth];
}

id objc_msgSend_inputHeight(void *a1, const char *a2, ...)
{
  return [a1 inputHeight];
}

id objc_msgSend_inputPrimitiveTopology(void *a1, const char *a2, ...)
{
  return [a1 inputPrimitiveTopology];
}

id objc_msgSend_inputWidth(void *a1, const char *a2, ...)
{
  return [a1 inputWidth];
}

id objc_msgSend_insertCompressedTextureReinterpretationFlush(void *a1, const char *a2, ...)
{
  return [a1 insertCompressedTextureReinterpretationFlush];
}

id objc_msgSend_insertDebugCaptureBoundary(void *a1, const char *a2, ...)
{
  return [a1 insertDebugCaptureBoundary];
}

id objc_msgSend_installName(void *a1, const char *a2, ...)
{
  return [a1 installName];
}

id objc_msgSend_instanceCount(void *a1, const char *a2, ...)
{
  return [a1 instanceCount];
}

id objc_msgSend_instanceCountBuffer(void *a1, const char *a2, ...)
{
  return [a1 instanceCountBuffer];
}

id objc_msgSend_instanceCountBufferOffset(void *a1, const char *a2, ...)
{
  return [a1 instanceCountBufferOffset];
}

id objc_msgSend_instanceDescriptorBuffer(void *a1, const char *a2, ...)
{
  return [a1 instanceDescriptorBuffer];
}

id objc_msgSend_instanceDescriptorBufferOffset(void *a1, const char *a2, ...)
{
  return [a1 instanceDescriptorBufferOffset];
}

id objc_msgSend_instanceDescriptorStride(void *a1, const char *a2, ...)
{
  return [a1 instanceDescriptorStride];
}

id objc_msgSend_instanceDescriptorType(void *a1, const char *a2, ...)
{
  return [a1 instanceDescriptorType];
}

id objc_msgSend_instanceStride(void *a1, const char *a2, ...)
{
  return [a1 instanceStride];
}

id objc_msgSend_instanceTransformBuffer(void *a1, const char *a2, ...)
{
  return [a1 instanceTransformBuffer];
}

id objc_msgSend_instanceTransformationMatrixLayout(void *a1, const char *a2, ...)
{
  return [a1 instanceTransformationMatrixLayout];
}

id objc_msgSend_instancedAccelerationStructures(void *a1, const char *a2, ...)
{
  return [a1 instancedAccelerationStructures];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_intersectionFunctionTableOffset(void *a1, const char *a2, ...)
{
  return [a1 intersectionFunctionTableOffset];
}

id objc_msgSend_invalid(void *a1, const char *a2, ...)
{
  return [a1 invalid];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invalidateHarvester(void *a1, const char *a2, ...)
{
  return [a1 invalidateHarvester];
}

id objc_msgSend_ioSurface(void *a1, const char *a2, ...)
{
  return [a1 ioSurface];
}

id objc_msgSend_iosurface(void *a1, const char *a2, ...)
{
  return [a1 iosurface];
}

id objc_msgSend_iosurfacePlane(void *a1, const char *a2, ...)
{
  return [a1 iosurfacePlane];
}

id objc_msgSend_iosurfaceReadOnlyTextureAlignmentBytes(void *a1, const char *a2, ...)
{
  return [a1 iosurfaceReadOnlyTextureAlignmentBytes];
}

id objc_msgSend_iosurfaceTextureAlignmentBytes(void *a1, const char *a2, ...)
{
  return [a1 iosurfaceTextureAlignmentBytes];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_isAliasable(void *a1, const char *a2, ...)
{
  return [a1 isAliasable];
}

id objc_msgSend_isAlphaTestEnabled(void *a1, const char *a2, ...)
{
  return [a1 isAlphaTestEnabled];
}

id objc_msgSend_isAlphaToCoverageEnabled(void *a1, const char *a2, ...)
{
  return [a1 isAlphaToCoverageEnabled];
}

id objc_msgSend_isAlphaToOneEnabled(void *a1, const char *a2, ...)
{
  return [a1 isAlphaToOneEnabled];
}

id objc_msgSend_isArgument(void *a1, const char *a2, ...)
{
  return [a1 isArgument];
}

id objc_msgSend_isAutoExposureEnabled(void *a1, const char *a2, ...)
{
  return [a1 isAutoExposureEnabled];
}

id objc_msgSend_isBCTextureCompressionSupported(void *a1, const char *a2, ...)
{
  return [a1 isBCTextureCompressionSupported];
}

id objc_msgSend_isBlendingEnabled(void *a1, const char *a2, ...)
{
  return [a1 isBlendingEnabled];
}

id objc_msgSend_isCapturing(void *a1, const char *a2, ...)
{
  return [a1 isCapturing];
}

id objc_msgSend_isClampToHalfBorderSupported(void *a1, const char *a2, ...)
{
  return [a1 isClampToHalfBorderSupported];
}

id objc_msgSend_isCommited(void *a1, const char *a2, ...)
{
  return [a1 isCommited];
}

id objc_msgSend_isComplete(void *a1, const char *a2, ...)
{
  return [a1 isComplete];
}

id objc_msgSend_isCompressed(void *a1, const char *a2, ...)
{
  return [a1 isCompressed];
}

id objc_msgSend_isCustomBorderColorSupported(void *a1, const char *a2, ...)
{
  return [a1 isCustomBorderColorSupported];
}

id objc_msgSend_isDepthReversed(void *a1, const char *a2, ...)
{
  return [a1 isDepthReversed];
}

id objc_msgSend_isDepthStencilWriteDisabled(void *a1, const char *a2, ...)
{
  return [a1 isDepthStencilWriteDisabled];
}

id objc_msgSend_isDepthTexture(void *a1, const char *a2, ...)
{
  return [a1 isDepthTexture];
}

id objc_msgSend_isDepthWriteEnabled(void *a1, const char *a2, ...)
{
  return [a1 isDepthWriteEnabled];
}

id objc_msgSend_isDrawable(void *a1, const char *a2, ...)
{
  return [a1 isDrawable];
}

id objc_msgSend_isEarlyReturn(void *a1, const char *a2, ...)
{
  return [a1 isEarlyReturn];
}

id objc_msgSend_isEnqueued(void *a1, const char *a2, ...)
{
  return [a1 isEnqueued];
}

id objc_msgSend_isFinished(void *a1, const char *a2, ...)
{
  return [a1 isFinished];
}

id objc_msgSend_isFixedLinePointFillDepthGradientSupported(void *a1, const char *a2, ...)
{
  return [a1 isFixedLinePointFillDepthGradientSupported];
}

id objc_msgSend_isFloat32FilteringSupported(void *a1, const char *a2, ...)
{
  return [a1 isFloat32FilteringSupported];
}

id objc_msgSend_isFramebufferOnly(void *a1, const char *a2, ...)
{
  return [a1 isFramebufferOnly];
}

id objc_msgSend_isInputContentPropertiesEnabled(void *a1, const char *a2, ...)
{
  return [a1 isInputContentPropertiesEnabled];
}

id objc_msgSend_isInternalQueue(void *a1, const char *a2, ...)
{
  return [a1 isInternalQueue];
}

id objc_msgSend_isLargeMRTSupported(void *a1, const char *a2, ...)
{
  return [a1 isLargeMRTSupported];
}

id objc_msgSend_isLogicOperationEnabled(void *a1, const char *a2, ...)
{
  return [a1 isLogicOperationEnabled];
}

id objc_msgSend_isMacCatalystApp(void *a1, const char *a2, ...)
{
  return [a1 isMacCatalystApp];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return [a1 isMainThread];
}

id objc_msgSend_isMemorylessRender(void *a1, const char *a2, ...)
{
  return [a1 isMemorylessRender];
}

id objc_msgSend_isMsaa32bSupported(void *a1, const char *a2, ...)
{
  return [a1 isMsaa32bSupported];
}

id objc_msgSend_isOpenGLQueue(void *a1, const char *a2, ...)
{
  return [a1 isOpenGLQueue];
}

id objc_msgSend_isPatchControlPointData(void *a1, const char *a2, ...)
{
  return [a1 isPatchControlPointData];
}

id objc_msgSend_isPatchData(void *a1, const char *a2, ...)
{
  return [a1 isPatchData];
}

id objc_msgSend_isPlacementHeapSupported(void *a1, const char *a2, ...)
{
  return [a1 isPlacementHeapSupported];
}

id objc_msgSend_isPointCoordLowerLeft(void *a1, const char *a2, ...)
{
  return [a1 isPointCoordLowerLeft];
}

id objc_msgSend_isPointSizeOutputVS(void *a1, const char *a2, ...)
{
  return [a1 isPointSizeOutputVS];
}

id objc_msgSend_isPointSmoothEnabled(void *a1, const char *a2, ...)
{
  return [a1 isPointSmoothEnabled];
}

id objc_msgSend_isProfilingEnabled(void *a1, const char *a2, ...)
{
  return [a1 isProfilingEnabled];
}

id objc_msgSend_isPurgeable(void *a1, const char *a2, ...)
{
  return [a1 isPurgeable];
}

id objc_msgSend_isQuadDataSharingSupported(void *a1, const char *a2, ...)
{
  return [a1 isQuadDataSharingSupported];
}

id objc_msgSend_isRGB10A2GammaSupported(void *a1, const char *a2, ...)
{
  return [a1 isRGB10A2GammaSupported];
}

id objc_msgSend_isRTZRoundingSupported(void *a1, const char *a2, ...)
{
  return [a1 isRTZRoundingSupported];
}

id objc_msgSend_isRasterizationEnabled(void *a1, const char *a2, ...)
{
  return [a1 isRasterizationEnabled];
}

id objc_msgSend_isReactiveMaskTextureEnabled(void *a1, const char *a2, ...)
{
  return [a1 isReactiveMaskTextureEnabled];
}

id objc_msgSend_isShareable(void *a1, const char *a2, ...)
{
  return [a1 isShareable];
}

id objc_msgSend_isSparse(void *a1, const char *a2, ...)
{
  return [a1 isSparse];
}

id objc_msgSend_isStatEnabled(void *a1, const char *a2, ...)
{
  return [a1 isStatEnabled];
}

id objc_msgSend_isTessellationFactorScaleEnabled(void *a1, const char *a2, ...)
{
  return [a1 isTessellationFactorScaleEnabled];
}

id objc_msgSend_isToolsCapture(void *a1, const char *a2, ...)
{
  return [a1 isToolsCapture];
}

id objc_msgSend_isTwoSideEnabled(void *a1, const char *a2, ...)
{
  return [a1 isTwoSideEnabled];
}

id objc_msgSend_isUsed(void *a1, const char *a2, ...)
{
  return [a1 isUsed];
}

id objc_msgSend_isVertexDescriptorBuffer(void *a1, const char *a2, ...)
{
  return [a1 isVertexDescriptorBuffer];
}

id objc_msgSend_isiOSAppOnMac(void *a1, const char *a2, ...)
{
  return [a1 isiOSAppOnMac];
}

id objc_msgSend_jitterOffsetX(void *a1, const char *a2, ...)
{
  return [a1 jitterOffsetX];
}

id objc_msgSend_jitterOffsetY(void *a1, const char *a2, ...)
{
  return [a1 jitterOffsetY];
}

id objc_msgSend_kernelEndTime(void *a1, const char *a2, ...)
{
  return [a1 kernelEndTime];
}

id objc_msgSend_kernelStartTime(void *a1, const char *a2, ...)
{
  return [a1 kernelStartTime];
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return [a1 keyEnumerator];
}

id objc_msgSend_keys(void *a1, const char *a2, ...)
{
  return [a1 keys];
}

id objc_msgSend_kind(void *a1, const char *a2, ...)
{
  return [a1 kind];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_languageVersion(void *a1, const char *a2, ...)
{
  return [a1 languageVersion];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_latestSupportedGenericBVHVersion(void *a1, const char *a2, ...)
{
  return [a1 latestSupportedGenericBVHVersion];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layerCount(void *a1, const char *a2, ...)
{
  return [a1 layerCount];
}

id objc_msgSend_layers(void *a1, const char *a2, ...)
{
  return [a1 layers];
}

id objc_msgSend_layouts(void *a1, const char *a2, ...)
{
  return [a1 layouts];
}

id objc_msgSend_leafNodeBuffer(void *a1, const char *a2, ...)
{
  return [a1 leafNodeBuffer];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_level(void *a1, const char *a2, ...)
{
  return [a1 level];
}

id objc_msgSend_libraries(void *a1, const char *a2, ...)
{
  return [a1 libraries];
}

id objc_msgSend_libraryCacheStats(void *a1, const char *a2, ...)
{
  return [a1 libraryCacheStats];
}

id objc_msgSend_libraryIdentifier(void *a1, const char *a2, ...)
{
  return [a1 libraryIdentifier];
}

id objc_msgSend_libraryPath(void *a1, const char *a2, ...)
{
  return [a1 libraryPath];
}

id objc_msgSend_libraryType(void *a1, const char *a2, ...)
{
  return [a1 libraryType];
}

id objc_msgSend_limits(void *a1, const char *a2, ...)
{
  return [a1 limits];
}

id objc_msgSend_lineNumber(void *a1, const char *a2, ...)
{
  return [a1 lineNumber];
}

id objc_msgSend_linearTextureAlignmentBytes(void *a1, const char *a2, ...)
{
  return [a1 linearTextureAlignmentBytes];
}

id objc_msgSend_linearTextureArrayAlignmentBytes(void *a1, const char *a2, ...)
{
  return [a1 linearTextureArrayAlignmentBytes];
}

id objc_msgSend_linearTextureArrayAlignmentSlice(void *a1, const char *a2, ...)
{
  return [a1 linearTextureArrayAlignmentSlice];
}

id objc_msgSend_linkedFunctions(void *a1, const char *a2, ...)
{
  return [a1 linkedFunctions];
}

id objc_msgSend_loadAction(void *a1, const char *a2, ...)
{
  return [a1 loadAction];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_localizedFailureReason(void *a1, const char *a2, ...)
{
  return [a1 localizedFailureReason];
}

id objc_msgSend_localizedRecoverySuggestion(void *a1, const char *a2, ...)
{
  return [a1 localizedRecoverySuggestion];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_lodAverage(void *a1, const char *a2, ...)
{
  return [a1 lodAverage];
}

id objc_msgSend_lodMaxClamp(void *a1, const char *a2, ...)
{
  return [a1 lodMaxClamp];
}

id objc_msgSend_lodMinClamp(void *a1, const char *a2, ...)
{
  return [a1 lodMinClamp];
}

id objc_msgSend_logPerformance(void *a1, const char *a2, ...)
{
  return [a1 logPerformance];
}

id objc_msgSend_logState(void *a1, const char *a2, ...)
{
  return [a1 logState];
}

id objc_msgSend_logicOperation(void *a1, const char *a2, ...)
{
  return [a1 logicOperation];
}

id objc_msgSend_logs(void *a1, const char *a2, ...)
{
  return [a1 logs];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_magFilter(void *a1, const char *a2, ...)
{
  return [a1 magFilter];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainDisplay(void *a1, const char *a2, ...)
{
  return [a1 mainDisplay];
}

id objc_msgSend_makeAliasable(void *a1, const char *a2, ...)
{
  return [a1 makeAliasable];
}

id objc_msgSend_mathFloatingPointFunctions(void *a1, const char *a2, ...)
{
  return [a1 mathFloatingPointFunctions];
}

id objc_msgSend_mathMode(void *a1, const char *a2, ...)
{
  return [a1 mathMode];
}

id objc_msgSend_maxAccelerationStructureLevels(void *a1, const char *a2, ...)
{
  return [a1 maxAccelerationStructureLevels];
}

id objc_msgSend_maxAccelerationStructureTraversalDepth(void *a1, const char *a2, ...)
{
  return [a1 maxAccelerationStructureTraversalDepth];
}

id objc_msgSend_maxAnisotropy(void *a1, const char *a2, ...)
{
  return [a1 maxAnisotropy];
}

id objc_msgSend_maxArgumentBufferSamplerCount(void *a1, const char *a2, ...)
{
  return [a1 maxArgumentBufferSamplerCount];
}

id objc_msgSend_maxBufferLength(void *a1, const char *a2, ...)
{
  return [a1 maxBufferLength];
}

id objc_msgSend_maxCallStackDepth(void *a1, const char *a2, ...)
{
  return [a1 maxCallStackDepth];
}

id objc_msgSend_maxColorAttachments(void *a1, const char *a2, ...)
{
  return [a1 maxColorAttachments];
}

id objc_msgSend_maxCommandBufferCount(void *a1, const char *a2, ...)
{
  return [a1 maxCommandBufferCount];
}

id objc_msgSend_maxComputeAttributes(void *a1, const char *a2, ...)
{
  return [a1 maxComputeAttributes];
}

id objc_msgSend_maxComputeBuffers(void *a1, const char *a2, ...)
{
  return [a1 maxComputeBuffers];
}

id objc_msgSend_maxComputeInlineDataSize(void *a1, const char *a2, ...)
{
  return [a1 maxComputeInlineDataSize];
}

id objc_msgSend_maxComputeLocalMemorySizes(void *a1, const char *a2, ...)
{
  return [a1 maxComputeLocalMemorySizes];
}

id objc_msgSend_maxComputeSamplers(void *a1, const char *a2, ...)
{
  return [a1 maxComputeSamplers];
}

id objc_msgSend_maxComputeTextures(void *a1, const char *a2, ...)
{
  return [a1 maxComputeTextures];
}

id objc_msgSend_maxComputeThreadgroupMemory(void *a1, const char *a2, ...)
{
  return [a1 maxComputeThreadgroupMemory];
}

id objc_msgSend_maxComputeThreadgroupMemoryAlignmentBytes(void *a1, const char *a2, ...)
{
  return [a1 maxComputeThreadgroupMemoryAlignmentBytes];
}

id objc_msgSend_maxCustomSamplePositions(void *a1, const char *a2, ...)
{
  return [a1 maxCustomSamplePositions];
}

id objc_msgSend_maxDownloadCommandBuffers(void *a1, const char *a2, ...)
{
  return [a1 maxDownloadCommandBuffers];
}

id objc_msgSend_maxFenceInstances(void *a1, const char *a2, ...)
{
  return [a1 maxFenceInstances];
}

id objc_msgSend_maxFragmentBufferBindCount(void *a1, const char *a2, ...)
{
  return [a1 maxFragmentBufferBindCount];
}

id objc_msgSend_maxFragmentBuffers(void *a1, const char *a2, ...)
{
  return [a1 maxFragmentBuffers];
}

id objc_msgSend_maxFragmentCallStackDepth(void *a1, const char *a2, ...)
{
  return [a1 maxFragmentCallStackDepth];
}

id objc_msgSend_maxFragmentInlineDataSize(void *a1, const char *a2, ...)
{
  return [a1 maxFragmentInlineDataSize];
}

id objc_msgSend_maxFragmentSamplers(void *a1, const char *a2, ...)
{
  return [a1 maxFragmentSamplers];
}

id objc_msgSend_maxFragmentTextures(void *a1, const char *a2, ...)
{
  return [a1 maxFragmentTextures];
}

id objc_msgSend_maxFramebufferStorageBits(void *a1, const char *a2, ...)
{
  return [a1 maxFramebufferStorageBits];
}

id objc_msgSend_maxFunctionConstantIndices(void *a1, const char *a2, ...)
{
  return [a1 maxFunctionConstantIndices];
}

id objc_msgSend_maxIOCommandsInFlight(void *a1, const char *a2, ...)
{
  return [a1 maxIOCommandsInFlight];
}

id objc_msgSend_maxIndirectBuffers(void *a1, const char *a2, ...)
{
  return [a1 maxIndirectBuffers];
}

id objc_msgSend_maxIndirectSamplers(void *a1, const char *a2, ...)
{
  return [a1 maxIndirectSamplers];
}

id objc_msgSend_maxIndirectSamplersPerDevice(void *a1, const char *a2, ...)
{
  return [a1 maxIndirectSamplersPerDevice];
}

id objc_msgSend_maxIndirectTextures(void *a1, const char *a2, ...)
{
  return [a1 maxIndirectTextures];
}

id objc_msgSend_maxInstanceCount(void *a1, const char *a2, ...)
{
  return [a1 maxInstanceCount];
}

id objc_msgSend_maxInterpolants(void *a1, const char *a2, ...)
{
  return [a1 maxInterpolants];
}

id objc_msgSend_maxInterpolatedComponents(void *a1, const char *a2, ...)
{
  return [a1 maxInterpolatedComponents];
}

id objc_msgSend_maxKernelBufferBindCount(void *a1, const char *a2, ...)
{
  return [a1 maxKernelBufferBindCount];
}

id objc_msgSend_maxKernelThreadgroupMemoryBindCount(void *a1, const char *a2, ...)
{
  return [a1 maxKernelThreadgroupMemoryBindCount];
}

id objc_msgSend_maxLineWidth(void *a1, const char *a2, ...)
{
  return [a1 maxLineWidth];
}

id objc_msgSend_maxMeshBufferBindCount(void *a1, const char *a2, ...)
{
  return [a1 maxMeshBufferBindCount];
}

id objc_msgSend_maxMeshCallStackDepth(void *a1, const char *a2, ...)
{
  return [a1 maxMeshCallStackDepth];
}

id objc_msgSend_maxMotionTransformCount(void *a1, const char *a2, ...)
{
  return [a1 maxMotionTransformCount];
}

id objc_msgSend_maxObjectBufferBindCount(void *a1, const char *a2, ...)
{
  return [a1 maxObjectBufferBindCount];
}

id objc_msgSend_maxObjectCallStackDepth(void *a1, const char *a2, ...)
{
  return [a1 maxObjectCallStackDepth];
}

id objc_msgSend_maxObjectThreadgroupMemoryBindCount(void *a1, const char *a2, ...)
{
  return [a1 maxObjectThreadgroupMemoryBindCount];
}

id objc_msgSend_maxPointSize(void *a1, const char *a2, ...)
{
  return [a1 maxPointSize];
}

id objc_msgSend_maxPredicatedNestingDepth(void *a1, const char *a2, ...)
{
  return [a1 maxPredicatedNestingDepth];
}

id objc_msgSend_maxRasterizationRateLayerCount(void *a1, const char *a2, ...)
{
  return [a1 maxRasterizationRateLayerCount];
}

id objc_msgSend_maxTessellationFactor(void *a1, const char *a2, ...)
{
  return [a1 maxTessellationFactor];
}

id objc_msgSend_maxTextureBufferWidth(void *a1, const char *a2, ...)
{
  return [a1 maxTextureBufferWidth];
}

id objc_msgSend_maxTextureDepth3D(void *a1, const char *a2, ...)
{
  return [a1 maxTextureDepth3D];
}

id objc_msgSend_maxTextureDimensionCube(void *a1, const char *a2, ...)
{
  return [a1 maxTextureDimensionCube];
}

id objc_msgSend_maxTextureHeight2D(void *a1, const char *a2, ...)
{
  return [a1 maxTextureHeight2D];
}

id objc_msgSend_maxTextureHeight3D(void *a1, const char *a2, ...)
{
  return [a1 maxTextureHeight3D];
}

id objc_msgSend_maxTextureLayers(void *a1, const char *a2, ...)
{
  return [a1 maxTextureLayers];
}

id objc_msgSend_maxTextureWidth1D(void *a1, const char *a2, ...)
{
  return [a1 maxTextureWidth1D];
}

id objc_msgSend_maxTextureWidth2D(void *a1, const char *a2, ...)
{
  return [a1 maxTextureWidth2D];
}

id objc_msgSend_maxTextureWidth3D(void *a1, const char *a2, ...)
{
  return [a1 maxTextureWidth3D];
}

id objc_msgSend_maxThreadgroupMemoryLength(void *a1, const char *a2, ...)
{
  return [a1 maxThreadgroupMemoryLength];
}

id objc_msgSend_maxThreadgroupsPerMeshGrid(void *a1, const char *a2, ...)
{
  return [a1 maxThreadgroupsPerMeshGrid];
}

id objc_msgSend_maxThreadsPerThreadgroup(void *a1, const char *a2, ...)
{
  return [a1 maxThreadsPerThreadgroup];
}

id objc_msgSend_maxTileBuffers(void *a1, const char *a2, ...)
{
  return [a1 maxTileBuffers];
}

id objc_msgSend_maxTileInlineDataSize(void *a1, const char *a2, ...)
{
  return [a1 maxTileInlineDataSize];
}

id objc_msgSend_maxTileSamplers(void *a1, const char *a2, ...)
{
  return [a1 maxTileSamplers];
}

id objc_msgSend_maxTileTextures(void *a1, const char *a2, ...)
{
  return [a1 maxTileTextures];
}

id objc_msgSend_maxTotalComputeThreadsPerThreadgroup(void *a1, const char *a2, ...)
{
  return [a1 maxTotalComputeThreadsPerThreadgroup];
}

id objc_msgSend_maxTotalThreadgroupsPerMeshGrid(void *a1, const char *a2, ...)
{
  return [a1 maxTotalThreadgroupsPerMeshGrid];
}

id objc_msgSend_maxTotalThreadsPerMeshThreadgroup(void *a1, const char *a2, ...)
{
  return [a1 maxTotalThreadsPerMeshThreadgroup];
}

id objc_msgSend_maxTotalThreadsPerObjectThreadgroup(void *a1, const char *a2, ...)
{
  return [a1 maxTotalThreadsPerObjectThreadgroup];
}

id objc_msgSend_maxTotalThreadsPerThreadgroup(void *a1, const char *a2, ...)
{
  return [a1 maxTotalThreadsPerThreadgroup];
}

id objc_msgSend_maxVertexAmplificationCount(void *a1, const char *a2, ...)
{
  return [a1 maxVertexAmplificationCount];
}

id objc_msgSend_maxVertexAmplificationFactor(void *a1, const char *a2, ...)
{
  return [a1 maxVertexAmplificationFactor];
}

id objc_msgSend_maxVertexAttributes(void *a1, const char *a2, ...)
{
  return [a1 maxVertexAttributes];
}

id objc_msgSend_maxVertexBufferBindCount(void *a1, const char *a2, ...)
{
  return [a1 maxVertexBufferBindCount];
}

id objc_msgSend_maxVertexBuffers(void *a1, const char *a2, ...)
{
  return [a1 maxVertexBuffers];
}

id objc_msgSend_maxVertexCallStackDepth(void *a1, const char *a2, ...)
{
  return [a1 maxVertexCallStackDepth];
}

id objc_msgSend_maxVertexInlineDataSize(void *a1, const char *a2, ...)
{
  return [a1 maxVertexInlineDataSize];
}

id objc_msgSend_maxVertexSamplers(void *a1, const char *a2, ...)
{
  return [a1 maxVertexSamplers];
}

id objc_msgSend_maxVertexTextures(void *a1, const char *a2, ...)
{
  return [a1 maxVertexTextures];
}

id objc_msgSend_maxViewportCount(void *a1, const char *a2, ...)
{
  return [a1 maxViewportCount];
}

id objc_msgSend_maxVisibilityQueryOffset(void *a1, const char *a2, ...)
{
  return [a1 maxVisibilityQueryOffset];
}

id objc_msgSend_maximumComputeSubstreams(void *a1, const char *a2, ...)
{
  return [a1 maximumComputeSubstreams];
}

id objc_msgSend_members(void *a1, const char *a2, ...)
{
  return [a1 members];
}

id objc_msgSend_memoryPoolId(void *a1, const char *a2, ...)
{
  return [a1 memoryPoolId];
}

id objc_msgSend_meshAdditionalBinaryFunctions(void *a1, const char *a2, ...)
{
  return [a1 meshAdditionalBinaryFunctions];
}

id objc_msgSend_meshBindings(void *a1, const char *a2, ...)
{
  return [a1 meshBindings];
}

id objc_msgSend_meshBuffers(void *a1, const char *a2, ...)
{
  return [a1 meshBuffers];
}

id objc_msgSend_meshBuiltInArguments(void *a1, const char *a2, ...)
{
  return [a1 meshBuiltInArguments];
}

id objc_msgSend_meshFunction(void *a1, const char *a2, ...)
{
  return [a1 meshFunction];
}

id objc_msgSend_meshLinkedFunctions(void *a1, const char *a2, ...)
{
  return [a1 meshLinkedFunctions];
}

id objc_msgSend_meshPreloadedLibraries(void *a1, const char *a2, ...)
{
  return [a1 meshPreloadedLibraries];
}

id objc_msgSend_meshPrimitiveCount(void *a1, const char *a2, ...)
{
  return [a1 meshPrimitiveCount];
}

id objc_msgSend_meshPrimitiveStruct(void *a1, const char *a2, ...)
{
  return [a1 meshPrimitiveStruct];
}

id objc_msgSend_meshThreadExecutionWidth(void *a1, const char *a2, ...)
{
  return [a1 meshThreadExecutionWidth];
}

id objc_msgSend_meshThreadgroupSizeIsMultipleOfThreadExecutionWidth(void *a1, const char *a2, ...)
{
  return [a1 meshThreadgroupSizeIsMultipleOfThreadExecutionWidth];
}

id objc_msgSend_meshTopologyType(void *a1, const char *a2, ...)
{
  return [a1 meshTopologyType];
}

id objc_msgSend_meshVertexCount(void *a1, const char *a2, ...)
{
  return [a1 meshVertexCount];
}

id objc_msgSend_meshVertexStruct(void *a1, const char *a2, ...)
{
  return [a1 meshVertexStruct];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return [a1 message];
}

id objc_msgSend_metalAssertionsEnabled(void *a1, const char *a2, ...)
{
  return [a1 metalAssertionsEnabled];
}

id objc_msgSend_metallibPaths(void *a1, const char *a2, ...)
{
  return [a1 metallibPaths];
}

id objc_msgSend_minBufferNoCopyAlignmentBytes(void *a1, const char *a2, ...)
{
  return [a1 minBufferNoCopyAlignmentBytes];
}

id objc_msgSend_minConstantBufferAlignmentBytes(void *a1, const char *a2, ...)
{
  return [a1 minConstantBufferAlignmentBytes];
}

id objc_msgSend_minFactor(void *a1, const char *a2, ...)
{
  return [a1 minFactor];
}

id objc_msgSend_minFilter(void *a1, const char *a2, ...)
{
  return [a1 minFilter];
}

id objc_msgSend_minTilePixels(void *a1, const char *a2, ...)
{
  return [a1 minTilePixels];
}

id objc_msgSend_mipFilter(void *a1, const char *a2, ...)
{
  return [a1 mipFilter];
}

id objc_msgSend_mipmapLevelCount(void *a1, const char *a2, ...)
{
  return [a1 mipmapLevelCount];
}

id objc_msgSend_motionEndBorderMode(void *a1, const char *a2, ...)
{
  return [a1 motionEndBorderMode];
}

id objc_msgSend_motionEndTime(void *a1, const char *a2, ...)
{
  return [a1 motionEndTime];
}

id objc_msgSend_motionKeyframeCount(void *a1, const char *a2, ...)
{
  return [a1 motionKeyframeCount];
}

id objc_msgSend_motionStartBorderMode(void *a1, const char *a2, ...)
{
  return [a1 motionStartBorderMode];
}

id objc_msgSend_motionStartTime(void *a1, const char *a2, ...)
{
  return [a1 motionStartTime];
}

id objc_msgSend_motionTextureFormat(void *a1, const char *a2, ...)
{
  return [a1 motionTextureFormat];
}

id objc_msgSend_motionTextureUsage(void *a1, const char *a2, ...)
{
  return [a1 motionTextureUsage];
}

id objc_msgSend_motionTransformBuffer(void *a1, const char *a2, ...)
{
  return [a1 motionTransformBuffer];
}

id objc_msgSend_motionTransformBufferOffset(void *a1, const char *a2, ...)
{
  return [a1 motionTransformBufferOffset];
}

id objc_msgSend_motionTransformCount(void *a1, const char *a2, ...)
{
  return [a1 motionTransformCount];
}

id objc_msgSend_motionTransformCountBuffer(void *a1, const char *a2, ...)
{
  return [a1 motionTransformCountBuffer];
}

id objc_msgSend_motionTransformCountBufferOffset(void *a1, const char *a2, ...)
{
  return [a1 motionTransformCountBufferOffset];
}

id objc_msgSend_motionTransformStride(void *a1, const char *a2, ...)
{
  return [a1 motionTransformStride];
}

id objc_msgSend_motionTransformType(void *a1, const char *a2, ...)
{
  return [a1 motionTransformType];
}

id objc_msgSend_motionVectorScaleX(void *a1, const char *a2, ...)
{
  return [a1 motionVectorScaleX];
}

id objc_msgSend_motionVectorScaleY(void *a1, const char *a2, ...)
{
  return [a1 motionVectorScaleY];
}

id objc_msgSend_mutability(void *a1, const char *a2, ...)
{
  return [a1 mutability];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_needsCustomBorderColorSamplers(void *a1, const char *a2, ...)
{
  return [a1 needsCustomBorderColorSamplers];
}

id objc_msgSend_newCommandBuffer(void *a1, const char *a2, ...)
{
  return [a1 newCommandBuffer];
}

id objc_msgSend_newCommandQueue(void *a1, const char *a2, ...)
{
  return [a1 newCommandQueue];
}

id objc_msgSend_newDefaultLibrary(void *a1, const char *a2, ...)
{
  return [a1 newDefaultLibrary];
}

id objc_msgSend_newEvent(void *a1, const char *a2, ...)
{
  return [a1 newEvent];
}

id objc_msgSend_newFence(void *a1, const char *a2, ...)
{
  return [a1 newFence];
}

id objc_msgSend_newFragmentShaderDebugInfo(void *a1, const char *a2, ...)
{
  return [a1 newFragmentShaderDebugInfo];
}

id objc_msgSend_newKernelDebugInfo(void *a1, const char *a2, ...)
{
  return [a1 newKernelDebugInfo];
}

id objc_msgSend_newLateEvalEvent(void *a1, const char *a2, ...)
{
  return [a1 newLateEvalEvent];
}

id objc_msgSend_newSharedEvent(void *a1, const char *a2, ...)
{
  return [a1 newSharedEvent];
}

id objc_msgSend_newSharedEventHandle(void *a1, const char *a2, ...)
{
  return [a1 newSharedEventHandle];
}

id objc_msgSend_newSharedTextureHandle(void *a1, const char *a2, ...)
{
  return [a1 newSharedTextureHandle];
}

id objc_msgSend_newVertexShaderDebugInfo(void *a1, const char *a2, ...)
{
  return [a1 newVertexShaderDebugInfo];
}

id objc_msgSend_nextVirtualSubstream(void *a1, const char *a2, ...)
{
  return [a1 nextVirtualSubstream];
}

id objc_msgSend_noCopy(void *a1, const char *a2, ...)
{
  return [a1 noCopy];
}

id objc_msgSend_nodes(void *a1, const char *a2, ...)
{
  return [a1 nodes];
}

id objc_msgSend_normalizedCoordinates(void *a1, const char *a2, ...)
{
  return [a1 normalizedCoordinates];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_numFaces(void *a1, const char *a2, ...)
{
  return [a1 numFaces];
}

id objc_msgSend_numberOfPatchControlPoints(void *a1, const char *a2, ...)
{
  return [a1 numberOfPatchControlPoints];
}

id objc_msgSend_objectAdditionalBinaryFunctions(void *a1, const char *a2, ...)
{
  return [a1 objectAdditionalBinaryFunctions];
}

id objc_msgSend_objectBindings(void *a1, const char *a2, ...)
{
  return [a1 objectBindings];
}

id objc_msgSend_objectBuffers(void *a1, const char *a2, ...)
{
  return [a1 objectBuffers];
}

id objc_msgSend_objectBuiltInArguments(void *a1, const char *a2, ...)
{
  return [a1 objectBuiltInArguments];
}

id objc_msgSend_objectFunction(void *a1, const char *a2, ...)
{
  return [a1 objectFunction];
}

id objc_msgSend_objectLinkedFunctions(void *a1, const char *a2, ...)
{
  return [a1 objectLinkedFunctions];
}

id objc_msgSend_objectPayload(void *a1, const char *a2, ...)
{
  return [a1 objectPayload];
}

id objc_msgSend_objectPreloadedLibraries(void *a1, const char *a2, ...)
{
  return [a1 objectPreloadedLibraries];
}

id objc_msgSend_objectThreadExecutionWidth(void *a1, const char *a2, ...)
{
  return [a1 objectThreadExecutionWidth];
}

id objc_msgSend_objectThreadgroupSizeIsMultipleOfThreadExecutionWidth(void *a1, const char *a2, ...)
{
  return [a1 objectThreadgroupSizeIsMultipleOfThreadExecutionWidth];
}

id objc_msgSend_objects(void *a1, const char *a2, ...)
{
  return [a1 objects];
}

id objc_msgSend_offset(void *a1, const char *a2, ...)
{
  return [a1 offset];
}

id objc_msgSend_opaque(void *a1, const char *a2, ...)
{
  return [a1 opaque];
}

id objc_msgSend_openCLModeEnabled(void *a1, const char *a2, ...)
{
  return [a1 openCLModeEnabled];
}

id objc_msgSend_openGLModeEnabled(void *a1, const char *a2, ...)
{
  return [a1 openGLModeEnabled];
}

id objc_msgSend_optimizationLevel(void *a1, const char *a2, ...)
{
  return [a1 optimizationLevel];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_outputHeight(void *a1, const char *a2, ...)
{
  return [a1 outputHeight];
}

id objc_msgSend_outputNode(void *a1, const char *a2, ...)
{
  return [a1 outputNode];
}

id objc_msgSend_outputTextureFormat(void *a1, const char *a2, ...)
{
  return [a1 outputTextureFormat];
}

id objc_msgSend_outputTextureUsage(void *a1, const char *a2, ...)
{
  return [a1 outputTextureUsage];
}

id objc_msgSend_outputURL(void *a1, const char *a2, ...)
{
  return [a1 outputURL];
}

id objc_msgSend_outputWidth(void *a1, const char *a2, ...)
{
  return [a1 outputWidth];
}

id objc_msgSend_overrideTriple(void *a1, const char *a2, ...)
{
  return [a1 overrideTriple];
}

id objc_msgSend_parameterBufferSizeAndAlign(void *a1, const char *a2, ...)
{
  return [a1 parameterBufferSizeAndAlign];
}

id objc_msgSend_parentGPUAddress(void *a1, const char *a2, ...)
{
  return [a1 parentGPUAddress];
}

id objc_msgSend_parentGPUSize(void *a1, const char *a2, ...)
{
  return [a1 parentGPUSize];
}

id objc_msgSend_parentRelativeLevel(void *a1, const char *a2, ...)
{
  return [a1 parentRelativeLevel];
}

id objc_msgSend_parentRelativeSlice(void *a1, const char *a2, ...)
{
  return [a1 parentRelativeSlice];
}

id objc_msgSend_patchControlPointCount(void *a1, const char *a2, ...)
{
  return [a1 patchControlPointCount];
}

id objc_msgSend_patchCount(void *a1, const char *a2, ...)
{
  return [a1 patchCount];
}

id objc_msgSend_patchIndexBufferVirtualAddress(void *a1, const char *a2, ...)
{
  return [a1 patchIndexBufferVirtualAddress];
}

id objc_msgSend_patchStart(void *a1, const char *a2, ...)
{
  return [a1 patchStart];
}

id objc_msgSend_patchType(void *a1, const char *a2, ...)
{
  return [a1 patchType];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return [a1 payload];
}

id objc_msgSend_payloadMemoryLength(void *a1, const char *a2, ...)
{
  return [a1 payloadMemoryLength];
}

id objc_msgSend_perPrimitiveDataBuffer(void *a1, const char *a2, ...)
{
  return [a1 perPrimitiveDataBuffer];
}

id objc_msgSend_performanceStatistics(void *a1, const char *a2, ...)
{
  return [a1 performanceStatistics];
}

id objc_msgSend_physicalGranularity(void *a1, const char *a2, ...)
{
  return [a1 physicalGranularity];
}

id objc_msgSend_pinnedGPUAddress(void *a1, const char *a2, ...)
{
  return [a1 pinnedGPUAddress];
}

id objc_msgSend_pipelineCache(void *a1, const char *a2, ...)
{
  return [a1 pipelineCache];
}

id objc_msgSend_pipelineCacheStats(void *a1, const char *a2, ...)
{
  return [a1 pipelineCacheStats];
}

id objc_msgSend_pipelineCollection(void *a1, const char *a2, ...)
{
  return [a1 pipelineCollection];
}

id objc_msgSend_pipelineLibrary(void *a1, const char *a2, ...)
{
  return [a1 pipelineLibrary];
}

id objc_msgSend_pipelineNames(void *a1, const char *a2, ...)
{
  return [a1 pipelineNames];
}

id objc_msgSend_pixelFormat(void *a1, const char *a2, ...)
{
  return [a1 pixelFormat];
}

id objc_msgSend_plistPayload(void *a1, const char *a2, ...)
{
  return [a1 plistPayload];
}

id objc_msgSend_pluginData(void *a1, const char *a2, ...)
{
  return [a1 pluginData];
}

id objc_msgSend_pluginReturnData(void *a1, const char *a2, ...)
{
  return [a1 pluginReturnData];
}

id objc_msgSend_pointCoordYFlipEnabled(void *a1, const char *a2, ...)
{
  return [a1 pointCoordYFlipEnabled];
}

id objc_msgSend_pointerValue(void *a1, const char *a2, ...)
{
  return [a1 pointerValue];
}

id objc_msgSend_popDebugGroup(void *a1, const char *a2, ...)
{
  return [a1 popDebugGroup];
}

id objc_msgSend_position(void *a1, const char *a2, ...)
{
  return [a1 position];
}

id objc_msgSend_preExposure(void *a1, const char *a2, ...)
{
  return [a1 preExposure];
}

id objc_msgSend_preloadedLibraries(void *a1, const char *a2, ...)
{
  return [a1 preloadedLibraries];
}

id objc_msgSend_preprocessorMacros(void *a1, const char *a2, ...)
{
  return [a1 preprocessorMacros];
}

id objc_msgSend_present(void *a1, const char *a2, ...)
{
  return [a1 present];
}

id objc_msgSend_presentedTime(void *a1, const char *a2, ...)
{
  return [a1 presentedTime];
}

id objc_msgSend_preserveInvariance(void *a1, const char *a2, ...)
{
  return [a1 preserveInvariance];
}

id objc_msgSend_previousJitterOffset(void *a1, const char *a2, ...)
{
  return [a1 previousJitterOffset];
}

id objc_msgSend_previousViewToClipMatrix(void *a1, const char *a2, ...)
{
  return [a1 previousViewToClipMatrix];
}

id objc_msgSend_previousWorldToViewMatrix(void *a1, const char *a2, ...)
{
  return [a1 previousWorldToViewMatrix];
}

id objc_msgSend_primitiveBuffer(void *a1, const char *a2, ...)
{
  return [a1 primitiveBuffer];
}

id objc_msgSend_primitiveDataBuffer(void *a1, const char *a2, ...)
{
  return [a1 primitiveDataBuffer];
}

id objc_msgSend_primitiveDataBufferOffset(void *a1, const char *a2, ...)
{
  return [a1 primitiveDataBufferOffset];
}

id objc_msgSend_primitiveDataElementSize(void *a1, const char *a2, ...)
{
  return [a1 primitiveDataElementSize];
}

id objc_msgSend_primitiveDataStride(void *a1, const char *a2, ...)
{
  return [a1 primitiveDataStride];
}

id objc_msgSend_primitiveType(void *a1, const char *a2, ...)
{
  return [a1 primitiveType];
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return [a1 priority];
}

id objc_msgSend_privateData(void *a1, const char *a2, ...)
{
  return [a1 privateData];
}

id objc_msgSend_privateDataOffset(void *a1, const char *a2, ...)
{
  return [a1 privateDataOffset];
}

id objc_msgSend_privateFunctions(void *a1, const char *a2, ...)
{
  return [a1 privateFunctions];
}

id objc_msgSend_privateLoggingBuffer(void *a1, const char *a2, ...)
{
  return [a1 privateLoggingBuffer];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_productName(void *a1, const char *a2, ...)
{
  return [a1 productName];
}

id objc_msgSend_profiles(void *a1, const char *a2, ...)
{
  return [a1 profiles];
}

id objc_msgSend_profilingResults(void *a1, const char *a2, ...)
{
  return [a1 profilingResults];
}

id objc_msgSend_protectionOptions(void *a1, const char *a2, ...)
{
  return [a1 protectionOptions];
}

id objc_msgSend_purgeDeallocatedObjects(void *a1, const char *a2, ...)
{
  return [a1 purgeDeallocatedObjects];
}

id objc_msgSend_qosLevel(void *a1, const char *a2, ...)
{
  return [a1 qosLevel];
}

id objc_msgSend_qualifier(void *a1, const char *a2, ...)
{
  return [a1 qualifier];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_queueAddress(void *a1, const char *a2, ...)
{
  return [a1 queueAddress];
}

id objc_msgSend_rAddressMode(void *a1, const char *a2, ...)
{
  return [a1 rAddressMode];
}

id objc_msgSend_radiusBuffer(void *a1, const char *a2, ...)
{
  return [a1 radiusBuffer];
}

id objc_msgSend_radiusBufferOffset(void *a1, const char *a2, ...)
{
  return [a1 radiusBufferOffset];
}

id objc_msgSend_radiusBuffers(void *a1, const char *a2, ...)
{
  return [a1 radiusBuffers];
}

id objc_msgSend_radiusFormat(void *a1, const char *a2, ...)
{
  return [a1 radiusFormat];
}

id objc_msgSend_radiusStride(void *a1, const char *a2, ...)
{
  return [a1 radiusStride];
}

id objc_msgSend_rasterSampleCount(void *a1, const char *a2, ...)
{
  return [a1 rasterSampleCount];
}

id objc_msgSend_rasterizationRateMap(void *a1, const char *a2, ...)
{
  return [a1 rasterizationRateMap];
}

id objc_msgSend_reactiveMaskTextureFormat(void *a1, const char *a2, ...)
{
  return [a1 reactiveMaskTextureFormat];
}

id objc_msgSend_reactiveTextureUsage(void *a1, const char *a2, ...)
{
  return [a1 reactiveTextureUsage];
}

id objc_msgSend_readMask(void *a1, const char *a2, ...)
{
  return [a1 readMask];
}

id objc_msgSend_readWriteTextureSupport(void *a1, const char *a2, ...)
{
  return [a1 readWriteTextureSupport];
}

id objc_msgSend_readsDepth(void *a1, const char *a2, ...)
{
  return [a1 readsDepth];
}

id objc_msgSend_readsStencil(void *a1, const char *a2, ...)
{
  return [a1 readsStencil];
}

id objc_msgSend_recommendedMaxWorkingSetSize(void *a1, const char *a2, ...)
{
  return [a1 recommendedMaxWorkingSetSize];
}

id objc_msgSend_reflection(void *a1, const char *a2, ...)
{
  return [a1 reflection];
}

id objc_msgSend_registryID(void *a1, const char *a2, ...)
{
  return [a1 registryID];
}

id objc_msgSend_relocations(void *a1, const char *a2, ...)
{
  return [a1 relocations];
}

id objc_msgSend_removeAllAllocations(void *a1, const char *a2, ...)
{
  return [a1 removeAllAllocations];
}

id objc_msgSend_removeAllDebugMarkers(void *a1, const char *a2, ...)
{
  return [a1 removeAllDebugMarkers];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeFromSuperlayer(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperlayer];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return [a1 removeLastObject];
}

id objc_msgSend_renderCommandEncoder(void *a1, const char *a2, ...)
{
  return [a1 renderCommandEncoder];
}

id objc_msgSend_renderFunctionCopyIndirectCommandBuffer(void *a1, const char *a2, ...)
{
  return [a1 renderFunctionCopyIndirectCommandBuffer];
}

id objc_msgSend_renderPassDescriptor(void *a1, const char *a2, ...)
{
  return [a1 renderPassDescriptor];
}

id objc_msgSend_renderPipelineCopyBuffer(void *a1, const char *a2, ...)
{
  return [a1 renderPipelineCopyBuffer];
}

id objc_msgSend_renderPipelineCopyIndirectCommandBuffer(void *a1, const char *a2, ...)
{
  return [a1 renderPipelineCopyIndirectCommandBuffer];
}

id objc_msgSend_renderTargetArrayIndexType(void *a1, const char *a2, ...)
{
  return [a1 renderTargetArrayIndexType];
}

id objc_msgSend_renderTargetArrayLength(void *a1, const char *a2, ...)
{
  return [a1 renderTargetArrayLength];
}

id objc_msgSend_renderTargetHeight(void *a1, const char *a2, ...)
{
  return [a1 renderTargetHeight];
}

id objc_msgSend_renderTargetWidth(void *a1, const char *a2, ...)
{
  return [a1 renderTargetWidth];
}

id objc_msgSend_replyBlock(void *a1, const char *a2, ...)
{
  return [a1 replyBlock];
}

id objc_msgSend_replySerial(void *a1, const char *a2, ...)
{
  return [a1 replySerial];
}

id objc_msgSend_replyTo(void *a1, const char *a2, ...)
{
  return [a1 replyTo];
}

id objc_msgSend_reportFrequencyInSeconds(void *a1, const char *a2, ...)
{
  return [a1 reportFrequencyInSeconds];
}

id objc_msgSend_requestID(void *a1, const char *a2, ...)
{
  return [a1 requestID];
}

id objc_msgSend_requestResidency(void *a1, const char *a2, ...)
{
  return [a1 requestResidency];
}

id objc_msgSend_requests(void *a1, const char *a2, ...)
{
  return [a1 requests];
}

id objc_msgSend_required(void *a1, const char *a2, ...)
{
  return [a1 required];
}

id objc_msgSend_requiresBFloat16Emulation(void *a1, const char *a2, ...)
{
  return [a1 requiresBFloat16Emulation];
}

id objc_msgSend_requiresRaytracingEmulation(void *a1, const char *a2, ...)
{
  return [a1 requiresRaytracingEmulation];
}

id objc_msgSend_requiresSynchronousInitialization(void *a1, const char *a2, ...)
{
  return [a1 requiresSynchronousInitialization];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_resolveDepthPlane(void *a1, const char *a2, ...)
{
  return [a1 resolveDepthPlane];
}

id objc_msgSend_resolveLevel(void *a1, const char *a2, ...)
{
  return [a1 resolveLevel];
}

id objc_msgSend_resolveSlice(void *a1, const char *a2, ...)
{
  return [a1 resolveSlice];
}

id objc_msgSend_resolveTexture(void *a1, const char *a2, ...)
{
  return [a1 resolveTexture];
}

id objc_msgSend_resourceIndex(void *a1, const char *a2, ...)
{
  return [a1 resourceIndex];
}

id objc_msgSend_resourceOptions(void *a1, const char *a2, ...)
{
  return [a1 resourceOptions];
}

id objc_msgSend_resourceStateCommandEncoder(void *a1, const char *a2, ...)
{
  return [a1 resourceStateCommandEncoder];
}

id objc_msgSend_responsibleProcess(void *a1, const char *a2, ...)
{
  return [a1 responsibleProcess];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_retainedObjects(void *a1, const char *a2, ...)
{
  return [a1 retainedObjects];
}

id objc_msgSend_retainedReferences(void *a1, const char *a2, ...)
{
  return [a1 retainedReferences];
}

id objc_msgSend_returnType(void *a1, const char *a2, ...)
{
  return [a1 returnType];
}

id objc_msgSend_rgbBlendOperation(void *a1, const char *a2, ...)
{
  return [a1 rgbBlendOperation];
}

id objc_msgSend_rotation(void *a1, const char *a2, ...)
{
  return [a1 rotation];
}

id objc_msgSend_sAddressMode(void *a1, const char *a2, ...)
{
  return [a1 sAddressMode];
}

id objc_msgSend_sampleBuffer(void *a1, const char *a2, ...)
{
  return [a1 sampleBuffer];
}

id objc_msgSend_sampleBufferAttachments(void *a1, const char *a2, ...)
{
  return [a1 sampleBufferAttachments];
}

id objc_msgSend_sampleCount(void *a1, const char *a2, ...)
{
  return [a1 sampleCount];
}

id objc_msgSend_sampleCoverage(void *a1, const char *a2, ...)
{
  return [a1 sampleCoverage];
}

id objc_msgSend_sampleCoverageInvert(void *a1, const char *a2, ...)
{
  return [a1 sampleCoverageInvert];
}

id objc_msgSend_sampleMask(void *a1, const char *a2, ...)
{
  return [a1 sampleMask];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_scopeStreamRef(void *a1, const char *a2, ...)
{
  return [a1 scopeStreamRef];
}

id objc_msgSend_screenSize(void *a1, const char *a2, ...)
{
  return [a1 screenSize];
}

id objc_msgSend_seekToEndOfFile(void *a1, const char *a2, ...)
{
  return [a1 seekToEndOfFile];
}

id objc_msgSend_segmentControlPointCount(void *a1, const char *a2, ...)
{
  return [a1 segmentControlPointCount];
}

id objc_msgSend_segmentCount(void *a1, const char *a2, ...)
{
  return [a1 segmentCount];
}

id objc_msgSend_serial(void *a1, const char *a2, ...)
{
  return [a1 serial];
}

id objc_msgSend_servicePort(void *a1, const char *a2, ...)
{
  return [a1 servicePort];
}

id objc_msgSend_sessionID(void *a1, const char *a2, ...)
{
  return [a1 sessionID];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setBarrier(void *a1, const char *a2, ...)
{
  return [a1 setBarrier];
}

id objc_msgSend_setDepthCleared(void *a1, const char *a2, ...)
{
  return [a1 setDepthCleared];
}

id objc_msgSend_setStencilCleared(void *a1, const char *a2, ...)
{
  return [a1 setStencilCleared];
}

id objc_msgSend_shaderDebugInfoCaching(void *a1, const char *a2, ...)
{
  return [a1 shaderDebugInfoCaching];
}

id objc_msgSend_shaderValidation(void *a1, const char *a2, ...)
{
  return [a1 shaderValidation];
}

id objc_msgSend_shaderValidationEnabled(void *a1, const char *a2, ...)
{
  return [a1 shaderValidationEnabled];
}

id objc_msgSend_shaderValidationState(void *a1, const char *a2, ...)
{
  return [a1 shaderValidationState];
}

id objc_msgSend_sharedCaptureManager(void *a1, const char *a2, ...)
{
  return [a1 sharedCaptureManager];
}

id objc_msgSend_sharedMemorySize(void *a1, const char *a2, ...)
{
  return [a1 sharedMemorySize];
}

id objc_msgSend_signaledValue(void *a1, const char *a2, ...)
{
  return [a1 signaledValue];
}

id objc_msgSend_singleFPConfig(void *a1, const char *a2, ...)
{
  return [a1 singleFPConfig];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_skipEmptyTilesOnClearEnabled(void *a1, const char *a2, ...)
{
  return [a1 skipEmptyTilesOnClearEnabled];
}

id objc_msgSend_skipRender(void *a1, const char *a2, ...)
{
  return [a1 skipRender];
}

id objc_msgSend_skipSampleValidationAndApplySampleAtTileGranularity(void *a1, const char *a2, ...)
{
  return [a1 skipSampleValidationAndApplySampleAtTileGranularity];
}

id objc_msgSend_slice(void *a1, const char *a2, ...)
{
  return [a1 slice];
}

id objc_msgSend_sourceAlphaBlendFactor(void *a1, const char *a2, ...)
{
  return [a1 sourceAlphaBlendFactor];
}

id objc_msgSend_sourceLanguage(void *a1, const char *a2, ...)
{
  return [a1 sourceLanguage];
}

id objc_msgSend_sourceRGBBlendFactor(void *a1, const char *a2, ...)
{
  return [a1 sourceRGBBlendFactor];
}

id objc_msgSend_sparsePageSize(void *a1, const char *a2, ...)
{
  return [a1 sparsePageSize];
}

id objc_msgSend_sparseSurfaceDefaultValue(void *a1, const char *a2, ...)
{
  return [a1 sparseSurfaceDefaultValue];
}

id objc_msgSend_sparseTexturesSupport(void *a1, const char *a2, ...)
{
  return [a1 sparseTexturesSupport];
}

id objc_msgSend_sparseTileSizeInBytes(void *a1, const char *a2, ...)
{
  return [a1 sparseTileSizeInBytes];
}

id objc_msgSend_specializedName(void *a1, const char *a2, ...)
{
  return [a1 specializedName];
}

id objc_msgSend_stageInputAttributes(void *a1, const char *a2, ...)
{
  return [a1 stageInputAttributes];
}

id objc_msgSend_stageInputDescriptor(void *a1, const char *a2, ...)
{
  return [a1 stageInputDescriptor];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startCollectingPipelineDescriptors(void *a1, const char *a2, ...)
{
  return [a1 startCollectingPipelineDescriptors];
}

id objc_msgSend_startOfEncoderSampleIndex(void *a1, const char *a2, ...)
{
  return [a1 startOfEncoderSampleIndex];
}

id objc_msgSend_startOfFragmentSampleIndex(void *a1, const char *a2, ...)
{
  return [a1 startOfFragmentSampleIndex];
}

id objc_msgSend_startOfVertexSampleIndex(void *a1, const char *a2, ...)
{
  return [a1 startOfVertexSampleIndex];
}

id objc_msgSend_stateBuffer(void *a1, const char *a2, ...)
{
  return [a1 stateBuffer];
}

id objc_msgSend_staticThreadgroupMemoryLength(void *a1, const char *a2, ...)
{
  return [a1 staticThreadgroupMemoryLength];
}

id objc_msgSend_stats(void *a1, const char *a2, ...)
{
  return [a1 stats];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_stencilAttachment(void *a1, const char *a2, ...)
{
  return [a1 stencilAttachment];
}

id objc_msgSend_stencilAttachmentPixelFormat(void *a1, const char *a2, ...)
{
  return [a1 stencilAttachmentPixelFormat];
}

id objc_msgSend_stencilCompareFunction(void *a1, const char *a2, ...)
{
  return [a1 stencilCompareFunction];
}

id objc_msgSend_stencilFailureOperation(void *a1, const char *a2, ...)
{
  return [a1 stencilFailureOperation];
}

id objc_msgSend_stencilResolveFilter(void *a1, const char *a2, ...)
{
  return [a1 stencilResolveFilter];
}

id objc_msgSend_stepFunction(void *a1, const char *a2, ...)
{
  return [a1 stepFunction];
}

id objc_msgSend_stepRate(void *a1, const char *a2, ...)
{
  return [a1 stepRate];
}

id objc_msgSend_stopCapture(void *a1, const char *a2, ...)
{
  return [a1 stopCapture];
}

id objc_msgSend_storageMode(void *a1, const char *a2, ...)
{
  return [a1 storageMode];
}

id objc_msgSend_storeAction(void *a1, const char *a2, ...)
{
  return [a1 storeAction];
}

id objc_msgSend_storeActionOptions(void *a1, const char *a2, ...)
{
  return [a1 storeActionOptions];
}

id objc_msgSend_streamRef(void *a1, const char *a2, ...)
{
  return [a1 streamRef];
}

id objc_msgSend_streamReference(void *a1, const char *a2, ...)
{
  return [a1 streamReference];
}

id objc_msgSend_stride(void *a1, const char *a2, ...)
{
  return [a1 stride];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_strongToWeakObjectsMapTable(void *a1, const char *a2, ...)
{
  return [a1 strongToWeakObjectsMapTable];
}

id objc_msgSend_sublayerTransform(void *a1, const char *a2, ...)
{
  return [a1 sublayerTransform];
}

id objc_msgSend_sublayers(void *a1, const char *a2, ...)
{
  return [a1 sublayers];
}

id objc_msgSend_superlayer(void *a1, const char *a2, ...)
{
  return [a1 superlayer];
}

id objc_msgSend_supportAddingBinaryFunctions(void *a1, const char *a2, ...)
{
  return [a1 supportAddingBinaryFunctions];
}

id objc_msgSend_supportAddingFragmentBinaryFunctions(void *a1, const char *a2, ...)
{
  return [a1 supportAddingFragmentBinaryFunctions];
}

id objc_msgSend_supportAddingMeshBinaryFunctions(void *a1, const char *a2, ...)
{
  return [a1 supportAddingMeshBinaryFunctions];
}

id objc_msgSend_supportAddingObjectBinaryFunctions(void *a1, const char *a2, ...)
{
  return [a1 supportAddingObjectBinaryFunctions];
}

id objc_msgSend_supportAddingVertexBinaryFunctions(void *a1, const char *a2, ...)
{
  return [a1 supportAddingVertexBinaryFunctions];
}

id objc_msgSend_supportArgumentBuffers(void *a1, const char *a2, ...)
{
  return [a1 supportArgumentBuffers];
}

id objc_msgSend_supportDynamicAttributeStride(void *a1, const char *a2, ...)
{
  return [a1 supportDynamicAttributeStride];
}

id objc_msgSend_supportIndirectCommandBuffers(void *a1, const char *a2, ...)
{
  return [a1 supportIndirectCommandBuffers];
}

id objc_msgSend_supportPriorityBand(void *a1, const char *a2, ...)
{
  return [a1 supportPriorityBand];
}

id objc_msgSend_supportRayTracing(void *a1, const char *a2, ...)
{
  return [a1 supportRayTracing];
}

id objc_msgSend_supportsComputeMemoryBarrier(void *a1, const char *a2, ...)
{
  return [a1 supportsComputeMemoryBarrier];
}

id objc_msgSend_supportsMeshShadersInICB(void *a1, const char *a2, ...)
{
  return [a1 supportsMeshShadersInICB];
}

id objc_msgSend_supportsNonUniformThreadgroupSize(void *a1, const char *a2, ...)
{
  return [a1 supportsNonUniformThreadgroupSize];
}

id objc_msgSend_supportsPartialRenderMemoryBarrier(void *a1, const char *a2, ...)
{
  return [a1 supportsPartialRenderMemoryBarrier];
}

id objc_msgSend_supportsRaytracing(void *a1, const char *a2, ...)
{
  return [a1 supportsRaytracing];
}

id objc_msgSend_supportsRenderMemoryBarrier(void *a1, const char *a2, ...)
{
  return [a1 supportsRenderMemoryBarrier];
}

id objc_msgSend_suspendAfterCapture(void *a1, const char *a2, ...)
{
  return [a1 suspendAfterCapture];
}

id objc_msgSend_swizzle(void *a1, const char *a2, ...)
{
  return [a1 swizzle];
}

id objc_msgSend_swizzleKey(void *a1, const char *a2, ...)
{
  return [a1 swizzleKey];
}

id objc_msgSend_tAddressMode(void *a1, const char *a2, ...)
{
  return [a1 tAddressMode];
}

id objc_msgSend_tailSizeInBytes(void *a1, const char *a2, ...)
{
  return [a1 tailSizeInBytes];
}

id objc_msgSend_targetDeviceArchitecture(void *a1, const char *a2, ...)
{
  return [a1 targetDeviceArchitecture];
}

id objc_msgSend_targetDeviceInfo(void *a1, const char *a2, ...)
{
  return [a1 targetDeviceInfo];
}

id objc_msgSend_temporaryDirectory(void *a1, const char *a2, ...)
{
  return [a1 temporaryDirectory];
}

id objc_msgSend_tessellationControlPointIndexType(void *a1, const char *a2, ...)
{
  return [a1 tessellationControlPointIndexType];
}

id objc_msgSend_tessellationFactorFormat(void *a1, const char *a2, ...)
{
  return [a1 tessellationFactorFormat];
}

id objc_msgSend_tessellationFactorStepFunction(void *a1, const char *a2, ...)
{
  return [a1 tessellationFactorStepFunction];
}

id objc_msgSend_tessellationOutputWindingOrder(void *a1, const char *a2, ...)
{
  return [a1 tessellationOutputWindingOrder];
}

id objc_msgSend_tessellationPartitionMode(void *a1, const char *a2, ...)
{
  return [a1 tessellationPartitionMode];
}

id objc_msgSend_texture(void *a1, const char *a2, ...)
{
  return [a1 texture];
}

id objc_msgSend_textureDataType(void *a1, const char *a2, ...)
{
  return [a1 textureDataType];
}

id objc_msgSend_textureType(void *a1, const char *a2, ...)
{
  return [a1 textureType];
}

id objc_msgSend_textureWriteRoundingMode(void *a1, const char *a2, ...)
{
  return [a1 textureWriteRoundingMode];
}

id objc_msgSend_threadExecutionWidth(void *a1, const char *a2, ...)
{
  return [a1 threadExecutionWidth];
}

id objc_msgSend_threadGroupSizeIsMultipleOfThreadExecutionWidth(void *a1, const char *a2, ...)
{
  return [a1 threadGroupSizeIsMultipleOfThreadExecutionWidth];
}

id objc_msgSend_threadgroupMemoryAlignment(void *a1, const char *a2, ...)
{
  return [a1 threadgroupMemoryAlignment];
}

id objc_msgSend_threadgroupMemoryDataSize(void *a1, const char *a2, ...)
{
  return [a1 threadgroupMemoryDataSize];
}

id objc_msgSend_threadgroupMemoryLength(void *a1, const char *a2, ...)
{
  return [a1 threadgroupMemoryLength];
}

id objc_msgSend_threadgroupSizeMatchesTileSize(void *a1, const char *a2, ...)
{
  return [a1 threadgroupSizeMatchesTileSize];
}

id objc_msgSend_threadgroupsPerGrid(void *a1, const char *a2, ...)
{
  return [a1 threadgroupsPerGrid];
}

id objc_msgSend_threadsPerGrid(void *a1, const char *a2, ...)
{
  return [a1 threadsPerGrid];
}

id objc_msgSend_threadsPerMeshThreadgroup(void *a1, const char *a2, ...)
{
  return [a1 threadsPerMeshThreadgroup];
}

id objc_msgSend_threadsPerObjectThreadgroup(void *a1, const char *a2, ...)
{
  return [a1 threadsPerObjectThreadgroup];
}

id objc_msgSend_threadsPerThreadgroup(void *a1, const char *a2, ...)
{
  return [a1 threadsPerThreadgroup];
}

id objc_msgSend_tileAdditionalBinaryFunctions(void *a1, const char *a2, ...)
{
  return [a1 tileAdditionalBinaryFunctions];
}

id objc_msgSend_tileBindings(void *a1, const char *a2, ...)
{
  return [a1 tileBindings];
}

id objc_msgSend_tileBuffers(void *a1, const char *a2, ...)
{
  return [a1 tileBuffers];
}

id objc_msgSend_tileFunction(void *a1, const char *a2, ...)
{
  return [a1 tileFunction];
}

id objc_msgSend_tileHeight(void *a1, const char *a2, ...)
{
  return [a1 tileHeight];
}

id objc_msgSend_tileWidth(void *a1, const char *a2, ...)
{
  return [a1 tileWidth];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeout(void *a1, const char *a2, ...)
{
  return [a1 timeout];
}

id objc_msgSend_toolsCaptureManager(void *a1, const char *a2, ...)
{
  return [a1 toolsCaptureManager];
}

id objc_msgSend_toolsDeviceAddress(void *a1, const char *a2, ...)
{
  return [a1 toolsDeviceAddress];
}

id objc_msgSend_toolsQueueAddress(void *a1, const char *a2, ...)
{
  return [a1 toolsQueueAddress];
}

id objc_msgSend_touch(void *a1, const char *a2, ...)
{
  return [a1 touch];
}

id objc_msgSend_traceContext(void *a1, const char *a2, ...)
{
  return [a1 traceContext];
}

id objc_msgSend_traceStream(void *a1, const char *a2, ...)
{
  return [a1 traceStream];
}

id objc_msgSend_transform(void *a1, const char *a2, ...)
{
  return [a1 transform];
}

id objc_msgSend_transformationMatrixBuffer(void *a1, const char *a2, ...)
{
  return [a1 transformationMatrixBuffer];
}

id objc_msgSend_transformationMatrixBufferOffset(void *a1, const char *a2, ...)
{
  return [a1 transformationMatrixBufferOffset];
}

id objc_msgSend_transformationMatrixLayout(void *a1, const char *a2, ...)
{
  return [a1 transformationMatrixLayout];
}

id objc_msgSend_transport(void *a1, const char *a2, ...)
{
  return [a1 transport];
}

id objc_msgSend_triangleCount(void *a1, const char *a2, ...)
{
  return [a1 triangleCount];
}

id objc_msgSend_triggerHitsToEnd(void *a1, const char *a2, ...)
{
  return [a1 triggerHitsToEnd];
}

id objc_msgSend_triggerHitsToStart(void *a1, const char *a2, ...)
{
  return [a1 triggerHitsToStart];
}

id objc_msgSend_tryCancel(void *a1, const char *a2, ...)
{
  return [a1 tryCancel];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_typeName(void *a1, const char *a2, ...)
{
  return [a1 typeName];
}

id objc_msgSend_unfilteredResourceOptions(void *a1, const char *a2, ...)
{
  return [a1 unfilteredResourceOptions];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifier];
}

id objc_msgSend_unloadShaderCaches(void *a1, const char *a2, ...)
{
  return [a1 unloadShaderCaches];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_unmapShaderSampleBuffer(void *a1, const char *a2, ...)
{
  return [a1 unmapShaderSampleBuffer];
}

id objc_msgSend_unpackedFilePath(void *a1, const char *a2, ...)
{
  return [a1 unpackedFilePath];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_updateAll(void *a1, const char *a2, ...)
{
  return [a1 updateAll];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_usage(void *a1, const char *a2, ...)
{
  return [a1 usage];
}

id objc_msgSend_usedGPUMemory(void *a1, const char *a2, ...)
{
  return [a1 usedGPUMemory];
}

id objc_msgSend_usedSize(void *a1, const char *a2, ...)
{
  return [a1 usedSize];
}

id objc_msgSend_userDictionary(void *a1, const char *a2, ...)
{
  return [a1 userDictionary];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_vendorName(void *a1, const char *a2, ...)
{
  return [a1 vendorName];
}

id objc_msgSend_vertexAdditionalBinaryFunctions(void *a1, const char *a2, ...)
{
  return [a1 vertexAdditionalBinaryFunctions];
}

id objc_msgSend_vertexAmplificationMode(void *a1, const char *a2, ...)
{
  return [a1 vertexAmplificationMode];
}

id objc_msgSend_vertexAttributes(void *a1, const char *a2, ...)
{
  return [a1 vertexAttributes];
}

id objc_msgSend_vertexBindings(void *a1, const char *a2, ...)
{
  return [a1 vertexBindings];
}

id objc_msgSend_vertexBuffer(void *a1, const char *a2, ...)
{
  return [a1 vertexBuffer];
}

id objc_msgSend_vertexBufferOffset(void *a1, const char *a2, ...)
{
  return [a1 vertexBufferOffset];
}

id objc_msgSend_vertexBuffers(void *a1, const char *a2, ...)
{
  return [a1 vertexBuffers];
}

id objc_msgSend_vertexBuiltInArguments(void *a1, const char *a2, ...)
{
  return [a1 vertexBuiltInArguments];
}

id objc_msgSend_vertexCount(void *a1, const char *a2, ...)
{
  return [a1 vertexCount];
}

id objc_msgSend_vertexDepthCompareClampMask(void *a1, const char *a2, ...)
{
  return [a1 vertexDepthCompareClampMask];
}

id objc_msgSend_vertexDescriptor(void *a1, const char *a2, ...)
{
  return [a1 vertexDescriptor];
}

id objc_msgSend_vertexFormat(void *a1, const char *a2, ...)
{
  return [a1 vertexFormat];
}

id objc_msgSend_vertexFunction(void *a1, const char *a2, ...)
{
  return [a1 vertexFunction];
}

id objc_msgSend_vertexLinkedFunctions(void *a1, const char *a2, ...)
{
  return [a1 vertexLinkedFunctions];
}

id objc_msgSend_vertexPluginReturnData(void *a1, const char *a2, ...)
{
  return [a1 vertexPluginReturnData];
}

id objc_msgSend_vertexPreloadedLibraries(void *a1, const char *a2, ...)
{
  return [a1 vertexPreloadedLibraries];
}

id objc_msgSend_vertexStart(void *a1, const char *a2, ...)
{
  return [a1 vertexStart];
}

id objc_msgSend_vertexStride(void *a1, const char *a2, ...)
{
  return [a1 vertexStride];
}

id objc_msgSend_verticalSampleStorage(void *a1, const char *a2, ...)
{
  return [a1 verticalSampleStorage];
}

id objc_msgSend_virtualAddress(void *a1, const char *a2, ...)
{
  return [a1 virtualAddress];
}

id objc_msgSend_visibilityResultBuffer(void *a1, const char *a2, ...)
{
  return [a1 visibilityResultBuffer];
}

id objc_msgSend_vmBuffer(void *a1, const char *a2, ...)
{
  return [a1 vmBuffer];
}

id objc_msgSend_vnioID(void *a1, const char *a2, ...)
{
  return [a1 vnioID];
}

id objc_msgSend_wait(void *a1, const char *a2, ...)
{
  return [a1 wait];
}

id objc_msgSend_waitEvent(void *a1, const char *a2, ...)
{
  return [a1 waitEvent];
}

id objc_msgSend_waitEventTimeout(void *a1, const char *a2, ...)
{
  return [a1 waitEventTimeout];
}

id objc_msgSend_waitUntilComplete(void *a1, const char *a2, ...)
{
  return [a1 waitUntilComplete];
}

id objc_msgSend_waitUntilCompleted(void *a1, const char *a2, ...)
{
  return [a1 waitUntilCompleted];
}

id objc_msgSend_waitUntilFinished(void *a1, const char *a2, ...)
{
  return [a1 waitUntilFinished];
}

id objc_msgSend_waitUntilResolved(void *a1, const char *a2, ...)
{
  return [a1 waitUntilResolved];
}

id objc_msgSend_waitUntilScheduled(void *a1, const char *a2, ...)
{
  return [a1 waitUntilScheduled];
}

id objc_msgSend_waitValue(void *a1, const char *a2, ...)
{
  return [a1 waitValue];
}

id objc_msgSend_watermark(void *a1, const char *a2, ...)
{
  return [a1 watermark];
}

id objc_msgSend_width(void *a1, const char *a2, ...)
{
  return [a1 width];
}

id objc_msgSend_writeMask(void *a1, const char *a2, ...)
{
  return [a1 writeMask];
}

id objc_msgSend_writeSwizzleEnabled(void *a1, const char *a2, ...)
{
  return [a1 writeSwizzleEnabled];
}

id objc_msgSend_writesDepth(void *a1, const char *a2, ...)
{
  return [a1 writesDepth];
}

id objc_msgSend_writesStencil(void *a1, const char *a2, ...)
{
  return [a1 writesStencil];
}

id objc_msgSend_yInvert(void *a1, const char *a2, ...)
{
  return [a1 yInvert];
}

id objc_msgSend_zPosition(void *a1, const char *a2, ...)
{
  return [a1 zPosition];
}