@interface SKWarpGeometryGrid
+ (BOOL)supportsSecureCoding;
+ (SKWarpGeometryGrid)grid;
+ (SKWarpGeometryGrid)gridWithColumns:(NSInteger)cols rows:(NSInteger)rows;
+ (SKWarpGeometryGrid)gridWithColumns:(NSInteger)cols rows:(NSInteger)rows sourcePositions:(const vector_float2 *)sourcePositions destPositions:(const vector_float2 *)destPositions;
- (BOOL)isEqualToGrid:(id)a3;
- (BOOL)isIdentityWarp;
- (NSInteger)numberOfColumns;
- (NSInteger)numberOfRows;
- (NSInteger)vertexCount;
- (SKWarpGeometryGrid)gridByReplacingDestPositions:(const vector_float2 *)destPositions;
- (SKWarpGeometryGrid)gridByReplacingSourcePositions:(const vector_float2 *)sourcePositions;
- (SKWarpGeometryGrid)init;
- (SKWarpGeometryGrid)initWithCoder:(NSCoder *)aDecoder;
- (SKWarpGeometryGrid)initWithColumns:(NSInteger)cols rows:(NSInteger)rows sourcePositions:(const vector_float2 *)sourcePositions destPositions:(const vector_float2 *)destPositions;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (uint64_t)destPositions;
- (uint64_t)sourcePositions;
- (vector_float2)destPositionAtIndex:(NSInteger)index;
- (vector_float2)sourcePositionAtIndex:(NSInteger)index;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SKWarpGeometryGrid

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (SKWarpGeometryGrid)grid
{
  v2 = objc_opt_class();

  return (SKWarpGeometryGrid *)[v2 gridWithColumns:1 rows:1 sourcePositions:0 destPositions:0];
}

+ (SKWarpGeometryGrid)gridWithColumns:(NSInteger)cols rows:(NSInteger)rows
{
  v6 = objc_opt_class();

  return (SKWarpGeometryGrid *)[v6 gridWithColumns:cols rows:rows sourcePositions:0 destPositions:0];
}

+ (SKWarpGeometryGrid)gridWithColumns:(NSInteger)cols rows:(NSInteger)rows sourcePositions:(const vector_float2 *)sourcePositions destPositions:(const vector_float2 *)destPositions
{
  v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithColumns:cols rows:rows sourcePositions:sourcePositions destPositions:destPositions];

  return (SKWarpGeometryGrid *)v6;
}

- (SKWarpGeometryGrid)init
{
  return [(SKWarpGeometryGrid *)self initWithColumns:1 rows:1 sourcePositions:0 destPositions:0];
}

- (SKWarpGeometryGrid)initWithColumns:(NSInteger)cols rows:(NSInteger)rows sourcePositions:(const vector_float2 *)sourcePositions destPositions:(const vector_float2 *)destPositions
{
  v30.receiver = self;
  v30.super_class = (Class)SKWarpGeometryGrid;
  v10 = [(SKWarpGeometryGrid *)&v30 init];
  v11 = v10;
  v12 = v10;
  if (!v10)
  {
LABEL_26:
    v17 = v12;
    goto LABEL_27;
  }
  dimensions = (int32x2_t *)v10->_dimensions;
  *(void *)v10->_dimensions = __PAIR64__(rows, cols);
  if (cols >= 1 && rows > 0)
  {
    if ((int)rows * (int)cols < 1) {
      int v14 = 1;
    }
    else {
      int v14 = cols + 1 + (cols + 1) * rows;
    }
    v10->_vertexCount = v14;
    anon_8 = (void **)v10->_anon_8;
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)v10->_anon_8, v14);
    anon_20 = (void **)v11->_anon_20;
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)anon_20, v12->_vertexCount);
    if ((unint64_t)sourcePositions | (unint64_t)destPositions)
    {
      v12->_isIdentityWarp = 0;
      if (sourcePositions)
      {
        memcpy(*anon_8, sourcePositions, 8 * v12->_vertexCount);
LABEL_18:
        if (destPositions)
        {
          memcpy(*anon_20, destPositions, 8 * v12->_vertexCount);
        }
        else if ((dimensions->i32[1] & 0x80000000) == 0)
        {
          int v24 = 0;
          int32x2_t v25 = *dimensions;
          do
          {
            int v26 = v25.i32[0];
            if ((v25.i32[0] & 0x80000000) == 0)
            {
              uint64_t v27 = 0;
              do
              {
                v28.f32[0] = (float)(int)v27;
                v25.i32[0] = v26;
                v28.f32[1] = (float)v24;
                *((float32x2_t *)*anon_20 + v27 + v24 + v24 * v26) = vdiv_f32(v28, vcvt_f32_s32(v25));
                int32x2_t v25 = *dimensions;
                int v26 = (int)*dimensions;
                ++v27;
              }
              while ((int)v27 - 1 < v26);
            }
            BOOL v23 = v24++ < v25.i32[1];
          }
          while (v23);
        }
        goto LABEL_26;
      }
    }
    else
    {
      v12->_isIdentityWarp = 1;
    }
    if ((dimensions->i32[1] & 0x80000000) == 0)
    {
      int v18 = 0;
      int32x2_t v19 = *dimensions;
      do
      {
        int v20 = v19.i32[0];
        if ((v19.i32[0] & 0x80000000) == 0)
        {
          uint64_t v21 = 0;
          do
          {
            v22.f32[0] = (float)(int)v21;
            v19.i32[0] = v20;
            v22.f32[1] = (float)v18;
            *((float32x2_t *)*anon_8 + v21 + v18 + v18 * v20) = vdiv_f32(v22, vcvt_f32_s32(v19));
            int32x2_t v19 = *dimensions;
            int v20 = (int)*dimensions;
            ++v21;
          }
          while ((int)v21 - 1 < v20);
        }
        BOOL v23 = v18++ < v19.i32[1];
      }
      while (v23);
    }
    goto LABEL_18;
  }
  [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"SKWarpGeometryGrid: numberOfColumns and numberOfRows must be greater than or equal to 1"];
  v17 = 0;
