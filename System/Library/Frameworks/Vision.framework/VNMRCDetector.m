@interface VNMRCDetector
+ (id)espressoModelFileNameForConfigurationOptions:(id)a3;
+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3;
- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4;
- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9;
- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9;
- (void)dealloc;
@end

@implementation VNMRCDetector

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v14 = a5;
  id v15 = a7;
  id v16 = a9;
  v41[0] = 0;
  if (!+[VNValidationUtilities getBOOLValue:v41 forKey:@"VNMRCDetectorProcessOption_UseMLBasedDetector" inOptions:v14 error:a8])
  {
    id v23 = 0;
    goto LABEL_24;
  }
  v17 = +[VNValidationUtilities requiredObjectOfClass:objc_opt_class() forKey:@"VNMRCDetectorProcessOption_MRCDecoderOptions" inOptions:v14 error:a8];
  v18 = v17;
  if (v17)
  {
    v19 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F94298]];

    uint64_t valuePtr = 0;
    if (v19
      && (CFNumberGetValue((CFNumberRef)v19, kCFNumberCFIndexType, &valuePtr), valuePtr)
      && valuePtr != 0x20000
      && valuePtr != 0x10000)
    {
      v22 = +[VNValidationUtilities requiredObjectOfClass:0 forKey:@"VNMRCDetectorProcessOption_MRCSample" inOptions:v14 error:a8];
      if (v22)
      {
LABEL_17:
        [v18 setObject:self->_mrcContext forKeyedSubscript:*MEMORY[0x1E4F942A0]];
        uint64_t v34 = 0;
        v35 = &v34;
        uint64_t v36 = 0x3032000000;
        v37 = __Block_byref_object_copy__24241;
        v38 = __Block_byref_object_dispose__24242;
        id v39 = 0;
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __115__VNMRCDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke;
        aBlock[3] = &unk_1E5B1E4F8;
        char v33 = v41[0];
        aBlock[4] = self;
        id v28 = v18;
        v30 = &v34;
        v31 = a4;
        v32 = v22;
        id v29 = v14;
        v24 = _Block_copy(aBlock);
        if (VNExecuteBlock(v24, (uint64_t)a8)) {
          id v23 = (id)v35[5];
        }
        else {
          id v23 = 0;
        }

        _Block_object_dispose(&v34, 8);
        CFRelease(v22);
        goto LABEL_23;
      }
    }
    else
    {
      id v26 = v15;
      id v20 = v14;
      if (self
        && (+[VNValidationUtilities requiredObjectOfClass:0 forKey:@"VNMRCDetectorProcessOption_MRCSample" inOptions:v20 error:a8], (v21 = (const void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        v22 = (const void *)MRCSampleCreateByGeneratingPyramid();
        if (!v22)
        {
          if (a8)
          {
            +[VNError errorForInternalErrorWithLocalizedDescription:@"unable to generate pyramid data"];
            v22 = 0;
            *a8 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v22 = 0;
          }
        }
        CFRelease(v21);
      }
      else
      {
        v22 = 0;
      }

      id v15 = v26;
      if (v22) {
        goto LABEL_17;
      }
    }
  }
  id v23 = 0;
LABEL_23:

LABEL_24:

  return v23;
}

BOOL __115__VNMRCDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v172 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  if (*(unsigned char *)(a1 + 80))
  {
    MRCContextPreflightForDecoderUsingOptions();
    v6 = *(__CVBuffer **)(a1 + 64);
    v7 = *(void **)(a1 + 32);
    id v135 = *(id *)(a1 + 40);
    if (!v7) {
      goto LABEL_56;
    }
    if (v6)
    {
      long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      long long v152 = *MEMORY[0x1E4F1DAB8];
      long long v153 = v8;
      long long v154 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      CFDataRef v9 = (const __CFData *)CVBufferCopyAttachment(v6, @"VNCGAffineTransformAttachment", 0);
      CFDataRef v10 = v9;
      if (v9)
      {
        CFTypeID v11 = CFGetTypeID(v9);
        if (v11 == CFDataGetTypeID() && CFDataGetLength(v10) == 48)
        {
          BytePtr = CFDataGetBytePtr(v10);
          long long v13 = *(_OWORD *)BytePtr;
          long long v14 = *((_OWORD *)BytePtr + 2);
          long long v153 = *((_OWORD *)BytePtr + 1);
          long long v154 = v14;
          long long v152 = v13;
          char v15 = 1;
        }
        else if (a2)
        {
          +[VNError errorForInternalErrorWithLocalizedDescription:@"invalid transform data in pixel buffer"];
          char v15 = 0;
          *a2 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          char v15 = 0;
        }
        CFRelease(v10);
        if (v15)
        {
          uint64_t v151 = 0;
          long long v149 = 0u;
          long long v150 = 0u;
          long long v147 = 0u;
          long long v148 = 0u;
          long long v145 = 0u;
          long long v146 = 0u;
          long long v143 = 0u;
          long long v144 = 0u;
          *(_OWORD *)err = 0u;
          long long v142 = 0u;
          v27 = [NSString stringWithUTF8String:"detections"];
          char v28 = [v7 bindBuffer:err toNetworkOutputBlobName:v27 error:a2];

          if (v28)
          {
            uint64_t v171 = 0;
            long long v169 = 0u;
            long long v170 = 0u;
            long long v167 = 0u;
            long long v168 = 0u;
            long long v166 = 0u;
            memset(v165, 0, sizeof(v165));
            id v29 = [NSString stringWithUTF8String:"box_cls"];
            char v30 = [v7 bindBuffer:v165 toNetworkOutputBlobName:v29 error:a2];

            if (v30)
            {
              uint64_t v140 = 0;
              long long v138 = 0u;
              long long v139 = 0u;
              memset(v137, 0, sizeof(v137));
              v31 = [NSString stringWithUTF8String:"rotation"];
              char v32 = [v7 bindBuffer:v137 toNetworkOutputBlobName:v31 error:a2];

              if (v32)
              {
                char v33 = [NSString stringWithUTF8String:"input_image"];
                char v34 = [v7 bindLockedPixelBuffer:v6 toNetworkInputBlobName:v33 error:a2];

                if (v34)
                {
                  if ([v7 executePlanAndReturnError:a2])
                  {
                    if ((void)v148 == 1 && v147 == __PAIR128__(1, 4) && v151 == 65568)
                    {
                      if ((void)v168 == 1
                        && v167 == __PAIR128__(1, 4)
                        && (unint64_t v35 = *((void *)&v166 + 1), *((void *)&v166 + 1) == *((void *)&v146 + 1))
                        && (unint64_t v36 = v166, (void)v166 == (void)v146)
                        && v171 == 65568)
                      {
                        int64x2_t v37 = vdupq_n_s64(1uLL);
                        int32x4_t v38 = (int32x4_t)vceqq_s64(*(int64x2_t *)((char *)&v137[6] + 8), v37);
                        v37.i64[0] = *((void *)&v166 + 1);
                        if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(*(int64x2_t *)((char *)&v137[5] + 8), v37), v38)), 0xFuLL))) & 1) != 0&& v137[5].i64[0] == (void)v166&& v140 == 65568)
                        {
                          v49 = 0;
                          if (!*((void *)&v166 + 1)) {
                            goto LABEL_150;
                          }
                          v50 = 0;
                          v51 = 0;
                          unint64_t v52 = 0;
                          uint64_t v128 = v137[0].i64[0];
                          uint64_t v129 = *(void *)&v165[0];
                          CFErrorRef v127 = err[0];
                          uint64_t v133 = 2 * *((void *)&v149 + 1);
                          uint64_t v134 = *((void *)&v149 + 1);
                          uint64_t v132 = 3 * *((void *)&v149 + 1);
                          unint64_t v53 = 4;
                          uint64_t v54 = 4;
                          unint64_t v55 = v166;
                          do
                          {
                            if (v55)
                            {
                              unint64_t v56 = 0;
                              v57 = (float *)(v128 + 4 * v138 * v52);
                              uint64_t v58 = v129 + 4 * v169 * v52;
                              unint64_t v130 = v52;
                              v59 = (_DWORD *)((char *)v127 + 4 * v149 * v52);
                              do
                              {
                                if (v54)
                                {
                                  unint64_t v131 = v56;
                                  unint64_t v60 = 0;
                                  do
                                  {
                                    float v61 = *(float *)(v58 + 4 * *((void *)&v169 + 1) * v60);
                                    if (v61 > 0.1)
                                    {
                                      float v62 = *v57;
                                      float v63 = -*v57;
                                      if (*v57 > 0.0) {
                                        float v64 = 2.0;
                                      }
                                      else {
                                        float v64 = -2.0;
                                      }
                                      if (v62 > 1.0 || v62 < -1.0)
                                      {
                                        do
                                        {
                                          do
                                            float v63 = v64 + v63;
                                          while (v63 < -1.0);
                                        }
                                        while (v63 > 1.0);
                                      }
                                      float v65 = v63 * 90.0;
                                      float v66 = sqrtf(v61);
                                      if (v50 >= v51)
                                      {
                                        unint64_t v70 = 0x6DB6DB6DB6DB6DB7 * ((v50 - v49) >> 2) + 1;
                                        if (v70 > 0x924924924924924) {
                                          std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
                                        }
                                        if (0xDB6DB6DB6DB6DB6ELL * ((v51 - v49) >> 2) > v70) {
                                          unint64_t v70 = 0xDB6DB6DB6DB6DB6ELL * ((v51 - v49) >> 2);
                                        }
                                        if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((v51 - v49) >> 2)) >= 0x492492492492492) {
                                          unint64_t v71 = 0x924924924924924;
                                        }
                                        else {
                                          unint64_t v71 = v70;
                                        }
                                        v72 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<DetectedRectangle>>(v71);
                                        v74 = &v72[4 * ((v50 - v49) >> 2)];
                                        int v75 = v59[v134];
                                        int v76 = v59[v133];
                                        int v77 = v59[v132];
                                        *(_DWORD *)v74 = *v59;
                                        *((_DWORD *)v74 + 1) = v75;
                                        *((_DWORD *)v74 + 2) = v76;
                                        *((_DWORD *)v74 + 3) = v77;
                                        *((float *)v74 + 4) = v66;
                                        *((float *)v74 + 5) = v65;
                                        *((_DWORD *)v74 + 6) = v60;
                                        if (v50 == v49)
                                        {
                                          v80 = &v72[4 * ((v50 - v49) >> 2)];
                                        }
                                        else
                                        {
                                          v78 = &v72[4 * ((v50 - v49) >> 2)];
                                          do
                                          {
                                            long long v79 = *(_OWORD *)(v50 - 28);
                                            v80 = v78 - 28;
                                            *((_OWORD *)v78 - 1) = *((_OWORD *)v50 - 1);
                                            *(_OWORD *)(v78 - 28) = v79;
                                            v50 -= 28;
                                            v78 -= 28;
                                          }
                                          while (v50 != v49);
                                        }
                                        v51 = &v72[28 * v73];
                                        v50 = v74 + 28;
                                        if (v49) {
                                          operator delete(v49);
                                        }
                                        v49 = v80;
                                      }
                                      else
                                      {
                                        int v67 = v59[v134];
                                        int v68 = v59[v133];
                                        int v69 = v59[v132];
                                        *(_DWORD *)v50 = *v59;
                                        *((_DWORD *)v50 + 1) = v67;
                                        *((_DWORD *)v50 + 2) = v68;
                                        *((_DWORD *)v50 + 3) = v69;
                                        *((float *)v50 + 4) = v66;
                                        *((float *)v50 + 5) = v65;
                                        *((_DWORD *)v50 + 6) = v60;
                                        v50 += 28;
                                      }
                                      unint64_t v53 = v167;
                                    }
                                    ++v60;
                                  }
                                  while (v53 > v60);
                                  unint64_t v36 = v166;
                                  uint64_t v54 = v53;
                                  unint64_t v56 = v131;
                                }
                                ++v59;
                                v58 += 4;
                                ++v57;
                                ++v56;
                              }
                              while (v56 < v36);
                              unint64_t v35 = *((void *)&v166 + 1);
                              unint64_t v55 = v36;
                              unint64_t v52 = v130;
                            }
                            ++v52;
                          }
                          while (v52 < v35);
                          if (v49 == v50) {
                            goto LABEL_150;
                          }
                          unint64_t v81 = 0x6DB6DB6DB6DB6DB7 * ((v50 - v49) >> 2);
                          std::__introsort<std::_ClassicAlgPolicy,nonMaxSuppression(std::vector<DetectedRectangle> &,float)::$_0 &,DetectedRectangle*,false>((unint64_t)v49, v50, 126 - 2 * __clz(v81), 1);
                          if ((int)v81 < 1)
                          {
                            unint64_t v100 = (int)v81;
                          }
                          else
                          {
                            uint64_t v82 = 0;
                            v83 = (float *)(v49 + 52);
                            uint64_t v84 = 1;
                            uint64_t v85 = 0x6DB6DB6DB6DB6DB7 * ((v50 - v49) >> 2);
                            do
                            {
                              uint64_t v86 = v82 + 1;
                              if (v82 + 1 >= (int)v85)
                              {
                                LODWORD(v85) = v82 + 1;
                              }
                              else
                              {
                                uint64_t v87 = v85;
                                v88 = &v49[28 * v82];
                                v89 = (float *)(v88 + 4);
                                v90 = (float *)(v88 + 8);
                                v91 = (float *)(v88 + 12);
                                v92 = v83;
                                LODWORD(v85) = v86;
                                do
                                {
                                  if (*((_DWORD *)v88 + 6) != *(_DWORD *)v92
                                    || (float v93 = *(v92 - 6),
                                        float v94 = *(v92 - 5),
                                        float v95 = *(v92 - 4),
                                        float v96 = *(v92 - 3),
                                        float v97 = fmaxf(fminf(*v90, v95) - fmaxf(*(float *)v88, v93), 0.0)
                                            * fmaxf(fminf(*v91, v96) - fmaxf(*v89, v94), 0.0),
                                        (float)(v97
                                              / (float)((float)((float)((float)(v95 - v93) * (float)(v96 - v94))
                                                              + (float)((float)(*v90 - *(float *)v88)
                                                                      * (float)(*v91 - *v89)))
                                                      - v97)) <= 0.5))
                                  {
                                    v98 = &v49[28 * (int)v85];
                                    long long v99 = *(_OWORD *)(v92 - 6);
                                    LODWORD(v85) = v85 + 1;
                                    *(_OWORD *)(v98 + 12) = *(_OWORD *)(v92 - 3);
                                    *(_OWORD *)v98 = v99;
                                  }
                                  v92 += 7;
                                  --v87;
                                }
                                while (v84 != v87);
                              }
                              ++v84;
                              v83 += 7;
                              uint64_t v82 = v86;
                            }
                            while (v86 < (int)v85);
                            unint64_t v100 = (int)v85;
                          }
                          unint64_t v101 = v100 - v81;
                          if (v100 <= v81)
                          {
                            v105 = v100 >= v81 ? v50 : &v49[28 * (int)v100];
                          }
                          else if (0x6DB6DB6DB6DB6DB7 * ((v51 - v50) >> 2) >= v101)
                          {
                            bzero(v50, 28 * ((28 * v101 - 28) / 0x1C) + 28);
                            v105 = &v50[28 * ((28 * v101 - 28) / 0x1C) + 28];
                          }
                          else
                          {
                            if (v100 > 0x924924924924924) {
                              std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
                            }
                            if (0xDB6DB6DB6DB6DB6ELL * ((v51 - v49) >> 2) > v100) {
                              unint64_t v100 = 0xDB6DB6DB6DB6DB6ELL * ((v51 - v49) >> 2);
                            }
                            if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((v51 - v49) >> 2)) >= 0x492492492492492) {
                              unint64_t v102 = 0x924924924924924;
                            }
                            else {
                              unint64_t v102 = v100;
                            }
                            v103 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<DetectedRectangle>>(v102)
                                 + 4 * ((v50 - v49) >> 2);
                            size_t v104 = 28 * ((28 * v101 - 28) / 0x1C) + 28;
                            bzero(v103, v104);
                            v105 = &v103[v104];
                            do
                            {
                              long long v106 = *(_OWORD *)(v50 - 28);
                              *((_OWORD *)v103 - 1) = *((_OWORD *)v50 - 1);
                              *(_OWORD *)(v103 - 28) = v106;
                              v103 -= 28;
                              v50 -= 28;
                            }
                            while (v50 != v49);
                            if (v49) {
                              operator delete(v49);
                            }
                            v49 = v103;
                          }
                          if (v49 == v105) {
                            goto LABEL_150;
                          }
                          v107 = v49;
                          while (*((float *)v107 + 4) >= flt_1A410C500[*((unsigned int *)v107 + 6)])
                          {
                            v107 += 28;
                            if (v107 == v105) {
                              goto LABEL_139;
                            }
                          }
                          if (v107 != v105)
                          {
                            for (i = v107 + 28; i != v105; i += 28)
                            {
                              if (*((float *)i + 4) >= flt_1A410C500[*((unsigned int *)i + 6)])
                              {
                                long long v109 = *(_OWORD *)i;
                                *(_OWORD *)(v107 + 12) = *(_OWORD *)(i + 12);
                                *(_OWORD *)v107 = v109;
                                v107 += 28;
                              }
                            }
                          }
LABEL_139:
                          if (v105 == v49)
                          {
LABEL_150:
                            uint64_t v24 = MEMORY[0x1E4F1CBF0];
                            if (!v49) {
                              goto LABEL_57;
                            }
                          }
                          else
                          {
                            unint64_t v110 = (v105 - v49) / 28;
                            v111 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v110];
                            uint64_t v112 = *MEMORY[0x1E4F94420];
                            uint64_t v161 = *MEMORY[0x1E4F94418];
                            uint64_t v162 = v112;
                            uint64_t v113 = *MEMORY[0x1E4F94428];
                            uint64_t v163 = *MEMORY[0x1E4F94430];
                            uint64_t v164 = v113;
                            if (v110 <= 1) {
                              uint64_t v114 = 1;
                            }
                            else {
                              uint64_t v114 = v110;
                            }
                            v115 = v49 + 16;
                            do
                            {
                              float32x2_t v116 = *(float32x2_t *)(v115 - 16);
                              float64x2_t v117 = vcvtq_f64_f32((float32x2_t)vrev64_s32((int32x2_t)v116));
                              float64x2_t v118 = vaddq_f64(v117, vcvtq_f64_f32((float32x2_t)vrev64_s32((int32x2_t)vsub_f32(*(float32x2_t *)(v115 - 8), v116))));
                              CFErrorRef v156 = *(CFErrorRef *)&v117.f64[1];
                              float64x2_t v157 = v117;
                              float64x2_t v158 = v118;
                              float64x2_t v159 = v118;
                              float64_t v160 = v117.f64[0];
                              if (*((_DWORD *)v115 + 2) <= 3u)
                              {
                                v119 = (void *)MRCRegionCreate();
                                [v111 addObject:v119];
                              }
                              v115 += 28;
                              --v114;
                            }
                            while (v114);
                            v120 = (const void *)MRCDecoderCreateWithOptions();
                            if (v120)
                            {
                              CFErrorRef v156 = 0;
                              uint64_t v121 = MRCDecoderDecodeSampleWithRegions();
                              v122 = (void *)v121;
                              if (v121)
                              {
                                uint64_t v155 = v121;
                                uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v155 count:1];
                              }
                              else
                              {
                                if (a2)
                                {
                                  id v123 = [NSString alloc];
                                  v124 = (__CFString *)CFErrorCopyDescription(v156);
                                  v125 = (void *)[v123 initWithFormat:@"Could not decode sample: %@", v124];

                                  *a2 = +[VNError errorForDataUnavailableWithLocalizedDescription:v125];
                                }
                                CFRelease(v156);
                                uint64_t v24 = 0;
                              }
                              CFRelease(v120);
                            }
                            else if (a2)
                            {
                              +[VNError errorForInternalErrorWithLocalizedDescription:@"unable to create MRCDecoder"];
                              uint64_t v24 = 0;
                              *a2 = (id)objc_claimAutoreleasedReturnValue();
                            }
                            else
                            {
                              uint64_t v24 = 0;
                            }
                          }
                          operator delete(v49);
