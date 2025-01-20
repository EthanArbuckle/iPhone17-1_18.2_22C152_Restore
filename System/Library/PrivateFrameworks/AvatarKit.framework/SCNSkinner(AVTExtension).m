@interface SCNSkinner(AVTExtension)
+ (id)avt_skinnerByInterpolatingFromSkinner:()AVTExtension toSkinner:factor:skeleton:;
- (double)avt_simdBaseGeometryBindTransform;
- (uint64_t)avt_setSimdBaseGeometryBindTransform:()AVTExtension;
@end

@implementation SCNSkinner(AVTExtension)

- (double)avt_simdBaseGeometryBindTransform
{
  [a1 baseGeometryBindTransform];
  return v2;
}

- (uint64_t)avt_setSimdBaseGeometryBindTransform:()AVTExtension
{
  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  v6[3] = a5;
  return [a1 setBaseGeometryBindTransform:v6];
}

+ (id)avt_skinnerByInterpolatingFromSkinner:()AVTExtension toSkinner:factor:skeleton:
{
  *(double *)&long long v205 = a1;
  uint64_t v242 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v10 = a6;
  float v11 = *(float *)&v205;
  id v12 = v10;
  if (!v10)
  {
    v13 = avt_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[SCNSkinner(AVTExtension) avt_skinnerByInterpolatingFromSkinner:toSkinner:factor:skeleton:]1(v13, v14, v15, v16, v17, v18, v19, v20);
    }

    float v11 = *(float *)&v205;
  }
  if (v11 == 0.0)
  {
    [v8 setSkeleton:v12];
    id v21 = v8;
LABEL_9:
    v22 = v21;
    goto LABEL_10;
  }
  if (v11 == 1.0)
  {
    [v9 setSkeleton:v12];
    id v21 = v9;
    goto LABEL_9;
  }
  id v221 = v12;
  v24 = [v8 bones];
  v25 = [v9 bones];
  id v208 = [v8 boneInverseBindTransforms];
  id v207 = [v9 boneInverseBindTransforms];
  id v26 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v235 = 0u;
  long long v236 = 0u;
  long long v237 = 0u;
  long long v238 = 0u;
  id v223 = v24;
  uint64_t v27 = [v223 countByEnumeratingWithState:&v235 objects:v241 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v236;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v236 != v29) {
          objc_enumerationMutation(v223);
        }
        v31 = [*(id *)(*((void *)&v235 + 1) + 8 * i) name];
        [v26 addObject:v31];
      }
      uint64_t v28 = [v223 countByEnumeratingWithState:&v235 objects:v241 count:16];
    }
    while (v28);
  }
  id v203 = v8;

  long long v233 = 0u;
  long long v234 = 0u;
  long long v231 = 0u;
  long long v232 = 0u;
  id v222 = v25;
  uint64_t v32 = [v222 countByEnumeratingWithState:&v231 objects:v240 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v232;
    do
    {
      for (uint64_t j = 0; j != v33; ++j)
      {
        if (*(void *)v232 != v34) {
          objc_enumerationMutation(v222);
        }
        v36 = [*(id *)(*((void *)&v231 + 1) + 8 * j) name];
        [v26 addObject:v36];
      }
      uint64_t v33 = [v222 countByEnumeratingWithState:&v231 objects:v240 count:16];
    }
    while (v33);
  }
  id v202 = v9;
  id v37 = v222;

  uint64_t v38 = [v26 count];
  [v223 count];
  v201 = &v194;
  ((void (*)(void))MEMORY[0x270FA5388])();
  v210 = (char *)&v194 - v39;
  [v37 count];
  ((void (*)(void))MEMORY[0x270FA5388])();
  v209 = (char *)&v194 - v40;
  id v224 = (id)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v38];
  id v220 = (id)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v38];
  long long v227 = 0u;
  long long v228 = 0u;
  long long v229 = 0u;
  long long v230 = 0u;
  id v206 = v26;
  uint64_t v41 = [v206 countByEnumeratingWithState:&v227 objects:v239 count:16];
  if (v41)
  {
    uint64_t v43 = v41;
    *(void *)&long long v219 = *(void *)v228;
    *(float *)v42.i32 = 1.0 - *(float *)&v205;
    float32x4_t v204 = (float32x4_t)vdupq_lane_s32(v42, 0);
    do
    {
      for (uint64_t k = 0; k != v43; ++k)
      {
        if (*(void *)v228 != (void)v219) {
          objc_enumerationMutation(v206);
        }
        uint64_t v45 = *(void *)(*((void *)&v227 + 1) + 8 * k);
        v226[0] = MEMORY[0x263EF8330];
        v226[1] = 3221225472;
        v226[2] = __92__SCNSkinner_AVTExtension__avt_skinnerByInterpolatingFromSkinner_toSkinner_factor_skeleton___block_invoke;
        v226[3] = &unk_2640210F8;
        v226[4] = v45;
        uint64_t v46 = [v223 indexOfObjectPassingTest:v226];
        v225[0] = MEMORY[0x263EF8330];
        v225[1] = 3221225472;
        v225[2] = __92__SCNSkinner_AVTExtension__avt_skinnerByInterpolatingFromSkinner_toSkinner_factor_skeleton___block_invoke_2;
        v225[3] = &unk_2640210F8;
        v225[4] = v45;
        uint64_t v47 = [v222 indexOfObjectPassingTest:v225];
        uint64_t v48 = [v224 count];
        if (v46 == 0x7FFFFFFFFFFFFFFFLL || v47 == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (v46 == 0x7FFFFFFFFFFFFFFFLL)
          {
            *(void *)&v209[8 * v47] = v48;
            id v60 = v207;
            uint64_t v61 = v47;
          }
          else
          {
            *(void *)&v210[8 * v46] = v48;
            id v60 = v208;
            uint64_t v61 = v46;
          }
          uint64_t v59 = [v60 objectAtIndexedSubscript:v61];
        }
        else
        {
          *(void *)&v210[8 * v46] = v48;
          *(void *)&v209[8 * v47] = v48;
          v49 = [v208 objectAtIndexedSubscript:v46];
          objc_msgSend(v49, "avt_float4x4Value");
          float32x4_t v215 = v50;
          float32x4_t v216 = v51;
          float32x4_t v217 = v52;
          float32x4_t v218 = v53;

          v54 = [v207 objectAtIndexedSubscript:v47];
          objc_msgSend(v54, "avt_float4x4Value");
          float32x4_t v211 = v55;
          float32x4_t v212 = v56;
          float32x4_t v213 = v57;
          float32x4_t v214 = v58;

          uint64_t v59 = objc_msgSend(MEMORY[0x263F08D40], "avt_valueWithFloat4x4:", *(double *)vmlaq_f32(vmulq_n_f32(v211, *(float *)&v205), v215, v204).i64, *(double *)vmlaq_f32(vmulq_n_f32(v212, *(float *)&v205), v216, v204).i64, *(double *)vmlaq_f32(vmulq_n_f32(v213, *(float *)&v205), v217, v204).i64, *(double *)vmlaq_f32(vmulq_n_f32(v214, *(float *)&v205), v218, v204).i64);
        }
        v62 = (void *)v59;
        [v220 addObject:v59];

        v63 = [v221 childNodeWithName:v45 recursively:1];
        [v224 addObject:v63];
      }
      uint64_t v43 = [v206 countByEnumeratingWithState:&v227 objects:v239 count:16];
    }
    while (v43);
  }

  id v64 = v203;
  v65 = [v203 boneWeights];
  v214.i64[0] = [v65 bytesPerComponent];
  id v66 = [v65 data];
  v213.i64[0] = [v66 bytes];

  v216.i64[0] = [v65 componentsPerVector];
  v67 = [v64 boneIndices];
  v212.i64[0] = [v67 bytesPerComponent];
  id v68 = [v67 data];
  v211.i64[0] = [v68 bytes];

  v204.i64[0] = (uint64_t)v67;
  if (v65) {
    _ZF = v67 == 0;
  }
  else {
    _ZF = 1;
  }
  char v70 = _ZF;
  if (_ZF)
  {
    uint64_t v71 = [v223 count];
    id v80 = v202;
    if (v71 != 1)
    {
      v72 = avt_default_log();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
        +[SCNSkinner(AVTExtension) avt_skinnerByInterpolatingFromSkinner:toSkinner:factor:skeleton:]0(v72, v73, v74, v75, v76, v77, v78, v79);
      }
    }
    v216.i64[0] = 1;
  }
  else
  {
    id v80 = v202;
  }
  v81 = [v80 boneWeights];
  uint64_t v82 = [v81 bytesPerComponent];
  id v83 = [v81 data];
  *(void *)&long long v219 = [v83 bytes];

  uint64_t v84 = [v81 componentsPerVector];
  v85 = [v80 boneIndices];
  uint64_t v86 = [v85 bytesPerComponent];
  id v87 = [v85 data];
  v218.i64[0] = [v87 bytes];

  id v199 = v85;
  id v200 = v81;
  if (v81) {
    BOOL v88 = v85 == 0;
  }
  else {
    BOOL v88 = 1;
  }
  char v89 = v88;
  if (v88)
  {
    if ([v222 count] != 1)
    {
      v90 = avt_default_log();
      if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR)) {
        +[SCNSkinner(AVTExtension) avt_skinnerByInterpolatingFromSkinner:toSkinner:factor:skeleton:].cold.9(v90, v91, v92, v93, v94, v95, v96, v97);
      }
    }
    uint64_t v84 = 1;
  }
  uint64_t v98 = [v65 vectorCount];
  uint64_t v99 = MEMORY[0x270FA5388](v98);
  v102 = (char *)&v194 - v101;
  unint64_t v103 = 0;
  v217.i64[0] = v99;
  if (v99)
  {
    v105 = v209;
    v104 = v210;
    uint64_t v106 = v214.i64[0];
    uint64_t v107 = v213.i64[0];
    uint64_t v108 = v212.i64[0];
    uint64_t v109 = v211.i64[0];
    uint64_t v110 = v216.i64[0];
    if (v100)
    {
      uint64_t v111 = 0;
      uint64_t v112 = 0;
      unint64_t v103 = 0;
      while (1)
      {
        unsigned __int8 v113 = 0;
        if (v110)
        {
          uint64_t v114 = v111;
          do
          {
            if (v70)
            {
              uint64_t v115 = 0;
            }
            else
            {
              switch(v106)
              {
                case 8:
                  _S0 = *(double *)(v107 + 8 * v114);
                  break;
                case 4:
                  _S0 = *(float *)(v107 + 4 * v114);
                  break;
                case 2:
                  _H0 = *(_WORD *)(v107 + 2 * v114);
                  __asm { FCVT            S0, H0 }
                  break;
                default:
                  +[SCNSkinner(AVTExtension) avt_skinnerByInterpolatingFromSkinner:toSkinner:factor:skeleton:]();
              }
              if (_S0 <= 0.0) {
                goto LABEL_86;
              }
              switch(v108)
              {
                case 4:
                  uint64_t v115 = *(unsigned int *)(v109 + 4 * v114);
                  break;
                case 2:
                  uint64_t v115 = *(unsigned __int16 *)(v109 + 2 * v114);
                  break;
                case 1:
                  uint64_t v115 = *(unsigned __int8 *)(v109 + v114);
                  break;
                default:
                  +[SCNSkinner(AVTExtension) avt_skinnerByInterpolatingFromSkinner:toSkinner:factor:skeleton:]();
              }
            }
            uint64_t v116 = v113++;
            *(_DWORD *)&v102[4 * v116] = *(void *)&v104[8 * v115];
LABEL_86:
            ++v114;
            --v110;
          }
          while (v110);
        }
        if (v84) {
          break;
        }
LABEL_116:
        if (v103 <= v113) {
          unint64_t v132 = v113;
        }
        else {
          unint64_t v132 = v103;
        }
        if ((unint64_t)++v112 >= v217.i64[0])
        {
          unint64_t v103 = v132;
          goto LABEL_123;
        }
        uint64_t v110 = v216.i64[0];
        v111 += v216.i64[0];
        unint64_t v103 = v132;
        if (v132 >= v100) {
          goto LABEL_123;
        }
      }
      uint64_t v122 = 0;
      while ((v89 & 1) == 0)
      {
        uint64_t v129 = v122 + v112 * v84;
        switch(v82)
        {
          case 8:
            _S0 = *(double *)(v219 + 8 * v129);
            break;
          case 4:
            _S0 = *(float *)(v219 + 4 * v129);
            break;
          case 2:
            _H0 = *(_WORD *)(v219 + 2 * v129);
            __asm { FCVT            S0, H0 }
            break;
          default:
            +[SCNSkinner(AVTExtension) avt_skinnerByInterpolatingFromSkinner:toSkinner:factor:skeleton:]();
        }
        if (_S0 > 0.0)
        {
          switch(v86)
          {
            case 4:
              uint64_t v123 = *(unsigned int *)(v218.i64[0] + 4 * v129);
              break;
            case 2:
              uint64_t v123 = *(unsigned __int16 *)(v218.i64[0] + 2 * v129);
              break;
            case 1:
              uint64_t v123 = *(unsigned __int8 *)(v218.i64[0] + v129);
              break;
            default:
              +[SCNSkinner(AVTExtension) avt_skinnerByInterpolatingFromSkinner:toSkinner:factor:skeleton:]();
          }
LABEL_94:
          uint64_t v124 = *(void *)&v105[8 * v123];
          if (v113)
          {
            uint64_t v125 = v113;
            uint64_t v126 = v113;
            v127 = (int *)v102;
            while (1)
            {
              int v128 = *v127++;
              if (v128 == v124) {
                break;
              }
              if (!--v126) {
                goto LABEL_104;
              }
            }
          }
          else
          {
            uint64_t v125 = 0;
LABEL_104:
            ++v113;
            *(_DWORD *)&v102[4 * v125] = v124;
          }
        }
        if (++v122 == v84) {
          goto LABEL_116;
        }
      }
      uint64_t v123 = 0;
      goto LABEL_94;
    }
  }
