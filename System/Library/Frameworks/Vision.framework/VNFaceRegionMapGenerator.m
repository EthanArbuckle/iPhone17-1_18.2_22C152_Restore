@interface VNFaceRegionMapGenerator
+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4;
- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4;
- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9;
- (id).cxx_construct;
- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9;
- (void)dealloc;
@end

@implementation VNFaceRegionMapGenerator

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->mFaceRegionMapAlgorithmImpl.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  uint64_t v185 = *MEMORY[0x1E4F143B8];
  id v13 = a5;
  id v14 = a7;
  id v15 = a9;
  v148 = [(VNDetector *)self validatedImageBufferFromOptions:v13 error:a8];
  if (!v148)
  {
    v92 = 0;
    goto LABEL_133;
  }
  v146 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v13 error:a8];
  if (!v146)
  {
    v92 = 0;
    goto LABEL_132;
  }
  v147 = VNCloneFaceObservationFromOptions((uint64_t)v13, a8);
  if (!v147)
  {
    v92 = 0;
    goto LABEL_131;
  }
  [v148 width];
  [v148 height];
  [v147 alignedBoundingBox];
  float __D = v16;
  float v155 = v17;
  __p = 0;
  v161 = 0;
  uint64_t v162 = 0;
  std::vector<_Geometry2D_point2D_>::resize((char **)&__p);
  v18 = (float32x2_t *)__p;
  id v19 = [v147 landmarkPoints65];
  memcpy(v18, (const void *)[v19 bytes], 0x1F8uLL);

  uint64_t v20 = (uint64_t)v161;
  if (v18 != v161)
  {
    v21 = v18;
    do
    {
      float32x2_t *v21 = vmul_f32((float32x2_t)__PAIR64__(LODWORD(__D), LODWORD(v155)), *v21);
      ++v21;
    }
    while (v21 != (float32x2_t *)v20);
  }
  ptr = self->mFaceRegionMapAlgorithmImpl.__ptr_;
  memset(v159, 0, sizeof(v159));
  v168 = 0;
  uint64_t v169 = 0;
  uint64_t v170 = 0;
  std::vector<_Geometry2D_point2D_>::__init_with_size[abi:ne180100]<_Geometry2D_point2D_*,_Geometry2D_point2D_*>(&v168, v18, v20, (v20 - (uint64_t)v18) >> 3);
  v23 = v168;
  if (v169 - (void)v168 != 504)
  {
    uint64_t v91 = 5756;
    if (!v168) {
      goto LABEL_85;
    }
    goto LABEL_84;
  }
  id v141 = v15;
  id v142 = v13;
  uint64_t v143 = FaceRegionMap_addForeheadLandmarks((uint64_t)&v168);
  if ((v143 & 0x80) == 0) {
    goto LABEL_77;
  }
  *(int64x2_t *)((char *)v159 + 8) = vdupq_n_s64(0x100uLL);
  *((void *)&v159[1] + 1) = 256;
  v24 = malloc_type_malloc(0x10000uLL, 0x100004077774924uLL);
  v25 = v24;
  *(void *)&v159[0] = v24;
  if (!v24)
  {
    uint64_t v91 = 5755;
    goto LABEL_78;
  }
  bzero(v24, 0x10000uLL);
  float __B = v155 * 0.0039062;
  float v26 = __D * 0.0039062;
  __C = 0;
  v165 = 0;
  uint64_t v166 = 0;
  Geometry2D_mallocCart2D(&__C, 256);
  uint64_t v27 = 0;
  v28 = __C;
  do
  {
    v28[v27] = (float)(int)v27;
    ++v27;
  }
  while (v27 != 256);
  v138 = v18;
  v139 = self;
  v140 = a8;
  v29 = v28;
  vDSP_vsmul(v28, 1, &__B, v28, 1, 0x100uLL);
  uint64_t v30 = 0;
  uint64_t v31 = (int)v166;
  size_t v32 = 4 * v166;
  v33 = v168;
  v150 = v29;
  v156 = v165;
  if (v29) {
    BOOL v34 = v165 == 0;
  }
  else {
    BOOL v34 = 1;
  }
  char v36 = v34 || (int)v166 < 1;
  char v144 = v36;
  uint64_t v145 = 4 * v166;
  do
  {
    float __A = v26 * (float)v30;
    vDSP_vfill(&__A, v156, 1, 0x100uLL);
    uint64_t v149 = v30;
    v25[14] = 0u;
    v25[15] = 0u;
    v25[12] = 0u;
    v25[13] = 0u;
    v25[10] = 0u;
    v25[11] = 0u;
    v25[8] = 0u;
    v25[9] = 0u;
    v25[6] = 0u;
    v25[7] = 0u;
    v25[4] = 0u;
    v25[5] = 0u;
    v25[2] = 0u;
    v25[3] = 0u;
    _OWORD *v25 = 0u;
    v25[1] = 0u;
    if ((int)v31 < 1)
    {
      v37 = 0;
LABEL_27:
      free(v37);
      v37 = 0;
      v38 = 0;
      int v39 = 0;
      goto LABEL_28;
    }
    v37 = malloc_type_malloc(v32, 0x100004052888210uLL);
    if (!v37) {
      goto LABEL_27;
    }
    v38 = (float *)malloc_type_malloc(v32, 0x100004052888210uLL);
    int v39 = v31;
    if (!v38) {
      goto LABEL_27;
    }
LABEL_28:
    v171 = 0;
    v172 = 0;
    uint64_t v173 = 0;
    Geometry2D_mallocCart2D(&v171, v31);
    v40 = (uint64_t *)*((void *)ptr + 10);
    v41 = (float *)v171;
    __Da = v172;
    if (v40 != *((uint64_t **)ptr + 11))
    {
      if (v171) {
        BOOL v42 = v172 == 0;
      }
      else {
        BOOL v42 = 1;
      }
      char v44 = v42 || (int)v173 < 1;
      char v45 = v144;
      if (!v37)
      {
        char v45 = 1;
        char v44 = 1;
      }
      if (!v38)
      {
        char v45 = 1;
        char v44 = 1;
      }
      if (v39 < 1)
      {
        char v45 = 1;
        char v44 = 1;
      }
      vDSP_Length __N = v173;
      if (v31 == v39) {
        char v46 = v45;
      }
      else {
        char v46 = 1;
      }
      vDSP_Length v153 = (int)v173;
      if (v173 == v39) {
        char v47 = v44;
      }
      else {
        char v47 = 1;
      }
      char v151 = v47;
      char v152 = v46;
      do
      {
        uint64_t v48 = *v40;
        uint64_t v49 = v40[1];
        v50 = (float *)&v33[8 * *v40];
        float v51 = *v50;
        float v182 = *v50;
        float v52 = v50[1];
        float v179 = v52;
        v53 = (float *)&v33[8 * v49];
        float v54 = *v53;
        float v183 = *v53;
        float v55 = v53[1];
        float v180 = v55;
        uint64_t v56 = v40[2];
        v57 = (float *)&v33[8 * v56];
        float v58 = *v57;
        float v184 = *v57;
        float v59 = v57[1];
        float v181 = v59;
        if ((v46 & 1) == 0)
        {
          float v60 = v51 - v54;
          float v61 = v52 - v59;
          float v62 = v51 - v58;
          float v63 = v52 - v55;
          float v64 = (float)(v60 * (float)(v52 - v59)) - (float)(v62 * v63);
          v65 = v150;
          float v66 = -v60;
          v67 = v156;
          v68 = (float *)v37;
          v69 = v38;
          uint64_t v70 = v39;
          do
          {
            float v71 = *v65++;
            float v72 = v71 - v51;
            float v73 = *v67++;
            *v68++ = (float)((float)(v62 * (float)(v73 - v52)) - (float)(v72 * v61)) / v64;
            *v69++ = (float)((float)((float)(v73 - v52) * v66) + (float)(v72 * v63)) / v64;
            --v70;
          }
          while (v70);
          uint64_t v48 = *v40;
          uint64_t v49 = v40[1];
          uint64_t v56 = v40[2];
        }
        uint64_t v74 = *((void *)ptr + 3);
        v75 = (float *)(v74 + 8 * v48);
        float v76 = *v75;
        float v182 = *v75;
        float v77 = v75[1];
        float v179 = v77;
        v78 = (float *)(v74 + 8 * v49);
        float v79 = *v78;
        float v183 = *v78;
        float v80 = v78[1];
        float v180 = v80;
        v81 = (float *)(v74 + 8 * v56);
        float v82 = *v81;
        float v184 = *v81;
        float v83 = v81[1];
        float v181 = v83;
        if ((v47 & 1) == 0)
        {
          float v176 = v80 - v77;
          float v177 = v79 - v76;
          float v174 = v83 - v77;
          float v175 = v82 - v76;
          vDSP_vsmsa((const float *)v37, 1, &v177, &v182, v41, 1, __N);
          vDSP_vsma(v38, 1, &v175, v41, 1, v41, 1, v153);
          vDSP_vsmsa((const float *)v37, 1, &v176, &v179, __Da, 1, v153);
          vDSP_vsma(v38, 1, &v174, __Da, 1, __Da, 1, v153);
          char v47 = v151;
          char v46 = v152;
        }
        if ((int)v31 >= 1)
        {
          for (uint64_t i = 0; i < v31; ++i)
          {
            if (!*((unsigned char *)v25 + i))
            {
              float v85 = *((float *)v37 + i);
              if (v85 >= 0.0 && v85 <= 1.0)
              {
                float v87 = v38[i];
                if (v87 >= 0.0 && v87 <= 1.0)
                {
                  float v89 = v85 + v87;
                  if (v89 >= 0.0 && v89 <= 1.0) {
                    *((unsigned char *)v25 + i) = *(unsigned char *)(*((void *)ptr + 6)
                  }
                                                   + (unint64_t)v41[i]
                                                   + *((void *)ptr + 9) * (unint64_t)__Da[i]);
                }
              }
            }
          }
        }
        v40 += 3;
      }
      while (v40 != *((uint64_t **)ptr + 11));
    }
    free(v41);
    free(__Da);
    free(v37);
    free(v38);
    v25 += 16;
    uint64_t v30 = v149 + 1;
    size_t v32 = v145;
  }
  while (v149 != 255);
  free(v150);
  free(v156);
  self = v139;
  a8 = v140;
  v18 = v138;
