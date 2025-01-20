@interface BWMotionSampleRingBuffer
- (double)duration;
- (uint64_t)addMotionDataToRingBuffer:(int)a3 withSampleCount:;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)dealloc;
- (void)initWithMaxDuration:(void *)a1;
@end

@implementation BWMotionSampleRingBuffer

- (double)duration
{
  double result = 0.0;
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2)
    {
      uint64_t v3 = *(int *)(v2 + 16);
      if ((*(_DWORD *)(v2 + 20) + *(_DWORD *)(v2 + 24) - (int)v3) % *(_DWORD *)(v2 + 24) >= 1) {
        return *(double *)(-[BWRingBuffer lastElement](*(void *)(a1 + 8)) + 8)
      }
             - *(double *)(*(void *)(v2 + 8) + *(void *)(v2 + 32) * v3 + 8);
    }
  }
  return result;
}

- (uint64_t)addMotionDataToRingBuffer:(int)a3 withSampleCount:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v5 = result;
    mach_absolute_time();
    uint64_t v6 = FigHostTimeToNanoseconds();
    if (a3 >= 1)
    {
      int v7 = 0;
      double v8 = (double)(v6 / 1000) / 1000000.0;
      do
      {
        uint64_t v9 = *(void *)(v5 + 8);
        if (!v9
          || !((*(_DWORD *)(v9 + 20) + *(_DWORD *)(v9 + 24) - *(_DWORD *)(v9 + 16)) % *(_DWORD *)(v9 + 24))
          || (double v10 = a2[1], v10 > *(double *)(-[BWRingBuffer lastElement](*(void *)(v5 + 8)) + 8))
          && vabdd_f64(v8, v10) < *(double *)(v5 + 16))
        {
          -[BWRingBuffer appendElement:]((void *)v9, a2);
        }
        a2 += 18;
        v7 += 3;
      }
      while (v7 < a3);
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v11 = *(void **)(v5 + 8);
    double result = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (result)
    {
      uint64_t v12 = result;
      int v13 = 0;
      uint64_t v14 = *(void *)v24;
      while (2)
      {
        uint64_t v15 = 0;
        int v16 = v13 + v12;
        do
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * v15);
          double result = -[BWRingBuffer lastElement](*(void *)(v5 + 8));
          if (*(double *)(result + 8) - *(double *)(v17 + 8) <= *(double *)(v5 + 16))
          {
            int v16 = v13 + v15;
            goto LABEL_21;
          }
          ++v15;
        }
        while (v12 != v15);
        double result = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
        uint64_t v12 = result;
        int v13 = v16;
        if (result) {
          continue;
        }
        break;
      }
    }
    else
    {
      int v16 = 0;
    }
LABEL_21:
    v18 = *(_DWORD **)(v5 + 8);
    if (v18)
    {
      int v19 = v18[6];
      int v20 = v18[4];
      int v21 = (v18[5] + v19 - v20) % v19;
      int v22 = v21 - *(_DWORD *)(v5 + 24);
      if (v16 <= v22)
      {
        int v16 = v21 - *(_DWORD *)(v5 + 24);
        if (!v22) {
          return result;
        }
      }
      else if (!v16)
      {
        return result;
      }
      if (v21 >= v16) {
        int v21 = v16;
      }
      v18[4] = (v21 + v20) % v19;
    }
  }
  return result;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [(BWRingBuffer *)self->_ringBuffer countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (void)initWithMaxDuration:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v7.receiver = a1;
  v7.super_class = (Class)BWMotionSampleRingBuffer;
  uint64_t v3 = objc_msgSendSuper2(&v7, sel_init);
  v4 = v3;
  if (v3)
  {
    *((double *)v3 + 2) = a2;
    *((_DWORD *)v3 + 6) = (int)(a2 * 66.6666641);
    uint64_t v5 = -[BWRingBuffer initWithLength:dataTypeSize:]([BWRingBuffer alloc], *((_DWORD *)v3 + 6) + 110, 48);
    v4[1] = v5;
    if (!v5)
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWMotionSampleRingBuffer;
  [(BWMotionSampleRingBuffer *)&v3 dealloc];
}

@end