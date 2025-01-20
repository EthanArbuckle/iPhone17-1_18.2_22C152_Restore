@interface VNRemoveBackgroundProcessor
+ (id)espressoModelFileNameForConfigurationOptions:(id)a3;
+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3;
+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4;
- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4;
- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9;
- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9;
- (void)dealloc;
@end

@implementation VNRemoveBackgroundProcessor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removeBackgroundSemaphore, 0);
  objc_storeStrong((id *)&self->_copyCropComputeState, 0);
  objc_storeStrong((id *)&self->_applyMaskComputeState, 0);
  objc_storeStrong((id *)&self->_assembleConstraintsState, 0);

  objc_storeStrong((id *)&self->_guidedFilter, 0);
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v200[2] = *MEMORY[0x1E4F143B8];
  id v17 = a5;
  id v131 = a7;
  id v132 = a9;
  v135 = v17;
  v18 = [v17 objectForKeyedSubscript:@"VNRemoveBackgroundProcessorOption_PerformInPlace"];
  int v129 = [v18 BOOLValue];

  v19 = [v17 objectForKeyedSubscript:@"VNRemoveBackgroundProcessorOption_CropResult"];
  int v125 = [v19 BOOLValue];

  v20 = [v17 objectForKeyedSubscript:@"VNRemoveBackgroundProcessorOption_ReturnMask"];
  int v127 = [v20 BOOLValue];

  v133 = [v17 objectForKeyedSubscript:@"VNRemoveBackgroundProcessorOption_MaskObservation"];
  char v179 = 0;
  if (!+[VNValidationUtilities getBOOLValue:&v179 forKey:@"VNRemoveBackgroundProcessorOption_AlphaGating" inOptions:v17 withDefaultValue:0 error:a8])
  {
    v25 = 0;
    goto LABEL_128;
  }
  uint64_t v175 = 0;
  v176 = &v175;
  uint64_t v177 = 0x2020000000;
  uint64_t v178 = 0;
  if (v133) {
    goto LABEL_3;
  }
  v26 = +[VNValidationUtilities requiredObjectOfClass:0 forKey:@"VNRemoveBackgroundProcessorOption_LowResInput" inOptions:v17 error:a8];
  v176[3] = (uint64_t)v26;
  if (v26
    && +[VNCVPixelBufferHelper lockPixelBuffer:lockFlags:error:]((uint64_t)VNCVPixelBufferHelper, v26, 1uLL, a8))
  {
    if (v179)
    {
      v27 = v176;
      if (!self) {
        goto LABEL_83;
      }
      v28 = (__CVBuffer *)v176[3];
      int64_t v29 = CVPixelBufferGetWidth(v28);
      size_t v30 = CVPixelBufferGetHeight(v28);
      size_t BytesPerRow = CVPixelBufferGetBytesPerRow(v28);
      BaseAddress = (char *)CVPixelBufferGetBaseAddress(v28);
      v33 = [(id)objc_opt_class() detectorInternalProcessingAsyncTasksQueue];
      unint64_t v34 = [v33 maximumTasksCount];
      unint64_t v35 = v34;
      if (v34)
      {
        v122 = self;
        if (v34 >= 0x666666666666667) {
          std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
        }
        v36 = (char *)operator new(40 * v34);
        bzero(v36, 40 * ((40 * v35 - 40) / 0x28) + 40);
        size_t v37 = 0;
        int64_t v38 = 0;
        if (v29 >= 1) {
          uint64_t v39 = 1;
        }
        else {
          uint64_t v39 = v29;
        }
        uint64_t v40 = v39 - 1;
        int64_t v41 = v29 - v40;
        if (v29 - v40 >= (unint64_t)v29) {
          int64_t v41 = v29;
        }
        v42 = (int64_t *)(v36 + 16);
        do
        {
          if (v37 >= v30 % v35) {
            unint64_t v43 = v30 / v35;
          }
          else {
            unint64_t v43 = v30 / v35 + 1;
          }
          if ((uint64_t)(v30 - 1) >= v38) {
            size_t v44 = v38;
          }
          else {
            size_t v44 = v30 - 1;
          }
          size_t v45 = v40 + v44 * (BytesPerRow >> 2);
          unint64_t v46 = v30 - v44;
          if (v46 >= v43) {
            unint64_t v46 = v43;
          }
          *(v42 - 2) = (int64_t)&BaseAddress[4 * v45];
          *(v42 - 1) = v46;
          int64_t *v42 = v41;
          v42[1] = BytesPerRow;
          v42 += 5;
          v38 += v43;
          ++v37;
        }
        while (v35 != v37);
        v47 = &v36[40 * ((40 * v35 - 40) / 0x28) + 40];
        dispatch_group_t v48 = dispatch_group_create();
        uint64_t v49 = MEMORY[0x1E4F143A8];
        v50 = v36;
        do
        {
          uint64_t v180 = v49;
          uint64_t v181 = 3221225472;
          v182 = __57__VNRemoveBackgroundProcessor__verifyImageIsFullyOpaque___block_invoke;
          v183 = &unk_1E5B1F760;
          v185 = (int8x16_t *)v50;
          v184 = v33;
          [(VNRemoveBackgroundProcessor *)v184 dispatchGroupAsyncByPreservingQueueCapacity:v48 block:&v180];

          v50 += 40;
          --v35;
        }
        while (v35);
        self = v122;
      }
      else
      {
        dispatch_group_t v48 = dispatch_group_create();
        v47 = 0;
        v36 = 0;
      }
      [v33 dispatchGroupWait:v48 error:0];
      if (v36 == v47)
      {
        BOOL v86 = 1;
      }
      else
      {
        v85 = v36 + 40;
        do
        {
          BOOL v86 = *(v85 - 8) != 0;
          if (*(v85 - 8)) {
            BOOL v87 = v85 == v47;
          }
          else {
            BOOL v87 = 1;
          }
          v85 += 40;
        }
        while (!v87);
      }

      if (v36) {
        operator delete(v36);
      }

      if (!v86)
      {
        v27 = v176;
LABEL_83:
        if (+[VNCVPixelBufferHelper unlockPixelBuffer:lockFlags:error:]((uint64_t)VNCVPixelBufferHelper, (__CVBuffer *)v27[3], 1uLL, a8))
        {
          v25 = (void *)MEMORY[0x1E4F1CBF0];
        }
        else
        {
          v25 = 0;
        }
        goto LABEL_127;
      }
    }
LABEL_3:
    if (!v129) {
      goto LABEL_5;
    }
    v203.origin.CGFloat x = 0.0;
    v203.origin.CGFloat y = 0.0;
    v203.size.CGFloat width = 1.0;
    v203.size.CGFloat height = 1.0;
    v202.origin.CGFloat x = x;
    v202.origin.CGFloat y = y;
    v202.size.CGFloat width = width;
    v202.size.CGFloat height = height;
    if (CGRectEqualToRect(v202, v203))
    {
LABEL_5:
      char v21 = 0;
      v22 = 0;
      goto LABEL_6;
    }
    v22 = [(VNDetector *)self validatedImageBufferFromOptions:v135 error:a8];
    if (v22)
    {
      char v21 = 1;
LABEL_6:
      uint64_t v171 = 0;
      v172 = &v171;
      uint64_t v173 = 0x2020000000;
      uint64_t v174 = 0;
      uint64_t v167 = 0;
      v168 = &v167;
      uint64_t v169 = 0x2020000000;
      uint64_t v170 = 0;
      uint64_t v163 = 0;
      v164 = &v163;
      uint64_t v165 = 0x2020000000;
      uint64_t v166 = 0;
      uint64_t v159 = 0;
      v160 = (float *)&v159;
      uint64_t v161 = 0x2020000000;
      int v162 = 0;
      uint64_t v155 = 0;
      v156 = &v155;
      uint64_t v157 = 0x2020000000;
      char v158 = 0;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __129__VNRemoveBackgroundProcessor_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke;
      aBlock[3] = &unk_1E5B1F738;
      v141 = &v171;
      v142 = &v159;
      id v137 = v133;
      v138 = self;
      v121 = self;
      char v152 = v127;
      v143 = &v175;
      v144 = &v163;
      char v153 = v21;
      CGFloat v147 = x;
      CGFloat v148 = y;
      CGFloat v149 = width;
      CGFloat v150 = height;
      id v120 = v22;
      id v139 = v120;
      id v119 = v135;
      id v140 = v119;
      v145 = &v167;
      v146 = &v155;
      char v154 = v129;
      v151 = a4;
      v124 = _Block_copy(aBlock);
      v23 = self;
      if ((VNExecuteBlock(v124, (uint64_t)a8) & 1) == 0) {
        goto LABEL_115;
      }
      if (v160[6] < 0.16)
      {
        v24 = 0;
        v25 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_116:
        int v111 = 1;
LABEL_117:
        if (*((unsigned char *)v156 + 24)) {
          dispatch_semaphore_wait((dispatch_semaphore_t)v23->_removeBackgroundSemaphore, 0);
        }
        v112 = (__CVBuffer *)v176[3];
        if (v112
          && !+[VNCVPixelBufferHelper unlockPixelBuffer:lockFlags:error:]((uint64_t)VNCVPixelBufferHelper, v112, 1uLL, a8))
        {

          v24 = 0;
        }
        CVPixelBufferRelease((CVPixelBufferRef)v176[3]);
        v176[3] = 0;
        CVPixelBufferRelease((CVPixelBufferRef)v168[3]);
        v168[3] = 0;
        CVPixelBufferRelease((CVPixelBufferRef)v172[3]);
        v172[3] = 0;
        CVPixelBufferRelease((CVPixelBufferRef)v164[3]);
        v164[3] = 0;
        if (!v111)
        {
          if (v24)
          {
            v199 = v24;
            v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v199 count:1];
          }
          else
          {
            v25 = 0;
          }
        }

        _Block_object_dispose(&v155, 8);
        _Block_object_dispose(&v159, 8);
        _Block_object_dispose(&v163, 8);
        _Block_object_dispose(&v167, 8);
        _Block_object_dispose(&v171, 8);

        goto LABEL_127;
      }
      if (!v125)
      {
        double v72 = 1.0;
        double v73 = 0.0;
        double v74 = 0.0;
        double v75 = 1.0;
        goto LABEL_91;
      }
      if (!self)
      {
LABEL_115:
        v24 = 0;
        v25 = 0;
        goto LABEL_116;
      }
      v51 = (__CVBuffer *)v172[3];
      CVPixelBufferLockBaseAddress(v51, 1uLL);
      pixelBuffer = v51;
      size_t v52 = CVPixelBufferGetWidth(v51);
      size_t v53 = CVPixelBufferGetHeight(v51);
      size_t v54 = CVPixelBufferGetBytesPerRow(v51);
      v55 = CVPixelBufferGetBaseAddress(v51);
      v56 = [(id)objc_opt_class() detectorInternalProcessingAsyncTasksQueue];
      unint64_t v57 = [v56 maximumTasksCount];
      unint64_t v58 = v57;
      if (v57)
      {
        if (v57 >= 0x555555555555556) {
          std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v59 = 48 * v57;
        v60 = (int8x16_t *)operator new(48 * v57);
        v61 = v60;
        unint64_t v62 = 0;
        i8 = v60[3 * v58].i8;
        do
        {
          v63 = v60[v62 / 0x10].i8;
          *(void *)v63 = -1;
          *((void *)v63 + 1) = -1;
          *((void *)v63 + 4) = 0;
          *((void *)v63 + 5) = 0;
          v62 += 48;
          *((void *)v63 + 2) = 0;
          *((void *)v63 + 3) = 0;
        }
        while (v59 != v62);
        size_t v64 = 0;
        uint64_t v65 = 0;
        v66 = &v60[2].i64[1];
        do
        {
          uint64_t v67 = v53 / v58 - 1 + v65;
          if (v64 < v53 % v58) {
            uint64_t v67 = v53 / v58 + v65;
          }
          *(v66 - 1) = v65;
          uint64_t *v66 = v67;
          uint64_t v65 = v67 + 1;
          ++v64;
          v66 += 6;
        }
        while (v58 != v64);
        dispatch_group_t v68 = dispatch_group_create();
        uint64_t v69 = MEMORY[0x1E4F143A8];
        __p = v61;
        do
        {
          uint64_t v180 = v69;
          uint64_t v181 = 3221225472;
          v182 = __69__VNRemoveBackgroundProcessor__calculateCropSizeOfPixelBuffer_error___block_invoke;
          v183 = &unk_1E5B1F848;
          v185 = v61;
          v186 = v55;
          size_t v187 = v53;
          size_t v188 = v52;
          size_t v189 = v54;
          size_t v190 = v52;
          v184 = v56;
          [(VNRemoveBackgroundProcessor *)v184 dispatchGroupAsyncByPreservingQueueCapacity:v68 block:&v180];

          v61 += 3;
          --v58;
        }
        while (v58);
        v70 = __p;
        v71 = (int8x16_t *)i8;
      }
      else
      {
        dispatch_group_t v68 = dispatch_group_create();
        v71 = 0;
        v70 = 0;
      }
      char v76 = [v56 dispatchGroupWait:v68 error:a8];
      int8x16_t v77 = 0uLL;
      int64x2_t v116 = 0u;
      if ((v76 & 1) == 0) {
        goto LABEL_63;
      }
      if (v70 != v71)
      {
        v78.i64[0] = -1;
        v78.i64[1] = -1;
        v79 = v70;
        do
        {
          int8x16_t v80 = *v79;
          int8x16_t v81 = v79[1];
          v79 += 3;
          int8x16_t v78 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v78, (uint64x2_t)v80), v80, v78);
          int8x16_t v77 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v77, (uint64x2_t)v81), v77, v81);
        }
        while (v79 != v71);
        if (v77.i64[0] && v77.i64[1] != 0)
        {
          int v107 = 1;
          int64x2_t v114 = (int64x2_t)vcvtq_f64_u64((uint64x2_t)vaddq_s64(vsubq_s64((int64x2_t)v77, (int64x2_t)v78), vdupq_n_s64(1uLL)));
          int64x2_t v116 = (int64x2_t)vcvtq_f64_u64((uint64x2_t)v78);
          goto LABEL_64;
        }
      }
      if (a8)
      {
        +[VNError errorForInternalErrorWithLocalizedDescription:@"No pixels meet or exceed alpha threshold"];
        int v107 = 0;
        *a8 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
LABEL_63:
        int v107 = 0;
      }
