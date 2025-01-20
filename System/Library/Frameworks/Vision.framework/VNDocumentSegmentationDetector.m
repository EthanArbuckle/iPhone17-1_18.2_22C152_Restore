@interface VNDocumentSegmentationDetector
+ (BOOL)providesSegmentationLabelsForConfiguration:(id)a3;
+ (id)inputImageBlobNameForConfiguration:(id)a3;
+ (id)modelPathForConfiguration:(id)a3 error:(id *)a4;
+ (id)segmentationLabelsFilePathForConfiguration:(id)a3 error:(id *)a4;
+ (unsigned)analysisPixelFormatTypeForConfiguration:(id)a3;
- (BOOL)configureImageAnalyzerOptions:(void *)a3 error:(id *)a4;
- (id)observationsForLastAnalysisOfImageAnalyzer:(void *)a3 processOptions:(id)a4 originatingRequestSpecifier:(id)a5 qosClass:(unsigned int)a6 error:(id *)a7;
- (unsigned)analysisTypesForProcessOptions:(id)a3;
@end

@implementation VNDocumentSegmentationDetector

- (id)observationsForLastAnalysisOfImageAnalyzer:(void *)a3 processOptions:(id)a4 originatingRequestSpecifier:(id)a5 qosClass:(unsigned int)a6 error:(id *)a7
{
  v349[1] = *MEMORY[0x1E4F143B8];
  id v245 = a5;
  if (!self) {
    goto LABEL_337;
  }
  texture.i32[0] = 2048;
  if (!*((unsigned char *)std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,BOOL>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,BOOL>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,BOOL>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,BOOL>>>::__emplace_unique_key_args<vision::mod::ImageAnalyzer_AnalysisType,std::piecewise_construct_t const&,std::tuple<vision::mod::ImageAnalyzer_AnalysisType&&>,std::tuple<>>((uint64_t)a3 + 824, 0x800u, &texture)+ 20))
  {
    exceptioint n = __cxa_allocate_exception(8uLL);
    *exceptioint n = 8574;
    __cxa_throw(exception, MEMORY[0x1E4FBA3E0], 0);
  }
  texture.i32[0] = 2048;
  v9 = std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>>>::__emplace_unique_key_args<vision::mod::ImageAnalyzer_AnalysisType,std::piecewise_construct_t const&,std::tuple<vision::mod::ImageAnalyzer_AnalysisType&&>,std::tuple<>>((uint64_t)a3 + 784, 0x800u, &texture);
  vision::mod::ImageAnalyzer_Tensor1D<float>::ImageAnalyzer_Tensor1D((uint64_t)&__src, (long long *)(v9 + 24), 1);
  vision::mod::ImageAnalyzer_Tensor1D<float>::getVectorFromTensor(__p, (unint64_t *)&__src);
  float v10 = *(float *)__p[0];
  vision::mod::ImageAnalyzer::getSceneSegmentation((vision::mod::ImageAnalyzer *)&texture, (uint64_t)a3);
  float v11 = (float)v326;
  float v12 = (float)v325;
  v320[0] = (float)v326;
  v320[1] = (float)v325;
  int v319 = 0;
  vision::mod::ImageAnalyzer_Tensor3D::getVImageBufferFromTensorChannel(&v317, (uint64_t)&texture, 0, v320, &v319);
  vision::mod::ImageAnalyzer_Tensor3D::getVImageBufferFromTensorChannel(&v315, (uint64_t)&texture, 1uLL, v320, &v319);
  vision::mod::ImageAnalyzer_Tensor3D::getVImageBufferFromTensorChannel(&v313, (uint64_t)&texture, 2uLL, v320, &v319);
  vision::mod::ImageAnalyzer_Tensor3D::getVImageBufferFromTensorChannel(&v311, (uint64_t)&texture, 3uLL, v320, &v319);
  vision::mod::ImageAnalyzer::getSceneSaliency((vision::mod::ImageAnalyzer *)baseAddress, (uint64_t)a3);
  int v300 = 0;
  vision::mod::ImageAnalyzer_Tensor2D::getVImageBufferFromTensor((uint64_t)v297, (int8x16_t *)baseAddress, &v300);
  v14 = (char *)v297[0];
  int v13 = (int)v297[1];
  uint64_t v15 = *((void *)&v298 + 1);
  int v16 = v298;
  uint64_t v17 = (v298 - 1);
  unint64_t v18 = (int)v17;
  *(_OWORD *)v297 = 0u;
  long long v298 = 0u;
  int v299 = 1065353216;
  long long v346 = 0u;
  long long v347 = 0u;
  int v348 = 1065353216;
  int v345 = 1;
  int v19 = v13 - 1;
  unint64_t v20 = v13 - 1;
  v251 = a3;
  if (v13 < 1) {
    goto LABEL_12;
  }
  uint64_t v21 = 0;
  int v22 = 0;
  uint64_t v23 = v13;
  v24 = v14;
  do
  {
    if (v16 >= 1)
    {
      for (uint64_t i = 0; i < v16; i += 4)
      {
        if (*(float *)&v24[4 * i] >= 0.5) {
          ++v22;
        }
      }
    }
    v21 += 4;
    v24 += 4 * v15;
  }
  while (v21 < v13);
  if (v22 >= 10)
  {
    if ((float)((float)(16 * v22) / (float)(v16 * v13)) >= 0.91)
    {
      unint64_t v26 = 0;
      uint64_t v27 = 0;
    }
    else
    {
      int v243 = v17;
      int v244 = v13 - 1;
      int v241 = v13;
      int v242 = v13 - 1;
      unint64_t v247 = (int)v17;
      uint64_t v249 = v19;
      signed int v93 = vcvtps_s32_f32((float)v16 * 0.25);
      signed int v240 = vcvtps_s32_f32((float)v13 * 0.25);
      __x[0] = 0;
      std::vector<int>::vector(&v343, v240 * v93, __x);
      uint64_t v268 = 0;
      uint64_t v94 = 0;
      signed int v261 = v93;
      uint64_t v262 = v93;
      uint64_t v259 = v318;
      uint64_t v260 = v317;
      uint64_t v257 = v316;
      uint64_t v258 = v315;
      int v269 = v93 - 1;
      unint64_t ptrb = (unint64_t)(v16 - 1) >> 2;
      uint64_t v255 = v314;
      uint64_t v256 = v313;
      unint64_t v263 = (unint64_t)(v23 - 1) >> 2;
      uint64_t v264 = v15;
      int v95 = 1;
      uint64_t v253 = v312;
      uint64_t v254 = v311;
      v265 = v14;
      int v266 = v16;
      do
      {
        uint64_t v267 = v94;
        if (v16 >= 1)
        {
          uint64_t v96 = 0;
          uint64_t v97 = 0;
          int v98 = v94;
          v99 = &v14[v15 * v94];
          uint64_t v275 = v258 + v257 * v94;
          uint64_t v278 = v260 + v259 * v94;
          uint64_t v272 = v254 + v253 * v94;
          uint64_t v273 = v256 + v255 * v94;
          uint64_t v270 = v268 * v262;
          if ((int)v94 <= 1) {
            int v100 = 1;
          }
          else {
            int v100 = v94;
          }
          uint64_t v101 = (v100 - 1);
          if ((int)v268 <= 1) {
            int v102 = 1;
          }
          else {
            int v102 = v268;
          }
          v103 = &v14[v15 * v101];
          int v281 = (v102 - 1) * v261;
          v271 = &v14[v15 * v98];
          do
          {
            if (*(float *)&v99[4 * v96] >= 0.5)
            {
              float v104 = *(float *)(v278 + 4 * v96);
              float v105 = *(float *)(v275 + 4 * v96);
              float v106 = *(float *)(v273 + 4 * v96);
              float v107 = *(float *)(v272 + 4 * v96);
              long long v341 = 0u;
              *(_OWORD *)__x = 0u;
              int v342 = 1065353216;
              uint64_t v108 = v17;
              if ((int)(v96 | 1) >= (int)v17) {
                int v109 = v17;
              }
              else {
                int v109 = v96 | 1;
              }
              if ((int)v97 <= 1) {
                int v110 = 1;
              }
              else {
                int v110 = v97;
              }
              int v111 = v110 - 1;
              if ((int)v97 + 1 < v269) {
                int v112 = v97 + 1;
              }
              else {
                int v112 = v269;
              }
              if ((int)v96 <= 1) {
                int v113 = 1;
              }
              else {
                int v113 = v96;
              }
              uint64_t v114 = (v113 - 1);
              if (*(float *)&v103[4 * v114] >= 0.5)
              {
                int v115 = v343.__begin_[v281 + v111];
                std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>((float *)__x, v115, v115);
              }
              if (*(float *)&v103[4 * (int)v96] >= 0.5)
              {
                int v116 = v343.__begin_[v281 + (int)v97];
                std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>((float *)__x, v116, v116);
              }
              if (*(float *)&v103[4 * v109] >= 0.5)
              {
                int v117 = v343.__begin_[v112 + v281];
                std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>((float *)__x, v117, v117);
              }
              if (*(float *)&v271[4 * v114] >= 0.5)
              {
                int v118 = v343.__begin_[v261 * (int)v268 + v111];
                std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>((float *)__x, v118, v118);
              }
              float v119 = (float)((float)(v104 + v105) + v106) + v107;
              long long v338 = 0u;
              long long v337 = 0u;
              int v339 = 1065353216;
              v120 = (uint64_t *)v341;
              uint64_t v17 = v108;
              if (!(void)v341) {
                goto LABEL_122;
              }
              do
              {
                int v121 = *((_DWORD *)v120 + 4);
                if (v121 >= 1) {
                  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>((float *)&v337, v121, *((_DWORD *)v120 + 4));
                }
                v120 = (uint64_t *)*v120;
              }
              while (v120);
              if (*((void *)&v338 + 1))
              {
                v122 = (uint64_t *)v338;
                v123 = *(uint64_t **)v338;
                if (*(void *)v338)
                {
                  do
                  {
                    if (*((_DWORD *)v123 + 4) < *((_DWORD *)v122 + 4)) {
                      v122 = v123;
                    }
                    v123 = (uint64_t *)*v123;
                  }
                  while (v123);
                }
                int v124 = *((_DWORD *)v122 + 4);
                LODWORD(v334[0]) = v124;
                v343.__begin_[v97 + v270] = v124;
                v125 = std::__hash_table<std::__hash_value_type<int,std::pair<int,float>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::pair<int,float>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::pair<int,float>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::pair<int,float>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((float *)&v346, v124, v334);
                ++*((_DWORD *)v125 + 5);
                v126 = (float *)std::__hash_table<std::__hash_value_type<int,std::pair<int,float>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::pair<int,float>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::pair<int,float>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::pair<int,float>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((float *)&v346, v124, v334);
                v126[6] = v119 + v126[6];
                for (j = (uint64_t *)v338; j; j = (uint64_t *)*j)
                {
                  int v336 = *((_DWORD *)j + 4);
                  int v128 = v336;
                  if (v128 != *((_DWORD *)std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((float *)v297, v124, v334)+ 5))*((_DWORD *)std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((float *)v297, v128, &v336)+ 5) = v124; {
                }
                  }
              }
              else
              {
LABEL_122:
                *((_DWORD *)std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((float *)v297, v95, &v345)+ 5) = v95;
                v343.__begin_[v97 + v270] = v95;
                *((_DWORD *)std::__hash_table<std::__hash_value_type<int,std::pair<int,float>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::pair<int,float>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::pair<int,float>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::pair<int,float>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((float *)&v346, v95, &v345)+ 5) = 1;
                *((float *)std::__hash_table<std::__hash_value_type<int,std::pair<int,float>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::pair<int,float>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::pair<int,float>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::pair<int,float>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((float *)&v346, v95++, &v345)+ 6) = v119;
                int v345 = v95;
              }
              std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&v337);
              std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)__x);
            }
            v96 += 4;
            BOOL v129 = v97++ == ptrb;
          }
          while (!v129);
        }
        uint64_t v94 = v267 + 4;
        uint64_t v15 = v264;
        BOOL v129 = v268++ == v263;
        v14 = v265;
        int v16 = v266;
      }
      while (!v129);
      if (*((void *)&v298 + 1))
      {
        long long v341 = 0u;
        *(_OWORD *)__x = 0u;
        int v342 = 1065353216;
        long long v338 = 0u;
        long long v337 = 0u;
        int v339 = 1065353216;
        memset(v334, 0, sizeof(v334));
        int v335 = 1065353216;
        v130 = (uint64_t *)v298;
        int v19 = v242;
        if ((void)v298)
        {
          do
          {
            int v132 = *((_DWORD *)v130 + 4);
            v131 = (int *)(v130 + 2);
            if (v132 == *((_DWORD *)v130 + 5))
            {
              *((_DWORD *)std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((float *)__x, *((_DWORD *)v130 + 4), (_DWORD *)v130 + 4)+ 5) = v132;
              int v133 = *((_DWORD *)std::__hash_table<std::__hash_value_type<int,std::pair<int,float>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::pair<int,float>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::pair<int,float>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::pair<int,float>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((float *)&v346, *v131, (_DWORD *)v130 + 4)+ 5);
              *((float *)std::__hash_table<std::__hash_value_type<int,float>,std::__unordered_map_hasher<int,std::__hash_value_type<int,float>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,float>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,float>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((float *)&v337, *v131, (_DWORD *)v130 + 4)+ 5) = (float)v133;
              v134 = std::__hash_table<std::__hash_value_type<int,std::unordered_set<int>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::unordered_set<int>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::unordered_set<int>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::unordered_set<int>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t)v334, *v131, (_DWORD *)v130 + 4);
              std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>((float *)v134 + 6, *v131, *v131);
            }
            v130 = (uint64_t *)*v130;
          }
          while (v130);
          for (k = (uint64_t *)v298; k; k = (uint64_t *)*k)
          {
            int v136 = *((_DWORD *)k + 4);
            int v336 = v136;
            if (*(void *)&__x[2])
            {
              uint8x8_t v137 = (uint8x8_t)vcnt_s8(*(int8x8_t *)&__x[2]);
              v137.i16[0] = vaddlv_u8(v137);
              if (v137.u32[0] > 1uLL)
              {
                unint64_t v138 = v136;
                if (*(void *)&__x[2] <= (unint64_t)v136) {
                  unint64_t v138 = (unint64_t)v136 % *(void *)&__x[2];
                }
              }
              else
              {
                unint64_t v138 = (*(void *)&__x[2] - 1) & v136;
              }
              v139 = *(uint64_t ***)(*(void *)__x + 8 * v138);
              if (v139)
              {
                for (m = *v139; m; m = (uint64_t *)*m)
                {
                  unint64_t v141 = m[1];
                  if (v141 == v136)
                  {
                    if (*((_DWORD *)m + 4) == v136) {
                      goto LABEL_153;
                    }
                  }
                  else
                  {
                    if (v137.u32[0] > 1uLL)
                    {
                      if (v141 >= *(void *)&__x[2]) {
                        v141 %= *(void *)&__x[2];
                      }
                    }
                    else
                    {
                      v141 &= *(void *)&__x[2] - 1;
                    }
                    if (v141 != v138) {
                      break;
                    }
                  }
                }
              }
            }
            v142 = v297[0];
            v143 = v297[1];
            int v144 = *((_DWORD *)std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::find<int>((uint64_t)v297[0], (unint64_t)v297[1], v136)+ 5);
            for (int n = v136;
                  v144 != n;
                  int v144 = *((_DWORD *)std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::find<int>((uint64_t)v142, (unint64_t)v143, v144)+ 5))
            {
              int n = v144;
            }
            int v333 = n;
            *((_DWORD *)std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((float *)__x, v136, &v336)+ 5) = n;
            int v146 = *((_DWORD *)std::__hash_table<std::__hash_value_type<int,std::pair<int,float>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::pair<int,float>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::pair<int,float>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::pair<int,float>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((float *)&v346, v136, &v336)+ 5);
            v147 = (float *)std::__hash_table<std::__hash_value_type<int,float>,std::__unordered_map_hasher<int,std::__hash_value_type<int,float>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,float>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,float>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((float *)&v337, n, &v333);
            v147[5] = v147[5] + (float)v146;
            v148 = std::__hash_table<std::__hash_value_type<int,std::unordered_set<int>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::unordered_set<int>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::unordered_set<int>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::unordered_set<int>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t)v334, n, &v333);
            std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>((float *)v148 + 6, v136, v136);
