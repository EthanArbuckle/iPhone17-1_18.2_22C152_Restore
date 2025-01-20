@interface VNE5RTScreenGazeDetector
+ (CGRect)normalizedScaledFaceBoundingBox:(id)a3;
+ (Class)detectorClassForConfigurationOptions:(id)a3 error:(id *)a4;
+ (NSString)modelFunctionName;
+ (NSString)modelInputImageName;
+ (NSString)modelOutputDeviceGazeProbabilitiesName;
+ (NSString)modelOutputXYName;
+ (id)E5RTFunctionDescriptorForConfigurationOptions:(id)a3 error:(id *)a4;
+ (id)configurationOptionKeysForDetectorKey;
+ (id)modelURLForConfigurationOptions:(id)a3 error:(id *)a4;
+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4;
- (BOOL)needsMetalContext;
- (id)observationsFromE5RTExecutionOutputs:(id)a3 forFunctionDescriptor:(id)a4 originatingRequestSpecifier:(id)a5 options:(id)a6 error:(id *)a7;
@end

@implementation VNE5RTScreenGazeDetector

+ (CGRect)normalizedScaledFaceBoundingBox:(id)a3
{
  id v3 = a3;
  [v3 unalignedBoundingBox];
  CGRect v13 = CGRectInset(v12, v12.size.width * -0.200000048 * 0.5, v12.size.height * -0.200000048 * 0.5);
  CGFloat x = v13.origin.x;
  CGFloat y = v13.origin.y;
  CGFloat width = v13.size.width;
  CGFloat height = v13.size.height;

  double v8 = x;
  double v9 = y;
  double v10 = width;
  double v11 = height;
  result.size.CGFloat height = v11;
  result.size.CGFloat width = v10;
  result.origin.CGFloat y = v9;
  result.origin.CGFloat x = v8;
  return result;
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7 = @"VNComputeStageMain";
  v4 = +[VNComputeDeviceUtilities allNeuralEngineComputeDevices];
  v8[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

+ (id)E5RTFunctionDescriptorForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __80__VNE5RTScreenGazeDetector_E5RTFunctionDescriptorForConfigurationOptions_error___block_invoke;
  v21 = &unk_1E5B20078;
  id v23 = a1;
  id v7 = v6;
  id v22 = v7;
  double v8 = _Block_copy(&aBlock);
  double v9 = [a1 modelURLForConfigurationOptions:v7 error:a4];
  if (v9)
  {
    id v10 = [NSString alloc];
    double v11 = NSStringFromClass((Class)a1);
    CGRect v12 = [a1 modelFileName];
    CGRect v13 = (void *)[v10 initWithFormat:@"%@:%@", v11, v12, aBlock, v19, v20, v21];

    v14 = +[VNFrameworkManager manager];
    v15 = [v14 detectorDescriptorsCache];
    v16 = [v15 objectForIdentifier:v13 creationBlock:v8 error:a4];
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

id __80__VNE5RTScreenGazeDetector_E5RTFunctionDescriptorForConfigurationOptions_error___block_invoke(uint64_t a1, uint64_t a2)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v4 = [*(id *)(a1 + 40) E5RTProgramLibraryForConfigurationOptions:*(void *)(a1 + 32) error:a2];
  if (v4)
  {
    v5 = [*(id *)(a1 + 40) modelFunctionName];
    id v6 = [*(id *)(a1 + 40) modelInputImageName];
    id v7 = [*(id *)(a1 + 40) modelOutputXYName];
    v12[0] = v7;
    double v8 = [*(id *)(a1 + 40) modelOutputDeviceGazeProbabilitiesName];
    v12[1] = v8;
    double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
    id v10 = +[VisionCoreE5RTInferenceFunctionDescriptor descriptorForProgramLibrary:v4 functionName:v5 inputImageName:v6 outputNames:v9 confidencesOutputName:0 labelsFileName:0 error:a2];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)modelURLForConfigurationOptions:(id)a3 error:(id *)a4
{
  v5 = objc_msgSend(a1, "modelFileName", a3);
  id v6 = +[VNEspressoHelpers pathForEspressoResourceWithFilename:v5 error:a4];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (NSString)modelOutputDeviceGazeProbabilitiesName
{
  return (NSString *)@"devicegaze_probs";
}

+ (NSString)modelOutputXYName
{
  return (NSString *)@"xy";
}

+ (NSString)modelFunctionName
{
  return (NSString *)@"main";
}

+ (NSString)modelInputImageName
{
  return (NSString *)@"facecrop";
}

+ (Class)detectorClassForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v5 specifyingRequestClass:objc_opt_class() error:a4];
  id v7 = v6;
  if (v6)
  {
    if ([v6 requestRevision] == 2)
    {
      uint64_t v11 = 0;
      if (+[VNValidationUtilities getNSUIntegerValue:&v11 forKey:@"VNScreenGazeDetectorInitOption_ScreenSize" inOptions:v5 error:a4])
      {
        if (v11 == 1 || v11 == 2)
        {
          double v9 = objc_opt_class();
          goto LABEL_14;
        }
        if (a4)
        {
          double v8 = +[VNError errorForUnsupportedRequestSpecifier:v7];
          goto LABEL_9;
        }
      }
    }
    else if (a4)
    {
      double v8 = +[VNError errorForUnsupportedRequestSpecifier:v7];
LABEL_9:
      double v9 = 0;
      *a4 = v8;
      goto LABEL_14;
    }
  }
  double v9 = 0;
LABEL_14:

  return (Class)v9;
}

+ (id)configurationOptionKeysForDetectorKey
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__VNE5RTScreenGazeDetector_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNE5RTScreenGazeDetector configurationOptionKeysForDetectorKey]::onceToken != -1) {
    dispatch_once(&+[VNE5RTScreenGazeDetector configurationOptionKeysForDetectorKey]::onceToken, block);
  }
  v2 = (void *)+[VNE5RTScreenGazeDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;

  return v2;
}

