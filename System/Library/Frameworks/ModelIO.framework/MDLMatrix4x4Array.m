@interface MDLMatrix4x4Array
- (MDLDataPrecision)precision;
- (MDLMatrix4x4Array)initWithElementCount:(NSUInteger)arrayElementCount;
- (NSUInteger)elementCount;
- (NSUInteger)getDouble4x4Array:(matrix_double4x4 *)valuesArray maxCount:(NSUInteger)maxCount;
- (NSUInteger)getFloat4x4Array:(matrix_float4x4 *)valuesArray maxCount:(NSUInteger)maxCount;
- (VtValue)defaultVtValue;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (void)clear;
- (void)resetWithUsdAttribute:(const void *)a3;
- (void)resetWithUsdAttribute:(const void *)a3 time:(double)a4;
- (void)setDouble4x4Array:(const matrix_double4x4 *)valuesArray count:(NSUInteger)count;
- (void)setFloat4x4Array:(const matrix_float4x4 *)valuesArray count:(NSUInteger)count;
@end

@implementation MDLMatrix4x4Array

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [MDLMatrix4x4Array alloc];
  unint64_t elementCount = self->_elementCount;

  return (id)objc_msgSend_initWithElementCount_(v4, v5, elementCount);
}

- (MDLDataPrecision)precision
{
  p_data = &self->_data;
  if (sub_20B15CCA4((uint64_t)&self->_data)) {
    return 1;
  }
  if (sub_20B15CCDC((uint64_t)p_data)) {
    return 2;
  }
  return 0;
}

- (VtValue)defaultVtValue
{
  uint64_t v3 = v2;
  p_data = &self->_data;
  if (sub_20B15CCA4((uint64_t)&self->_data))
  {
    sub_20B15CDF0((uint64_t)v7, 0);
    *(void *)(v3 + 8) = &off_26BF50A38;
    sub_20B0A6DA4();
  }
  uint64_t v5 = sub_20B15CCDC((uint64_t)p_data);
  if (v5)
  {
    sub_20B15CE68((uint64_t)v7, 0);
    *(void *)(v3 + 8) = &off_26BF50980;
    sub_20B0A6DA4();
  }
  *(void *)(v3 + 8) = 0;
  result._info._ptrAndBits = v6;
  result._storage = (type)v5;
  return result;
}

- (void)resetWithUsdAttribute:(const void *)a3
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[0] = 0;
  v4[1] = 0;
  pxrInternal__aapl__pxrReserved__::UsdAttribute::Get();
  if ((sub_20B15CCA4((uint64_t)v4) & 1) != 0 || sub_20B15CCDC((uint64_t)v4)) {
    sub_20B120EA0(&self->_data._storage, v4);
  }
  sub_20B06A698((uint64_t)v4);
}

- (void)resetWithUsdAttribute:(const void *)a3 time:(double)a4
{
  v5[2] = *MEMORY[0x263EF8340];
  v5[0] = 0;
  v5[1] = 0;
  pxrInternal__aapl__pxrReserved__::UsdAttribute::Get();
  if ((sub_20B15CCA4((uint64_t)v5) & 1) != 0 || sub_20B15CCDC((uint64_t)v5)) {
    sub_20B120EA0(&self->_data._storage, v5);
  }
  sub_20B06A698((uint64_t)v5);
}

- (void)clear
{
  v2[2] = *MEMORY[0x263EF8340];
  v2[1] = 0;
  sub_20B0A6EB4(&self->_data._storage, v2);
  sub_20B06A698((uint64_t)v2);
}

- (MDLMatrix4x4Array)initWithElementCount:(NSUInteger)arrayElementCount
{
  v8.receiver = self;
  v8.super_class = (Class)MDLMatrix4x4Array;
  v4 = [(MDLMatrix4x4Array *)&v8 init];
  uint64_t v5 = v4;
  if (v4)
  {
    v4->_unint64_t elementCount = arrayElementCount;
    v6 = v4;
  }

  return v5;
}

