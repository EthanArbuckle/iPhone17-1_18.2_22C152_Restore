@interface CreatePlaneMeshSource
@end

@implementation CreatePlaneMeshSource

void ____CreatePlaneMeshSource_block_invoke(uint64_t a1, double a2, float a3, float a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (*(uint64_t *)(a1 + 40) >= 2)
  {
    double v6 = a3;
    double v7 = a4;
    uint64_t v8 = 1;
    while (1)
    {
      int v9 = *(char *)(a1 + 92);
      if (v9 == 3) {
        break;
      }
      if (v9 == 1)
      {
        *(_DWORD *)bytes = 0;
        uint64_t v15 = 0x3F80000000000000;
        goto LABEL_10;
      }
      if (!*(unsigned char *)(a1 + 92))
      {
        double v10 = *(double *)(a1 + 48) + v6;
        double v11 = *(float *)(a1 + 72);
        __double2 v12 = __sincos_stret((float)(*(float *)(a1 + 76) * (float)(int)v8) + a2);
        float v13 = v10 + v11 * v12.__cosval;
        *(float *)bytes = v13;
        double v14 = *(double *)(a1 + 56) + v7 + v11 * v12.__sinval;
        goto LABEL_9;
      }
LABEL_11:
      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      CFDataAppendBytes(*(CFMutableDataRef *)(a1 + 64), bytes, 4 * *(int *)(a1 + 88));
      if (*(void *)(a1 + 40) <= ++v8) {
        return;
      }
    }
    double v16 = *(float *)(a1 + 72);
    __double2 v17 = __sincos_stret((float)(*(float *)(a1 + 76) * (float)(int)v8) + a2);
    float v18 = *(float *)(a1 + 84);
    float v19 = (v6 + v16 * v17.__cosval) / *(float *)(a1 + 80) + 0.5;
    *(float *)bytes = v19;
    double v14 = 1.0 - (v7 + v16 * v17.__sinval) / v18 + -0.5;
LABEL_9:
    *(float *)&unsigned int v20 = v14;
    uint64_t v15 = v20;
LABEL_10:
    uint64_t v22 = v15;
    goto LABEL_11;
  }
}

void ____CreatePlaneMeshSource_block_invoke_2(uint64_t a1, float a2, float a3, float a4, float a5, float a6)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  float v7 = a6 + 1.0;
  if ((float)(a6 + 1.0) > 0.0)
  {
    double v13 = a3;
    float v14 = 0.0;
    int v15 = 1;
    while (1)
    {
      int v16 = *(char *)(a1 + 76);
      if (v16 == 3) {
        break;
      }
      if (v16 == 1)
      {
        *(float *)bytes = 0.0;
        uint64_t v20 = 0x3F80000000000000;
        goto LABEL_10;
      }
      if (!*(unsigned char *)(a1 + 76))
      {
        double v17 = *(double *)(a1 + 48);
        float v18 = *(double *)(a1 + 40) + a2 + (float)((float)(v14 * a4) / a6);
        *(float *)bytes = v18;
        float v19 = v17 + v13 + (float)((float)(v14 * a5) / a6);
        goto LABEL_9;
      }
LABEL_11:
      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      CFDataAppendBytes(*(CFMutableDataRef *)(a1 + 56), bytes, 4 * *(int *)(a1 + 72));
      float v14 = (float)v15++;
      if (v7 <= v14) {
        return;
      }
    }
    float v21 = *(float *)(a1 + 68);
    *(float *)bytes = (float)((float)((float)((float)(v14 * a4) / a6) + a2) / *(float *)(a1 + 64)) + 0.5;
    float v19 = (float)(1.0 - (float)((float)((float)((float)(v14 * a5) / a6) + a3) / v21)) + -0.5;
LABEL_9:
    uint64_t v20 = LODWORD(v19);
LABEL_10:
    uint64_t v23 = v20;
    goto LABEL_11;
  }
}

@end