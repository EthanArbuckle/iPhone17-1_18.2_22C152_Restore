@interface ARMLImageDownScalingTechnique
- (ARMLImageDownScalingTechnique)initWithSize:(CGSize)a3;
- (ARMLImageDownScalingTechnique)initWithSize:(CGSize)a3 requiredTimeInterval:(double)a4;
- (BOOL)centerCropImage;
- (BOOL)isEqual:(id)a3;
- (BOOL)resizeUltraWideImage;
- (BOOL)saveIntermediateScaleResultData;
- (BOOL)shouldOperateOnHighResolutionImages;
- (CGSize)imageSize;
- (double)requiredTimeInterval;
- (id)_fastPassDownscaledResultDataFromImageData:(id)a3 croppedRect:(CGRect)a4 fastPassScaler:(id)a5;
- (id)_fullDescription;
- (id)_rotateImageDataForNeuralNetwork:(id)a3 deviceOrientation:(int64_t)a4 pRegionOfInterest:(CGSize *)a5 pRotationOfResultTensor:(int64_t *)a6;
- (id)_scaleImageDataForNeuralNetwork:(id)a3 scaledSize:(CGSize)a4;
- (id)_twoPassDownscaledResultDataFromImageData:(id)a3 croppedRect:(CGRect)a4;
- (id)defaultRotationStrategy;
- (id)processData:(id)a3;
- (id)resultDataClasses;
- (id)ultrawideRotationStrategy;
- (id)wideRotationStrategy;
- (int64_t)getDeviceOrientationFromImageData:(id)a3;
- (void)_processImageDataInBackground:(id)a3;
- (void)dealloc;
- (void)lockOrientation:(int64_t)a3;
- (void)prepare:(BOOL)a3;
- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4;
- (void)setCenterCropImage:(BOOL)a3;
- (void)setResizeUltraWideImage:(BOOL)a3;
- (void)setSaveIntermediateScaleResultData:(BOOL)a3;
- (void)setShouldOperateOnHighResolutionImages:(BOOL)a3;
- (void)setUltrawideRotationStrategy:(id)a3;
- (void)setWideRotationStrategy:(id)a3;
@end

@implementation ARMLImageDownScalingTechnique

- (ARMLImageDownScalingTechnique)initWithSize:(CGSize)a3
{
  return -[ARMLImageDownScalingTechnique initWithSize:requiredTimeInterval:](self, "initWithSize:requiredTimeInterval:", a3.width, a3.height, 0.0);
}

- (ARMLImageDownScalingTechnique)initWithSize:(CGSize)a3 requiredTimeInterval:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  v17.receiver = self;
  v17.super_class = (Class)ARMLImageDownScalingTechnique;
  v7 = [(ARImageBasedTechnique *)&v17 init];
  v8 = v7;
  if (v7)
  {
    v7->_lockedOrientation = -1;
    v7->_imageSize.double width = width;
    v7->_imageSize.double height = height;
    int v9 = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.matting.doubleMLResolutionForIPad"];
    if (v9) {
      LOBYTE(v9) = ARDeviceIsiPad();
    }
    v8->_enableDoubleMLResolutionForIPad = v9;
    uint64_t v10 = ARCreateFixedPriorityDispatchQueue("com.apple.arkit.mldownsampling");
    processingQueue = v8->_processingQueue;
    v8->_processingQueue = (OS_dispatch_queue *)v10;

    v8->_resultLatency = a4;
    v8->_resizeUltraWideImage = 0;
    v8->_saveIntermediateScaleResultData = 0;
    v12 = [[ARMLImageTransform alloc] initWithScaledSize:+[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.scaling.useOptimalMSRCoeficients"], 0, width, height useOptimalMSRCoefficients useExplicitBGRAConversion];
    fastPassImageScaler = v8->_fastPassImageScaler;
    v8->_fastPassImageScaler = v12;

    v14 = -[ARMLImageTransform initWithScaledSize:useOptimalMSRCoefficients:useExplicitBGRAConversion:]([ARMLImageTransform alloc], "initWithScaledSize:useOptimalMSRCoefficients:useExplicitBGRAConversion:", 1, 1, width, height);
    fastPassUltraWideImageScaler = v8->_fastPassUltraWideImageScaler;
    v8->_fastPassUltraWideImageScaler = v14;

    v8->_shouldOperateOnHighResolutionImages = 0;
  }
  return v8;
}

- (void)dealloc
{
  cvImageFormatRef = self->_cvImageFormatRef;
  if (cvImageFormatRef) {
    MEMORY[0x1BA9C6870](cvImageFormatRef, a2);
  }
  bgraPixelBufferPool = self->_bgraPixelBufferPool;
  if (bgraPixelBufferPool)
  {
    CVPixelBufferPoolRelease(bgraPixelBufferPool);
    self->_bgraPixelBufferPool = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)ARMLImageDownScalingTechnique;
  [(ARMLImageDownScalingTechnique *)&v5 dealloc];
}

- (void)prepare:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ARMLImageDownScalingTechnique;
  -[ARTechnique prepare:](&v5, sel_prepare_);
  self->_deterministic = a3;
}

