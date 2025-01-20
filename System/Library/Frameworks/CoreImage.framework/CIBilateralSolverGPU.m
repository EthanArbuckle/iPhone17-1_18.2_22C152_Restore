@interface CIBilateralSolverGPU
- (BOOL)useTrilinearInterpolation;
- (CIBilateralSolverGPU)initWithWidth:(int)a3 height:(int)a4 maxVertices:(unint64_t)a5 commandBuffer:(id)a6;
- (int)_doBistochastizeWithCommandBuffer:(id)a3 t_tex:(id)a4 c_tex:(id)a5 lambda:(float)a6 nIterations:(int)a7;
- (int)_doPCGWithCommandBuffer:(id)a3 nIterations:(int)a4;
- (int)_doSliceTrilinearWithCommandBuffer:(id)a3 ref_tex:(id)a4 o_tex:(id)a5;
- (int)_doSliceWithCommandBuffer:(id)a3 o_tex:(id)a4;
- (int)doSolveWithBilateralGridhash:(id)a3 reference:(id)a4 disparity:(id)a5 confidence:(id)a6 output:(id)a7 lambda:(float)a8 maxIterations:(int)a9 offsets:(id *)a10;
- (void)_prepareResources:(id)a3;
- (void)_setupBuffer;
- (void)_setupMetal;
- (void)_setupPipelineCache;
- (void)_setupPipelinesAsync:(id)a3;
- (void)setUseTrilinearInterpolation:(BOOL)a3;
@end

@implementation CIBilateralSolverGPU

- (void)_setupPipelineCache
{
  __assert_rtn("-[CIBilateralSolverGPU _setupPipelineCache]", "BilateralSolverGPU.m", 118, "[pipelineArray count] == COMPUTE_COUNT");
}

uint64_t __43__CIBilateralSolverGPU__setupPipelineCache__block_invoke()
{
  _setupPipelineCache__pipelineDict = [MEMORY[0x1E4F1CA60] dictionary];

  return MEMORY[0x1F41817F8]();
}

void __43__CIBilateralSolverGPU__setupPipelineCache__block_invoke_2(uint64_t a1)
{
  id v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:9];
  for (uint64_t i = 24; i != 96; i += 8)
    [v5 addObject:*(void *)(*(void *)(a1 + 32) + i)];
  id v3 = (id)_setupPipelineCache__pipelineDict;
  objc_sync_enter(v3);
  v4 = [MEMORY[0x1E4F1C978] arrayWithArray:v5];
  [(id)_setupPipelineCache__pipelineDict setObject:v4 forKeyedSubscript:*(void *)(a1 + 40)];

  objc_sync_exit(v3);
}

- (CIBilateralSolverGPU)initWithWidth:(int)a3 height:(int)a4 maxVertices:(unint64_t)a5 commandBuffer:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)CIBilateralSolverGPU;
  v12 = [(CIBilateralSolverGPU *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_useTrilinearInterpolation = 1;
    v12->_width = a3;
    v12->_height = a4;
    v12->_maxVertices = a5;
    objc_storeStrong((id *)&v12->_commandBuffer, a6);
    [(CIBilateralSolverGPU *)v13 _setupMetal];
    [(CIBilateralSolverGPU *)v13 _setupPipelineCache];
    [(CIBilateralSolverGPU *)v13 _setupBuffer];
  }

  return v13;
}

