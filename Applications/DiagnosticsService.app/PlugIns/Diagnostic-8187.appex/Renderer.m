@interface Renderer
- (BOOL)hasRenderDevice;
- (Renderer)initWithSize:(CGSize)a3;
- (void)changeRenderSize:(CGSize)a3;
- (void)createBuffers;
- (void)createIntersector;
- (void)createPipelines;
- (void)createScene;
- (void)dealloc;
- (void)loadMetal;
- (void)render;
- (void)updateUniforms;
@end

@implementation Renderer

- (Renderer)initWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v11.receiver = self;
  v11.super_class = (Class)Renderer;
  v5 = [(Renderer *)&v11 init];
  if (v5)
  {
    v6 = (MTLDevice *)MTLCreateSystemDefaultDevice();
    device = v5->_device;
    v5->_device = v6;

    v5->_size.double width = width;
    v5->_size.double height = height;
    dispatch_semaphore_t v8 = dispatch_semaphore_create(3);
    sem = v5->_sem;
    v5->_sem = (OS_dispatch_semaphore *)v8;

    [(Renderer *)v5 loadMetal];
    [(Renderer *)v5 createPipelines];
    [(Renderer *)v5 createScene];
    [(Renderer *)v5 createBuffers];
    [(Renderer *)v5 createIntersector];
    -[Renderer changeRenderSize:](v5, "changeRenderSize:", width, height);
  }
  return v5;
}

- (void)dealloc
{
  [(MTLBuffer *)self->_vertexPositionBuffer setPurgeableState:4];
  [(MTLBuffer *)self->_vertexNormalBuffer setPurgeableState:4];
  [(MTLBuffer *)self->_vertexColorBuffer setPurgeableState:4];
  [(MTLBuffer *)self->_rayBuffer setPurgeableState:4];
  [(MTLBuffer *)self->_shadowRayBuffer setPurgeableState:4];
  [(MTLBuffer *)self->_intersectionBuffer setPurgeableState:4];
  [(MTLBuffer *)self->_uniformBuffer setPurgeableState:4];
  [(MTLBuffer *)self->_randomBuffer setPurgeableState:4];
  [(MTLBuffer *)self->_triangleMaskBuffer setPurgeableState:4];
  [(MTLTexture *)self->_renderTarget setPurgeableState:4];
  [(MTLTexture *)self->_accumulationTarget setPurgeableState:4];
  v3.receiver = self;
  v3.super_class = (Class)Renderer;
  [(Renderer *)&v3 dealloc];
}

- (void)loadMetal
{
  objc_super v3 = (MTLLibrary *)[(MTLDevice *)self->_device newDefaultLibrary];
  library = self->_library;
  self->_library = v3;

  self->_queue = (MTLCommandQueue *)[(MTLDevice *)self->_device newCommandQueue];

  _objc_release_x1();
}

