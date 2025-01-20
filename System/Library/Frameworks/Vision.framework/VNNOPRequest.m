@interface VNNOPRequest
+ (Class)configurationClass;
- (BOOL)_performNOPForRevision:(unint64_t)a3 inContext:(id)a4 detectorCompletionSemaphore:(id)a5 error:(id *)a6;
- (BOOL)detectorWantsAnisotropicScaling;
- (BOOL)hasCancellationHook;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3;
- (CGSize)_actualSizeForDesiredSize:(id)a3 ofSourceImageWidth:(unint64_t)a4 height:(unint64_t)a5;
- (VNSupportedImageSize)detectorPreferredImageSize;
- (__CVBuffer)_createScaledImagePixelBufferFromCropRect:(CGRect)a3 ofImageBuffer:(id)a4 inPixelFormat:(unsigned int)a5 forDetectorInputImageSize:(CGSize)a6 usingAnisotropicScaling:(BOOL)a7 error:(id *)a8;
- (__CVBuffer)_createScaledImagePixelBufferFromImageBuffer:(id)a3 inPixelFormat:(unsigned int)a4 forDetectorInputImageSize:(CGSize)a5 usingAnisotropicScaling:(BOOL)a6 error:(id *)a7;
- (double)detectorExecutionTimeInterval;
- (id)supportedComputeStageDevicesAndReturnError:(id *)a3;
- (id)supportedImageSizeSet;
- (void)setDetectorExecutionTimeInterval:(double)a3;
- (void)setDetectorPreferredImageSize:(id)a3;
- (void)setDetectorWantsAnisotropicScaling:(BOOL)a3;
@end

@implementation VNNOPRequest

- (id)supportedImageSizeSet
{
  id v3 = objc_alloc(MEMORY[0x1E4F1C978]);
  v4 = [(VNNOPRequest *)self detectorPreferredImageSize];
  v5 = objc_msgSend(v3, "initWithObjects:", v4, 0);

  return v5;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = [(VNRequest *)self cancellerAndReturnError:a5];
  if (v9)
  {
    dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__13918;
    v31 = __Block_byref_object_dispose__13919;
    id v32 = 0;
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x2020000000;
    char v26 = 1;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __56__VNNOPRequest_internalPerformRevision_inContext_error___block_invoke;
    v17[3] = &unk_1E5B1D600;
    v20 = &v23;
    v17[4] = self;
    unint64_t v22 = a3;
    id v18 = v8;
    v19 = v10;
    v21 = &v27;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __56__VNNOPRequest_internalPerformRevision_inContext_error___block_invoke_2;
    v15[3] = &unk_1E5B1D628;
    v11 = v19;
    v16 = v11;
    if ([v9 tryToPerformBlock:v17 usingSignallingBlock:v15])
    {
      if (*((unsigned char *)v24 + 24))
      {
        BOOL v12 = 1;
LABEL_12:

        _Block_object_dispose(&v23, 8);
        _Block_object_dispose(&v27, 8);

        goto LABEL_13;
      }
      if (a5)
      {
        id v13 = (id) v28[5];
        goto LABEL_10;
      }
    }
    else if (a5)
    {
      id v13 = +[VNError errorForCancellationOfRequest:self];
LABEL_10:
      BOOL v12 = 0;
      *a5 = v13;
      goto LABEL_12;
    }
    BOOL v12 = 0;
    goto LABEL_12;
  }
  BOOL v12 = 0;
LABEL_13:

  return v12;
}

void __56__VNNOPRequest_internalPerformRevision_inContext_error___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[9];
  uint64_t v6 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v6 + 40);
  char v7 = [v2 _performNOPForRevision:v5 inContext:v3 detectorCompletionSemaphore:v4 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v7;
}

intptr_t __56__VNNOPRequest_internalPerformRevision_inContext_error___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4 = a3;
  [v4 detectorExecutionTimeInterval];
  if (v5 <= 0.0)
  {
    v8.receiver = self;
    v8.super_class = (Class)VNNOPRequest;
    BOOL v6 = [(VNImageBasedRequest *)&v8 willAcceptCachedResultsFromRequestWithConfiguration:v4];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)supportedComputeStageDevicesAndReturnError:(id *)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  BOOL v6 = @"VNComputeStageMain";
  uint64_t v3 = +[VNComputeDeviceUtilities allCPUComputeDevices];
  v7[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

- (BOOL)hasCancellationHook
{
  return 1;
}

- (void)setDetectorExecutionTimeInterval:(double)a3
{
  id v4 = [(VNRequest *)self configuration];
  [v4 setDetectorExecutionTimeInterval:a3];
}

- (double)detectorExecutionTimeInterval
{
  v2 = [(VNRequest *)self configuration];
  [v2 detectorExecutionTimeInterval];
  double v4 = v3;

  return v4;
}

- (void)setDetectorWantsAnisotropicScaling:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VNRequest *)self configuration];
  [v4 setDetectorWantsAnisotropicScaling:v3];
}

