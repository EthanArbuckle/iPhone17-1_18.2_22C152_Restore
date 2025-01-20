@interface VNBlurDetector
+ (BOOL)isReentrant;
+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4;
- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9;
- (__CVBuffer)_createPixelBufferFromImageBuffer:(id)a3 regionOfInterest:(CGRect)a4 maximumIntermediateSideLength:(unint64_t)a5 options:(id)a6 error:(id *)a7;
- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9;
@end

@implementation VNBlurDetector

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7 = @"VNComputeStageMain";
  v4 = +[VNComputeDeviceUtilities allCPUComputeDevices];
  v8[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

+ (BOOL)isReentrant
{
  return 1;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  id v13 = a7;
  v14 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v12 error:a8];
  if (!v14) {
    goto LABEL_15;
  }
  int v23 = 0;
  if (CVPixelBufferGetWidth(a4) < 0x20 || CVPixelBufferGetHeight(a4) <= 0x1F)
  {
    VNRecordImageTooSmallWarningWithImageMinimumShortDimension(v13, 32);
    v15 = [(VNObservation *)[VNImageBlurObservation alloc] initWithOriginatingRequestSpecifier:v14];
    [(VNImageScoreObservation *)v15 setBlurScore:&unk_1EF7A7B68];
    v25[0] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];

    goto LABEL_16;
  }
  uint64_t v22 = 0;
  if (!+[VNValidationUtilities getNSUIntegerValue:&v22 forKey:@"VNBlurDetectorProcessOption_ImageBlurDeterminationMethod" inOptions:v12 error:a8])goto LABEL_15; {
  if (v22 == 1)
  }
  {
    BOOL v17 = +[VNBlurMeasure computeEdgeWidthBlurScore:&v23 onGrayscaleImage:a4 error:a8];
LABEL_10:
    if (v17)
    {
      v18 = [(VNObservation *)[VNImageScoreObservation alloc] initWithOriginatingRequestSpecifier:v14];
      LODWORD(v19) = v23;
      v20 = [NSNumber numberWithFloat:v19];
      [(VNImageScoreObservation *)v18 setBlurScore:v20];

      v24 = v18;
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
LABEL_14:

      goto LABEL_16;
    }
    goto LABEL_15;
  }
  if (!v22)
  {
    BOOL v17 = +[VNBlurMeasure computeBlurScore:&v23 onGrayscaleImage:a4 insetFactor:a8 error:0.0];
    goto LABEL_10;
  }
  if (a8)
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    v18 = (VNImageScoreObservation *)objc_claimAutoreleasedReturnValue();
    +[VNError errorForInvalidArgument:v18 named:@"blurDeterminationMethod"];
    v16 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
LABEL_15:
  v16 = 0;
LABEL_16:

  return v16;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v16 = a4;
  BOOL v17 = [(VNDetector *)self validatedImageBufferFromOptions:v16 error:a8];
  if (v17
    && (uint64_t v21 = 0,
        +[VNValidationUtilities getNSUIntegerValue:&v21 forKey:@"VNBlurDetectorProcessOption_MaximumIntermediateSideLength" inOptions:v16 error:a8]))
  {
    v18 = -[VNBlurDetector _createPixelBufferFromImageBuffer:regionOfInterest:maximumIntermediateSideLength:options:error:](self, "_createPixelBufferFromImageBuffer:regionOfInterest:maximumIntermediateSideLength:options:error:", v17, v21, v16, a8, x, y, width, height);
    *a7 = v18;
    BOOL v19 = v18 != 0;
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (__CVBuffer)_createPixelBufferFromImageBuffer:(id)a3 regionOfInterest:(CGRect)a4 maximumIntermediateSideLength:(unint64_t)a5 options:(id)a6 error:(id *)a7
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v14 = a3;
  id v15 = a6;
  v24.origin.double x = 0.0;
  v24.origin.double y = 0.0;
  v24.size.double width = 1.0;
  v24.size.double height = 1.0;
  v21.origin.double x = x;
  v21.origin.double y = y;
  v21.size.double width = width;
  v21.size.double height = height;
  if (CGRectEqualToRect(v21, v24))
  {
    uint64_t v16 = [v14 createBufferWithMaxSideLengthOf:a5 pixelFormat:1278226488 options:v15 error:a7];
  }
  else
  {
    unint64_t v17 = [v14 width];
    unint64_t v18 = [v14 height];
    v22.origin.double x = x * (double)v17;
    v22.size.double width = width * (double)v17;
    v22.origin.double y = y * (double)v18;
    v22.size.double height = height * (double)v18;
    CGRect v23 = CGRectIntegral(v22);
    objc_msgSend(v14, "makeClippedRectAgainstImageExtentUsingOriginalRect:", v23.origin.x, v23.origin.y, v23.size.width, v23.size.height);
    uint64_t v16 = objc_msgSend(v14, "createCroppedBufferWithMaxSideLengthOf:cropRect:pixelFormat:options:error:pixelBufferRepsCacheKey:", a5, 1278226488, v15, a7, 0);
  }
  BOOL v19 = (__CVBuffer *)v16;

  return v19;
}

@end