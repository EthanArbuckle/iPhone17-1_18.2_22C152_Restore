@interface MetalFaceMask
- (id)initForDevice:(id)a3;
- (int)chromaDilateRadius;
- (int)chromaErodeRadius;
- (int)clearOutputTexture:(id)a3 CommandBuffer:(id)a4;
- (int)drawEyeMaskUsingQuads:(MetalFaceMaskEyeQuads_t *)a3 OutputMaskTexture:(id)a4 OutputRegion:(CGRect)a5 FaceBounds:(CGRect)a6 CommandBuffer:(id)a7;
- (int)lumaDilateRadius;
- (int)lumaErodeRadius;
- (int)trainSkinMaskUsingInputTexture:(id)a3 InputRegion:(CGRect)a4 QuadRegion:(CGPoint)a5[4] CommandBuffer:(id)a6;
- (uint64_t)findSkinMaskUsingInputTexture:(float64_t)a3 InputRegion:(float64x2_t)a4 OutputMaskTexture:(float64_t)a5 OutputRegion:(float64x2_t)a6 FaceBounds:(float64_t)a7 SeedPoints:(float64x2_t)a8 NumberOfSeedPoints:(float64_t)a9 FillValue:(uint64_t)a10 CommandBuffer:(uint64_t)a11;
- (uint64_t)findToothMaskUsingInputTexture:(float64_t)a3 InputRegion:(float64x2_t)a4 OutputMaskTexture:(float64_t)a5 OutputRegion:(float64x2_t)a6 TeethBounds:(float64_t)a7 SeedPoints:(float64x2_t)a8 NumberOfSeedPoints:(float64_t)a9 FillValue:(uint64_t)a10 CommandBuffer:(uint64_t)a11;
- (void)setChromaDilateRadius:(int)a3;
- (void)setChromaErodeRadius:(int)a3;
- (void)setLumaDilateRadius:(int)a3;
- (void)setLumaErodeRadius:(int)a3;
@end

@implementation MetalFaceMask

