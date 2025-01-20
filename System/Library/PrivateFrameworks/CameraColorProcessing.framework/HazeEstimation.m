@interface HazeEstimation
- (HazeEstimation)initWithMetalContext:(id)a3;
- (HazeProperties)hazeProperties;
- (HazeProperties)hazePropertiesForLTM;
- (MTLTexture)inputRGBTexture;
- (SourceROI)hazeROI;
- (__n128)calculateHazeValues:(uint64_t)a3 pixels:(int)a4 thresh:(float32x4_t *)a5 properties:(void *)a6;
- (__n128)hazeValue;
- (__n128)hazeValueForLTM;
- (int)allocInternalData;
- (int)configure;
- (int)createShaders;
- (int)estimateHaze:(HazeEstimation *)self;
- (int)prepareThumbnail;
- (int)run;
- (void)releaseTextures;
- (void)setHazeProperties:(id)a3;
- (void)setHazePropertiesForLTM:(id)a3;
- (void)setHazeROI:(SourceROI)a3;
- (void)setHazeValue:(HazeEstimation *)self;
- (void)setHazeValueForLTM:(HazeEstimation *)self;
- (void)setInputRGBTexture:(id)a3;
@end

@implementation HazeEstimation

- (void)setHazePropertiesForLTM:(id)a3
{
}

- (HazeEstimation)initWithMetalContext:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    int v18 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_10;
  }
  objc_storeStrong((id *)&self->_metalContext, a3);
  v6 = [v5 device];
  device = self->_device;
  self->_device = v6;

  v16.receiver = self;
  v16.super_class = (Class)HazeEstimation;
  v8 = [(HazeEstimation *)&v16 init];
  self = v8;
  if (!v8 || [(HazeEstimation *)v8 createShaders]) {
    goto LABEL_10;
  }
  v9 = (HazeProperties *)objc_opt_new();
  hazeProperties = self->_hazeProperties;
  self->_hazeProperties = v9;

  if (!self->_hazeProperties)
  {
    FigSignalErrorAt();
    goto LABEL_10;
  }
  self->_hazeConfigured = 0;
  if ([(HazeEstimation *)self configure])
  {
LABEL_10:
    v13 = 0;
    goto LABEL_7;
  }
  v11 = [(FigMetalContext *)self->_metalContext commandQueue];
  commandQueue = self->_commandQueue;
  self->_commandQueue = v11;

  self = self;
  v13 = self;
LABEL_7:

  return v13;
}

- (HazeProperties)hazePropertiesForLTM
{
  return self->_hazePropertiesForLTM;
}

- (int)createShaders
{
  v3 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"Haze::hazeThumbnailGeneration" constants:0];
  computePipelineHazeThumbnailGeneration = self->_computePipelineHazeThumbnailGeneration;
  self->_computePipelineHazeThumbnailGeneration = v3;

  if (self->_computePipelineHazeThumbnailGeneration) {
    return 0;
  }
  return FigSignalErrorAt();
}

- (int)configure
{
  *(void *)self->_anon_28 = 0xC000000120;
  self->_hazeConfigured = 1;
  return 0;
}

