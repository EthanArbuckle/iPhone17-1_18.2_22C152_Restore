@interface FigMetalHistogram
- (FigMetalHistogram)initWithMetalContext:(id)a3;
- (int)singleComponentCPUAverageInputPixelBuffer:(__CVBuffer *)a3 validRect:(CGRect)a4 outputAverage:(float *)a5;
- (int)singleComponentCPUHistogramInputPixelBuffer:(__CVBuffer *)a3 validRect:(CGRect)a4 outputHistogram:(id *)a5;
- (int)singleComponentCPUHistogramInputPixelBuffer:(__CVBuffer *)a3 validRect:(CGRect)a4 subSampleX:(unsigned int)a5 subSampleY:(unsigned int)a6 outputHistogram:(id *)a7;
- (int)singleComponentGPUAverageInputPixelBuffer:(__CVBuffer *)a3 validRect:(CGRect)a4 outputAverage:(float *)a5;
- (int)singleComponentGPUHistogramInputPixelBuffer:(__CVBuffer *)a3 validRect:(CGRect)a4 outputHistogram:(id *)a5;
- (uint64_t)_initShaders;
@end

@implementation FigMetalHistogram

- (FigMetalHistogram)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FigMetalHistogram;
  v6 = [(FigMetalHistogram *)&v14 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_9;
  }
  p_metalContext = (void **)&v6->_metalContext;
  objc_storeStrong((id *)&v6->_metalContext, a3);
  if (!v7->_metalContext)
  {
    v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    if (!v9
      || (uint64_t v10 = [objc_alloc(MEMORY[0x1E4F55F60]) initWithbundle:v9 andOptionalCommandQueue:0],
          v11 = *p_metalContext,
          *p_metalContext = (void *)v10,
          v11,
          !*p_metalContext))
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      goto LABEL_11;
    }
  }
  if (-[FigMetalHistogram _initShaders]((uint64_t)v7))
  {
LABEL_9:
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_11:
    v12 = 0;
    goto LABEL_8;
  }
  v12 = v7;
LABEL_8:

  return v12;
}

- (uint64_t)_initShaders
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = [*(id *)(a1 + 8) computePipelineStateFor:@"histogramSingleComponent" constants:0];
  v3 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v2;

  if (*(void *)(a1 + 16)) {
    return 0;
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  return FigSignalErrorAt();
}

