@interface ABPKVisualizer
+ (void)_drawRectOfSize:(int)a3 posx:(int)a4 posy:(int)a5 pImage:(vImage_Buffer *)a6 red:(unsigned __int8)a7 green:(unsigned __int8)a8 blue:(unsigned __int8)a9;
- (ABPKVisualizer)init;
- (BOOL)jointInImageDimensions:(CGSize)a3 imageDimensions:;
- (int)drawBoundingBox:(CGRect)a3 withColor:(__CVBuffer *)a4 OnImage:(__CVBuffer *)a5 andGenerateOverlayImage:;
- (int)drawFaceBbox:(__CVBuffer *)a3 detectedBodies2d:(id)a4 confidences:(id)a5 skeletonDefinition:(id)a6 overlayImage:(__CVBuffer *)a7 color:;
- (int)drawLineFromPoint:(unint64_t)a3 ToPoint:(vImage_Buffer *)a4 withThickness:withColor:OnImage:;
- (int)generateStickFigureImageFrom:(__CVBuffer *)a3 detectedBodies2d:(id)a4 confidences:(id)a5 skeletonDefinition:(id)a6 overlayImage:(__CVBuffer *)a7 color:(BOOL)a8 faceOnly:;
- (void)dealloc;
- (void)drawFaceBboxEdgewithJoints:(id)a3 withSkeletonDefinition:(id)a4 fromPostion:(vImage_Buffer *)a5 toPosition:OnImage:color:;
- (void)overlayJoints:(id)a3 withSkeletonDefinition:(id)a4 confidences:(id)a5 OnImage:(vImage_Buffer *)a6 color:(BOOL)a7 faceOnly:;
@end

@implementation ABPKVisualizer

- (ABPKVisualizer)init
{
  v5.receiver = self;
  v5.super_class = (Class)ABPKVisualizer;
  v2 = [(ABPKVisualizer *)&v5 init];
  if (v2)
  {
    VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], &v2->_pixelTransferSession);
    v2->_pixelBufferPoolBGRA = 0;
    *(void *)&long long v3 = 0xFF00000000;
    *((void *)&v3 + 1) = 0xFF00000000;
    *(_OWORD *)v2->_highConfidenceColor = v3;
    *(_OWORD *)v2->_mediumConfidenceColor = xmmword_21B813590;
    *(_OWORD *)v2->_lowConfidenceColor = xmmword_21B813570;
  }
  return v2;
}

- (void)dealloc
{
  pixelTransferSession = self->_pixelTransferSession;
  if (pixelTransferSession) {
    CFRelease(pixelTransferSession);
  }
  pixelBufferPoolBGRA = self->_pixelBufferPoolBGRA;
  if (pixelBufferPoolBGRA)
  {
    CVPixelBufferPoolRelease(pixelBufferPoolBGRA);
    self->_pixelBufferPoolBGRA = 0;
  }
  pixelBufferPoolYUV = self->_pixelBufferPoolYUV;
  if (pixelBufferPoolYUV)
  {
    CVPixelBufferPoolRelease(pixelBufferPoolYUV);
    self->_pixelBufferPoolYUV = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)ABPKVisualizer;
  [(ABPKVisualizer *)&v6 dealloc];
}

- (BOOL)jointInImageDimensions:(CGSize)a3 imageDimensions:
{
  if (*(float *)&a3.width < 0.0 || a3.height <= *(float *)&a3.width) {
    return 0;
  }
  if (v3 > *((float *)&a3.width + 1)) {
    return *((float *)&a3.width + 1) >= 0.0;
  }
  return 0;
}

