@interface VNFaceGazeDetector
+ (id)computeStagesToBindForConfigurationOptions:(id)a3;
+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4;
+ (id)supportedImageSizeSetForOptions:(id)a3 error:(id *)a4;
- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4;
- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9;
- (id).cxx_construct;
- (id)internalProcessUsingQualityOfServiceClass:(unsigned int)a3 options:(id)a4 regionOfInterest:(CGRect)a5 warningRecorder:(id)a6 error:(id *)a7 progressHandler:(id)a8;
@end

@implementation VNFaceGazeDetector

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 10) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_gazeFollowPredictor.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
  v4 = self->_gazePredictor.__cntrl_;
  if (v4)
  {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v4);
  }
}

- (id)internalProcessUsingQualityOfServiceClass:(unsigned int)a3 options:(id)a4 regionOfInterest:(CGRect)a5 warningRecorder:(id)a6 error:(id *)a7 progressHandler:(id)a8
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v17 = a4;
  id v158 = a6;
  v156 = a7;
  id v157 = a8;
  v159 = v17;
  v18 = +[VNValidationUtilities requiredFaceObservationsInOptions:v17 error:a7];
  v19 = v18;
  if (!v18) {
    goto LABEL_23;
  }
  v20 = (char *)[v18 count];
  if (!v20)
  {
    id v25 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_25;
  }
  *(void *)((char *)&v208 + 5) = 0;
  *(void *)&long long v208 = 0;
  if (!+[VNValidationUtilities getFloatValue:&v208 forKey:@"VNFaceGazeDetectorProcessOption_GazeHeatMapThreshold" inOptions:v17 error:a7])goto LABEL_23; {
  if (!+[VNValidationUtilities getFloatValue:(char *)&v208 + 8 forKey:@"VNFaceGazeDetectorProcessOption_MinimumFaceDimension" inOptions:v17 error:a7])goto LABEL_23;
  }
  float v207 = 0.0;
  if (!+[VNValidationUtilities getFloatValue:&v207 forKey:@"VNFaceGazeDetectorProcessOption_CommonGazeLocationRadius" inOptions:v17 error:a7])goto LABEL_23; {
  *(float *)&double v21 = v207;
  }
  if (v207 > 0.0)
  {
    ptr = self->_gazeFollowPredictor.__ptr_;
    float v23 = (float)*((unint64_t *)ptr + 29);
    if (v23 >= (float)*((unint64_t *)ptr + 30)) {
      float v23 = (float)*((unint64_t *)ptr + 30);
    }
    *(float *)&double v21 = v23 * v207;
    if ((float)(v23 * v207) < 1.0) {
      *(float *)&double v21 = 1.0;
    }
    DWORD1(v208) = (unint64_t)*(float *)&v21;
  }
  char v206 = 0;
  if (!+[VNValidationUtilities getBOOLValue:&v206, @"VNFaceGazeDetectorProcessOption_DontFollowGaze", v17, 0, a7, v21 forKey inOptions withDefaultValue error])
  {
LABEL_23:
    id v25 = 0;
    goto LABEL_25;
  }
  BYTE12(v208) = v206;
  v24 = [(VNDetector *)self validatedImageBufferFromOptions:v17 error:a7];
  id v25 = v24;
  v149 = v24;
  if (!v24) {
    goto LABEL_100;
  }
  v147 = v19;
  unint64_t v26 = [v24 width];
  unint64_t v27 = [v25 height];
  uint64_t v199 = 0;
  v200 = &v199;
  uint64_t v201 = 0x4812000000;
  v202 = __Block_byref_object_copy__36458;
  v203 = __Block_byref_object_dispose__36459;
  v204 = "";
  std::vector<CamGaze_output_label>::vector(__p, (unint64_t)v20);
  uint64_t v192 = 0;
  v193 = &v192;
  uint64_t v194 = 0x4812000000;
  v195 = __Block_byref_object_copy__55;
  v196 = __Block_byref_object_dispose__56;
  v197 = "";
  std::vector<GazeFollowOutputsPerFace>::vector(v198, (unint64_t)v20);
  v146 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v20];
  v190[0] = 0;
  v190[1] = v190;
  v190[2] = 0x3812000000;
  v190[3] = __Block_byref_object_copy__59;
  v190[4] = __Block_byref_object_dispose__60;
  v190[5] = "";
  int v191 = 0;
  objc_initWeak(&location, self);
  v28 = objc_opt_class();
  int v138 = [v28 VNClassCode];
  v145 = [v28 detectorCropCreationAsyncTasksQueue];
  dispatch_group_t v144 = dispatch_group_create();
  v143 = [v28 detectorCropProcessingAsyncTasksQueue];
  dispatch_group_t v142 = dispatch_group_create();
  VNValidatedLog(1, @"Start processing cropProcessingGroup. currentDetector: %@", v29, v30, v31, v32, v33, v34, (uint64_t)self);
  v35 = 0;
  double v134 = width * (double)v26;
  double v136 = x * (double)v26;
  double v133 = y * (double)v27;
  double v36 = height * (double)v27;
  v150 = self;
  do
  {
    v37 = [v19 objectAtIndexedSubscript:v35];
    v38 = v37;
    if (v37)
    {
      [v37 unalignedBoundingBox];
      v40 = v39;
      v42 = v41;
      v44 = v43;
      v46 = v45;
    }
    else
    {
      v42 = 0;
      v44 = 0;
      v46 = 0;
      v40 = 0;
    }

    aBlock = 0;
    uint64_t p_aBlock = (uint64_t)&aBlock;
    uint64_t v211 = 0x3032000000;
    v212 = __Block_byref_object_copy__65;
    v213 = __Block_byref_object_dispose__66;
    id v214 = 0;
    v188[0] = 0;
    v188[1] = v188;
    v188[2] = 0x2020000000;
    v188[3] = 0;
    v47 = (void *)[v159 mutableCopy];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __127__VNFaceGazeDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke;
    block[3] = &unk_1E5B1FE38;
    objc_copyWeak(v185, &location);
    int v186 = v138;
    v183 = &aBlock;
    v185[1] = v35;
    v48 = v144;
    v178 = v48;
    unsigned int v187 = a3;
    v185[2] = v40;
    v185[3] = v42;
    v185[4] = v44;
    v185[5] = v46;
    id v49 = v47;
    id v179 = v49;
    id v180 = v158;
    v184 = v188;
    id v182 = v157;
    v185[6] = v20;
    id v152 = v145;
    id v181 = v152;
    dispatch_block_t v50 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, (dispatch_qos_class_t)a3, 0, block);
    v160[0] = MEMORY[0x1E4F143A8];
    v160[1] = 3221225472;
    v160[2] = __127__VNFaceGazeDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_3;
    v160[3] = &unk_1E5B1FEB0;
    objc_copyWeak(v173, &location);
    v168 = &aBlock;
    unsigned int v174 = a3;
    v51 = v50;
    int v175 = v138;
    id v167 = v51;
    v173[1] = v35;
    v155 = v142;
    v161 = v155;
    v162 = self;
    v169 = &v199;
    v170 = &v192;
    v171 = v188;
    v173[2] = v40;
    v173[3] = v42;
    v173[4] = v44;
    v173[5] = v46;
    id v163 = v149;
    v173[6] = *(id *)&v136;
    v173[7] = *(id *)&v133;
    v173[8] = *(id *)&v134;
    v173[9] = *(id *)&v36;
    id v52 = v49;
    long long v176 = v208;
    id v164 = v52;
    v172 = v190;
    id v148 = v146;
    id v165 = v148;
    v173[10] = v20;
    id v151 = v143;
    id v166 = v151;
    v59 = (void (**)(void))dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, (dispatch_qos_class_t)a3, 0, v160);
    v19 = v147;
    if ((unint64_t)v20 < 2)
    {
      VNValidatedLog(1, @"Performing createRegionOfInterestCropForProcessingBlock. currentDetector: %@", v53, v54, v55, v56, v57, v58, (uint64_t)self);
      v51[2](v51);
      VNValidatedLog(1, @"Performing processRegionOfInterestBlock. currentDetector: %@", v66, v67, v68, v69, v70, v71, (uint64_t)self);
      v59[2](v59);
      VNValidatedLog(1, @"Finish processing createRegionOfInterestCropForProcessingBlock and processRegionOfInterestBlock. currentDetector: %@", v72, v73, v74, v75, v76, v77, (uint64_t)self);
    }
    else
    {
      VNValidatedLog(1, @"Scheduling createRegionOfInterestCropForProcessingBlock. currentDetector: %@; group: %@",
        v53,
        v54,
        v55,
        v56,
        v57,
        v58,
        (uint64_t)self);
      [v152 dispatchGroupAsyncByPreservingQueueCapacity:v48 block:v51];
      VNValidatedLog(1, @"Scheduling processRegionOfInterestBlock. currentDetector: %@; group: %@",
        v60,
        v61,
        v62,
        v63,
        v64,
        v65,
        (uint64_t)self);
      [v151 dispatchGroupAsyncByPreservingQueueCapacity:v155 block:v59];
    }

    objc_destroyWeak(v173);
    objc_destroyWeak(v185);

    _Block_object_dispose(v188, 8);
    _Block_object_dispose(&aBlock, 8);

    ++v35;
  }
  while (v20 != v35);
  if ((unint64_t)v20 > 1)
  {
    VNValidatedLog(1, @"Waiting for cropCreationGroup. currentDetector: %@; group: %@",
      v78,
      v79,
      v80,
      v81,
      v82,
      v83,
      (uint64_t)self);
    if ([v152 dispatchGroupWait:v48 error:v156])
    {
      VNValidatedLog(1, @"Waiting for cropProcessingGroup. currentDetector: %@; group: %@",
        v85,
        v86,
        v87,
        v88,
        v89,
        v90,
        (uint64_t)self);
      if ([v151 dispatchGroupWait:v155 error:v156])
      {
        VNValidatedLog(1, @"Finish processing cropCreationGroup and cropProcessingGroup. currentDetector: %@; cropCreationGroup: %@; cropProcessingGroup: %@",
          v85,
          v86,
          v87,
          v88,
          v89,
          v90,
          (uint64_t)self);
        goto LABEL_32;
      }
      v131 = @"Timed out waiting for face gaze cropProcessingGroup for face observations: %@. currentDetector: %@; group: %@";
    }
    else
    {
      v131 = @"Timed out waiting for face gaze cropCreationGroup for face observations: %@. currentDetector: %@; group: %@";
    }
    VNValidatedLog(4, (uint64_t)v131, v85, v86, v87, v88, v89, v90, (uint64_t)v147);
    v132 = v48;
    goto LABEL_94;
  }
