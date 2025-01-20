@interface BWInferenceScalingRequirement
- (BWInferenceScalingRequirement)initWithInputVideoRequirement:(id)a3 requestedOutputVideoRequirements:(id)a4 intermediatePixelBufferCompressionType:(int)a5;
- (NSArray)orderedVideoRequirements;
- (void)_appendIntermediateRequirementsToList:(void *)a3 forSatisfyingOutputRequirement:(unsigned int)a4 intermediatePixelBufferCompressionType:;
- (void)dealloc;
@end

@implementation BWInferenceScalingRequirement

- (BWInferenceScalingRequirement)initWithInputVideoRequirement:(id)a3 requestedOutputVideoRequirements:(id)a4 intermediatePixelBufferCompressionType:(int)a5
{
  v12.receiver = self;
  v12.super_class = (Class)BWInferenceScalingRequirement;
  v8 = [(BWInferenceScalingRequirement *)&v12 init];
  if (v8)
  {
    v9 = (void *)[a4 firstObject];
    v10 = (void *)[MEMORY[0x1E4F1CA48] arrayWithObject:a3];
    -[BWInferenceScalingRequirement _appendIntermediateRequirementsToList:forSatisfyingOutputRequirement:intermediatePixelBufferCompressionType:]((uint64_t)v8, v10, v9, a5);
    [v10 addObjectsFromArray:a4];
    v8->_orderedVideoRequirements = (NSArray *)[v10 copy];
  }
  return v8;
}

- (void)_appendIntermediateRequirementsToList:(void *)a3 forSatisfyingOutputRequirement:(unsigned int)a4 intermediatePixelBufferCompressionType:
{
  v75[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v5 = objc_msgSend((id)objc_msgSend(a2, "lastObject"), "videoFormat");
    v6 = (void *)[a3 videoFormat];
    uint64_t v7 = [v6 width];
    uint64_t v8 = [v6 height];
    if ([v6 deviceOriented])
    {
      int v9 = [v5 deviceOriented];
      int v68 = v9 ^ 1;
      if ((v9 & 1) == 0 && v7 != v8) {
        objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Requesting deviceOriented video for a non-square output size is invalid" userInfo:0]);
      }
    }
    else
    {
      int v68 = 0;
    }
    int v10 = [v6 rotationDegrees];
    int v11 = (int)(v10 - [v5 rotationDegrees] + 360) % 360;
    if (v11 == 180 || v11 == 0)
    {
      int v15 = [v6 width];
      int v63 = v15;
      int v64 = [v6 height];
      int v16 = v64;
    }
    else
    {
      int v13 = [v6 width];
      int v14 = [v6 height];
      int v15 = [v6 height];
      int v16 = [v6 width];
      int v63 = v13;
      int v64 = v14;
    }
    if (![v6 cropDescriptor]
      || (unint64_t v17 = objc_msgSend((id)objc_msgSend(v6, "cropDescriptor"), "maxCropForDimensions:", objc_msgSend(v5, "width") | ((unint64_t)objc_msgSend(v5, "height") << 32)), !v17)|| (v18 = HIDWORD(v17), !HIDWORD(v17)))
    {
      int v19 = [v5 extendedWidth];
      LODWORD(v18) = [v5 extendedHeight];
      LODWORD(v17) = v19;
    }
    float v20 = (float)v15 / (float)(int)v17;
    float v21 = (float)v16;
    BOOL v22 = v20 >= 0.25;
    float v23 = v21 / (float)(int)v18;
    BOOL v24 = v23 >= 0.25;
    if (v68)
    {
      BOOL v22 = v20 >= 0.25 && (float)(v21 / (float)(unint64_t)[v5 width]) >= 0.25;
      BOOL v24 = v23 >= 0.25 && (float)((float)v15 / (float)(unint64_t)[v5 height]) >= 0.25;
    }
    uint64_t v25 = [v6 videoContentMode];
    int v26 = v22 || v24;
    if (v25 != 1) {
      int v26 = 0;
    }
    int v27 = v26 | v22;
    int v28 = v26 | v24;
    uint64_t v29 = [v5 pixelFormat];
    uint64_t v30 = [v6 pixelFormat];
    if (v29 == v30) {
      goto LABEL_36;
    }
    int v31 = 0;
    if (v29 != 1380411457 && v29 != 1815162994)
    {
      CFAllocatorRef v32 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      OSType v33 = FigCaptureUncompressedPixelFormatForPixelFormat(v29);
      CFDictionaryRef v34 = CVPixelFormatDescriptionCreateWithPixelFormatType(v32, v33);
      if (v34)
      {
        CFDictionaryRef v35 = v34;
        int v31 = CFDictionaryGetValue(v34, (const void *)*MEMORY[0x1E4F24EE0]) != 0;
        CFRelease(v35);
      }
      else
      {
        int v31 = 0;
      }
    }
    if (v30 == 1380411457
      || v30 == 1815162994
      || (CFAllocatorRef v36 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80],
          OSType v37 = FigCaptureUncompressedPixelFormatForPixelFormat(v30),
          (CFDictionaryRef v38 = CVPixelFormatDescriptionCreateWithPixelFormatType(v36, v37)) == 0))
    {
      if ((v31 & 1) == 0) {
        goto LABEL_36;
      }
    }
    else
    {
      CFDictionaryRef v39 = v38;
      int v40 = CFDictionaryGetValue(v38, (const void *)*MEMORY[0x1E4F24EE0]) != 0;
      CFRelease(v39);
      if (v31 == v40)
      {
LABEL_36:
        BOOL v41 = 0;
        goto LABEL_37;
      }
    }
    unint64_t v43 = [v5 width];
    if (v43 > [v6 width])
    {
      char v44 = v27 & v28;
      v42 = a2;
      if (v44)
      {
LABEL_43:
        v45 = [[BWInferenceVideoFormatRequirements alloc] initWithFormat:v6];
        signed int LossyCompressionLevel = FigCapturePixelFormatGetLossyCompressionLevel(v29);
        v75[0] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", FigCaptureCompressedPixelFormatForPixelFormat(v29, a4, LossyCompressionLevel));
        unint64_t v47 = 0x1E4F1C000uLL;
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v45, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:1]);
        uint64_t v74 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v5, "colorSpaceProperties"));
        -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v45, "setSupportedColorSpaceProperties:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v74 count:1]);
        -[BWInferenceVideoFormatRequirements setHistogramRequest:](v45, "setHistogramRequest:", [v6 histogramRequest]);
        v73 = v45;
        v48 = &v73;
