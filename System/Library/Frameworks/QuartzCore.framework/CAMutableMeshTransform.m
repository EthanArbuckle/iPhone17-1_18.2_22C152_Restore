@interface CAMutableMeshTransform
+ (id)meshTransform;
- (BOOL)replicatesEdges;
- (CAMutableMeshTransform)init;
- (NSString)depthNormalization;
- (id)copyWithZone:(_NSZone *)a3;
- (int)subdivisionSteps;
- (void)addFace:(CAMeshFace *)a3;
- (void)addVertex:(CAMeshVertex *)a3;
- (void)removeFaceAtIndex:(unint64_t)a3;
- (void)removeVertexAtIndex:(unint64_t)a3;
- (void)replaceFaceAtIndex:(unint64_t)a3 withFace:(CAMeshFace *)a4;
- (void)replaceVertexAtIndex:(unint64_t)a3 withVertex:(CAMeshVertex *)a4;
- (void)setDepthNormalization:(id)a3;
- (void)setReplicatesEdges:(BOOL)a3;
- (void)setSubdivisionSteps:(int)a3;
@end

@implementation CAMutableMeshTransform

- (void)setSubdivisionSteps:(int)a3
{
  self->super._subdivisionSteps = a3;
  impl = self->super._impl;
  if (impl)
  {
    impl[24] = self->super._normalization;
    impl[25] = a3;
    *((unsigned char *)impl + 108) = self->super._replicatesEdges;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [CAMeshTransform alloc];

  return [(CAMeshTransform *)v4 _initWithMeshTransform:self];
}

- (BOOL)replicatesEdges
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)CAMutableMeshTransform;
  return [(CAMeshTransform *)&v3 replicatesEdges];
}

- (int)subdivisionSteps
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)CAMutableMeshTransform;
  return [(CAMeshTransform *)&v3 subdivisionSteps];
}

- (NSString)depthNormalization
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)CAMutableMeshTransform;
  return [(CAMeshTransform *)&v3 depthNormalization];
}

- (void)removeFaceAtIndex:(unint64_t)a3
{
  impl = self->super._impl;
  if (a3 >= (uint64_t)(*((void *)impl + 4) - *((void *)impl + 3)) >> 5)
  {
    [MEMORY[0x1E4F1CA00] raise:@"CAMeshTransform", @"%@: trying to remove non-existent face %ld", self, a3 format];
  }
  else
  {
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    v7 = (CA::Render::MeshTransform *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0xD0uLL, 0x743898A5uLL);
    if (v7)
    {
      v8 = (int32x2_t *)v7;
      CA::Render::MeshTransform::MeshTransform(v7, ((uint64_t)(*((void *)impl + 4) - *((void *)impl + 3)) >> 5) - 1, (uint64_t)(*((void *)impl + 7) - *((void *)impl + 6)) >> 4, *((_DWORD *)impl + 25));
      uint64_t v9 = *((void *)impl + 3);
      uint64_t v10 = *((void *)impl + 4);
      if (v9 != v10)
      {
        int32x2_t v11 = v8[3];
        do
        {
          **(void **)&int32x2_t v11 = *(void *)v9;
          uint64_t v12 = *(void *)(v9 + 16);
          *(_DWORD *)(*(void *)&v11 + 24) = *(_DWORD *)(v9 + 24);
          *(void *)(*(void *)&v11 + 16) = v12;
          *(_DWORD *)(*(void *)&v11 + 28) = *(_DWORD *)(v9 + 28);
          v9 += 32;
          *(void *)&v11 += 32;
        }
        while (v9 != v10);
      }
      if (a3) {
        memmove(*(void **)&v8[6], *((const void **)impl + 6), 16 * a3);
      }
      v13 = (unsigned char *)*((void *)impl + 7);
      v14 = (unsigned char *)(*((void *)impl + 6) + 16 * a3 + 16);
      if (v13 != v14) {
        memmove((void *)(*(void *)&v8[6] + 16 * a3), v14, v13 - v14);
      }
      if ((a3 & 0x3FFFFFFFFFFFFFFLL) != 0) {
        memmove(*(void **)&v8[9], *((const void **)impl + 9), a3 << 6);
      }
      v15 = (unsigned char *)*((void *)impl + 10);
      v16 = (unsigned char *)(*((void *)impl + 9) + (a3 << 6) + 64);
      if (v15 != v16) {
        memmove((void *)(*(void *)&v8[9] + (a3 << 6)), v16, v15 - v16);
      }
      if (atomic_fetch_add((atomic_uint *volatile)impl + 2, 0xFFFFFFFF) == 1) {
        (*(void (**)(void *))(*(void *)impl + 16))(impl);
      }
      self->super._impl = v8;
      v8[12] = vmovn_s64(*(int64x2_t *)&self->super._normalization);
      v8[13].i8[4] = self->super._replicatesEdges;
    }
  }
}