- (void)lockOrientation:(int64_t)a3
{
  self->_lockedOrientation = a3;
}

- (double)requiredTimeInterval
{
  return self->_resultLatency;
}

- (id)resultDataClasses
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return v4;
}

- (id)processData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v6 = v4;
  if (isKindOfClass)
  {
    int v7 = [(ARMLImageDownScalingTechnique *)self shouldOperateOnHighResolutionImages];
    if (v7 == [v6 isHighResolution])
    {
      v15.receiver = self;
      v15.super_class = (Class)ARMLImageDownScalingTechnique;
      id v8 = [(ARImageBasedTechnique *)&v15 processData:v6];
      objc_initWeak(&location, self);
      processingQueue = self->_processingQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __45__ARMLImageDownScalingTechnique_processData___block_invoke;
      block[3] = &unk_1E6185200;
      objc_copyWeak(&v13, &location);
      id v12 = v6;
      dispatch_async(processingQueue, block);
      if (self->_deterministic) {
        dispatch_sync((dispatch_queue_t)self->_processingQueue, &__block_literal_global_15);
      }

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }

  return v6;
}

void __45__ARMLImageDownScalingTechnique_processData___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _processImageDataInBackground:*(void *)(a1 + 32)];
}

- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4
{
  id v6 = a4;
  int v7 = [(ARMLImageDownScalingTechnique *)self shouldOperateOnHighResolutionImages];
  id v8 = [v6 imageData];
  int v9 = [v8 isHighResolution];

  if (v7 == v9)
  {
    v13.receiver = self;
    v13.super_class = (Class)ARMLImageDownScalingTechnique;
    [(ARImageBasedTechnique *)&v13 requestResultDataAtTimestamp:v6 context:a3];
  }
  else
  {
    uint64_t v10 = [(ARTechnique *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = [(ARTechnique *)self delegate];
      [v12 technique:self didOutputResultData:MEMORY[0x1E4F1CBF0] timestamp:v6 context:a3];
    }
  }
}

- (void)_processImageDataInBackground:(id)a3
{
  processingQueue = self->_processingQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(processingQueue);
  v41 = [[ARModifiedImageData alloc] initWithImageData:v5];

  [(ARImageData *)v41 timestamp];
  id v6 = [(ARImageData *)v41 cameraType];
  [v6 isEqualToString:*MEMORY[0x1E4F15828]];
  kdebug_trace();

  if ([(ARMLImageDownScalingTechnique *)self centerCropImage])
  {
    [(ARImageData *)v41 timestamp];
    kdebug_trace();
    [(ARImageData *)v41 imageResolution];
    [(ARImageData *)v41 imageResolution];
    kdebug_trace();
    [(ARImageData *)v41 cameraIntrinsics];
    [(ARImageData *)v41 cameraIntrinsics];
    [(ARImageData *)v41 cameraIntrinsics];
    kdebug_trace();
    [(ARImageData *)v41 imageResolution];
    float v8 = v7;
    [(ARImageData *)v41 imageResolution];
    float v10 = v9;
    float v11 = fminf(v8, v10);
    imageCroppingTechnique = self->_imageCroppingTechnique;
    if (!imageCroppingTechnique
      || ([(ARImageCroppingTechnique *)imageCroppingTechnique croppedImageSize],
          double v14 = v13,
          [(ARImageCroppingTechnique *)self->_imageCroppingTechnique croppedImageSize],
          v14 != v15)
      || ([(ARImageCroppingTechnique *)self->_imageCroppingTechnique croppedImageSize], v16 != v11))
    {
      objc_super v17 = -[ARImageCroppingTechnique initWithCroppedImageSize:]([ARImageCroppingTechnique alloc], "initWithCroppedImageSize:", v11, v11);
      v18 = self->_imageCroppingTechnique;
      self->_imageCroppingTechnique = v17;
    }
    v19 = [(ARImageCroppingTechnique *)self->_imageCroppingTechnique processData:v41];
    v20 = [v19 metaData];
    v21 = [v20 objectForKey:@"croppedRect"];

    if (v21)
    {
      [v21 rectValue];
      double v23 = v22;
      double v25 = v24;
      double v27 = v26;
      double v29 = v28;
    }
    else
    {
      double v25 = 0.0;
      double v29 = 1.0;
      double v27 = 1.0;
      double v23 = 0.0;
    }
    v30 = v19;

    [(ARImageData *)v30 imageResolution];
    [(ARImageData *)v30 imageResolution];
    kdebug_trace();
    [(ARImageData *)v30 cameraIntrinsics];
    [(ARImageData *)v30 cameraIntrinsics];
    [(ARImageData *)v30 cameraIntrinsics];
    kdebug_trace();
    [(ARImageData *)v30 timestamp];

    kdebug_trace();
    v41 = v30;
  }
  else
  {
    double v25 = 0.0;
    double v29 = 1.0;
    double v27 = 1.0;
    double v23 = 0.0;
  }
  if ([(ARMLImageDownScalingTechnique *)self saveIntermediateScaleResultData]) {
    -[ARMLImageDownScalingTechnique _twoPassDownscaledResultDataFromImageData:croppedRect:](self, "_twoPassDownscaledResultDataFromImageData:croppedRect:", v41, v23, v25, v27, v29);
  }
  else {
    -[ARMLImageDownScalingTechnique _fastPassDownscaledResultDataFromImageData:croppedRect:fastPassScaler:](self, "_fastPassDownscaledResultDataFromImageData:croppedRect:fastPassScaler:", v41, self->_fastPassImageScaler, v23, v25, v27, v29);
  }
  v31 = (ARMLImageDownScalingResultData *)objc_claimAutoreleasedReturnValue();
  downSamplingResultData = self->_downSamplingResultData;
  self->_downSamplingResultData = v31;

  v33 = [(ARImageData *)v41 latestUltraWideImage];
  if (v33 && self->_resizeUltraWideImage)
  {
    v34 = self->_downSamplingResultData;

    if (v34)
    {
      v35 = [(ARImageData *)v41 latestUltraWideImage];
      v36 = -[ARMLImageDownScalingTechnique _fastPassDownscaledResultDataFromImageData:croppedRect:fastPassScaler:](self, "_fastPassDownscaledResultDataFromImageData:croppedRect:fastPassScaler:", v35, self->_fastPassUltraWideImageScaler, 0.0, 0.0, 1.0, 1.0);
      [(ARMLImageDownScalingResultData *)self->_downSamplingResultData setLatestResizedUltraWideImageData:v36];
    }
  }
  else
  {
  }
  [(ARImageData *)v41 timestamp];
  kdebug_trace();
  v37 = objc_opt_new();
  v38 = v37;
  if (self->_downSamplingResultData)
  {
    objc_msgSend(v37, "addObject:");
    v39 = self->_downSamplingResultData;
    self->_downSamplingResultData = 0;
  }
  if (self->_intermediateDownSamplingResultData)
  {
    objc_msgSend(v38, "addObject:");
    intermediateDownSamplingResultData = self->_intermediateDownSamplingResultData;
    self->_intermediateDownSamplingResultData = 0;
  }
  [(ARImageData *)v41 timestamp];
  kdebug_trace();
  [(ARImageData *)v41 timestamp];
  -[ARImageBasedTechnique pushResultData:forTimestamp:](self, "pushResultData:forTimestamp:", v38);
}

- (int64_t)getDeviceOrientationFromImageData:(id)a3
{
  id v4 = a3;
  if (![v4 deviceOrientation])
  {
    int64_t lockedOrientation = self->_lockedOrientation;
    if ((lockedOrientation & 0x80000000) == 0) {
      goto LABEL_6;
    }
    id v6 = +[ARBKSAccelerometer sharedWeakAccelerometerHandle];
    if (v6)
    {
      double v7 = v6;
      int64_t lockedOrientation = [v6 currentOrientation];

      goto LABEL_6;
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)ARMLImageDownScalingTechnique;
  int64_t lockedOrientation = [(ARImageBasedTechnique *)&v9 getDeviceOrientationFromImageData:v4];
LABEL_6:

  return lockedOrientation;
}

- (id)defaultRotationStrategy
{
  return &__block_literal_global_82;
}

void __56__ARMLImageDownScalingTechnique_defaultRotationStrategy__block_invoke(uint64_t a1, uint64_t a2, uint64_t *a3, void *a4)
{
  switch(a2)
  {
    case 4:
      uint64_t v4 = 180;
      *a4 = 180;
      goto LABEL_6;
    case 3:
      *a4 = 0;
      *a3 = 0;
      break;
    case 2:
      *a4 = 90;
      uint64_t v4 = -90;
LABEL_6:
      *a3 = v4;
      return;
    default:
      *a3 = 90;
      *a4 = -90;
      break;
  }
}

- (id)_twoPassDownscaledResultDataFromImageData:(id)a3 croppedRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v31[1] = *MEMORY[0x1E4F143B8];
  double v9 = self->_imageSize.width;
  double v10 = self->_imageSize.height;
  id v11 = a3;
  id v12 = -[ARMLImageDownScalingTechnique _scaleImageDataForNeuralNetwork:scaledSize:](self, "_scaleImageDataForNeuralNetwork:scaledSize:", v11, v9, v10);
  double v13 = [ARMLImageDownScalingResult alloc];
  uint64_t v14 = [v12 pixelBuffer];
  [v12 imageResolution];
  double v15 = -[ARMLImageDownScalingResult initWithPixelBuffer:regionOfInterest:cropRegion:](v13, "initWithPixelBuffer:regionOfInterest:cropRegion:", v14);
  double v16 = [ARMLIntermediateDownScalingResultData alloc];
  uint64_t v17 = [(ARMLImageDownScalingResult *)v15 pixelBuffer];
  [v11 timestamp];
  v18 = -[ARMLIntermediateDownScalingResultData initWithPixelBuffer:timestamp:originalImageData:](v16, "initWithPixelBuffer:timestamp:originalImageData:", v17, v11);
  intermediateDownSamplingResultData = self->_intermediateDownSamplingResultData;
  self->_intermediateDownSamplingResultData = v18;

  double v29 = 0.0;
  double v30 = 0.0;
  uint64_t v28 = 0;
  v20 = [(ARMLImageDownScalingTechnique *)self _rotateImageDataForNeuralNetwork:v12 deviceOrientation:[(ARMLImageDownScalingTechnique *)self getDeviceOrientationFromImageData:v11] pRegionOfInterest:&v29 pRotationOfResultTensor:&v28];
  v21 = [ARMLImageDownScalingResult alloc];
  uint64_t v22 = [v20 pixelBuffer];
  double v23 = -[ARMLImageDownScalingResult initWithPixelBuffer:regionOfInterest:cropRegion:](v21, "initWithPixelBuffer:regionOfInterest:cropRegion:", v22, v29, v30, x, y, width, height);
  double v24 = [ARMLImageDownScalingResultData alloc];
  v31[0] = v23;
  double v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
  [v11 timestamp];
  double v26 = -[ARMLImageDownScalingResultData initWithResultDataArray:timestamp:rotationOfResultTensor:originalImageData:](v24, "initWithResultDataArray:timestamp:rotationOfResultTensor:originalImageData:", v25, v28, v11);

  return v26;
}

- (id)_scaleImageDataForNeuralNetwork:(id)a3 scaledSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  imageScalingTechnique = self->_imageScalingTechnique;
  if (!imageScalingTechnique
    || (([(ARImageScalingTechnique *)imageScalingTechnique scaledSize], v10 == width)
      ? (BOOL v11 = v9 == height)
      : (BOOL v11 = 0),
        !v11))
  {
    id v12 = -[ARImageScalingTechnique initWithScaledSize:]([ARImageScalingTechnique alloc], "initWithScaledSize:", width, height);
    double v13 = self->_imageScalingTechnique;
    self->_imageScalingTechnique = v12;

    [(ARImageScalingTechnique *)self->_imageScalingTechnique setConversionPixelFormatType:1111970369];
  }
  [v7 timestamp];
  uint64_t v14 = [v7 cameraType];
  [v14 isEqualToString:*MEMORY[0x1E4F15828]];
  [v7 imageResolution];
  [v7 imageResolution];
  kdebug_trace();

  [v7 cameraIntrinsics];
  [v7 cameraIntrinsics];
  [v7 cameraIntrinsics];
  kdebug_trace();
  double v15 = [(ARImageScalingTechnique *)self->_imageScalingTechnique processData:v7];
  [v15 cameraIntrinsics];
  [v15 cameraIntrinsics];
  [v15 cameraIntrinsics];
  kdebug_trace();
  [v7 timestamp];
  kdebug_trace();
  double v16 = [[ARModifiedImageData alloc] initWithImageData:v7];
  [v7 timestamp];
  -[ARImageData setTimestamp:](v16, "setTimestamp:");
  -[ARImageData setPixelBuffer:](v16, "setPixelBuffer:", [v15 pixelBuffer]);

  return v16;
}