LABEL_67:
        v62 = -[BWInferenceVideoRequirement initWithAttachedMediaKey:videoFormat:count:]([BWInferenceVideoRequirement alloc], "initWithAttachedMediaKey:videoFormat:count:", [a3 attachedMediaKey], +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(*(id *)(v47 + 2424), "arrayWithObjects:count:", v48, 1)), objc_msgSend(a3, "count"));
        if (v62)
        {
          [v42 addObject:v62];
          -[BWInferenceScalingRequirement _appendIntermediateRequirementsToList:forSatisfyingOutputRequirement:intermediatePixelBufferCompressionType:](a1, v42, a3, a4);
        }
        return;
      }
      BOOL v41 = 1;
LABEL_46:
      unsigned int v50 = vcvtpd_s64_f64((double)(unint64_t)[v5 extendedWidth] * 0.25 * 0.5);
      unsigned int v51 = vcvtpd_s64_f64((double)(unint64_t)[v5 extendedHeight] * 0.25 * 0.5);
      v52 = [[BWInferenceVideoFormatRequirements alloc] initWithFormat:v6];
      unint64_t v53 = (unint64_t)FigCapturePixelFormatBytesPerPixel(v29);
      if (v53)
      {
        char v54 = FigCapturePixelFormatBytesPerPixel(v30) > (float)v53 || v41;
        if (v54) {
          goto LABEL_51;
        }
      }
      else if (v41)
      {
LABEL_51:
        signed int v55 = FigCapturePixelFormatGetLossyCompressionLevel(v29);
        uint64_t v72 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", FigCaptureCompressedPixelFormatForPixelFormat(v29, a4, v55));
        v56 = &v72;
        unint64_t v47 = 0x1E4F1C000;
        goto LABEL_55;
      }
      unint64_t v47 = 0x1E4F1C000uLL;
      if (!a4)
      {
LABEL_56:
        int v58 = 2 * v50;
        int v59 = 2 * v51;
        if (v68)
        {
          if (v58 <= v59) {
            int v58 = 2 * v51;
          }
          uint64_t v60 = v58;
          [(BWVideoFormatRequirements *)v52 setWidth:v58];
        }
        else
        {
          if (v63 > v58) {
            int v58 = v63;
          }
          [(BWVideoFormatRequirements *)v52 setWidth:v58];
          if (v64 <= v59) {
            int v61 = 2 * v51;
          }
          else {
            int v61 = v64;
          }
          uint64_t v60 = v61;
        }
        [(BWVideoFormatRequirements *)v52 setHeight:v60];
        uint64_t v70 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v5, "colorSpaceProperties"));
        -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v52, "setSupportedColorSpaceProperties:", [*(id *)(v47 + 2424) arrayWithObjects:&v70 count:1]);
        [(BWInferenceVideoFormatRequirements *)v52 setCropDescriptor:0];
        -[BWInferenceVideoFormatRequirements setHistogramRequest:](v52, "setHistogramRequest:", [v6 histogramRequest]);
        -[BWInferenceVideoFormatRequirements setRotationDegrees:](v52, "setRotationDegrees:", [v5 rotationDegrees]);
        v69 = v52;
        v48 = &v69;
        v42 = a2;
        goto LABEL_67;
      }
      signed int v57 = FigCapturePixelFormatGetLossyCompressionLevel(v30);
      uint64_t v71 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", FigCaptureCompressedPixelFormatForPixelFormat(v30, a4, v57));
      v56 = &v71;
LABEL_55:
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v52, "setSupportedPixelFormats:", [*(id *)(v47 + 2424) arrayWithObjects:v56 count:1]);
      goto LABEL_56;
    }
    unint64_t v49 = [v5 height];
    BOOL v41 = v49 > [v6 height];
LABEL_37:
    if (v27 & v28)
    {
      v42 = a2;
      if (!v41) {
        return;
      }
      goto LABEL_43;
    }
    goto LABEL_46;
  }
}

- (NSArray)orderedVideoRequirements
{
  return self->_orderedVideoRequirements;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWInferenceScalingRequirement;
  [(BWInferenceScalingRequirement *)&v3 dealloc];
}

@end