- (void)addFace:(CAMeshFace *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  impl = self->super._impl;
  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  v7 = (CA::Render::MeshTransform *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0xD0uLL, 0x743898A5uLL);
  if (v7)
  {
    v8 = (int32x2_t *)v7;
    CA::Render::MeshTransform::MeshTransform(v7, (uint64_t)(*((void *)impl + 4) - *((void *)impl + 3)) >> 5, ((uint64_t)(*((void *)impl + 7) - *((void *)impl + 6)) >> 4) + 1, *((_DWORD *)impl + 25));
    uint64_t v9 = *((void *)impl + 3);
    uint64_t v10 = *((void *)impl + 4);
    if (v9 != v10)
    {
      int32x2_t v11 = v8[3];
      do
      {
        **(void **)&int32x2_t v11 = *(void *)v9;
        uint64_t v12 = *(void *)(v9 + 16);
        *(_DWORD *)(*(void *)&v11 + 24) = *(_DWORD *)(v9 + 24);
        *(void *)(*(void *)&v11 + 16) = v12;
        *(_DWORD *)(*(void *)&v11 + 28) = *(_DWORD *)(v9 + 28);
        v9 += 32;
        *(void *)&v11 += 32;
      }
      while (v9 != v10);
    }
    v13 = (unsigned char *)*((void *)impl + 6);
    v14 = (unsigned char *)*((void *)impl + 7);
    if (v14 != v13) {
      memmove(*(void **)&v8[6], v13, v14 - v13);
    }
    v15 = (unsigned char *)*((void *)impl + 9);
    v16 = (unsigned char *)*((void *)impl + 10);
    if (v16 != v15) {
      memmove(*(void **)&v8[9], v15, v16 - v15);
    }
    if (atomic_fetch_add((atomic_uint *volatile)impl + 2, 0xFFFFFFFF) == 1) {
      (*(void (**)(void *))(*(void *)impl + 16))(impl);
    }
    v8[1].i32[1] &= 0xFFFFD4FF;
    self->super._impl = v8;
    v8[12] = vmovn_s64(*(int64x2_t *)&self->super._normalization);
    v8[13].i8[4] = self->super._replicatesEdges;
    uint64_t v17 = ((uint64_t)(*(void *)&v8[7] - *(void *)&v8[6]) >> 4) - 1;
    long long v18 = *(_OWORD *)a3->var1;
    v19[0] = *(_OWORD *)a3->var0;
    v19[1] = v18;
    [(CAMutableMeshTransform *)self replaceFaceAtIndex:v17 withFace:v19];
  }
}

- (void)replaceFaceAtIndex:(unint64_t)a3 withFace:(CAMeshFace *)a4
{
  impl = self->super._impl;
  uint64_t v5 = impl[6];
  if (a3 >= (impl[7] - v5) >> 4)
  {
    [MEMORY[0x1E4F1CA00] raise:@"CAMeshTransform", @"%@: trying to replace non-existent face %ld", self, a3 format];
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = v5 + 16 * a3;
    unint64_t v8 = impl[9] + (a3 << 6) + 4;
    do
    {
      *(_DWORD *)(v7 + v6 * 4) = a4->var0[v6];
      *(float *)(v8 + 1 * v6) = a4->var1[v6];
      ++v6;
    }
    while (v6 != 4);
    *((_DWORD *)impl + 3) &= 0xFFFFD4FF;
  }
}

