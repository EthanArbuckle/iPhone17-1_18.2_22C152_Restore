@interface VCPEdgeDetector
- (BOOL)isInImage:(int)a3 width:(int)a4 height:(int)a5;
- (VCPEdgeDetector)initWithImage:(float *)a3 edgeMap:(float *)a4 width:(unint64_t)a5 height:(unint64_t)a6 widthExtension:(int)a7 heightExtension:(int)a8;
- (int)detectWithSigma:(float)a3 lowThreshold:(float)a4 highThreshold:(float)a5;
- (int)gradientEstimation:(float *)a3 width:(unint64_t)a4 height:(unint64_t)a5 gradient:(DSPSplitComplex)a6 gradientMag:(float *)a7;
- (int)noiseReduction:(float *)a3 sigma:(float)a4 imageFiltered:(float *)a5;
- (void)dealloc;
@end

@implementation VCPEdgeDetector

- (VCPEdgeDetector)initWithImage:(float *)a3 edgeMap:(float *)a4 width:(unint64_t)a5 height:(unint64_t)a6 widthExtension:(int)a7 heightExtension:(int)a8
{
  v29.receiver = self;
  v29.super_class = (Class)VCPEdgeDetector;
  v14 = [(VCPEdgeDetector *)&v29 init];
  v15 = v14;
  v16 = 0;
  if (a3 && v14)
  {
    v14->_image = a3;
    v14->_edgeMap = a4;
    v14->_width = a5;
    v14->_height = a6;
    v14->_widthExt = a7;
    v14->_heightExt = a8;
    unint64_t v17 = a5 + 2 * a7;
    unint64_t v18 = a6 + 2 * a8;
    v14->_widthPadded = v17;
    v14->_heightPadded = v18;
    if ((a6 * a5) >> 62) {
      size_t v19 = -1;
    }
    else {
      size_t v19 = 4 * a6 * a5;
    }
    v20 = (const std::nothrow_t *)MEMORY[0x1E4FBA2D0];
    v15->_nonMaxSuppressed = (float *)operator new[](v19, MEMORY[0x1E4FBA2D0]);
    if ((v18 * v17) >> 62) {
      size_t v21 = -1;
    }
    else {
      size_t v21 = 4 * v18 * v17;
    }
    v22 = (float *)operator new[](v21, v20);
    v15->_imageFiltered = v22;
    v23 = (float *)operator new[](v21, v20);
    v15->_gradient.realp = v23;
    v24 = (float *)operator new[](v21, v20);
    v15->_gradient.imagp = v24;
    v15->_gradientX = v23;
    v15->_gradientY = v24;
    v15->_gradientMag = v22;
    if (v24) {
      BOOL v25 = v23 == 0;
    }
    else {
      BOOL v25 = 1;
    }
    if (v25 || v22 == 0) {
      v27 = 0;
    }
    else {
      v27 = v15;
    }
    v16 = v27;
  }

  return v16;
}

- (void)dealloc
{
  imageFiltered = self->_imageFiltered;
  if (imageFiltered) {
    MEMORY[0x1C186C790](imageFiltered, 0x1000C8052888210);
  }
  nonMaxSuppressed = self->_nonMaxSuppressed;
  if (nonMaxSuppressed) {
    MEMORY[0x1C186C790](nonMaxSuppressed, 0x1000C8052888210);
  }
  realp = self->_gradient.realp;
  if (realp) {
    MEMORY[0x1C186C790](realp, 0x1000C8052888210);
  }
  imagp = self->_gradient.imagp;
  if (imagp) {
    MEMORY[0x1C186C790](imagp, 0x1000C8052888210);
  }
  v7.receiver = self;
  v7.super_class = (Class)VCPEdgeDetector;
  [(VCPEdgeDetector *)&v7 dealloc];
}

