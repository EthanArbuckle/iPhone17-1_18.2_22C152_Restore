@interface VNFaceSegmentGenerator
+ (float)_faceSegmenterMaximumInputImageAspectRatio;
+ (id)espressoModelFileNameForConfigurationOptions:(id)a3;
+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3;
+ (unint64_t)inputImageAspectRatioHandlingForConfigurationOptions:(id)a3;
+ (unsigned)networkRequiredInputImagePixelFormatForConfigurationOptions:(id)a3;
- (BOOL)_fillFaceSegmentLabelToProbabilityMap:(id)a3 error:(id *)a4;
- (BOOL)_getFaceSegmenterInputImageSize:(CGSize *)a3 forRequestRevision:(unint64_t)a4 error:(id *)a5;
- (BOOL)_getNumberOfSupportedFaceSegments:(unint64_t *)a3 forRequestRevision:(unint64_t)a4 error:(id *)a5;
- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4;
- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9;
- (id).cxx_construct;
- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9;
@end

@implementation VNFaceSegmentGenerator

+ (id)espressoModelFileNameForConfigurationOptions:(id)a3
{
  if (+[VNFaceSegmentGenerator espressoModelFileNameForConfigurationOptions:]::onceToken != -1) {
    dispatch_once(&+[VNFaceSegmentGenerator espressoModelFileNameForConfigurationOptions:]::onceToken, &__block_literal_global_11211);
  }
  v3 = (void *)+[VNFaceSegmentGenerator espressoModelFileNameForConfigurationOptions:]::espressoModelName;

  return v3;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  v20.receiver = self;
  v20.super_class = (Class)VNFaceSegmentGenerator;
  if (!-[VNEspressoModelFileBasedDetector completeInitializationForSession:error:](&v20, sel_completeInitializationForSession_error_, a3))return 0; {
  v6 = [(VNEspressoModelFileBasedDetector *)self espressoResources];
  }
  uint64_t v7 = [v6 network];
  uint64_t v9 = v8;
  uint64_t v10 = [v6 plan];
  v11 = (char *)operator new(0x198uLL);
  *((void *)v11 + 1) = 0;
  *((void *)v11 + 2) = 0;
  *(void *)v11 = &unk_1EF7535B0;
  *((void *)v11 + 3) = v7;
  *((void *)v11 + 4) = v9;
  *((void *)v11 + 5) = 0;
  *((void *)v11 + 6) = v10;
  *(_OWORD *)(v11 + 56) = 0u;
  *(_OWORD *)(v11 + 72) = 0u;
  *(_OWORD *)(v11 + 88) = 0u;
  *(_OWORD *)(v11 + 104) = 0u;
  *(_OWORD *)(v11 + 120) = 0u;
  *(_OWORD *)(v11 + 136) = 0u;
  *(_OWORD *)(v11 + 152) = 0u;
  *(_OWORD *)(v11 + 168) = 0u;
  *(_OWORD *)(v11 + 184) = 0u;
  *(_OWORD *)(v11 + 200) = 0u;
  *((_DWORD *)v11 + 54) = 0;
  uint64_t v21 = 0;
  std::vector<unsigned long>::vector((void *)v11 + 28, 4uLL, &v21);
  uint64_t v21 = 0;
  std::vector<unsigned long>::vector((void *)v11 + 31, 4uLL, &v21);
  v11[272] = 0;
  *(void *)(v11 + 284) = 0;
  *(void *)(v11 + 276) = 0;
  *((void *)v11 + 38) = 0;
  *((void *)v11 + 39) = 0;
  *((void *)v11 + 37) = 0;
  v12 = operator new(0x40uLL);
  *((void *)v11 + 38) = v12 + 4;
  *((void *)v11 + 39) = v12 + 4;
  _OWORD *v12 = 0u;
  v12[1] = 0u;
  v12[2] = 0u;
  v12[3] = 0u;
  *((void *)v11 + 37) = v12;
  *((_OWORD *)v11 + 20) = 0u;
  *((_OWORD *)v11 + 21) = 0u;
  *((_OWORD *)v11 + 22) = 0u;
  *((_OWORD *)v11 + 23) = 0u;
  *((_OWORD *)v11 + 24) = 0u;
  v11[400] = 0;
  if (espresso_network_query_blob_dimensions()
    || espresso_network_bind_buffer()
    || espresso_network_query_blob_dimensions())
  {
    espresso_plan_get_error_info();
    exception = __cxa_allocate_exception(8uLL);
    void *exception = 8283;
    __cxa_throw(exception, MEMORY[0x1E4FBA3E0], 0);
  }
  v13.__ptr_ = (FaceSegmenterDNN *)(v11 + 24);
  v13.__cntrl_ = (__shared_weak_count *)v11;
  p_faceSegmenterDNN = &self->_faceSegmenterDNN;
  cntrl = self->_faceSegmenterDNN.__cntrl_;
  self->_faceSegmenterDNN = v13;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
    ptr = p_faceSegmenterDNN->__ptr_;
    BOOL v17 = p_faceSegmenterDNN->__ptr_ != 0;
    if (a4 && !ptr)
    {
      *a4 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Failed to create Face Segmenter object"];
    }
  }
  else
  {
    BOOL v17 = 1;
  }

  return v17;
}

