@interface MetalRANSACDispatcher
- (CGSize)frameSize;
- (MTLBuffer)m_ModelScores;
- (MTLBuffer)m_RansacHomographies;
- (MTLBuffer)m_RansacParams;
- (MTLBuffer)m_ScoreBuffer;
- (MTLBuffer)m_mX;
- (MTLBuffer)m_mXhat;
- (MTLCommandQueue)m_metalCommandQueue;
- (MTLComputePipelineState)m_metalPipeline;
- (MTLDevice)m_metalDevice;
- (MTLFunction)m_metalKernelFunction;
- (MTLLibrary)m_metalLibrary;
- (MetalRANSACDispatcher)initWithMaxCorrespondences:(unint64_t)a3;
- (float)inlierLimit;
- (unint64_t)m_maxCorrespondences;
- (unint64_t)m_numThreadsPerGroup;
- (void)assureSizeAndCopyToMetalBuffer:(id *)a3 fromData:(const void *)a4 dataSize:(unint64_t)a5 metalResourceOptions:(unint64_t)a6;
- (void)performRansacOnData:(unsigned int)a3 firstPointSet:(const float *)a4 secondPointSet:(const float *)a5 pointWeights:(const float *)a6 homographies:(const ransac_homography_record *)a7 numHomographies:(unsigned int)a8 homScores:(float *)a9;
- (void)setFrameSize:(CGSize)a3;
- (void)setInlierLimit:(float)a3;
- (void)setM_ModelScores:(id)a3;
- (void)setM_RansacHomographies:(id)a3;
- (void)setM_RansacParams:(id)a3;
- (void)setM_ScoreBuffer:(id)a3;
- (void)setM_mX:(id)a3;
- (void)setM_mXhat:(id)a3;
- (void)setM_maxCorrespondences:(unint64_t)a3;
- (void)setM_metalCommandQueue:(id)a3;
- (void)setM_metalDevice:(id)a3;
- (void)setM_metalKernelFunction:(id)a3;
- (void)setM_metalLibrary:(id)a3;
- (void)setM_metalPipeline:(id)a3;
- (void)setM_numThreadsPerGroup:(unint64_t)a3;
@end

@implementation MetalRANSACDispatcher

- (MetalRANSACDispatcher)initWithMaxCorrespondences:(unint64_t)a3
{
  v25.receiver = self;
  v25.super_class = (Class)MetalRANSACDispatcher;
  v4 = [(MetalRANSACDispatcher *)&v25 init];
  if (!v4) {
    goto LABEL_10;
  }
  v5 = (MTLDevice *)MTLCreateSystemDefaultDevice();
  m_metalDevice = v4->m_metalDevice;
  v4->m_metalDevice = v5;

  v7 = v4->m_metalDevice;
  if (!v7)
  {
LABEL_11:

    v4 = 0;
    goto LABEL_12;
  }
  v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v9 = [v8 pathForResource:@"InertiaCamMetalLib" ofType:@"metallib"];
  uint64_t v10 = [(MTLDevice *)v7 newLibraryWithFile:v9 error:0];
  m_metalLibrary = v4->m_metalLibrary;
  v4->m_metalLibrary = (MTLLibrary *)v10;

  if (!v4->m_metalLibrary) {
    goto LABEL_10;
  }
  uint64_t v12 = [(MTLDevice *)v4->m_metalDevice newCommandQueue];
  m_metalCommandQueue = v4->m_metalCommandQueue;
  v4->m_metalCommandQueue = (MTLCommandQueue *)v12;

  if (!v4->m_metalCommandQueue
    || (uint64_t v14 = [(MTLLibrary *)v4->m_metalLibrary newFunctionWithName:@"metal_ransac_kernel"], m_metalKernelFunction = v4->m_metalKernelFunction, v4->m_metalKernelFunction = (MTLFunction *)v14, m_metalKernelFunction, (v16 = v4->m_metalKernelFunction) == 0))
  {
LABEL_10:
    v7 = 0;
    goto LABEL_11;
  }
  v17 = v4->m_metalDevice;
  id v24 = 0;
  uint64_t v18 = [(MTLDevice *)v17 newComputePipelineStateWithFunction:v16 error:&v24];
  v7 = (MTLDevice *)v24;
  m_metalPipeline = v4->m_metalPipeline;
  v4->m_metalPipeline = (MTLComputePipelineState *)v18;

  v20 = v4->m_metalPipeline;
  if (!v20) {
    goto LABEL_11;
  }
  unint64_t v21 = [(MTLComputePipelineState *)v20 maxTotalThreadsPerThreadgroup];
  v4->inlierLimit = 0.0;
  uint64_t v22 = 32;
  if (v21 < 0x20) {
    uint64_t v22 = v21;
  }
  v4->frameSize.width = 0.0;
  v4->frameSize.height = 0.0;
  v4->_m_numThreadsPerGroup = v22;
  v4->_m_maxCorrespondences = a3;
LABEL_12:

  return v4;
}

