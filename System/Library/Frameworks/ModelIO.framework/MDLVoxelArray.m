@interface MDLVoxelArray
- (BOOL)isValidSignedShellField;
- (BOOL)voxelExistsAtIndex:(MDLVoxelIndex)index allowAnyX:(BOOL)allowAnyX allowAnyY:(BOOL)allowAnyY allowAnyZ:(BOOL)allowAnyZ allowAnyShell:(BOOL)allowAnyShell;
- (MDLAxisAlignedBoundingBox)boundingBox;
- (MDLAxisAlignedBoundingBox)voxelBoundingBoxAtIndex:(SEL)a3;
- (MDLMesh)coarseMesh;
- (MDLMesh)coarseMeshUsingAllocator:(id)allocator;
- (MDLMesh)meshUsingAllocator:(id)allocator;
- (MDLVoxelArray)init;
- (MDLVoxelArray)initWithAsset:(MDLAsset *)asset divisions:(int)divisions interiorNBWidth:(float)interiorNBWidth exteriorNBWidth:(float)exteriorNBWidth patchRadius:(float)patchRadius;
- (MDLVoxelArray)initWithAsset:(MDLAsset *)asset divisions:(int)divisions interiorShells:(int)interiorShells exteriorShells:(int)exteriorShells patchRadius:(float)patchRadius;
- (MDLVoxelArray)initWithAsset:(MDLAsset *)asset divisions:(int)divisions patchRadius:(float)patchRadius;
- (MDLVoxelArray)initWithData:(NSData *)voxelData boundingBox:(MDLAxisAlignedBoundingBox *)boundingBox voxelExtent:(float)voxelExtent;
- (MDLVoxelIndex)indexOfSpatialLocation:(vector_float3)location;
- (MDLVoxelIndexExtent)voxelIndexExtent;
- (NSData)voxelIndices;
- (NSData)voxelsWithinExtent:(MDLVoxelIndexExtent)extent;
- (NSUInteger)count;
- (float)shellFieldExteriorThickness;
- (float)shellFieldInteriorThickness;
- (id).cxx_construct;
- (id)coarseVoxelMeshWithStyle:(unint64_t)a3;
- (vector<int,)boxesPerLayer;
- (vector_float3)spatialLocationOfIndex:(MDLVoxelIndex)index;
- (void)convertToSignedShellField;
- (void)differenceWithVoxels:(MDLVoxelArray *)voxels;
- (void)dilateNarrowBandInteriorWidthTo:(float)a3 AndExteriorWidthTo:(float)a4;
- (void)erodeNarrowBandInteriorWidthTo:(float)a3 AndExteriorWidthTo:(float)a4 selector:(SEL)a5;
- (void)intersectWithVoxels:(MDLVoxelArray *)voxels;
- (void)recalculateExtents;
- (void)setShellFieldExteriorThickness:(float)shellFieldExteriorThickness;
- (void)setShellFieldInteriorThickness:(float)shellFieldInteriorThickness;
- (void)setVoxelAtIndex:(MDLVoxelIndex)index;
- (void)setVoxelsForMesh:(MDLMesh *)mesh divisions:(int)divisions interiorNBWidth:(float)interiorNBWidth exteriorNBWidth:(float)exteriorNBWidth patchRadius:(float)patchRadius;
- (void)setVoxelsForMesh:(MDLMesh *)mesh divisions:(int)divisions interiorShells:(int)interiorShells exteriorShells:(int)exteriorShells patchRadius:(float)patchRadius;
- (void)setVoxelsForMesh:(MDLMesh *)mesh divisions:(int)divisions patchRadius:(float)patchRadius;
- (void)unionWithVoxels:(MDLVoxelArray *)voxels;
@end

@implementation MDLVoxelArray

- (void)recalculateExtents
{
  anon_60 = self->_anon_60;
  *(void *)&long long v4 = 0x8000000080000000;
  *((void *)&v4 + 1) = 0x8000000080000000;
  *(_OWORD *)self->_anon_60 = v4;
  *(int32x4_t *)&self->_anon_60[16] = vdupq_n_s32(0x80000001);
  if (self->_voxels.__table_.__p2_.__value_)
  {
    next = (char *)self->_voxels.__table_.__p1_.__value_.__next_;
    if (next)
    {
      int32x4_t v6 = vdupq_n_s32(0x80000001);
      v2.i64[0] = 0x8000000080000000;
      v7.i64[0] = 0x8000000080000000;
      v7.i64[1] = 0x8000000080000000;
      int v8 = 0x7FFFFFFF;
      uint64x2_t v9 = (uint64x2_t)vdupq_n_s64(1uLL);
      uint64x2_t v10 = (uint64x2_t)vdupq_n_s64(2uLL);
      int64x2_t v11 = vdupq_n_s64(4uLL);
      int64x2_t v12 = vdupq_n_s64(0xFFFFFFFFFFFFFFFELL);
      int64x2_t v13 = vdupq_n_s64(0xFFFFFFFFFFFFFFFCLL);
      uint64x2_t v14 = (uint64x2_t)vdupq_n_s64(0x15uLL);
      do
      {
        v15 = (const double *)(next + 16);
        int v16 = *((_DWORD *)next + 6);
        int8x16_t v17 = (int8x16_t)vld1q_dup_f64(v15);
        int8x16_t v18 = 0uLL;
        uint64_t v19 = 24;
        int64x2_t v20 = (int64x2_t)xmmword_20B1E6180;
        int64x2_t v21 = (int64x2_t)xmmword_20B1E6170;
        int64x2_t v22 = (int64x2_t)xmmword_20B1E6160;
        int64x2_t v23 = (int64x2_t)xmmword_20B1E6150;
        int8x16_t v24 = 0uLL;
        int8x16_t v25 = 0uLL;
        do
        {
          int64x2_t v26 = v23;
          v27.i64[0] = 3 * v23.i64[0];
          int64x2_t v28 = v22;
          v27.i64[1] = 3 * v26.i64[1];
          v29.i64[0] = 3 * v22.i64[0];
          v29.i64[1] = 3 * v28.i64[1];
          int8x16_t v30 = v25;
          int8x16_t v31 = v24;
          int8x16_t v32 = v18;
          int8x16_t v18 = vorrq_s8(v18, (int8x16_t)vuzp1q_s32((int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v9, v29), v17), (uint64x2_t)vnegq_s64(vaddq_s64(v28, v28))), (int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v9, v27), v17), (uint64x2_t)vnegq_s64(vaddq_s64(v26, v26)))));
          int64x2_t v33 = vaddq_s64((int64x2_t)v27, v21);
          int64x2_t v34 = vaddq_s64((int64x2_t)v29, v20);
          int8x16_t v25 = vorrq_s8(v25, (int8x16_t)vuzp1q_s32((int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v10, v29), v17), (uint64x2_t)vmvnq_s8((int8x16_t)v34)), (int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v10, v27), v17), (uint64x2_t)vmvnq_s8((int8x16_t)v33))));
          int8x16_t v24 = vorrq_s8(v24, (int8x16_t)vuzp1q_s32((int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64((uint64x2_t)v11, v29), v17), (uint64x2_t)vsubq_s64(v12, v34)), (int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64((uint64x2_t)v11, v27), v17), (uint64x2_t)vsubq_s64(v12, v33))));
          int64x2_t v21 = vaddq_s64(v21, v13);
          int64x2_t v20 = vaddq_s64(v20, v13);
          int64x2_t v23 = vaddq_s64(v26, v11);
          int64x2_t v22 = vaddq_s64(v28, v11);
          v19 -= 4;
        }
        while (v19);
        int8x16_t v35 = (int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64(v14, (uint64x2_t)v28), (int32x4_t)vcgtq_u64(v14, (uint64x2_t)v26));
        int8x16_t v36 = vbslq_s8(v35, v18, v32);
        int8x8_t v37 = vorr_s8(*(int8x8_t *)v36.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v36, v36, 8uLL));
        if ((v37.i32[0] | v37.i32[1]) > v6.i32[0])
        {
          v6.i32[0] = v37.i32[0] | v37.i32[1];
          *(int32x4_t *)&self->_anon_60[16] = v6;
        }
        int8x16_t v38 = vbslq_s8(v35, v25, v30);
        int8x8_t v39 = vorr_s8(*(int8x8_t *)v38.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v38, v38, 8uLL));
        if ((v39.i32[0] | v39.i32[1]) > v6.i32[1])
        {
          v6.i32[1] = v39.i32[0] | v39.i32[1];
          *(int32x4_t *)&self->_anon_60[16] = v6;
        }
        int8x16_t v40 = vbslq_s8(v35, v24, v31);
        int8x8_t v41 = vorr_s8(*(int8x8_t *)v40.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v40, v40, 8uLL));
        int v42 = v41.i32[0] | v41.i32[1];
        if ((v41.i32[0] | v41.i32[1]) > v6.i32[2])
        {
          v6.i32[2] = v41.i32[0] | v41.i32[1];
          *(int32x4_t *)&self->_anon_60[16] = v6;
        }
        if (v16 > v6.i32[3])
        {
          v6.i32[3] = v16;
          *(int32x4_t *)&self->_anon_60[16] = v6;
        }
        if ((v37.i32[0] | v37.i32[1]) < v7.i32[0])
        {
          int8x16_t v43 = v7;
          v43.i32[0] = v37.i32[0] | v37.i32[1];
          *(int8x16_t *)anon_60 = v43;
          int8x16_t v2 = vextq_s8(v7, v7, 8uLL);
          v7.i32[0] = v2.i32[0];
          v2.i64[0] = v7.i64[0];
          int v8 = v37.i32[0] | v37.i32[1];
          int8x16_t v7 = v43;
        }
        if ((v39.i32[0] | v39.i32[1]) < v7.i32[1])
        {
          int v8 = v7.i32[0];
          int8x16_t v2 = vextq_s8(v7, v7, 8uLL);
          v7.i32[1] = v39.i32[0] | v39.i32[1];
          *(int8x16_t *)anon_60 = v7;
          v2.i32[1] = v39.i32[0] | v39.i32[1];
        }
        if (v42 < v7.i32[2])
        {
          int8x16_t v44 = v7;
          v44.i32[2] = v42;
          *(int8x16_t *)anon_60 = v44;
          int v8 = v7.i32[0];
          v7.i32[0] = v42;
          v2.i64[0] = v7.i64[0];
          int8x16_t v7 = v44;
        }
        if (v16 < v7.i32[3])
        {
          int8x16_t v45 = v7;
          v45.i32[3] = v16;
          *(int8x16_t *)anon_60 = v45;
          int v8 = v7.i32[0];
          int8x16_t v2 = vextq_s8(v7, v7, 8uLL);
          v7.i32[0] = v2.i32[0];
          v2.i64[0] = v7.i64[0];
          int8x16_t v7 = v45;
        }
        next = *(char **)next;
      }
      while (next);
    }
    else
    {
      v2.i64[0] = 0x8000000080000000;
      int v8 = 0x7FFFFFFF;
    }
    float32x4_t v47 = (float32x4_t)v2;
    v47.i32[0] = v8;
    *(float32x2_t *)v47.f32 = vcvt_f32_s32(*(int32x2_t *)v47.f32);
    v47.f32[2] = (float)v2.i32[0];
    __asm { FMOV            V1.4S, #1.0 }
    float32x4_t v53 = vaddq_f32(v47, _Q1);
    *(float32x4_t *)&self->_anon_80[16] = vmlaq_n_f32(*(float32x4_t *)self->_originatingOffset, v53, self->_voxelExtent);
    *(float32x2_t *)v53.f32 = vcvt_f32_s32(*(int32x2_t *)&self->_anon_60[16]);
    v53.f32[2] = (float)*(int *)&self->_anon_60[24];
    *(float32x4_t *)self->_anon_80 = vmlaq_n_f32(*(float32x4_t *)self->_originatingOffset, vaddq_f32(v53, _Q1), self->_voxelExtent);
  }
  else
  {
    *(void *)&long long v46 = 0x80000000800000;
    *((void *)&v46 + 1) = 0x80000000800000;
    *(_OWORD *)self->_anon_80 = v46;
    *(int32x4_t *)&self->_anon_80[16] = vdupq_n_s32(0x7F7FFFFFu);
  }
}