LABEL_32:
  v132 = v48;
  if (!+[VNValidationUtilities validateAsyncStatusResults:v148 error:v156])
  {
LABEL_94:
    id v25 = 0;
    goto LABEL_98;
  }
  vision::mod::GazeFollowPredictor::postProcessGazeLabels((uint64_t)self->_gazeFollowPredictor.__ptr_, v193[6], v193[7], (uint64_t)&v208);
  v139 = [v147 valueForKey:@"uuid"];
  uint64_t v91 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v159 error:v156];
  v92 = (void *)v91;
  if (!v91)
  {
    id v25 = 0;
    goto LABEL_97;
  }
  v137 = (void *)v91;
  v93 = 0;
  uint64_t v94 = 48;
  v135 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v20];
  do
  {
    v95 = [v147 objectAtIndexedSubscript:v93];
    int v96 = *(_DWORD *)(v200[6] + 4 * (void)v93);
    uint64_t v97 = v193[6];
    id v98 = v95;
    id v99 = v139;
    to = v92;
    v141 = v99;
    if (v150)
    {
      switch(v96)
      {
        case 0:
          switch(*(_DWORD *)(v97 + v94 - 32))
          {
            case 0:
              v153 = 0;
              uint64_t v100 = 2;
              goto LABEL_44;
            case 1:
              goto LABEL_39;
            case 2:
              goto LABEL_43;
            case 3:
              if (*(_DWORD *)(v97 + v94 + 12) == -1)
              {
                v153 = 0;
              }
              else
              {
                objc_msgSend(v99, "objectAtIndex:");
                v153 = (id *)objc_claimAutoreleasedReturnValue();
              }
              uint64_t v100 = 5;
              goto LABEL_44;
            case 4:
              v153 = 0;
              uint64_t v100 = 4;
              goto LABEL_44;
            default:
              goto LABEL_42;
          }
        case 2:
LABEL_43:
          v153 = 0;
          uint64_t v100 = 1;
          break;
        case 1:
LABEL_39:
          v153 = 0;
          uint64_t v100 = 3;
          break;
        default:
LABEL_42:
          v153 = 0;
          uint64_t v140 = 0;
LABEL_45:
          uint64_t v101 = v97 + v94;
          int v102 = *(_DWORD *)(v97 + v94 + 4);
          if (v102 < 0 || (int v103 = *(_DWORD *)(v101 + 8), v103 < 0))
          {
            double v105 = -1.0;
            double v106 = -1.0;
          }
          else
          {
            v104 = v150->_gazeFollowPredictor.__ptr_;
            double v105 = (double)v102 / (float)*((unint64_t *)v104 + 29);
            double v106 = 1.0 - (double)v103 / (float)*((unint64_t *)v104 + 30);
          }
          float32x4_t v107 = *(float32x4_t *)(v101 + 20);
          char v108 = vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f32(v107), (int8x16_t)vcgezq_f32(v107)))));
          if (v108) {
            double v109 = *MEMORY[0x1E4F1DB20];
          }
          else {
            double v109 = v107.f32[0];
          }
          if (v108) {
            double v110 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
          }
          else {
            double v110 = 1.0 - COERCE_FLOAT(HIDWORD(*(void *)(v101 + 20))) - COERCE_FLOAT(*(void *)(v101 + 28));
          }
          if (v108) {
            double v111 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
          }
          else {
            double v111 = COERCE_FLOAT(HIDWORD(*(_OWORD *)(v101 + 20)));
          }
          if (v108) {
            double v112 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
          }
          else {
            double v112 = COERCE_FLOAT(*(void *)(v101 + 28));
          }
          int v113 = *(_DWORD *)(v101 + 16);
          int v114 = *(_DWORD *)(v101 - 32);
          BOOL v115 = v114 == -1 || v114 == 2;
          if (v115
            || (v121 = *(char **)(v97 + v94 - 24), v122 = *(char **)(v97 + v94 - 16), uint64_t v123 = v122 - v121, v122 == v121)
            || (uint64_t v124 = *(void *)(*(void *)(v97 + v94 - 24) + 8) - *(void *)v121) == 0)
          {
            v116 = 0;
          }
          else
          {
            size_t v125 = 0xAAAAAAAAAAAAAAABLL * (v123 >> 3);
            uint64_t v126 = v124 >> 2;
            id v25 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, v124 >> 2, v125, 1278226534, v156);
            if (!v25)
            {
              v116 = 0;
              goto LABEL_68;
            }
            aBlock = (void **)MEMORY[0x1E4F143A8];
            uint64_t p_aBlock = 3221225472;
            uint64_t v211 = (uint64_t)__70__VNFaceGazeDetector__createPixelBuffer_forGazeMapOfGazeFollow_error___block_invoke;
            v212 = (uint64_t (*)(uint64_t, uint64_t))&__block_descriptor_56_e25_B24__0____CVBuffer__8__16l;
            v213 = (void (*)(uint64_t))v126;
            id v214 = (id)v125;
            uint64_t v215 = v97 + v94 - 48;
            v127 = _Block_copy(&aBlock);
            int v128 = VNExecuteBlockWithPixelBuffer((__CVBuffer *)v25, 0, v127, v156);
            if (!v128) {
              id v25 = 0;
            }

            if (v25) {
              char v129 = v128;
            }
            else {
              char v129 = 0;
            }
            if (v129)
            {
              v116 = [[VNPixelBufferObservation alloc] initWithOriginatingRequestSpecifier:to featureName:0 CVPixelBuffer:v25];
              CVPixelBufferRelease((CVPixelBufferRef)v25);
              LODWORD(v130) = *(_DWORD *)(v97 + v94);
              [(VNObservation *)v116 setConfidence:v130];
            }
            else
            {
              v116 = 0;
              id v25 = 0;
              if (!v128) {
                goto LABEL_68;
              }
            }
          }
          v117 = [VNFaceGaze alloc];
          v118 = [v98 uuid];
          LODWORD(v119) = v113;
          v120 = -[VNFaceGaze initWithFaceObservationUUID:direction:location:bounds:horizontalAngle:lookedAtFaceObservationUUID:gazeMask:originatingRequestSpecifier:](v117, "initWithFaceObservationUUID:direction:location:bounds:horizontalAngle:lookedAtFaceObservationUUID:gazeMask:originatingRequestSpecifier:", v118, v140, v153, v116, to, v105, v106, v109, v110, v111, v112, v119);

          objc_msgSend(v98, "vn_cloneObject");
          id v25 = (id)objc_claimAutoreleasedReturnValue();
          [v25 setGaze:v120];