LABEL_153:
            ;
          }
        }
        v149 = (float *)v338;
        v150 = *(float **)v338;
        if (*(void *)v338)
        {
          int v151 = v241;
          do
          {
            if (v149[5] < v150[5]) {
              v149 = v150;
            }
            v150 = *(float **)v150;
          }
          while (v150);
        }
        else
        {
          int v151 = v241;
        }
        int v336 = *((_DWORD *)v149 + 4);
        unsigned int v176 = 0;
        int v177 = 0;
        v178 = std::__hash_table<std::__hash_value_type<int,std::unordered_set<int>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::unordered_set<int>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::unordered_set<int>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::unordered_set<int>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t)v334, v336, &v336)+ 3;
        begiint n = v343.__begin_;
        uint64_t v180 = 4 * v262;
        std::vector<int>::pointer ptrc = v343.__begin_;
        while (v266 < 1)
        {
LABEL_220:
          v177 += 4;
          ++v176;
          begiint n = (std::vector<int>::pointer)((char *)begin + v180);
          if (v177 >= v151)
          {
            unsigned int v176 = 0;
            uint64_t v183 = v249;
            goto LABEL_223;
          }
        }
        uint64_t v181 = 0;
        while (1)
        {
          int v182 = begin[v181];
          if (v182 >= 1)
          {
            if (std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::find<int>(v178, v182)) {
              break;
            }
          }
          if ((int)(++v181 * 4) >= v266) {
            goto LABEL_220;
          }
        }
        uint64_t v183 = v177;
