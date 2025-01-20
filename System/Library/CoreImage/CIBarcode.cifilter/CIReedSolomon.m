@interface CIReedSolomon
- ($B716781559FB179C01A6A83DB44EE660)addOrSubtractPoly:(id *)a3 with:(id *)a4;
- ($B716781559FB179C01A6A83DB44EE660)buildGenerator:(int)a3;
- ($B716781559FB179C01A6A83DB44EE660)copyPoly:(id *)a3;
- ($B716781559FB179C01A6A83DB44EE660)createMonomial:(int)a3 coefficient:(int)a4;
- ($B716781559FB179C01A6A83DB44EE660)divide:(id *)a3 by:(id *)a4;
- ($B716781559FB179C01A6A83DB44EE660)multiplyByMonomial:(id *)a3 degree:(int)a4 coefficient:(int)a5;
- ($B716781559FB179C01A6A83DB44EE660)multiplyPoly:(id *)a3 with:(id *)a4;
- (BOOL)encode:(int *)a3 length:(int)a4 bytes:(int)a5;
- (BOOL)fillPoly:(id *)a3 coefficients:(int *)a4 length:(int)a5;
- (BOOL)isZero:(id)a3;
- (id)initReedSolomon;
- (int)Degree:(id)a3;
- (int)Exp:(int)a3;
- (int)addOrSubtract:(int)a3 with:(int)a4;
- (int)coefficients:(id)a3;
- (int)inverse:(int)a3;
- (int)multiply:(int)a3 with:(int)a4;
- (int)polyCoefficient:(id *)a3 degree:(int)a4;
- (void)clearPoly:(id *)a3;
- (void)dealloc;
@end

@implementation CIReedSolomon

- (id)initReedSolomon
{
  v12.receiver = self;
  v12.super_class = (Class)CIReedSolomon;
  v2 = [(CIReedSolomon *)&v12 init];
  v3 = v2;
  if (!v2) {
    goto LABEL_12;
  }
  int v4 = 1;
  for (uint64_t i = 8; i != 1032; i += 4)
  {
    *(_DWORD *)((char *)&v2->super.isa + i) = v4;
    int v6 = 2 * v4;
    int v4 = (2 * v4) ^ 0x11D;
    if (v6 <= 255) {
      int v4 = v6;
    }
  }
  for (uint64_t j = 0; j != 255; ++j)
    v2->_logTable[v2->_expTable[j]] = j;
  *(void *)&v2->_cachedGeneratorNum = 0xA00000001;
  v8 = ($B716781559FB179C01A6A83DB44EE660 *)malloc_type_calloc(0xAuLL, 0x10uLL, 0x1010040A1D9428BuLL);
  v3->_cachedGenerators = v8;
  if (!v8) {
    goto LABEL_12;
  }
  v8->var1 = 1;
  v3->_cachedGenerators->var0 = (int *)malloc_type_calloc(1uLL, 4uLL, 0x100004052888210uLL);
  cachedGenerators = v3->_cachedGenerators;
  if (!cachedGenerators->var0)
  {
    free(cachedGenerators);
LABEL_12:
    v10 = 0;
    goto LABEL_13;
  }
  *cachedGenerators->var0 = 1;
  v10 = v3;
LABEL_13:

  return v10;
}

- (BOOL)encode:(int *)a3 length:(int)a4 bytes:(int)a5
{
  if (!a5)
  {
    v25 = sub_ACDC();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_10C44();
    }
    goto LABEL_20;
  }
  uint64_t v5 = *(void *)&a5;
  size_t v6 = (a4 - a5);
  if (a4 <= a5)
  {
    v25 = sub_ACDC();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_10C78();
    }
LABEL_20:

