@interface BWObjectRingBuffer
+ (void)initialize;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)firstTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastTime;
- (BOOL)ascending;
- (BOOL)enforceAscending;
- (BOOL)expectAscending;
- (BWObjectRingBuffer)initWithCapacity:(int)a3;
- (Float64)_checkAscendingInsertAt:(uint64_t)a3 object:(CMTime *)a4 forTime:;
- (id)description;
- (id)firstObject;
- (id)lastObject;
- (int)_findClosestOffsetToTimestamp:(id *)a3;
- (int)capacity;
- (int)count;
- (uint64_t)_permuteBufferForNewObjectAtTime:(uint64_t)a1;
- (void)_enumerateObjectsStartingAtOffset:(int)a3 usingBlock:(id)a4;
- (void)_forceAscendingTo:(BOOL)a3;
- (void)_reverseEnumerateObjectsStartingAtOffset:(int)a3 usingBlock:(id)a4;
- (void)appendObject:(id)a3 forTime:(id *)a4;
- (void)clear;
- (void)dealloc;
- (void)enumerateObjectsStartingAt:(id *)a3 usingBlock:(id)a4;
- (void)extractTimeRangeFrom:(id *)a3 until:(id *)a4 into:(id)a5 times:(id)a6;
- (void)flushEntriesEarlierThan:(id *)a3;
- (void)reverseEnumerateObjectsStartingAt:(id *)a3 usingBlock:(id)a4;
- (void)setCapacity:(int)a3;
- (void)setEnforceAscending:(BOOL)a3;
- (void)setExpectAscending:(BOOL)a3;
@end

@implementation BWObjectRingBuffer

- (void)setEnforceAscending:(BOOL)a3
{
  if (!self->_ascending && a3)
  {
    if (self->_count >= 1)
    {
      v6 = (id *)malloc_type_malloc(8 * self->_capacity, 0x80040B8603338uLL);
      v7 = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)malloc_type_malloc(24 * self->_capacity, 0x1000040504FFAC1uLL);
      v8 = (unsigned int *)malloc_type_malloc(4 * self->_capacity, 0x100004052888210uLL);
      v9 = v8;
      int64_t capacity = self->_capacity;
      if ((int)capacity >= 1)
      {
        for (int64_t i = 0; i < capacity; ++i)
        {
          v8[i] = i;
          int64_t capacity = self->_capacity;
        }
      }
      __compar[0] = MEMORY[0x1E4F143A8];
      __compar[1] = 3221225472;
      __compar[2] = __42__BWObjectRingBuffer_setEnforceAscending___block_invoke;
      __compar[3] = &unk_1E5C297E8;
      __compar[4] = self;
      heapsort_b(v8, capacity, 4uLL, __compar);
      if (self->_count >= 1)
      {
        uint64_t v12 = 0;
        v13 = v7;
        do
        {
          v6[v12] = self->_objects[v9[v12]];
          v14 = &self->_times[v9[v12]];
          long long v15 = *(_OWORD *)&v14->var0;
          v13->var3 = v14->var3;
          *(_OWORD *)&v13->var0 = v15;
          ++v13;
          ++v12;
        }
        while (v12 < self->_count);
      }
      free(v9);
      free(self->_objects);
      free(self->_times);
      self->_objects = v6;
      self->_times = v7;
      self->_oldest = 0;
    }
    self->_ascending = 1;
  }
  self->_enforceAscending = a3;
}

- (BWObjectRingBuffer)initWithCapacity:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v7.receiver = self;
  v7.super_class = (Class)BWObjectRingBuffer;
  v4 = [(BWObjectRingBuffer *)&v7 init];
  v5 = v4;
  if (v4)
  {
    *(_WORD *)&v4->_ascending = 1;
    v4->_enforceAscending = 0;
    [(BWObjectRingBuffer *)v4 setCapacity:v3];
  }
  return v5;
}