LABEL_64:

      if (v70) {
        operator delete(v70);
      }

      v23 = v121;
      CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
      if (v107)
      {
        size_t v83 = CVPixelBufferGetWidth((CVPixelBufferRef)v172[3]);
        size_t v84 = CVPixelBufferGetHeight((CVPixelBufferRef)v172[3]);
        if (v83)
        {
          double v73 = *(double *)v116.i64 / (double)v83;
          double v72 = *(double *)v114.i64 / (double)v83;
        }
        else
        {
          double v73 = 0.0;
          double v72 = 0.0;
        }
        if (v84) {
          float64x2_t v88 = vdivq_f64((float64x2_t)vzip2q_s64(v116, v114), (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)v84), 0));
        }
        else {
          float64x2_t v88 = 0uLL;
        }
        double v75 = v88.f64[1];
        double v74 = 1.0 - v88.f64[0] - v88.f64[1];
LABEL_91:
        if (*((unsigned char *)v156 + 24)) {
          dispatch_semaphore_wait((dispatch_semaphore_t)v23->_removeBackgroundSemaphore, 0xFFFFFFFFFFFFFFFFLL);
        }
        if ((v125 ^ 1 | v129 | v127)) {
          goto LABEL_112;
        }
        if (v23)
        {
          v89 = v164;
          v90 = (__CVBuffer *)v164[3];
          size_t v91 = CVPixelBufferGetWidth(v90);
          size_t v92 = CVPixelBufferGetHeight(v90);
          v93 = (void *)MEMORY[0x1A6257080]();
          v94 = [(VNDetector *)v121 metalContext];
          id v197 = 0;
          v95 = -[VNMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:plane:error:](v94, v90, 80, &v197);
          id v96 = v197;
          if (v95)
          {
            double v97 = (double)v91;
            double v98 = (double)v92;
            id v196 = v96;
            v99 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, (unint64_t)(v72 * (double)v91), (unint64_t)(v75 * (double)v92), 1111970369, &v196);
            id v100 = v196;

            if (v99)
            {
              id v195 = v100;
              v130 = -[VNMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:plane:error:](v94, v99, 80, &v195);
              id v96 = v195;

              if (v130)
              {
                id v194 = v96;
                v101 = -[VNMetalContext commandQueueReturnError:](v94, &v194);
                id v128 = v194;

                if (v101)
                {
                  v126 = v93;
                  v102 = [v101 commandBuffer];
                  copyCropComputeState = v121->_copyCropComputeState;
                  uint64_t v103 = [v130 width];
                  uint64_t v104 = [v130 height];
                  v200[0] = v95;
                  v200[1] = v130;
                  v105 = [MEMORY[0x1E4F1C978] arrayWithObjects:v200 count:2];
                  v191[0] = MEMORY[0x1E4F143A8];
                  v191[1] = 3221225472;
                  v191[2] = __81__VNRemoveBackgroundProcessor__cropInOutPixelBuffer_normalizedBoundingBox_error___block_invoke;
                  v191[3] = &__block_descriptor_36_e36_v16__0___MTLComputeCommandEncoder__8l;
                  __int16 v193 = (int)((1.0 - v74 - v75) * v98);
                  __int16 v192 = (int)(v73 * v97);
                  -[VNMetalContext encodeCommandsForBuffer:state:label:width:height:textures:buffers:block:]((uint64_t)v94, v102, copyCropComputeState, v103, v104, v105, v191);

                  v93 = v126;
                  uint64_t v180 = MEMORY[0x1E4F143A8];
                  uint64_t v181 = 3221225472;
                  v182 = __81__VNRemoveBackgroundProcessor__cropInOutPixelBuffer_normalizedBoundingBox_error___block_invoke_2;
                  v183 = &unk_1E5B1F7F8;
                  v184 = v121;
                  [v102 addCompletedHandler:&v180];
                  [v102 commit];
                  [v102 waitUntilCompleted];

                  int v106 = 0;
                }
                else
                {
                  char v198 = 0;
                  int v106 = 1;
                }

                id v96 = v128;
              }
              else
              {
                char v198 = 0;
                int v106 = 1;
              }
            }
            else
            {
              char v198 = 0;
              int v106 = 1;
              id v96 = v100;
            }
          }
          else
          {
            v99 = 0;
            char v198 = 0;
            int v106 = 1;
          }

          CVPixelBufferRelease(v90);
          v89[3] = (uint64_t)v99;
          if (a8 && v96) {
            *a8 = v96;
          }
          if (!v106) {
            char v198 = 1;
          }

          v23 = v121;
          if (v198 == 1)
          {
LABEL_112:
            v108 = +[VNValidationUtilities originatingRequestSpecifierInOptions:error:](VNValidationUtilities, "originatingRequestSpecifierInOptions:error:", v119, a8, *(_OWORD *)&v114);
            if (v108)
            {
              v109 = [VNPixelBufferObservation alloc];
              v24 = [(VNPixelBufferObservation *)v109 initWithOriginatingRequestSpecifier:v108 featureName:0 CVPixelBuffer:v164[3]];
              *(float *)&double v110 = v160[6];
              [v24 setConfidence:v110];
              int v111 = 0;
              if (v24)
              {
                v24[14] = v73;
                v24[15] = v74;
                v24[16] = v72;
                v24[17] = v75;
              }
            }
            else
            {
              v24 = 0;
              int v111 = 1;
            }

            v25 = 0;
            v23 = v121;
            goto LABEL_117;
          }
        }
        goto LABEL_115;
      }
      goto LABEL_115;
    }
  }
  v25 = 0;
