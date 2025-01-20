@interface CVAFilterRenderStagelight
- (CVAFilterRenderStagelight)initWithDevice:(id)a3 library:(id)a4 pipelineLibrary:(id)a5 error:(id *)a6;
- (NSString)label;
- (void)encodeToCommandBuffer:(id)a3 srcColorTex:(id)a4 srcAlphaTex:(id)a5 dstYTex:(id)a6 dstUVTex:(id)a7 stageLightProxyLut:(id)a8 stageLightLut:(id)a9 blackBackgroundIntensity:(float)a10 vignetteIntensity:(float)a11;
@end

@implementation CVAFilterRenderStagelight

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_renderingStageLightKernel_noCube, 0);
  objc_storeStrong((id *)&self->_renderingStageLightKernel_cube, 0);
  objc_storeStrong((id *)&self->_renderingStageLightKernel_proxyCube, 0);

  objc_storeStrong((id *)&self->_renderingStageLightKernel_bothCubes, 0);
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)encodeToCommandBuffer:(id)a3 srcColorTex:(id)a4 srcAlphaTex:(id)a5 dstYTex:(id)a6 dstUVTex:(id)a7 stageLightProxyLut:(id)a8 stageLightLut:(id)a9 blackBackgroundIntensity:(float)a10 vignetteIntensity:(float)a11
{
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  id v22 = a6;
  id v23 = a7;
  id v24 = a8;
  id v25 = a9;
  v33 = v19;
  uint64_t v26 = [v20 width];
  uint64_t v27 = [v20 height];
  *(float *)v38 = a10;
  float v28 = 1.5699;
  if ((float)(a11 * 100.0) > 0.1) {
    float v28 = (float)((float)((float)((float)(a11 * 100.0) * 3.1416) / -180.0) + 3.1416) * 0.5;
  }
  *(float *)&v38[1] = tanf(v28) * 0.5;
  v38[2] = 1065353216;
  v29 = [v19 computeCommandEncoder];
  v30 = v29;
  if (v24 && v25)
  {
    [v29 setLabel:@"_renderingStageLightKernel_bothCubes"];
    uint64_t v31 = 8;
  }
  else if (v24)
  {
    [v29 setLabel:@"_renderingStageLightKernel_proxyCube"];
    uint64_t v31 = 16;
  }
  else if (v25)
  {
    [v29 setLabel:@"_renderingStageLightKernel_cube"];
    uint64_t v31 = 24;
  }
  else
  {
    [v29 setLabel:@"_renderingStageLightKernel_noCube"];
    uint64_t v31 = 32;
  }
  [v30 setComputePipelineState:*(Class *)((char *)&self->super.isa + v31)];
  [v30 setTexture:v20 atIndex:0];
  [v30 setTexture:v21 atIndex:1];
  [v30 setTexture:v22 atIndex:2];
  [v30 setTexture:v23 atIndex:3];
  [v30 setTexture:v24 atIndex:4];
  [v30 setTexture:v25 atIndex:5];
  [v30 setBytes:v38 length:12 atIndex:0];
  v32.i64[0] = v26;
  v32.i64[1] = v27;
  uint64x2_t v36 = vshrq_n_u64(vsraq_n_u64((uint64x2_t)vdupq_n_s64(0xFuLL), v32, 1uLL), 4uLL);
  uint64_t v37 = 1;
  uint64_t v35 = 1;
  long long v34 = xmmword_1BA86C930;
  [v30 dispatchThreadgroups:&v36 threadsPerThreadgroup:&v34];
  [v30 endEncoding];
}

- (CVAFilterRenderStagelight)initWithDevice:(id)a3 library:(id)a4 pipelineLibrary:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v23.receiver = self;
  v23.super_class = (Class)CVAFilterRenderStagelight;
  v13 = [(CVAFilterRenderStagelight *)&v23 init];
  if (v13)
  {
    v14 = (objc_class *)objc_opt_class();
    uint64_t v15 = NSStringFromClass(v14);
    label = v13->_label;
    v13->_label = (NSString *)v15;

    v17 = objc_opt_new();
    id v18 = v10;
    id v19 = (void *)[v17 copy];
    __int16 v22 = 257;
    [v19 setConstantValue:(char *)&v22 + 1 type:53 withName:@"kUseStageLightProxyCube"];
    [v19 setConstantValue:&v22 type:53 withName:@"kUseStageLightCube"];
    sub_1BA8328CC((void **)&v13->_renderingStageLightKernel_bothCubes, v11, v12, v18, @"renderStageLight", a6, v19);
    if (!v13->_renderingStageLightKernel_bothCubes) {
      goto LABEL_7;
    }
    __int16 v22 = 256;
    [v19 setConstantValue:(char *)&v22 + 1 type:53 withName:@"kUseStageLightProxyCube"];
    [v19 setConstantValue:&v22 type:53 withName:@"kUseStageLightCube"];
    sub_1BA8328CC((void **)&v13->_renderingStageLightKernel_proxyCube, v11, v12, v18, @"renderStageLight", a6, v19);
    if (!v13->_renderingStageLightKernel_proxyCube) {
      goto LABEL_7;
    }
    __int16 v22 = 1;
    [v19 setConstantValue:(char *)&v22 + 1 type:53 withName:@"kUseStageLightProxyCube"];
    [v19 setConstantValue:&v22 type:53 withName:@"kUseStageLightCube"];
    sub_1BA8328CC((void **)&v13->_renderingStageLightKernel_cube, v11, v12, v18, @"renderStageLight", a6, v19);
    if (!v13->_renderingStageLightKernel_cube) {
      goto LABEL_7;
    }
    __int16 v22 = 0;
    [v19 setConstantValue:(char *)&v22 + 1 type:53 withName:@"kUseStageLightProxyCube"];
    [v19 setConstantValue:&v22 type:53 withName:@"kUseStageLightCube"];
    sub_1BA8328CC((void **)&v13->_renderingStageLightKernel_noCube, v11, v12, v18, @"renderStageLight", a6, v19);
    if (v13->_renderingStageLightKernel_noCube) {
      id v20 = v13;
    }
    else {
LABEL_7:
    }
      id v20 = 0;
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

@end