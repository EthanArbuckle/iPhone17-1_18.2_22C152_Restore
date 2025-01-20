@interface ORBExtractionIntermediateBuffers
- (MPSKernel)mpsFindKeypoints;
- (MPSKernel)mpsHistogram;
- (MTLBuffer)compactKeypointsAndResponsesBuffer;
- (MTLBuffer)compactKeypointsBuffer;
- (MTLBuffer)countOfKeypointsPerRegion;
- (MTLBuffer)cumulativeCountOfKeypointsPerRegion;
- (MTLBuffer)descriptorBuffer;
- (MTLBuffer)histogramsBuffer;
- (MTLBuffer)keypointCountBuffer;
- (MTLBuffer)mpsRegionStrideBuffer;
- (MTLBuffer)rectRegionCount;
- (MTLBuffer)rectRegionsBuffer;
- (MTLBuffer)rectRegionsDesiredKeypoints;
- (MTLBuffer)refinedKeypointsBuffer;
- (MTLBuffer)refinementIntermediatesBuffer;
- (MTLBuffer)responseBuffer;
- (MTLBuffer)thresholdRangeBuffer;
- (MTLBuffer)thresholdsBuffer;
- (MTLBuffer)truncatedRegionsBuffer;
- (MTLTexture)boxBlurredTexture_R8Uint;
- (MTLTexture)boxBlurredTexture_RGBA8Uint;
- (MTLTexture)gaussianBlurredTexture_R8Uint;
- (MTLTexture)gaussianBlurredTexture_R8Unorm;
- (MTLTexture)gaussianBlurredTexture_RGBA8Uint;
- (MTLTexture)responseTexture;
- (MTLTexture)suppressedResponseTexture_R8Uint;
- (MTLTexture)suppressedResponseTexture_R8Unorm;
- (MTLTexture)suppressedResponseTexture_RGBA8Uint;
- (NSArray)rectRegions;
- (ORBExtractionIntermediateBuffers)initWithDevice:(id)a3 templateImage:(__CVBuffer *)a4 rectRegions:(id)a5 maxKeypointsPerRegion:(int)a6 minKeypointResponseThreshold:(float)a7;
- (int)maxKeypointsPerRegion;
- (unint64_t)maxDescriptorCount;
- (unsigned)countOfRectRegions;
- (unsigned)maxRegionHeight;
- (void)_reinitializeIntermediateBuffersWithDevice:(id)a3 templateImage:(__CVBuffer *)a4 rectRegions:(id)a5 maxKeypointsPerRegion:(int)a6 minKeypointResponseThreshold:(float)a7;
- (void)setBoxBlurredTexture_R8Uint:(id)a3;
- (void)setBoxBlurredTexture_RGBA8Uint:(id)a3;
- (void)setCompactKeypointsAndResponsesBuffer:(id)a3;
- (void)setCompactKeypointsBuffer:(id)a3;
- (void)setCountOfKeypointsPerRegion:(id)a3;
- (void)setCountOfRectRegions:(unsigned int)a3;
- (void)setCumulativeCountOfKeypointsPerRegion:(id)a3;
- (void)setDescriptorBuffer:(id)a3;
- (void)setGaussianBlurredTexture_R8Uint:(id)a3;
- (void)setGaussianBlurredTexture_R8Unorm:(id)a3;
- (void)setGaussianBlurredTexture_RGBA8Uint:(id)a3;
- (void)setHistogramsBuffer:(id)a3;
- (void)setKeypointCountBuffer:(id)a3;
- (void)setMaxDescriptorCount:(unint64_t)a3;
- (void)setMaxKeypointsPerRegion:(int)a3;
- (void)setMaxRegionHeight:(unsigned int)a3;
- (void)setMpsFindKeypoints:(id)a3;
- (void)setMpsHistogram:(id)a3;
- (void)setMpsRegionStrideBuffer:(id)a3;
- (void)setRectRegionCount:(id)a3;
- (void)setRectRegions:(id)a3;
- (void)setRectRegionsBuffer:(id)a3;
- (void)setRectRegionsDesiredKeypoints:(id)a3;
- (void)setRefinedKeypointsBuffer:(id)a3;
- (void)setRefinementIntermediatesBuffer:(id)a3;
- (void)setResponseBuffer:(id)a3;
- (void)setResponseTexture:(id)a3;
- (void)setSuppressedResponseTexture_R8Uint:(id)a3;
- (void)setSuppressedResponseTexture_R8Unorm:(id)a3;
- (void)setSuppressedResponseTexture_RGBA8Uint:(id)a3;
- (void)setThresholdRangeBuffer:(id)a3;
- (void)setThresholdsBuffer:(id)a3;
- (void)setTruncatedRegionsBuffer:(id)a3;
@end

