@interface CVAFilterInfimumConvolution
- (CVAFilterInfimumConvolution)initWithDevice:(id)a3 library:(id)a4 pipelineLibrary:(id)a5 bufferWidth:(unint64_t)a6 bufferHeight:(unint64_t)a7 error:(id *)a8;
- (void)encodeInfimumToCommandBufferInternal:(id)a3 sourceTexture:(id)a4 smallSourceTexture:(id)a5 destinationTexture:(id)a6;
- (void)encodeToCommandBuffer:(id)a3 sourceTexture:(id)a4 smallSourceTexture:(id)a5 destinationTexture:(id)a6 orientation:(float)a7 majorRadius:(float)a8 minorRadius:(float)a9 iterations:(unsigned int)a10;
- (void)encodeToCommandBufferInternal:(double)a3 sourceTexture:(double)a4 destinationTexture:(double)a5 config:(uint64_t)a6;
@end

@implementation CVAFilterInfimumConvolution

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infimumConvolutionKernel, 0);
  objc_storeStrong((id *)&self->_infimumKernel, 0);
  objc_storeStrong((id *)&self->_tmpOutHalf[1], 0);
  objc_storeStrong((id *)self->_tmpOutHalf, 0);
  objc_storeStrong((id *)&self->_tmpBlurHalf, 0);
  objc_storeStrong((id *)&self->_pipelineLibrary, 0);
  objc_storeStrong((id *)&self->_library, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

- (void)encodeToCommandBuffer:(id)a3 sourceTexture:(id)a4 smallSourceTexture:(id)a5 destinationTexture:(id)a6 orientation:(float)a7 majorRadius:(float)a8 minorRadius:(float)a9 iterations:(unsigned int)a10
{
  double v43 = *(double *)&a9;
  double v41 = *(double *)&a8;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  double v22 = v41;
  double v21 = v43;
  id v23 = v20;
  LODWORD(v24) = 1.0;
  if (*(float *)&v41 < 0.0 || *(float *)&v41 > 1.0)
  {
    v39 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v24, v43, v41);
    [v39 handleFailureInMethod:a2 object:self file:@"CVAFilterInfimumConvolution.mm" lineNumber:131 description:@"CVAInfimumConvolution: majorRadius not in [0,1]"];

    double v21 = v43;
    if (*(float *)&v43 >= 0.0)
    {
LABEL_6:
      LODWORD(v24) = 0.5;
      if (*(float *)&v21 <= 0.5) {
        goto LABEL_7;
      }
    }
  }
  else if (*(float *)&v43 >= 0.0)
  {
    goto LABEL_6;
  }
  v40 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v24, v21, v22);
  [v40 handleFailureInMethod:a2 object:self file:@"CVAFilterInfimumConvolution.mm" lineNumber:135 description:@"CVAInfimumConvolution: minorRadius not in [0,0.5]"];

LABEL_7:
  v26 = self->_tmpOutHalf[0];
  v27 = self->_tmpOutHalf[1];
  if (a10)
  {
    float v28 = fmodf(a7 + 0.7854, 3.1416);
    __float2 v29 = __sincosf_stret(v28 + -0.7854);
    v30.f32[0] = -(float)(*(float *)&v41 * v29.__sinval);
    *(float *)&double v31 = v29.__cosval * *(float *)&v41;
    *((float *)&v31 + 1) = v30.f32[0];
    *(float *)&double v32 = -(float)(v29.__cosval * *(float *)&v41);
    v30.f32[1] = *(float *)&v32;
    float32x2_t v33 = vmul_n_f32(vdiv_f32(v30, (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v41, 0)), *(float *)&v43);
    double v34 = COERCE_DOUBLE(vneg_f32(v33));
    *((float *)&v32 + 1) = -(float)(v29.__sinval * (float)-*(float *)&v41);
    double v42 = v32;
    double v44 = v31;
    -[CVAFilterInfimumConvolution encodeToCommandBufferInternal:sourceTexture:destinationTexture:config:](self, "encodeToCommandBufferInternal:sourceTexture:destinationTexture:config:", v17, v19, v26, v31, *(double *)&v33);
    unsigned int v35 = a10 - 1;
    if (a10 == 1)
    {
      v36 = v27;
    }
    else
    {
      do
      {
        v36 = v26;
        v26 = v27;
        -[CVAFilterInfimumConvolution encodeToCommandBufferInternal:sourceTexture:destinationTexture:config:](self, "encodeToCommandBufferInternal:sourceTexture:destinationTexture:config:", v17, v36, v27, v44, *(double *)&v33, v42, v34);
        v27 = v36;
        --v35;
      }
      while (v35);
    }
    v27 = v26;
    v38 = v26;
    v26 = v36;
    [(CVAFilterInfimumConvolution *)self encodeInfimumToCommandBufferInternal:v17 sourceTexture:v18 smallSourceTexture:v38 destinationTexture:v23];
  }
  else
  {
    v37 = [v17 blitCommandEncoder];
    memset(v47, 0, sizeof(v47));
    v46[0] = [v18 width];
    v46[1] = [v18 height];
    v46[2] = 1;
    memset(v45, 0, sizeof(v45));
    [v37 copyFromTexture:v18 sourceSlice:0 sourceLevel:0 sourceOrigin:v47 sourceSize:v46 toTexture:v23 destinationSlice:0 destinationLevel:0 destinationOrigin:v45];
    [v37 endEncoding];
  }
}