- (BOOL)detectorWantsAnisotropicScaling
{
  v2 = [(VNRequest *)self configuration];
  char v3 = [v2 detectorWantsAnisotropicScaling];

  return v3;
}

- (void)setDetectorPreferredImageSize:(id)a3
{
  id v4 = a3;
  id v5 = [(VNRequest *)self configuration];
  [v5 setDetectorPreferredImageSize:v4];
}

- (VNSupportedImageSize)detectorPreferredImageSize
{
  v2 = [(VNRequest *)self configuration];
  char v3 = [v2 detectorPreferredImageSize];

  return (VNSupportedImageSize *)v3;
}

- (BOOL)_performNOPForRevision:(unint64_t)a3 inContext:(id)a4 detectorCompletionSemaphore:(id)a5 error:(id *)a6
{
  id v9 = a4;
  dispatch_semaphore_t v10 = a5;
  if ([(VNRequest *)self cancellationTriggeredAndReturnError:a6])
  {
    BOOL v11 = 0;
  }
  else
  {
    BOOL v12 = [v9 imageBufferAndReturnError:a6];
    if (v12
      && (unint64_t v28 = 0,
          unint64_t v29 = 0,
          [(VNRequest *)self validateImageBuffer:v12 ofNonZeroWidth:&v29 andHeight:&v28 error:a6]))
    {
      id v13 = [(VNNOPRequest *)self detectorPreferredImageSize];
      [(VNNOPRequest *)self _actualSizeForDesiredSize:v13 ofSourceImageWidth:v29 height:v28];
      double v16 = v15;
      double v17 = v14;
      if (v15 == *MEMORY[0x1E4F1DB30] && v14 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
      {
        if (a6)
        {
          +[VNError errorForInvalidOperationWithLocalizedDescription:@"unable to determine preferred image size for detection"];
          BOOL v11 = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          BOOL v11 = 0;
        }
      }
      else
      {
        [(VNImageBasedRequest *)self regionOfInterest];
        double x = v30.origin.x;
        double y = v30.origin.y;
        double width = v30.size.width;
        double height = v30.size.height;
        v31.origin.double x = 0.0;
        v31.origin.double y = 0.0;
        v31.size.double width = 1.0;
        v31.size.double height = 1.0;
        if (CGRectEqualToRect(v30, v31)) {
          uint64_t v23 = -[VNNOPRequest _createScaledImagePixelBufferFromImageBuffer:inPixelFormat:forDetectorInputImageSize:usingAnisotropicScaling:error:](self, "_createScaledImagePixelBufferFromImageBuffer:inPixelFormat:forDetectorInputImageSize:usingAnisotropicScaling:error:", v12, [v13 idealImageFormat], -[VNNOPRequest detectorWantsAnisotropicScaling](self, "detectorWantsAnisotropicScaling"), a6, v16, v17);
        }
        else {
          uint64_t v23 = -[VNNOPRequest _createScaledImagePixelBufferFromCropRect:ofImageBuffer:inPixelFormat:forDetectorInputImageSize:usingAnisotropicScaling:error:](self, "_createScaledImagePixelBufferFromCropRect:ofImageBuffer:inPixelFormat:forDetectorInputImageSize:usingAnisotropicScaling:error:", v12, [v13 idealImageFormat], -[VNNOPRequest detectorWantsAnisotropicScaling](self, "detectorWantsAnisotropicScaling"), a6, x * (double)v29, y * (double)v28, width * (double)v29, height * (double)v28, v16, v17);
        }
        v24 = v23;
        BOOL v11 = 0;
        if (v23)
        {
          [(VNNOPRequest *)self detectorExecutionTimeInterval];
          if (v25 <= 0.0
            || (dispatch_time_t v26 = dispatch_time(0, (uint64_t)(v25 * 1000000000.0)),
                dispatch_semaphore_wait(v10, v26),
                ![(VNRequest *)self cancellationTriggeredAndReturnError:a6]))
          {
            BOOL v11 = 1;
          }
        }
        CVPixelBufferRelease(v24);
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  return v11;
}

- (__CVBuffer)_createScaledImagePixelBufferFromImageBuffer:(id)a3 inPixelFormat:(unsigned int)a4 forDetectorInputImageSize:(CGSize)a5 usingAnisotropicScaling:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  double height = a5.height;
  double width = a5.width;
  uint64_t v11 = *(void *)&a4;
  id v12 = a3;
  unint64_t v13 = [v12 width];
  unint64_t v14 = [v12 height];
  if (v8)
  {
    id v23 = 0;
    double v15 = (__CVBuffer *)[v12 bufferWithWidth:(unint64_t)width height:(unint64_t)height format:v11 options:0 error:&v23];
    id v16 = v23;
    if (a7 && !v15)
    {
      double v17 = @"Failed to scale the input image";
LABEL_14:
      +[VNError errorWithCode:9 message:v17 underlyingError:v16];
      double v15 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    double v18 = ((double)v14 - (double)v13) * 0.5 + 0.0;
    if ((double)v13 < (double)v14) {
      double v19 = 0.0;
    }
    else {
      double v19 = ((double)v13 - (double)v14) * 0.5 + 0.0;
    }
    if ((double)v13 < (double)v14)
    {
      double v20 = (double)v13;
    }
    else
    {
      double v18 = 0.0;
      double v20 = (double)v14;
    }
    id v22 = 0;
    double v15 = (__CVBuffer *)objc_msgSend(v12, "croppedBufferWithWidth:height:format:cropRect:options:error:", (unint64_t)width, (unint64_t)height, v11, 0, &v22, trunc(v19), trunc(v18), v20, v20);
    id v16 = v22;
    if (a7 && !v15)
    {
      double v17 = @"Failed to center square crop the input image";
      goto LABEL_14;
    }
  }

  return v15;
}

- (__CVBuffer)_createScaledImagePixelBufferFromCropRect:(CGRect)a3 ofImageBuffer:(id)a4 inPixelFormat:(unsigned int)a5 forDetectorInputImageSize:(CGSize)a6 usingAnisotropicScaling:(BOOL)a7 error:(id *)a8
{
  double height = a6.height;
  double width = a6.width;
  uint64_t v11 = *(void *)&a5;
  double v12 = a3.size.height;
  double v13 = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (a7)
  {
    id v27 = 0;
    id v16 = a4;
    double v17 = (__CVBuffer *)objc_msgSend(v16, "croppedBufferWithWidth:height:format:cropRect:options:error:", (unint64_t)width, (unint64_t)height, v11, 0, &v27, x, y, v13, v12);

    id v18 = v27;
    if (a8 && !v17)
    {
      double v19 = @"Failed to scale the input image";
LABEL_14:
      +[VNError errorWithCode:9 message:v19 underlyingError:v18];
      double v17 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v20 = a4;
    v21 = v20;
    double v22 = x + (v13 - v12) * 0.5;
    double v23 = y + (v12 - v13) * 0.5;
    if (v13 >= v12) {
      double v23 = y;
    }
    else {
      double v22 = x;
    }
    if (v13 < v12) {
      double v24 = v13;
    }
    else {
      double v24 = v12;
    }
    id v26 = 0;
    double v17 = (__CVBuffer *)objc_msgSend(v20, "croppedBufferWithWidth:height:format:cropRect:options:error:", (unint64_t)width, (unint64_t)height, v11, 0, &v26, trunc(v22), trunc(v23), v24, v24);

    id v18 = v26;
    if (a8 && !v17)
    {
      double v19 = @"Failed to center square crop the input image";
      goto LABEL_14;
    }
  }

  return v17;
}

- (CGSize)_actualSizeForDesiredSize:(id)a3 ofSourceImageWidth:(unint64_t)a4 height:(unint64_t)a5
{
  id v7 = a3;
  BOOL v8 = v7;
  if (!v7 || [v7 isAllowedPixelsWide:a4 pixelsHigh:a5])
  {
    double v9 = (double)a4;
    double v10 = (double)a5;
    goto LABEL_4;
  }
  uint64_t v13 = [v8 aspectRatioHandling];
  if (v13 == 2)
  {
    id v16 = [v8 pixelsWideRange];
    if (a4 < a5)
    {
LABEL_12:
      uint64_t v20 = _bestDimensionForSizeRange(v16, a5);

      double v19 = (double)a5;
      double v18 = (double)(unint64_t)v20 / (double)a5;
      double v9 = trunc(v18 * (double)a4);
      goto LABEL_13;
    }
LABEL_10:
    uint64_t v17 = _bestDimensionForSizeRange(v16, a4);

    double v18 = (double)(unint64_t)v17 / (double)a4;
    double v9 = trunc(v18 * (double)a4);
    double v19 = (double)a5;
LABEL_13:
    double v10 = trunc(v18 * v19);
    goto LABEL_4;
  }
  if (v13 == 1)
  {
    id v16 = [v8 pixelsWideRange];
    if (a4 > a5) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  if (v13)
  {
    double v9 = *MEMORY[0x1E4F1DB30];
    double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  else
  {
    unint64_t v14 = [v8 pixelsWideRange];
    double v9 = (double)(unint64_t)_bestDimensionForSizeRange(v14, a4);
    double v15 = [v8 pixelsHighRange];
    double v10 = (double)(unint64_t)_bestDimensionForSizeRange(v15, a5);
  }
LABEL_4:

  double v11 = v9;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

@end