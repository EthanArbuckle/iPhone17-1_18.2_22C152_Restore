@interface CVAFilterRenderComposite
- (CVAFilterRenderComposite)initWithDevice:(id)a3 library:(id)a4 pipelineLibrary:(id)a5 error:(id *)a6;
- (NSString)label;
- (void)encodeColorCubesToCommandBuffer:(id)a3 sdofYTexture:(id)a4 sdofUVTexture:(id)a5 alphaTexture:(id)a6 fgColorLut:(id)a7 bgColorLut:(id)a8 dstColorTex:(id)a9 dstColorTex_plane1:(id)a10;
- (void)encodeToCommandBuffer:(id)a3 srcForegroundTex:(id)a4 srcBackgroundTex:(id)a5 srcCocTex:(id)a6 dstYTex:(id)a7 dstUVTex:(id)a8 fgColorLut:(id)a9 bgColorLut:(id)a10 frameNumber:(unsigned int)a11 seedGeneratorFactor:(unsigned int)a12 noiseBits:(int)a13 noiseBitsFactor:(float)a14 cubeIntensity:(float)a15 maxBlurRadius:(optional<float>)a16;
@end

@implementation CVAFilterRenderComposite

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_renderingCompositeApplyColorCubes, 0);
  objc_storeStrong((id *)&self->_renderingCompositeFixupAndColorMapKernel, 0);
  objc_storeStrong((id *)&self->_renderingCompositeFixupAndFGColorMapKernel, 0);
  objc_storeStrong((id *)&self->_renderingCompositeFixupAndBGColorMapKernel, 0);

  objc_storeStrong((id *)&self->_renderingCompositeFixUpAddNoiseKernel, 0);
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)encodeToCommandBuffer:(id)a3 srcForegroundTex:(id)a4 srcBackgroundTex:(id)a5 srcCocTex:(id)a6 dstYTex:(id)a7 dstUVTex:(id)a8 fgColorLut:(id)a9 bgColorLut:(id)a10 frameNumber:(unsigned int)a11 seedGeneratorFactor:(unsigned int)a12 noiseBits:(int)a13 noiseBitsFactor:(float)a14 cubeIntensity:(float)a15 maxBlurRadius:(optional<float>)a16
{
  id v42 = a3;
  id v23 = a4;
  id v41 = a5;
  id v43 = a6;
  id v24 = a7;
  id v25 = a8;
  id v26 = a9;
  id v27 = a10;
  uint64_t v52 = *(void *)&a11;
  int v53 = a13;
  float v54 = a14;
  float v55 = a15;
  float v28 = (float)(a16.m_storage * 2.0) + 1.0;
  float v29 = 1.0 - (float)(1.0 / v28);
  BOOL v30 = v28 <= 1.0;
  float v31 = 0.0;
  if (!v30) {
    float v31 = v29;
  }
  if (!a16.m_initialized) {
    float v31 = 1.0;
  }
  float v56 = v31;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F766A0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1E9F766A0))
  {
    v38 = +[CVAPreferenceManager defaults];
    char v39 = [v38 BOOLForKey:@"CVAPhotoDebugCoC"];

    byte_1E9F769C5 = v39;
    __cxa_guard_release(&qword_1E9F766A0);
  }
  if (byte_1E9F769C5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"noisePercentToAddAtInfinity = %.1f", (float)(v56 * 100.0));
  }
  unint64_t v32 = [v23 width];
  unint64_t v33 = [v23 height];
  v34 = [v42 computeCommandEncoder];
  v35 = v34;
  if (v26 && v27)
  {
    [v34 setLabel:@"_renderingCompositeFixupAndColorMapKernel"];
    [v35 setComputePipelineState:self->_renderingCompositeFixupAndColorMapKernel];
    [v35 setTexture:v41 atIndex:0];
    [v35 setTexture:v23 atIndex:1];
    [v35 setTexture:v43 atIndex:2];
    [v35 setTexture:v24 atIndex:3];
    [v35 setTexture:v25 atIndex:4];
    [v35 setTexture:v27 atIndex:5];
    [v35 setTexture:v26 atIndex:6];
    [v35 setBytes:&v52 length:24 atIndex:0];
    unint64_t v51 = ((v32 >> 1) + 15) >> 4;
    v36 = &v50;
    v37 = &v51;
  }
  else if (v27)
  {
    [v34 setLabel:@"_renderingCompositeFixupAndBGColorMapKernel"];
    [v35 setComputePipelineState:self->_renderingCompositeFixupAndBGColorMapKernel];
    [v35 setTexture:v41 atIndex:0];
    [v35 setTexture:v23 atIndex:1];
    [v35 setTexture:v43 atIndex:2];
    [v35 setTexture:v24 atIndex:3];
    [v35 setTexture:v25 atIndex:4];
    [v35 setTexture:v27 atIndex:5];
    [v35 setBytes:&v52 length:24 atIndex:0];
    unint64_t v49 = ((v32 >> 1) + 15) >> 4;
    v36 = &v48;
    v37 = &v49;
  }
  else if (v26)
  {
    [v34 setLabel:@"_renderingCompositeFixupAndFGColorMapKernel"];
    [v35 setComputePipelineState:self->_renderingCompositeFixupAndFGColorMapKernel];
    [v35 setTexture:v41 atIndex:0];
    [v35 setTexture:v23 atIndex:1];
    [v35 setTexture:v43 atIndex:2];
    [v35 setTexture:v24 atIndex:3];
    [v35 setTexture:v25 atIndex:4];
    [v35 setTexture:v26 atIndex:6];
    [v35 setBytes:&v52 length:24 atIndex:0];
    unint64_t v47 = ((v32 >> 1) + 15) >> 4;
    v36 = &v46;
    v37 = &v47;
  }
  else
  {
    [v34 setLabel:@"_renderingCompositeFixUpAddNoiseKernel"];
    [v35 setComputePipelineState:self->_renderingCompositeFixUpAddNoiseKernel];
    [v35 setTexture:v41 atIndex:0];
    [v35 setTexture:v23 atIndex:1];
    [v35 setTexture:v43 atIndex:2];
    [v35 setTexture:v24 atIndex:3];
    [v35 setTexture:v25 atIndex:4];
    [v35 setBytes:&v52 length:24 atIndex:0];
    unint64_t v45 = ((v32 >> 1) + 15) >> 4;
    v36 = &v44;
    v37 = &v45;
  }
  v37[1] = ((v33 >> 1) + 15) >> 4;
  v37[2] = 1;
  *((void *)v36 + 2) = 1;
  *(_OWORD *)v36 = xmmword_1BA86C930;
  objc_msgSend(v35, "dispatchThreadgroups:threadsPerThreadgroup:");
  [v35 endEncoding];
}