- (int)allocInternalData
{
  v3 = [(FigMetalContext *)self->_metalContext allocator];
  v4 = (void *)[v3 newTextureDescriptor];

  if (!v4) {
    goto LABEL_7;
  }
  FigMetalDecRef();
  FigMetalDecRef();
  if (!self->_hazeConfigured) {
    goto LABEL_7;
  }
  id v5 = [v4 desc];
  [v5 setTextureType:2];

  uint64_t v6 = *(void *)self->_anon_28;
  v7 = [v4 desc];
  [v7 setWidth:v6];

  uint64_t v8 = *(unsigned int *)&self->_anon_28[4];
  v9 = [v4 desc];
  [v9 setHeight:v8];

  v10 = [v4 desc];
  [v10 setDepth:1];

  v11 = [v4 desc];
  [v11 setUsage:7];

  v12 = [v4 desc];
  [v12 setPixelFormat:115];

  [v4 setLabel:@"haze_estimation_thumbnail_tex"];
  v13 = [(FigMetalContext *)self->_metalContext allocator];
  v14 = (MTLTexture *)[v13 newTextureWithDescriptor:v4];
  thumbnailTexture = self->_thumbnailTexture;
  self->_thumbnailTexture = v14;

  if (!self->_thumbnailTexture) {
    goto LABEL_7;
  }
  objc_super v16 = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithLength:884784 options:0];
  hazeInternalBuffer = self->_hazeInternalBuffer;
  self->_hazeInternalBuffer = v16;

  if (self->_hazeInternalBuffer) {
    int v18 = 0;
  }
  else {
LABEL_7:
  }
    int v18 = FigSignalErrorAt();

  return v18;
}

- (void)releaseTextures
{
  self->_inputRGBTexture = 0;
  MEMORY[0x270F9A758]();
}

- (int)run
{
  int v3 = [(HazeEstimation *)self allocInternalData];
  if (!v3)
  {
    int v3 = [(HazeEstimation *)self prepareThumbnail];
    if (!v3) {
      int v3 = [(HazeEstimation *)self estimateHaze:[(MTLBuffer *)self->_hazeInternalBuffer contents] + 48];
    }
  }
  int v4 = v3;
  FigMetalDecRef();
  FigMetalDecRef();
  return v4;
}