- (int)doSolveWithBilateralGridhash:(id)a3 reference:(id)a4 disparity:(id)a5 confidence:(id)a6 output:(id)a7 lambda:(float)a8 maxIterations:(int)a9 offsets:(id *)a10
{
  uint64_t v10 = *(void *)&a9;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  self->_params.lambda = a8;
  self->_params.N = [v17 countVertices];
  self->_params.dims = [v17 countDims];
  self->_params.sigma_s = (float)(int)objc_msgSend(v17, "sigma_s");
  self->_params.sigma_r_luma = (float)(int)objc_msgSend(v17, "sigma_r_luma");
  *(_OWORD *)self->_anon_ac = *(_OWORD *)a10;
  id v22 = v18;
  id v23 = v19;
  id v24 = v20;
  id v25 = v21;
  v26 = self->_commandBuffer;
  if ((int)[v17 countVertices] < 1)
  {
    int v28 = 1;
  }
  else
  {
    [(CIBilateralSolverGPU *)self _prepareResources:v17];
    *(float *)&double v27 = a8;
    [(CIBilateralSolverGPU *)self _doBistochastizeWithCommandBuffer:v26 t_tex:v23 c_tex:v24 lambda:10 nIterations:v27];
    [(CIBilateralSolverGPU *)self _doPCGWithCommandBuffer:v26 nIterations:v10];
    if (self->_useTrilinearInterpolation) {
      [(CIBilateralSolverGPU *)self _doSliceTrilinearWithCommandBuffer:v26 ref_tex:v22 o_tex:v25];
    }
    else {
      [(CIBilateralSolverGPU *)self _doSliceWithCommandBuffer:v26 o_tex:v25];
    }
    int v28 = 0;
  }

  return v28;
}

- (void)_setupMetal
{
  self->_metalDevice = [(MTLCommandBuffer *)self->_commandBuffer device];

  MEMORY[0x1F41817F8]();
}

- (void)_setupPipelinesAsync:(id)a3
{
  id v4 = a3;
  v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v5 = (void *)-[MTLDevice newDefaultLibraryWithBundle:error:](self->_metalDevice, "newDefaultLibraryWithBundle:error:");
  v6 = (OS_dispatch_group *)dispatch_group_create();
  computePipelinesGroup = self->_computePipelinesGroup;
  self->_computePipelinesGroup = v6;

  uint64_t v8 = 0;
  v9 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  int v20 = 0;
  do
  {
    uint64_t v10 = (void *)[[NSString alloc] initWithUTF8String:kKernelNames[v8]];
    id v11 = (void *)[v5 newFunctionWithName:v10];

    dispatch_group_enter((dispatch_group_t)self->_computePipelinesGroup);
    metalDevice = self->_metalDevice;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __45__CIBilateralSolverGPU__setupPipelinesAsync___block_invoke;
    v15[3] = &unk_1E5770DB8;
    int v18 = v8;
    v15[4] = self;
    id v17 = v19;
    id v13 = v4;
    id v16 = v13;
    [(MTLDevice *)metalDevice newComputePipelineStateWithFunction:v11 completionHandler:v15];

    ++v8;
    v9 = v11;
  }
  while (v8 != 9);

  _Block_object_dispose(v19, 8);
}