LABEL_223:
        uint64_t v282 = v183;
        signed int v184 = v240;
        v185 = &ptrc[(v240 - 1) * v262];
        while (1)
        {
          --v184;
          if (v266 >= 1) {
            break;
          }
LABEL_229:
          v185 -= v262;
          BOOL v57 = v244 <= 3;
          v244 -= 4;
          if (v57)
          {
            unint64_t v250 = 0;
            signed int v184 = 0;
            goto LABEL_233;
          }
        }
        uint64_t v186 = 0;
        while (1)
        {
          int v187 = v185[v186];
          if (v187 >= 1)
          {
            if (std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::find<int>(v178, v187)) {
              break;
            }
          }
          if ((int)(++v186 * 4) >= v266) {
            goto LABEL_229;
          }
        }
        unint64_t v250 = v244;
LABEL_233:
        if (v266 < 1)
        {
          unint64_t v195 = 0;
        }
        else
        {
          int v279 = v17;
          int v188 = 0;
          uint64_t v276 = (v184 + 1);
          v189 = &ptrc[v262 * v176];
          while ((int)v176 > v184)
          {
LABEL_240:
            v188 += 4;
            ++v189;
            if (v188 >= v266) {
              goto LABEL_243;
            }
          }
          v190 = v189;
          uint64_t v191 = v276 - v176;
          while (*v190 < 1
               || !std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::find<int>(v178, *v190))
          {
            v190 = (int *)((char *)v190 + v180);
            if (!--v191) {
              goto LABEL_240;
            }
          }
          unint64_t v247 = v188;
LABEL_243:
          uint64_t v192 = (uint64_t)&ptrc[v262 - 1 + v262 * v176];
          int v19 = v242;
          while ((int)v176 > v184)
          {
LABEL_249:
            v192 -= 4;
            BOOL v57 = v243 <= 3;
            v243 -= 4;
            if (v57)
            {
              unint64_t v195 = 0;
              goto LABEL_253;
            }
          }
          v193 = (int *)v192;
          uint64_t v194 = v276 - v176;
          while (*v193 < 1
               || !std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::find<int>(v178, *v193))
          {
            v193 = (int *)((char *)v193 + v180);
            if (!--v194) {
              goto LABEL_249;
            }
          }
          unint64_t v195 = v243;
LABEL_253:
          LODWORD(v17) = v279;
        }
        std::__hash_table<std::__hash_value_type<int,std::unordered_set<int>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::unordered_set<int>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::unordered_set<int>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::unordered_set<int>>>>::~__hash_table((uint64_t)v334);
        std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&v337);
        std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)__x);
        unint64_t v26 = v247;
        unint64_t v20 = v250;
        unint64_t v18 = v195;
        uint64_t v27 = v282;
      }
      else
      {
        unint64_t v26 = v247;
        uint64_t v27 = v249;
        unint64_t v18 = 0;
        unint64_t v20 = 0;
        int v19 = v242;
      }
      if (v343.__begin_)
      {
        v343.__end_ = v343.__begin_;
        operator delete(v343.__begin_);
      }
    }
  }
  else
  {
LABEL_12:
    unint64_t v26 = (int)v17;
    uint64_t v27 = v19;
    unint64_t v18 = 0;
    unint64_t v20 = 0;
  }
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&v346);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)v297);
  unint64_t v246 = v18;
  unint64_t v248 = v20;
  unint64_t ptr = v26;
  if (!(v18 | v20)) {
    goto LABEL_25;
  }
  if ((int)v26 <= 14) {
    int v28 = 14;
  }
  else {
    int v28 = v26;
  }
  int v29 = v18 + 14;
  if ((int)v18 + 14 >= (int)v17) {
    int v29 = v17;
  }
  if ((int)v27 <= 14) {
    int v30 = 14;
  }
  else {
    int v30 = v27;
  }
  unint64_t v31 = (v30 - 14);
  int v32 = v20 + 14;
  if ((int)v20 + 14 >= v19) {
    int v32 = v19;
  }
  if (v31 > v32)
  {
LABEL_25:
    uint64_t v33 = 0;
    uint64_t v34 = 0;
LABEL_26:
    uint64_t v35 = 0;
    uint64_t v36 = 0;
LABEL_27:
    uint64_t v37 = 0;
    uint64_t v38 = 0;
LABEL_28:
    uint64_t v39 = 0;
    uint64_t v40 = 0;
    goto LABEL_29;
  }
  uint64_t v33 = 0;
  uint64_t v34 = 0;
  unint64_t v152 = (v28 - 14);
  uint64_t v153 = v317 + v318 * v31;
  float v154 = -1000000.0;
  unint64_t v155 = v31;
  do
  {
    for (iuint64_t i = v152; ii <= v29; ++ii)
    {
      if (*(float *)(v153 + 4 * ii) > v154)
      {
        uint64_t v33 = v155;
        uint64_t v34 = ii;
        float v154 = *(float *)(v153 + 4 * ii);
      }
    }
    ++v155;
    v153 += v318;
  }
  while (v155 <= v32);
  if (v31 > v32) {
    goto LABEL_26;
  }
  uint64_t v35 = 0;
  uint64_t v36 = 0;
  uint64_t v157 = v315 + v316 * v31;
  float v158 = -1000000.0;
  unint64_t v159 = v31;
  do
  {
    for (unint64_t jj = v152; jj <= v29; ++jj)
    {
      if (*(float *)(v157 + 4 * jj) > v158)
      {
        uint64_t v35 = v159;
        uint64_t v36 = jj;
        float v158 = *(float *)(v157 + 4 * jj);
      }
    }
    ++v159;
    v157 += v316;
  }
  while (v159 <= v32);
  if (v31 > v32) {
    goto LABEL_27;
  }
  uint64_t v37 = 0;
  uint64_t v38 = 0;
  uint64_t v161 = v313 + v314 * v31;
  float v162 = -1000000.0;
  unint64_t v163 = v31;
  do
  {
    for (unint64_t kk = v152; kk <= v29; ++kk)
    {
      if (*(float *)(v161 + 4 * kk) > v162)
      {
        uint64_t v37 = v163;
        uint64_t v38 = kk;
        float v162 = *(float *)(v161 + 4 * kk);
      }
    }
    ++v163;
    v161 += v314;
  }
  while (v163 <= v32);
  if (v31 > v32) {
    goto LABEL_28;
  }
  uint64_t v39 = 0;
  uint64_t v40 = 0;
  uint64_t v165 = v311 + v312 * v31;
  float v166 = -1000000.0;
  do
  {
    for (unint64_t mm = v152; mm <= v29; ++mm)
    {
      if (*(float *)(v165 + 4 * mm) > v166)
      {
        uint64_t v39 = v31;
        uint64_t v40 = mm;
        float v166 = *(float *)(v165 + 4 * mm);
      }
    }
    ++v31;
    v165 += v312;
  }
  while (v31 <= v32);