- (void)setCapacity:(int)a3
{
  if (a3 < 1)
  {
    if (a3 < 0) {
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C4A8], @"setting negative capacity %d", *(void *)&a3);
    }
    v6 = 0;
    v5 = 0;
  }
  else
  {
    v5 = (id *)malloc_type_malloc(8 * a3, 0x80040B8603338uLL);
    v6 = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)malloc_type_malloc(24 * a3, 0x1000040504FFAC1uLL);
  }
  int count = self->_count;
  BOOL v8 = __OFSUB__(count, a3);
  int v9 = count - a3;
  if ((v9 < 0) ^ v8 | (v9 == 0)) {
    int v9 = 0;
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __34__BWObjectRingBuffer_setCapacity___block_invoke;
  v11[3] = &__block_descriptor_52_e25_v52__0_8___qiIq_16i40_B44l;
  int v12 = v9;
  v11[4] = v5;
  v11[5] = v6;
  [(BWObjectRingBuffer *)self _enumerateObjectsStartingAtOffset:0 usingBlock:v11];
  free(self->_objects);
  free(self->_times);
  self->_objects = v5;
  self->_times = v6;
  int v10 = self->_count;
  if (v10 >= a3) {
    int v10 = a3;
  }
  self->_int64_t capacity = a3;
  self->_int count = v10;
  self->_oldest = 0;
}

- (void)_enumerateObjectsStartingAtOffset:(int)a3 usingBlock:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t count = self->_count;
  if (a3 < 0 || (int)count <= a3)
  {
    if (count == a3) {
      return;
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C4A8], @"Invalid start %d for ring buffer of count %d", *(void *)&a3, count);
    LODWORD(count) = self->_count;
  }
  char v20 = 0;
  int oldest = self->_oldest;
  int capacity = self->_capacity;
  int v10 = (oldest + (int)v5) % capacity;
  int v11 = ((int)count + oldest) % capacity;
  do
  {
    id v12 = self->_objects[v10];
    v13 = &self->_times[v10];
    v14 = (void (*)(id, id, long long *, uint64_t, char *))*((void *)a4 + 2);
    long long v15 = *(_OWORD *)&v13->var0;
    int64_t var3 = v13->var3;
    long long v18 = v15;
    v14(a4, v12, &v18, v5, &v20);
    if (v20) {
      break;
    }
    uint64_t v5 = (v5 + 1);
    int v16 = v10 + 1;
    int v17 = self->_capacity;
    if (v10 + 1 < v17) {
      int v17 = 0;
    }
    int v10 = v16 - v17;
  }
  while (v16 - v17 != v11);
}