- (void)createPipelines
{
  id v3 = objc_alloc_init((Class)MTLComputePipelineDescriptor);
  [v3 setThreadGroupSizeIsMultipleOfThreadExecutionWidth:1];
  id v4 = [(MTLLibrary *)self->_library newFunctionWithName:@"rayKernel"];
  [v3 setComputeFunction:v4];

  device = self->_device;
  id v37 = 0;
  v6 = (MTLComputePipelineState *)[(MTLDevice *)device newComputePipelineStateWithDescriptor:v3 options:0 reflection:0 error:&v37];
  id v7 = v37;
  rayPipeline = self->_rayPipeline;
  self->_rayPipeline = v6;

  id v9 = [(MTLLibrary *)self->_library newFunctionWithName:@"shadeKernel"];
  [v3 setComputeFunction:v9];

  v10 = self->_device;
  id v36 = v7;
  objc_super v11 = (MTLComputePipelineState *)[(MTLDevice *)v10 newComputePipelineStateWithDescriptor:v3 options:0 reflection:0 error:&v36];
  id v12 = v36;

  shadePipeline = self->_shadePipeline;
  self->_shadePipeline = v11;

  id v14 = [(MTLLibrary *)self->_library newFunctionWithName:@"shadowKernel"];
  [v3 setComputeFunction:v14];

  v15 = self->_device;
  id v35 = v12;
  v16 = (MTLComputePipelineState *)[(MTLDevice *)v15 newComputePipelineStateWithDescriptor:v3 options:0 reflection:0 error:&v35];
  id v17 = v35;

  shadowPipeline = self->_shadowPipeline;
  self->_shadowPipeline = v16;

  id v19 = [(MTLLibrary *)self->_library newFunctionWithName:@"accumulateKernel"];
  [v3 setComputeFunction:v19];

  v20 = self->_device;
  id v34 = v17;
  v21 = (MTLComputePipelineState *)[(MTLDevice *)v20 newComputePipelineStateWithDescriptor:v3 options:0 reflection:0 error:&v34];
  id v22 = v34;

  accumulatePipeline = self->_accumulatePipeline;
  self->_accumulatePipeline = v21;

  id v24 = objc_alloc_init((Class)MTLRenderPipelineDescriptor);
  [v24 setRasterSampleCount:1];
  id v25 = [(MTLLibrary *)self->_library newFunctionWithName:@"copyVertex"];
  [v24 setVertexFunction:v25];

  id v26 = [(MTLLibrary *)self->_library newFunctionWithName:@"copyFragment"];
  [v24 setFragmentFunction:v26];

  v27 = [v24 colorAttachments];
  v28 = [v27 objectAtIndexedSubscript:0];
  [v28 setPixelFormat:115];

  v29 = self->_device;
  id v33 = v22;
  v30 = (MTLRenderPipelineState *)[(MTLDevice *)v29 newRenderPipelineStateWithDescriptor:v24 error:&v33];
  id v31 = v33;

  copyPipeline = self->_copyPipeline;
  self->_copyPipeline = v30;
}

