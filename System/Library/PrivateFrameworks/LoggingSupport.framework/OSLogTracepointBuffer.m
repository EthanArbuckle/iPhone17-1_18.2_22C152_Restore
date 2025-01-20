@interface OSLogTracepointBuffer
@end

@implementation OSLogTracepointBuffer

uint64_t __80___OSLogTracepointBuffer_finishedInsertingTracepointsWithNextMajorTime_options___block_invoke(uint64_t a1, int *a2, uint64_t a3)
{
  unint64_t v3 = *((void *)a2 + 1);
  unint64_t v4 = *(void *)(a3 + 8);
  BOOL v5 = v3 >= v4;
  if (v3 != v4) {
    goto LABEL_11;
  }
  int v6 = *a2;
  BOOL v5 = *a2 >= *(_DWORD *)a3;
  if (*a2 != *(_DWORD *)a3) {
    goto LABEL_11;
  }
  if (v6 == 2)
  {
    if (*((unsigned __int8 *)a2 + 56) >= *(unsigned __int8 *)(a3 + 56)) {
      v15 = (unsigned int *)(a1 + 32);
    }
    else {
      v15 = (unsigned int *)(a1 + 36);
    }
    return *v15;
  }
  if (v6 == 3)
  {
    uint64_t v7 = *((void *)a2 + 11);
    if (!v7
      || (uint64_t v8 = *(void *)(a3 + 88)) == 0
      || (v9 = *(void *)(v7 + 8), v10 = *(void *)(v8 + 8), BOOL v5 = v9 >= v10, v9 == v10))
    {
      unint64_t v11 = *((void *)a2 + 12);
      unint64_t v12 = *(void *)(a3 + 96);
      if (v11)
      {
        unint64_t v13 = *(void *)(v11 + 8);
        if (v12)
        {
LABEL_10:
          unint64_t v14 = *(void *)(v12 + 8);
LABEL_21:
          if (v11 >= v12) {
            v15 = (unsigned int *)(a1 + 36);
          }
          else {
            v15 = (unsigned int *)(a1 + 32);
          }
          if (v13 >= v14) {
            v17 = (unsigned int *)(a1 + 36);
          }
          else {
            v17 = (unsigned int *)(a1 + 32);
          }
          if (v13 != v14) {
            v15 = v17;
          }
          return *v15;
        }
      }
      else
      {
        unint64_t v13 = 0;
        if (v12) {
          goto LABEL_10;
        }
      }
      unint64_t v14 = 0;
      goto LABEL_21;
    }
LABEL_11:
    v15 = (unsigned int *)(a1 + 32);
    if (v5) {
      v15 = (unsigned int *)(a1 + 36);
    }
    return *v15;
  }
  return 0;
}

uint64_t __76___OSLogTracepointBuffer_insertTimesyncPoints_forBoot_oldestContinuousTime___block_invoke(uint64_t a1, long long *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (*((void *)a2 + 1) >= *(void *)(a1 + 40))
  {
    snprintf(__str, 0x1AuLL, "%016llx.timesync", *(void *)(*(void *)(a1 + 48) + 24));
    unint64_t v4 = [NSString stringWithUTF8String:__str];
    if (v4) {
      BOOL v5 = v4;
    }
    else {
      BOOL v5 = @"(null)";
    }
    [*(id *)(*(void *)(a1 + 32) + 48) addObject:v5];
    __int16 v6 = [*(id *)(*(void *)(a1 + 32) + 48) indexOfObject:v5];
    _oltb_allocate_row(*(void **)(a1 + 32));
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8) + 104 * v7;
    uint64_t v9 = *((void *)a2 + 1);
    long long v10 = *a2;
    long long v12 = a2[1];
    *(_DWORD *)uint64_t v8 = 1;
    *(void *)(v8 + 8) = v9;
    *(_WORD *)(v8 + 16) = v6;
    *(int64x2_t *)(v8 + 24) = vdupq_n_s64(0xDEADBEEFuLL);
    *(void *)(v8 + 40) = 0;
    *(void *)(v8 + 48) = 0;
    *(_OWORD *)(v8 + 56) = v10;
    *(_OWORD *)(v8 + 72) = v12;
    *(_OWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 104 * v7 + 40) = *(_OWORD *)*(void *)(a1 + 56);
  }
  return 1;
}

@end