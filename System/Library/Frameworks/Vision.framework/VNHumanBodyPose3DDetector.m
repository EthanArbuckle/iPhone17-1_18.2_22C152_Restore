@interface VNHumanBodyPose3DDetector
+ (id)configurationOptionKeysForDetectorKey;
+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4;
+ (id)supportedImageSizeSetForOptions:(id)a3 error:(id *)a4;
- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4;
- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9;
- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9;
- (int64_t)_abpkOrientationFromExifOrientation:(int)a3;
@end

@implementation VNHumanBodyPose3DDetector

+ (id)configurationOptionKeysForDetectorKey
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__VNHumanBodyPose3DDetector_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNHumanBodyPose3DDetector configurationOptionKeysForDetectorKey]::onceToken != -1) {
    dispatch_once(&+[VNHumanBodyPose3DDetector configurationOptionKeysForDetectorKey]::onceToken, block);
  }
  v2 = (void *)+[VNHumanBodyPose3DDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;

  return v2;
}

void __66__VNHumanBodyPose3DDetector_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNHumanBodyPose3DDetector;
  v1 = objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v2 = (void *)[v1 mutableCopy];

  [v2 removeObject:@"VNDetectorInitOption_ModelBackingStore"];
  uint64_t v3 = [v2 copy];
  v4 = (void *)+[VNHumanBodyPose3DDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNHumanBodyPose3DDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (AltruisticBodyPoseKitLibraryCore(0))
  {
    v8 = @"VNComputeStageMain";
    v4 = +[VNComputeDeviceUtilities allNeuralEngineComputeDevices];
    v9 = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  }
  else
  {
    v10 = @"VNComputeStageMain";
    v4 = +[VNComputeDeviceUtilities computeDevicesOfTypes:0];
    v11[0] = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  }
  v6 = (void *)v5;

  return v6;
}