LABEL_24:
    LOBYTE(v10) = 0;
    return (char)v10;
  }
  v9 = [(CIReedSolomon *)self buildGenerator:*(void *)&a5];
  v10 = (char *)malloc_type_calloc(v6, 4uLL, 0x100004052888210uLL);
  if (!v10) {
    return (char)v10;
  }
  v11 = v10;
  uint64_t v12 = 0;
  do
  {
    *(_DWORD *)&v10[v12 * 4] = a3[v12];
    ++v12;
  }
  while (v6 != v12);
  v13 = malloc_type_calloc(1uLL, 0x10uLL, 0x1010040A1D9428BuLL);
  if (!v13)
  {
    v26 = v11;
LABEL_23:
    free(v26);
    goto LABEL_24;
  }
  v14 = v13;
  unsigned __int8 v15 = [(CIReedSolomon *)self fillPoly:v13 coefficients:v11 length:v6];
  free(v11);
  if ((v15 & 1) == 0)
  {
    v26 = v14;
    goto LABEL_23;
  }
  v16 = [(CIReedSolomon *)self multiplyByMonomial:v14 degree:v5 coefficient:1];
  [(CIReedSolomon *)self clearPoly:v14];
  free(v14);
  v17 = [(CIReedSolomon *)self divide:v16 by:v9];
  [(CIReedSolomon *)self clearPoly:v16];
  free(v16);
  var0 = v17->var0;
  int var1 = v17->var1;
  int v20 = v5 - var1;
  if ((int)v5 - var1 >= 1)
  {
    uint64_t v21 = (v5 - var1);
    int v22 = v6;
    do
    {
      a3[v22++] = 0;
      --v21;
    }
    while (v21);
    int var1 = v17->var1;
  }
  if (var1 >= 1)
  {
    uint64_t v23 = 0;
    v24 = &a3[v20 + (int)v6];
    do
    {
      v24[v23] = var0[v23];
      ++v23;
    }
    while (v23 < v17->var1);
  }
  [(CIReedSolomon *)self clearPoly:v17];
  free(v17);
  LOBYTE(v10) = 1;
  return (char)v10;
}

- (void)dealloc
{
  cachedGenerators = self->_cachedGenerators;
  if (cachedGenerators)
  {
    int cachedGeneratorNum = self->_cachedGeneratorNum;
    if (cachedGeneratorNum >= 1)
    {
      uint64_t v5 = 0;
      for (uint64_t i = 0; i < cachedGeneratorNum; ++i)
      {
        var0 = self->_cachedGenerators[v5].var0;
        if (var0)
        {
          free(var0);
          int cachedGeneratorNum = self->_cachedGeneratorNum;
        }
        ++v5;
      }
      cachedGenerators = self->_cachedGenerators;
    }
    free(cachedGenerators);
  }
  v8.receiver = self;
  v8.super_class = (Class)CIReedSolomon;
  [(CIReedSolomon *)&v8 dealloc];
}

- ($B716781559FB179C01A6A83DB44EE660)buildGenerator:(int)a3
{
  uint64_t cachedGeneratorNum = self->_cachedGeneratorNum;
  cachedGenerators = self->_cachedGenerators;
  if ((int)cachedGeneratorNum > a3) {
    return &cachedGenerators[a3];
  }
  uint64_t v8 = cachedGeneratorNum;
  uint64_t v9 = (uint64_t)&cachedGenerators[cachedGeneratorNum - 1];
  int v10 = a3 + 1;
  uint64_t v11 = (cachedGeneratorNum - 1);
  while (1)
  {
    v19[0] = 0;
    v19[1] = 2;
    uint64_t v12 = malloc_type_calloc(2uLL, 4uLL, 0x100004052888210uLL);
    v19[0] = v12;
    if (!v12) {
      break;
    }
    *uint64_t v12 = 1;
    unsigned int v13 = [(CIReedSolomon *)self Exp:v11];
    *(_DWORD *)(v19[0] + 4) = v13;
    v14 = [(CIReedSolomon *)self multiplyPoly:v9 with:v19];
    [(CIReedSolomon *)self clearPoly:v19];
    uint64_t memoryCapacity = self->_memoryCapacity;
    v16 = self->_cachedGenerators;
    if (cachedGeneratorNum >= memoryCapacity)
    {
      self->_uint64_t memoryCapacity = 2 * memoryCapacity;
      v16 = ($B716781559FB179C01A6A83DB44EE660 *)malloc_type_realloc(v16, 32 * memoryCapacity, 0x1010040A1D9428BuLL);
      self->_cachedGenerators = v16;
      if (!v16)
      {
        free(v14);
        return 0;
      }
    }
    v17 = &v16[v8];
    v17->int var1 = v14->var1;
    v17->var0 = v14->var0;
    free(v14);
    v18 = self->_cachedGenerators;
    uint64_t v9 = (uint64_t)&v18[v8];
    ++cachedGeneratorNum;
    uint64_t v11 = (v11 + 1);
    ++v8;
    if (a3 == v11)
    {
      self->_uint64_t cachedGeneratorNum = v10;
      return &v18[v8 - 1];
    }
  }
  return 0;
}