+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3
{
  if (+[VNFaceSegmentGenerator espressoModelInputImageDimensionsBlobNameForConfigurationOptions:]::onceToken != -1) {
    dispatch_once(&+[VNFaceSegmentGenerator espressoModelInputImageDimensionsBlobNameForConfigurationOptions:]::onceToken, &__block_literal_global_55);
  }
  v3 = (void *)+[VNFaceSegmentGenerator espressoModelInputImageDimensionsBlobNameForConfigurationOptions:]::inputBufferBlobName;

  return v3;
}

- (id).cxx_construct
{
  *((void *)self + 11) = 0;
  *((void *)self + 12) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_faceSegmenterDNN.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
}

- (BOOL)_fillFaceSegmentLabelToProbabilityMap:(id)a3 error:(id *)a4
{
  v33[4] = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  v5 = +[VNFaceSegments faceSegmentIndexToFlagMap];
  uint64_t v6 = 0;
  while (1)
  {
    memset(&dest, 0, sizeof(dest));
    ptr = self->_faceSegmenterDNN.__ptr_;
    if (!*((unsigned char *)ptr + 248))
    {
      uint64_t v24 = 8308;
      goto LABEL_22;
    }
    uint64_t v8 = (vImagePixelCount *)*((void *)ptr + 28);
    vImagePixelCount v10 = *v8;
    vImagePixelCount v9 = v8[1];
    src.data = (void *)(*((void *)ptr + 4) + 4 * v10 * v6 * v9);
    src.height = v9;
    src.width = v10;
    src.rowBytes = 4 * v10;
    vImagePixelCount v11 = (unint64_t)*((float *)ptr + 66);
    vImagePixelCount v12 = (unint64_t)*((float *)ptr + 65);
    dest.data = malloc_type_realloc(0, ((4 * v11 + 15) & 0xFFFFFFFFFFFFFFF0) * v12, 0xA423628BuLL);
    if (!dest.data)
    {
      uint64_t v24 = 4221;
      goto LABEL_22;
    }
    dest.width = v11;
    dest.rowBytes = (4 * v11 + 15) & 0xFFFFFFFFFFFFFFF0;
    dest.height = v12;
    unint64_t v13 = vImageScale_PlanarF(&src, &dest, 0, 0x80u);
    v14 = (void *)*((void *)ptr + 37);
    if (v13 > *((void *)ptr + 38)) {
      break;
    }
LABEL_7:
    if (vImageScale_PlanarF(&src, &dest, v14, 0))
    {
      uint64_t v24 = 8314;
      goto LABEL_22;
    }
    if (dest.width != 256 || dest.height != 256)
    {
      if (a4)
      {
        id v25 = [NSString alloc];
        v26 = objc_msgSend(v25, "initWithFormat:", @"Expected labelConfidence map of %lu x %lu and got %lu x %lu", 256, 256, dest.width, dest.height);
        *a4 = +[VNError errorForInternalErrorWithLocalizedDescription:v26];
      }
      goto LABEL_24;
    }
    id v15 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    v16 = (void *)[v15 initWithBytesNoCopy:dest.data length:0x40000 freeWhenDone:1];
    v33[0] = v16;
    v32[0] = @"data";
    v32[1] = @"width";
    BOOL v17 = [NSNumber numberWithUnsignedLong:256];
    v33[1] = v17;
    v32[2] = @"height";
    v18 = [NSNumber numberWithUnsignedLong:256];
    v33[2] = v18;
    v32[3] = @"rowBytes";
    v19 = [NSNumber numberWithUnsignedLong:1024];
    v33[3] = v19;
    objc_super v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:4];

    uint64_t v21 = [NSNumber numberWithUnsignedChar:v6];
    v22 = [v5 objectForKeyedSubscript:v21];

    if (!v22)
    {
      if (a4)
      {
        *a4 = +[VNError errorForInternalErrorWithLocalizedDescription:@"cannot map face segments"];
      }

      goto LABEL_24;
    }
    [v29 setObject:v20 forKey:v22];

    if (++v6 == 15)
    {
      BOOL v23 = 1;
      goto LABEL_25;
    }
  }
  v14 = malloc_type_realloc(*((void **)ptr + 37), v13, 0x25BD965BuLL);
  *((void *)ptr + 37) = v14;
  if (v14)
  {
    *((void *)ptr + 38) = v13;
    goto LABEL_7;
  }
  uint64_t v24 = 8315;