LABEL_57:

                          uint64_t v47 = *(void *)(*(void *)(a1 + 56) + 8);
                          v46 = *(void **)(v47 + 40);
                          *(void *)(v47 + 40) = v24;
                          goto LABEL_58;
                        }
                        if (a2)
                        {
                          id v23 = +[VNError errorForDataUnavailableWithLocalizedDescription:@"returned buffer from network was not in expected format - _outputRotationEspressoBuffer"];
                          goto LABEL_19;
                        }
                      }
                      else if (a2)
                      {
                        id v23 = +[VNError errorForDataUnavailableWithLocalizedDescription:@"returned buffer from network was not in expected format - _outputScoresEspressoBuffer"];
                        goto LABEL_19;
                      }
                    }
                    else if (a2)
                    {
                      id v23 = +[VNError errorForDataUnavailableWithLocalizedDescription:@"returned buffer from network was not in expected format - outputBoxesEspressoBuffer"];
                      goto LABEL_19;
                    }
                  }
                }
              }
            }
          }
        }
LABEL_56:
        uint64_t v24 = 0;
        goto LABEL_57;
      }
      if (!a2) {
        goto LABEL_56;
      }
      id v23 = +[VNError errorForDataUnavailableWithLocalizedDescription:@"AffineTransform missing afterCropAndScale"];
    }
    else
    {
      if (!a2) {
        goto LABEL_56;
      }
      id v23 = +[VNError errorForDataUnavailableWithLocalizedDescription:@"image is unavailable"];
    }
