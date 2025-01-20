@interface VNFaceDetectorRevision2
+ (id)computeStagesToBindForConfigurationOptions:(id)a3;
+ (id)configurationOptionKeysForDetectorKey;
+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4;
+ (id)supportedImageSizeSetForOptions:(id)a3 error:(id *)a4;
- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4;
- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9;
- (id).cxx_construct;
- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9;
- (void)purgeIntermediates;
@end

@implementation VNFaceDetectorRevision2

+ (id)configurationOptionKeysForDetectorKey
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__VNFaceDetectorRevision2_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNFaceDetectorRevision2 configurationOptionKeysForDetectorKey]::onceToken != -1) {
    dispatch_once(&+[VNFaceDetectorRevision2 configurationOptionKeysForDetectorKey]::onceToken, block);
  }
  v2 = (void *)+[VNFaceDetectorRevision2 configurationOptionKeysForDetectorKey]::configurationOptionKeys;

  return v2;
}

void __64__VNFaceDetectorRevision2_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNFaceDetectorRevision2;
  v1 = objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v2 = (void *)[v1 mutableCopy];

  [v2 removeObject:@"VNDetectorOption_MetalContextPriority"];
  [v2 addObject:@"VNDetectorOption_PreferBackgroundProcessing"];
  uint64_t v3 = [v2 copy];
  v4 = (void *)+[VNFaceDetectorRevision2 configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNFaceDetectorRevision2 configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;
}

+ (id)supportedImageSizeSetForOptions:(id)a3 error:(id *)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v4 = [[VNSizeRange alloc] initWithMinimumDimension:448 maximumDimension:597 idealDimension:448];
  objc_super v5 = [[VNSupportedImageSize alloc] initWithIdealFormat:1111970369 pixelsWideRange:v4 pixelsHighRange:v4 aspectRatioHandling:2 idealOrientation:1 orientationAgnostic:1];
  v8[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7 = @"VNComputeStageMain";
  v4 = +[VNComputeDeviceUtilities espressoV1ModelComputeDevices];
  v8[0] = v4;
  objc_super v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

+ (id)computeStagesToBindForConfigurationOptions:(id)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = @"VNComputeStageMain";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceBBoxAligner, 0);
  cntrl = self->_faceDetector.__cntrl_;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
}

- (void)purgeIntermediates
{
  if (self->_faceDetector.__ptr_)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __45__VNFaceDetectorRevision2_purgeIntermediates__block_invoke;
    v11[3] = &unk_1E5B1F2D0;
    v11[4] = self;
    if ((VNExecuteBlock(v11, 0) & 1) == 0) {
      VNValidatedLog(4, @"Exception thrown while trying to purge face detector layers.", v3, v4, v5, v6, v7, v8, v9);
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)VNFaceDetectorRevision2;
  [(VNFaceDetector *)&v10 purgeIntermediates];
}

uint64_t __45__VNFaceDetectorRevision2_purgeIntermediates__block_invoke(uint64_t a1)
{
  if ((*(uint64_t (**)(void))(**(void **)(*(void *)(a1 + 32) + 56) + 88))(*(void *)(*(void *)(a1 + 32) + 56)) != 6016) {
    VNValidatedLog(4, @"Wiping layers for face detector unsuccessful.", v1, v2, v3, v4, v5, v6, vars0);
  }
  return 1;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v19 = a5;
  id v20 = a7;
  id v21 = a9;
  v22 = +[VNValidationUtilities requiredSessionInOptions:v19 error:a8];
  if (v22)
  {
    v23 = [(VNDetector *)self validatedImageBufferFromOptions:v19 error:a8];
    v24 = v23;
    if (v23)
    {
      v33 = v21;
      uint64_t v32 = [v23 width];
      uint64_t v25 = [v24 height];
      v51[0] = 0;
      v51[1] = v51;
      v51[2] = 0x4812000000;
      v51[3] = __Block_byref_object_copy__49;
      v51[4] = __Block_byref_object_dispose__50;
      v51[5] = "";
      memset(v52, 0, sizeof(v52));
      v26 = [MEMORY[0x1E4F1CA48] array];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __125__VNFaceDetectorRevision2_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke;
      aBlock[3] = &unk_1E5B1C088;
      v43 = a4;
      id v35 = v19;
      v36 = self;
      v42 = v51;
      id v37 = v24;
      id v38 = v22;
      uint64_t v44 = v32;
      uint64_t v45 = v25;
      unsigned int v50 = a6;
      double v46 = x;
      double v47 = y;
      double v48 = width;
      double v49 = height;
      id v39 = v20;
      id v41 = v33;
      id v27 = v26;
      id v40 = v27;
      v28 = (uint64_t (**)(void *, id *, double, double, double, double))_Block_copy(aBlock);
      if (v28[2](v28, a8, x, y, width, height))
      {
        id v21 = v33;
        if (+[VisionCoreRuntimeUtilities linkTimeOrRunTimeBeforeVersion:393216])
        {
          id v29 = &__block_literal_global_125;
          [v27 sortWithOptions:16 usingComparator:&__block_literal_global_125];
        }
        id v30 = v27;
      }
      else
      {
        id v30 = 0;
        id v21 = v33;
      }

      _Block_object_dispose(v51, 8);
      v53 = (void **)v52;
      std::vector<vision::mod::DetectedObject>::__destroy_vector::operator()[abi:ne180100](&v53);
    }
    else
    {
      id v30 = 0;
    }
  }
  else
  {
    id v30 = 0;
  }

  return v30;
}

