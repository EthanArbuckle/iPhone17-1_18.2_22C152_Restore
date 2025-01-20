@interface ARGPUWarper
- (ARGPUWarper)init;
- (id)description;
- (void)warpCameraImage:(simd_float3)a3 withExposureOffset:(simd_float3)a4 withCameraIntrinsics:(simd_float3)a5 withCameraTransform:(simd_float4)a6 toPlane:(simd_float4)a7 withLoadAction:(simd_float4)a8 synchronous:(simd_float4)a9;
- (void)warpPlane:(ARTexturedPlane *)a3 toPlane:(ARTexturedPlane *)a4 withLoadAction:(unint64_t)a5 synchronous:(BOOL)a6;
@end

@implementation ARGPUWarper

- (ARGPUWarper)init
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  v44.receiver = self;
  v44.super_class = (Class)ARGPUWarper;
  v2 = [(ARGPUWarper *)&v44 init];
  v3 = +[ARSharedGPUDevice sharedInstance];
  uint64_t v4 = [v3 device];
  device = v2->_device;
  v2->_device = (MTLDevice *)v4;

  uint64_t v6 = [(MTLDevice *)v2->_device newCommandQueue];
  commandQueue = v2->_commandQueue;
  v2->_commandQueue = (MTLCommandQueue *)v6;

  [(MTLCommandQueue *)v2->_commandQueue setLabel:@"com.apple.arkit.gpuwarper.queue"];
  v42 = ARKitCoreBundle();
  v8 = [v42 URLForResource:@"default" withExtension:@"metallib"];
  if (!v8) {
    __assert_rtn("-[ARGPUWarper init]", "ARGPUWarper.mm", 47, "url != nil");
  }
  v9 = (void *)[(MTLDevice *)v2->_device newLibraryWithURL:v8 error:0];
  id v10 = objc_alloc_init(MEMORY[0x1E4F35358]);
  v11 = [v10 attributes];
  v12 = [v11 objectAtIndexedSubscript:0];
  [v12 setFormat:29];

  v13 = [v10 attributes];
  v14 = [v13 objectAtIndexedSubscript:0];
  [v14 setOffset:0];

  v15 = [v10 attributes];
  v16 = [v15 objectAtIndexedSubscript:0];
  [v16 setBufferIndex:1];

  v17 = [v10 attributes];
  v18 = [v17 objectAtIndexedSubscript:1];
  [v18 setFormat:29];

  v19 = [v10 attributes];
  v20 = [v19 objectAtIndexedSubscript:1];
  [v20 setOffset:8];

  v21 = [v10 attributes];
  v22 = [v21 objectAtIndexedSubscript:1];
  [v22 setBufferIndex:1];

  v23 = [v10 layouts];
  v24 = [v23 objectAtIndexedSubscript:1];
  [v24 setStride:16];

  v25 = [v10 layouts];
  v26 = [v25 objectAtIndexedSubscript:1];
  [v26 setStepRate:1];

  v27 = [v10 layouts];
  v28 = [v27 objectAtIndexedSubscript:1];
  [v28 setStepFunction:1];

  v29 = (void *)[v9 newFunctionWithName:@"homgraphyVertexShader"];
  v30 = (void *)[v9 newFunctionWithName:@"homographyFragmentShader"];
  id v31 = objc_alloc_init(MEMORY[0x1E4F352F0]);
  [v31 setLabel:@"com.apple.arkit.homographypipeline"];
  [v31 setVertexFunction:v29];
  [v31 setVertexDescriptor:v10];
  [v31 setFragmentFunction:v30];
  v32 = [v31 colorAttachments];
  v33 = [v32 objectAtIndexedSubscript:0];
  [v33 setPixelFormat:81];

  v34 = v2->_device;
  id v43 = 0;
  uint64_t v35 = [(MTLDevice *)v34 newRenderPipelineStateWithDescriptor:v31 error:&v43];
  id v36 = v43;
  homographyPipelineState = v2->_homographyPipelineState;
  v2->_homographyPipelineState = (MTLRenderPipelineState *)v35;

  if (!v2->_homographyPipelineState)
  {
    if (_ARLogGeneral(void)::onceToken != -1) {
      dispatch_once(&_ARLogGeneral(void)::onceToken, &__block_literal_global_62);
    }
    v38 = (id)_ARLogGeneral(void)::logObj;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = (objc_class *)objc_opt_class();
      v40 = NSStringFromClass(v39);
      *(_DWORD *)buf = 138543874;
      v46 = v40;
      __int16 v47 = 2048;
      v48 = v2;
      __int16 v49 = 2112;
      id v50 = v36;
      _os_log_impl(&dword_1B88A2000, v38, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to create homography pipeline state, error %@", buf, 0x20u);
    }
    if (!v2->_homographyPipelineState) {
      __assert_rtn("-[ARGPUWarper init]", "ARGPUWarper.mm", 85, "_homographyPipelineState");
    }
  }

  return v2;
}