- (void)encodeColorCubesToCommandBuffer:(id)a3 sdofYTexture:(id)a4 sdofUVTexture:(id)a5 alphaTexture:(id)a6 fgColorLut:(id)a7 bgColorLut:(id)a8 dstColorTex:(id)a9 dstColorTex_plane1:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v30 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  uint64_t v23 = [v17 width];
  uint64_t v24 = [v17 height];
  if (v19 && v20)
  {
    uint64_t v25 = v24;
    id v29 = v16;
    id v26 = [v16 computeCommandEncoder];
    [v26 setLabel:@"_renderingCompositeApplyColorCubes"];
    [v26 setComputePipelineState:self->_renderingCompositeApplyColorCubes];
    [v26 setTexture:v17 atIndex:0];
    [v26 setTexture:v18 atIndex:1];
    [v26 setTexture:v30 atIndex:2];
    [v26 setTexture:v20 atIndex:3];
    [v26 setTexture:v19 atIndex:4];
    [v26 setTexture:v21 atIndex:5];
    [v26 setTexture:v22 atIndex:6];
    v27.i64[0] = v23;
    v27.i64[1] = v25;
    uint64x2_t v33 = vshrq_n_u64(vsraq_n_u64((uint64x2_t)vdupq_n_s64(0xFuLL), v27, 1uLL), 4uLL);
    uint64_t v34 = 1;
    uint64_t v32 = 1;
    long long v31 = xmmword_1BA86C930;
    [v26 dispatchThreadgroups:&v33 threadsPerThreadgroup:&v31];
    [v26 endEncoding];

    id v16 = v29;
  }
  else
  {
    float v28 = [v16 blitCommandEncoder];
    [v28 copyFromTexture:v17 toTexture:v21];
    [v28 copyFromTexture:v18 toTexture:v22];
    [v28 endEncoding];
  }
}