BOOL __125__VNFaceDetectorRevision2_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  v127[1] = *MEMORY[0x1E4F143B8];
  size_t Width = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + 96));
  size_t Height = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 96));
  *(void *)&long long v122 = CVPixelBufferGetBaseAddress(*(CVPixelBufferRef *)(a1 + 96));
  size_t v12 = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 96));
  *((void *)&v122 + 1) = v12;
  size_t v13 = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + 96));
  *(void *)&long long v123 = v13;
  *((void *)&v123 + 1) = CVPixelBufferGetBytesPerRow(*(CVPixelBufferRef *)(a1 + 96));
  uint64_t v121 = 1;
  v98 = a2;
  if (+[VNValidationUtilities getMTLGPUPriority:&v121 forKey:@"VNDetectorOption_MetalContextPriority" inOptions:*(void *)(a1 + 32) withDefaultValue:1 error:a2])
  {
    (*(void (**)(void, void, void))(**(void **)(*(void *)(a1 + 40) + 56) + 96))(*(void *)(*(void *)(a1 + 40) + 56), *(unsigned __int8 *)(*(void *)(a1 + 40) + 80), v121);
    (*(void (**)(float **__return_ptr))(**(void **)(*(void *)(a1 + 40) + 56) + 48))(&v119);
    double v95 = a5;
    double v96 = a6;
    v14 = v119;
    v15 = v120;
    if (v119 != v120)
    {
      *(float *)&v105 = (float)v12;
      double r2 = (float)v12;
      float context = (float)v13;
      double v100 = (float)v13;
      do
      {
        float v16 = v14[6];
        float v17 = fminf(v16, 0.0);
        if (v17 >= 0.0 && v17 <= 0.0)
        {
          float v18 = v14[7];
          float v19 = fminf(v18, 0.0);
          if (v19 >= 0.0 && v19 <= 0.0)
          {
            float v20 = v14[9];
            float v21 = (float)(v16 + v20) - context;
            if (v21 <= 0.0)
            {
              float v22 = v14[8];
              float v23 = (float)(v18 + v22) - *(float *)&v105;
              if (v23 <= 0.0)
              {
                float v24 = v16 - (float)(v17 + fmaxf(v21, 0.0));
                float v25 = v18 - (float)(v19 + fmaxf(v23, 0.0));
                v14[6] = v24;
                v14[7] = v25;
                float v108 = v22;
                CGFloat v26 = v22;
                float v110 = v20;
                CGFloat v27 = v20;
                v131.origin.double x = 0.0;
                v131.origin.double y = 0.0;
                v128.origin.double x = v24;
                v128.origin.double y = v25;
                v128.size.double width = v20;
                v128.size.double height = v22;
                v131.size.double width = v100;
                v131.size.double height = r2;
                CGRect v129 = CGRectIntersection(v128, v131);
                v132.origin.double x = v129.origin.x;
                v132.origin.double y = v129.origin.y;
                double v28 = v129.size.width;
                double v29 = v129.size.height;
                v129.origin.double x = v24;
                v129.origin.double y = v25;
                v129.size.double width = v27;
                v129.size.double height = v26;
                v132.size.double width = v28;
                v132.size.double height = v29;
                CGRect v130 = CGRectIntersection(v129, v132);
                if (v130.size.width * v130.size.height / (v27 * v26 + v28 * v29 - v130.size.width * v130.size.height) >= 0.9999)
                {
                  v14[6] = v24;
                  v14[7] = v25;
                  v14[8] = v108;
                  v14[9] = v110;
                  id v30 = *(uint64_t **)(*(void *)(a1 + 88) + 8);
                  unint64_t v31 = v30[7];
                  if (v31 >= v30[8])
                  {
                    uint64_t v32 = std::vector<vision::mod::DetectedObject>::__push_back_slow_path<vision::mod::DetectedObject const&>(v30 + 6, (uint64_t)v14);
                  }
                  else
                  {
                    vision::mod::DetectedObject::DetectedObject(v30[7], (uint64_t)v14);
                    uint64_t v32 = v31 + 80;
                    v30[7] = v31 + 80;
                  }
                  v30[7] = v32;
                }
              }
            }
          }
        }
        v14 += 20;
      }
      while (v14 != v15);
    }
    v33 = objc_opt_class();
    uint64_t v34 = *(void *)(a1 + 96);
    uint64_t v35 = *(void *)(*(void *)(a1 + 88) + 8) + 48;
    v118[0] = v122;
    v118[1] = v123;
    [v33 printDebugInfo:*(void *)(a1 + 48) facesDataRaw:v35 faceDetectorBGRAImage:v34 tempImage:v118 session:*(void *)(a1 + 56)];
    uint64_t v36 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 48);
    uint64_t v37 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 56);
    uint64_t v38 = v37 - v36;
    if (v37 == v36)
    {
      BOOL v41 = 1;
    }
    else
    {
      id v39 = +[VNValidationUtilities originatingRequestSpecifierInOptions:*(void *)(a1 + 32) error:v98];
      if (v39)
      {
        v94 = v39;
        [*(id *)(a1 + 32) setObject:v39 forKeyedSubscript:@"VNDetectorOption_OriginatingRequestSpecifier"];
        v127[0] = *(void *)(a1 + 48);
        id v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v127 count:1];
        [*(id *)(a1 + 32) setObject:v40 forKeyedSubscript:@"VNDetectorProcessOption_InputImageBuffers"];

        BOOL v41 = 0;
        uint64_t v42 = 0;
        uint64_t v43 = v38 / 80;
        float v44 = v95 / (float)Width;
        float v45 = v96 / (float)Height;
        unint64_t v101 = v38 / 80;
        if ((unint64_t)(v38 / 80) <= 1) {
          uint64_t v43 = 1;
        }
        uint64_t v99 = v43;
        while (1)
        {
          uint64_t v46 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 48);
          double v47 = (float *)(v46 + 80 * v42);
          float v49 = v47[6];
          float v48 = v47[7];
          float v51 = v47[8];
          float v50 = v47[9];
          contexta = (void *)MEMORY[0x1A6257080]();
          unint64_t v53 = *(void *)(a1 + 104);
          unint64_t v52 = *(void *)(a1 + 112);
          v54 = [VNFaceObservation alloc];
          float v55 = a3 + (float)(v49 * v44);
          double v56 = (float)(v55 / (float)v53);
          float v57 = a4 + (float)(v48 * v45);
          double v58 = (float)(v57 / (float)v52);
          double v59 = (float)((float)(v50 * v44) / (float)v53);
          double v60 = (float)((float)(v51 * v45) / (float)v52);
          v111 = -[VNDetectedObjectObservation initWithOriginatingRequestSpecifier:boundingBox:](v54, "initWithOriginatingRequestSpecifier:boundingBox:", v39, v56, v58, v59, v60);
          -[VNFaceObservation setUnalignedBoundingBox:](v111, "setUnalignedBoundingBox:", v56, v58, v59, v60);
          uint64_t v62 = v46 + 80 * v42;
          int v63 = *(unsigned __int8 *)(v62 + 48);
          if (*(unsigned char *)(v62 + 48))
          {
            *(float *)&double v61 = (float)(*(float *)(v46 + 80 * v42 + 40) * 3.1416) / 180.0;
            v105 = [NSNumber numberWithFloat:v61];
            v64 = v105;
          }
          else
          {
            v64 = 0;
          }
          [(VNFaceObservation *)v111 setRoll:v64];
          if (v63) {

          }
          uint64_t v66 = v46 + 80 * v42;
          int v67 = *(unsigned __int8 *)(v66 + 49);
          if (*(unsigned char *)(v66 + 49))
          {
            *(float *)&double v65 = (float)(*(float *)(v46 + 80 * v42 + 44) * 3.1416) / 180.0;
            double r2 = [NSNumber numberWithFloat:v65];
            double v68 = r2;
          }
          else
          {
            double v68 = 0.0;
          }
          [(VNFaceObservation *)v111 setYaw:*(void *)&v68];
          if (v67) {

          }
          v126 = v111;
          v69 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v126 count:1];
          [*(id *)(a1 + 32) setObject:v69 forKeyedSubscript:@"VNDetectorProcessOption_InputFaceObservations"];

          [*(id *)(a1 + 48) orientation];
          v70 = *(void **)(a1 + 32);
          id v117 = 0;
          int v71 = VNSetFaceOrientationInOptionsDictionary(v111, v70, &v117);
          id v72 = v117;
          if (v71)
          {
            uint64_t v73 = *(void *)(a1 + 32);
            v74 = *(void **)(*(void *)(a1 + 40) + 72);
            uint64_t v75 = *(unsigned int *)(a1 + 152);
            double v76 = *(double *)(a1 + 120);
            double v77 = *(double *)(a1 + 128);
            double v78 = *(double *)(a1 + 136);
            double v79 = *(double *)(a1 + 144);
            uint64_t v80 = *(void *)(a1 + 64);
            id v116 = v72;
            v81 = objc_msgSend(v74, "internalProcessUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v75, v73, v80, &v116, *(void *)(a1 + 80), v76, v77, v78, v79);
            id v109 = v116;

            if (!v81) {
              goto LABEL_45;
            }
            if ([v81 count] == 1)
            {
              BOOL v97 = v41;
              long long v114 = 0u;
              long long v115 = 0u;
              long long v112 = 0u;
              long long v113 = 0u;
              id v82 = v81;
              uint64_t v83 = [v82 countByEnumeratingWithState:&v112 objects:v125 count:16];
              if (v83)
              {
                uint64_t v84 = *(void *)v113;
                do
                {
                  for (uint64_t i = 0; i != v83; ++i)
                  {
                    if (*(void *)v113 != v84) {
                      objc_enumerationMutation(v82);
                    }
                    v86 = *(void **)(*((void *)&v112 + 1) + 8 * i);
                    [v86 alignedBoundingBoxAsCGRect];
                    if (v86)
                    {
                      v86[12] = v87;
                      v86[13] = v88;
                      v86[14] = v89;
                      v86[15] = v90;
                    }
                    [*(id *)(a1 + 40) recordImageCropQuickLookInfoFromOptions:*(void *)(a1 + 32) toObservation:v86];
                  }
                  uint64_t v83 = [v82 countByEnumeratingWithState:&v112 objects:v125 count:16];
                }
                while (v83);
              }

              id v39 = v94;
              BOOL v41 = v97;
              [*(id *)(a1 + 72) addObjectsFromArray:v82];
              char v91 = 1;
            }
            else
            {
LABEL_45:
              uint64_t v92 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Failed to align a detected bounding box" underlyingError:v109];

              char v91 = 0;
              id v109 = (id)v92;
            }

            id v72 = v109;
          }
          else
          {
            char v91 = 0;
          }

          if (!v71) {
            break;
          }
          if ((v91 & 1) == 0)
          {
            if (v98)
            {
              id v72 = v72;
              void *v98 = v72;
            }
            break;
          }

          BOOL v41 = ++v42 >= v101;
          if (v42 == v99)
          {
            BOOL v41 = 1;
            goto LABEL_57;
          }
        }
      }
      else
      {
        BOOL v41 = 0;
      }