LABEL_68:
          goto LABEL_69;
      }
LABEL_44:
      uint64_t v140 = v100;
      goto LABEL_45;
    }
    id v25 = 0;
LABEL_69:

    v92 = v137;
    if (!v25) {
      goto LABEL_96;
    }
    [v135 addObject:v25];

    ++v93;
    v94 += 136;
  }
  while (v20 != v93);
  id v25 = v135;
LABEL_96:

LABEL_97:
LABEL_98:

  objc_destroyWeak(&location);
  _Block_object_dispose(v190, 8);

  _Block_object_dispose(&v192, 8);
  aBlock = (void **)v198;
  std::vector<GazeFollowOutputsPerFace>::__destroy_vector::operator()[abi:ne180100](&aBlock);
  _Block_object_dispose(&v199, 8);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
LABEL_100:

LABEL_25:

  return v25;
}

void __127__VNFaceGazeDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (WeakRetained)
  {
    kdebug_trace();
    VNValidatedLog(1, @"createRegionOfInterestCropForProcessingBlock: start processing; currentDetector: %@",
      v3,
      v4,
      v5,
      v6,
      v7,
      v8,
      (uint64_t)WeakRetained);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __127__VNFaceGazeDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_2;
    aBlock[3] = &unk_1E5B1FE10;
    int v41 = *(_DWORD *)(a1 + 148);
    id v9 = WeakRetained;
    id v34 = v9;
    long long v39 = *(_OWORD *)(a1 + 104);
    long long v40 = *(_OWORD *)(a1 + 120);
    id v35 = *(id *)(a1 + 40);
    id v10 = *(id *)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 80);
    id v36 = v10;
    uint64_t v38 = v11;
    id v37 = *(id *)(a1 + 64);
    v12 = (uint64_t (**)(void *, id *, double, double, double, double))_Block_copy(aBlock);
    double v13 = *(double *)(a1 + 104);
    double v14 = *(double *)(a1 + 112);
    double v15 = *(double *)(a1 + 120);
    double v16 = *(double *)(a1 + 128);
    id v32 = 0;
    uint64_t v17 = v12[2](v12, &v32, v13, v14, v15, v16);
    id v18 = v32;
    v19 = [[VNAsyncStatus alloc] initWithStatus:v17 error:v18];
    uint64_t v20 = *(void *)(*(void *)(a1 + 72) + 8);
    double v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;

    VNValidatedLog(1, @"createRegionOfInterestCropForProcessingBlock: finish processing; currentDetector: %@",
      v22,
      v23,
      v24,
      v25,
      v26,
      v27,
      (uint64_t)v9);
    kdebug_trace();
    if (*(void *)(a1 + 136) >= 2uLL) {
      [*(id *)(a1 + 56) dispatchReportBlockCompletion];
    }
  }
  else
  {
    v28 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Currently executed Detector should not be nil"];
    uint64_t v29 = [[VNAsyncStatus alloc] initWithStatus:0 error:v28];
    uint64_t v30 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v31 = *(void **)(v30 + 40);
    *(void *)(v30 + 40) = v29;
  }
}

void __127__VNFaceGazeDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 128));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    VNValidatedLog(1, @"processRegionOfInterestBlock: start processing; currentDetector: %@",
      v3,
      v4,
      v5,
      v6,
      v7,
      v8,
      (uint64_t)WeakRetained);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __127__VNFaceGazeDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_4;
    aBlock[3] = &unk_1E5B1FE88;
    id v41 = *(id *)(a1 + 80);
    id v10 = v9;
    int v49 = *(_DWORD *)(a1 + 220);
    uint64_t v11 = *(void *)(a1 + 136);
    id v36 = v10;
    uint64_t v44 = v11;
    id v12 = *(id *)(a1 + 32);
    long long v13 = *(_OWORD *)(a1 + 104);
    long long v42 = *(_OWORD *)(a1 + 88);
    long long v43 = v13;
    long long v14 = *(_OWORD *)(a1 + 160);
    long long v45 = *(_OWORD *)(a1 + 144);
    int v50 = *(_DWORD *)(a1 + 216);
    uint64_t v15 = *(void *)(a1 + 40);
    double v16 = *(void **)(a1 + 48);
    id v37 = v12;
    uint64_t v38 = v15;
    long long v46 = v14;
    id v39 = v16;
    long long v17 = *(_OWORD *)(a1 + 192);
    long long v47 = *(_OWORD *)(a1 + 176);
    long long v48 = v17;
    id v40 = *(id *)(a1 + 56);
    long long v51 = *(_OWORD *)(a1 + 224);
    id v18 = _Block_copy(aBlock);
    id v34 = 0;
    uint64_t v19 = VNExecuteBlock(v18, (uint64_t)&v34);
    id v20 = v34;
    double v21 = [[VNAsyncStatus alloc] initWithStatus:v19 error:v20];
    uint64_t v22 = *(void *)(*(void *)(a1 + 88) + 8);
    uint64_t v23 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = v21;

    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 120) + 8) + 48));
    [*(id *)(a1 + 64) addObject:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 120) + 8) + 48));
    VNValidatedLog(1, @"processRegionOfInterestBlock: finish processing; currentDetector: %@",
      v24,
      v25,
      v26,
      v27,
      v28,
      v29,
      (uint64_t)v10);
    kdebug_trace();
    if (*(void *)(a1 + 208) >= 2uLL) {
      [*(id *)(a1 + 72) dispatchReportBlockCompletion];
    }
  }
  else
  {
    uint64_t v30 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Currently executed Detector should not be nil"];
    uint64_t v31 = [[VNAsyncStatus alloc] initWithStatus:0 error:v30];
    uint64_t v32 = *(void *)(*(void *)(a1 + 88) + 8);
    uint64_t v33 = *(void **)(v32 + 40);
    *(void *)(v32 + 40) = v31;
  }
  CVPixelBufferRelease(*(CVPixelBufferRef *)(*(void *)(*(void *)(a1 + 112) + 8) + 24));
  *(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = 0;
}