LABEL_127:
  _Block_object_dispose(&v175, 8);
LABEL_128:

  return v25;
}

uint64_t __129__VNRemoveBackgroundProcessor_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke(uint64_t a1, void *a2)
{
  v4 = *(void **)(a1 + 32);
  if (!v4)
  {
    v14 = *(float ***)(a1 + 40);
    if (!v14) {
      return 0;
    }
    uint64_t v15 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    id v17 = [NSString stringWithUTF8String:"input_image"];
    LOBYTE(v16) = [v14 bindLockedPixelBuffer:v16 toNetworkInputBlobName:v17 error:a2];

    if ((v16 & 1) == 0) {
      return 0;
    }
    uint64_t result = [v14 executePlanAndReturnError:a2];
    if (!result) {
      return result;
    }
    float v18 = *v14[34];
    *(float *)(v15 + 24) = v18;
    if (v18 >= 0.16) {
      operator new[]();
    }
    if (*(float *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) >= 0.16)
    {
      if (!*(unsigned char *)(a1 + 152)) {
        goto LABEL_3;
      }
      *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = CVPixelBufferRetain(*(CVPixelBufferRef *)(*(void *)(*(void *)(a1 + 64) + 8) + 24));
    }
    return 1;
  }
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = CVPixelBufferRetain((CVPixelBufferRef)[v4 pixelBuffer]);
  [*(id *)(a1 + 32) confidence];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v5;
LABEL_3:
  if (*(unsigned char *)(a1 + 153))
  {
    double v6 = *(double *)(a1 + 112);
    double v7 = *(double *)(a1 + 120);
    double v8 = *(double *)(a1 + 128);
    double v9 = *(double *)(a1 + 136);
    unint64_t v10 = [*(id *)(a1 + 48) width];
    unint64_t v11 = [*(id *)(a1 + 48) height];
    uint64_t result = objc_msgSend(*(id *)(a1 + 48), "croppedBufferWithWidth:height:format:cropRect:options:error:", (unint64_t)(v8 * (double)v10), (unint64_t)(v9 * (double)v11), 1111970369, *(void *)(a1 + 56), a2, v6 * (double)v10, v7 * (double)v11);
    v13 = (__CVBuffer *)result;
    if (!result) {
      return result;
    }
  }
  else
  {
    v13 = *(__CVBuffer **)(a1 + 144);
  }
  uint64_t v19 = *(void *)(a1 + 40);
  if (v19)
  {
    uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    uint64_t v47 = 0;
    dispatch_group_t v48 = &v47;
    uint64_t v49 = 0x2020000000;
    uint64_t v50 = 0;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t aBlock_8 = 3221225472;
    uint64_t v40 = __67__VNRemoveBackgroundProcessor__upsampleLowResMask_reference_error___block_invoke;
    int64_t v41 = &unk_1E5B1F788;
    uint64_t v42 = v19;
    unint64_t v43 = &v47;
    size_t v44 = v13;
    uint64_t v45 = v20;
    char v21 = _Block_copy(&aBlock);
    char v22 = VNExecuteBlock(v21, (uint64_t)a2);
    uint64_t v23 = v48[3];
    if ((v22 & 1) == 0)
    {
      CVPixelBufferRelease((CVPixelBufferRef)v48[3]);
      uint64_t v23 = 0;
      v48[3] = 0;
    }

    _Block_object_dispose(&v47, 8);
  }
  else
  {
    uint64_t v23 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = v23;
  if (*(unsigned char *)(a1 + 153)) {
    CVPixelBufferRelease(v13);
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24)) {
    return 0;
  }
  if (*(unsigned char *)(a1 + 154))
  {
    *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = CVPixelBufferRetain(*(CVPixelBufferRef *)(a1 + 144));
    goto LABEL_21;
  }
  size_t Width = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + 144));
  size_t Height = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 144));
  *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, Width, Height, 1111970369, a2);
  if (*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))
  {
    CFStringRef v35 = (const __CFString *)*MEMORY[0x1E4F24A00];
    if (CVBufferHasAttachment(*(CVBufferRef *)(a1 + 144), (CFStringRef)*MEMORY[0x1E4F24A00]))
    {
      LODWORD(aBlock) = 0;
      CFTypeRef v36 = CVBufferCopyAttachment(*(CVBufferRef *)(a1 + 144), v35, (CVAttachmentMode *)&aBlock);
      CVBufferSetAttachment(*(CVBufferRef *)(*(void *)(*(void *)(a1 + 88) + 8) + 24), v35, v36, (CVAttachmentMode)aBlock);
      CFRelease(v36);
    }
LABEL_21:
    int v24 = *(unsigned __int8 *)(a1 + 153);
    if (*(unsigned char *)(a1 + 153))
    {
      [*(id *)(a1 + 48) width];
      [*(id *)(a1 + 48) height];
      VisionCoreImagePointForNormalizedPoint();
      HIWORD(v37) = (int)v26;
      LOWORD(v37) = (int)v25;
      int v24 = v37;
    }
    uint64_t v27 = *(void *)(a1 + 40);
    if (v27)
    {
      v28 = *(uint64_t **)(a1 + 144);
      int64_t v29 = *(__CVBuffer **)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
      uint64_t v30 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
      uint64_t aBlock = MEMORY[0x1E4F143A8];
      uint64_t aBlock_8 = 3221225472;
      uint64_t v40 = __101__VNRemoveBackgroundProcessor__removeBackgroundFromPixelBuffer_toPixelBuffer_usingMask_offset_error___block_invoke;
      int64_t v41 = &unk_1E5B1F820;
      uint64_t v42 = v27;
      unint64_t v43 = v28;
      size_t v44 = v29;
      uint64_t v45 = v30;
      LODWORD(v46) = v24;
      v31 = _Block_copy(&aBlock);
      int v32 = VNExecuteBlock(v31, (uint64_t)a2);

      if (v32)
      {
        uint64_t result = 1;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = 1;
        return result;
      }
    }
  }
  return 0;
}