LABEL_57:
    }
    v124 = &v119;
    std::vector<vision::mod::DetectedObject>::__destroy_vector::operator()[abi:ne180100]((void ***)&v124);
  }
  else
  {
    return 0;
  }
  return v41;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v18 = a4;
  id v19 = a6;
  id v20 = a9;
  float v21 = [(VNDetector *)self validatedImageBufferFromOptions:v18 error:a8];
  float v22 = v21;
  if (!v21) {
    goto LABEL_17;
  }
  unint64_t v23 = [v21 width];
  unint64_t v24 = [v22 height];
  if (v23 >= v24) {
    unint64_t v25 = v24;
  }
  else {
    unint64_t v25 = v23;
  }
  if (v25 <= 0x1BF) {
    VNRecordImageTooSmallWarningWithImageMinimumShortDimension(v19, 448);
  }
  uint64_t v45 = 1;
  if (+[VNValidationUtilities getMTLGPUPriority:&v45 forKey:@"VNDetectorOption_MetalContextPriority" inOptions:v18 withDefaultValue:1 error:a8])
  {
    v46.origin.CGFloat x = x;
    v46.origin.CGFloat y = y;
    v46.size.CGFloat width = width;
    v46.size.CGFloat height = height;
    CGRect v47 = CGRectIntegral(v46);
    double v26 = v47.origin.x;
    double v27 = v47.origin.y;
    double v28 = v47.size.width;
    double v29 = v47.size.height;
    unint64_t v30 = (unint64_t)v47.size.width;
    unint64_t v31 = (unint64_t)v47.size.height;
    float v43 = (float)(unint64_t)v47.size.height;
    float v44 = (float)(unint64_t)v47.size.width;
    (*(void (**)(ObjectDetector_DCNFaceDetector_v2 *, float *))(*(void *)self->_faceDetector.__ptr_ + 24))(self->_faceDetector.__ptr_, &v43);
    BOOL v34 = v33 < v44;
    BOOL v35 = v32 < v43;
    if (v34 && v35) {
      unint64_t v36 = (unint64_t)v33;
    }
    else {
      unint64_t v36 = v30;
    }
    if (v34 && v35) {
      unint64_t v37 = (unint64_t)v32;
    }
    else {
      unint64_t v37 = v31;
    }
    id v42 = 0;
    uint64_t v38 = (__CVBuffer *)objc_msgSend(v22, "croppedBufferWithWidth:height:format:cropRect:options:error:pixelBufferRepsCacheKey:", v36, v37, 1111970369, v18, a8, &v42, v26, v27, v28, v29);
    id v39 = v42;
    *a7 = v38;
    BOOL v40 = v38 != 0;
    if (v38) {
      [(VNDetector *)self recordImageCropQuickLookInfoToOptionsSafe:v18 cacheKey:v39 imageBuffer:v22];
    }
  }
  else
  {
LABEL_17:
    BOOL v40 = 0;
  }

  return v40;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  v56[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v54.receiver = self;
  v54.super_class = (Class)VNFaceDetectorRevision2;
  if ([(VNDetector *)&v54 completeInitializationForSession:v6 error:a4])
  {
    uint64_t v7 = [(VNDetector *)self boundComputeDeviceForComputeStage:@"VNComputeStageMain" error:a4];
    if (v7)
    {
      unint64_t v36 = VNFrameworkBundle();
      uint64_t v8 = [NSString stringWithUTF8String:"6ziz6uinva_opt.espresso"];
      uint64_t v9 = [v36 pathForResource:v8 ofType:@"net"];

      if (v9)
      {
        objc_super v10 = [(VNDetector *)self configurationOptions];
        v11 = (objc_class *)objc_opt_class();
        size_t v12 = NSStringFromClass(v11);
        NSLog(&cfstr_FbbaCreatingVn.isa, v12);

        BOOL v35 = +[VNFaceBBoxAligner supportedComputeStageDevicesForOptions:v10 error:a4];
        size_t v13 = (void *)[v10 mutableCopy];
        float v55 = @"VNComputeStageMain";
        v14 = [v35 objectForKeyedSubscript:@"VNComputeStageMain"];
        v15 = [v14 firstObject];
        v56[0] = v15;
        float v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:&v55 count:1];
        [v13 setObject:v16 forKeyedSubscript:@"VNDetectorOption_ComputeStageDeviceAssignments"];

        float v17 = (void *)[v13 copy];
        id v18 = [v6 detectorOfType:@"VNFaceBoxAlignerType" configuredWithOptions:v17 error:a4];
        faceBBoxAligner = self->_faceBBoxAligner;
        self->_faceBBoxAligner = v18;

        if (self->_faceBBoxAligner
          && +[VNValidationUtilities getBOOLValue:&self->_preferBackgroundProcessing forKey:@"VNDetectorOption_PreferBackgroundProcessing" inOptions:v10 withDefaultValue:0 error:a4])
        {
          uint64_t v38 = 0;
          id v39 = &v38;
          uint64_t v40 = 0x8812000000;
          BOOL v41 = __Block_byref_object_copy__1548;
          id v42 = __Block_byref_object_dispose__1549;
          float v43 = " 0";
          uint64_t v44 = 0x3DCCCCCD3F0CCCCDLL;
          __int16 v46 = 256;
          uint64_t v47 = 0x5FFFFFFFFLL;
          int v48 = 65552;
          *(_OWORD *)float v49 = 0u;
          *(_OWORD *)__p = 0u;
          long long v51 = 0u;
          char v52 = 0;
          int v53 = 1041865114;
          id v45 = 0;
          id v20 = (const std::string::value_type *)[v9 UTF8String];
          std::string::__assign_external((std::string *)(v39 + 10), v20);
          BOOL v21 = +[VNComputeDeviceUtilities isNeuralEngineComputeDevice:v7];
          *((unsigned char *)v39 + 64) = v21;
          BOOL v22 = +[VNComputeDeviceUtilities isGPUComputeDevice:v7];
          *((unsigned char *)v39 + 65) = v22;
          int v23 = +[VNEspressoHelpers espressoDeviceIDForComputeDevice:v7];
          unint64_t v24 = v39;
          *((_DWORD *)v39 + 17) = v23;
          if (self->_preferBackgroundProcessing && *((unsigned char *)v24 + 65))
          {
            int v25 = 5;
          }
          else
          {
            int v25 = +[VNEspressoHelpers espressoEngineForComputeDevice:v7];
            unint64_t v24 = v39;
          }
          *((_DWORD *)v24 + 18) = v25;
          int v27 = +[VNEspressoHelpers espressoStorageTypeForComputeDevice:v7];
          double v28 = v39;
          *((_DWORD *)v39 + 19) = v27;
          if (*((unsigned char *)v28 + 65))
          {
            uint64_t v29 = [(VNDetector *)self metalContext];
            unint64_t v30 = (void *)v29;
            if (v29) {
              unint64_t v31 = *(void **)(v29 + 8);
            }
            else {
              unint64_t v31 = 0;
            }
            id v32 = v31;
            *((_DWORD *)v39 + 17) = espresso_device_id_for_metal_device();
          }
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __66__VNFaceDetectorRevision2_completeInitializationForSession_error___block_invoke;
          aBlock[3] = &unk_1E5B1C060;
          void aBlock[4] = self;
          aBlock[5] = &v38;
          float v33 = _Block_copy(aBlock);
          char v26 = VNExecuteBlock(v33, (uint64_t)a4);

          _Block_object_dispose(&v38, 8);
          if (SHIBYTE(v51) < 0) {
            operator delete(__p[1]);
          }
          if (SHIBYTE(__p[0]) < 0) {
            operator delete(v49[0]);
          }
        }
        else
        {
          char v26 = 0;
        }
      }
      else if (a4)
      {
        +[VNError errorForInternalErrorWithLocalizedDescription:@"could not locate the face detection model file"];
        char v26 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        char v26 = 0;
      }
    }
    else
    {
      char v26 = 0;
    }
  }
  else
  {
    char v26 = 0;
  }

  return v26;
}