- (MDLVoxelArray)init
{
  v22.receiver = self;
  v22.super_class = (Class)MDLVoxelArray;
  int8x16_t v2 = [(MDLObject *)&v22 init];
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)int8x16_t v17 = 0u;
    *(_OWORD *)__p = 0u;
    *(_DWORD *)&__p[16] = 1065353216;
    sub_20B1598A4((uint64_t)&v2->_voxels, (uint64_t *)v17);
    sub_20B05F1D0((uint64_t)v17);
    sub_20B0DAE10(v17, v4);
    p_mortonCoder = &v3->mortonCoder;
    begin = v3->mortonCoder.mortonkeyX.__begin_;
    if (begin)
    {
      v3->mortonCoder.mortonkeyX.__end_ = begin;
      operator delete(begin);
      p_mortonCoder->mortonkeyX.__begin_ = 0;
      v3->mortonCoder.mortonkeyX.__end_ = 0;
      v3->mortonCoder.mortonkeyX.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&p_mortonCoder->mortonkeyX.__begin_ = *(_OWORD *)v17;
    v3->mortonCoder.mortonkeyX.__end_cap_.__value_ = *(unint64_t **)__p;
    v17[0] = 0;
    v17[1] = 0;
    *(void *)__p = 0;
    int8x16_t v7 = v3->mortonCoder.mortonkeyY.__begin_;
    if (v7)
    {
      v3->mortonCoder.mortonkeyY.__end_ = v7;
      operator delete(v7);
      v3->mortonCoder.mortonkeyY.__begin_ = 0;
      v3->mortonCoder.mortonkeyY.__end_ = 0;
      v3->mortonCoder.mortonkeyY.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&v3->mortonCoder.mortonkeyY.__begin_ = *(_OWORD *)&__p[8];
    v3->mortonCoder.mortonkeyY.__end_cap_.__value_ = v19;
    *(void *)&__p[8] = 0;
    *(void *)&__p[16] = 0;
    uint64_t v19 = 0;
    int v8 = v3->mortonCoder.mortonkeyZ.__begin_;
    if (v8)
    {
      v3->mortonCoder.mortonkeyZ.__end_ = v8;
      operator delete(v8);
      v3->mortonCoder.mortonkeyZ.__begin_ = 0;
      v3->mortonCoder.mortonkeyZ.__end_ = 0;
      v3->mortonCoder.mortonkeyZ.__end_cap_.__value_ = 0;
      int v8 = *(unint64_t **)&__p[8];
    }
    *(_OWORD *)&v3->mortonCoder.mortonkeyZ.__begin_ = v20;
    v3->mortonCoder.mortonkeyZ.__end_cap_.__value_ = v21;
    long long v20 = 0uLL;
    int64x2_t v21 = 0;
    if (v8)
    {
      *(void *)&__p[16] = v8;
      operator delete(v8);
    }
    if (v17[0])
    {
      v17[1] = v17[0];
      operator delete(v17[0]);
    }
    *(void *)v3->_anon_60 = 0;
    *(void *)&v3->_anon_60[8] = 0;
    *(_OWORD *)&v3->_anon_60[16] = xmmword_20B1E9460;
    __asm { FMOV            V1.4S, #-1.0 }
    *(_OWORD *)v3->_anon_80 = _Q1;
    *(_OWORD *)&v3->_anon_80[16] = 0u;
    *(_OWORD *)v3->_originatingOffset = 0u;
    v3->_voxelExtent = 1.0;
    value = v3->_octreeData.__ptr_.__value_;
    v3->_octreeData.__ptr_.__value_ = 0;
    if (value) {
      sub_20B159948((uint64_t)&v3->_octreeData, value);
    }
    v3->_levelSet = 0;
    v3->_interiorThickness = 0.0;
    v3->_exteriorThickness = 0.0;
    v15 = v3;
  }

  return v3;
}

- (MDLVoxelArray)initWithAsset:(MDLAsset *)asset divisions:(int)divisions patchRadius:(float)patchRadius
{
  uint64x2_t v9 = asset;
  if (divisions <= 0)
  {
    uint64x2_t v10 = (void *)MEMORY[0x263EFF940];
    int64x2_t v11 = (objc_class *)objc_opt_class();
    int64x2_t v12 = NSStringFromClass(v11);
    int64x2_t v13 = NSStringFromSelector(a2);
    objc_msgSend_raise_format_(v10, v14, @"ModelIOException", @"[%@ %@]: divisions must be greater than 0", v12, v13);
  }
  if (patchRadius < 0.0)
  {
    v15 = (void *)MEMORY[0x263EFF940];
    int v16 = (objc_class *)objc_opt_class();
    int8x16_t v17 = NSStringFromClass(v16);
    int8x16_t v18 = NSStringFromSelector(a2);
    objc_msgSend_raise_format_(v15, v19, @"ModelIOException", @"[%@ %@]: patchRadius must be greater or equal to 0", v17, v18);
  }
  v43.receiver = self;
  v43.super_class = (Class)MDLVoxelArray;
  long long v20 = [(MDLObject *)&v43 init];
  int64x2_t v21 = v20;
  objc_super v22 = v20;
  if (v20)
  {
    *(_OWORD *)int8x16_t v38 = 0u;
    *(_OWORD *)__p = 0u;
    *(_DWORD *)&__p[16] = 1065353216;
    sub_20B1598A4((uint64_t)&v20->_voxels, (uint64_t *)v38);
    sub_20B05F1D0((uint64_t)v38);
    sub_20B0DAE10(v38, v23);
    p_mortonCoder = &v21->mortonCoder;
    begin = v21->mortonCoder.mortonkeyX.__begin_;
    if (begin)
    {
      v21->mortonCoder.mortonkeyX.__end_ = begin;
      operator delete(begin);
      p_mortonCoder->mortonkeyX.__begin_ = 0;
      v21->mortonCoder.mortonkeyX.__end_ = 0;
      v21->mortonCoder.mortonkeyX.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&p_mortonCoder->mortonkeyX.__begin_ = *(_OWORD *)v38;
    v21->mortonCoder.mortonkeyX.__end_cap_.__value_ = *(unint64_t **)__p;
    v38[0] = 0;
    v38[1] = 0;
    *(void *)__p = 0;
    int64x2_t v26 = v21->mortonCoder.mortonkeyY.__begin_;
    if (v26)
    {
      v21->mortonCoder.mortonkeyY.__end_ = v26;
      operator delete(v26);
      v21->mortonCoder.mortonkeyY.__begin_ = 0;
      v21->mortonCoder.mortonkeyY.__end_ = 0;
      v21->mortonCoder.mortonkeyY.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&v21->mortonCoder.mortonkeyY.__begin_ = *(_OWORD *)&__p[8];
    v21->mortonCoder.mortonkeyY.__end_cap_.__value_ = v40;
    *(void *)&__p[8] = 0;
    *(void *)&__p[16] = 0;
    int8x16_t v40 = 0;
    uint64x2_t v27 = v21->mortonCoder.mortonkeyZ.__begin_;
    if (v27)
    {
      v21->mortonCoder.mortonkeyZ.__end_ = v27;
      operator delete(v27);
      v21->mortonCoder.mortonkeyZ.__begin_ = 0;
      v21->mortonCoder.mortonkeyZ.__end_ = 0;
      v21->mortonCoder.mortonkeyZ.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&v21->mortonCoder.mortonkeyZ.__begin_ = v41;
    v21->mortonCoder.mortonkeyZ.__end_cap_.__value_ = v42;
    long long v41 = 0uLL;
    int v42 = 0;
    if (*(void *)&__p[8])
    {
      *(void *)&__p[16] = *(void *)&__p[8];
      operator delete(*(void **)&__p[8]);
    }
    if (v38[0])
    {
      v38[1] = v38[0];
      operator delete(v38[0]);
    }
    *(void *)v21->_anon_60 = 0;
    *(void *)&v21->_anon_60[8] = 0;
    *(_OWORD *)&v21->_anon_60[16] = xmmword_20B1E9460;
    long long v28 = 0uLL;
    __asm { FMOV            V0.4S, #-1.0 }
    *(_OWORD *)v21->_anon_80 = _Q0;
    *(_OWORD *)&v21->_anon_80[16] = 0u;
    v22->_voxelExtent = 1.0;
    p_octreeData = &v21->_octreeData;
    value = p_octreeData->__ptr_.__value_;
    p_octreeData->__ptr_.__value_ = 0;
    if (value)
    {
      sub_20B159948((uint64_t)p_octreeData, value);
      long long v28 = 0uLL;
    }
    v22->_levelSet = 0;
    v22->_interiorThickness = 0.0;
    v22->_exteriorThickness = 0.0;
    *(_OWORD *)v22->_originatingOffset = v28;
    if (v9) {
      operator new();
    }
    int8x16_t v36 = v22;
  }

  return v22;
}

- (MDLVoxelArray)initWithData:(NSData *)voxelData boundingBox:(MDLAxisAlignedBoundingBox *)boundingBox voxelExtent:(float)voxelExtent
{
  float v7 = v6;
  float32x4_t v46 = v5;
  float32x4_t v47 = *(float32x4_t *)&voxelExtent;
  uint64x2_t v10 = voxelData;
  if (v7 <= 0.0)
  {
    int64x2_t v11 = (void *)MEMORY[0x263EFF940];
    int64x2_t v12 = (objc_class *)objc_opt_class();
    int64x2_t v13 = NSStringFromClass(v12);
    uint64x2_t v14 = NSStringFromSelector(a2);
    objc_msgSend_raise_format_(v11, v15, @"ModelIOException", @"[%@ %@]: voxelExtent must be greater than 0", v13, v14);
  }
  int16x4_t v16 = vmovn_s32(vcgtq_f32(v47, v46));
  if ((v16.i8[0] & 1) == 0 || (v16.i8[2] & 1) == 0 || (v16.i8[4] & 1) == 0)
  {
    int8x16_t v17 = (void *)MEMORY[0x263EFF940];
    int8x16_t v18 = (objc_class *)objc_opt_class();
    uint64_t v19 = NSStringFromClass(v18);
    long long v20 = NSStringFromSelector(a2);
    objc_msgSend_raise_format_(v17, v21, @"ModelIOException", @"[%@ %@]: maxBounds must be strictly greater than minBounds", v19, v20);
  }
  v53.receiver = self;
  v53.super_class = (Class)MDLVoxelArray;
  objc_super v22 = [(MDLObject *)&v53 init];
  uint64_t v23 = v22;
  if (v22)
  {
    *(_OWORD *)v48 = 0u;
    *(_OWORD *)__p = 0u;
    *(_DWORD *)&__p[16] = 1065353216;
    sub_20B1598A4((uint64_t)&v22->_voxels, (uint64_t *)v48);
    sub_20B05F1D0((uint64_t)v48);
    sub_20B0DAE10(v48, v24);
    p_mortonCoder = &v23->mortonCoder;
    begin = v23->mortonCoder.mortonkeyX.__begin_;
    if (begin)
    {
      v23->mortonCoder.mortonkeyX.__end_ = begin;
      operator delete(begin);
      p_mortonCoder->mortonkeyX.__begin_ = 0;
      v23->mortonCoder.mortonkeyX.__end_ = 0;
      v23->mortonCoder.mortonkeyX.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&p_mortonCoder->mortonkeyX.__begin_ = *(_OWORD *)v48;
    v23->mortonCoder.mortonkeyX.__end_cap_.__value_ = *(unint64_t **)__p;
    v48[0] = 0;
    v48[1] = 0;
    *(void *)__p = 0;
    uint64x2_t v27 = v23->mortonCoder.mortonkeyY.__begin_;
    if (v27)
    {
      v23->mortonCoder.mortonkeyY.__end_ = v27;
      operator delete(v27);
      v23->mortonCoder.mortonkeyY.__begin_ = 0;
      v23->mortonCoder.mortonkeyY.__end_ = 0;
      v23->mortonCoder.mortonkeyY.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&v23->mortonCoder.mortonkeyY.__begin_ = *(_OWORD *)&__p[8];
    v23->mortonCoder.mortonkeyY.__end_cap_.__value_ = v50;
    *(void *)&__p[8] = 0;
    *(void *)&__p[16] = 0;
    v50 = 0;
    long long v28 = v23->mortonCoder.mortonkeyZ.__begin_;
    if (v28)
    {
      v23->mortonCoder.mortonkeyZ.__end_ = v28;
      operator delete(v28);
      v23->mortonCoder.mortonkeyZ.__begin_ = 0;
      v23->mortonCoder.mortonkeyZ.__end_ = 0;
      v23->mortonCoder.mortonkeyZ.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&v23->mortonCoder.mortonkeyZ.__begin_ = v51;
    v23->mortonCoder.mortonkeyZ.__end_cap_.__value_ = v52;
    long long v51 = 0uLL;
    v52 = 0;
    if (*(void *)&__p[8])
    {
      *(void *)&__p[16] = *(void *)&__p[8];
      operator delete(*(void **)&__p[8]);
    }
    if (v48[0])
    {
      v48[1] = v48[0];
      operator delete(v48[0]);
    }
    *(void *)v23->_anon_60 = 0;
    *(void *)&v23->_anon_60[8] = 0;
    *(_OWORD *)&v23->_anon_60[16] = xmmword_20B1E9460;
    *(float32x4_t *)v23->_anon_80 = v47;
    *(float32x4_t *)&v23->_anon_80[16] = v46;
    *(_OWORD *)v23->_originatingOffset = 0u;
    v23->_voxelExtent = v7;
    value = v23->_octreeData.__ptr_.__value_;
    v23->_octreeData.__ptr_.__value_ = 0;
    if (value) {
      sub_20B159948((uint64_t)&v23->_octreeData, value);
    }
    v23->_levelSet = 0;
    v23->_interiorThickness = 0.0;
    v23->_exteriorThickness = 0.0;
    if (v10)
    {
      int8x16_t v30 = v10;
      if (objc_msgSend_bytes(v30, v31, v32))
      {
        int64x2_t v33 = v30;
        uint64_t v36 = objc_msgSend_bytes(v33, v34, v35);
        unint64_t v39 = objc_msgSend_length(v33, v37, v38);
        if (v39 >= 0x10)
        {
          unint64_t v42 = v39 >> 4;
          do
          {
            if ((*(_DWORD *)v36 & 0x80000000) == 0
              && (*(_DWORD *)(v36 + 4) & 0x80000000) == 0
              && (*(_DWORD *)(v36 + 8) & 0x80000000) == 0)
            {
              unint64_t v43 = HIDWORD(*(_OWORD *)v36);
              v48[0] = (void *)(p_mortonCoder->mortonkeyZ.__begin_[*(void *)(v36 + 8)] | ((p_mortonCoder->mortonkeyY.__begin_[((unsigned __int16)WORD2(*(void *)v36) >> 8)] | p_mortonCoder->mortonkeyZ.__begin_[BYTE1(*(void *)(v36 + 8))] | p_mortonCoder->mortonkeyX.__begin_[BYTE1(*(_OWORD *)v36)]) << 24) | p_mortonCoder->mortonkeyY.__begin_[BYTE4(*(void *)v36)] | p_mortonCoder->mortonkeyX.__begin_[*(_OWORD *)v36]);
              v48[1] = (void *)v43;
              sub_20B1599B0((uint64_t)&v23->_voxels, (unint64_t *)v48, (uint64_t)v48);
              v36 += 16;
            }
            --v42;
          }
          while (v42);
        }
        objc_msgSend_recalculateExtents(v23, v40, v41);
      }
    }
    int8x16_t v44 = v23;
  }

  return v23;
}

- (NSUInteger)count
{
  return self->_voxels.__table_.__p2_.__value_;
}

- (BOOL)voxelExistsAtIndex:(MDLVoxelIndex)index allowAnyX:(BOOL)allowAnyX allowAnyY:(BOOL)allowAnyY allowAnyZ:(BOOL)allowAnyZ allowAnyShell:(BOOL)allowAnyShell
{
  p_voxels = &self->_voxels;
  if (allowAnyX || allowAnyY || allowAnyZ || allowAnyShell)
  {
    next = (char *)p_voxels->__table_.__p1_.__value_.__next_;
    if (next)
    {
      uint64x2_t v12 = (uint64x2_t)vdupq_n_s64(1uLL);
      uint64x2_t v13 = (uint64x2_t)vdupq_n_s64(2uLL);
      int64x2_t v14 = vdupq_n_s64(4uLL);
      int64x2_t v15 = vdupq_n_s64(0xFFFFFFFFFFFFFFFELL);
      int64x2_t v16 = vdupq_n_s64(0xFFFFFFFFFFFFFFFCLL);
      uint64x2_t v17 = (uint64x2_t)vdupq_n_s64(0x15uLL);
      while (1)
      {
        int8x16_t v18 = (const double *)(next + 16);
        int8x16_t v19 = (int8x16_t)vld1q_dup_f64(v18);
        int8x16_t v20 = 0uLL;
        uint64_t v21 = 24;
        int64x2_t v22 = (int64x2_t)xmmword_20B1E6180;
        int64x2_t v23 = (int64x2_t)xmmword_20B1E6170;
        int64x2_t v24 = (int64x2_t)xmmword_20B1E6160;
        int64x2_t v25 = (int64x2_t)xmmword_20B1E6150;
        int8x16_t v26 = 0uLL;
        int8x16_t v27 = 0uLL;
        do
        {
          int64x2_t v28 = v25;
          v29.i64[0] = 3 * v25.i64[0];
          int64x2_t v30 = v24;
          v29.i64[1] = 3 * v28.i64[1];
          v31.i64[0] = 3 * v24.i64[0];
          v31.i64[1] = 3 * v30.i64[1];
          int8x16_t v32 = v27;
          int8x16_t v33 = v26;
          int8x16_t v34 = v20;
          int8x16_t v20 = vorrq_s8(v20, (int8x16_t)vuzp1q_s32((int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v12, v31), v19), (uint64x2_t)vnegq_s64(vaddq_s64(v30, v30))), (int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v12, v29), v19), (uint64x2_t)vnegq_s64(vaddq_s64(v28, v28)))));
          int64x2_t v35 = vaddq_s64((int64x2_t)v29, v23);
          int64x2_t v36 = vaddq_s64((int64x2_t)v31, v22);
          int8x16_t v27 = vorrq_s8(v27, (int8x16_t)vuzp1q_s32((int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v13, v31), v19), (uint64x2_t)vmvnq_s8((int8x16_t)v36)), (int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v13, v29), v19), (uint64x2_t)vmvnq_s8((int8x16_t)v35))));
          int8x16_t v26 = vorrq_s8(v26, (int8x16_t)vuzp1q_s32((int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64((uint64x2_t)v14, v31), v19), (uint64x2_t)vsubq_s64(v15, v36)), (int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64((uint64x2_t)v14, v29), v19), (uint64x2_t)vsubq_s64(v15, v35))));
          int64x2_t v23 = vaddq_s64(v23, v16);
          int64x2_t v22 = vaddq_s64(v22, v16);
          int64x2_t v25 = vaddq_s64(v28, v14);
          int64x2_t v24 = vaddq_s64(v30, v14);
          v21 -= 4;
        }
        while (v21);
        int8x16_t v37 = (int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64(v17, (uint64x2_t)v30), (int32x4_t)vcgtq_u64(v17, (uint64x2_t)v28));
        int8x16_t v38 = vbslq_s8(v37, v27, v32);
        int8x16_t v39 = vbslq_s8(v37, v20, v34);
        int8x8_t v40 = vorr_s8(*(int8x8_t *)v38.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v38, v38, 8uLL));
        *(int8x8_t *)v39.i8 = vorr_s8(*(int8x8_t *)v39.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v39, v39, 8uLL));
        BOOL v41 = (v39.i32[0] | v39.i32[1]) == index.i32[0] || allowAnyX;
        BOOL v42 = (v40.i32[0] | v40.i32[1]) == index.i32[1] || allowAnyY;
        if (v41 && v42)
        {
          uint64x2_t v44 = (uint64x2_t)vdupq_n_s64(0x15uLL);
          int8x16_t v45 = vbslq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64(v44, (uint64x2_t)v30), (int32x4_t)vcgtq_u64(v44, (uint64x2_t)v28)), v26, v33);
          *(int8x8_t *)v45.i8 = vorr_s8(*(int8x8_t *)v45.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v45, v45, 8uLL));
          BOOL v46 = (v45.i32[0] | v45.i32[1]) == index.i32[2] || allowAnyZ;
          BOOL v47 = *((_DWORD *)next + 6) == index.i32[3] || allowAnyShell;
          if (v46 && v47) {
            break;
          }
        }
        next = *(char **)next;
        if (!next) {
          return 0;
        }
      }
      return 1;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    p_mortonCoder = &self->mortonCoder;
    unint64_t v48 = p_mortonCoder->mortonkeyZ.__begin_[index.u8[8]] | ((p_mortonCoder->mortonkeyY.__begin_[index.u8[5]] | p_mortonCoder->mortonkeyZ.__begin_[index.u8[9]] | p_mortonCoder->mortonkeyX.__begin_[index.u8[1]]) << 24) | p_mortonCoder->mortonkeyY.__begin_[index.u8[4]] | p_mortonCoder->mortonkeyX.__begin_[index.u8[0]];
    return sub_20B05FD64(p_voxels, &v48) != 0;
  }
}

