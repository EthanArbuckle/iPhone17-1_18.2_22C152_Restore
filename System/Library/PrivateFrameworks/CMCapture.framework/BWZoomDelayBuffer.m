@interface BWZoomDelayBuffer
- initWithMaxZoomDelay:(int)a3 currentZoomDelay:;
- (uint64_t)addZoomRequest:(uint64_t)a3;
- (uint64_t)updateZoomDelay:(uint64_t)result;
- (uint64_t)zoomRequestForISPAppliedZoomFactor:(float)a3 earlySwitchOverScaleFactorForZoomIn:;
- (void)dealloc;
@end

@implementation BWZoomDelayBuffer

- (uint64_t)addZoomRequest:(uint64_t)a3
{
  if (result)
  {
    uint64_t v3 = *(unsigned int *)(result + 16);
    if (v3) {
      unsigned int v4 = v3 - 1;
    }
    else {
      unsigned int v4 = *(_DWORD *)(result + 24);
    }
    uint64_t v5 = *(void *)(result + 8);
    float v6 = *(float *)(v5 + 16 * v4);
    v7 = (void *)(v5 + 16 * v3);
    void *v7 = a2;
    v7[1] = a3;
    int v8 = *(_DWORD *)(result + 16);
    unsigned int v10 = *(_DWORD *)(result + 24);
    int v9 = *(_DWORD *)(result + 28);
    if (v8 + 1 <= v10) {
      unsigned int v11 = v8 + 1;
    }
    else {
      unsigned int v11 = 0;
    }
    *(_DWORD *)(result + 16) = v11;
    if (v9 == 2 && v6 > *(float *)&a2)
    {
      int v12 = 1;
      if (*(_DWORD *)(result + 32) == 2 && v10 != 1)
      {
        unsigned int v13 = 0;
        do
        {
          *(_OWORD *)(*(void *)(result + 8) + 16 * v11) = *(_OWORD *)(*(void *)(result + 8) + 16 * v4);
          unsigned int v14 = *(_DWORD *)(result + 24);
          if (v11 + 1 <= v14) {
            ++v11;
          }
          else {
            unsigned int v11 = 0;
          }
          ++v13;
        }
        while (v13 < v14 - 1);
        int v12 = 1;
      }
      goto LABEL_21;
    }
    if (v9 == 1 && v6 < *(float *)&a2)
    {
      int v12 = 2;
LABEL_21:
      *(_DWORD *)(result + 28) = v12;
    }
  }
  return result;
}

- (uint64_t)zoomRequestForISPAppliedZoomFactor:(float)a3 earlySwitchOverScaleFactorForZoomIn:
{
  if (result)
  {
    int v3 = *(_DWORD *)(result + 16);
    if (v3) {
      unsigned int v4 = v3 - 1;
    }
    else {
      unsigned int v4 = *(_DWORD *)(result + 24);
    }
    uint64_t v5 = *(void *)(result + 8);
    int v6 = *(_DWORD *)(result + 32);
    if (*(_DWORD *)(result + 28) == 2)
    {
      if (v6 && (v6 != 2 || (float)(*(float *)(v5 + 16 * v4) / a3) < a2)) {
        unsigned int v4 = *(_DWORD *)(result + 16);
      }
    }
    else if (v6)
    {
      unsigned int v4 = *(_DWORD *)(result + 16);
    }
    return *(void *)(v5 + 16 * v4);
  }
  return result;
}

- initWithMaxZoomDelay:(int)a3 currentZoomDelay:
{
  if (!a1) {
    return 0;
  }
  v16.receiver = a1;
  v16.super_class = (Class)BWZoomDelayBuffer;
  uint64_t v5 = objc_msgSendSuper2(&v16, sel_init);
  int v6 = v5;
  if (!v5) {
    return v6;
  }
  v5[5] = a2;
  v5[6] = a3;
  v5[7] = 2;
  v7 = (char *)malloc_type_malloc(16 * (a2 + 1), 0x10000408B6DE1C6uLL);
  *((void *)v6 + 1) = v7;
  if (!v7)
  {

    return 0;
  }
  unsigned int v8 = 0;
  __asm { FMOV            V0.2S, #1.0 }
  do
  {
    unsigned int v14 = &v7[16 * v8];
    *(void *)unsigned int v14 = _D0;
    *((_DWORD *)v14 + 2) = 0;
    v14[12] = 0;
    ++v8;
  }
  while (v8 <= v6[5]);
  return v6;
}

- (void)dealloc
{
  free(self->_zoomRequestBuffer);
  v3.receiver = self;
  v3.super_class = (Class)BWZoomDelayBuffer;
  [(BWZoomDelayBuffer *)&v3 dealloc];
}

- (uint64_t)updateZoomDelay:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = *(unsigned int *)(result + 24);
    if (v2 >= a2)
    {
      if (v2 > a2)
      {
        LODWORD(v6) = *(_DWORD *)(result + 16);
        LODWORD(v7) = *(_DWORD *)(result + 24);
        do
        {
          if (v6 < v7)
          {
            uint64_t v8 = 16 * v6;
            unint64_t v6 = v6;
            do
            {
              ++v6;
              *(_OWORD *)(*(void *)(result + 8) + v8) = *(_OWORD *)(*(void *)(result + 8) + v8 + 16);
              unint64_t v7 = *(unsigned int *)(result + 24);
              v8 += 16;
            }
            while (v6 < v7);
            LODWORD(v6) = *(_DWORD *)(result + 16);
          }
          LODWORD(v7) = v7 - 1;
          *(_DWORD *)(result + 24) = v7;
          if (v6 > v7)
          {
            LODWORD(v6) = 0;
            *(_DWORD *)(result + 16) = 0;
          }
        }
        while (v7 > a2);
      }
    }
    else
    {
      unsigned int v3 = *(_DWORD *)(result + 20);
      if (v3 >= a2) {
        unsigned int v3 = a2;
      }
      if ((int)v2 + 1 < v3 + 1)
      {
        uint64_t v4 = 16 * v2 + 16;
        int v5 = v3 - v2;
        do
        {
          *(_OWORD *)(*(void *)(result + 8) + v4) = *(_OWORD *)(*(void *)(result + 8)
                                                                + 16 * *(unsigned int *)(result + 24));
          v4 += 16;
          --v5;
        }
        while (v5);
      }
      *(_DWORD *)(result + 24) = v3;
    }
  }
  return result;
}

@end