- (void)setExpectAscending:(BOOL)a3
{
  self->_expectAscending = a3;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (void)dealloc
{
  [(BWObjectRingBuffer *)self setCapacity:0];
  v3.receiver = self;
  v3.super_class = (Class)BWObjectRingBuffer;
  [(BWObjectRingBuffer *)&v3 dealloc];
}

- (int)capacity
{
  return self->_capacity;
}

uint64_t __34__BWObjectRingBuffer_setCapacity___block_invoke(uint64_t result, uint64_t a2, long long *a3, int a4)
{
  int v4 = *(_DWORD *)(result + 48);
  BOOL v5 = __OFSUB__(a4, v4);
  int v6 = a4 - v4;
  if (v6 < 0 != v5) {
    return MEMORY[0x1F41817F8](result, a2);
  }
  *(void *)(*(void *)(result + 32) + 8 * v6) = a2;
  uint64_t v7 = *(void *)(result + 40) + 24 * (a4 - *(_DWORD *)(result + 48));
  long long v8 = *a3;
  *(void *)(v7 + 16) = *((void *)a3 + 2);
  *(_OWORD *)uint64_t v7 = v8;
  return result;
}

uint64_t __42__BWObjectRingBuffer_setEnforceAscending___block_invoke(uint64_t a1, unsigned int *a2, unsigned int *a3)
{
  unsigned int v3 = *a2;
  unsigned int v4 = *a3;
  uint64_t v5 = *(void *)(a1 + 32);
  int v6 = *(_DWORD *)(v5 + 32);
  unsigned int v7 = *a2;
  if ((int)*a2 < v6) {
    unsigned int v7 = *(_DWORD *)(v5 + 24) + v3;
  }
  int v8 = v7 - v6;
  int v9 = *(_DWORD *)(v5 + 28);
  unsigned int v10 = *a3;
  if ((int)v4 < v6) {
    unsigned int v10 = *(_DWORD *)(v5 + 24) + v4;
  }
  int v11 = v10 - v6;
  if (v8 < v9 && v11 < v9)
  {
    uint64_t v14 = *(void *)(v5 + 16);
    long long v15 = (long long *)(v14 + 24 * v3);
    int v16 = (long long *)(v14 + 24 * v4);
    long long v17 = *v15;
    time1.epoch = *((void *)v15 + 2);
    *(_OWORD *)&time1.value = v17;
    long long v18 = *v16;
    v19.epoch = *((void *)v16 + 2);
    *(_OWORD *)&v19.value = v18;
    return CMTimeCompare(&time1, &v19);
  }
  else if (v8 < v9)
  {
    return 0xFFFFFFFFLL;
  }
  else
  {
    return v11 < v9;
  }
}

- (BOOL)enforceAscending
{
  return self->_enforceAscending;
}

- (void)_forceAscendingTo:(BOOL)a3
{
  self->_ascending = a3;
}

- (Float64)_checkAscendingInsertAt:(uint64_t)a3 object:(CMTime *)a4 forTime:
{
  if (a1)
  {
    int v6 = (a2 + *(_DWORD *)(a1 + 24) - 1) % *(_DWORD *)(a1 + 24);
    uint64_t v7 = *(void *)(a1 + 16) + 24 * v6;
    long long v8 = *(_OWORD *)v7;
    time1.epoch = *(void *)(v7 + 16);
    *(_OWORD *)&time1.value = v8;
    CMTime time2 = *a4;
    if (CMTimeCompare(&time1, &time2) >= 1)
    {
      *(unsigned char *)(a1 + 36) = 0;
      if (*(unsigned char *)(a1 + 37))
      {
        uint64_t v10 = *(void *)(a1 + 16) + 24 * v6;
        CMTime time1 = *a4;
        long long v11 = *(_OWORD *)v10;
        time2.epoch = *(void *)(v10 + 16);
        *(_OWORD *)&time2.value = v11;
        CMTimeSubtract(&time, &time1, &time2);
        return CMTimeGetSeconds(&time);
      }
    }
  }
  return result;
}

- (void)appendObject:(id)a3 forTime:(id *)a4
{
  int capacity = self->_capacity;
  if (!capacity) {
    return;
  }
  int count = self->_count;
  int oldest = self->_oldest;
  if (count == capacity)
  {
    if (oldest + 1 < capacity) {
      int capacity = 0;
    }
    self->_int oldest = oldest + 1 - capacity;
    if (self->_ascending)
    {
      if (self->_enforceAscending)
      {
        uint64_t v10 = &self->_times[oldest];
        long long v11 = *(_OWORD *)&v10->var0;
        time1.epoch = v10->var3;
        *(_OWORD *)&time1.value = v11;
        CMTime v15 = *(CMTime *)a4;
        if (CMTimeCompare(&time1, &v15) >= 1)
        {
          int v12 = self->_oldest;
          if (!v12) {
            int v12 = self->_capacity;
          }
          self->_int oldest = v12 - 1;
          return;
        }
      }
      CMTime time1 = (CMTime)*a4;
      -[BWObjectRingBuffer _checkAscendingInsertAt:object:forTime:]((uint64_t)self, oldest, (uint64_t)a3, &time1);
    }
  }
  else
  {
    int oldest = (oldest + count) % capacity;
    if (count >= 1 && self->_ascending)
    {
      CMTime time1 = *(CMTime *)a4;
      -[BWObjectRingBuffer _checkAscendingInsertAt:object:forTime:]((uint64_t)self, oldest, (uint64_t)a3, &time1);
      int count = self->_count;
    }
    self->_int count = count + 1;
  }
  if (self->_enforceAscending && !self->_ascending && self->_count >= 2)
  {
    CMTime time1 = (CMTime)*a4;
    int oldest = -[BWObjectRingBuffer _permuteBufferForNewObjectAtTime:]((uint64_t)self, &time1);
    self->_ascending = 1;
  }
  self->_objects[oldest] = a3;
  v13 = &self->_times[oldest];
  int64_t var3 = a4->var3;
  *(_OWORD *)&v13->var0 = *(_OWORD *)&a4->var0;
  v13->int64_t var3 = var3;
}

- (uint64_t)_permuteBufferForNewObjectAtTime:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  int v4 = *(_DWORD *)(a1 + 24);
  int v5 = (*(_DWORD *)(a1 + 32) + *(_DWORD *)(a1 + 28) - 1) % v4;
  if (v5) {
    int v6 = (*(_DWORD *)(a1 + 32) + *(_DWORD *)(a1 + 28) - 1) % v4;
  }
  else {
    int v6 = *(_DWORD *)(a1 + 24);
  }
  uint64_t v7 = (v6 - 1);
  do
  {
    uint64_t v8 = v7;
    *(void *)(*(void *)(a1 + 8) + 8 * v5) = *(void *)(*(void *)(a1 + 8) + 8 * (int)v7);
    uint64_t v9 = *(void *)(a1 + 16);
    uint64_t v10 = v9 + 24 * v5;
    long long v11 = (long long *)(v9 + 24 * (int)v7);
    long long v12 = *v11;
    *(void *)(v10 + 16) = *((void *)v11 + 2);
    *(_OWORD *)uint64_t v10 = v12;
    int v13 = v7;
    if (!v7) {
      int v13 = *(_DWORD *)(a1 + 24);
    }
    int v14 = *(_DWORD *)(a1 + 32);
    int v15 = v7;
    if ((int)v7 < v14) {
      int v15 = *(_DWORD *)(a1 + 24) + v7;
    }
    if (v15 <= v14) {
      break;
    }
    uint64_t v7 = (v13 - 1);
    uint64_t v16 = *(void *)(a1 + 16) + 24 * (int)v7;
    long long v17 = *(_OWORD *)v16;
    time1.epoch = *(void *)(v16 + 16);
    *(_OWORD *)&time1.value = v17;
    CMTime v20 = *a2;
    int32_t v18 = CMTimeCompare(&time1, &v20);
    int v5 = v8;
  }
  while (v18 > 0);
  return v8;
}