- (void)encodeInfimumToCommandBufferInternal:(id)a3 sourceTexture:(id)a4 smallSourceTexture:(id)a5 destinationTexture:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [a3 computeCommandEncoder];
  [v13 setLabel:@"_infimumKernel"];
  [v13 setComputePipelineState:self->_infimumKernel];
  [v13 setTexture:v10 atIndex:0];
  [v13 setTexture:v11 atIndex:1];
  [v13 setTexture:v12 atIndex:2];
  uint64_t v14 = [v10 width];
  uint64_t v15 = [v10 height];
  v16.i64[0] = v14;
  v16.i64[1] = v15;
  uint64x2_t v19 = vshrq_n_u64(vsraq_n_u64((uint64x2_t)vdupq_n_s64(0xFuLL), v16, 1uLL), 4uLL);
  uint64_t v20 = 1;
  uint64_t v18 = 1;
  long long v17 = xmmword_1BA86C930;
  [v13 dispatchThreadgroups:&v19 threadsPerThreadgroup:&v17];
  [v13 endEncoding];
}

- (void)encodeToCommandBufferInternal:(double)a3 sourceTexture:(double)a4 destinationTexture:(double)a5 config:(uint64_t)a6
{
  *(double *)double v22 = a2;
  *(double *)&v22[1] = a3;
  *(double *)&v22[2] = a4;
  *(double *)&v22[3] = a5;
  id v12 = a8;
  id v13 = a9;
  uint64_t v14 = [a7 computeCommandEncoder];
  [v14 setLabel:@"_infimumConvolutionKernel"];
  [v14 setComputePipelineState:*(void *)(a1 + 80)];
  [v14 setTexture:v12 atIndex:0];
  [v14 setTexture:v13 atIndex:1];
  [v14 setBytes:v22 length:32 atIndex:0];
  uint64_t v15 = [v12 width];
  uint64_t v16 = [v12 height];
  v17.i64[0] = v15;
  v17.i64[1] = v16;
  uint64x2_t v20 = vshrq_n_u64(vsraq_n_u64((uint64x2_t)vdupq_n_s64(0xFuLL), v17, 1uLL), 4uLL);
  uint64_t v21 = 1;
  uint64_t v19 = 1;
  long long v18 = xmmword_1BA86C930;
  [v14 dispatchThreadgroups:&v20 threadsPerThreadgroup:&v18];
  [v14 endEncoding];
}

- (CVAFilterInfimumConvolution)initWithDevice:(id)a3 library:(id)a4 pipelineLibrary:(id)a5 bufferWidth:(unint64_t)a6 bufferHeight:(unint64_t)a7 error:(id *)a8
{
  id v26 = a3;
  id v25 = a4;
  id v15 = a5;
  v27.receiver = self;
  v27.super_class = (Class)CVAFilterInfimumConvolution;
  uint64_t v16 = [(ImageSaverRegistrator *)&v27 init];
  uint64x2_t v17 = v16;
  if (!v16) {
    goto LABEL_5;
  }
  p_device = (void **)&v16->_device;
  objc_storeStrong((id *)&v16->_device, a3);
  objc_storeStrong((id *)&v17->_library, a4);
  objc_storeStrong((id *)&v17->_pipelineLibrary, a5);
  v17->_width = a6;
  v17->_height = a7;
  uint64_t v19 = sub_1BA862650(*p_device, 10, v17->_width, a7, 0, a8);
  uint64x2_t v20 = v17->_tmpOutHalf[0];
  v17->_tmpOutHalf[0] = (MTLTexture *)v19;

  uint64_t v21 = sub_1BA862650(*p_device, 10, v17->_width, v17->_height, 0, a8);
  double v22 = v17->_tmpOutHalf[1];
  v17->_tmpOutHalf[1] = (MTLTexture *)v21;

  sub_1BA8328CC((void **)&v17->_infimumKernel, v17->_library, v17->_pipelineLibrary, *p_device, @"infimum", a8, 0);
  if (!v17->_infimumKernel) {
    goto LABEL_5;
  }
  sub_1BA8328CC((void **)&v17->_infimumConvolutionKernel, v17->_library, v17->_pipelineLibrary, *p_device, @"infimumConvolution", a8, 0);
  if (v17->_infimumConvolutionKernel) {
    id v23 = v17;
  }
  else {
LABEL_5:
  }
    id v23 = 0;

  return v23;
}

@end