@interface NTKColtanRenderer
- (CGSize)size;
- (NTKColtanRenderer)initWithSize:(CGSize)a3;
- (NTKColtanResourceManager)resourceManager;
- (float)hourAngle;
- (float)minuteAngle;
- (float)secondAngle;
- (void)_downsampleTexture:(id)a3 inEncoder:(id)a4 desiredMipLevels:(int)a5;
- (void)drawWithRenderEncoder:(id)a3 forQuad:(id)a4;
- (void)resetTemporalAccumulation;
- (void)setHourAngle:(float)a3;
- (void)setMinuteAngle:(float)a3;
- (void)setResourceManager:(id)a3;
- (void)setSecondAngle:(float)a3;
- (void)updateWithCommandBuffer:(id)a3 forQuad:(id)a4;
@end

@implementation NTKColtanRenderer

- (NTKColtanRenderer)initWithSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v38.receiver = self;
  v38.super_class = (Class)NTKColtanRenderer;
  v5 = [(NTKColtanRenderer *)&v38 init];
  v6 = v5;
  if (v5)
  {
    v5->_size.CGFloat width = width;
    v5->_size.CGFloat height = height;
    v5->_shadowTexturesQuality = 0;
    v7 = (MTLDevice *)MTLCreateSystemDefaultDevice();
    device = v6->_device;
    v6->_device = v7;

    v9 = (MTLCommandQueue *)[(MTLDevice *)v6->_device newCommandQueue];
    commandQueue = v6->_commandQueue;
    v6->_commandQueue = v9;

    v11 = (MTLBuffer *)[(MTLDevice *)v6->_device newBufferWithLength:64 options:32];
    lightsBuffer = v6->_lightsBuffer;
    v6->_lightsBuffer = v11;

    v6->_shouldUseAccumulationForNextFrame = 0;
    int8x16_t v13 = vandq_s8((int8x16_t)vaddq_s64((int64x2_t)vcvtq_u64_f64(vmulq_f64((float64x2_t)v6->_size, (float64x2_t)vdupq_n_s64(0x3FE3333333333333uLL))), vdupq_n_s64(0xFuLL)), (int8x16_t)vdupq_n_s64(0xFFFFFFFFFFFFFFE0));
    *(int8x16_t *)&v6->_unint64_t shadowTargetWidth = v13;
    char v14 = 1;
    v15 = +[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:width:height:mipmapped:](MTLTextureDescriptor, "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 70, *(_OWORD *)&v13, 1);
    [v15 setUsage:3];
    [v15 setStorageMode:2];
    uint64_t v16 = 0;
    shadowTexturesHq = v6->_shadowTexturesHq;
    do
    {
      char v18 = v14;
      id v19 = [(MTLDevice *)v6->_device newTextureWithDescriptor:v15];
      if (!v19)
      {

        goto LABEL_18;
      }
      v20 = v19;
      v21 = +[NSString stringWithFormat:@"shadows high-quality %d", v16];
      [v20 setLabel:v21];

      v22 = shadowTexturesHq[v16];
      shadowTexturesHq[v16] = (MTLTexture *)v20;

      char v14 = 0;
      uint64_t v16 = 1;
    }
    while ((v18 & 1) != 0);
    unint64_t shadowTargetWidth = v6->_shadowTargetWidth;
    unint64_t shadowTargetHeight = v6->_shadowTargetHeight;
    if (shadowTargetWidth <= 1) {
      uint64_t v25 = 1;
    }
    else {
      uint64_t v25 = shadowTargetWidth >> 1;
    }
    if (shadowTargetHeight <= 1) {
      uint64_t v26 = 1;
    }
    else {
      uint64_t v26 = shadowTargetHeight >> 1;
    }
    char v27 = 1;
    v28 = +[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:70 width:v25 height:v26 mipmapped:1];

    [v28 setUsage:3];
    [v28 setStorageMode:2];
    uint64_t v29 = 0;
    shadowTexturesLq = v6->_shadowTexturesLq;
    while (1)
    {
      char v31 = v27;
      id v32 = [(MTLDevice *)v6->_device newTextureWithDescriptor:v28];
      if (!v32) {
        break;
      }
      v33 = v32;
      v34 = +[NSString stringWithFormat:@"shadows low-quality %d", v29];
      [v33 setLabel:v34];

      v35 = shadowTexturesLq[v29];
      shadowTexturesLq[v29] = (MTLTexture *)v33;

      char v27 = 0;
      uint64_t v29 = 1;
      if ((v31 & 1) == 0)
      {

        goto LABEL_15;
      }
    }

LABEL_18:
    v36 = 0;
  }
  else
  {
LABEL_15:
    v36 = v6;
  }

  return v36;
}

