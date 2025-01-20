@interface ImageHomographyResampler
- (CGImage)ResampleCGImage:(CGImage *)a3 clipToRect:(CGRect)a4 outputSize:(CGSize)a5;
- (ImageHomographyResampler)init;
- (__CVBuffer)ResampleCVPixels:(__CVBuffer *)a3 clipToRect:(CGRect)a4 outputSize:(CGSize)a5;
- (signed)ResampleCVPixels:(__CVBuffer *)a3 clipToRect:(CGRect)a4 outputSize:(CGSize)a5 toPixelBuffer:(__CVBuffer *)a6;
- (void)ClearOutOfBoundsPixels:(WorkingPixmapRecord *)a3;
- (void)EraseCVPixelBuffer:(__CVBuffer *)a3;
- (void)setHomographyMatrix:(double *)a3;
@end

@implementation ImageHomographyResampler

- (ImageHomographyResampler)init
{
  self->homographyMatrix[0] = 1.0;
  self->homographyMatrix[1] = 0.0;
  self->homographyMatrix[2] = 0.0;
  self->homographyMatrix[3] = 0.0;
  self->homographyMatrix[4] = 1.0;
  self->homographyMatrix[5] = 0.0;
  self->homographyMatrix[6] = 0.0;
  self->homographyMatrix[7] = 0.0;
  self->homographyMatrix[8] = 1.0;
  v3.receiver = self;
  v3.super_class = (Class)ImageHomographyResampler;
  return [(ImageHomographyResampler *)&v3 init];
}

- (void)setHomographyMatrix:(double *)a3
{
  for (uint64_t i = 0; i != 9; ++i)
    self->homographyMatrix[i] = a3[i];
}

- (CGImage)ResampleCGImage:(CGImage *)a3 clipToRect:(CGRect)a4 outputSize:(CGSize)a5
{
  CGImageGetBitmapInfo(a3);
  CGImageGetBitsPerPixel(a3);
  CGImageGetBytesPerRow(a3);
  DataProvider = CGImageGetDataProvider(a3);
  CFDataRef cf = CGDataProviderCopyData(DataProvider);
  CFDataGetBytePtr(cf);
  CGImageGetWidth(a3);
  CGImageGetHeight(a3);
  operator new();
}

- (__CVBuffer)ResampleCVPixels:(__CVBuffer *)a3 clipToRect:(CGRect)a4 outputSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double v7 = a4.size.height;
  double v8 = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  CVPixelBufferRef pixelBufferOut = 0;
  CVReturn v14 = CVPixelBufferCreate(0, (unint64_t)width, (unint64_t)height, PixelFormatType, 0, &pixelBufferOut);
  v15 = pixelBufferOut;
  if (v14) {
    BOOL v16 = 1;
  }
  else {
    BOOL v16 = pixelBufferOut == 0;
  }
  if (!v16)
  {
    -[ImageHomographyResampler ResampleCVPixels:clipToRect:outputSize:toPixelBuffer:](self, "ResampleCVPixels:clipToRect:outputSize:toPixelBuffer:", a3, x, y, v8, v7, width, height);
    return pixelBufferOut;
  }
  return v15;
}