- (NSData)voxelsWithinExtent:(MDLVoxelIndexExtent)extent
{
  v86[0] = (int32x4_t)extent.minimumExtent;
  v86[1] = (int32x4_t)extent.maximumExtent;
  p_voxels = &self->_voxels;
  next = (char *)self->_voxels.__table_.__p1_.__value_.__next_;
  if (next)
  {
    id v5 = 0;
    uint64x2_t v6 = (uint64x2_t)vdupq_n_s64(1uLL);
    uint64x2_t v7 = (uint64x2_t)vdupq_n_s64(2uLL);
    int64x2_t v8 = vdupq_n_s64(4uLL);
    int64x2_t v9 = vdupq_n_s64(0xFFFFFFFFFFFFFFFELL);
    int64x2_t v10 = vdupq_n_s64(0xFFFFFFFFFFFFFFFCLL);
    uint64x2_t v75 = (uint64x2_t)vdupq_n_s64(0x15uLL);
    uint64x2_t v83 = v7;
    uint64x2_t v84 = v6;
    int64x2_t v80 = v9;
    int64x2_t v82 = v8;
    int64x2_t v78 = v10;
    do
    {
      int64x2_t v11 = (const double *)(next + 16);
      int8x16_t v12 = (int8x16_t)vld1q_dup_f64(v11);
      int8x16_t v13 = 0uLL;
      uint64_t v14 = 24;
      int64x2_t v15 = (int64x2_t)xmmword_20B1E6180;
      int64x2_t v16 = (int64x2_t)xmmword_20B1E6170;
      int64x2_t v17 = (int64x2_t)xmmword_20B1E6160;
      int64x2_t v18 = (int64x2_t)xmmword_20B1E6150;
      int8x16_t v19 = 0uLL;
      int8x16_t v20 = 0uLL;
      do
      {
        int64x2_t v21 = v18;
        v22.i64[0] = 3 * v18.i64[0];
        int64x2_t v23 = v17;
        v22.i64[1] = 3 * v21.i64[1];
        v24.i64[0] = 3 * v17.i64[0];
        v24.i64[1] = 3 * v23.i64[1];
        int8x16_t v25 = v20;
        int8x16_t v26 = v19;
        int8x16_t v27 = v13;
        int8x16_t v13 = vorrq_s8(v13, (int8x16_t)vuzp1q_s32((int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v6, v24), v12), (uint64x2_t)vnegq_s64(vaddq_s64(v23, v23))), (int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v6, v22), v12), (uint64x2_t)vnegq_s64(vaddq_s64(v21, v21)))));
        int64x2_t v28 = vaddq_s64((int64x2_t)v22, v16);
        int64x2_t v29 = vaddq_s64((int64x2_t)v24, v15);
        int8x16_t v20 = vorrq_s8(v20, (int8x16_t)vuzp1q_s32((int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v7, v24), v12), (uint64x2_t)vmvnq_s8((int8x16_t)v29)), (int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v7, v22), v12), (uint64x2_t)vmvnq_s8((int8x16_t)v28))));
        int8x16_t v19 = vorrq_s8(v19, (int8x16_t)vuzp1q_s32((int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64((uint64x2_t)v8, v24), v12), (uint64x2_t)vsubq_s64(v9, v29)), (int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64((uint64x2_t)v8, v22), v12), (uint64x2_t)vsubq_s64(v9, v28))));
        int64x2_t v16 = vaddq_s64(v16, v10);
        int64x2_t v15 = vaddq_s64(v15, v10);
        int64x2_t v18 = vaddq_s64(v21, v8);
        int64x2_t v17 = vaddq_s64(v23, v8);
        v14 -= 4;
      }
      while (v14);
      int8x16_t v30 = (int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64(v75, (uint64x2_t)v23), (int32x4_t)vcgtq_u64(v75, (uint64x2_t)v21));
      int8x16_t v31 = vbslq_s8(v30, v20, v25);
      int8x16_t v32 = vbslq_s8(v30, v19, v26);
      int32x4_t v33 = (int32x4_t)vbslq_s8(v30, v13, v27);
      *(int8x8_t *)v30.i8 = vorr_s8(*(int8x8_t *)v31.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v31, v31, 8uLL));
      __int32 v34 = v30.i32[0] | v30.i32[1];
      *(int8x8_t *)v30.i8 = vorr_s8(*(int8x8_t *)v32.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v32, v32, 8uLL));
      *(int8x8_t *)v33.i8 = vorr_s8(*(int8x8_t *)v33.i8, (int8x8_t)*(_OWORD *)&vextq_s8((int8x16_t)v33, (int8x16_t)v33, 8uLL));
      v33.i32[0] |= v33.u32[1];
      v33.i32[1] = v34;
      v33.i32[2] = v30.i32[0] | v30.i32[1];
      v33.i32[3] = *((_DWORD *)next + 6);
      unsigned int v35 = sub_20B150680(v86, v33);
      int64x2_t v10 = v78;
      int64x2_t v9 = v80;
      int64x2_t v8 = v82;
      uint64x2_t v7 = v83;
      uint64x2_t v6 = v84;
      id v5 = (char *)v5 + v35;
      next = *(char **)next;
    }
    while (next);
    if (v5)
    {
      id v36 = objc_alloc(MEMORY[0x263EFF990]);
      id v5 = objc_msgSend_initWithLength_(v36, v37, 16 * (void)v5);
      uint64_t v40 = objc_msgSend_mutableBytes(v5, v38, v39);
      BOOL v41 = (char *)p_voxels->__table_.__p1_.__value_.__next_;
      if (v41)
      {
        BOOL v42 = (int32x4_t *)v40;
        uint64x2_t v43 = (uint64x2_t)vdupq_n_s64(1uLL);
        uint64x2_t v44 = (uint64x2_t)vdupq_n_s64(2uLL);
        int64x2_t v45 = vdupq_n_s64(4uLL);
        int64x2_t v46 = vdupq_n_s64(0xFFFFFFFFFFFFFFFELL);
        int64x2_t v47 = vdupq_n_s64(0xFFFFFFFFFFFFFFFCLL);
        uint64x2_t v73 = (uint64x2_t)vdupq_n_s64(0x15uLL);
        int64x2_t v74 = v47;
        uint64x2_t v81 = v43;
        int64x2_t v77 = v45;
        uint64x2_t v79 = v44;
        int64x2_t v76 = v46;
        do
        {
          unint64_t v48 = (const double *)(v41 + 16);
          int8x16_t v49 = (int8x16_t)vld1q_dup_f64(v48);
          int8x16_t v50 = 0uLL;
          uint64_t v51 = 24;
          int64x2_t v52 = (int64x2_t)xmmword_20B1E6180;
          int64x2_t v53 = (int64x2_t)xmmword_20B1E6170;
          int64x2_t v54 = (int64x2_t)xmmword_20B1E6160;
          int64x2_t v55 = (int64x2_t)xmmword_20B1E6150;
          int8x16_t v56 = 0uLL;
          int8x16_t v57 = 0uLL;
          do
          {
            int64x2_t v58 = v55;
            v59.i64[0] = 3 * v55.i64[0];
            int64x2_t v60 = v54;
            v59.i64[1] = 3 * v58.i64[1];
            v61.i64[0] = 3 * v54.i64[0];
            v61.i64[1] = 3 * v60.i64[1];
            int8x16_t v62 = v57;
            int8x16_t v63 = v56;
            int8x16_t v64 = v50;
            int8x16_t v50 = vorrq_s8(v50, (int8x16_t)vuzp1q_s32((int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v43, v61), v49), (uint64x2_t)vnegq_s64(vaddq_s64(v60, v60))), (int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v43, v59), v49), (uint64x2_t)vnegq_s64(vaddq_s64(v58, v58)))));
            int64x2_t v65 = vaddq_s64((int64x2_t)v59, v53);
            int64x2_t v66 = vaddq_s64((int64x2_t)v61, v52);
            int8x16_t v57 = vorrq_s8(v57, (int8x16_t)vuzp1q_s32((int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v44, v61), v49), (uint64x2_t)vmvnq_s8((int8x16_t)v66)), (int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v44, v59), v49), (uint64x2_t)vmvnq_s8((int8x16_t)v65))));
            int8x16_t v56 = vorrq_s8(v56, (int8x16_t)vuzp1q_s32((int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64((uint64x2_t)v45, v61), v49), (uint64x2_t)vsubq_s64(v46, v66)), (int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64((uint64x2_t)v45, v59), v49), (uint64x2_t)vsubq_s64(v46, v65))));
            int64x2_t v53 = vaddq_s64(v53, v47);
            int64x2_t v52 = vaddq_s64(v52, v47);
            int64x2_t v55 = vaddq_s64(v58, v45);
            int64x2_t v54 = vaddq_s64(v60, v45);
            v51 -= 4;
          }
          while (v51);
          int8x16_t v67 = (int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64(v73, (uint64x2_t)v60), (int32x4_t)vcgtq_u64(v73, (uint64x2_t)v58));
          int8x16_t v68 = vbslq_s8(v67, v57, v62);
          int8x16_t v69 = vbslq_s8(v67, v56, v63);
          int32x4_t v70 = (int32x4_t)vbslq_s8(v67, v50, v64);
          *(int8x8_t *)v67.i8 = vorr_s8(*(int8x8_t *)v68.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v68, v68, 8uLL));
          __int32 v71 = v67.i32[0] | v67.i32[1];
          *(int8x8_t *)v67.i8 = vorr_s8(*(int8x8_t *)v69.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v69, v69, 8uLL));
          *(int8x8_t *)v70.i8 = vorr_s8(*(int8x8_t *)v70.i8, (int8x8_t)*(_OWORD *)&vextq_s8((int8x16_t)v70, (int8x16_t)v70, 8uLL));
          v70.i32[0] |= v70.u32[1];
          v70.i32[1] = v71;
          v70.i64[1] = __PAIR64__(*((_DWORD *)v41 + 6), v67.i32[0] | v67.i32[1]);
          int32x4_t v85 = v70;
          if (sub_20B150680(v86, v70)) {
            *v42++ = v85;
          }
          BOOL v41 = *(char **)v41;
          uint64x2_t v44 = v79;
          uint64x2_t v43 = v81;
          int64x2_t v46 = v76;
          int64x2_t v45 = v77;
          int64x2_t v47 = v74;
        }
        while (v41);
      }
    }
  }
  else
  {
    id v5 = 0;
  }

  return (NSData *)v5;
}