LABEL_123:
  uint64_t v195 = v86;
  id v198 = v65;
  size_t v133 = v103 * v217.i64[0];
  size_t v196 = 4 * v103 * v217.i64[0];
  v134 = (float *)malloc_type_malloc(v196, 0x20175611uLL);
  size_t v197 = v133;
  v135 = malloc_type_malloc(v133, 0x697AD132uLL);
  v215.i64[0] = 4 * v103;
  if (v217.i64[0])
  {
    unint64_t v138 = v103;
    uint64_t v139 = 0;
    uint64_t v140 = 0;
    float v141 = *(float *)&v205;
    *(float *)&long long v137 = 1.0 - *(float *)&v205;
    v142 = v134;
    v144 = v209;
    v143 = v210;
    uint64_t v145 = v214.i64[0];
    uint64_t v146 = v213.i64[0];
    uint64_t v147 = v212.i64[0];
    uint64_t v148 = v211.i64[0];
    uint64_t v149 = v216.i64[0];
    uint64_t v150 = v195;
    while (1)
    {
      if (v149)
      {
        uint64_t v151 = v149;
        LODWORD(v149) = 0;
        uint64_t v152 = v139;
        do
        {
          if (v70)
          {
            uint64_t v153 = 0;
            _S0 = 1.0;
          }
          else
          {
            switch(v145)
            {
              case 8:
                _S0 = *(double *)(v146 + 8 * v152);
                break;
              case 4:
                _S0 = *(float *)(v146 + 4 * v152);
                break;
              case 2:
                _H0 = *(_WORD *)(v146 + 2 * v152);
                __asm { FCVT            S0, H0 }
                break;
              default:
                +[SCNSkinner(AVTExtension) avt_skinnerByInterpolatingFromSkinner:toSkinner:factor:skeleton:]();
            }
            if (_S0 <= 0.0) {
              goto LABEL_141;
            }
            switch(v147)
            {
              case 4:
                uint64_t v153 = *(unsigned int *)(v148 + 4 * v152);
                break;
              case 2:
                uint64_t v153 = *(unsigned __int16 *)(v148 + 2 * v152);
                break;
              case 1:
                uint64_t v153 = *(unsigned __int8 *)(v148 + v152);
                break;
              default:
                +[SCNSkinner(AVTExtension) avt_skinnerByInterpolatingFromSkinner:toSkinner:factor:skeleton:]();
            }
          }
          uint64_t v155 = *(void *)&v143[8 * v153];
          unint64_t v156 = v140 * v138 + v149;
          v134[v156] = *(float *)&v137 * _S0;
          uint64_t v157 = v149;
          v135[v156] = v155;
          LODWORD(v149) = v149 + 1;
          *(_DWORD *)&v102[4 * v157] = v155;
LABEL_141:
          ++v152;
          --v151;
        }
        while (v151);
      }
      if (v84) {
        break;
      }
LABEL_172:
      if (v138 > v149)
      {
        uint64_t v171 = v149;
        do
        {
          uint64_t v172 = v171 + v140 * v138;
          v134[v172] = 0.0;
          v135[v172] = 0;
          LODWORD(v149) = v149 + 1;
          uint64_t v171 = v149;
        }
        while (v138 > v149);
      }
      ++v140;
      uint64_t v149 = v216.i64[0];
      v139 += v216.i64[0];
      v142 = (float *)((char *)v142 + v215.i64[0]);
      if (v140 == v217.i64[0])
      {
        long long v219 = v137;
        goto LABEL_178;
      }
    }
    uint64_t v159 = 0;
    unint64_t v160 = v140 * v138;
    while ((v89 & 1) == 0)
    {
      uint64_t v169 = v159 + v140 * v84;
      switch(v82)
      {
        case 8:
          _S0 = *(double *)(v219 + 8 * v169);
          break;
        case 4:
          _S0 = *(float *)(v219 + 4 * v169);
          break;
        case 2:
          _H0 = *(_WORD *)(v219 + 2 * v169);
          __asm { FCVT            S0, H0 }
          break;
        default:
          +[SCNSkinner(AVTExtension) avt_skinnerByInterpolatingFromSkinner:toSkinner:factor:skeleton:]();
      }
      if (_S0 > 0.0)
      {
        switch(v150)
        {
          case 4:
            uint64_t v161 = *(unsigned int *)(v218.i64[0] + 4 * v169);
            break;
          case 2:
            uint64_t v161 = *(unsigned __int16 *)(v218.i64[0] + 2 * v169);
            break;
          case 1:
            uint64_t v161 = *(unsigned __int8 *)(v218.i64[0] + v169);
            break;
          default:
            +[SCNSkinner(AVTExtension) avt_skinnerByInterpolatingFromSkinner:toSkinner:factor:skeleton:]();
        }
LABEL_149:
        uint64_t v163 = *(void *)&v144[8 * v161];
        if ((_BYTE)v149)
        {
          uint64_t v164 = v149;
          uint64_t v165 = v149;
          v166 = (int *)v102;
          v167 = v142;
          while (1)
          {
            int v168 = *v166++;
            if (v168 == v163) {
              break;
            }
            ++v167;
            if (!--v165)
            {
              unint64_t v138 = v103;
              goto LABEL_159;
            }
          }
          float *v167 = *v167 + (float)(v141 * _S0);
          unint64_t v138 = v103;
        }
        else
        {
          uint64_t v164 = 0;
LABEL_159:
          v134[v160 + v164] = _S0 * v141;
          v135[v160 + v164] = v163;
          LODWORD(v149) = v149 + 1;
          *(_DWORD *)&v102[4 * v164] = v163;
        }
      }
      if (++v159 == v84) {
        goto LABEL_172;
      }
    }
    uint64_t v161 = 0;
    _S0 = 1.0;
    goto LABEL_149;
  }
  *(float *)&long long v136 = 1.0 - *(float *)&v205;
  long long v219 = v136;