uint64_t __70__VNFaceGazeDetector__createPixelBuffer_forGazeMapOfGazeFollow_error___block_invoke(void *a1, CVPixelBufferRef pixelBuffer)
{
  uint64_t v4 = a1[4];
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
  if (a1[5])
  {
    uint64_t v7 = BaseAddress;
    uint64_t v8 = 0;
    unint64_t v9 = 0;
    size_t v10 = 4 * v4;
    do
    {
      memcpy(v7, *(const void **)(*(void *)(a1[6] + 24) + v8), v10);
      v7 += BytesPerRow;
      ++v9;
      v8 += 24;
    }
    while (v9 < a1[5]);
  }
  return 1;
}

BOOL __127__VNFaceGazeDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_4(uint64_t a1, void *a2)
{
  if (dispatch_block_wait(*(dispatch_block_t *)(a1 + 72), 0xFFFFFFFFFFFFFFFFLL))
  {
    if (a2)
    {
      uint64_t v4 = +[VNError errorForExecutionTimeoutWithLocalizedDescription:@"Timed out waiting for dependent task execution"];
LABEL_8:
      BOOL v18 = 0;
      *a2 = v4;
      return v18;
    }
    return 0;
  }
  kdebug_trace();
  VNValidatedLog(1, @"processRegionOfInterestBlock: start processing (crop is ready); currentDetector: %@",
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
    *(void *)(a1 + 32));
  if (([*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) completed] & 1) == 0)
  {
    if (a2)
    {
      uint64_t v4 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) error];
      goto LABEL_8;
    }
    return 0;
  }
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 1;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __127__VNFaceGazeDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_5;
  aBlock[3] = &unk_1E5B1FE60;
  id v21 = *(id *)(a1 + 32);
  int v34 = *(_DWORD *)(a1 + 184);
  id v11 = *(id *)(a1 + 40);
  int v35 = *(_DWORD *)(a1 + 188);
  uint64_t v26 = &v37;
  uint64_t v12 = *(void *)(a1 + 48);
  long long v13 = *(void **)(a1 + 56);
  id v22 = v11;
  uint64_t v23 = v12;
  long long v27 = *(_OWORD *)(a1 + 88);
  uint64_t v14 = *(void *)(a1 + 112);
  uint64_t v28 = *(void *)(a1 + 104);
  uint64_t v29 = v14;
  long long v15 = *(_OWORD *)(a1 + 136);
  long long v30 = *(_OWORD *)(a1 + 120);
  long long v31 = v15;
  id v24 = v13;
  long long v16 = *(_OWORD *)(a1 + 168);
  long long v32 = *(_OWORD *)(a1 + 152);
  long long v33 = v16;
  id v25 = *(id *)(a1 + 64);
  long long v36 = *(_OWORD *)(a1 + 192);
  long long v17 = _Block_copy(aBlock);
  CVPixelBufferLockBaseAddress(*(CVPixelBufferRef *)(*(void *)(*(void *)(a1 + 104) + 8) + 24), 1uLL);
  [(id)objc_opt_class() runSuccessReportingBlockSynchronously:v17 detector:*(void *)(a1 + 32) qosClass:*(unsigned int *)(a1 + 188) error:a2];
  CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(*(void *)(*(void *)(a1 + 104) + 8) + 24), 1uLL);
  BOOL v18 = *((unsigned char *)v38 + 24) != 0;

  _Block_object_dispose(&v37, 8);
  return v18;
}

