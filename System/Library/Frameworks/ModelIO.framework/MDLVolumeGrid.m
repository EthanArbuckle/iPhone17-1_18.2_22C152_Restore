@interface MDLVolumeGrid
- (MDLVolumeGrid)initWithAsset:(id)a3 divisions:(int)a4;
- (MDLVolumeGrid)initWithAsset:(id)a3 divisions:(int)a4 interiorWidth:(float)a5 exteriorWidth:(float)a6 patchRadius:(float)a7;
- (MDLVolumeGrid)initWithObject:(id)a3 divisions:(int)a4;
- (id).cxx_construct;
- (id)meshWithStyle:(unint64_t)a3;
- (unint64_t)trianglesIntersectingRayWithOrigin:(MDLVolumeGrid *)self direction:(SEL)a2 count:(unint64_t *)a3;
@end

@implementation MDLVolumeGrid

- (MDLVolumeGrid)initWithObject:(id)a3 divisions:(int)a4
{
  id v5 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MDLVolumeGrid;
  if ([(MDLVolumeGrid *)&v7 init]) {
    operator new();
  }

  return 0;
}

- (MDLVolumeGrid)initWithAsset:(id)a3 divisions:(int)a4
{
  id v5 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MDLVolumeGrid;
  if ([(MDLVolumeGrid *)&v7 init]) {
    operator new();
  }

  return 0;
}

- (MDLVolumeGrid)initWithAsset:(id)a3 divisions:(int)a4 interiorWidth:(float)a5 exteriorWidth:(float)a6 patchRadius:(float)a7
{
  return (MDLVolumeGrid *)MEMORY[0x270F9A6D0](self, sel_initWithAsset_divisions_, a3);
}

- (id)meshWithStyle:(unint64_t)a3
{
  uint64_t value = (uint64_t)self->_octree.__ptr_.__value_;
  if (value)
  {
    uint64_t value = sub_20B0B1EEC((uint64_t *)value, *(_DWORD *)(value + 144), a3 == 2, a3 == 1);
  }

  return (id)value;
}

- (unint64_t)trianglesIntersectingRayWithOrigin:(MDLVolumeGrid *)self direction:(SEL)a2 count:(unint64_t *)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  int32x4_t v5 = (int32x4_t)vmulq_f32(v4, v4);
  *(void *)&double v6 = vaddq_f32(vaddq_f32((float32x4_t)v5, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v5.i8, 1)), (float32x4_t)vdupq_laneq_s32(v5, 2)).u64[0];
  if (*(float *)&v6 <= 0.00000011921) {
    return 0;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v28 = 1065353216;
  memset(v29, 0, sizeof(v29));
  LODWORD(v29[0]) = 2139095039;
  float32x4_t v8 = vmulq_n_f32(v4, 1.0 / *(float *)&v6);
  char v23 = 0;
  int v25 = 0;
  v19[0] = _Q0;
  v19[1] = v8;
  __asm { FMOV            V0.2S, #1.0 }
  *(float32x2_t *)&_Q0 = vdiv_f32(*(float32x2_t *)&_Q0, *(float32x2_t *)v8.f32);
  v8.f32[0] = 1.0 / v8.f32[2];
  LODWORD(v6) = DWORD1(_Q0);
  *((float *)&_Q0 + 2) = 1.0 / v8.f32[2];
  v19[2] = _Q0;
  BOOL v20 = *(float *)&_Q0 < 0.0;
  BOOL v21 = *((float *)&_Q0 + 1) < 0.0;
  BOOL v22 = (float)(1.0 / v8.f32[2]) < 0.0;
  uint64_t v24 = 0x7F7FFFFF3C800000;
  sub_20B0B1DA0((uint64_t *)self->_octree.__ptr_.__value_, (uint64_t)v19, (uint64_t)v29, (uint64_t)&v26, 1.40444725e306, *(double *)v8.i64, v6, (float32x4_t)COERCE_UNSIGNED_INT(1.0));
  v13 = (unint64_t *)malloc_type_malloc(8 * *((void *)&v27 + 1), 0x100004000313F17uLL);
  v14 = v13;
  unint64_t v15 = v27;
  if ((void)v27)
  {
    uint64_t v16 = 0;
    do
    {
      unsigned int v17 = v16 + 1;
      v13[v16] = *(int *)(v15 + 16);
      unint64_t v15 = *(void *)v15;
      ++v16;
    }
    while (v15);
    unint64_t v15 = v17;
  }
  *a3 = v15;
  sub_20B05F1D0((uint64_t)&v26);
  return v14;
}

- (void).cxx_destruct
{
  uint64_t value = self->_octree.__ptr_.__value_;
  p_octree = &self->_octree;
  v3 = value;
  p_octree->__ptr_.__value_ = 0;
  if (value) {
    sub_20B106388((uint64_t)p_octree, v3);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end