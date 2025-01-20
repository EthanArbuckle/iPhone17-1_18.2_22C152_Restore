@interface VNFaceQualityGenerator
+ (Class)detectorClassForConfigurationOptions:(id)a3 error:(id *)a4;
+ (basic_string_view<char,)modelVersionIDForConfigurationOptions:(id)a3;
+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3;
+ (id)keyForDetectorWithConfigurationOptions:(id)a3;
+ (unint64_t)inputImageAspectRatioHandlingForConfigurationOptions:(id)a3;
+ (unsigned)networkRequiredInputImagePixelFormatForConfigurationOptions:(id)a3;
- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4;
- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9;
- (id).cxx_construct;
- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9;
@end

@implementation VNFaceQualityGenerator

+ (basic_string_view<char,)modelVersionIDForConfigurationOptions:(id)a3
{
  +[VNError VNAssertClass:objc_opt_class() needsToOverrideMethod:a2];
  v3 = "";
  unint64_t v4 = 0;
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

+ (Class)detectorClassForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v5 error:a4];
  if (!v6) {
    goto LABEL_7;
  }
  if (([v6 specifiesRequestClass:objc_opt_class()] & 1) != 0
    && (unint64_t)([v6 requestRevision] - 1) <= 2)
  {
    v7 = objc_opt_class();
    goto LABEL_8;
  }
  if (a4)
  {
    +[VNError errorForUnsupportedRequestSpecifier:v6];
    v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_7:
    v7 = 0;
  }
LABEL_8:

  return (Class)v7;
}

+ (unint64_t)inputImageAspectRatioHandlingForConfigurationOptions:(id)a3
{
  return 0;
}

+ (unsigned)networkRequiredInputImagePixelFormatForConfigurationOptions:(id)a3
{
  return 1111970369;
}

+ (id)keyForDetectorWithConfigurationOptions:(id)a3
{
  id v4 = a3;
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___VNFaceQualityGenerator;
  id v5 = objc_msgSendSuper2(&v10, sel_keyForDetectorWithConfigurationOptions_, v4);
  v6 = NSString;
  v7 = [a1 espressoModelFileNameForConfigurationOptions:v4];
  v8 = [v6 stringWithFormat:@"%@:%@", v5, v7];

  return v8;
}

+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3
{
  return @"image";
}

- (id).cxx_construct
{
  *((void *)self + 11) = 0;
  *((void *)self + 12) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_mFaceQualityPredictor.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  v13 = VNCloneFaceObservationFromOptions((uint64_t)v12, a8);
  if (!v13)
  {
    a8 = 0;
    goto LABEL_15;
  }
  v14 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v12 specifyingRequestClass:objc_opt_class() error:a8];
  if (!v14) {
    goto LABEL_13;
  }
  ptr = self->_mFaceQualityPredictor.__ptr_;
  unint64_t v17 = *((void *)ptr + 14);
  unint64_t v16 = *((void *)ptr + 15);
  size_t Width = CVPixelBufferGetWidth(a4);
  size_t Height = CVPixelBufferGetHeight(a4);
  int CVPixelBufferImageType = ImageProcessing_getCVPixelBufferImageType(a4);
  if (Width == (unint64_t)(float)v17 && Height == (unint64_t)(float)v16)
  {
    if (CVPixelBufferImageType == 4)
    {
      if (espresso_network_bind_input_cvpixelbuffer())
      {
        syslog(5, "ERROR: Could not bind the image to the input blob");
      }
      else
      {
        if (!espresso_plan_execute_sync())
        {
          if (*((char *)ptr + 111) < 0)
          {
            v26 = (_WORD *)*((void *)ptr + 11);
            uint64_t v27 = *((void *)ptr + 12);
          }
          else
          {
            v26 = (_WORD *)((char *)ptr + 88);
            uint64_t v27 = *((unsigned __int8 *)ptr + 111);
          }
          float v28 = fminf(**((float **)ptr + 44) * 0.25, 1.0);
          if (v27 == 2 && *v26 == 12918) {
            float v28 = 1.0 / (exp(v28 * -3.78 + 2.0) + 1.0);
          }
          if (v28 <= 1.0 && v28 >= 0.0)
          {
            objc_msgSend(v13, "setFaceCaptureQuality:originatingRequestSpecifier:", v14);
            v29[0] = v13;
            a8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
            goto LABEL_14;
          }
          if (!a8) {
            goto LABEL_14;
          }
          v22 = objc_msgSend(NSString, "stringWithFormat:", @"face quality of %f is out of range", v28);
          v23 = +[VNError errorForInternalErrorWithLocalizedDescription:v22];
          goto LABEL_12;
        }
        espresso_plan_get_error_info();
        syslog(5, "ERROR: Could not execute plan: %s", v25);
      }
      uint64_t v21 = 9307;
      if (!a8) {
        goto LABEL_14;
      }
LABEL_11:
      v22 = VNErrorForCVMLStatus((id)v21);
      v23 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Could not run network" underlyingError:v22];
LABEL_12:
      *a8 = v23;

LABEL_13:
      a8 = 0;
      goto LABEL_14;
    }
    syslog(5, "ERROR: Unexpected input image buffer format");
  }
  else
  {
    syslog(5, "ERROR: Unexpected input image buffer dimensions");
  }
  uint64_t v21 = 9331;
  if (a8) {
    goto LABEL_11;
  }