- (void)createScene
{
  *(double *)v2.i64 = matrix4x4_translation(0.0, 1.0, 0.0);
  float32x4_t v79 = v2;
  float32x4_t v83 = v3;
  float32x4_t v65 = v5;
  float32x4_t v72 = v4;
  matrix4x4_scale(0.5, 1.98, 0.5);
  uint64_t v6 = 0;
  long long v85 = v7;
  long long v86 = v8;
  long long v87 = v9;
  long long v88 = v10;
  do
  {
    *(float32x4_t *)((char *)&v89 + v6) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v79, COERCE_FLOAT(*(long long *)((char *)&v85 + v6))), v83, *(float32x2_t *)((char *)&v85 + v6), 1), v72, *(float32x4_t *)((char *)&v85 + v6), 2), v65, *(float32x4_t *)((char *)&v85 + v6), 3);
    v6 += 16;
  }
  while (v6 != 64);
  __asm { FMOV            V0.4S, #1.0 }
  createCube(8, 1, 2, _Q0, v89, v90, v91, v92);
  *(double *)v16.i64 = matrix4x4_translation(0.0, 1.0, 0.0);
  float32x4_t v80 = v16;
  float32x4_t v84 = v17;
  float32x4_t v66 = v19;
  float32x4_t v73 = v18;
  matrix4x4_scale(2.0, 2.0, 2.0);
  uint64_t v20 = 0;
  long long v85 = v21;
  long long v86 = v22;
  long long v87 = v23;
  long long v88 = v24;
  do
  {
    *(float32x4_t *)((char *)&v89 + v20) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v80, COERCE_FLOAT(*(long long *)((char *)&v85 + v20))), v84, *(float32x2_t *)((char *)&v85 + v20), 1), v73, *(float32x4_t *)((char *)&v85 + v20), 2), v66, *(float32x4_t *)((char *)&v85 + v20), 3);
    v20 += 16;
  }
  while (v20 != 64);
  float32x4_t v74 = v91;
  float32x4_t v81 = v92;
  float32x4_t v60 = v89;
  float32x4_t v67 = v90;
  createCube(28, 1, 1, (__n128)xmmword_100010040, v89, v90, v91, v92);
  createCube(1, 1, 1, (__n128)xmmword_100010050, v60, v67, v74, v81);
  createCube(2, 1, 1, (__n128)xmmword_100010060, v60, v67, v74, v81);
  *(double *)v25.i64 = matrix4x4_translation(0.3275, 0.3, 0.3725);
  float32x4_t v68 = v25;
  float32x4_t v75 = v26;
  float32x4_t v57 = v28;
  float32x4_t v61 = v27;
  *(double *)&long long v29 = matrix4x4_rotation(-0.3, (float32x4_t)xmmword_100010070);
  uint64_t v30 = 0;
  long long v85 = v29;
  long long v86 = v31;
  long long v87 = v32;
  long long v88 = v33;
  do
  {
    *(float32x4_t *)((char *)&v89 + v30) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v68, COERCE_FLOAT(*(long long *)((char *)&v85 + v30))), v75, *(float32x2_t *)((char *)&v85 + v30), 1), v61, *(float32x4_t *)((char *)&v85 + v30), 2), v57, *(float32x4_t *)((char *)&v85 + v30), 3);
    v30 += 16;
  }
  while (v30 != 64);
  float32x4_t v69 = v89;
  float32x4_t v76 = v90;
  float32x4_t v58 = v92;
  float32x4_t v62 = v91;
  matrix4x4_scale(0.6, 0.6, 0.6);
  uint64_t v34 = 0;
  long long v85 = v35;
  long long v86 = v36;
  long long v87 = v37;
  long long v88 = v38;
  do
  {
    *(float32x4_t *)((char *)&v89 + v34) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v69, COERCE_FLOAT(*(long long *)((char *)&v85 + v34))), v76, *(float32x2_t *)((char *)&v85 + v34), 1), v62, *(float32x4_t *)((char *)&v85 + v34), 2), v58, *(float32x4_t *)((char *)&v85 + v34), 3);
    v34 += 16;
  }
  while (v34 != 64);
  createCube(63, 0, 1, (__n128)xmmword_100010040, v89, v90, v91, v92);
  *(double *)v39.i64 = matrix4x4_translation(-0.335, 0.6, -0.29);
  float32x4_t v70 = v39;
  float32x4_t v77 = v40;
  float32x4_t v59 = v42;
  float32x4_t v63 = v41;
  *(double *)&long long v43 = matrix4x4_rotation(0.3, (float32x4_t)xmmword_100010070);
  uint64_t v44 = 0;
  long long v85 = v43;
  long long v86 = v45;
  long long v87 = v46;
  long long v88 = v47;
  do
  {
    *(float32x4_t *)((char *)&v89 + v44) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v70, COERCE_FLOAT(*(long long *)((char *)&v85 + v44))), v77, *(float32x2_t *)((char *)&v85 + v44), 1), v63, *(float32x4_t *)((char *)&v85 + v44), 2), v59, *(float32x4_t *)((char *)&v85 + v44), 3);
    v44 += 16;
  }
  while (v44 != 64);
  float32x4_t v78 = v89;
  float32x4_t v82 = v90;
  float32x4_t v64 = v92;
  float32x4_t v71 = v91;
  matrix4x4_scale(0.6, 1.2, 0.6);
  uint64_t v48 = 0;
  long long v85 = v49;
  long long v86 = v50;
  long long v87 = v51;
  long long v88 = v52;
  do
  {
    *(float32x4_t *)((char *)&v89 + v48) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v78, COERCE_FLOAT(*(long long *)((char *)&v85 + v48))), v82, *(float32x2_t *)((char *)&v85 + v48), 1), v71, *(float32x4_t *)((char *)&v85 + v48), 2), v64, *(float32x4_t *)((char *)&v85 + v48), 3);
    v48 += 16;
  }
  while (v48 != 64);
  float32x4_t v53 = v91;
  float32x4_t v54 = v92;
  float32x4_t v55 = v89;
  float32x4_t v56 = v90;

  createCube(63, 0, 1, (__n128)xmmword_100010040, v55, v56, v53, v54);
}

