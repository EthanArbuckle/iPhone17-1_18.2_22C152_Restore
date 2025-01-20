@interface VNImageprintGenerator
+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4;
- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9;
- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9;
@end

@implementation VNImageprintGenerator

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
  v24[1] = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  uint64_t v23 = 0;
  if (+[VNValidationUtilities getNSUIntegerValue:&v23 forKey:@"VNImageprintGeneratorProcessOption_Timestamp" inOptions:v11 error:a8])
  {
    v12 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v11 error:a8];
    if (v12)
    {
      v13 = [(VNObservation *)[VNImageprintObservation alloc] initWithOriginatingRequestSpecifier:v12];
      v14 = [VNMPImageData alloc];
      v15 = [(VNObservation *)v13 uuid];
      v16 = [v15 UUIDString];
      v17 = [(VNMPImageData *)v14 initWithCVPixelBufferImage:a4 externalImageId:v16 andExifTimestampValue:v23 error:a8];

      if (v17)
      {
        v18 = objc_alloc_init(VNMPContext);
        v19 = [[VNMPImageDescriptor alloc] initWithImageData:v17 andCustomQualityScore:v18 context:a8 error:0.0];
        if (v19)
        {
          v20 = [[VNImageprint alloc] initWithImageDescriptor:v19 type:0 originatingRequestSpecifier:v12];
          [(VNImageprintObservation *)v13 setImageprint:v20];
          v24[0] = v13;
          v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
        }
        else
        {
          v21 = 0;
        }
      }
      else
      {
        v21 = 0;
      }
    }
    else
    {
      v21 = 0;
    }
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v12 = a4;
  v13 = [(VNDetector *)self validatedImageBufferFromOptions:v12 error:a8];
  v14 = v13;
  if (!v13) {
    goto LABEL_15;
  }
  uint64_t v15 = [v13 width];
  unint64_t v16 = (v15 & 0xFFFFFFFFFFFFFFFELL) != 0 ? v15 & 0xFFFFFFFFFFFFFFFELL : 2;
  uint64_t v17 = [v14 height];
  unint64_t v18 = (v17 & 0xFFFFFFFFFFFFFFFELL) != 0 ? v17 & 0xFFFFFFFFFFFFFFFELL : 2;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __119__VNImageprintGenerator_createRegionOfInterestCrop_options_qosClass_warningRecorder_pixelBuffer_error_progressHandler___block_invoke;
  v23[3] = &unk_1E5B20040;
  v23[4] = self;
  if (+[VNValidationUtilities validateNonZeroImageWidth:v16 height:v18 componentNameProvidingBlock:v23 error:a8])
  {
    if (v16 <= v18) {
      unint64_t v19 = v18;
    }
    else {
      unint64_t v19 = v16;
    }
    if (v19 >= 0x191)
    {
      if (v16 <= v18)
      {
        unint64_t v18 = vcvtms_u32_f32((float)((float)v16 * 400.0) / (float)v18);
        unint64_t v16 = 400;
      }
      else
      {
        unint64_t v16 = vcvtms_u32_f32((float)((float)v18 * 400.0) / (float)v16);
        unint64_t v18 = 400;
      }
    }
    v21 = (__CVBuffer *)[v14 bufferWithWidth:v18 height:v16 format:32 options:v12 error:a8];
    *a7 = v21;
    BOOL v20 = v21 != 0;
  }
  else
  {
LABEL_15:
    BOOL v20 = 0;
  }

  return v20;
}

NSString *__119__VNImageprintGenerator_createRegionOfInterestCrop_options_qosClass_warningRecorder_pixelBuffer_error_progressHandler___block_invoke()
{
  v0 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v0);
}

@end