@implementation ORBExtractionIntermediateBuffers

- (void)_reinitializeIntermediateBuffersWithDevice:(id)a3 templateImage:(__CVBuffer *)a4 rectRegions:(id)a5 maxKeypointsPerRegion:(int)a6 minKeypointResponseThreshold:(float)a7
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  id v12 = a3;
  CGRect CleanRect = CVImageBufferGetCleanRect(a4);
  double width = CleanRect.size.width;
  double height = CleanRect.size.height;
  if (CVPixelBufferIsPlanar(a4))
  {
    size_t v15 = (unint64_t)width;
    size_t v16 = (unint64_t)height;
    size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a4, 0);
  }
  else
  {
    size_t v15 = CVPixelBufferGetWidth(a4);
    size_t v16 = CVPixelBufferGetHeight(a4);
    size_t BytesPerRowOfPlane = (v15 + 15) & 0xFFFFFFFFFFFFFFF0;
  }
  v18 = (NSArray *)[v11 copy];
  rectRegions = self->_rectRegions;
  self->_rectRegions = v18;

  v20 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:13 width:v15 height:v16 mipmapped:0];
  objc_msgSend(v20, "setUsage:", objc_msgSend(v20, "usage") | 0x13);
  [v20 setStorageMode:0];
  v21 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:73 width:(v15 + 3) >> 2 height:v16 mipmapped:0];
  objc_msgSend(v21, "setUsage:", objc_msgSend(v21, "usage") | 0x13);
  size_t v22 = v16 * BytesPerRowOfPlane;
  v23 = (void *)[v12 newBufferWithLength:v16 * BytesPerRowOfPlane options:0];
  v24 = (MTLTexture *)[v23 newTextureWithDescriptor:v21 offset:0 bytesPerRow:BytesPerRowOfPlane];
  boxBlurredTexture_RGBA8Uint = self->_boxBlurredTexture_RGBA8Uint;
  self->_boxBlurredTexture_RGBA8Uint = v24;

  v26 = (MTLTexture *)[v23 newTextureWithDescriptor:v20 offset:0 bytesPerRow:BytesPerRowOfPlane];
  boxBlurredTexture_R8Uint = self->_boxBlurredTexture_R8Uint;
  self->_boxBlurredTexture_R8Uint = v26;

  v28 = (void *)[v12 newBufferWithLength:v22 options:0];
  v29 = (MTLTexture *)[v28 newTextureWithDescriptor:v21 offset:0 bytesPerRow:BytesPerRowOfPlane];
  gaussianBlurredTexture_RGBA8Uint = self->_gaussianBlurredTexture_RGBA8Uint;
  self->_gaussianBlurredTexture_RGBA8Uint = v29;

  v31 = (MTLTexture *)[v28 newTextureWithDescriptor:v20 offset:0 bytesPerRow:BytesPerRowOfPlane];
  gaussianBlurredTexture_R8Uint = self->_gaussianBlurredTexture_R8Uint;
  self->_gaussianBlurredTexture_R8Uint = v31;

  v33 = (MTLTexture *)[(MTLTexture *)self->_gaussianBlurredTexture_R8Uint newTextureViewWithPixelFormat:10];
  gaussianBlurredTexture_R8Unorm = self->_gaussianBlurredTexture_R8Unorm;
  self->_gaussianBlurredTexture_R8Unorm = v33;

  v35 = (MTLTexture *)[v12 newTextureWithDescriptor:v21];
  responseTexture = self->_responseTexture;
  self->_responseTexture = v35;

  v37 = (void *)[v12 newBufferWithLength:v22 options:0];
  v38 = (MTLTexture *)[v37 newTextureWithDescriptor:v21 offset:0 bytesPerRow:BytesPerRowOfPlane];
  suppressedResponseTexture_RGBA8Uint = self->_suppressedResponseTexture_RGBA8Uint;
  self->_suppressedResponseTexture_RGBA8Uint = v38;

  v40 = (MTLTexture *)[v37 newTextureWithDescriptor:v20 offset:0 bytesPerRow:BytesPerRowOfPlane];
  suppressedResponseTexture_R8Uint = self->_suppressedResponseTexture_R8Uint;
  self->_suppressedResponseTexture_R8Uint = v40;

  v42 = (MTLTexture *)[(MTLTexture *)self->_suppressedResponseTexture_R8Uint newTextureViewWithPixelFormat:10];
  suppressedResponseTexture_R8Unorm = self->_suppressedResponseTexture_R8Unorm;
  self->_suppressedResponseTexture_R8Unorm = v42;

  uint64_t v77 = 0;
  unint64_t v44 = objc_msgSend(v11, "count", 0) * 2 * a6;
  v45 = +[MetalFAST9BRIEF _createMTLBufferFromRects:v11 device:v12 storageMode:0 maxRectWidth:&v76 maxRectHeight:&v77];
  rectRegionsBuffer = self->_rectRegionsBuffer;
  self->_rectRegionsBuffer = v45;

  int v82 = a6;
  uint64_t v83 = 0;
  int v84 = 0;
  v47 = (MTLBuffer *)[v12 newBufferWithBytes:&v82 length:16 options:0];
  rectRegionsDesiredKeypoints = self->_rectRegionsDesiredKeypoints;
  self->_rectRegionsDesiredKeypoints = v47;

  self->_maxDescriptorCount = v44;
  self->_maxRegionHeight = v77;
  long long v81 = xmmword_1DD511DD0;
  v49 = (MTLBuffer *)[v12 newBufferWithBytes:&v81 length:16 options:0];
  thresholdRangeBuffer = self->_thresholdRangeBuffer;
  self->_thresholdRangeBuffer = v49;

  unsigned int v51 = [v11 count];
  self->_countOfRectRegions = v51;
  unsigned int v78 = v51;
  uint64_t v79 = 0;
  int v80 = 0;
  v52 = (MTLBuffer *)[v12 newBufferWithBytes:&v78 length:16 options:0];
  rectRegionCount = self->_rectRegionCount;
  self->_rectRegionCount = v52;

  v54 = (MTLBuffer *)[v12 newBufferWithLength:4 * (self->_countOfRectRegions << 8) options:0];
  histogramsBuffer = self->_histogramsBuffer;
  self->_histogramsBuffer = v54;

  v56 = (MTLBuffer *)[v12 newBufferWithLength:4 * self->_countOfRectRegions options:0];
  thresholdsBuffer = self->_thresholdsBuffer;
  self->_thresholdsBuffer = v56;

  v58 = (MTLBuffer *)[v12 newBufferWithLength:4 * (self->_countOfRectRegions + 1) options:0];
  countOfKeypointsPerRegion = self->_countOfKeypointsPerRegion;
  self->_countOfKeypointsPerRegion = v58;

  v60 = (MTLBuffer *)[v12 newBufferWithLength:4 * (self->_countOfRectRegions + 1) options:0];
  cumulativeCountOfKeypointsPerRegion = self->_cumulativeCountOfKeypointsPerRegion;
  self->_cumulativeCountOfKeypointsPerRegion = v60;

  v62 = (MTLBuffer *)[v12 newBufferWithLength:4 options:0];
  truncatedRegionsBuffer = self->_truncatedRegionsBuffer;
  self->_truncatedRegionsBuffer = v62;

  v64 = (MTLBuffer *)[v12 newBufferWithLength:8 * v44 options:0];
  compactKeypointsBuffer = self->_compactKeypointsBuffer;
  self->_compactKeypointsBuffer = v64;

  v66 = (MTLBuffer *)[v12 newBufferWithLength:8 * v44 options:0];
  refinedKeypointsBuffer = self->_refinedKeypointsBuffer;
  self->_refinedKeypointsBuffer = v66;

  v68 = (MTLBuffer *)[v12 newBufferWithLength:836 * v44 options:0];
  refinementIntermediatesBuffer = self->_refinementIntermediatesBuffer;
  self->_refinementIntermediatesBuffer = v68;

  v70 = (MTLBuffer *)[v12 newBufferWithLength:32 options:0];
  keypointCountBuffer = self->_keypointCountBuffer;
  self->_keypointCountBuffer = v70;

  v72 = (MTLBuffer *)[v12 newBufferWithLength:4 * v44 options:0];
  responseBuffer = self->_responseBuffer;
  self->_responseBuffer = v72;

  v74 = (MTLBuffer *)[v12 newBufferWithLength:16 * v44 options:0];
  descriptorBuffer = self->_descriptorBuffer;
  self->_descriptorBuffer = v74;
}

