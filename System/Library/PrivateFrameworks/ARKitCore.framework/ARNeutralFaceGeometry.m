@interface ARNeutralFaceGeometry
+ (id)sharedNeutralGeometry;
- (const)triangleIndices;
- (id).cxx_construct;
- (id)initFromCVAFaceTrackingSemantics;
- (uint64_t)textureCoordinates;
- (uint64_t)vertices;
- (unint64_t)textureCoordinateCount;
- (unint64_t)triangleCount;
- (unint64_t)vertexCount;
@end

@implementation ARNeutralFaceGeometry

+ (id)sharedNeutralGeometry
{
  if (+[ARNeutralFaceGeometry sharedNeutralGeometry]::onceToken != -1) {
    dispatch_once(&+[ARNeutralFaceGeometry sharedNeutralGeometry]::onceToken, &__block_literal_global_85);
  }
  v2 = (void *)+[ARNeutralFaceGeometry sharedNeutralGeometry]::neutralGeometry;
  return v2;
}

void __46__ARNeutralFaceGeometry_sharedNeutralGeometry__block_invoke()
{
  id v0 = [[ARNeutralFaceGeometry alloc] initFromCVAFaceTrackingSemantics];
  v1 = (void *)+[ARNeutralFaceGeometry sharedNeutralGeometry]::neutralGeometry;
  +[ARNeutralFaceGeometry sharedNeutralGeometry]::neutralGeometry = (uint64_t)v0;
}

- (id)initFromCVAFaceTrackingSemantics
{
  if (+[ARFaceTrackingTechnique isSupported])
  {
    v43.receiver = self;
    v43.super_class = (Class)ARNeutralFaceGeometry;
    v3 = [(ARNeutralFaceGeometry *)&v43 init];
    if (v3)
    {
      CVAFaceTrackingCopySemantics();
      uint64_t v42 = 0;
      uint64_t v4 = *MEMORY[0x1E4F4D778];
      v5 = [0 objectForKeyedSubscript:*MEMORY[0x1E4F4D778]];
      v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F4D790]];

      unint64_t v7 = [v6 length];
      id v8 = v6;
      uint64_t v9 = [v8 bytes];
      _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEEC2Em(&v40, (int)(v7 / 0xC));
      v11 = (void *)*((void *)v3 + 1);
      if (v11)
      {
        *((void *)v3 + 2) = v11;
        operator delete(v11);
        *((void *)v3 + 1) = 0;
        *((void *)v3 + 2) = 0;
        *((void *)v3 + 3) = 0;
      }
      *(_OWORD *)(v3 + 8) = v40;
      *((void *)v3 + 3) = v41;
      uint64_t v12 = *((void *)v3 + 1);
      if (*((void *)v3 + 2) != v12)
      {
        unint64_t v13 = 0;
        v14 = (_DWORD *)(v9 + 8);
        float32x4_t v15 = (float32x4_t)vdupq_n_s32(0x447A0000u);
        do
        {
          v10.i64[0] = *((void *)v14 - 1);
          v10.i32[2] = *v14;
          *(float32x4_t *)(v12 + 16 * v13) = v10;
          uint64_t v16 = *((void *)v3 + 1);
          float32x4_t v10 = vdivq_f32(*(float32x4_t *)(v16 + 16 * v13), v15);
          *(float32x4_t *)(v16 + 16 * v13++) = v10;
          uint64_t v12 = *((void *)v3 + 1);
          v14 += 3;
        }
        while (v13 < (*((void *)v3 + 2) - v12) >> 4);
      }
      v17 = [0 objectForKeyedSubscript:v4];
      v18 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F4D788]];

      _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEEC2Em(&v40, (int)([v18 length] >> 3));
      v19 = (void *)*((void *)v3 + 4);
      if (v19)
      {
        *((void *)v3 + 5) = v19;
        operator delete(v19);
        *((void *)v3 + 4) = 0;
        *((void *)v3 + 5) = 0;
        *((void *)v3 + 6) = 0;
      }
      *((_OWORD *)v3 + 2) = v40;
      *((void *)v3 + 6) = v41;
      id v20 = v18;
      uint64_t v21 = [v20 bytes];
      uint64_t v22 = *((void *)v3 + 4);
      if (*((void *)v3 + 5) != v22)
      {
        unint64_t v23 = 0;
        do
        {
          LODWORD(v24) = *(_DWORD *)v21;
          float v25 = *(float *)(v21 + 4);
          v21 += 8;
          *((float *)&v24 + 1) = 1.0 - v25;
          *(void *)(v22 + 8 * v23++) = v24;
          uint64_t v22 = *((void *)v3 + 4);
        }
        while (v23 < (*((void *)v3 + 5) - v22) >> 3);
      }
      v26 = [0 objectForKeyedSubscript:v4];
      v27 = [v26 objectForKeyedSubscript:*MEMORY[0x1E4F4D780]];

      unint64_t v28 = [v27 length];
      id v29 = v27;
      v30 = (int32x4_t *)[v29 bytes];
      unint64_t v31 = v28 >> 4;
      std::vector<short>::vector(&v40, 6 * (int)v31);
      v32 = (void *)*((void *)v3 + 7);
      if (v32)
      {
        *((void *)v3 + 8) = v32;
        operator delete(v32);
        *((void *)v3 + 7) = 0;
        *((void *)v3 + 8) = 0;
        *((void *)v3 + 9) = 0;
      }
      v33 = (int8x8_t *)v40;
      *(_OWORD *)(v3 + 56) = v40;
      *((void *)v3 + 9) = v41;
      if ((int)v31 >= 1)
      {
        uint64_t v34 = 0;
        v35 = v33 + 1;
        do
        {
          int32x4_t v36 = *v30++;
          int8x8_t v37 = (int8x8_t)vmovn_s32(v36);
          v35->i16[1] = v37.i16[1];
          v35[-1] = vext_s8(v37, v37, 6uLL);
          v35->i16[0] = v37.i16[3];
          v34 += 4;
          v35 = (int8x8_t *)((char *)v35 + 12);
        }
        while (v34 < 4 * (int)v31);
      }
    }
    self = v3;
    v38 = self;
  }
  else
  {
    v38 = 0;
  }

  return v38;
}

- (uint64_t)vertices
{
  return *(void *)(a1 + 8);
}

- (unint64_t)vertexCount
{
  return (uint64_t)(*(void *)self->_anon_10 - (unint64_t)self->_verticesVector.var0) >> 4;
}

- (uint64_t)textureCoordinates
{
  return *(void *)(a1 + 32);
}

- (unint64_t)textureCoordinateCount
{
  return (uint64_t)(*(void *)&self->_anon_20[8] - *(void *)self->_anon_20) >> 3;
}

- (const)triangleIndices
{
  return self->_trianglesIndicesVector.__begin_;
}

- (unint64_t)triangleCount
{
  return (self->_trianglesIndicesVector.__end_ - self->_trianglesIndicesVector.__begin_) / 3uLL;
}

- (void).cxx_destruct
{
  begin = self->_trianglesIndicesVector.__begin_;
  if (begin)
  {
    self->_trianglesIndicesVector.__end_ = begin;
    operator delete(begin);
  }
  uint64_t v4 = *(void **)self->_anon_20;
  if (v4)
  {
    *(void *)&self->_anon_20[8] = v4;
    operator delete(v4);
  }
  var0 = self->_verticesVector.var0;
  if (var0)
  {
    *(void *)self->_anon_10 = var0;
    operator delete(var0);
  }
}

- (id).cxx_construct
{
  *((void *)self + 9) = 0;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end