- (int)Exp:(int)a3
{
  return self->_expTable[a3];
}

- ($B716781559FB179C01A6A83DB44EE660)divide:(id *)a3 by:(id *)a4
{
  if (a3 && a4 && !-[CIReedSolomon isZero:](self, "isZero:", a4->var0, *(void *)&a4->var1))
  {
    uint64_t v9 = [(CIReedSolomon *)self copyPoly:a3];
    uint64_t v10 = -[CIReedSolomon inverse:](self, "inverse:", -[CIReedSolomon polyCoefficient:degree:](self, "polyCoefficient:degree:", a4, -[CIReedSolomon Degree:](self, "Degree:", a4->var0, *(void *)&a4->var1)));
    while (1)
    {
      int v11 = -[CIReedSolomon Degree:](self, "Degree:", v9->var0, *(void *)&v9->var1);
      if (v11 < -[CIReedSolomon Degree:](self, "Degree:", a4->var0, *(void *)&a4->var1)) {
        break;
      }
      uint64_t v12 = -[CIReedSolomon multiplyByMonomial:degree:coefficient:](self, "multiplyByMonomial:degree:coefficient:", a4, -[CIReedSolomon Degree:](self, "Degree:", v9->var0, *(void *)&v9->var1)- -[CIReedSolomon Degree:](self, "Degree:", a4->var0, *(void *)&a4->var1), -[CIReedSolomon multiply:with:](self, "multiply:with:", -[CIReedSolomon polyCoefficient:degree:](self, "polyCoefficient:degree:", v9, -[CIReedSolomon Degree:](self, "Degree:", v9->var0, *(void *)&v9->var1)), v10));
      unsigned int v13 = [(CIReedSolomon *)self addOrSubtractPoly:v9 with:v12];
      [(CIReedSolomon *)self clearPoly:v12];
      free(v12);
      [(CIReedSolomon *)self clearPoly:v9];
      free(v9);
      uint64_t v9 = v13;
    }
    v14 = ($B716781559FB179C01A6A83DB44EE660 *)malloc_type_calloc(1uLL, 0x10uLL, 0x1010040A1D9428BuLL);
    uint64_t v8 = v14;
    if (v14)
    {
      v14->int var1 = v9->var1;
      v14->var0 = v9->var0;
    }
    else
    {
      [(CIReedSolomon *)self clearPoly:v9];
    }
    free(v9);
  }
  else
  {
    v7 = sub_ACDC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10C10();
    }

    return 0;
  }
  return v8;
}

- (int)Degree:(id)a3
{
  return a3.var1 - 1;
}

- (void)clearPoly:(id *)a3
{
  if (a3)
  {
    free(a3->var0);
    a3->int var1 = 0;
  }
}

