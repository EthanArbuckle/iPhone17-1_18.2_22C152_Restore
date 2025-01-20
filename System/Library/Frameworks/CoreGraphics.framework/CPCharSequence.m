@interface CPCharSequence
- (BOOL)map:(void *)a3 passing:(void *)a4;
- (BOOL)map:(void *)a3 whereNeighborsWith:(id)a4 passing:(void *)a5;
- (BOOL)mapToPairs:(void *)a3 passing:(void *)a4;
- (BOOL)mapToPairsWithIndex:(void *)a3 passing:(void *)a4;
- (BOOL)mapWithIndex:(void *)a3 from:(unsigned int)a4 length:(unsigned int)a5 passing:(void *)a6;
- (BOOL)mapWithIndex:(void *)a3 passing:(void *)a4;
- (BOOL)removeSubsequences:(id)a3 whereTrue:(void *)a4 passing:(void *)a5;
- (BOOL)removeToSubsequence:(id)a3 ifTrue:(void *)a4 passing:(void *)a5;
- (BOOL)wasMerged;
- (CGRect)bounds;
- (CGRect)boundsFrom:(unsigned int)a3 length:(unsigned int)a4;
- (CGRect)normalizedBounds;
- (CPCharSequence)initWithChars:(CPPDFChar *)a3 length:(unsigned int)a4;
- (CPCharSequence)initWithSizeFor:(unsigned int)a3;
- (CPPDFChar)charArray;
- (CPPDFChar)charAtIndex:(unsigned int)a3;
- (double)averageRotation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initSuper;
- (id)newSubsequenceFrom:(unsigned int)a3 length:(unsigned int)a4;
- (unsigned)length;
- (void)addChar:(CPPDFChar *)a3;
- (void)addChars:(CPPDFChar *)a3 length:(unsigned int)a4;
- (void)addChars:(CPPDFChar *)a3 length:(unsigned int)a4 ifTrue:(void *)a5 passing:(void *)a6;
- (void)addCharsFromSequence:(id)a3;
- (void)copyToSubsequence:(id)a3 from:(unsigned int)a4 length:(unsigned int)a5;
- (void)copyToSubsequence:(id)a3 ifTrue:(void *)a4 passing:(void *)a5;
- (void)dealloc;
- (void)dispose;
- (void)finalize;
- (void)merge:(id)a3 by:(void *)a4;
- (void)mergeByAnchorXIncreasingYDecreasing:(id)a3;
- (void)mergeByAnchorYDecreasingXIncreasing:(id)a3;
- (void)removeAllChars;
- (void)removeChar;
- (void)removeCharAtIndex:(unsigned int)a3;
- (void)removeFrom:(unsigned int)a3;
- (void)replaceCharAtIndex:(unsigned int)a3 withChar:(CPPDFChar *)a4;
- (void)resize:(unsigned int)a3;
- (void)sortBy:(void *)a3;
- (void)sortByAnchorXIncreasingYDecreasing;
- (void)sortByAnchorYDecreasingXIncreasing;
- (void)sortByAnchorYDecreasingXIncreasingApprox;
- (void)splitToSubsequences:(id)a3 whereTrue:(void *)a4 passing:(void *)a5;
@end

@implementation CPCharSequence

- (double)averageRotation
{
  int v3 = [(CPCharSequence *)self length];
  if (v3 < 1)
  {
    double v6 = 0.0;
    double v5 = 0.0;
  }
  else
  {
    uint64_t v4 = 0;
    double v5 = 0.0;
    double v6 = 0.0;
    do
    {
      __double2 v7 = __sincos_stret((double)[(CPCharSequence *)self charAtIndex:v4][168] * 0.0174532925);
      double v6 = v6 + v7.__cosval;
      double v5 = v5 + v7.__sinval;
      uint64_t v4 = (v4 + 1);
    }
    while (v3 != v4);
  }

  return atan2(v5 / (double)v3, v6 / (double)v3);
}