- (void)updateWithCommandBuffer:(id)a3 forQuad:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_resourceManager = &self->_resourceManager;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resourceManager);

  if (!WeakRetained) {
    goto LABEL_34;
  }
  unint64_t shadowTexturesQuality = self->_shadowTexturesQuality;
  v11 = (char *)[v7 quality];
  if (v11 != (unsigned char *)&dword_0 + 1 || shadowTexturesQuality)
  {
    if (v11 || shadowTexturesQuality != 1) {
      goto LABEL_25;
    }
    v49 = v6;
    self->_unint64_t shadowTexturesQuality = 0;
    v12 = [v6 blitCommandEncoder];
    v54 = self->_shadowTexturesLq[self->_currentShadowTextureIndex];
    v53 = self->_shadowTexturesLq[1 - self->_currentShadowTextureIndex];
    v24 = self->_shadowTexturesHq[self->_currentShadowTextureIndex];
    v23 = self->_shadowTexturesHq[1 - self->_currentShadowTextureIndex];
    uint64_t v25 = 0;
    uint64x2_t v26 = *(uint64x2_t *)&self->_shadowTargetWidth;
    int8x16_t v27 = (int8x16_t)vshrq_n_u64(v26, 1uLL);
    int8x16_t v28 = (int8x16_t)vcgtq_u64(v26, (uint64x2_t)vdupq_n_s64(1uLL));
    int64x2_t v29 = vsubq_s64((int64x2_t)vandq_s8(v27, v28), (int64x2_t)vmvnq_s8(v28));
    char v30 = 1;
    do
    {
      uint64x2_t v52 = (uint64x2_t)v29;
      char v31 = v30;
      int64x2_t v68 = v29;
      uint64_t v69 = 1;
      memset(v70, 0, sizeof(v70));
      memset(v67, 0, sizeof(v67));
      [v12 copyFromTexture:v54 sourceSlice:0 sourceLevel:v25 sourceOrigin:v70 sourceSize:&v68 toTexture:v24 destinationSlice:0 destinationLevel:v25 + 1 destinationOrigin:v67];
      memset(v66, 0, sizeof(v66));
      uint64x2_t v64 = v52;
      uint64_t v65 = 1;
      memset(v63, 0, sizeof(v63));
      [v12 copyFromTexture:v53 sourceSlice:0 sourceLevel:v25 sourceOrigin:v66 sourceSize:&v64 toTexture:v23 destinationSlice:0 destinationLevel:v25 + 1 destinationOrigin:v63];
      char v30 = 0;
      int8x16_t v32 = (int8x16_t)vcgtq_u64(v52, (uint64x2_t)vdupq_n_s64(1uLL));
      int64x2_t v29 = vsubq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64(v52, 1uLL), v32), (int64x2_t)vmvnq_s8(v32));
      uint64_t v25 = 1;
    }
    while ((v31 & 1) != 0);
    objc_msgSend(v12, "endEncoding", *(double *)v29.i64);
    v20 = [v49 computeCommandEncoder];
    [v20 pushDebugGroup:@"transfer upsample"];
    p_resourceManager = &self->_resourceManager;
    id v33 = objc_loadWeakRetained((id *)&self->_resourceManager);
    v34 = [v33 blurUpsamplePipelineState];

    [v20 setComputePipelineState:v34];
    memset(v76, 0, sizeof(v76));
    long long v75 = 0u;
    sub_7724(v34, self->_shadowTargetWidth, self->_shadowTargetHeight, (unint64_t *)&v75);
    [v20 setTexture:v54 atIndex:0];
    [v20 setTexture:v24 atIndex:1];
    long long v73 = *(_OWORD *)&v76[1];
    uint64_t v74 = v76[3];
    long long v71 = v75;
    uint64_t v72 = v76[0];
    [v20 dispatchThreadgroups:&v73 threadsPerThreadgroup:&v71];
    [v20 setTexture:v53 atIndex:0];
    [v20 setTexture:v23 atIndex:1];
    long long v73 = *(_OWORD *)&v76[1];
    uint64_t v74 = v76[3];
    long long v71 = v75;
    uint64_t v72 = v76[0];
    [v20 dispatchThreadgroups:&v73 threadsPerThreadgroup:&v71];
    [v20 popDebugGroup];
  }
  else
  {
    id v48 = v7;
    v49 = v6;
    self->_unint64_t shadowTexturesQuality = 1;
    v12 = [v6 blitCommandEncoder];
    v54 = self->_shadowTexturesLq[self->_currentShadowTextureIndex];
    v53 = self->_shadowTexturesLq[1 - self->_currentShadowTextureIndex];
    v51 = self->_shadowTexturesHq[self->_currentShadowTextureIndex];
    v50 = self->_shadowTexturesHq[1 - self->_currentShadowTextureIndex];
    uint64_t v13 = 0;
    unint64_t shadowTargetWidth = self->_shadowTargetWidth;
    unint64_t shadowTargetHeight = self->_shadowTargetHeight;
    v47 = self;
    if (shadowTargetWidth <= 1) {
      unint64_t v16 = 1;
    }
    else {
      unint64_t v16 = shadowTargetWidth >> 1;
    }
    if (shadowTargetHeight <= 1) {
      unint64_t v17 = 1;
    }
    else {
      unint64_t v17 = shadowTargetHeight >> 1;
    }
    char v18 = 1;
    do
    {
      char v19 = v18;
      memset(v82, 0, 24);
      v81[1] = v17;
      v81[2] = 1;
      v81[0] = v16;
      memset(v80, 0, sizeof(v80));
      [v12 copyFromTexture:v51 sourceSlice:0 sourceLevel:v13 + 1 sourceOrigin:v82 sourceSize:v81 toTexture:v54 destinationSlice:0 destinationLevel:v13 destinationOrigin:v80];
      memset(v79, 0, sizeof(v79));
      v78[1] = v17;
      v78[2] = 1;
      v78[0] = v16;
      memset(v77, 0, sizeof(v77));
      [v12 copyFromTexture:v50 sourceSlice:0 sourceLevel:v13 + 1 sourceOrigin:v79 sourceSize:v78 toTexture:v53 destinationSlice:0 destinationLevel:v13 destinationOrigin:v77];
      char v18 = 0;
      if (v16 <= 1) {
        unint64_t v16 = 1;
      }
      else {
        v16 >>= 1;
      }
      if (v17 <= 1) {
        unint64_t v17 = 1;
      }
      else {
        v17 >>= 1;
      }
      LODWORD(v61) = v13 + 1;
      uint64_t v13 = 1;
    }
    while ((v19 & 1) != 0);
    [v12 endEncoding];
    v20 = [v49 computeCommandEncoder];
    [v20 pushDebugGroup:@"transfer downsample"];
    p_resourceManager = &self->_resourceManager;
    id v21 = objc_loadWeakRetained((id *)&self->_resourceManager);
    v22 = [v21 blurDownsamplePipelineState];

    [v20 setComputePipelineState:v22];
    [v20 setBytes:&v61 length:4 atIndex:0];
    [v20 setTexture:v54 atIndex:0];
    [v20 setTexture:v54 atIndex:1];
    memset(v76, 0, sizeof(v76));
    long long v75 = 0u;
    sub_7724(v22, v16, v17, (unint64_t *)&v75);
    long long v73 = *(_OWORD *)&v76[1];
    uint64_t v74 = v76[3];
    long long v71 = v75;
    uint64_t v72 = v76[0];
    [v20 dispatchThreadgroups:&v73 threadsPerThreadgroup:&v71];
    [v20 setTexture:v53 atIndex:0];
    [v20 setTexture:v53 atIndex:1];
    long long v73 = *(_OWORD *)&v76[1];
    uint64_t v74 = v76[3];
    long long v71 = v75;
    uint64_t v72 = v76[0];
    [v20 dispatchThreadgroups:&v73 threadsPerThreadgroup:&v71];
    [v20 popDebugGroup];

    self = v47;
    id v7 = v48;
    v23 = v50;
    v24 = v51;
  }

  id v6 = v49;
  if (!v20)
  {
LABEL_25:
    v20 = [v6 computeCommandEncoder];
  }
  uint64_t v61 = *(void *)&self->_hourAngle;
  float secondAngle = self->_secondAngle;
  [v20 pushDebugGroup:@"prepare shadow state"];
  id v35 = objc_loadWeakRetained((id *)p_resourceManager);
  v36 = [v35 scenePreparationComputePipelineState];
  [v20 setComputePipelineState:v36];

  [v20 setBytes:&v61 length:12 atIndex:0];
  [v20 setBuffer:self->_lightsBuffer offset:0 atIndex:1];
  int64x2_t v59 = vdupq_n_s64(1uLL);
  uint64_t v60 = 1;
  int64x2_t v57 = v59;
  uint64_t v58 = 1;
  [v20 dispatchThreadgroups:&v59 threadsPerThreadgroup:&v57];
  [v20 popDebugGroup];
  uint64_t v37 = 48;
  if (self->_shadowTexturesQuality == 1) {
    uint64_t v37 = 32;
  }
  objc_super v38 = (char *)self + v37;
  id v39 = *(id *)((char *)&self->super.isa + 8 * self->_currentShadowTextureIndex + v37);
  id v40 = *(id *)&v38[8 * (1 - self->_currentShadowTextureIndex)];
  self->_currentShadowTextureIndex = 1 - self->_currentShadowTextureIndex;
  [v20 pushDebugGroup:@"shadow"];
  v41 = self;
  uint64_t v42 = 2 * ([v7 role] == 0);
  id v43 = objc_loadWeakRetained((id *)p_resourceManager);
  v44 = [v43 shadowComputePipelineForConfig:v42];

  [v20 setComputePipelineState:v44];
  [v20 setTexture:v39 atIndex:0];
  [v20 setTexture:v40 atIndex:1];
  int v56 = 0;
  if ([v7 density] == (char *)&dword_0 + 1) {
    __int16 v45 = 12;
  }
  else {
    __int16 v45 = 0;
  }
  LOWORD(v56) = v45;
  v55[0] = arc4random();
  float v46 = 0.8;
  if (!v41->_shouldUseAccumulationForNextFrame) {
    float v46 = 0.0;
  }
  *(float *)&v55[1] = v46;
  v41->_shouldUseAccumulationForNextFrame = 1;
  [v20 setBytes:v55 length:12 atIndex:0];
  memset(v76, 0, sizeof(v76));
  long long v75 = 0u;
  sub_7724(v44, (unint64_t)[v39 width], (unint64_t)objc_msgSend(v39, "height"), (unint64_t *)&v75);
  long long v73 = *(_OWORD *)&v76[1];
  uint64_t v74 = v76[3];
  long long v71 = v75;
  uint64_t v72 = v76[0];
  [v20 dispatchThreadgroups:&v73 threadsPerThreadgroup:&v71];

  [v20 popDebugGroup];
  [(NTKColtanRenderer *)v41 _downsampleTexture:v39 inEncoder:v20 desiredMipLevels:2];

  [v20 endEncoding];