- (id)initForDevice:(id)a3
{
  if (!a3) {
    sub_4B0FC();
  }
  v57.receiver = self;
  v57.super_class = (Class)MetalFaceMask;
  v4 = [(MetalFaceMask *)&v57 init];
  v5 = v4;
  if (v4)
  {
    *(_OWORD *)&v4->_lumaDilateRadius = xmmword_55E70;
    v4->_mtlDevice = (MTLDevice *)a3;
    uint64_t v56 = 0;
    v6 = (MTLLibrary *)[(MTLDevice *)v4->_mtlDevice newDefaultLibraryWithBundle:+[NSBundle bundleForClass:objc_opt_class()] error:&v56];
    v5->_mtlLibrary = v6;
    if (!v6) {
      sub_4B128();
    }
    id v7 = [(MTLLibrary *)v6 newFunctionWithName:@"MetalFaceMask_Clear"];
    if (!v7) {
      sub_4B154();
    }
    v8 = v7;
    v5->_mtlKernel_Clear = (MTLComputePipelineState *)[(MTLDevice *)v5->_mtlDevice newComputePipelineStateWithFunction:v7 error:0];

    if (!v5->_mtlKernel_Clear) {
      sub_4B180();
    }
    id v9 = [(MTLLibrary *)v5->_mtlLibrary newFunctionWithName:@"MetalFaceMask_InitMinMax"];
    if (!v9) {
      sub_4B1AC();
    }
    v10 = v9;
    v5->_mtlKernel_InitMinMax = (MTLComputePipelineState *)[(MTLDevice *)v5->_mtlDevice newComputePipelineStateWithFunction:v9 error:0];

    if (!v5->_mtlKernel_InitMinMax) {
      sub_4B1D8();
    }
    id v11 = [(MTLLibrary *)v5->_mtlLibrary newFunctionWithName:@"MetalFaceMask_MinMax"];
    if (!v11) {
      sub_4B204();
    }
    v12 = v11;
    v5->_mtlKernel_MinMax = (MTLComputePipelineState *)[(MTLDevice *)v5->_mtlDevice newComputePipelineStateWithFunction:v11 error:0];

    if (!v5->_mtlKernel_MinMax) {
      sub_4B230();
    }
    id v13 = [(MTLLibrary *)v5->_mtlLibrary newFunctionWithName:@"MetalFaceMask_CalcCubeInputScaling"];
    if (!v13) {
      sub_4B25C();
    }
    v14 = v13;
    v5->_mtlKernel_CalcCubeInputScaling = (MTLComputePipelineState *)[(MTLDevice *)v5->_mtlDevice newComputePipelineStateWithFunction:v13 error:0];

    if (!v5->_mtlKernel_CalcCubeInputScaling) {
      sub_4B288();
    }
    id v15 = [(MTLLibrary *)v5->_mtlLibrary newFunctionWithName:@"MetalFaceMask_PopulateCube"];
    if (!v15) {
      sub_4B2B4();
    }
    v16 = v15;
    v5->_mtlKernel_PopulateCube = (MTLComputePipelineState *)[(MTLDevice *)v5->_mtlDevice newComputePipelineStateWithFunction:v15 error:0];

    if (!v5->_mtlKernel_PopulateCube) {
      sub_4B2E0();
    }
    id v17 = [(MTLLibrary *)v5->_mtlLibrary newFunctionWithName:@"MetalFaceMask_DilateCubeLuma"];
    if (!v17) {
      sub_4B30C();
    }
    v18 = v17;
    v5->_mtlKernel_DilateCubeLuma = (MTLComputePipelineState *)[(MTLDevice *)v5->_mtlDevice newComputePipelineStateWithFunction:v17 error:0];

    if (!v5->_mtlKernel_DilateCubeLuma) {
      sub_4B338();
    }
    id v19 = [(MTLLibrary *)v5->_mtlLibrary newFunctionWithName:@"MetalFaceMask_DilateCubeChroma1"];
    if (!v19) {
      sub_4B364();
    }
    v20 = v19;
    v5->_mtlKernel_DilateCubeChroma1 = (MTLComputePipelineState *)[(MTLDevice *)v5->_mtlDevice newComputePipelineStateWithFunction:v19 error:0];

    if (!v5->_mtlKernel_DilateCubeChroma1) {
      sub_4B390();
    }
    id v21 = [(MTLLibrary *)v5->_mtlLibrary newFunctionWithName:@"MetalFaceMask_DilateCubeChroma2"];
    if (!v21) {
      sub_4B3BC();
    }
    v22 = v21;
    v5->_mtlKernel_DilateCubeChroma2 = (MTLComputePipelineState *)[(MTLDevice *)v5->_mtlDevice newComputePipelineStateWithFunction:v21 error:0];

    if (!v5->_mtlKernel_DilateCubeChroma2) {
      sub_4B3E8();
    }
    id v23 = [(MTLLibrary *)v5->_mtlLibrary newFunctionWithName:@"MetalFaceMask_ErodeCubeLuma"];
    if (!v23) {
      sub_4B414();
    }
    v24 = v23;
    v5->_mtlKernel_ErodeCubeLuma = (MTLComputePipelineState *)[(MTLDevice *)v5->_mtlDevice newComputePipelineStateWithFunction:v23 error:0];

    if (!v5->_mtlKernel_ErodeCubeLuma) {
      sub_4B440();
    }
    id v25 = [(MTLLibrary *)v5->_mtlLibrary newFunctionWithName:@"MetalFaceMask_ErodeCubeChroma1"];
    if (!v25) {
      sub_4B46C();
    }
    v26 = v25;
    v5->_mtlKernel_ErodeCubeChroma1 = (MTLComputePipelineState *)[(MTLDevice *)v5->_mtlDevice newComputePipelineStateWithFunction:v25 error:0];

    if (!v5->_mtlKernel_ErodeCubeChroma1) {
      sub_4B498();
    }
    id v27 = [(MTLLibrary *)v5->_mtlLibrary newFunctionWithName:@"MetalFaceMask_ErodeCubeChroma2"];
    if (!v27) {
      sub_4B4C4();
    }
    v28 = v27;
    v5->_mtlKernel_ErodeCubeChroma2 = (MTLComputePipelineState *)[(MTLDevice *)v5->_mtlDevice newComputePipelineStateWithFunction:v27 error:0];

    if (!v5->_mtlKernel_ErodeCubeChroma2) {
      sub_4B4F0();
    }
    id v29 = [(MTLLibrary *)v5->_mtlLibrary newFunctionWithName:@"MetalFaceMask_InitSpanTable"];
    if (!v29) {
      sub_4B51C();
    }
    v30 = v29;
    v5->_mtlKernel_InitSpanTable = (MTLComputePipelineState *)[(MTLDevice *)v5->_mtlDevice newComputePipelineStateWithFunction:v29 error:0];

    if (!v5->_mtlKernel_InitSpanTable) {
      sub_4B548();
    }
    id v31 = [(MTLLibrary *)v5->_mtlLibrary newFunctionWithName:@"MetalFaceMask_GenerateMask"];
    if (!v31) {
      sub_4B574();
    }
    v32 = v31;
    v5->_mtlKernel_GenerateMask = (MTLComputePipelineState *)[(MTLDevice *)v5->_mtlDevice newComputePipelineStateWithFunction:v31 error:0];

    if (!v5->_mtlKernel_GenerateMask) {
      sub_4B5A0();
    }
    id v33 = [(MTLLibrary *)v5->_mtlLibrary newFunctionWithName:@"MetalFaceMask_GenerateToothMask"];
    if (!v33) {
      sub_4B5CC();
    }
    v34 = v33;
    v5->_mtlKernel_GenerateToothMask = (MTLComputePipelineState *)[(MTLDevice *)v5->_mtlDevice newComputePipelineStateWithFunction:v33 error:0];

    if (!v5->_mtlKernel_GenerateToothMask) {
      sub_4B5F8();
    }
    id v35 = [(MTLLibrary *)v5->_mtlLibrary newFunctionWithName:@"MetalFaceMask_ConnectSpans"];
    if (!v35) {
      sub_4B624();
    }
    v36 = v35;
    v5->_mtlKernel_ConnectSpans = (MTLComputePipelineState *)[(MTLDevice *)v5->_mtlDevice newComputePipelineStateWithFunction:v35 error:0];

    if (!v5->_mtlKernel_ConnectSpans) {
      sub_4B650();
    }
    id v37 = [(MTLLibrary *)v5->_mtlLibrary newFunctionWithName:@"MetalFaceMask_PropagateParents"];
    if (!v37) {
      sub_4B67C();
    }
    v38 = v37;
    v5->_mtlKernel_PropagateParents = (MTLComputePipelineState *)[(MTLDevice *)v5->_mtlDevice newComputePipelineStateWithFunction:v37 error:0];

    if (!v5->_mtlKernel_PropagateParents) {
      sub_4B6A8();
    }
    id v39 = [(MTLLibrary *)v5->_mtlLibrary newFunctionWithName:@"MetalFaceMask_PropogateAssociations"];
    if (!v39) {
      sub_4B6D4();
    }
    v40 = v39;
    v5->_mtlKernel_PropogateAssociations = (MTLComputePipelineState *)[(MTLDevice *)v5->_mtlDevice newComputePipelineStateWithFunction:v39 error:0];

    if (!v5->_mtlKernel_PropogateAssociations) {
      sub_4B700();
    }
    id v41 = [(MTLLibrary *)v5->_mtlLibrary newFunctionWithName:@"MetalFaceMask_ResolveAssociations"];
    if (!v41) {
      sub_4B72C();
    }
    v42 = v41;
    v5->_mtlKernel_ResolveAssociations = (MTLComputePipelineState *)[(MTLDevice *)v5->_mtlDevice newComputePipelineStateWithFunction:v41 error:0];

    if (!v5->_mtlKernel_ResolveAssociations) {
      sub_4B758();
    }
    id v43 = [(MTLLibrary *)v5->_mtlLibrary newFunctionWithName:@"MetalFaceMask_AddSeedPoint"];
    if (!v43) {
      sub_4B784();
    }
    v44 = v43;
    v5->_mtlKernel_AddSeedPoint = (MTLComputePipelineState *)[(MTLDevice *)v5->_mtlDevice newComputePipelineStateWithFunction:v43 error:0];

    if (!v5->_mtlKernel_AddSeedPoint) {
      sub_4B7B0();
    }
    id v45 = [(MTLLibrary *)v5->_mtlLibrary newFunctionWithName:@"MetalFaceMask_DrawSpans"];
    if (!v45) {
      sub_4B7DC();
    }
    v46 = v45;
    v5->_mtlKernel_DrawSpans = (MTLComputePipelineState *)[(MTLDevice *)v5->_mtlDevice newComputePipelineStateWithFunction:v45 error:0];

    if (!v5->_mtlKernel_DrawSpans) {
      sub_4B808();
    }
    id v47 = [(MTLLibrary *)v5->_mtlLibrary newFunctionWithName:@"MetalFaceMask_DrawEye"];
    if (!v47) {
      sub_4B834();
    }
    v48 = v47;
    v5->_mtlKernel_DrawEye = (MTLComputePipelineState *)[(MTLDevice *)v5->_mtlDevice newComputePipelineStateWithFunction:v47 error:0];

    if (!v5->_mtlKernel_DrawEye) {
      sub_4B860();
    }
    v49 = (MTLBuffer *)[(MTLDevice *)v5->_mtlDevice newBufferWithLength:24 options:32];
    v5->_minMaxAtomicBuf = v49;
    if (!v49) {
      sub_4B88C();
    }
    v50 = (MTLBuffer *)[(MTLDevice *)v5->_mtlDevice newBufferWithLength:32 options:32];
    v5->_inputScalingBuf = v50;
    if (!v50) {
      sub_4B8B8();
    }
    v51 = (MTLBuffer *)[(MTLDevice *)v5->_mtlDevice newBufferWithLength:0x2000 options:32];
    v5->_labellingRowStartIdxBuf = v51;
    if (!v51) {
      sub_4B8E4();
    }
    v52 = (MTLBuffer *)[(MTLDevice *)v5->_mtlDevice newBufferWithLength:1179628 options:32];
    v5->_labellingSpanTableBuf = v52;
    if (!v52) {
      sub_4B910();
    }
    id v53 = objc_alloc_init((Class)MTLTextureDescriptor);
    [v53 setTextureType:7];
    [v53 setPixelFormat:10];
    [v53 setWidth:32];
    [v53 setHeight:32];
    [v53 setDepth:32];
    [v53 setMipmapLevelCount:1];
    [v53 setSampleCount:1];
    [v53 setArrayLength:1];
    [v53 setResourceOptions:32];
    [v53 setCpuCacheMode:0];
    [v53 setStorageMode:2];
    [v53 setUsage:19];
    v54 = (MTLTexture *)[(MTLDevice *)v5->_mtlDevice newTextureWithDescriptor:v53];
    v5->_colorCubeTex = v54;
    if (!v54) {
      sub_4B93C();
    }
    v5->_tempColorCubeTex = (MTLTexture *)[(MTLDevice *)v5->_mtlDevice newTextureWithDescriptor:v53];

    if (!v5->_tempColorCubeTex) {
      sub_4B968();
    }
  }
  return v5;
}