uint64_t __127__VNFaceGazeDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v150 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  VNValidatedLog(1, @"processRegionOfInterest Netto: start processing; currentDetector: %@",
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    *(void *)(a1 + 32));
  uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 48);
  uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 48);
  uint64_t v12 = *(void *)(a1 + 104);
  long long v13 = *(__CVBuffer **)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
  uint64_t v14 = *(void *)(a1 + 48);
  double v15 = *(double *)(a1 + 144);
  double v16 = *(double *)(a1 + 152);
  double v17 = *(double *)(a1 + 160);
  double v18 = *(double *)(a1 + 168);
  uint64_t v19 = *(void **)(a1 + 64);
  id v133 = *(id *)(a1 + 56);
  id v132 = v19;
  if (!v14) {
    goto LABEL_9;
  }
  *(_DWORD *)(v10 + 4 * v12) = 2;
  uint64_t v20 = v11 + 136 * v12;
  *(_DWORD *)(v20 + 16) = -1;
  id v21 = (_DWORD *)(v20 + 16);
  src.data = CVPixelBufferGetBaseAddress(v13);
  src.double height = CVPixelBufferGetHeight(v13);
  src.double width = CVPixelBufferGetWidth(v13);
  src.rowBytes = CVPixelBufferGetBytesPerRow(v13);
  uint64_t v22 = *(void *)(v14 + 56);
  if ((ImageProcessing_reallocVImageBuffer(v22 + 64, (unint64_t)(float)*(unint64_t *)v22, (unint64_t)(float)*(unint64_t *)(v22 + 8), 4) & 0x80) != 0)vImageScale_ARGB8888(&src, (const vImage_Buffer *)(v22 + 64), 0, 0x20u); {
  long long v23 = *(_OWORD *)(v22 + 80);
  }
  *(_OWORD *)__p = *(_OWORD *)(v22 + 64);
  long long v136 = v23;
  if (espresso_network_bind_input_vimagebuffer_bgra8()) {
    goto LABEL_7;
  }
  if (!espresso_plan_execute_sync())
  {
    id v25 = *(float **)(v22 + 128);
    float v26 = *v25;
    float v27 = v25[1];
    float v28 = v25[2];
    BOOL v29 = v27 > *v25;
    if (v27 <= v28) {
      BOOL v29 = 0;
    }
    if (v28 <= v27 || v28 <= v26) {
      int v31 = v29;
    }
    else {
      int v31 = 2;
    }
    *(_DWORD *)(v10 + 4 * v12) = v31;
    id v32 = v133;
    id v130 = v132;
    v131 = v32;
    unint64_t v33 = [v32 width];
    unint64_t v34 = [v32 height];
    uint64_t v35 = v11 + 136 * v12;
    double v36 = (double)v33;
    double v37 = (double)v34;
    double v38 = VNNormalizedRectForPixelRectInBounds(*(double *)(a1 + 112) * (double)v33, *(double *)(a1 + 120) * (double)v34, *(double *)(a1 + 128) * (double)v33, *(double *)(a1 + 136) * (double)v34, v15, v16, v17, v18);
    double v41 = v40;
    double v43 = v42;
    *(float *)&double v40 = v38;
    float v44 = 1.0 - v39 - v42;
    float v45 = v42;
    *(_DWORD *)uint64_t v35 = LODWORD(v40);
    *(float *)(v35 + 4) = v44;
    *(float *)&double v42 = v41;
    *(float *)(v35 + 8) = v45;
    *(_DWORD *)(v35 + 12) = LODWORD(v42);
    if (v31)
    {
      if (v31 == 1)
      {
        char v24 = 1;
        *id v21 = 1;
LABEL_24:
        long long v46 = v130;
LABEL_25:

        goto LABEL_26;
      }
      *id v21 = 2;
LABEL_23:
      char v24 = 1;
      goto LABEL_24;
    }
    *id v21 = 0;
    if (*(unsigned char *)(a1 + 196)) {
      goto LABEL_23;
    }
    double v126 = v38;
    *(double *)&CVPixelBufferRef pixelBuffer = v39;
    float v120 = v38;
    float v124 = v44;
    long long v46 = v130;
    uint64_t v54 = (__CVBuffer *)objc_msgSend(v131, "croppedBufferWithWidth:height:format:cropRect:options:error:", (unint64_t)(float)**(unint64_t **)(v14 + 72), (unint64_t)(float)*(unint64_t *)(*(void *)(v14 + 72) + 8), 1111970369, v130, a2, v15, v16, v17, v18);
    if (!v54
      || (uint64_t v55 = objc_msgSend(v131, "croppedBufferWithWidth:height:format:cropRect:options:error:", (unint64_t)(float)*(unint64_t *)(*(void *)(v14 + 72) + 32), (unint64_t)(float)*(unint64_t *)(*(void *)(v14 + 72) + 40), 1111970369, v130, a2, v126 * v36, *(double *)&pixelBuffer * v37, v41 * v36, v43 * v37)) == 0)
    {
      pixelBuffera = 0;
LABEL_37:
      char v63 = 0;
      char v134 = 0;
LABEL_38:
      CVPixelBufferRelease(v54);
      CVPixelBufferRelease(pixelBuffera);
      char v24 = v63 | v134;
      goto LABEL_25;
    }
    pixelBuffera = (__CVBuffer *)v55;
    uint64_t v56 = *(void *)(v14 + 72);
    vision::mod::GazeFollowPredictor::releaseCachedImageBuffers((void **)v56);
    uint64_t v127 = v56;
    uint64_t v58 = *(void **)v56;
    unint64_t v57 = *(void *)(v56 + 8);
    if ((float)(unint64_t)v58 != (float)CVPixelBufferGetWidth(v54)
      || (float v59 = (float)v57, (float)v57 != (float)CVPixelBufferGetHeight(v54))
      || (unint64_t v60 = *(void *)(v127 + 40),
          float v61 = (float)*(unint64_t *)(v127 + 32),
          v61 != (float)CVPixelBufferGetWidth(pixelBuffera))
      || (float)v60 != (float)CVPixelBufferGetHeight(pixelBuffera))
    {
      uint64_t v62 = 10876;
LABEL_34:
      if (a2)
      {
        VNErrorForCVMLStatus((id)v62);
        *a2 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_37;
    }
    float v118 = v41;
    *(float *)(v127 + 224) = (float)(v118 * 0.5) + v120;
    float v122 = v43;
    *(float *)(v127 + 228) = (float)(v122 * 0.5) + v124;
    CVPixelBufferLockBaseAddress(pixelBuffera, 1uLL);
    *(void *)(v127 + 136) = (unint64_t)(float)v60;
    *(void *)(v127 + 144) = (unint64_t)v61;
    size_t v125 = (_OWORD *)(v127 + 128);
    *(void *)(v127 + 128) = CVPixelBufferGetBaseAddress(pixelBuffera);
    *(void *)(v127 + 152) = CVPixelBufferGetBytesPerRow(pixelBuffera);
    CVPixelBufferLockBaseAddress(v54, 1uLL);
    *(void *)(v127 + 200) = (unint64_t)v59;
    *(void *)(v127 + 208) = (unint64_t)(float)(unint64_t)v58;
    uint64_t v123 = (long long *)(v127 + 192);
    *(void *)(v127 + 192) = CVPixelBufferGetBaseAddress(v54);
    *(void *)(v127 + 216) = CVPixelBufferGetBytesPerRow(v54);
    unint64_t v64 = *(void *)(v127 + 240);
    float v65 = (float)*(unint64_t *)(v127 + 232);
    v121 = (uint64_t *)(v11 + 136 * v12 + 24);
    std::vector<std::vector<long long>>::__clear[abi:ne180100](v121);
    LODWORD(src.data) = 0;
    std::vector<float>::vector(__p, (unint64_t)v65, &src);
    unint64_t v66 = (unint64_t)(float)v64;
    std::vector<std::vector<float>>::resize(v121, v66, (uint64_t)__p);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    uint64_t v67 = (uint64_t *)(v11 + 136 * v12 + 88);
    std::vector<std::vector<long long>>::__clear[abi:ne180100](v67);
    LODWORD(src.data) = 0;
    std::vector<float>::vector(__p, (unint64_t)v65, &src);
    std::vector<std::vector<float>>::resize(v67, v66, (uint64_t)__p);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    uint64_t v68 = (float **)(v11 + 136 * v12);
    uint64_t v69 = v68[14];
    v68 += 14;
    v68[1] = v69;
    LODWORD(__p[0]) = 0;
    double v119 = v68;
    long long v46 = v130;
    std::vector<float>::resize((char **)v68, 2uLL, __p);
    long long v70 = *(_OWORD *)(v127 + 144);
    *(_OWORD *)&src.data = *v125;
    *(_OWORD *)&src.double width = v70;
    espresso_network_bind_input_vimagebuffer_bgra8();
    long long v71 = *(_OWORD *)(v127 + 208);
    long long v146 = *v123;
    long long v147 = v71;
    espresso_network_bind_input_vimagebuffer_bgra8();
    uint64_t v145 = 0;
    long long v143 = 0u;
    long long v144 = 0u;
    long long v141 = 0u;
    long long v142 = 0u;
    long long v139 = 0u;
    long long v140 = 0u;
    long long v137 = 0u;
    long long v138 = 0u;
    *(_OWORD *)__p = 0u;
    long long v136 = 0u;
    long long v149 = xmmword_1A40E7700;
    espresso_buffer_pack_tensor_shape();
    __p[0] = (void *)(v127 + 224);
    LODWORD(v145) = 65568;
    if (espresso_network_bind_buffer())
    {
      syslog(5, "[Espresso Error]: Could not bind the input blobs to espresso model");
LABEL_47:
      uint64_t v62 = 10843;
      goto LABEL_48;
    }
    if (espresso_plan_execute_sync())
    {
      long long v46 = v130;
      espresso_plan_get_error_info();
      syslog(5, "[Espresso Error]: Could not execute plan: %s", v72);
      goto LABEL_47;
    }
    unint64_t v73 = *(void *)(v127 + 232);
    if (v73)
    {
      unint64_t v74 = 0;
      int v75 = 0;
      int v76 = 0;
      unint64_t v77 = *(void *)(v127 + 240);
      uint64_t v78 = *v121;
      uint64_t v79 = v11 + 136 * v12;
      uint64_t v80 = (float *)(v79 + 48);
      uint64_t v81 = (_DWORD *)(v79 + 52);
      uint64_t v82 = (_DWORD *)(v79 + 56);
      double v83 = (double)v77;
      double v85 = (double)v73;
      float v86 = NAN;
      float v87 = NAN;
      float v89 = NAN;
      float v90 = NAN;
      unint64_t v91 = *(void *)(v127 + 232);
      unint64_t v92 = v77;
      do
      {
        if (v77)
        {
          unint64_t v93 = 0;
          uint64_t v94 = (void *)(v78 + 24 * v74);
          v95 = v94 + 3;
          id v98 = (float *)*v94;
          int v96 = v94 - 3;
          uint64_t v97 = v98;
          double v99 = (double)(int)v74 + 0.5;
          unint64_t v101 = v74 + 1;
          uint64_t v102 = *(void *)(v127 + 360) + 4 * v77 * v74;
          do
          {
            float v103 = *(float *)(v102 + 4 * v93);
            *uint64_t v97 = v103;
            if (v103 > *v80)
            {
              *uint64_t v80 = v103;
              *uint64_t v81 = v93;
              *uint64_t v82 = v74;
            }
            float v104 = *(float *)(a1 + 184);
            if (v103 > v104)
            {
              if (v92 > v93)
              {
                if (v93)
                {
                  float v90 = ((double)v93
                       + 0.5
                       - (float)((float)(*v97 - v104) / (float)((float)(*v97 - v104) + (float)(v104 - *(v97 - 1)))))
                      / v83;
                  unint64_t v92 = v93;
                }
                else
                {
                  unint64_t v92 = 0;
                  float v84 = 0.5 / (double)v77;
                  float v90 = v84;
                }
              }
              if ((uint64_t)v93 > v76)
              {
                if (v77 - 1 <= v93) {
                  double v105 = (double)(int)v93 + 0.5;
                }
                else {
                  double v105 = (double)(int)v93
                }
                       + 0.5
                       + (float)((float)(*v97 - v104) / (float)((float)(*v97 - v104) + (float)(v104 - v97[1])));
                float v89 = v105 / v83;
                int v76 = v93;
              }
              if (v91 > v74)
              {
                unint64_t v91 = 0;
                float v88 = 0.5 / (double)v73;
                float v87 = v88;
                if (v74)
                {
                  float v87 = ((double)v74
                       + 0.5
                       - (float)((float)(*v97 - v104)
                               / (float)((float)(*v97 - v104) + (float)(v104 - *(float *)(*v96 + 4 * v93)))))
                      / v85;
                  unint64_t v91 = v74;
                }
              }
              if ((uint64_t)v74 > v75)
              {
                if (v73 - 1 <= v74)
                {
                  int v75 = v74;
                  float v100 = v99 / v85;
                  float v86 = v100;
                }
                else
                {
                  float v86 = (v99
                       + (float)((float)(*v97 - v104)
                               / (float)((float)(*v97 - v104) + (float)(v104 - *(float *)(*v95 + 4 * v93)))))
                      / v85;
                  int v75 = v74;
                }
              }
            }
            ++v93;
            ++v97;
          }
          while (v77 != v93);
        }
        else
        {
          unint64_t v101 = v74 + 1;
        }
        unint64_t v74 = v101;
      }
      while (v101 != v73);
    }
    else
    {
      float v90 = NAN;
      float v89 = NAN;
      float v87 = NAN;
      float v86 = NAN;
    }
    if (*(float *)(v11 + 136 * v12 + 48) > *(float *)(a1 + 184))
    {
      double v106 = (float *)(v11 + 136 * v12);
      v106[17] = v90;
      v106[18] = v87;
      v106[19] = v86 - v87;
      v106[20] = v89 - v90;
    }
    float32x4_t v107 = *(float **)(v127 + 696);
    float v108 = *v107;
    double v109 = *v119;
    *double v109 = *v107;
    float v110 = v107[1];
    v109[1] = v110;
    float v111 = 1.0;
    float v112 = 1.0;
    if (v108 <= 1.0)
    {
      float v112 = v108;
      if (v108 < -1.0) {
        float v112 = -1.0;
      }
    }
    if (v110 <= 1.0)
    {
      float v111 = v110;
      if (v110 < -1.0) {
        float v111 = -1.0;
      }
    }
    float v113 = acosf(v111);
    float v114 = asinf(v112);
    if (v112 >= 0.0)
    {
      if (v111 < 0.0)
      {
        double v115 = v114;
        double v116 = 3.14159265;
        goto LABEL_92;
      }
    }
    else
    {
      float v113 = -v113;
      if (v111 < 0.0)
      {
        double v115 = v114;
        double v116 = -3.14159265;
LABEL_92:
        float v114 = v116 - v115;
      }
    }
    float v117 = ((float)((float)(v112 * v112) * v113) + (1.0 - (float)(v112 * v112)) * v114) * 180.0 / 3.14159265;
    *(float *)(v11 + 136 * v12 + 64) = v117;
    uint64_t v62 = 10880;
    long long v46 = v130;
LABEL_48:
    CVPixelBufferUnlockBaseAddress(pixelBuffera, 1uLL);
    *size_t v125 = 0u;
    *(_OWORD *)(v127 + 144) = 0u;
    CVPixelBufferUnlockBaseAddress(v54, 1uLL);
    *uint64_t v123 = 0u;
    *(_OWORD *)(v127 + 208) = 0u;
    if ((v62 & 0xDB) == 0x80)
    {
      char v63 = 1;
      goto LABEL_38;
    }
    goto LABEL_34;
  }
  espresso_plan_get_error_info();
LABEL_7:
  if (!a2)
  {
LABEL_9:
    char v24 = 0;
    goto LABEL_26;
  }
  VNErrorForCVMLStatus((id)0x295B);
  char v24 = 0;
  *a2 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:

  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v24 & 1;
  VNValidatedLog(1, @"processRegionOfInterest Netto: finish processing; currentDetector: %@",
    v47,
    v48,
    v49,
    v50,
    v51,
    v52,
    *(void *)(a1 + 32));
  kdebug_trace();
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
}