LABEL_22:
  if (a4)
  {
    VNErrorForCVMLStatus((id)v24);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_24:
  BOOL v23 = 0;
LABEL_25:

  return v23;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  v82[1] = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __124__VNFaceSegmentGenerator_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke;
  aBlock[3] = &unk_1E5B1D128;
  aBlock[4] = self;
  aBlock[5] = a4;
  unint64_t v13 = _Block_copy(aBlock);
  if ((VNExecuteBlock(v13, (uint64_t)a8) & 1) == 0) {
    goto LABEL_37;
  }
  *(_OWORD *)ptr = 0u;
  long long v80 = 0u;
  v14 = self->_faceSegmenterDNN.__ptr_;
  if (!*((unsigned char *)v14 + 248))
  {
    uint64_t v35 = 8308;
    if (!a8) {
      goto LABEL_37;
    }
    goto LABEL_35;
  }
  id v77 = v12;
  id v15 = (uint64_t *)*((void *)v14 + 28);
  uint64_t v16 = *v15;
  uint64_t v17 = v15[1];
  uint64_t v18 = v15[2];
  unint64_t v19 = (*v15 + 15) & 0xFFFFFFFFFFFFFFF0;
  objc_super v20 = malloc_type_realloc(*((void **)v14 + 43), v19 * v17, 0xA423628BuLL);
  *((void *)v14 + 43) = v20;
  if (!v20) {
    goto LABEL_33;
  }
  *((void *)v14 + 45) = v16;
  *((void *)v14 + 46) = v19;
  *((void *)v14 + 44) = v17;
  bzero(v20, v19 * v17);
  id v12 = v77;
  if (v17)
  {
    uint64_t v21 = 0;
    v22 = (float *)*((void *)v14 + 4);
    uint64_t v23 = *((void *)v14 + 43);
    do
    {
      if (v16)
      {
        uint64_t v24 = 0;
        id v25 = v22;
        do
        {
          if (v18)
          {
            uint64_t v26 = 0;
            char v27 = 0;
            float v28 = -3.4028e38;
            id v29 = v25;
            do
            {
              if (v28 < *v29)
              {
                float v28 = *v29;
                char v27 = v26;
              }
              ++v26;
              v29 += v17 * v16;
            }
            while (v18 != v26);
          }
          else
          {
            char v27 = 0;
          }
          *(unsigned char *)(v23 + v24++) = v27;
          ++v25;
        }
        while (v24 != v16);
      }
      v23 += *((void *)v14 + 46);
      ++v21;
      v22 += v16;
    }
    while (v21 != v17);
  }
  v30 = (char *)ptr[0];
  if (!ptr[0])
  {
    unint64_t v31 = (unint64_t)*((float *)v14 + 66);
    unint64_t v32 = (unint64_t)*((float *)v14 + 65);
    v30 = (char *)malloc_type_realloc(0, ((v31 + 15) & 0xFFFFFFFFFFFFFFF0) * v32, 0xA423628BuLL);
    ptr[0] = v30;
    if (v30)
    {
      *(void *)&long long v80 = v31;
      *((void *)&v80 + 1) = (v31 + 15) & 0xFFFFFFFFFFFFFFF0;
      ptr[1] = (void *)v32;
      id v12 = v77;
      goto LABEL_20;
    }
LABEL_33:
    uint64_t v35 = 4221;
    id v12 = v77;
    goto LABEL_34;
  }
LABEL_20:
  if (!*((void *)v14 + 43) || (unint64_t v33 = *((void *)v14 + 45)) == 0 || (v34 = (void *)*((void *)v14 + 44)) == 0)
  {
LABEL_36:
    uint64_t v35 = 4220;
    if (!a8) {
      goto LABEL_37;
    }
    goto LABEL_35;
  }
  uint64_t v35 = 4220;
  if (*((void *)v14 + 46) < 2uLL || !v30)
  {
LABEL_34:
    if (!a8)
    {
LABEL_37:
      v38 = 0;
      goto LABEL_38;
    }
LABEL_35:
    VNErrorForCVMLStatus((id)v35);
    v38 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_38;
  }
  if (!(void)v80) {
    goto LABEL_36;
  }
  v36 = ptr[1];
  if (!ptr[1]) {
    goto LABEL_36;
  }
  uint64_t v37 = *((void *)&v80 + 1);
  if (*((void *)&v80 + 1) < 2uLL) {
    goto LABEL_36;
  }
  if (v34 == ptr[1] && v33 == (void)v80)
  {
    ImageProcessing_copyVImageBufferData((char **)v14 + 43, 1, (char **)ptr);
  }
  else
  {
    unint64_t v40 = 0;
    float v41 = (float)v33 / (float)(unint64_t)v80;
    uint64_t v42 = 1;
    float v43 = (float)(unint64_t)v34 / (float)(unint64_t)ptr[1];
    do
    {
      uint64_t v44 = llroundf((float)((float)((float)v40 + 0.5) * v43) + -0.5);
      uint64_t v45 = *((void *)v14 + 44);
      if (v45 <= v44) {
        uint64_t v46 = v45 - 1;
      }
      else {
        uint64_t v46 = v44 & ~(v44 >> 63);
      }
      if (v42)
      {
        unint64_t v47 = 0;
        uint64_t v48 = *((void *)v14 + 43) + v46 * *((void *)v14 + 46);
        do
        {
          uint64_t v49 = llroundf((float)((float)((float)v47 + 0.5) * v41) + -0.5);
          uint64_t v50 = *((void *)v14 + 45);
          if (v50 <= v49) {
            uint64_t v51 = v50 - 1;
          }
          else {
            uint64_t v51 = v49 & ~(v49 >> 63);
          }
          v30[v47++] = *(unsigned char *)(v48 + v51);
          uint64_t v42 = v80;
        }
        while (v47 < (unint64_t)v80);
        v36 = ptr[1];
        uint64_t v37 = *((void *)&v80 + 1);
      }
      v30 += v37;
      ++v40;
    }
    while (v40 < (unint64_t)v36);
  }
  v52 = self->_faceSegmenterDNN.__ptr_;
  float v53 = *((float *)v52 + 66);
  float v54 = *((float *)v52 + 65);
  id v55 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  v56 = (void *)[v55 initWithBytesNoCopy:ptr[0] length:(((unint64_t)v53 + 15) & 0xFFFFFFFFFFFFFFF0) * (unint64_t)v54];
  v57 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v12 specifyingRequestClass:objc_opt_class() error:a8];
  v58 = v57;
  if (v57
    && (uint64_t v59 = [v57 requestRevision],
        uint64_t v78 = 0,
        [(VNFaceSegmentGenerator *)self _getNumberOfSupportedFaceSegments:&v78 forRequestRevision:v59 error:a8]))
  {
    id v60 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if ([(VNFaceSegmentGenerator *)self _fillFaceSegmentLabelToProbabilityMap:v60 error:a8])
    {
      v76 = [v12 objectForKeyedSubscript:@"VNFaceSegmentGeneratorInternalProcessOption_FaceSegmentBBoxNormalized_X"];
      [v76 doubleValue];
      double v62 = v61;
      v63 = [v12 objectForKeyedSubscript:@"VNFaceSegmentGeneratorInternalProcessOption_FaceSegmentBBoxNormalized_Y"];
      [v63 doubleValue];
      double v65 = v64;
      v66 = [v12 objectForKeyedSubscript:@"VNFaceSegmentGeneratorInternalProcessOption_FaceSegmentBBoxNormalized_Width"];
      [v66 doubleValue];
      double v68 = v67;
      v69 = [v12 objectForKeyedSubscript:@"VNFaceSegmentGeneratorInternalProcessOption_FaceSegmentBBoxNormalized_Height"];
      [v69 doubleValue];
      double v71 = v70;

      v72 = [VNFaceSegments alloc];
      v73 = -[VNFaceSegments initWithRequestRevision:outputBufferWidth:outputBufferHeight:outputBufferData:numberOfFaceSegments:faceSegmentBBox:faceSegmentLabelToProbabilityMap:](v72, "initWithRequestRevision:outputBufferWidth:outputBufferHeight:outputBufferData:numberOfFaceSegments:faceSegmentBBox:faceSegmentLabelToProbabilityMap:", v59, (void)v80, ptr[1], v56, v78, v60, v62, v65, v68, v71);
      v74 = VNCloneFaceObservationFromOptions((uint64_t)v12, a8);
      v75 = v74;
      if (v74)
      {
        [v74 setFaceSegments:v73];
        v82[0] = v75;
        v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:1];
      }
      else
      {
        v38 = 0;
      }
    }
    else
    {
      v38 = 0;
    }
  }
  else
  {
    v38 = 0;
  }