LABEL_19:
    uint64_t v24 = 0;
    *a2 = v23;
    goto LABEL_57;
  }
  id v136 = *(id *)(a1 + 48);
  id v16 = v4;
  if (!v5) {
    goto LABEL_46;
  }
  v17 = (const void *)MRCDecoderCreateWithOptions();
  if (v17)
  {
    v18 = [v136 objectForKeyedSubscript:@"VNMRCDetectorProcessOption_SegmentationMask"];

    if (v18)
    {
      CVPixelBufferLockBaseAddress((CVPixelBufferRef)v18, 1uLL);
      CVPixelBufferGetBaseAddress((CVPixelBufferRef)v18);
      CVPixelBufferGetWidth((CVPixelBufferRef)v18);
      CVPixelBufferGetHeight((CVPixelBufferRef)v18);
      CVPixelBufferGetBytesPerRow((CVPixelBufferRef)v18);
      uint64_t v126 = [v16 objectForKey:*MEMORY[0x1E4F942C0]];
      v19 = (const void *)MRCSegmentationMaskCreate();
      err[0] = 0;
      uint64_t v20 = MRCDecoderDecodeSampleWithSegmentationMask();
      v21 = (void *)v20;
      if (v20)
      {
        *(void *)&v165[0] = v20;
        uint64_t v22 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v165, 1, v126);
      }
      else
      {
        if (a2)
        {
          id v39 = [NSString alloc];
          v40 = (__CFString *)CFErrorCopyDescription(err[0]);
          v41 = (void *)[v39 initWithFormat:@"Could not decode sample: %@", v40];

          *a2 = +[VNError errorForDataUnavailableWithLocalizedDescription:v41];
        }
        CFRelease(err[0]);
        uint64_t v22 = 0;
      }
      CFRelease(v19);
      CVPixelBufferUnlockBaseAddress((CVPixelBufferRef)v18, 1uLL);
    }
    else
    {
      err[0] = 0;
      uint64_t v25 = MRCDecoderDecodeSample();
      id v26 = (void *)v25;
      if (v25)
      {
        *(void *)&v165[0] = v25;
        uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v165 count:1];
      }
      else
      {
        if (a2)
        {
          id v42 = [NSString alloc];
          v43 = (__CFString *)CFErrorCopyDescription(err[0]);
          v44 = (void *)[v42 initWithFormat:@"Could not decode sample: %@", v43];

          *a2 = +[VNError errorForDataUnavailableWithLocalizedDescription:v44];
        }
        CFRelease(err[0]);
        uint64_t v22 = 0;
      }
    }
    CFRelease(v17);
    goto LABEL_51;
  }
  if (a2)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:@"unable to create MRCDecoder"];
    uint64_t v22 = 0;
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_46:
    uint64_t v22 = 0;
  }
