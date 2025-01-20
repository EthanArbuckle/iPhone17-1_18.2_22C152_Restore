@interface VNOpticalFlowGeneratorRevision1
+ (id)computeStagesToBindForConfigurationOptions:(id)a3;
+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4;
- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9;
- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9;
@end

@implementation VNOpticalFlowGeneratorRevision1

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7 = @"VNComputeStageMain";
  v4 = +[VNComputeDeviceUtilities allCPUAndGPUComputeDevices];
  v8[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

+ (id)computeStagesToBindForConfigurationOptions:(id)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = @"VNComputeStageMain";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  v71[1] = *MEMORY[0x1E4F143B8];
  id v13 = a5;
  id v63 = a7;
  id v64 = a9;
  v14 = [v13 objectForKeyedSubscript:@"VNOpticalFlowGeneratorProcessOption_ROIWidth"];
  size_t v15 = [v14 unsignedIntegerValue];

  v16 = [v13 objectForKeyedSubscript:@"VNOpticalFlowGeneratorProcessOption_ROIHeight"];
  size_t v17 = [v16 unsignedIntegerValue];

  id v18 = v13;
  v19 = v18;
  if (!self)
  {

    goto LABEL_34;
  }
  CVPixelBufferRef v70 = 0;
  BOOL v20 = +[VNValidationUtilities getOptionalObject:&v70 ofClass:objc_opt_class() forKey:@"VNOpticalFlowGeneratorProcessOption_PreviousObservation" inOptions:v18 error:a8];
  v21 = v70;
  v22 = v21;
  if (!v20)
  {

LABEL_34:
    v40 = 0;
    goto LABEL_35;
  }
  uint64_t v69 = 0;
  if (!+[VNValidationUtilities getNSUIntegerValue:&v69 forKey:@"VNOpticalFlowGeneratorProcessOption_OutputPixelFormat" inOptions:v19 error:a8])
  {
LABEL_15:

    goto LABEL_34;
  }
  if (v69 != 843264102 && v69 != 843264104)
  {
    if (a8)
    {
      v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
      *a8 = +[VNError errorForInvalidOption:v29 named:@"outputPixelFormat"];
    }
    goto LABEL_15;
  }
  uint64_t v68 = 0;
  if (!+[VNValidationUtilities getNSUIntegerValue:&v68 forKey:@"VNOpticalFlowGeneratorOption_ComputationAccuracy" inOptions:v19 error:a8])
  {
LABEL_33:

    goto LABEL_34;
  }
  float v23 = ceilf(logf(8.0 / (float)v17) / -0.69315);
  float v24 = ceilf(logf(8.0 / (float)v15) / -0.69315);
  if (v23 >= v24) {
    float v25 = v24;
  }
  else {
    float v25 = v23;
  }
  int v26 = 0;
  int v27 = 2;
  int v28 = 3;
  switch(v68)
  {
    case 0:
      break;
    case 1:
      int v26 = 0;
      goto LABEL_17;
    case 2:
      int v26 = 1;
LABEL_17:
      int v28 = 5;
      break;
    case 3:
      int v26 = 1;
      int v28 = 7;
      int v27 = 1;
      break;
    default:
      if (a8)
      {
        v41 = [NSNumber numberWithUnsignedInteger:v68];
        *a8 = +[VNError errorForInvalidOption:v41 named:@"VNOpticalFlowGeneratorOption_ComputationAccuracy"];
      }
      goto LABEL_33;
  }
  unsigned int v58 = v26;
  unsigned int v59 = v28;
  unsigned int v57 = v27;
  v30 = v22;
  uint64_t v31 = v69;
  v62 = v30;

  texture = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, v15, v17, v31, a8);
  if (texture)
  {
    v32 = +[VNValidationUtilities requiredArrayForKey:@"VNOpticalFlowGeneratorProcessOption_FromAndToPixelBuffers" inOptions:v19 withElementsOfClass:0 error:a8];
    v60 = v32;
    if (!v32)
    {
      v40 = 0;
LABEL_63:

      CVPixelBufferRelease(texture);
      goto LABEL_64;
    }
    +[VNError VNAssert:log:](VNError, "VNAssert:log:", [v32 count] == 2, @"Unexpected number of buffers for optical flow processing");
    v33 = [v60 objectAtIndexedSubscript:0];

    v34 = [v60 objectAtIndexedSubscript:1];

    v56 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v19 error:a8];
    if (!v56)
    {
      v40 = 0;
LABEL_62:

      goto LABEL_63;
    }
    uint64_t v35 = [(VNDetector *)self computeDeviceForComputeStage:@"VNComputeStageMain" processingOptions:v19 error:a8];
    v55 = (void *)v35;
    if (!v35)
    {
      v40 = 0;
LABEL_61:

      goto LABEL_62;
    }
    BOOL v36 = +[VNComputeDeviceUtilities isCPUComputeDevice:v35];
    CVPixelBufferRef pixelBuffer = texture;
    CVPixelBufferRetain(texture);
    v66 = (__CVBuffer *)v33;
    if (v33) {
      CVPixelBufferRetain((CVPixelBufferRef)v33);
    }
    v65 = (__CVBuffer *)v34;
    if (v34) {
      CVPixelBufferRetain((CVPixelBufferRef)v34);
    }
    v37 = [(__CVBuffer *)v62 opticalFlow];
    id v38 = v37;
    if (v37 && (unint64_t)v25 == (int)[v37 levelCount])
    {
      int v39 = 1;
    }
    else
    {
      [(__CVBuffer *)v62 setOpticalFlow:0];
      CVPixelBufferRef v70 = pixelBuffer;
      CVPixelBufferRetain(pixelBuffer);
      BOOL v43 = v36;
      size_t Width = CVPixelBufferGetWidth(v70);
      size_t Height = CVPixelBufferGetHeight(v70);
      if (v43)
      {
        v45 = [[VNLKTOpticalFlowCPU alloc] initWithWidth:Width height:Height numScales:(unint64_t)v25];
        uint64_t v46 = (uint64_t)v45;
        if (a8 && !v45)
        {
          +[VNError errorForMemoryAllocationFailure];
          uint64_t v46 = 0;
          *a8 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v47 = [VNLKTOpticalFlowGPU alloc];
        v48 = [(VNDetector *)self metalContext];
        uint64_t v46 = [(VNLKTOpticalFlowGPU *)v47 initWithMetalContext:v48 width:Width height:Height numScales:(unint64_t)v25 error:a8];
      }
      apple::vision::CVPixelBufferWrapper::~CVPixelBufferWrapper(&v70);
      if (!v46)
      {
        id v38 = 0;
        goto LABEL_56;
      }
      int v39 = 0;
      id v38 = (id)v46;
    }
    [v38 setOutputPixelFormat:v31];
    [v38 setNumWarpings:v59];
    [v38 setUseNonLocalRegularization:v58];
    objc_msgSend(v38, "setNlreg_radius:", 4);
    objc_msgSend(v38, "setNlreg_padding:", v57);
    LODWORD(v49) = 6.0;
    objc_msgSend(v38, "setNlreg_sigma_l:", v49);
    LODWORD(v50) = 2.0;
    objc_msgSend(v38, "setNlreg_sigma_c:", v50);
    LODWORD(v51) = 1045220557;
    objc_msgSend(v38, "setNlreg_sigma_w:", v51);
    if ([v38 setOutputUV:pixelBuffer error:a8])
    {
      if (v39)
      {
        if (([v38 estimateFlowStream:v65 error:a8] & 1) == 0) {
          goto LABEL_56;
        }
LABEL_55:
        [v38 waitUntilCompleted];
        id v38 = v38;
        v52 = v38;
LABEL_57:

        apple::vision::CVPixelBufferWrapper::~CVPixelBufferWrapper(&v65);
        apple::vision::CVPixelBufferWrapper::~CVPixelBufferWrapper(&v66);
        apple::vision::CVPixelBufferWrapper::~CVPixelBufferWrapper(&pixelBuffer);
        if (v52)
        {
          v53 = [(VNPixelBufferObservation *)[VNOpticalFlowObservation alloc] initWithOriginatingRequestSpecifier:v56 featureName:0 CVPixelBuffer:texture];
          [(VNOpticalFlowObservation *)v53 setOpticalFlow:v52];
          v71[0] = v53;
          v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:1];
        }
        else
        {
          v40 = 0;
        }

        goto LABEL_61;
      }
      if ([v38 estimateFlowFromReference:v66 target:v65 error:a8]) {
        goto LABEL_55;
      }
    }
