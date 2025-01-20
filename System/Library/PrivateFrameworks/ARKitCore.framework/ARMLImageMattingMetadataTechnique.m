@interface ARMLImageMattingMetadataTechnique
- (ARMLImageMattingMetadataTechnique)init;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldOperateOnHighResolutionImages;
- (double)requiredTimeInterval;
- (id)_generateMattingMetadata:(id)a3;
- (id)processData:(id)a3;
- (id)resultDataClasses;
- (void)_processDataInBackgound:(id)a3;
- (void)dealloc;
- (void)prepare:(BOOL)a3;
- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4;
- (void)setShouldOperateOnHighResolutionImages:(BOOL)a3;
@end

@implementation ARMLImageMattingMetadataTechnique

- (ARMLImageMattingMetadataTechnique)init
{
  v7.receiver = self;
  v7.super_class = (Class)ARMLImageMattingMetadataTechnique;
  v2 = [(ARImageBasedTechnique *)&v7 init];
  if (v2)
  {
    int v3 = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.matting.doubleMLResolutionForIPad"];
    if (v3) {
      LOBYTE(v3) = ARDeviceIsiPad();
    }
    v2->_enableDoubleMLResolutionForIPad = v3;
    uint64_t v4 = ARCreateFixedPriorityDispatchQueue("com.apple.arkit.mlmattingmetadata");
    processingQueue = v2->_processingQueue;
    v2->_processingQueue = (OS_dispatch_queue *)v4;

    v2->_shouldOperateOnHighResolutionImages = 0;
  }
  return v2;
}

- (void)dealloc
{
  cvImageFormatRef = self->_cvImageFormatRef;
  if (cvImageFormatRef) {
    MEMORY[0x1BA9C6870](cvImageFormatRef, a2);
  }
  bgraMattingPixelBufferPool = self->_bgraMattingPixelBufferPool;
  if (bgraMattingPixelBufferPool)
  {
    CVPixelBufferPoolRelease(bgraMattingPixelBufferPool);
    self->_bgraMattingPixelBufferPool = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)ARMLImageMattingMetadataTechnique;
  [(ARMLImageMattingMetadataTechnique *)&v5 dealloc];
}

- (void)prepare:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ARMLImageMattingMetadataTechnique;
  -[ARTechnique prepare:](&v5, sel_prepare_);
  self->_deterministic = a3;
}

- (double)requiredTimeInterval
{
  return 0.003;
}

- (id)resultDataClasses
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 setWithObject:v3];
}

- (id)processData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v6 = v4;
  objc_super v7 = v6;
  if (isKindOfClass)
  {
    v8 = [v6 originalImageData];
    int v9 = [(ARMLImageMattingMetadataTechnique *)self shouldOperateOnHighResolutionImages];
    if (v9 != [v8 isHighResolution])
    {
LABEL_3:
      id v10 = v7;
LABEL_11:

      goto LABEL_12;
    }
    if ([v8 cameraPosition] != 2)
    {
      v11 = [v8 cameraType];
      if (ARIsSupportedAVCaptureDeviceTypeForRearCameraBackdrop(v11))
      {
      }
      else
      {
        v12 = [v8 cameraType];
        char v13 = [v12 isEqualToString:*MEMORY[0x1E4F15820]];

        if ((v13 & 1) == 0) {
          goto LABEL_3;
        }
      }
    }
    v23.receiver = self;
    v23.super_class = (Class)ARMLImageMattingMetadataTechnique;
    id v14 = [(ARImageBasedTechnique *)&v23 processData:v7];
    objc_initWeak(&location, self);
    processingQueue = self->_processingQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__ARMLImageMattingMetadataTechnique_processData___block_invoke;
    block[3] = &unk_1E6185200;
    objc_copyWeak(&v21, &location);
    id v16 = v7;
    id v20 = v16;
    dispatch_async(processingQueue, block);
    if (self->_deterministic) {
      dispatch_sync((dispatch_queue_t)self->_processingQueue, &__block_literal_global_2);
    }
    id v17 = v16;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
    goto LABEL_11;
  }
LABEL_12:

  return v7;
}

void __49__ARMLImageMattingMetadataTechnique_processData___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _processDataInBackgound:*(void *)(a1 + 32)];
}

- (void)_processDataInBackgound:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processingQueue);
  [v7 timestamp];
  kdebug_trace();
  id v4 = [(ARMLImageMattingMetadataTechnique *)self _generateMattingMetadata:v7];
  objc_super v5 = objc_opt_new();
  id v6 = v5;
  if (v4) {
    [v5 addObject:v4];
  }
  [v7 timestamp];
  -[ARImageBasedTechnique pushResultData:forTimestamp:](self, "pushResultData:forTimestamp:", v6);
  [v7 timestamp];
  kdebug_trace();
}