- (void)createBuffers
{
  float32x4_t v3 = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithLength:768 options:0];
  uniformBuffer = self->_uniformBuffer;
  self->_uniformBuffer = v3;

  float32x4_t v5 = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithLength:6144 options:0];
  randomBuffer = self->_randomBuffer;
  self->_randomBuffer = v5;

  long long v7 = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithLength:qword_10001A748 - vertices options:0];
  vertexPositionBuffer = self->_vertexPositionBuffer;
  self->_vertexPositionBuffer = v7;

  long long v9 = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithLength:qword_10001A778 - colors options:0];
  vertexColorBuffer = self->_vertexColorBuffer;
  self->_vertexColorBuffer = v9;

  objc_super v11 = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithLength:qword_10001A760 - normals options:0];
  vertexNormalBuffer = self->_vertexNormalBuffer;
  self->_vertexNormalBuffer = v11;

  v13 = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithLength:qword_10001A790 - masks options:0];
  triangleMaskBuffer = self->_triangleMaskBuffer;
  self->_triangleMaskBuffer = v13;

  id v15 = [(MTLBuffer *)self->_vertexPositionBuffer contents];
  memcpy(v15, (const void *)vertices, (size_t)[(MTLBuffer *)self->_vertexPositionBuffer length]);
  id v16 = [(MTLBuffer *)self->_vertexColorBuffer contents];
  memcpy(v16, (const void *)colors, (size_t)[(MTLBuffer *)self->_vertexColorBuffer length]);
  id v17 = [(MTLBuffer *)self->_vertexNormalBuffer contents];
  memcpy(v17, (const void *)normals, (size_t)[(MTLBuffer *)self->_vertexNormalBuffer length]);
  id v18 = [(MTLBuffer *)self->_triangleMaskBuffer contents];
  float32x4_t v19 = (const void *)masks;
  id v20 = [(MTLBuffer *)self->_triangleMaskBuffer length];

  memcpy(v18, v19, (size_t)v20);
}

- (void)createIntersector
{
  float32x4_t v3 = (MPSRayIntersector *)[objc_alloc((Class)MPSRayIntersector) initWithDevice:self->_device];
  intersector = self->_intersector;
  self->_intersector = v3;

  [(MPSRayIntersector *)self->_intersector setRayDataType:2];
  [(MPSRayIntersector *)self->_intersector setRayStride:48];
  [(MPSRayIntersector *)self->_intersector setRayMaskOptions:1];
  float32x4_t v5 = (MPSTriangleAccelerationStructure *)[objc_alloc((Class)MPSTriangleAccelerationStructure) initWithDevice:self->_device];
  accelerationStructure = self->_accelerationStructure;
  self->_accelerationStructure = v5;

  [(MPSTriangleAccelerationStructure *)self->_accelerationStructure setVertexBuffer:self->_vertexPositionBuffer];
  [(MPSTriangleAccelerationStructure *)self->_accelerationStructure setMaskBuffer:self->_triangleMaskBuffer];
  [(MPSTriangleAccelerationStructure *)self->_accelerationStructure setTriangleCount:((qword_10001A748 - vertices) >> 4) / 3uLL];
  long long v7 = self->_accelerationStructure;

  [(MPSTriangleAccelerationStructure *)v7 rebuild];
}

- (void)changeRenderSize:(CGSize)a3
{
  self->_size = a3;
  unint64_t width = (unint64_t)a3.width;
  unint64_t height = (unint64_t)a3.height;
  unint64_t v6 = (unint64_t)a3.width * (unint64_t)a3.height;
  long long v7 = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithLength:48 * v6 options:32];
  rayBuffer = self->_rayBuffer;
  self->_rayBuffer = v7;

  long long v9 = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithLength:48 * v6 options:32];
  shadowRayBuffer = self->_shadowRayBuffer;
  self->_shadowRayBuffer = v9;

  objc_super v11 = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithLength:16 * v6 options:32];
  intersectionBuffer = self->_intersectionBuffer;
  self->_intersectionBuffer = v11;

  id v17 = objc_alloc_init((Class)MTLTextureDescriptor);
  [v17 setPixelFormat:125];
  [v17 setTextureType:2];
  [v17 setWidth:width];
  [v17 setHeight:height];
  [v17 setStorageMode:2];
  [v17 setUsage:3];
  v13 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v17];
  renderTarget = self->_renderTarget;
  self->_renderTarget = v13;

  id v15 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v17];
  accumulationTarget = self->_accumulationTarget;
  self->_accumulationTarget = v15;

  self->_frameIndex = 0;
}