LABEL_51:

  uint64_t v45 = *(void *)(*(void *)(a1 + 56) + 8);
  v46 = *(void **)(v45 + 40);
  *(void *)(v45 + 40) = v22;
LABEL_58:

  return *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) != 0;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v16 = a4;
  char v57 = 0;
  if (+[VNValidationUtilities getBOOLValue:&v57 forKey:@"VNMRCDetectorProcessOption_UseMLBasedDetector" inOptions:v16 error:a8])
  {
    if (v57
      && ([v16 objectForKeyedSubscript:@"VNMRCDetectorProcessOption_SegmentationMask"],
          v17 = objc_claimAutoreleasedReturnValue(),
          v17,
          !v17))
    {
      uint64_t v20 = [(VNDetector *)self validatedImageBufferFromOptions:v16 error:a8];
      v21 = v20;
      if (v20)
      {
        unint64_t v22 = [v20 width];
        unint64_t v23 = [v21 height];
        *(_OWORD *)unint64_t v56 = *MEMORY[0x1E4F1DAD8];
        double v54 = 0.0;
        double v55 = 0.0;
        [v16 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"VNImageBufferOption_CreateFromPixelBufferPool"];
        [v16 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"VNImageBufferOption_DoNotCacheRepresentations"];
        double v24 = width * (double)v22 / (height * (double)v23);
        if (v24 >= 1.0) {
          uint64_t v25 = 1;
        }
        else {
          uint64_t v25 = 257;
        }
        id v26 = (__CVBuffer *)objc_msgSend(v21, "cropAndScaleBufferWithWidth:height:cropRect:format:imageCropAndScaleOption:options:error:calculatedNormalizedOriginOffset:calculatedScaleX:calculatedScaleY:", self->_networkWidth, self->_networkHeight, 1111970369, v25, v16, a8, x * (double)v22, y * (double)v23, v56, &v55, &v54);
        *a7 = v26;
        BOOL v18 = v26 != 0;
        if (v26)
        {
          v27 = [v16 objectForKeyedSubscript:@"VNMRCDetectorProcessOption_MaxDimensionSideScale"];
          VisionCoreImagePointForNormalizedPoint();
          double v29 = v28;
          double v31 = v30;
          v56[0] = v28;
          v56[1] = v30;
          unint64_t networkWidth = self->_networkWidth;
          unint64_t networkHeight = self->_networkHeight;
          double v35 = v54;
          double v34 = v55;
          long long v36 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
          *(_OWORD *)&v53.a = *MEMORY[0x1E4F1DAB8];
          *(_OWORD *)&v53.c = v36;
          *(_OWORD *)&v53.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
          if (v24 >= 1.0)
          {
            long long v40 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
            *(_OWORD *)&v66.a = *MEMORY[0x1E4F1DAB8];
            *(_OWORD *)&v66.c = v40;
            *(_OWORD *)&v66.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
            CGAffineTransformMakeScale(&t1, 1.0 / v55, 1.0 / v54);
            CGAffineTransformConcat(&v53, &v66, &t1);
            CGAffineTransform v63 = v53;
            CGAffineTransformMakeTranslation(&v62, -v29, -v31);
            CGAffineTransformConcat(&t2, &v63, &v62);
            *(_OWORD *)&v53.a = *(_OWORD *)&t2.a;
            *(_OWORD *)&v53.c = *(_OWORD *)&t2.c;
            float64x2_t v39 = *(float64x2_t *)&t2.tx;
          }
          else
          {
            double v37 = (double)networkHeight;
            double v38 = (double)networkWidth;
            CGAffineTransformMakeTranslation(&v53, (double)networkWidth * -0.5, (double)networkHeight * -0.5);
            CGAffineTransform t1 = v53;
            CGAffineTransformMakeRotation(&t2, 1.57079633);
            CGAffineTransformConcat(&v66, &t1, &t2);
            *(_OWORD *)&v53.c = *(_OWORD *)&v66.c;
            *(_OWORD *)&v53.tdouble x = *(_OWORD *)&v66.tx;
            *(_OWORD *)&v53.a = *(_OWORD *)&v66.a;
            CGAffineTransform v63 = v66;
            CGAffineTransformMakeTranslation(&v62, v37 * 0.5, v38 * 0.5);
            CGAffineTransformConcat(&v66, &v63, &v62);
            *(_OWORD *)&v53.c = *(_OWORD *)&v66.c;
            *(_OWORD *)&v53.tdouble x = *(_OWORD *)&v66.tx;
            *(_OWORD *)&v53.a = *(_OWORD *)&v66.a;
            CGAffineTransform v61 = v66;
            CGAffineTransformMakeScale(&v60, 1.0 / v35, 1.0 / v34);
            CGAffineTransformConcat(&v66, &v61, &v60);
            *(_OWORD *)&v53.c = *(_OWORD *)&v66.c;
            *(_OWORD *)&v53.tdouble x = *(_OWORD *)&v66.tx;
            *(_OWORD *)&v53.a = *(_OWORD *)&v66.a;
            CGAffineTransform v59 = v66;
            CGAffineTransformMakeTranslation(&v58, -v31, -v29);
            CGAffineTransformConcat(&v66, &v59, &v58);
            *(_OWORD *)&v53.a = *(_OWORD *)&v66.a;
            *(_OWORD *)&v53.c = *(_OWORD *)&v66.c;
            float64x2_t v39 = *(float64x2_t *)&v66.tx;
          }
          *(float64x2_t *)&v53.tdouble x = v39;
          float64x2_t v48 = *(float64x2_t *)&v53.c;
          float64x2_t v49 = *(float64x2_t *)&v53.a;
          float64x2_t v47 = v39;
          if (v27)
          {
            [v27 doubleValue];
            float64x2_t v42 = vmulq_n_f64(v49, v41);
            float64x2_t v43 = vmulq_n_f64(v48, v41);
            float64x2_t v44 = vmulq_n_f64(v47, v41);
          }
          else
          {
            float64x2_t v43 = *(float64x2_t *)&v53.c;
            float64x2_t v42 = *(float64x2_t *)&v53.a;
            float64x2_t v44 = v39;
          }
          *(float64x2_t *)bytes = v42;
          float64x2_t v51 = v43;
          float64x2_t v52 = v44;
          uint64_t v45 = *a7;
          CFDataRef v46 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], bytes, 48);
          if (v46)
          {
            CVBufferSetAttachment(v45, @"VNCGAffineTransformAttachment", v46, kCVAttachmentMode_ShouldPropagate);
            CFRelease(v46);
          }
        }
      }
      else
      {
        BOOL v18 = 0;
      }
    }
    else
    {
      BOOL v18 = 1;
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (void)dealloc
{
  mrcContext = self->_mrcContext;
  if (mrcContext)
  {
    CFRelease(mrcContext);
    self->_mrcContext = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VNMRCDetector;
  [(VNDetector *)&v4 dealloc];
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VNMRCDetector;
  if (-[VNEspressoModelFileBasedDetector completeInitializationForSession:error:](&v16, sel_completeInitializationForSession_error_, v6, a4)&& ([NSString stringWithUTF8String:"input_image"], v7 = objc_claimAutoreleasedReturnValue(), BOOL v8 = -[VNEspressoModelFileBasedDetector getWidth:height:ofEspressoModelNetworkBlobNamed:error:](self, "getWidth:height:ofEspressoModelNetworkBlobNamed:error:", &self->_networkWidth, &self->_networkHeight, v7, a4), v7, v8))
  {
    CFDataRef v9 = [(VNDetector *)self boundComputeDeviceForComputeStage:@"VNComputeStageMain" error:a4];
    BOOL v10 = v9 != 0;
    if (v9)
    {
      id v11 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      v18[0] = v9;
      v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
      uint64_t v17 = *MEMORY[0x1E4F94288];
      long long v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
      long long v14 = (void *)[v11 initWithObjects:v12 forKeys:v13];

      self->_mrcContext = (__MRCContext *)MRCContextCreateWithOptions();
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3
{
  v3 = [NSString stringWithUTF8String:"input_image"];

  return v3;
}

+ (id)espressoModelFileNameForConfigurationOptions:(id)a3
{
  v3 = [NSString stringWithUTF8String:"mrcdetector.espresso"];

  return v3;
}

@end