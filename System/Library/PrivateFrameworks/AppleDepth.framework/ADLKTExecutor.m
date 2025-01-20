@interface ADLKTExecutor
- (ADLKTExecutor)initWithDescriptor:(id)a3 forLayout:(unint64_t)a4;
- (ADLKTExecutor)initWithSize:(CGSize)a3;
- (__CVBuffer)createPixelBufferForOpticalFlow;
- (int64_t)executeWithFrame:(__CVBuffer *)a3 createOpticalFlowBuffer:(__CVBuffer *)a4;
- (int64_t)executeWithFrame:(__CVBuffer *)a3 intoOpticalFlowBuffer:(__CVBuffer *)a4;
@end

@implementation ADLKTExecutor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_derivitives[1], 0);
  objc_storeStrong((id *)self->_derivitives, 0);
  objc_storeStrong((id *)&self->_features[1], 0);
  objc_storeStrong((id *)self->_features, 0);
  objc_storeStrong((id *)&self->_pyramids[1], 0);
  objc_storeStrong((id *)self->_pyramids, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_lkt, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (int64_t)executeWithFrame:(__CVBuffer *)a3 intoOpticalFlowBuffer:(__CVBuffer *)a4
{
  kdebug_trace();
  v7 = +[ADMetalUtils bindPixelBufferToMTL2DTexture:a3 metalDevice:self->_device];
  v8 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  pyramids = self->_pyramids;
  int64_t v10 = [(ADLKTOpticalFlow *)self->_lkt encodePyramidFeaturesToCommandBuffer:v8 colorTexture:v7 outPyramidsArray:self->_pyramids[self->_currentFrameIndex] outFeaturesArray:self->_features[self->_currentFrameIndex] outDerivitiveArray:self->_derivitives[self->_currentFrameIndex]];
  if (v10)
  {
    v11 = 0;
  }
  else
  {
    [v8 commit];
    kdebug_trace();
    if (self->_isFirstTime)
    {
      v11 = 0;
      self->_isFirstTime = 0;
    }
    else
    {
      kdebug_trace();
      uint64_t v12 = +[ADMetalUtils bindPixelBufferToMTL2DTexture:a4 metalDevice:self->_device];
      v13 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];

      uint64_t currentFrameIndex = self->_currentFrameIndex;
      [(ADLKTOpticalFlow *)self->_lkt encodeOpticalFlowSolverToCommandBuffer:v13 currentFeaturesArray:self->_features[currentFrameIndex] currentDerivitiveArray:self->_derivitives[currentFrameIndex] previousFeaturesArray:self->_features[currentFrameIndex ^ 1] previousDerivitiveArray:self->_derivitives[currentFrameIndex ^ 1] currentPyramidsArray:pyramids[currentFrameIndex] outShiftMap:v12];
      [v13 commit];
      v11 = (void *)v12;
      v8 = v13;
      kdebug_trace();
    }
    kdebug_trace();
    [v8 waitUntilCompleted];
    unsigned int v15 = 0;
    while ([(NSMutableArray *)*pyramids count] > (unint64_t)v15++)
      ;
    self->_currentFrameIndex ^= 1u;
    kdebug_trace();
    int64_t v10 = 0;
  }

  return v10;
}

- (int64_t)executeWithFrame:(__CVBuffer *)a3 createOpticalFlowBuffer:(__CVBuffer *)a4
{
  v7 = 0;
  *a4 = 0;
  if (!self->_isFirstTime)
  {
    v7 = [(ADLKTExecutor *)self createPixelBufferForOpticalFlow];
    *a4 = v7;
  }
  int64_t v8 = [(ADLKTExecutor *)self executeWithFrame:a3 intoOpticalFlowBuffer:v7];
  if (v8 && !self->_isFirstTime) {
    CVPixelBufferRelease(*a4);
  }
  return v8;
}