LABEL_38:

  return v38;
}

uint64_t __124__VNFaceSegmentGenerator_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(__CVBuffer **)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 88);
  *(unsigned char *)(v4 + 248) = 0;
  v5 = *(unint64_t **)(v4 + 200);
  unint64_t v6 = v5[1];
  float v7 = (float)*v5;
  size_t Width = CVPixelBufferGetWidth(v3);
  size_t Height = CVPixelBufferGetHeight(v3);
  if (Width != (unint64_t)v7 || Height != (unint64_t)(float)v6)
  {
    uint64_t v10 = 8316;
    if (!a2) {
      return 0;
    }
LABEL_8:
    VNErrorForCVMLStatus((id)v10);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t result = 0;
    *a2 = v12;
    return result;
  }
  *(_DWORD *)(v4 + 252) = 0;
  *(_DWORD *)(v4 + 256) = 0;
  *(float *)(v4 + 260) = (float)Height;
  *(float *)(v4 + 264) = (float)Width;
  if (espresso_network_bind_input_cvpixelbuffer() || espresso_plan_execute_sync())
  {
    espresso_plan_get_error_info();
    uint64_t v10 = 8283;
    if (!a2) {
      return 0;
    }
    goto LABEL_8;
  }
  uint64_t result = 1;
  *(unsigned char *)(v4 + 248) = 1;
  return result;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v12 = a4;
  unint64_t v13 = [(VNDetector *)self validatedImageBufferFromOptions:v12 error:a8];
  v14 = v13;
  if (v13)
  {
    unint64_t v15 = [v13 width];
    unint64_t v16 = [v14 height];
    uint64_t v17 = +[VNValidationUtilities requiredFaceObservationInOptions:v12 error:a8];
    uint64_t v18 = v17;
    if (v17)
    {
      [v17 alignedBoundingBoxAsCGRect];
      double v22 = (double)v15;
      double v24 = v23 * (double)v15;
      if (v24 == 0.0 || (double v25 = (double)v16, v26 = v21 * (double)v16, v26 == 0.0))
      {
        if (a8)
        {
          +[VNError errorForInternalErrorWithLocalizedDescription:@"One of the dimensions of the input face image is zero"];
          BOOL v42 = 0;
          *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

          goto LABEL_18;
        }
      }
      else
      {
        double v27 = v19;
        double v28 = v20;
        float v56 = 0.0;
        if (+[VNValidationUtilities getFloatValue:&v56 forKey:@"VNFaceSegmentGeneratorProcessOption_FaceBoundingBoxExpansionRatio" inOptions:v12 error:a8])
        {
          v57.origin.double x = v27 * v22;
          v57.origin.double y = v28 * v25;
          double v29 = (float)(v56 + -1.0);
          CGFloat v30 = -(v24 * v29) * 0.5;
          CGFloat v31 = -(v26 * v29) * 0.5;
          v57.size.double width = v24;
          v57.size.double height = v26;
          CGRect v58 = CGRectInset(v57, v30, v31);
          double x = v58.origin.x;
          double y = v58.origin.y;
          double width = v58.size.width;
          double height = v58.size.height;
          [v14 orientation];
          if (VNSetFaceOrientationInOptionsDictionary(v18, v12, a8))
          {
            if (width >= height) {
              double v36 = width / height;
            }
            else {
              double v36 = height / width;
            }
            +[VNFaceSegmentGenerator _faceSegmenterMaximumInputImageAspectRatio];
            float v37 = v36;
            if (v38 >= v37)
            {
              uint64_t v44 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v12 specifyingRequestClass:objc_opt_class() error:a8];
              float v41 = v44;
              if (v44
                && (uint64_t v45 = [v44 requestRevision],
                    *(_OWORD *)id v55 = *MEMORY[0x1E4F1DB30],
                    -[VNFaceSegmentGenerator _getFaceSegmenterInputImageSize:forRequestRevision:error:](self, "_getFaceSegmenterInputImageSize:forRequestRevision:error:", v55, v45, a8))&& ([v12 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"VNImageBufferOption_CreateFromPixelBufferPool"], uint64_t v46 = (__CVBuffer *)objc_msgSend(v14, "croppedBufferWithWidth:height:format:cropRect:options:error:", (unint64_t)v55[0], (unint64_t)v55[1], 1111970369, v12, a8, x,
                                          y,
                                          width,
                                          height),
                    (*a7 = v46) != 0))
              {
                double v47 = 0.0;
                double v48 = 0.0;
                double v49 = 0.0;
                if (v15)
                {
                  double v48 = x / v22;
                  double v49 = width / v22;
                }
                double v50 = 0.0;
                if (v16)
                {
                  double v47 = y / v25;
                  double v50 = height / v25;
                }
                uint64_t v51 = [NSNumber numberWithDouble:v48];
                [v12 setObject:v51 forKeyedSubscript:@"VNFaceSegmentGeneratorInternalProcessOption_FaceSegmentBBoxNormalized_X"];

                v52 = [NSNumber numberWithDouble:v47];
                [v12 setObject:v52 forKeyedSubscript:@"VNFaceSegmentGeneratorInternalProcessOption_FaceSegmentBBoxNormalized_Y"];

                float v53 = [NSNumber numberWithDouble:v49];
                [v12 setObject:v53 forKeyedSubscript:@"VNFaceSegmentGeneratorInternalProcessOption_FaceSegmentBBoxNormalized_Width"];

                float v54 = [NSNumber numberWithDouble:v50];
                [v12 setObject:v54 forKeyedSubscript:@"VNFaceSegmentGeneratorInternalProcessOption_FaceSegmentBBoxNormalized_Height"];

                BOOL v42 = 1;
              }
              else
              {
                BOOL v42 = 0;
              }
              goto LABEL_28;
            }
            if (a8)
            {
              v39 = NSString;
              +[VNFaceSegmentGenerator _faceSegmenterMaximumInputImageAspectRatio];
              float v41 = objc_msgSend(v39, "stringWithFormat:", @"Input face aspect ratio > %f cannot be processed", v40);
              +[VNError errorForInternalErrorWithLocalizedDescription:v41];
              BOOL v42 = 0;
              *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_28:

              goto LABEL_17;
            }
          }
        }
      }
    }
    BOOL v42 = 0;
    goto LABEL_17;
  }
  BOOL v42 = 0;