- (id)_rotateImageDataForNeuralNetwork:(id)a3 deviceOrientation:(int64_t)a4 pRegionOfInterest:(CGSize *)a5 pRotationOfResultTensor:(int64_t *)a6
{
  v48[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  BOOL v11 = [v10 originalImage];
  uint64_t v46 = 0;
  uint64_t v12 = [(ARMLImageDownScalingTechnique *)self wideRotationStrategy];
  double v13 = (void *)MEMORY[0x1E4F15828];
  if (v12
    && (uint64_t v14 = (void *)v12,
        [v11 cameraType],
        double v15 = objc_claimAutoreleasedReturnValue(),
        int v16 = ARIsSupportedAVCaptureDeviceTypeForRearCameraBackdrop(v15),
        v15,
        v14,
        v16))
  {
    uint64_t v17 = [(ARMLImageDownScalingTechnique *)self wideRotationStrategy];
  }
  else
  {
    uint64_t v18 = [(ARMLImageDownScalingTechnique *)self ultrawideRotationStrategy];
    if (v18
      && (v19 = (void *)v18,
          [v11 cameraType],
          v20 = objc_claimAutoreleasedReturnValue(),
          int v21 = [v20 isEqualToString:*v13],
          v20,
          v19,
          v21))
    {
      uint64_t v17 = [(ARMLImageDownScalingTechnique *)self ultrawideRotationStrategy];
    }
    else
    {
      uint64_t v17 = [(ARMLImageDownScalingTechnique *)self defaultRotationStrategy];
    }
  }
  uint64_t v22 = (void *)v17;
  (*(void (**)(uint64_t, int64_t, uint64_t *, int64_t *))(v17 + 16))(v17, a4, &v46, a6);

  imageRotationTechnique = self->_imageRotationTechnique;
  if (!imageRotationTechnique
    || (uint64_t v24 = [(ARImageRotationTechnique *)imageRotationTechnique rotationAngle], v24 != v46)
    || [(ARImageRotationTechnique *)self->_imageRotationTechnique mirrorMode])
  {
    double v25 = [ARImageRotationTechnique alloc];
    double v26 = [(ARImageRotationTechnique *)v25 initWithRotation:v46 mirror:0];
    double v27 = self->_imageRotationTechnique;
    self->_imageRotationTechnique = v26;
  }
  [v11 timestamp];
  uint64_t v28 = [v11 cameraType];
  [v28 isEqualToString:*v13];
  kdebug_trace();

  [v10 imageResolution];
  [v10 imageResolution];
  kdebug_trace();
  double v29 = [(ARImageRotationTechnique *)self->_imageRotationTechnique processData:v10];
  [v29 imageResolution];
  [v29 imageResolution];
  kdebug_trace();
  [v11 timestamp];
  kdebug_trace();
  double v30 = (__CVBuffer *)[v11 pixelBuffer];
  if (v30)
  {
    v31 = v30;
    double Width = (double)CVPixelBufferGetWidth(v30);
    double Height = (double)CVPixelBufferGetHeight(v31);
  }
  else
  {
    double Width = *MEMORY[0x1E4F1DB30];
    double Height = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  [v10 imageResolution];
  *(float *)&double v34 = v34 / Width;
  double v35 = *(float *)&v34;
  unint64_t v36 = (unint64_t)(Width * v35);
  if (v46 == 90 || v46 == -90)
  {
    unint64_t v37 = (unint64_t)(Height * v35);
  }
  else
  {
    unint64_t v37 = (unint64_t)(Width * v35);
    unint64_t v36 = (unint64_t)(Height * v35);
  }
  a5->double width = (double)v37;
  a5->double height = (double)v36;
  [v11 timestamp];
  objc_msgSend(v29, "setTimestamp:");
  v47[0] = @"imageDownScalingRotationOfResultTensorKey";
  v38 = [NSNumber numberWithInteger:*a6];
  v47[1] = @"imageDownScalingRegionOfInterest";
  v48[0] = v38;
  CGSize v45 = *a5;
  v39 = [MEMORY[0x1E4F29238] valueWithBytes:&v45 objCType:"{CGSize=dd}"];
  v48[1] = v39;
  v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:2];

  v41 = [v29 metaData];

  if (v41)
  {
    v42 = [v29 metaData];
    v43 = (void *)[v42 mutableCopy];

    [v43 addEntriesFromDictionary:v40];
    [v29 setMetaData:v43];
  }
  else
  {
    [v29 setMetaData:v40];
  }
  [v29 setDeviceOrientation:a4];

  return v29;
}

- (id)_fastPassDownscaledResultDataFromImageData:(id)a3 croppedRect:(CGRect)a4 fastPassScaler:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a3;
  id v12 = a5;
  int64_t v13 = [(ARMLImageDownScalingTechnique *)self getDeviceOrientationFromImageData:v11];
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  uint64_t v14 = [(ARMLImageDownScalingTechnique *)self wideRotationStrategy];
  if (v14
    && (double v15 = (void *)v14,
        [v11 cameraType],
        int v16 = objc_claimAutoreleasedReturnValue(),
        int v17 = ARIsSupportedAVCaptureDeviceTypeForRearCameraBackdrop(v16),
        v16,
        v15,
        v17))
  {
    uint64_t v18 = [(ARMLImageDownScalingTechnique *)self wideRotationStrategy];
  }
  else
  {
    uint64_t v19 = [(ARMLImageDownScalingTechnique *)self ultrawideRotationStrategy];
    if (v19
      && (v20 = (void *)v19,
          [v11 cameraType],
          int v21 = objc_claimAutoreleasedReturnValue(),
          int v22 = [v21 isEqualToString:*MEMORY[0x1E4F15828]],
          v21,
          v20,
          v22))
    {
      uint64_t v18 = [(ARMLImageDownScalingTechnique *)self ultrawideRotationStrategy];
    }
    else
    {
      uint64_t v18 = [(ARMLImageDownScalingTechnique *)self defaultRotationStrategy];
    }
  }
  double v23 = (void *)v18;
  (*(void (**)(uint64_t, int64_t, uint64_t *, uint64_t *))(v18 + 16))(v18, v13, &v27, &v26);

  uint64_t v24 = objc_msgSend(v12, "fastPassDownscaledResultDataFromImageData:croppedRect:rotation:rotationOfResultTensor:", v11, v27, v26, x, y, width, height);

  return v24;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARMLImageDownScalingTechnique;
  if ([(ARTechnique *)&v9 isEqual:v4])
  {
    id v5 = (double *)v4;
    BOOL v6 = self->_imageSize.width == v5[27] && self->_imageSize.height == v5[28];
    BOOL v7 = v6
      && self->_centerCropImage == *((unsigned __int8 *)v5 + 193)
      && self->_resizeUltraWideImage == *((unsigned __int8 *)v5 + 194)
      && self->_saveIntermediateScaleResultData == *((unsigned __int8 *)v5 + 195)
      && self->_shouldOperateOnHighResolutionImages == *((unsigned __int8 *)v5 + 196);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)_fullDescription
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v8.receiver = self;
  v8.super_class = (Class)ARMLImageDownScalingTechnique;
  id v4 = [(ARImageBasedTechnique *)&v8 _fullDescription];
  id v5 = [v3 stringWithFormat:@"%@\n", v4];

  BOOL v6 = CVPixelBufferPoolGetPixelBufferAttributes(self->_bgraPixelBufferPool);
  [v5 appendFormat:@"\tPixelBufferPool attr: %@\n", v6];

  return v5;
}