- (NSData)voxelIndices
{
  p_voxels = &self->_voxels;
  unint64_t value = self->_voxels.__table_.__p2_.__value_;
  if (value)
  {
    id v4 = objc_alloc(MEMORY[0x263EFF990]);
    unint64_t value = (unint64_t) objc_msgSend_initWithLength_(v4, v5, 16 * value);
    int64x2_t v8 = (int8x16_t *)objc_msgSend_mutableBytes((void *)value, v6, v7);
    next = (char *)p_voxels->__table_.__p1_.__value_.__next_;
    if (next)
    {
      uint64x2_t v10 = (uint64x2_t)vdupq_n_s64(1uLL);
      uint64x2_t v11 = (uint64x2_t)vdupq_n_s64(2uLL);
      int64x2_t v12 = vdupq_n_s64(4uLL);
      int64x2_t v13 = vdupq_n_s64(0xFFFFFFFFFFFFFFFELL);
      int64x2_t v14 = vdupq_n_s64(0xFFFFFFFFFFFFFFFCLL);
      uint64x2_t v15 = (uint64x2_t)vdupq_n_s64(0x15uLL);
      do
      {
        int64x2_t v16 = (const double *)(next + 16);
        int8x16_t v17 = (int8x16_t)vld1q_dup_f64(v16);
        int8x16_t v18 = 0uLL;
        uint64_t v19 = 24;
        int64x2_t v20 = (int64x2_t)xmmword_20B1E6180;
        int64x2_t v21 = (int64x2_t)xmmword_20B1E6170;
        int64x2_t v22 = (int64x2_t)xmmword_20B1E6160;
        int64x2_t v23 = (int64x2_t)xmmword_20B1E6150;
        int8x16_t v24 = 0uLL;
        int8x16_t v25 = 0uLL;
        do
        {
          int64x2_t v26 = v23;
          v27.i64[0] = 3 * v23.i64[0];
          int64x2_t v28 = v22;
          v27.i64[1] = 3 * v26.i64[1];
          v29.i64[0] = 3 * v22.i64[0];
          v29.i64[1] = 3 * v28.i64[1];
          int8x16_t v30 = v25;
          int8x16_t v31 = v24;
          int8x16_t v32 = v18;
          int8x16_t v18 = vorrq_s8(v18, (int8x16_t)vuzp1q_s32((int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v10, v29), v17), (uint64x2_t)vnegq_s64(vaddq_s64(v28, v28))), (int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v10, v27), v17), (uint64x2_t)vnegq_s64(vaddq_s64(v26, v26)))));
          int64x2_t v33 = vaddq_s64((int64x2_t)v27, v21);
          int64x2_t v34 = vaddq_s64((int64x2_t)v29, v20);
          int8x16_t v25 = vorrq_s8(v25, (int8x16_t)vuzp1q_s32((int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v11, v29), v17), (uint64x2_t)vmvnq_s8((int8x16_t)v34)), (int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v11, v27), v17), (uint64x2_t)vmvnq_s8((int8x16_t)v33))));
          int8x16_t v24 = vorrq_s8(v24, (int8x16_t)vuzp1q_s32((int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64((uint64x2_t)v12, v29), v17), (uint64x2_t)vsubq_s64(v13, v34)), (int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64((uint64x2_t)v12, v27), v17), (uint64x2_t)vsubq_s64(v13, v33))));
          int64x2_t v21 = vaddq_s64(v21, v14);
          int64x2_t v20 = vaddq_s64(v20, v14);
          int64x2_t v23 = vaddq_s64(v26, v12);
          int64x2_t v22 = vaddq_s64(v28, v12);
          v19 -= 4;
        }
        while (v19);
        int8x16_t v35 = (int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64(v15, (uint64x2_t)v28), (int32x4_t)vcgtq_u64(v15, (uint64x2_t)v26));
        int8x16_t v36 = vbslq_s8(v35, v25, v30);
        int8x16_t v37 = vbslq_s8(v35, v24, v31);
        int8x16_t v38 = vbslq_s8(v35, v18, v32);
        *(int8x8_t *)v35.i8 = vorr_s8(*(int8x8_t *)v36.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v36, v36, 8uLL));
        __int32 v39 = v35.i32[0] | v35.i32[1];
        *(int8x8_t *)v35.i8 = vorr_s8(*(int8x8_t *)v37.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v37, v37, 8uLL));
        *(int8x8_t *)v38.i8 = vorr_s8(*(int8x8_t *)v38.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v38, v38, 8uLL));
        v38.i32[0] |= v38.u32[1];
        v38.i32[1] = v39;
        v38.i64[1] = __PAIR64__(*((_DWORD *)next + 6), v35.i32[0] | v35.i32[1]);
        *v8++ = v38;
        next = *(char **)next;
      }
      while (next);
    }
  }

  return (NSData *)(id)value;
}

- (void)setVoxelAtIndex:(MDLVoxelIndex)index
{
  if (((index.i32[0] | index.i32[1] | index.i32[2]) & 0x80000000) == 0)
  {
    v7[0] = self->mortonCoder.mortonkeyZ.__begin_[index.u8[8]] | ((self->mortonCoder.mortonkeyY.__begin_[index.u8[5]] | self->mortonCoder.mortonkeyZ.__begin_[index.u8[9]] | self->mortonCoder.mortonkeyX.__begin_[index.u8[1]]) << 24) | self->mortonCoder.mortonkeyY.__begin_[index.u8[4]] | self->mortonCoder.mortonkeyX.__begin_[index.u8[0]];
    v7[1] = index.u32[3];
    sub_20B1599B0((uint64_t)&self->_voxels, v7, (uint64_t)v7);
    objc_msgSend_recalculateExtents(self, v4, v5);
  }
  unint64_t value = self->_octreeData.__ptr_.__value_;
  self->_octreeData.__ptr_.__value_ = 0;
  if (value) {
    sub_20B159948((uint64_t)&self->_octreeData, value);
  }
  self->_levelSet = 0;
  self->_interiorThickness = 0.0;
  self->_exteriorThickness = 0.0;
}

- (void)setVoxelsForMesh:(MDLMesh *)mesh divisions:(int)divisions patchRadius:(float)patchRadius
{
  int64x2_t v8 = mesh;
  if (divisions <= 0)
  {
    int64x2_t v9 = (void *)MEMORY[0x263EFF940];
    uint64x2_t v10 = (objc_class *)objc_opt_class();
    uint64x2_t v11 = NSStringFromClass(v10);
    int64x2_t v12 = NSStringFromSelector(a2);
    objc_msgSend_raise_format_(v9, v13, @"ModelIOException", @"[%@ %@]: divisions must be greater than 0", v11, v12);
  }
  if (patchRadius < 0.0)
  {
    int64x2_t v14 = (void *)MEMORY[0x263EFF940];
    uint64x2_t v15 = (objc_class *)objc_opt_class();
    int64x2_t v16 = NSStringFromClass(v15);
    int8x16_t v17 = NSStringFromSelector(a2);
    objc_msgSend_raise_format_(v14, v18, @"ModelIOException", @"[%@ %@]: patchRadius must be greater or equal to 0", v16, v17);
  }
  if (v8) {
    operator new();
  }
}

- (void)unionWithVoxels:(MDLVoxelArray *)voxels
{
  uint64x2_t v6 = voxels;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v14 = 1065353216;
  for (i = v6->_voxels.__table_.__p1_.__value_.__next_; i; i = *(_OWORD **)i)
  {
    long long v11 = i[1];
    DWORD2(v11) = 0;
    sub_20B159BD8((uint64_t)&v12, (unint64_t *)&v11, &v11);
  }
  p_voxels = &self->_voxels;
  for (j = self->_voxels.__table_.__p1_.__value_.__next_; j; j = *(_OWORD **)j)
  {
    long long v11 = j[1];
    DWORD2(v11) = 0;
    sub_20B159BD8((uint64_t)&v12, (unint64_t *)&v11, &v11);
  }
  if (p_voxels != (unordered_map<unsigned long long, int, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, int>>> *)&v12)
  {
    LODWORD(self->_voxels.__table_.__p3_.__value_) = v14;
    sub_20B159DF8(p_voxels, (uint64_t *)v13, 0);
  }
  objc_msgSend_recalculateExtents(self, v4, v5);
  unint64_t value = self->_octreeData.__ptr_.__value_;
  self->_octreeData.__ptr_.__value_ = 0;
  if (value) {
    sub_20B159948((uint64_t)&self->_octreeData, value);
  }
  self->_levelSet = 0;
  self->_interiorThickness = 0.0;
  self->_exteriorThickness = 0.0;
  sub_20B05F1D0((uint64_t)&v12);
}

- (void)intersectWithVoxels:(MDLVoxelArray *)voxels
{
  id v4 = voxels;
  uint64_t v7 = v4;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v14 = 1065353216;
  next = self->_voxels.__table_.__p1_.__value_.__next_;
  if (next)
  {
    p_voxels = &v4->_voxels;
    do
    {
      long long v11 = next[1];
      if (sub_20B05FD64(p_voxels, (unint64_t *)&v11))
      {
        DWORD2(v11) = 0;
        sub_20B159BD8((uint64_t)&v12, (unint64_t *)&v11, &v11);
      }
      next = *(_OWORD **)next;
    }
    while (next);
  }
  if (&self->_voxels != (unordered_map<unsigned long long, int, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, int>>> *)&v12)
  {
    LODWORD(self->_voxels.__table_.__p3_.__value_) = v14;
    sub_20B159DF8(&self->_voxels.__table_.__bucket_list_.__ptr_.__value_, (uint64_t *)v13, 0);
  }
  objc_msgSend_recalculateExtents(self, v5, v6);
  unint64_t value = self->_octreeData.__ptr_.__value_;
  self->_octreeData.__ptr_.__value_ = 0;
  if (value) {
    sub_20B159948((uint64_t)&self->_octreeData, value);
  }
  self->_levelSet = 0;
  self->_interiorThickness = 0.0;
  self->_exteriorThickness = 0.0;
  sub_20B05F1D0((uint64_t)&v12);
}

- (void)differenceWithVoxels:(MDLVoxelArray *)voxels
{
  id v4 = voxels;
  uint64_t v7 = v4;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v14 = 1065353216;
  next = self->_voxels.__table_.__p1_.__value_.__next_;
  if (next)
  {
    p_voxels = &v4->_voxels;
    do
    {
      long long v11 = next[1];
      if (!sub_20B05FD64(p_voxels, (unint64_t *)&v11))
      {
        DWORD2(v11) = 0;
        sub_20B159BD8((uint64_t)&v12, (unint64_t *)&v11, &v11);
      }
      next = *(_OWORD **)next;
    }
    while (next);
  }
  if (&self->_voxels != (unordered_map<unsigned long long, int, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, int>>> *)&v12)
  {
    LODWORD(self->_voxels.__table_.__p3_.__value_) = v14;
    sub_20B159DF8(&self->_voxels.__table_.__bucket_list_.__ptr_.__value_, (uint64_t *)v13, 0);
  }
  objc_msgSend_recalculateExtents(self, v5, v6);
  unint64_t value = self->_octreeData.__ptr_.__value_;
  self->_octreeData.__ptr_.__value_ = 0;
  if (value) {
    sub_20B159948((uint64_t)&self->_octreeData, value);
  }
  self->_levelSet = 0;
  self->_interiorThickness = 0.0;
  self->_exteriorThickness = 0.0;
  sub_20B05F1D0((uint64_t)&v12);
}

- (MDLAxisAlignedBoundingBox)boundingBox
{
  return self;
}