- (int)generateStickFigureImageFrom:(__CVBuffer *)a3 detectedBodies2d:(id)a4 confidences:(id)a5 skeletonDefinition:(id)a6 overlayImage:(__CVBuffer *)a7 color:(BOOL)a8 faceOnly:
{
  BOOL v9 = a8;
  double v21 = v8;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  if (VTPixelTransferSessionTransferImage(self->_pixelTransferSession, a3, a7))
  {
    v18 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B7C6000, v18, OS_LOG_TYPE_ERROR, " Could not transfer image. ", buf, 2u);
    }

    int v19 = -6660;
  }
  else
  {
    CVPixelBufferLockBaseAddress(a7, 0);
    *(void *)buf = CVPixelBufferGetBaseAddress(a7);
    size_t Height = CVPixelBufferGetHeight(a7);
    size_t Width = CVPixelBufferGetWidth(a7);
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a7);
    [(ABPKVisualizer *)self overlayJoints:v15 withSkeletonDefinition:v17 confidences:v16 OnImage:buf color:v9 faceOnly:v21];
    CVPixelBufferUnlockBaseAddress(a7, 0);
    int v19 = 0;
  }

  return v19;
}

- (int)drawBoundingBox:(CGRect)a3 withColor:(__CVBuffer *)a4 OnImage:(__CVBuffer *)a5 andGenerateOverlayImage:
{
  double v25 = v5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (VTPixelTransferSessionTransferImage(self->_pixelTransferSession, a4, a5))
  {
    v12 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B7C6000, v12, OS_LOG_TYPE_ERROR, " Could not transfer image. ", buf, 2u);
    }

    return -6660;
  }
  else
  {
    CVPixelBufferLockBaseAddress(a5, 0);
    *(void *)buf = CVPixelBufferGetBaseAddress(a5);
    size_t v27 = CVPixelBufferGetHeight(a5);
    size_t v28 = CVPixelBufferGetWidth(a5);
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a5);
    *(float *)&unsigned int v15 = x;
    *(float *)&unsigned int v16 = y;
    double v17 = COERCE_DOUBLE(__PAIR64__(v16, v15));
    LODWORD(v18) = v15;
    size_t v29 = BytesPerRow;
    *(float *)&double v19 = x + width;
    double v21 = COERCE_DOUBLE(__PAIR64__(v16, LODWORD(v19)));
    double v22 = v17;
    float v20 = y + height;
    *((float *)&v18 + 1) = v20;
    *((float *)&v19 + 1) = v20;
    double v23 = v19;
    double v24 = v18;
    [(ABPKVisualizer *)self drawLineFromPoint:5 ToPoint:buf withThickness:v17 withColor:v21 OnImage:v25];
    [(ABPKVisualizer *)self drawLineFromPoint:5 ToPoint:buf withThickness:v21 withColor:v23 OnImage:v25];
    [(ABPKVisualizer *)self drawLineFromPoint:5 ToPoint:buf withThickness:v23 withColor:v24 OnImage:v25];
    [(ABPKVisualizer *)self drawLineFromPoint:5 ToPoint:buf withThickness:v24 withColor:v22 OnImage:v25];
    CVPixelBufferUnlockBaseAddress(a5, 0);
    return 0;
  }
}

- (int)drawLineFromPoint:(unint64_t)a3 ToPoint:(vImage_Buffer *)a4 withThickness:withColor:OnImage:
{
  float32x2_t v8 = v5;
  *(float32x2_t *)&long long v7 = v4;
  float32x2_t v9 = vsub_f32(v4, v5);
  float v21 = (float)(a3 >> 1);
  if (sqrtf(vaddv_f32(vmul_f32(v9, v9))) > v21)
  {
    float32x2_t v12 = vsub_f32(v5, *(float32x2_t *)&v7);
    float32x2_t v13 = vmul_f32(v12, v12);
    v13.f32[0] = sqrtf(vaddv_f32(v13));
    float32x2_t v14 = vmul_n_f32(vdiv_f32(v12, (float32x2_t)vdup_lane_s32((int32x2_t)v13, 0)), v21);
    char v15 = BYTE8(v6);
    uint64_t v16 = v6;
    uint64_t v17 = BYTE4(v6);
    do
    {
      *(float32x2_t *)&long long v7 = vadd_f32(v14, *(float32x2_t *)&v7);
      long long v22 = v7;
      LOBYTE(v20) = v15;
      [(id)objc_opt_class() _drawRectOfSize:a3 posx:(int)*(float *)&v7 posy:(int)*((float *)&v7 + 1) pImage:a4 red:v16 green:v17 blue:v20];
      long long v7 = v22;
      float32x2_t v18 = vsub_f32(*(float32x2_t *)&v22, v8);
    }
    while (sqrtf(vaddv_f32(vmul_f32(v18, v18))) > v21);
  }
  return 0;
}

