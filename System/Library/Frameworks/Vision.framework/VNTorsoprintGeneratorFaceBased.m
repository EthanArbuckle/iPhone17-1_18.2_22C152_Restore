@interface VNTorsoprintGeneratorFaceBased
+ (CGSize)torsoprintDescriptorSize;
+ (CGSize)torsoprintInputImageSizeForFaceOrientation:(int)a3;
+ (float)magnifiedBBoxScaleFactor;
+ (float)minimumTorsoInsideInputImageThreshold;
- (BOOL)_calculateTorsoBBoxFromFaceBBox:(CGRect)a3 insideImageWithSize:(CGSize)a4 faceOrientationRelativeToUpright:(int)a5 torsoBBox:(CGRect *)a6 error:(id *)a7;
- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9;
- (id)internalProcessUsingQualityOfServiceClass:(unsigned int)a3 options:(id)a4 regionOfInterest:(CGRect)a5 warningRecorder:(id)a6 error:(id *)a7 progressHandler:(id)a8;
- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9;
- (id)torsoprintForImageBuffer:(__CVBuffer *)a3 requestRevision:(unint64_t)a4 error:(id *)a5;
@end

@implementation VNTorsoprintGeneratorFaceBased

- (BOOL)_calculateTorsoBBoxFromFaceBBox:(CGRect)a3 insideImageWithSize:(CGSize)a4 faceOrientationRelativeToUpright:(int)a5 torsoBBox:(CGRect *)a6 error:(id *)a7
{
  if (a6)
  {
    v8 = (CGFloat *)MEMORY[0x1E4F1DB20];
    CGFloat x = *MEMORY[0x1E4F1DB20];
    CGFloat height = a4.height;
    double width = a4.width;
    switch(a5)
    {
      case 1:
        float v12 = (a3.origin.x + a3.size.width * -0.5) * a4.width;
        a3.origin.CGFloat x = roundf(v12);
        a3.origin.CGFloat y = a3.origin.y + a3.size.height * -3.0;
        goto LABEL_9;
      case 3:
        float v15 = (a3.origin.x + a3.size.width * -0.5) * a4.width;
        a3.origin.CGFloat x = roundf(v15);
LABEL_9:
        float v16 = a3.origin.y * a4.height;
        float v17 = roundf(v16);
        a3.size.double width = (a3.size.width + a3.size.width) * a4.width;
        *(float *)&a3.size.double width = a3.size.width;
        *(float *)&a3.size.double width = roundf(*(float *)&a3.size.width);
        a4.double width = 4.0;
        double v18 = a3.size.height * 4.0;
        goto LABEL_12;
      case 6:
        goto LABEL_11;
      case 8:
        a3.origin.CGFloat x = a3.origin.x + a3.size.width * -3.0;
LABEL_11:
        float v19 = a3.origin.x * a4.width;
        a3.origin.CGFloat x = roundf(v19);
        float v20 = (a3.origin.y + a3.size.height * -0.5) * a4.height;
        float v17 = roundf(v20);
        a4.double width = 4.0;
        a3.size.double width = a3.size.width * 4.0 * width;
        *(float *)&a3.size.double width = a3.size.width;
        *(float *)&a3.size.double width = roundf(*(float *)&a3.size.width);
        double v18 = a3.size.height + a3.size.height;
LABEL_12:
        a3.size.CGFloat height = v18 * a4.height;
        *(float *)&a3.size.CGFloat height = a3.size.height;
        *(float *)&a3.size.CGFloat height = roundf(*(float *)&a3.size.height);
        double v21 = *(float *)&a3.size.height;
        double v22 = *(float *)&a3.size.width;
        a3.origin.CGFloat y = v17;
        CGFloat x = a3.origin.x;
        CGFloat y = a3.origin.y;
        double v35 = *(float *)&a3.size.width;
        double v36 = *(float *)&a3.size.height;
        if (*(float *)&a3.size.width != 0.0 && *(float *)&a3.size.height != 0.0)
        {
          uint64_t v23 = 0;
          uint64_t v24 = 0;
          double v25 = *(float *)&a3.size.width;
          double v26 = *(float *)&a3.size.height;
          CGRect v37 = CGRectIntersection(a3, *(CGRect *)(&width - 2));
          float v27 = v37.size.width * v37.size.height / (v22 * v21);
          objc_msgSend((id)objc_opt_class(), "minimumTorsoInsideInputImageThreshold", *(void *)&x, *(void *)&y, *(void *)&v35, *(void *)&v36);
          p_CGFloat x = &x;
          if (v29 > v27) {
            p_CGFloat x = v8;
          }
          CGSize v30 = (CGSize)*((_OWORD *)p_x + 1);
          a6->origin = *(CGPoint *)p_x;
          a6->size = v30;
          return 1;
        }
        if (!a7) {
          return 0;
        }
        v13 = @"Error in calculating torso bounding box dimensions";
        break;
      default:
        if (a7)
        {
          v14 = objc_msgSend(NSNumber, "numberWithInt:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.width, a4.height, a4.width, a4.height, *(void *)&x);
          *a7 = +[VNError errorForInvalidArgument:v14 named:@"faceOrientationRelativeToUpright"];
        }
        return 0;
    }
    goto LABEL_19;
  }
  if (a7)
  {
    v13 = @"Memory for torso bouding box is not allocated";
LABEL_19:
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v13, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.width, a4.height, *(void *)&x, *(void *)&y, *(void *)&v35, *(void *)&v36);
    id v32 = (id)objc_claimAutoreleasedReturnValue();
    BOOL result = 0;
    *a7 = v32;
    return result;
  }
  return 0;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  v13 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v12 error:a8];
  if (v13)
  {
    v14 = VNCloneFaceObservationFromOptions((uint64_t)v12, a8);
    if (v14)
    {
      float v15 = -[VNTorsoprintGeneratorFaceBased torsoprintForImageBuffer:requestRevision:error:](self, "torsoprintForImageBuffer:requestRevision:error:", a4, [v13 requestRevision], a8);
      if (v15)
      {
        [v14 setTorsoprint:v15];
        v18[0] = v14;
        float v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
      }
      else
      {
        float v16 = 0;
      }
    }
    else
    {
      float v16 = 0;
    }
  }
  else
  {
    float v16 = 0;
  }

  return v16;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v12 = a4;
  v13 = [(VNDetector *)self validatedImageBufferFromOptions:v12 error:a8];
  if (v13)
  {
    v14 = [v12 objectForKeyedSubscript:@"VNImageBufferOption_FeatureOrientationRelativeToUpRight"];
    uint64_t v15 = [v14 integerValue];

    [(id)objc_opt_class() torsoprintInputImageSizeForFaceOrientation:v15];
    double v17 = v16;
    double v19 = v18;
    float v20 = [v12 objectForKeyedSubscript:@"VNDetectorInternalProcessOption_TorsoBBox_X"];
    [v20 doubleValue];
    double v22 = v21;
    uint64_t v23 = [v12 objectForKeyedSubscript:@"VNDetectorInternalProcessOption_TorsoBBox_Y"];
    [v23 doubleValue];
    double v25 = v24;
    double v26 = [v12 objectForKeyedSubscript:@"VNDetectorInternalProcessOption_TorsoBBox_Width"];
    [v26 doubleValue];
    double v28 = v27;
    float v29 = [v12 objectForKeyedSubscript:@"VNDetectorInternalProcessOption_TorsoBBox_Height"];
    [v29 doubleValue];
    double v31 = v30;

    [v12 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"VNImageBufferOption_CreateFromPixelBufferPool"];
    id v32 = (__CVBuffer *)objc_msgSend(v13, "croppedBufferWithWidth:height:format:cropRect:options:error:", (unint64_t)v17, (unint64_t)v19, 1111970369, v12, a8, v22, v25, v28, v31);
    *a7 = v32;
    BOOL v33 = v32 != 0;
  }
  else
  {
    BOOL v33 = 0;
  }

  return v33;
}