- (CGRect)normalizedBounds
{
  if (self->length)
  {
    uint64_t v3 = 0;
    CGFloat width = 0.0;
    CGFloat x = INFINITY;
    CGFloat y = INFINITY;
    CGFloat height = 0.0;
    do
    {
      CGRect v15 = (CGRect)[(CPCharSequence *)self charAtIndex:v3][112];
      v12.origin.CGFloat x = x;
      v12.origin.CGFloat y = y;
      v12.size.CGFloat width = width;
      v12.size.CGFloat height = height;
      CGRect v13 = CGRectUnion(v12, v15);
      CGFloat x = v13.origin.x;
      CGFloat y = v13.origin.y;
      CGFloat width = v13.size.width;
      CGFloat height = v13.size.height;
      uint64_t v3 = (v3 + 1);
    }
    while (v3 < self->length);
  }
  else
  {
    CGFloat height = 0.0;
    CGFloat y = INFINITY;
    CGFloat width = 0.0;
    CGFloat x = INFINITY;
  }
  double v8 = x;
  double v9 = y;
  double v10 = width;
  double v11 = height;
  result.size.CGFloat height = v11;
  result.size.CGFloat width = v10;
  result.origin.CGFloat y = v9;
  result.origin.CGFloat x = v8;
  return result;
}

- (CGRect)boundsFrom:(unsigned int)a3 length:(unsigned int)a4
{
  if (a4 + a3 > self->length) {
    __assert_rtn("-[CPCharSequence boundsFrom:length:]", "CPCharSequence.m", 776, "startIndex + numChars <= length");
  }
  if (a4)
  {
    uint64_t v4 = (float64x2_t **)&self->charArray[a3];
    float64x2_t v5 = **v4;
    float64x2_t v6 = vaddq_f64(v5, (*v4)[1]);
    if (a4 != 1)
    {
      __double2 v7 = &v4[a4];
      double v8 = v4 + 1;
      do
      {
        double v9 = *v8++;
        float64x2_t v10 = vaddq_f64(*v9, v9[1]);
        float64x2_t v5 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v5, *v9), *(int8x16_t *)v9, (int8x16_t)v5);
        float64x2_t v6 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v10, v6), (int8x16_t)v10, (int8x16_t)v6);
      }
      while (v8 < v7);
    }
    float64x2_t v11 = vsubq_f64(v6, v5);
  }
  else
  {
    float64x2_t v5 = (float64x2_t)vdupq_n_s64(0x7FF0000000000000uLL);
    float64x2_t v11 = 0uLL;
  }
  double v12 = v5.f64[1];
  double v13 = v11.f64[1];
  result.size.CGFloat width = v11.f64[0];
  result.origin.CGFloat x = v5.f64[0];
  result.size.CGFloat height = v13;
  result.origin.CGFloat y = v12;
  return result;
}