- (int)drawFaceBbox:(__CVBuffer *)a3 detectedBodies2d:(id)a4 confidences:(id)a5 skeletonDefinition:(id)a6 overlayImage:(__CVBuffer *)a7 color:
{
  double v58 = v7;
  id v12 = a4;
  id v13 = a6;
  if (VTPixelTransferSessionTransferImage(self->_pixelTransferSession, a3, a7))
  {
    float32x2_t v14 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B7C6000, v14, OS_LOG_TYPE_ERROR, " Could not transfer image. ", buf, 2u);
    }

    int v15 = -6660;
  }
  else
  {
    CVPixelBufferLockBaseAddress(a7, 0);
    *(void *)buf = CVPixelBufferGetBaseAddress(a7);
    size_t Height = CVPixelBufferGetHeight(a7);
    size_t Width = CVPixelBufferGetWidth(a7);
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a7);
    double v16 = (double)Width;
    double v17 = (double)Height;
    float32x2_t v18 = [v12 objectAtIndexedSubscript:0];
    double v19 = [v18 objectAtIndexedSubscript:1];
    [v19 floatValue];
    float v21 = (double)Height * v20;
    double v22 = v21;
    if (v21 >= 0.0) {
      double v23 = 0.5;
    }
    else {
      double v23 = -0.5;
    }
    int v24 = (int)(v23 + v22);

    double v25 = [v12 objectAtIndexedSubscript:17];
    v26 = [v25 objectAtIndexedSubscript:0];
    [v26 floatValue];
    float v28 = v16 * v27;
    double v29 = v28;
    if (v28 >= 0.0) {
      double v30 = 0.5;
    }
    else {
      double v30 = -0.5;
    }
    int v31 = (int)(v30 + v29);

    v32 = [v12 objectAtIndexedSubscript:18];
    v33 = [v32 objectAtIndexedSubscript:0];
    [v33 floatValue];
    float v35 = v16 * v34;
    double v36 = v35;
    if (v35 >= 0.0) {
      double v37 = 0.5;
    }
    else {
      double v37 = -0.5;
    }
    int v38 = (int)(v37 + v36);

    double v40 = (double)(v38 - v31);
    float v41 = (double)v24 + v40 * -0.7;
    float v42 = 1.0;
    float v43 = 1.0;
    if (v41 > 0.0)
    {
      float v43 = (double)v24 + v40 * -0.7;
      if (v17 <= v41) {
        float v43 = v17 + -1.0;
      }
    }
    float v44 = (double)v24 + v40 * 0.9;
    float v45 = v17 + -1.0;
    if (v17 > v44) {
      float v45 = (double)v24 + v40 * 0.9;
    }
    if (v44 > 0.0) {
      float v42 = v45;
    }
    int v46 = (int)(v16 + 7.0 + -1.0);
    if (v16 + 7.0 > (double)v31) {
      int v46 = v31;
    }
    if (v31 < 8) {
      int v46 = 8;
    }
    *(double *)&long long v39 = (double)v38;
    if (v38 >= -6) {
      int v47 = v38;
    }
    else {
      int v47 = 8;
    }
    if (v16 + -7.0 <= *(double *)&v39) {
      int v47 = (int)(v16 + -7.0 + -1.0);
    }
    *(float *)&long long v39 = (float)(v46 - 7);
    long long v48 = v39;
    *(float *)&double v49 = *(float *)&v39;
    *((float *)&v48 + 1) = v43;
    double v50 = *(double *)&v48;
    long long v53 = v48;
    *(float *)&double v51 = (float)(v47 + 7);
    *(float *)&long long v48 = *(float *)&v51;
    *((float *)&v48 + 1) = v43;
    *((float *)&v49 + 1) = v42;
    double v55 = *(double *)&v48;
    double v56 = v49;
    *((float *)&v51 + 1) = v42;
    double v57 = v51;
    -[ABPKVisualizer drawFaceBboxEdgewithJoints:withSkeletonDefinition:fromPostion:toPosition:OnImage:color:](self, "drawFaceBboxEdgewithJoints:withSkeletonDefinition:fromPostion:toPosition:OnImage:color:", v12, v13, buf, v50, *(double *)&v48, v58, v53);
    [(ABPKVisualizer *)self drawFaceBboxEdgewithJoints:v12 withSkeletonDefinition:v13 fromPostion:buf toPosition:v54 OnImage:v56 color:v58];
    [(ABPKVisualizer *)self drawFaceBboxEdgewithJoints:v12 withSkeletonDefinition:v13 fromPostion:buf toPosition:v56 OnImage:v57 color:v58];
    [(ABPKVisualizer *)self drawFaceBboxEdgewithJoints:v12 withSkeletonDefinition:v13 fromPostion:buf toPosition:v55 OnImage:v57 color:v58];
    CVPixelBufferUnlockBaseAddress(a7, 0);
    int v15 = 0;
  }

  return v15;
}