- (int)_findClosestOffsetToTimestamp:(id *)a3
{
  if (!self->_count)
  {
    uint64_t v5 = *MEMORY[0x1E4F1C4A8];
    CMTime time = *(CMTime *)a3;
    [MEMORY[0x1E4F1CA00] raise:v5, @"searching for %.4f, empty ring buffer", CMTimeGetSeconds(&time) format];
  }
  if (self->_ascending)
  {
    int count = self->_count;
    int v7 = 0;
    int v8 = count - 1;
    if (count >= 1)
    {
      int v9 = count - 1;
      while (1)
      {
        int v10 = v9 - v7;
        if (v9 < v7) {
          ++v10;
        }
        int v11 = v7 + (v10 >> 1);
        long long v12 = &self->_times[(self->_oldest + v11) % self->_capacity];
        long long v13 = *(_OWORD *)&v12->var0;
        time.epoch = v12->var3;
        *(_OWORD *)&time.value = v13;
        CMTime time2 = (CMTime)*a3;
        int32_t v14 = CMTimeCompare(&time, &time2);
        switch(v14)
        {
          case -1:
            if (v11 == v8) {
              return v8;
            }
            int v7 = v11 + 1;
            break;
          case 1:
            if (!v11) {
              return v11;
            }
            int v9 = v11 - 1;
            break;
          case 0:
            return v11;
        }
        if (v7 > v9) {
          goto LABEL_30;
        }
      }
    }
    int v9 = count - 1;
LABEL_30:
    int oldest = self->_oldest;
    int capacity = self->_capacity;
    int v28 = (oldest + v9) % capacity;
    memset(&time, 0, sizeof(time));
    v29 = &self->_times[(oldest + v7) % capacity];
    CMTime time2 = (CMTime)*a3;
    long long v30 = *(_OWORD *)&v29->var0;
    rhs.epoch = v29->var3;
    *(_OWORD *)&rhs.value = v30;
    CMTimeSubtract(&v40, &time2, &rhs);
    CMTimeAbsoluteValue(&time, &v40);
    memset(&time2, 0, sizeof(time2));
    v31 = &self->_times[v28];
    CMTime rhs = (CMTime)*a3;
    long long v32 = *(_OWORD *)&v31->var0;
    v37.epoch = v31->var3;
    *(_OWORD *)&v37.value = v32;
    CMTimeSubtract(&v38, &rhs, &v37);
    CMTimeAbsoluteValue(&time2, &v38);
    CMTime rhs = time;
    CMTime v37 = time2;
    if (CMTimeCompare(&rhs, &v37) >= 1) {
      return v9;
    }
    else {
      return v7;
    }
  }
  else
  {
    int v15 = self->_oldest % self->_capacity;
    memset(&time, 0, sizeof(time));
    uint64_t v16 = &self->_times[v15];
    long long v17 = *(_OWORD *)&v16->var0;
    time2.epoch = v16->var3;
    *(_OWORD *)&time2.value = v17;
    CMTime rhs = (CMTime)*a3;
    CMTimeSubtract(&v36, &time2, &rhs);
    CMTimeAbsoluteValue(&time, &v36);
    int v18 = self->_capacity;
    int v19 = (self->_count + self->_oldest) % v18;
    if (v15 + 1 >= v18) {
      int v20 = self->_capacity;
    }
    else {
      int v20 = 0;
    }
    int v21 = v15 + 1 - v20;
    if (v21 != v19)
    {
      v22 = (CMTime *)MEMORY[0x1E4F1FA48];
      while (1)
      {
        memset(&time2, 0, sizeof(time2));
        v23 = &self->_times[v21];
        long long v24 = *(_OWORD *)&v23->var0;
        rhs.epoch = v23->var3;
        *(_OWORD *)&rhs.value = v24;
        CMTime v37 = (CMTime)*a3;
        CMTimeSubtract(&v35, &rhs, &v37);
        CMTimeAbsoluteValue(&time2, &v35);
        CMTime rhs = time2;
        CMTime v37 = time;
        if (CMTimeCompare(&rhs, &v37) < 0)
        {
          CMTime time = time2;
          CMTime rhs = time2;
          CMTime v37 = *v22;
          int v15 = v21;
          if (!CMTimeCompare(&rhs, &v37)) {
            break;
          }
        }
        int v25 = self->_capacity;
        if (v21 + 1 < v25) {
          int v25 = 0;
        }
        int v21 = v21 + 1 - v25;
        if (v21 == v19) {
          goto LABEL_35;
        }
      }
      int v15 = v21;
    }
LABEL_35:
    int v33 = self->_oldest;
    if (v15 < v33) {
      v15 += self->_capacity;
    }
    return v15 - v33;
  }
}