+ (id)supportedImageSizeSetForOptions:(id)a3 error:(id *)a4
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v4 = [[VNSupportedImageSize alloc] initWithIdealFormat:1111970369 width:288 height:192 orientation:1 aspectRatioHandling:1 orientationAgnostic:0];
  v7[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];

  return v5;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v13 = a5;
  id v14 = a7;
  id v41 = a9;
  v42 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2050000000;
  v15 = (void *)getABPKOutputClass(void)::softClass;
  uint64_t v47 = getABPKOutputClass(void)::softClass;
  if (!getABPKOutputClass(void)::softClass)
  {
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = ___ZL18getABPKOutputClassv_block_invoke;
    v43[3] = &unk_1E5B20220;
    v43[4] = &v44;
    ___ZL18getABPKOutputClassv_block_invoke((uint64_t)v43);
    v15 = (void *)v45[3];
  }
  v16 = v15;
  _Block_object_dispose(&v44, 8);
  id v17 = objc_alloc_init(v16);
  if (v17)
  {
    v18 = +[VNValidationUtilities requiredObjectOfClass:objc_opt_class() forKey:@"VNHumanBodyPose3DDetectorProcessOption_ABPKPipeline" inOptions:v13 error:a8];
    v19 = [v18 bodyPosePipeline];
    if (v19)
    {
      v20 = +[VNValidationUtilities requiredObjectOfClass:getABPKInputClass() forKey:@"VNHumanBodyPose3DDetectorInternalProcessOption_ABPKInput" inOptions:v13 error:a8];
      [v19 runABPKAlgorithmWithInputData:v20 andGetOutput:v17];
      CVPixelBufferRelease((CVPixelBufferRef)[v20 depthConfidenceBuffer]);
      [v20 setDepthConfidenceBuffer:0];
      int v21 = [v17 algorithmReturnCode];
      if (v21)
      {
        if (v21 == -6660)
        {
          if (a8)
          {
            +[VNError errorForInternalErrorWithLocalizedDescription:@"Unable to run HumanBodyPose3D pipeline"];
            id v22 = 0;
            *a8 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            id v22 = 0;
          }
        }
        else
        {
          id v22 = v42;
        }
        v23 = v41;
      }
      else
      {
        v24 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v13 error:a8];
        if (v24)
        {
          v40 = v24;
          v36 = +[VNValidationUtilities requiredObjectOfClass:getABPKCameraParamsClass() forKey:@"VNHumanBodyPose3DDetectorInternalProcessOption_ABPKCameraParams" inOptions:v13 error:a8];
          v37 = [VNHumanBody3DOutput alloc];
          v39 = [v17 liftingSkeletonABPK];
          v25 = [v17 cameraParams];
          [v25 intrinsics];
          double v34 = v27;
          double v35 = v26;
          double v33 = v28;
          [v36 inputRes];
          v38 = -[VNHumanBody3DOutput initWithSkeleton:intrinsics:inputSize:](v37, "initWithSkeleton:intrinsics:inputSize:", v39, v35, v34, v33, v29, v30);

          v31 = [(VNRecognizedPoints3DObservation *)[VNHumanBodyPose3DObservation alloc] initWithOriginatingRequestSpecifier:v40 keypointsReturningObject:v38];
          if (v31)
          {
            [(VNDetector *)self recordImageCropQuickLookInfoFromOptions:v13 toObservation:v31];
            [v42 addObject:v31];
            id v22 = v42;
          }
          else if (a8)
          {
            +[VNError errorForInternalErrorWithLocalizedDescription:@"Unable to create observation"];
            id v22 = 0;
            *a8 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            id v22 = 0;
          }

          v24 = v40;
          v23 = v41;
        }
        else
        {
          id v22 = 0;
          v23 = v41;
        }
      }
    }
    else
    {
      id v22 = 0;
      v23 = v41;
    }
  }
  else
  {
    if (a8)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:@"Unable to create HumanBodyPose3D output "];
      id v22 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v22 = 0;
    }
    v23 = v41;
  }

  return v22;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v16 = a4;
  id v17 = [(VNDetector *)self validatedImageBufferFromOptions:v16 error:a8];
  v18 = v17;
  if (v17)
  {
    unint64_t v19 = [v17 width];
    unint64_t v20 = [v18 height];
    v62.origin.double x = x * (double)v19;
    v62.size.double width = width * (double)v19;
    v62.origin.double y = y * (double)v20;
    v62.size.double height = height * (double)v20;
    CGRect v63 = CGRectIntegral(v62);
    double v21 = v63.origin.x;
    double v22 = v63.origin.y;
    double v23 = v63.size.width;
    double v24 = v63.size.height;
    [v16 setObject:MEMORY[0x1E4F1CC38] forKey:@"VNImageBufferOption_RequiresDepth"];
    v61[0] = 0;
    v25 = (__CVBuffer *)objc_msgSend(v18, "createCroppedBufferWithMaxSideLengthOf:cropRect:pixelFormat:options:error:pixelBufferRepsCacheKey:", 580, 1111970369, v16, a8, v61, v21, v22, v23, v24);
    id v26 = v61[0];
    *a7 = v25;
    if (!v25)
    {
      BOOL v36 = 0;
LABEL_29:

      goto LABEL_30;
    }
    double v27 = (void *)CVBufferCopyAttachment(v25, @"VNDepthRepresentationAttachment", 0);
    double v28 = (long long *)MEMORY[0x1E4F14998];
    long long v29 = *(_OWORD *)(MEMORY[0x1E4F14998] + 16);
    long long v58 = *MEMORY[0x1E4F14998];
    long long v59 = v29;
    long long v60 = *(_OWORD *)(MEMORY[0x1E4F14998] + 32);
    id v56 = v27;
    if (v27)
    {
      [v27 cameraIntrinsics];
      DWORD2(v58) = v30;
      DWORD2(v59) = v31;
      *(void *)&long long v58 = v32;
      *(void *)&long long v59 = v33;
      DWORD2(v60) = v34;
      *(void *)&long long v60 = v35;
    }
    else if (([v18 getCameraIntrinsicsAvailable:&v58] & 1) == 0)
    {
      long long v37 = v28[1];
      long long v58 = *v28;
      long long v59 = v37;
      long long v60 = v28[2];
    }
    id v38 = objc_alloc((Class)getABPKCameraParamsClass());
    v39 = (double *)MEMORY[0x1E4F149A0];
    v40 = objc_msgSend(v38, "initWithIntrinsics:andExtrinsics:andDistortion:andInputResolution:", *(double *)&v58, *(double *)&v59, *(double *)&v60, *MEMORY[0x1E4F149A0], *(double *)(MEMORY[0x1E4F149A0] + 16), *(double *)(MEMORY[0x1E4F149A0] + 32), *(double *)(MEMORY[0x1E4F149A0] + 48), 0.0, (double)(unint64_t)objc_msgSend(v18, "width"), (double)(unint64_t)objc_msgSend(v18, "height"));
    if (!v40)
    {
      BOOL v36 = 0;
LABEL_28:

      goto LABEL_29;
    }
    objc_msgSend(v40, "setDeviceOrientation:", -[VNHumanBodyPose3DDetector _abpkOrientationFromExifOrientation:](self, "_abpkOrientationFromExifOrientation:", objc_msgSend(v18, "orientation")));
    id v41 = objc_alloc_init((Class)getABPKInputClass());
    if (v41)
    {
      [v41 setTimestamp:CFAbsoluteTimeGetCurrent()];
      objc_msgSend(v41, "setVioPose:", *v39, v39[2], v39[4], v39[6]);
      [v41 setIsVioPoseValid:1];
      [v41 setCameraParams:v40];
      [v41 setImage:*a7];
      if (v56 && [v56 absoluteAccuracy])
      {
        id v42 = v56;
        objc_msgSend(v41, "setDepthMap:", objc_msgSend(v42, "depthBuffer"));
        id v43 = v42;
        int v44 = CVPixelBufferGetWidth((CVPixelBufferRef)[v43 depthBuffer]);
        int v45 = CVPixelBufferGetHeight((CVPixelBufferRef)[v43 depthBuffer]);
        CVPixelBufferRef pixelBuffer = 0;
        if (VNCVPixelBufferCreateUsingIOSurface(v44, v45, 0x66646570u, 0, &pixelBuffer))
        {
          if (a8)
          {
            *a8 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Unable to create depth confidence buffer "];
          }
          goto LABEL_19;
        }
        CVPixelBufferLockBaseAddress(pixelBuffer, 0);
        id v55 = v26;
        size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
        int v47 = CVPixelBufferGetWidth(pixelBuffer);
        int v48 = CVPixelBufferGetHeight(pixelBuffer);
        BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
        if (v48 >= 1)
        {
          v50 = BaseAddress;
          unsigned int v51 = v48;
          uint64_t v52 = 0;
          uint64_t v53 = v51;
          do
          {
            if (v47 >= 1) {
              memset_pattern16(&v50[v52 >> 30], &unk_1A410C510, 4 * v47);
            }
            v52 += BytesPerRow >> 2 << 32;
            --v53;
          }
          while (v53);
        }
        CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
        [v41 setDepthConfidenceBuffer:pixelBuffer];
        [v41 setIsDepthDataValid:1];
        id v26 = v55;
      }
      [(VNDetector *)self recordImageCropQuickLookInfoToOptionsSafe:v16 cacheKey:v26 imageBuffer:v18];
      [v16 setObject:v40 forKeyedSubscript:@"VNHumanBodyPose3DDetectorInternalProcessOption_ABPKCameraParams"];
      [v16 setObject:v41 forKeyedSubscript:@"VNHumanBodyPose3DDetectorInternalProcessOption_ABPKInput"];
      BOOL v36 = 1;
      goto LABEL_27;
    }
    if (a8)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:@"Unable to create HumanBodyPose3D pipeline input "];
      BOOL v36 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:

      goto LABEL_28;
    }
LABEL_19:
    BOOL v36 = 0;
    goto LABEL_27;
  }
  BOOL v36 = 0;
LABEL_30:

  return v36;
}

- (int64_t)_abpkOrientationFromExifOrientation:(int)a3
{
  if ((a3 - 1) > 7) {
    return 0;
  }
  else {
    return qword_1A410E7F8[a3 - 1];
  }
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VNHumanBodyPose3DDetector;
  if (![(VNDetector *)&v9 completeInitializationForSession:v6 error:a4]) {
    goto LABEL_6;
  }
  if (!AltruisticBodyPoseKitLibraryCore(0))
  {
    if (a4)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:@"VNDetectHumanBodyPose3DRequest is unavailable on this device."];
      BOOL v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_6:
    BOOL v7 = 0;
    goto LABEL_7;
  }
  BOOL v7 = 1;
LABEL_7:

  return v7;
}

@end