void __45__CIBilateralSolverGPU__setupPipelinesAsync___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 8 * *(int *)(a1 + 56) + 24), a2);
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 96));
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  int v5 = *(_DWORD *)(v4 + 24) + 1;
  *(_DWORD *)(v4 + 24) = v5;
  if (v5 == 9) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_setupBuffer
{
  id v28 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:53 width:self->_width height:self->_height mipmapped:0];
  char v3 = 1;
  [v28 setUsage:1];
  uint64_t v4 = (MTLTexture *)[(MTLDevice *)self->_metalDevice newTextureWithDescriptor:v28];
  gridHashMatrix = self->_gridHashMatrix;
  self->_gridHashMatrix = v4;

  id v6 = (MTLBuffer *)[(MTLDevice *)self->_metalDevice newBufferWithLength:4 * self->_maxVertices options:0];
  A_buf = self->_A_buf;
  self->_A_buf = v6;

  uint64_t v8 = (MTLBuffer *)[(MTLDevice *)self->_metalDevice newBufferWithLength:4 * self->_maxVertices options:0];
  b_buf = self->_b_buf;
  self->_b_buf = v8;

  uint64_t v10 = (MTLBuffer *)[(MTLDevice *)self->_metalDevice newBufferWithLength:4 * self->_maxVertices options:0];
  s_buf = self->_s_buf;
  self->_s_buf = v10;

  v12 = (MTLBuffer *)[(MTLDevice *)self->_metalDevice newBufferWithLength:4 * self->_maxVertices options:0];
  q_buf = self->_q_buf;
  self->_q_buf = v12;

  uint64_t v14 = 0;
  Dn_buf = self->_Dn_buf;
  x_buf = self->_x_buf;
  r_buf = self->_r_buf;
  d_buf = self->_d_buf;
  do
  {
    char v19 = v3;
    uint64_t v20 = [(MTLDevice *)self->_metalDevice newBufferWithLength:4 * self->_maxVertices options:0];
    id v21 = Dn_buf[v14];
    Dn_buf[v14] = (MTLBuffer *)v20;

    uint64_t v22 = [(MTLDevice *)self->_metalDevice newBufferWithLength:4 * self->_maxVertices options:0];
    id v23 = x_buf[v14];
    x_buf[v14] = (MTLBuffer *)v22;

    uint64_t v24 = [(MTLDevice *)self->_metalDevice newBufferWithLength:4 * self->_maxVertices options:0];
    id v25 = r_buf[v14];
    r_buf[v14] = (MTLBuffer *)v24;

    uint64_t v26 = [(MTLDevice *)self->_metalDevice newBufferWithLength:4 * self->_maxVertices options:0];
    double v27 = d_buf[v14];
    d_buf[v14] = (MTLBuffer *)v26;

    char v3 = 0;
    uint64_t v14 = 1;
  }
  while ((v19 & 1) != 0);
}

- (void)_prepareResources:(id)a3
{
  id v4 = a3;
  int v5 = [v4 countVertices];
  uint64_t width = self->_width;
  uint64_t height = self->_height;
  self->_threadGroupInfo.dispatchThreadgroups.uint64_t width = (unint64_t)(v5 + 127) >> 7;
  *(int64x2_t *)&self->_threadGroupInfo.dispatchThreadgroups.uint64_t height = vdupq_n_s64(1uLL);
  *(_OWORD *)&self->_threadGroupInfo.threadsPerThreadgroup.uint64_t width = xmmword_19394C9D0;
  self->_threadGroupInfo.threadsPerThreadgroup.depth = 1;
  uint64_t v7 = objc_msgSend(v4, "hash_table");
  uint64_t v8 = *(unsigned int *)(v7 + 24 * v5 - 4);
  uint64_t v9 = objc_msgSend(v4, "blur_table");
  uint64_t v10 = objc_msgSend(v4, "coord_indices");
  uint64_t v29 = objc_msgSend(v4, "coord_table");
  uint64_t v30 = objc_msgSend(v4, "hash_matrix");
  uint64_t v11 = objc_msgSend(v4, "interp_indices");
  uint64_t v31 = objc_msgSend(v4, "interp_table");
  uint64_t v33 = objc_msgSend(v4, "interp_pad");

  uint64_t v12 = *(unsigned int *)(v11 + 4 * v5);
  id v13 = (MTLBuffer *)[(MTLDevice *)self->_metalDevice newBufferWithBytes:v7 length:24 * v5 options:0];
  gridHashBuffer = self->_gridHashBuffer;
  self->_gridHashBuffer = v13;

  objc_super v15 = (MTLBuffer *)[(MTLDevice *)self->_metalDevice newBufferWithBytes:v9 length:4 * v8 options:0];
  gridBlurBuffer = self->_gridBlurBuffer;
  self->_gridBlurBuffer = v15;

  id v17 = (MTLBuffer *)[(MTLDevice *)self->_metalDevice newBufferWithBytes:v10 length:4 * (v5 + 1) options:0];
  gridCoordIndicesBuffer = self->_gridCoordIndicesBuffer;
  self->_gridCoordIndicesBuffer = v17;

  char v19 = (MTLBuffer *)[(MTLDevice *)self->_metalDevice newBufferWithBytes:v29 length:4 * (int)height * (int)width options:0];
  gridCoordTableBuffer = self->_gridCoordTableBuffer;
  self->_gridCoordTableBuffer = v19;

  memset(v34, 0, 24);
  gridHashMatrix = self->_gridHashMatrix;
  v34[3] = width;
  v34[4] = height;
  v34[5] = 1;
  [(MTLTexture *)gridHashMatrix replaceRegion:v34 mipmapLevel:0 withBytes:v30 bytesPerRow:4 * width];
  uint64_t v22 = (MTLBuffer *)[(MTLDevice *)self->_metalDevice newBufferWithBytes:v11 length:4 * (v5 + 1) options:0];
  gridInterpIndicesBuffer = self->_gridInterpIndicesBuffer;
  self->_gridInterpIndicesBuffer = v22;

  uint64_t v24 = (MTLBuffer *)[(MTLDevice *)self->_metalDevice newBufferWithBytes:v31 length:4 * v12 options:0];
  gridInterpTableBuffer = self->_gridInterpTableBuffer;
  self->_gridInterpTableBuffer = v24;

  uint64_t v26 = (MTLBuffer *)[(MTLDevice *)self->_metalDevice newBufferWithBytes:v33 length:v12 options:0];
  gridInterpPadBuffer = self->_gridInterpPadBuffer;
  self->_gridInterpPadBuffer = v26;

  computePipelinesGroup = self->_computePipelinesGroup;
  if (computePipelinesGroup) {
    dispatch_group_wait(computePipelinesGroup, 0xFFFFFFFFFFFFFFFFLL);
  }
}

