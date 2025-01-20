@interface BWInferenceVideoScalingProvider
+ (void)initialize;
- (BOOL)allowsAsyncPropagation;
- (BOOL)mustExecuteWhenAllowed;
- (BWInferenceExtractable)extractable;
- (BWInferenceSubmittable)submittable;
- (BWInferenceVideoScalingProvider)initWithInputRequirement:(id)a3 derivedFromRequirement:(id)a4 outputRequirements:(id)a5 enableFencing:(BOOL)a6;
- (NSArray)cloneVideoRequirements;
- (NSArray)inputMetadataRequirements;
- (NSArray)inputVideoRequirements;
- (NSArray)outputMetadataRequirements;
- (NSArray)outputVideoRequirements;
- (NSSet)preventionReasons;
- (NSString)description;
- (id)bindOutputByCloningInputRequirement:(id)a3 toAttachedMediaUsingKey:(id)a4;
- (id)newStorage;
- (id)preventionReasonWithSampleBuffer:(opaqueCMSampleBuffer *)a3 executionTime:(id *)a4;
- (int)executeOnSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withExecutionTime:(id *)a5 completionHandler:(id)a6;
- (int)executionTarget;
- (int)prepareForExecution;
- (int)prewarmUsingLimitedMemory:(BOOL)a3;
- (int)type;
- (uint64_t)_configureCustomFiltersForScalingFromSourceWidth:(unint64_t)a3 sourceHeight:(unint64_t)a4 destinationWidth:(unint64_t)a5 destinationHeight:(int)a6 pixelFormat:;
- (unsigned)allowedPixelBufferCompressionDirection;
- (void)dealloc;
- (void)propagateInferenceResultsToInferenceDictionary:(id)a3 usingStorage:(id)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 propagationSampleBuffer:(opaqueCMSampleBuffer *)a6;
@end

@implementation BWInferenceVideoScalingProvider

- (NSArray)inputVideoRequirements
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend((id)objc_msgSend(-[NSArray firstObject](self->_outputRequirements, "firstObject"), "videoFormat"), "cropDescriptor")&& (derivedFromRequirement = self->_derivedFromRequirement) != 0)
  {
    inputRequirement = self->_inputRequirement;
    v10 = derivedFromRequirement;
    v4 = (void *)MEMORY[0x1E4F1C978];
    p_inputRequirement = &inputRequirement;
    uint64_t v6 = 2;
  }
  else
  {
    v8 = self->_inputRequirement;
    v4 = (void *)MEMORY[0x1E4F1C978];
    p_inputRequirement = &v8;
    uint64_t v6 = 1;
  }
  return (NSArray *)objc_msgSend(v4, "arrayWithObjects:count:", p_inputRequirement, v6, v8, inputRequirement, v10);
}

- (BWInferenceVideoScalingProvider)initWithInputRequirement:(id)a3 derivedFromRequirement:(id)a4 outputRequirements:(id)a5 enableFencing:(BOOL)a6
{
  v12.receiver = self;
  v12.super_class = (Class)BWInferenceVideoScalingProvider;
  v10 = [(BWInferenceVideoScalingProvider *)&v12 init];
  if (v10)
  {
    v10->_inputRequirement = (BWInferenceVideoRequirement *)a3;
    v10->_outputRequirements = (NSArray *)a5;
    v10->_derivedFromRequirement = (BWInferenceVideoRequirement *)a4;
    v10->_enableFencing = a6;
    v10->_cloneVideoRequirements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  return v10;
}

- (id)preventionReasonWithSampleBuffer:(opaqueCMSampleBuffer *)a3 executionTime:(id *)a4
{
  if (self->_applyUprightExifOrientation
    && !CMGetAttachment(a3, @"UprightExifOrientation", 0)
    && !objc_msgSend((id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F53248]))
  {
    return @"MissingOrientationInformation";
  }
  if (self->_applyCustomCrop)
  {
    id v6 = [(NSArray *)self->_outputRequirements firstObject];
    if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "videoFormat"), "cropDescriptor"), "applicableToSampleBuffer:forMediaKey:", a3, objc_msgSend(v6, "attachedMediaKey")))return @"CropNotApplicable"; {
  }
    }
  return 0;
}