- (void)EraseCVPixelBuffer:(__CVBuffer *)a3
{
  CVPixelBufferLockBaseAddress(a3, 0);
  BaseAddress = CVPixelBufferGetBaseAddress(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  bzero(BaseAddress, BytesPerRow * Height);
  CVPixelBufferUnlockBaseAddress(a3, 0);
}

- (void)ClearOutOfBoundsPixels:(WorkingPixmapRecord *)a3
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  double v6 = self->homographyMatrix[7];
  double v7 = self->homographyMatrix[8];
  double v8 = self->homographyMatrix[4];
  double v9 = self->homographyMatrix[5];
  double v10 = self->homographyMatrix[6];
  double v11 = v8 * v7 - v6 * v9;
  double v12 = self->homographyMatrix[0];
  double v13 = self->homographyMatrix[1];
  double v15 = self->homographyMatrix[2];
  double v14 = self->homographyMatrix[3];
  double v16 = v6 * v15 - v13 * v7;
  double v72 = v11;
  double v73 = v16;
  double v17 = v13 * v9 - v8 * v15;
  double v74 = v17;
  double v18 = v16 * v14 + v12 * v11 + v10 * v17;
  if (v18 >= 2.22044605e-16 || v18 <= -2.22044605e-16)
  {
    double v72 = v11 / v18;
    double v73 = v16 / v18;
    double v74 = v17 / v18;
    double v75 = (v10 * v9 - v14 * v7) / v18;
    double v11 = (v14 * v6 - v10 * v8) / v18;
    double v16 = -(v10 * v15);
    double v76 = (v12 * v7 - v10 * v15) / v18;
    double v77 = (v14 * v15 - v12 * v9) / v18;
    double v78 = v11;
    double v79 = (v10 * v13 - v12 * v6) / v18;
    double v80 = (v12 * v8 - v14 * v13) / v18;
  }
  for (uint64_t i = 0; i != 9; ++i)
  {
    *(float *)&__int32 v21 = *(&v72 + i);
    v68.i32[i] = v21;
  }
  unint64_t var2 = a3->var2;
  if ((int)var2 >= 1)
  {
    uint64_t v23 = 0;
    unint64_t var1 = a3->var1;
    *(float *)&double v11 = (float)var1;
    unint64_t var3 = a3->var3;
    *(float *)&double v16 = (float)var2;
    float v66 = *(float *)&v69[8];
    float v67 = *(float *)&v68.i32[1];
    float v26 = *(float *)&v70[8];
    uint64x2_t v27 = (uint64x2_t)vdupq_n_s64((unint64_t)var1 - 1);
    v28 = (const float *)&v71;
    uint64_t v29 = a3->var2;
    float32x4_t v30 = (float32x4_t)vdupq_lane_s32(v68, 0);
    float32x4_t v31 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v69, 0);
    float32x4_t v32 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v69[4], 0);
    float32x4_t v33 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v70, 0);
    float32x4_t v34 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v70[4], 0);
    float32x4_t v35 = vld1q_dup_f32(v28);
    float32x4_t v36 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v11, 0);
    float32x4_t v37 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v16, 0);
    v38 = a3->var0 + 3;
    __asm { FMOV            V23.4S, #1.0 }
    float64x2_t v44 = (float64x2_t)vdupq_n_s64(0x3F747AE147AE147BuLL);
    float64x2_t v45 = (float64x2_t)vdupq_n_s64(0xBF747AE147AE147BLL);
    int64x2_t v46 = vdupq_n_s64(4uLL);
    v47.i64[0] = 0x400000004;
    v47.i64[1] = 0x400000004;
    do
    {
      if ((int)var1 >= 1)
      {
        v5.f32[0] = v26 * (float)(int)v23;
        v4.f32[0] = v66 * (float)(int)v23;
        v3.f32[0] = v67 * (float)(int)v23;
        float32x4_t v3 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v3.f32, 0);
        float32x4_t v4 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v4.f32, 0);
        v48 = v38;
        float32x4_t v5 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v5.f32, 0);
        uint64_t v49 = (var1 + 3) & 0x1FFFFFFFCLL;
        int64x2_t v50 = (int64x2_t)xmmword_1DD512550;
        int64x2_t v51 = (int64x2_t)xmmword_1DD512540;
        int32x4_t v52 = (int32x4_t)xmmword_1DD512560;
        do
        {
          int8x16_t v53 = (int8x16_t)vuzp1q_s32((int32x4_t)vcgeq_u64(v27, (uint64x2_t)v50), (int32x4_t)vcgeq_u64(v27, (uint64x2_t)v51));
          float32x4_t v54 = vcvtq_f32_s32(v52);
          float32x4_t v55 = vaddq_f32(v31, vmlaq_f32(v3, v54, v30));
          float32x4_t v56 = vaddq_f32(v33, vmlaq_f32(v4, v54, v32));
          float32x4_t v57 = vaddq_f32(v35, vmlaq_f32(v5, v54, v34));
          float32x4_t v58 = vsubq_f32(_Q23, v57);
          float64x2_t v59 = vcvtq_f64_f32(*(float32x2_t *)v58.f32);
          float64x2_t v60 = vcvt_hight_f64_f32(v58);
          float32x4_t v61 = (float32x4_t)vbslq_s8(vandq_s8(v53, vbicq_s8(vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_f64(v59, v44), (int32x4_t)vcgtq_f64(v60, v44))), (int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_f64(v45, v59), (int32x4_t)vcgtq_f64(v45, v60)))), (int8x16_t)_Q23, (int8x16_t)vdivq_f32(_Q23, v57));
          float32x4_t v62 = vmulq_f32(v56, v61);
          float32x4_t v63 = vmulq_f32(v55, v61);
          int8x16_t v64 = (int8x16_t)vcltzq_f32(v63);
          int16x4_t v65 = vmovn_s32((int32x4_t)vorrq_s8(vandq_s8(vbicq_s8(v53, v64), vorrq_s8(vorrq_s8((int8x16_t)vcgeq_f32(v63, v36), (int8x16_t)vcgeq_f32(v62, v37)), (int8x16_t)vcltzq_f32(v62))), vandq_s8(v53, v64)));
          if (v65.i8[0]) {
            *(v48 - 3) = 0;
          }
          if (v65.i8[2]) {
            *(v48 - 2) = 0;
          }
          if (v65.i8[4]) {
            *(v48 - 1) = 0;
          }
          if (v65.i8[6]) {
            char *v48 = 0;
          }
          int64x2_t v51 = vaddq_s64(v51, v46);
          int64x2_t v50 = vaddq_s64(v50, v46);
          int32x4_t v52 = vaddq_s32(v52, v47);
          v48 += 4;
          v49 -= 4;
        }
        while (v49);
      }
      ++v23;
      v38 += var3;
    }
    while (v23 != v29);
  }
}