- (int)_doBistochastizeWithCommandBuffer:(id)a3 t_tex:(id)a4 c_tex:(id)a5 lambda:(float)a6 nIterations:(int)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  *(void *)&self->_idxDnBufIn = 0;
  uint64_t v14 = [v11 computeCommandEncoder];
  [v14 setComputePipelineState:self->_computePipelines[0]];
  [v14 setBuffer:self->_gridHashBuffer offset:0 atIndex:0];
  [v14 setBuffer:self->_gridBlurBuffer offset:0 atIndex:1];
  Dn_buf = self->_Dn_buf;
  [v14 setBuffer:self->_Dn_buf[self->_idxDnBufIn] offset:0 atIndex:2];
  [v14 setBytes:&self->_params length:20 atIndex:3];
  p_threadGroupInfo = &self->_threadGroupInfo;
  p_$E8CF8C4D35898297CF58D66FCEA3D064 threadsPerThreadgroup = &self->_threadGroupInfo.threadsPerThreadgroup;
  long long v23 = *(_OWORD *)&self->_threadGroupInfo.dispatchThreadgroups.width;
  unint64_t depth = self->_threadGroupInfo.dispatchThreadgroups.depth;
  $E8CF8C4D35898297CF58D66FCEA3D064 threadsPerThreadgroup = self->_threadGroupInfo.threadsPerThreadgroup;
  [v14 dispatchThreadgroups:&v23 threadsPerThreadgroup:&threadsPerThreadgroup];
  [v14 endEncoding];

  if (a7 >= 2)
  {
    int v18 = a7 - 1;
    do
    {
      char v19 = [v11 computeCommandEncoder];
      [v19 setComputePipelineState:self->_computePipelines[1]];
      [v19 setBuffer:self->_gridHashBuffer offset:0 atIndex:0];
      [v19 setBuffer:self->_gridBlurBuffer offset:0 atIndex:1];
      [v19 setBuffer:Dn_buf[self->_idxDnBufIn] offset:0 atIndex:2];
      [v19 setBuffer:Dn_buf[self->_idxDnBufIn ^ 1] offset:0 atIndex:3];
      [v19 setBytes:&self->_params length:20 atIndex:4];
      long long v23 = *(_OWORD *)&p_threadGroupInfo->dispatchThreadgroups.width;
      unint64_t depth = self->_threadGroupInfo.dispatchThreadgroups.depth;
      *(_OWORD *)&threadsPerThreadgroup.uint64_t width = *(_OWORD *)&p_threadsPerThreadgroup->width;
      threadsPerThreadgroup.unint64_t depth = self->_threadGroupInfo.threadsPerThreadgroup.depth;
      [v19 dispatchThreadgroups:&v23 threadsPerThreadgroup:&threadsPerThreadgroup];
      [v19 endEncoding];
      self->_idxDnBufIn ^= 1u;

      --v18;
    }
    while (v18);
  }
  uint64_t v20 = [v11 computeCommandEncoder];
  [v20 setComputePipelineState:self->_computePipelines[2]];
  [v20 setBuffer:self->_gridHashBuffer offset:0 atIndex:0];
  [v20 setBuffer:self->_gridBlurBuffer offset:0 atIndex:1];
  [v20 setBuffer:self->_gridCoordIndicesBuffer offset:0 atIndex:2];
  [v20 setBuffer:self->_gridCoordTableBuffer offset:0 atIndex:3];
  [v20 setTexture:v12 atIndex:0];
  [v20 setTexture:v13 atIndex:1];
  [v20 setBuffer:Dn_buf[self->_idxDnBufIn] offset:0 atIndex:4];
  [v20 setBuffer:self->_A_buf offset:0 atIndex:5];
  [v20 setBuffer:self->_b_buf offset:0 atIndex:6];
  [v20 setBuffer:self->_x_buf[self->_idxSwapBufIn] offset:0 atIndex:7];
  [v20 setBytes:&self->_params length:20 atIndex:8];
  [v20 setBytes:self->_anon_ac length:16 atIndex:9];
  long long v23 = *(_OWORD *)&p_threadGroupInfo->dispatchThreadgroups.width;
  unint64_t depth = self->_threadGroupInfo.dispatchThreadgroups.depth;
  *(_OWORD *)&threadsPerThreadgroup.uint64_t width = *(_OWORD *)&p_threadsPerThreadgroup->width;
  threadsPerThreadgroup.unint64_t depth = self->_threadGroupInfo.threadsPerThreadgroup.depth;
  [v20 dispatchThreadgroups:&v23 threadsPerThreadgroup:&threadsPerThreadgroup];
  [v20 endEncoding];

  return 0;
}