- (int)detectWithSigma:(float)a3 lowThreshold:(float)a4 highThreshold:(float)a5
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  unint64_t widthPadded = self->_widthPadded;
  int result = -[VCPEdgeDetector noiseReduction:sigma:imageFiltered:](self, "noiseReduction:sigma:imageFiltered:", self->_image, self->_imageFiltered);
  if (!result)
  {
    int result = -[VCPEdgeDetector gradientEstimation:width:height:gradient:gradientMag:](self, "gradientEstimation:width:height:gradient:gradientMag:", self->_imageFiltered, self->_widthPadded, self->_heightPadded, self->_gradient.realp, self->_gradient.imagp, self->_gradientMag);
    if (!result)
    {
      float v62 = a5;
      unint64_t heightExt = self->_heightExt;
      unint64_t heightPadded = self->_heightPadded;
      unint64_t v64 = self->_widthPadded;
      unint64_t v11 = heightPadded - heightExt;
      if (heightPadded - heightExt > heightExt)
      {
        int v12 = 0;
        unint64_t widthExt = self->_widthExt;
        unint64_t v75 = v64 - widthExt;
        uint64_t v14 = 4 * (widthPadded * heightExt + widthExt);
        uint64_t v15 = 4 * widthPadded;
        uint64_t v16 = v14 + 4;
        uint64_t v17 = 4 * (widthPadded + widthPadded * heightExt) + 4 * widthExt + 4;
        uint64_t v18 = 4 * widthPadded * (heightExt - 1) + 4 * widthExt;
        int v65 = v64 - 2 * widthExt;
        unint64_t v67 = widthExt;
        unint64_t v68 = heightPadded - heightExt;
        uint64_t v66 = 4 * widthPadded;
        do
        {
          if (v75 > widthExt)
          {
            unint64_t v74 = heightExt;
            unint64_t v19 = 0;
            gradientMag = self->_gradientMag;
            size_t v21 = &self->_nonMaxSuppressed[v12];
            v22 = (char *)self->_gradientX + v14;
            uint64_t v71 = v16;
            uint64_t v72 = v14;
            v23 = (char *)self->_gradientY + v14;
            v24 = (char *)gradientMag + v16;
            uint64_t v69 = v18;
            uint64_t v70 = v17;
            BOOL v25 = (char *)gradientMag + v17;
            v26 = (char *)gradientMag + v18;
            int v73 = v65 + v12;
            do
            {
              v27 = (float *)&v24[v19];
              float v28 = *(float *)&v24[v19 - 4];
              float v30 = *(float *)&v25[v19 - 4];
              float v29 = *(float *)&v25[v19];
              float v32 = *(float *)&v26[v19];
              float v31 = *(float *)&v26[v19 + 4];
              float v33 = *(float *)&v26[v19 - 4];
              float v34 = atan2f(*(float *)&v23[v19], *(float *)&v22[v19]) + 3.14159265;
              float v35 = fmodf(v34, 3.1416) / 3.14159265 * 8.0;
              BOOL v36 = v35 > 1.0 && v35 <= 7.0;
              if (v36 || (v28 > *(v27 - 2) ? (BOOL v37 = v28 <= *v27) : (BOOL v37 = 1), v37))
              {
                BOOL v38 = v35 <= 1.0 || v35 > 3.0;
                BOOL v39 = v38 || v28 <= v31;
                if (v39 || v28 <= v29)
                {
                  BOOL v41 = v35 <= 3.0 || v35 > 5.0;
                  BOOL v42 = v41 || v28 <= v32;
                  if (v42 || v28 <= v30)
                  {
                    BOOL v44 = v28 <= v29 || v28 <= v33;
                    BOOL v45 = v44 || v35 > 7.0;
                    if (v45 || v35 <= 5.0) {
                      float v28 = 0.0;
                    }
                  }
                }
              }
              v21[v19 / 4] = v28;
              ++widthExt;
              v19 += 4;
            }
            while (v75 > widthExt);
            unint64_t heightExt = v74;
            unint64_t widthExt = v67;
            unint64_t v11 = v68;
            int v12 = v73;
            uint64_t v16 = v71;
            uint64_t v14 = v72;
            uint64_t v15 = v66;
            uint64_t v18 = v69;
            uint64_t v17 = v70;
          }
          ++heightExt;
          v14 += v15;
          v16 += v15;
          v17 += v15;
          v18 += v15;
        }
        while (v11 > heightExt);
      }
      v48 = self->_gradientMag;
      edgeMap = self->_edgeMap;
      bzero(v48, 4 * heightPadded * v64);
      bzero(edgeMap, 4 * self->_widthPadded * self->_heightPadded);
      unint64_t height = self->_height;
      if (height)
      {
        unint64_t v50 = 0;
        unint64_t width = self->_width;
        unint64_t v52 = width;
        do
        {
          if (v52)
          {
            unint64_t v53 = 0;
            unint64_t v76 = v50;
            do
            {
              unint64_t v54 = v53 + v52 * v50;
              if (self->_nonMaxSuppressed[v54] >= v62 && edgeMap[v54] == 0.0)
              {
                edgeMap[v54] = 1.0;
                float *v48 = (float)v54;
                int v55 = 1;
                do
                {
                  uint64_t v56 = 0;
                  unsigned int v57 = (int)v48[--v55];
                  v58.i32[0] = self->_width;
                  v58.i32[1] = 1;
                  v58.i32[2] = -1;
                  v58.i32[3] = v57 - v58.i32[0];
                  v59.i64[1] = 0x100000001;
                  v59.i64[0] = v57 | 0x100000000;
                  unsigned __int32 v77 = v57 - v58.i32[0];
                  int32x4_t v60 = vzip1q_s32(v59, v59);
                  v60.i32[2] = v57;
                  int32x4_t v78 = vaddq_s32(v58, v60);
                  __int32 v79 = v57 - v58.i32[0] - 1;
                  int32x2_t v80 = vadd_s32(vdup_lane_s32(*(int32x2_t *)v78.i8, 0), (int32x2_t)0xFFFFFFFF00000001);
                  do
                  {
                    int v61 = *(unsigned __int32 *)((char *)&v77 + v56);
                    if ([(VCPEdgeDetector *)self isInImage:v61 width:LODWORD(self->_width) height:LODWORD(self->_height)]&& self->_nonMaxSuppressed[v61] >= a4&& edgeMap[v61] == 0.0)
                    {
                      edgeMap[v61] = 1.0;
                      v48[v55++] = (float)v61;
                    }
                    v56 += 4;
                  }
                  while (v56 != 32);
                }
                while (v55 > 0);
                unint64_t width = self->_width;
                unint64_t v50 = v76;
              }
              ++v53;
              unint64_t v52 = width;
            }
            while (width > v53);
            unint64_t height = self->_height;
            unint64_t v52 = width;
          }
          ++v50;
        }
        while (height > v50);
      }
      return 0;
    }
  }
  return result;
}