LABEL_178:
  v173 = (void *)MEMORY[0x263F16A30];
  id v174 = objc_alloc(MEMORY[0x263EFF8F8]);
  v175 = (void *)[v174 initWithBytesNoCopy:v134 length:v196];
  uint64_t v176 = v217.i64[0];
  v177 = [v173 geometrySourceWithData:v175 semantic:*MEMORY[0x263F16B30] vectorCount:v217.i64[0] floatComponents:1 componentsPerVector:v103 bytesPerComponent:4 dataOffset:0 dataStride:v215.i64[0]];

  v178 = (void *)MEMORY[0x263F16A30];
  id v179 = objc_alloc(MEMORY[0x263EFF8F8]);
  v180 = (void *)[v179 initWithBytesNoCopy:v135 length:v197];
  v181 = [v178 geometrySourceWithData:v180 semantic:*MEMORY[0x263F16B18] vectorCount:v176 floatComponents:0 componentsPerVector:v103 bytesPerComponent:1 dataOffset:0 dataStride:v103];

  v182 = (void *)MEMORY[0x263F16AE0];
  id v8 = v203;
  v183 = [v203 baseGeometry];
  id v184 = v224;
  id v185 = v220;
  v22 = [v182 skinnerWithBaseGeometry:v183 bones:v224 boneInverseBindTransforms:v220 boneWeights:v177 boneIndices:v181];

  objc_msgSend(v8, "avt_simdBaseGeometryBindTransform");
  float32x4_t v215 = v186;
  float32x4_t v216 = v187;
  float32x4_t v217 = v188;
  float32x4_t v218 = v189;
  id v9 = v202;
  objc_msgSend(v202, "avt_simdBaseGeometryBindTransform");
  objc_msgSend(v22, "avt_setSimdBaseGeometryBindTransform:", *(double *)vmlaq_n_f32(vmulq_n_f32(v190, *(float *)&v205), v215, *(float *)&v219).i64, *(double *)vmlaq_n_f32(vmulq_n_f32(v191, *(float *)&v205), v216, *(float *)&v219).i64, *(double *)vmlaq_n_f32(vmulq_n_f32(v192, *(float *)&v205), v217, *(float *)&v219).i64, *(double *)vmlaq_n_f32(vmulq_n_f32(v193, *(float *)&v205), v218, *(float *)&v219).i64);
  id v12 = v221;
  [v22 setSkeleton:v221];

LABEL_10:
  return v22;
}

+ (void)avt_skinnerByInterpolatingFromSkinner:()AVTExtension toSkinner:factor:skeleton:.cold.1()
{
}

+ (void)avt_skinnerByInterpolatingFromSkinner:()AVTExtension toSkinner:factor:skeleton:.cold.2()
{
}

+ (void)avt_skinnerByInterpolatingFromSkinner:()AVTExtension toSkinner:factor:skeleton:.cold.9(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)avt_skinnerByInterpolatingFromSkinner:()AVTExtension toSkinner:factor:skeleton:.cold.10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)avt_skinnerByInterpolatingFromSkinner:()AVTExtension toSkinner:factor:skeleton:.cold.11(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end