- (id)internalProcessUsingQualityOfServiceClass:(unsigned int)a3 options:(id)a4 regionOfInterest:(CGRect)a5 warningRecorder:(id)a6 error:(id *)a7 progressHandler:(id)a8
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  v50[1] = *MEMORY[0x1E4F143B8];
  id v17 = a4;
  id v18 = a6;
  id v19 = a8;
  float v20 = [(VNDetector *)self validatedImageBufferFromOptions:v17 error:a7];
  if (v20)
  {
    double v21 = +[VNValidationUtilities requiredFaceObservationInOptions:v17 error:a7];
    if (!v21) {
      goto LABEL_8;
    }
    [v20 orientation];
    if ((VNSetFaceOrientationInOptionsDictionary(v21, v17, a7) & 1) == 0) {
      goto LABEL_8;
    }
    double v22 = [v17 objectForKeyedSubscript:@"VNImageBufferOption_FeatureOrientationRelativeToUpRight"];
    unsigned int v47 = a3;
    uint64_t v23 = [v22 integerValue];

    unint64_t v24 = [v20 width];
    unint64_t v25 = [v20 height];
    [v21 unalignedBoundingBox];
    CGFloat v27 = v26;
    CGFloat v29 = v28;
    double v31 = v30;
    double v33 = v32;
    [(id)objc_opt_class() magnifiedBBoxScaleFactor];
    double v35 = (float)(v34 + -1.0);
    CGFloat v36 = -(v31 * v35) * 0.5;
    CGFloat v37 = -(v33 * v35) * 0.5;
    v52.origin.double x = v27;
    v52.origin.double y = v29;
    v52.size.double width = v31;
    v52.size.double height = v33;
    CGRect v53 = CGRectInset(v52, v36, v37);
    CGSize v38 = *(CGSize *)(MEMORY[0x1E4F1DB10] + 16);
    v49.origin = (CGPoint)*MEMORY[0x1E4F1DB10];
    v49.size = v38;
    if (-[VNTorsoprintGeneratorFaceBased _calculateTorsoBBoxFromFaceBBox:insideImageWithSize:faceOrientationRelativeToUpright:torsoBBox:error:](self, "_calculateTorsoBBoxFromFaceBBox:insideImageWithSize:faceOrientationRelativeToUpright:torsoBBox:error:", v23, &v49, a7, v53.origin.x, v53.origin.y, v53.size.width, v53.size.height, (double)v24, (double)v25))
    {
      if (CGRectIsNull(v49))
      {
        uint64_t v39 = VNCloneFaceObservationFromOptions((uint64_t)v17, a7);
        v40 = (void *)v39;
        if (v39)
        {
          v50[0] = v39;
          v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:1];
        }
        else
        {
          v41 = 0;
        }
      }
      else
      {
        v43 = [NSNumber numberWithDouble:v49.origin.x];
        [v17 setObject:v43 forKeyedSubscript:@"VNDetectorInternalProcessOption_TorsoBBox_X"];

        v44 = [NSNumber numberWithDouble:v49.origin.y];
        [v17 setObject:v44 forKeyedSubscript:@"VNDetectorInternalProcessOption_TorsoBBox_Y"];

        v45 = [NSNumber numberWithDouble:v49.size.width];
        [v17 setObject:v45 forKeyedSubscript:@"VNDetectorInternalProcessOption_TorsoBBox_Width"];

        v46 = [NSNumber numberWithDouble:v49.size.height];
        [v17 setObject:v46 forKeyedSubscript:@"VNDetectorInternalProcessOption_TorsoBBox_Height"];

        v48.receiver = self;
        v48.super_class = (Class)VNTorsoprintGeneratorFaceBased;
        v41 = -[VNDetector internalProcessUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:](&v48, sel_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler_, v47, v17, v18, a7, v19, x, y, width, height);
      }
    }
    else
    {
LABEL_8:
      v41 = 0;
    }
  }
  else
  {
    v41 = 0;
  }

  return v41;
}

- (id)torsoprintForImageBuffer:(__CVBuffer *)a3 requestRevision:(unint64_t)a4 error:(id *)a5
{
  return 0;
}

+ (float)magnifiedBBoxScaleFactor
{
  return 1.7647;
}

+ (float)minimumTorsoInsideInputImageThreshold
{
  return 0.5;
}

+ (CGSize)torsoprintDescriptorSize
{
  double v2 = 128.0;
  double v3 = 1.0;
  result.double height = v3;
  result.double width = v2;
  return result;
}

+ (CGSize)torsoprintInputImageSizeForFaceOrientation:(int)a3
{
  double v3 = 128.0;
  if (a3 <= 4) {
    double v4 = 128.0;
  }
  else {
    double v4 = 256.0;
  }
  if (a3 <= 4) {
    double v3 = 256.0;
  }
  result.double height = v3;
  result.double width = v4;
  return result;
}

@end