- (ORBExtractionIntermediateBuffers)initWithDevice:(id)a3 templateImage:(__CVBuffer *)a4 rectRegions:(id)a5 maxKeypointsPerRegion:(int)a6 minKeypointResponseThreshold:(float)a7
{
  uint64_t v8 = *(void *)&a6;
  id v12 = a3;
  id v13 = a5;
  v20.receiver = self;
  v20.super_class = (Class)ORBExtractionIntermediateBuffers;
  v14 = [(ORBExtractionIntermediateBuffers *)&v20 init];
  size_t v16 = v14;
  if (v14) {
    BOOL v17 = a4 == 0;
  }
  else {
    BOOL v17 = 1;
  }
  if (!v17 && v13 != 0)
  {
    *(float *)&double v15 = a7;
    [(ORBExtractionIntermediateBuffers *)v14 _reinitializeIntermediateBuffersWithDevice:v12 templateImage:a4 rectRegions:v13 maxKeypointsPerRegion:v8 minKeypointResponseThreshold:v15];
  }

  return v16;
}

- (MPSKernel)mpsFindKeypoints
{
  return (MPSKernel *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMpsFindKeypoints:(id)a3
{
}

- (MPSKernel)mpsHistogram
{
  return (MPSKernel *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMpsHistogram:(id)a3
{
}

- (MTLBuffer)rectRegionsBuffer
{
  return (MTLBuffer *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRectRegionsBuffer:(id)a3
{
}

- (MTLBuffer)rectRegionCount
{
  return (MTLBuffer *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRectRegionCount:(id)a3
{
}

- (MTLBuffer)rectRegionsDesiredKeypoints
{
  return (MTLBuffer *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRectRegionsDesiredKeypoints:(id)a3
{
}

- (MTLBuffer)thresholdRangeBuffer
{
  return (MTLBuffer *)objc_getProperty(self, a2, 64, 1);
}

- (void)setThresholdRangeBuffer:(id)a3
{
}

- (NSArray)rectRegions
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setRectRegions:(id)a3
{
}

- (int)maxKeypointsPerRegion
{
  return self->_maxKeypointsPerRegion;
}

- (void)setMaxKeypointsPerRegion:(int)a3
{
  self->_maxKeypointsPerRegion = a3;
}

- (MTLTexture)gaussianBlurredTexture_RGBA8Uint
{
  return (MTLTexture *)objc_getProperty(self, a2, 80, 1);
}

- (void)setGaussianBlurredTexture_RGBA8Uint:(id)a3
{
}

- (MTLTexture)gaussianBlurredTexture_R8Uint
{
  return (MTLTexture *)objc_getProperty(self, a2, 88, 1);
}

- (void)setGaussianBlurredTexture_R8Uint:(id)a3
{
}

- (MTLTexture)gaussianBlurredTexture_R8Unorm
{
  return (MTLTexture *)objc_getProperty(self, a2, 96, 1);
}

- (void)setGaussianBlurredTexture_R8Unorm:(id)a3
{
}

- (MTLTexture)responseTexture
{
  return (MTLTexture *)objc_getProperty(self, a2, 104, 1);
}

- (void)setResponseTexture:(id)a3
{
}

- (MTLTexture)suppressedResponseTexture_RGBA8Uint
{
  return (MTLTexture *)objc_getProperty(self, a2, 112, 1);
}

- (void)setSuppressedResponseTexture_RGBA8Uint:(id)a3
{
}

- (MTLTexture)suppressedResponseTexture_R8Uint
{
  return (MTLTexture *)objc_getProperty(self, a2, 120, 1);
}

- (void)setSuppressedResponseTexture_R8Uint:(id)a3
{
}

- (MTLTexture)suppressedResponseTexture_R8Unorm
{
  return (MTLTexture *)objc_getProperty(self, a2, 128, 1);
}

- (void)setSuppressedResponseTexture_R8Unorm:(id)a3
{
}

- (MTLTexture)boxBlurredTexture_R8Uint
{
  return (MTLTexture *)objc_getProperty(self, a2, 136, 1);
}

- (void)setBoxBlurredTexture_R8Uint:(id)a3
{
}

- (MTLTexture)boxBlurredTexture_RGBA8Uint
{
  return (MTLTexture *)objc_getProperty(self, a2, 144, 1);
}

- (void)setBoxBlurredTexture_RGBA8Uint:(id)a3
{
}

- (MTLBuffer)thresholdsBuffer
{
  return (MTLBuffer *)objc_getProperty(self, a2, 152, 1);
}

- (void)setThresholdsBuffer:(id)a3
{
}

- (MTLBuffer)histogramsBuffer
{
  return (MTLBuffer *)objc_getProperty(self, a2, 160, 1);
}

- (void)setHistogramsBuffer:(id)a3
{
}

- (MTLBuffer)countOfKeypointsPerRegion
{
  return (MTLBuffer *)objc_getProperty(self, a2, 168, 1);
}

- (void)setCountOfKeypointsPerRegion:(id)a3
{
}

- (MTLBuffer)cumulativeCountOfKeypointsPerRegion
{
  return (MTLBuffer *)objc_getProperty(self, a2, 176, 1);
}

- (void)setCumulativeCountOfKeypointsPerRegion:(id)a3
{
}

- (MTLBuffer)truncatedRegionsBuffer
{
  return (MTLBuffer *)objc_getProperty(self, a2, 184, 1);
}

- (void)setTruncatedRegionsBuffer:(id)a3
{
}

- (MTLBuffer)compactKeypointsBuffer
{
  return (MTLBuffer *)objc_getProperty(self, a2, 192, 1);
}

- (void)setCompactKeypointsBuffer:(id)a3
{
}

- (MTLBuffer)refinedKeypointsBuffer
{
  return (MTLBuffer *)objc_getProperty(self, a2, 200, 1);
}

- (void)setRefinedKeypointsBuffer:(id)a3
{
}

- (MTLBuffer)compactKeypointsAndResponsesBuffer
{
  return (MTLBuffer *)objc_getProperty(self, a2, 208, 1);
}

- (void)setCompactKeypointsAndResponsesBuffer:(id)a3
{
}

- (MTLBuffer)responseBuffer
{
  return (MTLBuffer *)objc_getProperty(self, a2, 216, 1);
}

- (void)setResponseBuffer:(id)a3
{
}

- (MTLBuffer)descriptorBuffer
{
  return (MTLBuffer *)objc_getProperty(self, a2, 224, 1);
}

- (void)setDescriptorBuffer:(id)a3
{
}

- (MTLBuffer)keypointCountBuffer
{
  return (MTLBuffer *)objc_getProperty(self, a2, 232, 1);
}

- (void)setKeypointCountBuffer:(id)a3
{
}

- (MTLBuffer)mpsRegionStrideBuffer
{
  return (MTLBuffer *)objc_getProperty(self, a2, 240, 1);
}

- (void)setMpsRegionStrideBuffer:(id)a3
{
}

- (MTLBuffer)refinementIntermediatesBuffer
{
  return (MTLBuffer *)objc_getProperty(self, a2, 248, 1);
}

- (void)setRefinementIntermediatesBuffer:(id)a3
{
}

- (unsigned)maxRegionHeight
{
  return self->_maxRegionHeight;
}

- (void)setMaxRegionHeight:(unsigned int)a3
{
  self->_maxRegionHeight = a3;
}

- (unsigned)countOfRectRegions
{
  return self->_countOfRectRegions;
}

- (void)setCountOfRectRegions:(unsigned int)a3
{
  self->_countOfRectRegions = a3;
}

- (unint64_t)maxDescriptorCount
{
  return self->_maxDescriptorCount;
}

- (void)setMaxDescriptorCount:(unint64_t)a3
{
  self->_maxDescriptorCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refinementIntermediatesBuffer, 0);
  objc_storeStrong((id *)&self->_mpsRegionStrideBuffer, 0);
  objc_storeStrong((id *)&self->_keypointCountBuffer, 0);
  objc_storeStrong((id *)&self->_descriptorBuffer, 0);
  objc_storeStrong((id *)&self->_responseBuffer, 0);
  objc_storeStrong((id *)&self->_compactKeypointsAndResponsesBuffer, 0);
  objc_storeStrong((id *)&self->_refinedKeypointsBuffer, 0);
  objc_storeStrong((id *)&self->_compactKeypointsBuffer, 0);
  objc_storeStrong((id *)&self->_truncatedRegionsBuffer, 0);
  objc_storeStrong((id *)&self->_cumulativeCountOfKeypointsPerRegion, 0);
  objc_storeStrong((id *)&self->_countOfKeypointsPerRegion, 0);
  objc_storeStrong((id *)&self->_histogramsBuffer, 0);
  objc_storeStrong((id *)&self->_thresholdsBuffer, 0);
  objc_storeStrong((id *)&self->_boxBlurredTexture_RGBA8Uint, 0);
  objc_storeStrong((id *)&self->_boxBlurredTexture_R8Uint, 0);
  objc_storeStrong((id *)&self->_suppressedResponseTexture_R8Unorm, 0);
  objc_storeStrong((id *)&self->_suppressedResponseTexture_R8Uint, 0);
  objc_storeStrong((id *)&self->_suppressedResponseTexture_RGBA8Uint, 0);
  objc_storeStrong((id *)&self->_responseTexture, 0);
  objc_storeStrong((id *)&self->_gaussianBlurredTexture_R8Unorm, 0);
  objc_storeStrong((id *)&self->_gaussianBlurredTexture_R8Uint, 0);
  objc_storeStrong((id *)&self->_gaussianBlurredTexture_RGBA8Uint, 0);
  objc_storeStrong((id *)&self->_rectRegions, 0);
  objc_storeStrong((id *)&self->_thresholdRangeBuffer, 0);
  objc_storeStrong((id *)&self->_rectRegionsDesiredKeypoints, 0);
  objc_storeStrong((id *)&self->_rectRegionCount, 0);
  objc_storeStrong((id *)&self->_rectRegionsBuffer, 0);
  objc_storeStrong((id *)&self->_mpsHistogram, 0);
  objc_storeStrong((id *)&self->_mpsFindKeypoints, 0);
}

@end