- (void)performRansacOnData:(unsigned int)a3 firstPointSet:(const float *)a4 secondPointSet:(const float *)a5 pointWeights:(const float *)a6 homographies:(const ransac_homography_record *)a7 numHomographies:(unsigned int)a8 homScores:(float *)a9
{
  unsigned int v26 = a8;
  unsigned int v27 = a3;
  float inlierLimit = self->inlierLimit;
  float32x2_t v24 = vcvt_f32_f64((float64x2_t)self->frameSize);
  [(MetalRANSACDispatcher *)self assureSizeAndCopyToMetalBuffer:&self->_m_mX fromData:a4 dataSize:8 * a3 metalResourceOptions:0];
  [(MetalRANSACDispatcher *)self assureSizeAndCopyToMetalBuffer:&self->_m_mXhat fromData:a5 dataSize:8 * a3 metalResourceOptions:0];
  [(MetalRANSACDispatcher *)self assureSizeAndCopyToMetalBuffer:&self->_m_ScoreBuffer fromData:a6 dataSize:4 * a3 metalResourceOptions:0];
  [(MetalRANSACDispatcher *)self assureSizeAndCopyToMetalBuffer:&self->_m_RansacParams fromData:&v24 dataSize:20 metalResourceOptions:0];
  [(MetalRANSACDispatcher *)self assureSizeAndCopyToMetalBuffer:&self->_m_RansacHomographies fromData:a7 dataSize:36 * a8 metalResourceOptions:0];
  size_t v15 = 4 * a8;
  [(MetalRANSACDispatcher *)self assureSizeAndCopyToMetalBuffer:&self->_m_ModelScores fromData:0 dataSize:v15 metalResourceOptions:0];
  unint64_t m_numThreadsPerGroup = self->_m_numThreadsPerGroup;
  unint64_t v17 = (m_numThreadsPerGroup + a8 - 1) / m_numThreadsPerGroup;
  uint64_t v18 = [(MTLCommandQueue *)self->m_metalCommandQueue commandBuffer];
  v19 = [v18 computeCommandEncoder];
  [v19 setComputePipelineState:self->m_metalPipeline];
  [v19 setBuffer:self->_m_RansacParams offset:0 atIndex:0];
  [v19 setBuffer:self->_m_mX offset:0 atIndex:1];
  [v19 setBuffer:self->_m_mXhat offset:0 atIndex:2];
  [v19 setBuffer:self->_m_ScoreBuffer offset:0 atIndex:3];
  [v19 setBuffer:self->_m_RansacHomographies offset:0 atIndex:4];
  [v19 setBuffer:self->_m_ModelScores offset:0 atIndex:5];
  unint64_t v22 = v17;
  int64x2_t v23 = vdupq_n_s64(1uLL);
  unint64_t v20 = m_numThreadsPerGroup;
  int64x2_t v21 = v23;
  [v19 dispatchThreadgroups:&v22 threadsPerThreadgroup:&v20];
  [v19 endEncoding];
  [v18 commit];
  [v18 waitUntilCompleted];
  memcpy(a9, (const void *)[(MTLBuffer *)self->_m_ModelScores contents], v15);
}