- (MDLVoxelIndex)indexOfSpatialLocation:(vector_float3)location
{
  v4.i32[0] = LODWORD(self->_voxelExtent);
  *(float *)v5.i32 = *(float *)v4.i32 * 0.5;
  float32x4_t v6 = vsubq_f32(vsubq_f32(v3, *(float32x4_t *)self->_originatingOffset), (float32x4_t)vdupq_lane_s32(v5, 0));
  __asm { FMOV            V2.4S, #1.0 }
  float32x4_t v12 = vmulq_f32(v6, vdivq_f32(_Q2, (float32x4_t)vdupq_lane_s32(v4, 0)));
  *(int32x2_t *)result.i8 = vcvt_s32_f32(vrnda_f32(*(float32x2_t *)v12.f32));
  result.i64[1] = llroundf(v12.f32[2]);
  return result;
}

- (vector_float3)spatialLocationOfIndex:(MDLVoxelIndex)index
{
  __asm { FMOV            V2.4S, #1.0 }
  result.i64[1] = (uint64_t)a2;
  result.i64[0] = (uint64_t)self;
  return result;
}

- (MDLAxisAlignedBoundingBox)voxelBoundingBoxAtIndex:(SEL)a3
{
  return (MDLAxisAlignedBoundingBox *)objc_msgSend_spatialLocationOfIndex_(self, a3, v4, *(double *)index.i64);
}

- (void)convertToSignedShellField
{
  unint64_t value = self->_octreeData.__ptr_.__value_;
  if (value && *(void *)value)
  {
    sub_20B05ABA0((uint64_t)value);
    sub_20B05AB00((uint64_t)self->_octreeData.__ptr_.__value_);
    long long v6 = 0u;
    long long v7 = 0u;
    uint64_t v8 = 1065353216;
    sub_20B14F038(&self->mortonCoder.mortonkeyX.__begin_, (uint64_t)&v6, *(void *)self->_octreeData.__ptr_.__value_);
    if (&self->_voxels != (unordered_map<unsigned long long, int, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, int>>> *)&v6)
    {
      LODWORD(self->_voxels.__table_.__p3_.__value_) = v8;
      sub_20B159DF8(&self->_voxels.__table_.__bucket_list_.__ptr_.__value_, (uint64_t *)v7, 0);
    }
    objc_msgSend_recalculateExtents(self, v4, v5);
    self->_levelSet = 1;
    sub_20B05F1D0((uint64_t)&v6);
  }
}

- (BOOL)isValidSignedShellField
{
  return self->_levelSet;
}

- (void)setShellFieldInteriorThickness:(float)shellFieldInteriorThickness
{
  if (shellFieldInteriorThickness < 0.0)
  {
    uint64_t v8 = (void *)MEMORY[0x263EFF940];
    int64x2_t v9 = (objc_class *)objc_opt_class();
    uint64x2_t v10 = NSStringFromClass(v9);
    long long v11 = NSStringFromSelector(a2);
    objc_msgSend_raise_format_(v8, v12, @"ModelIOException", @"[%@ %@]: thickness must be greater or equal to 0", v10, v11);
  }
  float interiorThickness = self->_interiorThickness;
  if (interiorThickness != shellFieldInteriorThickness)
  {
    *(float *)&double v4 = self->_exteriorThickness;
    if (interiorThickness >= shellFieldInteriorThickness)
    {
      *(float *)&double v15 = shellFieldInteriorThickness;
      objc_msgSend_erodeNarrowBandInteriorWidthTo_AndExteriorWidthTo_selector_(self, a2, (uint64_t)a2, v15, v4);
    }
    else
    {
      *(float *)&double v14 = shellFieldInteriorThickness;
      objc_msgSend_dilateNarrowBandInteriorWidthTo_AndExteriorWidthTo_(self, a2, v3, v14, v4);
    }
    self->_float interiorThickness = shellFieldInteriorThickness;
  }
}

- (void)setShellFieldExteriorThickness:(float)shellFieldExteriorThickness
{
  float v5 = shellFieldExteriorThickness;
  if (shellFieldExteriorThickness < 0.0)
  {
    uint64_t v8 = (void *)MEMORY[0x263EFF940];
    int64x2_t v9 = (objc_class *)objc_opt_class();
    uint64x2_t v10 = NSStringFromClass(v9);
    long long v11 = NSStringFromSelector(a2);
    objc_msgSend_raise_format_(v8, v12, @"ModelIOException", @"[%@ %@]: thickness must be greater or equal to 0", v10, v11);
  }
  float exteriorThickness = self->_exteriorThickness;
  if (exteriorThickness != v5)
  {
    shellFieldExteriorThickness = self->_interiorThickness;
    if (exteriorThickness >= v5)
    {
      *(float *)&double v4 = v5;
      objc_msgSend_erodeNarrowBandInteriorWidthTo_AndExteriorWidthTo_selector_(self, a2, (uint64_t)a2, *(double *)&shellFieldExteriorThickness, v4);
    }
    else
    {
      *(float *)&double v4 = v5;
      objc_msgSend_dilateNarrowBandInteriorWidthTo_AndExteriorWidthTo_(self, a2, v3, *(double *)&shellFieldExteriorThickness, v4);
    }
    self->_float exteriorThickness = v5;
  }
}

- (void)dilateNarrowBandInteriorWidthTo:(float)a3 AndExteriorWidthTo:(float)a4
{
  unint64_t value = self->_octreeData.__ptr_.__value_;
  if (value && *(void *)value && self->_levelSet)
  {
    sub_20B05B098((uint64_t)value, a3, a4);
    sub_20B05AB00((uint64_t)self->_octreeData.__ptr_.__value_);
    long long v8 = 0u;
    long long v9 = 0u;
    uint64_t v10 = 1065353216;
    sub_20B14F038(&self->mortonCoder.mortonkeyX.__begin_, (uint64_t)&v8, *(void *)self->_octreeData.__ptr_.__value_);
    if (&self->_voxels != (unordered_map<unsigned long long, int, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, int>>> *)&v8)
    {
      LODWORD(self->_voxels.__table_.__p3_.__value_) = v10;
      sub_20B159DF8(&self->_voxels.__table_.__bucket_list_.__ptr_.__value_, (uint64_t *)v9, 0);
    }
    objc_msgSend_recalculateExtents(self, v6, v7);
    sub_20B05F1D0((uint64_t)&v8);
  }
}

- (void)erodeNarrowBandInteriorWidthTo:(float)a3 AndExteriorWidthTo:(float)a4 selector:(SEL)a5
{
  if (a3 < 0.0)
  {
    long long v9 = (void *)MEMORY[0x263EFF940];
    uint64_t v10 = (objc_class *)objc_opt_class();
    long long v11 = NSStringFromClass(v10);
    float32x4_t v12 = NSStringFromSelector(a5);
    objc_msgSend_raise_format_(v9, v13, @"ModelIOException", @"[%@ %@]: interiorNBWidth must be greater or equal to 0", v11, v12);
  }
  if (a4 < 0.0)
  {
    double v14 = (void *)MEMORY[0x263EFF940];
    double v15 = (objc_class *)objc_opt_class();
    int64x2_t v16 = NSStringFromClass(v15);
    int8x16_t v17 = NSStringFromSelector(a5);
    objc_msgSend_raise_format_(v14, v18, @"ModelIOException", @"[%@ %@]: exteriorNBWidth must be greater or equal to 0", v16, v17);
  }
  unint64_t value = (float32x4_t **)self->_octreeData.__ptr_.__value_;
  if (value && *value && self->_levelSet)
  {
    sub_20B05B690(value, a3, a4);
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v24 = 1065353216;
    sub_20B14F038(&self->mortonCoder.mortonkeyX.__begin_, (uint64_t)&v22, *(void *)self->_octreeData.__ptr_.__value_);
    if (&self->_voxels != (unordered_map<unsigned long long, int, std::hash<unsigned long long>, std::equal_to<unsigned long long>, std::allocator<std::pair<const unsigned long long, int>>> *)&v22)
    {
      LODWORD(self->_voxels.__table_.__p3_.__value_) = v24;
      sub_20B159DF8(&self->_voxels.__table_.__bucket_list_.__ptr_.__value_, (uint64_t *)v23, 0);
    }
    objc_msgSend_recalculateExtents(self, v20, v21);
    sub_20B05F1D0((uint64_t)&v22);
  }
}

- (MDLMesh)coarseMeshUsingAllocator:(id)allocator
{
  double v4 = (MDLMeshBufferDataAllocator *)allocator;
  float v5 = v4;
  unint64_t value = self->_octreeData.__ptr_.__value_;
  if (value)
  {
    float v7 = log2f((float)*((int *)value + 2));
    long long v8 = sub_20B04F3A0((uint64_t *)value, (int)v7, 1, 0);
  }
  else
  {
    v104 = v4;
    v128 = 0;
    v129 = 0;
    uint64_t v130 = 0;
    v125 = 0;
    v126 = 0;
    uint64_t v127 = 0;
    v122 = 0;
    v123 = 0;
    uint64_t v124 = 0;
    v119 = 0;
    v120 = 0;
    uint64_t v121 = 0;
    p_voxels = &self->_voxels;
    next = (char *)self->_voxels.__table_.__p1_.__value_.__next_;
    if (next)
    {
      uint64_t v10 = self->_voxels.__table_.__p1_.__value_.__next_;
      do
      {
        int v11 = v10[6];
        if (v11 < 0) {
          int v11 = -v11;
        }
        unsigned int v112 = v11;
        if (v11 > 0x10) {
          break;
        }
        uint64_t v10 = *(_DWORD **)v10;
      }
      while (v10);
      int v113 = 0;
      p_mortonCoder = &self->mortonCoder;
      uint64x2_t v13 = (uint64x2_t)vdupq_n_s64(1uLL);
      uint64x2_t v14 = (uint64x2_t)vdupq_n_s64(2uLL);
      int64x2_t v15 = vdupq_n_s64(4uLL);
      int64x2_t v16 = vdupq_n_s64(0xFFFFFFFFFFFFFFFELL);
      int64x2_t v17 = vdupq_n_s64(0xFFFFFFFFFFFFFFFCLL);
      uint64x2_t v111 = (uint64x2_t)vdupq_n_s64(0x15uLL);
      float32x4_t v105 = (float32x4_t)vdupq_n_s32(0x3B800000u);
      int64x2_t v106 = v17;
      uint64x2_t v109 = v14;
      uint64x2_t v110 = v13;
      int64x2_t v107 = v16;
      int64x2_t v108 = v15;
      do
      {
        int8x16_t v18 = (const double *)(next + 16);
        int v114 = *((_DWORD *)next + 6);
        int8x16_t v19 = (int8x16_t)vld1q_dup_f64(v18);
        int8x16_t v20 = 0uLL;
        uint64_t v21 = 24;
        int64x2_t v22 = (int64x2_t)xmmword_20B1E6180;
        int64x2_t v23 = (int64x2_t)xmmword_20B1E6170;
        int64x2_t v24 = (int64x2_t)xmmword_20B1E6160;
        int64x2_t v25 = (int64x2_t)xmmword_20B1E6150;
        int8x16_t v26 = 0uLL;
        int8x16_t v27 = 0uLL;
        do
        {
          int64x2_t v28 = v25;
          v29.i64[0] = 3 * v25.i64[0];
          int64x2_t v30 = v24;
          v29.i64[1] = 3 * v28.i64[1];
          v31.i64[0] = 3 * v24.i64[0];
          v31.i64[1] = 3 * v30.i64[1];
          int8x16_t v32 = v27;
          int8x16_t v33 = v26;
          int8x16_t v34 = v20;
          int8x16_t v20 = vorrq_s8(v20, (int8x16_t)vuzp1q_s32((int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v13, v31), v19), (uint64x2_t)vnegq_s64(vaddq_s64(v30, v30))), (int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v13, v29), v19), (uint64x2_t)vnegq_s64(vaddq_s64(v28, v28)))));
          int64x2_t v35 = vaddq_s64((int64x2_t)v29, v23);
          int64x2_t v36 = vaddq_s64((int64x2_t)v31, v22);
          int8x16_t v27 = vorrq_s8(v27, (int8x16_t)vuzp1q_s32((int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v14, v31), v19), (uint64x2_t)vmvnq_s8((int8x16_t)v36)), (int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v14, v29), v19), (uint64x2_t)vmvnq_s8((int8x16_t)v35))));
          int8x16_t v26 = vorrq_s8(v26, (int8x16_t)vuzp1q_s32((int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64((uint64x2_t)v15, v31), v19), (uint64x2_t)vsubq_s64(v16, v36)), (int32x4_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64((uint64x2_t)v15, v29), v19), (uint64x2_t)vsubq_s64(v16, v35))));
          int64x2_t v23 = vaddq_s64(v23, v17);
          int64x2_t v22 = vaddq_s64(v22, v17);
          int64x2_t v25 = vaddq_s64(v28, v15);
          int64x2_t v24 = vaddq_s64(v30, v15);
          v21 -= 4;
        }
        while (v21);
        v115 = (char **)next;
        int8x16_t v37 = (int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64(v111, (uint64x2_t)v30), (int32x4_t)vcgtq_u64(v111, (uint64x2_t)v28));
        int8x16_t v38 = vbslq_s8(v37, v27, v32);
        int8x16_t v39 = vbslq_s8(v37, v26, v33);
        int8x16_t v40 = vbslq_s8(v37, v20, v34);
        *(int8x8_t *)v37.i8 = vorr_s8(*(int8x8_t *)v38.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v38, v38, 8uLL));
        int v41 = v37.i32[0] | v37.i32[1];
        int8x8_t v42 = vorr_s8(*(int8x8_t *)v39.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v39, v39, 8uLL));
        int8x8_t v43 = vorr_s8(*(int8x8_t *)v40.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v40, v40, 8uLL));
        int v44 = v43.i32[0] | v43.i32[1];
        uint64_t v45 = ((unsigned __int16)(v42.i16[0] | v42.i16[2]) >> 8);
        uint64_t v46 = BYTE1(v41);
        int v116 = v42.i32[0] | v42.i32[1];
        uint64_t v47 = (v42.i8[0] | v42.i8[4]);
        if ((v43.i32[0] | v43.i32[1]) <= 1)
        {
          int v49 = v41;
          uint64_t v48 = v41;
          int v50 = 2;
        }
        else
        {
          uint64_t v48 = v41;
          unint64_t v118 = p_mortonCoder->mortonkeyZ.__begin_[(v42.i8[0] | v42.i8[4])] | ((p_mortonCoder->mortonkeyY.__begin_[BYTE1(v41)] | p_mortonCoder->mortonkeyZ.__begin_[((unsigned __int16)(v42.i16[0] | v42.i16[2]) >> 8)] | p_mortonCoder->mortonkeyX.__begin_[((unsigned __int16)((v43.i16[0] | v43.i16[2]) - 1) >> 8)]) << 24) | p_mortonCoder->mortonkeyY.__begin_[v41] | p_mortonCoder->mortonkeyX.__begin_[((v43.i8[0] | v43.i8[4]) - 1)];
          int v49 = v41;
          int v50 = 2 * (sub_20B05FD64(p_voxels, &v118) == 0);
        }
        unint64_t v118 = p_mortonCoder->mortonkeyZ.__begin_[v47] | ((p_mortonCoder->mortonkeyY.__begin_[v46] | p_mortonCoder->mortonkeyZ.__begin_[v45] | p_mortonCoder->mortonkeyX.__begin_[((unsigned __int16)(v44 + 1) >> 8)]) << 24) | p_mortonCoder->mortonkeyY.__begin_[v48] | p_mortonCoder->mortonkeyX.__begin_[(v44 + 1)];
        int v51 = v50 | (sub_20B05FD64(p_voxels, &v118) == 0);
        if (v49 < 2)
        {
          int v53 = v51 | 8;
          uint64_t v52 = v44;
        }
        else
        {
          uint64_t v52 = v44;
          unint64_t v118 = p_mortonCoder->mortonkeyZ.__begin_[v47] | ((p_mortonCoder->mortonkeyY.__begin_[((unsigned __int16)(v49 - 1) >> 8)] | p_mortonCoder->mortonkeyX.__begin_[BYTE1(v44)] | p_mortonCoder->mortonkeyZ.__begin_[v45]) << 24) | p_mortonCoder->mortonkeyY.__begin_[(v49 - 1)] | p_mortonCoder->mortonkeyX.__begin_[v44];
          int v53 = v51 | (8 * (sub_20B05FD64(p_voxels, &v118) == 0));
        }
        unint64_t v118 = p_mortonCoder->mortonkeyZ.__begin_[v47] | ((p_mortonCoder->mortonkeyY.__begin_[((unsigned __int16)(v49 + 1) >> 8)] | p_mortonCoder->mortonkeyZ.__begin_[v45] | p_mortonCoder->mortonkeyX.__begin_[BYTE1(v44)]) << 24) | p_mortonCoder->mortonkeyY.__begin_[(v49 + 1)] | p_mortonCoder->mortonkeyX.__begin_[v52];
        int v54 = v53 | (4 * (sub_20B05FD64(p_voxels, &v118) == 0));
        if (v116 < 2)
        {
          int v55 = v54 | 0x20;
        }
        else
        {
          unint64_t v118 = p_mortonCoder->mortonkeyZ.__begin_[(v116 - 1)] | ((p_mortonCoder->mortonkeyY.__begin_[v46] | p_mortonCoder->mortonkeyZ.__begin_[((unsigned __int16)(v116 - 1) >> 8)] | p_mortonCoder->mortonkeyX.__begin_[BYTE1(v44)]) << 24) | p_mortonCoder->mortonkeyY.__begin_[v48] | p_mortonCoder->mortonkeyX.__begin_[v52];
          int v55 = v54 | (32 * (sub_20B05FD64(p_voxels, &v118) == 0));
        }
        unint64_t v118 = p_mortonCoder->mortonkeyZ.__begin_[(v116 + 1)] | ((p_mortonCoder->mortonkeyY.__begin_[v46] | p_mortonCoder->mortonkeyZ.__begin_[((unsigned __int16)(v116 + 1) >> 8)] | p_mortonCoder->mortonkeyX.__begin_[BYTE1(v44)]) << 24) | p_mortonCoder->mortonkeyY.__begin_[v48] | p_mortonCoder->mortonkeyX.__begin_[v52];
        int v56 = v55 | (16 * (sub_20B05FD64(p_voxels, &v118) == 0));
        if (v56)
        {
          v57.f32[0] = (float)v44;
          v57.f32[1] = (float)v49;
          v57.f32[2] = (float)v116;
          __n128 v58 = (__n128)vmulq_f32(v57, v105);
          int v113 = sub_20B152200(v112 > 0x10, v114, v56, v113, &v119, (uint64_t)&v128, &v125, (uint64_t)&v122, v58, (__n128)vaddq_f32((float32x4_t)v58, v105));
        }
        uint64x2_t v14 = v109;
        uint64x2_t v13 = v110;
        int64x2_t v16 = v107;
        int64x2_t v15 = v108;
        int64x2_t v17 = v106;
        next = *v115;
      }
      while (*v115);
    }
    int64x2_t v60 = [MDLMesh alloc];
    uint64x2_t v61 = v104;
    if (!v104) {
      uint64x2_t v61 = objc_alloc_init(MDLMeshBufferDataAllocator);
    }
    long long v8 = objc_msgSend_initWithBufferAllocator_(v60, v59, (uint64_t)v61);
    if (!v104) {

    }
    int8x16_t v63 = objc_msgSend_stringWithFormat_(NSString, v62, @"%@-%@", @"Voxel", @"position");
    int64x2_t v65 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v64, (uint64_t)v128, v129 - v128);
    objc_msgSend_addAttributeWithName_format_type_data_stride_(v8, v66, (uint64_t)v63, 786435, @"position", v65, 12);

    int8x16_t v68 = objc_msgSend_stringWithFormat_(NSString, v67, @"%@-%@", @"Voxel", @"normal");
    int32x4_t v70 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v69, (uint64_t)v125, v126 - v125);
    objc_msgSend_addAttributeWithName_format_type_data_stride_(v8, v71, (uint64_t)v68, 786435, @"normal", v70, 12);

    if (v123 != v122)
    {
      uint64x2_t v73 = objc_msgSend_stringWithFormat_(NSString, v72, @"%@-%@", @"Voxel", @"color");
      uint64x2_t v75 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v74, (uint64_t)v122, v123 - v122);
      objc_msgSend_addAttributeWithName_format_type_data_stride_(v8, v76, (uint64_t)v73, 65540, @"color", v75, 4);
    }
    id v77 = objc_alloc(MEMORY[0x263EFF8F8]);
    uint64x2_t v79 = objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(v77, v78, (uint64_t)v119, v120 - v119, 0);
    int64x2_t v82 = objc_msgSend_allocator(v8, v80, v81);
    uint64x2_t v84 = objc_msgSend_newBufferWithData_type_(v82, v83, (uint64_t)v79, 2);

    if (objc_msgSend_conformsToProtocol_(v84, v85, (uint64_t)&unk_26BF5ED88))
    {
      id v86 = v84;
      v88 = objc_msgSend_stringByAppendingString_(@"Voxel", v87, @"-Indices");
      objc_msgSend_setName_(v86, v89, (uint64_t)v88);
    }
    v90 = [MDLMaterial alloc];
    v92 = objc_msgSend_stringByAppendingString_(@"Voxel", v91, @"-Material");
    v93 = objc_opt_new();
    v95 = objc_msgSend_initWithName_scatteringFunction_(v90, v94, (uint64_t)v92, v93);

    v96 = [MDLSubmesh alloc];
    v98 = objc_msgSend_initWithName_indexBuffer_indexCount_indexType_geometryType_material_topology_(v96, v97, @"submesh", v84, (v120 - v119) >> 2, 32, 2, v95, 0);
    objc_msgSend_setVertexCount_(v8, v99, ((v129 - v128) >> 2) / 3uLL);
    id v100 = objc_alloc_init(MEMORY[0x263EFF980]);
    objc_msgSend_addObject_(v100, v101, (uint64_t)v98);
    objc_msgSend_setSubmeshes_(v8, v102, (uint64_t)v100);

    if (v119)
    {
      v120 = v119;
      operator delete(v119);
    }
    float v5 = v104;
    if (v122)
    {
      v123 = v122;
      operator delete(v122);
    }
    if (v125)
    {
      v126 = v125;
      operator delete(v125);
    }
    if (v128)
    {
      v129 = v128;
      operator delete(v128);
    }
  }

  return (MDLMesh *)v8;
}