- (void)updateUniforms
{
  self->_uniformBufferOffset = self->_uniformBufferIndex << 8;
  float32x4_t v3 = (char *)[(MTLBuffer *)self->_uniformBuffer contents] + self->_uniformBufferOffset;
  *((_OWORD *)v3 + 1) = xmmword_100010080;
  *((_OWORD *)v3 + 2) = xmmword_1000100A0;
  *((_OWORD *)v3 + 3) = xmmword_100010070;
  *((_OWORD *)v3 + 4) = xmmword_100010090;
  *((_OWORD *)v3 + 5) = xmmword_1000100B0;
  *((_OWORD *)v3 + 6) = xmmword_1000100C0;
  *((_OWORD *)v3 + 7) = xmmword_1000100D0;
  *((_OWORD *)v3 + 8) = xmmword_1000100E0;
  __asm { FMOV            V0.4S, #4.0 }
  *((_OWORD *)v3 + 9) = _Q0;
  *(float *)&_Q0 = self->_size.width;
  float height = self->_size.height;
  *((float32x4_t *)v3 + 2) = vmulq_n_f32((float32x4_t)xmmword_1000100A0, (float)(*(float *)&_Q0 / height) * 0.41421);
  *((_OWORD *)v3 + 3) = xmmword_1000100F0;
  *(int32x2_t *)&_Q0 = vmovn_s64((int64x2_t)vcvtq_u64_f64((float64x2_t)self->_size));
  *(void *)float32x4_t v3 = _Q0;
  *((_DWORD *)v3 + 2) = (_Q0 + 15) >> 4;
  unsigned int frameIndex = self->_frameIndex;
  self->_unsigned int frameIndex = frameIndex + 1;
  *((_DWORD *)v3 + 3) = frameIndex;
  self->_randomBufferOffset = self->_uniformBufferIndex << 11;
  uint64_t v11 = 0;
  id v12 = (char *)[(MTLBuffer *)self->_randomBuffer contents] + self->_randomBufferOffset;
  do
  {
    int v13 = rand();
    *(float32x2_t *)&v12[v11] = vmul_f32(vcvt_f32_s32((int32x2_t)__PAIR64__(rand(), v13)), (float32x2_t)0x3000000030000000);
    v11 += 8;
  }
  while (v11 != 2048);
  self->_uniformBufferIndex = (self->_uniformBufferIndex + 1) % 3;
}

- (void)render
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_sem, 0xFFFFFFFFFFFFFFFFLL);
  float32x4_t v3 = [(MTLCommandQueue *)self->_queue commandBuffer];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10000CA84;
  v25[3] = &unk_100014568;
  v25[4] = self;
  [v3 addCompletedHandler:v25];
  [(Renderer *)self updateUniforms];
  double width = self->_size.width;
  double height = self->_size.height;
  unint64_t v6 = [v3 computeCommandEncoder];
  [v6 setBuffer:self->_uniformBuffer offset:self->_uniformBufferOffset atIndex:0];
  [v6 setBuffer:self->_rayBuffer offset:0 atIndex:1];
  [v6 setBuffer:self->_randomBuffer offset:self->_randomBufferOffset atIndex:2];
  [v6 setTexture:self->_renderTarget atIndex:0];
  [v6 setComputePipelineState:self->_rayPipeline];
  v24[0] = ((unint64_t)width + 7) >> 3;
  v24[1] = ((unint64_t)height + 7) >> 3;
  v24[2] = 1;
  int64x2_t v22 = vdupq_n_s64(8uLL);
  uint64_t v23 = 1;
  [v6 dispatchThreadgroups:v24 threadsPerThreadgroup:&v22];
  [v6 endEncoding];
  int v7 = 3;
  int64x2_t v12 = vdupq_n_s64(8uLL);
  long long v8 = v6;
  do
  {
    [(MPSRayIntersector *)self->_intersector setIntersectionDataType:2];
    [(MPSRayIntersector *)self->_intersector encodeIntersectionToCommandBuffer:v3 intersectionType:0 rayBuffer:self->_rayBuffer rayBufferOffset:0 intersectionBuffer:self->_intersectionBuffer intersectionBufferOffset:0 rayCount:(unint64_t)height * (unint64_t)width accelerationStructure:self->_accelerationStructure];
    long long v9 = [v3 computeCommandEncoder];

    [v9 setBuffer:self->_uniformBuffer offset:self->_uniformBufferOffset atIndex:0];
    [v9 setBuffer:self->_rayBuffer offset:0 atIndex:1];
    [v9 setBuffer:self->_shadowRayBuffer offset:0 atIndex:2];
    [v9 setBuffer:self->_intersectionBuffer offset:0 atIndex:3];
    [v9 setBuffer:self->_vertexColorBuffer offset:0 atIndex:4];
    [v9 setBuffer:self->_vertexNormalBuffer offset:0 atIndex:5];
    [v9 setBuffer:self->_randomBuffer offset:self->_randomBufferOffset atIndex:6];
    [v9 setBuffer:self->_triangleMaskBuffer offset:0 atIndex:7];
    [v9 setTexture:self->_renderTarget atIndex:0];
    [v9 setComputePipelineState:self->_shadePipeline];
    v21[0] = ((unint64_t)width + 7) >> 3;
    v21[1] = ((unint64_t)height + 7) >> 3;
    v21[2] = 1;
    int64x2_t v19 = v12;
    uint64_t v20 = 1;
    [v9 dispatchThreadgroups:v21 threadsPerThreadgroup:&v19];
    [v9 endEncoding];
    [(MPSRayIntersector *)self->_intersector setIntersectionDataType:0];
    [(MPSRayIntersector *)self->_intersector encodeIntersectionToCommandBuffer:v3 intersectionType:1 rayBuffer:self->_shadowRayBuffer rayBufferOffset:0 intersectionBuffer:self->_intersectionBuffer intersectionBufferOffset:0 rayCount:(unint64_t)height * (unint64_t)width accelerationStructure:self->_accelerationStructure];
    long long v10 = [v3 computeCommandEncoder];

    [v10 setBuffer:self->_uniformBuffer offset:self->_uniformBufferOffset atIndex:0];
    [v10 setBuffer:self->_shadowRayBuffer offset:0 atIndex:1];
    [v10 setBuffer:self->_intersectionBuffer offset:0 atIndex:2];
    [v10 setTexture:self->_renderTarget atIndex:0];
    [v10 setComputePipelineState:self->_shadowPipeline];
    v18[0] = ((unint64_t)width + 7) >> 3;
    v18[1] = ((unint64_t)height + 7) >> 3;
    v18[2] = 1;
    int64x2_t v16 = vdupq_n_s64(8uLL);
    uint64_t v17 = 1;
    [v10 dispatchThreadgroups:v18 threadsPerThreadgroup:&v16];
    [v10 endEncoding];
    long long v8 = v10;
    --v7;
  }
  while (v7);
  uint64_t v11 = [v3 computeCommandEncoder];

  [v11 setBuffer:self->_uniformBuffer offset:self->_uniformBufferOffset atIndex:0];
  [v11 setTexture:self->_renderTarget atIndex:0];
  [v11 setTexture:self->_accumulationTarget atIndex:1];
  [v11 setComputePipelineState:self->_accumulatePipeline];
  v15[0] = ((unint64_t)width + 7) >> 3;
  v15[1] = ((unint64_t)height + 7) >> 3;
  v15[2] = 1;
  int64x2_t v13 = vdupq_n_s64(8uLL);
  uint64_t v14 = 1;
  [v11 dispatchThreadgroups:v15 threadsPerThreadgroup:&v13];
  [v11 endEncoding];
  [v3 commit];
}