LABEL_14:

LABEL_15:

  return a8;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v12 = a4;
  v13 = [(VNDetector *)self validatedImageBufferFromOptions:v12 error:a8];
  if (v13)
  {
    v14 = +[VNValidationUtilities requiredFaceObservationInOptions:v12 error:a8];
    if (!v14) {
      goto LABEL_17;
    }
    [v13 orientation];
    if ((VNSetFaceOrientationInOptionsDictionary(v14, v12, a8) & 1) == 0) {
      goto LABEL_17;
    }
    [v14 unalignedBoundingBox];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    ptr = self->_mFaceQualityPredictor.__ptr_;
    unint64_t v24 = *((void *)ptr + 14);
    unint64_t v25 = *((void *)ptr + 15);
    uint64_t v26 = [v14 requestRevision];
    float v27 = 0.3825;
    if ((unint64_t)(v26 - 3737841664) <= 6 && ((1 << v26) & 0x75) != 0 || (unint64_t)(v26 - 1) < 3)
    {
LABEL_9:
      unint64_t v28 = [v13 width];
      unint64_t v29 = [v13 height];
      float v30 = v16 * (double)v28;
      float v31 = v18 * (double)v29;
      float v32 = v22 * (double)v29;
      float v33 = v20 * (double)v28;
      float v34 = v30 - (float)(v27 * v33);
      float v35 = v31 - (float)(v27 * v32);
      float v36 = floorf(v34);
      float v37 = floorf(v35);
      float v38 = ceilf((float)(v34 + (float)(v33 + (float)((float)(v27 * v33) * 2.0))) - v36);
      float v39 = ceilf((float)(v35 + (float)(v32 + (float)((float)(v27 * v32) * 2.0))) - v37);
      if (v38 != v39)
      {
        if (v38 <= v39)
        {
          float v36 = v36 + (float)(vabds_f32(v38, v39) * -0.5);
          float v38 = v39;
        }
        else
        {
          float v37 = v37 + (float)(vabds_f32(v39, v38) * -0.5);
          float v39 = v38;
        }
      }
      [v12 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"VNImageBufferOption_CreateFromPixelBufferPool"];
      v41 = (__CVBuffer *)objc_msgSend(v13, "croppedBufferWithWidth:height:format:cropRect:options:error:", (unint64_t)(float)v24, (unint64_t)(float)v25, 1111970369, v12, a8, v36, v37, v38, v39);
      *a7 = v41;
      BOOL v40 = v41 != 0;
      goto LABEL_18;
    }
    if (!v26)
    {
      float v27 = 0.0;
      goto LABEL_9;
    }
    if (a8)
    {
      +[VNError errorForUnsupportedRevision:ofRequestClass:](VNError, "errorForUnsupportedRevision:ofRequestClass:", [v14 requestRevision], objc_opt_class());
      BOOL v40 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_17:
      BOOL v40 = 0;
    }
LABEL_18:

    goto LABEL_19;
  }
  BOOL v40 = 0;
