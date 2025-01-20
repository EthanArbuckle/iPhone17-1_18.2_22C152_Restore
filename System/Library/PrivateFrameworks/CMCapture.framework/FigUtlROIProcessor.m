@interface FigUtlROIProcessor
- (BOOL)processImage:(__CVBuffer *)a3 orientation:(int)a4 rect:(CGRect)a5;
- (CGPoint)originalToRoi:(CGPoint)a3;
- (CGPoint)originalToRoiPixels:(CGPoint)a3;
- (CGPoint)roiToOriginal:(CGPoint)a3;
- (CGPoint)roiToOriginalPixels:(CGPoint)a3;
- (CGRect)roiRectangle;
- (FigUtlROIProcessor)initWithWidth:(int)a3 height:(int)a4 pixelFormat:(unsigned int)a5;
- (__CVBuffer)pixelBuffer;
- (__n128)originalToRoiMatrix;
- (__n128)roiToOriginalMatrix;
- (int)height;
- (int)width;
- (void)dealloc;
- (void)matrix:(float64x2_t *)a3@<X2> rectangle:(float64x2_t *)a4@<X8> scaleX:(float64_t)a5@<D0> scaleY:(float64_t)a6@<D1> inverse:(float64_t)a7@<D2>;
@end

@implementation FigUtlROIProcessor

- (CGPoint)originalToRoi:(CGPoint)a3
{
  float64x2_t v6 = vaddq_f64(*(float64x2_t *)&self->_anon_90[64], vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)self->_anon_90, a3.x), *(float64x2_t *)&self->_anon_90[32], a3.y));
  double v7 = vaddq_f64(*(float64x2_t *)&self->_anon_90[80], vmlaq_f64(vmulq_f64((float64x2_t)a3, *(float64x2_t *)&self->_anon_90[16]), *(float64x2_t *)&a3.y, *(float64x2_t *)&self->_anon_90[48])).f64[0];
  double v3 = utlClamp(v6.f64[0] / v7);
  double v4 = utlClamp(v6.f64[1] / v7);
  double v5 = v3;
  result.y = v4;
  result.x = v5;
  return result;
}

- (CGPoint)originalToRoiPixels:(CGPoint)a3
{
  -[FigUtlROIProcessor originalToRoi:](self, "originalToRoi:", a3.x / (double)(self->_originalWidth - 1), a3.y / (double)(self->_originalHeight - 1));
  double v5 = v4 * (self->_roiInPixels.size.width + -1.0);
  double v7 = v6 * (self->_roiInPixels.size.height + -1.0);
  result.y = v7;
  result.x = v5;
  return result;
}

- (CGPoint)roiToOriginal:(CGPoint)a3
{
  float64x2_t v6 = vaddq_f64((float64x2_t)self[1]._originalRectangle.size, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&self[1].super.isa, a3.x), (float64x2_t)self[1]._roiInPixels.size, a3.y));
  double v7 = vaddq_f64(*(float64x2_t *)&self[1]._orientation, vmlaq_f64(vmulq_f64((float64x2_t)a3, (float64x2_t)self[1]._roiInPixels.origin), *(float64x2_t *)&a3.y, (float64x2_t)self[1]._originalRectangle.origin)).f64[0];
  double v3 = utlClamp(v6.f64[0] / v7);
  double v4 = utlClamp(v6.f64[1] / v7);
  double v5 = v3;
  result.y = v4;
  result.x = v5;
  return result;
}

- (CGPoint)roiToOriginalPixels:(CGPoint)a3
{
  CGFloat v3 = self->_roiInPixels.size.width + -1.0;
  CGFloat v4 = self->_roiInPixels.size.height + -1.0;
  -[FigUtlROIProcessor roiToOriginal:](self, "roiToOriginal:", a3.x / v3, a3.y / v4);
  double v6 = v3 * v5;
  double v8 = v4 * v7;
  result.y = v8;
  result.x = v6;
  return result;
}