- (CVAFilterRenderComposite)initWithDevice:(id)a3 library:(id)a4 pipelineLibrary:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v31.receiver = self;
  v31.super_class = (Class)CVAFilterRenderComposite;
  v13 = [(CVAFilterRenderComposite *)&v31 init];
  if (v13)
  {
    v14 = (objc_class *)objc_opt_class();
    uint64_t v15 = NSStringFromClass(v14);
    label = v13->_label;
    v13->_label = (NSString *)v15;

    id v17 = v10;
    id v18 = objc_opt_new();
    id v19 = (void *)[v18 copy];
    __int16 v30 = 0;
    [v19 setConstantValue:(char *)&v30 + 1 type:53 withName:@"kUseBgLut"];
    [v19 setConstantValue:&v30 type:53 withName:@"kUseFgLut"];
    sub_1BA8328CC((void **)&v13->_renderingCompositeFixUpAddNoiseKernel, v11, v12, v17, @"compositeFixupAndAddNoise", a6, v19);
    renderingCompositeFixUpAddNoiseKernel = v13->_renderingCompositeFixUpAddNoiseKernel;

    if (!renderingCompositeFixUpAddNoiseKernel) {
      goto LABEL_8;
    }
    id v21 = (void *)[v18 copy];
    __int16 v30 = 257;
    [v21 setConstantValue:(char *)&v30 + 1 type:53 withName:@"kUseBgLut"];
    [v21 setConstantValue:&v30 type:53 withName:@"kUseFgLut"];
    sub_1BA8328CC((void **)&v13->_renderingCompositeApplyColorCubes, v11, v12, v17, @"compositeApplyColorCubes", a6, v21);
    renderingCompositeApplyColorCubes = v13->_renderingCompositeApplyColorCubes;

    if (!renderingCompositeApplyColorCubes) {
      goto LABEL_8;
    }
    uint64_t v23 = (void *)[v18 copy];
    __int16 v30 = 256;
    [v23 setConstantValue:(char *)&v30 + 1 type:53 withName:@"kUseBgLut"];
    [v23 setConstantValue:&v30 type:53 withName:@"kUseFgLut"];
    sub_1BA8328CC((void **)&v13->_renderingCompositeFixupAndBGColorMapKernel, v11, v12, v17, @"compositeFixupAndAddNoise", a6, v23);
    renderingCompositeFixupAndBGColorMapKernel = v13->_renderingCompositeFixupAndBGColorMapKernel;

    if (!renderingCompositeFixupAndBGColorMapKernel) {
      goto LABEL_8;
    }
    uint64_t v25 = (void *)[v18 copy];
    __int16 v30 = 1;
    [v25 setConstantValue:(char *)&v30 + 1 type:53 withName:@"kUseBgLut"];
    [v25 setConstantValue:&v30 type:53 withName:@"kUseFgLut"];
    sub_1BA8328CC((void **)&v13->_renderingCompositeFixupAndFGColorMapKernel, v11, v12, v17, @"compositeFixupAndAddNoise", a6, v25);
    renderingCompositeFixupAndFGColorMapKernel = v13->_renderingCompositeFixupAndFGColorMapKernel;

    if (renderingCompositeFixupAndFGColorMapKernel)
    {
      uint64x2_t v27 = (void *)[v18 copy];
      __int16 v30 = 257;
      [v27 setConstantValue:(char *)&v30 + 1 type:53 withName:@"kUseBgLut"];
      [v27 setConstantValue:&v30 type:53 withName:@"kUseFgLut"];
      sub_1BA8328CC((void **)&v13->_renderingCompositeFixupAndColorMapKernel, v11, v12, v17, @"compositeFixupAndAddNoise", a6, v27);
      renderingCompositeFixupAndColorMapKernel = (CVAFilterRenderComposite *)v13->_renderingCompositeFixupAndColorMapKernel;

      if (renderingCompositeFixupAndColorMapKernel) {
        renderingCompositeFixupAndColorMapKernel = v13;
      }
    }
    else
    {
LABEL_8:
      renderingCompositeFixupAndColorMapKernel = 0;
    }
  }
  else
  {
    renderingCompositeFixupAndColorMapKernel = 0;
  }

  return renderingCompositeFixupAndColorMapKernel;
}

@end