- (int)type
{
  return 0;
}

- (id)newStorage
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v3 = [BWInferenceProviderStorage alloc];
  v5[0] = self->_inputRequirement;
  return -[BWInferenceProviderStorage initWithRequirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:](v3, "initWithRequirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:", [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1], self->_outputRequirements);
}

- (int)prepareForExecution
{
  v3 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  v4 = [(BWInferenceVideoRequirement *)self->_inputRequirement videoFormat];
  v5 = objc_msgSend(-[NSArray firstObject](self->_outputRequirements, "firstObject"), "videoFormat");
  int v6 = [(BWInferenceVideoFormat *)v4 rotationDegrees];
  int v7 = [v5 rotationDegrees];
  self->_offsetRotationDegrees = v6 - v7;
  if ((float)((float)((float)(v6 - v7) / 90.0) - (float)(int)(float)((float)(v6 - v7) / 90.0)) != 0.0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Rotations must be a multiple of 90" userInfo:0]);
  }
  if ([v5 deviceOriented]) {
    BOOL v8 = ![(BWInferenceVideoFormat *)v4 deviceOriented];
  }
  else {
    LOBYTE(v8) = 0;
  }
  self->_applyUprightExifOrientation = v8;
  BOOL v9 = [v5 videoContentMode] == 1
    && [(BWInferenceVideoFormat *)v4 videoContentMode] != 1;
  self->_computeAndApplyAspectRatioCrop = v9;
  BOOL v10 = ([v5 includesInvalidContent] & 1) == 0
     && [(BWInferenceVideoFormat *)v4 includesInvalidContent];
  self->_applyValidBufferRect = v10;
  int v11 = objc_msgSend((id)objc_msgSend(v5, "cropDescriptor"), "identifier");
  self->_applyCustomCrop = v11 != [(BWInferenceCropDescriptor *)[(BWInferenceVideoFormat *)v4 cropDescriptor] identifier];
  float v12 = (float)(unint64_t)[v5 width];
  self->_outputAspectRatio = v12 / (float)(unint64_t)[v5 height];
  self->_colorSpaceProperties = (NSDictionary *)+[BWVideoFormat pixelBufferAttachmentsForColorSpaceProperties:](BWVideoFormat, "pixelBufferAttachmentsForColorSpaceProperties:", [v5 colorSpaceProperties]);
  self->_scalerController = (FigM2MController *)objc_alloc_init(MEMORY[0x1E4F55F38]);
  -[BWInferenceVideoScalingProvider _configureCustomFiltersForScalingFromSourceWidth:sourceHeight:destinationWidth:destinationHeight:pixelFormat:]((uint64_t)self, -[BWInferenceVideoFormat width](v4, "width"), -[BWInferenceVideoFormat height](v4, "height"), [v5 width], objc_msgSend(v5, "height"), -[BWInferenceVideoFormat pixelFormat](v4, "pixelFormat"));
  if (*v3 == 1) {
    kdebug_trace();
  }
  return 0;
}

- (uint64_t)_configureCustomFiltersForScalingFromSourceWidth:(unint64_t)a3 sourceHeight:(unint64_t)a4 destinationWidth:(unint64_t)a5 destinationHeight:(int)a6 pixelFormat:
{
  if (!result) {
    return result;
  }
  uint64_t v11 = result;
  if (FigCapturePixelFormatIs420(a6))
  {
    result = FigCapturePixelFormatIs420(a6);
LABEL_5:
    a4 &= ~1uLL;
    a2 &= ~1uLL;
    goto LABEL_6;
  }
  int v14 = FigCapturePixelFormatIs422(a6);
  result = FigCapturePixelFormatIs420(a6);
  if (v14) {
    goto LABEL_5;
  }
LABEL_6:
  if (result) {
    unint64_t v15 = a3 & 0xFFFFFFFFFFFFFFFELL;
  }
  else {
    unint64_t v15 = a3;
  }
  if (result) {
    unint64_t v16 = a5 & 0xFFFFFFFFFFFFFFFELL;
  }
  else {
    unint64_t v16 = a5;
  }
  float v17 = (float)v16 / (float)v15;
  float v18 = (float)a4 / (float)a2;
  if (v17 != *(float *)(v11 + 68) || v18 != *(float *)(v11 + 64))
  {
    LODWORD(v12) = 1.0;
    LODWORD(v13) = 1.0;
    result = objc_msgSend(*(id *)(v11 + 56), "setCustomFilter:alignment:sourceWidth:sourceHeight:destinationWidth:destinationHeight:luma_param:chroma_param:", 3, 2, a2, v12, v13);
    *(float *)(v11 + 64) = v18;
    *(float *)(v11 + 68) = v17;
  }
  return result;
}