- (void)removeVertexAtIndex:(unint64_t)a3
{
  impl = self->super._impl;
  if (a3 >= (uint64_t)(*((void *)impl + 4) - *((void *)impl + 3)) >> 5)
  {
    [MEMORY[0x1E4F1CA00] raise:@"CAMeshTransform", @"%@: trying to remove non-existent vertex %ld", self, a3 format];
  }
  else
  {
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    uint64_t v7 = (CA::Render::MeshTransform *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0xD0uLL, 0x743898A5uLL);
    if (v7)
    {
      unint64_t v8 = (int32x2_t *)v7;
      uint64_t v9 = CA::Render::MeshTransform::MeshTransform(v7, ((uint64_t)(*((void *)impl + 4) - *((void *)impl + 3)) >> 5) - 1, (uint64_t)(*((void *)impl + 7) - *((void *)impl + 6)) >> 4, *((_DWORD *)impl + 25));
      uint64_t v10 = *((void *)impl + 3);
      int32x2_t v11 = *(int32x2_t *)((char *)v9 + 24);
      if (a3)
      {
        uint64_t v12 = v10 + 32 * a3;
        do
        {
          **(void **)&int32x2_t v11 = *(void *)v10;
          uint64_t v13 = *(void *)(v10 + 16);
          *(_DWORD *)(*(void *)&v11 + 24) = *(_DWORD *)(v10 + 24);
          *(void *)(*(void *)&v11 + 16) = v13;
          *(_DWORD *)(*(void *)&v11 + 28) = *(_DWORD *)(v10 + 28);
          v10 += 32;
          *(void *)&v11 += 32;
        }
        while (v10 != v12);
        uint64_t v10 = *((void *)impl + 3);
        int32x2_t v11 = v8[3];
      }
      unint64_t v14 = v10 + 32 * a3 + 32;
      uint64_t v15 = *((void *)impl + 4);
      if (v14 != v15)
      {
        unint64_t v16 = *(void *)&v11 + 32 * a3;
        do
        {
          *(void *)unint64_t v16 = *(void *)v14;
          uint64_t v17 = *(void *)(v14 + 16);
          *(_DWORD *)(v16 + 24) = *(_DWORD *)(v14 + 24);
          *(void *)(v16 + 16) = v17;
          *(_DWORD *)(v16 + 28) = *(_DWORD *)(v14 + 28);
          v14 += 32;
          v16 += 32;
        }
        while (v14 != v15);
      }
      long long v18 = (unsigned char *)*((void *)impl + 6);
      v19 = (unsigned char *)*((void *)impl + 7);
      if (v19 != v18) {
        memmove(*(void **)&v8[6], v18, v19 - v18);
      }
      uint64_t v20 = (unsigned char *)*((void *)impl + 9);
      v21 = (unsigned char *)*((void *)impl + 10);
      if (v21 != v20) {
        memmove(*(void **)&v8[9], v20, v21 - v20);
      }
      uint64_t v22 = *((void *)impl + 6);
      uint64_t v23 = *((void *)impl + 7);
      while (v22 != v23)
      {
        for (uint64_t i = 0; i != 16; i += 4)
        {
          unint64_t v25 = *(unsigned int *)(v22 + i);
          if (v25 > a3) {
            *(_DWORD *)(v22 + i) = v25 - 1;
          }
        }
        v22 += 16;
      }
      if (atomic_fetch_add((atomic_uint *volatile)impl + 2, 0xFFFFFFFF) == 1) {
        (*(void (**)(void *))(*(void *)impl + 16))(impl);
      }
      self->super._impl = v8;
      v8[12] = vmovn_s64(*(int64x2_t *)&self->super._normalization);
      v8[13].i8[4] = self->super._replicatesEdges;
    }
  }
}