LABEL_29:
  float v41 = vision::mod::ImageAnalyzer_Tensor3D::valueAt((vision::mod::ImageAnalyzer_Tensor3D *)&texture, v33, v34, 0);
  float v42 = vision::mod::ImageAnalyzer_Tensor3D::valueAt((vision::mod::ImageAnalyzer_Tensor3D *)&texture, v35, v36, 1);
  float v43 = vision::mod::ImageAnalyzer_Tensor3D::valueAt((vision::mod::ImageAnalyzer_Tensor3D *)&texture, v37, v38, 2);
  float v44 = vision::mod::ImageAnalyzer_Tensor3D::valueAt((vision::mod::ImageAnalyzer_Tensor3D *)&texture, v39, v40, 3);
  *(void *)&long long v341 = 0;
  *(void *)&__x[2] = 0;
  *(void *)__x = &__x[2];
  LODWORD(v297[0]) = 0;
  std::vector<float>::vector(&v337, 8uLL, v297);
  float v45 = (float)(unint64_t)(v34 + 1) / v12;
  v46 = (float *)v337;
  *(float *)long long v337 = v45;
  v46[1] = 1.0 - (float)((float)(unint64_t)(v33 + 1) / v11);
  v46[2] = (float)(unint64_t)(v36 + 1) / v12;
  v46[3] = 1.0 - (float)((float)(unint64_t)(v35 + 1) / v11);
  v46[4] = (float)(unint64_t)(v38 + 1) / v12;
  v46[5] = 1.0 - (float)((float)(unint64_t)(v37 + 1) / v11);
  v46[6] = (float)(unint64_t)(v40 + 1) / v12;
  v46[7] = 1.0 - (float)((float)(unint64_t)(v39 + 1) / v11);
  v47 = (float *)*((void *)&v337 + 1);
  if (v46 == *((float **)&v337 + 1))
  {
    v56 = v46;
    uint64_t v48 = (uint64_t)v251;
  }
  else
  {
    uint64_t v48 = (uint64_t)v251;
    do
    {
      float v49 = *v46;
      if ((float)(1.0 - *v46) < *v46) {
        float v49 = 1.0 - *v46;
      }
      float v50 = -v49;
      v51 = *(uint64_t **)&__x[2];
      v52 = &__x[2];
      v53 = &__x[2];
      if (*(void *)&__x[2])
      {
        while (1)
        {
          while (1)
          {
            v53 = (std::vector<int>::value_type *)v51;
            float v54 = *((float *)v51 + 7);
            if (v54 <= v50) {
              break;
            }
            v51 = (uint64_t *)*v51;
            v52 = v53;
            if (!*(void *)v53) {
              goto LABEL_40;
            }
          }
          if (v54 >= v50) {
            break;
          }
          v51 = (uint64_t *)v51[1];
          if (!v51)
          {
            v52 = v53 + 2;
            goto LABEL_40;
          }
        }
      }
      else
      {
LABEL_40:
        v55 = (float *)operator new(0x20uLL);
        v55[7] = v50;
        *(void *)v55 = 0;
        *((void *)v55 + 1) = 0;
        *((void *)v55 + 2) = v53;
        *(void *)v52 = v55;
        if (**(void **)__x)
        {
          *(void *)__x = **(void **)__x;
          v55 = *(float **)v52;
        }
        std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*(uint64_t **)&__x[2], (uint64_t *)v55);
        *(void *)&long long v341 = v341 + 1;
      }
      ++v46;
    }
    while (v46 != v47);
    v46 = (float *)*((void *)&v337 + 1);
    v56 = (float *)v337;
  }
  BOOL v57 = v10 > 0.06 && *(float *)(*(void *)__x + 28) < -0.025;
  if (v57) {
    float v58 = (float)((float)((float)(v41 + v42) + v43) + v44) * 0.25;
  }
  else {
    float v58 = 0.0;
  }
  if (v56 != v46)
  {
    v59 = v297;
    v60 = (float32x2_t *)v56;
    do
    {
      float32x2_t v61 = *v60++;
      *(float64x2_t *)v59 = vcvtq_f64_f32(v61);
      v59 += 2;
    }
    while (v60 != (float32x2_t *)v46);
  }
  uint64_t v62 = 0;
  float64x2_t v63 = *(float64x2_t *)MEMORY[0x1E4F1DAD8];
  do
  {
    float64x2_t v63 = vaddq_f64(v63, *(float64x2_t *)&v297[v62]);
    v62 += 2;
  }
  while (v62 != 8);
  uint64_t v64 = 0;
  double v65 = 0.25 * v63.f64[0];
  double v66 = vmuld_lane_f64(0.25, v63, 1);
  v67 = (double *)&v297[1];
  do
  {
    float v68 = atan2(*v67 - v66, *(v67 - 1) - v65);
    *(float *)((char *)v334 + v64) = v68;
    v64 += 4;
    v67 += 2;
  }
  while (v64 != 16);
  uint64_t v69 = 0;
  long long v346 = xmmword_1A4104940;
  long long v347 = xmmword_1A4104950;
  uint64_t v70 = 1;
  v71 = &v346;
  do
  {
    v72 = (long long *)((char *)&v346 + 8 * v70);
    uint64_t v73 = *(void *)v72;
    uint64_t v74 = *(void *)v71;
    float v75 = *((float *)v334 + *(void *)v72);
    if (v75 < *((float *)v334 + v74))
    {
      uint64_t v76 = v69;
      while (1)
      {
        v77 = &v346;
        *(void *)((char *)&v346 + v76 + 8) = v74;
        if (!v76) {
          break;
        }
        uint64_t v74 = *(void *)&v344[v76];
        v76 -= 8;
        if (v75 >= *((float *)v334 + v74))
        {
          v77 = (long long *)((char *)&v346 + v76 + 8);
          break;
        }
      }
      *(void *)v77 = v73;
    }
    ++v70;
    v69 += 8;
    v71 = v72;
  }
  while (v70 != 4);
  long long v78 = *(_OWORD *)&v297[2 * v346];
  long long v79 = *(_OWORD *)&v297[2 * *((void *)&v346 + 1)];
  long long v80 = *(_OWORD *)&v297[2 * *((void *)&v347 + 1)];
  long long v290 = *(_OWORD *)&v297[2 * v347];
  long long v291 = v80;
  long long v288 = v78;
  long long v289 = v79;
  unint64_t v292 = ptr;
  unint64_t v293 = v246;
  unint64_t v294 = v27;
  unint64_t v295 = v248;
  float v296 = v58;
  if (v56)
  {
    *((void *)&v337 + 1) = v56;
    operator delete(v56);
  }
  std::__tree<std::__value_type<long long,int>,std::__map_value_compare<long long,std::__value_type<long long,int>,std::less<long long>,true>,std::allocator<std::__value_type<long long,int>>>::destroy(*(void **)&__x[2]);
  free(v309);
  free(v310);
  vision::mod::ImageAnalyzer_Tensor3D::~ImageAnalyzer_Tensor3D((vision::mod::ImageAnalyzer_Tensor3D *)&texture);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  vision::mod::ImageAnalyzer_Tensor1D<float>::~ImageAnalyzer_Tensor1D((uint64_t)&__src);
  __x[0] = 0;
  vision::mod::ImageAnalyzer::getSceneSaliency((vision::mod::ImageAnalyzer *)&texture, v48);
  vision::mod::ImageAnalyzer_Tensor2D::getVImageBufferFromTensor((uint64_t)&__src, &texture, __x);
  v81 = (char *)__src;
  size_t v82 = *((void *)&v331 + 1);
  size_t v83 = v331;
  size_t v84 = v332;
  free(v327);
  free(v328);
  if (!v81)
  {
    if (a7)
    {
      v92 = @"failed to get image from tensor";
LABEL_190:
      *a7 = +[VNError errorForInternalErrorWithLocalizedDescription:v92];
    }
LABEL_337:
    v223 = 0;
    goto LABEL_338;
  }
  baseAddress[0] = (void *)MEMORY[0x1E4F143A8];
  baseAddress[1] = (void *)3221225472;
  bytesPerRow[0] = (size_t)__92__VNDocumentSegmentationDetector__calculateIoUWithImageAnalyzer_quadrilateral_bounds_error___block_invoke;
  bytesPerRow[1] = (size_t)&__block_descriptor_80_e15___CGImage__8__0l;
  v303 = v81;
  size_t v304 = v83;
  size_t v305 = v82;
  size_t v306 = v84;
  size_t v307 = v82;
  v308 = &v288;
  v85 = __92__VNDocumentSegmentationDetector__calculateIoUWithImageAnalyzer_quadrilateral_bounds_error___block_invoke((uint64_t)baseAddress);
  if (!v85)
  {
    if (a7)
    {
      v92 = @"failed to create comparison image";
      goto LABEL_190;
    }
    goto LABEL_337;
  }
  std::vector<unsigned char>::vector(v297, v82 * v83);
  size_t v277 = v84;
  ptra = (char *)v297[0];
  __int16 BitmapInfo = CGImageGetBitmapInfo(v85);
  v274 = v81;
  if (CGImageGetImageProvider())
  {
    int ComponentType = CGImageProviderGetComponentType();
    ColorSpace = (CGColorSpace *)CGImageProviderGetColorSpace();
    size_t PixelSize = CGImageProviderGetPixelSize();
    BOOL v89 = ComponentType == 1;
    BOOL v90 = ComponentType == 4;
    unsigned int AlphaInfo = CGImageProviderGetAlphaInfo();
  }
  else
  {
    ColorSpace = CGImageGetColorSpace(v85);
    size_t PixelSize = CGImageGetBitsPerPixel(v85) >> 3;
    BOOL v89 = CGImageGetBitsPerComponent(v85) == 8;
    BOOL v90 = CGImageGetBitsPerComponent(v85) == 32;
    unsigned int AlphaInfo = CGImageGetAlphaInfo(v85);
  }
  unsigned int v168 = AlphaInfo;
  int v169 = 0;
  int v170 = 1;
  if (!v89 && !v90 || !ColorSpace) {
    goto LABEL_299;
  }
  CGColorSpaceModel Model = CGColorSpaceGetModel(ColorSpace);
  if (v168 <= 6 && ((1 << v168) & 0x54) != 0)
  {
    int v172 = 0;
  }
  else
  {
    int v172 = 1;
    if (v89 && PixelSize == 1 && !v168)
    {
      int v169 = 1;
      if (Model != kCGColorSpaceModelRGB) {
        goto LABEL_291;
      }
    }
  }
  int v173 = BitmapInfo & 0x7000;
  if (PixelSize == 4 && v89)
  {
    if (v168 <= 5 && ((1 << v168) & 0x2A) != 0)
    {
      BOOL v175 = Model != kCGColorSpaceModelRGB;
      if (Model == kCGColorSpaceModelRGB && (BitmapInfo & 0x7000) == 0)
      {
        int v169 = 2;
LABEL_290:
        int v172 = 1;
        goto LABEL_291;
      }
    }
    else
    {
      BOOL v175 = Model != kCGColorSpaceModelRGB;
    }
    int v196 = v172 | v175;
    if (((v172 | v175) & 1) == 0 && (BitmapInfo & 0x7000) == 0)
    {
      int v169 = 8;
      goto LABEL_290;
    }
    if (v168 <= 5 && ((1 << v168) & 0x2A) != 0)
    {
      if (v173 != 0x2000) {
        BOOL v175 = 1;
      }
      if (!v175)
      {
        int v169 = 4;
        goto LABEL_290;
      }
    }
    if (v173 == 0x2000) {
      int v197 = v196;
    }
    else {
      int v197 = 1;
    }
    if (v197 != 1)
    {
      int v169 = 16;
      goto LABEL_290;
    }
  }
  if (PixelSize == 4 && v90)
  {
    int v169 = 0;
    int v172 = 1;
    if (v168 <= 5 && ((1 << v168) & 0x2A) != 0) {
      int v169 = 32 * (Model != kCGColorSpaceModelRGB);
    }
  }
  else
  {
    if (PixelSize != 16 || !v89)
    {
      int v169 = 0;
      goto LABEL_290;
    }
    if (v168 <= 5 && ((1 << v168) & 0x2A) != 0)
    {
      BOOL v200 = Model != kCGColorSpaceModelRGB;
      if (Model == kCGColorSpaceModelRGB && (BitmapInfo & 0x7000) == 0)
      {
        int v172 = 0;
        int v169 = 64;
        goto LABEL_291;
      }
    }
    else
    {
      BOOL v200 = Model != kCGColorSpaceModelRGB;
    }
    int v238 = v172 | v200;
    if (((v172 | v200) & 1) != 0 || (BitmapInfo & 0x7000) != 0)
    {
      if (v168 > 5 || ((1 << v168) & 0x2A) == 0) {
        goto LABEL_368;
      }
      if (v173 != 0x2000) {
        BOOL v200 = 1;
      }
      if (!v200)
      {
        int v172 = 0;
        int v169 = 128;
      }
      else
      {
LABEL_368:
        if (v173 == 0x2000) {
          int v172 = v238;
        }
        else {
          int v172 = 1;
        }
        if (v172) {
          int v169 = 0;
        }
        else {
          int v169 = 512;
        }
      }
    }
    else
    {
      int v172 = 0;
      int v169 = 256;
    }
  }