- (int)clearOutputTexture:(id)a3 CommandBuffer:(id)a4
{
  unsigned int v7 = [a3 width];
  unsigned int v8 = [a3 height];
  unint64_t v9 = (unint64_t)[(MTLComputePipelineState *)self->_mtlKernel_Clear maxTotalThreadsPerThreadgroup] >> 5;
  id v10 = [a4 computeCommandEncoder];
  [v10 setComputePipelineState:self->_mtlKernel_Clear];
  [v10 setTexture:a3 atIndex:0];
  v13[0] = (v7 + 31) >> 5;
  v13[1] = (v9 + v8 - 1) / v9;
  v13[2] = 1;
  v12[0] = 32;
  v12[1] = v9;
  v12[2] = 1;
  [v10 dispatchThreadgroups:v13 threadsPerThreadgroup:v12];
  [v10 endEncoding];
  return 0;
}

- (int)trainSkinMaskUsingInputTexture:(id)a3 InputRegion:(CGRect)a4 QuadRegion:(CGPoint)a5[4] CommandBuffer:(id)a6
{
  char v8 = vaddvq_s32(*(int32x4_t *)&self->_lumaDilateRadius);
  uint64_t v9 = 192;
  if (v8) {
    uint64_t v10 = 192;
  }
  else {
    uint64_t v10 = 200;
  }
  if (v8) {
    uint64_t v9 = 200;
  }
  uint64_t v11 = *(uint64_t *)((char *)&self->super.isa + v9);
  uint64_t v12 = *(uint64_t *)((char *)&self->super.isa + v10);
  int32x2_t v13 = vmovn_s64(vcvtq_s64_f64((float64x2_t)a5[1]));
  v96[0] = vmovn_s64(vcvtq_s64_f64(*(float64x2_t *)a5));
  v96[1] = v13;
  int32x2_t v14 = vmovn_s64(vcvtq_s64_f64((float64x2_t)a5[3]));
  int32x2_t v97 = vmovn_s64(vcvtq_s64_f64((float64x2_t)a5[2]));
  int32x2_t v98 = v14;
  *(int32x2_t *)&long long v15 = vmin_s32(vmin_s32(v96[0], v13), vmin_s32(v97, v14));
  int32x2_t v16 = vmax_s32(vmax_s32(v96[0], v13), vmax_s32(v97, v14));
  int32x2_t v17 = vsub_s32(v16, *(int32x2_t *)&v15);
  *((int32x2_t *)&v15 + 1) = v16;
  CGFloat y = a4.origin.y;
  CGFloat height = a4.size.height;
  *(float32x2_t *)v20.f32 = vrndm_f32(vcvt_f32_f64((float64x2_t)a4.origin));
  float64x2_t v21 = vaddq_f64((float64x2_t)a4.origin, (float64x2_t)a4.size);
  __asm { FMOV            V2.2D, #-1.0 }
  *(float32x2_t *)&v20.u32[2] = vrndp_f32(vcvt_f32_f64(vaddq_f64(v21, _Q2)));
  int32x4_t v94 = vcvtq_s32_f32(v20);
  long long v95 = v15;
  uint64_t v27 = v17.u32[1];
  __int32 v28 = v17.i32[0];
  unsigned int v29 = (v17.i32[0] + 3) >> 2;
  uint64_t v30 = (v17.i32[1] + 3) >> 2;
  unint64_t v31 = (unint64_t)[(MTLComputePipelineState *)self->_mtlKernel_MinMax maxTotalThreadsPerThreadgroup] >> 5;
  unint64_t v54 = (unint64_t)[(MTLComputePipelineState *)self->_mtlKernel_PopulateCube maxTotalThreadsPerThreadgroup] >> 5;
  id v32 = [a6 computeCommandEncoder];
  [v32 setComputePipelineState:self->_mtlKernel_InitMinMax];
  [v32 setBuffer:self->_minMaxAtomicBuf offset:0 atIndex:0];
  int64x2_t v53 = vdupq_n_s64(1uLL);
  int64x2_t v92 = v53;
  uint64_t v93 = 1;
  int64x2_t v90 = v53;
  uint64_t v91 = 1;
  [v32 dispatchThreadgroups:&v92 threadsPerThreadgroup:&v90];
  [v32 setComputePipelineState:self->_mtlKernel_MinMax];
  [v32 setBytes:&v95 length:16 atIndex:0];
  [v32 setBytes:&v94 length:16 atIndex:1];
  [v32 setBuffer:self->_minMaxAtomicBuf offset:0 atIndex:2];
  [v32 setBytes:v96 length:32 atIndex:3];
  [v32 setTexture:a3 atIndex:0];
  uint64_t v87 = (v29 + 31) >> 5;
  unint64_t v88 = (v30 + v31 - 1) / v31;
  uint64_t v89 = 1;
  uint64_t v84 = 32;
  unint64_t v85 = v31;
  uint64_t v86 = 1;
  [v32 dispatchThreadgroups:&v87 threadsPerThreadgroup:&v84];
  [v32 setComputePipelineState:self->_mtlKernel_CalcCubeInputScaling];
  [v32 setBuffer:self->_minMaxAtomicBuf offset:0 atIndex:0];
  [v32 setBuffer:self->_inputScalingBuf offset:0 atIndex:1];
  int64x2_t v82 = v53;
  uint64_t v83 = 1;
  int64x2_t v80 = v53;
  uint64_t v81 = 1;
  [v32 dispatchThreadgroups:&v82 threadsPerThreadgroup:&v80];
  [v32 setComputePipelineState:self->_mtlKernel_PopulateCube];
  [v32 setBytes:&v95 length:16 atIndex:0];
  [v32 setBytes:&v94 length:16 atIndex:1];
  [v32 setBuffer:self->_inputScalingBuf offset:0 atIndex:2];
  [v32 setBytes:v96 length:32 atIndex:3];
  [v32 setTexture:a3 atIndex:0];
  [v32 setTexture:v11 atIndex:1];
  uint64_t v87 = (v28 + 31) >> 5;
  unint64_t v88 = (v27 + v54 - 1) / v54;
  uint64_t v89 = 1;
  uint64_t v84 = 32;
  unint64_t v85 = v54;
  uint64_t v86 = 1;
  [v32 dispatchThreadgroups:&v87 threadsPerThreadgroup:&v84];
  if (self->_lumaDilateRadius < 1)
  {
    uint64_t v34 = v12;
  }
  else
  {
    int v33 = 0;
    int64x2_t v56 = vdupq_n_s64(8uLL);
    int64x2_t v60 = vdupq_n_s64(4uLL);
    do
    {
      uint64_t v34 = v11;
      [v32 setComputePipelineState:self->_mtlKernel_DilateCubeLuma];
      [v32 setTexture:v11 atIndex:0];
      [v32 setTexture:v12 atIndex:1];
      int64x2_t v78 = v60;
      uint64_t v79 = 4;
      int64x2_t v76 = v56;
      uint64_t v77 = 8;
      [v32 dispatchThreadgroups:&v78 threadsPerThreadgroup:&v76];
      ++v33;
      uint64_t v11 = v12;
      uint64_t v12 = v34;
    }
    while (v33 < self->_lumaDilateRadius);
  }
  int chromaDilateRadius = self->_chromaDilateRadius;
  int chromaErodeRadius = self->_chromaErodeRadius;
  _VF = __OFSUB__(chromaDilateRadius, chromaErodeRadius);
  int v38 = chromaDilateRadius - chromaErodeRadius;
  char v37 = (v38 < 0) ^ _VF | (v38 == 0);
  int v39 = v38 + 1;
  if (v37) {
    float v40 = 1.0;
  }
  else {
    float v40 = (float)v39;
  }
  if (chromaDilateRadius < 1)
  {
    uint64_t v42 = v34;
  }
  else
  {
    int v41 = 0;
    int64x2_t v57 = vdupq_n_s64(8uLL);
    int64x2_t v61 = vdupq_n_s64(4uLL);
    do
    {
      uint64_t v42 = v11;
      int v43 = self->_chromaErodeRadius;
      float v44 = -1.0;
      _VF = __OFSUB__(v41, v43);
      int v45 = v41 - v43;
      if (v45 < 0 == _VF) {
        float v44 = (float)(v45 + 1) / v40;
      }
      *(float *)&uint64_t v87 = v44;
      if (v41) {
        uint64_t v46 = 80;
      }
      else {
        uint64_t v46 = 72;
      }
      [v32 setComputePipelineState:*(Class *)((char *)&self->super.isa + v46)];
      [v32 setBuffer:self->_inputScalingBuf offset:0 atIndex:0];
      [v32 setBytes:&v87 length:4 atIndex:1];
      [v32 setTexture:v11 atIndex:0];
      [v32 setTexture:v34 atIndex:1];
      int64x2_t v74 = v61;
      uint64_t v75 = 4;
      int64x2_t v72 = v57;
      uint64_t v73 = 8;
      [v32 dispatchThreadgroups:&v74 threadsPerThreadgroup:&v72];
      ++v41;
      uint64_t v11 = v34;
      uint64_t v34 = v42;
    }
    while (v41 < self->_chromaDilateRadius);
  }
  if (self->_lumaErodeRadius < 1)
  {
    uint64_t v48 = v42;
  }
  else
  {
    int v47 = 0;
    int64x2_t v58 = vdupq_n_s64(8uLL);
    int64x2_t v62 = vdupq_n_s64(4uLL);
    do
    {
      uint64_t v48 = v11;
      [v32 setComputePipelineState:self->_mtlKernel_ErodeCubeLuma];
      [v32 setTexture:v11 atIndex:0];
      [v32 setTexture:v42 atIndex:1];
      int64x2_t v70 = v62;
      uint64_t v71 = 4;
      int64x2_t v68 = v58;
      uint64_t v69 = 8;
      [v32 dispatchThreadgroups:&v70 threadsPerThreadgroup:&v68];
      ++v47;
      uint64_t v11 = v42;
      uint64_t v42 = v48;
    }
    while (v47 < self->_lumaErodeRadius);
  }
  if (self->_chromaErodeRadius >= 1)
  {
    int v49 = 0;
    int64x2_t v59 = vdupq_n_s64(8uLL);
    int64x2_t v63 = vdupq_n_s64(4uLL);
    do
    {
      uint64_t v50 = v11;
      if (v49) {
        uint64_t v51 = 104;
      }
      else {
        uint64_t v51 = 96;
      }
      [v32 setComputePipelineState:*(Class *)((char *)&self->super.isa + v51)];
      [v32 setTexture:v11 atIndex:0];
      [v32 setTexture:v48 atIndex:1];
      int64x2_t v66 = v63;
      uint64_t v67 = 4;
      int64x2_t v64 = v59;
      uint64_t v65 = 8;
      [v32 dispatchThreadgroups:&v66 threadsPerThreadgroup:&v64];
      ++v49;
      uint64_t v11 = v48;
      uint64_t v48 = v50;
    }
    while (v49 < self->_chromaErodeRadius);
  }
  [v32 endEncoding];
  return 0;
}

- (uint64_t)findSkinMaskUsingInputTexture:(float64_t)a3 InputRegion:(float64x2_t)a4 OutputMaskTexture:(float64_t)a5 OutputRegion:(float64x2_t)a6 FaceBounds:(float64_t)a7 SeedPoints:(float64x2_t)a8 NumberOfSeedPoints:(float64_t)a9 FillValue:(uint64_t)a10 CommandBuffer:(uint64_t)a11
{
  a2.f64[1] = a3;
  a4.f64[1] = a5;
  __asm { FMOV            V3.2D, #-1.0 }
  a6.f64[1] = a7;
  *(float32x2_t *)v28.f32 = vrndm_f32(vcvt_f32_f64(a6));
  a8.f64[1] = a9;
  *(float32x2_t *)&v28.u32[2] = vrndp_f32(vcvt_f32_f64(vaddq_f64(vaddq_f64(a6, a8), _Q3)));
  int32x2_t v29 = vcvt_s32_f32(vrndp_f32(vcvt_f32_f64(vaddq_f64(vaddq_f64(a2, a4), _Q3))));
  int32x4_t v74 = vcvtq_s32_f32(v28);
  *(int32x2_t *)&long long v30 = vcvt_s32_f32(vrndm_f32(vcvt_f32_f64(a2)));
  *(int32x2_t *)&long long v31 = vmax_s32(vcvt_s32_f32(vrndm_f32(vcvt_f32_f64(a17))), *(int32x2_t *)&v30);
  *((int32x2_t *)&v30 + 1) = v29;
  long long v75 = v30;
  *((int32x2_t *)&v31 + 1) = vmin_s32(vcvt_s32_f32(vrndp_f32(vcvt_f32_f64(vaddq_f64(vaddq_f64(a17, a18), _Q3)))), v29);
  v76[0] = v31;
  __int32 v32 = vsub_s32(*(int32x2_t *)(&v31 + 8), *(int32x2_t *)&v31).i32[1];
  unsigned __int32 v33 = v32 + 1;
  float v34 = log2f((float)(v32 + 1));
  id v47 = [*(id *)(a1 + 120) threadExecutionWidth];
  unint64_t v35 = (unint64_t)[*(id *)(a1 + 120) threadExecutionWidth] + v32;
  unint64_t v36 = v35 / (unint64_t)[*(id *)(a1 + 120) threadExecutionWidth];
  id v37 = [*(id *)(a1 + 144) threadExecutionWidth];
  id v42 = [*(id *)(a1 + 144) threadExecutionWidth];
  unint64_t v43 = (unint64_t)[*(id *)(a1 + 144) threadExecutionWidth];
  id v38 = [a16 computeCommandEncoder];
  [v38 setComputePipelineState:*(void *)(a1 + 112)];
  [v38 setBuffer:*(void *)(a1 + 224) offset:0 atIndex:0];
  int64x2_t v48 = vdupq_n_s64(1uLL);
  int64x2_t v72 = v48;
  uint64_t v73 = 1;
  int64x2_t v70 = v48;
  uint64_t v71 = 1;
  [v38 dispatchThreadgroups:&v72 threadsPerThreadgroup:&v70];
  [v38 setComputePipelineState:*(void *)(a1 + 120)];
  [v38 setBytes:v76 length:16 atIndex:0];
  [v38 setBytes:&v75 length:16 atIndex:1];
  [v38 setBuffer:*(void *)(a1 + 216) offset:0 atIndex:2];
  [v38 setBuffer:*(void *)(a1 + 224) offset:0 atIndex:3];
  [v38 setBuffer:*(void *)(a1 + 232) offset:0 atIndex:4];
  [v38 setTexture:*(void *)(a1 + 192) atIndex:0];
  [v38 setTexture:a11 atIndex:1];
  int32x2_t v68 = (int32x2_t)v36;
  int64x2_t v69 = v48;
  id v66 = v47;
  int64x2_t v67 = v48;
  [v38 dispatchThreadgroups:&v68 threadsPerThreadgroup:&v66];
  [v38 setComputePipelineState:*(void *)(a1 + 136)];
  [v38 setBuffer:*(void *)(a1 + 224) offset:0 atIndex:0];
  [v38 setBuffer:*(void *)(a1 + 232) offset:0 atIndex:1];
  unint64_t v45 = v36;
  int32x2_t v68 = (int32x2_t)v36;
  int64x2_t v69 = v48;
  id v66 = v47;
  int64x2_t v67 = v48;
  [v38 dispatchThreadgroups:&v68 threadsPerThreadgroup:&v66];
  int v65 = 2;
  int32x2_t v64 = (int32x2_t)0x100000001;
  if (v33 >= 2)
  {
    int64x2_t v49 = vdupq_n_s64(1uLL);
    unint64_t v39 = ((unint64_t)v42 + (1 << vcvtms_s32_f32(v34)) - 1) / v43;
    do
    {
      [v38 setComputePipelineState:*(void *)(a1 + 144)];
      [v38 setBytes:&v64 length:12 atIndex:0];
      [v38 setBuffer:*(void *)(a1 + 224) offset:0 atIndex:1];
      [v38 setBuffer:*(void *)(a1 + 232) offset:0 atIndex:2];
      int32x2_t v68 = (int32x2_t)v39;
      int64x2_t v69 = v49;
      id v66 = v37;
      int64x2_t v67 = v49;
      [v38 dispatchThreadgroups:&v68 threadsPerThreadgroup:&v66];
      int32x2_t v64 = vadd_s32(v64, v64);
      v65 *= 2;
    }
    while (v64.i32[0] < v33);
  }
  [v38 setComputePipelineState:*(void *)(a1 + 152)];
  [v38 setBuffer:*(void *)(a1 + 224) offset:0 atIndex:0];
  int64x2_t v50 = vdupq_n_s64(1uLL);
  int64x2_t v62 = v50;
  uint64_t v63 = 1;
  id v60 = [*(id *)(a1 + 152) maxTotalThreadsPerThreadgroup];
  int64x2_t v61 = v50;
  [v38 dispatchThreadgroups:&v62 threadsPerThreadgroup:&v60];
  [v38 setComputePipelineState:*(void *)(a1 + 160)];
  [v38 setBuffer:*(void *)(a1 + 224) offset:0 atIndex:0];
  int64x2_t v58 = v50;
  uint64_t v59 = 1;
  int64x2_t v56 = v50;
  uint64_t v57 = 1;
  [v38 dispatchThreadgroups:&v58 threadsPerThreadgroup:&v56];
  v64.i32[0] = 0;
  v64.i32[1] = v33;
  int v65 = v33;
  [v38 setComputePipelineState:*(void *)(a1 + 144)];
  [v38 setBytes:&v64 length:12 atIndex:0];
  [v38 setBuffer:*(void *)(a1 + 224) offset:0 atIndex:1];
  [v38 setBuffer:*(void *)(a1 + 232) offset:0 atIndex:2];
  int32x2_t v68 = (int32x2_t)v45;
  int64x2_t v69 = v50;
  id v66 = v47;
  int64x2_t v67 = v50;
  [v38 dispatchThreadgroups:&v68 threadsPerThreadgroup:&v66];
  if (a14)
  {
    int64x2_t v51 = vdupq_n_s64(1uLL);
    do
    {
      float64x2_t v40 = *a13++;
      int32x2_t v68 = vmovn_s64(vcvtq_s64_f64(v40));
      v69.i32[0] = a15;
      [v38 setComputePipelineState:*(void *)(a1 + 168)];
      [v38 setBytes:v76 length:16 atIndex:0];
      [v38 setBytes:&v75 length:16 atIndex:1];
      [v38 setBytes:&v68 length:12 atIndex:2];
      [v38 setBuffer:*(void *)(a1 + 224) offset:0 atIndex:3];
      [v38 setBuffer:*(void *)(a1 + 232) offset:0 atIndex:4];
      int64x2_t v54 = v51;
      uint64_t v55 = 1;
      int64x2_t v52 = v51;
      uint64_t v53 = 1;
      [v38 dispatchThreadgroups:&v54 threadsPerThreadgroup:&v52];
      --a14;
    }
    while (a14);
  }
  [v38 setComputePipelineState:*(void *)(a1 + 176)];
  [v38 setBytes:&v74 length:16 atIndex:0];
  [v38 setBuffer:*(void *)(a1 + 224) offset:0 atIndex:1];
  [v38 setBuffer:*(void *)(a1 + 232) offset:0 atIndex:2];
  [v38 setTexture:a12 atIndex:0];
  int32x2_t v68 = (int32x2_t)v45;
  int64x2_t v69 = vdupq_n_s64(1uLL);
  id v66 = v47;
  int64x2_t v67 = v69;
  [v38 dispatchThreadgroups:&v68 threadsPerThreadgroup:&v66];
  [v38 endEncoding];
  return 0;
}

- (uint64_t)findToothMaskUsingInputTexture:(float64_t)a3 InputRegion:(float64x2_t)a4 OutputMaskTexture:(float64_t)a5 OutputRegion:(float64x2_t)a6 TeethBounds:(float64_t)a7 SeedPoints:(float64x2_t)a8 NumberOfSeedPoints:(float64_t)a9 FillValue:(uint64_t)a10 CommandBuffer:(uint64_t)a11
{
  a2.f64[1] = a3;
  a4.f64[1] = a5;
  float64x2_t v18 = vaddq_f64(a2, a4);
  __asm { FMOV            V2.2D, #-1.0 }
  a6.f64[1] = a7;
  *(float32x2_t *)v24.f32 = vrndm_f32(vcvt_f32_f64(a6));
  a8.f64[1] = a9;
  *(float32x2_t *)&v24.u32[2] = vrndp_f32(vcvt_f32_f64(vaddq_f64(vaddq_f64(a6, a8), _Q2)));
  int32x4_t v74 = vcvtq_s32_f32(v24);
  *(int32x2_t *)&a2.f64[0] = vcvt_s32_f32(vrndm_f32(vcvt_f32_f64(a2)));
  *(int32x2_t *)v24.f32 = vmax_s32(vcvt_s32_f32(vrndm_f32(vcvt_f32_f64(a17))), *(int32x2_t *)&a2.f64[0]);
  *(float64_t *)&long long v25 = a2.f64[0];
  *((int32x2_t *)&v25 + 1) = vcvt_s32_f32(vrndp_f32(vcvt_f32_f64(vaddq_f64(v18, _Q2))));
  *(int32x2_t *)&v18.f64[0] = vmin_s32(vcvt_s32_f32(vrndp_f32(vcvt_f32_f64(vaddq_f64(vaddq_f64(a17, a18), _Q2)))), *(int32x2_t *)((char *)&v25 + 8));
  *(int32x2_t *)&a2.f64[0] = vsub_s32(*(int32x2_t *)&v18.f64[0], *(int32x2_t *)v24.f32);
  v24.i64[1] = *(void *)&v18.f64[0];
  long long v75 = v25;
  v76[0] = v24;
  *(uint32x2_t *)&v18.f64[0] = vcgt_u32((uint32x2_t)0x8000000080000000, *(uint32x2_t *)&a2.f64[0]);
  if ((vpmin_u32(*(uint32x2_t *)&v18.f64[0], *(uint32x2_t *)&v18.f64[0]).u32[0] & 0x80000000) == 0) {
    sub_4B994();
  }
  signed __int32 v32 = HIDWORD(a2.f64[0]);
  unsigned __int32 v33 = HIDWORD(a2.f64[0]) + 1;
  float v34 = log2f((float)(HIDWORD(a2.f64[0]) + 1));
  id v47 = [*(id *)(a1 + 128) threadExecutionWidth];
  unint64_t v35 = (unint64_t)[*(id *)(a1 + 128) threadExecutionWidth] + v32;
  unint64_t v36 = v35 / (unint64_t)[*(id *)(a1 + 128) threadExecutionWidth];
  id v37 = [*(id *)(a1 + 144) threadExecutionWidth];
  id v43 = [*(id *)(a1 + 144) threadExecutionWidth];
  unint64_t v44 = (unint64_t)[*(id *)(a1 + 144) threadExecutionWidth];
  id v38 = [a16 blitCommandEncoder];
  objc_msgSend(v38, "fillBuffer:range:value:", *(void *)(a1 + 224), 0, 1179628, 0);
  objc_msgSend(v38, "fillBuffer:range:value:", *(void *)(a1 + 232), 0, 0x2000, 0);
  [v38 endEncoding];
  id v39 = [a16 computeCommandEncoder];
  [v39 setComputePipelineState:*(void *)(a1 + 112)];
  [v39 setBuffer:*(void *)(a1 + 224) offset:0 atIndex:0];
  int64x2_t v48 = vdupq_n_s64(1uLL);
  int64x2_t v72 = v48;
  uint64_t v73 = 1;
  int64x2_t v70 = v48;
  uint64_t v71 = 1;
  [v39 dispatchThreadgroups:&v72 threadsPerThreadgroup:&v70];
  [v39 setComputePipelineState:*(void *)(a1 + 128)];
  [v39 setBytes:v76 length:16 atIndex:0];
  [v39 setBytes:&v75 length:16 atIndex:1];
  [v39 setBuffer:*(void *)(a1 + 216) offset:0 atIndex:2];
  [v39 setBuffer:*(void *)(a1 + 224) offset:0 atIndex:3];
  [v39 setBuffer:*(void *)(a1 + 232) offset:0 atIndex:4];
  [v39 setTexture:a11 atIndex:0];
  int32x2_t v68 = (int32x2_t)v36;
  int64x2_t v69 = v48;
  id v66 = v47;
  int64x2_t v67 = v48;
  [v39 dispatchThreadgroups:&v68 threadsPerThreadgroup:&v66];
  [v39 setComputePipelineState:*(void *)(a1 + 136)];
  [v39 setBuffer:*(void *)(a1 + 224) offset:0 atIndex:0];
  [v39 setBuffer:*(void *)(a1 + 232) offset:0 atIndex:1];
  int32x2_t v68 = (int32x2_t)v36;
  int64x2_t v69 = v48;
  id v66 = v47;
  int64x2_t v67 = v48;
  [v39 dispatchThreadgroups:&v68 threadsPerThreadgroup:&v66];
  int v65 = 2;
  int32x2_t v64 = (int32x2_t)0x100000001;
  if (v33 >= 2)
  {
    int64x2_t v49 = vdupq_n_s64(1uLL);
    unint64_t v40 = ((unint64_t)v43 + (1 << vcvtms_s32_f32(v34)) - 1) / v44;
    do
    {
      [v39 setComputePipelineState:*(void *)(a1 + 144)];
      [v39 setBytes:&v64 length:12 atIndex:0];
      [v39 setBuffer:*(void *)(a1 + 224) offset:0 atIndex:1];
      [v39 setBuffer:*(void *)(a1 + 232) offset:0 atIndex:2];
      int32x2_t v68 = (int32x2_t)v40;
      int64x2_t v69 = v49;
      id v66 = v37;
      int64x2_t v67 = v49;
      [v39 dispatchThreadgroups:&v68 threadsPerThreadgroup:&v66];
      int32x2_t v64 = vadd_s32(v64, v64);
      v65 *= 2;
    }
    while (v64.i32[0] < v33);
  }
  [v39 setComputePipelineState:*(void *)(a1 + 152)];
  [v39 setBuffer:*(void *)(a1 + 224) offset:0 atIndex:0];
  int64x2_t v50 = vdupq_n_s64(1uLL);
  int64x2_t v62 = v50;
  uint64_t v63 = 1;
  id v60 = [*(id *)(a1 + 152) maxTotalThreadsPerThreadgroup];
  int64x2_t v61 = v50;
  [v39 dispatchThreadgroups:&v62 threadsPerThreadgroup:&v60];
  [v39 setComputePipelineState:*(void *)(a1 + 160)];
  [v39 setBuffer:*(void *)(a1 + 224) offset:0 atIndex:0];
  int64x2_t v58 = v50;
  uint64_t v59 = 1;
  int64x2_t v56 = v50;
  uint64_t v57 = 1;
  [v39 dispatchThreadgroups:&v58 threadsPerThreadgroup:&v56];
  v64.i32[0] = 0;
  v64.i32[1] = v33;
  int v65 = v33;
  [v39 setComputePipelineState:*(void *)(a1 + 144)];
  [v39 setBytes:&v64 length:12 atIndex:0];
  [v39 setBuffer:*(void *)(a1 + 224) offset:0 atIndex:1];
  [v39 setBuffer:*(void *)(a1 + 232) offset:0 atIndex:2];
  int32x2_t v68 = (int32x2_t)v36;
  int64x2_t v69 = v50;
  id v66 = v47;
  int64x2_t v67 = v50;
  [v39 dispatchThreadgroups:&v68 threadsPerThreadgroup:&v66];
  if (a14)
  {
    int64x2_t v51 = vdupq_n_s64(1uLL);
    do
    {
      float64x2_t v41 = *a13++;
      int32x2_t v68 = vmovn_s64(vcvtq_s64_f64(v41));
      v69.i32[0] = a15;
      [v39 setComputePipelineState:*(void *)(a1 + 168)];
      [v39 setBytes:v76 length:16 atIndex:0];
      [v39 setBytes:&v75 length:16 atIndex:1];
      [v39 setBytes:&v68 length:12 atIndex:2];
      [v39 setBuffer:*(void *)(a1 + 224) offset:0 atIndex:3];
      [v39 setBuffer:*(void *)(a1 + 232) offset:0 atIndex:4];
      int64x2_t v54 = v51;
      uint64_t v55 = 1;
      int64x2_t v52 = v51;
      uint64_t v53 = 1;
      [v39 dispatchThreadgroups:&v54 threadsPerThreadgroup:&v52];
      --a14;
    }
    while (a14);
  }
  [v39 setComputePipelineState:*(void *)(a1 + 176)];
  [v39 setBytes:&v74 length:16 atIndex:0];
  [v39 setBuffer:*(void *)(a1 + 224) offset:0 atIndex:1];
  [v39 setBuffer:*(void *)(a1 + 232) offset:0 atIndex:2];
  [v39 setTexture:a12 atIndex:0];
  int32x2_t v68 = (int32x2_t)v36;
  int64x2_t v69 = vdupq_n_s64(1uLL);
  id v66 = v47;
  int64x2_t v67 = v69;
  [v39 dispatchThreadgroups:&v68 threadsPerThreadgroup:&v66];
  [v39 endEncoding];
  return 0;
}

- (int)drawEyeMaskUsingQuads:(MetalFaceMaskEyeQuads_t *)a3 OutputMaskTexture:(id)a4 OutputRegion:(CGRect)a5 FaceBounds:(CGRect)a6 CommandBuffer:(id)a7
{
  if (!a3) {
    sub_4B9C0();
  }
  uint64_t var0 = a3->var0;
  if (var0 > 0x10) {
    sub_4B9EC();
  }
  int8x16_t v12 = (int8x16_t)xmmword_55E80;
  if (var0)
  {
    p_var1 = &a3[3].var1;
    do
    {
      uint64_t v14 = *((void *)p_var1 - 3);
      uint64_t v15 = *((void *)p_var1 - 2);
      uint64_t v16 = *((void *)p_var1 - 1);
      v17.i64[0] = v12.i32[0];
      v17.i64[1] = v12.i32[1];
      float64x2_t v18 = vcvtq_f64_s64(v17);
      v17.i64[0] = (int)v14;
      v17.i64[1] = SHIDWORD(v14);
      float64x2_t v19 = vcvtq_f64_s64(v17);
      *(int32x2_t *)&v18.f64[0] = vmovn_s64(vcvtq_s64_f64(vminnmq_f64(v18, v19)));
      v17.i64[0] = SLODWORD(v18.f64[0]);
      v17.i64[1] = SHIDWORD(v18.f64[0]);
      float64x2_t v20 = vcvtq_f64_s64(v17);
      v17.i64[0] = (int)v15;
      v17.i64[1] = SHIDWORD(v15);
      float64x2_t v21 = vcvtq_f64_s64(v17);
      *(int32x2_t *)&v20.f64[0] = vmovn_s64(vcvtq_s64_f64(vminnmq_f64(v20, v21)));
      v17.i64[0] = SLODWORD(v20.f64[0]);
      v17.i64[1] = SHIDWORD(v20.f64[0]);
      float64x2_t v22 = vcvtq_f64_s64(v17);
      v17.i64[0] = (int)v16;
      v17.i64[1] = SHIDWORD(v16);
      float64x2_t v23 = vcvtq_f64_s64(v17);
      *(int32x2_t *)&v22.f64[0] = vmovn_s64(vcvtq_s64_f64(vminnmq_f64(v22, v23)));
      v17.i64[0] = SLODWORD(v22.f64[0]);
      v17.i64[1] = SHIDWORD(v22.f64[0]);
      float64x2_t v24 = vcvtq_f64_s64(v17);
      v17.i64[0] = (int)*(void *)p_var1;
      v17.i64[1] = (int)HIDWORD(*(void *)p_var1);
      float64x2_t v25 = vcvtq_f64_s64(v17);
      v17.i64[0] = v12.i32[2];
      v17.i64[1] = v12.i32[3];
      int32x2_t v26 = vmovn_s64(vcvtq_s64_f64(vmaxnmq_f64(vcvtq_f64_s64(v17), v19)));
      v17.i64[0] = v26.i32[0];
      v17.i64[1] = v26.i32[1];
      int32x2_t v27 = vmovn_s64(vcvtq_s64_f64(vmaxnmq_f64(vcvtq_f64_s64(v17), v21)));
      v17.i64[0] = v27.i32[0];
      v17.i64[1] = v27.i32[1];
      int32x2_t v28 = vmovn_s64(vcvtq_s64_f64(vmaxnmq_f64(vcvtq_f64_s64(v17), v23)));
      v17.i64[0] = v28.i32[0];
      v17.i64[1] = v28.i32[1];
      int8x16_t v12 = (int8x16_t)vuzp1q_s32((int32x4_t)vcvtq_s64_f64(vminnmq_f64(v24, v25)), (int32x4_t)vcvtq_s64_f64(vmaxnmq_f64(vcvtq_f64_s64(v17), v25)));
      p_var1 += 8;
      --var0;
    }
    while (var0);
  }
  CGFloat y = a5.origin.y;
  CGFloat height = a5.size.height;
  float64x2_t v31 = vaddq_f64((float64x2_t)a5.origin, (float64x2_t)a5.size);
  __asm { FMOV            V2.2D, #-1.0 }
  *(int32x2_t *)&v31.f64[0] = vcvt_s32_f32(vrndp_f32(vcvt_f32_f64(vaddq_f64(v31, _Q2))));
  id v37 = &a3->var1;
  *(int32x2_t *)&long long v38 = vcvt_s32_f32(vrndm_f32(vcvt_f32_f64((float64x2_t)a5.origin)));
  *(float32x2_t *)&_Q2.f64[0] = vld1_dup_f32((const float *)v37);
  *(int32x2_t *)&long long v39 = vmax_s32(vsub_s32(*(int32x2_t *)v12.i8, *(int32x2_t *)&_Q2.f64[0]), *(int32x2_t *)&v38);
  *((void *)&v38 + 1) = *(void *)&v31.f64[0];
  *((int32x2_t *)&v39 + 1) = vmax_s32(*(int32x2_t *)&v39, vmin_s32(vadd_s32((int32x2_t)*(_OWORD *)&vextq_s8(v12, v12, 8uLL), *(int32x2_t *)&_Q2.f64[0]), *(int32x2_t *)&v31.f64[0]));
  long long v50 = v38;
  long long v51 = v39;
  __int32 v40 = vsub_s32(*(int32x2_t *)(&v39 + 8), *(int32x2_t *)&v39).i32[1] + 1;
  id v41 = [(MTLComputePipelineState *)self->_mtlKernel_DrawEye threadExecutionWidth];
  unint64_t v42 = (unint64_t)[(MTLComputePipelineState *)self->_mtlKernel_GenerateToothMask threadExecutionWidth]+ v40- 1;
  unint64_t v43 = v42
      / (unint64_t)[(MTLComputePipelineState *)self->_mtlKernel_GenerateToothMask threadExecutionWidth];
  id v44 = [a7 computeCommandEncoder];
  [v44 setComputePipelineState:self->_mtlKernel_DrawEye];
  [v44 setBytes:&v51 length:16 atIndex:0];
  [v44 setBytes:&v50 length:16 atIndex:1];
  [v44 setBytes:a3 length:528 atIndex:2];
  [v44 setBuffer:self->_labellingSpanTableBuf offset:0 atIndex:3];
  [v44 setBuffer:self->_labellingRowStartIdxBuf offset:0 atIndex:4];
  [v44 setTexture:a4 atIndex:0];
  unint64_t v48 = v43;
  int64x2_t v49 = vdupq_n_s64(1uLL);
  id v46 = v41;
  int64x2_t v47 = v49;
  [v44 dispatchThreadgroups:&v48 threadsPerThreadgroup:&v46];
  [v44 endEncoding];
  return 0;
}

- (int)lumaDilateRadius
{
  return self->_lumaDilateRadius;
}

- (void)setLumaDilateRadius:(int)a3
{
  self->_lumaDilateRadius = a3;
}

- (int)lumaErodeRadius
{
  return self->_lumaErodeRadius;
}

- (void)setLumaErodeRadius:(int)a3
{
  self->_lumaErodeRadius = a3;
}

- (int)chromaDilateRadius
{
  return self->_chromaDilateRadius;
}

- (void)setChromaDilateRadius:(int)a3
{
  self->_int chromaDilateRadius = a3;
}

- (int)chromaErodeRadius
{
  return self->_chromaErodeRadius;
}

- (void)setChromaErodeRadius:(int)a3
{
  self->_int chromaErodeRadius = a3;
}

@end