void __65__VNE5RTScreenGazeDetector_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNE5RTScreenGazeDetector;
  v1 = objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v2 = (void *)[v1 mutableCopy];

  [v2 addObject:@"VNScreenGazeDetectorInitOption_ScreenSize"];
  uint64_t v3 = [v2 copy];
  v4 = (void *)+[VNE5RTScreenGazeDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNE5RTScreenGazeDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;
}

- (id)observationsFromE5RTExecutionOutputs:(id)a3 forFunctionDescriptor:(id)a4 originatingRequestSpecifier:(id)a5 options:(id)a6 error:(id *)a7
{
  v172[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = +[VNValidationUtilities requiredObjectOfClass:objc_opt_class() forKey:@"VNScreenGazeDetectorProcessOption_FaceObjectState" inOptions:v13 error:a7];
  if (v14)
  {
    long long v166 = xmmword_1A410C0E0;
    id v15 = v11;
    if (!self) {
      goto LABEL_9;
    }
    v16 = [(id)objc_opt_class() modelOutputXYName];
    v168.i64[0] = MEMORY[0x1E4F143A8];
    v168.i64[1] = 3221225472;
    v169 = __71__VNE5RTScreenGazeDetector__screenGazeResultForOutput_resultOut_error___block_invoke;
    v170 = &__block_descriptor_40_e20_B24__0__NSData_8__16l;
    v171 = &v166;
    char v17 = [v15 accessReadOnlyDataForName:v16 usingBlock:&v168 error:a7];

    if (v17)
    {
      v18 = [(id)objc_opt_class() modelOutputDeviceGazeProbabilitiesName];
      v167[0] = MEMORY[0x1E4F143A8];
      v167[1] = 3221225472;
      v167[2] = __71__VNE5RTScreenGazeDetector__screenGazeResultForOutput_resultOut_error___block_invoke_2;
      v167[3] = &__block_descriptor_40_e20_B24__0__NSData_8__16l;
      v167[4] = &v166;
      char v19 = [v15 accessReadOnlyDataForName:v18 usingBlock:v167 error:a7];

      if (v19)
      {
        uint64_t v20 = *(void *)(v14 + 64);
        if (!*(unsigned char *)(v20 + 4))
        {
          float32x4_t v27 = (float32x4_t)v166;
LABEL_85:
          float32x4_t v168 = v27;
          v111 = -[VNFaceScreenGaze initWithScreenGaze:originatingRequestSpecifier:]([VNFaceScreenGaze alloc], (float32x2_t *)&v168, v12);
          v112 = objc_msgSend(*(id *)(v14 + 8), "vn_cloneObject");
          [v112 setUUID:*(void *)(v14 + 40)];
          [v112 setFaceScreenGaze:v111];

          if (v112)
          {
            v172[0] = v112;
            v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v172 count:1];
          }
          else if (a7)
          {
            +[VNError errorForInternalErrorWithLocalizedDescription:@"Failed to create screen gaze observation"];
            v25 = 0;
            *a7 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v25 = 0;
          }

          goto LABEL_11;
        }
        uint64_t v21 = *(void *)(v20 + 64);
        if (v21 == *(_DWORD *)v20)
        {
          id v22 = *(void ***)(v20 + 32);
          unint64_t v23 = *(void *)(v20 + 56);
          *(float32x4_t *)(v20 + 8) = vsubq_f32(*(float32x4_t *)(v20 + 8), (*(float32x4_t **)((char *)v22 + ((v23 >> 5) & 0x7FFFFFFFFFFFFF8)))[v23]);
          --v21;
          unint64_t v24 = v23 + 1;
          *(void *)(v20 + 56) = v24;
          *(void *)(v20 + 64) = v21;
          if (v24 >= 0x200)
          {
            operator delete(*v22);
            *(void *)(v20 + 32) += 8;
            uint64_t v21 = *(void *)(v20 + 64);
            unint64_t v24 = *(void *)(v20 + 56) - 256;
            *(void *)(v20 + 56) = v24;
          }
        }
        else
        {
          unint64_t v24 = *(void *)(v20 + 56);
        }
        v28 = *(char **)(v20 + 40);
        v29 = *(char **)(v20 + 32);
        uint64_t v30 = 32 * (v28 - v29) - 1;
        uint64_t v31 = v28 - v29;
        if (v28 == v29) {
          uint64_t v30 = 0;
        }
        unint64_t v32 = v21 + v24;
        if (v30 != v32)
        {
LABEL_84:
          *(_OWORD *)(*(void *)&v29[(v32 >> 5) & 0x7FFFFFFFFFFFFF8] + 16 * v32) = v166;
          uint64_t v107 = *(void *)(v20 + 64) + 1;
          *(void *)(v20 + 64) = v107;
          float32x2_t v108 = *(float32x2_t *)(v20 + 16);
          *(float32x2_t *)v109.f32 = vadd_f32(*(float32x2_t *)&v166, *(float32x2_t *)(v20 + 8));
          *(void *)(v20 + 8) = v109.i64[0];
          float32x2_t v110 = vadd_f32(*(float32x2_t *)((char *)&v166 + 8), (float32x2_t)vbsl_s8(vorr_s8((int8x8_t)vcltz_f32(v108), (int8x8_t)vcgez_f32(v108)), (int8x8_t)v108, (int8x8_t)0x8000000080000000));
          v108.f32[0] = (float)(int)v107;
          *(float32x2_t *)(v20 + 16) = v110;
          *(float32x2_t *)&v109.u32[2] = v110;
          float32x4_t v27 = vdivq_f32(v109, (float32x4_t)vdupq_lane_s32((int32x2_t)v108, 0));
          goto LABEL_85;
        }
        if (v24 < 0x100)
        {
          uint64_t v50 = v31 >> 3;
          v51 = *(char **)(v20 + 48);
          v52 = *(char **)(v20 + 24);
          if (v31 >> 3 >= (unint64_t)((v51 - v52) >> 3))
          {
            if (v51 == v52) {
              unint64_t v53 = 1;
            }
            else {
              unint64_t v53 = (v51 - v52) >> 2;
            }
            v54 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v53);
            uint64_t v158 = v55;
            *(void *)&long long v56 = v54;
            v155 = v54;
            v156 = &v54[8 * v50];
            *((void *)&v56 + 1) = v156;
            long long v162 = v56;
            v57 = operator new(0x1000uLL);
            v58 = v156;
            *(void *)&long long v59 = v156;
            *((void *)&v59 + 1) = &v155[8 * v158];
            if (v50 == v158)
            {
              uint64_t v60 = v156 - v155;
              *(void *)&long long v61 = v162;
              if (v31 < 1)
              {
                v80 = v57;
                uint64_t v81 = v60 >> 2;
                if (v28 == v29) {
                  unint64_t v82 = 1;
                }
                else {
                  unint64_t v82 = v81;
                }
                v83 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v82);
                v58 = &v83[8 * (v82 >> 2)];
                *(void *)&long long v61 = v83;
                *((void *)&v61 + 1) = v58;
                *(void *)&long long v59 = v58;
                *((void *)&v59 + 1) = &v83[8 * v84];
                if (v155)
                {
                  long long v159 = v59;
                  long long v163 = v61;
                  v85 = &v83[8 * (v82 >> 2)];
                  operator delete(v155);
                  v58 = v85;
                  long long v59 = v159;
                  long long v61 = v163;
                }
                v57 = v80;
              }
              else
              {
                uint64_t v62 = v60 >> 3;
                if (v62 >= -1) {
                  unint64_t v63 = v62 + 1;
                }
                else {
                  unint64_t v63 = v62 + 2;
                }
                v58 = &v156[-8 * (v63 >> 1)];
                *(void *)&long long v59 = v58;
                *((void *)&v61 + 1) = v58;
              }
            }
            else
            {
              long long v61 = v162;
            }
            *(void *)v58 = v57;
            *(void *)&long long v59 = v59 + 8;
            uint64_t v86 = *(void *)(v20 + 40);
            id v157 = v13;
            while (v86 != *(void *)(v20 + 32))
            {
              v87 = (void *)*((void *)&v61 + 1);
              if (*((void *)&v61 + 1) == (void)v61)
              {
                v89 = (unsigned char *)v59;
                if ((unint64_t)v59 >= *((void *)&v59 + 1))
                {
                  if (*((void *)&v59 + 1) == *((void *)&v61 + 1)) {
                    unint64_t v96 = 1;
                  }
                  else {
                    unint64_t v96 = (uint64_t)(*((void *)&v59 + 1) - *((void *)&v61 + 1)) >> 2;
                  }
                  v97 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v96);
                  v88 = &v97[(2 * v96 + 6) & 0xFFFFFFFFFFFFFFF8];
                  v99 = v88;
                  uint64_t v100 = v89 - (unsigned char *)v87;
                  if (v89 != (unsigned char *)v87)
                  {
                    v99 = &v88[v100 & 0xFFFFFFFFFFFFFFF8];
                    uint64_t v101 = 8 * (v100 >> 3);
                    v102 = v88;
                    v103 = v87;
                    do
                    {
                      uint64_t v104 = *v103++;
                      *(void *)v102 = v104;
                      v102 += 8;
                      v101 -= 8;
                    }
                    while (v101);
                  }
                  *(void *)&long long v61 = v97;
                  *((void *)&v61 + 1) = v88;
                  *(void *)&long long v59 = v99;
                  *((void *)&v59 + 1) = &v97[8 * v98];
                  if (v87)
                  {
                    long long v160 = v59;
                    long long v165 = v61;
                    operator delete(v87);
                    long long v59 = v160;
                    long long v61 = v165;
                  }
                }
                else
                {
                  id v90 = v11;
                  id v91 = v12;
                  uint64_t v92 = (uint64_t)(*((void *)&v59 + 1) - v59) >> 3;
                  if (v92 >= -1) {
                    uint64_t v93 = v92 + 1;
                  }
                  else {
                    uint64_t v93 = v92 + 2;
                  }
                  uint64_t v94 = v93 >> 1;
                  uint64_t v95 = v59 + 8 * (v93 >> 1);
                  v88 = (char *)(v95 - (v59 - *((void *)&v61 + 1)));
                  if ((void)v59 == *((void *)&v61 + 1))
                  {
                    v89 = (unsigned char *)*((void *)&v61 + 1);
                  }
                  else
                  {
                    uint64_t v161 = *((void *)&v59 + 1);
                    uint64_t v164 = v61;
                    memmove((void *)(v95 - (v59 - *((void *)&v61 + 1))), *((const void **)&v61 + 1), v59 - *((void *)&v61 + 1));
                    *((void *)&v59 + 1) = v161;
                    *(void *)&long long v61 = v164;
                  }
                  *((void *)&v61 + 1) = v88;
                  *(void *)&long long v59 = &v89[8 * v94];
                  id v12 = v91;
                  id v11 = v90;
                  id v13 = v157;
                }
              }
              else
              {
                v88 = (char *)*((void *)&v61 + 1);
              }
              uint64_t v105 = *(void *)(v86 - 8);
              v86 -= 8;
              *((void *)v88 - 1) = v105;
              *((void *)&v61 + 1) -= 8;
            }
            v106 = *(void **)(v20 + 24);
            *(_OWORD *)(v20 + 24) = v61;
            *(_OWORD *)(v20 + 40) = v59;
            if (v106) {
              operator delete(v106);
            }
            goto LABEL_83;
          }
          if (v51 == v28)
          {
            v77 = operator new(0x1000uLL);
            v78 = *(char **)(v20 + 32);
            if (v78 == *(char **)(v20 + 24))
            {
              v113 = *(unsigned char **)(v20 + 40);
              v114 = *(unsigned char **)(v20 + 48);
              if (v113 >= v114)
              {
                if (v114 == v78) {
                  unint64_t v121 = 1;
                }
                else {
                  unint64_t v121 = (v114 - v78) >> 2;
                }
                v122 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v121);
                v79 = &v122[(2 * v121 + 6) & 0xFFFFFFFFFFFFFFF8];
                v124 = *(uint64_t **)(v20 + 32);
                v125 = v79;
                uint64_t v126 = *(void *)(v20 + 40) - (void)v124;
                if (v126)
                {
                  v125 = &v79[v126 & 0xFFFFFFFFFFFFFFF8];
                  uint64_t v127 = 8 * (v126 >> 3);
                  v128 = v79;
                  do
                  {
                    uint64_t v129 = *v124++;
                    *(void *)v128 = v129;
                    v128 += 8;
                    v127 -= 8;
                  }
                  while (v127);
                }
                v130 = *(void **)(v20 + 24);
                *(void *)(v20 + 24) = v122;
                *(void *)(v20 + 32) = v79;
                *(void *)(v20 + 40) = v125;
                *(void *)(v20 + 48) = &v122[8 * v123];
                if (v130)
                {
                  operator delete(v130);
                  v79 = *(char **)(v20 + 32);
                }
              }
              else
              {
                id v115 = v13;
                id v116 = v11;
                id v117 = v12;
                uint64_t v118 = (v114 - v113) >> 3;
                if (v118 >= -1) {
                  uint64_t v119 = v118 + 1;
                }
                else {
                  uint64_t v119 = v118 + 2;
                }
                uint64_t v120 = v119 >> 1;
                v79 = &v78[8 * (v119 >> 1)];
                if (v113 != v78)
                {
                  memmove(&v78[8 * (v119 >> 1)], v78, v113 - v78);
                  v78 = *(char **)(v20 + 40);
                }
                *(void *)(v20 + 32) = v79;
                *(void *)(v20 + 40) = &v78[8 * v120];
                id v12 = v117;
                id v11 = v116;
                id v13 = v115;
              }
            }
            else
            {
              v79 = *(char **)(v20 + 32);
            }
            *((void *)v79 - 1) = v77;
            v131 = *(char **)(v20 + 32);
            v132 = *(char **)(v20 + 40);
            *(void *)(v20 + 32) = v131 - 8;
            uint64_t v133 = *((void *)v131 - 1);
            *(void *)(v20 + 32) = v131;
            if (v132 == *(char **)(v20 + 48))
            {
              unint64_t v134 = *(void *)(v20 + 24);
              uint64_t v135 = (uint64_t)&v131[-v134];
              if ((unint64_t)v131 <= v134)
              {
                uint64_t v143 = (uint64_t)&v132[-v134];
                BOOL v64 = v143 == 0;
                uint64_t v144 = v143 >> 2;
                if (v64) {
                  unint64_t v145 = 1;
                }
                else {
                  unint64_t v145 = v144;
                }
                v146 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v145);
                v148 = &v146[8 * (v145 >> 2)];
                v149 = *(uint64_t **)(v20 + 32);
                v132 = v148;
                uint64_t v150 = *(void *)(v20 + 40) - (void)v149;
                if (v150)
                {
                  v132 = &v148[v150 & 0xFFFFFFFFFFFFFFF8];
                  uint64_t v151 = 8 * (v150 >> 3);
                  v152 = &v146[8 * (v145 >> 2)];
                  do
                  {
                    uint64_t v153 = *v149++;
                    *(void *)v152 = v153;
                    v152 += 8;
                    v151 -= 8;
                  }
                  while (v151);
                }
                v154 = *(void **)(v20 + 24);
                *(void *)(v20 + 24) = v146;
                *(void *)(v20 + 32) = v148;
                *(void *)(v20 + 40) = v132;
                *(void *)(v20 + 48) = &v146[8 * v147];
                if (v154)
                {
                  operator delete(v154);
                  v132 = *(char **)(v20 + 40);
                }
              }
              else
              {
                uint64_t v136 = v135 >> 3;
                BOOL v39 = v135 >> 3 < -1;
                uint64_t v137 = (v135 >> 3) + 2;
                if (v39) {
                  uint64_t v138 = v137;
                }
                else {
                  uint64_t v138 = v136 + 1;
                }
                uint64_t v139 = -(v138 >> 1);
                uint64_t v140 = v138 >> 1;
                v141 = &v131[-8 * v140];
                int64_t v142 = v132 - v131;
                if (v132 != v131)
                {
                  memmove(&v131[-8 * v140], v131, v132 - v131);
                  v131 = *(char **)(v20 + 32);
                }
                v132 = &v141[v142];
                *(void *)(v20 + 32) = &v131[8 * v139];
                *(void *)(v20 + 40) = &v141[v142];
              }
            }
            *(void *)v132 = v133;
          }
          else
          {
            *(void *)v28 = operator new(0x1000uLL);
          }
        }
        else
        {
          *(void *)(v20 + 56) = v24 - 256;
          uint64_t v35 = *(void *)v29;
          v33 = v29 + 8;
          uint64_t v34 = v35;
          *(void *)(v20 + 32) = v33;
          if (*(char **)(v20 + 48) == v28)
          {
            unint64_t v36 = *(void *)(v20 + 24);
            uint64_t v37 = (uint64_t)&v33[-v36];
            if ((unint64_t)v33 <= v36)
            {
              uint64_t v65 = (uint64_t)&v28[-v36];
              BOOL v64 = v65 == 0;
              uint64_t v66 = v65 >> 2;
              if (v64) {
                unint64_t v67 = 1;
              }
              else {
                unint64_t v67 = v66;
              }
              v68 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v67);
              v70 = &v68[8 * (v67 >> 2)];
              v71 = *(uint64_t **)(v20 + 32);
              v28 = v70;
              uint64_t v72 = *(void *)(v20 + 40) - (void)v71;
              if (v72)
              {
                v28 = &v70[v72 & 0xFFFFFFFFFFFFFFF8];
                uint64_t v73 = 8 * (v72 >> 3);
                v74 = &v68[8 * (v67 >> 2)];
                do
                {
                  uint64_t v75 = *v71++;
                  *(void *)v74 = v75;
                  v74 += 8;
                  v73 -= 8;
                }
                while (v73);
              }
              v76 = *(void **)(v20 + 24);
              *(void *)(v20 + 24) = v68;
              *(void *)(v20 + 32) = v70;
              *(void *)(v20 + 40) = v28;
              *(void *)(v20 + 48) = &v68[8 * v69];
              if (v76)
              {
                operator delete(v76);
                v28 = *(char **)(v20 + 40);
              }
            }
            else
            {
              uint64_t v38 = v37 >> 3;
              BOOL v39 = v37 >> 3 < -1;
              uint64_t v40 = (v37 >> 3) + 2;
              if (v39) {
                uint64_t v41 = v40;
              }
              else {
                uint64_t v41 = v38 + 1;
              }
              uint64_t v42 = -(v41 >> 1);
              uint64_t v43 = v41 >> 1;
              v44 = &v33[-8 * v43];
              size_t v45 = v28 - v33;
              if (v28 == v33)
              {
                v49 = v28;
              }
              else
              {
                v46 = &v33[-8 * v43];
                v47 = v33;
                uint64_t v48 = v42;
                memmove(v46, v47, v45);
                v44 = v46;
                uint64_t v42 = v48;
                v49 = *(char **)(v20 + 32);
              }
              v28 = &v44[v45];
              *(void *)(v20 + 32) = &v49[8 * v42];
              *(void *)(v20 + 40) = &v44[v45];
            }
          }
          *(void *)v28 = v34;
        }
        *(void *)(v20 + 40) += 8;
