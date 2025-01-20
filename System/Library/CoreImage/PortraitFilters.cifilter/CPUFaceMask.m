@interface CPUFaceMask
- (CPUFaceMask)init;
- (int)chromaDilateRadius;
- (int)chromaErodeRadius;
- (int)clearOutputMask:(char *)a3 WithBytesPerRow:(unint64_t)a4 OutputRegion:(CGRect)a5;
- (int)drawEyeMaskUsingQuads:(MetalFaceMaskEyeQuads_t *)a3 OutputMask:(char *)a4 OutputBytesPerRow:(unint64_t)a5 OutputRegion:(CGRect)a6;
- (int)lumaDilateRadius;
- (int)lumaErodeRadius;
- (int)trainSkinMaskUsingInputImage:(const char *)a3 InputBytesPerRow:(unint64_t)a4 InputRegion:(CGRect)a5 QuadRegion:(CGPoint)a6[4];
- (uint64_t)findSkinMaskUsingInputImage:(float64_t)a3 InputBytesPerRow:(float64x2_t)a4 InputRegion:(float64_t)a5 OutputMask:(float64_t)a6 OutputBytesPerRow:(float64_t)a7 OutputRegion:(float64_t)a8 FaceBounds:(float64_t)a9 SeedPoints:(uint64_t)a10 NumberOfSeedPoints:(uint64_t)a11 FillValue:(unint64_t)a12;
- (uint64_t)findToothMaskUsingInputImage:(float64x2_t)a3 InputBytesPerRow:(float64_t)a4 InputRegion:(float64_t)a5 OutputMask:(float64_t)a6 OutputBytesPerRow:(float64_t)a7 OutputRegion:(float64_t)a8 TeethBounds:(uint64_t)a9 SeedPoints:(uint64_t)a10 NumberOfSeedPoints:(uint64_t)a11 FillValue:(unint64_t)a12;
- (void)setChromaDilateRadius:(int)a3;
- (void)setChromaErodeRadius:(int)a3;
- (void)setLumaDilateRadius:(int)a3;
- (void)setLumaErodeRadius:(int)a3;
@end

@implementation CPUFaceMask

- (CPUFaceMask)init
{
  v3.receiver = self;
  v3.super_class = (Class)CPUFaceMask;
  result = [(CPUFaceMask *)&v3 init];
  if (result) {
    *(_OWORD *)&result->_lumaDilateRadius = xmmword_55E70;
  }
  return result;
}