- (id)_generateMattingMetadata:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 originalImageData];
  id v6 = [[ARModifiedImageData alloc] initWithImageData:v5];
  -[ARImageData setPixelBuffer:](v6, "setPixelBuffer:", [v4 pixelBuffer]);
  [(ARImageData *)v6 imageResolution];
  double v8 = v7;
  double v10 = v9;
  [v5 imageResolution];
  float v12 = v11;
  *(float *)&double v13 = v13;
  float v14 = v8 / v12;
  float v15 = *(float *)&v13 * v14;
  double v16 = (double)(unint64_t)v15;
  if (v10 == v16)
  {
    double v17 = v8 + v8;
    if (self->_enableDoubleMLResolutionForIPad) {
      double v18 = v10 + v10;
    }
    else {
      double v18 = v10;
    }
    if (self->_enableDoubleMLResolutionForIPad) {
      double v8 = v8 + v8;
    }
  }
  else
  {
    float v19 = v12 * v14;
    double v20 = v19;
    double v21 = v15;
    double v17 = (float)(v19 + v19);
    double v22 = (float)(v15 + v15);
    if (self->_enableDoubleMLResolutionForIPad) {
      double v18 = v22;
    }
    else {
      double v18 = v21;
    }
    if (self->_enableDoubleMLResolutionForIPad) {
      double v8 = v17;
    }
    else {
      double v8 = v20;
    }
  }
  mattingImageScalingTechnique = self->_mattingImageScalingTechnique;
  if (!mattingImageScalingTechnique
    || (([(ARImageScalingTechnique *)mattingImageScalingTechnique scaledSize], v25 == v8)
      ? (BOOL v26 = v24 == v18)
      : (BOOL v26 = 0),
        !v26))
  {
    v27 = -[ARImageScalingTechnique initWithScaledSize:]([ARImageScalingTechnique alloc], "initWithScaledSize:", v8, v18);
    v28 = self->_mattingImageScalingTechnique;
    self->_mattingImageScalingTechnique = v27;

    [(ARImageScalingTechnique *)self->_mattingImageScalingTechnique setConversionPixelFormatType:1111970369];
  }
  if (v10 == v16 && !self->_enableDoubleMLResolutionForIPad)
  {
    v29 = v6;
  }
  else
  {
    [v4 timestamp];
    [v5 imageResolution];
    [v5 imageResolution];
    kdebug_trace();
    v29 = [(ARImageScalingTechnique *)self->_mattingImageScalingTechnique processData:v5];
    [v5 timestamp];
    kdebug_trace();
  }
  v30 = [ARMattingImageMetaData alloc];
  [v4 timestamp];
  v32 = -[ARMattingImageMetaData initWithTimestamp:downSampledImageBuffer:mattingScaleImageBuffer:](v30, "initWithTimestamp:downSampledImageBuffer:mattingScaleImageBuffer:", [v4 pixelBuffer], -[ARImageData pixelBuffer](v29, "pixelBuffer"), v31);

  return v32;
}

- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4
{
  id v6 = a4;
  int v7 = [(ARMLImageMattingMetadataTechnique *)self shouldOperateOnHighResolutionImages];
  double v8 = [v6 imageData];
  int v9 = [v8 isHighResolution];

  if (v7 == v9)
  {
    v13.receiver = self;
    v13.super_class = (Class)ARMLImageMattingMetadataTechnique;
    [(ARImageBasedTechnique *)&v13 requestResultDataAtTimestamp:v6 context:a3];
  }
  else
  {
    double v10 = [(ARTechnique *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      float v12 = [(ARTechnique *)self delegate];
      [v12 technique:self didOutputResultData:MEMORY[0x1E4F1CBF0] timestamp:v6 context:a3];
    }
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  v7.receiver = self;
  v7.super_class = (Class)ARMLImageMattingMetadataTechnique;
  if ([(ARTechnique *)&v7 isEqual:v4]) {
    BOOL v5 = self->_shouldOperateOnHighResolutionImages == v4[129];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)shouldOperateOnHighResolutionImages
{
  return self->_shouldOperateOnHighResolutionImages;
}

- (void)setShouldOperateOnHighResolutionImages:(BOOL)a3
{
  self->_shouldOperateOnHighResolutionImages = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_mattingImageScalingTechnique, 0);
}

@end