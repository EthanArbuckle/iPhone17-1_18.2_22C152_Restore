@interface VNFaceLandmarkDetectorRevision2
+ (id)espressoModelFileNameForConfigurationOptions:(id)a3;
+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3;
+ (unsigned)landmarkDetectorDNNVersion;
- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9;
@end

@implementation VNFaceLandmarkDetectorRevision2

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  uint64_t v12 = *(void *)&a6;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v19 = a5;
  id v20 = a7;
  id v21 = a9;
  v34.receiver = self;
  v34.super_class = (Class)VNFaceLandmarkDetectorRevision2;
  v22 = -[VNFaceLandmarkDetectorDNN processRegionOfInterest:croppedPixelBuffer:options:qosClass:warningRecorder:error:progressHandler:](&v34, sel_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler_, a4, v19, v12, v20, a8, v21, x, y, width, height);
  v23 = v22;
  if (!v22)
  {
    id v30 = 0;
    goto LABEL_26;
  }
  v24 = [v22 firstObject];
  if (v24)
  {
    if ([v23 count] != 1)
    {
      if (a8)
      {
        +[VNError errorForInternalErrorWithLocalizedDescription:@"Internal error while processing Face Landmarks"];
        id v30 = 0;
        *a8 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v30 = 0;
      }
      goto LABEL_25;
    }
    v25 = [(VNDetector *)self validatedImageBufferFromOptions:v19 error:a8];
    if (!v25)
    {
      id v30 = 0;
LABEL_24:

      goto LABEL_25;
    }
    v33 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v19 error:a8];
    if (!v33)
    {
      id v30 = 0;
LABEL_23:

      goto LABEL_24;
    }
    v26 = [(VNFaceLandmarkDetectorDNN *)self landmarkPoints65];
    v27 = (void *)[v19 mutableCopy];
    [v27 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"VNFaceLandmarkDetectorProcessOption_CalculateLandmarkScore"];
    if (![(VNFaceLandmarkDetector *)self postprocessLandmarkResultsForLandmarks:v26 imageBuffer:v25 outputFace:v24 options:v27 warningRecorder:v20 error:a8]|| ([(VNFaceLandmarkDetector *)self calculatePupilLocationAndUpdateLandmarkPoints:v26], ![(VNFaceLandmarkDetectorDNN *)self translateAndNormalizeLandmarkPointsWrtLLCofAlignedFaceBBox:v26 imageBuffer:v25 outputFace:v24 error:a8]))
    {
      id v30 = 0;
LABEL_22:

      goto LABEL_23;
    }
    uint64_t v28 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:*v26 length:v26[1] - *v26];
    v29 = (void *)v28;
    if (v28)
    {
      v32 = (void *)v28;
      [v24 setLandmarkPoints65Data:v28 originatingRequestSpecifier:v33];
      id v30 = v23;
    }
    else
    {
      if (!a8)
      {
        id v30 = 0;
        goto LABEL_21;
      }
      v32 = 0;
      +[VNError errorForInternalErrorWithLocalizedDescription:@"Internal error while processing Face Landmarks"];
      id v30 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v29 = v32;
LABEL_21:

    goto LABEL_22;
  }
  id v30 = v23;
LABEL_25:

LABEL_26:
  [(VNFaceLandmarkDetectorDNN *)self releaseResources];

  return v30;
}

+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3
{
  return @"image";
}

+ (id)espressoModelFileNameForConfigurationOptions:(id)a3
{
  return @"solo_landmarks_s9min6ugm8_opt.espresso";
}

+ (unsigned)landmarkDetectorDNNVersion
{
  return 1;
}

@end