uint64_t __81__VNRemoveBackgroundProcessor__cropInOutPixelBuffer_normalizedBoundingBox_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setBytes:a1 + 32 length:4 atIndex:0];
}

intptr_t __81__VNRemoveBackgroundProcessor__cropInOutPixelBuffer_normalizedBoundingBox_error___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 472));
}

uint64_t __69__VNRemoveBackgroundProcessor__calculateCropSizeOfPixelBuffer_error___block_invoke(uint64_t a1)
{
  v1 = *(uint64x2_t **)(a1 + 40);
  unint64_t v2 = v1[2].u64[0];
  unint64_t v3 = v1[2].u64[1];
  if (v2 <= v3)
  {
    uint64_t v4 = *(void *)(a1 + 80);
    uint64_t v5 = *(void *)(a1 + 72) >> 2;
    uint64_t v6 = *(void *)(a1 + 48) + 4 * v2 * v5;
    uint64_t v7 = 4 * v5;
    do
    {
      if (v4)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(float *)(v6 + 4 * i) > 0.0)
          {
            v9.i64[0] = i;
            v9.i64[1] = v2;
            int8x16_t v10 = vbslq_s8((int8x16_t)vcgtq_u64(*v1, v9), (int8x16_t)v9, *(int8x16_t *)v1);
            int8x16_t v11 = vbslq_s8((int8x16_t)vcgtq_u64(v1[1], v9), (int8x16_t)v1[1], (int8x16_t)v9);
            uint64x2_t *v1 = (uint64x2_t)v10;
            v1[1] = (uint64x2_t)v11;
          }
        }
      }
      ++v2;
      v6 += v7;
    }
    while (v2 <= v3);
  }
  return [*(id *)(a1 + 32) dispatchReportBlockCompletion];
}