- (int)prepareThumbnail
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int v3 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  int v4 = v3;
  if (v3 && ([v3 computeCommandEncoder], (id v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v6 = v5;
    [v5 setComputePipelineState:self->_computePipelineHazeThumbnailGeneration];
    [v6 setTexture:self->_inputRGBTexture atIndex:0];
    [v6 setTexture:self->_thumbnailTexture atIndex:1];
    [v6 setBuffer:self->_hazeInternalBuffer offset:48 atIndex:0];
    [v6 setBytes:&self->_hazeROI length:16 atIndex:1];
    uint64_t v7 = *(void *)self->_anon_28;
    *(void *)&long long v8 = v7;
    *((void *)&v8 + 1) = HIDWORD(v7);
    long long v16 = v8;
    uint64_t v17 = 1;
    int64x2_t v14 = vdupq_n_s64(0x20uLL);
    uint64_t v15 = 1;
    [v6 dispatchThreads:&v16 threadsPerThreadgroup:&v14];
    [v6 endEncoding];

    int v9 = 0;
  }
  else
  {
    v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v9 = -1;
  }
  objc_msgSend(v4, "commit", v12, v13);
  [v4 waitUntilCompleted];

  return v9;
}

- (int)estimateHaze:(HazeEstimation *)self
{
  int v3 = v2;
  [(HazeProperties *)self->_hazeProperties maxHazePercentile];
  int v6 = (int)(float)((float)(v5 * 55296.0) * 0.25);
  uint64_t v7 = malloc_type_malloc(16 * v6, 0x1000040451B5BE8uLL);
  long long v8 = v7;
  if (!v7)
  {
    v24 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v21 = -1;
    goto LABEL_22;
  }
  memcpy(v7, v3, 16 * v6);
  qsort(v8, v6, 0x10uLL, (int (__cdecl *)(const void *, const void *))compareFloat4Luma);
  if (v6 < 1)
  {
    float32x4_t v10 = 0uLL;
    goto LABEL_8;
  }
  uint64_t v9 = v6;
  float32x4_t v10 = 0uLL;
  v11 = v3;
  do
  {
    float32x4_t v12 = *v11++;
    float32x4_t v10 = vaddq_f32(v10, v12);
    --v9;
  }
  while (v9);
  if (v6 <= 55295)
  {
LABEL_8:
    uint64_t v13 = v6;
    do
    {
      float32x4_t v14 = v3[v13];
      if (v14.f32[3] <= *((float *)v8 + 4 * v6 - 1) && v6 >= 1)
      {
        uint64_t v16 = v6;
        uint64_t v17 = (float *)v8;
        while (v14.f32[3] >= v17[3])
        {
          v17 += 4;
          if (!--v16) {
            goto LABEL_18;
          }
        }
        float32x4_t v25 = v3[v13];
        float32x4_t v26 = v10;
        memmove(v17 + 4, v17, 16 * ((int)v16 - 1));
        float32x4_t v14 = v25;
        float32x4_t v10 = v26;
        *(float32x4_t *)uint64_t v17 = v3[v13];
      }
LABEL_18:
      float32x4_t v10 = vaddq_f32(v10, v14);
      ++v13;
    }
    while (v13 != 55296);
  }
  float32x4_t v18 = vdivq_f32(v10, (float32x4_t)vdupq_n_s32(0x47580000u));
  float v19 = vminvq_f32(v18) / 10.0;
  v18.f32[0] = v19;
  [(HazeEstimation *)self calculateHazeValues:v6 pixels:v8 thresh:self->_hazeProperties properties:*(double *)v18.i64];
  *(_OWORD *)self->_hazeValue = v20;
  if (self->_hazePropertiesForLTM)
  {
    *(float *)&long long v20 = v19;
    -[HazeEstimation calculateHazeValues:pixels:thresh:properties:](self, "calculateHazeValues:pixels:thresh:properties:", v6, v8, *(double *)&v20);
    int v21 = 0;
    *(_OWORD *)self->_hazeValueForLTM = v22;
  }
  else
  {
    int v21 = 0;
  }
LABEL_22:
  free(v8);
  return v21;
}

- (__n128)calculateHazeValues:(uint64_t)a3 pixels:(int)a4 thresh:(float32x4_t *)a5 properties:(void *)a6
{
  id v9 = a6;
  uint64_t v11 = a4;
  float32x4_t v12 = 0uLL;
  if (a4 >= 1)
  {
    uint64_t v13 = a4;
    float32x4_t v14 = (simd_float4 *)a5;
    do
    {
      simd_float4 v15 = *v14++;
      float32x4_t v63 = v12;
      objc_msgSend(v9, "sr_pow");
      simd_float4 v10 = _simd_pow_f4(v15, (simd_float4)vdupq_lane_s32(v16, 0));
      float32x4_t v12 = vaddq_f32(v63, (float32x4_t)v10);
      --v13;
    }
    while (v13);
  }
  v10.f32[0] = (float)a4;
  float32x4_t v64 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v10.f32, 0);
  simd_float4 xa = (simd_float4)vdivq_f32(v12, v64);
  objc_msgSend(v9, "sr_pow");
  *(float *)v18.i32 = 1.0 / v17;
  float32x4_t v19 = (float32x4_t)_simd_pow_f4(xa, (simd_float4)vdupq_lane_s32(v18, 0));
  float32x4_t v20 = 0uLL;
  if (a4 >= 1)
  {
    do
    {
      float32x4_t v21 = *a5++;
      float32x4_t v22 = vsubq_f32(v21, v19);
      float32x4_t v20 = vmlaq_f32(v20, v22, v22);
      --v11;
    }
    while (v11);
  }
  simd_float4 xb = (simd_float4)vsqrtq_f32(vdivq_f32(v20, v64));
  float32x4_t v65 = v19;
  objc_msgSend(v9, "sr_var");
  float32x4_t v66 = vmlsq_lane_f32(v65, (float32x4_t)xb, v23, 0);
  objc_msgSend(v9, "min_display_black");
  float v25 = v24;
  [v9 evmExpRatio];
  *(float *)v27.i32 = v25 * v26;
  float32x4_t v28 = vsubq_f32(v66, (float32x4_t)vdupq_lane_s32(v27, 0));
  float32x4_t v67 = (float32x4_t)vdupq_n_s32(0x358637BDu);
  simd_float4 x = (simd_float4)vmaxnmq_f32(v28, v67);
  [v9 evtBkt];
  float v30 = v29 * vmuls_lane_f32(256.0, (float32x4_t)x, 3);
  [v9 reluC1];
  float v32 = v31;
  [v9 reluC2];
  float v34 = v33;
  [v9 reluC3];
  float v36 = (float)(v35 * a1) * 1024.0;
  [v9 reluC4];
  *(float *)&uint64_t v38 = *(float *)&v38 * 1024.0;
  if (v30 < v36)
  {
    float v39 = (float)(v32 * a1) * 1024.0;
    if (v30 <= v39) {
      *(float *)&uint64_t v38 = v34 * 1024.0;
    }
    else {
      *(float *)&uint64_t v38 = (float)(v34 * 1024.0)
    }
                     + (float)((float)((float)(*(float *)&v38 - (float)(v34 * 1024.0)) / (float)(v36 - v39))
                             * (float)(v30 - v39));
  }
  *(float *)&uint64_t v38 = *(float *)&v38 * 0.00097656;
  objc_msgSend(v9, "reluC1", v38, v37);
  float v41 = v40 * a1;
  [v9 reluC5];
  float v43 = v41 * v42;
  [v9 reluC2];
  *(float *)v45.i32 = v43 * (float)(v44 - v56);
  float32x4_t v57 = vmlaq_n_f32((float32x4_t)vdupq_lane_s32(v45, 0), (float32x4_t)x, v56);
  float v46 = vminvq_f32(v57);
  objc_msgSend(v9, "sr_sat");
  *(double *)&int32x2_t v48 = fmax((float)((float)(vmaxvq_f32(v57) / v46) - v47), 1.0);
  *(float *)v48.i32 = *(double *)v48.i32;
  int32x2_t xc = v48;
  objc_msgSend(v9, "sr_min");
  *(float *)v50.i32 = v46 * v49;
  float32x4_t v58 = vsubq_f32(v57, (float32x4_t)vdupq_lane_s32(v50, 0));
  objc_msgSend(v9, "min_display_black");
  float v52 = v51;
  [v9 evmExpRatio];
  *(float *)v54.i32 = v52 * v53;
  float32x4_t v68 = vdivq_f32(vmaxnmq_f32(vsubq_f32(v58, (float32x4_t)vdupq_lane_s32(v54, 0)), v67), (float32x4_t)vdupq_lane_s32(xc, 0));

  return (__n128)v68;
}