- (BOOL)centerCropImage
{
  return self->_centerCropImage;
}

- (void)setCenterCropImage:(BOOL)a3
{
  self->_centerCropImage = a3;
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)resizeUltraWideImage
{
  return self->_resizeUltraWideImage;
}

- (void)setResizeUltraWideImage:(BOOL)a3
{
  self->_resizeUltraWideImage = a3;
}

- (BOOL)saveIntermediateScaleResultData
{
  return self->_saveIntermediateScaleResultData;
}

- (void)setSaveIntermediateScaleResultData:(BOOL)a3
{
  self->_saveIntermediateScaleResultData = a3;
}

- (BOOL)shouldOperateOnHighResolutionImages
{
  return self->_shouldOperateOnHighResolutionImages;
}

- (void)setShouldOperateOnHighResolutionImages:(BOOL)a3
{
  self->_shouldOperateOnHighResolutionImages = a3;
}

- (id)wideRotationStrategy
{
  return self->_wideRotationStrategy;
}

- (void)setWideRotationStrategy:(id)a3
{
}

- (id)ultrawideRotationStrategy
{
  return self->_ultrawideRotationStrategy;
}

- (void)setUltrawideRotationStrategy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_ultrawideRotationStrategy, 0);
  objc_storeStrong(&self->_wideRotationStrategy, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_downSamplingResultData, 0);
  objc_storeStrong((id *)&self->_intermediateDownSamplingResultData, 0);
  objc_storeStrong((id *)&self->_fastPassUltraWideImageScaler, 0);
  objc_storeStrong((id *)&self->_fastPassImageScaler, 0);
  objc_storeStrong((id *)&self->_imageCroppingTechnique, 0);
  objc_storeStrong((id *)&self->_imageRotationTechnique, 0);
  objc_storeStrong((id *)&self->_imageScalingTechnique, 0);
}

@end