BOOL __101__VNRemoveBackgroundProcessor__removeBackgroundFromPixelBuffer_toPixelBuffer_usingMask_offset_error___block_invoke(uint64_t a1, void *a2)
{
  v20[3] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [*(id *)(a1 + 32) metalContext];
  uint64_t v5 = -[VNMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:plane:error:](v4, *(CVPixelBufferRef *)(a1 + 40), 80, a2);
  if (v5)
  {
    uint64_t v6 = -[VNMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:plane:error:](v4, *(CVPixelBufferRef *)(a1 + 48), 80, a2);
    if (v6)
    {
      uint64_t v7 = -[VNMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:plane:error:](v4, *(CVPixelBufferRef *)(a1 + 56), 55, a2);
      if (v7)
      {
        double v8 = -[VNMetalContext commandQueueReturnError:](v4, a2);
        uint64x2_t v9 = v8;
        BOOL v10 = v8 != 0;
        if (v8)
        {
          int8x16_t v11 = [v8 commandBuffer];
          uint64_t v16 = *(void **)(*(void *)(a1 + 32) + 456);
          uint64_t v15 = [v7 width];
          uint64_t v12 = [v7 height];
          v20[0] = v7;
          v20[1] = v5;
          v20[2] = v6;
          v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __101__VNRemoveBackgroundProcessor__removeBackgroundFromPixelBuffer_toPixelBuffer_usingMask_offset_error___block_invoke_2;
          v18[3] = &__block_descriptor_36_e36_v16__0___MTLComputeCommandEncoder__8l;
          int v19 = *(_DWORD *)(a1 + 64);
          -[VNMetalContext encodeCommandsForBuffer:state:label:width:height:textures:buffers:block:]((uint64_t)v4, v11, v16, v15, v12, v13, v18);

          v17[0] = MEMORY[0x1E4F143A8];
          v17[1] = 3221225472;
          v17[2] = __101__VNRemoveBackgroundProcessor__removeBackgroundFromPixelBuffer_toPixelBuffer_usingMask_offset_error___block_invoke_3;
          v17[3] = &unk_1E5B1F7F8;
          v17[4] = *(void *)(a1 + 32);
          [v11 addCompletedHandler:v17];
          [v11 commit];
        }
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

uint64_t __101__VNRemoveBackgroundProcessor__removeBackgroundFromPixelBuffer_toPixelBuffer_usingMask_offset_error___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setBytes:a1 + 32 length:4 atIndex:0];
}

intptr_t __101__VNRemoveBackgroundProcessor__removeBackgroundFromPixelBuffer_toPixelBuffer_usingMask_offset_error___block_invoke_3(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 472));
}

