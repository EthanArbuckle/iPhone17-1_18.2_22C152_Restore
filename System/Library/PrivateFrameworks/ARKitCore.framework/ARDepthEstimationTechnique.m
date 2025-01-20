@interface ARDepthEstimationTechnique
- (ARDepthEstimationTechnique)init;
- (double)requiredTimeInterval;
- (id)_fullDescription;
- (id)createResultDataFromTensors:(id *)a3 numberOfOutputTensors:(unint64_t)a4 imageDataForNeuralNetwork:(id)a5 inputImageData:(id)a6 rotationNeeded:(int64_t)a7 regionOfInterest:(CGSize)a8;
- (id)resultDataClasses;
- (int64_t)depthDataSource;
- (int64_t)numberOfInputChannelsToExpectInNetwork;
- (void)_endLoadingMLModelSignpost;
- (void)_endMLCreateResultSignpostWithTimestamp:(double)a3;
- (void)_endMLProcessingSignpostWithTimestamp:(double)a3;
- (void)_endMLRunNetworkSignpostWithTimestamp:(double)a3;
- (void)_startLoadingMLModelSignpost;
- (void)_startMLCreateResultSignpostWithTimestamp:(double)a3 orientation:(int64_t)a4 outputSize:(CGSize)a5;
- (void)_startMLProcessingSignpostWithTimestamp:(double)a3;
- (void)_startMLRunNetworkSignpostWithTimestamp:(double)a3;
- (void)dealloc;
@end

@implementation ARDepthEstimationTechnique

- (ARDepthEstimationTechnique)init
{
  v27[1] = *MEMORY[0x1E4F143B8];
  v3 = ARCreateFixedPriorityDispatchQueue("com.apple.arkit.depthestimationtechnique");
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F4D828]) initWithInputPrioritization:1];
  v5 = [v4 inferenceDescriptor];
  v6 = [v5 colorInput];
  v7 = [v6 name];

  v8 = [v4 inferenceDescriptor];
  v9 = [v8 depthOutput];
  v10 = [v9 name];

  v11 = [v4 inferenceDescriptor];
  v12 = [v11 networkURL];

  v13 = [v4 inferenceDescriptor];
  v14 = [v13 colorInput];
  v15 = [v14 imageDescriptor];
  [v15 sizeForLayout:1];
  double v17 = v16;
  double v19 = v18;

  v27[0] = v7;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  v26 = v10;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
  v22 = [v12 path];
  v25.receiver = self;
  v25.super_class = (Class)ARDepthEstimationTechnique;
  v23 = -[ARMLImageProcessingTechnique initWithDispatchQueue:inputTensorNames:outputTensorNames:networkInputScaleBeforeRotation:networkFilePath:](&v25, sel_initWithDispatchQueue_inputTensorNames_outputTensorNames_networkInputScaleBeforeRotation_networkFilePath_, v3, v20, v21, v22, v17, v19);

  if (v23)
  {
    v23->_outputPixelBufferPool = 0;
    v23->_scaledOutputPixelBufferPool = 0;
    v23->_alphaChannelPixelBufferPool = 0;
  }

  return v23;
}

- (void)dealloc
{
  outputPixelBufferPool = self->_outputPixelBufferPool;
  if (outputPixelBufferPool)
  {
    CVPixelBufferPoolRelease(outputPixelBufferPool);
    self->_outputPixelBufferPool = 0;
  }
  scaledOutputPixelBufferPool = self->_scaledOutputPixelBufferPool;
  if (scaledOutputPixelBufferPool)
  {
    CVPixelBufferPoolRelease(scaledOutputPixelBufferPool);
    self->_scaledOutputPixelBufferPool = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)ARDepthEstimationTechnique;
  [(ARMLImageProcessingTechnique *)&v5 dealloc];
}

- (int64_t)depthDataSource
{
  return 1;
}

- (double)requiredTimeInterval
{
  return 0.016;
}

- (id)resultDataClasses
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 setWithObject:v3];
}