LABEL_19:

  return v40;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  v36.receiver = self;
  v36.super_class = (Class)VNFaceQualityGenerator;
  id v33 = a3;
  if (!-[VNEspressoModelFileBasedDetector completeInitializationForSession:error:](&v36, sel_completeInitializationForSession_error_))
  {
    BOOL v11 = 0;
    goto LABEL_47;
  }
  float v31 = [(VNDetector *)self configurationOptions];
  float v32 = [(VNEspressoModelFileBasedDetector *)self espressoResources];
  uint64_t v6 = [(id)objc_opt_class() modelVersionIDForConfigurationOptions:v31];
  size_t v8 = v7;
  if (v7 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  v9 = (const void *)v6;
  if (v7 >= 0x17)
  {
    uint64_t v12 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v7 | 7) != 0x17) {
      uint64_t v12 = v7 | 7;
    }
    uint64_t v13 = v12 + 1;
    p_dst = (long long *)operator new(v12 + 1);
    *((void *)&__dst + 1) = v8;
    int64_t v35 = v13 | 0x8000000000000000;
    *(void *)&long long __dst = p_dst;
    goto LABEL_10;
  }
  HIBYTE(v35) = v7;
  p_dst = &__dst;
  if (v7) {
LABEL_10:
  }
    memmove(p_dst, v9, v8);
  *((unsigned char *)p_dst + v8) = 0;
  uint64_t v14 = [v32 network];
  uint64_t v16 = v15;
  uint64_t v17 = [v32 plan];
  uint64_t v18 = HIBYTE(v35);
  int v19 = SHIBYTE(v35);
  std::string::size_type v20 = *((void *)&__dst + 1);
  if (v35 < 0) {
    uint64_t v18 = *((void *)&__dst + 1);
  }
  if (v18 == 2)
  {
    double v21 = (const std::string::value_type *)__dst;
    double v22 = (const char *)&__dst;
    if (v35 < 0) {
      double v22 = (const char *)__dst;
    }
    if (*(_WORD *)v22 == 12662 || *(_WORD *)v22 == 12918 || *(_WORD *)v22 == 13174) {
      goto LABEL_26;
    }
  }
  else if (v18 == 8)
  {
    double v21 = (const std::string::value_type *)__dst;
    double v22 = (const char *)&__dst;
    if (v35 < 0) {
      double v22 = (const char *)__dst;
    }
    if (*(void *)v22 == 0x32706F72645F3376
      || *(void *)v22 == 0x33706F72645F3376
      || *(void *)v22 == 0x34706F72645F3376)
    {
LABEL_26:
      v23 = (char *)operator new(0x230uLL);
      *(_OWORD *)(v23 + 8) = 0u;
      *(void *)v23 = &unk_1EF7538F8;
      *((void *)v23 + 11) = 0;
      *((_OWORD *)v23 + 6) = 0u;
      unint64_t v24 = (std::string *)(v23 + 112);
      if (v19 < 0)
      {
        std::string::__init_copy_ctor_external(v24, v21, v20);
      }
      else
      {
        *(_OWORD *)&v24->__r_.__value_.__l.__data_ = __dst;
        *((void *)v23 + 16) = v35;
      }
      *((void *)v23 + 21) = 0;
      *((void *)v23 + 22) = 0;
      *((void *)v23 + 23) = v17;
      *((void *)v23 + 24) = v14;
      *((void *)v23 + 25) = v16;
      *((void *)v23 + 68) = 0xFFFFFFFF00000000;
      *((_DWORD *)v23 + 138) = 65568;
      v23[556] = 0;
      if (espresso_network_query_blob_dimensions())
      {
        espresso_plan_get_error_info();
        syslog(5, "ERROR: Could not query the dimensions of the input blob: %s");
      }
      else
      {
        if (!espresso_network_bind_buffer())
        {
          __int16 v37 = 2;
          char v38 = 0;
          uint64_t v39 = 0x3F80000000000000;
          int v40 = 32;
          char v41 = 0;
          operator new();
        }
        espresso_plan_get_error_info();
        syslog(5, "ERROR: Could not bind to the output blob: %s");
      }
      syslog(5, "[Error] Failed to load Face Quality model");
      uint64_t v26 = 9307;
      if (v23) {
        std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v23);
      }
      shared_ptr<vision::mod::FaceQualityPredictor> v25 = (shared_ptr<vision::mod::FaceQualityPredictor>)0;
      goto LABEL_39;
    }
  }
  else
  {
    double v22 = (const char *)__dst;
    if (v35 >= 0) {
      double v22 = (const char *)&__dst;
    }
  }
  syslog(5, "[Error] Version %s is not supported", v22);
  shared_ptr<vision::mod::FaceQualityPredictor> v25 = (shared_ptr<vision::mod::FaceQualityPredictor>)0;
  uint64_t v26 = 9340;
LABEL_39:
  p_mFaceQualityPredictor = &self->_mFaceQualityPredictor;
  cntrl = self->_mFaceQualityPredictor.__cntrl_;
  self->_mFaceQualityPredictor = v25;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
  if (SHIBYTE(v35) < 0) {
    operator delete((void *)__dst);
  }
  BOOL v11 = p_mFaceQualityPredictor->__ptr_ != 0;
  if (a4 && !p_mFaceQualityPredictor->__ptr_)
  {
    unint64_t v29 = VNErrorForCVMLStatus((id)v26);
    *a4 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Failure to create face quality predictor" underlyingError:v29];
  }
LABEL_47:

  return v11;
}

@end