- (void)addVertex:(CAMeshVertex *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  impl = self->super._impl;
  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  uint64_t v7 = (CA::Render::MeshTransform *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0xD0uLL, 0x743898A5uLL);
  if (v7)
  {
    unint64_t v8 = (int32x2_t *)v7;
    CA::Render::MeshTransform::MeshTransform(v7, ((uint64_t)(*((void *)impl + 4) - *((void *)impl + 3)) >> 5) + 1, (uint64_t)(*((void *)impl + 7) - *((void *)impl + 6)) >> 4, *((_DWORD *)impl + 25));
    uint64_t v9 = *((void *)impl + 3);
    uint64_t v10 = *((void *)impl + 4);
    if (v9 != v10)
    {
      int32x2_t v11 = v8[3];
      do
      {
        **(void **)&int32x2_t v11 = *(void *)v9;
        uint64_t v12 = *(void *)(v9 + 16);
        *(_DWORD *)(*(void *)&v11 + 24) = *(_DWORD *)(v9 + 24);
        *(void *)(*(void *)&v11 + 16) = v12;
        *(_DWORD *)(*(void *)&v11 + 28) = *(_DWORD *)(v9 + 28);
        v9 += 32;
        *(void *)&v11 += 32;
      }
      while (v9 != v10);
    }
    uint64_t v13 = (unsigned char *)*((void *)impl + 6);
    unint64_t v14 = (unsigned char *)*((void *)impl + 7);
    if (v14 != v13) {
      memmove(*(void **)&v8[6], v13, v14 - v13);
    }
    uint64_t v15 = (unsigned char *)*((void *)impl + 9);
    unint64_t v16 = (unsigned char *)*((void *)impl + 10);
    if (v16 != v15) {
      memmove(*(void **)&v8[9], v15, v16 - v15);
    }
    if (atomic_fetch_add((atomic_uint *volatile)impl + 2, 0xFFFFFFFF) == 1) {
      (*(void (**)(void *))(*(void *)impl + 16))(impl);
    }
    self->super._impl = v8;
    v8[12] = vmovn_s64(*(int64x2_t *)&self->super._normalization);
    v8[13].i8[4] = self->super._replicatesEdges;
    uint64_t v17 = ((uint64_t)(*(void *)&v8[4] - *(void *)&v8[3]) >> 5) - 1;
    long long v18 = *(_OWORD *)&a3->var1.x;
    v19[0] = a3->var0;
    v19[1] = v18;
    double z = a3->var1.z;
    [(CAMutableMeshTransform *)self replaceVertexAtIndex:v17 withVertex:v19];
  }
}

- (void)replaceVertexAtIndex:(unint64_t)a3 withVertex:(CAMeshVertex *)a4
{
  impl = self->super._impl;
  uint64_t v5 = impl[3];
  if (a3 >= (impl[4] - v5) >> 5)
  {
    [MEMORY[0x1E4F1CA00] raise:@"CAMeshTransform", @"%@: trying to replace non-existent vertex %ld", self, a3 format];
  }
  else
  {
    uint64_t v6 = (float32x2_t *)(v5 + 32 * a3);
    float64x2_t v7 = *(float64x2_t *)&a4->var1.x;
    *uint64_t v6 = vcvt_f32_f64((float64x2_t)a4->var0);
    v6[2] = vcvt_f32_f64(v7);
    float32_t z = a4->var1.z;
    v6[3].f32[0] = z;
    v6[3].i32[1] = 1065353216;
    *((_DWORD *)impl + 3) &= 0xFFFFD4FF;
  }
}

- (void)setReplicatesEdges:(BOOL)a3
{
  self->super._replicatesEdges = a3;
  impl = (int32x2_t *)self->super._impl;
  if (impl)
  {
    impl[12] = vmovn_s64(*(int64x2_t *)&self->super._normalization);
    impl[13].i8[4] = a3;
  }
}

- (void)setDepthNormalization:(id)a3
{
}

- (CAMutableMeshTransform)init
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)CAMutableMeshTransform;
  v2 = [(CAMeshTransform *)&v6 _init];
  if (v2)
  {
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    uint64_t v4 = (char *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0xD0uLL, 0x743898A5uLL);
    if (v4)
    {
      *((_DWORD *)v4 + 2) = 1;
      ++dword_1EB2ADE4C;
      *(void *)uint64_t v4 = &unk_1ED02DBE8;
      *(void *)(v4 + 12) = 33;
      *(_OWORD *)(v4 + 84) = 0u;
      *(_OWORD *)(v4 + 72) = 0u;
      *(_OWORD *)(v4 + 56) = 0u;
      *(_OWORD *)(v4 + 40) = 0u;
      *(_OWORD *)(v4 + 24) = 0u;
      *((_DWORD *)v4 + 26) = 0;
      v4[108] = 0;
      *((void *)v4 + 25) = 0;
      v2->i64[1] = (uint64_t)v4;
      *((int32x2_t *)v4 + 12) = vmovn_s64(v2[1]);
      v4[108] = v2[2].i8[0];
    }
    else
    {

      return 0;
    }
  }
  return (CAMutableMeshTransform *)v2;
}

+ (id)meshTransform
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

@end