- (MDLMesh)coarseMesh
{
  return (MDLMesh *)MEMORY[0x270F9A6D0](self, sel_coarseMeshUsingAllocator_, 0);
}

- (MDLMesh)meshUsingAllocator:(id)allocator
{
  uint64_t v243 = *MEMORY[0x263EF8340];
  id v206 = allocator;
  unint64_t value = (uint64_t *)self->_octreeData.__ptr_.__value_;
  if (value && *value && self->_levelSet)
  {
    float v5 = sub_20B05BCB8(value);
    goto LABEL_137;
  }
  if (!v206) {
    id v206 = (id)objc_opt_new();
  }
  memset(v242, 0, sizeof(v242));
  bzero(v241, 0x400uLL);
  int v6 = 0;
  for (int i = 0; i != 8; ++i)
  {
    for (int j = 1; j < 5; j *= 2)
    {
      if (i <= (j ^ i))
      {
        long long v9 = (int *)v242 + v6;
        v6 += 2;
        *long long v9 = i;
        v9[1] = j ^ i;
      }
    }
  }
  uint64_t v10 = 0;
  v11.i64[0] = 0x100000001;
  v11.i64[1] = 0x100000001;
  int64x2_t v12 = vdupq_n_s64(8uLL);
  do
  {
    uint64_t v13 = 0;
    uint32x4_t v14 = (uint32x4_t)vdupq_n_s32(v10);
    int8x16_t v15 = 0uLL;
    int64x2_t v16 = (int64x2_t)xmmword_20B1E9480;
    int64x2_t v17 = (int64x2_t)xmmword_20B1E9470;
    do
    {
      int8x16_t v18 = (const float *)&v242[v13];
      float32x4x2_t v245 = vld2q_f32(v18);
      int8x16_t v15 = vorrq_s8(vbicq_s8((int8x16_t)vshlq_u32((uint32x4_t)v11, (uint32x4_t)vshrn_high_n_s64(vshrn_n_s64(v16, 1uLL), v17, 1uLL)), (int8x16_t)vceqzq_s32((int32x4_t)vandq_s8(veorq_s8((int8x16_t)vshlq_u32(v14, (uint32x4_t)vnegq_s32((int32x4_t)v245.val[1])), (int8x16_t)vshlq_u32(v14, (uint32x4_t)vnegq_s32((int32x4_t)v245.val[0]))), v11))), v15);
      int64x2_t v17 = vaddq_s64(v17, v12);
      int64x2_t v16 = vaddq_s64(v16, v12);
      v13 += 2;
    }
    while (v13 != 6);
    int8x8_t v19 = vorr_s8(*(int8x8_t *)v15.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v15, v15, 8uLL));
    v241[v10++] = v19.i32[0] | v19.i32[1];
  }
  while (v10 != 256);
  v232 = 0;
  v233 = 0;
  uint64_t v234 = 0;
  sub_20B0A2BE0((uint64_t)&v232, 0x1000uLL);
  objc_msgSend_voxelIndexExtent(self, v20, v21);
  int32x4_t v219 = v22;
  objc_msgSend_voxelIndexExtent(self, v23, v24);
  int32x4_t v213 = v25;
  objc_msgSend_voxelIndexExtent(self, v26, v27);
  long long v211 = v28;
  int32x4_t v29 = vsubq_s32(v219, v213);
  int v30 = v29.i32[1];
  int v222 = v29.i32[2];
  int v31 = v29.i32[0];
  v229 = 0;
  v230 = 0;
  v231 = 0;
  __p = 0;
  v227 = 0;
  v228 = 0;
  uint64_t v239 = 0;
  __int32 v32 = v29.i32[0] + 4;
  v237[0] = 1;
  v237[1] = v29.i32[0] + 4;
  int v33 = v29.i32[1] + 4;
  int v34 = (v29.i32[0] + 4) * (v29.i32[1] + 4);
  int v238 = v34;
  memset(v236, 0, sizeof(v236));
  unint64_t v35 = 2 * v34;
  if (v35 > (v233 - (unsigned char *)v232) >> 2) {
    sub_20B0A2BE0((uint64_t)&v232, v35);
  }
  int v36 = v222;
  int v240 = 0;
  if (v222 < -1) {
    goto LABEL_121;
  }
  int v209 = 0;
  v38.i32[3] = -1;
  *(int32x2_t *)v38.i8 = vadd_s32(*(int32x2_t *)&v211, (int32x2_t)-1);
  int v207 = v31 + 1;
  int v37 = v30 + 1;
  v38.i32[2] = DWORD2(v211) - 1;
  int32x4_t v220 = v38;
  int v205 = v36 + 1;
  int v39 = 1;
  unint64_t v40 = 0x267688000uLL;
  unint64_t v41 = 0x267688000uLL;
  v202 = self;
  int v200 = v31;
  int v201 = v30;
  int v198 = v33;
  __int32 v199 = v32;
  int v197 = v30 + 1;
  while (2)
  {
    HIDWORD(v239) = 0;
    if (v30 < -1) {
      goto LABEL_119;
    }
    int v212 = 0;
    int v42 = v32 + v32 * v39 * v33 + 1;
    int v203 = v39;
    int v204 = v34;
    while (2)
    {
      LODWORD(v239) = 0;
      if (v31 < -1) {
        goto LABEL_117;
      }
      int v43 = 0;
      int v44 = (Class *)((char *)&self->super.super.isa + *(int *)(v40 + 3816));
      uint64_t v45 = (Class *)((char *)&self->super.super.isa + *(int *)(v41 + 3824));
      uint64_t v46 = v42;
      do
      {
        uint64_t v208 = v46;
        int v47 = 0;
        LODWORD(v48) = 0;
        int v49 = 0;
        char v50 = 1;
        do
        {
          int v51 = 0;
          char v210 = v50;
          __int32 v52 = v47 + v209;
          char v53 = 1;
          do
          {
            int v54 = 0;
            char v214 = v53;
            __int32 v55 = v51 + v212;
            char v56 = v48;
            char v57 = 1;
            uint64_t v48 = (int)v48;
            do
            {
              v38.i32[0] = v54 + v43;
              v38.i32[1] = v55;
              char v58 = v57;
              v38.i32[2] = v52;
              int32x4_t v59 = vaddq_s32(v38, v220);
              unint64_t v225 = *(void *)(v45[6] + 8 * v59.u8[8]) | ((*(void *)(v45[3] + 8 * v59.u8[5]) | *(void *)(v45[6] + 8 * v59.u8[9]) | *(void *)(*v45 + 8 * v59.u8[1])) << 24) | *(void *)(v45[3] + 8 * v59.u8[4]) | *(void *)(*v45 + 8 * v59.u8[0]);
              int64x2_t v60 = sub_20B05FD64(v44, &v225);
              char v57 = 0;
              if (v60) {
                float v61 = 1.0;
              }
              else {
                float v61 = -1.0;
              }
              *((float *)v236 + v48) = v61;
              int v54 = 1;
              int v62 = 1 << v56;
              if (v60) {
                int v62 = 0;
              }
              v49 |= v62;
              ++v48;
              ++v56;
            }
            while ((v58 & 1) != 0);
            char v53 = 0;
            int v51 = 1;
          }
          while ((v214 & 1) != 0);
          char v50 = 0;
          int v47 = 1;
        }
        while ((v210 & 1) != 0);
        uint64_t v63 = v208;
        if (v49 && v49 != 255)
        {
          uint64_t v64 = 0;
          int v65 = 0;
          unsigned int v66 = v241[v49];
          long long v67 = 0uLL;
          do
          {
            if ((v66 >> v64))
            {
              int8x16_t v68 = (int *)v242 + 2 * v64;
              uint64_t v69 = *v68;
              uint64_t v70 = v68[1];
              int v71 = (int)*((float *)v236 + v69);
              ++v65;
              int v72 = (int)*((float *)v236 + v70);
              int v73 = v71 - v72;
              if (v71 != v72)
              {
                int v74 = 0;
                double v75 = (double)(v71 / v73);
                int v76 = 1;
                do
                {
                  int v77 = HIDWORD(v67);
                  int64x2_t v78 = (float *)((unint64_t)&v224 & 0xFFFFFFFFFFFFFFF3 | (4 * (v74 & 3)));
                  long long v224 = v67;
                  if ((v76 & v69) != 0) {
                    double v79 = 1.0;
                  }
                  else {
                    double v79 = 0.0;
                  }
                  if ((v76 & v69) != 0) {
                    double v80 = 1.0 - v75;
                  }
                  else {
                    double v80 = v75;
                  }
                  if ((v76 & v69) != (v76 & v70)) {
                    double v79 = v80;
                  }
                  float v81 = v79 + *v78;
                  *int64x2_t v78 = v81;
                  long long v67 = v224;
                  HIDWORD(v67) = v77;
                  ++v74;
                  v76 *= 2;
                }
                while (v74 != 3);
              }
            }
            ++v64;
          }
          while (v64 != 12);
          for (uint64_t k = 0; k != 3; ++k)
          {
            float v83 = (float)*((int *)&v239 + k);
            long long v223 = v67;
            *(float *)((unint64_t)&v223 & 0xFFFFFFFFFFFFFFF3 | (4 * (k & 3))) = v83
                                                                                       + (float)(*(float *)((unint64_t)&v223 & 0xFFFFFFFFFFFFFFF3 | (4 * (k & 3)))
                                                                                               * (float)(1.0 / (float)v65));
            long long v84 = v223;
            HIDWORD(v84) = HIDWORD(v67);
            long long v67 = v84;
          }
          long long v215 = v223;
          int32x4_t v85 = v229;
          id v86 = v230;
          uint64_t v87 = (v230 - (unsigned char *)v229) >> 4;
          *((_DWORD *)v232 + v208) = v87;
          if (v86 >= v231)
          {
            if ((unint64_t)(v87 + 1) >> 60) {
              sub_20B05D0BC();
            }
            uint64_t v89 = v231 - v85;
            uint64_t v90 = v89 >> 3;
            if (v89 >> 3 <= (unint64_t)(v87 + 1)) {
              uint64_t v90 = v87 + 1;
            }
            if ((unint64_t)v89 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v35 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v35 = v90;
            }
            if (v35) {
              v91 = (char *)sub_20B077E90((uint64_t)&v231, v35);
            }
            else {
              v91 = 0;
            }
            v92 = &v91[16 * v87];
            v38.i32[3] = HIDWORD(v215);
            *(_OWORD *)v92 = v215;
            v88 = v92 + 16;
            v94 = (char *)v229;
            v93 = v230;
            if (v230 != v229)
            {
              do
              {
                long long v95 = *((_OWORD *)v93 - 1);
                v93 -= 16;
                v38.i32[3] = HIDWORD(v95);
                *((_OWORD *)v92 - 1) = v95;
                v92 -= 16;
              }
              while (v93 != v94);
              v93 = (char *)v229;
            }
            v229 = v92;
            v230 = v88;
            v231 = &v91[16 * v35];
            if (v93) {
              operator delete(v93);
            }
            uint64_t v63 = v208;
          }
          else
          {
            v38.i32[3] = HIDWORD(v215);
            *(_OWORD *)id v86 = v215;
            v88 = v86 + 16;
          }
          unsigned int v96 = 0;
          v230 = v88;
          do
          {
            unsigned int v97 = v96 + 1;
            if (((v66 >> v96) & 1) == 0) {
              goto LABEL_113;
            }
            LODWORD(v98) = v96 - 2;
            uint64_t v98 = v96 >= 2 ? v98 : v97;
            if (!*((_DWORD *)&v239 + v98)) {
              goto LABEL_113;
            }
            uint64_t v99 = v96 ? v96 - 1 : 2;
            if (!*((_DWORD *)&v239 + v99)) {
              goto LABEL_113;
            }
            int v100 = v237[v98];
            uint64_t v101 = (int)v237[v99];
            v38.i32[0] = *((_DWORD *)v232 + v63);
            v102 = v227;
            if (v49)
            {
              int v107 = v63 - v100;
              v38.i32[1] = *((_DWORD *)v232 + v107);
              v38.i32[2] = *((_DWORD *)v232 + v107 - (int)v101);
              v38.i32[3] = *((_DWORD *)v232 + v63 - v101);
              if (v227 >= v228)
              {
                int32x4_t v217 = v38;
                uint64_t v109 = ((char *)v227 - (unsigned char *)__p) >> 4;
                if ((unint64_t)(v109 + 1) >> 60) {
                  sub_20B05D0BC();
                }
                unint64_t v110 = ((char *)v228 - (unsigned char *)__p) >> 3;
                if (v110 <= v109 + 1) {
                  unint64_t v110 = v109 + 1;
                }
                if ((unint64_t)((char *)v228 - (unsigned char *)__p) >= 0x7FFFFFFFFFFFFFF0) {
                  unint64_t v35 = 0xFFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v35 = v110;
                }
                if (v35) {
                  int64x2_t v106 = (char *)sub_20B077E90((uint64_t)&v228, v35);
                }
                else {
                  int64x2_t v106 = 0;
                }
                uint64x2_t v111 = (int32x4_t *)&v106[16 * v109];
                v38.i32[3] = v217.i32[3];
                *uint64x2_t v111 = v217;
                int64x2_t v108 = v111 + 1;
                v115 = (int32x4_t *)__p;
                unsigned int v112 = v227;
                if (v227 != __p)
                {
                  do
                  {
                    int32x4_t v116 = v112[-1];
                    --v112;
                    v38.i32[3] = v116.i32[3];
                    v111[-1] = v116;
                    --v111;
                  }
                  while (v112 != v115);
LABEL_108:
                  unsigned int v112 = (int32x4_t *)__p;
                }
LABEL_109:
                __p = v111;
                v227 = v108;
                v228 = (int32x4_t *)&v106[16 * v35];
                if (v112) {
                  operator delete(v112);
                }
                uint64_t v63 = v208;
                goto LABEL_112;
              }
            }
            else
            {
              v38.i32[1] = *((_DWORD *)v232 + v63 - v101);
              int v103 = v63 - v100;
              v38.i32[2] = *((_DWORD *)v232 + v103 - (int)v101);
              v38.i32[3] = *((_DWORD *)v232 + v103);
              if (v227 >= v228)
              {
                int32x4_t v216 = v38;
                uint64_t v104 = ((char *)v227 - (unsigned char *)__p) >> 4;
                if ((unint64_t)(v104 + 1) >> 60) {
                  sub_20B05D0BC();
                }
                unint64_t v105 = ((char *)v228 - (unsigned char *)__p) >> 3;
                if (v105 <= v104 + 1) {
                  unint64_t v105 = v104 + 1;
                }
                if ((unint64_t)((char *)v228 - (unsigned char *)__p) >= 0x7FFFFFFFFFFFFFF0) {
                  unint64_t v35 = 0xFFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v35 = v105;
                }
                if (v35) {
                  int64x2_t v106 = (char *)sub_20B077E90((uint64_t)&v228, v35);
                }
                else {
                  int64x2_t v106 = 0;
                }
                uint64x2_t v111 = (int32x4_t *)&v106[16 * v104];
                v38.i32[3] = v216.i32[3];
                *uint64x2_t v111 = v216;
                int64x2_t v108 = v111 + 1;
                int v113 = (int32x4_t *)__p;
                unsigned int v112 = v227;
                if (v227 != __p)
                {
                  do
                  {
                    int32x4_t v114 = v112[-1];
                    --v112;
                    v38.i32[3] = v114.i32[3];
                    v111[-1] = v114;
                    --v111;
                  }
                  while (v112 != v113);
                  goto LABEL_108;
                }
                goto LABEL_109;
              }
            }
            int32x4_t *v227 = v38;
            int64x2_t v108 = v102 + 1;
LABEL_112:
            v227 = v108;
LABEL_113:
            unsigned int v96 = v97;
          }
          while (v97 != 3);
        }
        LODWORD(v239) = v43 + 1;
        uint64_t v46 = v63 + 1;
        BOOL v117 = v43++ == v207;
      }
      while (!v117);
      int v42 = v46;
      self = v202;
      int v31 = v200;
      int v30 = v201;
      int v33 = v198;
      __int32 v32 = v199;
      int v39 = v203;
      int v34 = v204;
      int v37 = v197;
      unint64_t v40 = 0x267688000;
      unint64_t v41 = 0x267688000;
LABEL_117:
      HIDWORD(v239) = v212 + 1;
      v42 += 2;
      BOOL v117 = v212++ == v37;
      if (!v117) {
        continue;
      }
      break;
    }
LABEL_119:
    int v240 = v209 + 1;
    v39 ^= 1u;
    int v34 = -v34;
    int v238 = v34;
    BOOL v117 = v209++ == v205;
    if (!v117) {
      continue;
    }
    break;
  }