LABEL_27:

  return v17;
}

- (SKWarpGeometryGrid)initWithCoder:(NSCoder *)aDecoder
{
  v48[3] = *MEMORY[0x263EF8340];
  v45 = aDecoder;
  v46.receiver = self;
  v46.super_class = (Class)SKWarpGeometryGrid;
  v4 = [(SKWarpGeometryGrid *)&v46 init];
  if (v4)
  {
    *((_DWORD *)v4 + 14) = [(NSCoder *)v45 decodeIntegerForKey:@"_numberOfColumns"];
    __int32 v5 = [(NSCoder *)v45 decodeIntegerForKey:@"_numberOfRows"];
    v6.i32[0] = 0;
    v7.i32[0] = *((void *)v4 + 7);
    v7.i32[1] = v5;
    v8.i32[1] = v5;
    v8.i32[0] = 0;
    int32x2_t v9 = (int32x2_t)vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_s32(v6, *(int32x2_t *)(v4 + 56)), 0), v8, v7);
    int8x8_t v10 = (int8x8_t)vdup_lane_s32(vcgt_s32(v6, vdup_lane_s32(v9, 1)), 0);
    int8x8_t v11 = vbsl_s8(v10, (int8x8_t)v9.u32[0], (int8x8_t)v9);
    int8x8_t v12 = vbic_s8((int8x8_t)v9, v10);
    *((int8x8_t *)v4 + 7) = v11;
    int v13 = v12.i32[1] + 1 + (v12.i32[1] + 1) * v11.i32[0];
    if (v11.i32[0] * v12.i32[1] < 1) {
      int v13 = 1;
    }
    *((_DWORD *)v4 + 16) = v13;
    int v14 = v4 + 8;
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)(v4 + 8), v13);
    v15 = v4 + 32;
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)(v4 + 32), *((int *)v4 + 16));
    v16 = (void *)MEMORY[0x263EFFA08];
    v48[0] = objc_opt_class();
    v48[1] = objc_opt_class();
    v48[2] = objc_opt_class();
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:3];
    int v18 = [v16 setWithArray:v17];
    int32x2_t v19 = [(NSCoder *)v45 decodeObjectOfClasses:v18 forKey:@"_sourcePositions"];

    uint64_t v20 = 0;
    for (unint64_t i = 0; ; ++i)
    {
      unint64_t v22 = [v19 count];
      unint64_t v23 = *((int *)v4 + 16);
      if (v22 < v23) {
        unint64_t v23 = v22;
      }
      if (v23 <= i) {
        break;
      }
      int v24 = [v19 objectAtIndexedSubscript:i];
      int32x2_t v25 = [v24 objectAtIndexedSubscript:0];
      [v25 floatValue];
      *(_DWORD *)(*v14 + v20) = v26;

      uint64_t v27 = [v19 objectAtIndexedSubscript:i];
      float32x2_t v28 = [v27 objectAtIndexedSubscript:1];
      [v28 floatValue];
      *(_DWORD *)(*v14 + v20 + 4) = v29;

      v20 += 8;
    }
    objc_super v30 = (void *)MEMORY[0x263EFFA08];
    v47[0] = objc_opt_class();
    v47[1] = objc_opt_class();
    v47[2] = objc_opt_class();
    v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:3];
    v32 = [v30 setWithArray:v31];
    v33 = [(NSCoder *)v45 decodeObjectOfClasses:v32 forKey:@"_destPositions"];

    uint64_t v34 = 0;
    for (unint64_t j = 0; ; ++j)
    {
      unint64_t v36 = [v19 count];
      unint64_t v37 = *((int *)v4 + 16);
      if (v36 < v37) {
        unint64_t v37 = v36;
      }
      if (v37 <= j) {
        break;
      }
      v38 = [v33 objectAtIndexedSubscript:j];
      v39 = [v38 objectAtIndexedSubscript:0];
      [v39 floatValue];
      *(_DWORD *)(*v15 + v34) = v40;

      v41 = [v33 objectAtIndexedSubscript:j];
      v42 = [v41 objectAtIndexedSubscript:1];
      [v42 floatValue];
      *(_DWORD *)(*v15 + v34 + 4) = v43;

      v34 += 8;
    }
  }
  return (SKWarpGeometryGrid *)v4;
}