LABEL_291:
  size_t Width = CGImageGetWidth(v85);
  size_t Height = CGImageGetHeight(v85);
  size_t v203 = CGImageGetBytesPerRow(v85);
  if (v169)
  {
    uint64_t v205 = 1;
  }
  else
  {
    if ((v169 & 0x3E) != 0) {
      int v204 = 0;
    }
    else {
      int v204 = v172;
    }
    uint64_t v205 = 4;
    if ((v169 & 0x3E) == 0) {
      uint64_t v205 = 16;
    }
    if (v204 == 1)
    {
      syslog(5, "ERROR: Invalid image type");
LABEL_299:
      uint64_t v206 = (uint64_t)v251;
      v207 = ptra;
      goto LABEL_315;
    }
  }
  v207 = ptra;
  *(void *)&long long v208 = v83;
  *((void *)&v208 + 1) = v82;
  if (ptra
    && v82
    && v83
    && v82 >= 2
    && (*(void *)&long long v208 = Height, *((void *)&v208 + 1) = Width, v83 >= Height)
    && v203 >= v82)
  {
    *(_OWORD *)ptrd = v208;
  }
  else
  {
    *(_OWORD *)ptrd = v208;
    unint64_t v209 = (v205 * Width + 15) & 0xFFFFFFFFFFFFFFF0;
    v207 = (char *)malloc_type_realloc(v207, v209 * Height, 0xA423628BuLL);
    if (v207)
    {
      *(void *)&long long v210 = Height;
      *((void *)&v210 + 1) = Width;
      *(_OWORD *)ptrd = v210;
      size_t v82 = v209;
    }
  }
  *(void *)&v324[4] = 0;
  texture.i32[0] = CGImageGetBitsPerComponent(v85);
  texture.i32[1] = CGImageGetBitsPerPixel(v85);
  texture.i64[1] = (uint64_t)CGImageGetColorSpace(v85);
  CGBitmapInfo v322 = CGImageGetBitmapInfo(v85);
  *(void *)v324 = 0;
  uint64_t v323 = 0;
  *(void *)&long long v346 = 0;
  __src = v207;
  long long v331 = *(_OWORD *)ptrd;
  size_t v332 = v82;
  uint64_t v206 = (uint64_t)v251;
  if (!MEMORY[0x1A6257F90](&__src, &texture, &v346, v85, 768))
  {
    if ((void)v331)
    {
      unint64_t v211 = 0;
      v212 = (char *)__src;
      v213 = v207;
      do
      {
        memcpy(v213, v212, v82);
        v213 += v82;
        v212 += v332;
        ++v211;
      }
      while (v211 < (unint64_t)v331);
      int v170 = 0;
      uint64_t v206 = (uint64_t)v251;
    }
    else
    {
      int v170 = 0;
    }
  }