- (int)clearOutputMask:(char *)a3 WithBytesPerRow:(unint64_t)a4 OutputRegion:(CGRect)a5
{
  if (!a3) {
    sub_4C2B0();
  }
  CGFloat y = a5.origin.y;
  *(float32x2_t *)v6.f32 = vrndm_f32(vcvt_f32_f64((float64x2_t)a5.origin));
  CGFloat height = a5.size.height;
  float64x2_t v8 = vaddq_f64((float64x2_t)a5.origin, (float64x2_t)a5.size);
  __asm { FMOV            V2.2D, #-1.0 }
  *(float32x2_t *)&v6.u32[2] = vrndp_f32(vcvt_f32_f64(vaddq_f64(v8, _Q2)));
  int32x4_t v14 = vcvtq_s32_f32(v6);
  sub_2DF94((uint64_t)a3, a4, (int8x16_t)v14, v14);
  return 0;
}

- (int)trainSkinMaskUsingInputImage:(const char *)a3 InputBytesPerRow:(unint64_t)a4 InputRegion:(CGRect)a5 QuadRegion:(CGPoint)a6[4]
{
  if (!a3) {
    sub_4C2DC();
  }
  anon_10010 = (float32x4_t *)self->_anon_10010;
  char v9 = vaddvq_s32(*(int32x4_t *)&self->_lumaDilateRadius);
  if (v9) {
    p_colorCube = &self->_colorCube;
  }
  else {
    p_colorCube = &self->_tempColorCube;
  }
  int32x2_t v11 = vmovn_s64(vcvtq_s64_f64(*(float64x2_t *)a6));
  int32x2_t v12 = vmovn_s64(vcvtq_s64_f64((float64x2_t)a6[1]));
  int32x2_t v13 = vmovn_s64(vcvtq_s64_f64((float64x2_t)a6[2]));
  int32x2_t v14 = vmovn_s64(vcvtq_s64_f64((float64x2_t)a6[3]));
  *(int32x2_t *)v15.i8 = vmin_s32(vmin_s32(v11, v12), vmin_s32(v13, v14));
  v15.u64[1] = (unint64_t)vmax_s32(vmax_s32(v11, v12), vmax_s32(v13, v14));
  if (v9) {
    p_tempColorCube = &self->_tempColorCube;
  }
  else {
    p_tempColorCube = &self->_colorCube;
  }
  CGFloat y = a5.origin.y;
  CGFloat height = a5.size.height;
  *(float32x2_t *)v19.f32 = vrndm_f32(vcvt_f32_f64((float64x2_t)a5.origin));
  float64x2_t v20 = vaddq_f64((float64x2_t)a5.origin, (float64x2_t)a5.size);
  __asm { FMOV            V2.2D, #-1.0 }
  *(float32x2_t *)&v19.u32[2] = vrndp_f32(vcvt_f32_f64(vaddq_f64(v20, _Q2)));
  int32x4_t v58 = vcvtq_s32_f32(v19);
  int8x16_t v59 = v15;
  float32x4_t v62 = 0uLL;
  uint64_t v63 = 0;
  sub_2E068((uint64_t)&v62);
  sub_2E080((uint64_t)&v62, (uint64_t)a3, a4, v59, v58, v11, v12, v13, v14);
  float32x4_t v60 = v62;
  uint64_t v61 = v63;
  sub_2E354((uint64_t)&v60, anon_10010, v62, v26, v27);
  sub_2E3E8((uint64_t)a3, a4, (uint64_t)p_tempColorCube, v59, v58, *anon_10010, anon_10010[1], v11, v12, v13, v14);
  if (anon_10010[2].i32[0] < 1)
  {
    v37 = p_colorCube;
  }
  else
  {
    __int32 v36 = 0;
    do
    {
      v37 = p_tempColorCube;
      sub_2E690((uint64_t)p_tempColorCube, p_colorCube, v28, v29, v30, v31, v32.n128_f64[0], v33.n128_f64[0], v34);
      ++v36;
      p_tempColorCube = p_colorCube;
      p_colorCube = v37;
    }
    while (v36 < anon_10010[2].i32[0]);
  }
  int v38 = anon_10010[2].i32[2];
  __int32 v39 = anon_10010[2].i32[3];
  _VF = __OFSUB__(v38, v39);
  int v41 = v38 - v39;
  char v40 = (v41 < 0) ^ _VF | (v41 == 0);
  int v42 = v41 + 1;
  *(float *)&double v28 = (float)v42;
  LODWORD(v29) = 1.0;
  if (v40) {
    float v43 = 1.0;
  }
  else {
    float v43 = (float)v42;
  }
  if (v38 < 1)
  {
    v45 = v37;
  }
  else
  {
    uint64_t v44 = 0;
    do
    {
      v45 = p_tempColorCube;
      __int32 v46 = anon_10010[2].i32[3];
      float v47 = -1.0;
      _VF = __OFSUB__(v44, v46);
      int v48 = v44 - v46;
      if (v48 < 0 == _VF) {
        float v47 = (float)(v48 + 1) / v43;
      }
      NSLog(@"ChromaDilation %d: minDilateLuma=%f", v44, v47);
      float32x4_t v51 = *anon_10010;
      float32x4_t v52 = anon_10010[1];
      if (v44) {
        sub_2EAA0((uint64_t)p_tempColorCube, (uint64_t)v37, v51.f32[0], v52.f32[0], v47, v49, v50);
      }
      else {
        sub_2E838((uint64_t)p_tempColorCube, v37, v51.f32[0], v52.f32[0], v47);
      }
      uint64_t v44 = (v44 + 1);
      p_tempColorCube = v37;
      v37 = v45;
    }
    while ((int)v44 < anon_10010[2].i32[2]);
  }
  if (anon_10010[2].i32[1] < 1)
  {
    v54 = v45;
  }
  else
  {
    __int32 v53 = 0;
    do
    {
      v54 = p_tempColorCube;
      sub_2EC1C((uint64_t)p_tempColorCube, v45, v28, v29, v30, v31, v32.n128_f64[0], v33);
      ++v53;
      p_tempColorCube = v45;
      v45 = v54;
    }
    while (v53 < anon_10010[2].i32[1]);
  }
  if (anon_10010[2].i32[3] >= 1)
  {
    __int32 v55 = 0;
    do
    {
      v56 = p_tempColorCube;
      if (v55) {
        sub_2EEE8((uint64_t)p_tempColorCube, (uint64_t)v54, v28, v29, v30, v31, v32);
      }
      else {
        sub_2ED4C((uint64_t)p_tempColorCube, v54, v28, v29, v30, v31, v32.n128_f64[0], v33.n128_f64[0], v34.n128_f64[0], v35);
      }
      ++v55;
      p_tempColorCube = v54;
      v54 = v56;
    }
    while (v55 < anon_10010[2].i32[3]);
  }
  return 0;
}

- (uint64_t)findSkinMaskUsingInputImage:(float64_t)a3 InputBytesPerRow:(float64x2_t)a4 InputRegion:(float64_t)a5 OutputMask:(float64_t)a6 OutputBytesPerRow:(float64_t)a7 OutputRegion:(float64_t)a8 FaceBounds:(float64_t)a9 SeedPoints:(uint64_t)a10 NumberOfSeedPoints:(uint64_t)a11 FillValue:(unint64_t)a12
{
  if (!a11) {
    sub_4C308();
  }
  if (!a13) {
    sub_4C334();
  }
  unint64_t v20 = a15;
  if (!a15) {
    sub_4C360();
  }
  v25 = a1 + 4097;
  a2.f64[1] = a3;
  a4.f64[1] = a5;
  int32x2_t v26 = vcvt_s32_f32(vrndm_f32(vcvt_f32_f64(a2)));
  *(int32x2_t *)v27.i8 = vmax_s32(vcvt_s32_f32(vrndm_f32(vcvt_f32_f64(a17))), v26);
  *(int32x2_t *)v28.i8 = v26;
  __asm { FMOV            V3.2D, #-1.0 }
  float64x2_t v48 = _Q3;
  v28.u64[1] = (unint64_t)vcvt_s32_f32(vrndp_f32(vcvt_f32_f64(vaddq_f64(vaddq_f64(a2, a4), _Q3))));
  v27.u64[1] = (unint64_t)vmin_s32(vcvt_s32_f32(vrndp_f32(vcvt_f32_f64(vaddq_f64(vaddq_f64(a17, a18), _Q3)))), (int32x2_t)v28.u64[1]);
  int32x4_t v54 = v28;
  int8x16_t v55 = v27;
  uint64_t v34 = vsub_s32(*(int32x2_t *)(&v27 + 8), *(int32x2_t *)&v27).u32[1] + 1;
  __n128 v35 = (unsigned int *)malloc_type_calloc(1uLL, 0x11FFECuLL, 0x10000404F4CB0CBuLL);
  __int32 v36 = malloc_type_calloc((int)v34, 2uLL, 0x1000040BDFB0063uLL);
  sub_2EFE4((uint64_t)v35);
  sub_2EFEC(v35, (uint64_t)v36, (uint64_t)&a1->i64[1], a11, a12, v55, v54, *v25, v25[1]);
  sub_2F8D0(v35, (uint64_t)v36);
  if (v34 >= 2)
  {
    unsigned int v37 = 1;
    unsigned int v38 = 2;
    uint64_t v39 = 1;
    do
    {
      a12 = a12 & 0xFFFFFFFF00000000 | v38;
      sub_2F9A8(v37 | (unint64_t)(v39 << 32), a12, v35, (uint64_t)v36);
      v37 *= 2;
      uint64_t v39 = (2 * v39);
      v38 *= 2;
    }
    while (v37 < v34);
  }
  sub_2FA1C((uint64_t)v35);
  sub_2FA64((uint64_t)v35);
  sub_2F9A8(v34 << 32, v34, v35, (uint64_t)v36);
  __n128 v40 = (__n128)v55;
  if (a16)
  {
    int v41 = (double *)(v20 + 8);
    do
    {
      uint64_t v42 = (int)*(v41 - 1);
      double v43 = *v41;
      v41 += 2;
      unint64_t v20 = v20 & 0xFFFFFFFF00000000 | a19;
      sub_2FB7C(v42 | ((unint64_t)(int)v43 << 32), v20, v35, (uint64_t)v36, v40);
      __n128 v40 = (__n128)v55;
      --a16;
    }
    while (a16);
  }
  v44.f64[0] = a6;
  v44.f64[1] = a7;
  *(float32x2_t *)v45.f32 = vrndm_f32(vcvt_f32_f64(v44));
  v46.f64[0] = a8;
  v46.f64[1] = a9;
  *(float32x2_t *)&v45.u32[2] = vrndp_f32(vcvt_f32_f64(vaddq_f64(vaddq_f64(v44, v46), v48)));
  sub_2FC28((uint64_t)v35, (uint64_t)v36, a13, a14, (int32x4_t)v40, vcvtq_s32_f32(v45));
  free(v35);
  free(v36);
  return 0;
}

- (uint64_t)findToothMaskUsingInputImage:(float64x2_t)a3 InputBytesPerRow:(float64_t)a4 InputRegion:(float64_t)a5 OutputMask:(float64_t)a6 OutputBytesPerRow:(float64_t)a7 OutputRegion:(float64_t)a8 TeethBounds:(uint64_t)a9 SeedPoints:(uint64_t)a10 NumberOfSeedPoints:(uint64_t)a11 FillValue:(unint64_t)a12
{
  if (!a11) {
    sub_4C38C();
  }
  if (!a13) {
    sub_4C3B8();
  }
  unint64_t v20 = a15;
  if (!a15) {
    sub_4C3E4();
  }
  a1.f64[1] = a2;
  a3.f64[1] = a4;
  int32x2_t v24 = vcvt_s32_f32(vrndm_f32(vcvt_f32_f64(a1)));
  *(int32x2_t *)v25.i8 = vmax_s32(vcvt_s32_f32(vrndm_f32(vcvt_f32_f64(a17))), v24);
  *(int32x2_t *)v26.i8 = v24;
  __asm { FMOV            V3.2D, #-1.0 }
  float64x2_t v46 = _Q3;
  v26.u64[1] = (unint64_t)vcvt_s32_f32(vrndp_f32(vcvt_f32_f64(vaddq_f64(vaddq_f64(a1, a3), _Q3))));
  v25.u64[1] = (unint64_t)vmin_s32(vcvt_s32_f32(vrndp_f32(vcvt_f32_f64(vaddq_f64(vaddq_f64(a17, a18), _Q3)))), (int32x2_t)v26.u64[1]);
  int32x4_t v52 = v26;
  int8x16_t v53 = v25;
  uint64_t v32 = vsub_s32(*(int32x2_t *)(&v25 + 8), *(int32x2_t *)&v25).u32[1] + 1;
  __n128 v33 = (unsigned int *)malloc_type_calloc(1uLL, 0x11FFECuLL, 0x10000404F4CB0CBuLL);
  uint64_t v34 = malloc_type_calloc((int)v32, 2uLL, 0x1000040BDFB0063uLL);
  sub_2EFE4((uint64_t)v33);
  sub_2F5EC(v33, (uint64_t)v34, a11, a12, v53, v52);
  sub_2F8D0(v33, (uint64_t)v34);
  if (v32 >= 2)
  {
    unsigned int v35 = 1;
    unsigned int v36 = 2;
    uint64_t v37 = 1;
    do
    {
      a12 = a12 & 0xFFFFFFFF00000000 | v36;
      sub_2F9A8(v35 | (unint64_t)(v37 << 32), a12, v33, (uint64_t)v34);
      v35 *= 2;
      uint64_t v37 = (2 * v37);
      v36 *= 2;
    }
    while (v35 < v32);
  }
  sub_2FA1C((uint64_t)v33);
  sub_2FA64((uint64_t)v33);
  sub_2F9A8(v32 << 32, v32, v33, (uint64_t)v34);
  __n128 v38 = (__n128)v53;
  if (a16)
  {
    uint64_t v39 = (double *)(v20 + 8);
    do
    {
      uint64_t v40 = (int)*(v39 - 1);
      double v41 = *v39;
      v39 += 2;
      unint64_t v20 = v20 & 0xFFFFFFFF00000000 | a19;
      sub_2FB7C(v40 | ((unint64_t)(int)v41 << 32), v20, v33, (uint64_t)v34, v38);
      __n128 v38 = (__n128)v53;
      --a16;
    }
    while (a16);
  }
  v42.f64[0] = a5;
  v42.f64[1] = a6;
  *(float32x2_t *)v43.f32 = vrndm_f32(vcvt_f32_f64(v42));
  v44.f64[0] = a7;
  v44.f64[1] = a8;
  *(float32x2_t *)&v43.u32[2] = vrndp_f32(vcvt_f32_f64(vaddq_f64(vaddq_f64(v42, v44), v46)));
  sub_2FC28((uint64_t)v33, (uint64_t)v34, a13, a14, (int32x4_t)v38, vcvtq_s32_f32(v43));
  free(v33);
  free(v34);
  return 0;
}

- (int)drawEyeMaskUsingQuads:(MetalFaceMaskEyeQuads_t *)a3 OutputMask:(char *)a4 OutputBytesPerRow:(unint64_t)a5 OutputRegion:(CGRect)a6
{
  if (!a3) {
    sub_4C410();
  }
  if (!a4) {
    sub_4C43C();
  }
  uint64_t var0 = a3->var0;
  if (var0 > 0x10) {
    sub_4C468();
  }
  if (var0)
  {
    int8x16_t v7 = (int8x16_t)xmmword_55E80;
    p_var1 = (int32x2_t *)&a3[3].var1;
    do
    {
      int32x2_t v9 = p_var1[-3];
      int32x2_t v10 = p_var1[-2];
      int32x2_t v11 = p_var1[-1];
      *(int32x2_t *)v12.i8 = vmin_s32(vmin_s32(vmin_s32(vmin_s32(*(int32x2_t *)v7.i8, v9), v10), v11), *p_var1);
      v12.u64[1] = (unint64_t)vmax_s32(vmax_s32(vmax_s32(vmax_s32((int32x2_t)*(_OWORD *)&vextq_s8(v7, v7, 8uLL), v9), v10), v11), *p_var1);
      p_var1 += 4;
      int8x16_t v7 = v12;
      --var0;
    }
    while (var0);
  }
  else
  {
    int8x16_t v12 = (int8x16_t)xmmword_55E80;
  }
  CGFloat y = a6.origin.y;
  int32x2_t v14 = &a3->var1;
  *(int32x2_t *)v15.i8 = vcvt_s32_f32(vrndm_f32(vcvt_f32_f64((float64x2_t)a6.origin)));
  int32x2_t v16 = (int32x2_t)vld1_dup_f32((const float *)v14);
  *(int32x2_t *)v17.i8 = vmax_s32(vsub_s32(*(int32x2_t *)v12.i8, v16), *(int32x2_t *)v15.i8);
  CGFloat height = a6.size.height;
  float64x2_t v19 = vaddq_f64((float64x2_t)a6.origin, (float64x2_t)a6.size);
  __asm { FMOV            V2.2D, #-1.0 }
  v15.u64[1] = (unint64_t)vcvt_s32_f32(vrndp_f32(vcvt_f32_f64(vaddq_f64(v19, _Q2))));
  v17.u64[1] = (unint64_t)vmax_s32(*(int32x2_t *)v17.i8, vmin_s32(vadd_s32(v16, (int32x2_t)*(_OWORD *)&vextq_s8(v12, v12, 8uLL)), (int32x2_t)v15.u64[1]));
  sub_2FD6C((uint64_t)a3, (uint64_t)a4, a5, v17, v15);
  return 0;
}

- (int)lumaDilateRadius
{
  return self->_lumaDilateRadius;
}

- (void)setLumaDilateRadius:(int)a3
{
  self->_lumaDilateRadius = a3;
}

- (int)lumaErodeRadius
{
  return self->_lumaErodeRadius;
}

- (void)setLumaErodeRadius:(int)a3
{
  self->_lumaErodeRadius = a3;
}

- (int)chromaDilateRadius
{
  return self->_chromaDilateRadius;
}

- (void)setChromaDilateRadius:(int)a3
{
  self->_chromaDilateRadius = a3;
}

- (int)chromaErodeRadius
{
  return self->_chromaErodeRadius;
}

- (void)setChromaErodeRadius:(int)a3
{
  self->_chromaErodeRadius = a3;
}

@end