BOOL __67__VNRemoveBackgroundProcessor__upsampleLowResMask_reference_error___block_invoke(uint64_t a1, void *a2)
{
  v66[3] = *MEMORY[0x1E4F143B8];
  unint64_t v57 = [*(id *)(a1 + 32) metalContext];
  size_t Width = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + 48));
  size_t Height = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 48));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, Width, Height, 1278226534, a2);
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v6 = (void *)MEMORY[0x1A6257080]();
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 40);
    v65[0] = *(void *)(a1 + 56);
    v65[1] = v7;
    v65[2] = *(void *)(*(void *)(v8 + 8) + 24);
    uint64x2_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:3];
    id v58 = 0;
    size_t v54 = -[VNMetalContext bindPixelBuffersToTextures:error:](v57, v9, &v58);
    id v52 = v58;

    if (!v54)
    {
      BOOL v33 = 0;
      if (a2) {
        *a2 = v52;
      }
      goto LABEL_22;
    }
    unint64_t v43 = [v54 objectAtIndexedSubscript:0];
    v51 = [v54 objectAtIndexedSubscript:1];
    uint64_t v50 = [v54 objectAtIndexedSubscript:2];
    BOOL v10 = *(void **)(a1 + 32);
    id v11 = v43;
    v56 = v11;
    if (v10)
    {
      uint64_t v12 = [v10 metalContext];
      v13 = (os_unfair_lock_s *)v12;
      if (v12) {
        v14 = *(void **)(v12 + 8);
      }
      else {
        v14 = 0;
      }
      id v15 = v14;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __71__VNRemoveBackgroundProcessor__createConstraintsTextureFromMask_error___block_invoke;
      aBlock[3] = &unk_1E5B1F7B0;
      id v53 = v15;
      id v60 = v53;
      uint64_t v16 = (void (**)(void *, uint64_t, uint64_t, uint64_t))_Block_copy(aBlock);
      id v17 = -[VNMetalContext commandQueueReturnError:](v13, a2);
      uint64_t v47 = v17;
      if (v17)
      {
        float v18 = [v17 commandBuffer];
        uint64_t v19 = [v56 width];
        uint64_t v20 = [v56 height];
        v55 = v16[2](v16, v19, v20, 10);
        uint64_t v49 = v16[2](v16, v19, v20, 10);
        dispatch_group_t v48 = v16[2](v16, v19, v20, 10);
        char v21 = v16[2](v16, v19, v20, 10);
        id v22 = objc_alloc(MEMORY[0x1E4F355F8]);
        LODWORD(v23) = 1063675494;
        LODWORD(v24) = 1.0;
        long long v46 = (void *)[v22 initWithDevice:v53 thresholdValue:0 maximumValue:v23 linearGrayColorTransform:v24];
        uint64_t v44 = (uint64_t)v13;
        id v25 = objc_alloc(MEMORY[0x1E4F35600]);
        LODWORD(v26) = 1036831949;
        LODWORD(v27) = 1.0;
        uint64_t v45 = (void *)[v25 initWithDevice:v53 thresholdValue:0 maximumValue:v26 linearGrayColorTransform:v27];
        v28 = (void *)[objc_alloc(MEMORY[0x1E4F35540]) initWithDevice:v53 kernelWidth:25 kernelHeight:25];
        [v46 encodeToCommandBuffer:v18 sourceTexture:v56 destinationTexture:v21];
        [v28 encodeToCommandBuffer:v18 sourceTexture:v21 destinationTexture:v49];
        [v45 encodeToCommandBuffer:v18 sourceTexture:v56 destinationTexture:v21];
        [v28 encodeToCommandBuffer:v18 sourceTexture:v21 destinationTexture:v48];
        int64_t v29 = (void *)v10[56];
        uint64_t v30 = [v55 width];
        uint64_t v31 = [v55 height];
        v66[0] = v49;
        v66[1] = v48;
        v66[2] = v55;
        int v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:3];
        -[VNMetalContext encodeCommandsForBuffer:state:label:width:height:textures:buffers:block:](v44, v18, v29, v30, v31, v32, 0);

        [v18 commit];
        v13 = (os_unfair_lock_s *)v44;
      }
      else
      {
        v55 = 0;
      }

      unint64_t v34 = v55;
      if (v55)
      {
        if (*(void *)(*(void *)(a1 + 32) + 440)) {
          goto LABEL_15;
        }
        size_t v64 = v56;
        CFStringRef v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v64 count:1];
        uint64_t v36 = -[VNMetalContext createGuidedFilterForTextures:referenceTexture:error:](v57, v35, v51, a2);
        uint64_t v37 = *(void *)(a1 + 32);
        int64_t v38 = *(void **)(v37 + 440);
        *(void *)(v37 + 440) = v36;

        if (*(void *)(*(void *)(a1 + 32) + 440))
        {
LABEL_15:
          v63 = v56;
          uint64_t v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:1];
          unint64_t v62 = v55;
          uint64_t v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v62 count:1];
          v61 = v50;
          int64_t v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v61 count:1];
          BOOL v33 = -[VNMetalContext upsampleTextures:referenceTexture:constraintsTextures:upsampledTextures:filter:waitForCompletion:error:]((BOOL)v57, v39, v51, v40, v41, *(void **)(*(void *)(a1 + 32) + 440), 0, a2);
        }
        else
        {
          BOOL v33 = 0;
        }
        unint64_t v34 = v55;
        goto LABEL_21;
      }
    }
    else
    {

      unint64_t v34 = 0;
    }
    BOOL v33 = 0;