- (int)_doPCGWithCommandBuffer:(id)a3 nIterations:(int)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)[(MTLDevice *)self->_metalDevice newBufferWithLength:4 options:0];
  long long v23 = (void *)[(MTLDevice *)self->_metalDevice newBufferWithLength:4 options:0];
  uint64_t v8 = [(MTLDevice *)self->_metalDevice newBufferWithLength:1 options:0];
  uint64_t v9 = [v6 computeCommandEncoder];
  [v9 setComputePipelineState:self->_computePipelines[3]];
  [v9 setBuffer:self->_gridHashBuffer offset:0 atIndex:0];
  [v9 setBuffer:self->_gridBlurBuffer offset:0 atIndex:1];
  [v9 setBuffer:self->_Dn_buf[self->_idxDnBufIn] offset:0 atIndex:2];
  [v9 setBuffer:self->_A_buf offset:0 atIndex:3];
  [v9 setBuffer:self->_b_buf offset:0 atIndex:4];
  x_buf = self->_x_buf;
  [v9 setBuffer:self->_x_buf[self->_idxSwapBufIn] offset:0 atIndex:5];
  [v9 setBuffer:self->_r_buf[self->_idxSwapBufIn] offset:0 atIndex:6];
  d_buf = self->_d_buf;
  [v9 setBuffer:self->_d_buf[self->_idxSwapBufIn] offset:0 atIndex:7];
  [v9 setBuffer:v7 offset:0 atIndex:8];
  [v9 setBuffer:v8 offset:0 atIndex:9];
  [v9 setBytes:&self->_params length:20 atIndex:10];
  long long v28 = *(_OWORD *)&self->_threadGroupInfo.dispatchThreadgroups.width;
  unint64_t depth = self->_threadGroupInfo.dispatchThreadgroups.depth;
  $E8CF8C4D35898297CF58D66FCEA3D064 threadsPerThreadgroup = self->_threadGroupInfo.threadsPerThreadgroup;
  [v9 dispatchThreadgroups:&v28 threadsPerThreadgroup:&threadsPerThreadgroup];
  [v9 endEncoding];

  uint64_t v22 = (void *)v8;
  if (a4 < 1)
  {
    objc_super v15 = v7;
  }
  else
  {
    p_$E8CF8C4D35898297CF58D66FCEA3D064 threadsPerThreadgroup = &self->_threadGroupInfo.threadsPerThreadgroup;
    p_threadGroupInfo = &self->_threadGroupInfo;
    r_buf = self->_r_buf;
    uint64_t v26 = v6;
    id v11 = &self->_threadGroupInfo;
    id v12 = &self->_threadGroupInfo.threadsPerThreadgroup;
    do
    {
      int v25 = a4;
      uint64_t v24 = -[MTLDevice newBufferWithLength:options:](self->_metalDevice, "newBufferWithLength:options:", 4, 0, p_threadsPerThreadgroup, p_threadGroupInfo);
      id v13 = [v6 computeCommandEncoder];
      [v13 setComputePipelineState:self->_computePipelines[4]];
      [v13 setBuffer:self->_gridHashBuffer offset:0 atIndex:0];
      [v13 setBuffer:self->_gridBlurBuffer offset:0 atIndex:1];
      [v13 setBuffer:self->_Dn_buf[self->_idxDnBufIn] offset:0 atIndex:2];
      [v13 setBuffer:self->_A_buf offset:0 atIndex:3];
      [v13 setBuffer:d_buf[self->_idxSwapBufIn] offset:0 atIndex:4];
      [v13 setBuffer:self->_q_buf offset:0 atIndex:5];
      [v13 setBuffer:v23 offset:0 atIndex:6];
      [v13 setBuffer:v22 offset:0 atIndex:7];
      [v13 setBytes:&self->_params length:20 atIndex:8];
      long long v28 = *(_OWORD *)&v11->dispatchThreadgroups.width;
      unint64_t depth = self->_threadGroupInfo.dispatchThreadgroups.depth;
      *(_OWORD *)&threadsPerThreadgroup.uint64_t width = *(_OWORD *)&v12->width;
      threadsPerThreadgroup.unint64_t depth = self->_threadGroupInfo.threadsPerThreadgroup.depth;
      [v13 dispatchThreadgroups:&v28 threadsPerThreadgroup:&threadsPerThreadgroup];
      [v13 endEncoding];

      uint64_t v14 = [v26 computeCommandEncoder];
      [v14 setComputePipelineState:self->_computePipelines[5]];
      [v14 setBuffer:self->_A_buf offset:0 atIndex:0];
      [v14 setBuffer:x_buf[self->_idxSwapBufIn] offset:0 atIndex:1];
      [v14 setBuffer:r_buf[self->_idxSwapBufIn] offset:0 atIndex:2];
      [v14 setBuffer:d_buf[self->_idxSwapBufIn] offset:0 atIndex:3];
      [v14 setBuffer:self->_q_buf offset:0 atIndex:4];
      [v14 setBuffer:x_buf[self->_idxSwapBufIn ^ 1] offset:0 atIndex:5];
      [v14 setBuffer:r_buf[self->_idxSwapBufIn ^ 1] offset:0 atIndex:6];
      [v14 setBuffer:self->_s_buf offset:0 atIndex:7];
      objc_super v15 = (void *)v24;
      [v14 setBuffer:v24 offset:0 atIndex:8];
      [v14 setBuffer:v7 offset:0 atIndex:9];
      [v14 setBuffer:v23 offset:0 atIndex:10];
      [v14 setBuffer:v22 offset:0 atIndex:11];
      [v14 setBytes:&self->_params length:20 atIndex:12];
      long long v28 = *(_OWORD *)&v11->dispatchThreadgroups.width;
      unint64_t depth = self->_threadGroupInfo.dispatchThreadgroups.depth;
      *(_OWORD *)&threadsPerThreadgroup.uint64_t width = *(_OWORD *)&v12->width;
      threadsPerThreadgroup.unint64_t depth = self->_threadGroupInfo.threadsPerThreadgroup.depth;
      [v14 dispatchThreadgroups:&v28 threadsPerThreadgroup:&threadsPerThreadgroup];
      [v14 endEncoding];

      id v16 = [v26 computeCommandEncoder];
      [v16 setComputePipelineState:self->_computePipelines[6]];
      [v16 setBuffer:self->_s_buf offset:0 atIndex:0];
      [v16 setBuffer:d_buf[self->_idxSwapBufIn] offset:0 atIndex:1];
      [v16 setBuffer:d_buf[self->_idxSwapBufIn ^ 1] offset:0 atIndex:2];
      [v16 setBuffer:v7 offset:0 atIndex:3];
      [v16 setBuffer:v24 offset:0 atIndex:4];
      [v16 setBuffer:v22 offset:0 atIndex:5];
      [v16 setBytes:&self->_params length:20 atIndex:6];
      long long v28 = *(_OWORD *)&v11->dispatchThreadgroups.width;
      unint64_t depth = self->_threadGroupInfo.dispatchThreadgroups.depth;
      *(_OWORD *)&threadsPerThreadgroup.uint64_t width = *(_OWORD *)&v12->width;
      threadsPerThreadgroup.unint64_t depth = self->_threadGroupInfo.threadsPerThreadgroup.depth;
      [v16 dispatchThreadgroups:&v28 threadsPerThreadgroup:&threadsPerThreadgroup];
      [v16 endEncoding];

      id v6 = v26;
      self->_idxSwapBufIn ^= 1u;
      uint64_t v7 = (void *)v24;
      --a4;
    }
    while (v25 != 1);
  }

  return 0;
}