- (FigUtlROIProcessor)initWithWidth:(int)a3 height:(int)a4 pixelFormat:(unsigned int)a5
{
  v14.receiver = self;
  v14.super_class = (Class)FigUtlROIProcessor;
  double v7 = [(FigUtlROIProcessor *)&v14 init];
  if (v7)
  {
    uint64_t PixelBuffer = CreatePixelBuffer();
    v7->_pixelBuffer = (__CVBuffer *)PixelBuffer;
    if (!PixelBuffer
      || (v9 = (FigM2MController *)objc_alloc_init(MEMORY[0x1E4F55F38]),
          m2m = v7->_m2m,
          v7->_m2m = v9,
          m2m,
          !v7->_m2m))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v12 = 0;
      goto LABEL_6;
    }
    CGSize v11 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    v7->_roiInPixels.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    v7->_roiInPixels.size = v11;
    v7->_width = a3;
    v7->_height = a4;
  }
  v12 = v7;
LABEL_6:

  return v12;
}

- (void)dealloc
{
  pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer)
  {
    CVPixelBufferRelease(pixelBuffer);
    self->_pixelBuffer = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)FigUtlROIProcessor;
  [(FigUtlROIProcessor *)&v4 dealloc];
}

- (void)matrix:(float64x2_t *)a3@<X2> rectangle:(float64x2_t *)a4@<X8> scaleX:(float64_t)a5@<D0> scaleY:(float64_t)a6@<D1> inverse:(float64_t)a7@<D2>
{
  v25.n128_u64[1] = 0;
  a4[4] = 0u;
  a4[5] = 0u;
  a4[2] = 0u;
  a4[3] = 0u;
  *a4 = 0u;
  a4[1] = 0u;
  if (a1)
  {
    v25.n128_f64[0] = a9;
    utlCreateTransformationDouble(a2, a4, v25, a10, 0.0, 0.0, 0.5, 0.5);
    float64x2_t v31 = a4[3];
    a21 = a4[2];
    a22 = v31;
    float64x2_t v32 = a4[5];
    a23 = a4[4];
    a24 = v32;
    float64x2_t v34 = a4[1];
    a19 = *a4;
    v33.f64[1] = a19.f64[1];
    a20 = v34;
    v33.f64[0] = a5;
    v34.f64[0] = a6;
    v35.f64[0] = a7;
    v36.f64[0] = a8;
    double v37 = -utlTransformRectDouble(&a19, v33, v34, v35, v36);
    a17 = 0u;
    a18 = 0u;
    a15 = 0u;
    a16 = 0u;
    a13 = 0u;
    a14 = 0u;
    utlCreateTransformationDouble(1, &a13, (__n128)COERCE_UNSIGNED_INT64(1.0), 1.0, v37, -v38, 0.5, 0.5);
    uint64_t v39 = 0;
    float64x2_t v46 = a13;
    float64x2_t v40 = a14;
    float64x2_t v47 = a15;
    float64x2_t v41 = a16;
    float64x2_t v48 = a17;
    float64x2_t v42 = a18;
    float64x2_t v43 = a4[3];
    float64x2_t v62 = a4[2];
    float64x2_t v63 = v43;
    float64x2_t v44 = a4[5];
    float64x2_t vars0 = a4[4];
    float64x2_t v65 = v44;
    float64x2_t v45 = a4[1];
    float64x2_t v60 = *a4;
    float64x2_t v61 = v45;
    a19 = 0u;
    a20 = 0u;
    a21 = 0u;
    a22 = 0u;
    a23 = 0u;
    a24 = 0u;
    *(void *)&v46.f64[1] = vextq_s8((int8x16_t)v46, (int8x16_t)v46, 8uLL).u64[0];
    *(void *)&v47.f64[1] = vextq_s8((int8x16_t)v47, (int8x16_t)v47, 8uLL).u64[0];
    *(void *)&v48.f64[1] = vextq_s8((int8x16_t)v48, (int8x16_t)v48, 8uLL).u64[0];
    do
    {
      float64x2_t v50 = *(float64x2_t *)((char *)&v60 + v39);
      float64x2_t v49 = *(float64x2_t *)((char *)&v60 + v39 + 16);
      v51 = (float64x2_t *)((char *)&a19 + v39);
      float64x2_t *v51 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v46, v50.f64[0]), v47, v50, 1), v48, v49.f64[0]);
      v51[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(v40, v50), v41, v50, 1), v49, v42);
      v39 += 32;
    }
    while (v39 != 96);
    float64x2_t v52 = a22;
    a4[2] = a21;
    a4[3] = v52;
    float64x2_t v53 = a24;
    a4[4] = a23;
    a4[5] = v53;
    float64x2_t v54 = a20;
    *a4 = a19;
    a4[1] = v54;
    if (a3)
    {
      float64x2_t v55 = a4[3];
      a21 = a4[2];
      a22 = v55;
      float64x2_t v56 = a4[5];
      a23 = a4[4];
      a24 = v56;
      float64x2_t v57 = a4[1];
      a19 = *a4;
      a20 = v57;
      __invert_d3();
      float64x2_t v58 = v63;
      a3[2] = v62;
      a3[3] = v58;
      a3[4] = vars0;
      a3[5] = v65;
      float64x2_t v59 = v61;
      *a3 = v60;
      a3[1] = v59;
    }
  }
}