LABEL_18:

  return v42;
}

- (BOOL)_getNumberOfSupportedFaceSegments:(unint64_t *)a3 forRequestRevision:(unint64_t)a4 error:(id *)a5
{
  if (a3)
  {
    if (a4 == 1)
    {
      *a3 = *(int *)(*((void *)self->_faceSegmenterDNN.__ptr_ + 28) + 16);
      return 1;
    }
    if (a5)
    {
      float v7 = @"Unexpected request revision";
      goto LABEL_8;
    }
  }
  else if (a5)
  {
    float v7 = @"Invalid parameter (numberOfSupportedFaceSegments)";
LABEL_8:
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v7, a4);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    BOOL result = 0;
    *a5 = v8;
    return result;
  }
  return 0;
}

- (BOOL)_getFaceSegmenterInputImageSize:(CGSize *)a3 forRequestRevision:(unint64_t)a4 error:(id *)a5
{
  if (a3)
  {
    if (a4 == 1)
    {
      *(float64x2_t *)a3 = vcvtq_f64_f32(vcvt_f32_f64(vcvtq_f64_u64(*(uint64x2_t *)*((void *)self->_faceSegmenterDNN.__ptr_
                                                                                   + 25))));
      return 1;
    }
    if (a5)
    {
      float v7 = @"Unexpected request revision";
      goto LABEL_8;
    }
  }
  else if (a5)
  {
    float v7 = @"Invalid parameter (size)";
LABEL_8:
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v7, a4);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    BOOL result = 0;
    *a5 = v8;
    return result;
  }
  return 0;
}

uint64_t __91__VNFaceSegmentGenerator_espressoModelInputImageDimensionsBlobNameForConfigurationOptions___block_invoke()
{
  +[VNFaceSegmentGenerator espressoModelInputImageDimensionsBlobNameForConfigurationOptions:]::inputBufferBlobName = [[NSString alloc] initWithUTF8String:"input__0"];

  return MEMORY[0x1F41817F8]();
}

uint64_t __71__VNFaceSegmentGenerator_espressoModelFileNameForConfigurationOptions___block_invoke()
{
  +[VNFaceSegmentGenerator espressoModelFileNameForConfigurationOptions:]::espressoModelName = [[NSString alloc] initWithUTF8String:"faceSemantics_v1_15class_quant.espresso"];

  return MEMORY[0x1F41817F8]();
}

+ (unint64_t)inputImageAspectRatioHandlingForConfigurationOptions:(id)a3
{
  return 0;
}

+ (unsigned)networkRequiredInputImagePixelFormatForConfigurationOptions:(id)a3
{
  return 1111970369;
}

+ (float)_faceSegmenterMaximumInputImageAspectRatio
{
  return 3.0;
}

@end