- (void)drawFaceBboxEdgewithJoints:(id)a3 withSkeletonDefinition:(id)a4 fromPostion:(vImage_Buffer *)a5 toPosition:OnImage:color:
{
  *(float32x2_t *)&long long v8 = v5;
  float32x2_t v9 = vsub_f32(v5, v6);
  if (sqrtf(vaddv_f32(vmul_f32(v9, v9))) > 2.0)
  {
    float32x2_t v11 = v6;
    float32x2_t v12 = vsub_f32(v6, *(float32x2_t *)&v8);
    float32x2_t v13 = vmul_f32(v12, v12);
    v13.f32[0] = sqrtf(vaddv_f32(v13));
    float32x2_t v14 = vdiv_f32(v12, (float32x2_t)vdup_lane_s32((int32x2_t)v13, 0));
    float32x2_t v15 = vadd_f32(v14, v14);
    char v16 = BYTE8(v7);
    uint64_t v17 = v7;
    uint64_t v18 = BYTE4(v7);
    do
    {
      *(float32x2_t *)&long long v8 = vadd_f32(v15, *(float32x2_t *)&v8);
      long long v21 = v8;
      LOBYTE(v20) = v16;
      [(id)objc_opt_class() _drawRectOfSize:5 posx:(int)*(float *)&v8 posy:(int)*((float *)&v8 + 1) pImage:a5 red:v17 green:v18 blue:v20];
      long long v8 = v21;
      float32x2_t v19 = vsub_f32(*(float32x2_t *)&v21, v11);
    }
    while (sqrtf(vaddv_f32(vmul_f32(v19, v19))) > 2.0);
  }
}