LABEL_21:

LABEL_22:
    goto LABEL_23;
  }
  BOOL v33 = 0;
LABEL_23:

  return v33;
}

id __71__VNRemoveBackgroundProcessor__createConstraintsTextureFromMask_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:a4 width:a2 height:a3 mipmapped:0];
  [v5 setUsage:3];
  uint64_t v6 = (void *)[*(id *)(a1 + 32) newTextureWithDescriptor:v5];

  return v6;
}

uint64_t __57__VNRemoveBackgroundProcessor__verifyImageIsFullyOpaque___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(void *)(v1 + 8);
  if (v2 < 1)
  {
LABEL_8:
    *(unsigned char *)(v1 + 32) = 1;
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v4 = *(int8x16_t **)v1;
    uint64_t v5 = *(void *)(v1 + 16);
    v6.i64[0] = 0xFF000000FF000000;
    v6.i64[1] = 0xFF000000FF000000;
    while (v5 < 1)
    {
LABEL_7:
      ++v3;
      uint64_t v4 = (int8x16_t *)((char *)v4 + (*(void *)(v1 + 24) & 0xFFFFFFFFFFFFFFFCLL));
      if (v3 == v2) {
        goto LABEL_8;
      }
    }
    uint64_t v7 = 0;
    uint64_t v8 = v4;
    while ((vminvq_u8((uint8x16_t)vceqq_s8(vandq_s8(*v8, v6), v6)) & 0x80) != 0)
    {
      v7 += 4;
      ++v8;
      if (v7 >= v5) {
        goto LABEL_7;
      }
    }
  }
  return [*(id *)(a1 + 32) dispatchReportBlockCompletion];
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v16 = a4;
  id v17 = [(VNDetector *)self validatedImageBufferFromOptions:v16 error:a8];
  if (v17)
  {
    unsigned __int8 v35 = 0;
    if (+[VNValidationUtilities getBOOLValue:&v35 forKey:@"VNRemoveBackgroundProcessorOption_PerformInPlace" inOptions:v16 withDefaultValue:0 error:a8])
    {
      char v34 = 0;
      if (+[VNValidationUtilities getBOOLValue:&v34 forKey:@"VNRemoveBackgroundProcessorOption_CropResult" inOptions:v16 withDefaultValue:0 error:a8])
      {
        char v33 = 0;
        if (+[VNValidationUtilities getBOOLValue:&v33 forKey:@"VNRemoveBackgroundProcessorOption_ReturnMask" inOptions:v16 withDefaultValue:0 error:a8])
        {
          id v32 = 0;
          BOOL v18 = +[VNValidationUtilities getOptionalObject:&v32 ofClass:objc_opt_class() forKey:@"VNRemoveBackgroundProcessorOption_MaskObservation" inOptions:v16 error:a8];
          id v19 = v32;
          if (v18)
          {
            unint64_t v20 = [v17 width];
            double v21 = x * (double)v20;
            double v22 = width * (double)v20;
            double v23 = (double)(unint64_t)[v17 height];
            double v24 = y * v23;
            double v25 = height * v23;
            if (v35)
            {
              double v26 = CVPixelBufferRetain((CVPixelBufferRef)[v17 originalPixelBuffer]);
              *a7 = v26;
              if (!v26 || CVPixelBufferGetPixelFormatType(v26) != 1111970369 || !CVPixelBufferGetIOSurface(*a7) || v33)
              {
                if (a8)
                {
                  double v27 = [NSNumber numberWithBool:v35];
                  *a8 = +[VNError errorForInvalidOption:v27 named:@"performInPlace" localizedDescription:@"Conditions for in-place execution not met"];
                }
                goto LABEL_13;
              }
LABEL_18:
              if (!v19)
              {
                [v16 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"VNImageBufferOption_CreateFromPixelBufferPool"];
                uint64_t v31 = objc_msgSend(v17, "croppedBufferWithWidth:height:format:cropRect:options:error:", self->_networkWidth, self->_networkHeight, 1111970369, v16, a8, v21, v24, v22, v25);
                if (!v31)
                {
LABEL_13:
                  CVPixelBufferRelease(*a7);
                  BOOL v28 = 0;
                  *a7 = 0;
LABEL_23:

                  goto LABEL_15;
                }
                [v16 setObject:v31 forKeyedSubscript:@"VNRemoveBackgroundProcessorOption_LowResInput"];
              }
              BOOL v28 = 1;
              goto LABEL_23;
            }
            if (v33) {
              goto LABEL_18;
            }
            uint64_t v30 = (__CVBuffer *)objc_msgSend(v17, "croppedBufferWithWidth:height:format:cropRect:options:error:", (unint64_t)v22, (unint64_t)v25, 1111970369, v16, a8, v21, v24, v22, v25);
            *a7 = v30;
            if (v30) {
              goto LABEL_18;
            }
          }
          BOOL v28 = 0;
          goto LABEL_23;
        }
      }
    }
  }
  BOOL v28 = 0;