LABEL_121:
  objc_msgSend_dataWithLength_(MEMORY[0x263EFF990], (const char *)v35, 8 * ((((char *)v227 - (unsigned char *)__p) >> 3) + (((char *)v227 - (unsigned char *)__p) >> 4)));
  id v221 = objc_claimAutoreleasedReturnValue();
  uint64_t v120 = objc_msgSend_mutableBytes(v221, v118, v119);
  v122 = (int32x4_t *)__p;
  v123 = v227;
  while (v122 != v123)
  {
    int32x4_t v124 = *v122++;
    *(int32x4_t *)uint64_t v120 = vuzp1q_s32(v124, vuzp2q_s32(v124, vdupq_lane_s32(*(int32x2_t *)v124.i8, 0)));
    *(int32x2_t *)(v120 + 16) = vrev64_s32((int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v124, (int8x16_t)v124, 8uLL));
    v120 += 24;
  }
  v218 = objc_msgSend_newBufferWithData_type_(v206, v121, (uint64_t)v221, 2);
  if (objc_msgSend_conformsToProtocol_(v218, v125, (uint64_t)&unk_26BF5ED88))
  {
    id v126 = v218;
    v128 = objc_msgSend_stringByAppendingString_(@"Voxels", v127, @"-Indices");
    objc_msgSend_setName_(v126, v129, (uint64_t)v128);
  }
  uint64_t v130 = [MDLSubmesh alloc];
  v132 = __p;
  v131 = v227;
  v133 = [MDLMaterial alloc];
  v135 = objc_msgSend_stringByAppendingString_(@"Voxels", v134, @"-Material");
  v136 = objc_opt_new();
  v138 = objc_msgSend_initWithName_scatteringFunction_(v133, v137, (uint64_t)v135, v136);
  v140 = objc_msgSend_initWithIndexBuffer_indexCount_indexType_geometryType_material_(v130, v139, (uint64_t)v218, 2 * ((((char *)v131 - v132) >> 3) + (((char *)v131 - v132) >> 4)), 32, 2, v138);

  objc_msgSend_dataWithLength_(MEMORY[0x263EFF990], v141, 4 * (((v230 - (unsigned char *)v229) >> 3) + ((v230 - (unsigned char *)v229) >> 4)));
  id v142 = objc_claimAutoreleasedReturnValue();
  uint64_t v145 = objc_msgSend_mutableBytes(v142, v143, v144);
  v147 = (long long *)v229;
  v148 = (long long *)v230;
  while (v147 != v148)
  {
    long long v149 = *v147++;
    *(void *)uint64_t v145 = v149;
    *(_DWORD *)(v145 + 8) = DWORD2(v149);
    v145 += 12;
  }
  v150 = objc_msgSend_newBufferWithData_type_(v206, v146, (uint64_t)v142, 1);
  if (objc_msgSend_conformsToProtocol_(v150, v151, (uint64_t)&unk_26BF5ED88))
  {
    id v152 = v150;
    v154 = objc_msgSend_stringWithFormat_(NSString, v153, @"%@-%@", @"Voxels", @"position");
    objc_msgSend_setName_(v152, v155, (uint64_t)v154);
  }
  v156 = objc_opt_new();
  v159 = objc_msgSend_attributes(v156, v157, v158);
  v161 = objc_msgSend_objectAtIndexedSubscript_(v159, v160, 0);
  objc_msgSend_setName_(v161, v162, @"position");

  v165 = objc_msgSend_attributes(v156, v163, v164);
  v167 = objc_msgSend_objectAtIndexedSubscript_(v165, v166, 0);
  objc_msgSend_setFormat_(v167, v168, 786435);

  v171 = objc_msgSend_attributes(v156, v169, v170);
  v173 = objc_msgSend_objectAtIndexedSubscript_(v171, v172, 0);
  objc_msgSend_setOffset_(v173, v174, 0);

  v177 = objc_msgSend_attributes(v156, v175, v176);
  v179 = objc_msgSend_objectAtIndexedSubscript_(v177, v178, 0);
  objc_msgSend_setBufferIndex_(v179, v180, 0);

  v183 = objc_msgSend_layouts(v156, v181, v182);
  v185 = objc_msgSend_objectAtIndexedSubscript_(v183, v184, 0);
  objc_msgSend_setStride_(v185, v186, 12);

  v187 = [MDLMesh alloc];
  v189 = v229;
  v188 = v230;
  v235 = v140;
  v191 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v190, (uint64_t)&v235, 1);
  float v5 = objc_msgSend_initWithVertexBuffer_vertexCount_descriptor_submeshes_(v187, v192, (uint64_t)v150, (v188 - v189) >> 4, v156, v191);

  objc_msgSend_setName_(v5, v193, @"Voxels");
  LODWORD(v194) = 1045220557;
  objc_msgSend_addNormalsWithAttributeNamed_creaseThreshold_(v5, v195, @"normal", v194);

  if (__p)
  {
    v227 = (int32x4_t *)__p;
    operator delete(__p);
  }
  if (v229)
  {
    v230 = (char *)v229;
    operator delete(v229);
  }
  if (v232)
  {
    v233 = v232;
    operator delete(v232);
  }
LABEL_137:

  return (MDLMesh *)v5;
}