- (BOOL)hasRenderDevice
{
  return self->_device != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sem, 0);
  objc_storeStrong((id *)&self->_accumulationTarget, 0);
  objc_storeStrong((id *)&self->_renderTarget, 0);
  objc_storeStrong((id *)&self->_copyPipeline, 0);
  objc_storeStrong((id *)&self->_accumulatePipeline, 0);
  objc_storeStrong((id *)&self->_shadowPipeline, 0);
  objc_storeStrong((id *)&self->_shadePipeline, 0);
  objc_storeStrong((id *)&self->_rayPipeline, 0);
  objc_storeStrong((id *)&self->_triangleMaskBuffer, 0);
  objc_storeStrong((id *)&self->_randomBuffer, 0);
  objc_storeStrong((id *)&self->_uniformBuffer, 0);
  objc_storeStrong((id *)&self->_intersectionBuffer, 0);
  objc_storeStrong((id *)&self->_shadowRayBuffer, 0);
  objc_storeStrong((id *)&self->_rayBuffer, 0);
  objc_storeStrong((id *)&self->_vertexColorBuffer, 0);
  objc_storeStrong((id *)&self->_vertexNormalBuffer, 0);
  objc_storeStrong((id *)&self->_vertexPositionBuffer, 0);
  objc_storeStrong((id *)&self->_intersector, 0);
  objc_storeStrong((id *)&self->_accelerationStructure, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end