- (void)setFloat4x4Array:(const matrix_float4x4 *)valuesArray count:(NSUInteger)count
{
  NSUInteger v4 = count;
  uint64_t v17 = *MEMORY[0x263EF8340];
  unint64_t elementCount = self->_elementCount;
  if (elementCount == count)
  {
    uint64_t v15 = 0;
    memset(v14, 0, sizeof(v14));
    sub_20B15CDF0((uint64_t)v14, count);
    if (v4)
    {
      uint64_t v7 = 0;
      objc_super v8 = &valuesArray->columns[2];
      do
      {
        simd_float4 v12 = v8[v7 - 1];
        simd_float4 v13 = v8[v7 - 2];
        simd_float4 v10 = v8[v7 + 1];
        simd_float4 v11 = v8[v7];
        sub_20B15F1CC((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v14);
        v9 = (simd_float4 *)(v15 + v7 * 16);
        simd_float4 *v9 = v13;
        v9[1] = v12;
        v9[2] = v11;
        v9[3] = v10;
        v7 += 4;
        --v4;
      }
      while (v4);
    }
    v16 = &off_26BF50A38;
    sub_20B0A6DA4();
  }
  NSLog(&cfstr_ArrayCountLuHa.isa, a2, valuesArray, count, elementCount);
}

- (void)setDouble4x4Array:(const matrix_double4x4 *)valuesArray count:(NSUInteger)count
{
  NSUInteger v4 = count;
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t elementCount = self->_elementCount;
  if (elementCount == count)
  {
    uint64_t v18 = 0;
    memset(v17, 0, sizeof(v17));
    sub_20B15CE68((uint64_t)v17, count);
    if (v4)
    {
      uint64_t v7 = 0;
      do
      {
        long long v15 = *(_OWORD *)&valuesArray[v7].columns[1].f64[2];
        long long v16 = *(_OWORD *)&valuesArray[v7].columns[0].f64[2];
        long long v11 = *(_OWORD *)valuesArray[v7].columns[1].f64;
        long long v12 = *(_OWORD *)valuesArray[v7].columns[0].f64;
        long long v13 = *(_OWORD *)&valuesArray[v7].columns[3].f64[2];
        long long v14 = *(_OWORD *)&valuesArray[v7].columns[2].f64[2];
        long long v9 = *(_OWORD *)valuesArray[v7].columns[3].f64;
        long long v10 = *(_OWORD *)valuesArray[v7].columns[2].f64;
        sub_20B15F270((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)v17);
        objc_super v8 = (_OWORD *)(v18 + v7 * 128);
        *objc_super v8 = v12;
        v8[1] = v16;
        v8[2] = v11;
        v8[3] = v15;
        v8[4] = v10;
        v8[5] = v14;
        v8[6] = v9;
        v8[7] = v13;
        ++v7;
        --v4;
      }
      while (v4);
    }
    v19 = &off_26BF50980;
    sub_20B0A6DA4();
  }
  NSLog(&cfstr_ArrayCountLuHa.isa, a2, valuesArray, count, elementCount);
}

- (NSUInteger)getFloat4x4Array:(matrix_float4x4 *)valuesArray maxCount:(NSUInteger)maxCount
{
  unint64_t v4 = maxCount;
  uint64_t v24 = *MEMORY[0x263EF8340];
  NSUInteger elementCount = self->_elementCount;
  if (elementCount <= maxCount)
  {
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    sub_20B0A592C(&v22, &self->_data._storage);
    if (v23)
    {
      if ((sub_20B15CCA4((uint64_t)&v22) & 1) == 0)
      {
        uint64_t v7 = sub_20B15D58C((uint64_t)&v22);
        sub_20B120EA0(&v22, v7);
      }
      uint64_t v8 = sub_20B15D618(&v22);
      long long v9 = *(_OWORD *)(v8 + 16);
      long long v19 = *(_OWORD *)v8;
      long long v20 = v9;
      uint64_t v10 = *(void *)(v8 + 32);
      uint64_t v21 = v10;
      if (v10)
      {
        long long v11 = (atomic_ullong *)(v10 - 16);
        if (*((void *)&v20 + 1)) {
          long long v11 = (atomic_ullong *)*((void *)&v20 + 1);
        }
        atomic_fetch_add_explicit(v11, 1uLL, memory_order_relaxed);
      }
      if ((unint64_t)v19 < v4) {
        unint64_t v4 = v19;
      }
      if (v4)
      {
        unint64_t v12 = 0;
        unint64_t v13 = v4;
        do
        {
          sub_20B15F1CC((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)&v19);
          simd_float4 v14 = *(simd_float4 *)(v21 + v12 + 16);
          simd_float4 v15 = *(simd_float4 *)(v21 + v12 + 32);
          simd_float4 v16 = *(simd_float4 *)(v21 + v12 + 48);
          uint64_t v17 = &valuesArray[v12 / 0x40];
          v17->columns[0] = *(simd_float4 *)(v21 + v12);
          v17->columns[1] = v14;
          v17->columns[2] = v15;
          v17->columns[3] = v16;
          v12 += 64;
          --v13;
        }
        while (v13);
      }
      sub_20B06A6E8((uint64_t)&v19);
    }
    else
    {
      unint64_t v4 = 0;
    }
    sub_20B06A698((uint64_t)&v22);
  }
  else
  {
    NSLog(&cfstr_ArrayCountLuHa_0.isa, a2, valuesArray, maxCount, elementCount);
    return 0;
  }
  return v4;
}

- (NSUInteger)getDouble4x4Array:(matrix_double4x4 *)valuesArray maxCount:(NSUInteger)maxCount
{
  unint64_t v4 = maxCount;
  uint64_t v28 = *MEMORY[0x263EF8340];
  NSUInteger elementCount = self->_elementCount;
  if (elementCount <= maxCount)
  {
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    sub_20B0A592C(&v26, &self->_data._storage);
    if (v27)
    {
      if ((sub_20B15CCDC((uint64_t)&v26) & 1) == 0)
      {
        uint64_t v7 = sub_20B15D888((uint64_t)&v26);
        sub_20B120EA0(&v26, v7);
      }
      uint64_t v8 = sub_20B15D914(&v26);
      long long v9 = *(_OWORD *)(v8 + 16);
      long long v23 = *(_OWORD *)v8;
      long long v24 = v9;
      uint64_t v10 = *(void *)(v8 + 32);
      uint64_t v25 = v10;
      if (v10)
      {
        long long v11 = (atomic_ullong *)(v10 - 16);
        if (*((void *)&v24 + 1)) {
          long long v11 = (atomic_ullong *)*((void *)&v24 + 1);
        }
        atomic_fetch_add_explicit(v11, 1uLL, memory_order_relaxed);
      }
      if ((unint64_t)v23 < v4) {
        unint64_t v4 = v23;
      }
      if (v4)
      {
        uint64_t v12 = 112;
        unint64_t v13 = v4;
        do
        {
          sub_20B15F270((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)&v23);
          long long v14 = *(_OWORD *)(v25 + v12 - 96);
          long long v15 = *(_OWORD *)(v25 + v12 - 80);
          long long v16 = *(_OWORD *)(v25 + v12 - 64);
          long long v17 = *(_OWORD *)(v25 + v12 - 48);
          long long v18 = *(_OWORD *)(v25 + v12 - 32);
          long long v19 = *(_OWORD *)(v25 + v12 - 16);
          long long v20 = *(_OWORD *)(v25 + v12);
          uint64_t v21 = (_OWORD *)((char *)valuesArray + v12);
          *(v21 - 7) = *(_OWORD *)(v25 + v12 - 112);
          *(v21 - 6) = v14;
          *(v21 - 5) = v15;
          *(v21 - 4) = v16;
          *(v21 - 3) = v17;
          *(v21 - 2) = v18;
          *(v21 - 1) = v19;
          *uint64_t v21 = v20;
          v12 += 128;
          --v13;
        }
        while (v13);
      }
      sub_20B06A6E8((uint64_t)&v23);
    }
    else
    {
      unint64_t v4 = 0;
    }
    sub_20B06A698((uint64_t)&v26);
  }
  else
  {
    NSLog(&cfstr_ArrayCountLuHa_0.isa, a2, valuesArray, maxCount, elementCount);
    return 0;
  }
  return v4;
}

- (NSUInteger)elementCount
{
  return self->_elementCount;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  return self;
}

@end