- (id)coarseVoxelMeshWithStyle:(unint64_t)a3
{
  unint64_t value = self->_octreeData.__ptr_.__value_;
  int v5 = (int)log2f((float)*((int *)value + 2));

  return sub_20B04F3A0((uint64_t *)value, v5, a3 == 2, a3 == 1);
}

- (vector<int,)boxesPerLayer
{
  unint64_t value = self->_octreeData.__ptr_.__value_;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  return (vector<int, std::allocator<int>> *)sub_20B081244(retstr, *((const void **)value + 6), *((void *)value + 7), (uint64_t)(*((void *)value + 7) - *((void *)value + 6)) >> 2);
}

- (MDLVoxelArray)initWithAsset:(MDLAsset *)asset divisions:(int)divisions interiorShells:(int)interiorShells exteriorShells:(int)exteriorShells patchRadius:(float)patchRadius
{
  uint64_t v10 = *(void *)&divisions;
  uint64_t v13 = asset;
  if ((int)v10 > 0)
  {
    if ((interiorShells & 0x80000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    int8x8_t v19 = (void *)MEMORY[0x263EFF940];
    int8x16_t v20 = (objc_class *)objc_opt_class();
    uint64_t v21 = NSStringFromClass(v20);
    int32x4_t v22 = NSStringFromSelector(a2);
    objc_msgSend_raise_format_(v19, v23, @"ModelIOException", @"[%@ %@]: interiorShells must be greater or equal to 0", v21, v22);

    if ((exteriorShells & 0x80000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  uint32x4_t v14 = (void *)MEMORY[0x263EFF940];
  int8x16_t v15 = (objc_class *)objc_opt_class();
  int64x2_t v16 = NSStringFromClass(v15);
  int64x2_t v17 = NSStringFromSelector(a2);
  objc_msgSend_raise_format_(v14, v18, @"ModelIOException", @"[%@ %@]: divisions must be greater than 0", v16, v17);

  if (interiorShells < 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((exteriorShells & 0x80000000) == 0) {
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v24 = (void *)MEMORY[0x263EFF940];
  int32x4_t v25 = (objc_class *)objc_opt_class();
  int8x16_t v26 = NSStringFromClass(v25);
  uint64_t v27 = NSStringFromSelector(a2);
  objc_msgSend_raise_format_(v24, v28, @"ModelIOException", @"[%@ %@]: exteriorShells must be greater or equal to 0", v26, v27);

LABEL_8:
  if (patchRadius < 0.0)
  {
    int32x4_t v29 = (void *)MEMORY[0x263EFF940];
    int v30 = (objc_class *)objc_opt_class();
    int v31 = NSStringFromClass(v30);
    __int32 v32 = NSStringFromSelector(a2);
    objc_msgSend_raise_format_(v29, v33, @"ModelIOException", @"[%@ %@]: patchRadius must be greater or equal to 0", v31, v32);
  }
  int v34 = [MDLVoxelArray alloc];
  *(float *)&double v35 = patchRadius;
  int v37 = (MDLVoxelArray *)objc_msgSend_initWithAsset_divisions_patchRadius_(v34, v36, (uint64_t)v13, v10, v35);
  objc_msgSend_convertToSignedShellField(v37, v38, v39);
  double v42 = 0.0;
  double v43 = 0.0;
  if (interiorShells >= 2)
  {
    double v43 = (float)(v37->_voxelExtent + v37->_voxelExtent) + (double)(interiorShells - 1) * 0.5 * v37->_voxelExtent;
    *(float *)&double v43 = v43;
  }
  if (exteriorShells >= 2)
  {
    double v42 = (float)(v37->_voxelExtent + v37->_voxelExtent) + (double)(exteriorShells - 1) * 0.5 * v37->_voxelExtent;
    *(float *)&double v42 = v42;
  }
  objc_msgSend_dilateNarrowBandInteriorWidthTo_AndExteriorWidthTo_(v37, v40, v41, v43, v42);

  return v37;
}

- (MDLVoxelArray)initWithAsset:(MDLAsset *)asset divisions:(int)divisions interiorNBWidth:(float)interiorNBWidth exteriorNBWidth:(float)exteriorNBWidth patchRadius:(float)patchRadius
{
  uint64_t v10 = *(void *)&divisions;
  uint64_t v13 = asset;
  if ((int)v10 <= 0)
  {
    uint32x4_t v14 = (void *)MEMORY[0x263EFF940];
    int8x16_t v15 = (objc_class *)objc_opt_class();
    int64x2_t v16 = NSStringFromClass(v15);
    int64x2_t v17 = NSStringFromSelector(a2);
    objc_msgSend_raise_format_(v14, v18, @"ModelIOException", @"[%@ %@]: divisions must be greater than 0", v16, v17);
  }
  if (interiorNBWidth < 0.0)
  {
    int8x8_t v19 = (void *)MEMORY[0x263EFF940];
    int8x16_t v20 = (objc_class *)objc_opt_class();
    uint64_t v21 = NSStringFromClass(v20);
    int32x4_t v22 = NSStringFromSelector(a2);
    objc_msgSend_raise_format_(v19, v23, @"ModelIOException", @"[%@ %@]: interiorNBWidth must be greater or equal to 0", v21, v22);
  }
  if (exteriorNBWidth < 0.0)
  {
    uint64_t v24 = (void *)MEMORY[0x263EFF940];
    int32x4_t v25 = (objc_class *)objc_opt_class();
    int8x16_t v26 = NSStringFromClass(v25);
    uint64_t v27 = NSStringFromSelector(a2);
    objc_msgSend_raise_format_(v24, v28, @"ModelIOException", @"[%@ %@]: exteriorNBWidth must be greater or equal to 0", v26, v27);
  }
  if (patchRadius < 0.0)
  {
    int32x4_t v29 = (void *)MEMORY[0x263EFF940];
    int v30 = (objc_class *)objc_opt_class();
    int v31 = NSStringFromClass(v30);
    __int32 v32 = NSStringFromSelector(a2);
    objc_msgSend_raise_format_(v29, v33, @"ModelIOException", @"[%@ %@]: patchRadius must be greater or equal to 0", v31, v32);
  }
  int v34 = [MDLVoxelArray alloc];
  *(float *)&double v35 = patchRadius;
  int v37 = (MDLVoxelArray *)objc_msgSend_initWithAsset_divisions_patchRadius_(v34, v36, (uint64_t)v13, v10, v35);
  objc_msgSend_convertToSignedShellField(v37, v38, v39);
  *(float *)&double v40 = interiorNBWidth;
  *(float *)&double v41 = exteriorNBWidth;
  objc_msgSend_dilateNarrowBandInteriorWidthTo_AndExteriorWidthTo_(v37, v42, v43, v40, v41);

  return v37;
}

- (void)setVoxelsForMesh:(MDLMesh *)mesh divisions:(int)divisions interiorShells:(int)interiorShells exteriorShells:(int)exteriorShells patchRadius:(float)patchRadius
{
  uint64_t v10 = *(void *)&divisions;
  double v41 = mesh;
  if ((int)v10 > 0)
  {
    if ((interiorShells & 0x80000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    int8x16_t v20 = (void *)MEMORY[0x263EFF940];
    uint64_t v21 = (objc_class *)objc_opt_class();
    int32x4_t v22 = NSStringFromClass(v21);
    int64x2_t v23 = NSStringFromSelector(a2);
    objc_msgSend_raise_format_(v20, v24, @"ModelIOException", @"[%@ %@]: interiorShells must be greater or equal to 0", v22, v23);

    if ((exteriorShells & 0x80000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  int8x16_t v15 = (void *)MEMORY[0x263EFF940];
  int64x2_t v16 = (objc_class *)objc_opt_class();
  int64x2_t v17 = NSStringFromClass(v16);
  int8x16_t v18 = NSStringFromSelector(a2);
  objc_msgSend_raise_format_(v15, v19, @"ModelIOException", @"[%@ %@]: divisions must be greater than 0", v17, v18);

  if (interiorShells < 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((exteriorShells & 0x80000000) == 0) {
    goto LABEL_8;
  }
LABEL_7:
  int32x4_t v25 = (void *)MEMORY[0x263EFF940];
  int8x16_t v26 = (objc_class *)objc_opt_class();
  uint64_t v27 = NSStringFromClass(v26);
  long long v28 = NSStringFromSelector(a2);
  objc_msgSend_raise_format_(v25, v29, @"ModelIOException", @"[%@ %@]: exteriorShells must be greater or equal to 0", v27, v28);

LABEL_8:
  if (patchRadius < 0.0)
  {
    int v30 = (void *)MEMORY[0x263EFF940];
    int v31 = (objc_class *)objc_opt_class();
    __int32 v32 = NSStringFromClass(v31);
    int v33 = NSStringFromSelector(a2);
    objc_msgSend_raise_format_(v30, v34, @"ModelIOException", @"[%@ %@]: patchRadius must be greater or equal to 0", v32, v33);
  }
  if (v41)
  {
    *(float *)&double v14 = patchRadius;
    objc_msgSend_setVoxelsForMesh_divisions_patchRadius_(self, v13, (uint64_t)v41, v10, v14);
    objc_msgSend_convertToSignedShellField(self, v35, v36);
    double v39 = 0.0;
    double v40 = 0.0;
    if (interiorShells >= 2)
    {
      double v40 = (float)(self->_voxelExtent + self->_voxelExtent) + (double)(interiorShells - 1) * 0.5 * self->_voxelExtent;
      *(float *)&double v40 = v40;
    }
    if (exteriorShells >= 2)
    {
      double v39 = (float)(self->_voxelExtent + self->_voxelExtent) + (double)(exteriorShells - 1) * 0.5 * self->_voxelExtent;
      *(float *)&double v39 = v39;
    }
    objc_msgSend_dilateNarrowBandInteriorWidthTo_AndExteriorWidthTo_(self, v37, v38, v40, v39);
  }

  MEMORY[0x270F9A790]();
}

- (void)setVoxelsForMesh:(MDLMesh *)mesh divisions:(int)divisions interiorNBWidth:(float)interiorNBWidth exteriorNBWidth:(float)exteriorNBWidth patchRadius:(float)patchRadius
{
  uint64_t v10 = *(void *)&divisions;
  double v41 = mesh;
  if ((int)v10 <= 0)
  {
    int8x16_t v15 = (void *)MEMORY[0x263EFF940];
    int64x2_t v16 = (objc_class *)objc_opt_class();
    int64x2_t v17 = NSStringFromClass(v16);
    int8x16_t v18 = NSStringFromSelector(a2);
    objc_msgSend_raise_format_(v15, v19, @"ModelIOException", @"[%@ %@]: divisions must be greater than 0", v17, v18);
  }
  if (interiorNBWidth < 0.0)
  {
    int8x16_t v20 = (void *)MEMORY[0x263EFF940];
    uint64_t v21 = (objc_class *)objc_opt_class();
    int32x4_t v22 = NSStringFromClass(v21);
    int64x2_t v23 = NSStringFromSelector(a2);
    objc_msgSend_raise_format_(v20, v24, @"ModelIOException", @"[%@ %@]: interiorNBWidth must be greater or equal to 0", v22, v23);
  }
  if (exteriorNBWidth < 0.0)
  {
    int32x4_t v25 = (void *)MEMORY[0x263EFF940];
    int8x16_t v26 = (objc_class *)objc_opt_class();
    uint64_t v27 = NSStringFromClass(v26);
    long long v28 = NSStringFromSelector(a2);
    objc_msgSend_raise_format_(v25, v29, @"ModelIOException", @"[%@ %@]: exteriorNBWidth must be greater or equal to 0", v27, v28);
  }
  if (patchRadius < 0.0)
  {
    int v30 = (void *)MEMORY[0x263EFF940];
    int v31 = (objc_class *)objc_opt_class();
    __int32 v32 = NSStringFromClass(v31);
    int v33 = NSStringFromSelector(a2);
    objc_msgSend_raise_format_(v30, v34, @"ModelIOException", @"[%@ %@]: patchRadius must be greater or equal to 0", v32, v33);
  }
  if (v41)
  {
    *(float *)&double v14 = patchRadius;
    objc_msgSend_setVoxelsForMesh_divisions_patchRadius_(self, v13, (uint64_t)v41, v10, v14);
    objc_msgSend_convertToSignedShellField(self, v35, v36);
    *(float *)&double v37 = interiorNBWidth;
    *(float *)&double v38 = exteriorNBWidth;
    objc_msgSend_dilateNarrowBandInteriorWidthTo_AndExteriorWidthTo_(self, v39, v40, v37, v38);
  }
}

- (MDLVoxelIndexExtent)voxelIndexExtent
{
  MDLVoxelIndex v2 = *(MDLVoxelIndex *)self->_anon_60;
  MDLVoxelIndex v3 = *(MDLVoxelIndex *)&self->_anon_60[16];
  result.maximumExtent = v3;
  result.minimumExtent = v2;
  return result;
}

- (float)shellFieldInteriorThickness
{
  return self->_interiorThickness;
}

- (float)shellFieldExteriorThickness
{
  return self->_exteriorThickness;
}

- (void).cxx_destruct
{
  p_octreeData = &self->_octreeData;
  unint64_t value = p_octreeData->__ptr_.__value_;
  p_octreeData->__ptr_.__value_ = 0;
  if (value) {
    sub_20B159948((uint64_t)p_octreeData, value);
  }
  p_mortonCoder = &self->mortonCoder;
  begin = self->mortonCoder.mortonkeyZ.__begin_;
  if (begin)
  {
    self->mortonCoder.mortonkeyZ.__end_ = begin;
    operator delete(begin);
  }
  float v7 = self->mortonCoder.mortonkeyY.__begin_;
  if (v7)
  {
    self->mortonCoder.mortonkeyY.__end_ = v7;
    operator delete(v7);
  }
  long long v8 = p_mortonCoder->mortonkeyX.__begin_;
  if (p_mortonCoder->mortonkeyX.__begin_)
  {
    self->mortonCoder.mortonkeyX.__end_ = v8;
    operator delete(v8);
  }

  sub_20B05F1D0((uint64_t)&self->_voxels);
}

- (id).cxx_construct
{
  self->_voxels.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&self->_voxels.__table_.__p1_.__value_.__next_ = 0u;
  self->_voxels.__table_.__p3_.__value_ = 1.0;
  sub_20B0DAE10(&self->mortonCoder, a2);
  self->_octreeData.__ptr_.__value_ = 0;
  return self;
}

@end