- (void)encodeWithCoder:(id)a3
{
  v20[2] = *MEMORY[0x263EF8340];
  id v17 = a3;
  [v17 encodeInteger:1 forKey:@"_SKWarpGeometryGridVersion"];
  objc_msgSend(v17, "encodeInteger:forKey:", -[SKWarpGeometryGrid numberOfColumns](self, "numberOfColumns"), @"_numberOfColumns");
  objc_msgSend(v17, "encodeInteger:forKey:", -[SKWarpGeometryGrid numberOfRows](self, "numberOfRows"), @"_numberOfRows");
  int v18 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[SKWarpGeometryGrid vertexCount](self, "vertexCount"));
  NSInteger v4 = 0;
  uint64_t v5 = 4;
  while ([(SKWarpGeometryGrid *)self vertexCount] > v4)
  {
    int32x2_t v6 = [NSNumber numberWithFloat:*(double *)(*(void *)self->_anon_8 + 8 * v4)];
    v20[0] = v6;
    LODWORD(v7) = *(_DWORD *)(*(void *)self->_anon_8 + v5);
    int8x8_t v8 = [NSNumber numberWithFloat:v7];
    v20[1] = v8;
    int32x2_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
    [v18 addObject:v9];

    ++v4;
    v5 += 8;
  }
  [v17 encodeObject:v18 forKey:@"_sourcePositions"];
  int8x8_t v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[SKWarpGeometryGrid vertexCount](self, "vertexCount"));
  NSInteger v11 = 0;
  uint64_t v12 = 4;
  while ([(SKWarpGeometryGrid *)self vertexCount] > v11)
  {
    int v13 = [NSNumber numberWithFloat:*(double *)(*(void *)self->_anon_20 + 8 * v11)];
    v19[0] = v13;
    LODWORD(v14) = *(_DWORD *)(*(void *)self->_anon_20 + v12);
    v15 = [NSNumber numberWithFloat:v14];
    v19[1] = v15;
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
    [v10 addObject:v16];

    ++v11;
    v12 += 8;
  }
  [v17 encodeObject:v10 forKey:@"_destPositions"];
}