LABEL_56:
    v52 = 0;
    goto LABEL_57;
  }
  v40 = 0;
LABEL_64:

LABEL_35:

  return v40;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v15 = a4;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __129__VNOpticalFlowGeneratorRevision1_createRegionOfInterestCrop_options_qosClass_warningRecorder_pixelBuffer_error_progressHandler___block_invoke;
  v35[3] = &unk_1E5B20040;
  v35[4] = self;
  if (+[VNValidationUtilities validateNonZeroImageWidth:(unint64_t)width & 0xFFFFFFFFFFFFFFFELL height:(unint64_t)height & 0xFFFFFFFFFFFFFFFELL componentNameProvidingBlock:v35 error:a8])
  {
    int v28 = [(VNOpticalFlowGenerator *)self validatedImageBuffersFromOptions:v15 error:a8];
    if (v28)
    {
      v30 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id obj = v28;
      id v16 = 0;
      uint64_t v17 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v32;
        while (2)
        {
          uint64_t v19 = 0;
          BOOL v20 = v16;
          do
          {
            if (*(void *)v32 != v18) {
              objc_enumerationMutation(obj);
            }
            v21 = *(void **)(*((void *)&v31 + 1) + 8 * v19);
            if (v20)
            {
              uint64_t v22 = [*(id *)(*((void *)&v31 + 1) + 8 * v19) width];
              if (v22 != [v20 width]
                || (uint64_t v23 = [v21 height], v23 != objc_msgSend(v20, "height")))
              {
                if (a8)
                {
                  +[VNError errorForInvalidOperationWithLocalizedDescription:@"Optical flow cannot be performed on images with different dimensions"];
                  BOOL v26 = 0;
                  *a8 = (id)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  BOOL v26 = 0;
                }
                goto LABEL_21;
              }
            }
            id v16 = v21;

            float v24 = objc_msgSend(v16, "croppedBufferWithWidth:height:format:cropRect:options:error:", (unint64_t)width & 0xFFFFFFFFFFFFFFFELL, (unint64_t)height & 0xFFFFFFFFFFFFFFFELL, 1111970369, v15, a8, x, y, width, height);
            if (!v24)
            {
              BOOL v26 = 0;
              goto LABEL_20;
            }
            [v30 addObject:v24];

            ++v19;
            BOOL v20 = v16;
          }
          while (v17 != v19);
          uint64_t v17 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }

      [v15 setObject:v30 forKeyedSubscript:@"VNOpticalFlowGeneratorProcessOption_FromAndToPixelBuffers"];
      float v25 = [NSNumber numberWithUnsignedLong:(unint64_t)width & 0xFFFFFFFFFFFFFFFELL];
      [v15 setObject:v25 forKeyedSubscript:@"VNOpticalFlowGeneratorProcessOption_ROIWidth"];

      id obj = [NSNumber numberWithUnsignedLong:(unint64_t)height & 0xFFFFFFFFFFFFFFFELL];
      objc_msgSend(v15, "setObject:forKeyedSubscript:");
      BOOL v26 = 1;
LABEL_20:
      BOOL v20 = v16;
LABEL_21:
    }
    else
    {
      BOOL v26 = 0;
    }
  }
  else
  {
    BOOL v26 = 0;
  }

  return v26;
}

NSString *__129__VNOpticalFlowGeneratorRevision1_createRegionOfInterestCrop_options_qosClass_warningRecorder_pixelBuffer_error_progressHandler___block_invoke()
{
  v0 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v0);
}

@end