LABEL_83:
        v29 = *(char **)(v20 + 32);
        unint64_t v32 = *(void *)(v20 + 64) + *(void *)(v20 + 56);
        goto LABEL_84;
      }
    }
    else
    {
LABEL_9:
    }
  }
  v25 = 0;
LABEL_11:

  return v25;
}

BOOL __71__VNE5RTScreenGazeDetector__screenGazeResultForOutput_resultOut_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 length];
  if (v6 == 8)
  {
    id v7 = (_DWORD *)[v5 bytes];
    double v8 = *(_DWORD **)(a1 + 32);
    *double v8 = *v7;
    v8[1] = v7[1];
  }
  else if (a3)
  {
    double v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s size is %lu bytes instead of the expected %lu bytes \n", "xy", objc_msgSend(v5, "length"), 8);
    *a3 = +[VNError errorForInternalErrorWithLocalizedDescription:v9];
  }
  return v6 == 8;
}

BOOL __71__VNE5RTScreenGazeDetector__screenGazeResultForOutput_resultOut_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 length];
  if (v6 == 8)
  {
    id v7 = (_DWORD *)[v5 bytes];
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)(v8 + 8) = *v7;
    *(_DWORD *)(v8 + 12) = v7[1];
  }
  else if (a3)
  {
    double v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s size is %lu bytes instead of the expected %lu bytes \n", "devicegaze_probs", objc_msgSend(v5, "length"), 12);
    *a3 = +[VNError errorForInternalErrorWithLocalizedDescription:v9];
  }
  return v6 == 8;
}

- (BOOL)needsMetalContext
{
  return 0;
}

@end