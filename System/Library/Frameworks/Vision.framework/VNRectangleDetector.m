@interface VNRectangleDetector
+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4;
+ (id)supportedImageSizeSetForOptions:(id)a3 error:(id *)a4;
- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9;
- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9;
- (void)dealloc;
@end

@implementation VNRectangleDetector

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v142 = *MEMORY[0x1E4F143B8];
  id v18 = a5;
  id v108 = a7;
  id v109 = a9;
  v19 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v18 error:a8];
  if (!v19)
  {
    v20 = 0;
    goto LABEL_51;
  }
  v107 = [(VNDetector *)self validatedImageBufferFromOptions:v18 error:a8];
  if (!v107
    || (int v140 = 0,
        !+[VNValidationUtilities getIntValue:&v140 forKey:@"VNRectangleDetectorProcessOption_Version" inOptions:v18 minimumValue:1 maximumValue:2 error:a8]))
  {
    v20 = 0;
    goto LABEL_50;
  }
  if (v140 != 2
    || (unint64_t)[v107 width] >= 5 && (unint64_t)objc_msgSend(v107, "height") >= 5)
  {
    v106 = [(VNDetector *)self computeDeviceOfTypes:1 forComputeStage:@"VNComputeStageMain" processingOptions:v18 error:a8];
    if (!v106) {
      goto LABEL_48;
    }
    v21 = [v18 objectForKeyedSubscript:@"VNRectangleDetectorProcessOption_CropRect_X"];
    [v21 doubleValue];
    float64_t v104 = v22;
    v23 = [v18 objectForKeyedSubscript:@"VNRectangleDetectorProcessOption_CropRect_Y"];
    [v23 doubleValue];
    float64_t v101 = v24;
    v25 = [v18 objectForKeyedSubscript:@"VNRectangleDetectorProcessOption_CropRect_Width"];
    [v25 doubleValue];
    double v27 = v26;
    v28 = [v18 objectForKeyedSubscript:@"VNRectangleDetectorProcessOption_CropRect_Hight"];
    [v28 doubleValue];
    double v30 = v29;

    char v139 = 0;
    if (!+[VNValidationUtilities getBOOLValue:&v139 forKey:@"VNRectangleDetectorProcessOption_HighAccuracy" inOptions:v18 withDefaultValue:1 error:a8])goto LABEL_48; {
    float v31 = width;
    }
    if (v31 <= 0.0
      || v31 > 1.0
      || (float v32 = height, v32 <= 0.0)
      || v32 > 1.0
      || (float v33 = x, v33 < 0.0)
      || v33 >= 1.0
      || (float v34 = y, v34 < 0.0)
      || v34 >= 1.0)
    {
      if (a8)
      {
        v38 = NSString;
        v39 = VNHumanReadableCGRect(x, y, width, height);
        v40 = [v38 stringWithFormat:@"invalid region of interest: %@", v39];

        *a8 = +[VNError errorForInvalidArgumentWithLocalizedDescription:v40];
      }
      goto LABEL_48;
    }
    float32x2_t v36 = (float32x2_t)0x3F0000003F000000;
    if ([v107 getCameraOpticalCenterIfAvailable:&v138])
    {
      switch([v107 orientation])
      {
        case 0u:
        case 1u:
          float64x2_t v37 = v138;
          goto LABEL_35;
        case 2u:
          _Q1.f64[0] = 1.0;
          v37.f64[0] = 1.0 - v138.f64[0];
          v41 = (float64x2_t *)&v138.f64[1];
          goto LABEL_30;
        case 3u:
          __asm { FMOV            V1.2D, #1.0 }
          float64x2_t v37 = vsubq_f64(_Q1, v138);
          goto LABEL_35;
        case 4u:
          double v42 = v138.f64[1];
          v37.f64[0] = v138.f64[0];
          goto LABEL_34;
        case 5u:
          float64x2_t v47 = v138;
          goto LABEL_32;
        case 6u:
          _Q1.f64[0] = 1.0;
          v37.f64[0] = 1.0 - v138.f64[1];
          v41 = &v138;
LABEL_30:
          v37.f64[1] = v41->f64[0];
          goto LABEL_35;
        case 7u:
          __asm { FMOV            V1.2D, #1.0 }
          float64x2_t v47 = vsubq_f64(_Q1, v138);
LABEL_32:
          float32x2_t v36 = (float32x2_t)vrev64_s32((int32x2_t)vcvt_f32_f64(v47));
          break;
        case 8u:
          v37.f64[0] = v138.f64[1];
          double v42 = v138.f64[0];
LABEL_34:
          _Q1.f64[0] = 1.0 - v42;
          v37.f64[1] = _Q1.f64[0];
LABEL_35:
          float32x2_t v36 = vcvt_f32_f64(v37);
          break;
        default:
          break;
      }
    }
    float v137 = 0.0;
    LODWORD(_Q1.f64[0]) = 1.0;
    if (!+[VNValidationUtilities getFloatValue:&v137 forKey:@"VNRectangleDetectorProcessOption_MinimumAspectRatio" inOptions:v18 minimumValue:a8 maximumValue:0.0 error:_Q1.f64[0]])goto LABEL_48; {
    float v136 = 0.0;
    }
    LODWORD(v48) = 1.0;
    if (!+[VNValidationUtilities getFloatValue:&v136 forKey:@"VNRectangleDetectorProcessOption_MaximumAspectRatio" inOptions:v18 minimumValue:a8 maximumValue:0.0 error:v48])goto LABEL_48; {
    if (v137 > v136)
    }
    {
      if (a8)
      {
        v50 = [NSString stringWithFormat:@"VNRectangleDetectorProcessOption_MinimumAspectRatio value, %f is greater than VNRectangleDetectorProcessOption_MaximumAspectRatio value, %f", v137, v136];
        *a8 = +[VNError errorWithCode:4 message:v50];
      }
      goto LABEL_48;
    }
    int v135 = 0;
    LODWORD(v49) = 1110704128;
    if (!+[VNValidationUtilities getFloatValue:forKey:inOptions:minimumValue:maximumValue:error:](VNValidationUtilities, "getFloatValue:forKey:inOptions:minimumValue:maximumValue:error:", &v135, @"VNRectangleDetectorProcessOption_QuadratureTolerance", v18, a8, 0.0, v49)|| (int v134 = 0, LODWORD(v51) = 1.0, !+[VNValidationUtilities getFloatValue:&v134 forKey:@"VNRectangleDetectorProcessOption_MinimumSize" inOptions:v18 minimumValue:a8 maximumValue:0.0 error:v51])
      || (float v133 = 0.0,
          LODWORD(v52) = 1.0,
          !+[VNValidationUtilities getFloatValue:forKey:inOptions:minimumValue:maximumValue:error:](VNValidationUtilities, "getFloatValue:forKey:inOptions:minimumValue:maximumValue:error:", &v133, @"VNRectangleDetectorProcessOption_MinimumConfidence", v18, a8, 0.0, v52))|| (int v132 = 0, !+[VNValidationUtilities getIntValue:&v132 forKey:@"VNRectangleDetectorProcessOption_MaximumNumber" inOptions:v18 minimumValue:1 maximumValue:0x7FFFFFFFLL error:a8]))
    {
LABEL_48:
      v20 = 0;
LABEL_49:

      goto LABEL_50;
    }
    std::vector<float>::vector(v131, 8 * v132);
    std::vector<float>::vector(__p, v132);
    v53 = v131[0];
    uint64_t v129 = 0;
    v128.data = CVPixelBufferGetBaseAddress(a4);
    v128.double height = CVPixelBufferGetHeight(a4);
    v128.double width = CVPixelBufferGetWidth(a4);
    v128.rowBytes = CVPixelBufferGetBytesPerRow(a4);
    unint64_t v54 = [v107 height];
    unint64_t v55 = [v107 width];
    v56 = [v18 objectForKeyedSubscript:@"VNRectangleDetectorProcessOption_OriginalScaleFactor"];
    [v56 floatValue];
    float v58 = v57;

    float v127 = 0.0;
    [v107 getPixelFocalLengthIfAvailable:&v127];
    *(float *)&double v62 = v127;
    if (v127 < 0.0)
    {
      if (!a8)
      {
        v20 = 0;
        goto LABEL_89;
      }
      objc_msgSend(NSString, "stringWithFormat:", @" PixelFocalLength value is out of bounds: %f", v127);
      id v63 = (id)objc_claimAutoreleasedReturnValue();
      +[VNError errorWithCode:4 message:v63];
      v20 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_88:

LABEL_89:
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
      if (v131[0])
      {
        v131[1] = v131[0];
        operator delete(v131[0]);
      }
      goto LABEL_49;
    }
    v65.f64[0] = (double)v55;
    float64x2_t v66 = vcvtq_f64_f32(v36);
    v65.f64[1] = (double)v54;
    __asm { FMOV            V1.2D, #-1.0 }
    float64x2_t v68 = vaddq_f64(v65, _Q1);
    _Q1.f64[0] = v104;
    _Q1.f64[1] = v101;
    float64x2_t v105 = _Q1;
    float64x2_t v99 = v68;
    float64x2_t v69 = vmulq_n_f64(vmlaq_f64(vnegq_f64(_Q1), v68, v66), (float)(1.0 / v58));
    if (!(_NF ^ _VF | _ZF))
    {
      *(float *)&double v62 = v127 / v58;
      float v127 = v127 / v58;
    }
    float32x2_t v70 = vcvt_f32_f64(v69);
    double v102 = *(double *)&v70;
    if (v140 == 2)
    {
      v116[0] = xmmword_1A410C2B0;
      v116[1] = xmmword_1A410C2C0;
      uint64_t v117 = 0x43F000000;
      int v123 = v134;
      float v124 = v133;
      int v118 = v135;
      float v119 = v137;
      float v120 = v136;
      int v121 = LODWORD(v62);
      float32x2_t v122 = v70;
      int v125 = v132;
      __int16 v126 = 0;
      int v115 = 0;
      BOOL v71 = QuadDetect(&v128, (uint64_t)v116, v53, __p[0], &v115);
      if (v71) {
        uint64_t v129 = v115;
      }
      goto LABEL_63;
    }
    if (!self->_perMeshPtr)
    {
      PerMeshForFFTSIZE = createPerMeshForFFTSIZE();
      self->_perMeshPtr = PerMeshForFFTSIZE;
      if (!PerMeshForFFTSIZE)
      {
        LOBYTE(v71) = 0;
        goto LABEL_63;
      }
      *(float *)&double v62 = v127;
    }
    *(float *)&double v61 = v27 / v30;
    vImage_Buffer v114 = v128;
    *(float *)&double v59 = v137;
    *(float *)v66.f64 = v136;
    LODWORD(v68.f64[0]) = v134;
    LODWORD(v60) = v135;
    LOBYTE(v71) = CCRectLowLevel((uint64_t)&v114, v62, v102, COERCE_DOUBLE(__PAIR64__(HIDWORD(v128.width), HIDWORD(v102))), v59, v66.f64[0], v68.f64[0], v60, v61, v58, v133);
LABEL_63:
    id v73 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v74 = v129;
    v75 = (void *)[v73 initWithCapacity:v129];
    v76 = [v18 objectForKeyedSubscript:@"VNRectangleDetectorProcessOption_TargetScaleY"];
    int v77 = [v76 intValue];

    char v78 = !v71;
    if (!v74) {
      char v78 = 1;
    }
    if ((v78 & 1) == 0)
    {
      uint64_t v79 = 0;
      v80 = 0;
      v81 = (float *)v131[0];
      __asm { FMOV            V0.2D, #1.0 }
      float64x2_t v103 = vdivq_f64(_Q0, v99);
      do
      {
        uint64_t v83 = 0;
        int v84 = v140;
        do
        {
          if (v84 == 2)
          {
            v85 = &v81[v83];
            float v86 = v58 * (float)((float)((float)v77 + -1.0) - v81[v83 + 1]);
            float *v85 = v58 * v81[v83];
            v85[1] = v86;
          }
          *(float32x2_t *)&v81[v83] = vcvt_f32_f64(vmulq_f64(v103, vcvtq_f64_f32(vcvt_f32_f64(vaddq_f64(v105, vcvtq_f64_f32(*(float32x2_t *)&v81[v83]))))));
          v83 += 2;
        }
        while (v83 != 8);
        if (v84 == 1)
        {
          float v87 = v81[7];
          float v88 = v81[3];
          if (v87 >= v88)
          {
            v92 = v81 + 6;
            float v98 = v81[1];
            float v100 = v81[7];
            v90 = v81 + 2;
            v91 = v81 + 4;
            float v87 = v81[5];
            v89 = v81;
          }
          else
          {
            float v98 = v81[3];
            float v100 = v81[1];
            v89 = v81 + 2;
            v90 = v81 + 4;
            float v88 = v81[5];
            v91 = v81 + 6;
            v92 = v81;
          }
        }
        else
        {
          v89 = v81 + 2;
          float v98 = v81[3];
          float v100 = v81[1];
          v90 = v81 + 4;
          float v88 = v81[5];
          v91 = v81 + 6;
          v92 = v81;
          float v87 = v81[7];
        }
        v93 = -[VNRectangleObservation initWithOriginatingRequestSpecifier:topLeft:topRight:bottomRight:bottomLeft:]([VNRectangleObservation alloc], "initWithOriginatingRequestSpecifier:topLeft:topRight:bottomRight:bottomLeft:", v19, *v92, v100, *v89, v98, *v90, v88, *v91, v87);

        v80 = v93;
        if (v93)
        {
          LODWORD(v94) = *((_DWORD *)__p[0] + v79);
          [(VNObservation *)v93 setConfidence:v94];
          [v75 addObject:v93];
        }
        v81 += 8;
        ++v79;
      }
      while (v79 != v74);
    }
    long long v112 = 0u;
    long long v113 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    id v63 = v75;
    uint64_t v95 = [v63 countByEnumeratingWithState:&v110 objects:v141 count:16];
    if (v95)
    {
      uint64_t v96 = *(void *)v111;
      do
      {
        for (uint64_t i = 0; i != v95; ++i)
        {
          if (*(void *)v111 != v96) {
            objc_enumerationMutation(v63);
          }
          [(VNDetector *)self recordImageCropQuickLookInfoFromOptions:v18 toObservation:*(void *)(*((void *)&v110 + 1) + 8 * i)];
        }
        uint64_t v95 = [v63 countByEnumeratingWithState:&v110 objects:v141 count:16];
      }
      while (v95);
    }
    v20 = v63;
    goto LABEL_88;
  }
  v20 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_50:

LABEL_51:

  return v20;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v17 = a4;
  id v18 = a6;
  v19 = [(VNDetector *)self validatedImageBufferFromOptions:v17 error:a8];
  v20 = v19;
  if (!v19) {
    goto LABEL_11;
  }
  unint64_t v21 = [v19 height];
  unint64_t v22 = [v20 width];
  double v23 = (double)(unint64_t)(double)v22;
  v46.origin.double x = x * v23;
  v46.size.double width = width * v23;
  double v24 = (double)(unint64_t)(double)v21;
  v46.origin.double y = y * v24;
  v46.size.double height = height * v24;
  CGRect v47 = CGRectIntegral(v46);
  double v25 = v47.origin.x;
  double v26 = v47.origin.y;
  double v27 = v47.size.width;
  double v28 = v47.size.height;
  int v45 = 0;
  if (+[VNValidationUtilities getIntValue:&v45 forKey:@"VNRectangleDetectorProcessOption_Version" inOptions:v17 minimumValue:1 maximumValue:2 error:a8])
  {
    if (v45 == 2)
    {
      if (v22 < 5 || v21 <= 4)
      {
        VNRecordImageTooSmallWarningWithImageMinimumShortDimension(v18, 5);
        BOOL v33 = 1;
        goto LABEL_17;
      }
      double v29 = 256.0;
      if (v27 <= v28)
      {
        if (v27 <= 256.0) {
          double v29 = v27;
        }
        double v31 = v27 / v29;
        float v43 = v28 / (v27 / v29);
        double v30 = roundf(v43);
      }
      else
      {
        if (v28 <= 256.0) {
          double v30 = v28;
        }
        else {
          double v30 = 256.0;
        }
        double v31 = v28 / v30;
        float v32 = v27 / (v28 / v30);
        double v29 = roundf(v32);
      }
    }
    else
    {
      double v31 = v28 * 0.00390625;
      double v29 = 256.0;
      double v30 = 256.0;
    }
    id v44 = 0;
    float v34 = (__CVBuffer *)objc_msgSend(v20, "croppedBufferWithWidth:height:format:cropRect:options:error:pixelBufferRepsCacheKey:", (unint64_t)v29, (unint64_t)v30, 1111970369, v17, a8, &v44, v25, v26, v27, v28);
    id v35 = v44;
    *a7 = v34;
    BOOL v33 = v34 != 0;
    if (v34)
    {
      float32x2_t v36 = [NSNumber numberWithDouble:v25];
      [v17 setObject:v36 forKeyedSubscript:@"VNRectangleDetectorProcessOption_CropRect_X"];

      float64x2_t v37 = [NSNumber numberWithDouble:v26];
      [v17 setObject:v37 forKeyedSubscript:@"VNRectangleDetectorProcessOption_CropRect_Y"];

      v38 = [NSNumber numberWithDouble:v27];
      [v17 setObject:v38 forKeyedSubscript:@"VNRectangleDetectorProcessOption_CropRect_Width"];

      v39 = [NSNumber numberWithDouble:v28];
      [v17 setObject:v39 forKeyedSubscript:@"VNRectangleDetectorProcessOption_CropRect_Hight"];

      v40 = [NSNumber numberWithDouble:v31];
      [v17 setObject:v40 forKeyedSubscript:@"VNRectangleDetectorProcessOption_OriginalScaleFactor"];

      v41 = [NSNumber numberWithDouble:v30];
      [v17 setObject:v41 forKeyedSubscript:@"VNRectangleDetectorProcessOption_TargetScaleY"];

      [(VNDetector *)self recordImageCropQuickLookInfoToOptions:v17 cacheKey:v35 imageBuffer:v20];
    }
  }
  else
  {
LABEL_11:
    BOOL v33 = 0;
  }
LABEL_17:

  return v33;
}

- (void)dealloc
{
  perMeshPtr = self->_perMeshPtr;
  if (perMeshPtr)
  {
    free(perMeshPtr);
    self->_perMeshPtr = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VNRectangleDetector;
  [(VNDetector *)&v4 dealloc];
}

+ (id)supportedImageSizeSetForOptions:(id)a3 error:(id *)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  int v10 = 0;
  if (+[VNValidationUtilities getIntValue:&v10 forKey:@"VNRectangleDetectorProcessOption_Version" inOptions:a3 minimumValue:1 maximumValue:2 error:a4])
  {
    BOOL v4 = v10 == 1;
    v5 = [[VNSizeRange alloc] initWithMinimumDimension:256 maximumDimension:-1 idealDimension:256];
    if (v4) {
      v6 = [[VNSupportedImageSize alloc] initWithIdealFormat:1111970369 pixelsWideRange:v5 pixelsHighRange:v5 aspectRatioHandling:0 idealOrientation:1 orientationAgnostic:1];
    }
    else {
      v6 = [[VNSupportedImageSize alloc] initWithIdealFormat:1111970369 pixelsWideRange:v5 pixelsHighRange:v5 aspectRatioHandling:1 idealOrientation:1 orientationAgnostic:1];
    }
    v8 = v6;

    v11[0] = v8;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7 = @"VNComputeStageMain";
  BOOL v4 = +[VNComputeDeviceUtilities allCPUComputeDevices];
  v8[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

@end