LABEL_315:
  CGImageRelease(v85);
  if (v169 == 1) {
    int v214 = v170;
  }
  else {
    int v214 = 1;
  }
  if (v214 == 1)
  {
    float v215 = 0.0;
    if (a7)
    {
      *a7 = +[VNError errorForInternalErrorWithLocalizedDescription:@"failed to create comparison image"];
    }
  }
  else
  {
    unint64_t v216 = v294;
    if (v294 <= v295)
    {
      int v218 = 0;
      int v217 = 0;
      v219 = &v207[v82 * v294];
      v220 = &v274[4 * v294 * (v277 >> 2)];
      do
      {
        for (nint n = v292; nn <= v293; ++nn)
        {
          float v222 = *(float *)&v220[4 * nn];
          if (v219[nn])
          {
            ++v218;
            if (v222 > 0.45) {
              ++v217;
            }
          }
          else if (v222 > 0.45)
          {
            ++v218;
          }
        }
        ++v216;
        v219 += v82;
        v220 += 4 * (v277 >> 2);
      }
      while (v216 <= v295);
    }
    else
    {
      int v217 = 0;
      int v218 = 0;
    }
    float v215 = (float)v217 / (float)((float)v218 + 0.0001);
  }
  if (v297[0])
  {
    v297[1] = v297[0];
    operator delete(v297[0]);
  }
  if (v214) {
    goto LABEL_337;
  }
  v225 = (id *)v245;
  LODWORD(__src) = 0;
  *(_OWORD *)baseAddress = 0u;
  *(_OWORD *)bytesPerRow = 0u;
  vision::mod::ImageAnalyzer::getSceneSaliency((vision::mod::ImageAnalyzer *)&texture, v206);
  vision::mod::ImageAnalyzer_Tensor2D::getVImageBufferFromTensor((uint64_t)baseAddress, &texture, (int *)&__src);
  free(v327);
  free(v328);
  if (__src != 32)
  {
    if (a7)
    {
      id v232 = +[VNError errorForInternalErrorWithLocalizedDescription:@"unsupported pixel format type"];
      goto LABEL_349;
    }
LABEL_350:
    v233 = 0;
    v223 = 0;
    goto LABEL_351;
  }
  texture.i64[0] = 0;
  CFAllocatorRef v226 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  v227 = baseAddress[1];
  v228 = baseAddress[0];
  size_t v229 = bytesPerRow[0];
  size_t v230 = bytesPerRow[1];
  if (VNIOSurfaceBackedPixelBufferAttributes::onceToken != -1) {
    dispatch_once(&VNIOSurfaceBackedPixelBufferAttributes::onceToken, &__block_literal_global_30784);
  }
  uint64_t v231 = CVPixelBufferCreateWithBytes(v226, v229, (size_t)v227, 0x4C303066u, v228, v230, 0, 0, (CFDictionaryRef)VNIOSurfaceBackedPixelBufferAttributes::pixelBufferAttributes, (CVPixelBufferRef *)&texture);
  if (v231)
  {
    if (a7)
    {
      id v232 = +[VNError errorForCVReturnCode:v231 localizedDescription:@"failed to create pixel buffer"];
LABEL_349:
      *a7 = v232;
      goto LABEL_350;
    }
    goto LABEL_350;
  }
  v234 = [VNPixelBufferObservation alloc];
  v235 = [(VNPixelBufferObservation *)v234 initWithOriginatingRequestSpecifier:v225 featureName:0 CVPixelBuffer:texture.i64[0]];
  CVPixelBufferRelease((CVPixelBufferRef)texture.i64[0]);

  if (!v235)
  {
    v233 = 0;
    v223 = 0;
    goto LABEL_352;
  }
  v236 = [VNRectangleObservation alloc];
  v225 = [(VNRectangleObservation *)v236 initWithOriginatingRequestSpecifier:v225 topLeft:v291 topRight:v290 bottomRight:v289 bottomLeft:v288];
  *(float *)&double v237 = fminf((float)(v215 * 1.1) * v296, 0.99);
  [v225 setConfidence:v237];
  v233 = v235;
  if (v225) {
    objc_storeStrong(v225 + 17, v235);
  }

  v349[0] = v225;
  v223 = [MEMORY[0x1E4F1C978] arrayWithObjects:v349 count:1];