- (CGRect)bounds
{
  [(CPCharSequence *)self boundsFrom:0 length:self->length];
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (BOOL)map:(void *)a3 whereNeighborsWith:(id)a4 passing:(void *)a5
{
  unint64_t v5 = *((unsigned int *)a4 + 2);
  unint64_t length = self->length;
  if (length) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7) {
    goto LABEL_24;
  }
  charArraCGFloat y = (uint64_t *)self->charArray;
  float64x2_t v11 = (uint64_t *)*((void *)a4 + 2);
  int v12 = compareAnchorXIncreasingYDecreasing(charArray, v11);
  int v13 = v12;
  v14 = &charArray[v12 < 1];
  CGRect v15 = &v11[v12 > 0];
  if ((v12 < 1) < length && (v12 > 0) < v5)
  {
    v18 = &charArray[length];
    v19 = &v11[v5];
    while (1)
    {
      int v17 = compareAnchorXIncreasingYDecreasing(v14, v15);
      if (v17 < 1)
      {
        if (v13 >= 1)
        {
          int v20 = ((uint64_t (*)(uint64_t, void, void *))a3)(*v14, *(v15 - 1), a5);
          if (!v20) {
            return v20;
          }
        }
        ++v14;
      }
      else
      {
        if (v13 <= 0)
        {
          int v20 = ((uint64_t (*)(void, uint64_t, void *))a3)(*(v14 - 1), *v15, a5);
          if (!v20) {
            return v20;
          }
        }
        ++v15;
      }
      if (v14 < v18)
      {
        int v13 = v17;
        if (v15 < v19) {
          continue;
        }
      }
      goto LABEL_20;
    }
  }
  int v17 = v12;
LABEL_20:
  if (v17 > 0)
  {
    int v20 = ((uint64_t (*)(uint64_t, void, void *))a3)(*v14, *(v15 - 1), a5);
    if (!v20) {
      return v20;
    }
LABEL_24:
    LOBYTE(v20) = 1;
    return v20;
  }
  if (((uint64_t (*)(void, uint64_t, void *))a3)(*(v14 - 1), *v15, a5)) {
    goto LABEL_24;
  }
  LOBYTE(v20) = 0;
  return v20;
}