LABEL_77:
  uint64_t v91 = v143;
LABEL_78:
  v23 = v168;
  id v13 = v142;
  id v15 = v141;
  if (v168) {
LABEL_84:
  }
    operator delete(v23);
LABEL_85:
  if (v91 == 5760)
  {
    v93 = self->mFaceRegionMapAlgorithmImpl.__ptr_;
    v172 = 0;
    uint64_t v173 = 0;
    v171 = (uint64_t **)&v172;
    v96 = *(void **)v93;
    v94 = (void *)((char *)v93 + 8);
    v95 = v96;
    if (v96 != v94)
    {
      do
      {
        v97 = (uint64_t *)v172;
        v98 = (uint64_t **)&v172;
        if (v171 == (uint64_t **)&v172) {
          goto LABEL_93;
        }
        v99 = (uint64_t *)v172;
        v100 = (uint64_t **)&v172;
        if (v172)
        {
          do
          {
            v98 = (uint64_t **)v99;
            v99 = (uint64_t *)v99[1];
          }
          while (v99);
        }
        else
        {
          do
          {
            v98 = (uint64_t **)v100[2];
            BOOL v34 = *v98 == (uint64_t *)v100;
            v100 = v98;
          }
          while (v34);
        }
        unsigned int v101 = *((unsigned __int8 *)v95 + 32);
        if (*((unsigned __int8 *)v98 + 32) < v101)
        {
LABEL_93:
          if (v172) {
            v102 = v98;
          }
          else {
            v102 = (uint64_t **)&v172;
          }
          if (v172) {
            v103 = v98 + 1;
          }
          else {
            v103 = (uint64_t **)&v172;
          }
        }
        else
        {
          v102 = (uint64_t **)&v172;
          v103 = (uint64_t **)&v172;
          if (v172)
          {
            v103 = (uint64_t **)&v172;
            while (1)
            {
              while (1)
              {
                v102 = (uint64_t **)v97;
                unsigned int v107 = *((unsigned __int8 *)v97 + 32);
                if (v101 >= v107) {
                  break;
                }
                v97 = *v102;
                v103 = v102;
                if (!*v102) {
                  goto LABEL_100;
                }
              }
              if (v107 >= v101) {
                break;
              }
              v103 = v102 + 1;
              v97 = v102[1];
              if (!v97) {
                goto LABEL_100;
              }
            }
          }
        }
        if (!*v103)
        {
LABEL_100:
          v104 = (char *)operator new(0x40uLL);
          v104[32] = *((unsigned char *)v95 + 32);
          v105 = (std::string *)(v104 + 40);
          if (*((char *)v95 + 63) < 0)
          {
            std::string::__init_copy_ctor_external(v105, (const std::string::value_type *)v95[5], v95[6]);
          }
          else
          {
            long long v106 = *(_OWORD *)(v95 + 5);
            *((void *)v104 + 7) = v95[7];
            *(_OWORD *)&v105->__r_.__value_.__l.__data_ = v106;
          }
          *(void *)v104 = 0;
          *((void *)v104 + 1) = 0;
          *((void *)v104 + 2) = v102;
          *v103 = (uint64_t *)v104;
          if (*v171)
          {
            v171 = (uint64_t **)*v171;
            v104 = (char *)*v103;
          }
          std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)v172, (uint64_t *)v104);
          ++v173;
        }
        v108 = (void *)v95[1];
        if (v108)
        {
          do
          {
            v109 = v108;
            v108 = (void *)*v108;
          }
          while (v108);
        }
        else
        {
          do
          {
            v109 = (void *)v95[2];
            BOOL v34 = *v109 == (void)v95;
            v95 = v109;
          }
          while (!v34);
        }
        v95 = v109;
      }
      while (v109 != v94);
    }
    id v110 = objc_alloc(MEMORY[0x1E4F1CA60]);
    v111 = (void *)[v110 initWithCapacity:v173];
    v112 = v171;
    if (v171 != (uint64_t **)&v172)
    {
      do
      {
        v113 = v112 + 5;
        if (*((char *)v112 + 63) < 0) {
          v113 = (void *)*v113;
        }
        v114 = [NSString stringWithUTF8String:v113];
        v115 = [NSNumber numberWithUnsignedChar:*((unsigned __int8 *)v112 + 32)];
        [v111 setObject:v114 forKey:v115];

        v116 = v112[1];
        if (v116)
        {
          do
          {
            v117 = (uint64_t **)v116;
            v116 = (uint64_t *)*v116;
          }
          while (v116);
        }
        else
        {
          do
          {
            v117 = (uint64_t **)v112[2];
            BOOL v34 = *v117 == (uint64_t *)v112;
            v112 = v117;
          }
          while (!v34);
        }
        v112 = v117;
      }
      while (v117 != (uint64_t **)&v172);
    }
    v118 = [VNFaceRegionMap alloc];
    uint64_t v119 = [v146 requestRevision];
    [v147 boundingBox];
    double v121 = v120;
    double v123 = v122;
    double v125 = v124;
    double v127 = v126;
    [v147 alignedBoundingBox];
    LODWORD(v129) = v128;
    LODWORD(v131) = v130;
    LODWORD(v133) = v132;
    LODWORD(v135) = v134;
    v136 = -[VNFaceRegionMap initWithRequestRevision:regionMap:deallocateBuffer:userBBox:alignedBBox:valueToLabelMap:](v118, "initWithRequestRevision:regionMap:deallocateBuffer:userBBox:alignedBBox:valueToLabelMap:", v119, v159, 1, v111, v121, v123, v125, v127, v129, v131, v133, v135);
    [v147 setFaceRegionMap:v136];
    v178 = v147;
    v92 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v178 count:1];

    std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::destroy((char *)v172);
    v18 = (float32x2_t *)__p;
    if (__p) {
LABEL_130:
    }
      operator delete(v18);
  }
  else if (a8)
  {
    VNErrorForCVMLStatus((id)v91);
    v92 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
    if (v18) {
      goto LABEL_130;
    }
  }
  else
  {
    v92 = 0;
    if (v18) {
      goto LABEL_130;
    }
  }