- (id)firstObject
{
  if (self->_count) {
    return self->_objects[self->_oldest];
  }
  else {
    return 0;
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)firstTime
{
  if (HIDWORD(self[1].var0)) {
    unsigned int v3 = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)(self->var3 + 24 * self[1].var1);
  }
  else {
    unsigned int v3 = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)MEMORY[0x1E4F1F9F8];
  }
  *retstr = *v3;
  return self;
}

- (id)lastObject
{
  int count = self->_count;
  if (count) {
    return self->_objects[(count + self->_oldest - 1) % self->_capacity];
  }
  else {
    return 0;
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastTime
{
  int var0_high = HIDWORD(self[1].var0);
  if (var0_high) {
    int v4 = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)(self->var3
  }
                                             + 24 * ((var0_high + self[1].var1 - 1) % SLODWORD(self[1].var0)));
  else {
    int v4 = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)MEMORY[0x1E4F1F9F8];
  }
  *retstr = *v4;
  return self;
}

- (void)enumerateObjectsStartingAt:(id *)a3 usingBlock:(id)a4
{
  if (self->_count)
  {
    CMTime time1 = *(CMTime *)a3;
    int v6 = [(BWObjectRingBuffer *)self _findClosestOffsetToTimestamp:&time1];
    int v7 = &self->_times[(self->_oldest + v6) % self->_capacity];
    long long v8 = *(_OWORD *)&v7->var0;
    time1.epoch = v7->var3;
    *(_OWORD *)&time1.value = v8;
    CMTime v9 = *(CMTime *)a3;
    if ((signed int)(v6 + (CMTimeCompare(&time1, &v9) >> 31)) < self->_count) {
      -[BWObjectRingBuffer _enumerateObjectsStartingAtOffset:usingBlock:](self, "_enumerateObjectsStartingAtOffset:usingBlock:");
    }
  }
}

- (void)reverseEnumerateObjectsStartingAt:(id *)a3 usingBlock:(id)a4
{
  if (self->_count)
  {
    CMTime time1 = *(CMTime *)a3;
    int v7 = [(BWObjectRingBuffer *)self _findClosestOffsetToTimestamp:&time1];
    long long v8 = &self->_times[(self->_oldest + v7) % self->_capacity];
    long long v9 = *(_OWORD *)&v8->var0;
    time1.epoch = v8->var3;
    *(_OWORD *)&time1.value = v9;
    CMTime v11 = *(CMTime *)a3;
    BOOL v10 = CMTimeCompare(&time1, &v11) > 0;
    if (v7 - v10 >= 0) {
      [(BWObjectRingBuffer *)self _reverseEnumerateObjectsStartingAtOffset:(v7 - v10) usingBlock:a4];
    }
  }
}

- (void)_reverseEnumerateObjectsStartingAtOffset:(int)a3 usingBlock:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  if (a3 < 0)
  {
    if (a3 == -1) {
      return;
    }
    uint64_t count = self->_count;
  }
  else
  {
    uint64_t count = self->_count;
    if ((int)count > a3) {
      goto LABEL_7;
    }
  }
  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C4A8], @"Invalid start %d for ring buffer of count %d", *(void *)&a3, count);