- (int)singleComponentGPUHistogramInputPixelBuffer:(__CVBuffer *)a3 validRect:(CGRect)a4 outputHistogram:(id *)a5
{
  if (!a3 || !a5) {
    goto LABEL_62;
  }
  double y = a4.origin.y;
  double height = a4.size.height;
  double width = a4.size.width;
  double __dst = a4.origin.x;
  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  int result = -12780;
  uint64_t v10 = 10;
  if (PixelFormatType > 796423727)
  {
    if (PixelFormatType > 2016686639)
    {
      if (PixelFormatType <= 2084075055)
      {
        if (PixelFormatType == 2016686640 || PixelFormatType == 2019963440)
        {
          uint64_t v10 = 20;
          goto LABEL_38;
        }
        int v11 = 2084070960;
        goto LABEL_35;
      }
      if (PixelFormatType == 2084075056) {
        goto LABEL_38;
      }
      if (PixelFormatType == 2088265264) {
        goto LABEL_32;
      }
      int v12 = 2088269360;
    }
    else
    {
      if (PixelFormatType <= 1278226487)
      {
        if (PixelFormatType != 796423728)
        {
          if (PixelFormatType == 875704422) {
            goto LABEL_38;
          }
          int v11 = 875704438;
          goto LABEL_35;
        }
LABEL_32:
        uint64_t v10 = 588;
        goto LABEL_38;
      }
      if (PixelFormatType == 1278226488) {
        goto LABEL_38;
      }
      if (PixelFormatType == 1882468912) {
        goto LABEL_32;
      }
      int v12 = 1885745712;
    }
LABEL_31:
    if (PixelFormatType != v12) {
      return result;
    }
    goto LABEL_32;
  }
  if (PixelFormatType > 758674991)
  {
    if (PixelFormatType > 792225327)
    {
      if (PixelFormatType == 792225328 || PixelFormatType == 792229424) {
        goto LABEL_38;
      }
      int v12 = 796419632;
    }
    else
    {
      if (PixelFormatType == 758674992) {
        goto LABEL_38;
      }
      if (PixelFormatType == 762865200) {
        goto LABEL_32;
      }
      int v12 = 762869296;
    }
    goto LABEL_31;
  }
  if (PixelFormatType <= 645424687)
  {
    if (PixelFormatType == 641230384) {
      goto LABEL_38;
    }
    int v11 = 641234480;
    goto LABEL_35;
  }
  if (PixelFormatType == 645424688 || PixelFormatType == 645428784) {
    goto LABEL_32;
  }
  int v11 = 758670896;
LABEL_35:
  if (PixelFormatType != v11) {
    return result;
  }
LABEL_38:
  unsigned int WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
  unsigned int HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
  v45.size.double width = width;
  v45.origin.x = __dst;
  v45.origin.double y = y;
  v45.size.double height = height;
  if (CGRectIsNull(v45))
  {
    v15.i32[0] = 0;
    v15.i16[2] = HeightOfPlane;
    v15.i16[3] = WidthOfPlane;
    goto LABEL_47;
  }
  v16.f64[0] = __dst;
  if (__dst < 0.0
    || __dst + width > (double)WidthOfPlane
    || width <= 0.0
    || (v17.f64[0] = height, y < 0.0)
    || y + height > (double)HeightOfPlane
    || height <= 0.0)
  {
LABEL_62:
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12780;
  }
  v16.f64[1] = y;
  v17.f64[1] = width;
  int16x4_t v15 = vuzp1_s16((int16x4_t)vmovn_s64(vcvtq_s64_f64(v16)), (int16x4_t)vmovn_s64(vcvtq_s64_f64(v17)));
LABEL_47:
  v43[0] = v15;
  uint64_t v18 = [(FigMetalContext *)self->_metalContext commandBuffer];
  if (v18)
  {
    v19 = (void *)v18;
    uint64_t v20 = -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:textureSize:plane:](self->_metalContext, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:textureSize:plane:", a3, v10, 1, 0, (float)WidthOfPlane, (float)HeightOfPlane);
    if (v20)
    {
      v21 = (void *)v20;
      uint64_t v22 = [v19 computeCommandEncoder];
      if (v22)
      {
        v23 = (void *)v22;
        v24 = [(FigMetalContext *)self->_metalContext device];
        v25 = (void *)[v24 newBufferWithLength:1024 options:0];

        id v26 = v25;
        bzero((void *)[v26 contents], 0x400uLL);
        unint64_t v27 = (((unint64_t)[v21 width] >> 1) + 15) >> 4;
        unint64_t v28 = (((unint64_t)[v21 height] >> 1) + 15) >> 4;
        [v23 setComputePipelineState:self->_pipelineStates[0]];
        [v23 setTexture:v21 atIndex:0];
        [v23 setBuffer:v26 offset:0 atIndex:0];
        [v23 setBytes:v43 length:8 atIndex:1];
        v42[0] = v27;
        v42[1] = v28;
        v42[2] = 1;
        int64x2_t v40 = vdupq_n_s64(0x10uLL);
        uint64_t v41 = 1;
        [v23 dispatchThreadgroups:v42 threadsPerThreadgroup:&v40];
        [v23 endEncoding];
        if (*MEMORY[0x1E4F1EBA8])
        {
          v37[0] = MEMORY[0x1E4F143A8];
          v37[1] = 3221225472;
          v37[2] = __91__FigMetalHistogram_singleComponentGPUHistogramInputPixelBuffer_validRect_outputHistogram___block_invoke;
          v37[3] = &__block_descriptor_40_e28_v16__0___MTLCommandBuffer__8l;
          unsigned int v38 = WidthOfPlane;
          unsigned int v39 = HeightOfPlane;
          [v19 addCompletedHandler:v37];
          v34[0] = MEMORY[0x1E4F143A8];
          v34[1] = 3221225472;
          v34[2] = __91__FigMetalHistogram_singleComponentGPUHistogramInputPixelBuffer_validRect_outputHistogram___block_invoke_2;
          v34[3] = &__block_descriptor_40_e28_v16__0___MTLCommandBuffer__8l;
          unsigned int v35 = WidthOfPlane;
          unsigned int v36 = HeightOfPlane;
          [v19 addCompletedHandler:v34];
        }
        [(FigMetalContext *)self->_metalContext commitAndWait];
        id v29 = v26;
        memcpy(a5, (const void *)[v29 contents], sizeof($A1886C520643A86ACC5362F227C8A889));

        return 0;
      }
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }

    return -12786;
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  return FigSignalErrorAt();
}

uint64_t __91__FigMetalHistogram_singleComponentGPUHistogramInputPixelBuffer_validRect_outputHistogram___block_invoke()
{
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    return kdebug_trace();
  }
  return result;
}