LABEL_131:

LABEL_132:
LABEL_133:

  return v92;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  return 1;
}

- (void)dealloc
{
  v3 = VNBinModelFilePathFromModelNameAndThrow(@"faceRegionMap-current");
  v4 = +[VNModelFilesCache sharedInstance];
  [v4 unload:v3];

  v5.receiver = self;
  v5.super_class = (Class)VNFaceRegionMapGenerator;
  [(VNDetector *)&v5 dealloc];
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  v10.receiver = self;
  v10.super_class = (Class)VNFaceRegionMapGenerator;
  if (!-[VNDetector completeInitializationForSession:error:](&v10, sel_completeInitializationForSession_error_, a3)) {
    return 0;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__VNFaceRegionMapGenerator_completeInitializationForSession_error___block_invoke;
  aBlock[3] = &unk_1E5B1F2D0;
  aBlock[4] = self;
  v6 = _Block_copy(aBlock);
  char v7 = VNExecuteBlock(v6, (uint64_t)a4);

  return v7;
}

BOOL __67__VNFaceRegionMapGenerator_completeInitializationForSession_error___block_invoke(uint64_t a1, void *a2)
{
  v4 = VNBinModelFilePathFromModelNameAndThrow(@"faceRegionMap-current");
  objc_super v5 = +[VNModelFilesCache sharedInstance];
  v6 = [v5 load:v4];
  char v7 = v6;
  if (v6)
  {
    double v126 = v5;
    double v127 = v4;
    double v125 = v6;
    v8 = (FILE *)[v6 ptrFile];
    v9 = (char *)operator new(0x80uLL);
    *(_OWORD *)(v9 + 8) = 0u;
    *((void *)v9 + 4) = 0;
    *((void *)v9 + 3) = v9 + 32;
    objc_super v10 = (uint64_t **)(v9 + 24);
    *(void *)v9 = &unk_1EF753508;
    *(_OWORD *)(v9 + 40) = 0u;
    *((void *)v9 + 13) = 0;
    int v130 = (void **)(v9 + 104);
    double v131 = v9 + 48;
    *(_OWORD *)(v9 + 56) = 0u;
    *((_OWORD *)v9 + 7) = 0u;
    memset(v132, 0, sizeof(v132));
    int v133 = 1065353216;
    vision::mod::readBinSerializedModelValues(v8, 0, vision::mod::FaceRegionMap::sModelFileInfo, v132);
    std::string::basic_string[abi:ne180100]<0>(__p, "FaceRegionMap::Width");
    v11 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v132, (unsigned __int8 *)__p);
    uint64_t v124 = a1;
    if (v11 && *((_DWORD *)v11 + 10) == 2)
    {
      id v13 = (float *)*((void *)v11 + 6);
      v12 = (std::__shared_weak_count *)*((void *)v11 + 7);
      if (v12) {
        atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      uint64_t v14 = *((void *)v11 + 8);
      char v15 = 1;
    }
    else
    {
      v12 = 0;
      id v13 = 0;
      uint64_t v14 = 0;
      char v15 = 0;
    }
    if (v135 < 0) {
      operator delete(__p[0]);
    }
    double v129 = v12;
    if ((v15 & 1) == 0)
    {
      exception = __cxa_allocate_exception(8uLL);
      void *exception = 5751;
      __cxa_throw(exception, MEMORY[0x1E4FBA3E0], 0);
    }
    if (v14 != 1)
    {
      v117 = __cxa_allocate_exception(8uLL);
      void *v117 = 5751;
      __cxa_throw(v117, MEMORY[0x1E4FBA3E0], 0);
    }
    std::string::basic_string[abi:ne180100]<0>(__p, "FaceRegionMap::Height");
    float v16 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v132, (unsigned __int8 *)__p);
    if (v16 && *((_DWORD *)v16 + 10) == 2)
    {
      v18 = (float *)*((void *)v16 + 6);
      float v17 = (std::__shared_weak_count *)*((void *)v16 + 7);
      if (v17) {
        atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      int v128 = v17;
      uint64_t v19 = *((void *)v16 + 8);
      char v20 = 1;
    }
    else
    {
      v18 = 0;
      int v128 = 0;
      char v20 = 0;
      uint64_t v19 = 1;
    }
    if (v135 < 0) {
      operator delete(__p[0]);
    }
    if ((v20 & 1) == 0)
    {
      v118 = __cxa_allocate_exception(8uLL);
      void *v118 = 5751;
      __cxa_throw(v118, MEMORY[0x1E4FBA3E0], 0);
    }
    if (v19 != 1)
    {
      uint64_t v119 = __cxa_allocate_exception(8uLL);
      *uint64_t v119 = 5751;
      __cxa_throw(v119, MEMORY[0x1E4FBA3E0], 0);
    }
    std::string::basic_string[abi:ne180100]<0>(__p, "FaceRegionMap::Data");
    v21 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v132, (unsigned __int8 *)__p);
    if (v21 && *((_DWORD *)v21 + 10) == 2)
    {
      uint64_t v22 = *((void *)v21 + 6);
      v23 = (std::__shared_weak_count *)*((void *)v21 + 7);
      if (v23) {
        atomic_fetch_add_explicit(&v23->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      unint64_t v24 = *((void *)v21 + 8);
      char v25 = 1;
    }
    else
    {
      uint64_t v22 = 0;
      v23 = 0;
      char v25 = 0;
      unint64_t v24 = 1;
    }
    if (v135 < 0) {
      operator delete(__p[0]);
    }
    if ((v25 & 1) == 0)
    {
      double v120 = __cxa_allocate_exception(8uLL);
      *double v120 = 5751;
      __cxa_throw(v120, MEMORY[0x1E4FBA3E0], 0);
    }
    float v26 = roundf(*v13);
    float v27 = roundf(*v18);
    if ((float)(v26 * v27) != (float)v24)
    {
      double v121 = __cxa_allocate_exception(8uLL);
      *double v121 = 5751;
      __cxa_throw(v121, MEMORY[0x1E4FBA3E0], 0);
    }
    *((void *)v9 + 10) = (unint64_t)v27;
    *((void *)v9 + 11) = (unint64_t)v26;
    *((void *)v9 + 12) = (unint64_t)v26;
    *((void *)v9 + 9) = malloc_type_malloc((unint64_t)v27 * (unint64_t)v26, 0x503882BFuLL);
    unint64_t v28 = *((void *)v9 + 10);
    if (v28)
    {
      unint64_t v29 = 0;
      unint64_t v30 = *((void *)v9 + 11);
      do
      {
        if (v30)
        {
          for (unint64_t i = 0; i < v30; ++i)
          {
            *(unsigned char *)(*((void *)v9 + 9) + v29 * *((void *)v9 + 12) + i) = llroundf(*(float *)(v22
                                                                                                 + 4 * (i + v29 * v30)));
            unint64_t v30 = *((void *)v9 + 11);
          }
          unint64_t v28 = *((void *)v9 + 10);
        }
        ++v29;
      }
      while (v28 > v29);
    }
    if (v23) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v23);
    }
    std::string::basic_string[abi:ne180100]<0>(__p, "FaceRegionMap::Triangles");
    size_t v32 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v132, (unsigned __int8 *)__p);
    if (v32 && *((_DWORD *)v32 + 10) == 2)
    {
      uint64_t v33 = *((void *)v32 + 6);
      BOOL v34 = (std::__shared_weak_count *)*((void *)v32 + 7);
      if (v34) {
        atomic_fetch_add_explicit(&v34->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      unint64_t v24 = *((void *)v32 + 8);
      char v35 = 1;
    }
    else
    {
      uint64_t v33 = 0;
      BOOL v34 = 0;
      char v35 = 0;
    }
    if (v135 < 0) {
      operator delete(__p[0]);
    }
    if ((v35 & 1) == 0)
    {
      double v122 = __cxa_allocate_exception(8uLL);
      *double v122 = 5751;
      __cxa_throw(v122, MEMORY[0x1E4FBA3E0], 0);
    }
    char v36 = (unint64_t *)*((void *)v9 + 13);
    *((void *)v9 + 14) = v36;
    if (v24)
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        unint64_t v38 = vcvtas_u32_f32(*(float *)(v33 + 4 * j));
        unint64_t v39 = *((void *)v9 + 15);
        if ((unint64_t)v36 >= v39)
        {
          v41 = (unint64_t *)*v130;
          uint64_t v42 = ((char *)v36 - (unsigned char *)*v130) >> 3;
          unint64_t v43 = v42 + 1;
          if ((unint64_t)(v42 + 1) >> 61) {
            std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v44 = v39 - (void)v41;
          if (v44 >> 2 > v43) {
            unint64_t v43 = v44 >> 2;
          }
          if ((unint64_t)v44 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v45 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v45 = v43;
          }
          if (v45)
          {
            unint64_t v45 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v45);
            v41 = (unint64_t *)*((void *)v9 + 13);
            char v36 = (unint64_t *)*((void *)v9 + 14);
          }
          else
          {
            uint64_t v46 = 0;
          }
          char v47 = (unint64_t *)(v45 + 8 * v42);
          *char v47 = v38;
          v40 = v47 + 1;
          while (v36 != v41)
          {
            unint64_t v48 = *--v36;
            *--char v47 = v48;
          }
          *((void *)v9 + 13) = v47;
          *((void *)v9 + 14) = v40;
          *((void *)v9 + 15) = v45 + 8 * v46;
          if (v41) {
            operator delete(v41);
          }
        }
        else
        {
          *char v36 = v38;
          v40 = v36 + 1;
        }
        *((void *)v9 + 14) = v40;
        char v36 = v40;
      }
    }
    if (v34) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v34);
    }
    std::string::basic_string[abi:ne180100]<0>(__p, "FaceRegionMap::NormalizedLandmarks");
    uint64_t v49 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v132, (unsigned __int8 *)__p);
    if (v49 && *((_DWORD *)v49 + 10) == 2)
    {
      uint64_t v50 = *((void *)v49 + 6);
      float v51 = (std::__shared_weak_count *)*((void *)v49 + 7);
      if (v51) {
        atomic_fetch_add_explicit(&v51->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      unint64_t v24 = *((void *)v49 + 8);
      char v52 = 1;
    }
    else
    {
      uint64_t v50 = 0;
      float v51 = 0;
      char v52 = 0;
    }
    if (v135 < 0) {
      operator delete(__p[0]);
    }
    if ((v52 & 1) == 0)
    {
      double v123 = __cxa_allocate_exception(8uLL);
      *double v123 = 5751;
      __cxa_throw(v123, MEMORY[0x1E4FBA3E0], 0);
    }
    v53 = (_DWORD *)*((void *)v9 + 6);
    *((void *)v9 + 7) = v53;
    if (v24)
    {
      for (unint64_t k = 0; k < v24; k += 2)
      {
        int v55 = *(_DWORD *)(v50 + 4 * k);
        int v56 = *(_DWORD *)(v50 + ((4 * k) | 4));
        unint64_t v57 = *((void *)v9 + 8);
        if ((unint64_t)v53 >= v57)
        {
          float v58 = (_DWORD *)*v131;
          uint64_t v59 = ((uint64_t)v53 - *v131) >> 3;
          unint64_t v60 = v59 + 1;
          if ((unint64_t)(v59 + 1) >> 61) {
            std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v61 = v57 - (void)v58;
          if (v61 >> 2 > v60) {
            unint64_t v60 = v61 >> 2;
          }
          if ((unint64_t)v61 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v62 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v62 = v60;
          }
          if (v62)
          {
            unint64_t v62 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v62);
            float v58 = (_DWORD *)*((void *)v9 + 6);
            v53 = (_DWORD *)*((void *)v9 + 7);
          }
          else
          {
            uint64_t v63 = 0;
          }
          float v64 = (_DWORD *)(v62 + 8 * v59);
          *float v64 = v55;
          v64[1] = v56;
          v65 = v64;
          if (v53 != v58)
          {
            do
            {
              uint64_t v66 = *((void *)v53 - 1);
              v53 -= 2;
              *((void *)v65 - 1) = v66;
              v65 -= 2;
            }
            while (v53 != v58);
            float v58 = (_DWORD *)*v131;
          }
          v53 = v64 + 2;
          *((void *)v9 + 6) = v65;
          *((void *)v9 + 7) = v64 + 2;
          *((void *)v9 + 8) = v62 + 8 * v63;
          if (v58) {
            operator delete(v58);
          }
        }
        else
        {
          _DWORD *v53 = v55;
          v53[1] = v56;
          v53 += 2;
        }
        *((void *)v9 + 7) = v53;
      }
    }
    FaceRegionMap_addForeheadLandmarks((uint64_t)v131);
    if (v51) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v51);
    }
    LOBYTE(__p[0]) = 0;
    v67 = std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char &&>,std::tuple<>>(v10, 0, __p);
    objc_super v5 = v126;
    v4 = v127;
    char v7 = v125;
    if (*((char *)v67 + 63) < 0)
    {
      v67[6] = (uint64_t *)10;
      v68 = (char *)v67[5];
    }
    else
    {
      v68 = (char *)(v67 + 5);
      *((unsigned char *)v67 + 63) = 10;
    }
    strcpy(v68, "Background");
    LOBYTE(__p[0]) = 10;
    v69 = std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char &&>,std::tuple<>>(v10, 0xAu, __p);
    if (*((char *)v69 + 63) < 0)
    {
      v69[6] = (uint64_t *)8;
      uint64_t v70 = (char *)v69[5];
    }
    else
    {
      uint64_t v70 = (char *)(v69 + 5);
      *((unsigned char *)v69 + 63) = 8;
    }
    strcpy(v70, "Left eye");
    LOBYTE(__p[0]) = 20;
    float v71 = std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char &&>,std::tuple<>>(v10, 0x14u, __p);
    if (*((char *)v71 + 63) < 0)
    {
      v71[6] = (uint64_t *)9;
      float v72 = (char *)v71[5];
    }
    else
    {
      float v72 = (char *)(v71 + 5);
      *((unsigned char *)v71 + 63) = 9;
    }
    strcpy(v72, "Right eye");
    LOBYTE(__p[0]) = 30;
    float v73 = std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char &&>,std::tuple<>>(v10, 0x1Eu, __p);
    if (*((char *)v73 + 63) < 0)
    {
      v73[6] = (uint64_t *)12;
      uint64_t v74 = (char *)v73[5];
    }
    else
    {
      uint64_t v74 = (char *)(v73 + 5);
      *((unsigned char *)v73 + 63) = 12;
    }
    strcpy(v74, "Left eyebrow");
    LOBYTE(__p[0]) = 40;
    v75 = std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char &&>,std::tuple<>>(v10, 0x28u, __p);
    if (*((char *)v75 + 63) < 0)
    {
      v75[6] = (uint64_t *)13;
      float v76 = (char *)v75[5];
    }
    else
    {
      float v76 = (char *)(v75 + 5);
      *((unsigned char *)v75 + 63) = 13;
    }
    strcpy(v76, "Right eyebrow");
    LOBYTE(__p[0]) = 50;
    float v77 = std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char &&>,std::tuple<>>(v10, 0x32u, __p);
    if (*((char *)v77 + 63) < 0)
    {
      v77[6] = (uint64_t *)12;
      v78 = (char *)v77[5];
    }
    else
    {
      v78 = (char *)(v77 + 5);
      *((unsigned char *)v77 + 63) = 12;
    }
    strcpy(v78, "Root of nose");
    LOBYTE(__p[0]) = 60;
    float v79 = std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char &&>,std::tuple<>>(v10, 0x3Cu, __p);
    if (*((char *)v79 + 63) < 0)
    {
      v79[6] = (uint64_t *)4;
      float v80 = (char *)v79[5];
    }
    else
    {
      float v80 = (char *)(v79 + 5);
      *((unsigned char *)v79 + 63) = 4;
    }
    strcpy(v80, "Nose");
    LOBYTE(__p[0]) = 70;
    v81 = std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char &&>,std::tuple<>>(v10, 0x46u, __p);
    if (*((char *)v81 + 63) < 0)
    {
      v81[6] = (uint64_t *)4;
      float v82 = (char *)v81[5];
    }
    else
    {
      float v82 = (char *)(v81 + 5);
      *((unsigned char *)v81 + 63) = 4;
    }
    strcpy(v82, "Chin");
    LOBYTE(__p[0]) = 80;
    float v83 = std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char &&>,std::tuple<>>(v10, 0x50u, __p);
    if (*((char *)v83 + 63) < 0)
    {
      v83[6] = (uint64_t *)16;
      v84 = (char *)v83[5];
    }
    else
    {
      v84 = (char *)(v83 + 5);
      *((unsigned char *)v83 + 63) = 16;
    }
    strcpy(v84, "Lower left cheek");
    LOBYTE(__p[0]) = 90;
    float v85 = std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char &&>,std::tuple<>>(v10, 0x5Au, __p);
    if (*((char *)v85 + 63) < 0)
    {
      v85[6] = (uint64_t *)17;
      v86 = (char *)v85[5];
    }
    else
    {
      v86 = (char *)(v85 + 5);
      *((unsigned char *)v85 + 63) = 17;
    }
    strcpy(v86, "Lower right cheek");
    LOBYTE(__p[0]) = 100;
    float v87 = std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char &&>,std::tuple<>>(v10, 0x64u, __p);
    if (*((char *)v87 + 63) < 0)
    {
      v87[6] = (uint64_t *)22;
      v88 = (char *)v87[5];
    }
    else
    {
      v88 = (char *)(v87 + 5);
      *((unsigned char *)v87 + 63) = 22;
    }
    strcpy(v88, "Between mouth and nose");
    LOBYTE(__p[0]) = 110;
    float v89 = std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char &&>,std::tuple<>>(v10, 0x6Eu, __p);
    if (*((char *)v89 + 63) < 0)
    {
      v89[6] = (uint64_t *)10;
      v90 = (char *)v89[5];
    }
    else
    {
      v90 = (char *)(v89 + 5);
      *((unsigned char *)v89 + 63) = 10;
    }
    strcpy(v90, "Left cheek");
    LOBYTE(__p[0]) = 120;
    uint64_t v91 = std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char &&>,std::tuple<>>(v10, 0x78u, __p);
    if (*((char *)v91 + 63) < 0)
    {
      v91[6] = (uint64_t *)11;
      v92 = (char *)v91[5];
    }
    else
    {
      v92 = (char *)(v91 + 5);
      *((unsigned char *)v91 + 63) = 11;
    }
    strcpy(v92, "Right cheek");
    LOBYTE(__p[0]) = -126;
    v93 = std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char &&>,std::tuple<>>(v10, 0x82u, __p);
    if (*((char *)v93 + 63) < 0)
    {
      v93[6] = (uint64_t *)11;
      v94 = (char *)v93[5];
    }
    else
    {
      v94 = (char *)(v93 + 5);
      *((unsigned char *)v93 + 63) = 11;
    }
    strcpy(v94, "Left temple");
    LOBYTE(__p[0]) = -116;
    v95 = std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char &&>,std::tuple<>>(v10, 0x8Cu, __p);
    if (*((char *)v95 + 63) < 0)
    {
      v95[6] = (uint64_t *)12;
      v96 = (char *)v95[5];
    }
    else
    {
      v96 = (char *)(v95 + 5);
      *((unsigned char *)v95 + 63) = 12;
    }
    strcpy(v96, "Right temple");
    LOBYTE(__p[0]) = -106;
    v97 = std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char &&>,std::tuple<>>(v10, 0x96u, __p);
    if (*((char *)v97 + 63) < 0)
    {
      v97[6] = (uint64_t *)16;
      v98 = (char *)v97[5];
    }
    else
    {
      v98 = (char *)(v97 + 5);
      *((unsigned char *)v97 + 63) = 16;
    }
    strcpy(v98, "Between eyebrows");
    LOBYTE(__p[0]) = -96;
    v99 = std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char &&>,std::tuple<>>(v10, 0xA0u, __p);
    if (*((char *)v99 + 63) < 0)
    {
      v99[6] = (uint64_t *)14;
      v100 = (char *)v99[5];
    }
    else
    {
      v100 = (char *)(v99 + 5);
      *((unsigned char *)v99 + 63) = 14;
    }
    strcpy(v100, "Above left eye");
    LOBYTE(__p[0]) = -86;
    unsigned int v101 = std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char &&>,std::tuple<>>(v10, 0xAAu, __p);
    if (*((char *)v101 + 63) < 0)
    {
      v101[6] = (uint64_t *)15;
      v102 = (char *)v101[5];
    }
    else
    {
      v102 = (char *)(v101 + 5);
      *((unsigned char *)v101 + 63) = 15;
    }
    strcpy(v102, "Above right eye");
    LOBYTE(__p[0]) = -76;
    v103 = std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char &&>,std::tuple<>>(v10, 0xB4u, __p);
    if (*((char *)v103 + 63) < 0)
    {
      v103[6] = (uint64_t *)9;
      v104 = (char *)v103[5];
    }
    else
    {
      v104 = (char *)(v103 + 5);
      *((unsigned char *)v103 + 63) = 9;
    }
    strcpy(v104, "Upper lip");
    LOBYTE(__p[0]) = -66;
    v105 = std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char &&>,std::tuple<>>(v10, 0xBEu, __p);
    if (*((char *)v105 + 63) < 0)
    {
      v105[6] = (uint64_t *)9;
      long long v106 = (char *)v105[5];
    }
    else
    {
      long long v106 = (char *)(v105 + 5);
      *((unsigned char *)v105 + 63) = 9;
    }
    strcpy(v106, "Lower lip");
    LOBYTE(__p[0]) = -56;
    unsigned int v107 = std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char &&>,std::tuple<>>(v10, 0xC8u, __p);
    if (*((char *)v107 + 63) < 0)
    {
      v107[6] = (uint64_t *)12;
      v108 = (char *)v107[5];
    }
    else
    {
      v108 = (char *)(v107 + 5);
      *((unsigned char *)v107 + 63) = 12;
    }
    strcpy(v108, "Between lips");
    LOBYTE(__p[0]) = -46;
    v109 = std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char &&>,std::tuple<>>(v10, 0xD2u, __p);
    if (*((char *)v109 + 63) < 0)
    {
      v109[6] = (uint64_t *)8;
      id v110 = (char *)v109[5];
    }
    else
    {
      id v110 = (char *)(v109 + 5);
      *((unsigned char *)v109 + 63) = 8;
    }
    strcpy(v110, "Forehead");
    LOBYTE(__p[0]) = -36;
    v111 = std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char &&>,std::tuple<>>(v10, 0xDCu, __p);
    if (*((char *)v111 + 63) < 0)
    {
      v111[6] = (uint64_t *)11;
      v112 = (char *)v111[5];
    }
    else
    {
      v112 = (char *)(v111 + 5);
      *((unsigned char *)v111 + 63) = 11;
    }
    strcpy(v112, "Tip of nose");
    if (v128) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v128);
    }
    if (v129) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v129);
    }
    std::__hash_table<std::__hash_value_type<std::string,vision::mod::ModelValues::ValueInfo>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,vision::mod::ModelValues::ValueInfo>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,vision::mod::ModelValues::ValueInfo>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,vision::mod::ModelValues::ValueInfo>>>::~__hash_table((uint64_t)v132);
    *(void *)&long long v113 = v9 + 24;
    *((void *)&v113 + 1) = v9;
    v114 = *(std::__shared_weak_count **)(*(void *)(v124 + 32) + 64);
    *(_OWORD *)(*(void *)(v124 + 32) + 56) = v113;
    if (v114) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v114);
    }
  }
  else if (a2)
  {
    *a2 = +[VNError errorWithCode:9 message:@"Could not read face region map model data"];
  }

  return v7 != 0;
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  char v7 = @"VNComputeStageMain";
  v4 = +[VNComputeDeviceUtilities allCPUComputeDevices];
  v8[0] = v4;
  objc_super v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

@end