@interface VNBrightnessDetector
+ (BOOL)isReentrant;
+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4;
- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9;
- (__CVBuffer)_createPixelBufferFromImageBuffer:(id)a3 regionOfInterest:(CGRect)a4 maximumIntermediateSideLength:(unint64_t)a5 options:(id)a6 error:(id *)a7;
- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9;
@end

@implementation VNBrightnessDetector

+ (BOOL)isReentrant
{
  return 1;
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7 = @"VNComputeStageMain";
  v4 = +[VNComputeDeviceUtilities allCPUComputeDevices];
  v8[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  int v18 = 0;
  if (+[VNBrightnessMeasure computeBrightnessScore:&v18 onImage:a4 error:a8])
  {
    v12 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v11 error:a8];
    if (v12)
    {
      v13 = [(VNObservation *)[VNImageScoreObservation alloc] initWithOriginatingRequestSpecifier:v12];
      LODWORD(v14) = v18;
      v15 = [NSNumber numberWithFloat:v14];
      [(VNImageScoreObservation *)v13 setExposureScore:v15];

      v19[0] = v13;
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v16 = a4;
  v17 = [(VNDetector *)self validatedImageBufferFromOptions:v16 error:a8];
  if (v17
    && (uint64_t v21 = 0,
        +[VNValidationUtilities getNSUIntegerValue:&v21 forKey:@"VNBrightnessDetectorProcessOption_MaximumIntermediateSideLength" inOptions:v16 withDefaultValue:256 error:a8]))
  {
    int v18 = -[VNBrightnessDetector _createPixelBufferFromImageBuffer:regionOfInterest:maximumIntermediateSideLength:options:error:](self, "_createPixelBufferFromImageBuffer:regionOfInterest:maximumIntermediateSideLength:options:error:", v17, v21, v16, a8, x, y, width, height);
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
    uint64_t v16 = [v14 createBufferWithMaxSideLengthOf:a5 pixelFormat:1111970369 options:v15 error:a7];
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
    uint64_t v16 = objc_msgSend(v14, "createCroppedBufferWithMaxSideLengthOf:cropRect:pixelFormat:options:error:pixelBufferRepsCacheKey:", a5, 1111970369, v15, a7, 0);
  }
  BOOL v19 = (__CVBuffer *)v16;

  return v19;
}

@end