void __91__FigMetalHistogram_singleComponentGPUHistogramInputPixelBuffer_validRect_outputHistogram___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 GPUEndTime];
  [v2 GPUStartTime];

  if (*MEMORY[0x1E4F1EBA8] == 1)
  {
    kdebug_trace();
  }
}

- (int)singleComponentCPUHistogramInputPixelBuffer:(__CVBuffer *)a3 validRect:(CGRect)a4 outputHistogram:(id *)a5
{
  return -[FigMetalHistogram singleComponentCPUHistogramInputPixelBuffer:validRect:subSampleX:subSampleY:outputHistogram:](self, "singleComponentCPUHistogramInputPixelBuffer:validRect:subSampleX:subSampleY:outputHistogram:", a3, 1, 1, a5, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (int)singleComponentCPUHistogramInputPixelBuffer:(__CVBuffer *)a3 validRect:(CGRect)a4 subSampleX:(unsigned int)a5 subSampleY:(unsigned int)a6 outputHistogram:(id *)a7
{
  if (!a3) {
    goto LABEL_23;
  }
  if (!a7) {
    goto LABEL_23;
  }
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  if ((CVPixelBufferGetPixelFormatType(a3) & 0xFFFFFFEF) != 0x34323066) {
    goto LABEL_23;
  }
  bzero(a7, 0x400uLL);
  int BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
  v29.origin.double x = x;
  v29.origin.double y = y;
  v29.size.double width = width;
  v29.size.double height = height;
  int v28 = BytesPerRowOfPlane;
  if (!CGRectIsNull(v29))
  {
    size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
    if (x >= 0.0 && x + width <= (double)WidthOfPlane && width > 0.0)
    {
      size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
      if (y >= 0.0 && y + height <= (double)HeightOfPlane && height > 0.0)
      {
        unsigned int v18 = x;
        unsigned int v19 = y;
        unsigned int v16 = width;
        unsigned int v17 = height;
        goto LABEL_13;
      }
    }
LABEL_23:
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12780;
  }
  unsigned int v16 = CVPixelBufferGetWidthOfPlane(a3, 0);
  unsigned int v17 = CVPixelBufferGetHeightOfPlane(a3, 0);
  unsigned int v18 = 0;
  unsigned int v19 = 0;
LABEL_13:
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
  unsigned int v23 = v19 + (a6 >> 1);
  if (v23 < v17 + v19)
  {
    unsigned int v24 = v16 + v18;
    v25 = &BaseAddressOfPlane[v23 * v28];
    do
    {
      for (unsigned int i = v18 + (a5 >> 1); i < v24; i += a5)
        ++a7->var0[v25[i]];
      v25 += v28 * a6;
      v23 += a6;
    }
    while (v23 < v17 + v19);
  }
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  return 0;
}

- (int)singleComponentGPUAverageInputPixelBuffer:(__CVBuffer *)a3 validRect:(CGRect)a4 outputAverage:(float *)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  bzero(v25, 0x400uLL);
  if (CVPixelBufferGetPixelFormatType(a3) != 1278226488 || !a5) {
    goto LABEL_20;
  }
  v26.origin.double x = x;
  v26.origin.double y = y;
  v26.size.double width = width;
  v26.size.double height = height;
  if (CGRectIsNull(v26))
  {
    unsigned int WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
    unsigned int HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
    goto LABEL_12;
  }
  size_t v14 = CVPixelBufferGetWidthOfPlane(a3, 0);
  if (x < 0.0
    || x + width > (double)v14
    || width <= 0.0
    || (size_t v15 = CVPixelBufferGetHeightOfPlane(a3, 0), y < 0.0)
    || y + height > (double)v15
    || height <= 0.0)
  {
LABEL_20:
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12780;
  }
  unsigned int WidthOfPlane = width;
  unsigned int HeightOfPlane = height;
LABEL_12:
  int v16 = -[FigMetalHistogram singleComponentGPUHistogramInputPixelBuffer:validRect:outputHistogram:](self, "singleComponentGPUHistogramInputPixelBuffer:validRect:outputHistogram:", a3, v25, x, y, width, height);
  if (v16)
  {
    int v23 = v16;
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    uint64_t v17 = 0;
    int32x4_t v18 = (int32x4_t)xmmword_1A5DBD230;
    int64x2_t v19 = 0uLL;
    v20.i64[0] = 0x400000004;
    v20.i64[1] = 0x400000004;
    int64x2_t v21 = 0uLL;
    do
    {
      uint32x4_t v22 = (uint32x4_t)vmulq_s32(*(int32x4_t *)&v25[v17], v18);
      int64x2_t v21 = (int64x2_t)vaddw_high_u32((uint64x2_t)v21, v22);
      int64x2_t v19 = (int64x2_t)vaddw_u32((uint64x2_t)v19, *(uint32x2_t *)v22.i8);
      int32x4_t v18 = vaddq_s32(v18, v20);
      v17 += 16;
    }
    while (v17 != 1024);
    int v23 = 0;
    *a5 = (float)(unint64_t)vaddvq_s64(vaddq_s64(v19, v21))
        / (float)((float)((float)WidthOfPlane * (float)HeightOfPlane) * 255.0);
  }
  return v23;
}

- (int)singleComponentCPUAverageInputPixelBuffer:(__CVBuffer *)a3 validRect:(CGRect)a4 outputAverage:(float *)a5
{
  if (!a3) {
    goto LABEL_19;
  }
  if (!a5) {
    goto LABEL_19;
  }
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  if (CVPixelBufferGetPixelFormatType(a3) != 1278226488) {
    goto LABEL_19;
  }
  unsigned int BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
  v24.origin.double x = x;
  v24.origin.double y = y;
  v24.size.double width = width;
  v24.size.double height = height;
  if (!CGRectIsNull(v24))
  {
    size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
    if (x >= 0.0 && x + width <= (double)WidthOfPlane && width > 0.0)
    {
      size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
      if (y >= 0.0 && y + height <= (double)HeightOfPlane && height > 0.0)
      {
        unsigned int v14 = x;
        unsigned int v15 = y;
        unsigned int v12 = width;
        unsigned int v13 = height;
        goto LABEL_13;
      }
    }
LABEL_19:
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12780;
  }
  unsigned int v12 = CVPixelBufferGetWidthOfPlane(a3, 0);
  unsigned int v13 = CVPixelBufferGetHeightOfPlane(a3, 0);
  unsigned int v14 = 0;
  unsigned int v15 = 0;
LABEL_13:
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  BaseAddressOfPlane = (unsigned __int8 *)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
  unint64_t v19 = 0;
  unsigned int v20 = v13 + v15;
  if (v15 < v13 + v15)
  {
    unint64_t v19 = 0;
    uint64_t v21 = v12 + v14;
    do
    {
      uint64_t v22 = v14;
      if (v14 < v21)
      {
        do
          v19 += BaseAddressOfPlane[v22++];
        while (v21 != v22);
      }
      BaseAddressOfPlane += BytesPerRowOfPlane;
      ++v15;
    }
    while (v15 != v20);
  }
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  int result = 0;
  *a5 = (float)v19 / (float)((float)(v13 * v12) * 255.0);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self->_pipelineStates, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end