LABEL_34:
}

- (void)_downsampleTexture:(id)a3 inEncoder:(id)a4 desiredMipLevels:(int)a5
{
  id v8 = a3;
  id v9 = a4;
  p_resourceManager = &self->_resourceManager;
  id WeakRetained = objc_loadWeakRetained((id *)p_resourceManager);

  if (WeakRetained)
  {
    [v9 pushDebugGroup:@"downsample"];
    id v12 = objc_loadWeakRetained((id *)p_resourceManager);
    uint64_t v13 = [v12 blurDownsamplePipelineState];

    [v9 setComputePipelineState:v13];
    [v9 setTexture:v8 atIndex:0];
    [v9 setTexture:v8 atIndex:1];
    if (a5 >= 1)
    {
      int v14 = 0;
      do
      {
        int v25 = ++v14;
        unint64_t v15 = (unint64_t)[v8 width];
        unint64_t v16 = v15 >> v25;
        unint64_t v17 = (unint64_t)[v8 height];
        unint64_t v18 = v17 >> v25;
        if (v16) {
          BOOL v19 = v18 == 0;
        }
        else {
          BOOL v19 = 1;
        }
        if (v19) {
          break;
        }
        [v9 setBytes:&v25 length:4 atIndex:0];
        memset(v24, 0, sizeof(v24));
        sub_7724(v13, v16, v18, (unint64_t *)v24);
        long long v22 = *(_OWORD *)((char *)&v24[1] + 8);
        uint64_t v23 = *((void *)&v24[2] + 1);
        long long v20 = v24[0];
        uint64_t v21 = *(void *)&v24[1];
        [v9 dispatchThreadgroups:&v22 threadsPerThreadgroup:&v20];
      }
      while (a5 != v14);
    }
    [v9 popDebugGroup];
  }
}