LABEL_351:

LABEL_352:
LABEL_338:

  return v223;
}

CGImageRef __92__VNDocumentSegmentationDetector__calculateIoUWithImageAnalyzer_quadrilateral_bounds_error___block_invoke(uint64_t a1)
{
  v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC00]);
  v3 = CGBitmapContextCreate(0, *(void *)(a1 + 48), *(void *)(a1 + 40), 8uLL, *(void *)(a1 + 64), v2, 0);
  CGColorSpaceRelease(v2);
  if (!v3) {
    return 0;
  }
  double v4 = (double)*(unint64_t *)(a1 + 48);
  double v5 = (double)*(unint64_t *)(a1 + 40);
  CGContextBeginPath(v3);
  CGContextMoveToPoint(v3, **(double **)(a1 + 72) * v4, *(double *)(*(void *)(a1 + 72) + 8) * v5);
  CGContextAddLineToPoint(v3, *(double *)(*(void *)(a1 + 72) + 16) * v4, *(double *)(*(void *)(a1 + 72) + 24) * v5);
  CGContextAddLineToPoint(v3, *(double *)(*(void *)(a1 + 72) + 32) * v4, *(double *)(*(void *)(a1 + 72) + 40) * v5);
  CGContextAddLineToPoint(v3, *(double *)(*(void *)(a1 + 72) + 48) * v4, *(double *)(*(void *)(a1 + 72) + 56) * v5);
  CGContextAddLineToPoint(v3, **(double **)(a1 + 72) * v4, *(double *)(*(void *)(a1 + 72) + 8) * v5);
  CGContextSetGrayFillColor(v3, 1.0, 1.0);
  CGContextFillPath(v3);
  CGImageRef Image = CGBitmapContextCreateImage(v3);
  CGContextRelease(v3);
  return Image;
}