LABEL_15:

  return v28;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)VNRemoveBackgroundProcessor;
  if ([(VNEspressoModelFileBasedDetector *)&v24 completeInitializationForSession:v6 error:a4])
  {
    uint64_t v7 = [NSString stringWithUTF8String:"input_image"];
    BOOL v8 = [(VNEspressoModelFileBasedDetector *)self getWidth:&self->_networkWidth height:&self->_networkHeight ofEspressoModelNetworkBlobNamed:v7 error:a4];

    if (v8)
    {
      uint64x2_t v9 = [NSString stringWithUTF8String:"saliency"];
      BOOL v10 = [(VNEspressoModelFileBasedDetector *)self bindBuffer:&self->_outputMaskEspressoBuffer toNetworkOutputBlobName:v9 error:a4];

      if (v10)
      {
        id v11 = [NSString stringWithUTF8String:"gating_confidence"];
        BOOL v12 = [(VNEspressoModelFileBasedDetector *)self bindBuffer:&self->_outputConfidenceEspressoBuffer toNetworkOutputBlobName:v11 error:a4];

        if (v12)
        {
          v13 = [(VNDetector *)self metalContext];
          -[VNMetalContext computePipelineStateForFunctionWithName:error:]((uint64_t)v13, @"removebkgnd_assembleConstraints", (uint64_t)a4);
          v14 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
          assembleConstraintsState = self->_assembleConstraintsState;
          self->_assembleConstraintsState = v14;

          if (self->_assembleConstraintsState)
          {
            -[VNMetalContext computePipelineStateForFunctionWithName:error:]((uint64_t)v13, @"removebkgnd_maskimage", (uint64_t)a4);
            id v16 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
            applyMaskComputeState = self->_applyMaskComputeState;
            self->_applyMaskComputeState = v16;

            if (self->_applyMaskComputeState)
            {
              -[VNMetalContext computePipelineStateForFunctionWithName:error:]((uint64_t)v13, @"removebkgnd_copyCrop", (uint64_t)a4);
              BOOL v18 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
              copyCropComputeState = self->_copyCropComputeState;
              self->_copyCropComputeState = v18;

              if (self->_copyCropComputeState)
              {
                unint64_t v20 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
                removeBackgroundSemaphore = self->_removeBackgroundSemaphore;
                self->_removeBackgroundSemaphore = v20;

                if (self->_removeBackgroundSemaphore)
                {
                  BOOL v22 = 1;
LABEL_15:

                  goto LABEL_11;
                }
                if (a4)
                {
                  +[VNError errorForInternalErrorWithLocalizedDescription:@"failed to create semaphore"];
                  BOOL v22 = 0;
                  *a4 = (id)objc_claimAutoreleasedReturnValue();
                  goto LABEL_15;
                }
              }
            }
          }
          BOOL v22 = 0;
          goto LABEL_15;
        }
      }
    }
  }
  BOOL v22 = 0;
LABEL_11:

  return v22;
}

- (void)dealloc
{
  removeBackgroundSemaphore = self->_removeBackgroundSemaphore;
  if (removeBackgroundSemaphore) {
    dispatch_semaphore_signal(removeBackgroundSemaphore);
  }
  v4.receiver = self;
  v4.super_class = (Class)VNRemoveBackgroundProcessor;
  [(VNDetector *)&v4 dealloc];
}

+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3
{
  uint64_t v3 = [NSString stringWithUTF8String:"input_image"];

  return v3;
}

+ (id)espressoModelFileNameForConfigurationOptions:(id)a3
{
  uint64_t v3 = [NSString stringWithUTF8String:"subject_lifting_gen1_rev5_gv8dsz6vxu_multihead_int8.espresso"];

  return v3;
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = @"VNComputeStageMain";
  objc_super v4 = +[VNComputeDeviceUtilities allGPUComputeDevices];
  v8[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

@end