- (int)_doSliceWithCommandBuffer:(id)a3 o_tex:(id)a4
{
  int width = self->_width;
  int height = self->_height;
  uint64_t v8 = self->_computePipelines[7];
  id v9 = a4;
  id v10 = a3;
  LODWORD(v8) = [(MTLComputePipelineState *)v8 threadExecutionWidth];
  int v11 = (int)[(MTLComputePipelineState *)self->_computePipelines[7] maxTotalThreadsPerThreadgroup]/ (int)v8;
  id v12 = [v10 computeCommandEncoder];

  [v12 setComputePipelineState:self->_computePipelines[7]];
  [v12 setTexture:self->_gridHashMatrix atIndex:0];
  [v12 setBuffer:self->_x_buf[self->_idxSwapBufIn] offset:0 atIndex:0];
  [v12 setTexture:v9 atIndex:1];

  v15[0] = (width + (int)v8 - 1) / (int)v8;
  v15[1] = (height + v11 - 1) / v11;
  v15[2] = 1;
  v14[0] = (int)v8;
  v14[1] = v11;
  v14[2] = 1;
  [v12 dispatchThreadgroups:v15 threadsPerThreadgroup:v14];
  [v12 endEncoding];

  return 0;
}

- (int)_doSliceTrilinearWithCommandBuffer:(id)a3 ref_tex:(id)a4 o_tex:(id)a5
{
  int width = self->_width;
  int height = self->_height;
  if (width >= 0) {
    int v10 = self->_width;
  }
  else {
    int v10 = width + 1;
  }
  if (height >= 0) {
    int v11 = self->_height;
  }
  else {
    int v11 = height + 1;
  }
  id v12 = self->_computePipelines[8];
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  int v16 = [(MTLComputePipelineState *)v12 threadExecutionWidth];
  LODWORD(v12) = (int)[(MTLComputePipelineState *)self->_computePipelines[8] maxTotalThreadsPerThreadgroup]/ v16;
  id v17 = [v15 computeCommandEncoder];

  [v17 setComputePipelineState:self->_computePipelines[8]];
  [v17 setTexture:self->_gridHashMatrix atIndex:0];
  [v17 setBuffer:self->_gridInterpIndicesBuffer offset:0 atIndex:0];
  [v17 setBuffer:self->_gridInterpTableBuffer offset:0 atIndex:1];
  [v17 setBuffer:self->_gridInterpPadBuffer offset:0 atIndex:2];
  [v17 setBuffer:self->_x_buf[self->_idxSwapBufIn] offset:0 atIndex:3];
  [v17 setTexture:v14 atIndex:1];

  [v17 setTexture:v13 atIndex:2];
  [v17 setBytes:&self->_params length:20 atIndex:4];
  [v17 setBytes:self->_anon_ac length:16 atIndex:5];
  v20[0] = (v16 + (v10 >> 1) - 1) / v16;
  v20[1] = ((int)v12 + (v11 >> 1) - 1) / (int)v12;
  v20[2] = 1;
  v19[0] = v16;
  v19[1] = (int)v12;
  v19[2] = 1;
  [v17 dispatchThreadgroups:v20 threadsPerThreadgroup:v19];
  [v17 endEncoding];

  return 0;
}