- (unsigned)analysisTypesForProcessOptions:(id)a3
{
  return 2096;
}

- (BOOL)configureImageAnalyzerOptions:(void *)a3 error:(id *)a4
{
  v10.receiver = self;
  v10.super_class = (Class)VNDocumentSegmentationDetector;
  BOOL v5 = [(VNImageAnalyzerBasedDetector *)&v10 configureImageAnalyzerOptions:a3 error:a4];
  if (v5)
  {
    if (*((char *)a3 + 215) < 0)
    {
      *((void *)a3 + 25) = 7;
      v6 = (char *)*((void *)a3 + 24);
    }
    else
    {
      v6 = (char *)a3 + 192;
      *((unsigned char *)a3 + 215) = 7;
    }
    strcpy(v6, "sigmoid");
    if (*((char *)a3 + 335) < 0)
    {
      *((void *)a3 + 40) = 7;
      v7 = (char *)*((void *)a3 + 39);
    }
    else
    {
      v7 = (char *)a3 + 312;
      *((unsigned char *)a3 + 335) = 7;
    }
    strcpy(v7, "finalFC");
    if (*((char *)a3 + 311) < 0)
    {
      *((void *)a3 + 37) = 11;
      v8 = (char *)*((void *)a3 + 36);
    }
    else
    {
      v8 = (char *)a3 + 288;
      *((unsigned char *)a3 + 311) = 11;
    }
    strcpy(v8, "BL_BR_TR_TL");
    *((unsigned char *)a3 + 385) = 1;
  }
  return v5;
}

+ (id)segmentationLabelsFilePathForConfiguration:(id)a3 error:(id *)a4
{
  BOOL v5 = [NSString stringWithUTF8String:"docseg_segflow-xde2zmcdh5_64000_4ch.segmentation_labels.txt"];
  v6 = +[VNEspressoHelpers pathForEspressoResourceWithFilename:v5 error:a4];

  return v6;
}

+ (BOOL)providesSegmentationLabelsForConfiguration:(id)a3
{
  return 1;
}

+ (unsigned)analysisPixelFormatTypeForConfiguration:(id)a3
{
  return 1111970369;
}

+ (id)inputImageBlobNameForConfiguration:(id)a3
{
  v3 = [NSString stringWithUTF8String:"image"];

  return v3;
}

+ (id)modelPathForConfiguration:(id)a3 error:(id *)a4
{
  BOOL v5 = [NSString stringWithUTF8String:"docseg_segflow-xde2zmcdh5_64000_4ch_512x288_finalFC.espresso"];
  v6 = +[VNEspressoHelpers pathForEspressoNetworkModelFileWithName:v5 error:a4];

  return v6;
}

@end