- (BWInferenceSubmittable)submittable
{
  return 0;
}

+ (void)initialize
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWInferenceVideoScalingProvider;
  [(BWInferenceVideoScalingProvider *)&v3 dealloc];
}

- (NSString)description
{
  v3.receiver = self;
  v3.super_class = (Class)BWInferenceVideoScalingProvider;
  return [(NSString *)[(BWInferenceVideoScalingProvider *)&v3 description] stringByAppendingFormat:@" applyUprightExifOrientation:%d applyValidBufferRect:%d computeAndApplyAspectRatioCrop:%d rotation:%d", self->_applyUprightExifOrientation, self->_applyValidBufferRect, self->_computeAndApplyAspectRatioCrop, self->_offsetRotationDegrees];
}

- (BWInferenceExtractable)extractable
{
  return 0;
}

- (NSArray)outputVideoRequirements
{
  return self->_outputRequirements;
}

- (NSArray)inputMetadataRequirements
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (NSArray)outputMetadataRequirements
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (unsigned)allowedPixelBufferCompressionDirection
{
  return 0;
}

- (int)executionTarget
{
  return 5;
}

- (NSSet)preventionReasons
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] set];
}

- (int)prewarmUsingLimitedMemory:(BOOL)a3
{
  return 0;
}

- (int)executeOnSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withExecutionTime:(id *)a5 completionHandler:(id)a6
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  BOOL v10 = (__CVBuffer *)[a4 pixelBufferForRequirement:self->_inputRequirement];
  uint64_t v11 = (void *)[a4 inputSampleBufferAttachments];
  r1[0] = (id)[v11 objectForKeyedSubscript:*MEMORY[0x1E4F53070]];
  id v12 = [(NSArray *)self->_outputRequirements firstObject];
  double v13 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(a4, "pixelBufferPoolForRequirement:", v12), "newPixelBuffer");
  double v14 = (double)(unint64_t)objc_msgSend((id)objc_msgSend(v12, "videoFormat"), "width");
  double v15 = (double)(unint64_t)objc_msgSend((id)objc_msgSend(v12, "videoFormat"), "height");
  unint64_t v16 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (v13)
  {
    CVBufferSetAttachments(v13, (CFDictionaryRef)self->_colorSpaceProperties, kCVAttachmentMode_ShouldPropagate);
    double v95 = v14;
    if (*v16 == 1) {
      kdebug_trace();
    }
    unint64_t v89 = (unint64_t)v15;
    unint64_t v90 = (unint64_t)v14;
    r1[2] = [(BWInferenceVideoRequirement *)self->_inputRequirement videoFormat];
    v99 = objc_msgSend(-[NSArray firstObject](self->_outputRequirements, "firstObject"), "videoFormat");
    size_t Width = CVPixelBufferGetWidth(v10);
    size_t Height = CVPixelBufferGetHeight(v10);
    int applyUprightExifOrientation = self->_applyUprightExifOrientation;
    int offsetRotationDegrees = self->_offsetRotationDegrees;
    BOOL applyValidBufferRect = self->_applyValidBufferRect;
    BOOL computeAndApplyAspectRatioCrop = self->_computeAndApplyAspectRatioCrop;
    CGFloat x = *MEMORY[0x1E4F1DB20];
    CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v24 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v23 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    double v91 = v23;
    double v92 = v24;
    double v93 = y;
    double v94 = *MEMORY[0x1E4F1DB20];
    if (self->_applyCustomCrop)
    {
      cf.a = 0.0;
      *(_OWORD *)&sampleTimingArray[0].decodeTimeStamp.timescale = 0u;
      *(_OWORD *)&sampleTimingArray[0].presentationTimeStamp.epoch = 0u;
      *(_OWORD *)&sampleTimingArray[0].presentationTimeStamp.value = 0u;
      *(_OWORD *)&sampleTimingArray[0].duration.value = *MEMORY[0x1E4F1F9F8];
      sampleTimingArray[0].duration.epoch = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
      CMSampleBufferGetPresentationTimeStamp(&sampleTimingArray[0].presentationTimeStamp, a3);
      sampleTimingArray[0].decodeTimeStamp = sampleTimingArray[0].duration;
      CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 1u, 0, 0, 0, 0, 1, sampleTimingArray, 0, 0, (CMSampleBufferRef *)&cf);
      CMSetAttachments(*(CMAttachmentBearerRef *)&cf.a, (CFDictionaryRef)[a4 inputSampleBufferAttachments], 1u);
      v25 = (void *)[v99 cropDescriptor];
      [v25 rectForSampleBuffer:*(void *)&cf.a];
      CGFloat x = v26;
      CGFloat y = v27;
      double v24 = v28;
      double v23 = v29;
      if (*(void *)&cf.a) {
        CFRelease(*(CFTypeRef *)&cf.a);
      }
    }
    *(double *)&r1[1] = (double)Width;
    double v30 = (double)Height;
    v110.origin.CGFloat x = x;
    v110.origin.CGFloat y = y;
    v110.size.width = v24;
    v110.size.height = v23;
    if (!CGRectIsNull(v110))
    {
      derivedFromRequirement = self->_derivedFromRequirement;
      if (derivedFromRequirement)
      {
        v32 = [(BWInferenceVideoRequirement *)derivedFromRequirement videoFormat];
        uint64_t v33 = [a4 pixelBufferForRequirement:self->_derivedFromRequirement];
        if (v33)
        {
          v34 = (__CVBuffer *)v33;
          if (v24 * *(double *)&r1[1] < (double)(unint64_t)[v99 width]
            && v23 * v30 < (double)(unint64_t)[v99 height])
          {
            v87 = v32;
            int v35 = [(BWInferenceVideoFormat *)v32 rotationDegrees];
            if (v35 - [v99 rotationDegrees] == offsetRotationDegrees)
            {
              size_t v36 = CVPixelBufferGetWidth(v34);
              size_t v37 = CVPixelBufferGetHeight(v34);
              if ([v99 deviceOriented]) {
                int applyUprightExifOrientation = ![(BWInferenceVideoFormat *)v87 deviceOriented];
              }
              else {
                int applyUprightExifOrientation = 0;
              }
              BOOL computeAndApplyAspectRatioCrop = [v99 videoContentMode] == 1
                                            && [(BWInferenceVideoFormat *)v87 videoContentMode] != 1;
              if ([v99 includesInvalidContent])
              {
                BOOL applyValidBufferRect = 0;
                v86 = v87;
              }
              else
              {
                v86 = v87;
                BOOL applyValidBufferRect = [(BWInferenceVideoFormat *)v87 includesInvalidContent];
              }
              *(double *)&r1[1] = (double)v36;
              double v30 = (double)v37;
              r1[2] = v86;
              BOOL v10 = v34;
            }
          }
        }
      }
    }
    if (applyUprightExifOrientation
      && ((v38 = objc_msgSend((id)objc_msgSend(a4, "inputSampleBufferAttachments"), "objectForKeyedSubscript:", 0x1EFA73AC0)) != 0|| (v38 = objc_msgSend(r1[0], "objectForKeyedSubscript:", *MEMORY[0x1E4F53248])) != 0))
    {
      v39 = (CGAffineTransform *)[v38 intValue];
      unsigned __int8 v107 = 0;
      int v40 = FigCaptureRotationDegreesAndMirroringFromExifOrientation((int)v39, (char *)&v107);
      int v41 = v40;
      int v42 = v107;
      if (v107)
      {
        int v42 = 0;
        uint64_t v43 = 1;
        if (v40 != 90 && v40 != 270)
        {
          uint64_t v43 = 0;
          int v42 = 1;
        }
      }
      else
      {
        uint64_t v43 = 0;
      }
      unsigned int v88 = v42;
      v111.origin.CGFloat x = x;
      v111.origin.CGFloat y = y;
      v111.size.width = v24;
      v111.size.height = v23;
      if (!CGRectIsNull(v111))
      {
        memset(sampleTimingArray, 0, 48);
        FigCaptureExifOrientationGetAffineTransform(v39, 0x100000001, (uint64_t)sampleTimingArray);
        *(_OWORD *)&cf.a = *(_OWORD *)&sampleTimingArray[0].duration.value;
        *(_OWORD *)&cf.c = *(_OWORD *)&sampleTimingArray[0].duration.epoch;
        *(_OWORD *)&cf.tCGFloat x = *(_OWORD *)&sampleTimingArray[0].presentationTimeStamp.timescale;
        v112.origin.CGFloat x = x;
        v112.origin.CGFloat y = y;
        v112.size.width = v24;
        v112.size.height = v23;
        CGRect v113 = CGRectApplyAffineTransform(v112, &cf);
        CGFloat x = v113.origin.x;
        CGFloat y = v113.origin.y;
        double v24 = v113.size.width;
        double v23 = v113.size.height;
      }
    }
    else
    {
      uint64_t v43 = 0;
      unsigned int v88 = 0;
      int v41 = 0;
    }
    int v44 = (int)fmodf((float)(v41 + offsetRotationDegrees), 360.0);
    if (v44 >= 0) {
      int v45 = v44;
    }
    else {
      int v45 = v44 + 360;
    }
    uint64_t v46 = [r1[2] width];
    if (v46 == CVPixelBufferGetWidth(v10))
    {
      [r1[2] height];
      CVPixelBufferGetHeight(v10);
    }
    double v47 = x;
    double v48 = y;
    double v49 = v24;
    double v50 = v23;
    double v97 = v15;
    CGSize v51 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    rect2.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    rect2.size = v51;
    int CGRectIfPresent = FigCFDictionaryGetCGRectIfPresent();
    uint64_t v53 = 0;
    r1[0] = 0;
    double v54 = v30;
    double v55 = 0.0;
    if (applyValidBufferRect)
    {
      double v56 = *(double *)&r1[1];
      if (CGRectIfPresent)
      {
        r1[0] = 0;
        uint64_t v57 = 0;
        double v56 = *(double *)&r1[1];
        id v58 = r1[1];
        double v59 = v30;
        if (CGRectContainsRect(*(CGRect *)&v53, rect2))
        {
          r1[0] = *(id *)&rect2.origin.x;
          double v55 = rect2.origin.y;
          double v56 = rect2.size.width;
          double v30 = rect2.size.height;
        }
      }
    }
    else
    {
      double v56 = *(double *)&r1[1];
    }
    v114.origin.CGFloat x = v47;
    v114.origin.CGFloat y = v48;
    v114.size.width = v49;
    v114.size.height = v50;
    if (CGRectIsNull(v114))
    {
      double v60 = v95;
      double v61 = *(double *)r1;
      if (!computeAndApplyAspectRatioCrop) {
        goto LABEL_45;
      }
    }
    else
    {
      v123.origin.CGFloat x = round(*(double *)&r1[1] * v47);
      v123.origin.CGFloat y = round(v54 * v48);
      v123.size.width = round(*(double *)&r1[1] * (v49 + v47)) - v123.origin.x;
      v123.size.height = round(v54 * (v50 + v48)) - v123.origin.y;
      *(id *)&v115.origin.CGFloat x = r1[0];
      v115.origin.CGFloat y = v55;
      v115.size.width = v56;
      v115.size.height = v30;
      CGRect v116 = CGRectIntersection(v115, v123);
      double v61 = v116.origin.x;
      double v55 = v116.origin.y;
      double v56 = v116.size.width;
      double v30 = v116.size.height;
      double v60 = v95;
      if (!computeAndApplyAspectRatioCrop) {
        goto LABEL_45;
      }
    }
    float outputAspectRatio = self->_outputAspectRatio;
    if (v45 == 270 || v45 == 90) {
      float outputAspectRatio = 1.0 / outputAspectRatio;
    }
    float v62 = v56 / v30;
    if (outputAspectRatio != v62)
    {
      v124.origin.CGFloat x = FigCaptureMetadataUtilitiesRectByCroppingRectToAspectRatio(v61, v55, v56, v30, outputAspectRatio);
      v124.origin.CGFloat y = v64;
      v124.size.width = v65;
      v124.size.height = v66;
      v117.origin.CGFloat x = v61;
      v117.origin.CGFloat y = v55;
      v117.size.width = v56;
      v117.size.height = v30;
      CGRect v118 = CGRectIntersection(v117, v124);
      double v61 = v118.origin.x;
      double v55 = v118.origin.y;
      double v56 = v118.size.width;
      double v30 = v118.size.height;
    }