- (void)warpCameraImage:(simd_float3)a3 withExposureOffset:(simd_float3)a4 withCameraIntrinsics:(simd_float3)a5 withCameraTransform:(simd_float4)a6 toPlane:(simd_float4)a7 withLoadAction:(simd_float4)a8 synchronous:(simd_float4)a9
{
  v61.columns[2] = a8;
  v61.columns[3] = a9;
  v61.columns[0] = a6;
  v61.columns[1] = a7;
  v83[8] = *MEMORY[0x1E4F143B8];
  v80.columns[0] = a3;
  v80.columns[1] = a4;
  v80.columns[2] = a5;
  kdebug_trace();
  v20 = [MEMORY[0x1E4F352E0] renderPassDescriptor];
  v21 = [v20 colorAttachments];
  v22 = [v21 objectAtIndexedSubscript:0];
  [v22 setTexture:*(void *)(a12 + 216)];

  v23 = [v20 colorAttachments];
  v24 = [v23 objectAtIndexedSubscript:0];
  [v24 setLoadAction:a13];

  v25 = [v20 colorAttachments];
  v26 = [v25 objectAtIndexedSubscript:0];
  objc_msgSend(v26, "setClearColor:", 0.0, 0.0, 0.0, 0.0);

  v27 = [v20 colorAttachments];
  v28 = [v27 objectAtIndexedSubscript:0];
  [v28 setStoreAction:1];

  v29 = (void *)MEMORY[0x1E4F35330];
  size_t Width = CVPixelBufferGetWidth(a11);
  id v31 = [v29 texture2DDescriptorWithPixelFormat:520 width:Width height:CVPixelBufferGetHeight(a11) mipmapped:0];
  v32 = (void *)[*(id *)(a1 + 8) newTextureWithDescriptor:v31 iosurface:CVPixelBufferGetIOSurface(a11) plane:0];
  v33 = [*(id *)(a1 + 16) commandBuffer];
  [v33 setLabel:@"com.apple.arkit.gpuwarper.cameratoplanecommandbuffer"];
  CVBufferRef v34 = CVBufferRetain(a11);
  v79[0] = MEMORY[0x1E4F143A8];
  v79[1] = 3221225472;
  v79[2] = __126__ARGPUWarper_warpCameraImage_withExposureOffset_withCameraIntrinsics_withCameraTransform_toPlane_withLoadAction_synchronous___block_invoke;
  v79[3] = &__block_descriptor_40_e28_v16__0___MTLCommandBuffer__8l;
  v79[4] = v34;
  [v33 addCompletedHandler:v79];
  uint64_t v35 = [v33 renderCommandEncoderWithDescriptor:v20];
  [v35 setLabel:@"com.apple.arkit.gpuwarper.cameratoplanerenderencoder"];
  [v35 setCullMode:0];
  [v35 setRenderPipelineState:*(void *)(a1 + 24)];
  size_t v36 = CVPixelBufferGetWidth(a11);
  size_t Height = CVPixelBufferGetHeight(a11);
  *(float *)&uint64_t v38 = (float)v36;
  v83[0] = 0;
  v83[1] = 0x3F80000000000000;
  v83[2] = COERCE_UNSIGNED_INT((float)v36);
  __asm { FMOV            V2.2S, #1.0 }
  LODWORD(v44) = 0;
  *((float *)&v44 + 1) = (float)Height;
  v83[3] = _D2;
  v83[4] = v44;
  v83[5] = 0;
  *((float *)&v38 + 1) = (float)Height;
  v83[6] = v38;
  v83[7] = 1065353216;
  [v35 setVertexBytes:v83 length:64 atIndex:1];
  simd_float4x4 v77 = __invert_f4(v61);
  convert(&v77, (uint64_t)v78);
  convert((const simd_float4x4 *)(a12 + 32), (uint64_t)&v77);
  v76[0] = xmmword_1B8A53090;
  v76[1] = xmmword_1B8A530A0;
  v76[2] = xmmword_1B8A530B0;
  long long v46 = *(_OWORD *)(a12 + 96);
  long long v45 = *(_OWORD *)(a12 + 112);
  v72[0] = v45;
  v72[2] = DWORD2(v46);
  v72[1] = 0;
  v72[3] = 1065353216;
  v73[0] = v46;
  v73[2] = DWORD2(v46);
  v73[1] = 0;
  v73[3] = 1065353216;
  v74[0] = v46;
  v74[2] = DWORD2(v45);
  v74[1] = 0;
  v74[3] = 1065353216;
  v75[0] = v45;
  v75[2] = DWORD2(v45);
  v75[1] = 0;
  v75[3] = 1065353216;
  convert(&v80, (uint64_t)v71);
  for (uint64_t i = 24; i != 36; i += 4)
    *(float *)&v71[i] = -*(float *)&v71[i];
  long long v70 = 0u;
  memset(v69, 0, sizeof(v69));
  v81 = v78;
  v82 = &v77;
  *(void *)&v65[0] = &v81;
  *((void *)&v65[0] + 1) = v72;
  float32x4_t v62 = 0uLL;
  double v48 = cva::assign<false,false,cva::Matrix<float,4u,1u,false>,cva::MatrixMultExpr<cva::Matrix<float,4u,4u,false>,cva::Matrix<float,4u,4u,false>>,cva::Matrix<float,4u,1u,false>>(&v62, (uint64_t)v65);
  dehomogenize((float32x2_t *)&v62, (float32x2_t *)&v81, v48);
  *(void *)&v65[0] = v71;
  *((void *)&v65[0] + 1) = &v81;
  uint64_t v67 = 0;
  int v68 = 0;
  cva::assign<false,false,cva::Matrix<float,3u,1u,false>,cva::Matrix<float,3u,3u,false>,cva::Matrix<float,3u,1u,false>>((uint64_t)&v67, (uint64_t *)v65);
  *(void *)&v69[0] = v67;
  DWORD2(v69[0]) = v68;
  v81 = v78;
  v82 = &v77;
  *(void *)&v65[0] = &v81;
  *((void *)&v65[0] + 1) = v73;
  float32x4_t v62 = 0uLL;
  double v49 = cva::assign<false,false,cva::Matrix<float,4u,1u,false>,cva::MatrixMultExpr<cva::Matrix<float,4u,4u,false>,cva::Matrix<float,4u,4u,false>>,cva::Matrix<float,4u,1u,false>>(&v62, (uint64_t)v65);
  dehomogenize((float32x2_t *)&v62, (float32x2_t *)&v81, v49);
  *(void *)&v65[0] = v71;
  *((void *)&v65[0] + 1) = &v81;
  uint64_t v67 = 0;
  int v68 = 0;
  cva::assign<false,false,cva::Matrix<float,3u,1u,false>,cva::Matrix<float,3u,3u,false>,cva::Matrix<float,3u,1u,false>>((uint64_t)&v67, (uint64_t *)v65);
  *(void *)((char *)v69 + 12) = v67;
  DWORD1(v69[1]) = v68;
  v81 = v78;
  v82 = &v77;
  *(void *)&v65[0] = &v81;
  *((void *)&v65[0] + 1) = v74;
  float32x4_t v62 = 0uLL;
  double v50 = cva::assign<false,false,cva::Matrix<float,4u,1u,false>,cva::MatrixMultExpr<cva::Matrix<float,4u,4u,false>,cva::Matrix<float,4u,4u,false>>,cva::Matrix<float,4u,1u,false>>(&v62, (uint64_t)v65);
  dehomogenize((float32x2_t *)&v62, (float32x2_t *)&v81, v50);
  *(void *)&v65[0] = v71;
  *((void *)&v65[0] + 1) = &v81;
  uint64_t v67 = 0;
  int v68 = 0;
  cva::assign<false,false,cva::Matrix<float,3u,1u,false>,cva::Matrix<float,3u,3u,false>,cva::Matrix<float,3u,1u,false>>((uint64_t)&v67, (uint64_t *)v65);
  *((void *)&v69[1] + 1) = v67;
  LODWORD(v70) = v68;
  v81 = v78;
  v82 = &v77;
  *(void *)&v65[0] = &v81;
  *((void *)&v65[0] + 1) = v75;
  float32x4_t v62 = 0uLL;
  double v51 = cva::assign<false,false,cva::Matrix<float,4u,1u,false>,cva::MatrixMultExpr<cva::Matrix<float,4u,4u,false>,cva::Matrix<float,4u,4u,false>>,cva::Matrix<float,4u,1u,false>>(&v62, (uint64_t)v65);
  dehomogenize((float32x2_t *)&v62, (float32x2_t *)&v81, v51);
  *(void *)&v65[0] = v71;
  *((void *)&v65[0] + 1) = &v81;
  uint64_t v67 = 0;
  int v68 = 0;
  cva::assign<false,false,cva::Matrix<float,3u,1u,false>,cva::Matrix<float,3u,3u,false>,cva::Matrix<float,3u,1u,false>>((uint64_t)&v67, (uint64_t *)v65);
  *(void *)((char *)&v70 + 4) = v67;
  HIDWORD(v70) = v68;
  int v66 = 0;
  memset(v65, 0, sizeof(v65));
  computeHomography((float *)v69, (float *)v76, (uint64_t)v65, 0.0, v52, v53);
  long long v63 = 0u;
  long long v64 = 0u;
  float32x4_t v62 = 0u;
  double v54 = convert((uint64_t)v65);
  v62.i32[2] = v55;
  DWORD2(v63) = v56;
  *(double *)v62.i64 = v54;
  *(void *)&long long v63 = v57;
  DWORD2(v64) = v58;
  *(void *)&long long v64 = v59;
  [v35 setVertexBytes:&v62 length:48 atIndex:0];
  LOBYTE(v67) = 1;
  [v35 setFragmentBytes:&v67 length:1 atIndex:0];
  float32_t v60 = 1.0 / exp2(a2);
  *(float32_t *)&v81 = v60;
  [v35 setFragmentBytes:&v81 length:4 atIndex:2];
  [v35 setFragmentTexture:v32 atIndex:0];
  [v35 drawPrimitives:4 vertexStart:0 vertexCount:4];
  [v35 endEncoding];
  [v33 commit];
  if (a14) {
    [v33 waitUntilCompleted];
  }
  kdebug_trace();
}

void __126__ARGPUWarper_warpCameraImage_withExposureOffset_withCameraIntrinsics_withCameraTransform_toPlane_withLoadAction_synchronous___block_invoke(uint64_t a1)
{
}

- (void)warpPlane:(ARTexturedPlane *)a3 toPlane:(ARTexturedPlane *)a4 withLoadAction:(unint64_t)a5 synchronous:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  v11 = [MEMORY[0x1E4F352E0] renderPassDescriptor];
  v12 = [v11 colorAttachments];
  v13 = [v12 objectAtIndexedSubscript:0];
  [v13 setTexture:a4[3].var5];

  v14 = [v11 colorAttachments];
  v15 = [v14 objectAtIndexedSubscript:0];
  [v15 setLoadAction:a5];

  v16 = [v11 colorAttachments];
  v17 = [v16 objectAtIndexedSubscript:0];
  objc_msgSend(v17, "setClearColor:", 0.0, 0.0, 0.0, 0.0);

  v18 = [v11 colorAttachments];
  v19 = [v18 objectAtIndexedSubscript:0];
  [v19 setStoreAction:1];

  v20 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  [v20 setLabel:@"com.apple.arkit.gpuwarper.planetoplanecommandbuffer"];
  v21 = [v20 renderCommandEncoderWithDescriptor:v11];
  [v21 setLabel:@"com.apple.arkit.gpuwarper.planetoplanerenderencoder"];
  [v21 setCullMode:0];
  [v21 setRenderPipelineState:self->_homographyPipelineState];
  unint64_t v22 = 0;
  float32x4_t v23 = *(float32x4_t *)&a3[1].var4.__tree_.__pair3_.__value_;
  array<unsigned char, 16UL> var0 = a3[2].var0;
  v25.i64[0] = 0x3F0000003F000000;
  v25.i64[1] = 0x3F0000003F000000;
  float32x4_t v26 = vmulq_f32(vaddq_f32(v23, (float32x4_t)var0), v25);
  float32x4_t v27 = *(float32x4_t *)MEMORY[0x1E4F149A0];
  long long v28 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 16);
  long long v29 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 32);
  long long v30 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 48);
  v26.i32[3] = HIDWORD(v30);
  float32x4_t v31 = *(float32x4_t *)&a3->var4.__tree_.__pair1_.__value_.__left_;
  float32x4_t v32 = *(float32x4_t *)&a3->var5;
  float32x4_t v33 = *(float32x4_t *)((char *)&a3[1].var0 + 8);
  float32x4_t v34 = *(float32x4_t *)&a3[1].var4.__tree_.__begin_node_;
  float32x4_t v89 = *(float32x4_t *)MEMORY[0x1E4F149A0];
  long long v90 = v28;
  long long v91 = v29;
  float32x4_t v92 = v26;
  do
  {
    v93.columns[v22 / 4] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v31, COERCE_FLOAT(*(_OWORD *)((char *)&v89 + v22 * 4))), v32, *(float32x2_t *)&v89.f32[v22], 1), v33, *(float32x4_t *)((char *)&v89 + v22 * 4), 2), v34, *(float32x4_t *)((char *)&v89 + v22 * 4), 3);
    v22 += 4;
  }
  while (v22 != 16);
  unint64_t v35 = 0;
  simd_float4 v65 = v93.columns[1];
  simd_float4 v66 = v93.columns[0];
  simd_float4 v63 = v93.columns[3];
  simd_float4 v64 = v93.columns[2];
  array<unsigned char, 16UL> v61 = a4[2].var0;
  float32x4_t v62 = *(float32x4_t *)&a4[1].var4.__tree_.__pair3_.__value_;
  v36.i64[0] = 0x3F0000003F000000;
  v36.i64[1] = 0x3F0000003F000000;
  float32x4_t v37 = vmulq_f32(vaddq_f32(v62, (float32x4_t)v61), v36);
  v37.i32[3] = HIDWORD(v30);
  float32x4_t v38 = *(float32x4_t *)&a4->var4.__tree_.__pair1_.__value_.__left_;
  float32x4_t v39 = *(float32x4_t *)&a4->var5;
  float32x4_t v40 = *(float32x4_t *)((char *)&a4[1].var0 + 8);
  float32x4_t v41 = *(float32x4_t *)&a4[1].var4.__tree_.__begin_node_;
  float32x4_t v89 = v27;
  long long v90 = v28;
  long long v91 = v29;
  float32x4_t v92 = v37;
  do
  {
    v93.columns[v35 / 4] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v38, COERCE_FLOAT(*(_OWORD *)((char *)&v89 + v35 * 4))), v39, *(float32x2_t *)&v89.f32[v35], 1), v40, *(float32x4_t *)((char *)&v89 + v35 * 4), 2), v41, *(float32x4_t *)((char *)&v89 + v35 * 4), 3);
    v35 += 4;
  }
  while (v35 != 16);
  simd_float4x4 v88 = v93;
  float32x4_t v42 = vsubq_f32(v23, (float32x4_t)var0);
  *(float *)&unint64_t v43 = -0.5 * v42.f32[0];
  *(float *)&uint64_t v44 = -0.5 * v42.f32[0];
  HIDWORD(v44) = vmuls_lane_f32(-0.5, v42, 2);
  v93.columns[0].i64[0] = v44;
  v93.columns[0].i64[1] = 0x3F80000000000000;
  *(float *)&uint64_t v45 = 0.5 * v42.f32[0];
  *(float *)&uint64_t v46 = 0.5 * v42.f32[0];
  HIDWORD(v46) = HIDWORD(v44);
  __asm { FMOV            V1.2S, #1.0 }
  v93.columns[1].i64[0] = v46;
  v93.columns[1].i64[1] = _D1;
  HIDWORD(v43) = vmuls_lane_f32(0.5, v42, 2);
  v93.columns[2] = (simd_float4)v43;
  HIDWORD(v45) = HIDWORD(v43);
  v93.columns[3].i64[0] = v45;
  v93.columns[3].i64[1] = 1065353216;
  [v21 setVertexBytes:&v93 length:64 atIndex:1];
  v95.columns[1] = v65;
  v95.columns[0] = v66;
  v95.columns[3] = v63;
  v95.columns[2] = v64;
  simd_float4x4 v79 = __invert_f4(v95);
  convert(&v79, (uint64_t)v80);
  convert(&v88, (uint64_t)&v75);
  *(void *)&long long v68 = v80;
  *((void *)&v68 + 1) = &v75;
  float32x4_t v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  float32x4_t v92 = 0u;
  cva::assign<false,false,cva::Matrix<float,4u,4u,false>,cva::Matrix<float,4u,4u,false>,cva::Matrix<float,4u,4u,false>>(&v89, (float32x4_t **)&v68);
  float32x4_t v52 = vsubq_f32(v62, (float32x4_t)v61);
  v80[0] = -0.5 * v52.f32[0];
  v80[1] = 0.0;
  float v81 = vmuls_lane_f32(0.5, v52, 2);
  int v82 = 1065353216;
  v83[0] = -0.5 * v52.f32[0];
  v83[1] = 0.0;
  float v84 = vmuls_lane_f32(-0.5, v52, 2);
  int v85 = 1065353216;
  v86[0] = 0.5 * v52.f32[0];
  v86[1] = 0.0;
  v86[2] = v84;
  v86[3] = 1.0;
  v87[0] = 0.5 * v52.f32[0];
  v87[1] = 0.0;
  v87[2] = v81;
  v87[3] = 1.0;
  int v78 = 0;
  memset(v77, 0, sizeof(v77));
  MakeMatrix3x4f(1.0, 0.0, 0.0, 0.0, 0.0, 0.0, -1.0, 0.0, (float *)&v79, 0.0, 0.0, 0.0, 1.0);
  *(void *)&v71[0] = &v79;
  *((void *)&v71[0] + 1) = &v89;
  *(void *)&long long v68 = v71;
  *((void *)&v68 + 1) = v80;
  uint64_t v73 = 0;
  int v74 = 0;
  cva::assign<false,false,cva::Matrix<float,3u,1u,false>,cva::MatrixMultExpr<cva::Matrix<float,3u,4u,false>,cva::Matrix<float,4u,4u,false>>,cva::Matrix<float,4u,1u,false>>((uint64_t)&v73, (uint64_t)&v68);
  uint64_t v75 = v73;
  int v76 = v74;
  MakeMatrix3x4f(1.0, 0.0, 0.0, 0.0, 0.0, 0.0, -1.0, 0.0, (float *)&v79, 0.0, 0.0, 0.0, 1.0);
  *(void *)&v71[0] = &v79;
  *((void *)&v71[0] + 1) = &v89;
  *(void *)&long long v68 = v71;
  *((void *)&v68 + 1) = v83;
  uint64_t v73 = 0;
  int v74 = 0;
  cva::assign<false,false,cva::Matrix<float,3u,1u,false>,cva::MatrixMultExpr<cva::Matrix<float,3u,4u,false>,cva::Matrix<float,4u,4u,false>>,cva::Matrix<float,4u,1u,false>>((uint64_t)&v73, (uint64_t)&v68);
  v77[0] = v73;
  LODWORD(v77[1]) = v74;
  MakeMatrix3x4f(1.0, 0.0, 0.0, 0.0, 0.0, 0.0, -1.0, 0.0, (float *)&v79, 0.0, 0.0, 0.0, 1.0);
  *(void *)&v71[0] = &v79;
  *((void *)&v71[0] + 1) = &v89;
  *(void *)&long long v68 = v71;
  *((void *)&v68 + 1) = v86;
  uint64_t v73 = 0;
  int v74 = 0;
  cva::assign<false,false,cva::Matrix<float,3u,1u,false>,cva::MatrixMultExpr<cva::Matrix<float,3u,4u,false>,cva::Matrix<float,4u,4u,false>>,cva::Matrix<float,4u,1u,false>>((uint64_t)&v73, (uint64_t)&v68);
  *(void *)((char *)&v77[1] + 4) = v73;
  HIDWORD(v77[2]) = v74;
  MakeMatrix3x4f(1.0, 0.0, 0.0, 0.0, 0.0, 0.0, -1.0, 0.0, (float *)&v79, 0.0, 0.0, 0.0, 1.0);
  *(void *)&v71[0] = &v79;
  *((void *)&v71[0] + 1) = &v89;
  *(void *)&long long v68 = v71;
  *((void *)&v68 + 1) = v87;
  uint64_t v73 = 0;
  int v74 = 0;
  cva::assign<false,false,cva::Matrix<float,3u,1u,false>,cva::MatrixMultExpr<cva::Matrix<float,3u,4u,false>,cva::Matrix<float,4u,4u,false>>,cva::Matrix<float,4u,1u,false>>((uint64_t)&v73, (uint64_t)&v68);
  v77[3] = v73;
  int v78 = v74;
  __asm { FMOV            V1.4S, #1.0 }
  v79.columns[0] = (simd_float4)xmmword_1B8A530C0;
  v79.columns[1] = _Q1;
  v79.columns[2] = (simd_float4)xmmword_1B8A530D0;
  int v72 = 0;
  memset(v71, 0, sizeof(v71));
  computeHomography((float *)&v75, (float *)&v79, (uint64_t)v71, 0.0, *(double *)_Q1.i64, v54);
  long long v69 = 0u;
  long long v70 = 0u;
  long long v68 = 0u;
  double v55 = convert((uint64_t)v71);
  DWORD2(v68) = v56;
  DWORD2(v69) = v57;
  *(double *)&long long v68 = v55;
  *(void *)&long long v69 = v58;
  DWORD2(v70) = v59;
  *(void *)&long long v70 = v60;
  [v21 setVertexBytes:&v68 length:48 atIndex:0];
  char v67 = 0;
  [v21 setFragmentBytes:&v67 length:1 atIndex:0];
  LODWORD(v73) = 1065353216;
  [v21 setFragmentBytes:&v73 length:4 atIndex:2];
  [v21 setFragmentTexture:a3[3].var5 atIndex:0];
  [v21 drawPrimitives:4 vertexStart:0 vertexCount:4];
  [v21 endEncoding];
  [v20 commit];
  if (v6) {
    [v20 waitUntilCompleted];
  }
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  BOOL v6 = [v3 stringWithFormat:@"<%@: %p\n", v5, self];

  v7 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  unint64_t v8 = [v7 status];
  if (v8 > 5) {
    v9 = @"Unknown";
  }
  else {
    v9 = off_1E6187098[v8];
  }
  [v6 appendFormat:@"CommandBuffer Status: %@", v9];

  [v6 appendString:@">"];
  id v10 = (void *)[v6 copy];

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homographyPipelineState, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end