- (int)polyCoefficient:(id *)a3 degree:(int)a4
{
  if ((a4 & 0x80000000) == 0)
  {
    int var1 = a3->var1;
    if (var1 > a4) {
      return a3->var0[var1 + ~a4];
    }
  }
  size_t v6 = sub_ACDC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_10BA8();
  }

  return 0;
}

- ($B716781559FB179C01A6A83DB44EE660)multiplyPoly:(id *)a3 with:(id *)a4
{
  result = 0;
  if (a3 && a4)
  {
    if (-[CIReedSolomon isZero:](self, "isZero:", a3->var0, *(void *)&a3->var1)
      || -[CIReedSolomon isZero:](self, "isZero:", a4->var0, *(void *)&a4->var1))
    {
      result = ($B716781559FB179C01A6A83DB44EE660 *)malloc_type_calloc(1uLL, 0x10uLL, 0x1010040A1D9428BuLL);
      if (result) {
        result->uint64_t var1 = 0;
      }
    }
    else
    {
      uint64_t var1 = a3->var1;
      var0 = a4->var0;
      int v20 = a3->var0;
      uint64_t v9 = a4->var1;
      result = ($B716781559FB179C01A6A83DB44EE660 *)malloc_type_calloc((int)var1 + (int)v9 - 1, 4uLL, 0x100004052888210uLL);
      v18 = (int *)result;
      if (result)
      {
        uint64_t v17 = (var1 + v9 - 1);
        if ((int)var1 >= 1)
        {
          uint64_t v10 = 0;
          int v11 = result;
          do
          {
            if ((int)v9 >= 1)
            {
              uint64_t v12 = var0;
              uint64_t v13 = v20[v10];
              uint64_t v14 = v9;
              unsigned __int8 v15 = (unsigned int *)v11;
              do
              {
                unsigned int v16 = *v12++;
                *unsigned __int8 v15 = -[CIReedSolomon addOrSubtract:with:](self, "addOrSubtract:with:", *v15, -[CIReedSolomon multiply:with:](self, "multiply:with:", v13, v16, v17));
                ++v15;
                --v14;
              }
              while (v14);
            }
            ++v10;
            int v11 = ($B716781559FB179C01A6A83DB44EE660 *)((char *)v11 + 4);
          }
          while (v10 != var1);
        }
        result = ($B716781559FB179C01A6A83DB44EE660 *)malloc_type_calloc(1uLL, 0x10uLL, 0x1010040A1D9428BuLL);
        if (result)
        {
          result->var0 = v18;
          result->uint64_t var1 = v17;
        }
        else
        {
          free(v18);
          return 0;
        }
      }
    }
  }
  return result;
}

- ($B716781559FB179C01A6A83DB44EE660)multiplyByMonomial:(id *)a3 degree:(int)a4 coefficient:(int)a5
{
  if (!a3 || a4 < 0)
  {
    uint64_t v14 = sub_ACDC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10BDC();
    }

    return 0;
  }
  uint64_t v5 = *(void *)&a5;
  if (a5)
  {
    uint64_t var1 = a3->var1;
    int v9 = var1 + a4;
    result = ($B716781559FB179C01A6A83DB44EE660 *)malloc_type_calloc((int)var1 + a4, 4uLL, 0x100004052888210uLL);
    if (!result) {
      return result;
    }
    int v11 = (int *)result;
    if ((int)var1 >= 1)
    {
      unint64_t v12 = 0;
      uint64_t v13 = 4 * var1;
      do
      {
        v11[v12 / 4] = [(CIReedSolomon *)self multiply:a3->var0[v12 / 4] with:v5];
        v12 += 4;
      }
      while (v13 != v12);
    }
    result = ($B716781559FB179C01A6A83DB44EE660 *)malloc_type_calloc(1uLL, 0x10uLL, 0x1010040A1D9428BuLL);
    if (result)
    {
      result->var0 = v11;
      result->uint64_t var1 = v9;
      return result;
    }
    free(v11);
    return 0;
  }
  result = ($B716781559FB179C01A6A83DB44EE660 *)malloc_type_calloc(1uLL, 0x10uLL, 0x1010040A1D9428BuLL);
  if (result) {
    result->uint64_t var1 = 0;
  }
  return result;
}