LABEL_45:
    [(FigM2MController *)self->_scalerController maxUpscale];
    double v68 = ceil(v60 / v67);
    if (v56 >= v68)
    {
      double v68 = v56;
      double v70 = v97;
    }
    else
    {
      v119.origin.CGFloat x = v61;
      v119.origin.CGFloat y = v55;
      v119.size.width = v56;
      v119.size.height = v30;
      double v61 = round(CGRectGetMidX(v119) + v68 * -0.5);
      v120.origin.CGFloat x = v61;
      v120.origin.CGFloat y = v55;
      v120.size.width = v68;
      v120.size.height = v30;
      double MaxX = CGRectGetMaxX(v120);
      if (MaxX > (double)CVPixelBufferGetWidth(v10)) {
        double v61 = (double)CVPixelBufferGetWidth(v10) - v68;
      }
      double v70 = v97;
      if (v61 < 0.0) {
        double v61 = 0.0;
      }
    }
    [(FigM2MController *)self->_scalerController maxUpscale];
    double v72 = ceil(v70 / v71);
    if (v30 >= v72)
    {
      double v72 = v30;
    }
    else
    {
      v121.origin.CGFloat x = v61;
      v121.origin.CGFloat y = v55;
      v121.size.width = v68;
      v121.size.height = v30;
      double v55 = round(CGRectGetMidY(v121) + v72 * -0.5);
      v122.origin.CGFloat x = v61;
      v122.origin.CGFloat y = v55;
      v122.size.width = v68;
      v122.size.height = v72;
      double MaxY = CGRectGetMaxY(v122);
      if (MaxY > (double)CVPixelBufferGetHeight(v10)) {
        double v55 = (double)CVPixelBufferGetHeight(v10) - v72;
      }
      if (v55 < 0.0) {
        double v55 = 0.0;
      }
    }
    uint64_t v74 = 4294935550;
    if (v45 > 179)
    {
      if (v45 == 180)
      {
        uint64_t v75 = 3;
        goto LABEL_66;
      }
      if (v45 == 270)
      {
        uint64_t v75 = 8;
        goto LABEL_66;
      }
    }
    else
    {
      if (!v45)
      {
        uint64_t v75 = 1;
        goto LABEL_66;
      }
      if (v45 == 90)
      {
        uint64_t v75 = 6;
LABEL_66:
        -[BWInferenceVideoScalingProvider _configureCustomFiltersForScalingFromSourceWidth:sourceHeight:destinationWidth:destinationHeight:pixelFormat:]((uint64_t)self, (unint64_t)v68, (unint64_t)v72, v90, v89, [r1[2] pixelFormat]);
        uint64_t v76 = [v99 histogramRequest];
        if (v76 && (*(unsigned int (**)(uint64_t, void *))(v76 + 16))(v76, v99))
        {
          int v77 = 1;
          -[FigM2MController setHistogramMode:dstRect:](self->_scalerController, "setHistogramMode:dstRect:", 1, 0.0, 0.0, (double)(unint64_t)[v99 width], (double)(unint64_t)objc_msgSend(v99, "height"));
        }
        else
        {
          int v77 = 0;
        }
        if (-[FigM2MController transform:srcRect:dst:dstRect:rotate:flipX:flipY:sync_m2m:](self->_scalerController, "transform:srcRect:dst:dstRect:rotate:flipX:flipY:sync_m2m:", v10, v13, v75, v88, v43, !self->_enableFencing, v61, v55, v68, v72, v94, v93, v92, v91))
        {
          uint64_t v74 = 4294935556;
        }
        else
        {
          if (v77)
          {
            bzero(sampleTimingArray, 0x620uLL);
            [(FigM2MController *)self->_scalerController copyHistogram:sampleTimingArray];
            id v78 = objc_alloc(MEMORY[0x1E4F1C9B8]);
            v79 = (void *)[v78 initWithBytes:(char *)&sampleTimingArray[0].duration.value + 4 length:4 * (3 * LODWORD(sampleTimingArray[0].duration.value))];
            CMSetAttachment(v13, @"InferenceHistogramData", v79, 1u);

            [(FigM2MController *)self->_scalerController clearHistorgramMode];
          }
          long long v102 = 0u;
          long long v103 = 0u;
          *(_OWORD *)&r1[3] = 0u;
          long long v101 = 0u;
          outputRequirements = self->_outputRequirements;
          uint64_t v81 = [(NSArray *)outputRequirements countByEnumeratingWithState:&r1[3] objects:v108 count:16];
          if (v81)
          {
            uint64_t v82 = v81;
            uint64_t v83 = *(void *)v101;
            do
            {
              for (uint64_t i = 0; i != v82; ++i)
              {
                if (*(void *)v101 != v83) {
                  objc_enumerationMutation(outputRequirements);
                }
                [a4 setPixelBuffer:v13 forRequirement:*((void *)r1[4] + i)];
              }
              uint64_t v82 = [(NSArray *)outputRequirements countByEnumeratingWithState:&r1[3] objects:v108 count:16];
            }
            while (v82);
          }
          uint64_t v74 = 0;
        }
      }
    }
    CFRelease(v13);
    unint64_t v16 = (_DWORD *)MEMORY[0x1E4F1EBA8];
    goto LABEL_82;
  }
  uint64_t v74 = 4294935553;