- (ADLKTExecutor)initWithDescriptor:(id)a3 forLayout:(unint64_t)a4
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v58 = a3;
  kdebug_trace();
  v76.receiver = self;
  v76.super_class = (Class)ADLKTExecutor;
  v6 = [(ADLKTExecutor *)&v76 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_30;
  }
  v6->_isFirstTime = 1;
  v6->_uint64_t currentFrameIndex = 0;
  [v58 inputSizeForLayout:a4];
  v7->_inputSize.double width = v8;
  v7->_inputSize.double height = v9;
  int64_t v10 = (MTLDevice *)MTLCreateSystemDefaultDevice();
  device = v7->_device;
  v7->_device = v10;

  uint64_t v12 = [(MTLDevice *)v7->_device newCommandQueue];
  commandQueue = v7->_commandQueue;
  v7->_commandQueue = (MTLCommandQueue *)v12;

  v14 = [ADLKTOpticalFlow alloc];
  unsigned int v15 = v7->_device;
  double width = v7->_inputSize.width;
  double height = v7->_inputSize.height;
  if (v58)
  {
    [v58 opticalFlowConfig];
    if (v14)
    {
LABEL_4:
      uint64_t v18 = -[ADLKTOpticalFlow initWithDevice:inputSize:config:](v14, "initWithDevice:inputSize:config:", v15, v74, width, height);
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v75 = 0;
    memset(v74, 0, sizeof(v74));
    if (v14) {
      goto LABEL_4;
    }
  }

  uint64_t v18 = 0;
LABEL_7:
  lkt = v7->_lkt;
  v7->_lkt = (ADLKTOpticalFlow *)v18;

  uint64_t v20 = 0;
  derivitives = v7->_derivitives;
  features = v7->_features;
  pyramids = v7->_pyramids;
  char v21 = 1;
  do
  {
    char v57 = v21;
    uint64_t v22 = objc_opt_new();
    v23 = features[v20];
    features[v20] = (NSMutableArray *)v22;

    uint64_t v24 = objc_opt_new();
    v25 = derivitives[v20];
    derivitives[v20] = (NSMutableArray *)v24;

    uint64_t v26 = objc_opt_new();
    v27 = pyramids[v20];
    pyramids[v20] = (NSMutableArray *)v26;

    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    v28 = [v58 pyramidsDescriptors];
    uint64_t v29 = [v28 countByEnumeratingWithState:&v70 objects:v79 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v71;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v71 != v30) {
            objc_enumerationMutation(v28);
          }
          v32 = *(void **)(*((void *)&v70 + 1) + 8 * i);
          v33 = pyramids[v20];
          [v32 sizeForLayout:a4];
          v36 = +[ADMetalUtils textureForSize:pixelFormat:metalDevice:](ADMetalUtils, "textureForSize:pixelFormat:metalDevice:", [v32 pixelFormat], v7->_device, v34, v35);
          [(NSMutableArray *)v33 addObject:v36];
        }
        uint64_t v29 = [v28 countByEnumeratingWithState:&v70 objects:v79 count:16];
      }
      while (v29);
    }

    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    v37 = [v58 featuresDescriptors];
    uint64_t v38 = [v37 countByEnumeratingWithState:&v66 objects:v78 count:16];
    if (v38)
    {
      uint64_t v39 = *(void *)v67;
      do
      {
        for (uint64_t j = 0; j != v38; ++j)
        {
          if (*(void *)v67 != v39) {
            objc_enumerationMutation(v37);
          }
          v41 = *(void **)(*((void *)&v66 + 1) + 8 * j);
          v42 = features[v20];
          [v41 sizeForLayout:a4];
          v45 = +[ADMetalUtils textureForSize:pixelFormat:metalDevice:](ADMetalUtils, "textureForSize:pixelFormat:metalDevice:", [v41 pixelFormat], v7->_device, v43, v44);
          [(NSMutableArray *)v42 addObject:v45];
        }
        uint64_t v38 = [v37 countByEnumeratingWithState:&v66 objects:v78 count:16];
      }
      while (v38);
    }

    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    v46 = [v58 derivitivesDescriptors];
    uint64_t v47 = [v46 countByEnumeratingWithState:&v62 objects:v77 count:16];
    if (v47)
    {
      uint64_t v48 = *(void *)v63;
      do
      {
        for (uint64_t k = 0; k != v47; ++k)
        {
          if (*(void *)v63 != v48) {
            objc_enumerationMutation(v46);
          }
          v50 = *(void **)(*((void *)&v62 + 1) + 8 * k);
          v51 = derivitives[v20];
          [v50 sizeForLayout:a4];
          v54 = +[ADMetalUtils textureForSize:pixelFormat:metalDevice:](ADMetalUtils, "textureForSize:pixelFormat:metalDevice:", [v50 pixelFormat], v7->_device, v52, v53);
          [(NSMutableArray *)v51 addObject:v54];
        }
        uint64_t v47 = [v46 countByEnumeratingWithState:&v62 objects:v77 count:16];
      }
      while (v47);
    }

    char v21 = 0;
    uint64_t v20 = 1;
  }
  while ((v57 & 1) != 0);