- (id)_fullDescription
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28E78];
  v16.receiver = self;
  v16.super_class = (Class)ARDepthEstimationTechnique;
  v4 = [(ARImageBasedTechnique *)&v16 _fullDescription];
  objc_super v5 = [v3 stringWithFormat:@"%@\n", v4];

  v6 = [(ARImageRotationTechnique *)self->_rotationTechnique _fullDescription];
  v7 = [v6 description];
  v8 = [v7 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t\t"];
  [v5 appendFormat:@"\tRotation Technique: %@\n\n", v8];

  v9 = CVPixelBufferPoolGetPixelBufferAttributes(self->_outputPixelBufferPool);
  v10 = [v9 description];
  v11 = [v10 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t\t"];
  [v5 appendFormat:@"\tOutputPixelBufferPool attr: %@\n", v11];

  v12 = CVPixelBufferPoolGetPixelBufferAttributes(self->_scaledOutputPixelBufferPool);
  v13 = [v12 description];
  v14 = [v13 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t\t"];
  [v5 appendFormat:@"\tScaledOutputPixelBufferPool attr: %@\n", v14];

  return v5;
}

- (int64_t)numberOfInputChannelsToExpectInNetwork
{
  return 3;
}

- (id)createResultDataFromTensors:(id *)a3 numberOfOutputTensors:(unint64_t)a4 imageDataForNeuralNetwork:(id)a5 inputImageData:(id)a6 rotationNeeded:(int64_t)a7 regionOfInterest:(CGSize)a8
{
  double height = a8.height;
  double width = a8.width;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v13 = a6;
  var0 = (float *)a3->var0;
  unint64_t v15 = a3->var3[0];
  unint64_t var4 = a3->var4;
  unint64_t var5 = a3->var5;
  double v18 = ARCreateCVPixelBufferFromPool(&self->_outputPixelBufferPool, 1717855600, self, @"Estimated Depth Map", (double)var4, (double)var5);
  double v19 = v18;
  if (!v18) {
    goto LABEL_31;
  }
  CVPixelBufferLockBaseAddress(v18, 0);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(v19);
  BaseAddress = (float *)CVPixelBufferGetBaseAddress(v19);
  [v13 imageResolution];
  double v23 = v22;
  [v13 cameraIntrinsics];
  if (a7 == -90 || a7 == 90) {
    double v26 = height;
  }
  else {
    double v26 = width;
  }
  if (var5)
  {
    uint64_t v27 = 0;
    float v28 = v26;
    float v29 = v28 / v23;
    float v30 = (float)(v29 * v24) / 191.40249;
    do
    {
      unint64_t v31 = var4;
      v32 = BaseAddress;
      for (i = var0; v31; --v31)
      {
        float v34 = *i++;
        *v32++ = v34 * v30;
      }
      ++v27;
      var0 = (float *)((char *)var0 + v15);
      BaseAddress = (float *)((char *)BaseAddress + BytesPerRow);
    }
    while (v27 != var5);
  }
  CVPixelBufferUnlockBaseAddress(v19, 0);
  if (var4 == (int)width && var5 == (int)height)
  {
    v36 = v19;
    goto LABEL_25;
  }
  v36 = ARCreateCVPixelBufferFromPool(&self->_scaledOutputPixelBufferPool, 1717855600, self, @"Scaled Depth", width, height);
  if (!v36)
  {
    CVPixelBufferRelease(v19);
LABEL_31:
    v48 = 0;
    goto LABEL_32;
  }
  int v37 = ARResizeBufferWithNearestNeighbors(v19, v36, 4uLL);
  if (v37)
  {
    if (_ARLogTechnique(void)::onceToken != -1) {
      dispatch_once(&_ARLogTechnique(void)::onceToken, &__block_literal_global_86);
    }
    v38 = (id)_ARLogTechnique(void)::logObj;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = (objc_class *)objc_opt_class();
      v40 = NSStringFromClass(v39);
      int v50 = 138543874;
      v51 = v40;
      __int16 v52 = 2048;
      v53 = self;
      __int16 v54 = 1024;
      int v55 = v37;
      _os_log_impl(&dword_1B88A2000, v38, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to resample pixel buffer: %i", (uint8_t *)&v50, 0x1Cu);
    }
    CVPixelBufferRelease(v19);
    CVPixelBufferRelease(v36);
    goto LABEL_31;
  }
  CVPixelBufferRelease(v19);
LABEL_25:
  v41 = objc_opt_new();
  [v41 setPixelBuffer:v36];
  CVPixelBufferRelease(v36);
  rotationTechnique = self->_rotationTechnique;
  if (!rotationTechnique
    || [(ARImageRotationTechnique *)rotationTechnique rotationAngle] != a7
    || [(ARImageRotationTechnique *)self->_rotationTechnique mirrorMode])
  {
    v43 = [[ARImageRotationTechnique alloc] initWithRotation:a7 mirror:0];
    v44 = self->_rotationTechnique;
    self->_rotationTechnique = v43;
  }
  v45 = [(ARImageRotationTechnique *)self->_rotationTechnique processData:v41];
  v46 = [ARMLDepthData alloc];
  [v13 timestamp];
  v48 = -[ARMLDepthData initWithTimestamp:depthBuffer:source:](v46, "initWithTimestamp:depthBuffer:source:", [v45 pixelBuffer], 1, v47);

LABEL_32:
  return v48;
}

- (void)_startLoadingMLModelSignpost
{
}

- (void)_endLoadingMLModelSignpost
{
}

- (void)_startMLProcessingSignpostWithTimestamp:(double)a3
{
}

- (void)_endMLProcessingSignpostWithTimestamp:(double)a3
{
}

- (void)_startMLRunNetworkSignpostWithTimestamp:(double)a3
{
}

- (void)_endMLRunNetworkSignpostWithTimestamp:(double)a3
{
}

- (void)_startMLCreateResultSignpostWithTimestamp:(double)a3 orientation:(int64_t)a4 outputSize:(CGSize)a5
{
}

- (void)_endMLCreateResultSignpostWithTimestamp:(double)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCroppingTechnique, 0);
  objc_storeStrong((id *)&self->_rotationTechnique, 0);
}

@end