LABEL_82:
  if (*v16 == 1) {
    kdebug_trace();
  }
  if (a6) {
    (*((void (**)(id, uint64_t, BWInferenceVideoScalingProvider *))a6 + 2))(a6, v74, self);
  }
  return v74;
}

- (BOOL)mustExecuteWhenAllowed
{
  return 0;
}

- (void)propagateInferenceResultsToInferenceDictionary:(id)a3 usingStorage:(id)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 propagationSampleBuffer:(opaqueCMSampleBuffer *)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  cloneVideoRequirements = self->_cloneVideoRequirements;
  uint64_t v10 = [(NSMutableArray *)cloneVideoRequirements countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(cloneVideoRequirements);
        }
        double v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        double v15 = (const void *)[a4 newSampleBufferSatisfyingCloneRequirement:v14];
        BWSampleBufferSetAttachedMedia(a6, [v14 attachedMediaKey], (uint64_t)v15);
        if (v15) {
          CFRelease(v15);
        }
      }
      uint64_t v11 = [(NSMutableArray *)cloneVideoRequirements countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v11);
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  outputRequirements = self->_outputRequirements;
  uint64_t v17 = [(NSArray *)outputRequirements countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    char v19 = 0;
    uint64_t v20 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v25 != v20) {
          objc_enumerationMutation(outputRequirements);
        }
        v22 = (const void *)[a4 pixelBufferForRequirement:*(void *)(*((void *)&v24 + 1) + 8 * j)];
        CFTypeRef v23 = CMGetAttachment(v22, @"InferenceHistogramData", 0);
        if (v23)
        {
          if ((v19 & 1) == 0) {
            CMSetAttachment(a6, @"InferenceHistogramData", v23, 1u);
          }
          CMRemoveAttachment(v22, @"InferenceHistogramData");
          char v19 = 1;
        }
      }
      uint64_t v18 = [(NSArray *)outputRequirements countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v18);
  }
}

- (BOOL)allowsAsyncPropagation
{
  return self->_enableFencing;
}

- (id)bindOutputByCloningInputRequirement:(id)a3 toAttachedMediaUsingKey:(id)a4
{
  v5 = [[BWInferenceCloneVideoRequirement alloc] initWithAttachedMediaKey:a4 sourceVideoRequirement:a3];
  [(NSMutableArray *)self->_cloneVideoRequirements addObject:v5];
  return v5;
}

- (NSArray)cloneVideoRequirements
{
  return &self->_cloneVideoRequirements->super;
}

@end