- (BOOL)mapToPairsWithIndex:(void *)a3 passing:(void *)a4
{
  uint64_t length = self->length;
  if (length >= 2)
  {
    uint64_t v8 = 0;
    charArraCGFloat y = self->charArray;
    float64x2_t v10 = &charArray[length];
    float64x2_t v11 = charArray + 2;
    do
    {
      int v5 = ((uint64_t (*)(uint64_t, void, void, void *))a3)(v8, *(v11 - 2), *(v11 - 1), a4);
      uint64_t v8 = (v8 + 1);
      if (v5) {
        BOOL v12 = v11 >= v10;
      }
      else {
        BOOL v12 = 1;
      }
      ++v11;
    }
    while (!v12);
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)mapToPairs:(void *)a3 passing:(void *)a4
{
  uint64_t length = self->length;
  if (length >= 2)
  {
    charArraCGFloat y = self->charArray;
    double v9 = &charArray[length];
    float64x2_t v10 = charArray + 2;
    do
    {
      int v5 = ((uint64_t (*)(void, void, void *))a3)(*(v10 - 2), *(v10 - 1), a4);
      if (v5) {
        BOOL v11 = v10 >= v9;
      }
      else {
        BOOL v11 = 1;
      }
      ++v10;
    }
    while (!v11);
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)mapWithIndex:(void *)a3 from:(unsigned int)a4 length:(unsigned int)a5 passing:(void *)a6
{
  unsigned int v6 = a5 + a4;
  if (a5 + a4 > self->length) {
    __assert_rtn("-[CPCharSequence mapWithIndex:from:length:passing:]", "CPCharSequence.m", 673, "pastEndIndex <= length");
  }
  LODWORD(v7) = a4;
  if (v6 <= a4)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    charArraCGFloat y = self->charArray;
    int v12 = ((uint64_t (*)(void, CPPDFChar *, void *))a3)(*(void *)&a4, charArray[a4], a6);
    if (v12)
    {
      int v13 = &charArray[v7 + 1];
      unsigned int v14 = a5 - 1;
      while (v14)
      {
        uint64_t v7 = (v7 + 1);
        uint64_t v15 = (uint64_t)*v13++;
        --v14;
        if (!((unsigned int (*)(uint64_t, uint64_t, void *))a3)(v7, v15, a6)) {
          goto LABEL_10;
        }
      }
      LODWORD(v7) = v6;
LABEL_10:
      LOBYTE(v12) = v7 >= v6;
    }
  }
  return v12;
}

- (BOOL)mapWithIndex:(void *)a3 passing:(void *)a4
{
  if (self->length)
  {
    uint64_t v7 = 0;
    charArraCGFloat y = self->charArray;
    do
    {
      int v9 = ((uint64_t (*)(uint64_t, CPPDFChar *, void *))a3)(v7, charArray[v7], a4);
      if (!v9) {
        break;
      }
      ++v7;
    }
    while (v7 < self->length);
  }
  else
  {
    LOBYTE(v9) = 1;
  }
  return v9;
}

- (BOOL)map:(void *)a3 passing:(void *)a4
{
  uint64_t length = self->length;
  if (length)
  {
    charArraCGFloat y = self->charArray;
    uint64_t v8 = &charArray[length];
    int v9 = charArray + 1;
    do
    {
      int v10 = ((uint64_t (*)(void, void *))a3)(*(v9 - 1), a4);
      if (v10) {
        BOOL v11 = v9 >= v8;
      }
      else {
        BOOL v11 = 1;
      }
      ++v9;
    }
    while (!v11);
  }
  else
  {
    LOBYTE(v10) = 1;
  }
  return v10;
}

- (BOOL)removeToSubsequence:(id)a3 ifTrue:(void *)a4 passing:(void *)a5
{
  if (!self->charArray) {
    return 0;
  }
  if (self->length)
  {
    uint64_t v9 = 0;
    unsigned int v10 = 0;
    while (1)
    {
      BOOL v11 = self->charArray[v9];
      if (((unsigned int (*)(CPPDFChar *, void *))a4)(v11, a5))
      {
        unsigned int v12 = *((_DWORD *)a3 + 2);
        if (v12 >= *((_DWORD *)a3 + 7))
        {
          [a3 resize:v12 + 1];
          uint64_t v13 = *((void *)a3 + 2);
          if (!v13) {
            goto LABEL_17;
          }
          unsigned int v12 = *((_DWORD *)a3 + 2);
        }
        else
        {
          uint64_t v13 = *((void *)a3 + 2);
        }
        *(void *)(v13 + 8 * v12) = v11;
        *((_DWORD *)a3 + 2) = v12 + 1;
        if (self->sharedMemory)
        {
          if (v9 + 1 < (unint64_t)self->length)
          {
            -[CPCharSequence resize:](self, "resize:");
            if (!self->charArray) {
              goto LABEL_17;
            }
          }
        }
      }
      else
      {
        self->charArray[v10++] = v11;
      }
      if (++v9 >= (unint64_t)self->length) {
        goto LABEL_17;
      }
    }
  }
  unsigned int v10 = 0;
  LODWORD(v9) = 0;
LABEL_17:
  self->uint64_t length = v10;
  return v10 < v9;
}

- (void)copyToSubsequence:(id)a3 ifTrue:(void *)a4 passing:(void *)a5
{
  uint64_t length = self->length;
  if (length)
  {
    charArraCGFloat y = self->charArray;
    unsigned int v10 = &charArray[length];
    do
    {
      if (((unsigned int (*)(CPPDFChar *, void *))a4)(*charArray, a5))
      {
        unsigned int v11 = *((_DWORD *)a3 + 2);
        if (v11 >= *((_DWORD *)a3 + 7))
        {
          [a3 resize:v11 + 1];
          uint64_t v12 = *((void *)a3 + 2);
          if (!v12) {
            return;
          }
          unsigned int v11 = *((_DWORD *)a3 + 2);
        }
        else
        {
          uint64_t v12 = *((void *)a3 + 2);
        }
        *(void *)(v12 + 8 * v11) = *charArray;
        *((_DWORD *)a3 + 2) = v11 + 1;
      }
      ++charArray;
    }
    while (charArray < v10);
  }
}

- (void)copyToSubsequence:(id)a3 from:(unsigned int)a4 length:(unsigned int)a5
{
  if (a5 + a4 > self->length) {
    __assert_rtn("-[CPCharSequence copyToSubsequence:from:length:]", "CPCharSequence.m", 578, "startIndex + numChars <= length");
  }
  if (a5 && self->charArray)
  {
    unsigned int v9 = *((_DWORD *)a3 + 2) + a5;
    [a3 resize:v9];
    uint64_t v10 = *((void *)a3 + 2);
    if (v10)
    {
      memcpy((void *)(v10 + 8 * *((unsigned int *)a3 + 2)), &self->charArray[a4], 8 * a5);
      *((_DWORD *)a3 + 2) = v9;
    }
  }
}

- (BOOL)removeSubsequences:(id)a3 whereTrue:(void *)a4 passing:(void *)a5
{
  BOOL result = 0;
  unsigned int length = self->length;
  if (length)
  {
    if (length != 1)
    {
      uint64_t v11 = 0;
      char v12 = 0;
      charArraCGFloat y = self->charArray;
      uint64_t v14 = 1;
      do
      {
        ++charArray;
        while (1)
        {
          uint64_t v15 = v14;
          int v16 = ((uint64_t (*)(void, CPPDFChar *, void *))a4)(*(charArray - 1), *charArray, a5);
          if (!v16 || (v12 & 1) == 0) {
            break;
          }
          id v17 = [(CPCharSequence *)self newSubsequenceFrom:v11 length:(v15 - v11)];
          [a3 addObject:v17];

          uint64_t v14 = (v15 + 1);
          ++charArray;
          char v12 = 1;
          uint64_t v11 = v15;
          if (v14 >= self->length)
          {
            uint64_t v11 = v15;
            goto LABEL_17;
          }
        }
        if (v16) {
          unsigned int length = v15;
        }
        v12 |= v16;
        if (v16) {
          uint64_t v11 = v15;
        }
        else {
          uint64_t v11 = v11;
        }
        uint64_t v14 = (v15 + 1);
      }
      while (v14 < self->length);
      if ((v12 & 1) == 0)
      {
        BOOL result = 0;
        goto LABEL_18;
      }
LABEL_17:
      id v18 = [(CPCharSequence *)self newSubsequenceFrom:v11 length:(v14 - v11)];
      [a3 addObject:v18];

      BOOL result = 1;
    }
LABEL_18:
    self->unsigned int length = length;
  }
  return result;
}

- (void)splitToSubsequences:(id)a3 whereTrue:(void *)a4 passing:(void *)a5
{
  unsigned int length = self->length;
  if (length)
  {
    if (length == 1)
    {
      uint64_t v8 = 0;
    }
    else
    {
      uint64_t v11 = 0;
      uint64_t v8 = 0;
      charArraCGFloat y = self->charArray;
      do
      {
        int v13 = v11 + 1;
        if (((unsigned int (*)(CPPDFChar *, CPPDFChar *, void *))a4)(charArray[v11], charArray[v11 + 1], a5))
        {
          id v14 = [(CPCharSequence *)self newSubsequenceFrom:v8 length:(v11 - v8 + 1)];
          [a3 addObject:v14];

          uint64_t v8 = v11 + 1;
        }
        unsigned int v15 = v11++ + 2;
      }
      while (v15 < self->length);
      unsigned int length = v13 + 1;
    }
    id v16 = -[CPCharSequence newSubsequenceFrom:length:](self, "newSubsequenceFrom:length:", v8, length - v8, a5);
    [a3 addObject:v16];
  }
}

- (id)newSubsequenceFrom:(unsigned int)a3 length:(unsigned int)a4
{
  if (a4 + a3 > self->length) {
    __assert_rtn("-[CPCharSequence newSubsequenceFrom:length:]", "CPCharSequence.m", 493, "startIndex + newLength <= length");
  }
  uint64_t v7 = [[CPCharSequence alloc] initWithSizeFor:0];
  uint64_t v8 = v7;
  if (a4 && v7)
  {
    if (!self->sharedMemory)
    {
      unsigned int v9 = [[CPMemoryOwner alloc] initWithAllocatedMemory:self->charArray];
      *(void *)&self->previousSize = 0;
      self->sharedMemorCGFloat y = v9;
    }
    v8->unsigned int length = a4;
    v8->charArraCGFloat y = &self->charArray[a3];
    v8->sharedMemorCGFloat y = self->sharedMemory;
    v8->wasMerged = self->wasMerged;
  }
  return v8;
}

- (BOOL)wasMerged
{
  return self->wasMerged;
}

- (void)merge:(id)a3 by:(void *)a4
{
  uint64_t v4 = *((unsigned int *)a3 + 2);
  if (v4)
  {
    unsigned int v8 = self->length + v4;
    [(CPCharSequence *)self resize:v8];
    charArraCGFloat y = self->charArray;
    if (charArray)
    {
      uint64_t v10 = (char *)*((void *)a3 + 2);
      if (v10)
      {
        uint64_t length = self->length;
        char v12 = &v10[8 * v4];
        if (!length) {
          goto LABEL_17;
        }
        int v13 = &charArray[length];
        id v14 = &charArray[v8 - 1];
        do
        {
          int v15 = ((uint64_t (*)(CPPDFChar **, char *))a4)(v13 - 1, v12 - 8);
          if (v15 <= 0) {
            id v16 = (CPPDFChar **)v12;
          }
          else {
            id v16 = v13;
          }
          if (v15 <= 0) {
            v12 -= 8;
          }
          else {
            --v13;
          }
          *v14-- = *(v16 - 1);
          charArraCGFloat y = self->charArray;
        }
        while (v13 > charArray && v12 > v10);
        if (v12 > v10) {
LABEL_17:
        }
          memcpy(charArray, v10, (v12 - v10) & 0x7FFFFFFF8);
        self->uint64_t length = v8;
        self->wasMerged = 1;
      }
    }
  }
}

- (void)mergeByAnchorXIncreasingYDecreasing:(id)a3
{
}

- (void)mergeByAnchorYDecreasingXIncreasing:(id)a3
{
}

- (void)sortBy:(void *)a3
{
  if (self->sharedMemory) {
    [(CPCharSequence *)self resize:self->length];
  }
  charArraCGFloat y = self->charArray;
  size_t length = self->length;

  qsort(charArray, length, 8uLL, (int (__cdecl *)(const void *, const void *))a3);
}

- (void)sortByAnchorXIncreasingYDecreasing
{
}

- (void)sortByAnchorYDecreasingXIncreasingApprox
{
}

- (void)sortByAnchorYDecreasingXIncreasing
{
}

- (void)removeFrom:(unsigned int)a3
{
  if (self->length <= a3) {
    __assert_rtn("-[CPCharSequence removeFrom:]", "CPCharSequence.m", 399, "length > startIndex");
  }
  if (a3)
  {
    self->size_t length = a3;
  }
  else
  {
    [(CPCharSequence *)self removeAllChars];
  }
}

- (void)removeCharAtIndex:(unsigned int)a3
{
  unsigned int length = self->length;
  if (length <= a3) {
    __assert_rtn("-[CPCharSequence removeCharAtIndex:]", "CPCharSequence.m", 382, "index < length");
  }
  if (a3 + 1 < length)
  {
    if (self->sharedMemory)
    {
      -[CPCharSequence resize:](self, "resize:");
      unsigned int length = self->length;
    }
    unsigned int v6 = &self->charArray[a3];
    memmove(v6, v6 + 1, 8 * (length + ~a3));
    unsigned int length = self->length;
  }
  self->unsigned int length = length - 1;
}

- (void)replaceCharAtIndex:(unsigned int)a3 withChar:(CPPDFChar *)a4
{
  if (self->length <= a3) {
    __assert_rtn("-[CPCharSequence replaceCharAtIndex:withChar:]", "CPCharSequence.m", 369, "index < length");
  }
  if (self->sharedMemory) {
    -[CPCharSequence resize:](self, "resize:");
  }
  charArraCGFloat y = self->charArray;
  if (charArray) {
    charArray[a3] = a4;
  }
}

- (void)removeAllChars
{
  self->unsigned int length = 0;
  sharedMemorCGFloat y = self->sharedMemory;
  if (sharedMemory)
  {

    self->sharedMemorCGFloat y = 0;
  }
  else
  {
    free(self->charArray);
    *(void *)&self->previousSize = 0;
  }
  self->charArraCGFloat y = 0;
}

- (void)removeChar
{
  unsigned int length = self->length;
  if (!length) {
    __assert_rtn("-[CPCharSequence removeChar]", "CPCharSequence.m", 346, "length > 0");
  }
  self->unsigned int length = length - 1;
}

- (void)addCharsFromSequence:(id)a3
{
  uint64_t v3 = *((unsigned int *)a3 + 2);
  if (v3)
  {
    unsigned int v6 = self->length + v3;
    [(CPCharSequence *)self resize:v6];
    charArraCGFloat y = self->charArray;
    if (charArray)
    {
      memcpy(&charArray[self->length], *((const void **)a3 + 2), 8 * v3);
      self->unsigned int length = v6;
    }
  }
}

- (void)addChars:(CPPDFChar *)a3 length:(unsigned int)a4 ifTrue:(void *)a5 passing:(void *)a6
{
  if (a4)
  {
    unsigned int v8 = a3;
    uint64_t v10 = 0;
    uint64_t v11 = &a3[a4];
    char v12 = &self->charArray[self->length];
    do
    {
      if (((unsigned int (*)(CPPDFChar *, void *))a5)(v8, a6))
      {
        unsigned int v13 = self->length + 1;
        self->unsigned int length = v13;
        if (v13 > self->size)
        {
          -[CPCharSequence resize:](self, "resize:");
          charArraCGFloat y = self->charArray;
          if (!charArray) {
            return;
          }
          char v12 = &charArray[v10];
        }
        *v12++ = v8;
        ++v10;
      }
      ++v8;
    }
    while (v8 < v11);
  }
}

- (void)addChars:(CPPDFChar *)a3 length:(unsigned int)a4
{
  unsigned int v7 = self->length + a4;
  [(CPCharSequence *)self resize:v7];
  charArraCGFloat y = self->charArray;
  if (charArray)
  {
    if (a4)
    {
      unsigned int v9 = &a3[a4];
      uint64_t v10 = &charArray[self->length];
      do
        *v10++ = a3++;
      while (a3 < v9);
    }
    self->unsigned int length = v7;
  }
}

- (void)addChar:(CPPDFChar *)a3
{
  unsigned int length = self->length;
  if (length >= self->size) {
    [(CPCharSequence *)self resize:length + 1];
  }
  charArraCGFloat y = self->charArray;
  if (charArray)
  {
    uint64_t v7 = self->length;
    charArray[v7] = a3;
    self->unsigned int length = v7 + 1;
  }
}

- (CPPDFChar)charArray
{
  return self->charArray;
}

- (CPPDFChar)charAtIndex:(unsigned int)a3
{
  if (self->length <= a3) {
    __assert_rtn("-[CPCharSequence charAtIndex:]", "CPCharSequence.m", 275, "index < length");
  }
  charArraCGFloat y = self->charArray;
  if (charArray) {
    return charArray[a3];
  }
  else {
    return 0;
  }
}

- (unsigned)length
{
  return self->length;
}

- (void)resize:(unsigned int)a3
{
  if (self->length <= a3) {
    unsigned int length = a3;
  }
  else {
    unsigned int length = self->length;
  }
  sharedMemorCGFloat y = self->sharedMemory;
  if (sharedMemory)
  {
    if (length)
    {
      unsigned int v6 = (CPPDFChar **)malloc_type_malloc(8 * length, 0x2004093837F09uLL);
      uint64_t v7 = v6;
      if (v6) {
        memcpy(v6, self->charArray, 8 * self->length);
      }
      self->charArraCGFloat y = v7;
      sharedMemorCGFloat y = self->sharedMemory;
    }
    else
    {
      self->charArraCGFloat y = 0;
    }
    self->previousSize = length;
    self->unsigned int size = length;

    self->sharedMemorCGFloat y = 0;
  }
  else
  {
    unsigned int size = self->size;
    if (length > size)
    {
      if (size)
      {
        unsigned int v9 = self->previousSize + size;
        if (length <= v9) {
          unsigned int v10 = v9;
        }
        else {
          unsigned int v10 = length;
        }
        uint64_t v11 = (CPPDFChar **)malloc_type_realloc(self->charArray, 8 * v10, 0x2004093837F09uLL);
        if (v11)
        {
          self->charArraCGFloat y = v11;
          self->previousSize = self->size;
          self->unsigned int size = v10;
        }
        else
        {
          self->charArraCGFloat y = 0;
          self->unsigned int size = 0;
          self->unsigned int length = 0;
        }
      }
      else
      {
        self->charArraCGFloat y = (CPPDFChar **)malloc_type_malloc(8 * length, 0x2004093837F09uLL);
        self->previousSize = length;
        self->unsigned int size = length;
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = CPCopyObject(self, a3);
  if (v4)
  {
    if (!self->sharedMemory)
    {
      int v5 = [[CPMemoryOwner alloc] initWithAllocatedMemory:self->charArray];
      *(void *)&self->previousSize = 0;
      self->sharedMemorCGFloat y = v5;
    }
    *(_DWORD *)(v4 + 8) = self->length;
    *(void *)(v4 + 16) = self->charArray;
    *(_DWORD *)(v4 + 28) = self->size;
    *(_DWORD *)(v4 + 24) = self->previousSize;
    *(void *)(v4 + 32) = self->sharedMemory;
    *(unsigned char *)(v4 + 40) = self->wasMerged;
  }
  return (id)v4;
}

- (void)dealloc
{
  sharedMemorCGFloat y = self->sharedMemory;
  if (sharedMemory) {

  }
  else {
    [(CPCharSequence *)self dispose];
  }
  v4.receiver = self;
  v4.super_class = (Class)CPCharSequence;
  [(CPCharSequence *)&v4 dealloc];
}

- (void)finalize
{
  [(CPCharSequence *)self dispose];
  v3.receiver = self;
  v3.super_class = (Class)CPCharSequence;
  [(CPCharSequence *)&v3 finalize];
}

- (void)dispose
{
  charArraCGFloat y = self->charArray;
  if (charArray)
  {
    if (!self->sharedMemory) {
      free(charArray);
    }
    self->charArraCGFloat y = 0;
  }
}

- (id)initSuper
{
  v3.receiver = self;
  v3.super_class = (Class)CPCharSequence;
  return [(CPCharSequence *)&v3 init];
}

- (CPCharSequence)initWithChars:(CPPDFChar *)a3 length:(unsigned int)a4
{
  BOOL result = [(CPCharSequence *)self initWithSizeFor:*(void *)&a4];
  if (result)
  {
    if (a4)
    {
      uint64_t v7 = &a3[a4];
      charArraCGFloat y = result->charArray;
      do
        *charArray++ = a3++;
      while (a3 < v7);
    }
    result->unsigned int length = a4;
  }
  return result;
}

- (CPCharSequence)initWithSizeFor:(unsigned int)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CPCharSequence;
  objc_super v4 = [(CPCharSequence *)&v7 init];
  int v5 = v4;
  if (a3 && v4)
  {
    v4->charArraCGFloat y = (CPPDFChar **)malloc_type_malloc(8 * a3, 0x2004093837F09uLL);
    v5->previousSize = a3;
    v5->unsigned int size = a3;
  }
  return v5;
}

@end