- (signed)ResampleCVPixels:(__CVBuffer *)a3 clipToRect:(CGRect)a4 outputSize:(CGSize)a5 toPixelBuffer:(__CVBuffer *)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  -[ImageHomographyResampler EraseCVPixelBuffer:](self, "EraseCVPixelBuffer:", a6, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.width, a5.height);
  CVPixelBufferLockBaseAddress(a3, 0);
  CVPixelBufferLockBaseAddress(a6, 0);
  CGRect CleanRect = CVImageBufferGetCleanRect(a3);
  double v13 = CleanRect.origin.x;
  double v14 = CleanRect.origin.y;
  double v15 = CleanRect.size.width;
  double v16 = CleanRect.size.height;
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
  size_t v18 = CVPixelBufferGetHeight(a3);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  double v20 = self->homographyMatrix[7];
  double v21 = self->homographyMatrix[8];
  double v22 = self->homographyMatrix[4];
  double v23 = self->homographyMatrix[5];
  double v24 = self->homographyMatrix[6];
  double v25 = v22 * v21 - v20 * v23;
  double v26 = self->homographyMatrix[0];
  double v27 = self->homographyMatrix[1];
  double v29 = self->homographyMatrix[2];
  double v28 = self->homographyMatrix[3];
  double v30 = v20 * v29 - v27 * v21;
  double v72 = v25;
  double v73 = v30;
  double v31 = v27 * v23 - v22 * v29;
  double v74 = v31;
  double v32 = v30 * v28 + v26 * v25 + v24 * v31;
  if (v32 >= 2.22044605e-16 || v32 <= -2.22044605e-16)
  {
    double v72 = v25 / v32;
    double v73 = v30 / v32;
    double v74 = v31 / v32;
    double v75 = (v24 * v23 - v28 * v21) / v32;
    double v76 = (v26 * v21 - v24 * v29) / v32;
    double v77 = (v28 * v29 - v26 * v23) / v32;
    double v78 = (v28 * v20 - v24 * v22) / v32;
    double v79 = (v24 * v27 - v26 * v20) / v32;
    double v80 = (v26 * v22 - v28 * v27) / v32;
  }
  float32x4_t v34 = &BaseAddress[4 * (unint64_t)v13 + (v18 - (unint64_t)(v14 + v16)) * BytesPerRow];
  int v35 = (int)y;
  double v36 = width + (double)(int)x;
  double v37 = height + (double)(int)y;
  size_t v38 = CVPixelBufferGetBytesPerRow(a6);
  v39 = CVPixelBufferGetBaseAddress(a6);
  for (uint64_t i = 0; i != 9; ++i)
  {
    float v41 = *(&v72 + i);
    *((float *)v65 + i) = v41;
  }
  *((void *)&v66 + 1) = v34;
  *(void *)&long long v67 = BytesPerRow;
  *((void *)&v67 + 1) = 4;
  *(void *)&long long v68 = (unint64_t)v15;
  *((void *)&v68 + 1) = (unint64_t)v16;
  *(void *)&long long v69 = v39;
  *((void *)&v69 + 1) = v38;
  *(void *)&long long v70 = 4;
  *((void *)&v70 + 1) = CVPixelBufferGetWidth(a6);
  CVPixelBufferRef v50 = a6;
  *(void *)&long long v71 = CVPixelBufferGetWidth(a6);
  *((void *)&v71 + 1) = v35;
  group = dispatch_group_create();
  qos_class_t v42 = qos_class_self();
  v43 = dispatch_get_global_queue(v42, 0);
  int v44 = (int)v37 - v35;
  if ((int)v37 < v35) {
    int v44 = (int)v37 - v35 + 15;
  }
  int v45 = v44 >> 4;
  uint64_t v46 = MEMORY[0x1E4F143A8];
  int v47 = 16;
  do
  {
    block[0] = v46;
    if (--v47) {
      int v48 = v35 + v45;
    }
    else {
      int v48 = (int)v37;
    }
    block[1] = 3221225472;
    block[2] = sub_1DD4EDED0;
    block[3] = &unk_1E6CC8C68;
    long long v57 = v68;
    long long v58 = v69;
    long long v59 = v70;
    long long v60 = v71;
    long long v53 = v65[0];
    long long v54 = v65[1];
    long long v55 = v66;
    long long v56 = v67;
    int v61 = (int)x;
    int v62 = (int)v36;
    int v63 = v35;
    int v64 = v48;
    dispatch_group_async(group, v43, block);
    int v35 = v48;
  }
  while (v47);
  dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
  CVPixelBufferUnlockBaseAddress(a3, 0);
  CVPixelBufferUnlockBaseAddress(v50, 0);

  return 0;
}

@end