LABEL_30:
  v55 = v7;
  kdebug_trace();

  return v55;
}

- (ADLKTExecutor)initWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v72.receiver = self;
  v72.super_class = (Class)ADLKTExecutor;
  v5 = [(ADLKTExecutor *)&v72 init];
  v6 = v5;
  if (v5)
  {
    v5->_isFirstTime = 1;
    v5->_uint64_t currentFrameIndex = 0;
    v5->_inputSize.double width = width;
    v5->_inputSize.double height = height;
    v7 = (MTLDevice *)MTLCreateSystemDefaultDevice();
    device = v6->_device;
    v6->_device = v7;

    uint64_t v9 = [(MTLDevice *)v6->_device newCommandQueue];
    commandQueue = v6->_commandQueue;
    v6->_commandQueue = (MTLCommandQueue *)v9;

    v11 = -[ADLKTOpticalFlow initWithDevice:inputSize:scales:]([ADLKTOpticalFlow alloc], "initWithDevice:inputSize:scales:", v6->_device, 5, width, height);
    lkt = v6->_lkt;
    v6->_lkt = v11;

    uint64_t v13 = 0;
    features = v6->_features;
    derivitives = v6->_derivitives;
    pyramids = v6->_pyramids;
    char v17 = 1;
    do
    {
      char v18 = v17;
      uint64_t v19 = objc_opt_new();
      uint64_t v20 = features[v13];
      features[v13] = (NSMutableArray *)v19;

      uint64_t v21 = objc_opt_new();
      uint64_t v22 = derivitives[v13];
      derivitives[v13] = (NSMutableArray *)v21;

      uint64_t v23 = objc_opt_new();
      uint64_t v24 = pyramids[v13];
      pyramids[v13] = (NSMutableArray *)v23;

      v25 = pyramids[v13];
      uint64_t v26 = +[ADMetalUtils textureForSize:pixelFormat:metalDevice:](ADMetalUtils, "textureForSize:pixelFormat:metalDevice:", 1111970369, v6->_device, width, height);
      [(NSMutableArray *)v25 addObject:v26];

      v27 = features[v13];
      v28 = +[ADMetalUtils textureForSize:pixelFormat:metalDevice:](ADMetalUtils, "textureForSize:pixelFormat:metalDevice:", 843264104, v6->_device, width, height);
      [(NSMutableArray *)v27 addObject:v28];

      uint64_t v29 = derivitives[v13];
      uint64_t v30 = +[ADMetalUtils textureForSize:pixelFormat:metalDevice:](ADMetalUtils, "textureForSize:pixelFormat:metalDevice:", 1380411457, v6->_device, width, height);
      [(NSMutableArray *)v29 addObject:v30];

      +[ADLKTOpticalFlow getNextPyramidLevelSize:](ADLKTOpticalFlow, "getNextPyramidLevelSize:", width, height);
      double v32 = v31;
      double v34 = v33;
      double v35 = pyramids[v13];
      v36 = +[ADMetalUtils textureForSize:pixelFormat:metalDevice:](ADMetalUtils, "textureForSize:pixelFormat:metalDevice:", 1111970369, v6->_device);
      [(NSMutableArray *)v35 addObject:v36];

      v37 = features[v13];
      uint64_t v38 = +[ADMetalUtils textureForSize:pixelFormat:metalDevice:](ADMetalUtils, "textureForSize:pixelFormat:metalDevice:", 843264104, v6->_device, v32, v34);
      [(NSMutableArray *)v37 addObject:v38];

      uint64_t v39 = derivitives[v13];
      v40 = +[ADMetalUtils textureForSize:pixelFormat:metalDevice:](ADMetalUtils, "textureForSize:pixelFormat:metalDevice:", 1380411457, v6->_device, v32, v34);
      [(NSMutableArray *)v39 addObject:v40];

      +[ADLKTOpticalFlow getNextPyramidLevelSize:](ADLKTOpticalFlow, "getNextPyramidLevelSize:", v32, v34);
      double v42 = v41;
      double v44 = v43;
      v45 = pyramids[v13];
      v46 = +[ADMetalUtils textureForSize:pixelFormat:metalDevice:](ADMetalUtils, "textureForSize:pixelFormat:metalDevice:", 1111970369, v6->_device);
      [(NSMutableArray *)v45 addObject:v46];

      uint64_t v47 = features[v13];
      uint64_t v48 = +[ADMetalUtils textureForSize:pixelFormat:metalDevice:](ADMetalUtils, "textureForSize:pixelFormat:metalDevice:", 843264104, v6->_device, v42, v44);
      [(NSMutableArray *)v47 addObject:v48];

      v49 = derivitives[v13];
      v50 = +[ADMetalUtils textureForSize:pixelFormat:metalDevice:](ADMetalUtils, "textureForSize:pixelFormat:metalDevice:", 1380411457, v6->_device, v42, v44);
      [(NSMutableArray *)v49 addObject:v50];

      +[ADLKTOpticalFlow getNextPyramidLevelSize:](ADLKTOpticalFlow, "getNextPyramidLevelSize:", v42, v44);
      double v52 = v51;
      double v54 = v53;
      v55 = pyramids[v13];
      v56 = +[ADMetalUtils textureForSize:pixelFormat:metalDevice:](ADMetalUtils, "textureForSize:pixelFormat:metalDevice:", 1111970369, v6->_device);
      [(NSMutableArray *)v55 addObject:v56];

      char v57 = features[v13];
      id v58 = +[ADMetalUtils textureForSize:pixelFormat:metalDevice:](ADMetalUtils, "textureForSize:pixelFormat:metalDevice:", 843264104, v6->_device, v52, v54);
      [(NSMutableArray *)v57 addObject:v58];

      v59 = derivitives[v13];
      v60 = +[ADMetalUtils textureForSize:pixelFormat:metalDevice:](ADMetalUtils, "textureForSize:pixelFormat:metalDevice:", 1380411457, v6->_device, v52, v54);
      [(NSMutableArray *)v59 addObject:v60];

      +[ADLKTOpticalFlow getNextPyramidLevelSize:](ADLKTOpticalFlow, "getNextPyramidLevelSize:", v52, v54);
      double v62 = v61;
      double v64 = v63;
      long long v65 = pyramids[v13];
      long long v66 = +[ADMetalUtils textureForSize:pixelFormat:metalDevice:](ADMetalUtils, "textureForSize:pixelFormat:metalDevice:", 1111970369, v6->_device);
      [(NSMutableArray *)v65 addObject:v66];

      long long v67 = features[v13];
      long long v68 = +[ADMetalUtils textureForSize:pixelFormat:metalDevice:](ADMetalUtils, "textureForSize:pixelFormat:metalDevice:", 843264104, v6->_device, v62, v64);
      [(NSMutableArray *)v67 addObject:v68];

      long long v69 = derivitives[v13];
      long long v70 = +[ADMetalUtils textureForSize:pixelFormat:metalDevice:](ADMetalUtils, "textureForSize:pixelFormat:metalDevice:", 1380411457, v6->_device, v62, v64);
      [(NSMutableArray *)v69 addObject:v70];

      +[ADLKTOpticalFlow getNextPyramidLevelSize:](ADLKTOpticalFlow, "getNextPyramidLevelSize:", v62, v64);
      char v17 = 0;
      uint64_t v13 = 1;
    }
    while ((v18 & 1) != 0);
  }
  return v6;
}

- (__CVBuffer)createPixelBufferForOpticalFlow
{
  double width = self->_inputSize.width;
  double height = self->_inputSize.height;
  CVPixelBufferRef pixelBufferOut = 0;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDictionaryRef BufferAttributes = (const __CFDictionary *)getBufferAttributes();
  if (CVPixelBufferCreate(v4, (unint64_t)width, (unint64_t)height, 0x32433068u, BufferAttributes, &pixelBufferOut))
  {
    return 0;
  }
  else
  {
    return pixelBufferOut;
  }
}

@end