- (void)overlayJoints:(id)a3 withSkeletonDefinition:(id)a4 confidences:(id)a5 OnImage:(vImage_Buffer *)a6 color:(BOOL)a7 faceOnly:
{
  BOOL v8 = a7;
  long long v96 = v7;
  id v99 = a3;
  id v13 = a4;
  float32x2_t v14 = a6;
  id v94 = v13;
  id v90 = a5;
  double width = (double)a6->width;
  double height = (double)a6->height;
  unsigned __int8 v91 = BYTE4(v96);
  unsigned __int8 v92 = v96;
  char v93 = BYTE8(v96);
  if ([v99 count])
  {
    unint64_t v17 = 0;
    uint64_t v18 = BYTE4(v96);
    do
    {
      if (!v8 || v17 <= 0x12 && ((1 << v17) & 0x6C000) != 0)
      {
        uint64_t v19 = [v94 parentJoint:v17];
        if (v19 != -1)
        {
          uint64_t v20 = v19;
          long long v21 = [v99 objectAtIndexedSubscript:v17];
          double v22 = [v21 objectAtIndexedSubscript:0];
          [v22 floatValue];
          float v24 = width * v23;
          double v25 = v24;
          double v26 = v24 >= 0.0 ? 0.5 : -0.5;
          BOOL v27 = v8;
          int v28 = (int)(v26 + v25);

          double v29 = [v99 objectAtIndexedSubscript:v17];
          double v30 = [v29 objectAtIndexedSubscript:1];
          [v30 floatValue];
          float v32 = height * v31;
          double v33 = v32;
          double v34 = v32 >= 0.0 ? 0.5 : -0.5;
          float v35 = v14;
          int v36 = (int)(v34 + v33);

          *(float *)&long long v37 = (float)v28;
          BOOL v8 = v27;
          float v38 = (float)v36;
          float32x2_t v14 = v35;
          *((float *)&v37 + 1) = v38;
          long long v97 = v37;
          if (-[ABPKVisualizer jointInImageDimensions:imageDimensions:](self, "jointInImageDimensions:imageDimensions:"))
          {
            long long v39 = [v99 objectAtIndexedSubscript:v20];
            double v40 = [v39 objectAtIndexedSubscript:0];
            [v40 floatValue];
            float v42 = width * v41;
            double v43 = v42;
            double v44 = v42 >= 0.0 ? 0.5 : -0.5;
            int v45 = (int)(v44 + v43);

            int v46 = [v99 objectAtIndexedSubscript:v20];
            int v47 = [v46 objectAtIndexedSubscript:1];
            [v47 floatValue];
            float v49 = height * v48;
            double v50 = v49;
            double v51 = v49 >= 0.0 ? 0.5 : -0.5;
            int v52 = (int)(v51 + v50);

            v53.f32[0] = (float)v45;
            BOOL v8 = v27;
            float v54 = (float)v52;
            float32x2_t v14 = v35;
            v53.f32[1] = v54;
            float32x2_t v95 = v53;
            BOOL v55 = -[ABPKVisualizer jointInImageDimensions:imageDimensions:](self, "jointInImageDimensions:imageDimensions:");
            long long v56 = v97;
            if (v55)
            {
              float32x2_t v57 = vsub_f32(*(float32x2_t *)&v97, v95);
              if (sqrtf(vaddv_f32(vmul_f32(v57, v57))) > 2.0)
              {
                float32x2_t v58 = vsub_f32(v95, *(float32x2_t *)&v97);
                float32x2_t v59 = vmul_f32(v58, v58);
                v59.f32[0] = sqrtf(vaddv_f32(v59));
                float32x2_t v60 = vdiv_f32(v58, (float32x2_t)vdup_lane_s32((int32x2_t)v59, 0));
                float32x2_t v61 = vadd_f32(v60, v60);
                do
                {
                  *(float32x2_t *)&long long v56 = vadd_f32(v61, *(float32x2_t *)&v56);
                  long long v98 = v56;
                  LOBYTE(v89) = v93;
                  [(id)objc_opt_class() _drawRectOfSize:4 posx:(int)*(float *)&v56 posy:(int)*((float *)&v56 + 1) pImage:v35 red:v92 green:v18 blue:v89];
                  long long v56 = v98;
                  float32x2_t v62 = vsub_f32(*(float32x2_t *)&v98, v95);
                }
                while (sqrtf(vaddv_f32(vmul_f32(v62, v62))) > 2.0);
              }
            }
          }
        }
      }
      ++v17;
    }
    while (v17 < [v99 count]);
  }
  if ([v99 count])
  {
    unint64_t v63 = 0;
    do
    {
      if (!v8 || v63 <= 0x12 && ((1 << v63) & 0x6C001) != 0)
      {
        v64 = [v99 objectAtIndexedSubscript:v63];
        v65 = [v64 objectAtIndexedSubscript:0];
        [v65 floatValue];
        float v67 = width * v66;
        double v68 = v67;
        double v69 = v67 >= 0.0 ? 0.5 : -0.5;
        uint64_t v70 = (int)(v69 + v68);

        v71 = [v99 objectAtIndexedSubscript:v63];
        v72 = [v71 objectAtIndexedSubscript:1];
        [v72 floatValue];
        float v74 = height * v73;
        double v75 = v74;
        double v76 = v74 >= 0.0 ? 0.5 : -0.5;
        uint64_t v77 = (int)(v76 + v75);

        *(float *)&double v78 = (float)(int)v70;
        *((float *)&v78 + 1) = (float)(int)v77;
        if (-[ABPKVisualizer jointInImageDimensions:imageDimensions:](self, "jointInImageDimensions:imageDimensions:", v78, width, height))
        {
          if (v90)
          {
            v79 = [v90 objectAtIndexedSubscript:v63];
            [v79 floatValue];
            float v81 = v80;

            if (v81 >= 0.2)
            {
              v82 = objc_opt_class();
              if (v81 >= 0.5)
              {
                uint64_t v83 = self->_highConfidenceColor[0];
                uint64_t v84 = self->_highConfidenceColor[4];
                unsigned __int8 v85 = self->_highConfidenceColor[8];
              }
              else
              {
                uint64_t v83 = self->_mediumConfidenceColor[0];
                uint64_t v84 = self->_mediumConfidenceColor[4];
                unsigned __int8 v85 = self->_mediumConfidenceColor[8];
              }
            }
            else
            {
              v82 = objc_opt_class();
              uint64_t v83 = self->_lowConfidenceColor[0];
              uint64_t v84 = self->_lowConfidenceColor[4];
              unsigned __int8 v85 = self->_lowConfidenceColor[8];
            }
            LOBYTE(v89) = v85;
            uint64_t v86 = v70;
            uint64_t v87 = v77;
            v88 = v14;
          }
          else
          {
            v82 = objc_opt_class();
            LOBYTE(v89) = v93;
            uint64_t v86 = v70;
            uint64_t v87 = v77;
            v88 = v14;
            uint64_t v83 = v92;
            uint64_t v84 = v91;
          }
          [v82 _drawRectOfSize:8 posx:v86 posy:v87 pImage:v88 red:v83 green:v84 blue:v89];
        }
      }
      ++v63;
    }
    while ([v99 count] > v63);
  }
}