LABEL_7:
  char v18 = 0;
  int oldest = self->_oldest;
  int v9 = (oldest + (int)v5) % self->_capacity;
  if (oldest) {
    int capacity = self->_oldest;
  }
  else {
    int capacity = self->_capacity;
  }
  do
  {
    id v11 = self->_objects[v9];
    long long v12 = &self->_times[v9];
    long long v13 = (void (*)(id, id, long long *, uint64_t, char *))*((void *)a4 + 2);
    long long v14 = *(_OWORD *)&v12->var0;
    int64_t var3 = v12->var3;
    long long v16 = v14;
    v13(a4, v11, &v16, v5, &v18);
    if (v18) {
      break;
    }
    if (!v9) {
      int v9 = self->_capacity;
    }
    uint64_t v5 = (v5 - 1);
  }
  while (v9-- != capacity);
}

- (void)extractTimeRangeFrom:(id *)a3 until:(id *)a4 into:(id)a5 times:(id)a6
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__BWObjectRingBuffer_extractTimeRangeFrom_until_into_times___block_invoke;
  v7[3] = &unk_1E5C29810;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a4;
  v7[4] = a5;
  v7[5] = a6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a3;
  [(BWObjectRingBuffer *)self enumerateObjectsStartingAt:&v6 usingBlock:v7];
}

uint64_t __60__BWObjectRingBuffer_extractTimeRangeFrom_until_into_times___block_invoke(uint64_t a1, uint64_t a2, CMTime *a3, uint64_t a4, unsigned char *a5)
{
  CMTime time1 = *a3;
  CMTime v11 = *(CMTime *)(a1 + 48);
  uint64_t result = CMTimeCompare(&time1, &v11);
  if ((result & 0x80000000) != 0)
  {
    uint64_t result = *(void *)(a1 + 32);
    if (result) {
      uint64_t result = [(id)result addObject:a2];
    }
    BOOL v10 = *(void **)(a1 + 40);
    if (v10) {
      return objc_msgSend(v10, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithBytes:objCType:", a3, "{?=qiIq}"));
    }
  }
  else
  {
    *a5 = 1;
  }
  return result;
}

- (void)clear
{
  self->_uint64_t count = 0;
  self->_int oldest = 0;
  self->_ascending = 1;
}

uint64_t __27__BWObjectRingBuffer_clear__block_invoke(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F41817F8](a1, a2);
}

- (void)flushEntriesEarlierThan:(id *)a3
{
  int count = self->_count;
  if (count)
  {
    int oldest = self->_oldest;
    int v7 = (oldest + count) % self->_capacity;
    while (1)
    {
      $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = &self->_times[oldest];
      long long v9 = *(_OWORD *)&v8->var0;
      time1.epoch = v8->var3;
      *(_OWORD *)&time1.value = v9;
      $3CC8671D27C23BF42ADDB32F2B5E48AE v13 = *a3;
      if ((CMTimeCompare(&time1, (CMTime *)&v13) & 0x80000000) == 0) {
        break;
      }

      int capacity = self->_capacity;
      int v11 = self->_count;
      if (oldest + 1 < capacity) {
        int capacity = 0;
      }
      int oldest = oldest + 1 - capacity;
      int v12 = v11 - 1;
      self->_int count = v11 - 1;
      self->_int oldest = oldest;
      if (oldest == v7) {
        goto LABEL_9;
      }
    }
    int v12 = self->_count;
LABEL_9:
    if (v12 <= 1)
    {
      self->_ascending = 1;
      if (!v12) {
        self->_int oldest = 0;
      }
    }
  }
}

- (id)description
{
  unsigned int v3 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"BWObjectRingBuffer %p holding %d of %d entries:\n", self, self->_count, self->_capacity);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__BWObjectRingBuffer_description__block_invoke;
  v5[3] = &unk_1E5C29858;
  v5[4] = v3;
  [(BWObjectRingBuffer *)self _enumerateObjectsStartingAtOffset:0 usingBlock:v5];
  return v3;
}

uint64_t __33__BWObjectRingBuffer_description__block_invoke(uint64_t a1, uint64_t a2, CMTime *a3, uint64_t a4)
{
  int v4 = *(void **)(a1 + 32);
  CMTime time = *a3;
  return objc_msgSend(v4, "appendFormat:", @"#%d: %.4f %p\n", a4, CMTimeGetSeconds(&time), a2);
}

- (int)count
{
  return self->_count;
}

- (BOOL)ascending
{
  return self->_ascending;
}

- (BOOL)expectAscending
{
  return self->_expectAscending;
}

@end