- (void)assureSizeAndCopyToMetalBuffer:(id *)a3 fromData:(const void *)a4 dataSize:(unint64_t)a5 metalResourceOptions:(unint64_t)a6
{
  if (!*a3) {
    goto LABEL_9;
  }
  if ([*a3 length] < a5)
  {
    id v11 = *a3;
    *a3 = 0;
  }
  if (*a3)
  {
    if (a4)
    {
      uint64_t v12 = (void *)[*a3 contents];
      memcpy(v12, a4, a5);
    }
  }
  else
  {
LABEL_9:
    m_metalDevice = self->m_metalDevice;
    if (a4) {
      uint64_t v14 = (void *)[(MTLDevice *)m_metalDevice newBufferWithBytes:a4 length:a5 options:a6];
    }
    else {
      uint64_t v14 = (void *)[(MTLDevice *)m_metalDevice newBufferWithLength:a5 options:a6];
    }
    *a3 = v14;
    MEMORY[0x1F41817F8]();
  }
}

- (MTLCommandQueue)m_metalCommandQueue
{
  return self->m_metalCommandQueue;
}

- (void)setM_metalCommandQueue:(id)a3
{
}

- (MTLDevice)m_metalDevice
{
  return self->m_metalDevice;
}

- (void)setM_metalDevice:(id)a3
{
}

- (MTLFunction)m_metalKernelFunction
{
  return self->m_metalKernelFunction;
}

- (void)setM_metalKernelFunction:(id)a3
{
}

- (MTLLibrary)m_metalLibrary
{
  return self->m_metalLibrary;
}

- (void)setM_metalLibrary:(id)a3
{
}

- (MTLComputePipelineState)m_metalPipeline
{
  return self->m_metalPipeline;
}

- (void)setM_metalPipeline:(id)a3
{
}

- (float)inlierLimit
{
  return self->inlierLimit;
}

- (void)setInlierLimit:(float)a3
{
  self->float inlierLimit = a3;
}

- (CGSize)frameSize
{
  double width = self->frameSize.width;
  double height = self->frameSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setFrameSize:(CGSize)a3
{
  self->frameSize = a3;
}

- (unint64_t)m_numThreadsPerGroup
{
  return self->_m_numThreadsPerGroup;
}

- (void)setM_numThreadsPerGroup:(unint64_t)a3
{
  self->_unint64_t m_numThreadsPerGroup = a3;
}

- (unint64_t)m_maxCorrespondences
{
  return self->_m_maxCorrespondences;
}

- (void)setM_maxCorrespondences:(unint64_t)a3
{
  self->_m_maxCorrespondences = a3;
}

- (MTLBuffer)m_mX
{
  return self->_m_mX;
}

- (void)setM_mX:(id)a3
{
}

- (MTLBuffer)m_mXhat
{
  return self->_m_mXhat;
}

- (void)setM_mXhat:(id)a3
{
}

- (MTLBuffer)m_ScoreBuffer
{
  return self->_m_ScoreBuffer;
}

- (void)setM_ScoreBuffer:(id)a3
{
}

- (MTLBuffer)m_RansacParams
{
  return self->_m_RansacParams;
}

- (void)setM_RansacParams:(id)a3
{
}

- (MTLBuffer)m_RansacHomographies
{
  return self->_m_RansacHomographies;
}

- (void)setM_RansacHomographies:(id)a3
{
}

- (MTLBuffer)m_ModelScores
{
  return self->_m_ModelScores;
}

- (void)setM_ModelScores:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_m_ModelScores, 0);
  objc_storeStrong((id *)&self->_m_RansacHomographies, 0);
  objc_storeStrong((id *)&self->_m_RansacParams, 0);
  objc_storeStrong((id *)&self->_m_ScoreBuffer, 0);
  objc_storeStrong((id *)&self->_m_mXhat, 0);
  objc_storeStrong((id *)&self->_m_mX, 0);
  objc_storeStrong((id *)&self->m_metalPipeline, 0);
  objc_storeStrong((id *)&self->m_metalLibrary, 0);
  objc_storeStrong((id *)&self->m_metalKernelFunction, 0);
  objc_storeStrong((id *)&self->m_metalDevice, 0);
  objc_storeStrong((id *)&self->m_metalCommandQueue, 0);
}

@end