- (void)drawWithRenderEncoder:(id)a3 forQuad:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resourceManager);

  if (WeakRetained)
  {
    [v6 pushDebugGroup:@"light"];
    [v7 opacity];
    float v10 = v9;
    uint64_t v11 = 2 * ([v7 role] == 0);
    if ([v7 isMasking])
    {
      [v7 maskRadius];
      unsigned int v13 = v12;
      v11 |= 1uLL;
    }
    else
    {
      unsigned int v13 = 0;
    }
    if (v10 >= 1.0) {
      uint64_t v14 = v11;
    }
    else {
      uint64_t v14 = v11 | 4;
    }
    uint64_t v15 = 48;
    if (self->_shadowTexturesQuality == 1) {
      uint64_t v15 = 32;
    }
    id v16 = *(id *)((char *)&self->super.isa + 8 * (1 - self->_currentShadowTextureIndex) + v15);
    id v17 = objc_loadWeakRetained((id *)&self->_resourceManager);
    unint64_t v18 = [v17 renderPipelineForConfig:v14];
    [v6 setRenderPipelineState:v18];

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v33 = 0u;
    *((float32x2_t *)&v41 + 1) = vmul_f32(vcvt_f32_f64((float64x2_t)self->_size), (float32x2_t)0xBF000000BF000000);
    *(void *)&long long v33 = *(void *)&self->_hourAngle;
    DWORD2(v33) = LODWORD(self->_secondAngle);
    if (objc_msgSend(v7, "density", v33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, *((void *)&v41 + 1)) == (char *)&dword_0 + 1) {
      __int16 v19 = 12;
    }
    else {
      __int16 v19 = 0;
    }
    WORD6(v33) = v19;
    *(float *)&unsigned int v20 = self->_size.height / self->_size.width;
    *(void *)&long long v40 = __PAIR64__(v13, v20);
    [v7 opacity];
    DWORD2(v40) = v21;
    [v7 tickOpacity];
    HIDWORD(v40) = v22;
    [v7 hourHandInnerColor];
    long long v34 = v23;
    [v7 hourHandOuterColor];
    long long v35 = v24;
    [v7 minuteHandInnerColor];
    long long v36 = v25;
    [v7 minuteHandOuterColor];
    long long v37 = v26;
    [v7 centerGlowColor];
    long long v38 = v27;
    [v7 secondHandColor];
    long long v39 = v28;
    [v7 tickColoration];
    LODWORD(v41) = v29;
    [v6 setVertexBytes:&v33 length:144 atIndex:0];
    [v6 setFragmentBytes:&v33 length:144 atIndex:0];
    [v6 setFragmentTexture:v16 atIndex:0];
    id v30 = objc_loadWeakRetained((id *)&self->_resourceManager);
    char v31 = [v30 handLightTexture];
    int8x16_t v32 = [v31 atlas];
    [v32 bind:v6 slot:1];

    [v6 drawPrimitives:3 vertexStart:0 vertexCount:3];
    [v6 popDebugGroup];
  }
}

- (void)resetTemporalAccumulation
{
  self->_shouldUseAccumulationForNextFrame = 0;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NTKColtanResourceManager)resourceManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resourceManager);

  return (NTKColtanResourceManager *)WeakRetained;
}

- (void)setResourceManager:(id)a3
{
}

- (float)hourAngle
{
  return self->_hourAngle;
}

- (void)setHourAngle:(float)a3
{
  self->_hourAngle = a3;
}

- (float)minuteAngle
{
  return self->_minuteAngle;
}

- (void)setMinuteAngle:(float)a3
{
  self->_minuteAngle = a3;
}

- (float)secondAngle
{
  return self->_secondAngle;
}

- (void)setSecondAngle:(float)a3
{
  self->_float secondAngle = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_resourceManager);
  for (uint64_t i = 0; i != -2; --i)
    objc_storeStrong((id *)&self->_shadowTexturesHq[i + 1], 0);
  for (uint64_t j = 40; j != 24; j -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + j), 0);
  objc_storeStrong((id *)&self->_lightsBuffer, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end