- (BOOL)processImage:(__CVBuffer *)a3 orientation:(int)a4 rect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v9 = *(void *)&a4;
  int v12 = CVPixelBufferGetWidth(a3);
  int v13 = CVPixelBufferGetHeight(a3);
  int v14 = v13;
  self->_originalWidth = v12;
  self->_originalHeight = v13;
  double v15 = floor(width * (double)v12);
  double v16 = floor(height * (double)v13);
  int v17 = v12;
  int v18 = v13;
  double v19 = v15;
  double v20 = v16;
  switch((int)v9)
  {
    case 1:
    case 3:
      goto LABEL_3;
    case 6:
    case 8:
      int v17 = v13;
      int v18 = v12;
      double v19 = v16;
      double v20 = v15;
LABEL_3:
      int v21 = (int)v20;
      int v22 = (int)v19;
      int v23 = self->_width;
      double v24 = 1.0;
      double v25 = 1.0;
      if (v23 <= v22) {
        double v25 = (double)v23 / (double)v22;
      }
      int v26 = self->_height;
      if (v26 <= v21) {
        double v24 = (double)v26 / (double)v21;
      }
      if (v25 < v24) {
        double v24 = v25;
      }
      if (v24 < 0.25) {
        goto LABEL_14;
      }
      v58.f64[0] = v16;
      v58.f64[1] = v15;
      CGSize v77 = (CGSize)0;
      long long v78 = 0u;
      CGSize v75 = (CGSize)0;
      CGPoint v76 = (CGPoint)0;
      float64x2_t v73 = 0u;
      CGPoint v74 = (CGPoint)0;
      float64x2_t v72 = 0u;
      -[FigUtlROIProcessor matrix:rectangle:scaleX:scaleY:inverse:]((uint64_t)self, v9, &v73, &v67, x, y, width, height, v24 / (double)v23 * (double)v17, v24 / (double)v26 * (double)v18, v56, v57, v58, v61, v62, v63, v64, v65, v66,
        (float64x2_t)0,
        (float64x2_t)0,
        (float64x2_t)0,
        (float64x2_t)0,
        (float64x2_t)0);
      float64x2_t v27 = v70;
      float64x2_t v28 = v69;
      float64x2_t v29 = v70;
      *(float64x2_t *)&self->_anon_90[32] = v69;
      *(float64x2_t *)&self->_anon_90[48] = v27;
      float64x2_t v30 = v72;
      float64x2_t v31 = v71;
      float64x2_t v32 = v72;
      *(float64x2_t *)&self->_anon_90[64] = v71;
      *(float64x2_t *)&self->_anon_90[80] = v30;
      float64x2_t v33 = v68;
      float64x2_t v34 = v67;
      float64x2_t v35 = v68;
      *(float64x2_t *)self->_anon_90 = v67;
      *(float64x2_t *)&self->_anon_90[16] = v33;
      CGPoint v36 = v76;
      self[1]._roiInPixels.size = v75;
      self[1]._originalRectangle.origin = v36;
      long long v37 = v78;
      self[1]._originalRectangle.size = v77;
      *(_OWORD *)&self[1]._orientation = v37;
      v38.f64[1] = v73.f64[1];
      CGPoint v39 = v74;
      *(float64x2_t *)&self[1].super.isa = v73;
      self[1]._roiInPixels.origin = v39;
      float64x2_t v63 = v28;
      float64x2_t v64 = v29;
      float64x2_t v65 = v31;
      float64x2_t v66 = v32;
      float64x2_t v61 = v34;
      float64x2_t v62 = v35;
      v38.f64[0] = x;
      v28.f64[0] = y;
      v31.f64[0] = width;
      v29.f64[0] = height;
      double v40 = utlTransformRectDouble(&v61, v38, v28, v31, v29);
      CGFloat v42 = v41;
      double v44 = v43;
      double v46 = utlClamp(v45);
      double v47 = utlClamp(v44);
      CGFloat v48 = (double)self->_width;
      CGFloat v49 = floor(v46 * v48);
      double v50 = (double)self->_height;
      double v51 = floor(v47 * v50);
      self->_roiInPixels.size.double width = v49;
      self->_roiInPixels.size.double height = v51;
      self->_roiInPixels.origin.double x = 0.0;
      self->_roiInPixels.origin.double y = 0.0;
      if (v49 <= v48 && v51 <= v50)
      {
        self->_originalRectangle.origin.double x = x;
        self->_originalRectangle.origin.double y = y;
        self->_originalRectangle.size.double width = width;
        self->_originalRectangle.size.double height = height;
        self->_orientation = v9;
        self->_roiRectangle.origin.double x = v40;
        self->_roiRectangle.origin.double y = v42;
        self->_roiRectangle.size.double width = v46;
        self->_roiRectangle.size.double height = v47;
        m2m = self->_m2m;
        pixelBuffer = self->_pixelBuffer;
        BOOL v54 = 1;
        if (!-[FigM2MController transform:srcRect:dst:dstRect:rotate:sync_m2m:](m2m, "transform:srcRect:dst:dstRect:rotate:sync_m2m:", a3, pixelBuffer, v9, 1, floor(x * (double)(v12 - 1)), floor(y * (double)(v14 - 1)), v60, v59, 0.0, 0.0))return v54; {
      }
        }
      fig_log_get_emitter();
LABEL_15:
      FigDebugAssert3();
      return 0;
    default:
LABEL_14:
      fig_log_get_emitter();
      goto LABEL_15;
  }
}

- (__n128)originalToRoiMatrix
{
  long long v2 = *(_OWORD *)(a1 + 192);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 176);
  *(_OWORD *)(a2 + 48) = v2;
  long long v3 = *(_OWORD *)(a1 + 224);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 208);
  *(_OWORD *)(a2 + 80) = v3;
  __n128 result = *(__n128 *)(a1 + 144);
  long long v5 = *(_OWORD *)(a1 + 160);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v5;
  return result;
}

- (__n128)roiToOriginalMatrix
{
  long long v2 = *(_OWORD *)(a1 + 288);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 272);
  *(_OWORD *)(a2 + 48) = v2;
  long long v3 = *(_OWORD *)(a1 + 320);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 304);
  *(_OWORD *)(a2 + 80) = v3;
  __n128 result = *(__n128 *)(a1 + 240);
  long long v5 = *(_OWORD *)(a1 + 256);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v5;
  return result;
}

- (CGRect)roiRectangle
{
  double x = self->_roiRectangle.origin.x;
  double y = self->_roiRectangle.origin.y;
  double width = self->_roiRectangle.size.width;
  double height = self->_roiRectangle.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (int)width
{
  return self->_width;
}

- (int)height
{
  return self->_height;
}

- (void).cxx_destruct
{
}

@end