- (int)multiply:(int)a3 with:(int)a4
{
  int v4 = 0;
  if (a3 && a4)
  {
    if (a3 == 1)
    {
      return a4;
    }
    else if (a4 == 1)
    {
      return a3;
    }
    else
    {
      return self->_expTable[(self->_logTable[a4] + self->_logTable[a3]) % 255];
    }
  }
  return v4;
}

- ($B716781559FB179C01A6A83DB44EE660)addOrSubtractPoly:(id *)a3 with:(id *)a4
{
  var0 = 0;
  if (!a3 || !a4) {
    return var0;
  }
  if (!-[CIReedSolomon isZero:](self, "isZero:", a3->var0, *(void *)&a3->var1))
  {
    if (-[CIReedSolomon isZero:](self, "isZero:", a4->var0, *(void *)&a4->var1))
    {
      uint64_t v8 = self;
      int v9 = a3;
      goto LABEL_7;
    }
    int var1 = a3->var1;
    int v12 = a4->var1;
    if (var1 <= v12) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = var1;
    }
    if (var1 <= v12) {
      uint64_t v14 = a3;
    }
    else {
      uint64_t v14 = a4;
    }
    if (var1 <= v12) {
      unsigned __int8 v15 = a4;
    }
    else {
      unsigned __int8 v15 = a3;
    }
    var0 = ($B716781559FB179C01A6A83DB44EE660 *)v15->var0;
    if (v15->var0)
    {
      unsigned int v16 = v14->var0;
      if (var1 >= v12) {
        int v17 = a4->var1;
      }
      else {
        int v17 = a3->var1;
      }
      v18 = malloc_type_calloc((int)v13, 4uLL, 0x100004052888210uLL);
      if (v18)
      {
        v19 = v18;
        if ((int)v13 - v17 >= 1)
        {
          uint64_t v20 = (v13 - v17);
          uint64_t v21 = var0;
          int v22 = v18;
          do
          {
            int v23 = (int)v21->var0;
            uint64_t v21 = ($B716781559FB179C01A6A83DB44EE660 *)((char *)v21 + 4);
            *v22++ = v23;
            --v20;
          }
          while (v20);
        }
        if (v17 >= 1)
        {
          uint64_t v24 = (int)v13 - v17;
          do
          {
            unsigned int v25 = *v16++;
            v19[v24] = [(CIReedSolomon *)self addOrSubtract:v25 with:*((unsigned int *)&var0->var0 + v24)];
            ++v24;
          }
          while (v24 < (int)v13);
        }
        var0 = ($B716781559FB179C01A6A83DB44EE660 *)malloc_type_calloc(1uLL, 0x10uLL, 0x1010040A1D9428BuLL);
        if (var0) {
          [(CIReedSolomon *)self fillPoly:var0 coefficients:v19 length:v13];
        }
        free(v19);
      }
      else
      {
        return 0;
      }
    }
    return var0;
  }
  uint64_t v8 = self;
  int v9 = a4;
LABEL_7:
  return [(CIReedSolomon *)v8 copyPoly:v9];
}

- (int)addOrSubtract:(int)a3 with:(int)a4
{
  return a4 ^ a3;
}

- (BOOL)isZero:(id)a3
{
  return a3.var1 == 0;
}