- (BOOL)useTrilinearInterpolation
{
  return self->_useTrilinearInterpolation;
}

- (void)setUseTrilinearInterpolation:(BOOL)a3
{
  self->_useTrilinearInterpolation = a3;
}

- (void).cxx_destruct
{
  uint64_t v3 = 0;
  id v4 = &self->_d_buf[1];
  do
    objc_storeStrong((id *)&v4[v3--], 0);
  while (v3 != -2);
  for (uint64_t i = 0; i != -2; --i)
    objc_storeStrong((id *)&self->_r_buf[i + 1], 0);
  for (uint64_t j = 0; j != -2; --j)
    objc_storeStrong((id *)&self->_x_buf[j + 1], 0);
  for (uint64_t k = 0; k != -2; --k)
    objc_storeStrong((id *)&self->_Dn_buf[k + 1], 0);
  objc_storeStrong((id *)&self->_q_buf, 0);
  objc_storeStrong((id *)&self->_s_buf, 0);
  objc_storeStrong((id *)&self->_b_buf, 0);
  objc_storeStrong((id *)&self->_A_buf, 0);
  objc_storeStrong((id *)&self->_gridInterpPadBuffer, 0);
  objc_storeStrong((id *)&self->_gridInterpTableBuffer, 0);
  objc_storeStrong((id *)&self->_gridInterpIndicesBuffer, 0);
  objc_storeStrong((id *)&self->_gridHashMatrix, 0);
  objc_storeStrong((id *)&self->_gridCoordTableBuffer, 0);
  objc_storeStrong((id *)&self->_gridCoordIndicesBuffer, 0);
  objc_storeStrong((id *)&self->_gridBlurBuffer, 0);
  objc_storeStrong((id *)&self->_gridHashBuffer, 0);
  objc_storeStrong((id *)&self->_computePipelinesGroup, 0);
  for (uint64_t m = 88; m != 16; m -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + m), 0);
  objc_storeStrong((id *)&self->_metalDevice, 0);

  objc_storeStrong((id *)&self->_commandBuffer, 0);
}

@end