+ (void)_drawRectOfSize:(int)a3 posx:(int)a4 posy:(int)a5 pImage:(vImage_Buffer *)a6 red:(unsigned __int8)a7 green:(unsigned __int8)a8 blue:(unsigned __int8)a9
{
  if (a3 >= 0) {
    int v11 = a3;
  }
  else {
    int v11 = a3 + 1;
  }
  size_t rowBytes = a6->rowBytes;
  int32x2_t v13 = vmax_s32(vadd_s32(vdup_n_s32(-(v11 >> 1)), (int32x2_t)__PAIR64__(a4, a5)), 0);
  int32x2_t v14 = vdup_n_s32(a3);
  int32x2_t v15 = vadd_s32(v13, v14);
  v16.i64[0] = v15.i32[0];
  v16.i64[1] = v15.i32[1];
  v17.i64[0] = -1;
  v17.i64[1] = -1;
  int8x8_t v18 = vbsl_s8((int8x8_t)vmovn_s64((int64x2_t)vcgtq_u64(v16, (uint64x2_t)vaddq_s64(*(int64x2_t *)&a6->height, v17))), (int8x8_t)vadd_s32(vmovn_s64(*(int64x2_t *)&a6->height), (int32x2_t)vmvn_s8((int8x8_t)v13)), (int8x8_t)v14);
  v19.data = (char *)a6->data + rowBytes * v13.u32[0] + (4 * v13.i32[1]);
  v16.i64[0] = v18.i32[0];
  v16.i64[1] = v18.i32[1];
  *(uint64x2_t *)&v19.double height = v16;
  v19.size_t rowBytes = rowBytes;
  vImageOverwriteChannelsWithScalar_ARGB8888(0xFFu, &v19, &v19, 1u, 0x10u);
  vImageOverwriteChannelsWithScalar_ARGB8888(a7, &v19, &v19, 2u, 0x10u);
  vImageOverwriteChannelsWithScalar_ARGB8888(a8, &v19, &v19, 4u, 0x10u);
  vImageOverwriteChannelsWithScalar_ARGB8888(a9, &v19, &v19, 8u, 0x10u);
}

@end