- (BOOL)fillPoly:(id *)a3 coefficients:(int *)a4 length:(int)a5
{
  if (!a3 || (uint64_t v5 = a4) == 0 || !a5)
  {
    uint64_t v10 = sub_ACDC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10B74();
    }

    LOBYTE(v8) = 0;
    return (char)v8;
  }
  if (a5 < 2 || *a4)
  {
    a3->int var1 = a5;
    if (a3->var0) {
      free(a3->var0);
    }
    uint64_t v8 = (int *)malloc_type_calloc(a5, 4uLL, 0x100004052888210uLL);
    a3->var0 = v8;
    if (!v8) {
      return (char)v8;
    }
    size_t v9 = 4 * a5;
    goto LABEL_10;
  }
  uint64_t v5 = a4 + 1;
  uint64_t v11 = 1;
  while (!*v5)
  {
    ++v11;
    ++v5;
    if (a5 == v11) {
      goto LABEL_19;
    }
  }
  if (a5 == v11)
  {
LABEL_19:
    [(CIReedSolomon *)self clearPoly:a3];
    goto LABEL_20;
  }
  int var1 = a5 - v11;
  a3->int var1 = a5 - v11;
  if (a3->var0)
  {
    free(a3->var0);
    int var1 = a3->var1;
  }
  uint64_t v8 = (int *)malloc_type_calloc(var1, 4uLL, 0x100004052888210uLL);
  a3->var0 = v8;
  if (v8)
  {
    size_t v9 = 4 * a3->var1;
LABEL_10:
    memcpy(v8, v5, v9);
LABEL_20:
    LOBYTE(v8) = 1;
  }
  return (char)v8;
}

- (int)inverse:(int)a3
{
  if (a3) {
    return self->_expTable[255 - self->_logTable[a3]];
  }
  int v4 = sub_ACDC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10B0C();
  }

  return 0x7FFFFFFF;
}

- ($B716781559FB179C01A6A83DB44EE660)copyPoly:(id *)a3
{
  int v4 = ($B716781559FB179C01A6A83DB44EE660 *)malloc_type_calloc(1uLL, 0x10uLL, 0x1010040A1D9428BuLL);
  if (v4)
  {
    size_t var1 = a3->var1;
    v4->size_t var1 = var1;
    size_t v6 = (int *)malloc_type_calloc(var1, 4uLL, 0x100004052888210uLL);
    v4->var0 = v6;
    if (v6)
    {
      if (a3->var1 >= 1)
      {
        uint64_t v7 = 0;
        var0 = a3->var0;
        do
        {
          v6[v7] = var0[v7];
          ++v7;
        }
        while (v7 < a3->var1);
      }
    }
    else
    {
      free(v4);
      return 0;
    }
  }
  return v4;
}

- ($B716781559FB179C01A6A83DB44EE660)createMonomial:(int)a3 coefficient:(int)a4
{
  if (a3 < 0)
  {
    uint64_t v11 = sub_ACDC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10B40();
    }

    return 0;
  }
  if (a4)
  {
    size_t v6 = (a3 + 1);
    uint64_t v7 = malloc_type_calloc(v6, 4uLL, 0x100004052888210uLL);
    if (!v7) {
      return 0;
    }
    uint64_t v8 = v7;
    _DWORD *v7 = a4;
    size_t v9 = ($B716781559FB179C01A6A83DB44EE660 *)malloc_type_calloc(1uLL, 0x10uLL, 0x1010040A1D9428BuLL);
    if (!v9)
    {
      free(v8);
      return v9;
    }
    unsigned __int8 v10 = [(CIReedSolomon *)self fillPoly:v9 coefficients:v8 length:v6];
    free(v8);
    if ((v10 & 1) == 0)
    {
      free(v9);
      return 0;
    }
  }
  else
  {
    uint64_t v13 = ($B716781559FB179C01A6A83DB44EE660 *)malloc_type_calloc(1uLL, 0x10uLL, 0x1010040A1D9428BuLL);
    size_t v9 = v13;
    if (v13) {
      v13->size_t var1 = 0;
    }
  }
  return v9;
}

- (int)coefficients:(id)a3
{
  return a3.var0;
}

@end