- (int)noiseReduction:(float *)a3 sigma:(float)a4 imageFiltered:(float *)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  *(float *)v5.i32 = (float)(a4 + a4) * a4;
  float v9 = a4 * 2.5066;
  float32x2_t v10 = (float32x2_t)vdup_lane_s32(v5, 0);
  int v11 = -2;
  int v12 = __F;
  uint64x2_t v20 = (uint64x2_t)vdupq_n_s64(5uLL);
  do
  {
    unint64_t v13 = 0;
    int32x2_t v14 = vdup_n_s32(v11 * v11);
    do
    {
      uint64x2_t v15 = (uint64x2_t)vorrq_s8((int8x16_t)vdupq_n_s64(v13), (int8x16_t)xmmword_1BC281320);
      unsigned __int8 v23 = vmovn_s64((int64x2_t)vcgtq_u64(v20, v15)).u8[0];
      uint64x2_t v24 = v15;
      int32x2_t v16 = vadd_s32(vdup_n_s32(v13), (int32x2_t)-2);
      float32x2_t v17 = vdiv_f32(vcvt_f32_s32(vneg_s32(vmla_s32(v14, v16, v16))), v10);
      float v21 = v17.f32[0];
      float v22 = expf(v17.f32[1]);
      float v18 = expf(v21);
      if (v23) {
        v12[v13] = v18 / v9;
      }
      if (vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(5uLL), v24)).i32[1]) {
        v12[v13 + 1] = v22 / v9;
      }
      v13 += 2;
    }
    while (v13 != 6);
    ++v11;
    v12 += 5;
  }
  while (v11 != 3);
  vDSP_f5x5(a3, self->_heightPadded, self->_widthPadded, __F, a5);
  return 0;
}

- (int)gradientEstimation:(float *)a3 width:(unint64_t)a4 height:(unint64_t)a5 gradient:(DSPSplitComplex)a6 gradientMag:(float *)a7
{
  imagp = a6.imagp;
  DSPSplitComplex v13 = a6;
  vDSP_f3x3(a3, a5, a4, -[VCPEdgeDetector gradientEstimation:width:height:gradient:gradientMag:]::kSobel, a6.realp);
  vDSP_f3x3(a3, a5, a4, &-[VCPEdgeDetector gradientEstimation:width:height:gradient:gradientMag:]::kSobel[9], imagp);
  if (a7) {
    vDSP_zvmags(&v13, 1, a7, 1, a5 * a4);
  }
  return 0;
}

- (BOOL)isInImage:(int)a3 width:(int)a4 height:(int)a5
{
  return a3 / a4 < a5 && ((a3 % a4) | a4 | (a3 / a4)) >= 0;
}

@end