uint64_t __127__VNFaceGazeDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "createRegionOfInterestCrop:options:qosClass:warningRecorder:pixelBuffer:error:progressHandler:", *(void *)(a1 + 40), *(unsigned int *)(a1 + 104), *(void *)(a1 + 48), *(void *)(*(void *)(a1 + 64) + 8) + 24, a2, *(void *)(a1 + 56), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v16 = a4;
  double v17 = [(VNDetector *)self validatedImageBufferFromOptions:v16 error:a8];
  double v18 = v17;
  if (v17)
  {
    unint64_t v19 = [v17 width];
    unint64_t v20 = [v18 height];
    ptr = self->_gazePredictor.__ptr_;
    unint64_t v22 = *(void *)ptr;
    unint64_t v23 = *((void *)ptr + 1);
    [v16 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"VNImageBufferOption_CreateFromPixelBufferPool"];
    id v28 = 0;
    char v24 = (__CVBuffer *)objc_msgSend(v18, "croppedBufferWithWidth:height:format:cropRect:options:error:pixelBufferRepsCacheKey:", (unint64_t)(float)v22, (unint64_t)(float)v23, 1111970369, v16, a8, &v28, x * (double)v19, y * (double)v20, width * (double)v19, height * (double)v20);
    id v25 = v28;
    *a7 = v24;
    BOOL v26 = v24 != 0;
    if (v24) {
      [(VNDetector *)self recordImageCropQuickLookInfoToOptionsSafe:v16 cacheKey:v25 imageBuffer:v18];
    }
  }
  else
  {
    BOOL v26 = 0;
  }

  return v26;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  v44.receiver = self;
  v44.super_class = (Class)VNFaceGazeDetector;
  if (-[VNDetector completeInitializationForSession:error:](&v44, sel_completeInitializationForSession_error_, a3))
  {
    uint64_t v6 = [(VNDetector *)self boundComputeDeviceForComputeStage:@"VNComputeStageMain" error:a4];
    if (!v6)
    {
      BOOL v17 = 0;
LABEL_77:

      return v17;
    }
    int v38 = +[VNEspressoHelpers espressoEngineForComputeDevice:v6];
    int v7 = +[VNEspressoHelpers espressoStorageTypeForComputeDevice:v6];
    unsigned int v8 = +[VNEspressoHelpers espressoDeviceIDForComputeDevice:v6];
    uint64_t v9 = [MEMORY[0x1E4FB3E60] camGazeV2AndReturnError:a4];
    uint64_t v10 = v9;
    if (!v9)
    {
      BOOL v17 = 0;
LABEL_76:

      goto LABEL_77;
    }
    uint64_t v11 = [v9 URL];
    uint64_t v12 = [v11 VisionCoreFileSystemPathAndReturnError:a4];

    long long v13 = v12;
    if (!v12) {
      goto LABEL_33;
    }
    double v37 = v12;
    id v35 = v12;
    std::string::basic_string[abi:ne180100]<0>(v41, (char *)[v35 UTF8String]);
    id v14 = [v35 lastPathComponent];
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v14 UTF8String]);
    double v15 = (char *)operator new(0x168uLL);
    *(void *)&long long v16 = __PAIR64__(v7, v38);
    *((void *)&v16 + 1) = v8;
    *((void *)v15 + 1) = 0;
    *((void *)v15 + 2) = 0;
    *(_OWORD *)(v15 + 24) = 0u;
    *(void *)double v15 = &unk_1EF7537E0;
    *(_OWORD *)(v15 + 136) = 0u;
    *(_OWORD *)(v15 + 40) = 0u;
    *(_OWORD *)(v15 + 56) = 0u;
    *(_OWORD *)(v15 + 72) = 0u;
    *(_OWORD *)(v15 + 88) = 0u;
    *(_OWORD *)(v15 + 104) = 0u;
    *(_OWORD *)(v15 + 116) = 0u;
    *(_OWORD *)(v15 + 152) = 0u;
    *(_OWORD *)(v15 + 168) = 0u;
    *(_OWORD *)(v15 + 184) = 0u;
    *(_OWORD *)(v15 + 200) = 0u;
    *(_OWORD *)(v15 + 216) = 0u;
    *(_OWORD *)(v15 + 232) = 0u;
    *(_OWORD *)(v15 + 248) = 0u;
    *((_DWORD *)v15 + 78) = 0;
    *(_OWORD *)(v15 + 264) = 0u;
    *(_OWORD *)(v15 + 280) = 0u;
    *(_OWORD *)(v15 + 296) = 0u;
    long long v36 = v16;
    *((_OWORD *)v15 + 20) = v16;
    if (SHIBYTE(v42) < 0)
    {
      std::string::__init_copy_ctor_external((std::string *)v15 + 14, (const std::string::value_type *)v41[0], (std::string::size_type)v41[1]);
    }
    else
    {
      *((_OWORD *)v15 + 21) = *(_OWORD *)v41;
      *((void *)v15 + 44) = v42;
    }
    *(void *)&v45[0] = v15 + 24;
    *((void *)&v45[0] + 1) = v15;
    uint64_t context = espresso_create_context();
    *((void *)v15 + 17) = context;
    if (context)
    {
      uint64_t plan = espresso_create_plan();
      *((void *)v15 + 18) = plan;
      if (plan)
      {
        if (!espresso_plan_add_network()
          && !espresso_plan_build()
          && !espresso_network_query_blob_dimensions()
          && !espresso_network_bind_buffer())
        {
          uint64_t v21 = 0;
          shared_ptr<vision::mod::GazeFollowPredictor> v43 = (shared_ptr<vision::mod::GazeFollowPredictor>)v45[0];
          unint64_t v20 = (shared_ptr<vision::mod::GazeFollowPredictor> *)v45;
LABEL_19:
          v20->__ptr_ = 0;
          v20->__cntrl_ = 0;
          if (*((void *)&v45[0] + 1)) {
            std::__shared_weak_count::__release_shared[abi:nn180100](*((std::__shared_weak_count **)&v45[0] + 1));
          }
          cntrl = self->_gazePredictor.__cntrl_;
          self->_gazePredictor = (shared_ptr<vision::mod::CamGazePredictor>)v43;
          if (cntrl) {
            std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
          }
          if (v40 < 0) {
            operator delete(__p[0]);
          }

          if (SHIBYTE(v42) < 0) {
            operator delete(v41[0]);
          }
          if (self->_gazePredictor.__ptr_)
          {
            unint64_t v23 = +[VNEspressoHelpers pathForEspressoNetworkModelFileWithName:@"gazefollowingflow-u67ev5hbea_50540_fp16.espresso" error:a4];
            long long v13 = v37;
            char v24 = v23;
            if (!v23) {
              goto LABEL_73;
            }
            std::string::basic_string[abi:ne180100]<0>(v41, (char *)[v23 UTF8String]);
            std::string::basic_string[abi:ne180100]<0>(__p, "gazefollowingflow-u67ev5hbea_50540_fp16.espresso");
            unint64_t v34 = v24;
            id v25 = (char *)operator new(0x3A0uLL);
            BOOL v26 = v25;
            *((void *)v25 + 1) = 0;
            *((void *)v25 + 2) = 0;
            *(void *)id v25 = &unk_1EF753888;
            *(_OWORD *)(v25 + 24) = 0u;
            float v27 = v25 + 24;
            *(_OWORD *)(v25 + 40) = 0u;
            *(_OWORD *)(v25 + 56) = 0u;
            *(_OWORD *)(v25 + 72) = 0u;
            *(_OWORD *)(v25 + 88) = 0u;
            *(_OWORD *)(v25 + 104) = 0u;
            *(_OWORD *)(v25 + 120) = 0u;
            *(_OWORD *)(v25 + 136) = 0u;
            *(_OWORD *)(v25 + 152) = 0u;
            *(_OWORD *)(v25 + 168) = 0u;
            *(_OWORD *)(v25 + 184) = 0u;
            *(_OWORD *)(v25 + 200) = 0u;
            *(_OWORD *)(v25 + 216) = 0u;
            *(_OWORD *)(v25 + 232) = 0u;
            *(_OWORD *)(v25 + 248) = 0u;
            *((_DWORD *)v25 + 90) = 0;
            *(_OWORD *)(v25 + 264) = 0u;
            *(_OWORD *)(v25 + 280) = 0u;
            *(_OWORD *)(v25 + 296) = 0u;
            *(_OWORD *)(v25 + 312) = 0u;
            *(_OWORD *)(v25 + 328) = 0u;
            *(_OWORD *)(v25 + 344) = 0u;
            *((_DWORD *)v25 + 136) = 0;
            *((_OWORD *)v25 + 32) = 0u;
            *((_OWORD *)v25 + 33) = 0u;
            *((_OWORD *)v25 + 30) = 0u;
            *((_OWORD *)v25 + 31) = 0u;
            *((_OWORD *)v25 + 28) = 0u;
            *((_OWORD *)v25 + 29) = 0u;
            *((_OWORD *)v25 + 26) = 0u;
            *((_OWORD *)v25 + 27) = 0u;
            *((_OWORD *)v25 + 24) = 0u;
            *((_OWORD *)v25 + 25) = 0u;
            *((_OWORD *)v25 + 23) = 0u;
            *(_OWORD *)(v25 + 552) = 0u;
            *(_OWORD *)(v25 + 568) = 0u;
            *(_OWORD *)(v25 + 584) = 0u;
            *(_OWORD *)(v25 + 600) = 0u;
            *(_OWORD *)(v25 + 616) = 0u;
            *(_OWORD *)(v25 + 632) = 0u;
            *(_OWORD *)(v25 + 648) = 0u;
            *(_OWORD *)(v25 + 664) = 0u;
            *(_OWORD *)(v25 + 680) = 0u;
            *(_OWORD *)(v25 + 696) = 0u;
            *((_DWORD *)v25 + 178) = 0;
            *((_DWORD *)v25 + 220) = 0;
            *((_OWORD *)v25 + 53) = 0u;
            *((_OWORD *)v25 + 54) = 0u;
            *((_OWORD *)v25 + 51) = 0u;
            *((_OWORD *)v25 + 52) = 0u;
            *((_OWORD *)v25 + 49) = 0u;
            *((_OWORD *)v25 + 50) = 0u;
            *((_OWORD *)v25 + 47) = 0u;
            *((_OWORD *)v25 + 48) = 0u;
            *((_OWORD *)v25 + 45) = 0u;
            *((_OWORD *)v25 + 46) = 0u;
            *(_OWORD *)(v25 + 888) = v36;
            if (SHIBYTE(v42) < 0)
            {
              std::string::__init_copy_ctor_external((std::string *)(v25 + 904), (const std::string::value_type *)v41[0], (std::string::size_type)v41[1]);
            }
            else
            {
              *(_OWORD *)(v25 + 904) = *(_OWORD *)v41;
              *((void *)v25 + 115) = v42;
            }
            *(void *)&v45[0] = v27;
            *((void *)&v45[0] + 1) = v26;
            uint64_t v28 = espresso_create_context();
            *((void *)v26 + 46) = v28;
            if (v28)
            {
              uint64_t v29 = espresso_create_plan();
              *((void *)v26 + 47) = v29;
              if (v29)
              {
                if (espresso_plan_add_network())
                {
                  espresso_plan_get_error_info();
                  syslog(5, "[Espresso Error]: Failed to add network. %s");
                }
                else if (espresso_plan_build())
                {
                  espresso_plan_get_error_info();
                  syslog(5, "[Espresso Error]: Failed to build plan. %s");
                }
                else if (espresso_network_query_blob_dimensions())
                {
                  espresso_plan_get_error_info();
                  syslog(5, "[Espresso Error]: Could not query the dimensions of input facecrop blob: %s");
                }
                else if (espresso_network_query_blob_dimensions())
                {
                  espresso_plan_get_error_info();
                  syslog(5, "[Espresso Error]: Could not query the dimensions of input image blob: %s");
                }
                else if (espresso_network_query_blob_dimensions())
                {
                  espresso_plan_get_error_info();
                  syslog(5, "[Espresso Error]: Could not query the dimensions of input FaceLocation blob: %s");
                }
                else if (espresso_network_query_blob_dimensions())
                {
                  espresso_plan_get_error_info();
                  syslog(5, "[Espresso Error]: Could not query the dimensions of output blob: %s");
                }
                else if (espresso_network_bind_buffer())
                {
                  espresso_plan_get_error_info();
                  long long v13 = v37;
                  syslog(5, "[Espresso Error]: Could not bind to the output blob: %s");
                }
                else if (espresso_network_query_blob_dimensions())
                {
                  espresso_plan_get_error_info();
                  long long v13 = v37;
                  syslog(5, "[Espresso Error]: Could not query the dimensions of face branch output blob: %s");
                }
                else if (espresso_network_bind_buffer())
                {
                  espresso_plan_get_error_info();
                  long long v13 = v37;
                  syslog(5, "[Espresso Error]: Could not bind to the face branch output blob: %s");
                }
                else if (espresso_network_query_blob_dimensions())
                {
                  espresso_plan_get_error_info();
                  long long v13 = v37;
                  syslog(5, "[Espresso Error]: Could not query the dimensions of angle tri output blob: %s");
                }
                else
                {
                  if (!espresso_network_bind_buffer())
                  {
                    shared_ptr<vision::mod::GazeFollowPredictor> v43 = (shared_ptr<vision::mod::GazeFollowPredictor>)v45[0];
                    long long v30 = (shared_ptr<vision::mod::GazeFollowPredictor> *)v45;
                    long long v13 = v37;
                    uint64_t v31 = v21;
                    goto LABEL_61;
                  }
                  espresso_plan_get_error_info();
                  long long v13 = v37;
                  syslog(5, "[Espresso Error]: Could not bind to the angle tri output blob: %s");
                }
              }
            }
            syslog(5, "[ERROR]: Failed to initialize GazeFollowPredictor object");
            long long v30 = &v43;
            uint64_t v31 = 9823;
LABEL_61:
            v30->__ptr_ = 0;
            v30->__cntrl_ = 0;
            char v24 = v34;
            if (*((void *)&v45[0] + 1)) {
              std::__shared_weak_count::__release_shared[abi:nn180100](*((std::__shared_weak_count **)&v45[0] + 1));
            }
            id v32 = self->_gazeFollowPredictor.__cntrl_;
            self->_gazeFollowPredictor = v43;
            if (v32) {
              std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v32);
            }
            if (v40 < 0) {
              operator delete(__p[0]);
            }
            if (SHIBYTE(v42) < 0) {
              operator delete(v41[0]);
            }
            if (self->_gazeFollowPredictor.__ptr_)
            {
              BOOL v17 = 1;
LABEL_74:

              goto LABEL_75;
            }
            if (a4)
            {
              VNErrorForCVMLStatus((id)v31);
              BOOL v17 = 0;
              *a4 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_74;
            }
LABEL_73:
            BOOL v17 = 0;
            goto LABEL_74;
          }
          long long v13 = v37;
          if (a4)
          {
            VNErrorForCVMLStatus((id)v21);
            BOOL v17 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_75:

            goto LABEL_76;
          }
LABEL_33:
          BOOL v17 = 0;
          goto LABEL_75;
        }
        espresso_plan_get_error_info();
      }
    }
    unint64_t v20 = &v43;
    uint64_t v21 = 9823;
    goto LABEL_19;
  }
  return 0;
}

+ (id)supportedImageSizeSetForOptions:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)[[NSString alloc] initWithUTF8String:"image"];
  int v7 = +[VNEspressoHelpers pathForEspressoNetworkModelFileWithName:@"gazefollowingflow-u67ev5hbea_50540_fp16.espresso" error:a4];
  if (v7)
  {
    unsigned int v8 = [a1 supportedImageSizeSetForEspressoModelAtPath:v7 inputImageBlobName:v6 analysisPixelFormatType:1111970369 error:a4];
  }
  else
  {
    unsigned int v8 = 0;
  }

  return v8;
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  int v7 = @"VNComputeStageMain";
  uint64_t v4 = +[VNComputeDeviceUtilities espressoV1ModelComputeDevices];
  v8[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

+ (id)computeStagesToBindForConfigurationOptions:(id)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = @"VNComputeStageMain";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

@end