- (MTLTexture)inputRGBTexture
{
  return self->_inputRGBTexture;
}

- (void)setInputRGBTexture:(id)a3
{
}

- (__n128)hazeValue
{
  return a1[6];
}

- (void)setHazeValue:(HazeEstimation *)self
{
  *(_OWORD *)self->_hazeValue = v2;
}

- (SourceROI)hazeROI
{
  uint64_t v2 = *(void *)&self->_hazeROI.EndX;
  uint64_t v3 = *(void *)&self->_hazeROI.StartX;
  result.EndX = v2;
  result.EndY = HIDWORD(v2);
  result.StartX = v3;
  result.StartY = HIDWORD(v3);
  return result;
}

- (void)setHazeROI:(SourceROI)a3
{
  self->_hazeROI = a3;
}

- (__n128)hazeValueForLTM
{
  return a1[9];
}

- (void)setHazeValueForLTM:(HazeEstimation *)self
{
  *(_OWORD *)self->_hazeValueForLTM = v2;
}

- (HazeProperties)hazeProperties
{
  return self->_hazeProperties;
}

- (void)setHazeProperties:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hazePropertiesForLTM, 0);
  objc_storeStrong((id *)&self->_inputRGBTexture, 0);
  objc_storeStrong((id *)&self->_hazeProperties, 0);
  objc_storeStrong((id *)&self->_hazeInternalBuffer, 0);
  objc_storeStrong((id *)&self->_thumbnailTexture, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_computePipelineHazeThumbnailGeneration, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end