uint64_t __66__VNFaceDetectorRevision2_completeInitializationForSession_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = (char *)operator new(0x98uLL);
  *((void *)v3 + 1) = 0;
  *((void *)v3 + 2) = 0;
  *(void *)uint64_t v3 = &unk_1EF753B98;
  v3[32] = 1;
  *((void *)v3 + 3) = &unk_1EF752E40;
  *((void *)v3 + 5) = *(void *)(v2 + 48);
  *((void *)v3 + 6) = *(id *)(v2 + 56);
  *(_OWORD *)(v3 + 56) = *(_OWORD *)(v2 + 64);
  if (*(char *)(v2 + 103) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)v3 + 3, *(const std::string::value_type **)(v2 + 80), *(void *)(v2 + 88));
  }
  else
  {
    long long v4 = *(_OWORD *)(v2 + 80);
    *((void *)v3 + 11) = *(void *)(v2 + 96);
    *(_OWORD *)(v3 + 72) = v4;
  }
  uint64_t v5 = (std::string *)(v3 + 96);
  if (*(char *)(v2 + 127) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *(const std::string::value_type **)(v2 + 104), *(void *)(v2 + 112));
  }
  else
  {
    long long v6 = *(_OWORD *)(v2 + 104);
    *((void *)v3 + 14) = *(void *)(v2 + 120);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
  uint64_t v7 = *(void *)(v2 + 128);
  *((void *)v3 + 17) = 0;
  uint64_t v8 = v3 + 136;
  *((void *)v3 + 15) = v7;
  v3[128] = 1;
  *((void *)v3 + 18) = 0;
  uint64_t v9 = (char *)operator new(0x90uLL);
  *((void *)v9 + 1) = 0;
  *((void *)v9 + 2) = 0;
  *(void *)uint64_t v9 = &unk_1EF753B60;
  *((_OWORD *)v9 + 3) = 0u;
  *((_OWORD *)v9 + 4) = 0u;
  *((_OWORD *)v9 + 5) = 0u;
  *((_OWORD *)v9 + 6) = 0u;
  *((_OWORD *)v9 + 2) = 0u;
  *((_OWORD *)v9 + 7) = 0u;
  *((_OWORD *)v9 + 8) = 0u;
  v9[41] = 1;
  *(void *)(v9 + 44) = 0x5FFFFFFFFLL;
  *((_DWORD *)v9 + 13) = 65552;
  *(_OWORD *)(v9 + 72) = 0u;
  *(_OWORD *)(v9 + 88) = 0u;
  *(_OWORD *)(v9 + 56) = 0u;
  v9[104] = 0;
  *((_DWORD *)v9 + 27) = 1041865114;
  *((void *)v9 + 14) = 0;
  *((void *)v9 + 15) = 0;
  v9[136] = 0;
  *((void *)v9 + 16) = 0;
  *((void *)v3 + 17) = v9 + 24;
  *((void *)v3 + 18) = v9;
  objc_super v10 = *(void **)(v2 + 56);
  *((void *)v9 + 3) = *(void *)(v2 + 48);
  objc_storeStrong((id *)v9 + 4, v10);
  *(_OWORD *)(v9 + 40) = *(_OWORD *)(v2 + 64);
  std::string::operator=((std::string *)(v9 + 56), (const std::string *)(v2 + 80));
  std::string::operator=((std::string *)(v9 + 80), (const std::string *)(v2 + 104));
  *((void *)v9 + 13) = *(void *)(v2 + 128);
  if (!*(void *)(v2 + 56))
  {
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.espresso.mainqueue", v11);
    size_t v13 = *(void **)(*(void *)v8 + 8);
    *(void *)(*(void *)v8 + 8) = v12;
  }
  v14 = *(void **)(*(void *)v8 + 8);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = ___ZN6vision3mod33ObjectDetector_DCNFaceDetector_v2C2ERKNS0_41ObjectDetector_DCNFaceDetector_v2_OptionsE_block_invoke;
  v18[3] = &__block_descriptor_48_e5_v8__0l;
  v18[4] = v3 + 24;
  v18[5] = v2 + 48;
  vision::mod::dispatch_sync_guard(v14, v18);
  *(void *)&long long v15 = v3 + 24;
  *((void *)&v15 + 1) = v3;
  float v16 = *(std::__shared_weak_count **)(*(void *)(a1 + 32) + 64);
  *(_OWORD *)(*(void *)(a1 + 32) + 56) = v15;
  if (v16) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v16);
  }
  return 1;
}

@end