- (BOOL)isEqualToGrid:(id)a3
{
  NSInteger v4 = (float32x2_t **)a3;
  if (self == (SKWarpGeometryGrid *)v4) {
    goto LABEL_16;
  }
  NSInteger v5 = [(SKWarpGeometryGrid *)self numberOfColumns];
  if (v5 != [v4 numberOfColumns]
    || (NSInteger v6 = -[SKWarpGeometryGrid numberOfRows](self, "numberOfRows"), v6 != [v4 numberOfRows]))
  {
LABEL_15:
    BOOL v19 = 0;
    goto LABEL_17;
  }
  double v7 = *(float32x2_t **)self->_anon_8;
  uint64_t v8 = *(void *)&self->_anon_8[8] - (void)v7;
  if (v8)
  {
    unint64_t v9 = v8 >> 3;
    int8x8_t v10 = v4[1];
    if (v9 <= 1) {
      unint64_t v9 = 1;
    }
    do
    {
      float32x2_t v11 = vsub_f32(*v7, *v10);
      if ((v11.i32[0] & 0x60000000) != 0 || (v11.i32[1] & 0x60000000) != 0) {
        goto LABEL_15;
      }
      ++v10;
      ++v7;
    }
    while (--v9);
  }
  uint64_t v12 = *(float32x2_t **)self->_anon_20;
  uint64_t v13 = *(void *)&self->_anon_20[8] - (void)v12;
  if (!v13)
  {
LABEL_16:
    BOOL v19 = 1;
    goto LABEL_17;
  }
  unint64_t v14 = v13 >> 3;
  v15 = v4[4];
  if (v14 <= 1) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = v14;
  }
  float32x2_t v17 = *v12;
  float32x2_t v18 = *v15;
  if ((vsub_f32(*v12, *v15).u32[0] & 0x60000000) != 0) {
    goto LABEL_15;
  }
  BOOL v19 = 0;
  unint64_t v21 = 1;
  do
  {
    if ((vsub_f32(v17, v18).i32[1] & 0x60000000) != 0) {
      break;
    }
    BOOL v19 = v14 <= v21;
    if (v16 == v21) {
      break;
    }
    float32x2_t v17 = v12[v21];
    float32x2_t v18 = v15[v21++];
  }
  while ((vsub_f32(v17, v18).u32[0] & 0x60000000) == 0);
LABEL_17:

  return v19;
}

- (BOOL)isIdentityWarp
{
  return self->_isIdentityWarp;
}

- (NSInteger)vertexCount
{
  return self->_vertexCount;
}

- (vector_float2)sourcePositionAtIndex:(NSInteger)index
{
  if (index < 0 || self->_vertexCount <= index)
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"SKWarpGeometryGrid: index must be in the range [0, vertexCount - 1]" format];
    return 0;
  }
  else
  {
    return *(vector_float2 *)(*(void *)self->_anon_8 + 8 * index);
  }
}

- (vector_float2)destPositionAtIndex:(NSInteger)index
{
  if (index < 0 || self->_vertexCount <= index)
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"SKWarpGeometryGrid: index must be in the range [0, vertexCount - 1]" format];
    return 0;
  }
  else
  {
    return *(vector_float2 *)(*(void *)self->_anon_20 + 8 * index);
  }
}

- (NSInteger)numberOfRows
{
  return *(int *)&self->_dimensions[4];
}

- (NSInteger)numberOfColumns
{
  return (int)*(void *)self->_dimensions;
}

- (uint64_t)sourcePositions
{
  return *(void *)(a1 + 8);
}

- (uint64_t)destPositions
{
  return *(void *)(a1 + 32);
}

- (SKWarpGeometryGrid)gridByReplacingSourcePositions:(const vector_float2 *)sourcePositions
{
  NSInteger v5 = objc_opt_class();
  NSInteger v6 = [(SKWarpGeometryGrid *)self numberOfColumns];
  NSInteger v7 = [(SKWarpGeometryGrid *)self numberOfRows];
  uint64_t v8 = [(SKWarpGeometryGrid *)self destPositions];

  return (SKWarpGeometryGrid *)[v5 gridWithColumns:v6 rows:v7 sourcePositions:sourcePositions destPositions:v8];
}

- (SKWarpGeometryGrid)gridByReplacingDestPositions:(const vector_float2 *)destPositions
{
  NSInteger v5 = objc_opt_class();
  NSInteger v6 = [(SKWarpGeometryGrid *)self numberOfColumns];
  NSInteger v7 = [(SKWarpGeometryGrid *)self numberOfRows];
  uint64_t v8 = [(SKWarpGeometryGrid *)self sourcePositions];

  return (SKWarpGeometryGrid *)[v5 gridWithColumns:v6 rows:v7 sourcePositions:v8 destPositions:destPositions];
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  anon_20 = self->_anon_20;
  NSInteger v4 = *(void **)self->_anon_20;
  if (v4)
  {
    *((void *)anon_20 + 1) = v4;
    operator delete(v4);
  }
  NSInteger v5 = *(void **)self->_anon_8;
  if (v5)
  {
    *(void *)&self->_anon_8[8] = v5;
    operator delete(v5);
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 1) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 4) = 0;
  return self;
}

@end